! erzeugt Samstag, 18. April 2026 08:57 (C) 2026 von Leander Jedamus
! modifiziert Samstag, 18. April 2026 09:26 von Leander Jedamus
       
MODULE posix_usleep
  use, intrinsic :: iso_c_binding, ONLY: c_int, c_int32_t

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: c_usleep

  INTERFACE
   
    FUNCTION c_usleep(microseconds) BIND(C, name="usleep") RESULT(status)
    
      IMPORT :: c_int, c_int32_t
      IMPLICIT NONE
      INTEGER(c_int32_t), VALUE, INTENT(IN) :: microseconds
      INTEGER(c_int) :: status

    END FUNCTION c_usleep
  END INTERFACE
END MODULE posix_usleep
       
! vim:ai sw=4 expandtab

