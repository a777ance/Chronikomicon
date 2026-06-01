#!/usr/bin/env python3
"""
Downloads public domain Bible translations and formats them as super-text.
Format: BOOK CHAPTER:VERSE<tab>VerseText, one verse per line.

Run once locally, commit the output. Do not modify the output after committing.
"""

import requests
import os
import sys

OUTPUT_DIR = os.path.dirname(os.path.abspath(__file__))

# Standard 3-letter book abbreviations (Protestant canon, 66 books)
BOOK_NAMES = [
    "GEN", "EXO", "LEV", "NUM", "DEU", "JOS", "JDG", "RUT",
    "1SA", "2SA", "1KI", "2KI", "1CH", "2CH", "EZR", "NEH",
    "EST", "JOB", "PSA", "PRO", "ECC", "SNG", "ISA", "JER",
    "LAM", "EZK", "DAN", "HOS", "JOL", "AMO", "OBA", "JON",
    "MIC", "NAH", "HAB", "ZEP", "HAG", "ZEC", "MAL",
    "MAT", "MRK", "LUK", "JHN", "ACT", "ROM", "1CO", "2CO",
    "GAL", "EPH", "PHP", "COL", "1TH", "2TH", "1TI", "2TI",
    "TIT", "PHM", "HEB", "JAS", "1PE", "2PE", "1JN", "2JN",
    "3JN", "JUD", "REV"
]

# Sources: tab-separated format from scrollmapper/bible_databases
# Columns: book_index (1-based), chapter, verse, text
SOURCES = {
    "kjv": "https://raw.githubusercontent.com/scrollmapper/bible_databases/master/txt/t_kjv.txt",
    "asv": "https://raw.githubusercontent.com/scrollmapper/bible_databases/master/txt/t_asv.txt",
    "web": "https://raw.githubusercontent.com/scrollmapper/bible_databases/master/txt/t_web.txt",
}


def fetch(url):
    print(f"  Fetching {url}")
    r = requests.get(url, timeout=30)
    r.raise_for_status()
    return r.text


def convert(raw):
    lines = []
    for line in raw.strip().splitlines():
        line = line.strip()
        if not line or line.startswith("b"):
            continue  # skip header row
        parts = line.split("\t")
        if len(parts) < 4:
            continue
        try:
            book_idx = int(parts[0]) - 1
            chapter = int(parts[1])
            verse = int(parts[2])
            text = parts[3].strip()
        except (ValueError, IndexError):
            continue
        if book_idx < 0 or book_idx >= len(BOOK_NAMES):
            continue
        book = BOOK_NAMES[book_idx]
        lines.append(f"{book} {chapter}:{verse}\t{text}")
    return "\n".join(lines) + "\n"


def main():
    for name, url in SOURCES.items():
        out_path = os.path.join(OUTPUT_DIR, f"{name}.txt")
        if os.path.exists(out_path):
            print(f"  {name}.txt already exists, skipping.")
            continue
        print(f"Downloading {name.upper()}...")
        try:
            raw = fetch(url)
            formatted = convert(raw)
            with open(out_path, "w", encoding="utf-8") as f:
                f.write(formatted)
            verse_count = formatted.count("\n")
            print(f"  Written: {out_path} ({verse_count:,} verses)")
        except Exception as e:
            print(f"  ERROR: {e}", file=sys.stderr)


if __name__ == "__main__":
    main()
