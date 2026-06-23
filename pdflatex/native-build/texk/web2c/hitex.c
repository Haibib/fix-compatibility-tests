/*4:*/
#line 451 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*9:*/
#line 517 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#include "hibasetypes.h"
#include <string.h> 
#include <math.h> 

/*:9*//*1570:*/
#line 28554 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#include "hierror.h"
#include "hiformat.h"
#include "hiput.h"

/*:1570*//*1750:*/
#line 32875 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef WEB2CVERSION
#define TL_VERSION "(TeX Live "WEB2CVERSION")"
#else
#line 32879 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
#define TL_VERSION
#endif
#line 32881 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1750*//*1762:*/
#line 33145 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#include <kpathsea/kpathsea.h> 
static int argument_is(struct option*opt,char*s)
{return STREQ(opt->name,s);}
#define ARGUMENT_IS(S) argument_is(long_options+option_index,S)

/*:1762*//*1800:*/
#line 33979 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#include <time.h> 
static time_t start_time= ((time_t)-1);
static char*source_date_epoch,*force_source_date;

#if defined(_MSC_VER) && _MSC_VER < 1800
#define strtoull _strtoui64
#endif
#line 33987 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static struct tm*tl_now(void)
{struct tm*tp;
time_t t;
source_date_epoch= getenv("SOURCE_DATE_EPOCH");
force_source_date= getenv("FORCE_SOURCE_DATE");
if(force_source_date!=NULL&&
(force_source_date[0]!='1'||force_source_date[1]!=0))
force_source_date= NULL;

if(source_date_epoch!=NULL)
{start_time= (time_t)strtoull(source_date_epoch,NULL,10);
if(force_source_date!=NULL)
t= start_time;
else
t= time(NULL);
}
else
t= start_time= time(NULL);
if(force_source_date)
tp= gmtime(&t);
else
tp= localtime(&t);
return tp;
}

/*:1800*//*1801:*/
#line 34015 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#define TIME_STR_SIZE 30
static char time_str[TIME_STR_SIZE];
static void get_creation_date(void);
static void get_file_mod_date(void);
static int get_file_size(void);

#include <md5.h> 
#define DIGEST_SIZE 16
#define FILE_BUF_SIZE 1024
static md5_byte_t md5_digest[DIGEST_SIZE];

static int get_md5_sum(int s,int file);

/*:1801*//*1845:*/
#line 35197 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#include "hb.h"
#include "hb-ot.h"
#include "hb-subset.h"

/*:1845*/
#line 451 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#define eTeX_version 2
#define eTeX_revision ".6"
#define eTeX_version_string "2.6"
#define TeX_banner "This is TeX, Version 3.141592653"
#define TEX ETEX
#define eTeX_states 1
#define Prote_version_string "3.141592653-2.6-1.1.0"
#define Prote_version 1
#define Prote_revision ".1.0"
#define Prote_banner "This is Prote, Version "Prote_version_string
#define HITEX_VERSION "2.0"
#define banner "This is HiTeX "HITEX_VERSION", TeX version 3.141592653 " \
TL_VERSION
#define odd(X) ((X)&1)
#define chr(X) ((unsigned char)(X))
#define ord(X) ((unsigned int)(X))
#define abs(X) ((X)> -(X)?(X):-(X))
#define round(X) ((int)((X)>=0.0?floor((X)+0.5):ceil((X)-0.5)))
#define mem_bot 0
#define mem_top 5000000
#define font_base 0
#define hash_size 45000
#define hash_prime 35999
#define hyph_size 8191
#define incr(A) A= A+1
#define decr(A) A= A-1
#define negate(A) A= -A
#define loop while(true)
#define do_nothing 
#define empty 0
#define null_code 00
#define carriage_return 015
#define invalid_code 0177
#define t_open_in term_in.f= stdin
#define t_open_out term_out.f= stdout
#define update_terminal fflush(term_out.f)
#define clear_terminal fflush(term_in.f)
#define wake_up_terminal do_nothing
#define loc cur_input.loc_field
#define length(A) (str_start[A+1]-str_start[A])
#define cur_length (pool_ptr-str_start[str_ptr])
#define append_char(A)  \
{str_pool[pool_ptr]= A;incr(pool_ptr); \
}
#define flush_char decr(pool_ptr)
#define str_room(A)  \
{if(pool_ptr+A> pool_size) \
overflow("pool size",pool_size-init_pool_ptr); \
 \
}
#define flush_string {decr(str_ptr) ;pool_ptr= str_start[str_ptr]; \
}
#define app_lc_hex(A) l= A; \
if(l<10)append_char(l+'0')else append_char(l-10+'a')
#define no_print 16
#define term_only 17
#define log_only 18
#define term_and_log 19
#define pseudo 20
#define new_string 21
#define max_selector 21
#define print_ASCII printn
#define prompt_input(A) {wake_up_terminal;print(A);term_input(); \
}
#define batch_mode 0
#define nonstop_mode 1
#define scroll_mode 2
#define error_stop_mode 3
#define spotless 0
#define warning_issued 1
#define error_message_issued 2
#define fatal_error_stop 3
#define hlp1(A) help_line[0]= A;}
#define hlp2(A,B) help_line[1]= A;help_line[0]= B;}
#define hlp3(A,B,C) help_line[2]= A;help_line[1]= B;help_line[0]= C;}
#define hlp4(A,B,C,D) help_line[3]= A;help_line[2]= B;help_line[1]= C;help_line[0]= D;}
#define hlp5(A,B,C,D,E) help_line[4]= A;help_line[3]= B;help_line[2]= C;help_line[1]= D;help_line[0]= E;}
#define hlp6(A,B,C,D,E,F) help_line[5]= A;help_line[4]= B;help_line[3]= C;help_line[2]= D;help_line[1]= E;help_line[0]= F;}
#define help0 help_ptr= 0
#define help1(A) {help_ptr= 1;hlp1(A)
#define help2(A,B) {help_ptr= 2;hlp2(A,B)
#define help3(A,B,C) {help_ptr= 3;hlp3(A,B,C)
#define help4(A,B,C,D) {help_ptr= 4;hlp4(A,B,C,D)
#define help5(A,B,C,D,E) {help_ptr= 5;hlp5(A,B,C,D,E)
#define help6(A,B,C,D,E,F) {help_ptr= 6;hlp6(A,B,C,D,E,F)
#define succumb {if(interaction==error_stop_mode)  \
interaction= scroll_mode; \
if(log_opened)error(); \
if(interaction> batch_mode)debug_help(); \
history= fatal_error_stop;jump_out(); \
}
#define check_interrupt {if(interrupt!=0) pause_for_instructions(); \
}
#define unity 0200000
#define two 0400000
#define nx_plus_y(A,B,C) mult_and_add(A,B,C,07777777777)
#define mult_integers(A,B) mult_and_add(A,B,0,017777777777)
#define inf_bad 10000
#define set_glue_ratio_zero(A) A= 0.0
#define set_glue_ratio_one(A) A= 1.0
#define unfix(A) ((double)(A))
#define fix(A) ((glue_ratio)(A))
#define float_constant(A) ((double)(A))
#define min_quarterword 0
#define max_quarterword 65535
#define min_halfword 0
#define max_halfword 0x3FFFFFFF
#define qi(A) A+min_quarterword
#define qo(A) A-min_quarterword
#define hi(A) A+min_halfword
#define ho(A) A-min_halfword
#define sc i
#define pointer halfword
#define null min_halfword
#define link(A) mem[A].hh.rh
#define info(A) mem[A].hh.lh
#define free_avail(A)  \
{link(A)= avail;avail= A; \
decr_dyn_used; \
}
#define fast_get_avail(A)  \
{A= avail; \
if(A==null)A= get_avail(); \
else{avail= link(A);link(A)= null; \
incr_dyn_used; \
} \
}
#define empty_flag max_halfword
#define is_empty(A) (link(A)==empty_flag)
#define node_size(A) info(A)
#define llink(A) info(A+1)
#define rlink(A) link(A+1)
#define type(A) mem[A].hh.b0
#define subtype(A) mem[A].hh.b1
#define is_char_node(A) (A>=hi_mem_min)
#define font(A) mem[A].hh.b8
#define character(A) mem[A].hh.b24
#define hlist_node 0
#define box_node_size 9
#define width_offset 1
#define depth_offset 2
#define height_offset 3
#define width(A) mem[A+width_offset].sc
#define depth(A) mem[A+depth_offset].sc
#define height(A) mem[A+height_offset].sc
#define shift_amount(A) mem[A+4].sc
#define list_offset 5
#define list_ptr(A) link(A+list_offset)
#define glue_order(A) subtype(A+list_offset)
#define glue_sign(A) type(A+list_offset)
#define normal 0
#define stretching 1
#define shrinking 2
#define glue_offset 6
#define glue_set(A) mem[A+glue_offset].gr
#define vlist_node 1
#define rule_node 2
#define rule_node_size 4
#define null_flag -010000000000
#define is_running(A) (A==null_flag)
#define ins_node 3
#define ins_node_size 5
#define float_cost(A) mem[A+1].i
#define ins_ptr(A) info(A+4)
#define split_top_ptr(A) link(A+4)
#define mark_node 4
#define small_node_size 2
#define mark_ptr(A) link(A+1)
#define mark_class(A) info(A+1)
#define adjust_node 5
#define adjust_ptr(A) mem[A+1].i
#define ligature_node 6
#define lig_char(A) A+1
#define lig_ptr(A) link(lig_char(A))
#define disc_node 7
#define replace_count(A) (subtype(A)&0x7F)
#define set_replace_count(A,B) (subtype(A)= (B)&0x7F)
#define set_auto_disc(A) (subtype(A)|= 0x80)
#define is_auto_disc(A) (subtype(A)&0x80)
#define pre_break(A) llink(A)
#define post_break(A) rlink(A)
#define whatsit_node 8
#define math_node 9
#define before 0
#define after 1
#define precedes_break(A) (type(A)<math_node)
#define non_discardable(A) (type(A)<math_node)
#define glue_node 10
#define cond_math_glue 98
#define mu_glue 99
#define a_leaders 100
#define c_leaders 101
#define x_leaders 102
#define glue_ptr(A) llink(A)
#define leader_ptr(A) rlink(A)
#define glue_spec_size 4
#define glue_ref_count(A) link(A)
#define stretch(A) mem[A+2].sc
#define shrink(A) mem[A+3].sc
#define stretch_order(A) type(A)
#define shrink_order(A) subtype(A)
#define fil 1
#define fill 2
#define filll 3
#define kern_node 11
#define explicit 1
#define acc_kern 2
#define penalty_node 12
#define inf_penalty inf_bad
#define eject_penalty (-inf_penalty)
#define penalty(A) mem[A+1].i
#define unset_node 13
#define unset_set_node 32
#define unset_pack_node 33
#define glue_stretch(A) mem[A+glue_offset].sc
#define glue_shrink(A) shift_amount(A)
#define span_count(A) subtype(A)
#define zero_glue mem_bot
#define fil_glue zero_glue+glue_spec_size
#define fill_glue fil_glue+glue_spec_size
#define ss_glue fill_glue+glue_spec_size
#define fil_neg_glue ss_glue+glue_spec_size
#define lo_mem_stat_max fil_neg_glue+glue_spec_size-1
#define page_ins_head mem_top
#define contrib_head mem_top-1
#define page_head mem_top-2
#define temp_head mem_top-3
#define hold_head mem_top-4
#define adjust_head mem_top-5
#define active mem_top-7
#define align_head mem_top-8
#define end_span mem_top-9
#define omit_template mem_top-10
#define null_list mem_top-11
#define lig_trick mem_top-12
#define garbage mem_top-12
#define backup_head mem_top-13
#define setpage_head mem_top-14
#define max_page type(setpage_head)
#define max_stream subtype(setpage_head)
#define hi_mem_stat_min mem_top-14
#define hi_mem_stat_usage 15
#define node_list_display(A)  \
{append_char('.');show_node_list(A);flush_char; \
}
#define token_ref_count(A) info(A)
#define fast_delete_glue_ref(A)  \
{if(glue_ref_count(A)==null)free_node(A,glue_spec_size); \
else decr(glue_ref_count(A)); \
}
#define add_token_ref(A) incr(token_ref_count(A))
#define add_glue_ref(A) incr(glue_ref_count(A))
#define add_xdimen_ref(A) if(A!=null)incr(xdimen_ref_count(A))
#define escape 0
#define relax 0
#define left_brace 1
#define right_brace 2
#define math_shift 3
#define tab_mark 4
#define car_ret 5
#define out_param 5
#define mac_param 6
#define sup_mark 7
#define sub_mark 8
#define ignore 9
#define endv 9
#define spacer 10
#define letter 11
#define other_char 12
#define active_char 13
#define par_end 13
#define match 13
#define comment 14
#define end_match 14
#define stop 14
#define invalid_char 15
#define delim_num 15
#define max_char_code 15
#define char_num 16
#define math_char_num 17
#define mark 18
#define xray 19
#define make_box 20
#define hmove 21
#define vmove 22
#define un_hbox 23
#define un_vbox 24
#define remove_item 25
#define hskip 26
#define vskip 27
#define mskip 28
#define kern 29
#define mkern 30
#define leader_ship 31
#define halign 32
#define valign 33
#define no_align 34
#define vrule 35
#define hrule 36
#define insert 37
#define vadjust 38
#define ignore_spaces 39
#define after_assignment 40
#define after_group 41
#define break_penalty 42
#define start_par 43
#define ital_corr 44
#define accent 45
#define math_accent 46
#define discretionary 47
#define eq_no 48
#define left_right 49
#define math_comp 50
#define limit_switch 51
#define above 52
#define math_style 53
#define math_choice 54
#define non_script 55
#define vcenter 56
#define case_shift 57
#define message 58
#define extension 59
#define in_stream 60
#define begin_group 61
#define end_group 62
#define omit 63
#define ex_space 64
#define no_boundary 65
#define radical 66
#define end_cs_name 67
#define min_internal 68
#define char_given 68
#define math_given 69
#define last_item 70
#define max_non_prefixed_command 70
#define toks_register 71
#define assign_toks 72
#define assign_int 73
#define assign_dimen 74
#define assign_glue 75
#define assign_mu_glue 76
#define assign_font_dimen 77
#define assign_font_int 78
#define set_aux 79
#define set_prev_graf 80
#define set_page_dimen 81
#define set_page_int 82
#define set_box_dimen 83
#define set_shape 84
#define def_code 85
#define def_family 86
#define set_font 87
#define def_font 88
#define internal_register 89
#define max_internal 89
#define advance 90
#define multiply 91
#define divide 92
#define prefix 93
#define let 94
#define shorthand_def 95
#define read_to_cs 96
#define def 97
#define set_box 98
#define hyph_data 99
#define set_interaction 100
#define max_command 100
#define undefined_cs (max_command+1)
#define expand_after (max_command+2)
#define no_expand (max_command+3)
#define input (max_command+4)
#define if_test (max_command+5)
#define fi_or_else (max_command+6)
#define cs_name (max_command+7)
#define convert (max_command+8)
#define the (max_command+9)
#define top_bot_mark (max_command+10)
#define call (max_command+11)
#define long_call (max_command+12)
#define outer_call (max_command+13)
#define long_outer_call (max_command+14)
#define end_template (max_command+15)
#define dont_expand (max_command+16)
#define glue_ref (max_command+17)
#define shape_ref (max_command+18)
#define box_ref (max_command+19)
#define data (max_command+20)
#define vmode 1
#define hmode (vmode+max_command+1)
#define mmode (hmode+max_command+1)
#define ignore_depth (-1000*unity)
#define unknown_depth (-2000*unity)
#define mode cur_list.mode_field
#define head cur_list.head_field
#define tail cur_list.tail_field
#define eTeX_aux cur_list.eTeX_aux_field
#define delim_ptr eTeX_aux
#define prev_graf cur_list.pg_field
#define aux cur_list.aux_field
#define prev_depth aux.sc
#define space_factor aux.hh.lh
#define clang aux.hh.rh
#define incompleat_noad aux.i
#define mode_line cur_list.ml_field
#define tail_append(A) {link(tail)= A;tail= link(tail); \
}
#define eq_level_field(A) A.hh.b1
#define eq_type_field(A) A.hh.b0
#define equiv_field(A) A.hh.rh
#define eq_level(A) eq_level_field(eqtb[A])
#define eq_type(A) eq_type_field(eqtb[A])
#define equiv(A) equiv_field(eqtb[A])
#define level_zero min_quarterword
#define level_one (level_zero+1)
#define active_base 1
#define utf8_single_size 0x80
#define active_hash_base (active_base+utf8_single_size)
#define active_hash_bits 8
#define active_hash_size (1<<active_hash_bits)
#define single_base (active_hash_base+active_hash_size)
#define null_cs (single_base+utf8_single_size)
#define hash_base (null_cs+1)
#define frozen_control_sequence (hash_base+hash_size)
#define frozen_protection frozen_control_sequence
#define frozen_cr (frozen_control_sequence+1)
#define frozen_end_group (frozen_control_sequence+2)
#define frozen_right (frozen_control_sequence+3)
#define frozen_fi (frozen_control_sequence+4)
#define frozen_end_template (frozen_control_sequence+5)
#define frozen_endv (frozen_control_sequence+6)
#define frozen_relax (frozen_control_sequence+7)
#define end_write (frozen_control_sequence+8)
#define frozen_dont_expand (frozen_control_sequence+9)
#define frozen_primitive (frozen_control_sequence+10)
#define frozen_null_font (frozen_control_sequence+11)
#define font_id_base (frozen_null_font-font_base)
#define undefined_control_sequence (frozen_null_font+257)
#define glue_base (undefined_control_sequence+1)
#define line_skip_code 0
#define baseline_skip_code 1
#define par_skip_code 2
#define above_display_skip_code 3
#define below_display_skip_code 4
#define above_display_short_skip_code 5
#define below_display_short_skip_code 6
#define left_skip_code 7
#define right_skip_code 8
#define top_skip_code 9
#define split_top_skip_code 10
#define tab_skip_code 11
#define space_skip_code 12
#define xspace_skip_code 13
#define par_fill_skip_code 14
#define thin_mu_skip_code 15
#define med_mu_skip_code 16
#define thick_mu_skip_code 17
#define glue_pars 18
#define skip_base (glue_base+glue_pars)
#define mu_skip_base (skip_base+256)
#define local_base (mu_skip_base+256)
#define skip(A) equiv(skip_base+A)
#define mu_skip(A) equiv(mu_skip_base+A)
#define glue_par(A) equiv(glue_base+A)
#define line_skip glue_par(line_skip_code)
#define baseline_skip glue_par(baseline_skip_code)
#define par_skip glue_par(par_skip_code)
#define above_display_skip glue_par(above_display_skip_code)
#define below_display_skip glue_par(below_display_skip_code)
#define above_display_short_skip glue_par(above_display_short_skip_code)
#define below_display_short_skip glue_par(below_display_short_skip_code)
#define left_skip glue_par(left_skip_code)
#define right_skip glue_par(right_skip_code)
#define top_skip glue_par(top_skip_code)
#define split_top_skip glue_par(split_top_skip_code)
#define tab_skip glue_par(tab_skip_code)
#define space_skip glue_par(space_skip_code)
#define xspace_skip glue_par(xspace_skip_code)
#define par_fill_skip glue_par(par_fill_skip_code)
#define thin_mu_skip glue_par(thin_mu_skip_code)
#define med_mu_skip glue_par(med_mu_skip_code)
#define thick_mu_skip glue_par(thick_mu_skip_code)
#define par_shape_loc local_base
#define output_routine_loc (local_base+1)
#define every_par_loc (local_base+2)
#define every_math_loc (local_base+3)
#define every_display_loc (local_base+4)
#define every_hbox_loc (local_base+5)
#define every_vbox_loc (local_base+6)
#define every_job_loc (local_base+7)
#define every_cr_loc (local_base+8)
#define err_help_loc (local_base+9)
#define tex_toks (local_base+10)
#define etex_toks_base tex_toks
#define every_eof_loc etex_toks_base
#define etex_toks (etex_toks_base+1)
#define toks_base etex_toks
#define etex_pen_base (toks_base+256)
#define inter_line_penalties_loc etex_pen_base
#define club_penalties_loc (etex_pen_base+1)
#define widow_penalties_loc (etex_pen_base+2)
#define display_widow_penalties_loc (etex_pen_base+3)
#define etex_pens (etex_pen_base+4)
#define box_base etex_pens
#define cur_font_loc (box_base+256)
#define math_font_base (cur_font_loc+1)
#define cat_code_base (math_font_base+48)
#define sf_code_base (cat_code_base+256)
#define math_code_base (sf_code_base+256)
#define int_base (math_code_base+256)
#define utf_base_skip 0x200000
#define utf_cp_mask (utf_base_skip-1)
#define utf_base_mask (~utf_cp_mask)
#define utf_first_base ((eqtb_size+1+utf_cp_mask) &utf_base_mask)
#define utf_cat_code_base utf_first_base
#define utf_sf_code_base (utf_cat_code_base+utf_base_skip)
#define utf_del_code_base (utf_sf_code_base+utf_base_skip)
#define utf_math_code_base (utf_del_code_base+utf_base_skip)
#define utf_math_codenum_base (utf_math_code_base+utf_base_skip)
#define utf_lc_code_base (utf_math_codenum_base+utf_base_skip)
#define utf_uc_code_base (utf_lc_code_base+utf_base_skip)
#define utf_code_limit (utf_uc_code_base+utf_base_skip)
#define par_shape_ptr equiv(par_shape_loc)
#define output_routine equiv(output_routine_loc)
#define every_par equiv(every_par_loc)
#define every_math equiv(every_math_loc)
#define every_display equiv(every_display_loc)
#define every_hbox equiv(every_hbox_loc)
#define every_vbox equiv(every_vbox_loc)
#define every_job equiv(every_job_loc)
#define every_cr equiv(every_cr_loc)
#define err_help equiv(err_help_loc)
#define toks(X) equiv(toks_base+X)
#define box(A) equiv(box_base+A)
#define cur_font equiv(cur_font_loc)
#define fam_fnt(A) equiv(math_font_base+A)
#define cat_code(A) ((A)<0x100?equiv(cat_code_base+A):utf_catcode(A))
#define lc_code(A) utf_lccode(A)
#define uc_code(A) utf_uccode(A)
#define sf_code(A) ((A)<0x100?equiv(sf_code_base+A):utf_sfcode(A))
#define math_code(A) ((A)<0x100?equiv(math_code_base+A):utf_mathcode(A))
#define null_font font_base
#define utf_var_code (7<<21)
#define pretolerance_code 0
#define tolerance_code 1
#define line_penalty_code 2
#define hyphen_penalty_code 3
#define ex_hyphen_penalty_code 4
#define club_penalty_code 5
#define widow_penalty_code 6
#define display_widow_penalty_code 7
#define broken_penalty_code 8
#define bin_op_penalty_code 9
#define rel_penalty_code 10
#define pre_display_penalty_code 11
#define post_display_penalty_code 12
#define inter_line_penalty_code 13
#define double_hyphen_demerits_code 14
#define final_hyphen_demerits_code 15
#define adj_demerits_code 16
#define mag_code 17
#define delimiter_factor_code 18
#define looseness_code 19
#define time_code 20
#define day_code 21
#define month_code 22
#define year_code 23
#define show_box_breadth_code 24
#define show_box_depth_code 25
#define hbadness_code 26
#define vbadness_code 27
#define pausing_code 28
#define tracing_online_code 29
#define tracing_macros_code 30
#define tracing_stats_code 31
#define tracing_paragraphs_code 32
#define tracing_pages_code 33
#define tracing_output_code 34
#define tracing_lost_chars_code 35
#define tracing_commands_code 36
#define tracing_restores_code 37
#define uc_hyph_code 38
#define output_penalty_code 39
#define max_dead_cycles_code 40
#define hang_after_code 41
#define floating_penalty_code 42
#define global_defs_code 43
#define cur_fam_code 44
#define escape_char_code 45
#define default_hyphen_char_code 46
#define default_skew_char_code 47
#define end_line_char_code 48
#define new_line_char_code 49
#define language_code 50
#define left_hyphen_min_code 51
#define right_hyphen_min_code 52
#define holding_inserts_code 53
#define error_context_lines_code 54
#define tracing_stack_levels_code 55
#define tracing_fonts_code 56
#define tex_int_pars 57
#define etex_int_base tex_int_pars
#define tracing_assigns_code etex_int_base
#define tracing_groups_code (etex_int_base+1)
#define tracing_ifs_code (etex_int_base+2)
#define tracing_scan_tokens_code (etex_int_base+3)
#define tracing_nesting_code (etex_int_base+4)
#define saving_vdiscards_code (etex_int_base+5)
#define saving_hyph_codes_code (etex_int_base+6)
#define expand_depth_code (etex_int_base+7)
#define ignore_primitive_error_code (etex_int_base+8)
#define eTeX_state_code (etex_int_base+9)
#define etex_int_pars (eTeX_state_code+eTeX_states)
#define int_pars etex_int_pars
#define count_base (int_base+int_pars)
#define del_code_base (count_base+256)
#define dimen_base (del_code_base+256)
#define del_code(A) ((A)<0x100?eqtb[del_code_base+A].i:utf_delcode(A))
#define count(A) eqtb[count_base+A].i
#define int_par(A) eqtb[int_base+A].i
#define pretolerance int_par(pretolerance_code)
#define tolerance int_par(tolerance_code)
#define line_penalty int_par(line_penalty_code)
#define hyphen_penalty int_par(hyphen_penalty_code)
#define ex_hyphen_penalty int_par(ex_hyphen_penalty_code)
#define club_penalty int_par(club_penalty_code)
#define widow_penalty int_par(widow_penalty_code)
#define display_widow_penalty int_par(display_widow_penalty_code)
#define broken_penalty int_par(broken_penalty_code)
#define bin_op_penalty int_par(bin_op_penalty_code)
#define rel_penalty int_par(rel_penalty_code)
#define pre_display_penalty int_par(pre_display_penalty_code)
#define post_display_penalty int_par(post_display_penalty_code)
#define inter_line_penalty int_par(inter_line_penalty_code)
#define double_hyphen_demerits int_par(double_hyphen_demerits_code)
#define final_hyphen_demerits int_par(final_hyphen_demerits_code)
#define adj_demerits int_par(adj_demerits_code)
#define mag int_par(mag_code)
#define delimiter_factor int_par(delimiter_factor_code)
#define looseness int_par(looseness_code)
#define time int_par(time_code)
#define day int_par(day_code)
#define month int_par(month_code)
#define year int_par(year_code)
#define show_box_breadth int_par(show_box_breadth_code)
#define show_box_depth int_par(show_box_depth_code)
#define hbadness int_par(hbadness_code)
#define vbadness int_par(vbadness_code)
#define pausing int_par(pausing_code)
#define tracing_online int_par(tracing_online_code)
#define tracing_macros int_par(tracing_macros_code)
#define tracing_stats int_par(tracing_stats_code)
#define tracing_paragraphs int_par(tracing_paragraphs_code)
#define tracing_pages int_par(tracing_pages_code)
#define tracing_output int_par(tracing_output_code)
#define tracing_lost_chars int_par(tracing_lost_chars_code)
#define tracing_commands int_par(tracing_commands_code)
#define tracing_restores int_par(tracing_restores_code)
#define uc_hyph int_par(uc_hyph_code)
#define output_penalty int_par(output_penalty_code)
#define max_dead_cycles int_par(max_dead_cycles_code)
#define hang_after int_par(hang_after_code)
#define floating_penalty int_par(floating_penalty_code)
#define global_defs int_par(global_defs_code)
#define cur_fam int_par(cur_fam_code)
#define escape_char int_par(escape_char_code)
#define default_hyphen_char int_par(default_hyphen_char_code)
#define default_skew_char int_par(default_skew_char_code)
#define end_line_char int_par(end_line_char_code)
#define new_line_char int_par(new_line_char_code)
#define language int_par(language_code)
#define left_hyphen_min int_par(left_hyphen_min_code)
#define right_hyphen_min int_par(right_hyphen_min_code)
#define holding_inserts int_par(holding_inserts_code)
#define error_context_lines int_par(error_context_lines_code)
#define tracing_stack_levels int_par(tracing_stack_levels_code)
#define tracing_fonts int_par(tracing_fonts_code)
#define tracing_assigns int_par(tracing_assigns_code)
#define tracing_groups int_par(tracing_groups_code)
#define tracing_ifs int_par(tracing_ifs_code)
#define tracing_scan_tokens int_par(tracing_scan_tokens_code)
#define tracing_nesting int_par(tracing_nesting_code)
#define saving_vdiscards int_par(saving_vdiscards_code)
#define saving_hyph_codes int_par(saving_hyph_codes_code)
#define expand_depth int_par(expand_depth_code)
#define ignore_primitive_error int_par(ignore_primitive_error_code)
#define ignore_infinite_glue_shrinkage_bit 1
#define par_indent_code 0
#define math_surround_code 1
#define line_skip_limit_code 2
#define hsize_code 3
#define vsize_code 4
#define max_depth_code 5
#define split_max_depth_code 6
#define box_max_depth_code 7
#define hfuzz_code 8
#define vfuzz_code 9
#define delimiter_shortfall_code 10
#define null_delimiter_space_code 11
#define script_space_code 12
#define pre_display_size_code 13
#define display_width_code 14
#define display_indent_code 15
#define overfull_rule_code 16
#define hang_indent_code 17
#define h_offset_code 18
#define v_offset_code 19
#define emergency_stretch_code 20
#define page_width_code 21
#define page_height_code 22
#define dimen_pars 23
#define scaled_base (dimen_base+dimen_pars)
#define eqtb_size (scaled_base+255)
#define dimen(A) eqtb[scaled_base+A].sc
#define dimen_par(A) eqtb[dimen_base+A].sc
#define dimen_hfactor(A) hfactor_eqtb[scaled_base+A].sc
#define dimen_vfactor(A) vfactor_eqtb[scaled_base+A].sc
#define dimen_par_hfactor(A) hfactor_eqtb[dimen_base+A].sc
#define dimen_par_vfactor(A) vfactor_eqtb[dimen_base+A].sc
#define par_indent dimen_par(par_indent_code)
#define math_surround dimen_par(math_surround_code)
#define line_skip_limit dimen_par(line_skip_limit_code)
#define hsize dimen_par(hsize_code)
#define vsize dimen_par(vsize_code)
#define max_depth dimen_par(max_depth_code)
#define split_max_depth dimen_par(split_max_depth_code)
#define box_max_depth dimen_par(box_max_depth_code)
#define hfuzz dimen_par(hfuzz_code)
#define vfuzz dimen_par(vfuzz_code)
#define delimiter_shortfall dimen_par(delimiter_shortfall_code)
#define null_delimiter_space dimen_par(null_delimiter_space_code)
#define script_space dimen_par(script_space_code)
#define pre_display_size dimen_par(pre_display_size_code)
#define display_width dimen_par(display_width_code)
#define display_indent dimen_par(display_indent_code)
#define overfull_rule dimen_par(overfull_rule_code)
#define hang_indent dimen_par(hang_indent_code)
#define h_offset dimen_par(h_offset_code)
#define v_offset dimen_par(v_offset_code)
#define emergency_stretch dimen_par(emergency_stretch_code)
#define page_height dimen_par(page_height_code)
#define next(A) hash[A].lh
#define text(A) hash[A].rh
#define hash_is_full (hash_used==hash_base)
#define font_id_text(A) text(font_id_base+A)
#define save_type(A) save_stack[A].hh.b0
#define save_level(A) save_stack[A].hh.b1
#define save_index(A) save_stack[A].hh.rh
#define restore_old_value 0
#define restore_zero 1
#define insert_token 2
#define level_boundary 3
#define restore_sa 4
#define bottom_level 0
#define simple_group 1
#define hbox_group 2
#define adjusted_hbox_group 3
#define vbox_group 4
#define vtop_group 5
#define align_group 6
#define no_align_group 7
#define output_group 8
#define math_group 9
#define disc_group 10
#define insert_group 11
#define vcenter_group 12
#define math_choice_group 13
#define semi_simple_group 14
#define math_shift_group 15
#define math_left_group 16
#define page_group 17
#define stream_group 18
#define stream_before_group 19
#define stream_after_group 20
#define outline_group 21
#define max_group_code 21
#define check_full_save_stack if(save_ptr> max_save_stack)  \
{max_save_stack= save_ptr; \
if(max_save_stack> save_size-7)overflow("save size",save_size); \
 \
}
#define saved(A) save_stack[save_ptr+A].i
#define saved_hfactor(A) save_hfactor[save_ptr+A].i
#define saved_vfactor(A) save_vfactor[save_ptr+A].i
#define cs_token_flag ((1<<28) -1)
#define cmd_factor (1<<24)
#define cmd_token(A) ((A)<<24)
#define left_brace_token (left_brace<<24)
#define left_brace_limit ((left_brace+1) <<24)
#define right_brace_token (right_brace<<24)
#define right_brace_limit ((right_brace+1) <<24)
#define math_shift_token (math_shift<<24)
#define tab_token (tab_mark<<24)
#define out_param_token (out_param<<24)
#define space_token ((spacer<<24) +' ')
#define letter_token (letter<<24)
#define other_token (other_char<<24)
#define match_token (match<<24)
#define end_match_token (end_match<<24)
#define protected_token (end_match<<24) +1
#define chr_cmd(A) {print(A);print_ASCII(chr_code); \
}
#define state cur_input.state_field
#define index cur_input.index_field
#define start cur_input.start_field
#define limit cur_input.limit_field
#define name cur_input.name_field
#define mid_line 1
#define skip_blanks (2+max_char_code)
#define new_line (3+max_char_code+max_char_code)
#define terminal_input (name==0)
#define cur_file input_file[index]
#define skipping 1
#define defining 2
#define matching 3
#define aligning 4
#define absorbing 5
#define token_list 0
#define token_type index
#define param_start limit
#define parameter 0
#define u_template 1
#define v_template 2
#define backed_up 3
#define inserted 4
#define macro 5
#define output_text 6
#define every_par_text 7
#define every_math_text 8
#define every_display_text 9
#define every_hbox_text 10
#define every_vbox_text 11
#define every_job_text 12
#define every_cr_text 13
#define mark_text 14
#define eTeX_text_offset (output_routine_loc-output_text)
#define every_eof_text (every_eof_loc-eTeX_text_offset)
#define write_text (toks_base-eTeX_text_offset)
#define begin_pseudoprint  \
{l= tally;tally= 0;selector= pseudo; \
trick_count= 1000000; \
}
#define set_trick_count  \
{first_count= tally; \
trick_count= tally+1+error_line-half_error_line; \
if(trick_count<error_line) trick_count= error_line; \
}
#define push_input  \
{if(input_ptr> max_in_stack)  \
{max_in_stack= input_ptr; \
if(input_ptr==stack_size)overflow("input stack size",stack_size); \
 \
} \
input_stack[input_ptr]= cur_input; \
incr(input_ptr); \
}
#define pop_input  \
{decr(input_ptr) ;cur_input= input_stack[input_ptr]; \
}
#define back_list(A) begin_token_list(A,backed_up)
#define ins_list(A) begin_token_list(A,inserted)
#define any_state_plus(A) case mid_line+A: \
case skip_blanks+A:case new_line+A
#define add_delims_to(A) A+math_shift:A+tab_mark:A+mac_param: \
A+sub_mark:A+letter:A+other_char
#define is_hex(A) (((A>='0')&&(A<='9'))||((A>='a')&&(A<='f')))
#define hex_to_cur_chr  \
if(c<='9') cur_chr= c-'0';else cur_chr= c-'a'+10; \
if(cc<='9')cur_chr= 16*cur_chr+cc-'0'; \
else cur_chr= 16*cur_chr+cc-'a'+10
#define no_expand_flag 257
#define end_line_char_inactive (end_line_char<0) ||(end_line_char> 255)
#define store_new_token(A) {q= get_avail();link(p)= q;info(q)= A; \
p= q; \
}
#define fast_store_new_token(A) {fast_get_avail(q);link(p)= q;info(q)= A; \
p= q; \
}
#define marks_code 5
#define top_mark_code 0
#define first_mark_code 1
#define bot_mark_code 2
#define split_first_mark_code 3
#define split_bot_mark_code 4
#define top_mark cur_mark[top_mark_code]
#define first_mark cur_mark[first_mark_code]
#define bot_mark cur_mark[bot_mark_code]
#define split_first_mark cur_mark[split_first_mark_code]
#define split_bot_mark cur_mark[split_bot_mark_code]
#define int_val 0
#define dimen_val 1
#define glue_val 2
#define mu_val 3
#define ident_val 4
#define tok_val 5
#define has_factor (cur_hfactor!=0||cur_vfactor!=0)
#define scanned_result(A,B) {cur_val= A;cur_val_level= B;}
#define last_node_type_code (glue_val+1)
#define input_line_no_code (glue_val+2)
#define badness_code (input_line_no_code+1)
#define eTeX_int (badness_code+1)
#define eTeX_dim (eTeX_int+8)
#define eTeX_glue (eTeX_dim+9)
#define eTeX_mu (eTeX_glue+1)
#define eTeX_expr (eTeX_mu+1)
#define eTeX_last_last_item_cmd_mod (eTeX_expr-int_val+mu_val)
#define max_dimen 07777777777
#define octal_token (other_token+'\'')
#define hex_token (other_token+'"')
#define alpha_token (other_token+'`')
#define point_token (other_token+'.')
#define continental_point_token (other_token+',')
#define infinity 017777777777
#define zero_token (other_token+'0')
#define A_token (letter_token+'A')
#define other_A_token (other_token+'A')
#define scan_normal_dimen scan_dimen(false,false,false)
#define set_conversion(A,B) {num= A;denom= B;}
#define default_rule 26214
#define number_code 0
#define roman_numeral_code 1
#define string_code 2
#define meaning_code 3
#define font_name_code 4
#define job_name_code 5
#define Uchar_code 6
#define Ucharcat_code 7
#define etex_convert_base (Ucharcat_code+1)
#define eTeX_revision_code etex_convert_base
#define etex_convert_codes (etex_convert_base+1)
#define eTeX_last_convert_cmd_mod etex_convert_codes
#define closed 2
#define just_open 1
#define unless_code 32
#define if_char_code 0
#define if_cat_code 1
#define if_int_code 2
#define if_dim_code 3
#define if_odd_code 4
#define if_vmode_code 5
#define if_hmode_code 6
#define if_mmode_code 7
#define if_inner_code 8
#define if_void_code 9
#define if_hbox_code 10
#define if_vbox_code 11
#define ifx_code 12
#define if_eof_code 13
#define if_true_code 14
#define if_false_code 15
#define if_case_code 16
#define if_node_size 2
#define if_line_field(A) mem[A+1].i
#define if_code 1
#define fi_code 2
#define else_code 3
#define or_code 4
#define get_x_token_or_active_char  \
{get_x_token() ; \
if(cur_cmd==relax)if(cur_chr==no_expand_flag) \
{cur_cmd= active_char; \
cur_chr= cur_tok-cs_token_flag-active_base; \
if(cur_chr>=utf8_single_size) \
cur_chr= active_hash[cur_tok-cs_token_flag]; \
} \
}
#define append_to_name(A) {c= A;incr(k); \
if(k<=file_name_size)name_of_file[k]= c; \
}
#define format_extension ".fmt"
#define pack_cur_name(A) if(cur_ext==empty_string)pack_file_name(cur_name,cur_area,cur_ext,A); \
else pack_file_name(cur_name,cur_area,cur_ext,NULL)
#define no_tag 0
#define lig_tag 1
#define list_tag 2
#define ext_tag 3
#define stop_flag qi(128)
#define kern_flag qi(128)
#define skip_byte(A) A.b0
#define next_char(A) A.b1
#define op_byte(A) A.b2
#define rem_byte(A) A.b3
#define ext_top(A) A.b0
#define ext_mid(A) A.b1
#define ext_bot(A) A.b2
#define ext_rep(A) A.b3
#define slant_code 1
#define space_code 2
#define space_stretch_code 3
#define space_shrink_code 4
#define x_height_code 5
#define quad_code 6
#define extra_space_code 7
#define non_char qi(256)
#define non_address 0
#define char_info(A,B) (IS_X_FONT(A)?null_character:font_info[char_base[A]+B].qqqq)
#define char_width(A,B) (IS_X_FONT(A)?x_char_width(A,B):font_info[width_base[A]+char_info(A,B).b0].sc)
#define char_exists(A,B) (IS_X_FONT(A)?x_char_exists(A,B):char_info(A,B).b0> min_quarterword)
#define char_italic(A,B) (IS_X_FONT(A)?x_char_italic(A,B):font_info[italic_base[A]+(char_info(A,B).b2)/4].sc)
#define height_depth(A) qo(A.b1)
#define char_height(A,B) (IS_X_FONT(A)?x_char_height(A,B):font_info[height_base[A]+(char_info(A,B).b1)/16].sc)
#define char_depth(A,B) (IS_X_FONT(A)?x_char_depth(A,B):font_info[depth_base[A]+(char_info(A,B).b1)%16].sc)
#define char_tag(A,B) (IS_X_FONT(A)?no_tag:((qo(B.b2))%4))
#define char_kern(A,B) font_info[kern_base[A]+256*op_byte(B)+rem_byte(B)].sc
#define kern_base_offset 256*(128+min_quarterword)
#define lig_kern_start(A,B) lig_kern_base[A]+B.b3
#define lig_kern_restart(A,B) lig_kern_base[A]+256*op_byte(B)+rem_byte(B)+32768-kern_base_offset
#define param(A,B) font_info[A+param_base[B]].sc
#define slant(B) param(slant_code,B)
#define space(B) param(space_code,B)
#define space_stretch(B) param(space_stretch_code,B)
#define space_shrink(B) param(space_shrink_code,B)
#define x_height(B) param(x_height_code,B)
#define quad(B) param(quad_code,B)
#define extra_space(B) param(extra_space_code,B)
#define abort goto bad_tfm
#define extended_base -256
#define needs_loading(A) (char_base[A]==extended_base&&x_font[A]==NULL)
#define start_font_error_message print_err("Font ") ;printn_esc(t); \
print_char('=');print_file_name(nom,aire,empty_string); \
if(s>=0) \
{print(" at ");print_scaled(s);print("pt"); \
} \
else if(s!=-1000) \
{print(" scaled ");print_int(-s); \
}
#define fget get(tfm_file)
#define fbyte tfm_file.d
#define read_sixteen(A) {A= fbyte; \
if(A> 127)abort; \
fget;A= A*0400+fbyte; \
}
#define store_four_quarters(A) {fget;a= fbyte;qw.b0= qi(a); \
fget;b= fbyte;qw.b1= qi(b); \
fget;c= fbyte;qw.b2= qi(c); \
fget;d= fbyte;qw.b3= qi(d); \
A= qw; \
}
#define check_byte_range(A) {if((A<bc)||(A> ec))abort;}
#define current_character_being_worked_on k+bc-fmem_ptr
#define store_scaled(A) {fget;a= fbyte;fget;b= fbyte; \
fget;c= fbyte;fget;d= fbyte; \
sw= (((((d*z)/0400)+(c*z))/0400)+(b*z))/beta; \
if(a==0)A= sw;else if(a==255)A= sw-alpha;else abort; \
}
#define check_existence(A)  \
{check_byte_range(A); \
qw= char_info(f,A); \
if(!char_exists(f,A))abort; \
}
#define adjust(A) A[f]= qo(A[f])
#define id_byte 2
#define exactly 0
#define additional 1
#define natural 0,0,0,additional,false
#define noad_size 4
#define nucleus(A) A+1
#define supscr(A) A+2
#define subscr(A) A+3
#define math_type(A) link(A)
#define fam font
#define math_char 1
#define sub_box 2
#define sub_mlist 3
#define math_text_char 4
#define ord_noad (unset_node+3)
#define op_noad (ord_noad+1)
#define bin_noad (ord_noad+2)
#define rel_noad (ord_noad+3)
#define open_noad (ord_noad+4)
#define close_noad (ord_noad+5)
#define punct_noad (ord_noad+6)
#define inner_noad (ord_noad+7)
#define limits 1
#define no_limits 2
#define left_delimiter(A) A+4
#define right_delimiter(A) A+5
#define radical_noad (inner_noad+1)
#define radical_noad_size 5
#define fraction_noad (radical_noad+1)
#define fraction_noad_size 6
#define small_fam(A) mem[A].qqqq.b0
#define small_char(A) mem[A].qqqq.b1
#define large_fam(A) mem[A].qqqq.b2
#define large_char(A) mem[A].qqqq.b3
#define thickness(A) width(A)
#define default_code 010000000000
#define numerator(A) supscr(A)
#define denominator(A) subscr(A)
#define under_noad (fraction_noad+1)
#define over_noad (under_noad+1)
#define accent_noad (over_noad+1)
#define accent_noad_size 5
#define accent_chr(A) A+4
#define vcenter_noad (accent_noad+1)
#define left_noad (vcenter_noad+1)
#define right_noad (left_noad+1)
#define delimiter(A) nucleus(A)
#define middle_noad 1
#define scripts_allowed(A) (type(A)>=ord_noad)&&(type(A)<left_noad)
#define style_node (unset_node+1)
#define style_node_size 3
#define display_style 0
#define text_style 2
#define script_style 4
#define script_script_style 6
#define cramped 1
#define choice_node (unset_node+2)
#define display_mlist(A) info(A+1)
#define text_mlist(A) link(A+1)
#define script_mlist(A) info(A+2)
#define script_script_mlist(A) link(A+2)
#define text_size 0
#define script_size 16
#define script_script_size 32
#define mathsy_end(A) fam_fnt(2+A)]].sc
#define mathsy(A) font_info[A+param_base[mathsy_end
#define math_x_height mathsy(5)
#define math_quad mathsy(6)
#define num1 mathsy(8)
#define num2 mathsy(9)
#define num3 mathsy(10)
#define denom1 mathsy(11)
#define denom2 mathsy(12)
#define sup1 mathsy(13)
#define sup2 mathsy(14)
#define sup3 mathsy(15)
#define sub1 mathsy(16)
#define sub2 mathsy(17)
#define sup_drop mathsy(18)
#define sub_drop mathsy(19)
#define delim1 mathsy(20)
#define delim2 mathsy(21)
#define axis_height mathsy(22)
#define total_mathsy_params 22
#define mathex(A) font_info[A+param_base[fam_fnt(3+cur_size)]].sc
#define default_rule_thickness mathex(8)
#define big_op_spacing1 mathex(9)
#define big_op_spacing2 mathex(10)
#define big_op_spacing3 mathex(11)
#define big_op_spacing4 mathex(12)
#define big_op_spacing5 mathex(13)
#define total_mathex_params 13
#define cramped_style(A) 2*(A/2)+cramped
#define sub_style(A) 2*(A/4)+script_style+cramped
#define sup_style(A) 2*(A/4)+script_style+(A%2)
#define num_style(A) A+2-2*(A/6)
#define denom_style(A) 2*(A/2)+cramped+2-2*(A/6)
#define mu_mult(A) nx_plus_y(n,A,xn_over_d(A,f,0200000))
#define new_hlist(A) mem[nucleus(A)].i
#define choose_mlist(A) {p= A(q);A(q)= null;}
#define math_spacing  \
 \
"0234000122*4000133**3**344*0400400*000000234000111*1111112341011"
#define u_part(A) mem[A+height_offset].i
#define v_part(A) mem[A+depth_offset].i
#define extra_info(A) info(A+list_offset)
#define preamble link(align_head)
#define align_stack_node_size 5
#define span_code 256
#define cr_code 257
#define cr_cr_code (cr_code+1)
#define end_template_token cs_token_flag+frozen_end_template
#define span_node_size 2
#define tight_fit 3
#define loose_fit 1
#define very_loose_fit 0
#define decent_fit 2
#define active_node_size 3
#define fitness(A) subtype(A)
#define break_node(A) rlink(A)
#define line_number(A) llink(A)
#define total_demerits(A) mem[A+2].i
#define unhyphenated 0
#define hyphenated 1
#define last_active active
#define passive_node_size 2
#define cur_break(A) rlink(A)
#define prev_break(A) llink(A)
#define serial(A) info(A)
#define delta_node_size 7
#define delta_node 2
#define do_all_six(A) A(1);A(2);A(3);A(4);A(5);A(6)
#define check_shrinkage(A) if((shrink_order(A)!=normal)&&(shrink(A)!=0)) \
{A= finite_shrink(A); \
}
#define copy_to_cur_active(A) cur_active_width[A]= active_width[A]
#define update_width(A)  \
cur_active_width[A]= cur_active_width[A]+mem[r+A].sc
#define awful_bad 07777777777
#define set_break_width_to_background(A) break_width[A]= background[A]
#define convert_to_break_width(A)  \
mem[prev_r+A].sc= mem[prev_r+A].sc \
-cur_active_width[A]+break_width[A]
#define store_break_width(A) active_width[A]= break_width[A]
#define new_delta_to_break_width(A)  \
mem[q+A].sc= break_width[A]-cur_active_width[A]
#define new_delta_from_break_width(A) mem[q+A].sc=  \
cur_active_width[A]-break_width[A]
#define combine_two_deltas(A) mem[prev_r+A].sc= mem[prev_r+A].sc+mem[r+A].sc
#define downdate_width(A) cur_active_width[A]= cur_active_width[A]- \
mem[prev_r+A].sc
#define update_active(A) active_width[A]= active_width[A]+mem[r+A].sc
#define store_background(A) active_width[A]= background[A]
#define act_width active_width[1]
#define kern_break {if(!is_char_node(link(cur_p) )&&auto_breaking) \
if(type(link(cur_p))==glue_node)try_break(0,unhyphenated); \
act_width= act_width+width(cur_p); \
}
#define next_break prev_break
#define max_hyph_length 256
#define max_language 255
#define max_pattern_char 0xFFFF
#define biggest_char 0x10FFFF
#define append_charnode_to_t(A) {link(t)= get_avail();t= link(t); \
font(t)= hf;character(t)= A; \
}
#define set_cur_r {if(j<n) cur_r= qi(hu[j+1]);else cur_r= bchar; \
if(odd(hyf[j]))cur_rh= hchar;else cur_rh= non_char; \
}
#define wrap_lig(A) if(ligature_present) \
{p= new_ligature(hf,cur_l,link(cur_q)); \
if(lft_hit) \
{subtype(p)= 2;lft_hit= false; \
} \
if(A)if(lig_stack==null) \
{incr(subtype(p));rt_hit= false; \
} \
link(cur_q)= p;t= p;ligature_present= false; \
}
#define pop_lig_stack {if(lig_ptr(lig_stack) > null) \
{link(t)= lig_ptr(lig_stack); \
t= link(t);incr(j); \
} \
p= lig_stack;lig_stack= link(p);free_node(p,small_node_size); \
if(lig_stack==null)set_cur_r else cur_r= character(lig_stack); \
}
#define advance_major_tail {major_tail= link(major_tail) ;incr(r_count); \
}
#define trie_link(A) trie[A].rh
#define trie_char(A) trie[A].b24
#define trie_op(A) trie[A].b8
#define set_cur_lang if(language<=0) cur_lang= 0; \
else if(language> max_language)cur_lang= 0; \
else cur_lang= language
#define trie_root trie_l[0]
#define trie_ref trie_hash
#define trie_back(A) trie[A].lh
#define active_height active_width
#define cur_height active_height[1]
#define set_height_zero(A) active_height[A]= 0
#define deplorable 100000
#define inserts_only 1
#define box_there 2
#define page_ins_node_size 4
#define inserting 0
#define split_up 1
#define broken_ptr(A) link(A+1)
#define broken_ins(A) info(A+1)
#define last_ins_ptr(A) link(A+2)
#define best_ins_ptr(A) info(A+2)
#define page_goal page_so_far[0]
#define page_total page_so_far[1]
#define page_shrink page_so_far[6]
#define page_depth page_so_far[7]
#define print_plus(A,B) if(page_so_far[A]!=0) \
{print(" plus ");print_scaled(page_so_far[A]);print(B);}
#define set_page_so_far_zero(A) page_so_far[A]= 0
#define contrib_tail nest[0].tail_field
#define adjust_space_factor  \
main_s= sf_code(cur_chr) ; \
if(main_s==1000)space_factor= 1000; \
else if(main_s<1000) \
{if(main_s> 0)space_factor= main_s; \
} \
else if(space_factor<1000)space_factor= 1000; \
else space_factor= main_s
#define pack_lig(X)  \
{main_p= new_ligature(main_f,cur_l,link(cur_q)); \
if(lft_hit) \
{subtype(main_p)= 2;lft_hit= false; \
} \
if(X)if(lig_stack==null) \
{incr(subtype(main_p));rt_hit= false; \
} \
link(cur_q)= main_p;tail= main_p;ligature_present= false; \
}
#define wrapup(A) if(cur_l<non_char) \
{if(link(cur_q)> null) \
if(character(tail)==qi(hyphen_char[main_f]))ins_disc= true; \
if(ligature_present)pack_lig(A); \
if(ins_disc) \
{ins_disc= false; \
if(mode> 0)tail_append(new_disc()); \
} \
}
#define any_mode(A) case vmode+A:case hmode+A: \
case mmode+A
#define non_math(A) case vmode+A:case hmode+A
#define fil_code 0
#define fill_code 1
#define ss_code 2
#define fil_neg_code 3
#define skip_code 4
#define mskip_code 5
#define box_flag 010000000000
#define global_box_flag 010000100000
#define ship_out_flag 010000200000
#define leader_flag 010000200001
#define box_code 0
#define copy_code 1
#define last_box_code 2
#define vsplit_code 3
#define vtop_code 4
#define fam_in_range ((cur_fam>=0) &&(cur_fam<16))
#define above_code 0
#define over_code 1
#define atop_code 2
#define delimited_code 3
#define global (a>=4)
#define define(A,B,C) if(global)geq_define(A,B,C);else eq_define(A,B,C)
#define word_define(A,B) if(global)geq_word_define(A,B);else eq_word_define(A,B)
#define char_def_code 0
#define math_char_def_code 1
#define count_def_code 2
#define dimen_def_code 3
#define skip_def_code 4
#define mu_skip_def_code 5
#define toks_def_code 6
#define show_code 0
#define show_box_code 1
#define show_the_code 2
#define show_lists_code 3
#define too_small(X) {wake_up_terminal; \
wterm_ln("---! Must increase the %s",X); \
 \
goto bad_fmt; \
}
#define dump_wd(A) {fmt_file.d= A;put(fmt_file);}
#define dump_int(A) {fmt_file.d.i= A;put(fmt_file);}
#define dump_hh(A) {fmt_file.d.hh= A;put(fmt_file);}
#define dump_qqqq(A) {fmt_file.d.qqqq= A;put(fmt_file);}
#define undump_wd(A) {get(fmt_file);A= fmt_file.d;}
#define undump_int(A) {get(fmt_file);A= fmt_file.d.i;}
#define undump_hh(A) {get(fmt_file);A= fmt_file.d.hh;}
#define undump_qqqq(A) {get(fmt_file);A= fmt_file.d.qqqq;}
#define undump(A,B,C) {undump_int(x);if((x<A)||(x> B))goto bad_fmt;else C= x;}
#define undump_size(A,B,C,D) {undump_int(x); \
if(x<A)goto bad_fmt;if(x> B)too_small(C)else D= x;}
#define dump_four_ASCII  \
w.b0= qi(str_pool[k]) ;w.b1= qi(str_pool[k+1]); \
w.b2= qi(str_pool[k+2]);w.b3= qi(str_pool[k+3]); \
dump_qqqq(w)
#define undump_four_ASCII  \
undump_qqqq(w) ; \
str_pool[k]= qo(w.b0);str_pool[k+1]= qo(w.b1); \
str_pool[k+2]= qo(w.b2);str_pool[k+3]= qo(w.b3)
#define write_node_size 2
#define open_node_size 3
#define open_node 0
#define write_node 1
#define close_node 2
#define special_node 3
#define language_node 4
#define what_lang(A) link(A+1)
#define what_lhm(A) type(A+1)
#define what_rhm(A) subtype(A+1)
#define write_tokens(A) link(A+1)
#define write_stream(A) info(A+1)
#define open_name(A) link(A+1)
#define open_area(A) info(A+2)
#define open_ext(A) link(A+2)
#define hitex_ext save_pos_code+1
#define param_node hitex_ext
#define param_node_size 3
#define param_type(A) type(A+1)
#define int_type 0
#define dimen_type 1
#define glue_type 2
#define param_no(A) subtype(A+1)
#define param_value(A) mem[A+2]
#define par_node hitex_ext+1
#define par_node_size 5
#define par_penalty(A) mem[A+1].i
#define par_extent(A) link(A+3)
#define par_params(A) info(A+4)
#define par_list(A) link(A+4)
#define disp_node hitex_ext+2
#define disp_node_size 3
#define display_left(A) type(A+1)
#define display_no_bs(A) subtype(A+1)
#define display_params(A) link(A+1)
#define display_formula(A) link(A+2)
#define display_eqno(A) info(A+2)
#define baseline_node hitex_ext+3
#define baseline_node_size small_node_size
#define baseline_node_no(A) mem[A+1].i
#define image_node hitex_ext+4
#define image_node_size 6
#define image_xwidth(A) link(A+1)
#define image_xheight(A) info(A+1)
#define image_aspect(A) mem[(A)+2].sc
#define image_no(A) link(A+3)
#define image_name(A) info(A+3)
#define image_area(A) info(A+4)
#define image_ext(A) link(A+4)
#define image_alt(A) link(A+5)
#define hpack_node hitex_ext+5
#define vpack_node hitex_ext+6
#define pack_node_size box_node_size
#define pack_m(A) type(A+list_offset)
#define pack_limit(A) mem[(A)+1+list_offset].sc
#define pack_extent(A) link(A+2+list_offset)
#define hset_node hitex_ext+7
#define vset_node hitex_ext+8
#define set_node_size box_node_size
#define set_stretch_order glue_sign
#define set_shrink_order glue_order
#define set_stretch(A) mem[(A)+1+list_offset].sc
#define set_extent(A) pack_extent(A)
#define set_shrink(A) mem[(A)+3+list_offset].sc
#define align_node hitex_ext+9
#define align_node_size 4
#define align_extent(A) link(A+2)
#define align_m(A) type(A+2)
#define align_v(A) subtype(A+2)
#define align_preamble(A) info(A+3)
#define align_list(A) link(A+3)
#define setpage_node hitex_ext+10
#define setpage_node_size 6
#define setpage_name(A) link(A+1)
#define setpage_number(A) type(A+1)
#define setpage_id(A) subtype(A+1)
#define setpage_priority(A) info(A+2)
#define setpage_topskip(A) link(A+2)
#define setpage_depth(A) mem[A+3].sc
#define setpage_height(A) info(A+4)
#define setpage_width(A) link(A+4)
#define setpage_list(A) info(A+5)
#define setpage_streams(A) link(A+5)
#define setstream_node hitex_ext+11
#define setstream_node_size 6
#define setstream_number(A) type(A+1)
#define setstream_insertion(A) subtype(A+1)
#define setstream_mag(A) link(A+1)
#define setstream_preferred(A) type(A+2)
#define setstream_next(A) subtype(A+2)
#define setstream_ratio(A) link(A+2)
#define setstream_max(A) info(A+3)
#define setstream_width(A) link(A+3)
#define setstream_topskip(A) info(A+4)
#define setstream_height(A) link(A+4)
#define setstream_before(A) info(A+5)
#define setstream_after(A) link(A+5)
#define stream_node hitex_ext+12
#define stream_node_size 2
#define stream_number(A) type(A+1)
#define stream_insertion(A) subtype(A+1)
#define stream_after_node hitex_ext+13
#define stream_before_node hitex_ext+14
#define xdimen_node hitex_ext+15
#define xdimen_node_size 4
#define xdimen_ref_count(A) link(A)
#define xdimen_width(A) mem[A+1].sc
#define xdimen_hfactor(A) mem[A+2].sc
#define xdimen_vfactor(A) mem[A+3].sc
#define ignore_node hitex_ext+16
#define ignore_node_size small_node_size
#define ignore_info(A) type(A+1)
#define ignore_list(A) link(A+1)
#define color_node hitex_ext+17
#define end_color_node hitex_ext+18
#define default_color_node hitex_ext+19
#define link_color_node hitex_ext+20
#define default_link_color_node hitex_ext+21
#define no_color_node hitex_ext+22
#define color_node_size small_node_size
#define color_ref(A) type(A+1)
#define color_link(A) link(A+1)
#define label_node hitex_ext+23
#define label_node_size 2
#define label_has_name(A) type(A+1)
#define label_where(A) subtype(A+1)
#define label_ptr(A) link(A+1)
#define start_link_node hitex_ext+24
#define end_link_node hitex_ext+25
#define link_node_size 3
#define as_label(A) ((A)+1)
#define outline_node hitex_ext+26
#define outline_node_size 3
#define outline_ptr(A) link(A+2)
#define outline_depth(A) info(A+2)
#define immediate_code 4
#define latex_first_extension_code 5
#define latespecial_node (latex_first_extension_code+0)
#define set_language_code (latex_first_extension_code+1)
#define TeX_last_extension_cmd_mod set_language_code
#define adv_past(A) if(subtype(A)==language_node) \
{cur_lang= what_lang(A);l_hyf= what_lhm(A);r_hyf= what_rhm(A); \
set_hyph_index; \
}
#define end_write_token cs_token_flag+end_write
#define eTeX_state_base (int_base+eTeX_state_code)
#define eTeX_state(A) eqtb[eTeX_state_base+A].i
#define eTeX_version_code eTeX_int
#define eTeX_ex (eTeX_mode==1)
#define every_eof equiv(every_eof_loc)
#define current_group_level_code (eTeX_int+1)
#define current_group_type_code (eTeX_int+2)
#define current_if_level_code (eTeX_int+3)
#define current_if_type_code (eTeX_int+4)
#define current_if_branch_code (eTeX_int+5)
#define font_char_wd_code eTeX_dim
#define font_char_ht_code (eTeX_dim+1)
#define font_char_dp_code (eTeX_dim+2)
#define font_char_ic_code (eTeX_dim+3)
#define par_shape_length_code (eTeX_dim+4)
#define par_shape_indent_code (eTeX_dim+5)
#define par_shape_dimen_code (eTeX_dim+6)
#define show_groups 4
#define show_tokens 5
#define show_ifs 6
#define print_if_line(A) if(A!=0) \
{print(" entered on line ");print_int(A); \
}
#define if_def_code 17
#define if_cs_code 18
#define if_font_char_code 19
#define eTeX_last_if_test_cmd_mod if_font_char_code
#define eTeX_last_expand_after_cmd_mod 1
#define expr_none 0
#define expr_add 1
#define expr_sub 2
#define expr_mult 3
#define expr_div 4
#define expr_scale 5
#define expr_node_size 4
#define expr_e_field(A) mem[A+1].i
#define expr_t_field(A) mem[A+2].i
#define expr_n_field(A) mem[A+3].i
#define num_error(A)  \
{arith_error= true;A= 0; \
}
#define glue_error(A)  \
{arith_error= true;delete_glue_ref(A);A= new_spec(zero_glue); \
}
#define normalize_glue(A)  \
if(stretch(A)==0)stretch_order(A)= normal; \
if(shrink(A)==0)shrink_order(A)= normal
#define expr_add_sub(A,B,C) add_or_sub(A,B,C,r==expr_sub)
#define expr_a(A,B) expr_add_sub(A,B,max_dimen)
#define expr_m(A) A= nx_plus_y(A,f,0)
#define expr_d(A) A= quotient(A,f)
#define expr_s(A) A= fract(A,n,f,max_dimen)
#define glue_stretch_order_code (eTeX_int+6)
#define glue_shrink_order_code (eTeX_int+7)
#define glue_stretch_code (eTeX_dim+7)
#define glue_shrink_code (eTeX_dim+8)
#define mu_to_glue_code eTeX_glue
#define glue_to_mu_code eTeX_mu
#define box_val 4
#define mark_val 6
#define dimen_val_limit 0x20
#define mu_val_limit 0x40
#define box_val_limit 0x50
#define tok_val_limit 0x60
#define index_node_size 9
#define sa_index(A) type(A)
#define sa_used(A) subtype(A)
#define sa_mark sa_root[mark_val]
#define if_cur_ptr_is_null_then_return_or_goto(A)  \
{if(cur_ptr==null) \
if(w)goto A;else return; \
}
#define hex_dig1(A) A/4096
#define hex_dig2(A) (A/256)%16
#define hex_dig3(A) (A/16)%16
#define hex_dig4(A) A%16
#define get_sa_ptr if(odd(i) )cur_ptr= link(q+(i/2)+1); \
else cur_ptr= info(q+(i/2)+1)
#define put_sa_ptr(A) if(odd(i))link(q+(i/2)+1)= A; \
else info(q+(i/2)+1)= A
#define add_sa_ptr {put_sa_ptr(cur_ptr) ;incr(sa_used(q)); \
}
#define delete_sa_ptr {put_sa_ptr(null) ;decr(sa_used(q)); \
}
#define sa_lev sa_used
#define pointer_node_size 2
#define sa_type(A) (sa_index(A)/16)
#define sa_ref(A) info(A+1)
#define sa_ptr(A) link(A+1)
#define word_node_size 3
#define sa_num(A) sa_ptr(A)
#define sa_int(A) mem[A+2].i
#define sa_dim(A) mem[A+2].sc
#define mark_class_node_size 4
#define fetch_box(A)  \
if(cur_val<256)A= box(cur_val); \
else{find_sa_element(box_val,cur_val,false); \
if(cur_ptr==null)A= null;else A= sa_ptr(cur_ptr); \
}
#define add_sa_ref(A) incr(sa_ref(A))
#define change_box(A)  \
if(cur_val<256)box(cur_val)= A;else set_sa_box(A)
#define set_sa_box(X) {find_sa_element(box_val,cur_val,false); \
if(cur_ptr!=null) \
{sa_ptr(cur_ptr)= X;add_sa_ref(cur_ptr);delete_sa_ref(cur_ptr); \
} \
}
#define vsplit_init 0
#define fire_up_init 1
#define fire_up_done 2
#define destroy_marks 3
#define sa_top_mark(A) info(A+1)
#define sa_first_mark(A) link(A+1)
#define sa_bot_mark(A) info(A+2)
#define sa_split_first_mark(A) link(A+2)
#define sa_split_bot_mark(A) info(A+3)
#define sa_loc(A) sa_ref(A)
#define sa_define(A,B,C,D,E) if(e) \
if(global)gsa_def(A,B);else sa_def(A,B); \
else if(global)geq_define(C,D,E);else eq_define(C,D,E)
#define sa_def_box  \
{find_sa_element(box_val,cur_val,true) ; \
if(global)gsa_def(cur_ptr,cur_box);else sa_def(cur_ptr,cur_box); \
}
#define sa_word_define(A,B) if(e) \
if(global)gsa_w_def(A,B);else sa_w_def(A,B); \
else word_define(A,B)
#define hyph_root trie_r[0]
#define set_hyph_index  \
if(trie_char(hyph_start+cur_lang) !=qi(cur_lang) \
)hyph_index= 0; \
else hyph_index= trie_link(hyph_start+cur_lang)
#define set_lc_code(A)  \
if(hyph_index==0)hc[0]= lc_code(A); \
else if(trie_char(hyph_index+A)!=qi(A))hc[0]= 0; \
else hc[0]= qo(trie_op(hyph_index+A))
#define tail_page_disc disc_ptr[copy_code]
#define page_disc disc_ptr[last_box_code]
#define split_disc disc_ptr[vsplit_code]
#define inter_line_penalties_ptr equiv(inter_line_penalties_loc)
#define Prote_ex (Prote_mode==1)
#define if_incsname_code (eTeX_last_if_test_cmd_mod+1)
#define if_primitive_code (eTeX_last_if_test_cmd_mod+2)
#define Prote_version_code (eTeX_last_last_item_cmd_mod+1)
#define random_seed_code (eTeX_last_last_item_cmd_mod+2)
#define elapsed_time_code (eTeX_last_last_item_cmd_mod+3)
#define shell_escape_code (eTeX_last_last_item_cmd_mod+4)
#define last_xpos_code (eTeX_last_last_item_cmd_mod+5)
#define last_ypos_code (eTeX_last_last_item_cmd_mod+6)
#define Prote_revision_code (eTeX_last_convert_cmd_mod+1)
#define strcmp_code (eTeX_last_convert_cmd_mod+2)
#define set_random_seed_code (eTeX_last_convert_cmd_mod+3)
#define normal_deviate_code (eTeX_last_convert_cmd_mod+4)
#define uniform_deviate_code (eTeX_last_convert_cmd_mod+5)
#define creation_date_code (eTeX_last_convert_cmd_mod+6)
#define file_size_code (eTeX_last_convert_cmd_mod+7)
#define file_mod_date_code (eTeX_last_convert_cmd_mod+8)
#define file_dump_code (eTeX_last_convert_cmd_mod+9)
#define mdfive_sum_code (eTeX_last_convert_cmd_mod+10)
#define primitive_code (eTeX_last_expand_after_cmd_mod+1)
#define expanded_code (eTeX_last_expand_after_cmd_mod+2)
#define eTeX_last_extension_cmd_mod TeX_last_extension_cmd_mod
#define reset_timer_code (eTeX_last_extension_cmd_mod+1)
#define save_pos_code (eTeX_last_extension_cmd_mod+2)
#define ROM_base 1
#define ROM_size (256+1+hash_size)
#define ROM_undefined_primitive 257
#define ROM_type_field(A) A.hh.b0
#define ROM_equiv_field(X) X.hh.rh
#define ROM_type(A) ROM_type_field(ROM[A])
#define set_ROM_p_from_cs(A) if((A>=single_base) \
&&(A<frozen_control_sequence)) \
p= A-single_base+ROM_base; \
else p= ROM_undefined_primitive
#define get_elapsed_time infinity
#define reset_timer do_nothing
#define get_file_mtime xchg_buffer_length= 0
#define double(A) A= A+A
#define halfp(A) (A)/2
#define el_gordo 017777777777
#define mpfract_half 01000000000
#define mpfract_one 02000000000
#define mpfract_four 010000000000
#define next_random if(j_random==0) new_randoms(); \
else decr(j_random)
#define return_sign(A) {return A; \
}
#define HINT_version_code (eTeX_last_last_item_cmd_mod+7)
#define HINT_minor_version_code (eTeX_last_last_item_cmd_mod+8)
#define append_utf8(A)  \
{int i= utf8_put_char(str_pool,pool_ptr,pool_size,A);pool_ptr= i; \
}
#define active_math_character_code 0xFFFFFFFF
#define math_code_fam(A) (((A)>>24)&0xFF)
#define math_code_class(A) (((A)>>21)&0x7)
#define math_code_char(A) ((A)&0x1FFFFF)
#define Umath_to_math(A) {int fam= math_code_fam(A);int class= math_code_class(A);int cp= math_code_char(A); \
if(cp<=0xFF&&fam<=0xF&&class<=0xF)A= (((class<<4)|fam)<<8)|cp;else A= 0;}
#define math_to_Umath(A) {int class= (A>>12)&0xF,fam= (A>>8)&0xF,cp= A&0xFF;A= (((fam<<3)|class)<<21)|cp;}
#define restore_utf_none (restore_sa+1)
#define restore_utf (restore_utf_none+1)
#define fibonacci_factor 0x9F406BB9
#define active_h1(A) (((A*fibonacci_factor)>>(32-active_hash_bits))|1)
#define active_h2(A) (((A*fibonacci_factor)>>(32-2*active_hash_bits))|1)
#define active_mask (active_hash_size-1)
#define IS_X_FONT(F) (x_font[F]!=NULL)
#define HB_PT_BITS 11
#define HB_ONE_PT (1<<HB_PT_BITS)
#define HB_EPS (1<<(16-HB_PT_BITS-1) )
#define HB_TO_SCALED(A) ((A)<<(16-HB_PT_BITS))
#define HB_FROM_SCALED(A) (((A)+HB_EPS)>>(16-HB_PT_BITS))
#define HB_TO_PT(A) (HB_TO_SCALED(A)/(double)ONE)
#define tail_append_char(A) {pointer p;fast_get_avail(p);font(p)= main_f;character(p)= A;tail_append(p);}

#line 452 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

enum{/*11:*/
#line 538 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

mem_max= 5000000,


mem_min= 0,


buf_size= 2000000,


error_line= 79,
half_error_line= 50,

max_print_line= 79,
stack_size= 5000,
max_in_open= 15,

font_max= 255,

font_mem_size= 8000000,
param_size= 10000,
nest_size= 500,
max_strings= 500000,
string_vacancies= 90000,


pool_size= 6250000,



save_size= 100000,

trie_size= 1500000,

trie_op_size= 35111,
file_name_size= 1024,
xchg_buffer_size= 64,


/*:11*/
#line 453 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

empty_string= 256
};
/*18:*/
#line 676 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef unsigned char UTF8_code;
typedef uint32_t UTF_code;

/*:18*//*21:*/
#line 727 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef uint8_t eight_bits;
typedef struct{FILE*f;char d;}alpha_file;
typedef struct{FILE*f;eight_bits d;}byte_file;

/*:21*//*34:*/
#line 1041 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef int32_t pool_pointer;
typedef int32_t str_number;
typedef uint8_t packed_ASCII_code;

/*:34*//*96:*/
#line 2090 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef int scaled;
typedef int32_t nonnegative_integer;
typedef int8_t small_number;

/*:96*//*104:*/
#line 2285 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#if __SIZEOF_FLOAT__==4
typedef float float32_t;
#else
#line 2289 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
#error  float type must have size 4
#endif
#line 2291 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 typedef float glue_ratio;

/*:104*//*108:*/
#line 2394 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef uint16_t quarterword;
typedef int32_t halfword;
typedef int8_t two_choices;
typedef int8_t four_choices;
typedef struct{
halfword rh;
union{
halfword lh;
struct{quarterword b0;quarterword b1;};
struct{unsigned int b8:8;unsigned int b24:24;};
};}two_halves;
typedef struct{
quarterword b0;
quarterword b1;
quarterword b2;
quarterword b3;
}four_quarters;
typedef struct{
union{
int i;
glue_ratio gr;
two_halves hh;
four_quarters qqqq;
};}memory_word;
typedef struct{FILE*f;memory_word d;}word_file;

/*:108*//*145:*/
#line 3122 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef int8_t glue_ord;

/*:145*//*207:*/
#line 4328 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef struct{int16_t mode_field;
pointer head_field,tail_field;
pointer eTeX_aux_field;
int pg_field,ml_field;
memory_word aux_field;
}list_state_record;

/*:207*//*264:*/
#line 6034 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef int8_t group_code;

/*:264*//*295:*/
#line 6733 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef struct{
quarterword state_field,index_field;
halfword start_field,loc_field,limit_field,name_field;
}in_state_record;

/*:295*//*542:*/
#line 11277 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef uint8_t internal_font_number;
typedef int32_t font_index;

/*:542*//*852:*/
#line 17508 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef int32_t trie_pointer;

/*:852*//*857:*/
#line 17577 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef int16_t hyph_pointer;

/*:857*//*1298:*/
#line 25208 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef int32_t save_pointer;

/*:1298*//*1520:*/
#line 28076 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef int mpfract;

/*:1520*/
#line 456 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*48:*/
#line 1231 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int s_no(const char*str);

/*:48*//*1449:*/
#line 27351 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_general_x_text(void);

/*:1449*//*1451:*/
#line 27366 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void toks_to_str(void);

/*:1451*//*1572:*/
#line 28572 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hout_allocate(void);
static void hint_open(void);
static void hint_close(void);

static void hyphenate_word(void);
static void hline_break(int final_widow_penalty);
static void execute_output(pointer p);
static void hout_node(pointer p);

static int hget_stream_no(int i);
static void hfinish_stream_group(void);
static void hfinish_page_group(void);
static void hfinish_stream_before_group(void);
static void hfinish_stream_after_group(void);
static void hfinish_outline_group(void);


static pointer new_xdimen(scaled w,scaled h,scaled v);
static pointer new_baseline_node(pointer bs,pointer ls,scaled lsl);
static void print_baseline_skip(int i);
static pointer new_set_node(void);
static pointer new_setstream_node(eight_bits n);
static pointer new_setpage_node(eight_bits k,str_number n);
static pointer new_disp_node(void);
static pointer new_image_node(str_number n,str_number a,str_number e);
static void new_param_node(eight_bits t,eight_bits n,int v);


/*:1572*//*1584:*/
#line 29116 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static ColorSet*colors= NULL;
static int max_color= -1,colors_allocated= 0;
static bool default_color_frozen= false,default_link_color_frozen= false;
static int cur_link_color= 1;
static int next_colorset(ColorSet c);

/*:1584*//*1590:*/
#line 29214 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
static void print_color_spec(int i);
#endif
#line 29218 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 static pointer new_color_node(uint8_t c);

/*:1590*//*1620:*/
#line 29840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool is_visible(pointer p);


/*:1620*//*1754:*/
#line 32917 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void main_init(int ac,char*av[]);


/*:1754*//*1760:*/
#line 33113 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void parse_options(int argc,char*argv[]);

/*:1760*//*1773:*/
#line 33342 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void recorder_change_filename(const char*new_name);

/*:1773*//*1777:*/
#line 33408 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void recorder_record_input(const char*fname);

/*:1777*//*1794:*/
#line 33787 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int input_command_line(void);


/*:1794*//*1823:*/
#line 34667 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int utf8_get_cur_chr(unsigned char*b,int i,int k);
static int utf8_put_char(unsigned char*b,int i,int k,uint32_t c);
static void print_utf8(uint32_t c);
static uint8_t utf_catcode(uint32_t i);
static uint32_t utf_set_catcode(uint32_t i,uint8_t cat);
static uint32_t utf_lccode(uint32_t i);
static uint32_t utf_set_lccode(uint32_t i,uint32_t lc);
static uint32_t utf_uccode(uint32_t i);
static uint32_t utf_set_uccode(uint32_t i,uint32_t uc);
static uint16_t utf_sfcode(uint32_t i);
static uint32_t utf_set_sfcode(uint32_t i,uint16_t sf);

static uint32_t utf_set_delcode(uint32_t i,uint32_t dc);
static int utf_delcode(uint32_t i);
static uint32_t utf_set_mathcode(uint32_t i,uint32_t mc);
static uint32_t utf_mathcode(uint32_t i);
static void utf_unsave(pointer p);
static int utf_lookup(pointer b,int i);
static void utf_define(pointer p,int c,int e,bool g);
static pointer utf_adjust_base(pointer p);
static int utf_b_used,utf_i_used,utf_unsave_list;
static scaled x_char_width(internal_font_number g,int c);
static scaled x_char_height(internal_font_number g,int c);
static scaled x_char_depth(internal_font_number g,int c);
static scaled x_char_italic(internal_font_number g,int c);
static pointer active_lookup(uint32_t k);



/*:1823*//*1826:*/
#line 34735 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool x_char_exists(internal_font_number g,int c);
static bool x_glyph(internal_font_number g,int c,hb_codepoint_t*glyph);
static scaled x_char_height(internal_font_number g,int c);
static scaled x_glyph_width(internal_font_number g,hb_codepoint_t glyph);
static scaled x_glyph_italic(internal_font_number g,hb_codepoint_t glyph);
static void x_glyph_height_depth(internal_font_number g,hb_codepoint_t glyph,scaled*h,scaled*d);
static void x_char_height_depth(internal_font_number g,int c,scaled*h,scaled*d);
#if 0
static FT_UInt ft_glyph(FT_Face ft_face,int c);
static bool ft_exists(FT_Face ft_face,int c);
static scaled ft_glyph_width(FT_Face ft_face,FT_UInt ft_gid,scaled s);
static scaled ft_width(FT_Face ft_face,int c,scaled s);
static FT_Error ft_glyph_bbox(FT_Face ft_face,FT_UInt ft_gid,FT_BBox*ft_bbox);
static void ft_glyph_height_depth(FT_Face ft_face,FT_UInt ft_gid,
scaled*h,scaled*d,scaled s);
static void ft_height_depth(FT_Face ft_face,int c,
scaled*h,scaled*d,scaled s);
static int ft_last(FT_Face ft_face);
static int ft_first(FT_Face ft_face);
#endif
#line 34756 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1826*/
#line 457 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*13:*/
#line 607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int bad;

/*:13*//*22:*/
#line 744 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static unsigned char name_of_file0[file_name_size+1]= {0},
*const name_of_file= name_of_file0-1;

static int name_length;


/*:22*//*26:*/
#line 814 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static UTF8_code buffer[buf_size+1];
static int first;
static int last;
static int max_buf_stack;

/*:26*//*28:*/
#line 887 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static alpha_file term_in;
static alpha_file term_out;

/*:28*//*35:*/
#line 1046 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static packed_ASCII_code str_pool[pool_size+1];
static pool_pointer str_start[max_strings+1];
static pool_pointer pool_ptr;
static str_number str_ptr;
static pool_pointer init_pool_ptr;
static str_number init_str_ptr;

/*:35*//*49:*/
#line 1282 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static alpha_file log_file;
static int selector;
static int8_t dig[23];
static int tally;
static int term_offset;

static int file_offset;

static UTF8_code trick_buf[error_line+1];

static int trick_count;
static int first_count;

/*:49*//*68:*/
#line 1655 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int interaction;

/*:68*//*71:*/
#line 1698 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool deletions_allowed;
static bool set_box_allowed;
static int history;
static int error_count;


/*:71*//*74:*/
#line 1757 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char*help_line[6];
static int help_ptr;
static bool use_err_help;

/*:74*//*91:*/
#line 2027 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int interrupt;
static bool OK_to_interrupt;

/*:91*//*99:*/
#line 2160 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool arith_error;
static scaled rem;

/*:99*//*110:*/
#line 2458 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer temp_ptr;

/*:110*//*111:*/
#line 2490 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static memory_word mem0[mem_max-mem_min+1],
*const mem= mem0-mem_min;
static pointer lo_mem_max;
static pointer hi_mem_min;

/*:111*//*112:*/
#line 2504 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int var_used,dyn_used;
#ifdef STAT
#define incr_dyn_used incr(dyn_used)
#define decr_dyn_used decr(dyn_used)
#else
#line 2510 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
#define incr_dyn_used
#define decr_dyn_used
#endif
#line 2513 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:112*//*113:*/
#line 2527 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer avail;
static pointer mem_end;

/*:113*//*119:*/
#line 2632 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer rover;

/*:119*//*160:*/
#line 3344 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
static bool is_free0[mem_max-mem_min+1],
*const is_free= is_free0-mem_min;
static bool was_free0[mem_max-mem_min+1],
*const was_free= was_free0-mem_min;

static pointer was_mem_end,was_lo_max,was_hi_min;

static bool panicking;
#endif
#line 3355 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:160*//*168:*/
#line 3500 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int font_in_short_display;

/*:168*//*176:*/
#line 3640 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int depth_threshold;
static int breadth_max;

/*:176*//*208:*/
#line 4349 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static list_state_record nest[nest_size+1];
static int nest_ptr;
static int max_nest_stack;
static list_state_record cur_list;
static int shown_mode;

/*:208*//*241:*/
#line 5381 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int old_setting;
static int sys_time,sys_day,sys_month,sys_year;


/*:241*//*248:*/
#line 5559 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static memory_word eqtb0[eqtb_size-active_base+1],
*const eqtb= eqtb0-active_base;
static memory_word hfactor_eqtb0[dimen_pars+256]= {{{0}}},
*const hfactor_eqtb= hfactor_eqtb0-dimen_base;
static memory_word vfactor_eqtb0[dimen_pars+256]= {{{0}}},
*const vfactor_eqtb= vfactor_eqtb0-dimen_base;
static scaled par_shape_hfactor= 0,par_shape_vfactor= 0;
static scaled hhsize= 0,hvsize= 0;
static quarterword xeq_level0[eqtb_size-int_base+1],
*const xeq_level= xeq_level0-int_base;

/*:248*//*251:*/
#line 5615 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static two_halves hash0[undefined_control_sequence-hash_base],
*const hash= hash0-hash_base;

static pointer hash_used;
static bool no_new_control_sequence;
static int cs_count;

/*:251*//*266:*/
#line 6043 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static memory_word save_stack[save_size+1];
static memory_word save_hfactor[save_size+1];
static memory_word save_vfactor[save_size+1];
static int save_ptr;
static int max_save_stack;
static quarterword cur_level;
static group_code cur_group;
static int cur_boundary;

/*:266*//*281:*/
#line 6376 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int mag_set;

/*:281*//*292:*/
#line 6642 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static eight_bits cur_cmd;
static halfword cur_chr;
static pointer cur_cs;
static halfword cur_tok;

/*:292*//*296:*/
#line 6739 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static in_state_record input_stack[stack_size+1];
static int input_ptr;
static int max_in_stack;
static in_state_record cur_input;


/*:296*//*299:*/
#line 6843 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int in_open;
static int open_parens;
static alpha_file input_file0[max_in_open],
*const input_file= input_file0-1;
static int line;
static int line_stack0[max_in_open],
*const line_stack= line_stack0-1;

/*:299*//*300:*/
#line 6888 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int scanner_status;
static pointer warning_index;
static pointer def_ref;

/*:300*//*303:*/
#line 7020 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer param_stack[param_size+1];

static int param_ptr;
static int max_param_stack;


/*:303*//*304:*/
#line 7040 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int align_state;
static int incsname_state;

/*:304*//*305:*/
#line 7052 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int base_ptr;

/*:305*//*328:*/
#line 7455 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer par_loc;
static halfword par_token;
static pointer input_loc;
static halfword input_token;

/*:328*//*356:*/
#line 7906 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool force_eof;

/*:356*//*377:*/
#line 8256 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer cur_mark0[split_bot_mark_code-top_mark_code+1],
*const cur_mark= cur_mark0-top_mark_code;


/*:377*//*382:*/
#line 8311 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int long_state;

/*:382*//*383:*/
#line 8322 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer pstack[9];

/*:383*//*405:*/
#line 8720 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int cur_val,cur_hfactor,cur_vfactor;
static int cur_val_level;

/*:405*//*433:*/
#line 9168 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static small_number radix;

/*:433*//*442:*/
#line 9319 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static glue_ord cur_order;

/*:442*//*475:*/
#line 10012 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static alpha_file read_file[16];
static int8_t read_open[17];

/*:475*//*484:*/
#line 10205 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer cond_ptr;
static int if_limit;
static small_number cur_if;
static int if_line;

/*:484*//*488:*/
#line 10231 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int skip_line;

/*:488*//*507:*/
#line 10571 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static str_number cur_name;
static str_number cur_area;
static str_number cur_ext;

/*:507*//*508:*/
#line 10587 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pool_pointer area_delimiter;
static pool_pointer ext_delimiter;

/*:508*//*521:*/
#line 10785 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool name_in_progress;
static str_number job_name;
static bool log_opened;

/*:521*//*526:*/
#line 10851 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static str_number output_file_name;
static str_number log_name;

/*:526*//*533:*/
#line 10999 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static byte_file tfm_file;

/*:533*//*543:*/
#line 11286 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static memory_word font_info[font_mem_size+1];

static font_index fmem_ptr;
static internal_font_number font_ptr;
static four_quarters font_check0[font_max-font_base+1],
*const font_check= font_check0-font_base;
static scaled font_size0[font_max-font_base+1],
*const font_size= font_size0-font_base;
static scaled font_dsize0[font_max-font_base+1],
*const font_dsize= font_dsize0-font_base;
static font_index font_params0[font_max-font_base+1],
*const font_params= font_params0-font_base;

static str_number font_name0[font_max-font_base+1],
*const font_name= font_name0-font_base;
static str_number font_area0[font_max-font_base+1],
*const font_area= font_area0-font_base;
static int font_bc0[font_max-font_base+1],
*const font_bc= font_bc0-font_base;

static int font_ec0[font_max-font_base+1],
*const font_ec= font_ec0-font_base;

static pointer font_glue0[font_max-font_base+1],
*const font_glue= font_glue0-font_base;

static int hyphen_char0[font_max-font_base+1],
*const hyphen_char= hyphen_char0-font_base;

static int skew_char0[font_max-font_base+1],
*const skew_char= skew_char0-font_base;

static font_index bchar_label0[font_max-font_base+1],
*const bchar_label= bchar_label0-font_base;


static int16_t font_bchar0[font_max-font_base+1],
*const font_bchar= font_bchar0-font_base;

static int16_t font_false_bchar0[font_max-font_base+1],
*const font_false_bchar= font_false_bchar0-font_base;


/*:543*//*544:*/
#line 11339 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int char_base0[font_max-font_base+1],
*const char_base= char_base0-font_base;

static int width_base0[font_max-font_base+1],
*const width_base= width_base0-font_base;

static int height_base0[font_max-font_base+1],
*const height_base= height_base0-font_base;

static int depth_base0[font_max-font_base+1],
*const depth_base= depth_base0-font_base;

static int italic_base0[font_max-font_base+1],
*const italic_base= italic_base0-font_base;

static int lig_kern_base0[font_max-font_base+1],
*const lig_kern_base= lig_kern_base0-font_base;

static int kern_base0[font_max-font_base+1],
*const kern_base= kern_base0-font_base;

static int exten_base0[font_max-font_base+1],
*const exten_base= exten_base0-font_base;

static int param_base0[font_max-font_base+1],
*const param_base= param_base0-font_base;


/*:544*//*548:*/
#line 11434 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static four_quarters null_character;

/*:548*//*583:*/
#line 12189 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int total_pages;
static scaled max_v;
static scaled max_h;
static int max_push;
static int last_bop;
static int dead_cycles;
static bool doing_leaders;


/*:583*//*589:*/
#line 12305 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled total_stretch0[filll-normal+1],
*const total_stretch= total_stretch0-normal,
total_shrink0[filll-normal+1],*const total_shrink= total_shrink0-normal;

static int last_badness;

/*:589*//*590:*/
#line 12317 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer adjust_tail;

/*:590*//*603:*/
#line 12458 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int pack_begin_line;


/*:603*//*615:*/
#line 12732 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static two_halves empty_field;
static four_quarters null_delimiter;

/*:615*//*650:*/
#line 13409 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer cur_mlist;
static small_number cur_style;
static small_number cur_size;
static scaled cur_mu;
static bool mlist_penalties;

/*:650*//*655:*/
#line 13505 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static internal_font_number cur_f;
static quarterword cur_c;
static four_quarters cur_i;


/*:655*//*696:*/
#line 14331 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static const int magic_offset= -9*ord_noad;

/*:696*//*701:*/
#line 14529 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer cur_align;
static pointer cur_span;
static pointer cur_loop;
static pointer align_ptr;
static pointer cur_head,cur_tail;

/*:701*//*746:*/
#line 15348 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer just_box;

/*:746*//*753:*/
#line 15493 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer passive;
static pointer printed_node;
static halfword pass_number;

/*:753*//*755:*/
#line 15532 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled active_width0[6],*const active_width= active_width0-1;

static scaled cur_active_width0[6],
*const cur_active_width= cur_active_width0-1;
static scaled background0[6],*const background= background0-1;
static scaled break_width0[6],*const break_width= break_width0-1;

/*:755*//*757:*/
#line 15590 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool no_shrink_error_yet;

/*:757*//*760:*/
#line 15650 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer cur_p;
static bool second_pass;
static bool final_pass;
static int threshold;

/*:760*//*765:*/
#line 15751 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int minimal_demerits0[tight_fit-very_loose_fit+1],
*const minimal_demerits= minimal_demerits0-very_loose_fit;

static int minimum_demerits;

static pointer best_place0[tight_fit-very_loose_fit+1],
*const best_place= best_place0-very_loose_fit;

static halfword best_pl_line0[tight_fit-very_loose_fit+1],
*const best_pl_line= best_pl_line0-very_loose_fit;


/*:765*//*771:*/
#line 15872 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled disc_width;

/*:771*//*779:*/
#line 16014 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static halfword easy_line;
static halfword last_special_line;

static scaled first_width;

static scaled second_width;
static scaled first_indent;
static scaled second_indent;

/*:779*//*804:*/
#line 16528 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer best_bet;
static int fewest_demerits;
static halfword best_line;
static int actual_looseness;

static int line_diff;


/*:804*//*824:*/
#line 16888 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int32_t hc[max_hyph_length+4];
static int hn;
static pointer ha,hb;
static internal_font_number hf;
static int32_t hu[max_hyph_length+2];
static int hyf_char;
static int cur_lang,init_cur_lang;
static int l_hyf,r_hyf,init_l_hyf,init_r_hyf;
static halfword hyf_bchar;
static int max_hyph_char;

/*:824*//*832:*/
#line 17045 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int8_t hyf[max_hyph_length+2];
static pointer init_list;
static bool init_lig;
static bool init_lft;

/*:832*//*837:*/
#line 17169 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static small_number hyphen_passed;

/*:837*//*839:*/
#line 17210 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static halfword cur_l,cur_r;
static pointer cur_q;
static pointer lig_stack;
static bool ligature_present;
static bool lft_hit,rt_hit;

/*:839*//*853:*/
#line 17515 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static two_halves trie[trie_size+1];
static small_number hyf_distance0[trie_op_size],
*const hyf_distance= hyf_distance0-1;
static small_number hyf_num0[trie_op_size],
*const hyf_num= hyf_num0-1;
static quarterword hyf_next0[trie_op_size],
*const hyf_next= hyf_next0-1;
static uint16_t op_start[max_language+1];

/*:853*//*858:*/
#line 17580 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static str_number hyph_word[hyph_size+1];
static pointer hyph_list[hyph_size+1];
static hyph_pointer hyph_count;

/*:858*//*875:*/
#line 17799 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
static uint16_t trie_op_hash0[trie_op_size+trie_op_size+1],
*const trie_op_hash= trie_op_hash0+trie_op_size;

static quarterword trie_used[max_language+1];

static uint8_t trie_op_lang0[trie_op_size],
*const trie_op_lang= trie_op_lang0-1;

static quarterword trie_op_val0[trie_op_size],
*const trie_op_val= trie_op_val0-1;

static int trie_op_ptr;
#endif
#line 17814 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:875*//*879:*/
#line 17895 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
static uint32_t trie_c[trie_size+1];

static quarterword trie_o[trie_size+1];

static trie_pointer trie_l[trie_size+1];

static trie_pointer trie_r[trie_size+1];

static trie_pointer trie_ptr;
static trie_pointer trie_hash[trie_size+1];

#endif
#line 17909 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:879*//*882:*/
#line 17983 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
static bool trie_taken0[trie_size],
*const trie_taken= trie_taken0-1;

static trie_pointer trie_min[max_pattern_char+1];

static trie_pointer trie_max;
static bool trie_not_ready;
#endif
#line 17993 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:882*//*894:*/
#line 18192 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool pattern_warning_given= false;
static bool skip_pattern= false;

/*:894*//*904:*/
#line 18388 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled best_height_plus_depth;


/*:904*//*913:*/
#line 18614 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer page_tail;
static int page_contents;
static scaled page_max_depth;
static int least_page_cost;

/*:913*//*915:*/
#line 18695 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled page_so_far[8];
static pointer last_glue;
static int last_penalty;
static scaled last_kern;
static int last_node_type;
static int insert_penalties;


/*:915*//*922:*/
#line 18830 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool output_active;

/*:922*//*935:*/
#line 19044 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static internal_font_number main_f;
static four_quarters main_i;
static four_quarters main_j;
static font_index main_k;
static pointer main_p;
static int main_s;
static halfword bchar;
static halfword false_bchar;
static bool cancel_boundary;
static bool ins_disc;

/*:935*//*977:*/
#line 19840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer cur_box;

/*:977*//*1161:*/
#line 22530 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static halfword after_token;

/*:1161*//*1176:*/
#line 22632 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool long_help_seen;

/*:1176*//*1194:*/
#line 22837 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static str_number format_ident,frozen_format_ident;

/*:1194*//*1200:*/
#line 22924 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static word_file fmt_file;

/*:1200*//*1226:*/
#line 23401 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int ready_already;

/*:1226*//*1237:*/
#line 23891 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static alpha_file write_file[16];
static bool write_open[18];

/*:1237*//*1240:*/
#line 23925 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer write_loc;

/*:1240*//*1273:*/
#line 24940 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int eTeX_mode;

/*:1273*//*1280:*/
#line 25000 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool eof_seen0[max_in_open],
*const eof_seen= eof_seen0-1;

/*:1280*//*1322:*/
#line 25495 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer pseudo_files;

/*:1322*//*1345:*/
#line 25758 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static save_pointer grp_stack[max_in_open+1];
static pointer if_stack[max_in_open+1];

/*:1345*//*1386:*/
#line 26400 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static halfword max_reg_num;
static char*max_reg_help_line;

/*:1386*//*1388:*/
#line 26467 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer sa_root0[mark_val-int_val+1],
*const sa_root= sa_root0-int_val;
static pointer cur_ptr;
static memory_word sa_null;

/*:1388*//*1406:*/
#line 26853 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer sa_chain;
static quarterword sa_level;

/*:1406*//*1417:*/
#line 27100 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static trie_pointer hyph_start;
static trie_pointer hyph_index;

/*:1417*//*1418:*/
#line 27112 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer disc_ptr0[vsplit_code-copy_code+1],
*const disc_ptr= disc_ptr0-copy_code;

/*:1418*//*1426:*/
#line 27176 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int expand_depth_count;

/*:1426*//*1430:*/
#line 27200 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int Prote_mode;

/*:1430*//*1454:*/
#line 27421 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static eight_bits xchg_buffer0[xchg_buffer_size],
*const xchg_buffer= xchg_buffer0-1;

static int xchg_buffer_length;
/*:1454*//*1469:*/
#line 27576 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static memory_word ROM0[ROM_size-ROM_base+1],
*const ROM= ROM0-ROM_base;

/*:1469*//*1515:*/
#line 27996 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int two_to_the[31];
static int spec_log0[28],*const spec_log= spec_log0-1;

/*:1515*//*1526:*/
#line 28214 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static mpfract randoms[55];
static int j_random;

/*:1526*//*1527:*/
#line 28221 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int random_seed;

/*:1527*//*1552:*/
#line 28450 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled last_saved_xpos,last_saved_ypos;

/*:1552*//*1557:*/
#line 28481 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int last_save_pos_number;

/*:1557*//*1595:*/
#line 29294 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer color_tos= null;
static pointer link_tos= null;

/*:1595*//*1752:*/
#line 32894 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char**argv;
static int argc;

/*:1752*//*1758:*/
#line 33044 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int iniversion= false,etexp= false,ltxp= false,recorder_enabled= false;
static int parsefirstlinep= -1,filelineerrorstylep= -1,interaction_option= -1;
static const char*user_progname= NULL,*output_directory= NULL,*c_job_name= NULL,
*dump_name= NULL;
static int option_no_empty_page= true,option_hyphen_first= true;
static int option_dpi= 600;
static const char*option_mfmode= "ljfour",*option_dpi_str= "600";
extern int option_compress;
extern unsigned int debugflags;
static int option_subset= true;

static struct option long_options[]= {
{"help",0,0,0},
{"version",0,0,0},
{"interaction",1,0,0},
{"mktex",1,0,0},
{"no-mktex",1,0,0},
{"kpathsea-debug",1,0,0},
{"progname",1,0,0},
{"fmt",1,0,0},
{"output-directory",1,0,0},
{"jobname",1,0,0},
{"cnf-line",1,0,0},
{"ini",0,&iniversion,1},
{"etex",0,&etexp,1},
{"ltx",0,&ltxp,1},
{"recorder",0,&recorder_enabled,1},
{"parse-first-line",0,&parsefirstlinep,1},
{"no-parse-first-line",0,&parsefirstlinep,0},
{"file-line-error",0,&filelineerrorstylep,1},
{"no-file-line-error",0,&filelineerrorstylep,0},
{"compress",0,&option_compress,1},
{"no-subset",0,&option_subset,0},
{"subset",0,&option_subset,1},
{"no-empty-page",0,&option_no_empty_page,1},
{"empty-page",0,&option_no_empty_page,0},
{"hyphenate-first-word",0,&option_hyphen_first,1},
{"no-hyphenate-first-word",0,&option_hyphen_first,0},
{"resolution",1,0,0},
{"mfmode",1,0,0},
#ifdef DEBUG
{"hint-debug",1,0,0},
{"hint-debug-help",0,0,0},
#endif
#line 33089 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
{0,0,0,0}};


/*:1758*//*1779:*/
#line 33444 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char**cnf_lines= NULL;
static int cnf_count= 0;

/*:1779*//*1789:*/
#line 33642 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char*source_filename_stack0[max_in_open]= {NULL},**const source_filename_stack= source_filename_stack0-1;
static char*full_source_filename_stack0[max_in_open]= {NULL},**const full_source_filename_stack= full_source_filename_stack0-1;
static char*full_name_of_file= NULL;

/*:1789*//*1819:*/
#line 34585 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static uint32_t active_hash0[active_hash_size]= {0},
*const active_hash= active_hash0-active_hash_base;
static int active_used= 0;

/*:1819*//*1831:*/
#line 34822 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

int f_index;
int f_delimiter;


/*:1831*//*1846:*/
#line 35219 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef struct{
hb_blob_t*blob;
hb_subset_input_t*sub;
hb_set_t*subset;
hb_font_t*f;
int i;
}x_font_info;
typedef x_font_info*x_font_ptr;

static x_font_ptr x_font0[font_max-font_base+1]= {NULL},
*const x_font= x_font0-font_base;

/*:1846*/
#line 458 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static void initialize(void)
{/*158:*/
#line 3302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

int i;
int k;

/*:158*//*859:*/
#line 17585 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

int z;

/*:859*/
#line 461 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*8:*/
#line 506 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*69:*/
#line 1658 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(interaction_option<0)interaction= error_stop_mode;
else interaction= interaction_option;

/*:69*//*72:*/
#line 1708 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

deletions_allowed= true;set_box_allowed= true;
error_count= 0;

/*:72*//*75:*/
#line 1762 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

help_ptr= 0;use_err_help= false;

/*:75*//*92:*/
#line 2031 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

interrupt= 0;OK_to_interrupt= true;

/*:92*//*161:*/
#line 3356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
was_mem_end= mem_min;
was_lo_max= mem_min;was_hi_min= mem_max;
panicking= false;
#endif
#line 3362 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:161*//*210:*/
#line 4369 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

nest_ptr= 0;max_nest_stack= 0;
mode= vmode;head= contrib_head;tail= contrib_head;
eTeX_aux= null;
prev_depth= ignore_depth;mode_line= 0;
prev_graf= 0;shown_mode= 0;
/*924:*/
#line 18840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

page_contents= empty;page_tail= page_head;link(page_head)= null;
last_glue= max_halfword;last_penalty= 0;last_kern= 0;
last_node_type= -1;
page_depth= 0;page_max_depth= 0

/*:924*/
#line 4375 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;

/*:210*//*249:*/
#line 5571 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= int_base;k<=eqtb_size;k++)xeq_level[k]= level_one;

/*:249*//*252:*/
#line 5623 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

no_new_control_sequence= true;
next(hash_base)= 0;text(hash_base)= 0;
for(k= hash_base+1;k<=undefined_control_sequence-1;k++)hash[k]= hash[hash_base];

/*:252*//*267:*/
#line 6058 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

save_ptr= 0;cur_level= level_one;cur_group= bottom_level;cur_boundary= 0;
max_save_stack= 0;

/*:267*//*282:*/
#line 6379 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

mag_set= 0;

/*:282*//*378:*/
#line 8261 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

top_mark= null;first_mark= null;bot_mark= null;
split_first_mark= null;split_bot_mark= null;

/*:378*//*434:*/
#line 9175 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_val= 0;cur_val_level= int_val;radix= 0;cur_order= normal;

/*:434*//*476:*/
#line 10016 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= 0;k<=16;k++)read_open[k]= closed;

/*:476*//*485:*/
#line 10211 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cond_ptr= null;if_limit= normal;cur_if= 0;if_line= 0;

/*:485*//*549:*/
#line 11437 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

null_character.b0= min_quarterword;null_character.b1= min_quarterword;
null_character.b2= min_quarterword;null_character.b3= min_quarterword;

/*:549*//*584:*/
#line 12199 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

total_pages= 0;max_v= 0;max_h= 0;max_push= 0;last_bop= -1;
doing_leaders= false;dead_cycles= 0;



/*:584*//*591:*/
#line 12320 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
adjust_tail= null;last_badness= 0;

/*:591*//*604:*/
#line 12462 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

pack_begin_line= 0;

/*:604*//*616:*/
#line 12736 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

empty_field.rh= empty;empty_field.lh= null;
null_delimiter.b0= 0;null_delimiter.b1= min_quarterword;
null_delimiter.b2= 0;null_delimiter.b3= min_quarterword;

/*:616*//*702:*/
#line 14538 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

align_ptr= null;cur_align= null;cur_span= null;cur_loop= null;
cur_head= null;cur_tail= null;

/*:702*//*825:*/
#line 16913 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

max_hyph_char= max_language+1;

/*:825*//*860:*/
#line 17588 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(z= 0;z<=hyph_size;z++)
{hyph_word[z]= 0;hyph_list[z]= null;
}
hyph_count= 0;

/*:860*//*923:*/
#line 18833 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

output_active= false;insert_penalties= 0;

/*:923*//*936:*/
#line 19060 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

ligature_present= false;cancel_boundary= false;lft_hit= false;rt_hit= false;
ins_disc= false;

/*:936*//*1162:*/
#line 22533 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

after_token= 0;

/*:1162*//*1177:*/
#line 22635 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
long_help_seen= false;

/*:1177*//*1195:*/
#line 22840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

format_ident= frozen_format_ident= 0;

/*:1195*//*1238:*/
#line 23895 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= 0;k<=17;k++)write_open[k]= false;

/*:1238*//*1323:*/
#line 25498 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

pseudo_files= null;

/*:1323*//*1389:*/
#line 26473 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

sa_mark= null;sa_null.hh.lh= null;sa_null.hh.rh= null;

/*:1389*//*1407:*/
#line 26857 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

sa_chain= null;sa_level= level_zero;

/*:1407*//*1419:*/
#line 27116 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

page_disc= null;split_disc= null;

/*:1419*/
#line 507 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
if(iniversion)
{/*159:*/
#line 3306 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= mem_bot+1;k<=lo_mem_stat_max;k++)mem[k].sc= 0;


k= mem_bot;while(k<=lo_mem_stat_max)

{glue_ref_count(k)= null+1;
stretch_order(k)= normal;shrink_order(k)= normal;
k= k+glue_spec_size;
}
stretch(fil_glue)= unity;stretch_order(fil_glue)= fil;
stretch(fill_glue)= unity;stretch_order(fill_glue)= fill;
stretch(ss_glue)= unity;stretch_order(ss_glue)= fil;
shrink(ss_glue)= unity;shrink_order(ss_glue)= fil;
stretch(fil_neg_glue)= -unity;stretch_order(fil_neg_glue)= fil;
rover= lo_mem_stat_max+1;
link(rover)= empty_flag;
node_size(rover)= 1000;
llink(rover)= rover;rlink(rover)= rover;
lo_mem_max= rover+1000;link(lo_mem_max)= null;info(lo_mem_max)= null;
for(k= hi_mem_stat_min;k<=mem_top;k++)
mem[k]= mem[lo_mem_max];
/*721:*/
#line 14851 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

info(omit_template)= end_template_token;

/*:721*//*728:*/
#line 14976 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link(end_span)= max_quarterword+1;info(end_span)= null;

/*:728*//*752:*/
#line 15463 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

type(last_active)= hyphenated;line_number(last_active)= max_halfword;
subtype(last_active)= 0;

/*:752*//*914:*/
#line 18665 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

subtype(page_ins_head)= qi(255);
type(page_ins_head)= split_up;link(page_ins_head)= page_ins_head;

/*:914*//*921:*/
#line 18824 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

type(page_head)= glue_node;subtype(page_head)= normal;

/*:921*/
#line 3328 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
avail= null;mem_end= mem_top;
hi_mem_min= hi_mem_stat_min;
var_used= lo_mem_stat_max+1-mem_bot;dyn_used= hi_mem_stat_usage;


/*:159*//*217:*/
#line 4567 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

eq_type(undefined_control_sequence)= undefined_cs;
equiv(undefined_control_sequence)= null;
eq_level(undefined_control_sequence)= level_zero;
for(k= active_base;k<=undefined_control_sequence-1;k++)
eqtb[k]= eqtb[undefined_control_sequence];

/*:217*//*223:*/
#line 4722 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

equiv(glue_base)= zero_glue;eq_level(glue_base)= level_one;
eq_type(glue_base)= glue_ref;
for(k= glue_base+1;k<=local_base-1;k++)eqtb[k]= eqtb[glue_base];
glue_ref_count(zero_glue)= glue_ref_count(zero_glue)+local_base-glue_base;

/*:223*//*227:*/
#line 4866 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

par_shape_ptr= null;eq_type(par_shape_loc)= shape_ref;
eq_level(par_shape_loc)= level_one;
for(k= etex_pen_base;k<=etex_pens-1;k++)
eqtb[k]= eqtb[par_shape_loc];
for(k= output_routine_loc;k<=toks_base+255;k++)
eqtb[k]= eqtb[undefined_control_sequence];
box(0)= null;eq_type(box_base)= box_ref;eq_level(box_base)= level_one;
for(k= box_base+1;k<=box_base+255;k++)eqtb[k]= eqtb[box_base];
cur_font= null_font;eq_type(cur_font_loc)= data;
eq_level(cur_font_loc)= level_one;
for(k= math_font_base;k<=math_font_base+47;k++)eqtb[k]= eqtb[cur_font_loc];
equiv(cat_code_base)= 0;eq_type(cat_code_base)= data;
eq_level(cat_code_base)= level_one;
for(k= cat_code_base+1;k<=int_base-1;k++)eqtb[k]= eqtb[cat_code_base];
for(k= 0;k<=255;k++)
{equiv(cat_code_base+k)= other_char;equiv(math_code_base+k)= hi(k);
equiv(sf_code_base+k)= 1000;
}
equiv(cat_code_base+carriage_return)= car_ret;equiv(cat_code_base+' ')= spacer;
equiv(cat_code_base+'\\')= escape;equiv(cat_code_base+'%')= comment;
equiv(cat_code_base+invalid_code)= invalid_char;equiv(cat_code_base+null_code)= ignore;
for(k= '0';k<='9';k++)equiv(math_code_base+k)= hi(k+utf_var_code);
for(k= 'A';k<='Z';k++)
{equiv(cat_code_base+k)= letter;equiv(cat_code_base+k+'a'-'A')= letter;
equiv(math_code_base+k)= k+utf_var_code+(1<<24);
equiv(math_code_base+k+'a'-'A')= hi(k+'a'-'A'+utf_var_code+(1<<24));
equiv(sf_code_base+k)= 999;
#if 0
lc_code(k)= k+'a'-'A';lc_code(k+'a'-'A')= k+'a'-'A';
uc_code(k)= k;uc_code(k+'a'-'A')= k;
#endif
#line 4898 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
}
/*1818:*/
#line 34546 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"



equiv(sf_code_base+'}')= 0;

equiv(cat_code_base+170)= 11;equiv(math_code_base+170)= 31457450;

equiv(cat_code_base+181)= 11;equiv(math_code_base+181)= 31457461;

equiv(cat_code_base+186)= 11;equiv(math_code_base+186)= 31457466;

equiv(sf_code_base+187)= 0;

for(k= 192;k<=214;k++)
{equiv(cat_code_base+k)= 11;
equiv(sf_code_base+k)= 999;
equiv(math_code_base+k)= 0x1E00000+k;
}

for(k= 216;k<=222;k++)
{equiv(cat_code_base+k)= 11;
equiv(sf_code_base+k)= 999;
equiv(math_code_base+k)= 0x1E00000+k;
}

for(k= 223;k<=246;k++)
{equiv(cat_code_base+k)= 11;
equiv(math_code_base+k)= 0x1E00000+k;
}

for(k= 248;k<=255;k++)
{equiv(cat_code_base+k)= 11;
equiv(math_code_base+k)= 0x1E00000+k;
}


/*:1818*/
#line 4899 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:227*//*235:*/
#line 5318 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= int_base;k<=del_code_base-1;k++)eqtb[k].i= 0;
mag= 1000;tolerance= 10000;hang_after= 1;max_dead_cycles= 25;
escape_char= '\\';end_line_char= carriage_return;
for(k= 0;k<=255;k++)equiv(del_code_base+k)= -1;
equiv(del_code_base+'.')= 0;

/*:235*//*245:*/
#line 5527 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= dimen_base;k<=eqtb_size;k++)hfactor_eqtb[k].sc= vfactor_eqtb[k].sc= eqtb[k].sc= 0;

/*:245*//*253:*/
#line 5628 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hash_used= frozen_control_sequence;
cs_count= 0;
eq_type(frozen_dont_expand)= dont_expand;
text(frozen_dont_expand)= s_no("notexpanded:");


/*:253*//*545:*/
#line 11371 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

font_ptr= null_font;fmem_ptr= 7;
font_name[null_font]= s_no("nullfont");font_area[null_font]= empty_string;
hyphen_char[null_font]= '-';skew_char[null_font]= -1;
bchar_label[null_font]= non_address;
font_bchar[null_font]= non_char;font_false_bchar[null_font]= non_char;
font_bc[null_font]= 1;font_ec[null_font]= 0;
font_size[null_font]= 0;font_dsize[null_font]= 0;
char_base[null_font]= 0;width_base[null_font]= 0;
height_base[null_font]= 0;depth_base[null_font]= 0;
italic_base[null_font]= 0;lig_kern_base[null_font]= 0;
kern_base[null_font]= 0;exten_base[null_font]= 0;
font_glue[null_font]= null;font_params[null_font]= 7;
param_base[null_font]= -1;
for(k= 0;k<=6;k++)font_info[k].sc= 0;

/*:545*//*878:*/
#line 17872 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= -trie_op_size;k<=trie_op_size;k++)trie_op_hash[k]= 0;
for(k= 0;k<=max_language;k++)trie_used[k]= min_quarterword;
trie_op_ptr= 0;

/*:878*//*883:*/
#line 18000 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

trie_not_ready= true;trie_root= 0;trie_c[0]= 0;trie_ptr= 0;

/*:883*//*1111:*/
#line 21749 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

text(frozen_protection)= s_no("inaccessible");


/*:1111*//*1196:*/
#line 22845 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

format_ident= frozen_format_ident= s_no(" (INITEX)");

/*:1196*//*1259:*/
#line 24730 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

text(end_write)= s_no("endwrite");eq_level(end_write)= level_one;
eq_type(end_write)= outer_call;equiv(end_write)= null;

/*:1259*//*1274:*/
#line 24943 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

eTeX_mode= 0;
/*1384:*/
#line 26392 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

max_reg_num= 255;
max_reg_help_line= "A register number must be between 0 and 255.";

/*:1384*/
#line 24945 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1274*//*1390:*/
#line 26476 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(i= int_val;i<=tok_val;i++)sa_root[i]= null;

/*:1390*//*1413:*/
#line 27047 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hyph_root= 0;hyph_start= 0;

/*:1413*//*1431:*/
#line 27208 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

Prote_mode= 0;

/*:1431*//*1470:*/
#line 27585 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

ROM[ROM_undefined_primitive]= eqtb[undefined_control_sequence];
for(k= ROM_base;k<=256;k++)ROM[k]= ROM[ROM_undefined_primitive];
for(k= ROM_undefined_primitive+1;k<=ROM_size;k++)
ROM[k]= ROM[ROM_undefined_primitive];

/*:1470*/
#line 510 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
}
#endif
#line 512 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:8*/
#line 462 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
/*51:*/
#line 1305 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#define put(F)    fwrite(&((F).d),sizeof((F).d),1,(F).f)
#define get(F)    (void)fread(&((F).d),sizeof((F).d),1,(F).f)

#define pascal_close(F)    fclose((F).f),(F).f= NULL
#define eof(F)    feof((F).f)
#define eoln(F)    ((F).d=='\n'||eof(F))
#define erstat(F)   ((F).f==NULL?-1:ferror((F).f))

#define pascal_write(F, FMT,...)    fprintf(F.f,FMT,## __VA_ARGS__)
#define write_ln(F,...)    pascal_write(F,__VA_ARGS__"\n")

#define wterm(FMT,...) pascal_write(term_out,FMT, ## __VA_ARGS__)
#define wterm_ln(FMT,...) wterm(FMT "\n", ## __VA_ARGS__)
#define wterm_cr         pascal_write(term_out,"\n")
#define wlog(FMT, ...) pascal_write(log_file,FMT, ## __VA_ARGS__)
#define wlog_ln(FMT, ...)   wlog(FMT "\n", ## __VA_ARGS__)
#define wlog_cr         pascal_write(log_file,"\n")

/*:51*//*52:*/
#line 1326 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_ln(void)
{switch(selector){
case term_and_log:{wterm_cr;wlog_cr;
term_offset= 0;file_offset= 0;
}break;
case log_only:{wlog_cr;file_offset= 0;
}break;
case term_only:{wterm_cr;term_offset= 0;
}break;
case no_print:case pseudo:case new_string:do_nothing;break;
default:write_ln(write_file[selector]);
}
}

/*:52*//*53:*/
#line 1344 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_char(UTF8_code s)
{
if(/*239:*/
#line 5357 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
s==new_line_char

/*:239*/
#line 1347 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
)
if(selector<pseudo)
{print_ln();return;
}
switch(selector){
case term_and_log:{wterm("%c",s);wlog("%c",s);
incr(term_offset);incr(file_offset);
if(term_offset==max_print_line)
{wterm_cr;term_offset= 0;
}
if(file_offset==max_print_line)
{wlog_cr;file_offset= 0;
}
}break;
case log_only:{wlog("%c",s);incr(file_offset);
if(file_offset==max_print_line)print_ln();
}break;
case term_only:{wterm("%c",s);incr(term_offset);
if(term_offset==max_print_line)print_ln();
}break;
case no_print:do_nothing;break;
case pseudo:if(tally<trick_count)trick_buf[tally%error_line]= s;break;
case new_string:{if(pool_ptr<pool_size)append_char(s);
}break;
default:pascal_write(write_file[selector],"%c",s);
}
incr(tally);
}

/*:53*//*54:*/
#line 1384 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print(char*s)
{if(s==NULL)s= "???";
while(*s!=0)print_char(*s++);
}

static void printn(int s)
{
pool_pointer j;
int nl;
if(s>=str_ptr){print("???");return;}

else if(s<0x80)
if(s<0){print("???");return;}
else{if(selector> pseudo)
{print_char(s);return;
}
if((/*239:*/
#line 5357 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
s==new_line_char

/*:239*/
#line 1401 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
))
if(selector<pseudo)
{print_ln();return;
}
nl= new_line_char;new_line_char= -1;

j= str_start[s];
while(j<str_start[s+1])
{print_char(str_pool[j]);incr(j);
}
new_line_char= nl;return;
}
j= str_start[s];
while(j<str_start[s+1])
{print_char(str_pool[j]);incr(j);
}
}

/*:54*//*55:*/
#line 1423 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void slow_print(int s)
{pool_pointer j;
if((s>=str_ptr)||(s<0x80))printn(s);
else{j= str_start[s];
while(j<str_start[s+1])
{if(str_pool[j]<0x80)
printn(str_pool[j]);
else
print_char(str_pool[j]);
incr(j);
}
}
}

/*:55*//*57:*/
#line 1456 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_nl(char*s)
{if(((term_offset> 0)&&(odd(selector)))||
((file_offset> 0)&&(selector>=log_only)))print_ln();
print(s);
}

/*:57*//*58:*/
#line 1466 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void printn_esc(str_number s)
{int c;
/*238:*/
#line 5355 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
c= escape_char

/*:238*/
#line 1469 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(c>=0)if(c<256)printn(c);
slow_print(s);
}

static void print_esc(char*s)
{int c;
/*238:*/
#line 5355 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
c= escape_char

/*:238*/
#line 1476 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(c>=0)if(c<256)printn(c);
print(s);
}

/*:58*//*59:*/
#line 1483 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_the_digs(eight_bits k)

{while(k> 0)
{decr(k);
if(dig[k]<10)print_char('0'+dig[k]);
else print_char('A'-10+dig[k]);
}
}

/*:59*//*60:*/
#line 1499 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_int(int n)
{int k;
int m;
k= 0;
if(n<0)
{print_char('-');
if(n> -100000000)negate(n);
else{m= -1-n;n= m/10;m= (m%10)+1;k= 1;
if(m<10)dig[0]= m;
else{dig[0]= 0;incr(n);
}
}
}
do{dig[k]= n%10;n= n/10;incr(k);
}while(!(n==0));
print_the_digs(k);
}

/*:60*//*257:*/
#line 5706 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_cs(int p)
{if(p<hash_base)
if(p>=single_base)
if(p==null_cs)
{print_esc("csname");print_esc("endcsname");print_char(' ');
}
else{printn_esc(p-single_base);
if(equiv(cat_code_base+p-single_base)==letter)print_char(' ');
}
else if(p<active_base)print_esc("IMPOSSIBLE.");

else if(p<active_hash_base)printn(p-active_base);
else if(active_hash[p]==0)print_esc("NONEXISTENT.");
else print_utf8(active_hash[p]);
else if(p>=undefined_control_sequence)print_esc("IMPOSSIBLE.");
else if((text(p)<0)||(text(p)>=str_ptr))print_esc("NONEXISTENT.");

else{if(p==frozen_primitive)print_esc("primitive");
printn_esc(text(p));print_char(' ');
}
}

/*:257*//*258:*/
#line 5732 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void sprint_cs(pointer p)
{if(p<hash_base)
{if(p<active_hash_base)printn(p-active_base);
else if(p<single_base)print_utf8(active_hash[p]);
else if(p<null_cs)printn_esc(p-single_base);
else{print_esc("csname");print_esc("endcsname");}
}
else printn_esc(text(p));
}

/*:258*//*512:*/
#line 10641 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_file_name(int n,int a,int e)
{slow_print(a);slow_print(n);slow_print(e);
}

/*:512*//*630:*/
#line 13039 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_size(int s)
{if(s==text_size)print_esc("textfont");
else if(s==script_size)print_esc("scriptfont");
else print_esc("scriptscriptfont");
}

/*:630*//*1251:*/
#line 24302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_mark(int p);
static void print_label(pointer p)
{print("goto ");
if(label_has_name(p)){print("name ");print_mark(label_ptr(p));}
else{print("num ");print_int(label_ptr(p));}
}

static void print_write_whatsit(char*s,pointer p)
{print_esc(s);
if(write_stream(p)<16)print_int(write_stream(p));
else if(write_stream(p)==16)print_char('*');

else print_char('-');
}

/*:1251*//*1394:*/
#line 26644 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_sa_num(pointer q)
{halfword n;
if(sa_index(q)<dimen_val_limit)n= sa_num(q);
else{n= hex_dig4(sa_index(q));q= link(q);n= n+16*sa_index(q);
q= link(q);n= n+256*(sa_index(q)+16*sa_index(link(q)));
}
print_int(n);
}

/*:1394*//*1790:*/
#line 33652 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_file_line(void)
{int level= in_open;
while(level> 0&&full_source_filename_stack[level]==NULL)level--;
if(level==0)print_nl("! ");
else
{print_nl("");print(full_source_filename_stack[level]);print_char(':');
if(level==in_open)print_int(line);
else print_int(line_stack[level]);
print(": ");
}
}

/*:1790*/
#line 464 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*67:*/
#line 1630 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_ignored_err(char*s)
{int old_selector_ignored_err= selector;
selector= log_only;
if(filelineerrorstylep)print_file_line();
else print_nl("");
print("ignored: ");print(s);
selector= old_selector_ignored_err;
}

static void print_err(char*s)
{if(interaction==error_stop_mode)wake_up_terminal;
if(filelineerrorstylep)print_file_line();
else print_nl("! ");
print(s);
}

/*:67*//*73:*/
#line 1723 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void normalize_selector(void);
static void get_token(void);
static void term_input(void);
static void show_context(void);
static void begin_file_reading(void);
static void open_log_file(void);
static void close_files_and_terminate(void);
static void clear_for_error_prompt(void);
static void give_err_help(void);
#ifdef DEBUG
static void debug_help(void);
#else
#line 1736 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
#define debug_help() do_nothing
#endif
#line 1738 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:73*//*76:*/
#line 1775 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void jump_out(void)
{close_files_and_terminate();exit(0);
}

/*:76*//*77:*/
#line 1782 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void error(void)
{
UTF8_code c;
int s1,s2,s3,s4;

if(history<error_message_issued)history= error_message_issued;
print_char('.');show_context();
if(interaction==error_stop_mode)
/*78:*/
#line 1801 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

loop{resume:if(interaction!=error_stop_mode)return;
clear_for_error_prompt();prompt_input("? ");

if(last==first)return;
c= buffer[first];
if(c>='a')c= c+'A'-'a';
/*79:*/
#line 1823 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(c){
case'0':case'1':case'2':case'3':
case'4':case'5':case'6':case'7':
case'8':case'9':if(deletions_allowed)
/*83:*/
#line 1899 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{s1= cur_tok;s2= cur_cmd;s3= cur_chr;s4= align_state;
align_state= 1000000;OK_to_interrupt= false;
if((last> first+1)&&(buffer[first+1]>='0')&&(buffer[first+1]<='9'))
c= c*10+buffer[first+1]-'0'*11;
else c= c-'0';
while(c> 0)
{get_token();
decr(c);
}
cur_tok= s1;cur_cmd= s2;cur_chr= s3;align_state= s4;OK_to_interrupt= true;
help2("I have just deleted some text, as you asked.",
"You can now delete more, or insert, or whatever.");
show_context();goto resume;
}

/*:83*/
#line 1828 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;

#ifdef DEBUG
case'D':{debug_help();goto resume;}
#endif
#line 1833 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 case'E':if(base_ptr> 0)if(input_stack[base_ptr].name_field>=256)
{print_nl("You want to edit file ");

slow_print(input_stack[base_ptr].name_field);
print(" at line ");print_int(line);
interaction= scroll_mode;jump_out();
}break;
case'H':/*84:*/
#line 1915 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(use_err_help)
{give_err_help();use_err_help= false;
}
else{if(help_ptr==0)
help2("Sorry, I don't know how to help in this situation.",
"Maybe you should try asking a human?");
do{decr(help_ptr);print(help_line[help_ptr]);print_ln();
}while(!(help_ptr==0));
}
help4("Sorry, I already gave what help I could...",
"Maybe you should try asking a human?",
"An error might have occurred before I noticed any problems.",
"``If all else fails, read the instructions.'");
goto resume;
}

/*:84*/
#line 1840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case'I':/*82:*/
#line 1883 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{begin_file_reading();

if(last> first+1)
{loc= first+1;buffer[first]= ' ';
}
else{prompt_input("insert>");loc= first;

}
first= last;
cur_input.limit_field= last-1;
return;
}

/*:82*/
#line 1841 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case'Q':case'R':case'S':/*81:*/
#line 1866 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{error_count= 0;interaction= batch_mode+c-'Q';
print("OK, entering ");
switch(c){
case'Q':{print_esc("batchmode");decr(selector);
}break;
case'R':print_esc("nonstopmode");break;
case'S':print_esc("scrollmode");
}
print("...");print_ln();update_terminal;return;
}

/*:81*/
#line 1842 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case'X':{interaction= scroll_mode;jump_out();
}break;
default:do_nothing;
}
/*80:*/
#line 1849 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print("Type <return> to proceed, S to scroll future error messages,");

print_nl("R to run without stopping, Q to run quietly,");
print_nl("I to insert something, ");
if(base_ptr> 0)if(input_stack[base_ptr].name_field>=256)
print("E to edit your file,");
if(deletions_allowed)
print_nl("1 or ... or 9 to ignore the next 1 to 9 tokens of input,");
print_nl("H for help, X to quit.");
}

/*:80*/
#line 1847 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:79*/
#line 1808 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:78*/
#line 1791 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
incr(error_count);
if(error_count==100)
{print_nl("(That makes 100 errors; please try again.)");

history= fatal_error_stop;jump_out();
}
/*85:*/
#line 1932 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(interaction> batch_mode)decr(selector);
if(use_err_help)
{print_ln();give_err_help();
}
else while(help_ptr> 0)
{decr(help_ptr);print_nl(help_line[help_ptr]);
}
print_ln();
if(interaction> batch_mode)incr(selector);
print_ln()

/*:85*/
#line 1798 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:77*//*88:*/
#line 1971 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void fatal_error(char*s)
{normalize_selector();
print_err("Emergency stop");help1(s);succumb;

}

/*:88*//*89:*/
#line 1980 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void overflow(char*s,int n)
{normalize_selector();
print_err("TeX capacity exceeded, sorry [");

print(s);print_char('=');print_int(n);print_char(']');
help2("If you really absolutely need more capacity,",
"you can ask a wizard to enlarge me.");
succumb;
}

/*:89*//*90:*/
#line 1999 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void confusion(char*s)

{normalize_selector();
if(history<error_message_issued)
{print_err("This can't happen (");print(s);print_char(')');

help1("I'm broken. Please show this to someone who can fix can fix");
}
else{print_err("I can't go on meeting you like this");

help2("One of your faux pas seems to have wounded me deeply...",
"in fact, I'm barely conscious. Please fix it and try again.");
}
succumb;
}

/*:90*/
#line 465 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:4*//*23:*/
#line 765 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static FILE*open_in(char*filename,kpse_file_format_type t,const char*rwb);
static bool a_open_in(alpha_file*f);
static bool b_open_in(byte_file*f,char*path);
static bool w_open_in(word_file*f);
static FILE*open_out(const char*file_name,const char*file_mode);
static bool a_open_out(alpha_file*f);
#ifdef INIT
static bool w_open_out(word_file*f);
#endif
#line 775 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:23*//*24:*/
#line 787 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void a_close(alpha_file*f)
{pascal_close((*f));
}

static void b_close(byte_file*f)
{pascal_close((*f));
}

static void w_close(word_file*f)
{pascal_close((*f));
}

/*:24*//*27:*/
#line 860 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static bool input_ln(alpha_file*f,bool bypass_eoln)

{int last_nonblank;
if(bypass_eoln)if(!eof((*f)))get((*f));

last= first;
if(eof((*f)))return false;
else{last_nonblank= first;
while(!eoln((*f)))
{if(last>=max_buf_stack)
{max_buf_stack= last+1;
if(max_buf_stack==buf_size)
/*31:*/
#line 946 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(format_ident==0)
{write_ln(term_out,"Buffer size exceeded!");exit(0);

}
else{cur_input.loc_field= first;cur_input.limit_field= last-1;
overflow("buffer size",buf_size);

}

/*:31*/
#line 872 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
buffer[last]= (*f).d;get((*f));incr(last);
if(buffer[last-1]!=' ')last_nonblank= last;
}
last= last_nonblank;return true;
}
}

/*:27*//*33:*/
#line 988 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static bool init_terminal(void)
{
t_open_in;
if(input_command_line())return true;
loop{wake_up_terminal;pascal_write(term_out,"**");update_terminal;

if(!input_ln(&term_in,true))
{write_ln(term_out);
pascal_write(term_out,"! End of file on the terminal... why?");

return false;
}
loc= first;
while((loc<last)&&(buffer[loc]==' '))incr(loc);
if(loc<last)
{return true;

}
write_ln(term_out,"Please type the name of your input file.");
}
}

/*:33*//*39:*/
#line 1093 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static str_number make_string(void)
{if(str_ptr==max_strings)
overflow("number of strings",max_strings-init_str_ptr);

incr(str_ptr);str_start[str_ptr]= pool_ptr;
return str_ptr-1;
}

/*:39*//*41:*/
#line 1112 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static bool str_eq_buf(str_number s,unsigned char*buf)

{
pool_pointer j;
j= str_start[s];
while(j<str_start[s+1])
{if(str_pool[j]!=*buf||*buf==0)
return false;
j++;buf++;
}
return true;
}

/*:41*//*42:*/
#line 1128 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static bool str_eq_str(str_number s,str_number t)

{
pool_pointer j,k;
bool result;
result= false;
if(length(s)!=length(t))goto not_found;
j= str_start[s];k= str_start[t];
while(j<str_start[s+1])
{if(str_pool[j]!=str_pool[k])goto not_found;
incr(j);incr(k);
}
result= true;
not_found:return result;
}
/*1453:*/
#line 27392 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void str_to_name(str_number s)
{int k;
UTF8_code c;
int j;
k= 0;for(j= str_start[s];j<=str_start[s+1]-1;j++){
c= str_pool[j];incr(k);
if(k<=file_name_size)name_of_file[k]= c;
}
name_length= k;
name_of_file[name_length+1]= 0;
}

/*:1453*/
#line 1143 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:42*//*43:*/
#line 1151 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool get_strings_started(void)
{
int k,l;
pool_ptr= 0;str_ptr= 0;str_start[0]= 0;
/*44:*/
#line 1164 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= 0;k<=255;k++)
{if((/*45:*/
#line 1204 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

(k<' ')||(k> '~')

/*:45*/
#line 1166 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
))
{append_char('^');append_char('^');
if(k<0100)append_char(k+0100)
else if(k<0200)append_char(k-0100)
else{app_lc_hex(k/16);app_lc_hex(k%16);
}
}
else append_utf8(k);
make_string();
}

/*:44*/
#line 1156 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*46:*/
#line 1211 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

make_string();

/*:46*/
#line 1157 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
return true;
}

/*:43*//*47:*/
#line 1219 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static int s_no(const char*str)
{
if(str[0]==0)return empty_string;
if(str[1]==0)return str[0];
str_room(strlen(str));
while(*str!=0)append_char(*str++);
return make_string();
}

/*:47*//*61:*/
#line 1521 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_two(int n)
{n= abs(n)%100;print_char('0'+(n/10));
print_char('0'+(n%10));
}

/*:61*//*62:*/
#line 1528 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_hex(int n)

{int k;
k= 0;print_char('"');
do{dig[k]= n%16;n= n/16;incr(k);
}while(!(n==0));
print_the_digs(k);
}

/*:62*//*64:*/
#line 1548 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_roman_int(int n)
{
pool_pointer j,k;
nonnegative_integer u,v;
const char mystery[]= "m2d5c2l5x2v5i";
j= 0;v= 1000;
loop{while(n>=v)
{print_char(mystery[j]);n= n-v;
}
if(n<=0)return;
k= j+2;u= v/(mystery[k-1]-'0');
if(mystery[k-1]=='2')
{k= k+2;u= u/(mystery[k-1]-'0');
}
if(n+u>=v)
{print_char(mystery[k]);n= n+u;
}
else{j= j+2;v= v/(mystery[j-1]-'0');
}
}
}

/*:64*//*65:*/
#line 1573 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_current_string(void)
{pool_pointer j;
j= str_start[str_ptr];
while(j<pool_ptr)
{print_char(str_pool[j]);incr(j);
}
}

/*:65*//*66:*/
#line 1591 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void term_input(void)
{int k;
update_terminal;
if(!input_ln(&term_in,true))fatal_error("End of file on the terminal!");

term_offset= 0;
decr(selector);
if(last!=first)for(k= first;k<=last-1;k++)printn(buffer[k]);
print_ln();incr(selector);
}

/*:66*//*86:*/
#line 1947 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void int_error(int n)
{print(" (");print_int(n);print_char(')');error();
}

/*:86*//*87:*/
#line 1955 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void normalize_selector(void)
{if(log_opened)selector= term_and_log;
else selector= term_only;
if(job_name==0)open_log_file();
if(interaction==batch_mode)decr(selector);
}

/*:87*//*93:*/
#line 2039 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void pause_for_instructions(void)
{if(OK_to_interrupt)
{interaction= error_stop_mode;
if((selector==log_only)||(selector==no_print))
incr(selector);
print_err("Interruption");

help3("You rang?",
"Try to insert an instruction for me (e.g., `I\\showlists'),",
"unless you just want to quit by typing `X'.");
deletions_allowed= false;error();deletions_allowed= true;
interrupt= 0;
}
}

/*:93*//*95:*/
#line 2078 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static int half(int x)
{if(odd(x))return(x+1)/2;
else return x/2;
}

/*:95*//*97:*/
#line 2099 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static scaled round_decimals(small_number k)

{int a;
a= 0;
while(k> 0)
{decr(k);a= (a+dig[k]*two)/10;
}
return(a+1)/2;
}

/*:97*//*98:*/
#line 2121 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_scaled(scaled s)

{scaled delta;
if(s<0)
{print_char('-');negate(s);
}
print_int(s/unity);
print_char('.');
s= 10*(s%unity)+5;delta= 10;
do{if(delta> unity)s= s+0100000-50000;
print_char('0'+(s/unity));s= 10*(s%unity);delta= delta*10;
}while(!(s<=delta));
}

/*:98*//*100:*/
#line 2171 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static scaled mult_and_add(int n,scaled x,scaled y,scaled max_answer)
{if(n<0)
{negate(x);negate(n);
}
if(n==0)return y;
else if(((x<=(max_answer-y)/n)&&(-x<=(max_answer+y)/n)))
return n*x+y;
else{arith_error= true;return 0;
}
}

/*:100*//*101:*/
#line 2184 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static scaled x_over_n(scaled x,int n)
{bool negative;
scaled x_over_n;
negative= false;
if(n==0)
{arith_error= true;x_over_n= 0;rem= x;
}
else{if(n<0)
{negate(x);negate(n);negative= true;
}
if(x>=0)
{x_over_n= x/n;rem= x%n;
}
else{x_over_n= -((-x)/n);rem= -((-x)%n);
}
}
if(negative)negate(rem);
return x_over_n;}

/*:101*//*102:*/
#line 2210 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static scaled xn_over_d(scaled x,int n,int d)
{bool positive;
nonnegative_integer t,u,v;
scaled xn_over_d;
if(x>=0)positive= true;
else{negate(x);positive= false;
}
t= (x%0100000)*n;
u= (x/0100000)*n+(t/0100000);
v= (u%d)*0100000+(t%0100000);
if(u/d>=0100000)arith_error= true;
else u= 0100000*(u/d)+(v/d);
if(positive)
{xn_over_d= u;rem= v%d;
}
else{xn_over_d= -u;rem= -(v%d);
}
return xn_over_d;}

/*:102*//*103:*/
#line 2249 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*1517:*/
#line 28033 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled m_log(scaled x)
{int y,z;
int k;
if(x<=0)/*1519:*/
#line 28060 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Logarithm of ");

print_scaled(x);print(" has been replaced by 0");
help2("Since I don't take logs of non-positive numbers,",
"I'm zeroing this one. Proceed, with fingers crossed.");
error();return 0;
}

/*:1519*/
#line 28037 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{y= 1302456956+4-100;
z= 27595+6553600;
while(x<mpfract_four)
{double(x);y= y-93032639;z= z-48782;
}

y= y+(z/unity);k= 2;
while(x> mpfract_four+4)
/*1518:*/
#line 28052 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{z= ((x-1)/two_to_the[k])+1;
while(x<mpfract_four+z)
{z= halfp(z+1);k= k+1;
}
y= y+spec_log[k];x= x-z;
}

/*:1518*/
#line 28047 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
return y/8;
}
}

/*:1517*//*1521:*/
#line 28105 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static mpfract make_mpfract(int p,int q)
{int f;
int n;
bool negative;
int be_careful;
if(p>=0)negative= false;
else{negate(p);negative= true;
}
if(q<=0)
{
#ifdef DEBUG
if(q==0)confusion("/");
#endif
#line 28119 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


negate(q);negative= !negative;
}
n= p/q;p= p%q;
if(n>=8)
{arith_error= true;
if(negative)return-el_gordo;else return el_gordo;
}
else{n= (n-1)*mpfract_one;
/*1522:*/
#line 28147 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

f= 1;
do{be_careful= p-q;p= be_careful+p;
if(p>=0)f= f+f+1;
else{double(f);p= p+q;
}
}while(!(f>=mpfract_one));
be_careful= p-q;
if(be_careful+p>=0)incr(f)

/*:1522*/
#line 28129 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(negative)return-(f+n);else return f+n;
}
}

/*:1521*//*1523:*/
#line 28162 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int take_mpfract(int q,mpfract f)
{int p;
bool negative;
int n;
int be_careful;
/*1524:*/
#line 28185 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(f>=0)negative= false;
else{negate(f);negative= true;
}
if(q<0)
{negate(q);negative= !negative;
}

/*:1524*/
#line 28168 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(f<mpfract_one)n= 0;
else{n= f/mpfract_one;f= f%mpfract_one;
if(q<=el_gordo/n)n= n*q;
else{arith_error= true;n= el_gordo;
}
}
f= f+mpfract_one;
/*1525:*/
#line 28198 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= mpfract_half;
if(q<mpfract_four)
do{if(odd(f))p= halfp(p+q);else p= halfp(p);
f= halfp(f);
}while(!(f==1));
else do{if(odd(f))p= p+halfp(q-p);else p= halfp(p);
f= halfp(f);
}while(!(f==1))

/*:1525*/
#line 28176 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
be_careful= n-el_gordo;
if(be_careful+p> 0)
{arith_error= true;n= el_gordo-p;
}
if(negative)return-(n+p);
else return n+p;
}

/*:1523*//*1536:*/
#line 28272 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_randoms(void)
{int k;
int x;
for(k= 0;k<=23;k++)
{x= randoms[k]-randoms[k+31];
if(x<0)x= x+mpfract_one;
randoms[k]= x;
}
for(k= 24;k<=54;k++)
{x= randoms[k]-randoms[k-24];
if(x<0)x= x+mpfract_one;
randoms[k]= x;
}
j_random= 54;
}

/*:1536*//*1537:*/
#line 28291 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void init_randoms(void)
{mpfract j,jj,k;
int i;
j= abs(random_seed);
while(j>=mpfract_one)j= halfp(j);
k= 1;
for(i= 0;i<=54;i++)
{jj= k;k= j-k;j= jj;
if(k<0)k= k+mpfract_one;
randoms[(i*21)%55]= j;
}
new_randoms();new_randoms();new_randoms();
}

/*:1537*//*1538:*/
#line 28313 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled unif_rand(scaled x)
{scaled y;
next_random;y= take_mpfract(abs(x),randoms[j_random]);
if(y==abs(x))return 0;
else if(x> 0)return y;
else return-y;
}

/*:1538*//*1543:*/
#line 28350 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int ab_vs_cd(int a,int b,int c,int d)
{
int q,r;
/*1544:*/
#line 28366 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(a<0)
{negate(a);negate(b);
}
if(c<0)
{negate(c);negate(d);
}
if(d<=0)
{if(b>=0)
if(((a==0)||(b==0))&&((c==0)||(d==0)))return_sign(0)
else return_sign(1);
if(d==0)
if(a==0)return_sign(0)else return_sign(-1);
q= a;a= c;c= q;q= -b;b= -d;d= q;
}
else if(b<=0)
{if(b<0)if(a> 0)return_sign(-1);
if(c==0)return_sign(0)else return_sign(-1);
}

/*:1544*/
#line 28354 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
loop{q= a/d;r= c/b;
if(q!=r)
if(q> r)return_sign(1)else return_sign(-1);
q= a%d;r= c%b;
if(r==0)
if(q==0)return_sign(0)else return_sign(1);
if(q==0)return_sign(-1);
a= b;b= q;c= d;d= r;
}
}

/*:1543*//*1545:*/
#line 28390 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled norm_rand(void)
{int x,u,l;

do{
do{next_random;
x= take_mpfract(112429,randoms[j_random]-mpfract_half);

next_random;u= randoms[j_random];
}while(!(abs(x)<u));
x= make_mpfract(x,u);
l= 139548960-m_log(u);
}while(!(ab_vs_cd(1024,l,x,x)>=0));
return x;
}

/*:1545*/
#line 2249 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static halfword badness(scaled t,scaled s)
{int r;

if(t==0)return 0;
else if(s<=0)return inf_bad;
else{if(t<=7230584)r= (t*297)/s;
else if(s>=1663497)r= t/(s/297);
else r= t;
if(r> 1290)return inf_bad;
else return(r*r*r+0400000)/01000000;
}
}

/*:103*//*109:*/
#line 2425 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
static void print_word(memory_word w)

{print_int(w.i);print_char(' ');
print_scaled(w.sc);print_char(' ');
print_scaled(round(unity*unfix(w.gr)));print_ln();

print_int(w.hh.lh);print_char('=');print_int(w.hh.b0);print_char(':');
print_int(w.hh.b1);print_char(';');print_int(w.hh.rh);print_char(' ');
print_int(w.qqqq.b0);print_char(':');print_int(w.qqqq.b1);print_char(':');
print_int(w.qqqq.b2);print_char(':');print_int(w.qqqq.b3);
}
#endif
#line 2439 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:109*//*114:*/
#line 2535 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*287:*/
#line 6518 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void show_token_list(int p,int q,int l)
{
int m,c;
UTF8_code match_chr;
UTF8_code n;
match_chr= '#';n= '0';tally= 0;
while((p!=null)&&(tally<l))
{if(p==q)/*315:*/
#line 7240 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
set_trick_count

/*:315*/
#line 6526 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*288:*/
#line 6535 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((p<hi_mem_min)||(p> mem_end))
{print_esc("CLOBBERED.");return;

}
if(info(p)>=cs_token_flag)print_cs(info(p)-cs_token_flag);
else{m= info(p)/cmd_factor;c= info(p)%cmd_factor;
if(info(p)<0)print_esc("BAD.");

else/*289:*/
#line 6551 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(m){
case left_brace:case right_brace:case math_shift:
case tab_mark:case sup_mark:case sub_mark:
case spacer:
case letter:case other_char:
if(c<0x80)printn(c);else print_utf8(c);break;
case mac_param:{printn(c);printn(c);
}break;
case out_param:{printn(match_chr);
if(c<=9)print_char(c+'0');
else{print_char('!');return;
}
}break;
case match:{match_chr= c;printn(c);incr(n);print_char(n);
if(n> '9')return;
}break;
case end_match:if(c==0)print("->");break;

default:print_esc("BAD.");

}

/*:289*/
#line 6544 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:288*/
#line 6527 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= link(p);
}
if(p!=null)print_esc("ETC.");


}

/*:287*/
#line 2535 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*301:*/
#line 6896 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void runaway(void)
{pointer p;
if(scanner_status> skipping)
{print_nl("Runaway ");

switch(scanner_status){
case defining:{print("definition");p= def_ref;
}break;
case matching:{print("argument");p= temp_head;
}break;
case aligning:{print("preamble");p= hold_head;
}break;
case absorbing:{print("text");p= def_ref;
}
}
print_char('?');print_ln();show_token_list(link(p),null,error_line-10);
}
}

/*:301*/
#line 2536 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:114*//*115:*/
#line 2547 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer get_avail(void)
{pointer p;
p= avail;
if(p!=null)avail= link(avail);
else if(mem_end<mem_max)
{incr(mem_end);p= mem_end;
}
else{decr(hi_mem_min);p= hi_mem_min;
if(hi_mem_min<=lo_mem_max)
{runaway();
overflow("main memory size",mem_max+1-mem_min);


}
}
link(p)= null;
#ifdef STAT
incr(dyn_used);
#endif
#line 2566 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

return p;
}

/*:115*//*118:*/
#line 2596 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void flush_list(pointer p)

{pointer q,r;
if(p!=null)
{r= p;
do{q= r;r= link(r);
#ifdef STAT
decr(dyn_used);
#endif
#line 2605 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
}while(!(r==null));
link(q)= avail;avail= p;
}
}

/*:118*//*120:*/
#line 2643 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer get_node(int s)
{
pointer p;
pointer q;
int r;
int t;
restart:p= rover;
do{/*122:*/
#line 2693 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= p+node_size(p);

while(is_empty(q))
{t= rlink(q);
if(q==rover)rover= t;
llink(t)= llink(q);rlink(llink(q))= t;
q= q+node_size(q);
}
r= q-s;
if(r> p+1)/*123:*/
#line 2708 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{node_size(p)= r-p;

rover= p;
goto found;
}

/*:123*/
#line 2703 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(r==p)if(rlink(p)!=p)
/*124:*/
#line 2717 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{rover= rlink(p);t= llink(p);
llink(rover)= t;rlink(t)= rover;
goto found;
}

/*:124*/
#line 2705 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
node_size(p)= q-p

/*:122*/
#line 2651 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;

p= rlink(p);
}while(!(p==rover));
if(s==010000000000)
{return max_halfword;
}
if(lo_mem_max+2<hi_mem_min)if(lo_mem_max+2<=mem_bot+max_halfword)
/*121:*/
#line 2678 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(hi_mem_min-lo_mem_max>=1998)t= lo_mem_max+1000;
else t= lo_mem_max+1+(hi_mem_min-lo_mem_max)/2;

p= llink(rover);q= lo_mem_max;rlink(p)= q;llink(rover)= q;
if(t> mem_bot+max_halfword)t= mem_bot+max_halfword;
rlink(q)= rover;llink(q)= p;link(q)= empty_flag;node_size(q)= t-lo_mem_max;
lo_mem_max= t;link(lo_mem_max)= null;info(lo_mem_max)= null;
rover= q;goto restart;
}

/*:121*/
#line 2659 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
overflow("main memory size",mem_max+1-mem_min);


found:link(r)= null;
#ifdef STAT
var_used= var_used+s;
#endif
#line 2667 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

return r;
}

/*:120*//*125:*/
#line 2728 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void free_node(pointer p,halfword s)

{pointer q;
node_size(p)= s;link(p)= empty_flag;
q= llink(rover);llink(p)= q;rlink(p)= rover;
llink(rover)= p;rlink(q)= p;
#ifdef STAT
var_used= var_used-s;
#endif
#line 2737 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:125*//*126:*/
#line 2745 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
static void sort_avail(void)

{pointer p,q,r;
pointer old_rover;
p= get_node(010000000000);
p= rlink(rover);rlink(rover)= max_halfword;old_rover= rover;
while(p!=old_rover)/*127:*/
#line 2767 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(p<rover)
{q= p;p= rlink(q);rlink(q)= rover;rover= q;
}
else{q= rover;
while(rlink(q)<p)q= rlink(q);
r= rlink(p);rlink(p)= rlink(q);rlink(q)= p;p= r;
}

/*:127*/
#line 2754 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= rover;
while(rlink(p)!=max_halfword)
{llink(rlink(p))= p;p= rlink(p);
}
rlink(p)= rover;llink(rover)= p;
}
#endif
#line 2762 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:126*//*131:*/
#line 2876 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_null_box(void)
{pointer p;
p= get_node(box_node_size);type(p)= hlist_node;
subtype(p)= min_quarterword;
width(p)= 0;depth(p)= 0;height(p)= 0;shift_amount(p)= 0;list_ptr(p)= null;
glue_sign(p)= normal;glue_order(p)= normal;set_glue_ratio_zero(glue_set(p));
return p;
}

/*:131*//*134:*/
#line 2906 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_rule(void)
{pointer p;
p= get_node(rule_node_size);type(p)= rule_node;
subtype(p)= 0;
width(p)= null_flag;depth(p)= null_flag;height(p)= null_flag;
return p;
}

/*:134*//*139:*/
#line 2975 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_ligature(quarterword f,quarterword c,pointer q)
{pointer p;
p= get_node(small_node_size);type(p)= ligature_node;
font(lig_char(p))= f;character(lig_char(p))= c;lig_ptr(p)= q;
subtype(p)= 0;return p;
}

static pointer new_lig_item(quarterword c)
{pointer p;
p= get_node(small_node_size);character(p)= c;lig_ptr(p)= null;
return p;
}

/*:139*//*140:*/
#line 3013 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_disc(void)
{pointer p;
p= get_node(small_node_size);type(p)= disc_node;
set_replace_count(p,0);pre_break(p)= null;post_break(p)= null;
return p;
}

/*:140*//*142:*/
#line 3047 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_math(scaled w,small_number s)
{pointer p;
p= get_node(small_node_size);type(p)= math_node;
subtype(p)= s;width(p)= w;return p;
}

/*:142*//*146:*/
#line 3129 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_spec(pointer p)
{pointer q;
q= get_node(glue_spec_size);
mem[q]= mem[p];glue_ref_count(q)= null;
width(q)= width(p);stretch(q)= stretch(p);shrink(q)= shrink(p);
return q;
}

/*:146*//*147:*/
#line 3142 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_param_glue(small_number n)
{pointer p;
pointer q;
p= get_node(small_node_size);type(p)= glue_node;subtype(p)= n+1;
leader_ptr(p)= null;
q= /*219:*/
#line 4636 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
glue_par(n)

/*:219*/
#line 3147 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
glue_ptr(p)= q;incr(glue_ref_count(q));
return p;
}

/*:147*//*148:*/
#line 3155 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_glue(pointer q)
{pointer p;
p= get_node(small_node_size);type(p)= glue_node;subtype(p)= normal;
leader_ptr(p)= null;glue_ptr(p)= q;incr(glue_ref_count(q));
return p;
}

/*:148*//*149:*/
#line 3169 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_skip_param(small_number n)
{pointer p;
temp_ptr= new_spec(/*219:*/
#line 4636 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
glue_par(n)

/*:219*/
#line 3171 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
);
p= new_glue(temp_ptr);glue_ref_count(temp_ptr)= null;subtype(p)= n+1;
return p;
}

/*:149*//*151:*/
#line 3193 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_kern(scaled w)
{pointer p;
p= get_node(small_node_size);type(p)= kern_node;
subtype(p)= normal;
width(p)= w;
return p;
}

/*:151*//*153:*/
#line 3216 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_penalty(int m)
{pointer p;
p= get_node(small_node_size);type(p)= penalty_node;
subtype(p)= 0;
penalty(p)= m;return p;
}

/*:153*//*162:*/
#line 3367 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
static void check_mem(bool print_locs)
{
int p,q;
bool clobbered;
for(p= mem_min;p<=lo_mem_max;p++)is_free[p]= false;

for(p= hi_mem_min;p<=mem_end;p++)is_free[p]= false;
/*163:*/
#line 3387 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= avail;q= null;clobbered= false;
while(p!=null)
{if((p> mem_end)||(p<hi_mem_min))clobbered= true;
else if(is_free[p])clobbered= true;
if(clobbered)
{print_nl("AVAIL list clobbered at ");

print_int(q);goto done1;
}
is_free[p]= true;q= p;p= link(q);
}
done1:

/*:163*/
#line 3376 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*164:*/
#line 3401 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= rover;q= null;clobbered= false;
do{if((p>=lo_mem_max)||(p<mem_min))clobbered= true;
else if((rlink(p)>=lo_mem_max)||(rlink(p)<mem_min))clobbered= true;
else if(!(is_empty(p))||(node_size(p)<2)||
(p+node_size(p)> lo_mem_max)||(llink(rlink(p))!=p))clobbered= true;
if(clobbered)
{print_nl("Double-AVAIL list clobbered at ");
print_int(q);goto done2;
}
for(q= p;q<=p+node_size(p)-1;q++)
{if(is_free[q])
{print_nl("Doubly free location at ");

print_int(q);goto done2;
}
is_free[q]= true;
}
q= p;p= rlink(p);
}while(!(p==rover));
done2:

/*:164*/
#line 3377 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*165:*/
#line 3423 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= mem_min;
while(p<=lo_mem_max)
{if(is_empty(p))
{print_nl("Bad flag at ");print_int(p);

}
while((p<=lo_mem_max)&&!is_free[p])incr(p);
while((p<=lo_mem_max)&&is_free[p])incr(p);
}

/*:165*/
#line 3378 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(print_locs)/*166:*/
#line 3434 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_nl("New busy locs:");
for(p= mem_min;p<=lo_mem_max;p++)
if(!is_free[p]&&((p> was_lo_max)||was_free[p]))
{print_char(' ');print_int(p);
}
for(p= hi_mem_min;p<=mem_end;p++)
if(!is_free[p]&&
((p<was_hi_min)||(p> was_mem_end)||was_free[p]))
{print_char(' ');print_int(p);
}
}

/*:166*/
#line 3379 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
for(p= mem_min;p<=lo_mem_max;p++)was_free[p]= is_free[p];
for(p= hi_mem_min;p<=mem_end;p++)was_free[p]= is_free[p];

was_mem_end= mem_end;was_lo_max= lo_mem_max;was_hi_min= hi_mem_min;
}
#endif
#line 3386 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:162*//*167:*/
#line 3456 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
static void search_mem(pointer p)
{int q;
for(q= mem_min;q<=lo_mem_max;q++)
{if(link(q)==p)
{print_nl("LINK(");print_int(q);print_char(')');
}
if(info(q)==p)
{print_nl("INFO(");print_int(q);print_char(')');
}
}
for(q= hi_mem_min;q<=mem_end;q++)
{if(link(q)==p)
{print_nl("LINK(");print_int(q);print_char(')');
}
if(info(q)==p)
{print_nl("INFO(");print_int(q);print_char(')');
}
}
/*250:*/
#line 5578 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(q= active_base;q<=box_base+255;q++)
{if(equiv(q)==p)
{print_nl("EQUIV(");print_int(q);print_char(')');
}
}

/*:250*/
#line 3476 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*280:*/
#line 6363 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(save_ptr> 0)for(q= 0;q<=save_ptr-1;q++)
{if(equiv_field(save_stack[q])==p)
{print_nl("SAVE(");print_int(q);print_char(')');
}
}

/*:280*/
#line 3477 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*865:*/
#line 17636 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(q= 0;q<=hyph_size;q++)
{if(hyph_list[q]==p)
{print_nl("HYPH(");print_int(q);print_char(')');
}
}

/*:865*/
#line 3478 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
#endif
#line 3481 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:167*//*169:*/
#line 3506 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void short_display(int p)
{int n;
while(p> mem_min)
{if(is_char_node(p))
{if(p<=mem_end)
{if(font(p)!=font_in_short_display)
{if((font(p)<font_base)||(font(p)> font_max))
print_char('*');

else/*262:*/
#line 5940 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

printn_esc(font_id_text(font(p)))

/*:262*/
#line 3515 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
print_char(' ');font_in_short_display= font(p);
}
if(character(p)<0x80)
print_ASCII(character(p));
else
print_utf8(character(p));
}
}
else/*170:*/
#line 3529 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(type(p)){
case hlist_node:case vlist_node:case ins_node:
case whatsit_node:case mark_node:case adjust_node:
case unset_node:case unset_set_node:case unset_pack_node:print("[]");break;
case rule_node:print_char('|');break;
case glue_node:if(glue_ptr(p)!=zero_glue)print_char(' ');break;
case math_node:print_char('$');break;
case ligature_node:short_display(lig_ptr(p));break;
case disc_node:{short_display(pre_break(p));
short_display(post_break(p));
n= replace_count(p);
while(n> 0)
{if(link(p)!=null)p= link(p);
decr(n);
}
}break;
default:do_nothing;
}

/*:170*/
#line 3524 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= link(p);
}
}

/*:169*//*171:*/
#line 3553 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_font_and_char(int p)
{if(p> mem_end)print_esc("CLOBBERED.");
else{if((font(p)<font_base)||(font(p)> font_max))print_char('*');

else/*262:*/
#line 5940 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

printn_esc(font_id_text(font(p)))

/*:262*/
#line 3557 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
print_char(' ');print_ASCII(qo(character(p)));
}
}

static void print_mark(int p)
{print_char('{');
if((p<hi_mem_min)||(p> mem_end))print_esc("CLOBBERED.");
else show_token_list(link(p),null,max_print_line-10);
print_char('}');
}

static void print_rule_dimen(scaled d)
{if(is_running(d))print_char('*');else print_scaled(d);

}

/*:171*//*172:*/
#line 3577 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_glue(scaled d,int order,char*s)

{print_scaled(d);
if((order<normal)||(order> filll))print("foul");
else if(order> normal)
{print("fil");
while(order> fil)
{print_char('l');decr(order);
}
}
else if(s!=0)print(s);
}

/*:172*//*173:*/
#line 3592 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_spec(int p,char*s)

{if((p<mem_min)||(p>=lo_mem_max))print_char('*');

else{print_scaled(width(p));
if(s!=0)print(s);
if(stretch(p)!=0)
{print(" plus ");print_glue(stretch(p),stretch_order(p),s);
}
if(shrink(p)!=0)
{print(" minus ");print_glue(shrink(p),shrink_order(p),s);
}
}
}

/*:173*//*174:*/
#line 3610 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*622:*/
#line 12860 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_fam_and_char(pointer p)
{print_esc("fam");print_int(fam(p));print_char(' ');
print_ASCII(qo(character(p)));
}

static void print_delimiter(pointer p)
{int a;
a= small_fam(p)*256+qo(small_char(p));
a= a*0x1000+large_fam(p)*256+qo(large_char(p));
if(a<0)print_int(a);
else print_hex(a);
}

/*:622*//*623:*/
#line 12881 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void show_info(void);
static void print_subsidiary_data(pointer p,UTF8_code c)

{if(cur_length>=depth_threshold)
{if(math_type(p)!=empty)print(" []");
}
else{append_char(c);
temp_ptr= p;
switch(math_type(p)){
case math_char:{print_ln();print_current_string();print_fam_and_char(p);
}break;
case sub_box:show_info();break;
case sub_mlist:if(info(p)==null)
{print_ln();print_current_string();print("{}");
}
else show_info();break;
default:do_nothing;
}
flush_char;
}
}

/*:623*//*625:*/
#line 12918 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_style(int c)
{switch(c/2){
case 0:print_esc("displaystyle");break;
case 1:print_esc("textstyle");break;
case 2:print_esc("scriptstyle");break;
case 3:print_esc("scriptscriptstyle");break;
default:print("Unknown style!");
}
}

/*:625*/
#line 3610 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*220:*/
#line 4642 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_skip_param(int n)
{switch(n){
case line_skip_code:print_esc("lineskip");break;
case baseline_skip_code:print_esc("baselineskip");break;
case par_skip_code:print_esc("parskip");break;
case above_display_skip_code:print_esc("abovedisplayskip");break;
case below_display_skip_code:print_esc("belowdisplayskip");break;
case above_display_short_skip_code:print_esc("abovedisplayshortskip");break;
case below_display_short_skip_code:print_esc("belowdisplayshortskip");break;
case left_skip_code:print_esc("leftskip");break;
case right_skip_code:print_esc("rightskip");break;
case top_skip_code:print_esc("topskip");break;
case split_top_skip_code:print_esc("splittopskip");break;
case tab_skip_code:print_esc("tabskip");break;
case space_skip_code:print_esc("spaceskip");break;
case xspace_skip_code:print_esc("xspaceskip");break;
case par_fill_skip_code:print_esc("parfillskip");break;
case thin_mu_skip_code:print_esc("thinmuskip");break;
case med_mu_skip_code:print_esc("medmuskip");break;
case thick_mu_skip_code:print_esc("thickmuskip");break;
default:print("[unknown glue parameter!]");
}
}

/*:220*/
#line 3611 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_xdimen(pointer p)
{if(p==null){print_scaled(0);return;}
print_scaled(xdimen_width(p));
if(xdimen_hfactor(p)!=0)
{print_char('+');print_scaled(xdimen_hfactor(p));print("*hsize");}
if(xdimen_vfactor(p)!=0)
{print_char('+');print_scaled(xdimen_vfactor(p));print("*vsize");}
}

/*:174*//*177:*/
#line 3656 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void show_node_list(int p)
{
int n;
double g;
if(cur_length> depth_threshold)
{if(p> null)print(" []");

return;
}
n= 0;
while(p> mem_min)
{print_ln();print_current_string();
if(p> mem_end)
{print("Bad link, display aborted.");return;

}
incr(n);if(n> breadth_max)
{print("etc.");return;

}
/*178:*/
#line 3682 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(is_char_node(p))print_font_and_char(p);
else switch(type(p)){
case hlist_node:case vlist_node:case unset_node:case unset_set_node:case unset_pack_node:/*179:*/
#line 3701 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(type(p)==hlist_node)print_esc("h");
else if(type(p)==vlist_node)print_esc("v");
else print_esc("unset");
print("box(");print_scaled(height(p));print_char('+');
print_scaled(depth(p));print(")x");print_scaled(width(p));
if(type(p)==unset_set_node)print(" set");
else if(type(p)==unset_pack_node)print(" pack");
else if(type(p)==unset_node)
/*180:*/
#line 3719 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(span_count(p)!=min_quarterword)
{print(" (");print_int(qo(span_count(p))+1);
print(" columns)");
}
if(glue_stretch(p)!=0)
{print(", stretch ");print_glue(glue_stretch(p),glue_order(p),0);
}
if(glue_shrink(p)!=0)
{print(", shrink ");print_glue(glue_shrink(p),glue_sign(p),0);
}
}

/*:180*/
#line 3710 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{/*181:*/
#line 3742 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

g= unfix(glue_set(p));
if((g!=float_constant(0))&&(glue_sign(p)!=normal))
{print(", glue set ");
if(glue_sign(p)==shrinking)print("- ");
if(abs(mem[p+glue_offset].i)<04000000)print("?.?");
else if(abs(g)> float_constant(20000))
{if(g> float_constant(0))print_char('>');
else print("< -");
print_glue(20000*unity,glue_order(p),0);
}
else print_glue(round(unity*g),glue_order(p),0);

}

/*:181*/
#line 3711 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(shift_amount(p)!=0)
{print(", shifted ");print_scaled(shift_amount(p));
}
}
node_list_display(list_ptr(p));
}

/*:179*/
#line 3685 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case rule_node:/*182:*/
#line 3757 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("rule(");print_rule_dimen(height(p));print_char('+');
print_rule_dimen(depth(p));print(")x");print_rule_dimen(width(p));
}

/*:182*/
#line 3686 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case ins_node:/*183:*/
#line 3762 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("insert");print_int(qo(subtype(p)));
print("; split(");print_spec(split_top_ptr(p),0);
print_char(',');print_scaled(depth(p));
print("); float cost ");print_int(float_cost(p));
node_list_display(ins_ptr(p));
}

/*:183*/
#line 3687 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case whatsit_node:/*1252:*/
#line 24318 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(subtype(p)){
case open_node:{print_write_whatsit("openout",p);
print_char('=');print_file_name(open_name(p),open_area(p),open_ext(p));
}break;
case write_node:{print_write_whatsit("write",p);
print_mark(write_tokens(p));
}break;
case close_node:print_write_whatsit("closeout",p);break;
case latespecial_node:{print_esc("special");print(" shipout");
print_mark(write_tokens(p));
}break;
case special_node:{print_esc("special");
print_mark(write_tokens(p));
}break;
case language_node:{print_esc("setlanguage");
print_int(what_lang(p));print(" (hyphenmin ");
print_int(what_lhm(p));print_char(',');
print_int(what_rhm(p));print_char(')');
}break;
/*1563:*/
#line 28506 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case save_pos_code:print_esc("savepos");break;

/*:1563*/
#line 24338 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case param_node:print_esc("parameter ");
print_int(param_type(p));print_char(',');print_int(param_no(p));
print_char(':');print_int(param_value(p).i);
break;
case par_node:print_esc("paragraph(");
print_xdimen(par_extent(p));
print(", ");
print_int(par_penalty(p));
print_char(')');
node_list_display(par_params(p));
node_list_display(par_list(p));
break;
case disp_node:print_esc("display ");
node_list_display(display_eqno(p));
if(display_left(p))print("left ");else print("right ");
node_list_display(display_formula(p));
node_list_display(display_params(p));
break;
case baseline_node:print_esc("baselineskip ");
print_baseline_skip(baseline_node_no(p));
break;
case hset_node:case vset_node:
print_char('\\');
print_char(subtype(p)==hset_node?'h':'v');
print("set(");
print_scaled(height(p));print_char('+');
print_scaled(depth(p));print(")x");print_scaled(width(p));
if(shift_amount(p)!=0)
{print(", shifted ");print_scaled(shift_amount(p));
}
if(set_stretch(p)!=0)
{print(", stretch ");print_glue(set_stretch(p),set_stretch_order(p),"pt");
}
if(set_shrink(p)!=0)
{print(", shrink ");print_glue(set_shrink(p),set_shrink_order(p),"pt");
}
print(", extent ");print_xdimen(set_extent(p));
node_list_display(list_ptr(p));
break;
case hpack_node:case vpack_node:
print_char('\\');
print_char(subtype(p)==hpack_node?'h':'v');
print("pack(");
print(pack_m(p)==exactly?"exactly ":"additional ");
print_xdimen(pack_extent(p));
if(subtype(p)==vpack_node&&pack_limit(p)!=max_dimen){print(", limit ");print_scaled(pack_limit(p));}
print_char(')');
node_list_display(list_ptr(p));
break;
case image_node:
print_esc("HINTimage(");
print("width ");print_xdimen(image_xheight(p));
print(" height ");print_xdimen(image_xwidth(p));
print(" aspect ");print_scaled(image_aspect(p));
print("), section ");print_int(image_no(p));
if(image_name(p)!=0){print(", ");printn(image_name(p));}
break;
case color_node:
print_esc("HINTcolor ");print_int(color_ref(p));
break;
case no_color_node:
print_esc("HINTendcolor ignored");
break;
case end_color_node:
print_esc("HINTendcolor ");
break;
case align_node:
print_esc("align(");
print(align_m(p)==exactly?"exactly ":"additional ");
print_xdimen(align_extent(p));print_char(')');
node_list_display(align_preamble(p));
print_char(':');
node_list_display(align_list(p));
break;
case setpage_node:
print_esc("HINTsetpage");print_int(setpage_number(p));print_char(' ');printn(setpage_name(p));
print(" priority ");print_int(setpage_priority(p));
print(" width ");print_xdimen(setpage_width(p));
print(" height ");print_xdimen(setpage_height(p));
print_ln();print_current_string();print(".\\topskip=");print_spec(setpage_topskip(p),0);
print_ln();print_current_string();print(".\\maxdepth=");print_scaled(setpage_depth(p));
node_list_display(setpage_list(p));
node_list_display(setpage_streams(p));
break;
case setstream_node:
print_esc("HINTsetstream");print_int(setstream_insertion(p));
print_char('(');print_int(setstream_number(p));print_char(')');
if(setstream_preferred(p)!=255){print(" preferred ");print_int(setstream_preferred(p));}
if(setstream_ratio(p)> 0){print(" ratio ");print_int(setstream_ratio(p));}
if(setstream_next(p)!=255){print(" next ");print_int(setstream_next(p));}
append_char('.');
print_ln();print_current_string();print_esc("count");print_int(setstream_insertion(p));print_char('=');
print_int(setstream_mag(p));
print_ln();print_current_string();print_esc("dimen");print_int(setstream_insertion(p));print_char('=');
print_xdimen(setstream_max(p));
print_ln();print_current_string();print_esc("skip");print_int(setstream_insertion(p));print_char('=');
print_spec(setstream_height(p),0);
print_ln();print_current_string();print_esc("hsize=");print_xdimen(setstream_width(p));
print_ln();print_current_string();print_esc("topskip=");print_spec(setstream_topskip(p),0);
if(setstream_before(p)!=null){print_ln();print_current_string();print_esc("HINTbefore");node_list_display(setstream_before(p));}
if(setstream_after(p)!=null){print_ln();print_current_string();print_esc("HINTafter");node_list_display(setstream_after(p));}
flush_char;
break;
case ignore_node:
print_esc("ignore ");print_int(ignore_info(p));print_char(':');
node_list_display(ignore_list(p));
break;
case start_link_node:
print_esc("HINTstartlink ");
print_label(as_label(p));
if(color_ref(p)!=1){print("color ");print_int(color_ref(p));}
break;
case end_link_node:
print_esc("HINTendlink ");
if(color_ref(p)!=0xFF){print("color ");print_int(color_ref(p));}
break;
case label_node:
print_esc("HINTdest ");
print_label(p);
if(label_where(p)==1)print("top");
else if(label_where(p)==2)print("bot");
else if(label_where(p)==3)print("mid");
else print("undefined");
break;
case outline_node:
print_esc("HINToutline");
print_label(p);
print(" depth ");print_int(outline_depth(p));
if(outline_ptr(p)==null)print("{}");else
{print_ln();print_current_string();node_list_display(outline_ptr(p));}
break;
case stream_node:
print_esc("HINTstream");print_int(stream_insertion(p));
print_char('(');print_int(stream_number(p));print_char(')');
break;
case xdimen_node:
print_esc("xdimen ");print_xdimen(p);
break;
default:print("whatsit?");
}

/*:1252*/
#line 3688 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case glue_node:/*184:*/
#line 3770 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(subtype(p)>=a_leaders)/*185:*/
#line 3788 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("");
if(subtype(p)==c_leaders)print_char('c');
else if(subtype(p)==x_leaders)print_char('x');
print("leaders ");print_spec(glue_ptr(p),0);
node_list_display(leader_ptr(p));
}

/*:185*/
#line 3771 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{print_esc("glue");
if(subtype(p)!=normal)
{print_char('(');
if(subtype(p)<cond_math_glue)
print_skip_param(subtype(p)-1);
else if(subtype(p)==cond_math_glue)print_esc("nonscript");
else print_esc("mskip");
print_char(')');
}
if(subtype(p)!=cond_math_glue)
{print_char(' ');
if(subtype(p)<cond_math_glue)print_spec(glue_ptr(p),0);
else print_spec(glue_ptr(p),"mu");
}
}

/*:184*/
#line 3689 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case kern_node:/*186:*/
#line 3798 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(subtype(p)!=mu_glue)
{print_esc("kern");
if(subtype(p)!=normal)print_char(' ');
print_scaled(width(p));
if(subtype(p)==acc_kern)print(" (for accent)");

}
else{print_esc("mkern");print_scaled(width(p));print("mu");
}

/*:186*/
#line 3690 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case math_node:/*187:*/
#line 3809 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("math");
if(subtype(p)==before)print("on");
else print("off");
if(width(p)!=0)
{print(", surrounded ");print_scaled(width(p));
}
}

/*:187*/
#line 3691 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case ligature_node:/*188:*/
#line 3818 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_font_and_char(lig_char(p));print(" (ligature ");
if(subtype(p)> 1)print_char('|');
font_in_short_display= font(lig_char(p));short_display(lig_ptr(p));
if(odd(subtype(p)))print_char('|');
print_char(')');
}

/*:188*/
#line 3692 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case penalty_node:/*189:*/
#line 3826 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("penalty ");print_int(penalty(p));
}

/*:189*/
#line 3693 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case disc_node:/*190:*/
#line 3833 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("discretionary");
if(replace_count(p)> 0)
{print(" replacing ");print_int(replace_count(p));
}
node_list_display(pre_break(p));
append_char('|');show_node_list(post_break(p));flush_char;
}

/*:190*/
#line 3694 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case mark_node:/*191:*/
#line 3842 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("mark");
if(mark_class(p)!=0)
{print_char('s');print_int(mark_class(p));
}
print_mark(mark_ptr(p));
}

/*:191*/
#line 3695 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case adjust_node:/*192:*/
#line 3850 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("vadjust");node_list_display(adjust_ptr(p));
}

/*:192*/
#line 3696 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
/*621:*/
#line 12847 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case style_node:print_style(subtype(p));break;
case choice_node:/*626:*/
#line 12929 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("mathchoice");
append_char('D');show_node_list(display_mlist(p));flush_char;
append_char('T');show_node_list(text_mlist(p));flush_char;
append_char('S');show_node_list(script_mlist(p));flush_char;
append_char('s');show_node_list(script_script_mlist(p));flush_char;
}

/*:626*/
#line 12849 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case ord_noad:case op_noad:case bin_noad:
case rel_noad:case open_noad:case close_noad:
case punct_noad:case inner_noad:
case radical_noad:case over_noad:case under_noad:
case vcenter_noad:case accent_noad:
case left_noad:case right_noad:/*627:*/
#line 12937 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{switch(type(p)){
case ord_noad:print_esc("mathord");break;
case op_noad:print_esc("mathop");break;
case bin_noad:print_esc("mathbin");break;
case rel_noad:print_esc("mathrel");break;
case open_noad:print_esc("mathopen");break;
case close_noad:print_esc("mathclose");break;
case punct_noad:print_esc("mathpunct");break;
case inner_noad:print_esc("mathinner");break;
case over_noad:print_esc("overline");break;
case under_noad:print_esc("underline");break;
case vcenter_noad:print_esc("vcenter");break;
case radical_noad:{print_esc("radical");print_delimiter(left_delimiter(p));
}break;
case accent_noad:{print_esc("accent");print_fam_and_char(accent_chr(p));
}break;
case left_noad:{print_esc("left");print_delimiter(delimiter(p));
}break;
case right_noad:{if(subtype(p)==normal)print_esc("right");
else print_esc("middle");
print_delimiter(delimiter(p));
}
}
if(type(p)<left_noad)
{if(subtype(p)!=normal)
if(subtype(p)==limits)print_esc("limits");
else print_esc("nolimits");
print_subsidiary_data(nucleus(p),'.');
}
print_subsidiary_data(supscr(p),'^');
print_subsidiary_data(subscr(p),'_');
}

/*:627*/
#line 12855 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case fraction_noad:/*628:*/
#line 12971 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("fraction, thickness ");
if(thickness(p)==default_code)print("= default");
else print_scaled(thickness(p));
if((small_fam(left_delimiter(p))!=0)||
(small_char(left_delimiter(p))!=min_quarterword)||
(large_fam(left_delimiter(p))!=0)||
(large_char(left_delimiter(p))!=min_quarterword))
{print(", left-delimiter ");print_delimiter(left_delimiter(p));
}
if((small_fam(right_delimiter(p))!=0)||
(small_char(right_delimiter(p))!=min_quarterword)||
(large_fam(right_delimiter(p))!=0)||
(large_char(right_delimiter(p))!=min_quarterword))
{print(", right-delimiter ");print_delimiter(right_delimiter(p));
}
print_subsidiary_data(numerator(p),'\\');
print_subsidiary_data(denominator(p),'/');
}

/*:628*/
#line 12856 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;

/*:621*/
#line 3697 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print("Unknown node type!");
}

/*:178*/
#line 3676 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= link(p);
}

}

/*:177*//*193:*/
#line 3857 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void show_box(pointer p)
{/*231:*/
#line 5117 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

depth_threshold= show_box_depth;
breadth_max= show_box_breadth

/*:231*/
#line 3858 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(breadth_max<=0)breadth_max= 5;
if(pool_ptr+depth_threshold>=pool_size)
depth_threshold= pool_size-pool_ptr-1;

show_node_list(p);
print_ln();
}

/*:193*//*195:*/
#line 3881 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void delete_token_ref(pointer p)

{if(token_ref_count(p)==null)flush_list(p);
else decr(token_ref_count(p));
}

/*:195*//*196:*/
#line 3895 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void delete_glue_ref(pointer p)
fast_delete_glue_ref(p)
static void delete_xdimen_ref(pointer p)
{if(p==null)return;
if(xdimen_ref_count(p)==null)free_node(p,xdimen_node_size);
else decr(xdimen_ref_count(p));
}

/*:196*//*197:*/
#line 3908 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void flush_node_list(pointer p)
{
pointer q;
while(p!=null)

{q= link(p);
if(is_char_node(p))free_avail(p)
else{switch(type(p)){
case hlist_node:case vlist_node:case unset_node:
case unset_set_node:case unset_pack_node:{flush_node_list(list_ptr(p));
free_node(p,box_node_size);goto done;
}
case rule_node:{free_node(p,rule_node_size);goto done;
}
case ins_node:{flush_node_list(ins_ptr(p));
delete_glue_ref(split_top_ptr(p));
free_node(p,ins_node_size);goto done;
}
case whatsit_node:/*1254:*/
#line 24607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{switch(subtype(p)){
case open_node:free_node(p,open_node_size);break;
case write_node:case special_node:case latespecial_node:{delete_token_ref(write_tokens(p));
free_node(p,write_node_size);goto done;
}
case close_node:case language_node:free_node(p,small_node_size);break;
case param_node:
if(param_type(p)==glue_type)fast_delete_glue_ref(param_value(p).i);
free_node(p,param_node_size);break;
case par_node:
delete_xdimen_ref(par_extent(p));
flush_node_list(par_params(p));
flush_node_list(par_list(p));
free_node(p,par_node_size);break;
case disp_node:
flush_node_list(display_eqno(p));
flush_node_list(display_formula(p));
flush_node_list(display_params(p));
free_node(p,disp_node_size);break;
case baseline_node:
free_node(p,baseline_node_size);break;
case hpack_node:case vpack_node:
delete_xdimen_ref(pack_extent(p));
flush_node_list(list_ptr(p));
free_node(p,pack_node_size);break;
case hset_node:case vset_node:
delete_xdimen_ref(set_extent(p));
flush_node_list(list_ptr(p));
free_node(p,set_node_size);break;
case image_node:
delete_xdimen_ref(image_xwidth(p));delete_xdimen_ref(image_xheight(p));
flush_node_list(image_alt(p));
free_node(p,image_node_size);break;
case color_node:
case no_color_node:
case end_color_node:
free_node(p,color_node_size);break;
case align_node:
delete_xdimen_ref(align_extent(p));
flush_node_list(align_preamble(p));
flush_node_list(align_list(p));
free_node(p,align_node_size);break;
case setpage_node:
delete_glue_ref(setpage_topskip(p));
delete_xdimen_ref(setpage_height(p));
delete_xdimen_ref(setpage_width(p));
flush_node_list(setpage_list(p));
flush_node_list(setpage_streams(p));
free_node(p,setpage_node_size);break;
case setstream_node:
delete_xdimen_ref(setstream_max(p));
delete_xdimen_ref(setstream_width(p));
delete_glue_ref(setstream_topskip(p));
delete_glue_ref(setstream_height(p));
flush_node_list(setstream_before(p));
flush_node_list(setstream_after(p));
free_node(p,setstream_node_size);break;
case ignore_node:
flush_node_list(ignore_list(p));
free_node(p,ignore_node_size);break;
case start_link_node:
if(label_has_name(as_label(p)))delete_token_ref(label_ptr(as_label(p)));
free_node(p,link_node_size);break;
case end_link_node:
free_node(p,link_node_size);break;
case label_node:
if(label_has_name(p))delete_token_ref(label_ptr(p));
free_node(p,label_node_size);break;
case outline_node:
if(label_has_name(p))delete_token_ref(label_ptr(p));
flush_node_list(outline_ptr(p));
free_node(p,outline_node_size);break;
case stream_node:
free_node(p,stream_node_size);break;
case xdimen_node:
free_node(p,xdimen_node_size);
/*1565:*/
#line 28514 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case save_pos_code:free_node(p,small_node_size);break;

/*:1565*/
#line 24684 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:confusion("ext3");

}
goto done;
}

/*:1254*/
#line 3926 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case glue_node:{fast_delete_glue_ref(glue_ptr(p));
if(leader_ptr(p)!=null)flush_node_list(leader_ptr(p));
}break;
case kern_node:case math_node:case penalty_node:do_nothing;break;
case ligature_node:flush_node_list(lig_ptr(p));break;
case mark_node:delete_token_ref(mark_ptr(p));break;
case disc_node:{flush_node_list(pre_break(p));
flush_node_list(post_break(p));
}break;
case adjust_node:flush_node_list(adjust_ptr(p));break;
/*629:*/
#line 12993 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case style_node:{free_node(p,style_node_size);goto done;
}
case choice_node:{flush_node_list(display_mlist(p));
flush_node_list(text_mlist(p));
flush_node_list(script_mlist(p));
flush_node_list(script_script_mlist(p));
free_node(p,style_node_size);goto done;
}
case ord_noad:case op_noad:case bin_noad:
case rel_noad:case open_noad:case close_noad:
case punct_noad:case inner_noad:
case radical_noad:case over_noad:case under_noad:
case vcenter_noad:case accent_noad:
{if(math_type(nucleus(p))>=sub_box)
flush_node_list(info(nucleus(p)));
if(math_type(supscr(p))>=sub_box)
flush_node_list(info(supscr(p)));
if(math_type(subscr(p))>=sub_box)
flush_node_list(info(subscr(p)));
if(type(p)==radical_noad)free_node(p,radical_noad_size);
else if(type(p)==accent_noad)free_node(p,accent_noad_size);
else free_node(p,noad_size);
goto done;
}
case left_noad:case right_noad:{free_node(p,noad_size);goto done;
}
case fraction_noad:{flush_node_list(info(numerator(p)));
flush_node_list(info(denominator(p)));
free_node(p,fraction_noad_size);goto done;
}

/*:629*/
#line 3937 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:confusion("flushing");

}
free_node(p,small_node_size);
done:;}
p= q;
}
}

/*:197*//*199:*/
#line 3972 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer copy_node_list(pointer p)

{pointer h;
pointer q;
pointer r;
int words;
h= get_avail();q= h;
while(p!=null)
{/*200:*/
#line 3987 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

words= 1;
if(is_char_node(p))r= get_avail();
else/*201:*/
#line 3996 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(type(p)){
case hlist_node:case vlist_node:case unset_node:
case unset_set_node:case unset_pack_node:{r= get_node(box_node_size);
mem[r+6]= mem[p+6];mem[r+5]= mem[p+5];
list_ptr(r)= copy_node_list(list_ptr(p));
words= 5;
}break;
case rule_node:{r= get_node(rule_node_size);words= rule_node_size;
}break;
case ins_node:{r= get_node(ins_node_size);mem[r+4]= mem[p+4];
add_glue_ref(split_top_ptr(p));
ins_ptr(r)= copy_node_list(ins_ptr(p));
words= ins_node_size-1;
}break;
case whatsit_node:/*1253:*/
#line 24480 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(subtype(p)){
case open_node:{r= get_node(open_node_size);words= open_node_size;
}break;
case write_node:case special_node:case latespecial_node:{r= get_node(write_node_size);
add_token_ref(write_tokens(p));words= write_node_size;
}break;
case close_node:case language_node:{r= get_node(small_node_size);
words= small_node_size;
}break;
/*1564:*/
#line 28509 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case save_pos_code:{r= get_node(small_node_size);
words= small_node_size;
}break;

/*:1564*/
#line 24490 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case param_node:
{r= get_node(param_node_size);
if(param_type(p)==glue_type)add_glue_ref(param_value(p).i);
words= param_node_size;
}break;
case par_node:
{r= get_node(par_node_size);
add_xdimen_ref(par_extent(p));
par_params(r)= copy_node_list(par_params(p));
par_list(r)= copy_node_list(par_list(p));
words= par_node_size-1;
}break;
case disp_node:
{r= get_node(disp_node_size);
display_left(r)= display_left(p);
display_no_bs(r)= display_no_bs(p);
display_eqno(r)= copy_node_list(display_eqno(p));
display_formula(r)= copy_node_list(display_formula(p));
display_params(r)= copy_node_list(display_params(p));
words= disp_node_size-2;
}break;
case baseline_node:
{r= get_node(baseline_node_size);
words= baseline_node_size;
}break;
case hpack_node:case vpack_node:
{r= get_node(pack_node_size);
mem[r+7]= mem[p+7];mem[r+6]= mem[p+6];mem[r+5]= mem[p+5];
list_ptr(r)= copy_node_list(list_ptr(p));
add_xdimen_ref(pack_extent(p));
words= 5;
}break;
case hset_node:case vset_node:
{r= get_node(set_node_size);
mem[r+8]= mem[p+8];mem[r+7]= mem[p+7];mem[r+6]= mem[p+6];mem[r+5]= mem[p+5];
list_ptr(r)= copy_node_list(list_ptr(p));
add_xdimen_ref(set_extent(p));
words= 5;
}break;
case image_node:
r= get_node(image_node_size);
add_xdimen_ref(image_xheight(p));add_xdimen_ref(image_xwidth(p));
image_alt(r)= copy_node_list(image_alt(p));
words= image_node_size-1;
break;
case color_node:
case no_color_node:
case end_color_node:
r= get_node(color_node_size);
words= color_node_size;
break;
case align_node:
{r= get_node(align_node_size);
align_preamble(r)= copy_node_list(align_preamble(p));
align_list(r)= copy_node_list(align_list(p));
add_xdimen_ref(align_extent(p));
words= align_node_size-1;
}break;
case setpage_node:
{r= get_node(setpage_node_size);
add_glue_ref(setpage_topskip(p));
add_xdimen_ref(setpage_height(p));
add_xdimen_ref(setpage_width(p));
setpage_list(r)= copy_node_list(setpage_list(p));
setpage_streams(r)= copy_node_list(setpage_streams(p));
words= setpage_node_size-1;
}break;
case setstream_node:
{r= get_node(setstream_node_size);
add_xdimen_ref(setstream_max(p));
add_xdimen_ref(setstream_width(p));
add_glue_ref(setstream_topskip(p));
add_glue_ref(setstream_height(p));
setstream_before(r)= copy_node_list(setstream_before(p));
setstream_after(r)= copy_node_list(setstream_after(p));
words= setstream_node_size-1;
}break;
case ignore_node:
r= get_node(ignore_node_size);
ignore_info(r)= ignore_info(p);
ignore_list(r)= copy_node_list(ignore_list(p));
words= ignore_node_size-1;
break;
case start_link_node:
r= get_node(link_node_size);
if(label_has_name(as_label(p)))add_token_ref(label_ptr(as_label(p)));
words= link_node_size;
break;
case end_link_node:
r= get_node(link_node_size);
words= link_node_size;
break;
case label_node:
r= get_node(label_node_size);
if(label_has_name(p))add_token_ref(label_ptr(p));
words= label_node_size;
break;
case outline_node:
r= get_node(outline_node_size);
if(label_has_name(p))add_token_ref(label_ptr(p));
outline_ptr(r)= copy_node_list(outline_ptr(p));
outline_depth(r)= outline_depth(p);
words= outline_node_size-1;
break;
case stream_node:
r= get_node(stream_node_size);
words= stream_node_size;
break;
case xdimen_node:
r= get_node(xdimen_node_size);
words= xdimen_node_size;
break;
default:confusion("ext2");

}

/*:1253*/
#line 4012 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case glue_node:{r= get_node(small_node_size);add_glue_ref(glue_ptr(p));
glue_ptr(r)= glue_ptr(p);leader_ptr(r)= copy_node_list(leader_ptr(p));
}break;
case kern_node:case math_node:case penalty_node:{r= get_node(small_node_size);
words= small_node_size;
}break;
case ligature_node:{r= get_node(small_node_size);
mem[lig_char(r)]= mem[lig_char(p)];
lig_ptr(r)= copy_node_list(lig_ptr(p));
}break;
case disc_node:{r= get_node(small_node_size);
pre_break(r)= copy_node_list(pre_break(p));
post_break(r)= copy_node_list(post_break(p));
}break;
case mark_node:{r= get_node(small_node_size);add_token_ref(mark_ptr(p));
words= small_node_size;
}break;
case adjust_node:{r= get_node(small_node_size);
adjust_ptr(r)= copy_node_list(adjust_ptr(p));
}break;
default:confusion("copying");

}

/*:201*/
#line 3991 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
while(words> 0)
{decr(words);mem[r+words]= mem[p+words];
}

/*:200*/
#line 3980 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
link(q)= r;q= r;p= link(p);
}
link(q)= null;q= link(h);free_avail(h);
return q;
}

/*:199*//*206:*/
#line 4255 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_mode(int m)
{if(m> 0)
switch(m/(max_command+1)){
case 0:print("vertical");break;
case 1:print("horizontal");break;
case 2:print("display math");
}
else if(m==0)print("no");
else switch((-m)/(max_command+1)){
case 0:print("internal vertical");break;
case 1:print("restricted horizontal");break;
case 2:print("math");
}
print(" mode");
}

/*:206*//*211:*/
#line 4381 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void push_nest(void)
{if(nest_ptr> max_nest_stack)
{max_nest_stack= nest_ptr;
if(nest_ptr==nest_size)overflow("semantic nest size",nest_size);

}
nest[nest_ptr]= cur_list;
incr(nest_ptr);head= get_avail();tail= head;prev_graf= 0;mode_line= line;
eTeX_aux= null;
}

/*:211*//*212:*/
#line 4397 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void pop_nest(void)
{free_avail(head);decr(nest_ptr);cur_list= nest[nest_ptr];
}

/*:212*//*213:*/
#line 4403 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_totals(void);
static void show_activities(void)
{int p;
int m;
memory_word a;
pointer q,r;
int t;
nest[nest_ptr]= cur_list;
print_nl("");print_ln();
for(p= nest_ptr;p>=0;p--)
{m= nest[p].mode_field;a= nest[p].aux_field;
print_nl("### ");print_mode(m);
print(" entered at line ");print_int(abs(nest[p].ml_field));
if(m==hmode)if(nest[p].pg_field!=040600000)
{print(" (language");print_int(nest[p].pg_field%0200000);
print(":hyphenmin");print_int(nest[p].pg_field/020000000);
print_char(',');print_int((nest[p].pg_field/0200000)%0100);
print_char(')');
}
if(nest[p].ml_field<0)print(" (\\output routine)");
if(p==0)
{/*919:*/
#line 18748 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(page_head!=page_tail)
{print_nl("### current page:");
if(output_active)print(" (held over for next output)");

show_box(link(page_head));
if(page_contents> empty)
{print_nl("total height ");print_totals();

print_nl(" goal height ");print_scaled(page_goal);

r= link(page_ins_head);
while(r!=page_ins_head)
{print_ln();print_esc("insert");t= qo(subtype(r));
print_int(t);print(" adds ");
if(count(t)==1000)t= height(r);
else t= x_over_n(height(r),1000)*count(t);
print_scaled(t);
if(type(r)==split_up)
{q= page_head;t= 0;
do{q= link(q);
if((type(q)==ins_node)&&(subtype(q)==subtype(r)))incr(t);
}while(!(q==broken_ins(r)));
print(", #");print_int(t);print(" might split");
}
r= link(r);
}
}
}

/*:919*/
#line 4424 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(link(contrib_head)!=null)
print_nl("### recent contributions:");
}
show_box(link(nest[p].head_field));
/*214:*/
#line 4433 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(abs(m)/(max_command+1)){
case 0:{print_nl("prevdepth ");
if(a.sc<=ignore_depth)
{if(a.sc<=unknown_depth)print("unknown");else print("ignored");}
else print_scaled(a.sc);
if(nest[p].pg_field!=0)
{print(", prevgraf ");
print_int(nest[p].pg_field);print(" line");
if(nest[p].pg_field!=1)print_char('s');
}
}break;
case 1:{print_nl("spacefactor ");print_int(a.hh.lh);
if(m> 0)if(a.hh.rh> 0)
{print(", current language ");print_int(a.hh.rh);
}
}break;
case 2:if(a.i!=null)
{print("this will begin denominator of:");show_box(a.i);
}
}

/*:214*/
#line 4429 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}

/*:213*//*232:*/
#line 5123 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_param(int n)
{switch(n){
case pretolerance_code:print_esc("pretolerance");break;
case tolerance_code:print_esc("tolerance");break;
case line_penalty_code:print_esc("linepenalty");break;
case hyphen_penalty_code:print_esc("hyphenpenalty");break;
case ex_hyphen_penalty_code:print_esc("exhyphenpenalty");break;
case club_penalty_code:print_esc("clubpenalty");break;
case widow_penalty_code:print_esc("widowpenalty");break;
case display_widow_penalty_code:print_esc("displaywidowpenalty");break;
case broken_penalty_code:print_esc("brokenpenalty");break;
case bin_op_penalty_code:print_esc("binoppenalty");break;
case rel_penalty_code:print_esc("relpenalty");break;
case pre_display_penalty_code:print_esc("predisplaypenalty");break;
case post_display_penalty_code:print_esc("postdisplaypenalty");break;
case inter_line_penalty_code:print_esc("interlinepenalty");break;
case double_hyphen_demerits_code:print_esc("doublehyphendemerits");break;
case final_hyphen_demerits_code:print_esc("finalhyphendemerits");break;
case adj_demerits_code:print_esc("adjdemerits");break;
case mag_code:print_esc("mag");break;
case delimiter_factor_code:print_esc("delimiterfactor");break;
case looseness_code:print_esc("looseness");break;
case time_code:print_esc("time");break;
case day_code:print_esc("day");break;
case month_code:print_esc("month");break;
case year_code:print_esc("year");break;
case show_box_breadth_code:print_esc("showboxbreadth");break;
case show_box_depth_code:print_esc("showboxdepth");break;
case hbadness_code:print_esc("hbadness");break;
case vbadness_code:print_esc("vbadness");break;
case pausing_code:print_esc("pausing");break;
case tracing_online_code:print_esc("tracingonline");break;
case tracing_macros_code:print_esc("tracingmacros");break;
case tracing_stats_code:print_esc("tracingstats");break;
case tracing_paragraphs_code:print_esc("tracingparagraphs");break;
case tracing_pages_code:print_esc("tracingpages");break;
case tracing_output_code:print_esc("tracingoutput");break;
case tracing_lost_chars_code:print_esc("tracinglostchars");break;
case tracing_commands_code:print_esc("tracingcommands");break;
case tracing_restores_code:print_esc("tracingrestores");break;
case uc_hyph_code:print_esc("uchyph");break;
case output_penalty_code:print_esc("outputpenalty");break;
case max_dead_cycles_code:print_esc("maxdeadcycles");break;
case hang_after_code:print_esc("hangafter");break;
case floating_penalty_code:print_esc("floatingpenalty");break;
case global_defs_code:print_esc("globaldefs");break;
case cur_fam_code:print_esc("fam");break;
case escape_char_code:print_esc("escapechar");break;
case default_hyphen_char_code:print_esc("defaulthyphenchar");break;
case default_skew_char_code:print_esc("defaultskewchar");break;
case end_line_char_code:print_esc("endlinechar");break;
case new_line_char_code:print_esc("newlinechar");break;
case language_code:print_esc("language");break;
case left_hyphen_min_code:print_esc("lefthyphenmin");break;
case right_hyphen_min_code:print_esc("righthyphenmin");break;
case holding_inserts_code:print_esc("holdinginserts");break;
case error_context_lines_code:print_esc("errorcontextlines");break;
case tracing_stack_levels_code:print_esc("tracingstacklevels");break;
case tracing_fonts_code:print_esc("tracingfonts");break;
/*1279:*/
#line 24987 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case tracing_assigns_code:print_esc("tracingassigns");break;
case tracing_groups_code:print_esc("tracinggroups");break;
case tracing_ifs_code:print_esc("tracingifs");break;
case tracing_scan_tokens_code:print_esc("tracingscantokens");break;
case tracing_nesting_code:print_esc("tracingnesting");break;
case saving_vdiscards_code:print_esc("savingvdiscards");break;
case saving_hyph_codes_code:print_esc("savinghyphcodes");break;
case ignore_primitive_error_code:print_esc("ignoreprimitiveerror");break;

/*:1279*//*1428:*/
#line 27183 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case expand_depth_code:print_esc("expanddepth");break;

/*:1428*/
#line 5182 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print("[unknown integer parameter!]");
}
}

/*:232*//*236:*/
#line 5337 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void fix_date_and_time(void)
{struct tm*t= tl_now();
time= sys_time= t->tm_hour*60+t->tm_min;
day= sys_day= t->tm_mday;
month= sys_month= t->tm_mon+1;
year= sys_year= t->tm_year+1900;
}

/*:236*//*240:*/
#line 5363 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void begin_diagnostic(void)
{old_setting= selector;
if((tracing_online<=0)&&(selector==term_and_log))
{decr(selector);
if(history==spotless)history= warning_issued;
}
}

static void end_diagnostic(bool blank_line)

{print_nl("");
if(blank_line)print_ln();
selector= old_setting;
}

/*:240*//*242:*/
#line 5446 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_length_param(int n)
{switch(n){
case par_indent_code:print_esc("parindent");break;
case math_surround_code:print_esc("mathsurround");break;
case line_skip_limit_code:print_esc("lineskiplimit");break;
case hsize_code:print_esc("hsize");break;
case vsize_code:print_esc("vsize");break;
case max_depth_code:print_esc("maxdepth");break;
case split_max_depth_code:print_esc("splitmaxdepth");break;
case box_max_depth_code:print_esc("boxmaxdepth");break;
case hfuzz_code:print_esc("hfuzz");break;
case vfuzz_code:print_esc("vfuzz");break;
case delimiter_shortfall_code:print_esc("delimitershortfall");break;
case null_delimiter_space_code:print_esc("nulldelimiterspace");break;
case script_space_code:print_esc("scriptspace");break;
case pre_display_size_code:print_esc("predisplaysize");break;
case display_width_code:print_esc("displaywidth");break;
case display_indent_code:print_esc("displayindent");break;
case overfull_rule_code:print_esc("overfullrule");break;
case hang_indent_code:print_esc("hangindent");break;
case h_offset_code:print_esc("hoffset");break;
case v_offset_code:print_esc("voffset");break;
case emergency_stretch_code:print_esc("emergencystretch");break;
case page_width_code:print_esc("pagewidth");break;
case page_height_code:print_esc("pageheight");break;
default:print("[unknown dimen parameter!]");
}
}

/*:242*//*247:*/
#line 5540 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*293:*/
#line 6662 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_cmd_chr(quarterword cmd,halfword chr_code)
{int n;
switch(cmd){
case left_brace:chr_cmd("begin-group character ")break;
case right_brace:chr_cmd("end-group character ")break;
case math_shift:chr_cmd("math shift character ")break;
case mac_param:chr_cmd("macro parameter character ")break;
case sup_mark:chr_cmd("superscript character ")break;
case sub_mark:chr_cmd("subscript character ")break;
case endv:print("end of alignment template");break;
case spacer:chr_cmd("blank space ")break;
case letter:chr_cmd("the letter ")break;
case other_char:chr_cmd("the character ")break;
/*222:*/
#line 4711 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case assign_glue:case assign_mu_glue:if(chr_code<skip_base)
print_skip_param(chr_code-glue_base);
else if(chr_code<mu_skip_base)
{print_esc("skip");print_int(chr_code-skip_base);
}
else{print_esc("muskip");print_int(chr_code-mu_skip_base);
}break;

/*:222*//*226:*/
#line 4836 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case assign_toks:if(chr_code>=toks_base)
{print_esc("toks");print_int(chr_code-toks_base);
}
else switch(chr_code){
case output_routine_loc:print_esc("output");break;
case every_par_loc:print_esc("everypar");break;
case every_math_loc:print_esc("everymath");break;
case every_display_loc:print_esc("everydisplay");break;
case every_hbox_loc:print_esc("everyhbox");break;
case every_vbox_loc:print_esc("everyvbox");break;
case every_job_loc:print_esc("everyjob");break;
case every_cr_loc:print_esc("everycr");break;
/*1278:*/
#line 24984 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case every_eof_loc:print_esc("everyeof");break;

/*:1278*/
#line 4849 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print_esc("errhelp");
}break;

/*:226*//*234:*/
#line 5308 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case assign_int:if(chr_code<count_base)print_param(chr_code-int_base);
else{print_esc("count");print_int(chr_code-count_base);
}break;

/*:234*//*244:*/
#line 5521 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case assign_dimen:if(chr_code<scaled_base)
print_length_param(chr_code-dimen_base);
else{print_esc("dimen");print_int(chr_code-scaled_base);
}break;

/*:244*//*261:*/
#line 5872 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case accent:print_esc("accent");break;
case advance:print_esc("advance");break;
case after_assignment:print_esc("afterassignment");break;
case after_group:print_esc("aftergroup");break;
case assign_font_dimen:print_esc("fontdimen");break;
case begin_group:print_esc("begingroup");break;
case break_penalty:print_esc("penalty");break;
case char_num:print_esc("char");break;
case cs_name:print_esc("csname");break;
case def_font:print_esc("font");break;
case delim_num:print_esc("delimiter");break;
case divide:print_esc("divide");break;
case end_cs_name:print_esc("endcsname");break;
case end_group:print_esc("endgroup");break;
case ex_space:print_esc(" ");break;
case expand_after:switch(chr_code){
case 0:print_esc("expandafter");break;
/*1335:*/
#line 25646 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case 1:print_esc("unless");break;

/*:1335*//*1468:*/
#line 27520 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case primitive_code:print_esc("primitive");break;

/*:1468*//*1478:*/
#line 27639 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case expanded_code:print_esc("expanded");

/*:1478*/
#line 5890 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}break;
case halign:print_esc("halign");break;
case hrule:print_esc("hrule");break;
case ignore_spaces:print_esc("ignorespaces");break;
case insert:print_esc("insert");break;
case ital_corr:print_esc("/");break;
case mark:{print_esc("mark");
if(chr_code> 0)print_char('s');
}break;
case math_accent:print_esc("mathaccent");break;
case math_char_num:print_esc("mathchar");break;
case math_choice:print_esc("mathchoice");break;
case multiply:print_esc("multiply");break;
case no_align:print_esc("noalign");break;
case no_boundary:print_esc("noboundary");break;
case no_expand:print_esc("noexpand");break;
case non_script:print_esc("nonscript");break;
case omit:print_esc("omit");break;
case radical:print_esc("radical");break;
case read_to_cs:if(chr_code==0)print_esc("read")
/*1332:*/
#line 25613 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else print_esc("readline")

/*:1332*/
#line 5911 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;break;
case relax:print_esc("relax");break;
case set_box:print_esc("setbox");break;
case set_prev_graf:print_esc("prevgraf");break;
case set_shape:switch(chr_code){
case par_shape_loc:print_esc("parshape");break;
/*1424:*/
#line 27155 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case inter_line_penalties_loc:print_esc("interlinepenalties");break;
case club_penalties_loc:print_esc("clubpenalties");break;
case widow_penalties_loc:print_esc("widowpenalties");break;
case display_widow_penalties_loc:print_esc("displaywidowpenalties");

/*:1424*/
#line 5917 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}break;
case the:if(chr_code==0)print_esc("the")
/*1307:*/
#line 25389 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(chr_code==1)print_esc("unexpanded");
else print_esc("detokenize")

/*:1307*/
#line 5920 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;break;
case toks_register:/*1404:*/
#line 26834 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_esc("toks");
if(chr_code!=mem_bot)print_sa_num(chr_code);
}

/*:1404*/
#line 5921 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case vadjust:print_esc("vadjust");break;
case valign:print_esc("valign");break;
case vcenter:print_esc("vcenter");break;
case vrule:print_esc("vrule");break;

/*:261*//*330:*/
#line 7466 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case par_end:print_esc("par");break;

/*:330*//*372:*/
#line 8180 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case input:if(chr_code==0)print_esc("input")
/*1320:*/
#line 25483 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(chr_code==2)print_esc("scantokens")

/*:1320*/
#line 8182 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else print_esc("endinput");break;

/*:372*//*380:*/
#line 8277 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case top_bot_mark:{switch((chr_code%marks_code)){
case first_mark_code:print_esc("firstmark");break;
case bot_mark_code:print_esc("botmark");break;
case split_first_mark_code:print_esc("splitfirstmark");break;
case split_bot_mark_code:print_esc("splitbotmark");break;
default:print_esc("topmark");
}
if(chr_code>=marks_code)print_char('s');
}break;

/*:380*//*407:*/
#line 8740 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case internal_register:/*1403:*/
#line 26818 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((chr_code<mem_bot)||(chr_code> lo_mem_stat_max))
cmd= sa_type(chr_code);
else{cmd= chr_code-mem_bot;chr_code= null;
}
if(cmd==int_val)print_esc("count");
else if(cmd==dimen_val)print_esc("dimen");
else if(cmd==glue_val)print_esc("skip");
else print_esc("muskip");
if(chr_code!=null)print_sa_num(chr_code);
}

/*:1403*/
#line 8741 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;

/*:407*//*412:*/
#line 8882 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_aux:if(chr_code==vmode)print_esc("prevdepth");
else print_esc("spacefactor");break;
case set_page_int:if(chr_code==0)print_esc("deadcycles")
/*1313:*/
#line 25444 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(chr_code==2)print_esc("interactionmode")

/*:1313*/
#line 8886 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else print_esc("insertpenalties");break;
case set_box_dimen:if(chr_code==width_offset)print_esc("wd");
else if(chr_code==height_offset)print_esc("ht");
else print_esc("dp");break;
case last_item:switch(chr_code){
case int_val:print_esc("lastpenalty");break;
case dimen_val:print_esc("lastkern");break;
case glue_val:print_esc("lastskip");break;
case input_line_no_code:print_esc("inputlineno");break;
/*1271:*/
#line 24931 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case last_node_type_code:print_esc("lastnodetype");break;
case eTeX_version_code:print_esc("eTeXversion");break;

/*:1271*//*1284:*/
#line 25072 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case current_group_level_code:print_esc("currentgrouplevel");break;
case current_group_type_code:print_esc("currentgrouptype");break;

/*:1284*//*1287:*/
#line 25096 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case current_if_level_code:print_esc("currentiflevel");break;
case current_if_type_code:print_esc("currentiftype");break;
case current_if_branch_code:print_esc("currentifbranch");break;

/*:1287*//*1290:*/
#line 25134 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case font_char_wd_code:print_esc("fontcharwd");break;
case font_char_ht_code:print_esc("fontcharht");break;
case font_char_dp_code:print_esc("fontchardp");break;
case font_char_ic_code:print_esc("fontcharic");break;

/*:1290*//*1293:*/
#line 25173 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case par_shape_length_code:print_esc("parshapelength");break;
case par_shape_indent_code:print_esc("parshapeindent");break;
case par_shape_dimen_code:print_esc("parshapedimen");break;

/*:1293*//*1351:*/
#line 25874 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case eTeX_expr-int_val+int_val:print_esc("numexpr");break;
case eTeX_expr-int_val+dimen_val:print_esc("dimexpr");break;
case eTeX_expr-int_val+glue_val:print_esc("glueexpr");break;
case eTeX_expr-int_val+mu_val:print_esc("muexpr");break;

/*:1351*//*1374:*/
#line 26294 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case glue_stretch_order_code:print_esc("gluestretchorder");break;
case glue_shrink_order_code:print_esc("glueshrinkorder");break;
case glue_stretch_code:print_esc("gluestretch");break;
case glue_shrink_code:print_esc("glueshrink");break;

/*:1374*//*1378:*/
#line 26329 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mu_to_glue_code:print_esc("mutoglue");break;
case glue_to_mu_code:print_esc("gluetomu");break;

/*:1378*//*1443:*/
#line 27319 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case Prote_version_code:print_esc("Proteversion");break;

/*:1443*//*1458:*/
#line 27448 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case shell_escape_code:print_esc("shellescape");break;

/*:1458*//*1492:*/
#line 27760 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case elapsed_time_code:print_esc("elapsedtime");break;

/*:1492*//*1529:*/
#line 28228 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case random_seed_code:print_esc("randomseed");break;

/*:1529*//*1555:*/
#line 28462 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case last_xpos_code:print_esc("lastxpos");break;
case last_ypos_code:print_esc("lastypos");break;

/*:1555*//*1568:*/
#line 28541 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case HINT_version_code:print_esc("HINTversion");break;
case HINT_minor_version_code:print_esc("HINTminorversion");break;

/*:1568*/
#line 8896 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print_esc("badness");
}break;

/*:412*//*464:*/
#line 9777 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case convert:switch(chr_code){
case number_code:print_esc("number");break;
case roman_numeral_code:print_esc("romannumeral");break;
case string_code:print_esc("string");break;
case meaning_code:print_esc("meaning");break;
case font_name_code:print_esc("fontname");break;
case job_name_code:print_esc("jobname");break;
case Uchar_code:print_esc("Uchar");break;
case Ucharcat_code:print_esc("Ucharcat");break;
case eTeX_revision_code:print_esc("eTeXrevision");break;
/*1445:*/
#line 27325 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case Prote_revision_code:print_esc("Proterevision");break;

/*:1445*//*1481:*/
#line 27665 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case strcmp_code:print_esc("strcmp");break;

/*:1481*//*1487:*/
#line 27722 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case creation_date_code:print_esc("creationdate");break;

/*:1487*//*1499:*/
#line 27809 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_size_code:print_esc("filesize");break;

/*:1499*//*1503:*/
#line 27836 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_mod_date_code:print_esc("filemoddate");break;

/*:1503*//*1507:*/
#line 27876 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_dump_code:print_esc("filedump");break;

/*:1507*//*1511:*/
#line 27939 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mdfive_sum_code:print_esc("mdfivesum");break;

/*:1511*//*1533:*/
#line 28252 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_random_seed_code:print_esc("setrandomseed");break;

/*:1533*//*1540:*/
#line 28328 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case uniform_deviate_code:print_esc("uniformdeviate");break;

/*:1540*//*1547:*/
#line 28412 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case normal_deviate_code:print_esc("normaldeviate");

/*:1547*/
#line 9788 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}break;

/*:464*//*483:*/
#line 10158 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_test:{if(chr_code>=unless_code)print_esc("unless");
switch(chr_code%unless_code){
case if_cat_code:print_esc("ifcat");break;
case if_int_code:print_esc("ifnum");break;
case if_dim_code:print_esc("ifdim");break;
case if_odd_code:print_esc("ifodd");break;
case if_vmode_code:print_esc("ifvmode");break;
case if_hmode_code:print_esc("ifhmode");break;
case if_mmode_code:print_esc("ifmmode");break;
case if_inner_code:print_esc("ifinner");break;
case if_void_code:print_esc("ifvoid");break;
case if_hbox_code:print_esc("ifhbox");break;
case if_vbox_code:print_esc("ifvbox");break;
case ifx_code:print_esc("ifx");break;
case if_eof_code:print_esc("ifeof");break;
case if_true_code:print_esc("iftrue");break;
case if_false_code:print_esc("iffalse");break;
case if_case_code:print_esc("ifcase");break;
/*1336:*/
#line 25649 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_def_code:print_esc("ifdefined");break;
case if_cs_code:print_esc("ifcsname");break;
case if_font_char_code:print_esc("iffontchar");break;

/*:1336*//*1461:*/
#line 27465 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_incsname_code:print_esc("ifincsname");break;
case if_primitive_code:print_esc("ifprimitive");break;

/*:1461*/
#line 10177 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print_esc("if");
}
}break;

/*:483*//*487:*/
#line 10223 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case fi_or_else:if(chr_code==fi_code)print_esc("fi");
else if(chr_code==or_code)print_esc("or");
else print_esc("else");break;

/*:487*//*712:*/
#line 14684 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case tab_mark:if(chr_code==span_code)print_esc("span");
else chr_cmd("alignment tab character ")break;
case car_ret:if(chr_code==cr_code)print_esc("cr");
else print_esc("crcr");break;

/*:712*//*917:*/
#line 18722 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_page_dimen:switch(chr_code){
case 0:print_esc("pagegoal");break;
case 1:print_esc("pagetotal");break;
case 2:print_esc("pagestretch");break;
case 3:print_esc("pagefilstretch");break;
case 4:print_esc("pagefillstretch");break;
case 5:print_esc("pagefilllstretch");break;
case 6:print_esc("pageshrink");break;
default:print_esc("pagedepth");
}break;

/*:917*//*956:*/
#line 19429 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case stop:if(chr_code==1)print_esc("dump");else print_esc("end");break;

/*:956*//*962:*/
#line 19538 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hskip:switch(chr_code){
case skip_code:print_esc("hskip");break;
case fil_code:print_esc("hfil");break;
case fill_code:print_esc("hfill");break;
case ss_code:print_esc("hss");break;
default:print_esc("hfilneg");
}break;
case vskip:switch(chr_code){
case skip_code:print_esc("vskip");break;
case fil_code:print_esc("vfil");break;
case fill_code:print_esc("vfill");break;
case ss_code:print_esc("vss");break;
default:print_esc("vfilneg");
}break;
case mskip:print_esc("mskip");break;
case kern:print_esc("kern");break;
case mkern:print_esc("mkern");break;

/*:962*//*975:*/
#line 19806 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hmove:if(chr_code==1)print_esc("moveleft");else print_esc("moveright");break;
case vmove:if(chr_code==1)print_esc("raise");else print_esc("lower");break;
case make_box:switch(chr_code){
case box_code:print_esc("box");break;
case copy_code:print_esc("copy");break;
case last_box_code:print_esc("lastbox");break;
case vsplit_code:print_esc("vsplit");break;
case vtop_code:print_esc("vtop");break;
case vtop_code+vmode:print_esc("vbox");break;
default:print_esc("hbox");
}break;
case leader_ship:if(chr_code==a_leaders)print_esc("leaders");
else if(chr_code==c_leaders)print_esc("cleaders");
else if(chr_code==x_leaders)print_esc("xleaders");
else print_esc("shipout");break;

/*:975*//*992:*/
#line 20084 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case start_par:if(chr_code==0)print_esc("noindent");else print_esc("indent");break;

/*:992*//*1011:*/
#line 20317 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case remove_item:if(chr_code==glue_node)print_esc("unskip");
else if(chr_code==kern_node)print_esc("unkern");
else print_esc("unpenalty");break;
case un_hbox:if(chr_code==copy_code)print_esc("unhcopy");
else print_esc("unhbox");break;
case un_vbox:if(chr_code==copy_code)print_esc("unvcopy")
/*1421:*/
#line 27131 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(chr_code==last_box_code)print_esc("pagediscards");
else if(chr_code==vsplit_code)print_esc("splitdiscards")

/*:1421*/
#line 20324 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else print_esc("unvbox");break;

/*:1011*//*1018:*/
#line 20397 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case discretionary:if(chr_code==1)
print_esc("-");else print_esc("discretionary");break;

/*:1018*//*1046:*/
#line 20761 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case eq_no:if(chr_code==1)print_esc("leqno");else print_esc("eqno");break;

/*:1046*//*1057:*/
#line 20958 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case math_comp:switch(chr_code){
case ord_noad:print_esc("mathord");break;
case op_noad:print_esc("mathop");break;
case bin_noad:print_esc("mathbin");break;
case rel_noad:print_esc("mathrel");break;
case open_noad:print_esc("mathopen");break;
case close_noad:print_esc("mathclose");break;
case punct_noad:print_esc("mathpunct");break;
case inner_noad:print_esc("mathinner");break;
case under_noad:print_esc("underline");break;
default:print_esc("overline");
}break;
case limit_switch:if(chr_code==limits)print_esc("limits");
else if(chr_code==no_limits)print_esc("nolimits");
else print_esc("displaylimits");break;

/*:1057*//*1070:*/
#line 21094 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case math_style:print_style(chr_code);break;

/*:1070*//*1079:*/
#line 21197 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case above:switch(chr_code){
case over_code:print_esc("over");break;
case atop_code:print_esc("atop");break;
case delimited_code+above_code:print_esc("abovewithdelims");break;
case delimited_code+over_code:print_esc("overwithdelims");break;
case delimited_code+atop_code:print_esc("atopwithdelims");break;
default:print_esc("above");
}break;

/*:1079*//*1089:*/
#line 21318 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case left_right:if(chr_code==left_noad)print_esc("left")
/*1318:*/
#line 25473 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(chr_code==middle_noad)print_esc("middle")

/*:1318*/
#line 21320 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else print_esc("right");break;

/*:1089*//*1104:*/
#line 21602 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case prefix:if(chr_code==1)print_esc("long");
else if(chr_code==2)print_esc("outer")
/*1343:*/
#line 25733 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(chr_code==8)print_esc("protected")

/*:1343*/
#line 21605 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else print_esc("global");break;
case def:if(chr_code==0)print_esc("def");
else if(chr_code==1)print_esc("gdef");
else if(chr_code==2)print_esc("edef");
else print_esc("xdef");break;

/*:1104*//*1115:*/
#line 21788 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case let:if(chr_code!=normal)print_esc("futurelet");else print_esc("let");break;

/*:1115*//*1118:*/
#line 21843 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case shorthand_def:switch(chr_code){
case char_def_code:print_esc("chardef");break;
case math_char_def_code:print_esc("mathchardef");break;
case count_def_code:print_esc("countdef");break;
case dimen_def_code:print_esc("dimendef");break;
case skip_def_code:print_esc("skipdef");break;
case mu_skip_def_code:print_esc("muskipdef");break;
default:print_esc("toksdef");
}break;
case char_given:{print_esc("char");print_hex(chr_code);
}break;
case math_given:{print_esc("mathchar");Umath_to_math(chr_code);print_hex(chr_code);
}break;

/*:1118*//*1126:*/
#line 22013 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case def_code:if(chr_code==utf_cat_code_base)print_esc("catcode");
else if(chr_code==utf_math_code_base)print_esc("Umathcode");
else if(chr_code==utf_math_codenum_base)print_esc("Umathcodenum");
else if(chr_code==utf_lc_code_base)print_esc("lccode");
else if(chr_code==utf_uc_code_base)print_esc("uccode");
else if(chr_code==utf_sf_code_base)print_esc("sfcode");
else if(chr_code==math_code_base)print_esc("mathcode");
else if(chr_code==sf_code_base)print_esc("sfcode");
else print_esc("delcode");break;
case def_family:print_size(chr_code-math_font_base);break;

/*:1126*//*1146:*/
#line 22337 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hyph_data:if(chr_code==1)print_esc("patterns");
else print_esc("hyphenation");break;

/*:1146*//*1150:*/
#line 22374 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case assign_font_int:if(chr_code==0)print_esc("hyphenchar");
else print_esc("skewchar");break;

/*:1150*//*1156:*/
#line 22489 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_font:{print("select font ");slow_print(font_name[chr_code]);
if(font_size[chr_code]!=font_dsize[chr_code])
{print(" at ");print_scaled(font_size[chr_code]);
print("pt");
}
}break;

/*:1156*//*1158:*/
#line 22507 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_interaction:switch(chr_code){
case batch_mode:print_esc("batchmode");break;
case nonstop_mode:print_esc("nonstopmode");break;
case scroll_mode:print_esc("scrollmode");break;
default:print_esc("errorstopmode");
}break;

/*:1158*//*1168:*/
#line 22569 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case in_stream:if(chr_code==0)print_esc("closein");
else print_esc("openin");break;

/*:1168*//*1173:*/
#line 22603 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case message:if(chr_code==0)print_esc("message");
else print_esc("errmessage");break;

/*:1173*//*1182:*/
#line 22670 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case case_shift:if(chr_code==utf_lc_code_base)print_esc("lowercase");
else print_esc("uppercase");break;

/*:1182*//*1187:*/
#line 22730 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case xray:switch(chr_code){
case show_box_code:print_esc("showbox");break;
case show_the_code:print_esc("showthe");break;
case show_lists_code:print_esc("showlists");break;
/*1296:*/
#line 25201 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case show_groups:print_esc("showgroups");break;

/*:1296*//*1305:*/
#line 25372 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case show_tokens:print_esc("showtokens");break;

/*:1305*//*1310:*/
#line 25413 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case show_ifs:print_esc("showifs");break;

/*:1310*/
#line 22735 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print_esc("show");
}break;

/*:1187*//*1190:*/
#line 22786 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case undefined_cs:print("undefined");break;
case call:case long_call:case outer_call:
case long_outer_call:{n= cmd-call;
if(info(link(chr_code))==protected_token)n= n+4;
if(odd(n/4))print_esc("protected");
if(odd(n))print_esc("long");
if(odd(n/2))print_esc("outer");
if(n> 0)print_char(' ');
print("macro");
}break;
case end_template:print_esc("outer endtemplate");break;

/*:1190*//*1241:*/
#line 23928 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case extension:switch(chr_code){
case open_node:print_esc("openout");break;
case write_node:print_esc("write");break;
case close_node:print_esc("closeout");break;
case special_node:print_esc("special");break;
case image_node:print_esc("HINTimage");break;
case color_node:print_esc("HINTcolor");break;
case end_color_node:print_esc("HINTendcolor");break;
case no_color_node:print_esc("HINTendcolor ignored");break;
case default_color_node:print_esc("HINTdefaultcolor");break;
case link_color_node:print_esc("HINTlinkcolor");break;
case default_link_color_node:print_esc("HINTdefaultlinkcolor");break;
case start_link_node:print_esc("HINTstartlink");break;
case end_link_node:print_esc("HINTendlink");break;
case label_node:print_esc("HINTdest");break;
case outline_node:print_esc("HINToutline");break;
case setpage_node:print_esc("HINTsetpage");break;
case stream_before_node:print_esc("HINTbefore");break;
case stream_after_node:print_esc("HINTafter");break;
case setstream_node:print_esc("HINTsetstream");break;
case stream_node:print_esc("HINTstream");break;
case param_node:print("[HINT internal: parameter list]");break;
case par_node:print("[HINT internal: paragraph]");break;
case disp_node:print("[HINT internal: display]");break;
case baseline_node:print("[HINT internal: baselineskip]");break;
case hpack_node:print("[HINT internal: hpack]");break;
case vpack_node:print("[HINT internal: vpack");break;
case hset_node:print("[HINT internal: hset]");break;
case vset_node:print("[HINT internal: vset]");break;
case align_node:print("[HINT internal: align]");break;
case xdimen_node:print("[HINT internal: xdimen]");break;
case ignore_node:print("[HINT internal: ignore]");break;
case immediate_code:print_esc("immediate");break;
case set_language_code:print_esc("setlanguage");break;
/*1493:*/
#line 27763 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case reset_timer_code:print_esc("resettimer");break;

/*:1493*//*1560:*/
#line 28491 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case save_pos_code:print_esc("savepos");break;

/*:1560*/
#line 23963 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print("[unknown extension!]");
}break;

/*:1241*/
#line 6676 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print("[unknown command code!]");
}
}

/*:293*/
#line 5540 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef STAT
static void show_eqtb(pointer n)
{if(n<active_base)print_char('?');
else if(n<glue_base)/*218:*/
#line 4578 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{sprint_cs(n);print_char('=');print_cmd_chr(eq_type(n),equiv(n));
if(eq_type(n)>=call)
{print_char(':');show_token_list(link(equiv(n)),null,32);
}
}

/*:218*/
#line 5544 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(n<local_base)/*224:*/
#line 4728 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(n<skip_base)
{print_skip_param(n-glue_base);print_char('=');
if(n<glue_base+thin_mu_skip_code)print_spec(equiv(n),"pt");
else print_spec(equiv(n),"mu");
}
else if(n<mu_skip_base)
{print_esc("skip");print_int(n-skip_base);print_char('=');
print_spec(equiv(n),"pt");
}
else{print_esc("muskip");print_int(n-mu_skip_base);print_char('=');
print_spec(equiv(n),"mu");
}

/*:224*/
#line 5545 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(n<int_base)/*228:*/
#line 4901 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((n==par_shape_loc)||((n>=etex_pen_base)&&(n<etex_pens)))
{print_cmd_chr(set_shape,n);print_char('=');
if(equiv(n)==null)print_char('0');
else if(n> par_shape_loc)
{print_int(penalty(equiv(n)));print_char(' ');
print_int(penalty(equiv(n)+1));
if(penalty(equiv(n))> 1)print_esc("ETC.");
}
else print_int(info(par_shape_ptr));
}
else if(n<toks_base)
{print_cmd_chr(assign_toks,n);print_char('=');
if(equiv(n)!=null)show_token_list(link(equiv(n)),null,32);
}
else if(n<box_base)
{print_esc("toks");print_int(n-toks_base);print_char('=');
if(equiv(n)!=null)show_token_list(link(equiv(n)),null,32);
}
else if(n<cur_font_loc)
{print_esc("box");print_int(n-box_base);print_char('=');
if(equiv(n)==null)print("void");
else{depth_threshold= 0;breadth_max= 1;show_node_list(equiv(n));
}
}
else if(n<cat_code_base)/*229:*/
#line 4929 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(n==cur_font_loc)print("current font");
else if(n<math_font_base+16)
{print_esc("textfont");print_int(n-math_font_base);
}
else if(n<math_font_base+32)
{print_esc("scriptfont");print_int(n-math_font_base-16);
}
else{print_esc("scriptscriptfont");print_int(n-math_font_base-32);
}
print_char('=');
printn_esc(hash[font_id_base+equiv(n)].rh);

}

/*:229*/
#line 4926 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*230:*/
#line 4944 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(n<math_code_base)
{if(n<math_code_base)
{print_esc("catcode");print_int(n-cat_code_base);
print_char('=');print_int(equiv(n));
}
else
{print("This information should be in the utf tables");
}
}
else{print_esc("mathcode");print_int(n-math_code_base);
print_char('=');print_int(ho(equiv(n)));
}

/*:230*/
#line 4927 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:228*/
#line 5546 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(n<dimen_base)/*237:*/
#line 5345 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(n<count_base)print_param(n-int_base);
else if(n<del_code_base)
{print_esc("count");print_int(n-count_base);
}
else{print_esc("delcode");print_int(n-del_code_base);
}
print_char('=');print_int(eqtb[n].i);
}

/*:237*/
#line 5547 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(n<=eqtb_size)/*246:*/
#line 5530 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(n<scaled_base)print_length_param(n-dimen_base);
else{print_esc("dimen");print_int(n-scaled_base);
}
print_char('=');print_scaled(eqtb[n].sc);print("pt");
}

/*:246*/
#line 5548 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(n<=utf_code_limit)/*1812:*/
#line 34364 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(n&utf_base_mask)
{case utf_cat_code_base:
print_esc("catcode");print_int(n&utf_cp_mask);
print_char('=');print_int(cat_code(n&utf_cp_mask));
break;
case utf_lc_code_base:
print_esc("lccode");print_int(n&utf_cp_mask);
print_char('=');print_int(utf_lccode(n&utf_cp_mask));
break;
case utf_uc_code_base:
print_esc("uccode");print_int(n&utf_cp_mask);
print_char('=');print_int(utf_uccode(n&utf_cp_mask));
break;
case utf_sf_code_base:
print_esc("sfcode");print_int(n&utf_cp_mask);
print_char('=');print_int(sf_code(n&utf_cp_mask));
break;
case utf_del_code_base:
print_esc("delcode");print_int(n&utf_cp_mask);
print_char('=');print_int(del_code(n&utf_cp_mask));
break;
case utf_math_code_base:
print_esc("mathcode");print_int(n&utf_cp_mask);
print_char('=');print_int(math_code(n&utf_cp_mask));
break;
case utf_math_codenum_base:
print_esc("mathcodenum");print_int(n&utf_cp_mask);
print_char('=');print_int(math_code(n&utf_cp_mask));
break;
}

/*:1812*/
#line 5549 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else print_char('?');
}
#endif
#line 5553 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:247*//*254:*/
#line 5643 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer id_lookup(int j,int l)
{int h;
int d;
pointer p;
int k;
/*256:*/
#line 5690 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

h= buffer[j];
for(k= j+1;k<=j+l-1;k++)
{h= h+h+buffer[k];
while(h>=hash_prime)h= h-hash_prime;
}

/*:256*/
#line 5648 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= h+hash_base;
loop{if(text(p)> 0)if(length(text(p))==l)
if(str_eq_buf(text(p),buffer+j))goto found;
if(next(p)==0)
{if(no_new_control_sequence)
p= undefined_control_sequence;
else/*255:*/
#line 5664 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(text(p)> 0)
{do{if(hash_is_full)overflow("hash size",hash_size);

decr(hash_used);
}while(!(text(hash_used)==0));
next(p)= hash_used;p= hash_used;
}
str_room(l);d= cur_length;
while(pool_ptr> str_start[str_ptr])
{decr(pool_ptr);str_pool[pool_ptr+l]= str_pool[pool_ptr];
}
for(k= j;k<=j+l-1;k++)append_char(buffer[k]);
text(p)= make_string();pool_ptr= pool_ptr+d;
#ifdef STAT
incr(cs_count);
#endif
#line 5681 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:255*/
#line 5656 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto found;
}
p= next(p);
}
found:return p;
}

/*:254*//*259:*/
#line 5749 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
static void primitive(char*str,quarterword c,halfword o)
{str_number s= s_no(str);
int k;
int j;
small_number l;
pointer p;
if(s<256)cur_val= s+single_base;
else{k= str_start[s];l= str_start[s+1]-k;

if(first+l> buf_size+1)
overflow("buffer size",buf_size);

for(j= 0;j<=l-1;j++)buffer[first+j]= str_pool[k+j];
cur_val= id_lookup(first,l);
flush_string;text(cur_val)= s;
}
eq_level(cur_val)= level_one;eq_type(cur_val)= c;equiv(cur_val)= o;
/*1472:*/
#line 27597 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

set_ROM_p_from_cs(cur_val);
ROM[p]= eqtb[cur_val];

/*:1472*/
#line 5768 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
#endif
#line 5771 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:259*//*263:*/
#line 5997 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*279:*/
#line 6346 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef STAT
static void restore_trace(pointer p,char*s)

{begin_diagnostic();print_char('{');print(s);print_char(' ');
show_eqtb(p);print_char('}');
end_diagnostic(false);
}
#endif
#line 6355 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:279*//*1281:*/
#line 25007 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_group(bool e)
{
switch(cur_group){
case bottom_level:{print("bottom level");return;
}
case simple_group:case semi_simple_group:
{if(cur_group==semi_simple_group)print("semi ");
print("simple");
}break;
case hbox_group:case adjusted_hbox_group:
{if(cur_group==adjusted_hbox_group)print("adjusted ");
print("hbox");
}break;
case vbox_group:print("vbox");break;
case vtop_group:print("vtop");break;
case align_group:case no_align_group:
{if(cur_group==no_align_group)print("no ");
print("align");
}break;
case output_group:print("output");break;
case disc_group:print("disc");break;
case insert_group:print("insert");break;
case vcenter_group:print("vcenter");break;
case math_group:case math_choice_group:
case math_shift_group:case math_left_group:
{print("math");
if(cur_group==math_choice_group)print(" choice");
else if(cur_group==math_shift_group)print(" shift");
else if(cur_group==math_left_group)print(" left");
}
}
print(" group (level ");print_int(qo(cur_level));print_char(')');
if(saved(-1)!=0)
{if(e)print(" entered at line ");else print(" at line ");
print_int(saved(-1));
}
}

/*:1281*//*1282:*/
#line 25050 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef STAT
static void group_trace(bool e)
{begin_diagnostic();print_char('{');
if(e)print("leaving ");else print("entering ");
print_group(e);print_char('}');end_diagnostic(false);
}
#endif
#line 25058 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1282*//*1328:*/
#line 25568 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool pseudo_input(void)
{pointer p;
int sz;
four_quarters w;
int r;
last= first;
p= info(pseudo_files);
if(p==null)return false;
else{info(pseudo_files)= link(p);sz= ho(info(p));
if(4*sz-3>=buf_size-last)
/*31:*/
#line 946 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(format_ident==0)
{write_ln(term_out,"Buffer size exceeded!");exit(0);

}
else{cur_input.loc_field= first;cur_input.limit_field= last-1;
overflow("buffer size",buf_size);

}

/*:31*/
#line 25579 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
last= first;
for(r= p+1;r<=p+sz-1;r++)
{w= mem[r].qqqq;
buffer[last]= w.b0;buffer[last+1]= w.b1;
buffer[last+2]= w.b2;buffer[last+3]= w.b3;
last= last+4;
}
if(last>=max_buf_stack)max_buf_stack= last+1;
while((last> first)&&(buffer[last-1]==' '))decr(last);
free_node(p,sz);
return true;
}
}

/*:1328*//*1329:*/
#line 25596 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void pseudo_close(void)
{pointer p,q;
p= link(pseudo_files);q= info(pseudo_files);
free_avail(pseudo_files);pseudo_files= p;
while(q!=null)
{p= q;q= link(p);free_node(p,ho(info(p)));
}
}

/*:1329*//*1346:*/
#line 25772 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void group_warning(void)
{int i;
bool w;
base_ptr= input_ptr;input_stack[base_ptr]= cur_input;

i= in_open;w= false;
while((grp_stack[i]==cur_boundary)&&(i> 0))
{/*1347:*/
#line 25795 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(tracing_nesting> 0)
{while((input_stack[base_ptr].state_field==token_list)||
(input_stack[base_ptr].index_field> i))decr(base_ptr);
if(input_stack[base_ptr].name_field> 17)w= true;
}

/*:1347*/
#line 25780 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
grp_stack[i]= save_index(save_ptr);decr(i);
}
if(w)
{print_nl("Warning: end of ");print_group(true);

print(" of a different file");print_ln();
if(tracing_nesting> 1)show_context();
if(history==spotless)history= warning_issued;
}
}

/*:1346*//*1348:*/
#line 25807 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void if_warning(void)
{int i;
bool w;
base_ptr= input_ptr;input_stack[base_ptr]= cur_input;

i= in_open;w= false;
while(if_stack[i]==cond_ptr)
{/*1347:*/
#line 25795 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(tracing_nesting> 0)
{while((input_stack[base_ptr].state_field==token_list)||
(input_stack[base_ptr].index_field> i))decr(base_ptr);
if(input_stack[base_ptr].name_field> 17)w= true;
}

/*:1347*/
#line 25815 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if_stack[i]= link(cond_ptr);decr(i);
}
if(w)
{print_nl("Warning: end of ");print_cmd_chr(if_test,cur_if);

print_if_line(if_line);print(" of a different file");print_ln();
if(tracing_nesting> 1)show_context();
if(history==spotless)history= warning_issued;
}
}

/*:1348*//*1349:*/
#line 25831 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void file_warning(void)
{pointer p;
quarterword l;
quarterword c;
int i;
p= save_ptr;l= cur_level;c= cur_group;save_ptr= cur_boundary;
while(grp_stack[in_open]!=save_ptr)
{decr(cur_level);
print_nl("Warning: end of file when ");

print_group(true);print(" is incomplete");
cur_group= save_level(save_ptr);save_ptr= save_index(save_ptr);
}
save_ptr= p;cur_level= l;cur_group= c;
p= cond_ptr;l= if_limit;c= cur_if;i= if_line;
while(if_stack[in_open]!=cond_ptr)
{print_nl("Warning: end of file when ");

print_cmd_chr(if_test,cur_if);
if(if_limit==fi_code)print_esc("else");
print_if_line(if_line);print(" is incomplete");
if_line= if_line_field(cond_ptr);cur_if= subtype(cond_ptr);
if_limit= type(cond_ptr);cond_ptr= link(cond_ptr);
}
cond_ptr= p;if_limit= l;cur_if= c;if_line= i;
print_ln();
if(tracing_nesting> 1)show_context();
if(history==spotless)history= warning_issued;
}

/*:1349*//*1393:*/
#line 26616 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void delete_sa_ref(pointer q)
{
pointer p;
small_number i;
small_number s;
decr(sa_ref(q));
if(sa_ref(q)!=null)return;
if(sa_index(q)<dimen_val_limit)
if(sa_int(q)==0)s= word_node_size;
else return;
else{if(sa_index(q)<mu_val_limit)
if(sa_ptr(q)==zero_glue)delete_glue_ref(zero_glue);
else return;
else if(sa_ptr(q)!=null)return;
s= pointer_node_size;
}
do{i= hex_dig4(sa_index(q));p= q;q= link(p);free_node(p,s);
if(q==null)
{sa_root[i]= null;return;
}
delete_sa_ptr;s= index_node_size;
}while(!(sa_used(q)> 0));
}

/*:1393*//*1395:*/
#line 26659 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef STAT
static void show_sa(pointer p,char*s)
{small_number t;
begin_diagnostic();print_char('{');print(s);print_char(' ');
if(p==null)print_char('?');
else{t= sa_type(p);
if(t<box_val)print_cmd_chr(internal_register,p);
else if(t==box_val)
{print_esc("box");print_sa_num(p);
}
else if(t==tok_val)print_cmd_chr(toks_register,p);
else print_char('?');
print_char('=');
if(t==int_val)print_int(sa_int(p));
else if(t==dimen_val)
{print_scaled(sa_dim(p));print("pt");
}
else{p= sa_ptr(p);
if(t==glue_val)print_spec(p,"pt");
else if(t==mu_val)print_spec(p,"mu");
else if(t==box_val)
if(p==null)print("void");
else{depth_threshold= 0;breadth_max= 1;show_node_list(p);
}
else if(t==tok_val)
{if(p!=null)show_token_list(link(p),null,32);
}
else print_char('?');
}
}
print_char('}');end_diagnostic(false);
}
#endif
#line 26693 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1395*//*1408:*/
#line 26867 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void sa_save(pointer p)
{pointer q;
quarterword i;
if(cur_level!=sa_level)
{check_full_save_stack;save_type(save_ptr)= restore_sa;
save_level(save_ptr)= sa_level;save_index(save_ptr)= sa_chain;
incr(save_ptr);sa_chain= null;sa_level= cur_level;
}
i= sa_index(p);
if(i<dimen_val_limit)
{if(sa_int(p)==0)
{q= get_node(pointer_node_size);i= tok_val_limit;
}
else{q= get_node(word_node_size);sa_int(q)= sa_int(p);
}
sa_ptr(q)= null;
}
else{q= get_node(pointer_node_size);sa_ptr(q)= sa_ptr(p);
}
sa_loc(q)= p;sa_index(q)= i;sa_lev(q)= sa_lev(p);
link(q)= sa_chain;sa_chain= q;add_sa_ref(p);
}

/*:1408*//*1409:*/
#line 26891 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void sa_destroy(pointer p)
{if(sa_index(p)<mu_val_limit)delete_glue_ref(sa_ptr(p));
else if(sa_ptr(p)!=null)
if(sa_index(p)<box_val_limit)flush_node_list(sa_ptr(p));
else delete_token_ref(sa_ptr(p));
}

/*:1409*//*1410:*/
#line 26917 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void sa_def(pointer p,halfword e)

{add_sa_ref(p);
if(sa_ptr(p)==e)
{
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"reassigning");
#endif
#line 26926 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

sa_destroy(p);
}
else{
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"changing");
#endif
#line 26933 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(sa_lev(p)==cur_level)sa_destroy(p);else sa_save(p);
sa_lev(p)= cur_level;sa_ptr(p)= e;
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"into");
#endif
#line 26939 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
delete_sa_ref(p);
}

static void sa_w_def(pointer p,int w)
{add_sa_ref(p);
if(sa_int(p)==w)
{
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"reassigning");
#endif
#line 26951 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else{
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"changing");
#endif
#line 26957 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(sa_lev(p)!=cur_level)sa_save(p);
sa_lev(p)= cur_level;sa_int(p)= w;
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"into");
#endif
#line 26963 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
delete_sa_ref(p);
}

/*:1410*//*1411:*/
#line 26973 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void gsa_def(pointer p,halfword e)
{add_sa_ref(p);
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"globally changing");
#endif
#line 26979 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

sa_destroy(p);sa_lev(p)= level_one;sa_ptr(p)= e;
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"into");
#endif
#line 26984 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

delete_sa_ref(p);
}

static void gsa_w_def(pointer p,int w)
{add_sa_ref(p);
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"globally changing");
#endif
#line 26993 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

sa_lev(p)= level_one;sa_int(p)= w;
#ifdef STAT
if(tracing_assigns> 0)show_sa(p,"into");
#endif
#line 26998 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

delete_sa_ref(p);
}

/*:1411*//*1412:*/
#line 27005 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void sa_restore(void)
{pointer p;
do{p= sa_loc(sa_chain);
if(sa_lev(p)==level_one)
{if(sa_index(p)>=dimen_val_limit)sa_destroy(sa_chain);
#ifdef STAT
if(tracing_restores> 0)show_sa(p,"retaining");
#endif
#line 27014 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else{if(sa_index(p)<dimen_val_limit)
if(sa_index(sa_chain)<dimen_val_limit)sa_int(p)= sa_int(sa_chain);
else sa_int(p)= 0;
else{sa_destroy(p);sa_ptr(p)= sa_ptr(sa_chain);
}
sa_lev(p)= sa_lev(sa_chain);
#ifdef STAT
if(tracing_restores> 0)show_sa(p,"restoring");
#endif
#line 27025 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
delete_sa_ref(p);
p= sa_chain;sa_chain= link(p);
if(sa_index(p)<dimen_val_limit)free_node(p,word_node_size);
else free_node(p,pointer_node_size);
}while(!(sa_chain==null));
}

/*:1412*/
#line 5997 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:263*//*269:*/
#line 6091 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void new_save_level(group_code c)
{check_full_save_stack;
if(eTeX_ex)
{saved(0)= line;incr(save_ptr);
}
save_type(save_ptr)= level_boundary;save_level(save_ptr)= cur_group;
save_index(save_ptr)= cur_boundary;
if(cur_level==max_quarterword)overflow("grouping levels",

max_quarterword-min_quarterword);

cur_boundary= save_ptr;cur_group= c;
#ifdef STAT
if(tracing_groups> 0)group_trace(false);
#endif
#line 6106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

incr(cur_level);incr(save_ptr);
}

/*:269*//*270:*/
#line 6116 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void eq_destroy(memory_word w)
{pointer q;
switch(eq_type_field(w)){
case call:case long_call:case outer_call:
case long_outer_call:delete_token_ref(equiv_field(w));break;
case glue_ref:delete_glue_ref(equiv_field(w));break;
case shape_ref:{q= equiv_field(w);
if(q!=null)free_node(q,info(q)+info(q)+1);
}break;
case box_ref:flush_node_list(equiv_field(w));break;
/*1405:*/
#line 26842 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case toks_register:case internal_register:
if((equiv_field(w)<mem_bot)||(equiv_field(w)> lo_mem_stat_max))
delete_sa_ref(equiv_field(w));break;

/*:1405*/
#line 6126 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:do_nothing;
}
}

/*:270*//*271:*/
#line 6134 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void eq_save(pointer p,quarterword l)
{check_full_save_stack;
if(l==level_zero)save_type(save_ptr)= restore_zero;
else{save_stack[save_ptr]= eqtb[p];
if(p>=dimen_base)
{save_hfactor[save_ptr]= hfactor_eqtb[p];
save_vfactor[save_ptr]= vfactor_eqtb[p];
}
else if(p==par_shape_loc)
{save_hfactor[save_ptr].i= par_shape_hfactor;
save_vfactor[save_ptr].i= par_shape_vfactor;
}
incr(save_ptr);
save_type(save_ptr)= restore_old_value;
}
save_level(save_ptr)= l;save_index(save_ptr)= p;incr(save_ptr);
}

/*:271*//*272:*/
#line 6160 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef STAT
#define  assign_trace(A, B) if (tracing_assigns >  0) restore_trace(A, B);
#else
#line 6164 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
#define  assign_trace(A, B)
#endif
#line 6166 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void eq_define(pointer p,quarterword t,halfword e)

{
if(eTeX_ex&&(eq_type(p)==t)&&(equiv(p)==e))
{assign_trace(p,"reassigning")
eq_destroy(eqtb[p]);return;
}
assign_trace(p,"changing")
if(eq_level(p)==cur_level)eq_destroy(eqtb[p]);
else if(cur_level> level_one)eq_save(p,eq_level(p));
eq_level(p)= cur_level;eq_type(p)= t;equiv(p)= e;
if(p==par_shape_loc)
{par_shape_hfactor= cur_hfactor;
par_shape_vfactor= cur_vfactor;
}
assign_trace(p,"into")
}

/*:272*//*273:*/
#line 6189 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void eq_word_define(pointer p,int w)
{
assign_trace(p,"changing")
if(cur_level==level_one)
{if(p==dimen_base+hsize_code)
{hhsize= w+round(((double)cur_hfactor*hhsize+(double)cur_vfactor*hvsize)/unity);return;}
if(p==dimen_base+vsize_code)
{hvsize= w+round(((double)cur_hfactor*hhsize+(double)cur_vfactor*hvsize)/unity);return;}
}
if(xeq_level[p]!=cur_level)
{eq_save(p,xeq_level[p]);xeq_level[p]= cur_level;
}
eqtb[p].i= w;
if(p>=dimen_base)
{hfactor_eqtb[p].i= cur_hfactor;
vfactor_eqtb[p].i= cur_vfactor;
}
assign_trace(p,"into")
}

/*:273*//*274:*/
#line 6214 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void geq_define(pointer p,quarterword t,halfword e)

{assign_trace(p,"globally changing")
{eq_destroy(eqtb[p]);
eq_level(p)= level_one;eq_type(p)= t;equiv(p)= e;
}
assign_trace(p,"into");
}

static void geq_word_define(pointer p,int w)
{assign_trace(p,"globally changing")
{xeq_level[p]= level_one;
if(p==dimen_base+hsize_code)
hhsize= w+round(((double)cur_hfactor*hhsize+(double)cur_vfactor*hvsize)/unity);
else if(p==dimen_base+vsize_code)
hvsize= w+round(((double)cur_hfactor*hhsize+(double)cur_vfactor*hvsize)/unity);
else
{eqtb[p].i= w;
if(p>=dimen_base)
{hfactor_eqtb[p].i= cur_hfactor;
vfactor_eqtb[p].i= cur_vfactor;
}
}
}
assign_trace(p,"into");
}

/*:274*//*275:*/
#line 6243 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void save_for_after(halfword t)
{if(cur_level> level_one)
{check_full_save_stack;
save_type(save_ptr)= insert_token;save_level(save_ptr)= level_zero;
save_index(save_ptr)= t;incr(save_ptr);
}
}

/*:275*//*276:*/
#line 6255 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void back_input(void);
static void unsave(void)
{
pointer p;
quarterword l;
halfword t;
bool a;
a= false;
if(cur_level> level_one)
{decr(cur_level);
/*277:*/
#line 6272 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

loop{decr(save_ptr);
if(save_type(save_ptr)==level_boundary)goto done;
p= save_index(save_ptr);
if(save_type(save_ptr)==insert_token)
/*321:*/
#line 7335 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{t= cur_tok;cur_tok= p;
if(a)
{p= get_avail();info(p)= cur_tok;link(p)= loc;loc= p;start= p;
if(cur_tok<right_brace_limit)
if(cur_tok<left_brace_limit)decr(align_state);
else incr(align_state);
}
else{back_input();a= eTeX_ex;
}
cur_tok= t;
}

/*:321*/
#line 6277 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(save_type(save_ptr)==restore_sa)
{sa_restore();sa_chain= p;sa_level= save_level(save_ptr);
}
else if(save_type(save_ptr)==restore_utf_none)
{utf_unsave_list= save_level(save_ptr);decr(save_ptr);}
else if(save_type(save_ptr)==restore_utf)utf_unsave(p);
else{if(save_type(save_ptr)==restore_old_value)
{l= save_level(save_ptr);decr(save_ptr);
}
else save_stack[save_ptr]= eqtb[undefined_control_sequence];
/*278:*/
#line 6307 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(p<int_base)
if(eq_level(p)==level_one)
{eq_destroy(save_stack[save_ptr]);
#ifdef STAT
if(tracing_restores> 0)restore_trace(p,"retaining");
#endif
#line 6314 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else{eq_destroy(eqtb[p]);
eqtb[p]= save_stack[save_ptr];
if(p==par_shape_loc)
{par_shape_hfactor= save_hfactor[save_ptr].i;
par_shape_vfactor= save_vfactor[save_ptr].i;
}
#ifdef STAT
if(tracing_restores> 0)restore_trace(p,"restoring");
#endif
#line 6325 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else if(xeq_level[p]!=level_one)
{eqtb[p]= save_stack[save_ptr];
if(p>=dimen_base)
{hfactor_eqtb[p]= save_hfactor[save_ptr];
vfactor_eqtb[p]= save_vfactor[save_ptr];
}
xeq_level[p]= l;
#ifdef STAT
if(tracing_restores> 0)restore_trace(p,"restoring");
#endif
#line 6337 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else{
#ifdef STAT
if(tracing_restores> 0)restore_trace(p,"retaining");
#endif
#line 6343 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:278*/
#line 6288 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}
done:
#ifdef STAT
if(tracing_groups> 0)group_trace(true);
#endif
#line 6295 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(grp_stack[in_open]==cur_boundary)group_warning();

cur_group= save_level(save_ptr);cur_boundary= save_index(save_ptr);
if(eTeX_ex)decr(save_ptr)

/*:277*/
#line 6266 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
else confusion("curlevel");

}

/*:276*//*283:*/
#line 6385 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void prepare_mag(void)
{if((mag_set> 0)&&(mag!=mag_set))
{print_err("Incompatible magnification (");print_int(mag);

print(");");print_nl(" the previous value will be retained");
help2("I can handle only one magnification ratio per job. So I've",
"reverted to the magnification you used earlier on this run.");
int_error(mag_set);
geq_word_define(int_base+mag_code,mag_set);
}
if((mag<=0)||(mag> 32768))
{print_err("Illegal magnification has been changed to 1000");

help1("The magnification ratio must be between 1 and 32768.");
int_error(mag);geq_word_define(int_base+mag_code,1000);
}
mag_set= mag;
}

/*:283*//*290:*/
#line 6577 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void token_show(pointer p)
{if(p!=null)show_token_list(link(p),null,10000000);
}

/*:290*//*291:*/
#line 6584 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_meaning(void)
{print_cmd_chr(cur_cmd,cur_chr);
if(cur_cmd>=call)
{print_char(':');print_ln();token_show(cur_chr);
}
else if((cur_cmd==top_bot_mark)&&(cur_chr<marks_code))
{print_char(':');print_ln();
token_show(cur_mark[cur_chr]);
}
}

/*:291*//*294:*/
#line 6683 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void show_cur_cmd_chr(void)
{int n;
int l;
pointer p;
begin_diagnostic();print_nl("{");
if(mode!=shown_mode)
{print_mode(mode);print(": ");shown_mode= mode;
}
print_cmd_chr(cur_cmd,cur_chr);
if(tracing_ifs> 0)
if(cur_cmd>=if_test)if(cur_cmd<=fi_or_else)
{print(": ");
if(cur_cmd==fi_or_else)
{print_cmd_chr(if_test,cur_if);print_char(' ');
n= 0;l= if_line;
}
else{n= 1;l= line;
}
p= cond_ptr;
while(p!=null)
{incr(n);p= link(p);
}
print("(level ");print_int(n);print_char(')');print_if_line(l);
}
print_char('}');
end_diagnostic(false);
}

/*:294*//*306:*/
#line 7062 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void show_context(void)
{
int old_setting;
int nn;
bool bottom_line;
/*310:*/
#line 7177 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

int i;
int j;
int l;
int m;
int n;
int p;
int q;

/*:310*/
#line 7067 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

base_ptr= input_ptr;input_stack[base_ptr]= cur_input;

nn= -1;bottom_line= false;
loop{cur_input= input_stack[base_ptr];
if((state!=token_list))
if((name> 19)||(base_ptr==0))bottom_line= true;
if((base_ptr==input_ptr)||bottom_line||(nn<error_context_lines))
/*307:*/
#line 7085 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((base_ptr==input_ptr)||(state!=token_list)||
(token_type!=backed_up)||(loc!=null))

{tally= 0;
old_setting= selector;
if(state!=token_list)
{/*308:*/
#line 7109 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(name<=17)
if(terminal_input)
if(base_ptr==0)print_nl("<*>");else print_nl("<insert> ");
else{print_nl("<read ");
if(name==17)print_char('*');else print_int(name-1);

print_char('>');
}
else{print_nl("l.");
if(index==in_open)print_int(line);
else print_int(line_stack[index+1]);
}
print_char(' ')

/*:308*/
#line 7092 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*313:*/
#line 7223 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

begin_pseudoprint;
if(buffer[limit]==end_line_char)j= limit;
else j= limit+1;
if(j> 0)for(i= start;i<=j-1;i++)
{if(i==loc)set_trick_count;
printn(buffer[i]);
}

/*:313*/
#line 7093 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
else{/*309:*/
#line 7124 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(token_type){
case parameter:print_nl("<argument> ");break;
case u_template:case v_template:print_nl("<template> ");break;
case backed_up:if(loc==null)print_nl("<recently read> ");
else print_nl("<to be read again> ");break;
case inserted:print_nl("<inserted text> ");break;
case macro:{print_ln();print_cs(name);
}break;
case output_text:print_nl("<output> ");break;
case every_par_text:print_nl("<everypar> ");break;
case every_math_text:print_nl("<everymath> ");break;
case every_display_text:print_nl("<everydisplay> ");break;
case every_hbox_text:print_nl("<everyhbox> ");break;
case every_vbox_text:print_nl("<everyvbox> ");break;
case every_job_text:print_nl("<everyjob> ");break;
case every_cr_text:print_nl("<everycr> ");break;
case mark_text:print_nl("<mark> ");break;
case every_eof_text:print_nl("<everyeof> ");break;
case write_text:print_nl("<write> ");break;
default:print_nl("?");
}

/*:309*/
#line 7095 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*314:*/
#line 7232 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

begin_pseudoprint;
if(token_type<macro)show_token_list(start,loc,100000);
else show_token_list(link(start),loc,100000)

/*:314*/
#line 7096 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
selector= old_setting;
/*312:*/
#line 7201 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(trick_count==1000000)set_trick_count;

if(tally<trick_count)m= tally-first_count;
else m= trick_count-first_count;
if(l+first_count<=half_error_line)
{p= 0;n= l+first_count;
}
else{print("...");p= l+first_count-half_error_line+3;
n= half_error_line;
}
for(q= p;q<=first_count-1;q++)print_char(trick_buf[q%error_line]);
print_ln();
for(q= 1;q<=n;q++)print_char(' ');
if(m+n<=error_line)p= first_count+m;else p= first_count+(error_line-n-3);
for(q= first_count;q<=p-1;q++)print_char(trick_buf[q%error_line]);
if(m+n> error_line)print("...")

/*:312*/
#line 7099 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
incr(nn);
}
}

/*:307*/
#line 7075 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(nn==error_context_lines)
{print_nl("...");incr(nn);
}
if(bottom_line)goto done;
decr(base_ptr);
}
done:cur_input= input_stack[input_ptr];
}

/*:306*//*318:*/
#line 7271 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void begin_token_list(pointer p,quarterword t)
{push_input;state= token_list;start= p;token_type= t;
if(t>=macro)
{add_token_ref(p);
if(t==macro)param_start= param_ptr;
else{loc= link(p);
if(tracing_macros> 1)
{begin_diagnostic();print_nl("");
switch(t){
case mark_text:print_esc("mark");break;
case write_text:print_esc("write");break;
default:print_cmd_chr(assign_toks,t-output_text+output_routine_loc);
}
print("->");token_show(p);end_diagnostic(false);
}
}
}
else loc= p;
}

/*:318*//*319:*/
#line 7296 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void end_token_list(void)
{if(token_type>=backed_up)
{if(token_type<=inserted)flush_list(start);
else{delete_token_ref(start);
if(token_type==macro)
while(param_ptr> param_start)
{decr(param_ptr);
flush_list(param_stack[param_ptr]);
}
}
}
else if(token_type==u_template)
if(align_state> 500000)align_state= 0;
else fatal_error("(interwoven alignment preambles are not allowed)");

pop_input;
check_interrupt;
}

/*:319*//*320:*/
#line 7323 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void back_input(void)
{pointer p;
while((state==token_list)&&(loc==null)&&(token_type!=v_template))
end_token_list();
p= get_avail();info(p)= cur_tok;
if(cur_tok<right_brace_limit)
if(cur_tok<left_brace_limit)decr(align_state);
else incr(align_state);
push_input;state= token_list;start= p;token_type= backed_up;
loc= p;
}

/*:320*//*322:*/
#line 7353 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void back_error(void)
{OK_to_interrupt= false;back_input();OK_to_interrupt= true;error();
}

static void ins_error(void)
{OK_to_interrupt= false;back_input();token_type= inserted;
OK_to_interrupt= true;error();
}

/*:322*//*323:*/
#line 7368 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void begin_file_reading(void)
{if(in_open==max_in_open)overflow("text input levels",max_in_open);

if(first==buf_size)overflow("buffer size",buf_size);

incr(in_open);push_input;index= in_open;
source_filename_stack[index]= NULL;
full_source_filename_stack[index]= NULL;
eof_seen[index]= false;
grp_stack[index]= cur_boundary;if_stack[index]= cond_ptr;
line_stack[index]= line;start= first;state= mid_line;
name= 0;
}

/*:323*//*324:*/
#line 7385 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void end_file_reading(void)
{first= start;line= line_stack[index];
if((name==18)||(name==19))pseudo_close();else
if(name> 17)a_close(&cur_file);
if(full_source_filename_stack[in_open]!=NULL)
{free(full_source_filename_stack[in_open]);
full_source_filename_stack[in_open]= NULL;
}
pop_input;decr(in_open);
}

/*:324*//*325:*/
#line 7400 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void clear_for_error_prompt(void)
{while((state!=token_list)&&terminal_input&&
(input_ptr> 0)&&(loc> limit))end_file_reading();
print_ln();clear_terminal;
}

/*:325*//*331:*/
#line 7474 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void check_outer_validity(void)
{pointer p;
pointer q;
if(scanner_status!=normal)
{deletions_allowed= false;
/*332:*/
#line 7500 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_cs!=0)
{if((state==token_list)||(name<1)||(name> 17))
{p= get_avail();info(p)= cs_token_flag+cur_cs;
back_list(p);
}
cur_cmd= spacer;cur_chr= ' ';
}

/*:332*/
#line 7479 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(scanner_status> skipping)
/*333:*/
#line 7509 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{runaway();
if(cur_cs==0)print_err("File ended");

else{cur_cs= 0;print_err("Forbidden control sequence found");

}
print(" while scanning ");
/*334:*/
#line 7535 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= get_avail();
switch(scanner_status){
case defining:{print("definition");info(p)= right_brace_token+'}';
}break;
case matching:{print("use");info(p)= par_token;long_state= outer_call;
}break;
case aligning:{print("preamble");info(p)= right_brace_token+'}';q= p;
p= get_avail();link(p)= q;info(p)= cs_token_flag+frozen_cr;
align_state= -1000000;
}break;
case absorbing:{print("text");info(p)= right_brace_token+'}';
}
}
ins_list(p)

/*:334*/
#line 7518 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
print(" of ");sprint_cs(warning_index);
help4("I suspect you have forgotten a `}', causing me",
"to read past where you wanted me to stop.",
"I'll try to recover; but if the error is serious,",
"you'd better type `E' or `X' now and fix your file.");
error();
}

/*:333*/
#line 7481 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{print_err("Incomplete ");print_cmd_chr(if_test,cur_if);

print("; all text was ignored after line ");print_int(skip_line);
help3("A forbidden control sequence occurred in skipped text.",
"This kind of error happens when you say `\\if...' and forget",
"the matching `\\fi'. I've inserted a `\\fi'; this might work.");
if(cur_cs!=0)cur_cs= 0;
else help_line[2]= 
"The file ended while I was skipping conditional text.";
cur_tok= cs_token_flag+frozen_fi;ins_error();
}
deletions_allowed= true;
}
}

/*:331*//*335:*/
#line 7553 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void firm_up_the_line(void);

/*:335*//*336:*/
#line 7559 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void get_next(void)
{





int k;
halfword t;
int cat;
UTF8_code c,cc;
int d;
restart:cur_cs= 0;
if(state!=token_list)
/*338:*/
#line 7589 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


{get_cur_chr:if(loc<=limit)
{
loc= utf8_get_cur_chr(buffer,loc,limit);
reswitch:cur_cmd= cat_code(cur_chr);
/*339:*/
#line 7616 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(state+cur_cmd){
/*340:*/
#line 7630 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_state_plus(ignore):case skip_blanks+spacer:
case new_line+spacer

/*:340*/
#line 7618 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
:goto get_cur_chr;
any_state_plus(escape):/*349:*/
#line 7753 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(loc> limit)cur_cs= null_cs;
else{start_cs:k= loc;k= utf8_get_cur_chr(buffer,k,limit);
cat= cat_code(cur_chr);
if(cat==letter)state= skip_blanks;
else if(cat==spacer)state= skip_blanks;
else state= mid_line;
if((cat==letter)&&(k<=limit))
/*351:*/
#line 7808 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int j;
do{j= k;k= utf8_get_cur_chr(buffer,k,limit);
cat= cat_code(cur_chr);
}while(!((cat!=letter)||(k> limit)));
/*350:*/
#line 7783 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cat==sup_mark&&buffer[k]==cur_chr&&k<limit)
{c= buffer[k+1];if(c<0200)
{d= 2;
if(is_hex(c))if(k+2<=limit)
{cc= buffer[k+2];if(is_hex(cc))incr(d);
}
if(d> 2)
{hex_to_cur_chr;
if(cur_chr<0x80)buffer[k-1]= cur_chr;
else
{buffer[k-1]= 0xC0|(cur_chr>>6);buffer[k]= 0x80|(cur_chr&0x3F);decr(d);incr(k);
}
}
else if(c<0100)buffer[k-1]= c+0100;
else buffer[k-1]= c-0100;
limit= limit-d;first= first-d;
while(k<=limit)
{buffer[k]= buffer[k+d];incr(k);
}
goto start_cs;
}
}
}

/*:350*/
#line 7813 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cat!=letter)k= j;

if(k> loc+1)
{cur_cs= id_lookup(loc,k-loc);loc= k;goto found;
}
}

/*:351*/
#line 7763 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*350:*/
#line 7783 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cat==sup_mark&&buffer[k]==cur_chr&&k<limit)
{c= buffer[k+1];if(c<0200)
{d= 2;
if(is_hex(c))if(k+2<=limit)
{cc= buffer[k+2];if(is_hex(cc))incr(d);
}
if(d> 2)
{hex_to_cur_chr;
if(cur_chr<0x80)buffer[k-1]= cur_chr;
else
{buffer[k-1]= 0xC0|(cur_chr>>6);buffer[k]= 0x80|(cur_chr&0x3F);decr(d);incr(k);
}
}
else if(c<0100)buffer[k-1]= c+0100;
else buffer[k-1]= c-0100;
limit= limit-d;first= first-d;
while(k<=limit)
{buffer[k]= buffer[k+d];incr(k);
}
goto start_cs;
}
}
}

/*:350*/
#line 7764 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;

k= utf8_get_cur_chr(buffer,loc,limit);
if(cur_chr<utf8_single_size)
{cur_cs= single_base+cur_chr;loc= k;}
else
{cur_cs= id_lookup(loc,k-loc);loc= k;}
}
found:cur_cmd= eq_type(cur_cs);cur_chr= equiv(cur_cs);
if(cur_cmd>=outer_call)check_outer_validity();
}

/*:349*/
#line 7620 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
any_state_plus(active_char):/*348:*/
#line 7729 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_chr<utf8_single_size)
cur_cs= cur_chr+active_base;
else
cur_cs= active_lookup(cur_chr);
cur_cmd= eq_type(cur_cs);cur_chr= equiv(cur_cs);state= mid_line;
if(cur_cmd>=outer_call)check_outer_validity();
}

/*:348*/
#line 7622 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
any_state_plus(sup_mark):/*347:*/
#line 7701 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_chr==buffer[loc])if(loc<limit)
{c= buffer[loc+1];if(c<0200)
{loc= loc+2;
if(is_hex(c))if(loc<=limit)
{cc= buffer[loc];if(is_hex(cc))
{incr(loc);hex_to_cur_chr;goto reswitch;
}
}
if(c<0100)cur_chr= c+0100;else cur_chr= c-0100;
goto reswitch;
}
}
state= mid_line;
}

/*:347*/
#line 7624 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
any_state_plus(invalid_char):/*341:*/
#line 7638 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Text line contains an invalid character");

help2("A funny symbol that I can't read has just been input.",
"Continue, and I'll forget that it ever happened.");
deletions_allowed= false;error();deletions_allowed= true;
goto restart;
}

/*:341*/
#line 7625 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*342:*/
#line 7650 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mid_line+spacer:/*344:*/
#line 7679 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{state= skip_blanks;cur_chr= ' ';
}

/*:344*/
#line 7651 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case mid_line+car_ret:/*343:*/
#line 7673 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{loc= limit+1;cur_cmd= spacer;cur_chr= ' ';
}

/*:343*/
#line 7652 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case skip_blanks+car_ret:any_state_plus(comment):
/*345:*/
#line 7683 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{loc= limit+1;goto get_cur_chr;
}

/*:345*/
#line 7654 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case new_line+car_ret:/*346:*/
#line 7687 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{loc= limit+1;cur_cs= par_loc;cur_cmd= eq_type(cur_cs);
cur_chr= equiv(cur_cs);
if(cur_cmd>=outer_call)check_outer_validity();
}

/*:346*/
#line 7655 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case mid_line+left_brace:incr(align_state);break;
case skip_blanks+left_brace:case new_line+left_brace:{
state= mid_line;incr(align_state);
}break;
case mid_line+right_brace:decr(align_state);break;
case skip_blanks+right_brace:case new_line+right_brace:{
state= mid_line;decr(align_state);
}break;
add_delims_to(case skip_blanks):add_delims_to(
case new_line):state= mid_line;break;

/*:342*/
#line 7626 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:do_nothing;
}

/*:339*/
#line 7597 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
else{state= new_line;
/*355:*/
#line 7873 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(name> 17)/*357:*/
#line 7910 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{incr(line);first= start;
if(!force_eof)
if(name<=19)
{if(pseudo_input())
firm_up_the_line();
else if((every_eof!=null)&&!eof_seen[index])
{limit= first-1;eof_seen[index]= true;
begin_token_list(every_eof,every_eof_text);goto restart;
}
else force_eof= true;
}
else
{if(input_ln(&cur_file,true))
firm_up_the_line();
else if((every_eof!=null)&&!eof_seen[index])
{limit= first-1;eof_seen[index]= true;
begin_token_list(every_eof,every_eof_text);goto restart;
}
else force_eof= true;
}
if(force_eof)
{if(tracing_nesting> 0)
if((grp_stack[in_open]!=cur_boundary)||
(if_stack[in_open]!=cond_ptr))file_warning();

if(name>=19)
{print_char(')');decr(open_parens);
update_terminal;
}
force_eof= false;
end_file_reading();
check_outer_validity();goto restart;
}
if(end_line_char_inactive)decr(limit);
else buffer[limit]= end_line_char;
first= limit+1;loc= start;
}

/*:357*/
#line 7875 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{if(!terminal_input)
{cur_cmd= 0;cur_chr= 0;return;
}
if(input_ptr> 0)
{end_file_reading();goto restart;
}
if(selector<log_only)open_log_file();
if(interaction> nonstop_mode)
{if(end_line_char_inactive)incr(limit);
if(limit==start)
print_nl("(Please type a command or say `\\end')");

print_ln();first= start;
prompt_input("*");

limit= last;
if(end_line_char_inactive)decr(limit);
else buffer[limit]= end_line_char;
first= limit+1;
loc= start;
}
else fatal_error("*** (job aborted, no legal \\end found)");



}

/*:355*/
#line 7601 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
check_interrupt;
goto get_cur_chr;
}
}

/*:338*/
#line 7573 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*352:*/
#line 7824 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(loc!=null)

{t= info(loc);loc= link(loc);
if(t>=cs_token_flag)
{cur_cs= t-cs_token_flag;
cur_cmd= eq_type(cur_cs);cur_chr= equiv(cur_cs);
if(cur_cmd>=outer_call)
if(cur_cmd==dont_expand)
/*353:*/
#line 7855 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{cur_cs= info(loc)-cs_token_flag;loc= null;
cur_cmd= eq_type(cur_cs);cur_chr= equiv(cur_cs);
if(cur_cmd> max_command)
{cur_cmd= relax;cur_chr= no_expand_flag;
}
}

/*:353*/
#line 7833 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else check_outer_validity();
}
else{cur_cmd= t/cmd_factor;cur_chr= t%cmd_factor;
switch(cur_cmd){
case left_brace:incr(align_state);break;
case right_brace:decr(align_state);break;
case out_param:/*354:*/
#line 7863 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{begin_token_list(param_stack[param_start+cur_chr-1],parameter);
goto restart;
}

/*:354*/
#line 7840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:do_nothing;
}
}
}
else{
end_token_list();goto restart;
}

/*:352*/
#line 7575 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*337:*/
#line 7585 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_cmd<=car_ret)if(cur_cmd>=tab_mark)if(align_state==0)
/*720:*/
#line 14838 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((scanner_status==aligning)||(cur_align==null))
fatal_error("(interwoven alignment preambles are not allowed)");

cur_cmd= extra_info(cur_align);extra_info(cur_align)= cur_chr;
if(cur_cmd==omit)begin_token_list(omit_template,v_template);
else begin_token_list(v_part(cur_align),v_template);
align_state= 1000000;goto restart;
}

/*:720*/
#line 7587 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:337*/
#line 7576 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:336*//*358:*/
#line 7956 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void firm_up_the_line(void)
{int k;
limit= last;
if(pausing> 0)if(interaction> nonstop_mode)
{wake_up_terminal;print_ln();
if(start<limit)for(k= start;k<=limit-1;k++)printn(buffer[k]);
first= limit;prompt_input("=>");

if(last> first)
{for(k= first;k<=last-1;k++)
buffer[k+start-first]= buffer[k];
limit= start+last-first;
}
}
}

/*:358*//*360:*/
#line 7995 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void get_token(void)
{no_new_control_sequence= false;get_next();no_new_control_sequence= true;

if(cur_cs==0)cur_tok= cmd_token(cur_cmd)+cur_chr;
else cur_tok= cs_token_flag+cur_cs;
}

/*:360*//*361:*/
#line 8021 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*384:*/
#line 8338 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void macro_call(void)
{
pointer r;
pointer p;
pointer q;
pointer s;
pointer t;
pointer u,v;
pointer rbrace_ptr;
small_number n;
halfword unbalance;
int m;
pointer ref_count;
small_number save_scanner_status;
pointer save_warning_index;
UTF8_code match_chr;
save_scanner_status= scanner_status;save_warning_index= warning_index;
warning_index= cur_cs;ref_count= cur_chr;r= link(ref_count);n= 0;
if(tracing_macros> 0)/*396:*/
#line 8564 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{begin_diagnostic();
if(tracing_stack_levels> 0)
{if(input_ptr<tracing_stack_levels)
{
int v= input_ptr;
print_ln();print_char('~');
while(v--> 0)print_char('.');
print_cs(warning_index);token_show(ref_count);
}
else{print_char('~');print_char('~');print_cs(warning_index);}
}
else{print_ln();print_cs(warning_index);token_show(ref_count);}
end_diagnostic(false);
}

/*:396*/
#line 8357 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(info(r)==protected_token)r= link(r);
if(info(r)!=end_match_token)
/*386:*/
#line 8395 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scanner_status= matching;unbalance= 0;
long_state= eq_type(cur_cs);
if(long_state>=outer_call)long_state= long_state-2;
do{link(temp_head)= null;
if((info(r)> match_token+255)||(info(r)<match_token))s= null;
else{match_chr= info(r)-match_token;s= link(r);r= s;
p= temp_head;m= 0;
}
/*387:*/
#line 8415 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

resume:get_token();
if(cur_tok==info(r))
/*389:*/
#line 8447 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{r= link(r);
if((info(r)>=match_token)&&(info(r)<=end_match_token))
{if(cur_tok<left_brace_limit)decr(align_state);
goto found;
}
else goto resume;
}

/*:389*/
#line 8419 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*392:*/
#line 8503 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(s!=r)
if(s==null)/*393:*/
#line 8520 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Use of ");sprint_cs(warning_index);

print(" doesn't match its definition");
help4("If you say, e.g., `\\def\\a1{...}', then you must always",
"put `1' after `\\a', since control sequence names are",
"made up of letters only. The macro here has not been",
"followed by the required stuff, so I'm ignoring it.");
error();goto end;
}

/*:393*/
#line 8505 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{t= s;
do{store_new_token(info(t));incr(m);u= link(t);v= s;
loop{if(u==r)
if(cur_tok!=info(v))goto done;
else{r= link(v);goto resume;
}
if(info(u)!=info(v))goto done;
u= link(u);v= link(v);
}
done:t= link(t);
}while(!(t==r));
r= s;
}

/*:392*/
#line 8421 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok==par_token)if(long_state!=long_call)
/*391:*/
#line 8472 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(long_state==call)
{runaway();print_err("Paragraph ended before ");

sprint_cs(warning_index);print(" was complete");
help3("I suspect you've forgotten a `}', causing me to apply this",
"control sequence to too much text. How can we recover?",
"My plan is to forget the whole thing and hope for the best.");
back_error();
}
pstack[n]= link(temp_head);align_state= align_state-unbalance;
for(m= 0;m<=n;m++)flush_list(pstack[m]);
goto end;
}

/*:391*/
#line 8423 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok<right_brace_limit)
if(cur_tok<left_brace_limit)
/*394:*/
#line 8531 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{unbalance= 1;

loop{fast_store_new_token(cur_tok);get_token();
if(cur_tok==par_token)if(long_state!=long_call)
/*391:*/
#line 8472 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(long_state==call)
{runaway();print_err("Paragraph ended before ");

sprint_cs(warning_index);print(" was complete");
help3("I suspect you've forgotten a `}', causing me to apply this",
"control sequence to too much text. How can we recover?",
"My plan is to forget the whole thing and hope for the best.");
back_error();
}
pstack[n]= link(temp_head);align_state= align_state-unbalance;
for(m= 0;m<=n;m++)flush_list(pstack[m]);
goto end;
}

/*:391*/
#line 8536 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok<right_brace_limit)
if(cur_tok<left_brace_limit)incr(unbalance);
else{decr(unbalance);
if(unbalance==0)goto done1;
}
}
done1:rbrace_ptr= p;store_new_token(cur_tok);
}

/*:394*/
#line 8426 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*390:*/
#line 8456 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{back_input();print_err("Argument of ");sprint_cs(warning_index);

print(" has an extra }");
help6("I've run across a `}' that doesn't seem to match anything.",
"For example, `\\def\\a#1{...}' and `\\a}' would produce",
"this error. If you simply proceed now, the `\\par' that",
"I've just inserted will cause me to report a runaway",
"argument that might be the root of the problem. But if",
"your `}' was spurious, just type `2' and it will go away.");
incr(align_state);long_state= call;cur_tok= par_token;ins_error();
goto resume;
}

/*:390*/
#line 8427 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*388:*/
#line 8435 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_tok==space_token)
if(info(r)<=end_match_token)
if(info(r)>=match_token)goto resume;
store_new_token(cur_tok);
}

/*:388*/
#line 8429 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
incr(m);
if(info(r)> end_match_token)goto resume;
if(info(r)<match_token)goto resume;
found:if(s!=null)/*395:*/
#line 8549 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((m==1)&&(info(p)<right_brace_limit))
{link(rbrace_ptr)= null;free_avail(p);
p= link(temp_head);pstack[n]= link(p);free_avail(p);
}
else pstack[n]= link(temp_head);
incr(n);
if(tracing_macros> 0)
if((tracing_stack_levels==0)||(input_ptr<tracing_stack_levels))
{begin_diagnostic();print_nl("");printn(match_chr);print_int(n);
print("<-");show_token_list(pstack[n-1],null,1000);
end_diagnostic(false);
}
}

/*:395*/
#line 8433 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:387*/
#line 8405 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;

}while(!(info(r)==end_match_token));
}

/*:386*/
#line 8361 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*385:*/
#line 8370 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

while((state==token_list)&&(loc==null)&&(token_type!=v_template))
end_token_list();
begin_token_list(ref_count,macro);name= warning_index;loc= link(r);
if(n> 0)
{if(param_ptr+n> max_param_stack)
{max_param_stack= param_ptr+n;
if(max_param_stack> param_size)
overflow("parameter stack size",param_size);

}
for(m= 0;m<=n-1;m++)param_stack[param_ptr+m]= pstack[m];
param_ptr= param_ptr+n;
}

/*:385*/
#line 8362 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
end:scanner_status= save_scanner_status;warning_index= save_warning_index;
}

/*:384*/
#line 8021 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*374:*/
#line 8194 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void insert_relax(void)
{cur_tok= cs_token_flag+cur_cs;back_input();
cur_tok= cs_token_flag+frozen_relax;back_input();token_type= inserted;
}

/*:374*/
#line 8022 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1324:*/
#line 25503 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void pseudo_start(void);

/*:1324*//*1382:*/
#line 26378 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_register_num(void);

/*:1382*//*1387:*/
#line 26452 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_index(quarterword i,pointer q)
{int k;
cur_ptr= get_node(index_node_size);sa_index(cur_ptr)= i;
sa_used(cur_ptr)= 0;link(cur_ptr)= q;
for(k= 1;k<=index_node_size-1;k++)
mem[cur_ptr+k]= sa_null;
}

/*:1387*//*1391:*/
#line 26512 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void find_sa_element(small_number t,halfword n,bool w)

{
pointer q;
small_number i;
cur_ptr= sa_root[t];
if_cur_ptr_is_null_then_return_or_goto(not_found);
q= cur_ptr;i= hex_dig1(n);get_sa_ptr;
if_cur_ptr_is_null_then_return_or_goto(not_found1);
q= cur_ptr;i= hex_dig2(n);get_sa_ptr;
if_cur_ptr_is_null_then_return_or_goto(not_found2);
q= cur_ptr;i= hex_dig3(n);get_sa_ptr;
if_cur_ptr_is_null_then_return_or_goto(not_found3);
q= cur_ptr;i= hex_dig4(n);get_sa_ptr;
if((cur_ptr==null)&&w)goto not_found4;
return;
not_found:new_index(t,null);
sa_root[t]= cur_ptr;q= cur_ptr;i= hex_dig1(n);
not_found1:new_index(i,q);
add_sa_ptr;q= cur_ptr;i= hex_dig2(n);
not_found2:new_index(i,q);
add_sa_ptr;q= cur_ptr;i= hex_dig3(n);
not_found3:new_index(i,q);
add_sa_ptr;q= cur_ptr;i= hex_dig4(n);
not_found4:/*1392:*/
#line 26577 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(t==mark_val)
{cur_ptr= get_node(mark_class_node_size);
mem[cur_ptr+1]= sa_null;mem[cur_ptr+2]= sa_null;mem[cur_ptr+3]= sa_null;
}
else{if(t<=dimen_val)
{cur_ptr= get_node(word_node_size);sa_int(cur_ptr)= 0;
sa_num(cur_ptr)= n;
}
else{cur_ptr= get_node(pointer_node_size);
if(t<=mu_val)
{sa_ptr(cur_ptr)= zero_glue;add_glue_ref(zero_glue);
}
else sa_ptr(cur_ptr)= null;
}
sa_ref(cur_ptr)= null;
}
sa_index(cur_ptr)= 16*t+i;sa_lev(cur_ptr)= level_one

/*:1392*/
#line 26537 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
link(cur_ptr)= q;add_sa_ptr;
}

/*:1391*/
#line 8023 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void pass_text(void);
static void start_input(void);
static void conditional(void);
static void get_x_token(void);
static void conv_toks(void);
static void ins_the_toks(void);
static void expand(void)
{
halfword t;
pointer p,q,r;
int j;
int cv_backup;
small_number cvl_backup,radix_backup,co_backup;

pointer backup_backup;
small_number save_scanner_status;
cv_backup= cur_val;cvl_backup= cur_val_level;radix_backup= radix;
co_backup= cur_order;backup_backup= link(backup_head);
reswitch:
if(cur_cmd<call)/*362:*/
#line 8050 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(tracing_commands> 1)show_cur_cmd_chr();
switch(cur_cmd){
case top_bot_mark:/*381:*/
#line 8291 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{t= cur_chr%marks_code;
if(cur_chr>=marks_code)scan_register_num();else cur_val= 0;
if(cur_val==0)cur_ptr= cur_mark[t];
else/*1396:*/
#line 26697 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{find_sa_element(mark_val,cur_val,false);
if(cur_ptr!=null)
if(odd(t))cur_ptr= link(cur_ptr+(t/2)+1);
else cur_ptr= info(cur_ptr+(t/2)+1);
}

/*:1396*/
#line 8295 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_ptr!=null)begin_token_list(cur_ptr,mark_text);
}

/*:381*/
#line 8053 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case expand_after:switch(cur_chr){
case 0:/*363:*/
#line 8072 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_token();t= cur_tok;get_token();
if(cur_cmd> max_command)expand();else back_input();
cur_tok= t;back_input();
}

/*:363*/
#line 8055 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case 1:/*1337:*/
#line 25657 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_token();
if((cur_cmd==if_test)&&(cur_chr!=if_case_code))
{cur_chr= cur_chr+unless_code;goto reswitch;
}
print_err("You can't use `");print_esc("unless");print("' before `");

print_cmd_chr(cur_cmd,cur_chr);print_char('\'');
help1("Continue, and I'll forget that it ever happened.");
back_error();
}

/*:1337*/
#line 8056 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
/*1475:*/
#line 27620 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case primitive_code:{get_token();
set_ROM_p_from_cs(cur_cs);
if((p!=ROM_undefined_primitive)&&(ROM_type(p)!=undefined_cs)){
eqtb[frozen_primitive]= ROM[p];
text(frozen_primitive)= text(cur_cs);
cur_tok= cs_token_flag+frozen_primitive;
}
back_input();
}break;

/*:1475*//*1479:*/
#line 27645 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case expanded_code:{scan_general_x_text();
back_list(link(link(garbage)));
free_avail(link(garbage));
}

/*:1479*/
#line 8057 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}break;
case no_expand:/*364:*/
#line 8086 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{save_scanner_status= scanner_status;scanner_status= normal;
get_token();scanner_status= save_scanner_status;t= cur_tok;
back_input();
if(t>=cs_token_flag)
{p= get_avail();info(p)= cs_token_flag+frozen_dont_expand;
link(p)= loc;start= p;loc= p;
}
}

/*:364*/
#line 8059 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case cs_name:/*367:*/
#line 8118 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{r= get_avail();p= r;
incr(incsname_state);
do{get_x_token();
if(cur_cs==0)store_new_token(cur_tok);
}while(!(cur_cs!=0));
if(cur_cmd!=end_cs_name)/*368:*/
#line 8134 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Missing ");print_esc("endcsname");print(" inserted");

help2("The control sequence marked <to be read again> should",
"not appear between \\csname and \\endcsname.");
back_error();
}

/*:368*/
#line 8124 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
decr(incsname_state);
/*369:*/
#line 8142 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

j= first;p= link(r);
while(p!=null)
{if(j>=max_buf_stack)
{max_buf_stack= j+1;
if(max_buf_stack==buf_size)
overflow("buffer size",buf_size);

}
buffer[j]= info(p)%cmd_factor;incr(j);p= link(p);
}
if(j==first)cur_cs= null_cs;
else if(j> first+1)
{no_new_control_sequence= false;cur_cs= id_lookup(first,j-first);
no_new_control_sequence= true;
}
else cur_cs= single_base+buffer[first]

/*:369*/
#line 8126 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
flush_list(r);
if(eq_type(cur_cs)==undefined_cs)
{eq_define(cur_cs,relax,256);
}
cur_tok= cur_cs+cs_token_flag;back_input();
}

/*:367*/
#line 8060 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case convert:conv_toks();break;
case the:ins_the_toks();break;
case if_test:conditional();break;
case fi_or_else:/*505:*/
#line 10487 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(tracing_ifs> 0)if(tracing_commands<=1)show_cur_cmd_chr();
if(cur_chr> if_limit)
if(if_limit==if_code)insert_relax();
else{print_err("Extra ");print_cmd_chr(fi_or_else,cur_chr);



help1("I'm ignoring this; it doesn't match any \\if.");
error();
}
else{while(cur_chr!=fi_code)pass_text();
/*491:*/
#line 10269 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(if_stack[in_open]==cond_ptr)if_warning();

p= cond_ptr;if_line= if_line_field(p);
cur_if= subtype(p);if_limit= type(p);cond_ptr= link(p);
free_node(p,if_node_size);
}

/*:491*/
#line 10499 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}

/*:505*/
#line 8064 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case input:/*373:*/
#line 8185 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_chr==1)force_eof= true
/*1321:*/
#line 25486 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(cur_chr==2)pseudo_start()

/*:1321*/
#line 8187 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(name_in_progress)insert_relax();
else start_input()

/*:373*/
#line 8065 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;break;
default:/*365:*/
#line 8096 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Undefined control sequence");

help5("The control sequence at the end of the top line",
"of your error message was never \\def'ed. If you have",
"misspelled it (e.g., `\\hobx'), type `I' and the correct",
"spelling (e.g., `I\\hbox'). Otherwise just continue,",
"and I'll forget about whatever was undefined.");
error();
}

/*:365*/
#line 8066 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
}

/*:362*/
#line 8043 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(cur_cmd<end_template)macro_call();
else/*370:*/
#line 8166 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{cur_tok= cs_token_flag+frozen_endv;back_input();
}

/*:370*/
#line 8045 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
cur_val= cv_backup;cur_val_level= cvl_backup;radix= radix_backup;
cur_order= co_backup;link(backup_head)= backup_backup;
}

/*:361*//*375:*/
#line 8204 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void get_x_token(void)

{
restart:get_next();

if(cur_cmd<=max_command)goto done;
if(cur_cmd>=call)
if(cur_cmd<end_template)macro_call();
else{cur_cs= frozen_endv;cur_cmd= endv;
goto done;
}
else expand();
goto restart;
done:if(cur_cs==0)cur_tok= cmd_token(cur_cmd)+cur_chr;
else cur_tok= cs_token_flag+cur_cs;
}

/*:375*//*376:*/
#line 8224 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void x_token(void)
{while(cur_cmd> max_command)
{expand();
get_next();
}
if(cur_cs==0)cur_tok= cmd_token(cur_cmd)+cur_chr;
else cur_tok= cs_token_flag+cur_cs;
}

/*:376*//*398:*/
#line 8593 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_left_brace(void)
{/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 8594 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd!=left_brace)
{print_err("Missing { inserted");

help4("A left brace was mandatory here, so I've put one in.",
"You might want to delete and/or insert some corrections",
"so that I will find a matching right brace soon.",
"(If you're confused by all this, try typing `I}' now.)");
back_error();cur_tok= left_brace_token+'{';cur_cmd= left_brace;
cur_chr= '{';incr(align_state);
}
}

/*:398*//*400:*/
#line 8614 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_optional_equals(void)
{/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 8615 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok!=other_token+'=')back_input();
}

/*:400*//*402:*/
#line 8638 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static bool scan_keyword(char*s)
{
pointer p;
pointer q;
p= backup_head;link(p)= null;
while(*s!=0)
{get_x_token();

if((cur_cs==0)&&
((cur_chr==*s)||(cur_chr==*s-'a'+'A')))
{store_new_token(cur_tok);incr(s);
}
else if((cur_cmd!=spacer)||(p!=backup_head))
{back_input();
if(p!=backup_head)back_list(link(backup_head));
return false;
}
}
flush_list(link(backup_head));return true;
}

/*:402*//*403:*/
#line 8662 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void mu_error(void)
{print_err("Incompatible glue units");

help1("I'm going to assume that 1mu=1pt when they're mixed.");
error();
}

/*:403*//*404:*/
#line 8679 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_int(void);
/*428:*/
#line 9094 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_eight_bit_int(void)
{scan_int();
if((cur_val<0)||(cur_val> 255))
{print_err("Bad register code");

help2("A register number must be between 0 and 255.",
"I changed this one to zero.");int_error(cur_val);cur_val= 0;
}
}

/*:428*//*429:*/
#line 9105 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_char_num(void)
{scan_int();
if((cur_val<0)||(cur_val> 0x10ffff))
{print_err("Bad character code");

help2("A character number must be between 0 and 0x10FFFF.",
"I changed this one to zero.");int_error(cur_val);cur_val= 0;
}
}

/*:429*//*430:*/
#line 9119 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_four_bit_int(void)
{scan_int();
if((cur_val<0)||(cur_val> 15))
{print_err("Bad number");

help2("Since I expected to read a number between 0 and 15,",
"I changed this one to zero.");int_error(cur_val);cur_val= 0;
}
}

/*:430*//*431:*/
#line 9130 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_fifteen_bit_int(void)
{scan_int();
if((cur_val<0)||(cur_val> 077777))
{print_err("Bad mathchar");

help2("A mathchar number must be between 0 and 32767.",
"I changed this one to zero.");int_error(cur_val);cur_val= 0;
}
}

/*:431*//*432:*/
#line 9141 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_twenty_seven_bit_int(void)
{scan_int();
if((cur_val<0)||(cur_val> 0777777777))
{print_err("Bad delimiter code");

help2("A numeric delimiter code must be between 0 and 2^{27}-1.",
"I changed this one to zero.");int_error(cur_val);cur_val= 0;
}
}

/*:432*//*1383:*/
#line 26381 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_register_num(void)
{scan_int();
if((cur_val<0)||(cur_val> max_reg_num))
{print_err("Bad register code");

help2(max_reg_help_line,"I changed this one to zero.");
int_error(cur_val);cur_val= 0;
}
}

/*:1383*/
#line 8680 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1302:*/
#line 25329 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_general_text(void);

/*:1302*//*1344:*/
#line 25739 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void get_x_or_protected(void)

{
loop{get_token();
if(cur_cmd<=max_command)return;
if((cur_cmd>=call)&&(cur_cmd<end_template))
if(info(link(cur_chr))==protected_token)return;
expand();
}
}

/*:1344*//*1353:*/
#line 25916 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_expr(void);

/*:1353*//*1358:*/
#line 26008 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_normal_glue(void);
static void scan_mu_glue(void);

/*:1358*/
#line 8681 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*571:*/
#line 11860 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_font_ident(void)
{internal_font_number f;
halfword m;
/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 11864 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd==def_font)f= cur_font;
else if(cur_cmd==set_font)f= cur_chr;
else if(cur_cmd==def_family)
{m= cur_chr;scan_four_bit_int();f= equiv(m+cur_val);
}
else{print_err("Missing font identifier");

help2("I was looking for a control sequence whose",
"current meaning has been defined by \\font.");
back_error();f= null_font;
}
cur_val= f;
}

/*:571*//*572:*/
#line 11883 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void find_font_dimen(bool writing)

{internal_font_number f;
int n;
scan_int();n= cur_val;scan_font_ident();f= cur_val;
if(n<=0)cur_val= fmem_ptr;
else{if(writing&&(n<=space_shrink_code)&&
(n>=space_code)&&(font_glue[f]!=null))
{delete_glue_ref(font_glue[f]);
font_glue[f]= null;
}
if(n> font_params[f])
if(f<font_ptr)cur_val= fmem_ptr;
else/*574:*/
#line 11914 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{do{if(fmem_ptr==font_mem_size)
overflow("font memory",font_mem_size);

font_info[fmem_ptr].sc= 0;incr(fmem_ptr);incr(font_params[f]);
}while(!(n==font_params[f]));
cur_val= fmem_ptr-1;
}

/*:574*/
#line 11897 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else cur_val= n+param_base[f];
}
/*573:*/
#line 11903 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_val==fmem_ptr)
{print_err("Font ");printn_esc(font_id_text(f));
print(" has only ");print_int(font_params[f]);
print(" fontdimen parameters");

help2("To increase the number of font parameters, you must",
"use \\fontdimen immediately after the \\font is loaded.");
error();
}

/*:573*/
#line 11900 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:572*//*1830:*/
#line 34798 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void begin_name(void);
static bool more_name(uint32_t c);
static void end_name(void);
static void scan_font_name(void)
{pool_pointer j,k;
int old_setting;
char*f_name= NULL;
name_in_progress= true;begin_name();
/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 34807 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd==left_brace)
/*1770:*/
#line 33279 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{back_input();name_in_progress= false;
cur_cs= input_loc;
scan_general_x_text();
old_setting= selector;selector= new_string;
token_show(link(garbage));selector= old_setting;
/*1771:*/
#line 33300 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= j= str_start[str_ptr];k<pool_ptr;k++){
if(str_pool[k]!='"'){str_pool[j]= str_pool[k];incr(j);}
}
pool_ptr= j;

/*:1771*/
#line 33285 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

j= pool_ptr-1;while((j>=str_start[str_ptr])&&(area_delimiter==0))
{
if((str_pool[j]=='/'))
area_delimiter= j-str_start[str_ptr]+1;
if((ext_delimiter==0)&&(str_pool[j]=='.'))
ext_delimiter= j-str_start[str_ptr]+1;
decr(j);
}
flush_list(link(garbage));
goto done;
}

/*:1770*/
#line 34809 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

loop{if((cur_cmd> other_char)||(cur_chr> biggest_char))
{back_input();goto done;
}
if(!more_name(cur_chr))goto done;
get_x_token();
}
done:
/*1832:*/
#line 34842 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int l= cur_length;
int i= 0;
int d;
f_name= (char*)str_pool+str_start[str_ptr];
if(f_name[i]=='[')
{d= 1;
/*1833:*/
#line 34881 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{
i+= d;
f_delimiter= area_delimiter= ext_delimiter= 0;
while(i<l)
{f_name[i-d]= f_name[i];
if(f_name[i]==']')
{f_delimiter= i-d;
d= 2;
i++;
break;
}
else if(IS_DIR_SEP(f_name[i])){area_delimiter= i+1-d;ext_delimiter= 0;}
else if(f_name[i]=='.')ext_delimiter= i+1-d;
i++;
}
if(d!=2)
{begin_diagnostic();
print_nl("Bracketed font file name with missing ']'");
end_diagnostic(false);
}
}

/*:1833*/
#line 34849 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else if(strncmp("file:",f_name,5)==0)
{d= 5;
/*1834:*/
#line 34907 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{i+= d;
f_delimiter= area_delimiter= ext_delimiter= 0;
while(i<l)
{f_name[i-d]= f_name[i];
if(f_name[i]=='('||f_name[i]==':')
break;
else if(IS_DIR_SEP(f_name[i])){area_delimiter= i+1-d;ext_delimiter= 0;}
else if(f_name[i]=='.')ext_delimiter= i+1-d;
i++;
}
f_delimiter= i-d;
}


/*:1834*/
#line 34853 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else if(strncmp("name:",f_name,5)==0)
{d= 5;
/*1836:*/
#line 34944 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{i+= d;
fatal_error("Finding fonts by name not yet implemented");
}

/*:1836*/
#line 34857 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else
{
d= 0;
/*1834:*/
#line 34907 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{i+= d;
f_delimiter= area_delimiter= ext_delimiter= 0;
while(i<l)
{f_name[i-d]= f_name[i];
if(f_name[i]=='('||f_name[i]==':')
break;
else if(IS_DIR_SEP(f_name[i])){area_delimiter= i+1-d;ext_delimiter= 0;}
else if(f_name[i]=='.')ext_delimiter= i+1-d;
i++;
}
f_delimiter= i-d;
}


/*:1834*/
#line 34862 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
if(i<l&&f_name[i]=='(')
{i++;
/*1835:*/
#line 34927 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{char*end_ptr= NULL;
f_index= strtol((char*)f_name+i,&end_ptr,10);
i= (end_ptr-f_name);
if(*end_ptr==')')
i++;
else
{begin_diagnostic();
print_nl("Missing ]): There is no ) to terminate the font selector!");

end_diagnostic(false);
}
}



/*:1835*/
#line 34866 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else
f_index= 0;
if(i<l&&f_name[i]==':')
{begin_diagnostic();
print_nl("Font features not yet implemented!");
end_diagnostic(false);
}
pool_ptr= str_start[str_ptr]+f_delimiter;
}

/*:1832*/
#line 34817 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

end_name();
name_in_progress= false;
}

/*:1830*/
#line 8682 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:404*//*408:*/
#line 8751 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_something_internal(small_number level,bool negative)

{
halfword m;
pointer q;
pointer tx;
int p;
m= cur_chr;
switch(cur_cmd){
case def_code:/*409:*/
#line 8794 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_char_num();
if(m>=utf_first_base&&cur_val<0x100)m= utf_adjust_base(m);
if(m>=utf_first_base)scanned_result(utf_lookup(m,cur_val),int_val)
else if(m==math_code_base)scanned_result(ho(math_code(cur_val)),int_val)
else if(m<math_code_base)scanned_result(equiv(m+cur_val),int_val)
else scanned_result(eqtb[m+cur_val].i,int_val);
}

/*:409*/
#line 8760 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case toks_register:case assign_toks:
case def_family:case set_font:case def_font:/*410:*/
#line 8803 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(level!=tok_val)
{print_err("Missing number, treated as zero");

help3("A number should have been here; I inserted `0'.",
"(If you can't figure out why I needed to see a number,",
"look up `weird error' in the index to The TeXbook.)");

back_error();scanned_result(0,dimen_val);
}
else if(cur_cmd<=assign_toks)
{if(cur_cmd<assign_toks)
if(m==mem_bot)
{scan_register_num();
if(cur_val<256)cur_val= equiv(toks_base+cur_val);
else{find_sa_element(tok_val,cur_val,false);
if(cur_ptr==null)cur_val= null;
else cur_val= sa_ptr(cur_ptr);
}
}
else cur_val= sa_ptr(m);
else
{if(m<utf_first_base)cur_val= equiv(m);
else cur_val= utf_lookup(m&utf_base_mask,m&utf_cp_mask);
}
cur_val_level= tok_val;
}
else{back_input();scan_font_ident();
scanned_result(font_id_base+cur_val,ident_val);
}

/*:410*/
#line 8763 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case assign_int:scanned_result(eqtb[m].i,int_val)break;
case assign_dimen:
scanned_result(eqtb[m].sc,dimen_val);
if(m>=dimen_base)
{cur_hfactor= hfactor_eqtb[m].sc;
cur_vfactor= vfactor_eqtb[m].sc;
}
else
cur_hfactor= cur_vfactor= 0;
break;
case assign_glue:scanned_result(equiv(m),glue_val)break;
case assign_mu_glue:scanned_result(equiv(m),mu_val)break;
case set_aux:/*413:*/
#line 8900 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(abs(mode)!=m)
{print_err("Improper ");print_cmd_chr(set_aux,m);


help4("You can refer to \\spacefactor only in horizontal mode;",
"you can refer to \\prevdepth only in vertical mode; and",
"neither of these is meaningful inside \\write. So",
"I'm forgetting what you said and using zero instead.");
error();
if(level!=tok_val)scanned_result(0,dimen_val)
else scanned_result(0,int_val);
}
else if(m==vmode)
scanned_result(prev_depth==unknown_depth?0:prev_depth,dimen_val)
else scanned_result(space_factor,int_val)

/*:413*/
#line 8776 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case set_prev_graf:/*417:*/
#line 8942 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(mode==0)scanned_result(0,int_val)
else{nest[nest_ptr]= cur_list;p= nest_ptr;
while(abs(nest[p].mode_field)!=vmode)decr(p);
scanned_result(nest[p].pg_field,int_val);
}

/*:417*/
#line 8777 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case set_page_int:/*414:*/
#line 8917 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(m==0)cur_val= dead_cycles
/*1314:*/
#line 25447 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(m==2)cur_val= interaction

/*:1314*/
#line 8919 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else cur_val= insert_penalties;
cur_val_level= int_val;
}

/*:414*/
#line 8778 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case set_page_dimen:/*416:*/
#line 8935 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((page_contents==empty)&&(!output_active))
if(m==0)cur_val= max_dimen;else cur_val= 0;
else cur_val= page_so_far[m];
cur_val_level= dimen_val;
}

/*:416*/
#line 8779 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case set_shape:/*418:*/
#line 8949 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(m> par_shape_loc)/*1425:*/
#line 27161 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_int();
if((equiv(m)==null)||(cur_val<0))cur_val= 0;
else{if(cur_val> penalty(equiv(m)))cur_val= penalty(equiv(m));
cur_val= penalty(equiv(m)+cur_val);
}
}

/*:1425*/
#line 8950 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(par_shape_ptr==null)cur_val= 0;
else cur_val= info(par_shape_ptr);
cur_val_level= int_val;
}

/*:418*/
#line 8780 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case set_box_dimen:/*415:*/
#line 8924 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_register_num();fetch_box(q);
if(q==null)cur_val= 0;else cur_val= mem[q+m].sc;
cur_val_level= dimen_val;
}

/*:415*/
#line 8781 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case char_given:scanned_result(cur_chr,int_val)break;
case math_given:Umath_to_math(cur_chr);scanned_result(cur_chr,int_val)break;
case assign_font_dimen:/*420:*/
#line 9008 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{find_font_dimen(false);font_info[fmem_ptr].sc= 0;
scanned_result(font_info[cur_val].sc,dimen_val);
}

/*:420*/
#line 8784 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case assign_font_int:/*421:*/
#line 9013 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_font_ident();
if(m==0)scanned_result(hyphen_char[cur_val],int_val)
else scanned_result(skew_char[cur_val],int_val);
}

/*:421*/
#line 8785 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case internal_register:/*422:*/
#line 9019 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((m<mem_bot)||(m> lo_mem_stat_max))
{cur_val_level= sa_type(m);
if(cur_val_level<glue_val)cur_val= sa_int(m);
else cur_val= sa_ptr(m);
}
else{scan_register_num();cur_val_level= m-mem_bot;
if(cur_val> 255)
{find_sa_element(cur_val_level,cur_val,false);
if(cur_ptr==null)
if(cur_val_level<glue_val)cur_val= 0;
else cur_val= zero_glue;
else if(cur_val_level<glue_val)cur_val= sa_int(cur_ptr);
else cur_val= sa_ptr(cur_ptr);
}
else
switch(cur_val_level){
case int_val:cur_val= count(cur_val);break;
case dimen_val:
cur_hfactor= dimen_hfactor(cur_val);
cur_vfactor= dimen_vfactor(cur_val);
cur_val= dimen(cur_val);break;
case glue_val:cur_val= skip(cur_val);break;
case mu_val:cur_val= mu_skip(cur_val);
}
}
}

/*:422*/
#line 8786 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case last_item:/*419:*/
#line 8963 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(m> eTeX_last_last_item_cmd_mod)
/*1438:*/
#line 27264 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{switch(m){
/*1444:*/
#line 27322 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case Prote_version_code:cur_val= Prote_version;break;

/*:1444*//*1459:*/
#line 27451 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case shell_escape_code:cur_val= 0;break;

/*:1459*//*1494:*/
#line 27766 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case elapsed_time_code:cur_val= get_elapsed_time;break;

/*:1494*//*1530:*/
#line 28231 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case random_seed_code:cur_val= random_seed;break;

/*:1530*//*1556:*/
#line 28466 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case last_xpos_code:cur_val= last_saved_xpos;break;
case last_ypos_code:cur_val= last_saved_ypos;

/*:1556*//*1569:*/
#line 28545 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case HINT_version_code:cur_val= HINT_VERSION;break;
case HINT_minor_version_code:cur_val= HINT_MINOR_VERSION;break;


/*:1569*/
#line 27266 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
cur_val_level= int_val;
}

/*:1438*/
#line 8965 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(m>=input_line_no_code)
if(m>=eTeX_glue)/*1352:*/
#line 25885 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(m<eTeX_mu)
{switch(m){
/*1379:*/
#line 26333 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mu_to_glue_code:scan_mu_glue();

/*:1379*/
#line 25888 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
cur_val_level= glue_val;
}
else if(m<eTeX_expr)
{switch(m){
/*1380:*/
#line 26336 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case glue_to_mu_code:scan_normal_glue();

/*:1380*/
#line 25894 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
cur_val_level= mu_val;
}
else{cur_val_level= m-eTeX_expr+int_val;scan_expr();
}
while(cur_val_level> level)
{if(cur_val_level==glue_val)
{m= cur_val;cur_val= width(m);delete_glue_ref(m);
}
else if(cur_val_level==mu_val)mu_error();
decr(cur_val_level);
}
if(negative)
if(cur_val_level>=glue_val)
{m= cur_val;cur_val= new_spec(m);delete_glue_ref(m);
/*426:*/
#line 9083 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{negate(width(cur_val));
negate(stretch(cur_val));
negate(shrink(cur_val));
}

/*:426*/
#line 25910 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
else negate(cur_val);
return;
}

/*:1352*/
#line 8967 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(m>=eTeX_dim)
{switch(m){
/*1291:*/
#line 25140 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case font_char_wd_code:
case font_char_ht_code:
case font_char_dp_code:
case font_char_ic_code:{scan_font_ident();q= cur_val;scan_char_num();
if((font_bc[q]<=cur_val)&&(font_ec[q]>=cur_val))
{
switch(m){
case font_char_wd_code:cur_val= char_width(q,qi(cur_val));break;
case font_char_ht_code:cur_val= char_height(q,qi(cur_val));break;
case font_char_dp_code:cur_val= char_depth(q,qi(cur_val));break;
case font_char_ic_code:cur_val= char_italic(q,qi(cur_val));
}
}
else cur_val= 0;
}break;

/*:1291*//*1294:*/
#line 25178 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case par_shape_length_code:
case par_shape_indent_code:
case par_shape_dimen_code:{q= cur_chr-par_shape_length_code;scan_int();
if((par_shape_ptr==null)||(cur_val<=0))cur_val= 0;
else{if(q==2)
{q= cur_val%2;cur_val= (cur_val+q)/2;
}
if(cur_val> info(par_shape_ptr))cur_val= info(par_shape_ptr);
cur_val= mem[par_shape_ptr+2*cur_val-q].sc;
}
cur_val_level= dimen_val;
}break;

/*:1294*//*1376:*/
#line 26308 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case glue_stretch_code:case glue_shrink_code:
{scan_normal_glue();q= cur_val;
if(m==glue_stretch_code)cur_val= stretch(q);
else cur_val= shrink(q);
delete_glue_ref(q);
}

/*:1376*/
#line 8970 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
cur_val_level= dimen_val;
}
else{switch(m){
case input_line_no_code:cur_val= line;break;
case badness_code:cur_val= last_badness;break;
/*1272:*/
#line 24935 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case eTeX_version_code:cur_val= eTeX_version;break;

/*:1272*//*1285:*/
#line 25076 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case current_group_level_code:cur_val= cur_level-level_one;break;
case current_group_type_code:cur_val= cur_group;break;

/*:1285*//*1288:*/
#line 25101 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case current_if_level_code:{q= cond_ptr;cur_val= 0;
while(q!=null)
{incr(cur_val);q= link(q);
}
}break;
case current_if_type_code:if(cond_ptr==null)cur_val= 0;
else if(cur_if<unless_code)cur_val= cur_if+1;
else cur_val= -(cur_if-unless_code+1);break;
case current_if_branch_code:
if((if_limit==or_code)||(if_limit==else_code))cur_val= 1;
else if(if_limit==fi_code)cur_val= -1;
else cur_val= 0;break;

/*:1288*//*1375:*/
#line 26300 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case glue_stretch_order_code:case glue_shrink_order_code:
{scan_normal_glue();q= cur_val;
if(m==glue_stretch_order_code)cur_val= stretch_order(q);
else cur_val= shrink_order(q);
delete_glue_ref(q);
}

/*:1375*/
#line 8977 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
cur_val_level= int_val;
}
else{if(cur_chr==glue_val)cur_val= zero_glue;else cur_val= 0;
tx= tail;
if(cur_chr==last_node_type_code)
{cur_val_level= int_val;
if((tx==head)||(mode==0))cur_val= -1;
}
else cur_val_level= cur_chr;
if(!is_char_node(tx)&&(mode!=0))
switch(cur_chr){
case int_val:if(type(tx)==penalty_node)cur_val= penalty(tx);break;
case dimen_val:if(type(tx)==kern_node)cur_val= width(tx);break;
case glue_val:if(type(tx)==glue_node)
{cur_val= glue_ptr(tx);
if(subtype(tx)==mu_glue)cur_val_level= mu_val;
}break;
case last_node_type_code:if(type(tx)<=unset_node)cur_val= type(tx)+1;
else cur_val= unset_node+2;
}
else if((mode==vmode)&&(tx==head))
switch(cur_chr){
case int_val:cur_val= last_penalty;break;
case dimen_val:cur_val= last_kern;break;
case glue_val:if(last_glue!=max_halfword)cur_val= last_glue;break;
case last_node_type_code:cur_val= last_node_type;
}
}

/*:419*/
#line 8787 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
default:/*423:*/
#line 9047 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("You can't use `");print_cmd_chr(cur_cmd,cur_chr);

print("' after ");print_esc("the");
help1("I'm forgetting what you said and using zero instead.");
error();
if(level!=tok_val)scanned_result(0,dimen_val)
else scanned_result(0,int_val);
}

/*:423*/
#line 8788 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
while(cur_val_level> level)/*424:*/
#line 9063 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_val_level==glue_val)cur_val= width(cur_val);
else if(cur_val_level==mu_val)mu_error();
decr(cur_val_level);
}

/*:424*/
#line 8790 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*425:*/
#line 9073 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(negative)
if(cur_val_level>=glue_val)
{cur_val= new_spec(cur_val);
/*426:*/
#line 9083 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{negate(width(cur_val));
negate(stretch(cur_val));
negate(shrink(cur_val));
}

/*:426*/
#line 9077 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
else{negate(cur_val);negate(cur_hfactor);negate(cur_vfactor);}
else if((cur_val_level>=glue_val)&&(cur_val_level<=mu_val))
add_glue_ref(cur_val)

/*:425*/
#line 8791 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:408*//*435:*/
#line 9184 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_int(void)
{
bool negative;
int m;
small_number d;
bool vacuous;
bool OK_so_far;
radix= 0;OK_so_far= true;
/*436:*/
#line 9200 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

negative= false;
do{/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 9202 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok==other_token+'-')
{negative= !negative;cur_tok= other_token+'+';
}
}while(!(cur_tok!=other_token+'+'))

/*:436*/
#line 9192 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok==alpha_token)/*437:*/
#line 9211 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_token();
if(cur_tok<cs_token_flag)
{cur_val= cur_chr;
if(cur_cmd<=right_brace)
if(cur_cmd==right_brace)incr(align_state);
else decr(align_state);
}
else if(cur_tok<cs_token_flag+single_base)
{if(cur_tok<cs_token_flag+active_hash_base)
cur_val= cur_tok-cs_token_flag-active_base;
else
cur_val= active_hash[cur_tok-cs_token_flag];
}
else if(cur_tok<cs_token_flag+null_cs)
cur_val= cur_tok-cs_token_flag-single_base;
else
{pointer p= cur_tok-cs_token_flag;
int t= text(p);
int i= str_start[t];
int j= str_start[t+1];
int k= utf8_get_cur_chr(str_pool,i,j);
if(k==j)
cur_val= cur_chr;
else
cur_val= 0x110000;
}
if(cur_val> 0x10ffff)
{print_err("Improper alphabetic constant");

help2("A one-character control sequence belongs after a ` mark.",
"So I'm essentially inserting \\0 here.");
cur_val= '0';back_error();
}
else/*438:*/
#line 9248 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();if(cur_cmd!=spacer)back_input();
}

/*:438*/
#line 9245 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:437*/
#line 9193 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if((cur_cmd>=min_internal)&&(cur_cmd<=max_internal))
scan_something_internal(int_val,false);
else/*439:*/
#line 9252 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{radix= 10;m= 214748364;
if(cur_tok==octal_token)
{radix= 8;m= 02000000000;get_x_token();
}
else if(cur_tok==hex_token)
{radix= 16;m= 01000000000;get_x_token();
}
vacuous= true;cur_val= 0;
/*440:*/
#line 9271 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

loop{if((cur_tok<zero_token+radix)&&(cur_tok>=zero_token)&&
(cur_tok<=zero_token+9))d= cur_tok-zero_token;
else if(radix==16)
if((cur_tok<=A_token+5)&&(cur_tok>=A_token))d= cur_tok-A_token+10;
else if((cur_tok<=other_A_token+5)&&(cur_tok>=other_A_token))
d= cur_tok-other_A_token+10;
else goto done;
else goto done;
vacuous= false;
if((cur_val>=m)&&((cur_val> m)||(d> 7)||(radix!=10)))
{if(OK_so_far)
{print_err("Number too big");

help2("I can only go up to 2147483647='17777777777=\"7FFFFFFF,",
"so I'm using that number instead of yours.");
error();cur_val= infinity;OK_so_far= false;
}
}
else cur_val= cur_val*radix+d;
get_x_token();
}
done:

/*:440*/
#line 9261 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(vacuous)/*441:*/
#line 9295 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Missing number, treated as zero");

help3("A number should have been here; I inserted `0'.",
"(If you can't figure out why I needed to see a number,",
"look up `weird error' in the index to The TeXbook.)");

back_error();
}

/*:441*/
#line 9262 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(cur_cmd!=spacer)back_input();
}

/*:439*/
#line 9196 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(negative)negate(cur_val);
}

/*:435*//*443:*/
#line 9334 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_dimen(bool mu,bool inf,bool shortcut)

{
bool negative;
int f;
/*445:*/
#line 9380 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

int num,denom;
int k,kk;
pointer p,q;
scaled v;
int save_cur_val;

/*:445*/
#line 9339 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

f= 0;arith_error= false;cur_order= normal;negative= false;
cur_hfactor= cur_vfactor= 0;
if(!shortcut)
{/*436:*/
#line 9200 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

negative= false;
do{/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 9202 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok==other_token+'-')
{negative= !negative;cur_tok= other_token+'+';
}
}while(!(cur_tok!=other_token+'+'))

/*:436*/
#line 9343 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if((cur_cmd>=min_internal)&&(cur_cmd<=max_internal))
/*444:*/
#line 9369 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(mu)
{scan_something_internal(mu_val,false);
/*446:*/
#line 9391 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_val_level>=glue_val)
{v= width(cur_val);delete_glue_ref(cur_val);cur_val= v;
}

/*:446*/
#line 9372 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_val_level==mu_val)goto attach_sign;
if(cur_val_level!=int_val)mu_error();
}
else{scan_something_internal(dimen_val,false);
if(cur_val_level==dimen_val)goto attach_sign;
}

/*:444*/
#line 9346 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{back_input();
if(cur_tok==continental_point_token)cur_tok= point_token;
if(cur_tok!=point_token)scan_int();
else{radix= 10;cur_val= 0;
}
if(cur_tok==continental_point_token)cur_tok= point_token;
if((radix==10)&&(cur_tok==point_token))/*447:*/
#line 9402 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{k= 0;p= null;get_token();
loop{get_x_token();
if((cur_tok> zero_token+9)||(cur_tok<zero_token))goto done1;
if(k<17)
{q= get_avail();link(q)= p;info(q)= cur_tok-zero_token;
p= q;incr(k);
}
}
done1:for(kk= k;kk>=1;kk--)
{dig[kk-1]= info(p);q= p;p= link(p);free_avail(q);
}
f= round_decimals(k);
if(cur_cmd!=spacer)back_input();
}

/*:447*/
#line 9353 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}
if(cur_val<0)
{negative= !negative;negate(cur_val);
}
/*448:*/
#line 9425 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(inf)/*449:*/
#line 9443 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(scan_keyword("fil"))

{cur_order= fil;
while(scan_keyword("l"))
{if(cur_order==filll)
{print_err("Illegal unit of measure (");

print("replaced by filll)");
help1("I dddon't go any higher than filll.");error();
}
else incr(cur_order);
}
goto attach_fraction;
}

/*:449*/
#line 9426 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*450:*/
#line 9459 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

save_cur_val= cur_val;
if(has_factor)
{print_err("Factor is not constant. Linear component ignored");
cur_hfactor= cur_vfactor= 0;
}
/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 9465 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if((cur_cmd<min_internal)||(cur_cmd> max_internal))back_input();
else{if(mu)
{scan_something_internal(mu_val,false);/*446:*/
#line 9391 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_val_level>=glue_val)
{v= width(cur_val);delete_glue_ref(cur_val);cur_val= v;
}

/*:446*/
#line 9468 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_val_level!=mu_val)mu_error();
}
else scan_something_internal(dimen_val,false);
v= cur_val;goto found;
}
if(mu)goto not_found;
if(scan_keyword("em"))v= (/*551:*/
#line 11468 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
quad(cur_font)

/*:551*/
#line 9475 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
);

else if(scan_keyword("ex"))v= (/*552:*/
#line 11470 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
x_height(cur_font)

/*:552*/
#line 9477 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
);

else goto not_found;
/*438:*/
#line 9248 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();if(cur_cmd!=spacer)back_input();
}

/*:438*/
#line 9480 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
found:
if(has_factor)
{cur_hfactor= nx_plus_y(save_cur_val,cur_hfactor,xn_over_d(cur_hfactor,f,unity));
cur_vfactor= nx_plus_y(save_cur_val,cur_vfactor,xn_over_d(cur_vfactor,f,unity));
}
cur_val= nx_plus_y(save_cur_val,v,xn_over_d(v,f,unity));
goto attach_sign;
not_found:

/*:450*/
#line 9428 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(mu)/*451:*/
#line 9490 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(scan_keyword("mu"))goto attach_fraction;

else{print_err("Illegal unit of measure (");print("mu inserted)");

help4("The unit of measurement in math glue must be mu.",
"To recover gracefully from this error, it's best to",
"delete the erroneous units; e.g., type `2' to delete",
"two letters. (See Chapter 27 of The TeXbook.)");

error();goto attach_fraction;
}

/*:451*/
#line 9429 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(scan_keyword("true"))/*452:*/
#line 9503 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{prepare_mag();
if(mag!=1000)
{cur_val= xn_over_d(cur_val,1000,mag);
f= (1000*f+0200000*rem)/mag;
cur_val= cur_val+(f/0200000);f= f%0200000;
}
}

/*:452*/
#line 9430 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;

if(scan_keyword("pt"))goto attach_fraction;

/*453:*/
#line 9521 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(scan_keyword("in"))set_conversion(7227,100)

else if(scan_keyword("pc"))set_conversion(12,1)

else if(scan_keyword("cm"))set_conversion(7227,254)

else if(scan_keyword("mm"))set_conversion(7227,2540)

else if(scan_keyword("bp"))set_conversion(7227,7200)

else if(scan_keyword("dd"))set_conversion(1238,1157)

else if(scan_keyword("cc"))set_conversion(14856,1157)

else if(scan_keyword("sp"))goto done;

else/*454:*/
#line 9544 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Illegal unit of measure (");print("pt inserted)");

help6("Dimensions can be in units of em, ex, in, pt, pc,",
"cm, mm, dd, cc, bp, or sp; but yours is a new one!",
"I'll assume that you meant to say pt, for printer's points.",
"To recover gracefully from this error, it's best to",
"delete the erroneous units; e.g., type `2' to delete",
"two letters. (See Chapter 27 of The TeXbook.)");

error();goto done2;
}


/*:454*/
#line 9538 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
cur_val= xn_over_d(cur_val,num,denom);
f= (num*f+0200000*rem)/denom;
cur_val= cur_val+(f/0200000);f= f%0200000;
done2:

/*:453*/
#line 9435 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
attach_fraction:if(cur_val>=040000)arith_error= true;
else cur_val= cur_val*unity+f;
done:

/*:448*/
#line 9360 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*438:*/
#line 9248 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();if(cur_cmd!=spacer)back_input();
}

/*:438*/
#line 9361 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
attach_sign:
if(arith_error||(abs(cur_val)>=010000000000)||
(abs(cur_hfactor)>=010000000000)||(abs(cur_vfactor)>=010000000000))
/*455:*/
#line 9558 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Dimension too large");

help2("I can't work with sizes bigger than about 19 feet.",
"Continue and I'll use the largest value I can.");
error();cur_val= max_dimen;arith_error= false;
}

/*:455*/
#line 9365 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(negative){negate(cur_val);negate(cur_hfactor);negate(cur_vfactor);}
}

/*:443*//*456:*/
#line 9576 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_glue(small_number level)

{
bool negative;
pointer q;
bool mu;
mu= (level==mu_val);/*436:*/
#line 9200 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

negative= false;
do{/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 9202 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok==other_token+'-')
{negative= !negative;cur_tok= other_token+'+';
}
}while(!(cur_tok!=other_token+'+'))

/*:436*/
#line 9582 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if((cur_cmd>=min_internal)&&(cur_cmd<=max_internal))
{scan_something_internal(level,negative);
if(cur_val_level>=glue_val)
{if(cur_val_level!=level)mu_error();
return;
}
if(cur_val_level==int_val)scan_dimen(mu,false,true);
else if(level==mu_val)mu_error();
}
else{back_input();scan_dimen(mu,false,false);
if(negative){negate(cur_val);negate(cur_hfactor);negate(cur_vfactor);}
}
/*457:*/
#line 9601 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= new_spec(zero_glue);width(q)= cur_val;
if(scan_keyword("plus"))

{scan_dimen(mu,true,false);
stretch(q)= cur_val;stretch_order(q)= cur_order;
}
if(scan_keyword("minus"))

{scan_dimen(mu,true,false);
shrink(q)= cur_val;shrink_order(q)= cur_order;
}
cur_val= q

/*:457*/
#line 9596 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*1354:*/
#line 25921 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1365:*/
#line 26113 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int add_or_sub(int x,int y,int max_answer,bool negative)
{int a;
if(negative)negate(y);
if(x>=0)
if(y<=max_answer-x)a= x+y;else num_error(a)
else if(y>=-max_answer-x)a= x+y;else num_error(a);
return a;
}

/*:1365*//*1369:*/
#line 26168 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int quotient(int n,int d)
{bool negative;
int a;
if(d==0)num_error(a)
else{if(d> 0)negative= false;
else{negate(d);negative= true;
}
if(n<0)
{negate(n);negative= !negative;
}
a= n/d;n= n-a*d;d= n-d;
if(d+n>=0)incr(a);
if(negative)negate(a);
}
return a;
}

/*:1369*//*1371:*/
#line 26205 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int fract(int x,int n,int d,int max_answer)
{
bool negative;
int a;
int f;
int h;
int r;
int t;
if(d==0)goto too_big;
a= 0;
if(d> 0)negative= false;
else{negate(d);negative= true;
}
if(x<0)
{negate(x);negative= !negative;
}
else if(x==0)goto done;
if(n<0)
{negate(n);negative= !negative;
}
t= n/d;
if(t> max_answer/x)goto too_big;
a= t*x;n= n-t*d;
if(n==0)goto found;
t= x/d;
if(t> (max_answer-a)/n)goto too_big;
a= a+t*n;x= x-t*d;
if(x==0)goto found;
if(x<n)
{t= x;x= n;n= t;
}
/*1372:*/
#line 26255 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

f= 0;r= (d/2)-d;h= -r;
loop{if(odd(n))
{r= r+x;
if(r>=0)
{r= r-d;incr(f);
}
}
n= n/2;
if(n==0)goto found1;
if(x<h)x= x+x;
else{t= x-d;x= t+x;f= f+n;
if(x<n)
{if(x==0)goto found1;
t= x;x= n;n= t;
}
}
}
found1:

/*:1372*/
#line 26237 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(f> (max_answer-a))goto too_big;
a= a+f;
found:if(negative)negate(a);
goto done;
too_big:num_error(a);
done:return a;
}

/*:1371*/
#line 25922 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_expr(void)
{
bool a,b;
small_number l;
small_number r;
small_number s;
small_number o;
int e;
int t;
int f;
int n;
pointer p;
pointer q;
l= cur_val_level;a= arith_error;b= false;p= null;
/*1355:*/
#line 25965 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

restart:r= expr_none;e= 0;s= expr_none;t= 0;n= 0;
resume:if(s==expr_none)o= l;else o= int_val;
/*1357:*/
#line 25997 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 25998 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok==other_token+'(')
/*1360:*/
#line 26037 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{q= get_node(expr_node_size);link(q)= p;type(q)= l;
subtype(q)= 4*s+r;
expr_e_field(q)= e;expr_t_field(q)= t;expr_n_field(q)= n;
p= q;l= o;goto restart;
}

/*:1360*/
#line 26000 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
back_input();
if(o==int_val)scan_int();
else if(o==dimen_val)scan_normal_dimen;
else if(o==glue_val)scan_normal_glue();
else scan_mu_glue();
f= cur_val

/*:1357*/
#line 25968 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
found:/*1356:*/
#line 25979 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 25980 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok==other_token+'+')o= expr_add;
else if(cur_tok==other_token+'-')o= expr_sub;
else if(cur_tok==other_token+'*')o= expr_mult;
else if(cur_tok==other_token+'/')o= expr_div;
else{o= expr_none;
if(p==null)
{if(cur_cmd!=relax)back_input();
}
else if(cur_tok!=other_token+')')
{print_err("Missing ) inserted for expression");

help1("I was expecting to see `+', `-', `*', `/', or `)'. Didn't.");
back_error();
}
}

/*:1356*/
#line 25969 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
arith_error= b;
/*1362:*/
#line 26065 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((l==int_val)||(s> expr_sub))
{if((f> infinity)||(f<-infinity))num_error(f);
}
else if(l==dimen_val)
{if(abs(f)> max_dimen)num_error(f);
}
else{if((abs(width(f))> max_dimen)||
(abs(stretch(f))> max_dimen)||
(abs(shrink(f))> max_dimen))glue_error(f);
}

/*:1362*/
#line 25971 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
switch(s){/*1363:*/
#line 26087 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case expr_none:if((l>=glue_val)&&(o!=expr_none))
{t= new_spec(f);delete_glue_ref(f);normalize_glue(t);
}
else t= f;break;

/*:1363*//*1367:*/
#line 26147 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case expr_mult:if(o==expr_div)
{n= f;o= expr_scale;
}
else if(l==int_val)t= mult_integers(t,f);
else if(l==dimen_val)expr_m(t);
else{expr_m(width(t));expr_m(stretch(t));expr_m(shrink(t));
}break;

/*:1367*//*1368:*/
#line 26160 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case expr_div:if(l<glue_val)expr_d(t);
else{expr_d(width(t));expr_d(stretch(t));expr_d(shrink(t));
}break;

/*:1368*//*1370:*/
#line 26190 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case expr_scale:if(l==int_val)t= fract(t,n,f,infinity);
else if(l==dimen_val)expr_s(t);
else{expr_s(width(t));expr_s(stretch(t));expr_s(shrink(t));
}

/*:1370*/
#line 25972 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
if(o> expr_sub)s= o;else/*1364:*/
#line 26099 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{s= expr_none;
if(r==expr_none)e= t;
else if(l==int_val)e= expr_add_sub(e,t,infinity);
else if(l==dimen_val)e= expr_a(e,t);
else/*1366:*/
#line 26126 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{width(e)= expr_a(width(e),width(t));
if(stretch_order(e)==stretch_order(t))
stretch(e)= expr_a(stretch(e),stretch(t));
else if((stretch_order(e)<stretch_order(t))&&(stretch(t)!=0))
{stretch(e)= stretch(t);stretch_order(e)= stretch_order(t);
}
if(shrink_order(e)==shrink_order(t))
shrink(e)= expr_a(shrink(e),shrink(t));
else if((shrink_order(e)<shrink_order(t))&&(shrink(t)!=0))
{shrink(e)= shrink(t);shrink_order(e)= shrink_order(t);
}
delete_glue_ref(t);normalize_glue(e);
}

/*:1366*/
#line 26104 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
r= o;
}

/*:1364*/
#line 25974 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
b= arith_error;
if(o!=expr_none)goto resume;
if(p!=null)/*1361:*/
#line 26044 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{f= e;q= p;
e= expr_e_field(q);t= expr_t_field(q);n= expr_n_field(q);
s= subtype(q)/4;r= subtype(q)%4;
l= type(q);p= link(q);free_node(q,expr_node_size);
goto found;
}

/*:1361*/
#line 25977 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1355*/
#line 25937 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(b)
{print_err("Arithmetic overflow");

help2("I can't evaluate this expression,",
"since the result is out of range.");
error();
if(l>=glue_val)
{delete_glue_ref(e);e= zero_glue;add_glue_ref(e);
}
else e= 0;
}
arith_error= a;cur_val= e;cur_val_level= l;
}

/*:1354*//*1359:*/
#line 26015 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_normal_glue(void)
{scan_glue(glue_val);
}

static void scan_mu_glue(void)
{scan_glue(mu_val);
}

/*:1359*/
#line 9599 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:456*//*458:*/
#line 9624 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer scan_rule_spec(void)
{
pointer q;
q= new_rule();
if(cur_cmd==vrule)width(q)= default_rule;
else{height(q)= default_rule;depth(q)= 0;
}
reswitch:if(scan_keyword("width"))

{scan_normal_dimen;width(q)= cur_val;goto reswitch;
}
if(scan_keyword("height"))

{scan_normal_dimen;height(q)= cur_val;goto reswitch;
}
if(scan_keyword("depth"))

{scan_normal_dimen;depth(q)= cur_val;goto reswitch;
}
return q;
}

/*:458*//*459:*/
#line 9662 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*1303:*/
#line 25336 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_general_text(void)
{
int s;
pointer w;
pointer d;
pointer p;
pointer q;
halfword unbalance;
s= scanner_status;w= warning_index;d= def_ref;
scanner_status= absorbing;warning_index= cur_cs;
def_ref= get_avail();token_ref_count(def_ref)= null;p= def_ref;
scan_left_brace();
unbalance= 1;
loop{get_token();
if(cur_tok<right_brace_limit)
if(cur_cmd<right_brace)incr(unbalance);
else{decr(unbalance);
if(unbalance==0)goto found;
}
store_new_token(cur_tok);
}
found:q= link(def_ref);free_avail(def_ref);
if(q==null)cur_val= temp_head;else cur_val= p;
link(temp_head)= q;
scanner_status= s;warning_index= w;def_ref= d;
}

/*:1303*//*1325:*/
#line 25506 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void pseudo_start(void)
{int old_setting;
str_number s;
pool_pointer l,m;
pointer p,q,r;
four_quarters w;
int nl,sz;
scan_general_text();
old_setting= selector;selector= new_string;
token_show(temp_head);selector= old_setting;
flush_list(link(temp_head));
str_room(1);s= make_string();
/*1326:*/
#line 25524 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

str_pool[pool_ptr]= ' ';l= str_start[s];
nl= new_line_char;
p= get_avail();q= p;
while(l<pool_ptr)
{m= l;
while((l<pool_ptr)&&(str_pool[l]!=nl))incr(l);
sz= (l-m+7)/4;
if(sz==1)sz= 2;
r= get_node(sz);link(q)= r;q= r;info(q)= hi(sz);
while(sz> 2)
{decr(sz);incr(r);
w.b0= qi(str_pool[m]);w.b1= qi(str_pool[m+1]);
w.b2= qi(str_pool[m+2]);w.b3= qi(str_pool[m+3]);
mem[r].qqqq= w;m= m+4;
}
w.b0= qi(' ');w.b1= qi(' ');w.b2= qi(' ');w.b3= qi(' ');
if(l> m)
{w.b0= qi(str_pool[m]);
if(l> m+1)
{w.b1= qi(str_pool[m+1]);
if(l> m+2)
{w.b2= qi(str_pool[m+2]);
if(l> m+3)w.b3= qi(str_pool[m+3]);
}
}
}
mem[r+1].qqqq= w;
if(str_pool[l]==nl)incr(l);
}
info(p)= link(p);link(p)= pseudo_files;pseudo_files= p

/*:1326*/
#line 25519 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
flush_string;
/*1327:*/
#line 25556 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

begin_file_reading();
line= 0;limit= start;loc= limit+1;
if(tracing_scan_tokens> 0)
{if(term_offset> max_print_line-3)print_ln();
else if((term_offset> 0)||(file_offset> 0))print_char(' ');
name= 19;print("( ");incr(open_parens);update_terminal;
}
else name= 18

/*:1327*/
#line 25521 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:1325*/
#line 9662 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer str_toks_cat(pool_pointer b,small_number cat)

{pointer p;
pointer q;
halfword t;
int save_chr;
pool_pointer k;
save_chr= cur_chr;
str_room(1);
p= temp_head;link(p)= null;k= b;
while(k<pool_ptr)
{k= utf8_get_cur_chr(str_pool,k,pool_ptr);
if(cur_chr==' '&&cat==0)t= space_token;
else if(cat==0)t= other_token+cur_chr;
else if(cat==active_char)
{if(cur_chr<utf8_single_size)t= cs_token_flag+active_base+cur_chr;
else t= cs_token_flag+active_lookup(cur_chr);
}
else t= cmd_token(cat)+cur_chr;
fast_store_new_token(t);
}
cur_chr= save_chr;
pool_ptr= b;return p;
}

static pointer str_toks(pool_pointer b)
{return str_toks_cat(b,0);
}


/*:459*//*460:*/
#line 9700 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer the_toks(void)
{
int old_setting;
pointer p,q,r;
pool_pointer b;
small_number c;
/*1308:*/
#line 25393 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(odd(cur_chr))
{c= cur_chr;scan_general_text();
if(c==1)return cur_val;
else{old_setting= selector;selector= new_string;b= pool_ptr;
p= get_avail();link(p)= link(temp_head);
token_show(p);flush_list(p);
selector= old_setting;return str_toks(b);
}

}

/*:1308*/
#line 9706 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
get_x_token();scan_something_internal(tok_val,false);
if(cur_val_level>=ident_val)/*461:*/
#line 9723 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{p= temp_head;link(p)= null;
if(cur_val_level==ident_val)store_new_token(cs_token_flag+cur_val)
else if(cur_val!=null)
{r= link(cur_val);
while(r!=null)
{fast_store_new_token(info(r));r= link(r);
}
}
return p;
}

/*:461*/
#line 9708 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{old_setting= selector;selector= new_string;b= pool_ptr;
switch(cur_val_level){
case int_val:print_int(cur_val);break;
case dimen_val:{print_scaled(cur_val);print("pt");
}break;
case glue_val:{print_spec(cur_val,"pt");delete_glue_ref(cur_val);
}break;
case mu_val:{print_spec(cur_val,"mu");delete_glue_ref(cur_val);
}
}
selector= old_setting;return str_toks(b);
}
}

/*:460*//*462:*/
#line 9737 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void ins_the_toks(void)
{link(garbage)= the_toks();ins_list(link(temp_head));
}

/*:462*//*465:*/
#line 9795 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void conv_toks(void)
{int old_setting;
int c;
small_number cat;
small_number save_scanner_status;
pool_pointer b;
int i,k,l;
pool_pointer m,n;
bool r;
str_number s,t;
cat= 0;c= cur_chr;/*466:*/
#line 9811 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(c){
case number_code:case roman_numeral_code:scan_int();break;
case string_code:case meaning_code:{save_scanner_status= scanner_status;
scanner_status= normal;get_token();scanner_status= save_scanner_status;
}break;
case font_name_code:scan_font_ident();break;
case job_name_code:if(job_name==0)open_log_file();break;

case Uchar_code:scan_char_num();break;
case Ucharcat_code:
{int saved_val;
scan_char_num();
saved_val= cur_val;
scan_int();
if(cur_val<left_brace||cur_val> active_char||
cur_val==out_param||cur_val==ignore)
{print_err("Invalid code (");print_int(cur_val);

print("), should be in the ranges 1..4, 6..8, 10..13");
help1("I'm going to use 12 instead of that illegal code value.");
error();cat= 12;
}
else
cat= cur_val;
cur_val= saved_val;
}break;

case eTeX_revision_code:do_nothing;break;
/*1446:*/
#line 27328 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case Prote_revision_code:do_nothing;break;

/*:1446*//*1482:*/
#line 27673 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case strcmp_code:{scan_general_x_text();toks_to_str();
s= info(garbage);flush_list(link(garbage));
scan_general_x_text();toks_to_str();
t= info(garbage);flush_list(link(garbage));
if((length(s)==0)&&(length(t)==0))cur_val= 0;
else if(length(s)==0)cur_val= -1;
else if(length(t)==0)cur_val= 1;
else{m= str_start[s];n= str_start[t];r= false;
while((!r)&&(m<str_start[s+1])&&(n<str_start[t+1])){
cur_val= str_pool[m]-str_pool[n];if(cur_val!=0)r= true;
incr(m);incr(n);
}
if(cur_val==0){if(length(s)!=length(t))
if(m!=str_start[s+1])cur_val= 1;else cur_val= -1;
}
else cur_val= cur_val/(double)abs(cur_val);
}
flush_string;flush_string;
}break;

/*:1482*//*1488:*/
#line 27728 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case creation_date_code:get_creation_date();break;

/*:1488*//*1500:*/
#line 27818 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_size_code:{scan_general_x_text();toks_to_str();
s= info(garbage);flush_list(link(garbage));str_to_name(s);
cur_val= -1;
cur_val= get_file_size();
flush_string;
}break;

/*:1500*//*1504:*/
#line 27850 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_mod_date_code:{scan_general_x_text();toks_to_str();
s= info(garbage);flush_list(link(garbage));str_to_name(s);
get_file_mod_date();
flush_string;
}break;

/*:1504*//*1508:*/
#line 27890 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_dump_code:{k= 0;l= 0;
if(scan_keyword("offset")){scan_int();
if(cur_val<0){print_err("Bad ");print_esc("filedump");

help2("I allow only nonnegative values here.",
"I changed this one to zero.");int_error(cur_val);
}
else k= cur_val;
}
if(scan_keyword("length")){scan_int();
if(cur_val<0){print_err("Bad ");print_esc("filedump");

help2("I allow only nonnegative values here.",
"I changed this one to zero.");int_error(cur_val);
}
else l= cur_val;
}
scan_general_x_text();toks_to_str();s= info(garbage);
flush_list(link(garbage));str_to_name(s);
flush_string;
}break;

/*:1508*//*1512:*/
#line 27958 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mdfive_sum_code:{r= scan_keyword("file");scan_general_x_text();
toks_to_str();s= info(garbage);flush_list(link(garbage));
l= get_md5_sum(s,r);
flush_string;
}break;

/*:1512*//*1534:*/
#line 28258 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_random_seed_code:{scan_int();random_seed= cur_val;
init_randoms();
}break;

/*:1534*//*1541:*/
#line 28334 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case uniform_deviate_code:{scan_int();
cur_val= unif_rand(cur_val);
}break;

/*:1541*//*1548:*/
#line 28415 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case normal_deviate_code:cur_val= norm_rand();

/*:1548*/
#line 9840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:466*/
#line 9805 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
old_setting= selector;selector= new_string;b= pool_ptr;
/*467:*/
#line 9843 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(c){
case number_code:print_int(cur_val);break;
case roman_numeral_code:print_roman_int(cur_val);break;
case string_code:if(cur_cs!=0)sprint_cs(cur_cs);
else print_utf8(cur_chr);break;
case meaning_code:print_meaning();break;
case font_name_code:{printn(font_name[cur_val]);
if(font_size[cur_val]!=font_dsize[cur_val])
{print(" at ");print_scaled(font_size[cur_val]);
print("pt");
}
}break;
case eTeX_revision_code:print(eTeX_revision);break;
case job_name_code:printn(job_name);break;
case Uchar_code:case Ucharcat_code:print_char(cur_val);break;
/*1447:*/
#line 27331 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case Prote_revision_code:print(Prote_revision);break;

/*:1447*//*1483:*/
#line 27694 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case strcmp_code:print_int(cur_val);break;

/*:1483*//*1489:*/
#line 27734 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case creation_date_code:for(k= 0;time_str[k]!='\0';k++)
print_char(time_str[k]);break;

/*:1489*//*1501:*/
#line 27826 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_size_code:if(cur_val!=-1)print_int(cur_val);break;

/*:1501*//*1505:*/
#line 27861 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_mod_date_code:for(k= 0;time_str[k]!='\0';k++)
print_char(time_str[k]);break;

/*:1505*//*1509:*/
#line 27918 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case file_dump_code:
{FILE*f= fopen((char*)name_of_file0,"rb");
if(f!=NULL){
fseek(f,k,SEEK_SET);
do{i= fgetc(f);if(i==EOF)break;
dig[0]= i%16;dig[1]= i/16;
print_the_digs(2);decr(l);
}while(!(feof(f)||(l==0)));
fclose(f);
}
}break;

/*:1509*//*1513:*/
#line 27969 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mdfive_sum_code:for(k= 0;k<l;k++)
{dig[0]= md5_digest[k]%16;dig[1]= md5_digest[k]/16;print_the_digs(2);
}break;

/*:1513*//*1535:*/
#line 28263 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_random_seed_code:print_int(random_seed);break;

/*:1535*//*1542:*/
#line 28339 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case uniform_deviate_code:print_int(cur_val);break;

/*:1542*//*1549:*/
#line 28418 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case normal_deviate_code:print_int(cur_val);

/*:1549*/
#line 9859 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:467*/
#line 9807 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
selector= old_setting;link(garbage)= str_toks_cat(b,cat);ins_list(link(temp_head));
}

/*:465*//*468:*/
#line 9886 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer scan_toks(bool macro_def,bool xpand)
{
halfword t;
halfword s;
pointer p;
pointer q;
halfword unbalance;
halfword hash_brace;
if(macro_def)scanner_status= defining;
else scanner_status= absorbing;
warning_index= cur_cs;def_ref= get_avail();token_ref_count(def_ref)= null;
p= def_ref;hash_brace= 0;t= zero_token;
if(macro_def)/*469:*/
#line 9907 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{loop{resume:get_token();
if(cur_tok<right_brace_limit)goto done1;
if(cur_cmd==mac_param)
/*471:*/
#line 9928 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{s= match_token+cur_chr;get_token();
if(cur_tok<left_brace_limit)
{hash_brace= cur_tok;
store_new_token(cur_tok);store_new_token(end_match_token);
goto done;
}
if(t==zero_token+9)
{print_err("You already have nine parameters");

help2("I'm going to ignore the # sign you just used,",
"as well as the token that followed it.");error();goto resume;
}
else{incr(t);
if(cur_tok!=t)
{print_err("Parameters must be numbered consecutively");

help2("I've inserted the digit you should have used after the #.",
"Type `1' to delete what you did use.");back_error();
}
cur_tok= s;
}
}

/*:471*/
#line 9913 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
store_new_token(cur_tok);
}
done1:store_new_token(end_match_token);
if(cur_cmd==right_brace)
/*470:*/
#line 9921 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Missing { inserted");incr(align_state);

help2("Where was the left brace? You said something like `\\def\\a}',",
"which I'm going to interpret as `\\def\\a{}'.");error();goto found;
}

/*:470*/
#line 9918 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
done:;}

/*:469*/
#line 9898 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else scan_left_brace();
/*472:*/
#line 9952 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

unbalance= 1;
loop{if(xpand)/*473:*/
#line 9969 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{loop{get_next();
if(cur_cmd>=call)
if(info(link(cur_chr))==protected_token)
{cur_cmd= relax;cur_chr= no_expand_flag;
}
if(cur_cmd<=max_command)goto done2;
if(cur_cmd!=the)expand();
else{q= the_toks();
if(link(temp_head)!=null)
{link(p)= link(temp_head);p= q;
}
}
}
done2:x_token();
}

/*:473*/
#line 9954 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else get_token();
if(cur_tok<right_brace_limit)
if(cur_cmd<right_brace)incr(unbalance);
else{decr(unbalance);
if(unbalance==0)goto found;
}
else if(cur_cmd==mac_param)
if(macro_def)/*474:*/
#line 9986 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{s= cur_tok;
if(xpand)get_x_token();else get_token();
if(cur_cmd!=mac_param)
if((cur_tok<=zero_token)||(cur_tok> t))
{print_err("Illegal parameter number in definition of ");

sprint_cs(warning_index);
help3("You meant to type ## instead of #, right?",
"Or maybe a } was forgotten somewhere earlier, and things",
"are all screwed up? I'm going to assume that you meant ##.");
back_error();cur_tok= s;
}
else cur_tok= out_param_token-'0'+cur_chr;
}

/*:474*/
#line 9962 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
store_new_token(cur_tok);
}

/*:472*/
#line 9900 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
found:scanner_status= normal;
if(hash_brace!=0)store_new_token(hash_brace);
return p;
}
/*1450:*/
#line 27354 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_general_x_text(void)
{pointer d;
d= def_ref;info(garbage)= scan_toks(false,true);
link(garbage)= def_ref;
def_ref= d;
}

/*:1450*//*1452:*/
#line 27371 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void toks_to_str(void)
{int old_setting;
old_setting= selector;selector= new_string;
token_show(link(garbage));selector= old_setting;
str_room(1);
info(garbage)= make_string();
}

/*:1452*/
#line 9905 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:468*//*477:*/
#line 10023 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void read_toks(int n,pointer r,halfword j)
{
pointer p;
pointer q;
int s;
small_number m;
scanner_status= defining;warning_index= r;
def_ref= get_avail();token_ref_count(def_ref)= null;
p= def_ref;
store_new_token(end_match_token);
if((n<0)||(n> 15))m= 16;else m= n;
s= align_state;align_state= 1000000;
do{/*478:*/
#line 10040 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

begin_file_reading();name= m+1;
if(read_open[m]==closed)/*479:*/
#line 10065 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(interaction> nonstop_mode)
if(n<0)prompt_input("")
else{wake_up_terminal;
print_ln();sprint_cs(r);prompt_input("=");n= -1;
}
else fatal_error("*** (cannot \\read from terminal in nonstop modes)")


/*:479*/
#line 10042 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(read_open[m]==just_open)/*480:*/
#line 10078 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(input_ln(&read_file[m],false))read_open[m]= normal;
else{a_close(&read_file[m]);read_open[m]= closed;
}

/*:480*/
#line 10043 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*481:*/
#line 10086 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(!input_ln(&read_file[m],true))
{a_close(&read_file[m]);read_open[m]= closed;
if(align_state!=1000000)
{runaway();
print_err("File ended within ");print_esc("read");

help1("This \\read has unbalanced braces.");
align_state= 1000000;limit= 0;error();
}
}
}

/*:481*/
#line 10044 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
limit= last;
if(end_line_char_inactive)decr(limit);
else buffer[limit]= end_line_char;
first= limit+1;loc= start;state= new_line;
/*1333:*/
#line 25616 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(j==1)
{while(loc<=limit)
{cur_chr= buffer[loc];incr(loc);
if(cur_chr==' ')cur_tok= space_token;
else cur_tok= cur_chr+other_token;
store_new_token(cur_tok);
}
goto done;
}

/*:1333*/
#line 10049 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
loop{get_token();
if(cur_tok==0)goto done;

if(align_state<1000000)
{do{get_token();}while(!(cur_tok==0));
align_state= 1000000;goto done;
}
store_new_token(cur_tok);
}
done:end_file_reading()

/*:478*/
#line 10035 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}while(!(align_state==1000000));
cur_val= def_ref;scanner_status= normal;align_state= s;
}

/*:477*//*489:*/
#line 10240 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void pass_text(void)
{
int l;
small_number save_scanner_status;
save_scanner_status= scanner_status;scanner_status= skipping;l= 0;
skip_line= line;
loop{get_next();
if(cur_cmd==fi_or_else)
{if(l==0)goto done;
if(cur_chr==fi_code)decr(l);
}
else if(cur_cmd==if_test)incr(l);
}
done:scanner_status= save_scanner_status;
if(tracing_ifs> 0)show_cur_cmd_chr();
}

/*:489*//*492:*/
#line 10280 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void change_if_limit(small_number l,pointer p)
{
pointer q;
if(p==cond_ptr)if_limit= l;
else{q= cond_ptr;
loop{if(q==null)confusion("if");

if(link(q)==p)
{type(q)= l;return;
}
q= link(q);
}
}
}

/*:492*//*493:*/
#line 10300 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void conditional(void)
{
bool b;
int r;
int m,n;
pointer p,q;
small_number save_scanner_status;
pointer save_cond_ptr;
small_number this_if;
bool is_unless;
if(tracing_ifs> 0)if(tracing_commands<=1)show_cur_cmd_chr();
/*490:*/
#line 10263 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{p= get_node(if_node_size);link(p)= cond_ptr;type(p)= if_limit;
subtype(p)= cur_if;if_line_field(p)= if_line;
cond_ptr= p;cur_if= cur_chr;if_limit= if_code;if_line= line;
}

/*:490*/
#line 10311 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;save_cond_ptr= cond_ptr;
is_unless= (cur_chr>=unless_code);this_if= cur_chr%unless_code;
/*496:*/
#line 10342 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(this_if){
case if_char_code:case if_cat_code:/*501:*/
#line 10417 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token_or_active_char;
if((cur_cmd> active_char)||(cur_chr> biggest_char))
{m= relax;n= biggest_char+1;
}
else{m= cur_cmd;n= cur_chr;
}
get_x_token_or_active_char;
if((cur_cmd> active_char)||(cur_chr> biggest_char))
{cur_cmd= relax;cur_chr= biggest_char+1;
}
if(this_if==if_char_code)b= (n==cur_chr);else b= (m==cur_cmd);
}

/*:501*/
#line 10344 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case if_int_code:case if_dim_code:/*498:*/
#line 10372 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(this_if==if_int_code)scan_int();else scan_normal_dimen;
n= cur_val;/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 10374 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if((cur_tok>=other_token+'<')&&(cur_tok<=other_token+'>'))
r= cur_tok-other_token;
else{print_err("Missing = inserted for ");

print_cmd_chr(if_test,this_if);
help1("I was expecting to see `<', `=', or `>'. Didn't.");
back_error();r= '=';
}
if(this_if==if_int_code)scan_int();else scan_normal_dimen;
switch(r){
case'<':b= (n<cur_val);break;
case'=':b= (n==cur_val);break;
case'>':b= (n> cur_val);
}
}

/*:498*/
#line 10345 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case if_odd_code:/*499:*/
#line 10391 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_int();b= odd(cur_val);
}

/*:499*/
#line 10346 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case if_vmode_code:b= (abs(mode)==vmode);break;
case if_hmode_code:b= (abs(mode)==hmode);break;
case if_mmode_code:b= (abs(mode)==mmode);break;
case if_inner_code:b= (mode<0);break;
case if_void_code:case if_hbox_code:
case if_vbox_code:/*500:*/
#line 10395 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_register_num();fetch_box(p);
if(this_if==if_void_code)b= (p==null);
else if(p==null)b= false;
else if(this_if==if_hbox_code)b= (type(p)==hlist_node);
else b= (type(p)==vlist_node);
}

/*:500*/
#line 10352 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case ifx_code:/*502:*/
#line 10438 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{save_scanner_status= scanner_status;scanner_status= normal;
get_next();n= cur_cs;p= cur_cmd;q= cur_chr;
get_next();if(cur_cmd!=p)b= false;
else if(cur_cmd<call)b= (cur_chr==q);
else/*503:*/
#line 10455 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{p= link(cur_chr);q= link(equiv(n));
if(p==q)b= true;
else{while((p!=null)&&(q!=null))
if(info(p)!=info(q))p= null;
else{p= link(p);q= link(q);
}
b= ((p==null)&&(q==null));
}
}

/*:503*/
#line 10443 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
scanner_status= save_scanner_status;
}

/*:502*/
#line 10353 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case if_eof_code:{scan_four_bit_int();b= (read_open[cur_val]==closed);
}break;
case if_true_code:b= true;break;
case if_false_code:b= false;break;
/*1338:*/
#line 25675 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_def_code:{save_scanner_status= scanner_status;
scanner_status= normal;
get_next();b= (cur_cmd!=undefined_cs);
scanner_status= save_scanner_status;
}break;

/*:1338*//*1339:*/
#line 25687 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_cs_code:{n= get_avail();p= n;
do{get_x_token();
if(cur_cs==0)store_new_token(cur_tok);
}while(!(cur_cs!=0));
if(cur_cmd!=end_cs_name)/*368:*/
#line 8134 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Missing ");print_esc("endcsname");print(" inserted");

help2("The control sequence marked <to be read again> should",
"not appear between \\csname and \\endcsname.");
back_error();
}

/*:368*/
#line 25692 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1340:*/
#line 25698 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

m= first;p= link(n);
while(p!=null)
{if(m>=max_buf_stack)
{max_buf_stack= m+1;
if(max_buf_stack==buf_size)
overflow("buffer size",buf_size);

}
buffer[m]= info(p)%cmd_factor;incr(m);p= link(p);
}
if(m==first)cur_cs= null_cs;
else if(m> first+1)
cur_cs= id_lookup(first,m-first);
else cur_cs= single_base+buffer[first]

/*:1340*/
#line 25693 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
flush_list(n);
b= (eq_type(cur_cs)!=undefined_cs);
}break;

/*:1339*//*1341:*/
#line 25717 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_font_char_code:{scan_font_ident();n= cur_val;scan_char_num();
if((font_bc[n]<=cur_val)&&(font_ec[n]>=cur_val))
b= char_exists(n,qi(cur_val));
else b= false;
}break;

/*:1341*//*1463:*/
#line 27477 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_incsname_code:b= (incsname_state> 0);break;

/*:1463*//*1465:*/
#line 27487 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_primitive_code:{do{get_token();}while(!(cur_tok!=space_token));
if((cur_cs!=0)&&(cur_cmd!=undefined_cs)&&(cur_cmd<call))b= true;else b= false;
}break;

/*:1465*/
#line 10358 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case if_case_code:/*504:*/
#line 10466 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_int();n= cur_val;
if(tracing_commands> 1)
{begin_diagnostic();print("{case ");print_int(n);print_char('}');
end_diagnostic(false);
}
while(n!=0)
{pass_text();
if(cond_ptr==save_cond_ptr)
if(cur_chr==or_code)decr(n);
else goto common_ending;
else if(cur_chr==fi_code)/*491:*/
#line 10269 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(if_stack[in_open]==cond_ptr)if_warning();

p= cond_ptr;if_line= if_line_field(p);
cur_if= subtype(p);if_limit= type(p);cond_ptr= link(p);
free_node(p,if_node_size);
}

/*:491*/
#line 10477 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
change_if_limit(or_code,save_cond_ptr);
return;
}

/*:504*/
#line 10359 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:496*/
#line 10313 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(is_unless)b= !b;
if(tracing_commands> 1)/*497:*/
#line 10362 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{begin_diagnostic();
if(b)print("{true}");else print("{false}");
end_diagnostic(false);
}

/*:497*/
#line 10315 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(b)
{change_if_limit(else_code,save_cond_ptr);
return;
}
/*495:*/
#line 10330 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

loop{pass_text();
if(cond_ptr==save_cond_ptr)
{if(cur_chr!=or_code)goto common_ending;
print_err("Extra ");print_esc("or");

help1("I'm ignoring this; it doesn't match any \\if.");
error();
}
else if(cur_chr==fi_code)/*491:*/
#line 10269 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(if_stack[in_open]==cond_ptr)if_warning();

p= cond_ptr;if_line= if_line_field(p);
cur_if= subtype(p);if_limit= type(p);cond_ptr= link(p);
free_node(p,if_node_size);
}

/*:491*/
#line 10339 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:495*/
#line 10320 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
common_ending:if(cur_chr==fi_code)/*491:*/
#line 10269 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(if_stack[in_open]==cond_ptr)if_warning();

p= cond_ptr;if_line= if_line_field(p);
cur_if= subtype(p);if_limit= type(p);cond_ptr= link(p);
free_node(p,if_node_size);
}

/*:491*/
#line 10321 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if_limit= fi_code;
}

/*:493*//*509:*/
#line 10594 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static bool quoted_filename,inside_quote;
static void begin_name(void)
{area_delimiter= 0;ext_delimiter= 0;quoted_filename= inside_quote= false;
}

/*:509*//*510:*/
#line 10605 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static bool more_name(uint32_t c)
{if(c==' '&&!inside_quote)return false;
else if(c=='"'){if(cur_length==0)quoted_filename= true;
inside_quote= !inside_quote;return true;}
else{str_room(1);append_char(c);
if(IS_DIR_SEP(c)){area_delimiter= cur_length;ext_delimiter= 0;}
else if(c=='.')ext_delimiter= cur_length;
return true;
}
}

/*:510*//*511:*/
#line 10619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void end_name(void)
{if(str_ptr+3> max_strings)
overflow("number of strings",max_strings-init_str_ptr);

if(area_delimiter==0)cur_area= empty_string;
else{cur_area= str_ptr;
str_start[str_ptr+1]= str_start[str_ptr]+area_delimiter;incr(str_ptr);
}
if(ext_delimiter==0)
{cur_ext= empty_string;cur_name= make_string();
}
else{cur_name= str_ptr;
str_start[str_ptr+1]= str_start[str_ptr]+ext_delimiter-area_delimiter-1;
incr(str_ptr);cur_ext= make_string();
}
}

/*:511*//*513:*/
#line 10656 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void pack_file_name(str_number n,str_number a,str_number e,char*f)
{int k;
UTF8_code c;
int j;
k= 0;
for(j= str_start[a];j<=str_start[a+1]-1;j++)append_to_name(str_pool[j])
for(j= str_start[n];j<=str_start[n+1]-1;j++)append_to_name(str_pool[j])
if(f==NULL)
for(j= str_start[e];j<=str_start[e+1]-1;j++)append_to_name(str_pool[j])
else
while(*f!=0)append_to_name(*f++)
if(k<=file_name_size)name_length= k;else name_length= file_name_size;
name_of_file[name_length+1]= 0;
}



/*:513*//*519:*/
#line 10710 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static str_number make_name_string(void)
{int k;
if((pool_ptr+name_length> pool_size)||(str_ptr==max_strings)||
(cur_length> 0))
return'?';
else{for(k= 1;k<=name_length;k++)append_char(name_of_file[k]);
return make_string();
}
}
static str_number a_make_name_string(alpha_file*f)
{return make_name_string();
}

#ifdef INIT
static str_number w_make_name_string(word_file*f)
{return make_name_string();
}
#endif
#line 10728 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:519*//*520:*/
#line 10748 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_file_name(void)
{
pool_pointer j,k;
int old_setting;
name_in_progress= true;begin_name();
/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 10753 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd==left_brace)
/*1770:*/
#line 33279 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{back_input();name_in_progress= false;
cur_cs= input_loc;
scan_general_x_text();
old_setting= selector;selector= new_string;
token_show(link(garbage));selector= old_setting;
/*1771:*/
#line 33300 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= j= str_start[str_ptr];k<pool_ptr;k++){
if(str_pool[k]!='"'){str_pool[j]= str_pool[k];incr(j);}
}
pool_ptr= j;

/*:1771*/
#line 33285 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

j= pool_ptr-1;while((j>=str_start[str_ptr])&&(area_delimiter==0))
{
if((str_pool[j]=='/'))
area_delimiter= j-str_start[str_ptr]+1;
if((ext_delimiter==0)&&(str_pool[j]=='.'))
ext_delimiter= j-str_start[str_ptr]+1;
decr(j);
}
flush_list(link(garbage));
goto done;
}

/*:1770*/
#line 10755 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

loop{if((cur_cmd==relax)||(cur_cmd> other_char)||(cur_chr> biggest_char))
{back_input();goto done;
}
#if 0





if(cur_chr==' '&&state!=token_list&&loc> limit)goto done;
#endif
#line 10767 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 if(!more_name(cur_chr))goto done;
get_x_token();
}
done:end_name();name_in_progress= false;
}

/*:520*//*523:*/
#line 10804 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void pack_job_name(char*s)

{cur_area= empty_string;cur_ext= empty_string;
cur_name= job_name;pack_cur_name(s);
}

/*:523*//*524:*/
#line 10821 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void prompt_file_name(char*s,char*e)
{
int k;
if(interaction==scroll_mode)wake_up_terminal;
if(strcmp(s,"input file name")==0)print_err("I can't find file `");

else print_err("I can't write on file `");

print_file_name(cur_name,cur_area,cur_ext);print("'.");
if(strcmp(e,".tex")==0)show_context();
print_nl("Please type another ");print(s);

if(interaction<scroll_mode)
fatal_error("*** (job aborted, file error in nonstop mode)");

clear_terminal;prompt_input(": ");/*525:*/
#line 10840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{
begin_name();k= first;
while((buffer[k]==' ')&&(k<last))incr(k);
loop{if(k==last)goto done;
if(!more_name(buffer[k]))goto done;
incr(k);
}
done:end_name();
}

/*:525*/
#line 10836 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
pack_cur_name(e);
}

/*:524*//*528:*/
#line 10860 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void open_log_file(void)
{int old_setting;
int k;
int l;
char months[]= " JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC";
old_setting= selector;
if(job_name==0)job_name= s_no(c_job_name?c_job_name:"texput");
pack_job_name(".fls");
recorder_change_filename((char*)name_of_file+1);

pack_job_name(".log");
while(!a_open_out(&log_file))/*529:*/
#line 10899 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{selector= term_only;
prompt_file_name("transcript file name",".log");
}

/*:529*/
#line 10871 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
log_name= a_make_name_string(&log_file);
selector= log_only;log_opened= true;
/*530:*/
#line 10904 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{wlog("%s",banner);
slow_print(format_ident);print("  ");
print_int(sys_day);print_char(' ');
for(k= 3*sys_month-2;k<=3*sys_month;k++)wlog("%c",months[k]);
print_char(' ');print_int(sys_year);print_char(' ');
print_two(sys_time/60);print_char(':');print_two(sys_time%60);
if(eTeX_ex)
{;wlog_cr;wlog("entering extended mode");
}
if(Prote_ex)
{;wlog_cr;wlog("entering Prote mode");
}
}

/*:530*/
#line 10874 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
input_stack[input_ptr]= cur_input;
print_nl("**");

l= input_stack[0].limit_field;
if(buffer[l]==end_line_char)decr(l);
for(k= 1;k<=l;k++)printn(buffer[k]);
print_ln();
selector= old_setting+2;
}

/*:528*//*531:*/
#line 10925 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void start_input(void)
{
scan_file_name();
pack_cur_name("");
loop{begin_file_reading();
if(kpse_in_name_ok((char*)name_of_file+1)&&a_open_in(&cur_file))goto done;
end_file_reading();
prompt_file_name("input file name",".tex");
}
done:name= a_make_name_string(&cur_file);
if(source_filename_stack[in_open]!=NULL)
free(source_filename_stack[in_open]);
source_filename_stack[in_open]= strdup((char*)name_of_file+1);
if(full_source_filename_stack[in_open]!=NULL)
free(full_source_filename_stack[in_open]);
full_source_filename_stack[in_open]= strdup(full_name_of_file);
if(job_name==0)
{if(c_job_name==NULL)job_name= cur_name;
else job_name= s_no(c_job_name);open_log_file();
}

if(term_offset+strlen(full_source_filename_stack[in_open])> max_print_line-2)
print_ln();
else if((term_offset> 0)||(file_offset> 0))print_char(' ');
print_char('(');incr(open_parens);
print(full_source_filename_stack[in_open]);update_terminal;
if(tracing_stack_levels> 0)
{int v;
begin_diagnostic();print_ln();
print_char('~');
v= input_ptr-1;
if(v<tracing_stack_levels)
while(v--> 0)print_char('.');
else print_char('~');
print("INPUT ");slow_print(cur_name);slow_print(cur_ext);print_ln();
end_diagnostic(false);
}
state= new_line;
if(name==str_ptr-1)
{flush_string;name= cur_name;
}
/*532:*/
#line 10975 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{line= 1;
if(input_ln(&cur_file,false))do_nothing;
firm_up_the_line();
if(end_line_char_inactive)decr(limit);
else buffer[limit]= end_line_char;
first= limit+1;loc= start;
}

/*:532*/
#line 10966 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:531*//*553:*/
#line 11490 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static internal_font_number read_font_info(str_number t,str_number nom,str_number aire,
str_number ext,
scaled s)
{
int k;
halfword lf,lh,bc,ec,nw,nh,nd,ni,nl,nk,ne,np;

internal_font_number f;
internal_font_number g;
eight_bits a,b,c,d;
four_quarters qw;scaled sw;
int bch_label;
int bchar;
scaled z;
int alpha;int beta;

g= null_font;
/*556:*/
#line 11596 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*559:*/
#line 11634 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{read_sixteen(lf);
fget;read_sixteen(lh);
fget;read_sixteen(bc);
fget;read_sixteen(ec);
if((bc> ec+1)||(ec> 255))abort;
if(bc> 255)
{bc= 1;ec= 0;
}
fget;read_sixteen(nw);
fget;read_sixteen(nh);
fget;read_sixteen(nd);
fget;read_sixteen(ni);
fget;read_sixteen(nl);
fget;read_sixteen(nk);
fget;read_sixteen(ne);
fget;read_sixteen(np);
if(lf!=6+lh+(ec-bc+1)+nw+nh+nd+ni+nl+nk+ne+np)abort;
if((nw==0)||(nh==0)||(nd==0)||(ni==0))abort;
}

/*:559*/
#line 11597 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*560:*/
#line 11661 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

lf= lf-6-lh;
if(np<7)lf= lf+7-np;
if((font_ptr==font_max)||(fmem_ptr+lf> font_mem_size))
/*561:*/
#line 11677 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{start_font_error_message;
print(" not loaded: Not enough room left");

help4("I'm afraid I won't be able to make use of this font,",
"because my memory for character-size data is too small.",
"If you're really stuck, ask a wizard to enlarge me.",
"Or maybe try `I\\font<same font id>=<name of loaded font>'.");
error();goto done;
}

/*:561*/
#line 11665 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
f= font_ptr+1;
char_base[f]= fmem_ptr-bc;
width_base[f]= char_base[f]+ec+1;
height_base[f]= width_base[f]+nw;
depth_base[f]= height_base[f]+nh;
italic_base[f]= depth_base[f]+nd;
lig_kern_base[f]= italic_base[f]+ni;
kern_base[f]= lig_kern_base[f]+nl-kern_base_offset;
exten_base[f]= kern_base[f]+kern_base_offset+nk;
param_base[f]= exten_base[f]+ne

/*:560*/
#line 11598 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*562:*/
#line 11690 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(lh<2)abort;
store_four_quarters(font_check[f]);
fget;read_sixteen(z);
fget;z= z*0400+fbyte;fget;z= (z*020)+(fbyte/020);
if(z<unity)abort;
while(lh> 2)
{fget;fget;fget;fget;decr(lh);
}
font_dsize[f]= z;
if(s!=-1000)
if(s>=0)z= s;
else z= xn_over_d(z,-s,1000);
font_size[f]= z;
}

/*:562*/
#line 11599 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*563:*/
#line 11706 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= fmem_ptr;k<=width_base[f]-1;k++)
{store_four_quarters(font_info[k].qqqq);
if((a>=nw)||(b/020>=nh)||(b%020>=nd)||
(c/4>=ni))abort;
switch(c%4){
case lig_tag:if(d>=nl)abort;break;
case ext_tag:if(d>=ne)abort;break;
case list_tag:/*564:*/
#line 11727 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{check_byte_range(d);
while(d<current_character_being_worked_on)
{qw= char_info(f,d);

if(char_tag(f,qw)!=list_tag)goto not_found;
d= qo(rem_byte(qw));
}
if(d==current_character_being_worked_on)abort;
not_found:;}

/*:564*/
#line 11714 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
default:do_nothing;
}
}

/*:563*/
#line 11600 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*565:*/
#line 11762 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{/*566:*/
#line 11772 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{alpha= 16;
while(z>=040000000)
{z= z/2;alpha= alpha+alpha;
}
beta= 256/alpha;alpha= alpha*z;
}

/*:566*/
#line 11763 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
for(k= width_base[f];k<=lig_kern_base[f]-1;k++)
store_scaled(font_info[k].sc);
if(font_info[width_base[f]].sc!=0)abort;
if(font_info[height_base[f]].sc!=0)abort;
if(font_info[depth_base[f]].sc!=0)abort;
if(font_info[italic_base[f]].sc!=0)abort;
}

/*:565*/
#line 11601 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*567:*/
#line 11786 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

bch_label= 077777;bchar= 256;
if(nl> 0)
{for(k= lig_kern_base[f];k<=kern_base[f]+kern_base_offset-1;k++)
{store_four_quarters(font_info[k].qqqq);
if(a> 128)
{if(256*c+d>=nl)abort;
if(a==255)if(k==lig_kern_base[f])bchar= b;
}
else{if(b!=bchar)check_existence(b);
if(c<128)check_existence(d)
else if(256*(c-128)+d>=nk)abort;
if(a<128)if(k-lig_kern_base[f]+a+1>=nl)abort;
}
}
if(a==255)bch_label= 256*c+d;
}
for(k= kern_base[f]+kern_base_offset;k<=exten_base[f]-1;k++)
store_scaled(font_info[k].sc);

/*:567*/
#line 11602 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*568:*/
#line 11806 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= exten_base[f];k<=param_base[f]-1;k++)
{store_four_quarters(font_info[k].qqqq);
if(a!=0)check_existence(a);
if(b!=0)check_existence(b);
if(c!=0)check_existence(c);
check_existence(d);
}

/*:568*/
#line 11603 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*569:*/
#line 11818 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{for(k= 1;k<=np;k++)
if(k==1)
{fget;sw= fbyte;if(sw> 127)sw= sw-256;
fget;sw= sw*0400+fbyte;fget;sw= sw*0400+fbyte;
fget;font_info[param_base[f]].sc= 
(sw*020)+(fbyte/020);
}
else store_scaled(font_info[param_base[f]+k-1].sc);
if(eof(tfm_file))abort;
for(k= np+1;k<=7;k++)font_info[param_base[f]+k-1].sc= 0;
}

/*:569*/
#line 11604 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*570:*/
#line 11838 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(np>=7)font_params[f]= np;else font_params[f]= 7;
hyphen_char[f]= default_hyphen_char;skew_char[f]= default_skew_char;
if(bch_label<nl)bchar_label[f]= bch_label+lig_kern_base[f];
else bchar_label[f]= non_address;
font_bchar[f]= qi(bchar);
font_false_bchar[f]= qi(bchar);
if(bchar<=ec)if(bchar>=bc)
{qw= char_info(f,bchar);
if(char_exists(f,bchar))font_false_bchar[f]= non_char;
}
font_name[f]= nom;
font_area[f]= aire;
font_bc[f]= bc;font_ec[f]= ec;font_glue[f]= null;
adjust(char_base);adjust(width_base);adjust(lig_kern_base);
adjust(kern_base);adjust(exten_base);
decr(param_base[f]);
fmem_ptr= fmem_ptr+lf;font_ptr= f;g= f;goto done;

/*:570*/
#line 11605 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:556*/
#line 11509 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
bad_tfm:/*555:*/
#line 11583 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

start_font_error_message;

print(" not loadable: Bad font file");
help5("I wasn't able to read the data for this font,",
"so I will ignore the font specification.",
"[Wizards can fix TFM files using TFtoPL/PLtoTF.]",
"You might try inserting a different font spec;",
"e.g., type `I\\font<same font id>=<substitute font name>'.");
error()



/*:555*/
#line 11510 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
done:if(tfm_file.f!=NULL)b_close(&tfm_file);
return g;
}

static void read_extended_font(internal_font_number g,str_number t,
str_number nom,str_number aire,
scaled s,char*path)
{/*1847:*/
#line 35232 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{hb_face_t*face;
hb_font_t*f;
ALLOCATE(x_font[g],1,x_font_info);
/*1848:*/
#line 35254 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int i;
int l;
x_font[g]->blob= NULL;
x_font[g]->sub= NULL;
x_font[g]->subset= NULL;
l= strlen(path);
for(i= 1;i<=font_ptr;i++)
if(i!=g&&length(font_area[i])==l&&str_eq_buf(font_area[i],(unsigned char*)path))
{font_area[g]= font_area[i];
if(x_font[i]!=NULL)
{x_font[g]->blob= x_font[i]->blob;
x_font[g]->subset= x_font[i]->subset;
break;
}
}
if(x_font[g]->blob==NULL)
{x_font[g]->blob= hb_blob_create_from_file(path);
if(x_font[g]->blob==NULL)fatal_error("Unable to open extended font file!");
font_name[g]= nom;
if(font_area[g]==0)
font_area[g]= s_no(path);
/*1841:*/
#line 35089 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(option_subset)
{x_font[g]->sub= hb_subset_input_create_or_fail();
if(x_font[g]->sub!=NULL)
{x_font[g]->subset= hb_subset_input_unicode_set(x_font[g]->sub);
hb_subset_input_set_flags(x_font[g]->sub,HB_SUBSET_FLAGS_NO_HINTING);
}
else
x_font[g]->subset= NULL;
if(x_font[g]->subset!=NULL)
hb_set_clear(x_font[g]->subset);
}
else x_font[g]->subset= NULL;


/*:1841*/
#line 35276 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
}

/*:1848*/
#line 35236 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

face= hb_face_create(x_font[g]->blob,f_index);
if(face==NULL)fatal_error("Unable to open extended font face!");
f= hb_font_create(face);
if(f==NULL)
fatal_error("Unable to open extended font!");
x_font[g]->f= f;
x_font[g]->i= f_index;
/*1853:*/
#line 35354 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{unsigned int designSize,minSize,maxSize,subFamilyID,nameCode;
scaled f_dsize;
hb_ot_layout_get_size_params(face,&designSize,&subFamilyID,
&nameCode,&minSize,&maxSize);
if(designSize==0)
f_dsize= 10*ONE;
else
f_dsize= (((designSize/72.0)*72.27)/10.0)*ONE+0.5;
font_dsize[g]= f_dsize;
}


/*:1853*/
#line 35244 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1852:*/
#line 35341 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(s<0)
{if(s==-1000)s= font_dsize[g];
else s= xn_over_d(font_dsize[g],-s,1000);
}
font_size[g]= s;
hb_font_set_scale(f,HB_FROM_SCALED(s),HB_FROM_SCALED(s));
hb_font_set_ptem(f,(72.0/72.27)*s/(double)ONE);


/*:1852*/
#line 35245 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:1847*/
#line 11518 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1839:*/
#line 34992 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(tracing_fonts> 0)
{begin_diagnostic();
print_nl(" -> ");
if(path!=NULL)
{print(path);
if(g==null_font)print_nl("Not loadable: font file not found");
}
else
print("no matching file found.");
if(g==null_font)print_nl("Font not found, using \"nullfont\"");
end_diagnostic(false);
}
#if 0
if(IS_X_FONT(g))
{int x_scale,y_scale;
unsigned int x_ppem,y_ppem;
hb_codepoint_t glyph,cp;
hb_glyph_extents_t e;
hb_font_t*f;
float x_ptem;
hb_position_t ax;

fprintf(stderr,"\n");
fprintf(stderr,"%s at %fpt\n",path,font_size[g]/(double)ONE);
f= x_font[g]->f;
hb_font_get_scale(f,&x_scale,&y_scale);
fprintf(stderr,"given scale %d/%d\n",x_scale,y_scale);
hb_font_get_ppem(f,&x_ppem,&y_ppem);
fprintf(stderr,"given ppem %d/%d\n",x_ppem,y_ppem);
x_ptem= hb_font_get_ptem(f);
fprintf(stderr,"given ptem %f\n",x_ptem);
{hb_set_t*uset= hb_set_create();
hb_face_t*face= hb_font_get_face(f);
hb_face_collect_unicodes(face,uset);
fprintf(stderr,"Unicode range %d - %d\n",hb_set_get_min(uset),hb_set_get_max(uset));
}
cp= 'A';/*1840:*/
#line 35040 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scaled h,d,w;
hb_font_get_nominal_glyph(f,cp,&glyph);
hb_font_get_glyph_extents(f,glyph,&e);
fprintf(stderr,"char= %c/%d id=%d\n",cp,cp,glyph);
fprintf(stderr,"\thb: height=y_bearing=%0.2fpt,  depth= %0.2fpt, bbox height= %0.2fpt\n",
HB_TO_PT(e.y_bearing),HB_TO_PT(-(e.height+e.y_bearing)),HB_TO_PT(e.height)
);
h= x_char_height(g,cp);
d= x_char_depth(g,cp);
fprintf(stderr,"\tft: height=0x%x (%0.2fpt), depth=0x%x (%0.2fpt)\n",
h,h/(double)ONE,d,d/(double)ONE
);
ax= hb_font_get_glyph_h_advance(f,glyph);
fprintf(stderr,"\thb: width=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
w= x_char_width(g,cp);
fprintf(stderr,"\tft: width=0x%x (%0.2fpt)\n",w,w/(double)ONE);
ax= e.width;
fprintf(stderr,"\thb: bbox width=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= e.x_bearing;
fprintf(stderr,"\thb: bbox x_bearing=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= hb_font_get_glyph_h_advance(f,glyph);
ax= e.x_bearing+e.width-ax;
if(ax<0)ax= 0;
fprintf(stderr,"\thb: italics=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= x_char_italic(g,cp);
fprintf(stderr,"\tft: italics=0x%x (%0.2fpt)\n",
ax,ax/(double)ONE);
}





/*:1840*/
#line 35029 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cp= 'g';/*1840:*/
#line 35040 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scaled h,d,w;
hb_font_get_nominal_glyph(f,cp,&glyph);
hb_font_get_glyph_extents(f,glyph,&e);
fprintf(stderr,"char= %c/%d id=%d\n",cp,cp,glyph);
fprintf(stderr,"\thb: height=y_bearing=%0.2fpt,  depth= %0.2fpt, bbox height= %0.2fpt\n",
HB_TO_PT(e.y_bearing),HB_TO_PT(-(e.height+e.y_bearing)),HB_TO_PT(e.height)
);
h= x_char_height(g,cp);
d= x_char_depth(g,cp);
fprintf(stderr,"\tft: height=0x%x (%0.2fpt), depth=0x%x (%0.2fpt)\n",
h,h/(double)ONE,d,d/(double)ONE
);
ax= hb_font_get_glyph_h_advance(f,glyph);
fprintf(stderr,"\thb: width=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
w= x_char_width(g,cp);
fprintf(stderr,"\tft: width=0x%x (%0.2fpt)\n",w,w/(double)ONE);
ax= e.width;
fprintf(stderr,"\thb: bbox width=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= e.x_bearing;
fprintf(stderr,"\thb: bbox x_bearing=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= hb_font_get_glyph_h_advance(f,glyph);
ax= e.x_bearing+e.width-ax;
if(ax<0)ax= 0;
fprintf(stderr,"\thb: italics=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= x_char_italic(g,cp);
fprintf(stderr,"\tft: italics=0x%x (%0.2fpt)\n",
ax,ax/(double)ONE);
}





/*:1840*/
#line 35030 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cp= 'T';/*1840:*/
#line 35040 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scaled h,d,w;
hb_font_get_nominal_glyph(f,cp,&glyph);
hb_font_get_glyph_extents(f,glyph,&e);
fprintf(stderr,"char= %c/%d id=%d\n",cp,cp,glyph);
fprintf(stderr,"\thb: height=y_bearing=%0.2fpt,  depth= %0.2fpt, bbox height= %0.2fpt\n",
HB_TO_PT(e.y_bearing),HB_TO_PT(-(e.height+e.y_bearing)),HB_TO_PT(e.height)
);
h= x_char_height(g,cp);
d= x_char_depth(g,cp);
fprintf(stderr,"\tft: height=0x%x (%0.2fpt), depth=0x%x (%0.2fpt)\n",
h,h/(double)ONE,d,d/(double)ONE
);
ax= hb_font_get_glyph_h_advance(f,glyph);
fprintf(stderr,"\thb: width=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
w= x_char_width(g,cp);
fprintf(stderr,"\tft: width=0x%x (%0.2fpt)\n",w,w/(double)ONE);
ax= e.width;
fprintf(stderr,"\thb: bbox width=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= e.x_bearing;
fprintf(stderr,"\thb: bbox x_bearing=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= hb_font_get_glyph_h_advance(f,glyph);
ax= e.x_bearing+e.width-ax;
if(ax<0)ax= 0;
fprintf(stderr,"\thb: italics=0x%x (%0.2fpt)\n",ax,HB_TO_PT(ax));
ax= x_char_italic(g,cp);
fprintf(stderr,"\tft: italics=0x%x (%0.2fpt)\n",
ax,ax/(double)ONE);
}





/*:1840*/
#line 35031 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


fprintf(stderr,"\n");
}
#endif
#line 35036 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1839*/
#line 11519 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

static void read_predefined_font(internal_font_number g)
{char*path;
str_number t;
pack_file_name(empty_string,font_area[g],empty_string,"");
path= (char*)name_of_file+1;
t= font_id_text(g);
read_extended_font(g,t,font_name[g],font_area[g],font_size[g],path);
}

/*:553*//*575:*/
#line 11928 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void char_warning(internal_font_number f,uint32_t c)
{int old_setting;
if(tracing_lost_chars> 0)
{old_setting= tracing_online;
if(eTeX_ex&&(tracing_lost_chars> 1))tracing_online= 1;
{begin_diagnostic();
print_nl("Missing character: There is no ");

print_utf8(c);print(" in font ");
slow_print(font_name[f]);print_char('!');end_diagnostic(false);
}
tracing_online= old_setting;
}
}

/*:575*//*576:*/
#line 11947 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_character(internal_font_number f,uint32_t c)
{
pointer p;
if(font_bc[f]<=c)if(font_ec[f]>=c)
if(char_exists(f,c))
{p= get_avail();font(p)= f;character(p)= c;
return p;
}
char_warning(f,c);
return null;
}

/*:576*//*585:*/
#line 12205 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*1258:*/
#line 24709 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void special_out(pointer p)
{pointer q,r;
int old_mode;

if(subtype(p)==latespecial_node)
{/*1261:*/
#line 24761 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= get_avail();info(q)= right_brace_token+'}';
r= get_avail();link(q)= r;info(r)= end_write_token;ins_list(q);
begin_token_list(write_tokens(p),write_text);
q= get_avail();info(q)= left_brace_token+'{';ins_list(q);


old_mode= mode;mode= 0;

cur_cs= write_loc;q= scan_toks(false,true);
get_token();if(cur_tok!=end_write_token)
/*1262:*/
#line 24776 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Unbalanced write command");

help2("On this page there's a \\write with fewer real {'s than }'s.",
"I can't handle that very well; good luck.");error();
do{get_token();
}while(!(cur_tok==end_write_token));
}

/*:1262*/
#line 24772 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
mode= old_mode;
end_token_list()

/*:1261*/
#line 24716 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
write_tokens(p)= def_ref;
}
}

/*:1258*//*1260:*/
#line 24734 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void write_out(pointer p)
{int old_setting;
int old_mode;
small_number j;
pointer q,r;
/*1261:*/
#line 24761 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= get_avail();info(q)= right_brace_token+'}';
r= get_avail();link(q)= r;info(r)= end_write_token;ins_list(q);
begin_token_list(write_tokens(p),write_text);
q= get_avail();info(q)= left_brace_token+'{';ins_list(q);


old_mode= mode;mode= 0;

cur_cs= write_loc;q= scan_toks(false,true);
get_token();if(cur_tok!=end_write_token)
/*1262:*/
#line 24776 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Unbalanced write command");

help2("On this page there's a \\write with fewer real {'s than }'s.",
"I can't handle that very well; good luck.");error();
do{get_token();
}while(!(cur_tok==end_write_token));
}

/*:1262*/
#line 24772 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
mode= old_mode;
end_token_list()

/*:1261*/
#line 24740 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
old_setting= selector;j= write_stream(p);
if(write_open[j])selector= j;
else{
if((j==17)&&(selector==term_and_log))selector= log_only;
print_nl("");
}
token_show(def_ref);print_ln();
flush_list(def_ref);selector= old_setting;
}

/*:1260*//*1263:*/
#line 24785 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static void out_what(pointer p)
{small_number j;
switch(subtype(p)){
case open_node:case write_node:case close_node:/*1264:*/
#line 24805 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(!doing_leaders)
{j= write_stream(p);
if(subtype(p)==write_node)write_out(p);
else{if(write_open[j])a_close(&write_file[j]);
if(subtype(p)==close_node)write_open[j]= false;
else if(j<16)
{cur_name= open_name(p);cur_area= open_area(p);
cur_ext= open_ext(p);
pack_cur_name(".tex");
while(!a_open_out(&write_file[j]))
prompt_file_name("output file name",".tex");
write_open[j]= true;
}
}
}

/*:1264*/
#line 24791 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case special_node:case latespecial_node:special_out(p);break;
case language_node:
case save_pos_code:do_nothing;break;
default:confusion("ext4");

}
}

/*:1263*/
#line 12205 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"



/*:585*//*586:*/
#line 12211 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void ship_out(pointer p)
{
execute_output(p);
flush_node_list(p);
}


/*:586*//*588:*/
#line 12264 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void scan_spec(group_code c,bool three_codes)

{
int s;
int spec_code;
if(three_codes)s= saved(0);
if(scan_keyword("to"))spec_code= exactly;

else if(scan_keyword("spread"))spec_code= additional;

else{spec_code= additional;cur_val= cur_hfactor= cur_vfactor= 0;
goto found;
}
scan_normal_dimen;
found:if(three_codes)
{saved(0)= s;incr(save_ptr);
}
saved(0)= spec_code;saved(1)= cur_val;
saved_hfactor(1)= cur_hfactor;
saved_vfactor(1)= cur_vfactor;
save_ptr= save_ptr+2;
new_save_level(c);scan_left_brace();
}

/*:588*//*592:*/
#line 12324 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer hpack(pointer p,scaled w,scaled hf,scaled vf,small_number m,bool keep_cs);

/*:592*//*609:*/
#line 12521 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#define vpack(...) vpackage(__VA_ARGS__, max_dimen) 
static pointer vpackage(pointer p,scaled h,scaled hf,scaled vf,small_number m,bool keep_cs,scaled l);

/*:609*//*610:*/
#line 12528 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void append_to_vlist(pointer b)
{bool height_known;
height_known= (type(b)==hlist_node||type(b)==vlist_node||
(type(b)==whatsit_node&&subtype(b)==hset_node));
if(prev_depth> ignore_depth&&height_known)
{scaled d;
pointer p;
{d= width(baseline_skip)-prev_depth-height(b);
if(d<line_skip_limit)p= new_param_glue(line_skip_code);
else{p= new_skip_param(baseline_skip_code);
width(temp_ptr)= d;
}
link(tail)= p;tail= p;
}
}else if(prev_depth<=unknown_depth||prev_depth> ignore_depth)
{pointer p;
p= new_baseline_node(baseline_skip,line_skip,line_skip_limit);
link(tail)= p;tail= p;
}
link(tail)= b;tail= b;
if(height_known)
prev_depth= depth(b);
else if(type(b)==whatsit_node&&
(subtype(b)==hpack_node||subtype(b)==vpack_node))
prev_depth= depth(b);
else if(type(b)==whatsit_node&&subtype(b)==image_node)
prev_depth= 0;
else
prev_depth= unknown_depth;
}

/*:610*//*617:*/
#line 12743 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_noad(void)
{pointer p;
p= get_node(noad_size);
type(p)= ord_noad;subtype(p)= normal;
mem[nucleus(p)].hh= empty_field;
mem[subscr(p)].hh= empty_field;
mem[supscr(p)].hh= empty_field;
return p;
}

/*:617*//*619:*/
#line 12806 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_style(small_number s)
{pointer p;
p= get_node(style_node_size);type(p)= style_node;
subtype(p)= s;width(p)= 0;depth(p)= 0;
return p;
}

/*:619*//*620:*/
#line 12823 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer new_choice(void)
{pointer p;
p= get_node(style_node_size);type(p)= choice_node;
subtype(p)= 0;
display_mlist(p)= null;text_mlist(p)= null;script_mlist(p)= null;
script_script_mlist(p)= null;
return p;
}

/*:620*//*624:*/
#line 12914 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void show_info(void)
{show_node_list(info(temp_ptr));
}

/*:624*//*635:*/
#line 13116 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer fraction_rule(scaled t)

{pointer p;
p= new_rule();height(p)= t;depth(p)= 0;return p;
}

/*:635*//*636:*/
#line 13126 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer overbar(pointer b,scaled k,scaled t)
{pointer p,q;
p= new_kern(k);link(p)= b;q= fraction_rule(t);link(q)= p;
p= new_kern(t);link(p)= q;return vpack(p,natural);
}

/*:636*//*637:*/
#line 13147 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*640:*/
#line 13217 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer char_box(internal_font_number f,int c)
{pointer b,p;
b= new_null_box();
if(IS_X_FONT(f))
{hb_codepoint_t glyph;
if(x_glyph(f,c,&glyph))
{scaled ph,pd;
width(b)= x_glyph_width(f,glyph)+x_glyph_italic(f,glyph);
x_glyph_height_depth(f,glyph,&ph,&pd);
height(b)= ph;
depth(b)= pd;
}
else
width(b)= height(b)= depth(b)= 0;
}
else
{width(b)= char_width(f,c)+char_italic(f,c);
height(b)= char_height(f,c);depth(b)= char_depth(f,c);
}
p= get_avail();character(p)= c;font(p)= f;list_ptr(b)= p;return b;
}

/*:640*//*642:*/
#line 13253 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void stack_into_box(pointer b,internal_font_number f,
quarterword c)
{pointer p;
p= char_box(f,c);link(p)= list_ptr(b);list_ptr(b)= p;
height(b)= height(p);
}

/*:642*//*643:*/
#line 13264 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled height_plus_depth(internal_font_number f,quarterword c)
{if(IS_X_FONT(f))
{scaled hc,dc;
x_char_height_depth(f,c,&hc,&dc);
return hc+dc;
}
else
return char_height(f,c)+char_depth(f,c);
}

/*:643*/
#line 13147 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer var_delimiter(pointer d,small_number s,scaled v)
{
pointer b;
internal_font_number f,g;
int c,x,y;
int m,n;
scaled u;
scaled w;
four_quarters q;
four_quarters r;
small_number z;
bool large_attempt;
f= null_font;w= 0;large_attempt= false;
z= small_fam(d);x= small_char(d);
loop{/*638:*/
#line 13180 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((z!=0)||(x!=min_quarterword))
{z= z+s+16;
do{z= z-16;g= fam_fnt(z);
if(g!=null_font)
/*639:*/
#line 13191 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{y= x;
if((qo(y)>=font_bc[g])&&(qo(y)<=font_ec[g]))
{resume:q= char_info(g,y);
if(char_exists(g,y))
{if(char_tag(g,q)==ext_tag)
{f= g;c= y;goto found;
}
u= height_plus_depth(g,y);
if(u> w)
{f= g;c= y;w= u;
if(u>=v)goto found;
}
if(char_tag(g,q)==list_tag)
{y= rem_byte(q);goto resume;
}
}
}
}

/*:639*/
#line 13187 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}while(!(z<16));
}

/*:638*/
#line 13163 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(large_attempt)goto found;
large_attempt= true;z= large_fam(d);x= large_char(d);
}
found:if(f!=null_font)
/*641:*/
#line 13243 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(char_tag(f,q)==ext_tag)
/*644:*/
#line 13275 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{b= new_null_box();
type(b)= vlist_node;
r= font_info[exten_base[f]+rem_byte(q)].qqqq;
/*645:*/
#line 13300 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

c= ext_rep(r);u= height_plus_depth(f,c);
w= 0;q= char_info(f,c);width(b)= char_width(f,c)+char_italic(f,c);
c= ext_bot(r);if(c!=min_quarterword)w= w+height_plus_depth(f,c);
c= ext_mid(r);if(c!=min_quarterword)w= w+height_plus_depth(f,c);
c= ext_top(r);if(c!=min_quarterword)w= w+height_plus_depth(f,c);
n= 0;
if(u> 0)while(w<v)
{w= w+u;incr(n);
if(ext_mid(r)!=min_quarterword)w= w+u;
}

/*:645*/
#line 13280 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
c= ext_bot(r);
if(c!=min_quarterword)stack_into_box(b,f,c);
c= ext_rep(r);
for(m= 1;m<=n;m++)stack_into_box(b,f,c);
c= ext_mid(r);
if(c!=min_quarterword)
{stack_into_box(b,f,c);c= ext_rep(r);
for(m= 1;m<=n;m++)stack_into_box(b,f,c);
}
c= ext_top(r);
if(c!=min_quarterword)stack_into_box(b,f,c);
depth(b)= w-height(b);
}

/*:644*/
#line 13246 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else b= char_box(f,c)

/*:641*/
#line 13168 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else{b= new_null_box();
width(b)= null_delimiter_space;
}
shift_amount(b)= half(height(b)-depth(b))-axis_height(s);
return b;
}

/*:637*//*646:*/
#line 13325 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer rebox(pointer b,scaled w)
{pointer p;
internal_font_number f;
scaled v;
if((width(b)!=w)&&(list_ptr(b)!=null))
{if(type(b)==vlist_node)b= hpack(b,natural);
p= list_ptr(b);
if((is_char_node(p))&&(link(p)==null))
{f= font(p);v= char_width(f,character(p));
if(v!=width(b))link(p)= new_kern(width(b)-v);
}
list_ptr(b)= null;flush_node_list(b);
b= new_glue(ss_glue);link(b)= p;
while(link(p)!=null)p= link(p);
link(p)= new_glue(ss_glue);
return hpack(b,w,0,0,exactly,false);
}
else{width(b)= w;return b;
}
}

/*:646*//*647:*/
#line 13351 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer math_glue(pointer g,scaled m)
{pointer p;
int n;
scaled f;
n= x_over_n(m,0200000);f= rem;
if(f<0)
{decr(n);f= f+0200000;
}
p= get_node(glue_spec_size);
width(p)= mu_mult(width(g));
stretch_order(p)= stretch_order(g);
if(stretch_order(p)==normal)stretch(p)= mu_mult(stretch(g));
else stretch(p)= stretch(g);
shrink_order(p)= shrink_order(g);
if(shrink_order(p)==normal)shrink(p)= mu_mult(shrink(g));
else shrink(p)= shrink(g);
return p;
}

/*:647*//*648:*/
#line 13373 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void math_kern(pointer p,scaled m)
{int n;
scaled f;
if(subtype(p)==mu_glue)
{n= x_over_n(m,0200000);f= rem;
if(f<0)
{decr(n);f= f+0200000;
}
width(p)= mu_mult(width(p));subtype(p)= explicit;
}
}

/*:648*//*649:*/
#line 13388 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void flush_math(void)
{flush_node_list(link(head));flush_node_list(incompleat_noad);
link(head)= null;tail= head;incompleat_noad= null;
}

/*:649*//*651:*/
#line 13425 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void mlist_to_hlist(void);
static pointer clean_box(pointer p,small_number s)
{
pointer q;
small_number save_style;
pointer x;
pointer r;
switch(math_type(p)){
case math_char:{cur_mlist= new_noad();mem[nucleus(cur_mlist)]= mem[p];
}break;
case sub_box:{q= info(p);goto found;
}
case sub_mlist:cur_mlist= info(p);break;
default:{q= new_null_box();goto found;
}
}
save_style= cur_style;cur_style= s;mlist_penalties= false;
mlist_to_hlist();q= link(temp_head);
cur_style= save_style;
/*634:*/
#line 13106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<script_style)cur_size= text_size;
else cur_size= 16*((cur_style-text_style)/2);
cur_mu= x_over_n(math_quad(cur_size),18);
}

/*:634*/
#line 13444 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
found:if(is_char_node(q)||(q==null))x= hpack(q,natural);
else if((link(q)==null)&&(type(q)<=vlist_node)&&(shift_amount(q)==0))
x= q;
else x= hpack(q,natural);
/*652:*/
#line 13455 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= list_ptr(x);
if(is_char_node(q))
{r= link(q);
if(r!=null)if(link(r)==null)if(!is_char_node(r))
if(type(r)==kern_node)
{free_node(r,small_node_size);link(q)= null;
}
}

/*:652*/
#line 13449 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
return x;
}

/*:651*//*653:*/
#line 13472 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void fetch(pointer a)
{cur_c= character(a);cur_f= fam_fnt(fam(a)+cur_size);
if(cur_f==null_font)
/*654:*/
#line 13492 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("");print_size(cur_size);print_char(' ');
print_int(fam(a));print(" is undefined (character ");
print_ASCII(qo(cur_c));print_char(')');
help4("Somewhere in the math formula just ended, you used the",
"stated character from an undefined font family. For example,",
"plain TeX doesn't allow \\it or \\sl in subscripts. Proceed,",
"and I'll try to forget that I needed that character.");
error();cur_i= null_character;math_type(a)= empty;
}

/*:654*/
#line 13475 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{if((qo(cur_c)>=font_bc[cur_f])&&(qo(cur_c)<=font_ec[cur_f]))
{if(needs_loading(cur_f))
{read_predefined_font(cur_f);
cur_i= null_character;
}
else
cur_i= char_info(cur_f,cur_c);
}
else cur_i= null_character;
if(!(char_exists(cur_f,cur_c)))
{char_warning(cur_f,qo(cur_c));
math_type(a)= empty;cur_i= null_character;
}
}
}

/*:653*//*657:*/
#line 13532 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*665:*/
#line 13692 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_over(pointer q)
{info(nucleus(q))= 
overbar(clean_box(nucleus(q),cramped_style(cur_style)),
3*default_rule_thickness,default_rule_thickness);
math_type(nucleus(q))= sub_box;
}

/*:665*//*666:*/
#line 13700 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_under(pointer q)
{pointer p,x,y;
scaled delta;
x= clean_box(nucleus(q),cur_style);
p= new_kern(3*default_rule_thickness);link(x)= p;
link(p)= fraction_rule(default_rule_thickness);
y= vpack(x,natural);
delta= height(y)+depth(y)+default_rule_thickness;
height(y)= height(x);depth(y)= delta-height(y);
info(nucleus(q))= y;math_type(nucleus(q))= sub_box;
}

/*:666*//*667:*/
#line 13713 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_vcenter(pointer q)
{pointer v;
scaled delta;
v= info(nucleus(q));
if(type(v)!=vlist_node&&
!(type(v)==whatsit_node&&(subtype(v)==vset_node||subtype(v)==vpack_node)))
confusion("vcenter");

delta= height(v)+depth(v);
height(v)= axis_height(cur_size)+half(delta);
depth(v)= delta-height(v);
}

/*:667*//*668:*/
#line 13736 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_radical(pointer q)
{pointer x,y;
scaled delta,clr;
x= clean_box(nucleus(q),cramped_style(cur_style));
if(cur_style<text_style)
clr= default_rule_thickness+(abs(math_x_height(cur_size))/4);
else{clr= default_rule_thickness;clr= clr+(abs(clr)/4);
}
y= var_delimiter(left_delimiter(q),cur_size,height(x)+depth(x)+clr+
default_rule_thickness);
delta= depth(y)-(height(x)+depth(x)+clr);
if(delta> 0)clr= clr+half(delta);
shift_amount(y)= -(height(x)+clr);
link(y)= overbar(x,clr,height(y));
info(nucleus(q))= hpack(y,natural);math_type(nucleus(q))= sub_box;
}

/*:668*//*669:*/
#line 13758 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_math_accent(pointer q)
{
pointer p,x,y;
int a;
quarterword c;
internal_font_number f;
four_quarters i;
scaled s;
scaled h;
scaled delta;
scaled w;
fetch(accent_chr(q));
if(char_exists(cur_f,cur_c))
{i= cur_i;c= cur_c;f= cur_f;
/*672:*/
#line 13805 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

s= 0;
if(math_type(nucleus(q))==math_char)
{fetch(nucleus(q));
if(char_tag(cur_f,cur_i)==lig_tag)
{a= lig_kern_start(cur_f,cur_i);
cur_i= font_info[a].qqqq;
if(skip_byte(cur_i)> stop_flag)
{a= lig_kern_restart(cur_f,cur_i);
cur_i= font_info[a].qqqq;
}
loop{if(qo(next_char(cur_i))==skew_char[cur_f])
{if(op_byte(cur_i)>=kern_flag)
if(skip_byte(cur_i)<=stop_flag)s= char_kern(cur_f,cur_i);
goto done1;
}
if(skip_byte(cur_i)>=stop_flag)goto done1;
a= a+qo(skip_byte(cur_i))+1;
cur_i= font_info[a].qqqq;
}
}
}
done1:

/*:672*/
#line 13773 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
x= clean_box(nucleus(q),cramped_style(cur_style));w= width(x);h= height(x);
/*671:*/
#line 13795 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

loop{if(char_tag(f,i)!=list_tag)goto done;
y= rem_byte(i);
i= char_info(f,y);
if(!char_exists(f,y))goto done;
if(char_width(f,y)> w)goto done;
c= y;
}
done:

/*:671*/
#line 13775 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(h<x_height(f))delta= h;else delta= x_height(f);
if((math_type(supscr(q))!=empty)||(math_type(subscr(q))!=empty))
if(math_type(nucleus(q))==math_char)
/*673:*/
#line 13829 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{flush_node_list(x);x= new_noad();
mem[nucleus(x)]= mem[nucleus(q)];
mem[supscr(x)]= mem[supscr(q)];
mem[subscr(x)]= mem[subscr(q)];
mem[supscr(q)].hh= empty_field;
mem[subscr(q)].hh= empty_field;
math_type(nucleus(q))= sub_mlist;info(nucleus(q))= x;
x= clean_box(nucleus(q),cur_style);delta= delta+height(x)-h;h= height(x);
}

/*:673*/
#line 13779 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
y= char_box(f,c);
shift_amount(y)= s+half(w-width(y));
width(y)= 0;p= new_kern(-delta);link(p)= x;link(y)= p;
y= vpack(y,natural);width(y)= width(x);
if(height(y)<h)/*670:*/
#line 13790 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{p= new_kern(h-height(y));link(p)= list_ptr(y);list_ptr(y)= p;
height(y)= h;
}

/*:670*/
#line 13784 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
info(nucleus(q))= y;
math_type(nucleus(q))= sub_box;
}
}

/*:669*//*674:*/
#line 13843 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_fraction(pointer q)
{pointer p,v,x,y,z;
scaled delta,delta1,delta2,shift_up,shift_down,clr;

if(thickness(q)==default_code)thickness(q)= default_rule_thickness;
/*675:*/
#line 13860 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

x= clean_box(numerator(q),num_style(cur_style));
z= clean_box(denominator(q),denom_style(cur_style));
if(width(x)<width(z))x= rebox(x,width(z));
else z= rebox(z,width(x));
if(cur_style<text_style)
{shift_up= num1(cur_size);shift_down= denom1(cur_size);
}
else{shift_down= denom2(cur_size);
if(thickness(q)!=0)shift_up= num2(cur_size);
else shift_up= num3(cur_size);
}

/*:675*/
#line 13851 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(thickness(q)==0)/*676:*/
#line 13877 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<text_style)clr= 7*default_rule_thickness;
else clr= 3*default_rule_thickness;
delta= half(clr-((shift_up-depth(x))-(height(z)-shift_down)));
if(delta> 0)
{shift_up= shift_up+delta;
shift_down= shift_down+delta;
}
}

/*:676*/
#line 13853 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*677:*/
#line 13890 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<text_style)clr= 3*thickness(q);
else clr= thickness(q);
delta= half(thickness(q));
delta1= clr-((shift_up-depth(x))-(axis_height(cur_size)+delta));
delta2= clr-((axis_height(cur_size)-delta)-(height(z)-shift_down));
if(delta1> 0)shift_up= shift_up+delta1;
if(delta2> 0)shift_down= shift_down+delta2;
}

/*:677*/
#line 13854 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*678:*/
#line 13900 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

v= new_null_box();type(v)= vlist_node;
height(v)= shift_up+height(x);depth(v)= depth(z)+shift_down;
width(v)= width(x);
if(thickness(q)==0)
{p= new_kern((shift_up-depth(x))-(height(z)-shift_down));
link(p)= z;
}
else{y= fraction_rule(thickness(q));
p= new_kern((axis_height(cur_size)-delta)-(height(z)-shift_down));
link(y)= p;link(p)= z;
p= new_kern((shift_up-depth(x))-(axis_height(cur_size)+delta));
link(p)= y;
}
link(x)= p;list_ptr(v)= x

/*:678*/
#line 13855 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*679:*/
#line 13916 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_style<text_style)delta= delim1(cur_size);
else delta= delim2(cur_size);
x= var_delimiter(left_delimiter(q),cur_size,delta);link(x)= v;
z= var_delimiter(right_delimiter(q),cur_size,delta);link(v)= z;
new_hlist(q)= hpack(x,natural)

/*:679*/
#line 13857 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:674*//*680:*/
#line 13938 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled make_op(pointer q)
{scaled delta;
pointer p,v,x,y,z;
quarterword c;four_quarters i;
scaled shift_up,shift_down;
if((subtype(q)==normal)&&(cur_style<text_style))
subtype(q)= limits;
if(math_type(nucleus(q))==math_char)
{fetch(nucleus(q));
if((cur_style<text_style)&&(char_tag(cur_f,cur_i)==list_tag))
{c= rem_byte(cur_i);i= char_info(cur_f,c);
if(char_exists(cur_f,c))
{cur_c= c;cur_i= i;character(nucleus(q))= c;
}
}
delta= char_italic(cur_f,cur_c);x= clean_box(nucleus(q),cur_style);
if((math_type(subscr(q))!=empty)&&(subtype(q)!=limits))
width(x)= width(x)-delta;
shift_amount(x)= half(height(x)-depth(x))-axis_height(cur_size);

math_type(nucleus(q))= sub_box;info(nucleus(q))= x;
}
else delta= 0;
if(subtype(q)==limits)
/*681:*/
#line 13970 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{x= clean_box(supscr(q),sup_style(cur_style));
y= clean_box(nucleus(q),cur_style);
z= clean_box(subscr(q),sub_style(cur_style));
v= new_null_box();type(v)= vlist_node;width(v)= width(y);
if(width(x)> width(v))width(v)= width(x);
if(width(z)> width(v))width(v)= width(z);
x= rebox(x,width(v));y= rebox(y,width(v));z= rebox(z,width(v));
shift_amount(x)= half(delta);shift_amount(z)= -shift_amount(x);
height(v)= height(y);depth(v)= depth(y);
/*682:*/
#line 13990 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(math_type(supscr(q))==empty)
{list_ptr(x)= null;flush_node_list(x);list_ptr(v)= y;
}
else{shift_up= big_op_spacing3-depth(x);
if(shift_up<big_op_spacing1)shift_up= big_op_spacing1;
p= new_kern(shift_up);link(p)= y;link(x)= p;
p= new_kern(big_op_spacing5);link(p)= x;list_ptr(v)= p;
height(v)= height(v)+big_op_spacing5+height(x)+depth(x)+shift_up;
}
if(math_type(subscr(q))==empty)
{list_ptr(z)= null;flush_node_list(z);}
else{shift_down= big_op_spacing4-height(z);
if(shift_down<big_op_spacing2)shift_down= big_op_spacing2;
p= new_kern(shift_down);link(y)= p;link(p)= z;
p= new_kern(big_op_spacing5);link(z)= p;
depth(v)= depth(v)+big_op_spacing5+height(z)+depth(z)+shift_down;
}

/*:682*/
#line 13981 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
new_hlist(q)= v;
}

/*:681*/
#line 13963 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
return delta;
}

/*:680*//*683:*/
#line 14019 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_ord(pointer q)
{
int a;
pointer p,r;
restart:
if(math_type(subscr(q))==empty)if(math_type(supscr(q))==empty)
if(math_type(nucleus(q))==math_char)
{p= link(q);
if(p!=null)if((type(p)>=ord_noad)&&(type(p)<=punct_noad))
if(math_type(nucleus(p))==math_char)
if(fam(nucleus(p))==fam(nucleus(q)))
{math_type(nucleus(q))= math_text_char;
fetch(nucleus(q));
if(char_tag(cur_f,cur_i)==lig_tag)
{a= lig_kern_start(cur_f,cur_i);
cur_c= character(nucleus(p));
cur_i= font_info[a].qqqq;
if(skip_byte(cur_i)> stop_flag)
{a= lig_kern_restart(cur_f,cur_i);
cur_i= font_info[a].qqqq;
}
loop{/*684:*/
#line 14062 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(next_char(cur_i)==cur_c)if(skip_byte(cur_i)<=stop_flag)
if(op_byte(cur_i)>=kern_flag)
{p= new_kern(char_kern(cur_f,cur_i));
link(p)= link(q);link(q)= p;return;
}
else{check_interrupt;
switch(op_byte(cur_i)){
case qi(1):case qi(5):character(nucleus(q))= rem_byte(cur_i);break;
case qi(2):case qi(6):character(nucleus(p))= rem_byte(cur_i);break;
case qi(3):case qi(7):case qi(11):{r= new_noad();
character(nucleus(r))= rem_byte(cur_i);
fam(nucleus(r))= fam(nucleus(q));
link(q)= r;link(r)= p;
if(op_byte(cur_i)<qi(11))math_type(nucleus(r))= math_char;
else math_type(nucleus(r))= math_text_char;
}break;
default:{link(q)= link(p);
character(nucleus(q))= rem_byte(cur_i);
mem[subscr(q)]= mem[subscr(p)];mem[supscr(q)]= mem[supscr(p)];
free_node(p,noad_size);
}
}
if(op_byte(cur_i)> qi(3))return;
math_type(nucleus(q))= math_char;goto restart;
}

/*:684*/
#line 14044 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(skip_byte(cur_i)>=stop_flag)return;
a= a+qo(skip_byte(cur_i))+1;
cur_i= font_info[a].qqqq;
}
}
}
}
}

/*:683*//*687:*/
#line 14144 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_scripts(pointer q,scaled delta)
{pointer p,x,y,z;
scaled shift_up,shift_down,clr;
small_number t;
p= new_hlist(q);
if(is_char_node(p))
{shift_up= 0;shift_down= 0;
}
else{z= hpack(p,natural);
if(cur_style<script_style)t= script_size;else t= script_script_size;
shift_up= height(z)-sup_drop(t);
shift_down= depth(z)+sub_drop(t);
list_ptr(z)= null;flush_node_list(z);
}
if(math_type(supscr(q))==empty)
/*688:*/
#line 14176 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{x= clean_box(subscr(q),sub_style(cur_style));
width(x)= width(x)+script_space;
if(shift_down<sub1(cur_size))shift_down= sub1(cur_size);
clr= height(x)-(abs(math_x_height(cur_size)*4)/5);
if(shift_down<clr)shift_down= clr;
shift_amount(x)= shift_down;
}

/*:688*/
#line 14160 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{/*689:*/
#line 14188 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{x= clean_box(supscr(q),sup_style(cur_style));
width(x)= width(x)+script_space;
if(odd(cur_style))clr= sup3(cur_size);
else if(cur_style<text_style)clr= sup1(cur_size);
else clr= sup2(cur_size);
if(shift_up<clr)shift_up= clr;
clr= depth(x)+(abs(math_x_height(cur_size))/4);
if(shift_up<clr)shift_up= clr;
}

/*:689*/
#line 14161 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(math_type(subscr(q))==empty)shift_amount(x)= -shift_up;
else/*690:*/
#line 14205 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{y= clean_box(subscr(q),sub_style(cur_style));
width(y)= width(y)+script_space;
if(shift_down<sub2(cur_size))shift_down= sub2(cur_size);
clr= 4*default_rule_thickness-
((shift_up-depth(x))-(height(y)-shift_down));
if(clr> 0)
{shift_down= shift_down+clr;
clr= (abs(math_x_height(cur_size)*4)/5)-(shift_up-depth(x));
if(clr> 0)
{shift_up= shift_up+clr;
shift_down= shift_down-clr;
}
}
shift_amount(x)= delta;
p= new_kern((shift_up-depth(x))-(height(y)-shift_down));link(x)= p;link(p)= y;
x= vpack(x,natural);shift_amount(x)= shift_down;
}

/*:690*/
#line 14164 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
if(new_hlist(q)==null)new_hlist(q)= x;
else{p= new_hlist(q);
while(link(p)!=null)p= link(p);
link(p)= x;
}
}

/*:687*//*693:*/
#line 14281 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static small_number make_left_right(pointer q,small_number style,
scaled max_d,scaled max_h)
{scaled delta,delta1,delta2;
cur_style= style;/*634:*/
#line 13106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<script_style)cur_size= text_size;
else cur_size= 16*((cur_style-text_style)/2);
cur_mu= x_over_n(math_quad(cur_size),18);
}

/*:634*/
#line 14285 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
delta2= max_d+axis_height(cur_size);
delta1= max_h+max_d-delta2;
if(delta2> delta1)delta1= delta2;
delta= (delta1/500)*delimiter_factor;
delta2= delta1+delta1-delimiter_shortfall;
if(delta<delta2)delta= delta2;
new_hlist(q)= var_delimiter(delimiter(q),cur_size,delta);
return type(q)-(left_noad-open_noad);
}

/*:693*/
#line 13532 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void mlist_to_hlist(void)
{

pointer mlist;
bool penalties;
small_number style;
small_number save_style;
pointer q;
pointer r;
small_number r_type;
small_number t;
pointer p,x,y,z;
int pen;
small_number s;
scaled max_h,max_d;
scaled delta;
mlist= cur_mlist;penalties= mlist_penalties;
style= cur_style;
q= mlist;r= null;r_type= op_noad;max_h= 0;max_d= 0;
/*634:*/
#line 13106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<script_style)cur_size= text_size;
else cur_size= 16*((cur_style-text_style)/2);
cur_mu= x_over_n(math_quad(cur_size),18);
}

/*:634*/
#line 13552 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
while(q!=null)/*658:*/
#line 13564 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{/*659:*/
#line 13583 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

reswitch:delta= 0;
switch(type(q)){
case bin_noad:switch(r_type){
case bin_noad:case op_noad:case rel_noad:
case open_noad:case punct_noad:case left_noad:
{type(q)= ord_noad;goto reswitch;
}
default:do_nothing;
}break;
case rel_noad:case close_noad:case punct_noad:
case right_noad:{
/*660:*/
#line 13606 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(r_type==bin_noad)type(r)= ord_noad

/*:660*/
#line 13595 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(type(q)==right_noad)goto done_with_noad;
}break;
/*664:*/
#line 13671 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case left_noad:goto done_with_noad;
case fraction_noad:{make_fraction(q);goto check_dimensions;
}
case op_noad:{delta= make_op(q);
if(subtype(q)==limits)goto check_dimensions;
}break;
case ord_noad:make_ord(q);break;
case open_noad:case inner_noad:do_nothing;break;
case radical_noad:make_radical(q);break;
case over_noad:make_over(q);break;
case under_noad:make_under(q);break;
case accent_noad:make_math_accent(q);break;
case vcenter_noad:make_vcenter(q);break;

/*:664*/
#line 13598 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*661:*/
#line 13609 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case style_node:{cur_style= subtype(q);
/*634:*/
#line 13106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<script_style)cur_size= text_size;
else cur_size= 16*((cur_style-text_style)/2);
cur_mu= x_over_n(math_quad(cur_size),18);
}

/*:634*/
#line 13611 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto done_with_node;
}
case choice_node:/*662:*/
#line 13630 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{switch(cur_style/2){
case 0:choose_mlist(display_mlist)break;
case 1:choose_mlist(text_mlist)break;
case 2:choose_mlist(script_mlist)break;
case 3:choose_mlist(script_script_mlist);
}
flush_node_list(display_mlist(q));
flush_node_list(text_mlist(q));
flush_node_list(script_mlist(q));
flush_node_list(script_script_mlist(q));
type(q)= style_node;subtype(q)= cur_style;width(q)= 0;depth(q)= 0;
if(p!=null)
{z= link(q);link(q)= p;
while(link(p)!=null)p= link(p);
link(p)= z;
}
goto done_with_node;
}

/*:662*/
#line 13615 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case ins_node:case mark_node:case adjust_node:
case whatsit_node:case penalty_node:
case disc_node:goto done_with_node;
case rule_node:{if(height(q)> max_h)max_h= height(q);
if(depth(q)> max_d)max_d= depth(q);goto done_with_node;
}
case glue_node:{/*663:*/
#line 13658 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(subtype(q)==mu_glue)
{x= glue_ptr(q);
y= math_glue(x,cur_mu);delete_glue_ref(x);glue_ptr(q)= y;
subtype(q)= normal;
}
else if((cur_size!=text_size)&&(subtype(q)==cond_math_glue))
{p= link(q);
if(p!=null)if((type(p)==glue_node)||(type(p)==kern_node))
{link(q)= link(p);link(p)= null;flush_node_list(p);
}
}

/*:663*/
#line 13622 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto done_with_node;
}
case kern_node:{math_kern(q,cur_mu);goto done_with_node;
}

/*:661*/
#line 13600 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:confusion("mlist1");

}
/*685:*/
#line 14101 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(math_type(nucleus(q))){
case math_char:case math_text_char:
/*686:*/
#line 14123 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{fetch(nucleus(q));
if(char_exists(cur_f,cur_c))
{delta= char_italic(cur_f,cur_c);p= new_character(cur_f,qo(cur_c));
if((math_type(nucleus(q))==math_text_char)&&(space(cur_f)!=0))
delta= 0;
if((math_type(subscr(q))==empty)&&(delta!=0))
{link(p)= new_kern(delta);delta= 0;
}
}
else p= null;
}

/*:686*/
#line 14106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case empty:p= null;break;
case sub_box:p= info(nucleus(q));break;
case sub_mlist:{cur_mlist= info(nucleus(q));save_style= cur_style;
mlist_penalties= false;mlist_to_hlist();

cur_style= save_style;/*634:*/
#line 13106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<script_style)cur_size= text_size;
else cur_size= 16*((cur_style-text_style)/2);
cur_mu= x_over_n(math_quad(cur_size),18);
}

/*:634*/
#line 14112 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= hpack(link(temp_head),natural);
}break;
default:confusion("mlist2");

}
new_hlist(q)= p;
if((math_type(subscr(q))==empty)&&(math_type(supscr(q))==empty))
goto check_dimensions;
make_scripts(q,delta)

/*:685*/
#line 13604 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:659*/
#line 13567 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
check_dimensions:z= hpack(new_hlist(q),natural);
if(height(z)> max_h)max_h= height(z);
if(depth(z)> max_d)max_d= depth(z);
list_ptr(z)= null;flush_node_list(z);
done_with_noad:r= q;r_type= type(r);
if(r_type==right_noad)
{r_type= left_noad;cur_style= style;/*634:*/
#line 13106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<script_style)cur_size= text_size;
else cur_size= 16*((cur_style-text_style)/2);
cur_mu= x_over_n(math_quad(cur_size),18);
}

/*:634*/
#line 13574 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
done_with_node:q= link(q);
}

/*:658*/
#line 13555 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*660:*/
#line 13606 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(r_type==bin_noad)type(r)= ord_noad

/*:660*/
#line 13556 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*691:*/
#line 14230 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= temp_head;link(p)= null;q= mlist;r_type= 0;cur_style= style;
/*634:*/
#line 13106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<script_style)cur_size= text_size;
else cur_size= 16*((cur_style-text_style)/2);
cur_mu= x_over_n(math_quad(cur_size),18);
}

/*:634*/
#line 14232 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
while(q!=null)
{/*692:*/
#line 14248 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

t= ord_noad;s= noad_size;pen= inf_penalty;
switch(type(q)){
case op_noad:case open_noad:case close_noad:
case punct_noad:case inner_noad:t= type(q);break;
case bin_noad:{t= bin_noad;pen= bin_op_penalty;
}break;
case rel_noad:{t= rel_noad;pen= rel_penalty;
}break;
case ord_noad:case vcenter_noad:case over_noad:
case under_noad:do_nothing;break;
case radical_noad:s= radical_noad_size;break;
case accent_noad:s= accent_noad_size;break;
case fraction_noad:s= fraction_noad_size;break;
case left_noad:case right_noad:t= make_left_right(q,style,max_d,max_h);break;
case style_node:/*694:*/
#line 14296 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{cur_style= subtype(q);s= style_node_size;
/*634:*/
#line 13106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_style<script_style)cur_size= text_size;
else cur_size= 16*((cur_style-text_style)/2);
cur_mu= x_over_n(math_quad(cur_size),18);
}

/*:634*/
#line 14298 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto delete_q;
}

/*:694*/
#line 14263 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case whatsit_node:case penalty_node:
case rule_node:case disc_node:case adjust_node:
case ins_node:case mark_node:
case glue_node:case kern_node:
{link(p)= q;p= q;q= link(q);link(p)= null;goto done;
}
default:confusion("mlist3");

}

/*:692*/
#line 14237 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*697:*/
#line 14334 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(r_type> 0)
{switch(math_spacing[r_type*8+t+magic_offset]){
case'0':x= 0;break;
case'1':if(cur_style<script_style)x= thin_mu_skip_code;else x= 0;break;
case'2':x= thin_mu_skip_code;break;
case'3':if(cur_style<script_style)x= med_mu_skip_code;else x= 0;break;
case'4':if(cur_style<script_style)x= thick_mu_skip_code;else x= 0;break;
default:confusion("mlist4");

}
if(x!=0)
{y= math_glue(glue_par(x),cur_mu);
z= new_glue(y);glue_ref_count(y)= null;link(p)= z;p= z;
subtype(z)= x+1;
}
}

/*:697*/
#line 14238 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*698:*/
#line 14356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(new_hlist(q)!=null)
{link(p)= new_hlist(q);
do{p= link(p);
}while(!(link(p)==null));
}
if(penalties)if(link(q)!=null)if(pen<inf_penalty)
{r_type= type(link(q));
if(r_type!=penalty_node)if(r_type!=rel_noad)
{z= new_penalty(pen);link(p)= z;p= z;
}
}

/*:698*/
#line 14239 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(type(q)==right_noad)t= open_noad;
r_type= t;
delete_q:r= q;q= link(q);free_node(r,s);
done:;}

/*:691*/
#line 13558 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:657*//*703:*/
#line 14545 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void push_alignment(void)
{pointer p;
p= get_node(align_stack_node_size);
link(p)= align_ptr;info(p)= cur_align;
llink(p)= preamble;rlink(p)= cur_span;
mem[p+2].i= cur_loop;mem[p+3].i= align_state;
info(p+4)= cur_head;link(p+4)= cur_tail;
align_ptr= p;
cur_head= get_avail();
}

static void pop_alignment(void)
{pointer p;
free_avail(cur_head);
p= align_ptr;
cur_tail= link(p+4);cur_head= info(p+4);
align_state= mem[p+3].i;cur_loop= mem[p+2].i;
cur_span= rlink(p);preamble= llink(p);
cur_align= info(p);align_ptr= link(p);
free_node(p,align_stack_node_size);
}

/*:703*//*705:*/
#line 14585 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*713:*/
#line 14698 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void get_preamble_token(void)
{
restart:get_token();
while((cur_chr==span_code)&&(cur_cmd==tab_mark))
{get_token();
if(cur_cmd> max_command)
{expand();get_token();
}
}
if(cur_cmd==endv)
fatal_error("(interwoven alignment preambles are not allowed)");

if((cur_cmd==assign_glue)&&(cur_chr==glue_base+tab_skip_code))
{scan_optional_equals();scan_glue(glue_val);
if(global_defs> 0)geq_define(glue_base+tab_skip_code,glue_ref,cur_val);
else eq_define(glue_base+tab_skip_code,glue_ref,cur_val);
goto restart;
}
}

/*:713*/
#line 14585 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void align_peek(void);
static void normal_paragraph(void);
static void init_align(void)
{
pointer save_cs_ptr;
pointer p;
save_cs_ptr= cur_cs;
push_alignment();align_state= -1000000;
/*707:*/
#line 14618 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((mode==mmode)&&((tail!=head)||(incompleat_noad!=null)))
{print_err("Improper ");print_esc("halign");print(" inside $$'s");

help3("Displays can use special alignments (like \\eqalignno)",
"only if nothing but the alignment itself is between $$'s.",
"So I've deleted the formulas that preceded this alignment.");
error();flush_math();
}

/*:707*/
#line 14594 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
push_nest();
/*706:*/
#line 14609 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(mode==mmode)
{mode= -vmode;prev_depth= nest[nest_ptr-2].aux_field.sc;
}
else if(mode> 0)negate(mode)

/*:706*/
#line 14596 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
scan_spec(align_group,false);
/*708:*/
#line 14628 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

preamble= null;cur_align= align_head;cur_loop= null;scanner_status= aligning;
warning_index= save_cs_ptr;align_state= -1000000;

loop{/*709:*/
#line 14639 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link(cur_align)= new_param_glue(tab_skip_code);
cur_align= link(cur_align)

/*:709*/
#line 14632 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd==car_ret)goto done;
/*710:*/
#line 14643 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*714:*/
#line 14721 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= hold_head;link(p)= null;
loop{get_preamble_token();
if(cur_cmd==mac_param)goto done1;
if((cur_cmd<=car_ret)&&(cur_cmd>=tab_mark)&&(align_state==-1000000))
if((p==hold_head)&&(cur_loop==null)&&(cur_cmd==tab_mark)
)cur_loop= cur_align;
else{print_err("Missing # inserted in alignment preamble");

help3("There should be exactly one # between &'s, when an",
"\\halign or \\valign is being set up. In this case you had",
"none, so I've put one in; maybe that will work.");
back_error();goto done1;
}
else if((cur_cmd!=spacer)||(p!=hold_head))
{link(p)= get_avail();p= link(p);info(p)= cur_tok;
}
}
done1:

/*:714*/
#line 14644 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
link(cur_align)= new_null_box();cur_align= link(cur_align);
info(cur_align)= end_span;width(cur_align)= null_flag;
u_part(cur_align)= link(hold_head);
/*715:*/
#line 14741 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= hold_head;link(p)= null;
loop{resume:get_preamble_token();
if((cur_cmd<=car_ret)&&(cur_cmd>=tab_mark)&&(align_state==-1000000))
goto done2;
if(cur_cmd==mac_param)
{print_err("Only one # is allowed per tab");

help3("There should be exactly one # between &'s, when an",
"\\halign or \\valign is being set up. In this case you had",
"more than one, so I'm ignoring all but the first.");
error();goto resume;
}
link(p)= get_avail();p= link(p);info(p)= cur_tok;
}
done2:link(p)= get_avail();p= link(p);
info(p)= end_template_token

/*:715*/
#line 14648 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
v_part(cur_align)= link(hold_head)

/*:710*/
#line 14635 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
done:scanner_status= normal

/*:708*/
#line 14598 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
new_save_level(align_group);
if(every_cr!=null)begin_token_list(every_cr,every_cr_text);
align_peek();
}

/*:705*//*717:*/
#line 14793 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*718:*/
#line 14806 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void init_span(pointer p)
{push_nest();
if(mode==-hmode)space_factor= 1000;
else{prev_depth= ignore_depth;normal_paragraph();
}
cur_span= p;
}

/*:718*/
#line 14793 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void init_row(void)
{push_nest();mode= (-hmode-vmode)-mode;
if(mode==-hmode)space_factor= 0;else prev_depth= 0;
tail_append(new_glue(glue_ptr(preamble)));
subtype(tail)= tab_skip_code+1;
cur_align= link(preamble);cur_tail= cur_head;init_span(cur_align);
}

/*:717*//*719:*/
#line 14822 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void init_col(void)
{extra_info(cur_align)= cur_cmd;
if(cur_cmd==omit)align_state= 0;
else{back_input();begin_token_list(u_part(cur_align),u_template);
}
}

/*:719*//*722:*/
#line 14859 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static bool fin_col(void)
{
pointer p;
pointer q,r;
pointer s;
pointer u;
scaled w;
glue_ord o;
halfword n;
if(cur_align==null)confusion("endv");
q= link(cur_align);if(q==null)confusion("endv");

if(align_state<500000)
fatal_error("(interwoven alignment preambles are not allowed)");

p= link(q);
/*723:*/
#line 14892 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((p==null)&&(extra_info(cur_align)<cr_code))
if(cur_loop!=null)/*724:*/
#line 14904 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{link(q)= new_null_box();p= link(q);
info(p)= end_span;width(p)= null_flag;cur_loop= link(cur_loop);
/*725:*/
#line 14913 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= hold_head;r= u_part(cur_loop);
while(r!=null)
{link(q)= get_avail();q= link(q);info(q)= info(r);r= link(r);
}
link(q)= null;u_part(p)= link(hold_head);
q= hold_head;r= v_part(cur_loop);
while(r!=null)
{link(q)= get_avail();q= link(q);info(q)= info(r);r= link(r);
}
link(q)= null;v_part(p)= link(hold_head)

/*:725*/
#line 14907 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
cur_loop= link(cur_loop);
link(p)= new_glue(glue_ptr(cur_loop));
subtype(link(p))= tab_skip_code+1;
}

/*:724*/
#line 14894 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{print_err("Extra alignment tab has been changed to ");

print_esc("cr");
help3("You have given more \\span or & marks than there were",
"in the preamble to the \\halign or \\valign now in progress.",
"So I'll assume that you meant to type \\cr instead.");
extra_info(cur_align)= cr_code;error();
}

/*:723*/
#line 14875 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(extra_info(cur_align)!=span_code)
{unsave();new_save_level(align_group);
/*727:*/
#line 14929 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(mode==-hmode)
{adjust_tail= cur_tail;u= hpack(link(head),natural);
if(type(u)==hlist_node)w= width(u);
else
#if 0
w= max_dimen+1;
#else
#line 14937 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 w= width(u);
#endif
#line 14939 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 cur_tail= adjust_tail;adjust_tail= null;
}
else{u= vpackage(link(head),natural,0);
if(type(u)==vlist_node)w= height(u);
else w= max_dimen+1;
}
n= min_quarterword;
if(cur_span!=cur_align)/*729:*/
#line 14979 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{q= cur_span;
do{incr(n);q= link(link(q));
}while(!(q==cur_align));
if(n> max_quarterword)confusion("256 spans");


q= cur_span;while(link(info(q))<n)q= info(q);
if(link(info(q))> n)
{s= get_node(span_node_size);info(s)= info(q);link(s)= n;
info(q)= s;width(s)= w;
}
else if(width(info(q))<w)width(info(q))= w;
}

/*:729*/
#line 14946 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(w> width(cur_align))width(cur_align)= w;
if(type(u)==whatsit_node)
{if(subtype(u)==hset_node||subtype(u)==vset_node)type(u)= unset_set_node;
else type(u)= unset_pack_node;
span_count(u)= n;
}
else if(type(u)==hlist_node||type(u)==vlist_node)
{type(u)= unset_node;span_count(u)= n;
/*601:*/
#line 12435 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(total_stretch[filll]!=0)o= filll;
else if(total_stretch[fill]!=0)o= fill;
else if(total_stretch[fil]!=0)o= fil;
else o= normal

/*:601*/
#line 14955 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
glue_order(u)= o;glue_stretch(u)= total_stretch[o];
/*606:*/
#line 12485 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(total_shrink[filll]!=0)o= filll;
else if(total_shrink[fill]!=0)o= fill;
else if(total_shrink[fil]!=0)o= fil;
else o= normal

/*:606*/
#line 14957 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
glue_sign(u)= o;glue_shrink(u)= total_shrink[o];
}
pop_nest();link(tail)= u;tail= u;
}

/*:727*/
#line 14878 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*726:*/
#line 14925 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

tail_append(new_glue(glue_ptr(link(cur_align))));
subtype(tail)= tab_skip_code+1

/*:726*/
#line 14879 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(extra_info(cur_align)>=cr_code)
{return true;
}
init_span(p);
}
align_state= 1000000;
do{get_x_or_protected();
}while(!(cur_cmd!=spacer));
cur_align= p;
init_col();return false;
}

/*:722*//*730:*/
#line 14999 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void fin_row(void)
{pointer p;
if(mode==-hmode)
{p= hpack(link(head),natural);
pop_nest();append_to_vlist(p);
if(cur_head!=cur_tail)
{link(tail)= link(cur_head);tail= cur_tail;
}
}
else{p= vpack(link(head),natural);pop_nest();
link(tail)= p;tail= p;space_factor= 1000;
}
type(p)= unset_node;glue_stretch(p)= 0;
if(every_cr!=null)begin_token_list(every_cr,every_cr_text);
align_peek();
}

/*:730*//*731:*/
#line 15020 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void do_assignments(void);
static void resume_after_display(void);
static void build_page(void);
static void fin_align(void)
{pointer p,q,r,s,u,v;
scaled t,w;
bool x= false;
scaled o;
halfword n;
scaled rule_save;
memory_word aux_save;
if(cur_group!=align_group)confusion("align1");

unsave();
if(cur_group!=align_group)confusion("align0");
unsave();
if(nest[nest_ptr-1].mode_field==mmode)o= display_indent;
else o= 0;
/*733:*/
#line 15089 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= link(preamble);
do{flush_list(u_part(q));flush_list(v_part(q));
p= link(link(q));
if(width(q)==null_flag)
/*734:*/
#line 15107 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{width(q)= 0;r= link(q);s= glue_ptr(r);
if(s!=zero_glue)
{add_glue_ref(zero_glue);delete_glue_ref(s);
glue_ptr(r)= zero_glue;
}
}

/*:734*/
#line 15094 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(info(q)!=end_span)
/*735:*/
#line 15122 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{t= width(q)+width(glue_ptr(link(q)));
r= info(q);s= end_span;info(s)= p;n= min_quarterword+1;
do{width(r)= width(r)-t;u= info(r);
while(link(r)> n)
{s= info(s);n= link(info(s))+1;
}
if(link(r)<n)
{info(r)= info(s);info(s)= r;decr(link(r));s= r;
}
else{if(width(r)> width(info(s)))width(info(s))= width(r);
free_node(r,span_node_size);
}
r= u;
}while(!(r==end_span));
}

/*:735*/
#line 15097 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
type(q)= unset_node;span_count(q)= min_quarterword;height(q)= 0;
depth(q)= 0;glue_order(q)= normal;glue_sign(q)= normal;
glue_stretch(q)= 0;glue_shrink(q)= 0;
#if 0 
if(width(q)> max_dimen)x= true;
#endif
#line 15104 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 q= p;
}while(!(q==null))

/*:733*/
#line 15039 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(x)
{/*732:*/
#line 15053 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

pointer r= get_node(align_node_size);
save_ptr= save_ptr-2;pack_begin_line= -mode_line;

type(r)= whatsit_node;subtype(r)= align_node;
align_preamble(r)= preamble;
align_list(r)= link(head);
align_extent(r)= new_xdimen(saved(1),saved_hfactor(1),saved_vfactor(1));
align_m(r)= saved(0);
align_v(r)= (mode!=-vmode);
link(head)= r;tail= r;
pack_begin_line= 0;

/*:732*/
#line 15041 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

pop_alignment();
}
else
{/*736:*/
#line 15145 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

save_ptr= save_ptr-2;pack_begin_line= -mode_line;
if(mode==-vmode)
{rule_save= overfull_rule;
overfull_rule= 0;
p= hpack(preamble,saved(1),saved_hfactor(1),saved_vfactor(1),saved(0),false);overfull_rule= rule_save;
}
else{q= link(preamble);
do{height(q)= width(q);width(q)= 0;q= link(link(q));
}while(!(q==null));
p= vpack(preamble,saved(1),saved_hfactor(1),saved_vfactor(1),saved(0),false);
q= link(preamble);
do{width(q)= height(q);height(q)= 0;q= link(link(q));
}while(!(q==null));
}
pack_begin_line= 0

/*:736*/
#line 15046 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*737:*/
#line 15162 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= link(head);s= head;
while(q!=null)
{if(!is_char_node(q))
if(type(q)==unset_node)
/*739:*/
#line 15187 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(mode==-vmode)
{type(q)= hlist_node;width(q)= width(p);
}
else{type(q)= vlist_node;height(q)= height(p);
}
glue_order(q)= glue_order(p);glue_sign(q)= glue_sign(p);
glue_set(q)= glue_set(p);shift_amount(q)= o;
r= link(list_ptr(q));s= link(list_ptr(p));
do{/*740:*/
#line 15206 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

n= span_count(r);t= width(s);w= t;u= hold_head;
while(n> min_quarterword)
{decr(n);
/*741:*/
#line 15223 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

s= link(s);v= glue_ptr(s);link(u)= new_glue(v);u= link(u);
subtype(u)= tab_skip_code+1;t= t+width(v);
if(glue_sign(p)==stretching)
{if(stretch_order(v)==glue_order(p))
t= t+round(unfix(glue_set(p))*stretch(v));

}
else if(glue_sign(p)==shrinking)
{if(shrink_order(v)==glue_order(p))
t= t-round(unfix(glue_set(p))*shrink(v));
}
s= link(s);link(u)= new_null_box();u= link(u);t= t+width(s);
if(mode==-vmode)width(u)= width(s);else
{type(u)= vlist_node;height(u)= width(s);
}

/*:741*/
#line 15211 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
if(mode==-vmode)
/*742:*/
#line 15240 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{height(r)= height(q);depth(r)= depth(q);
if(t==width(r))
{glue_sign(r)= normal;glue_order(r)= normal;
set_glue_ratio_zero(glue_set(r));
}
else if(t> width(r))
{glue_sign(r)= stretching;
if(glue_stretch(r)==0)set_glue_ratio_zero(glue_set(r));
else glue_set(r)= fix((t-width(r))/(double)glue_stretch(r));

}
else{glue_order(r)= glue_sign(r);glue_sign(r)= shrinking;
if(glue_shrink(r)==0)set_glue_ratio_zero(glue_set(r));
else if((glue_order(r)==normal)&&(width(r)-t> glue_shrink(r)))
set_glue_ratio_one(glue_set(r));
else glue_set(r)= fix((width(r)-t)/(double)glue_shrink(r));
}
width(r)= w;type(r)= hlist_node;
}

/*:742*/
#line 15215 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*743:*/
#line 15261 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{width(r)= width(q);
if(t==height(r))
{glue_sign(r)= normal;glue_order(r)= normal;
set_glue_ratio_zero(glue_set(r));
}
else if(t> height(r))
{glue_sign(r)= stretching;
if(glue_stretch(r)==0)set_glue_ratio_zero(glue_set(r));
else glue_set(r)= fix((t-height(r))/(double)glue_stretch(r));

}
else{glue_order(r)= glue_sign(r);glue_sign(r)= shrinking;
if(glue_shrink(r)==0)set_glue_ratio_zero(glue_set(r));
else if((glue_order(r)==normal)&&(height(r)-t> glue_shrink(r)))
set_glue_ratio_one(glue_set(r));
else glue_set(r)= fix((height(r)-t)/(double)glue_shrink(r));
}
height(r)= w;type(r)= vlist_node;
}

/*:743*/
#line 15217 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
shift_amount(r)= 0;
if(u!=hold_head)
{link(u)= link(r);link(r)= link(hold_head);r= u;
}

/*:740*/
#line 15196 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
r= link(link(r));s= link(link(s));
}while(!(r==null));
}

/*:739*/
#line 15167 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(type(q)==rule_node)
/*738:*/
#line 15174 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(is_running(width(q)))width(q)= width(p);
if(is_running(height(q)))height(q)= height(p);
if(is_running(depth(q)))depth(q)= depth(p);
if(o!=0)
{r= link(q);link(q)= null;q= hpack(q,natural);
shift_amount(q)= o;link(q)= r;link(s)= q;
}
}

/*:738*/
#line 15170 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
s= q;q= link(q);
}

/*:737*/
#line 15047 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
flush_node_list(p);pop_alignment();
}
/*744:*/
#line 15292 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

aux_save= aux;p= link(head);q= tail;pop_nest();
if(mode==mmode)/*1101:*/
#line 21540 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{do_assignments();
if(cur_cmd!=math_shift)/*1102:*/
#line 21563 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Missing $$ inserted");

help2("Displays can use special alignments (like \\eqalignno)",
"only if nothing but the alignment itself is between $$'s.");
back_error();
}

/*:1102*/
#line 21542 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*1098:*/
#line 21472 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();
if(cur_cmd!=math_shift)
{print_err("Display math should end with $$");

help2("The `$' that I just saw supposedly matches a previous `$$'.",
"So I shall assume that you typed `$$' both times.");
back_error();
}
}


/*:1098*/
#line 21543 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
pop_nest();
prev_depth= aux_save.sc;
tail_append(new_disp_node());
display_formula(tail)= vpack(p,natural);

link(temp_head)= null;
if(hang_indent!=0)
{new_param_node(dimen_type,hang_indent_code,hang_indent);
if(hang_after!=1)
new_param_node(int_type,hang_after_code,hang_after);
}
new_param_node(dimen_type,line_skip_limit_code,line_skip_limit);
new_param_node(glue_type,line_skip_code,line_skip);
new_param_node(glue_type,baseline_skip_code,baseline_skip);
display_params(tail)= link(temp_head);link(temp_head)= null;
display_no_bs(tail)= prev_depth<=ignore_depth;
resume_after_display();
}

/*:1101*/
#line 15294 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{aux= aux_save;link(tail)= p;
if(p!=null)tail= q;
if(mode==vmode)build_page();
}

/*:744*/
#line 15050 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
/*716:*/
#line 14769 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void align_peek(void)
{
restart:align_state= 1000000;
do{get_x_or_protected();
}while(!(cur_cmd!=spacer));
if(cur_cmd==no_align)
{scan_left_brace();new_save_level(no_align_group);
if(mode==-vmode)normal_paragraph();
}
else if(cur_cmd==right_brace)fin_align();
else if((cur_cmd==car_ret)&&(cur_chr==cr_cr_code))
goto restart;
else{init_row();
init_col();
}
}

/*:716*/
#line 15052 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:731*//*747:*/
#line 15356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*758:*/
#line 15593 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer finite_shrink(pointer p)
{pointer q;
if(no_shrink_error_yet)
{no_shrink_error_yet= false;
#ifdef STAT
if(tracing_paragraphs> 0)end_diagnostic(true);
#endif
#line 15601 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

print_err("Infinite glue shrinkage found in a paragraph");

help5("The paragraph just ended includes some glue that has",
"infinite shrinkability, e.g., `\\hskip 0pt minus 1fil'.",
"Such glue doesn't belong there---it allows a paragraph",
"of any length to fit on one line. But it's safe to proceed,",
"since the offensive shrinkability has been made finite.");
error();
#ifdef STAT
if(tracing_paragraphs> 0)begin_diagnostic();
#endif
#line 15613 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
q= new_spec(p);shrink_order(q)= normal;
delete_glue_ref(p);return q;
}

/*:758*//*761:*/
#line 15673 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void try_break(int pi,small_number break_type)
{
pointer r;
pointer prev_r;
halfword old_l;
bool no_break_yet;
/*762:*/
#line 15701 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

pointer prev_prev_r;
pointer s;
pointer q;
pointer v;
int t;
internal_font_number f;
halfword l;
bool node_r_stays_active;
scaled line_width;
int fit_class;
halfword b;
int d;
bool artificial_demerits;
#ifdef STAT
pointer save_link;
#endif
#line 15718 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 scaled shortfall;

/*:762*/
#line 15680 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*763:*/
#line 15720 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(abs(pi)>=inf_penalty)
if(pi> 0)goto end;
else pi= eject_penalty

/*:763*/
#line 15681 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
no_break_yet= true;prev_r= active;old_l= 0;
do_all_six(copy_to_cur_active);
loop{resume:r= link(prev_r);
/*764:*/
#line 15730 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


if(type(r)==delta_node)
{do_all_six(update_width);
prev_prev_r= prev_r;prev_r= r;goto resume;
}

/*:764*/
#line 15686 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*767:*/
#line 15778 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{l= line_number(r);
if(l> old_l)
{
if((minimum_demerits<awful_bad)&&
((old_l!=easy_line)||(r==last_active)))
/*768:*/
#line 15796 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(no_break_yet)/*769:*/
#line 15832 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{no_break_yet= false;do_all_six(set_break_width_to_background);
s= cur_p;
if(break_type> unhyphenated)if(cur_p!=null)
/*772:*/
#line 15875 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{t= replace_count(cur_p);v= cur_p;s= post_break(cur_p);
while(t> 0)
{decr(t);v= link(v);
/*773:*/
#line 15893 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(is_char_node(v))
{f= font(v);
break_width[1]= break_width[1]-char_width(f,character(v));
}
else switch(type(v)){
case ligature_node:{f= font(lig_char(v));
break_width[1]= break_width[1]-
char_width(f,character(lig_char(v)));
}break;
case hlist_node:case vlist_node:case rule_node:
case kern_node:
break_width[1]= break_width[1]-width(v);break;
default:confusion("disc1");

}

/*:773*/
#line 15879 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
while(s!=null)
{/*774:*/
#line 15910 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(is_char_node(s))
{f= font(s);
break_width[1]= break_width[1]+char_width(f,character(s));
}
else switch(type(s)){
case ligature_node:{f= font(lig_char(s));
break_width[1]= break_width[1]+
char_width(f,character(lig_char(s)));
}break;
case hlist_node:case vlist_node:case rule_node:
case kern_node:
break_width[1]= break_width[1]+width(s);break;
default:confusion("disc2");

}

/*:774*/
#line 15882 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
s= link(s);
}
break_width[1]= break_width[1]+disc_width;
if(post_break(cur_p)==null)s= link(v);

}

/*:772*/
#line 15836 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
while(s!=null)
{if(is_char_node(s))goto done;
switch(type(s)){
case glue_node:/*770:*/
#line 15851 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{v= glue_ptr(s);break_width[1]= break_width[1]-width(v);
break_width[2+stretch_order(v)]= break_width[2+stretch_order(v)]-stretch(v);
break_width[6]= break_width[6]-shrink(v);
}

/*:770*/
#line 15840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case penalty_node:do_nothing;break;
case math_node:break_width[1]= break_width[1]-width(s);break;
case kern_node:if(subtype(s)!=explicit)goto done;
else break_width[1]= break_width[1]-width(s);break;
default:goto done;
}
s= link(s);
}
done:;}

/*:769*/
#line 15797 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*775:*/
#line 15936 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(type(prev_r)==delta_node)
{do_all_six(convert_to_break_width);
}
else if(prev_r==active)
{do_all_six(store_break_width);
}
else{q= get_node(delta_node_size);link(q)= r;type(q)= delta_node;
subtype(q)= 0;
do_all_six(new_delta_to_break_width);
link(prev_r)= q;prev_prev_r= prev_r;prev_r= q;
}

/*:775*/
#line 15798 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(abs(adj_demerits)>=awful_bad-minimum_demerits)
minimum_demerits= awful_bad-1;
else minimum_demerits= minimum_demerits+abs(adj_demerits);
for(fit_class= very_loose_fit;fit_class<=tight_fit;fit_class++)
{if(minimal_demerits[fit_class]<=minimum_demerits)
/*777:*/
#line 15966 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{q= get_node(passive_node_size);
link(q)= passive;passive= q;cur_break(q)= cur_p;
#ifdef STAT
incr(pass_number);serial(q)= pass_number;
#endif
#line 15972 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

prev_break(q)= best_place[fit_class];
q= get_node(active_node_size);break_node(q)= passive;
line_number(q)= best_pl_line[fit_class]+1;
fitness(q)= fit_class;type(q)= break_type;
total_demerits(q)= minimal_demerits[fit_class];
link(q)= r;link(prev_r)= q;prev_r= q;
#ifdef STAT
if(tracing_paragraphs> 0)
/*778:*/
#line 15986 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_nl("@@");print_int(serial(passive));

print(": line ");print_int(line_number(q)-1);
print_char('.');print_int(fit_class);
if(break_type==hyphenated)print_char('-');
print(" t=");print_int(total_demerits(q));
print(" -> @@");
if(prev_break(passive)==null)print_char('0');
else print_int(serial(prev_break(passive)));
}

/*:778*/
#line 15981 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
#endif
#line 15983 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:777*/
#line 15804 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
minimal_demerits[fit_class]= awful_bad;
}
minimum_demerits= awful_bad;
/*776:*/
#line 15955 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(r!=last_active)
{q= get_node(delta_node_size);link(q)= r;type(q)= delta_node;
subtype(q)= 0;
do_all_six(new_delta_from_break_width);
link(prev_r)= q;prev_prev_r= prev_r;prev_r= q;
}

/*:776*/
#line 15808 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:768*/
#line 15784 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(r==last_active)goto end;
/*782:*/
#line 16062 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(l> easy_line)
{line_width= second_width;old_l= max_halfword-1;
}
else{old_l= l;
if(l> last_special_line)line_width= second_width;
else if(par_shape_ptr==null)line_width= first_width;
else line_width= mem[par_shape_ptr+2*l].sc;
}

/*:782*/
#line 15786 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}

/*:767*/
#line 15689 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*783:*/
#line 16082 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{artificial_demerits= false;

shortfall= line_width-cur_active_width[1];
if(shortfall> 0)
/*784:*/
#line 16112 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((cur_active_width[3]!=0)||(cur_active_width[4]!=0)||
(cur_active_width[5]!=0))
{b= 0;fit_class= decent_fit;
}
else{if(shortfall> 7230584)if(cur_active_width[2]<1663497)
{b= inf_bad;fit_class= very_loose_fit;goto done1;
}
b= badness(shortfall,cur_active_width[2]);
if(b> 12)
if(b> 99)fit_class= very_loose_fit;
else fit_class= loose_fit;
else fit_class= decent_fit;
done1:;
}

/*:784*/
#line 16088 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*785:*/
#line 16131 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(-shortfall> cur_active_width[6])b= inf_bad+1;
else b= badness(-shortfall,cur_active_width[6]);
if(b> 12)fit_class= tight_fit;else fit_class= decent_fit;
}

/*:785*/
#line 16090 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if((b> inf_bad)||(pi==eject_penalty))
/*786:*/
#line 16146 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(final_pass&&(minimum_demerits==awful_bad)&&
(link(r)==last_active)&&
(prev_r==active))
artificial_demerits= true;
else if(b> threshold)goto deactivate;
node_r_stays_active= false;
}

/*:786*/
#line 16093 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{prev_r= r;
if(b> threshold)goto resume;
node_r_stays_active= true;
}
/*787:*/
#line 16162 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(artificial_demerits)d= 0;
else/*791:*/
#line 16223 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{d= line_penalty+b;
if(abs(d)>=10000)d= 100000000;else d= d*d;
if(pi!=0)
if(pi> 0)d= d+pi*pi;
else if(pi> eject_penalty)d= d-pi*pi;
if((break_type==hyphenated)&&(type(r)==hyphenated))
if(cur_p!=null)d= d+double_hyphen_demerits;
else d= d+final_hyphen_demerits;
if(abs(fit_class-fitness(r))> 1)d= d+adj_demerits;
}

/*:791*/
#line 16164 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
#ifdef STAT
if(tracing_paragraphs> 0)
/*788:*/
#line 16178 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(printed_node!=cur_p)
/*789:*/
#line 16200 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_nl("");
if(cur_p==null)short_display(link(printed_node));
else{save_link= link(cur_p);
link(cur_p)= null;print_nl("");short_display(link(printed_node));
link(cur_p)= save_link;
}
printed_node= cur_p;
}

/*:789*/
#line 16180 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
print_nl("@");

if(cur_p==null)print_esc("par");
else if(type(cur_p)!=glue_node)
{if(type(cur_p)==penalty_node)print_esc("penalty");
else if(type(cur_p)==disc_node)print_esc("discretionary");
else if(type(cur_p)==kern_node)print_esc("kern");
else print_esc("math");
}
print(" via @@");
if(break_node(r)==null)print_char('0');
else print_int(serial(break_node(r)));
print(" b=");
if(b> inf_bad)print_char('*');else print_int(b);

print(" p=");print_int(pi);print(" d=");
if(artificial_demerits)print_char('*');else print_int(d);
}

/*:788*/
#line 16167 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
#endif
#line 16169 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

d= d+total_demerits(r);

if(d<=minimal_demerits[fit_class])
{minimal_demerits[fit_class]= d;
best_place[fit_class]= break_node(r);best_pl_line[fit_class]= l;
if(d<minimum_demerits)minimum_demerits= d;
}

/*:787*/
#line 16098 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(node_r_stays_active)goto resume;
deactivate:/*792:*/
#line 16245 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link(prev_r)= link(r);free_node(r,active_node_size);
if(prev_r==active)/*793:*/
#line 16270 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{r= link(active);
if(type(r)==delta_node)
{do_all_six(update_active);
do_all_six(copy_to_cur_active);
link(active)= link(r);free_node(r,delta_node_size);
}
}

/*:793*/
#line 16248 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(type(prev_r)==delta_node)
{r= link(prev_r);
if(r==last_active)
{do_all_six(downdate_width);
link(prev_prev_r)= last_active;
free_node(prev_r,delta_node_size);prev_r= prev_prev_r;
}
else if(type(r)==delta_node)
{do_all_six(update_width);
do_all_six(combine_two_deltas);
link(prev_r)= link(r);free_node(r,delta_node_size);
}
}

/*:792*/
#line 16100 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:783*/
#line 15692 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
end:;
#ifdef STAT
/*790:*/
#line 16215 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_p==printed_node)if(cur_p!=null)if(type(cur_p)==disc_node)
{t= replace_count(cur_p);
while(t> 0)
{decr(t);printed_node= link(printed_node);
}
}

/*:790*/
#line 15696 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
#endif
#line 15698 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:761*//*809:*/
#line 16599 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void post_line_break(int final_widow_penalty)
{
pointer q,r,s;
bool disc_break;
bool post_disc_break;
scaled cur_width;
scaled cur_indent;
quarterword t;
int pen;
halfword cur_line;
/*810:*/
#line 16632 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= break_node(best_bet);cur_p= null;
do{r= q;q= prev_break(q);next_break(r)= cur_p;cur_p= r;
}while(!(q==null))

/*:810*/
#line 16611 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
cur_line= prev_graf+1;
/*1596:*/
#line 29298 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_tos= null;
link_tos= null;

/*:1596*/
#line 16613 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{/*812:*/
#line 16669 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*813:*/
#line 16681 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= cur_break(cur_p);disc_break= false;post_disc_break= false;
if(q!=null)
if(type(q)==glue_node)
{delete_glue_ref(glue_ptr(q));
glue_ptr(q)= right_skip;
subtype(q)= right_skip_code+1;add_glue_ref(right_skip);
goto done;
}
else{if(type(q)==disc_node)
/*814:*/
#line 16700 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{t= replace_count(q);
/*815:*/
#line 16709 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(t==0)r= link(q);
else{r= q;
while(t> 1)
{r= link(r);decr(t);
}
s= link(r);
r= link(s);link(s)= null;
flush_node_list(link(q));set_replace_count(q,0);
}

/*:815*/
#line 16703 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(post_break(q)!=null)/*816:*/
#line 16723 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{s= post_break(q);
while(link(s)!=null)s= link(s);
link(s)= r;r= post_break(q);post_break(q)= null;post_disc_break= true;
}

/*:816*/
#line 16704 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(pre_break(q)!=null)/*817:*/
#line 16732 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{s= pre_break(q);link(q)= s;
while(link(s)!=null)s= link(s);
pre_break(q)= null;q= s;
}

/*:817*/
#line 16705 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
link(q)= r;disc_break= true;
}

/*:814*/
#line 16691 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if((type(q)==math_node)||(type(q)==kern_node))width(q)= 0;
}
else{q= temp_head;
while(link(q)!=null)q= link(q);
}
/*818:*/
#line 16738 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

r= new_param_glue(right_skip_code);link(r)= link(q);link(q)= r;q= r

/*:818*/
#line 16697 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
done:

/*:813*/
#line 16671 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*819:*/
#line 16745 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

r= link(q);link(q)= null;q= link(temp_head);link(temp_head)= r;
if(left_skip!=zero_glue)
{r= new_param_glue(left_skip_code);
link(r)= q;q= r;
}

/*:819*/
#line 16672 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*821:*/
#line 16764 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_line> last_special_line)
{cur_width= second_width;cur_indent= second_indent;
}
else if(par_shape_ptr==null)
{cur_width= first_width;cur_indent= first_indent;
}
else{cur_width= mem[par_shape_ptr+2*cur_line].sc;
cur_indent= mem[par_shape_ptr+2*cur_line-1].sc;
}
{pointer before_color_tos= color_tos;
pointer before_link_tos= link_tos;
adjust_tail= adjust_head;just_box= hpack(q,cur_width,0,0,exactly,true);
if(before_link_tos!=before_color_tos)
{pointer r;
r= new_color_node(color_ref(before_color_tos));
link(r)= list_ptr(just_box);
list_ptr(just_box)= r;
}
if(before_link_tos!=null)
{pointer r;
int words;
r= get_node(link_node_size);
for(words= 0;words<link_node_size;words++)
mem[r+words]= mem[before_link_tos+words];
if(label_has_name(as_label(r)))
add_token_ref(label_ptr(as_label(r)));
link(r)= list_ptr(just_box);
list_ptr(just_box)= r;
}
}
shift_amount(just_box)= cur_indent

/*:821*/
#line 16673 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*820:*/
#line 16752 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

append_to_vlist(just_box);
if(adjust_head!=adjust_tail)
{link(tail)= link(adjust_head);tail= adjust_tail;
}
adjust_tail= null

/*:820*/
#line 16675 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*822:*/
#line 16804 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_line+1!=best_line)
{pen= inter_line_penalty;
if(cur_line==prev_graf+1)pen= pen+club_penalty;
if(cur_line+2==best_line)pen= pen+final_widow_penalty;
if(disc_break)pen= pen+broken_penalty;
if(pen!=0)
{r= new_penalty(pen);
link(tail)= r;tail= r;
}
}

/*:822*/
#line 16676 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:812*/
#line 16615 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
incr(cur_line);cur_p= next_break(cur_p);
if(cur_p!=null)if(!post_disc_break)
/*811:*/
#line 16644 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{r= temp_head;
loop{q= link(r);
if(q==cur_break(cur_p))goto done1;


if(is_char_node(q))goto done1;
if(non_discardable(q))goto done1;
if(type(q)==kern_node)if(subtype(q)!=explicit)goto done1;
r= q;
}
done1:if(r!=temp_head)
{link(r)= null;flush_node_list(link(temp_head));
link(temp_head)= q;
}
}

/*:811*/
#line 16618 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}while(!(cur_p==null));
if((cur_line!=best_line)||(link(temp_head)!=null))
confusion("line breaking");

prev_graf= best_line-1;
}

/*:809*//*827:*/
#line 16936 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*838:*/
#line 17172 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static
small_number reconstitute(small_number j,small_number n,halfword bchar,halfword hchar)
{
pointer p;
pointer t;
four_quarters q;
halfword cur_rh;
halfword test_char;
scaled w;
font_index k;
hyphen_passed= 0;t= hold_head;w= 0;link(hold_head)= null;

/*840:*/
#line 17224 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_l= qi(hu[j]);cur_q= t;
if(j==0)
{ligature_present= init_lig;p= init_list;
if(ligature_present)lft_hit= init_lft;
while(p> null)
{append_charnode_to_t(character(p));p= link(p);
}
}
else if(cur_l<non_char)append_charnode_to_t(cur_l);
lig_stack= null;set_cur_r

/*:840*/
#line 17185 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
resume:/*841:*/
#line 17240 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_l==non_char)
{k= bchar_label[hf];
if(k==non_address)goto done;else q= font_info[k].qqqq;
}
else{q= char_info(hf,cur_l);
if(char_tag(hf,q)!=lig_tag)goto done;
k= lig_kern_start(hf,q);q= font_info[k].qqqq;
if(skip_byte(q)> stop_flag)
{k= lig_kern_restart(hf,q);q= font_info[k].qqqq;
}
}
if(cur_rh<non_char)test_char= cur_rh;else test_char= cur_r;
loop{if(next_char(q)==test_char)if(skip_byte(q)<=stop_flag)
if(cur_rh<non_char)
{hyphen_passed= j;hchar= non_char;cur_rh= non_char;
goto resume;
}
else{if(hchar<non_char)if(odd(hyf[j]))
{hyphen_passed= j;hchar= non_char;
}
if(op_byte(q)<kern_flag)
/*843:*/
#line 17303 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_l==non_char)lft_hit= true;
if(j==n)if(lig_stack==null)rt_hit= true;
check_interrupt;
switch(op_byte(q)){
case qi(1):case qi(5):{cur_l= rem_byte(q);
ligature_present= true;
}break;
case qi(2):case qi(6):{cur_r= rem_byte(q);
if(lig_stack> null)character(lig_stack)= cur_r;
else{lig_stack= new_lig_item(cur_r);
if(j==n)bchar= non_char;
else{p= get_avail();lig_ptr(lig_stack)= p;
character(p)= qi(hu[j+1]);font(p)= hf;
}
}
}break;
case qi(3):{cur_r= rem_byte(q);
p= lig_stack;lig_stack= new_lig_item(cur_r);link(lig_stack)= p;
}break;
case qi(7):case qi(11):{wrap_lig(false);
cur_q= t;cur_l= rem_byte(q);ligature_present= true;
}break;
default:{cur_l= rem_byte(q);ligature_present= true;
if(lig_stack> null)pop_lig_stack
else if(j==n)goto done;
else{append_charnode_to_t(cur_r);incr(j);set_cur_r;
}
}
}
if(op_byte(q)> qi(4))if(op_byte(q)!=qi(7))goto done;
goto resume;
}

/*:843*/
#line 17264 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
w= char_kern(hf,q);goto done;
}
if(skip_byte(q)>=stop_flag)
if(cur_rh==non_char)goto done;
else{cur_rh= non_char;goto resume;
}
k= k+qo(skip_byte(q))+1;q= font_info[k].qqqq;
}
done:

/*:841*/
#line 17187 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*842:*/
#line 17293 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

wrap_lig(rt_hit);
if(w!=0)
{link(t)= new_kern(w);t= link(t);w= 0;
}
if(lig_stack> null)
{cur_q= t;cur_l= character(lig_stack);ligature_present= true;
pop_lig_stack;goto resume;
}

/*:842*/
#line 17189 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
return j;
}

/*:838*/
#line 16937 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hyphenate(void)
{
/*833:*/
#line 17051 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

int i,j,l;
pointer q,r,s;
halfword bchar;

/*:833*//*844:*/
#line 17346 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

pointer major_tail,minor_tail;

uint32_t c;
int c_loc;
int r_count;
pointer hyf_node;

/*:844*//*854:*/
#line 17525 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

trie_pointer z;
int v;

/*:854*//*861:*/
#line 17597 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hyph_pointer h;
str_number k;
pool_pointer u;

/*:861*/
#line 16940 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*855:*/
#line 17534 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(j= 0;j<=hn;j++)hyf[j]= 0;
/*862:*/
#line 17606 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

h= hc[1];incr(hn);hc[hn]= cur_lang;
for(j= 2;j<=hn;j++)h= (h+h+hc[j])%hyph_size;
loop{/*863:*/
#line 17616 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

k= hyph_word[h];if(k==0)goto not_found;
if(length(k)<hn)goto not_found;
if(length(k)==hn)
{j= 1;u= str_start[k];
do{if(str_pool[u]<hc[j])goto not_found;
if(str_pool[u]> hc[j])goto done;
incr(j);incr(u);
}while(!(j> hn));
/*864:*/
#line 17630 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

s= hyph_list[h];
while(s!=null)
{hyf[info(s)]= 1;s= link(s);
}

/*:864*/
#line 17625 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
decr(hn);goto found;
}
done:

/*:863*/
#line 17611 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(h> 0)decr(h);else h= hyph_size;
}
not_found:decr(hn)

/*:862*/
#line 17537 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(trie_char(cur_lang+1)!=qi(cur_lang))return;
hc[0]= 0;hc[hn+1]= 0;hc[hn+2]= max_hyph_char;
for(j= 0;j<=hn-r_hyf+1;j++)
{z= trie_link(cur_lang+1)+hc[j];l= j;
while(hc[l]==qo(trie_char(z)))
{if(trie_op(z)!=min_quarterword)
/*856:*/
#line 17551 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{v= trie_op(z);
do{v= v+op_start[cur_lang];i= l-hyf_distance[v];
if(hyf_num[v]> hyf[i])hyf[i]= hyf_num[v];
v= hyf_next[v];
}while(!(v==min_quarterword));
}

/*:856*/
#line 17544 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
incr(l);z= trie_link(z)+hc[l];
}
}
found:for(j= 0;j<=l_hyf-1;j++)hyf[j]= 0;
for(j= 0;j<=r_hyf-1;j++)hyf[hn-j]= 0

/*:855*/
#line 16941 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*834:*/
#line 17063 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(j= l_hyf;j<=hn-r_hyf;j++)if(odd(hyf[j]))goto found1;
return;
found1:

/*:834*/
#line 16942 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*835:*/
#line 17079 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= link(hb);link(hb)= null;r= link(ha);link(ha)= null;bchar= hyf_bchar;
if(is_char_node(ha))
if(font(ha)!=hf)goto found2;
else{init_list= ha;init_lig= false;hu[0]= qo(character(ha));
}
else if(type(ha)==ligature_node)
if(font(lig_char(ha))!=hf)goto found2;
else{init_list= lig_ptr(ha);init_lig= true;init_lft= (subtype(ha)> 1);
hu[0]= qo(character(lig_char(ha)));
if(init_list==null)if(init_lft)
{hu[0]= max_hyph_char;init_lig= false;
}
free_node(ha,small_node_size);
}
else{
if(!is_char_node(r))if(type(r)==ligature_node)
if(subtype(r)> 1)goto found2;
j= 1;s= ha;init_list= null;goto common_ending;
}
s= cur_p;
while(link(s)!=ha)s= link(s);
j= 0;goto common_ending;
found2:s= ha;j= 0;hu[0]= max_hyph_char;init_lig= false;init_list= null;
common_ending:flush_node_list(r);
/*845:*/
#line 17356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{l= j;j= reconstitute(j,hn,bchar,qi(hyf_char))+1;
if(hyphen_passed==0)
{link(s)= link(hold_head);
while(link(s)> null)s= link(s);
if(odd(hyf[j-1]))
{l= j;hyphen_passed= j-1;link(hold_head)= null;
}
}
if(hyphen_passed> 0)
/*846:*/
#line 17381 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{r= get_node(small_node_size);
link(r)= link(hold_head);type(r)= disc_node;
major_tail= r;r_count= 0;
while(link(major_tail)> null)advance_major_tail;
i= hyphen_passed;hyf[i]= 0;
/*847:*/
#line 17398 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

minor_tail= null;pre_break(r)= null;hyf_node= new_character(hf,hyf_char);
if(hyf_node!=null)
{incr(i);c= hu[i];hu[i]= hyf_char;free_avail(hyf_node);
}
while(l<=i)
{l= reconstitute(l,i,font_bchar[hf],non_char)+1;
if(link(hold_head)> null)
{if(minor_tail==null)pre_break(r)= link(hold_head);
else link(minor_tail)= link(hold_head);
minor_tail= link(hold_head);
while(link(minor_tail)> null)minor_tail= link(minor_tail);
}
}
if(hyf_node!=null)
{hu[i]= c;
l= i;decr(i);
}

/*:847*/
#line 17387 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*848:*/
#line 17419 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

minor_tail= null;post_break(r)= null;c_loc= 0;
if(bchar_label[hf]!=non_address)
{decr(l);c= hu[l];c_loc= l;hu[l]= max_hyph_char;
}
while(l<j)
{do{l= reconstitute(l,hn,bchar,non_char)+1;
if(c_loc> 0)
{hu[c_loc]= c;c_loc= 0;
}
if(link(hold_head)> null)
{if(minor_tail==null)post_break(r)= link(hold_head);
else link(minor_tail)= link(hold_head);
minor_tail= link(hold_head);
while(link(minor_tail)> null)minor_tail= link(minor_tail);
}
}while(!(l>=j));
while(l> j)
/*849:*/
#line 17440 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{j= reconstitute(j,hn,bchar,non_char)+1;
link(major_tail)= link(hold_head);
while(link(major_tail)> null)advance_major_tail;
}

/*:849*/
#line 17437 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:848*/
#line 17389 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*850:*/
#line 17450 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(r_count> 127)
{link(s)= link(r);link(r)= null;flush_node_list(r);
}
else{link(s)= r;set_replace_count(r,r_count);set_auto_disc(r);
}
s= major_tail

/*:850*/
#line 17391 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
hyphen_passed= j-1;link(hold_head)= null;
}while(!(!odd(hyf[j-1])))

/*:846*/
#line 17367 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}while(!(j> hn));
link(s)= q

/*:845*/
#line 17104 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
flush_list(init_list)

/*:835*/
#line 16944 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:827*//*874:*/
#line 17772 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
/*876:*/
#line 17822 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static quarterword new_trie_op(small_number d,small_number n,quarterword v)
{
int h;
quarterword u;
int l;
h= abs(n+313*d+361*v+1009*cur_lang)%(trie_op_size+trie_op_size)
-trie_op_size;
loop{l= trie_op_hash[h];
if(l==0)
{if(trie_op_ptr==trie_op_size)
overflow("pattern memory ops",trie_op_size);
u= trie_used[cur_lang];
if(u==max_quarterword)
overflow("pattern memory ops per language",
max_quarterword-min_quarterword);
incr(trie_op_ptr);incr(u);trie_used[cur_lang]= u;
hyf_distance[trie_op_ptr]= d;
hyf_num[trie_op_ptr]= n;hyf_next[trie_op_ptr]= v;
trie_op_lang[trie_op_ptr]= cur_lang;trie_op_hash[h]= trie_op_ptr;
trie_op_val[trie_op_ptr]= u;return u;
}
if((hyf_distance[l]==d)&&(hyf_num[l]==n)&&(hyf_next[l]==v)
&&(trie_op_lang[l]==cur_lang))
{return trie_op_val[l];
}
if(h> -trie_op_size)decr(h);else h= trie_op_size;
}
}

/*:876*//*880:*/
#line 17924 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static trie_pointer trie_node(trie_pointer p)

{
trie_pointer h;
trie_pointer q;
h= abs(trie_c[p]+1009*trie_o[p]+
2718*trie_l[p]+3142*trie_r[p])%trie_size;
loop{q= trie_hash[h];
if(q==0)
{trie_hash[h]= p;return p;
}
if((trie_c[q]==trie_c[p])&&(trie_o[q]==trie_o[p])&&
(trie_l[q]==trie_l[p])&&(trie_r[q]==trie_r[p]))
{return q;
}
if(h> 0)decr(h);else h= trie_size;
}
}

/*:880*//*881:*/
#line 17950 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static trie_pointer compress_trie(trie_pointer p)
{if(p==0)return 0;
else{trie_l[p]= compress_trie(trie_l[p]);
trie_r[p]= compress_trie(trie_r[p]);
return trie_node(p);
}
}

/*:881*//*885:*/
#line 18024 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void first_fit(trie_pointer p)
{
trie_pointer h;
trie_pointer z;
trie_pointer q;
uint32_t c;
trie_pointer l,r;
int ll;
c= trie_c[p];
z= trie_min[c];
loop{h= z-c;
/*886:*/
#line 18050 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(trie_max<h+max_hyph_char)
{if(trie_size<=h+max_hyph_char)overflow("pattern memory",trie_size);

do{incr(trie_max);trie_taken[trie_max]= false;
trie_link(trie_max)= trie_max+1;trie_back(trie_max)= trie_max-1;
}while(!(trie_max==h+max_hyph_char));
}

/*:886*/
#line 18036 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(trie_taken[h])goto not_found;
/*887:*/
#line 18059 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= trie_r[p];
while(q> 0)
{if(trie_link(h+trie_c[q])==0)goto not_found;
q= trie_r[q];
}
goto found

/*:887*/
#line 18039 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
not_found:
z= trie_link(z);
}
found:/*888:*/
#line 18067 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

trie_taken[h]= true;trie_ref[p]= h;q= p;
do{
z= h+trie_c[q];l= trie_back(z);r= trie_link(z);
trie_back(r)= l;trie_link(l)= r;trie_link(z)= 0;
if(l<max_hyph_char)
{if(z<max_hyph_char)ll= z;else ll= max_hyph_char;
do{trie_min[l]= r;incr(l);

}while(!(l==ll));
}
q= trie_r[q];
}while(!(q==0))

/*:888*/
#line 18043 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:885*//*889:*/
#line 18084 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void trie_pack(trie_pointer p)
{trie_pointer q;
do{q= trie_l[p];
if((q> 0)&&(trie_ref[q]==0))
{first_fit(q);trie_pack(q);
}
p= trie_r[p];
}while(!(p==0));
}

/*:889*//*891:*/
#line 18121 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void trie_fix(trie_pointer p)
{trie_pointer q;
int c;
trie_pointer z;
z= trie_ref[p];
do{q= trie_l[p];c= trie_c[p];
trie_link(z+c)= trie_ref[q];trie_char(z+c)= qi(c);trie_op(z+c)= trie_o[p];
if(q> 0)trie_fix(q);
p= trie_r[p];
}while(!(p==0));
}

/*:891*//*892:*/
#line 18138 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_patterns(void)
{
int k,l;

bool digit_sensed;
quarterword v;
trie_pointer p,q;
bool first_child;
int c;
if(trie_not_ready)
{set_cur_lang;scan_left_brace();
/*893:*/
#line 18165 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

k= 0;hyf[0]= 0;digit_sensed= false;
pattern_warning_given= false;
loop{get_x_token();
switch(cur_cmd){
case letter:case other_char:/*895:*/
#line 18196 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(skip_pattern)break;
if(digit_sensed||(cur_chr<'0')||(cur_chr> '9'))
{if(cur_chr=='.')cur_chr= 0;
else{cur_chr= lc_code(cur_chr);
if(cur_chr==0)
{print_err("Nonletter");

help1("(See Appendix H.)");error();
}
}
if(cur_chr> max_pattern_char-1)
{if(!pattern_warning_given)
{print_err("Character code ");print_int(cur_chr);
print(" exceeds ");print_int(max_pattern_char-1);
pattern_warning_given= true;
}
skip_pattern= true;
k= 0;
break;
}
if(cur_chr> max_hyph_char)max_hyph_char= cur_chr;
if(k<max_hyph_length)
{incr(k);hc[k]= cur_chr;hyf[k]= 0;digit_sensed= false;
}
}
else if(k<max_hyph_length)
{hyf[k]= cur_chr-'0';digit_sensed= true;
}

/*:895*/
#line 18170 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case spacer:case right_brace:{if(k> 0)
/*896:*/
#line 18230 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{/*898:*/
#line 18258 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(hc[1]==0)hyf[0]= 0;
if(hc[k]==0)hyf[k]= 0;
l= k;v= min_quarterword;
loop{if(hyf[l]!=0)v= new_trie_op(k-l,hyf[l],v);
if(l> 0)decr(l);else goto done1;
}
done1:

/*:898*/
#line 18231 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
q= 0;hc[0]= cur_lang;
while(l<=k)
{c= hc[l];incr(l);p= trie_l[q];first_child= true;
while((p> 0)&&(c> trie_c[p]))
{q= p;p= trie_r[q];first_child= false;
}
if((p==0)||(c<trie_c[p]))
/*897:*/
#line 18250 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(trie_ptr==trie_size)overflow("pattern memory",trie_size);

incr(trie_ptr);trie_r[trie_ptr]= p;p= trie_ptr;trie_l[p]= 0;
if(first_child)trie_l[q]= p;else trie_r[q]= p;
trie_c[p]= c;trie_o[p]= min_quarterword;
}

/*:897*/
#line 18239 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
q= p;
}
if(trie_o[q]!=min_quarterword)
{print_err("Duplicate pattern");

help1("(See Appendix H.)");error();
}
trie_o[q]= v;
}

/*:896*/
#line 18172 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
skip_pattern= false;
if(cur_cmd==right_brace)goto done;
k= 0;hyf[0]= 0;digit_sensed= false;
}break;
default:{print_err("Bad ");print_esc("patterns");

help1("(See Appendix H.)");error();
}
}
}
done:

/*:893*/
#line 18151 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(saving_hyph_codes> 0)
/*1414:*/
#line 27050 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{c= cur_lang;first_child= false;p= 0;
do{q= p;p= trie_r[q];
}while(!((p==0)||(c<=trie_c[p])));
if((p==0)||(c<trie_c[p]))
/*897:*/
#line 18250 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(trie_ptr==trie_size)overflow("pattern memory",trie_size);

incr(trie_ptr);trie_r[trie_ptr]= p;p= trie_ptr;trie_l[p]= 0;
if(first_child)trie_l[q]= p;else trie_r[q]= p;
trie_c[p]= c;trie_o[p]= min_quarterword;
}

/*:897*/
#line 27055 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
q= p;
/*1415:*/
#line 27065 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= trie_l[q];first_child= true;
for(c= 0;c<=255;c++)
if((lc_code(c)> 0)||((c==255)&&first_child))
{if(p==0)
/*897:*/
#line 18250 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(trie_ptr==trie_size)overflow("pattern memory",trie_size);

incr(trie_ptr);trie_r[trie_ptr]= p;p= trie_ptr;trie_l[p]= 0;
if(first_child)trie_l[q]= p;else trie_r[q]= p;
trie_c[p]= c;trie_o[p]= min_quarterword;
}

/*:897*/
#line 27071 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else trie_c[p]= c;
trie_o[p]= qi(lc_code(c));
q= p;p= trie_r[q];first_child= false;
}
if(first_child)trie_l[q]= 0;else trie_r[q]= 0

/*:1415*/
#line 27057 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:1414*/
#line 18153 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
else{print_err("Too late for ");print_esc("patterns");
help1("All patterns must be given before typesetting begins.");
error();link(garbage)= scan_toks(false,false);flush_list(def_ref);
}
}

/*:892*//*899:*/
#line 18274 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void init_trie(void)
{int p;
int j,k,t;
int r,s;
two_halves h;

incr(max_hyph_char);
/*884:*/
#line 18008 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*877:*/
#line 17856 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

op_start[0]= -min_quarterword;
for(j= 1;j<=max_language;j++)op_start[j]= op_start[j-1]+qo(trie_used[j-1]);
for(j= 1;j<=trie_op_ptr;j++)
trie_op_hash[j]= op_start[trie_op_lang[j]]+trie_op_val[j];
for(j= 1;j<=trie_op_ptr;j++)while(trie_op_hash[j]> j)
{k= trie_op_hash[j];
t= hyf_distance[k];hyf_distance[k]= hyf_distance[j];hyf_distance[j]= t;
t= hyf_num[k];hyf_num[k]= hyf_num[j];hyf_num[j]= t;
t= hyf_next[k];hyf_next[k]= hyf_next[j];hyf_next[j]= t;
trie_op_hash[j]= trie_op_hash[k];trie_op_hash[k]= k;
}

/*:877*/
#line 18009 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
for(p= 0;p<=trie_size;p++)trie_hash[p]= 0;
hyph_root= compress_trie(hyph_root);
trie_root= compress_trie(trie_root);
for(p= 0;p<=trie_ptr;p++)trie_ref[p]= 0;
for(p= 0;p<=max_pattern_char;p++)trie_min[p]= p+1;
trie_link(0)= 1;trie_max= 0

/*:884*/
#line 18282 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(trie_root!=0)
{first_fit(trie_root);trie_pack(trie_root);
}
if(hyph_root!=0)/*1416:*/
#line 27081 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(trie_root==0)for(p= 0;p<=255;p++)trie_min[p]= p+2;
first_fit(hyph_root);trie_pack(hyph_root);
hyph_start= trie_ref[hyph_root];
}

/*:1416*/
#line 18286 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*890:*/
#line 18100 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

h.rh= 0;h.b0= min_quarterword;h.b1= min_quarterword;

if(trie_max==0)
{for(r= 0;r<=max_language+1;r++)trie[r]= h;
trie_max= max_language+1;
}
else{if(hyph_root> 0)trie_fix(hyph_root);
if(trie_root> 0)trie_fix(trie_root);
r= 0;
do{s= trie_link(r);trie[r]= h;r= s;
}while(!(r> trie_max));
}
trie_char(0)= qi('?');

/*:890*/
#line 18287 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
trie_not_ready= false;
}

/*:899*/
#line 17774 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#endif
#line 17776 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:874*/
#line 15356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void line_break(int final_widow_penalty)
{
/*794:*/
#line 16299 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

bool auto_breaking;
pointer prev_p;
pointer q,r,s;
internal_font_number f;

/*:794*/
#line 15359 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

pack_begin_line= mode_line;
/*748:*/
#line 15382 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link(temp_head)= link(head);
if(is_char_node(tail))tail_append(new_penalty(inf_penalty))
else if(type(tail)!=glue_node)tail_append(new_penalty(inf_penalty))
else{type(tail)= penalty_node;delete_glue_ref(glue_ptr(tail));
flush_node_list(leader_ptr(tail));penalty(tail)= inf_penalty;
}
link(tail)= new_param_glue(par_fill_skip_code);
init_cur_lang= prev_graf%0200000;
init_l_hyf= prev_graf/020000000;
init_r_hyf= (prev_graf/0200000)%0100;
pop_nest();

/*:748*//*759:*/
#line 15619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

no_shrink_error_yet= true;
check_shrinkage(left_skip);check_shrinkage(right_skip);
q= left_skip;r= right_skip;background[1]= width(q)+width(r);
background[2]= 0;background[3]= 0;background[4]= 0;background[5]= 0;
background[2+stretch_order(q)]= stretch(q);
background[2+stretch_order(r)]= background[2+stretch_order(r)]+stretch(r);
background[6]= shrink(q)+shrink(r);

/*:759*//*766:*/
#line 15764 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

minimum_demerits= awful_bad;
minimal_demerits[tight_fit]= awful_bad;
minimal_demerits[decent_fit]= awful_bad;
minimal_demerits[loose_fit]= awful_bad;
minimal_demerits[very_loose_fit]= awful_bad;

/*:766*//*780:*/
#line 16027 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(par_shape_ptr==null)
if(hang_indent==0)
{last_special_line= 0;second_width= hsize;
second_indent= 0;
}
else/*781:*/
#line 16041 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{last_special_line= abs(hang_after);
if(hang_after<0)
{first_width= hsize-abs(hang_indent);
if(hang_indent>=0)first_indent= hang_indent;
else first_indent= 0;
second_width= hsize;second_indent= 0;
}
else{first_width= hsize;first_indent= 0;
second_width= hsize-abs(hang_indent);
if(hang_indent>=0)second_indent= hang_indent;
else second_indent= 0;
}
}

/*:781*/
#line 16033 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{last_special_line= info(par_shape_ptr)-1;
second_width= mem[par_shape_ptr+2*(last_special_line+1)].sc;
second_indent= mem[par_shape_ptr+2*last_special_line+1].sc;
}
if(looseness==0)easy_line= last_special_line;
else easy_line= max_halfword

/*:780*/
#line 15361 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*795:*/
#line 16309 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

threshold= pretolerance;
if(threshold>=0)
{
#ifdef STAT
if(tracing_paragraphs> 0)
{begin_diagnostic();print_nl("@firstpass");}
#endif
#line 16317 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

second_pass= false;final_pass= false;
}
else{threshold= tolerance;second_pass= true;
final_pass= (emergency_stretch<=0);
#ifdef STAT
if(tracing_paragraphs> 0)begin_diagnostic();
#endif
#line 16325 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
loop{if(threshold> inf_bad)threshold= inf_bad;
if(second_pass)/*823:*/
#line 16873 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{
#ifdef INIT
if(trie_not_ready)init_trie();
#endif
#line 16878 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_lang= init_cur_lang;l_hyf= init_l_hyf;r_hyf= init_r_hyf;
set_hyph_index;
}

/*:823*/
#line 16328 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*796:*/
#line 16367 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= get_node(active_node_size);
type(q)= unhyphenated;fitness(q)= decent_fit;
link(q)= last_active;break_node(q)= null;
line_number(q)= prev_graf+1;total_demerits(q)= 0;link(active)= q;
do_all_six(store_background);
passive= null;printed_node= temp_head;pass_number= 0;
font_in_short_display= null_font

/*:796*/
#line 16329 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
cur_p= link(temp_head);auto_breaking= true;
prev_p= cur_p;
while((cur_p!=null)&&(link(active)!=last_active))
/*798:*/
#line 16403 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(is_char_node(cur_p))
/*799:*/
#line 16439 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{prev_p= cur_p;
do{f= font(cur_p);
act_width= act_width+char_width(f,character(cur_p));
cur_p= link(cur_p);
}while(!(!is_char_node(cur_p)));
}

/*:799*/
#line 16405 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
switch(type(cur_p)){
case hlist_node:case vlist_node:case rule_node:act_width= act_width+width(cur_p);break;
case whatsit_node:/*1255:*/
#line 24696 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

adv_past(cur_p)

/*:1255*/
#line 16409 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case glue_node:{/*800:*/
#line 16450 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(auto_breaking)
{if(is_char_node(prev_p))try_break(0,unhyphenated);
else if(precedes_break(prev_p))try_break(0,unhyphenated);
else if((type(prev_p)==kern_node)&&(subtype(prev_p)!=explicit))
try_break(0,unhyphenated);
}
check_shrinkage(glue_ptr(cur_p));q= glue_ptr(cur_p);
act_width= act_width+width(q);
active_width[2+stretch_order(q)]= 
active_width[2+stretch_order(q)]+stretch(q);
active_width[6]= active_width[6]+shrink(q)

/*:800*/
#line 16411 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(second_pass&&auto_breaking)
hyphenate_word();
}break;
case kern_node:if(subtype(cur_p)==explicit)kern_break
else act_width= act_width+width(cur_p);break;
case ligature_node:{f= font(lig_char(cur_p));
act_width= act_width+char_width(f,character(lig_char(cur_p)));
}break;
case disc_node:/*801:*/
#line 16466 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{s= pre_break(cur_p);disc_width= 0;
if(s==null)try_break(ex_hyphen_penalty,hyphenated);
else{do{/*802:*/
#line 16484 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(is_char_node(s))
{f= font(s);
disc_width= disc_width+char_width(f,character(s));
}
else switch(type(s)){
case ligature_node:{f= font(lig_char(s));
disc_width= disc_width+
char_width(f,character(lig_char(s)));
}break;
case hlist_node:case vlist_node:case rule_node:
case kern_node:
disc_width= disc_width+width(s);break;
default:confusion("disc3");

}

/*:802*/
#line 16469 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
s= link(s);
}while(!(s==null));
act_width= act_width+disc_width;
try_break(hyphen_penalty,hyphenated);
act_width= act_width-disc_width;
}
r= replace_count(cur_p);s= link(cur_p);
while(r> 0)
{/*803:*/
#line 16501 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(is_char_node(s))
{f= font(s);
act_width= act_width+char_width(f,character(s));
}
else switch(type(s)){
case ligature_node:{f= font(lig_char(s));
act_width= act_width+
char_width(f,character(lig_char(s)));
}break;
case hlist_node:case vlist_node:case rule_node:
case kern_node:
act_width= act_width+width(s);break;
default:confusion("disc4");

}

/*:803*/
#line 16478 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
decr(r);s= link(s);
}
prev_p= cur_p;cur_p= s;goto done5;
}

/*:801*/
#line 16421 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case math_node:{auto_breaking= (subtype(cur_p)==after);kern_break;
}break;
case penalty_node:try_break(penalty(cur_p),unhyphenated);break;
case mark_node:case ins_node:case adjust_node:do_nothing;break;
default:confusion("paragraph");

}
prev_p= cur_p;cur_p= link(cur_p);
done5:;}

/*:798*/
#line 16335 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_p==null)
/*805:*/
#line 16537 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{try_break(eject_penalty,hyphenated);
if(link(active)!=last_active)
{/*806:*/
#line 16547 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

r= link(active);fewest_demerits= awful_bad;
do{if(type(r)!=delta_node)if(total_demerits(r)<fewest_demerits)
{fewest_demerits= total_demerits(r);best_bet= r;
}
r= link(r);
}while(!(r==last_active));
best_line= line_number(best_bet)

/*:806*/
#line 16540 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(looseness==0)goto done;
/*807:*/
#line 16561 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{r= link(active);actual_looseness= 0;
do{if(type(r)!=delta_node)
{line_diff= line_number(r)-best_line;
if(((line_diff<actual_looseness)&&(looseness<=line_diff))||
((line_diff> actual_looseness)&&(looseness>=line_diff)))
{best_bet= r;actual_looseness= line_diff;
fewest_demerits= total_demerits(r);
}
else if((line_diff==actual_looseness)&&
(total_demerits(r)<fewest_demerits))
{best_bet= r;fewest_demerits= total_demerits(r);
}
}
r= link(r);
}while(!(r==last_active));
best_line= line_number(best_bet);
}

/*:807*/
#line 16542 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if((actual_looseness==looseness)||final_pass)goto done;
}
}

/*:805*/
#line 16338 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*797:*/
#line 16376 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= link(active);
while(q!=last_active)
{cur_p= link(q);
if(type(q)==delta_node)free_node(q,delta_node_size);
else free_node(q,active_node_size);
q= cur_p;
}
q= passive;
while(q!=null)
{cur_p= link(q);
free_node(q,passive_node_size);
q= cur_p;
}

/*:797*/
#line 16339 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(!second_pass)
{
#ifdef STAT
if(tracing_paragraphs> 0)print_nl("@secondpass");
#endif
#line 16345 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 threshold= tolerance;second_pass= true;final_pass= (emergency_stretch<=0);
}
else{
#ifdef STAT
if(tracing_paragraphs> 0)
print_nl("@emergencypass");
#endif
#line 16352 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 background[2]= background[2]+emergency_stretch;final_pass= true;
}
}
done:
#ifdef STAT
if(tracing_paragraphs> 0)
{end_diagnostic(true);normalize_selector();
}
#endif
#line 16361 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:795*/
#line 15362 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*808:*/
#line 16585 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

post_line_break(final_widow_penalty)

/*:808*/
#line 15364 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*797:*/
#line 16376 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= link(active);
while(q!=last_active)
{cur_p= link(q);
if(type(q)==delta_node)free_node(q,delta_node_size);
else free_node(q,active_node_size);
q= cur_p;
}
q= passive;
while(q!=null)
{cur_p= link(q);
free_node(q,passive_node_size);
q= cur_p;
}

/*:797*/
#line 15365 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
pack_begin_line= 0;
}

/*1299:*/
#line 25220 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void show_save_groups(void)
{
int p;
int m;
save_pointer v;
quarterword l;
group_code c;
int a;
int i;
quarterword j;
char*s;
p= nest_ptr;nest[p]= cur_list;
v= save_ptr;l= cur_level;c= cur_group;
save_ptr= cur_boundary;decr(cur_level);
a= 1;
print_nl("");print_ln();
loop{print_nl("### ");print_group(true);
if(cur_group==bottom_level)goto done;
do{m= nest[p].mode_field;
if(p> 0)decr(p);else m= vmode;
}while(!(m!=hmode));
print(" (");
switch(cur_group){
case simple_group:{incr(p);goto found2;
}
case hbox_group:case adjusted_hbox_group:s= "hbox";break;
case vbox_group:s= "vbox";break;
case vtop_group:s= "vtop";break;
case align_group:if(a==0)
{if(m==-vmode)s= "halign";else s= "valign";
a= 1;goto found1;
}
else{if(a==1)print("align entry");else print_esc("cr");
if(p>=a)p= p-a;
a= 0;goto found;
}break;
case no_align_group:
{incr(p);a= -1;print_esc("noalign");goto found2;
}
case output_group:
{print_esc("output");goto found;
}
case math_group:goto found2;
case disc_group:case math_choice_group:
{if(cur_group==disc_group)print_esc("discretionary");
else print_esc("mathchoice");
for(i= 1;i<=3;i++)if(i<=saved(-2))print("{}");
goto found2;
}
case insert_group:
{if(saved(-2)==255)print_esc("vadjust");
else{print_esc("insert");print_int(saved(-2));
}
goto found2;
}
case vcenter_group:{s= "vcenter";goto found1;
}
case semi_simple_group:{incr(p);print_esc("begingroup");goto found;
}
case math_shift_group:
{if(m==mmode)print_char('$');
else if(nest[p].mode_field==mmode)
{print_cmd_chr(eq_no,saved(-2));goto found;
}
print_char('$');goto found;
}
case math_left_group:
{if(type(nest[p+1].eTeX_aux_field)==left_noad)print_esc("left");
else print_esc("middle");
goto found;
}
}
/*1301:*/
#line 25309 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

i= saved(-4);
if(i!=0)
if(i<box_flag)
{if(abs(nest[p].mode_field)==vmode)j= hmove;else j= vmove;
if(i> 0)print_cmd_chr(j,0);else print_cmd_chr(j,1);
print_scaled(abs(i));print("pt");
}
else if(i<ship_out_flag)
{if(i>=global_box_flag)
{print_esc("global");i= i-(global_box_flag-box_flag);
}
print_esc("setbox");print_int(i-box_flag);print_char('=');
}
else print_cmd_chr(leader_ship,i-(leader_flag-a_leaders))

/*:1301*/
#line 25293 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
found1:print_esc(s);/*1300:*/
#line 25302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(saved(-2)!=0)
{print_char(' ');
if(saved(-3)==exactly)print("to");else print("spread");
print_scaled(saved(-2));print("pt");
}

/*:1300*/
#line 25294 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
found2:print_char('{');
found:print_char(')');decr(cur_level);
cur_group= save_level(save_ptr);save_ptr= save_index(save_ptr);
}
done:save_ptr= v;cur_level= l;cur_group= c;
}

/*:1299*//*1315:*/
#line 25450 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_interaction(void);

/*:1315*/
#line 15369 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:747*//*826:*/
#line 16919 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hyphenate_word(void)
{pointer q,s,prev_s;
small_number j;
uint8_t c;

prev_s= cur_p;s= link(prev_s);
if(s!=null)
{/*828:*/
#line 16950 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

loop{if(is_char_node(s))
{c= qo(character(s));hf= font(s);
}
else if(type(s)==ligature_node)
if(lig_ptr(s)==null)goto resume;
else{q= lig_ptr(s);c= qo(character(q));hf= font(q);
}
else if((type(s)==kern_node)&&(subtype(s)==normal))goto resume;
else if(type(s)==whatsit_node)
{/*1256:*/
#line 24699 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

adv_past(s)

/*:1256*/
#line 16960 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto resume;
}
else goto done1;
set_lc_code(c);
if(hc[0]!=0)
if((hc[0]==c)||(uc_hyph> 0))goto done2;
else goto done1;
resume:prev_s= s;s= link(prev_s);
}
done2:hyf_char= hyphen_char[hf];
if(hyf_char<0)goto done1;
if(hyf_char> biggest_char)goto done1;
ha= prev_s

/*:828*/
#line 16927 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(l_hyf+r_hyf> max_hyph_length-1)goto done1;
/*829:*/
#line 16977 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hn= 0;
loop{if(is_char_node(s))
{if(font(s)!=hf)goto done3;
hyf_bchar= character(s);c= qo(hyf_bchar);
set_lc_code(c);
if(hc[0]==0)goto done3;
if(hc[0]> max_hyph_char)goto done3;
if(hn==max_hyph_length-1)goto done3;
hb= s;incr(hn);hu[hn]= c;hc[hn]= hc[0];hyf_bchar= non_char;
}
else if(type(s)==ligature_node)
/*830:*/
#line 17005 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(font(lig_char(s))!=hf)goto done3;
j= hn;q= lig_ptr(s);if(q> null)hyf_bchar= character(q);
while(q> null)
{c= qo(character(q));
set_lc_code(c);
if(hc[0]==0)goto done3;
if(hc[0]> max_hyph_char)goto done3;
if(j==max_hyph_length)goto done3;
incr(j);hu[j]= c;hc[j]= hc[0];
q= link(q);
}
hb= s;hn= j;
if(odd(subtype(s)))hyf_bchar= font_bchar[hf];else hyf_bchar= non_char;
}

/*:830*/
#line 16990 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if((type(s)==kern_node)&&(subtype(s)==normal))
{hb= s;
hyf_bchar= font_bchar[hf];
}
else goto done3;
s= link(s);
}
done3:

/*:829*/
#line 16929 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*831:*/
#line 17021 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(hn<l_hyf+r_hyf)goto done1;
loop{if(!(is_char_node(s)))
switch(type(s)){
case ligature_node:do_nothing;break;
case kern_node:if(subtype(s)!=normal)goto done4;break;
case whatsit_node:case glue_node:
case penalty_node:case ins_node:case adjust_node:
case mark_node:
goto done4;
default:goto done1;
}
s= link(s);
}
done4:

/*:831*/
#line 16931 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
hyphenate();
}
done1:;}

/*:826*//*866:*/
#line 17654 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void new_hyph_exceptions(void)
{
int n;
int j;
hyph_pointer h;
str_number k;
pointer p;
pointer q;
str_number s,t;
pool_pointer u,v;
scan_left_brace();
set_cur_lang;
#ifdef INIT
if(trie_not_ready)
{hyph_index= 0;goto not_found1;
}
#endif
#line 17671 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 set_hyph_index;
not_found1:
/*867:*/
#line 17677 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

n= 0;p= null;
loop{get_x_token();
reswitch:switch(cur_cmd){
case letter:case other_char:case char_given:/*869:*/
#line 17703 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_chr=='-')/*870:*/
#line 17718 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(n<max_hyph_length)
{q= get_avail();link(q)= p;info(q)= n;p= q;
}
}

/*:870*/
#line 17704 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{set_lc_code(cur_chr);
if(hc[0]==0)
{print_err("Not a letter");

help2("Letters in \\hyphenation words must have \\lccode>0.",
"Proceed; I'll ignore the character I just read.");
error();
}
else if(n<max_hyph_length)
{incr(n);hc[n]= hc[0];
}
}

/*:869*/
#line 17682 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case char_num:{scan_char_num();cur_chr= cur_val;cur_cmd= char_given;
goto reswitch;
}
case spacer:case right_brace:{if(n> 1)/*871:*/
#line 17724 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{incr(n);hc[n]= cur_lang;str_room(n);h= 0;
for(j= 1;j<=n;j++)
{h= (h+h+hc[j])%hyph_size;
append_char(hc[j]);
}
s= make_string();
/*872:*/
#line 17734 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(hyph_count==hyph_size)overflow("exception dictionary",hyph_size);

incr(hyph_count);
while(hyph_word[h]!=0)
{/*873:*/
#line 17745 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

k= hyph_word[h];
if(length(k)<length(s))goto found;
if(length(k)> length(s))goto not_found;
u= str_start[k];v= str_start[s];
do{if(str_pool[u]<str_pool[v])goto found;
if(str_pool[u]> str_pool[v])goto not_found;
incr(u);incr(v);
}while(!(u==str_start[k+1]));
found:q= hyph_list[h];hyph_list[h]= p;p= q;
t= hyph_word[h];hyph_word[h]= s;s= t;
not_found:

/*:873*/
#line 17740 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(h> 0)decr(h);else h= hyph_size;
}
hyph_word[h]= s;hyph_list[h]= p

/*:872*/
#line 17731 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:871*/
#line 17686 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd==right_brace)return;
n= 0;p= null;
}break;
default:/*868:*/
#line 17694 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Improper ");print_esc("hyphenation");

print(" will be flushed");
help2("Hyphenation exceptions must contain only letters",
"and hyphens. But continue; I'll forgive and forget.");
error();
}

/*:868*/
#line 17690 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
}

/*:867*/
#line 17674 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:866*//*901:*/
#line 18313 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer prune_page_top(pointer p,bool s)

{pointer prev_p;
pointer q,r;
prev_p= temp_head;link(temp_head)= p;
while(p!=null)
switch(type(p)){
case hlist_node:case vlist_node:case rule_node:/*902:*/
#line 18338 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{q= new_skip_param(split_top_skip_code);link(prev_p)= q;link(q)= p;

if(width(temp_ptr)> height(p))width(temp_ptr)= width(temp_ptr)-height(p);
else width(temp_ptr)= 0;
p= null;
}

/*:902*/
#line 18321 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case whatsit_node:case mark_node:case ins_node:{prev_p= p;p= link(prev_p);
}break;
case glue_node:case kern_node:case penalty_node:{q= p;p= link(q);link(q)= null;
link(prev_p)= p;
if(s)
{if(split_disc==null)split_disc= q;else link(r)= q;
r= q;
}
else flush_node_list(q);
}break;
default:confusion("pruning");

}
return link(temp_head);
}

/*:901*//*903:*/
#line 18362 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer vert_break(pointer p,scaled h,scaled d)

{
pointer prev_p;

pointer q,r;
int pi;
int b;
int least_cost;
pointer best_place;
scaled prev_dp;
small_number t;
prev_p= p;
least_cost= awful_bad;do_all_six(set_height_zero);prev_dp= 0;
loop{/*905:*/
#line 18396 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(p==null)pi= eject_penalty;
else/*906:*/
#line 18411 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(type(p)){
case hlist_node:case vlist_node:case rule_node:{
cur_height= cur_height+prev_dp+height(p);prev_dp= depth(p);
goto not_found;
}
case whatsit_node:/*1257:*/
#line 24702 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

goto not_found

/*:1257*/
#line 18417 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
case glue_node:if(precedes_break(prev_p))pi= 0;
else goto update_heights;break;
case kern_node:{if(link(p)==null)t= penalty_node;
else t= type(link(p));
if(t==glue_node)pi= 0;else goto update_heights;
}break;
case penalty_node:pi= penalty(p);break;
case mark_node:case ins_node:goto not_found;
default:confusion("vertbreak");

}

/*:906*/
#line 18400 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*907:*/
#line 18432 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(pi<inf_penalty)
{/*908:*/
#line 18446 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_height<h)
if((active_height[3]!=0)||(active_height[4]!=0)||
(active_height[5]!=0))b= 0;
else b= badness(h-cur_height,active_height[2]);
else if(cur_height-h> active_height[6])b= awful_bad;
else b= badness(cur_height-h,active_height[6])

/*:908*/
#line 18434 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(b<awful_bad)
if(pi<=eject_penalty)b= pi;
else if(b<inf_bad)b= b+pi;
else b= deplorable;
if(b<=least_cost)
{best_place= p;least_cost= b;
best_height_plus_depth= cur_height+prev_dp;
}
if((b==awful_bad)||(pi<=eject_penalty))goto done;
}

/*:907*/
#line 18402 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if((type(p)<glue_node)||(type(p)> kern_node))goto not_found;
update_heights:/*909:*/
#line 18458 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(type(p)==kern_node)q= p;
else{q= glue_ptr(p);
active_height[2+stretch_order(q)]= 
active_height[2+stretch_order(q)]+stretch(q);
active_height[6]= active_height[6]+shrink(q);
if((shrink_order(q)!=normal)&&(shrink(q)!=0))
{
if(ignore_primitive_error&ignore_infinite_glue_shrinkage_bit)
print_ignored_err("Infinite glue shrinkage found in box being split");
else{
print_err("Infinite glue shrinkage found in box being split");

help4("The box you are \\vsplitting contains some infinitely",
"shrinkable glue, e.g., `\\vss' or `\\vskip 0pt minus 1fil'.",
"Such glue doesn't belong there; but you can safely proceed,",
"since the offensive shrinkability has been made finite.");
error();
}
r= new_spec(q);shrink_order(r)= normal;delete_glue_ref(q);
glue_ptr(p)= r;q= r;
}
}
cur_height= cur_height+prev_dp+width(q);prev_dp= 0

/*:909*/
#line 18405 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
not_found:if(prev_dp> d)
{cur_height= cur_height+prev_dp-d;
prev_dp= d;
}

/*:905*/
#line 18378 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
prev_p= p;p= link(prev_p);
}
done:return best_place;
}

/*:903*//*910:*/
#line 18498 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*1397:*/
#line 26727 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool do_marks(small_number a,small_number l,pointer q)
{int i;
if(l<4)
{for(i= 0;i<=15;i++)
{get_sa_ptr;
if(cur_ptr!=null)if(do_marks(a,l+1,cur_ptr))delete_sa_ptr;
}
if(sa_used(q)==0)
{free_node(q,index_node_size);q= null;
}
}
else
{switch(a){
/*1398:*/
#line 26753 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vsplit_init:if(sa_split_first_mark(q)!=null)
{delete_token_ref(sa_split_first_mark(q));sa_split_first_mark(q)= null;
delete_token_ref(sa_split_bot_mark(q));sa_split_bot_mark(q)= null;
}break;

/*:1398*//*1400:*/
#line 26780 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case fire_up_init:if(sa_bot_mark(q)!=null)
{if(sa_top_mark(q)!=null)delete_token_ref(sa_top_mark(q));
delete_token_ref(sa_first_mark(q));sa_first_mark(q)= null;
if(link(sa_bot_mark(q))==null)
{delete_token_ref(sa_bot_mark(q));sa_bot_mark(q)= null;
}
else add_token_ref(sa_bot_mark(q));
sa_top_mark(q)= sa_bot_mark(q);
}break;

/*:1400*//*1401:*/
#line 26791 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case fire_up_done:if((sa_top_mark(q)!=null)&&(sa_first_mark(q)==null))
{sa_first_mark(q)= sa_top_mark(q);add_token_ref(sa_top_mark(q));
}break;

/*:1401*//*1402:*/
#line 26804 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
case destroy_marks:for(i= top_mark_code;i<=split_bot_mark_code;i++)
{get_sa_ptr;
if(cur_ptr!=null)
{delete_token_ref(cur_ptr);put_sa_ptr(null);
}
}
#endif
#line 26813 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1402*/
#line 26741 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
if(sa_bot_mark(q)==null)if(sa_split_bot_mark(q)==null)
{free_node(q,mark_class_node_size);q= null;
}
}
return(q==null);
}

/*:1397*/
#line 18498 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer vsplit(halfword n,scaled h)

{
pointer v;
pointer p;
pointer q;
cur_val= n;fetch_box(v);
flush_node_list(split_disc);split_disc= null;
if(sa_mark!=null)
if(do_marks(vsplit_init,0,sa_mark))sa_mark= null;
if(split_first_mark!=null)
{delete_token_ref(split_first_mark);split_first_mark= null;
delete_token_ref(split_bot_mark);split_bot_mark= null;
}
/*911:*/
#line 18532 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(v==null)
{return null;
}
if(type(v)!=vlist_node)
{print_err("");print_esc("vsplit");print(" needs a ");
print_esc("vbox");

help2("The box you are trying to split is an \\hbox.",
"I can't split such a box, so I'll leave it alone.");
error();return null;
}

/*:911*/
#line 18513 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
q= vert_break(list_ptr(v),h,split_max_depth);
/*912:*/
#line 18548 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= list_ptr(v);
if(p==q)list_ptr(v)= null;
else loop{if(type(p)==mark_node)
if(mark_class(p)!=0)/*1399:*/
#line 26762 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{find_sa_element(mark_val,mark_class(p),true);
if(sa_split_first_mark(cur_ptr)==null)
{sa_split_first_mark(cur_ptr)= mark_ptr(p);
add_token_ref(mark_ptr(p));
}
else delete_token_ref(sa_split_bot_mark(cur_ptr));
sa_split_bot_mark(cur_ptr)= mark_ptr(p);
add_token_ref(mark_ptr(p));
}

/*:1399*/
#line 18552 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(split_first_mark==null)
{split_first_mark= mark_ptr(p);
split_bot_mark= split_first_mark;
token_ref_count(split_first_mark)= 
token_ref_count(split_first_mark)+2;
}
else{delete_token_ref(split_bot_mark);
split_bot_mark= mark_ptr(p);
add_token_ref(split_bot_mark);
}
if(link(p)==q)
{link(p)= null;goto done;
}
p= link(p);
}
done:

/*:912*/
#line 18516 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
q= prune_page_top(q,saving_vdiscards> 0);
p= list_ptr(v);list_ptr(v)= null;flush_node_list(v);
p= vpackage(p,h,0,0,exactly,false,split_max_depth);
if(q!=null)
{if(color_tos!=null)
{pointer r= new_color_node(color_ref(color_tos));
color_tos= color_link(color_tos);
link(r)= q;q= r;
}
q= vpack(q,natural);
}
change_box(q);
return p;
}

/*:910*//*918:*/
#line 18737 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void print_totals(void)
{print_scaled(page_total);
print_plus(2,"");
print_plus(3,"fil");
print_plus(4,"fill");
print_plus(5,"filll");
if(page_shrink!=0)
{print(" minus ");print_scaled(page_shrink);
}
}

/*:918*//*920:*/
#line 18783 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void freeze_page_specs(small_number s)
{page_contents= s;
page_goal= vsize;page_max_depth= max_depth;
page_depth= 0;do_all_six(set_page_so_far_zero);
least_page_cost= awful_bad;
#ifdef STAT
if(tracing_pages> 0)
{begin_diagnostic();
print_nl("%% goal height=");print_scaled(page_goal);

print(", max depth=");print_scaled(page_max_depth);
end_diagnostic(false);
}
#endif
#line 18797 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:920*//*925:*/
#line 18851 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void box_error(eight_bits n)
{error();begin_diagnostic();
print_nl("The following box has been deleted:");

show_box(box(n));end_diagnostic(true);
flush_node_list(box(n));box(n)= null;
}

/*:925*//*926:*/
#line 18865 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void update_last_values(pointer p)
{/*928:*/
#line 18876 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(last_glue!=max_halfword)delete_glue_ref(last_glue);
last_penalty= 0;last_kern= 0;
last_node_type= type(p)+1;
if(type(p)==glue_node)
{last_glue= glue_ptr(p);add_glue_ref(last_glue);
}
else{last_glue= max_halfword;
if(type(p)==penalty_node)last_penalty= penalty(p);
else if(type(p)==kern_node)last_kern= width(p);
}


/*:928*/
#line 18867 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:926*//*933:*/
#line 18979 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*946:*/
#line 19310 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void app_space(void)
{pointer q;
if((space_factor>=2000)&&(xspace_skip!=zero_glue))
q= new_param_glue(xspace_skip_code);
else{if(space_skip!=zero_glue)main_p= space_skip;
else/*945:*/
#line 19299 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{main_p= font_glue[cur_font];
if(main_p==null)
{main_p= new_spec(zero_glue);main_k= param_base[cur_font]+space_code;
width(main_p)= font_info[main_k].sc;
stretch(main_p)= font_info[main_k+1].sc;
shrink(main_p)= font_info[main_k+2].sc;
font_glue[cur_font]= main_p;
}
}

/*:945*/
#line 19316 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
main_p= new_spec(main_p);
/*947:*/
#line 19324 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(space_factor>=2000)width(main_p)= width(main_p)+extra_space(cur_font);
stretch(main_p)= xn_over_d(stretch(main_p),space_factor,1000);
shrink(main_p)= xn_over_d(shrink(main_p),1000,space_factor)

/*:947*/
#line 19318 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
q= new_glue(main_p);glue_ref_count(main_p)= null;
}
link(tail)= q;tail= q;
}

/*:946*//*950:*/
#line 19365 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void insert_dollar_sign(void)
{back_input();cur_tok= math_shift_token+'$';
print_err("Missing $ inserted");

help2("I've inserted a begin-math/end-math symbol since I think",
"you left one out. Proceed, with fingers crossed.");ins_error();
}

/*:950*//*952:*/
#line 19390 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void you_cant(void)
{print_err("You can't use `");

print_cmd_chr(cur_cmd,cur_chr);
print("' in ");print_mode(mode);
}

/*:952*//*953:*/
#line 19398 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void report_illegal_case(void)
{you_cant();
help4("Sorry, but I'm not programmed to handle this case;",
"I'll just pretend that you didn't ask for it.",
"If you're in the wrong mode, you might be able to",
"return to the right one by typing `I}' or `I$' or `I\\par'.");
error();
}

/*:953*//*954:*/
#line 19413 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool privileged(void)
{if(mode> 0)return true;
else{report_illegal_case();return false;
}
}

/*:954*//*957:*/
#line 19440 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool its_all_over(void)
{
if(privileged())
{if((page_head==page_tail)&&(dead_cycles==0))
{
if(head==tail)return true;
else if(option_no_empty_page)
{pointer p= link(head);
while(p!=null)
{if(is_visible(p))break;
else p= link(p);
}
if(p==null)return true;
}
}
back_input();
tail_append(new_set_node());
set_extent(tail)= new_xdimen(dimen_par(hsize_code),
dimen_par_hfactor(hsize_code),dimen_par_vfactor(hsize_code));
tail_append(new_glue(fill_glue));
tail_append(new_penalty(2*(eject_penalty)));
build_page();
}
return false;
}

/*:957*//*963:*/
#line 19561 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void append_glue(void)
{small_number s;
s= cur_chr;
switch(s){
case fil_code:cur_val= fil_glue;break;
case fill_code:cur_val= fill_glue;break;
case ss_code:cur_val= ss_glue;break;
case fil_neg_code:cur_val= fil_neg_glue;break;
case skip_code:scan_glue(glue_val);break;
case mskip_code:scan_glue(mu_val);
}
tail_append(new_glue(cur_val));
if(s>=skip_code)
{decr(glue_ref_count(cur_val));
if(s> skip_code)subtype(tail)= mu_glue;
}
}

/*:963*//*964:*/
#line 19580 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void append_kern(void)
{quarterword s;
s= cur_chr;scan_dimen(s==mu_glue,false,false);
tail_append(new_kern(cur_val));subtype(tail)= s;
}

/*:964*//*967:*/
#line 19624 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void off_save(void)
{pointer p;
if(cur_group==bottom_level)
/*969:*/
#line 19664 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Extra ");print_cmd_chr(cur_cmd,cur_chr);

help1("Things are pretty mixed up, but I think the worst is over.");
error();
}

/*:969*/
#line 19628 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{back_input();p= get_avail();link(temp_head)= p;
print_err("Missing ");
/*968:*/
#line 19645 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(cur_group){
case semi_simple_group:{info(p)= cs_token_flag+frozen_end_group;
print_esc("endgroup");

}break;
case math_shift_group:{info(p)= math_shift_token+'$';print_char('$');

}break;
case math_left_group:{info(p)= cs_token_flag+frozen_right;link(p)= get_avail();
p= link(p);info(p)= other_token+'.';print_esc("right.");


}break;
default:{info(p)= right_brace_token+'}';print_char('}');

}
}

/*:968*/
#line 19632 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
print(" inserted");ins_list(link(temp_head));
help5("I've inserted something that you may have forgotten.",
"(See the <inserted text> above.)",
"With luck, this will get me unwedged. But if you",
"really didn't forget anything, try typing `2' now; then",
"my insertion and my current dilemma will both disappear.");
error();
}
}

/*:967*//*972:*/
#line 19702 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void extra_right_brace(void)
{print_err("Extra }, or forgotten ");

switch(cur_group){
case semi_simple_group:print_esc("endgroup");break;
case math_shift_group:print_char('$');break;
case math_left_group:print_esc("right");
}
help5("I've deleted a group-closing symbol because it seems to be",
"spurious, as in `$x}$'. But perhaps the } is legitimate and",
"you forgot something else, as in `\\hbox{$x}'. In such cases",
"the way to recover is to insert both the forgotten and the",
"deleted material, e.g., by typing `I$}'.");error();
incr(align_state);
}

/*:972*//*973:*/
#line 19722 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void normal_paragraph(void)
{if(looseness!=0)eq_word_define(int_base+looseness_code,0);
if(hang_indent!=0)eq_word_define(dimen_base+hang_indent_code,0);
if(hang_after!=1)eq_word_define(int_base+hang_after_code,1);
if(par_shape_ptr!=null)eq_define(par_shape_loc,shape_ref,null);
if(inter_line_penalties_ptr!=null)
eq_define(inter_line_penalties_loc,shape_ref,null);
}

/*:973*//*978:*/
#line 19846 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void box_end(int box_context)
{pointer p;
small_number a;
if(box_context<box_flag)/*979:*/
#line 19862 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_box!=null)
{shift_amount(cur_box)= box_context;
if(abs(mode)==vmode)
{append_to_vlist(cur_box);
if(adjust_tail!=null)
{if(adjust_head!=adjust_tail)
{link(tail)= link(adjust_head);tail= adjust_tail;
}
adjust_tail= null;
}
if(mode> 0)build_page();
}
else{if(abs(mode)==hmode)space_factor= 1000;
else{p= new_noad();
math_type(nucleus(p))= sub_box;
info(nucleus(p))= cur_box;cur_box= p;
}
link(tail)= cur_box;tail= cur_box;
}
}
}

/*:979*/
#line 19851 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(box_context<ship_out_flag)/*980:*/
#line 19885 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(box_context<global_box_flag)
{cur_val= box_context-box_flag;a= 0;
}
else{cur_val= box_context-global_box_flag;a= 4;
}
if(cur_val<256)define(box_base+cur_val,box_ref,cur_box);
else sa_def_box;
}

/*:980*/
#line 19852 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(cur_box!=null)
if(box_context> ship_out_flag)/*981:*/
#line 19895 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 19896 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(((cur_cmd==hskip)&&(abs(mode)!=vmode))||
((cur_cmd==vskip)&&(abs(mode)==vmode)))
{append_glue();subtype(tail)= box_context-(leader_flag-a_leaders);
leader_ptr(tail)= cur_box;
}
else{print_err("Leaders not followed by proper glue");

help3("You should say `\\leaders <box or rule><hskip or vskip>'.",
"I found the <box or rule>, but there's no suitable",
"<hskip or vskip>, so I'm ignoring these leaders.");back_error();
flush_node_list(cur_box);
}
}

/*:981*/
#line 19854 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else ship_out(cur_box);
}

/*:978*//*982:*/
#line 19916 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void begin_box(int box_context)
{
pointer p,q;
int m;
halfword k;
halfword n;
switch(cur_chr){
case box_code:{scan_register_num();fetch_box(cur_box);
change_box(null);
}break;
case copy_code:{scan_register_num();fetch_box(q);cur_box= copy_node_list(q);
}break;
case last_box_code:/*983:*/
#line 19941 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{cur_box= null;
if(abs(mode)==mmode)
{you_cant();help1("Sorry; this \\lastbox will be void.");error();
}
else if((mode==vmode)&&(head==tail))
{you_cant();
help2("Sorry...I usually can't take things from the current page.",
"This \\lastbox will therefore be void.");error();
}
else{if(!is_char_node(tail))
if((type(tail)==hlist_node)||(type(tail)==vlist_node))
/*984:*/
#line 19957 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{q= head;
do{p= q;
if(!is_char_node(q))if(type(q)==disc_node)
{for(m= 1;m<=replace_count(q);m++)p= link(p);
if(p==tail)goto done;
}
q= link(p);
}while(!(q==tail));
cur_box= tail;shift_amount(cur_box)= 0;
tail= p;link(p)= null;
done:;}

/*:984*/
#line 19953 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}

/*:983*/
#line 19930 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case vsplit_code:/*985:*/
#line 19972 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_register_num();n= cur_val;
if(!scan_keyword("to"))

{print_err("Missing `to' inserted");

help2("I'm working on `\\vsplit<box number> to <dimen>';",
"will look for the <dimen> next.");error();
}
scan_normal_dimen;
cur_box= vsplit(n,cur_val);
}

/*:985*/
#line 19932 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
default:/*986:*/
#line 19988 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{k= cur_chr-vtop_code;saved(0)= box_context;
if(k==hmode)
if((box_context<box_flag)&&(abs(mode)==vmode))
scan_spec(adjusted_hbox_group,true);
else scan_spec(hbox_group,true);
else{if(k==vmode)scan_spec(vbox_group,true);
else{scan_spec(vtop_group,true);k= vmode;
}
normal_paragraph();
}
push_nest();mode= -k;
if(k==vmode)
{prev_depth= ignore_depth;
if(every_vbox!=null)begin_token_list(every_vbox,every_vbox_text);
}
else{space_factor= 1000;
if(every_hbox!=null)begin_token_list(every_hbox,every_hbox_text);
}
return;
}

/*:986*/
#line 19933 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
box_end(box_context);
}

/*:982*//*987:*/
#line 20010 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_box(int box_context)

{/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 20013 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd==make_box)begin_box(box_context);
else if((box_context>=leader_flag)&&((cur_cmd==hrule)||(cur_cmd==vrule)))
{cur_box= scan_rule_spec();box_end(box_context);
}
else{
print_err("A <box> was supposed to be here");

help3("I was expecting to see \\hbox or \\vbox or \\copy or \\box or",
"something like that. So you might find something missing in",
"your output. But keep trying; you can fix this later.");back_error();
}
}

/*:987*//*989:*/
#line 20040 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void package(small_number c)
{scaled h;
pointer p;
scaled d;
d= box_max_depth;unsave();save_ptr= save_ptr-3;
if(mode==-hmode)cur_box= hpack(link(head),saved(2),saved_hfactor(2),saved_vfactor(2),saved(1),false);
else{cur_box= vpackage(link(head),saved(2),saved_hfactor(2),saved_vfactor(2),saved(1),false,d);
if(c==vtop_code)/*990:*/
#line 20058 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(type(cur_box)==vlist_node)
{h= 0;p= list_ptr(cur_box);
if(p!=null&&type(p)<=rule_node)h= height(p);
depth(cur_box)= depth(cur_box)-h+height(cur_box);height(cur_box)= h;
}
else if(type(cur_box)==whatsit_node)
{if(subtype(cur_box)==vpack_node)
pack_limit(cur_box)^= MAX_DIMEN+1;
else if(subtype(cur_box)==vset_node)
{height(cur_box)= height(cur_box)+depth(cur_box);
depth(cur_box)^= MAX_DIMEN+1;
}
}
}

/*:990*/
#line 20048 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
pop_nest();box_end(saved(0));
}

/*:989*//*994:*/
#line 20099 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static small_number norm_min(int h)
{if(h<=0)return 1;else if(h>=63)return 63;
else return h;
}

static void new_graf(bool indented)
{prev_graf= 0;
if((mode==vmode)||(head!=tail))
tail_append(new_param_glue(par_skip_code));
push_nest();mode= hmode;space_factor= 1000;set_cur_lang;clang= cur_lang;
prev_graf= (norm_min(left_hyphen_min)*0100+norm_min(right_hyphen_min))
*0200000+cur_lang;
if(indented)
{tail= new_null_box();link(head)= tail;width(tail)= par_indent;
}
if(every_par!=null)begin_token_list(every_par,every_par_text);
if(nest_ptr==1)build_page();
}

/*:994*//*996:*/
#line 20122 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void indent_in_hmode(void)
{pointer p,q;
if(cur_chr> 0)
{p= new_null_box();width(p)= par_indent;
if(abs(mode)==hmode)space_factor= 1000;
else{q= new_noad();math_type(nucleus(q))= sub_box;
info(nucleus(q))= p;p= q;
}
tail_append(p);
}
}

/*:996*//*998:*/
#line 20151 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void head_for_vmode(void)
{if(mode<0)
if(cur_cmd!=hrule)off_save();
else{print_err("You can't use `");
print_esc("hrule");print("' here except with leaders");

help2("To put a horizontal rule in an hbox or an alignment,",
"you should use \\leaders or \\hrulefill (see The TeXbook).");
error();
}
else{back_input();cur_tok= par_token;back_input();token_type= inserted;
}
}

/*:998*//*999:*/
#line 20166 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void end_graf(void)
{if(mode==hmode)
{if(head==tail)pop_nest();
else hline_break(widow_penalty);
normal_paragraph();
error_count= 0;
}
}

/*:999*//*1002:*/
#line 20187 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void begin_insert_or_adjust(void)
{if(cur_cmd==vadjust)cur_val= 255;
else{scan_eight_bit_int();
if(cur_val==255)
{print_err("You can't ");print_esc("insert");print_int(255);

help1("I'm changing to \\insert0; box 255 is special.");
error();cur_val= 0;
}
}
saved(0)= cur_val;incr(save_ptr);
new_save_level(insert_group);scan_left_brace();normal_paragraph();
push_nest();mode= -vmode;prev_depth= ignore_depth;
}

/*:1002*//*1004:*/
#line 20228 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_mark(void)
{pointer p;
halfword c;
if(cur_chr==0)c= 0;
else{scan_register_num();c= cur_val;
}
p= scan_toks(false,true);p= get_node(small_node_size);
mark_class(p)= c;
type(p)= mark_node;subtype(p)= 0;
mark_ptr(p)= def_ref;link(tail)= p;tail= p;
}

/*:1004*//*1006:*/
#line 20247 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void append_penalty(void)
{scan_int();tail_append(new_penalty(cur_val));
if(mode==vmode)build_page();
}

/*:1006*//*1008:*/
#line 20266 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void delete_last(void)
{
pointer p,q;
int m;
if((mode==vmode)&&(tail==head))
/*1009:*/
#line 20288 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((cur_chr!=glue_node)||(last_glue!=max_halfword))
{you_cant();
help2("Sorry...I usually can't take things from the current page.",
"Try `I\\vskip-\\lastskip' instead.");
if(cur_chr==kern_node)help_line[0]= 
("Try `I\\kern-\\lastkern' instead.");
else if(cur_chr!=glue_node)help_line[0]= 
("Perhaps you can make the output routine do it.");
error();
}
}

/*:1009*/
#line 20273 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{if(!is_char_node(tail))if(type(tail)==cur_chr)
{q= head;
do{p= q;
if(!is_char_node(q))if(type(q)==disc_node)
{for(m= 1;m<=replace_count(q);m++)p= link(p);
if(p==tail)return;
}
q= link(p);
}while(!(q==tail));
link(p)= null;flush_node_list(tail);tail= p;
}
}
}

/*:1008*//*1013:*/
#line 20333 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void unpackage(void)
{
pointer p;
int c;
if(cur_chr> copy_code)/*1422:*/
#line 27135 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{link(tail)= disc_ptr[cur_chr];disc_ptr[cur_chr]= null;
goto done;
}

/*:1422*/
#line 20338 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
c= cur_chr;scan_register_num();fetch_box(p);
if(p==null)return;
if((abs(mode)==mmode)||
((abs(mode)==vmode)&&(type(p)!=vlist_node)
&&(type(p)!=whatsit_node||(subtype(p)!=vset_node
&&subtype(p)!=vpack_node)))||
((abs(mode)==hmode)&&(type(p)!=hlist_node)
&&(type(p)!=whatsit_node||(subtype(p)!=hset_node
&&subtype(p)!=hpack_node))))
{print_err("Incompatible list can't be unboxed");

help3("Sorry, Pandora. (You sneaky devil.)",
"I refuse to unbox an \\hbox in vertical mode or vice versa.",
"And I can't open any boxes in math mode.");
error();return;
}
if(c==copy_code)link(tail)= copy_node_list(list_ptr(p));
else{link(tail)= list_ptr(p);change_box(null);
list_ptr(p)= null;flush_node_list(p);
}
done:
while(link(tail)!=null)tail= link(tail);
}

/*:1013*//*1016:*/
#line 20373 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void append_italic_correction(void)
{
pointer p;
internal_font_number f;
if(tail!=head)
{if(is_char_node(tail))p= tail;
else if(type(tail)==ligature_node)p= lig_char(tail);
else return;
f= font(p);
tail_append(new_kern(char_italic(f,character(p))));
subtype(tail)= explicit;
}
}

/*:1016*//*1020:*/
#line 20407 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void append_discretionary(void)
{int c;
tail_append(new_disc());
if(cur_chr==1)
{c= hyphen_char[cur_font];
if(c>=0)if(c<256)pre_break(tail)= new_character(cur_font,c);
}
else{incr(save_ptr);saved(-1)= 0;new_save_level(disc_group);
scan_left_brace();push_nest();mode= -hmode;space_factor= 1000;
}
}

/*:1020*//*1022:*/
#line 20427 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void build_discretionary(void)
{
pointer p,q;
int n;
unsave();
/*1024:*/
#line 20469 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= head;p= link(q);n= 0;
while(p!=null)
{if(!is_char_node(p))if(type(p)> rule_node)
if(type(p)!=kern_node)if(type(p)!=ligature_node)
{print_err("Improper discretionary list");

help1("Discretionary lists must contain only boxes and kerns.");
error();
begin_diagnostic();
print_nl("The following discretionary sublist has been deleted:");

show_box(p);
end_diagnostic(true);
flush_node_list(p);link(q)= null;goto done;
}
q= p;p= link(q);incr(n);
}
done:

/*:1024*/
#line 20435 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= link(head);pop_nest();
switch(saved(-1)){
case 0:pre_break(tail)= p;break;
case 1:post_break(tail)= p;break;
case 2:/*1023:*/
#line 20447 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((n> 0)&&(abs(mode)==mmode))
{print_err("Illegal math ");print_esc("discretionary");

help2("Sorry: The third part of a discretionary break must be",
"empty, in math formulas. I had to delete your third part.");
flush_node_list(p);n= 0;error();
}
else link(tail)= p;
if(n<=0x7F)set_replace_count(tail,n);
else{print_err("Discretionary list is too long");

help2("Wow---I never thought anybody would tweak me here.",
"You can't seriously need such a huge discretionary list?");
error();
}
if(n> 0)tail= q;
decr(save_ptr);return;
}

/*:1023*/
#line 20441 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
incr(saved(-1));new_save_level(disc_group);scan_left_brace();
push_nest();mode= -hmode;space_factor= 1000;
}

/*:1022*//*1026:*/
#line 20503 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void make_accent(void)
{double s,t;
pointer p,q,r;
internal_font_number f;
scaled a,h,x,w,delta;
scan_char_num();f= cur_font;p= new_character(f,cur_val);
if(p!=null)
{x= x_height(f);s= slant(f)/float_constant(65536);

a= char_width(f,character(p));
do_assignments();
/*1027:*/
#line 20522 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

q= null;f= cur_font;
if((cur_cmd==letter)||(cur_cmd==other_char)||(cur_cmd==char_given))
q= new_character(f,cur_chr);
else if(cur_cmd==char_num)
{scan_char_num();q= new_character(f,cur_val);
}
else back_input()

/*:1027*/
#line 20516 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(q!=null)/*1028:*/
#line 20538 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{t= slant(f)/float_constant(65536);

if(IS_X_FONT(f))
{hb_codepoint_t glyph;
if(x_glyph(f,character(q),&glyph))
{scaled dummy;
w= x_glyph_width(f,glyph);
x_glyph_height_depth(f,glyph,&h,&dummy);
}
else
w= h= 0;
}
else
{w= char_width(f,character(q));h= char_height(f,character(q));}
if(h!=x)
{p= hpack(p,natural);shift_amount(p)= x-h;
}
delta= round((w-a)/float_constant(2)+h*t-x*s);


r= new_kern(delta);subtype(r)= acc_kern;link(tail)= r;link(r)= p;
tail= new_kern(-a-delta);subtype(tail)= acc_kern;link(p)= tail;p= q;
}

/*:1028*/
#line 20517 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
link(tail)= p;tail= p;space_factor= 1000;
}
}

/*:1026*//*1030:*/
#line 20576 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void align_error(void)
{if(abs(align_state)> 2)
/*1031:*/
#line 20596 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Misplaced ");print_cmd_chr(cur_cmd,cur_chr);



if(cur_tok==tab_token+'&')
{help6("I can't figure out why you would want to use a tab mark",
"here. If you just want an ampersand, the remedy is",
"simple: Just type `I\\&' now. But if some right brace",
"up above has ended a previous alignment prematurely,",
"you're probably due for more error messages, and you",
"might try typing `S' now just to see what is salvageable.");
}
else{help5("I can't figure out why you would want to use a tab mark",
"or \\cr or \\span just now. If something like a right brace",
"up above has ended a previous alignment prematurely,",
"you're probably due for more error messages, and you",
"might try typing `S' now just to see what is salvageable.");
}
error();
}

/*:1031*/
#line 20579 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{back_input();
if(align_state<0)
{print_err("Missing { inserted");

incr(align_state);cur_tok= left_brace_token+'{';
}
else{print_err("Missing } inserted");

decr(align_state);cur_tok= right_brace_token+'}';
}
help3("I've put in what seems to be necessary to fix",
"the current column of the current alignment.",
"Try to go on, since this might almost work.");ins_error();
}
}

/*:1030*//*1032:*/
#line 20621 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void no_align_error(void)
{print_err("Misplaced ");print_esc("noalign");

help2("I expect to see \\noalign only after the \\cr of",
"an alignment. Proceed, and I'll ignore this case.");error();
}
static void omit_error(void)
{print_err("Misplaced ");print_esc("omit");

help2("I expect to see \\omit only after tab marks or the \\cr of",
"an alignment. Proceed, and I'll ignore this case.");error();
}

/*:1032*//*1034:*/
#line 20651 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void do_endv(void)
{base_ptr= input_ptr;input_stack[base_ptr]= cur_input;
while((input_stack[base_ptr].index_field!=v_template)&&
(input_stack[base_ptr].loc_field==null)&&
(input_stack[base_ptr].state_field==token_list))decr(base_ptr);
if((input_stack[base_ptr].index_field!=v_template)||
(input_stack[base_ptr].loc_field!=null)||
(input_stack[base_ptr].state_field!=token_list))
fatal_error("(interwoven alignment preambles are not allowed)");

if(cur_group==align_group)
{end_graf();
if(fin_col())fin_row();
}
else off_save();
}

/*:1034*//*1038:*/
#line 20686 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void cs_error(void)
{print_err("Extra ");print_esc("endcsname");

help1("I'm ignoring this, since I wasn't doing a \\csname.");
error();
}

/*:1038*//*1039:*/
#line 20704 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void push_math(group_code c)
{push_nest();mode= -mmode;incompleat_noad= null;new_save_level(c);
}

/*:1039*//*1041:*/
#line 20717 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void init_math(void)
{
scaled w= 0;
scaled l;
scaled s;
pointer p;
int n;
get_token();
if((cur_cmd==math_shift)&&(mode> 0))/*1048:*/
#line 20771 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(head!=tail&&!(type(tail)==whatsit_node&&subtype(tail)==disp_node))
{if(is_char_node(tail))tail_append(new_penalty(inf_penalty))
else if(type(tail)!=glue_node)tail_append(new_penalty(inf_penalty))
else
{type(tail)= penalty_node;delete_glue_ref(glue_ptr(tail));
flush_node_list(leader_ptr(tail));penalty(tail)= inf_penalty;
}
tail_append(new_param_glue(par_fill_skip_code));
}
/*1049:*/
#line 20793 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(par_shape_ptr==null)
if((hang_indent!=0)&&
(((hang_after>=0)&&(prev_graf+2> hang_after))||
(prev_graf+1<-hang_after)))
{l= -abs(hang_indent);cur_hfactor= unity;
if(hang_indent> 0)s= hang_indent;else s= 0;
}
else{l= 0;s= 0;cur_hfactor= unity;
}
else{n= info(par_shape_ptr);
if(prev_graf+2>=n)p= par_shape_ptr+2*n;
else p= par_shape_ptr+2*(prev_graf+2);
s= mem[p-1].sc;l= mem[p].sc;cur_hfactor= 0;
}

/*:1049*/
#line 20781 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
push_math(math_shift_group);mode= mmode;
eq_word_define(int_base+cur_fam_code,-1);
eq_word_define(dimen_base+display_width_code,l);cur_hfactor= 0;
eq_word_define(dimen_base+pre_display_size_code,w);
eq_word_define(dimen_base+display_indent_code,s);
if(every_display!=null)begin_token_list(every_display,every_display_text);
}

/*:1048*/
#line 20726 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{back_input();/*1042:*/
#line 20731 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{push_math(math_shift_group);eq_word_define(int_base+cur_fam_code,-1);
if(every_math!=null)begin_token_list(every_math,every_math_text);
}

/*:1042*/
#line 20727 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}

/*:1041*//*1045:*/
#line 20755 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void start_eq_no(void)
{saved(0)= cur_chr;incr(save_ptr);
/*1042:*/
#line 20731 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{push_math(math_shift_group);eq_word_define(int_base+cur_fam_code,-1);
if(every_math!=null)begin_token_list(every_math,every_math_text);
}

/*:1042*/
#line 20758 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:1045*//*1051:*/
#line 20837 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_math(pointer p)
{
int c;
restart:/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 20841 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
reswitch:switch(cur_cmd){
case letter:case other_char:case char_given:{c= ho(math_code(cur_chr));
if(c==active_math_character_code)
{/*1052:*/
#line 20866 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_chr<utf8_single_size)
cur_cs= cur_chr+active_base;
else
cur_cs= active_lookup(cur_chr);
cur_cmd= eq_type(cur_cs);cur_chr= equiv(cur_cs);
x_token();back_input();
}

/*:1052*/
#line 20845 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto restart;
}
}break;
case char_num:{scan_char_num();cur_chr= cur_val;cur_cmd= char_given;
goto reswitch;
}
case math_char_num:{scan_fifteen_bit_int();math_to_Umath(cur_val);c= cur_val;
}break;
case math_given:c= cur_chr;break;
case delim_num:{scan_twenty_seven_bit_int();c= cur_val/010000;math_to_Umath(c);
}break;
default:/*1053:*/
#line 20878 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{back_input();scan_left_brace();
saved(0)= p;incr(save_ptr);push_math(math_group);return;
}

/*:1053*/
#line 20857 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
math_type(p)= math_char;character(p)= math_code_char(c);
if((math_code_class(c)>=7)&&fam_in_range)fam(p)= cur_fam;
else fam(p)= math_code_fam(c);
}

/*:1051*//*1055:*/
#line 20909 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void set_math_char(int c)
{pointer p;
if(c==active_math_character_code)
/*1052:*/
#line 20866 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_chr<utf8_single_size)
cur_cs= cur_chr+active_base;
else
cur_cs= active_lookup(cur_chr);
cur_cmd= eq_type(cur_cs);cur_chr= equiv(cur_cs);
x_token();back_input();
}

/*:1052*/
#line 20913 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{p= new_noad();math_type(nucleus(p))= math_char;
character(nucleus(p))= math_code_char(c);
fam(nucleus(p))= math_code_fam(c);
if(math_code_class(c)>=7)
{if(fam_in_range)fam(nucleus(p))= cur_fam;
type(p)= ord_noad;
}
else type(p)= ord_noad+math_code_class(c);
link(tail)= p;tail= p;
}
}

/*:1055*//*1059:*/
#line 20981 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void math_limit_switch(void)
{
if(head!=tail)if(type(tail)==op_noad)
{subtype(tail)= cur_chr;return;
}
print_err("Limit controls must follow a math operator");

help1("I'm ignoring this misplaced \\limits or \\nolimits command.");error();
}

/*:1059*//*1060:*/
#line 20997 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_delimiter(pointer p,bool r)
{if(r)scan_twenty_seven_bit_int();
else{/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 21000 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
switch(cur_cmd){
case letter:case other_char:cur_val= del_code(cur_chr);break;
case delim_num:scan_twenty_seven_bit_int();break;
default:cur_val= -1;
}
}
if(cur_val<0)/*1061:*/
#line 21015 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Missing delimiter (. inserted)");

help6("I was expecting to see something like `(' or `\\{' or",
"`\\}' here. If you typed, e.g., `{' instead of `\\{', you",
"should probably delete the `{' by typing `1' now, so that",
"braces don't get unbalanced. Otherwise just proceed.",
"Acceptable delimiters are characters whose \\delcode is",
"nonnegative, or you can use `\\delimiter <delimiter code>'.");
back_error();cur_val= 0;
}

/*:1061*/
#line 21008 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
small_fam(p)= (cur_val/04000000)%16;
small_char(p)= qi((cur_val/010000)%256);
large_fam(p)= (cur_val/256)%16;
large_char(p)= qi(cur_val%256);
}

/*:1060*//*1063:*/
#line 21030 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void math_radical(void)
{tail_append(get_node(radical_noad_size));
type(tail)= radical_noad;subtype(tail)= normal;
mem[nucleus(tail)].hh= empty_field;
mem[subscr(tail)].hh= empty_field;
mem[supscr(tail)].hh= empty_field;
scan_delimiter(left_delimiter(tail),true);scan_math(nucleus(tail));
}

/*:1063*//*1065:*/
#line 21043 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void math_ac(void)
{if(cur_cmd==accent)
/*1066:*/
#line 21060 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Please use ");print_esc("mathaccent");
print(" for accents in math mode");

help2("I'm changing \\accent to \\mathaccent here; wish me luck.",
"(Accents are not the same in formulas as they are in text.)");
error();
}

/*:1066*/
#line 21046 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
tail_append(get_node(accent_noad_size));
type(tail)= accent_noad;subtype(tail)= normal;
mem[nucleus(tail)].hh= empty_field;
mem[subscr(tail)].hh= empty_field;
mem[supscr(tail)].hh= empty_field;
math_type(accent_chr(tail))= math_char;
scan_fifteen_bit_int();
character(accent_chr(tail))= cur_val&0xFF;
if((cur_val>=0x7000)&&fam_in_range)fam(accent_chr(tail))= cur_fam;
else fam(accent_chr(tail))= (cur_val>>8)&0xF;
scan_math(nucleus(tail));
}

/*:1065*//*1072:*/
#line 21107 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void append_choices(void)
{tail_append(new_choice());incr(save_ptr);saved(-1)= 0;
push_math(math_choice_group);scan_left_brace();
}

/*:1072*//*1074:*/
#line 21116 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1084:*/
#line 21261 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer fin_mlist(pointer p)
{pointer q;
if(incompleat_noad!=null)/*1085:*/
#line 21270 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{math_type(denominator(incompleat_noad))= sub_mlist;
info(denominator(incompleat_noad))= link(head);
if(p==null)q= incompleat_noad;
else{q= info(numerator(incompleat_noad));
if((type(q)!=left_noad)||(delim_ptr==null))confusion("right");

info(numerator(incompleat_noad))= link(delim_ptr);
link(delim_ptr)= incompleat_noad;link(incompleat_noad)= p;
}
}

/*:1085*/
#line 21264 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{link(tail)= p;q= link(head);
}
pop_nest();return q;
}

/*:1084*/
#line 21117 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void build_choices(void)
{
pointer p;
unsave();p= fin_mlist(null);
switch(saved(-1)){
case 0:display_mlist(tail)= p;break;
case 1:text_mlist(tail)= p;break;
case 2:script_mlist(tail)= p;break;
case 3:{script_script_mlist(tail)= p;decr(save_ptr);return;
}
}
incr(saved(-1));push_math(math_choice_group);scan_left_brace();
}

/*:1074*//*1076:*/
#line 21140 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void sub_sup(void)
{small_number t;
pointer p;
t= empty;p= null;
if(tail!=head)if(scripts_allowed(tail))
{p= supscr(tail)+cur_cmd-sup_mark;
t= math_type(p);
}
if((p==null)||(t!=empty))/*1077:*/
#line 21153 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{tail_append(new_noad());
p= supscr(tail)+cur_cmd-sup_mark;
if(t!=empty)
{if(cur_cmd==sup_mark)
{print_err("Double superscript");

help1("I treat `x^1^2' essentially like `x^1{}^2'.");
}
else{print_err("Double subscript");

help1("I treat `x_1_2' essentially like `x_1{}_2'.");
}
error();
}
}

/*:1077*/
#line 21149 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
scan_math(p);
}

/*:1076*//*1081:*/
#line 21210 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void math_fraction(void)
{small_number c;
c= cur_chr;
if(incompleat_noad!=null)
/*1083:*/
#line 21242 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(c>=delimited_code)
{scan_delimiter(garbage,false);scan_delimiter(garbage,false);
}
if(c%delimited_code==above_code)scan_normal_dimen;
print_err("Ambiguous; you need another { and }");

help3("I'm ignoring this fraction specification, since I don't",
"know whether a construction like `x \\over y \\over z'",
"means `{x \\over y} \\over z' or `x \\over {y \\over z}'.");
error();
}

/*:1083*/
#line 21215 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{incompleat_noad= get_node(fraction_noad_size);
type(incompleat_noad)= fraction_noad;
subtype(incompleat_noad)= normal;
math_type(numerator(incompleat_noad))= sub_mlist;
info(numerator(incompleat_noad))= link(head);
mem[denominator(incompleat_noad)].hh= empty_field;
mem[left_delimiter(incompleat_noad)].qqqq= null_delimiter;
mem[right_delimiter(incompleat_noad)].qqqq= null_delimiter;
link(head)= null;tail= head;
/*1082:*/
#line 21229 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(c>=delimited_code)
{scan_delimiter(left_delimiter(incompleat_noad),false);
scan_delimiter(right_delimiter(incompleat_noad),false);
}
switch(c%delimited_code){
case above_code:{scan_normal_dimen;
thickness(incompleat_noad)= cur_val;
}break;
case over_code:thickness(incompleat_noad)= default_code;break;
case atop_code:thickness(incompleat_noad)= 0;
}

/*:1082*/
#line 21225 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}

/*:1081*//*1091:*/
#line 21326 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void math_left_right(void)
{small_number t;
pointer p;
pointer q;
t= cur_chr;
if((t!=left_noad)&&(cur_group!=math_left_group))
/*1092:*/
#line 21354 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(cur_group==math_shift_group)
{scan_delimiter(garbage,false);
print_err("Extra ");
if(t==middle_noad)
{print_esc("middle");

help1("I'm ignoring a \\middle that had no matching \\left.");
}
else{print_esc("right");

help1("I'm ignoring a \\right that had no matching \\left.");
}
error();
}
else off_save();
}

/*:1092*/
#line 21333 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{p= new_noad();type(p)= t;
scan_delimiter(delimiter(p),false);
if(t==middle_noad)
{type(p)= right_noad;subtype(p)= middle_noad;
}
if(t==left_noad)q= p;
else{q= fin_mlist(p);unsave();
}
if(t!=right_noad)
{push_math(math_left_group);link(head)= q;tail= p;
delim_ptr= p;
}
else{
tail_append(new_noad());type(tail)= inner_noad;
math_type(nucleus(tail))= sub_mlist;
info(nucleus(tail))= q;
}
}
}

/*:1091*//*1094:*/
#line 21378 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void after_math(void)
{bool l;
bool danger;
int m;
pointer p;
pointer a;
danger= false;
/*1095:*/
#line 21407 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((font_params[fam_fnt(2+text_size)]<total_mathsy_params)||
(font_params[fam_fnt(2+script_size)]<total_mathsy_params)||
(font_params[fam_fnt(2+script_script_size)]<total_mathsy_params))
{print_err("Math formula deleted: Insufficient symbol fonts");

help3("Sorry, but I can't typeset math unless \\textfont 2",
"and \\scriptfont 2 and \\scriptscriptfont 2 have all",
"the \\fontdimen values needed in math symbol fonts.");
error();flush_math();danger= true;
}
else if((font_params[fam_fnt(3+text_size)]<total_mathex_params)||
(font_params[fam_fnt(3+script_size)]<total_mathex_params)||
(font_params[fam_fnt(3+script_script_size)]<total_mathex_params))
{print_err("Math formula deleted: Insufficient extension fonts");
help3("Sorry, but I can't typeset math unless \\textfont 3",
"and \\scriptfont 3 and \\scriptscriptfont 3 have all",
"the \\fontdimen values needed in math extension fonts.");
error();flush_math();danger= true;
}
else
/*1096:*/
#line 21432 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int f;
for(f= 0;f<7;f++)
{if(needs_loading(fam_fnt(f+text_size)))
read_predefined_font(fam_fnt(f+text_size));
if(needs_loading(fam_fnt(f+script_size)))
read_predefined_font(fam_fnt(f+script_size));
if(needs_loading(fam_fnt(f+script_script_size)))
read_predefined_font(fam_fnt(f+script_script_size));
}
if(fam_in_range)
{f= cur_fam;
if(needs_loading(fam_fnt(f+text_size)))
read_predefined_font(fam_fnt(f+text_size));
if(needs_loading(fam_fnt(f+script_size)))
read_predefined_font(fam_fnt(f+script_size));
if(needs_loading(fam_fnt(f+script_script_size)))
read_predefined_font(fam_fnt(f+script_script_size));
}
}


/*:1096*/
#line 21428 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1095*/
#line 21387 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
m= mode;l= false;p= fin_mlist(null);
if(mode==-m)
{/*1098:*/
#line 21472 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();
if(cur_cmd!=math_shift)
{print_err("Display math should end with $$");

help2("The `$' that I just saw supposedly matches a previous `$$'.",
"So I shall assume that you typed `$$' both times.");
back_error();
}
}


/*:1098*/
#line 21390 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
cur_mlist= p;cur_style= text_style;mlist_penalties= false;
mlist_to_hlist();a= hpack(link(temp_head),natural);
unsave();decr(save_ptr);
if(saved(0)==1)l= true;
danger= false;
/*1095:*/
#line 21407 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((font_params[fam_fnt(2+text_size)]<total_mathsy_params)||
(font_params[fam_fnt(2+script_size)]<total_mathsy_params)||
(font_params[fam_fnt(2+script_script_size)]<total_mathsy_params))
{print_err("Math formula deleted: Insufficient symbol fonts");

help3("Sorry, but I can't typeset math unless \\textfont 2",
"and \\scriptfont 2 and \\scriptscriptfont 2 have all",
"the \\fontdimen values needed in math symbol fonts.");
error();flush_math();danger= true;
}
else if((font_params[fam_fnt(3+text_size)]<total_mathex_params)||
(font_params[fam_fnt(3+script_size)]<total_mathex_params)||
(font_params[fam_fnt(3+script_script_size)]<total_mathex_params))
{print_err("Math formula deleted: Insufficient extension fonts");
help3("Sorry, but I can't typeset math unless \\textfont 3",
"and \\scriptfont 3 and \\scriptscriptfont 3 have all",
"the \\fontdimen values needed in math extension fonts.");
error();flush_math();danger= true;
}
else
/*1096:*/
#line 21432 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int f;
for(f= 0;f<7;f++)
{if(needs_loading(fam_fnt(f+text_size)))
read_predefined_font(fam_fnt(f+text_size));
if(needs_loading(fam_fnt(f+script_size)))
read_predefined_font(fam_fnt(f+script_size));
if(needs_loading(fam_fnt(f+script_script_size)))
read_predefined_font(fam_fnt(f+script_script_size));
}
if(fam_in_range)
{f= cur_fam;
if(needs_loading(fam_fnt(f+text_size)))
read_predefined_font(fam_fnt(f+text_size));
if(needs_loading(fam_fnt(f+script_size)))
read_predefined_font(fam_fnt(f+script_size));
if(needs_loading(fam_fnt(f+script_script_size)))
read_predefined_font(fam_fnt(f+script_script_size));
}
}


/*:1096*/
#line 21428 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1095*/
#line 21397 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
m= mode;p= fin_mlist(null);
}
else a= null;
if(m<0)/*1097:*/
#line 21460 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{tail_append(new_math(math_surround,before));
cur_mlist= p;cur_style= text_style;mlist_penalties= (mode> 0);mlist_to_hlist();
link(tail)= link(temp_head);
while(link(tail)!=null)tail= link(tail);
tail_append(new_math(math_surround,after));
space_factor= 1000;unsave();
}

/*:1097*/
#line 21401 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else{if(a==null)/*1098:*/
#line 21472 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();
if(cur_cmd!=math_shift)
{print_err("Display math should end with $$");

help2("The `$' that I just saw supposedly matches a previous `$$'.",
"So I shall assume that you typed `$$' both times.");
back_error();
}
}


/*:1098*/
#line 21402 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1099:*/
#line 21488 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_mlist= p;cur_style= display_style;mlist_penalties= false;
mlist_to_hlist();p= link(temp_head);link(temp_head)= null;
{pointer q;
q= new_disp_node();
if(!danger){display_formula(q)= p;display_eqno(q)= a;display_left(q)= l;}




if(hang_indent!=0)
{new_param_node(dimen_type,hang_indent_code,hang_indent);
if(hang_after!=1)
new_param_node(int_type,hang_after_code,hang_after);
}
new_param_node(dimen_type,line_skip_limit_code,line_skip_limit);
new_param_node(glue_type,line_skip_code,line_skip);
new_param_node(glue_type,baseline_skip_code,baseline_skip);

#if 0 
new_param_node(dimen_type,math_quad_no...)
#endif
#line 21510 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

new_param_node(int_type,pre_display_penalty_code,pre_display_penalty);
new_param_node(int_type,post_display_penalty_code,post_display_penalty);
new_param_node(glue_type,above_display_skip_code,above_display_skip);
new_param_node(glue_type,below_display_skip_code,below_display_skip);
new_param_node(glue_type,above_display_short_skip_code,above_display_short_skip);
new_param_node(glue_type,below_display_short_skip_code,below_display_short_skip);

display_params(q)= link(temp_head);link(temp_head)= null;
display_no_bs(q)= prev_depth<=ignore_depth;
tail_append(q);
}
resume_after_display()

/*:1099*/
#line 21403 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
}

/*:1094*//*1100:*/
#line 21524 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void resume_after_display(void)
{if(cur_group!=math_shift_group)confusion("display");

unsave();
mode= hmode;space_factor= 1000;set_cur_lang;clang= cur_lang;
prev_graf= (norm_min(left_hyphen_min)*0100+norm_min(right_hyphen_min))
*0200000+cur_lang;
/*438:*/
#line 9248 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();if(cur_cmd!=spacer)back_input();
}

/*:438*/
#line 21532 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:1100*//*1106:*/
#line 21652 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1110:*/
#line 21730 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void get_r_token(void)
{
restart:do{get_token();
}while(!(cur_tok!=space_token));
if((cur_cs==0)||(cur_cs> frozen_control_sequence))
{print_err("Missing control sequence inserted");

help5("Please don't say `\\def cs{...}', say `\\def\\cs{...}'.",
"I've inserted an inaccessible control sequence so that your",
"definition will be completed without mixing me up too badly.",
"You can recover graciously from this error, if you're",
"careful; see exercise 27.2 in The TeXbook.");

if(cur_cs==0)back_input();
cur_tok= cs_token_flag+frozen_protection;ins_error();goto restart;
}
}

/*:1110*//*1124:*/
#line 21978 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void trap_zero_glue(void)
{if((width(cur_val)==0)&&(stretch(cur_val)==0)&&(shrink(cur_val)==0))
{add_glue_ref(zero_glue);
delete_glue_ref(cur_val);cur_val= zero_glue;
}
}

/*:1124*//*1131:*/
#line 22083 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void do_register_command(small_number a)
{
pointer l,q,r,s;
int p;
bool e;
int w;
q= cur_cmd;
e= false;
/*1132:*/
#line 22115 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(q!=internal_register)
{get_x_token();
if((cur_cmd>=assign_int)&&(cur_cmd<=assign_mu_glue))
{l= cur_chr;p= cur_cmd-assign_int;goto found;
}
if(cur_cmd!=internal_register)
{print_err("You can't use `");print_cmd_chr(cur_cmd,cur_chr);

print("' after ");print_cmd_chr(q,0);
help1("I'm forgetting what you said and not changing anything.");
error();return;
}
}
if((cur_chr<mem_bot)||(cur_chr> lo_mem_stat_max))
{l= cur_chr;p= sa_type(l);e= true;
}
else{p= cur_chr-mem_bot;scan_register_num();
if(cur_val> 255)
{find_sa_element(p,cur_val,true);l= cur_ptr;e= true;
}
else
switch(p){
case int_val:l= cur_val+count_base;break;
case dimen_val:l= cur_val+scaled_base;break;
case glue_val:l= cur_val+skip_base;break;
case mu_val:l= cur_val+mu_skip_base;
}
}
}
found:if(p<glue_val)if(e)w= sa_int(l);else w= eqtb[l].i;
else if(e)s= sa_ptr(l);else s= equiv(l)

/*:1132*/
#line 22092 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(q==internal_register)scan_optional_equals();
else if(scan_keyword("by"))do_nothing;

arith_error= false;
if(q<multiply)/*1133:*/
#line 22148 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(p<glue_val)
{if(p==int_val)scan_int();else scan_normal_dimen;
if(q==advance)
{cur_val= cur_val+w;
if(!e&&l>=dimen_base)
{cur_hfactor+= hfactor_eqtb[l].sc;
cur_vfactor+= vfactor_eqtb[l].sc;
}
}
}
else{scan_glue(p);
if(q==advance)/*1134:*/
#line 22163 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{q= new_spec(cur_val);r= s;
delete_glue_ref(cur_val);
width(q)= width(q)+width(r);
if(stretch(q)==0)stretch_order(q)= normal;
if(stretch_order(q)==stretch_order(r))stretch(q)= stretch(q)+stretch(r);
else if((stretch_order(q)<stretch_order(r))&&(stretch(r)!=0))
{stretch(q)= stretch(r);stretch_order(q)= stretch_order(r);
}
if(shrink(q)==0)shrink_order(q)= normal;
if(shrink_order(q)==shrink_order(r))shrink(q)= shrink(q)+shrink(r);
else if((shrink_order(q)<shrink_order(r))&&(shrink(r)!=0))
{shrink(q)= shrink(r);shrink_order(q)= shrink_order(r);
}
cur_val= q;
}

/*:1134*/
#line 22160 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:1133*/
#line 22097 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*1135:*/
#line 22180 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_int();
if(p<glue_val)
if(q==multiply)
if(p==int_val)cur_val= mult_integers(w,cur_val);
else cur_val= nx_plus_y(w,cur_val,0);
else cur_val= x_over_n(w,cur_val);
else{r= new_spec(s);
if(q==multiply)
{width(r)= nx_plus_y(width(s),cur_val,0);
stretch(r)= nx_plus_y(stretch(s),cur_val,0);
shrink(r)= nx_plus_y(shrink(s),cur_val,0);
}
else{width(r)= x_over_n(width(s),cur_val);
stretch(r)= x_over_n(stretch(s),cur_val);
shrink(r)= x_over_n(shrink(s),cur_val);
}
cur_val= r;
}
}

/*:1135*/
#line 22098 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(arith_error)
{print_err("Arithmetic overflow");

help2("I can't carry out that multiplication or division,",
"since the result is out of range.");
if(p>=glue_val)delete_glue_ref(cur_val);
error();return;
}
if(p<glue_val)sa_word_define(l,cur_val);
else{trap_zero_glue();sa_define(l,cur_val,l,glue_ref,cur_val);
}
}

/*:1131*//*1138:*/
#line 22232 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void alter_aux(void)
{halfword c;
if(cur_chr!=abs(mode))report_illegal_case();
else{c= cur_chr;scan_optional_equals();
if(c==vmode)
{scan_normal_dimen;prev_depth= cur_val;
}
else{scan_int();
if((cur_val<=0)||(cur_val> 32767))
{print_err("Bad space factor");

help1("I allow only values in the range 1..32767 here.");
int_error(cur_val);
}
else space_factor= cur_val;
}
}
}

/*:1138*//*1139:*/
#line 22252 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void alter_prev_graf(void)
{int p;
nest[nest_ptr]= cur_list;p= nest_ptr;
while(abs(nest[p].mode_field)!=vmode)decr(p);
scan_optional_equals();scan_int();
if(cur_val<0)
{print_err("Bad ");print_esc("prevgraf");

help1("I allow only nonnegative values here.");
int_error(cur_val);
}
else{nest[p].pg_field= cur_val;cur_list= nest[nest_ptr];
}
}

/*:1139*//*1140:*/
#line 22268 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void alter_page_so_far(void)
{int c;
c= cur_chr;scan_optional_equals();scan_normal_dimen;
page_so_far[c]= cur_val;
}

/*:1140*//*1141:*/
#line 22275 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void alter_integer(void)
{small_number c;

c= cur_chr;scan_optional_equals();scan_int();
if(c==0)dead_cycles= cur_val
/*1316:*/
#line 25453 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
else if(c==2)
{if((cur_val<batch_mode)||(cur_val> error_stop_mode))
{print_err("Bad interaction mode");

help2("Modes are 0=batch, 1=nonstop, 2=scroll, and",
"3=errorstop. Proceed, and I'll ignore this case.");
int_error(cur_val);
}
else{cur_chr= cur_val;new_interaction();
}
}

/*:1316*/
#line 22281 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else insert_penalties= cur_val;
}

/*:1141*//*1142:*/
#line 22285 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void alter_box_dimen(void)
{small_number c;
pointer b;
c= cur_chr;scan_register_num();fetch_box(b);scan_optional_equals();
scan_normal_dimen;
if(b!=null)mem[b+c].sc= cur_val;
}

/*:1142*//*1152:*/
#line 22383 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_font(small_number a)
{
pointer u;
scaled s;
int f= null_font;
str_number t;
str_number nom,aire;
int old_setting;
str_number flushable_string;
bool file_opened;
char*path= NULL;
if(job_name==0)open_log_file();


get_r_token();u= cur_cs;
if(u>=hash_base)t= text(u);
else if(u>=single_base)
if(u==null_cs)t= s_no("FONT");else t= u-single_base;
else{old_setting= selector;selector= new_string;
print("FONT");
if(u-active_base<utf8_single_size)
printn(u-active_base);
else
print_utf8(active_hash[u]);
selector= old_setting;

str_room(1);t= make_string();
}
define(u,set_font,null_font);scan_optional_equals();scan_font_name();
nom= cur_name;aire= cur_area;
/*1153:*/
#line 22441 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

name_in_progress= true;
if(scan_keyword("at"))/*1154:*/
#line 22458 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_normal_dimen;s= cur_val;
if((s<=0)||(s>=01000000000))
{print_err("Improper `at' size (");
print_scaled(s);print("pt), replaced by 10pt");

help2("I can only handle fonts at positive sizes that are",
"less than 2048pt, so I've changed what you said to 10pt.");
error();s= 10*unity;
}
}

/*:1154*/
#line 22443 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


else if(scan_keyword("scaled"))

{scan_int();s= -cur_val;
if((cur_val<=0)||(cur_val> 32768))
{print_err("Illegal magnification has been changed to 1000");

help1("The magnification ratio must be between 1 and 32768.");
int_error(cur_val);s= -1000;
}
}
else s= -1000;
name_in_progress= false

/*:1153*/
#line 22414 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1838:*/
#line 34972 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(tracing_fonts> 0)
{
begin_diagnostic();
print_nl("Requested font \"");
printn(cur_area);printn(cur_name);printn(cur_ext);
print_char('"');
if(s<0){
print(" scaled ");
print_int(-s);
}else{
print(" at ");
print_scaled(s);
print("pt");
}
end_diagnostic(false);
}

/*:1838*/
#line 22415 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1155:*/
#line 22475 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

flushable_string= str_ptr-1;
for(f= font_base+1;f<=font_ptr;f++)
if(!IS_X_FONT(f)&&str_eq_str(font_name[f],cur_name)&&str_eq_str(font_area[f],cur_area))
{if(cur_name==flushable_string)
{flush_string;cur_name= font_name[f];
}
if(s> 0)
{if(s==font_size[f])goto common_ending;
}
else if(font_size[f]==xn_over_d(font_dsize[f],-s,1000))
goto common_ending;
}

/*:1155*/
#line 22417 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*557:*/
#line 11607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

pack_file_name(cur_name,empty_string,empty_string,".tfm");
path= kpse_find_file((char*)name_of_file+1,kpse_tfm_format,0);
if(path!=NULL&&b_open_in(&tfm_file,path))file_opened= true;
else file_opened= false;

/*:557*/
#line 22418 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(file_opened)
f= read_font_info(u,cur_name,cur_area,cur_ext,s);
else
{/*1837:*/
#line 34960 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{pack_file_name(cur_name,cur_area,empty_string,"");
path= kpse_find_file((char*)name_of_file+1,kpse_opentype_format,0);
if(path==NULL)
path= kpse_find_file((char*)name_of_file+1,kpse_truetype_format,0);
}


/*:1837*/
#line 22422 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(path!=NULL)
{if(font_ptr==font_max||fmem_ptr+8> font_mem_size)
/*561:*/
#line 11677 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{start_font_error_message;
print(" not loaded: Not enough room left");

help4("I'm afraid I won't be able to make use of this font,",
"because my memory for character-size data is too small.",
"If you're really stuck, ask a wizard to enlarge me.",
"Or maybe try `I\\font<same font id>=<name of loaded font>'.");
error();goto done;
}

/*:561*/
#line 22425 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
font_ptr++;
f= font_ptr;
font_name[f]= nom;
read_extended_font(f,t,cur_name,cur_area,s,path);
/*1849:*/
#line 35284 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hyphen_char[f]= '-';skew_char[f]= -1;
bchar_label[f]= non_address;
font_bchar[f]= non_char;font_false_bchar[f]= non_char;
char_base[f]= extended_base;width_base[f]= 0;
height_base[f]= 0;depth_base[f]= 0;
italic_base[f]= 0;lig_kern_base[f]= 0;
kern_base[f]= 0;exten_base[f]= 0;
font_glue[f]= null;
font_params[f]= 7;
if((font_ptr==font_max)||(fmem_ptr+font_params[f]+1> font_mem_size))
/*561:*/
#line 11677 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{start_font_error_message;
print(" not loaded: Not enough room left");

help4("I'm afraid I won't be able to make use of this font,",
"because my memory for character-size data is too small.",
"If you're really stuck, ask a wizard to enlarge me.",
"Or maybe try `I\\font<same font id>=<name of loaded font>'.");
error();goto done;
}

/*:561*/
#line 35295 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1828:*/
#line 34768 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

param_base[f]= fmem_ptr;
fmem_ptr= fmem_ptr+font_params[f]+1;
font_info[param_base[f]].sc= 0;
{hb_position_t h;
hb_ot_metrics_get_position_with_fallback(x_font[f]->f,HB_OT_METRICS_TAG_X_HEIGHT,&h);

x_height(f)= HB_TO_SCALED(h);
}


/*:1828*//*1829:*/
#line 34782 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{double r;
r= hb_style_get_value(x_font[f]->f,HB_STYLE_TAG_SLANT_RATIO);
slant(f)= (ONE*r+0.5);
}


/*:1829*//*1850:*/
#line 35299 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{hb_set_t*uset= hb_set_create();
hb_face_t*face= hb_font_get_face(x_font[f]->f);
hb_face_collect_unicodes(face,uset);
font_bc[f]= hb_set_get_min(uset);
font_ec[f]= hb_set_get_max(uset);
hb_set_destroy(uset);
}

/*:1850*//*1851:*/
#line 35309 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{space(f)= x_char_width(f,' ');
space_stretch(f)= space(f)/2;
space_shrink(f)= space(f)/3;
extra_space(f)= space(f)/3;
quad(f)= font_size[f];
}


/*:1851*/
#line 35296 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;

/*:1849*/
#line 22430 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
else
{done:
f= null_font;
}
}
common_ending:
define(u,set_font,f);eqtb[font_id_base+f]= eqtb[u];font_id_text(f)= t;
}

/*:1152*//*1160:*/
#line 22518 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_interaction(void)
{print_ln();
interaction= cur_chr;
/*70:*/
#line 1675 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(interaction==batch_mode)selector= no_print;else selector= term_only

/*:70*/
#line 22522 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(log_opened)selector= selector+2;
}

/*:1160*/
#line 21653 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void prefixed_command(void)
{
small_number a;
internal_font_number f;
int j;
font_index k;
pointer p,q;
int n;
bool e;
a= 0;
while(cur_cmd==prefix)
{if(!odd(a/cur_chr))a= a+cur_chr;
/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 21666 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd<=max_non_prefixed_command)
/*1107:*/
#line 21681 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("You can't use a prefix with `");

print_cmd_chr(cur_cmd,cur_chr);print_char('\'');
help1("I'll pretend you didn't say \\long or \\outer or \\global.");
if(eTeX_ex)help_line[0]= 
"I'll pretend you didn't say \\long or \\outer or \\global or \\protected.";
back_error();return;
}

/*:1107*/
#line 21668 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(tracing_commands> 2)if(eTeX_ex)show_cur_cmd_chr();
}
/*1108:*/
#line 21691 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(a>=8)
{j= protected_token;a= a-8;
}
else j= 0;
if((cur_cmd!=def)&&((a%4!=0)||(j!=0)))
{print_err("You can't use `");print_esc("long");print("' or `");
print_esc("outer");
help1("I'll pretend you didn't say \\long or \\outer here.");
if(eTeX_ex)
{help_line[0]= 
"I'll pretend you didn't say \\long or \\outer or \\protected here.";
print("' or `");print_esc("protected");
}
print("' with `");

print_cmd_chr(cur_cmd,cur_chr);print_char('\'');
error();
}

/*:1108*/
#line 21671 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1109:*/
#line 21718 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(global_defs!=0)
if(global_defs<0)
{if(global)a= a-4;
}
else{if(!global)a= a+4;
}

/*:1109*/
#line 21672 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
switch(cur_cmd){
/*1112:*/
#line 21759 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_font:
if(needs_loading(cur_chr))
read_predefined_font(cur_chr);
define(cur_font_loc,data,cur_chr);break;

/*:1112*//*1113:*/
#line 21769 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case def:{if(odd(cur_chr)&&!global&&(global_defs>=0))a= a+4;
e= (cur_chr>=2);get_r_token();p= cur_cs;
q= scan_toks(true,e);
if(j!=0)
{q= get_avail();info(q)= j;link(q)= link(def_ref);
link(def_ref)= q;
}
define(p,call+(a%4),def_ref);
}break;

/*:1113*//*1116:*/
#line 21791 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case let:{n= cur_chr;
get_r_token();p= cur_cs;
if(n==normal)
{do{get_token();
}while(!(cur_cmd!=spacer));
if(cur_tok==other_token+'=')
{get_token();
if(cur_cmd==spacer)get_token();
}
}
else{get_token();q= cur_tok;get_token();back_input();
cur_tok= q;back_input();
}
if(cur_cmd>=call)add_token_ref(cur_chr);
else if((cur_cmd==internal_register)||(cur_cmd==toks_register))
if((cur_chr<mem_bot)||(cur_chr> lo_mem_stat_max))
add_sa_ref(cur_chr);
define(p,cur_cmd,cur_chr);
}break;

/*:1116*//*1119:*/
#line 21863 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case shorthand_def:{n= cur_chr;get_r_token();p= cur_cs;define(p,relax,256);
scan_optional_equals();
switch(n){
case char_def_code:{scan_char_num();define(p,char_given,cur_val);
}break;
case math_char_def_code:{scan_fifteen_bit_int();math_to_Umath(cur_val);define(p,math_given,cur_val);
}break;
default:{scan_register_num();
if(cur_val> 255)
{j= n-count_def_code;
if(j> mu_val)j= tok_val;
find_sa_element(j,cur_val,true);add_sa_ref(cur_ptr);
if(j==tok_val)j= toks_register;else j= internal_register;
define(p,j,cur_ptr);
}
else
switch(n){
case count_def_code:define(p,assign_int,count_base+cur_val);break;
case dimen_def_code:define(p,assign_dimen,scaled_base+cur_val);break;
case skip_def_code:define(p,assign_glue,skip_base+cur_val);break;
case mu_skip_def_code:define(p,assign_mu_glue,mu_skip_base+cur_val);break;
case toks_def_code:define(p,assign_toks,toks_base+cur_val);
}
}
}
}break;

/*:1119*//*1120:*/
#line 21891 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case read_to_cs:{j= cur_chr;scan_int();n= cur_val;
if(!scan_keyword("to"))

{print_err("Missing `to' inserted");

help2("You should have said `\\read<number> to \\cs'.",
"I'm going to look for the \\cs now.");error();
}
get_r_token();
p= cur_cs;read_toks(n,p,j);define(p,call,cur_val);
}break;

/*:1120*//*1121:*/
#line 21908 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case toks_register:case assign_toks:{q= cur_cs;
e= false;
if(cur_cmd==toks_register)
if(cur_chr==mem_bot)
{scan_register_num();
if(cur_val> 255)
{find_sa_element(tok_val,cur_val,true);
cur_chr= cur_ptr;e= true;
}
else cur_chr= toks_base+cur_val;
}
else e= true;
p= cur_chr;
scan_optional_equals();
/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 21923 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd!=left_brace)/*1122:*/
#line 21940 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((cur_cmd==toks_register)||(cur_cmd==assign_toks))
{if(cur_cmd==toks_register)
if(cur_chr==mem_bot)
{scan_register_num();
if(cur_val<256)q= equiv(toks_base+cur_val);
else{find_sa_element(tok_val,cur_val,false);
if(cur_ptr==null)q= null;
else q= sa_ptr(cur_ptr);
}
}
else q= sa_ptr(cur_chr);
else q= equiv(cur_chr);
if(q==null)sa_define(p,null,p,undefined_cs,null);
else{add_token_ref(q);sa_define(p,q,p,call,q);
}
goto done;
}

/*:1122*/
#line 21925 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
back_input();cur_cs= q;q= scan_toks(false,false);
if(link(def_ref)==null)
{sa_define(p,null,p,undefined_cs,null);free_avail(def_ref);
}
else{if((p==output_routine_loc)&&!e)
{link(q)= get_avail();q= link(q);
info(q)= right_brace_token+'}';
q= get_avail();info(q)= left_brace_token+'{';
link(q)= link(def_ref);link(def_ref)= q;
}
sa_define(p,def_ref,p,call,def_ref);
}
}break;

/*:1121*//*1123:*/
#line 21961 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case assign_int:{p= cur_chr;scan_optional_equals();scan_int();
word_define(p,cur_val);
}break;
case assign_dimen:{p= cur_chr;scan_optional_equals();
scan_normal_dimen;word_define(p,cur_val);
}break;
case assign_glue:case assign_mu_glue:{p= cur_chr;n= cur_cmd;scan_optional_equals();
if(n==assign_mu_glue)scan_glue(mu_val);else scan_glue(glue_val);
trap_zero_glue();
define(p,glue_ref,cur_val);
}break;

/*:1123*//*1127:*/
#line 22028 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case def_code:{int cp;
/*1128:*/
#line 22057 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cur_chr==math_code_base)n= 0x7FFFFFFF;
else if(cur_chr==utf_cat_code_base)n= max_char_code;
else if(cur_chr==utf_math_code_base)n= 0x7FFFFFFF;
else if(cur_chr==utf_math_codenum_base)n= 0x7FFFFFFF;
else if(cur_chr==utf_sf_code_base)n= 077777;
else if(cur_chr==utf_lc_code_base)n= 0x10FFFF;
else if(cur_chr==utf_uc_code_base)n= 0x10FFFF;
else if(cur_chr==utf_del_code_base)n= 077777777;
else n= 255

/*:1128*/
#line 22030 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= cur_chr;scan_char_num();cp= cur_val;scan_optional_equals();
if(p==utf_math_code_base)
{/*1813:*/
#line 34408 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int fam,class;
scan_int();class= cur_val;scan_int();fam= cur_val;scan_int();
if(fam<0||fam> 0xff)
{print_err("Invalid family (");print_int(fam);
print("), should be in the range 0..255");
error();fam= 1;
}
if(class<0||class> 7)
{print_err("Invalid class (");print_int(class);
print("), should be in the range 0..7");
error();class= 7;
}
cur_val= (((fam<<3)|class)<<21)|cur_val;
}

/*:1813*/
#line 22033 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= utf_math_codenum_base;
}
else
scan_int();
if(p==math_code_base)
{math_to_Umath(cur_val);p= utf_math_codenum_base;
}
if(p>=utf_first_base&&cp<0x100)p= utf_adjust_base(p);
if(((cur_val<0)&&(p<del_code_base))||(cur_val> n))
{print_err("Invalid code (");print_int(cur_val);

if(p<del_code_base)print("), should be in the range 0..");
else print("), should be at most ");
print_int(n);
help1("I'm going to use 0 instead of that illegal code value.");
error();cur_val= 0;
}
if(p>=utf_first_base)utf_define(p,cp,cur_val,global);
else if(p<math_code_base)define(p+cp,data,cur_val);
else if(p<del_code_base)define(p+cp,data,hi(cur_val));
else word_define(p+cp,cur_val);
}break;

/*:1127*//*1129:*/
#line 22068 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case def_family:{p= cur_chr;scan_four_bit_int();p= p+cur_val;
scan_optional_equals();scan_font_ident();define(p,data,cur_val);
if(needs_loading(cur_val))
read_predefined_font(cur_val);
}break;

/*:1129*//*1130:*/
#line 22077 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case internal_register:case advance:
case multiply:case divide:do_register_command(a);break;

/*:1130*//*1136:*/
#line 22205 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_box:{scan_register_num();
if(global)n= global_box_flag+cur_val;else n= box_flag+cur_val;
scan_optional_equals();
if(set_box_allowed)scan_box(n);
else{print_err("Improper ");print_esc("setbox");

help2("Sorry, \\setbox is not allowed after \\halign in a display,",
"or between \\accent and an accented character.");error();
}
}break;

/*:1136*//*1137:*/
#line 22225 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_aux:alter_aux();break;
case set_prev_graf:alter_prev_graf();break;
case set_page_dimen:alter_page_so_far();break;
case set_page_int:alter_integer();break;
case set_box_dimen:alter_box_dimen();break;

/*:1137*//*1143:*/
#line 22296 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_shape:{q= cur_chr;scan_optional_equals();scan_int();n= cur_val;
if(n<=0)p= null;
else if(q> par_shape_loc)
{n= (cur_val/2)+1;p= get_node(2*n+1);info(p)= n;
n= cur_val;mem[p+1].i= n;
for(j= p+2;j<=p+n+1;j++)
{scan_int();mem[j].i= cur_val;
}
if(!odd(n))mem[p+n+2].i= 0;
}
else{
scaled fh= 0,fv= 0;
p= get_node(2*n+1);info(p)= n;
for(j= 1;j<=n;j++)
{scan_normal_dimen;
mem[p+2*j-1].sc= cur_val;
scan_normal_dimen;
if(j==1){fh= cur_hfactor;fv= cur_vfactor;}
mem[p+2*j].sc= cur_val;
}
cur_hfactor= fh;cur_vfactor= fv;
}
define(q,shape_ref,p);
}break;

/*:1143*//*1147:*/
#line 22341 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hyph_data:if(cur_chr==1)
{
#ifdef INIT
new_patterns();goto done;
#endif
#line 22347 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 print_err("Patterns can be loaded only by INITEX");

help0;error();
do{get_token();}while(!(cur_cmd==right_brace));
return;
}
else{new_hyph_exceptions();goto done;
}break;

/*:1147*//*1148:*/
#line 22359 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case assign_font_dimen:{find_font_dimen(true);k= cur_val;
scan_optional_equals();scan_normal_dimen;font_info[k].sc= cur_val;
}break;
case assign_font_int:{n= cur_chr;scan_font_ident();f= cur_val;
scan_optional_equals();scan_int();
if(n==0)hyphen_char[f]= cur_val;else skew_char[f]= cur_val;
}break;

/*:1148*//*1151:*/
#line 22380 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case def_font:new_font(a);break;

/*:1151*//*1159:*/
#line 22515 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case set_interaction:new_interaction();break;

/*:1159*/
#line 21674 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:confusion("prefix");

}
done:/*1164:*/
#line 22540 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(after_token!=0)
{cur_tok= after_token;back_input();after_token= 0;
}

/*:1164*/
#line 21678 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:1106*//*1165:*/
#line 22548 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void do_assignments(void)
{
loop{/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 22551 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd<=max_non_prefixed_command)return;
set_box_allowed= false;prefixed_command();set_box_allowed= true;
}
}

/*:1165*//*1170:*/
#line 22576 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void open_or_close_in(void)
{int c;
int n;
c= cur_chr;scan_four_bit_int();n= cur_val;
if(read_open[n]!=closed)
{a_close(&read_file[n]);read_open[n]= closed;
}
if(c!=0)
{scan_optional_equals();scan_file_name();
pack_cur_name(".tex");
if(a_open_in(&read_file[n]))read_open[n]= just_open;
}
}

/*:1170*//*1174:*/
#line 22607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void issue_message(void)
{int old_setting;
int c;
str_number s;
c= cur_chr;link(garbage)= scan_toks(false,true);
old_setting= selector;selector= new_string;
token_show(def_ref);selector= old_setting;
flush_list(def_ref);
str_room(1);s= make_string();
if(c==0)/*1175:*/
#line 22622 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(term_offset+length(s)> max_print_line-2)print_ln();
else if((term_offset> 0)||(file_offset> 0))print_char(' ');
slow_print(s);update_terminal;
}

/*:1175*/
#line 22617 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*1178:*/
#line 22637 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("");slow_print(s);
if(err_help!=null)use_err_help= true;
else if(long_help_seen)help1("(That was another \\errmessage.)")
else{if(interaction<error_stop_mode)long_help_seen= true;
help4("This error message was generated by an \\errmessage",
"command, so I can't give any explicit help.",
"Pretend that you're Hercule Poirot: Examine all clues,",

"and deduce the truth by order and method.");
}
error();use_err_help= false;
}

/*:1178*/
#line 22618 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
flush_string;
}

/*:1174*//*1183:*/
#line 22674 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void shift_case(void)
{pointer b;
pointer p;
halfword t;
int c;
b= cur_chr;p= scan_toks(false,false);p= link(def_ref);
while(p!=null)
{/*1184:*/
#line 22693 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

t= info(p);
if(t<cs_token_flag+single_base)
{c= t%cmd_factor;
if(c>=utf8_single_size)
c= active_hash[c];
if(b==utf_lc_code_base)
{int d= utf_lccode(c);
if(d!=0)info(p)= t-c+d;
}
else if(b==utf_uc_code_base)
{int d= utf_uccode(c);
if(d!=0)info(p)= t-c+d;
}
}

/*:1184*/
#line 22682 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
p= link(p);
}
back_list(link(def_ref));free_avail(def_ref);
}

/*:1183*//*1188:*/
#line 22739 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void show_whatever(void)
{
pointer p;
small_number t;
int m;
int l;
int n;
switch(cur_chr){
case show_lists_code:{begin_diagnostic();show_activities();
}break;
case show_box_code:/*1191:*/
#line 22799 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{scan_register_num();fetch_box(p);begin_diagnostic();
print_nl("> \\box");print_int(cur_val);print_char('=');
if(p==null)print("void");else show_box(p);
}

/*:1191*/
#line 22750 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case show_code:/*1189:*/
#line 22776 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_token();
if(interaction==error_stop_mode)wake_up_terminal;
print_nl("> ");
if(cur_cs!=0)
{sprint_cs(cur_cs);print_char('=');
}
print_meaning();goto common_ending;
}

/*:1189*/
#line 22751 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1297:*/
#line 25204 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case show_groups:{begin_diagnostic();show_save_groups();
}break;

/*:1297*//*1311:*/
#line 25420 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case show_ifs:{begin_diagnostic();print_nl("");print_ln();
if(cond_ptr==null)
{print_nl("### ");print("no active conditionals");
}
else{p= cond_ptr;n= 0;
do{incr(n);p= link(p);}while(!(p==null));
p= cond_ptr;t= cur_if;l= if_line;m= if_limit;
do{print_nl("### level ");print_int(n);print(": ");
print_cmd_chr(if_test,t);
if(m==fi_code)print_esc("else");
print_if_line(l);
decr(n);t= subtype(p);l= if_line_field(p);m= type(p);p= link(p);
}while(!(p==null));
}
}break;

/*:1311*/
#line 22752 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:/*1192:*/
#line 22805 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{the_toks();
if(interaction==error_stop_mode)wake_up_terminal;
print_nl("> ");token_show(temp_head);
flush_list(link(temp_head));goto common_ending;
}

/*:1192*/
#line 22754 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
/*1193:*/
#line 22812 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

end_diagnostic(true);print_err("OK");

if(selector==term_and_log)if(tracing_online<=0)
{selector= term_only;print(" (see the transcript file)");
selector= term_and_log;
}

/*:1193*/
#line 22756 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
common_ending:if(interaction<error_stop_mode)
{help0;decr(error_count);
}
else if(tracing_online> 0)
{
help3("This isn't an error message; I'm just \\showing something.",
"Type `I\\show...' to show more (e.g., \\show\\cs,",
"\\showthe\\count10, \\showbox255, \\showlists).");
}
else{
help5("This isn't an error message; I'm just \\showing something.",
"Type `I\\show...' to show more (e.g., \\show\\cs,",
"\\showthe\\count10, \\showbox255, \\showlists).",
"And type `I\\tracingonline=1\\show...' to show boxes and",
"lists on your terminal as well as in the transcript file.");
}
error();
}

/*:1188*//*1197:*/
#line 22848 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
static void store_fmt_file(void)
{
int j,k,l;
int p,q;
int x;
four_quarters w;
/*1199:*/
#line 22909 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(save_ptr!=0)
{print_err("You can't dump inside a group");

help1("`{...\\dump}' is a no-no.");succumb;
}

/*:1199*/
#line 22856 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1223:*/
#line 23329 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

selector= new_string;
print(" (preloaded format=");printn(job_name);print_char(' ');
print_int(year);print_char('.');
print_int(month);print_char('.');print_int(day);print_char(')');
if(interaction==batch_mode)selector= log_only;
else selector= term_and_log;
str_room(1);
format_ident= make_string();
pack_job_name(format_extension);
while(!w_open_out(&fmt_file))
prompt_file_name("format file name",format_extension);
print_nl("Beginning to dump on file ");

slow_print(w_make_name_string(&fmt_file));flush_string;
print_nl("");slow_print(format_ident)

/*:1223*/
#line 22858 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
eqtb[dimen_base+hsize_code].i= hhsize;
eqtb[dimen_base+vsize_code].i= hvsize;
/*1202:*/
#line 22944 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(0);
/*1275:*/
#line 24947 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(eTeX_mode);
for(j= 0;j<=eTeX_states-1;j++)eTeX_state(j)= 0;

/*:1275*//*1330:*/
#line 25606 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

while(pseudo_files!=null)pseudo_close();

/*:1330*/
#line 22946 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1432:*/
#line 27211 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(Prote_mode);

/*:1432*/
#line 22947 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1473:*/
#line 27604 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= ROM_base;k<=ROM_size;k++)dump_wd(ROM[k]);

/*:1473*/
#line 22948 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(mem_bot);
dump_int(mem_top);
dump_int(eqtb_size);
dump_int(hash_prime);
dump_int(hyph_size)

/*:1202*/
#line 22861 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1204:*/
#line 22983 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(pool_ptr);
dump_int(str_ptr);
for(k= 0;k<=str_ptr;k++)dump_int(str_start[k]);
k= 0;
while(k+4<pool_ptr)
{dump_four_ASCII;k= k+4;
}
k= pool_ptr-4;dump_four_ASCII;
print_ln();print_int(str_ptr);print(" strings of total length ");
print_int(pool_ptr)

/*:1204*/
#line 22862 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1206:*/
#line 23018 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

sort_avail();var_used= 0;
dump_int(lo_mem_max);dump_int(rover);
if(eTeX_ex)for(k= int_val;k<=tok_val;k++)dump_int(sa_root[k]);
p= mem_bot;q= rover;x= 0;
do{for(k= p;k<=q+1;k++)dump_wd(mem[k]);
x= x+q+2-p;var_used= var_used+q-p;
p= q+node_size(q);q= rlink(q);
}while(!(q==rover));
var_used= var_used+lo_mem_max-p;dyn_used= mem_end+1-hi_mem_min;
for(k= p;k<=lo_mem_max;k++)dump_wd(mem[k]);
x= x+lo_mem_max+1-p;
dump_int(hi_mem_min);dump_int(avail);
for(k= hi_mem_min;k<=mem_end;k++)dump_wd(mem[k]);
x= x+mem_end+1-hi_mem_min;
p= avail;
while(p!=null)
{decr(dyn_used);p= link(p);
}
dump_int(var_used);dump_int(dyn_used);
print_ln();print_int(x);
print(" memory locations dumped; current usage is ");
print_int(var_used);print_char('&');print_int(dyn_used)

/*:1206*/
#line 22863 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1208:*/
#line 23066 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1210:*/
#line 23089 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

k= active_base;
do{j= k;
while(j<int_base-1)
{if((equiv(j)==equiv(j+1))&&(eq_type(j)==eq_type(j+1))&&
(eq_level(j)==eq_level(j+1)))goto found1;
incr(j);
}
l= int_base;goto done1;
found1:incr(j);l= j;
while(j<int_base-1)
{if((equiv(j)!=equiv(j+1))||(eq_type(j)!=eq_type(j+1))||
(eq_level(j)!=eq_level(j+1)))goto done1;
incr(j);
}
done1:dump_int(l-k);
while(k<l)
{dump_wd(eqtb[k]);incr(k);
}
k= j+1;dump_int(k-l);
}while(!(k==int_base))

/*:1210*/
#line 23067 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1211:*/
#line 23111 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{j= k;
while(j<eqtb_size)
{if(eqtb[j].i==eqtb[j+1].i)goto found2;
incr(j);
}
l= eqtb_size+1;goto done2;
found2:incr(j);l= j;
while(j<eqtb_size)
{if(eqtb[j].i!=eqtb[j+1].i)goto done2;
incr(j);
}
done2:dump_int(l-k);
while(k<l)
{dump_wd(eqtb[k]);incr(k);
}
k= j+1;dump_int(k-l);
}while(!(k> eqtb_size))

/*:1211*/
#line 23068 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1821:*/
#line 34630 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(active_used);
j= active_used;
k= 0;
p= 0;
while(j> 0)
{if(active_hash0[k]!=0)
{dump_int((k<<24)|active_hash0[k]);
j--;
p= k;
}
else if(k-p>=0xFF)
{dump_int(0xFF<<24);
p= k;
}
k++;
if(k>=active_hash_size)break;
}

/*:1821*/
#line 23069 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(par_loc);dump_int(write_loc);
dump_int(input_loc);
/*1213:*/
#line 23147 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(hash_used);cs_count= frozen_control_sequence-1-hash_used;
for(p= hash_base;p<=hash_used;p++)if(text(p)!=0)
{dump_int(p);dump_hh(hash[p]);incr(cs_count);
}
for(p= hash_used+1;p<=undefined_control_sequence-1;p++)dump_hh(hash[p]);
dump_int(cs_count);
print_ln();print_int(cs_count);print(" multiletter control sequences")

/*:1213*/
#line 23072 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1208*/
#line 22864 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1215:*/
#line 23163 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(fmem_ptr);
for(k= 0;k<=fmem_ptr-1;k++)dump_wd(font_info[k]);
dump_int(font_ptr);
for(k= null_font;k<=font_ptr;k++)
{
#if 0
if(IS_X_FONT(k))fatal_error("I can't dump extended fonts. Sorry!");
#endif
#line 23172 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*1217:*/
#line 23185 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{dump_qqqq(font_check[k]);
dump_int(font_size[k]);
dump_int(font_dsize[k]);
dump_int(font_params[k]);
dump_int(hyphen_char[k]);
dump_int(skew_char[k]);
dump_int(font_name[k]);
dump_int(font_area[k]);
dump_int(font_bc[k]);
dump_int(font_ec[k]);
dump_int(char_base[k]);
dump_int(width_base[k]);
dump_int(height_base[k]);
dump_int(depth_base[k]);
dump_int(italic_base[k]);
dump_int(lig_kern_base[k]);
dump_int(kern_base[k]);
dump_int(exten_base[k]);
dump_int(param_base[k]);
dump_int(font_glue[k]);
dump_int(bchar_label[k]);
dump_int(font_bchar[k]);
dump_int(font_false_bchar[k]);
print_nl("\\font");printn_esc(font_id_text(k));print_char('=');
print_file_name(font_name[k],font_area[k],empty_string);
if(font_size[k]!=font_dsize[k])
{print(" at ");print_scaled(font_size[k]);print("pt");
}
}

/*:1217*/
#line 23172 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
print_ln();print_int(fmem_ptr-7);print(" words of font info for ");
print_int(font_ptr-font_base);print(" preloaded font");
if(font_ptr!=font_base+1)print_char('s')

/*:1215*/
#line 22865 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1219:*/
#line 23242 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(hyph_count);
for(k= 0;k<=hyph_size;k++)if(hyph_word[k]!=0)
{dump_int(k);dump_int(hyph_word[k]);dump_int(hyph_list[k]);
}
print_ln();print_int(hyph_count);print(" hyphenation exception");
if(hyph_count!=1)print_char('s');
if(trie_not_ready)init_trie();
dump_int(trie_max);
dump_int(hyph_start);
for(k= 0;k<=trie_max;k++)dump_hh(trie[k]);
dump_int(max_hyph_char);
dump_int(trie_op_ptr);
for(k= 1;k<=trie_op_ptr;k++)
{dump_int(hyf_distance[k]);
dump_int(hyf_num[k]);
dump_int(hyf_next[k]);
}
print_nl("Hyphenation trie of length ");print_int(trie_max);

print(" has ");print_int(trie_op_ptr);print(" op");
if(trie_op_ptr!=1)print_char('s');
print(" out of ");print_int(trie_op_size);
print_nl("Largest codepoint in hyphenation patterns ");print_int(max_hyph_char);
print(" is lower than ");print_int(max_pattern_char);
for(k= max_language;k>=0;k--)if(trie_used[k]> min_quarterword)
{print_nl("  ");print_int(qo(trie_used[k]));
print(" for language ");print_int(k);
dump_int(k);dump_int(qo(trie_used[k]));
}

/*:1219*/
#line 22866 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1221:*/
#line 23318 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dump_int(interaction);dump_int(format_ident);dump_int(69069);
tracing_stats= 0

/*:1221*/
#line 22867 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1224:*/
#line 23346 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

w_close(&fmt_file)

/*:1224*/
#line 22868 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
eqtb[dimen_base+hsize_code].i= 0;
eqtb[dimen_base+vsize_code].i= 0;
}
#endif
#line 22873 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1197*//*1243:*/
#line 23973 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1244:*/
#line 24213 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_spaces(void)
{/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 24215 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
back_input();
}
static void scan_destination(pointer p)
{if(scan_keyword("name"))
{label_has_name(p)= 1;
scan_toks(false,true);label_ptr(p)= def_ref;
}
else if(scan_keyword("num"))
{label_has_name(p)= 0;scan_int();label_ptr(p)= cur_val;
}
else
{print_err("`name {...}' or `num 000' expected. Inserted `num 0'.");
label_has_name(p)= 0;label_ptr(p)= 0;
error();
return;
}
scan_spaces();
}
static void scan_label(pointer p)
{if(!scan_keyword("goto"))
print_err("keyword `goto' inserted");
scan_destination(p);
}

/*:1244*//*1245:*/
#line 24244 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_whatsit(small_number s,small_number w)
{pointer p;
p= get_node(w);type(p)= whatsit_node;subtype(p)= s;
link(tail)= p;tail= p;
}

/*:1245*//*1246:*/
#line 24254 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_write_whatsit(small_number w)
{new_whatsit(cur_chr,w);
if(w!=write_node_size)scan_four_bit_int();
else{scan_int();
if(cur_val<0)cur_val= 17;
else if(cur_val> 15)cur_val= 16;
}
write_stream(tail)= cur_val;
}

/*:1246*//*1581:*/
#line 28955 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void scan_scaled(void)
{
bool negative= false;
int f;
int k,kk;
pointer p,q;
f= 0;arith_error= false;cur_order= normal;negative= false;
/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 28963 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_tok==other_token+'-')negative= true;
else if(cur_tok==other_token+'+')negative= false;
else back_input();
if(cur_tok==continental_point_token)cur_tok= point_token;
if(cur_tok!=point_token)scan_int();
else{radix= 10;cur_val= 0;}
if(cur_tok==continental_point_token)cur_tok= point_token;
if((radix==10)&&(cur_tok==point_token))/*447:*/
#line 9402 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{k= 0;p= null;get_token();
loop{get_x_token();
if((cur_tok> zero_token+9)||(cur_tok<zero_token))goto done1;
if(k<17)
{q= get_avail();link(q)= p;info(q)= cur_tok-zero_token;
p= q;incr(k);
}
}
done1:for(kk= k;kk>=1;kk--)
{dig[kk-1]= info(p);q= p;p= link(p);free_avail(q);
}
f= round_decimals(k);
if(cur_cmd!=spacer)back_input();
}

/*:447*/
#line 28971 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_val<0)
{negative= !negative;negate(cur_val);}
if(cur_val>=040000)arith_error= true;
else cur_val= cur_val*unity+f;
/*438:*/
#line 9248 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();if(cur_cmd!=spacer)back_input();
}

/*:438*/
#line 28976 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(arith_error||(abs(cur_val)>=010000000000))
/*455:*/
#line 9558 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Dimension too large");

help2("I can't work with sizes bigger than about 19 feet.",
"Continue and I'll use the largest value I can.");
error();cur_val= max_dimen;arith_error= false;
}

/*:455*/
#line 28978 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(negative)negate(cur_val);
}

/*:1581*//*1582:*/
#line 28992 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static uint8_t scan_rgb_component(bool expect_reals)
{if(expect_reals)
{scan_scaled();cur_val= (cur_val*0xFF+0x1000)>>16;}
else
scan_int();
if(cur_val> 0xFF)return 0xFF;
else if(cur_val<0)return 0x00;
else return cur_val;
}

static uint32_t scan_rgb_color(bool expect_reals)
{uint8_t r,g,b,a;
r= scan_rgb_component(expect_reals);
g= scan_rgb_component(expect_reals);
b= scan_rgb_component(expect_reals);
a= 0xFF;
/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 29009 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd!=right_brace)
{back_input();
a= scan_rgb_component(expect_reals);
/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 29013 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd!=right_brace)
{back_input();
print_err("Missing right brace after color definition");
}
}
return(r<<24)|(g<<16)|(b<<8)|a;
}

static double scan_cmyk_component(bool expect_reals)
{double c;
if(expect_reals)
{scan_scaled();c= cur_val/(double)ONE;
}
else
{scan_int();c= cur_val/255.0;
}
if(c> 1.0)return 1.0;
else if(c<0.0)return 0.0;
else return c;
}


static uint32_t scan_cmyk_color(bool expect_reals)
{uint8_t r,g,b,a;
double c,m,y,k;
c= scan_cmyk_component(expect_reals);
m= scan_cmyk_component(expect_reals);
y= scan_cmyk_component(expect_reals);
k= scan_cmyk_component(expect_reals);
a= 0xFF;
/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 29044 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd!=right_brace)
{back_input();
a= scan_cmyk_component(expect_reals)*0xFF+0.5;
/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 29048 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd!=right_brace)
{back_input();
print_err("Missing right brace after color definition");
}
}
r= (1-c)*(1-k)*255+0.5;
g= (1-m)*(1-k)*255+0.5;
b= (1-y)*(1-k)*255+0.5;
return(r<<24)|(g<<16)|(b<<8)|a;
}

static uint32_t scan_color(bool expect_reals)
{scan_left_brace();
if(scan_keyword("cmyk"))
return scan_cmyk_color(expect_reals);
else if(scan_keyword("rgb"))
return scan_rgb_color(expect_reals);
else
return scan_rgb_color(expect_reals);
}

/*:1582*//*1583:*/
#line 29078 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void colorset_copy(ColorSet to,ColorSet from)
{int i;
for(i= 0;i<sizeof(ColorSet)/sizeof(uint32_t);i++)
to[i]= from[i];
}

static bool scan_color_pair(ColorSet c,int m,int s)
{if(scan_keyword("FG"))c[m*6+s*2+0]= scan_color(false);
else if(scan_keyword("fg"))c[6*m+2*s+0]= scan_color(true);
else return false;
if(scan_keyword("BG"))c[m*6+s*2+1]= scan_color(false);
else if(scan_keyword("bg"))c[m*6+s*2+1]= scan_color(true);
return true;
}

static void scan_color_triple(ColorSet c,int m)
{if(!scan_color_pair(c,m,0))
{print_err("Missing color specification");
return;
}
if(scan_color_pair(c,m,1))scan_color_pair(c,m,2);
}

static void scan_color_spec(ColorSet c,int i)
{colorset_copy(c,colors[i]);
scan_left_brace();
scan_color_triple(c,0);
if(scan_keyword("dark"))scan_color_triple(c,1);
/*399:*/
#line 8607 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!((cur_cmd!=spacer)&&(cur_cmd!=relax)))

/*:399*/
#line 29107 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(cur_cmd!=right_brace)
{print_err("A color specification must end with }");
back_error();
}
}

/*:1583*/
#line 23974 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void do_extension(void)
{int k;
pointer p;
switch(cur_chr){
case open_node:/*1247:*/
#line 24265 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{new_write_whatsit(open_node_size);
scan_optional_equals();scan_file_name();
open_name(tail)= cur_name;open_area(tail)= cur_area;open_ext(tail)= cur_ext;
}

/*:1247*/
#line 23979 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case write_node:/*1248:*/
#line 24275 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{k= cur_cs;new_write_whatsit(write_node_size);
cur_cs= k;p= scan_toks(false,false);write_tokens(tail)= def_ref;
}

/*:1248*/
#line 23980 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case close_node:/*1249:*/
#line 24280 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{new_write_whatsit(write_node_size);write_tokens(tail)= null;
}

/*:1249*/
#line 23981 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case special_node:/*1250:*/
#line 24288 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(scan_keyword("shipout"))
{new_whatsit(latespecial_node,write_node_size);write_stream(tail)= null;
p= scan_toks(false,false);write_tokens(tail)= def_ref;
}else
{new_whatsit(special_node,write_node_size);write_stream(tail)= null;
p= scan_toks(false,true);write_tokens(tail)= def_ref;
}}

/*:1250*/
#line 23982 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case param_node:
case par_node:
case disp_node:
case baseline_node:
case hpack_node:
case vpack_node:
case hset_node:
case vset_node:
case align_node:break;
case image_node:
{pointer p;
scaled iw= 0,ih= 0;
double ia= 0.0;
scan_optional_equals();
scan_file_name();
p= new_image_node(cur_name,cur_area,cur_ext);
loop{
if(scan_keyword("width"))
{scan_normal_dimen;image_xwidth(p)= new_xdimen(cur_val,cur_hfactor,cur_vfactor);
if(cur_hfactor==0&&cur_vfactor==0)iw= cur_val;
}
else if(scan_keyword("height"))
{scan_normal_dimen;image_xheight(p)= new_xdimen(cur_val,cur_hfactor,cur_vfactor);
if(cur_hfactor==0&&cur_vfactor==0)ih= cur_val;
}
else
break;
}
{
pointer r,q;
if(ih!=0&&iw!=0)ia= (double)iw/ih;
else hextract_image_dimens(image_no(p),&ia,&iw,&ih);
image_aspect(p)= round(ia*ONE);
r= image_xwidth(p);
q= image_xheight(p);
if(r==null&&q==null)
{if(iw> 0)
{image_xwidth(p)= r= new_xdimen(iw,0,0);
image_xheight(p)= q= new_xdimen(ih,0,0);
}
else if(iw<0)
{MESSAGE("Unable to determine size of image %s; using 72dpi.\n",
dir[image_no(p)].file_name);
image_xwidth(p)= r= new_xdimen(-iw,0,0);
image_xheight(p)= q= new_xdimen(-ih,0,0);
}
else
{MESSAGE("Unable to determine size of image %s; using 100pt x 100pt\n",
dir[image_no(p)].file_name);
image_xwidth(p)= r= new_xdimen(100*ONE,0,0);
image_xheight(p)= q= new_xdimen(100*ONE,0,0);
}
}
else if(r!=null&&q==null)
image_xheight(p)= q= new_xdimen(round(xdimen_width(r)/ia),
round(xdimen_hfactor(r)/ia),round(xdimen_vfactor(r)/ia));
else if(r==null&&q!=null)
image_xwidth(p)= r= new_xdimen(round(xdimen_width(q)*ia),
round(xdimen_hfactor(q)*ia),round(xdimen_vfactor(q)*ia));
}
if(abs(mode)==vmode)
{prev_depth= ignore_depth;

append_to_vlist(p);
}
else
tail_append(p);
break;
}
case color_node:
{ColorSet c;
new_whatsit(color_node,color_node_size);
scan_color_spec(c,0);
color_ref(tail)= next_colorset(c);
color_link(tail)= null;
default_color_frozen= true;
}
break;
case no_color_node:break;
case end_color_node:
{new_whatsit(end_color_node,color_node_size);
color_ref(tail)= 0xFF;
color_link(tail)= null;
}
break;
case default_color_node:
if(default_color_frozen)
{print_err("You can not use \\HINTdefaultcolor after \\HINTcolor");
error();
}
else
{ColorSet c;
scan_color_spec(c,0);
colorset_copy(colors[0],c);
}
break;
case link_color_node:
{ColorSet c;
scan_color_spec(c,1);
cur_link_color= next_colorset(c);
default_link_color_frozen= true;
}
break;
case default_link_color_node:
if(default_link_color_frozen)
{print_err("You can not use \\HINTdefaultlinkcolor after \\HINTlinkcolor");error();
}
else
{ColorSet c;
scan_color_spec(c,1);
colorset_copy(colors[1],c);
}
break;
case start_link_node:
if(abs(mode)==vmode)
fatal_error("HINTstartlink cannot be used in vertical mode");
else
{new_whatsit(start_link_node,link_node_size);
scan_label(as_label(tail));
color_ref(tail)= cur_link_color;
}
break;
case end_link_node:
if(abs(mode)==vmode)
fatal_error("HINTendlink cannot be used in vertical mode");
else
{new_whatsit(end_link_node,link_node_size);
color_ref(tail)= 0xFF;
}
break;
case label_node:
new_whatsit(label_node,label_node_size);
scan_destination(tail);
if(scan_keyword("top"))label_where(tail)= 1;
else if(scan_keyword("bot"))label_where(tail)= 2;
else label_where(tail)= 3;
scan_spaces();
break;
case outline_node:
new_whatsit(outline_node,outline_node_size);
scan_label(tail);
if(scan_keyword("depth"))
{scan_int();
outline_depth(tail)= cur_val;
}
else outline_depth(tail)= 0;
outline_ptr(tail)= null;
new_save_level(outline_group);scan_left_brace();
push_nest();mode= -hmode;prev_depth= ignore_depth;space_factor= 1000;
break;
case setpage_node:
{uint8_t n;
pointer t;
scan_eight_bit_int();n= cur_val;
if(n==0)
{print_err("Illegal redefinition of page template 0");print_int(n);error();break;}
scan_optional_equals();
scan_file_name();
t= new_setpage_node(n,cur_name);
loop{
if(scan_keyword("priority"))
{scan_eight_bit_int();setpage_priority(t)= cur_val;}
else if(scan_keyword("width"))
{scan_normal_dimen;delete_xdimen_ref(setpage_width(t));
setpage_width(t)= new_xdimen(cur_val,cur_hfactor,cur_vfactor);}
else if(scan_keyword("height"))
{scan_normal_dimen;delete_xdimen_ref(setpage_height(t));
setpage_height(t)= new_xdimen(cur_val,cur_hfactor,cur_vfactor);}
else
break;
}
new_save_level(page_group);scan_left_brace();normal_paragraph();
push_nest();mode= -vmode;prev_depth= ignore_depth;
break;
}
case stream_node:
{uint8_t n;
scan_eight_bit_int();n= cur_val;
new_whatsit(stream_node,stream_node_size);
stream_insertion(tail)= n;
stream_number(tail)= hget_stream_no(n);
break;
}
case setstream_node:
{uint8_t n;
pointer t,s;
scan_eight_bit_int();n= cur_val;
scan_optional_equals();
t= link(setpage_head);
if(t==null){print_err("\\setstream without \\setpage");error();break;}
s= new_setstream_node(n);
link(s)= setpage_streams(t);setpage_streams(t)= s;
loop{
if(scan_keyword("preferred"))
{scan_eight_bit_int();
if(cur_val!=255)
setstream_preferred(s)= hget_stream_no(cur_val);}
else if(scan_keyword("next"))
{scan_eight_bit_int();
if(cur_val!=255)
setstream_next(s)= hget_stream_no(cur_val);}
else if(scan_keyword("ratio"))
{scan_int();setstream_ratio(s)= cur_val;}
else
break;
}
new_save_level(stream_group);scan_left_brace();normal_paragraph();
push_nest();mode= -vmode;prev_depth= ignore_depth;
break;
}
case stream_before_node:
scan_optional_equals();
new_save_level(stream_before_group);scan_left_brace();normal_paragraph();
push_nest();mode= -vmode;prev_depth= ignore_depth;
break;
case stream_after_node:
scan_optional_equals();
new_save_level(stream_after_group);scan_left_brace();normal_paragraph();
push_nest();mode= -vmode;prev_depth= ignore_depth;
break;
case xdimen_node:
case ignore_node:break;
case immediate_code:/*1265:*/
#line 24827 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{get_x_token();
if((cur_cmd==extension)&&(cur_chr<=close_node))
{p= tail;do_extension();
out_what(tail);
flush_node_list(tail);tail= p;link(p)= null;
}
else back_input();
}

/*:1265*/
#line 24205 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case set_language_code:/*1267:*/
#line 24855 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(abs(mode)!=hmode)report_illegal_case();
else{new_whatsit(language_node,small_node_size);
scan_int();
if(cur_val<=0)clang= 0;
else if(cur_val> max_language)clang= 0;
else clang= cur_val;
what_lang(tail)= clang;
what_lhm(tail)= norm_min(left_hyphen_min);
what_rhm(tail)= norm_min(right_hyphen_min);
}

/*:1267*/
#line 24206 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
/*1496:*/
#line 27791 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case reset_timer_code:reset_timer;break;

/*:1496*//*1561:*/
#line 28494 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case save_pos_code:/*1562:*/
#line 28501 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{new_whatsit(save_pos_code,small_node_size);write_stream(tail)= null;
write_tokens(tail)= null;
}

/*:1562*/
#line 28495 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;

/*:1561*/
#line 24207 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:confusion("ext1");

}
}

/*:1243*//*1266:*/
#line 24841 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void fix_language(void)
{int l;
if(language<=0)l= 0;
else if(language> max_language)l= 0;
else l= language;
if(l!=clang)
{new_whatsit(language_node,small_node_size);
what_lang(tail)= l;clang= l;
what_lhm(tail)= norm_min(left_hyphen_min);
what_rhm(tail)= norm_min(right_hyphen_min);
}
}

/*:1266*/
#line 18979 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*971:*/
#line 19681 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void handle_right_brace(void)
{pointer p,q;
scaled d;
int f;
switch(cur_group){
case simple_group:unsave();break;
case bottom_level:{print_err("Too many }'s");

help2("You've closed more groups than you opened.",
"Such booboos are generally harmless, so keep going.");error();
}break;
case semi_simple_group:case math_shift_group:
case math_left_group:extra_right_brace();break;
/*988:*/
#line 20031 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hbox_group:package(0);break;
case adjusted_hbox_group:{adjust_tail= adjust_head;package(0);
}break;
case vbox_group:{end_graf();package(0);
}break;
case vtop_group:{end_graf();package(vtop_code);
}break;

/*:988*//*1003:*/
#line 20203 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case insert_group:{end_graf();q= split_top_skip;add_glue_ref(q);
d= split_max_depth;f= floating_penalty;unsave();decr(save_ptr);

p= link(head);pop_nest();
if(saved(0)<255)
{tail_append(get_node(ins_node_size));
type(tail)= ins_node;subtype(tail)= qi(saved(0));
height(tail)= 0;ins_ptr(tail)= p;hget_stream_no(subtype(tail));
split_top_ptr(tail)= q;depth(tail)= d;float_cost(tail)= f;
}
else{tail_append(get_node(small_node_size));
type(tail)= adjust_node;
subtype(tail)= 0;
adjust_ptr(tail)= p;delete_glue_ref(q);
}
if(nest_ptr==0)build_page();
}break;
case output_group:/*929:*/
#line 18892 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if((loc!=null)||
((token_type!=output_text)&&(token_type!=backed_up)))
/*930:*/
#line 18913 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{print_err("Unbalanced output routine");

help2("Your sneaky output routine has problematic {'s and/or }'s.",
"I can't handle that very well; good luck.");error();
do{get_token();
}while(!(loc==null));
}

/*:930*/
#line 18895 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
end_token_list();
end_graf();unsave();output_active= false;insert_penalties= 0;
/*931:*/
#line 18922 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(box(255)!=null)
{print_err("Output routine didn't use all of ");
print_esc("box");print_int(255);

help3("Your \\output commands should empty \\box255,",
"e.g., by saying `\\shipout\\box255'.",
"Proceed; I'll discard its present contents.");
box_error(255);
}

/*:931*/
#line 18898 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(tail!=head)
{link(page_tail)= link(head);
page_tail= tail;
}
if(link(page_head)!=null)
{if(link(contrib_head)==null)contrib_tail= page_tail;
link(page_tail)= link(contrib_head);
link(contrib_head)= link(page_head);
link(page_head)= null;page_tail= page_head;
}
flush_node_list(page_disc);page_disc= null;
pop_nest();build_page();
}

/*:929*/
#line 20221 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case page_group:hfinish_page_group();break;
case stream_group:hfinish_stream_group();break;
case stream_before_group:hfinish_stream_before_group();break;
case stream_after_group:hfinish_stream_after_group();break;
case outline_group:hfinish_outline_group();break;

/*:1003*//*1021:*/
#line 20424 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case disc_group:build_discretionary();break;

/*:1021*//*1035:*/
#line 20669 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case align_group:{back_input();cur_tok= cs_token_flag+frozen_cr;
print_err("Missing ");print_esc("cr");print(" inserted");

help1("I'm guessing that you meant to end an alignment here.");
ins_error();
}break;

/*:1035*//*1036:*/
#line 20677 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case no_align_group:{end_graf();unsave();align_peek();
}break;

/*:1036*//*1068:*/
#line 21075 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vcenter_group:{end_graf();unsave();save_ptr= save_ptr-2;
p= vpack(link(head),saved(1),saved_hfactor(1),saved_vfactor(1),saved(0),false);pop_nest();
tail_append(new_noad());type(tail)= vcenter_noad;
math_type(nucleus(tail))= sub_box;info(nucleus(tail))= p;
}break;

/*:1068*//*1073:*/
#line 21113 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case math_choice_group:build_choices();break;

/*:1073*//*1086:*/
#line 21287 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case math_group:{unsave();decr(save_ptr);
math_type(saved(0))= sub_mlist;p= fin_mlist(null);info(saved(0))= p;
if(p!=null)if(link(p)==null)
if(type(p)==ord_noad)
{if(math_type(subscr(p))==empty)
if(math_type(supscr(p))==empty)
{mem[saved(0)].hh= mem[nucleus(p)].hh;
free_node(p,noad_size);
}
}
else if(type(p)==accent_noad)if(saved(0)==nucleus(tail))
if(type(tail)==ord_noad)/*1087:*/
#line 21302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{q= head;while(link(q)!=tail)q= link(q);
link(q)= p;free_node(tail,noad_size);tail= p;
}

/*:1087*/
#line 21299 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}break;

/*:1086*/
#line 19696 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:confusion("rightbrace");

}
}

/*:971*/
#line 18980 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void main_control(void)
{




int t;
if(every_job!=null)begin_token_list(every_job,every_job_text);
big_switch:get_x_token();
reswitch:/*934:*/
#line 19017 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(interrupt!=0)if(OK_to_interrupt)
{back_input();check_interrupt;goto big_switch;
}
#ifdef DEBUG
if(panicking)check_mem(false);
#endif
#line 19024 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 if(tracing_commands> 0)show_cur_cmd_chr()

/*:934*/
#line 18990 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
switch(abs(mode)+cur_cmd){
case hmode+letter:case hmode+other_char:
case hmode+char_given:goto main_loop;
case hmode+char_num:{scan_char_num();cur_chr= cur_val;goto main_loop;}
case hmode+no_boundary:{get_x_token();
if((cur_cmd==letter)||(cur_cmd==other_char)||(cur_cmd==char_given)||
(cur_cmd==char_num))cancel_boundary= true;
goto reswitch;
}
case hmode+spacer:if(space_factor==1000)goto append_normal_space;
else app_space();break;
case hmode+ex_space:case mmode+ex_space:goto append_normal_space;
/*948:*/
#line 19335 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(relax):case vmode+spacer:case mmode+spacer:
case mmode+no_boundary:do_nothing;break;
any_mode(ignore_spaces):{/*401:*/
#line 8619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

do{get_x_token();
}while(!(cur_cmd!=spacer))

/*:401*/
#line 19338 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto reswitch;
}
case vmode+stop:if(its_all_over())return;break;
/*951:*/
#line 19384 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+vmove:case hmode+hmove:case mmode+hmove:any_mode(last_item):

/*:951*//*1001:*/
#line 20184 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+vadjust:

/*:1001*//*1014:*/
#line 20363 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
case vmode+ital_corr:

/*:1014*//*1047:*/
#line 20764 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
non_math(eq_no):

/*:1047*/
#line 19342 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
any_mode(mac_param):
report_illegal_case();break;
/*949:*/
#line 19354 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

non_math(sup_mark):non_math(sub_mark):non_math(math_char_num):
non_math(math_given):non_math(math_comp):non_math(delim_num):
non_math(left_right):non_math(above):non_math(radical):
non_math(math_style):non_math(math_choice):non_math(vcenter):
non_math(non_script):non_math(mkern):non_math(limit_switch):
non_math(mskip):non_math(math_accent):
case mmode+endv:case mmode+par_end:case mmode+stop:
case mmode+vskip:case mmode+un_vbox:
case mmode+valign:case mmode+hrule

/*:949*/
#line 19344 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
:insert_dollar_sign();break;
/*959:*/
#line 19483 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+hrule:case hmode+vrule:case mmode+vrule:{tail_append(scan_rule_spec());
if(abs(mode)==vmode)prev_depth= ignore_depth;
else if(abs(mode)==hmode)space_factor= 1000;
}break;

/*:959*//*960:*/
#line 19494 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+vskip:case hmode+hskip:case mmode+hskip:
case mmode+mskip:append_glue();break;
any_mode(kern):case mmode+mkern:append_kern();break;

/*:960*//*966:*/
#line 19608 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

non_math(left_brace):new_save_level(simple_group);break;
any_mode(begin_group):new_save_level(semi_simple_group);break;
any_mode(end_group):if(cur_group==semi_simple_group)unsave();
else off_save();break;

/*:966*//*970:*/
#line 19678 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(right_brace):handle_right_brace();break;

/*:970*//*976:*/
#line 19827 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+hmove:case hmode+vmove:case mmode+vmove:{t= cur_chr;
scan_normal_dimen;
if(t==0)scan_box(cur_val);else scan_box(-cur_val);
}break;
any_mode(leader_ship):scan_box(leader_flag-a_leaders+cur_chr);break;
any_mode(make_box):begin_box(0);break;

/*:976*//*993:*/
#line 20087 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+start_par:new_graf(cur_chr> 0);break;
case vmode+letter:case vmode+other_char:
case vmode+char_num:case vmode+char_given:
case vmode+math_shift:case vmode+un_hbox:
case vmode+vrule:
case vmode+accent:case vmode+discretionary:
case vmode+hskip:case vmode+valign:
case vmode+ex_space:case vmode+no_boundary:
{back_input();new_graf(true);
}break;

/*:993*//*995:*/
#line 20119 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hmode+start_par:case mmode+start_par:indent_in_hmode();break;

/*:995*//*997:*/
#line 20139 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+par_end:{normal_paragraph();
if(mode> 0)build_page();
}break;
case hmode+par_end:{if(align_state<0)off_save();

end_graf();
if(mode==vmode)build_page();
}break;
case hmode+stop:case hmode+vskip:case hmode+hrule:
case hmode+un_vbox:case hmode+halign:head_for_vmode();break;

/*:997*//*1000:*/
#line 20179 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(insert):case hmode+vadjust:
case mmode+vadjust:begin_insert_or_adjust();break;
any_mode(mark):make_mark();break;

/*:1000*//*1005:*/
#line 20244 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(break_penalty):append_penalty();break;

/*:1005*//*1007:*/
#line 20260 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(remove_item):delete_last();break;

/*:1007*//*1012:*/
#line 20329 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+un_vbox:case hmode+un_hbox:
case mmode+un_hbox:unpackage();break;

/*:1012*//*1015:*/
#line 20369 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hmode+ital_corr:append_italic_correction();break;
case mmode+ital_corr:tail_append(new_kern(0))break;

/*:1015*//*1019:*/
#line 20401 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hmode+discretionary:case mmode+discretionary:append_discretionary();break;

/*:1019*//*1025:*/
#line 20492 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hmode+accent:make_accent();break;

/*:1025*//*1029:*/
#line 20571 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(car_ret):any_mode(tab_mark):align_error();break;
any_mode(no_align):no_align_error();break;
any_mode(omit):omit_error();break;

/*:1029*//*1033:*/
#line 20638 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case vmode+halign:case hmode+valign:init_align();break;
case mmode+halign:if(privileged())
if(cur_group==math_shift_group)init_align();
else off_save();break;
case vmode+endv:case hmode+endv:do_endv();break;

/*:1033*//*1037:*/
#line 20683 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(end_cs_name):cs_error();break;

/*:1037*//*1040:*/
#line 20714 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hmode+math_shift:init_math();break;

/*:1040*//*1043:*/
#line 20740 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+eq_no:if(privileged())
if(cur_group==math_shift_group)start_eq_no();
else off_save();break;

/*:1043*//*1050:*/
#line 20823 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+left_brace:{tail_append(new_noad());
back_input();scan_math(nucleus(tail));
}break;

/*:1050*//*1054:*/
#line 20890 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+letter:case mmode+other_char:
case mmode+char_given:
set_math_char(ho(math_code(cur_chr)));break;
case mmode+char_num:{scan_char_num();cur_chr= cur_val;
set_math_char(ho(math_code(cur_chr)));
}break;
case mmode+math_char_num:{scan_fifteen_bit_int();math_to_Umath(cur_val);set_math_char(cur_val);
}break;
case mmode+math_given:set_math_char(cur_chr);break;
case mmode+delim_num:{scan_twenty_seven_bit_int();cur_val= cur_val/010000;math_to_Umath(cur_val);
set_math_char(cur_val);
}break;

/*:1054*//*1058:*/
#line 20975 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+math_comp:{tail_append(new_noad());
type(tail)= cur_chr;scan_math(nucleus(tail));
}break;
case mmode+limit_switch:math_limit_switch();break;

/*:1058*//*1062:*/
#line 21027 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+radical:math_radical();break;

/*:1062*//*1064:*/
#line 21040 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+accent:case mmode+math_accent:math_ac();break;

/*:1064*//*1067:*/
#line 21069 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+vcenter:{scan_spec(vcenter_group,false);normal_paragraph();
push_nest();mode= -vmode;prev_depth= ignore_depth;
if(every_vbox!=null)begin_token_list(every_vbox,every_vbox_text);
}break;

/*:1067*//*1071:*/
#line 21097 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+math_style:tail_append(new_style(cur_chr))break;
case mmode+non_script:{tail_append(new_glue(zero_glue));
subtype(tail)= cond_math_glue;
}break;
case mmode+math_choice:append_choices();break;

/*:1071*//*1075:*/
#line 21137 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+sub_mark:case mmode+sup_mark:sub_sup();break;

/*:1075*//*1080:*/
#line 21207 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+above:math_fraction();break;

/*:1080*//*1090:*/
#line 21323 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+left_right:math_left_right();break;

/*:1090*//*1093:*/
#line 21374 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mmode+math_shift:if(cur_group==math_shift_group)after_math();
else off_save();break;

/*:1093*/
#line 19345 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1105:*/
#line 21617 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(toks_register):
any_mode(assign_toks):
any_mode(assign_int):
any_mode(assign_dimen):
any_mode(assign_glue):
any_mode(assign_mu_glue):
any_mode(assign_font_dimen):
any_mode(assign_font_int):
any_mode(set_aux):
any_mode(set_prev_graf):
any_mode(set_page_dimen):
any_mode(set_page_int):
any_mode(set_box_dimen):
any_mode(set_shape):
any_mode(def_code):
any_mode(def_family):
any_mode(set_font):
any_mode(def_font):
any_mode(internal_register):
any_mode(advance):
any_mode(multiply):
any_mode(divide):
any_mode(prefix):
any_mode(let):
any_mode(shorthand_def):
any_mode(read_to_cs):
any_mode(def):
any_mode(set_box):
any_mode(hyph_data):
any_mode(set_interaction):prefixed_command();break;

/*:1105*//*1163:*/
#line 22536 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(after_assignment):{get_token();after_token= cur_tok;
}break;

/*:1163*//*1166:*/
#line 22557 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(after_group):{get_token();save_for_after(cur_tok);
}break;

/*:1166*//*1169:*/
#line 22573 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(in_stream):open_or_close_in();break;

/*:1169*//*1171:*/
#line 22594 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(message):issue_message();break;

/*:1171*//*1180:*/
#line 22661 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(case_shift):shift_case();break;

/*:1180*//*1185:*/
#line 22712 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(xray):show_whatever();break;

/*:1185*/
#line 19346 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1242:*/
#line 23970 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

any_mode(extension):do_extension();

/*:1242*/
#line 19347 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:948*/
#line 19003 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
goto big_switch;
main_loop:/*937:*/
#line 19082 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

adjust_space_factor;
main_f= cur_font;
if(mode> 0)if(language!=clang)fix_language();
if(IS_X_FONT(main_f))
/*1856:*/
#line 35480 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{hb_buffer_t*buf;
unsigned int glyph_count;
hb_glyph_info_t*glyph_info;
hb_glyph_position_t*glyph_pos;
int i,len;
hb_codepoint_t cp[256];
hb_feature_t features[4]= 
{{HB_TAG('l','i','g','a'),0,HB_FEATURE_GLOBAL_START,HB_FEATURE_GLOBAL_END},
{HB_TAG('c','l','i','g'),0,HB_FEATURE_GLOBAL_START,HB_FEATURE_GLOBAL_END},
{HB_TAG('d','l','i','g'),0,HB_FEATURE_GLOBAL_START,HB_FEATURE_GLOBAL_END},
{HB_TAG('c','a','l','t'),0,HB_FEATURE_GLOBAL_START,HB_FEATURE_GLOBAL_END}
};
buf= hb_buffer_create();
for(len= 0;len<256;len++){
if(!x_char_exists(main_f,cur_chr))
{char_warning(cur_font,cur_chr);goto big_switch;
}
cp[len]= cur_chr;
get_next();
if(cur_cmd==letter||cur_cmd==other_char||cur_cmd==char_given)
continue;
x_token();
if(cur_cmd==letter||cur_cmd==other_char||cur_cmd==char_given)
continue;
else if(cur_cmd==char_num)
{scan_char_num();cur_chr= cur_val;continue;}
else
{len++;break;}
}
if(len==256)
{print_err("Long word cut to 256 characters");
error();
}
hb_buffer_add_codepoints(buf,cp,len,0,len);
hb_buffer_set_direction(buf,HB_DIRECTION_LTR);
hb_buffer_set_script(buf,HB_SCRIPT_LATIN);
hb_buffer_set_language(buf,hb_language_from_string("en",-1));



hb_shape(x_font[main_f]->f,buf,features,4);
glyph_info= hb_buffer_get_glyph_infos(buf,&glyph_count);
glyph_pos= hb_buffer_get_glyph_positions(buf,&glyph_count);

for(i= 0;i<glyph_count;i++){
uint32_t cluster= glyph_info[i].cluster;
hb_position_t x_advance= glyph_pos[i].x_advance;
scaled w,a,delta;
tail_append_char(cp[cluster]);
w= x_char_width(main_f,cp[cluster]);
a= HB_TO_SCALED(x_advance);
delta= a-w;
if(delta!=0)
tail_append(new_kern(delta));
}
hb_buffer_destroy(buf);

goto reswitch;
}

/*:1856*/
#line 19087 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

bchar= font_bchar[main_f];false_bchar= font_false_bchar[main_f];
fast_get_avail(lig_stack);font(lig_stack)= main_f;cur_l= qi(cur_chr);
character(lig_stack)= cur_l;
cur_q= tail;
if(cancel_boundary)
{cancel_boundary= false;main_k= non_address;
}
else main_k= bchar_label[main_f];
if(main_k==non_address)goto main_loop_move2;
cur_r= cur_l;cur_l= non_char;
goto main_lig_loop1;

main_loop_wrapup:/*938:*/
#line 19142 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

wrapup(rt_hit)

/*:938*/
#line 19101 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
main_loop_move:/*939:*/
#line 19145 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


if(lig_stack==null)goto reswitch;
cur_q= tail;cur_l= character(lig_stack);
main_loop_move1:if(!is_char_node(lig_stack))goto main_loop_move_lig;
main_loop_move2:if((cur_chr<font_bc[main_f])||(cur_chr> font_ec[main_f]))
{char_warning(main_f,cur_chr);free_avail(lig_stack);goto big_switch;
}
main_i= char_info(main_f,cur_l);
if(!char_exists(main_f,cur_l))
{char_warning(main_f,cur_chr);free_avail(lig_stack);goto big_switch;
}
link(tail)= lig_stack;tail= lig_stack

/*:939*/
#line 19104 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
main_loop_lookahead:/*941:*/
#line 19177 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

get_next();
if(cur_cmd==letter)goto main_loop_lookahead1;
if(cur_cmd==other_char)goto main_loop_lookahead1;
if(cur_cmd==char_given)goto main_loop_lookahead1;
x_token();
if(cur_cmd==letter)goto main_loop_lookahead1;
if(cur_cmd==other_char)goto main_loop_lookahead1;
if(cur_cmd==char_given)goto main_loop_lookahead1;
if(cur_cmd==char_num)
{scan_char_num();cur_chr= cur_val;goto main_loop_lookahead1;
}
if(cur_cmd==no_boundary)bchar= non_char;
cur_r= bchar;lig_stack= null;goto main_lig_loop;
main_loop_lookahead1:adjust_space_factor;
fast_get_avail(lig_stack);font(lig_stack)= main_f;
cur_r= qi(cur_chr);character(lig_stack)= cur_r;
if(cur_r==false_bchar)cur_r= non_char

/*:941*/
#line 19106 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
main_lig_loop:/*942:*/
#line 19206 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(char_tag(main_f,main_i)!=lig_tag)goto main_loop_wrapup;
if(cur_r==non_char)goto main_loop_wrapup;
main_k= lig_kern_start(main_f,main_i);main_j= font_info[main_k].qqqq;
if(skip_byte(main_j)<=stop_flag)goto main_lig_loop2;
main_k= lig_kern_restart(main_f,main_j);
main_lig_loop1:main_j= font_info[main_k].qqqq;
main_lig_loop2:if(next_char(main_j)==cur_r)
if(skip_byte(main_j)<=stop_flag)
/*943:*/
#line 19232 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{if(op_byte(main_j)>=kern_flag)
{wrapup(rt_hit);
tail_append(new_kern(char_kern(main_f,main_j)));goto main_loop_move;
}
if(cur_l==non_char)lft_hit= true;
else if(lig_stack==null)rt_hit= true;
check_interrupt;
switch(op_byte(main_j)){
case qi(1):case qi(5):{cur_l= rem_byte(main_j);
main_i= char_info(main_f,cur_l);ligature_present= true;
}break;
case qi(2):case qi(6):{cur_r= rem_byte(main_j);
if(lig_stack==null)
{lig_stack= new_lig_item(cur_r);bchar= non_char;
}
else if(is_char_node(lig_stack))
{main_p= lig_stack;lig_stack= new_lig_item(cur_r);
lig_ptr(lig_stack)= main_p;
}
else character(lig_stack)= cur_r;
}break;
case qi(3):{cur_r= rem_byte(main_j);
main_p= lig_stack;lig_stack= new_lig_item(cur_r);
link(lig_stack)= main_p;
}break;
case qi(7):case qi(11):{wrapup(false);
cur_q= tail;cur_l= rem_byte(main_j);
main_i= char_info(main_f,cur_l);ligature_present= true;
}break;
default:{cur_l= rem_byte(main_j);ligature_present= true;
if(lig_stack==null)goto main_loop_wrapup;
else goto main_loop_move1;
}
}
if(op_byte(main_j)> qi(4))
if(op_byte(main_j)!=qi(7))goto main_loop_wrapup;
if(cur_l<non_char)goto main_lig_loop;
main_k= bchar_label[main_f];goto main_lig_loop1;
}

/*:943*/
#line 19216 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(skip_byte(main_j)==qi(0))incr(main_k);
else{if(skip_byte(main_j)>=stop_flag)goto main_loop_wrapup;
main_k= main_k+qo(skip_byte(main_j))+1;
}
goto main_lig_loop1

/*:942*/
#line 19108 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
main_loop_move_lig:/*940:*/
#line 19162 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

main_p= lig_ptr(lig_stack);
if(main_p> null)tail_append(main_p);
temp_ptr= lig_stack;lig_stack= link(temp_ptr);
free_node(temp_ptr,small_node_size);
main_i= char_info(main_f,cur_l);ligature_present= true;
if(lig_stack==null)
if(main_p> null)goto main_loop_lookahead;
else cur_r= bchar;
else cur_r= character(lig_stack);
goto main_lig_loop

/*:940*/
#line 19110 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:937*/
#line 19008 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
append_normal_space:/*944:*/
#line 19284 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(space_skip==zero_glue)
{/*945:*/
#line 19299 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{main_p= font_glue[cur_font];
if(main_p==null)
{main_p= new_spec(zero_glue);main_k= param_base[cur_font]+space_code;
width(main_p)= font_info[main_k].sc;
stretch(main_p)= font_info[main_k+1].sc;
shrink(main_p)= font_info[main_k+2].sc;
font_glue[cur_font]= main_p;
}
}

/*:945*/
#line 19287 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
temp_ptr= new_glue(main_p);
}
else temp_ptr= new_param_glue(space_skip_code);
link(tail)= temp_ptr;tail= temp_ptr;
goto big_switch

/*:944*/
#line 19010 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:933*//*1179:*/
#line 22654 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static void give_err_help(void)
{token_show(err_help);
}

/*:1179*//*1198:*/
#line 22884 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*518:*/
#line 10697 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool open_fmt_file(void);

/*:518*/
#line 22884 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool load_fmt_file(void)
{
int j,k;
int p,q;
int x;
four_quarters w;
/*1203:*/
#line 22961 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

x= fmt_file.d.i;
if(x!=0)goto bad_fmt;
/*1276:*/
#line 24951 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump(0,1,eTeX_mode);
if(eTeX_ex)
{/*1385:*/
#line 26396 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

max_reg_num= 32767;
max_reg_help_line= "A register number must be between 0 and 32767.";

/*:1385*//*1429:*/
#line 27186 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

expand_depth= 10000;
expand_depth_count= 0;

/*:1429*/
#line 24954 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
else{/*1384:*/
#line 26392 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

max_reg_num= 255;
max_reg_help_line= "A register number must be between 0 and 255.";

/*:1384*/
#line 24956 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:1276*/
#line 22964 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1433:*/
#line 27214 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump(0,1,Prote_mode);

/*:1433*/
#line 22965 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1474:*/
#line 27609 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= ROM_base;k<=ROM_size;k++)undump_wd(ROM[k]);

/*:1474*/
#line 22966 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump_int(x);
if(x!=mem_bot)goto bad_fmt;
undump_int(x);
if(x!=mem_top)goto bad_fmt;
undump_int(x);
if(x!=eqtb_size)goto bad_fmt;
undump_int(x);
if(x!=hash_prime)goto bad_fmt;
undump_int(x);
if(x!=hyph_size)goto bad_fmt

/*:1203*/
#line 22891 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1205:*/
#line 23000 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump_size(0,pool_size,"string pool size",pool_ptr);
undump_size(0,max_strings,"max strings",str_ptr);
for(k= 0;k<=str_ptr;k++)undump(0,pool_ptr,str_start[k]);
k= 0;
while(k+4<pool_ptr)
{undump_four_ASCII;k= k+4;
}
k= pool_ptr-4;undump_four_ASCII;
init_str_ptr= str_ptr;init_pool_ptr= pool_ptr

/*:1205*/
#line 22892 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1207:*/
#line 23042 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump(lo_mem_stat_max+1000,hi_mem_stat_min-1,lo_mem_max);
undump(lo_mem_stat_max+1,lo_mem_max,rover);
if(eTeX_ex)for(k= int_val;k<=tok_val;k++)
undump(null,lo_mem_max,sa_root[k]);
p= mem_bot;q= rover;
do{for(k= p;k<=q+1;k++)undump_wd(mem[k]);
p= q+node_size(q);
if((p> lo_mem_max)||((q>=rlink(q))&&(rlink(q)!=rover)))goto bad_fmt;
q= rlink(q);
}while(!(q==rover));
for(k= p;k<=lo_mem_max;k++)undump_wd(mem[k]);
if(mem_min<mem_bot-2)
{p= llink(rover);q= mem_min+1;
link(mem_min)= null;info(mem_min)= null;
rlink(p)= q;llink(rover)= q;
rlink(q)= rover;llink(q)= p;link(q)= empty_flag;
node_size(q)= mem_bot-q;
}
undump(lo_mem_max+1,hi_mem_stat_min,hi_mem_min);
undump(null,mem_top,avail);mem_end= mem_top;
for(k= hi_mem_min;k<=mem_end;k++)undump_wd(mem[k]);
undump_int(var_used);undump_int(dyn_used)

/*:1207*/
#line 22893 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1209:*/
#line 23074 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1212:*/
#line 23130 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

k= active_base;
do{undump_int(x);
if((x<1)||(k+x> eqtb_size+1))goto bad_fmt;
for(j= k;j<=k+x-1;j++)undump_wd(eqtb[j]);
k= k+x;
undump_int(x);
if((x<0)||(k+x> eqtb_size+1))goto bad_fmt;
for(j= k;j<=k+x-1;j++)eqtb[j]= eqtb[k-1];
k= k+x;
}while(!(k> eqtb_size))

/*:1212*/
#line 23075 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1822:*/
#line 34649 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump_int(active_used);
j= active_used;
k= 0;
p= 0;
while(j> 0)
{unsigned int x;
undump_int(x);
k= k+((x>>24)&0xFF);
x= x&0x1FFFFF;
if(x!=0)
{if(k>=active_hash_size)break;
active_hash0[k]= x;
j--;
}
}


/*:1822*/
#line 23076 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump(hash_base,frozen_control_sequence,par_loc);
par_token= cs_token_flag+par_loc;
undump(hash_base,frozen_control_sequence,write_loc);
undump(hash_base,frozen_control_sequence,input_loc);
input_token= cs_token_flag+input_loc;
/*1214:*/
#line 23156 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump(hash_base,frozen_control_sequence,hash_used);p= hash_base-1;
do{undump(p+1,hash_used,p);undump_hh(hash[p]);
}while(!(p==hash_used));
for(p= hash_used+1;p<=undefined_control_sequence-1;p++)undump_hh(hash[p]);
undump_int(cs_count)

/*:1214*/
#line 23082 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1209*/
#line 22894 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1216:*/
#line 23178 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump_size(7,font_mem_size,"font mem size",fmem_ptr);
for(k= 0;k<=fmem_ptr-1;k++)undump_wd(font_info[k]);
undump_size(font_base,font_max,"font max",font_ptr);
for(k= null_font;k<=font_ptr;k++)
/*1218:*/
#line 23216 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{undump_qqqq(font_check[k]);
undump_int(font_size[k]);
undump_int(font_dsize[k]);
undump(min_halfword,max_halfword,font_params[k]);
undump_int(hyphen_char[k]);
undump_int(skew_char[k]);
undump(0,str_ptr,font_name[k]);
undump(0,str_ptr,font_area[k]);
undump(0,biggest_char,font_bc[k]);
undump(0,biggest_char,font_ec[k]);
undump_int(char_base[k]);
undump_int(width_base[k]);
undump_int(height_base[k]);
undump_int(depth_base[k]);
undump_int(italic_base[k]);
undump_int(lig_kern_base[k]);
undump_int(kern_base[k]);
undump_int(exten_base[k]);
undump_int(param_base[k]);
undump(min_halfword,lo_mem_max,font_glue[k]);
undump(0,fmem_ptr-1,bchar_label[k]);
undump(min_quarterword,non_char,font_bchar[k]);
undump(min_quarterword,non_char,font_false_bchar[k]);
}

/*:1218*/
#line 23183 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1216*/
#line 22895 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1220:*/
#line 23275 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump(0,hyph_size,hyph_count);
for(k= 1;k<=hyph_count;k++)
{undump(0,hyph_size,j);
undump(0,str_ptr,hyph_word[j]);
undump(min_halfword,max_halfword,hyph_list[j]);
}
undump_size(0,trie_size,"trie size",j);
#ifdef INIT
trie_max= j;
#endif
#line 23286 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 undump(0,j,hyph_start);
for(k= 0;k<=j;k++)undump_hh(trie[k]);
undump_int(max_hyph_char);
undump_size(0,trie_op_size,"trie op size",j);
#ifdef INIT
trie_op_ptr= j;
#endif
#line 23293 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 for(k= 1;k<=j;k++)
{undump(0,63,hyf_distance[k]);
undump(0,63,hyf_num[k]);
undump(min_quarterword,max_quarterword,hyf_next[k]);
}
#ifdef INIT
for(k= 0;k<=max_language;k++)trie_used[k]= min_quarterword;
#endif
#line 23301 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

k= 256;
while(j> 0)
{undump(0,k-1,k);undump(1,j,x);
#ifdef INIT
trie_used[k]= qi(x);
#endif
#line 23308 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

j= j-x;op_start[k]= qo(j);
}
#ifdef INIT
trie_not_ready= false
#endif
#line 23314 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1220*/
#line 22896 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1222:*/
#line 23322 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

undump(batch_mode,error_stop_mode,interaction);
if(interaction_option>=0)interaction= interaction_option;
undump(0,str_ptr,format_ident);
undump_int(x);
if((x!=69069)||eof(fmt_file))goto bad_fmt

/*:1222*/
#line 22897 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
return true;
bad_fmt:wake_up_terminal;
wterm_ln("(Fatal format file error; I'm stymied)");

return false;
}

/*:1198*//*1225:*/
#line 23356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*1228:*/
#line 23456 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void close_files_and_terminate(void)
{int k;
/*1268:*/
#line 24867 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(k= 0;k<=15;k++)if(write_open[k])a_close(&write_file[k])

/*:1268*/
#line 23459 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;new_line_char= -1;
#ifdef STAT
if(tracing_stats> 0)/*1229:*/
#line 23478 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(log_opened)
{wlog_ln(" ");
wlog_ln("Here is how much of TeX's memory you used:");

wlog(" %d string",str_ptr-init_str_ptr);
if(str_ptr!=init_str_ptr+1)wlog("s");
wlog_ln(" out of %d",max_strings-init_str_ptr);
wlog_ln(" %d string characters out of %d",pool_ptr-init_pool_ptr,
pool_size-init_pool_ptr);
wlog_ln(" %d words of memory out of %d",lo_mem_max-mem_min+mem_end-hi_mem_min+2,
mem_end+1-mem_min);
wlog_ln(" %d multiletter control sequences out of %d",cs_count,hash_size);
wlog(" %d words of font info for %d font",fmem_ptr,font_ptr-font_base);
if(font_ptr!=font_base+1)wlog("s");
wlog_ln(", out of %d for %d",font_mem_size,font_max-font_base);
wlog(" %d hyphenation exception",hyph_count);
if(hyph_count!=1)wlog("s");
wlog_ln(" out of %d",hyph_size);
wlog_ln(" %di,%dn,%dp,%db,%ds stack positions out of %di,%dn,%dp,%db,%ds",
max_in_stack,max_nest_stack,
max_param_stack,
max_buf_stack+1,
max_save_stack+6,
stack_size,
nest_size,
param_size,
buf_size,
save_size);
wlog_ln(" %d/%d utf block/info records out of %d/%d",
utf_b_used,utf_i_used,0x100,0x100);
}

/*:1229*/
#line 23461 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
#endif
#line 23463 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 wake_up_terminal;hint_close();
if(log_opened)
{wlog_cr;a_close(&log_file);selector= selector-2;
if(selector==term_only)
{print_nl("Transcript written on ");

slow_print(log_name);print_char('.');print_nl("");
}
}
}

/*:1228*//*1230:*/
#line 23514 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void final_cleanup(void)
{
int c;
c= cur_chr;if(c!=1)new_line_char= -1;
if(job_name==0)open_log_file();
while(input_ptr> 0)
if(state==token_list)end_token_list();else end_file_reading();
while(open_parens> 0)
{print(" )");decr(open_parens);
}
if(cur_level> level_one)
{print_nl("(");print_esc("end occurred ");
print("inside a group at level ");

print_int(cur_level-level_one);print_char(')');
if(eTeX_ex)show_save_groups();
}
while(cond_ptr!=null)
{print_nl("(");print_esc("end occurred ");
print("when ");print_cmd_chr(if_test,cur_if);
if(if_line!=0)
{print(" on line ");print_int(if_line);
}
print(" was incomplete)");
if_line= if_line_field(cond_ptr);
cur_if= subtype(cond_ptr);temp_ptr= cond_ptr;
cond_ptr= link(cond_ptr);free_node(temp_ptr,if_node_size);
}
if(history!=spotless)
if(((history==warning_issued)||(interaction<error_stop_mode)))
if(selector==term_and_log)
{selector= term_only;
print_nl("(see the transcript file for additional information)");

selector= term_and_log;
}
if(c==1)
{
#ifdef INIT
for(c= top_mark_code;c<=split_bot_mark_code;c++)
if(cur_mark[c]!=null)delete_token_ref(cur_mark[c]);
if(sa_mark!=null)
if(do_marks(destroy_marks,0,sa_mark))sa_mark= null;
for(c= last_box_code;c<=vsplit_code;c++)flush_node_list(disc_ptr[c]);
if(last_glue!=max_halfword)delete_glue_ref(last_glue);
store_fmt_file();return;
#endif
#line 23562 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 print_nl("(\\dump is performed only by INITEX)");return;

}
}

/*:1230*//*1231:*/
#line 23567 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
static void init_prim(void)
{no_new_control_sequence= false;
first= 0;
/*221:*/
#line 4671 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("lineskip",assign_glue,glue_base+line_skip_code);

primitive("baselineskip",assign_glue,glue_base+baseline_skip_code);

primitive("parskip",assign_glue,glue_base+par_skip_code);

primitive("abovedisplayskip",assign_glue,glue_base+above_display_skip_code);

primitive("belowdisplayskip",assign_glue,glue_base+below_display_skip_code);

primitive("abovedisplayshortskip",
assign_glue,glue_base+above_display_short_skip_code);

primitive("belowdisplayshortskip",
assign_glue,glue_base+below_display_short_skip_code);

primitive("leftskip",assign_glue,glue_base+left_skip_code);

primitive("rightskip",assign_glue,glue_base+right_skip_code);

primitive("topskip",assign_glue,glue_base+top_skip_code);

primitive("splittopskip",assign_glue,glue_base+split_top_skip_code);

primitive("tabskip",assign_glue,glue_base+tab_skip_code);

primitive("spaceskip",assign_glue,glue_base+space_skip_code);

primitive("xspaceskip",assign_glue,glue_base+xspace_skip_code);

primitive("parfillskip",assign_glue,glue_base+par_fill_skip_code);

primitive("thinmuskip",assign_mu_glue,glue_base+thin_mu_skip_code);

primitive("medmuskip",assign_mu_glue,glue_base+med_mu_skip_code);

primitive("thickmuskip",assign_mu_glue,glue_base+thick_mu_skip_code);


/*:221*//*225:*/
#line 4816 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("output",assign_toks,output_routine_loc);

primitive("everypar",assign_toks,every_par_loc);

primitive("everymath",assign_toks,every_math_loc);

primitive("everydisplay",assign_toks,every_display_loc);

primitive("everyhbox",assign_toks,every_hbox_loc);

primitive("everyvbox",assign_toks,every_vbox_loc);

primitive("everyjob",assign_toks,every_job_loc);

primitive("everycr",assign_toks,every_cr_loc);

primitive("errhelp",assign_toks,err_help_loc);


/*:225*//*233:*/
#line 5189 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("pretolerance",assign_int,int_base+pretolerance_code);

primitive("tolerance",assign_int,int_base+tolerance_code);

primitive("linepenalty",assign_int,int_base+line_penalty_code);

primitive("hyphenpenalty",assign_int,int_base+hyphen_penalty_code);

primitive("exhyphenpenalty",assign_int,int_base+ex_hyphen_penalty_code);

primitive("clubpenalty",assign_int,int_base+club_penalty_code);

primitive("widowpenalty",assign_int,int_base+widow_penalty_code);

primitive("displaywidowpenalty",
assign_int,int_base+display_widow_penalty_code);

primitive("brokenpenalty",assign_int,int_base+broken_penalty_code);

primitive("binoppenalty",assign_int,int_base+bin_op_penalty_code);

primitive("relpenalty",assign_int,int_base+rel_penalty_code);

primitive("predisplaypenalty",assign_int,int_base+pre_display_penalty_code);

primitive("postdisplaypenalty",assign_int,int_base+post_display_penalty_code);

primitive("interlinepenalty",assign_int,int_base+inter_line_penalty_code);

primitive("doublehyphendemerits",
assign_int,int_base+double_hyphen_demerits_code);

primitive("finalhyphendemerits",
assign_int,int_base+final_hyphen_demerits_code);

primitive("adjdemerits",assign_int,int_base+adj_demerits_code);

primitive("mag",assign_int,int_base+mag_code);

primitive("delimiterfactor",assign_int,int_base+delimiter_factor_code);

primitive("looseness",assign_int,int_base+looseness_code);

primitive("time",assign_int,int_base+time_code);

primitive("day",assign_int,int_base+day_code);

primitive("month",assign_int,int_base+month_code);

primitive("year",assign_int,int_base+year_code);

primitive("showboxbreadth",assign_int,int_base+show_box_breadth_code);

primitive("showboxdepth",assign_int,int_base+show_box_depth_code);

primitive("hbadness",assign_int,int_base+hbadness_code);

primitive("vbadness",assign_int,int_base+vbadness_code);

primitive("pausing",assign_int,int_base+pausing_code);

primitive("tracingonline",assign_int,int_base+tracing_online_code);

primitive("tracingmacros",assign_int,int_base+tracing_macros_code);

primitive("tracingstats",assign_int,int_base+tracing_stats_code);

primitive("tracingparagraphs",assign_int,int_base+tracing_paragraphs_code);

primitive("tracingpages",assign_int,int_base+tracing_pages_code);

primitive("tracingoutput",assign_int,int_base+tracing_output_code);

primitive("tracinglostchars",assign_int,int_base+tracing_lost_chars_code);

primitive("tracingcommands",assign_int,int_base+tracing_commands_code);

primitive("tracingrestores",assign_int,int_base+tracing_restores_code);

primitive("uchyph",assign_int,int_base+uc_hyph_code);

primitive("outputpenalty",assign_int,int_base+output_penalty_code);

primitive("maxdeadcycles",assign_int,int_base+max_dead_cycles_code);

primitive("hangafter",assign_int,int_base+hang_after_code);

primitive("floatingpenalty",assign_int,int_base+floating_penalty_code);

primitive("globaldefs",assign_int,int_base+global_defs_code);

primitive("fam",assign_int,int_base+cur_fam_code);

primitive("escapechar",assign_int,int_base+escape_char_code);

primitive("defaulthyphenchar",assign_int,int_base+default_hyphen_char_code);

primitive("defaultskewchar",assign_int,int_base+default_skew_char_code);

primitive("endlinechar",assign_int,int_base+end_line_char_code);

primitive("newlinechar",assign_int,int_base+new_line_char_code);

primitive("language",assign_int,int_base+language_code);

primitive("lefthyphenmin",assign_int,int_base+left_hyphen_min_code);

primitive("righthyphenmin",assign_int,int_base+right_hyphen_min_code);

primitive("holdinginserts",assign_int,int_base+holding_inserts_code);

primitive("errorcontextlines",assign_int,int_base+error_context_lines_code);

primitive("tracingstacklevels",assign_int,int_base+tracing_stack_levels_code);

primitive("tracingfonts",assign_int,int_base+tracing_fonts_code);


/*:233*//*243:*/
#line 5475 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("parindent",assign_dimen,dimen_base+par_indent_code);

primitive("mathsurround",assign_dimen,dimen_base+math_surround_code);

primitive("lineskiplimit",assign_dimen,dimen_base+line_skip_limit_code);

primitive("hsize",assign_dimen,dimen_base+hsize_code);

primitive("vsize",assign_dimen,dimen_base+vsize_code);

primitive("maxdepth",assign_dimen,dimen_base+max_depth_code);

primitive("splitmaxdepth",assign_dimen,dimen_base+split_max_depth_code);

primitive("boxmaxdepth",assign_dimen,dimen_base+box_max_depth_code);

primitive("hfuzz",assign_dimen,dimen_base+hfuzz_code);

primitive("vfuzz",assign_dimen,dimen_base+vfuzz_code);

primitive("delimitershortfall",
assign_dimen,dimen_base+delimiter_shortfall_code);

primitive("nulldelimiterspace",
assign_dimen,dimen_base+null_delimiter_space_code);

primitive("scriptspace",assign_dimen,dimen_base+script_space_code);

primitive("predisplaysize",assign_dimen,dimen_base+pre_display_size_code);

primitive("displaywidth",assign_dimen,dimen_base+display_width_code);

primitive("displayindent",assign_dimen,dimen_base+display_indent_code);

primitive("overfullrule",assign_dimen,dimen_base+overfull_rule_code);

primitive("hangindent",assign_dimen,dimen_base+hang_indent_code);

primitive("hoffset",assign_dimen,dimen_base+h_offset_code);

primitive("voffset",assign_dimen,dimen_base+v_offset_code);

primitive("emergencystretch",assign_dimen,dimen_base+emergency_stretch_code);


/*:243*//*260:*/
#line 5776 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive(" ",ex_space,0);

primitive("/",ital_corr,0);

primitive("accent",accent,0);

primitive("advance",advance,0);

primitive("afterassignment",after_assignment,0);

primitive("aftergroup",after_group,0);

primitive("begingroup",begin_group,0);

primitive("char",char_num,0);

primitive("csname",cs_name,0);

primitive("delimiter",delim_num,0);

primitive("divide",divide,0);

primitive("endcsname",end_cs_name,0);

primitive("endgroup",end_group,0);

text(frozen_end_group)= text(cur_val);eqtb[frozen_end_group]= eqtb[cur_val];
primitive("expandafter",expand_after,0);

primitive("font",def_font,0);

primitive("fontdimen",assign_font_dimen,0);

primitive("halign",halign,0);

primitive("hrule",hrule,0);

primitive("ignorespaces",ignore_spaces,0);

primitive("insert",insert,0);

primitive("mark",mark,0);

primitive("mathaccent",math_accent,0);

primitive("mathchar",math_char_num,0);

primitive("mathchoice",math_choice,0);

primitive("multiply",multiply,0);

primitive("noalign",no_align,0);

primitive("noboundary",no_boundary,0);

primitive("noexpand",no_expand,0);

primitive("nonscript",non_script,0);

primitive("omit",omit,0);

primitive("parshape",set_shape,par_shape_loc);

primitive("penalty",break_penalty,0);

primitive("prevgraf",set_prev_graf,0);

primitive("radical",radical,0);

primitive("read",read_to_cs,0);

primitive("relax",relax,256);

text(frozen_relax)= text(cur_val);eqtb[frozen_relax]= eqtb[cur_val];
primitive("setbox",set_box,0);

primitive("the",the,0);

primitive("toks",toks_register,mem_bot);

primitive("vadjust",vadjust,0);

primitive("valign",valign,0);

primitive("vcenter",vcenter,0);

primitive("vrule",vrule,0);


/*:260*//*329:*/
#line 7461 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("par",par_end,256);

par_loc= cur_val;par_token= cs_token_flag+par_loc;

/*:329*//*371:*/
#line 8173 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("input",input,0);

input_loc= cur_val;input_token= cs_token_flag+input_loc;
primitive("endinput",input,1);


/*:371*//*379:*/
#line 8265 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("topmark",top_bot_mark,top_mark_code);

primitive("firstmark",top_bot_mark,first_mark_code);

primitive("botmark",top_bot_mark,bot_mark_code);

primitive("splitfirstmark",top_bot_mark,split_first_mark_code);

primitive("splitbotmark",top_bot_mark,split_bot_mark_code);


/*:379*//*406:*/
#line 8730 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("count",internal_register,mem_bot+int_val);

primitive("dimen",internal_register,mem_bot+dimen_val);

primitive("skip",internal_register,mem_bot+glue_val);

primitive("muskip",internal_register,mem_bot+mu_val);


/*:406*//*411:*/
#line 8856 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("spacefactor",set_aux,hmode);

primitive("prevdepth",set_aux,vmode);

primitive("deadcycles",set_page_int,0);

primitive("insertpenalties",set_page_int,1);

primitive("wd",set_box_dimen,width_offset);

primitive("ht",set_box_dimen,height_offset);

primitive("dp",set_box_dimen,depth_offset);

primitive("lastpenalty",last_item,int_val);

primitive("lastkern",last_item,dimen_val);

primitive("lastskip",last_item,glue_val);

primitive("inputlineno",last_item,input_line_no_code);

primitive("badness",last_item,badness_code);


/*:411*//*463:*/
#line 9757 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("number",convert,number_code);

primitive("romannumeral",convert,roman_numeral_code);

primitive("string",convert,string_code);

primitive("meaning",convert,meaning_code);

primitive("fontname",convert,font_name_code);

primitive("jobname",convert,job_name_code);


primitive("Uchar",convert,Uchar_code);

primitive("Ucharcat",convert,Ucharcat_code);



/*:463*//*482:*/
#line 10122 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("if",if_test,if_char_code);

primitive("ifcat",if_test,if_cat_code);

primitive("ifnum",if_test,if_int_code);

primitive("ifdim",if_test,if_dim_code);

primitive("ifodd",if_test,if_odd_code);

primitive("ifvmode",if_test,if_vmode_code);

primitive("ifhmode",if_test,if_hmode_code);

primitive("ifmmode",if_test,if_mmode_code);

primitive("ifinner",if_test,if_inner_code);

primitive("ifvoid",if_test,if_void_code);

primitive("ifhbox",if_test,if_hbox_code);

primitive("ifvbox",if_test,if_vbox_code);

primitive("ifx",if_test,ifx_code);

primitive("ifeof",if_test,if_eof_code);

primitive("iftrue",if_test,if_true_code);

primitive("iffalse",if_test,if_false_code);

primitive("ifcase",if_test,if_case_code);


/*:482*//*486:*/
#line 10214 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("fi",fi_or_else,fi_code);

text(frozen_fi)= text(cur_val);eqtb[frozen_fi]= eqtb[cur_val];
primitive("or",fi_or_else,or_code);

primitive("else",fi_or_else,else_code);


/*:486*//*546:*/
#line 11387 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("nullfont",set_font,null_font);

text(frozen_null_font)= text(cur_val);eqtb[frozen_null_font]= eqtb[cur_val];

/*:546*//*711:*/
#line 14669 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("span",tab_mark,span_code);

primitive("cr",car_ret,cr_code);

text(frozen_cr)= text(cur_val);eqtb[frozen_cr]= eqtb[cur_val];
primitive("crcr",car_ret,cr_cr_code);

text(frozen_end_template)= text(frozen_endv)= s_no("endtemplate");

eq_type(frozen_endv)= endv;equiv(frozen_endv)= null_list;
eq_level(frozen_endv)= level_one;
eqtb[frozen_end_template]= eqtb[frozen_endv];
eq_type(frozen_end_template)= end_template;

/*:711*//*916:*/
#line 18704 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("pagegoal",set_page_dimen,0);

primitive("pagetotal",set_page_dimen,1);

primitive("pagestretch",set_page_dimen,2);

primitive("pagefilstretch",set_page_dimen,3);

primitive("pagefillstretch",set_page_dimen,4);

primitive("pagefilllstretch",set_page_dimen,5);

primitive("pageshrink",set_page_dimen,6);

primitive("pagedepth",set_page_dimen,7);


/*:916*//*955:*/
#line 19423 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("end",stop,0);

primitive("dump",stop,1);


/*:955*//*961:*/
#line 19510 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("hskip",hskip,skip_code);

primitive("hfil",hskip,fil_code);

primitive("hfill",hskip,fill_code);

primitive("hss",hskip,ss_code);

primitive("hfilneg",hskip,fil_neg_code);

primitive("vskip",vskip,skip_code);

primitive("vfil",vskip,fil_code);

primitive("vfill",vskip,fill_code);

primitive("vss",vskip,ss_code);

primitive("vfilneg",vskip,fil_neg_code);

primitive("mskip",mskip,mskip_code);

primitive("kern",kern,explicit);

primitive("mkern",mkern,mu_glue);


/*:961*//*974:*/
#line 19773 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("moveleft",hmove,1);

primitive("moveright",hmove,0);

primitive("raise",vmove,1);

primitive("lower",vmove,0);


primitive("box",make_box,box_code);

primitive("copy",make_box,copy_code);

primitive("lastbox",make_box,last_box_code);

primitive("vsplit",make_box,vsplit_code);

primitive("vtop",make_box,vtop_code);

primitive("vbox",make_box,vtop_code+vmode);

primitive("hbox",make_box,vtop_code+hmode);

primitive("shipout",leader_ship,a_leaders-1);

primitive("leaders",leader_ship,a_leaders);

primitive("cleaders",leader_ship,c_leaders);

primitive("xleaders",leader_ship,x_leaders);


/*:974*//*991:*/
#line 20078 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("indent",start_par,1);

primitive("noindent",start_par,0);


/*:991*//*1010:*/
#line 20301 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("unpenalty",remove_item,penalty_node);

primitive("unkern",remove_item,kern_node);

primitive("unskip",remove_item,glue_node);

primitive("unhbox",un_hbox,box_code);

primitive("unhcopy",un_hbox,copy_code);

primitive("unvbox",un_vbox,box_code);

primitive("unvcopy",un_vbox,copy_code);


/*:1010*//*1017:*/
#line 20391 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("-",discretionary,1);

primitive("discretionary",discretionary,0);


/*:1017*//*1044:*/
#line 20745 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("eqno",eq_no,0);

primitive("leqno",eq_no,1);


/*:1044*//*1056:*/
#line 20930 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("mathord",math_comp,ord_noad);

primitive("mathop",math_comp,op_noad);

primitive("mathbin",math_comp,bin_noad);

primitive("mathrel",math_comp,rel_noad);

primitive("mathopen",math_comp,open_noad);

primitive("mathclose",math_comp,close_noad);

primitive("mathpunct",math_comp,punct_noad);

primitive("mathinner",math_comp,inner_noad);

primitive("underline",math_comp,under_noad);

primitive("overline",math_comp,over_noad);

primitive("displaylimits",limit_switch,normal);

primitive("limits",limit_switch,limits);

primitive("nolimits",limit_switch,no_limits);


/*:1056*//*1069:*/
#line 21084 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("displaystyle",math_style,display_style);

primitive("textstyle",math_style,text_style);

primitive("scriptstyle",math_style,script_style);

primitive("scriptscriptstyle",math_style,script_script_style);


/*:1069*//*1078:*/
#line 21183 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("above",above,above_code);

primitive("over",above,over_code);

primitive("atop",above,atop_code);

primitive("abovewithdelims",above,delimited_code+above_code);

primitive("overwithdelims",above,delimited_code+over_code);

primitive("atopwithdelims",above,delimited_code+atop_code);


/*:1078*//*1088:*/
#line 21311 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("left",left_right,left_noad);

primitive("right",left_right,right_noad);

text(frozen_right)= text(cur_val);eqtb[frozen_right]= eqtb[cur_val];

/*:1088*//*1103:*/
#line 21586 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("long",prefix,1);

primitive("outer",prefix,2);

primitive("global",prefix,4);

primitive("def",def,0);

primitive("gdef",def,1);

primitive("edef",def,2);

primitive("xdef",def,3);


/*:1103*//*1114:*/
#line 21782 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("let",let,normal);

primitive("futurelet",let,normal+1);


/*:1114*//*1117:*/
#line 21827 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("chardef",shorthand_def,char_def_code);

primitive("mathchardef",shorthand_def,math_char_def_code);

primitive("countdef",shorthand_def,count_def_code);

primitive("dimendef",shorthand_def,dimen_def_code);

primitive("skipdef",shorthand_def,skip_def_code);

primitive("muskipdef",shorthand_def,mu_skip_def_code);

primitive("toksdef",shorthand_def,toks_def_code);


/*:1117*//*1125:*/
#line 21989 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("catcode",def_code,utf_cat_code_base);

primitive("mathcode",def_code,math_code_base);

primitive("Umathcode",def_code,utf_math_code_base);

primitive("Umathcodenum",def_code,utf_math_codenum_base);

primitive("lccode",def_code,utf_lc_code_base);

primitive("uccode",def_code,utf_uc_code_base);

primitive("sfcode",def_code,utf_sf_code_base);

primitive("delcode",def_code,utf_del_code_base);

primitive("textfont",def_family,math_font_base);

primitive("scriptfont",def_family,math_font_base+script_size);

primitive("scriptscriptfont",def_family,math_font_base+script_script_size);


/*:1125*//*1145:*/
#line 22331 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("hyphenation",hyph_data,0);

primitive("patterns",hyph_data,1);


/*:1145*//*1149:*/
#line 22368 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("hyphenchar",assign_font_int,0);

primitive("skewchar",assign_font_int,1);


/*:1149*//*1157:*/
#line 22497 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("batchmode",set_interaction,batch_mode);

primitive("nonstopmode",set_interaction,nonstop_mode);

primitive("scrollmode",set_interaction,scroll_mode);

primitive("errorstopmode",set_interaction,error_stop_mode);


/*:1157*//*1167:*/
#line 22563 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("openin",in_stream,1);

primitive("closein",in_stream,0);


/*:1167*//*1172:*/
#line 22597 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("message",message,0);

primitive("errmessage",message,1);


/*:1172*//*1181:*/
#line 22664 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("lowercase",case_shift,utf_lc_code_base);

primitive("uppercase",case_shift,utf_uc_code_base);


/*:1181*//*1186:*/
#line 22720 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("show",xray,show_code);

primitive("showbox",xray,show_box_code);

primitive("showthe",xray,show_the_code);

primitive("showlists",xray,show_lists_code);


/*:1186*//*1239:*/
#line 23908 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("openout",extension,open_node);

primitive("write",extension,write_node);write_loc= cur_val;

primitive("closeout",extension,close_node);

primitive("special",extension,special_node);

primitive("immediate",extension,immediate_code);

primitive("setlanguage",extension,set_language_code);


/*:1239*//*1567:*/
#line 28532 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("HINTversion",last_item,HINT_version_code);

primitive("HINTminorversion",last_item,HINT_minor_version_code);



/*:1567*//*1580:*/
#line 28938 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("HINTcolor",extension,color_node);

primitive("HINTendcolor",extension,end_color_node);

primitive("HINTdefaultcolor",extension,default_color_node);

primitive("HINTlinkcolor",extension,link_color_node);

primitive("HINTdefaultlinkcolor",extension,default_link_color_node);


/*:1580*//*1606:*/
#line 29453 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("HINTdest",extension,label_node);

primitive("HINTstartlink",extension,start_link_node);

primitive("HINTendlink",extension,end_link_node);

primitive("HINToutline",extension,outline_node);


/*:1606*//*1638:*/
#line 30597 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("HINTsetpage",extension,setpage_node);


primitive("HINTstream",extension,stream_node);


primitive("HINTsetstream",extension,setstream_node);


primitive("HINTbefore",extension,stream_before_node);


primitive("HINTafter",extension,stream_after_node);


/*:1638*//*1745:*/
#line 32676 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("HINTimage",extension,image_node);


/*:1745*/
#line 23572 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
no_new_control_sequence= true;
}
#endif
#line 23576 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1231*//*1233:*/
#line 23630 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
static void debug_help(void)
{
int k,l,m,n;
clear_terminal;
loop{wake_up_terminal;
print_nl("debug # (-1 to exit):");update_terminal;

if(fscanf(term_in.f," %d",&m)<1||
m<0)return;
else if(m==0)
{goto breakpoint;
breakpoint:m= 0;
}
else{fscanf(term_in.f," %d",&n);
switch(m){
/*1234:*/
#line 23655 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case 1:print_word(mem[n]);break;
case 2:print_int(info(n));break;
case 3:print_int(link(n));break;
case 4:print_word(eqtb[n]);break;
case 5:print_word(font_info[n]);break;
case 6:print_word(save_stack[n]);break;
case 7:show_box(n);break;

case 8:{breadth_max= 10000;depth_threshold= pool_size-pool_ptr-10;
show_node_list(n);
}break;
case 9:show_token_list(n,null,1000);break;
case 10:slow_print(n);break;
case 11:check_mem(n> 0);break;
case 12:search_mem(n);break;
case 13:{fscanf(term_in.f," %d",&l);print_cmd_chr(n,l);
}break;
case 14:for(k= 0;k<=n;k++)printn(buffer[k]);break;
case 15:{font_in_short_display= null_font;short_display(n);
}break;
case 16:panicking= !panicking;break;

/*:1234*/
#line 23647 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:print("?");
}
}
}
}
#endif
#line 23654 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1233*//*1434:*/
#line 27222 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void Prote_initialize(void)
{int k;
/*1456:*/
#line 27433 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

xchg_buffer_length= 0;

/*:1456*//*1462:*/
#line 27474 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

incsname_state= 0;

/*:1462*//*1516:*/
#line 28000 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

two_to_the[0]= 1;
for(k= 1;k<=30;k++)two_to_the[k]= 2*two_to_the[k-1];
spec_log[1]= 93032640;
spec_log[2]= 38612034;
spec_log[3]= 17922280;
spec_log[4]= 8662214;
spec_log[5]= 4261238;
spec_log[6]= 2113709;
spec_log[7]= 1052693;
spec_log[8]= 525315;
spec_log[9]= 262400;
spec_log[10]= 131136;
spec_log[11]= 65552;
spec_log[12]= 32772;
spec_log[13]= 16385;
for(k= 14;k<=27;k++)spec_log[k]= two_to_the[27-k];
spec_log[28]= 1;

/*:1516*//*1531:*/
#line 28240 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

random_seed= sys_time;
init_randoms();

/*:1531*//*1553:*/
#line 28453 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

last_saved_xpos= 0;last_saved_ypos= 0;

/*:1553*//*1558:*/
#line 28484 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

last_save_pos_number= 0;

/*:1558*/
#line 27225 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}

/*:1434*/
#line 23356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1225*//*1227:*/
#line 23410 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

int main(int argc,char*argv[]){
hlog= stderr;
main_init(argc,argv);
history= fatal_error_stop;
t_open_out;
if(ready_already==314159)goto start_of_TEX;
/*14:*/
#line 613 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

bad= 0;
if((half_error_line<30)||(half_error_line> error_line-15))bad= 1;
if(max_print_line<60)bad= 2;
if(mem_bot+1100> mem_top)bad= 4;
if(hash_prime> hash_size)bad= 5;
if(max_in_open>=128)bad= 6;
if(mem_top<256+11)bad= 7;

/*:14*//*106:*/
#line 2352 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
if((mem_min!=mem_bot)||(mem_max!=mem_top))bad= 10;
#endif
#line 2356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((mem_min> mem_bot)||(mem_max<mem_top))bad= 10;
if((min_quarterword> 0)||(max_quarterword<127))bad= 11;
if((min_halfword> 0)||(max_halfword<32767))bad= 12;
if((min_quarterword<min_halfword)||
(max_quarterword> max_halfword))bad= 13;
if((mem_min<min_halfword)||(mem_max>=max_halfword)||
(mem_bot-mem_min-1> max_halfword))bad= 14;
if((font_base<min_quarterword)||(font_max> max_quarterword))bad= 15;
if(font_max> font_base+256)bad= 16;
if((save_size> max_halfword)||(max_strings> max_halfword))bad= 17;
if(buf_size> max_halfword)bad= 18;
if(max_quarterword-min_quarterword<255)bad= 19;

/*:106*//*285:*/
#line 6442 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(cs_token_flag+undefined_control_sequence> max_halfword)bad= 21;

/*:285*//*1144:*/
#line 22326 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(2*max_halfword<mem_top-mem_min)bad= 41;

/*:1144*/
#line 23417 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(bad> 0)
{wterm_ln("Ouch---my internal constants have been clobbered!"
"---case %d",bad);

exit(0);
}
get_strings_started();
initialize();
#ifdef INIT
if(iniversion)
{init_prim();
init_str_ptr= str_ptr;init_pool_ptr= pool_ptr;fix_date_and_time();}
#endif
#line 23431 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 ready_already= 314159;
start_of_TEX:/*50:*/
#line 1296 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

selector= term_only;tally= 0;term_offset= 0;file_offset= 0;

/*:50*//*56:*/
#line 1446 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

wterm("%s",banner);
if(format_ident==0)wterm_ln(" (preloaded format=%s)",dump_name);
else{slow_print(format_ident);print_ln();
}
update_terminal;

/*:56*//*522:*/
#line 10794 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

job_name= 0;name_in_progress= false;log_opened= false;

/*:522*//*527:*/
#line 10855 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
output_file_name= 0;

/*:527*/
#line 23432 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1232:*/
#line 23584 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{/*326:*/
#line 7409 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{input_ptr= 0;max_in_stack= 0;
in_open= 0;open_parens= 0;max_buf_stack= 0;
grp_stack[0]= 0;if_stack[0]= null;
param_ptr= 0;max_param_stack= 0;
first= buf_size;do{buffer[first]= 0;decr(first);}while(!(first==0));
scanner_status= normal;warning_index= null;first= 1;
state= new_line;start= 1;index= 0;line= 0;name= 0;
force_eof= false;
align_state= 1000000;
if(!init_terminal())exit(0);
limit= last;first= last+1;
}

/*:326*/
#line 23585 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
/*1269:*/
#line 24889 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef INIT
if(iniversion&&(buffer[loc]=='*'||etexp))
{no_new_control_sequence= false;
/*1270:*/
#line 24923 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("lastnodetype",last_item,last_node_type_code);

primitive("eTeXversion",last_item,eTeX_version_code);

primitive("eTeXrevision",convert,eTeX_revision_code);


/*:1270*//*1277:*/
#line 24962 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("everyeof",assign_toks,every_eof_loc);

primitive("tracingassigns",assign_int,int_base+tracing_assigns_code);

primitive("tracinggroups",assign_int,int_base+tracing_groups_code);

primitive("tracingifs",assign_int,int_base+tracing_ifs_code);

primitive("tracingscantokens",assign_int,int_base+tracing_scan_tokens_code);

primitive("tracingnesting",assign_int,int_base+tracing_nesting_code);

primitive("savingvdiscards",assign_int,int_base+saving_vdiscards_code);

primitive("savinghyphcodes",assign_int,int_base+saving_hyph_codes_code);

primitive("ignoreprimitiveerror",assign_int,int_base+ignore_primitive_error_code);


/*:1277*//*1283:*/
#line 25066 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("currentgrouplevel",last_item,current_group_level_code);

primitive("currentgrouptype",last_item,current_group_type_code);


/*:1283*//*1286:*/
#line 25088 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("currentiflevel",last_item,current_if_level_code);

primitive("currentiftype",last_item,current_if_type_code);

primitive("currentifbranch",last_item,current_if_branch_code);


/*:1286*//*1289:*/
#line 25124 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("fontcharwd",last_item,font_char_wd_code);

primitive("fontcharht",last_item,font_char_ht_code);

primitive("fontchardp",last_item,font_char_dp_code);

primitive("fontcharic",last_item,font_char_ic_code);


/*:1289*//*1292:*/
#line 25165 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("parshapelength",last_item,par_shape_length_code);

primitive("parshapeindent",last_item,par_shape_indent_code);

primitive("parshapedimen",last_item,par_shape_dimen_code);


/*:1292*//*1295:*/
#line 25197 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("showgroups",xray,show_groups);


/*:1295*//*1304:*/
#line 25368 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("showtokens",xray,show_tokens);


/*:1304*//*1306:*/
#line 25383 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("unexpanded",the,1);

primitive("detokenize",the,show_tokens);


/*:1306*//*1309:*/
#line 25409 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("showifs",xray,show_ifs);


/*:1309*//*1312:*/
#line 25440 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("interactionmode",set_page_int,2);


/*:1312*//*1317:*/
#line 25469 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("middle",left_right,middle_noad);


/*:1317*//*1319:*/
#line 25479 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("scantokens",input,2);


/*:1319*//*1331:*/
#line 25609 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("readline",read_to_cs,1);


/*:1331*//*1334:*/
#line 25636 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("unless",expand_after,1);

primitive("ifdefined",if_test,if_def_code);

primitive("ifcsname",if_test,if_cs_code);

primitive("iffontchar",if_test,if_font_char_code);


/*:1334*//*1342:*/
#line 25729 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("protected",prefix,8);


/*:1342*//*1350:*/
#line 25864 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("numexpr",last_item,eTeX_expr-int_val+int_val);

primitive("dimexpr",last_item,eTeX_expr-int_val+dimen_val);

primitive("glueexpr",last_item,eTeX_expr-int_val+glue_val);

primitive("muexpr",last_item,eTeX_expr-int_val+mu_val);


/*:1350*//*1373:*/
#line 26284 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("gluestretchorder",last_item,glue_stretch_order_code);

primitive("glueshrinkorder",last_item,glue_shrink_order_code);

primitive("gluestretch",last_item,glue_stretch_code);

primitive("glueshrink",last_item,glue_shrink_code);


/*:1373*//*1377:*/
#line 26323 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("mutoglue",last_item,mu_to_glue_code);

primitive("gluetomu",last_item,glue_to_mu_code);


/*:1377*//*1381:*/
#line 26361 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("marks",mark,marks_code);

primitive("topmarks",top_bot_mark,top_mark_code+marks_code);

primitive("firstmarks",top_bot_mark,first_mark_code+marks_code);

primitive("botmarks",top_bot_mark,bot_mark_code+marks_code);

primitive("splitfirstmarks",top_bot_mark,split_first_mark_code+marks_code);

primitive("splitbotmarks",top_bot_mark,split_bot_mark_code+marks_code);


/*:1381*//*1420:*/
#line 27125 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("pagediscards",un_vbox,last_box_code);

primitive("splitdiscards",un_vbox,vsplit_code);


/*:1420*//*1423:*/
#line 27145 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("interlinepenalties",set_shape,inter_line_penalties_loc);

primitive("clubpenalties",set_shape,club_penalties_loc);

primitive("widowpenalties",set_shape,widow_penalties_loc);

primitive("displaywidowpenalties",set_shape,display_widow_penalties_loc);


/*:1423*//*1427:*/
#line 27179 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("expanddepth",assign_int,int_base+expand_depth_code);


/*:1427*/
#line 24893 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(buffer[loc]=='*')incr(loc);
eTeX_mode= 1;
/*1385:*/
#line 26396 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

max_reg_num= 32767;
max_reg_help_line= "A register number must be between 0 and 32767.";

/*:1385*//*1429:*/
#line 27186 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

expand_depth= 10000;
expand_depth_count= 0;

/*:1429*/
#line 24896 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(buffer[loc]=='*'||ltxp){
/*1455:*/
#line 27426 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(xchg_buffer_size<64)bad= 51;

/*:1455*/
#line 24898 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1442:*/
#line 27311 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("Proteversion",last_item,Prote_version_code);

primitive("Proterevision",convert,Prote_revision_code);


/*:1442*//*1457:*/
#line 27444 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("shellescape",last_item,shell_escape_code);


/*:1457*//*1460:*/
#line 27459 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("ifincsname",if_test,if_incsname_code);

primitive("ifprimitive",if_test,if_primitive_code);


/*:1460*//*1467:*/
#line 27515 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("primitive",expand_after,primitive_code);

text(frozen_primitive)= text(cur_val);eqtb[frozen_primitive]= eqtb[cur_val];

/*:1467*//*1477:*/
#line 27635 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("expanded",expand_after,expanded_code);


/*:1477*//*1480:*/
#line 27661 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("strcmp",convert,strcmp_code);


/*:1480*//*1486:*/
#line 27718 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("creationdate",convert,creation_date_code);


/*:1486*//*1491:*/
#line 27754 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("resettimer",extension,reset_timer_code);

primitive("elapsedtime",last_item,elapsed_time_code);


/*:1491*//*1498:*/
#line 27805 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("filesize",convert,file_size_code);


/*:1498*//*1502:*/
#line 27832 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("filemoddate",convert,file_mod_date_code);


/*:1502*//*1506:*/
#line 27872 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("filedump",convert,file_dump_code);


/*:1506*//*1510:*/
#line 27935 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("mdfivesum",convert,mdfive_sum_code);


/*:1510*//*1528:*/
#line 28224 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("randomseed",last_item,random_seed_code);


/*:1528*//*1532:*/
#line 28248 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("setrandomseed",convert,set_random_seed_code);


/*:1532*//*1539:*/
#line 28324 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("uniformdeviate",convert,uniform_deviate_code);


/*:1539*//*1546:*/
#line 28408 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("normaldeviate",convert,normal_deviate_code);


/*:1546*//*1551:*/
#line 28437 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("pagewidth",assign_dimen,dimen_base+page_width_code);

primitive("pageheight",assign_dimen,dimen_base+page_height_code);


/*:1551*//*1554:*/
#line 28456 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("lastxpos",last_item,last_xpos_code);

primitive("lastypos",last_item,last_ypos_code);


/*:1554*//*1559:*/
#line 28487 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

primitive("savepos",extension,save_pos_code);


/*:1559*/
#line 24899 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(buffer[loc]=='*')incr(loc);
Prote_mode= 1;
}
}
#endif
#line 24905 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(!no_new_control_sequence)
no_new_control_sequence= true;else

/*:1269*/
#line 23586 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((format_ident==0)||(buffer[loc]=='&'))
{if(format_ident!=0)initialize();
if(!open_fmt_file())exit(0);
if(!load_fmt_file())
{w_close(&fmt_file);exit(0);
}
else if(needs_loading(cur_font))
read_predefined_font(cur_font);
w_close(&fmt_file);
while((loc<limit)&&(buffer[loc]==' '))incr(loc);
}
if(eTeX_ex)wterm_ln("entering extended mode");
if(Prote_ex){Prote_initialize();
}
if(end_line_char_inactive)decr(limit);
else buffer[limit]= end_line_char;
fix_date_and_time();
/*70:*/
#line 1675 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(interaction==batch_mode)selector= no_print;else selector= term_only

/*:70*/
#line 23604 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if((loc<limit)&&(cat_code(buffer[loc])!=escape))start_input();

}

/*:1232*/
#line 23433 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
history= spotless;
hhsize= hsize;hvsize= vsize;hout_allocate();
main_control();
final_cleanup();
close_files_and_terminate();
ready_already= 0;
return 0;}

/*:1227*//*1571:*/
#line 28559 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1649:*/
#line 30808 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#define RESIZE(P,S,T)       \
{ int _n =  (S)*1.4142136 +0.5;        \
  if (_n<32) _n= 32;                   \
  { REALLOCATE(P,_n,T);             \
    memset((P)+(S),0,(_n-(S))*sizeof(T));         \
    (S)= _n;                           \
  }                                   \
}


/*:1649*//*1661:*/
#line 31039 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#define HPUTDEF(F,R)            \
  { uint32_t _p;                \
    uint8_t _f;                 \
    HPUTNODE;     \
    _p= hpos-hstart;             \
    HPUT8(0);          \
    HPUT8(R);    \
    _f= F;                       \
    hstart[_p]= _f; DBGTAG(_f,hstart+_p);      \
    DBGTAG(_f,hpos); HPUT8(_f); \
  }
/*:1661*//*1702:*/
#line 31831 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


#define HPUTCONTENT(F,D)        \
  { uint32_t _p;                \
    uint8_t _f;                 \
    HPUTNODE;     \
    _p= hpos++-hstart;  \
    _f= F(D);                    \
    *(hstart+_p)= _f; DBGTAG(_f,hstart+_p);      \
    DBGTAG(_f,hpos); HPUT8(_f); \
  }

/*:1702*/
#line 28560 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1622:*/
#line 29886 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled page_h,page_v;
/*:1622*//*1633:*/
#line 30443 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int insert2stream[0x100]= {0};
/*:1633*//*1650:*/
#line 30819 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int dir_entries= 4;

/*:1650*//*1657:*/
#line 30958 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int32_t int_defined[0x100]= {0};
/*:1657*//*1658:*/
#line 30966 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static const int hmap_int[]= {
pretolerance_no,
tolerance_no,
line_penalty_no,
hyphen_penalty_no,
ex_hyphen_penalty_no,
club_penalty_no,
widow_penalty_no,
display_widow_penalty_no,
broken_penalty_no,
-1,
-1,
pre_display_penalty_no,
post_display_penalty_no,
inter_line_penalty_no,
double_hyphen_demerits_no,
final_hyphen_demerits_no,
adj_demerits_no,
-1,
-1,
looseness_no,
time_no,
day_no,
month_no,
year_no,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
hang_after_no,
floating_penalty_no
};


/*:1658*//*1663:*/
#line 31062 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static scaled dimen_defined[0x100]= {0};
/*:1663*//*1664:*/
#line 31064 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static const int hmap_dimen[]= {
-1,
-1,
line_skip_limit_no,
hsize_dimen_no,
vsize_dimen_no,
max_depth_no,
split_max_depth_no,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
-1,
hang_indent_no,
-1,
-1,
emergency_stretch_no
};
/*:1664*//*1668:*/
#line 31120 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static struct{
scaled w,h,v;}xdimen_defined[0x100];
/*:1668*//*1673:*/
#line 31189 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer glue_defined[0x100];
/*:1673*//*1674:*/
#line 31191 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hmap_glue[]= {

line_skip_no,
baseline_skip_no,
-1,
above_display_skip_no,
below_display_skip_no,
above_display_short_skip_no,
below_display_short_skip_no,
left_skip_no,
right_skip_no,
top_skip_no,
split_top_skip_no,
tab_skip_no,
-1,
-1,
par_fill_skip_no
};
/*:1674*//*1680:*/
#line 31304 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef struct{
pointer ls,bs;
scaled lsl;
}bl_definition;

static bl_definition*bl_defined= NULL;
static int bl_used= 0,bl_allocated= 0;

/*:1680*//*1686:*/
#line 31414 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer dc_defined[0x100];
/*:1686*//*1691:*/
#line 31520 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


#define PLH_SIZE 313 

static struct{int l;
uint32_t h;
uint32_t n;
uint32_t s;
uint8_t*p;}pl_defined[PLH_SIZE]= {{0}};
static int pl_head= 0,*pl_tail= &pl_head;

/*:1691*//*1695:*/
#line 31625 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#define MAX_FONTS 0x100

typedef struct{
uint8_t i;
pointer g;
pointer h;
pointer p[MAX_FONT_PARAMS];
int m;
uint16_t y;
}Font;

static Font*hfonts[MAX_FONTS]= {NULL};
static int hmap_font[MAX_FONTS];
/*:1695*//*1713:*/
#line 32030 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static struct{
uint8_t n;
str_number s;
}hlanguage[0x100];
/*:1713*/
#line 28561 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1741:*/
#line 32608 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hout_list_node(pointer p,uint32_t pos,List*l);
static void hout_list_node2(pointer p);
static uint8_t hout_list(pointer p,uint32_t pos,List*l);

/*:1741*//*1743:*/
#line 32643 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hout_param_list(pointer p,uint32_t pos,List*l);


/*:1743*/
#line 28562 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*1585:*/
#line 29123 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool colorset_equal(ColorSet old,ColorSet new)
{int i;
for(i= 0;i<sizeof(ColorSet)/sizeof(uint32_t);i++)
if(old[i]!=new[i])return false;
return true;
}


static int next_colorset(ColorSet c)
{int i;
for(i= 0;i<=max_color;i++)
if(colorset_equal(colors[i],c))return i;
if(max_color<0xFF)max_ref[color_kind]= ++max_color;
else overflow("colors",0xFF);
if(max_color>=colors_allocated)
RESIZE(colors,colors_allocated,ColorSet);
colorset_copy(colors[max_color],c);
#ifdef DEBUG
if(debugflags&DBGDEF)
{print_nl("HINT Defining new color ");print_int(max_color);print(": ");
print_color_spec(max_color);}
#endif
#line 29146 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 return max_color;
}

/*:1585*//*1588:*/
#line 29158 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
static bool is_default_color_pair(ColorSet c,int m,int s)
{return c[6*m+2*s]==colors[0][6*m+2*s]
&&c[6*m+2*s+1]==colors[0][6*m+2*s+1];
}

static void print_color(uint32_t c)
{print_char('{');
print_hex((c>>24)&0xFF);print_char(' ');
print_hex((c>>16)&0xFF);print_char(' ');
print_hex((c>>8)&0xFF);print_char(' ');
if((c&0xFF)!=0xFF)print_hex(c&0xFF);
print_char('}');
}

static void print_color_pair(ColorSet c,int m,int s)
{print("FG");print_color(c[6*m+2*s+0]);
print(" BG");print_color(c[6*m+2*s+1]);
}

static void print_color_triple(ColorSet c,int m)
{bool diff_high,diff_focus;
print_color_pair(c,m,0);
diff_high= is_default_color_pair(c,m,1);
diff_focus= is_default_color_pair(c,m,2);
if(diff_high||diff_focus)
{print_char(' ');print_color_pair(c,m,1);}
if(diff_focus)
{print_char(' ');print_color_pair(c,m,2);}
}


static void print_color_spec(int i)
{if(i> max_color){print("undefined color ");print_int(i);}
else if(i<0||i> 0xFF){print("illegal color ");print_int(i);}
else
{print_color_triple(colors[i],0);
if(is_default_color_pair(colors[i],1,0)&&
is_default_color_pair(colors[i],1,1)&&
is_default_color_pair(colors[i],1,2))
return;
print(" dark ");print_color_triple(colors[i],1);
}
}
#endif
#line 29204 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1588*//*1589:*/
#line 29206 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer new_color_node(uint8_t c)
{pointer r= get_node(color_node_size);
type(r)= whatsit_node;subtype(r)= color_node;
color_ref(r)= c;color_link(r)= null;
return r;
}

/*:1589*//*1592:*/
#line 29245 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hout_color_ref(uint8_t c)
{uint8_t tag= TAG(color_kind,b000);
HPUTNODE;
HPUT8(tag);
HPUT8(c);
HPUT8(tag);
}

/*:1592*//*1594:*/
#line 29266 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static Tag hout_color_def(ColorSet c)
{int i;

HPUT8(6);
for(i= 0;i<sizeof(ColorSet)/sizeof(uint32_t);i++)
HPUT32(c[i]);
return TAG(color_kind,b000);
}

/*:1594*//*1607:*/
#line 29474 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int next_label(void)
{static int label_no= -1;
static int labels_allocated= 0;
label_no++;
if(label_no> 0xFFFF)
overflow("labels",0xFFFF);
if(label_no>=labels_allocated)
{if(labels_allocated==0)
{labels_allocated= 32;ALLOCATE(labels,labels_allocated,Label);}
else RESIZE(labels,labels_allocated,Label);
}
max_ref[label_kind]= label_no;
return label_no;
}

static int next_outline(void)
{static int outlines_allocated= 0;
static int outline_no= -1;
outline_no++;
if(outline_no> 0xFFFF)
overflow("outlines",0xFFFF);
if(outline_no>=outlines_allocated)
{if(outlines_allocated==0)
{outlines_allocated= 32;ALLOCATE(outlines,outlines_allocated,Outline);}
else RESIZE(outlines,outlines_allocated,Outline);
}
max_outline= outline_no;
return outline_no;
}
/*:1607*//*1608:*/
#line 29511 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

typedef struct hash_entry
{int num;char*nom;uint16_t n;struct hash_entry*next;}HashEntry;
#define LABEL_HASH 1009 
static HashEntry*label_hash[LABEL_HASH]= {NULL};

static int insert_hash(int h,int num,char*nom)
{HashEntry*e;
ALLOCATE(e,1,HashEntry);
e->n= next_label();
if(nom!=NULL)e->nom= strdup(nom);
else e->num= num;
e->next= label_hash[h];
label_hash[h]= e;
if(e->nom!=NULL)
DBG(DBGLABEL,"Creating new label hash *%d: name='%s'\n",e->n,e->nom);
else
DBG(DBGLABEL,"Creating new label hash *%d: num=%d\n",e->n,e->num);
return e->n;
}
/*:1608*//*1609:*/
#line 29535 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int find_label_by_number(int p)
{unsigned int h= (unsigned int)p%LABEL_HASH;
HashEntry*e= label_hash[h];
DBG(DBGLABEL,"Looking up label num %d\n",(unsigned int)p);
while(e!=NULL)
if(e->nom==NULL&&e->num==p)return e->n;
else e= e->next;
return insert_hash(h,p,NULL);
}
/*:1609*//*1610:*/
#line 29556 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char*tokens_to_name(pointer p)
{static char s[256];
int i= 0;
bool skip_space= 0;
while(i<255&&p!=0)
{int m= info(p)/cmd_factor;
int c= info(p)%cmd_factor;
if(m==spacer&&!skip_space)
{s[i++]= ' ';skip_space= true;}
else if((m==letter||m==other_char)&&' '<c&&c<0x7F)
{s[i++]= c;skip_space= false;}
p= link(p);
}
s[i]= 0;
return s;
}

static unsigned int name_hash(char*s)
{unsigned int h= 0;
while(*s!=0)
h= (h<<2)+*(s++);
return h;
}

static int find_label_by_name(pointer p)
{char*s= tokens_to_name(link(p));
unsigned int h= name_hash(s)%LABEL_HASH;
HashEntry*e= label_hash[h];
DBG(DBGLABEL,"Looking up label name %s\n",s);
while(e!=NULL)
if(e->nom!=NULL&&strcmp(e->nom,s)==0)return e->n;
else e= e->next;
return insert_hash(h,0,s);
}
/*:1610*//*1611:*/
#line 29593 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int find_label(pointer p)
{if(label_has_name(p))return find_label_by_name(label_ptr(p));
else return find_label_by_number(label_ptr(p));
}
/*:1611*//*1612:*/
#line 29608 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_label(pointer p)
{int n;
DBG(DBGLABEL,"Label at pos=0x%x\n",(unsigned int)(hpos-hstart));
n= find_label(p);
if(n!=zero_label_no&&labels[n].where!=LABEL_UNDEF)
{MESSAGE("WARNING: Ignoring duplicate definition of label ");
if(label_has_name(p))MESSAGE("name %s\n",tokens_to_name(link(label_ptr(p))));
else MESSAGE("num %d\n",label_ptr(p));
}
else
{labels[n].where= label_where(p);
labels[n].pos= hpos-hstart;
labels[n].pos0= hpos0-hstart;
labels[n].next= first_label;
first_label= n;
DBG(DBGLABEL,"Defining label *%d: pos=0x%x\n",n,labels[n].pos);
}
}
/*:1612*//*1613:*/
#line 29630 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int last_link= -1;
static int new_start_link(pointer p)
{int n= find_label(as_label(p));
if(last_link>=0)
fatal_error("Missing end link before start link");
labels[n].used= true;
last_link= n;
DBG(DBGLABEL,"New link to label *%d\n",n);
return n;
}

static int new_end_link(void)
{int n;
if(last_link<0)
fatal_error("Missing start link before end link");
n= last_link;
last_link= -1;
return n;
}
/*:1613*//*1614:*/
#line 29657 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_outline(pointer p)
{int r= find_label(p);
int m= next_outline();
List l;
uint32_t pos;
pos= hpos-hstart;
l.t= TAG(list_kind,b001);
hout_list_node(outline_ptr(p),pos,&l);
hset_outline(m,r,outline_depth(p),pos);
DBG(DBGLABEL,"New outline for label *%d\n",r);
}
/*:1614*//*1619:*/
#line 29806 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool is_visible(pointer p)
{switch(type(p))
{case penalty_node:
case kern_node:
case glue_node:
case mark_node:
return false;
case ins_node:
return ins_ptr(p)!=null;
case adjust_node:
return adjust_ptr(p)!=null;
case hlist_node:
case vlist_node:
return list_ptr(p)!=null;
case whatsit_node:
if(subtype(p)==image_node||subtype(p)==align_node||subtype(p)==disp_node||
subtype(p)==open_node||subtype(p)==write_node||subtype(p)==close_node||
subtype(p)==label_node||subtype(p)==outline_node)
return true;
else if(subtype(p)==hset_node||subtype(p)==vset_node||
subtype(p)==hpack_node||subtype(p)==vpack_node)
return list_ptr(p)!=null;
else if(subtype(p)==par_node)
return par_list(p)!=null;
else
return false;
default:return true;
}
}

/*:1619*//*1624:*/
#line 29912 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer*collect_output(pointer*p,pointer*q)
{while(*p!=null)
{/*1625:*/
#line 29924 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(!is_char_node(*p))
{pointer r= *p;
switch(type(r))
{
#if 0
case glue_node:
case penalty_node:
{*p= link(r);link(r)= null;*q= r;q= &(link(r));
if(*p==null)return q;
}
break;
#endif
#line 29937 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 case whatsit_node:
switch(subtype(r))
{case open_node:case write_node:case close_node:
case special_node:case latespecial_node:
{*p= link(r);link(r)= null;*q= r;q= &(link(r));
if(*p==null)return q;
}
break;
case par_node:q= collect_output(&par_list(r),q);
break;
case disp_node:
if(display_left(r))q= collect_output(&display_eqno(r),q);
q= collect_output(&display_formula(r),q);
if(!display_left(r))q= collect_output(&display_eqno(r),q);
break;
case hset_node:case vset_node:case hpack_node:case vpack_node:
q= collect_output(&list_ptr(r),q);
break;
case align_node:
q= collect_output(&align_list(r),q);
break;
default:break;
}
break;
case hlist_node:case vlist_node:
q= collect_output(&list_ptr(r),q);
break;
case ins_node:
q= collect_output(&ins_ptr(r),q);
break;
case adjust_node:
q= collect_output(&adjust_ptr(r),q);
break;
default:break;
}
}


/*:1625*/
#line 29915 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= &(link(*p));
}
return q;
}
/*:1624*//*1642:*/
#line 30695 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static pointer hget_current_page(void)
{pointer p= link(setpage_head);
if(p==null)
print_err("end of output group without setpage node");
return p;
}

static pointer hget_current_stream(void)
{pointer p,s;
p= hget_current_page();
if(p==null)return null;
s= setpage_streams(p);
if(s==null)
print_err("end of setstream group without setstream node");
return s;
}

/*:1642*//*1651:*/
#line 30822 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static uint16_t hnew_file_section(char*file_name)
{uint16_t i;
/*1647:*/
#line 30792 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(i= 3;i<=max_section_no;i++)
if(dir[i].file_name!=NULL&&strcmp(dir[i].file_name,file_name)==0)
return i;

/*:1647*/
#line 30825 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1648:*/
#line 30797 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

i= max_section_no;
i++;
if(i> 0xFFFF)QUIT("Too many file sections");
if(i>=dir_entries)
RESIZE(dir,dir_entries,Entry);
max_section_no= i;
if(max_section_no> 0xFFFF)QUIT("Too many sections");
dir[i].section_no= i;


/*:1648*/
#line 30826 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dir[i].file_name= strdup(file_name);
return i;
}

/*:1651*//*1652:*/
#line 30840 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char*hfile_name(str_number n,str_number a,str_number e)
{pack_file_name(n,a,e,NULL);
if(name_length>=file_name_size)
QUIT("File name too long %d >= %d",name_length,file_name_size);
return(char*)name_of_file+1;
}

/*:1652*//*1653:*/
#line 30868 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hfix_defaults(void)
{int i;
DBG(DBGDEF,"Freezing HINT file defaults\n");
/*1621:*/
#line 29865 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{pointer p;
p= link(setpage_head);
if(p==null)
{scaled margin;
if(hhsize<hvsize)margin= hhsize;else margin= hvsize;
margin= margin/6-6*unity;
if(margin<0)margin= 0;
page_h= hhsize+2*margin;
page_v= hvsize+2*margin;
}
else
{pointer x;
x= setpage_height(p);
page_v= xdimen_width(x)
+round(((double)xdimen_hfactor(x)*hhsize+(double)xdimen_vfactor(x)*hvsize)/unity);
x= setpage_width(p);
page_h= xdimen_width(x)
+round(((double)xdimen_hfactor(x)*hhsize+(double)xdimen_vfactor(x)*hvsize)/unity);
}
}
/*:1621*/
#line 30872 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1659:*/
#line 31016 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

int_defined[zero_int_no]= 0;
for(i= pretolerance_code;i<=floating_penalty_code;i++)
if(hmap_int[i]>=0)int_defined[hmap_int[i]]= int_par(i);
max_ref[int_kind]= MAX_INT_DEFAULT;
/*:1659*/
#line 30873 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1665:*/
#line 31088 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

dimen_defined[zero_dimen_no]= 0;
for(i= par_indent_code;i<=emergency_stretch_code;i++)
if(hmap_dimen[i]>=0)dimen_defined[hmap_dimen[i]]= dimen_par(i);
dimen_defined[hsize_dimen_no]= page_h;
dimen_defined[vsize_dimen_no]= page_v;
dimen_defined[quad_no]= quad(cur_font);
dimen_defined[math_quad_no]= math_quad(text_size);
max_ref[dimen_kind]= MAX_DIMEN_DEFAULT;
/*:1665*/
#line 30874 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1675:*/
#line 31210 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

glue_defined[zero_skip_no]= zero_glue;incr(glue_ref_count(zero_glue));
for(i= line_skip_code;i<=par_fill_skip_code;i++)
if(hmap_glue[i]>=0)
{glue_defined[hmap_glue[i]]= glue_par(i);incr(glue_ref_count(glue_par(i)));}
max_ref[glue_kind]= MAX_GLUE_DEFAULT;
/*:1675*/
#line 30875 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1704:*/
#line 31869 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

max_ref[page_kind]= max_page;
max_ref[stream_kind]= max_stream;
/*:1704*/
#line 30876 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:1653*//*1654:*/
#line 30901 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hdef_init(void)
{int i;
/*1623:*/
#line 29888 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hsize= 0;vsize= 0;
dimen_par_hfactor(hsize_code)= unity;
dimen_par_vfactor(vsize_code)= unity;
/*:1623*/
#line 30904 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1669:*/
#line 31123 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(i= 0;i<=max_fixed[xdimen_kind];i++)
{xdimen_defined[i].w= xdimen_defaults[i].w;
xdimen_defined[i].h= ONE*xdimen_defaults[i].h;
xdimen_defined[i].v= ONE*xdimen_defaults[i].v;
}

/*:1669*/
#line 30905 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1681:*/
#line 31316 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

bl_allocated= 8;
ALLOCATE(bl_defined,bl_allocated,bl_definition);
bl_defined[zero_baseline_no].bs= zero_glue;incr(glue_ref_count(zero_glue));
bl_defined[zero_baseline_no].ls= zero_glue;incr(glue_ref_count(zero_glue));
bl_defined[zero_baseline_no].lsl= 0;
bl_used= MAX_BASELINE_DEFAULT+1;
max_ref[baseline_kind]= MAX_BASELINE_DEFAULT;
/*:1681*/
#line 30906 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1696:*/
#line 31639 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

for(i= 0;i<0x100;i++)hmap_font[i]= -1;
max_ref[font_kind]= -1;

/*:1696*/
#line 30907 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1703:*/
#line 31851 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{char nom[]= "HINT.home";
unsigned int h= name_hash(nom)%LABEL_HASH;
int i= insert_hash(h,0,nom);
if(i!=zero_label_no)
QUIT("Trying to allocate the zero label, got %d",i);
labels[zero_label_no]= label_defaults[zero_label_no];
labels[zero_label_no].next= first_label;
first_label= zero_label_no;
DBG(DBGLABEL,"Defining zero label: pos=0x%x\n",labels[zero_label_no].pos);
}
/*:1703*/
#line 30908 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1586:*/
#line 29149 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

colors_allocated= 8;
ALLOCATE(colors,colors_allocated,ColorSet);
max_ref[color_kind]= max_color= MAX_COLOR_DEFAULT;
memcpy(colors,color_defaults,sizeof(ColorSet)*(max_color+1));


/*:1586*/
#line 30909 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#if 0
overfull_rule= 0;
#endif
#line 30913 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
}
/*:1654*//*1660:*/
#line 31024 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hget_int_no(int32_t n)
{int i;
int m= max_ref[int_kind];
for(i= 0;i<=m;i++)
if(n==int_defined[i])return i;
if(m<0xFF&&section_no==2)
{m= ++max_ref[int_kind];int_defined[m]= n;return m;}
else
return-1;
}
/*:1660*//*1666:*/
#line 31097 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hget_dimen_no(scaled s)


{int i;
int m= max_ref[dimen_kind];
for(i= 0;i<=m;i++)
if(s==dimen_defined[i])return i;
if(m<0xFF&&section_no==2)
{m= ++max_ref[dimen_kind];dimen_defined[m]= s;return m;}
else
return-1;
}
/*:1666*//*1670:*/
#line 31134 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hget_xdimen_no(pointer p)
{int i;
for(i= 0;i<=max_ref[xdimen_kind];i++)
{if(xdimen_defined[i].w==xdimen_width(p)&&
xdimen_defined[i].h==xdimen_hfactor(p)&&
xdimen_defined[i].v==xdimen_vfactor(p))
return i;
}
if(section_no!=2)return-1;
if(i>=0x100)return-1;
max_ref[xdimen_kind]= i;
xdimen_defined[i].w= xdimen_width(p);
xdimen_defined[i].h= xdimen_hfactor(p);
xdimen_defined[i].v= xdimen_vfactor(p);
return i;
}
/*:1670*//*1676:*/
#line 31218 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int glue_spec_equal(pointer p,pointer q)
{return(width(q)==width(p)&&stretch(q)==stretch(p)&&shrink(q)==shrink(p)&&
(stretch_order(q)==stretch_order(p)||stretch(q)==0)&&
(shrink_order(q)==shrink_order(p)||shrink(q)==0));
}

static int glue_equal(pointer p,pointer q)
{return p==q||glue_spec_equal(p,q);
}

static int Glue_equal(Glue*p,Glue*q)
{return(p->w.w==q->w.w&&p->w.h==q->w.h&&p->w.v==q->w.v&&
p->p.f==q->p.f&&p->m.f==q->m.f&&
(p->p.o==q->p.o||p->p.f==0.0)&&
(p->m.o==q->m.o||q->m.f==0.0));
}

/*:1676*//*1677:*/
#line 31241 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hget_glue_no(pointer p)
{static int rover= 0;
int i;
if(p==zero_glue)return zero_skip_no;
for(i= 0;i<=max_ref[glue_kind];i++)
{if(p==glue_defined[rover])return rover;
else if(rover==0)
rover= max_ref[glue_kind];
else
rover--;
}
for(i= 0;i<=max_ref[glue_kind];i++)
{pointer q= glue_defined[rover];
if(glue_spec_equal(p,q))
return rover;
else if(rover==0)
rover= max_ref[glue_kind];
else
rover--;
}
if(max_ref[glue_kind]<0xFF&&section_no==2)
{rover= ++max_ref[glue_kind];
glue_defined[rover]= p;
incr(glue_ref_count(p));
DBG(DBGDEF,"Defining new glue %d\n",rover);
return rover;
}
else
return-1;
}
/*:1677*//*1679:*/
#line 31293 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void to_Glue(pointer p,Glue*g)
{g->w.w= width(p);
g->w.h= g->w.v= 0.0;
g->p.f= stretch(p)/(double)ONE;g->p.o= stretch_order(p);
g->m.f= shrink(p)/(double)ONE;g->m.o= shrink_order(p);
}
/*:1679*//*1682:*/
#line 31324 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hget_baseline_no(pointer bs,pointer ls,scaled lsl)
{
static int rover= 0;
int i;
for(i= 0;i<bl_used;i++)
{bl_definition*q= &(bl_defined[rover]);
if(glue_equal(bs,q->bs)&&glue_equal(ls,q->ls)&&lsl==q->lsl)
return rover;
else if(rover==0)
rover= bl_used-1;
else
rover--;
}
if(bl_used>=bl_allocated)
RESIZE(bl_defined,bl_allocated,bl_definition);
rover= bl_used++;
if(rover<0x100&&section_no==2)max_ref[baseline_kind]= rover;
if(glue_equal(bs,zero_glue))
{bl_defined[rover].bs= zero_glue;incr(glue_ref_count(zero_glue));}
else
{bl_defined[rover].bs= bs;incr(glue_ref_count(bs));}
if(glue_equal(ls,zero_glue))
{bl_defined[rover].ls= zero_glue;incr(glue_ref_count(zero_glue));}
else
{bl_defined[rover].ls= ls;incr(glue_ref_count(ls));}
bl_defined[rover].lsl= lsl;
return rover;
}

/*:1682*//*1683:*/
#line 31356 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static uint8_t hout_glue_spec(pointer p);
static uint8_t hout_baselinespec(int n)
{Info i= b000;
pointer p;
scaled s;
s= bl_defined[n].lsl;
if(s!=0){HPUT32(s);i|= b001;}
p= bl_defined[n].bs;
if(p!=zero_glue)
{uint8_t*pos;
uint8_t tag;
HPUTNODE;
pos= hpos;
hpos++;
tag= hout_glue_spec(p);
*pos= tag;DBGTAG(tag,pos);
DBGTAG(tag,hpos);HPUT8(tag);
i|= b100;
}
p= bl_defined[n].ls;
if(p!=zero_glue)
{uint8_t*pos;
uint8_t tag;
HPUTNODE;
pos= hpos;
hpos++;
tag= hout_glue_spec(p);
*pos= tag;DBGTAG(tag,pos);
DBGTAG(tag,hpos);HPUT8(tag);
i|= b010;
}
return TAG(baseline_kind,i);
}
/*:1683*//*1687:*/
#line 31429 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool list_equal(pointer p,pointer q);
static bool node_equal(pointer p,pointer q)
{if(is_char_node(p)&&is_char_node(q)&&
font(p)==font(q)&&character(p)==character(q))
return true;
if(!is_char_node(p)&&!is_char_node(q))
{if(type(p)!=type(q))return false;
if(type(p)==kern_node&&
subtype(p)==subtype(q)&&width(p)==width(q))
return true;
if(type(p)==ligature_node&&
character(lig_char(p))==character(lig_char(q))&&
font(lig_char(p))==font(lig_char(q)))
return true;
if(type(p)==rule_node&&
width(p)==width(q)&&height(p)==height(q)&&depth(p)==depth(q))
return true;
if((type(p)==hlist_node||type(p)==vlist_node)&&
width(p)==width(q)&&height(p)==height(q)&&depth(p)==depth(q)&&
shift_amount(p)==shift_amount(q)&&
glue_sign(p)==glue_sign(q)&&
glue_order(p)==glue_order(q)&&
glue_set(p)==glue_set(q)&&
list_equal(list_ptr(p),list_ptr(q)))
return true;
}
return false;
}

static bool list_equal(pointer p,pointer q)
{while(true)
{if(p==q)return true;
if(p==null||q==null)return false;
if(!node_equal(p,q))return false;
p= link(p);q= link(q);
}
}

static pointer copy_disc_node(pointer p)
{pointer q;
q= get_node(small_node_size);
pre_break(q)= copy_node_list(pre_break(p));
post_break(q)= copy_node_list(post_break(p));
type(q)= type(p);
subtype(q)= subtype(p);
return q;
}
/*:1687*//*1697:*/
#line 31649 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer find_space_glue(internal_font_number f)
{font_index main_k;
pointer main_p= font_glue[f];
if(main_p==null)
{main_p= new_spec(zero_glue);main_k= param_base[f]+space_code;
width(main_p)= font_info[main_k].sc;
stretch(main_p)= font_info[main_k+1].sc;
shrink(main_p)= font_info[main_k+2].sc;
font_glue[f]= main_p;
}
return main_p;
}
static pointer hget_font_space(uint8_t f)
{pointer p;
if(space_skip==zero_glue)
p= find_space_glue(f);
else
p= glue_par(space_skip_code);
add_glue_ref(p);
return p;
}


static pointer hget_font_hyphen(uint8_t f)
{pointer p;
int c;
p= new_disc();
c= hyphen_char[f];
if(c>=0&&c<256)pre_break(p)= new_character(f,c);
return p;
}


static void hdef_font_params(pointer p[MAX_FONT_PARAMS])
{
}

/*:1697*//*1698:*/
#line 31712 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char*hfind_glyphs(char*filename)
{char*fname= NULL;
kpse_glyph_file_type file_ret;
fname= kpse_find_file(filename,kpse_type1_format,true);

if(fname==NULL)fname= kpse_find_file(filename,kpse_truetype_format,true);
if(fname==NULL)fname= kpse_find_file(filename,kpse_opentype_format,true);
if(fname==NULL)fname= kpse_find_glyph(filename,option_dpi,kpse_pk_format,&file_ret);
return fname;
}

static uint8_t hget_font_no(uint8_t f)
{int g;
char*n;
if(f==0)
{DBG(DBGFONT,"TeX nullfont -> 0\n");
return 0;
}
g= hmap_font[f];
if(g>=0)return g;
DBG(DBGDEF,"New TeX font %d\n",f);
if(max_ref[font_kind]>=0x100)
QUIT("too many fonts in use");
g= ++(max_ref[font_kind]);
ALLOCATE(hfonts[g],1,Font);
hfonts[g]->i= f;
hmap_font[f]= g;
hfonts[g]->g= hget_font_space(f);
hfonts[g]->h= hget_font_hyphen(f);
if(IS_X_FONT(f))
{hfonts[g]->m= -1;
pack_file_name(font_area[f],empty_string,empty_string,"");
hfonts[g]->y= hnew_file_section((char*)name_of_file+1);
}
else
{pack_file_name(font_name[f],empty_string,empty_string,".tfm");
n= kpse_find_tfm((char*)name_of_file+1);
if(n==NULL)
QUIT("Unable to find .tfm file for font %s",(char*)name_of_file+1);
hfonts[g]->m= hnew_file_section(n);
free(n);
pack_file_name(font_name[f],empty_string,empty_string,"");
n= hfind_glyphs((char*)name_of_file+1);
if(n==NULL)
QUIT("Unable to find glyph file for font %s",(char*)name_of_file+1);
hfonts[g]->y= hnew_file_section(n);
free(n);
}
DBG(DBGFONT,"Mapping TeX font %d->%d\n",f,g);
return g;
}

/*:1698*//*1699:*/
#line 31772 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void ensure_font_no(pointer p)
{while(p!=null)
{if(is_char_node(p))
hget_font_no(font(p));
else if(type(p)==hlist_node||type(p)==vlist_node)
ensure_font_no(list_ptr(p));
p= link(p);
}
}
/*:1699*//*1701:*/
#line 31808 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hout_string(int s)
{pool_pointer j;
uint8_t c;
j= str_start[s];
while(j<str_start[s+1])
{c= str_pool[j++];
if(c=='%'||c<0x20||c>=0x7F)
{char str[4];
snprintf(str,4,"%%%02X",c);
HPUTX(3);
HPUT8(str[0]);HPUT8(str[1]);HPUT8(str[2]);
}
else
{HPUTX(1);
HPUT8(c);
}
}
HPUT8(0);
}
/*:1701*//*1712:*/
#line 32012 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hout_xdimen_node(pointer p)
{Xdimen x;
x.w= xdimen_width(p);
x.h= xdimen_hfactor(p)/(double)ONE;
x.v= xdimen_vfactor(p)/(double)ONE;
hput_xdimen_node(&x);
}

static bool hout_xdimen(pointer p)
{int n= hget_xdimen_no(p);
if(n>=0){HPUT8(n);return false;}
else
{hout_xdimen_node(p);return true;}
}

/*:1712*//*1714:*/
#line 32041 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static uint8_t hget_language_no(uint8_t n)
{int i;
for(i= 0;i<=max_ref[language_kind];i++)
if(hlanguage[i].n==n)return i;
i= ++max_ref[language_kind];
hlanguage[i].n= n;
hlanguage[i].s= 0;
return i;
}

static uint8_t hout_language(uint8_t n)
{n= hget_language_no(n);
if(n<7)return TAG(language_kind,n+1);
else
{HPUT8(n);return TAG(language_kind,0);}
}
/*:1714*//*1719:*/
#line 32132 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static uint8_t hout_glue_spec(pointer p)
{Glue g;
to_Glue(p,&g);
return hput_glue(&g);
}

static uint8_t hout_glue(pointer p)
{int n;
n= hget_glue_no(p);
if(n<0)
return hout_glue_spec(p);
else
{HPUT8(n);return TAG(glue_kind,0);}
}

static void hout_glue_node(pointer p)
{uint8_t*pos;
uint8_t tag;
HPUTNODE;
pos= hpos;
hpos++;
tag= hout_glue(p);
*pos= tag;DBGTAG(tag,pos);
DBGTAG(tag,hpos);HPUT8(tag);
}
/*:1719*//*1721:*/
#line 32182 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static uint8_t hout_disc(pointer p)
{Disc h;
h.x= !is_auto_disc(p);
h.r= replace_count(p);
if(h.x)h.r|= 0x80;
if(h.r!=0)HPUT8(h.r);
if(pre_break(p)==null&&post_break(p)==null)
h.p.s= h.q.s= 0;
else
{uint32_t lpos;
lpos= hpos-hstart;
h.p.t= TAG(list_kind,b001);
hout_list_node(pre_break(p),lpos,&(h.p));
if(post_break(p)==null)
h.q.s= 0;
else
{uint32_t lpos;
lpos= hpos-hstart;
h.q.t= TAG(list_kind,b001);
hout_list_node(post_break(p),lpos,&(h.q));
}
}
return hput_disc(&h);
}

/*:1721*//*1737:*/
#line 32467 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hout_preamble(pointer p)
{pointer q,r;
DBG(DBGBASIC,"Writing Preamble\n");
q= p;
if(q!=null)r= link(q);else r= null;
while(r!=null)
{if(type(r)==unset_node)
{link(q)= link(r);
link(r)= null;flush_node_list(r);
}
else
q= r;
r= link(q);
}
hout_list_node2(p);
DBG(DBGBASIC,"End Preamble\n");
}
/*:1737*//*1738:*/
#line 32490 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static void hout_item(pointer p,uint8_t t,uint8_t s)
{Info i= b000;
uint8_t n;
n= span_count(p)+1;
DBG(DBGBASIC,"Writing Item %d/%d->%d/%d\n",type(p),n,t,s);
if(n==0)QUIT("Span count of item must be positive");
if(n<7)i= n;else i= 7;
HPUTTAG(item_kind,i);
if(i==7)HPUT8(n);
type(p)= t;subtype(p)= s;
hout_node(p);
HPUTTAG(item_kind,i);
DBG(DBGBASIC,"End Item\n");
}


static void hout_item_list(pointer p,bool v)
{List l;
uint32_t pos;
DBG(DBGBASIC,"Writing Item List\n");
l.t= TAG(list_kind,b001);
HPUTTAG(item_kind,b000);
pos= hpos-hstart;
HPUTX(2);
HPUT8(0);
HPUT8(0);
l.p= hpos-hstart;
while(p> mem_min)
{if(is_char_node(p))hout_node(p);
else if(type(p)==unset_node)hout_item(p,v?vlist_node:hlist_node,0);
else if(type(p)==unset_set_node)hout_item(p,whatsit_node,v?vset_node:hset_node);
else if(type(p)==unset_pack_node)hout_item(p,whatsit_node,v?vpack_node:hpack_node);
else hout_node(p);
p= link(p);
}
l.s= (hpos-hstart)-l.p;
hput_tags(pos,hput_list(pos+1,&l));
HPUTTAG(item_kind,b000);
DBG(DBGBASIC,"End Item List\n");
}

static void hout_align_list(pointer p,bool v)
{List l;
uint32_t pos;
DBG(DBGBASIC,"Writing Align List\n");
l.t= TAG(list_kind,b001);
pos= hpos-hstart;
HPUTX(2);
HPUT8(0);
HPUT8(0);
l.p= pos+2;
while(p> mem_min)
{if(!is_char_node(p)&&(type(p)==unset_node||type(p)==unset_set_node||type(p)==unset_pack_node))
hout_item_list(list_ptr(p),v);
else
hout_node(p);
p= link(p);
}
l.s= (hpos-hstart)-l.p;
hput_tags(pos,hput_list(pos+1,&l));
DBG(DBGBASIC,"End Align List\n");
}

/*:1738*/
#line 28564 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*1573:*/
#line 28605 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer new_par_node(void)
{pointer p;
p= get_node(par_node_size);
type(p)= whatsit_node;
subtype(p)= par_node;
par_params(p)= par_list(p)= par_extent(p)= null;
depth(p)= 0;
return p;
}


static pointer new_disp_node(void)
{pointer p;
p= get_node(disp_node_size);
type(p)= whatsit_node;
subtype(p)= disp_node;
display_params(p)= display_formula(p)= display_eqno(p)= null;
return p;
}

static pointer new_baseline_node(pointer bs,pointer ls,scaled lsl)
{pointer p;
p= get_node(baseline_node_size);
type(p)= whatsit_node;
subtype(p)= baseline_node;
baseline_node_no(p)= hget_baseline_no(bs,ls,lsl);
return p;
}

static pointer new_pack_node(void)
{pointer p;
p= get_node(pack_node_size);
type(p)= whatsit_node;
subtype(p)= hpack_node;
width(p)= depth(p)= height(p)= shift_amount(p)= 0;
pack_limit(p)= max_dimen;
pack_extent(p)= list_ptr(p)= null;
return p;
}

static pointer new_set_node(void)
{pointer p;
p= get_node(set_node_size);
type(p)= whatsit_node;
subtype(p)= hset_node;
width(p)= depth(p)= height(p)= shift_amount(p)= set_stretch(p)= set_shrink(p)= 0;
set_extent(p)= list_ptr(p)= null;
return p;
}


/*:1573*//*1574:*/
#line 28661 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer new_image_node(str_number n,str_number a,str_number e)
{pointer p;
int i;
char*fn;

p= get_node(image_node_size);type(p)= whatsit_node;subtype(p)= image_node;
image_name(p)= n;
image_area(p)= a;
image_ext(p)= e;
fn= hfile_name(n,a,e);
i= hnew_file_section(fn);
image_no(p)= i;
image_xwidth(p)= image_xheight(p)= image_alt(p)= null;
image_aspect(p)= 0;
return p;
}

/*:1574*//*1575:*/
#line 28690 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void new_param_node(uint8_t t,uint8_t n,int v)
{pointer p;
/*1576:*/
#line 28699 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= get_node(param_node_size);
type(p)= whatsit_node;
subtype(p)= param_node;
param_type(p)= t;
param_no(p)= n;

/*:1576*/
#line 28693 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1577:*/
#line 28706 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(t==int_type)param_value(p).i= v;
else if(t==dimen_type)param_value(p).sc= v;
else if(t==glue_type)
{param_value(p).i= v;add_glue_ref(param_value(p).i);}
else
{free_node(p,param_node_size);
QUIT("Undefined parameter type %d",t);
}

/*:1577*/
#line 28694 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link(p)= link(temp_head);
link(temp_head)= p;
}

/*:1575*//*1578:*/
#line 28746 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hline_break(int final_widow_penalty)
{bool auto_breaking;
pointer r,s;
pointer pp;
scaled par_max_depth= 0;
bool par_shape_fix= false;
/*1596:*/
#line 29298 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_tos= null;
link_tos= null;

/*:1596*/
#line 28753 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef DEBUG
if(DBGTEX&debugflags)
{print_ln();print("Before hline_break:\n");
breadth_max= 200;
depth_threshold= 200;
show_node_list(link(head));print_ln();
}
#endif
#line 28762 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 if(dimen_par_hfactor(hsize_code)==0&&dimen_par_vfactor(hsize_code)==0)
{line_break(final_widow_penalty);
return;
}

pp= new_par_node();
par_penalty(pp)= final_widow_penalty;
if(par_shape_ptr==null)
par_extent(pp)= new_xdimen(dimen_par(hsize_code),
dimen_par_hfactor(hsize_code),dimen_par_vfactor(hsize_code));
else
/*1579:*/
#line 28921 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{last_special_line= info(par_shape_ptr)-1;
if(last_special_line!=0)
DBG(DBGTEX,"Warning parshape with n=%d not yet implemented",info(par_shape_ptr));
second_width= mem[par_shape_ptr+2*(last_special_line+1)].sc;
second_indent= mem[par_shape_ptr+2*last_special_line+1].sc;

par_extent(pp)= new_xdimen(second_indent+second_width,
par_shape_hfactor,par_shape_vfactor);
second_width= second_width+round((double)par_shape_hfactor*hhsize/unity
+(double)par_shape_vfactor*hvsize/unity);
par_shape_fix= true;
}

/*:1579*/
#line 28773 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link(temp_head)= link(head);
if(is_char_node(tail))
{tail_append(new_penalty(inf_penalty))
tail_append(new_param_glue(par_fill_skip_code));
}
else if(type(tail)!=whatsit_node||subtype(tail)!=disp_node)
{if(type(tail)!=glue_node)tail_append(new_penalty(inf_penalty))
else
{type(tail)= penalty_node;delete_glue_ref(glue_ptr(tail));
flush_node_list(leader_ptr(tail));penalty(tail)= inf_penalty;
}
link(tail)= new_param_glue(par_fill_skip_code);
}
DBG(DBGTEX,"\nCalling line_break:\n"
"hang_indent=0x%08X hang_after=%d",hang_indent,hang_after);
if(line_skip_limit!=0)
DBG(DBGTEX," line_skip_limit=0x%08X",line_skip_limit);
DBG(DBGTEX," prev_graf=0x%08X",prev_graf);

init_cur_lang= prev_graf%0200000;
init_l_hyf= prev_graf/020000000;
init_r_hyf= (prev_graf/0200000)%0100;
pop_nest();
DBG(DBGTEX," prev_graf=0x%08X",prev_graf);


#ifdef INIT
if(trie_not_ready)init_trie();
#endif
#line 28803 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 cur_lang= init_cur_lang;l_hyf= init_l_hyf;r_hyf= init_r_hyf;
if(DBGTEX&debugflags)
{print_ln();print("Before hyphenation:\n");
breadth_max= 200;
depth_threshold= 200;
show_node_list(link(temp_head));print_ln();
}
auto_breaking= true;
if(option_hyphen_first&&is_char_node(link(temp_head)))
{pointer p= new_glue(zero_glue);
link(p)= link(temp_head);
link(temp_head)= p;
}
cur_p= link(temp_head);
while(cur_p!=null)
{
if(is_char_node(cur_p))
{
do{int f= font(cur_p);
scaled d= char_depth(f,character(cur_p));
if(d> par_max_depth)par_max_depth= d;
cur_p= link(cur_p);
}while(is_char_node(cur_p));
if(cur_p==null)goto done5;
}
switch(type(cur_p))
{case whatsit_node:
{pointer p= cur_p;
switch(subtype(cur_p))
{/*1601:*/
#line 29349 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case color_node:
/*1597:*/
#line 29302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_link(p)= color_tos;
color_tos= p;

/*:1597*/
#line 29351 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case end_color_node:
/*1598:*/
#line 29306 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(color_tos==link_tos)
subtype(p)= no_color_node;
else if(color_tos!=null)
{color_tos= color_link(color_tos);
subtype(p)= color_node;
if(color_tos!=null)
color_ref(p)= color_ref(color_tos);
else
color_ref(p)= 0xFF;
}
else
subtype(p)= no_color_node;

/*:1598*/
#line 29353 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case start_link_node:
/*1599:*/
#line 29324 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(link_tos!=null)
{begin_diagnostic();
print_err("This link is preceded by a \\HINTlink without \\HINTendlink:");
end_diagnostic(true);
}
/*1597:*/
#line 29302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_link(p)= color_tos;
color_tos= p;

/*:1597*/
#line 29330 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link_tos= color_tos;

/*:1599*/
#line 29355 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case end_link_node:
/*1600:*/
#line 29333 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(link_tos==null)
{begin_diagnostic();
print_err("\\HINTendlink without matching \\HINTlink:");
end_diagnostic(true);
}
else
{color_tos= color_link(link_tos);
link_tos= null;
if(color_tos!=null)
color_ref(p)= color_ref(color_tos);
else
color_ref(p)= 0xFF;
}

/*:1600*/
#line 29357 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case no_color_node:break;

/*:1601*/
#line 28832 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:adv_past(cur_p);break;
}
break;
}
case glue_node:
if(auto_breaking)
hyphenate_word();
break;
case ligature_node:
break;
case disc_node:

r= replace_count(cur_p);s= link(cur_p);
while(r> 0)
{decr(r);s= link(s);
}
cur_p= s;
goto done5;
case math_node:
auto_breaking= (subtype(cur_p)==after);
break;
case hlist_node:case vlist_node:
if(depth(cur_p)> par_max_depth)par_max_depth= depth(cur_p);
break;
default:
break;
}
cur_p= link(cur_p);
done5:;
}
if(DBGTEX&debugflags)
{print_ln();print("After hline_break:\n");
breadth_max= 200;
depth_threshold= 200;
show_node_list(link(temp_head));print_ln();
}
depth(pp)= par_max_depth;
par_list(pp)= link(temp_head);

link(temp_head)= null;

new_param_node(int_type,pretolerance_code,pretolerance);
new_param_node(int_type,tolerance_code,tolerance);
new_param_node(dimen_type,emergency_stretch_code,emergency_stretch);

new_param_node(int_type,line_penalty_code,line_penalty);
new_param_node(int_type,hyphen_penalty_code,hyphen_penalty);
new_param_node(int_type,ex_hyphen_penalty_code,ex_hyphen_penalty);
new_param_node(int_type,club_penalty_code,club_penalty);
new_param_node(int_type,widow_penalty_code,widow_penalty);
new_param_node(int_type,broken_penalty_code,broken_penalty);
new_param_node(int_type,inter_line_penalty_code,inter_line_penalty);
new_param_node(int_type,double_hyphen_demerits_code,double_hyphen_demerits);
new_param_node(int_type,final_hyphen_demerits_code,final_hyphen_demerits);
new_param_node(int_type,adj_demerits_code,adj_demerits);
new_param_node(int_type,looseness_code,looseness);

if(par_shape_fix)
{new_param_node(int_type,hang_after_code,0);
new_param_node(dimen_type,hang_indent_code,second_indent);
}
else
{new_param_node(int_type,hang_after_code,hang_after);
new_param_node(dimen_type,hang_indent_code,hang_indent);
}

new_param_node(dimen_type,line_skip_limit_code,line_skip_limit);
new_param_node(glue_type,line_skip_code,line_skip);
new_param_node(glue_type,baseline_skip_code,baseline_skip);

new_param_node(glue_type,left_skip_code,left_skip);
new_param_node(glue_type,right_skip_code,right_skip);
new_param_node(glue_type,par_fill_skip_code,par_fill_skip);



par_params(pp)= link(temp_head);
link(temp_head)= null;
append_to_vlist(pp);
}

/*:1578*//*1615:*/
#line 29671 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hfinish_outline_group(void)
{pointer s= link(head);
unsave();
pop_nest();
outline_ptr(tail)= s;
}
/*:1615*//*1616:*/
#line 29681 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void build_page(void)
{/*1602:*/
#line 29382 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#define MAX_COLOR_STACK 256  
#define COLOR_STACK_MASK (MAX_COLOR_STACK-1)
static uint8_t color_stack[MAX_COLOR_STACK];
static int color_sp= 0,color_stack_depth= 0;
static bool possible_break= true;


/*:1602*/
#line 29683 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(link(contrib_head)==null||output_active)return;
do
{pointer p= link(contrib_head);
pointer q= null;
pointer*t= NULL;
bool eject= (type(p)==penalty_node&&penalty(p)<=eject_penalty);
int page_penalty= 0;
if(eject)page_penalty= penalty(p);
/*1629:*/
#line 30056 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(type(p)==mark_node)
{if(bot_mark!=null)delete_token_ref(bot_mark);
bot_mark= mark_ptr(p);add_token_ref(bot_mark);
}



/*:1629*/
#line 29692 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1605:*/
#line 29424 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(type(p)==whatsit_node)
{if(subtype(p)==color_node)
{color_stack_depth++;
color_sp= (color_sp+1)&COLOR_STACK_MASK;
if(color_stack_depth>=MAX_COLOR_STACK)
{static bool stackoverflow_printed= false;
if(!stackoverflow_printed)
{print_err("Overflow of top level color stack");
stackoverflow_printed= true;
}
}
color_stack[color_sp]= color_ref(p);
}
else if(subtype(p)==end_color_node)
{if(color_stack_depth> 0)
{color_stack_depth--;
color_sp= (color_sp-1)&COLOR_STACK_MASK;
subtype(p)= color_node;
color_ref(p)= color_stack[color_sp];
}
}
}
if(/*1603:*/
#line 29392 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

(type(p)==penalty_node||
type(p)==glue_node||
(type(p)==whatsit_node&&subtype(p)==baseline_node))

/*:1603*/
#line 29447 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
)possible_break= true;


/*:1605*/
#line 29693 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1618:*/
#line 29777 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(option_no_empty_page&&
((eject&&penalty(p)> 2*(eject_penalty))||
(page_contents==empty&&!is_visible(p))))
{pointer r,prev_r= p;
while(true)
{r= link(prev_r);
if(r==null)return;
else if(is_visible(r))break;
else if(type(r)==penalty_node&&penalty(r)<=eject_penalty)
{q= p;
link(prev_r)= null;
link(contrib_head)= r;
DBG(DBGPAGE,"Eliminating empty page preceding penalty %d\n",penalty(r));
geq_word_define(int_base+output_penalty_code,penalty(r));
goto empty_output;
}
prev_r= r;
}
}

/*:1618*/
#line 29694 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link(contrib_head)= link(p);link(p)= null;
if(link(contrib_head)==null)
{/*927:*/
#line 18872 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(nest_ptr==0)tail= contrib_head;
else contrib_tail= contrib_head

/*:927*/
#line 29697 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
update_last_values(p);
/*1617:*/
#line 29725 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(page_contents<box_there)
{switch(type(p))
{case whatsit_node:
if(subtype(p)==baseline_node)goto recycle_p;
else if(subtype(p)!=hset_node&&subtype(p)!=vset_node&&
subtype(p)!=hpack_node&&subtype(p)!=vpack_node&&
subtype(p)!=par_node&&subtype(p)!=disp_node&&
subtype(p)!=image_node&&subtype(p)!=align_node)
break;
case hlist_node:case vlist_node:case rule_node:
if(page_contents==empty)
{hint_open();
freeze_page_specs(box_there);
hfix_defaults();
}
else page_contents= box_there;
break;
case ins_node:
if(page_contents==empty)
{hint_open();
freeze_page_specs(inserts_only);
hfix_defaults();
}
break;
case kern_node:
case penalty_node:
case glue_node:goto recycle_p;
default:
break;
}
}
/*:1617*/
#line 29700 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

page_goal= 0x3fffffff;
t= collect_output(&p,&q);
if(p!=null)
{hpos0= hpos;hout_node(p);
/*1604:*/
#line 29401 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(non_discardable(p))
{if(color_stack_depth> 0&&possible_break)
{if(!(type(p)==whatsit_node&&
(subtype(p)==color_node||subtype(p)==end_color_node)))
hout_color_ref(color_stack[color_sp]);
}
possible_break= false;
}


/*:1604*/
#line 29705 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
recycle_p:
flush_node_list(p);
if(q!=null||(eject&&page_contents>=box_there))
{
geq_word_define(int_base+output_penalty_code,page_penalty);
empty_output:
/*1626:*/
#line 29975 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{pointer r= new_null_box();type(r)= vlist_node;
subtype(r)= 0;shift_amount(r)= 0;height(r)= hvsize;
if(t==NULL)list_ptr(r)= null;
else{list_ptr(r)= q;*t= new_glue(fill_glue);}
flush_node_list(box(255));
box(255)= r;
if(output_routine!=null)
{output_active= true;
if(bot_mark!=null)
{if(top_mark!=null)delete_token_ref(top_mark);
top_mark= bot_mark;add_token_ref(top_mark);
if(first_mark!=null)delete_token_ref(first_mark);
first_mark= bot_mark;add_token_ref(first_mark);
}
DBG(DBGPAGE,"Starting the output routine (output penalty=%d)\n",output_penalty);
push_nest();mode= -vmode;prev_depth= ignore_depth;mode_line= -line;
begin_token_list(output_routine,output_text);
new_save_level(output_group);normal_paragraph();
scan_left_brace();
return;
}
else
{
ship_out(box(255));box(255)= null;
}
}

/*:1626*/
#line 29713 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
}while(link(contrib_head)!=null);
DBG(DBGBUFFER,"after build page dyn_used= %d\n",dyn_used);
}
/*:1616*//*1627:*/
#line 30008 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void execute_output(pointer p)
{while(p!=null)
{/*1628:*/
#line 30015 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(!is_char_node(p))
switch(type(p))
{case whatsit_node:
switch(subtype(p))
{case open_node:case write_node:case close_node:
case special_node:case latespecial_node:
out_what(p);
break;
case par_node:execute_output(par_list(p));
break;
case disp_node:
if(display_left(p))execute_output(display_eqno(p));
execute_output(display_formula(p));
if(!display_left(p))execute_output(display_eqno(p));
break;
case hset_node:case vset_node:case hpack_node:case vpack_node:
execute_output(list_ptr(p));
break;
case align_node:
execute_output(align_list(p));
break;
default:break;
}
break;
case hlist_node:case vlist_node:
execute_output(list_ptr(p));
break;
case ins_node:
execute_output(ins_ptr(p));
break;
case adjust_node:
execute_output(adjust_ptr(p));
break;
default:break;
}
/*:1628*/
#line 30011 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

p= link(p);
}
}
/*:1627*//*1630:*/
#line 30072 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer hpack(pointer p,scaled w,scaled hf,scaled vf,small_number m,bool keep_cs)
{
pointer r;
pointer q;
scaled h,d,x;
scaled s;
pointer g;
glue_ord o,sto,sho;
internal_font_number f;
bool repack= false;
if(!keep_cs){/*1596:*/
#line 29298 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_tos= null;
link_tos= null;

/*:1596*/
#line 30083 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
}
last_badness= 0;r= get_node(box_node_size);type(r)= hlist_node;
subtype(r)= min_quarterword;shift_amount(r)= 0;
q= r+list_offset;link(q)= p;
h= 0;/*593:*/
#line 12326 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

d= 0;x= 0;
total_stretch[normal]= 0;total_shrink[normal]= 0;
total_stretch[fil]= 0;total_shrink[fil]= 0;
total_stretch[fill]= 0;total_shrink[fill]= 0;
total_stretch[filll]= 0;total_shrink[filll]= 0


/*:593*/
#line 30087 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
while(p!=null){
reswitch:
while(is_char_node(p))
/*596:*/
#line 12355 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{f= font(p);
if(IS_X_FONT(f))
{hb_codepoint_t glyph;
if(x_glyph(f,character(p),&glyph))
{scaled ph,pd;
x+= x_glyph_width(f,glyph);
x_glyph_height_depth(f,glyph,&ph,&pd);
if(ph> h)h= ph;
if(pd> d)d= pd;
}
}
else
{x= x+char_width(f,character(p));
s= char_height(f,character(p));if(s> h)h= s;
s= char_depth(f,character(p));if(s> d)d= s;
}
p= link(p);
}

/*:596*/
#line 30092 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
if(p!=null)
{switch(type(p)){
case hlist_node:case vlist_node:case rule_node:case unset_node:case unset_set_node:case unset_pack_node:
/*595:*/
#line 12343 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{x= x+width(p);
if(type(p)>=rule_node)s= 0;else s= shift_amount(p);
if(height(p)-s> h)h= height(p)-s;
if(depth(p)+s> d)d= depth(p)+s;
}

/*:595*/
#line 30096 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case ins_node:case mark_node:case adjust_node:if(adjust_tail!=null)
/*597:*/
#line 12382 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{while(link(q)!=p)q= link(q);
if(type(p)==adjust_node)
{link(adjust_tail)= adjust_ptr(p);
while(link(adjust_tail)!=null)adjust_tail= link(adjust_tail);
p= link(p);free_node(link(q),small_node_size);
}
else{link(adjust_tail)= p;adjust_tail= p;p= link(p);
}
link(q)= p;p= q;
}

/*:597*/
#line 30098 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case glue_node:/*598:*/
#line 12394 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{g= glue_ptr(p);x= x+width(g);
o= stretch_order(g);total_stretch[o]= total_stretch[o]+stretch(g);
o= shrink_order(g);total_shrink[o]= total_shrink[o]+shrink(g);
if(subtype(p)>=a_leaders)
{g= leader_ptr(p);
if(height(g)> h)h= height(g);
if(depth(g)> d)d= depth(g);
}
}

/*:598*/
#line 30099 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case kern_node:case math_node:x= x+width(p);break;
case ligature_node:/*594:*/
#line 12334 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{mem[lig_trick]= mem[lig_char(p)];link(lig_trick)= link(p);
p= lig_trick;goto reswitch;
}

/*:594*/
#line 30101 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case whatsit_node:/*1631:*/
#line 30193 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

switch(subtype(p))
{case par_node:if(depth(p)> d)d= depth(p);break;
case disp_node:break;
case vpack_node:
case hpack_node:
case hset_node:
case vset_node:
/*595:*/
#line 12343 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{x= x+width(p);
if(type(p)>=rule_node)s= 0;else s= shift_amount(p);
if(height(p)-s> h)h= height(p)-s;
if(depth(p)+s> d)d= depth(p)+s;
}

/*:595*/
#line 30201 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

repack= true;break;
case stream_node:repack= true;break;
case image_node:
if(image_xheight(p)!=null)
{pointer r= image_xheight(p);
if(xdimen_hfactor(r)==0&&xdimen_vfactor(r)==0)
{if(xdimen_width(r)> h)h= xdimen_width(r);}
else{repack= true;break;}
}
if(image_xwidth(p)!=null)
{pointer r= image_xwidth(p);
if(xdimen_hfactor(r)==0&&xdimen_vfactor(r)==0)
x= x+xdimen_width(r);
else{repack= true;break;}
}
break;
/*1601:*/
#line 29349 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case color_node:
/*1597:*/
#line 29302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_link(p)= color_tos;
color_tos= p;

/*:1597*/
#line 29351 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case end_color_node:
/*1598:*/
#line 29306 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(color_tos==link_tos)
subtype(p)= no_color_node;
else if(color_tos!=null)
{color_tos= color_link(color_tos);
subtype(p)= color_node;
if(color_tos!=null)
color_ref(p)= color_ref(color_tos);
else
color_ref(p)= 0xFF;
}
else
subtype(p)= no_color_node;

/*:1598*/
#line 29353 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case start_link_node:
/*1599:*/
#line 29324 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(link_tos!=null)
{begin_diagnostic();
print_err("This link is preceded by a \\HINTlink without \\HINTendlink:");
end_diagnostic(true);
}
/*1597:*/
#line 29302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_link(p)= color_tos;
color_tos= p;

/*:1597*/
#line 29330 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link_tos= color_tos;

/*:1599*/
#line 29355 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case end_link_node:
/*1600:*/
#line 29333 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(link_tos==null)
{begin_diagnostic();
print_err("\\HINTendlink without matching \\HINTlink:");
end_diagnostic(true);
}
else
{color_tos= color_link(link_tos);
link_tos= null;
if(color_tos!=null)
color_ref(p)= color_ref(color_tos);
else
color_ref(p)= 0xFF;
}

/*:1600*/
#line 29357 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case no_color_node:break;

/*:1601*/
#line 30218 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:break;
}

/*:1631*/
#line 30102 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
default:do_nothing;
}
if(link(p)==null&&keep_cs&&link_tos!=null)
{pointer r;
r= get_node(link_node_size);
type(r)= whatsit_node;subtype(r)= end_link_node;
if(color_link(color_tos)!=null)
color_ref(r)= color_ref(color_link(color_tos));
else
color_ref(r)= 0xFF;
link(r)= null;link(p)= r;p= r;
}
p= link(p);
}
}

if(adjust_tail!=null)link(adjust_tail)= null;
height(r)= h;depth(r)= d;
if(repack)
{q= new_pack_node();
height(q)= h;
depth(q)= d;
width(q)= x;
subtype(q)= hpack_node;
list_ptr(q)= list_ptr(r);
list_ptr(r)= null;
free_node(r,box_node_size);
pack_limit(q)= max_dimen;
pack_m(q)= m;
pack_extent(q)= new_xdimen(w,hf,vf);
return q;
}
else if(hf!=0||vf!=0)
{if(total_stretch[filll]!=0)sto= filll;
else if(total_stretch[fill]!=0)sto= fill;
else if(total_stretch[fil]!=0)sto= fil;
else sto= normal;

if(total_shrink[filll]!=0)sho= filll;
else if(total_shrink[fill]!=0)sho= fill;
else if(total_shrink[fil]!=0)sho= fil;
else sho= normal;
q= new_set_node();
subtype(q)= hset_node;
height(q)= h;
depth(q)= d;
width(q)= x;
shift_amount(q)= shift_amount(r);
list_ptr(q)= list_ptr(r);
list_ptr(r)= null;
free_node(r,box_node_size);
if(m==exactly)
set_extent(q)= new_xdimen(w,hf,vf);
else
set_extent(q)= new_xdimen(x+w,hf,vf);
set_stretch_order(q)= sto;
set_shrink_order(q)= sho;
set_stretch(q)= total_stretch[sto];
set_shrink(q)= total_shrink[sho];
return q;
}

/*599:*/
#line 12408 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(m==additional)w= x+w;
width(r)= w;x= w-x;
if(x==0)
{glue_sign(r)= normal;glue_order(r)= normal;
set_glue_ratio_zero(glue_set(r));
goto end;
}
else if(x> 0)/*600:*/
#line 12421 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{/*601:*/
#line 12435 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(total_stretch[filll]!=0)o= filll;
else if(total_stretch[fill]!=0)o= fill;
else if(total_stretch[fil]!=0)o= fil;
else o= normal

/*:601*/
#line 12422 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
glue_order(r)= o;glue_sign(r)= stretching;
if(total_stretch[o]!=0)glue_set(r)= fix(x/(double)total_stretch[o]);

else{glue_sign(r)= normal;
set_glue_ratio_zero(glue_set(r));
}
if(o==normal)if(list_ptr(r)!=null)
/*602:*/
#line 12441 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{last_badness= badness(x,total_stretch[normal]);
if(last_badness> hbadness)
{print_ln();
if(last_badness> 100)print_nl("Underfull");else print_nl("Loose");
print(" \\hbox (badness ");print_int(last_badness);


goto common_ending;
}
}

/*:602*/
#line 12431 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto end;
}

/*:600*/
#line 12417 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else/*605:*/
#line 12465 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{/*606:*/
#line 12485 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(total_shrink[filll]!=0)o= filll;
else if(total_shrink[fill]!=0)o= fill;
else if(total_shrink[fil]!=0)o= fil;
else o= normal

/*:606*/
#line 12466 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
glue_order(r)= o;glue_sign(r)= shrinking;
if(total_shrink[o]!=0)glue_set(r)= fix((-x)/(double)total_shrink[o]);

else{glue_sign(r)= normal;
set_glue_ratio_zero(glue_set(r));
}
if((total_shrink[o]<-x)&&(o==normal)&&(list_ptr(r)!=null))
{last_badness= 1000000;
set_glue_ratio_one(glue_set(r));
/*607:*/
#line 12491 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((-x-total_shrink[normal]> hfuzz)||(hbadness<100))
{if((overfull_rule> 0)&&(-x-total_shrink[normal]> hfuzz))
{while(link(q)!=null)q= link(q);
link(q)= new_rule();
width(link(q))= overfull_rule;
}
print_ln();print_nl("Overfull \\hbox (");

print_scaled(-x-total_shrink[normal]);print("pt too wide");
goto common_ending;
}

/*:607*/
#line 12477 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
else if(o==normal)if(list_ptr(r)!=null)
/*608:*/
#line 12504 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{last_badness= badness(-x,total_shrink[normal]);
if(last_badness> hbadness)
{print_ln();print_nl("Tight \\hbox (badness ");print_int(last_badness);

goto common_ending;
}
}

/*:608*/
#line 12481 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
goto end;
}

/*:605*/
#line 12419 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:599*/
#line 30166 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
common_ending:
if(pack_begin_line!=0)
{if(pack_begin_line> 0)print(") in paragraph at lines ");
else print(") in alignment at lines ");
print_int(abs(pack_begin_line));
print("--");
}
else print(") detected at line ");
print_int(line);
print_ln();
font_in_short_display= null_font;short_display(list_ptr(r));print_ln();
begin_diagnostic();show_box(r);end_diagnostic(true);
end:return r;
}

/*:1630*//*1632:*/
#line 30222 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer vpackage(pointer p,scaled h,scaled hf,scaled vf,small_number m,bool keep_cs,scaled l)
{pointer r;
scaled w,d,x;
scaled s= 0;
pointer g;
glue_ord sho,sto;
if(!keep_cs){/*1596:*/
#line 29298 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_tos= null;
link_tos= null;

/*:1596*/
#line 30229 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
}
last_badness= 0;r= get_node(box_node_size);type(r)= vlist_node;
subtype(r)= min_quarterword;shift_amount(r)= 0;
list_ptr(r)= p;
w= 0;
d= 0;x= 0;
total_stretch[normal]= 0;total_shrink[normal]= 0;
total_stretch[fil]= 0;total_shrink[fil]= 0;
total_stretch[fill]= 0;total_shrink[fill]= 0;
total_stretch[filll]= 0;total_shrink[filll]= 0;
while(p!=null)
{if(is_char_node(p))
confusion("vpack");
else
switch(type(p))
{case hlist_node:case vlist_node:case rule_node:case unset_node:
x= x+d+height(p);d= depth(p);
if(type(p)>=rule_node)s= 0;
else s= shift_amount(p);
if(width(p)+s> w)w= width(p)+s;
break;
case unset_set_node:case unset_pack_node:
goto repack;
case whatsit_node:
switch(subtype(p))
{case par_node:
if(depth(p)> d)d= depth(p);
goto repack;
case disp_node:
case vpack_node:
case hpack_node:
case hset_node:
case vset_node:
case stream_node:
goto repack;
case image_node:
if(image_xwidth(p)!=null)
{pointer r= image_xwidth(p);
if(xdimen_hfactor(r)==0&&xdimen_vfactor(r)==0)
{if(xdimen_width(r)> w)w= xdimen_width(r);}
else goto repack;
}
if(image_xheight(p)!=null)
{pointer r= image_xheight(p);
if(xdimen_hfactor(r)==0&&xdimen_vfactor(r)==0)
{x= x+d+xdimen_width(r);d= 0;}
else goto repack;
}
break;
/*1601:*/
#line 29349 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case color_node:
/*1597:*/
#line 29302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_link(p)= color_tos;
color_tos= p;

/*:1597*/
#line 29351 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case end_color_node:
/*1598:*/
#line 29306 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(color_tos==link_tos)
subtype(p)= no_color_node;
else if(color_tos!=null)
{color_tos= color_link(color_tos);
subtype(p)= color_node;
if(color_tos!=null)
color_ref(p)= color_ref(color_tos);
else
color_ref(p)= 0xFF;
}
else
subtype(p)= no_color_node;

/*:1598*/
#line 29353 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case start_link_node:
/*1599:*/
#line 29324 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(link_tos!=null)
{begin_diagnostic();
print_err("This link is preceded by a \\HINTlink without \\HINTendlink:");
end_diagnostic(true);
}
/*1597:*/
#line 29302 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

color_link(p)= color_tos;
color_tos= p;

/*:1597*/
#line 29330 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

link_tos= color_tos;

/*:1599*/
#line 29355 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case end_link_node:
/*1600:*/
#line 29333 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(link_tos==null)
{begin_diagnostic();
print_err("\\HINTendlink without matching \\HINTlink:");
end_diagnostic(true);
}
else
{color_tos= color_link(link_tos);
link_tos= null;
if(color_tos!=null)
color_ref(p)= color_ref(color_tos);
else
color_ref(p)= 0xFF;
}

/*:1600*/
#line 29357 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
break;
case no_color_node:break;

/*:1601*/
#line 30278 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
break;
case glue_node:
{glue_ord o;
x= x+d;d= 0;
g= glue_ptr(p);x= x+width(g);
o= stretch_order(g);total_stretch[o]= total_stretch[o]+stretch(g);
o= shrink_order(g);total_shrink[o]= total_shrink[o]+shrink(g);
if(subtype(p)>=a_leaders)
{g= leader_ptr(p);
if(width(g)> w)w= width(g);
}
}
break;
case kern_node:
x= x+d+width(p);d= 0;
break;
default:do_nothing;
}
p= link(p);
}
width(r)= w;


if(total_stretch[filll]!=0)sto= filll;
else if(total_stretch[fill]!=0)sto= fill;
else if(total_stretch[fil]!=0)sto= fil;
else sto= normal;

if(total_shrink[filll]!=0)sho= filll;
else if(total_shrink[fill]!=0)sho= fill;
else if(total_shrink[fil]!=0)sho= fil;
else sho= normal;

if(hf!=0||vf!=0)
{pointer q;
q= new_set_node();
subtype(q)= vset_node;
width(q)= w;
if(d> l)
{x= x+d-l;depth(r)= l;
}
else depth(r)= d;
height(q)= x;
depth(q)= d;
shift_amount(q)= shift_amount(r);
list_ptr(q)= list_ptr(r);
list_ptr(r)= null;
free_node(r,box_node_size);
if(m==exactly)
set_extent(q)= new_xdimen(h,hf,vf);
else
set_extent(q)= new_xdimen(x+h,hf,vf);
set_stretch_order(q)= sto;
set_shrink_order(q)= sho;
set_stretch(q)= total_stretch[sto];
set_shrink(q)= total_shrink[sho];
return q;
}

if(d> l)
{x= x+d-l;depth(r)= l;
}
else depth(r)= d;
if(m==additional)
h= x+h;
height(r)= h;x= h-x;
if(x==0)
{glue_sign(r)= normal;glue_order(r)= normal;
set_glue_ratio_zero(glue_set(r));
goto end;
}
else if(x> 0)
{glue_order(r)= sto;glue_sign(r)= stretching;
if(total_stretch[sto]!=0)glue_set(r)= fix(x/(double)total_stretch[sto]);
else
{glue_sign(r)= normal;
set_glue_ratio_zero(glue_set(r));
}
if(sto==normal)
{if(list_ptr(r)!=null)
{last_badness= badness(x,total_stretch[normal]);
if(last_badness> vbadness)
{print_ln();
if(last_badness> 100)print_nl("Underfull");else print_nl("Loose");
print(" \\vbox (badness ");print_int(last_badness);
goto common_ending;
}
}
}
goto end;
}
else
{
glue_order(r)= sho;glue_sign(r)= shrinking;
if(total_shrink[sho]!=0)glue_set(r)= fix((-x)/(double)total_shrink[sho]);
else
{glue_sign(r)= normal;
set_glue_ratio_zero(glue_set(r));
}
if((total_shrink[sho]<-x)&&(sho==normal)&&(list_ptr(r)!=null))
{last_badness= 1000000;
set_glue_ratio_one(glue_set(r));
if((-x-total_shrink[normal]> vfuzz)||(vbadness<100))
{print_ln();print_nl("Overfull \\vbox (");
print_scaled(-x-total_shrink[normal]);print("pt too high");
goto common_ending;
}
}
else if(sho==normal)
{if(list_ptr(r)!=null)
{last_badness= badness(-x,total_shrink[normal]);
if(last_badness> vbadness)
{print_ln();print_nl("Tight \\vbox (badness ");print_int(last_badness);
goto common_ending;
}
}
}
goto end;
}


common_ending:
if(pack_begin_line!=0)
{print(") in alignment at lines ");
print_int(abs(pack_begin_line));
print("--");
}
else
print(") detected at line ");
print_int(line);
print_ln();

begin_diagnostic();show_box(r);end_diagnostic(true);
end:
return r;


repack:
{
pointer q;
q= new_pack_node();
subtype(q)= vpack_node;
height(q)= x;
depth(q)= d;
width(q)= w;
list_ptr(q)= list_ptr(r);
list_ptr(r)= null;
free_node(r,box_node_size);
pack_limit(q)= l;
pack_m(q)= m;
pack_extent(q)= new_xdimen(h,hf,vf);
return q;
}
}

/*:1632*//*1634:*/
#line 30457 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hget_stream_no(int i)
{static bool init= false;
int s;
if(i==0)return 0;
s= insert2stream[i];
if(s!=0)return s;
if(!init)
{pointer t,s;
for(t= link(setpage_head);t!=null;t= link(t))
for(s= setpage_streams(t);s!=null;s= link(s))
insert2stream[setstream_insertion(s)]= setstream_number(s);
max_ref[stream_kind]= max_stream;
init= true;
}
s= insert2stream[i];
if(s==0)
s= insert2stream[i]= max_ref[stream_kind]= ++max_stream;
return s;
}
/*:1634*//*1635:*/
#line 30516 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer new_setstream_node(uint8_t n)
{pointer p= get_node(setstream_node_size);
type(p)= whatsit_node;subtype(p)= setstream_node;
setstream_insertion(p)= n;
setstream_number(p)= hget_stream_no(n);
setstream_mag(p)= 1000;
setstream_preferred(p)= 255;
setstream_next(p)= 255;
setstream_ratio(p)= 0;
setstream_max(p)= new_xdimen(0,0,ONE);
setstream_width(p)= new_xdimen(0,ONE,0);
setstream_topskip(p)= zero_glue;add_glue_ref(zero_glue);
setstream_height(p)= zero_glue;add_glue_ref(zero_glue);
setstream_before(p)= null;
setstream_after(p)= null;

return p;
}
/*:1635*//*1636:*/
#line 30548 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hfinish_stream_group(void)
{pointer s;
end_graf();
s= hget_current_stream();
if(s!=null)
{pointer t;
uint8_t i;
i= setstream_insertion(s);
setstream_mag(s)= count(i);
setstream_width(s)= new_xdimen(dimen_par(hsize_code),
dimen_par_hfactor(hsize_code),dimen_par_vfactor(hsize_code));
t= zero_glue;add_glue_ref(t);delete_glue_ref(setstream_topskip(s));setstream_topskip(s)= t;
t= skip(i);add_glue_ref(t);delete_glue_ref(setstream_height(s));setstream_height(s)= t;
setstream_max(s)= new_xdimen(dimen(i),
dimen_hfactor(i),dimen_vfactor(i));
}
unsave();
flush_node_list(link(head));
pop_nest();
}
/*:1636*//*1637:*/
#line 30574 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hfinish_stream_before_group(void)
{pointer s;
end_graf();
s= hget_current_stream();
if(s!=null)
setstream_before(s)= link(head);
unsave();
pop_nest();
}

static void hfinish_stream_after_group(void)
{pointer s;
end_graf();
s= hget_current_stream();
if(s!=null)
setstream_after(s)= link(head);
unsave();
pop_nest();
}
/*:1637*//*1639:*/
#line 30648 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer new_setpage_node(uint8_t i,str_number n)
{pointer p,prev_p;
prev_p= setpage_head;
for(p= link(prev_p);p!=null;prev_p= p,p= link(p))
if(setpage_id(p)==i)break;
if(p==null)
/*1640:*/
#line 30663 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{p= get_node(setpage_node_size);type(p)= whatsit_node;subtype(p)= setpage_node;
setpage_number(p)= max_ref[page_kind]= ++max_page;
setpage_id(p)= i;
setpage_name(p)= n;
setpage_priority(p)= 1;
setpage_topskip(p)= zero_glue;add_glue_ref(zero_glue);
setpage_height(p)= new_xdimen(0,0,ONE);
setpage_width(p)= new_xdimen(0,ONE,0);
setpage_depth(p)= max_depth;
setpage_list(p)= null;
setpage_streams(p)= null;
}
/*:1640*/
#line 30655 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else
link(prev_p)= link(p);
link(p)= link(setpage_head);
link(setpage_head)= p;
return p;
}
/*:1639*//*1641:*/
#line 30680 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hfinish_page_group(void)
{pointer p;
end_graf();
p= hget_current_page();
if(p!=null)
{delete_glue_ref(setpage_topskip(p));
setpage_topskip(p)= top_skip;add_glue_ref(top_skip);
setpage_depth(p)= max_depth;
flush_node_list(setpage_list(p));
setpage_list(p)= link(head);
}
unsave();
pop_nest();
}
/*:1641*//*1644:*/
#line 30720 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hout_allocate(void)
{new_directory(dir_entries);
new_output_buffers();
max_section_no= 2;
hdef_init();
hput_content_start();
/*1716:*/
#line 32070 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{uint32_t pos= hpos-hstart;
hpos++;
hput_tags(pos,hout_language(language));
}
/*:1716*/
#line 30727 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:1644*//*1645:*/
#line 30740 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hint_open(void)
{if(job_name==0)open_log_file();
pack_job_name(".hnt");
while(!(hout= open_out((char*)name_of_file+1,"wb")))
prompt_file_name("file name for output",".hnt");
output_file_name= make_name_string();
DBG(DBGBASIC,"Output file %s opened\n",(char*)name_of_file+1);
}

static void hput_definitions();
extern int option_global;
static void hout_terminate(void)
{size_t s;
if(hout==NULL)return;
hput_content_end();
hput_definitions();
option_global= true;
/*1646:*/
#line 30780 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int i;
for(i= 3;i<=max_section_no;i++)
recorder_record_input(dir[i].file_name);
}

/*:1646*/
#line 30758 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1843:*/
#line 35118 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int i;
for(i= 0;i<=font_ptr;i++)
if(IS_X_FONT(i)&&x_font[i]->f!=NULL)
{hb_blob_t*blob= NULL;
const char*buf= NULL;
unsigned int size;
bool is_subset= false;

if(x_font[i]->sub!=NULL)
{hb_face_t*fin,*fout= NULL;
fin= hb_font_get_face(x_font[i]->f);
if(fin!=NULL)
fout= hb_subset_or_fail(fin,x_font[i]->sub);
if(fout==NULL)
{print_err("Unable to compute subset for font ");printn_esc(font_id_text(i));print_ln();
error();
}
else
{blob= hb_face_reference_blob(fout);
}
hb_subset_input_destroy(x_font[i]->sub);
x_font[i]->sub= NULL;
x_font[i]->subset= NULL;
}
if(blob!=NULL)
is_subset= true;
else
blob= x_font[i]->blob;
if(blob!=NULL)
buf= hb_blob_get_data(blob,&size);
if(buf!=NULL&&size> 0)
{int g;
g= hmap_font[i];
if(g>=0&&hfonts[g]!=NULL&&hfonts[g]->y> 2)
{int y= hfonts[g]->y;
dir[y].size= size;
dir[y].buffer= (uint8_t*)buf;
if(is_subset)
{DBG(DBGFONT,"Creating subset for font %s (size %d)",dir[y].file_name,size);
/*1844:*/
#line 35171 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{char*n= dir[y].file_name;
int i,k;
i= k= strlen(n);
while(k> 0)
{k--;
if(n[k]=='.')break;
}
if(k<7||strncmp(".subset",n+k-7,7)!=0)
{ALLOCATE(dir[y].file_name,i+7+1,char);
strncpy(dir[y].file_name,n,k);
strncpy(dir[y].file_name+k,".subset",8);
strncpy(dir[y].file_name+k+7,n+k,i-k);
free(n);
}
}


/*:1844*/
#line 35158 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
}
}
}
}


/*:1843*/
#line 30759 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hput_directory();
s= hput_hint("created by HiTeX Version "HITEX_VERSION);
print_nl("Output written on ");slow_print(output_file_name);

print(" (1 page, ");print_int(s);print(" bytes).");
}

static void hint_close(void)
{hout_terminate();
if(hout!=NULL)
fclose(hout);
hout= NULL;
}

/*:1645*//*1655:*/
#line 30923 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hput_definitions()

{int i;
hput_definitions_start();
hput_max_definitions();
/*1717:*/
#line 32081 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Maximum language reference: %d\n",max_ref[language_kind]);
for(i= max_fixed[language_kind]+1;i<=max_ref[language_kind];i++)
{HPUTNODE;
HPUT8(TAG(language_kind,0));
HPUT8(i);
if(hlanguage[i].s==0)
hput_string("unknown");
else
hout_string(hlanguage[i].s);
HPUT8(TAG(language_kind,0));
}
/*:1717*/
#line 30929 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1700:*/
#line 31782 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int f;
DBG(DBGDEF,"Defining %d fonts\n",max_ref[font_kind]+1);
for(f= 0;f<=max_ref[font_kind];f++)
{Font*hf= hfonts[f];
internal_font_number g= hf->i;
uint32_t pos= hpos-hstart;
Info i;
DBG(DBGDEF,"Defining font %d size 0x%x\n",f,font_size[g]);
hpos++;HPUTNODE;
HPUT8(f);
hout_string(font_id_text(g));
if(font_size[g]> 0)HPUT32(font_size[g]);
else HPUT32(font_dsize[g]);
if(hf->m>=0){i= b000;HPUT16(hf->m);}else i= b001;
HPUT16(hf->y);
DBG(DBGDEF,"Defining font space\n");
HPUTCONTENT(hout_glue_spec,hf->g);
DBG(DBGDEF,"Defining font hyphen\n");
HPUTCONTENT(hout_disc,hf->h);
hdef_font_params(hf->p);
DBG(DBGDEF,"End of font %d\n",f);
hput_tags(pos,TAG(font_kind,i));
}
}
/*:1700*/
#line 30930 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1662:*/
#line 31052 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Maximum int reference: %d\n",max_ref[int_kind]);
for(i= max_fixed[int_kind]+1;i<=max_default[int_kind];i++)
{if(int_defined[i]!=int_defaults[i])
HPUTDEF(hput_int(int_defined[i]),i);
}
for(;i<=max_ref[int_kind];i++)
HPUTDEF(hput_int(int_defined[i]),i);
/*:1662*/
#line 30931 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1667:*/
#line 31110 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Maximum dimen reference: %d\n",max_ref[dimen_kind]);
for(i= max_fixed[dimen_kind]+1;i<=max_default[dimen_kind];i++)
{if(dimen_defined[i]!=dimen_defaults[i])
HPUTDEF(hput_dimen(dimen_defined[i]),i);
}
for(;i<=max_ref[dimen_kind];i++)
HPUTDEF(hput_dimen(dimen_defined[i]),i);
/*:1667*/
#line 30932 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1672:*/
#line 31160 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Maximum xdimen reference: %d\n",max_ref[xdimen_kind]);
for(i= max_fixed[xdimen_kind]+1;i<=max_default[xdimen_kind];i++)
{Xdimen x;
x.w= xdimen_defined[i].w;
x.h= xdimen_defined[i].h/(double)ONE;
x.v= xdimen_defined[i].v/(double)ONE;

if(x.w!=xdimen_defaults[i].w||
x.h!=xdimen_defaults[i].h||
x.v!=xdimen_defaults[i].v)
HPUTDEF(hput_xdimen(&x),i);
}
for(;i<=max_ref[xdimen_kind];i++)
{Xdimen x;
x.w= xdimen_defined[i].w;
x.h= xdimen_defined[i].h/(double)ONE;
x.v= xdimen_defined[i].v/(double)ONE;
HPUTDEF(hput_xdimen(&x),i);
}

/*:1672*/
#line 30933 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1678:*/
#line 31272 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Maximum glue reference: %d\n",max_ref[glue_kind]);
for(i= max_fixed[glue_kind]+1;i<=max_default[glue_kind];i++)
{Glue g;
to_Glue(glue_defined[i],&g);
if(!Glue_equal(&g,&glue_defaults[i]))
HPUTDEF(hput_glue(&g),i);
}
for(;i<=max_ref[glue_kind];i++)
HPUTDEF(hout_glue_spec(glue_defined[i]),i);
/*:1678*/
#line 30934 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1684:*/
#line 31390 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Defining %d baseline skips\n",max_ref[baseline_kind]);
for(i= 1;i<=max_ref[baseline_kind];i++)
{uint32_t pos= hpos-hstart;
uint8_t tag;
hpos++;
HPUT8(i);
tag= hout_baselinespec(i);
hstart[pos]= tag;
HPUT8(tag);
}
/*:1684*/
#line 30935 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1694:*/
#line 31600 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Defining %d parameter lists\n",max_ref[param_kind]);
for(i= pl_head;i> 0;i= pl_defined[i].l)
{int j,k;
DBG(DBGDEF,"Defining parameter list %d, size 0x%x\n",i,pl_defined[i].s);
j= hsize_bytes(pl_defined[i].s);
HPUTX(1+1+j+1+pl_defined[i].s+1+j+1);
if(j==4)k= 3;else k= j;
HPUTTAG(param_kind,k);
HPUT8(pl_defined[i].n);
hput_list_size(pl_defined[i].s,j);
HPUT8(0x100-k);
memcpy(hpos,pl_defined[i].p,pl_defined[i].s);
hpos= hpos+pl_defined[i].s;
HPUT8(0x100-k);
hput_list_size(pl_defined[i].s,j);
HPUTTAG(param_kind,k);
}
/*:1694*/
#line 30936 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1690:*/
#line 31508 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Maximum disc reference: %d\n",max_ref[disc_kind]);
for(i= 0;i<=max_ref[disc_kind];i++)
HPUTDEF(hout_disc(dc_defined[i]),i);

/*:1690*/
#line 30937 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1593:*/
#line 29256 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Defining %d color references\n",max_ref[color_kind]);
HPUTX((1+1+1+sizeof(ColorSet)+1)*(max_ref[color_kind]+1));
for(i= max_fixed[color_kind]+1;i<=max_default[color_kind];i++)
{if(!colorset_equal(colors[i],color_defaults[i]))
HPUTDEF(hout_color_def(colors[i]),i);
}
for(;i<=max_ref[color_kind];i++)
HPUTDEF(hout_color_def(colors[i]),i);

/*:1593*/
#line 30938 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1706:*/
#line 31881 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

DBG(DBGDEF,"Maximum page template reference: %d\n",max_page);
{pointer t;
for(t= link(setpage_head);t!=null;t= link(t))
{uint32_t pos= hpos-hstart;
DBG(DBGDEF,"Defining page template %d\n",setpage_number(i));
hpos++;HPUTNODE;
HPUT8(setpage_number(t));
hout_string(setpage_name(t));
HPUT8(setpage_priority(t));
hout_glue_node(setpage_topskip(t));
hput_dimen(setpage_depth(t));
hout_xdimen_node(setpage_height(t));
hout_xdimen_node(setpage_width(t));
hout_list_node2(setpage_list(t));
/*1707:*/
#line 31903 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{pointer p,q;
p= setpage_streams(t);
while(p!=null)
{uint8_t n;
n= setstream_number(p);
DBG(DBGDEF,"Defining stream %d at "SIZE_F"\n",n,hpos-hstart);
HPUTTAG(stream_kind,b100);
HPUT8(n);
hout_xdimen_node(setstream_max(p));
HPUT16(setstream_mag(p));
HPUT8(setstream_preferred(p));
HPUT8(setstream_next(p));
HPUT16(setstream_ratio(p));
q= setstream_before(p);setstream_before(p)= null;
hout_list_node2(q);flush_node_list(q);
hout_xdimen_node(setstream_width(p));
q= setstream_topskip(p);
hout_glue_node(q);delete_glue_ref(q);
q= setstream_after(p);setstream_after(p)= null;
hout_list_node2(q);flush_node_list(q);
q= setstream_height(p);
hout_glue_node(q);delete_glue_ref(q);
HPUTTAG(stream_kind,b100);
p= link(p);
}
}
/*:1707*/
#line 31896 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hput_tags(pos,TAG(page_kind,0));
}
}
/*:1706*/
#line 30939 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

hput_definitions_end();
hput_range_defs();
hput_label_defs();
}
/*:1655*//*1671:*/
#line 31151 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer new_xdimen(scaled w,scaled h,scaled v)
{pointer p= get_node(xdimen_node_size);
type(p)= whatsit_node;subtype(p)= xdimen_node;
xdimen_width(p)= w;
xdimen_hfactor(p)= h;
xdimen_vfactor(p)= v;
return p;
}
/*:1671*//*1685:*/
#line 31402 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void print_baseline_skip(int i)
{if(0<=i&&i<bl_used)
{print_spec(bl_defined[i].bs,0);print_char(',');
print_spec(bl_defined[i].ls,0);print_char(',');
print_scaled(bl_defined[i].lsl);
}
else
print("unknown");
}
/*:1685*//*1688:*/
#line 31477 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hget_disc_no(pointer p)
{
static int rover= 0;
int i;
for(i= 0;i<=max_ref[disc_kind];i++)
{pointer q= dc_defined[rover];
if(is_auto_disc(p)==is_auto_disc(q)&&replace_count(p)==replace_count(q)&&
list_equal(pre_break(p),pre_break(q))&&
list_equal(post_break(p),post_break(q)))
return rover;
else if(rover==0)
rover= max_ref[disc_kind];
else
rover--;
}
if(max_ref[disc_kind]>=0xFF||section_no!=2)return-1;

rover= ++max_ref[disc_kind];
dc_defined[rover]= copy_disc_node(p);
/*1689:*/
#line 31505 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

ensure_font_no(pre_break(p));
ensure_font_no(post_break(p));
/*:1689*/
#line 31497 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

return rover;
}
/*:1688*//*1692:*/
#line 31533 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static uint32_t hparam_list_hash(List*l)
{uint32_t h= 0;
uint32_t i;
for(i= 0;i<l->s;i++)
h= 3*h+hstart[l->p+i];
return h;
}

static bool pl_equal(List*l,uint8_t*p)
{uint8_t*q= hstart+l->p;
uint32_t i;
for(i= 0;i<l->s;i++)
if(q[i]!=p[i])return false;
return true;
}

static void pl_copy(List*l,uint8_t*p)
{uint8_t*q= hstart+l->p;
memcpy(p,q,l->s);
}

static int hget_param_list_no(List*l)
{uint32_t h;
int i;
if(l->s<=0)return 0;
h= hparam_list_hash(l);
i= h%PLH_SIZE;
while(pl_defined[i].p!=NULL)
{if(pl_defined[i].h==h&&pl_equal(l,pl_defined[i].p))
return pl_defined[i].n;
i= i+199;
if(i>=PLH_SIZE)i= i-PLH_SIZE;
}
if(max_ref[param_kind]>=0xFF||section_no!=2)return-1;
pl_defined[i].n= ++max_ref[param_kind];
*pl_tail= i;pl_tail= &(pl_defined[i].l);
pl_defined[i].l= 0;
pl_defined[i].h= h;
pl_defined[i].s= l->s;
ALLOCATE(pl_defined[i].p,l->s,uint8_t);
pl_copy(l,pl_defined[i].p);
return pl_defined[i].n;
}
/*:1692*//*1693:*/
#line 31580 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hdef_param_node(int ptype,int pnumber,int pvalue)
{
if(ptype==int_type)
{if(pvalue==int_defined[hmap_int[pnumber]])return;
else HPUTDEF(hput_int(pvalue),hmap_int[pnumber]);
}
else if(ptype==dimen_type)
{if(pvalue==dimen_defined[hmap_dimen[pnumber]])return;
else HPUTDEF(hput_dimen(pvalue),hmap_dimen[pnumber]);
}
else if(ptype==glue_type)
{if(glue_equal(pvalue,glue_defined[hmap_glue[pnumber]]))return;
else HPUTDEF(hout_glue_spec((pointer)pvalue),hmap_glue[pnumber]);
}
else QUIT("Unexpected parameter type %d",ptype);
}
/*:1693*//*1708:*/
#line 31938 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void hout_node(pointer p)
{uint32_t pos= hpos-hstart;
uint8_t tag;
HPUTNODE;
hpos++;
if(is_char_node(p))
/*1709:*/
#line 31963 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{Glyph g;
g.f= hget_font_no(font(p));
g.c= character(p);
/*1842:*/
#line 35109 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(x_font[font(p)]!=NULL&&x_font[font(p)]->subset!=NULL)
hb_set_add(x_font[font(p)]->subset,character(p));


/*:1842*/
#line 31967 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

tag= hput_glyph(&g);
}
/*:1709*/
#line 31945 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else switch(type(p))
{/*1710:*/
#line 31974 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case penalty_node:
{int n,i;
i= penalty(p);
if(i> 20000)i= 20000;
else if(i<-20000)i= -20000;
n= hget_int_no(i);
if(n<0)tag= hput_int(i);
else{HPUT8(n);tag= TAG(penalty_kind,0);}
}
break;
/*:1710*//*1711:*/
#line 31987 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case kern_node:
{int n;
n= hget_dimen_no(width(p));
if(n<0)
{Kern k;
k.x= (subtype(p)==explicit);
k.d.w= width(p);
k.d.h= k.d.v= 0.0;
tag= hput_kern(&k);
}
else
{HPUT8(n);
if(subtype(p)==explicit)tag= TAG(kern_kind,b100);else tag= TAG(kern_kind,b000);
}
}
break;
/*:1711*//*1718:*/
#line 32099 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case math_node:
{Kern k;
k.x= true;
k.d.w= width(p);
k.d.h= k.d.v= 0.0;
if(subtype(p)==before)
{tag= TAG(math_kind,b111);
if(width(p)!=0)
{hput_tags(pos,hput_kern(&k));
pos= hpos-hstart;
HPUTNODE;
hpos++;
}
}
else
{tag= TAG(math_kind,b011);
if(width(p)!=0)
{hput_tags(pos,tag);
pos= hpos-hstart;
HPUTNODE;
hpos++;
tag= hput_kern(&k);
}
}
}
break;
/*:1718*//*1720:*/
#line 32161 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case glue_node:
if(subtype(p)<=cond_math_glue)
tag= hout_glue(glue_ptr(p));
else if(a_leaders<=subtype(p)&&subtype(p)<=x_leaders)
{hout_glue_node(glue_ptr(p));
{bool outer_doing_leaders= doing_leaders;
doing_leaders= true;
hout_node(leader_ptr(p));
doing_leaders= outer_doing_leaders;
}
tag= TAG(leaders_kind,b100|(subtype(p)-a_leaders+1));
}
else
QUIT("glue subtype %d not implemented\n",subtype(p));
break;
/*:1720*//*1722:*/
#line 32208 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case disc_node:
{int n;
n= hget_disc_no(p);
if(n<0)
tag= hout_disc(p);
else{HPUT8(n);tag= TAG(disc_kind,0);}
}
break;
/*:1722*//*1723:*/
#line 32222 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case ligature_node:
{Lig l;
pointer q;
l.f= hget_font_no(font(lig_char(p)));
HPUT8(l.f);
l.l.p= hpos-hstart;
hput_utf8(qo(character(lig_char(p))));
q= lig_ptr(p);
while(q> null)
{hput_utf8(qo(character(q)));
q= link(q);
}
l.l.s= (hpos-hstart)-l.l.p;
tag= hput_ligature(&l);
}
break;
/*:1723*//*1724:*/
#line 32240 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case rule_node:
{Rule r;
if(is_running(height(p)))r.h= RUNNING_DIMEN;else r.h= height(p);
if(is_running(depth(p)))r.d= RUNNING_DIMEN;else r.d= depth(p);
if(is_running(width(p)))r.w= RUNNING_DIMEN;else r.w= width(p);
tag= hput_rule(&r);
}
break;
/*:1724*//*1725:*/
#line 32250 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hlist_node:
case vlist_node:
if(type(p)==hlist_node)tag= TAG(hbox_kind,0);
else tag= TAG(vbox_kind,0);
tag|= hput_box_dimen(height(p),depth(p),width(p));
tag|= hput_box_shift(shift_amount(p));
tag|= hput_box_glue_set((glue_sign(p)==stretching)?+1:-1,glue_set(p),glue_order(p));
hout_list_node2(list_ptr(p));
break;
/*:1725*//*1726:*/
#line 32261 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case adjust_node:
hout_list_node2(adjust_ptr(p));
tag= TAG(adjust_kind,1);
break;
/*:1726*//*1727:*/
#line 32269 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case ins_node:
/*1728:*/
#line 32287 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

{int k,n;
uint32_t pos;
List l;
Info i= b000;
k= subtype(p);
n= hget_stream_no(k);
HPUT8(n);
link(temp_head)= null;
new_param_node(int_type,floating_penalty_code,float_cost(p));
new_param_node(dimen_type,split_max_depth_code,depth(p));
new_param_node(glue_type,split_top_skip_code,split_top_ptr(p));
pos= hpos-hstart;
l.t= TAG(param_kind,b001);
n= hout_param_list(link(temp_head),pos,&l);
flush_node_list(link(temp_head));link(temp_head)= null;
if(n>=0)HPUT8(n);else i= b010;
hout_list_node2(ins_ptr(p));
tag= TAG(stream_kind,i);
}
/*:1728*/
#line 32271 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

break;
/*:1727*//*1729:*/
#line 32310 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case mark_node:hpos--;return;
/*:1729*//*1730:*/
#line 32315 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case whatsit_node:
switch(subtype(p))
{/*1591:*/
#line 29232 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case color_node:
HPUT8(color_ref(p));
tag= TAG(color_kind,b000);
break;
case no_color_node:
case end_color_node:
hpos--;
return;

/*:1591*//*1705:*/
#line 31876 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case stream_node:
HPUT8(setstream_number(p));
tag= TAG(stream_kind,b100);
break;
/*:1705*//*1715:*/
#line 32061 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case language_node:
tag= hout_language(what_lang(p));
break;

/*:1715*//*1731:*/
#line 32340 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case open_node:case write_node:case close_node:
case special_node:case latespecial_node:out_what(p);hpos--;return;

/*:1731*//*1732:*/
#line 32352 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case par_node:
{uint32_t pos,xpos,xsize;
List l;
pointer q;
int n,m;
Info i= b000;
q= par_extent(p);
n= hget_xdimen_no(q);
if(n>=0)HPUT8(n);
else
{xpos= hpos-hstart;hout_xdimen_node(p);xsize= (hpos-hstart)-xpos;i|= b100;}
pos= hpos-hstart;
l.t= TAG(param_kind,b001);
m= hout_param_list(par_params(p),pos,&l);
if(m>=0)
{if(i&b100)
{HPUTX(1);
memmove(hstart+xpos+1,hstart+xpos,xsize);
hpos++;
hstart[xpos]= m;
}
else
HPUT8(m);
}
else i|= b010;
hout_list_node2(par_list(p));
tag= TAG(par_kind,i);
}
break;
/*:1732*//*1733:*/
#line 32383 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case baseline_node:
{int n;
n= baseline_node_no(p);
if(n> 0xFF)tag= hout_baselinespec(n);
else
{HPUT8(n);
tag= TAG(baseline_kind,b000);
}
}
break;
/*:1733*//*1734:*/
#line 32395 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case disp_node:
{uint32_t pos;
List l;
int n;
Info i= b000;
pos= hpos-hstart;
l.t= TAG(param_kind,b001);
n= hout_param_list(display_params(p),pos,&l);
if(n>=0)HPUT8(n);else i|= b100;
if(display_eqno(p)!=null&&display_left(p))
{hout_node(display_eqno(p));i|= b010;}
hout_list_node2(display_formula(p));
if(display_eqno(p)!=null&&!display_left(p))
{hout_node(display_eqno(p));i|= b001;}
tag= TAG(math_kind,i);

}
break;
/*:1734*//*1735:*/
#line 32422 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case hset_node:
case vset_node:
{Kind k= subtype(p)==hset_node?hset_kind:vset_kind;
Info i= b000;
Stretch s;
int n= set_extent(p);
i|= hput_box_dimen(height(p),depth(p),width(p));
i|= hput_box_shift(shift_amount(p));
s.f= set_stretch(p)/(double)ONE;s.o= set_stretch_order(p);
hput_stretch(&s);
s.f= set_shrink(p)/(double)ONE;s.o= set_shrink_order(p);
hput_stretch(&s);
if(hout_xdimen(n))i|= b001;
hout_list_node2(list_ptr(p));
tag= TAG(k,i);
}
break;
case hpack_node:
case vpack_node:
{Kind k= (subtype(p)==hpack_node?hpack_kind:vpack_kind);
Info i= b000;
int n= pack_extent(p);
if(pack_m(p)==additional)i|= b001;
if(shift_amount(p)!=0){HPUT32(shift_amount(p));i|= b010;}
if(k==vpack_kind)HPUT32(pack_limit(p));
if(hout_xdimen(n))i|= b100;
hout_list_node2(list_ptr(p));
tag= TAG(k,i);
}
break;

/*:1735*//*1736:*/
#line 32455 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case align_node:
{Info i= b000;
if(align_m(p)==additional)i|= b001;
if(align_v(p))i|= b010;
if(hout_xdimen(align_extent(p)))i|= b100;
hout_preamble(align_preamble(p));
hout_align_list(align_list(p),align_v(p));
tag= TAG(table_kind,i);
}
break;
/*:1736*//*1744:*/
#line 32652 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case label_node:hpos--;new_label(p);return;
case start_link_node:
{Info i;
int n= new_start_link(p);
i= b010;
if(n> 0xFF){i|= b001;HPUT16(n);}else HPUT8(n);
if(color_ref(p)!=1){i|= b100;HPUT8(color_ref(p));}
tag= TAG(link_kind,i);
}
break;
case end_link_node:
{Info i;
int n= new_end_link();
i= b000;
if(n> 0xFF){i|= b001;HPUT16(n);}else HPUT8(n);
if(color_ref(p)!=0xFF){i|= b100;HPUT8(color_ref(p));}
tag= TAG(link_kind,i);
}
break;
case outline_node:hpos--;new_outline(p);return;

/*:1744*//*1746:*/
#line 32680 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case image_node:
{Xdimen w= {0},h= {0};
if(image_xwidth(p)!=null)
{pointer r= image_xwidth(p);
w.w= xdimen_width(r);
w.h= xdimen_hfactor(r)/(double)ONE;
w.v= xdimen_vfactor(r)/(double)ONE;
}
if(image_xheight(p)!=null)
{pointer r= image_xheight(p);
h.w= xdimen_width(r);
h.h= xdimen_hfactor(r)/(double)ONE;
h.v= xdimen_vfactor(r)/(double)ONE;
}
tag= TAG(image_kind,hput_image_spec(image_no(p),image_aspect(p)/(double)ONE,0,&w,0,&h));
hout_list_node2(image_alt(p));
}
break;
/*:1746*/
#line 32318 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:
if(subtype(p)>=hitex_ext)
{MESSAGE("\nOutput of whatsit nodes subtype=%d not implemented\n",subtype(p));
}
hpos--;
return;
}
break;

/*:1730*//*1739:*/
#line 32558 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

case unset_node:
case unset_set_node:
case unset_pack_node:


/*:1739*/
#line 31947 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

default:
MESSAGE("\nOutput of node type=%d subtype=%d not implemented\n",type(p),subtype(p));
hpos--;
return;
}
hput_tags(pos,tag);
}

/*:1708*//*1740:*/
#line 32578 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static uint8_t hout_list(pointer p,uint32_t pos,List*l)
{l->p= hpos-hstart;
while(p> mem_min)
{hout_node(p);
p= link(p);
}
l->s= (hpos-hstart)-l->p;
return hput_list(pos,l);
}

static void hout_list_node(pointer p,uint32_t pos,List*l)
{
hpos= hstart+pos;
HPUTX(3);
HPUT8(0);
HPUT8(0);
HPUT8(0);
hput_tags(pos,hout_list(p,pos+1,l));
}


static void hout_list_node2(pointer p)
{List l;
uint32_t pos;
pos= hpos-hstart;
l.t= TAG(list_kind,b001);
hout_list_node(p,pos,&l);
}
/*:1740*//*1742:*/
#line 32621 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int hout_param_list(pointer p,uint32_t pos,List*l)
{int n;
hpos= hstart+pos;
if(p==null)return 0;
HPUTX(3);
HPUT8(0);
HPUT8(0);
HPUT8(0);
l->p= hpos-hstart;
while(p> mem_min)
{hdef_param_node(param_type(p),param_no(p),param_value(p).i);
p= link(p);
}
l->s= (hpos-hstart)-l->p;
n= hget_param_list_no(l);
if(n>=0)
hpos= hstart+pos;
else
hput_tags(pos,hput_list(pos+1,l));
return n;
}
/*:1742*//*1747:*/
#line 32702 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


#if 0
static void hchange_text_font(internal_font_number f)
{uint8_t g;
if(f!=hfont)
{g= get_font_no(f);
if(g<8)
hputcc(FONT0_CHAR+g);
else
{hputcc(FONTN_CHAR);
hputcc(g);
}
hfont= f;
}
}

static void hprint_text_char(pointer p)
{uint8_t f,c;
f= font(p);
c= character(p);
hchange_text_font(f);
if(c<=SPACE_CHAR)hputcc(ESC_CHAR);
hputcc(c);
}


static void hprint_text_node(pointer p)
{switch(type(p))
{case hlist_node:

goto nodex;
case glue_node:
if(subtype(p)> cond_math_glue)goto nodex;
else
{pointer q= glue_ptr(p);
int i;
if(glue_equal(f_space_glue[hfont],q))
{hputc(SPACE_CHAR);return;}
if(glue_equal(f_xspace_glue[hfont],q))
{hputcc(XSPACE_CHAR);return;}
if(f_1_glue[hfont]==0&&(subtype(p)-1==space_skip_code))
{pointer r= glue_par(subtype(p)-1);
add_glue_ref(r);
f_1_glue[hfont]= r;
}
if(f_1_glue[hfont]!=0&&glue_equal(f_1_glue[hfont],q))
{hputcc(GLUE1_CHAR);return;}
if(f_2_glue[hfont]==0&&(subtype(p)-1==space_skip_code||subtype(p)-1==xspace_skip_code))
{pointer r= glue_par(subtype(p)-1);
add_glue_ref(r);
f_2_glue[hfont]= r;
}
if(f_2_glue[hfont]!=0&&glue_equal(f_2_glue[hfont],q))
{hputcc(GLUE2_CHAR);return;}
if(f_3_glue[hfont]==0)
{f_3_glue[hfont]= q;
add_glue_ref(q);
}
if(f_3_glue[hfont]!=0&&glue_equal(f_3_glue[hfont],q))
{hputcc(GLUE3_CHAR);return;}
i= hget_glue_no(q);
if(i>=0)
{hputcc(GLUEN_CHAR);hputcc(i);return;}
}
break;
case ligature_node:
{int n;
pointer q;
for(n= 0,q= lig_ptr(p);n<5&&q!=null;n++,q= link(q))continue;
if(n==2)hputcc(LIG2_CHAR);
else if(n==3)hputcc(LIG3_CHAR);
else if(n==0)hputcc(LIG0_CHAR);
else goto nodex;
hprint_text_char(lig_char(p));
for(q= lig_ptr(p);q!=null;q= link(q))hprint_text_char(q);
return;
}
case disc_node:
if(post_break(p)==null&&pre_break(p)!=null&&replace_count(p)==0)
{pointer q;
q= pre_break(p);
if(is_char_node(q)&&link(q)==null&&font(q)==hfont&&character(q)==hyphen_char[hfont])
{if(is_auto_disc(p))hputcc(DISC1_CHAR);
else hputcc(DISC2_CHAR);
return;
}
}
else if(post_break(p)==null&&pre_break(p)==null&&replace_count(p)==0&&!is_auto_disc(p))
{hputcc(DISC3_CHAR);return;}
break;
case math_node:
if(width(p)!=0)goto nodex;
if(subtype(p)==before)hputcc(MATHON_CHAR);
else hputcc(MATHOFF_CHAR);
return;
default:
break;
}
nodex:
hout_node(p);
}

static void hprint_text(pointer p)
{internal_font_number f= hfont;
nesting++;
hprint_nesting();
hprintf("<text ");
while(p> mem_min)
{if(is_char_node(p))
hprint_text_char(p);
else
hprint_text_node(p);
p= link(p);
}
hchange_text_font(f);
hprintf(">\n");
nesting--;
}
#endif
#line 32822 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1747*/
#line 28566 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1571*//*1751:*/
#line 32885 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
/*1755:*/
#line 32929 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void usage_help(void)
{/*1756:*/
#line 32939 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

fprintf(stdout,
"Usage: %s [OPTION]... [TEXNAME[.tex]] [COMMANDS]\n"
"   or: %s [OPTION]... \\FIRST-LINE\n"
"   or: %s [OPTION]... &FMT ARGS\n\n",
argv[0],argv[0],argv[0]);
fprintf(stdout,
"  Run HiTeX on TEXNAME, creating TEXNAME.hnt.\n"
"  Any remaining COMMANDS are processed\n"
"  as TeX input after TEXNAME is read.\n"
"  If the first line of TEXNAME starts with %%&FMT, and FMT is\n"
"  an existing .fmt file, use it. Else use `NAME.fmt', where\n"
"  NAME is the program invocation name.\n"
"\n"
"  Alternatively, if the first non-option argument begins\n"
"  with a backslash, interpret all non-option arguments as\n"
"  a line of TeX input.\n"
"\n"
"  Alternatively, if the first non-option argument begins\n"
"  with a &, the next word is taken as the FMT to read,\n"
"  overriding all else.  Any remaining arguments are\n"
"  processed as above.\n"
"\n"
"  If no arguments or options are specified, prompt for input.\n"
"\n");


/*:1756*/
#line 32931 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1757:*/
#line 32969 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

fprintf(stdout,
"Options:\n"
" -help                 "
"\t display this help and exit\n"
" -version              "
"\t output version information and exit\n"
" -etex                 "
"\t enable e-TeX extensions\n"
" -ltx                 "
"\t enable LaTeX extensions, implies -etex\n"
" -ini                  "
"\t be initex for dumping formats; this is\n"
"\t\t\t also true if the program name is `hinitex'\n"
" -progname=STRING      "
"\t set program (and fmt) name to STRING\n"
" -fmt=FMTNAME          "
"\t use FMTNAME instead of program name or a %%& line\n"
" -output-directory=DIR "
"\t use existing DIR as the directory to write files to\n"
" -jobname=STRING       "
"\t set the TeX \\jobname to STRING\n"
" [-no]-mktex=FMT       "
"\t disable/enable mktexFMT generation (FMT=tex/tfm/fmt/pk)\n"
" -interaction=STRING   "
"\t set interaction mode (STRING=batchmode/\n"
"\t\t\t nonstopmode/scrollmode/errorstopmode)\n"
" -kpathsea-debug=NUMBER"
"\t set path searching debugging flags according\n"
"\t\t\t to the bits of NUMBER\n"
" -recorder"
"\t\t enable filename recorder\n"
" [-no]-parse-first-line"
"\t disable/enable parsing of the first line of\n"
"\t\t\t the input file\n"
" [-no]-file-line-error"
"\t disable/enable file:line:error style\n"
" -cnf-line=STRING"
"\t process STRING like a line in texmf.cnf\n"
" -compress             "
"\t enable compression of section 1 and 2\n"
" [-no]-subset          "
"\t disable/enable the embedding of font subsets\n"
" [-no]-empty-page      "
"\t disable/enable empty pages\n"
" [-no]-hyphenate-first-word "
"\t disable/enable hyphenation of\n"
"\t\t\t the first word of a paragraph\n"
" -resolution=NUMBER    "
"\t set the resolution to NUMBER dpi\n"
" -mfmode=MODE          "
"\t set the METAFONT mode to MODE\n"
#ifdef DEBUG
" -hint-debug=FLAGS     "
"\t set flags to control hint debug output\n"
" -hint-debug-help      "
"\t give help on hint debugging\n"
#endif
#line 33027 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
);

/*:1757*/
#line 32932 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

fprintf(stdout,"\nFor further information and reporting bugs see https://hint.userweb.mwn.de/\n");
exit(0);
}

/*:1755*//*1768:*/
#line 33222 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char*normalize_quotes(const char*nom,const char*mesg)
{int quoted= false;
int must_quote= (strchr(nom,' ')!=NULL);
char*ret= xmalloc(strlen(nom)+3);
char*p= ret;
const char*q;

if(must_quote)
*p++= '"';
for(q= nom;*q;q++)
if(*q=='"')
quoted= !quoted;
else
*p++= *q;

if(must_quote)
*p++= '"';
*p= '\0';
if(quoted){
fprintf(stderr,"! Unbalanced quotes in %s %s\n",mesg,nom);
exit(1);
}
return ret;
}

/*:1768*//*1772:*/
#line 33320 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char*recorder_name= NULL;
static FILE*recorder_file= NULL;
static void
recorder_start(void)
{char*cwd;
char pid_str[MAX_INT_LENGTH];
sprintf(pid_str,"%ld",(long)getpid());
recorder_name= concat3(kpse_program_name,pid_str,".fls");
if(output_directory){
char*temp= concat3(output_directory,DIR_SEP_STRING,recorder_name);
free(recorder_name);
recorder_name= temp;
}
recorder_file= xfopen(recorder_name,FOPEN_W_MODE);
cwd= xgetcwd();
fprintf(recorder_file,"PWD %s\n",cwd);
free(cwd);
}

/*:1772*//*1775:*/
#line 33351 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void
recorder_change_filename(const char*new_name)
{char*temp= NULL;
if(!recorder_file)
return;
#if defined(_WIN32)
fclose(recorder_file);
#endif 
#line 33360 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
if(output_directory){
temp= concat3(output_directory,DIR_SEP_STRING,new_name);
new_name= temp;
}

#if defined(_WIN32)
remove(new_name);
#endif 
#line 33368 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
rename(recorder_name,new_name);
free(recorder_name);
recorder_name= xstrdup(new_name);
#if defined(_WIN32)
recorder_file= xfopen(recorder_name,FOPEN_A_MODE);
#endif 
#line 33374 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
if(temp)
free(temp);
}

/*:1775*//*1776:*/
#line 33383 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void
recorder_record_name(const char*pfx,const char*fname)
{if(recorder_enabled){
if(!recorder_file)
recorder_start();
fprintf(recorder_file,"%s %s\n",pfx,fname);
fflush(recorder_file);
}
}


static void
recorder_record_input(const char*fname)
{recorder_record_name("INPUT",fname);
}

static void
recorder_record_output(const char*fname)
{recorder_record_name("OUTPUT",fname);
}

/*:1776*//*1781:*/
#line 33455 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void add_cnf_line(char*arg)
{cnf_count++;
cnf_lines= xrealloc(cnf_lines,sizeof(char*)*cnf_count);
cnf_lines[cnf_count-1]= arg;
}

/*:1781*//*1785:*/
#line 33550 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#ifdef WIN32
static void clean_windows_filename(char*filename)
{if(strlen(filename)> 2&&isalpha(filename[0])&&
filename[1]==':'&&filename[2]=='\\')
{char*pp;
for(pp= filename;*pp;pp++)
if(*pp=='\\')
*pp= '/';
}
}
#endif
#line 33562 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static char*find_file(char*fname,kpse_file_format_type t,int mx)
{char*filename;
int final_quote= (int)strlen(fname)-1;
int quoted= final_quote> 1&&fname[0]=='"'&&fname[final_quote]=='"';
if(quoted){

fname[final_quote]= '\0';
fname++;
}
filename= kpse_find_file(fname,t,mx);
if(full_name_of_file!=NULL)
{free(full_name_of_file);full_name_of_file= NULL;}
if(filename!=NULL)
full_name_of_file= strdup(filename);
if(quoted){

fname--;
fname[final_quote]= '"';
}
return filename;
}

static char*get_input_file_name(void)
{
char*input_file_name= NULL;

if(argv[optind]&&argv[optind][0]!='&'&&argv[optind][0]!='\\')
{
#ifdef WIN32
clean_windows_filename(argv[optind]);
#endif
#line 33594 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 argv[optind]= normalize_quotes(argv[optind],"input file");
input_file_name= find_file(argv[optind],kpse_tex_format,false);
}
return input_file_name;
}


/*:1785*//*1788:*/
#line 33631 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int texmf_yesno(const char*var)
{
char*value= kpse_var_value(var);
return value&&(*value=='t'||*value=='y'||*value=='1');
}

/*:1788*//*1792:*/
#line 33705 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void parse_first_line(char*filename)
{FILE*f= NULL;
if(filename==NULL)return;
f= open_in(filename,kpse_tex_format,"r");
if(f!=NULL)
{char*r,*s,*t= read_line(f);
xfclose(f,filename);
if(t==NULL)return;
s= t;
if(s[0]=='%'&&s[1]=='&'){
s= s+2;
while(ISBLANK(*s))++s;
r= s;
while(*s!=0&&*s!=' '&&*s!='\r'&&*s!='\n')s++;
*s= 0;
if(dump_name==NULL){
char*f_name= concat(r,".fmt");
char*d_name= kpse_find_file(f_name,kpse_fmt_format,false);
if(d_name&&kpse_readable_file(d_name)){
dump_name= xstrdup(r);
kpse_reset_program_name(dump_name);
}
free(f_name);
}
}
free(t);
}
}

/*:1792*//*1793:*/
#line 33754 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void input_add_char(unsigned int c)
{if(last>=max_buf_stack)
{max_buf_stack= last+1;
if(max_buf_stack==buf_size)
/*31:*/
#line 946 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(format_ident==0)
{write_ln(term_out,"Buffer size exceeded!");exit(0);

}
else{cur_input.loc_field= first;cur_input.limit_field= last-1;
overflow("buffer size",buf_size);

}

/*:31*/
#line 33759 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
;
}
buffer[last]= c;incr(last);
}

static void input_add_str(const char*str)
{int prev_last;
while(*str==' ')str++;
prev_last= last;
while(*str!=0)

input_add_char(*str++);
for(--last;last>=first;--last)
{char c= buffer[last];
if((c)!=' '&&(c)!='\r'&&(c)!='\n')break;
}
last++;
if(last> prev_last)input_add_char(' ');
}

static int input_command_line(void)
{
last= first;
while(optind<argc)input_add_str(argv[optind++]);
loc= first;
return(loc<last);
}

/*:1793*//*1796:*/
#line 33858 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void update_name_of_file(const char*s,int k)
{int j;
if(k<=file_name_size)name_length= k;
else name_length= file_name_size;
for(j= 0;j<name_length;j++)name_of_file[j+1]= s[j];
name_of_file[name_length+1]= 0;
}

/*:1796*//*1797:*/
#line 33872 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static FILE*open_in(char*filename,kpse_file_format_type t,const char*rwb)
{char*fname= NULL;
FILE*f= NULL;
fname= find_file(filename,t,true);
if(fname!=NULL)
{
f= fopen(fname,rwb);
if(f!=NULL)recorder_record_input(fname);
if(full_name_of_file!=NULL)free(full_name_of_file);
full_name_of_file= fname;
}
return f;
}

static bool a_open_in(alpha_file*f)
{f->f= open_in((char*)name_of_file+1,kpse_tex_format,"r");
if(f->f!=NULL)get(*f);
return f->f!=NULL&&ferror(f->f)==0;
}

static bool b_open_in(byte_file*f,char*fname)
{FILE*tfm= NULL;
tfm= fopen(fname,"rb");
if(tfm!=NULL)recorder_record_input(fname);
if(full_name_of_file!=NULL)free(full_name_of_file);
full_name_of_file= fname;
f->f= tfm;
get(*f);
return f->f!=NULL&&ferror(f->f)==0;
}

static bool w_open_in(word_file*f)
{
f->f= NULL;
if(name_of_file[1]!=0)
f->f= open_in((char*)name_of_file+1,kpse_fmt_format,"rb");
if(f->f!=NULL)get(*f);
return f->f!=NULL&&ferror(f->f)==0;
}

/*:1797*//*1802:*/
#line 34033 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static void
make_time_str(time_t t,bool utc)
{
struct tm lt,gmt;
size_t size;
int off,off_hours,off_mins;


if(utc){
lt= *gmtime(&t);
}
else{
lt= *localtime(&t);
}
size= strftime(time_str,TIME_STR_SIZE,"D:%Y%m%d%H%M%S",&lt);

if(size==0){

time_str[0]= '\0';
return;
}




if(time_str[14]=='6'){
time_str[14]= '5';
time_str[15]= '9';
time_str[16]= '\0';
}


gmt= *gmtime(&t);


off= 60*(lt.tm_hour-gmt.tm_hour)+lt.tm_min-gmt.tm_min;
if(lt.tm_year!=gmt.tm_year){
off+= (lt.tm_year> gmt.tm_year)?1440:-1440;
}else if(lt.tm_yday!=gmt.tm_yday){
off+= (lt.tm_yday> gmt.tm_yday)?1440:-1440;
}

if(off==0){
time_str[size++]= 'Z';
time_str[size]= 0;
}else{
off_hours= off/60;
off_mins= abs(off-off_hours*60);
snprintf(&time_str[size],TIME_STR_SIZE-size,"%+03d'%02d'",off_hours,off_mins);
}
}

static void get_creation_date(void)
{make_time_str(start_time,source_date_epoch!=NULL);
}


#ifdef WIN32
static struct _stat file_stat;
#define GET_FILE_STAT _stat(fname,&file_stat)
#else
#line 34096 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 static struct stat file_stat;
#define GET_FILE_STAT stat(fname,&file_stat)
#endif
#line 34099 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static char*find_input_file(void)
{char*fname;
int r;
if(output_directory&&!kpse_absolute_p((char*)name_of_file0,false))
{int r= -1;
fname= concat3(output_directory,DIR_SEP_STRING,(char*)name_of_file0);
r= GET_FILE_STAT;
if(r==0)
return fname;
free(fname);
}
fname= kpse_find_tex((char*)name_of_file0);
if(fname!=NULL)
{r= GET_FILE_STAT;
if(r==0)
return fname;
free(fname);
}
fname= (char*)name_of_file0;
r= GET_FILE_STAT;
if(r==0)
return strdup(fname);
return NULL;
}


static void get_file_mod_date(void)
{char*fname= NULL;
fname= find_input_file();
time_str[0]= 0;
if(fname!=NULL)
{make_time_str(file_stat.st_mtime,source_date_epoch!=NULL&&force_source_date!=NULL);
free(fname);
}
}

static int get_file_size(void)
{int s= -1;
char*fname= NULL;
fname= find_input_file();
if(fname!=NULL)
{s= file_stat.st_size;
free(fname);
}
return s;
}


static int get_md5_sum(int s,int file)
{md5_state_t st;
memset(md5_digest,0,DIGEST_SIZE);
if(file)
{char*fname;
pack_file_name(s,empty_string,empty_string,NULL);
fname= find_input_file();
if(fname!=NULL)
{FILE*f;
f= fopen(fname,"rb");
if(f!=NULL)
{int r;
char file_buf[FILE_BUF_SIZE];
recorder_record_input(fname);
md5_init(&st);
while((r= fread(&file_buf,1,FILE_BUF_SIZE,f))> 0)
md5_append(&st,(const md5_byte_t*)file_buf,r);
md5_finish(&st,md5_digest);
fclose(f);
}
free(fname);
}
else
return 0;
}
else
{md5_init(&st);
md5_append(&st,(md5_byte_t*)&str_pool[str_start[s]],
str_start[s+1]-str_start[s]);
md5_finish(&st,md5_digest);
}
return DIGEST_SIZE;
}


/*:1802*/
#line 32885 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1753:*/
#line 32898 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void main_init(int ac,char*av[])
{
char*main_input_file;
argc= ac;
argv= av;
interaction= error_stop_mode;
kpse_record_input= recorder_record_input;
kpse_record_output= recorder_record_output;

/*1761:*/
#line 33119 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#if defined(WIN32)
{char*enc;
kpse_set_program_name(argv[0],NULL);
enc= kpse_var_value("command_line_encoding");
get_command_line_args_utf8(enc,&argc,&argv);
parse_options(argc,argv);
/*1778:*/
#line 33416 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(recorder_enabled){
char**p= kpse_find_file_generic("texmf.cnf",kpse_cnf_format,0,1);
if(p&&*p){
char**pp= p;
while(*p){
recorder_record_input(*p);
free(*p);
p++;
}
free(pp);
}
}




/*:1778*/
#line 33126 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}
#else
#line 33129 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 parse_options(ac,av);
#endif
#line 33131 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1761*/
#line 32908 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1784:*/
#line 33525 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(!user_progname)
user_progname= dump_name;
#if defined(WIN32)
if(user_progname)
kpse_reset_program_name(user_progname);
#else
#line 33532 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 kpse_set_program_name(argv[0],user_progname);
#endif
#line 33534 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 xputenv("engine","hitex");


/*:1784*/
#line 32909 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1782:*/
#line 33465 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#if 1 
{int i;
for(i= 0;i<cnf_count;i++)
kpathsea_cnf_line_env_progname(kpse_def,cnf_lines[i]);
free(cnf_lines);
}
#endif
#line 33473 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1782*/
#line 32910 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1786:*/
#line 33604 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

main_input_file= get_input_file_name();

#ifdef WIN32

if(main_input_file==NULL){
char*file_name= argv[argc-1];
if(file_name&&file_name[0]!='-'&&file_name[0]!='&'&&file_name[0]!='\\'){
clean_windows_filename(file_name);
file_name= normalize_quotes(file_name,"argument");
main_input_file= find_file(file_name,kpse_tex_format,false);
argv[argc-1]= file_name;
}
}
#endif
#line 33619 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1786*/
#line 32911 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1787:*/
#line 33624 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(filelineerrorstylep<0)
filelineerrorstylep= texmf_yesno("file_line_error_style");
if(parsefirstlinep<0)
parsefirstlinep= texmf_yesno("parse_first_line");

/*:1787*/
#line 32912 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1791:*/
#line 33681 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(parsefirstlinep&&!dump_name)
parse_first_line(main_input_file);
if(!main_input_file&&argv[1]&&argv[1][0]=='&')
dump_name= argv[1]+1;
if(strcmp(kpse_program_name,"hinitex")==0)iniversion= true;
else if(strcmp(kpse_program_name,"hvirtex")==0&&!dump_name)
dump_name= "hitex";
if(!dump_name)
dump_name= kpse_program_name;
if(!dump_name)
{fprintf(stderr,"Unable to determine format name\n");
exit(1);
}
if(ltxp)etexp= 1;
if(etexp&&!iniversion)
{fprintf(stderr,"-etex and -ltx require -ini\n");
exit(1);
}

/*:1791*/
#line 32913 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1799:*/
#line 33943 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

kpse_set_program_enabled(kpse_tfm_format,MAKE_TEX_TFM_BY_DEFAULT,
kpse_src_compile);
kpse_set_program_enabled(kpse_tex_format,MAKE_TEX_TEX_BY_DEFAULT,
kpse_src_compile);
kpse_set_program_enabled(kpse_fmt_format,MAKE_TEX_FMT_BY_DEFAULT,
kpse_src_compile);
kpse_set_program_enabled(kpse_pk_format,MAKE_TEX_PK_BY_DEFAULT,
kpse_src_compile);
xputenv("MAKETEX_BASE_DPI",option_dpi_str);
xputenv("MAKETEX_MODE",option_mfmode);



/*:1799*/
#line 32914 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:1753*//*1759:*/
#line 33097 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void parse_options(int argc,char*argv[])
{while(true){
int option_index;
int g= getopt_long_only(argc,argv,"+",long_options,&option_index);
if(g==0)
{/*1763:*/
#line 33153 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(ARGUMENT_IS("help"))usage_help();
else if(ARGUMENT_IS("version")){
printf(banner"\n"
#ifdef eTeX_version_string
"eTeX version "eTeX_version_string"\n"
#endif 
#line 33160 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
#ifdef HINT_VERSION_STRING
"HINT version "HINT_VERSION_STRING"\n"
#endif
#line 33163 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
#ifdef Prote_version_string
"Prote version "Prote_version_string"\n"
#endif
#line 33166 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
);
exit(0);
}


/*:1763*//*1764:*/
#line 33176 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(ARGUMENT_IS("interaction")){
if(STREQ(optarg,"batchmode"))interaction_option= batch_mode;
else if(STREQ(optarg,"nonstopmode"))interaction_option= nonstop_mode;
else if(STREQ(optarg,"scrollmode"))interaction_option= scroll_mode;
else if(STREQ(optarg,"errorstopmode"))interaction_option= error_stop_mode;
else WARNING1("Ignoring unknown argument `%s' to --interaction",optarg);
}

/*:1764*//*1765:*/
#line 33188 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(ARGUMENT_IS("mktex"))kpse_maketex_option(optarg,true);
else if(ARGUMENT_IS("no-mktex"))kpse_maketex_option(optarg,false);


/*:1765*//*1766:*/
#line 33197 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(ARGUMENT_IS("kpathsea-debug"))
kpathsea_debug|= atoi(optarg);



/*:1766*//*1767:*/
#line 33206 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(ARGUMENT_IS("progname"))
user_progname= normalize_quotes(optarg,"program name");
else if(ARGUMENT_IS("fmt"))
dump_name= normalize_quotes(optarg,"format name");
else if(ARGUMENT_IS("output-directory"))
output_directory= normalize_quotes(optarg,"output directory");
else if(ARGUMENT_IS("jobname"))
c_job_name= normalize_quotes(optarg,"job name");

/*:1767*//*1780:*/
#line 33448 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(ARGUMENT_IS("cnf-line"))
add_cnf_line(optarg);

/*:1780*//*1783:*/
#line 33481 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

else if(ARGUMENT_IS("resolution"))
{option_dpi_str= optarg;
option_dpi= strtol(option_dpi_str,NULL,10);
}
else if(ARGUMENT_IS("mfmode"))
option_mfmode= optarg;
#ifdef DEBUG
else if(ARGUMENT_IS("hint-debug"))
debugflags= strtol(optarg,NULL,16);
else if(ARGUMENT_IS("hint-debug-help"))
{fprintf(stderr,
"To generate HINT format debug output use the option\n"
" -hint-debug=XX"
"\t\t XX is a hexadecimal value. OR together these values:\n");
fprintf(stderr,"\t XX=%04X \t basic debugging\n",DBGBASIC);
fprintf(stderr,"\t XX=%04X \t tag debugging\n",DBGTAGS);
fprintf(stderr,"\t XX=%04X \t node debugging\n",DBGNODE);
fprintf(stderr,"\t XX=%04X \t definition debugging\n",DBGDEF);
fprintf(stderr,"\t XX=%04X \t directory debugging\n",DBGDIR);
fprintf(stderr,"\t XX=%04X \t range debugging\n",DBGRANGE);
fprintf(stderr,"\t XX=%04X \t float debugging\n",DBGFLOAT);
fprintf(stderr,"\t XX=%04X \t compression debugging\n",DBGCOMPRESS);
fprintf(stderr,"\t XX=%04X \t buffer debugging\n",DBGBUFFER);
fprintf(stderr,"\t XX=%04X \t TeX debugging\n",DBGTEX);
fprintf(stderr,"\t XX=%04X \t page debugging\n",DBGPAGE);
fprintf(stderr,"\t XX=%04X \t font debugging\n",DBGFONT);
#if 0 
fprintf(stderr,"\t XX=%04X \t render debugging\n",DBGRENDER);
#endif
#line 33511 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
 fprintf(stderr,"\t XX=%04X \t label debugging\n",DBGLABEL);
exit(0);
}
#endif
#line 33515 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1783*/
#line 33103 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
}
else if(g=='?')
{fprintf(stderr,"Try '%s --help' for more information\n",argv[0]);
exit(1);
}
else if(g==-1)break;
}
/*1769:*/
#line 33255 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(output_directory)
xputenv("TEXMF_OUTPUT_DIRECTORY",output_directory);
else if(getenv("TEXMF_OUTPUT_DIRECTORY"))
output_directory= getenv("TEXMF_OUTPUT_DIRECTORY");

/*:1769*/
#line 33110 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

}

/*:1759*//*1795:*/
#line 33802 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static FILE*open_out(const char*file_name,const char*file_mode)
{FILE*f= NULL;
char*new_name= NULL;
int absolute= kpse_absolute_p(file_name,false);
if(absolute)
{f= fopen(file_name,file_mode);
if(f!=NULL)recorder_record_output(file_name);
return f;
}
if(output_directory)
{new_name= concat3(output_directory,DIR_SEP_STRING,file_name);
f= fopen(new_name,file_mode);
if(f==NULL){free(new_name);new_name= NULL;}
}
if(f==NULL)
f= fopen(file_name,file_mode);
if(f==NULL)
{const char*texmfoutput= kpse_var_value("TEXMFOUTPUT");
if(texmfoutput!=NULL&&texmfoutput[0]!=0)
{new_name= concat3(texmfoutput,DIR_SEP_STRING,file_name);
f= fopen(new_name,file_mode);
if(f==NULL){free(new_name);new_name= NULL;}
}
}
if(f!=NULL&&new_name!=NULL)
update_name_of_file(new_name,(int)strlen(new_name));
if(f!=NULL)recorder_record_output((char*)name_of_file+1);
if(new_name!=NULL)free(new_name);
return f;
}

static bool a_open_out(alpha_file*f)
{f->f= open_out((char*)name_of_file+1,"w");
return f->f!=NULL&&ferror(f->f)==0;
}

#ifdef INIT
static bool w_open_out(word_file*f)
{f->f= open_out((char*)name_of_file+1,"wb");
return f->f!=NULL&&ferror(f->f)==0;
}
#endif
#line 33845 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1795*//*1798:*/
#line 33920 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static bool open_fmt_file(void)
{int j= loc;
if(buffer[loc]=='&')
{incr(loc);j= loc;buffer[last]= ' ';
while(buffer[j]!=' ')incr(j);
update_name_of_file((char*)buffer+loc,j-loc);
if(w_open_in(&fmt_file))goto found;
}
update_name_of_file(dump_name,(int)strlen(dump_name));
if(w_open_in(&fmt_file))goto found;
name_of_file[1]= 0;
wake_up_terminal;
wterm_ln("I can't find a format file!");
return false;
found:loc= j;return true;
}


/*:1798*/
#line 32886 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


/*:1751*//*1808:*/
#line 34272 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static int utf8_get_cur_chr(unsigned char*b,int i,int k)
{uint8_t d;
/*1803:*/
#line 34191 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_chr= b[i];incr(i);
if(cur_chr<0x80||i>=k)return i;

/*:1803*/
#line 34274 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1804:*/
#line 34201 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((cur_chr&0xE0)==0xC0)
{/*1805:*/
#line 34213 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(i<k)
{d= b[i];incr(i);
if((d&0xC0)!=0x80&&scanner_status!=skipping)
{print_err("Invalid UTF8 continuation byte in the input");
int_error(d);
return i;
}
}
else if(scanner_status!=skipping)
{print_err("Missing UTF8 continuation byte in the input");
error();
return i;
}

/*:1805*/
#line 34203 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_chr= ((cur_chr&0x1F)<<6)+(d&0x3F);
return i;
}

/*:1804*/
#line 34275 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1806:*/
#line 34232 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((cur_chr&0xF0)==0xE0)
{/*1805:*/
#line 34213 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(i<k)
{d= b[i];incr(i);
if((d&0xC0)!=0x80&&scanner_status!=skipping)
{print_err("Invalid UTF8 continuation byte in the input");
int_error(d);
return i;
}
}
else if(scanner_status!=skipping)
{print_err("Missing UTF8 continuation byte in the input");
error();
return i;
}

/*:1805*/
#line 34234 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_chr= ((cur_chr&0x0F)<<6)+(d&0x3F);
/*1805:*/
#line 34213 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(i<k)
{d= b[i];incr(i);
if((d&0xC0)!=0x80&&scanner_status!=skipping)
{print_err("Invalid UTF8 continuation byte in the input");
int_error(d);
return i;
}
}
else if(scanner_status!=skipping)
{print_err("Missing UTF8 continuation byte in the input");
error();
return i;
}

/*:1805*/
#line 34236 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_chr= (cur_chr<<6)+(d&0x3F);
return i;
}

/*:1806*/
#line 34276 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1807:*/
#line 34247 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if((cur_chr&0xF8)==0xF0)
{/*1805:*/
#line 34213 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(i<k)
{d= b[i];incr(i);
if((d&0xC0)!=0x80&&scanner_status!=skipping)
{print_err("Invalid UTF8 continuation byte in the input");
int_error(d);
return i;
}
}
else if(scanner_status!=skipping)
{print_err("Missing UTF8 continuation byte in the input");
error();
return i;
}

/*:1805*/
#line 34249 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_chr= ((cur_chr&0x07)<<6)+(d&0x3F);
/*1805:*/
#line 34213 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(i<k)
{d= b[i];incr(i);
if((d&0xC0)!=0x80&&scanner_status!=skipping)
{print_err("Invalid UTF8 continuation byte in the input");
int_error(d);
return i;
}
}
else if(scanner_status!=skipping)
{print_err("Missing UTF8 continuation byte in the input");
error();
return i;
}

/*:1805*/
#line 34251 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_chr= (cur_chr<<6)+(d&0x3F);
/*1805:*/
#line 34213 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

if(i<k)
{d= b[i];incr(i);
if((d&0xC0)!=0x80&&scanner_status!=skipping)
{print_err("Invalid UTF8 continuation byte in the input");
int_error(d);
return i;
}
}
else if(scanner_status!=skipping)
{print_err("Missing UTF8 continuation byte in the input");
error();
return i;
}

/*:1805*/
#line 34253 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

cur_chr= (cur_chr<<6)+(d&0x3F);
if(cur_chr> 0x10FFFF&&scanner_status!=skipping)
{print_err("UTF8 code out of range in the input");
int_error(cur_chr);
cur_chr= biggest_char;
}
return i;
}


/*:1807*/
#line 34277 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

print_err("Malformed UTF8 code in the input; character ignored");
cur_chr= biggest_char;
return i;
}

/*:1808*//*1809:*/
#line 34296 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int utf8_put_char(unsigned char*b,int i,int k,uint32_t c)
{if(i+4> k)
overflow("utf8 buffer size",k);
if(c<0x80)
{b[i++]= c;}
else if(c<0x800)
{b[i++]= 0xC0|(c>>6);b[i++]= 0x80|(c&0x3F);}
else if(c<0x10000)
{b[i++]= (0xE0|(c>>12));b[i++]= (0x80|((c>>6)&0x3F));
b[i++]= (0x80|(c&0x3F));}
else if(c<0x180000)
{b[i++]= (0xF0|(c>>18));b[i++]= (0x80|((c>>12)&0x3F));
b[i++]= (0x80|((c>>6)&0x3F));b[i++]= (0x80|(c&0x3F));}
return i;
}

static void print_utf8(uint32_t c)
{if(c<0x80)
{print_char(c);}
else if(c<0x800)
{print_char(0xC0|(c>>6));print_char(0x80|(c&0x3F));}
else if(c<0x10000)
{print_char(0xE0|(c>>12));print_char(0x80|((c>>6)&0x3F));
print_char(0x80|(c&0x3F));}
else if(c<0x180000)
{print_char(0xF0|(c>>18));print_char(0x80|((c>>12)&0x3F));
print_char(0x80|((c>>6)&0x3F));print_char(0x80|(c&0x3F));}
else
print("???");
}


/*:1809*//*1810:*/
#line 34331 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


#include "hitex.dat.c"

/*:1810*//*1811:*/
#line 34342 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static int utf_lookup(pointer b,int i)
{if(b==utf_lc_code_base)return utf_lccode(i);
else if(b==utf_uc_code_base)return utf_uccode(i);
else if(i<0x100)
{if(b==utf_cat_code_base)return equiv(cat_code_base+i);
else if(b==utf_sf_code_base)return equiv(sf_code_base+i);
else if(b==utf_del_code_base)return equiv(del_code_base+i);
else if(b==utf_math_codenum_base)return equiv(math_code_base+i);
else if(b==utf_math_code_base)return equiv(math_code_base+i);
else return 0;
}
else if(b==utf_cat_code_base)return utf_catcode(i);
else if(b==utf_sf_code_base)return utf_sfcode(i);
else if(b==utf_math_code_base)return utf_mathcode(i);
else if(b==utf_math_codenum_base)return utf_mathcode(i);
else if(b==utf_del_code_base)return utf_delcode(i);
else return 0;
}

/*:1811*//*1815:*/
#line 34460 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static int utf_unsave_list= 0;
static void utf_save(pointer p,int cp,int e)
{if(cur_level> level_one)
{check_full_save_stack;
save_stack[save_ptr].i= e;
incr(save_ptr);
save_type(save_ptr)= restore_utf;
save_level(save_ptr)= utf_unsave_list;
utf_unsave_list= save_ptr;
save_index(save_ptr)= p+cp;
incr(save_ptr);
}
}

static void utf_unsave(pointer p)
{int cp,e;
utf_unsave_list= save_level(save_ptr);
decr(save_ptr);
e= save_stack[save_ptr].i;
cp= p&utf_cp_mask;
p= p&utf_base_mask;
if(p==utf_cat_code_base)utf_set_catcode(cp,e);
else if(p==utf_lc_code_base)utf_set_lccode(cp,e);
else if(p==utf_uc_code_base)utf_set_uccode(cp,e);
else if(p==utf_sf_code_base)utf_set_sfcode(cp,e);
else if(p==utf_del_code_base)utf_set_delcode(cp,e);
else if(p==utf_math_codenum_base)utf_set_mathcode(cp,e);
}

static void utf_global(pointer p)
{
int i= utf_unsave_list;
while(i> 0)
{if(save_type(i)==restore_utf&&save_index(i)==p)
save_type(i)= restore_utf_none;
i= save_level(i);
}
}


static void utf_define(pointer p,int cp,int e,bool g)
{if(g)assign_trace(p,"globally changing")
else assign_trace(p,"changing")
if(p==utf_cat_code_base)e= utf_set_catcode(cp,e);
else if(p==utf_lc_code_base)e= utf_set_lccode(cp,e);
else if(p==utf_uc_code_base)e= utf_set_uccode(cp,e);
else if(p==utf_sf_code_base)e= utf_set_sfcode(cp,e);
else if(p==utf_del_code_base)e= utf_set_delcode(cp,e);
else if(p==utf_math_codenum_base)e= utf_set_mathcode(cp,e);
if(g)utf_global(p+cp);
else utf_save(p,cp,e);
assign_trace(p,"into")
}

/*:1815*//*1816:*/
#line 34519 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
static pointer utf_adjust_base(pointer p)
{if(p==utf_cat_code_base)p= cat_code_base;
else if(p==utf_sf_code_base)p= sf_code_base;
else if(p==utf_math_codenum_base)p= math_code_base;
else if(p==utf_math_code_base)p= math_code_base;
else if(p==utf_del_code_base)p= del_code_base;
return p;
}


/*:1816*//*1817:*/
#line 34529 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

#if 0 
static void utf_restore(pointer p,int e)
{if(p<utf_lc_code_base)utf_set_catcode(p-utf_cat_code_base,e);
else if(p<utf_uc_code_base)utf_set_lccode(p-utf_lc_code_base,e);
else if(p<utf_sf_code_base)utf_set_uccode(p-utf_uc_code_base,e);
else if(p<utf_code_limit)utf_set_sfcode(p-utf_sf_code_base,e);
#ifdef STAT
if(tracing_restores> 0)restore_trace(p,"retaining");
#endif
#line 34539 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"
}
#endif
#line 34541 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*:1817*//*1820:*/
#line 34599 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static pointer active_lookup(uint32_t key)
{int h,h2;
pointer p;
h= active_h1(key);
p= h+active_hash_base;
if(active_hash[p]==key)return p;
else if(active_hash[p]==0)goto insert_key;
h2= active_h2(key);
loop{
h= (h+h2)&active_mask;
p= h+active_hash_base;
if(active_hash[p]==key)return p;
else if(active_hash[p]==0)goto insert_key;
}
insert_key:
active_used++;
if(active_used>=active_hash_size)
overflow("active characters hash size",active_hash_size);
active_hash[p]= key;
return p;
}


/*:1820*//*1827:*/
#line 34759 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

/*1854:*/
#line 35371 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"


static bool x_glyph(internal_font_number g,int c,hb_codepoint_t*glyph)
{
return hb_font_get_nominal_glyph(x_font[g]->f,c,glyph);
}

static bool x_char_exists(internal_font_number g,int c)
{if(font_bc[g]> c||c> font_ec[g])
return false;
else
{hb_codepoint_t glyph;
return x_glyph(g,c,&glyph);
}
}


static scaled x_glyph_width(internal_font_number g,hb_codepoint_t glyph)
{return HB_TO_SCALED(hb_font_get_glyph_h_advance(x_font[g]->f,glyph));
}

static scaled x_char_width(internal_font_number g,int c)
{hb_codepoint_t glyph;
if(x_glyph(g,c,&glyph))
return x_glyph_width(g,glyph);
else
return 0;
}

/*:1854*//*1855:*/
#line 35406 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"

static void x_glyph_height_depth(internal_font_number g,hb_codepoint_t glyph,
scaled*h,scaled*d)
{hb_glyph_extents_t e;
hb_font_get_glyph_extents(x_font[g]->f,glyph,&e);
*h= HB_TO_SCALED(e.y_bearing);
*d= HB_TO_SCALED(-(e.height+e.y_bearing));
}


static void x_char_height_depth(internal_font_number g,int c,
scaled*h,scaled*d)
{hb_codepoint_t glyph;
if(x_glyph(g,c,&glyph))
x_glyph_height_depth(g,glyph,h,d);
else
*h= *d= 0;
}


static scaled x_char_height(internal_font_number g,int c)
{hb_glyph_extents_t e;
hb_codepoint_t glyph;
if(x_glyph(g,c,&glyph))
{hb_font_get_glyph_extents(x_font[g]->f,glyph,&e);
return HB_TO_SCALED(e.y_bearing);
}
else
return 0;
}

static scaled x_char_depth(internal_font_number g,int c)
{hb_glyph_extents_t e;
hb_codepoint_t glyph;
if(x_glyph(g,c,&glyph))
{hb_font_get_glyph_extents(x_font[g]->f,glyph,&e);
return HB_TO_SCALED(-(e.height+e.y_bearing));
}
else
return 0;
}



static scaled x_glyph_italic(internal_font_number g,hb_codepoint_t glyph)
{hb_position_t a,b;
hb_glyph_extents_t e;
hb_font_get_glyph_extents(x_font[g]->f,glyph,&e);
b= hb_font_get_glyph_h_advance(x_font[g]->f,glyph);
a= e.x_bearing+e.width-b;
if(a<0)a= 0;
return HB_TO_SCALED(a);
}

static scaled x_char_italic(internal_font_number g,int c)
{hb_codepoint_t glyph;
if(x_glyph(g,c,&glyph))
{return x_glyph_italic(g,glyph);
}
else
return 0;
}


/*:1855*/
#line 34760 "../../../texlive-source/texk/web2c/hitexdir/hitex.w"




/*:1827*/
