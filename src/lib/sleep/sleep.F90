! erzeugt Samstag, 18. April 2026 08:43 (C) 2026 von Leander Jedamus
! modifiziert Samstag, 18. April 2026 08:44 von Leander Jedamus
       
MODULE sleep
#ifdef __linux__
  USE posix_usleep, ONLY: c_usleep
#endif
  IMPLICIT NONE
  PRIVATE

  PUBLIC :: sleep_ms

  CONTAINS

  SUBROUTINE sleep_ms(milliseconds)

    IMPLICIT NONE
    INTEGER, INTENT(IN) :: milliseconds
    INTEGER :: rc
  
#ifdef _WIN32
    CALL win32_sleep(milliseconds)
#else
    rc = c_usleep(milliseconds)
#endif

  END SUBROUTINE sleep_ms

END MODULE sleep
       
! vim:ai sw=4 expandtab

