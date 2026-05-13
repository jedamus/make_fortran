! erzeugt Donnerstag, 07. Mai 2026 15:20 (C) 2026 von Leander Jedamus
! modifiziert Mittwoch, 13. Mai 2026 06:20 von Leander Jedamus
! modifiziert Dienstag, 12. Mai 2026 16:00 von Leander Jedamus
! modifiziert Donnerstag, 07. Mai 2026 17:02 von Leander Jedamus
       
MODULE mod_gettext

  USE, INTRINSIC :: iso_c_binding, ONLY: c_char, c_null_char, c_int, c_long

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: bindtextdomain, textdomain, gettext, ngettext, dgettext, dngettext, setlocale

  INTERFACE

    SUBROUTINE fortran_setlocale() BIND(C, name="fortran_setlocale")
    END SUBROUTINE fortran_setlocale

    ! bindtextdomain(domainname, dirname)
    SUBROUTINE fortran_bindtextdomain(domain, dir) BIND(C, name="fortran_bindtextdomain")
      IMPORT :: c_char
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(IN) :: domain, dir
    END SUBROUTINE fortran_bindtextdomain

    ! textdomain(domainname)
    SUBROUTINE fortran_textdomain(domain) BIND(C, name="fortran_textdomain")
        IMPORT :: c_char
        CHARACTER(kind=c_char), DIMENSION(*), INTENT(IN) :: domain
    END SUBROUTINE fortran_textdomain

    ! gettext(msgid)
    SUBROUTINE fortran_gettext(msgid, myresult, max_len) BIND(C, name="fortran_gettext")
      IMPORT :: c_char, c_int
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(IN) :: msgid
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(OUT) :: myresult
      INTEGER(KIND=c_int), VALUE, INTENT(IN) :: max_len
    END SUBROUTINE fortran_gettext

    ! ngettext(msgid, msgid_plural, n)
    SUBROUTINE fortran_ngettext(msgid, msgid_plural, n, myresult, max_len) BIND(C, name="fortran_ngettext")
      IMPORT :: c_char, c_int, c_long
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(IN) :: msgid, msgid_plural
      INTEGER(KIND=c_long), VALUE, INTENT(IN) :: n
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(OUT) :: myresult
      INTEGER(KIND=c_int), VALUE, INTENT(IN) :: max_len
    END SUBROUTINE fortran_ngettext

    ! dtext(domain, msgid)
    SUBROUTINE fortran_dgettext(domain, msgid, myresult, max_len) BIND(C, name="fortran_dgettext")
      IMPORT :: c_char, c_int
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(IN) :: domain, msgid
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(OUT) :: myresult
      INTEGER(KIND=c_int), VALUE, INTENT(IN) :: max_len
    END SUBROUTINE fortran_dgettext

    SUBROUTINE fortran_dngettext(domain, msgid, msgid_plural, n, myresult, max_len) BIND(C, name="fortran_dngettext")
      IMPORT :: c_char, c_int, c_long
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(IN) :: domain, msgid, msgid_plural
      INTEGER(KIND=c_long), VALUE, INTENT(IN) :: n
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(OUT) :: myresult
      INTEGER(KIND=c_int), VALUE, INTENT(IN) :: max_len
    END SUBROUTINE fortran_dngettext

  END INTERFACE

  CONTAINS

    SUBROUTINE setlocale()
      CALL fortran_setlocale()
    END SUBROUTINE setlocale

!    FUNCTION string_to_c(fortran_string) RESULT(c_array)
!      CHARACTER(LEN=*), INTENT(IN) :: fortran_string
!      CHARACTER(KIND=c_char, LEN=1), ALLOCATABLE :: c_array(:)
!      INTEGER :: i, n
!
!      n = len(fortran_string)
!      ALLOCATE(c_array(n+1))
!      DO i = 1, n
!        c_array(i) = fortran_string(i:i)
!      END DO
!      c_array(n+1) = c_null_char
!    END FUNCTION string_to_c

    SUBROUTINE bindtextdomain(domain, dir)
      CHARACTER(LEN=*), INTENT(IN) :: domain, dir

      CHARACTER(KIND=c_char, LEN=1) :: c_domain(len(domain) + 1)
      CHARACTER(KIND=c_char, LEN=1) :: c_dir(len(dir) + 1)
      INTEGER :: i

      DO i = 1, len(domain)
        c_domain(i) = domain(i:i)
      END DO
      c_domain(len(domain) + 1) = c_null_char

      DO i = 1, len(dir)
        c_dir(i) = dir(i:i)
      END DO
      c_dir(len(dir) + 1) = c_null_char

      CALL fortran_bindtextdomain(c_domain, c_dir)
    END SUBROUTINE bindtextdomain

    SUBROUTINE textdomain(domain)
      CHARACTER(len=*), INTENT(IN) :: domain

      CHARACTER(KIND=c_char, LEN=1) :: c_domain(len(domain) + 1)
      INTEGER :: i

      DO i = 1, len(domain)
        c_domain(i) = domain(i:i)
      END DO
      c_domain(len(domain) + 1) = c_null_char

      call fortran_textdomain(c_domain)
    END SUBROUTINE textdomain

    FUNCTION gettext(msgid) RESULT(translation)
      CHARACTER(len=*), INTENT(IN) :: msgid
      CHARACTER(len=:), ALLOCATABLE :: translation
      INTEGER, PARAMETER :: maxlen = 4096
      CHARACTER(KIND=c_char,LEN=1) :: c_msgid(len(msgid) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: buffer(maxlen)
      INTEGER :: i, length

      DO i = 1, len(msgid)
        c_msgid(i) = msgid(i:i)
      END DO
      c_msgid(len(msgid) + 1) = c_null_char

      CALL fortran_gettext(c_msgid, buffer, int(maxlen, c_int))

      length = 0
      DO i = 1, maxlen
        IF (buffer(i) == c_null_char) EXIT
        length = length + 1
      END DO

      ALLOCATE(translation, source=repeat(' ', length))
      DO i = 1, length
        translation(i:i) = buffer(i)
      END DO
    END FUNCTION gettext

    FUNCTION ngettext(msgid, msgid_plural, n) RESULT(translation)
      CHARACTER(len=*), INTENT(IN) :: msgid, msgid_plural
      INTEGER, INTENT(IN) :: n
      CHARACTER(len=:), ALLOCATABLE :: translation
      INTEGER, PARAMETER :: maxlen = 4096
      CHARACTER(KIND=c_char,LEN=1) :: c_msgid(len(msgid) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: c_plural(len(msgid_plural) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: buffer(maxlen)
      INTEGER :: i, length

      DO i = 1, len(msgid)
        c_msgid(i) = msgid(I:I)
      END DO
      c_msgid(len(msgid) + 1) = c_null_char

      DO i = 1, len(msgid_plural)
        c_plural(i) = msgid_plural(i:i)
      END DO
      c_plural(len(msgid_plural) + 1) = c_null_char

      CALL fortran_ngettext(c_msgid, c_plural, &
             int(n, c_long), buffer, int(maxlen, c_int))

      length = 0
      DO i = 1, maxlen
        IF (buffer(i) == c_null_char) EXIT
        length = length + 1
      END DO

      ALLOCATE(translation, source=repeat(' ', length))
      DO i = 1, length
        translation(i:i) = buffer(i)
      END DO
    END FUNCTION ngettext

    FUNCTION dgettext(domain, msgid) RESULT(translation)
      CHARACTER(len=*), INTENT(IN) :: domain, msgid
      CHARACTER(len=:), ALLOCATABLE :: translation
      INTEGER, PARAMETER :: maxlen = 4096
      CHARACTER(KIND=c_char,LEN=1) :: c_domain(len(domain) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: c_msgid(len(msgid) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: buffer(maxlen)
      INTEGER :: i, length

      DO i = 1, len(domain)
        c_domain(i) = domain(i:i)
      END DO
      c_domain(len(domain) + 1) = c_null_char

      DO i = 1, len(msgid)
        c_msgid(i) = msgid(i:i)
      END DO
      c_msgid(len(msgid) + 1) = c_null_char

      CALL fortran_dgettext(c_domain, c_msgid, buffer, int(maxlen, c_int))

      length = 0
      DO i = 1, maxlen
        IF (buffer(i) == c_null_char) EXIT
        length = length + 1
      END DO

      ALLOCATE(translation, source=repeat(' ', length))
      DO i = 1, length
        translation(i:i) = buffer(i)
      END DO
    END FUNCTION dgettext

    FUNCTION dngettext(domain, msgid, msgid_plural, n) RESULT(translation)
      CHARACTER(len=*), INTENT(IN) :: domain, msgid, msgid_plural
      INTEGER, INTENT(IN) :: n
      CHARACTER(len=:), ALLOCATABLE :: translation
      INTEGER, PARAMETER :: maxlen = 4096
      CHARACTER(KIND=c_char,LEN=1) :: c_domain(len(domain) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: c_msgid(len(msgid) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: c_plural(len(msgid_plural) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: buffer(maxlen)
      INTEGER :: i, length

      DO i = 1, len(domain)
        c_domain(i) = domain(i:i)
      END DO
      c_domain(len(domain) + 1) = c_null_char

      DO i = 1, len(msgid)
        c_msgid(i) = msgid(I:I)
      END DO
      c_msgid(len(msgid) + 1) = c_null_char

      DO i = 1, len(msgid_plural)
        c_plural(i) = msgid_plural(i:i)
      END DO
      c_plural(len(msgid_plural) + 1) = c_null_char

      CALL fortran_dngettext(c_domain, c_msgid, c_plural, &
             int(n, c_long), buffer, int(maxlen, c_int))

      length = 0
      DO i = 1, maxlen
        IF (buffer(i) == c_null_char) EXIT
        length = length + 1
      END DO

      ALLOCATE(translation, source=repeat(' ', length))
      DO i = 1, length
        translation(i:i) = buffer(i)
      END DO
    END FUNCTION dngettext

END MODULE mod_gettext
       
! vim:ai sw=4 expandtab

