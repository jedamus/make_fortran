#!/usr/bin/env sh

# erzeugt Montag, 14. August 2023 07:05 (C) 2023 von Leander Jedamus
# modifiziert Donnerstag, 22. Februar 2024 08:48 von Leander Jedamus
# modifiziert Freitag, 16. Februar 2024 12:55 von Leander Jedamus
# modifiziert Montag, 14. August 2023 08:16 von Leander Jedamus

# set -x

translate.pl --file=main.c --project=$(cat project.txt) --version=$(cat version.txt)

# vim:ai sw=2

