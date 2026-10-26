"""Convert the Jackman vehicle fitment sheet (Excel) into theme/assets/jackman-fitment.json.

Expected sheet (first row = headers, names are case-insensitive):
  year_from | year_to | make | model | bolt_pattern | hub_bore_mm | offset_min | offset_max | diameters | notes

- bolt_pattern: metric or inch, e.g. 6x139.7 or 6x5.5 (the storefront normalises both).
- offset_min / offset_max / diameters / hub_bore_mm / notes are optional; leave blank to skip.
- diameters: comma-separated wheel diameters that clear the brakes, e.g. "17,18,20".

Usage:
  python3 excel_to_fitment_json.py "Jackman Vehicle Fitment.xlsx" [--sheet Vehicles] [--out ../theme/assets/jackman-fitment.json]
"""
import argparse
import json
import sys
from datetime import date
from pathlib import Path

import openpyxl

REQUIRED = ["year_from", "year_to", "make", "model", "bolt_pattern"]
OPTIONAL_NUM = ["hub_bore_mm", "offset_min", "offset_max"]


def to_num(value):
    if value is None or str(value).strip() == "":
        return None
    n = float(value)
    return int(n) if n.is_integer() else n


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("xlsx")
    ap.add_argument("--sheet", default=None, help="Sheet name (default: first sheet)")
    ap.add_argument("--out", default=str(Path(__file__).resolve().parent.parent / "theme" / "assets" / "jackman-fitment.json"))
    args = ap.parse_args()

    wb = openpyxl.load_workbook(args.xlsx, data_only=True, read_only=True)
    ws = wb[args.sheet] if args.sheet else wb.worksheets[0]
    rows = ws.iter_rows(values_only=True)
    headers = [str(h or "").strip().lower().replace(" ", "_") for h in next(rows)]
    missing = [c for c in REQUIRED if c not in headers]
    if missing:
        sys.exit(f"Missing column(s): {', '.join(missing)}. Found: {headers}")

    vehicles, problems = [], []
    for line, row in enumerate(rows, start=2):
        rec = dict(zip(headers, row))
        if all(rec.get(c) in (None, "") for c in REQUIRED):
            continue  # blank row
        try:
            v = {
                "year_from": int(rec["year_from"]),
                "year_to": int(rec["year_to"]),
                "make": str(rec["make"]).strip(),
                "model": str(rec["model"]).strip(),
                "bolt_pattern": str(rec["bolt_pattern"]).strip().lower().replace(" ", ""),
            }
            for c in OPTIONAL_NUM:
                n = to_num(rec.get(c))
                if n is not None:
                    v[c] = n
            if rec.get("diameters") not in (None, ""):
                v["diameters"] = [int(float(d)) for d in str(rec["diameters"]).split(",") if d.strip()]
            if rec.get("notes"):
                v["notes"] = str(rec["notes"]).strip()
            if v["year_from"] > v["year_to"]:
                raise ValueError("year_from is after year_to")
            vehicles.append(v)
        except (TypeError, ValueError) as e:
            problems.append(f"row {line}: {e}")

    if problems:
        sys.exit("Fix these rows first:\n  " + "\n  ".join(problems))

    vehicles.sort(key=lambda v: (v["make"], v["model"], v["year_from"]))
    out = {"updated": date.today().isoformat(), "vehicles": vehicles}
    Path(args.out).write_text(json.dumps(out, indent=1) + "\n")
    print(f"Wrote {len(vehicles)} vehicles to {args.out}")


if __name__ == "__main__":
    main()
