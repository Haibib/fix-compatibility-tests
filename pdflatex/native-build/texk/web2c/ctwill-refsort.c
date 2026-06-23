#define max_key 50
#define max_size 120
#define max_items 300
#define abort(c,m) {fprintf(stderr,"%s!\n%s",m,buf);return c;}
/*2:*/
#line 42 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

#line 27 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
#include <stdio.h> 
#include <string.h> 
#include <ctype.h> 
#line 46 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

typedef struct{
char key[max_key];
char entry[max_size];
}item;
item items[max_items];
item*sorted[max_items];
char cur_page[10];
char buf[max_size];
char*input_status;

#line 35 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
int main()
#line 58 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
{
#line 43 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
char*p,*q;
int n;
item*x,**y;
#line 62 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
input_status= fgets(buf,max_size,stdin);
while(input_status){
/*3:*/
#line 71 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

if(*buf!='!')abort(-1,"missing '!'");
if(strlen(buf+1)> 11)abort(-2,"page number too long");
for(p= buf+1,q= cur_page;*p!='\n';p++)*q++= *p;
*q= '\0';

/*:3*/
#line 64 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
;
/*4:*/
#line 77 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

n= 0;
while(1){
input_status= fgets(buf,max_size,stdin);
if(input_status==NULL||*buf!='+')break;
x= &items[n];
#line 51 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
/*6:*/
#line 63 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"

#line 100 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
if(*(buf+1)!=' ')abort(-3,"missing blank after +");
/*9:*/
#line 148 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

#line 69 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
{int toggle= 0;
#line 150 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
for(p= buf+2;(*p!=' '||toggle)&&*p;p++)
if(*p=='"')toggle^= 1;
}

/*:9*/
#line 101 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
;
if(*p!=' ')abort(-4,"missing blank after alpha");
if(*(p+1)=='$')/*7:*/
#line 123 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

{
if(*(p+2)!='\\')abort(-11,"missing custom backlash");
for(p+= 3,q= x->key;*p!=' '&&*p;p++){
if(isupper(*p))*q++= *p+('a'-'A');
else*q++= *p;
}
if(*p!=' ')abort(-12,"missing custom space");
if(*(p+1)!='$')abort(-13,"missing custom dollarsign");
}

/*:7*/
#line 103 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

else{
if(*(p+1)!='\\')abort(-5,"missing backslash");
if(!*(p+2))abort(-6,"missing control code");
if(*(p+3)!='{')abort(-7,"missing left brace");
for(p+= 4,q= x->key;*p!='}'&&*p;p++){
if(*p!='\\'){
if(isupper(*p))*q++= *p+('a'-'A');
else if(*p=='_')*q++= ' ';
else*q++= *p;
}
}
if(*p!='}')abort(-8,"missing right brace");
}
if(q>=&x->key[max_key])abort(-9,"key too long");
*q= '\0';
/*10:*/
#line 156 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

#line 75 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
{int toggle= 0;
#line 158 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
for(p= buf+2,q= x->entry;(*p!=' '||toggle)&&*p;p++){
if(*p=='"')toggle^= 1;
if(*p!=' ')*q++= *p;
}
#line 83 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
for(;*p;p++)*q++= *p;
}

/*:10*/
#line 119 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
;
if(p==buf+max_size-1)abort(-10,"entry too long");
*(q-1)= '\0';

/*:6*/
#line 51 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
;
#line 84 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
/*8:*/
#line 134 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

for(y= &sorted[n];
y> &sorted[0]&&strcmp((*(y-1))->key,x->key)> 0;
y--)
*y= *(y-1);
*y= x;

/*:8*/
#line 84 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
;
if(++n> max_items)abort(-11,"too many lines in group");
}

/*:4*/
#line 65 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
;
/*5:*/
#line 88 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"

#line 57 "../../../texlive-source/texk/web2c/cwebdir/refsort.ch"
{
#line 90 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
for(y= sorted;y<sorted+n;y++)printf("%s\n",(*y)->entry);
printf("\\donewithpage%s\n",cur_page);
}

/*:5*/
#line 66 "../../../texlive-source/texk/web2c/cwebdir/refsort.w"
;
}
return 0;
}

/*:2*/
