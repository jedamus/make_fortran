/* -*- C -*- */
/* c_helper.c */
/* erzeugt Donnerstag, 07. Mai 2026 16:42 (C) 2026 von Leander Jedamus */
/* modifiziert Donnerstag, 07. Mai 2026 16:45 von Leander Jedamus */

#include <string.h>

void string_from_c(const char *c_str, char *f_str, int max_len) {
  if (c_str) {
    strncpy(f_str, c_str, max_len);
    f_str[max_len - 1] = '\0';
  } else {
    f_str[0] = '\0';
  }
}

/* vim:set cindent ai sw=2: */

