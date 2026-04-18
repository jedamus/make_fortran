! erzeugt Samstag, 18. April 2026 06:54 (C) 2026 von Leander Jedamus
! modifiziert Samstag, 18. April 2026 06:54 von Leander Jedamus
       
MODULE compiler_flags
  IMPLICIT NONE
  PRIVATE

  PUBLIC :: print_compiler_flags ! 

  CONTAINS

  SUBROUTINE print_compiler_flags()

  WRITE(*,*) "Compiler Flags:"

#ifdef __i386__
    WRITE(*,*) "__i386__:", __i386__
#endif

#ifdef __aarch64__
    WRITE(*,*) "__aarch64__:", __aarch64__
#endif

#ifdef __x86_64__
    WRITE(*,*) "__x86_64__:", __x86_64__
#endif

#ifdef __linux__
    WRITE(*,*) "__linux__:", __linux__
#endif

#ifdef __gnu_linux__
    WRITE(*,*) "__gnu_linux__:", __gnu_linux__
#endif

#ifdef __unix__
    WRITE(*,*) "__unix__:", __unix__
#endif

#ifdef _AIX
    WRITE(*,*) "_AIX:", _AIX
#endif

#ifdef __sun
    WRITE(*,*) "__sun:", __sun
#endif

#ifdef __FreeBSD__
    WRITE(*,*) "__FreeBSD__:", __FreeBSD__
#endif

#ifdef __GFORTRAN__
    WRITE(*,*) "__GFORTRAN__:", __GFORTRAN__
#endif

#ifdef __VERSION__
    WRITE(*,*) "__VERSION__:", __VERSION__
#endif

#ifdef __INTEL_COMPILER
    WRITE(*,*) "__INTEL_COMPILER", __INTEL_COMPILER
#endif

#ifdef __INTEL_LLVM_COMPILER
    WRITE(*,*) "__INTEL_LLVM_COMPILER", __INTEL_LLVM_COMPILER
#endif

#ifdef __NAG_COMPILER
    WRITE(*,*) "__NAG_COMPILER", __NAG_COMPILER
#endif

#ifdef __PGI
    WRITE(*,*) "__PGI", __PGI
#endif

#ifdef __NVCOMPILER
    WRITE(*,*) "__NVCOMPILER", __NVCOMPILER
#endif

#ifdef __FLANG
    WRITE(*,*) "__FLANG", __FLANG
#endif

#ifdef __GNUC__
    WRITE(*,*) "__GNUC__:", __GNUC__
#endif

#ifdef __IBMC__
    WRITE(*,*) "__IBMC__:", __IBMC__
#endif

#ifdef __CRAYFTN
    WRITE(*,*) "__CRAYFTN", __CRAYFTN
#endif

  END SUBROUTINE

END MODULE compiler_flags
       
! vim:ai sw=4 expandtab

