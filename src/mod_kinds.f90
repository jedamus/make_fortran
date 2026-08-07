! erzeugt Freitag, 07. August 2026 10:29 (C) 2026 von Leander Jedamus
! modifiziert Freitag, 07. August 2026 10:32 von Leander Jedamus
       
MODULE mod_kinds
  IMPLICIT NONE
  PRIVATE

  PUBLIC :: SGL
  PUBLIC :: DBL

  INTEGER, PARAMETER :: SGL = SELECTED_REAL_KIND(p=6, r=37)
  INTEGER, PARAMETER :: DBL = SELECTED_REAL_KIND(p=15, r=307)

END MODULE mod_kinds
       
! vim:ai sw=4 expandtab

