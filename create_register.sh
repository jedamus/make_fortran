#!/usr/bin/env sh

# erzeugt Mittwoch, 13. Mai 2026 11:19 (C) 2026 von Leander Jedamus
# modifiziert Mittwoch, 13. Mai 2026 14:11 von Leander Jedamus

# set -x

if [ -z $1 ]; then
  echo "usage: $0 <SRCDIR> <domain> <pfad> <filename> <libname1> <libname2> ..."
  exit 1
fi

srcdir=$1
shift
domain=$1
shift
pfad=$1
shift
filename=$1
shift

filename1="$srcdir/$filename.F90"

cat << EOF > $filename1
! erzeugt Dienstag, 12. Mai 2026 11:12 (C) 2026 von Leander Jedamus
! modifiziert Dienstag, 12. Mai 2026 11:23 von Leander Jedamus

#define DOMAIN "$domain"
#define PFAD "$pfad"
#ifdef IS_LIB
#define _ (msgid) dgettext (DOMAIN, msgid)
#else
#define _ (msgid) gettext (msgid)
#endif
       
MODULE my_register

  USE mod_gettext
EOF

for i in $*; do
  echo "  USE my_register_lib$i" >> $filename1
done

cat << EOF >> $filename1
  IMPLICIT NONE
  PRIVATE

  PUBLIC :: register

  CONTAINS

  SUBROUTINE register()
    IMPLICIT NONE

    CALL setlocale()
    CALL bindtextdomain(DOMAIN, PFAD)
    CALL textdomain(DOMAIN)

EOF

for i in $*; do
  filename2=$srcdir/lib/$i/${filename}_lib$i.F90
  echo "    CALL register_lib_$i(PFAD)" >> $filename1
done

cat << EOF >> $filename1
  END SUBROUTINE register

END MODULE my_register
       
! vim:ai sw=4 expandtab

EOF

for i in $*; do
  filename2=$srcdir/lib/$i/${filename}_lib$i.F90

cat << EOF > $filename2
! erzeugt Mittwoch, 13. Mai 2026 09:41 (C) 2026 von Leander Jedamus
! modifiziert Mittwoch, 13. Mai 2026 09:41 von Leander Jedamus

#define DOMAIN "${domain}_lib$i"
       
MODULE ${filename}_lib$i
  USE mod_gettext

  IMPLICIT NONE
  PRIVATE

  PUBLIC :: register_lib_$i

  CONTAINS

  SUBROUTINE register_lib_$i(pfad)
    IMPLICIT NONE
    CHARACTER(len=*), INTENT(IN) :: pfad

    CALL bindtextdomain(DOMAIN, pfad)
  END SUBROUTINE register_lib_$i

END MODULE ${filename}_lib$i
       
! vim:ai sw=4 expandtab

EOF
done

# vim:ai sw=2

