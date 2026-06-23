/*560:*/
#line 11893 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#include "hibasetypes.h"
#include <math.h> 
#include <string.h> 
#include <ctype.h> 
#include <zlib.h> 
#include <sys/types.h> 
#include <sys/stat.h> 
#include <fcntl.h> 
#include "hierror.h"
#include "hiformat.h"
#if 1
#include "higet.h"
#else
#line 11907 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
/*1:*/
#line 329 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{uint32_t c;uint8_t f;}Glyph;
/*:1*//*114:*/
#line 2182 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{
Dimen h,d,w;
}Rule;
/*:114*//*123:*/
#line 2296 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{
bool x;
Xdimen d;
}Kern;
/*:123*//*141:*/
#line 2719 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{
Tag t;
uint32_t p;
uint32_t s;
}List;
/*:141*//*149:*/
#line 3145 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef enum{txt_font= 0x00,txt_global= 0x08,txt_local= 0x11,
txt_cc= 0x1D,txt_node= 0x1E,txt_hyphen= 0x1F,
txt_glue= 0x20,txt_ignore= 0xFB}Txt;
/*:149*//*160:*/
#line 3445 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{Dimen h,d,w,a;float32_t r;int8_t s,o;List l;}Box;
/*:160*//*187:*/
#line 4030 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{uint8_t f;List l;}Lig;
/*:187*//*195:*/
#line 4148 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{bool x;List p,q;uint8_t r;}Disc;
/*:195*//*228:*/
#line 4703 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{
uint16_t n;
float32_t a;
Xdimen w,h;
uint8_t wr,hr;
}Image;
/*:228*//*272:*/
#line 5811 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{
uint8_t*t;
int s;
int d;
uint16_t r;
}Outline;
/*:272*//*323:*/
#line 7188 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef
struct{uint8_t pg;uint32_t pos;bool on;int link;}RangePos;
/*:323*//*414:*/
#line 9246 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{Kind k;int n;}Ref;
/*:414*/
#line 11907 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*357:*/
#line 7937 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

typedef struct{
uint64_t pos;
uint32_t size,xsize;
uint16_t section_no;
char*file_name;
uint8_t*buffer;
uint32_t bsize;
}Entry;
/*:357*/
#line 11908 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*38:*/
#line 1078 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_STRING(S) S= (char*)hpos;\
 while(hpos<hend && *hpos!=0) { RNG("String character",*hpos,0x20,0x7E); hpos++;}\
 hpos++;
/*:38*//*147:*/
#line 2888 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_LIST(I,L) \
  if (((I)&0x3)==0) {uint8_t n= HGET8; REF_RNG(KIND((L).t),n); (L).s= 0;}\
  else { (L).s= hget_list_size(I); hget_size_boundary(I);\
    (L).p= hpos-hstart; \
    hpos= hpos+(L).s; hget_size_boundary(I);\
    { uint32_t s= hget_list_size(I); \
      if (s!=(L).s) \
      QUIT("List sizes at 0x%x and " SIZE_F " do not match 0x%x != 0x%x",node_pos+1,hpos-hstart-I-1,(L).s,s);}}
/*:147*//*343:*/
#line 7538 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_ERROR  QUIT("HGET overrun in section %d at " SIZE_F "\n",section_no,hpos-hstart)
#define HEND   ((hpos<=hend)?0:(HGET_ERROR,0))

#define HGET8      ((hpos<hend)?*(hpos++):(HGET_ERROR,0))
#define HGET16(X) ((X)= (hpos[0]<<8)+hpos[1],hpos+= 2,HEND)
#define HGET24(X) ((X)= (hpos[0]<<16)+(hpos[1]<<8)+hpos[2],hpos+= 3,HEND)
#define HGET32(X) ((X)= (hpos[0]<<24)+(hpos[1]<<16)+(hpos[2]<<8)+hpos[3],hpos+= 4,HEND)
#define HGETTAG(A) A= HGET8,DBGTAG(A,hpos-1)
/*:343*//*368:*/
#line 8166 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_SIZE(I) \
  if ((I)&b100) { \
    if (((I)&b011)==0) s= HGET8,xs= HGET8; \
    else if (((I)&b011)==1) HGET16(s),HGET16(xs); \
    else if (((I)&b011)==2) HGET24(s),HGET24(xs); \
    else if (((I)&b011)==3) HGET32(s),HGET32(xs); \
   } \
  else { \
    if (((I)&b011)==0) s= HGET8; \
    else if (((I)&b011)==1) HGET16(s); \
    else if (((I)&b011)==2) HGET24(s); \
    else if (((I)&b011)==3) HGET32(s); \
   }

#define HGET_ENTRY(I,E) \
{ uint16_t i; \
  uint32_t s= 0,xs= 0; \
  char *file_name; \
  HGET16(i); HGET_SIZE(I); HGET_STRING(file_name); \
  hset_entry(&(E),i,s,xs,file_name); \
}
/*:368*//*497:*/
#line 10677 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HBACK(X) ((hpos-(X)<hstart)?(QUIT("HTEG underflow\n"),NULL):(hpos-= (X)))

#define HTEG8     (HBACK(1),hpos[0])
#define HTEG16(X) (HBACK(2),(X)= (hpos[0]<<8)+hpos[1])
#define HTEG24(X) (HBACK(3),(X)= (hpos[0]<<16)+(hpos[1]<<8)+hpos[2])
#define HTEG32(X) (HBACK(4),(X)= (hpos[0]<<24)+(hpos[1]<<16)+(hpos[2]<<8)+hpos[3])
#define HTEGTAG(X) X= HTEG8,DBGTAG(X,hpos)
/*:497*/
#line 11909 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#endif
#line 11911 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*19:*/
#line 799 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_N(I,X) \
  if ((I)==1) (X)= HGET8;\
  else if ((I)==2) HGET16(X);\
  else if ((I)==3) HGET24(X);\
  else if ((I)==4) HGET32(X);

#define HGET_GLYPH(I,G) \
  HGET_N(I,(G).c); (G).f= HGET8; REF_RNG(font_kind,(G).f);\
  hwrite_glyph(&(G));\
/*:19*//*92:*/
#line 1812 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_XDIMEN(I,X) \
  if((I)&b100) HGET32((X).w); else (X).w= 0;\
  if((I)&b010) (X).h= hget_float32();  else (X).h= 0.0;\
  if((I)&b001) (X).v= hget_float32(); else (X).v= 0.0;
/*:92*//*98:*/
#line 1946 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_STRETCH(S) { Stch st;  HGET32(st.u); S.o= st.u&3;  st.u&= ~3; S.f= st.f; }
/*:98*//*107:*/
#line 2041 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_PENALTY(I,P) \
if (I==1) {int8_t n= HGET8;  P= n; } \
else if (I==2) {int16_t n; HGET16(n);RNG("Penalty",n,-20000,+20000);  P= n; }\
else if (I==3) {int32_t n; HGET32(n);RNG("Penalty",n,-20000,+20000);  P= n; }\
hwrite_signed(P);
/*:107*//*120:*/
#line 2240 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_RULE(I,R)\
if ((I)&b100) HGET32((R).h); else (R).h= RUNNING_DIMEN;\
if ((I)&b010) HGET32((R).d); else (R).d= RUNNING_DIMEN;\
if ((I)&b001) HGET32((R).w); else (R).w= RUNNING_DIMEN;
/*:120*//*129:*/
#line 2348 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_KERN(I,K) \
K.x= (I)&b100;\
if (((I)&b011)==2) {HGET32(K.d.w); K.d.h= K.d.v= 0.0;}\
else if (((I)&b011)==3) hget_xdimen_node(&(K.d));\
hwrite_kern(&k);
/*:129*//*138:*/
#line 2577 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_GLUE(I,G) {\
  if((I)!=b111) { if ((I)&b100) HGET32((G).w.w); else (G).w.w= 0;}\
  if((I)&b010) HGET_STRETCH((G).p) else (G).p.f= 0.0, (G).p.o= 0;\
  if((I)&b001) HGET_STRETCH((G).m) else  (G).m.f= 0.0, (G).m.o= 0;\
  if((I)==b111) hget_xdimen_node(&((G).w)); else (G).w.h= (G).w.v= 0.0;}
/*:138*//*157:*/
#line 3299 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_GREF(K,S) {uint8_t n= HGET8; REF(K,n);  return hwritef("\\" S "%d\\",n);}

/*:157*//*166:*/
#line 3555 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_BOX(I,B) \
HGET32(B.h);\
if ((I)&b001) HGET32(B.d);  else B.d= 0;\
HGET32(B.w);\
if ((I)&b010) HGET32(B.a); else B.a= 0;\
if ((I)&b100) { B.r= hget_float32(); B.s= HGET8;  B.o= B.s&0xF; B.s= B.s>>4; }\
else {  B.r= 0.0; B.o= B.s= 0; }\
hget_list(&(B.l));
/*:166*//*173:*/
#line 3784 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_SET(K,I) \
 { Dimen h,d; HGET32(h);\
   if ((I)&b001) HGET32(d);  else d= 0;\
   if (K==vset_kind && (d> MAX_DIMEN || d<-MAX_DIMEN)) { hwritef(" top"); d^= 0x40000000;}\
   hwrite_dimension(h); hwrite_dimension(d); }\
 { Dimen w; HGET32(w); hwrite_dimension(w);} \
 if ((I)&b010)  { Dimen a; HGET32(a); hwritef(" shifted"); hwrite_dimension(a);}\
 { Stretch p; HGET_STRETCH(p);hwrite_plus(&p);}\
 { Stretch m; HGET_STRETCH(m);hwrite_minus(&m);}\
 if ((I)&b100) {Xdimen x; hget_xdimen_node(&x); hwrite_xdimen_node(&x);} else HGET_REF(xdimen_kind);\
 { List l; hget_list(&l); hwrite_list(&l); }


#define HGET_PACK(K,I) \
 if (K==vpack_kind) {Dimen d; HGET32(d); \
   if (d> MAX_DIMEN || d<-MAX_DIMEN) { hwritef(" top"); d^= 0x40000000;}\
   if (d!=MAX_DIMEN) {hwritef(" max depth");hwrite_dimension(d);}} \
 if ((I)&b010){Dimen s; HGET32(s); hwritef(" shifted");  hwrite_dimension(s); }\
 if ((I)&b001) hwritef(" add"); else hwritef(" to");\
 if ((I)&b100) {Xdimen x; hget_xdimen_node(&x);hwrite_xdimen_node(&x);}\
 else HGET_REF(xdimen_kind);\
 { List l; hget_list(&l); hwrite_list(&l); }
/*:173*//*179:*/
#line 3878 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_LEADERS(I) \
if ((I)&b100) hget_glue_node();\
hwrite_leaders_type((I)&b011);\
if (KIND(*hpos)==rule_kind) hget_rule_node(); \
else if (KIND(*hpos)==hbox_kind) hget_hbox_node(); \
else  hget_vbox_node();
/*:179*//*185:*/
#line 3983 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_BASELINE(I,B) \
  if((I)&b001) HGET32((B).lsl); else B.lsl= 0; hwrite_dimension(B.lsl);\
  if((I)&b100) hget_glue_node(); \
  else {B.bs.p.o= B.bs.m.o= B.bs.w.w= 0; B.bs.w.h= B.bs.w.v= B.bs.p.f= B.bs.m.f= 0.0; hwrite_glue_node(&(B.bs));}\
  if((I)&b010) hget_glue_node(); \
  else {B.ls.p.o= B.ls.m.o= B.ls.w.w= 0; B.ls.w.h= B.ls.w.v= B.ls.p.f= B.ls.m.f= 0.0; hwrite_glue_node(&(B.ls));}
/*:185*//*193:*/
#line 4087 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_LIG(I,L) \
(L).f= HGET8;REF(font_kind,(L).f);\
if ((I)==7) hget_list(&((L).l)); \
else { (L).l.s= (I); (L).l.p= hpos-hstart;  hpos+= (L).l.s;} \
hwrite_ligature(&(L));
/*:193*//*201:*/
#line 4208 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_DISC(I,Y)\
if ((I)&b100) {uint8_t r= HGET8; (Y).r= r&0x7F;  RNG("Replace count",(Y).r,0,31); (Y).x= (r&0x80)!=0; }\
else { (Y).r= 0;  (Y).x= false;}\
if ((I)&b010) hget_list(&((Y).p)); else { (Y).p.p= hpos-hstart; (Y).p.s= 0; (Y).p.t= TAG(list_kind,b000); }\
if ((I)&b001) hget_list(&((Y).q)); else { (Y).q.p= hpos-hstart; (Y).q.s= 0; (Y).q.t= TAG(list_kind,b000); }
/*:201*//*208:*/
#line 4349 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_PAR(I) \
{ uint8_t n;\
 if ((I)==b100) {n= HGET8; REF(param_kind,n);}\
 if ((I)&b100)  {Xdimen x; hget_xdimen_node(&x); hwrite_xdimen(&x);}  else HGET_REF(xdimen_kind);\
 if ((I)&b010) { List l; hget_param_list(&l); hwrite_param_list(&l); } \
 else if ((I)!=b100) HGET_REF(param_kind) else hwrite_ref(n);\
 { List l; hget_list(&l); hwrite_list(&l); }}
/*:208*//*213:*/
#line 4424 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_MATH(I) \
if ((I)&b100) { List l; hget_param_list(&l); hwrite_param_list(&l); } \
else HGET_REF(param_kind);\
if ((I)&b010) hget_hbox_node(); \
{ List l; hget_list(&l); hwrite_list(&l); } \
if ((I)&b001) hget_hbox_node();
/*:213*//*226:*/
#line 4624 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_TABLE(I) \
if(I&b010) hwritef(" v"); else hwritef(" h"); \
if ((I)&b001) hwritef(" add"); else hwritef(" to");\
if ((I)&b100) {Xdimen x; hget_xdimen_node(&x); hwrite_xdimen_node(&x);} else HGET_REF(xdimen_kind)\
{ List l; hget_list(&l); hwrite_list(&l); }  \
{ List l; hget_list(&l); hwrite_list(&l); }  
/*:226*//*234:*/
#line 4794 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_IMAGE(I) \
{ Image x= {0};\
HGET16(x.n);\
if ((I)&b100) { x.a= hget_float32();\
 if ((I)==b111) {hget_xdimen_node(&x.w);hget_xdimen_node(&x.h);}\
 else if ((I)==b110) {x.hr= HGET8;hget_xdimen_node(&x.w);}\
 else if ((I)==b101) {x.wr= HGET8;hget_xdimen_node(&x.h);}\
 else  {x.wr= HGET8;x.hr= HGET8;}}\
else if((I)==b011) {HGET32(x.w.w);HGET32(x.h.w);} \
else if((I)==b010) { x.a= hget_float32(); HGET32(x.w.w);}\
else if((I)==b001){ x.a= hget_float32(); HGET32(x.h.w);}\
hwrite_image(&x);\
{List d;  hget_list(&d);hwrite_list(&d);}}
/*:234*//*265:*/
#line 5736 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_LINK(I) \
{ int n,c; if (I&b001) HGET16(n); else n= HGET8;\
  if (I&b100) c= HGET8; else c= (I&b010)?1:0xFF;\
  hwrite_link(n,c,I&b010); }
/*:265*//*318:*/
#line 7016 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_STREAM(I) \
 {uint8_t n= HGET8; REF_RNG(stream_kind,n); hwrite_ref(n);}\
if ((I)&b010) { List l; hget_param_list(&l); hwrite_param_list(&l); } \
else HGET_REF(param_kind);\
{ List l; hget_list(&l); hwrite_list(&l); }
/*:318*//*417:*/
#line 9298 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_REF(K) {uint8_t n= HGET8; REF(K,n); hwrite_ref(n);}
/*:417*/
#line 11912 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*22:*/
#line 898 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define hwritec(c) (hout?putc(c,hout):0)
#define hwritef(...) (hout?fprintf(hout,__VA_ARGS__):0)
/*:22*/
#line 11913 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


/*252:*/
#line 5434 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Label*labels= NULL;
int first_label= -1;
/*:252*//*289:*/
#line 6192 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

ColorSet colors_0,colors_n;
int colors_i;
/*:289*//*324:*/
#line 7193 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

RangePos*range_pos;
int next_range= 1,max_range;
int*page_on;
/*:324*//*335:*/
#line 7377 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

char hbanner[MAX_BANNER+1];
int hbanner_size= 0;
/*:335*//*342:*/
#line 7530 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

uint8_t*hpos= NULL,*hstart= NULL,*hend= NULL,*hpos0= NULL;
/*:342*//*348:*/
#line 7611 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

char*hin_name= NULL;
uint64_t hin_size= 0;
uint8_t*hin_addr= NULL;
uint64_t hin_time= 0;
/*:348*//*406:*/
#line 9118 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

char**hfont_name;
/*:406*//*450:*/
#line 9884 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

unsigned int debugflags= DBGNONE;
int option_utf8= false;
int option_hex= false;
int option_force= false;
int option_global= false;
int option_aux= false;
int option_compress= false;
char*stem_name= NULL;
int stem_length= 0;
/*:450*//*453:*/
#line 10018 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

FILE*hin= NULL,*hout= NULL,*hlog= NULL;
/*:453*/
#line 11915 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*273:*/
#line 5820 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Outline*outlines;
/*:273*/
#line 11916 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*349:*/
#line 7618 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#ifndef USE_MMAP
void hget_unmap(void)
{if(hin_addr!=NULL)free(hin_addr);
hin_addr= NULL;
hin_size= 0;
}
bool hget_map(void)
{FILE*f;
struct stat st;
size_t s,t;
uint64_t u;
f= fopen(hin_name,"rb");
if(f==NULL)
{MESSAGE("Unable to open file: %s\n",hin_name);return false;}
if(stat(hin_name,&st)<0)
{MESSAGE("Unable to obtain file size: %s\n",hin_name);
fclose(f);
return false;
}
if(st.st_size==0)
{MESSAGE("File %s is empty\n",hin_name);
fclose(f);
return false;
}
u= st.st_size;
if(hin_addr!=NULL)hget_unmap();
hin_addr= malloc(u);
if(hin_addr==NULL)
{MESSAGE("Unable to allocate 0x%"PRIx64" byte for File %s\n",u,hin_name);
fclose(f);
return 0;
}
t= 0;
do{
s= fread(hin_addr+t,1,u,f);
if(s<=0)
{MESSAGE("Unable to read file %s\n",hin_name);
fclose(f);
free(hin_addr);
hin_addr= NULL;
return false;
}
t= t+s;
u= u-s;
}while(u> 0);
hin_size= st.st_size;
hin_time= st.st_mtime;
return true;
}

#else
#line 7670 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#include <sys/mman.h> 

void hget_unmap(void)
{munmap(hin_addr,hin_size);
hin_addr= NULL;
hin_size= 0;
}

bool hget_map(void)
{struct stat st;
int fd;
fd= open(hin_name,O_RDONLY,0);
if(fd<0)
{MESSAGE("Unable to open file %s\n",hin_name);return false;}
if(fstat(fd,&st)<0)
{MESSAGE("Unable to get file size\n");
close(fd);
return false;
}
if(st.st_size==0)
{MESSAGE("File %s is empty\n",hin_name);
close(fd);
return false;
}
if(hin_addr!=NULL)hget_unmap();
hin_size= st.st_size;
hin_time= st.st_mtime;
hin_addr= mmap(NULL,hin_size,PROT_READ,MAP_PRIVATE,fd,0);
if(hin_addr==MAP_FAILED)
{close(fd);
hin_addr= NULL;hin_size= 0;
MESSAGE("Unable to map file into memory\n");
return 0;
}
close(fd);
return hin_size;
}
#endif
#line 7709 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*:349*/
#line 11917 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*336:*/
#line 7382 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


bool hcheck_banner(char*magic)
{
int v,s;
char*t;
t= hbanner;
if(strncmp(magic,hbanner,4)!=0)
{MESSAGE("This is not a %s file\n",magic);return false;}
else t+= 4;
if(hbanner[hbanner_size-1]!='\n')
{MESSAGE("Banner exceeds maximum size=0x%x\n",MAX_BANNER);return false;}
if(*t!=' ')
{MESSAGE("Space expected in banner after %s\n",magic);return false;}
else t++;
v= strtol(t,&t,10);
if(*t!='.')
{MESSAGE("Dot expected in banner after HINT version number\n");return false;}
else t++;
s= strtol(t,&t,10);
if(v!=HINT_VERSION)
{MESSAGE("Wrong HINT version: got %d.%d, expected %d.%d\n",
v,s,HINT_VERSION,HINT_MINOR_VERSION);return false;}
#if 0 
if(s<HINT_MINOR_VERSION)
{MESSAGE("Outdated HINT minor version: got %d.%d, expected %d.%d\n",
v,s,HINT_VERSION,HINT_MINOR_VERSION);}
else
#endif
#line 7411 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
 if(s> HINT_MINOR_VERSION)
{MESSAGE("More recent HINT minor version: got %d.%d, expected %d.%d, update your application\n",
v,s,HINT_VERSION,HINT_MINOR_VERSION);}
if(*t!=' '&&*t!='\n')
{MESSAGE("Space expected in banner after HINT minor version\n");return false;}
LOG("%s file version "HINT_VERSION_STRING":%s",magic,t);
DBG(DBGDIR,"banner size=0x%x\n",hbanner_size);
return true;
}
/*:336*/
#line 11918 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*358:*/
#line 7951 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Entry*dir= NULL;
uint16_t section_no,max_section_no;
void new_directory(uint32_t entries)
{DBG(DBGDIR,"Creating directory with %d entries\n",entries);
RNG("Directory entries",entries,3,0x10000);
max_section_no= entries-1;
ALLOCATE(dir,entries,Entry);
dir[0].section_no= 0;dir[1].section_no= 1;dir[2].section_no= 2;
}
/*:358*//*359:*/
#line 7964 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hset_entry(Entry*e,uint16_t i,uint32_t size,uint32_t xsize,char*file_name)
{e->section_no= i;
e->size= size;e->xsize= xsize;
if(file_name==NULL||*file_name==0)
e->file_name= NULL;
else
e->file_name= strdup(file_name);
DBG(DBGDIR,"Creating entry %d: \"%s\" size=0x%x xsize=0x%x\n",i,file_name,size,xsize);
}
/*:359*/
#line 11919 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*38:*/
#line 1078 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_STRING(S) S= (char*)hpos;\
 while(hpos<hend && *hpos!=0) { RNG("String character",*hpos,0x20,0x7E); hpos++;}\
 hpos++;
/*:38*//*147:*/
#line 2888 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_LIST(I,L) \
  if (((I)&0x3)==0) {uint8_t n= HGET8; REF_RNG(KIND((L).t),n); (L).s= 0;}\
  else { (L).s= hget_list_size(I); hget_size_boundary(I);\
    (L).p= hpos-hstart; \
    hpos= hpos+(L).s; hget_size_boundary(I);\
    { uint32_t s= hget_list_size(I); \
      if (s!=(L).s) \
      QUIT("List sizes at 0x%x and " SIZE_F " do not match 0x%x != 0x%x",node_pos+1,hpos-hstart-I-1,(L).s,s);}}
/*:147*//*343:*/
#line 7538 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_ERROR  QUIT("HGET overrun in section %d at " SIZE_F "\n",section_no,hpos-hstart)
#define HEND   ((hpos<=hend)?0:(HGET_ERROR,0))

#define HGET8      ((hpos<hend)?*(hpos++):(HGET_ERROR,0))
#define HGET16(X) ((X)= (hpos[0]<<8)+hpos[1],hpos+= 2,HEND)
#define HGET24(X) ((X)= (hpos[0]<<16)+(hpos[1]<<8)+hpos[2],hpos+= 3,HEND)
#define HGET32(X) ((X)= (hpos[0]<<24)+(hpos[1]<<16)+(hpos[2]<<8)+hpos[3],hpos+= 4,HEND)
#define HGETTAG(A) A= HGET8,DBGTAG(A,hpos-1)
/*:343*//*368:*/
#line 8166 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_SIZE(I) \
  if ((I)&b100) { \
    if (((I)&b011)==0) s= HGET8,xs= HGET8; \
    else if (((I)&b011)==1) HGET16(s),HGET16(xs); \
    else if (((I)&b011)==2) HGET24(s),HGET24(xs); \
    else if (((I)&b011)==3) HGET32(s),HGET32(xs); \
   } \
  else { \
    if (((I)&b011)==0) s= HGET8; \
    else if (((I)&b011)==1) HGET16(s); \
    else if (((I)&b011)==2) HGET24(s); \
    else if (((I)&b011)==3) HGET32(s); \
   }

#define HGET_ENTRY(I,E) \
{ uint16_t i; \
  uint32_t s= 0,xs= 0; \
  char *file_name; \
  HGET16(i); HGET_SIZE(I); HGET_STRING(file_name); \
  hset_entry(&(E),i,s,xs,file_name); \
}
/*:368*//*497:*/
#line 10677 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HBACK(X) ((hpos-(X)<hstart)?(QUIT("HTEG underflow\n"),NULL):(hpos-= (X)))

#define HTEG8     (HBACK(1),hpos[0])
#define HTEG16(X) (HBACK(2),(X)= (hpos[0]<<8)+hpos[1])
#define HTEG24(X) (HBACK(3),(X)= (hpos[0]<<16)+(hpos[1]<<8)+hpos[2])
#define HTEG32(X) (HBACK(4),(X)= (hpos[0]<<24)+(hpos[1]<<16)+(hpos[2]<<8)+hpos[3])
#define HTEGTAG(X) X= HTEG8,DBGTAG(X,hpos)
/*:497*/
#line 11920 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*337:*/
#line 7429 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_banner(void)
{hbanner_size= 0;
while(hbanner_size<MAX_BANNER&&hpos<hend)
{uint8_t c= HGET8;
hbanner[hbanner_size++]= c;
if(c=='\n')break;
}
hbanner[hbanner_size]= 0;
}
/*:337*//*350:*/
#line 7723 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


static void hdecompress(uint16_t n)
{z_stream z;
uint8_t*buffer;
int i;

DBG(DBGCOMPRESS,"Decompressing section %d from 0x%x to 0x%x byte\n",n,dir[n].size,dir[n].xsize);
z.zalloc= (alloc_func)0;
z.zfree= (free_func)0;
z.opaque= (voidpf)0;
z.next_in= hstart;
z.avail_in= hend-hstart;
if(inflateInit(&z)!=Z_OK)
QUIT("Unable to initialize decompression: %s",z.msg);
ALLOCATE(buffer,dir[n].xsize+MAX_TAG_DISTANCE,uint8_t);
DBG(DBGBUFFER,"Allocating output buffer size=0x%x, margin=0x%x\n",dir[n].xsize,MAX_TAG_DISTANCE);
z.next_out= buffer;
z.avail_out= dir[n].xsize+MAX_TAG_DISTANCE;
i= inflate(&z,Z_FINISH);
DBG(DBGCOMPRESS,"in: avail/total=0x%x/0x%lx ""out: avail/total=0x%x/0x%lx, return %d;\n",
z.avail_in,z.total_in,z.avail_out,z.total_out,i);
if(i!=Z_STREAM_END)
QUIT("Unable to complete decompression: %s",z.msg);
if(z.avail_in!=0)
QUIT("Decompression missed input data");
if(z.total_out!=dir[n].xsize)
QUIT("Decompression output size mismatch 0x%lx != 0x%x",z.total_out,dir[n].xsize);
if(inflateEnd(&z)!=Z_OK)
QUIT("Unable to finalize decompression: %s",z.msg);
dir[n].buffer= buffer;
dir[n].bsize= dir[n].xsize;
hpos0= hpos= hstart= buffer;
hend= hstart+dir[n].xsize;
}
/*:350*//*352:*/
#line 7811 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_section(uint16_t n)
{DBG(DBGDIR,"Reading section %d\n",n);
RNG("Section number",n,0,max_section_no);
if(dir[n].buffer!=NULL&&dir[n].xsize> 0)
{hpos0= hpos= hstart= dir[n].buffer;
hend= hstart+dir[n].xsize;
}
else
{hpos0= hpos= hstart= hin_addr+dir[n].pos;
hend= hstart+dir[n].size;
if(dir[n].xsize> 0)hdecompress(n);
}
}
/*:352*//*369:*/
#line 8190 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_entry(Entry*e)
{/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 8192 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

DBG(DBGDIR,"Reading directory entry\n");
switch(a)
{case TAG(0,b000+0):HGET_ENTRY(b000+0,*e);break;
case TAG(0,b000+1):HGET_ENTRY(b000+1,*e);break;
case TAG(0,b000+2):HGET_ENTRY(b000+2,*e);break;
case TAG(0,b000+3):HGET_ENTRY(b000+3,*e);break;
case TAG(0,b100+0):HGET_ENTRY(b100+0,*e);break;
case TAG(0,b100+1):HGET_ENTRY(b100+1,*e);break;
case TAG(0,b100+2):HGET_ENTRY(b100+2,*e);break;
case TAG(0,b100+3):HGET_ENTRY(b100+3,*e);break;
default:TAGERR(a);break;
}
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 8205 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:369*//*370:*/
#line 8222 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hget_root(Entry*root)
{DBG(DBGDIR,"Root entry at "SIZE_F"\n",hpos-hstart);
hget_entry(root);
root->pos= hpos-hstart;
max_section_no= root->section_no;
root->section_no= 0;
if(max_section_no<2)QUIT("Sections 0, 1, and 2 are mandatory");
}

void hget_directory(void)
{int i;
Entry root= {0};
hget_root(&root);
DBG(DBGDIR,"Directory\n");
new_directory(max_section_no+1);
dir[0]= root;
DBG(DBGDIR,"Directory entry 1 at 0x%"PRIx64"\n",dir[0].pos);
hget_section(0);
for(i= 1;i<=max_section_no;i++)
{hget_entry(&(dir[i]));
dir[i].pos= dir[i-1].pos+dir[i-1].size;
DBG(DBGDIR,"Section %d at 0x%"PRIx64"\n",i,dir[i].pos);
}
}

void hclear_dir(void)
{int i;
if(dir==NULL)return;
for(i= 0;i<3;i++)
if(dir[i].xsize> 0&&dir[i].buffer!=NULL)free(dir[i].buffer);
free(dir);dir= NULL;
}

/*:370*//*390:*/
#line 8660 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_max_definitions(void)
{Kind k;
/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 8663 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(a!=TAG(list_kind,0))QUIT("Start of maximum list expected");
for(k= 0;k<32;k++)max_ref[k]= max_default[k];max_outline= -1;
while(true)
{int n;
if(hpos>=hend)QUIT("Unexpected end of maximum list");
node_pos= hpos-hstart;
HGETTAG(a);
k= KIND(a);
if(k==list_kind)break;
if(INFO(a)&b001)HGET16(n);else n= HGET8;
switch(a)
{/*246:*/
#line 5363 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(outline_kind,b100):
case TAG(outline_kind,b101):max_outline= n;
DBG(DBGDEF|DBGLABEL,"max(outline) = %d\n",max_outline);break;
/*:246*/
#line 8675 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

default:
if(max_fixed[k]> max_default[k])
MESSAGE("Maximum value for kind %s not supported\n",definition_name[k]);else
{RNG("Maximum number",n,max_default[k],MAX_REF(k));
max_ref[k]= n;
DBG(DBGDEF,"max(%s) = %d\n",definition_name[k],max_ref[k]);
}
break;
}
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 8685 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
if(INFO(a)!=0)QUIT("End of maximum list with info %d",INFO(a));
DBG(DBGDEF,"Getting Max Definitions END\n");
}
/*:390*/
#line 11921 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


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
#line 11923 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*561:*/
#line 11982 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hteg_content_node(void);
static void hteg_content(Tag z);
static void hteg_xdimen_node(Xdimen*x);
static void hteg_list(List*l);
static void hteg_param_list(List*l);
static void hteg_rule_node(void);
static void hteg_hbox_node(void);
static void hteg_vbox_node(void);
static void hteg_glue_node(void);
static int hteg_unknown(Tag z);
/*:561*/
#line 11924 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*466:*/
#line 10199 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

uint32_t hff_list_pos= 0,hff_list_size= 0;
Tag hff_tag;
void hff_hpos(void)
{signed char i,b,n;
hff_tag= *hpos;
DBGTAG(hff_tag,hpos);
i= hnode_size[hff_tag];
if(i> 0){hpos= hpos+NODE_HEAD(i)+2;return;}
else if(i<0)
{n= NODE_TAIL(i);b= NODE_HEAD(i);
hpos= hpos+1+b;
while(n> 0)
{hff_hpos();n--;}
hpos++;
return;
}
else if(hff_tag<=TAG(param_kind,7))
/*469:*/
#line 10269 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

switch(INFO(hff_tag)&0x3){
case 0:hff_list_pos= hpos-hstart+1;hff_list_size= 0;hpos= hpos+3;return;
case 1:hpos++;hff_list_size= HGET8;hff_list_pos= hpos-hstart+1;hpos= hpos+1+hff_list_size+1+1+1;return;
case 2:hpos++;HGET16(hff_list_size);hff_list_pos= hpos-hstart+1;hpos= hpos+1+hff_list_size+1+2+1;return;
case 3:hpos++;HGET32(hff_list_size);hff_list_pos= hpos-hstart+1;hpos= hpos+1+hff_list_size+1+4+1;return;
default:QUIT("List with unknown info [%s,%d] at "SIZE_F"\n",NAME(hff_tag),INFO(hff_tag),hpos-hstart);
}
/*:469*/
#line 10217 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

TAGERR(hff_tag);
}
/*:466*//*498:*/
#line 10690 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

float32_t hteg_float32(void)
{union{float32_t d;uint32_t bits;}u;
HTEG32(u.bits);
return u.d;
}
/*:498*//*537:*/
#line 11140 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


uint32_t hteg_list_size(Info info)
{uint32_t n= 0;
info= info&0x3;
if(info==0)return 0;
else if(info==1)n= HTEG8;
else if(info==2)HTEG16(n);
else if(info==3)HTEG32(n);
else QUIT("List info %d must be 0, 1, 2, or 3",info);
return n;
}
/*:537*/
#line 11925 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*493:*/
#line 10622 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hteg_content_section(void)
{hget_section(2);
hpos= hend;
while(hpos> hstart)
hteg_content_node();
}
/*:493*//*494:*/
#line 10641 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hteg_content_node(void)
{/*495:*/
#line 10662 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= hpos-hstart;
if(hpos<=hstart)return;
HTEGTAG(z);
/*:495*/
#line 10643 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hteg_content(z);
/*496:*/
#line 10669 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HTEGTAG(a);
if(a!=z)QUIT("Tag mismatch [%s,%d]!=[%s,%d] at "SIZE_F" to 0x%x\n",NAME(a),INFO(a),NAME(z),INFO(z),
hpos-hstart,node_pos-1);
/*:496*/
#line 10645 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}

static void hteg_content(Tag z)
{switch(z)
{
/*503:*/
#line 10750 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(glyph_kind,1):{Glyph g;HTEG_GLYPH(1,g);}break;
case TAG(glyph_kind,2):{Glyph g;HTEG_GLYPH(2,g);}break;
case TAG(glyph_kind,3):{Glyph g;HTEG_GLYPH(3,g);}break;
case TAG(glyph_kind,4):{Glyph g;HTEG_GLYPH(4,g);}break;
/*:503*//*505:*/
#line 10767 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(penalty_kind,1):{int32_t p;HTEG_PENALTY(1,p);}break;
case TAG(penalty_kind,2):{int32_t p;HTEG_PENALTY(2,p);}break;
case TAG(penalty_kind,3):{int32_t p;HTEG_PENALTY(2,p);}break;
/*:505*//*507:*/
#line 10780 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(kern_kind,b010):{Xdimen x;HTEG_KERN(b010,x);}break;
case TAG(kern_kind,b011):{Xdimen x;HTEG_KERN(b011,x);}break;
case TAG(kern_kind,b110):{Xdimen x;HTEG_KERN(b110,x);}break;
case TAG(kern_kind,b111):{Xdimen x;HTEG_KERN(b111,x);}break;
/*:507*//*508:*/
#line 10789 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(language_kind,1):
case TAG(language_kind,2):
case TAG(language_kind,3):
case TAG(language_kind,4):
case TAG(language_kind,5):
case TAG(language_kind,6):
case TAG(language_kind,7):break;
/*:508*//*510:*/
#line 10808 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(rule_kind,b011):{Rule r;HTEG_RULE(b011,r);}break;
case TAG(rule_kind,b101):{Rule r;HTEG_RULE(b101,r);}break;
case TAG(rule_kind,b001):{Rule r;HTEG_RULE(b001,r);}break;
case TAG(rule_kind,b110):{Rule r;HTEG_RULE(b110,r);}break;
case TAG(rule_kind,b111):{Rule r;HTEG_RULE(b111,r);}break;
/*:510*//*513:*/
#line 10835 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(glue_kind,b001):{Glue g;HTEG_GLUE(b001,g);}break;
case TAG(glue_kind,b010):{Glue g;HTEG_GLUE(b010,g);}break;
case TAG(glue_kind,b011):{Glue g;HTEG_GLUE(b011,g);}break;
case TAG(glue_kind,b100):{Glue g;HTEG_GLUE(b100,g);}break;
case TAG(glue_kind,b101):{Glue g;HTEG_GLUE(b101,g);}break;
case TAG(glue_kind,b110):{Glue g;HTEG_GLUE(b110,g);}break;
case TAG(glue_kind,b111):{Glue g;HTEG_GLUE(b111,g);}break;
/*:513*//*516:*/
#line 10868 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(hbox_kind,b000):{Box b;HTEG_BOX(b000,b);}break;
case TAG(hbox_kind,b001):{Box b;HTEG_BOX(b001,b);}break;
case TAG(hbox_kind,b010):{Box b;HTEG_BOX(b010,b);}break;
case TAG(hbox_kind,b011):{Box b;HTEG_BOX(b011,b);}break;
case TAG(hbox_kind,b100):{Box b;HTEG_BOX(b100,b);}break;
case TAG(hbox_kind,b101):{Box b;HTEG_BOX(b101,b);}break;
case TAG(hbox_kind,b110):{Box b;HTEG_BOX(b110,b);}break;
case TAG(hbox_kind,b111):{Box b;HTEG_BOX(b111,b);}break;
case TAG(vbox_kind,b000):{Box b;HTEG_BOX(b000,b);}break;
case TAG(vbox_kind,b001):{Box b;HTEG_BOX(b001,b);}break;
case TAG(vbox_kind,b010):{Box b;HTEG_BOX(b010,b);}break;
case TAG(vbox_kind,b011):{Box b;HTEG_BOX(b011,b);}break;
case TAG(vbox_kind,b100):{Box b;HTEG_BOX(b100,b);}break;
case TAG(vbox_kind,b101):{Box b;HTEG_BOX(b101,b);}break;
case TAG(vbox_kind,b110):{Box b;HTEG_BOX(b110,b);}break;
case TAG(vbox_kind,b111):{Box b;HTEG_BOX(b111,b);}break;
/*:516*//*519:*/
#line 10928 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(hset_kind,b000):HTEG_SET(b000);break;
case TAG(hset_kind,b001):HTEG_SET(b001);break;
case TAG(hset_kind,b010):HTEG_SET(b010);break;
case TAG(hset_kind,b011):HTEG_SET(b011);break;
case TAG(hset_kind,b100):HTEG_SET(b100);break;
case TAG(hset_kind,b101):HTEG_SET(b101);break;
case TAG(hset_kind,b110):HTEG_SET(b110);break;
case TAG(hset_kind,b111):HTEG_SET(b111);break;

case TAG(vset_kind,b000):HTEG_SET(b000);break;
case TAG(vset_kind,b001):HTEG_SET(b001);break;
case TAG(vset_kind,b010):HTEG_SET(b010);break;
case TAG(vset_kind,b011):HTEG_SET(b011);break;
case TAG(vset_kind,b100):HTEG_SET(b100);break;
case TAG(vset_kind,b101):HTEG_SET(b101);break;
case TAG(vset_kind,b110):HTEG_SET(b110);break;
case TAG(vset_kind,b111):HTEG_SET(b111);break;

case TAG(hpack_kind,b000):HTEG_PACK(hpack_kind,b000);break;
case TAG(hpack_kind,b001):HTEG_PACK(hpack_kind,b001);break;
case TAG(hpack_kind,b010):HTEG_PACK(hpack_kind,b010);break;
case TAG(hpack_kind,b011):HTEG_PACK(hpack_kind,b011);break;
case TAG(hpack_kind,b100):HTEG_PACK(hpack_kind,b100);break;
case TAG(hpack_kind,b101):HTEG_PACK(hpack_kind,b101);break;
case TAG(hpack_kind,b110):HTEG_PACK(hpack_kind,b110);break;
case TAG(hpack_kind,b111):HTEG_PACK(hpack_kind,b111);break;

case TAG(vpack_kind,b000):HTEG_PACK(vpack_kind,b000);break;
case TAG(vpack_kind,b001):HTEG_PACK(vpack_kind,b001);break;
case TAG(vpack_kind,b010):HTEG_PACK(vpack_kind,b010);break;
case TAG(vpack_kind,b011):HTEG_PACK(vpack_kind,b011);break;
case TAG(vpack_kind,b100):HTEG_PACK(vpack_kind,b100);break;
case TAG(vpack_kind,b101):HTEG_PACK(vpack_kind,b101);break;
case TAG(vpack_kind,b110):HTEG_PACK(vpack_kind,b110);break;
case TAG(vpack_kind,b111):HTEG_PACK(vpack_kind,b111);break;
/*:519*//*521:*/
#line 10977 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(leaders_kind,1):HTEG_LEADERS(1);break;
case TAG(leaders_kind,2):HTEG_LEADERS(2);break;
case TAG(leaders_kind,3):HTEG_LEADERS(3);break;
case TAG(leaders_kind,b100|1):HTEG_LEADERS(b100|1);break;
case TAG(leaders_kind,b100|2):HTEG_LEADERS(b100|2);break;
case TAG(leaders_kind,b100|3):HTEG_LEADERS(b100|3);break;
/*:521*//*523:*/
#line 10997 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(baseline_kind,b001):{Baseline b;HTEG_BASELINE(b001,b);}break;
case TAG(baseline_kind,b010):{Baseline b;HTEG_BASELINE(b010,b);}break;
case TAG(baseline_kind,b011):{Baseline b;HTEG_BASELINE(b011,b);}break;
case TAG(baseline_kind,b100):{Baseline b;HTEG_BASELINE(b100,b);}break;
case TAG(baseline_kind,b101):{Baseline b;HTEG_BASELINE(b101,b);}break;
case TAG(baseline_kind,b110):{Baseline b;HTEG_BASELINE(b110,b);}break;
case TAG(baseline_kind,b111):{Baseline b;HTEG_BASELINE(b111,b);}break;
/*:523*//*525:*/
#line 11015 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(ligature_kind,1):{Lig l;HTEG_LIG(1,l);}break;
case TAG(ligature_kind,2):{Lig l;HTEG_LIG(2,l);}break;
case TAG(ligature_kind,3):{Lig l;HTEG_LIG(3,l);}break;
case TAG(ligature_kind,4):{Lig l;HTEG_LIG(4,l);}break;
case TAG(ligature_kind,5):{Lig l;HTEG_LIG(5,l);}break;
case TAG(ligature_kind,6):{Lig l;HTEG_LIG(6,l);}break;
case TAG(ligature_kind,7):{Lig l;HTEG_LIG(7,l);}break;
/*:525*//*527:*/
#line 11034 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(disc_kind,b001):{Disc h;HTEG_DISC(b001,h);}break;
case TAG(disc_kind,b010):{Disc h;HTEG_DISC(b010,h);}break;
case TAG(disc_kind,b011):{Disc h;HTEG_DISC(b011,h);}break;
case TAG(disc_kind,b100):{Disc h;HTEG_DISC(b100,h);}break;
case TAG(disc_kind,b101):{Disc h;HTEG_DISC(b101,h);}break;
case TAG(disc_kind,b110):{Disc h;HTEG_DISC(b110,h);}break;
case TAG(disc_kind,b111):{Disc h;HTEG_DISC(b111,h);}break;
/*:527*//*529:*/
#line 11055 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(par_kind,b000):HTEG_PAR(b000);break;
case TAG(par_kind,b010):HTEG_PAR(b010);break;
case TAG(par_kind,b100):HTEG_PAR(b100);break;
case TAG(par_kind,b110):HTEG_PAR(b110);break;
/*:529*//*531:*/
#line 11073 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(math_kind,b000):HTEG_MATH(b000);break;
case TAG(math_kind,b001):HTEG_MATH(b001);break;
case TAG(math_kind,b010):HTEG_MATH(b010);break;
case TAG(math_kind,b100):HTEG_MATH(b100);break;
case TAG(math_kind,b101):HTEG_MATH(b101);break;
case TAG(math_kind,b110):HTEG_MATH(b110);break;
case TAG(math_kind,b011):
case TAG(math_kind,b111):break;
/*:531*//*533:*/
#line 11101 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(image_kind,b001):HTEG_IMAGE(b001);break;
case TAG(image_kind,b010):HTEG_IMAGE(b010);break;
case TAG(image_kind,b011):HTEG_IMAGE(b011);break;
case TAG(image_kind,b100):HTEG_IMAGE(b100);break;
case TAG(image_kind,b101):HTEG_IMAGE(b101);break;
case TAG(image_kind,b110):HTEG_IMAGE(b110);break;
case TAG(image_kind,b111):HTEG_IMAGE(b111);break;
/*:533*//*535:*/
#line 11119 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(link_kind,b000):HTEG_LINK(b000);break;
case TAG(link_kind,b001):HTEG_LINK(b001);break;
case TAG(link_kind,b010):HTEG_LINK(b010);break;
case TAG(link_kind,b011):HTEG_LINK(b011);break;
case TAG(link_kind,b100):HTEG_LINK(b100);break;
case TAG(link_kind,b101):HTEG_LINK(b101);break;
case TAG(link_kind,b110):HTEG_LINK(b110);break;
case TAG(link_kind,b111):HTEG_LINK(b111);break;
/*:535*//*536:*/
#line 11132 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(color_kind,b000):(void)HTEG8;break;
/*:536*//*539:*/
#line 11194 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(adjust_kind,b001):{List l;hteg_list(&l);}break;
/*:539*//*541:*/
#line 11207 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(table_kind,b000):HTEG_TABLE(b000);break;
case TAG(table_kind,b001):HTEG_TABLE(b001);break;
case TAG(table_kind,b010):HTEG_TABLE(b010);break;
case TAG(table_kind,b011):HTEG_TABLE(b011);break;
case TAG(table_kind,b100):HTEG_TABLE(b100);break;
case TAG(table_kind,b101):HTEG_TABLE(b101);break;
case TAG(table_kind,b110):HTEG_TABLE(b110);break;
case TAG(table_kind,b111):HTEG_TABLE(b111);break;

case TAG(item_kind,b000):{List l;hteg_list(&l);}break;
case TAG(item_kind,b001):hteg_content_node();break;
case TAG(item_kind,b010):hteg_content_node();break;
case TAG(item_kind,b011):hteg_content_node();break;
case TAG(item_kind,b100):hteg_content_node();break;
case TAG(item_kind,b101):hteg_content_node();break;
case TAG(item_kind,b110):hteg_content_node();break;
case TAG(item_kind,b111):hteg_content_node();{uint8_t n;n= HTEG8;}break;
/*:541*//*543:*/
#line 11237 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(stream_kind,b000):HTEG_STREAM(b000);break;
case TAG(stream_kind,b010):HTEG_STREAM(b010);break;
/*:543*//*545:*/
#line 11250 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(penalty_kind,0):HTEG_REF(penalty_kind);break;
case TAG(kern_kind,b000):HTEG_REF(dimen_kind);break;
case TAG(kern_kind,b100):HTEG_REF(dimen_kind);break;
case TAG(kern_kind,b001):HTEG_REF(xdimen_kind);break;
case TAG(kern_kind,b101):HTEG_REF(xdimen_kind);break;
case TAG(ligature_kind,0):HTEG_REF(ligature_kind);break;
case TAG(disc_kind,0):HTEG_REF(disc_kind);break;
case TAG(glue_kind,0):HTEG_REF(glue_kind);break;
case TAG(language_kind,0):HTEG_REF(language_kind);break;
case TAG(rule_kind,0):HTEG_REF(rule_kind);break;
case TAG(image_kind,0):HTEG_REF(image_kind);break;
case TAG(leaders_kind,0):HTEG_REF(leaders_kind);break;
case TAG(baseline_kind,0):HTEG_REF(baseline_kind);break;
/*:545*/
#line 10651 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

default:
if(!hteg_unknown(z))
TAGERR(z);
break;
}
}
/*:494*//*500:*/
#line 10708 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hteg_xdimen_node(Xdimen*x)
{/*495:*/
#line 10662 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= hpos-hstart;
if(hpos<=hstart)return;
HTEGTAG(z);
/*:495*/
#line 10710 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

switch(z)
{
#if 0

case TAG(xdimen_kind,b000):
{uint8_t n;n= HTEG8;}break;
#endif
#line 10718 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
 case TAG(xdimen_kind,b001):HTEG_XDIMEN(b001,*x);break;
case TAG(xdimen_kind,b010):HTEG_XDIMEN(b010,*x);break;
case TAG(xdimen_kind,b011):HTEG_XDIMEN(b011,*x);break;
case TAG(xdimen_kind,b100):HTEG_XDIMEN(b100,*x);break;
case TAG(xdimen_kind,b101):HTEG_XDIMEN(b101,*x);break;
case TAG(xdimen_kind,b110):HTEG_XDIMEN(b110,*x);break;
case TAG(xdimen_kind,b111):HTEG_XDIMEN(b111,*x);break;
default:
QUIT("Extent expected at 0x%x got %s",node_pos,NAME(z));break;
}
/*496:*/
#line 10669 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HTEGTAG(a);
if(a!=z)QUIT("Tag mismatch [%s,%d]!=[%s,%d] at "SIZE_F" to 0x%x\n",NAME(a),INFO(a),NAME(z),INFO(z),
hpos-hstart,node_pos-1);
/*:496*/
#line 10728 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:500*//*511:*/
#line 10816 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hteg_rule_node(void)
{/*495:*/
#line 10662 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= hpos-hstart;
if(hpos<=hstart)return;
HTEGTAG(z);
/*:495*/
#line 10818 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(z)==rule_kind){Rule r;HTEG_RULE(INFO(z),r);}
else
QUIT("Rule expected at 0x%x got %s",node_pos,NAME(z));
/*496:*/
#line 10669 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HTEGTAG(a);
if(a!=z)QUIT("Tag mismatch [%s,%d]!=[%s,%d] at "SIZE_F" to 0x%x\n",NAME(a),INFO(a),NAME(z),INFO(z),
hpos-hstart,node_pos-1);
/*:496*/
#line 10822 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:511*//*514:*/
#line 10845 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hteg_glue_node(void)
{/*495:*/
#line 10662 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= hpos-hstart;
if(hpos<=hstart)return;
HTEGTAG(z);
/*:495*/
#line 10847 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(INFO(z)==b000)HTEG_REF(glue_kind);
else
{Glue g;HTEG_GLUE(INFO(z),g);}
/*496:*/
#line 10669 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HTEGTAG(a);
if(a!=z)QUIT("Tag mismatch [%s,%d]!=[%s,%d] at "SIZE_F" to 0x%x\n",NAME(a),INFO(a),NAME(z),INFO(z),
hpos-hstart,node_pos-1);
/*:496*/
#line 10851 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:514*//*517:*/
#line 10887 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hteg_hbox_node(void)
{Box b;
/*495:*/
#line 10662 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= hpos-hstart;
if(hpos<=hstart)return;
HTEGTAG(z);
/*:495*/
#line 10890 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(z)!=hbox_kind)QUIT("Hbox expected at 0x%x got %s",node_pos,NAME(z));
HTEG_BOX(INFO(z),b);
/*496:*/
#line 10669 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HTEGTAG(a);
if(a!=z)QUIT("Tag mismatch [%s,%d]!=[%s,%d] at "SIZE_F" to 0x%x\n",NAME(a),INFO(a),NAME(z),INFO(z),
hpos-hstart,node_pos-1);
/*:496*/
#line 10893 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}

static void hteg_vbox_node(void)
{Box b;
/*495:*/
#line 10662 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= hpos-hstart;
if(hpos<=hstart)return;
HTEGTAG(z);
/*:495*/
#line 10898 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(z)!=vbox_kind)QUIT("Vbox expected at 0x%x got %s",node_pos,NAME(z));
HTEG_BOX(INFO(z),b);
/*496:*/
#line 10669 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HTEGTAG(a);
if(a!=z)QUIT("Tag mismatch [%s,%d]!=[%s,%d] at "SIZE_F" to 0x%x\n",NAME(a),INFO(a),NAME(z),INFO(z),
hpos-hstart,node_pos-1);
/*:496*/
#line 10901 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:517*//*538:*/
#line 11154 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hteg_size_boundary(Info info)
{uint32_t n;
info= info&0x3;
if(info==0)return;
n= HTEG8;
if(n!=0x100-info)QUIT("List size boundary byte 0x%x does not match info value %d at "SIZE_F,
n,info,hpos-hstart);
}

static void hteg_list(List*l)
{/*495:*/
#line 10662 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= hpos-hstart;
if(hpos<=hstart)return;
HTEGTAG(z);
/*:495*/
#line 11165 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(z)!=list_kind&&KIND(z)!=param_kind)
QUIT("List expected at 0x%x",(uint32_t)(hpos-hstart));
else if((INFO(z)&0x3)==0){HBACK(1);l->s= 0;}
else
{uint32_t s;
l->t= z;
l->s= hteg_list_size(INFO(z));
hteg_size_boundary(INFO(z));
hpos= hpos-l->s;
l->p= hpos-hstart;
hteg_size_boundary(INFO(z));
s= hteg_list_size(INFO(z));
if(s!=l->s)QUIT("List sizes at "SIZE_F" and 0x%x do not match 0x%x != 0x%x",
hpos-hstart,node_pos-1,s,l->s);
}
/*496:*/
#line 10669 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HTEGTAG(a);
if(a!=z)QUIT("Tag mismatch [%s,%d]!=[%s,%d] at "SIZE_F" to 0x%x\n",NAME(a),INFO(a),NAME(z),INFO(z),
hpos-hstart,node_pos-1);
/*:496*/
#line 11181 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}

static void hteg_param_list(List*l)
{if(KIND(*(hpos-1))!=param_kind)return;
hteg_list(l);
}


/*:538*//*546:*/
#line 11267 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static int hteg_unknown(Tag z)
{int b,n;
int8_t s;
s= hnode_size[z];
DBG(DBGTAGS,"Trying unknown tag 0x%x at 0x%x\n",z,(uint32_t)(hpos-hstart-1));
if(s==0)return 0;
b= NODE_HEAD(s);n= NODE_TAIL(s);
DBG(DBGTAGS,"Trying unknown node size %d %d\n",b,n);

while(n> 0){
z= *(hpos-1);
if(KIND(z)==xdimen_kind){Xdimen x;hteg_xdimen_node(&x);}
else if(KIND(z)==param_kind){List l;hteg_param_list(&l);}
else if(KIND(z)<=list_kind){List l;hteg_list(&l);}
else hteg_content_node();
n--;}
while(b> 0){z= HTEG8;b--;}
return 1;
}
/*:546*/
#line 11926 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


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
#line 11928 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*559:*/
#line 11873 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

extern void hget_xdimen_node(Xdimen*x);
extern void hget_def_node(void);
extern void hget_font_def(Info i,uint8_t f);
extern void hget_content_section(void);
extern Tag hget_content_node(void);
extern void hget_glue_node(void);
extern void hget_rule_node(void);
extern void hget_hbox_node(void);
extern void hget_vbox_node(void);
extern void hget_param_list(List*l);
extern int hget_txt(void);
extern int hget_unknown(Tag a);
/*:559*/
#line 11929 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*21:*/
#line 850 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int nesting= 0;
void hwrite_nesting(void)
{int i;
hwritec('\n');
for(i= 0;i<nesting;i++)hwritec(' ');
}

void hwrite_start(void)
{hwrite_nesting();hwritec('<');nesting++;
}

void hwrite_range(void);
void hwrite_label(void);

void hwrite_end(void)
{nesting--;hwritec('>');
if(section_no==2)
{if(nesting==0)hwrite_range();
hwrite_label();
}
}

void hwrite_comment(char*str)
{char c;
if(str==NULL)return;
hwritef(" (");
while((c= *str++)!=0)
if(c=='('||c==')')hwritec('_');
else if(c=='\n')hwritef("\n(");
else hwritec(c);
hwritec(')');
}

void hwrite_charcode(uint32_t c);
void hwrite_ref(int n);

void hwrite_glyph(Glyph*g)
{char*n= hfont_name[g->f];
hwrite_charcode(g->c);
hwrite_ref(g->f);
if(n!=NULL)hwrite_comment(n);
}
/*:21*//*31:*/
#line 963 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_signed(int32_t i)
{if(i<0)hwritef(" -%d",-i);
else hwritef(" +%d",+i);
}
/*:31*//*36:*/
#line 1039 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_string(char*str)
{hwritec(' ');
if(str==NULL)hwritef("''");
else
{hwritec('\'');
while(*str!=0)
{if(*str=='\'')hwritec('\'');
hwritec(*str);
str++;
}
hwritec('\'');
}
}


/*:36*//*52:*/
#line 1214 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int hwrite_utf8(uint32_t c)
{if(c<0x80)
{hwritec(c);return 1;}
else if(c<0x800)
{hwritec(0xC0|(c>>6));hwritec(0x80|(c&0x3F));return 2;}
else if(c<0x10000)
{hwritec(0xE0|(c>>12));hwritec(0x80|((c>>6)&0x3F));hwritec(0x80|(c&0x3F));return 3;}
else if(c<0x200000)
{hwritec(0xF0|(c>>18));hwritec(0x80|((c>>12)&0x3F));
hwritec(0x80|((c>>6)&0x3F));hwritec(0x80|(c&0x3F));return 4;}
else
RNG("character code",c,0,0x1FFFFF);
return 0;
}

void hwrite_charcode(uint32_t c)
{if(c<0x20)
{if(option_hex)hwritef(" 0x%02X",c);
else hwritef(" %u",c);
}
else if(c=='\'')hwritef(" ''''");
else if(c<=0x7E)hwritef(" \'%c\'",c);
else if(option_utf8){hwritef(" \'");hwrite_utf8(c);hwritec('\'');}
else if(option_hex)hwritef(" 0x%04X",c);
else hwritef(" %u",c);
}
/*:52*//*68:*/
#line 1507 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define MAX_HEX_DIGITS 12
void hwrite_float64(float64_t d,bool suffix)
{uint64_t bits,mantissa;
int exp,digits;
if(!suffix)hwritec(' ');
else if(d>=0)hwritec('+');
if(floor(d)==d)
{hwritef("%d",(int)d);return;}
if(floor(10000.0*d)==10000.0*d)
{hwritef("%g",d);return;}
DBG(DBGFLOAT,"Writing hexadecimal float %f\n",d);
if(d<0){hwritec('-');d= -d;}
hwritef("0x");
/*69:*/
#line 1531 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{union{float64_t d;uint64_t bits;}u;
u.d= d;bits= u.bits;
}
mantissa= bits&(((uint64_t)1<<DBL_M_BITS)-1);
mantissa= mantissa+((uint64_t)1<<DBL_M_BITS);
exp= ((bits>>DBL_M_BITS)&((1<<DBL_E_BITS)-1))-DBL_EXCESS;
digits= DBL_M_BITS+1;
DBG(DBGFLOAT,"\tdigits=%d mantissa=0x%"PRIx64" binary exp=%d\n",digits,mantissa,exp);
/*:69*//*70:*/
#line 1545 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{int r;
if(exp>=0)
{r= exp%4;
if(r> 0)
{mantissa= mantissa<<r;exp= exp-r;digits= digits+r;}
}
else
{r= (-exp)%4;
if(r> 0)
{mantissa= mantissa>>r;exp= exp+r;digits= digits-r;}
}
}
exp= exp/4;
DBG(DBGFLOAT,"\tdigits=%d mantissa=0x%"PRIx64" hex exp=%d\n",digits,mantissa,exp);
/*:70*//*71:*/
#line 1566 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

mantissa= mantissa<<(64-DBL_M_BITS-4);
/*:71*/
#line 1521 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(exp> MAX_HEX_DIGITS)
/*72:*/
#line 1574 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{DBG(DBGFLOAT,"writing large number\n");
hwritef("%X.",(uint8_t)(mantissa>>60));
mantissa= mantissa<<4;
do{
hwritef("%X",(uint8_t)(mantissa>>DBL_M_BITS)&0xF);
mantissa= mantissa<<4;
}while(mantissa!=0);
hwritef("x+%X",exp);
}
/*:72*/
#line 1523 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

else if(exp>=0)/*73:*/
#line 1588 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{DBG(DBGFLOAT,"writing medium number\n");
do{
hwritef("%X",(uint8_t)(mantissa>>60));
mantissa= mantissa<<4;
if(exp--==0)hwritec('.');
}while(mantissa!=0||exp>=-1);
}
/*:73*/
#line 1524 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

else/*74:*/
#line 1599 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{DBG(DBGFLOAT,"writing small number\n");
hwritef("%X.",(uint8_t)(mantissa>>60));
mantissa= mantissa<<4;
do{
hwritef("%X",(uint8_t)(mantissa>>60));
mantissa= mantissa<<4;
}while(mantissa!=0);
hwritef("x-%X",-exp);
}
/*:74*/
#line 1525 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:68*//*79:*/
#line 1658 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_scaled(Scaled x)
{hwrite_float64(x/(float64_t)ONE,false);
}
/*:79*//*84:*/
#line 1718 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_dimension(Dimen x)
{hwrite_scaled(x);
hwritef("pt");
}
/*:84*//*91:*/
#line 1799 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_xdimen(Xdimen*x)
{hwrite_dimension(x->w);
if(x->h!=0.0){hwrite_float64(x->h,true);hwritec('h');}
if(x->v!=0.0){hwrite_float64(x->v,true);hwritec('v');}
}

void hwrite_xdimen_node(Xdimen*x)
{hwrite_start();hwritef("xdimen");hwrite_xdimen(x);hwrite_end();}
/*:91*//*102:*/
#line 1981 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_order(Order o)
{switch(o)
{case normal_o:hwritef("pt");break;
case fil_o:hwritef("fil");break;
case fill_o:hwritef("fill");break;
case filll_o:hwritef("filll");break;
default:QUIT("Illegal order %d",o);break;
}
}

void hwrite_stretch(Stretch*s)
{hwrite_float64(s->f,false);
hwrite_order(s->o);
}
/*:102*//*118:*/
#line 2218 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hwrite_rule_dimension(Dimen d,char c)
{if(d==RUNNING_DIMEN)hwritef(" %c",c);
else hwrite_dimension(d);
}

void hwrite_rule(Rule*r)
{hwrite_rule_dimension(r->h,'|');
hwrite_rule_dimension(r->d,'|');
hwrite_rule_dimension(r->w,'_');
}
/*:118*//*127:*/
#line 2327 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_explicit(bool x)
{if(x)hwritef(" !");}

void hwrite_kern(Kern*k)
{hwrite_explicit(k->x);
if(k->d.h==0.0&&k->d.v==0.0&&k->d.w==0)hwrite_ref(zero_dimen_no);
else hwrite_xdimen(&(k->d));
}
/*:127*//*136:*/
#line 2544 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_plus(Stretch*p)
{if(p->f!=0.0){hwritef(" plus");hwrite_stretch(p);}
}
void hwrite_minus(Stretch*m)
{if(m->f!=0.0){hwritef(" minus");hwrite_stretch(m);}
}

void hwrite_glue(Glue*g)
{hwrite_xdimen(&(g->w));
hwrite_plus(&g->p);hwrite_minus(&g->m);
}

void hwrite_ref_node(Kind k,uint8_t n);
void hwrite_glue_node(Glue*g)
{
if(ZERO_GLUE(*g))hwrite_ref_node(glue_kind,zero_skip_no);
else{hwrite_start();hwritef("glue");hwrite_glue(g);hwrite_end();}
}
/*:136*//*144:*/
#line 2825 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_list(List*l)
{uint32_t h= hpos-hstart,e= hend-hstart;
hpos= l->p+hstart;hend= hpos+l->s;
if(KIND(l->t)==list_kind)
{if(INFO(l->t)&b100)/*155:*/
#line 3256 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{if(l->s==0)hwritef(" \"\"");
else
{int pos= nesting+20;
hwritef(" \"");
while(hpos<hend)
{int i= hget_txt();
if(i<0)
{if(pos++<70)hwritec(' ');
else hwrite_nesting(),pos= nesting;
}
else if(i==1&&pos>=100)
{hwritec('\\');hwrite_nesting();pos= nesting;}
else
pos+= i;
}
hwritec('"');
}
}
/*:155*/
#line 2830 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
else/*145:*/
#line 2836 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{if(l->s==0)hwritef(" <>");
else
{DBG(DBGNODE,"Write list at 0x%x size=%u\n",l->p,l->s);
hwrite_start();
if(section_no==2)hwrite_label();
if(l->s> 0xFF)hwritef("%d",l->s);
while(hpos<hend)
hget_content_node();
hwrite_end();
}
}
/*:145*/
#line 2830 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
}
else QUIT("List expected got %s",content_name[KIND(l->t)]);
hpos= hstart+h;hend= hstart+e;
}
/*:144*//*156:*/
#line 3281 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int hwrite_txt_cc(uint32_t c)
{if(c<0x20)
return hwritef("\\C%d\\",c);
else
switch(c)
{case'\\':return hwritef("\\\\");
case'"':return hwritef("\\\"");
case'<':return hwritef("\\<");
case'>':return hwritef("\\>");
case' ':return hwritef("\\ ");
case'-':return hwritef("\\-");
default:return option_utf8?hwrite_utf8(c):hwritef("\\C%d\\",c);
}
}
/*:156*//*164:*/
#line 3520 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_box(Box*b)
{hwrite_dimension(b->h);
hwrite_dimension(b->d);
hwrite_dimension(b->w);
if(b->a!=0){hwritef(" shifted");hwrite_dimension(b->a);}
if(b->r!=0.0&&b->s!=0)
{if(b->s> 0)hwritef(" plus");else hwritef(" minus");
hwrite_float64(b->r,false);hwrite_order(b->o);
}
hwrite_list(&(b->l));
}
/*:164*//*177:*/
#line 3860 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_leaders_type(int t)
{
if(t==2)hwritef(" center");
else if(t==3)hwritef(" expand");
}
/*:177*//*191:*/
#line 4062 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_ligature(Lig*l)
{uint32_t pos= hpos-hstart;
hwrite_ref(l->f);
hpos= l->l.p+hstart;
hwrite_charcode(hget_utf8());
hwritef(" \"");
while(hpos<hstart+l->l.p+l->l.s)
hwrite_txt_cc(hget_utf8());
hwritec('"');
hpos= hstart+pos;
}
/*:191*//*199:*/
#line 4185 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_disc(Disc*h)
{hwrite_explicit(h->x);
if(h->r!=0)hwritef(" %d",h->r);
if(h->p.s!=0||h->q.s!=0)hwrite_list(&(h->p));
if(h->q.s!=0)hwrite_list(&(h->q));
}
void hwrite_disc_node(Disc*h)
{hwrite_start();hwritef("disc");hwrite_disc(h);hwrite_end();}
/*:199*//*232:*/
#line 4769 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_image(Image*x)
{RNG("Section number",x->n,3,max_section_no);hwritef(" %u",x->n);
if(x->a!=0.0)hwrite_float64(x->a,false);
if(x->wr!=0)hwritef(" width *%u",x->wr);
else if(x->w.w!=0||x->w.h!=0.0||x->w.v!=0.0)
{hwritef(" width");hwrite_xdimen(&x->w);}
if(x->hr!=0)hwritef(" height *%u",x->hr);
else if(x->h.w!=0||x->h.h!=0.0||x->h.v!=0.0)
{hwritef(" height");hwrite_xdimen(&x->h);}
}
/*:232*//*259:*/
#line 5547 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_label(void)
{while(first_label>=0&&(uint32_t)(hpos-hstart)>=labels[first_label].pos)
{Label*t= labels+first_label;
DBG(DBGLABEL,"Inserting label *%d\n",first_label);
hwrite_start();
hwritef("label *%d",first_label);
if(t->where==LABEL_TOP)hwritef(" top");
else if(t->where==LABEL_BOT)hwritef(" bot");
nesting--;hwritec('>');
first_label= labels[first_label].next;
}
}
/*:259*//*260:*/
#line 5586 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hsort_labels(void)
{int i;
if(max_ref[label_kind]<0)
{first_label= -1;return;}
first_label= max_ref[label_kind];
while(first_label>=0&&labels[first_label].where==LABEL_UNDEF)
first_label--;
if(first_label<0)return;
labels[first_label].next= -1;
DBG(DBGLABEL,"Sorting %d labels\n",first_label+1);
for(i= first_label-1;i>=0;i--)
if(labels[i].where!=LABEL_UNDEF)
{uint32_t pos= labels[i].pos;
if(labels[first_label].pos>=pos)
{labels[i].next= first_label;first_label= i;}
else
{int j;
for(j= first_label;
labels[j].next>=0&&labels[labels[j].next].pos<pos;
j= labels[j].next)continue;
labels[i].next= labels[j].next;labels[j].next= i;
}
}
}
/*:260*//*271:*/
#line 5788 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_link(int n,int c,uint8_t on)
{REF_RNG(label_kind,n);
if(labels[n].where==LABEL_UNDEF)
MESSAGE("WARNING: Link to an undefined label %d\n",n);
hwrite_ref(n);
if(on)hwritef(" on");
else hwritef(" off");
if((on&&c!=1)||(!on&&c!=0xFF))
{REF_RNG(color_kind,c);hwrite_ref(c);}
}
/*:271*//*330:*/
#line 7228 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_range(void)
{uint32_t p= hpos-hstart;
DBG(DBGRANGE,"Range check at pos 0x%x next at 0x%x\n",p,range_pos[next_range].pos);
while(next_range<max_range&&range_pos[next_range].pos<=p)
{hwrite_start();
hwritef("range *%d ",range_pos[next_range].pg);
if(range_pos[next_range].on)hwritef("on");else hwritef("off");
nesting--;hwritec('>');
next_range++;
}
}
/*:330*//*332:*/
#line 7269 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hsort_ranges(void)
{int i;
DBG(DBGRANGE,"Range sorting %d positions\n",next_range-1);
for(i= 3;i<next_range;i++)
{int j= i-1;
if(range_pos[i].pos<range_pos[j].pos)
{RangePos t;
t= range_pos[i];
do{
range_pos[j+1]= range_pos[j];
j--;
}while(range_pos[i].pos<range_pos[j].pos);
range_pos[j+1]= t;
}
}
max_range= next_range;next_range= 1;
}
/*:332*//*366:*/
#line 8089 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*361:*/
#line 7989 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#ifdef WIN32
#include <io.h> 
#define access(N,M) _access(N, M )
#define F_OK 0
#else
#line 7995 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
#include <unistd.h> 
#endif
#line 7997 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
/*:361*/
#line 8090 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

extern char*stem_name;
extern int stem_length;

void hget_section(uint16_t n);
void hwrite_aux_files(void)
{int i;
if(!option_aux)return;
DBG(DBGBASIC|DBGDIR,"Writing %d aux files\n",max_section_no-2);
for(i= 3;i<=max_section_no;i++)
{FILE*f;
char*aux_name= NULL;
if(option_global)
aux_name= strdup(dir[i].file_name);
else
/*362:*/
#line 8014 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{char*path= dir[i].file_name;
int path_length= (int)strlen(path);
/*363:*/
#line 8023 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int aux_length;
enum{absolute= 0,relative= 1}name_type;
char*aux_ext[2]= {".abs/",".rel/"};
int ext_length= 5;
aux_length= stem_length+ext_length+path_length;
ALLOCATE(aux_name,aux_length+1,char);
strcpy(aux_name,stem_name);
if(path[0]=='/')
{name_type= absolute;
strcpy(aux_name+stem_length,aux_ext[name_type]);
strcpy(aux_name+stem_length+ext_length,path+1);
}
else if(path_length> 3&&isalpha(path[0])&&
path[1]==':'&&path[2]=='/')
{name_type= absolute;
strcpy(aux_name+stem_length,aux_ext[name_type]);
strcpy(aux_name+stem_length+ext_length,path);
aux_name[stem_length+ext_length+1]= '_';
}
else
name_type= relative;
/*:363*/
#line 8017 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*364:*/
#line 8052 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{int k;
for(k= stem_length+ext_length;k<aux_length-3;k++)
if(aux_name[k]=='.'&&aux_name[k+1]=='.'&&aux_name[k+2]=='/')
{aux_name[k]= aux_name[k+1]= '_';k= k+2;}
}
/*:364*/
#line 8018 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

DBG(DBGDIR,"Replacing auxiliary file name:\n\t%s\n->\t%s\n",path,aux_name);
}
/*:362*/
#line 8105 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*360:*/
#line 7980 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(!option_force&&access(aux_name,F_OK)==0)
{MESSAGE("File '%s' exists.\n""To rewrite the file use the -f option.\n",
aux_name);
continue;
}
/*:360*/
#line 8106 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*365:*/
#line 8061 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{char*path_end;
path_end= aux_name+1;
while(*path_end!=0)
{if(*path_end=='/')
{struct stat s;
*path_end= 0;
if(stat(aux_name,&s)==-1)
{
#ifdef WIN32
if(mkdir(aux_name)!=0)
#else
#line 8073 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
 if(mkdir(aux_name,0777)!=0)
#endif
#line 8075 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
 QUIT("Unable to create directory %s",aux_name);
DBG(DBGDIR,"Creating directory %s\n",aux_name);
}else if(!(S_IFDIR&(s.st_mode)))
QUIT("Unable to create directory %s, file exists",aux_name);
*path_end= '/';
}
path_end++;
}
}


/*:365*/
#line 8107 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


f= fopen(aux_name,"wb");
if(f==NULL)
QUIT("Unable to open file '%s' for writing",aux_name);
else
{size_t s;
hget_section(i);
DBG(DBGDIR,"Writing file %s\n",aux_name);
s= fwrite(hstart,1,dir[i].size,f);
if(s!=dir[i].size)QUIT("writing file %s",aux_name);
fclose(f);
}
free(aux_name);
}
}
/*:366*//*367:*/
#line 8127 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hwrite_entry(int i)
{hwrite_start();
hwritef("section %u",dir[i].section_no);hwrite_string(dir[i].file_name);
hwrite_end();
}

void hwrite_directory(void)
{int i;
if(dir==NULL)QUIT("Directory not allocated");
section_no= 0;
hwritef("<directory %u",max_section_no);
for(i= 3;i<=max_section_no;i++)
hwrite_entry(i);
hwritef("\n>\n");
}
/*:367*//*380:*/
#line 8493 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_definitions_start(void)
{section_no= 1;hwritef("<definitions");
}

void hwrite_definitions_end(void)
{hwritef("\n>\n");
}
/*:380*//*389:*/
#line 8639 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_max_definitions(void)
{Kind k;
hwrite_start();
hwritef("max");
for(k= 0;k<32;k++)
if(max_ref[k]> max_default[k])
{switch(k)
{/*248:*/
#line 5380 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case label_kind:
if(max_ref[label_kind]> -1)
{hwrite_start();
hwritef("label %d",max_ref[label_kind]);
hwrite_end();
}
if(max_outline> -1)
{hwrite_start();
hwritef("outline %d",max_outline);
hwrite_end();
}
break;
/*:248*/
#line 8647 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

default:
hwrite_start();
hwritef("%s %d",definition_name[k],max_ref[k]);
hwrite_end();
break;
}
}
hwrite_end();
}
/*:389*//*404:*/
#line 9004 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_parameters(List*l)
{uint32_t h= hpos-hstart,e= hend-hstart;
hpos= l->p+hstart;hend= hpos+l->s;
if(l->s> 0xFF)hwritef(" %d",l->s);
while(hpos<hend)hget_def_node();
hpos= hstart+h;hend= hstart+e;
}
void hwrite_param_list(List*l)
{hwrite_start();
hwrite_parameters(l);
hwrite_end();
}

void hwrite_named_param_list(List*l)
{hwrite_start();
hwritef("param");
hwrite_parameters(l);
hwrite_end();
}
/*:404*//*418:*/
#line 9302 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_ref(int n)
{hwritef(" *%d",n);}

void hwrite_ref_node(Kind k,uint8_t n)
{hwrite_start();hwritef("%s",content_name[k]);hwrite_ref(n);hwrite_end();}
/*:418*//*445:*/
#line 9767 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_content_section(void)
{section_no= 2;
hwritef("<content");
hsort_ranges();
hsort_labels();
hget_content_section();
hwritef("\n>\n");
}
/*:445*/
#line 11930 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*53:*/
#line 1244 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HGET_UTF8C(X)  (X)= HGET8; if ((X&0xC0)!=0x80) \
  QUIT("UTF8 continuation byte expected at " SIZE_F " got 0x%02X\n",hpos-hstart-1,X)

uint32_t hget_utf8(void)
{uint8_t a;
a= HGET8;
if(a<0x80)return a;
else
{if((a&0xE0)==0xC0)
{uint8_t b;HGET_UTF8C(b);
return((a&~0xE0)<<6)+(b&~0xC0);
}
else if((a&0xF0)==0xE0)
{uint8_t b,c;HGET_UTF8C(b);HGET_UTF8C(c);
return((a&~0xF0)<<12)+((b&~0xC0)<<6)+(c&~0xC0);
}
else if((a&0xF8)==0xF0)
{uint8_t b,c,d;HGET_UTF8C(b);HGET_UTF8C(c);HGET_UTF8C(d);
return((a&~0xF8)<<18)+((b&~0xC0)<<12)+((c&~0xC0)<<6)+(d&~0xC0);
}
else QUIT("UTF8 byte sequence expected");
}
}
/*:53*//*76:*/
#line 1627 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

float32_t hget_float32(void)
{union{float32_t d;uint32_t bits;}u;
HGET32(u.bits);
return u.d;
}
/*:76*//*146:*/
#line 2850 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_size_boundary(Info info)
{uint32_t n;
info= info&0x3;
if(info==0)return;
n= HGET8;
if(n!=0x100-info)QUIT("Non matching boundary byte 0x%x with info value %d at 0x%x",
n,info,(uint32_t)(hpos-hstart-1));
}

uint32_t hget_list_size(Info info)
{uint32_t n= 0;
info= info&0x3;
if(info==0)return 0;
else if(info==1)n= HGET8;
else if(info==2)HGET16(n);
else if(info==3)HGET32(n);
else QUIT("List info %d must be 0, 1, 2, or 3",info);
return n;
}

void hget_list(List*l)
{if(KIND(*hpos)!=list_kind&&KIND(*hpos)!=param_kind)
QUIT("List expected at 0x%x",(uint32_t)(hpos-hstart));
else
{
/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 2876 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

l->t= a;
HGET_LIST(INFO(a),*l);
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 2879 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

DBG(DBGNODE,"Get list at 0x%x size=%u\n",l->p,l->s);
}
}
/*:146*/
#line 11931 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*18:*/
#line 766 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hget_content(Tag a);
Tag hget_content_node(void)
{/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 769 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
hwrite_start();
if(content_known[KIND(a)]&(1<<INFO(a)))hwritef("%s",content_name[KIND(a)]);
hget_content(a);
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 772 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
hwrite_end();
return a;
}

static void hget_content(Tag a)
{
switch(a)
{
/*20:*/
#line 816 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(glyph_kind,1):{Glyph g;HGET_GLYPH(1,g);}break;
case TAG(glyph_kind,2):{Glyph g;HGET_GLYPH(2,g);}break;
case TAG(glyph_kind,3):{Glyph g;HGET_GLYPH(3,g);}break;
case TAG(glyph_kind,4):{Glyph g;HGET_GLYPH(4,g);}break;
/*:20*//*106:*/
#line 2035 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(penalty_kind,1):{int32_t p;HGET_PENALTY(1,p);}break;
case TAG(penalty_kind,2):{int32_t p;HGET_PENALTY(2,p);}break;
case TAG(penalty_kind,3):{int32_t p;HGET_PENALTY(3,p);}break;
/*:106*//*111:*/
#line 2114 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case TAG(language_kind,1):REF(language_kind,0);hwrite_ref(0);break;
case TAG(language_kind,2):REF(language_kind,1);hwrite_ref(1);break;
case TAG(language_kind,3):REF(language_kind,2);hwrite_ref(2);break;
case TAG(language_kind,4):REF(language_kind,3);hwrite_ref(3);break;
case TAG(language_kind,5):REF(language_kind,4);hwrite_ref(4);break;
case TAG(language_kind,6):REF(language_kind,5);hwrite_ref(5);break;
case TAG(language_kind,7):REF(language_kind,6);hwrite_ref(6);break;
/*:111*//*119:*/
#line 2231 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(rule_kind,b011):{Rule r;HGET_RULE(b011,r);hwrite_rule(&(r));}break;
case TAG(rule_kind,b101):{Rule r;HGET_RULE(b101,r);hwrite_rule(&(r));}break;
case TAG(rule_kind,b001):{Rule r;HGET_RULE(b001,r);hwrite_rule(&(r));}break;
case TAG(rule_kind,b110):{Rule r;HGET_RULE(b110,r);hwrite_rule(&(r));}break;
case TAG(rule_kind,b111):{Rule r;HGET_RULE(b111,r);hwrite_rule(&(r));}break;
/*:119*//*128:*/
#line 2340 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(kern_kind,b010):{Kern k;HGET_KERN(b010,k);}break;
case TAG(kern_kind,b011):{Kern k;HGET_KERN(b011,k);}break;
case TAG(kern_kind,b110):{Kern k;HGET_KERN(b110,k);}break;
case TAG(kern_kind,b111):{Kern k;HGET_KERN(b111,k);}break;
/*:128*//*137:*/
#line 2566 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(glue_kind,b001):{Glue g;HGET_GLUE(b001,g);hwrite_glue(&g);}break;
case TAG(glue_kind,b010):{Glue g;HGET_GLUE(b010,g);hwrite_glue(&g);}break;
case TAG(glue_kind,b011):{Glue g;HGET_GLUE(b011,g);hwrite_glue(&g);}break;
case TAG(glue_kind,b100):{Glue g;HGET_GLUE(b100,g);hwrite_glue(&g);}break;
case TAG(glue_kind,b101):{Glue g;HGET_GLUE(b101,g);hwrite_glue(&g);}break;
case TAG(glue_kind,b110):{Glue g;HGET_GLUE(b110,g);hwrite_glue(&g);}break;
case TAG(glue_kind,b111):{Glue g;HGET_GLUE(b111,g);hwrite_glue(&g);}break;
/*:137*//*165:*/
#line 3535 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(hbox_kind,b000):{Box b;HGET_BOX(b000,b);hwrite_box(&b);}break;
case TAG(hbox_kind,b001):{Box b;HGET_BOX(b001,b);hwrite_box(&b);}break;
case TAG(hbox_kind,b010):{Box b;HGET_BOX(b010,b);hwrite_box(&b);}break;
case TAG(hbox_kind,b011):{Box b;HGET_BOX(b011,b);hwrite_box(&b);}break;
case TAG(hbox_kind,b100):{Box b;HGET_BOX(b100,b);hwrite_box(&b);}break;
case TAG(hbox_kind,b101):{Box b;HGET_BOX(b101,b);hwrite_box(&b);}break;
case TAG(hbox_kind,b110):{Box b;HGET_BOX(b110,b);hwrite_box(&b);}break;
case TAG(hbox_kind,b111):{Box b;HGET_BOX(b111,b);hwrite_box(&b);}break;
case TAG(vbox_kind,b000):{Box b;HGET_BOX(b000,b);hwrite_box(&b);}break;
case TAG(vbox_kind,b001):{Box b;HGET_BOX(b001,b);hwrite_box(&b);}break;
case TAG(vbox_kind,b010):{Box b;HGET_BOX(b010,b);hwrite_box(&b);}break;
case TAG(vbox_kind,b011):{Box b;HGET_BOX(b011,b);hwrite_box(&b);}break;
case TAG(vbox_kind,b100):{Box b;HGET_BOX(b100,b);hwrite_box(&b);}break;
case TAG(vbox_kind,b101):{Box b;HGET_BOX(b101,b);hwrite_box(&b);}break;
case TAG(vbox_kind,b110):{Box b;HGET_BOX(b110,b);hwrite_box(&b);}break;
case TAG(vbox_kind,b111):{Box b;HGET_BOX(b111,b);hwrite_box(&b);}break;
/*:165*//*172:*/
#line 3744 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(hset_kind,b000):HGET_SET(hset_kind,b000);break;
case TAG(hset_kind,b001):HGET_SET(hset_kind,b001);break;
case TAG(hset_kind,b010):HGET_SET(hset_kind,b010);break;
case TAG(hset_kind,b011):HGET_SET(hset_kind,b011);break;
case TAG(hset_kind,b100):HGET_SET(hset_kind,b100);break;
case TAG(hset_kind,b101):HGET_SET(hset_kind,b101);break;
case TAG(hset_kind,b110):HGET_SET(hset_kind,b110);break;
case TAG(hset_kind,b111):HGET_SET(hset_kind,b111);break;

case TAG(vset_kind,b000):HGET_SET(vset_kind,b000);break;
case TAG(vset_kind,b001):HGET_SET(vset_kind,b001);break;
case TAG(vset_kind,b010):HGET_SET(vset_kind,b010);break;
case TAG(vset_kind,b011):HGET_SET(vset_kind,b011);break;
case TAG(vset_kind,b100):HGET_SET(vset_kind,b100);break;
case TAG(vset_kind,b101):HGET_SET(vset_kind,b101);break;
case TAG(vset_kind,b110):HGET_SET(vset_kind,b110);break;
case TAG(vset_kind,b111):HGET_SET(vset_kind,b111);break;

case TAG(hpack_kind,b000):HGET_PACK(hpack_kind,b000);break;
case TAG(hpack_kind,b001):HGET_PACK(hpack_kind,b001);break;
case TAG(hpack_kind,b010):HGET_PACK(hpack_kind,b010);break;
case TAG(hpack_kind,b011):HGET_PACK(hpack_kind,b011);break;
case TAG(hpack_kind,b100):HGET_PACK(hpack_kind,b100);break;
case TAG(hpack_kind,b101):HGET_PACK(hpack_kind,b101);break;
case TAG(hpack_kind,b110):HGET_PACK(hpack_kind,b110);break;
case TAG(hpack_kind,b111):HGET_PACK(hpack_kind,b111);break;

case TAG(vpack_kind,b000):HGET_PACK(vpack_kind,b000);break;
case TAG(vpack_kind,b001):HGET_PACK(vpack_kind,b001);break;
case TAG(vpack_kind,b010):HGET_PACK(vpack_kind,b010);break;
case TAG(vpack_kind,b011):HGET_PACK(vpack_kind,b011);break;
case TAG(vpack_kind,b100):HGET_PACK(vpack_kind,b100);break;
case TAG(vpack_kind,b101):HGET_PACK(vpack_kind,b101);break;
case TAG(vpack_kind,b110):HGET_PACK(vpack_kind,b110);break;
case TAG(vpack_kind,b111):HGET_PACK(vpack_kind,b111);break;
/*:172*//*178:*/
#line 3869 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(leaders_kind,1):HGET_LEADERS(1);break;
case TAG(leaders_kind,2):HGET_LEADERS(2);break;
case TAG(leaders_kind,3):HGET_LEADERS(3);break;
case TAG(leaders_kind,b100|1):HGET_LEADERS(b100|1);break;
case TAG(leaders_kind,b100|2):HGET_LEADERS(b100|2);break;
case TAG(leaders_kind,b100|3):HGET_LEADERS(b100|3);break;
/*:178*//*184:*/
#line 3972 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(baseline_kind,b001):{Baseline b;HGET_BASELINE(b001,b);}break;
case TAG(baseline_kind,b010):{Baseline b;HGET_BASELINE(b010,b);}break;
case TAG(baseline_kind,b011):{Baseline b;HGET_BASELINE(b011,b);}break;
case TAG(baseline_kind,b100):{Baseline b;HGET_BASELINE(b100,b);}break;
case TAG(baseline_kind,b101):{Baseline b;HGET_BASELINE(b101,b);}break;
case TAG(baseline_kind,b110):{Baseline b;HGET_BASELINE(b110,b);}break;
case TAG(baseline_kind,b111):{Baseline b;HGET_BASELINE(b111,b);}break;
/*:184*//*192:*/
#line 4077 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(ligature_kind,1):{Lig l;HGET_LIG(1,l);}break;
case TAG(ligature_kind,2):{Lig l;HGET_LIG(2,l);}break;
case TAG(ligature_kind,3):{Lig l;HGET_LIG(3,l);}break;
case TAG(ligature_kind,4):{Lig l;HGET_LIG(4,l);}break;
case TAG(ligature_kind,5):{Lig l;HGET_LIG(5,l);}break;
case TAG(ligature_kind,6):{Lig l;HGET_LIG(6,l);}break;
case TAG(ligature_kind,7):{Lig l;HGET_LIG(7,l);}break;
/*:192*//*200:*/
#line 4197 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(disc_kind,b001):{Disc h;HGET_DISC(b001,h);hwrite_disc(&h);}break;
case TAG(disc_kind,b010):{Disc h;HGET_DISC(b010,h);hwrite_disc(&h);}break;
case TAG(disc_kind,b011):{Disc h;HGET_DISC(b011,h);hwrite_disc(&h);}break;
case TAG(disc_kind,b100):{Disc h;HGET_DISC(b100,h);hwrite_disc(&h);}break;
case TAG(disc_kind,b101):{Disc h;HGET_DISC(b101,h);hwrite_disc(&h);}break;
case TAG(disc_kind,b110):{Disc h;HGET_DISC(b110,h);hwrite_disc(&h);}break;
case TAG(disc_kind,b111):{Disc h;HGET_DISC(b111,h);hwrite_disc(&h);}break;
/*:200*//*207:*/
#line 4341 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(par_kind,b000):HGET_PAR(b000);break;
case TAG(par_kind,b010):HGET_PAR(b010);break;
case TAG(par_kind,b100):HGET_PAR(b100);break;
case TAG(par_kind,b110):HGET_PAR(b110);break;
/*:207*//*212:*/
#line 4414 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(math_kind,b000):HGET_MATH(b000);break;
case TAG(math_kind,b001):HGET_MATH(b001);break;
case TAG(math_kind,b010):HGET_MATH(b010);break;
case TAG(math_kind,b100):HGET_MATH(b100);break;
case TAG(math_kind,b101):HGET_MATH(b101);break;
case TAG(math_kind,b110):HGET_MATH(b110);break;
/*:212*//*217:*/
#line 4465 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(math_kind,b111):hwritef(" on");break;
case TAG(math_kind,b011):hwritef(" off");break;
/*:217*//*221:*/
#line 4496 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(adjust_kind,1):{List l;hget_list(&l);hwrite_list(&l);}break;
/*:221*//*225:*/
#line 4603 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(table_kind,b000):HGET_TABLE(b000);break;
case TAG(table_kind,b001):HGET_TABLE(b001);break;
case TAG(table_kind,b010):HGET_TABLE(b010);break;
case TAG(table_kind,b011):HGET_TABLE(b011);break;
case TAG(table_kind,b100):HGET_TABLE(b100);break;
case TAG(table_kind,b101):HGET_TABLE(b101);break;
case TAG(table_kind,b110):HGET_TABLE(b110);break;
case TAG(table_kind,b111):HGET_TABLE(b111);break;

case TAG(item_kind,b000):{List l;hget_list(&l);hwrite_list(&l);}break;
case TAG(item_kind,b001):hget_content_node();break;
case TAG(item_kind,b010):hwritef(" 2");hget_content_node();break;
case TAG(item_kind,b011):hwritef(" 3");hget_content_node();break;
case TAG(item_kind,b100):hwritef(" 4");hget_content_node();break;
case TAG(item_kind,b101):hwritef(" 5");hget_content_node();break;
case TAG(item_kind,b110):hwritef(" 6");hget_content_node();break;
case TAG(item_kind,b111):hwritef(" %u",HGET8);hget_content_node();break;
/*:225*//*233:*/
#line 4783 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(image_kind,b001):HGET_IMAGE(b001);break;
case TAG(image_kind,b010):HGET_IMAGE(b010);break;
case TAG(image_kind,b011):HGET_IMAGE(b011);break;
case TAG(image_kind,b100):HGET_IMAGE(b100);break;
case TAG(image_kind,b101):HGET_IMAGE(b101);break;
case TAG(image_kind,b110):HGET_IMAGE(b110);break;
case TAG(image_kind,b111):HGET_IMAGE(b111);break;
/*:233*//*266:*/
#line 5743 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(link_kind,b000):HGET_LINK(b000);break;
case TAG(link_kind,b001):HGET_LINK(b001);break;
case TAG(link_kind,b010):HGET_LINK(b010);break;
case TAG(link_kind,b011):HGET_LINK(b011);break;
case TAG(link_kind,b100):HGET_LINK(b100);break;
case TAG(link_kind,b101):HGET_LINK(b101);break;
case TAG(link_kind,b110):HGET_LINK(b110);break;
case TAG(link_kind,b111):HGET_LINK(b111);break;
/*:266*//*297:*/
#line 6319 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(color_kind,b000):
{uint8_t n= HGET8;
if(n==0xFF)hwritef(" off");
else{REF(color_kind,n);hwrite_ref(n);}
}
break;
/*:297*//*314:*/
#line 6962 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(stream_kind,b100):{uint8_t n= HGET8;REF_RNG(stream_kind,n);hwrite_ref(n);break;}
/*:314*//*317:*/
#line 7007 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(stream_kind,b000):HGET_STREAM(b000);break;
case TAG(stream_kind,b010):HGET_STREAM(b010);break;
/*:317*//*416:*/
#line 9281 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


case TAG(penalty_kind,0):HGET_REF(penalty_kind);break;
case TAG(kern_kind,b000):HGET_REF(dimen_kind);break;
case TAG(kern_kind,b100):hwritef(" !");HGET_REF(dimen_kind);break;
case TAG(kern_kind,b001):hwritef(" xdimen");HGET_REF(xdimen_kind);break;
case TAG(kern_kind,b101):hwritef(" ! xdimen");HGET_REF(xdimen_kind);break;
case TAG(ligature_kind,0):HGET_REF(ligature_kind);break;
case TAG(disc_kind,0):HGET_REF(disc_kind);break;
case TAG(glue_kind,0):HGET_REF(glue_kind);break;
case TAG(language_kind,b000):HGET_REF(language_kind);break;
case TAG(rule_kind,0):HGET_REF(rule_kind);break;
case TAG(image_kind,0):HGET_REF(image_kind);break;
case TAG(leaders_kind,0):HGET_REF(leaders_kind);break;
case TAG(baseline_kind,0):HGET_REF(baseline_kind);break;
/*:416*/
#line 780 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

default:
if(!hget_unknown(a))
TAGERR(a);
break;
}
}
/*:18*//*85:*/
#line 1727 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_dimen(Tag a)
{if(INFO(a)==b000)
{uint8_t r;r= HGET8;REF(dimen_kind,r);hwrite_ref(r);}
else
{uint32_t d;HGET32(d);hwrite_dimension(d);}
}
/*:85*//*93:*/
#line 1819 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_xdimen(Tag a,Xdimen*x)
{switch(a)
{
case TAG(xdimen_kind,b001):HGET_XDIMEN(b001,*x);break;
case TAG(xdimen_kind,b010):HGET_XDIMEN(b010,*x);break;
case TAG(xdimen_kind,b011):HGET_XDIMEN(b011,*x);break;
case TAG(xdimen_kind,b100):HGET_XDIMEN(b100,*x);break;
case TAG(xdimen_kind,b101):HGET_XDIMEN(b101,*x);break;
case TAG(xdimen_kind,b110):HGET_XDIMEN(b110,*x);break;
case TAG(xdimen_kind,b111):HGET_XDIMEN(b111,*x);break;
default:
QUIT("Extent expected got [%s,%d]",NAME(a),INFO(a));
}
}
/*:93*//*94:*/
#line 1843 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_xdimen_node(Xdimen*x)
{/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 1845 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(a)==xdimen_kind)
hget_xdimen(a,x);
else
QUIT("Extent expected at 0x%x got %s",node_pos,NAME(a));
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 1850 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:94*//*121:*/
#line 2247 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_rule_node(void)
{/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 2249 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(a)==rule_kind)
{Rule r;HGET_RULE(INFO(a),r);
hwrite_start();hwritef("rule");hwrite_rule(&r);hwrite_end();
}
else
QUIT("Rule expected at 0x%x got %s",node_pos,NAME(a));
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 2256 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:121*//*139:*/
#line 2588 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_glue_node(void)
{/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 2590 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(a)!=glue_kind)
{hpos--;hwrite_ref_node(glue_kind,zero_skip_no);return;}
if(INFO(a)==b000)
{uint8_t n= HGET8;REF(glue_kind,n);hwrite_ref_node(glue_kind,n);}
else
{Glue g;HGET_GLUE(INFO(a),g);hwrite_glue_node(&g);}
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 2597 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:139*//*158:*/
#line 3311 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int hget_txt(void)
{if(*hpos>=0x80&&*hpos<=0xF7)
{if(option_utf8)
return hwrite_utf8(hget_utf8());
else
return hwritef("\\C%d\\",hget_utf8());
}
else
{uint8_t a;
a= HGET8;
switch(a)
{case txt_font+0:return hwritef("\\0");
case txt_font+1:return hwritef("\\1");
case txt_font+2:return hwritef("\\2");
case txt_font+3:return hwritef("\\3");
case txt_font+4:return hwritef("\\4");
case txt_font+5:return hwritef("\\5");
case txt_font+6:return hwritef("\\6");
case txt_font+7:return hwritef("\\7");
case txt_global+0:HGET_GREF(font_kind,"F");
case txt_global+1:HGET_GREF(penalty_kind,"P");
case txt_global+2:HGET_GREF(kern_kind,"K");
case txt_global+3:HGET_GREF(ligature_kind,"L");
case txt_global+4:HGET_GREF(disc_kind,"D");
case txt_global+5:HGET_GREF(glue_kind,"G");
case txt_global+6:HGET_GREF(language_kind,"S");
case txt_global+7:HGET_GREF(rule_kind,"R");
case txt_global+8:HGET_GREF(image_kind,"I");
case txt_local+0:return hwritef("\\a");
case txt_local+1:return hwritef("\\b");
case txt_local+2:return hwritef("\\c");
case txt_local+3:return hwritef("\\d");
case txt_local+4:return hwritef("\\e");
case txt_local+5:return hwritef("\\f");
case txt_local+6:return hwritef("\\g");
case txt_local+7:return hwritef("\\h");
case txt_local+8:return hwritef("\\i");
case txt_local+9:return hwritef("\\j");
case txt_local+10:return hwritef("\\k");
case txt_local+11:return hwritef("\\l");
case txt_cc:return hwrite_txt_cc(hget_utf8());
case txt_node:{int i;
/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 3354 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

i= hwritef("<");
i+= hwritef("%s",content_name[KIND(a)]);hget_content(a);
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 3357 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hwritec('>');return i+10;
}
case txt_hyphen:hwritec('-');return 1;
case txt_glue:return-1;
case'<':return hwritef("\\<");
case'>':return hwritef("\\>");
case'"':return hwritef("\\\"");
case'-':return hwritef("\\-");
case txt_ignore:return hwritef("\\@");
default:hwritec(a);return 1;
}
}
}

/*:158*//*167:*/
#line 3566 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_hbox_node(void)
{Box b;
/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 3569 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(a)!=hbox_kind)QUIT("Hbox expected at 0x%x got %s",node_pos,NAME(a));
HGET_BOX(INFO(a),b);
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 3572 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hwrite_start();
hwritef("hbox");
hwrite_box(&b);
hwrite_end();
}


void hget_vbox_node(void)
{Box b;
/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 3582 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(a)!=vbox_kind)QUIT("Vbox expected at 0x%x got %s",node_pos,NAME(a));
HGET_BOX(INFO(a),b);
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 3585 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hwrite_start();
hwritef("vbox");
hwrite_box(&b);
hwrite_end();
}
/*:167*//*202:*/
#line 4216 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_disc_node(Disc*h)
{/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 4218 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(KIND(a)!=disc_kind||INFO(a)==b000)
QUIT("Hyphen expected at 0x%x got %s,%d",node_pos,NAME(a),INFO(a));
HGET_DISC(INFO(a),*h);
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 4222 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:202*//*245:*/
#line 5345 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_outline_or_label_def(Info i,uint32_t node_pos)
{if(i&b100)
/*277:*/
#line 5877 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{int r,d;
List l;
static int outline_no= -1;
hwrite_start();hwritef("outline");
++outline_no;
RNG("outline",outline_no,0,max_outline);
if(i&b001)HGET16(r);else r= HGET8;
REF_RNG(link_kind,r);
if(labels[r].where==LABEL_UNDEF)
MESSAGE("WARNING: Outline with undefined label %d at 0x%x\n",r,node_pos);
hwritef(" *%d",r);
d= HGET8;hwritef(" %d",d);
hget_list(&l);hwrite_list(&l);
hwrite_end();
}
/*:277*/
#line 5348 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

else
/*261:*/
#line 5619 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{Label*t;
int n;
if(i&b001)HGET16(n);else n= HGET8;
REF_RNG(label_kind,n);
t= labels+n;
if(t->where!=LABEL_UNDEF)
DBG(DBGLABEL,"Duplicate definition of label %d at 0x%x\n",n,node_pos);
HGET32(t->pos);
t->where= HGET8;
if(t->where==LABEL_UNDEF||t->where> LABEL_MID)
DBG(DBGLABEL,"Label %d where value invalid: %d at 0x%x\n",n,t->where,node_pos);
if(i&b010)
{HGET32(t->pos0);t->f= HGET8;}
else t->pos0= t->pos;
DBG(DBGLABEL,"Defining label %d at 0x%x/0x%x\n",n,t->pos0,t->pos);
}
/*:261*/
#line 5350 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:245*//*298:*/
#line 6331 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hwrite_color_pair(uint32_t f,uint32_t b)
{hwritec('<');
if(f==0)hwritec('0');else hwritef("0x%08X",f);
if(b!=0)hwritef(" 0x%08X",b);
hwritec('>');
}

void hget_color_set(uint32_t node_pos,ColorSet cs)
{int i,m;
for(i= 0;i<sizeof(ColorSet)/4;i++)
HGET32(cs[i]);
for(m= 0;m<2;m++)
{uint32_t*c,*d;
bool diff_high,diff_focus;
if(m==0)
{c= cs;d= color_defaults[0];}
else
{c= NIGHT(cs);d= NIGHT(color_defaults[0]);
if(memcmp(c,d,sizeof(ColorSet)/2)==0)
return;
}
hwrite_start();
diff_high= FG(HIGH(c))!=FG(HIGH(d))||BG(HIGH(c))!=BG(HIGH(d));
diff_focus= FG(FOCUS(c))!=FG(FOCUS(d))||BG(FOCUS(c))!=BG(FOCUS(d));
hwrite_color_pair(FG(c),BG(c));
if(diff_high||diff_focus)
{hwritec(' ');hwrite_color_pair(FG(HIGH(c)),BG(HIGH(c)));}
if(diff_focus)
{hwritec(' ');hwrite_color_pair(FG(FOCUS(c)),BG(FOCUS(c)));}
hwrite_end();
}
}
/*:298*//*307:*/
#line 6520 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_unknown_def(void)
{Tag t;signed char i,b= 0,n= 0;
t= HGET8;
i= HGET8;
if(i==0)
QUIT("Zero not allowed for unknown node size at 0x%x\n",(uint32_t)(hpos-hstart-2));
hwrite_start();hwritef("unknown");
b= NODE_HEAD(i);n= NODE_TAIL(i);
if(n==0)
hwritef(" 0x%02X %d",t,b);
else
hwritef(" 0x%02X %d %d",t,b,n);
if(hnode_size[t]==0)
{hnode_size[t]= i;
DBG(DBGTAGS,"Defining node size %d,%d for tag 0x%x\n",b,n,t);
}
hwrite_end();
}
/*:307*//*308:*/
#line 6545 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int hget_unknown(Tag a)
{int b,n;
int8_t s;
s= hnode_size[a];
DBG(DBGTAGS,"Trying unknown tag 0x%x at 0x%x\n",a,(uint32_t)(hpos-hstart-1));
if(s==0)return 0;
b= NODE_HEAD(s);n= NODE_TAIL(s);
DBG(DBGTAGS,"Trying unknown node size %d %d\n",b,n);
hwritef("unknown 0x%02X",a);
while(b> 0){a= HGET8;hwritef(" 0x%02X",a);b--;}
while(n> 0){
a= *hpos;
if(KIND(a)==xdimen_kind){Xdimen x;hget_xdimen_node(&x);hwrite_xdimen_node(&x);}
else if(KIND(a)==param_kind){List l;hget_param_list(&l);hwrite_named_param_list(&l);}
else if(KIND(a)<=list_kind){List l;hget_list(&l);hwrite_list(&l);}
else hget_content_node();
n--;}
return 1;
}
/*:308*//*313:*/
#line 6927 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static bool hget_stream_def(void)
{if(KIND(*hpos)!=stream_kind||!(INFO(*hpos)&b100))
return false;
else
{Ref df;
/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 6933 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

DBG(DBGDEF,"Defining stream %d at "SIZE_F"\n",*hpos,hpos-hstart-1);
DEF(df,stream_kind,HGET8);
hwrite_start();hwritef("stream");hwrite_ref(df.n);
if(df.n> 0)
{Xdimen x;List l;
if(INFO(a)==b100)/*312:*/
#line 6914 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{Xdimen x;
uint16_t f,r;
uint8_t n;
DBG(DBGDEF,"Defining normal stream %d at "SIZE_F"\n",*(hpos-1),hpos-hstart-2);
hget_xdimen_node(&x);hwrite_xdimen_node(&x);
HGET16(f);RNG("magnification factor",f,0,1000);hwritef(" %d",f);
n= HGET8;if(n==255)hwritef(" *");else{REF_RNG(stream_kind,n);hwrite_ref(n);}
n= HGET8;if(n==255)hwritef(" *");else{REF_RNG(stream_kind,n);hwrite_ref(n);}
HGET16(r);RNG("split ratio",r,0,1000);hwritef(" %d",r);
}
/*:312*/
#line 6939 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

else if(INFO(a)==b101)hwritef(" first");
else if(INFO(a)==b110)hwritef(" last");
else if(INFO(a)==b111)hwritef(" top");
hget_list(&l);hwrite_list(&l);
hget_xdimen_node(&x);hwrite_xdimen_node(&x);
hget_glue_node();
hget_list(&l);hwrite_list(&l);
hget_glue_node();
}
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 6949 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hwrite_end();
return true;
}
}

/*:313*//*322:*/
#line 7116 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_page(void)
{char*n;uint8_t p;Xdimen x;List l;
HGET_STRING(n);hwrite_string(n);
p= HGET8;if(p!=1)hwritef(" %d",p);
hget_glue_node();
hget_dimen(TAG(dimen_kind,b001));
hget_xdimen_node(&x);hwrite_xdimen_node(&x);
hget_xdimen_node(&x);hwrite_xdimen_node(&x);
hget_list(&l);hwrite_list(&l);
while(hget_stream_def())continue;
}
/*:322*//*331:*/
#line 7243 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_range(Info info,uint8_t pg)
{uint32_t from,to;
REF(page_kind,pg);
REF(range_kind,(next_range-1)/2);
if(info&b100)
{if(info&b001)HGET32(from);else HGET16(from);}
else from= 0;
if(info&b010)
{if(info&b001)HGET32(to);else HGET16(to);}
else to= HINT_NO_POS;
range_pos[next_range].pg= pg;
range_pos[next_range].on= true;
range_pos[next_range].pos= from;
DBG(DBGRANGE,"Range *%d from 0x%x\n",pg,from);
DBG(DBGRANGE,"Range *%d to 0x%x\n",pg,to);
next_range++;
if(to!=HINT_NO_POS)
{range_pos[next_range].pg= pg;
range_pos[next_range].on= false;
range_pos[next_range].pos= to;
next_range++;
}
}
/*:331*//*381:*/
#line 8505 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_definition_section(void)
{DBG(DBGBASIC|DBGDEF,"Definitions\n");
hget_section(1);
hwrite_definitions_start();
DBG(DBGDEF,"List of maximum values\n");
hget_max_definitions();
/*253:*/
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
#line 8512 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hwrite_max_definitions();
DBG(DBGDEF,"List of definitions\n");
while(hpos<hend)
hget_def_node();
hwrite_definitions_end();
}
/*:381*//*398:*/
#line 8870 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_definition(int n,Tag a,uint32_t node_pos)
{switch(KIND(a))
{case font_kind:hget_font_def(INFO(a),n);break;
case param_kind:
{List l;l.t= a;HGET_LIST(INFO(a),l);hwrite_parameters(&l);break;}
case page_kind:hget_page();break;
case dimen_kind:hget_dimen(a);break;
case xdimen_kind:
{Xdimen x;hget_xdimen(a,&x);hwrite_xdimen(&x);break;}
case language_kind:
if(INFO(a)!=b000)
QUIT("Info value of language definition must be zero");
else
{char*n;HGET_STRING(n);hwrite_string(n);}
break;
case color_kind:
switch(INFO(a))
{/*299:*/
#line 6366 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

case b000:
{int k;
ColorSet c;
static bool first_color= true;
k= HGET8;
if(k<6)
QUIT("Definition %d of color set needs 6 color pairs only %d given\n",n,k);
hget_color_set(node_pos,c);
if(n==0)
{if(!first_color)
QUIT("Definition of color set zero must be first");
memcpy(&color_defaults[0],&c,sizeof(ColorSet));
}
first_color= false;
}
break;
/*:299*/
#line 8888 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

default:
QUIT("Undefined tag %d for color_kind definition at 0x%x",INFO(a),node_pos);
}
break;
default:
hget_content(a);break;
}
}


void hget_def_node()
{Kind k;

/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 8902 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

k= KIND(a);
if(k==unknown_kind&&INFO(a)==b100)
hget_unknown_def();
else if(k==label_kind)
hget_outline_or_label_def(INFO(a),node_pos);
else
{int n;
n= HGET8;
if(k!=range_kind)REF_RNG(k,n);
SET_DBIT(n,k);
if(k==range_kind)
hget_range(INFO(a),n);
else
{hwrite_start();hwritef("%s *%d",definition_name[k],n);
hget_definition(n,a,node_pos);
hwrite_end();
}
if(n> max_ref[k]||n<=max_fixed[k])
QUIT("Definition %d for %s out of range [%d - %d]",
n,definition_name[k],max_fixed[k]+1,max_ref[k]);
if(max_fixed[k]> max_default[k])
QUIT("Definitions for kind %s not supported",definition_name[k]);
}
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 8926 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
/*:398*//*405:*/
#line 9027 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_param_list(List*l)
{if(KIND(*hpos)!=param_kind)
QUIT("Parameter list expected at 0x%x",(uint32_t)(hpos-hstart));
else hget_list(l);
}
/*:405*//*412:*/
#line 9180 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hget_font_params(void)
{Disc h;
hget_glue_node();
hget_disc_node(&(h));hwrite_disc_node(&h);
DBG(DBGDEF,"Start font parameters\n");
while(KIND(*hpos)!=font_kind)
{Ref df;
/*16:*/
#line 726 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag a,z;
uint32_t node_pos= (uint32_t)(hpos-hstart);
if(hpos>=hend)QUIT("Attempt to read a start byte at the end of the section");
HGETTAG(a);
/*:16*/
#line 9188 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

df.k= KIND(a);
df.n= HGET8;
DBG(DBGDEF,"Reading font parameter %d: %s\n",df.n,definition_name[df.k]);
if(df.k!=penalty_kind&&df.k!=kern_kind&&df.k!=ligature_kind&&
df.k!=disc_kind&&df.k!=glue_kind&&df.k!=language_kind&&df.k!=rule_kind&&df.k!=image_kind)
QUIT("Font parameter %d has invalid type %s",df.n,content_name[df.n]);
RNG("Font parameter",df.n,0,MAX_FONT_PARAMS);
hwrite_start();hwritef("%s *%d",content_name[KIND(a)],df.n);
hget_definition(df.n,a,node_pos);
hwrite_end();
/*17:*/
#line 733 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HGETTAG(z);
if(a!=z)
QUIT("Tag mismatch [%s,%d]!=[%s,%d] at 0x%x to "SIZE_F"\n",
NAME(a),INFO(a),NAME(z),INFO(z),node_pos,hpos-hstart-1);
/*:17*/
#line 9199 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

}
DBG(DBGDEF,"End font parameters\n");
}


void hget_font_def(Info i,uint8_t f)
{char*n;Dimen s= 0;uint16_t m= 0,y;
HGET_STRING(n);hwrite_string(n);hfont_name[f]= strdup(n);
HGET32(s);hwrite_dimension(s);
DBG(DBGDEF,"Font %s size 0x%x\n",n,s);
if(i==b000){HGET16(m);RNG("Font metrics",m,3,max_section_no);}
HGET16(y);RNG("Font glyphs",y,3,max_section_no);
if(i==b000)hwritef(" %d",m);
hwritef(" %d",y);
hget_font_params();
DBG(DBGDEF,"End font definition\n");
}
/*:412*//*446:*/
#line 9780 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hget_content_section()
{DBG(DBGBASIC|DBGDIR,"Content\n");
hget_section(2);
hwrite_range();
hwrite_label();
while(hpos<hend)
hget_content_node();
}
/*:446*/
#line 11932 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"




#define SKIP
#define DESCRIPTION "\n This program tests parsing a binary HINT file in reverse direction.\n"

int main(int argc,char*argv[])
{/*451:*/
#line 9907 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

char*prog_name;
char*in_ext;
char*out_ext;
int option_log= false;
#ifndef SKIP
char*file_name= NULL;
int file_name_length= 0;
#endif
#line 9916 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
/*:451*/
#line 11940 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

in_ext= ".hnt";
out_ext= ".bak";

/*452:*/
#line 9923 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

debugflags= DBGBASIC;
prog_name= argv[0];
if(argc<2)
{fprintf(stderr,
"%s: no input file given\n"
"Try '%s --help' for more information\n",prog_name,prog_name);
exit(1);
}
argv++;
while(*argv!=NULL)
{if((*argv)[0]=='-')
{char option= (*argv)[1];
switch(option)
{case'-':
if(strcmp(*argv,"--version")==0)
{fprintf(stderr,"%s version "HINT_VERSION_STRING"\n",prog_name);
exit(0);
}
else if(strcmp(*argv,"--help")==0)
{/*448:*/
#line 9814 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

fprintf(stdout,
"Usage: %s [OPTION]... FILENAME%s\n",prog_name,in_ext);
fprintf(stdout,DESCRIPTION);
fprintf(stdout,
"\nOptions:\n"
"\t --help \t display this message\n"
"\t --version\t display the HINT version\n"
"\t -l     \t redirect stderr to a log file\n"
#if defined (STRETCH) || defined (SHRINK)
"\t -o FILE\t specify an output file name\n"
#endif
#line 9826 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
#if defined (STRETCH)
"\t -a     \t write auxiliary files\n"
"\t -g     \t do not use localized names (implies -a)\n"
"\t -f     \t force overwriting existing auxiliary files\n"
"\t -u     \t enable writing utf8 character codes\n"
"\t -x     \t enable writing hexadecimal character codes\n"
#elif defined (SHRINK)
#line 9833 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
"\t -a     \t use only localized names\n"
"\t -g     \t do not use localized names\n"
"\t -c     \t enable compression\n"
#endif
#line 9837 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
);
#ifdef DEBUG
fprintf(stdout,"\t -d XXXX \t set debug flag to hexadecimal value XXXX.\n"
"\t\t\t OR together these values:\n");
fprintf(stdout,"\t\t\t XX=%03X   basic debugging\n",DBGBASIC);
fprintf(stdout,"\t\t\t XX=%03X   tag debugging\n",DBGTAGS);
fprintf(stdout,"\t\t\t XX=%03X   node debugging\n",DBGNODE);
fprintf(stdout,"\t\t\t XX=%03X   definition debugging\n",DBGDEF);
fprintf(stdout,"\t\t\t XX=%03X   directory debugging\n",DBGDIR);
fprintf(stdout,"\t\t\t XX=%03X   range debugging\n",DBGRANGE);
fprintf(stdout,"\t\t\t XX=%03X   float debugging\n",DBGFLOAT);
fprintf(stdout,"\t\t\t XX=%03X   compression debugging\n",DBGCOMPRESS);
fprintf(stdout,"\t\t\t XX=%03X   buffer debugging\n",DBGBUFFER);
fprintf(stdout,"\t\t\t XX=%03X   flex debugging\n",DBGFLEX);
fprintf(stdout,"\t\t\t XX=%03X   bison debugging\n",DBGBISON);
fprintf(stdout,"\t\t\t XX=%03X   TeX debugging\n",DBGTEX);
fprintf(stdout,"\t\t\t XX=%03X   Page debugging\n",DBGPAGE);
fprintf(stdout,"\t\t\t XX=%03X   Font debugging\n",DBGFONT);
fprintf(stdout,"\t\t\t XX=%03X   Render debugging\n",DBGRENDER);
fprintf(stdout,"\t\t\t XX=%03X   Label debugging\n",DBGLABEL);
#endif
#line 9858 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
/*:448*/
#line 9943 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

fprintf(stdout,"\nFor further information and reporting bugs see https://hint.userweb.mwn.de/\n");
exit(0);
}
case'l':option_log= true;break;
#if defined (STRETCH) || defined (SHRINK)
case'o':argv++;
file_name_length= (int)strlen(*argv);
ALLOCATE(file_name,file_name_length+6,char);
strcpy(file_name,*argv);break;
case'g':option_global= option_aux= true;break;
case'a':option_aux= true;break;
#endif
#line 9956 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
#if defined (STRETCH)
case'u':option_utf8= true;break;
case'x':option_hex= true;break;
case'f':option_force= true;break;
#elif defined (SHRINK)
#line 9961 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
case'c':option_compress= true;break;
#endif
#line 9963 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
 case'd':
argv++;if(*argv==NULL)
{fprintf(stderr,
"%s: option -d expects an argument\n"
"Try '%s --help' for more information\n",prog_name,prog_name);
exit(1);
}
debugflags= strtol(*argv,NULL,16);
break;
default:
{fprintf(stderr,
"%s: unrecognized option '%s'\n"
"Try '%s --help' for more information\n",prog_name,*argv,prog_name);
exit(1);
}
}
}
else
{int path_length= (int)strlen(*argv);
int ext_length= (int)strlen(in_ext);
ALLOCATE(hin_name,path_length+ext_length+1,char);
strcpy(hin_name,*argv);
if(path_length<ext_length
||strncmp(hin_name+path_length-ext_length,in_ext,ext_length)!=0)
{strcat(hin_name,in_ext);
path_length+= ext_length;
}
stem_length= path_length-ext_length;
ALLOCATE(stem_name,stem_length+6,char);
strncpy(stem_name,hin_name,stem_length);
stem_name[stem_length]= 0;
if(*(argv+1)!=NULL)
{fprintf(stderr,
"%s: extra argument after input file name:  '%s'\n"
"Try '%s --help' for more information\n",prog_name,*(argv+1),prog_name);
exit(1);
}
}
argv++;
}
if(hin_name==NULL)
{fprintf(stderr,
"%s: missing input file name\n"
"Try '%s --help' for more information\n",prog_name,prog_name);
exit(1);
}
/*:452*/
#line 11944 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*454:*/
#line 10028 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(option_log)
{
strcat(stem_name,".log");
hlog= freopen(stem_name,"w",stderr);
if(hlog==NULL)
{fprintf(stderr,"Unable to open logfile %s",stem_name);
hlog= stderr;
}
stem_name[stem_length]= 0;
}
else
hlog= stderr;
/*:454*/
#line 11945 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hout= NULL;
if(!hget_map())QUIT("Unable to map the input file");
hpos= hstart= hin_addr;
hend= hstart+hin_size;
hget_banner();
if(!hcheck_banner("hint"))QUIT("Invalid banner");
hget_directory();
hget_definition_section();
DBG(DBGBASIC,"Skipping Content Section\n");
hteg_content_section();
DBG(DBGBASIC,"Fast forward Content Section\n");
hpos= hstart;
while(hpos<hend)
{hff_hpos();
if(KIND(*(hpos-1))==par_kind&&KIND(hff_tag)==list_kind&&hff_list_size> 0&&!(INFO(hff_tag)&b100))
{uint8_t*p= hpos,*q;
DBG(DBGTAGS,"Fast forward list at 0x%x, size %d\n",hff_list_pos,hff_list_size);
hpos= hstart+hff_list_pos;
q= hpos+hff_list_size;
while(hpos<q)
hff_hpos();
DBG(DBGTAGS,"Fast forward list end at 0x%x\n",(uint32_t)(hpos-hstart));
hpos= p;
DBG(DBGTAGS,"Continue at 0x%x\n",(uint32_t)(hpos-hstart-1));
}
}
hget_unmap();
/*460:*/
#line 10088 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(hlog!=NULL)fclose(hlog);
if(stem_name!=NULL)free(stem_name);
/*:460*/
#line 11973 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

return 0;
}
/*:560*/
