/*555:*/
#line 11639 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%{
#include "hibasetypes.h"
#include "hierror.h"
#include "hiformat.h"
#include "hiput.h"

/*464:*/
#line 10153 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#ifdef DEBUG
#define  YYDEBUG 1
extern int yydebug;
#else
#line 10158 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
#define YYDEBUG 0
#endif
#line 10160 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
/*:464*/
#line 11646 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#include "hiparser.h"

/*23:*/
#line 918 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_UDEC(S) yylval.u= strtoul(S,NULL,10)
/*:23*//*26:*/
#line 933 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_HEX(S) yylval.u= strtoul(S,NULL,16)
/*:26*//*29:*/
#line 951 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_DEC(S) yylval.i= strtol(S,NULL,10)
/*:29*//*32:*/
#line 995 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define MAX_STR    (1<<10) 
static char str_buffer[MAX_STR];
static int str_length;
#define STR_START      (str_length= 0)
#define STR_PUT(C) (str_buffer[str_length++]= (C))
#define STR_ADD(C) STR_PUT(C);RNG("String length",str_length,0,MAX_STR-1)
#define STR_END        str_buffer[str_length]= 0
#define SCAN_STR       yylval.s= str_buffer
/*:32*//*41:*/
#line 1117 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_UTF8_1(S)   yylval.u= ((S)[0]&0x7F)
/*:41*//*43:*/
#line 1133 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_UTF8_2(S)   yylval.u= (((S)[0]&0x1F)<<6)+((S)[1]&0x3F)
/*:43*//*45:*/
#line 1145 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_UTF8_3(S)   yylval.u= (((S)[0]&0x0F)<<12)+(((S)[1]&0x3F)<<6)+((S)[2]&0x3F)
/*:45*//*47:*/
#line 1157 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_UTF8_4(S)   yylval.u= (((S)[0]&0x07)<<18)+(((S)[1]&0x3F)<<12)+(((S)[2]&0x3F)<<6)+((S)[3]&0x3F)
/*:47*//*58:*/
#line 1347 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_DECFLOAT       yylval.f= atof(yytext)
/*:58*//*61:*/
#line 1379 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_HEXFLOAT       yylval.f= xtof(yytext)
/*:61*//*153:*/
#line 3222 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define SCAN_REF(K) yylval.rf.k= K; yylval.rf.n= atoi(yytext+2)
static int scan_level= 0;
#define SCAN_START          yy_push_state(INITIAL);if (1==scan_level++) hpos0= hpos;
#define SCAN_END            if (scan_level--) yy_pop_state(); else QUIT("Too many '>' in line %d",yylineno)
#line 3227 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
#define SCAN_TXT_START      BEGIN(TXT)
#define SCAN_TXT_END        BEGIN(INITIAL)
/*:153*/
#line 11649 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*62:*/
#line 1387 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


float64_t xtof(char*x)
{int sign,digits,exp;
uint64_t mantissa= 0;
DBG(DBGFLOAT,"converting %s:\n",x);
/*63:*/
#line 1404 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(*x=='-'){sign= -1;x++;}
else if(*x=='+'){sign= +1;x++;}
else sign= +1;
DBG(DBGFLOAT,"\tsign=%d\n",sign);
/*:63*/
#line 1393 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

x= x+2;
/*64:*/
#line 1413 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

digits= 0;
while(*x=='0')x++;
while(*x!='.')
{mantissa= mantissa<<4;
if(*x<'A')mantissa= mantissa+*x-'0';
else mantissa= mantissa+*x-'A'+10;
x++;
digits++;
}
x++;
exp= 0;
while(*x!=0&&*x!='x')
{mantissa= mantissa<<4;
exp= exp-4;
if(*x<'A')mantissa= mantissa+*x-'0';
else mantissa= mantissa+*x-'A'+10;
x++;
digits++;
}
DBG(DBGFLOAT,"\tdigits=%d mantissa=0x%"PRIx64", exp=%d\n",digits,mantissa,exp);
/*:64*/
#line 1395 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*65:*/
#line 1443 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(mantissa==0)return 0.0;
{int s;
s= digits-DBL_M_BITS/4;
if(s> 1)
mantissa= mantissa>>(4*(s-1));
else if(s<1)
mantissa= mantissa<<(4*(1-s));
exp= exp+4*(digits-1);
DBG(DBGFLOAT,"\tdigits=%d mantissa=0x%"PRIx64", exp=%d\n",digits,mantissa,exp);
while((mantissa>>DBL_M_BITS)> 1){mantissa= mantissa>>1;exp++;}
DBG(DBGFLOAT,"\tdigits=%d mantissa=0x%"PRIx64", exp=%d\n",digits,mantissa,exp);
mantissa= mantissa&~((uint64_t)1<<DBL_M_BITS);
DBG(DBGFLOAT,"\tdigits=%d mantissa=0x%"PRIx64", exp=%d\n",digits,mantissa,exp);
}
/*:65*/
#line 1396 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*66:*/
#line 1465 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(*x=='x')
{int s;
x++;
if(*x=='-'){s= -1;x++;}
else if(*x=='+'){s= +1;x++;}
else s= +1;
DBG(DBGFLOAT,"\texpsign=%d\n",s);
DBG(DBGFLOAT,"\texp=%d\n",exp);
while(*x!=0)
{if(*x<'A')exp= exp+4*s*(*x-'0');
else exp= exp+4*s*(*x-'A'+10);
x++;
DBG(DBGFLOAT,"\texp=%d\n",exp);
}
}
RNG("Floating point exponent",exp,-DBL_EXCESS,DBL_EXCESS);
/*:66*/
#line 1397 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*67:*/
#line 1487 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{union{float64_t d;uint64_t bits;}u;
if(sign<0)sign= 1;else sign= 0;
exp= exp+DBL_EXCESS;
u.bits= ((uint64_t)sign<<63)
|((uint64_t)exp<<DBL_M_BITS)|mantissa;
DBG(DBGFLOAT," return %f\n",u.d);
return u.d;
}
/*:67*/
#line 1398 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:62*/
#line 11650 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int yywrap(void){return 1;}
#ifdef _MSC_VER
#pragma  warning( disable : 4267)
#endif
#line 11655 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
%}

%option yylineno stack batch never-interactive
%option debug
%option nounistd nounput noinput noyy_top_state

/*24:*/
#line 922 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::HEX:<[0-9A-F]> :
/*:24*//*33:*/
#line 1017 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%x STR
/*:33*//*40:*/
#line 1114 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::UTF8_1:<[\x00-\x7F]> :
/*:40*//*42:*/
#line 1129 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::UTF8_2:<[\xC0-\xDF][\x80-\xBF]> :
/*:42*//*44:*/
#line 1141 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::UTF8_3:<[\xE0-\xEF][\x80-\xBF][\x80-\xBF]> :
/*:44*//*46:*/
#line 1153 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::UTF8_4:<[\xF0-\xF7][\x80-\xBF][\x80-\xBF][\x80-\xBF]> :
/*:46*//*150:*/
#line 3163 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%x TXT
/*:150*/
#line 11661 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


%%

/*3:*/
#line 377 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::"<":<SCAN_START;return START;> :
::">":<SCAN_END;return END;> :
::glyph:<return GLYPH;> :
::0|[1-9][0-9]*:<SCAN_UDEC(yytext);return UNSIGNED;> :
::\*(0|[1-9][0-9]*):<SCAN_UDEC(yytext+1);return REFERENCE;> :
::[[:space:]]:<;> :
::\([^()\n]*[)\n]:<;> :
/*:3*//*25:*/
#line 926 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::0x{HEX}+:<SCAN_HEX(yytext+2);return UNSIGNED;> :
/*:25*//*28:*/
#line 947 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::[+-](0|[1-9][0-9]*):<SCAN_DEC(yytext);return SIGNED;> :
/*:28*//*35:*/
#line 1025 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::':<STR_START;BEGIN(STR);> :
<STR> {
::':<STR_END;SCAN_STR;BEGIN(INITIAL);return STRING;> :
::'':<STR_ADD('\'');> :
::[\x20-\x7E]:<STR_ADD(yytext[0]);> :
::.:<RNG("String character",yytext[0],0x20,0x7E);> :
::\n:<QUIT("Unterminated String in line %d",yylineno);> :
}


/*:35*//*49:*/
#line 1183 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::''':<STR_START;STR_PUT('\'');BEGIN(STR);> :
::'''':<SCAN_UTF8_1(yytext+1);return CHARCODE;> :
::'[\x20-\x7E]'':<STR_START;STR_PUT(yytext[1]);STR_PUT('\'');BEGIN(STR);> :
::''''':<STR_START;STR_PUT('\'');STR_PUT('\'');BEGIN(STR);> :
::'{UTF8_1}':<SCAN_UTF8_1(yytext+1);return CHARCODE;> :
::'{UTF8_2}':<SCAN_UTF8_2(yytext+1);return CHARCODE;> :
::'{UTF8_3}':<SCAN_UTF8_3(yytext+1);return CHARCODE;> :
::'{UTF8_4}':<SCAN_UTF8_4(yytext+1);return CHARCODE;> :
/*:49*//*56:*/
#line 1300 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::[+-]?[0-9]+\.[0-9]+(e[+-]?[0-9])?:<SCAN_DECFLOAT;return FPNUM;> :
/*:56*//*60:*/
#line 1375 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::[+-]?0x{HEX}+\.{HEX}+(x[+-]?{HEX}+)?:<SCAN_HEXFLOAT;return FPNUM;> :
/*:60*//*81:*/
#line 1683 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::dimen:<return DIMEN;> :
::pt:<return PT;> :
::mm:<return MM;> :
::in:<return INCH;> :
/*:81*//*89:*/
#line 1782 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::xdimen:<return XDIMEN;> :
::h:<return H;> :
::v:<return V;> :
/*:89*//*100:*/
#line 1964 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::fil:<return FIL;> :
::fill:<return FILL;> :
::filll:<return FILLL;> :
/*:100*//*104:*/
#line 2024 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::penalty:<return PENALTY;> :
::int:<return INTEGER;> :
/*:104*//*110:*/
#line 2100 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::language:<return LANGUAGE;> :
/*:110*//*116:*/
#line 2201 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::rule:<return RULE;> :
::"|":<return RUNNING;> :
::"_":<return RUNNING;> :
/*:116*//*125:*/
#line 2315 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::kern:<return KERN;> :
::!:<return EXPLICIT;> :
/*:125*//*134:*/
#line 2526 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::glue:<return GLUE;> :
::plus:<return PLUS;> :
::minus:<return MINUS;> :
/*:134*//*152:*/
#line 3176 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::\":<SCAN_TXT_START;return TXT_START;> :

<TXT> {
::\":<SCAN_TXT_END;return TXT_END;> :

::"<":<SCAN_START;return START;> :
::">":<QUIT("> not allowed in text mode");> :

::\\\\:<yylval.u= '\\';return TXT_CC;> :
::\\\":<yylval.u= '"';return TXT_CC;> :
::\\"<":<yylval.u= '<';return TXT_CC;> :
::\\">":<yylval.u= '>';return TXT_CC;> :
::\\" ":<yylval.u= ' ';return TXT_CC;> :
::\\"-":<yylval.u= '-';return TXT_CC;> :
::\\"@":<return TXT_IGNORE;> :

::[ \t\r]*(\n[ \t\r]*)+:<return TXT_FONT_GLUE;> :
::\\[ \t\r]*\n[ \t\r]*:<;> :

::\\[0-7]:<yylval.u= yytext[1]-'0';return TXT_FONT;> :

::\\F[0-9]+\\:<SCAN_REF(font_kind);return TXT_GLOBAL;> :
::\\P[0-9]+\\:<SCAN_REF(penalty_kind);return TXT_GLOBAL;> :
::\\K[0-9]+\\:<SCAN_REF(kern_kind);return TXT_GLOBAL;> :
::\\L[0-9]+\\:<SCAN_REF(ligature_kind);return TXT_GLOBAL;> :
::\\D[0-9]+\\:<SCAN_REF(disc_kind);return TXT_GLOBAL;> :
::\\G[0-9]+\\:<SCAN_REF(glue_kind);return TXT_GLOBAL;> :
::\\S[0-9]+\\:<SCAN_REF(language_kind);return TXT_GLOBAL;> :
::\\R[0-9]+\\:<SCAN_REF(rule_kind);return TXT_GLOBAL;> :
::\\I[0-9]+\\:<SCAN_REF(image_kind);return TXT_GLOBAL;> :


::\\C[0-9]+\\:<SCAN_UDEC(yytext+2);return TXT_CC;> :

::\\[a-l]:<yylval.u= yytext[1]-'a';return TXT_LOCAL;> :
::" ":<return TXT_FONT_GLUE;> :
::"-":<return TXT_FONT_HYPHEN;> :

::{UTF8_1}:<SCAN_UTF8_1(yytext);return TXT_CC;> :
::{UTF8_2}:<SCAN_UTF8_2(yytext);return TXT_CC;> :
::{UTF8_3}:<SCAN_UTF8_3(yytext);return TXT_CC;> :
::{UTF8_4}:<SCAN_UTF8_4(yytext);return TXT_CC;> :
}
/*:152*//*162:*/
#line 3494 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::hbox:<return HBOX;> :
::vbox:<return VBOX;> :
::shifted:<return SHIFTED;> :
/*:162*//*170:*/
#line 3700 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::hpack:<return HPACK;> :
::hset:<return HSET;> :
::vpack:<return VPACK;> :
::vset:<return VSET;> :
::add:<return ADD;> :
::to:<return TO;> :
::depth:<return DEPTH;> :
/*:170*//*175:*/
#line 3845 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::leaders:<return LEADERS;> :
::align:<return ALIGN;> :
::center:<return CENTER;> :
::expand:<return EXPAND;> :
/*:175*//*182:*/
#line 3957 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::baseline:<return BASELINE;> :
/*:182*//*189:*/
#line 4046 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::ligature:<return LIGATURE;> :
/*:189*//*197:*/
#line 4164 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::disc:<return DISC;> :
/*:197*//*205:*/
#line 4317 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::par:<return PAR;> :
/*:205*//*210:*/
#line 4398 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::math:<return MATH;> :
/*:210*//*215:*/
#line 4454 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::on:<return ON;> :
::off:<return OFF;> :
/*:215*//*219:*/
#line 4487 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::adjust:<return ADJUST;> :
/*:219*//*223:*/
#line 4583 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::table:<return TABLE;> :
::item:<return ITEM;> :
::row:<return ITEM;> :
::column:<return ITEM;> :
/*:223*//*230:*/
#line 4730 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::image:<return IMAGE;> :
::width:<return WIDTH;> :
::height:<return HEIGHT;> :
/*:230*//*255:*/
#line 5482 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::label:<return LABEL;> :
::bot:<return BOT;> :
::mid:<return MID;> :
/*:255*//*269:*/
#line 5776 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::link:<return LINK;> :
/*:269*//*279:*/
#line 5911 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::outline:<return OUTLINE;> :
/*:279*//*288:*/
#line 6165 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::color:<return COLOR;> :
/*:288*//*301:*/
#line 6431 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::unknown:<return UNKNOWN;> :
/*:301*//*310:*/
#line 6883 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::stream:<if(section_no==1)return STREAMDEF;else return STREAM;> :
::first:<return FIRST;> :
::last:<return LAST;> :
::top:<return TOP;> :
::\*:<return NOREFERENCE;> :
/*:310*//*320:*/
#line 7099 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::page:<return PAGE;> :
/*:320*//*328:*/
#line 7217 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::range:<return RANGE;> :
/*:328*//*355:*/
#line 7920 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::directory:<return DIRECTORY;> :
::section:<return SECTION;> :
/*:355*//*378:*/
#line 8481 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::definitions:<return DEFINITIONS;> :
/*:378*//*386:*/
#line 8599 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::max:<return MAX;> :
/*:386*//*401:*/
#line 8979 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::param:<return PARAM;> :
/*:401*//*410:*/
#line 9144 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::font:<return FONT;> :
/*:410*//*443:*/
#line 9754 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::content:<return CONTENT;> :
/*:443*/
#line 11665 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

::[a-z]+:<QUIT("Unexpected keyword '%s' in line %d",yytext,yylineno);> :
::.:<QUIT("Unexpected character '%c' (0x%02X) in line %d",yytext[0]> ' '?yytext[0]:' ',yytext[0],yylineno);> :

%%
/*:555*/
