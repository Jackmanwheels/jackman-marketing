# Convert a markdown file to .docx and .pdf next to it (same basename).
# Usage: powershell -NoProfile -ExecutionPolicy Bypass -File ship-doc.ps1 -Source "C:\path\file.md"
param([Parameter(Mandatory = $true)][string]$Source)

$ErrorActionPreference = "Stop"
$Source = (Resolve-Path -LiteralPath $Source).Path
$dir  = Split-Path $Source -Parent
$base = [IO.Path]::GetFileNameWithoutExtension($Source)
$docx = Join-Path $dir "$base.docx"
$pdf  = Join-Path $dir "$base.pdf"

# Build workspace outside OneDrive so node_modules never syncs.
$work = Join-Path $env:TEMP "shipdoc-work"
New-Item -ItemType Directory -Force $work | Out-Null
Copy-Item (Join-Path $PSScriptRoot "md2html.mjs") $work -Force
if (-not (Test-Path (Join-Path $work "node_modules\marked"))) {
    Push-Location $work
    try { npm install marked --silent --no-audit --no-fund | Out-Null } finally { Pop-Location }
}

$html = Join-Path $work "$base.html"
node (Join-Path $work "md2html.mjs") $Source $html
if ($LASTEXITCODE -ne 0) { throw "md2html failed" }

# Snapshot Word PIDs so we only ever touch the instance WE launch (Austin may have Word open).
$before = @(Get-Process WINWORD -ErrorAction SilentlyContinue | ForEach-Object { $_.Id })
$wd = New-Object -ComObject Word.Application
Start-Sleep -Milliseconds 800
$mine = @(Get-Process WINWORD -ErrorAction SilentlyContinue | Where-Object { $before -notcontains $_.Id } | ForEach-Object { $_.Id })
$wd.Visible = $false
$wd.DisplayAlerts = 0
try {
    $doc = $wd.Documents.Open($html, $false, $false)
    $ps = $doc.PageSetup
    $ps.PageWidth = 612; $ps.PageHeight = 792            # US Letter (HTML import defaults to Web Layout)
    $ps.TopMargin = 72; $ps.BottomMargin = 72; $ps.LeftMargin = 72; $ps.RightMargin = 72
    $doc.Sections(1).Footers(1).PageNumbers.Add(1) | Out-Null
    # The [string]/[int] casts are REQUIRED: Join-Path results are PSObject-wrapped and Word hangs on them.
    $doc.SaveAs2([string]$docx, [int]16)                 # wdFormatXMLDocument
    $doc.ExportAsFixedFormat([string]$pdf, [int]17)      # wdExportFormatPDF
    # Verify: real Word headings, so the navigation pane works.
    $heads = 0
    $n = $doc.Paragraphs.Count          # indexed loop: foreach over the COM collection hangs
    for ($i = 1; $i -le $n; $i++) { if ($doc.Paragraphs.Item($i).Style.NameLocal -like "Heading*") { $heads++ } }
    Write-Output "OK  $docx"
    Write-Output "OK  $pdf"
    Write-Output "headings=$heads"
    $doc.Close($false)
} finally {
    try { $wd.Quit() } catch {}
    Start-Sleep -Milliseconds 800
    # Backstop: only PIDs this script launched, and only if still alive.
    foreach ($id in $mine) { Get-Process -Id $id -ErrorAction SilentlyContinue | Stop-Process -Force }
}
