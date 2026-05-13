# erzeugt Samstag, 04. Juli 2015 14:04 (C) 2015 von Leander Jedamus
# modifiziert Mittwoch, 13. Mai 2026 17:58 von Leander Jedamus
# modifiziert Dienstag, 12. Mai 2026 10:43 von Leander Jedamus
# modifiziert Montag, 11. Mai 2026 15:56 von Leander Jedamus
# modifiziert Sonntag, 10. Mai 2026 22:17 von Leander Jedamus
# modifiziert Donnerstag, 07. Mai 2026 16:46 von Leander Jedamus
# modifiziert Mittwoch, 06. Mai 2026 18:49 von Leander Jedamus
# modifiziert Samstag, 18. April 2026 13:51 von Leander Jedamus
# modifiziert Donnerstag, 16. April 2026 09:04 von Leander Jedamus
# modifiziert Mittwoch, 15. April 2026 20:51 von Leander Jedamus
# modifiziert Donnerstag, 07. November 2024 10:19 von Leander Jedamus
# modifiziert Montag, 07. Oktober 2024 11:05 von Leander Jedamus
# modifiziert Samstag, 05. Oktober 2024 10:08 von Leander Jedamus
# modifiziert Dienstag, 01. Oktober 2024 10:07 von Leander Jedamus
# modifiziert Montag, 30. September 2024 23:59 von Leander Jedamus
# modifiziert Samstag, 24. August 2024 14:27 von Leander Jedamus
# modifiziert Montag, 12. August 2024 09:39 von Leander Jedamus
# modifiziert Dienstag, 06. August 2024 14:52 von Leander Jedamus
# modifiziert Freitag, 23. Februar 2024 16:26 von Leander Jedamus
# modifiziert Donnerstag, 22. Februar 2024 10:07 von Leander Jedamus
# modifiziert Freitag, 16. Februar 2024 20:52 von Leander Jedamus
# modifiziert Freitag, 15. Dezember 2023 12:41 von Leander Jedamus
# modifiziert Mittwoch, 15. November 2023 16:09 von Leander Jedamus
# modifiziert Dienstag, 07. November 2023 20:35 von Leander Jedamus
# modifiziert Dienstag, 19. September 2023 14:07 von Leander Jedamus
# modifiziert Samstag, 09. September 2023 11:19 von Leander Jedamus
# modifiziert Freitag, 08. September 2023 16:45 von Leander Jedamus
# modifiziert Dienstag, 05. September 2023 08:19 von Leander Jedamus
# modifiziert Samstag, 02. September 2023 11:11 von Leander Jedamus
# modifiziert Mittwoch, 30. August 2023 18:32 von Leander Jedamus
# modifiziert Donnerstag, 17. August 2023 10:31 von Leander Jedamus
# modifiziert Mittwoch, 16. August 2023 17:10 von Leander Jedamus
# modifiziert Dienstag, 15. August 2023 16:54 von Leander Jedamus
# modifiziert Montag, 14. August 2023 08:52 von Leander Jedamus
# modifiziert Donnerstag, 10. August 2023 18:46 von Leander Jedamus
# modifiziert Mittwoch, 09. August 2023 15:00 von Leander Jedamus
# modifiziert Dienstag, 08. August 2023 21:45 von Leander Jedamus
# modifiziert Sonntag, 30. Juli 2023 19:24 von Leander Jedamus
# modifiziert Donnerstag, 27. Juli 2023 14:33 von Leander Jedamus
# modifiziert Mittwoch, 26. Juli 2023 08:22 von Leander Jedamus
# modifiziert Dienstag, 25. Juli 2023 16:22 von Leander Jedamus
# modifiziert Montag, 24. Juli 2023 06:50 von Leander Jedamus
# modifiziert Sonntag, 23. Juli 2023 13:54 von Leander Jedamus
# modifiziert Samstag, 22. Juli 2023 15:15 von Leander Jedamus
# modifiziert Freitag, 21. Juli 2023 10:41 von Leander Jedamus
# modifiziert Donnerstag, 20. Juli 2023 10:46 von Leander Jedamus
# modifiziert Mittwoch, 19. Juli 2023 16:34 von Leander Jedamus
# modifiziert Dienstag, 18. Juli 2023 03:00 von Leander Jedamus
# modifiziert Montag, 17. Juli 2023 22:18 von Leander Jedamus

SUFFIXES := .out .a .ln .o .c .cc .cpp .c++ .cxx .C .p .pas .f .F .for .FOR .ftn .f77 .FTN .FPP .f90 .F90 .f95 .F95 .f03 \
	    .F03 .f08 .F08 .m .r .y .l .ym .yl .s .S .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web \
	    .sh .elc .el .latex .ps .nw .cweb .noweb .mf .ind .sgml .cob .1 .odt .html .pdf .ps .tfm
.SUFFIXES:  .out .a .ln .o .c .cc .cpp .c++ .cxx .C .p .pas .f .F .for .FOR .ftn .f77 .FTN .FPP .f90 .F90 .f95 .F95 .f03 \
	    .F03 .f08 .F08 .m .r .y .l .ym .yl .s .S .mod .sym .def .h .info .dvi .tex .texinfo .texi .txinfo .w .ch .web \
	    .sh .elc .el .latex .ps .nw .cweb .noweb .mf .ind .sgml .cob .1 .odt .html .pdf .ps .tfm

.DEFAULT_GOAL		:= all

.INTERMEDIATE:		# list files here which should be treated as intermediate

.SECONDARY:		# list files here which are intermediate and should not be deleted

.PRECIOUS:		# %.o %.c for example to save intermediate files created by implicit rules

# .NOTPARALLEL:		

.DELETE_ON_ERROR:

VPATH			:= # search path for files not found in the current directory; separated by :
#vpath			%.h ../headers

.LIBPATTERNS		:= lib%.so lib%.a

ifeq ($(PLATFORM),stable-armv7-unknown-linux-gnueabihf)
PLATFORM		= linux
endif

PLATFORM		?= linux

debug_switch		:= true# false

# set link_switch to shared, if there is at least one shared library:
link_switch		:= shared# static# shared

DEPENDFILE		:= $(BUILDDIR).depend
PRINTFILE		:= .print

WORKDIR			= $(shell pwd)
DATE			:= $(shell date +\"%y%m%d\")
DATETIME		:= $(shell date +\"%d.%m.%Y\ %H:%M\")
PROJECT			:= $(shell cat project.txt)
# PROJECT		:= va_args
PROJECT_F90		= $(SRCDIR)/project.F90
PROJECT_FILES		= $(PROJECT_F90)

PREFIX			:= /usr/local
BINDIR			:= $(PREFIX)/bin
LIBDIR			:= $(PREFIX)/lib
DATAROOTDIR		:= $(PREFIX)/share
DATADIR			:= $(DATAROOTDIR)
MANDIR			:= $(DATAROOTDIR)/man
INFODIR			:= $(DATAROOTDIR)/info
DOCDIR			:= $(DATAROOTDIR)/doc/$(PROJECT)
LOCALEDIR		:= $(DATAROOTDIR)/locale

BACKUPDIR		:= $(PROJECT)
TARFILE			:= $(PROJECT).tar.gz
ZIPFILE			:= $(PROJECT)_$(DATE).zip

#TEXINFOFILE		:= check.texinfo
#INFOFILE		:= $(TEXINFOFILE:%.texinfo=%.info)
#XMLFILE		:= $(TEXINFOFILE:%.texinfo=%.xml)
#TXTFILE		:= $(TEXINFOFILE:%.texinfo=%.txt)
#PDFFILE		:= $(TEXINFOFILE:%.texinfo=%.pdf)
#HTMLFILE		:= $(TEXINFOFILE:%.texinfo=%.html)
#HTMLDIR		:= $(TEXINFOFILE:%.texinfo=%)

#CPPCHECKDIR		:= $(PROJECT)-cppcheck-build-dir

#PDFOUTPUT		:= $(PDFFILE)
#PDFOUTPUT		+= $(PDFFILE:%.pdf=%.log)
#PDFOUTPUT		+= $(PDFFILE:%.pdf=%.toc)
#PDFOUTPUT		+= $(PDFFILE:%.pdf=%.aux)
#PDFOUTPUT		+= $(PDFFILE:%.pdf=%.cps)
#PDFOUTPUT		+= $(PDFFILE:%.pdf=%.cp)

# profiling:
GMONFILE		:= gmon.out
PROFFILE		:= gprof.out.txt
NMFILE			:= nm.out.txt

STRIP			:= strip

SRCDIR			= src
BUILDDIR		= build/$(PLATFORM)
MODDIR			= $(BUILDDIR)/mod
SRCLIB			= $(SRCDIR)/lib
BUILDLIB		= $(BUILDDIR)/lib

include Makefile.c_and_c++
#include Makefile.cobol
#include Makefile.cweb_and_noweb
#include Makefile.documentation
include Makefile.FORTRAN
#include Makefile.flex_and_bison
#include Makefile.latex
#include Makefile.modula2
#include Makefile.pascal

DEBUGGER		:= gdb
RM			:= rm -f
GENERATE		:= ./generate2
PRINT			:= a2ps
TOUCH			:= touch
LINT			:= cppcheck
PROF			:= gprof
NM			:= nm

FFLAGS			:= -std=f2008 #
CFLAGS			:= #
DFLAGS			:= #
LDFLAGS			:= #
LDLIBS			:= #
CPPFLAGS		:= #
CXXFLAGS		:= #
ARFLAGS			:= rv
NMFLAGS			:= --extern-only --defined-only -v --print-file-name
LINTFLAGS		:= #

ifeq ($(debug_switch),true)
  FFLAGS		+= -Wall -Wextra
  ifeq ($(CC),gcc)
    FFLAGS		+= -pg # profiling
    FFLAGS		+= -Og # optimize for debug
  endif
else
  FFLAGS		+= -O3
endif

DFLAGS			+= -DINLINE=inline
#DFLAGS			+= -DINLINE
DFLAGS			+= -DCONST=const
#DFLAGS			+= -DCONST
DFLAGS			+= -DSYSTEM=$(machtype)
DFLAGS			+= -DCLRSCR
ifeq ($(DEBUG),true)
  DFLAGS		+= -DDEBUG=true
endif

ifeq ($(CC),gcc)
  CPPFLAGS		+= -ansi
endif

CPPFLAGS		+= -pipe

ifeq ($(machtype),MacOS)
  CPPFLAGS		+= -I/usr/local/Cellar/gettext/0.19.3/include
endif
CPPFLAGS		+= -I $(SRCDIR)

CPPFLAGS		+= # -traditional
CPPFLAGS		+= # -funroll-loops -fomit-frame-pointer
CXXFLAGS		+= -std=c++17 # -felide-constructors -fmemoize-lookups
LDFLAGS			+= -L .# -s
LDLIBS			+= -lgfortran -lm 
# LDLIBS		+= -lefence
LDLIBS			+= # -lvga
LDLIBS			+= # -ly
LDLIBS			+= # -ltermcap
LDLIBS			+= -ll # lex
LDLIBS			+= -ly # yacc
LDLIBS			+= # -lcurses
LDLIBS			+= # -lncurses

ifeq ($(machtype),MacOS)
  LDFLAGS		+= -L /usr/local/lib
  LDLIBS		+= -lintl
else
  LDLIBS		+= -lpopt # command line parsing
endif

ifeq ($(DEBUG),true)
  ifeq ($(FC),gfortran)
    LDFLAGS		+= -Wl,--rpath=$(BUILDLIB)
  else
    LDFLAGS		+= -L $(BUILDLIB) -Xlinker -rpath -Xlinker $(BUILDLIB)
  endif
endif

define debug
$(DEBUGGER) $<
endef

define generate
$(GENERATE) $<
endef

define print
$(PRINT) $<
endef

OBJS			:= # put your obj files here \
			    (will be deleted by "make clean")
LIBRARIES		:= # put your libraries here \
			    (will be deleted by "make clean")
CSOURCES		:= # put your c source files here \
			    (will be used e.g. by "make depend")
CDEPENDS		:= # here you add the .d files make from .c files
CCDEPENDS		:= # here you add the .d files make from .cc files
IS_IN_LIB		:= # no longer needed
SHARED_LIBS		:= # here you add all shared libraries
CCSOURCES		:= # put your c++ source files here. File types \
			    "*.cc,*.cpp,*.c++,*.cxx,*.C" are recognized. \
			    (will be used e.g. by "make depend")
FILES			:= # put your source and other files here, that you \
                            want to be used e.g. in "make backup" and \
			    "make print"

FILES			+= Makefile
FILES			+= run_me_once.sh
FILES			+= README.md
FILES			+= depend.sh
FILES			+= translate.sh
FILES			+= backup.sh
FILES			+= distclean.sh
FILES			+= zip.sh
FILES			+= create_project.sh
FILES			+= create_version.sh
FILES			+= create_register.sh
FILES			+= create_translate.sh
FILES			+= create_depend.py reorder.py separator.py
FILES			+= install_bin.sh install_lib.sh install_locale.sh
FILES			+= bin_dist.sh
FILES			+= Makefile.FORTRAN
FILES			+= project.txt
FILES			+= version.txt
FILES			+= author.txt author_email.txt license.txt
FILES			+= maintainer.txt maintainer_email.txt
FILES			+= updated.txt url.txt description.txt years.txt
FILES			+= license.md
#FILES			+= $(PROJECT).cppcheck

# use this for your c++ source files (uncomment for use with your c++-file):
#CCSOURCES.cc		:= #
#CCSOURCES.cpp		:= #
#CCSOURCES.c++		:= #
#CCSOURCES.cxx		:= #
#CCSOURCES.C		:= #

#CCOBJS.cc		:= #
#CCOBJS.cpp		:= #
#CCOBJS.c++		:= #
#CCOBJS.cxx		:= #
#CCOBJS.C		:= #

#CCSOURCES.cc		+= check1.cc
#CCSOURCES.cpp		+= check2.cpp
#CCSOURCES.c++		+= check3.c++
#CCSOURCES.cxx		+= check4.cxx
#CCSOURCES.C		+= check5.C

#CCOBJS.cc		+= $(CCSOURCES.cc:%.cc=%.o)
#CCOBJS.cpp		+= $(CCSOURCES.cpp:%.cpp=%.o)
#CCOBJS.c++		+= $(CCSOURCES.c++:%.c++=%.o)
#CCOBJS.cxx		+= $(CCSOURCES.cxx:%.cxx=%.o)
#CCOBJS.C		+= $(CCSOURCES.C:%.C=%.o)

# you have to uncomment these, if you use c++:
#CCSOURCES		+= $(CCSOURCES.cc) $(CCSOURCES.cpp) $(CCSOURCES.c++) \
			   $(CCSOURCES.cxx) $(CCSOURCES.C)
#FILES			+= $(CCSOURCES.cc) $(CCSOURCES.cpp) $(CCSOURCES.c++) \
			   $(CCSOURCES.cxx) $(CCSOURCES.C)
#CCOBJS			+= $(CCOBJS.cc) $(CCOBJS.cpp) $(CCOBJS.c++) \
			   $(CCOBJS.cxx) $(CCOBJS.C)
#OBJS			+= $(CCOBJS)

UNAME_S			= $(shell uname -s)
UNAME_M			= $(shell uname -m)

ifeq ($(UNAME_S),Linux)
  PLATFORM_DEFINES += -D__linux__ -D__gnu_linux__ -D__unix__
else ifeq ($(UNAME_S),Darwin)
  PLATFORM_DEFINES += -D__APPLE__ -D__MACH__
else ifneq ($(findstr MINGW,$(UNAME_s)),)
  PLATFORM_DEFINES += -D_WIN32
else ifneq ($(findstr CYGWIN,$(UNAME_S)),)
  PLATFORM_DEFINES += -D_WIN32 -D__CYGWIN__
endif

ifeq ($(UNAME_M),x86_64)
  ARCH_DEFINES		+= -D__x86_64__
else ifeq ($(UNAME_M),i686)
  ARCH_DEFINES		+= -D__i386__
else ifeq ($(UNAME_M),aarch64)
  ARCH_DEFINES		+= -D__aarch64__
endif

DEFINES			= $(PLATFORM_DEFINES) $(ARCH_DEFINES)

MODFLAG			= -J $(MODDIR)
FINCLUDES		= -I $(BUILDDIR) -I $(SRCDIR) -I $(MODDIR) $(addprefix -I ,$(wildcard $(SRCLIB)/*))
LDFLAGS			+= -L $(BUILDLIB) $(patsubst $(SRCLIB)/%,-l%,$(wildcard $(SRCLIB)/*)) $(LDLIBS)

ALL_SOURCES		= $(shell $(FIND) $(SRCDIR) -type f \( -name "*.f" -o -name "*.F" \
			  -o -name "*.for" -o -name "*.FOR" -o -name "*.ftn" -o -name "*.FTN" \
			  -o -name "*.FPP" -o -name "*.f77" -o -name "*.F77" -o -name "*.f90" \
			  -o -name "*.F90" -o -name "*.f95" -o -name "*.F95" -o -name "*.f03" \
			  -o -name "*.F03" -o -name "*.f08" -o -name "*.F08" \) )

MAIN_SOURCES		= $(filter-out $(SRCLIB)/%,$(ALL_SOURCES))
LIB_SOURCES		= $(filter $(SRCLIB)/%,$(ALL_SOURCES))

MAIN_OBJECTS		= $(patsubst $(SRCDIR)/%.f,$(BUILDDIR)/%.o,$(filter %.f,$(MAIN_SOURCES))) \
			  $(patsubst $(SRCDIR)/%.F,$(BUILDDIR)/%.o,$(filter %.F,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.for,$(BUILDDIR)/%.o,$(filter %.for,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FOR,$(BUILDDIR)/%.o,$(filter %.FOR,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.ftn,$(BUILDDIR)/%.o,$(filter %.ftn,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FTN,$(BUILDDIR)/%.o,$(filter %.FTN,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FPP,$(BUILDDIR)/%.o,$(filter %.FPP,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f77,$(BUILDDIR)/%.o,$(filter %.f77,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F77,$(BUILDDIR)/%.o,$(filter %.F77,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f90,$(BUILDDIR)/%.o,$(filter %.f90,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F90,$(BUILDDIR)/%.o,$(filter %.F90,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f95,$(BUILDDIR)/%.o,$(filter %.f95,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F95,$(BUILDDIR)/%.o,$(filter %.F95,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f03,$(BUILDDIR)/%.o,$(filter %.f03,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F03,$(BUILDDIR)/%.o,$(filter %.F03,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f08,$(BUILDDIR)/%.o,$(filter %.f08,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F08,$(BUILDDIR)/%.o,$(filter %.F08,$(MAIN_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(filter %.c,$(MAIN_SOURCES)))

ifeq  ($(link_switch),static)
LIB_OBJECTS		= $(patsubst $(SRCDIR)/%.f,$(BUILDDIR)/%.ol,$(filter %.f,$(LIB_SOURCES))) \
			  $(patsubst $(SRCDIR)/%.F,$(BUILDDIR)/%.ol,$(filter %.F,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.for,$(BUILDDIR)/%.ol,$(filter %.for,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FOR,$(BUILDDIR)/%.ol,$(filter %.FOR,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.ftn,$(BUILDDIR)/%.ol,$(filter %.ftn,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FTN,$(BUILDDIR)/%.ol,$(filter %.FTN,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FPP,$(BUILDDIR)/%.ol,$(filter %.FPP,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f77,$(BUILDDIR)/%.ol,$(filter %.f77,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F77,$(BUILDDIR)/%.ol,$(filter %.F77,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f90,$(BUILDDIR)/%.ol,$(filter %.f90,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F90,$(BUILDDIR)/%.ol,$(filter %.F90,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f95,$(BUILDDIR)/%.ol,$(filter %.f95,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F95,$(BUILDDIR)/%.ol,$(filter %.F95,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f03,$(BUILDDIR)/%.ol,$(filter %.f03,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F03,$(BUILDDIR)/%.ol,$(filter %.F03,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f08,$(BUILDDIR)/%.ol,$(filter %.f08,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F08,$(BUILDDIR)/%.ol,$(filter %.F08,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.ol,$(filter %.c,$(LIB_SOURCES)))
#DEPENDS			= $(shell ./reorder.py $(BUILDDIR) $(LIB_OBJECTS) $(MAIN_OBJECTS))
#DEPENDS			= $(LIB_OBJECTS:.ol=.d) $(MAIN_OBJECTS:.o=.d)
DEPENDS			= $(LIB_OBJECTS:.ol=.d) $(MAIN_OBJECTS:.o=.d)
PRAE_T			= $(LIB_OBJECTS:.ol=.t) $(MAIN_OBJECTS:.o=.t)
else
LIB_OBJECTS		= $(patsubst $(SRCDIR)/%.f,$(BUILDDIR)/%.osl,$(filter %.f,$(LIB_SOURCES))) \
			  $(patsubst $(SRCDIR)/%.F,$(BUILDDIR)/%.osl,$(filter %.F,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.for,$(BUILDDIR)/%.osl,$(filter %.for,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FOR,$(BUILDDIR)/%.osl,$(filter %.FOR,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.ftn,$(BUILDDIR)/%.osl,$(filter %.ftn,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FTN,$(BUILDDIR)/%.osl,$(filter %.FTN,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.FPP,$(BUILDDIR)/%.osl,$(filter %.FPP,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f77,$(BUILDDIR)/%.osl,$(filter %.f77,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F77,$(BUILDDIR)/%.osl,$(filter %.F77,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f90,$(BUILDDIR)/%.osl,$(filter %.f90,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F90,$(BUILDDIR)/%.osl,$(filter %.F90,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f95,$(BUILDDIR)/%.osl,$(filter %.f95,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F95,$(BUILDDIR)/%.osl,$(filter %.F95,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f03,$(BUILDDIR)/%.osl,$(filter %.f03,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F03,$(BUILDDIR)/%.osl,$(filter %.F03,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.f08,$(BUILDDIR)/%.osl,$(filter %.f08,$(LIB_SOURCES)))  \
			  $(patsubst $(SRCDIR)/%.F08,$(BUILDDIR)/%.osl,$(filter %.F08,$(LIB_SOURCES))) 
#DEPENDS			= $(shell ./reorder.py $(BUILDDIR) $(LIB_OBJECTS) $(MAIN_OBJECTS))
#DEPENDS			= $(LIB_OBJECTS:.osl=.d) $(MAIN_OBJECTS:.o=.d)
DEPENDS			= $(LIB_OBJECTS:.ol=.d) $(MAIN_OBJECTS:.o=.d)
PRAE_T			= $(LIB_OBJECTS:.osl=.t) $(MAIN_OBJECTS:.o=.t)
endif
CSOURCES		= $(shell $(FIND) $(SRCDIR) -type f \( -name "*.c" \) ) 
COBJECTS		= $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(filter %.c,$(CSOURCES))) 

LIB_NAMES		= $(notdir $(wildcard $(SRCLIB)/*))
ifeq ($(link_switch),static)
LIB_ARCHIVES		= $(foreach lib,$(LIB_NAMES), $(addprefix $(BUILDLIB)/lib,$(addsuffix .a,$(lib))))
else
LIB_ARCHIVES		= $(foreach lib,$(LIB_NAMES), $(addprefix $(BUILDLIB)/lib,$(addsuffix .so,$(lib))))
endif

CLEAN			= $(strip $(filter %.o,$(OBJS)) \
		            $(filter %.osl,$(OBJS)) \
		            $(filter %.ol,$(OBJS)) \
			    $(LIBRARIES) $(PROGRAMS) \
			    $(INFOFILE) $(XMLFILE) \
			    $(TXTFILE) $(PDFOUTPUT) \
			   )
CLEANDIRS		= $(strip $(HTMLDIR) $(CPPCHECKDIR))

PROGRAM1		:= $(BUILDDIR)/darlehen$(EXT)

#PROGRAM2		:= $(PROJECT)

PROGRAMS		:= $(PROJECT_FILES) $(strip $(PROGRAM1) $(PROGRAM2))

.PHONY:			all
all:			$(PROJECT_FILES) createdirs $(PROGRAMS)
			@echo done.

$(PROGRAM1):		$(PRAE_T) $(LIB_OBJECTS) $(MAIN_OBJECTS) $(C_OBJECTS) $(LIB_ARCHIVES)
			$(FC) $(strip $(FFLAGS) -o $@ $(MAIN_OBJECTS) $(C_OBJECTS) $(LDFLAGS))

$(foreach lib,$(LIB_NAMES),$(eval $(call create-library-rule,$(lib))))

.PHONY:			install
install:		$(PROJECT_FILES) $(PROGRAMS)
			@sh ./install_bin.sh $(BINDIR) $(PROGRAM1) $(PROGRAM2)
ifneq ($(link_switch),static)
			@cd $(BUILDLIB) && sh $(WORKDIR)/install_lib.sh $(LIBDIR) $(LIB_ARCHIVES)
endif
			@sh ./install_locale.sh $(LOCALEDIR) $(PROJECT).mo

.PHONY:			bin_dist
bin_dist:		$(PROJECT_FILES) $(PROGRAMS)
			@sh ./bin_dist.sh $(PROGRAM1) $(PROJECT) $(LIB_ARCHIVES)
#			@sh ./bin_dist.sh $(PROGRAM2) $(PROJECT) $(LIB_ARCHIVES)

.PHONY:			strip
strip:			$(PROGRAMS)
			$(STRIP) $(PROGRAMS)

.PHONY:			createdirs
createdirs:
			@$(MKDIR) $(BUILDDIR)
			@$(MKDIR) $(MODDIR)
			@cd $(SRCDIR) && $(FIND) . -type d ! -path . -exec $(MKDIR) $(WORKDIR)/$(BUILDDIR)/{} \;

.PHONY:			cleanup
cleanup:
			@cd $(BUILDDIR) && $(FIND) . -name "*.d" -type f -size 0c -exec $(RM) {} \;

.PHONY:			firastrun
firstrun:		$(PRAE_T)
			./reorder.py $(BUILDDIR) $(LIB_OBJECTS) $(MAIN_OBJECTS)
			
.PHONY:			debug
debug:
			@echo "$$""(CLEAN)=$(strip $(CLEAN))"
			@echo "$$""(CLEANDIRS)=$(strip $(CLEANDIRS))"
			@echo "$$""(OBJS)=$(strip $(OBJS))"
			@echo "$$""(FILES)=$(strip $(FILES))"
			@echo "$$""(CSOURCES)=$(strip $(CSOURCES))"
			@echo "$$""(CCSOURCES)=$(strip $(CCSOURCES))"
			@echo "$$""(CDEPENDS)=$(strip $(CDEPENDS))"
			@echo "$$""(CCDEPENDS)=$(strip $(CCDEPENDS))"
			@echo "$$""(OBJS1)=$(strip $(OBJS1))"
			@echo "$$""(PROGRAMS)=$(strip $(PROGRAMS))"
			@echo "$$""(PC)=$(strip $(PC))"
			@echo "$$""(FC)=\"$(strip $(FC))\""
			@echo "$$""(DATETIME)=$(strip $(DATETIME))"
			@echo "$$""(LIB1OBJS)=$(strip $(LIB1OBJS))"
			@echo "$$""(ALL_SOURCES)=$(strip $(ALL_SOURCES))"
			@echo "$$""(MAIN_SOURCES)=$(strip $(MAIN_SOURCES))"
			@echo "$$""(LIB_SOURCES)=$(strip $(LIB_SOURCES))"
			@echo "$$""(MAIN_OBJECTS)=$(strip $(MAIN_OBJECTS))"
			@echo "$$""(LIB_OBJECTS)=$(strip $(LIB_OBJECTS))"
			@echo "$$""(PRAE_T)=$(strip $(PRAE_T))"
			@echo "$$""(DEPENDS)=$(strip $(DEPENDS))"
			@echo "$$""(LIB_NAMES)=$(strip $(LIB_NAMES))"
			@echo "$$""(LIB_ARCHIVES)=$(strip $(LIB_ARCHIVES))"
			@echo "$$""(SRCDIR)=$(strip $(SRCDIR))"
			@echo "$$""(SRCLIB)=$(strip $(SRCLIB))"
			@echo "$$""(BUILDDIR)=$(strip $(BUILDDIR))"
			@echo "$$""(BUILDLIB)=$(strip $(BUILDLIB))"
			@echo "$$""(FFLAGS)=$(strip $(FFLAGS))"
			@echo "$$""(FINCLUDES)=$(strip $(FINCLUDES))"
			@echo "$$""(LDFLAGS)=$(strip $(LDFLAGS))"
			@echo "$$""(WORKDIR)=$(strip $(WORKDIR))"
			@echo "$$""(MODDIR)=$(strip $(MODDIR))"
			@echo "$$""(CSOURCES)=$(strip $(CSOURCES))"
			@echo "$$""(COBJECTS)=$(strip $(COBJECTS))"

.PHONY:			debugger
debugger:		$(PROGRAM1)
			$(debug)

.PHONY:			lint
lint:
			$(LINT) $(LINTFLAGS) .

.PHONY:			prof
prof:			$(PROGRAM1)
			$(PROGRAM1)
			$(PROF) $(PROGRAM1) $(GMONFILE) > $(PROFFILE)
			$(NM) $(NMFLAGS) $(PROGRAM1) > $(NMFILE)

.PHONY:			doc
doc:			$(INFOFILE) $(XMLFILE) $(TXTFILE) \
			$(HTMLFILE)
			# $(PDFFILE) 

#$(PROGRAM1):		$(LIB1RARY) $(CDEPENDS) $(MAINOBJS)
#			$(link.c)

#$(PROJECT):			$(CCOBJS)
#			$(link.cc)

#$(LIB1RARY):		$(LIB1OBJS)
#			$(static_library)

#.PHONY:			clean
#clean:
#			$(RM) $(CLEAN)
#			$(RM) -r $(CLEANDIRS)
#ifeq ($(machtype),MacOS)
#			$(RM) -r $(PROJECT).dSYM
#endif

.PHONY:			clean
clean:
			$(RM) -fr $(BUILDDIR)

.PHONY:			distclean
distclean:
			$(RM) -r $(CLEANDIRS)
			@./distclean.sh $(strip $(CDEPENDS) $(CCDEPENDS) $(PRINTFILE) $(GMONFILE) $(PROFFILE) $(NMFILE) $(PROJECT_FILES) $(CLEAN))
ifeq ($(machtype),MacOS)
			$(RM) -r $(PROJECT).dSYM
endif

.PHONY:			print
print:			$(PRINTFILE)

$(PRINTFILE):		$(FILES)
			$(PRINT) $?
			$(TOUCH) $(PRINTFILE)

.PHONY:			dummy
dummy:

$(PROJECT_F90):		project.txt version.txt updated.txt author.txt author_email.txt license.txt maintainer.txt maintainer_email.txt url.txt \
			    description.txt years.txt create_project.sh
			@echo "creating $@"
			@./create_project.sh $@

.PHONY:			create_project
create_project:		$(PROJECT_F90)

.PHONY:			depend
#depend:			$(DEPENDS)

#depend:
#			echo "# automatically created" \
#			     "$(DATETIME)" \
#			     "by \"make depend\"" > $(DEPENDFILE)
#ifneq ($(strip $(CSOURCES)),)
#			$(DEPEND.c) $(CSOURCES) >> $(DEPENDFILE)
#endif
#ifneq ($(strip $(CCSOURCES)),)
#			$(DEPEND.cc) $(CCSOURCES) >> $(DEPENDFILE)
#endif

# .PHONY:			depend
# depend:			$(CDEPENDS) $(CCDEPENDS) ;

.PHONY:			backup
backup:
			@./backup.sh $(BACKUPDIR) $(TARFILE) $(strip $(FILES))

.PHONY:			zip
zip:
			@./zip.sh $(BACKUPDIR) $(ZIPFILE) $(strip $(FILES))

.PHONY:			create_translate
create_translate:
			@./create_translate.sh translate $(PROJECT) $(LIB_NAMES)

.PHONY:			create_register
create_register:
			@./create_register.sh $(SRCDIR) $(PROJECT) $(WORKDIR)/locale my_register $(LIB_NAMES)

.PHONY:			translate
translate:
			@./translate.sh

#
# include a dependency file if one exists
#
# ifeq ($(DEPENDFILE),$(wildcard $(DEPENDFILE)))
#  include $(DEPENDFILE)
# endif

-include $(DEPENDFILE)
-include $(DEPENDS)

#
# include dependency files if exists
#
#ifneq (,$(wildcard *.d))
#  include *.d
#endif

# vim:ai sw=2 noexpandtab

