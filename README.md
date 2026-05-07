# make_fortran

This is a template program in FORTRAN written using Makefiles

## Getting started

```
make
```

## Caveats

Don't call a module project.f90 in src, because it will be overwritten by make.
Don't call a subdirectory of src mod. It is used to contain the .mod files.
