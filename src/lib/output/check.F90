! erzeugt Dienstag, 12. Mai 2026 11:07 (C) 2026 von Leander Jedamus
! modifiziert Dienstag, 12. Mai 2026 11:07 von Leander Jedamus
       
#define DOMAIN "make_fortran_liboutput"
#ifdef IS_LIB
#define _(msgid) dgettext (DOMAIN, msgid)
#else
#define _(msgid) gettext (msgid)
#endif
       
MODULE check
  USE mod_gettext

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: my_check

  CONTAINS

  SUBROUTINE my_check()
    IMPLICIT NONE

    WRITE(*,*) _("Hello from check")
  END SUBROUTINE my_check

END MODULE check
       
! vim:ai sw=4 expandtab

