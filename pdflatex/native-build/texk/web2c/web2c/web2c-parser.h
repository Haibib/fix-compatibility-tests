/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

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
