<#
brand_check.ps1 - mechanical brand-rule linter for Jackman copy.

Called by strategy Part 9, pre-flight item 9. Reads a file and reports every
rule it can check by pattern matching.

WHAT THIS IS NOT
This script is not the source of truth and must never become it. It catches only
the rules a regex can catch. The canonical rules live in:
  - 00 Marketing Command Center/06 Standards and Conventions/jackman-claude-instructions.md
  - 03 Content and Social/jackman-social-playbook-2026-09-14-v1.md  (Part 1, A-E)
  - 00 Marketing Command Center/06 Standards and Conventions/jackman-decisions-inbox.md
A clean run means "no mechanical violations found", never "this is on brand".
Judgment calls - pillar, job, sendability, tone, whether a claim is supportable -
are not checkable here. Use /social-review for those.

TWO LEVELS, AND THE DIFFERENCE MATTERS
  BLOCK  unambiguous. A regex cannot be wrong about "Gloss Black" or "J68".
  WARN   the word has legitimate other uses. Bare "bronze" might be the finish,
         or it might be the brand colour. Read it yourself.
Exit code 1 only if a BLOCK fires, so this is safe to gate on.

KNOWN LIMIT
It reads the whole file, including build notes and internal commentary. A rule
mentioned in a note about the rule will still be matched unless it is negated.

USAGE
  powershell -ExecutionPolicy Bypass -File scripts/brand_check.ps1 "path/to/copy.md"
#>

param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Path
)

$TM = [char]0x2122

# N   = suppress when the match sits inside a negation ("no load rating")
# Ctx = only fire when this also appears within 40 chars either side
$Rules = @(
    # --- BLOCK: a regex cannot be wrong about these ---------------------------
    @{ L = 'BLOCK'; R = 'G1'; P = '(?i)\bgloss black\b'; N = $true
       M = 'Not a finish. The three are Satin Black, Matte Bronze, Machined As-Cast.' }
    @{ L = 'BLOCK'; R = 'G1'; P = '(?i)\bflat black\b'; N = $true
       M = 'Not a finish. Use Satin Black.' }
    @{ L = 'BLOCK'; R = 'G2'; P = '\bJ-?68\b'; N = $true
       M = 'J68 is a filename only. Copy says Classic 68.' }
    @{ L = 'BLOCK'; R = 'G3'; P = '\bJ(?:6[0-7]|7[4-9]|[89][0-9])\b'; N = $true
       M = 'No such model. Only Classic 68 and J69-J73 exist.' }
    @{ L = 'BLOCK'; R = 'G4'; P = '\b(JWL|VIA|TUV)\b'; N = $true
       M = 'Certification claim. None are published.' }
    @{ L = 'BLOCK'; R = 'G6'; P = '(?i)\b\d+\s*(ft[\s-]?lbs?|lb[\s-]?ft|nm)\b'; N = $true
       M = "Torque value. Write 'torque to your vehicle manufacturer's specification'." }
    @{ L = 'BLOCK'; R = 'G12'; P = '(?i)\blifetime warranty\b(?!.{0,80}(see full terms|terms|limited))'; N = $true
       M = 'Unqualified warranty claim. Approved: "Limited lifetime structural warranty and a five-year finish warranty - see full terms", always linked.' }
    @{ L = 'BLOCK'; R = 'G16'; P = '(?i)\b(harry|sheryl)\b'; N = $true
       M = 'Founder first name. Consumer copy keeps the family unnamed. Internal, legal and fact-check documents may still name them.' }
    @{ L = 'BLOCK'; R = 'G15'; P = '(?i)\b(dominates?|dominating|conquers?|conquering|destroys?|annihilates?|tactical|weaponized)\b'; N = $true
       M = 'Militarized register. Prefer built, proven, holds up, keeps going.' }
    @{ L = 'BLOCK'; R = 'G10'; P = "(?i)\b(enhanced bead retention|fixed cap orientation|water relief channels)\s*$TM"; N = $true
       M = 'No trademark on this name. The three marks are Radial Flow Form, Reverse Draft Technology, Dual Vector Retention.' }
    @{ L = 'BLOCK'; R = 'G10'; P = '(?i)\bradial flow formed\b'; N = $true
       M = 'Never verb a mark. It is Radial Flow Form (R-FF).' }
    @{ L = 'BLOCK'; R = 'G10'; P = "(?i)\bEBR\s*$TM"; N = $true
       M = 'Never a mark on EBR.' }

    # --- WARN: the word has legitimate other uses -----------------------------
    @{ L = 'WARN'; R = 'G1'; P = '(?i)(?<!matte )(?<!jackman )(?<!jackman_)\bbronze\b'; N = $true
       M = "Bare 'Bronze'. The finish is Matte Bronze. (Ignore if this is the brand colour.)" }
    @{ L = 'WARN'; R = 'G1'; P = '(?i)(?<!satin )(?<!jackman )(?<!jackman_)\bblack\b'; N = $true
       M = "Bare 'Black'. The finish is Satin Black. (Ignore if this is a colour, not a finish.)" }
    @{ L = 'WARN'; R = 'G1'; P = '(?i)\bmachined\b(?!\s+as-cast)'; N = $true
       M = "Bare 'Machined'. The finish is Machined As-Cast." }
    @{ L = 'WARN'; R = 'G1'; P = '(?i)\b(copper|polished|chrome)\b'; N = $true
       M = 'Not a Jackman finish name.' }
    @{ L = 'WARN'; R = 'G4'; P = '(?i)\b(load (rating|capacity)|rated (to|for)|weight rating|max load)\b(?!.{0,45}pending engineering release)'; N = $true
       M = "Load claim. Spec cells read 'Load rating: pending engineering release'." }

    # Only a year in a founding context, or a decade. A bare 2026 is a date, not a claim.
    @{ L = 'WARN'; R = 'G5/D-01'; P = '\b1[89]\d{2}\b'; N = $true
       Ctx = '(?i)(founded|foundation|establish|since|est\.|origin|born|began|started|heritage)'
       M = "Founding-date claim. Governed by D-01 in the decisions inbox. While D-01 reads PROPOSED no founding decade or year ships - use 'California-born'. Once it reads PROPAGATED, 'Established 1968' / 'Est. 1968' is approved." }
    @{ L = 'WARN'; R = 'G5/D-01'; P = '(?i)\b(19\d0s|sixties|seventies)\b'; N = $true
       M = "Founding-decade claim. Governed by D-01 in the decisions inbox - see its Status before this ships." }

    @{ L = 'WARN'; R = 'G8'; P = '\b\d\s?x\s?1\d{2}(\.\d)?\b(?!\s*/)'; N = $true
       M = 'Bolt pattern without dual notation. Write both: 6x139.7 / 6x5.5 inch.' }
    @{ L = 'WARN'; R = 'G8'; P = '(?i)(?<![+-])\b\d{1,2}\s?mm offset\b'; N = $true
       M = 'Offset without a sign. Write +18mm - the sign is never optional.' }
    @{ L = 'WARN'; R = 'G11'; P = '(?i)@\s?(ford|jeep|chevy|chevrolet|gmc|ram|toyota|nissan|dodge)\b'; N = $true
       M = 'Never tag a vehicle manufacturer. Nominative use only, and any piece organized around a vehicle carries the not-affiliated disclaimer.' }
    @{ L = 'WARN'; R = 'G7'; P = '\b[A-Z]{2,4}-\d{3,}[A-Z0-9-]*\b'; N = $true
       M = 'Possible part number. Never construct one - transcribe from a source list or omit.' }
    @{ L = 'WARN'; R = 'G-price'; P = '\$\s?\d'; N = $true
       M = 'Price in copy. Never hardcode a price into a template.' }
)

if (-not (Test-Path -LiteralPath $Path)) {
    Write-Output "brand_check - file not found: $Path"
    exit 2
}

$text = Get-Content -LiteralPath $Path -Raw -Encoding UTF8
if ($null -eq $text) { $text = '' }

# A mention inside a negation is a rule being described, not broken.
$NegPattern = '(?i)\b(no|not|never|without|avoid|avoids|avoiding|zero)\b[^.!?]{0,35}$'

$findings = New-Object System.Collections.ArrayList

foreach ($rule in $Rules) {
    foreach ($m in [regex]::Matches($text, $rule.P)) {
        $before = $text.Substring([Math]::Max(0, $m.Index - 45), [Math]::Min(45, $m.Index))

        if ($rule.N -and ($before -match $NegPattern)) { continue }

        if ($rule.ContainsKey('Ctx')) {
            $s = [Math]::Max(0, $m.Index - 40)
            $len = [Math]::Min($text.Length - $s, $m.Length + 80)
            if (-not ($text.Substring($s, $len) -match $rule.Ctx)) { continue }
        }

        $line = ($text.Substring(0, $m.Index) -split "`n").Count
        [void]$findings.Add([pscustomobject]@{
            Level = $rule.L; Rule = $rule.R; Line = $line
            Hit = $m.Value.Trim(); Msg = $rule.M
        })
    }
}

# Hashtag count. Playbook 19.
$tags = [regex]::Matches($text, '#\w+\b(?![\w-])')
if ($tags.Count -gt 0 -and ($tags.Count -lt 5 -or $tags.Count -gt 10)) {
    [void]$findings.Add([pscustomobject]@{
        Level = 'WARN'; Rule = 'P19'; Line = 0
        Hit = "$($tags.Count) hashtags"
        Msg = 'Playbook 19 wants 5-10: two brand, two or three category, two or three culture tags matching the vehicle actually in frame.'
    })
}

# First line. Playbook 18.
$first = ($text -split "`n" | Where-Object { $_.Trim() -ne '' } | Select-Object -First 1)
if ($null -ne $first) {
    if ($first -match '(?i)^\s*(hi|hey|hello|welcome|introducing|check out|meet the)\b') {
        [void]$findings.Add([pscustomobject]@{
            Level = 'WARN'; Rule = 'P18'; Line = 1; Hit = $first.Trim()
            Msg = 'First line is a greeting. Make it a claim, a number, or a question.'
        })
    }
}

Write-Output "brand_check - $Path"
Write-Output ('=' * 72)

if ($findings.Count -eq 0) {
    Write-Output 'No mechanical violations found.'
    Write-Output ''
    Write-Output 'This is not a pass. Pillar, job, sendability and tone are not'
    Write-Output 'checkable here - run /social-review for those.'
    exit 0
}

$sorted = $findings | Sort-Object @{E = { $_.Level -ne 'BLOCK' } }, Line
foreach ($f in $sorted) {
    $loc = if ($f.Line -gt 0) { "line $($f.Line)" } else { 'document' }
    Write-Output ''
    Write-Output "[$($f.Level)] $($f.Rule)  $loc"
    Write-Output "  found: `"$($f.Hit)`""
    Write-Output "  $($f.Msg)"
}

$blocks = @($findings | Where-Object { $_.Level -eq 'BLOCK' }).Count
Write-Output ''
Write-Output ('=' * 72)
Write-Output "$blocks block, $($findings.Count - $blocks) warn"
Write-Output ''
Write-Output 'Mechanical check only. Pillar, job, sendability and tone still need'
Write-Output '/social-review, and the canonical rules win on any conflict.'

if ($blocks -gt 0) { exit 1 } else { exit 0 }
