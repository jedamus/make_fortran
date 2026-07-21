/* -*- C -*- */
/* gettext.h */
/* erzeugt Dienstag, 21. Juli 2026 11:04 (C) 2026 von Leander Jedamus */
/* modifiziert Dienstag, 21. Juli 2026 11:05 von Leander Jedamus */

#ifndef GETTEXT_H
#define GETTEXT_H 1

#ifdef IS_LIB
#define _(msgid) dgettext (DOMAIN, msgid)
#else
#define _(msgid) gettext (msgid)
#endif
       
#endif /* GETTEXT_H */

/* vim:set cindent ai sw=2 */

