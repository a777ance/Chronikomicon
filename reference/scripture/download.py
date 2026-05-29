#!/usr/bin/env python3
"""
Downloads public domain Bible translations and formats them as super-text.
Format: BOOK CHAPTER:VERSE<tab>VerseText, one verse per line.

Run once locally, commit the output. Do not modify the output after committing.
"""

import requests
import json
import os
import sys

OUTPUT_DIR = os.path.dirname(os.path.abspath(__file__))

# Mapping from thiagobodruk/bible abbreviations to standard 3-letter codes
ABBREV_MAP = {
    "gn": "GEN", "ex": "EXO", "lv": "LEV", "nm": "NUM", "dt": "DEU",
    "js": "JOS", "jud": "JDG", "rt": "RUT", "1sm": "1SA", "2sm": "2SA",
    "1kgs": "1KI", "2kgs": "2KI", "1ch": "1CH", "2ch": "2CH", "ezr": "EZR",
    "ne": "NEH", "et": "EST", "jb": "JOB", "ps": "PSA", "prv": "PRO",
    "ec": "ECC", "so": "SNG", "is": "ISA", "jr": "JER", "lm": "LAM",
    "ez": "EZK", "dn": "DAN", "ho": "HOS", "jl": "JOL", "am": "AMO",
    "ob": "OBA", "jn": "JON", "mi": "MIC", "na": "NAH", "hk": "HAB",
    "zp": "ZEP", "hg": "HAG", "zc": "ZEC", "ml": "MAL",
    "mt": "MAT", "mk": "MRK", "lk": "LUK", "jo": "JHN", "act": "ACT",
    "rm": "ROM", "1co": "1CO", "2co": "2CO", "gl": "GAL", "eph": "EPH",
    "ph": "PHP", "cl": "COL", "1ts": "1TH", "2ts": "2TH", "1tm": "1TI",
    "2tm": "2TI", "tt": "TIT", "phm": "PHM", "hb": "HEB", "jm": "JAS",
    "1pe": "1PE", "2pe": "2PE", "1jo": "1JN", "2jo": "2JN", "3jo": "3JN",
    "jd": "JUD", "rv": "REV"
}

# KJV is the primary reference (Sola Scriptura).
# ASV and WEB can be added later if a reliable source is found.
SOURCES = {
    "kjv": "https://raw.githubusercontent.com/thiagobodruk/bible/master/json/en_kjv.json",
}


def fetch(url):
    print(f"  Fetching {url}")
    r = requests.get(url, timeout=60)
    r.raise_for_status()
    # Decode with utf-8-sig to silently strip the UTF-8 BOM if present
    text = r.content.decode("utf-8-sig")
    return json.loads(text)


def convert(data):
    lines = []
    for book in data:
        abbrev = book.get("abbrev", "").lower()
        std = ABBREV_MAP.get(abbrev)
        if not std:
            print(f"  Warning: unknown abbreviation '{abbrev}', skipping")
            continue
        for ch_idx, chapter in enumerate(book.get("chapters", []), 1):
            for v_idx, verse in enumerate(chapter, 1):
                text = verse.strip()
                if text:
                    lines.append(f"{std} {ch_idx}:{v_idx}\t{text}")
    return "\n".join(lines) + "\n"


def main():
    for name, url in SOURCES.items():
        out_path = os.path.join(OUTPUT_DIR, f"{name}.txt")
        if os.path.exists(out_path):
            print(f"  {name}.txt already exists, skipping.")
            continue
        print(f"Downloading {name.upper()}...")
        try:
            data = fetch(url)
            formatted = convert(data)
            with open(out_path, "w", encoding="utf-8") as f:
                f.write(formatted)
            verse_count = formatted.count("\n")
            print(f"  Done: {out_path} ({verse_count:,} verses)")
        except Exception as e:
            print(f"  ERROR: {e}", file=sys.stderr)


if __name__ == "__main__":
    main()
