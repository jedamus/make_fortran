! erzeugt Freitag, 07. August 2026 11:06 (C) 2026 von Leander Jedamus
! modifiziert Freitag, 07. August 2026 12:17 von Leander Jedamus
       
MODULE mod_math
  USE mod_kinds

  IMPLICIT NONE
  PRIVATE
  PUBLIC :: EPSILON, PI
  PUBLIC :: EQ, NEQ

  REAL(KIND=DBL) :: EPSILON = 1.0D-10
  REAL(KIND=DBL) :: PI = 4.0_DBL * ATAN(1.0_DBL)

  CONTAINS

  FUNCTION EQ(r1, r2) RESULT(gleich)
    REAL(KIND=DBL) :: r1, r2
    LOGICAL gleich

    gleich = (ABS(r1 - r2) <= EPSILON)
  END FUNCTION EQ

  FUNCTION NEQ(r1, r2) RESULT(nicht_gleich)
    REAL(KIND=DBL) :: r1, r2
    LOGICAL nicht_gleich

    nicht_gleich = .NOT. EQ(r1, r2)
  END FUNCTION NEQ
END MODULE mod_math
       
! vim:ai sw=4 expandtab

