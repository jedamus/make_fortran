! erzeugt Samstag, 18. April 2026 07:04 (C) 2026 von Leander Jedamus
! modifiziert Donnerstag, 07. Mai 2026 06:50 von Leander Jedamus
! modifiziert Samstag, 18. April 2026 09:17 von Leander Jedamus
       
PROGRAM main

  USE project
  USE compiler_flags
  use mod_platform
  use sleep

  IMPLICIT NONE

  CALL greet
  WRITE(*,*) ""

  CALL print_compiler_flags

  WRITE(*,*) ""

  WRITE(*,*) "Betriebssystem : ", get_os_name()
  WRITE(*,*) "Pfadtrenner    : '", PATH_SEP, "'"

  CALL sleep_ms(500000)

END PROGRAM main
       
! vim:ai sw=4 expandtab

