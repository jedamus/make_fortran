#!/usr/bin/env python
# coding=utf-8 -*- python -*-

# erzeugt Sonntag, 10. Mai 2026 20:49 (C) 2026 von Leander Jedamus
# modifiziert Sonntag, 10. Mai 2026 20:56 von Leander Jedamus

from __future__ import print_function

import sys

__version__ = "1.0"

__all__ =[
  "anfang",
  "trenner",
  "ende",
  ]

def get_int(faktor):
  if not isinstance(faktor, int):
    ergebnis = int(faktor)
  else:
    ergebnis = faktor
  if sys.platform == "ios":
    ergebnis //= 2
  return ergebnis

def anfang(faktor):
  return "----8<" * get_int(faktor) + "----"

def trenner(faktor):
  return "------" * get_int(faktor) + "----"

def ende(faktor):
  return "---->8" * get_int(faktor) + "----"

if __name__ == "__main__":
  faktor = 10

  print(anfang(faktor))
  print(trenner(faktor))
  print(ende(faktor))

# vim:ai sw=2 sts=4 expandtab

