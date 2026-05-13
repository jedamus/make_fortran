#!/usr/bin/env sh

# erzeugt Montag, 14. August 2023 07:05 (C) 2023 von Leander Jedamus
# modifiziert Dienstag, 12. Mai 2026 13:58 von Leander Jedamus

# set -x

translate.pl --file src/my_check.F90 --file src/main.F90 --project=make_fortran --version=$(cat version.txt)
translate.pl --file src/lib/output/check.F90 --project=make_fortran_liboutput --version=$(cat version.txt)

# vim:ai sw=2

