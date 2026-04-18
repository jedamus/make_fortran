! erzeugt Samstag, 18. April 2026 00:35 (C) 2026 von Leander Jedamus
! modifiziert Samstag, 18. April 2026 00:43 von Leander Jedamus
       
MODULE mod_platform
  IMPLICIT NONE
  PRIVATE

  PUBLIC :: PATH_SEP             ! Pfadtrenner
  PUBLIC :: OS_NAME              ! Name des Betriebsystems
  PUBLIC :: get_os_name          ! Funktion, die OS_NAME zurückgibt

  CHARACTER(LEN=*), PARAMETER :: PATH_SEP = &
#ifdef _WIN32
    '\'
#else
    '/'
#endif

  CHARACTER(LEN=*), PARAMETER :: OS_NAME = &
#ifdef __WIN32
    'Windows'
#elif defined(__linux__)
    'Linux'
#elif defined(__APPLE__)
    'macOS'
#else
    'unknown'
#endif

  CONTAINS

  PURE FUNCTION get_os_name() RESULT(name)
    CHARACTER(len=:), ALLOCATABLE :: name
    name = OS_NAME
  END FUNCTION get_os_name

END MODULE mod_platform
       
! vim:ai sw=4 expandtab

