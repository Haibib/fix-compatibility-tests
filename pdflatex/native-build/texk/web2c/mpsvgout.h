/*3:*/
#line 77 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

#ifndef MPSVGOUT_H
#define MPSVGOUT_H 1
#include "mplib.h"
#include "mpmp.h"
#include "mplibps.h"
typedef struct svgout_data_struct{
/*6:*/
#line 110 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

size_t file_offset;

/*:6*//*12:*/
#line 162 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

char*buf;
unsigned loc;
unsigned bufsize;

/*:12*//*20:*/
#line 296 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

int level;

/*:20*//*27:*/
#line 383 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

double dx;
double dy;


/*:27*//*56:*/
#line 1157 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

int clipid;

/*:56*/
#line 84 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

}svgout_data_struct;
/*4:*/
#line 89 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

void mp_svg_backend_initialize(MP mp);
void mp_svg_backend_free(MP mp);

/*:4*//*60:*/
#line 1207 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

int mp_svg_gr_ship_out(mp_edge_object*hh,int prologues,int standalone);

/*:60*/
#line 86 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

#endif
#line 88 "../../../texlive-source/texk/web2c/mplibdir/svgout.w"

/*:3*/
