#!/usr/bin/env python
# coding=utf-8 -*- python -*-

# erzeugt Sonntag, 10. Mai 2026 20:48 (C) 2026 von Leander Jedamus
# modifiziert Dienstag, 12. Mai 2026 06:36 von Leander Jedamus
# modifiziert Montag, 11. Mai 2026 15:55 von Leander Jedamus
# modifiziert Sonntag, 10. Mai 2026 22:16 von Leander Jedamus

from __future__ import print_function

import os
import sys
import re
import separator as sep

faktor = 10

# path_sep = os.path.join(" ", "")[1]
# builddir = "build/linux"
# srcdir   = "src"

d  = {}
d2 = {}
d3 = {}
d4 = {}
# d:  for module uses modules
# d2: for module to path and filename
# d3: for module used from path and filename
# d4: for unresolved module from path and filename

debug = False
info  = False

def register(builddir, filnam, regexp, regexp2):
  builddir2 = os.path.join(builddir, "")
  # srcdir2 = os.path.join(srcdir, "")

  if debug:
    print('File:      "', filnam, '"', sep = '')
    # print('srcdir   = "', srcdir2, '"', sep = '')
    print('builddir = "', builddir2, '"', sep = '')

  lst = filnam.split(builddir2)
  if (len(lst) == 1):
    print('Error: "', lst[0], '" is not in "{p:s}"'.format(p = builddir), sep = '')
    return

  str = lst[1]
  if debug:
    print(str)

  base_str = os.path.basename(filnam)
  lst2 = base_str.rsplit('.',1)
  if (len(lst2) == 1):
    print('Error: "', base_str, '" has no suffix', sep = '')
    return

  base_str = lst2[-2]
  if debug:
    print(base_str)

  i = str.find('lib', 0, 3)
  if i == 0:
    if info:
      print('Module "', base_str, '" is in library', sep = '')

  try:
    d[base_str] = []
    d2[base_str] = filnam

    filename = filnam.rsplit('.',1)[-2] + ".t"
    with open(filename, 'r') as f:
      for zeile in f:
        zeile = zeile.strip()
        if debug:
          print(zeile)

        m2 = regexp2.match(zeile.lower())
        m = regexp.match(zeile.lower())

        treffer = False
        if (m2 != None):
          m = m2
          treffer = True
        else:
          if(m != None):
            treffer = True

        if treffer:
          s = m.expand('\g<1>')
          if debug:
            print('Treffer: "', s, '"', sep = '')
          if ((s == 'iso_c_binding') or (s == 'iso_fortran_env')):
            if info:
              print('Module "', s, '" in file "', filename, '" is from gfortran', sep = '')
          else:
            if s in d3:
              d3[s].append(filnam)
            else:
              d3[s] = [filnam]

            d[base_str].append(s)


  except FileNotFoundError:
    if debug:
      print('Error: File "', filename, '" not found', sep = '')

  if debug:
    print(sep.trenner(faktor))
    print(d)
    print(d2)
    print(d3)
    print(sep.trenner(faktor))

def main():
  
  if debug:
    print(sep.anfang(faktor))
  
  regexp = re.compile(r"\s*use\s*([^\s,!]+).*", re.I)
  regexp2 = re.compile(r"\s*use[, ]+intrinsic\s+::\s+([^\s,!]*).+", re.I)
  # m = regexp2.match("USE, INTRINSIC :: iso_c_binding, only: c_char, c_null_char, c_null_ptr, c_ptr, c_int, &".lower())
  # m = regexp.match("USE test, only: test2".lower())
  # print(m.expand(r"\g<1>"))

  if (len(sys.argv) < 4):
    print("usage: {argv:s} $(BUILDDIR) $(FILES.t)".format(argv=sys.argv[0]))
    return

  builddir = sys.argv[1]

  for i in range(2, len(sys.argv)):
    filename = sys.argv[i]
    if debug:
      print('Working on "{filename:s}"'.format(filename=filename))
    register(builddir, filename, regexp, regexp2)

  # register(builddir, "build/linux/sleep/sleep.t", regexp, regexp2)
  # register(builddir, "build/linux/sleep/sleep", regexp, regexp2)
  # register(builddir, "build/linux/lib/sleep/sleep.t", regexp, regexp2)
  # register(builddir, "build/linux/main.t", regexp, regexp2)

  if debug:
    print('d  =', d)
    print('d2 =', d2)
    print('d3 =', d3)
    print('d4 =', d4)
    print(sep.trenner(faktor))

    for key, val in d.items():
      print('{k:s} --> '.format(k = key), end = '')
      is_first = True
      for v in val:
        if not is_first:
          print(', ', end = '')
        else:
          is_first = False
        print('{v:s}'.format(v = v), end = '')
      print()
    print(sep.trenner(faktor))

    # return ##+##

  while (len(d) > 0):
    d5 = {}
    for key in d.keys():
      if debug:
        print('Key =', key)
      lst = d[key]
      if (len(lst) == 0):
        d_filnam = d2[key].rsplit('.',1)[-2] + '.d'
        if debug:
          print('Write key "', key, '" from "', d_filnam, '"', sep = '')
        print(d_filnam, ' ', sep = '', end = '')
        d5[key] = d[key]
        for key2 in d.keys():
          if key in d[key2]:
            d[key2].remove(key)

    for key in d5.keys():
      del d[key]

  print()

  if debug:
    print()
    print(sep.trenner(faktor))
    print(d)
    print(d2)
    print(d3)
    print(d4)
    print(d5)

  return ##+##

  if debug:
    print(sep.trenner(faktor))
    print(d4)
    print(sep.trenner(faktor))

  if len(d4) > 0:
    for key, val in d4.items():
      for s in val:
        print('Error: Module "', key, '" from file "', s, '" not found', sep = '')

  if debug:
    print(sep.ende(faktor))

if __name__ == "__main__":
  main()

# vim:ai sw=2 sts=4 expandtab

