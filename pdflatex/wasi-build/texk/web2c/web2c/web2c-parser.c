/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 24 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"

#include "web2c.h"

#define YYDEBUG 1

#define	symbol(x)	sym_table[x].id
#define	MAX_ARGS	50

static char fn_return_type[50], for_stack[300], control_var[50],
            relation[3];
static char arg_type[MAX_ARGS][30];
static int last_type = -1, ids_typed;
static int proc_is_noreturn = 0;
char my_routine[100];	/* Name of routine being parsed, if any */
static char array_bounds[80], array_offset[80];
static int uses_mem, uses_eqtb, lower_sym, upper_sym;
static FILE *orig_out;
boolean doing_statements = false;
static boolean var_formals = false;
static int param_id_list[MAX_ARGS], ids_paramed=0;

extern char conditional[], temp[], *std_header;
extern int tex, mf, strict_for;
extern FILE *coerce;
extern char coerce_name[];
extern string program_name;
extern boolean debug;

static long my_labs (long);
static void compute_array_bounds (void);
static void fixup_var_list (void);
static void do_proc_args (void);
static void gen_function_head (void);
static boolean doreturn (string);

#line 107 "web2c-parser.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
#ifndef YY_YY_WEB_C_PARSER_H_INCLUDED
# define YY_YY_WEB_C_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    array_tok = 258,               /* array_tok  */
    begin_tok = 259,               /* begin_tok  */
    case_tok = 260,                /* case_tok  */
    const_tok = 261,               /* const_tok  */
    do_tok = 262,                  /* do_tok  */
    downto_tok = 263,              /* downto_tok  */
    else_tok = 264,                /* else_tok  */
    end_tok = 265,                 /* end_tok  */
    file_tok = 266,                /* file_tok  */
    for_tok = 267,                 /* for_tok  */
    function_tok = 268,            /* function_tok  */
    goto_tok = 269,                /* goto_tok  */
    if_tok = 270,                  /* if_tok  */
    label_tok = 271,               /* label_tok  */
    of_tok = 272,                  /* of_tok  */
    procedure_tok = 273,           /* procedure_tok  */
    program_tok = 274,             /* program_tok  */
    record_tok = 275,              /* record_tok  */
    repeat_tok = 276,              /* repeat_tok  */
    then_tok = 277,                /* then_tok  */
    to_tok = 278,                  /* to_tok  */
    type_tok = 279,                /* type_tok  */
    until_tok = 280,               /* until_tok  */
    var_tok = 281,                 /* var_tok  */
    while_tok = 282,               /* while_tok  */
    noreturn_tok = 283,            /* noreturn_tok  */
    others_tok = 284,              /* others_tok  */
    r_num_tok = 285,               /* r_num_tok  */
    i_num_tok = 286,               /* i_num_tok  */
    string_literal_tok = 287,      /* string_literal_tok  */
    single_char_tok = 288,         /* single_char_tok  */
    assign_tok = 289,              /* assign_tok  */
    two_dots_tok = 290,            /* two_dots_tok  */
    undef_id_tok = 291,            /* undef_id_tok  */
    var_id_tok = 292,              /* var_id_tok  */
    proc_id_tok = 293,             /* proc_id_tok  */
    proc_param_tok = 294,          /* proc_param_tok  */
    fun_id_tok = 295,              /* fun_id_tok  */
    fun_param_tok = 296,           /* fun_param_tok  */
    const_id_tok = 297,            /* const_id_tok  */
    type_id_tok = 298,             /* type_id_tok  */
    hhb0_tok = 299,                /* hhb0_tok  */
    hhb1_tok = 300,                /* hhb1_tok  */
    field_id_tok = 301,            /* field_id_tok  */
    define_tok = 302,              /* define_tok  */
    field_tok = 303,               /* field_tok  */
    break_tok = 304,               /* break_tok  */
    not_eq_tok = 305,              /* not_eq_tok  */
    less_eq_tok = 306,             /* less_eq_tok  */
    great_eq_tok = 307,            /* great_eq_tok  */
    or_tok = 308,                  /* or_tok  */
    unary_plus_tok = 309,          /* unary_plus_tok  */
    unary_minus_tok = 310,         /* unary_minus_tok  */
    div_tok = 311,                 /* div_tok  */
    mod_tok = 312,                 /* mod_tok  */
    and_tok = 313,                 /* and_tok  */
    not_tok = 314                  /* not_tok  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define array_tok 258
#define begin_tok 259
#define case_tok 260
#define const_tok 261
#define do_tok 262
#define downto_tok 263
#define else_tok 264
#define end_tok 265
#define file_tok 266
#define for_tok 267
#define function_tok 268
#define goto_tok 269
#define if_tok 270
#define label_tok 271
#define of_tok 272
#define procedure_tok 273
#define program_tok 274
#define record_tok 275
#define repeat_tok 276
#define then_tok 277
#define to_tok 278
#define type_tok 279
#define until_tok 280
#define var_tok 281
#define while_tok 282
#define noreturn_tok 283
#define others_tok 284
#define r_num_tok 285
#define i_num_tok 286
#define string_literal_tok 287
#define single_char_tok 288
#define assign_tok 289
#define two_dots_tok 290
#define undef_id_tok 291
#define var_id_tok 292
#define proc_id_tok 293
#define proc_param_tok 294
#define fun_id_tok 295
#define fun_param_tok 296
#define const_id_tok 297
#define type_id_tok 298
#define hhb0_tok 299
#define hhb1_tok 300
#define field_id_tok 301
#define define_tok 302
#define field_tok 303
#define break_tok 304
#define not_eq_tok 305
#define less_eq_tok 306
#define great_eq_tok 307
#define or_tok 308
#define unary_plus_tok 309
#define unary_minus_tok 310
#define div_tok 311
#define mod_tok 312
#define and_tok 313
#define not_tok 314

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_WEB_C_PARSER_H_INCLUDED  */
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_array_tok = 3,                  /* array_tok  */
  YYSYMBOL_begin_tok = 4,                  /* begin_tok  */
  YYSYMBOL_case_tok = 5,                   /* case_tok  */
  YYSYMBOL_const_tok = 6,                  /* const_tok  */
  YYSYMBOL_do_tok = 7,                     /* do_tok  */
  YYSYMBOL_downto_tok = 8,                 /* downto_tok  */
  YYSYMBOL_else_tok = 9,                   /* else_tok  */
  YYSYMBOL_end_tok = 10,                   /* end_tok  */
  YYSYMBOL_file_tok = 11,                  /* file_tok  */
  YYSYMBOL_for_tok = 12,                   /* for_tok  */
  YYSYMBOL_function_tok = 13,              /* function_tok  */
  YYSYMBOL_goto_tok = 14,                  /* goto_tok  */
  YYSYMBOL_if_tok = 15,                    /* if_tok  */
  YYSYMBOL_label_tok = 16,                 /* label_tok  */
  YYSYMBOL_of_tok = 17,                    /* of_tok  */
  YYSYMBOL_procedure_tok = 18,             /* procedure_tok  */
  YYSYMBOL_program_tok = 19,               /* program_tok  */
  YYSYMBOL_record_tok = 20,                /* record_tok  */
  YYSYMBOL_repeat_tok = 21,                /* repeat_tok  */
  YYSYMBOL_then_tok = 22,                  /* then_tok  */
  YYSYMBOL_to_tok = 23,                    /* to_tok  */
  YYSYMBOL_type_tok = 24,                  /* type_tok  */
  YYSYMBOL_until_tok = 25,                 /* until_tok  */
  YYSYMBOL_var_tok = 26,                   /* var_tok  */
  YYSYMBOL_while_tok = 27,                 /* while_tok  */
  YYSYMBOL_noreturn_tok = 28,              /* noreturn_tok  */
  YYSYMBOL_others_tok = 29,                /* others_tok  */
  YYSYMBOL_r_num_tok = 30,                 /* r_num_tok  */
  YYSYMBOL_i_num_tok = 31,                 /* i_num_tok  */
  YYSYMBOL_string_literal_tok = 32,        /* string_literal_tok  */
  YYSYMBOL_single_char_tok = 33,           /* single_char_tok  */
  YYSYMBOL_assign_tok = 34,                /* assign_tok  */
  YYSYMBOL_two_dots_tok = 35,              /* two_dots_tok  */
  YYSYMBOL_undef_id_tok = 36,              /* undef_id_tok  */
  YYSYMBOL_var_id_tok = 37,                /* var_id_tok  */
  YYSYMBOL_proc_id_tok = 38,               /* proc_id_tok  */
  YYSYMBOL_proc_param_tok = 39,            /* proc_param_tok  */
  YYSYMBOL_fun_id_tok = 40,                /* fun_id_tok  */
  YYSYMBOL_fun_param_tok = 41,             /* fun_param_tok  */
  YYSYMBOL_const_id_tok = 42,              /* const_id_tok  */
  YYSYMBOL_type_id_tok = 43,               /* type_id_tok  */
  YYSYMBOL_hhb0_tok = 44,                  /* hhb0_tok  */
  YYSYMBOL_hhb1_tok = 45,                  /* hhb1_tok  */
  YYSYMBOL_field_id_tok = 46,              /* field_id_tok  */
  YYSYMBOL_define_tok = 47,                /* define_tok  */
  YYSYMBOL_field_tok = 48,                 /* field_tok  */
  YYSYMBOL_break_tok = 49,                 /* break_tok  */
  YYSYMBOL_50_ = 50,                       /* '='  */
  YYSYMBOL_not_eq_tok = 51,                /* not_eq_tok  */
  YYSYMBOL_52_ = 52,                       /* '<'  */
  YYSYMBOL_53_ = 53,                       /* '>'  */
  YYSYMBOL_less_eq_tok = 54,               /* less_eq_tok  */
  YYSYMBOL_great_eq_tok = 55,              /* great_eq_tok  */
  YYSYMBOL_56_ = 56,                       /* '+'  */
  YYSYMBOL_57_ = 57,                       /* '-'  */
  YYSYMBOL_or_tok = 58,                    /* or_tok  */
  YYSYMBOL_unary_plus_tok = 59,            /* unary_plus_tok  */
  YYSYMBOL_unary_minus_tok = 60,           /* unary_minus_tok  */
  YYSYMBOL_61_ = 61,                       /* '*'  */
  YYSYMBOL_62_ = 62,                       /* '/'  */
  YYSYMBOL_div_tok = 63,                   /* div_tok  */
  YYSYMBOL_mod_tok = 64,                   /* mod_tok  */
  YYSYMBOL_and_tok = 65,                   /* and_tok  */
  YYSYMBOL_not_tok = 66,                   /* not_tok  */
  YYSYMBOL_67_ = 67,                       /* ';'  */
  YYSYMBOL_68_ = 68,                       /* '('  */
  YYSYMBOL_69_ = 69,                       /* ')'  */
  YYSYMBOL_70_ = 70,                       /* ','  */
  YYSYMBOL_71_ = 71,                       /* '^'  */
  YYSYMBOL_72_ = 72,                       /* '['  */
  YYSYMBOL_73_ = 73,                       /* ']'  */
  YYSYMBOL_74_ = 74,                       /* ':'  */
  YYSYMBOL_75_ = 75,                       /* '.'  */
  YYSYMBOL_YYACCEPT = 76,                  /* $accept  */
  YYSYMBOL_PROGRAM = 77,                   /* PROGRAM  */
  YYSYMBOL_78_1 = 78,                      /* $@1  */
  YYSYMBOL_79_2 = 79,                      /* $@2  */
  YYSYMBOL_DEFS = 80,                      /* DEFS  */
  YYSYMBOL_DEF = 81,                       /* DEF  */
  YYSYMBOL_PROGRAM_HEAD = 82,              /* PROGRAM_HEAD  */
  YYSYMBOL_PROGRAM_FILE_PART = 83,         /* PROGRAM_FILE_PART  */
  YYSYMBOL_PROGRAM_FILE_LIST = 84,         /* PROGRAM_FILE_LIST  */
  YYSYMBOL_PROGRAM_FILE = 85,              /* PROGRAM_FILE  */
  YYSYMBOL_BLOCK = 86,                     /* BLOCK  */
  YYSYMBOL_87_3 = 87,                      /* $@3  */
  YYSYMBOL_88_4 = 88,                      /* $@4  */
  YYSYMBOL_89_5 = 89,                      /* $@5  */
  YYSYMBOL_LABEL_DEC_PART = 90,            /* LABEL_DEC_PART  */
  YYSYMBOL_91_6 = 91,                      /* $@6  */
  YYSYMBOL_LABEL_LIST = 92,                /* LABEL_LIST  */
  YYSYMBOL_LABEL = 93,                     /* LABEL  */
  YYSYMBOL_CONST_DEC_PART = 94,            /* CONST_DEC_PART  */
  YYSYMBOL_CONST_DEC_LIST = 95,            /* CONST_DEC_LIST  */
  YYSYMBOL_CONST_DEC = 96,                 /* CONST_DEC  */
  YYSYMBOL_97_7 = 97,                      /* $@7  */
  YYSYMBOL_98_8 = 98,                      /* $@8  */
  YYSYMBOL_99_9 = 99,                      /* $@9  */
  YYSYMBOL_100_10 = 100,                   /* $@10  */
  YYSYMBOL_CONSTANT = 101,                 /* CONSTANT  */
  YYSYMBOL_CONSTANT_EXPRESS = 102,         /* CONSTANT_EXPRESS  */
  YYSYMBOL_103_11 = 103,                   /* $@11  */
  YYSYMBOL_104_12 = 104,                   /* $@12  */
  YYSYMBOL_105_13 = 105,                   /* $@13  */
  YYSYMBOL_106_14 = 106,                   /* $@14  */
  YYSYMBOL_107_15 = 107,                   /* $@15  */
  YYSYMBOL_108_16 = 108,                   /* $@16  */
  YYSYMBOL_109_17 = 109,                   /* $@17  */
  YYSYMBOL_110_18 = 110,                   /* $@18  */
  YYSYMBOL_111_19 = 111,                   /* $@19  */
  YYSYMBOL_112_20 = 112,                   /* $@20  */
  YYSYMBOL_113_21 = 113,                   /* $@21  */
  YYSYMBOL_114_22 = 114,                   /* $@22  */
  YYSYMBOL_115_23 = 115,                   /* $@23  */
  YYSYMBOL_116_24 = 116,                   /* $@24  */
  YYSYMBOL_CONST_FACTOR = 117,             /* CONST_FACTOR  */
  YYSYMBOL_118_25 = 118,                   /* $@25  */
  YYSYMBOL_STRING = 119,                   /* STRING  */
  YYSYMBOL_CONSTANT_ID = 120,              /* CONSTANT_ID  */
  YYSYMBOL_TYPE_DEC_PART = 121,            /* TYPE_DEC_PART  */
  YYSYMBOL_TYPE_DEF_LIST = 122,            /* TYPE_DEF_LIST  */
  YYSYMBOL_TYPE_DEF = 123,                 /* TYPE_DEF  */
  YYSYMBOL_124_26 = 124,                   /* $@26  */
  YYSYMBOL_125_27 = 125,                   /* $@27  */
  YYSYMBOL_126_28 = 126,                   /* $@28  */
  YYSYMBOL_TYPE = 127,                     /* TYPE  */
  YYSYMBOL_SIMPLE_TYPE = 128,              /* SIMPLE_TYPE  */
  YYSYMBOL_SUBRANGE_TYPE = 129,            /* SUBRANGE_TYPE  */
  YYSYMBOL_POSSIBLE_PLUS = 130,            /* POSSIBLE_PLUS  */
  YYSYMBOL_SUBRANGE_CONSTANT = 131,        /* SUBRANGE_CONSTANT  */
  YYSYMBOL_TYPE_ID = 132,                  /* TYPE_ID  */
  YYSYMBOL_STRUCTURED_TYPE = 133,          /* STRUCTURED_TYPE  */
  YYSYMBOL_POINTER_TYPE = 134,             /* POINTER_TYPE  */
  YYSYMBOL_ARRAY_TYPE = 135,               /* ARRAY_TYPE  */
  YYSYMBOL_INDEX_TYPE = 136,               /* INDEX_TYPE  */
  YYSYMBOL_COMPONENT_TYPE = 137,           /* COMPONENT_TYPE  */
  YYSYMBOL_RECORD_TYPE = 138,              /* RECORD_TYPE  */
  YYSYMBOL_139_29 = 139,                   /* $@29  */
  YYSYMBOL_FIELD_LIST = 140,               /* FIELD_LIST  */
  YYSYMBOL_RECORD_SECTION = 141,           /* RECORD_SECTION  */
  YYSYMBOL_142_30 = 142,                   /* $@30  */
  YYSYMBOL_143_31 = 143,                   /* $@31  */
  YYSYMBOL_FIELD_ID_LIST = 144,            /* FIELD_ID_LIST  */
  YYSYMBOL_FIELD_ID = 145,                 /* FIELD_ID  */
  YYSYMBOL_FILE_TYPE = 146,                /* FILE_TYPE  */
  YYSYMBOL_147_32 = 147,                   /* $@32  */
  YYSYMBOL_VAR_DEC_PART = 148,             /* VAR_DEC_PART  */
  YYSYMBOL_VAR_DEC_LIST = 149,             /* VAR_DEC_LIST  */
  YYSYMBOL_VAR_DEC = 150,                  /* VAR_DEC  */
  YYSYMBOL_151_33 = 151,                   /* $@33  */
  YYSYMBOL_152_34 = 152,                   /* $@34  */
  YYSYMBOL_VAR_ID_DEC_LIST = 153,          /* VAR_ID_DEC_LIST  */
  YYSYMBOL_VAR_ID = 154,                   /* VAR_ID  */
  YYSYMBOL_BODY = 155,                     /* BODY  */
  YYSYMBOL_156_35 = 156,                   /* $@35  */
  YYSYMBOL_P_F_DEC_PART = 157,             /* P_F_DEC_PART  */
  YYSYMBOL_P_F_DEC = 158,                  /* P_F_DEC  */
  YYSYMBOL_PROCEDURE_DEC = 159,            /* PROCEDURE_DEC  */
  YYSYMBOL_PROCEDURE_TOK = 160,            /* PROCEDURE_TOK  */
  YYSYMBOL_161_36 = 161,                   /* $@36  */
  YYSYMBOL_PROCEDURE_HEAD = 162,           /* PROCEDURE_HEAD  */
  YYSYMBOL_163_37 = 163,                   /* $@37  */
  YYSYMBOL_164_38 = 164,                   /* $@38  */
  YYSYMBOL_PARAM = 165,                    /* PARAM  */
  YYSYMBOL_166_39 = 166,                   /* $@39  */
  YYSYMBOL_FORM_PAR_SEC_L = 167,           /* FORM_PAR_SEC_L  */
  YYSYMBOL_FORM_PAR_SEC1 = 168,            /* FORM_PAR_SEC1  */
  YYSYMBOL_169_40 = 169,                   /* $@40  */
  YYSYMBOL_FORM_PAR_SEC = 170,             /* FORM_PAR_SEC  */
  YYSYMBOL_171_41 = 171,                   /* $@41  */
  YYSYMBOL_172_42 = 172,                   /* $@42  */
  YYSYMBOL_DECLARED_PROC = 173,            /* DECLARED_PROC  */
  YYSYMBOL_FUNCTION_DEC = 174,             /* FUNCTION_DEC  */
  YYSYMBOL_FUNCTION_HEAD = 175,            /* FUNCTION_HEAD  */
  YYSYMBOL_176_43 = 176,                   /* $@43  */
  YYSYMBOL_177_44 = 177,                   /* $@44  */
  YYSYMBOL_178_45 = 178,                   /* $@45  */
  YYSYMBOL_179_46 = 179,                   /* $@46  */
  YYSYMBOL_180_47 = 180,                   /* $@47  */
  YYSYMBOL_181_48 = 181,                   /* $@48  */
  YYSYMBOL_DECLARED_FUN = 182,             /* DECLARED_FUN  */
  YYSYMBOL_RESULT_TYPE = 183,              /* RESULT_TYPE  */
  YYSYMBOL_STAT_PART = 184,                /* STAT_PART  */
  YYSYMBOL_COMPOUND_STAT = 185,            /* COMPOUND_STAT  */
  YYSYMBOL_186_49 = 186,                   /* $@49  */
  YYSYMBOL_STAT_LIST = 187,                /* STAT_LIST  */
  YYSYMBOL_STATEMENT = 188,                /* STATEMENT  */
  YYSYMBOL_S_LABEL = 189,                  /* S_LABEL  */
  YYSYMBOL_UNLAB_STAT = 190,               /* UNLAB_STAT  */
  YYSYMBOL_SIMPLE_STAT = 191,              /* SIMPLE_STAT  */
  YYSYMBOL_ASSIGN_STAT = 192,              /* ASSIGN_STAT  */
  YYSYMBOL_193_50 = 193,                   /* $@50  */
  YYSYMBOL_194_51 = 194,                   /* $@51  */
  YYSYMBOL_VARIABLE = 195,                 /* VARIABLE  */
  YYSYMBOL_196_52 = 196,                   /* @52  */
  YYSYMBOL_FUNC_ID_AS = 197,               /* FUNC_ID_AS  */
  YYSYMBOL_VAR_DESIG_LIST = 198,           /* VAR_DESIG_LIST  */
  YYSYMBOL_VAR_DESIG = 199,                /* VAR_DESIG  */
  YYSYMBOL_200_53 = 200,                   /* $@53  */
  YYSYMBOL_VAR_DESIG1 = 201,               /* VAR_DESIG1  */
  YYSYMBOL_202_54 = 202,                   /* $@54  */
  YYSYMBOL_EXPRESS = 203,                  /* EXPRESS  */
  YYSYMBOL_204_55 = 204,                   /* $@55  */
  YYSYMBOL_205_56 = 205,                   /* $@56  */
  YYSYMBOL_206_57 = 206,                   /* $@57  */
  YYSYMBOL_207_58 = 207,                   /* $@58  */
  YYSYMBOL_208_59 = 208,                   /* $@59  */
  YYSYMBOL_209_60 = 209,                   /* $@60  */
  YYSYMBOL_210_61 = 210,                   /* $@61  */
  YYSYMBOL_211_62 = 211,                   /* $@62  */
  YYSYMBOL_212_63 = 212,                   /* $@63  */
  YYSYMBOL_213_64 = 213,                   /* $@64  */
  YYSYMBOL_214_65 = 214,                   /* $@65  */
  YYSYMBOL_215_66 = 215,                   /* $@66  */
  YYSYMBOL_216_67 = 216,                   /* $@67  */
  YYSYMBOL_217_68 = 217,                   /* $@68  */
  YYSYMBOL_UNARY_OP = 218,                 /* UNARY_OP  */
  YYSYMBOL_FACTOR = 219,                   /* FACTOR  */
  YYSYMBOL_220_69 = 220,                   /* $@69  */
  YYSYMBOL_221_70 = 221,                   /* $@70  */
  YYSYMBOL_PARAM_LIST = 222,               /* PARAM_LIST  */
  YYSYMBOL_223_71 = 223,                   /* $@71  */
  YYSYMBOL_ACTUAL_PARAM_L = 224,           /* ACTUAL_PARAM_L  */
  YYSYMBOL_225_72 = 225,                   /* $@72  */
  YYSYMBOL_ACTUAL_PARAM = 226,             /* ACTUAL_PARAM  */
  YYSYMBOL_WIDTH_FIELD = 227,              /* WIDTH_FIELD  */
  YYSYMBOL_PROC_STAT = 228,                /* PROC_STAT  */
  YYSYMBOL_229_73 = 229,                   /* $@73  */
  YYSYMBOL_GO_TO_STAT = 230,               /* GO_TO_STAT  */
  YYSYMBOL_EMPTY_STAT = 231,               /* EMPTY_STAT  */
  YYSYMBOL_STRUCT_STAT = 232,              /* STRUCT_STAT  */
  YYSYMBOL_CONDIT_STAT = 233,              /* CONDIT_STAT  */
  YYSYMBOL_IF_STATEMENT = 234,             /* IF_STATEMENT  */
  YYSYMBOL_235_74 = 235,                   /* $@74  */
  YYSYMBOL_IF_THEN_ELSE_STAT = 236,        /* IF_THEN_ELSE_STAT  */
  YYSYMBOL_237_75 = 237,                   /* $@75  */
  YYSYMBOL_THEN_ELSE_STAT = 238,           /* THEN_ELSE_STAT  */
  YYSYMBOL_239_76 = 239,                   /* $@76  */
  YYSYMBOL_240_77 = 240,                   /* $@77  */
  YYSYMBOL_241_78 = 241,                   /* $@78  */
  YYSYMBOL_ELSE_STAT = 242,                /* ELSE_STAT  */
  YYSYMBOL_243_79 = 243,                   /* $@79  */
  YYSYMBOL_CASE_STATEMENT = 244,           /* CASE_STATEMENT  */
  YYSYMBOL_245_80 = 245,                   /* $@80  */
  YYSYMBOL_246_81 = 246,                   /* $@81  */
  YYSYMBOL_CASE_EL_LIST = 247,             /* CASE_EL_LIST  */
  YYSYMBOL_CASE_ELEMENT = 248,             /* CASE_ELEMENT  */
  YYSYMBOL_CASE_LAB_LIST = 249,            /* CASE_LAB_LIST  */
  YYSYMBOL_CASE_LAB = 250,                 /* CASE_LAB  */
  YYSYMBOL_END_CASE = 251,                 /* END_CASE  */
  YYSYMBOL_REPETIT_STAT = 252,             /* REPETIT_STAT  */
  YYSYMBOL_WHILE_STATEMENT = 253,          /* WHILE_STATEMENT  */
  YYSYMBOL_254_82 = 254,                   /* $@82  */
  YYSYMBOL_255_83 = 255,                   /* $@83  */
  YYSYMBOL_REP_STATEMENT = 256,            /* REP_STATEMENT  */
  YYSYMBOL_257_84 = 257,                   /* $@84  */
  YYSYMBOL_258_85 = 258,                   /* $@85  */
  YYSYMBOL_FOR_STATEMENT = 259,            /* FOR_STATEMENT  */
  YYSYMBOL_260_86 = 260,                   /* $@86  */
  YYSYMBOL_261_87 = 261,                   /* $@87  */
  YYSYMBOL_262_88 = 262,                   /* $@88  */
  YYSYMBOL_CONTROL_VAR = 263,              /* CONTROL_VAR  */
  YYSYMBOL_FOR_LIST = 264,                 /* FOR_LIST  */
  YYSYMBOL_265_89 = 265,                   /* $@89  */
  YYSYMBOL_266_90 = 266,                   /* $@90  */
  YYSYMBOL_267_91 = 267,                   /* $@91  */
  YYSYMBOL_268_92 = 268                    /* $@92  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int16 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   562

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  76
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  193
/* YYNRULES -- Number of rules.  */
#define YYNRULES  315
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  492

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   314


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      68,    69,    61,    56,    70,    57,    75,    62,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    74,    67,
      52,    50,    53,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    72,     2,    73,    71,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    51,    54,    55,    58,    59,
      60,    63,    64,    65,    66
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    66,    66,    73,    64,    80,    82,    85,    90,    95,
     100,   105,   110,   115,   120,   129,   138,   142,   143,   147,
     148,   152,   153,   157,   162,   176,   157,   206,   208,   207,
     213,   214,   218,   221,   223,   228,   229,   233,   241,   245,
     246,   233,   251,   259,   260,   261,   265,   267,   267,   269,
     269,   271,   271,   273,   273,   275,   275,   277,   277,   279,
     279,   281,   281,   283,   283,   285,   285,   287,   287,   289,
     289,   291,   291,   293,   293,   295,   300,   299,   303,   307,
     313,   322,   325,   326,   329,   330,   334,   336,   343,   334,
     360,   361,   365,   398,   402,   405,   407,   411,   418,   425,
     434,   446,   460,   464,   465,   469,   476,   491,   492,   496,
     498,   508,   512,   511,   517,   518,   522,   524,   522,   542,
     545,   546,   549,   561,   575,   574,   580,   582,   586,   587,
     591,   599,   591,   607,   608,   611,   625,   639,   655,   658,
     657,   670,   671,   674,   676,   681,   684,   686,   685,   692,
     691,   708,   707,   724,   730,   729,   741,   742,   746,   746,
     762,   762,   763,   763,   767,   768,   771,   775,   786,   792,
     774,   799,   809,   814,   798,   821,   822,   825,   828,   832,
     831,   837,   838,   841,   842,   846,   854,   856,   860,   861,
     862,   863,   864,   869,   868,   872,   871,   877,   876,   887,
     893,   895,   899,   900,   904,   903,   907,   925,   927,   931,
     933,   932,   937,   939,   939,   941,   941,   943,   943,   945,
     945,   947,   947,   949,   949,   951,   951,   953,   953,   955,
     955,   957,   957,   959,   959,   961,   961,   963,   963,   966,
     965,   969,   974,   975,   977,   983,   982,   986,   987,   988,
     991,   990,   996,   996,  1001,  1002,  1002,  1007,  1008,  1013,
    1014,  1017,  1019,  1026,  1025,  1030,  1044,  1047,  1048,  1049,
    1052,  1053,  1057,  1056,  1062,  1061,  1067,  1066,  1070,  1073,
    1069,  1077,  1079,  1078,  1084,  1086,  1083,  1093,  1094,  1097,
    1101,  1102,  1105,  1110,  1114,  1115,  1118,  1119,  1120,  1124,
    1128,  1123,  1133,  1135,  1132,  1143,  1152,  1158,  1142,  1192,
    1197,  1199,  1196,  1209,  1211,  1208
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "array_tok",
  "begin_tok", "case_tok", "const_tok", "do_tok", "downto_tok", "else_tok",
  "end_tok", "file_tok", "for_tok", "function_tok", "goto_tok", "if_tok",
  "label_tok", "of_tok", "procedure_tok", "program_tok", "record_tok",
  "repeat_tok", "then_tok", "to_tok", "type_tok", "until_tok", "var_tok",
  "while_tok", "noreturn_tok", "others_tok", "r_num_tok", "i_num_tok",
  "string_literal_tok", "single_char_tok", "assign_tok", "two_dots_tok",
  "undef_id_tok", "var_id_tok", "proc_id_tok", "proc_param_tok",
  "fun_id_tok", "fun_param_tok", "const_id_tok", "type_id_tok", "hhb0_tok",
  "hhb1_tok", "field_id_tok", "define_tok", "field_tok", "break_tok",
  "'='", "not_eq_tok", "'<'", "'>'", "less_eq_tok", "great_eq_tok", "'+'",
  "'-'", "or_tok", "unary_plus_tok", "unary_minus_tok", "'*'", "'/'",
  "div_tok", "mod_tok", "and_tok", "not_tok", "';'", "'('", "')'", "','",
  "'^'", "'['", "']'", "':'", "'.'", "$accept", "PROGRAM", "$@1", "$@2",
  "DEFS", "DEF", "PROGRAM_HEAD", "PROGRAM_FILE_PART", "PROGRAM_FILE_LIST",
  "PROGRAM_FILE", "BLOCK", "$@3", "$@4", "$@5", "LABEL_DEC_PART", "$@6",
  "LABEL_LIST", "LABEL", "CONST_DEC_PART", "CONST_DEC_LIST", "CONST_DEC",
  "$@7", "$@8", "$@9", "$@10", "CONSTANT", "CONSTANT_EXPRESS", "$@11",
  "$@12", "$@13", "$@14", "$@15", "$@16", "$@17", "$@18", "$@19", "$@20",
  "$@21", "$@22", "$@23", "$@24", "CONST_FACTOR", "$@25", "STRING",
  "CONSTANT_ID", "TYPE_DEC_PART", "TYPE_DEF_LIST", "TYPE_DEF", "$@26",
  "$@27", "$@28", "TYPE", "SIMPLE_TYPE", "SUBRANGE_TYPE", "POSSIBLE_PLUS",
  "SUBRANGE_CONSTANT", "TYPE_ID", "STRUCTURED_TYPE", "POINTER_TYPE",
  "ARRAY_TYPE", "INDEX_TYPE", "COMPONENT_TYPE", "RECORD_TYPE", "$@29",
  "FIELD_LIST", "RECORD_SECTION", "$@30", "$@31", "FIELD_ID_LIST",
  "FIELD_ID", "FILE_TYPE", "$@32", "VAR_DEC_PART", "VAR_DEC_LIST",
  "VAR_DEC", "$@33", "$@34", "VAR_ID_DEC_LIST", "VAR_ID", "BODY", "$@35",
  "P_F_DEC_PART", "P_F_DEC", "PROCEDURE_DEC", "PROCEDURE_TOK", "$@36",
  "PROCEDURE_HEAD", "$@37", "$@38", "PARAM", "$@39", "FORM_PAR_SEC_L",
  "FORM_PAR_SEC1", "$@40", "FORM_PAR_SEC", "$@41", "$@42", "DECLARED_PROC",
  "FUNCTION_DEC", "FUNCTION_HEAD", "$@43", "$@44", "$@45", "$@46", "$@47",
  "$@48", "DECLARED_FUN", "RESULT_TYPE", "STAT_PART", "COMPOUND_STAT",
  "$@49", "STAT_LIST", "STATEMENT", "S_LABEL", "UNLAB_STAT", "SIMPLE_STAT",
  "ASSIGN_STAT", "$@50", "$@51", "VARIABLE", "@52", "FUNC_ID_AS",
  "VAR_DESIG_LIST", "VAR_DESIG", "$@53", "VAR_DESIG1", "$@54", "EXPRESS",
  "$@55", "$@56", "$@57", "$@58", "$@59", "$@60", "$@61", "$@62", "$@63",
  "$@64", "$@65", "$@66", "$@67", "$@68", "UNARY_OP", "FACTOR", "$@69",
  "$@70", "PARAM_LIST", "$@71", "ACTUAL_PARAM_L", "$@72", "ACTUAL_PARAM",
  "WIDTH_FIELD", "PROC_STAT", "$@73", "GO_TO_STAT", "EMPTY_STAT",
  "STRUCT_STAT", "CONDIT_STAT", "IF_STATEMENT", "$@74",
  "IF_THEN_ELSE_STAT", "$@75", "THEN_ELSE_STAT", "$@76", "$@77", "$@78",
  "ELSE_STAT", "$@79", "CASE_STATEMENT", "$@80", "$@81", "CASE_EL_LIST",
  "CASE_ELEMENT", "CASE_LAB_LIST", "CASE_LAB", "END_CASE", "REPETIT_STAT",
  "WHILE_STATEMENT", "$@82", "$@83", "REP_STATEMENT", "$@84", "$@85",
  "FOR_STATEMENT", "$@86", "$@87", "$@88", "CONTROL_VAR", "FOR_LIST",
  "$@89", "$@90", "$@91", "$@92", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-256)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-314)

#define yytable_value_is_error(Yyn) \
  ((Yyn) == YYTABLE_NINF)

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -256,    23,     8,  -256,    -7,    12,  -256,  -256,    32,    89,
     109,   125,   163,   205,   209,   112,   -16,   167,   173,   -18,
      16,   -28,   182,   183,  -256,   245,  -256,  -256,    48,  -256,
    -256,  -256,  -256,   195,  -256,   201,    17,  -256,  -256,  -256,
     221,  -256,   239,  -256,   -16,   206,   207,  -256,  -256,  -256,
    -256,   208,   240,   250,  -256,    39,  -256,   257,  -256,   258,
    -256,   269,  -256,  -256,  -256,  -256,  -256,    17,  -256,   221,
    -256,  -256,   260,  -256,   263,  -256,  -256,  -256,  -256,   251,
    -256,  -256,    -3,  -256,    21,    92,  -256,   253,  -256,  -256,
    -256,  -256,    -8,  -256,    86,   194,  -256,    24,  -256,   233,
     268,  -256,   242,  -256,   317,  -256,    21,  -256,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,   288,  -256,  -256,  -256,  -256,
    -256,  -256,   112,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,   449,  -256,  -256,  -256,   317,
       4,  -256,     4,   247,   247,   247,  -256,   293,   247,   245,
     317,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,   243,  -256,   241,   299,  -256,
    -256,   274,   252,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
    -256,   254,  -256,   244,   248,   256,  -256,  -256,  -256,   294,
    -256,  -256,  -256,  -256,  -256,    36,  -256,  -256,  -256,  -256,
    -256,  -256,    -2,  -256,   264,  -256,  -256,  -256,   292,   303,
    -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
    -256,   273,   239,   409,   317,   317,   317,   317,   317,   317,
     317,   317,   317,   317,   317,   317,   317,   317,  -256,    35,
    -256,     1,  -256,  -256,  -256,   301,  -256,  -256,  -256,   293,
     176,   304,  -256,   176,   293,   176,    44,   276,   278,   293,
     331,  -256,  -256,  -256,  -256,  -256,   465,   465,   465,   465,
     465,   465,   131,   131,   131,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,   127,     4,     2,  -256,    15,  -256,    22,  -256,
    -256,     4,     4,     3,  -256,  -256,  -256,  -256,  -256,   226,
     176,  -256,  -256,   320,   481,  -256,   -19,   481,  -256,   180,
      44,  -256,  -256,  -256,  -256,  -256,  -256,   176,   176,   269,
      35,   334,  -256,  -256,     1,  -256,  -256,   128,  -256,  -256,
     301,  -256,  -256,    21,  -256,  -256,  -256,  -256,   276,   176,
    -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,  -256,  -256,   333,  -256,   349,
     176,  -256,  -256,  -256,  -256,    55,   481,   481,  -256,   284,
       4,  -256,    15,  -256,  -256,  -256,   140,   295,   296,  -256,
     429,   198,   176,   176,   176,   176,   176,   176,   176,   176,
     176,   176,   176,   176,   176,   176,   176,   345,  -256,   176,
     293,   361,  -256,   336,   169,  -256,   357,   347,  -256,  -256,
    -256,     4,   322,  -256,  -256,  -256,  -256,  -256,     6,  -256,
     141,  -256,   497,   497,   497,   497,   497,   497,   158,   158,
     158,  -256,  -256,  -256,  -256,  -256,   204,   359,  -256,   293,
     481,  -256,  -256,  -256,  -256,   342,  -256,  -256,  -256,   293,
    -256,     4,  -256,  -256,  -256,    70,  -256,   198,   331,   351,
     367,  -256,   176,   369,   176,  -256,    55,     7,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,   293,  -256,  -256,  -256,   385,
    -256,  -256,   176,   176,  -256,   369,   293,  -256,   481,   481,
    -256,  -256
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int16 yydefact[] =
{
       5,     0,     0,     1,     0,     0,     6,     2,    18,     0,
       0,     0,     0,     0,     0,    27,     0,     0,     0,     0,
       0,     0,     0,     0,    28,    33,    22,    21,     0,    19,
      16,     9,     8,     0,    11,     0,    95,    13,    15,     7,
       0,    37,    82,    17,     0,     0,     0,   100,    99,    98,
      96,     0,     0,     0,    32,     0,    30,    34,    35,     0,
      86,   126,    20,    10,    12,    14,    97,    95,    29,     0,
      36,    38,    83,    84,     0,   130,     3,    94,    31,     0,
      85,    87,   127,   128,     0,     0,    39,     0,   129,   135,
     136,   137,     0,   133,     0,   146,   147,   138,   141,     0,
       0,    23,     0,    23,     0,    88,     0,   131,   167,   175,
     176,   171,   164,   165,   151,     0,   139,     4,   142,   143,
     149,   145,    27,   144,   166,    43,    42,    79,    80,    81,
     242,   243,   244,    76,    78,    40,    75,    44,    45,     0,
      95,   134,    95,   153,   153,   153,   148,   266,   153,    33,
       0,    55,    57,    61,    63,    65,    67,    47,    49,    71,
      51,    73,    53,    59,    69,     0,    46,     0,     0,   112,
     101,     0,     0,    90,    92,    93,    91,   105,   102,   103,
     104,     0,   154,     0,     0,     0,   179,   284,   305,     0,
     272,   302,   299,   185,   262,   199,   261,   263,   200,   201,
     192,   267,     0,   181,     0,   183,   186,   188,     0,     0,
     189,   190,   191,   187,   268,   270,   271,   269,   296,   297,
     298,     0,    82,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    41,    95,
     124,   116,   106,    89,   132,   160,   168,   172,   152,   266,
       0,     0,   265,     0,   266,     0,     0,     0,     0,   266,
     266,   193,   195,   150,    24,    77,    56,    58,    62,    64,
      66,    68,    48,    50,    72,    52,    74,    54,    60,    70,
     110,   109,     0,    95,     0,   114,     0,   162,     0,   156,
     158,    95,    95,     0,   249,   250,   245,   248,   247,     0,
       0,   241,   309,     0,   274,   273,     0,   300,   204,     0,
     198,   202,   252,   264,   140,   182,   184,     0,     0,   126,
      95,     0,   125,   113,   116,   122,   123,     0,   120,   158,
     160,   155,   161,     0,   177,   169,   173,   180,     0,     0,
     285,   221,   223,   227,   229,   231,   233,   213,   215,   237,
     217,   239,   219,   225,   235,   212,   306,     0,   303,     0,
       0,   207,   208,   206,   203,     0,   194,   196,    25,     0,
      95,   115,     0,   117,   163,   157,     0,     0,     0,   251,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   276,   275,     0,
     266,     0,   258,   260,     0,   254,     0,     0,   111,   107,
     121,    95,     0,   170,   174,   246,   293,   292,     0,   287,
       0,   290,   222,   224,   228,   230,   232,   234,   214,   216,
     238,   218,   240,   220,   226,   236,   310,     0,   278,   266,
     304,   301,   210,   209,   205,     0,   257,   253,   255,   266,
      26,    95,   118,   159,   294,     0,   286,     0,   266,     0,
       0,   307,     0,   281,     0,   259,     0,     0,   108,   295,
     288,   291,   289,   311,   314,   266,   279,   282,   277,     0,
     256,   178,     0,     0,   308,   281,   266,   211,   312,   315,
     280,   283
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,   335,
     279,  -256,  -256,  -256,   259,  -256,  -256,   315,   246,  -256,
     339,  -256,  -256,  -256,  -256,   -94,   -46,  -256,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,   181,  -256,   330,  -256,  -256,
    -256,  -139,  -256,   -34,  -256,   337,  -256,  -256,  -256,  -256,
      85,   -45,  -256,  -256,  -256,    83,  -256,  -256,  -256,    37,
    -256,  -256,   101,  -256,   326,  -256,  -256,    88,   321,  -256,
    -256,  -256,   332,  -256,  -256,  -256,  -256,  -256,  -256,  -113,
    -256,  -256,    99,  -256,   100,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,  -256,  -256,   152,  -256,  -256,
    -256,  -245,  -238,  -256,  -255,  -256,  -256,  -256,  -256,  -147,
    -256,  -256,  -256,   122,  -256,  -256,  -256,  -236,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,   -60,  -256,  -256,  -256,    95,  -256,  -256,  -256,
     -21,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
     -11,  -256,  -256,  -256,  -256,  -256,   -33,  -256,  -256,  -256,
    -256,  -256,    -1,  -256,    -4,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,  -256,
    -256,  -256,  -256
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     1,    15,    85,     2,     6,     7,    17,    28,    29,
     121,   122,   319,   406,    25,    40,    55,    56,    42,    57,
      58,    59,    79,   104,   165,   297,   135,   230,   231,   233,
     235,   224,   225,   236,   226,   227,   228,   229,   237,   232,
     234,   136,   150,   137,   138,    61,    72,    73,    74,    87,
     140,   334,   173,   174,    52,    53,   175,   176,   177,   178,
     282,   409,   179,   241,   284,   285,   286,   411,   327,   328,
     180,   283,    76,    82,    83,    84,   142,    92,    93,   117,
     147,    97,    98,    99,   100,   115,   101,   148,   145,   183,
     245,   288,   332,   333,   289,   290,   329,   114,   102,   103,
     143,   291,   377,   144,   292,   378,   111,   335,   450,   201,
     249,   202,   203,   204,   205,   206,   207,   317,   318,   298,
     256,   209,   310,   311,   360,   444,   464,   304,   388,   389,
     391,   393,   382,   383,   394,   384,   385,   386,   387,   395,
     390,   392,   300,   301,   339,   338,   313,   365,   404,   466,
     405,   446,   210,   257,   211,   212,   213,   214,   215,   253,
     305,   357,   398,   439,   462,   485,   478,   486,   216,   250,
     381,   418,   419,   420,   421,   456,   217,   218,   255,   359,
     219,   254,   399,   220,   251,   396,   475,   303,   437,   459,
     482,   460,   483
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
     208,   172,    51,   181,   293,   316,   358,   167,   258,   306,
     134,  -119,   323,   337,   299,   168,   454,   481,     9,   307,
      26,   315,    36,     3,   169,    10,    27,     4,   116,     8,
      11,   184,   185,  -130,  -130,   221,    12,    94,    13,    37,
      47,    48,    95,  -130,   139,   134,    49,   170,   259,    32,
      33,   325,    96,    47,    48,     5,   134,    89,    90,    49,
      14,   326,   106,    50,   355,   259,   107,    91,  -119,   324,
     259,    47,    48,   455,   259,   171,    50,    49,   280,   139,
     469,   366,   367,    34,    35,   125,   126,   127,   128,   330,
     139,   331,   195,   166,    50,   294,   295,   129,   402,   416,
      16,   417,   208,   380,   223,    94,    68,   208,  -197,    69,
      95,  -197,   208,   208,   130,   131,   308,    43,    44,   309,
      96,   132,   108,   296,   401,    18,   109,   110,    24,   403,
     134,   134,   134,   134,   134,   134,   134,   134,   134,   134,
     134,   134,   134,   134,   322,    19,   422,   423,   424,   425,
     426,   427,   428,   429,   430,   431,   432,   433,   434,   435,
     436,    20,   441,   440,   139,   139,   139,   139,   139,   139,
     139,   139,   139,   139,   139,   139,   139,   139,   266,   267,
     268,   269,   270,   271,   272,   273,   274,   275,   276,   277,
     278,   279,   160,   161,   162,   163,   164,   320,   372,    21,
     321,   463,   373,   472,   467,   281,   125,   126,   127,   128,
     106,   457,  -313,   195,   412,   458,   294,   295,   129,   350,
     351,   352,   353,   354,   361,   362,   363,   416,   479,   417,
     403,   408,   112,   113,    30,   130,   131,   484,   447,   448,
      31,    22,   132,   340,   296,    23,   488,   489,   491,    38,
      39,    41,    54,   208,   341,   342,   343,   344,   345,   346,
     347,   348,   349,    60,    45,   350,   351,   352,   353,   354,
      46,    66,   452,    63,    64,    65,   341,   342,   343,   344,
     345,   346,   347,   348,   349,    67,   281,   350,   351,   352,
     353,   354,   208,   -37,    71,    75,   -86,   186,   187,    81,
     119,    86,   208,   105,   120,   188,   146,   189,   190,   123,
     238,   208,   408,   239,   191,   182,   240,   242,   246,   243,
     192,   244,   247,   248,   193,   252,   261,   287,   208,   194,
     195,   196,   197,   198,   199,   186,   187,   262,   260,   208,
     263,   302,   200,   188,   312,   189,   190,   125,   126,   127,
     128,   370,   191,   314,   356,   397,   400,   407,   192,   129,
     438,   449,   413,   414,   451,   453,   461,   194,   195,   196,
     197,   198,   199,   465,   473,   474,   130,   131,   477,    62,
     200,   149,   124,   132,    78,   133,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   222,    70,   350,   351,   352,
     353,   354,    80,   264,    77,   369,   468,   371,    88,   410,
     445,   341,   342,   343,   344,   345,   346,   347,   348,   349,
     368,   376,   350,   351,   352,   353,   354,   141,   374,   118,
     375,   442,   364,   379,   443,   341,   342,   343,   344,   345,
     346,   347,   348,   349,   336,   480,   350,   351,   352,   353,
     354,   476,   490,   471,   470,     0,     0,     0,   487,   151,
     152,   153,   154,   155,   156,   157,   158,   159,     0,     0,
     160,   161,   162,   163,   164,     0,     0,     0,   265,   341,
     342,   343,   344,   345,   346,   347,   348,   349,     0,     0,
     350,   351,   352,   353,   354,     0,     0,     0,   415,   151,
     152,   153,   154,   155,   156,   157,   158,   159,     0,     0,
     160,   161,   162,   163,   164,  -314,  -314,  -314,  -314,  -314,
    -314,   157,   158,   159,     0,     0,   160,   161,   162,   163,
     164,   341,   342,   343,   344,   345,   346,   347,   348,   349,
       0,     0,   350,   351,   352,   353,   354,  -314,  -314,  -314,
    -314,  -314,  -314,   347,   348,   349,     0,     0,   350,   351,
     352,   353,   354
};

static const yytype_int16 yycheck[] =
{
     147,   140,    36,   142,   249,   260,    25,     3,    10,   254,
     104,    10,    10,    10,   250,    11,    10,    10,     6,   255,
      36,   259,    50,     0,    20,    13,    42,    19,     4,    36,
      18,   144,   145,    36,    37,   148,    24,    13,    26,    67,
      36,    37,    18,    46,   104,   139,    42,    43,    67,    67,
      68,    36,    28,    36,    37,    47,   150,    36,    37,    42,
      48,    46,    70,    59,   300,    67,    74,    46,    67,    67,
      67,    36,    37,    67,    67,    71,    59,    42,    43,   139,
      10,   317,   318,    67,    68,    30,    31,    32,    33,    67,
     150,    69,    37,   139,    59,    40,    41,    42,    43,    29,
      68,    31,   249,   339,   150,    13,    67,   254,    72,    70,
      18,    75,   259,   260,    59,    60,    72,    69,    70,    75,
      28,    66,    36,    68,   360,    36,    40,    41,    16,   365,
     224,   225,   226,   227,   228,   229,   230,   231,   232,   233,
     234,   235,   236,   237,   283,    36,   382,   383,   384,   385,
     386,   387,   388,   389,   390,   391,   392,   393,   394,   395,
     396,    36,   400,   399,   224,   225,   226,   227,   228,   229,
     230,   231,   232,   233,   234,   235,   236,   237,   224,   225,
     226,   227,   228,   229,   230,   231,   232,   233,   234,   235,
     236,   237,    61,    62,    63,    64,    65,    70,    70,    36,
      73,   439,    74,   458,   449,   239,    30,    31,    32,    33,
      70,    70,     8,    37,    74,    74,    40,    41,    42,    61,
      62,    63,    64,    65,    44,    45,    46,    29,   464,    31,
     466,   370,    38,    39,    67,    59,    60,   475,    69,    70,
      67,    36,    66,    17,    68,    36,   482,   483,   486,    67,
      67,     6,    31,   400,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    24,    69,    61,    62,    63,    64,    65,
      69,    31,   411,    67,    67,    67,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    35,   320,    61,    62,    63,
      64,    65,   439,    36,    36,    26,    36,     4,     5,    36,
      67,    50,   449,    50,    36,    12,    18,    14,    15,    67,
      67,   458,   451,    72,    21,    68,    17,    43,    74,    67,
      27,    67,    74,    67,    31,    31,    34,    26,   475,    36,
      37,    38,    39,    40,    41,     4,     5,    34,    74,   486,
      67,    37,    49,    12,    68,    14,    15,    30,    31,    32,
      33,    17,    21,    75,    34,    22,     7,    73,    27,    42,
      15,     4,    67,    67,    17,    43,     7,    36,    37,    38,
      39,    40,    41,    31,    23,     8,    59,    60,     9,    44,
      49,   122,   103,    66,    69,    68,    50,    51,    52,    53,
      54,    55,    56,    57,    58,   149,    57,    61,    62,    63,
      64,    65,    72,   222,    67,   320,   451,   324,    82,   372,
      74,    50,    51,    52,    53,    54,    55,    56,    57,    58,
     319,   333,    61,    62,    63,    64,    65,   106,   329,    97,
     330,    70,   310,   338,    73,    50,    51,    52,    53,    54,
      55,    56,    57,    58,   292,   466,    61,    62,    63,    64,
      65,   462,   485,   457,   455,    -1,    -1,    -1,    73,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    -1,    -1,
      61,    62,    63,    64,    65,    -1,    -1,    -1,    69,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    -1,    -1,
      61,    62,    63,    64,    65,    -1,    -1,    -1,    69,    50,
      51,    52,    53,    54,    55,    56,    57,    58,    -1,    -1,
      61,    62,    63,    64,    65,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    -1,    -1,    61,    62,    63,    64,
      65,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      -1,    -1,    61,    62,    63,    64,    65,    50,    51,    52,
      53,    54,    55,    56,    57,    58,    -1,    -1,    61,    62,
      63,    64,    65
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int16 yystos[] =
{
       0,    77,    80,     0,    19,    47,    81,    82,    36,     6,
      13,    18,    24,    26,    48,    78,    68,    83,    36,    36,
      36,    36,    36,    36,    16,    90,    36,    42,    84,    85,
      67,    67,    67,    68,    67,    68,    50,    67,    67,    67,
      91,     6,    94,    69,    70,    69,    69,    36,    37,    42,
      59,   129,   130,   131,    31,    92,    93,    95,    96,    97,
      24,   121,    85,    67,    67,    67,    31,    35,    67,    70,
      96,    36,   122,   123,   124,    26,   148,   131,    93,    98,
     123,    36,   149,   150,   151,    79,    50,   125,   150,    36,
      37,    46,   153,   154,    13,    18,    28,   157,   158,   159,
     160,   162,   174,   175,    99,    50,    70,    74,    36,    40,
      41,   182,    38,    39,   173,   161,     4,   155,   158,    67,
      36,    86,    87,    67,    86,    30,    31,    32,    33,    42,
      59,    60,    66,    68,   101,   102,   117,   119,   120,   218,
     126,   154,   152,   176,   179,   164,    18,   156,   163,    90,
     118,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      61,    62,    63,    64,    65,   100,   102,     3,    11,    20,
      43,    71,   127,   128,   129,   132,   133,   134,   135,   138,
     146,   127,    68,   165,   165,   165,     4,     5,    12,    14,
      15,    21,    27,    31,    36,    37,    38,    39,    40,    41,
      49,   185,   187,   188,   189,   190,   191,   192,   195,   197,
     228,   230,   231,   232,   233,   234,   244,   252,   253,   256,
     259,   165,    94,   102,   107,   108,   110,   111,   112,   113,
     103,   104,   115,   105,   116,   106,   109,   114,    67,    72,
      17,   139,    43,    67,    67,   166,    74,    74,    67,   186,
     245,   260,    31,   235,   257,   254,   196,   229,    10,    67,
      74,    34,    34,    67,   121,    69,   102,   102,   102,   102,
     102,   102,   102,   102,   102,   102,   102,   102,   102,   102,
      43,   129,   136,   147,   140,   141,   142,    26,   167,   170,
     171,   177,   180,   187,    40,    41,    68,   101,   195,   203,
     218,   219,    37,   263,   203,   236,   187,   203,    72,    75,
     198,   199,    68,   222,    75,   188,   190,   193,   194,    88,
      70,    73,   127,    10,    67,    36,    46,   144,   145,   172,
      67,    69,   168,   169,   127,   183,   183,    10,   221,   220,
      17,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      61,    62,    63,    64,    65,   203,    34,   237,    25,   255,
     200,    44,    45,    46,   199,   223,   203,   203,   148,   136,
      17,   141,    70,    74,   168,   170,   153,   178,   181,   222,
     203,   246,   208,   209,   211,   212,   213,   214,   204,   205,
     216,   206,   217,   207,   210,   215,   261,    22,   238,   258,
       7,   203,    43,   203,   224,   226,    89,    73,   127,   137,
     145,   143,    74,    67,    67,    69,    29,    31,   247,   248,
     249,   250,   203,   203,   203,   203,   203,   203,   203,   203,
     203,   203,   203,   203,   203,   203,   203,   264,    15,   239,
     203,   188,    70,    73,   201,    74,   227,    69,    70,     4,
     184,    17,   127,    43,    10,    67,   251,    70,    74,   265,
     267,     7,   240,   188,   202,    31,   225,   187,   137,    10,
     248,   250,   190,    23,     8,   262,   236,     9,   242,   203,
     226,    10,   266,   268,   188,   241,   243,    73,   203,   203,
     242,   188
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int16 yyr1[] =
{
       0,    76,    78,    79,    77,    80,    80,    81,    81,    81,
      81,    81,    81,    81,    81,    81,    82,    83,    83,    84,
      84,    85,    85,    87,    88,    89,    86,    90,    91,    90,
      92,    92,    93,    94,    94,    95,    95,    97,    98,    99,
     100,    96,   101,   101,   101,   101,   102,   103,   102,   104,
     102,   105,   102,   106,   102,   107,   102,   108,   102,   109,
     102,   110,   102,   111,   102,   112,   102,   113,   102,   114,
     102,   115,   102,   116,   102,   102,   118,   117,   117,   119,
     119,   120,   121,   121,   122,   122,   124,   125,   126,   123,
     127,   127,   128,   128,   129,   130,   130,   131,   131,   131,
     131,   132,   133,   133,   133,   133,   134,   135,   135,   136,
     136,   137,   139,   138,   140,   140,   142,   143,   141,   141,
     144,   144,   145,   145,   147,   146,   148,   148,   149,   149,
     151,   152,   150,   153,   153,   154,   154,   154,   155,   156,
     155,   157,   157,   158,   158,   159,   160,   161,   160,   163,
     162,   164,   162,   165,   166,   165,   167,   167,   169,   168,
     171,   170,   172,   170,   173,   173,   174,   176,   177,   178,
     175,   179,   180,   181,   175,   182,   182,   183,   184,   186,
     185,   187,   187,   188,   188,   189,   190,   190,   191,   191,
     191,   191,   191,   193,   192,   194,   192,   196,   195,   195,
     197,   197,   198,   198,   200,   199,   199,   199,   199,   201,
     202,   201,   203,   204,   203,   205,   203,   206,   203,   207,
     203,   208,   203,   209,   203,   210,   203,   211,   203,   212,
     203,   213,   203,   214,   203,   215,   203,   216,   203,   217,
     203,   203,   218,   218,   218,   220,   219,   219,   219,   219,
     221,   219,   223,   222,   224,   225,   224,   226,   226,   227,
     227,   228,   228,   229,   228,   230,   231,   232,   232,   232,
     233,   233,   235,   234,   237,   236,   239,   238,   240,   241,
     238,   242,   243,   242,   245,   246,   244,   247,   247,   248,
     249,   249,   250,   250,   251,   251,   252,   252,   252,   254,
     255,   253,   257,   258,   256,   260,   261,   262,   259,   263,
     265,   266,   264,   267,   268,   264
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     0,    10,     0,     2,     4,     4,     4,
       6,     4,     6,     4,     6,     4,     4,     3,     0,     1,
       3,     1,     1,     0,     0,     0,     8,     0,     0,     4,
       1,     3,     1,     0,     2,     1,     2,     0,     0,     0,
       0,     8,     1,     1,     1,     1,     2,     0,     4,     0,
       4,     0,     4,     0,     4,     0,     4,     0,     4,     0,
       4,     0,     4,     0,     4,     0,     4,     0,     4,     0,
       4,     0,     4,     0,     4,     1,     0,     4,     1,     1,
       1,     1,     0,     2,     1,     2,     0,     0,     0,     7,
       1,     1,     1,     1,     3,     0,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     6,     8,     1,
       1,     1,     0,     4,     1,     3,     0,     0,     5,     0,
       1,     3,     1,     1,     0,     4,     0,     2,     1,     2,
       0,     0,     6,     1,     3,     1,     1,     1,     0,     0,
       5,     1,     2,     2,     2,     2,     1,     0,     3,     0,
       5,     0,     5,     0,     0,     4,     1,     3,     0,     4,
       0,     2,     0,     3,     1,     1,     2,     0,     0,     0,
       9,     0,     0,     0,     9,     1,     1,     1,     3,     0,
       4,     1,     3,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     4,     0,     4,     0,     3,     1,
       1,     1,     1,     2,     0,     4,     2,     2,     2,     1,
       0,     4,     2,     0,     4,     0,     4,     0,     4,     0,
       4,     0,     4,     0,     4,     0,     4,     0,     4,     0,
       4,     0,     4,     0,     4,     0,     4,     0,     4,     0,
       4,     1,     1,     1,     1,     0,     4,     1,     1,     1,
       0,     3,     0,     4,     1,     0,     4,     2,     1,     2,
       0,     1,     1,     0,     3,     2,     0,     1,     1,     1,
       1,     1,     0,     3,     0,     3,     0,     4,     0,     0,
       6,     0,     0,     3,     0,     0,     7,     1,     3,     3,
       1,     3,     1,     1,     1,     2,     1,     1,     1,     0,
       0,     6,     0,     0,     6,     0,     0,     0,     9,     1,
       0,     0,     5,     0,     0,     5
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* $@1: %empty  */
#line 66 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          {
	    printf ("#define %s\n", uppercasify (program_name));
            block_level++;
	    printf ("#include \"%s\"\n", std_header);
	  }
#line 1950 "web2c-parser.c"
    break;

  case 3: /* $@2: %empty  */
#line 73 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { printf ("\n#include \"%s\"\n", coerce_name); }
#line 1956 "web2c-parser.c"
    break;

  case 4: /* PROGRAM: DEFS PROGRAM_HEAD $@1 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART VAR_DEC_PART $@2 P_F_DEC_PART BODY  */
#line 76 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { YYACCEPT; }
#line 1962 "web2c-parser.c"
    break;

  case 7: /* DEF: define_tok field_tok undef_id_tok ';'  */
#line 86 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = field_id_tok;
	    }
#line 1971 "web2c-parser.c"
    break;

  case 8: /* DEF: define_tok function_tok undef_id_tok ';'  */
#line 91 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = fun_id_tok;
	    }
#line 1980 "web2c-parser.c"
    break;

  case 9: /* DEF: define_tok const_tok undef_id_tok ';'  */
#line 96 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = const_id_tok;
	    }
#line 1989 "web2c-parser.c"
    break;

  case 10: /* DEF: define_tok function_tok undef_id_tok '(' ')' ';'  */
#line 101 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = fun_param_tok;
	    }
#line 1998 "web2c-parser.c"
    break;

  case 11: /* DEF: define_tok procedure_tok undef_id_tok ';'  */
#line 106 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = proc_id_tok;
	    }
#line 2007 "web2c-parser.c"
    break;

  case 12: /* DEF: define_tok procedure_tok undef_id_tok '(' ')' ';'  */
#line 111 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = proc_param_tok;
	    }
#line 2016 "web2c-parser.c"
    break;

  case 13: /* DEF: define_tok type_tok undef_id_tok ';'  */
#line 116 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = type_id_tok;
	    }
#line 2025 "web2c-parser.c"
    break;

  case 14: /* DEF: define_tok type_tok undef_id_tok '=' SUBRANGE_TYPE ';'  */
#line 121 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = type_id_tok;
	      sym_table[ii].val = lower_bound;
	      sym_table[ii].val_sym = lower_sym;
	      sym_table[ii].upper = upper_bound;
	      sym_table[ii].upper_sym = upper_sym;
	    }
#line 2038 "web2c-parser.c"
    break;

  case 15: /* DEF: define_tok var_tok undef_id_tok ';'  */
#line 130 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
	      ii = add_to_table (last_id);
	      sym_table[ii].typ = var_id_tok;
	    }
#line 2047 "web2c-parser.c"
    break;

  case 23: /* $@3: %empty  */
#line 157 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
              {	if (block_level > 0) my_output("{\n ");
                indent++; block_level++;
              }
#line 2055 "web2c-parser.c"
    break;

  case 24: /* $@4: %empty  */
#line 162 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
              { if (block_level == 2) {
                  if (strcmp(fn_return_type, "void")) {
                    my_output("register");
                    my_output(fn_return_type);
                    my_output("Result;");
                  }
                  if (tex) {
                    sprintf(safe_string, "%s_regmem", my_routine);
                    my_output(safe_string);
                    new_line();
                  }
               }
             }
#line 2073 "web2c-parser.c"
    break;

  case 25: /* $@5: %empty  */
#line 176 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
             { doing_statements = true; }
#line 2079 "web2c-parser.c"
    break;

  case 26: /* BLOCK: $@3 LABEL_DEC_PART CONST_DEC_PART TYPE_DEC_PART $@4 VAR_DEC_PART $@5 STAT_PART  */
#line 178 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              if (block_level == 2) {
                if (strcmp(fn_return_type,"void")) {
                  my_output("return Result");
                  semicolon();
                 }
                 if (tex) {
                   if (uses_mem && uses_eqtb)
                    fprintf(coerce,
             "#define %s_regmem register memoryword *mem=zmem, *eqtb=zeqtb;\n",
                       my_routine);
                   else if (uses_mem)
          fprintf(coerce, "#define %s_regmem register memoryword *mem=zmem;\n",
                          my_routine);
                   else if (uses_eqtb)
        fprintf(coerce, "#define %s_regmem register memoryword *eqtb=zeqtb;\n",
                          my_routine);
                   else
                     fprintf(coerce, "#define %s_regmem\n", my_routine);
                }
                my_routine[0] = '\0';
             }
             indent--; block_level--;
             my_output("}"); new_line();
             doing_statements = false;
            }
#line 2110 "web2c-parser.c"
    break;

  case 28: /* $@6: %empty  */
#line 208 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                        { my_output("/*"); }
#line 2116 "web2c-parser.c"
    break;

  case 29: /* LABEL_DEC_PART: label_tok $@6 LABEL_LIST ';'  */
#line 210 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                        { my_output("*/"); }
#line 2122 "web2c-parser.c"
    break;

  case 32: /* LABEL: i_num_tok  */
#line 218 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                  { my_output(temp); }
#line 2128 "web2c-parser.c"
    break;

  case 34: /* CONST_DEC_PART: const_tok CONST_DEC_LIST  */
#line 224 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                        { new_line(); }
#line 2134 "web2c-parser.c"
    break;

  case 37: /* $@7: %empty  */
#line 233 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { /* `#define' must be in column 1 for pcc. */
            unsigned save = indent;
	    new_line ();
	    indent = 0;
	    my_output ("#define");
	    indent = save;
	  }
#line 2146 "web2c-parser.c"
    break;

  case 38: /* $@8: %empty  */
#line 241 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { ii = add_to_table (last_id);
	    sym_table[ii].typ = const_id_tok;
            my_output (last_id);
          }
#line 2155 "web2c-parser.c"
    break;

  case 39: /* $@9: %empty  */
#line 245 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                          { my_output ("("); }
#line 2161 "web2c-parser.c"
    break;

  case 40: /* $@10: %empty  */
#line 246 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                          { my_output (")"); }
#line 2167 "web2c-parser.c"
    break;

  case 41: /* CONST_DEC: $@7 undef_id_tok $@8 '=' $@9 CONSTANT_EXPRESS $@10 ';'  */
#line 247 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                          { sym_table[ii].val = last_i_num; new_line(); }
#line 2173 "web2c-parser.c"
    break;

  case 42: /* CONSTANT: i_num_tok  */
#line 252 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
           {
             sscanf (temp, "%ld", &last_i_num);
             if (my_labs ((long) last_i_num) > 32767)
               strcat (temp, "L");
             my_output (temp);
             yyval = ex_32;
           }
#line 2185 "web2c-parser.c"
    break;

  case 43: /* CONSTANT: r_num_tok  */
#line 259 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                      { my_output(temp); yyval = ex_real; }
#line 2191 "web2c-parser.c"
    break;

  case 44: /* CONSTANT: STRING  */
#line 260 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                      { yyval = 0; }
#line 2197 "web2c-parser.c"
    break;

  case 45: /* CONSTANT: CONSTANT_ID  */
#line 261 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                      { yyval = ex_32; }
#line 2203 "web2c-parser.c"
    break;

  case 46: /* CONSTANT_EXPRESS: UNARY_OP CONSTANT_EXPRESS  */
#line 266 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { yyval = yyvsp[0]; }
#line 2209 "web2c-parser.c"
    break;

  case 47: /* $@11: %empty  */
#line 267 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("+"); }
#line 2215 "web2c-parser.c"
    break;

  case 48: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS '+' $@11 CONSTANT_EXPRESS  */
#line 268 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2221 "web2c-parser.c"
    break;

  case 49: /* $@12: %empty  */
#line 269 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("-"); }
#line 2227 "web2c-parser.c"
    break;

  case 50: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS '-' $@12 CONSTANT_EXPRESS  */
#line 270 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2233 "web2c-parser.c"
    break;

  case 51: /* $@13: %empty  */
#line 271 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("*"); }
#line 2239 "web2c-parser.c"
    break;

  case 52: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS '*' $@13 CONSTANT_EXPRESS  */
#line 272 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2245 "web2c-parser.c"
    break;

  case 53: /* $@14: %empty  */
#line 273 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("/"); }
#line 2251 "web2c-parser.c"
    break;

  case 54: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS div_tok $@14 CONSTANT_EXPRESS  */
#line 274 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2257 "web2c-parser.c"
    break;

  case 55: /* $@15: %empty  */
#line 275 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("=="); }
#line 2263 "web2c-parser.c"
    break;

  case 56: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS '=' $@15 CONSTANT_EXPRESS  */
#line 276 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2269 "web2c-parser.c"
    break;

  case 57: /* $@16: %empty  */
#line 277 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("!="); }
#line 2275 "web2c-parser.c"
    break;

  case 58: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS not_eq_tok $@16 CONSTANT_EXPRESS  */
#line 278 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2281 "web2c-parser.c"
    break;

  case 59: /* $@17: %empty  */
#line 279 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("%"); }
#line 2287 "web2c-parser.c"
    break;

  case 60: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS mod_tok $@17 CONSTANT_EXPRESS  */
#line 280 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2293 "web2c-parser.c"
    break;

  case 61: /* $@18: %empty  */
#line 281 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("<"); }
#line 2299 "web2c-parser.c"
    break;

  case 62: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS '<' $@18 CONSTANT_EXPRESS  */
#line 282 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2305 "web2c-parser.c"
    break;

  case 63: /* $@19: %empty  */
#line 283 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output (">"); }
#line 2311 "web2c-parser.c"
    break;

  case 64: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS '>' $@19 CONSTANT_EXPRESS  */
#line 284 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2317 "web2c-parser.c"
    break;

  case 65: /* $@20: %empty  */
#line 285 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("<="); }
#line 2323 "web2c-parser.c"
    break;

  case 66: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS less_eq_tok $@20 CONSTANT_EXPRESS  */
#line 286 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2329 "web2c-parser.c"
    break;

  case 67: /* $@21: %empty  */
#line 287 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output (">="); }
#line 2335 "web2c-parser.c"
    break;

  case 68: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS great_eq_tok $@21 CONSTANT_EXPRESS  */
#line 288 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2341 "web2c-parser.c"
    break;

  case 69: /* $@22: %empty  */
#line 289 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("&&"); }
#line 2347 "web2c-parser.c"
    break;

  case 70: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS and_tok $@22 CONSTANT_EXPRESS  */
#line 290 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2353 "web2c-parser.c"
    break;

  case 71: /* $@23: %empty  */
#line 291 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("||"); }
#line 2359 "web2c-parser.c"
    break;

  case 72: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS or_tok $@23 CONSTANT_EXPRESS  */
#line 292 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 2365 "web2c-parser.c"
    break;

  case 73: /* $@24: %empty  */
#line 293 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { my_output ("/ ((double)"); }
#line 2371 "web2c-parser.c"
    break;

  case 74: /* CONSTANT_EXPRESS: CONSTANT_EXPRESS '/' $@24 CONSTANT_EXPRESS  */
#line 294 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                        { yyval = max (yyvsp[-3], yyvsp[0]); my_output (")"); }
#line 2377 "web2c-parser.c"
    break;

  case 75: /* CONSTANT_EXPRESS: CONST_FACTOR  */
#line 295 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                       { yyval = yyvsp[0]; }
#line 2383 "web2c-parser.c"
    break;

  case 76: /* $@25: %empty  */
#line 300 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output ("("); }
#line 2389 "web2c-parser.c"
    break;

  case 77: /* CONST_FACTOR: '(' $@25 CONSTANT_EXPRESS ')'  */
#line 302 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output (")"); yyval = yyvsp[-3]; }
#line 2395 "web2c-parser.c"
    break;

  case 79: /* STRING: string_literal_tok  */
#line 308 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              char s[132];
              get_string_literal(s);
              my_output (s);
            }
#line 2405 "web2c-parser.c"
    break;

  case 80: /* STRING: single_char_tok  */
#line 314 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              char s[5];
              get_single_char(s);
              my_output (s);
            }
#line 2415 "web2c-parser.c"
    break;

  case 81: /* CONSTANT_ID: const_id_tok  */
#line 322 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                     { my_output (last_id); }
#line 2421 "web2c-parser.c"
    break;

  case 86: /* $@26: %empty  */
#line 334 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { my_output ("typedef"); }
#line 2427 "web2c-parser.c"
    break;

  case 87: /* $@27: %empty  */
#line 336 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          {
            ii = add_to_table(last_id);
            sym_table[ii].typ = type_id_tok;
            strcpy(safe_string, last_id);
            last_type = ii;
          }
#line 2438 "web2c-parser.c"
    break;

  case 88: /* $@28: %empty  */
#line 343 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          {
            array_bounds[0] = 0;
            array_offset[0] = 0;
          }
#line 2447 "web2c-parser.c"
    break;

  case 89: /* TYPE_DEF: $@26 undef_id_tok $@27 '=' $@28 TYPE ';'  */
#line 348 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          {
            if (*array_offset) {
              yyerror ("Cannot typedef arrays with offsets");
            }
            my_output (safe_string);
            my_output (array_bounds);
            semicolon ();
            last_type = -1;
          }
#line 2461 "web2c-parser.c"
    break;

  case 92: /* SIMPLE_TYPE: SUBRANGE_TYPE  */
#line 366 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              if (last_type >= 0)
                {
                   sym_table[ii].val = lower_bound;
                   sym_table[ii].val_sym = lower_sym;
                   sym_table[ii].upper = upper_bound;
                   sym_table[ii].upper_sym = upper_sym;
                   ii= -1;
                 }

              /* If the bounds on an integral type are known at
                 translation time, select the smallest ANSI C type which
                 can represent it.  We avoid using char as such variables
                 are frequently used as array indices.  We avoid using
                 schar and unsigned short where possible, since they are
                 treated differently by different compilers
                 (see also config.h).  */
              if (lower_sym == -1 && upper_sym == -1) {
                if (0 <= lower_bound && upper_bound <= UCHAR_MAX)
                  my_output ("unsigned char");
                else if (SCHAR_MIN <= lower_bound && upper_bound <= SCHAR_MAX)
                  my_output ("schar");
                else if (SHRT_MIN <= lower_bound && upper_bound <= SHRT_MAX)
                  my_output ("short");
                else if (0 <= lower_bound && upper_bound <= USHRT_MAX)
                  my_output ("unsigned short");
                else
                  my_output ("integer");
              } else {
                  my_output ("integer");
              }
            }
#line 2498 "web2c-parser.c"
    break;

  case 97: /* SUBRANGE_CONSTANT: POSSIBLE_PLUS i_num_tok  */
#line 412 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              lower_bound = upper_bound;
              lower_sym = upper_sym;
              sscanf (temp, "%ld", &upper_bound);
              upper_sym = -1; /* no sym table entry */
            }
#line 2509 "web2c-parser.c"
    break;

  case 98: /* SUBRANGE_CONSTANT: const_id_tok  */
#line 419 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              lower_bound = upper_bound;
              lower_sym = upper_sym;
              upper_bound = sym_table[l_s].val;
              upper_sym = l_s;
            }
#line 2520 "web2c-parser.c"
    break;

  case 99: /* SUBRANGE_CONSTANT: var_id_tok  */
#line 426 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { /* We've changed some constants into dynamic variables.
	         To avoid changing all the subrange decls, just use integer.
	         This does not work for arrays, for which we check later.  */
	      lower_bound = upper_bound;
	      lower_sym = upper_sym;
	      upper_bound = 0;
	      upper_sym = 0; /* Translate to integer.  */
	    }
#line 2533 "web2c-parser.c"
    break;

  case 100: /* SUBRANGE_CONSTANT: undef_id_tok  */
#line 435 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { /* Same as var_id_tok, to avoid changing type definitions.
	         Should keep track of the variables we use in this way
	         and make sure they're all eventually defined.  */
	      lower_bound = upper_bound;
	      lower_sym = upper_sym;
	      upper_bound = 0;
	      upper_sym = 0;
	    }
#line 2546 "web2c-parser.c"
    break;

  case 101: /* TYPE_ID: type_id_tok  */
#line 447 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          {
            if (last_type >= 0) {
           sym_table[last_type].var_not_needed = sym_table[l_s].var_not_needed;
              sym_table[last_type].upper = sym_table[l_s].upper;
              sym_table[last_type].upper_sym = sym_table[l_s].upper_sym;
              sym_table[last_type].val = sym_table[l_s].val;
              sym_table[last_type].val_sym = sym_table[l_s].val_sym;
	    }
	    my_output (last_id);
	  }
#line 2561 "web2c-parser.c"
    break;

  case 102: /* STRUCTURED_TYPE: ARRAY_TYPE  */
#line 461 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { if (last_type >= 0)
	        sym_table[last_type].var_not_needed = true;
            }
#line 2569 "web2c-parser.c"
    break;

  case 104: /* STRUCTURED_TYPE: FILE_TYPE  */
#line 466 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { if (last_type >= 0)
	        sym_table[last_type].var_not_needed = true;
            }
#line 2577 "web2c-parser.c"
    break;

  case 105: /* STRUCTURED_TYPE: POINTER_TYPE  */
#line 470 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { if (last_type >= 0)
	        sym_table[last_type].var_not_needed = true;
            }
#line 2585 "web2c-parser.c"
    break;

  case 106: /* POINTER_TYPE: '^' type_id_tok  */
#line 477 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          {
            if (last_type >= 0) {
              sym_table[last_type].var_not_needed = sym_table[l_s].var_not_needed;
              sym_table[last_type].upper = sym_table[l_s].upper;
              sym_table[last_type].upper_sym = sym_table[l_s].upper_sym;
              sym_table[last_type].val = sym_table[l_s].val;
              sym_table[last_type].val_sym = sym_table[l_s].val_sym;
	    }
	    my_output (last_id);
	    my_output ("*");
          }
#line 2601 "web2c-parser.c"
    break;

  case 109: /* INDEX_TYPE: SUBRANGE_TYPE  */
#line 497 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { compute_array_bounds(); }
#line 2607 "web2c-parser.c"
    break;

  case 110: /* INDEX_TYPE: type_id_tok  */
#line 499 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              lower_bound = sym_table[l_s].val;
              lower_sym = sym_table[l_s].val_sym;
              upper_bound = sym_table[l_s].upper;
              upper_sym = sym_table[l_s].upper_sym;
              compute_array_bounds();
            }
#line 2619 "web2c-parser.c"
    break;

  case 112: /* $@29: %empty  */
#line 512 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { my_output ("struct"); my_output ("{"); indent++; }
#line 2625 "web2c-parser.c"
    break;

  case 113: /* RECORD_TYPE: record_tok $@29 FIELD_LIST end_tok  */
#line 514 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { indent--; my_output ("}"); semicolon(); }
#line 2631 "web2c-parser.c"
    break;

  case 116: /* $@30: %empty  */
#line 522 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { field_list[0] = 0; }
#line 2637 "web2c-parser.c"
    break;

  case 117: /* $@31: %empty  */
#line 524 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {
				  /*array_bounds[0] = 0;
				  array_offset[0] = 0;*/
				}
#line 2646 "web2c-parser.c"
    break;

  case 118: /* RECORD_SECTION: $@30 FIELD_ID_LIST ':' $@31 TYPE  */
#line 529 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { int i=0, j; char ltemp[80];
				  while(field_list[i++] == '!') {
					j = 0;
					while (field_list[i])
					    ltemp[j++] = field_list[i++];
					i++;
					if (field_list[i] == '!')
						ltemp[j++] = ',';
					ltemp[j] = 0;
					my_output (ltemp);
				  }
				  semicolon();
				}
#line 2664 "web2c-parser.c"
    break;

  case 122: /* FIELD_ID: undef_id_tok  */
#line 550 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { int i=0, j=0;
				  while (field_list[i] == '!')
					while(field_list[i++]);
				  ii = add_to_table(last_id);
				  sym_table[ii].typ = field_id_tok;
				  field_list[i++] = '!';
				  while (last_id[j])
					field_list[i++] = last_id[j++];
				  field_list[i++] = 0;
				  field_list[i++] = 0;
				}
#line 2680 "web2c-parser.c"
    break;

  case 123: /* FIELD_ID: field_id_tok  */
#line 562 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { int i=0, j=0;
				  while (field_list[i] == '!')
					while(field_list[i++]);
				  field_list[i++] = '!';
				  while (last_id[j])
					field_list[i++] = last_id[j++];
				  field_list[i++] = 0;
				  field_list[i++] = 0;
				}
#line 2694 "web2c-parser.c"
    break;

  case 124: /* $@32: %empty  */
#line 575 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { my_output ("text /* of "); }
#line 2700 "web2c-parser.c"
    break;

  case 125: /* FILE_TYPE: file_tok of_tok $@32 TYPE  */
#line 577 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { my_output ("*/"); }
#line 2706 "web2c-parser.c"
    break;

  case 130: /* $@33: %empty  */
#line 591 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          {
            var_list[0] = 0;
            array_bounds[0] = 0;
            array_offset[0] = 0;
            var_formals = false;
            ids_paramed = 0;
          }
#line 2718 "web2c-parser.c"
    break;

  case 131: /* $@34: %empty  */
#line 599 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          {
            array_bounds[0] = 0;
            array_offset[0] = 0;
          }
#line 2727 "web2c-parser.c"
    break;

  case 132: /* VAR_DEC: $@33 VAR_ID_DEC_LIST ':' $@34 TYPE ';'  */
#line 604 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
          { fixup_var_list(); }
#line 2733 "web2c-parser.c"
    break;

  case 135: /* VAR_ID: undef_id_tok  */
#line 612 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { int i=0, j=0;
				  ii = add_to_table(last_id);
				  sym_table[ii].typ = var_id_tok;
				  sym_table[ii].var_formal = var_formals;
				  param_id_list[ids_paramed++] = ii;
				  while (var_list[i] == '!')
					while(var_list[i++]);
				  var_list[i++] = '!';
				  while (last_id[j])
					var_list[i++] = last_id[j++];
				  var_list[i++] = 0;
				  var_list[i++] = 0;
				}
#line 2751 "web2c-parser.c"
    break;

  case 136: /* VAR_ID: var_id_tok  */
#line 626 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { int i=0, j=0;
				  ii = add_to_table(last_id);
				  sym_table[ii].typ = var_id_tok;
				  sym_table[ii].var_formal = var_formals;
				  param_id_list[ids_paramed++] = ii;
				  while (var_list[i] == '!')
					while (var_list[i++]);
				  var_list[i++] = '!';
				  while (last_id[j])
					var_list[i++] = last_id[j++];
				  var_list[i++] = 0;
				  var_list[i++] = 0;
				}
#line 2769 "web2c-parser.c"
    break;

  case 137: /* VAR_ID: field_id_tok  */
#line 640 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { int i=0, j=0;
				  ii = add_to_table(last_id);
				  sym_table[ii].typ = var_id_tok;
				  sym_table[ii].var_formal = var_formals;
				  param_id_list[ids_paramed++] = ii;
				  while (var_list[i] == '!')
					while(var_list[i++]);
				  var_list[i++] = '!';
				  while (last_id[j])
					var_list[i++] = last_id[j++];
				  var_list[i++] = 0;
				  var_list[i++] = 0;
				}
#line 2787 "web2c-parser.c"
    break;

  case 139: /* $@35: %empty  */
#line 658 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                { my_output ("void mainbody( void ) {");
		  indent++;
		  new_line ();
		}
#line 2796 "web2c-parser.c"
    break;

  case 140: /* BODY: begin_tok $@35 STAT_LIST end_tok '.'  */
#line 663 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                { indent--;
                  my_output ("}");
                  new_line ();
                }
#line 2805 "web2c-parser.c"
    break;

  case 143: /* P_F_DEC: PROCEDURE_DEC ';'  */
#line 675 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { new_line(); remove_locals(); }
#line 2811 "web2c-parser.c"
    break;

  case 144: /* P_F_DEC: FUNCTION_DEC ';'  */
#line 677 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { new_line(); remove_locals(); }
#line 2817 "web2c-parser.c"
    break;

  case 147: /* $@36: %empty  */
#line 686 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { proc_is_noreturn = 1; }
#line 2823 "web2c-parser.c"
    break;

  case 149: /* $@37: %empty  */
#line 692 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { ii = add_to_table(last_id);
	      if (debug)
	        fprintf(stderr, "%3d Procedure %s\n", pf_count++, last_id);
	      sym_table[ii].typ = proc_id_tok;
	      strcpy(my_routine, last_id);
	      uses_eqtb = uses_mem = false;
	      my_output ("void");
	      new_line ();
	      orig_out = out;
	      out = 0;
	    }
#line 2839 "web2c-parser.c"
    break;

  case 150: /* PROCEDURE_HEAD: PROCEDURE_TOK undef_id_tok $@37 PARAM ';'  */
#line 704 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { strcpy(fn_return_type, "void");
	      do_proc_args();
	      gen_function_head(); }
#line 2847 "web2c-parser.c"
    break;

  case 151: /* $@38: %empty  */
#line 708 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { ii = l_s;
	      if (debug)
	        fprintf(stderr, "%3d Procedure %s\n", pf_count++, last_id);
	      strcpy(my_routine, last_id);
	      my_output ("void");
	      new_line ();
	    }
#line 2859 "web2c-parser.c"
    break;

  case 152: /* PROCEDURE_HEAD: procedure_tok DECLARED_PROC $@38 PARAM ';'  */
#line 716 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { strcpy(fn_return_type, "void");
	      do_proc_args();
	      gen_function_head();
            }
#line 2868 "web2c-parser.c"
    break;

  case 153: /* PARAM: %empty  */
#line 724 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              strcpy (z_id, last_id);
	      mark ();
	      ids_paramed = 0;
	    }
#line 2878 "web2c-parser.c"
    break;

  case 154: /* $@39: %empty  */
#line 730 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { sprintf (z_id, "z%s", last_id);
	      ids_paramed = 0;
	      if (sym_table[ii].typ == proc_id_tok)
	        sym_table[ii].typ = proc_param_tok;
	      else if (sym_table[ii].typ == fun_id_tok)
	        sym_table[ii].typ = fun_param_tok;
	      mark();
	    }
#line 2891 "web2c-parser.c"
    break;

  case 158: /* $@40: %empty  */
#line 746 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { ids_typed = ids_paramed; }
#line 2897 "web2c-parser.c"
    break;

  case 159: /* FORM_PAR_SEC1: $@40 VAR_ID_DEC_LIST ':' type_id_tok  */
#line 748 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { int i, need_var;
	      i = search_table(last_id);
	      need_var = !sym_table[i].var_not_needed;
	      for (i=ids_typed; i<ids_paramed; i++)
                {
	          strcpy(arg_type[i], last_id);
		  if (need_var && sym_table[param_id_list[i]].var_formal)
	            strcat(arg_type[i], " *");
		  else
                    sym_table[param_id_list[i]].var_formal = false;
	        }
	    }
#line 2914 "web2c-parser.c"
    break;

  case 160: /* $@41: %empty  */
#line 762 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                        {var_formals = 0; }
#line 2920 "web2c-parser.c"
    break;

  case 162: /* $@42: %empty  */
#line 763 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                          {var_formals = 1; }
#line 2926 "web2c-parser.c"
    break;

  case 167: /* $@43: %empty  */
#line 775 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              orig_out = out;
              out = 0;
              ii = add_to_table(last_id);
              if (debug)
                fprintf(stderr, "%3d Function %s\n", pf_count++, last_id);
              sym_table[ii].typ = fun_id_tok;
              strcpy (my_routine, last_id);
              uses_eqtb = uses_mem = false;
            }
#line 2941 "web2c-parser.c"
    break;

  case 168: /* $@44: %empty  */
#line 786 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              normal();
              array_bounds[0] = 0;
              array_offset[0] = 0;
            }
#line 2951 "web2c-parser.c"
    break;

  case 169: /* $@45: %empty  */
#line 792 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              get_result_type(fn_return_type);
              do_proc_args();
              gen_function_head();
            }
#line 2961 "web2c-parser.c"
    break;

  case 171: /* $@46: %empty  */
#line 799 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            {
              orig_out = out;
              out = 0;
              ii = l_s;
              if (debug)
                fprintf(stderr, "%3d Function %s\n", pf_count++, last_id);
              strcpy(my_routine, last_id);
              uses_eqtb = uses_mem = false;
            }
#line 2975 "web2c-parser.c"
    break;

  case 172: /* $@47: %empty  */
#line 809 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { normal();
              array_bounds[0] = 0;
              array_offset[0] = 0;
            }
#line 2984 "web2c-parser.c"
    break;

  case 173: /* $@48: %empty  */
#line 814 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { get_result_type(fn_return_type);
              do_proc_args();
              gen_function_head();
            }
#line 2993 "web2c-parser.c"
    break;

  case 179: /* $@49: %empty  */
#line 832 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("{"); indent++; new_line(); }
#line 2999 "web2c-parser.c"
    break;

  case 180: /* COMPOUND_STAT: begin_tok $@49 STAT_LIST end_tok  */
#line 834 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { indent--; my_output ("}"); new_line(); }
#line 3005 "web2c-parser.c"
    break;

  case 185: /* S_LABEL: i_num_tok  */
#line 847 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {if (!doreturn(temp)) {
				      sprintf(safe_string, "lab%s:", temp);
				    my_output (safe_string);
				 }
				}
#line 3015 "web2c-parser.c"
    break;

  case 186: /* UNLAB_STAT: SIMPLE_STAT  */
#line 855 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { semicolon(); }
#line 3021 "web2c-parser.c"
    break;

  case 187: /* UNLAB_STAT: STRUCT_STAT  */
#line 857 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { semicolon(); }
#line 3027 "web2c-parser.c"
    break;

  case 192: /* SIMPLE_STAT: break_tok  */
#line 865 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("break"); }
#line 3033 "web2c-parser.c"
    break;

  case 193: /* $@50: %empty  */
#line 869 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("="); }
#line 3039 "web2c-parser.c"
    break;

  case 195: /* $@51: %empty  */
#line 872 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("Result ="); }
#line 3045 "web2c-parser.c"
    break;

  case 197: /* @52: %empty  */
#line 877 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { if (strcmp(last_id, "mem") == 0)
					uses_mem = 1;
				  else if (strcmp(last_id, "eqtb") == 0)
					uses_eqtb = 1;
				  if (sym_table[l_s].var_formal)
					putchar('*');
				  my_output (last_id);
				  yyval = ex_32;
				}
#line 3059 "web2c-parser.c"
    break;

  case 199: /* VARIABLE: var_id_tok  */
#line 888 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { if (sym_table[l_s].var_formal)
					putchar('*');
				  my_output (last_id); yyval = ex_32; }
#line 3067 "web2c-parser.c"
    break;

  case 200: /* FUNC_ID_AS: fun_id_tok  */
#line 894 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = ex_32; }
#line 3073 "web2c-parser.c"
    break;

  case 201: /* FUNC_ID_AS: fun_param_tok  */
#line 896 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = ex_32; }
#line 3079 "web2c-parser.c"
    break;

  case 204: /* $@53: %empty  */
#line 904 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("["); }
#line 3085 "web2c-parser.c"
    break;

  case 205: /* VAR_DESIG: '[' $@53 EXPRESS VAR_DESIG1  */
#line 906 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("]"); }
#line 3091 "web2c-parser.c"
    break;

  case 206: /* VAR_DESIG: '.' field_id_tok  */
#line 908 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {if (tex || mf) {
				   if (strcmp(last_id, "int")==0)
					my_output (".cint");
				   else if (strcmp(last_id, "lh")==0)
					my_output (".v.LH");
				   else if (strcmp(last_id, "rh")==0)
					my_output (".v.RH");
				   else {
				     sprintf(safe_string, ".%s", last_id);
				     my_output (safe_string);
				   }
				 }
				 else {
				    sprintf(safe_string, ".%s", last_id);
				    my_output (safe_string);
				 }
				}
#line 3113 "web2c-parser.c"
    break;

  case 207: /* VAR_DESIG: '.' hhb0_tok  */
#line 926 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (".hh.b0"); }
#line 3119 "web2c-parser.c"
    break;

  case 208: /* VAR_DESIG: '.' hhb1_tok  */
#line 928 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (".hh.b1"); }
#line 3125 "web2c-parser.c"
    break;

  case 210: /* $@54: %empty  */
#line 933 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("]["); }
#line 3131 "web2c-parser.c"
    break;

  case 212: /* EXPRESS: UNARY_OP EXPRESS  */
#line 938 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = yyvsp[0]; }
#line 3137 "web2c-parser.c"
    break;

  case 213: /* $@55: %empty  */
#line 939 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                              { my_output ("+"); }
#line 3143 "web2c-parser.c"
    break;

  case 214: /* EXPRESS: EXPRESS '+' $@55 EXPRESS  */
#line 940 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3149 "web2c-parser.c"
    break;

  case 215: /* $@56: %empty  */
#line 941 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                              { my_output ("-"); }
#line 3155 "web2c-parser.c"
    break;

  case 216: /* EXPRESS: EXPRESS '-' $@56 EXPRESS  */
#line 942 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3161 "web2c-parser.c"
    break;

  case 217: /* $@57: %empty  */
#line 943 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                              { my_output ("*"); }
#line 3167 "web2c-parser.c"
    break;

  case 218: /* EXPRESS: EXPRESS '*' $@57 EXPRESS  */
#line 944 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3173 "web2c-parser.c"
    break;

  case 219: /* $@58: %empty  */
#line 945 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                  { my_output ("/"); }
#line 3179 "web2c-parser.c"
    break;

  case 220: /* EXPRESS: EXPRESS div_tok $@58 EXPRESS  */
#line 946 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3185 "web2c-parser.c"
    break;

  case 221: /* $@59: %empty  */
#line 947 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                              { my_output ("=="); }
#line 3191 "web2c-parser.c"
    break;

  case 222: /* EXPRESS: EXPRESS '=' $@59 EXPRESS  */
#line 948 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3197 "web2c-parser.c"
    break;

  case 223: /* $@60: %empty  */
#line 949 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                     { my_output ("!="); }
#line 3203 "web2c-parser.c"
    break;

  case 224: /* EXPRESS: EXPRESS not_eq_tok $@60 EXPRESS  */
#line 950 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3209 "web2c-parser.c"
    break;

  case 225: /* $@61: %empty  */
#line 951 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                  { my_output ("%"); }
#line 3215 "web2c-parser.c"
    break;

  case 226: /* EXPRESS: EXPRESS mod_tok $@61 EXPRESS  */
#line 952 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3221 "web2c-parser.c"
    break;

  case 227: /* $@62: %empty  */
#line 953 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                              { my_output ("<"); }
#line 3227 "web2c-parser.c"
    break;

  case 228: /* EXPRESS: EXPRESS '<' $@62 EXPRESS  */
#line 954 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3233 "web2c-parser.c"
    break;

  case 229: /* $@63: %empty  */
#line 955 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                              { my_output (">"); }
#line 3239 "web2c-parser.c"
    break;

  case 230: /* EXPRESS: EXPRESS '>' $@63 EXPRESS  */
#line 956 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3245 "web2c-parser.c"
    break;

  case 231: /* $@64: %empty  */
#line 957 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                      { my_output ("<="); }
#line 3251 "web2c-parser.c"
    break;

  case 232: /* EXPRESS: EXPRESS less_eq_tok $@64 EXPRESS  */
#line 958 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3257 "web2c-parser.c"
    break;

  case 233: /* $@65: %empty  */
#line 959 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                       { my_output (">="); }
#line 3263 "web2c-parser.c"
    break;

  case 234: /* EXPRESS: EXPRESS great_eq_tok $@65 EXPRESS  */
#line 960 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3269 "web2c-parser.c"
    break;

  case 235: /* $@66: %empty  */
#line 961 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                  { my_output ("&&"); }
#line 3275 "web2c-parser.c"
    break;

  case 236: /* EXPRESS: EXPRESS and_tok $@66 EXPRESS  */
#line 962 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3281 "web2c-parser.c"
    break;

  case 237: /* $@67: %empty  */
#line 963 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                 { my_output ("||"); }
#line 3287 "web2c-parser.c"
    break;

  case 238: /* EXPRESS: EXPRESS or_tok $@67 EXPRESS  */
#line 964 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); }
#line 3293 "web2c-parser.c"
    break;

  case 239: /* $@68: %empty  */
#line 966 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("/ ((double)"); }
#line 3299 "web2c-parser.c"
    break;

  case 240: /* EXPRESS: EXPRESS '/' $@68 EXPRESS  */
#line 968 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = max (yyvsp[-3], yyvsp[0]); my_output (")"); }
#line 3305 "web2c-parser.c"
    break;

  case 241: /* EXPRESS: FACTOR  */
#line 970 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { yyval = yyvsp[0]; }
#line 3311 "web2c-parser.c"
    break;

  case 243: /* UNARY_OP: unary_minus_tok  */
#line 976 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output ("- (integer)"); }
#line 3317 "web2c-parser.c"
    break;

  case 244: /* UNARY_OP: not_tok  */
#line 978 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output ("!"); }
#line 3323 "web2c-parser.c"
    break;

  case 245: /* $@69: %empty  */
#line 983 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output ("("); }
#line 3329 "web2c-parser.c"
    break;

  case 246: /* FACTOR: '(' $@69 EXPRESS ')'  */
#line 985 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output (")"); yyval = yyvsp[-3]; }
#line 3335 "web2c-parser.c"
    break;

  case 249: /* FACTOR: fun_id_tok  */
#line 989 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output (last_id); my_output ("()"); }
#line 3341 "web2c-parser.c"
    break;

  case 250: /* $@70: %empty  */
#line 991 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output (last_id); }
#line 3347 "web2c-parser.c"
    break;

  case 252: /* $@71: %empty  */
#line 996 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                           { my_output ("("); }
#line 3353 "web2c-parser.c"
    break;

  case 253: /* PARAM_LIST: '(' $@71 ACTUAL_PARAM_L ')'  */
#line 997 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                           { my_output (")"); }
#line 3359 "web2c-parser.c"
    break;

  case 255: /* $@72: %empty  */
#line 1002 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                             { my_output (","); }
#line 3365 "web2c-parser.c"
    break;

  case 258: /* ACTUAL_PARAM: type_id_tok  */
#line 1009 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
            { my_output (last_id); }
#line 3371 "web2c-parser.c"
    break;

  case 261: /* PROC_STAT: proc_id_tok  */
#line 1018 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (last_id); my_output ("()"); }
#line 3377 "web2c-parser.c"
    break;

  case 262: /* PROC_STAT: undef_id_tok  */
#line 1020 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (last_id);
				  ii = add_to_table(last_id);
				  sym_table[ii].typ = proc_id_tok;
				  my_output ("()");
				}
#line 3387 "web2c-parser.c"
    break;

  case 263: /* $@73: %empty  */
#line 1026 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (last_id); }
#line 3393 "web2c-parser.c"
    break;

  case 265: /* GO_TO_STAT: goto_tok i_num_tok  */
#line 1031 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {if (doreturn(temp)) {
				    if (strcmp(fn_return_type,"void"))
					my_output ("return Result");
				    else
					my_output ("return");
				 } else {
				     sprintf(safe_string, "goto lab%s",
					temp);
				     my_output (safe_string);
				 }
				}
#line 3409 "web2c-parser.c"
    break;

  case 272: /* $@74: %empty  */
#line 1057 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("if"); my_output ("("); }
#line 3415 "web2c-parser.c"
    break;

  case 274: /* $@75: %empty  */
#line 1062 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (")"); }
#line 3421 "web2c-parser.c"
    break;

  case 276: /* $@76: %empty  */
#line 1067 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { new_line (); }
#line 3427 "web2c-parser.c"
    break;

  case 278: /* $@77: %empty  */
#line 1070 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("{"); indent++; new_line();
				  my_output ("if"); my_output ("("); }
#line 3434 "web2c-parser.c"
    break;

  case 279: /* $@78: %empty  */
#line 1073 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { indent--; my_output ("}"); new_line(); }
#line 3440 "web2c-parser.c"
    break;

  case 282: /* $@79: %empty  */
#line 1079 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("else"); }
#line 3446 "web2c-parser.c"
    break;

  case 284: /* $@80: %empty  */
#line 1084 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("switch"); my_output ("("); }
#line 3452 "web2c-parser.c"
    break;

  case 285: /* $@81: %empty  */
#line 1086 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (")"); new_line();
				  my_output ("{"); indent++;
				}
#line 3460 "web2c-parser.c"
    break;

  case 286: /* CASE_STATEMENT: case_tok $@80 EXPRESS of_tok $@81 CASE_EL_LIST END_CASE  */
#line 1090 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { indent--; my_output ("}"); new_line(); }
#line 3466 "web2c-parser.c"
    break;

  case 289: /* CASE_ELEMENT: CASE_LAB_LIST ':' UNLAB_STAT  */
#line 1098 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("break"); semicolon(); }
#line 3472 "web2c-parser.c"
    break;

  case 292: /* CASE_LAB: i_num_tok  */
#line 1106 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("case");
				  my_output (temp);
				  my_output (":"); new_line();
				}
#line 3481 "web2c-parser.c"
    break;

  case 293: /* CASE_LAB: others_tok  */
#line 1111 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("default:"); new_line(); }
#line 3487 "web2c-parser.c"
    break;

  case 299: /* $@82: %empty  */
#line 1124 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("while");
				  my_output ("(");
				}
#line 3495 "web2c-parser.c"
    break;

  case 300: /* $@83: %empty  */
#line 1128 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (")"); }
#line 3501 "web2c-parser.c"
    break;

  case 302: /* $@84: %empty  */
#line 1133 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("do"); my_output ("{"); indent++; }
#line 3507 "web2c-parser.c"
    break;

  case 303: /* $@85: %empty  */
#line 1135 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { indent--; my_output ("}");
				  my_output ("while"); my_output ("( ! (");
				}
#line 3515 "web2c-parser.c"
    break;

  case 304: /* REP_STATEMENT: repeat_tok $@84 STAT_LIST until_tok $@85 EXPRESS  */
#line 1139 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (") )"); }
#line 3521 "web2c-parser.c"
    break;

  case 305: /* $@86: %empty  */
#line 1143 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {
				  my_output ("{");
				  my_output ("register");
				  my_output ("integer");
				  if (strict_for)
					my_output ("for_begin,");
				  my_output ("for_end;");
				 }
#line 3534 "web2c-parser.c"
    break;

  case 306: /* $@87: %empty  */
#line 1152 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { if (strict_for)
					my_output ("for_begin");
				  else
					my_output (control_var);
				  my_output ("="); }
#line 3544 "web2c-parser.c"
    break;

  case 307: /* $@88: %empty  */
#line 1158 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output ("; if (");
				  if (strict_for) my_output ("for_begin");
				  else my_output (control_var);
				  my_output (relation);
				  my_output ("for_end)");
				  if (strict_for) {
					my_output ("{");
					my_output (control_var);
					my_output ("=");
					my_output ("for_begin");
					semicolon();
				  }
				  my_output ("do");
				  indent++;
				  new_line();
				  }
#line 3565 "web2c-parser.c"
    break;

  case 308: /* FOR_STATEMENT: for_tok $@86 CONTROL_VAR assign_tok $@87 FOR_LIST do_tok $@88 STATEMENT  */
#line 1175 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {
				  char *top = strrchr (for_stack, '#');
				  indent--;
                                  new_line();
				  my_output ("while");
				  my_output ("(");
				  my_output (top+1);
				  my_output (")");
				  my_output (";");
				  my_output ("}");
				  if (strict_for)
					my_output ("}");
				  *top=0;
				  new_line();
				}
#line 3585 "web2c-parser.c"
    break;

  case 309: /* CONTROL_VAR: var_id_tok  */
#line 1193 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { strcpy(control_var, last_id); }
#line 3591 "web2c-parser.c"
    break;

  case 310: /* $@89: %empty  */
#line 1197 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (";"); }
#line 3597 "web2c-parser.c"
    break;

  case 311: /* $@90: %empty  */
#line 1199 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {
				  strcpy(relation, "<=");
				  my_output ("for_end");
				  my_output ("="); }
#line 3606 "web2c-parser.c"
    break;

  case 312: /* FOR_LIST: EXPRESS $@89 to_tok $@90 EXPRESS  */
#line 1204 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {
				  sprintf(for_stack + strlen(for_stack),
				    "#%s++ < for_end", control_var);
				}
#line 3615 "web2c-parser.c"
    break;

  case 313: /* $@91: %empty  */
#line 1209 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                { my_output (";"); }
#line 3621 "web2c-parser.c"
    break;

  case 314: /* $@92: %empty  */
#line 1211 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {
				  strcpy(relation, ">=");
				  my_output ("for_end");
				  my_output ("="); }
#line 3630 "web2c-parser.c"
    break;

  case 315: /* FOR_LIST: EXPRESS $@91 downto_tok $@92 EXPRESS  */
#line 1216 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"
                                {
				  sprintf(for_stack + strlen(for_stack),
				    "#%s-- > for_end", control_var);
				}
#line 3639 "web2c-parser.c"
    break;


#line 3643 "web2c-parser.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 1221 "/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source/texk/web2c/web2c/web2c-parser.y"


static void
compute_array_bounds (void)
{
  long lb;
  char tmp[200];

  if (lower_sym == 0 || upper_sym == 0) {
    yyerror ("Cannot handle variable subrange in array decl");
  }
  else if (lower_sym == -1) {	/* lower is a constant */
    lb = lower_bound - 1;
    if (lb==0) lb = -1;	/* Treat lower_bound==1 as if lower_bound==0 */
    if (upper_sym == -1)	/* both constants */
        sprintf(tmp, "[%ld]", upper_bound - lb);
    else {			/* upper a symbol, lower constant */
        if (lb < 0)
            sprintf(tmp, "[%s + %ld]",
                            symbol(upper_sym), (-lb));
        else
            sprintf(tmp, "[%s - %ld]",
                            symbol(upper_sym), lb);
    }
    if (lower_bound < 0 || lower_bound > 1) {
        if (*array_bounds) {
          yyerror ("Cannot handle offset in second dimension");
        }
        if (lower_bound < 0) {
            sprintf(array_offset, "+%ld", -lower_bound);
        } else {
            sprintf(array_offset, "-%ld", lower_bound);
        }
    }
    strcat(array_bounds, tmp);
  } else {			/* lower is a symbol */
      if (upper_sym != -1)	/* both are symbols */
          sprintf(tmp, "[%s - %s + 1]", symbol(upper_sym),
              symbol(lower_sym));
      else {			/* upper constant, lower symbol */
          sprintf(tmp, "[%ld - %s]", upper_bound + 1,
              symbol(lower_sym));
      }
      if (*array_bounds) {
        yyerror ("Cannot handle symbolic offset in second dimension");
      }
      sprintf(array_offset, "- (int)(%s)", symbol(lower_sym));
      strcat(array_bounds, tmp);
  }
}


/* Kludge around negative lower array bounds.  */

static void
fixup_var_list (void)
{
  int i, j;
  char output_string[100], real_symbol[100];

  for (i = 0; var_list[i++] == '!'; )
    {
      for (j = 0; (real_symbol[j++] = var_list[i++]); )
        ;
      if (*array_offset)
        {
          fprintf (out, "\n#define %s (%s %s)\n  ",
                          real_symbol, next_temp, array_offset);
          strcpy (real_symbol, next_temp);
          /* Add the temp to the symbol table, so that change files can
             use it later on if necessary.  */
          j = add_to_table (next_temp);
          sym_table[j].typ = var_id_tok;
          find_next_temp ();
        }
      sprintf (output_string, "%s%s%c", real_symbol, array_bounds,
                      var_list[i] == '!' ? ',' : ' ');
      my_output (output_string);
  }
  semicolon ();
}


/* If we're not processing TeX, we return false.  Otherwise,
   return true if the label is "10" and we're not in one of four TeX
   routines where the line labeled "10" isn't the end of the routine.
   Otherwise, return 0.  */

static boolean
doreturn (string label)
{
    return
      tex
      && STREQ (label, "10")
      && !STREQ (my_routine, "macrocall")
      && !STREQ (my_routine, "hpack")
      && !STREQ (my_routine, "vpackage")
      && !STREQ (my_routine, "trybreak");
}


/* Return the absolute value of a long.  */
static long
my_labs (long x)
{
    if (x < 0L) return(-x);
    return(x);
}


/* Output current function declaration to coerce file.  */

static void
do_proc_args (void)
{
  /* If we want ANSI code and one of the parameters is a var
     parameter, then use the #define to add the &.  We do this by
     adding a 'z' at the front of the name.  gen_function_head will do
     the real work.  */
  int i;
  int var = 0;
  for (i = 0; i < ids_paramed; ++i)
    var += sym_table[param_id_list[i]].var_formal;
  if (var) {
    for (i = strlen (z_id); i >= 0; --i)
      z_id[i+1] = z_id[i];
    z_id[0] = 'z';
  }

  if (proc_is_noreturn) {
    fprintf (coerce, "WEB2C_NORETURN ");
    proc_is_noreturn = 0;
  }
  /* We can't use our P?H macros here, since there might be an arbitrary
     number of function arguments.  */
  fprintf (coerce, "%s %s (", fn_return_type, z_id);
  if (ids_paramed == 0) fprintf (coerce, "void");
  for (i = 0; i < ids_paramed; i++) {
    if (i > 0)
      putc (',', coerce);
    fprintf (coerce, "%s %s", arg_type[i], symbol (param_id_list[i]));
  }
  fprintf (coerce, ");\n");
}

static void
gen_function_head (void)
{
    int i;

    if (strcmp(my_routine, z_id)) {
	fprintf(coerce, "#define %s(", my_routine);
	for (i=0; i<ids_paramed; i++) {
	    if (i > 0)
		fprintf(coerce, ", %s", symbol(param_id_list[i]));
	    else
		fprintf(coerce, "%s", symbol(param_id_list[i]));
	}
	fprintf(coerce, ") %s(", z_id);
	for (i=0; i<ids_paramed; i++) {
	    if (i > 0)
		fputs(", ", coerce);
	    fprintf(coerce, "(%s) ", arg_type[i]);
	    fprintf(coerce, "%s(%s)",
		    sym_table[param_id_list[i]].var_formal?"&":"",
		    symbol(param_id_list[i]));
	}
	fprintf(coerce, ")\n");
    }
    out = orig_out;
    new_line ();
    /* We now always use ANSI C prototypes.  */
    my_output (z_id);
    my_output ("(");
    if (ids_paramed == 0) my_output ("void");
    for (i=0; i<ids_paramed; i++) {
        if (i > 0) my_output (",");
        my_output (arg_type[i]);
        my_output (symbol (param_id_list[i]));
    }
    my_output (")");
    new_line ();
}
