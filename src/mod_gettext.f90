! erzeugt Donnerstag, 07. Mai 2026 15:20 (C) 2026 von Leander Jedamus
! modifiziert Donnerstag, 07. Mai 2026 17:02 von Leander Jedamus
       
MODULE mod_gettext

  USE, INTRINSIC :: iso_c_binding, only: c_char, c_null_char, c_null_ptr, c_ptr, c_int, &
    c_associated

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: bindtextdomain, textdomain, gettext, ngettext

  INTERFACE

    ! bindtextdomain(domainname, dirname)
    FUNCTION c_bindtextdomain(domainname, dirname) BIND(C, name="bindtextdomain")
      IMPORT :: c_char, c_ptr
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(in) :: domainname, dirname
      TYPE(c_ptr) :: c_bindtextdomain
    END FUNCTION c_bindtextdomain

    ! textdomain(domainname)
    FUNCTION c_textdomain(domainname) BIND(C, name="textdomain")
        IMPORT :: c_char, c_ptr
        CHARACTER(kind=c_char), DIMENSION(*), INTENT(in) :: domainname
        TYPE(c_ptr) :: c_textdomain
    END FUNCTION c_textdomain

    ! gettext(msgid)
    FUNCTION c_gettext(msgid) BIND(C, name="gettext")
      IMPORT :: c_char, c_ptr
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(in) :: msgid
      TYPE(c_ptr) :: c_gettext
    END FUNCTION c_gettext

    ! ngettext(msgid, msgid_plural, n)
    FUNCTION c_ngettext(msgid, msgid_plural, n) BIND(C, name="ngettext")
      IMPORT :: c_char, c_ptr, c_int
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(in) :: msgid, msgid_plural
      INTEGER(c_int), VALUE, INTENT(in) :: n
      TYPE(c_ptr) :: c_ngettext
    END FUNCTION c_ngettext

    SUBROUTINE string_from_c(c_str, f_str, max_len) BIND(C, name="string_from_c")
      IMPORT :: c_ptr, c_char, c_int
      TYPE(c_ptr), VALUE :: c_str
      CHARACTER(KIND=c_char), INTENT(out) :: f_str(*)
      INTEGER(c_int) :: max_len
    END SUBROUTINE string_from_c

  END INTERFACE

  CONTAINS

    SUBROUTINE bindtextdomain(domain, dir)
      CHARACTER(len=*), INTENT(in) :: domain, dir
      TYPE(c_ptr) :: dummy
      dummy = c_bindtextdomain(domain // c_null_char, dir // c_null_char)
    END SUBROUTINE bindtextdomain

    SUBROUTINE textdomain(domain)
      CHARACTER(len=*), INTENT(in) :: domain
      TYPE(c_ptr) :: dummy
      dummy = c_textdomain(domain // c_null_char)
    END SUBROUTINE textdomain

    FUNCTION gettext(msgid) RESULT(translation)
      CHARACTER(len=*), INTENT(in) :: msgid
      CHARACTER(len=:), ALLOCATABLE :: translation
      TYPE(c_ptr) :: c_result
      CHARACTER(KIND=c_char), ALLOCATABLE :: temp(:)
      INTEGER :: i, length, maxlen
      c_result = c_gettext(msgid // c_null_char)
      if ( .not. c_associated(c_result)) THEN
        translation = msgid
        return
      end if

      maxlen = 4096
      ALLOCATE(temp(maxlen))
      CALL string_from_c (c_result, temp, maxlen)
      length = 0
      DO i = 1, maxlen
        IF (temp(i) == c_null_char) EXIT
        length = length + 1
      END DO

      ALLOCATE(CHARACTER(len=length) :: translation)
      DO i = 1, length
        translation(i:i) = temp(i)
      END DO
      DEALLOCATE(temp)
    END FUNCTION gettext

    FUNCTION ngettext(msgid, msgid_plural, n) RESULT(translation)
      CHARACTER(len=*), INTENT(in) :: msgid, msgid_plural
      INTEGER, INTENT(in) :: n
      CHARACTER(len=:), ALLOCATABLE :: translation
      TYPE(c_ptr) :: c_result
      CHARACTER(kind=c_char), ALLOCATABLE :: temp(:)
      INTEGER :: i, length, maxlen

      c_result = c_ngettext(msgid // c_null_char, msgid_plural // c_null_char, int(n, c_int))
      IF (.not. c_associated(c_result)) THEN
        translation = msgid
        RETURN
      END IF

      maxlen = 4096
      ALLOCATE(temp(maxlen))
      CALL string_from_c(c_result, temp, maxlen)
      length = 0
      DO i = 1, maxlen
        IF (temp(i) == c_null_char) EXIT
        length = length + 1
      END DO

      ALLOCATE(CHARACTER(len=length) :: translation)
      DO i = 1, length
        translation(i:i) = temp(i)
      END DO
      DEALLOCATE(temp)
    END FUNCTION ngettext

END MODULE mod_gettext
       
! vim:ai sw=4 expandtab

