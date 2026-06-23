#define buf_size 100
#define string_block_size 8192
#define nodes_per_block 340
/*1:*/
#line 9 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 22 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
#include <ctype.h> 
#line 11 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
/*4:*/
#line 84 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"

#line 97 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
typedef union{
char*s;
struct node_struct*n;
}mixed;
typedef struct node_struct{
#line 90 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
const char*id;
#line 103 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
mixed data;
struct node_struct*next;
}node;

/*:4*/
#line 11 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

/*2:*/
#line 43 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

FILE*f;
char buf[buf_size];
char title[buf_size];
char cur_name[buf_size];

#line 59 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
/*:2*//*7:*/
#line 159 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

char*next_string,*bad_string;
node*next_node,*bad_node;
node header;
node sentinel;

/*:7*//*18:*/
#line 362 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

char collate[102];
char ord[256];

/*:18*/
#line 12 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

/*5:*/
#line 114 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 99 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
char*save_string(
char*s)
#line 117 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
{
#line 106 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
char*p,*q;int l;
#line 119 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
for(p= s;*p;p++);
l= p-s+1;
if(l> string_block_size){
fprintf(stderr,"twinx: Huge string `%.20s...' will be truncated!\n",s);
l= string_block_size;
s[l-1]= '\0';
}
if(next_string+l>=bad_string){
next_string= (char*)malloc(string_block_size);
if(next_string==NULL){
fprintf(stderr,"twinx: Not enough room for strings!\n");
exit(-1);
}
bad_string= next_string+string_block_size;
}
for(p= s,q= next_string;*p;p++)*q++= *p;
*q= '\0';
next_string= q+1;
return next_string-l;
}

/*:5*//*6:*/
#line 144 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 114 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
node*new_node(void)
#line 146 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
{
if(next_node==bad_node){
next_node= (node*)calloc(nodes_per_block,sizeof(node));
if(next_node==NULL){
fprintf(stderr,"twinx: Not enough room for nodes!\n");
exit(-2);
}
bad_node= next_node+nodes_per_block;
}
next_node++;
return next_node-1;
}

/*:6*//*17:*/
#line 346 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 204 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
int compare(
node*p,node*q)
#line 212 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
{unsigned char*pp,*qq;
#line 350 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
for(pp= (unsigned char*)p->id+3,qq= (unsigned char*)q->id+3;
*pp&&ord[*pp]==ord[*qq];pp++,qq++);
if(*pp||*qq)return ord[*pp]-ord[*qq];
for(pp= (unsigned char*)p->id+3,qq= (unsigned char*)q->id+3;
*pp&&*pp==*qq;pp++,qq++);
if(*pp||*qq)return(int)*pp-(int)*qq;
if(p->id[0]!=q->id[0])return p->id[0]-q->id[0];
return p->id[1]-q->id[1];
}

/*:17*//*20:*/
#line 389 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 235 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
void collapse(
node*p,node*q)
#line 242 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
{node*x;
#line 393 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
for(x= q->data.n;x->next;x= x->next);
x->next= p->data.n;
p->data.n= q->data.n;
}

/*:20*/
#line 13 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"


#line 33 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
int main(
int argc,
char*argv[])
#line 18 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
{/*9:*/
#line 180 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 120 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
node*main_node;
#line 182 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

/*:9*/
#line 18 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
/*8:*/
#line 172 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

next_string= bad_string= NULL;
next_node= bad_node= NULL;
header.next= NULL;
header.id= "  {";
sentinel.id= "  {\200}";
main_node= &header;

/*:8*//*19:*/
#line 373 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

collate[0]= 0;strcpy(collate+1,"} \1\2\3\4\5\6\7\10\11\12\13\14\15\16\17\
\20\21\22\23\24\25\26\27\30\31\32\33\34\35\36\37\
!\42#$%&'()*+,-./:;<=>?@[\\]^`{|~_\
abcdefghijklmnopqrstuvwxyz0123456789");
#line 220 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
{int j;
#line 226 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
for(j= 1;collate[j];j++)ord[(int)collate[j]]= j;
#line 380 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
ord[128]= j;
for(j= 'A';j<='Z';j++)ord[j]= ord[tolower(j)];
}

/*:19*/
#line 19 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
while(--argc){
#line 42 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
if((f= fopen(*++argv,"r"))==NULL)
#line 23 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
fprintf(stderr,"twinx: Couldn't open file %s for reading!\n",*argv);
else{
/*3:*/
#line 62 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"

#line 50 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
while(1){
if(fgets(buf,buf_size,f)==NULL){
fprintf(stderr,"twinx: (no title found in file %s)\n",*argv);
title[0]= '\0';
break;
}
#line 68 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
if(strncmp(buf,"\\def\\title\{",11)==0){char*p,*q;
#line 74 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
for(p= buf+11,q= title;*p&&*p!=' '&&*p!='}';p++)*q++= toupper(*p);
#line 58 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
*q= '\0';
break;
}
}

/*:3*/
#line 25 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
fclose(f);
#line 50 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
memcpy(*argv+strlen(*argv)-3,"idx",3);
if((f= fopen(*argv,"r"))==NULL)
#line 30 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
fprintf(stderr,"twinx: Couldn't open file %s for reading!\n",*argv);
else{
/*10:*/
#line 194 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 126 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
while(1){node*cur_node;
#line 196 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
if(fgets(buf,buf_size,f)==NULL)break;
if(strncmp(buf,"\\I",2)==0){
/*11:*/
#line 208 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

if(buf[4]!='{'){
fprintf(stderr,"twinx: missing brace in file %s: `%.20s...'\n",*argv,buf);
break;
}
#line 132 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
{char*p,*q;int bal= 1;
#line 214 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
cur_name[0]= buf[2];cur_name[1]= buf[3];cur_name[2]= '{';
for(p= buf+5,q= cur_name+3;*p&&(bal||*p=='{');p++){
#line 141 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
switch(*p){
case'\\':*q++= *p++;break;
case'{':bal++;break;
case'}':bal--;break;
}
#line 218 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
*q++= *p;
}
if(bal){
fprintf(stderr,"twinx: unbalanced entry in file %s: `%.20s...'\n",*argv,buf);
break;
}
if(*p++!=','){
fprintf(stderr,"twinx: missing comma in file %s: `%.20s...'\n",*argv,buf);
break;
}
if(*p++!=' '){
fprintf(stderr,"twinx: missing space in file %s: `%.20s...'\n",*argv,buf);
break;
}
*q= '\0';
/*12:*/
#line 241 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

{int period_sensed= 0;
node*continuation;
cur_node= new_node();
cur_node->id= save_string(title);
#line 153 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
do{
#line 247 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
for(q= p;*q&&*q!='\n'&&*q!='.';q++);
if(*q=='.')period_sensed= 1;
*q= '\0';
cur_node->data.s= save_string(p);
if(period_sensed)break;
continuation= new_node();
continuation->next= cur_node;
cur_node= continuation;
p= buf;
#line 159 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
}while(fgets(buf,buf_size,f));
#line 257 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
if(!period_sensed){
fprintf(stderr,"twinx: File %s ended in middle of entry for %s!\n",
*argv,cur_name);
break;
}
}

/*:12*/
#line 233 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
}

/*:11*/
#line 198 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
main_node->next= new_node();main_node= main_node->next;
main_node->id= save_string(cur_name);
main_node->data.n= cur_node;
}
else if(buf[0]!='\n')
fprintf(stderr,"twinx: couldn't deal with `%.10s...' in file %s!\n",
buf,*argv);
}

/*:10*/
#line 32 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
fclose(f);
}
}
}
/*13:*/
#line 272 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

/*14:*/
#line 287 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

main_node->next= &header;
#line 167 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
while(1){node*p,*q,*r,*s,*t;
#line 290 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
t= &header;
r= t->next;
while(1){
if(r==&header)break;
p= s= r;
/*15:*/
#line 307 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 175 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
do{int d;
#line 309 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
r= s->next;
d= compare(s,r);
if(d> 0)break;
if(d==0){
collapse(s,r);
s->next= r->next;
}else s= r;
#line 181 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
}while(1);
#line 317 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

/*:15*/
#line 295 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
if(r==&header)break;
s->next= &sentinel;
q= s= r;
/*15:*/
#line 307 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 175 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
do{int d;
#line 309 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
r= s->next;
d= compare(s,r);
if(d> 0)break;
if(d==0){
collapse(s,r);
s->next= r->next;
}else s= r;
#line 181 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
}while(1);
#line 317 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

/*:15*/
#line 299 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
s->next= &sentinel;
/*16:*/
#line 322 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 189 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
do{int d;
#line 324 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
d= compare(p,q);
if(d> 0){
t->next= q;
t= q;
q= q->next;
}else if(d<0){
t->next= p;
t= p;
p= p->next;
}else if(p==&sentinel)break;
else{
collapse(p,q);
q= q->next;
}
#line 195 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
}while(1);
#line 339 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

/*:16*/
#line 301 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
t->next= r;
}
if(t==&header)break;
}

/*:14*/
#line 273 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
/*21:*/
#line 402 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 250 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
{node*x;
#line 404 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
printf("\\input cttwinxmac\n");
for(x= header.next;x!=&header;x= x->next){
printf("\\I");
/*22:*/
#line 413 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 258 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
{const char*p= x->id;
#line 415 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
if(*p==' '){
if(*(p+1)!=' ')goto unknown;
goto known;
}
if(*p!='\\')goto unknown;
switch(*(p+1)){
case'\\':case'|':case'.':case'&':case'9':
printf("\\%c",*(p+1));
goto known;
case'$':printf("$\\");
for(p+= 3;*p!='}';p++)
if(*p=='_')putchar('x');
else putchar(*p);
putchar('$');
goto done;
default:goto unknown;
}
unknown:fprintf(stderr,"twinx: `%s' has unknown format!\n",p);
known:for(p+= 2;*p;p++){
#line 264 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
if(*p=='_'&&*(p-1)!='\\')putchar('\\');
#line 435 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
putchar(*p);
}
done:;
}

/*:22*/
#line 407 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
/*23:*/
#line 440 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"

#line 271 "../../../texlive-source/texk/web2c/cwebdir/twinx.ch"
{node*y= x->data.n,*z= NULL;
while(y){node*w;
#line 443 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
w= y->next;
y->next= z;
z= y;
y= w;
}
while(z){
if(z->id)printf("\\unskip, {\\sc %s}~",z->id);
fputs(z->data.s,stdout);
z= z->next;
if(z)putchar('\n');
else puts(".");
}
}

/*:23*/
#line 408 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
}
printf("\\fin\n");
}

/*:21*/
#line 274 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;

/*:13*/
#line 37 "../../../texlive-source/texk/web2c/cwebdir/twinx.w"
;
return 0;
}

/*:1*/
