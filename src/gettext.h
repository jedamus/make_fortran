/* -*- C -*- */
/* gettext.h */
/* erzeugt Dienstag, 21. Juli 2026 11:04 (C) 2026 von Leander Jedamus */
/* modifiziert Dienstag, 21. Juli 2026 15:47 von Leander Jedamus */

#ifndef GETTEXT_H
#define GETTEXT_H 1

#define _DOMAIN "make_fortran"

#ifdef __GFORTRAN__
#  define _JOIN //
#else
#  define _JOIN
#endif

#ifdef DOMAIN_SUFFIX
#  define DOMAIN _DOMAIN _JOIN "_" _JOIN DOMAIN_SUFFIX
#else
#  define DOMAIN _DOMAIN
#endif

#ifdef IS_LIB
#  define _(msgid) dgettext (DOMAIN, msgid)
#else
#  define _(msgid) gettext (msgid)
#endif
       
#endif /* GETTEXT_H */

/* vim:set cindent ai sw=2 */

