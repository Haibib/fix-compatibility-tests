/*3:*/
#line 32 "../../../texlive-source/texk/web2c/mplibdir/mpmath.w"

#ifndef MPMATH_H
#define MPMATH_H 1
#include "pmplib.h"
#include "pmpmp.h" 
/*6:*/
#line 112 "../../../texlive-source/texk/web2c/mplibdir/mpmath.w"

void*mp_initialize_scaled_math(MP mp);
void mp_set_number_from_double(mp_number*A,double B);
void mp_pyth_add(MP mp,mp_number*r,mp_number a,mp_number b);
double mp_number_to_double(mp_number A);

/*:6*//*20:*/
#line 687 "../../../texlive-source/texk/web2c/mplibdir/mpmath.w"


mpinteger64 mp_take_fraction(MP mp,mpinteger64 q,integer64 f);

/*:20*//*24:*/
#line 776 "../../../texlive-source/texk/web2c/mplibdir/mpmath.w"


integer64 mp_make_scaled(MP mp,mpinteger64 p,mpinteger64 q);

/*:24*/
#line 37 "../../../texlive-source/texk/web2c/mplibdir/mpmath.w"

#endif
#line 39 "../../../texlive-source/texk/web2c/mplibdir/mpmath.w"

/*:3*/
