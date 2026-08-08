#!/usr/bin/env sh

# erzeugt Samstag, 08. August 2026 06:19 (C) 2026 von Leander Jedamus
# modifiziert Samstag, 08. August 2026 07:01 von Leander Jedamus

sed \
  -e "s/program/PROGRAM/g" \
  -e "s/module/MODULE/g" \
  -e "s/use/USE/g" \
  -e "s/intrinsic/INTRINSIC/g" \
  -e "s/iso_c_binding/ISO_C_BINDING/g" \
  -e "s/implicit/IMPLICIT/g" \
  -e "s/none/NONE/g" \
  -e "s/private/PRIVATE/g" \
  -e "s/public/PUBLIC/g" \
  -e "s/abstract/ABSTRACT/g" \
  -e "s/interface/INTERFACE/g" \
  -e "s/contains/CONTAINS/g" \
  -e "s/import/IMPORT/g" \
  -e "s/block/BLOCK/g" \
  -e "s/bind(c/BIND(C/g" \
  -e "s/bind/BIND/g" \
  -e "s/save/SAVE/g" \
  -e "s/subroutine/SUBROUTINE/g" \
  -e "s/procedure/PROCEDURE/g" \
  -e "s/function/FUNCTION/g" \
  -e "s/result/RESULT/g" \
  -e "s/pointer/POINTER/g" \
  -e "s/parameter/PARAMETER/g" \
  -e "s/allocatable/ALLOCATABLE/g" \
  -e "s/kind/KIND/g" \
  -e "s/intent/INTENT/g" \
  -e "s/(in)/(IN)/g" \
  -e "s/(out)/(OUT)/g" \
  -e "s/(inout)/(INOUT)/g" \
  -e "s/name=/NAME=/g" \
  -e "s/integer/INTEGER/g" \
  -e "s/real/REAL/g" \
  -e "s/complex/COMPLEX/g" \
  -e "s/logical/LOGICAL/g" \
  -e "s/error/ERROR/g" \
  -e "s/stop/STOP/g" \
  -e "s/type/TYPE/g" \
  -e "s/value/VALUE/g" \
  -e "s/write/WRITE/g" \
  -e "s/print/PRINT/g" \
  -e "s/end /END /g" \
  -e "s/if /IF /g" \
  -e "s/if$/IF/" \
  -e "s/then/THEN/g" \
  -e "s/else/ELSE/g" \
  -e "s/do /DO /g" \
  -e "s/do$/DO/g" \
  -e "s/exit/EXIT/g" \
  -e "s/return/RETURN/g" \
  -e "s/call /CALL /g" \
  -e "s/\.not\./.NOT./g" \
  -e "s/\.and\./.AND./g" \
  -e "s/\.or\./.OR./g" \
  -e "s/PROGRAMm/programm/g" \
  -e "s/PRINTf/printf/g" \
  -e "s/c_f_POINTER/c_f_pointer/g" \
  -e "s/c_f_procPOINTER/c_f_procpointer/g" \
  -e "s/INTEGERs/integers/g" \
  -e "s/NULLify/nullify/g" \
  -e "s/TYPEdef/typedef/g" \
  -e "s/RETURN /return /g"

# vim:ai sw=2

