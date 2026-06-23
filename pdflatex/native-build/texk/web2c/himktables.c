/*549:*/
#line 11381 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#include "hibasetypes.h"
#include "hiformat.h"
/*499:*/
#line 10701 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_XDIMEN(I,X) \
  if((I)&b001) HTEG32((X).v); \
  if((I)&b010) HTEG32((X).h);\
  if((I)&b100) HTEG32((X).w);
/*:499*//*501:*/
#line 10735 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_STRETCH(S) { Stch st;  HTEG32(st.u); S.o= st.u&3;  st.u&= ~3; S.f= st.f; }
/*:501*//*502:*/
#line 10741 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_GLYPH(I,G) \
  (G).f= HTEG8; \
  if (I==1) (G).c= HTEG8;\
  else if (I==2) HTEG16((G).c);\
  else if (I==3) HTEG24((G).c);\
  else if (I==4) HTEG32((G).c);
/*:502*//*504:*/
#line 10760 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_PENALTY(I,P) \
if (I==1) {int8_t n; n= HTEG8;  P= n; } \
else if (I==2) {int16_t n; HTEG16(n);  P= n; }\
else if (I==3) {int32_t n; HTEG32(n);  P= n; }
/*:504*//*506:*/
#line 10776 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_KERN(I,X) if (((I)&b011)==2) HTEG32(X.w); else if (((I)&b011)==3)  hteg_xdimen_node(&(X))
#line 10778 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
/*:506*//*509:*/
#line 10801 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_RULE(I,R)\
if ((I)&b001) HTEG32((R).w); else (R).w= RUNNING_DIMEN;\
if ((I)&b010) HTEG32((R).d); else (R).d= RUNNING_DIMEN;\
if ((I)&b100) HTEG32((R).h); else (R).h= RUNNING_DIMEN;
/*:509*//*512:*/
#line 10827 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_GLUE(I,G) \
  if(I==b111) hteg_xdimen_node(&((G).w)); else (G).w.h= (G).w.v= 0.0;\
  if((I)&b001) HTEG_STRETCH((G).m) else  (G).m.f= 0.0, (G).m.o= 0; \
  if((I)&b010) HTEG_STRETCH((G).p) else (G).p.f= 0.0, (G).p.o= 0;\
  if((I)!=b111) { if ((I)&b100) HTEG32((G).w.w); else (G).w.w= 0; }
/*:512*//*515:*/
#line 10857 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_BOX(I,B) \
hteg_list(&(B.l));\
if ((I)&b100) { B.s= HTEG8;  B.r= hteg_float32();  B.o= B.s&0xF; B.s= B.s>>4; }\
else {  B.r= 0.0; B.o= B.s= 0; }\
if ((I)&b010) HTEG32(B.a); else B.a= 0;\
HTEG32(B.w);\
if ((I)&b001) HTEG32(B.d);  else B.d= 0;\
HTEG32(B.h);\
/*:515*//*518:*/
#line 10908 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_SET(I) \
{ List l; hteg_list(&l); } \
 if ((I)&b100) {Xdimen x; hteg_xdimen_node(&x); } \
 else HTEG_REF(xdimen_kind);\
{ Stretch m; HTEG_STRETCH(m);}\
{ Stretch p; HTEG_STRETCH(p);}\
if ((I)&b010)  { Dimen a; HTEG32(a);} \
 { Dimen w; HTEG32(w);} \
 { Dimen d; if ((I)&b001) HTEG32(d);  else d= 0;}\
 { Dimen h; HTEG32(h);}


#define HTEG_PACK(K,I) \
 { List l; hteg_list(&l); } \
 if ((I)&b100) {Xdimen x; hteg_xdimen_node(&x);}  else HTEG_REF(xdimen_kind);\
 if ((I)&b010)  { Dimen d; HTEG32(d);  }\
 if (K==vpack_kind) { Dimen d; HTEG32(d);  }
/*:518*//*520:*/
#line 10969 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_LEADERS(I) \
if (KIND(hpos[-1])==rule_kind) hteg_rule_node(); \
else if (KIND(hpos[-1])==hbox_kind)  hteg_hbox_node();\
else  hteg_vbox_node();\
if ((I)&b100) hteg_glue_node();
/*:520*//*522:*/
#line 10988 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_BASELINE(I,B) \
  if((I)&b010) hteg_glue_node(); \
  else {B.ls.p.o= B.ls.m.o= B.ls.w.w= 0; B.ls.w.h= B.ls.w.v= B.ls.p.f= B.ls.m.f= 0.0;}\
  if((I)&b100) hteg_glue_node(); \
  else {B.bs.p.o= B.bs.m.o= B.bs.w.w= 0; B.bs.w.h= B.bs.w.v= B.bs.p.f= B.bs.m.f= 0.0;}\
  if((I)&b001) HTEG32((B).lsl); else B.lsl= 0;
/*:522*//*524:*/
#line 11008 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_LIG(I,L) \
if ((I)==7) hteg_list(&((L).l)); \
else {(L).l.s= (I); hpos-= (L).l.s;  (L).l.p= hpos-hstart;} \
(L).f= HTEG8;
/*:524*//*526:*/
#line 11028 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_DISC(I,H)\
if ((I)&b001) hteg_list(&((H).q)); else { (H).q.p= hpos-hstart; (H).q.s= 0; (H).q.t= TAG(list_kind,b000); }\
if ((I)&b010) hteg_list(&((H).p)); else { (H).p.p= hpos-hstart; (H).p.s= 0; (H).p.t= TAG(list_kind,b000); } \
if ((I)&b100) (H).r= HTEG8; else (H).r= 0;
/*:526*//*528:*/
#line 11047 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_PAR(I) \
 { List l; hteg_list(&l); } \
 if ((I)&b010) { List l; hteg_param_list(&l); }  else if ((I)!=b100) HTEG_REF(param_kind);\
 if ((I)&b100)  {Xdimen x;  hteg_xdimen_node(&x); }  else HTEG_REF(xdimen_kind);\
 if ((I)==b100) HTEG_REF(param_kind);
/*:528*//*530:*/
#line 11065 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_MATH(I) \
if ((I)&b001) hteg_hbox_node();\
{ List l; hteg_list(&l); } \
if ((I)&b010) hteg_hbox_node(); \
if ((I)&b100) { List l; hteg_param_list(&l); }  else HTEG_REF(param_kind);
/*:530*//*532:*/
#line 11086 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_IMAGE(I) \
{ Image x= {0}; List d; hteg_list(&d);\
if ((I)&b100) {\
 if ((I)==b111) {hteg_xdimen_node(&x.h);hteg_xdimen_node(&x.w);}\
 else if ((I)==b110) {hteg_xdimen_node(&x.w);x.hr= HTEG8;}\
 else if ((I)==b101) {hteg_xdimen_node(&x.h);x.wr= HTEG8;}\
 else  {x.hr= HTEG8;x.wr= HTEG8;}\
x.a= hteg_float32();}\
else if((I)==b011) {HTEG32(x.h.w);HTEG32(x.w.w);} \
else if((I)==b010) { HTEG32(x.w.w); x.a= hteg_float32();}\
else if((I)==b001){ HTEG32(x.h.w); x.a= hteg_float32();}\
HTEG16(x.n);}
/*:532*//*534:*/
#line 11114 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_LINK(I) \
{ uint16_t n;  if (I&b100) n= HTEG8; if (I&b001) HTEG16(n); else n= HTEG8; }
/*:534*//*540:*/
#line 11200 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_TABLE(I) \
{ List l;  hteg_list(&l);}\
{ List l;  hteg_list(&l);}\
if ((I)&b100) {Xdimen x; hteg_xdimen_node(&x);} else HTEG_REF(xdimen_kind)
/*:540*//*542:*/
#line 11230 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_STREAM(I) \
{ List l; hteg_list(&l); }\
if ((I)&b010) { List l; hteg_param_list(&l); }  else HTEG_REF(param_kind);\
HTEG_REF(stream_kind);
/*:542*//*544:*/
#line 11246 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HTEG_REF(K) do{uint8_t n;  n= HTEG8;}  while (false)
/*:544*/
#line 11384 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


int max_fixed[32],max_default[32];

int32_t int_defaults[MAX_INT_DEFAULT+1]= {0};
Dimen dimen_defaults[MAX_DIMEN_DEFAULT+1]= {0};
Xdimen xdimen_defaults[MAX_XDIMEN_DEFAULT+1]= {{0}};
Glue glue_defaults[MAX_GLUE_DEFAULT+1]= {{{0}}};
Baseline baseline_defaults[MAX_BASELINE_DEFAULT+1]= {{{{0}}}};

signed char hnode_size[0x100]= {0};
uint8_t content_known[32]= {0};
/*7:*/
#line 502 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


#define DEF_KIND(C,D,N) #C
const char*content_name[32]= {/*9:*/
#line 564 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

DEF_KIND(list,list,0),
DEF_KIND(param,param,1),
DEF_KIND(range,range,2),
DEF_KIND(xdimen,xdimen,3),
DEF_KIND(adjust,adjust,4),
DEF_KIND(glyph,font,5),
DEF_KIND(kern,dimen,6),
DEF_KIND(glue,glue,7),
DEF_KIND(ligature,ligature,8),
DEF_KIND(disc,disc,9),
DEF_KIND(language,language,10),
DEF_KIND(rule,rule,11),
DEF_KIND(image,image,12),
DEF_KIND(leaders,leaders,13),
DEF_KIND(baseline,baseline,14),
DEF_KIND(hbox,hbox,15),
DEF_KIND(vbox,vbox,16),
DEF_KIND(par,par,17),
DEF_KIND(math,math,18),
DEF_KIND(table,table,19),
DEF_KIND(item,item,20),
DEF_KIND(hset,hset,21),
DEF_KIND(vset,vset,22),
DEF_KIND(hpack,hpack,23),
DEF_KIND(vpack,vpack,24),
DEF_KIND(stream,stream,25),
DEF_KIND(page,page,26),
DEF_KIND(link,label,27),
DEF_KIND(color,color,28),
DEF_KIND(undefined1,undefined1,29),
DEF_KIND(undefined2,undefined2,30),
DEF_KIND(penalty,int,31)

/*:9*/
#line 505 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
};
#undef DEF_KIND
#define DEF_KIND(C,D,N) #D
const char*definition_name[0x20]= {/*9:*/
#line 564 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

DEF_KIND(list,list,0),
DEF_KIND(param,param,1),
DEF_KIND(range,range,2),
DEF_KIND(xdimen,xdimen,3),
DEF_KIND(adjust,adjust,4),
DEF_KIND(glyph,font,5),
DEF_KIND(kern,dimen,6),
DEF_KIND(glue,glue,7),
DEF_KIND(ligature,ligature,8),
DEF_KIND(disc,disc,9),
DEF_KIND(language,language,10),
DEF_KIND(rule,rule,11),
DEF_KIND(image,image,12),
DEF_KIND(leaders,leaders,13),
DEF_KIND(baseline,baseline,14),
DEF_KIND(hbox,hbox,15),
DEF_KIND(vbox,vbox,16),
DEF_KIND(par,par,17),
DEF_KIND(math,math,18),
DEF_KIND(table,table,19),
DEF_KIND(item,item,20),
DEF_KIND(hset,hset,21),
DEF_KIND(vset,vset,22),
DEF_KIND(hpack,hpack,23),
DEF_KIND(vpack,vpack,24),
DEF_KIND(stream,stream,25),
DEF_KIND(page,page,26),
DEF_KIND(link,label,27),
DEF_KIND(color,color,28),
DEF_KIND(undefined1,undefined1,29),
DEF_KIND(undefined2,undefined2,30),
DEF_KIND(penalty,int,31)

/*:9*/
#line 508 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
};
#undef DEF_KIND
/*:7*/
#line 11396 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int main(void)
{Kind k;
int i;


printf("#include \"hibasetypes.h\"\n"
"#include \"hiformat.h\"\n\n");

/*8:*/
#line 512 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

printf("const char *content_name[32]={");
for(k= 0;k<=31;k++)
{printf("\"%s\"",content_name[k]);
if(k<31)printf(", ");
}
printf("};\n\n");
printf("const char *definition_name[32]={");
for(k= 0;k<=31;k++)
{printf("\"%s\"",definition_name[k]);
if(k<31)printf(", ");
}
printf("};\n\n");
/*:8*/
#line 11405 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


printf("int max_outline=-1;\n\n");

/*419:*/
#line 9345 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

for(k= 0;k<32;k++)max_default[k]= -1,max_fixed[k]= 0x10000;
max_fixed[font_kind]= max_fixed[ligature_kind]= max_fixed[disc_kind]
= max_fixed[language_kind]= max_fixed[rule_kind]= max_fixed[image_kind]
= max_fixed[leaders_kind]= max_fixed[param_kind]= max_fixed[label_kind]= -1;
/*:419*/
#line 11409 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*421:*/
#line 9397 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[int_kind]= MAX_INT_DEFAULT;
max_fixed[int_kind]= zero_int_no;
int_defaults[zero_int_no]= 0;
int_defaults[pretolerance_no]= 100;
int_defaults[tolerance_no]= 200;
int_defaults[line_penalty_no]= 10;
int_defaults[hyphen_penalty_no]= 50;
int_defaults[ex_hyphen_penalty_no]= 50;
int_defaults[club_penalty_no]= 150;
int_defaults[widow_penalty_no]= 150;
int_defaults[display_widow_penalty_no]= 50;
int_defaults[broken_penalty_no]= 100;
int_defaults[pre_display_penalty_no]= 10000;
int_defaults[post_display_penalty_no]= 0;
int_defaults[inter_line_penalty_no]= 0;
int_defaults[double_hyphen_demerits_no]= 10000;
int_defaults[final_hyphen_demerits_no]= 5000;
int_defaults[adj_demerits_no]= 10000;
int_defaults[looseness_no]= 0;
int_defaults[time_no]= 720;
int_defaults[day_no]= 4;
int_defaults[month_no]= 7;
int_defaults[year_no]= 1776;
int_defaults[hang_after_no]= 1;
int_defaults[floating_penalty_no]= 20000;


printf("int32_t int_defaults[MAX_INT_DEFAULT+1]={");
for(i= 0;i<=max_default[int_kind];i++)
{printf("%d",int_defaults[i]);
if(i<max_default[int_kind])printf(", ");
}
printf("};\n\n");
/*:421*/
#line 11410 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*423:*/
#line 9457 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[dimen_kind]= MAX_DIMEN_DEFAULT;
max_fixed[dimen_kind]= zero_dimen_no;
dimen_defaults[zero_dimen_no]= 0;
dimen_defaults[hsize_dimen_no]= (Dimen)(6.5*72.27*ONE);
dimen_defaults[vsize_dimen_no]= (Dimen)(8.9*72.27*ONE);
dimen_defaults[line_skip_limit_no]= 0;
dimen_defaults[split_max_depth_no]= (Dimen)(3.5*ONE);
dimen_defaults[hang_indent_no]= 0;
dimen_defaults[emergency_stretch_no]= 0;
dimen_defaults[quad_no]= 10*ONE;
dimen_defaults[math_quad_no]= 10*ONE;

printf("Dimen dimen_defaults[MAX_DIMEN_DEFAULT+1]={");
for(i= 0;i<=max_default[dimen_kind];i++)
{printf("0x%x",dimen_defaults[i]);
if(i<max_default[dimen_kind])printf(", ");
}
printf("};\n\n");
/*:423*/
#line 11411 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*427:*/
#line 9531 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[glue_kind]= MAX_GLUE_DEFAULT;
max_fixed[glue_kind]= fill_skip_no;

glue_defaults[fil_skip_no].p.f= 1.0;
glue_defaults[fil_skip_no].p.o= fil_o;

glue_defaults[fill_skip_no].p.f= 1.0;
glue_defaults[fill_skip_no].p.o= fill_o;

glue_defaults[line_skip_no].w.w= 1*ONE;
glue_defaults[baseline_skip_no].w.w= 12*ONE;

glue_defaults[above_display_skip_no].w.w= 12*ONE;
glue_defaults[above_display_skip_no].p.f= 3.0;
glue_defaults[above_display_skip_no].p.o= normal_o;
glue_defaults[above_display_skip_no].m.f= 9.0;
glue_defaults[above_display_skip_no].m.o= normal_o;

glue_defaults[below_display_skip_no].w.w= 12*ONE;
glue_defaults[below_display_skip_no].p.f= 3.0;
glue_defaults[below_display_skip_no].p.o= normal_o;
glue_defaults[below_display_skip_no].m.f= 9.0;
glue_defaults[below_display_skip_no].m.o= normal_o;

glue_defaults[above_display_short_skip_no].p.f= 3.0;
glue_defaults[above_display_short_skip_no].p.o= normal_o;

glue_defaults[below_display_short_skip_no].w.w= 7*ONE;
glue_defaults[below_display_short_skip_no].p.f= 3.0;
glue_defaults[below_display_short_skip_no].p.o= normal_o;
glue_defaults[below_display_short_skip_no].m.f= 4.0;
glue_defaults[below_display_short_skip_no].m.o= normal_o;

glue_defaults[top_skip_no].w.w= 10*ONE;
glue_defaults[split_top_skip_no].w.w= (Dimen)8.5*ONE;

glue_defaults[par_fill_skip_no].p.f= 1.0;
glue_defaults[par_fill_skip_no].p.o= fil_o;

#define PRINT_GLUE(G) \
        printf("{{0x%x, %f, %f},{%f, %d},{%f, %d}}",\
        G.w.w, G.w.h, G.w.v, G.p.f, G.p.o, G.m.f,G.m.o)

printf("Glue glue_defaults[MAX_GLUE_DEFAULT+1]={\n");
for(i= 0;i<=max_default[glue_kind];i++)
{PRINT_GLUE(glue_defaults[i]);
if(i<max_default[int_kind])printf(",\n");
}
printf("};\n\n");
/*:427*/
#line 11412 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*425:*/
#line 9495 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[xdimen_kind]= MAX_XDIMEN_DEFAULT;
max_fixed[xdimen_kind]= vsize_xdimen_no;

printf("Xdimen xdimen_defaults[MAX_XDIMEN_DEFAULT+1]={"
"{0x0, 0.0, 0.0}, {0x0, 1.0, 0.0}, {0x0, 0.0, 1.0}"
"};\n\n");
/*:425*/
#line 11413 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*429:*/
#line 9602 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[baseline_kind]= MAX_BASELINE_DEFAULT;
max_fixed[baseline_kind]= zero_baseline_no;
{Baseline z= {{{0}}};
printf("Baseline baseline_defaults[MAX_BASELINE_DEFAULT+1]={{");
PRINT_GLUE(z.bs);printf(", ");PRINT_GLUE(z.ls);printf(", 0x%x}};\n\n",z.lsl);
}
/*:429*/
#line 11414 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*435:*/
#line 9658 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[page_kind]= MAX_PAGE_DEFAULT;
max_fixed[page_kind]= zero_page_no;
/*:435*/
#line 11415 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*433:*/
#line 9642 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[stream_kind]= MAX_STREAM_DEFAULT;
max_fixed[stream_kind]= zero_stream_no;
/*:433*/
#line 11416 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*437:*/
#line 9675 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[range_kind]= MAX_RANGE_DEFAULT;
max_fixed[range_kind]= zero_range_no;
/*:437*//*439:*/
#line 9688 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[list_kind]= MAX_LIST_DEFAULT;
max_fixed[list_kind]= empty_list_no;
max_default[param_kind]= MAX_LIST_DEFAULT;
max_fixed[param_kind]= empty_list_no;
/*:439*/
#line 11417 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*431:*/
#line 9627 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[label_kind]= MAX_LABEL_DEFAULT;
printf("Label label_defaults[MAX_LABEL_DEFAULT+1]=""{{0,0,LABEL_TOP,true,0,0}};\n\n");
/*:431*/
#line 11418 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*441:*/
#line 9716 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

max_default[color_kind]= MAX_COLOR_DEFAULT;
max_fixed[color_kind]= -1;
printf("ColorSet  color_defaults[MAX_COLOR_DEFAULT+1]=\n"
"{{0x000000FF, 0xFFFFFF00,\n"
"  0xEE0000FF, 0xFFFFFF00,\n"
"  0x00EE00FF, 0xFFFFFF00,\n"
"  0xFFFFFFFF, 0x00000000,"
"  0xFF1111FF, 0x00000000,\n"
"  0x11FF11FF, 0x00000000},\n"
" {0x0000EEFF, 0xFFFFFF00,\n"
"  0xEE0000FF, 0xFFFFFF00,\n"
"  0x00EE00FF, 0xFFFFFF00,\n"
"  0x1111FFFF, 0x00000000,\n"
"  0xFF1111FF, 0x00000000,\n"
"  0x11FF11FF, 0x00000000\n"
"}};\n\n");
/*:441*/
#line 11419 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*550:*/
#line 11431 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

printf("int max_fixed[32]= {");
for(k= 0;k<32;k++)
{printf("%d",max_fixed[k]);
if(k<31)printf(", ");
}
printf("};\n\n");
printf("int max_default[32]= {");
for(k= 0;k<32;k++)
{printf("%d",max_default[k]);
if(k<31)printf(", ");
}
printf("};\n\n");
printf("int max_ref[32]= {");
for(k= 0;k<32;k++)
{printf("%d",max_default[k]);
if(k<31)printf(", ");
}
printf("};\n\n");
/*:550*/
#line 11420 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


/*470:*/
#line 10288 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(glyph_kind,1)]= NODE_SIZE(1+1,0);
hnode_size[TAG(glyph_kind,2)]= NODE_SIZE(1+2,0);
hnode_size[TAG(glyph_kind,3)]= NODE_SIZE(1+3,0);
hnode_size[TAG(glyph_kind,4)]= NODE_SIZE(1+4,0);
/*:470*//*471:*/
#line 10301 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(penalty_kind,0)]= NODE_SIZE(1,0);
hnode_size[TAG(penalty_kind,1)]= NODE_SIZE(1,0);
hnode_size[TAG(penalty_kind,2)]= NODE_SIZE(2,0);
hnode_size[TAG(penalty_kind,3)]= NODE_SIZE(4,0);
/*:471*//*472:*/
#line 10312 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(kern_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(kern_kind,b001)]= NODE_SIZE(1,0);
hnode_size[TAG(kern_kind,b010)]= NODE_SIZE(4,0);
hnode_size[TAG(kern_kind,b011)]= NODE_SIZE(0,1);
hnode_size[TAG(kern_kind,b100)]= NODE_SIZE(1,0);
hnode_size[TAG(kern_kind,b101)]= NODE_SIZE(1,0);
hnode_size[TAG(kern_kind,b110)]= NODE_SIZE(4,0);
hnode_size[TAG(kern_kind,b111)]= NODE_SIZE(0,1);
/*:472*//*473:*/
#line 10327 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(xdimen_kind,b100)]= NODE_SIZE(4,0);
hnode_size[TAG(xdimen_kind,b010)]= NODE_SIZE(4,0);
hnode_size[TAG(xdimen_kind,b001)]= NODE_SIZE(4,0);
hnode_size[TAG(xdimen_kind,b110)]= NODE_SIZE(4+4,0);
hnode_size[TAG(xdimen_kind,b101)]= NODE_SIZE(4+4,0);
hnode_size[TAG(xdimen_kind,b011)]= NODE_SIZE(4+4,0);
hnode_size[TAG(xdimen_kind,b111)]= NODE_SIZE(4+4+4,0);
/*:473*//*474:*/
#line 10340 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(language_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(language_kind,1)]= NODE_SIZE(0,0);
hnode_size[TAG(language_kind,2)]= NODE_SIZE(0,0);
hnode_size[TAG(language_kind,3)]= NODE_SIZE(0,0);
hnode_size[TAG(language_kind,4)]= NODE_SIZE(0,0);
hnode_size[TAG(language_kind,5)]= NODE_SIZE(0,0);
hnode_size[TAG(language_kind,6)]= NODE_SIZE(0,0);
hnode_size[TAG(language_kind,7)]= NODE_SIZE(0,0);
/*:474*//*475:*/
#line 10355 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(rule_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(rule_kind,b100)]= NODE_SIZE(4,0);
hnode_size[TAG(rule_kind,b010)]= NODE_SIZE(4,0);
hnode_size[TAG(rule_kind,b001)]= NODE_SIZE(4,0);
hnode_size[TAG(rule_kind,b110)]= NODE_SIZE(4+4,0);
hnode_size[TAG(rule_kind,b101)]= NODE_SIZE(4+4,0);
hnode_size[TAG(rule_kind,b011)]= NODE_SIZE(4+4,0);
hnode_size[TAG(rule_kind,b111)]= NODE_SIZE(4+4+4,0);
/*:475*//*476:*/
#line 10371 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(glue_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(glue_kind,b100)]= NODE_SIZE(4,0);
hnode_size[TAG(glue_kind,b010)]= NODE_SIZE(4,0);
hnode_size[TAG(glue_kind,b001)]= NODE_SIZE(4,0);
hnode_size[TAG(glue_kind,b110)]= NODE_SIZE(4+4,0);
hnode_size[TAG(glue_kind,b101)]= NODE_SIZE(4+4,0);
hnode_size[TAG(glue_kind,b011)]= NODE_SIZE(4+4,0);
hnode_size[TAG(glue_kind,b111)]= NODE_SIZE(4+4,1);
/*:476*//*477:*/
#line 10389 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(hbox_kind,b000)]= NODE_SIZE(4+4,1);
hnode_size[TAG(hbox_kind,b001)]= NODE_SIZE(4+4+4,1);
hnode_size[TAG(hbox_kind,b010)]= NODE_SIZE(4+4+4,1);
hnode_size[TAG(hbox_kind,b011)]= NODE_SIZE(4+4+4+4,1);
hnode_size[TAG(hbox_kind,b100)]= NODE_SIZE(4+4+5,1);
hnode_size[TAG(hbox_kind,b101)]= NODE_SIZE(4+4+4+5,1);
hnode_size[TAG(hbox_kind,b110)]= NODE_SIZE(4+4+4+5,1);
hnode_size[TAG(hbox_kind,b111)]= NODE_SIZE(4+4+4+4+5,1);
hnode_size[TAG(vbox_kind,b000)]= NODE_SIZE(4+4,1);
hnode_size[TAG(vbox_kind,b001)]= NODE_SIZE(4+4+4,1);
hnode_size[TAG(vbox_kind,b010)]= NODE_SIZE(4+4+4,1);
hnode_size[TAG(vbox_kind,b011)]= NODE_SIZE(4+4+4+4,1);
hnode_size[TAG(vbox_kind,b100)]= NODE_SIZE(4+4+5,1);
hnode_size[TAG(vbox_kind,b101)]= NODE_SIZE(4+4+4+5,1);
hnode_size[TAG(vbox_kind,b110)]= NODE_SIZE(4+4+4+5,1);
hnode_size[TAG(vbox_kind,b111)]= NODE_SIZE(4+4+4+4+5,1);
/*:477*//*478:*/
#line 10412 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(hset_kind,b000)]= NODE_SIZE(4+4+4+4+1,1);
hnode_size[TAG(hset_kind,b001)]= NODE_SIZE(4+4+4+4+4+1,1);
hnode_size[TAG(hset_kind,b010)]= NODE_SIZE(4+4+4+4+4+1,1);
hnode_size[TAG(hset_kind,b011)]= NODE_SIZE(4+4+4+4+4+4+1,1);
hnode_size[TAG(vset_kind,b000)]= NODE_SIZE(4+4+4+4+1,1);
hnode_size[TAG(vset_kind,b001)]= NODE_SIZE(4+4+4+4+4+1,1);
hnode_size[TAG(vset_kind,b010)]= NODE_SIZE(4+4+4+4+4+1,1);
hnode_size[TAG(vset_kind,b011)]= NODE_SIZE(4+4+4+4+4+4+1,1);

hnode_size[TAG(hset_kind,b100)]= NODE_SIZE(4+4+4+4,2);
hnode_size[TAG(hset_kind,b101)]= NODE_SIZE(4+4+4+4+4,2);
hnode_size[TAG(hset_kind,b110)]= NODE_SIZE(4+4+4+4+4,2);
hnode_size[TAG(hset_kind,b111)]= NODE_SIZE(4+4+4+4+4+4,2);
hnode_size[TAG(vset_kind,b100)]= NODE_SIZE(4+4+4+4,2);
hnode_size[TAG(vset_kind,b101)]= NODE_SIZE(4+4+4+4+4,2);
hnode_size[TAG(vset_kind,b110)]= NODE_SIZE(4+4+4+4+4,2);
hnode_size[TAG(vset_kind,b111)]= NODE_SIZE(4+4+4+4+4+4,2);
/*:478*//*479:*/
#line 10434 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(hpack_kind,b000)]= NODE_SIZE(1,1);
hnode_size[TAG(hpack_kind,b001)]= NODE_SIZE(1,1);
hnode_size[TAG(hpack_kind,b010)]= NODE_SIZE(4+1,1);
hnode_size[TAG(hpack_kind,b011)]= NODE_SIZE(4+1,1);
hnode_size[TAG(vpack_kind,b000)]= NODE_SIZE(4+1,1);
hnode_size[TAG(vpack_kind,b001)]= NODE_SIZE(4+1,1);
hnode_size[TAG(vpack_kind,b010)]= NODE_SIZE(4+4+1,1);
hnode_size[TAG(vpack_kind,b011)]= NODE_SIZE(4+4+1,1);

hnode_size[TAG(hpack_kind,b100)]= NODE_SIZE(0,2);
hnode_size[TAG(hpack_kind,b101)]= NODE_SIZE(0,2);
hnode_size[TAG(hpack_kind,b110)]= NODE_SIZE(4,2);
hnode_size[TAG(hpack_kind,b111)]= NODE_SIZE(4,2);
hnode_size[TAG(vpack_kind,b100)]= NODE_SIZE(4,2);
hnode_size[TAG(vpack_kind,b101)]= NODE_SIZE(4,2);
hnode_size[TAG(vpack_kind,b110)]= NODE_SIZE(4+4,2);
hnode_size[TAG(vpack_kind,b111)]= NODE_SIZE(4+4,2);
/*:479*//*480:*/
#line 10457 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(leaders_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(leaders_kind,1)]= NODE_SIZE(0,1);
hnode_size[TAG(leaders_kind,2)]= NODE_SIZE(0,1);
hnode_size[TAG(leaders_kind,3)]= NODE_SIZE(0,1);
hnode_size[TAG(leaders_kind,b100|1)]= NODE_SIZE(0,2);
hnode_size[TAG(leaders_kind,b100|2)]= NODE_SIZE(0,2);
hnode_size[TAG(leaders_kind,b100|3)]= NODE_SIZE(0,2);
/*:480*//*481:*/
#line 10469 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(baseline_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(baseline_kind,b001)]= NODE_SIZE(4,0);
hnode_size[TAG(baseline_kind,b010)]= NODE_SIZE(0,1);
hnode_size[TAG(baseline_kind,b100)]= NODE_SIZE(0,1);
hnode_size[TAG(baseline_kind,b110)]= NODE_SIZE(0,2);

hnode_size[TAG(baseline_kind,b011)]= NODE_SIZE(4,1);
hnode_size[TAG(baseline_kind,b101)]= NODE_SIZE(4,1);
hnode_size[TAG(baseline_kind,b111)]= NODE_SIZE(4,2);
/*:481*//*482:*/
#line 10486 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(ligature_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(ligature_kind,1)]= NODE_SIZE(1+1,0);
hnode_size[TAG(ligature_kind,2)]= NODE_SIZE(1+2,0);
hnode_size[TAG(ligature_kind,3)]= NODE_SIZE(1+3,0);
hnode_size[TAG(ligature_kind,4)]= NODE_SIZE(1+4,0);
hnode_size[TAG(ligature_kind,5)]= NODE_SIZE(1+5,0);
hnode_size[TAG(ligature_kind,6)]= NODE_SIZE(1+6,0);
hnode_size[TAG(ligature_kind,7)]= NODE_SIZE(1,1);
/*:482*//*483:*/
#line 10502 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(disc_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(disc_kind,b010)]= NODE_SIZE(0,1);
hnode_size[TAG(disc_kind,b011)]= NODE_SIZE(0,2);
hnode_size[TAG(disc_kind,b100)]= NODE_SIZE(1,0);
hnode_size[TAG(disc_kind,b110)]= NODE_SIZE(1,1);
hnode_size[TAG(disc_kind,b111)]= NODE_SIZE(1,2);
/*:483*//*484:*/
#line 10514 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(par_kind,b000)]= NODE_SIZE(1+1,1);
hnode_size[TAG(par_kind,b010)]= NODE_SIZE(1,2);
hnode_size[TAG(par_kind,b110)]= NODE_SIZE(0,3);
hnode_size[TAG(par_kind,b100)]= NODE_SIZE(1,2);
/*:484*//*485:*/
#line 10525 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(math_kind,b000)]= NODE_SIZE(1,1);
hnode_size[TAG(math_kind,b001)]= NODE_SIZE(1,2);
hnode_size[TAG(math_kind,b010)]= NODE_SIZE(1,2);
hnode_size[TAG(math_kind,b100)]= NODE_SIZE(0,2);
hnode_size[TAG(math_kind,b101)]= NODE_SIZE(0,3);
hnode_size[TAG(math_kind,b110)]= NODE_SIZE(0,3);
hnode_size[TAG(math_kind,b111)]= NODE_SIZE(0,0);
hnode_size[TAG(math_kind,b011)]= NODE_SIZE(0,0);
/*:485*//*486:*/
#line 10537 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(adjust_kind,1)]= NODE_SIZE(0,1);
/*:486*//*487:*/
#line 10544 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(table_kind,b000)]= NODE_SIZE(1,2);
hnode_size[TAG(table_kind,b001)]= NODE_SIZE(1,2);
hnode_size[TAG(table_kind,b010)]= NODE_SIZE(1,2);
hnode_size[TAG(table_kind,b011)]= NODE_SIZE(1,2);
hnode_size[TAG(table_kind,b100)]= NODE_SIZE(0,3);
hnode_size[TAG(table_kind,b101)]= NODE_SIZE(0,3);
hnode_size[TAG(table_kind,b110)]= NODE_SIZE(0,3);
hnode_size[TAG(table_kind,b111)]= NODE_SIZE(0,3);
/*:487*//*488:*/
#line 10556 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(item_kind,b000)]= NODE_SIZE(0,1);
hnode_size[TAG(item_kind,1)]= NODE_SIZE(0,1);
hnode_size[TAG(item_kind,2)]= NODE_SIZE(0,1);
hnode_size[TAG(item_kind,3)]= NODE_SIZE(0,1);
hnode_size[TAG(item_kind,4)]= NODE_SIZE(0,1);
hnode_size[TAG(item_kind,5)]= NODE_SIZE(0,1);
hnode_size[TAG(item_kind,6)]= NODE_SIZE(0,1);
hnode_size[TAG(item_kind,7)]= NODE_SIZE(1,1);
/*:488*//*489:*/
#line 10569 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(image_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(image_kind,b001)]= NODE_SIZE(2+4+4,1);
hnode_size[TAG(image_kind,b010)]= NODE_SIZE(2+4+4,1);
hnode_size[TAG(image_kind,b011)]= NODE_SIZE(2+4+4,1);
hnode_size[TAG(image_kind,b100)]= NODE_SIZE(2+4+1+1,1);
hnode_size[TAG(image_kind,b101)]= NODE_SIZE(2+4+1,2);
hnode_size[TAG(image_kind,b110)]= NODE_SIZE(2+4+1,2);
hnode_size[TAG(image_kind,b111)]= NODE_SIZE(2+4,3);
/*:489*//*490:*/
#line 10582 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(link_kind,b000)]= NODE_SIZE(1,0);
hnode_size[TAG(link_kind,b001)]= NODE_SIZE(2,0);
hnode_size[TAG(link_kind,b010)]= NODE_SIZE(1,0);
hnode_size[TAG(link_kind,b011)]= NODE_SIZE(2,0);
hnode_size[TAG(link_kind,b100)]= NODE_SIZE(2,0);
hnode_size[TAG(link_kind,b101)]= NODE_SIZE(3,0);
hnode_size[TAG(link_kind,b110)]= NODE_SIZE(2,0);
hnode_size[TAG(link_kind,b111)]= NODE_SIZE(3,0);
/*:490*//*491:*/
#line 10596 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(stream_kind,b000)]= NODE_SIZE(1+1,1);
hnode_size[TAG(stream_kind,b010)]= NODE_SIZE(1,2);
hnode_size[TAG(stream_kind,b100)]= NODE_SIZE(1,0);
/*:491*//*492:*/
#line 10603 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hnode_size[TAG(color_kind,b000)]= NODE_SIZE(1,0);
/*:492*/
#line 11422 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*467:*/
#line 10228 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

printf("signed char hnode_size[0x100]= {\n");
for(i= 0;i<=0xff;i++)
{signed char s= hnode_size[i];
if(s>=0)printf("%d",s);else printf("-4*%d+%d",-(s>>2),s&3);
if(i<0xff)printf(",");else printf("};");
if((i&0x7)==0x7)printf(" /* %s */\n",content_name[KIND(i)]);
}
printf("\n\n");
/*:467*/
#line 11423 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*468:*/
#line 10245 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

for(k= 0;k<32;k++)
for(i= 0;i<8;i++)
if(hnode_size[TAG(k,i)]!=0)
content_known[k]|= (1<<i);
printf("uint8_t content_known[32]= {\n");
for(k= 0;k<32;k++)
{printf("0x%02X",content_known[k]);
if(k<31)printf(",");
else printf("};");
printf(" /* %s */\n",content_name[k]);
}
printf("\n");
/*:468*/
#line 11424 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

return 0;
}
/*:549*/
