! project.f90 
! erzeugt Donnerstag, 07. Mai 2026 08:29 (C) 2026 von Leander Jedamus
! modifiziert Donnerstag, 07. Mai 2026 08:29 von Leander Jedamus

MODULE project

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: greet

  CONTAINS

  SUBROUTINE greet

    IMPLICIT NONE

    WRITE(*,*) "make_fortran: V1.0 (C) 2026 by Leander Jedamus <ljedamus@web.de>"
    WRITE(*,*) "maintained by Maintainer <ljedamus@googlemail.com>"
    WRITE(*,*) 'published under license "MIT"'

  END SUBROUTINE greet

END MODULE project

! vim:set ai sw=2 expandtab

