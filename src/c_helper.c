/* -*- C -*- */
/* c_helper.c */
/* erzeugt Donnerstag, 07. Mai 2026 16:42 (C) 2026 von Leander Jedamus */
/* modifiziert Mittwoch, 13. Mai 2026 07:07 von Leander Jedamus */
/* modifiziert Dienstag, 12. Mai 2026 14:35 von Leander Jedamus */
/* modifiziert Donnerstag, 07. Mai 2026 16:45 von Leander Jedamus */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libintl.h>
#include <locale.h>
#include "c_helper.h"

void fortran_bindtextdomain(const char *domain, const char *dir) {
  fprintf(stderr, "DEBUG bindtextdomain(domain='%s', dir='%s')\n", domain, dir);
  bindtextdomain(domain, dir);
}

void fortran_textdomain(const char *domain) {
  fprintf(stderr, "DEBUG textdomain(domain='%s')\n", domain);
  textdomain(domain);
}

void fortran_gettext(const char *msgid, char *result, int max_len) {
  /*
  static int init = 0;
  if(!init) {
    bindtextdomain("make_fortran", "/home/leander/Projekte/new/fortran/make_fortran/locale");
    textdomain("make_fortran");
    init = 1;
  }
  */

  const char *trans = gettext(msgid);

  fprintf(stderr, "DEBUG gettext('%s') = '%s'\n", msgid, trans ? trans : "(null)");

  if (trans) {
    strncpy(result, trans, max_len - 1);
    result[max_len - 1] = '\0';
  } else {
    result[0] = '\0';
  }
}

void fortran_ngettext(const char *msgid, const char *msgid_plural, unsigned long int n, char *result, int max_len) {
  const char *trans = ngettext(msgid, msgid_plural, n);

  if (trans) {
    strncpy(result, trans, max_len - 1);
    result[max_len - 1] = '\0';
  } else {
    result[0] = '\0';
  }
}

void fortran_setlocale() {
  setenv("LANGUAGE", "de", 1);

  char *result = setlocale(LC_ALL, "");
  fprintf(stderr, "DEBUG setlocale() returned: %s\n", result ? result : "(null)");
}

void string_from_c(const char *c_str, char *f_str, int max_len) {
  if (c_str) {
    strncpy(f_str, c_str, max_len);
    f_str[max_len - 1] = '\0';
  } else {
    f_str[0] = '\0';
  }
}

void fortran_dgettext(const char *domain, const char *msgid, char *result, int max_len) {

  fprintf(stderr, "DEBUG dgettext(domain='%s',msgid ='%s' hex=", domain, msgid);
  const unsigned char *p;
  for (p = (const unsigned char *) msgid; *p; p++)
    fprintf(stderr, " %02x", *p);
  fprintf(stderr, "\n");

  const char *trans = dgettext(domain, msgid);

  if (trans) {
    strncpy(result, trans, max_len -1);
    result[max_len - 1] = '\0';
  } else {
    result[0] = '\0';
  }
}

void fortran_dngettext(const char *domain, const char *msgid, const char *msgid_plural, unsigned long int n, char *result, int max_len) {
  const char *trans = dngettext(domain, msgid, msgid_plural, n);
  if (trans) {
    strncpy(result, trans, max_len -1);
    result[max_len - 1] = '\0';
  } else {
    result[0] = '\0';
  }
}

/* vim:set cindent ai sw=2: */

