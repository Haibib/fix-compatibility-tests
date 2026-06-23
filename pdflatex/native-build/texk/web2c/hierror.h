/*461:*/
#line 10100 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#ifndef _ERROR_H
#define _ERROR_H
#include <stdlib.h> 
#include <stdio.h> 
extern FILE*hlog;
extern uint8_t*hpos,*hstart;
#ifndef LOG_PREFIX
#define LOG_PREFIX "HINT "
#endif
#line 10110 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
#define LOG(...) (fprintf(hlog,LOG_PREFIX __VA_ARGS__),fflush(hlog))
#define MESSAGE(...) (fprintf(hlog,LOG_PREFIX __VA_ARGS__),fflush(hlog))
#define QUIT(...)   (MESSAGE("ERROR: " __VA_ARGS__),fprintf(hlog,"\n"),exit(1))

#endif
#line 10115 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
/*:461*/
