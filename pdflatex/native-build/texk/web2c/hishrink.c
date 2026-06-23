/*557:*/
#line 11728 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#include "hibasetypes.h"
#include <math.h> 
#include <string.h> 
#include <ctype.h> 
#include <sys/types.h> 
#include <sys/stat.h> 
#ifdef WIN32
#include <direct.h> 
#endif
#line 11738 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
#include <zlib.h> 

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
#line 11744 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#include "hiparser.h"

extern void yyset_debug(int lex_debug);
extern int yylineno;
extern FILE*yyin,*yyout;
extern int yyparse(void);

/*345:*/
#line 7557 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

extern void hput_error(void);
#define HPUT8(X)       (hput_error(),*(hpos++)= (X))
#define HPUT16(X)      (HPUT8(((X)>>8)&0xFF),HPUT8((X)&0xFF))
#define HPUT24(X)      (HPUT8(((X)>>16)&0xFF),HPUT8(((X)>>8)&0xFF),HPUT8((X)&0xFF))
#define HPUT32(X)      (HPUT8(((X)>>24)&0xFF),HPUT8(((X)>>16)&0xFF),HPUT8(((X)>>8)&0xFF),HPUT8((X)&0xFF))
/*:345*//*346:*/
#line 7569 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_increase_buffer(uint32_t n);
#define HPUTX(N) (((hend-hpos) < (N))? hput_increase_buffer(N):(void)0)
#define HPUTNODE  HPUTX(MAX_TAG_DISTANCE)
#define HPUTTAG(K,I) (HPUTNODE,DBGTAG(TAG(K,I),hpos),HPUT8(TAG(K,I)))
/*:346*/
#line 11752 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


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
#line 11754 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*273:*/
#line 5820 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Outline*outlines;
/*:273*/
#line 11755 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

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
#line 11756 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

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
#line 11757 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*339:*/
#line 7459 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


static size_t hput_banner(char*magic,char*str)
{size_t s= fprintf(hout,"%s "HINT_VERSION_STRING" %s\n",magic,str);
if(s> MAX_BANNER)QUIT("Banner too big");
return s;
}
/*:339*/
#line 11758 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*14:*/
#line 675 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static uint8_t hput_n(uint32_t n)
{if(n<=0xFF)
{HPUT8(n);return 1;}
else if(n<=0xFFFF)
{HPUT16(n);return 2;}
else if(n<=0xFFFFFF)
{HPUT24(n);return 3;}
else
{HPUT32(n);return 4;}
}

Tag hput_glyph(Glyph*g)
{Info info;
info= hput_n(g->c);
HPUT8(g->f);
return TAG(glyph_kind,info);
}
/*:14*//*15:*/
#line 697 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_tags(uint32_t pos,Tag tag)
{DBGTAG(tag,hstart+pos);DBGTAG(tag,hpos);
HPUTX(1);*(hstart+pos)= *(hpos++)= tag;
}
/*:15*//*37:*/
#line 1063 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_string(char*str)
{char*s= str;
if(s!=NULL)
{do{
HPUTX(1);
HPUT8(*s);
}while(*s++!=0);
HPUTNODE;
}
else HPUT8(0);
}
/*:37*//*54:*/
#line 1270 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_utf8(uint32_t c)
{HPUTX(4);
if(c<0x80)
HPUT8(c);
else if(c<0x800)
{HPUT8(0xC0|(c>>6));HPUT8(0x80|(c&0x3F));}
else if(c<0x10000)
{HPUT8(0xE0|(c>>12));HPUT8(0x80|((c>>6)&0x3F));HPUT8(0x80|(c&0x3F));}
else if(c<0x200000)
{HPUT8(0xF0|(c>>18));HPUT8(0x80|((c>>12)&0x3F));
HPUT8(0x80|((c>>6)&0x3F));HPUT8(0x80|(c&0x3F));}
else
RNG("character code",c,0,0x1FFFFF);
}
/*:54*//*75:*/
#line 1620 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_float32(float32_t d)
{union{float32_t d;uint32_t bits;}u;
u.d= d;HPUT32(u.bits);
}
/*:75*//*86:*/
#line 1737 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


Tag hput_dimen(Dimen d)
{HPUT32(d);
return TAG(dimen_kind,b001);
}
/*:86*//*95:*/
#line 1857 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_xdimen(Xdimen*x)
{Info info= b000;
if(x->w==0&&x->h==0.0&&x->v==0.0){HPUT32(0);info|= b100;}
else
{if(x->w!=0){HPUT32(x->w);info|= b100;}
if(x->h!=0.0){hput_float32(x->h);info|= b010;}
if(x->v!=0.0){hput_float32(x->v);info|= b001;}
}
return TAG(xdimen_kind,info);
}
void hput_xdimen_node(Xdimen*x)
{uint32_t p= hpos++-hstart;
hput_tags(p,hput_xdimen(x));
}


/*:95*//*97:*/
#line 1911 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_stretch(Stretch*s)
{uint32_t mantissa,lowbits,sign,exponent;
Stch st;
st.f= s->f;
DBG(DBGFLOAT,"joining %f->%f(0x%X),%d:",s->f,st.f,st.u,s->o);
mantissa= st.u&(((uint32_t)1<<FLT_M_BITS)-1);
lowbits= mantissa&0x7;
exponent= (st.u>>FLT_M_BITS)&(((uint32_t)1<<FLT_E_BITS)-1);
sign= st.u&((uint32_t)1<<(FLT_E_BITS+FLT_M_BITS));
DBG(DBGFLOAT,"s=%d e=0x%x m=0x%x",sign,exponent,mantissa);
switch(lowbits)
{case 0:break;
case 1:mantissa= mantissa-1;break;
case 2:mantissa= mantissa-2;break;
case 3:mantissa= mantissa+1;break;
case 4:break;
case 5:mantissa= mantissa-1;break;
case 6:mantissa= mantissa+1;
case 7:mantissa= mantissa+1;
if(mantissa>=((uint32_t)1<<FLT_M_BITS))
{exponent++;
RNG("Float32 exponent",exponent,1,2*FLT_EXCESS);
mantissa= mantissa>>1;
}
break;
}
DBG(DBGFLOAT," round s=%d e=0x%x m=0x%x",sign,exponent,mantissa);
st.u= sign|(exponent<<FLT_M_BITS)|mantissa|s->o;
DBG(DBGFLOAT,"float %f hex 0x%x\n",st.f,st.u);
HPUT32(st.u);
}
/*:97*//*108:*/
#line 2050 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_int(int32_t n)
{Info info;
if(n>=0)
{if(n<0x80){HPUT8(n);info= 1;}
else if(n<0x8000){HPUT16(n);info= 2;}
else{HPUT32(n);info= 3;}
}
else
{if(n>=-0x80){HPUT8(n);info= 1;}
else if(n>=-0x8000){HPUT16(n);info= 2;}
else{HPUT32(n);info= 3;}
}
return TAG(int_kind,info);
}
/*:108*//*112:*/
#line 2125 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_language(uint8_t n)
{if(n<7)return TAG(language_kind,n+1);
HPUT8(n);return TAG(language_kind,0);
}
/*:112*//*122:*/
#line 2261 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_rule(Rule*r)
{Info info= b000;
if(r->h!=RUNNING_DIMEN){HPUT32(r->h);info|= b100;}
if(r->d!=RUNNING_DIMEN){HPUT32(r->d);info|= b010;}
if(r->w!=RUNNING_DIMEN){HPUT32(r->w);info|= b001;}
return TAG(rule_kind,info);
}
/*:122*//*130:*/
#line 2357 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_kern(Kern*k)
{Info info;
if(k->x)info= b100;else info= b000;
if(k->d.h==0.0&&k->d.v==0.0)
{if(k->d.w==0)HPUT8(zero_dimen_no);
else{HPUT32(k->d.w);info= info|2;}
}
else{hput_xdimen_node(&(k->d));info= info|3;}
return TAG(kern_kind,info);
}
/*:130*//*140:*/
#line 2603 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_glue(Glue*g)
{Info info= b000;
if(ZERO_GLUE(*g)){HPUT8(zero_skip_no);info= b000;}
else if((g->w.w==0&&g->w.h==0.0&&g->w.v==0.0))
{if(g->p.f!=0.0){hput_stretch(&g->p);info|= b010;}
if(g->m.f!=0.0){hput_stretch(&g->m);info|= b001;}
}
else if(g->w.h==0.0&&g->w.v==0.0&&(g->p.f==0.0||g->m.f==0.0))
{HPUT32(g->w.w);info= b100;
if(g->p.f!=0.0){hput_stretch(&g->p);info|= b010;}
if(g->m.f!=0.0){hput_stretch(&g->m);info|= b001;}
}
else
{hput_stretch(&g->p);hput_stretch(&g->m);
hput_xdimen_node(&(g->w));
info= b111;
}
return TAG(glue_kind,info);
}
/*:140*//*148:*/
#line 2901 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

uint8_t hsize_bytes(uint32_t n)
{if(n==0)return 0;
else if(n<0x100)return 1;
else if(n<0x10000)return 2;
else return 4;
}

void hput_list_size(uint32_t n,int i)
{if(i==0)return;
else if(i==1)HPUT8(n);
else if(i==2)HPUT16(n);
else HPUT32(n);
}

Tag hput_list(uint32_t start_pos,List*l)
{if(l->s==0)
{hpos= hstart+start_pos;HPUT8(0);return TAG(KIND(l->t),INFO(l->t)&b100);}
else
{uint32_t list_end= hpos-hstart;
int i= l->p-start_pos-1;
int j= hsize_bytes(l->s);
Info k;
if(j==4)k= 3;else k= j;
DBG(DBGNODE,"Put list at 0x%x size=%u\n",l->p,l->s);
if(i> j&&l->s> 0x100)j= i;
if(i!=j)
{int d= j-i;
DBG(DBGNODE,"Moving %u byte by %d\n",l->s,d);
if(d> 0)HPUTX(d);
memmove(hstart+l->p+d,hstart+l->p,l->s);
/*258:*/
#line 5530 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{int i;
for(i= first_label;i>=0&&labels[i].pos>=l->p;i= labels[i].next)
{DBG(DBGNODE|DBGLABEL,"Moving label *%d by %d\n",i,d);
labels[i].pos+= d;
if(labels[i].pos0>=l->p)labels[i].pos0+= d;
}
}
/*:258*/
#line 2932 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

l->p= l->p+d;
list_end= list_end+d;
}
hpos= hstart+start_pos;hput_list_size(l->s,j);HPUT8(0x100-k);
hpos= hstart+list_end;HPUT8(0x100-k);hput_list_size(l->s,j);
return TAG(KIND(l->t),k|(INFO(l->t)&b100));
}
}

/*:148*//*159:*/
#line 3376 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


void hput_txt_cc(uint32_t c)
{if(c<=0x20){HPUTX(2);HPUT8(txt_cc);HPUT8(c);}
else hput_utf8(c);
}

void hput_txt_font(uint8_t f)
{if(f<8)HPUTX(1),HPUT8(txt_font+f);
else QUIT("Use \\F%d\\ instead of \\%d for font %d in a text",f,f,f);
}

void hput_txt_global(Ref*d)
{HPUTX(2);
switch(d->k)
{case font_kind:HPUT8(txt_global+0);break;
case penalty_kind:HPUT8(txt_global+1);break;
case kern_kind:HPUT8(txt_global+2);break;
case ligature_kind:HPUT8(txt_global+3);break;
case disc_kind:HPUT8(txt_global+4);break;
case glue_kind:HPUT8(txt_global+5);break;
case language_kind:HPUT8(txt_global+6);break;
case rule_kind:HPUT8(txt_global+7);break;
case image_kind:HPUT8(txt_global+8);break;
default:QUIT("Kind %s not allowed as a global reference in a text",NAME(d->k));
}
HPUT8(d->n);
}

void hput_txt_local(uint8_t n)
{HPUTX(1);
HPUT8(txt_local+n);
}
/*:159*//*168:*/
#line 3594 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


Info hput_box_dimen(Dimen h,Dimen d,Dimen w)
{Info i;
HPUT32(h);
if(d!=0){HPUT32(d);i= b001;}else i= b000;
HPUT32(w);
return i;
}
Info hput_box_shift(Dimen a)
{if(a!=0){HPUT32(a);return b010;}else return b000;
}

Info hput_box_glue_set(int8_t s,float32_t r,Order o)
{if(r!=0.0&&s!=0)
{hput_float32(r);
HPUT8((s<<4)|o);
return b100;
}
else return b000;
}

/*:168*//*186:*/
#line 3994 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_baseline(Baseline*b)
{Info info= b000;
if(!ZERO_GLUE(b->bs))info|= b100;
if(!ZERO_GLUE(b->ls))info|= b010;
if(b->lsl!=0){HPUT32(b->lsl);info|= b001;}
return TAG(baseline_kind,info);
}
/*:186*//*194:*/
#line 4096 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_ligature(Lig*l)
{if(l->l.s<7)return TAG(ligature_kind,l->l.s);
else
{uint32_t pos= l->l.p;
l->l.t= TAG(list_kind,b100);
hput_tags(pos,hput_list(pos+1,&(l->l)));
return TAG(ligature_kind,7);
}
}
/*:194*//*203:*/
#line 4231 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_disc(Disc*h)
{Info info= b000;
if(h->r!=0)info|= b100;
if(h->q.s!=0)info|= b011;
else if(h->p.s!=0)info|= b010;
if(info==b000){info|= b100;HPUT8(0);}
return TAG(disc_kind,info);
}
/*:203*//*227:*/
#line 4635 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Info hput_span_count(uint32_t n)
{if(n==0)QUIT("Span count in item must not be zero");
else if(n<7)return n;
else if(n> 0xFF)QUIT("Span count %d must be less than 255",n);
else
{HPUT8(n);return 7;}
}
/*:227*//*235:*/
#line 4811 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*236:*/
#line 4862 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hput_image_aspect(int n,double a)
{
if(a==0.0){Dimen w,h;hextract_image_dimens(n,&a,&w,&h);}
if(a!=0.0)hput_float32(a);
else QUIT("Unable to determine aspect ratio of image %s",dir[n].file_name);
}
/*:236*//*237:*/
#line 4878 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*239:*/
#line 4942 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define IMG_BUF_MAX 54
#define IMG_HEAD_MAX 2
static unsigned char img_buf[IMG_BUF_MAX];
static size_t img_buf_size;
#define LittleEndian32(X)   (img_buf[(X)]+(img_buf[(X)+1]<<8)+\
                                (img_buf[(X)+2]<<16)+(img_buf[(X)+3]<<24))

#define BigEndian16(X)   (img_buf[(X)+1]+(img_buf[(X)]<<8))

#define BigEndian32(X)   (img_buf[(X)+3]+(img_buf[(X)+2]<<8)+\
                                (img_buf[(X)+1]<<16)+(img_buf[(X)]<<24))

#define Match2(X,A,B)  ((img_buf[(X)]==(A)) && (img_buf[(X)+1]==(B)))
#define Match4(X,A,B,C,D)  (Match2(X,A,B)&&Match2((X)+2,C,D))

#define GET_IMG_BUF(X) \
if (img_buf_size<X) \
  { size_t i= fread(img_buf+img_buf_size,1,(X)-img_buf_size,f); \
    if (i<0) QUIT("Unable to read image %s",fn); \
    else if (i==0) QUIT("Unable to read image header %s",fn); \
    else img_buf_size+= i; \
  }
/*:239*//*240:*/
#line 4983 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static bool get_BMP_info(FILE*f,char*fn,double*a,Dimen*w,Dimen*h)
{double wpx,hpx;
double xppm,yppm;
GET_IMG_BUF(2);
if(!Match2(0,'B','M'))return false;
GET_IMG_BUF(0x2E);
wpx= (double)LittleEndian32(0x12);
hpx= (double)LittleEndian32(0x16);
xppm= (double)LittleEndian32(0x26);
yppm= (double)LittleEndian32(0x2A);
*w= floor(0.5+ONE*(72.00*1000.0/25.4)*wpx/xppm);
*h= floor(0.5+ONE*(72.00*1000.0/25.4)*hpx/yppm);
*a= (wpx/xppm)/(hpx/yppm);
return true;
}
/*:240*//*241:*/
#line 5034 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static bool get_PNG_info(FILE*f,char*fn,double*a,Dimen*w,Dimen*h)
{int pos,size;
double wpx,hpx;
double xppu,yppu;
int unit;
GET_IMG_BUF(24);
if(!Match4(0,0x89,'P','N','G')||
!Match4(4,0x0D,0x0A,0x1A,0x0A))return false;
size= BigEndian32(8);
if(!Match4(12,'I','H','D','R'))return false;
wpx= (double)BigEndian32(16);
hpx= (double)BigEndian32(20);
pos= 20+size;
while(true)
{if(fseek(f,pos,SEEK_SET)!=0)return false;
img_buf_size= 0;
GET_IMG_BUF(17);
size= BigEndian32(0);
if(Match4(4,'p','H','Y','s'))
{xppu= (double)BigEndian32(8);
yppu= (double)BigEndian32(12);
unit= img_buf[16];
if(unit==0)
{*w= floor(0.5+ONE*72.27*wpx/xppu);
*h= floor(0.5+ONE*72.27*hpx/yppu);
*a= (wpx/xppu)/(hpx/yppu);
return true;
}
else if(unit==1)
{
*w= floor(0.5+ONE*(72.27/0.0254)*wpx/xppu);
*h= floor(0.5+ONE*(72.27/0.0254)*hpx/yppu);
*a= (wpx/xppu)/(hpx/yppu);
return true;
}
else
break;
}
else if(Match4(4,'I','D','A','T'))
break;
else
pos= pos+12+size;
}

*w= -floor(0.5+ONE*72.27*wpx/72.0);
*h= -floor(0.5+ONE*72.27*hpx/72.0);
*a= wpx/hpx;
return true;
}
/*:241*//*242:*/
#line 5116 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static bool get_JPG_info(FILE*f,char*fn,double*a,Dimen*w,Dimen*h)
{int pos,size;
double wpx,hpx;
double xppu= 72.0,yppu= 72.0;
int unit;
GET_IMG_BUF(18);

if(!Match2(0,0xFF,0xD8))
return false;
pos= 2;
while(true)
{if(fseek(f,pos,SEEK_SET)!=0)
return false;
img_buf_size= 0;
GET_IMG_BUF(16);
if(img_buf[0]!=0xFF)return false;
if(img_buf[1]==0xE0&&
Match4(4,'J','F','I','F'))
{unit= img_buf[11];
xppu= (double)BigEndian16(12);
yppu= (double)BigEndian16(14);
if(unit==1)
;
else if(unit==2)
{xppu= xppu*2.54;
yppu= yppu*2.54;
}
else
{yppu= 72.0*yppu/xppu;
xppu= 72.0;
}
}
else if(img_buf[1]==0xC0||img_buf[1]==0xC2)
{hpx= (double)BigEndian16(5);
wpx= (double)BigEndian16(7);
*w= floor(0.5+ONE*72.27*wpx/xppu);
*h= floor(0.5+ONE*72.27*hpx/yppu);
*a= (wpx/xppu)/(hpx/yppu);
return true;
}
else if(img_buf[1]==0xD9)
return false;
size= BigEndian16(2);
pos= pos+2+size;
}
return false;
}
/*:242*/
#line 4879 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static Info hput_image_dimens(int n,float32_t a,Dimen w,Dimen h)
{Dimen iw,ih;
double ia;
if(w> 0&&h> 0)
{HPUT32(w);HPUT32(h);return b011;}
else if(a> 0&&w> 0)
{hput_float32((float32_t)a);HPUT32(w);return b010;}
else if(a> 0&&h> 0)
{hput_float32((float32_t)a);HPUT32(h);return b001;}
hextract_image_dimens(n,&ia,&iw,&ih);
/*238:*/
#line 4916 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{if(ia==0.0)
{if(a!=0.0)ia= a;
else if(w!=0&&h!=0)ia= (double)w/(double)h;
else QUIT("Unable to determine aspect ratio of image %s",dir[n].file_name);
}

if(w==0&&h==0)
{if(ih> 0)iw= round(ih*ia);
else if(iw> 0)ih= round(iw/ia);
}
else if(h==0)
{iw= w;ih= round(w/ia);}
else if(w==0)
{ih= h;iw= round(h*ia);}
else
{ih= h;
iw= w;
}
}
/*:238*/
#line 4890 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(iw> 0)
{hput_float32((float32_t)ia);HPUT32(iw);return b010;}
else if(ih> 0)
{hput_float32((float32_t)ia);HPUT32(ih);return b001;}
else
{iw= -iw;ih= -h;
HPUT32(iw);HPUT32(ih);return b011;
}
}
/*:237*//*243:*/
#line 5185 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hextract_image_dimens(int n,double*a,Dimen*w,Dimen*h)
{char*fn;
FILE*f;
*a= 0.0;
*w= *h= 0;
fn= dir[n].file_name;
f= fopen(fn,"rb");
if(f!=NULL)
{img_buf_size= 0;
if(!get_BMP_info(f,fn,a,w,h)&&
!get_PNG_info(f,fn,a,w,h)&&
!get_JPG_info(f,fn,a,w,h))
DBG(DBGDEF,"Unknown image type %s",fn);
fclose(f);
DBG(DBGDEF,"image %d: width= %fpt height= %fpt aspect=%f\n",
n,*w/(double)ONE,*h/(double)ONE,*a);
}
}
/*:243*/
#line 4812 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Info hput_image_spec(uint32_t n,float32_t a,
uint32_t wr,Xdimen*w,uint32_t hr,Xdimen*h)
{HPUT16(n);
if(w!=NULL&&h!=NULL)
{if(w->h==0.0&&w->v==0.0&&h->h==0.0&&h->v==0.0)
return hput_image_dimens(n,a,w->w,h->w);
else
{hput_image_aspect(n,a);
hput_xdimen_node(w);hput_xdimen_node(h);
return b111;
}
}
else if(w!=NULL&&h==NULL)
{if(w->h==0.0&&w->v==0.0&&hr==zero_xdimen_no)
return hput_image_dimens(n,a,w->w,0);
else
{hput_image_aspect(n,a);
HPUT8(hr);hput_xdimen_node(w);
return b110;
}
}
else if(w==NULL&&h!=NULL)
{if(wr==zero_xdimen_no&&h->h==0.0&&h->v==0.0)
return hput_image_dimens(n,a,0,h->w);
else
{hput_image_aspect(n,a);
HPUT8(wr);hput_xdimen_node(h);
return b101;
}
}
else
{if(wr==zero_xdimen_no&&hr==zero_xdimen_no)
return hput_image_dimens(n,a,0,0);
else
{hput_image_aspect(n,a);
HPUT8(wr);HPUT8(hr);
return b100;
}
}
}
/*:235*//*257:*/
#line 5499 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hset_label(int n,int w)
{Label*t;
REF_RNG(label_kind,n);
t= labels+n;
if(t->where!=LABEL_UNDEF)
MESSAGE("Duplicate definition of label %d\n",n);
t->where= w;
t->pos= hpos-hstart;
t->pos0= hpos0-hstart;
t->next= first_label;first_label= n;
}
/*:257*//*262:*/
#line 5642 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_label(int n,Label*l)
{Info i= b000;
HPUTX(13);
if(n> 0xFF){i|= b001;HPUT16(n);}else HPUT8(n);
HPUT32(l->pos);
HPUT8(l->where);
if(l->pos!=l->pos0)
{i|= b010;HPUT32(l->pos0);HPUT8(l->f);}
DBG(DBGLABEL,"Defining label %d at 0x%x/0x%x\n",n,l->pos0,l->pos);
return TAG(label_kind,i);
}
/*:262*//*263:*/
#line 5667 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

extern void hput_definitions_end(void);
extern Tag hput_outline(Outline*t);
void hput_label_defs(void)
{int n;
section_no= 1;
hstart= dir[1].buffer;
hend= hstart+dir[1].bsize;
hpos= hstart+dir[1].size;
/*264:*/
#line 5682 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

for(n= 0;n<=max_ref[label_kind];n++)
{Label*l= labels+n;
uint32_t pos;
if(l->used)
{pos= hpos++-hstart;
hput_tags(pos,hput_label(n,l));
if(l->where==LABEL_UNDEF)
MESSAGE("WARNING: Label *%d is used but not defined\n",n);
else
DBG(DBGDEF|DBGLABEL,"Label *%d defined 0x%x\n",n,pos);
}
else
{if(l->where!=LABEL_UNDEF)
{pos= hpos++-hstart;
hput_tags(pos,hput_label(n,l));
DBG(DBGDEF|DBGLABEL,"Label *%d defined but not used 0x%x\n",n,pos);
}
}
}
/*:264*/
#line 5676 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*284:*/
#line 5969 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*275:*/
#line 5843 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

n= 0;
while(n<=max_outline)
n= hcompress_depth(n,0);
/*:275*/
#line 5970 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

for(n= 0;n<=max_outline;n++)
{Outline*t= outlines+n;
uint32_t pos;
pos= hpos++-hstart;
if(t->s==0||t->t==NULL)
QUIT("Definition of outline %d has an empty title",n);
DBG(DBGDEF|DBGLABEL,"Outline *%d defined\n",n);
hput_tags(pos,hput_outline(t));
}
/*:284*/
#line 5677 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hput_definitions_end();
}
/*:263*//*267:*/
#line 5759 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_link(int n,int c,int on)
{Info i;
REF_RNG(label_kind,n);
labels[n].used= true;
if(on)i= b010;else i= b000;
if(n> 0xFF){i|= b001;HPUT16(n);}else HPUT8(n);
if((on&&c!=1)||(!on&&c!=0xFF)){i|= b100;HPUT8(c);}
return TAG(link_kind,i);
}
/*:267*//*276:*/
#line 5855 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

int hcompress_depth(int n,int c)
{int d= outlines[n].d;
if(c> 0xFF)
QUIT("Outline %d, depth level %d to %d out of range",n,d,c);
while(n<=max_outline)
if(outlines[n].d==d)
outlines[n++].d= c;
else if(outlines[n].d> d)
n= hcompress_depth(n,c+1);
else break;
return n;
}
/*:276*//*281:*/
#line 5925 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hset_outline(int m,int r,int d,uint32_t pos)
{Outline*t;
RNG("Outline",m,0,max_outline);
t= outlines+m;
REF_RNG(label_kind,r);
t->r= r;
t->d= d;
t->s= hpos-(hstart+pos);
hpos= (hstart+pos);
ALLOCATE(t->t,t->s,uint8_t);
memmove(t->t,hpos,t->s);
labels[r].used= true;
}
/*:281*//*283:*/
#line 5957 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_outline(Outline*t)
{Info i= b100;
HPUTX(t->s+4);
if(t->r> 0xFF){i|= b001;HPUT16(t->r);}else HPUT8(t->r);
labels[t->r].used= true;
HPUT8(t->d);
/*282:*/
#line 5945 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

memmove(hpos,t->t,t->s);
hpos= hpos+t->s;
free(t->t);
/*:282*/
#line 5964 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

return TAG(outline_kind,i);
}
/*:283*//*294:*/
#line 6260 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void color_init(void)
{int i;
for(i= 0;i<sizeof(ColorSet)/4;i++)colors_n[i]= colors_0[i];
colors_i= 0;
}

static Tag hput_color_set(int n)
{static bool first_color= true;
int i;
if(n==0)
{if(first_color)
for(i= 0;i<sizeof(ColorSet)/4;i++)colors_0[i]= colors_n[i];
else
QUIT("Redefinition of color set 0 must be the first color definition");
}
first_color= false;
HPUTX(sizeof(ColorSet)+1);
for(i= 0;i<sizeof(ColorSet)/4;i++)HPUT32(colors_n[i]);
return TAG(color_kind,b000);
}
/*:294*//*295:*/
#line 6287 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static bool colors_equal(ColorSet a,ColorSet b)
{int i;
for(i= 0;i<sizeof(ColorSet)/4;i++)
if(a[i]!=b[i])return false;
return true;
}

void hput_color_def(uint32_t pos,int n)
{if((n==0&&colors_equal(color_defaults[0],colors_n))||
(n==1&&colors_equal(color_defaults[1],colors_n)))
{hpos= hstart+pos;
return;
}
hput_tags(pos,hput_color_set(n));
}
/*:295*//*305:*/
#line 6467 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

uint32_t hput_unknown_def(uint32_t t,uint32_t b,uint32_t n)
{if(n==0)
{RNG("unknown tag",t,TAG(param_kind,7)+1,TAG(int_kind,0)-1);
RNG("unknown initial bytes",b,0,0x7F-2);
HPUT8(t);
HPUT8(b+2);
if(hnode_size[t]==0)
{hnode_size[t]= NODE_SIZE(b,0);
DBG(DBGTAGS,"Defining unknown node size %d,%d for tag 0x%x\n",b,n,t);
}
}
else
{int i;
RNG("unknown tag",t,TAG(param_kind,7)+1,TAG(int_kind,0)-1);
RNG("unknown initial bytes",b,0,0x1F-1);
RNG("unknown trailing nodes",n,1,4);
HPUT8(t);
i= NODE_SIZE(b,n);
HPUT8(i);
if(hnode_size[t]==0)
{hnode_size[t]= i;
DBG(DBGTAGS,"Defining unknown node size %d,%d for tag 0x%x\n",b,n,t);
}
}
return TAG(unknown_kind,b100);
}
/*:305*//*306:*/
#line 6497 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_unknown(uint32_t pos,uint32_t t,uint32_t b,uint32_t n)
{int s;
RNG("unknown tag",t,TAG(param_kind,7)+1,TAG(int_kind,0)-1);
if(n==0)
{RNG("unknown initial bytes",b,0,0x7F-2);
s= NODE_SIZE(b,0);
}
else
{RNG("unknown initial bytes",b,0,0x1F-2);
RNG("unknown trailing nodes",n,1,4);
s= NODE_SIZE(b,n);
}
DBG(DBGTAGS,"Adding unknown node size %d,%d tag 0x%x at 0x%x\n",b,n,t,pos);
if(hnode_size[t]!=s)
QUIT("Size %d of unknown node [%s,%d] at "SIZE_F" does not match %d\n",s,NAME(t),INFO(t),hpos-hstart,hnode_size[t]);
return(Tag)t;
}
/*:306*//*333:*/
#line 7290 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_range(uint8_t pg,bool on)
{if(((next_range-1)/2)> max_ref[range_kind])
QUIT("Page range %d > %d",(next_range-1)/2,max_ref[range_kind]);
if(on&&page_on[pg]!=0)
QUIT("Template %d is switched on at 0x%x and "SIZE_F,
pg,range_pos[page_on[pg]].pos,hpos-hstart);
else if(!on&&page_on[pg]==0)
QUIT("Template %d is switched off at "SIZE_F" but was not on",
pg,hpos-hstart);
DBG(DBGRANGE,"Range *%d %s at "SIZE_F"\n",pg,on?"on":"off",hpos-hstart);
range_pos[next_range].pg= pg;
range_pos[next_range].pos= hpos-hstart;
range_pos[next_range].on= on;
if(on)page_on[pg]= next_range;
else{range_pos[next_range].link= page_on[pg];
range_pos[page_on[pg]].link= next_range;
page_on[pg]= 0;}
next_range++;
}

void hput_range_defs(void)
{int i;
section_no= 1;
hstart= dir[1].buffer;
hend= hstart+dir[1].bsize;
hpos= hstart+dir[1].size;
for(i= 1;i<next_range;i++)
if(range_pos[i].on)
{Info info= b000;
uint32_t p= hpos++-hstart;
uint32_t from,to;
HPUT8(range_pos[i].pg);
from= range_pos[i].pos;
if(range_pos[i].link!=0)to= range_pos[range_pos[i].link].pos;
else to= HINT_NO_POS;
if(from!=0)
{info= info|b100;if(from> 0xFFFF)info= info|b001;}
if(to!=HINT_NO_POS)
{info= info|b010;if(to> 0xFFFF)info= info|b001;}
if(info&b100)
{if(info&b001)HPUT32(from);else HPUT16(from);}
if(info&b010)
{if(info&b001)HPUT32(to);else HPUT16(to);}
DBG(DBGRANGE,"Range *%d from 0x%x to 0x%x\n",range_pos[i].pg,from,to);
hput_tags(p,TAG(range_kind,info));
}
hput_definitions_end();
}
/*:333*//*341:*/
#line 7495 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static size_t hput_root(void);
static size_t hput_section(uint16_t n);
static size_t hput_optional_section(int i);

size_t hput_hint(char*str)
{size_t s;
int i;
DBG(DBGBASIC,"Writing hint output %s\n",str);
s= hput_banner("hint",str);
DBG(DBGDIR,"Root entry at "SIZE_F"\n",s);
s+= hput_root();
DBG(DBGDIR,"Directory section at "SIZE_F"\n",s);
s+= hput_section(0);
DBG(DBGDIR,"Definition section at "SIZE_F"\n",s);
s+= hput_section(1);
DBG(DBGDIR,"Content section at "SIZE_F"\n",s);
s+= hput_section(2);
DBG(DBGDIR,"Auxiliary sections at "SIZE_F"\n",s);
for(i= 3;i<=max_section_no;i++)
s+= hput_optional_section(i);
DBG(DBGDIR,"Total number of bytes written "SIZE_F"\n",s);
return s;
}
/*:341*//*344:*/
#line 7550 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_error(void)
{if(hpos<hend)return;
QUIT("HPUT overrun section %d pos="SIZE_F"\n",section_no,hpos-hstart);
}
/*:344*//*351:*/
#line 7761 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hcompress(uint16_t n)
{z_stream z;
uint8_t*buffer;
int i;
if(dir[n].size==0){dir[n].xsize= 0;return;}
DBG(DBGCOMPRESS,"Compressing section %d of size 0x%x\n",n,dir[n].size);
z.zalloc= (alloc_func)0;
z.zfree= (free_func)0;
z.opaque= (voidpf)0;
if(deflateInit(&z,Z_DEFAULT_COMPRESSION)!=Z_OK)
QUIT("Unable to initialize compression: %s",z.msg);
ALLOCATE(buffer,dir[n].size+MAX_TAG_DISTANCE,uint8_t);
z.next_out= buffer;
z.avail_out= dir[n].size+MAX_TAG_DISTANCE;
z.next_in= dir[n].buffer;
z.avail_in= dir[n].size;
i= deflate(&z,Z_FINISH);
DBG(DBGCOMPRESS,"deflate in: avail/total=0x%x/0x%lx out: avail/total=0x%x/0x%lx, return %d;\n",
z.avail_in,z.total_in,z.avail_out,z.total_out,i);
if(z.avail_in!=0)
QUIT("Compression missed input data");
if(i!=Z_STREAM_END)
QUIT("Compression incomplete: %s",z.msg);
if(deflateEnd(&z)!=Z_OK)
QUIT("Unable to finalize compression: %s",z.msg);
DBG(DBGCOMPRESS,"Compressed 0x%lx byte to 0x%lx byte\n",z.total_in,z.total_out);
free(dir[n].buffer);
dir[n].buffer= buffer;
dir[n].bsize= dir[n].size+MAX_TAG_DISTANCE;
dir[n].xsize= dir[n].size;
dir[n].size= z.total_out;
}
/*:351*//*353:*/
#line 7833 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define BUFFER_SIZE 0x400
void new_output_buffers(void)
{dir[0].bsize= dir[1].bsize= dir[2].bsize= BUFFER_SIZE;
DBG(DBGBUFFER,"Allocating output buffer size=0x%x, margin=0x%x\n",BUFFER_SIZE,MAX_TAG_DISTANCE);
ALLOCATE(dir[0].buffer,dir[0].bsize+MAX_TAG_DISTANCE,uint8_t);
ALLOCATE(dir[1].buffer,dir[1].bsize+MAX_TAG_DISTANCE,uint8_t);
ALLOCATE(dir[2].buffer,dir[2].bsize+MAX_TAG_DISTANCE,uint8_t);
}

void hput_increase_buffer(uint32_t n)
{size_t bsize;
uint32_t pos,pos0;
const double buffer_factor= 1.4142136;
pos= hpos-hstart;pos0= hpos0-hstart;
bsize= dir[section_no].bsize*buffer_factor+0.5;
if(bsize<pos+n)bsize= pos+n;
if(bsize>=HINT_NO_POS)bsize= HINT_NO_POS;
if(bsize<pos+n)QUIT("Unable to increase buffer size "SIZE_F" by 0x%x byte",hpos-hstart,n);
DBG(DBGBUFFER,"Reallocating output buffer "" for section %d from 0x%x to "SIZE_F" byte\n",
section_no,dir[section_no].bsize,bsize);
REALLOCATE(dir[section_no].buffer,bsize,uint8_t);
dir[section_no].bsize= (uint32_t)bsize;
hstart= dir[section_no].buffer;
hend= hstart+bsize;
hpos0= hstart+pos0;hpos= hstart+pos;
}

static size_t hput_data(uint16_t n,uint8_t*buffer,uint32_t size)
{size_t s;
s= fwrite(buffer,1,size,hout);
if(s!=size)
QUIT("short write "SIZE_F" < %d in section %d",s,size,n);
return s;
}

static size_t hput_section(uint16_t n)
{return hput_data(n,dir[n].buffer,dir[n].size);
}
/*:353*//*371:*/
#line 8262 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static void hput_entry(Entry*e)
{Info b;
if(e->size<0x100&&e->xsize<0x100)b= b000;
else if(e->size<0x10000&&e->xsize<0x10000)b= b001;
else if(e->size<0x1000000&&e->xsize<0x1000000)b= b010;
else b= b011;
if(e->xsize!=0)b= b|b100;
DBG(DBGTAGS,"Directory entry no=%d size=0x%x xsize=0x%x\n",e->section_no,e->size,e->xsize);
HPUTTAG(0,b);
HPUT16(e->section_no);
switch(b){
case b000:HPUT8(e->size);break;
case b001:HPUT16(e->size);break;
case b010:HPUT24(e->size);break;
case b011:HPUT32(e->size);break;
case b100:HPUT8(e->size);HPUT8(e->xsize);break;
case b101:HPUT16(e->size);HPUT16(e->xsize);break;
case b110:HPUT24(e->size);HPUT24(e->xsize);break;
case b111:HPUT32(e->size);HPUT32(e->xsize);break;
default:QUIT("Can't happen");break;
}
hput_string(e->file_name);
DBGTAG(TAG(0,b),hpos);HPUT8(TAG(0,b));
}

static void hput_directory_start(void)
{DBG(DBGDIR,"Directory Section\n");
section_no= 0;
hpos= hstart= dir[0].buffer;
hend= hstart+dir[0].bsize;
}
static void hput_directory_end(void)
{dir[0].size= hpos-hstart;
DBG(DBGDIR,"End Directory Section size=0x%x\n",dir[0].size);
}

static size_t hput_root(void)
{uint8_t buffer[MAX_TAG_DISTANCE];
size_t s;
hpos= hstart= buffer;
hend= hstart+MAX_TAG_DISTANCE;
dir[0].section_no= max_section_no;
hput_entry(&dir[0]);
s= hput_data(0,hstart,hpos-hstart);
DBG(DBGDIR,"Writing root size="SIZE_F"\n",s);
return s;
}

extern int option_compress;
static char**aux_names;
void hput_directory(void)
{int i;
/*372:*/
#line 8349 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{int i;
ALLOCATE(aux_names,max_section_no+1,char*);
for(i= 3;i<=max_section_no;i++)
if(dir[i].size==0)
{struct stat s;
if(!option_global)
{char*aux_name= NULL;
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
#line 8357 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(stat(aux_name,&s)==0)
aux_names[i]= aux_name;
else
{if(option_aux)QUIT("Unable to find file '%s'",aux_name);
free(aux_name);aux_name= NULL;
}
}
if((aux_names[i]==NULL&&!option_aux)||option_global)
{if(stat(dir[i].file_name,&s)!=0)
QUIT("Unable to find file '%s'",dir[i].file_name);
}
dir[i].size= s.st_size;
dir[i].xsize= 0;
DBG(DBGDIR,"section %i: found file %s size %u\n",i,aux_names[i]?aux_names[i]:dir[i].file_name,dir[i].size);
}
}
/*:372*/
#line 8315 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


if(option_compress){hcompress(1);hcompress(2);}
hput_directory_start();
for(i= 1;i<=max_section_no;i++)
{dir[i].pos= dir[i-1].pos+dir[i-1].size;
DBG(DBGDIR,"writing entry %u at 0x%"PRIx64"\n",i,dir[i].pos);
hput_entry(&dir[i]);
}
hput_directory_end();
if(option_compress)hcompress(0);
}

/*:371*//*374:*/
#line 8397 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

static size_t hput_optional_section(int i)
{size_t fsize;
if(dir[i].xsize!=0)
DBG(DBGDIR,"Compressing of auxiliary files currently not supported");
if(dir[i].buffer==NULL)
/*375:*/
#line 8416 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{FILE*f;
char*file_name= dir[i].file_name;
DBG(DBGDIR,"Adding file %d: %s\n",dir[i].section_no,file_name);
f= fopen(file_name,"rb");
if(f==NULL)QUIT("Unable to read section %d, file %s",
dir[i].section_no,file_name);
fsize= 0;
while(!feof(f))
{size_t s,t;
char buffer[1<<13];
s= fread(buffer,1,1<<13,f);
t= fwrite(buffer,1,s,hout);
if(s!=t)QUIT("Unable to write file %s",file_name);
fsize= fsize+t;
}
fclose(f);
}
/*:375*/
#line 8403 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

else
/*376:*/
#line 8439 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{fsize= fwrite(dir[i].buffer,1,dir[i].size,hout);
}
/*:376*/
#line 8405 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(fsize!=dir[i].size)
QUIT("Size written "SIZE_F" does not match section %d size %u",
fsize,i,dir[i].size);
return fsize;
}
/*:374*//*382:*/
#line 8522 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_definitions_start(void)
{DBG(DBGDEF,"Definition Section\n");
section_no= 1;
hpos= hstart= dir[1].buffer;
hend= hstart+dir[1].bsize;
}
void hput_definitions_end(void)
{dir[1].size= hpos-hstart;
DBG(DBGDEF,"End Definition Section size=0x%x\n",dir[1].size);
}
/*:382*//*391:*/
#line 8694 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_max_definitions(void)
{Kind k;
DBG(DBGDEF,"Writing Max Definitions\n");
HPUTTAG(list_kind,0);
for(k= 0;k<32;k++)
if(max_ref[k]> max_default[k])
{uint32_t pos= hpos++-hstart;
DBG(DBGDEF,"max(%s) = %d\n",definition_name[k],max_ref[k]);
hput_tags(pos,TAG(k,hput_n(max_ref[k])-1));
}
/*247:*/
#line 5371 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(max_outline> -1)
{uint32_t pos= hpos++-hstart;
DBG(DBGDEF|DBGLABEL,"max(outline) = %d\n",max_outline);
hput_tags(pos,TAG(outline_kind,b100|(hput_n(max_outline)-1)));
}
/*:247*/
#line 8705 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

HPUTTAG(list_kind,0);
DBG(DBGDEF,"Writing Max Definitions End\n");
}
/*:391*//*413:*/
#line 9220 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

Tag hput_font_head(uint8_t f,char*n,Dimen s,int m,uint16_t y)
{Info i;

DBG(DBGDEF,"Defining font %d (%s) size 0x%x\n",f,n,s);
hput_string(n);
HPUT32(s);
if(m>=0){i= b000;HPUT16(m);}else i= b001;
HPUT16(y);
return TAG(font_kind,i);
}
/*:413*//*447:*/
#line 9793 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

void hput_content_start(void)
{DBG(DBGDIR,"Content Section\n");
section_no= 2;
hpos0= hpos= hstart= dir[2].buffer;
hend= hstart+dir[2].bsize;

}
void hput_content_end(void)
{
dir[2].size= hpos-hstart;
DBG(DBGDIR,"End Content Section, size=0x%x\n",dir[2].size);
}
/*:447*/
#line 11759 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


#define SHRINK
#define DESCRIPTION "\nConvert a `long' ASCII HINT file into a `short' binary HINT file.\n"

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
#line 11765 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

in_ext= ".hint";
out_ext= ".hnt";
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
#line 11768 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


if(debugflags&DBGFLEX)yyset_debug(1);else yyset_debug(0);
#if YYDEBUG
if(debugflags&DBGBISON)yydebug= 1;
else yydebug= 0;
#endif
#line 11775 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"
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
#line 11775 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*455:*/
#line 10044 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hin= fopen(hin_name,"rb");
if(hin==NULL)QUIT("Unable to open input file %s",hin_name);
/*:455*/
#line 11776 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*456:*/
#line 10049 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(file_name!=NULL)
{int ext_length= (int)strlen(out_ext);
if(file_name_length<=ext_length
||strncmp(file_name+file_name_length-ext_length,out_ext,ext_length)!=0)
{strcat(file_name,out_ext);file_name_length+= ext_length;}
}
else
{file_name_length= stem_length+(int)strlen(out_ext);
ALLOCATE(file_name,file_name_length+1,char);
strcpy(file_name,stem_name);
strcpy(file_name+stem_length,out_ext);
}
{char*aux_name= file_name;
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
#line 10063 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

aux_name= NULL;
}
hout= fopen(file_name,"wb");
if(hout==NULL)QUIT("Unable to open output file %s",file_name);
/*:456*/
#line 11777 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"


yyin= hin;
yyout= hlog;
/*338:*/
#line 7443 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{hbanner_size= 0;
while(hbanner_size<MAX_BANNER)
{int c= fgetc(hin);
if(c==EOF)break;
hbanner[hbanner_size++]= c;
if(c=='\n')break;
}
hbanner[hbanner_size]= 0;
}
/*:338*/
#line 11781 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(!hcheck_banner("HINT"))QUIT("Invalid banner");
yylineno++;
DBG(DBGBISON|DBGFLEX,"Parsing Input\n");
yyparse();

hput_directory();
/*373:*/
#line 8376 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

{int i;
for(i= 3;i<=max_section_no;i++)
if(aux_names[i]!=NULL)
{free(dir[i].file_name);
dir[i].file_name= aux_names[i];
aux_names[i]= NULL;
}
}
/*:373*/
#line 11788 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

hput_hint("created by shrink");

/*459:*/
#line 10084 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(file_name!=NULL)free(file_name);
if(hout!=NULL)fclose(hout);
/*:459*/
#line 11791 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*458:*/
#line 10080 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(hin_name!=NULL)free(hin_name);
if(hin!=NULL)fclose(hin);
/*:458*/
#line 11792 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*460:*/
#line 10088 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

if(hlog!=NULL)fclose(hlog);
if(stem_name!=NULL)free(stem_name);
/*:460*/
#line 11793 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

return 0;
}
/*:557*/
