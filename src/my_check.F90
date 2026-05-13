! erzeugt Mittwoch, 13. Mai 2026 13:14 (C) 2026 von Leander Jedamus
! modifiziert Mittwoch, 13. Mai 2026 13:16 von Leander Jedamus
       
MODULE my_check
  USE gettext
  IMPLICIT NONE
  PRIVATE

  PUBLIC :: check

  CONTAINS

  SUBROUTINE check()
    WRITE(*,*) _("Output from check")
  END SUBROUTINE check
END MODULE my_check
       
! vim:ai sw=4 expandtab

