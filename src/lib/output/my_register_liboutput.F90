! erzeugt Mittwoch, 13. Mai 2026 09:41 (C) 2026 von Leander Jedamus
! modifiziert Mittwoch, 13. Mai 2026 09:41 von Leander Jedamus

#define DOMAIN "make_fortran_liboutput"
       
MODULE my_register_liboutput
  USE mod_gettext

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: register_lib_output

  CONTAINS

  SUBROUTINE register_lib_output(pfad)
    IMPLICIT NONE
    CHARACTER(len=*), INTENT(IN) :: pfad

    CALL bindtextdomain(DOMAIN, pfad)
  END SUBROUTINE register_lib_output

END MODULE my_register_liboutput
       
! vim:ai sw=4 expandtab

