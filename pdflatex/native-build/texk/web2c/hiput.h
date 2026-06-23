/*553:*/
#line 11538 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

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
#line 11539 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

/*13:*/
#line 649 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define KIND(T)      (((T)>>3)&0x1F)
#define NAME(T)      content_name[KIND(T)]
#define INFO(T)      ((T)&0x7)
#define TAG(K,I)     (((K)<<3)|(I))
/*:13*//*78:*/
#line 1653 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define ROUND(X)     ((int)((X)>=0.0?floor((X)+0.5):ceil((X)-0.5)))
/*:78*//*113:*/
#line 2155 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define RUNNING_DIMEN 0xC0000000
/*:113*//*132:*/
#line 2497 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define ZERO_GLUE(G) ((G).w.w==0  && (G).w.h==0.0  && (G).w.v==0.0  && (G).p.f==0.0 && (G).m.f==0.0)
/*:132*//*244:*/
#line 5228 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define HINT_NO_POS 0xFFFFFFFF
/*:244*//*251:*/
#line 5427 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define LABEL_UNDEF 0
#define LABEL_TOP 1
#define LABEL_BOT 2
#define LABEL_MID 3
/*:251*//*286:*/
#line 6124 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define CURCOLOR(M,S,C) ((C)+6*(M)+2*(S))
#define DAY(C)   CURCOLOR(0,0,C)
#define NIGHT(C) CURCOLOR(1,0,C)
#define HIGH(C)  CURCOLOR(0,1,C)
#define FOCUS(C) CURCOLOR(0,2,C)
#define FG(C)    ((C)[0])
#define BG(C)    ((C)[1])
/*:286*//*326:*/
#line 7204 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define ALLOCATE(R,S,T) ((R)= (T *)calloc((S),sizeof(T)),\
        (((R)==NULL)?QUIT("Out of memory for " #R):(void)0))
#define REALLOCATE(R,S,T) ((R)= (T *)realloc((R),(S)*sizeof(T)),\
        (((R)==NULL)?QUIT("Out of memory for " #R):(void)0))
/*:326*//*334:*/
#line 7369 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define MAX_BANNER 256
/*:334*//*347:*/
#line 7585 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define MAX_TAG_DISTANCE 32
/*:347*//*465:*/
#line 10187 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

#define NODE_SIZE(H,T) ((T)==0?(H)+2:-4*((H)+1)+((T)-1))
#define NODE_HEAD(N)   ((N)> 0?(N)-2:-((N)>>2)-1)
#define NODE_TAIL(N)   ((N)<0?((N)&0x3)+1:0)
/*:465*/
#line 11540 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

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
#line 11541 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

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
#line 11542 "../../../texlive-source/texk/web2c/hitexdir/hiformat.w"

extern Entry*dir;
extern uint16_t section_no,max_section_no;
extern uint8_t*hpos,*hstart,*hend,*hpos0;
extern int next_range;
extern RangePos*range_pos;
extern int next_range,max_range;
extern int*page_on;
extern Label*labels;
extern int first_label;
extern int max_outline;
extern Outline*outlines;


extern FILE*hout;
extern void new_directory(uint32_t entries);
extern void new_output_buffers(void);


extern void hput_definitions_start(void);
extern void hput_definitions_end(void);
extern void hput_content_start(void);
extern void hput_content_end(void);

extern void hset_label(int n,int w);
extern Tag hput_link(int n,int c,int on);
extern void hset_outline(int m,int r,int d,uint32_t p);
extern void hput_label_defs(void);

extern void hput_tags(uint32_t pos,Tag tag);
extern Tag hput_glyph(Glyph*g);
extern Tag hput_xdimen(Xdimen*x);
extern Tag hput_int(int32_t p);
extern Tag hput_language(uint8_t n);
extern Tag hput_rule(Rule*r);
extern Tag hput_glue(Glue*g);
extern Tag hput_list(uint32_t size_pos,List*y);
extern uint8_t hsize_bytes(uint32_t n);
extern void hput_txt_cc(uint32_t c);
extern void hput_txt_font(uint8_t f);
extern void hput_txt_global(Ref*d);
extern void hput_txt_local(uint8_t n);
extern Info hput_box_dimen(Dimen h,Dimen d,Dimen w);
extern Info hput_box_shift(Dimen a);
extern Info hput_box_glue_set(int8_t s,float32_t r,Order o);
extern void hput_stretch(Stretch*s);
extern Tag hput_kern(Kern*k);
extern void hput_utf8(uint32_t c);
extern Tag hput_ligature(Lig*l);
extern Tag hput_disc(Disc*h);
extern Info hput_span_count(uint32_t n);
extern void hextract_image_dimens(int n,double*a,Dimen*w,Dimen*h);
extern Info hput_image_spec(uint32_t n,float32_t a,uint32_t wr,Xdimen*w,uint32_t hr,Xdimen*h);
extern int colors_i;
extern ColorSet colors_0,colors_n;
extern void color_init(void);
extern void hput_color_def(uint32_t pos,int n);
extern void hput_string(char*str);
extern void hput_range(uint8_t pg,bool on);
extern void hput_max_definitions(void);
extern Tag hput_dimen(Dimen d);
extern Tag hput_font_head(uint8_t f,char*n,Dimen s,int m,uint16_t y);
extern void hput_range_defs(void);
extern void hput_xdimen_node(Xdimen*x);
extern void hput_directory(void);
extern size_t hput_hint(char*str);
extern void hput_list_size(uint32_t n,int i);
extern uint32_t hput_unknown_def(uint32_t t,uint32_t b,uint32_t n);
extern Tag hput_unknown(uint32_t pos,uint32_t t,uint32_t b,uint32_t n);
extern int hcompress_depth(int n,int c);
/*:553*/
