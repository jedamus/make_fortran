# make_fortran

This is a template program in FORTRAN written using Makefiles

## Getting started

```
make
```

## Caveats

Don't call a subdirectory of src mod. It is used to contain the .mod files.
Don't call a module project.f90 in src, because it will be overwritten by make.
Don't call a module my_register.F90 in src, because it will be overwritten by
create_register.sh.
Don't call a header file gettext.h in src, because it will be overwritten by
create_register.sh.
Don't call a module my_register_liboutput.F90 in src/lib/output, if output is the name of your library, because it will be overwritten by create_register.sh.
