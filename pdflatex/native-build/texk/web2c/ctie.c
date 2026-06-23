#define version_number "1.1"
#define banner "This is CTIE, Version 1.1"
#define copyright  \
"Copyright 2002,2003 Julian Gilbey." \
"  All rights reserved.  There is no warranty.\n" \
"Run with the --version option for other important information."
#define buf_size 1024
#define max_file_index 32
#define xisupper(c) (isupper((unsigned char)c)&&((unsigned char)c<0200))
#define max_include_files 20
#define max_file_name_length 1024
#define too_long() {total_include_files--;free(new_inc); \
err_print(i,"! Include file name too long");goto restart;}
#define fatal_error(i,s,t) { \
fprintf(stderr,"\n%s",s); \
err_print(i,t); \
history= fatal; \
exit(wrap_up()); \
}
#define none (-1)
#define kpse_find_cweb(name) kpse_find_file(name,kpse_cweb_format,true)
/*2:*/
#line 89 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*8:*/
#line 181 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"

#include <kpathsea/kpathsea.h> 
#include <w2c/config.h> 
#include <lib/lib.h> 
#line 174 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


#line 199 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*:8*/
#line 90 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*10:*/
#line 211 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 236 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
typedef enum{
search,
test,
reading,
ignore}in_file_modes;
typedef enum{
unknown,
master,
chf}file_types;
#line 221 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


#line 250 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*:10*//*11:*/
#line 229 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 259 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
typedef enum{
normal,
pre,
post}out_md_type;
#line 234 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


/*:11*//*12:*/
#line 239 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

typedef int file_index;


/*:12*//*13:*/
#line 246 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

typedef struct _indsc{
char file_name[max_file_name_length];
long line;
FILE*the_file;
struct _indsc*parent;
}include_description;


/*:13*//*14:*/
#line 259 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

typedef struct _idsc{
string file_name;
char buffer[buf_size];
in_file_modes mode;
long line;
file_types type_of_file;
include_description*current_include;
char*buffer_end;
char*limit;
char*loc;
FILE*the_file;
int dont_match;
}input_description;


/*:14*/
#line 91 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*28:*/
#line 584 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 378 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
void err_print(file_index,const char*);
#line 586 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*:28*//*33:*/
#line 673 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 406 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
int wrap_up(void);
#line 675 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*:33*//*35:*/
#line 696 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 412 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
void pfatal_error(const char*,const char*);
#line 698 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*:35*//*67:*/
#line 1232 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 628 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static void usage_help(void);
static void print_version_and_exit(const_string,const_string);
#line 1235 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


/*:67*/
#line 92 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*7:*/
#line 164 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"

typedef enum{
spotless,
troublesome,
fatal}return_code;
static return_code history= spotless;
#line 164 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


/*:7*//*15:*/
#line 286 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

int total_include_files= 0;

/*:15*//*16:*/
#line 292 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

file_index actual_input,test_input,no_ch;
file_types prod_chf= unknown;
out_md_type out_mode;

/*:16*//*18:*/
#line 309 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

input_description*input_organisation[max_file_index+1];


/*:18*//*22:*/
#line 406 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

boolean input_has_ended= false;


/*:22*//*39:*/
#line 742 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

FILE*out_file;
string out_name;


#line 465 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*:39*//*66:*/
#line 1217 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 620 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
const_string CTIEHELP[]= {
"Usage: ctie -m|-c outfile master changefile(s)",
#line 1220 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
"  Create a new master file or change file from the given",
"  master (C)WEB file and changefiles.",
"  All filenames are taken literally; no suffixes are added.",
"",
"-m  create a new master file from original (C)WEB and change file(s)",
"-c  create a master change file for original (C)WEB file from changefile(s)",
"--help      display this help and exit",
"--version   display version information and exit",
NULL
};


/*:66*/
#line 93 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*29:*/
#line 589 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 385 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
void err_print(file_index i,const char*s)

#line 592 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
char*k,*l;
fprintf(stderr,*s=='!'?"\n%s":"%s",s);
if(i>=0)/*30:*/
#line 611 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
register input_description*inp_desc= input_organisation[i];
register include_description*inc_desc= inp_desc->current_include;

if(inc_desc!=NULL){
fprintf(stderr,". (l. %ld of include file %s",inc_desc->line,
inc_desc->file_name);
fprintf(stderr," included from l. %ld of %s file %s)\n",
inp_desc->line,
inp_desc->type_of_file==master?"master":"change",
inp_desc->file_name);
}
else
fprintf(stderr,". (l. %ld of %s file %s)\n",inp_desc->line,
inp_desc->type_of_file==master?"master":"change",
inp_desc->file_name);
l= (inp_desc->loc>=inp_desc->limit?inp_desc->limit:inp_desc->loc);
if(l> inp_desc->buffer){
for(k= inp_desc->buffer;k<l;k++)
if(*k=='\t')putc(' ',stderr);
else putc(*k,stderr);
putc('\n',stderr);
for(k= inp_desc->buffer;k<l;k++)
putc(' ',stderr);
}
for(k= l;k<inp_desc->limit;k++)
putc(*k,stderr);
putc('\n',stderr);
}


/*:30*/
#line 595 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

else putc('\n',stderr);
fflush(stderr);
history= troublesome;
}

/*:29*//*36:*/
#line 699 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 419 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
void pfatal_error(const char*s,const char*t)
#line 702 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
char*strerr= strerror(errno);

fprintf(stderr,"\n%s%s",s,t);
if(strerr)fprintf(stderr," (%s)\n",strerr);
#line 425 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
else putc('\n',stderr);
#line 708 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
history= fatal;
exit(wrap_up());
}


#line 434 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*:36*/
#line 94 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*19:*/
#line 328 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 275 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static boolean
get_line(file_index i,boolean do_includes)
#line 331 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
register input_description*inp_desc= input_organisation[i];
register FILE*fp;

if(inp_desc->mode==ignore)return false;

restart:
if(inp_desc->current_include!=NULL){
register include_description*inc_desc= inp_desc->current_include;

fp= inc_desc->the_file;
/*24:*/
#line 426 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
register int c;
register char*k;

if(feof(fp))
/*25:*/
#line 452 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
include_description*temp= inc_desc->parent;

fclose(fp);
free(inc_desc);
total_include_files--;
inp_desc->current_include= temp;
goto restart;
}


/*:25*/
#line 432 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


inp_desc->limit= k= inp_desc->buffer;
while(k<=inp_desc->buffer_end&&(c= getc(fp))!=EOF&&c!='\n')
#line 300 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if((*(k++)= c)!=' '&&c!='\r')inp_desc->limit= k;
#line 437 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
if(k> inp_desc->buffer_end)
if((c= getc(fp))!=EOF&&c!='\n'){
ungetc(c,fp);inp_desc->loc= inp_desc->buffer;
err_print(i,"! Input line too long");

}
if(c==EOF&&inp_desc->limit==inp_desc->buffer)
/*25:*/
#line 452 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
include_description*temp= inc_desc->parent;

fclose(fp);
free(inc_desc);
total_include_files--;
inp_desc->current_include= temp;
goto restart;
}


/*:25*/
#line 444 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


inc_desc->line++;
}

/*:24*/
#line 342 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

}
else{
fp= inp_desc->the_file;
/*20:*/
#line 366 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
register int c;
register char*k;

if(feof(fp))
/*21:*/
#line 394 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
inp_desc->mode= ignore;
inp_desc->limit= NULL;
if(inp_desc->type_of_file==master)input_has_ended= true;
fclose(fp);
return false;
}


/*:21*/
#line 372 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


inp_desc->limit= k= inp_desc->buffer;
while(k<=inp_desc->buffer_end&&(c= getc(fp))!=EOF&&c!='\n')
#line 288 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if((*(k++)= c)!=' '&&c!='\r')inp_desc->limit= k;
#line 377 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
if(k> inp_desc->buffer_end)
if((c= getc(fp))!=EOF&&c!='\n'){
ungetc(c,fp);inp_desc->loc= inp_desc->buffer;
err_print(i,"! Input line too long");

}
if(c==EOF&&inp_desc->limit==inp_desc->buffer)
/*21:*/
#line 394 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
inp_desc->mode= ignore;
inp_desc->limit= NULL;
if(inp_desc->type_of_file==master)input_has_ended= true;
fclose(fp);
return false;
}


/*:21*/
#line 384 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


#line 294 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*23:*/
#line 414 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

inp_desc->line++;
if(inp_desc->type_of_file==master&&inp_desc->line%100==0){
if(inp_desc->line%500==0)printf("%ld",inp_desc->line);
else putchar('.');
fflush(stdout);
}


/*:23*/
#line 387 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 388 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
}


/*:20*/
#line 346 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

}

if(do_includes)
/*26:*/
#line 467 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
inp_desc->loc= inp_desc->buffer;
*inp_desc->limit= ' ';
if(*inp_desc->buffer=='@'&&
(inp_desc->buffer[1]=='i'||inp_desc->buffer[1]=='I')){
inp_desc->loc= inp_desc->buffer+2;
*inp_desc->limit= '"';
while(*inp_desc->loc==' '||*inp_desc->loc=='\t')
inp_desc->loc++;
if(inp_desc->loc>=inp_desc->limit){
err_print(i,"! Include file name not given");

goto restart;
}
if(total_include_files>=max_include_files){
err_print(i,"! Too many nested includes");

goto restart;
}
total_include_files++;
/*27:*/
#line 507 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
include_description*new_inc;
#line 323 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
char*file_name_end;
string fullname;
char*k;
#line 514 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

new_inc= (include_description*)malloc(sizeof(include_description));
if(new_inc==NULL)
fatal_error(i,"! No memory for new include descriptor","");
new_inc->line= 0;
k= new_inc->file_name;
file_name_end= k+max_file_name_length-1;

if(*inp_desc->loc=='"'){
inp_desc->loc++;
while(*inp_desc->loc!='"'&&k<=file_name_end)
*k++= *inp_desc->loc++;
if(inp_desc->loc==inp_desc->limit)
k= file_name_end+1;
}else
while(*inp_desc->loc!=' '&&*inp_desc->loc!='\t'&&
*inp_desc->loc!='"'&&k<=file_name_end)*k++= *inp_desc->loc++;
if(k> file_name_end)too_long();

*k= '\0';
#line 331 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if((fullname= kpse_find_cweb(new_inc->file_name))!=NULL
&&(new_inc->the_file= fopen(fullname,"r"))!=NULL){
free(fullname);
#line 535 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
new_inc->parent= inp_desc->current_include;
inp_desc->current_include= new_inc;
goto restart;
}
#line 563 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
total_include_files--;
free(new_inc);
#line 367 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if(fullname){
free(fullname);
err_print(i,"! Cannot open include file");
}else
err_print(i,"! Cannot find include file");
#line 566 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

goto restart;
}



/*:27*/
#line 488 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
;
}
}


/*:26*/
#line 351 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

return true;
}


/*:19*//*32:*/
#line 663 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 392 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
int wrap_up(void)
#line 665 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
/*34:*/
#line 682 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

switch(history){
case spotless:
printf("\n(No errors were found.)\n");break;
case troublesome:
printf("\n(Pardon me, but I think I spotted something wrong.)\n");break;
case fatal:printf("(That was a fatal error, my friend.)\n");
}


/*:34*/
#line 666 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
;
#line 399 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if(history> spotless)return EXIT_FAILURE;
else return EXIT_SUCCESS;
#line 669 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
}

/*:32*//*42:*/
#line 791 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 525 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static boolean
lines_dont_match(file_index i,file_index j)
#line 794 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
register input_description*iptr= input_organisation[i],
*jptr= input_organisation[j];

if(iptr->limit-iptr->buffer!=jptr->limit-jptr->buffer)
return true;
return strncmp(iptr->buffer,jptr->buffer,iptr->limit-iptr->buffer);
}


/*:42*//*43:*/
#line 808 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 533 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static void
init_change_file(file_index i)
#line 811 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
register input_description*inp_desc= input_organisation[i];
char ccode;

inp_desc->limit= inp_desc->buffer;
/*44:*/
#line 827 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

while(1){
if(!get_line(i,false))return;
if(inp_desc->limit<inp_desc->buffer+2)continue;
if(inp_desc->buffer[0]!='@')continue;
ccode= inp_desc->buffer[1];
#line 540 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if(xisupper(ccode))ccode= tolower((unsigned char)ccode);
#line 834 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
if(ccode=='x')break;
if(ccode=='y'||ccode=='z'||ccode=='i'){
inp_desc->loc= inp_desc->buffer+2;
err_print(i,"! Missing @x in change file");

}
}

/*:44*/
#line 816 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*45:*/
#line 844 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

do{
if(!get_line(i,true)){
err_print(i,"! Change file ended after @x");

return;
}
}while(inp_desc->limit==inp_desc->buffer);


/*:45*/
#line 817 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

inp_desc->dont_match= 0;
}


/*:43*//*46:*/
#line 857 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 547 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static void
put_line(file_index j)
#line 860 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
char*ptr= input_organisation[j]->buffer;
char*lmt= input_organisation[j]->limit;

while(ptr<lmt)putc(*ptr++,out_file);
putc('\n',out_file);
}


/*:46*//*47:*/
#line 872 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 555 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static boolean
e_of_ch_module(file_index i)
#line 875 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
register input_description*inp_desc= input_organisation[i];

if(inp_desc->limit==NULL){
err_print(i,"! Change file ended without @z");

return true;
}else if(inp_desc->limit>=inp_desc->buffer+2)
if(inp_desc->buffer[0]=='@'&&
(inp_desc->buffer[1]=='Z'||inp_desc->buffer[1]=='z'))
return true;
return false;
}


/*:47*//*48:*/
#line 893 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 563 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static boolean
e_of_ch_preamble(file_index i)
#line 896 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
register input_description*inp_desc= input_organisation[i];

if(inp_desc->limit>=inp_desc->buffer+2&&inp_desc->buffer[0]=='@')
if(inp_desc->buffer[1]=='Y'||inp_desc->buffer[1]=='y'){
if(inp_desc->dont_match> 0){
inp_desc->loc= inp_desc->buffer+2;
fprintf(stderr,"\n! Hmm... %d ",inp_desc->dont_match);
err_print(i,"of the preceding lines failed to match");
}
return true;
}
return false;
}



/*:48*//*59:*/
#line 1105 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 583 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static void
usage_error(void)
{
/*60:*/
#line 1118 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 599 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
printf("%s%s\n",banner,versionstring);
#line 1120 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
printf("%s\n",copyright);


/*:60*/
#line 586 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
;
fprintf(stderr,"Usage: ctie -m|-c outfile master changefile(s)\n");
#line 1110 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
fprintf(stderr,"Type ctie --help for more information\n");
#line 593 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
exit(EXIT_FAILURE);
#line 1112 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
}


/*:59*/
#line 95 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*3:*/
#line 101 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 82 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
int main(int argc,string*argv)
#line 104 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
{
#line 88 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*71:*/
#line 730 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"

kpse_set_program_name(argv[0],"ctie");
#line 1278 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


/*:71*/
#line 88 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"

/*17:*/
#line 300 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

actual_input= 0;
out_mode= normal;

/*:17*/
#line 89 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"

#line 106 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
/*61:*/
#line 1135 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
if(argc> max_file_index+5-1)usage_error();
no_ch= -1;
while(--argc> 0){
argv++;
if(strcmp("-help",*argv)==0||strcmp("--help",*argv)==0)
/*64:*/
#line 1202 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

usage_help();



/*:64*/
#line 1142 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
;
if(strcmp("-version",*argv)==0||strcmp("--version",*argv)==0)
/*65:*/
#line 1208 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
print_version_and_exit("CTIE",version_number);

}


/*:65*/
#line 1144 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
;
if(**argv=='-')/*62:*/
#line 1158 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

if(prod_chf!=unknown)usage_error();
else
switch(*(*argv+1)){
case'c':case'C':prod_chf= chf;break;
case'm':case'M':prod_chf= master;break;
default:usage_error();
}


/*:62*/
#line 1145 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

else/*63:*/
#line 1172 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
#line 613 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if(no_ch==none){
#line 1175 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
out_name= *argv;
}else{
register input_description*inp_desc;

inp_desc= (input_description*)malloc(sizeof(input_description));
if(inp_desc==NULL)
fatal_error(-1,"! No memory for input descriptor","");

inp_desc->mode= search;
inp_desc->line= 0;
inp_desc->type_of_file= chf;
inp_desc->limit= inp_desc->buffer;
inp_desc->buffer[0]= ' ';
inp_desc->loc= inp_desc->buffer+1;
inp_desc->buffer_end= inp_desc->buffer+buf_size-2;
inp_desc->file_name= *argv;
inp_desc->current_include= NULL;
input_organisation[no_ch]= inp_desc;
}
no_ch++;
}


/*:63*/
#line 1146 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

}
if(no_ch<=0||prod_chf==unknown)usage_error();
}


/*:61*/
#line 106 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 95 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*60:*/
#line 1118 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 599 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
printf("%s%s\n",banner,versionstring);
#line 1120 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
printf("%s\n",copyright);


/*:60*/
#line 95 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"

#line 108 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
/*40:*/
#line 469 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"

{
string fullname;

if((fullname= kpse_find_cweb(input_organisation[0]->file_name))!=NULL){
if((input_organisation[0]->the_file= fopen(fullname,"r"))==NULL)
pfatal_error("! Cannot open master file ",
input_organisation[0]->file_name);
free(fullname);
}else{
fatal_error(-1,"! Cannot find master file ",
input_organisation[0]->file_name);
}


#line 759 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
printf("(%s)\n",input_organisation[0]->file_name);
input_organisation[0]->type_of_file= master;
get_line(0,true);
}


/*:40*/
#line 108 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*41:*/
#line 500 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"

{
file_index i;
string fullname;

i= 1;
while(i<no_ch){
if((fullname= kpse_find_cweb(input_organisation[i]->file_name))
!=NULL){
if((input_organisation[i]->the_file= fopen(fullname,"r"))==NULL)
pfatal_error("! Cannot open change file ",
input_organisation[i]->file_name);
free(fullname);
}else{
fatal_error(-1,"! Cannot find change file ",
input_organisation[i]->file_name);
}


#line 780 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
printf("(%s)\n",input_organisation[i]->file_name);
init_change_file(i);
i++;
}
}


/*:41*/
#line 109 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*38:*/
#line 729 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
#line 442 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if((out_file= fopen(out_name,"wb"))==NULL){
#line 733 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
pfatal_error("! Cannot open/create output file","");

}
}


#line 448 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*:38*/
#line 110 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*57:*/
#line 1074 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

actual_input= 0;
input_has_ended= false;
while(input_has_ended==false||actual_input!=0)
/*49:*/
#line 917 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
file_index test_file;

/*50:*/
#line 934 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
register input_description*inp_desc;
while(actual_input> 0&&e_of_ch_module(actual_input)){
inp_desc= input_organisation[actual_input];
if(inp_desc->type_of_file==master){

fatal_error(-1,"! This can't happen: change file is master file","");

}
inp_desc->mode= search;
init_change_file(actual_input);
while((input_organisation[actual_input]->mode!=reading
&&actual_input> 0))
actual_input--;
}
}


/*:50*/
#line 921 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

if(input_has_ended&&actual_input==0)break;
/*51:*/
#line 960 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

test_input= none;
test_file= actual_input;
while(test_input==none&&test_file<no_ch-1){
test_file++;
switch(input_organisation[test_file]->mode){
case search:
if(lines_dont_match(actual_input,test_file)==false){
input_organisation[test_file]->mode= test;
test_input= test_file;
}
break;
case test:
if(lines_dont_match(actual_input,test_file)){

input_organisation[test_file]->dont_match++;
}
test_input= test_file;
break;
case reading:
break;
case ignore:
break;
}
}


/*:51*/
#line 923 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*52:*/
#line 993 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

if(prod_chf==chf){
while(1){
/*53:*/
#line 1007 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

if(out_mode==normal){
if(test_input!=none){
fprintf(out_file,"@x\n");
out_mode= pre;
}else break;
}


/*:53*/
#line 996 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*54:*/
#line 1021 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

if(out_mode==pre){
if(test_input==none){
fprintf(out_file,"@y\n");
out_mode= post;
}else{
if(input_organisation[actual_input]->type_of_file==master)
put_line(actual_input);
break;
}
}


/*:54*/
#line 997 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*55:*/
#line 1040 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

if(out_mode==post){
if(input_organisation[actual_input]->type_of_file==chf){
if(test_input==none)put_line(actual_input);
break;
}else{
fprintf(out_file,"@z\n\n");
out_mode= normal;
}
}


/*:55*/
#line 998 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

}
}else
if(test_input==none)put_line(actual_input);


/*:52*/
#line 924 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*56:*/
#line 1055 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

get_line(actual_input,true);
if(test_input!=none){
get_line(test_input,true);
if(e_of_ch_preamble(test_input)==true){
get_line(test_input,true);
input_organisation[test_input]->mode= reading;
actual_input= test_input;
test_input= none;
}
}


/*:56*/
#line 925 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

}


/*:49*/
#line 1078 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 571 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
if(out_mode==pre)
fprintf(out_file,"@y\n"),out_mode= post;
if(out_mode==post)
fprintf(out_file,"@z\n");
#line 1081 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


/*:57*/
#line 111 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

/*58:*/
#line 1087 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

{
file_index i;

for(i= 1;i<no_ch;i++){
if(input_organisation[i]->mode!=ignore){
input_organisation[i]->loc= input_organisation[i]->buffer;
err_print(i,"! Change file entry did not match");

}
}
}


/*:58*/
#line 112 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

exit(wrap_up());
}

#line 111 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*:3*/
#line 96 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


/*:2*//*68:*/
#line 1237 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 637 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static void
usage_help(void)
{
const_string*message= CTIEHELP;
#line 1241 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

while(*message){
fputs(*message,stdout);
putchar('\n');
++message;
}
putchar('\n');
#line 646 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
exit(EXIT_SUCCESS);
#line 1249 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"
}


/*:68*//*69:*/
#line 1252 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"

#line 663 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
static void
print_version_and_exit(const_string name,const_string version)
{
printf("%s %s%s\n",name,version,versionstring);
puts(kpathsea_version_string);

puts("Copyright (C) 2002,2003 Julian Gilbey.");
puts("Kpathsea is copyright (C) 1999 Free Software Foundation, Inc.");

puts("There is NO warranty.  This is free software.");
puts("Redistribution of this software is covered by the terms of");
puts("both the CTIE copyright and the GNU General Public Licence.");
puts("For more information about these matters, see the files");
puts("named COPYING and the CTIE source.");
puts("Primary author of CTIE: Julian Gilbey.");
puts("Kpathsea written by Karl Berry and others.");

exit(EXIT_SUCCESS);
}
#line 1265 "../../../texlive-source/texk/web2c/ctiedir/ctie.w"


#line 700 "../../../texlive-source/texk/web2c/ctiedir/ctie-k.ch"
/*:69*/
