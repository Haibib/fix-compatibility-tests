/*556:*/
#line 11680 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%{
#include "hibasetypes.h"
#include <string.h> 
#include <math.h> 
#include "hierror.h"
#include "hiformat.h"
#include "hiput.h"
extern char**hfont_name;

/*392:*/
#line 8789 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

uint32_t definition_bits[0x100/32][32]= {{0}};

#define SET_DBIT(N,K) ((N)> 0xFF?1:(definition_bits[N/32][K]|= (1<<((N)&(32-1)))))
#define GET_DBIT(N,K) ((N)> 0xFF?1:((definition_bits[N/32][K]>>((N)&(32-1)))&1))
#define DEF(D,K,N) (D).k= K; (D).n= (N);SET_DBIT((D).n,(D).k);\
 DBG(DBGDEF,"Defining %s %d\n",definition_name[(D).k],(D).n);\
 RNG("Definition",(D).n,max_fixed[(D).k]+1,max_ref[(D).k]);
#define REF(K,N) REF_RNG(K,N);if(!GET_DBIT(N,K)) \
 QUIT("Reference %d to %s before definition",(N),definition_name[K])
/*:392*//*396:*/
#line 8851 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define DEF_REF(D,K,M,N)  DEF(D,K,M);\
if ((int)(M)> max_default[K]) QUIT("Defining non default reference %d for %s",M,definition_name[K]); \
if ((int)(N)> max_fixed[K]) QUIT("Defining reference %d for %s by non fixed reference %d",M,definition_name[K],N);
/*:396*/
#line 11690 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


extern void hset_entry(Entry*e,uint16_t i,uint32_t size,
uint32_t xsize,char*file_name);

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
#line 11695 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

extern int yylex(void);

/*388:*/
#line 8629 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hset_max(Kind k,int n)
{DBG(DBGDEF,"Setting max %s to %d\n",definition_name[k],n);
RNG("Maximum",n,max_fixed[k]+1,MAX_REF(k));
if(n> max_ref[k])
max_ref[k]= n;
}
/*:388*//*399:*/
#line 8949 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void check_param_def(Ref*df)
{if(df->k!=int_kind&&df->k!=dimen_kind&&df->k!=glue_kind)
QUIT("Kind %s not allowed in parameter list",definition_name[df->k]);
if(df->n<=max_fixed[df->k]||max_default[df->k]<df->n)
QUIT("Parameter %d for %s not allowed in parameter list",df->n,definition_name[df->k]);
}
/*:399*//*463:*/
#line 10144 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

extern int yylineno;
int yyerror(const char*msg)
{QUIT(" in line %d %s",yylineno,msg);
return 0;
}
/*:463*/
#line 11698 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


%}





%union{uint32_t u;int32_t i;char*s;float64_t f;Glyph c;
Dimen d;Stretch st;Xdimen xd;Kern kt;
Rule r;Glue g;Image x;
List l;Box h;Disc dc;Lig lg;
Ref rf;Info info;Order o;bool b;
}



%define parse.error verbose
%start hint

/*2:*/
#line 365 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token START"<"
%token END">"
%token GLYPH"glyph"
%token<u> UNSIGNED
%token<u> REFERENCE
/*:2*//*4:*/
#line 418 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%type<u> start
%type<c> glyph
/*:4*//*27:*/
#line 942 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token<i> SIGNED
%type<i> integer
/*:27*//*34:*/
#line 1021 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token<s> STRING
/*:34*//*48:*/
#line 1179 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token<u> CHARCODE
/*:48*//*50:*/
#line 1198 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%type<s> string
/*:50*//*55:*/
#line 1296 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token<f> FPNUM
%type<f> number
/*:55*//*80:*/
#line 1675 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token DIMEN"dimen"
%token PT"pt"
%token MM"mm"
%token INCH"in"
%type<d> dimension
/*:80*//*88:*/
#line 1776 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token XDIMEN"xdimen"
%token H"h"
%token V"v"
%type<xd> xdimen
/*:88*//*99:*/
#line 1956 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token FIL"fil"
%token FILL"fill"
%token FILLL"filll"
%type<st> stretch
%type<o> order
/*:99*//*103:*/
#line 2018 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token PENALTY"penalty"
%token INTEGER"int"
%type<i> penalty
/*:103*//*109:*/
#line 2096 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token LANGUAGE"language"
/*:109*//*115:*/
#line 2194 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token RULE"rule"
%token RUNNING"|"
%type<d> rule_dimension
%type<r> rule
/*:115*//*124:*/
#line 2308 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token KERN"kern"
%token EXPLICIT"!"
%type<b> explicit
%type<kt> kern
/*:124*//*133:*/
#line 2517 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token GLUE"glue"
%token PLUS"plus"
%token MINUS"minus"
%type<g> glue
%type<b> glue_node
%type<st> plus minus
/*:133*//*142:*/
#line 2808 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%type<l> list
%type<u> position content_list
/*:142*//*151:*/
#line 3167 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token TXT_START TXT_END TXT_IGNORE
%token TXT_FONT_GLUE TXT_FONT_HYPHEN
%token<u> TXT_FONT TXT_LOCAL
%token<rf> TXT_GLOBAL
%token<u> TXT_CC
%type<u> text
/*:151*//*161:*/
#line 3487 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token HBOX"hbox"
%token VBOX"vbox"
%token SHIFTED"shifted"
%type<info> box box_dimen box_shift box_glue_set

/*:161*//*169:*/
#line 3688 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token HPACK"hpack"
%token HSET"hset"
%token VPACK"vpack"
%token VSET"vset"
%token DEPTH"depth"
%token ADD"add"
%token TO"to"
%type<info> box_options box_goal hpack vpack vbox_dimen
%type<d> max_depth
/*:169*//*174:*/
#line 3836 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token LEADERS"leaders"
%token ALIGN"align"
%token CENTER"center"
%token EXPAND"expand"
%type<info> leaders
%type<info> ltype
/*:174*//*181:*/
#line 3953 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token BASELINE"baseline"
%type<info> baseline
/*:181*//*188:*/
#line 4040 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token LIGATURE"ligature"
%type<u> lig_cc
%type<lg> ligature
%type<u> ref
/*:188*//*196:*/
#line 4159 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token DISC"disc"
%type<dc> disc
%type<u> replace_count
/*:196*//*204:*/
#line 4312 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token PAR"par"
%type<info> par
/*:204*//*209:*/
#line 4393 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token MATH"math"
%type<info> math
/*:209*//*214:*/
#line 4448 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token ON"on"
%token OFF"off"
%type<i> on_off
/*:214*//*218:*/
#line 4483 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token ADJUST"adjust"
/*:218*//*222:*/
#line 4577 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token TABLE"table"
%token ITEM"item"
%type<info> table span_count
/*:222*//*229:*/
#line 4721 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token IMAGE"image"
%token WIDTH"width"
%token HEIGHT"height"
%type<xd> image_width image_height
%type<f> image_aspect
%type<info> image_spec image
/*:229*//*254:*/
#line 5475 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token LABEL"label"
%token BOT"bot"
%token MID"mid"
%type<i> placement
/*:254*//*268:*/
#line 5773 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token LINK"link"
/*:268*//*278:*/
#line 5907 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token OUTLINE"outline"
/*:278*//*287:*/
#line 6161 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token COLOR"color"
/*:287*//*300:*/
#line 6427 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token UNKNOWN"unknown"
/*:300*//*303:*/
#line 6449 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%type<u> unknown_bytes
%type<u> unknown_nodes
/*:303*//*309:*/
#line 6871 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token STREAM"stream"
%token STREAMDEF"stream (definition)"
%token FIRST"first"
%token LAST"last"
%token TOP"top"
%token NOREFERENCE"*"
%type<info> stream_type
%type<u> stream_ref
%type<rf> stream_def_node
/*:309*//*315:*/
#line 6993 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%type<info> stream
/*:315*//*319:*/
#line 7095 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token PAGE"page"
/*:319*//*327:*/
#line 7213 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token RANGE"range"
/*:327*//*354:*/
#line 7915 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token DIRECTORY"directory"
%token SECTION"entry"
/*:354*//*377:*/
#line 8477 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token DEFINITIONS"definitions"
/*:377*//*385:*/
#line 8595 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token MAX"max"
/*:385*//*394:*/
#line 8820 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


%type<rf> def_node
/*:394*//*400:*/
#line 8973 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token PARAM"param"
%type<u> def_list
%type<l> parameters
/*:400*//*409:*/
#line 9139 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token FONT"font"
%type<info> font font_head
/*:409*//*442:*/
#line 9750 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%token CONTENT"content"
/*:442*/
#line 11718 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%%
/*5:*/
#line 423 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

glyph:UNSIGNED REFERENCE{$$.c= $1;REF(font_kind,$2);$$.f= $2;};
content_node:start GLYPH glyph END{hput_tags($1,hput_glyph(&($3)));};
start:START{HPUTNODE;$$= (uint32_t)(hpos++-hstart);}
/*:5*//*30:*/
#line 955 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

integer:SIGNED|UNSIGNED{RNG("number",$1,0,0x7FFFFFFF);};
/*:30*//*39:*/
#line 1097 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

glyph:CHARCODE REFERENCE{$$.c= $1;REF(font_kind,$2);$$.f= $2;};
/*:39*//*51:*/
#line 1202 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

string:STRING|CHARCODE{static char s[2];
RNG("String element",$1,0x20,0x7E);
s[0]= $1;s[1]= 0;$$= s;};
/*:51*//*59:*/
#line 1355 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

number:UNSIGNED{$$= (float64_t)$1;}|SIGNED{$$= (float64_t)$1;}|FPNUM;
/*:59*//*83:*/
#line 1709 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

dimension:number PT{$$= ROUND($1*ONE);RNG("Dimension",$$,-MAX_DIMEN,MAX_DIMEN);}
|number INCH{$$= ROUND($1*ONE*72.27);RNG("Dimension",$$,-MAX_DIMEN,MAX_DIMEN);}
|number MM{$$= ROUND($1*ONE*(72.27/25.4));RNG("Dimension",$$,-MAX_DIMEN,MAX_DIMEN);};
/*:83*//*90:*/
#line 1789 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

xdimen:dimension number H number V{$$.w= $1;$$.h= $2;$$.v= $4;}
|dimension number H{$$.w= $1;$$.h= $2;$$.v= 0.0;}
|dimension number V{$$.w= $1;$$.h= 0.0;$$.v= $2;}
|dimension{$$.w= $1;$$.h= 0.0;$$.v= 0.0;};

xdimen_node:start XDIMEN xdimen END{hput_tags($1,hput_xdimen(&($3)));};
/*:90*//*101:*/
#line 1972 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


order:PT{$$= normal_o;}|FIL{$$= fil_o;}|FILL{$$= fill_o;}|FILLL{$$= filll_o;};

stretch:number order{$$.f= $1;$$.o= $2;};
/*:101*//*105:*/
#line 2029 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

penalty:integer{RNG("Penalty",$1,-20000,+20000);$$= $1;};
content_node:start PENALTY penalty END{hput_tags($1,hput_int($3));};
/*:105*//*117:*/
#line 2207 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

rule_dimension:dimension|RUNNING{$$= RUNNING_DIMEN;};
rule:rule_dimension rule_dimension rule_dimension
{$$.h= $1;$$.d= $2;$$.w= $3;
if($3==RUNNING_DIMEN&&($1==RUNNING_DIMEN||$2==RUNNING_DIMEN))
QUIT("Incompatible running dimensions 0x%x 0x%x 0x%x",$1,$2,$3);};
rule_node:start RULE rule END{hput_tags($1,hput_rule(&($3)));};
content_node:rule_node;
/*:117*//*126:*/
#line 2320 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

explicit:{$$= false;}|EXPLICIT{$$= true;};
kern:explicit xdimen{$$.x= $1;$$.d= $2;};
content_node:start KERN kern END{hput_tags($1,hput_kern(&($3)));}
/*:126*//*135:*/
#line 2532 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

plus:{$$.f= 0.0;$$.o= 0;}|PLUS stretch{$$= $2;};
minus:{$$.f= 0.0;$$.o= 0;}|MINUS stretch{$$= $2;};
glue:xdimen plus minus{$$.w= $1;$$.p= $2;$$.m= $3;};
content_node:start GLUE glue END{if(ZERO_GLUE($3)){HPUT8(zero_skip_no);
hput_tags($1,TAG(glue_kind,0));}else hput_tags($1,hput_glue(&($3)));};
glue_node:start GLUE glue END
{if(ZERO_GLUE($3)){hpos--;$$= false;}
else{hput_tags($1,hput_glue(&($3)));$$= true;}};
/*:135*//*143:*/
#line 2813 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

position:{$$= hpos-hstart;};
content_list:position
|content_list content_node;
estimate:{hpos+= 2;}
|UNSIGNED{hpos+= hsize_bytes($1)+1;};
list:start estimate content_list END
{$$.t= TAG(list_kind,b010);$$.p= $3;$$.s= (hpos-hstart)-$3;
hput_tags($1,hput_list($1+1,&($$)));};
/*:143*//*154:*/
#line 3232 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

list:TXT_START position
{hpos+= 4;}
text TXT_END
{$$.t= TAG(list_kind,b110);$$.p= $4;$$.s= (hpos-hstart)-$4;
hput_tags($2,hput_list($2+1,&($$)));};
text:position|text txt;

txt:TXT_CC{hput_txt_cc($1);}
|TXT_FONT{REF(font_kind,$1);hput_txt_font($1);}
|TXT_GLOBAL{REF($1.k,$1.n);hput_txt_global(&($1));}
|TXT_LOCAL{RNG("Font parameter",$1,0,11);hput_txt_local($1);}
|TXT_FONT_GLUE{HPUTX(1);HPUT8(txt_glue);}
|TXT_FONT_HYPHEN{HPUTX(1);HPUT8(txt_hyphen);}
|TXT_IGNORE{HPUTX(1);HPUT8(txt_ignore);}
|{HPUTX(1);HPUT8(txt_node);}content_node;
/*:154*//*163:*/
#line 3500 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


box_dimen:dimension dimension dimension
{$$= hput_box_dimen($1,$2,$3);};
box_shift:{$$= b000;}
|SHIFTED dimension{$$= hput_box_shift($2);};

box_glue_set:{$$= b000;}
|PLUS stretch{$$= hput_box_glue_set(+1,$2.f,$2.o);}
|MINUS stretch{$$= hput_box_glue_set(-1,$2.f,$2.o);};


box:box_dimen box_shift box_glue_set list{$$= $1|$2|$3;};

hbox_node:start HBOX box END{hput_tags($1,TAG(hbox_kind,$3));};
vbox_node:start VBOX box END{hput_tags($1,TAG(vbox_kind,$3));};
content_node:hbox_node|vbox_node;
/*:163*//*171:*/
#line 3710 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

box_flex:plus minus{hput_stretch(&($1));hput_stretch(&($2));};

box_options:box_shift box_flex xdimen_ref list{$$= $1;}
|box_shift box_flex xdimen_node list{$$= $1|b100;};

hxbox_node:start HSET box_dimen box_options END{hput_tags($1,TAG(hset_kind,$3|$4));};

vbox_dimen:box_dimen
|TOP dimension dimension dimension
{$$= hput_box_dimen($2,$3^0x40000000,$4);};

vxbox_node:start VSET vbox_dimen box_options END{hput_tags($1,TAG(vset_kind,$3|$4));};

box_goal:TO xdimen_ref{$$= b000;}
|ADD xdimen_ref{$$= b001;}
|TO xdimen_node{$$= b100;}
|ADD xdimen_node{$$= b101;};

hpack:box_shift box_goal list{$$= $2;};

hxbox_node:start HPACK hpack END{hput_tags($1,TAG(hpack_kind,$3));};

max_depth:{$$= MAX_DIMEN;}|MAX DEPTH dimension{$$= $3;};

vpack:max_depth{HPUT32($1);}box_shift box_goal list{$$= $3|$4;}
|TOP max_depth{HPUT32($2^0x40000000);}box_shift box_goal list{$$= $4|$5;};

vxbox_node:start VPACK vpack END{hput_tags($1,TAG(vpack_kind,$3));};

content_node:vxbox_node|hxbox_node;
/*:171*//*176:*/
#line 3851 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

ltype:{$$= 1;}|ALIGN{$$= 1;}|CENTER{$$= 2;}|EXPAND{$$= 3;};
leaders:glue_node ltype rule_node{if($1)$$= $2|b100;else $$= $2;}
|glue_node ltype hbox_node{if($1)$$= $2|b100;else $$= $2;}
|glue_node ltype vbox_node{if($1)$$= $2|b100;else $$= $2;};
content_node:start LEADERS leaders END{hput_tags($1,TAG(leaders_kind,$3));}
/*:176*//*183:*/
#line 3961 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

baseline:dimension{if($1!=0)HPUT32($1);}
glue_node glue_node{$$= b000;if($1!=0)$$|= b001;
if($3)$$|= b100;
if($4)$$|= b010;
};
content_node:start BASELINE baseline END
{if($3==b000)HPUT8(0);hput_tags($1,TAG(baseline_kind,$3));};
/*:183*//*190:*/
#line 4050 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

cc_list:|cc_list TXT_CC{hput_utf8($2);};
lig_cc:UNSIGNED{RNG("UTF-8 code",$1,0,0x1FFFFF);$$= hpos-hstart;hput_utf8($1);};
lig_cc:CHARCODE{$$= hpos-hstart;hput_utf8($1);};
ref:REFERENCE{HPUT8($1);$$= $1;};
ligature:ref{REF(font_kind,$1);}lig_cc TXT_START cc_list TXT_END
{$$.f= $1;$$.l.p= $3;$$.l.s= (hpos-hstart)-$3;
RNG("Ligature size",$$.l.s,0,255);};
content_node:start LIGATURE ligature END{hput_tags($1,hput_ligature(&($3)));};
/*:190*//*198:*/
#line 4168 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

replace_count:explicit{if($1){$$= 0x80;HPUT8(0x80);}else $$= 0x00;}
|explicit UNSIGNED{RNG("Replace count",$2,0,31);
$$= ($2)|(($1)?0x80:0x00);if($$!=0)HPUT8($$);};
disc:replace_count list list{$$.r= $1;$$.p= $2;$$.q= $3;
if($3.s==0){hpos= hpos-3;if($2.s==0)hpos= hpos-3;}}
|replace_count list{$$.r= $1;$$.p= $2;if($2.s==0)hpos= hpos-3;$$.q.s= 0;}
|replace_count{$$.r= $1;$$.p.s= 0;$$.q.s= 0;};


disc_node:start DISC disc END
{hput_tags($1,hput_disc(&($3)));};

content_node:disc_node;
/*:198*//*206:*/
#line 4330 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

par_dimen:xdimen{hput_xdimen_node(&($1));};
par:xdimen_ref param_ref list{$$= b000;}
|xdimen_ref param_list list{$$= b010;}
|xdimen param_ref{hput_xdimen_node(&($1));}list{$$= b100;}
|par_dimen param_list list{$$= b110;};

content_node:start PAR par END{hput_tags($1,TAG(par_kind,$3));};
/*:206*//*211:*/
#line 4402 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

math:param_ref list{$$= b000;}
|param_ref list hbox_node{$$= b001;}
|param_ref hbox_node list{$$= b010;}
|param_list list{$$= b100;}
|param_list list hbox_node{$$= b101;}
|param_list hbox_node list{$$= b110;};

content_node:start MATH math END{hput_tags($1,TAG(math_kind,$3));};
/*:211*//*216:*/
#line 4459 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

on_off:ON{$$= 1;}|OFF{$$= 0;};
math:on_off{$$= b011|($1<<2);};
/*:216*//*220:*/
#line 4491 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

content_node:start ADJUST list END{hput_tags($1,TAG(adjust_kind,1));};
/*:220*//*224:*/
#line 4590 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

span_count:UNSIGNED{$$= hput_span_count($1);};
content_node:start ITEM content_node END{hput_tags($1,TAG(item_kind,1));};
content_node:start ITEM span_count content_node END{hput_tags($1,TAG(item_kind,$3));};
content_node:start ITEM list END{hput_tags($1,TAG(item_kind,b000));};

table:H box_goal list list{$$= $2;};
table:V box_goal list list{$$= $2|b010;};

content_node:start TABLE table END{hput_tags($1,TAG(table_kind,$3));};
/*:224*//*231:*/
#line 4736 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

image_aspect:number{$$= $1;}|{$$= 0.0;};
image_width:WIDTH xdimen{$$= $2;}
|{$$= xdimen_defaults[zero_xdimen_no];};
image_height:HEIGHT xdimen{$$= $2;}
|{$$= xdimen_defaults[zero_xdimen_no];};

image_spec:UNSIGNED image_aspect image_width image_height
{$$= hput_image_spec($1,$2,0,&($3),0,&($4));}
|UNSIGNED image_aspect WIDTH REFERENCE image_height
{$$= hput_image_spec($1,$2,$4,NULL,0,&($5));}
|UNSIGNED image_aspect image_width HEIGHT REFERENCE
{$$= hput_image_spec($1,$2,0,&($3),$5,NULL);}
|UNSIGNED image_aspect WIDTH REFERENCE HEIGHT REFERENCE
{$$= hput_image_spec($1,$2,$4,NULL,$6,NULL);};

image:image_spec list{$$= $1;};

content_node:start IMAGE image END{hput_tags($1,TAG(image_kind,$3));};
/*:231*//*249:*/
#line 5397 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_value:OUTLINE UNSIGNED{max_outline= $2;
RNG("max outline",max_outline,0,0xFFFF);
DBG(DBGDEF|DBGLABEL,"Setting max outline to %d\n",max_outline);
};
/*:249*//*256:*/
#line 5490 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

placement:TOP{$$= LABEL_TOP;}|BOT{$$= LABEL_BOT;}|MID{$$= LABEL_MID;}|{$$= LABEL_MID;};
content_node:START LABEL REFERENCE placement END
{hset_label($3,$4);};
/*:256*//*270:*/
#line 5780 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

content_node:start LINK REFERENCE on_off END
{hput_tags($1,hput_link($3,$4?1:0xFF,$4));};
content_node:start LINK REFERENCE on_off REFERENCE END
{hput_tags($1,hput_link($3,$5,$4));};
/*:270*//*280:*/
#line 5915 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

def_node:START OUTLINE REFERENCE integer position list END{
static int outline_no= -1;
$$.k= outline_kind;$$.n= $3;
if($6.s==0)QUIT("Outline with empty title in line %d",yylineno);
outline_no++;
hset_outline(outline_no,$3,$4,$5);
};
/*:280*//*291:*/
#line 6204 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

color:START UNSIGNED UNSIGNED UNSIGNED UNSIGNED END
{RNG("red",$2,0,0xFF);RNG("green",$3,0,0xFF);
RNG("blue",$4,0,0xFF);RNG("alpha",$5,0,0xFF);
colors_n[colors_i++]= ($2<<24)|($3<<16)|($4<<8)|$5;
}
|START UNSIGNED UNSIGNED UNSIGNED END
{RNG("red",$2,0,0xFF);RNG("green",$3,0,0xFF);
RNG("blue",$4,0,0xFF);
colors_n[colors_i++]= ($2<<24)|($3<<16)|($4<<8)|0xFF;
};
color:UNSIGNED{colors_n[colors_i++]= $1;};
/*:291*//*292:*/
#line 6223 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

color_pair:START color color END
|START color END{colors_n[colors_i++]= 0;};
color_unset:{colors_i+= 2;};
/*:292*//*293:*/
#line 6247 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

color_tripple:START color_pair color_unset color_unset END
|START color_pair color_pair color_unset END
|START color_pair color_pair color_pair END
;

color_set:color_tripple color_tripple;
color_set:color_tripple color_unset color_unset color_unset;

def_node:start COLOR ref{HPUT8(6);color_init();}color_set END
{DEF($$,color_kind,$3);hput_color_def($1,$3);};
/*:293*//*296:*/
#line 6309 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

content_node:start COLOR ref END
{REF_RNG(color_kind,$3);hput_tags($1,TAG(color_kind,b000));};
content_node:start COLOR OFF END
{HPUT8(0xFF);hput_tags($1,TAG(color_kind,b000));};
/*:296*//*302:*/
#line 6440 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

def_node:start UNKNOWN UNSIGNED UNSIGNED END{hput_tags($1,hput_unknown_def($3,$4,0));}
|start UNKNOWN UNSIGNED UNSIGNED UNSIGNED END{hput_tags($1,hput_unknown_def($3,$4,$5));};
/*:302*//*304:*/
#line 6453 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

content_node:start UNKNOWN UNSIGNED unknown_bytes unknown_nodes END{hput_tags($1,hput_unknown($1,$3,$4,$5));}
unknown_bytes:{$$= 0;}|unknown_bytes UNSIGNED{RNG("byte",$2,0,0xFF);HPUT8($2);$$= $1+1;};
unknown_node:content_node|xdimen_node|list|named_param_list;
unknown_nodes:{$$= 0;}|unknown_nodes unknown_node{RNG("unknown subnodes",$1,0,3);$$= $1+1;};
/*:304*//*311:*/
#line 6891 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

stream_link:ref{REF_RNG(stream_kind,$1);}|NOREFERENCE{HPUT8(255);};
stream_split:stream_link stream_link UNSIGNED{RNG("split ratio",$3,0,1000);HPUT16($3);};
stream_info:xdimen_node UNSIGNED{RNG("magnification factor",$2,0,1000);HPUT16($2);}stream_split;

stream_type:stream_info{$$= 0;}|FIRST{$$= 1;}|LAST{$$= 2;}|TOP{$$= 3;};

stream_def_node:start STREAMDEF ref stream_type
list xdimen_node glue_node list glue_node END
{DEF($$,stream_kind,$3);hput_tags($1,TAG(stream_kind,$4|b100));};

stream_ins_node:start STREAMDEF ref END
{RNG("Stream insertion",$3,0,max_ref[stream_kind]);hput_tags($1,TAG(stream_kind,b100));};

content_node:stream_def_node|stream_ins_node;
/*:311*//*316:*/
#line 6997 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

stream:param_list list{$$= b010;}
|param_ref list{$$= b000;};
content_node:start STREAM stream_ref stream END
{hput_tags($1,TAG(stream_kind,$4));};
/*:316*//*321:*/
#line 7103 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

page_priority:{HPUT8(1);}
|UNSIGNED{RNG("page priority",$1,0,255);HPUT8($1);};

stream_def_list:|stream_def_list stream_def_node;

page:string{hput_string($1);}page_priority glue_node dimension{HPUT32($5);}
xdimen_node xdimen_node
list stream_def_list;
/*:321*//*329:*/
#line 7220 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


content_node:START RANGE REFERENCE ON END{REF(page_kind,$3);hput_range($3,true);}
|START RANGE REFERENCE OFF END{REF(page_kind,$3);hput_range($3,false);};
/*:329*//*340:*/
#line 7481 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hint:directory_section definition_section content_section;
/*:340*//*356:*/
#line 7925 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

directory_section:START DIRECTORY UNSIGNED{new_directory($3+1);new_output_buffers();}entry_list END;
entry_list:|entry_list entry;
entry:START SECTION UNSIGNED string END
{RNG("Section number",$3,3,max_section_no);hset_entry(&(dir[$3]),$3,0,0,$4);};
/*:356*//*379:*/
#line 8485 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

definition_section:START DEFINITIONS{hput_definitions_start();}
max_definitions definition_list
END{hput_definitions_end();};
definition_list:|definition_list def_node;
/*:379*//*387:*/
#line 8602 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_definitions:START MAX max_list END
{/*253:*/
#line 5441 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(max_ref[label_kind]>=0)
ALLOCATE(labels,max_ref[label_kind]+1,Label);
/*:253*//*274:*/
#line 5824 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(max_outline>=0)
ALLOCATE(outlines,max_outline+1,Outline);
/*:274*//*290:*/
#line 6197 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{int i;
for(i= 0;i<sizeof(ColorSet)/4;i++)
colors_0[i]= color_defaults[0][i];
}
/*:290*//*325:*/
#line 7199 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

ALLOCATE(page_on,max_ref[page_kind]+1,int);
ALLOCATE(range_pos,2*(max_ref[range_kind]+1),RangePos);
/*:325*//*393:*/
#line 8801 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

definition_bits[0][list_kind]= (1<<(MAX_LIST_DEFAULT+1))-1;
definition_bits[0][param_kind]= (1<<(MAX_LIST_DEFAULT+1))-1;
definition_bits[0][int_kind]= (1<<(MAX_INT_DEFAULT+1))-1;
definition_bits[0][dimen_kind]= (1<<(MAX_DIMEN_DEFAULT+1))-1;
definition_bits[0][xdimen_kind]= (1<<(MAX_XDIMEN_DEFAULT+1))-1;
definition_bits[0][glue_kind]= (1<<(MAX_GLUE_DEFAULT+1))-1;
definition_bits[0][baseline_kind]= (1<<(MAX_BASELINE_DEFAULT+1))-1;
definition_bits[0][page_kind]= (1<<(MAX_PAGE_DEFAULT+1))-1;
definition_bits[0][stream_kind]= (1<<(MAX_STREAM_DEFAULT+1))-1;
definition_bits[0][range_kind]= (1<<(MAX_RANGE_DEFAULT+1))-1;
definition_bits[0][color_kind]= (1<<(MAX_COLOR_DEFAULT+1))-1;
/*:393*//*408:*/
#line 9126 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

ALLOCATE(hfont_name,max_ref[font_kind]+1,char*);
/*:408*/
#line 8604 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
hput_max_definitions();};

max_list:|max_list START max_value END;

max_value:FONT UNSIGNED{hset_max(font_kind,$2);}
|INTEGER UNSIGNED{hset_max(int_kind,$2);}
|DIMEN UNSIGNED{hset_max(dimen_kind,$2);}
|LIGATURE UNSIGNED{hset_max(ligature_kind,$2);}
|DISC UNSIGNED{hset_max(disc_kind,$2);}
|GLUE UNSIGNED{hset_max(glue_kind,$2);}
|LANGUAGE UNSIGNED{hset_max(language_kind,$2);}
|RULE UNSIGNED{hset_max(rule_kind,$2);}
|IMAGE UNSIGNED{hset_max(image_kind,$2);}
|LEADERS UNSIGNED{hset_max(leaders_kind,$2);}
|BASELINE UNSIGNED{hset_max(baseline_kind,$2);}
|XDIMEN UNSIGNED{hset_max(xdimen_kind,$2);}
|PARAM UNSIGNED{hset_max(param_kind,$2);}
|STREAMDEF UNSIGNED{hset_max(stream_kind,$2);}
|PAGE UNSIGNED{hset_max(page_kind,$2);}
|RANGE UNSIGNED{hset_max(range_kind,$2);}
|LABEL UNSIGNED{hset_max(label_kind,$2);}
|COLOR UNSIGNED{hset_max(color_kind,$2);};

/*:387*//*395:*/
#line 8825 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

def_node:
start FONT ref font END{DEF($$,font_kind,$3);hput_tags($1,$4);}
|start INTEGER ref integer END{DEF($$,int_kind,$3);hput_tags($1,hput_int($4));}
|start DIMEN ref dimension END{DEF($$,dimen_kind,$3);hput_tags($1,hput_dimen($4));}
|start LANGUAGE ref string END{DEF($$,language_kind,$3);hput_string($4);hput_tags($1,TAG(language_kind,0));}
|start GLUE ref glue END{DEF($$,glue_kind,$3);hput_tags($1,hput_glue(&($4)));}
|start XDIMEN ref xdimen END{DEF($$,xdimen_kind,$3);hput_tags($1,hput_xdimen(&($4)));}
|start RULE ref rule END{DEF($$,rule_kind,$3);hput_tags($1,hput_rule(&($4)));}
|start LEADERS ref leaders END{DEF($$,leaders_kind,$3);hput_tags($1,TAG(leaders_kind,$4));}
|start BASELINE ref baseline END{DEF($$,baseline_kind,$3);hput_tags($1,TAG(baseline_kind,$4));}
|start LIGATURE ref ligature END{DEF($$,ligature_kind,$3);hput_tags($1,hput_ligature(&($4)));}
|start DISC ref disc END{DEF($$,disc_kind,$3);hput_tags($1,hput_disc(&($4)));}
|start IMAGE ref image END{DEF($$,image_kind,$3);hput_tags($1,TAG(image_kind,$4));}
|start PARAM ref parameters END{DEF($$,param_kind,$3);hput_tags($1,hput_list($1+2,&($4)));}
|start PAGE ref page END{DEF($$,page_kind,$3);hput_tags($1,TAG(page_kind,0));};
/*:395*//*397:*/
#line 8857 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

def_node:
start INTEGER ref ref END{DEF_REF($$,int_kind,$3,$4);hput_tags($1,TAG(int_kind,0));}
|start DIMEN ref ref END{DEF_REF($$,dimen_kind,$3,$4);hput_tags($1,TAG(dimen_kind,0));}
|start GLUE ref ref END{DEF_REF($$,glue_kind,$3,$4);hput_tags($1,TAG(glue_kind,0));};
/*:397*//*402:*/
#line 8982 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

def_list:position
|def_list def_node{check_param_def(&($2));};
parameters:estimate def_list{$$.p= $2;$$.t= TAG(param_kind,b001);$$.s= (hpos-hstart)-$2;};
/*:402*//*403:*/
#line 8996 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

named_param_list:start PARAM parameters END
{hput_tags($1,hput_list($1+1,&($3)));};
param_list:named_param_list|start parameters END
{hput_tags($1,hput_list($1+1,&($2)));};
/*:403*//*411:*/
#line 9151 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


font:font_head font_param_list;

font_head:string dimension UNSIGNED UNSIGNED
{uint8_t f= $<u> 0;SET_DBIT(f,font_kind);hfont_name[f]= strdup($1);$$= hput_font_head(f,hfont_name[f],$2,$3,$4);};
font_head:string dimension UNSIGNED
{uint8_t f= $<u> 0;SET_DBIT(f,font_kind);hfont_name[f]= strdup($1);$$= hput_font_head(f,hfont_name[f],$2,-1,$3);};



font_param_list:glue_node disc_node|font_param_list font_param;

font_param:
start PENALTY fref penalty END{hput_tags($1,hput_int($4));}
|start KERN fref kern END{hput_tags($1,hput_kern(&($4)));}
|start LIGATURE fref ligature END{hput_tags($1,hput_ligature(&($4)));}
|start DISC fref disc END{hput_tags($1,hput_disc(&($4)));}
|start GLUE fref glue END{hput_tags($1,hput_glue(&($4)));}
|start LANGUAGE fref string END{hput_string($4);hput_tags($1,TAG(language_kind,0));}
|start RULE fref rule END{hput_tags($1,hput_rule(&($4)));}
|start IMAGE fref image END{hput_tags($1,TAG(image_kind,$4));};

fref:ref{RNG("Font parameter",$1,0,MAX_FONT_PARAMS);};
/*:411*//*415:*/
#line 9253 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

xdimen_ref:ref{REF(xdimen_kind,$1);};
param_ref:ref{REF(param_kind,$1);};
stream_ref:ref{REF_RNG(stream_kind,$1);};


content_node:
start PENALTY ref END{REF(penalty_kind,$3);hput_tags($1,TAG(penalty_kind,0));}
|start KERN explicit ref END
{REF(dimen_kind,$4);hput_tags($1,TAG(kern_kind,($3)?b100:b000));}
|start KERN explicit XDIMEN ref END
{REF(xdimen_kind,$5);hput_tags($1,TAG(kern_kind,($3)?b101:b001));}
|start GLUE ref END{REF(glue_kind,$3);hput_tags($1,TAG(glue_kind,0));}
|start LIGATURE ref END{REF(ligature_kind,$3);hput_tags($1,TAG(ligature_kind,0));}
|start DISC ref END{REF(disc_kind,$3);hput_tags($1,TAG(disc_kind,0));}
|start RULE ref END{REF(rule_kind,$3);hput_tags($1,TAG(rule_kind,0));}
|start IMAGE ref END{REF(image_kind,$3);hput_tags($1,TAG(image_kind,0));}
|start LEADERS ref END{REF(leaders_kind,$3);hput_tags($1,TAG(leaders_kind,0));}
|start BASELINE ref END{REF(baseline_kind,$3);hput_tags($1,TAG(baseline_kind,0));}
|start LANGUAGE REFERENCE END{REF(language_kind,$3);hput_tags($1,hput_language($3));};

glue_node:start GLUE ref END{REF(glue_kind,$3);
if($3==zero_skip_no){hpos= hpos-2;$$= false;}
else{hput_tags($1,TAG(glue_kind,0));$$= true;}};

/*:415*//*444:*/
#line 9759 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

content_section:START CONTENT{hput_content_start();}content_list END
{hput_content_end();hput_range_defs();hput_label_defs();};
/*:444*/
#line 11720 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

%%
/*:556*/
