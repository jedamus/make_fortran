! erzeugt Freitag, 03. Juli 2026 14:15 (C) 2026 von Leander Jedamus
! modifiziert Freitag, 03. Juli 2026 16:44 von Leander Jedamus
       
MODULE mod_getlocaledir

  USE, INTRINSIC :: iso_c_binding, ONLY: c_ptr, c_char, c_null_char, c_int, c_long

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: getlocaledir

  INTERFACE

    SUBROUTINE fortran_getlocaledir(arg,myresult, max_len) BIND(C, NAME="fortran_getlocaledir")
      IMPORT :: c_char, c_int
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(IN) :: arg
      CHARACTER(KIND=c_char), DIMENSION(*), INTENT(OUT) :: myresult
      INTEGER(KIND=c_int), VALUE, INTENT(IN) :: max_len
    END SUBROUTINE

  END INTERFACE

  CONTAINS

    FUNCTION getlocaledir(arg) RESULT(pfad)
      CHARACTER(len=*), INTENT(IN) :: arg
      CHARACTER(len=:), ALLOCATABLE :: pfad
      INTEGER, PARAMETER :: maxlen = 4096
      CHARACTER(KIND=c_char,LEN=1) :: c_arg(len(arg) + 1)
      CHARACTER(KIND=c_char,LEN=1) :: buffer(maxlen)
      INTEGER :: i, length
      
      DO i = 1, len(arg)
        c_arg(i) = arg(i:i)
      END DO
      c_arg(len(arg) + 1) = c_null_char

      CALL fortran_getlocaledir(c_arg, buffer, int(maxlen, c_int))

      length = 0
      DO i = 1, maxlen
        IF (buffer(i) == c_null_char) EXIT
        length = length + 1
      END DO

      ALLOCATE(pfad, source=repeat(' ', length))
      DO i = 1, length
        pfad(i:i) = buffer(i)
      END DO
    END FUNCTION getlocaledir

END MODULE mod_getlocaledir
       
! vim:ai sw=4 expandtab

