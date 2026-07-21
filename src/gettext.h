/* -*- C -*- */
/* gettext.h */
/* erzeugt Dienstag, 21. Juli 2026 11:04 (C) 2026 von Leander Jedamus */
/* modifiziert Dienstag, 21. Juli 2026 14:05 von Leander Jedamus */

#ifndef GETTEXT_H
#define GETTEXT_H 1

#define DOMAIN_ "make_fortran"

#ifdef __GFORTRAN__
#  define __JOIN //
#else
#  define __JOIN
#endif

#ifdef DOMAIN_SUFFIX
#  define DOMAIN DOMAIN_ __JOIN "_" __JOIN DOMAIN_SUFFIX
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

