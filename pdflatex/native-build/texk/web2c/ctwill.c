/*1:*/
#line 71 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*5:*/
#line 53 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

#include <ctype.h>  
#include <stdbool.h>  
#include <stddef.h>  
#include <stdint.h>  
#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  

#ifndef HAVE_GETTEXT
#define HAVE_GETTEXT 0
#endif
#line 65 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

#if HAVE_GETTEXT
#include <libintl.h> 
#else
#line 69 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"
#define gettext(a) a
#endif
#line 71 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

/*:5*//*19:*/
#line 116 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#include <limits.h> 

/*:19*//*309:*/
#line 2017 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

#include <kpathsea/tex-file.h>  

/*:309*/
#line 72 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#define banner "This is CTWILL, Version 4.12.2"
#define _(s) gettext(s)
#define and_and 04
#define lt_lt 020
#define gt_gt 021
#define plus_plus 013
#define minus_minus 01
#define minus_gt 031
#define non_eq 032
#define lt_eq 034
#define gt_eq 035
#define eq_eq 036
#define or_or 037
#define dot_dot_dot 016
#define colon_colon 06
#define period_ast 026
#define minus_gt_ast 027
#define compress(c) if(loc++<=limit)return c
#define xisalpha(c) (isalpha((int)(c))&&!ishigh(c))
#define xisdigit(c) (isdigit((int)(c))&&!ishigh(c))
#define xisspace(c) (isspace((int)(c))&&!ishigh(c))
#define xislower(c) (islower((int)(c))&&!ishigh(c))
#define xisupper(c) (isupper((int)(c))&&!ishigh(c))
#define xisxdigit(c) (isxdigit((int)(c))&&!ishigh(c))
#define isxalpha(c) ((c)=='_'||(c)=='$')
#define ishigh(c) ((eight_bits)(c)> 0177)
#define max_include_depth 10
#define max_file_name_length 1024
#define cur_file file[include_depth]
#define cur_file_name file_name[include_depth]
#define cur_line line[include_depth]
#define web_file file[0]
#define web_file_name file_name[0]
#define length(c) (size_t)((c+1)->byte_start-(c)->byte_start)
#define print_id(c) term_write((c)->byte_start,length(c))
#define llink link
#define rlink dummy.Rlink
#define root name_dir->rlink
#define ilk dummy.Ilk
#define spotless 0
#define harmless_message 1
#define error_message 2
#define fatal_message 3
#define mark_harmless() if(history==spotless)history= harmless_message
#define mark_error() history= error_message
#define confusion(s) fatal(_("! This can't happen: "),s)
#define show_banner flags['b']
#define show_progress flags['p']
#define show_happiness flags['h']
#define show_stats flags['s']
#define make_xrefs flags['x']
#define check_for_change flags['c']
#define update_terminal() fflush(stdout)
#define new_line() putchar('\n')
#define term_write(a,b) fflush(stdout),fwrite(a,sizeof(char),b,stdout)
#define buf_size 1000
#define longest_name 10000
#define long_buf_size (buf_size+longest_name)
#define max_bytes 1000000
#define max_names 10239
#define max_sections 4000
#define normal 0
#define roman 1
#define wildcard 2
#define typewriter 3
#define abnormal(a) ((a)->ilk> typewriter)
#define func_template 4
#define custom 5
#define alfop 22
#define else_like 26
#define public_like 40
#define operator_like 41
#define new_like 42
#define catch_like 43
#define for_like 45
#define do_like 46
#define if_like 47
#define delete_like 48
#define raw_ubin 49
#define const_like 50
#define raw_int 51
#define int_like 52
#define case_like 53
#define sizeof_like 54
#define struct_like 55
#define typedef_like 56
#define define_like 57
#define template_like 58
#define alignas_like 59
#define using_like 60
#define default_like 61
#define attr 62
#define max_refs 65535
#define file_flag (3*cite_flag)
#define def_flag (2*cite_flag)
#define cite_flag 10240
#define xref equiv_or_xref
#define append_xref(c) if(xref_ptr==xmem_end)overflow(_("cross-reference")); \
else(++xref_ptr)->num= c
#define no_xref !make_xrefs
#define is_tiny(p) length(p)==1
#define unindexed(a) ((a)<res_wd_end&&(a)->ilk>=custom)
#define max_toks 65535
#define max_texts 10239
#define update_node(p) (p)->xref= (void*)xref_ptr
#define get_meaning(p) (p)-name_dir+cur_meaning
#define ignore 00
#define verbatim 02
#define begin_short_comment 03
#define begin_comment '\t'
#define underline '\n'
#define noop 0177
#define xref_roman 0203
#define xref_wildcard 0204
#define xref_typewriter 0205
#define TeX_string 0206
#define meaning 0207
#define suppress 0210
#define temp_meaning 0211
#define right_start 0212
#define ord 0213
#define join 0214
#define thin_space 0215
#define math_break 0216
#define line_break 0217
#define big_line_break 0220
#define no_line_break 0221
#define pseudo_semi 0222
#define macro_arg_open 0224
#define macro_arg_close 0225
#define trace 0226
#define translit_code 0227
#define output_defs_code 0230
#define format_code 0231
#define definition 0232
#define begin_C 0233
#define section_name 0234
#define new_section 0235
#define constant 0200
#define string 0201
#define identifier 0202
#define left_preproc ord
#define right_preproc 0223
#define gather_digits_while(t) while((t)||*loc=='\'') \
if(*loc=='\''){ \
*id_loc++= ' ';loc++; \
 \
}else*id_loc++= *loc++
#define line_length 80
#define c_line_write(c) fflush(active_file),fwrite(out_buf+1,sizeof(char),c,active_file)
#define tex_printf(c) fprintf(active_file,"%s",c)
#define tex_putc(c) fputc(c,active_file)
#define tex_puts(c) fputs(c,active_file)
#define proofing flags['P']
#define out(c)  \
{if(ms_mode){ \
if(ministring_ptr<ministring_buf_end) \
*ministring_ptr++= c; \
}else{ \
if(out_ptr>=out_buf_end)break_out(); \
*(++out_ptr)= c; \
} \
}
#define app_tok(c) {if(tok_ptr+2> tok_mem_end)overflow(_("token"));*(tok_ptr++)= c;}
#define exp 1
#define unop 2
#define binop 3
#define ubinop 4
#define cast 5
#define question 6
#define lbrace 7
#define rbrace 8
#define decl_head 9
#define comma 10
#define lpar 11
#define rpar 12
#define prelangle 13
#define prerangle 14
#define langle 15
#define colcol 18
#define base 19
#define decl 20
#define struct_head 21
#define stmt 23
#define function 24
#define fn_decl 25
#define semi 27
#define colon 28
#define tag 29
#define if_head 30
#define else_head 31
#define if_clause 32
#define lproc 35
#define rproc 36
#define insert 37
#define section_scrap 38
#define dead 39
#define ftemplate 63
#define new_exp 64
#define begin_arg 65
#define end_arg 66
#define lbrack 67
#define rbrack 68
#define attr_head 69
#define title 70
#define print_cat(c) fputs(cat_name[c],stdout)
#define math_rel 0206
#define big_cancel 0210
#define cancel 0211
#define indent 0212
#define outdent 0213
#define opt 0214
#define backup 0215
#define break_space 0216
#define force 0217
#define big_force 0220
#define preproc_line 0221
#define quoted_char 0222
#define end_translation 0223
#define inserted 0224
#define qualifier 0225
#define dindent 0226
#define trans trans_plus.Trans
#define max_scraps 5000
#define id_flag 10240
#define res_flag (2*id_flag)
#define section_flag (3*id_flag)
#define tok_flag (4*id_flag)
#define inner_tok_flag (5*id_flag)
#define app(a) *(tok_ptr++)= (token)(a)
#define big_app2(a) big_app1(a);big_app1(a+1)
#define big_app3(a) big_app2(a);big_app1(a+2)
#define big_app4(a) big_app3(a);big_app1(a+3)
#define big_app1_insert(p,c) big_app1(p);big_app(c);big_app1(p+1)
#define big_app1_insert_str(p,s) big_app1(p);app_str(s);big_app1(p+1)
#define big_app2_insert(p,c) big_app2(p);big_app(c);big_app2(p+2)
#define no_math 2
#define yes_math 1
#define maybe_math 0
#define begin_math() if(cur_mathness==maybe_math)init_mathness= yes_math; \
else if(cur_mathness==no_math)app_str("${}")
#define end_math() if(cur_mathness==maybe_math)init_mathness= no_math; \
else if(cur_mathness==yes_math)app_str("{}$")
#define cat1 (pp+1) ->cat
#define cat2 (pp+2) ->cat
#define cat3 (pp+3) ->cat
#define lhs_not_simple (pp->cat!=public_like \
&&pp->cat!=semi \
&&pp->cat!=prelangle \
&&pp->cat!=prerangle \
&&pp->cat!=template_like \
&&pp->cat!=new_like \
&&pp->cat!=new_exp \
&&pp->cat!=ftemplate \
&&pp->cat!=raw_ubin \
&&pp->cat!=const_like \
&&pp->cat!=raw_int \
&&pp->cat!=operator_like)
#define no_ident_found (token_pointer) 0
#define case_found (token_pointer) 1
#define operator_found (token_pointer) 2
#define force_lines flags['f']
#define force_first flags['F']
#define reserve_typenames flags['t']
#define freeze_text() *(++text_ptr)= tok_ptr
#define off 0
#define partly 1
#define fully 2
#define safe_tok_incr 20
#define safe_text_incr 10
#define safe_scrap_incr 10
#define app_scrap(c,b) { \
(++scrap_ptr)->cat= (c);scrap_ptr->trans= text_ptr; \
scrap_ptr->mathness= 5*(b); \
freeze_text(); \
}
#define make_pb flags['e']
#define stack_size 2000
#define cur_state stack[stack_size]
#define cur_end cur_state.end_field
#define cur_tok cur_state.tok_field
#define cur_mode cur_state.mode_field
#define init_stack() stack_ptr= stack;cur_mode= outer
#define pop_level() cur_state= *(--stack_ptr)
#define res_word 0201
#define section_code 0200
#define save_position() save_line= out_line;save_place= out_ptr
#define emit_space_if_needed() if(save_line!=out_line||save_place!=out_ptr) \
out_str("\\Y"); \
space_checked= true;
#define usage_sentinel (struct perm_meaning*) 1
#define depth cat
#define head trans_plus.Head
#define sort_pointer scrap_pointer
#define sort_ptr scrap_ptr
#define infinity 255
#define max_tex_chars 80
#define max_meanings 100
#define max_titles 100
#define indent_param_decl flags['i']
#define order_decl_stmt flags['o']
#define max_banner 50
#define kpse_find_cweb(name) kpse_find_file(name,kpse_cweb_format,true)

#line 73 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*3:*/
#line 32 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

typedef uint8_t eight_bits;
typedef uint16_t sixteen_bits;
typedef enum{
ctangle,cweave,ctwill
}cweb;
extern cweb program;
extern int phase;

/*:3*//*6:*/
#line 108 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern char section_text[];
extern char*section_text_end;
extern char*id_first;
extern char*id_loc;

/*:6*//*7:*/
#line 126 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern char buffer[];
extern char*buffer_end;
extern char*loc;
extern char*limit;

/*:7*//*8:*/
#line 143 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern int include_depth;
extern FILE*file[];
extern FILE*change_file;
extern char file_name[][max_file_name_length];

extern char change_file_name[];
extern char*found_filename;
extern int line[];
extern int change_line;
extern int change_depth;
extern bool input_has_ended;
extern bool changing;
extern bool web_file_open;

/*:8*//*10:*/
#line 164 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern sixteen_bits section_count;
extern bool changed_section[];
extern bool change_pending;
extern bool print_where;

/*:10*//*11:*/
#line 179 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

typedef struct name_info{
char*byte_start;
struct name_info*link;
union{
struct name_info*Rlink;

eight_bits Ilk;
}dummy;
void*equiv_or_xref;
}name_info;
typedef name_info*name_pointer;
typedef name_pointer*hash_pointer;
extern char byte_mem[];
extern char*byte_mem_end;
extern char*byte_ptr;
extern name_info name_dir[];
extern name_pointer name_dir_end;
extern name_pointer name_ptr;
extern name_pointer hash[];
extern hash_pointer hash_end;
extern hash_pointer hash_ptr;

/*:11*//*13:*/
#line 224 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern int history;

/*:13*//*15:*/
#line 245 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern int argc;
extern char**argv;
extern char C_file_name[];
extern char tex_file_name[];
extern char idx_file_name[];
extern char scn_file_name[];
extern char check_file_name[];
extern bool flags[];
extern const char*use_language;

/*:15*//*16:*/
#line 261 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern FILE*C_file;
extern FILE*tex_file;
extern FILE*idx_file;
extern FILE*scn_file;
extern FILE*active_file;
extern FILE*check_file;

/*:16*//*307:*/
#line 1990 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

extern char cb_banner[];

/*:307*/
#line 74 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*22:*/
#line 209 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

typedef struct xref_info{
sixteen_bits num;
struct xref_info*xlink;
}xref_info;
typedef xref_info*xref_pointer;

#line 138 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:22*//*29:*/
#line 326 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

typedef sixteen_bits token;
typedef token*token_pointer;
typedef token_pointer*text_pointer;

/*:29*//*112:*/
#line 2164 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

typedef struct{
eight_bits cat;
eight_bits mathness;
union{
text_pointer Trans;
/*252:*/
#line 4638 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

name_pointer Head;

/*:252*/
#line 2170 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}trans_plus;
}scrap;
typedef scrap*scrap_pointer;

/*:112*//*207:*/
#line 3768 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

typedef enum{
inner,
outer
}mode;
typedef struct{
token_pointer end_field;
token_pointer tok_field;
mode mode_field;
}output_state;
typedef output_state*stack_pointer;

/*:207*//*272:*/
#line 1460 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

typedef struct{
name_pointer id;
sixteen_bits prog_no;
sixteen_bits sec_no;
char tex_part[max_tex_chars];
}meaning_struct;


/*:272*/
#line 75 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*23:*/
#line 218 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static xref_info xmem[max_refs];
static xref_pointer xmem_end= xmem+max_refs-1;
static xref_pointer xref_ptr;
static sixteen_bits xref_switch,section_xref_switch;

/*:23*//*30:*/
#line 341 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static token tok_mem[max_toks];
static token_pointer tok_mem_end= tok_mem+max_toks-1;
static token_pointer tok_ptr;
static token_pointer max_tok_ptr;
static token_pointer tok_start[max_texts];
static text_pointer tok_start_end= tok_start+max_texts-1;
static text_pointer text_ptr;
static text_pointer max_text_ptr;

/*:30*//*37:*/
#line 565 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits ccode[256]= {ignore};

/*:37*//*43:*/
#line 685 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static name_pointer cur_section;
static char cur_section_char;

/*:43*//*46:*/
#line 732 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static bool preprocessing= false;

/*:46*//*48:*/
#line 745 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static bool sharp_include_line= false;


/*:48*//*67:*/
#line 1050 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits next_control;

/*:67*//*76:*/
#line 1201 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static name_pointer lhs,rhs;
static name_pointer res_wd_end;

/*:76*//*81:*/
#line 1283 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static xref_pointer cur_xref;
static bool an_output;

/*:81*//*85:*/
#line 1328 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static char out_buf[line_length+1];
static char*out_buf_end= out_buf+line_length;
static char*out_ptr;
static int out_line;

/*:85*//*106:*/
#line 1756 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static char cat_name[256][12];

/*:106*//*113:*/
#line 2177 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 589 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static scrap scrap_info[max_scraps];
static scrap null_scrap;
#line 2179 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static scrap_pointer scrap_info_end= scrap_info+max_scraps-1;
static scrap_pointer scrap_base;
static scrap_pointer scrap_ptr;
static scrap_pointer max_scr_ptr;
static scrap_pointer pp;
static scrap_pointer lo_ptr;
static scrap_pointer hi_ptr;

#line 596 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:113*//*119:*/
#line 2355 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static int cur_mathness,init_mathness;

/*:119*//*184:*/
#line 3257 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static int tracing= off;

/*:184*//*208:*/
#line 3787 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static output_state stack[stack_size+1];
static stack_pointer stack_end= stack+stack_size-1;
static stack_pointer stack_ptr;
static stack_pointer max_stack_ptr;

/*:208*//*213:*/
#line 3830 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static name_pointer cur_name;

/*:213*//*229:*/
#line 4205 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static int save_line;
static char*save_place;
static int sec_depth;
static bool space_checked;
static bool format_visible;
static bool doing_format= false;
#line 958 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static bool group_found= false;
static bool right_start_switch;
static bool temp_switch;

/*:229*//*238:*/
#line 4398 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static name_pointer this_section;

/*:238*//*250:*/
#line 4608 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static name_pointer bucket[256]= {NULL};
static name_pointer next_name;
static name_pointer blink[max_names];

/*:250*//*253:*/
#line 4647 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits cur_depth;
static char*cur_byte;
static sixteen_bits cur_val;
static sort_pointer max_sort_ptr;

/*:253*//*255:*/
#line 4659 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits collate[101+128];


/*:255*//*264:*/
#line 4823 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static xref_pointer next_xref,this_xref;


/*:264*//*273:*/
#line 1469 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

static struct perm_meaning{
meaning_struct perm;
int stamp;
struct perm_meaning*link;
}cur_meaning[max_names];
static struct perm_meaning*top_usage;
static meaning_struct temp_meaning_stack[max_meanings];
static meaning_struct*temp_meaning_stack_end= temp_meaning_stack+max_meanings-1;

static meaning_struct*temp_meaning_ptr;
static meaning_struct*max_temp_meaning_ptr;
static name_pointer title_code[max_titles];
static name_pointer*title_code_end= title_code+max_titles-1;

static name_pointer*title_code_ptr;
static char ministring_buf[max_tex_chars];
static char*ministring_buf_end= ministring_buf+max_tex_chars-1;

static char*ministring_ptr;
static bool ms_mode;


/*:273*//*280:*/
#line 1586 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

static bool ident_seen;

/*:280*//*285:*/
#line 1644 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

static sixteen_bits int_loc,ext_loc;


/*:285*//*288:*/
#line 1701 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

static bool is_macro;
static bool def_diff;
static name_pointer id_being_defined;


/*:288*//*290:*/
#line 1727 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

static FILE*aux_file;
static char aux_file_name[max_file_name_length];


/*:290*/
#line 76 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*4:*/
#line 42 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern void common_init(void);

/*:4*//*9:*/
#line 158 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern bool get_line(void);
extern void check_complete(void);
extern void reset_input(void);

/*:9*//*12:*/
#line 202 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern name_pointer id_lookup(const char*,const char*,eight_bits);

extern name_pointer section_lookup(char*,char*,bool);
extern void print_prefix_name(name_pointer);
extern void print_section_name(name_pointer);
extern void sprint_section_name(char*,name_pointer);

extern bool names_match(name_pointer,const char*,size_t,eight_bits);

extern void init_node(name_pointer);

/*:12*//*14:*/
#line 227 "../../../texlive-source/texk/web2c/cwebdir/comm-w2c.h"

extern int wrap_up(void);
extern void err_print(const char*);
extern void fatal(const char*,const char*);
extern void overflow(const char*);

extern void cb_show_banner(void);

extern void print_stats(void);

/*:14*//*25:*/
#line 252 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void new_xref(name_pointer);
static void new_section_xref(name_pointer);
static void set_file_flag(name_pointer);

/*:25*//*40:*/
#line 605 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void skip_limbo(void);
#line 264 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static eight_bits skip_TeX(void);

/*:40*//*45:*/
#line 717 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static eight_bits get_next(void);

/*:45*//*65:*/
#line 1025 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void skip_restricted(void);

/*:65*//*69:*/
#line 1068 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void phase_one(void);

/*:69*//*71:*/
#line 1106 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void C_xref(eight_bits);
static void outer_xref(void);

/*:71*//*83:*/
#line 1315 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void section_check(name_pointer);

/*:83*//*86:*/
#line 1350 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void flush_buffer(char*,bool,bool);
static void finish_line(void);

/*:86*//*90:*/
#line 1415 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void out_str(const char*);
static void break_out(void);

/*:90*//*95:*/
#line 1473 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void out_section(sixteen_bits);
static void out_name(name_pointer,bool);

/*:95*//*98:*/
#line 1519 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void copy_limbo(void);
static eight_bits copy_TeX(void);
static int copy_comment(bool,int);

/*:98*//*115:*/
#line 2214 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#ifdef DEBUG
static void print_text(text_pointer p);
#endif
#line 2218 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*:115*//*118:*/
#line 2329 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void app_str(const char*);
static void big_app(token);
static void big_app1(scrap_pointer);

/*:118*//*122:*/
#line 2521 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static token_pointer find_first_ident(text_pointer);
static void make_reserved(scrap_pointer);
static void make_underlined(scrap_pointer);
static void underline_xref(name_pointer);

/*:122*//*181:*/
#line 3196 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void reduce(scrap_pointer,short,eight_bits,short,short);
static void squash(scrap_pointer,short,eight_bits,short,short);

/*:181*//*189:*/
#line 3337 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static text_pointer translate(void);

/*:189*//*194:*/
#line 3404 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void C_parse(eight_bits);

/*:194*//*201:*/
#line 3629 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void app_cur_id(bool);
static text_pointer C_translate(void);
static void outer_parse(void);

/*:201*//*210:*/
#line 3796 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void push_level(text_pointer);

/*:210*//*214:*/
#line 3836 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits get_output(void);
static void output_C(void);
static void make_output(void);

/*:214*//*228:*/
#line 4189 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void phase_two(void);

/*:228*//*235:*/
#line 4334 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void finish_C(bool);

/*:235*//*244:*/
#line 4497 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void footnote(sixteen_bits);

/*:244*//*248:*/
#line 4581 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void phase_three(void);

/*:248*//*258:*/
#line 4737 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void unbucket(eight_bits);

/*:258*//*267:*/
#line 4855 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void section_print(name_pointer);

/*:267*//*275:*/
#line 1498 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static void new_meaning(name_pointer);


/*:275*//*282:*/
#line 1610 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static bool app_supp(text_pointer);


/*:282*//*284:*/
#line 1641 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static void make_ministring(scrap_pointer);


/*:284*//*296:*/
#line 1826 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static void out_mini(meaning_struct*);


/*:296*//*299:*/
#line 1894 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static sixteen_bits title_lookup(void);


/*:299*/
#line 77 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"


/*:1*//*2:*/
#line 87 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

int main(
int ac,
char**av)
{
argc= ac;argv= av;
#line 111 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
program= ctwill;
#line 94 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
/*24:*/
#line 232 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

xref_ptr= xmem;init_node(name_dir);xref_switch= section_xref_switch= 0;
xmem->num= 0;

/*:24*//*31:*/
#line 351 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

tok_ptr= max_tok_ptr= tok_mem+1;
tok_start[0]= tok_start[1]= tok_mem+1;
text_ptr= max_text_ptr= tok_start+1;

#line 162 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:31*//*38:*/
#line 568 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

ccode[' ']= ccode['\t']= ccode['\n']= ccode['\v']= ccode['\r']= ccode['\f']
= ccode['*']= new_section;
ccode['@']= '@';
ccode['=']= verbatim;
ccode['d']= ccode['D']= definition;
ccode['f']= ccode['F']= ccode['s']= ccode['S']= format_code;
ccode['c']= ccode['C']= ccode['p']= ccode['P']= begin_C;
ccode['t']= ccode['T']= TeX_string;
ccode['l']= ccode['L']= translit_code;
ccode['q']= ccode['Q']= noop;
ccode['h']= ccode['H']= output_defs_code;
ccode['&']= join;ccode['<']= ccode['(']= section_name;
ccode['!']= underline;ccode['^']= xref_roman;
ccode[':']= xref_wildcard;ccode['.']= xref_typewriter;ccode[',']= thin_space;
ccode['|']= math_break;ccode['/']= line_break;ccode['#']= big_line_break;
ccode['+']= no_line_break;ccode[';']= pseudo_semi;
ccode['[']= macro_arg_open;ccode[']']= macro_arg_close;
#line 254 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
ccode['\'']= ord;
ccode['$']= meaning;ccode['%']= temp_meaning;ccode['-']= suppress;
ccode['r']= ccode['R']= right_start;
#line 587 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
/*39:*/
#line 593 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

ccode['0']= ccode['1']= ccode['2']= trace;

/*:39*/
#line 587 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"


/*:38*//*61:*/
#line 962 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
section_text[0]= ' ';

/*:61*//*92:*/
#line 1431 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

out_buf[0]= '\\';

/*:92*//*107:*/
#line 1759 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

{int c;for(c= 0;c<256;c++)strcpy(cat_name[c],"UNKNOWN");}

strcpy(cat_name[exp],"exp");
strcpy(cat_name[unop],"unop");
strcpy(cat_name[binop],"binop");
strcpy(cat_name[ubinop],"ubinop");
strcpy(cat_name[cast],"cast");
strcpy(cat_name[question],"?");
strcpy(cat_name[lbrace],"{");
strcpy(cat_name[rbrace],"}");
strcpy(cat_name[decl_head],"decl_head");
strcpy(cat_name[comma],",");
strcpy(cat_name[lpar],"(");
strcpy(cat_name[rpar],")");
strcpy(cat_name[prelangle],"<");
strcpy(cat_name[prerangle],">");
strcpy(cat_name[langle],"\\<");
strcpy(cat_name[colcol],"::");
strcpy(cat_name[base],"\\:");
strcpy(cat_name[decl],"decl");
strcpy(cat_name[struct_head],"struct_head");
strcpy(cat_name[alfop],"alfop");
strcpy(cat_name[stmt],"stmt");
strcpy(cat_name[function],"function");
strcpy(cat_name[fn_decl],"fn_decl");
strcpy(cat_name[else_like],"else_like");
strcpy(cat_name[semi],";");
strcpy(cat_name[colon],":");
strcpy(cat_name[tag],"tag");
strcpy(cat_name[if_head],"if_head");
strcpy(cat_name[else_head],"else_head");
strcpy(cat_name[if_clause],"if()");
strcpy(cat_name[lproc],"#{");
strcpy(cat_name[rproc],"#}");
strcpy(cat_name[insert],"insert");
strcpy(cat_name[section_scrap],"section");
strcpy(cat_name[dead],"@d");
strcpy(cat_name[public_like],"public");
strcpy(cat_name[operator_like],"operator");
strcpy(cat_name[new_like],"new");
strcpy(cat_name[catch_like],"catch");
strcpy(cat_name[for_like],"for");
strcpy(cat_name[do_like],"do");
strcpy(cat_name[if_like],"if");
strcpy(cat_name[delete_like],"delete");
strcpy(cat_name[raw_ubin],"ubinop?");
strcpy(cat_name[const_like],"const");
strcpy(cat_name[raw_int],"raw");
strcpy(cat_name[int_like],"int");
strcpy(cat_name[case_like],"case");
strcpy(cat_name[sizeof_like],"sizeof");
strcpy(cat_name[struct_like],"struct");
strcpy(cat_name[typedef_like],"typedef");
strcpy(cat_name[define_like],"define");
strcpy(cat_name[template_like],"template");
strcpy(cat_name[alignas_like],"alignas");
strcpy(cat_name[using_like],"using");
strcpy(cat_name[default_like],"default");
strcpy(cat_name[attr],"attr");
strcpy(cat_name[ftemplate],"ftemplate");
strcpy(cat_name[new_exp],"new_exp");
strcpy(cat_name[begin_arg],"@[");
strcpy(cat_name[end_arg],"@]");
strcpy(cat_name[lbrack],"[");
strcpy(cat_name[rbrack],"]");
strcpy(cat_name[attr_head],"attr_head");
strcpy(cat_name[0],"zero");

/*:107*//*114:*/
#line 596 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

null_scrap.trans= &tok_start[0];
#line 2188 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
scrap_base= scrap_info+1;
max_scr_ptr= scrap_ptr= scrap_info;

/*:114*//*155:*/
#line 2958 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

force_lines= force_first= true;

/*:155*//*204:*/
#line 3688 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

make_pb= true;

/*:204*//*209:*/
#line 3793 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

max_stack_ptr= stack;

/*:209*//*254:*/
#line 4653 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

max_sort_ptr= scrap_info;

/*:254*//*256:*/
#line 4672 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

collate[0]= 0;
memcpy((char*)collate+1,
" \1\2\3\4\5\6\7\10\11\12\13\14\15\16\17",16);

memcpy((char*)collate+17,
"\20\21\22\23\24\25\26\27\30\31\32\33\34\35\36\37",16);

memcpy((char*)collate+33,
"!\42#$%&'()*+,-./:;<=>?@[\\]^`{|}~_",32);

memcpy((char*)collate+65,
"abcdefghijklmnopqrstuvwxyz0123456789",36);

memcpy((char*)collate+101,
"\200\201\202\203\204\205\206\207\210\211\212\213\214\215\216\217",16);

memcpy((char*)collate+117,
"\220\221\222\223\224\225\226\227\230\231\232\233\234\235\236\237",16);

memcpy((char*)collate+133,
"\240\241\242\243\244\245\246\247\250\251\252\253\254\255\256\257",16);

memcpy((char*)collate+149,
"\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277",16);

memcpy((char*)collate+165,
"\300\301\302\303\304\305\306\307\310\311\312\313\314\315\316\317",16);

memcpy((char*)collate+181,
"\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\337",16);

memcpy((char*)collate+197,
"\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357",16);

memcpy((char*)collate+213,
"\360\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377",16);


/*:256*//*274:*/
#line 1492 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

max_temp_meaning_ptr= temp_meaning_stack;
title_code_ptr= title_code;
ms_mode= false;


/*:274*//*302:*/
#line 1921 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

indent_param_decl= true;

/*:302*//*303:*/
#line 1931 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

order_decl_stmt= true;

/*:303*//*308:*/
#line 1993 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

strncpy(cb_banner,banner,max_banner-1);

/*:308*/
#line 94 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

common_init();
/*89:*/
#line 489 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

out_ptr= out_buf+1;out_line= 1;active_file= tex_file;
tex_puts("\\input ");
tex_printf(use_language);
tex_puts(proofing?"ctproofma":"ctwima");
*out_ptr= 'c';
#line 1404 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*:89*/
#line 96 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 117 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(show_banner)cb_show_banner();
#line 98 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
/*34:*/
#line 389 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

id_lookup("alignas",NULL,alignas_like);
id_lookup("alignof",NULL,sizeof_like);
id_lookup("and",NULL,alfop);
id_lookup("and_eq",NULL,alfop);
id_lookup("asm",NULL,sizeof_like);
id_lookup("auto",NULL,int_like);
id_lookup("bitand",NULL,alfop);
id_lookup("bitor",NULL,alfop);
id_lookup("bool",NULL,raw_int);
id_lookup("break",NULL,case_like);
id_lookup("case",NULL,case_like);
id_lookup("catch",NULL,catch_like);
id_lookup("char",NULL,raw_int);
id_lookup("char8_t",NULL,raw_int);
id_lookup("char16_t",NULL,raw_int);
id_lookup("char32_t",NULL,raw_int);
id_lookup("class",NULL,struct_like);
id_lookup("clock_t",NULL,raw_int);
id_lookup("compl",NULL,alfop);
id_lookup("concept",NULL,int_like);
id_lookup("const",NULL,const_like);
id_lookup("consteval",NULL,const_like);
id_lookup("constexpr",NULL,const_like);
id_lookup("constinit",NULL,const_like);
id_lookup("const_cast",NULL,raw_int);
id_lookup("continue",NULL,case_like);
id_lookup("co_await",NULL,case_like);
id_lookup("co_return",NULL,case_like);
id_lookup("co_yield",NULL,case_like);
id_lookup("decltype",NULL,sizeof_like);
id_lookup("default",NULL,default_like);
id_lookup("define",NULL,define_like);
id_lookup("defined",NULL,sizeof_like);
id_lookup("delete",NULL,delete_like);
id_lookup("div_t",NULL,raw_int);
id_lookup("do",NULL,do_like);
id_lookup("double",NULL,raw_int);
id_lookup("dynamic_cast",NULL,raw_int);
id_lookup("elif",NULL,if_like);
id_lookup("else",NULL,else_like);
id_lookup("endif",NULL,if_like);
id_lookup("enum",NULL,struct_like);
id_lookup("error",NULL,if_like);
id_lookup("explicit",NULL,int_like);
id_lookup("export",NULL,int_like);
#line 194 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

ext_loc= id_lookup("extern",NULL,int_like)-name_dir;

#line 436 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
id_lookup("FILE",NULL,raw_int);
id_lookup("false",NULL,normal);
id_lookup("float",NULL,raw_int);
id_lookup("for",NULL,for_like);
id_lookup("fpos_t",NULL,raw_int);
id_lookup("friend",NULL,int_like);
id_lookup("goto",NULL,case_like);
id_lookup("if",NULL,if_like);
id_lookup("ifdef",NULL,if_like);
id_lookup("ifndef",NULL,if_like);
id_lookup("include",NULL,if_like);
id_lookup("inline",NULL,int_like);
#line 202 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

int_loc= id_lookup("int",NULL,raw_int)-name_dir;

#line 449 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
id_lookup("jmp_buf",NULL,raw_int);
id_lookup("ldiv_t",NULL,raw_int);
id_lookup("line",NULL,if_like);
id_lookup("long",NULL,raw_int);
id_lookup("mutable",NULL,int_like);
id_lookup("namespace",NULL,struct_like);
id_lookup("new",NULL,new_like);
id_lookup("noexcept",NULL,attr);
id_lookup("not",NULL,alfop);
id_lookup("not_eq",NULL,alfop);
id_lookup("NULL",NULL,custom);
id_lookup("nullptr",NULL,custom);
id_lookup("offsetof",NULL,raw_int);
id_lookup("operator",NULL,operator_like);
id_lookup("or",NULL,alfop);
id_lookup("or_eq",NULL,alfop);
id_lookup("pragma",NULL,if_like);
id_lookup("private",NULL,public_like);
id_lookup("protected",NULL,public_like);
id_lookup("ptrdiff_t",NULL,raw_int);
id_lookup("public",NULL,public_like);
id_lookup("register",NULL,int_like);
id_lookup("reinterpret_cast",NULL,raw_int);
id_lookup("requires",NULL,int_like);
id_lookup("restrict",NULL,int_like);
id_lookup("return",NULL,case_like);
id_lookup("short",NULL,raw_int);
id_lookup("sig_atomic_t",NULL,raw_int);
id_lookup("signed",NULL,raw_int);
id_lookup("size_t",NULL,raw_int);
id_lookup("sizeof",NULL,sizeof_like);
id_lookup("static",NULL,int_like);
id_lookup("static_assert",NULL,sizeof_like);
id_lookup("static_cast",NULL,raw_int);
id_lookup("struct",NULL,struct_like);
id_lookup("switch",NULL,for_like);
id_lookup("template",NULL,template_like);
id_lookup("this",NULL,custom);
id_lookup("thread_local",NULL,raw_int);
id_lookup("throw",NULL,case_like);
id_lookup("time_t",NULL,raw_int);
id_lookup("true",NULL,normal);
id_lookup("try",NULL,else_like);
id_lookup("typedef",NULL,typedef_like);
id_lookup("typeid",NULL,sizeof_like);
id_lookup("typename",NULL,struct_like);
id_lookup("undef",NULL,if_like);
id_lookup("union",NULL,struct_like);
id_lookup("unsigned",NULL,raw_int);
id_lookup("using",NULL,using_like);
id_lookup("va_dcl",NULL,decl);
id_lookup("va_list",NULL,raw_int);
id_lookup("virtual",NULL,int_like);
id_lookup("void",NULL,raw_int);
id_lookup("volatile",NULL,const_like);
id_lookup("wchar_t",NULL,raw_int);
id_lookup("while",NULL,for_like);
id_lookup("xor",NULL,alfop);
id_lookup("xor_eq",NULL,alfop);res_wd_end= name_ptr;
id_lookup("TeX",NULL,custom);
id_lookup("complex",NULL,int_like);
id_lookup("imaginary",NULL,int_like);
id_lookup("make_pair",NULL,func_template);

/*:34*/
#line 98 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

phase_one();
phase_two();
phase_three();
if(tracing==fully&&!show_progress)new_line();
return wrap_up();
}

/*:2*//*26:*/
#line 257 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
new_xref(
name_pointer p)
{
xref_pointer q;
sixteen_bits m,n;
if(no_xref)return;
if((unindexed(p)||is_tiny(p))&&xref_switch==0)return;
m= section_count+xref_switch;xref_switch= 0;q= (xref_pointer)p->xref;
if(q!=xmem){
n= q->num;
if(n==m||n==m+def_flag)return;
else if(m==n+def_flag){
q->num= m;return;
}
}
append_xref(m);xref_ptr->xlink= q;update_node(p);
}

/*:26*//*27:*/
#line 288 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
new_section_xref(
name_pointer p)
{
xref_pointer q= (xref_pointer)p->xref;
xref_pointer r= xmem;
if(q> r)
while(q->num> section_xref_switch){r= q;q= q->xlink;}
if(r->num==section_count+section_xref_switch)
return;
append_xref(section_count+section_xref_switch);
xref_ptr->xlink= q;section_xref_switch= 0;
if(r==xmem)update_node(p);
else r->xlink= xref_ptr;
}

/*:27*//*28:*/
#line 308 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
set_file_flag(
name_pointer p)
{
xref_pointer q= (xref_pointer)p->xref;
if(q->num==file_flag)return;
append_xref(file_flag);
xref_ptr->xlink= q;
update_node(p);
}

/*:28*//*32:*/
#line 357 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

bool names_match(
name_pointer p,
const char*first,
size_t l,
eight_bits t)
{
if(length(p)!=l)return false;
if(p->ilk!=t&&!(t==normal&&abnormal(p)))return false;
return!strncmp(first,p->byte_start,l);
}

void
init_node(
name_pointer p)
{
#line 169 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
p->xref= (void*)xmem;
if(p!=name_dir){
struct perm_meaning*q= get_meaning(p);
q->stamp= 0;
q->link= NULL;
q->perm.id= p;
q->perm.prog_no= q->perm.sec_no= 0;
strcpy(q->perm.tex_part,"\\uninitialized");
}
#line 374 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

#line 185 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:32*//*41:*/
#line 269 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

#line 610 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void
skip_limbo(void){
while(true){
#line 275 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(loc> limit&&get_line()==false)return;
if(loc==buffer&&strncmp(buffer,"\\def\\title{",11)==0){
loc= buffer+10;
title_lookup();
}
#line 614 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
*(limit+1)= '@';
while(*loc!='@')loc++;
if(loc++<=limit)
switch(ccode[(eight_bits)*loc++]){
case new_section:return;
case noop:skip_restricted();break;
case format_code:/*79:*/
#line 1246 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(get_next()!=identifier)
#line 438 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Missing left identifier of @s"));
#line 1249 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else{
lhs= id_lookup(id_first,id_loc,normal);
if(get_next()!=identifier)
#line 444 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Missing right identifier of @s"));
#line 1254 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else{
rhs= id_lookup(id_first,id_loc,normal);
lhs->ilk= rhs->ilk;
}
}

/*:79*/
#line 620 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
}
}

/*:41*//*42:*/
#line 632 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits
skip_TeX(void)
{
while(true){
if(loc> limit&&get_line()==false)return new_section;
*(limit+1)= '@';
while(*loc!='@'&&*loc!='|')loc++;
if(*loc++=='|')return(eight_bits)'|';
if(loc<=limit)return ccode[(eight_bits)*(loc++)];
}
}

/*:42*//*44:*/
#line 692 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits
get_next(void)
{
eight_bits c;
while(true){
/*50:*/
#line 757 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

while(loc==limit-1&&preprocessing&&*loc=='\\')
if(get_line()==false)return new_section;
if(loc>=limit&&preprocessing){
preprocessing= sharp_include_line= false;
return right_preproc;
}

/*:50*/
#line 698 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(loc> limit&&get_line()==false)return new_section;
c= *(loc++);
if(xisdigit((int)c)||c=='.')/*53:*/
#line 825 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
id_first= id_loc= section_text+1;
if(*(loc-1)=='.'&&!xisdigit(*loc))goto mistake;
if(*(loc-1)=='0'){
if(*loc=='x'||*loc=='X')/*54:*/
#line 853 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
*id_loc++= '^';loc++;
gather_digits_while(xisxdigit(*loc)||*loc=='.');
goto get_exponent;
}

/*:54*/
#line 829 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else if(*loc=='b'||*loc=='B')/*55:*/
#line 859 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
*id_loc++= '\\';loc++;
gather_digits_while(*loc=='0'||*loc=='1');
goto digit_suffix;
}

/*:55*/
#line 830 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else if(xisdigit(*loc))/*56:*/
#line 865 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
*id_loc++= '~';gather_digits_while(xisdigit(*loc));
goto digit_suffix;
}

/*:56*/
#line 831 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
*id_loc++= *(loc-1);
gather_digits_while(xisdigit(*loc)||*loc=='.');
get_exponent:
if(*loc=='e'||*loc=='E')
*id_loc++= '_';
else if(*loc=='p'||*loc=='P')
*id_loc++= '%';
else
goto digit_suffix;
loc++;
if(*loc=='+'||*loc=='-')*id_loc++= *loc++;
gather_digits_while(xisdigit(*loc));
digit_suffix:
while(*loc=='u'||*loc=='U'||*loc=='l'||*loc=='L'
||*loc=='f'||*loc=='F'){
*id_loc++= '$';*id_loc++= toupper((int)*loc);loc++;
}
return constant;
}

/*:53*/
#line 701 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else if(c=='\''||c=='"'
||((c=='L'||c=='u'||c=='U')&&(*loc=='\''||*loc=='"'))
||((c=='u'&&*loc=='8')&&(*(loc+1)=='\''||*(loc+1)=='"'))
||(c=='<'&&sharp_include_line==true))
/*57:*/
#line 875 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
char delim= c;
id_first= section_text+1;
id_loc= section_text;
if(delim=='\''&&*(loc-2)=='@'){*++id_loc= '@';*++id_loc= '@';}
*++id_loc= delim;
if(delim=='L'||delim=='u'||delim=='U')
/*58:*/
#line 919 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
if(delim=='u'&&*loc=='8')*++id_loc= *loc++;
delim= *loc++;*++id_loc= delim;
}

/*:58*/
#line 882 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(delim=='<')delim= '>';
while(true){
if(loc>=limit){
if(*(limit-1)!='\\'){
#line 298 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! String didn't end"));loc= limit;break;
#line 888 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
if(get_line()==false){
#line 304 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Input ended in middle of string"));loc= buffer;break;
#line 892 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
}
if((c= *loc++)==delim){
if(++id_loc<=section_text_end)*id_loc= c;
break;
}
if(c=='\\'){
if(loc>=limit)continue;
else{
if(++id_loc<=section_text_end){
*id_loc= '\\';c= *loc++;
}
}
}
if(++id_loc<=section_text_end)*id_loc= c;
}
if(id_loc>=section_text_end){
#line 310 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf("%s",_("\n! String too long: "));
#line 911 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

term_write(section_text+1,25);
printf("...");mark_error();
}
id_loc++;
return string;
}

/*:57*/
#line 706 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else if(isalpha((int)c)||isxalpha(c)||ishigh(c))
/*52:*/
#line 797 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
id_first= --loc;
do
++loc;
while(isalpha((int)*loc)||isdigit((int)*loc)
||isxalpha(*loc)||ishigh(*loc));
id_loc= loc;return identifier;
}

/*:52*/
#line 708 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else if(c=='@')/*59:*/
#line 927 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

switch(ccode[c= *loc++]){
#line 316 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case translit_code:err_print(_("! Use @l in limbo only"));continue;
#line 930 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 322 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case underline:xref_switch= def_flag;continue;
case temp_meaning:temp_switch= !temp_switch;continue;
case right_start:right_start_switch= true;continue;
#line 932 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
case trace:tracing= c-'0';continue;
case section_name:
/*60:*/
#line 945 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
char*k= section_text;
cur_section_char= *(loc-1);
/*62:*/
#line 964 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

while(true){
if(loc> limit&&get_line()==false){
#line 337 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Input ended in section name"));
#line 968 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

loc= buffer+1;break;
}
c= *loc;
/*63:*/
#line 987 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(c=='@'){
c= *(loc+1);
if(c=='>'){
loc+= 2;break;
}
if(ccode[c]==new_section){
#line 349 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Section name didn't end"));break;
#line 995 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
if(c!='@'){
#line 355 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Control codes are forbidden in section name"));break;
#line 999 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
*(++k)= '@';loc++;
}

/*:63*/
#line 972 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

loc++;if(k<section_text_end)k++;
if(xisspace(c)){
c= ' ';if(*(k-1)==' ')k--;
}
*k= c;
}
if(k>=section_text_end){
#line 343 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf("%s",_("\n! Section name too long: "));
#line 981 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

term_write(section_text+1,25);
printf("...");mark_harmless();
}
if(*k==' '&&k> section_text)k--;

/*:62*/
#line 948 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(k-section_text> 3&&strncmp(k-2,"...",3)==0)
cur_section= section_lookup(section_text+1,k-3,true);

else cur_section= section_lookup(section_text+1,k,false);
xref_switch= 0;return section_name;
}

/*:60*/
#line 934 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

case verbatim:/*66:*/
#line 1032 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

id_first= loc++;*(limit+1)= '@';*(limit+2)= '>';
while(*loc!='@'||*(loc+1)!='>')loc++;
#line 389 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(loc>=limit)err_print(_("! Verbatim string didn't end"));
#line 1036 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

id_loc= loc;loc+= 2;
return verbatim;

/*:66*/
#line 935 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

case ord:/*57:*/
#line 875 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
char delim= c;
id_first= section_text+1;
id_loc= section_text;
if(delim=='\''&&*(loc-2)=='@'){*++id_loc= '@';*++id_loc= '@';}
*++id_loc= delim;
if(delim=='L'||delim=='u'||delim=='U')
/*58:*/
#line 919 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
if(delim=='u'&&*loc=='8')*++id_loc= *loc++;
delim= *loc++;*++id_loc= delim;
}

/*:58*/
#line 882 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(delim=='<')delim= '>';
while(true){
if(loc>=limit){
if(*(limit-1)!='\\'){
#line 298 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! String didn't end"));loc= limit;break;
#line 888 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
if(get_line()==false){
#line 304 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Input ended in middle of string"));loc= buffer;break;
#line 892 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
}
if((c= *loc++)==delim){
if(++id_loc<=section_text_end)*id_loc= c;
break;
}
if(c=='\\'){
if(loc>=limit)continue;
else{
if(++id_loc<=section_text_end){
*id_loc= '\\';c= *loc++;
}
}
}
if(++id_loc<=section_text_end)*id_loc= c;
}
if(id_loc>=section_text_end){
#line 310 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf("%s",_("\n! String too long: "));
#line 911 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

term_write(section_text+1,25);
printf("...");mark_error();
}
id_loc++;
return string;
}

/*:57*/
#line 936 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 330 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case xref_roman:case xref_wildcard:case xref_typewriter:case noop:
case meaning:case suppress:
#line 938 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
case TeX_string:skip_restricted();/* fall through */
default:return ccode[c];
}

/*:59*/
#line 709 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else if(xisspace(c))continue;
if(c=='#'&&loc==buffer+1)/*47:*/
#line 735 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
preprocessing= true;
/*49:*/
#line 749 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

while(loc<=buffer_end-7&&xisspace(*loc))loc++;
if(loc<=buffer_end-6&&strncmp(loc,"include",7)==0)sharp_include_line= true;

/*:49*/
#line 737 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

return left_preproc;
}

/*:47*/
#line 711 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

mistake:/*51:*/
#line 772 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

switch(c){
case'/':if(*loc=='*'){compress(begin_comment);}
else if(*loc=='/')compress(begin_short_comment);break;
case'+':if(*loc=='+')compress(plus_plus);break;
case'-':if(*loc=='-'){compress(minus_minus);}
else if(*loc=='>'){
if(*(loc+1)=='*'){loc++;compress(minus_gt_ast);}
else compress(minus_gt);
}break;
case'.':if(*loc=='*'){compress(period_ast);}
else if(*loc=='.'&&*(loc+1)=='.'){
loc++;compress(dot_dot_dot);
}break;
case':':if(*loc==':')compress(colon_colon);break;
case'=':if(*loc=='=')compress(eq_eq);break;
case'>':if(*loc=='='){compress(gt_eq);}
else if(*loc=='>')compress(gt_gt);break;
case'<':if(*loc=='='){compress(lt_eq);}
else if(*loc=='<')compress(lt_lt);break;
case'&':if(*loc=='&')compress(and_and);break;
case'|':if(*loc=='|')compress(or_or);break;
case'!':if(*loc=='=')compress(non_eq);break;
}

/*:51*/
#line 712 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

return c;
}
}

/*:44*//*64:*/
#line 1006 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
#line 362 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
 skip_restricted(void)
{int c= ccode[(eight_bits)*(loc-1)];
#line 1010 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
id_first= loc;*(limit+1)= '@';
false_alarm:
while(*loc!='@')loc++;
id_loc= loc;
if(loc++> limit){
#line 369 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Control text didn't end"));loc= limit;
#line 1016 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}else{
if(*loc=='@'&&loc<=limit){loc++;goto false_alarm;}
if(*loc++!='>')
#line 375 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Control codes are forbidden in control text"));
#line 381 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(c==meaning&&phase==2)/*277:*/
#line 1525 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

{char*first= id_first;
while(xisspace(*first))first++;
loc= first;
while(xisalpha(*loc)||xisdigit(*loc)||isxalpha(*loc))loc++;
if(*loc++!=' ')
err_print(_("! Identifier in meaning should be followed by space"));
else{int n= 0;
name_pointer p= id_lookup(first,loc-1,normal);
sixteen_bits t= title_lookup();
if(*(loc-1)=='}')
for(;xisdigit(*loc);loc++)
if(n<INT_MAX/10)n= 10*n+(*loc)-'0';
if(*loc++!=' ')
err_print(_("! Location in meaning should be followed by space"));
else/*279:*/
#line 1557 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

{meaning_struct*m;
struct perm_meaning*q= get_meaning(p);
if(temp_switch){
m= temp_meaning_ptr++;
if(temp_meaning_ptr> max_temp_meaning_ptr){
if(temp_meaning_ptr>=temp_meaning_stack_end)
overflow(_("temp meanings"));
max_temp_meaning_ptr= temp_meaning_ptr;
}
}else m= &(q->perm);
m->id= p;
m->prog_no= t;
m->sec_no= n;
if(id_loc-loc>=max_tex_chars)strcpy(m->tex_part,"\\zip");

else{char*q= m->tex_part;
while(loc<id_loc)*q++= *loc++;
*q= '\0';
}
}


/*:279*/
#line 1540 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

}
loc= id_loc+2;
}


/*:277*/
#line 382 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

else if(c==suppress&&phase==2)/*278:*/
#line 1546 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

{char*first= id_first,*last= id_loc;
while(xisspace(*first))first++;
while(xisspace(*(last-1)))last--;
if(first<last){
struct perm_meaning*q= get_meaning(id_lookup(first,last,normal));
q->stamp= section_count;
}
}


/*:278*/
#line 383 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

#line 1022 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}
}

/*:64*//*68:*/
#line 1056 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
phase_one(void){
phase= 1;reset_input();section_count= 0;
#line 395 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
skip_limbo();
/*300:*/
#line 1897 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(title_code_ptr==title_code){
char*saveloc= loc,*savelimit= limit;
loc= limit+1;limit= loc;
*limit++= '{';
memcpy(limit,tex_file_name,strlen(tex_file_name)-4);
limit+= strlen(tex_file_name)-4;
*limit++= '}';
title_lookup();
loc= saveloc;limit= savelimit;
}


/*:300*/
#line 396 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

#line 1061 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
while(!input_has_ended)
/*70:*/
#line 1070 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

{
#line 408 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(++section_count==max_sections)overflow(_("section number"));
#line 1075 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(*(loc-1)=='*'&&show_progress){
printf("*%d",(int)section_count);
update_terminal();
}
/*74:*/
#line 1158 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

while(true){
switch(next_control= skip_TeX()){
#line 425 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case translit_code:err_print(_("! Use @l in limbo only"));continue;
#line 1162 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

case underline:xref_switch= def_flag;continue;
case trace:tracing= *(loc-1)-'0';continue;
case'|':C_xref(section_name);break;
#line 431 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case xref_roman:case xref_wildcard:case xref_typewriter:
case meaning:case suppress:
#line 1167 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
case noop:case section_name:
loc-= 2;next_control= get_next();
if(next_control>=xref_roman&&next_control<=xref_typewriter){
/*75:*/
#line 1178 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

{
char*src= id_first,*dst= id_first;
while(src<id_loc){
if(*src=='@')src++;
*dst++= *src++;
}
id_loc= dst;
while(dst<src)*dst++= ' ';
}

/*:75*/
#line 1170 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

new_xref(id_lookup(id_first,id_loc,next_control-identifier));
}
break;
}
if(next_control>=format_code)break;
}

/*:74*/
#line 1079 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*77:*/
#line 1207 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

while(next_control<=definition){
if(next_control==definition){
xref_switch= def_flag;
next_control= get_next();
}else/*78:*/
#line 1221 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
next_control= get_next();
if(next_control==identifier){
lhs= id_lookup(id_first,id_loc,normal);lhs->ilk= normal;
if(xref_switch)new_xref(lhs);
next_control= get_next();
if(next_control==identifier){
rhs= id_lookup(id_first,id_loc,normal);
lhs->ilk= rhs->ilk;
if(unindexed(lhs)){
xref_pointer q,r= NULL;
for(q= (xref_pointer)lhs->xref;q> xmem;q= q->xlink)
if(q->num<def_flag)
if(r)r->xlink= q->xlink;
else lhs->xref= (void*)q->xlink;
else r= q;
}
next_control= get_next();
}
}
}

/*:78*/
#line 1212 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

outer_xref();
}

/*:77*/
#line 1080 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*80:*/
#line 1264 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(next_control<=section_name){
if(next_control==begin_C)section_xref_switch= 0;
else{
section_xref_switch= def_flag;
if(cur_section_char=='('&&cur_section!=name_dir)
set_file_flag(cur_section);
}
do{
if(next_control==section_name&&cur_section!=name_dir)
new_section_xref(cur_section);
next_control= get_next();outer_xref();
}while(next_control<=section_name);
}

/*:80*/
#line 1081 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 1083 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

/*:70*/
#line 1062 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 1065 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
/*84:*/
#line 1317 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
section_check(root);

/*:84*/
#line 1065 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:68*//*72:*/
#line 1110 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
C_xref(
eight_bits spec_ctrl)
{
while(next_control<format_code||next_control==spec_ctrl){
if(next_control>=identifier&&next_control<=xref_typewriter){
if(next_control> identifier)/*75:*/
#line 1178 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

{
char*src= id_first,*dst= id_first;
while(src<id_loc){
if(*src=='@')src++;
*dst++= *src++;
}
id_loc= dst;
while(dst<src)*dst++= ' ';
}

/*:75*/
#line 1117 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

new_xref(id_lookup(id_first,id_loc,next_control-identifier));
}
if(next_control==section_name){
section_xref_switch= cite_flag;
new_section_xref(cur_section);
}
next_control= get_next();
if(next_control=='|'||next_control==begin_comment||
next_control==begin_short_comment)return;
}
}

/*:72*//*73:*/
#line 1134 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
outer_xref(void)
{
int bal;
while(next_control<format_code)
if(next_control!=begin_comment&&next_control!=begin_short_comment)
C_xref(ignore);
else{
bool is_long_comment= (next_control==begin_comment);
bal= copy_comment(is_long_comment,1);next_control= '|';
while(bal> 0){
C_xref(section_name);
if(next_control=='|')bal= copy_comment(is_long_comment,bal);
else bal= 0;
}
}
}

/*:73*//*82:*/
#line 1291 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
section_check(
name_pointer p)
{
if(p){
section_check(p->llink);
cur_xref= (xref_pointer)p->xref;
if((an_output= (cur_xref->num==file_flag))==true)cur_xref= cur_xref->xlink;
if(cur_xref->num<def_flag){
#line 451 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf("%s",_("\n! Never defined: <"));
print_section_name(p);putchar('>');mark_harmless();
#line 1303 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
while(cur_xref->num>=cite_flag)cur_xref= cur_xref->xlink;
if(cur_xref==xmem&&!an_output){
#line 459 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf("%s",_("\n! Never used: <"));
print_section_name(p);putchar('>');mark_harmless();
#line 1309 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
section_check(p->rlink);
}
}

/*:82*//*87:*/
#line 1354 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
flush_buffer(
char*b,
bool per_cent,bool carryover)
{
char*j= b;
if(!per_cent)
while(j> out_buf&&*j==' ')j--;
c_line_write(j-out_buf);
if(per_cent)tex_putc('%');
tex_putc('\n');out_line++;
if(carryover)
while(j> out_buf)
if(*j--=='%'&&(j==out_buf||*j!='\\')){
*b--= '%';break;
}
if(b<out_ptr)memcpy(out_buf+1,b+1,(size_t)(out_ptr-b));
out_ptr-= b-out_buf;
}

/*:87*//*88:*/
#line 1383 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
finish_line(void)
{
char*k;
if(out_ptr> out_buf)flush_buffer(out_ptr,false,false);
else{
for(k= buffer;k<=limit;k++)
if(!(xisspace(*k)))return;
flush_buffer(out_buf,false,false);
}
}

#line 473 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:88*//*91:*/
#line 1419 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
out_str(
const char*s)
{
while(*s)out(*s++);
}

/*:91*//*93:*/
#line 1438 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
break_out(void)
{
char*k= out_ptr;
while(true){
if(k==out_buf)/*94:*/
#line 1459 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

{
#line 514 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf(_("\n! Line had to be broken (output l. %d):\n"),out_line);
#line 1462 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

term_write(out_buf+1,out_ptr-out_buf-1);
new_line();mark_harmless();
flush_buffer(out_ptr-1,true,true);return;
}

/*:94*/
#line 1444 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(*k==' '){
flush_buffer(k,false,true);return;
}
if(*(k--)=='\\'&&*k!='\\'&&*k!='%'){
flush_buffer(k,true,true);return;
}
}
}

/*:93*//*96:*/
#line 1477 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
out_section(
sixteen_bits n)
{
char s[6];
snprintf(s,6,"%d",(int)n);out_str(s);
#line 1486 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

/*:96*//*97:*/
#line 1491 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
out_name(
name_pointer p,
bool quote_xalpha)
{
char*k;
out('{');
for(k= p->byte_start;k<(p+1)->byte_start;k++){
if(isxalpha(*k)&&quote_xalpha)out('\\');


out(*k);
}
out('}');
}

/*:97*//*99:*/
#line 1524 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
copy_limbo(void)
{
while(true){
if(loc> limit&&(finish_line(),get_line()==false))return;
*(limit+1)= '@';
while(*loc!='@')out(*(loc++));
if(loc++<=limit){
switch(ccode[(eight_bits)*loc++]){
case new_section:return;
case translit_code:out_str("\\ATL");break;

case'@':out('@');break;
case noop:skip_restricted();break;
case format_code:if(get_next()==identifier)get_next();
if(loc>=limit)get_line();
break;
#line 533 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case right_start:right_start_switch= true;break;
default:err_print(_("! Double @ should be used in limbo"));
#line 1543 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

out('@');
}
}
}
}

/*:99*//*100:*/
#line 1557 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits
copy_TeX(void)
{
char c;
while(true){
if(loc> limit&&(finish_line(),get_line()==false))return new_section;
*(limit+1)= '@';
while((c= *(loc++))!='|'&&c!='@'){
out(c);
if(out_ptr==out_buf+1&&(xisspace(c)))out_ptr--;
}
if(c=='|')return'|';
if(loc<=limit)return ccode[(eight_bits)*(loc++)];
}
}

/*:100*//*101:*/
#line 1586 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static int copy_comment(
bool is_long_comment,
int bal)
{
char c;
while(true){
if(loc> limit){
if(is_long_comment){
if(get_line()==false){
#line 546 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Input ended in mid-comment"));
#line 1597 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

loc= buffer+1;goto done;
}
}else{
#line 552 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(bal> 1)err_print(_("! Missing } in comment"));
#line 1602 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

goto done;
}
}
c= *(loc++);
if(c=='|')return bal;
if(is_long_comment)/*102:*/
#line 1626 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(c=='*'&&*loc=='/'){
loc++;
#line 564 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(bal> 1)err_print(_("! Missing } in comment"));
#line 1630 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

goto done;
}

/*:102*/
#line 1608 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(phase==2){
if(ishigh(c))app_tok(quoted_char);
app_tok(c);
}
/*103:*/
#line 1634 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(c=='@'){
if(*(loc++)!='@'){
#line 570 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Illegal use of @ in comment"));
#line 1638 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

loc-= 2;if(phase==2)*(tok_ptr-1)= ' ';goto done;
}
}else{
if(c=='\\'&&*loc!='@'){
if(phase==2)app_tok(*(loc++))else loc++;
}
}

/*:103*/
#line 1613 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(c=='{')bal++;
else if(c=='}'){
if(bal> 1)bal--;
#line 558 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
else{err_print(_("! Extra } in comment"));
#line 1618 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(phase==2)tok_ptr--;
}
}
}
done:/*104:*/
#line 1650 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(phase==2)while(bal--> 0)app_tok('}');
return 0;

/*:104*/
#line 1623 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:101*//*116:*/
#line 2222 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#ifdef DEBUG
static void
print_text(
text_pointer p)
{
token_pointer j;
sixteen_bits r;
if(p>=text_ptr)printf("BAD");
else for(j= *p;j<*(p+1);j++){
r= *j%id_flag;
switch(*j){
case id_flag:
printf("\\\\{");print_id((name_dir+r));putchar('}');
break;
case res_flag:
printf("\\&{");print_id((name_dir+r));putchar('}');
break;
case section_flag:
putchar('<');print_section_name((name_dir+r));putchar('>');
break;
case tok_flag:printf("[[%d]]",(int)r);break;
case inner_tok_flag:printf("|[[%d]]|",(int)r);break;
default:/*117:*/
#line 2252 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

switch(r){
case math_rel:printf("\\mathrel{");break;
case big_cancel:printf("[ccancel]");break;
case cancel:printf("[cancel]");break;
case indent:printf("[indent]");break;
case outdent:printf("[outdent]");break;
case dindent:printf("[dindent]");break;
case backup:printf("[backup]");break;
case opt:printf("[opt]");break;
case break_space:printf("[break]");break;
case force:printf("[force]");break;
case big_force:printf("[fforce]");break;
case preproc_line:printf("[preproc]");break;
case quoted_char:j++;printf("[%o]",(unsigned int)*j);break;
case end_translation:printf("[quit]");break;
case inserted:printf("[inserted]");break;
default:putchar((int)r);
}

/*:117*/
#line 2245 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
}
#line 603 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
puts("|");update_terminal();
#line 2249 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}
#endif 
#line 2251 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*:116*//*120:*/
#line 2368 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
app_str(
const char*s)
{
while(*s)app_tok(*s++);
}

static void
big_app(
token a)
{
if(a==' '||(a>=big_cancel&&a<=big_force)||a==dindent)
{
end_math();
cur_mathness= no_math;
}else{
begin_math();
cur_mathness= yes_math;
}
app(a);
}

static void
big_app1(
scrap_pointer a)
{
switch(a->mathness%4){
case(no_math):
end_math();
cur_mathness= a->mathness/4;
break;
case(yes_math):
begin_math();
cur_mathness= a->mathness/4;
break;
case(maybe_math):break;
}
app(tok_flag+(int)((a)->trans-tok_start));
}

/*:120*//*123:*/
#line 2527 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static token_pointer
find_first_ident(
text_pointer p)
{
token_pointer q;
token_pointer j;
sixteen_bits r;
if(p>=text_ptr)confusion("find_first_ident");
for(j= *p;j<*(p+1);j++){
r= *j%id_flag;
switch(*j/id_flag){
case 2:
if(name_dir[r].ilk==case_like)return case_found;
if(name_dir[r].ilk==operator_like)return operator_found;
if(name_dir[r].ilk!=raw_int)break;
/* else fall through */
case 1:return j;
case 4:case 5:
if((q= find_first_ident(tok_start+r))!=no_ident_found)
return q;
/* else fall through */
default:;
if(*j==inserted)return no_ident_found;
else if(*j==qualifier)j++;
}
}
return no_ident_found;
}

/*:123*//*124:*/
#line 616 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

static token_pointer tok_loc;

#line 2562 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
static void
make_reserved(
scrap_pointer p)
{
sixteen_bits tok_value;
#line 626 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(tok_loc<=operator_found)return;
#line 2570 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
tok_value= *tok_loc;
for(;p<=scrap_ptr;p==lo_ptr?p= hi_ptr:p++)
if(p->cat==exp)
if(**(p->trans)==tok_value){
p->cat= raw_int;
**(p->trans)= tok_value%id_flag+res_flag;
}
(name_dir+(sixteen_bits)(tok_value%id_flag))->ilk= raw_int;
*tok_loc= tok_value%id_flag+res_flag;
}

/*:124*//*125:*/
#line 2590 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
make_underlined(

scrap_pointer p)
{
#line 2597 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if((tok_loc= find_first_ident(p->trans))<=operator_found)
return;
xref_switch= def_flag;
underline_xref(*tok_loc%id_flag+name_dir);
}

/*:125*//*126:*/
#line 2608 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
underline_xref(
name_pointer p)
{
xref_pointer q= (xref_pointer)p->xref;
xref_pointer r;
sixteen_bits m;
sixteen_bits n;
if(no_xref)return;
m= section_count+xref_switch;
while(q!=xmem){
n= q->num;
if(n==m)return;
else if(m==n+def_flag){
q->num= m;return;
}
else if(n>=def_flag&&n<m)break;
q= q->xlink;
}
/*127:*/
#line 2638 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

append_xref(0);
xref_ptr->xlink= (xref_pointer)p->xref;r= xref_ptr;
update_node(p);
while(r->xlink!=q){r->num= r->xlink->num;r= r->xlink;}
r->num= m;

/*:127*/
#line 2628 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:126*//*182:*/
#line 3204 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
reduce(
scrap_pointer j,short k,
eight_bits c,
short d,short n)
{
scrap_pointer i;
j->cat= c;
if(k> 0){
j->trans= text_ptr;
j->mathness= 4*cur_mathness+init_mathness;
freeze_text();
}
if(k> 1){
for(i= j+k;i<=lo_ptr;i++)
*(i-k+1)= *i;
lo_ptr= lo_ptr-k+1;
}
pp= (pp+d<scrap_base?scrap_base:pp+d);
/*185:*/
#line 3260 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(tracing==fully){
printf("\n%d:",n);
for(i= scrap_base;i<=lo_ptr;i++){
putchar(i==pp?'*':' ');
if(i->mathness%4==yes_math)putchar('+');
else if(i->mathness%4==no_math)putchar('-');
print_cat(i->cat);
if(i->mathness/4==yes_math)putchar('+');
else if(i->mathness/4==no_math)putchar('-');
}
if(hi_ptr<=scrap_ptr)printf("...");
}

/*:185*/
#line 3224 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

pp--;
}

/*:182*//*183:*/
#line 3231 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
squash(
scrap_pointer j,short k,
eight_bits c,
short d,short n)
{
switch(k){
case 1:big_app1(j);break;
case 2:big_app2(j);break;
case 3:big_app3(j);break;
case 4:big_app4(j);break;
default:confusion("squash");
}
reduce(j,k,c,d,n);
}

/*:183*//*188:*/
#line 3326 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static text_pointer
translate(void)
{
scrap_pointer j;
pp= scrap_base;lo_ptr= pp-1;hi_ptr= pp;
/*192:*/
#line 3365 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(tracing==fully){
#line 856 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf(_("\nTracing after l. %d:\n"),cur_line);mark_harmless();
#line 3368 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(loc> buffer+50){
printf("...");
term_write(loc-51,51);
}
else term_write(buffer,loc-buffer);
}

/*:192*/
#line 3332 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*186:*/
#line 3287 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

while(true){
/*187:*/
#line 3306 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(lo_ptr<pp+3){
while(hi_ptr<=scrap_ptr&&lo_ptr!=pp+3)
*(++lo_ptr)= *(hi_ptr++);
for(j= lo_ptr+1;j<=pp+3;j++)j->cat= 0;
}

/*:187*/
#line 3289 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(tok_ptr+safe_tok_incr> tok_mem_end){
if(tok_ptr> max_tok_ptr)max_tok_ptr= tok_ptr;
#line 832 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
overflow(_("token"));
#line 3293 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}
if(text_ptr+safe_text_incr> tok_start_end){
if(text_ptr> max_text_ptr)max_text_ptr= text_ptr;
#line 838 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
overflow(_("text"));
#line 3297 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}
if(pp> lo_ptr)break;
init_mathness= cur_mathness= maybe_math;
/*121:*/
#line 2431 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==end_arg&&lhs_not_simple)
if(pp->cat==begin_arg)squash(pp,2,exp,-2,124);
else squash(pp,2,end_arg,-1,125);
else if(pp->cat==rbrack)reduce(pp,0,rpar,-3,130);
else if(pp->cat==using_like)reduce(pp,0,int_like,-3,140);
else if(cat1==insert)squash(pp,2,pp->cat,-2,0);
else if(cat2==insert)squash(pp+1,2,(pp+1)->cat,-1,0);
else if(cat3==insert)squash(pp+2,2,(pp+2)->cat,0,0);
else
switch(pp->cat){
case exp:/*128:*/
#line 641 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(cat1==lbrace||cat1==int_like||cat1==decl){
make_underlined(pp);make_ministring(pp);
if(indent_param_decl)big_app(dindent);big_app1(pp);
reduce(pp,1,fn_decl,0,1);
}
#line 2655 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
else if(cat1==unop)squash(pp,2,exp,-2,2);
else if((cat1==binop||cat1==ubinop)&&cat2==exp)
squash(pp,3,exp,-2,3);
else if(cat1==comma&&cat2==exp){
big_app2(pp);app(opt);app('9');big_app1(pp+2);reduce(pp,3,exp,-2,4);
}
else if(cat1==lpar&&cat2==rpar&&cat3==colon)reduce(pp+3,0,base,0,5);
else if(cat1==cast&&cat2==colon)reduce(pp+2,0,base,0,5);
else if(cat1==semi)squash(pp,2,stmt,-1,6);
else if(cat1==colon){
#line 652 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
make_underlined(pp);
if(tok_loc> operator_found){
strcpy(ministring_buf,"label");
new_meaning(((*tok_loc)%id_flag)+name_dir);
}
squash(pp,2,tag,-1,7);
#line 2666 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}
else if(cat1==rbrace)reduce(pp,0,stmt,-1,8);
else if(cat1==lpar&&cat2==rpar&&(cat3==const_like||cat3==case_like)){
big_app1_insert(pp+2,' ');reduce(pp+2,2,rpar,0,9);
}
else if(cat1==cast&&(cat2==const_like||cat2==case_like)){
big_app1_insert(pp+1,' ');reduce(pp+1,2,cast,0,9);
}
else if(cat1==exp||cat1==cast)squash(pp,2,exp,-2,10);
else if(cat1==attr){
big_app1_insert(pp,' ');reduce(pp,2,exp,-2,142);
}
else if(cat1==colcol&&cat2==int_like)squash(pp,3,int_like,-2,152);

/*:128*/
#line 2442 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case lpar:/*129:*/
#line 2680 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if((cat1==exp||cat1==ubinop)&&cat2==rpar)squash(pp,3,exp,-2,11);
else if(cat1==rpar){
big_app1_insert_str(pp,"\\,");

reduce(pp,2,exp,-2,12);
}
else if((cat1==decl_head||cat1==int_like||cat1==cast)&&cat2==rpar)
squash(pp,3,cast,-2,13);
else if((cat1==decl_head||cat1==int_like||cat1==exp)&&cat2==comma){
big_app3(pp);app(opt);app('9');reduce(pp,3,lpar,-1,14);
}
else if(cat1==stmt||cat1==decl){
big_app2(pp);big_app(' ');reduce(pp,2,lpar,-1,15);
}

/*:129*/
#line 2443 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case unop:/*130:*/
#line 2696 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==exp||cat1==int_like)squash(pp,2,exp,-2,16);

/*:130*/
#line 2444 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case ubinop:/*131:*/
#line 2699 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==cast&&cat2==rpar){
big_app('{');big_app1_insert(pp,'}');reduce(pp,2,cast,-2,17);
}
else if(cat1==exp||cat1==int_like){
big_app('{');big_app1_insert(pp,'}');reduce(pp,2,cat1,-2,18);
}
else if(cat1==binop){
big_app(math_rel);big_app1_insert(pp,'{');big_app('}');
big_app('}');reduce(pp,2,binop,-1,19);
}

/*:131*/
#line 2445 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case binop:/*132:*/
#line 2711 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==binop){
big_app(math_rel);big_app('{');big_app1(pp);big_app('}');
big_app('{');big_app1(pp+1);big_app('}');
big_app('}');reduce(pp,2,binop,-1,20);
}

/*:132*/
#line 2446 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case cast:/*133:*/
#line 2718 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==lpar)squash(pp,2,lpar,-1,21);
else if(cat1==exp){
big_app1_insert_str(pp,"\\,");

reduce(pp,2,exp,-2,21);
}
else if(cat1==semi)reduce(pp,0,exp,-2,22);

/*:133*/
#line 2447 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case sizeof_like:/*134:*/
#line 2727 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==cast)squash(pp,2,exp,-2,23);
else if(cat1==exp){
big_app1_insert(pp,' ');reduce(pp,2,exp,-2,24);
}

/*:134*/
#line 2448 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case int_like:/*135:*/
#line 2733 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==int_like||cat1==struct_like){
big_app1_insert(pp,' ');reduce(pp,2,cat1,-2,25);
}
else if(cat1==exp&&(cat2==raw_int||cat2==struct_like))
squash(pp,2,int_like,-2,26);
else if(cat1==exp||cat1==ubinop||cat1==colon){
big_app1(pp);big_app(' ');reduce(pp,1,decl_head,-1,27);
}
else if(cat1==semi||cat1==binop)reduce(pp,0,decl_head,0,28);

/*:135*/
#line 2449 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case public_like:/*136:*/
#line 2744 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==colon)squash(pp,2,tag,-1,29);
else reduce(pp,0,int_like,-2,30);

/*:136*/
#line 2450 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case colcol:/*137:*/
#line 2748 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==exp||cat1==int_like){
app(qualifier);squash(pp,2,cat1,-2,31);
}
else if(cat1==colcol)squash(pp,2,colcol,-1,32);

#line 680 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:137*/
#line 2451 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case decl_head:/*138:*/
#line 680 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(cat1==comma){
big_app2(pp);app(opt);app('9');reduce(pp,2,decl_head,-1,33);
}
else if(cat1==ubinop){
big_app1_insert(pp,'{');big_app('}');
reduce(pp,2,decl_head,-1,34);
}
else if(cat1==exp&&cat2!=lpar&&cat2!=lbrack&&cat2!=exp&&cat2!=cast){
make_underlined(pp+1);make_ministring(pp+1);
squash(pp,2,decl_head,-1,35);
}
else if((cat1==binop||cat1==colon)&&cat2==exp&&(cat3==comma||
cat3==semi||cat3==rpar))
squash(pp,3,decl_head,-1,36);
else if(cat1==cast)squash(pp,2,decl_head,-1,37);
else if(cat1==int_like||cat1==lbrace||cat1==decl){
if(indent_param_decl)big_app(dindent);
squash(pp,1,fn_decl,0,38);
}
else if(cat1==semi)squash(pp,2,decl,-1,39);
#line 2772 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
else if(cat1==attr){
big_app1_insert(pp,' ');reduce(pp,2,decl_head,-1,139);
}

#line 712 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:138*/
#line 2452 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case decl:/*139:*/
#line 712 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(cat1==decl){
big_app1_insert(pp,force);reduce(pp,2,decl,-1,40);
}
else if(cat1==stmt||cat1==function){
big_app1_insert(pp,order_decl_stmt?big_force:force);
reduce(pp,2,cat1,-1,41);
}
#line 2783 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*:139*/
#line 2453 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case base:/*140:*/
#line 2784 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==int_like||cat1==exp){
if(cat2==comma){
big_app1_insert(pp,' ');big_app1(pp+2);
app(opt);app('9');reduce(pp,3,base,0,42);
}
else if(cat2==lbrace){
big_app1_insert(pp,' ');big_app(' ');big_app1(pp+2);
reduce(pp,3,lbrace,-2,43);
}
}

/*:140*/
#line 2454 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case struct_like:/*141:*/
#line 2796 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==lbrace){
big_app1_insert(pp,' ');reduce(pp,2,struct_head,0,44);
}
else if(cat1==exp||cat1==int_like){
if(cat2==lbrace||cat2==semi){
#line 725 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
make_underlined(pp+1);make_reserved(pp+1);make_ministring(pp+1);
#line 2803 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
big_app1_insert(pp,' ');
if(cat2==semi)reduce(pp,2,decl_head,0,45);
else{
big_app(' ');big_app1(pp+2);reduce(pp,3,struct_head,0,46);
}
}
else if(cat2==colon)reduce(pp+2,0,base,2,47);
else if(cat2!=base){
big_app1_insert(pp,' ');reduce(pp,2,int_like,-2,48);
}
}
else if(cat1==attr){
big_app1_insert(pp,' ');reduce(pp,2,struct_like,-3,141);
}
else if(cat1==struct_like){
big_app1_insert(pp,' ');reduce(pp,2,struct_like,-3,151);
}

/*:141*/
#line 2455 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case struct_head:/*142:*/
#line 2821 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if((cat1==decl||cat1==stmt||cat1==function)&&cat2==rbrace){
big_app1(pp);big_app(indent);big_app(force);big_app1(pp+1);
big_app(outdent);big_app(force);big_app1(pp+2);
reduce(pp,3,int_like,-2,49);
}
else if(cat1==rbrace){
big_app1_insert_str(pp,"\\,");

reduce(pp,2,int_like,-2,50);
}

#line 738 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:142*/
#line 2456 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case fn_decl:/*143:*/
#line 738 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(cat1==decl){
big_app1_insert(pp,force);reduce(pp,2,fn_decl,0,51);
}
else if(cat1==stmt){
big_app1(pp);
if(indent_param_decl){
app(outdent);app(outdent);
}
big_app(force);big_app1(pp+1);reduce(pp,2,function,-1,52);
}
#line 2841 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
else if(cat1==attr){
big_app1_insert(pp,' ');reduce(pp,2,fn_decl,0,157);
}

/*:143*/
#line 2457 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case function:/*144:*/
#line 2845 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==stmt||cat1==decl||cat1==function){
big_app1_insert(pp,big_force);reduce(pp,2,cat1,-1,53);
}

/*:144*/
#line 2458 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case lbrace:/*145:*/
#line 2850 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==rbrace){
big_app1_insert_str(pp,"\\,");

reduce(pp,2,stmt,-1,54);
}
else if((cat1==stmt||cat1==decl||cat1==function)&&cat2==rbrace){
big_app(force);big_app1(pp);big_app(indent);
big_app(force_first?force:break_space);
big_app1(pp+1);big_app(force);big_app(backup);big_app1(pp+2);
big_app(outdent);big_app(force);reduce(pp,3,stmt,-1,55);
}
else if(cat1==exp){
if(cat2==rbrace)squash(pp,3,exp,-2,56);
else if(cat2==comma&&cat3==rbrace)squash(pp,4,exp,-2,56);
}

/*:145*/
#line 2459 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case if_like:/*146:*/
#line 2867 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==exp){
big_app1_insert(pp,' ');reduce(pp,2,if_clause,0,57);
}

/*:146*/
#line 2460 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case else_like:/*147:*/
#line 2872 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==colon)reduce(pp+1,0,base,1,58);
else if(cat1==lbrace)reduce(pp,0,else_head,0,59);
else if(cat1==stmt){
big_app(force);big_app1(pp);big_app(indent);big_app(break_space);
big_app1(pp+1);big_app(outdent);big_app(force);
reduce(pp,2,stmt,-1,60);
}

/*:147*/
#line 2461 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case else_head:/*148:*/
#line 2881 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==stmt||cat1==exp){
big_app(force);big_app1(pp);big_app(break_space);app(noop);
big_app(cancel);big_app1(pp+1);big_app(force);
reduce(pp,2,stmt,-1,61);
}

/*:148*/
#line 2462 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case if_clause:/*149:*/
#line 2888 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==lbrace)reduce(pp,0,if_head,0,62);
else if(cat1==stmt){
if(cat2==else_like){
big_app(force);big_app1(pp);big_app(indent);big_app(break_space);
big_app1(pp+1);big_app(outdent);big_app(force);big_app1(pp+2);
if(cat3==if_like){
big_app(' ');big_app1(pp+3);reduce(pp,4,if_like,0,63);
}
else reduce(pp,3,else_like,0,64);
}
else reduce(pp,0,else_like,0,65);
}
else if(cat1==attr){
big_app1_insert(pp,' ');reduce(pp,2,if_head,0,146);
}

/*:149*/
#line 2463 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case if_head:/*150:*/
#line 2905 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==stmt||cat1==exp){
if(cat2==else_like){
big_app(force);big_app1(pp);big_app(break_space);app(noop);
big_app(cancel);big_app1_insert(pp+1,force);
if(cat3==if_like){
big_app(' ');big_app1(pp+3);reduce(pp,4,if_like,0,66);
}
else reduce(pp,3,else_like,0,67);
}
else reduce(pp,0,else_head,0,68);
}

/*:150*/
#line 2464 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case do_like:/*151:*/
#line 2918 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==stmt&&cat2==else_like&&cat3==semi){
if(!force_lines)big_app(force);
big_app1(pp);big_app(break_space);app(noop);big_app(cancel);
big_app1(pp+1);big_app(cancel);app(noop);big_app(break_space);
big_app2(pp+2);
if(!force_lines)big_app(force);
reduce(pp,4,stmt,-1,69);
}

/*:151*/
#line 2465 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case case_like:/*152:*/
#line 2928 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==semi)squash(pp,2,stmt,-1,70);
else if(cat1==colon)squash(pp,2,tag,-1,71);
else if(cat1==exp){
big_app1_insert(pp,' ');reduce(pp,2,exp,-2,72);
}

/*:152*/
#line 2466 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case catch_like:/*153:*/
#line 2935 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==cast||cat1==exp){
#line 754 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
big_app1(pp);if(indent_param_decl)big_app(dindent);
big_app1(pp+1);reduce(pp,2,fn_decl,0,73);
#line 2938 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

/*:153*/
#line 2467 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case tag:/*154:*/
#line 2940 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==tag){
big_app1_insert(pp,break_space);reduce(pp,2,tag,-1,74);
}
else if(cat1==stmt||cat1==decl||cat1==function){
big_app(force);big_app(backup);big_app1_insert(pp,break_space);
reduce(pp,2,cat1,-1,75);
}
else if(cat1==rbrace)reduce(pp,0,decl,-1,156);

/*:154*/
#line 2468 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case stmt:/*156:*/
#line 2961 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==stmt||cat1==decl||cat1==function){
#line 762 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
big_app1_insert(pp,(cat1==decl||cat1==function)?
(order_decl_stmt?big_force:force):
(force_lines?force:break_space));reduce(pp,2,cat1,-1,76);
#line 2965 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

/*:156*/
#line 2469 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case semi:/*157:*/
#line 2967 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

big_app(' ');squash(pp,1,stmt,-1,77);

/*:157*/
#line 2470 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case lproc:/*158:*/
#line 2970 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 770 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(cat1==define_like){
make_underlined(pp+2);
if(tok_loc> operator_found){


}
}
#line 2972 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(cat1==if_like||cat1==else_like||cat1==define_like)
squash(pp,2,lproc,0,78);
else if(cat1==rproc){
app(inserted);squash(pp,2,insert,-1,79);
}else if(cat1==exp||cat1==function){
if(cat2==rproc){
app(inserted);big_app1_insert(pp,' ');big_app1(pp+2);
reduce(pp,3,insert,-1,80);
}
else if(cat1==exp&&cat2==exp&&cat3==rproc){
app(inserted);big_app1_insert(pp,' ');app_str("\\5");

big_app2(pp+2);reduce(pp,4,insert,-1,80);
}
}

/*:158*/
#line 2471 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case section_scrap:/*159:*/
#line 2988 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==semi){
big_app2(pp);big_app(force);reduce(pp,2,stmt,-2,81);
}
else reduce(pp,0,exp,-2,82);

/*:159*/
#line 2472 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case insert:/*160:*/
#line 2994 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==function)
squash(pp,2,function,0,83);

/*:160*/
#line 2473 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case prelangle:/*161:*/
#line 2998 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

init_mathness= cur_mathness= yes_math;
app('<');reduce(pp,1,binop,-2,84);

/*:161*/
#line 2474 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case prerangle:/*162:*/
#line 3002 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

init_mathness= cur_mathness= yes_math;
app('>');reduce(pp,1,binop,-2,85);

/*:162*/
#line 2475 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case langle:/*163:*/
#line 3009 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==prerangle){
big_app1_insert_str(pp,"\\,");

reduce(pp,2,cast,-1,86);
}
else if(cat1==decl_head||cat1==int_like||cat1==exp){
if(cat2==prerangle)squash(pp,3,cast,-1,87);
else if(cat2==comma){
big_app3(pp);app(opt);app('9');reduce(pp,3,langle,0,88);
}
}
else if((cat1==struct_like)
&&(cat2==exp||cat2==int_like)
&&(cat3==comma||cat3==prerangle)){
make_underlined(pp+2);if(reserve_typenames)make_reserved(pp+2);
big_app2_insert(pp,' ');
if(cat3==comma){
app(opt);app('9');reduce(pp,4,langle,0,153);
}
else reduce(pp,4,cast,-1,154);
}

/*:163*/
#line 2476 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case template_like:/*164:*/
#line 3032 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==exp&&cat2==prelangle)reduce(pp+2,0,langle,2,89);
else if(cat1==exp||cat1==raw_int){
big_app1_insert(pp,' ');reduce(pp,2,cat1,-2,90);
}
else if(cat1==cast&&cat2==struct_like){
big_app1_insert(pp,' ');reduce(pp,2,struct_like,0,155);
}
else reduce(pp,0,raw_int,0,91);

/*:164*/
#line 2477 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case new_like:/*165:*/
#line 3042 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==lpar&&cat2==exp&&cat3==rpar)squash(pp,4,new_like,0,92);
else if(cat1==cast){
big_app1_insert(pp,' ');reduce(pp,2,exp,-2,93);
}
else if(cat1!=lpar)reduce(pp,0,new_exp,0,94);

/*:165*/
#line 2478 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case new_exp:/*166:*/
#line 3049 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==int_like||cat1==const_like){
big_app1_insert(pp,' ');reduce(pp,2,new_exp,0,95);
}
else if(cat1==struct_like&&(cat2==exp||cat2==int_like)){
big_app1_insert(pp,' ');big_app(' ');
big_app1(pp+2);reduce(pp,3,new_exp,0,96);
}
else if(cat1==raw_ubin){
big_app1_insert(pp,'{');big_app('}');reduce(pp,2,new_exp,0,97);
}
else if(cat1==lpar)reduce(pp,0,exp,-2,98);
else if(cat1==exp){
big_app1(pp);big_app(' ');reduce(pp,1,exp,-2,98);
}
else if(cat1!=raw_int&&cat1!=struct_like&&cat1!=colcol)
reduce(pp,0,exp,-2,99);

/*:166*/
#line 2479 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case ftemplate:/*167:*/
#line 3067 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 783 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(cat1==prelangle)reduce(pp+1,0,langle,1,121);
else reduce(pp,0,exp,-2,122);
#line 3070 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*:167*/
#line 2480 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case for_like:/*168:*/
#line 3071 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==exp){
#line 790 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
big_app1_insert(pp,' ');reduce(pp,2,else_like,-2,123);
#line 3074 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

/*:168*/
#line 2481 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case raw_ubin:/*169:*/
#line 3076 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==const_like){
big_app2(pp);app_str("\\ ");reduce(pp,2,raw_ubin,0,103);

}
else reduce(pp,0,ubinop,-2,104);

/*:169*/
#line 2482 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case const_like:/*170:*/
#line 3083 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

reduce(pp,0,int_like,-2,105);

/*:170*/
#line 2483 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case raw_int:/*171:*/
#line 3086 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==prelangle)reduce(pp+1,0,langle,1,106);
else if(cat1==colcol)squash(pp,2,colcol,-1,107);
else if(cat1==cast)squash(pp,2,raw_int,0,108);
else if(cat1==lpar)reduce(pp,0,exp,-2,109);
else if(cat1==lbrack)reduce(pp,0,exp,-2,144);
else if(cat1!=langle)reduce(pp,0,int_like,-3,110);

/*:171*/
#line 2484 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case operator_like:/*172:*/
#line 3094 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==binop||cat1==unop||cat1==ubinop){
if(cat2==binop)break;
big_app1_insert(pp,'{');big_app('}');reduce(pp,2,exp,-2,111);
}
else if(cat1==new_like||cat1==delete_like){
big_app1_insert(pp,' ');reduce(pp,2,exp,-2,112);
}
else if(cat1==comma)squash(pp,2,exp,-2,113);
else if(cat1!=raw_ubin)reduce(pp,0,new_exp,0,114);

#line 810 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:172*/
#line 2485 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case typedef_like:/*173:*/
#line 816 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(cat1==decl_head){
if((cat2==exp&&cat3!=lpar&&cat3!=exp)||cat2==int_like){
make_underlined(pp+2);make_reserved(pp+2);make_ministring(pp+2);
squash(pp+1,2,decl_head,0,200);
}
else if(cat2==semi){
big_app1(pp);big_app(' ');big_app2(pp+1);reduce(pp,3,decl,-1,201);
}
}else if(cat1==int_like&&cat2==raw_int&&
(cat3==semi||cat3==comma))reduce(pp+2,0,exp,1,202);
#line 3120 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*:173*/
#line 2486 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case delete_like:/*174:*/
#line 3121 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==lbrack&&cat2==rbrack){
big_app1(pp);big_app1_insert_str(pp+1,"\\,");

reduce(pp,3,delete_like,0,121);
}
else if(cat1==exp){
big_app1_insert(pp,' ');reduce(pp,2,exp,-2,122);
}

/*:174*/
#line 2487 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case question:/*175:*/
#line 3131 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==exp&&(cat2==colon||cat2==base)){
(pp+2)->mathness= 5*yes_math;
squash(pp,3,binop,-2,123);
}

/*:175*/
#line 2488 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case alignas_like:/*176:*/
#line 3137 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==decl_head)squash(pp,2,attr,-1,126);
else if(cat1==exp)squash(pp,2,attr,-1,127);
else if(cat1==cast)squash(pp,2,attr,-1,158);

/*:176*/
#line 2489 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case lbrack:/*177:*/
#line 3142 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==lbrack)
if(cat2==rbrack&&cat3==rbrack)squash(pp,4,exp,-2,147);
else squash(pp,2,attr_head,-1,128);
else reduce(pp,0,lpar,-1,129);

/*:177*/
#line 2490 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case attr_head:/*178:*/
#line 3148 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==rbrack&&cat2==rbrack)squash(pp,3,attr,-1,131);
else if(cat1==exp)squash(pp,2,attr_head,0,132);
else if(cat1==using_like&&cat2==exp&&cat3==colon){
big_app2_insert(pp,' ');big_app(' ');
reduce(pp,4,attr_head,0,133);
}
else if(cat1==comma)squash(pp,2,attr_head,0,145);

/*:178*/
#line 2491 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case attr:/*179:*/
#line 3157 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==lbrace||cat1==stmt){
big_app1_insert(pp,' ');reduce(pp,2,cat1,-2,134);
}
else if(cat1==tag){
big_app1_insert(pp,' ');reduce(pp,2,tag,-1,135);
}
else if(cat1==semi)squash(pp,2,stmt,-2,136);
else if(cat1==attr){
big_app1_insert(pp,' ');reduce(pp,2,attr,-1,137);
}
else if(cat1==decl_head){
big_app1_insert(pp,' ');reduce(pp,2,decl_head,-1,138);
}
else if(cat1==typedef_like){
big_app1_insert(pp,' ');reduce(pp,2,typedef_like,0,143);
}
else if(cat1==function){
big_app1_insert(pp,' ');reduce(pp,2,function,-1,148);
}

/*:179*/
#line 2492 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case default_like:/*180:*/
#line 3178 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(cat1==colon)reduce(pp,0,case_like,-3,149);
else reduce(pp,0,exp,-2,150);

/*:180*/
#line 2493 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
}
pp++;

/*:121*/
#line 3300 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:186*/
#line 3333 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*190:*/
#line 3344 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*191:*/
#line 3355 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(lo_ptr> scrap_base&&tracing==partly){
#line 850 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf(_("\nIrreducible scrap sequence in section %d:"),(int)section_count);
#line 3358 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

mark_harmless();
for(j= scrap_base;j<=lo_ptr;j++){
putchar(' ');print_cat(j->cat);
}
}

/*:191*/
#line 3345 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

for(j= scrap_base;j<=lo_ptr;j++){
if(j!=scrap_base)app(' ');
if(j->mathness%4==yes_math)app('$');
app(tok_flag+(int)(j->trans-tok_start));
if(j->mathness/4==yes_math)app('$');
#line 844 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(tok_ptr+6> tok_mem_end)overflow(_("token"));
#line 3352 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}
freeze_text();return text_ptr-1;

/*:190*/
#line 3334 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:188*//*193:*/
#line 3391 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
C_parse(
eight_bits spec_ctrl)
{
while(next_control<format_code||next_control==spec_ctrl){
/*196:*/
#line 3415 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*197:*/
#line 3492 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(scrap_ptr+safe_scrap_incr> scrap_info_end||
tok_ptr+safe_tok_incr> tok_mem_end||
text_ptr+safe_text_incr> tok_start_end){
if(scrap_ptr> max_scr_ptr)max_scr_ptr= scrap_ptr;
if(tok_ptr> max_tok_ptr)max_tok_ptr= tok_ptr;
if(text_ptr> max_text_ptr)max_text_ptr= text_ptr;
#line 869 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
overflow(_("scrap/token/text"));
#line 3500 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

/*:197*/
#line 3416 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

switch(next_control){
case section_name:
app(section_flag+(int)(cur_section-name_dir));
app_scrap(section_scrap,maybe_math);
app_scrap(exp,yes_math);break;
case string:case constant:case verbatim:
/*199:*/
#line 3548 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{int count= -1;
switch(next_control){
case constant:app_str("\\T{");break;

case string:count= 20;app_str("\\.{");break;

default:app_str("\\vb{");

}
while(id_first<id_loc){
if(count==0){
app_str("}\\)\\.{");count= 20;

}
switch(*id_first){
case' ':case'\\':case'#':case'$':case'^':case'{':case'}':
case'~':case'&':case'_':app('\\');break;










case'%':if(next_control==constant){
app_str("}\\p{");
id_first++;
}
else app('\\');
break;


case'@':if(*(id_first+1)=='@')id_first++;
#line 875 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
else err_print(_("! Double @ should be used in strings"));
#line 3585 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

break;
default:

if((eight_bits)(*id_first)> 0177)
app_tok(quoted_char)
}
app_tok(*id_first++);
count--;
}
app('}');
app_scrap(exp,maybe_math);
}

/*:199*/
#line 3423 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case identifier:app_cur_id(true);break;
case TeX_string:
/*200:*/
#line 3614 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

app_str("\\hbox{");

while(id_first<id_loc){
if((eight_bits)(*id_first)> 0177)
app_tok(quoted_char)
else
if(*id_first=='@')id_first++;
app_tok(*id_first++);
}
app('}');

/*:200*/
#line 3426 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case'/':case'.':
app(next_control);app_scrap(binop,yes_math);break;
case'<':app_str("\\langle");app_scrap(prelangle,yes_math);break;

case'>':app_str("\\rangle");app_scrap(prerangle,yes_math);break;

case'=':app_str("\\K");app_scrap(binop,yes_math);break;

case'|':app_str("\\OR");app_scrap(binop,yes_math);break;

case'^':app_str("\\XOR");app_scrap(binop,yes_math);break;

case'%':app_str("\\MOD");app_scrap(binop,yes_math);break;

case'!':app_str("\\R");app_scrap(unop,yes_math);break;

case'~':app_str("\\CM");app_scrap(unop,yes_math);break;

case'+':case'-':app(next_control);app_scrap(ubinop,yes_math);break;
case'*':app(next_control);app_scrap(raw_ubin,yes_math);break;
case'&':app_str("\\AND");app_scrap(raw_ubin,yes_math);break;

case'?':app_str("\\?");app_scrap(question,yes_math);break;

case'#':app_str("\\#");app_scrap(ubinop,yes_math);break;

#line 862 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case ignore:case xref_roman:case xref_wildcard:
case meaning:case suppress:
#line 3454 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
case xref_typewriter:case noop:break;
case'(':app(next_control);app_scrap(lpar,maybe_math);break;
case')':app(next_control);app_scrap(rpar,maybe_math);break;
case'[':app(next_control);app_scrap(lbrack,maybe_math);break;
case']':app(next_control);app_scrap(rbrack,maybe_math);break;
case'{':app_str("\\{");app_scrap(lbrace,yes_math);break;

case'}':app_str("\\}");app_scrap(rbrace,yes_math);break;

case',':app(',');app_scrap(comma,yes_math);break;
case';':app(';');app_scrap(semi,maybe_math);break;
case':':app(':');app_scrap(colon,no_math);break;
/*198:*/
#line 3506 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

case non_eq:app_str("\\I");app_scrap(binop,yes_math);break;

case lt_eq:app_str("\\Z");app_scrap(binop,yes_math);break;

case gt_eq:app_str("\\G");app_scrap(binop,yes_math);break;

case eq_eq:app_str("\\E");app_scrap(binop,yes_math);break;

case and_and:app_str("\\W");app_scrap(binop,yes_math);break;

case or_or:app_str("\\V");app_scrap(binop,yes_math);break;

case plus_plus:app_str("\\PP");app_scrap(unop,yes_math);break;

case minus_minus:app_str("\\MM");app_scrap(unop,yes_math);break;

case minus_gt:app_str("\\MG");app_scrap(binop,yes_math);break;

case gt_gt:app_str("\\GG");app_scrap(binop,yes_math);break;

case lt_lt:app_str("\\LL");app_scrap(binop,yes_math);break;

case dot_dot_dot:app_str("\\,\\ldots\\,");app_scrap(raw_int,yes_math);
break;


case colon_colon:app_str("\\DC");app_scrap(colcol,maybe_math);break;

case period_ast:app_str("\\PA");app_scrap(binop,yes_math);break;

case minus_gt_ast:app_str("\\MGA");app_scrap(binop,yes_math);break;


/*:198*/
#line 3466 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

case thin_space:app_str("\\,");app_scrap(insert,maybe_math);break;

case math_break:app(opt);app('0');
app_scrap(insert,maybe_math);break;
case line_break:app(force);app_scrap(insert,no_math);break;
case left_preproc:app(force);app(preproc_line);app_str("\\#");
app_scrap(lproc,no_math);break;

case right_preproc:app(force);app_scrap(rproc,no_math);break;
case big_line_break:app(big_force);app_scrap(insert,no_math);break;
case no_line_break:app(big_cancel);app(noop);app(break_space);
app(noop);app(big_cancel);
app_scrap(insert,no_math);break;
case pseudo_semi:app_scrap(semi,maybe_math);break;
case macro_arg_open:app_scrap(begin_arg,maybe_math);break;
case macro_arg_close:app_scrap(end_arg,maybe_math);break;
case join:app_str("\\J");app_scrap(insert,no_math);break;

case output_defs_code:app(force);app_str("\\ATH");app(force);
app_scrap(insert,no_math);break;

default:app(inserted);app(next_control);
app_scrap(insert,maybe_math);break;
}

/*:196*/
#line 3397 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

next_control= get_next();
if(next_control=='|'||next_control==begin_comment||
next_control==begin_short_comment)return;
}
}

/*:193*//*202:*/
#line 3634 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
app_cur_id(
bool scrapping)
{
name_pointer p= id_lookup(id_first,id_loc,normal);
if(p->ilk<=custom){
app(id_flag+(int)(p-name_dir));
if(scrapping)app_scrap(p->ilk==func_template?ftemplate:exp,
p->ilk==custom?yes_math:maybe_math);

}else{
app(res_flag+(int)(p-name_dir));
if(scrapping){
if(p->ilk==alfop)app_scrap(ubinop,yes_math)
#line 883 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
else app_scrap(p->ilk,maybe_math);
}
}
/*293:*/
#line 1781 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

{struct perm_meaning*q= get_meaning(p);
if(!abnormal(p)||strcmp(q->perm.tex_part,"\\uninitialized")!=0)
if(q->link==NULL){
q->link= top_usage;
top_usage= q;
}
}


/*:293*/
#line 886 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

#line 3652 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

/*:202*//*203:*/
#line 3659 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static text_pointer
C_translate(void)
{
text_pointer p;
scrap_pointer save_base= scrap_base;
scrap_base= scrap_ptr+1;
C_parse(section_name);
#line 892 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(next_control!='|')err_print(_("! Missing '|' after C text"));
#line 3668 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

app_tok(cancel);app_scrap(insert,maybe_math);

p= translate();
if(scrap_ptr> max_scr_ptr)max_scr_ptr= scrap_ptr;
scrap_ptr= scrap_base-1;scrap_base= save_base;
return p;
}

/*:203*//*205:*/
#line 3691 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
outer_parse(void)
{
int bal;
text_pointer p,q;
while(next_control<format_code)
if(next_control!=begin_comment&&next_control!=begin_short_comment)
C_parse(ignore);
else{
bool is_long_comment= (next_control==begin_comment);
/*197:*/
#line 3492 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(scrap_ptr+safe_scrap_incr> scrap_info_end||
tok_ptr+safe_tok_incr> tok_mem_end||
text_ptr+safe_text_incr> tok_start_end){
if(scrap_ptr> max_scr_ptr)max_scr_ptr= scrap_ptr;
if(tok_ptr> max_tok_ptr)max_tok_ptr= tok_ptr;
if(text_ptr> max_text_ptr)max_text_ptr= text_ptr;
#line 869 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
overflow(_("scrap/token/text"));
#line 3500 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

/*:197*/
#line 3702 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

app(cancel);app(inserted);
if(is_long_comment)app_str("\\C{");

else app_str("\\SHC{");

bal= copy_comment(is_long_comment,1);next_control= ignore;
while(bal> 0){
p= text_ptr;freeze_text();q= C_translate();

#line 904 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
app(tok_flag+(int)(p-tok_start));
app(inserted);
#line 3713 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(make_pb)app_str("\\PB{");

app(inner_tok_flag+(int)(q-tok_start));
if(make_pb)app_tok('}');
if(next_control=='|'){
bal= copy_comment(is_long_comment,bal);
next_control= ignore;
}
else bal= 0;
}
app(force);app_scrap(insert,no_math);

}
}

/*:205*//*211:*/
#line 3803 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
push_level(
text_pointer p)
{
#line 911 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(stack_ptr==stack_end)overflow(_("stack"));
#line 3809 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(stack_ptr> stack)
*stack_ptr= cur_state;
stack_ptr++;
if(stack_ptr> max_stack_ptr)max_stack_ptr= stack_ptr;
cur_tok= *p;cur_end= *(p+1);
}

/*:211*//*215:*/
#line 3841 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static eight_bits
get_output(void)
{
sixteen_bits a;
restart:while(cur_tok==cur_end)pop_level();
a= *(cur_tok++);
if(a>=0400){
cur_name= a%id_flag+name_dir;
switch(a/id_flag){
case 2:return res_word;
case 3:return section_code;
case 4:push_level(a%id_flag+tok_start);goto restart;

case 5:push_level(a%id_flag+tok_start);cur_mode= inner;goto restart;

default:return identifier;
}
}
return(eight_bits)a;
}

/*:215*//*216:*/
#line 3878 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
output_C(void)
{
token_pointer save_tok_ptr= tok_ptr;
text_pointer save_text_ptr= text_ptr;
sixteen_bits save_next_control= next_control;
text_pointer p;
next_control= ignore;p= C_translate();
app(inner_tok_flag+(int)(p-tok_start));
if(make_pb)out_str("\\PB{");

make_output();
if(make_pb)out('}');
if(text_ptr> max_text_ptr)max_text_ptr= text_ptr;
if(tok_ptr> max_tok_ptr)max_tok_ptr= tok_ptr;
text_ptr= save_text_ptr;tok_ptr= save_tok_ptr;
next_control= save_next_control;
}

/*:216*//*217:*/
#line 3900 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
make_output(void)
{
eight_bits a= 0;
eight_bits b;
int c;
char scratch[longest_name+1];
char*k,*k_limit;
char*j;
char*p;
char delim;
char*save_loc,*save_limit;
name_pointer cur_section_name;
bool save_mode;
bool dindent_pending= false;
app(end_translation);
freeze_text();push_level(text_ptr-1);
while(true){
a= get_output();
reswitch:switch(a){
case end_translation:return;
case identifier:case res_word:/*218:*/
#line 3962 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

out('\\');
if(a==identifier){
if(cur_name->ilk==custom&&!doing_format){
custom_out:
for(p= cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
out(*p=='_'?'x':*p=='$'?'X':*p);
break;
}
else if(is_tiny(cur_name))out('|')

else{delim= '.';
for(p= cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
if(xislower(*p)){
delim= '\\';break;
}
out(delim);
}


}
else if(cur_name->ilk==alfop){
out('X');
goto custom_out;
}
else out('&');

if(is_tiny(cur_name)){
if(isxalpha((cur_name->byte_start)[0]))
out('\\');
out((cur_name->byte_start)[0]);
}
else out_name(cur_name,true);

/*:218*/
#line 3922 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case section_code:/*222:*/
#line 4069 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

out_str("\\X");

cur_xref= (xref_pointer)cur_name->xref;
if((an_output= (cur_xref->num==file_flag))==true)cur_xref= cur_xref->xlink;
if(cur_xref->num>=def_flag){
out_section(cur_xref->num-def_flag);
if(phase==3){
cur_xref= cur_xref->xlink;
while(cur_xref->num>=def_flag){
out_str(", ");
out_section(cur_xref->num-def_flag);
cur_xref= cur_xref->xlink;
}
}
}
else out('0');
out(':');
if(an_output)out_str("\\.{");

/*223:*/
#line 4093 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

sprint_section_name(scratch,cur_name);
k= scratch;
k_limit= scratch+strlen(scratch);
cur_section_name= cur_name;
while(k<k_limit){
b= *(k++);
if(b=='@')/*224:*/
#line 4129 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(*k++!='@'){
#line 917 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf("%s",_("\n! Illegal control code in section name: <"));
#line 4132 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

print_section_name(cur_section_name);printf("> ");mark_error();
}

/*:224*/
#line 4100 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(an_output)
switch(b){
case' ':case'\\':case'#':case'%':case'$':case'^':
case'{':case'}':case'~':case'&':case'_':
out('\\');/* falls through */











default:out(b);
}
else
if(b!='|')out(b)
else{
/*225:*/
#line 4142 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

j= limit+1;*j= '|';delim= 0;
while(true){
if(k>=k_limit){
#line 923 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf("%s",_("\n! C text in section name didn't end: <"));
#line 4147 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

print_section_name(cur_section_name);printf("> ");mark_error();break;
}
b= *(k++);
if(b=='@'||(b=='\\'&&delim!=0))
/*226:*/
#line 4165 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
#line 935 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(j> buffer+long_buf_size-4)overflow(_("buffer"));
#line 4167 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
*(++j)= b;*(++j)= *(k++);
}

/*:226*/
#line 4152 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else{
if(b=='\''||b=='"'){
if(delim==0)delim= b;
else if(delim==b)delim= 0;}
if(b!='|'||delim!=0){
#line 929 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(j> buffer+long_buf_size-3)overflow(_("buffer"));
#line 4159 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
*(++j)= b;
}
else break;
}
}

/*:225*/
#line 4122 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

save_loc= loc;save_limit= limit;loc= limit+2;limit= j+1;
*limit= '|';output_C();
loc= save_loc;limit= save_limit;
}
}

/*:223*/
#line 4089 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(an_output)cur_mode==inner?out_str("}"):out_str("\\,}");
out_str("\\X");

/*:222*/
#line 3923 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case math_rel:out_str("\\MRL{");/* fall through */

case noop:case inserted:break;
case cancel:case big_cancel:c= 0;b= a;
while(true){
a= get_output();
if(a==inserted)continue;
if((a<indent&&!(b==big_cancel&&a==' '))
||(a> big_force&&a!=dindent))break;
switch(a){
case dindent:c++;/* fall through */
case indent:c++;break;
case outdent:c--;break;
case opt:a= get_output();
}
}
/*221:*/
#line 4056 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

for(;c> 0;c--)out_str("\\1");

for(;c<0;c++)out_str("\\2");


/*:221*/
#line 3940 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

goto reswitch;
case dindent:a= get_output();
if(a!=big_force){
out_str("\\1\\1");goto reswitch;
}
else dindent_pending= true;/* fall through */
case indent:case outdent:case opt:case backup:case break_space:
case force:case big_force:case preproc_line:/*219:*/
#line 3999 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(a<break_space||a==preproc_line){
if(cur_mode==outer){
out('\\');out(a-cancel+'0');





if(a==opt){
b= get_output();
if(b!='0'||force_lines==false)out(b)
else out_str("{-1}");
}
}else if(a==opt)b= get_output();
}
else/*220:*/
#line 4023 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
b= a;save_mode= cur_mode;
if(dindent_pending){
c= 2;dindent_pending= false;
}else c= 0;
while(true){
a= get_output();
if(a==inserted)continue;
if(a==cancel||a==big_cancel){
/*221:*/
#line 4056 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

for(;c> 0;c--)out_str("\\1");

for(;c<0;c++)out_str("\\2");


/*:221*/
#line 4032 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

goto reswitch;
}
if((a!=' '&&a<indent)||a==backup||a> big_force){
if(save_mode==outer){
if(out_ptr> out_buf+3&&strncmp(out_ptr-3,"\\Y\\B",4)==0)
goto reswitch;
/*221:*/
#line 4056 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

for(;c> 0;c--)out_str("\\1");

for(;c<0;c++)out_str("\\2");


/*:221*/
#line 4039 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

out('\\');out(b-cancel+'0');



if(a!=end_translation)finish_line();
}
else if(a!=end_translation&&cur_mode==inner)out(' ');
goto reswitch;
}
if(a==indent)c++;
else if(a==outdent)c--;
else if(a==opt)a= get_output();
else if(a> b)b= a;
}
}

/*:220*/
#line 4015 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"


/*:219*/
#line 3949 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;
case quoted_char:out(*(cur_tok++));/* fall through */
case qualifier:break;
default:out(a);
}
}
}

/*:217*//*227:*/
#line 4177 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
phase_two(void){
phase= 2;reset_input();
#line 941 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(show_progress)printf("%s",_("\nWriting the output file..."));
#line 4182 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 947 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
temp_switch= false;temp_meaning_ptr= temp_meaning_stack;
/*291:*/
#line 1732 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

memcpy(aux_file_name,tex_file_name,strlen(tex_file_name)-4);
strcat(aux_file_name,".bux");
include_depth= 1;
strcpy(cur_file_name,aux_file_name);
if((found_filename= kpse_find_cweb(cur_file_name))
&&(cur_file= fopen(found_filename,"r"))){
/*310:*/
#line 2020 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(strlen(found_filename)<max_file_name_length){
if(strcmp(cur_file_name,found_filename)){
strcpy(cur_file_name,found_filename+
((strncmp(found_filename,"./",2)==0)?2:0));
}
free(found_filename);
}else fatal(_("! Filename too long\n"),found_filename);

/*:310*/
#line 1739 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

cur_line= 0;include_depth++;
}
strcpy(aux_file_name+strlen(aux_file_name)-4,".aux");
strcpy(cur_file_name,aux_file_name);
if((cur_file= fopen(cur_file_name,"r"))){cur_line= 0;include_depth++;}
strcpy(cur_file_name,"system.bux");
if((found_filename= kpse_find_cweb(cur_file_name))
&&(cur_file= fopen(found_filename,"r"))){
/*310:*/
#line 2020 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(strlen(found_filename)<max_file_name_length){
if(strcmp(cur_file_name,found_filename)){
strcpy(cur_file_name,found_filename+
((strncmp(found_filename,"./",2)==0)?2:0));
}
free(found_filename);
}else fatal(_("! Filename too long\n"),found_filename);

/*:310*/
#line 1748 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

cur_line= 0;
}
else include_depth--;
if(include_depth){
while(get_next()==meaning);
if(include_depth)err_print(_("! Only @$ is allowed in aux and bux files"));
finish_line();loc= buffer;
}
if((aux_file= fopen(aux_file_name,"wb"))==NULL)
fatal(_("! Cannot open aux output file "),aux_file_name);


/*:291*/
#line 948 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

section_count= 0;format_visible= true;right_start_switch= false;copy_limbo();
#line 4184 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
finish_line();flush_buffer(out_buf,false,false);

while(!input_has_ended)/*230:*/
#line 963 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
{
section_count++;
temp_switch= false;temp_meaning_ptr= temp_meaning_stack;
top_usage= usage_sentinel;
#line 4216 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
/*231:*/
#line 4232 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 977 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(*(loc-1)!='*'){
if(right_start_switch){
out_str("\\shortpage\n");right_start_switch= false;

}
out_str("\\M");
}
#line 4234 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else{
while(*loc==' ')loc++;
if(*loc=='*'){
sec_depth= -1;
loc++;
}
else{
for(sec_depth= 0;xisdigit(*loc);loc++)
if(sec_depth<INT_MAX/10)sec_depth= sec_depth*10+(*loc)-'0';
}
while(*loc==' ')loc++;
group_found= true;
out_str("\\N");
#line 989 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(right_start_switch){
out('N');right_start_switch= false;

}
#line 4249 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{char s[32];snprintf(s,32,"{%d}",sec_depth+1);out_str(s);}
if(show_progress){
printf("*%d",(int)section_count);
update_terminal();
}
}
#line 999 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
out('{');out_section(section_count);out('}');
flush_buffer(out_ptr,false,false);
#line 4256 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*:231*/
#line 4216 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

save_position();
/*232:*/
#line 4260 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
do
switch(next_control= copy_TeX()){
case'|':init_stack();output_C();break;
#line 1006 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case'@':out('@');break;
case temp_meaning:temp_switch= !temp_switch;break;
case right_start:right_start_switch= true;break;
#line 4264 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
case TeX_string:case verbatim:case noop:
case xref_roman:case xref_wildcard:case xref_typewriter:
#line 1014 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case meaning:case suppress:
case section_name:loc-= 2;next_control= get_next();
#line 4267 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(next_control==TeX_string)
#line 1021 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! TeX string should be in C text only"));
#line 4269 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(next_control==verbatim)
#line 1027 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Verbatim string should be in C text only"));
#line 4272 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
break;

case thin_space:case math_break:case ord:
case line_break:case big_line_break:case no_line_break:case join:
case pseudo_semi:case macro_arg_open:case macro_arg_close:
case output_defs_code:
#line 1033 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! You can't do that in TeX text"));break;
#line 4279 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
while(next_control<format_code);

/*:232*/
#line 4218 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*233:*/
#line 4286 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

space_checked= false;
while(next_control<=definition){
init_stack();
if(next_control==definition)/*236:*/
#line 1051 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
{
is_macro= true;
#line 4345 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(save_line!=out_line||save_place!=out_ptr||space_checked)app(backup);
if(!space_checked){emit_space_if_needed();save_position();}
app_str("\\D");

if((next_control= get_next())!=identifier)
#line 1058 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! Improper macro definition"));
#line 1066 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

else{
id_being_defined= id_lookup(id_first,id_loc,normal);
app('$');app_cur_id(false);
def_diff= (*loc!='(');
#line 4354 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(*loc=='('){
reswitch:switch(next_control= get_next()){
case'(':case',':app(next_control);goto reswitch;
case identifier:app_cur_id(false);goto reswitch;
case')':app(next_control);next_control= get_next();break;
case dot_dot_dot:app_str("\\,\\ldots\\,");
app_scrap(raw_int,no_math);
if((next_control= get_next())==')'){
app(next_control);next_control= get_next();break;
#line 1077 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
}/* otherwise fall through */
default:err_print(_("! Improper macro definition"));break;
#line 4365 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}
}
else next_control= get_next();
app_str("$ ");app(break_space);
app_scrap(dead,no_math);
}
}

#line 1085 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:236*/
#line 4290 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else/*237:*/
#line 1085 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
{
doing_format= true;
is_macro= false;
#line 4375 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(*(loc-1)=='s'||*(loc-1)=='S')format_visible= false;
if(!space_checked){emit_space_if_needed();save_position();}
app_str("\\F");

next_control= get_next();
if(next_control==identifier){
app(id_flag+(int)(id_lookup(id_first,id_loc,normal)-name_dir));
app(break_space);
next_control= get_next();
if(next_control==identifier){
app(id_flag+(int)(id_lookup(id_first,id_loc,normal)-name_dir));
app_scrap(exp,maybe_math);app_scrap(semi,maybe_math);
next_control= get_next();
}
}
#line 1093 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(scrap_ptr!=scrap_info+2)err_print(_("! Improper format definition"));
#line 4391 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:237*/
#line 4291 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 1041 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
outer_parse();
if(is_macro)/*289:*/
#line 1707 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

{
ms_mode= true;ministring_ptr= ministring_buf;
*ministring_ptr++= '=';
if(def_diff){
scrap_pointer s= scrap_ptr;
text_pointer t;
token_pointer j;
while(s->cat==insert)s--;
if((s-1)->cat==dead&&s->cat==exp&&**(t= s->trans)=='\\'
&&*(*t+1)=='T')
for(j= *t;j<*(t+1);j++)*ministring_ptr++= *j;
else out_str("macro");
}else out_str("macro (\\,)");
new_meaning(id_being_defined);
}


/*:289*/
#line 1042 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

finish_C(format_visible);format_visible= true;
doing_format= false;
}
#line 4295 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*:233*/
#line 4219 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*239:*/
#line 4401 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

this_section= name_dir;
if(next_control<=section_name){
emit_space_if_needed();init_stack();
if(next_control==begin_C)next_control= get_next();
else{
this_section= cur_section;
/*240:*/
#line 4421 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

do next_control= get_next();
while(next_control=='+');
if(next_control!='='&&next_control!=eq_eq)
#line 1099 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! You need an = sign after the section name"));
#line 4426 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else next_control= get_next();
if(out_ptr> out_buf+1&&*out_ptr=='Y'&&*(out_ptr-1)=='\\')app(backup);


app(section_flag+(int)(this_section-name_dir));
cur_xref= (xref_pointer)this_section->xref;
if(cur_xref->num==file_flag)cur_xref= cur_xref->xlink;
app_str("${}");
if(cur_xref->num!=section_count+def_flag){
app_str("\\mathrel+");
this_section= name_dir;
}
app_str("\\E");

app_str("{}$");
app(force);app_scrap(dead,no_math);


/*:240*/
#line 4409 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
while(next_control<=section_name){
outer_parse();
/*241:*/
#line 4445 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(next_control<section_name){
#line 1105 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
err_print(_("! You can't do that in C text"));
#line 4448 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

next_control= get_next();
}
else if(next_control==section_name){
app(section_flag+(int)(cur_section-name_dir));
app_scrap(section_scrap,maybe_math);
next_control= get_next();
}

/*:241*/
#line 4413 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}
finish_C(true);
}

/*:239*/
#line 4220 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*242:*/
#line 4460 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(this_section> name_dir){
cur_xref= (xref_pointer)this_section->xref;
if((an_output= (cur_xref->num==file_flag))==true)cur_xref= cur_xref->xlink;
if(cur_xref->num> def_flag)
cur_xref= cur_xref->xlink;
footnote(def_flag);footnote(cite_flag);footnote(0);
}

/*:242*/
#line 4221 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*246:*/
#line 4516 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 1112 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
finish_line();out_str("\\mini");finish_line();

/*294:*/
#line 1791 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

{struct perm_meaning*q;
while(temp_meaning_ptr> temp_meaning_stack){
out_mini(--temp_meaning_ptr);
q= get_meaning(temp_meaning_ptr->id);
q->stamp= section_count;
}
while(top_usage!=usage_sentinel){
q= top_usage;
top_usage= q->link;
q->link= NULL;
if(q->stamp!=section_count)out_mini(&(q->perm));
}
}


/*:294*/
#line 1114 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

out_str("}\\FI");finish_line();

#line 4519 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
flush_buffer(out_buf,false,false);

/*:246*/
#line 4222 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:230*/
#line 4186 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:227*//*234:*/
#line 4306 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
finish_C(
bool visible)
{
text_pointer p;
if(visible){
out_str("\\B");app_tok(force);app_scrap(insert,no_math);
p= translate();

app(tok_flag+(int)(p-tok_start));make_output();
if(out_ptr> out_buf+1)
if(*(out_ptr-1)=='\\'){



if(*out_ptr=='6')out_ptr-= 2;
else if(*out_ptr=='7')*out_ptr= 'Y';
}
out_str("\\par");finish_line();
}
if(text_ptr> max_text_ptr)max_text_ptr= text_ptr;
if(tok_ptr> max_tok_ptr)max_tok_ptr= tok_ptr;
if(scrap_ptr> max_scr_ptr)max_scr_ptr= scrap_ptr;
tok_ptr= tok_mem+1;text_ptr= tok_start+1;scrap_ptr= scrap_info;

}

/*:234*//*243:*/
#line 4481 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
footnote(
sixteen_bits flag)
{
xref_pointer q= cur_xref;
if(q->num<=flag)return;
finish_line();out('\\');



out(flag==0?'U':flag==cite_flag?'Q':'A');
/*245:*/
#line 4503 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

if(q->xlink->num> flag)out('s');
while(true){
out_section(cur_xref->num-flag);
cur_xref= cur_xref->xlink;
if(cur_xref->num<=flag)break;
if(cur_xref->xlink->num> flag)out_str(", ");
else{out_str("\\ET");

if(cur_xref!=q->xlink)out('s');
}
}

/*:245*/
#line 4493 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

out('.');
}

/*:243*//*247:*/
#line 4529 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
phase_three(void){
phase= 3;
finish_line();
if(no_xref)
out_str("\\end");

else{
#line 1122 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(show_progress)printf("%s",_("\nWriting the index..."));
#line 4539 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

#line 4545 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
out_str("\\inx");finish_line();


if((idx_file= fopen(idx_file_name,"wb"))==NULL)
#line 1137 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
fatal(_("! Cannot open index file "),idx_file_name);
#line 4550 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

active_file= idx_file;
/*251:*/
#line 4616 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

for(hash_ptr= hash;hash_ptr<=hash_end;hash_ptr++){
next_name= *hash_ptr;
while(next_name){
cur_name= next_name;next_name= cur_name->link;
if(cur_name->xref!=(void*)xmem){
int c= (cur_name->byte_start)[0];
if(xisupper(c))c= tolower(c);
blink[cur_name-name_dir]= bucket[c];bucket[c]= cur_name;
}
}
}

/*:251*/
#line 4552 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*259:*/
#line 4739 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

sort_ptr= scrap_info;unbucket(1);
while(sort_ptr> scrap_info){
cur_depth= sort_ptr->depth;
if(blink[sort_ptr->head-name_dir]==0||cur_depth==infinity)
/*261:*/
#line 4761 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
cur_name= sort_ptr->head;
do{
out_str("\\I");

/*262:*/
#line 1191 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

switch(cur_name->ilk){
#line 1198 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case normal:
#line 4776 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(is_tiny(cur_name))out_str("\\|");
#line 1204 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
else{bool all_caps= true;char*p;

#line 4778 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
for(p= cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
if(xislower(*p)){
all_caps= false;break;
}
out_str(all_caps?"\\.":"\\\\");
}
break;



case wildcard:out_str("\\9");goto not_an_identifier;

case typewriter:out_str("\\.");goto not_an_identifier;

#line 1217 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
case roman:out_str("  ");
not_an_identifier:out_name(cur_name,false);goto name_done;
case custom:out_str("\\$");break;

#line 4799 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
default:out_str("\\&");

}
#line 1226 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
out_name(cur_name,proofing);
#line 4803 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
name_done:

/*:262*/
#line 4766 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*263:*/
#line 4808 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

/*265:*/
#line 4827 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

this_xref= (xref_pointer)cur_name->xref;cur_xref= xmem;
do{
next_xref= this_xref->xlink;this_xref->xlink= cur_xref;
cur_xref= this_xref;this_xref= next_xref;
}while(this_xref!=xmem);

/*:265*/
#line 4809 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

do{
out_str(", ");cur_val= cur_xref->num;
if(cur_val<def_flag)out_section(cur_val);
else{out_str("\\[");out_section(cur_val-def_flag);out(']');}

cur_xref= cur_xref->xlink;
}while(cur_xref!=xmem);
out('.');finish_line();

/*:263*/
#line 4767 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

cur_name= blink[cur_name-name_dir];
}while(cur_name);
--sort_ptr;
}

#line 1188 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
/*:261*/
#line 4744 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

else/*260:*/
#line 4748 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
{
int c;
next_name= sort_ptr->head;
do{
cur_name= next_name;next_name= blink[cur_name-name_dir];
cur_byte= cur_name->byte_start+cur_depth;
if(cur_byte==(cur_name+1)->byte_start)c= 0;
else if(xisupper(c= *cur_byte))c= tolower(c);
blink[cur_name-name_dir]= bucket[c];bucket[c]= cur_name;
}while(next_name);
--sort_ptr;unbucket(cur_depth+1);
}

/*:260*/
#line 4745 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

}

/*:259*/
#line 4553 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

finish_line();fclose(active_file);

active_file= tex_file;
out_str("\\fin");finish_line();


if((scn_file= fopen(scn_file_name,"wb"))==NULL)
#line 1143 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
fatal(_("! Cannot open section file "),scn_file_name);
#line 4562 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

active_file= scn_file;
/*268:*/
#line 4857 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
section_print(root);

/*:268*/
#line 4564 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

finish_line();fclose(active_file);

active_file= tex_file;
if(group_found)out_str("\\con");else out_str("\\end");


}
finish_line();
#line 1149 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
fclose(active_file);active_file= tex_file= NULL;
if(check_for_change)/*304:*/
#line 1943 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
{
if((tex_file= fopen(tex_file_name,"r"))!=NULL){
bool comparison= false;

if((check_file= fopen(check_file_name,"r"))==NULL)
fatal(_("! Cannot open output file "),check_file_name);


/*305:*/
#line 1965 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

do{
char x[BUFSIZ],y[BUFSIZ];
int x_size= fread(x,sizeof(char),BUFSIZ,tex_file);
int y_size= fread(y,sizeof(char),BUFSIZ,check_file);
comparison= (x_size==y_size)&&!memcmp(x,y,x_size);
}while(comparison&&!feof(tex_file)&&!feof(check_file));

/*:305*/
#line 1951 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"


fclose(tex_file);tex_file= NULL;
fclose(check_file);check_file= NULL;

/*306:*/
#line 1976 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(comparison)
remove(check_file_name);
else{
remove(tex_file_name);
rename(check_file_name,tex_file_name);
}

/*:306*/
#line 1956 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

}else
rename(check_file_name,tex_file_name);

strcpy(check_file_name,"");
}

/*:304*/
#line 1150 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

#line 4574 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
if(show_happiness){
if(show_progress)new_line();
#line 1156 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
printf("%s",_("Done."));
#line 4577 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}
check_complete();
}

/*:247*//*257:*/
#line 4719 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
unbucket(
eight_bits d)
{
int c;

for(c= 100+128;c>=0;c--)if(bucket[collate[c]]){

#line 1181 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
if(sort_ptr>=scrap_info_end)overflow(_("sorting"));
#line 4729 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
sort_ptr++;
if(sort_ptr> max_sort_ptr)max_sort_ptr= sort_ptr;
if(c==0)sort_ptr->depth= infinity;
else sort_ptr->depth= d;
sort_ptr->head= bucket[collate[c]];bucket[collate[c]]= NULL;
}
}

/*:257*//*266:*/
#line 4838 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

static void
section_print(
name_pointer p)
{
if(p){
section_print(p->llink);out_str("\\I");

tok_ptr= tok_mem+1;text_ptr= tok_start+1;scrap_ptr= scrap_info;init_stack();
app(section_flag+(int)(p-name_dir));make_output();
footnote(cite_flag);
footnote(0);
finish_line();
section_print(p->rlink);
}
}

/*:266*//*269:*/
#line 4862 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"

void
print_stats(void){
#line 1251 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
puts(_("\nMemory usage statistics:"));

printf(_("%td names (out of %ld)\n"),
(ptrdiff_t)(name_ptr-name_dir),(long)max_names);
printf(_("%td cross-references (out of %ld)\n"),
(ptrdiff_t)(xref_ptr-xmem),(long)max_refs);
printf(_("%td bytes (out of %ld)\n"),
(ptrdiff_t)(byte_ptr-byte_mem),(long)max_bytes);
printf(_("%td temp meanings (out of %ld)\n"),
(ptrdiff_t)(max_temp_meaning_ptr-temp_meaning_stack),
(long)max_meanings);
printf(_("%td titles (out of %ld)\n"),
(ptrdiff_t)(title_code_ptr-title_code),(long)max_titles);
puts(_("Parsing:"));
printf(_("%td scraps (out of %ld)\n"),
(ptrdiff_t)(max_scr_ptr-scrap_info),(long)max_scraps);
printf(_("%td texts (out of %ld)\n"),
(ptrdiff_t)(max_text_ptr-tok_start),(long)max_texts);
printf(_("%td tokens (out of %ld)\n"),
(ptrdiff_t)(max_tok_ptr-tok_mem),(long)max_toks);
printf(_("%td levels (out of %ld)\n"),
(ptrdiff_t)(max_stack_ptr-stack),(long)stack_size);
puts(_("Sorting:"));
printf(_("%td levels (out of %ld)\n"),
(ptrdiff_t)(max_sort_ptr-scrap_info),(long)max_scraps);
#line 4885 "../../../texlive-source/texk/web2c/cwebdir/cweave.w"
}

#line 1281 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

/*:269*//*276:*/
#line 1505 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

static void
new_meaning(
name_pointer p)
{
struct perm_meaning*q= get_meaning(p);
if(q->stamp!=section_count){
if(*(ministring_ptr-1)==' ')ministring_ptr--;
if(ministring_ptr>=ministring_buf_end)
strcpy(ministring_buf,"\\zip");

else*ministring_ptr= '\0';
q->perm.prog_no= 0;
q->perm.sec_no= section_count;
strcpy(q->perm.tex_part,ministring_buf);
}
/*292:*/
#line 1761 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

{int n= q->perm.prog_no;
ms_mode= false;
fprintf(aux_file,"@$%.*s %.*s",
(int)length(p),p->byte_start,
(int)length(title_code[n]),title_code[n]->byte_start);
if(*(title_code[n]->byte_start)=='{')fprintf(aux_file,"%d",q->perm.sec_no);
fprintf(aux_file," %s@>\n",q->perm.tex_part);
}


/*:292*/
#line 1521 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

}


/*:276*//*281:*/
#line 1589 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

static bool app_supp(
text_pointer p)
{token_pointer j;
if(ident_seen&&**p>=tok_flag)
switch(**(**p-tok_flag+tok_start)){
case'(':app_str("(\\,)");goto catch14;
case'[':app_str("[\\,]");goto catch14;
}
for(j= *p;j<*(p+1);j++)
if(*j<tok_flag){
if(*j==inserted)break;
if(j==tok_loc)ident_seen= true;
else app(*j);
}else if(*j>=inner_tok_flag)confusion(_("inner"));
else if(app_supp(*j-tok_flag+tok_start))goto catch14;
return false;
catch14:return*(*(p+1)-1)=='9';
}


/*:281*//*283:*/
#line 1620 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static void
make_ministring(scrap_pointer p)
{
if(tok_loc<=operator_found)return;
/*286:*/
#line 1657 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

if(p==pp){app(int_loc+res_flag);app(' ');cur_mathness= no_math;}
else{
text_pointer q= (p-1)->trans,r;
token t;
int ast_count= 0;
bool non_ast_seen= false;
while(true){
if(*(q+1)==*q+1){
r= q;break;
}
if(**q<tok_flag)confusion(_("find type"));
r= **q-tok_flag+tok_start;
if((t= *(*(q+1)-2))>=tok_flag&&**(t-tok_flag+tok_start)=='*'){

if(!non_ast_seen)ast_count++;
}else non_ast_seen= true;
if(*(*q+1)==' '&&*(q+1)==*q+2)break;
if(*(*q+1)=='{'&&*(*q+2)=='}'&&*(*q+3)=='$'&&*(*q+4)==' '
&&*(q+1)==*q+5)break;
q= r;
}
while(**r>=tok_flag){
if(*(r+1)> *r+9&&*(*r+1)=='{'&&*(*r+2)=='}'&&*(*r+3)=='$'
&&*(*r+4)==indent)q= **r-tok_flag+tok_start;
r= **r-tok_flag+tok_start;
}
if(**r==ext_loc+res_flag)return;
/*287:*/
#line 1689 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

cur_mathness= no_math;
if(*(q+1)==*q+8&&*(*q+1)==' '&&*(*q+3)==' '){
app(**q);app(' ');app(*(*q+2));
}else if((t= *(*(q+1)-1))>=tok_flag&&**(r= t-tok_flag+tok_start)=='\\'
&&*(*r+1)=='{')app(**q);
else app((q-tok_start)+tok_flag);
while(ast_count){
big_app('{');app('*');app('}');ast_count--;
}


/*:287*/
#line 1685 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

}


/*:286*/
#line 1624 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

null_scrap.mathness= ((p->mathness)%4)*5;big_app1(&null_scrap);



ident_seen= false;app_supp(p->trans);
null_scrap.mathness= 10;big_app1(&null_scrap);

ms_mode= true;ministring_ptr= ministring_buf;
if(p==pp+2)*ministring_ptr++= '=';
make_output();
tok_ptr= *(--text_ptr);
new_meaning(((*tok_loc)%id_flag)+name_dir);
cur_mathness= maybe_math;
}


/*:283*//*295:*/
#line 1807 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static void
out_mini(
meaning_struct*m)
{char s[max_tex_chars+10];
name_pointer cur_name= m->id;
if(m->prog_no==0){
if(m->sec_no==section_count)return;
snprintf(s,max_tex_chars+10,"\\[%d",m->sec_no);
}else{name_pointer n= title_code[m->prog_no];
if(*(n->byte_start)=='{')
snprintf(s,max_tex_chars+10,"\\]%.*s%d",(int)length(n),n->byte_start,m->sec_no);
else snprintf(s,max_tex_chars+10,"\\]%.*s",(int)length(n),n->byte_start);
}
out_str(s);out(' ');
/*297:*/
#line 1831 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

switch(cur_name->ilk){char*p;
case normal:case func_template:
if(is_tiny(cur_name))out_str("\\|");
else{bool all_caps= true;
for(p= cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
if(xislower(*p)){
all_caps= false;break;
}
out_str(all_caps?"\\.":"\\\\");
}
break;



case wildcard:out_str("\\9");break;

case typewriter:out_str("\\.");break;

case roman:break;
case custom:
out_str("$\\");
for(p= cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
out(*p=='_'?'x':*p=='$'?'X':*p);
out('$');
goto name_done;
default:out_str("\\&");

}
out_name(cur_name,true);
name_done:


/*:297*/
#line 1821 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"

out(' ');out_str(m->tex_part);finish_line();
}


/*:295*//*298:*/
#line 1869 "../../../texlive-source/texk/web2c/cwebdir/ctwill-w2c.ch"
static sixteen_bits title_lookup(void)
{
char*first= loc,*last;
name_pointer*p;
if(*loc=='"'){
while(++loc<=limit&&*loc!='"')if(*loc=='\\')loc++;
}else if(*loc=='{'){
int balance= 1;
while(++loc<=limit){
if(*loc==' '&&balance==1)
*loc= '}';
if(*loc=='}'&&--balance==0)break;
if(*loc=='{')balance++;
}
}else err_print(_("! Title should be enclosed in braces or doublequotes"));
last= ++loc;
if(last> limit)err_print(_("! Title name didn't end"));
if(title_code_ptr==title_code_end)overflow(_("titles"));
*title_code_ptr= id_lookup(first,last,title);
for(p= title_code;true;p++)if(*p==*title_code_ptr)break;
if(p==title_code_ptr)title_code_ptr++;
return p-title_code;
}


/*:298*/
