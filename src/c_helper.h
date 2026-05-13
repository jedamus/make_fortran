/* -*- C -*- */
/* c_helper.h */
/* erzeugt Mittwoch, 13. Mai 2026 06:10 (C) 2026 von Leander Jedamus */
/* modifiziert Mittwoch, 13. Mai 2026 06:56 von Leander Jedamus */

#ifndef C_HELPER_H
#define C_HELPER_H 1

void fortran_bindtextdomain(const char *domain, const char *dir); 
void fortran_textdomain(const char *domain);
void fortran_gettext(const char *msgid, char *result, int max_len);
void fortran_ngettext(const char *msgid, const char *msgid_plural, unsigned long int n, char *result, int max_len);
void fortran_dgettext(const char *domain, const char *msgid, char *result, int max_len);
void fortran_dngettext(const char *domain, const char *msgid, const char *msgid_plural, unsigned long int n, char *result, int max_len);
void fortran_setlocale();
void string_from_c(const char *c_str, char *f_str, int max_len);

#endif /* C_HELPER_H */

/* vim:set cindent ai sw=2 */

