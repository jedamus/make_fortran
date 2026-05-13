! erzeugt Mittwoch, 13. Mai 2026 09:41 (C) 2026 von Leander Jedamus
! modifiziert Mittwoch, 13. Mai 2026 09:41 von Leander Jedamus

#define DOMAIN "make_fortran_libsleep"
       
MODULE my_register_libsleep
  USE mod_gettext

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: register_lib_sleep

  CONTAINS

  SUBROUTINE register_lib_sleep(pfad)
    IMPLICIT NONE
    CHARACTER(len=*), INTENT(IN) :: pfad

    CALL bindtextdomain(DOMAIN, pfad)
  END SUBROUTINE register_lib_sleep

END MODULE my_register_libsleep
       
! vim:ai sw=4 expandtab

