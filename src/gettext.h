/* -*- C -*- */
/* gettext.h */
/* erzeugt Dienstag, 21. Juli 2026 11:04 (C) 2026 von Leander Jedamus */
/* modifiziert Dienstag, 21. Juli 2026 12:36 von Leander Jedamus */

#ifndef GETTEXT_H
#define GETTEXT_H 1

#define DOMAIN_ "make_fortran"

#ifdef DOMAIN_SUFFIX
#  ifdef __GFORTRAN__
#    define DOMAIN DOMAIN_ // "_" // DOMAIN_SUFFIX
#  else
#    define DOMAIN DOMAIN_ "_" DOMAIN_SUFFIX
#  endif
#else
#  define DOMAIN DOMAIN_
#endif

#ifdef IS_LIB
#  define _(msgid) dgettext (DOMAIN, msgid)
#else
#  define _(msgid) gettext (msgid)
#endif
       
#endif /* GETTEXT_H */

/* vim:set cindent ai sw=2 */

