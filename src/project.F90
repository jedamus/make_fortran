! project.F90 
! erzeugt Mittwoch, 13. Mai 2026 17:09 (C) 2026 von Leander Jedamus
! modifiziert Mittwoch, 13. Mai 2026 17:09 von Leander Jedamus

MODULE project

#define DOMAIN "make_fortran"
#include "gettext.h"

  USE mod_gettext

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: greet, my_project

  CHARACTER(len=*), PARAMETER :: my_project = "make_fortran"

  CONTAINS

  SUBROUTINE greet

    IMPLICIT NONE

    WRITE(*,('(A,1x,A,1X,A,1X,A,1X,A,1X,A)')) &
      "make_fortran:", "V1.0", "(C)", "2026", _("by"), "Leander Jedamus", &
      "<"//"ljedamus@web.de"//">"
    WRITE(*,'(A,1X,A,1X,A)') _("maintained by"), 'Maintainer', '<'//'ljedamus@googlemail.com'//'>'
    WRITE(*,'(A,1X,A)') _("published under license"), '"'//'MIT'//'"'

  END SUBROUTINE greet

END MODULE project

! vim:set ai sw=2 expandtab

