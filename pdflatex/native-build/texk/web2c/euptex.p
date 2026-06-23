{4:}{9:}{$C-,A+,D-}ifdef('TEXMF_DEBUG'){$C+,D+}
endif('TEXMF_DEBUG'){:9}program ETEX;const{11:}hashoffset=514;
trieopsize=35111;negtrieopsize=-35111;mintrieop=0;maxtrieop=65535;
poolname=TEXMFPOOLNAME;enginename=TEXMFENGINENAME;infmembot=0;
supmembot=1;infmainmemory=3000;supmainmemory=256000000;inftriesize=8000;
suptriesize=4194303;infmaxstrings=3000;supmaxstrings=2097151;
infstringsfree=100;supstringsfree=supmaxstrings;infbufsize=500;
supbufsize=30000000;infnestsize=40;supnestsize=4000;infmaxinopen=6;
supmaxinopen=127;infparamsize=60;supparamsize=32767;infsavesize=600;
supsavesize=30000000;infstacksize=200;supstacksize=30000;
infdvibufsize=800;supdvibufsize=65536;inffontmemsize=20000;
supfontmemsize=147483647;supfontmax=9000;inffontmax=50;
infpoolsize=32000;suppoolsize=40000000;infpoolfree=1000;
suppoolfree=suppoolsize;infstringvacancies=8000;
supstringvacancies=suppoolsize-23000;suphashextra=supmaxstrings;
infhashextra=0;suphyphsize=65535;infhyphsize=610;infexpanddepth=10;
supexpanddepth=10000000;{:11}type{18:}ASCIIcode=0..255;
KANJIcode=0..16777215;extASCIIcode=0..32768;{:18}{25:}eightbits=0..255;
sixteenbits=0..65535;alphafile=packed file of ASCIIcode;
bytefile=packed file of eightbits;{:25}{39:}poolpointer=integer;
strnumber=0..2097151;packedASCIIcode=0..32768;{:39}{103:}scaled=integer;
nonnegativeinteger=0..2147483647;smallnumber=0..63;
{:103}{111:}{:111}{133:}quarterword=0..65535;
halfword=-1073741823..1073741823;twochoices=1..2;fourchoices=1..4;
#include "texmfmem.h";wordfile=gzFile;{:133}{175:}glueord=0..4;
{:175}{237:}liststaterecord=record modefield:-239..239;
dirfield,adjdirfield:-4..4;pdispfield:scaled;
headfield,tailfield,pnodefield,lastjchrfield:halfword;
dispcalledfield:boolean;inhibitglueflagfield:integer;
eTeXauxfield:halfword;pgfield,mlfield:integer;auxfield:memoryword;end;
{:237}{299:}groupcode=0..16;
{:299}{330:}instaterecord=record statefield,indexfield:quarterword;
startfield,locfield,limitfield,namefield:halfword;
synctextagfield:integer;end;{:330}{586:}internalfontnumber=integer;
fontindex=integer;ninebits=0..11904;{:586}{633:}dviindex=0..dvibufsize;
{:633}{962:}triepointer=0..4194303;trieopcode=0..65535;
{:962}{967:}hyphpointer=0..65535;{:967}{1455:}savepointer=0..savesize;
{:1455}var{13:}bad:integer;{:13}{20:}xord:array[ASCIIcode]of ASCIIcode;
xchr:array[extASCIIcode]of extASCIIcode;
xprn:array[ASCIIcode]of ASCIIcode;{:20}{26:}nameoffile:^ASCIIcode;
namelength:0..maxint;{:26}{31:}buffer:^ASCIIcode;buffer2:^ASCIIcode;
first:0..bufsize;last:0..bufsize;maxbufstack:0..bufsize;
{:31}{33:}ifdef('INITEX')iniversion:boolean;dumpoption:boolean;
dumpline:boolean;endif('INITEX')dumpname:constcstring;
bounddefault:integer;boundname:constcstring;membot:integer;
mainmemory:integer;extramembot:integer;memmin:integer;memtop:integer;
extramemtop:integer;memmax:integer;errorline:integer;
halferrorline:integer;maxprintline:integer;maxstrings:integer;
stringsfree:integer;stringvacancies:integer;poolsize:integer;
poolfree:integer;fontmemsize:integer;fontmax:integer;fontk:integer;
hyphsize:integer;triesize:integer;bufsize:integer;stacksize:integer;
maxinopen:integer;paramsize:integer;nestsize:integer;savesize:integer;
dvibufsize:integer;expanddepth:integer;parsefirstlinep:cinttype;
filelineerrorstylep:cinttype;eightbitp:cinttype;haltonerrorp:cinttype;
haltingonerrorp:boolean;quotedfilename:boolean;srcspecialsp:boolean;
insertsrcspecialauto:boolean;insertsrcspecialeverypar:boolean;
insertsrcspecialeveryparend:boolean;insertsrcspecialeverycr:boolean;
insertsrcspecialeverymath:boolean;insertsrcspecialeveryhbox:boolean;
insertsrcspecialeveryvbox:boolean;insertsrcspecialeverydisplay:boolean;
{:33}{40:}strpool:^packedASCIIcode;strstart:^poolpointer;
poolptr:poolpointer;strptr:strnumber;initpoolptr:poolpointer;
initstrptr:strnumber;{:40}{51:}ifdef('INITEX')poolfile:alphafile;
endif('INITEX'){:51}{55:}logfile:alphafile;selector:0..21;
dig:array[0..22]of 0..15;tally:integer;termoffset:0..maxprintline;
fileoffset:0..maxprintline;trickbuf:array[0..255]of extASCIIcode;
trickbuf2:array[0..255]of 0..20;kcodepos:0..20;kcp:0..20;
prevchar:ASCIIcode;trickcount:integer;firstcount:integer;
{:55}{75:}interaction:0..3;interactionoption:0..4;
{:75}{78:}deletionsallowed:boolean;setboxallowed:boolean;history:0..3;
errorcount:-1..100;{:78}{81:}helpline:array[0..5]of strnumber;
helpptr:0..6;useerrhelp:boolean;{:81}{98:}interrupt:integer;
OKtointerrupt:boolean;{:98}{106:}savearitherror:boolean;
aritherror:boolean;texremainder:scaled;
{:106}{112:}randoms:array[0..54]of integer;jrandom:0..54;
randomseed:scaled;{:112}{119:}twotothe:array[0..30]of integer;
speclog:array[1..28]of integer;{:119}{135:}tempptr:halfword;
{:135}{136:}yzmem:^memoryword;zmem:^memoryword;lomemmax:halfword;
himemmin:halfword;{:136}{137:}varused,dynused:integer;
{:137}{138:}avail:halfword;memend:halfword;{:138}{144:}rover:halfword;
{:144}{190:}ifdef('TEXMF_DEBUG')freearr:packed array[0..9]of boolean;
wasfree:packed array[0..9]of boolean;
wasmemend,waslomax,washimin:halfword;panicking:boolean;
endif('TEXMF_DEBUG'){:190}{198:}fontinshortdisplay:integer;
{:198}{206:}depththreshold:integer;breadthmax:integer;
{:206}{238:}nest:^liststaterecord;nestptr:0..nestsize;
maxneststack:0..nestsize;curlist:liststaterecord;shownmode:-239..239;
{:238}{271:}oldsetting:0..21;oldselectorignorederr:0..21;
systime,sysday,sysmonth,sysyear:integer;{:271}{278:}zeqtb:^memoryword;
xeqlevel:array[114361..116261]of quarterword;
{:278}{281:}hash:^twohalves;yhash:^twohalves;hashused:halfword;
hashextra:halfword;hashtop:halfword;eqtbtop:halfword;hashhigh:halfword;
nonewcontrolsequence:boolean;cscount:integer;
{:281}{282:}prim:array[0..2100]of twohalves;primused:halfword;
{:282}{301:}savestack:^memoryword;saveptr:0..savesize;
maxsavestack:0..savesize;curlevel:quarterword;curgroup:groupcode;
curboundary:0..savesize;{:301}{316:}magset:integer;
{:316}{327:}curcmd:eightbits;curchr:halfword;curcs:halfword;
curtok:halfword;{:327}{331:}inputstack:^instaterecord;
inputptr:0..stacksize;maxinstack:0..stacksize;curinput:instaterecord;
{:331}{334:}inopen:0..maxinopen;openparens:0..maxinopen;
inputfile:^alphafile;line:integer;linestack:^integer;
sourcefilenamestack:^strnumber;fullsourcefilenamestack:^strnumber;
{:334}{335:}scannerstatus:0..5;warningindex:halfword;defref:halfword;
{:335}{338:}paramstack:^halfword;paramptr:0..paramsize;
maxparamstack:integer;{:338}{339:}alignstate:integer;
{:339}{340:}baseptr:0..stacksize;{:340}{363:}parloc:halfword;
partoken:halfword;{:363}{378:}skipmode:boolean;
{:378}{393:}forceeof:boolean;{:393}{399:}isincsname:boolean;
{:399}{418:}curmark:array[0..4]of halfword;
{:418}{423:}longstate:129..132;
{:423}{424:}pstack:array[0..8]of halfword;{:424}{446:}curval:integer;
curval1:integer;curvallevel:0..5;{:446}{475:}radix:smallnumber;
{:475}{484:}curorder:glueord;
{:484}{518:}readfile:array[0..15]of alphafile;
readopen:array[0..16]of 0..2;{:518}{527:}condptr:halfword;iflimit:0..4;
curif:smallnumber;ifline:integer;{:527}{531:}skipline:integer;
{:531}{550:}curname:strnumber;curarea:strnumber;curext:strnumber;
{:550}{551:}areadelimiter:poolpointer;extdelimiter:poolpointer;
{:551}{558:}formatdefaultlength:integer;TEXformatdefault:cstring;
{:558}{565:}nameinprogress:boolean;jobname:strnumber;logopened:boolean;
{:565}{570:}dvifile:bytefile;outputfilename:strnumber;
texmflogname:strnumber;{:570}{577:}tfmfile:bytefile;
{:577}{587:}fontinfo:^memoryword;fontdir:^eightbits;fontenc:^eightbits;
fontnumext:^integer;jfmenc:eightbits;fmemptr:fontindex;
fontptr:internalfontnumber;fontcheck:^fourquarters;fontsize:^scaled;
fontdsize:^scaled;fontparams:^fontindex;fontname:^strnumber;
fontarea:^strnumber;fontbc:^sixteenbits;fontec:^sixteenbits;
fontglue:^halfword;fontused:^boolean;hyphenchar:^integer;
skewchar:^integer;bcharlabel:^fontindex;fontbchar:^ninebits;
fontfalsebchar:^ninebits;{:587}{588:}charbase:^integer;
ctypebase:^integer;widthbase:^integer;heightbase:^integer;
depthbase:^integer;italicbase:^integer;ligkernbase:^integer;
kernbase:^integer;extenbase:^integer;parambase:^integer;
{:588}{593:}nullcharacter:fourquarters;{:593}{631:}totalpages:integer;
maxv:scaled;maxh:scaled;maxpush:integer;lastbop:integer;
deadcycles:integer;doingleaders:boolean;c:quarterword;
f:internalfontnumber;dirused:boolean;ruleht,ruledp,rulewd:scaled;
g:halfword;lq,lr:integer;{:631}{634:}dvibuf:^eightbits;halfbuf:integer;
dvilimit:integer;dviptr:integer;dvioffset:integer;dvigone:integer;
{:634}{644:}downptr,rightptr:halfword;{:644}{655:}dvih,dviv:scaled;
curh,curv:scaled;dvif:internalfontnumber;curs:integer;
{:655}{685:}totalstretch,totalshrink:array[glueord]of scaled;
lastbadness:integer;{:685}{686:}adjusttail:halfword;lastdisp:scaled;
curkanjiskip:halfword;curxkanjiskip:halfword;
{:686}{694:}preadjusttail:halfword;{:694}{702:}packbeginline:integer;
{:702}{725:}emptyfield:twohalves;nulldelimiter:fourquarters;
{:725}{760:}curmlist:halfword;curstyle:smallnumber;cursize:integer;
curmu:scaled;mlistpenalties:boolean;{:760}{765:}curf:internalfontnumber;
curc:quarterword;curi:fourquarters;{:765}{805:}magicoffset:integer;
{:805}{811:}curalign:halfword;curspan:halfword;curloop:halfword;
alignptr:halfword;curhead,curtail:halfword;
curprehead,curpretail:halfword;{:811}{855:}justbox:halfword;
{:855}{862:}passive:halfword;printednode:halfword;passnumber:halfword;
{:862}{864:}activewidth:array[1..7]of scaled;
curactivewidth:array[1..7]of scaled;background:array[1..7]of scaled;
breakwidth:array[1..7]of scaled;{:864}{866:}noshrinkerroryet:boolean;
{:866}{869:}curp:halfword;chain:boolean;secondpass:boolean;
finalpass:boolean;threshold:integer;
{:869}{874:}minimaldemerits:array[0..3]of integer;
minimumdemerits:integer;bestplace:array[0..3]of halfword;
bestplline:array[0..3]of halfword;{:874}{880:}discwidth:scaled;
{:880}{888:}easyline:halfword;lastspecialline:halfword;
firstwidth:scaled;secondwidth:scaled;firstindent:scaled;
secondindent:scaled;{:888}{913:}bestbet:halfword;fewestdemerits:integer;
bestline:halfword;actuallooseness:integer;linediff:integer;
{:913}{933:}hc:array[0..65]of 0..11904;hn:0..64;ha,hb:halfword;
hf:internalfontnumber;hu:array[0..63]of 0..11904;hyfchar:integer;
curlang,initcurlang:ASCIIcode;lhyf,rhyf,initlhyf,initrhyf:integer;
hyfbchar:halfword;maxhyphchar:integer;
{:933}{942:}hyf:array[0..64]of 0..9;initlist:halfword;initlig:boolean;
initlft:boolean;{:942}{947:}hyphenpassed:smallnumber;
{:947}{949:}curl,curr:halfword;curq:halfword;ligstack:halfword;
ligaturepresent:boolean;lfthit,rthit:boolean;
{:949}{963:}trietrl:^triepointer;trietro:^triepointer;
trietrc:^quarterword;hyfdistance:array[1..trieopsize]of smallnumber;
hyfnum:array[1..trieopsize]of smallnumber;
hyfnext:array[1..trieopsize]of trieopcode;
opstart:array[ASCIIcode]of 0..trieopsize;
{:963}{968:}hyphword:^strnumber;hyphlist:^halfword;
hyphlink:^hyphpointer;hyphcount:integer;hyphnext:integer;
{:968}{985:}ifdef('INITEX')trieophash:array[negtrieopsize..trieopsize]of
0..trieopsize;trieused:array[ASCIIcode]of trieopcode;
trieoplang:array[1..trieopsize]of ASCIIcode;
trieopval:array[1..trieopsize]of trieopcode;trieopptr:0..trieopsize;
endif('INITEX')maxopused:trieopcode;smallop:boolean;
{:985}{989:}ifdef('INITEX')triec:^packedASCIIcode;trieo:^trieopcode;
triel:^triepointer;trier:^triepointer;trieptr:triepointer;
triehash:^triepointer;
endif('INITEX'){:989}{992:}ifdef('INITEX')trietaken:^boolean;
triemin:array[0..11904]of triepointer;triemax:triepointer;
trienotready:boolean;
endif('INITEX'){:992}{1013:}bestheightplusdepth:scaled;
{:1013}{1022:}pagetail:halfword;pagecontents:0..2;pagemaxdepth:scaled;
bestpagebreak:halfword;leastpagecost:integer;bestsize:scaled;
{:1022}{1024:}pagesofar:array[0..8]of scaled;lastglue:halfword;
lastpenalty:integer;lastkern:scaled;lastnodetype:integer;
lastnodesubtype:integer;insertpenalties:integer;
{:1024}{1031:}outputactive:boolean;outputcanend:boolean;
{:1031}{1074:}mainf:internalfontnumber;maini:fourquarters;
mainj:fourquarters;maink:fontindex;mainp:halfword;mains:integer;
bchar:halfword;falsebchar:halfword;cancelboundary:boolean;
insdisc:boolean;{:1074}{1117:}curbox:halfword;
{:1117}{1310:}aftertoken:halfword;{:1310}{1325:}longhelpseen:boolean;
{:1325}{1343:}formatident:strnumber;{:1343}{1349:}fmtfile:wordfile;
{:1349}{1375:}readyalready:integer;
{:1375}{1386:}writefile:array[0..15]of alphafile;
writeopen:array[0..17]of boolean;{:1386}{1389:}writeloc:halfword;
{:1389}{1429:}eTeXmode:0..1;etexp:boolean;
{:1429}{1437:}eofseen:^boolean;{:1437}{1482:}revdisp:scaled;
LRptr:halfword;LRproblems:integer;curdir:smallnumber;
{:1482}{1531:}pseudofiles:halfword;{:1531}{1554:}grpstack:^savepointer;
ifstack:^halfword;{:1554}{1595:}maxregnum:halfword;
maxreghelpline:strnumber;{:1595}{1597:}saroot:array[0..6]of halfword;
curptr:halfword;sanull:memoryword;{:1597}{1616:}sachain:halfword;
salevel:quarterword;{:1616}{1623:}lastlinefill:halfword;
dolastlinefit:boolean;activenodesize:smallnumber;
fillwidth:array[0..3]of scaled;bestplshort:array[0..3]of scaled;
bestplglue:array[0..3]of scaled;{:1623}{1639:}hyphstart:triepointer;
hyphindex:triepointer;{:1639}{1640:}discptr:array[1..3]of halfword;
{:1640}{1648:}editnamestart:poolpointer;editnamelength,editline:integer;
ipcon:cinttype;stopatspace:boolean;{:1648}{1650:}savestrptr:strnumber;
savepoolptr:poolpointer;shellenabledp:cinttype;restrictedshell:cinttype;
outputcomment:^char;k,l:0..255;{:1650}{1652:}debugformatfile:boolean;
{:1652}{1660:}expanddepthcount:integer;{:1660}{1663:}mltexp:boolean;
{:1663}{1664:}mltexenabledp:boolean;
{:1664}{1669:}accentc,basec,replacec:integer;iac,ibc:fourquarters;
baseslant,accentslant:real;basexheight:scaled;
basewidth,baseheight:scaled;accentwidth,accentheight:scaled;
delta:scaled;{:1669}{1707:}dvidir:integer;curdirhv:integer;
pagedir:eightbits;{:1707}{1710:}firstchar:halfword;lastchar:halfword;
findfirstchar:boolean;{:1710}{1745:}synctexoption:integer;
{:1745}{1750:}synctexoffset:integer;{:1750}{1778:}isprintutf8:boolean;
epochseconds:integer;microseconds:integer;
{:1778}{1781:}curpagewidth:scaled;curpageheight:scaled;
pdflastxpos:integer;pdflastypos:integer;
{:1781}{1787:}isprintutf8:boolean;lasttokensstring:strnumber;
{:1787}procedure initialize;var{19:}i:integer;{:19}{188:}k:integer;
{:188}{969:}z:hyphpointer;{:969}begin{8:}{21:}xchr[32]:=' ';
xchr[33]:='!';xchr[34]:='"';xchr[35]:='#';xchr[36]:='$';xchr[37]:='%';
xchr[38]:='&';xchr[39]:='''';xchr[40]:='(';xchr[41]:=')';xchr[42]:='*';
xchr[43]:='+';xchr[44]:=',';xchr[45]:='-';xchr[46]:='.';xchr[47]:='/';
xchr[48]:='0';xchr[49]:='1';xchr[50]:='2';xchr[51]:='3';xchr[52]:='4';
xchr[53]:='5';xchr[54]:='6';xchr[55]:='7';xchr[56]:='8';xchr[57]:='9';
xchr[58]:=':';xchr[59]:=';';xchr[60]:='<';xchr[61]:='=';xchr[62]:='>';
xchr[63]:='?';xchr[64]:='@';xchr[65]:='A';xchr[66]:='B';xchr[67]:='C';
xchr[68]:='D';xchr[69]:='E';xchr[70]:='F';xchr[71]:='G';xchr[72]:='H';
xchr[73]:='I';xchr[74]:='J';xchr[75]:='K';xchr[76]:='L';xchr[77]:='M';
xchr[78]:='N';xchr[79]:='O';xchr[80]:='P';xchr[81]:='Q';xchr[82]:='R';
xchr[83]:='S';xchr[84]:='T';xchr[85]:='U';xchr[86]:='V';xchr[87]:='W';
xchr[88]:='X';xchr[89]:='Y';xchr[90]:='Z';xchr[91]:='[';xchr[92]:='\';
xchr[93]:=']';xchr[94]:='^';xchr[95]:='_';xchr[96]:='`';xchr[97]:='a';
xchr[98]:='b';xchr[99]:='c';xchr[100]:='d';xchr[101]:='e';
xchr[102]:='f';xchr[103]:='g';xchr[104]:='h';xchr[105]:='i';
xchr[106]:='j';xchr[107]:='k';xchr[108]:='l';xchr[109]:='m';
xchr[110]:='n';xchr[111]:='o';xchr[112]:='p';xchr[113]:='q';
xchr[114]:='r';xchr[115]:='s';xchr[116]:='t';xchr[117]:='u';
xchr[118]:='v';xchr[119]:='w';xchr[120]:='x';xchr[121]:='y';
xchr[122]:='z';xchr[123]:='{';xchr[124]:='|';xchr[125]:='}';
xchr[126]:='~';{:21}{23:}for i:=0 to 31 do xchr[i]:=i;
for i:=127 to 511 do xchr[i]:=i;
{:23}{24:}for i:=0 to 255 do xord[chr(i)]:=127;
for i:=128 to 255 do xord[xchr[i]]:=i;
for i:=0 to 126 do xord[xchr[i]]:=i;
for i:=0 to 255 do xprn[i]:=(eightbitp or((i>=32)and(i<=126)));
if translatefilename then readtcxfile;
{:24}{76:}if interactionoption=4 then interaction:=3 else interaction:=
interactionoption;{:76}{79:}deletionsallowed:=true;setboxallowed:=true;
errorcount:=0;{:79}{82:}helpptr:=0;useerrhelp:=false;
{:82}{99:}interrupt:=0;OKtointerrupt:=true;{:99}{120:}twotothe[0]:=1;
for k:=1 to 30 do twotothe[k]:=2*twotothe[k-1];speclog[1]:=93032640;
speclog[2]:=38612034;speclog[3]:=17922280;speclog[4]:=8662214;
speclog[5]:=4261238;speclog[6]:=2113709;speclog[7]:=1052693;
speclog[8]:=525315;speclog[9]:=262400;speclog[10]:=131136;
speclog[11]:=65552;speclog[12]:=32772;speclog[13]:=16385;
for k:=14 to 27 do speclog[k]:=twotothe[27-k];speclog[28]:=1;
{:120}{191:}ifdef('TEXMF_DEBUG')wasmemend:=memmin;waslomax:=memmin;
washimin:=memmax;panicking:=false;
endif('TEXMF_DEBUG'){:191}{240:}nestptr:=0;maxneststack:=0;
curlist.modefield:=1;curlist.headfield:=memtop-1;
curlist.tailfield:=memtop-1;curlist.pnodefield:=curlist.tailfield;
curlist.dirfield:=4;curlist.adjdirfield:=curlist.dirfield;
curlist.pdispfield:=0;curlist.lastjchrfield:=-1073741823;
curlist.dispcalledfield:=false;curlist.eTeXauxfield:=-1073741823;
curlist.auxfield.int:=-65536000;curlist.mlfield:=0;curlist.pgfield:=0;
shownmode:=0;pagecontents:=0;pagetail:=memtop-2;lastglue:=1073741823;
lastpenalty:=0;lastkern:=0;lastnodetype:=-1;lastnodesubtype:=-1;
pagesofar[8]:=0;pagemaxdepth:=0;
{:240}{279:}for k:=114361 to 116261 do xeqlevel[k]:=1;
{:279}{283:}nonewcontrolsequence:=true;prim[0].lh:=0;prim[0].rh:=0;
for k:=1 to 2100 do prim[k]:=prim[0];{:283}{302:}saveptr:=0;curlevel:=1;
curgroup:=0;curboundary:=0;maxsavestack:=0;{:302}{317:}magset:=0;
{:317}{379:}skipmode:=true;{:379}{400:}isincsname:=false;
{:400}{419:}curmark[0]:=-1073741823;curmark[1]:=-1073741823;
curmark[2]:=-1073741823;curmark[3]:=-1073741823;curmark[4]:=-1073741823;
{:419}{476:}curval:=0;curvallevel:=0;radix:=0;curorder:=0;
{:476}{519:}for k:=0 to 16 do readopen[k]:=2;
{:519}{528:}condptr:=-1073741823;iflimit:=0;curif:=0;ifline:=0;
{:528}{589:}jfmenc:=0;{:589}{594:}nullcharacter.b0:=0;
nullcharacter.b1:=0;nullcharacter.b2:=0;nullcharacter.b3:=0;
{:594}{632:}totalpages:=0;maxv:=0;maxh:=0;maxpush:=0;lastbop:=-1;
doingleaders:=false;deadcycles:=0;curs:=-1;dirused:=false;
{:632}{635:}halfbuf:=dvibufsize div 2;dvilimit:=dvibufsize;dviptr:=0;
dvioffset:=0;dvigone:=0;{:635}{645:}downptr:=-1073741823;
rightptr:=-1073741823;{:645}{687:}adjusttail:=-1073741823;
lastbadness:=0;curkanjiskip:=membot;curxkanjiskip:=membot;
{:687}{695:}preadjusttail:=-1073741823;{:695}{703:}packbeginline:=0;
{:703}{726:}emptyfield.rh:=0;emptyfield.lh:=-1073741823;
nulldelimiter.b0:=0;nulldelimiter.b1:=0;nulldelimiter.b2:=0;
nulldelimiter.b3:=0;{:726}{812:}alignptr:=-1073741823;
curalign:=-1073741823;curspan:=-1073741823;curloop:=-1073741823;
curhead:=-1073741823;curtail:=-1073741823;curprehead:=-1073741823;
curpretail:=-1073741823;{:812}{934:}maxhyphchar:=11903;
{:934}{970:}for z:=0 to hyphsize do begin hyphword[z]:=0;
hyphlist[z]:=-1073741823;hyphlink[z]:=0;end;hyphcount:=0;hyphnext:=608;
if hyphnext>hyphsize then hyphnext:=607;
{:970}{1032:}outputactive:=false;outputcanend:=false;insertpenalties:=0;
{:1032}{1075:}ligaturepresent:=false;cancelboundary:=false;
lfthit:=false;rthit:=false;insdisc:=false;{:1075}{1311:}aftertoken:=0;
{:1311}{1326:}longhelpseen:=false;{:1326}{1344:}formatident:=0;
{:1344}{1387:}for k:=0 to 17 do writeopen[k]:=false;
{:1387}{1483:}LRptr:=-1073741823;LRproblems:=0;curdir:=0;
{:1483}{1532:}pseudofiles:=-1073741823;
{:1532}{1598:}saroot[6]:=-1073741823;sanull.hh.lh:=-1073741823;
sanull.hh.rh:=-1073741823;{:1598}{1617:}sachain:=-1073741823;salevel:=0;
{:1617}{1641:}discptr[2]:=-1073741823;discptr[3]:=-1073741823;
{:1641}{1649:}editnamestart:=0;stopatspace:=true;haltingonerrorp:=false;
{:1649}{1653:}ifdef('TEXMF_DEBUG')debugformatfile:=true;
endif('TEXMF_DEBUG');{:1653}{1661:}expanddepthcount:=0;
{:1661}{1665:}mltexenabledp:=false;{:1665}{1708:}pagedir:=4;
{:1708}{1790:}secondsandmicros(epochseconds,microseconds);initstarttime;
{:1790}ifdef('INITEX')if iniversion then begin{189:}for k:=membot+1 to
membot+23 do mem[k].int:=0;k:=membot;
while k<=membot+23 do begin mem[k].hh.rh:=-1073741822;mem[k].hh.b0:=0;
mem[k].hh.b1:=0;k:=k+4;end;mem[membot+6].int:=65536;
mem[membot+4].hh.b0:=1;mem[membot+10].int:=65536;mem[membot+8].hh.b0:=2;
mem[membot+14].int:=65536;mem[membot+12].hh.b0:=3;
mem[membot+18].int:=65536;mem[membot+16].hh.b0:=2;
mem[membot+19].int:=65536;mem[membot+16].hh.b1:=2;
mem[membot+22].int:=-65536;mem[membot+20].hh.b0:=2;rover:=membot+24;
mem[rover].hh.rh:=1073741823;mem[rover].hh.lh:=1000;
mem[rover+1].hh.lh:=rover;mem[rover+1].hh.rh:=rover;
lomemmax:=rover+1000;mem[lomemmax].hh.rh:=-1073741823;
mem[lomemmax].hh.lh:=-1073741823;
for k:=memtop-14 to memtop do mem[k]:=mem[lomemmax];
{831:}mem[memtop-10].hh.lh:=536909726;
{:831}{838:}mem[memtop-9].hh.rh:=65536;mem[memtop-9].hh.lh:=-1073741823;
{:838}{861:}mem[memtop-7].hh.b0:=1;mem[memtop-6].hh.lh:=1073741823;
mem[memtop-7].hh.b1:=0;{:861}{1023:}mem[memtop].hh.b1:=255;
mem[memtop].hh.b0:=1;mem[memtop].hh.rh:=memtop;
{:1023}{1030:}mem[memtop-2].hh.b0:=12;mem[memtop-2].hh.b1:=0;{:1030};
avail:=-1073741823;memend:=memtop;himemmin:=memtop-14;
varused:=membot+24-membot;dynused:=15;
{:189}{247:}eqtb[49924].hh.b0:=119;eqtb[49924].hh.rh:=-1073741823;
eqtb[49924].hh.b1:=0;for k:=1 to eqtbtop do eqtb[k]:=eqtb[49924];
{:247}{253:}eqtb[49925].hh.rh:=membot;eqtb[49925].hh.b1:=1;
eqtb[49925].hh.b0:=135;for k:=49926 to 50457 do eqtb[k]:=eqtb[49925];
mem[membot].hh.rh:=mem[membot].hh.rh+533;
{:253}{257:}eqtb[50458].hh.rh:=-1073741823;eqtb[50458].hh.b0:=136;
eqtb[50458].hh.b1:=1;for k:=50725 to 50728 do eqtb[k]:=eqtb[50458];
for k:=50459 to 50724 do eqtb[k]:=eqtb[49924];
eqtb[50729].hh.rh:=-1073741823;eqtb[50729].hh.b0:=137;
eqtb[50729].hh.b1:=1;for k:=50730 to 50984 do eqtb[k]:=eqtb[50729];
eqtb[50985].hh.rh:=0;eqtb[50985].hh.b0:=138;eqtb[50985].hh.b1:=1;
eqtb[51754].hh.rh:=0;eqtb[51754].hh.b0:=138;eqtb[51754].hh.b1:=1;
eqtb[51755].hh.rh:=0;eqtb[51755].hh.b0:=138;eqtb[51755].hh.b1:=1;
for k:=50986 to 51753 do eqtb[k]:=eqtb[50985];eqtb[51759].hh.rh:=0;
eqtb[51759].hh.b0:=138;eqtb[51759].hh.b1:=1;
for k:=51760 to 114360 do eqtb[k]:=eqtb[51759];eqtb[51756]:=eqtb[51759];
eqtb[51757]:=eqtb[51759];eqtb[51758]:=eqtb[51759];
for k:=0 to 255 do begin eqtb[113849+k].hh.rh:=k;end;
for k:=0 to 11903 do begin eqtb[51759+k].hh.rh:=12;
eqtb[101945+k].hh.rh:=1000;eqtb[64175+k].hh.rh:=0;end;
for k:=0 to 511 do begin eqtb[63663+k].hh.rh:=18;end;
for k:=0 to 1023 do begin eqtb[76079+k].hh.rh:=0;eqtb[76079+k].hh.b0:=0;
eqtb[77103+k].hh.rh:=0;eqtb[77103+k].hh.b0:=0;end;eqtb[51772].hh.rh:=5;
eqtb[51791].hh.rh:=10;eqtb[51851].hh.rh:=0;eqtb[51796].hh.rh:=14;
eqtb[51886].hh.rh:=15;eqtb[51759].hh.rh:=9;
for k:=48 to 57 do begin eqtb[113849+k].hh.rh:=k+458752;
eqtb[64175+k].hh.rh:=3;end;eqtb[78127].hh.rh:=toDVI(fromJIS(8507));
eqtb[78128].hh.rh:=toDVI(fromJIS(12396));
eqtb[78129].hh.rh:=toDVI(fromJIS(18035));
eqtb[78130].hh.rh:=toDVI(fromJIS(15152));
eqtb[78131].hh.rh:=toDVI(fromJIS(15181));
eqtb[78132].hh.rh:=toDVI(fromJIS(14430));
eqtb[78133].hh.rh:=toDVI(fromJIS(20283));
eqtb[78134].hh.rh:=toDVI(fromJIS(15415));
eqtb[78135].hh.rh:=toDVI(fromJIS(18476));
eqtb[78136].hh.rh:=toDVI(fromJIS(13925));
for k:=65 to 90 do begin eqtb[51759+k].hh.rh:=11;
eqtb[51759+k+32].hh.rh:=11;eqtb[113849+k].hh.rh:=k+459008;
eqtb[113849+k+32].hh.rh:=k+459040;eqtb[78137+k].hh.rh:=k+32;
eqtb[78137+k+32].hh.rh:=k+32;eqtb[90041+k].hh.rh:=k;
eqtb[90041+k+32].hh.rh:=k;eqtb[64175+k].hh.rh:=3;
eqtb[64175+k+32].hh.rh:=3;eqtb[101945+k].hh.rh:=999;end;
if(isinternalUPTEX)then begin eqtb[63663].hh.rh:=15;
for k:=2 to 3 do eqtb[63663+k].hh.rh:=15;eqtb[63700].hh.rh:=19;
eqtb[63733].hh.rh:=15;for k:=104 to 105 do eqtb[63663+k].hh.rh:=16;
for k:=108 to 109 do eqtb[63663+k].hh.rh:=17;eqtb[63773].hh.rh:=16;
eqtb[63774].hh.rh:=19;for k:=112 to 114 do eqtb[63663+k].hh.rh:=16;
eqtb[63778].hh.rh:=17;eqtb[63781].hh.rh:=16;eqtb[63783].hh.rh:=16;
eqtb[63799].hh.rh:=19;eqtb[63810].hh.rh:=19;eqtb[63811].hh.rh:=19;
eqtb[63816].hh.rh:=16;eqtb[63819].hh.rh:=20;
for k:=282 to 285 do eqtb[63663+k].hh.rh:=17;
for k:=332 to 342 do eqtb[63663+k].hh.rh:=16;eqtb[64017].hh.rh:=20;
for k:=505 to 508 do eqtb[63663+k].hh.rh:=20;eqtb[64172].hh.rh:=15;
eqtb[64173].hh.rh:=17;eqtb[64174].hh.rh:=17;
end else begin eqtb[63696].hh.rh:=18;eqtb[63697].hh.rh:=18;
for k:=3 to 6 do eqtb[63695+k].hh.rh:=17;
for k:=7 to 13 do eqtb[63695+k].hh.rh:=18;
for k:=14 to 120 do eqtb[63695+k].hh.rh:=16;
for k:=16 to 94 do eqtb[63823+k].hh.rh:=16;end;
for k:=358 to 361 do eqtb[63663+k].hh.rh:=16;
for k:=375 to 376 do eqtb[63663+k].hh.rh:=17;eqtb[64043].hh.rh:=16;
for k:=382 to 383 do eqtb[63663+k].hh.rh:=16;
{:257}{265:}for k:=114361 to 114700 do eqtb[k].int:=0;
eqtb[114423].int:=256;eqtb[114424].int:=-1;eqtb[114378].int:=1000;
eqtb[114362].int:=10000;eqtb[114402].int:=1;eqtb[114401].int:=25;
eqtb[114407].int:=92;eqtb[114410].int:=13;
for k:=0 to 255 do begin eqtb[114701+k].int:=-1;
setintone(eqtb[114701+k],-1);end;eqtb[114747].int:=0;
setintone(eqtb[114747],0);eqtb[114428].int:=-1;
{:265}{275:}for k:=114957 to 116261 do eqtb[k].int:=0;
{:275}{284:}hashused:=38810;hashhigh:=0;cscount:=0;
eqtb[38819].hh.b0:=134;primused:=2100;hash[38819].rh:=564;
eqtb[38821].hh.b0:=45;eqtb[38821].hh.rh:=1;eqtb[38821].hh.b1:=1;
hash[38821].rh:=565;{:284}{590:}{:590}{722:}eqtb[114418].int:=1000;
eqtb[114439].int:=1;eqtb[114419].int:=700;eqtb[114420].int:=500;
{:722}{988:}for k:=-trieopsize to trieopsize do trieophash[k]:=0;
for k:=0 to 255 do trieused[k]:=mintrieop;maxopused:=mintrieop;
trieopptr:=0;{:988}{993:}trienotready:=true;
{:993}{1259:}hash[38810].rh:=1396;
{:1259}{1345:}if iniversion then formatident:=1471;
{:1345}{1413:}hash[38818].rh:=1518;eqtb[38818].hh.b1:=1;
eqtb[38818].hh.b0:=131;eqtb[38818].hh.rh:=-1073741823;
{:1413}{1430:}eTeXmode:=0;{1593:}maxregnum:=255;maxreghelpline:=792;
{:1593}{:1430}{1599:}for i:=0 to 5 do saroot[i]:=-1073741823;
{:1599}{1635:}{:1635}end;
endif('INITEX'){:8}{1751:}synctexoffset:=114429;{:1751}end;
{58:}procedure println;var ii:integer;
begin case selector of 19:begin if nrestmultichr(kcodepos)>0 then for ii
:=0 to nrestmultichr(kcodepos)-1 do begin write(stdout,' ');
write(logfile,' ');end;writeln(stdout);writeln(logfile);termoffset:=0;
fileoffset:=0;end;
18:begin if nrestmultichr(kcodepos)>0 then for ii:=0 to nrestmultichr(
kcodepos)-1 do write(logfile,' ');writeln(logfile);fileoffset:=0;end;
17:begin if nrestmultichr(kcodepos)>0 then for ii:=0 to nrestmultichr(
kcodepos)-1 do write(stdout,' ');writeln(stdout);termoffset:=0;end;
16,20,21:;others:writeln(writefile[selector])end;kcodepos:=0;end;
{:58}{59:}procedure printchar(s:extASCIIcode);label 10;
begin if{269:}s=eqtb[114411].int{:269}then if selector<20 then begin
println;goto 10;end;if s>511 then s:=s mod 256;
if s<256 then kcodepos:=0 else if(kcodepos=1)or((kcodepos>=9)and(
kcodepos<=10))or((kcodepos>=17)and(kcodepos<=19))then incr(kcodepos)else
if iskanji1(xchr[s-256])then begin if(ismultichr(4,1,xchr[s]))then
kcodepos:=17 else if(ismultichr(3,1,xchr[s]))then kcodepos:=9 else
kcodepos:=1;
if(selector=19)or(selector=18)then if fileoffset>=maxprintline-
nrestmultichr(kcodepos)then begin writeln(logfile);fileoffset:=0;end;
if(selector=19)or(selector=17)then if termoffset>=maxprintline-
nrestmultichr(kcodepos)then begin writeln(stdout);termoffset:=0;end;
end else kcodepos:=0;case selector of 19:begin write(stdout,xchr[s]);
incr(termoffset);if termoffset=maxprintline then begin writeln(stdout);
termoffset:=0;end;write(logfile,xchr[s]);incr(fileoffset);
if fileoffset=maxprintline then begin writeln(logfile);fileoffset:=0;
end;end;18:begin write(logfile,xchr[s]);incr(fileoffset);
if fileoffset=maxprintline then println;end;
17:begin write(stdout,xchr[s]);incr(termoffset);
if termoffset=maxprintline then println;end;16:;
20:if tally<trickcount then begin trickbuf[tally mod errorline]:=s;
trickbuf2[tally mod errorline]:=kcodepos;end;
21:begin if poolptr<poolsize then begin strpool[poolptr]:=s;
incr(poolptr);end;end;others:write(writefile[selector],xchr[s])end;
incr(tally);10:end;{:59}{60:}procedure print(s:integer);label 10;
var j:poolpointer;nl:integer;
begin if s>=strptr then s:=262 else if s<256 then if s<0 then s:=262
else begin if selector>20 then begin printchar(s);goto 10;end;
if({269:}s=eqtb[114411].int{:269})then if selector<20 then begin println
;goto 10;end;if xprn[s]then begin printchar(s);goto 10;end;
nl:=eqtb[114411].int;eqtb[114411].int:=-1;j:=strstart[s];
while j<strstart[s+1]do begin printchar(strpool[j]);incr(j);end;
eqtb[114411].int:=nl;goto 10;end;j:=strstart[s];
while j<strstart[s+1]do begin printchar(strpool[j]);incr(j);end;10:end;
{:60}{61:}procedure slowprint(s:integer);var j:poolpointer;c:integer;
begin if(s>=strptr)or(s<256)then print(s)else begin j:=strstart[s];
while j<strstart[s+1]do begin c:=strpool[j];
if c>=256 then printchar(c)else print(c);incr(j);end;end;end;
procedure slowprintfilename(s:integer);var i,j,l:poolpointer;p:integer;
begin if(s>=strptr)or(s<256)then print(s)else begin i:=strstart[s];
l:=strstart[s+1];while i<l do begin p:=multistrlenshort(strpool,l,i);
if p<>1 then begin for j:=i to i+p-1 do printchar(256+(strpool[j]mod 256
));i:=i+p;end else begin print(strpool[i]mod 256);incr(i);end;end;end;
end;procedure printquoted(s:integer);var i,l:poolpointer;j,p:integer;
begin if s<>0 then begin i:=strstart[s];l:=strstart[s+1];
while i<l do begin p:=multistrlenshort(strpool,l,i);
if p<>1 then begin for j:=i to i+p-1 do printchar(256+(strpool[j]mod 256
));i:=i+p;
end else begin if strpool[i]<>34 then print(strpool[i]mod 256);incr(i);
end;end;end;end;{:61}{63:}procedure printnl(s:strnumber);
begin if(selector<16)or((termoffset>0)and(odd(selector)))or((fileoffset>
0)and(selector>=18))then println;print(s);end;
{:63}{64:}procedure printesc(s:strnumber);var c:integer;
begin{268:}c:=eqtb[114407].int{:268};
if c>=0 then if c<256 then print(c);slowprint(s);end;
{:64}{65:}procedure printthedigs(k:eightbits);
begin while k>0 do begin decr(k);
if dig[k]<10 then printchar(48+dig[k])else printchar(55+dig[k]);end;end;
{:65}{66:}procedure printint(n:integer);var k:0..23;m:integer;
begin k:=0;if n<0 then begin printchar(45);
if n>-100000000 then n:=-n else begin m:=-1-n;n:=m div 10;
m:=(m mod 10)+1;k:=1;if m<10 then dig[0]:=m else begin dig[0]:=0;
incr(n);end;end;end;repeat dig[k]:=n mod 10;n:=n div 10;incr(k);
until n=0;printthedigs(k);end;{:66}{291:}procedure printcs(p:integer);
var j,l:poolpointer;cat:0..20;
begin if p<23810 then if p>=11905 then if p=23809 then begin printesc(
568);printesc(569);printchar(32);end else begin printesc(p-11905);
if eqtb[51759+p-11905].hh.rh=11 then printchar(32);
end else if p<1 then printesc(570)else print(p-1)else if((p>=49924)and(p
<=116261))or(p>eqtbtop)then printesc(570)else if(hash[p].rh>=strptr)then
printesc(571)else begin if(p>=38822)and(p<40923)then l:=prim[p-38822].rh
-1 else l:=hash[p].rh;printesc(l);j:=strstart[l];l:=strstart[l+1];
if l>j+1 then begin if(strpool[j]>=256)and(l-j=multistrlenshort(strpool,
l,j))then begin cat:=eqtb[63663+kcatcodekey(fromBUFFshort(strpool,l,j))]
.hh.rh;if(cat<>18)then printchar(32);end else printchar(32);
end else printchar(32);end;end;
{:291}{292:}procedure sprintcs(p:halfword);
begin if p<23810 then if p<11905 then print(p-1)else if p<23809 then
printesc(p-11905)else begin printesc(568);printesc(569);
end else if(p>=38822)and(p<40923)then printesc(prim[p-38822].rh-1)else
printesc(hash[p].rh);end;
{:292}{556:}procedure printfilename(n,a,e:integer);
var mustquote:boolean;j:poolpointer;begin mustquote:=false;
if a<>0 then begin j:=strstart[a];
while(not mustquote)and(j<strstart[a+1])do begin mustquote:=strpool[j]=
32;incr(j);end;end;if n<>0 then begin j:=strstart[n];
while(not mustquote)and(j<strstart[n+1])do begin mustquote:=strpool[j]=
32;incr(j);end;end;if e<>0 then begin j:=strstart[e];
while(not mustquote)and(j<strstart[e+1])do begin mustquote:=strpool[j]=
32;incr(j);end;end;if mustquote then printchar(34);printquoted(a);
printquoted(n);printquoted(e);if mustquote then printchar(34);end;
{:556}{740:}procedure printsize(s:integer);
begin if s=0 then printesc(440)else if s=256 then printesc(441)else
printesc(442);end;{:740}{1399:}procedure printwritewhatsit(s:strnumber;
p:halfword);begin printesc(s);
if mem[p+1].hh.lh<16 then printint(mem[p+1].hh.lh)else if mem[p+1].hh.lh
=16 then printchar(42)else printchar(45);end;
{:1399}{1603:}procedure printsanum(q:halfword);var n:halfword;
begin if mem[q].hh.b0<32 then n:=mem[q+1].hh.rh else begin n:=mem[q].hh.
b0 mod 16;q:=mem[q].hh.rh;n:=n+16*mem[q].hh.b0;q:=mem[q].hh.rh;
n:=n+256*(mem[q].hh.b0+16*mem[mem[q].hh.rh].hh.b0);
q:=mem[mem[q].hh.rh].hh.rh;n:=n+65536*mem[q].hh.b0;end;printint(n);end;
{:1603}{1651:}procedure printcsnames(hstart:integer;hfinish:integer);
var c,h:integer;
begin writeln(stderr,'fmtdebug:csnames from ',hstart,' to ',hfinish,':')
;for h:=hstart to hfinish do begin if hash[h].rh>0 then begin for c:=
strstart[hash[h].rh]to strstart[hash[h].rh+1]-1 do begin putbyte(strpool
[c],stderr);end;writeln(stderr,'|');end;end;end;
{:1651}{1654:}procedure printfileline;var level:0..maxinopen;
begin level:=inopen;
while(level>0)and(fullsourcefilenamestack[level]=0)do decr(level);
if level=0 then printnl(265)else begin printnl(349);
print(fullsourcefilenamestack[level]);print(58);
if level=inopen then printint(line)else printint(linestack[level+1]);
print(657);end;end;{:1654}{1728:}procedure printdir(dir:eightbits);
begin if dir=4 then printchar(89)else if dir=3 then printchar(84)else if
dir=1 then printchar(68)end;procedure printdirectionalt(d:integer);
var x:boolean;begin x:=false;case abs(d)of 4:begin print(1707);x:=true;
end;3:begin print(1708);x:=true;end;1:begin print(1709);x:=true;end;end;
if x then begin if d<0 then print(1710);print(1711);end;end;
procedure printdirection(d:integer);begin case abs(d)of 4:print(1235);
3:print(1234);1:print(1236);end;if d<0 then print(1710);print(1711);end;
{:1728}{1734:}procedure printkanji(s:KANJIcode);var v,nn,jj:integer;
begin if(isinternalUPTEX)then begin s:=ktokentochr(s);s:=toUCS(s);
nn:=UVSgetcodepointlength(s);jj:=1;
while jj<=nn do begin v:=UVSgetcodepointinsequence(s,jj);
if(v>0)then begin v:=UCStoUTF8(v);
if BYTE1(v)<>0 then printchar(256+BYTE1(v));
if BYTE2(v)<>0 then printchar(256+BYTE2(v));
if BYTE3(v)<>0 then printchar(256+BYTE3(v));printchar(256+BYTE4(v));end;
incr(jj);
end end else begin if isprintutf8 then s:=UCStoUTF8(toUCS(s mod 16777216
))else s:=toBUFF(s mod 16777216);
if BYTE1(s)<>0 then printchar(256+BYTE1(s));
if BYTE2(s)<>0 then printchar(256+BYTE2(s));
if BYTE3(s)<>0 then printchar(256+BYTE3(s));printchar(256+BYTE4(s));end;
end;function checkkcatcode(ct:integer;cx:integer):integer;
begin if(((ct>=16)or((ct=14)and(cx<11904)))and(eqtb[51758].hh.rh=0))or(
eqtb[51758].hh.rh=2)then checkkcatcode:=1 else checkkcatcode:=0;end;
function checkecharrange(c:integer):integer;
begin if(c>127)and(c<11904)and(eqtb[63663+kcatcodekey(c)].hh.rh=14)then
checkecharrange:=1 else if(c>=0)and(c<256)then checkecharrange:=2 else
checkecharrange:=0;end;function checkmcharrange(c:integer):integer;
begin if(c>255)and(c<11904)then checkmcharrange:=1 else checkmcharrange
:=0;end;{:1734}{1736:}procedure printunreadbufferwithptenc(f,l:integer);
var i,j:poolpointer;p:integer;begin i:=f;
while i<l do begin p:=multistrlen(ustringcast(buffer),l,i);
if p<>1 then begin for j:=i to i+p-1 do printchar(256+buffer[j]);i:=i+p;
end else begin print(buffer[i]);incr(i);end;end;end;
{:1736}{80:}procedure normalizeselector;forward;procedure gettoken;
forward;procedure terminput;forward;procedure showcontext;forward;
procedure beginfilereading;forward;procedure openlogfile;forward;
procedure closefilesandterminate;forward;procedure clearforerrorprompt;
forward;procedure giveerrhelp;forward;
ifdef('TEXMF_DEBUG')procedure debughelp;forward;
endif('TEXMF_DEBUG'){:80}{83:}noreturn procedure jumpout;
begin closefilesandterminate;begin fflush(stdout);readyalready:=0;
if(history<>0)and(history<>1)then uexit(1)else uexit(0);end;end;
{:83}{84:}procedure error;label 22,10;var c:ASCIIcode;
s1,s2,s3,s4:integer;begin if history<2 then history:=2;printchar(46);
showcontext;
if(haltonerrorp)then begin if(haltingonerrorp)then begin fflush(stdout);
readyalready:=0;if(history<>0)and(history<>1)then uexit(1)else uexit(0);
end;haltingonerrorp:=true;{92:}if interaction>0 then decr(selector);
if useerrhelp then begin println;giveerrhelp;
end else while helpptr>0 do begin decr(helpptr);
printnl(helpline[helpptr]);end;println;
if interaction>0 then incr(selector);println{:92};history:=3;jumpout;
end;
if interaction=3 then{85:}while true do begin 22:if interaction<>3 then
goto 10;clearforerrorprompt;begin;print(267);terminput;end;
if last=first then goto 10;c:=buffer[first];if c>=97 then c:=c-32;
{86:}case c of 48,49,50,51,52,53,54,55,56,57:if deletionsallowed then
{90:}begin s1:=curtok;s2:=curcmd;s3:=curchr;s4:=alignstate;
alignstate:=1000000;OKtointerrupt:=false;
if(last>first+1)and(buffer[first+1]>=48)and(buffer[first+1]<=57)then c:=
c*10+buffer[first+1]-48*11 else c:=c-48;while c>0 do begin gettoken;
decr(c);end;curtok:=s1;curcmd:=s2;curchr:=s3;alignstate:=s4;
OKtointerrupt:=true;begin helpptr:=2;helpline[1]:=280;helpline[0]:=281;
end;showcontext;goto 22;end{:90};ifdef('TEXMF_DEBUG')68:begin debughelp;
goto 22;end;
endif('TEXMF_DEBUG')69:if baseptr>0 then if inputstack[baseptr].
namefield>=256 then begin editnamestart:=strstart[inputstack[baseptr].
namefield];
editnamelength:=strstart[inputstack[baseptr].namefield+1]-strstart[
inputstack[baseptr].namefield];editline:=line;jumpout;end;
72:{91:}begin if useerrhelp then begin giveerrhelp;useerrhelp:=false;
end else begin if helpptr=0 then begin helpptr:=2;helpline[1]:=282;
helpline[0]:=283;end;repeat decr(helpptr);print(helpline[helpptr]);
println;until helpptr=0;end;begin helpptr:=4;helpline[3]:=284;
helpline[2]:=283;helpline[1]:=285;helpline[0]:=286;end;goto 22;end{:91};
73:{89:}begin beginfilereading;
if last>first+1 then begin curinput.locfield:=first+1;buffer[first]:=32;
end else begin begin;print(279);terminput;end;curinput.locfield:=first;
end;first:=last;curinput.limitfield:=last-1;goto 10;end{:89};
81,82,83:{88:}begin errorcount:=0;interaction:=0+c-81;print(274);
case c of 81:begin printesc(275);decr(selector);end;82:printesc(276);
83:printesc(277);end;print(278);println;fflush(stdout);goto 10;end{:88};
88:begin interaction:=2;jumpout;end;others:end;{87:}begin print(268);
printnl(269);printnl(270);
if baseptr>0 then if inputstack[baseptr].namefield>=256 then print(271);
if deletionsallowed then printnl(272);printnl(273);end{:87}{:86};
end{:85};incr(errorcount);if errorcount=100 then begin printnl(266);
history:=3;jumpout;end;{92:}if interaction>0 then decr(selector);
if useerrhelp then begin println;giveerrhelp;
end else while helpptr>0 do begin decr(helpptr);
printnl(helpline[helpptr]);end;println;
if interaction>0 then incr(selector);println{:92};10:end;
{:84}{95:}noreturn procedure fatalerror(s:strnumber);
begin normalizeselector;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(288);
end;begin helpptr:=1;helpline[0]:=s;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
{:95}{96:}noreturn procedure overflow(s:strnumber;n:integer);
begin normalizeselector;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(289);
end;print(s);printchar(61);printint(n);printchar(93);begin helpptr:=2;
helpline[1]:=290;helpline[0]:=291;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
{:96}{97:}noreturn procedure confusion(s:strnumber);
begin normalizeselector;
if history<2 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(292);
end;print(s);printchar(41);begin helpptr:=1;helpline[0]:=293;end;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(294);
end;begin helpptr:=2;helpline[1]:=295;helpline[0]:=296;end;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
{:97}{:4}{32:}{[36:]begin curinput.locfield:=first;
curinput.limitfield:=last-1;overflow(259,bufsize);end[:36]}
{:32}{38:}function initterminal:boolean;label 10;begin topenin;
if last>first then begin curinput.locfield:=first;
while(curinput.locfield<last)and(buffer[curinput.locfield]=' ')do incr(
curinput.locfield);
if curinput.locfield<last then begin initterminal:=true;goto 10;end;end;
while true do begin;write(stdout,'**');fflush(stdout);
if not inputln(stdin,true)then begin writeln(stdout);
writeln(stdout,'! End of file on the terminal... why?');
initterminal:=false;goto 10;end;curinput.locfield:=first;
while(curinput.locfield<last)and(buffer[curinput.locfield]=32)do incr(
curinput.locfield);
if curinput.locfield<last then begin initterminal:=true;goto 10;end;
writeln(stdout,'Please type the name of your input file.');end;10:end;
{:38}{44:}function makestring:strnumber;
begin if strptr=maxstrings then overflow(261,maxstrings-initstrptr);
incr(strptr);strstart[strptr]:=poolptr;makestring:=strptr-1;end;
{:44}{46:}function streqbuf(s:strnumber;k:integer):boolean;label 45;
var j:poolpointer;result:boolean;begin j:=strstart[s];
while j<strstart[s+1]do begin if strpool[j]<>buffer2[k]*256+buffer[k]
then begin result:=false;goto 45;end;incr(j);incr(k);end;result:=true;
45:streqbuf:=result;end;
{:46}{47:}function streqstr(s,t:strnumber):boolean;label 45;
var j,k:poolpointer;result:boolean;begin result:=false;
if(strstart[s+1]-strstart[s])<>(strstart[t+1]-strstart[t])then goto 45;
j:=strstart[s];k:=strstart[t];
while j<strstart[s+1]do begin if strpool[j]<>strpool[k]then goto 45;
incr(j);incr(k);end;result:=true;45:streqstr:=result;end;
{:47}{48:}{1658:}function searchstring(search:strnumber):strnumber;
label 40;var result:strnumber;s:strnumber;len:integer;begin result:=0;
len:=(strstart[search+1]-strstart[search]);
if len=0 then begin result:=349;goto 40;end else begin s:=search-1;
while s>255 do begin if(strstart[s+1]-strstart[s])=len then if streqstr(
s,search)then begin result:=s;goto 40;end;decr(s);end;end;
40:searchstring:=result;end;
{:1658}{1659:}function slowmakestring:strnumber;label 10;
var s:strnumber;t:strnumber;begin t:=makestring;s:=searchstring(t);
if s>0 then begin begin decr(strptr);poolptr:=strstart[strptr];end;
slowmakestring:=s;goto 10;end;slowmakestring:=t;10:end;
{:1659}ifdef('INITEX')function getstringsstarted:boolean;label 30,10;
var k,l:KANJIcode;g:strnumber;begin poolptr:=0;strptr:=0;strstart[0]:=0;
{49:}for k:=0 to 255 do begin if({50:}(k<32)or(k>126){:50})then begin
begin strpool[poolptr]:=94;incr(poolptr);end;begin strpool[poolptr]:=94;
incr(poolptr);end;if k<64 then begin strpool[poolptr]:=k+64;
incr(poolptr);end else if k<128 then begin strpool[poolptr]:=k-64;
incr(poolptr);end else begin l:=k div 16;
if l<10 then begin strpool[poolptr]:=l+48;incr(poolptr);
end else begin strpool[poolptr]:=l+87;incr(poolptr);end;l:=k mod 16;
if l<10 then begin strpool[poolptr]:=l+48;incr(poolptr);
end else begin strpool[poolptr]:=l+87;incr(poolptr);end;end;
end else begin strpool[poolptr]:=k;incr(poolptr);end;g:=makestring;
end{:49};{52:}g:=loadpoolstrings((poolsize-stringvacancies));
if g=0 then begin;writeln(stdout,'! You have to increase POOLSIZE.');
getstringsstarted:=false;goto 10;end;getstringsstarted:=true;{:52};
10:end;endif('INITEX'){:48}{67:}procedure printtwo(n:integer);
begin n:=abs(n)mod 100;printchar(48+(n div 10));
printchar(48+(n mod 10));end;{:67}{68:}procedure printhex(n:integer);
var k:0..22;begin k:=0;printchar(34);repeat dig[k]:=n mod 16;
n:=n div 16;incr(k);until n=0;printthedigs(k);end;
{:68}{71:}procedure printromanint(n:integer);label 10;
var j,k:poolpointer;u,v:nonnegativeinteger;begin j:=strstart[263];
v:=1000;while true do begin while n>=v do begin printchar(strpool[j]);
n:=n-v;end;if n<=0 then goto 10;k:=j+2;u:=v div(strpool[k-1]-48);
if strpool[k-1]=50 then begin k:=k+2;u:=u div(strpool[k-1]-48);end;
if n+u>=v then begin printchar(strpool[k]);n:=n+u;end else begin j:=j+2;
v:=v div(strpool[j-1]-48);end;end;10:end;
{:71}{72:}procedure printcurrentstring;var j:poolpointer;
begin j:=strstart[strptr];
while j<poolptr do begin printchar(strpool[j]);incr(j);end;end;
{:72}{73:}procedure printunreadbufferwithptenc;forward;
procedure terminput;var k:0..bufsize;begin fflush(stdout);
if not inputln(stdin,true)then begin curinput.limitfield:=0;
fatalerror(264);end;termoffset:=0;decr(selector);
if last<>first then printunreadbufferwithptenc(first,last);println;
incr(selector);end;{:73}{93:}procedure interror(n:integer);
begin print(287);printint(n);printchar(41);error;end;
{:93}{94:}procedure normalizeselector;
begin if logopened then selector:=19 else selector:=17;
if jobname=0 then openlogfile;if interaction=0 then decr(selector);end;
{:94}{100:}procedure pauseforinstructions;
begin if OKtointerrupt then begin interaction:=3;
if(selector=18)or(selector=16)then incr(selector);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(297);
end;begin helpptr:=3;helpline[2]:=298;helpline[1]:=299;helpline[0]:=300;
end;deletionsallowed:=false;error;deletionsallowed:=true;interrupt:=0;
end;end;{:100}{102:}function half(x:integer):integer;
begin if odd(x)then half:=(x+1)div 2 else half:=x div 2;end;
{:102}{104:}function rounddecimals(k:smallnumber):scaled;var a:integer;
begin a:=0;while k>0 do begin decr(k);a:=(a+dig[k]*131072)div 10;end;
rounddecimals:=(a+1)div 2;end;
{:104}{105:}procedure printscaled(s:scaled);var delta:scaled;
begin if s<0 then begin printchar(45);s:=-s;end;printint(s div 65536);
printchar(46);s:=10*(s mod 65536)+5;delta:=10;
repeat if delta>65536 then s:=s-17232;printchar(48+(s div 65536));
s:=10*(s mod 65536);delta:=delta*10;until s<=delta;end;
{:105}{107:}function multandadd(n:integer;x,y,maxanswer:scaled):scaled;
begin if n<0 then begin x:=-x;n:=-n;end;
if n=0 then multandadd:=y else if((x<=(maxanswer-y)div n)and(-x<=(
maxanswer+y)div n))then multandadd:=n*x+y else begin aritherror:=true;
multandadd:=0;end;end;{:107}{108:}function xovern(x:scaled;
n:integer):scaled;var negative:boolean;begin negative:=false;
if n=0 then begin aritherror:=true;xovern:=0;texremainder:=x;
end else begin if n<0 then begin x:=-x;n:=-n;negative:=true;end;
if x>=0 then begin xovern:=x div n;texremainder:=x mod n;
end else begin xovern:=-((-x)div n);texremainder:=-((-x)mod n);end;end;
if negative then texremainder:=-texremainder;end;
{:108}{109:}function xnoverd(x:scaled;n,d:integer):scaled;
var positive:boolean;t,u,v:nonnegativeinteger;
begin if x>=0 then positive:=true else begin x:=-x;positive:=false;end;
t:=(x mod 32768)*n;u:=(x div 32768)*n+(t div 32768);
v:=(u mod d)*32768+(t mod 32768);
if u div d>=32768 then aritherror:=true else u:=32768*(u div d)+(v div d
);if positive then begin xnoverd:=u;texremainder:=v mod d;
end else begin xnoverd:=-u;texremainder:=-(v mod d);end;end;
function isbitset(n:integer;s:smallnumber):boolean;var m,i:integer;
begin m:=1;for i:=1 to s-1 do m:=m*2;isbitset:=(n div m)mod 2;end;
{:109}{110:}function badness(t,s:scaled):halfword;var r:integer;
begin if t=0 then badness:=0 else if s<=0 then badness:=10000 else begin
if t<=7230584 then r:=(t*297)div s else if s>=1663497 then r:=t div(s
div 297)else r:=t;
if r>1290 then badness:=10000 else badness:=(r*r*r+131072)div 262144;
end;end;{:110}{114:}function makefrac(p,q:integer):integer;
var f:integer;n:integer;negative:boolean;becareful:integer;
begin if p>=0 then negative:=false else begin p:=-p;negative:=true;end;
if q<=0 then begin ifdef('TEXMF_DEBUG')if q=0 then confusion(47);
endif('TEXMF_DEBUG')q:=-q;negative:=not negative;end;n:=p div q;
p:=p mod q;if n>=8 then begin aritherror:=true;
if negative then makefrac:=-2147483647 else makefrac:=2147483647;
end else begin n:=(n-1)*268435456;{115:}f:=1;repeat becareful:=p-q;
p:=becareful+p;if p>=0 then f:=f+f+1 else begin f:=f+f;p:=p+q;end;
until f>=268435456;becareful:=p-q;if becareful+p>=0 then incr(f){:115};
if negative then makefrac:=-(f+n)else makefrac:=f+n;end;end;
{:114}{116:}function takefrac(q:integer;f:integer):integer;
var p:integer;negative:boolean;n:integer;becareful:integer;
begin{117:}if f>=0 then negative:=false else begin f:=-f;negative:=true;
end;if q<0 then begin q:=-q;negative:=not negative;end;{:117};
if f<268435456 then n:=0 else begin n:=f div 268435456;
f:=f mod 268435456;
if q<=2147483647 div n then n:=n*q else begin aritherror:=true;
n:=2147483647;end;end;f:=f+268435456;{118:}p:=134217728;
if q<1073741824 then repeat if odd(f)then p:=(p+q)div 2 else p:=(p)div 2
;f:=(f)div 2;
until f=1 else repeat if odd(f)then p:=p+(q-p)div 2 else p:=(p)div 2;
f:=(f)div 2;until f=1{:118};becareful:=n-2147483647;
if becareful+p>0 then begin aritherror:=true;n:=2147483647-p;end;
if negative then takefrac:=-(n+p)else takefrac:=n+p;end;
{:116}{121:}function mlog(x:integer):integer;var y,z:integer;k:integer;
begin if x<=0 then{123:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(301);
end;printscaled(x);print(302);begin helpptr:=2;helpline[1]:=303;
helpline[0]:=304;end;error;mlog:=0;end{:123}else begin y:=1302456860;
z:=6581195;while x<1073741824 do begin x:=x+x;y:=y-93032639;z:=z-48782;
end;y:=y+(z div 65536);k:=2;
while x>1073741828 do{122:}begin z:=((x-1)div twotothe[k])+1;
while x<1073741824+z do begin z:=(z+1)div 2;k:=k+1;end;y:=y+speclog[k];
x:=x-z;end{:122};mlog:=y div 8;end;end;
{:121}{124:}function abvscd(a,b,c,d:integer):integer;label 10;
var q,r:integer;begin{125:}if a<0 then begin a:=-a;b:=-b;end;
if c<0 then begin c:=-c;d:=-d;end;
if d<=0 then begin if b>=0 then if((a=0)or(b=0))and((c=0)or(d=0))then
begin abvscd:=0;goto 10;end else begin abvscd:=1;goto 10;end;
if d=0 then if a=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=-1;goto 10;end;q:=a;a:=c;c:=q;q:=-b;b:=-d;d:=q;
end else if b<=0 then begin if b<0 then if a>0 then begin abvscd:=-1;
goto 10;end;if c=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=-1;goto 10;end;end{:125};
while true do begin q:=a div d;r:=c div b;
if q<>r then if q>r then begin abvscd:=1;goto 10;
end else begin abvscd:=-1;goto 10;end;q:=a mod d;r:=c mod b;
if r=0 then if q=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=1;goto 10;end;if q=0 then begin abvscd:=-1;
goto 10;end;a:=b;b:=q;c:=d;d:=r;end;10:end;
{:124}{126:}procedure newrandoms;var k:0..54;x:integer;
begin for k:=0 to 23 do begin x:=randoms[k]-randoms[k+31];
if x<0 then x:=x+268435456;randoms[k]:=x;end;
for k:=24 to 54 do begin x:=randoms[k]-randoms[k-24];
if x<0 then x:=x+268435456;randoms[k]:=x;end;jrandom:=54;end;
{:126}{127:}procedure initrandoms(seed:integer);var j,jj,k:integer;
i:0..54;begin j:=abs(seed);while j>=268435456 do j:=(j)div 2;k:=1;
for i:=0 to 54 do begin jj:=k;k:=j-k;j:=jj;if k<0 then k:=k+268435456;
randoms[(i*21)mod 55]:=j;end;newrandoms;newrandoms;newrandoms;end;
{:127}{128:}function unifrand(x:integer):integer;var y:integer;
begin if jrandom=0 then newrandoms else decr(jrandom);
y:=takefrac(abs(x),randoms[jrandom]);
if y=abs(x)then unifrand:=0 else if x>0 then unifrand:=y else unifrand:=
-y;end;{:128}{129:}function normrand:integer;var x,u,l:integer;
begin repeat repeat if jrandom=0 then newrandoms else decr(jrandom);
x:=takefrac(112429,randoms[jrandom]-134217728);
if jrandom=0 then newrandoms else decr(jrandom);u:=randoms[jrandom];
until abs(x)<u;x:=makefrac(x,u);l:=139548960-mlog(u);
until abvscd(1024,l,x,x)>=0;normrand:=x;end;
{:129}{134:}ifdef('TEXMF_DEBUG')procedure printword(w:memoryword);
begin printint(w.int);printchar(32);printscaled(w.int);printchar(32);
printscaled(round(65536*w.gr));println;printint(w.hh.lh);printchar(61);
printint(w.hh.b0);printchar(58);printint(w.hh.b1);printchar(59);
printint(w.hh.rh);printchar(32);printint(w.qqqq.b0);printchar(58);
printint(w.qqqq.b1);printchar(58);printint(w.qqqq.b2);printchar(58);
printint(w.qqqq.b3);end;
endif('TEXMF_DEBUG'){:134}{139:}{322:}procedure showtokenlist(p,q:
integer;l:integer);label 10;var m,c:integer;matchchr:0..11904;
n:ASCIIcode;begin matchchr:=35;n:=48;tally:=0;
while(p<>-1073741823)and(tally<l)do begin if p=q then{350:}begin
firstcount:=tally;kcp:=trickbuf2[(firstcount-1)mod errorline];
if(firstcount>0)and(kcp>0)then firstcount:=firstcount+nrestmultichr(kcp)
;trickcount:=firstcount+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end{:350};
{323:}if(p<himemmin)or(p>memend)then begin printesc(319);goto 10;end;
if mem[p].hh.lh>=536870911 then printcs(mem[p].hh.lh-536870911)else
begin if checkkanji(mem[p].hh.lh)then begin m:=ktokentocmd(mem[p].hh.lh)
;c:=ktokentochr(mem[p].hh.lh);end else begin m:=mem[p].hh.lh div 65536;
c:=mem[p].hh.lh mod 65536;end;
if(m<16)and(c>=11904)then printesc(643)else{324:}case m of 16,17,18,19,
20:printkanji(c);
1,2,3,4,7,8,10,11,12:if(checkecharrange(c)=1)or(checkmcharrange(c))then
printkanji(c)else print(c);
6:begin if(checkecharrange(c)=1)or(checkmcharrange(c))then begin
printkanji(c);printkanji(c);end else begin print(c);print(c);end end;
5:begin if(checkecharrange(matchchr)=1)or(checkmcharrange(matchchr))then
printkanji(matchchr)else print(matchchr);
if c<=9 then printchar(c+48)else begin printchar(33);goto 10;end;end;
13:begin matchchr:=c;
if(checkecharrange(c)=1)or(checkmcharrange(c))then printkanji(c)else
print(c);incr(n);printchar(n);if n>57 then goto 10;end;
14:if c=0 then print(644);others:printesc(643)end{:324};end{:323};
p:=mem[p].hh.rh;end;if p<>-1073741823 then printesc(436);10:end;
{:322}{336:}procedure runaway;var p:halfword;
begin if scannerstatus>1 then begin case scannerstatus of 2:begin
printnl(659);p:=defref;end;3:begin printnl(660);p:=memtop-3;end;
4:begin printnl(661);p:=memtop-4;end;5:begin printnl(662);p:=defref;end;
end;printchar(63);println;
showtokenlist(mem[p].hh.rh,-1073741823,errorline-10);end;end;
{:336}{:139}{140:}function getavail:halfword;var p:halfword;
begin p:=avail;
if p<>-1073741823 then avail:=mem[avail].hh.rh else if memend<memmax
then begin incr(memend);p:=memend;end else begin decr(himemmin);
p:=himemmin;if himemmin<=lomemmax then begin runaway;
overflow(305,memmax+1-memmin);end;end;mem[p].hh.rh:=-1073741823;
ifdef('STAT')incr(dynused);endif('STAT')getavail:=p;end;
{:140}{143:}procedure flushlist(p:halfword);var q,r:halfword;
begin if p<>-1073741823 then begin r:=p;repeat q:=r;r:=mem[r].hh.rh;
ifdef('STAT')decr(dynused);endif('STAT')until r=-1073741823;
mem[q].hh.rh:=avail;avail:=p;end;end;
{:143}{145:}function getnode(s:integer):halfword;label 40,10,20;
var p:halfword;q:halfword;r:integer;t:integer;begin 20:p:=rover;
repeat{147:}q:=p+mem[p].hh.lh;
while(mem[q].hh.rh=1073741823)do begin t:=mem[q+1].hh.rh;
if q=rover then rover:=t;mem[t+1].hh.lh:=mem[q+1].hh.lh;
mem[mem[q+1].hh.lh+1].hh.rh:=t;q:=q+mem[q].hh.lh;end;r:=q-s;
if r>p+1 then{148:}begin mem[p].hh.lh:=r-p;rover:=p;goto 40;end{:148};
if r=p then if mem[p+1].hh.rh<>p then{149:}begin rover:=mem[p+1].hh.rh;
t:=mem[p+1].hh.lh;mem[rover+1].hh.lh:=t;mem[t+1].hh.rh:=rover;goto 40;
end{:149};mem[p].hh.lh:=q-p{:147};p:=mem[p+1].hh.rh;until p=rover;
if s=1073741824 then begin getnode:=1073741823;goto 10;end;
if lomemmax+2<himemmin then if lomemmax+2<=membot+1073741823 then{146:}
begin if himemmin-lomemmax>=1998 then t:=lomemmax+1000 else t:=lomemmax
+1+(himemmin-lomemmax)div 2;p:=mem[rover+1].hh.lh;q:=lomemmax;
mem[p+1].hh.rh:=q;mem[rover+1].hh.lh:=q;
if t>membot+1073741823 then t:=membot+1073741823;mem[q+1].hh.rh:=rover;
mem[q+1].hh.lh:=p;mem[q].hh.rh:=1073741823;mem[q].hh.lh:=t-lomemmax;
lomemmax:=t;mem[lomemmax].hh.rh:=-1073741823;
mem[lomemmax].hh.lh:=-1073741823;rover:=q;goto 20;end{:146};
overflow(305,memmax+1-memmin);40:mem[r].hh.rh:=-1073741823;
ifdef('STAT')varused:=varused+s;
endif('STAT'){1755:}if s>=4 then begin mem[r+s-2].int:=curinput.
synctextagfield;mem[r+s-1].int:=line;end;{:1755};getnode:=r;10:end;
{:145}{150:}procedure freenode(p:halfword;s:halfword);var q:halfword;
begin mem[p].hh.lh:=s;mem[p].hh.rh:=1073741823;q:=mem[rover+1].hh.lh;
mem[p+1].hh.lh:=q;mem[p+1].hh.rh:=rover;mem[rover+1].hh.lh:=p;
mem[q+1].hh.rh:=p;ifdef('STAT')varused:=varused-s;endif('STAT')end;
{:150}{151:}ifdef('INITEX')procedure sortavail;var p,q,r:halfword;
oldrover:halfword;begin p:=getnode(1073741824);p:=mem[rover+1].hh.rh;
mem[rover+1].hh.rh:=1073741823;oldrover:=rover;
while p<>oldrover do{152:}if p<rover then begin q:=p;p:=mem[q+1].hh.rh;
mem[q+1].hh.rh:=rover;rover:=q;end else begin q:=rover;
while mem[q+1].hh.rh<p do q:=mem[q+1].hh.rh;r:=mem[p+1].hh.rh;
mem[p+1].hh.rh:=mem[q+1].hh.rh;mem[q+1].hh.rh:=p;p:=r;end{:152};
p:=rover;
while mem[p+1].hh.rh<>1073741823 do begin mem[mem[p+1].hh.rh+1].hh.lh:=p
;p:=mem[p+1].hh.rh;end;mem[p+1].hh.rh:=rover;mem[rover+1].hh.lh:=p;end;
endif('INITEX'){:151}{156:}function newnullbox:halfword;var p:halfword;
begin p:=getnode(10);mem[p].hh.b0:=0;mem[p].hh.b1:=0;mem[p+1].int:=0;
mem[p+2].int:=0;mem[p+3].int:=0;mem[p+4].int:=0;
mem[p+5].hh.rh:=-1073741823;mem[p+5].hh.b0:=0;mem[p+5].hh.b1:=0;
mem[p+6].gr:=0.0;mem[p+7].hh.rh:=membot;mem[p+7].hh.lh:=membot;
mem[p].hh.b1:=((mem[p].hh.b1)div 16)*16+5;incr(mem[membot].hh.rh);
incr(mem[membot].hh.rh);newnullbox:=p;end;
{:156}{158:}function newdirnode(b:halfword;dir:eightbits):halfword;
var p:halfword;begin if mem[b].hh.b0>1 then confusion(306);
p:=newnullbox;mem[p].hh.b0:=2;
mem[p].hh.b1:=((mem[p].hh.b1)div 16)*16+dir+5;
case abs(((mem[b].hh.b1)mod 16-5))of 4:{159:}case dir of 3:begin mem[p+1
].int:=mem[b+3].int+mem[b+2].int;mem[p+2].int:=mem[b+1].int/2;
mem[p+3].int:=mem[b+1].int-mem[p+2].int;end;
1:begin mem[p+1].int:=mem[b+3].int+mem[b+2].int;mem[p+2].int:=0;
mem[p+3].int:=mem[b+1].int;end;others:confusion(308);end{:159};
3:{160:}case dir of 4:begin mem[p+1].int:=mem[b+3].int+mem[b+2].int;
mem[p+2].int:=0;mem[p+3].int:=mem[b+1].int;end;
1:begin mem[p+1].int:=mem[b+1].int;mem[p+2].int:=mem[b+3].int;
mem[p+3].int:=mem[b+2].int;end;others:confusion(309);end{:160};
1:{161:}case dir of 4:begin mem[p+1].int:=mem[b+3].int+mem[b+2].int;
mem[p+2].int:=0;mem[p+3].int:=mem[b+1].int;end;
3:begin mem[p+1].int:=mem[b+1].int;mem[p+2].int:=mem[b+3].int;
mem[p+3].int:=mem[b+2].int;end;others:confusion(310);end{:161};
others:confusion(307);end;mem[b].hh.rh:=-1073741823;mem[p+5].hh.rh:=b;
newdirnode:=p;end;{:158}{163:}function newrule:halfword;var p:halfword;
begin p:=getnode(6);mem[p].hh.b0:=3;mem[p].hh.b1:=0;
mem[p+1].int:=-1073741824;mem[p+2].int:=-1073741824;
mem[p+3].int:=-1073741824;newrule:=p;end;
{:163}{169:}function newligature(f:internalfontnumber;c:quarterword;
q:halfword):halfword;var p:halfword;begin p:=getnode(2);
c:=ptenc8bitcodetoucs(fontenc[f],c);mem[p].hh.b0:=8;mem[p+1].hh.b0:=f;
mem[p+1].hh.b1:=c;mem[p+1].hh.rh:=q;mem[p].hh.b1:=0;newligature:=p;end;
function newligitem(c:quarterword):halfword;var p:halfword;
begin p:=getnode(2);c:=ptenc8bitcodetoucs(fontenc[f],c);mem[p].hh.b1:=c;
mem[p+1].hh.rh:=-1073741823;newligitem:=p;end;
{:169}{170:}function newdisc:halfword;var p:halfword;
begin p:=getnode(2);mem[p].hh.b0:=9;mem[p].hh.b1:=0;
mem[p+1].hh.lh:=-1073741823;mem[p+1].hh.rh:=-1073741823;newdisc:=p;end;
{:170}{172:}function newmath(w:scaled;s:smallnumber):halfword;
var p:halfword;begin p:=getnode(4);mem[p].hh.b0:=11;mem[p].hh.b1:=s;
mem[p+1].int:=w;newmath:=p;end;
{:172}{176:}function newspec(p:halfword):halfword;var q:halfword;
begin q:=getnode(4);mem[q]:=mem[p];mem[q].hh.rh:=-1073741823;
mem[q+1].int:=mem[p+1].int;mem[q+2].int:=mem[p+2].int;
mem[q+3].int:=mem[p+3].int;newspec:=q;end;
{:176}{177:}function newparamglue(n:smallnumber):halfword;
var p:halfword;q:halfword;begin p:=getnode(4);mem[p].hh.b0:=12;
mem[p].hh.b1:=n+1;mem[p+1].hh.rh:=-1073741823;
q:={249:}eqtb[49925+n].hh.rh{:249};mem[p+1].hh.lh:=q;incr(mem[q].hh.rh);
newparamglue:=p;end;{:177}{178:}function newglue(q:halfword):halfword;
var p:halfword;begin p:=getnode(4);mem[p].hh.b0:=12;mem[p].hh.b1:=0;
mem[p+1].hh.rh:=-1073741823;mem[p+1].hh.lh:=q;incr(mem[q].hh.rh);
newglue:=p;end;
{:178}{179:}function newskipparam(n:smallnumber):halfword;
var p:halfword;begin tempptr:=newspec({249:}eqtb[49925+n].hh.rh{:249});
p:=newglue(tempptr);mem[tempptr].hh.rh:=-1073741823;mem[p].hh.b1:=n+1;
newskipparam:=p;end;{:179}{181:}function newkern(w:scaled):halfword;
var p:halfword;begin p:=getnode(4);mem[p].hh.b0:=13;mem[p].hh.b1:=0;
mem[p+1].int:=w;newkern:=p;end;
{:181}{183:}function newpenalty(m:integer):halfword;var p:halfword;
begin p:=getnode(4);mem[p].hh.b0:=14;mem[p].hh.b1:=0;mem[p+1].int:=m;
newpenalty:=p;end;
{:183}{192:}ifdef('TEXMF_DEBUG')procedure checkmem(printlocs:boolean);
label 31,32;var p,q:halfword;clobbered:boolean;
begin for p:=memmin to lomemmax do freearr[p]:=false;
for p:=himemmin to memend do freearr[p]:=false;{193:}p:=avail;
q:=-1073741823;clobbered:=false;
while p<>-1073741823 do begin if(p>memend)or(p<himemmin)then clobbered:=
true else if freearr[p]then clobbered:=true;
if clobbered then begin printnl(311);printint(q);goto 31;end;
freearr[p]:=true;q:=p;p:=mem[q].hh.rh;end;31:{:193};{194:}p:=rover;
q:=-1073741823;clobbered:=false;
repeat if(p>=lomemmax)or(p<memmin)then clobbered:=true else if(mem[p+1].
hh.rh>=lomemmax)or(mem[p+1].hh.rh<memmin)then clobbered:=true else if
not((mem[p].hh.rh=1073741823))or(mem[p].hh.lh<2)or(p+mem[p].hh.lh>
lomemmax)or(mem[mem[p+1].hh.rh+1].hh.lh<>p)then clobbered:=true;
if clobbered then begin printnl(312);printint(q);goto 32;end;
for q:=p to p+mem[p].hh.lh-1 do begin if freearr[q]then begin printnl(
313);printint(q);goto 32;end;freearr[q]:=true;end;q:=p;
p:=mem[p+1].hh.rh;until p=rover;32:{:194};{195:}p:=memmin;
while p<=lomemmax do begin if(mem[p].hh.rh=1073741823)then begin printnl
(314);printint(p);end;while(p<=lomemmax)and not freearr[p]do incr(p);
while(p<=lomemmax)and freearr[p]do incr(p);end{:195};
if printlocs then{196:}begin printnl(315);
for p:=memmin to lomemmax do if not freearr[p]and((p>waslomax)or wasfree
[p])then begin printchar(32);printint(p);end;
for p:=himemmin to memend do if not freearr[p]and((p<washimin)or(p>
wasmemend)or wasfree[p])then begin printchar(32);printint(p);end;
end{:196};for p:=memmin to lomemmax do wasfree[p]:=freearr[p];
for p:=himemmin to memend do wasfree[p]:=freearr[p];wasmemend:=memend;
waslomax:=lomemmax;washimin:=himemmin;end;
endif('TEXMF_DEBUG'){:192}{197:}ifdef('TEXMF_DEBUG')procedure searchmem(
p:halfword);var q:integer;
begin for q:=memmin to lomemmax do begin if mem[q].hh.rh=p then begin
printnl(316);printint(q);printchar(41);end;
if mem[q].hh.lh=p then begin printnl(317);printint(q);printchar(41);end;
end;
for q:=himemmin to memend do begin if mem[q].hh.rh=p then begin printnl(
316);printint(q);printchar(41);end;
if mem[q].hh.lh=p then begin printnl(317);printint(q);printchar(41);end;
end;
{280:}for q:=1 to 50984 do begin if eqtb[q].hh.rh=p then begin printnl(
563);printint(q);printchar(41);end;end{:280};
{315:}if saveptr>0 then for q:=0 to saveptr-1 do begin if savestack[q].
hh.rh=p then begin printnl(635);printint(q);printchar(41);end;end{:315};
{975:}for q:=0 to hyphsize do begin if hyphlist[q]=p then begin printnl(
1109);printint(q);printchar(41);end;end{:975};end;
endif('TEXMF_DEBUG'){1779:}procedure pdferror(t,p:strnumber);
begin normalizeselector;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1720);
end;if t<>0 then begin print(287);print(t);print(41);end;print(657);
print(p);begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
function getmicrointerval:integer;var s,m:integer;
begin secondsandmicros(s,m);
if(s-epochseconds)>32767 then getmicrointerval:=2147483647 else if(
microseconds>m)then getmicrointerval:=((s-1-epochseconds)*65536)+(((m
+1000000-microseconds)/100)*65536)/10000 else getmicrointerval:=((s-
epochseconds)*65536)+(((m-microseconds)/100)*65536)/10000;end;
{:1779}{1789:}function tokenstostring(p:halfword):strnumber;
begin if selector=21 then pdferror(1721,1722);oldsetting:=selector;
selector:=21;showtokenlist(mem[p].hh.rh,-1073741823,poolsize-poolptr);
selector:=oldsetting;lasttokensstring:=makestring;
tokenstostring:=lasttokensstring;end;procedure flushstr(s:strnumber);
begin if(s=strptr-1)then begin decr(strptr);poolptr:=strstart[strptr];
end;end;{:1789}{:197}{199:}{297:}procedure printfontnameandsize(f:
internalfontnumber);begin print(fontname[f]);
if fontsize[f]<>fontdsize[f]then begin print(64);
printscaled(fontsize[f]);print(425);end;end;
procedure printfontdirandenc(f:internalfontnumber);
begin if fontdir[f]=3 then print(613)else if fontdir[f]=4 then print(614
);
if fontenc[f]=2 then print(615)else if fontenc[f]=1 then print(616)else
if fontenc[f]=128 then print(617)else if fontenc[f]=129 then print(618)
else if fontenc[f]=130 then print(619)else if fontenc[f]=131 then print(
620)else if fontenc[f]=132 then print(621)else if fontenc[f]=144 then
print(622)else if fontenc[f]=145 then print(623)else if fontenc[f]=146
then print(624)else if fontenc[f]=160 then print(625);end;
{:297}procedure shortdisplay(p:integer);var n:integer;
begin while p>memmin do begin if(p>=himemmin)then begin if p<=memend
then begin if mem[p].hh.b0<>fontinshortdisplay then begin if(mem[p].hh.
b0>fontmax)then printchar(42)else{296:}begin printesc(hash[40923+mem[p].
hh.b0].rh);if eqtb[114422].int>0 then begin print(287);
printfontnameandsize(mem[p].hh.b0);
if eqtb[114422].int>1 then begin printfontdirandenc(mem[p].hh.b0);end;
print(41);end;end;{:296};printchar(32);fontinshortdisplay:=mem[p].hh.b0;
end;if fontdir[mem[p].hh.b0]<>0 then begin p:=mem[p].hh.rh;
printkanji(mem[p].hh.lh);
end else if checkecharrange(mem[p].hh.b1)=1 then printkanji(mem[p].hh.b1
)else print(mem[p].hh.b1);end;
end else{200:}case mem[p].hh.b0 of 0,1,2,4,10,6,7,15:print(318);
3:printchar(124);12:if mem[p+1].hh.lh<>membot then printchar(32);
11:if mem[p].hh.b1>=4 then print(318)else printchar(36);
8:shortdisplay(mem[p+1].hh.rh);9:begin shortdisplay(mem[p+1].hh.lh);
shortdisplay(mem[p+1].hh.rh);n:=mem[p].hh.b1;
while n>0 do begin if mem[p].hh.rh<>-1073741823 then p:=mem[p].hh.rh;
decr(n);end;end;others:end{:200};p:=mem[p].hh.rh;end;end;
{:199}{201:}procedure printfontandchar(p:integer);
begin if p>memend then printesc(319)else begin if(mem[p].hh.b0>fontmax)
then printchar(42)else{296:}begin printesc(hash[40923+mem[p].hh.b0].rh);
if eqtb[114422].int>0 then begin print(287);
printfontnameandsize(mem[p].hh.b0);
if eqtb[114422].int>1 then begin printfontdirandenc(mem[p].hh.b0);end;
print(41);end;end;{:296};printchar(32);
if fontdir[mem[p].hh.b0]<>0 then begin p:=mem[p].hh.rh;
printkanji(mem[p].hh.lh);
end else if checkecharrange(mem[p].hh.b1)=1 then printkanji(mem[p].hh.b1
)else print(mem[p].hh.b1);end;end;procedure printmark(p:integer);
begin printchar(123);
if(p<himemmin)or(p>memend)then printesc(319)else showtokenlist(mem[p].hh
.rh,-1073741823,maxprintline-10);printchar(125);end;
procedure printruledimen(d:scaled);
begin if(d=-1073741824)then printchar(42)else printscaled(d);end;
{:201}{202:}procedure printglue(d:scaled;order:integer;s:strnumber);
begin printscaled(d);
if(order<0)or(order>4)then print(320)else if order>0 then begin print(
321);while order>1 do begin printchar(108);decr(order);end;
end else if s<>0 then print(s);end;
{:202}{203:}procedure printspec(p:integer;s:strnumber);
begin if(p<memmin)or(p>=lomemmax)then printchar(42)else begin
printscaled(mem[p+1].int);if s<>0 then print(s);
if mem[p+2].int<>0 then begin print(322);
printglue(mem[p+2].int,mem[p].hh.b0,s);end;
if mem[p+3].int<>0 then begin print(323);
printglue(mem[p+3].int,mem[p].hh.b1,s);end;end;end;
{:203}{204:}{732:}procedure printfamandchar(p:halfword;t:integer);
var cx:KANJIcode;begin printesc(507);printint(mem[p].hh.b0);
printchar(32);
if t=1 then print(mem[p].hh.b1)else begin cx:=mem[p+3].hh.lh;
printkanji(cx);end;end;procedure printdelimiter(p:halfword);
var a:integer;begin a:=mem[p].qqqq.b0*256+mem[p].qqqq.b1;
a:=a*4096+mem[p].qqqq.b2*256+mem[p].qqqq.b3;
if a<0 then printint(a)else printhex(a);end;
{:732}{733:}procedure showinfo;forward;
procedure printsubsidiarydata(p:halfword;c:ASCIIcode);
begin if(poolptr-strstart[strptr])>=depththreshold then begin if mem[p].
hh.rh<>0 then print(324);end else begin begin strpool[poolptr]:=c;
incr(poolptr);end;tempptr:=p;case mem[p].hh.rh of 1,6:begin println;
printcurrentstring;printfamandchar(p,mem[p].hh.rh);end;2,3:showinfo;
4:if mem[p].hh.lh=-1073741823 then begin println;printcurrentstring;
print(1027);end else showinfo;others:end;decr(poolptr);end;end;
{:733}{735:}procedure printstyle(c:integer);
begin case c div 2 of 0:printesc(1028);1:printesc(1029);
2:printesc(1030);3:printesc(1031);others:print(1032)end;end;
{:735}{250:}procedure printskipparam(n:integer);
begin case n of 0:printesc(401);1:printesc(402);2:printesc(403);
3:printesc(404);4:printesc(405);5:printesc(406);6:printesc(407);
7:printesc(408);8:printesc(409);9:printesc(410);10:printesc(411);
11:printesc(412);12:printesc(413);13:printesc(414);14:printesc(415);
17:printesc(416);18:printesc(417);19:printesc(418);15:printesc(419);
16:printesc(420);20:print(421);others:print(422)end;end;
{:250}{:204}{207:}procedure shownodelist(p:integer);label 10;
var n:integer;g:real;
begin if(poolptr-strstart[strptr])>depththreshold then begin if p>
-1073741823 then print(324);goto 10;end;n:=0;
while p>memmin do begin println;printcurrentstring;
if p>memend then begin print(325);goto 10;end;incr(n);
if n>breadthmax then begin print(326);goto 10;end;
{208:}if(p>=himemmin)then begin printfontandchar(p);
if fontdir[mem[p].hh.b0]<>0 then p:=mem[p].hh.rh end else case mem[p].hh
.b0 of 0,1,2,15:{209:}begin case mem[p].hh.b0 of 0:printesc(104);
1:printesc(118);2:printesc(329);others:printesc(330)end;print(331);
printscaled(mem[p+3].int);printchar(43);printscaled(mem[p+2].int);
print(332);printscaled(mem[p+1].int);
if mem[p].hh.b0=15 then{210:}begin if mem[p].hh.b1<>0 then begin print(
287);printint(mem[p].hh.b1+1);print(334);end;
if mem[p+6].int<>0 then begin print(335);
printglue(mem[p+6].int,mem[p+5].hh.b1,0);end;
if mem[p+4].int<>0 then begin print(336);
printglue(mem[p+4].int,mem[p+5].hh.b0,0);end;
end{:210}else begin{211:}g:=mem[p+6].gr;
if(g<>0.0)and(mem[p+5].hh.b0<>0)then begin print(337);
if mem[p+5].hh.b0=2 then print(338);
if fabs(g)>20000.0 then begin if g>0.0 then printchar(62)else print(339)
;printglue(20000*65536,mem[p+5].hh.b1,0);
end else printglue(round(65536*g),mem[p+5].hh.b1,0);end{:211};
if mem[p+4].int<>0 then begin print(333);printscaled(mem[p+4].int);end;
if(eTeXmode=1)then{1481:}if(mem[p].hh.b0=0)and(((mem[p].hh.b1)div 16)=2)
then print(1607){:1481};
if((mem[p].hh.b1)mod 16-5)<>0 then begin printdirectionalt(((mem[p].hh.
b1)mod 16-5));end;end;begin begin strpool[poolptr]:=46;incr(poolptr);
end;shownodelist(mem[p+5].hh.rh);decr(poolptr);end;end{:209};
3:{212:}begin printesc(340);printruledimen(mem[p+3].int);printchar(43);
printruledimen(mem[p+2].int);print(332);printruledimen(mem[p+1].int);
end{:212};4:{213:}begin printesc(341);printint(mem[p].hh.b1);
printdir(abs((mem[p+5].hh.b1-5)));print(342);printscaled(mem[p+3].int);
print(343);printspec(mem[p+4].hh.rh,0);printchar(44);
printscaled(mem[p+2].int);print(344);printint(mem[p+1].int);
begin begin strpool[poolptr]:=46;incr(poolptr);end;
shownodelist(mem[p+4].hh.lh);decr(poolptr);end;end{:213};
10:{1400:}case mem[p].hh.b1 of 0:begin printwritewhatsit(1502,p);
printchar(61);
printfilename(mem[p+1].hh.rh,mem[p+2].hh.lh,mem[p+2].hh.rh);end;
1:begin printwritewhatsit(684,p);printmark(mem[p+1].hh.rh);end;
2:printwritewhatsit(1503,p);3:begin printesc(1504);
printmark(mem[p+1].hh.rh);end;4:begin printesc(1504);print(1513);
printmark(mem[p+1].hh.rh);end;5:begin printesc(1506);
printint(mem[p+1].hh.rh);print(1514);printint(mem[p+1].hh.b0);
printchar(44);printint(mem[p+1].hh.b1);printchar(41);end;
8:printesc(1508);9:printesc(1509);10:printesc(1510);
others:print(1515)end{:1400};5:begin printesc(327);
printscaled(mem[p+1].int);end;
12:{214:}if mem[p].hh.b1>=100 then{215:}begin printesc(349);
if mem[p].hh.b1=101 then printchar(99)else if mem[p].hh.b1=102 then
printchar(120);print(350);printspec(mem[p+1].hh.lh,0);
begin begin strpool[poolptr]:=46;incr(poolptr);end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);end;
end{:215}else begin printesc(345);
if mem[p].hh.b1<>0 then begin printchar(40);
if mem[p].hh.b1<98 then printskipparam(mem[p].hh.b1-1)else if mem[p].hh.
b1=98 then printesc(346)else printesc(347);printchar(41);end;
if mem[p].hh.b1<>98 then begin printchar(32);
if mem[p].hh.b1<98 then printspec(mem[p+1].hh.lh,0)else printspec(mem[p
+1].hh.lh,348);end;end{:214};
13:{216:}if mem[p].hh.b1<>99 then begin printesc(351);
if mem[p].hh.b1<>0 then printchar(32);printscaled(mem[p+1].int);
if mem[p].hh.b1=2 then print(352);end else begin printesc(353);
printscaled(mem[p+1].int);print(348);end{:216};
11:{217:}if mem[p].hh.b1>1 then begin if odd(mem[p].hh.b1)then printesc(
354)else printesc(355);
if mem[p].hh.b1>8 then printchar(82)else if mem[p].hh.b1>4 then
printchar(76)else printchar(77);end else begin printesc(356);
if mem[p].hh.b1=0 then print(357)else print(358);
if mem[p+1].int<>0 then begin print(359);printscaled(mem[p+1].int);end;
end{:217};8:{218:}begin printfontandchar(p+1);print(360);
if mem[p].hh.b1>1 then printchar(124);
fontinshortdisplay:=mem[p+1].hh.b0;shortdisplay(mem[p+1].hh.rh);
if odd(mem[p].hh.b1)then printchar(124);printchar(41);end{:218};
14:{219:}begin printesc(361);printint(mem[p+1].int);
if mem[p].hh.b1=1 then print(362)else if mem[p].hh.b1=2 then print(363);
end{:219};9:{220:}begin printesc(364);
if mem[p].hh.b1>0 then begin print(365);printint(mem[p].hh.b1);end;
begin begin strpool[poolptr]:=46;incr(poolptr);end;
shownodelist(mem[p+1].hh.lh);decr(poolptr);end;
begin strpool[poolptr]:=124;incr(poolptr);end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);end{:220};
6:{221:}begin printesc(366);
if mem[p+1].hh.lh<>0 then begin printchar(115);printint(mem[p+1].hh.lh);
end;printmark(mem[p+1].hh.rh);end{:221};7:{222:}begin printesc(367);
if mem[p].hh.b1<>0 then print(368);begin begin strpool[poolptr]:=46;
incr(poolptr);end;shownodelist(mem[p+1].int);decr(poolptr);end;
end{:222};{731:}16:printstyle(mem[p].hh.b1);
17:{736:}begin printesc(595);begin strpool[poolptr]:=68;incr(poolptr);
end;shownodelist(mem[p+1].hh.lh);decr(poolptr);
begin strpool[poolptr]:=84;incr(poolptr);end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);begin strpool[poolptr]:=83;
incr(poolptr);end;shownodelist(mem[p+2].hh.lh);decr(poolptr);
begin strpool[poolptr]:=115;incr(poolptr);end;
shownodelist(mem[p+2].hh.rh);decr(poolptr);end{:736};
18,19,20,21,22,23,24,25,26,29,28,31,30,32,33:{737:}begin case mem[p].hh.
b0 of 18:printesc(1033);19:printesc(1034);20:printesc(1035);
21:printesc(1036);22:printesc(1037);23:printesc(1038);24:printesc(1039);
25:printesc(1040);29:printesc(1041);28:printesc(1042);31:printesc(611);
26:begin printesc(604);printdelimiter(p+5);end;30:begin printesc(572);
printfamandchar(p+5,1);end;32:begin printesc(1043);printdelimiter(p+1);
end;33:begin if mem[p].hh.b1=0 then printesc(1044)else printesc(1045);
printdelimiter(p+1);end;end;
if mem[p].hh.b0<32 then begin if mem[p].hh.b1<>0 then if mem[p].hh.b1=1
then printesc(1046)else printesc(1047);printsubsidiarydata(p+1,46);end;
printsubsidiarydata(p+2,94);printsubsidiarydata(p+3,95);end{:737};
27:{738:}begin printesc(1048);
if mem[p+1].int=1073741824 then print(1049)else printscaled(mem[p+1].int
);
if(mem[p+5].qqqq.b0<>0)or(mem[p+5].qqqq.b1<>0)or(mem[p+5].qqqq.b2<>0)or(
mem[p+5].qqqq.b3<>0)then begin print(1050);printdelimiter(p+5);end;
if(mem[p+4].qqqq.b0<>0)or(mem[p+4].qqqq.b1<>0)or(mem[p+4].qqqq.b2<>0)or(
mem[p+4].qqqq.b3<>0)then begin print(1051);printdelimiter(p+4);end;
printsubsidiarydata(p+2,92);printsubsidiarydata(p+3,47);end{:738};
{:731}others:print(328)end{:208};p:=mem[p].hh.rh;end;10:end;
{:207}{223:}procedure showbox(p:halfword);
begin{261:}depththreshold:=eqtb[114386].int;
breadthmax:=eqtb[114385].int{:261};if breadthmax<=0 then breadthmax:=5;
if poolptr+depththreshold>=poolsize then depththreshold:=poolsize-
poolptr-1;shownodelist(p);println;end;
{:223}{225:}procedure deletetokenref(p:halfword);
begin if mem[p].hh.lh=-1073741823 then flushlist(p)else decr(mem[p].hh.
lh);end;{:225}{226:}procedure deleteglueref(p:halfword);
begin if mem[p].hh.rh=-1073741823 then freenode(p,4)else decr(mem[p].hh.
rh);end;{:226}{227:}procedure flushnodelist(p:halfword);label 30;
var q:halfword;begin while p<>-1073741823 do begin q:=mem[p].hh.rh;
if(p>=himemmin)then begin mem[p].hh.rh:=avail;avail:=p;
ifdef('STAT')decr(dynused);
endif('STAT')end else begin case mem[p].hh.b0 of 0,1,2,15:begin
flushnodelist(mem[p+5].hh.rh);
begin if mem[mem[p+7].hh.rh].hh.rh=-1073741823 then freenode(mem[p+7].hh
.rh,4)else decr(mem[mem[p+7].hh.rh].hh.rh);end;
begin if mem[mem[p+7].hh.lh].hh.rh=-1073741823 then freenode(mem[p+7].hh
.lh,4)else decr(mem[mem[p+7].hh.lh].hh.rh);end;freenode(p,10);goto 30;
end;3:begin freenode(p,6);goto 30;end;
4:begin flushnodelist(mem[p+4].hh.lh);deleteglueref(mem[p+4].hh.rh);
freenode(p,6);goto 30;end;
10:{1402:}begin case mem[p].hh.b1 of 0:freenode(p,3);
1,3,4:begin deletetokenref(mem[p+1].hh.rh);freenode(p,2);goto 30;end;
2,5:freenode(p,2);8:freenode(p,2);others:confusion(1517)end;goto 30;
end{:1402};
12:begin begin if mem[mem[p+1].hh.lh].hh.rh=-1073741823 then freenode(
mem[p+1].hh.lh,4)else decr(mem[mem[p+1].hh.lh].hh.rh);end;
if mem[p+1].hh.rh<>-1073741823 then flushnodelist(mem[p+1].hh.rh);
freenode(p,4);goto 30;end;5:;13,11,14:begin freenode(p,4);goto 30;end;
8:flushnodelist(mem[p+1].hh.rh);6:deletetokenref(mem[p+1].hh.rh);
9:begin flushnodelist(mem[p+1].hh.lh);flushnodelist(mem[p+1].hh.rh);end;
7:flushnodelist(mem[p+1].int);{739:}16:begin freenode(p,3);goto 30;end;
17:begin flushnodelist(mem[p+1].hh.lh);flushnodelist(mem[p+1].hh.rh);
flushnodelist(mem[p+2].hh.lh);flushnodelist(mem[p+2].hh.rh);
freenode(p,3);goto 30;end;
18,19,20,21,22,23,24,25,26,29,28,31,30:begin if(mem[p+1].hh.rh>=2)and(
mem[p+1].hh.rh<>6)and(mem[p+1].hh.rh<>7)then flushnodelist(mem[p+1].hh.
lh);
if mem[p+2].hh.rh>=2 and(mem[p+2].hh.rh<>6)and(mem[p+2].hh.rh<>7)then
flushnodelist(mem[p+2].hh.lh);
if mem[p+3].hh.rh>=2 and(mem[p+3].hh.rh<>6)and(mem[p+3].hh.rh<>7)then
flushnodelist(mem[p+3].hh.lh);
if mem[p].hh.b0=26 then freenode(p,6)else if mem[p].hh.b0=30 then
freenode(p,6)else freenode(p,5);goto 30;end;32,33:begin freenode(p,5);
goto 30;end;27:begin flushnodelist(mem[p+2].hh.lh);
flushnodelist(mem[p+3].hh.lh);freenode(p,6);goto 30;end;
{:739}others:confusion(369)end;freenode(p,2);30:end;p:=q;end;end;
{:227}{229:}function copynodelist(p:halfword):halfword;var h:halfword;
q:halfword;r:halfword;words:0..5;begin h:=getavail;q:=h;
while p<>-1073741823 do begin{230:}words:=1;
if(p>=himemmin)then r:=getavail else{231:}case mem[p].hh.b0 of 2,0,1,15:
begin r:=getnode(10);{1774:}mem[r+8].int:=mem[p+8].int;
mem[r+9].int:=mem[p+9].int;{:1774};mem[r+7]:=mem[p+7];
mem[r+6]:=mem[p+6];mem[r+5]:=mem[p+5];incr(mem[mem[r+7].hh.rh].hh.rh);
incr(mem[mem[r+7].hh.lh].hh.rh);
mem[r+5].hh.rh:=copynodelist(mem[p+5].hh.rh);words:=5;end;
3:begin r:=getnode(6);words:=4;{1775:}{:1775};end;4:begin r:=getnode(6);
mem[r+5]:=mem[p+5];mem[r+4]:=mem[p+4];incr(mem[mem[p+4].hh.rh].hh.rh);
mem[r+4].hh.lh:=copynodelist(mem[p+4].hh.lh);words:=4;end;
10:{1401:}case mem[p].hh.b1 of 0:begin r:=getnode(3);words:=3;end;
1,3,4:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
2,5:begin r:=getnode(2);words:=2;end;8:r:=getnode(2);
others:confusion(1516)end{:1401};12:begin r:=getnode(4);
incr(mem[mem[p+1].hh.lh].hh.rh);{1776:}mem[r+2].int:=mem[p+2].int;
mem[r+3].int:=mem[p+3].int;{:1776};mem[r+1].hh.lh:=mem[p+1].hh.lh;
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;5:begin r:=getnode(2);
words:=2;end;13,11,14:begin r:=getnode(4);words:=4;end;
8:begin r:=getnode(2);mem[r+1]:=mem[p+1];
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;9:begin r:=getnode(2);
mem[r+1].hh.lh:=copynodelist(mem[p+1].hh.lh);
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;6:begin r:=getnode(2);
incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;7:begin r:=getnode(2);
mem[r+1].int:=copynodelist(mem[p+1].int);end;
others:confusion(370)end{:231};while words>0 do begin decr(words);
mem[r+words]:=mem[p+words];end{:230};mem[q].hh.rh:=r;q:=r;
p:=mem[p].hh.rh;end;mem[q].hh.rh:=-1073741823;q:=mem[h].hh.rh;
begin mem[h].hh.rh:=avail;avail:=h;ifdef('STAT')decr(dynused);
endif('STAT')end;copynodelist:=q;end;
{:229}{236:}procedure printmode(m:integer);
begin if m>0 then case m div(119)of 0:print(371);1:print(372);
2:print(373);
end else if m=0 then print(374)else case(-m)div(119)of 0:print(375);
1:print(376);2:print(377);end;end;procedure printinmode(m:integer);
begin if m>0 then case m div(119)of 0:print(378);1:print(379);
2:print(380);
end else if m=0 then print(381)else case(-m)div(119)of 0:print(382);
1:print(383);2:print(384);end;end;{:236}{241:}procedure pushnest;
begin if nestptr>maxneststack then begin maxneststack:=nestptr;
if nestptr=nestsize then overflow(385,nestsize);end;
nest[nestptr]:=curlist;incr(nestptr);curlist.headfield:=newnullbox;
curlist.tailfield:=curlist.headfield;
curlist.pnodefield:=curlist.tailfield;curlist.pgfield:=0;
curlist.pdispfield:=0;curlist.dispcalledfield:=false;
curlist.lastjchrfield:=-1073741823;curlist.mlfield:=line;
curlist.eTeXauxfield:=-1073741823;end;{:241}{242:}procedure popnest;
begin begin if mem[mem[curlist.headfield+7].hh.rh].hh.rh=-1073741823
then freenode(mem[curlist.headfield+7].hh.rh,4)else decr(mem[mem[curlist
.headfield+7].hh.rh].hh.rh);end;
begin if mem[mem[curlist.headfield+7].hh.lh].hh.rh=-1073741823 then
freenode(mem[curlist.headfield+7].hh.lh,4)else decr(mem[mem[curlist.
headfield+7].hh.lh].hh.rh);end;freenode(curlist.headfield,10);
decr(nestptr);curlist:=nest[nestptr];end;
{:242}{243:}procedure printtotals;forward;procedure showactivities;
var p:0..nestsize;m:-239..239;a:memoryword;q,r:halfword;t:integer;
begin nest[nestptr]:=curlist;printnl(349);println;
for p:=nestptr downto 0 do begin m:=nest[p].modefield;
a:=nest[p].auxfield;printnl(386);printdirection(nest[p].dirfield);
print(387);printmode(m);print(388);printint(abs(nest[p].mlfield));
if m=120 then if nest[p].pgfield<>8585216 then begin print(389);
printint(nest[p].pgfield mod 65536);print(390);
printint(nest[p].pgfield div 4194304);printchar(44);
printint((nest[p].pgfield div 65536)mod 64);printchar(41);end;
if nest[p].mlfield<0 then print(391);
if p=0 then begin{1028:}if memtop-2<>pagetail then begin printnl(1151);
if outputactive then print(1152);showbox(mem[memtop-2].hh.rh);
if pagecontents>0 then begin printnl(1153);printtotals;printnl(1154);
printscaled(pagesofar[0]);r:=mem[memtop].hh.rh;
while r<>memtop do begin println;printesc(341);t:=mem[r].hh.b1;
printint(t);print(1155);
if eqtb[114445+t].int=1000 then t:=mem[r+3].int else t:=xovern(mem[r+3].
int,1000)*eqtb[114445+t].int;printscaled(t);
if mem[r].hh.b0=1 then begin q:=memtop-2;t:=0;repeat q:=mem[q].hh.rh;
if(mem[q].hh.b0=4)and(mem[q].hh.b1=mem[r].hh.b1)then incr(t);
until q=mem[r+1].hh.lh;print(1156);printint(t);print(1157);end;
r:=mem[r].hh.rh;end;end;end{:1028};
if mem[memtop-1].hh.rh<>-1073741823 then printnl(392);end;
showbox(mem[nest[p].headfield].hh.rh);
{244:}case abs(m)div(119)of 0:begin printnl(393);
if a.int<=-65536000 then print(394)else printscaled(a.int);
if nest[p].pgfield<>0 then begin print(395);printint(nest[p].pgfield);
if nest[p].pgfield<>1 then print(396)else print(397);end;end;
1:begin printnl(398);printint(a.hh.lh);
if m>0 then if a.hh.rh>0 then begin print(399);printint(a.hh.rh);end;
end;2:if a.int<>-1073741823 then begin print(400);showbox(a.int);end;
end{:244};end;end;{:243}{262:}procedure printparam(n:integer);
begin case n of 0:printesc(463);1:printesc(464);2:printesc(465);
3:printesc(466);4:printesc(467);5:printesc(468);6:printesc(469);
7:printesc(470);8:printesc(471);9:printesc(472);10:printesc(473);
11:printesc(474);12:printesc(475);13:printesc(476);14:printesc(477);
15:printesc(478);16:printesc(479);17:printesc(480);18:printesc(481);
19:printesc(482);20:printesc(483);21:printesc(484);22:printesc(485);
23:printesc(486);24:printesc(487);25:printesc(488);26:printesc(489);
27:printesc(490);28:printesc(491);29:printesc(492);30:printesc(493);
31:printesc(494);32:printesc(495);33:printesc(496);34:printesc(497);
35:printesc(498);36:printesc(499);37:printesc(500);38:printesc(501);
39:printesc(502);40:printesc(503);41:printesc(504);42:printesc(505);
43:printesc(506);44:printesc(507);46:printesc(508);47:printesc(509);
48:printesc(510);49:printesc(511);50:printesc(512);45:printesc(513);
56:printesc(514);57:printesc(515);58:printesc(516);59:printesc(517);
60:printesc(518);61:printesc(519);51:printesc(520);52:printesc(521);
53:printesc(522);54:printesc(523);55:printesc(524);62:printesc(525);
63:printesc(526);64:printesc(527);65:printesc(528);66:printesc(529);
67:printesc(530);{1748:}68:printesc(1719);
{:1748}{1436:}69:printesc(1549);70:printesc(1550);71:printesc(1551);
72:printesc(1552);73:printesc(1553);74:printesc(1554);75:printesc(1555);
76:printesc(1556);77:printesc(1557);78:printesc(1558);79:printesc(1559);
80:printesc(1560);81:printesc(1561);82:printesc(1562);
{:1436}{1477:}83:printesc(1602);{:1477}others:print(531)end;end;
{:262}{266:}procedure fixdateandtime;
begin dateandtime(systime,sysday,sysmonth,sysyear);
eqtb[114381].int:=systime;eqtb[114382].int:=sysday;
eqtb[114383].int:=sysmonth;eqtb[114384].int:=sysyear;end;
{:266}{270:}procedure begindiagnostic;begin oldsetting:=selector;
if(eqtb[114390].int<=0)and(selector=19)then begin decr(selector);
if history=0 then history:=1;end;end;
procedure enddiagnostic(blankline:boolean);begin printnl(349);
if blankline then println;selector:=oldsetting;end;
{:270}{272:}procedure printlengthparam(n:integer);
begin case n of 0:printesc(535);1:printesc(536);2:printesc(537);
3:printesc(538);4:printesc(539);5:printesc(540);6:printesc(541);
7:printesc(542);8:printesc(543);9:printesc(544);10:printesc(545);
11:printesc(546);12:printesc(547);13:printesc(548);14:printesc(549);
15:printesc(550);16:printesc(551);17:printesc(552);18:printesc(553);
19:printesc(554);21:printesc(555);22:printesc(556);20:printesc(557);
23:printesc(558);24:printesc(559);others:print(560)end;end;
{:272}{277:}{328:}procedure printcmdchr(cmd:quarterword;
chrcode:halfword);var n:integer;begin case cmd of 1:begin print(645);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
2:begin print(646);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
3:begin print(647);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
6:begin print(648);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
7:begin print(649);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
8:begin print(650);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
9:print(651);10:begin print(652);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
11:begin print(653);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
12:begin print(654);
if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
16,17,18,19,20:begin print(655);printkanji(chrcode);end;
{252:}85,86:if chrcode<49946 then printskipparam(chrcode-49925)else if
chrcode<50202 then begin printesc(423);printint(chrcode-49946);
end else begin printesc(424);printint(chrcode-50202);end;
{:252}{256:}82:if chrcode>=50469 then begin printesc(435);
printint(chrcode-50469);end else case chrcode of 50459:printesc(426);
50460:printesc(427);50461:printesc(428);50462:printesc(429);
50463:printesc(430);50464:printesc(431);50465:printesc(432);
50466:printesc(433);{1435:}50468:printesc(1548);
{:1435}others:printesc(434)end;
{:256}{264:}83:if chrcode<114445 then printparam(chrcode-114361)else
begin printesc(533);printint(chrcode-114445);end;
{:264}{274:}84:if chrcode<114982 then printlengthparam(chrcode-114957)
else begin printesc(561);printint(chrcode-114982);end;
{:274}{295:}51:printesc(572);105:printesc(573);46:printesc(574);
47:printesc(575);87:printesc(587);67:printesc(576);48:printesc(602);
21:printesc(577);22:printesc(578);125:printesc(568);101:printesc(584);
102:printesc(585);103:printesc(586);
15:if chrcode=0 then printesc(579)else printesc(580);107:printesc(581);
73:printesc(569);68:printesc(582);70:printesc(32);
120:if chrcode=0 then printesc(583){1544:}else printesc(931){:1544};
38:printesc(588);42:printesc(589);
45:if chrcode=0 then printesc(590)else printesc(565);43:printesc(341);
50:printesc(47);24:begin printesc(366);if chrcode>0 then printchar(115);
end;52:if chrcode=0 then printesc(591)else printesc(593);
23:if chrcode=0 then printesc(592)else printesc(594);60:printesc(595);
106:printesc(596);40:printesc(597);71:printesc(598);
121:if chrcode=0 then printesc(599)else printesc(565);61:printesc(346);
69:printesc(600);72:if chrcode=0 then printesc(604)else printesc(605);
111:if chrcode=0 then printesc(606){1541:}else printesc(1617){:1541};
0:printesc(607);113:printesc(608);93:printesc(603);
97:case chrcode of 50458:printesc(601);{1646:}50725:printesc(1651);
50726:printesc(1652);50727:printesc(1653);50728:printesc(1654);
{:1646}end;
127:if chrcode=0 then printesc(609){1464:}else if chrcode=1 then
printesc(1592)else printesc(1593){:1464};81:{1614:}begin printesc(435);
if chrcode<>membot then printsanum(chrcode);end{:1614};44:printesc(367);
39:if chrcode=0 then printesc(610){1479:}else case chrcode of 6:printesc
(1603);7:printesc(1604);10:printesc(1605);
others:printesc(1606)end{:1479};62:printesc(611);41:printesc(612);
118:printesc(532);{:295}{365:}13:printesc(688);
{:365}{413:}122:if chrcode=0 then printesc(724){1529:}else if chrcode=2
then printesc(1615){:1529}else printesc(725);
{:413}{421:}128:begin case(chrcode mod 5)of 1:printesc(727);
2:printesc(728);3:printesc(729);4:printesc(730);others:printesc(726)end;
if chrcode>=5 then printchar(115);end;
{:421}{448:}104:{1613:}begin if(chrcode<membot)or(chrcode>membot+23)then
cmd:=(mem[chrcode].hh.b0 div 16)else begin cmd:=chrcode-membot;
chrcode:=-1073741823;end;
if cmd=0 then printesc(533)else if cmd=1 then printesc(561)else if cmd=2
then printesc(423)else printesc(424);
if chrcode<>-1073741823 then printsanum(chrcode);end{:1613};
{:448}{454:}92:if chrcode=1 then printesc(769)else printesc(768);
95:if chrcode=0 then printesc(770){1470:}else if chrcode=2 then printesc
(1598){:1470}else printesc(771);
96:if chrcode=1 then printesc(772)else if chrcode=3 then printesc(773)
else printesc(774);78:case chrcode of 0:printesc(775);1:printesc(776);
2:printesc(777);7:printesc(778);9:printesc(780);10:printesc(781);
11:printesc(782);12:printesc(783);{1427:}3:printesc(1537);
4:printesc(1538);5:printesc(1539);6:printesc(1540);18:printesc(1541);
13:printesc(1542);14:printesc(1543);16:printesc(1546);15:printesc(1544);
17:printesc(1545);{:1427}{1441:}19:printesc(1577);20:printesc(1578);
{:1441}{1444:}21:printesc(1579);22:printesc(1580);23:printesc(1581);
{:1444}{1447:}29:printesc(1582);30:printesc(1583);31:printesc(1584);
32:printesc(1585);{:1447}{1450:}33:printesc(1586);34:printesc(1587);
35:printesc(1588);{:1450}{1560:}40:printesc(1627);41:printesc(1628);
42:printesc(1629);43:printesc(1630);{:1560}{1583:}24:printesc(1634);
25:printesc(1635);36:printesc(1636);37:printesc(1637);
{:1583}{1587:}38:printesc(1638);39:printesc(1639);
{:1587}{1738:}26:printesc(1716);27:printesc(1717);
{:1738}{1741:}28:printesc(1718);{:1741}others:printesc(779)end;
{:454}{506:}126:case chrcode of 0:printesc(846);1:printesc(847);
3:printesc(848);4:printesc(849);5:printesc(850);2:printesc(851);
6:printesc(852);7:printesc(853);8:printesc(854);9:printesc(855);
10:printesc(856);11:printesc(857);12:printesc(858);13:printesc(859);
14:printesc(860);15:printesc(861);16:printesc(864);17:printesc(862);
18:printesc(865);19:printesc(866);20:printesc(867);21:printesc(868);
22:printesc(869);23:printesc(870);24:printesc(871);25:printesc(872);
26:printesc(873);27:printesc(874);others:printesc(863)end;
{:506}{526:}123:begin if chrcode>=32 then printesc(931);
case chrcode mod 32 of 1:printesc(905);2:printesc(906);3:printesc(907);
4:printesc(908);5:printesc(909);6:printesc(910);7:printesc(911);
8:printesc(912);9:printesc(913);10:printesc(914);11:printesc(915);
12:printesc(916);13:printesc(917);14:printesc(918);15:printesc(919);
16:printesc(920);22:printesc(921);23:printesc(922);24:printesc(923);
25:printesc(924);26:printesc(925);27:printesc(926);28:printesc(927);
29:printesc(928);21:printesc(932);30:printesc(929);31:printesc(930);
{1545:}17:printesc(1618);18:printesc(1619);19:printesc(1620);
20:printesc(1621);{:1545}others:printesc(904)end;end;
{:526}{530:}124:if chrcode=2 then printesc(321)else if chrcode=4 then
printesc(933)else printesc(934);
{:530}{822:}4:if chrcode=16777216 then printesc(1067)else begin print(
1071);if chrcode<256 then print(chrcode)else printkanji(chrcode);end;
5:if chrcode=16777217 then printesc(1068)else printesc(1069);
{:822}{1026:}94:case chrcode of 0:printesc(1139);1:printesc(1140);
2:printesc(1141);3:printesc(1142);4:printesc(1143);5:printesc(1144);
6:printesc(1145);7:printesc(1146);others:printesc(1147)end;
{:1026}{1096:}14:if chrcode=1 then printesc(1196)else printesc(354);
{:1096}{1102:}32:case chrcode of 5:printesc(1197);0:printesc(1198);
1:printesc(1199);2:printesc(1200);3:printesc(1201);
others:printesc(1202)end;33:case chrcode of 5:printesc(1203);
0:printesc(1204);1:printesc(1205);2:printesc(1206);3:printesc(1207);
others:printesc(1208)end;34:printesc(347);35:printesc(351);
36:printesc(353);
{:1102}{1115:}27:if chrcode=1 then printesc(1226)else printesc(1227);
28:if chrcode=1 then printesc(1228)else printesc(1229);
26:case chrcode of 0:printesc(437);1:printesc(1230);2:printesc(1231);
3:printesc(1134);4:printesc(1232);5:printesc(1136);
others:printesc(1233)end;80:case chrcode of 4:printesc(1235);
3:printesc(1234);1:printesc(1236);end;
37:if chrcode=100 then printesc(1238)else if chrcode=101 then printesc(
1239)else if chrcode=102 then printesc(1240)else printesc(1237);
{:1115}{1132:}49:if chrcode=0 then printesc(1272)else printesc(1271);
{:1132}{1151:}31:if chrcode=12 then printesc(1285)else if chrcode=13
then printesc(1284)else printesc(1283);
29:if chrcode=1 then printesc(1287)else printesc(1286);
30:if chrcode=1 then printesc(1289){1643:}else if chrcode=2 then
printesc(1649)else if chrcode=3 then printesc(1650){:1643}else printesc(
1288);{:1151}{1158:}53:if chrcode=1 then printesc(45)else printesc(364);
{:1158}{1186:}54:if chrcode=1 then printesc(1327)else printesc(1326);
{:1186}{1200:}56:case chrcode of 18:printesc(1033);19:printesc(1034);
20:printesc(1035);21:printesc(1036);22:printesc(1037);23:printesc(1038);
24:printesc(1039);25:printesc(1040);28:printesc(1042);
others:printesc(1041)end;
57:if chrcode=1 then printesc(1046)else if chrcode=2 then printesc(1047)
else printesc(1331);{:1200}{1213:}59:printstyle(chrcode);
{:1213}{1222:}58:case chrcode of 1:printesc(1350);2:printesc(1351);
3:printesc(1352);4:printesc(1353);5:printesc(1354);
others:printesc(1349)end;
{:1222}{1232:}55:if chrcode=32 then printesc(1043){1475:}else if chrcode
=1 then printesc(1045){:1475}else printesc(1044);
{:1232}{1252:}108:if chrcode=1 then printesc(1374)else if chrcode=2 then
printesc(1375){1552:}else if chrcode=8 then printesc(1388){:1552}else
printesc(1376);
112:if chrcode=0 then printesc(1377)else if chrcode=1 then printesc(1378
)else if chrcode=2 then printesc(1379)else printesc(1380);
{:1252}{1263:}109:if chrcode<>0 then printesc(1398)else printesc(1397);
{:1263}{1266:}110:case chrcode of 0:printesc(1399);9:printesc(1400);
1:printesc(1401);2:printesc(1402);3:printesc(1403);4:printesc(1404);
5:printesc(1405);6:printesc(1406);8:printesc(1408);
others:printesc(1407)end;74:begin printesc(577);printhex(chrcode);end;
75:begin printesc(578);printhex(chrcode);end;76:begin printesc(592);
printhex(chrcode);end;77:begin printesc(594);printhex(chrcode);end;
{:1266}{1274:}98:if chrcode=51759 then printesc(443)else if chrcode=
63663 then printesc(444)else if chrcode=64175 then printesc(445)else if
chrcode=113849 then printesc(462)else if chrcode=113977 then printesc(
1413)else if chrcode=78137 then printesc(459)else if chrcode=90041 then
printesc(460)else if chrcode=101945 then printesc(461)else if chrcode=
114701 then printesc(534)else printesc(1414);
99:printsize(chrcode-50986);
{:1274}{1295:}114:if chrcode=1 then printesc(1122)else printesc(1110);
{:1295}{1299:}88:if chrcode=0 then printesc(1432)else printesc(1433);
{:1299}{1305:}100:begin print(1441);slowprint(fontname[chrcode]);
if fontsize[chrcode]<>fontdsize[chrcode]then begin print(888);
printscaled(fontsize[chrcode]);print(425);end;end;
{:1305}{1307:}115:case chrcode of 0:printesc(275);1:printesc(276);
2:printesc(277);others:printesc(1442)end;
{:1307}{1317:}66:if chrcode=0 then printesc(1444)else printesc(1443);
{:1317}{1322:}64:if chrcode=0 then printesc(1445)else printesc(1446);
{:1322}{1331:}63:if chrcode=78137 then printesc(1452)else printesc(1453)
;{:1331}{1336:}25:case chrcode of 1:printesc(1455);2:printesc(1456);
3:printesc(1457);{1453:}4:printesc(1589);{:1453}{1462:}5:printesc(1591);
{:1462}{1467:}6:printesc(1594);{:1467}7:printesc(1458);
others:printesc(1454)end;{:1336}{1339:}119:print(1465);
129,130,131,132:begin n:=cmd-129;
if mem[mem[chrcode].hh.rh].hh.lh=917505 then n:=n+4;
if odd(n div 4)then printesc(1388);if odd(n)then printesc(1374);
if odd(n div 2)then printesc(1375);if n>0 then printchar(32);
print(1466);end;133:printesc(1467);
{:1339}{1390:}65:case chrcode of 0:printesc(1502);1:printesc(684);
2:printesc(1503);3:printesc(1504);5:printesc(1505);6:printesc(1506);
8:printesc(1508);9:printesc(1509);10:printesc(1510);7:printesc(1507);
others:print(1511)end;{:1390}{1683:}91:printesc(458);
{:1683}{1689:}116:begin if(chrcode mod 2)=0 then printesc(1679)else
printesc(1680);if chrcode<2 then print(1681)else print(1682);end;
117:begin if chrcode=0 then printesc(1683)else if chrcode=1 then
printesc(1684)else printesc(1685);print(1686);end;
{:1689}{1695:}79:if(chrcode>0)then printesc(1692)else printesc(1691);
90:printesc(1693);{:1695}{1700:}89:case chrcode of 1:printesc(1696);
2:printesc(1697);end;{:1700}others:print(656)end;end;
{:328}ifdef('STAT')procedure showeqtb(n:halfword);
begin if n<1 then printchar(63)else if(n<49925)or((n>116261)and(n<=
eqtbtop))then{248:}begin sprintcs(n);printchar(61);
printcmdchr(eqtb[n].hh.b0,eqtb[n].hh.rh);
if eqtb[n].hh.b0>=129 then begin printchar(58);
showtokenlist(mem[eqtb[n].hh.rh].hh.rh,-1073741823,32);end;
end{:248}else if n<50458 then{254:}if n<49946 then begin printskipparam(
n-49925);printchar(61);
if n<49942 then printspec(eqtb[n].hh.rh,425)else printspec(eqtb[n].hh.rh
,348);end else if n<50202 then begin printesc(423);printint(n-49946);
printchar(61);printspec(eqtb[n].hh.rh,425);end else begin printesc(424);
printint(n-50202);printchar(61);printspec(eqtb[n].hh.rh,348);
end{:254}else if n<114361 then{258:}if(n=50458)or((n>=50725)and(n<50729)
)then begin printcmdchr(97,n);printchar(61);
if eqtb[n].hh.rh=-1073741823 then printchar(48)else if n>50458 then
begin printint(mem[eqtb[n].hh.rh+1].int);printchar(32);
printint(mem[eqtb[n].hh.rh+2].int);
if mem[eqtb[n].hh.rh+1].int>1 then printesc(436);
end else printint(mem[eqtb[50458].hh.rh].hh.lh);
end else if n<50469 then begin printcmdchr(82,n);printchar(61);
if eqtb[n].hh.rh<>-1073741823 then showtokenlist(mem[eqtb[n].hh.rh].hh.
rh,-1073741823,32);end else if n<50729 then begin printesc(435);
printint(n-50469);printchar(61);
if eqtb[n].hh.rh<>-1073741823 then showtokenlist(mem[eqtb[n].hh.rh].hh.
rh,-1073741823,32);end else if n<50985 then begin printesc(437);
printint(n-50729);printchar(61);
if eqtb[n].hh.rh=-1073741823 then print(438)else begin depththreshold:=0
;breadthmax:=1;shownodelist(eqtb[n].hh.rh);end;
end else if n<51759 then{259:}begin if n=50985 then print(439)else if n<
51242 then begin printesc(440);printint(n-50986);
end else if n<51498 then begin printesc(441);printint(n-51242);
end else begin printesc(442);printint(n-51498);end;printchar(61);
printesc(hash[40923+eqtb[n].hh.rh].rh);
end{:259}else{260:}if n<113849 then begin if n<63663 then begin printesc
(443);printint(n-51759);end else if n<64175 then begin printesc(444);
printint(n-63663);end else if n<76079 then begin printesc(445);
printint(n-64175);end else if n<77103 then begin print(446);
printint(n-76079);print(447);case eqtb[n].hh.b0 of 0:print(448);
1:print(449);2:print(450);3:print(451);4:print(452);end;print(453);
end else if n<78127 then begin print(454);printint(n-77103);print(447);
case eqtb[n].hh.b0 of 0:print(455);1:print(456);2:print(457);
3:print(452);end;print(453);
end else if n<78137 then begin printesc(458);printint(n-78127);
end else if n<90041 then begin printesc(459);printint(n-78137);
end else if n<101945 then begin printesc(460);printint(n-90041);
end else begin printesc(461);printint(n-101945);end;printchar(61);
printint(eqtb[n].hh.rh);end else begin printesc(462);printint(n-113849);
printchar(61);printint(eqtb[n].hh.rh);
end{:260}{:258}else if n<114957 then{267:}begin if n<114445 then
printparam(n-114361)else if n<114701 then begin printesc(533);
printint(n-114445);end else begin printesc(534);printint(n-114701);end;
printchar(61);printint(eqtb[n].int);
end{:267}else if n<115238 then{276:}begin if n<114982 then
printlengthparam(n-114957)else begin printesc(561);printint(n-114982);
end;printchar(61);printscaled(eqtb[n].int);print(425);
end{:276}else if n<=116261 then begin print(454);printint(n-115238);
print(562);printint(eqtb[n].int);end else printchar(63);end;
endif('STAT'){:277}{285:}function idlookup(j,l:integer):halfword;
label 40;var h:integer;d:integer;p:halfword;k:halfword;
begin{287:}h:=buffer[j];for k:=j+1 to j+l-1 do begin h:=h+h+buffer[k];
while h>=8501 do h:=h-8501;end{:287};p:=h+23810;
while true do begin if hash[p].rh>0 then if(strstart[hash[p].rh+1]-
strstart[hash[p].rh])=l then if streqbuf(hash[p].rh,j)then goto 40;
if hash[p].lh=0 then begin if nonewcontrolsequence then p:=49924 else
{286:}begin if hash[p].rh>0 then begin if hashhigh<hashextra then begin
incr(hashhigh);hash[p].lh:=hashhigh+116261;p:=hashhigh+116261;
end else begin repeat if(hashused=23810)then overflow(566,15000+
hashextra);decr(hashused);until hash[hashused].rh=0;
hash[p].lh:=hashused;p:=hashused;end;end;
begin if poolptr+l>poolsize then overflow(260,poolsize-initpoolptr);end;
d:=(poolptr-strstart[strptr]);
while poolptr>strstart[strptr]do begin decr(poolptr);
strpool[poolptr+l]:=strpool[poolptr];end;
for k:=j to j+l-1 do begin strpool[poolptr]:=buffer2[k]*256+buffer[k];
incr(poolptr);end;hash[p].rh:=makestring;poolptr:=poolptr+d;
ifdef('STAT')incr(cscount);endif('STAT')end{:286};goto 40;end;
p:=hash[p].lh;end;40:idlookup:=p;end;
{:285}{288:}function primlookup(s:strnumber):halfword;label 40;
var h:integer;p:halfword;k:halfword;j,l:integer;
begin if s<=255 then begin if s<0 then begin p:=0;goto 40;
end else p:=(s mod 1777)+1;l:=1 end else begin j:=strstart[s];
if s=strptr then l:=(poolptr-strstart[strptr])else l:=(strstart[s+1]-
strstart[s]);{290:}h:=strpool[j];
for k:=j+1 to j+l-1 do begin h:=h+h+strpool[k];
while h>=1777 do h:=h-1777;end{:290};p:=h+1;end;
while true do begin if prim[p].rh>256 then begin if(strstart[prim[p].rh
+0]-strstart[prim[p].rh-1])=l then if streqstr(prim[p].rh-1,s)then goto
40;end else if prim[p].rh=1+s then goto 40;
if prim[p].lh=0 then begin if nonewcontrolsequence then p:=0 else{289:}
begin if prim[p].rh>0 then begin repeat if(primused=1)then overflow(567,
2100);decr(primused);until prim[primused].rh=0;prim[p].lh:=primused;
p:=primused;end;prim[p].rh:=s+1;end{:289};goto 40;end;p:=prim[p].lh;end;
40:primlookup:=p;end;
{:288}{293:}ifdef('INITEX')procedure primitive(s:strnumber;
c:quarterword;o:halfword);var k:poolpointer;primval:integer;
j:0..bufsize;l:smallnumber;begin if s<256 then begin curval:=s+11905;
primval:=primlookup(s);end else begin k:=strstart[s];l:=strstart[s+1]-k;
if first+l>bufsize+1 then overflow(259,bufsize);
for j:=0 to l-1 do begin buffer[first+j]:=Lo(strpool[k+j]);
buffer2[first+j]:=Hi(strpool[k+j]);end;curval:=idlookup(first,l);
begin decr(strptr);poolptr:=strstart[strptr];end;hash[curval].rh:=s;
primval:=primlookup(s);end;eqtb[curval].hh.b1:=1;eqtb[curval].hh.b0:=c;
eqtb[curval].hh.rh:=o;eqtb[38822+primval].hh.b1:=1;
eqtb[38822+primval].hh.b0:=c;eqtb[38822+primval].hh.rh:=o;end;
endif('INITEX'){:293}{298:}{314:}ifdef('STAT')procedure restoretrace(p:
halfword;s:strnumber);begin begindiagnostic;printchar(123);print(s);
printchar(32);showeqtb(p);printchar(125);enddiagnostic(false);end;
endif('STAT'){:314}{1438:}procedure printgroup(e:boolean);label 10;
begin case curgroup of 0:begin print(1563);goto 10;end;
1,14:begin if curgroup=14 then print(1564);print(1565);end;
2,3:begin if curgroup=3 then print(1566);print(1233);end;4:print(1136);
5:print(1232);6,7:begin if curgroup=7 then print(1567);print(1568);end;
8:print(426);10:print(1569);11:print(341);12:print(611);
9,13,15,16:begin print(356);
if curgroup=13 then print(1570)else if curgroup=15 then print(1571)else
if curgroup=16 then print(1572);end;end;print(1573);printint(curlevel);
printchar(41);
if savestack[saveptr-1].int<>0 then begin if e then print(388)else print
(1574);printint(savestack[saveptr-1].int);end;10:end;
{:1438}{1439:}ifdef('STAT')procedure grouptrace(e:boolean);
begin begindiagnostic;printchar(123);
if e then print(1575)else print(1576);printgroup(e);printchar(125);
enddiagnostic(false);end;
endif('STAT'){:1439}{1537:}function pseudoinput:boolean;var p:halfword;
sz:integer;w:fourquarters;r:halfword;begin last:=first;
p:=mem[pseudofiles].hh.lh;
if p=-1073741823 then pseudoinput:=false else begin mem[pseudofiles].hh.
lh:=mem[p].hh.rh;sz:=mem[p].hh.lh;
if 4*sz-3>=bufsize-last then{36:}begin curinput.locfield:=first;
curinput.limitfield:=last-1;overflow(259,bufsize);end{:36};last:=first;
for r:=p+1 to p+sz-1 do begin w:=mem[r].qqqq;buffer[last]:=w.b0 mod 256;
buffer[last+1]:=w.b1 mod 256;buffer[last+2]:=w.b2 mod 256;
buffer[last+3]:=w.b3 mod 256;buffer2[last]:=0;buffer2[last+1]:=0;
buffer2[last+2]:=0;buffer2[last+3]:=0;last:=last+4;end;
if last>=maxbufstack then maxbufstack:=last+1;
while(last>first)and(buffer[last-1]=32)do decr(last);freenode(p,sz);
pseudoinput:=true;end;end;{:1537}{1538:}procedure pseudoclose;
var p,q:halfword;begin p:=mem[pseudofiles].hh.rh;
q:=mem[pseudofiles].hh.lh;begin mem[pseudofiles].hh.rh:=avail;
avail:=pseudofiles;ifdef('STAT')decr(dynused);endif('STAT')end;
pseudofiles:=p;while q<>-1073741823 do begin p:=q;q:=mem[p].hh.rh;
freenode(p,mem[p].hh.lh);end;end;{:1538}{1555:}procedure groupwarning;
var i:0..maxinopen;w:boolean;begin baseptr:=inputptr;
inputstack[baseptr]:=curinput;i:=inopen;w:=false;
while(grpstack[i]=curboundary)and(i>0)do begin{1556:}if eqtb[114434].int
>0 then begin while(inputstack[baseptr].statefield=0)or(inputstack[
baseptr].indexfield>i)do decr(baseptr);
if inputstack[baseptr].namefield>17 then w:=true;end{:1556};
grpstack[i]:=savestack[saveptr].hh.rh;decr(i);end;
if w then begin printnl(1623);printgroup(true);print(1624);println;
if eqtb[114434].int>1 then showcontext;if history=0 then history:=1;end;
end;{:1555}{1557:}procedure ifwarning;var i:0..maxinopen;w:boolean;
begin baseptr:=inputptr;inputstack[baseptr]:=curinput;i:=inopen;
w:=false;
while ifstack[i]=condptr do begin{1556:}if eqtb[114434].int>0 then begin
while(inputstack[baseptr].statefield=0)or(inputstack[baseptr].indexfield
>i)do decr(baseptr);if inputstack[baseptr].namefield>17 then w:=true;
end{:1556};ifstack[i]:=mem[condptr].hh.rh;decr(i);end;
if w then begin printnl(1623);printcmdchr(123,curif);
if ifline<>0 then begin print(1595);printint(ifline);end;print(1624);
println;if eqtb[114434].int>1 then showcontext;
if history=0 then history:=1;end;end;
{:1557}{1558:}procedure filewarning;var p:halfword;l:quarterword;
c:quarterword;i:integer;begin p:=saveptr;l:=curlevel;c:=curgroup;
saveptr:=curboundary;
while grpstack[inopen]<>saveptr do begin decr(curlevel);printnl(1625);
printgroup(true);print(1626);curgroup:=savestack[saveptr].hh.b1;
saveptr:=savestack[saveptr].hh.rh end;saveptr:=p;curlevel:=l;
curgroup:=c;p:=condptr;l:=iflimit;c:=curif;i:=ifline;
while ifstack[inopen]<>condptr do begin printnl(1625);
printcmdchr(123,curif);if iflimit=2 then printesc(934);
if ifline<>0 then begin print(1595);printint(ifline);end;print(1626);
ifline:=mem[condptr+1].int;curif:=mem[condptr].hh.b1;
iflimit:=mem[condptr].hh.b0;condptr:=mem[condptr].hh.rh;end;condptr:=p;
iflimit:=l;curif:=c;ifline:=i;println;
if eqtb[114434].int>1 then showcontext;if history=0 then history:=1;end;
{:1558}{1602:}procedure deletesaref(q:halfword);label 10;var p:halfword;
i:smallnumber;s:smallnumber;begin decr(mem[q+1].hh.lh);
if mem[q+1].hh.lh<>-1073741823 then goto 10;
if mem[q].hh.b0<32 then if mem[q+2].int=0 then s:=3 else goto 10 else
begin if mem[q].hh.b0<64 then if mem[q+1].hh.rh=membot then
deleteglueref(membot)else goto 10 else if mem[q+1].hh.rh<>-1073741823
then goto 10;s:=2;end;repeat i:=mem[q].hh.b0 mod 16;p:=q;
q:=mem[p].hh.rh;freenode(p,s);
if q=-1073741823 then begin saroot[i]:=-1073741823;goto 10;end;
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=-1073741823 else mem[q+(i
div 2)+1].hh.lh:=-1073741823;decr(mem[q].hh.b1);end;s:=9;
until mem[q].hh.b1>0;10:end;
{:1602}{1604:}ifdef('STAT')procedure showsa(p:halfword;s:strnumber);
var t:smallnumber;begin begindiagnostic;printchar(123);print(s);
printchar(32);
if p=-1073741823 then printchar(63)else begin t:=(mem[p].hh.b0 div 16);
if t<4 then printcmdchr(104,p)else if t=4 then begin printesc(437);
printsanum(p);end else if t=5 then printcmdchr(81,p)else printchar(63);
printchar(61);
if t=0 then printint(mem[p+2].int)else if t=1 then begin printscaled(mem
[p+2].int);print(425);end else begin p:=mem[p+1].hh.rh;
if t=2 then printspec(p,425)else if t=3 then printspec(p,348)else if t=4
then if p=-1073741823 then print(438)else begin depththreshold:=0;
breadthmax:=1;shownodelist(p);
end else if t=5 then begin if p<>-1073741823 then showtokenlist(mem[p].
hh.rh,-1073741823,32);end else printchar(63);end;end;printchar(125);
enddiagnostic(false);end;
endif('STAT'){:1604}{1618:}procedure sasave(p:halfword);var q:halfword;
i:quarterword;
begin if curlevel<>salevel then begin if saveptr>maxsavestack then begin
maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(626,savesize);end;
savestack[saveptr].hh.b0:=4;savestack[saveptr].hh.b1:=salevel;
savestack[saveptr].hh.rh:=sachain;incr(saveptr);sachain:=-1073741823;
salevel:=curlevel;end;i:=mem[p].hh.b0;
if i<32 then begin if mem[p+2].int=0 then begin q:=getnode(2);i:=96;
end else begin q:=getnode(3);mem[q+2].int:=mem[p+2].int;end;
mem[q+1].hh.rh:=-1073741823;end else begin q:=getnode(2);
mem[q+1].hh.rh:=mem[p+1].hh.rh;end;mem[q+1].hh.lh:=p;mem[q].hh.b0:=i;
mem[q].hh.b1:=mem[p].hh.b1;mem[q].hh.rh:=sachain;sachain:=q;
incr(mem[p+1].hh.lh);end;{:1618}{1619:}procedure sadestroy(p:halfword);
begin if mem[p].hh.b0<64 then deleteglueref(mem[p+1].hh.rh)else if mem[p
+1].hh.rh<>-1073741823 then if mem[p].hh.b0<80 then flushnodelist(mem[p
+1].hh.rh)else deletetokenref(mem[p+1].hh.rh);end;
{:1619}{1620:}procedure sadef(p:halfword;e:halfword);
begin incr(mem[p+1].hh.lh);
if mem[p+1].hh.rh=e then begin ifdef('STAT')if eqtb[114430].int>0 then
showsa(p,628);endif('STAT')sadestroy(p);
end else begin ifdef('STAT')if eqtb[114430].int>0 then showsa(p,629);
endif('STAT')if mem[p].hh.b1=curlevel then sadestroy(p)else sasave(p);
mem[p].hh.b1:=curlevel;mem[p+1].hh.rh:=e;
ifdef('STAT')if eqtb[114430].int>0 then showsa(p,630);endif('STAT')end;
deletesaref(p);end;procedure sawdef(p:halfword;w:integer);
begin incr(mem[p+1].hh.lh);
if mem[p+2].int=w then begin ifdef('STAT')if eqtb[114430].int>0 then
showsa(p,628);
endif('STAT')end else begin ifdef('STAT')if eqtb[114430].int>0 then
showsa(p,629);endif('STAT')if mem[p].hh.b1<>curlevel then sasave(p);
mem[p].hh.b1:=curlevel;mem[p+2].int:=w;
ifdef('STAT')if eqtb[114430].int>0 then showsa(p,630);endif('STAT')end;
deletesaref(p);end;{:1620}{1621:}procedure gsadef(p:halfword;
e:halfword);begin incr(mem[p+1].hh.lh);
ifdef('STAT')if eqtb[114430].int>0 then showsa(p,631);
endif('STAT')sadestroy(p);mem[p].hh.b1:=1;mem[p+1].hh.rh:=e;
ifdef('STAT')if eqtb[114430].int>0 then showsa(p,630);
endif('STAT')deletesaref(p);end;procedure gsawdef(p:halfword;w:integer);
begin incr(mem[p+1].hh.lh);
ifdef('STAT')if eqtb[114430].int>0 then showsa(p,631);
endif('STAT')mem[p].hh.b1:=1;mem[p+2].int:=w;
ifdef('STAT')if eqtb[114430].int>0 then showsa(p,630);
endif('STAT')deletesaref(p);end;{:1621}{1622:}procedure sarestore;
var p:halfword;begin repeat p:=mem[sachain+1].hh.lh;
if mem[p].hh.b1=1 then begin if mem[p].hh.b0>=32 then sadestroy(sachain)
;ifdef('STAT')if eqtb[114398].int>0 then showsa(p,633);
endif('STAT')end else begin if mem[p].hh.b0<32 then if mem[sachain].hh.
b0<32 then mem[p+2].int:=mem[sachain+2].int else mem[p+2].int:=0 else
begin sadestroy(p);mem[p+1].hh.rh:=mem[sachain+1].hh.rh;end;
mem[p].hh.b1:=mem[sachain].hh.b1;
ifdef('STAT')if eqtb[114398].int>0 then showsa(p,634);endif('STAT')end;
deletesaref(p);p:=sachain;sachain:=mem[p].hh.rh;
if mem[p].hh.b0<32 then freenode(p,3)else freenode(p,2);
until sachain=-1073741823;end;
{:1622}{:298}{304:}procedure newsavelevel(c:groupcode);
begin if saveptr>maxsavestack then begin maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(626,savesize);end;
if(eTeXmode=1)then begin savestack[saveptr+0].int:=line;incr(saveptr);
end;savestack[saveptr].hh.b0:=3;savestack[saveptr].hh.b1:=curgroup;
savestack[saveptr].hh.rh:=curboundary;
if curlevel=65535 then overflow(627,65535);curboundary:=saveptr;
curgroup:=c;ifdef('STAT')if eqtb[114431].int>0 then grouptrace(false);
endif('STAT')incr(curlevel);incr(saveptr);end;
{:304}{305:}procedure eqdestroy(w:memoryword);var q:halfword;
begin case w.hh.b0 of 129,130,131,132:deletetokenref(w.hh.rh);
135:deleteglueref(w.hh.rh);136:begin q:=w.hh.rh;
if q<>-1073741823 then freenode(q,mem[q].hh.lh+mem[q].hh.lh+1);end;
137:flushnodelist(w.hh.rh);
{1615:}81,104:if(w.hh.rh<membot)or(w.hh.rh>membot+23)then deletesaref(w.
hh.rh);{:1615}others:end;end;{:305}{306:}procedure eqsave(p:halfword;
l:quarterword);
begin if saveptr>maxsavestack then begin maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(626,savesize);end;
if l=0 then savestack[saveptr].hh.b0:=1 else begin savestack[saveptr]:=
eqtb[p];incr(saveptr);savestack[saveptr].hh.b0:=0;end;
savestack[saveptr].hh.b1:=l;savestack[saveptr].hh.rh:=p;incr(saveptr);
end;{:306}{307:}procedure eqdefine(p:halfword;t:quarterword;e:halfword);
label 10;
begin if(eTeXmode=1)and(eqtb[p].hh.b0=t)and(eqtb[p].hh.rh=e)then begin
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,628);
endif('STAT')eqdestroy(eqtb[p]);goto 10;end;
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,629);
endif('STAT')if eqtb[p].hh.b1=curlevel then eqdestroy(eqtb[p])else if
curlevel>1 then eqsave(p,eqtb[p].hh.b1);eqtb[p].hh.b1:=curlevel;
eqtb[p].hh.b0:=t;eqtb[p].hh.rh:=e;
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,630);
endif('STAT')10:end;{:307}{308:}procedure eqworddefine(p:halfword;
w:integer);label 10;
begin if(eTeXmode=1)and(eqtb[p].int=w)then begin ifdef('STAT')if eqtb[
114430].int>0 then restoretrace(p,628);endif('STAT')goto 10;end;
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,629);
endif('STAT')if xeqlevel[p]<>curlevel then begin eqsave(p,xeqlevel[p]);
xeqlevel[p]:=curlevel;end;eqtb[p].int:=w;
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,630);
endif('STAT')10:end;procedure deleqworddefine(p:halfword;
w,wone:integer);label 10;
begin if(eTeXmode=1)and(eqtb[p].int=w)and(getintone(eqtb[p])=wone)then
begin ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,628);
endif('STAT')goto 10;end;
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,629);
endif('STAT')if xeqlevel[p]<>curlevel then begin eqsave(p,xeqlevel[p]);
xeqlevel[p]:=curlevel;end;eqtb[p].int:=w;setintone(eqtb[p],wone);
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,630);
endif('STAT')10:end;{:308}{309:}procedure geqdefine(p:halfword;
t:quarterword;e:halfword);
begin ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,631);
endif('STAT')begin eqdestroy(eqtb[p]);eqtb[p].hh.b1:=1;eqtb[p].hh.b0:=t;
eqtb[p].hh.rh:=e;end;
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,630);
endif('STAT')end;procedure geqworddefine(p:halfword;w:integer);
begin ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,631);
endif('STAT')begin eqtb[p].int:=w;xeqlevel[p]:=1;end;
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,630);
endif('STAT')end;procedure delgeqworddefine(p:halfword;w,wone:integer);
begin ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,631);
endif('STAT')begin eqtb[p].int:=w;setintone(eqtb[p],wone);
xeqlevel[p]:=1;end;
ifdef('STAT')if eqtb[114430].int>0 then restoretrace(p,630);
endif('STAT')end;{:309}{310:}procedure saveforafter(t:halfword);
begin if curlevel>1 then begin if saveptr>maxsavestack then begin
maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(626,savesize);end;
savestack[saveptr].hh.b0:=2;savestack[saveptr].hh.b1:=0;
savestack[saveptr].hh.rh:=t;incr(saveptr);end;end;
{:310}{311:}procedure backinput;forward;procedure unsave;label 30;
var p:halfword;l:quarterword;t:halfword;a:boolean;begin a:=false;
if curlevel>1 then begin decr(curlevel);
{312:}while true do begin decr(saveptr);
if savestack[saveptr].hh.b0=3 then goto 30;p:=savestack[saveptr].hh.rh;
if savestack[saveptr].hh.b0=2 then{356:}begin t:=curtok;curtok:=p;
if a then begin p:=getavail;mem[p].hh.lh:=curtok;
mem[p].hh.rh:=curinput.locfield;curinput.locfield:=p;
curinput.startfield:=p;
if curtok<196608 then if curtok<131072 then decr(alignstate)else incr(
alignstate);end else begin backinput;a:=(eTeXmode=1);end;curtok:=t;
end{:356}else if savestack[saveptr].hh.b0=4 then begin sarestore;
sachain:=p;salevel:=savestack[saveptr].hh.b1;
end else begin if savestack[saveptr].hh.b0=0 then begin l:=savestack[
saveptr].hh.b1;decr(saveptr);end else savestack[saveptr]:=eqtb[49924];
{313:}if(p<114361)or(p>116261)then if eqtb[p].hh.b1=1 then begin
eqdestroy(savestack[saveptr]);
ifdef('STAT')if eqtb[114398].int>0 then restoretrace(p,633);
endif('STAT')end else begin eqdestroy(eqtb[p]);
eqtb[p]:=savestack[saveptr];
ifdef('STAT')if eqtb[114398].int>0 then restoretrace(p,634);
endif('STAT')end else if xeqlevel[p]<>1 then begin eqtb[p]:=savestack[
saveptr];xeqlevel[p]:=l;
ifdef('STAT')if eqtb[114398].int>0 then restoretrace(p,634);
endif('STAT')end else begin ifdef('STAT')if eqtb[114398].int>0 then
restoretrace(p,633);endif('STAT')end{:313};end;end;
30:ifdef('STAT')if eqtb[114431].int>0 then grouptrace(true);
endif('STAT')if grpstack[inopen]=curboundary then groupwarning;
curgroup:=savestack[saveptr].hh.b1;
curboundary:=savestack[saveptr].hh.rh;
if(eTeXmode=1)then decr(saveptr){:312};end else confusion(632);end;
{:311}{318:}procedure preparemag;
begin if(magset>0)and(eqtb[114378].int<>magset)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(636);
end;printint(eqtb[114378].int);print(637);printnl(638);begin helpptr:=2;
helpline[1]:=639;helpline[0]:=640;end;interror(magset);
geqworddefine(114378,magset);end;
if(eqtb[114378].int<=0)or(eqtb[114378].int>32768)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(641);
end;begin helpptr:=1;helpline[0]:=642;end;interror(eqtb[114378].int);
geqworddefine(114378,1000);end;magset:=eqtb[114378].int;end;
{:318}{325:}procedure tokenshow(p:halfword);
begin if p<>-1073741823 then showtokenlist(mem[p].hh.rh,-1073741823,
10000000);end;{:325}{326:}procedure printmeaning;
begin printcmdchr(curcmd,curchr);
if curcmd>=129 then begin printchar(58);println;tokenshow(curchr);
end else if(curcmd=128)and(curchr<5)then begin printchar(58);println;
tokenshow(curmark[curchr]);end;end;{:326}{329:}procedure showcurcmdchr;
var n:integer;l:integer;p:halfword;begin begindiagnostic;printnl(123);
if curlist.modefield<>shownmode then begin printmode(curlist.modefield);
print(657);shownmode:=curlist.modefield;end;printcmdchr(curcmd,curchr);
if eqtb[114432].int>0 then if curcmd>=123 then if curcmd<=124 then begin
print(657);if curcmd=124 then begin printcmdchr(123,curif);
printchar(32);n:=0;l:=ifline;end else begin n:=1;l:=line;end;p:=condptr;
while p<>-1073741823 do begin incr(n);p:=mem[p].hh.rh;end;print(658);
printint(n);printchar(41);if l<>0 then begin print(1595);printint(l);
end;end;printchar(125);enddiagnostic(false);end;
{:329}{341:}procedure showcontext;label 30,31;var oldsetting:0..21;
s:halfword;nn:integer;bottomline:boolean;{345:}i:0..bufsize;
j:0..bufsize;l:0..halferrorline;m:integer;n:0..errorline;p:integer;
q:integer;{:345}begin baseptr:=inputptr;inputstack[baseptr]:=curinput;
nn:=-1;bottomline:=false;
while true do begin curinput:=inputstack[baseptr];
if(curinput.statefield<>0)then if(curinput.namefield>19)or(baseptr=0)
then bottomline:=true;
if(baseptr=inputptr)or bottomline or(nn<eqtb[114416].int)then{342:}begin
if(baseptr=inputptr)or(curinput.statefield<>0)or(curinput.indexfield<>3)
or(curinput.locfield<>-1073741823)then begin tally:=0;
oldsetting:=selector;
if curinput.statefield<>0 then begin{343:}if curinput.namefield<=17 then
if(curinput.namefield=0)then if baseptr=0 then printnl(663)else printnl(
664)else begin printnl(665);
if curinput.namefield=17 then printchar(42)else printint(curinput.
namefield-1);printchar(62);end else begin printnl(666);
if curinput.indexfield=inopen then printint(line)else printint(linestack
[curinput.indexfield+1]);end;printchar(32){:343};{348:}begin l:=tally;
tally:=0;selector:=20;kcodepos:=0;trickcount:=1000000;end;
if buffer[curinput.limitfield]=eqtb[114410].int then j:=curinput.
limitfield else j:=curinput.limitfield+1;
if j>0 then begin i:=curinput.startfield;
if(curinput.locfield<=j-1)and(curinput.startfield<=curinput.locfield)
then begin for i:=curinput.startfield to curinput.locfield-1 do if
buffer2[i]>0 then printchar(256*buffer2[i]+buffer[i])else print(buffer[i
]);begin firstcount:=tally;kcp:=trickbuf2[(firstcount-1)mod errorline];
if(firstcount>0)and(kcp>0)then firstcount:=firstcount+nrestmultichr(kcp)
;trickcount:=firstcount+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;
printunreadbufferwithptenc(curinput.locfield,j);
end else for i:=curinput.startfield to j-1 do if buffer2[i]>0 then
printchar(256*buffer2[i]+buffer[i])else print(buffer[i]);end{:348};
end else begin{344:}case curinput.indexfield of 0:printnl(667);
1,2:printnl(668);
3:if curinput.locfield=-1073741823 then printnl(669)else printnl(670);
4:printnl(671);5:begin println;printcs(curinput.namefield);end;
6:printnl(672);7:printnl(673);8:printnl(674);9:printnl(675);
10:printnl(676);11:printnl(677);12:printnl(678);13:printnl(679);
14:printnl(680);15:printnl(681);16:printnl(682);
others:printnl(63)end{:344};{349:}begin l:=tally;tally:=0;selector:=20;
kcodepos:=0;trickcount:=1000000;end;
if curinput.indexfield<5 then begin if(curinput.indexfield=3)and(
curinput.locfield<>-1073741823)then begin if(mem[curinput.startfield].hh
.rh=-1073741823)and(checkkanji(mem[curinput.startfield].hh.lh))then
begin curinput:=inputstack[baseptr-1];s:=getavail;
mem[s].hh.lh:=ktokentochr(mem[curinput.locfield].hh.lh);
curinput:=inputstack[baseptr];mem[curinput.startfield].hh.rh:=s;
showtokenlist(curinput.startfield,curinput.locfield,100000);
begin mem[s].hh.rh:=avail;avail:=s;ifdef('STAT')decr(dynused);
endif('STAT')end;mem[curinput.startfield].hh.rh:=-1073741823;goto 31;
end;end;showtokenlist(curinput.startfield,curinput.locfield,100000);
end else showtokenlist(mem[curinput.startfield].hh.rh,curinput.locfield,
100000);31:{:349};end;selector:=oldsetting;
{347:}if trickcount=1000000 then begin firstcount:=tally;
kcp:=trickbuf2[(firstcount-1)mod errorline];
if(firstcount>0)and(kcp>0)then firstcount:=firstcount+nrestmultichr(kcp)
;trickcount:=firstcount+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;
if tally<trickcount then m:=tally-firstcount else m:=trickcount-
firstcount;if l+firstcount<=halferrorline then begin p:=0;
n:=l+firstcount;end else begin print(278);
p:=l+firstcount-halferrorline+3;n:=halferrorline;end;
kcp:=trickbuf2[p mod errorline];
if(kcp mod 8)>1 then begin p:=p+nrestmultichr(kcp)+1;
n:=n-nrestmultichr(kcp)-1;end;
for q:=p to firstcount-1 do printchar(trickbuf[q mod errorline]);
println;for q:=1 to n do printchar(32);
if m+n<=errorline then p:=firstcount+m else p:=firstcount+(errorline-n-3
);kcp:=trickbuf2[(p-1)mod errorline];
if((kcp mod 8)>0)and(nrestmultichr(kcp)>0)then p:=p-(kcp mod 8);
for q:=firstcount to p-1 do printchar(trickbuf[q mod errorline]);
if m+n>errorline then print(278){:347};incr(nn);end;
end{:342}else if nn=eqtb[114416].int then begin printnl(278);incr(nn);
end;if bottomline then goto 30;decr(baseptr);end;
30:curinput:=inputstack[inputptr];end;
{:341}{353:}procedure begintokenlist(p:halfword;t:quarterword);
begin begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(683,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.statefield:=0;curinput.startfield:=p;curinput.indexfield:=t;
if t>=5 then begin incr(mem[p].hh.lh);
if t=5 then curinput.limitfield:=paramptr else begin curinput.locfield:=
mem[p].hh.rh;if eqtb[114391].int>1 then begin begindiagnostic;
printnl(349);case t of 14:printesc(366);16:printesc(684);
others:printcmdchr(82,t+50453)end;print(644);tokenshow(p);
enddiagnostic(false);end;end;end else curinput.locfield:=p;end;
{:353}{354:}procedure endtokenlist;
begin if curinput.indexfield>=3 then begin if curinput.indexfield<=4
then flushlist(curinput.startfield)else begin deletetokenref(curinput.
startfield);
if curinput.indexfield=5 then while paramptr>curinput.limitfield do
begin decr(paramptr);flushlist(paramstack[paramptr]);
end else if(curinput.indexfield=6)and(not outputcanend)then fatalerror(
685);end;
end else if curinput.indexfield=1 then if alignstate>500000 then
alignstate:=0 else fatalerror(686);begin decr(inputptr);
curinput:=inputstack[inputptr];end;
begin if interrupt<>0 then pauseforinstructions;end;end;
{:354}{355:}procedure backinput;var p:halfword;
begin while(curinput.locfield=-1073741823)and(curinput.indexfield<>2)and
(curinput.indexfield<>6)do endtokenlist;p:=getavail;
mem[p].hh.lh:=curtok;
if curtok<196608 then if curtok<131072 then decr(alignstate)else incr(
alignstate);
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(683,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.statefield:=0;curinput.startfield:=p;curinput.indexfield:=3;
curinput.locfield:=p;end;{:355}{357:}procedure backerror;
begin OKtointerrupt:=false;backinput;OKtointerrupt:=true;error;end;
procedure inserror;begin OKtointerrupt:=false;backinput;
curinput.indexfield:=4;OKtointerrupt:=true;error;end;
{:357}{358:}procedure beginfilereading;
begin if inopen=maxinopen then overflow(687,maxinopen);
if first=bufsize then overflow(259,bufsize);incr(inopen);
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(683,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.indexfield:=inopen;sourcefilenamestack[curinput.indexfield]:=0;
fullsourcefilenamestack[curinput.indexfield]:=0;
eofseen[curinput.indexfield]:=false;
grpstack[curinput.indexfield]:=curboundary;
ifstack[curinput.indexfield]:=condptr;
linestack[curinput.indexfield]:=line;curinput.startfield:=first;
curinput.statefield:=1;curinput.namefield:=0;
{1758:}curinput.synctextagfield:=0;{:1758};end;
{:358}{359:}procedure endfilereading;begin first:=curinput.startfield;
line:=linestack[curinput.indexfield];
if(curinput.namefield=18)or(curinput.namefield=19)then pseudoclose else
if curinput.namefield>17 then aclose(inputfile[curinput.indexfield]);
begin decr(inputptr);curinput:=inputstack[inputptr];end;decr(inopen);
end;{:359}{360:}procedure clearforerrorprompt;
begin while(curinput.statefield<>0)and(curinput.namefield=0)and(inputptr
>0)and(curinput.locfield>curinput.limitfield)do endfilereading;println;;
end;{:360}{366:}procedure checkoutervalidity;var p:halfword;q:halfword;
begin if scannerstatus<>0 then begin deletionsallowed:=false;
{367:}if curcs<>0 then begin if(curinput.statefield=0)or(curinput.
namefield<1)or(curinput.namefield>17)then begin p:=getavail;
mem[p].hh.lh:=536870911+curcs;begintokenlist(p,3);end;curcmd:=10;
curchr:=32;end{:367};if scannerstatus>1 then{368:}begin runaway;
if curcs=0 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(695);
end else begin curcs:=0;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(696);
end;end;{369:}p:=getavail;case scannerstatus of 2:begin print(702);
mem[p].hh.lh:=131197;end;3:begin print(703);mem[p].hh.lh:=partoken;
longstate:=131;end;4:begin print(704);mem[p].hh.lh:=131197;q:=p;
p:=getavail;mem[p].hh.rh:=q;mem[p].hh.lh:=536909722;
alignstate:=-1000000;end;5:begin print(705);mem[p].hh.lh:=131197;end;
end;begintokenlist(p,4){:369};print(697);sprintcs(warningindex);
begin helpptr:=4;helpline[3]:=698;helpline[2]:=699;helpline[1]:=700;
helpline[0]:=701;end;error;
end{:368}else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(689);
end;printcmdchr(123,curif);print(690);printint(skipline);
begin helpptr:=3;helpline[2]:=691;helpline[1]:=692;helpline[0]:=693;end;
if curcs<>0 then curcs:=0 else helpline[2]:=694;curtok:=536909725;
inserror;end;deletionsallowed:=true;end;end;
{:366}{370:}procedure firmuptheline;forward;
{:370}{371:}procedure getnext;label 20,25,21,26,40,10;var k:0..bufsize;
t:halfword;cat:0..20;l:0..bufsize;c,cc,cd,ce:ASCIIcode;d:2..7;
begin 20:curcs:=0;
if curinput.statefield<>0 then{373:}begin 25:if curinput.locfield<=
curinput.limitfield then begin curchr:=fromBUFF(ustringcast(buffer),
curinput.limitfield+1,curinput.locfield);
curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
if(multistrlen(ustringcast(buffer),curinput.limitfield+1,curinput.
locfield)>1)and checkkcatcode(curcmd,curchr)then begin if(curcmd=14)then
curcmd:=eqtb[51759+curchr].hh.rh;if(curcmd=15)then curcmd:=18;
for l:=curinput.locfield to curinput.locfield-1+multistrlen(ustringcast(
buffer),curinput.limitfield+1,curinput.locfield)do buffer2[l]:=1;
curinput.locfield:=curinput.locfield+multistrlen(ustringcast(buffer),
curinput.limitfield+1,curinput.locfield)end else begin curchr:=buffer[
curinput.locfield];incr(curinput.locfield);
21:curcmd:=eqtb[51759+curchr].hh.rh;end;
{374:}case curinput.statefield+curcmd of{375:}10,31,52,73,94,53,74,95
{:375}:goto 25;
1,22,43,64,85:{386:}begin if curinput.locfield>curinput.limitfield then
curcs:=23809 else begin k:=curinput.locfield;
curchr:=fromBUFF(ustringcast(buffer),curinput.limitfield+1,k);
cat:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
if(multistrlen(ustringcast(buffer),curinput.limitfield+1,k)>1)and
checkkcatcode(cat,curchr)then begin if(cat=14)or(cat=15)then cat:=18;
for l:=k to k-1+multistrlen(ustringcast(buffer),curinput.limitfield+1,k)
do buffer2[l]:=1;
k:=k+multistrlen(ustringcast(buffer),curinput.limitfield+1,k)end else
begin curchr:=buffer[k];cat:=eqtb[51759+curchr].hh.rh;incr(k);end;
26:if(cat=11)or(cat=19)then curinput.statefield:=43 else if(cat=16)or(
cat=17)then begin if(eqtb[114421].int mod 2)=0 then curinput.statefield
:=64 else curinput.statefield:=43 end else if cat=10 then curinput.
statefield:=43 else if cat=18 then begin if((eqtb[114421].int div 2)mod
2)=0 then curinput.statefield:=22 else curinput.statefield:=1 end else
curinput.statefield:=1;
if cat=18 then begin curcs:=idlookup(curinput.locfield,k-curinput.
locfield);curinput.locfield:=k;goto 40;
end else if((cat=11)or(cat=16)or(cat=17)or(cat=19)or(cat=20))and(k<=
curinput.limitfield)then{388:}begin repeat curchr:=fromBUFF(ustringcast(
buffer),curinput.limitfield+1,k);
cat:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
if(multistrlen(ustringcast(buffer),curinput.limitfield+1,k)>1)and
checkkcatcode(cat,curchr)then begin if(cat=14)then cat:=eqtb[51759+
curchr].hh.rh;if(cat=15)then cat:=18;
for l:=k to k-1+multistrlen(ustringcast(buffer),curinput.limitfield+1,k)
do buffer2[l]:=1;
k:=k+multistrlen(ustringcast(buffer),curinput.limitfield+1,k);
if(cat=16)or(cat=17)then begin if(eqtb[114421].int mod 2)=0 then
curinput.statefield:=64 else curinput.statefield:=43 end else if cat=19
then curinput.statefield:=43;end else begin curchr:=buffer[k];
cat:=eqtb[51759+curchr].hh.rh;incr(k);end;
while(buffer[k]=curchr)and(cat=7)and(k<curinput.limitfield)do begin c:=
buffer[k+1];if c<128 then begin d:=2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if k+2<=curinput.
limitfield then begin cc:=buffer[k+2];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then incr(d);end;
if d>2 then begin if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
end else if c<64 then curchr:=c+64 else curchr:=c-64;
cat:=eqtb[51759+curchr].hh.rh;
if(cat=11)or(cat=7)then begin buffer[k-1]:=curchr;buffer2[k-1]:=0;
curinput.limitfield:=curinput.limitfield-d;first:=first-d;l:=k;
while l<=curinput.limitfield do begin buffer[l]:=buffer[l+d];
buffer2[l]:=buffer2[l+d];incr(l);end;end;end;end;
if cat=11 then curinput.statefield:=43;
until not((cat=11)or(cat=16)or(cat=17)or(cat=19)or(cat=20))or(k>curinput
.limitfield);
if not((cat=11)or(cat=16)or(cat=17)or(cat=19)or(cat=20))then begin if(
buffer2[k-1])then k:=k-multilenbuffchar(curchr)else decr(k);end;
if k>curinput.locfield+1 then begin curcs:=idlookup(curinput.locfield,k-
curinput.locfield);curinput.locfield:=k;goto 40;end;
end{:388}else{387:}begin if buffer[k]=curchr then if cat=7 then if k<
curinput.limitfield then begin c:=buffer[k+1];if c<128 then begin d:=2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if k+2<=curinput.
limitfield then begin cc:=buffer[k+2];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then incr(d);end;
if d>2 then begin if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
buffer[k-1]:=curchr;
end else if c<64 then buffer[k-1]:=c+64 else buffer[k-1]:=c-64;
buffer2[k-1]:=0;curinput.limitfield:=curinput.limitfield-d;
first:=first-d;l:=k;curchr:=buffer[k-1];cat:=eqtb[51759+curchr].hh.rh;
while l<=curinput.limitfield do begin buffer[l]:=buffer[l+d];
buffer2[l]:=buffer2[l+d];incr(l);end;goto 26;end;end;end{:387};
if(cat=16)or(cat=17)or(cat=19)or(cat=20)then begin curcs:=idlookup(
curinput.locfield,k-curinput.locfield);curinput.locfield:=k;goto 40;
end else begin curcs:=11905+buffer[curinput.locfield];
incr(curinput.locfield);end;end;40:curcmd:=eqtb[curcs].hh.b0;
curchr:=eqtb[curcs].hh.rh;
if(eqtb[114441].int=0)and(curcmd>=131)then checkoutervalidity;end{:386};
14,35,56,77,98:{385:}begin curcs:=curchr+1;curcmd:=eqtb[curcs].hh.b0;
curchr:=eqtb[curcs].hh.rh;curinput.statefield:=1;
if(eqtb[114441].int=0)and(curcmd>=131)then checkoutervalidity;end{:385};
8,29,50,71,92:{384:}begin if curchr=buffer[curinput.locfield]then if
curinput.locfield<curinput.limitfield then begin if(isinternalUPTEX)and(
(curinput.locfield+6)<=curinput.limitfield)and(curchr=buffer[curinput.
locfield+1])and(curchr=buffer[curinput.locfield+2])then begin c:=buffer[
curinput.locfield+3];cc:=buffer[curinput.locfield+4];
cd:=buffer[curinput.locfield+5];ce:=buffer[curinput.locfield+6];
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))and(((cc>=48)and(cc<=57))or
((cc>=97)and(cc<=102)))and(((cd>=48)and(cd<=57))or((cd>=97)and(cd<=102))
)and(((ce>=48)and(ce<=57))or((ce>=97)and(ce<=102)))then begin if c<=57
then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
if cd<=57 then curchr:=16*curchr+cd-48 else curchr:=16*curchr+cd-87;
if ce<=57 then curchr:=16*curchr+ce-48 else curchr:=16*curchr+ce-87;
if(curchr<11904)then begin curinput.locfield:=curinput.locfield+7;
goto 21;end;end;end;c:=buffer[curinput.locfield+1];
if c<128 then begin curinput.locfield:=curinput.locfield+2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if curinput.locfield<=
curinput.limitfield then begin cc:=buffer[curinput.locfield];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then begin incr(
curinput.locfield);if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
goto 21;end;end;if c<64 then curchr:=c+64 else curchr:=c-64;goto 21;end;
end;curinput.statefield:=1;end{:384};
16,37,58,79,100:{376:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(706);
end;begin helpptr:=2;helpline[1]:=707;helpline[0]:=708;end;
deletionsallowed:=false;error;deletionsallowed:=true;goto 20;end{:376};
{377:}32,11:{381:}begin curinput.statefield:=43;curchr:=32;end{:381};
6:{380:}begin curinput.locfield:=curinput.limitfield+1;curcmd:=10;
curchr:=32;end{:380};
27:if skipmode then{382:}begin curinput.locfield:=curinput.limitfield+1;
goto 25;
end{:382}else{380:}begin curinput.locfield:=curinput.limitfield+1;
curcmd:=10;curchr:=32;end{:380};
48,69,15,36,57,78,99:{382:}begin curinput.locfield:=curinput.limitfield
+1;goto 25;end{:382};
90:{383:}begin curinput.locfield:=curinput.limitfield+1;curcs:=parloc;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;
if(eqtb[114441].int=0)and(curcmd>=131)then checkoutervalidity;end{:383};
2:incr(alignstate);23:begin incr(alignstate);
if((eqtb[114421].int div 4)mod 2)=1 then curinput.statefield:=1;end;
44,86:begin curinput.statefield:=1;incr(alignstate);end;
65:begin curinput.statefield:=22;incr(alignstate);end;
3:decr(alignstate);24:begin decr(alignstate);
if((eqtb[114421].int div 4)mod 2)=1 then curinput.statefield:=1;end;
45,87:begin curinput.statefield:=1;decr(alignstate);end;
66:begin curinput.statefield:=22;decr(alignstate);end;
46,47,49,51,54,55,67,68,70,72,75,76,88,89,91,93,96,97,25,26,28,30,33,34:
curinput.statefield:=1;
59,60,61,63,80,81,82,84,101,102,103,105,17,18,19,21:curinput.statefield
:=22;62,83,104,41:curinput.statefield:=1;{:377}others:end{:374};
end else begin curinput.statefield:=85;
{392:}if curinput.namefield>17 then{394:}begin incr(line);
first:=curinput.startfield;
if not forceeof then if curinput.namefield<=19 then begin if pseudoinput
then firmuptheline else if(eqtb[50468].hh.rh<>-1073741823)and not
eofseen[curinput.indexfield]then begin curinput.limitfield:=first-1;
eofseen[curinput.indexfield]:=true;begintokenlist(eqtb[50468].hh.rh,15);
goto 20;end else forceeof:=true;
end else begin if inputln(inputfile[curinput.indexfield],true)then
firmuptheline else if(eqtb[50468].hh.rh<>-1073741823)and not eofseen[
curinput.indexfield]then begin curinput.limitfield:=first-1;
eofseen[curinput.indexfield]:=true;begintokenlist(eqtb[50468].hh.rh,15);
goto 20;end else forceeof:=true;end;
if forceeof then begin if eqtb[114434].int>0 then if(grpstack[inopen]<>
curboundary)or(ifstack[inopen]<>condptr)then filewarning;
if curinput.namefield>=19 then begin printchar(41);decr(openparens);
fflush(stdout);end;forceeof:=false;endfilereading;
if eqtb[114441].int=0 then checkoutervalidity;goto 20;end;
if(eqtb[114410].int<0)or(eqtb[114410].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[114410].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end{:394}else begin if not(curinput.namefield=0)then begin curcmd:=0;
curchr:=0;goto 10;end;if inputptr>0 then begin endfilereading;goto 20;
end;if selector<18 then openlogfile;
if interaction>1 then begin if(eqtb[114410].int<0)or(eqtb[114410].int>
255)then incr(curinput.limitfield);
if curinput.limitfield=curinput.startfield then printnl(710);println;
first:=curinput.startfield;begin;print(42);terminput;end;
curinput.limitfield:=last;
if(eqtb[114410].int<0)or(eqtb[114410].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[114410].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end else fatalerror(711);end{:392};
begin if interrupt<>0 then pauseforinstructions;end;goto 25;end;
end{:373}else{389:}if curinput.locfield<>-1073741823 then begin t:=mem[
curinput.locfield].hh.lh;
curinput.locfield:=mem[curinput.locfield].hh.rh;
if t>=536870911 then begin curcs:=t-536870911;curcmd:=eqtb[curcs].hh.b0;
curchr:=eqtb[curcs].hh.rh;
if curcmd>=131 then if curcmd=134 then{390:}begin curcs:=mem[curinput.
locfield].hh.lh-536870911;curinput.locfield:=-1073741823;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;
if curcmd>118 then begin curcmd:=0;curchr:=16777217;end;
end{:390}else begin if(curcs=38818)and(curlist.modefield=0)then
fatalerror(709);if eqtb[114441].int=0 then checkoutervalidity;end;
end else if checkkanji(t)then begin curcmd:=ktokentocmd(t);
curchr:=ktokentochr(t);end else begin curcmd:=t div 65536;
curchr:=t mod 65536;case curcmd of 1:incr(alignstate);
2:decr(alignstate);
5:{391:}begin begintokenlist(paramstack[curinput.limitfield+curchr-1],0)
;goto 20;end{:391};others:end;end;end else begin endtokenlist;goto 20;
end{:389};
{372:}if curcmd<=5 then if curcmd>=4 then if alignstate=0 then{830:}
begin if(scannerstatus=4)or(curalign=-1073741823)then fatalerror(686);
curcmd:=mem[curalign+5].hh.lh;mem[curalign+5].hh.lh:=curchr;
if curcmd=69 then begintokenlist(memtop-10,2)else begintokenlist(mem[
curalign+2].int,2);alignstate:=1000000;goto 20;end{:830}{:372};10:end;
{:371}{395:}procedure firmuptheline;var k:0..bufsize;
begin curinput.limitfield:=last;
if eqtb[114389].int>0 then if interaction>1 then begin;println;
if curinput.startfield<curinput.limitfield then for k:=curinput.
startfield to curinput.limitfield-1 do if buffer2[k]>0 then printchar(
buffer[k])else print(buffer[k]);first:=curinput.limitfield;begin;
print(712);terminput;end;
if last>first then begin for k:=first to last-1 do begin buffer[k+
curinput.startfield-first]:=buffer[k];
buffer2[k+curinput.startfield-first]:=buffer2[k];end;
curinput.limitfield:=curinput.startfield+last-first;end;end;end;
{:395}{397:}procedure gettoken;begin nonewcontrolsequence:=false;
getnext;nonewcontrolsequence:=true;
if curcs=0 then if(curcmd>=16)and(curcmd<=20)then if(curcmd=16)and(
curchr>=16777216)then curtok:=(23*16777216)+curchr else curtok:=(curcmd
*16777216)+curchr else if(curcmd=14)then curtok:=(eqtb[51759+curchr].hh.
rh*16777216)+curchr else if(checkecharrange(curchr)=1)then curtok:=(
curcmd*16777216)+curchr else curtok:=(curcmd*65536)+curchr else curtok:=
536870911+curcs;end;{:397}{398:}{425:}procedure macrocall;
label 10,22,30,31,40;var r:halfword;p:halfword;q:halfword;s:halfword;
t:halfword;u,v:halfword;rbraceptr:halfword;n:smallnumber;
unbalance:halfword;m:halfword;refcount:halfword;
savescannerstatus:smallnumber;savewarningindex:halfword;
matchchr:ASCIIcode;begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;warningindex:=curcs;refcount:=curchr;
r:=mem[refcount].hh.rh;n:=0;
if eqtb[114391].int>0 then{437:}begin begindiagnostic;
if eqtb[114426].int>0 then if inputptr<eqtb[114426].int then begin v:=
inputptr;println;printchar(126);while v>0 do begin printchar(46);
decr(v);end;printcs(warningindex);tokenshow(refcount);
end else begin printchar(126);printchar(126);printcs(warningindex);
end else begin println;printcs(warningindex);tokenshow(refcount);end;
enddiagnostic(false);end{:437};
if mem[r].hh.lh=917505 then r:=mem[r].hh.rh;
if mem[r].hh.lh<>917504 then{427:}begin scannerstatus:=3;unbalance:=0;
longstate:=eqtb[curcs].hh.b0;
if longstate>=131 then longstate:=longstate-2;
repeat mem[memtop-3].hh.rh:=-1073741823;
if(mem[r].hh.lh>=863872)or(mem[r].hh.lh<851968)then s:=-1073741823 else
begin matchchr:=mem[r].hh.lh-851968;s:=mem[r].hh.rh;r:=s;p:=memtop-3;
m:=0;end;{428:}22:gettoken;
if curtok=mem[r].hh.lh then{430:}begin r:=mem[r].hh.rh;
if(mem[r].hh.lh>=851968)and(mem[r].hh.lh<=917504)then begin if curtok<
131072 then decr(alignstate);goto 40;end else goto 22;end{:430};
{433:}if s<>r then if s=-1073741823 then{434:}begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(265);
print(745);end;sprintcs(warningindex);print(746);begin helpptr:=4;
helpline[3]:=747;helpline[2]:=748;helpline[1]:=749;helpline[0]:=750;end;
error;goto 10;end{:434}else begin t:=s;repeat begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=mem[t].hh.lh;p:=q;end;incr(m);
u:=mem[t].hh.rh;v:=s;
while true do begin if u=r then if curtok<>mem[v].hh.lh then goto 30
else begin r:=mem[v].hh.rh;goto 22;end;
if mem[u].hh.lh<>mem[v].hh.lh then goto 30;u:=mem[u].hh.rh;
v:=mem[v].hh.rh;end;30:t:=mem[t].hh.rh;until t=r;r:=s;end{:433};
if curtok=partoken then if longstate<>130 then if eqtb[114440].int=0
then{432:}begin if longstate=129 then begin runaway;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(740);
end;sprintcs(warningindex);print(741);begin helpptr:=3;helpline[2]:=742;
helpline[1]:=743;helpline[0]:=744;end;backerror;end;
pstack[n]:=mem[memtop-3].hh.rh;alignstate:=alignstate-unbalance;
for m:=0 to n do flushlist(pstack[m]);goto 10;end{:432};
if curtok<196608 then if curtok<131072 then{435:}begin unbalance:=1;
while true do begin begin begin q:=avail;
if q=-1073741823 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-1073741823;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;gettoken;
if curtok=partoken then if longstate<>130 then if eqtb[114440].int=0
then{432:}begin if longstate=129 then begin runaway;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(740);
end;sprintcs(warningindex);print(741);begin helpptr:=3;helpline[2]:=742;
helpline[1]:=743;helpline[0]:=744;end;backerror;end;
pstack[n]:=mem[memtop-3].hh.rh;alignstate:=alignstate-unbalance;
for m:=0 to n do flushlist(pstack[m]);goto 10;end{:432};
if curtok<196608 then if curtok<131072 then incr(unbalance)else begin
decr(unbalance);if unbalance=0 then goto 31;end;end;31:rbraceptr:=p;
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;
end{:435}else{431:}begin backinput;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(732);
end;sprintcs(warningindex);print(733);begin helpptr:=6;helpline[5]:=734;
helpline[4]:=735;helpline[3]:=736;helpline[2]:=737;helpline[1]:=738;
helpline[0]:=739;end;incr(alignstate);longstate:=129;curtok:=partoken;
inserror;goto 22;
end{:431}else{429:}begin if curtok=655392 then if mem[r].hh.lh<=917504
then if mem[r].hh.lh>=851968 then goto 22;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end{:429};incr(m);
if mem[r].hh.lh>917504 then goto 22;if mem[r].hh.lh<851968 then goto 22;
40:if s<>-1073741823 then{436:}begin if(m=1)and(mem[p].hh.lh<196608)then
begin mem[rbraceptr].hh.rh:=-1073741823;begin mem[p].hh.rh:=avail;
avail:=p;ifdef('STAT')decr(dynused);endif('STAT')end;
p:=mem[memtop-3].hh.rh;pstack[n]:=mem[p].hh.rh;
begin mem[p].hh.rh:=avail;avail:=p;ifdef('STAT')decr(dynused);
endif('STAT')end;end else pstack[n]:=mem[memtop-3].hh.rh;incr(n);
if eqtb[114391].int>0 then if(eqtb[114426].int=0)or(inputptr<eqtb[114426
].int)then begin begindiagnostic;printnl(matchchr);printint(n);
print(751);showtokenlist(pstack[n-1],-1073741823,1000);
enddiagnostic(false);end;end{:436}{:428};until mem[r].hh.lh=917504;
end{:427};
{426:}while(curinput.locfield=-1073741823)and(curinput.indexfield<>2)and
(curinput.indexfield<>6)do endtokenlist;begintokenlist(refcount,5);
curinput.namefield:=warningindex;curinput.locfield:=mem[r].hh.rh;
if n>0 then begin if paramptr+n>maxparamstack then begin maxparamstack:=
paramptr+n;if maxparamstack>paramsize then overflow(731,paramsize);end;
for m:=0 to n-1 do paramstack[paramptr+m]:=pstack[m];
paramptr:=paramptr+n;end{:426};10:scannerstatus:=savescannerstatus;
warningindex:=savewarningindex;end;{:425}{415:}procedure insertrelax;
begin curtok:=536870911+curcs;backinput;curtok:=536909728;backinput;
curinput.indexfield:=4;end;{:415}{1533:}procedure pseudostart;forward;
{:1533}{1591:}procedure scanregisternum;forward;
{:1591}{1596:}procedure newindex(i:quarterword;q:halfword);
var k:smallnumber;begin curptr:=getnode(9);mem[curptr].hh.b0:=i;
mem[curptr].hh.b1:=0;mem[curptr].hh.rh:=q;
for k:=1 to 8 do mem[curptr+k]:=sanull;end;
{:1596}{1600:}procedure findsaelement(t:smallnumber;n:halfword;
w:boolean);label 45,46,47,48,49,50,10;var q:halfword;i:smallnumber;
begin curptr:=saroot[t];
begin if curptr=-1073741823 then if w then goto 45 else goto 10;end;
q:=curptr;i:=n div 65536;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-1073741823 then if w then goto 46 else goto 10;end;
q:=curptr;i:=(n div 4096)mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-1073741823 then if w then goto 47 else goto 10;end;
q:=curptr;i:=(n div 256)mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-1073741823 then if w then goto 48 else goto 10;end;
q:=curptr;i:=(n div 16)mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-1073741823 then if w then goto 49 else goto 10;end;
q:=curptr;i:=n mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;if(curptr=-1073741823)and w then goto 50;goto 10;
45:newindex(t,-1073741823);saroot[t]:=curptr;q:=curptr;i:=n div 65536;
46:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;
i:=(n div 4096)mod 16;47:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;
i:=(n div 256)mod 16;48:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;i:=(n div 16)mod 16;
49:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;i:=n mod 16;
50:{1601:}if t=6 then begin curptr:=getnode(4);mem[curptr+1]:=sanull;
mem[curptr+2]:=sanull;mem[curptr+3]:=sanull;
end else begin if t<=1 then begin curptr:=getnode(3);
mem[curptr+2].int:=0;mem[curptr+1].hh.rh:=n;
end else begin curptr:=getnode(2);
if t<=3 then begin mem[curptr+1].hh.rh:=membot;incr(mem[membot].hh.rh);
end else mem[curptr+1].hh.rh:=-1073741823;end;
mem[curptr+1].hh.lh:=-1073741823;end;mem[curptr].hh.b0:=16*t+i;
mem[curptr].hh.b1:=1{:1601};mem[curptr].hh.rh:=q;
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;10:end;
{:1600}procedure passtext;forward;procedure startinput;forward;
procedure conditional;forward;procedure getxtoken;forward;
procedure convtoks;forward;procedure insthetoks;forward;
procedure expand;label 21;var t:halfword;b:boolean;p,q,r:halfword;
j:0..bufsize;cvbackup:integer;
cvlbackup,radixbackup,cobackup:smallnumber;backupbackup:halfword;
savescannerstatus:smallnumber;begin incr(expanddepthcount);
if expanddepthcount>=expanddepth then overflow(713,expanddepth);
cvbackup:=curval;cvlbackup:=curvallevel;radixbackup:=radix;
cobackup:=curorder;backupbackup:=mem[memtop-13].hh.rh;
21:if curcmd<129 then{401:}begin if eqtb[114397].int>1 then
showcurcmdchr;case curcmd of 128:{422:}begin t:=curchr mod 5;
if curchr>=5 then scanregisternum else curval:=0;
if curval=0 then curptr:=curmark[t]else{1605:}begin findsaelement(6,
curval,false);
if curptr<>-1073741823 then if odd(t)then curptr:=mem[curptr+(t div 2)+1
].hh.rh else curptr:=mem[curptr+(t div 2)+1].hh.lh;end{:1605};
if curptr<>-1073741823 then begintokenlist(curptr,14);end{:422};
120:if curchr=0 then{402:}begin gettoken;t:=curtok;gettoken;
if curcmd>118 then expand else backinput;curtok:=t;backinput;
end{:402}else{1546:}begin gettoken;
if(curcmd=123)and(curchr<>16)then begin curchr:=curchr+32;goto 21;end;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(789);
end;printesc(931);print(1622);printcmdchr(curcmd,curchr);printchar(39);
begin helpptr:=1;helpline[0]:=708;end;backerror;end{:1546};
121:if curchr=0 then{403:}begin savescannerstatus:=scannerstatus;
scannerstatus:=0;gettoken;scannerstatus:=savescannerstatus;t:=curtok;
backinput;if(t>=536870911)and(t<>536909729)then begin p:=getavail;
mem[p].hh.lh:=536909730;mem[p].hh.rh:=curinput.locfield;
curinput.startfield:=p;curinput.locfield:=p;end;
end{:403}else{404:}begin savescannerstatus:=scannerstatus;
scannerstatus:=0;gettoken;scannerstatus:=savescannerstatus;
if curcs<23810 then curcs:=primlookup(curcs-11905)else curcs:=primlookup
(hash[curcs].rh);if curcs<>0 then begin t:=eqtb[38822+curcs].hh.b0;
if t>118 then begin curcmd:=t;curchr:=eqtb[38822+curcs].hh.rh;
curtok:=(curcmd*65536)+curchr;curcs:=0;goto 21;end else begin backinput;
p:=getavail;mem[p].hh.lh:=536909732;mem[p].hh.rh:=curinput.locfield;
curinput.locfield:=p;curinput.startfield:=p;end;end;end{:404};
125:{408:}begin r:=getavail;p:=r;b:=isincsname;isincsname:=true;
repeat getxtoken;if curcs=0 then begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;until curcs<>0;
if curcmd<>73 then{409:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(720);
end;printesc(569);print(721);begin helpptr:=2;helpline[1]:=722;
helpline[0]:=723;end;backerror;end{:409};isincsname:=b;{410:}j:=first;
p:=mem[r].hh.rh;
while p<>-1073741823 do begin if j>=maxbufstack then begin maxbufstack:=
j+1;if maxbufstack=bufsize then overflow(259,bufsize);end;
if checkkanji(mem[p].hh.lh)then begin t:=toBUFF(mem[p].hh.lh mod
16777216);if BYTE1(t)<>0 then begin buffer[j]:=BYTE1(t);buffer2[j]:=1;
incr(j);end;if BYTE2(t)<>0 then begin buffer[j]:=BYTE2(t);buffer2[j]:=1;
incr(j);end;if BYTE3(t)<>0 then begin buffer[j]:=BYTE3(t);buffer2[j]:=1;
incr(j);end;buffer[j]:=BYTE4(t);buffer2[j]:=1;incr(j);p:=mem[p].hh.rh;
end else begin buffer[j]:=mem[p].hh.lh mod 65536;buffer2[j]:=0;incr(j);
p:=mem[p].hh.rh;end;end;
if j>first+1 then begin nonewcontrolsequence:=false;
curcs:=idlookup(first,j-first);nonewcontrolsequence:=true;
end else if j=first then curcs:=23809 else curcs:=11905+buffer[first]
{:410};flushlist(r);
if eqtb[curcs].hh.b0=119 then begin eqdefine(curcs,0,16777216);end;
curtok:=curcs+536870911;backinput;end{:408};126:convtoks;127:insthetoks;
123:conditional;
124:{548:}begin if eqtb[114432].int>0 then if eqtb[114397].int<=1 then
showcurcmdchr;
if curchr>iflimit then if iflimit=1 then insertrelax else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(935);
end;printcmdchr(124,curchr);begin helpptr:=1;helpline[0]:=936;end;error;
end else begin while curchr<>2 do passtext;
{534:}begin if ifstack[inopen]=condptr then ifwarning;p:=condptr;
ifline:=mem[p+1].int;curif:=mem[p].hh.b1;iflimit:=mem[p].hh.b0;
condptr:=mem[p].hh.rh;freenode(p,2);end{:534};end;end{:548};
122:{414:}if curchr=1 then forceeof:=true{1530:}else if curchr=2 then
pseudostart{:1530}else if nameinprogress then insertrelax else
startinput{:414};others:{406:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(714);
end;begin helpptr:=5;helpline[4]:=715;helpline[3]:=716;helpline[2]:=717;
helpline[1]:=718;helpline[0]:=719;end;error;end{:406}end;
end{:401}else if curcmd<133 then macrocall else{411:}begin curtok:=
536909727;backinput;end{:411};curval:=cvbackup;curvallevel:=cvlbackup;
radix:=radixbackup;curorder:=cobackup;
mem[memtop-13].hh.rh:=backupbackup;decr(expanddepthcount);end;
{:398}{416:}procedure getxtoken;label 20,30;begin 20:getnext;
if curcmd<=118 then goto 30;
if curcmd>=129 then if curcmd<133 then macrocall else begin curcs:=38816
;curcmd:=9;goto 30;end else expand;goto 20;
30:if curcs=0 then if(curcmd>=16)and(curcmd<=20)then if(curcmd=16)and(
curchr>=16777216)then curtok:=(23*16777216)+curchr else curtok:=(curcmd
*16777216)+curchr else if(curcmd=14)then curtok:=(eqtb[51759+curchr].hh.
rh*16777216)+curchr else if(checkecharrange(curchr)=1)then curtok:=(
curcmd*16777216)+curchr else curtok:=(curcmd*65536)+curchr else curtok:=
536870911+curcs;end;{:416}{417:}procedure xtoken;
begin while curcmd>118 do begin expand;getnext;end;
if curcs=0 then if(curcmd>=16)and(curcmd<=20)then if(curcmd=16)and(
curchr>=16777216)then curtok:=(23*16777216)+curchr else curtok:=(curcmd
*16777216)+curchr else if(curcmd=14)then curtok:=(eqtb[51759+curchr].hh.
rh*16777216)+curchr else if(checkecharrange(curchr)=1)then curtok:=(
curcmd*16777216)+curchr else curtok:=(curcmd*65536)+curchr else curtok:=
536870911+curcs;end;{:417}{439:}procedure scanleftbrace;
begin{440:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:440};
if curcmd<>1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(752);
end;begin helpptr:=4;helpline[3]:=753;helpline[2]:=754;helpline[1]:=755;
helpline[0]:=756;end;backerror;curtok:=65659;curcmd:=1;curchr:=123;
incr(alignstate);end;end;{:439}{441:}procedure scanoptionalequals;
begin{442:}repeat getxtoken;until curcmd<>10{:442};
if curtok<>786493 then backinput;end;
{:441}{443:}function scankeyword(s:strnumber):boolean;label 10;
var p:halfword;q:halfword;k:poolpointer;savecurcs:halfword;
begin p:=memtop-13;mem[p].hh.rh:=-1073741823;k:=strstart[s];
savecurcs:=curcs;while k<strstart[s+1]do begin getxtoken;
if(curcs=0)and((curchr=strpool[k])or(curchr=strpool[k]-32))then begin
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;incr(k);
end else if(curcmd<>10)or(p<>memtop-13)then begin backinput;
if p<>memtop-13 then begintokenlist(mem[memtop-13].hh.rh,3);
curcs:=savecurcs;scankeyword:=false;goto 10;end;end;
flushlist(mem[memtop-13].hh.rh);scankeyword:=true;10:end;
{:443}{444:}procedure muerror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(757);
end;begin helpptr:=1;helpline[0]:=758;end;error;end;
{:444}{445:}procedure scanint;forward;
procedure scansomethinginternalident;forward;
{470:}procedure scaneightbitint;begin scanint;
if(curval<0)or(curval>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(791);
end;begin helpptr:=2;helpline[1]:=792;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;{:470}{471:}procedure scanasciinum;
begin scanint;
if(curval<0)or(curval>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(793);
end;begin helpptr:=2;helpline[1]:=794;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;procedure scanlatinnum;begin scanint;
if not ischarascii(curval)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(793);
end;begin helpptr:=2;helpline[1]:=795;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;procedure scancharnum;begin scanint;
if not ischarascii(curval)and not ischarkanji(curval)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(793);
end;begin helpptr:=2;helpline[1]:=796;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;{:471}{472:}procedure scanfourbitint;
begin scanint;
if(curval<0)or(curval>15)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(797);
end;begin helpptr:=2;helpline[1]:=798;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;procedure scanbigfourbitint;
begin scanint;
if(curval<0)or(curval>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(797);
end;begin helpptr:=2;helpline[1]:=799;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;
{:472}{473:}procedure scanfifteenbitint;begin scanint;
if(curval<0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(800);
end;begin helpptr:=2;helpline[1]:=801;helpline[0]:=761;end;
interror(curval);curval:=0;end;
curval:=((curval div 4096)*65536)+(curval mod 4096);end;
procedure scanrealfifteenbitint;begin scanint;
if(curval<0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(800);
end;begin helpptr:=2;helpline[1]:=801;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;procedure scanbigfifteenbitint;
begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(802);
end;begin helpptr:=2;helpline[1]:=803;helpline[0]:=761;end;
interror(curval);curval:=0;end;
curval:=((curval div 65536)*256)+(curval mod 256);end;
procedure scanomegafifteenbitint;begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(802);
end;begin helpptr:=2;helpline[1]:=803;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;
{:473}{474:}procedure scantwentysevenbitint;begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(804);
end;begin helpptr:=2;helpline[1]:=763;helpline[0]:=761;end;
interror(curval);curval:=0;end;curval1:=curval mod 4096;
curval:=curval div 4096;
curval:=((curval div 4096)*65536)+(curval mod 4096);end;
procedure scanfiftyonebitint;var iiii:integer;begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(804);
end;begin helpptr:=2;helpline[1]:=805;helpline[0]:=761;end;
interror(curval);curval:=0;end;
iiii:=((curval div 65536)*256)+(curval mod 256);scanint;
if(curval<0)or(curval>16777215)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(804);
end;begin helpptr:=2;helpline[1]:=806;helpline[0]:=761;end;
interror(curval);curval:=0;end;
curval1:=((curval div 65536)*256)+(curval mod 256);curval:=iiii;end;
{:474}{1592:}procedure scanregisternum;begin scanint;
if(curval<0)or(curval>maxregnum)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(791);
end;begin helpptr:=2;helpline[1]:=maxreghelpline;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;
{:1592}{1655:}procedure scanfourbitintor18;begin scanint;
if(curval<0)or((curval>15)and(curval<>18))then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(797);
end;begin helpptr:=2;helpline[1]:=798;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;
{:1655}{1459:}procedure scangeneraltext;forward;
{:1459}{1553:}procedure getxorprotected;label 10;
begin while true do begin gettoken;if curcmd<=118 then goto 10;
if(curcmd>=129)and(curcmd<133)then if mem[mem[curchr].hh.rh].hh.lh=
917505 then goto 10;expand;end;10:end;{:1553}{1562:}procedure scanexpr;
forward;{:1562}{1567:}procedure scannormalglue;forward;
procedure scanmuglue;forward;
{:1567}{1666:}function effectivechar(errp:boolean;f:internalfontnumber;
c:quarterword):integer;label 40;var basec:integer;result:integer;
begin result:=c;if not mltexenabledp then goto 40;
if fontec[f]>=c then if fontbc[f]<=c then if(fontinfo[charbase[f]+c].
qqqq.b0>0)then goto 40;
if c>=eqtb[114423].int then if c<=eqtb[114424].int then if(eqtb[114105+c
].hh.rh>0)then begin basec:=(eqtb[114105+c].hh.rh mod 256);
result:=basec;if not errp then goto 40;
if fontec[f]>=basec then if fontbc[f]<=basec then if(fontinfo[charbase[f
]+basec].qqqq.b0>0)then goto 40;end;if errp then begin begindiagnostic;
printnl(986);print(1655);print(c);print(987);slowprint(fontname[f]);
printchar(33);enddiagnostic(false);result:=fontbc[f];end;
40:effectivechar:=result;end;{:1666}{615:}procedure scanfontident;
var f:internalfontnumber;m:halfword;begin{442:}repeat getxtoken;
until curcmd<>10{:442};
if curcmd=102 then f:=eqtb[51754].hh.rh else if curcmd=103 then f:=eqtb[
51755].hh.rh else if curcmd=101 then f:=eqtb[50985].hh.rh else if curcmd
=100 then f:=curchr else if curcmd=99 then begin m:=curchr;
scanbigfourbitint;f:=eqtb[m+curval].hh.rh;
end else if(curcmd=78)and(curchr=6)then begin scansomethinginternalident
;f:=curval-40923;end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(978);
end;begin helpptr:=2;helpline[1]:=979;helpline[0]:=980;end;backerror;
f:=0;end;curval:=f;end;
{:615}{616:}procedure findfontdimen(writing:boolean);
var f:internalfontnumber;n:integer;begin scanint;n:=curval;
scanfontident;f:=curval;
if n<=0 then curval:=fmemptr else begin if writing and(n<=4)and(n>=2)and
(fontglue[f]<>-1073741823)then begin deleteglueref(fontglue[f]);
fontglue[f]:=-1073741823;end;
if n>fontparams[f]then if f<fontptr then curval:=fmemptr else{618:}begin
repeat if fmemptr=fontmemsize then overflow(985,fontmemsize);
fontinfo[fmemptr].int:=0;incr(fmemptr);incr(fontparams[f]);
until n=fontparams[f];curval:=fmemptr-1;
end{:618}else curval:=n+parambase[f];end;
{617:}if curval=fmemptr then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(961);
end;printesc(hash[40923+f].rh);print(981);printint(fontparams[f]);
print(982);begin helpptr:=2;helpline[1]:=983;helpline[0]:=984;end;error;
end{:617};end;{:616}{1675:}function getjfmpos(kcode:KANJIcode;
f:internalfontnumber):eightbits;var jc:KANJIcode;sp,mp,ep:halfword;
begin if f=0 then begin getjfmpos:=fontinfo[ctypebase[0]+0].hh.lhfield;
goto 10;end;jc:=toDVI(kcode);sp:=1;ep:=fontnumext[f]-1;
if(ep>=1)then if fontenc[f]=0 then begin if(fontinfo[ctypebase[f]+sp].hh
.rh<=jc)and(jc<=fontinfo[ctypebase[f]+ep].hh.rh)then begin while(sp<=ep)
do begin mp:=sp+((ep-sp)div 2);
if jc<fontinfo[ctypebase[f]+mp].hh.rh then ep:=mp-1 else if jc>fontinfo[
ctypebase[f]+mp].hh.rh then sp:=mp+1 else begin getjfmpos:=fontinfo[
ctypebase[f]+mp].hh.lhfield;goto 10;end;end;end;
end else begin while(sp<=ep)do if jc=fontinfo[ctypebase[f]+sp].hh.rh
then begin getjfmpos:=fontinfo[ctypebase[f]+sp].hh.lhfield;goto 10;
end else incr(sp);end;getjfmpos:=fontinfo[ctypebase[f]+0].hh.lhfield;
end;{:1675}{:445}{449:}{1687:}procedure printkansuji(n:integer);
var k:0..23;cx:KANJIcode;begin k:=0;if n<0 then goto 10;
repeat dig[k]:=n mod 10;n:=n div 10;incr(k);until n=0;
begin while k>0 do begin decr(k);cx:=eqtb[78127+dig[k]].hh.rh;
printkanji(fromDVI(cx));end;end;end;
{:1687}{1696:}function getinhibitpos(c:KANJIcode;
n:smallnumber):halfword;label 30,31;var p,pp,s:halfword;
begin s:=calcpos(c);p:=s;pp:=10000;
if n=0 then begin repeat if eqtb[76079+p].hh.rh=c then goto 30;
if eqtb[76079+p].hh.rh=0 then begin if pp<>10000 then p:=pp;goto 30;end;
if eqtb[76079+p].hh.b0=4 then if pp=10000 then pp:=p;incr(p);
if p>1023 then p:=0;until s=p;p:=pp;
end else begin repeat if eqtb[76079+p].hh.rh=0 then goto 31;
if eqtb[76079+p].hh.rh=c then goto 30;incr(p);if p>1023 then p:=0;
until s=p;31:p:=10000;end;30:getinhibitpos:=p;end;
{:1696}{1701:}function getkinsokupos(c:KANJIcode;
n:smallnumber):halfword;label 30,31;var p,pp,s:halfword;
begin s:=calcpos(c);p:=s;pp:=10000;ifdef('TEXMF_DEBUG')println;
print(1698);printint(c);print(1699);printint(s);
if p+77103<0 then begin print(1700);println;end;
endif('TEXMF_DEBUG')if n=0 then begin repeat if eqtb[77103+p].hh.rh=c
then goto 30;
if eqtb[77103+p].hh.b0=0 then begin if pp<>10000 then p:=pp;goto 30;end;
if eqtb[77103+p].hh.b0=3 then if pp=10000 then pp:=p;incr(p);
if p>1023 then p:=0;until s=p;p:=pp;
end else begin repeat if eqtb[77103+p].hh.b0=0 then goto 31;
if eqtb[77103+p].hh.rh=c then goto 30;incr(p);if p>1023 then p:=0;
until s=p;31:p:=10000;end;30:getkinsokupos:=p;end;
{:1701}procedure scansomethinginternal(level:smallnumber;
negative:boolean);label 10,20;var m:halfword;q,r:halfword;tx:halfword;
qx:halfword;i:fourquarters;p:0..nestsize;begin 20:m:=curchr;
case curcmd of 89:{1703:}begin scanint;q:=getkinsokupos(curval,1);
curvallevel:=0;curval:=0;
if(q<>10000)and(m=eqtb[77103+q].hh.b0)then begin curval:=eqtb[115238+q].
int;curvallevel:=0;end;end{:1703};90:{1698:}begin scanint;
q:=getinhibitpos(curval,1);curvallevel:=0;curval:=3;
if q<>10000 then curval:=eqtb[76079+q].hh.b0;if curval>3 then curval:=3;
end{:1698};91:{1685:}begin scanint;curvallevel:=0;
if(curval<0)or(curval>9)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1671);
end;printint(curval);printchar(41);begin helpptr:=1;helpline[0]:=1670;
end;error;goto 10;end else curval:=fromDVI(eqtb[78127+curval].hh.rh);
end{:1685};98:{451:}begin if m=113849 then begin scanasciinum;
curval1:=eqtb[113849+curval].hh.rh;
if((curval1 div 65536)>8)or(((curval1 mod 65536)div 256)>15)then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(759);
end;begin helpptr:=2;helpline[1]:=760;helpline[0]:=761;end;
interror(curval1);begin curval:=0;curvallevel:=0;end end;
curval1:=(curval1 div 65536)*4096+curval1 mod 4096;
begin curval:=curval1;curvallevel:=0;end;
end else if m=(113977)then begin scanasciinum;
curval1:=eqtb[113849+curval].hh.rh;
curval:=(curval1 div 65536)*16777216+((curval1 div 256)mod 256)*65536+(
curval1 mod 256);begin curval:=curval;curvallevel:=0;end;
end else if m=114701 then begin scanasciinum;
curval1:=eqtb[114701+curval].int;curval:=getintone(eqtb[114701+curval]);
if((curval1 div 256)mod 256>=16)or(curval>=4096)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(762);
end;begin helpptr:=2;helpline[1]:=763;helpline[0]:=761;end;error;
begin curval:=0;curvallevel:=0;end;
end else if curval1<0 then begin curval:=curval;curvallevel:=0;
end else begin curval:=curval1*4096+curval;curvallevel:=0;end;
end else if m=(114829)then begin scanasciinum;begin curval:=-1;
curvallevel:=0;end;end else if m=63663 then begin scancharnum;
begin curval:=eqtb[m+kcatcodekey(curval)].hh.rh;curvallevel:=0;end;
end else if m<113849 then begin scanlatinnum;
begin curval:=eqtb[m+curval].hh.rh;curvallevel:=0;
end end else begin scanasciinum;begin curval:=eqtb[m+curval].int;
curvallevel:=0;end end;end{:451};
81,82,99,100,101,102,103:{452:}if level<>5 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(764);
end;begin helpptr:=3;helpline[2]:=765;helpline[1]:=766;helpline[0]:=767;
end;backerror;begin curval:=0;curvallevel:=1;end;
end else if curcmd<=82 then begin if curcmd<82 then if m=membot then
begin scanregisternum;
if curval<256 then curval:=eqtb[50469+curval].hh.rh else begin
findsaelement(5,curval,false);
if curptr=-1073741823 then curval:=-1073741823 else curval:=mem[curptr+1
].hh.rh;end;end else curval:=mem[m+1].hh.rh else curval:=eqtb[m].hh.rh;
curvallevel:=5;end else begin backinput;scanfontident;
begin curval:=40923+curval;curvallevel:=4;end;end{:452};
83:begin curval:=eqtb[m].int;curvallevel:=0;end;
84:begin curval:=eqtb[m].int;curvallevel:=1;end;
85:begin curval:=eqtb[m].hh.rh;curvallevel:=2;end;
86:begin curval:=eqtb[m].hh.rh;curvallevel:=3;end;
92:{455:}if abs(curlist.modefield)<>m then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(265);
print(784);end;printcmdchr(92,m);begin helpptr:=4;helpline[3]:=785;
helpline[2]:=786;helpline[1]:=787;helpline[0]:=788;end;error;
if level<>5 then begin curval:=0;curvallevel:=1;
end else begin curval:=0;curvallevel:=0;end;
end else if m=1 then begin curval:=curlist.auxfield.int;curvallevel:=1;
end else begin curval:=curlist.auxfield.hh.lh;curvallevel:=0;end{:455};
93:{459:}if curlist.modefield=0 then begin curval:=0;curvallevel:=0;
end else begin nest[nestptr]:=curlist;p:=nestptr;
while abs(nest[p].modefield)<>1 do decr(p);
begin curval:=nest[p].pgfield;curvallevel:=0;end;end{:459};
95:{456:}begin if m=0 then curval:=deadcycles{1471:}else if m=2 then
curval:=interaction{:1471}else curval:=insertpenalties;curvallevel:=0;
end{:456};
94:{458:}begin if(pagecontents=0)and(not outputactive)then if m=0 then
curval:=1073741823 else curval:=0 else curval:=pagesofar[m];
curvallevel:=1;end{:458};
97:{460:}begin if m>50458 then{1647:}begin scanint;
if(eqtb[m].hh.rh=-1073741823)or(curval<0)then curval:=0 else begin if
curval>mem[eqtb[m].hh.rh+1].int then curval:=mem[eqtb[m].hh.rh+1].int;
curval:=mem[eqtb[m].hh.rh+curval+1].int;end;
end{:1647}else if eqtb[50458].hh.rh=-1073741823 then curval:=0 else
curval:=mem[eqtb[50458].hh.rh].hh.lh;curvallevel:=0;end{:460};
96:{457:}begin scanregisternum;
if curval<256 then q:=eqtb[50729+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-1073741823 then q:=-1073741823 else q:=mem[curptr+1].hh.rh;
end;if q=-1073741823 then curval:=0 else begin qx:=q;
while(q<>-1073741823)and(abs(((mem[q].hh.b1)mod 16-5))<>abs(curlist.
dirfield))do q:=mem[q].hh.rh;
if q=-1073741823 then begin r:=mem[qx].hh.rh;mem[qx].hh.rh:=-1073741823;
q:=newdirnode(qx,abs(curlist.dirfield));mem[qx].hh.rh:=r;
curval:=mem[q+m].int;deleteglueref(mem[q+7].hh.rh);
deleteglueref(mem[q+7].hh.lh);freenode(q,10);
end else curval:=mem[q+m].int;end;curvallevel:=1;end{:457};
75,77,74,76:begin curval:=curchr;curvallevel:=0;end;
87:{462:}begin findfontdimen(false);fontinfo[fmemptr].int:=0;
begin curval:=fontinfo[curval].int;curvallevel:=1;end;end{:462};
88:{463:}begin scanfontident;
if m=0 then begin curval:=hyphenchar[curval];curvallevel:=0;
end else begin curval:=skewchar[curval];curvallevel:=0;end;end{:463};
104:{464:}begin if(m<membot)or(m>membot+23)then begin curvallevel:=(mem[
m].hh.b0 div 16);
if curvallevel<2 then curval:=mem[m+2].int else curval:=mem[m+1].hh.rh;
end else begin scanregisternum;curvallevel:=m-membot;
if curval>255 then begin findsaelement(curvallevel,curval,false);
if curptr=-1073741823 then if curvallevel<2 then curval:=0 else curval:=
membot else if curvallevel<2 then curval:=mem[curptr+2].int else curval
:=mem[curptr+1].hh.rh;
end else case curvallevel of 0:curval:=eqtb[114445+curval].int;
1:curval:=eqtb[114982+curval].int;2:curval:=eqtb[49946+curval].hh.rh;
3:curval:=eqtb[50202+curval].hh.rh;end;end;end{:464};
78:{461:}if m>=7 then if m>=38 then{1561:}begin if m<39 then begin case
m of{1588:}38:scanmuglue;{:1588}end;curvallevel:=2;
end else if m<40 then begin case m of{1589:}39:scannormalglue;
{:1589}end;curvallevel:=3;end else begin curvallevel:=m-40;scanexpr;end;
while curvallevel>level do begin if curvallevel=2 then begin m:=curval;
curval:=mem[m+1].int;deleteglueref(m);
end else if curvallevel=3 then muerror;decr(curvallevel);end;
if negative then if curvallevel>=2 then begin m:=curval;
curval:=newspec(m);deleteglueref(m);
{468:}begin mem[curval+1].int:=-mem[curval+1].int;
mem[curval+2].int:=-mem[curval+2].int;
mem[curval+3].int:=-mem[curval+3].int;end{:468};
end else curval:=-curval;goto 10;
end{:1561}else if m>=29 then begin case m of{1448:}29,30,31,32:begin
scanfontident;q:=curval;if fontdir[q]<>0 then begin scanint;
if curval>=0 then begin if ischarkanji(curval)then curval:=getjfmpos(
curval,q)else curval:=-1 end else begin curval:=-(curval+1);
if(fontbc[q]>curval)or(fontec[q]<curval)then curval:=-1 end;
if curval<>-1 then begin i:=fontinfo[charbase[q]+curval].qqqq;
case m of 29:curval:=fontinfo[widthbase[q]+i.b0].int;
30:curval:=fontinfo[heightbase[q]+(i.b1)div 256].int;
31:curval:=fontinfo[depthbase[q]+(i.b1)mod 256].int;
32:curval:=fontinfo[italicbase[q]+(i.b2)div 256].int;end;
end else curval:=0;end else begin scanlatinnum;
if(fontbc[q]<=curval)and(fontec[q]>=curval)then begin i:=fontinfo[
charbase[q]+curval].qqqq;
case m of 29:curval:=fontinfo[widthbase[q]+i.b0].int;
30:curval:=fontinfo[heightbase[q]+(i.b1)div 256].int;
31:curval:=fontinfo[depthbase[q]+(i.b1)mod 256].int;
32:curval:=fontinfo[italicbase[q]+(i.b2)div 256].int;end;
end else curval:=0;end end;{:1448}{1451:}33,34,35:begin q:=curchr-33;
scanint;
if(eqtb[50458].hh.rh=-1073741823)or(curval<=0)then curval:=0 else begin
if q=2 then begin q:=curval mod 2;curval:=(curval+q)div 2;end;
if curval>mem[eqtb[50458].hh.rh].hh.lh then curval:=mem[eqtb[50458].hh.
rh].hh.lh;curval:=mem[eqtb[50458].hh.rh+2*curval-q].int;end;
curvallevel:=1;end;{:1451}{1585:}36,37:begin scannormalglue;q:=curval;
if m=36 then curval:=mem[q+2].int else curval:=mem[q+3].int;
deleteglueref(q);end;{:1585}end;curvallevel:=1;
end else begin case m of 7:curval:=line;8:curval:=lastbadness;
9:curval:=4;10:curval:=2;11:curval:=251130;12:curval:=1;
{1428:}18:curval:=2;13:curval:=pdflastxpos;14:curval:=pdflastypos;
15:begin if shellenabledp then begin if restrictedshell then curval:=2
else curval:=1;end else curval:=0;end;16:curval:=getmicrointerval;
17:curval:=randomseed;{:1428}{1442:}19:curval:=curlevel-1;
20:curval:=curgroup;{:1442}{1445:}21:begin q:=condptr;curval:=0;
while q<>-1073741823 do begin incr(curval);q:=mem[q].hh.rh;end;end;
22:if condptr=-1073741823 then curval:=0 else if curif<32 then curval:=
curif+1 else curval:=-(curif-31);
23:if(iflimit=4)or(iflimit=3)then curval:=1 else if iflimit=2 then
curval:=-1 else curval:=0;{:1445}{1584:}24,25:begin scannormalglue;
q:=curval;if m=24 then curval:=mem[q].hh.b0 else curval:=mem[q].hh.b1;
if curval>0 then curval:=curval-1;deleteglueref(q);end;
{:1584}{1739:}26:curval:=eqtb[51756].hh.rh;27:curval:=eqtb[51757].hh.rh;
{:1739}{1742:}28:curval:=eqtb[51758].hh.rh;{:1742}end;curvallevel:=0;
end else begin if curchr=2 then curval:=membot else curval:=0;
tx:=curlist.tailfield;
if not(tx>=himemmin)then if mem[tx].hh.b0=5 then tx:=curlist.pnodefield;
if not(tx>=himemmin)then if(mem[tx].hh.b0=5)or((mem[tx].hh.b0=11)and(mem
[tx].hh.b1=3))then begin r:=curlist.headfield;
q:=mem[curlist.headfield].hh.rh;
while q<>tx do begin if(q>=himemmin)then r:=q else if(mem[q].hh.b0<>5)
and((mem[q].hh.b0<>11)or(mem[q].hh.b1<>3))then r:=q;q:=mem[q].hh.rh;end;
tx:=r;end;if(curchr=3)or(curchr=4)then begin curvallevel:=0;
if(tx=curlist.headfield)or(curlist.modefield=0)then curval:=-1;
end else if curchr=5 then begin curvallevel:=0;curval:=-1;
end else if curchr=6 then begin if level<>5 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(764);
end;begin helpptr:=3;helpline[2]:=765;helpline[1]:=766;helpline[0]:=767;
end;backerror;begin curval:=0;curvallevel:=1;end;
end else begin curval:=40923;curvallevel:=4;end;
end else curvallevel:=curchr;
if(curchr=5)or(curchr=6)then if(tx>=himemmin)and(tx<>curlist.headfield)
then begin r:=curlist.headfield;q:=curlist.headfield;
while q<>tx do begin r:=q;q:=mem[q].hh.rh;end;
if(r<>curlist.headfield)and(r>=himemmin)then if fontdir[mem[r].hh.b0]<>0
then tx:=r;
if curchr=5 then if fontdir[mem[tx].hh.b0]<>0 then curval:=mem[mem[tx].
hh.rh].hh.lh mod 16777216 else curval:=mem[tx].hh.b1 else curval:=mem[tx
].hh.b0+40923;end;
if not(tx>=himemmin)and(tx<>curlist.headfield)and(curlist.modefield<>0)
then case curchr of 0:if mem[tx].hh.b0=14 then curval:=mem[tx+1].int;
1:if mem[tx].hh.b0=13 then curval:=mem[tx+1].int;
2:if mem[tx].hh.b0=12 then begin curval:=mem[tx+1].hh.lh;
if mem[tx].hh.b1=99 then curvallevel:=3;end;
3:if mem[tx].hh.b0<=15 then begin if mem[tx].hh.b0=2 then tx:=mem[tx+5].
hh.rh;curval:=mem[tx].hh.b0;
if curval<2 then curval:=curval+1 else if curval>5 then curval:=curval-1
;end else curval:=15;
4:if mem[tx].hh.b0<=15 then curval:=mem[tx].hh.b1 else begin curval:=mem
[tx].hh.b0;
if curval<19 then curval:=curval-16 else if curval=19 then curval:=
curval-16+mem[tx].hh.b1 else curval:=curval-14;end;
5:begin begin if((mem[tx].hh.b0=12)and(mem[tx].hh.b1=21))or((mem[tx].hh.
b0=14)and(mem[tx].hh.b1=2))then tx:=curlist.lastjchrfield else if(mem[tx
].hh.b0=13)and(mem[tx].hh.b1=0)then begin r:=curlist.headfield;
q:=mem[curlist.headfield].hh.rh;while q<>tx do begin r:=q;
if(q>=himemmin)then if fontdir[mem[q].hh.b0]<>0 then q:=mem[q].hh.rh;
q:=mem[q].hh.rh;end;
if((mem[r].hh.b0=14)and(mem[r].hh.b1=2))then tx:=curlist.lastjchrfield
else tx:=r;end;end;
if(tx>=himemmin)then if fontdir[mem[tx].hh.b0]<>0 then curval:=mem[mem[
tx].hh.rh].hh.lh mod 16777216 else curval:=mem[tx].hh.b1 else if mem[tx]
.hh.b0=8 then begin r:=mem[tx+1].hh.rh;
while mem[r].hh.rh<>-1073741823 do r:=mem[r].hh.rh;curval:=mem[r].hh.b1;
end end;
6:begin begin if((mem[tx].hh.b0=12)and(mem[tx].hh.b1=21))or((mem[tx].hh.
b0=14)and(mem[tx].hh.b1=2))then tx:=curlist.lastjchrfield else if(mem[tx
].hh.b0=13)and(mem[tx].hh.b1=0)then begin r:=curlist.headfield;
q:=mem[curlist.headfield].hh.rh;while q<>tx do begin r:=q;
if(q>=himemmin)then if fontdir[mem[q].hh.b0]<>0 then q:=mem[q].hh.rh;
q:=mem[q].hh.rh;end;
if((mem[r].hh.b0=14)and(mem[r].hh.b1=2))then tx:=curlist.lastjchrfield
else tx:=r;end;end;
if(tx>=himemmin)then curval:=mem[tx].hh.b0+40923 else if mem[tx].hh.b0=8
then curval:=mem[tx+1].hh.b0+40923 end;
end else if(curlist.modefield=1)and(tx=curlist.headfield)then case
curchr of 0:curval:=lastpenalty;1:curval:=lastkern;
2:if lastglue<>1073741823 then curval:=lastglue;3:curval:=lastnodetype;
4:curval:=lastnodesubtype;end;end{:461};
45:if curchr=1 then{405:}begin gettoken;
if curcs<23810 then curcs:=primlookup(curcs-11905)else curcs:=primlookup
(hash[curcs].rh);if curcs<>0 then begin curcmd:=eqtb[38822+curcs].hh.b0;
curchr:=eqtb[38822+curcs].hh.rh;curcs:=38822+curcs;
curtok:=536870911+curcs;end else begin curcmd:=0;curchr:=0;
curtok:=536909728;curcs:=38817;end;goto 20;end{:405};
others:{465:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(789);
end;printcmdchr(curcmd,curchr);print(790);printesc(609);
begin helpptr:=1;helpline[0]:=788;end;error;
if level<>5 then begin curval:=0;curvallevel:=1;
end else begin curval:=0;curvallevel:=0;end;end{:465}end;
while curvallevel>level do{466:}begin if curvallevel=2 then curval:=mem[
curval+1].int else if curvallevel=3 then muerror;decr(curvallevel);
end{:466};
{467:}if negative then if curvallevel>=2 then begin curval:=newspec(
curval);{468:}begin mem[curval+1].int:=-mem[curval+1].int;
mem[curval+2].int:=-mem[curval+2].int;
mem[curval+3].int:=-mem[curval+3].int;end{:468};
end else curval:=-curval else if(curvallevel>=2)and(curvallevel<=3)then
incr(mem[curval].hh.rh){:467};10:end;
{:449}{450:}procedure scansomethinginternalident;
begin scansomethinginternal(4,false);end;{:450}{477:}procedure scanint;
label 30,20;var negative:boolean;m:integer;d:smallnumber;
vacuous:boolean;OKsofar:boolean;begin radix:=0;OKsofar:=true;
{478:}negative:=false;repeat{442:}repeat getxtoken;
until curcmd<>10{:442};
if curtok=786477 then begin negative:=not negative;curtok:=786475;end;
until curtok<>786475{:478};20:if curtok=786528 then{479:}begin gettoken;
if curtok<536870911 then if(curcmd>=16)and(curcmd<=20)then begin
skipmode:=false;curval:=curchr;end else begin curval:=curchr;
if curcmd<=2 then if curcmd=2 then incr(alignstate)else decr(alignstate)
;end else if curtok<536882816 then curval:=curtok-536870912 else if
curtok<536894720 then curval:=curtok-536882816 else begin m:=hash[curtok
-536870911].rh;
if strstart[m+1]-strstart[m]=multistrlenshort(strpool,strstart[m+1],
strstart[m])then curval:=fromBUFFshort(strpool,strstart[m+1],strstart[m]
)else begin curcmd:=15;curval:=16777216;end;end;
if(curval>=11904)and(curcmd<16)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(807);
end;begin helpptr:=2;helpline[1]:=808;helpline[0]:=809;end;curval:=48;
backerror;end else{480:}begin getxtoken;if curcmd<>10 then backinput;
end{:480};skipmode:=true;
end{:479}else if curtok=536909732 then{405:}begin gettoken;
if curcs<23810 then curcs:=primlookup(curcs-11905)else curcs:=primlookup
(hash[curcs].rh);if curcs<>0 then begin curcmd:=eqtb[38822+curcs].hh.b0;
curchr:=eqtb[38822+curcs].hh.rh;curcs:=38822+curcs;
curtok:=536870911+curcs;end else begin curcmd:=0;curchr:=0;
curtok:=536909728;curcs:=38817;end;goto 20;
end{:405}else if(curcmd>=74)and(curcmd<=104)then scansomethinginternal(0
,false)else{481:}begin radix:=10;m:=214748364;
if curtok=786471 then begin radix:=8;m:=268435456;getxtoken;
end else if curtok=786466 then begin radix:=16;m:=134217728;getxtoken;
end;vacuous:=true;curval:=0;
{482:}while true do begin if(curtok<786480+radix)and(curtok>=786480)and(
curtok<=786489)then d:=curtok-786480 else if radix=16 then if(curtok<=
720966)and(curtok>=720961)then d:=curtok-720951 else if(curtok<=786502)
and(curtok>=786497)then d:=curtok-786487 else goto 30 else goto 30;
vacuous:=false;
if(curval>=m)and((curval>m)or(d>7)or(radix<>10))then begin if OKsofar
then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(810);
end;begin helpptr:=2;helpline[1]:=811;helpline[0]:=812;end;error;
curval:=2147483647;OKsofar:=false;end;end else curval:=curval*radix+d;
getxtoken;end;30:{:482};
if vacuous then{483:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(764);
end;begin helpptr:=3;helpline[2]:=765;helpline[1]:=766;helpline[0]:=767;
end;backerror;end{:483}else if curcmd<>10 then backinput;end{:481};
if negative then curval:=-curval;end;
{:477}{485:}procedure scandimen(mu,inf,shortcut:boolean);
label 30,31,32,40,45,88,89;var negative:boolean;f:integer;
{487:}num,denom:1..65536;k,kk:smallnumber;p,q:halfword;v:scaled;
savecurval:integer;{:487}{1678:}t:sixteenbits;{:1678}begin f:=0;
aritherror:=false;curorder:=0;negative:=false;
if not shortcut then begin{478:}negative:=false;
repeat{442:}repeat getxtoken;until curcmd<>10{:442};
if curtok=786477 then begin negative:=not negative;curtok:=786475;end;
until curtok<>786475{:478};
if(curcmd>=74)and(curcmd<=104)then{486:}if mu then begin
scansomethinginternal(3,false);
if curvallevel<>0 then begin{488:}if curvallevel>=2 then begin v:=mem[
curval+1].int;deleteglueref(curval);curval:=v;end{:488};
if curvallevel<>3 then muerror;goto 89;end;
end else begin scansomethinginternal(1,false);
if curvallevel=1 then goto 89;end{:486}else begin backinput;
if curtok=786476 then curtok:=786478;
if curtok<>786478 then scanint else begin radix:=10;curval:=0;end;
if curtok=786476 then curtok:=786478;
if(radix=10)and(curtok=786478)then{489:}begin k:=0;p:=-1073741823;
gettoken;while true do begin getxtoken;
if(curtok>786489)or(curtok<786480)then goto 31;
if k<17 then begin q:=getavail;mem[q].hh.rh:=p;
mem[q].hh.lh:=curtok-786480;p:=q;incr(k);end;end;
31:for kk:=k downto 1 do begin dig[kk-1]:=mem[p].hh.lh;q:=p;
p:=mem[p].hh.rh;begin mem[q].hh.rh:=avail;avail:=q;
ifdef('STAT')decr(dynused);endif('STAT')end;end;f:=rounddecimals(k);
if curcmd<>10 then backinput;end{:489};end;end;
if curval<0 then begin negative:=not negative;curval:=-curval;end;
{490:}if inf then{491:}if scankeyword(321)then begin curorder:=1;
while scankeyword(108)do begin if curorder=4 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(814);
end;print(815);begin helpptr:=1;helpline[0]:=816;end;error;
end else incr(curorder);end;goto 88;end{:491};{492:}savecurval:=curval;
{442:}repeat getxtoken;until curcmd<>10{:442};
if(curcmd<74)or(curcmd>104)then backinput else begin if mu then begin
scansomethinginternal(3,false);
{488:}if curvallevel>=2 then begin v:=mem[curval+1].int;
deleteglueref(curval);curval:=v;end{:488};
if curvallevel<>3 then muerror;end else scansomethinginternal(1,false);
v:=curval;goto 40;end;if mu then goto 45;
if scankeyword(817)then v:=({596:}fontinfo[6+parambase[eqtb[50985].hh.rh
]].int{:596})else if scankeyword(818)then v:=({597:}fontinfo[5+parambase
[eqtb[50985].hh.rh]].int{:597})else if scankeyword(819)then{1679:}if
curlist.dirfield=3 then v:=fontinfo[widthbase[eqtb[51755].hh.rh]+
fontinfo[charbase[eqtb[51755].hh.rh]+0].qqqq.b0].int else v:=fontinfo[
widthbase[eqtb[51754].hh.rh]+fontinfo[charbase[eqtb[51754].hh.rh]+0].
qqqq.b0].int{:1679}else if scankeyword(820)then{1680:}if curlist.
dirfield=3 then begin t:=fontinfo[charbase[eqtb[51755].hh.rh]+0].qqqq.b1
;v:=fontinfo[heightbase[eqtb[51755].hh.rh]+(t)div 256].int+fontinfo[
depthbase[eqtb[51755].hh.rh]+(t)mod 256].int;
end else begin t:=fontinfo[charbase[eqtb[51754].hh.rh]+0].qqqq.b1;
v:=fontinfo[heightbase[eqtb[51754].hh.rh]+(t)div 256].int+fontinfo[
depthbase[eqtb[51754].hh.rh]+(t)mod 256].int;end{:1680}else goto 45;
{480:}begin getxtoken;if curcmd<>10 then backinput;end{:480};
40:curval:=multandadd(savecurval,v,xnoverd(v,f,65536),1073741823);
goto 89;45:{:492};
if mu then{493:}if scankeyword(348)then goto 88 else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(814);
end;print(821);begin helpptr:=4;helpline[3]:=822;helpline[2]:=823;
helpline[1]:=824;helpline[0]:=825;end;error;goto 88;end{:493};
if scankeyword(813)then{494:}begin preparemag;
if eqtb[114378].int<>1000 then begin curval:=xnoverd(curval,1000,eqtb[
114378].int);f:=(1000*f+65536*texremainder)div eqtb[114378].int;
curval:=curval+(f div 65536);f:=f mod 65536;end;end{:494};
if scankeyword(425)then goto 88;
{495:}if scankeyword(826)then begin num:=7227;denom:=100;
end else if scankeyword(827)then begin num:=12;denom:=1;
end else if scankeyword(828)then begin num:=7227;denom:=254;
end else if scankeyword(829)then begin num:=7227;denom:=2540;
end else if scankeyword(830)then begin num:=7227;denom:=7200;
end else if scankeyword(831)then begin num:=1238;denom:=1157;
end else if scankeyword(832)then begin num:=14856;denom:=1157;
end else if scankeyword(72)then begin num:=7227;denom:=10160;
end else if scankeyword(81)then begin num:=7227;denom:=10160;
end else if scankeyword(833)then goto 30 else{496:}begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(814);
end;print(834);begin helpptr:=6;helpline[5]:=835;helpline[4]:=836;
helpline[3]:=837;helpline[2]:=823;helpline[1]:=824;helpline[0]:=825;end;
error;goto 32;end{:496};curval:=xnoverd(curval,num,denom);
f:=(num*f+65536*texremainder)div denom;curval:=curval+(f div 65536);
f:=f mod 65536;32:{:495};
88:if curval>=16384 then aritherror:=true else curval:=curval*65536+f;
30:{:490};{480:}begin getxtoken;if curcmd<>10 then backinput;end{:480};
89:if aritherror or(abs(curval)>=1073741824)then{497:}begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(838);
end;begin helpptr:=2;helpline[1]:=839;helpline[0]:=840;end;error;
curval:=1073741823;aritherror:=false;end{:497};
if negative then curval:=-curval;end;
{:485}{498:}procedure scanglue(level:smallnumber);label 10;
var negative:boolean;q:halfword;mu:boolean;begin mu:=(level=3);
{478:}negative:=false;repeat{442:}repeat getxtoken;
until curcmd<>10{:442};
if curtok=786477 then begin negative:=not negative;curtok:=786475;end;
until curtok<>786475{:478};
if(curcmd>=74)and(curcmd<=104)then begin scansomethinginternal(level,
negative);
if curvallevel>=2 then begin if curvallevel<>level then muerror;goto 10;
end;if curvallevel=0 then scandimen(mu,false,true)else if level=3 then
muerror;end else begin backinput;scandimen(mu,false,false);
if negative then curval:=-curval;end;{499:}q:=newspec(membot);
mem[q+1].int:=curval;
if scankeyword(841)then begin scandimen(mu,true,false);
mem[q+2].int:=curval;mem[q].hh.b0:=curorder;end;
if scankeyword(842)then begin scandimen(mu,true,false);
mem[q+3].int:=curval;mem[q].hh.b1:=curorder;end;curval:=q{:499};10:end;
{1563:}{1574:}function addorsub(x,y,maxanswer:integer;
negative:boolean):integer;var a:integer;begin if negative then y:=-y;
if x>=0 then if y<=maxanswer-x then a:=x+y else begin aritherror:=true;
a:=0;
end else if y>=-maxanswer-x then a:=x+y else begin aritherror:=true;
a:=0;end;addorsub:=a;end;
{:1574}{1578:}function quotient(n,d:integer):integer;
var negative:boolean;a:integer;begin if d=0 then begin aritherror:=true;
a:=0;end else begin if d>0 then negative:=false else begin d:=-d;
negative:=true;end;if n<0 then begin n:=-n;negative:=not negative;end;
a:=n div d;n:=n-a*d;d:=n-d;if d+n>=0 then incr(a);
if negative then a:=-a;end;quotient:=a;end;
{:1578}{1580:}function fract(x,n,d,maxanswer:integer):integer;
label 40,41,88,30;var negative:boolean;a:integer;f:integer;h:integer;
r:integer;t:integer;begin if d=0 then goto 88;a:=0;
if d>0 then negative:=false else begin d:=-d;negative:=true;end;
if x<0 then begin x:=-x;negative:=not negative;
end else if x=0 then goto 30;if n<0 then begin n:=-n;
negative:=not negative;end;t:=n div d;if t>maxanswer div x then goto 88;
a:=t*x;n:=n-t*d;if n=0 then goto 40;t:=x div d;
if t>(maxanswer-a)div n then goto 88;a:=a+t*n;x:=x-t*d;
if x=0 then goto 40;if x<n then begin t:=x;x:=n;n:=t;end;{1581:}f:=0;
r:=(d div 2)-d;h:=-r;while true do begin if odd(n)then begin r:=r+x;
if r>=0 then begin r:=r-d;incr(f);end;end;n:=n div 2;
if n=0 then goto 41;if x<h then x:=x+x else begin t:=x-d;x:=t+x;f:=f+n;
if x<n then begin if x=0 then goto 41;t:=x;x:=n;n:=t;end;end;end;
41:{:1581}if f>(maxanswer-a)then goto 88;a:=a+f;
40:if negative then a:=-a;goto 30;88:begin aritherror:=true;a:=0;end;
30:fract:=a;end;{:1580}procedure scanexpr;label 20,22,40;
var a,b:boolean;l:smallnumber;r:smallnumber;s:smallnumber;o:smallnumber;
e:integer;t:integer;f:integer;n:integer;p:halfword;q:halfword;
begin l:=curvallevel;a:=aritherror;b:=false;p:=-1073741823;
incr(expanddepthcount);
if expanddepthcount>=expanddepth then overflow(713,expanddepth);
{1564:}20:r:=0;e:=0;s:=0;t:=0;n:=0;22:if s=0 then o:=l else o:=0;
{1566:}{442:}repeat getxtoken;until curcmd<>10{:442};
if curtok=786472 then{1569:}begin q:=getnode(4);mem[q].hh.rh:=p;
mem[q].hh.b0:=l;mem[q].hh.b1:=4*s+r;mem[q+1].int:=e;mem[q+2].int:=t;
mem[q+3].int:=n;p:=q;l:=o;goto 20;end{:1569};backinput;
if o=0 then scanint else if o=1 then scandimen(false,false,false)else if
o=2 then scannormalglue else scanmuglue;f:=curval{:1566};
40:{1565:}{442:}repeat getxtoken;until curcmd<>10{:442};
if curtok=786475 then o:=1 else if curtok=786477 then o:=2 else if
curtok=786474 then o:=3 else if curtok=786479 then o:=4 else begin o:=0;
if p=-1073741823 then begin if curcmd<>0 then backinput;
end else if curtok<>786473 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1632);
end;begin helpptr:=1;helpline[0]:=1633;end;backerror;end;end{:1565};
aritherror:=b;
{1571:}if(l=0)or(s>2)then begin if(f>2147483647)or(f<-2147483647)then
begin aritherror:=true;f:=0;end;
end else if l=1 then begin if abs(f)>1073741823 then begin aritherror:=
true;f:=0;end;
end else begin if(abs(mem[f+1].int)>1073741823)or(abs(mem[f+2].int)>
1073741823)or(abs(mem[f+3].int)>1073741823)then begin aritherror:=true;
deleteglueref(f);f:=newspec(membot);end;end{:1571};
case s of{1572:}0:if(l>=2)and(o<>0)then begin t:=newspec(f);
deleteglueref(f);if mem[t+2].int=0 then mem[t].hh.b0:=0;
if mem[t+3].int=0 then mem[t].hh.b1:=0;end else t:=f;
{:1572}{1576:}3:if o=4 then begin n:=f;o:=5;
end else if l=0 then t:=multandadd(t,f,0,2147483647)else if l=1 then t:=
multandadd(t,f,0,1073741823)else begin mem[t+1].int:=multandadd(mem[t+1]
.int,f,0,1073741823);
mem[t+2].int:=multandadd(mem[t+2].int,f,0,1073741823);
mem[t+3].int:=multandadd(mem[t+3].int,f,0,1073741823);end;
{:1576}{1577:}4:if l<2 then t:=quotient(t,f)else begin mem[t+1].int:=
quotient(mem[t+1].int,f);mem[t+2].int:=quotient(mem[t+2].int,f);
mem[t+3].int:=quotient(mem[t+3].int,f);end;
{:1577}{1579:}5:if l=0 then t:=fract(t,n,f,2147483647)else if l=1 then t
:=fract(t,n,f,1073741823)else begin mem[t+1].int:=fract(mem[t+1].int,n,f
,1073741823);mem[t+2].int:=fract(mem[t+2].int,n,f,1073741823);
mem[t+3].int:=fract(mem[t+3].int,n,f,1073741823);end;{:1579}end;
if o>2 then s:=o else{1573:}begin s:=0;
if r=0 then e:=t else if l=0 then e:=addorsub(e,t,2147483647,r=2)else if
l=1 then e:=addorsub(e,t,1073741823,r=2)else{1575:}begin mem[e+1].int:=
addorsub(mem[e+1].int,mem[t+1].int,1073741823,r=2);
if mem[e].hh.b0=mem[t].hh.b0 then mem[e+2].int:=addorsub(mem[e+2].int,
mem[t+2].int,1073741823,r=2)else if(mem[e].hh.b0<mem[t].hh.b0)and(mem[t
+2].int<>0)then begin mem[e+2].int:=mem[t+2].int;
mem[e].hh.b0:=mem[t].hh.b0;end;
if mem[e].hh.b1=mem[t].hh.b1 then mem[e+3].int:=addorsub(mem[e+3].int,
mem[t+3].int,1073741823,r=2)else if(mem[e].hh.b1<mem[t].hh.b1)and(mem[t
+3].int<>0)then begin mem[e+3].int:=mem[t+3].int;
mem[e].hh.b1:=mem[t].hh.b1;end;deleteglueref(t);
if mem[e+2].int=0 then mem[e].hh.b0:=0;
if mem[e+3].int=0 then mem[e].hh.b1:=0;end{:1575};r:=o;end{:1573};
b:=aritherror;if o<>0 then goto 22;
if p<>-1073741823 then{1570:}begin f:=e;q:=p;e:=mem[q+1].int;
t:=mem[q+2].int;n:=mem[q+3].int;s:=mem[q].hh.b1 div 4;
r:=mem[q].hh.b1 mod 4;l:=mem[q].hh.b0;p:=mem[q].hh.rh;freenode(q,4);
goto 40;end{:1570}{:1564};decr(expanddepthcount);
if b then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1422);
end;begin helpptr:=2;helpline[1]:=1631;helpline[0]:=1424;end;error;
if l>=2 then begin deleteglueref(e);e:=membot;incr(mem[e].hh.rh);
end else e:=0;end;aritherror:=a;curval:=e;curvallevel:=l;end;
{:1563}{1568:}procedure scannormalglue;begin scanglue(2);end;
procedure scanmuglue;begin scanglue(3);end;
{:1568}{:498}{500:}function scanrulespec:halfword;label 21;
var q:halfword;begin q:=newrule;
if curcmd=41 then mem[q+1].int:=26214 else begin mem[q+3].int:=26214;
mem[q+2].int:=0;end;
21:if scankeyword(843)then begin scandimen(false,false,false);
mem[q+1].int:=curval;goto 21;end;
if scankeyword(844)then begin scandimen(false,false,false);
mem[q+3].int:=curval;goto 21;end;
if scankeyword(845)then begin scandimen(false,false,false);
mem[q+2].int:=curval;goto 21;end;scanrulespec:=q;end;
{:500}{501:}{1460:}procedure scangeneraltext;label 40;var s:0..5;
w:halfword;d:halfword;p:halfword;q:halfword;unbalance:halfword;
begin s:=scannerstatus;w:=warningindex;d:=defref;scannerstatus:=5;
warningindex:=curcs;defref:=getavail;mem[defref].hh.lh:=-1073741823;
p:=defref;scanleftbrace;unbalance:=1;while true do begin gettoken;
if curtok<196608 then if curcmd<2 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 40;end;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;
40:q:=mem[defref].hh.rh;begin mem[defref].hh.rh:=avail;avail:=defref;
ifdef('STAT')decr(dynused);endif('STAT')end;
if q=-1073741823 then curval:=memtop-3 else curval:=p;
mem[memtop-3].hh.rh:=q;scannerstatus:=s;warningindex:=w;defref:=d;end;
{:1460}{1534:}procedure pseudostart;var oldsetting:0..21;s:strnumber;
l,m:poolpointer;p,q,r:halfword;w:fourquarters;nl,sz:integer;
begin scangeneraltext;oldsetting:=selector;selector:=21;
tokenshow(memtop-3);selector:=oldsetting;flushlist(mem[memtop-3].hh.rh);
begin if poolptr+1>poolsize then overflow(260,poolsize-initpoolptr);end;
s:=makestring;{1535:}strpool[poolptr]:=32;l:=strstart[s];
nl:=eqtb[114411].int;p:=getavail;q:=p;while l<poolptr do begin m:=l;
while(l<poolptr)and(strpool[l]<>nl)do incr(l);sz:=(l-m+7)div 4;
if sz=1 then sz:=2;r:=getnode(sz);mem[q].hh.rh:=r;q:=r;mem[q].hh.lh:=sz;
while sz>2 do begin decr(sz);incr(r);w.b0:=strpool[m];
w.b1:=strpool[m+1];w.b2:=strpool[m+2];w.b3:=strpool[m+3];mem[r].qqqq:=w;
m:=m+4;end;w.b0:=32;w.b1:=32;w.b2:=32;w.b3:=32;
if l>m then begin w.b0:=strpool[m];
if l>m+1 then begin w.b1:=strpool[m+1];
if l>m+2 then begin w.b2:=strpool[m+2];if l>m+3 then w.b3:=strpool[m+3];
end;end;end;mem[r+1].qqqq:=w;if strpool[l]=nl then incr(l);end;
mem[p].hh.lh:=mem[p].hh.rh;mem[p].hh.rh:=pseudofiles;
pseudofiles:=p{:1535};begin decr(strptr);poolptr:=strstart[strptr];end;
{1536:}beginfilereading;line:=0;
curinput.limitfield:=curinput.startfield;
curinput.locfield:=curinput.limitfield+1;
if eqtb[114433].int>0 then begin if termoffset>maxprintline-3 then
println else if(termoffset>0)or(fileoffset>0)then printchar(32);
curinput.namefield:=19;print(1616);incr(openparens);fflush(stdout);
end else begin curinput.namefield:=18;
{1759:}curinput.synctextagfield:=0;{:1759};end{:1536};end;
{:1534}function strtokscat(b:poolpointer;cat:smallnumber):halfword;
var p:halfword;q:halfword;t:halfword;k:poolpointer;cc:0..20;
begin begin if poolptr+1>poolsize then overflow(260,poolsize-initpoolptr
);end;p:=memtop-3;mem[p].hh.rh:=-1073741823;k:=b;
while k<poolptr do begin t:=strpool[k];
if t>=384 then begin t:=fromBUFFshort(strpool,poolptr,k);
cc:=eqtb[63663+kcatcodekey(t)].hh.rh;if(cc=14)then cc:=12;
if(cat>=16)and(cat<=20)then cc:=cat else if(cc=15)then cc:=18;
if(cc=16)and(t>=16777216)then cc:=23;t:=t+cc*16777216;
k:=k+multistrlenshort(strpool,poolptr,k)-1;end else begin t:=strpool[k];
if t>=256 then t:=t-256;
if(t=32)and(cat=0)then t:=655392 else if(cat=0)or((cat>=16)and(cat<=20))
then t:=786432+t else if cat=13 then t:=536870912+t else t:=65536*cat+t;
end;begin begin q:=avail;
if q=-1073741823 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-1073741823;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=t;p:=q;end;incr(k);end;poolptr:=b;
strtokscat:=p;end;function strtoks(b:poolpointer):halfword;
begin strtoks:=strtokscat(b,0);end;
{:501}{502:}function thetoks:halfword;label 10;var oldsetting:0..21;
p,q,r:halfword;b:poolpointer;c:smallnumber;
begin{1465:}if odd(curchr)then begin c:=curchr;scangeneraltext;
if c=1 then thetoks:=curval else begin oldsetting:=selector;
selector:=21;b:=poolptr;p:=getavail;mem[p].hh.rh:=mem[memtop-3].hh.rh;
tokenshow(p);flushlist(p);selector:=oldsetting;thetoks:=strtoks(b);end;
goto 10;end{:1465};getxtoken;scansomethinginternal(5,false);
if curvallevel>=4 then{503:}begin p:=memtop-3;mem[p].hh.rh:=-1073741823;
if curvallevel=4 then begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=536870911+curval;p:=q;
end else if curval<>-1073741823 then begin r:=mem[curval].hh.rh;
while r<>-1073741823 do begin begin begin q:=avail;
if q=-1073741823 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-1073741823;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=mem[r].hh.lh;p:=q;end;r:=mem[r].hh.rh;
end;end;thetoks:=p;end{:503}else begin oldsetting:=selector;
selector:=21;b:=poolptr;case curvallevel of 0:printint(curval);
1:begin printscaled(curval);print(425);end;
2:begin printspec(curval,425);deleteglueref(curval);end;
3:begin printspec(curval,348);deleteglueref(curval);end;end;
selector:=oldsetting;thetoks:=strtoks(b);end;10:end;
{:502}{504:}procedure insthetoks;begin mem[memtop-12].hh.rh:=thetoks;
begintokenlist(mem[memtop-3].hh.rh,4);end;
{:504}{508:}procedure convtoks;var oldsetting:0..21;cx:KANJIcode;
c:0..28;savescannerstatus:smallnumber;savedefref:halfword;
savewarningindex:halfword;booltemp:boolean;u:strnumber;s:strnumber;
i:integer;j:integer;cat:smallnumber;b:poolpointer;begin cat:=0;
c:=curchr;u:=0;{509:}cx:=0;case c of 0,1,2,6,7,8,9,10,11,12:scanint;
13:scanfontident;14,15:;3,4:begin savescannerstatus:=scannerstatus;
scannerstatus:=0;gettoken;if(curcmd>=16)and(curcmd<=20)then cx:=curtok;
scannerstatus:=savescannerstatus;end;5:scanfontident;16:;
17:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring else u:=0;scanpdfexttoks;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
begintokenlist(mem[defref].hh.rh,4);begin mem[defref].hh.rh:=avail;
avail:=defref;ifdef('STAT')decr(dynused);endif('STAT')end;
defref:=savedefref;if u<>0 then decr(strptr);goto 10;end;
18:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring else u:=0;comparestrings;
defref:=savedefref;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;if u<>0 then decr(strptr);end;
19:begin b:=poolptr;getcreationdate;mem[memtop-12].hh.rh:=strtoks(b);
begintokenlist(mem[memtop-3].hh.rh,4);goto 10;end;
20:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring else u:=0;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;getfilemoddate(s);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then decr(strptr);goto 10;end;
21:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring else u:=0;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;getfilesize(s);mem[memtop-12].hh.rh:=strtoks(b);flushstr(s);
begintokenlist(mem[memtop-3].hh.rh,4);if u<>0 then decr(strptr);goto 10;
end;22:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring else u:=0;
booltemp:=scankeyword(875);scanpdfexttoks;
if booltemp then s:=tokenstostring(defref)else begin isprintutf8:=true;
s:=tokenstostring(defref);isprintutf8:=false;end;deletetokenref(defref);
defref:=savedefref;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;b:=poolptr;getmd5sum(s,booltemp);
mem[memtop-12].hh.rh:=strtoks(b);flushstr(s);
begintokenlist(mem[memtop-3].hh.rh,4);if u<>0 then decr(strptr);goto 10;
end;23:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring else u:=0;curval:=0;
if(scankeyword(876))then begin scanint;
if(curval<0)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(877);
end;begin helpptr:=2;helpline[1]:=878;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;i:=curval;curval:=0;
if(scankeyword(879))then begin scanint;
if(curval<0)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(880);
end;begin helpptr:=2;helpline[1]:=881;helpline[0]:=761;end;
interror(curval);curval:=0;end;end;j:=curval;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;getfiledump(s,i,j);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then decr(strptr);goto 10;end;24:scanint;25:;
26:begin scancharnum;
if not checkecharrange(curval)then if eqtb[63663+kcatcodekey(curval)].hh
.rh=15 then cat:=18;end;27:begin scancharnum;i:=curval;scanint;
if i<=127 then begin if(curval<1)or(curval>13)or(curval=5)or(curval=9)
then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(882);
end;printint(curval);print(883);begin helpptr:=1;helpline[0]:=884;end;
error;cat:=12;end else cat:=curval;
end else if checkecharrange(i)then begin if((curval<1)or(curval>13)or(
curval=5)or(curval=9))and((curval<16)or(curval>20))then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(882);
end;printint(curval);print(885);begin helpptr:=1;helpline[0]:=884;end;
error;cat:=12;end else cat:=curval;
end else begin if(curval<16)or(curval>20)then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(265);
print(882);end;printint(curval);print(886);begin helpptr:=1;
helpline[0]:=887;end;error;cat:=18;end else cat:=curval;end;curval:=i;
end;28:if jobname=0 then openlogfile;end{:509};oldsetting:=selector;
selector:=21;b:=poolptr;{510:}case c of 0:printint(curval);
1:printromanint(curval);2:printkansuji(curval);
8:begin curval:=fromJIS(curval);
if curval=0 then printint(-1)else printint(curval);end;
6:begin curval:=fromEUC(curval);
if curval=0 then printint(-1)else printint(curval);end;
7:begin curval:=fromSJIS(curval);
if curval=0 then printint(-1)else printint(curval);end;
9:begin curval:=fromKUTEN(curval);
if curval=0 then printint(-1)else printint(curval);end;
10:if(isinternalUPTEX)then printint(fromUCS(curval))else begin curval:=
fromUCS(curval);if curval=0 then printint(-1)else printint(curval);end;
11:if(isinternalUPTEX)then printint(toUCS(curval))else begin curval:=
toUCS(curval);if curval=0 then printint(-1)else printint(curval);end;
12:begin curval:=toJIS(curval);
if curval=0 then printint(-1)else printint(curval);end;
13:begin printfontnameandsize(curval);printfontdirandenc(curval);end;
14:print(257);15:print(258);
3:if curcs<>0 then sprintcs(curcs)else if cx=0 then printchar(curchr)
else printkanji(cx);4:printmeaning;5:begin print(fontname[curval]);
if fontsize[curval]<>fontdsize[curval]then begin print(888);
printscaled(fontsize[curval]);print(425);end;end;16:print(256);
18:printint(curval);24:printint(unifrand(curval));25:printint(normrand);
26:if checkecharrange(curval)>1 then printchar(curval)else printkanji(
curval);
27:if(cat<16)and(checkecharrange(curval)>1)then printchar(curval)else
printkanji(curval);28:print(jobname);end{:510};selector:=oldsetting;
mem[memtop-12].hh.rh:=strtokscat(b,cat);
begintokenlist(mem[memtop-3].hh.rh,4);end;
{:508}{511:}function scantoks(macrodef,xpand:boolean):halfword;
label 40,22,30,31,32;var t:halfword;s:halfword;p:halfword;q:halfword;
unbalance:halfword;hashbrace:halfword;
begin if macrodef then scannerstatus:=2 else scannerstatus:=5;
warningindex:=curcs;defref:=getavail;mem[defref].hh.lh:=-1073741823;
p:=defref;hashbrace:=0;t:=786480;
if macrodef then{512:}begin while true do begin 22:gettoken;
if curtok<196608 then goto 31;
if curcmd=6 then{514:}begin s:=851968+curchr;gettoken;
if curtok<131072 then begin hashbrace:=curtok;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=917504;p:=q;end;goto 30;end;
if t=786489 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(891);
end;begin helpptr:=2;helpline[1]:=892;helpline[0]:=893;end;error;
goto 22;end else begin incr(t);
if curtok<>t then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(894);
end;begin helpptr:=2;helpline[1]:=895;helpline[0]:=896;end;backerror;
end;curtok:=s;end;end{:514};begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end;31:begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=917504;p:=q;end;
if curcmd=2 then{513:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(752);
end;incr(alignstate);begin helpptr:=2;helpline[1]:=889;helpline[0]:=890;
end;error;goto 40;end{:513};30:end{:512}else scanleftbrace;
{515:}unbalance:=1;
while true do begin if xpand then{516:}begin while true do begin getnext
;if curcmd>=129 then if mem[mem[curchr].hh.rh].hh.lh=917505 then begin
curcmd:=0;curchr:=16777217;end;if curcmd<=118 then goto 32;
if curcmd<>127 then expand else begin q:=thetoks;
if mem[memtop-3].hh.rh<>-1073741823 then begin mem[p].hh.rh:=mem[memtop
-3].hh.rh;p:=q;end;end;end;32:xtoken end{:516}else gettoken;
if curtok<196608 then if curcmd<2 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 40;
end else if curcmd=6 then if macrodef then{517:}begin s:=curtok;
if xpand then getxtoken else gettoken;
if curcmd<>6 then if(curtok<=786480)or(curtok>t)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(897);
end;sprintcs(warningindex);begin helpptr:=3;helpline[2]:=898;
helpline[1]:=899;helpline[0]:=900;end;backerror;curtok:=s;
end else curtok:=327632+curchr;end{:517};begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end{:515};
40:scannerstatus:=0;if hashbrace<>0 then begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=hashbrace;p:=q;end;scantoks:=p;end;
{:511}{520:}procedure readtoks(n:integer;r:halfword;j:halfword);
label 30;var p:halfword;q:halfword;s:integer;m:smallnumber;
begin scannerstatus:=2;warningindex:=r;defref:=getavail;
mem[defref].hh.lh:=-1073741823;p:=defref;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=917504;p:=q;end;
if(n<0)or(n>15)then m:=16 else m:=n;s:=alignstate;alignstate:=1000000;
repeat{521:}beginfilereading;curinput.namefield:=m+1;
if readopen[m]=2 then{522:}if interaction>1 then if n<0 then begin;
print(349);terminput;end else begin;println;sprintcs(r);begin;print(61);
terminput;end;n:=-1;end else begin curinput.limitfield:=0;
fatalerror(901);
end{:522}else if readopen[m]=1 then{523:}if inputln(readfile[m],false)
then readopen[m]:=0 else begin aclose(readfile[m]);readopen[m]:=2;
end{:523}else{524:}begin if not inputln(readfile[m],true)then begin
aclose(readfile[m]);readopen[m]:=2;
if alignstate<>1000000 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(902);
end;printesc(606);begin helpptr:=1;helpline[0]:=903;end;
alignstate:=1000000;curinput.limitfield:=0;error;end;end;end{:524};
curinput.limitfield:=last;
if(eqtb[114410].int<0)or(eqtb[114410].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[114410].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
curinput.statefield:=85;
{1542:}if j=1 then begin while curinput.locfield<=curinput.limitfield do
begin curchr:=fromBUFF(ustringcast(buffer),curinput.limitfield+1,
curinput.locfield);curtok:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
if(multistrlen(ustringcast(buffer),curinput.limitfield+1,curinput.
locfield)>1)and checkkcatcode(curtok,curchr)then begin if(curtok=15)then
curtok:=18;if(curtok=14)then curtok:=11;curtok:=curchr+curtok*16777216;
curinput.locfield:=curinput.locfield+multistrlen(ustringcast(buffer),
curinput.limitfield+1,curinput.locfield);
end else begin curchr:=buffer[curinput.locfield];
incr(curinput.locfield);
if curchr=32 then curtok:=655392 else curtok:=curchr+786432;end;
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;
goto 30;end{:1542};while true do begin gettoken;
if curtok=0 then goto 30;
if alignstate<1000000 then begin repeat gettoken;until curtok=0;
alignstate:=1000000;goto 30;end;begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end;30:endfilereading{:521};
until alignstate=1000000;curval:=defref;scannerstatus:=0;alignstate:=s;
end;{:520}{532:}procedure passtext;label 30;var l:integer;
savescannerstatus:smallnumber;begin savescannerstatus:=scannerstatus;
scannerstatus:=1;l:=0;skipline:=line;while true do begin getnext;
if curcmd=124 then begin if l=0 then goto 30;if curchr=2 then decr(l);
end else if curcmd=123 then incr(l);end;
30:scannerstatus:=savescannerstatus;
if eqtb[114432].int>0 then showcurcmdchr;end;
{:532}{535:}procedure changeiflimit(l:smallnumber;p:halfword);label 10;
var q:halfword;begin if p=condptr then iflimit:=l else begin q:=condptr;
while true do begin if q=-1073741823 then confusion(904);
if mem[q].hh.rh=p then begin mem[q].hh.b0:=l;goto 10;end;
q:=mem[q].hh.rh;end;end;10:end;{:535}{536:}procedure conditional;
label 10,50;var b:boolean;e:boolean;r:60..62;m,n,s,v,nn,jj:integer;
p,q:halfword;savescannerstatus:smallnumber;savecondptr:halfword;
thisif:smallnumber;isunless:boolean;
begin if eqtb[114432].int>0 then if eqtb[114397].int<=1 then
showcurcmdchr;{533:}begin p:=getnode(2);mem[p].hh.rh:=condptr;
mem[p].hh.b0:=iflimit;mem[p].hh.b1:=curif;mem[p+1].int:=ifline;
condptr:=p;curif:=curchr;iflimit:=1;ifline:=line;end{:533};
savecondptr:=condptr;isunless:=(curchr>=32);thisif:=curchr mod 32;
{539:}case thisif of 0,1:{544:}begin begin getxtoken;
if curcmd=0 then if curchr=16777217 then begin curcmd:=13;
curchr:=curtok-536870912;end;end;
if(curcmd>=16)and(curcmd<=20)then begin m:=curcmd;n:=curchr;
end else if(curcmd>13)or(curchr>=11904)then begin m:=0;n:=16777216;
end else begin m:=curcmd;n:=curchr;end;begin getxtoken;
if curcmd=0 then if curchr=16777217 then begin curcmd:=13;
curchr:=curtok-536870912;end;end;
if(curcmd>=16)and(curcmd<=20)then begin curcmd:=curcmd;
end else if(curcmd>13)or(curchr>=11904)then begin curcmd:=0;
curchr:=16777216;end;if thisif=0 then b:=(n=curchr)else b:=(m=curcmd);
end{:544};
2,3:{541:}begin if thisif=2 then scanint else scandimen(false,false,
false);n:=curval;{442:}repeat getxtoken;until curcmd<>10{:442};
if(curtok>=786492)and(curtok<=786494)then r:=curtok-786432 else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(939);
end;printcmdchr(123,thisif);begin helpptr:=1;helpline[0]:=940;end;
backerror;r:=61;end;
if thisif=2 then scanint else scandimen(false,false,false);
case r of 60:b:=(n<curval);61:b:=(n=curval);62:b:=(n>curval);end;
end{:541};4:{542:}begin scanint;b:=odd(curval);end{:542};
5:b:=(abs(curlist.modefield)=1);6:b:=(abs(curlist.modefield)=120);
7:b:=(abs(curlist.modefield)=239);8:b:=(curlist.modefield<0);
22:b:=(abs(curlist.dirfield)=3);23:b:=(abs(curlist.dirfield)=4);
24:b:=(abs(curlist.dirfield)=1);25:b:=(curlist.dirfield<0);
26,27,28,29,9,10,11:{543:}begin scanregisternum;
if curval<256 then p:=eqtb[50729+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-1073741823 then p:=-1073741823 else p:=mem[curptr+1].hh.rh;
end;
if thisif=9 then b:=(p=-1073741823)else if p=-1073741823 then b:=false
else begin if mem[p].hh.b0=2 then p:=mem[p+5].hh.rh;
if thisif=10 then b:=(mem[p].hh.b0=0)else if thisif=11 then b:=(mem[p].
hh.b0=1)else if thisif=26 then b:=(abs(((mem[p].hh.b1)mod 16-5))=3)else
if thisif=27 then b:=(abs(((mem[p].hh.b1)mod 16-5))=4)else if thisif=28
then b:=(abs(((mem[p].hh.b1)mod 16-5))=1)else b:=(((mem[p].hh.b1)mod 16
-5)<0);end end{:543};21:begin savescannerstatus:=scannerstatus;
scannerstatus:=0;getnext;scannerstatus:=savescannerstatus;
if curcs<23810 then m:=primlookup(curcs-11905)else m:=primlookup(hash[
curcs].rh);
b:=((curcmd<>119)and(m<>0)and(curcmd=eqtb[38822+m].hh.b0)and(curchr=eqtb
[38822+m].hh.rh));end;30,31:begin scanfontident;
if thisif=30 then b:=(fontdir[curval]=4)else if thisif=31 then b:=(
fontdir[curval]=3);end;12:{545:}begin savescannerstatus:=scannerstatus;
scannerstatus:=0;getnext;n:=curcs;p:=curcmd;q:=curchr;getnext;
if curcmd<>p then b:=false else if curcmd<129 then b:=(curchr=q)else
{546:}begin p:=mem[curchr].hh.rh;q:=mem[eqtb[n].hh.rh].hh.rh;
if p=q then b:=true else begin while(p<>-1073741823)and(q<>-1073741823)
do if mem[p].hh.lh<>mem[q].hh.lh then p:=-1073741823 else begin p:=mem[p
].hh.rh;q:=mem[q].hh.rh;end;b:=((p=-1073741823)and(q=-1073741823));end;
end{:546};scannerstatus:=savescannerstatus;end{:545};
13:begin scanfourbitintor18;
if curval=18 then b:=not shellenabledp else b:=(readopen[curval]=2);end;
14:b:=true;15:b:=false;{1547:}17:begin savescannerstatus:=scannerstatus;
scannerstatus:=0;getnext;b:=(curcmd<>119);
scannerstatus:=savescannerstatus;end;{:1547}{1548:}18:begin n:=getavail;
p:=n;e:=isincsname;isincsname:=true;repeat getxtoken;
if curcs=0 then begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;
p:=q;end;until curcs<>0;
if curcmd<>73 then{409:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(720);
end;printesc(569);print(721);begin helpptr:=2;helpline[1]:=722;
helpline[0]:=723;end;backerror;end{:409};{1549:}m:=first;
p:=mem[n].hh.rh;
while p<>-1073741823 do begin if m>=maxbufstack then begin maxbufstack:=
m+1;if maxbufstack=bufsize then overflow(259,bufsize);end;
if checkkanji(mem[p].hh.lh)then begin if(isinternalUPTEX)then begin s:=
toUCS(ktokentochr(mem[p].hh.lh));nn:=UVSgetcodepointlength(s);jj:=1;
while jj<=nn do begin v:=UVSgetcodepointinsequence(s,jj);
if(v>0)then begin v:=UCStoUTF8(v);
if BYTE1(v)<>0 then begin buffer[m]:=BYTE1(v);buffer2[m]:=1;incr(m);end;
if BYTE2(v)<>0 then begin buffer[m]:=BYTE2(v);buffer2[m]:=1;incr(m);end;
if BYTE3(v)<>0 then begin buffer[m]:=BYTE3(v);buffer2[m]:=1;incr(m);end;
buffer[m]:=BYTE4(v);buffer2[m]:=1;incr(m);end;incr(jj);
end end else begin v:=toBUFF(mem[p].hh.lh mod 16777216);
if BYTE1(v)<>0 then begin buffer[m]:=BYTE1(v);buffer2[m]:=1;incr(m);end;
if BYTE2(v)<>0 then begin buffer[m]:=BYTE2(v);buffer2[m]:=1;incr(m);end;
if BYTE3(v)<>0 then begin buffer[m]:=BYTE3(v);buffer2[m]:=1;incr(m);end;
buffer[m]:=BYTE4(v);buffer2[m]:=1;incr(m);end;p:=mem[p].hh.rh;
end else begin buffer[m]:=mem[p].hh.lh mod 65536;buffer2[m]:=0;incr(m);
p:=mem[p].hh.rh;end;end;
if m>first+1 then curcs:=idlookup(first,m-first)else if m=first then
curcs:=23809 else curcs:=11905+buffer[first]{:1549};flushlist(n);
b:=(eqtb[curcs].hh.b0<>119);isincsname:=e;end;
{:1548}{1550:}20:b:=isincsname;19:begin scanfontident;n:=curval;
if fontdir[n]<>0 then begin scanint;
if curval>=0 then b:=ischarkanji(curval)else begin curval:=-(curval+1);
b:=(fontbc[n]<=curval)and(fontec[n]>=curval)end end else begin
scanlatinnum;curval:=ptencucsto8bitcode(fontenc[n],curval);
if(fontbc[n]<=curval)and(fontec[n]>=curval)then b:=(fontinfo[charbase[n]
+curval].qqqq.b0>0)else b:=false;end;end;{:1550}16:{547:}begin scanint;
n:=curval;if eqtb[114397].int>1 then begin begindiagnostic;print(941);
printint(n);printchar(125);enddiagnostic(false);end;
while n<>0 do begin passtext;
if condptr=savecondptr then if curchr=4 then decr(n)else goto 50 else if
curchr=2 then{534:}begin if ifstack[inopen]=condptr then ifwarning;
p:=condptr;ifline:=mem[p+1].int;curif:=mem[p].hh.b1;
iflimit:=mem[p].hh.b0;condptr:=mem[p].hh.rh;freenode(p,2);end{:534};end;
changeiflimit(4,savecondptr);goto 10;end{:547};end{:539};
if isunless then b:=not b;
if eqtb[114397].int>1 then{540:}begin begindiagnostic;
if b then print(937)else print(938);enddiagnostic(false);end{:540};
if b then begin changeiflimit(3,savecondptr);goto 10;end;
{538:}while true do begin passtext;
if condptr=savecondptr then begin if curchr<>4 then goto 50;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(935);
end;printesc(933);begin helpptr:=1;helpline[0]:=936;end;error;
end else if curchr=2 then{534:}begin if ifstack[inopen]=condptr then
ifwarning;p:=condptr;ifline:=mem[p+1].int;curif:=mem[p].hh.b1;
iflimit:=mem[p].hh.b0;condptr:=mem[p].hh.rh;freenode(p,2);end{:534};
end{:538};
50:if curchr=2 then{534:}begin if ifstack[inopen]=condptr then ifwarning
;p:=condptr;ifline:=mem[p+1].int;curif:=mem[p].hh.b1;
iflimit:=mem[p].hh.b0;condptr:=mem[p].hh.rh;freenode(p,2);
end{:534}else iflimit:=2;10:end;{:536}{553:}procedure beginname;
begin areadelimiter:=0;extdelimiter:=0;quotedfilename:=false;
prevchar:=0;end;{:553}{554:}function morename(c:ASCIIcode):boolean;
begin if(c=32)and stopatspace and(not quotedfilename)then morename:=
false else if c=34 then begin quotedfilename:=not quotedfilename;
morename:=true;
end else begin begin if poolptr+1>poolsize then overflow(260,poolsize-
initpoolptr);end;begin strpool[poolptr]:=c;incr(poolptr);end;
if(ISDIRSEP(c)and(notkanjicharseq(prevchar,c)))then begin areadelimiter
:=(poolptr-strstart[strptr]);extdelimiter:=0;
end else if c=46 then extdelimiter:=(poolptr-strstart[strptr]);
morename:=true;end;prevchar:=c;end;{:554}{555:}procedure endname;
var tempstr:strnumber;j,s,t:poolpointer;mustquote:boolean;
begin if strptr+3>maxstrings then overflow(261,maxstrings-initstrptr);
begin if poolptr+6>poolsize then overflow(260,poolsize-initpoolptr);end;
if areadelimiter<>0 then begin mustquote:=false;s:=strstart[strptr];
t:=strstart[strptr]+areadelimiter;j:=s;
while(not mustquote)and(j<t)do begin mustquote:=strpool[j]=32;incr(j);
end;if mustquote then begin for j:=poolptr-1 downto t do strpool[j+2]:=
strpool[j];strpool[t+1]:=34;
for j:=t-1 downto s do strpool[j+1]:=strpool[j];strpool[s]:=34;
if extdelimiter<>0 then extdelimiter:=extdelimiter+2;
areadelimiter:=areadelimiter+2;poolptr:=poolptr+2;end;end;
s:=strstart[strptr]+areadelimiter;
if extdelimiter=0 then t:=poolptr else t:=strstart[strptr]+extdelimiter
-1;mustquote:=false;j:=s;
while(not mustquote)and(j<t)do begin mustquote:=strpool[j]=32;incr(j);
end;if mustquote then begin for j:=poolptr-1 downto t do strpool[j+2]:=
strpool[j];strpool[t+1]:=34;
for j:=t-1 downto s do strpool[j+1]:=strpool[j];strpool[s]:=34;
if extdelimiter<>0 then extdelimiter:=extdelimiter+2;poolptr:=poolptr+2;
end;if extdelimiter<>0 then begin s:=strstart[strptr]+extdelimiter-1;
t:=poolptr;mustquote:=false;j:=s;
while(not mustquote)and(j<t)do begin mustquote:=strpool[j]=32;incr(j);
end;if mustquote then begin strpool[t+1]:=34;
for j:=t-1 downto s do strpool[j+1]:=strpool[j];strpool[s]:=34;
poolptr:=poolptr+2;end;end;
if areadelimiter=0 then curarea:=349 else begin curarea:=strptr;
strstart[strptr+1]:=strstart[strptr]+areadelimiter;incr(strptr);
tempstr:=searchstring(curarea);if tempstr>0 then begin curarea:=tempstr;
decr(strptr);
for j:=strstart[strptr+1]to poolptr-1 do begin strpool[j-areadelimiter]
:=strpool[j];end;poolptr:=poolptr-areadelimiter;end;end;
if extdelimiter=0 then begin curext:=349;curname:=slowmakestring;
end else begin curname:=strptr;
strstart[strptr+1]:=strstart[strptr]+extdelimiter-areadelimiter-1;
incr(strptr);curext:=makestring;decr(strptr);
tempstr:=searchstring(curname);if tempstr>0 then begin curname:=tempstr;
decr(strptr);
for j:=strstart[strptr+1]to poolptr-1 do begin strpool[j-extdelimiter+
areadelimiter+1]:=strpool[j];end;
poolptr:=poolptr-extdelimiter+areadelimiter+1;end;
curext:=slowmakestring;end;end;
{:555}{557:}procedure packfilename(n,a,e:strnumber);var k:integer;
c:ASCIIcode;j:poolpointer;begin k:=0;
if nameoffile then libcfree(nameoffile);
nameoffile:=xmallocarray(ASCIIcode,((strstart[a+1]-strstart[a])+(
strstart[n+1]-strstart[n])+(strstart[e+1]-strstart[e]))*4+1);
for j:=strstart[a]to strstart[a+1]-1 do if not((strpool[j])=34)then
begin if(strpool[j])>=256 then begin c:=(strpool[j])-256;begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end;
end else begin c:=strpool[j];
if(c>=128)and(not isinternalUPTEX)and isterminalUTF8 then begin begin
incr(k);if k<=maxint then nameoffile[k]:=xchr[94];end;begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[94];end;
if(c div 16)<10 then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c div 16)+48];
end else begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c div 16)+87];end;
if(c mod 16)<10 then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c mod 16)+48];
end else begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c mod 16)+87];end;
end else begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];end;
end end;
for j:=strstart[n]to strstart[n+1]-1 do if not((strpool[j])=34)then
begin if(strpool[j])>=256 then begin c:=(strpool[j])-256;begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end;
end else begin c:=strpool[j];
if(c>=128)and(not isinternalUPTEX)and isterminalUTF8 then begin begin
incr(k);if k<=maxint then nameoffile[k]:=xchr[94];end;begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[94];end;
if(c div 16)<10 then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c div 16)+48];
end else begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c div 16)+87];end;
if(c mod 16)<10 then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c mod 16)+48];
end else begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c mod 16)+87];end;
end else begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];end;
end end;
for j:=strstart[e]to strstart[e+1]-1 do if not((strpool[j])=34)then
begin if(strpool[j])>=256 then begin c:=(strpool[j])-256;begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end;
end else begin c:=strpool[j];
if(c>=128)and(not isinternalUPTEX)and isterminalUTF8 then begin begin
incr(k);if k<=maxint then nameoffile[k]:=xchr[94];end;begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[94];end;
if(c div 16)<10 then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c div 16)+48];
end else begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c div 16)+87];end;
if(c mod 16)<10 then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c mod 16)+48];
end else begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c mod 16)+87];end;
end else begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];end;
end end;if k<=maxint then namelength:=k else namelength:=maxint;
nameoffile[namelength+1]:=0;end;
{:557}{561:}procedure packbufferedname(n:smallnumber;a,b:integer);
var k:integer;c:ASCIIcode;j:integer;
begin if n+b-a+5>maxint then b:=a+maxint-n-5;k:=0;
if nameoffile then libcfree(nameoffile);
nameoffile:=xmallocarray(ASCIIcode,(n+(b-a+1)+4)*4+1);
for j:=1 to n do begin c:=xord[ucharcast(TEXformatdefault[j])];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end;end;for j:=a to b do begin c:=buffer[j];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end;end;
for j:=formatdefaultlength-3 to formatdefaultlength do begin c:=xord[
ucharcast(TEXformatdefault[j])];if not(c=34)then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end;end;
if k<=maxint then namelength:=k else namelength:=maxint;
nameoffile[namelength+1]:=0;end;
{:561}{563:}function makenamestring:strnumber;var k:1..maxint;
saveareadelimiter,saveextdelimiter:poolpointer;
savenameinprogress,savestopatspace:boolean;
begin if(poolptr+namelength>poolsize)or(strptr=maxstrings)or((poolptr-
strstart[strptr])>0)then makenamestring:=63 else begin for k:=1 to
namelength do begin strpool[poolptr]:=xord[nameoffile[k]];incr(poolptr);
end;makenamestring:=makestring;saveareadelimiter:=areadelimiter;
saveextdelimiter:=extdelimiter;savenameinprogress:=nameinprogress;
savestopatspace:=stopatspace;nameinprogress:=true;beginname;
stopatspace:=false;k:=1;
while(k<=namelength)and(morename(nameoffile[k]))do incr(k);
stopatspace:=savestopatspace;endname;nameinprogress:=savenameinprogress;
areadelimiter:=saveareadelimiter;extdelimiter:=saveextdelimiter;end;end;
function amakenamestring(var f:alphafile):strnumber;
begin amakenamestring:=makenamestring;end;
function bmakenamestring(var f:bytefile):strnumber;
begin bmakenamestring:=makenamestring;end;
function wmakenamestring(var f:wordfile):strnumber;
begin wmakenamestring:=makenamestring;end;
{:563}{564:}procedure scanfilename;label 30;
var savewarningindex:halfword;v,nn,jj:integer;
begin nameinprogress:=true;savewarningindex:=warningindex;
warningindex:=curcs;{442:}repeat getxtoken;until curcmd<>10{:442};
backinput;if curcmd=1 then begin scanfilenamebraced;
end else begin nameinprogress:=true;beginname;{442:}repeat getxtoken;
until curcmd<>10{:442};skipmode:=false;
while true do begin if(curcmd>=16)and(curcmd<=20)then begin if(
isinternalUPTEX)then begin curchr:=toUCS(curchr);
nn:=UVSgetcodepointlength(curchr);jj:=1;
while jj<=nn do begin v:=UVSgetcodepointinsequence(curchr,jj);
if(v>0)then begin begin if poolptr+4>poolsize then overflow(260,poolsize
-initpoolptr);end;v:=UCStoUTF8(v);
if BYTE1(v)<>0 then begin strpool[poolptr]:=256+BYTE1(v);incr(poolptr);
end;if BYTE2(v)<>0 then begin strpool[poolptr]:=256+BYTE2(v);
incr(poolptr);end;
if BYTE3(v)<>0 then begin strpool[poolptr]:=256+BYTE3(v);incr(poolptr);
end;begin strpool[poolptr]:=256+BYTE4(v);incr(poolptr);end;end;incr(jj);
end end else begin begin if poolptr+4>poolsize then overflow(260,
poolsize-initpoolptr);end;curchr:=toBUFF(curchr);
if BYTE1(curchr)<>0 then begin strpool[poolptr]:=256+BYTE1(curchr);
incr(poolptr);end;
if BYTE2(curchr)<>0 then begin strpool[poolptr]:=256+BYTE2(curchr);
incr(poolptr);end;
if BYTE3(curchr)<>0 then begin strpool[poolptr]:=256+BYTE3(curchr);
incr(poolptr);end;begin strpool[poolptr]:=256+BYTE4(curchr);
incr(poolptr);end;end;
end else if(curcmd>12)or(curchr>=11904)then begin backinput;goto 30;
end else if((curchr=32)and(curinput.statefield<>0)and(curinput.locfield>
curinput.limitfield))or not morename(curchr)then goto 30;getxtoken;end;
end;30:endname;nameinprogress:=false;skipmode:=true;
warningindex:=savewarningindex;end;
{:564}{567:}procedure packjobname(s:strnumber);begin curarea:=349;
curext:=s;curname:=jobname;packfilename(curname,curarea,curext);end;
{:567}{568:}procedure promptfilename(s,e:strnumber);label 30;
var k:0..bufsize;savedcurname:strnumber;savedcurext:strnumber;
savedcurarea:strnumber;begin if interaction=2 then;
if s=943 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(944);
end else begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(945);
end;printfilename(curname,curarea,curext);print(946);
if(e=947)or(e=349)then showcontext;println;
printcstring(promptfilenamehelpmsg);if(e<>349)then begin print(948);
print(e);print(39);end;print(41);println;printnl(949);print(s);
if interaction<2 then fatalerror(950);savedcurname:=curname;
savedcurext:=curext;savedcurarea:=curarea;;begin;print(657);terminput;
end;{569:}begin beginname;k:=first;
while(buffer[k]=32)and(k<last)do incr(k);
while true do begin if k=last then goto 30;
if not morename(buffer[k])then goto 30;incr(k);end;30:endname;end{:569};
if((strstart[curname+1]-strstart[curname])=0)and(curext=349)and(curarea=
349)then begin curname:=savedcurname;curext:=savedcurext;
curarea:=savedcurarea;end else if curext=349 then curext:=e;
packfilename(curname,curarea,curext);end;
{:568}{572:}procedure openlogfile;var oldsetting:0..21;k:0..bufsize;
l:0..bufsize;months:constcstring;begin oldsetting:=selector;
if jobname=0 then jobname:=getjobname(953);packjobname(954);
recorderchangefilename(stringcast(nameoffile+1));packjobname(955);
while not aopenout(logfile)do{573:}begin selector:=17;
promptfilename(957,955);end{:573};
texmflogname:=amakenamestring(logfile);selector:=18;logopened:=true;
{574:}begin if srcspecialsp or filelineerrorstylep or parsefirstlinep
then write(logfile,'This is e-upTeX, Version 3.141592653','-p4.1.2',
'-u2.02','-251130','-2.6')else write(logfile,
'This is e-upTeX, Version 3.141592653','-p4.1.2','-u2.02','-251130',
'-2.6');write(logfile,' (');
write(logfile,conststringcast(getencstring));write(logfile,')');
write(logfile,versionstring);slowprint(formatident);print(958);
printint(sysday);printchar(32);
months:=' JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC';
for k:=3*sysmonth-2 to 3*sysmonth do write(logfile,months[k]);
printchar(32);printint(sysyear);printchar(32);printtwo(systime div 60);
printchar(58);printtwo(systime mod 60);if(eTeXmode=1)then begin;
writeln(logfile);write(logfile,'entering extended mode');end;
if shellenabledp then begin writeln(logfile);write(logfile,' ');
if restrictedshell then begin write(logfile,'restricted ');end;
write(logfile,'\write18 enabled.')end;
if srcspecialsp then begin writeln(logfile);
write(logfile,' Source specials enabled.')end;
if filelineerrorstylep then begin writeln(logfile);
write(logfile,' file:line:error style messages enabled.')end;
if parsefirstlinep then begin writeln(logfile);
write(logfile,' %&-line parsing enabled.');end;
if translatefilename then begin writeln(logfile);write(logfile,' (');
fputs(translatefilename,logfile);write(logfile,')');end;end{:574};
if mltexenabledp then begin writeln(logfile);
write(logfile,'MLTeX v2.2 enabled');end;inputstack[inputptr]:=curinput;
printnl(956);l:=inputstack[0].limitfield;
if buffer[l]=eqtb[114410].int then decr(l);
printunreadbufferwithptenc(1,l+1);println;selector:=oldsetting+2;end;
{:572}{575:}procedure startinput;label 30;var tempstr:strnumber;
v:halfword;begin scanfilename;packfilename(curname,curarea,curext);
while true do begin beginfilereading;texinputtype:=1;
if kpseinnameok(stringcast(nameoffile+1))and aopenin(inputfile[curinput.
indexfield],kpsetexformat)then goto 30;endfilereading;
promptfilename(943,349);end;
30:curinput.namefield:=amakenamestring(inputfile[curinput.indexfield]);
sourcefilenamestack[inopen]:=curinput.namefield;
fullsourcefilenamestack[inopen]:=makefullnamestring;
if curinput.namefield=strptr-1 then begin tempstr:=searchstring(curinput
.namefield);if tempstr>0 then begin curinput.namefield:=tempstr;
begin decr(strptr);poolptr:=strstart[strptr];end;end;end;
if jobname=0 then begin jobname:=getjobname(curname);openlogfile;end;
if termoffset+(strstart[fullsourcefilenamestack[inopen]+1]-strstart[
fullsourcefilenamestack[inopen]])>maxprintline-2 then println else if(
termoffset>0)or(fileoffset>0)then printchar(32);printchar(40);
incr(openparens);slowprintfilename(fullsourcefilenamestack[inopen]);
fflush(stdout);if eqtb[114426].int>0 then begin begindiagnostic;println;
printchar(126);v:=inputptr-1;
if v<eqtb[114426].int then while v>0 do begin printchar(46);decr(v);
end else printchar(126);slowprint(959);slowprint(curname);
slowprint(curext);println;enddiagnostic(false);end;
curinput.statefield:=85;{1757:}synctexstartinput;{:1757};
{576:}begin line:=1;
if inputln(inputfile[curinput.indexfield],false)then;firmuptheline;
if(eqtb[114410].int<0)or(eqtb[114410].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[114410].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end{:576};end;
{:575}{598:}{1667:}function effectivecharinfo(f:internalfontnumber;
c:quarterword):fourquarters;label 10;var ci:fourquarters;basec:integer;
begin if not mltexenabledp then begin effectivecharinfo:=fontinfo[
charbase[f]+c].qqqq;goto 10;end;
if fontec[f]>=c then if fontbc[f]<=c then begin ci:=fontinfo[charbase[f]
+c].qqqq;if(ci.b0>0)then begin effectivecharinfo:=ci;goto 10;end;end;
if c>=eqtb[114423].int then if c<=eqtb[114424].int then if(eqtb[114105+c
].hh.rh>0)then begin basec:=(eqtb[114105+c].hh.rh mod 256);
if fontec[f]>=basec then if fontbc[f]<=basec then begin ci:=fontinfo[
charbase[f]+basec].qqqq;if(ci.b0>0)then begin effectivecharinfo:=ci;
goto 10;end;end;end;effectivecharinfo:=nullcharacter;10:end;
{:1667}function readfontinfo(u:halfword;nom,aire:strnumber;
s:scaled):internalfontnumber;label 30,11,45;var k:fontindex;
jfmflag:0..3;nt:halfword;cx:KANJIcode;ofmflag:integer;
fontlevel,headerlength:integer;fndir:integer;ncw,nlw,neew:integer;
nametoolong:boolean;fileopened:boolean;
lf,lh,bc,ec,nw,nh,nd,ni,nl,nk,ne,np:halfword;f:internalfontnumber;
g:internalfontnumber;a,b,c,d:integer;qw:fourquarters;sw:scaled;
bchlabel:integer;bchar:0..256;z:scaled;alpha:integer;beta:1..16;
begin g:=0;{600:}{601:}fileopened:=false;
nametoolong:=((strstart[nom+1]-strstart[nom])>255)or((strstart[aire+1]-
strstart[aire])>255);if nametoolong then goto 11;
packfilename(nom,aire,349);
if not ofmopenin(tfmfile)then if not bopenin(tfmfile)then goto 11;
fileopened:=true{:601};{603:}begin begin lf:=tfmtemp;
if lf>127 then goto 11;tfmtemp:=getc(tfmfile);lf:=lf*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin lh:=tfmtemp;if lh>127 then goto 11;
tfmtemp:=getc(tfmfile);lh:=lh*256+tfmtemp;end;ofmflag:=0;fontlevel:=-1;
ncw:=0;nlw:=0;neew:=0;if lf=11 then begin jfmflag:=4;nt:=lh;
tfmtemp:=getc(tfmfile);begin lf:=tfmtemp;if lf>127 then goto 11;
tfmtemp:=getc(tfmfile);lf:=lf*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin lh:=tfmtemp;if lh>127 then goto 11;tfmtemp:=getc(tfmfile);
lh:=lh*256+tfmtemp;end;end else if lf=9 then begin jfmflag:=3;nt:=lh;
tfmtemp:=getc(tfmfile);begin lf:=tfmtemp;if lf>127 then goto 11;
tfmtemp:=getc(tfmfile);lf:=lf*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin lh:=tfmtemp;if lh>127 then goto 11;tfmtemp:=getc(tfmfile);
lh:=lh*256+tfmtemp;end;end else if lf=0 then begin ofmflag:=1;
fontlevel:=lh;jfmflag:=0;nt:=0;if(fontlevel<>0)then goto 11;
tfmtemp:=getc(tfmfile);begin lf:=tfmtemp;if lf>127 then goto 11;
tfmtemp:=getc(tfmfile);lf:=lf*256+tfmtemp;tfmtemp:=getc(tfmfile);
lf:=lf*256+tfmtemp;tfmtemp:=getc(tfmfile);lf:=lf*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin lh:=tfmtemp;if lh>127 then goto 11;
tfmtemp:=getc(tfmfile);lh:=lh*256+tfmtemp;tfmtemp:=getc(tfmfile);
lh:=lh*256+tfmtemp;tfmtemp:=getc(tfmfile);lh:=lh*256+tfmtemp;end;
end else begin jfmflag:=0;nt:=0;end;
if ofmflag<>1 then begin tfmtemp:=getc(tfmfile);begin bc:=tfmtemp;
if bc>127 then goto 11;tfmtemp:=getc(tfmfile);bc:=bc*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin ec:=tfmtemp;if ec>127 then goto 11;
tfmtemp:=getc(tfmfile);ec:=ec*256+tfmtemp;end;
if(bc>ec+1)or(ec>255)then goto 11;if bc>255 then begin bc:=1;ec:=0;end;
tfmtemp:=getc(tfmfile);begin nw:=tfmtemp;if nw>127 then goto 11;
tfmtemp:=getc(tfmfile);nw:=nw*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nh:=tfmtemp;if nh>127 then goto 11;tfmtemp:=getc(tfmfile);
nh:=nh*256+tfmtemp;end;tfmtemp:=getc(tfmfile);begin nd:=tfmtemp;
if nd>127 then goto 11;tfmtemp:=getc(tfmfile);nd:=nd*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin ni:=tfmtemp;if ni>127 then goto 11;
tfmtemp:=getc(tfmfile);ni:=ni*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nl:=tfmtemp;if nl>127 then goto 11;tfmtemp:=getc(tfmfile);
nl:=nl*256+tfmtemp;end;tfmtemp:=getc(tfmfile);begin nk:=tfmtemp;
if nk>127 then goto 11;tfmtemp:=getc(tfmfile);nk:=nk*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin ne:=tfmtemp;if ne>127 then goto 11;
tfmtemp:=getc(tfmfile);ne:=ne*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin np:=tfmtemp;if np>127 then goto 11;tfmtemp:=getc(tfmfile);
np:=np*256+tfmtemp;end;end else begin tfmtemp:=getc(tfmfile);
begin bc:=tfmtemp;if bc>127 then goto 11;tfmtemp:=getc(tfmfile);
bc:=bc*256+tfmtemp;tfmtemp:=getc(tfmfile);bc:=bc*256+tfmtemp;
tfmtemp:=getc(tfmfile);bc:=bc*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin ec:=tfmtemp;if ec>127 then goto 11;tfmtemp:=getc(tfmfile);
ec:=ec*256+tfmtemp;tfmtemp:=getc(tfmfile);ec:=ec*256+tfmtemp;
tfmtemp:=getc(tfmfile);ec:=ec*256+tfmtemp;end;
if(bc>ec+1)or(ec>65535)then goto 11;if bc>65535 then begin bc:=1;ec:=0;
end;tfmtemp:=getc(tfmfile);begin nw:=tfmtemp;if nw>127 then goto 11;
tfmtemp:=getc(tfmfile);nw:=nw*256+tfmtemp;tfmtemp:=getc(tfmfile);
nw:=nw*256+tfmtemp;tfmtemp:=getc(tfmfile);nw:=nw*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin nh:=tfmtemp;if nh>127 then goto 11;
tfmtemp:=getc(tfmfile);nh:=nh*256+tfmtemp;tfmtemp:=getc(tfmfile);
nh:=nh*256+tfmtemp;tfmtemp:=getc(tfmfile);nh:=nh*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin nd:=tfmtemp;if nd>127 then goto 11;
tfmtemp:=getc(tfmfile);nd:=nd*256+tfmtemp;tfmtemp:=getc(tfmfile);
nd:=nd*256+tfmtemp;tfmtemp:=getc(tfmfile);nd:=nd*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin ni:=tfmtemp;if ni>127 then goto 11;
tfmtemp:=getc(tfmfile);ni:=ni*256+tfmtemp;tfmtemp:=getc(tfmfile);
ni:=ni*256+tfmtemp;tfmtemp:=getc(tfmfile);ni:=ni*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin nl:=tfmtemp;if nl>127 then goto 11;
tfmtemp:=getc(tfmfile);nl:=nl*256+tfmtemp;tfmtemp:=getc(tfmfile);
nl:=nl*256+tfmtemp;tfmtemp:=getc(tfmfile);nl:=nl*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin nk:=tfmtemp;if nk>127 then goto 11;
tfmtemp:=getc(tfmfile);nk:=nk*256+tfmtemp;tfmtemp:=getc(tfmfile);
nk:=nk*256+tfmtemp;tfmtemp:=getc(tfmfile);nk:=nk*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin ne:=tfmtemp;if ne>127 then goto 11;
tfmtemp:=getc(tfmfile);ne:=ne*256+tfmtemp;tfmtemp:=getc(tfmfile);
ne:=ne*256+tfmtemp;tfmtemp:=getc(tfmfile);ne:=ne*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin np:=tfmtemp;if np>127 then goto 11;
tfmtemp:=getc(tfmfile);np:=np*256+tfmtemp;tfmtemp:=getc(tfmfile);
np:=np*256+tfmtemp;tfmtemp:=getc(tfmfile);np:=np*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin fndir:=tfmtemp;if fndir>127 then goto 11;
tfmtemp:=getc(tfmfile);fndir:=fndir*256+tfmtemp;tfmtemp:=getc(tfmfile);
fndir:=fndir*256+tfmtemp;tfmtemp:=getc(tfmfile);
fndir:=fndir*256+tfmtemp;end;nlw:=2*nl;neew:=2*ne;
if fontlevel=0 then begin headerlength:=14;ncw:=2*(ec-bc+1);
end else begin goto 11;end;end;
if ofmflag<>0 then begin if lf<>headerlength+lh+ncw+nw+nh+nd+ni+nlw+nk+
neew+np then goto 11;
end else if jfmflag<>0 then begin if lf<>7+lh+nt+(ec-bc+1)+nw+nh+nd+ni+
nl+nk+ne+np then goto 11;
end else begin if lf<>6+lh+(ec-bc+1)+nw+nh+nd+ni+nl+nk+ne+np then goto
11;end;if(nw=0)or(nh=0)or(nd=0)or(ni=0)then goto 11;end{:603};
{604:}if ofmflag<>0 then begin if fontlevel=0 then lf:=lf-14-lh-(ec-bc+1
)-nl-ne else goto 11;
end else if jfmflag<>0 then lf:=lf-7-lh else lf:=lf-6-lh;
if np<7 then lf:=lf+7-np;
if(fontptr=fontmax)or(fmemptr+lf>fontmemsize)then{605:}begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(961);
end;sprintcs(u);printchar(61);printfilename(nom,aire,349);
if s>=0 then begin print(888);printscaled(s);print(425);
end else if s<>-1000 then begin print(962);printint(-s);end;print(971);
begin helpptr:=4;helpline[3]:=972;helpline[2]:=973;helpline[1]:=974;
helpline[0]:=975;end;error;goto 30;end{:605};f:=fontptr+1;
fontdir[f]:=jfmflag;fontenc[f]:=0;
if(jfmflag=0)and(jfmenc>=128)then fontenc[f]:=jfmenc;
if(jfmflag<>0)and(jfmenc<=2)then fontenc[f]:=jfmenc;fontnumext[f]:=nt;
ctypebase[f]:=fmemptr;charbase[f]:=ctypebase[f]+nt-bc;
widthbase[f]:=charbase[f]+ec+1;heightbase[f]:=widthbase[f]+nw;
depthbase[f]:=heightbase[f]+nh;italicbase[f]:=depthbase[f]+nd;
ligkernbase[f]:=italicbase[f]+ni;
kernbase[f]:=ligkernbase[f]+nl-256*(128);
extenbase[f]:=kernbase[f]+256*(128)+nk;parambase[f]:=extenbase[f]+ne;
{:604};{606:}begin if lh<2 then goto 11;begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;qw.b0:=a;tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;
tfmtemp:=getc(tfmfile);c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);
d:=tfmtemp;qw.b3:=d;fontcheck[f]:=qw;end;tfmtemp:=getc(tfmfile);
begin z:=tfmtemp;if z>127 then goto 11;tfmtemp:=getc(tfmfile);
z:=z*256+tfmtemp;end;tfmtemp:=getc(tfmfile);z:=z*256+tfmtemp;
tfmtemp:=getc(tfmfile);z:=(z*16)+(tfmtemp div 16);
if z<65536 then goto 11;while lh>2 do begin tfmtemp:=getc(tfmfile);
tfmtemp:=getc(tfmfile);tfmtemp:=getc(tfmfile);tfmtemp:=getc(tfmfile);
decr(lh);end;fontdsize[f]:=z;
if s<>-1000 then if s>=0 then z:=s else begin savearitherror:=aritherror
;sw:=z;z:=xnoverd(z,-s,1000);
if aritherror or z>=134217728 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(961);
end;sprintcs(u);printchar(61);printfilename(nom,aire,349);
if s>=0 then begin print(888);printscaled(s);print(425);
end else if s<>-1000 then begin print(962);printint(-s);end;print(976);
begin helpptr:=1;helpline[0]:=977;end;error;z:=sw;end;
aritherror:=savearitherror;end;fontsize[f]:=z;end{:606};
{607:}if ofmflag<>0 then begin if fontlevel=1 then begin goto 11;end;
end else if jfmflag<>0 then for k:=ctypebase[f]to ctypebase[f]+nt-1 do
begin tfmtemp:=getc(tfmfile);begin cx:=tfmtemp;tfmtemp:=getc(tfmfile);
cx:=cx*256+tfmtemp;tfmtemp:=getc(tfmfile);cx:=cx+tfmtemp*65536;end;
if jfmenc=2 then fontinfo[k].hh.rh:=toDVI(fromUCS(cx))else if jfmenc=1
then fontinfo[k].hh.rh:=toDVI(fromJIS(cx))else fontinfo[k].hh.rh:=cx;
tfmtemp:=getc(tfmfile);cx:=tfmtemp;fontinfo[k].hh.lhfield:=cx;end;
k:=charbase[f]+bc;
while k<=widthbase[f]-1 do begin begin if(ofmflag<>0)then begin tfmtemp
:=getc(tfmfile);begin a:=tfmtemp;tfmtemp:=getc(tfmfile);
a:=a*256+tfmtemp;end;qw.b0:=a;tfmtemp:=getc(tfmfile);begin b:=tfmtemp;
tfmtemp:=getc(tfmfile);b:=b*256+tfmtemp;end;qw.b1:=b;
tfmtemp:=getc(tfmfile);begin c:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=c*256+tfmtemp;end;qw.b2:=c;tfmtemp:=getc(tfmfile);begin d:=tfmtemp;
tfmtemp:=getc(tfmfile);d:=d*256+tfmtemp;end;qw.b3:=d;
fontinfo[k].qqqq:=qw;end else begin tfmtemp:=getc(tfmfile);a:=tfmtemp;
qw.b0:=a;tfmtemp:=getc(tfmfile);b:=tfmtemp;b:=(b div 16)*256+(b mod 16);
qw.b1:=b;tfmtemp:=getc(tfmfile);c:=tfmtemp;c:=(c div 4)*256+(c mod 4);
qw.b2:=c;tfmtemp:=getc(tfmfile);d:=tfmtemp;qw.b3:=d;
fontinfo[k].qqqq:=qw;end end;
if(a>=nw)or((b div 256)>=nh)or((b mod 256)>=nd)or((c div 256)>=ni)then
goto 11;case c mod 4 of 1:if d>=nl then goto 11;3:if d>=ne then goto 11;
2:{608:}begin begin if(d<bc)or(d>ec)then goto 11 end;
while d<k-charbase[f]do begin qw:=fontinfo[charbase[f]+d].qqqq;
if((qw.b2)mod 4)<>2 then goto 45;d:=qw.b3;end;
if d=k-charbase[f]then goto 11;45:end{:608};others:end;incr(k);
if fontlevel=1 then begin goto 11;end;end{:607};
{609:}begin{610:}begin alpha:=16;while z>=8388608 do begin z:=z div 2;
alpha:=alpha+alpha;end;beta:=256 div alpha;alpha:=alpha*z;end{:610};
for k:=widthbase[f]to ligkernbase[f]-1 do begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fontinfo[k].int:=sw else if a=255 then fontinfo[k].int:=sw-
alpha else goto 11;end;if fontinfo[widthbase[f]].int<>0 then goto 11;
if fontinfo[heightbase[f]].int<>0 then goto 11;
if fontinfo[depthbase[f]].int<>0 then goto 11;
if fontinfo[italicbase[f]].int<>0 then goto 11;end{:609};
{611:}bchlabel:=32767;bchar:=11904;
if nl>0 then begin for k:=ligkernbase[f]to kernbase[f]+256*(128)-1 do
begin begin if(ofmflag<>0)then begin tfmtemp:=getc(tfmfile);
begin a:=tfmtemp;tfmtemp:=getc(tfmfile);a:=a*256+tfmtemp;end;qw.b0:=a;
tfmtemp:=getc(tfmfile);begin b:=tfmtemp;tfmtemp:=getc(tfmfile);
b:=b*256+tfmtemp;end;qw.b1:=b;tfmtemp:=getc(tfmfile);begin c:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=c*256+tfmtemp;end;qw.b2:=c;
tfmtemp:=getc(tfmfile);begin d:=tfmtemp;tfmtemp:=getc(tfmfile);
d:=d*256+tfmtemp;end;qw.b3:=d;fontinfo[k].qqqq:=qw;
end else begin tfmtemp:=getc(tfmfile);a:=tfmtemp;qw.b0:=a;
tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;tfmtemp:=getc(tfmfile);
c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);d:=tfmtemp;qw.b3:=d;
fontinfo[k].qqqq:=qw;end end;
if a>128 then begin if 256*c+d>=nl then goto 11;
if a=255 then if k=ligkernbase[f]then bchar:=b;
end else begin if b<>bchar then begin begin if(b<bc)or(b>ec)then goto 11
end;qw:=fontinfo[charbase[f]+b].qqqq;if not(qw.b0>0)then goto 11;end;
if c<128 then begin if jfmflag<>0 then begin if 256*c+d>=ne then goto 11
;end else begin begin if(d<bc)or(d>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+d].qqqq;if not(qw.b0>0)then goto 11;end;
end else if 256*(c-128)+d>=nk then goto 11;
if a<128 then if k-ligkernbase[f]+a+1>=nl then goto 11;end;end;
if a=255 then bchlabel:=256*c+d;end;
for k:=kernbase[f]+256*(128)to extenbase[f]-1 do begin tfmtemp:=getc(
tfmfile);a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fontinfo[k].int:=sw else if a=255 then fontinfo[k].int:=sw-
alpha else goto 11;end;{:611};
{612:}if jfmflag<>0 then for k:=extenbase[f]to parambase[f]-1 do begin
tfmtemp:=getc(tfmfile);a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fontinfo[k].int:=sw else if a=255 then fontinfo[k].int:=sw-
alpha else goto 11;
end else for k:=extenbase[f]to parambase[f]-1 do begin begin if(ofmflag
<>0)then begin tfmtemp:=getc(tfmfile);begin a:=tfmtemp;
tfmtemp:=getc(tfmfile);a:=a*256+tfmtemp;end;qw.b0:=a;
tfmtemp:=getc(tfmfile);begin b:=tfmtemp;tfmtemp:=getc(tfmfile);
b:=b*256+tfmtemp;end;qw.b1:=b;tfmtemp:=getc(tfmfile);begin c:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=c*256+tfmtemp;end;qw.b2:=c;
tfmtemp:=getc(tfmfile);begin d:=tfmtemp;tfmtemp:=getc(tfmfile);
d:=d*256+tfmtemp;end;qw.b3:=d;fontinfo[k].qqqq:=qw;
end else begin tfmtemp:=getc(tfmfile);a:=tfmtemp;qw.b0:=a;
tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;tfmtemp:=getc(tfmfile);
c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);d:=tfmtemp;qw.b3:=d;
fontinfo[k].qqqq:=qw;end end;
if a<>0 then begin begin if(a<bc)or(a>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+a].qqqq;if not(qw.b0>0)then goto 11;end;
if b<>0 then begin begin if(b<bc)or(b>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+b].qqqq;if not(qw.b0>0)then goto 11;end;
if c<>0 then begin begin if(c<bc)or(c>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+c].qqqq;if not(qw.b0>0)then goto 11;end;
begin begin if(d<bc)or(d>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+d].qqqq;if not(qw.b0>0)then goto 11;end;
end{:612};
{613:}begin for k:=1 to np do if k=1 then begin tfmtemp:=getc(tfmfile);
sw:=tfmtemp;if sw>127 then sw:=sw-256;tfmtemp:=getc(tfmfile);
sw:=sw*256+tfmtemp;tfmtemp:=getc(tfmfile);sw:=sw*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fontinfo[parambase[f]].int:=(sw*16)+(tfmtemp div 16);
end else begin tfmtemp:=getc(tfmfile);a:=tfmtemp;tfmtemp:=getc(tfmfile);
b:=tfmtemp;tfmtemp:=getc(tfmfile);c:=tfmtemp;tfmtemp:=getc(tfmfile);
d:=tfmtemp;sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fontinfo[parambase[f]+k-1].int:=sw else if a=255 then
fontinfo[parambase[f]+k-1].int:=sw-alpha else goto 11;end;
if feof(tfmfile)then goto 11;
for k:=np+1 to 7 do fontinfo[parambase[f]+k-1].int:=0;end{:613};
{614:}if np>=7 then fontparams[f]:=np else fontparams[f]:=7;
hyphenchar[f]:=eqtb[114408].int;skewchar[f]:=eqtb[114409].int;
if bchlabel<nl then bcharlabel[f]:=bchlabel+ligkernbase[f]else
bcharlabel[f]:=0;fontbchar[f]:=bchar;fontfalsebchar[f]:=bchar;
if bchar<=ec then if bchar>=bc then begin qw:=fontinfo[charbase[f]+bchar
].qqqq;if(qw.b0>0)then fontfalsebchar[f]:=11904;end;fontname[f]:=nom;
fontarea[f]:=aire;fontbc[f]:=bc;fontec[f]:=ec;fontglue[f]:=-1073741823;
ctypebase[f]:=ctypebase[f];charbase[f]:=charbase[f];
widthbase[f]:=widthbase[f];ligkernbase[f]:=ligkernbase[f];
kernbase[f]:=kernbase[f];extenbase[f]:=extenbase[f];decr(parambase[f]);
fmemptr:=fmemptr+lf;fontptr:=f;g:=f;goto 30{:614}{:600};
11:{599:}begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(961);
end;sprintcs(u);printchar(61);printfilename(nom,aire,349);
if s>=0 then begin print(888);printscaled(s);print(425);
end else if s<>-1000 then begin print(962);printint(-s);end;
if fileopened then print(963)else if nametoolong then print(964)else
print(965);begin helpptr:=5;helpline[4]:=966;helpline[3]:=967;
helpline[2]:=968;helpline[1]:=969;helpline[0]:=970;end;error{:599};
30:if fileopened then bclose(tfmfile);readfontinfo:=g;end;
{:598}{619:}procedure charwarning(f:internalfontnumber;c:sixteenbits);
var l:0..255;oldsetting:integer;
begin if eqtb[114396].int>0 then begin oldsetting:=eqtb[114390].int;
if(eTeXmode=1)and(eqtb[114396].int>1)then eqtb[114390].int:=1;
if eqtb[114396].int>2 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(986);
end else begin begindiagnostic;printnl(986)end;
if(c<32)or(c>126)then begin printchar(94);printchar(94);
if c<64 then printchar(c+64)else if c<128 then printchar(c-64)else if c<
256 then begin l:=c div 16;
if l<10 then printchar(l+48)else printchar(l+87);l:=c mod 16;
if l<10 then printchar(l+48)else printchar(l+87);
end else begin printchar(94);printchar(94);l:=c div 4096;
if l<10 then printchar(l+48)else printchar(l+87);l:=(c mod 4096)div 256;
if l<10 then printchar(l+48)else printchar(l+87);l:=(c mod 256)div 16;
if l<10 then printchar(l+48)else printchar(l+87);l:=c mod 16;
if l<10 then printchar(l+48)else printchar(l+87);end end else print(c);
if eqtb[114396].int>2 then begin print(287);printhex(c);print(41);end;
print(987);slowprint(fontname[f]);
if eqtb[114396].int<3 then printchar(33);eqtb[114390].int:=oldsetting;
if eqtb[114396].int>2 then begin helpptr:=0;error;
end else enddiagnostic(false);end;end;
{:619}{620:}procedure charwarningjis(f:internalfontnumber;jc:KANJIcode);
var oldsetting:integer;
begin if eqtb[114396].int>0 then begin oldsetting:=eqtb[114390].int;
if(eTeXmode=1)and(eqtb[114396].int>1)then eqtb[114390].int:=1;
if eqtb[114396].int>2 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(988);
end else begin begindiagnostic;printnl(988)end;printkanji(jc);
print(287);printhex(jc);print(989);slowprint(fontname[f]);printchar(44);
if eqtb[114396].int>2 then begin printnl(990);helpptr:=0;error;
end else begin printnl(991);enddiagnostic(false);end;
eqtb[114390].int:=oldsetting;end;end;
{:620}{621:}function newcharacter(f:internalfontnumber;
c:sixteenbits):halfword;label 10;var p:halfword;ec,cc:quarterword;
begin cc:=c;c:=ptencucsto8bitcode(fontenc[f],c);
ec:=effectivechar(false,f,c);
if fontbc[f]<=ec then if fontec[f]>=ec then if(fontinfo[charbase[f]+ec].
qqqq.b0>0)then begin p:=getavail;mem[p].hh.b0:=f;mem[p].hh.b1:=c;
newcharacter:=p;goto 10;end;charwarning(f,cc);newcharacter:=-1073741823;
10:end;{:621}{637:}procedure dviswap;
begin if dviptr>(2147483647-dvioffset)then begin curs:=-2;
fatalerror(992);end;
if dvilimit=dvibufsize then begin writedvi(0,halfbuf-1);
dvilimit:=halfbuf;dvioffset:=dvioffset+dvibufsize;dviptr:=0;
end else begin writedvi(halfbuf,dvibufsize-1);dvilimit:=dvibufsize;end;
dvigone:=dvigone+halfbuf;end;{:637}{639:}procedure dvifour(x:integer);
begin if x>=0 then begin dvibuf[dviptr]:=x div 16777216;incr(dviptr);
if dviptr=dvilimit then dviswap;end else begin x:=x+1073741824;
x:=x+1073741824;begin dvibuf[dviptr]:=(x div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;x:=x mod 16777216;
begin dvibuf[dviptr]:=x div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;x:=x mod 65536;
begin dvibuf[dviptr]:=x div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=x mod 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
{:639}{640:}procedure dvipop(l:integer);
begin if(l=dvioffset+dviptr)and(dviptr>0)then decr(dviptr)else begin
dvibuf[dviptr]:=142;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end;{:640}{641:}procedure dvifontdef(f:internalfontnumber);
var k:poolpointer;begin if f<=256 then begin begin dvibuf[dviptr]:=243;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=f-1;incr(dviptr);if dviptr=dvilimit then dviswap;
end;end else begin begin dvibuf[dviptr]:=244;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=(f-1)div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(f-1)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
begin dvibuf[dviptr]:=fontcheck[f].b0;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=fontcheck[f].b1;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=fontcheck[f].b2;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=fontcheck[f].b3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(fontsize[f]);
dvifour(fontdsize[f]);
begin dvibuf[dviptr]:=(strstart[fontarea[f]+1]-strstart[fontarea[f]]);
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(strstart[fontname[f]+1]-strstart[fontname[f]]);
incr(dviptr);if dviptr=dvilimit then dviswap;end;
{642:}for k:=strstart[fontarea[f]]to strstart[fontarea[f]+1]-1 do begin
dvibuf[dviptr]:=strpool[k];incr(dviptr);if dviptr=dvilimit then dviswap;
end;
for k:=strstart[fontname[f]]to strstart[fontname[f]+1]-1 do begin dvibuf
[dviptr]:=strpool[k];incr(dviptr);if dviptr=dvilimit then dviswap;
end{:642};end;{:641}{646:}procedure movement(w:scaled;o:eightbits);
label 10,40,45,2,1;var mstate:smallnumber;p,q:halfword;k:integer;
begin q:=getnode(3);mem[q+1].int:=w;mem[q+2].int:=dvioffset+dviptr;
if o=157 then begin mem[q].hh.rh:=downptr;downptr:=q;
end else begin mem[q].hh.rh:=rightptr;rightptr:=q;end;
{650:}p:=mem[q].hh.rh;mstate:=0;
while p<>-1073741823 do begin if mem[p+1].int=w then{651:}case mstate+
mem[p].hh.lh of 3,4,15,16:if mem[p+2].int<dvigone then goto 45 else
{652:}begin k:=mem[p+2].int-dvioffset;if k<0 then k:=k+dvibufsize;
dvibuf[k]:=dvibuf[k]+5;mem[p].hh.lh:=1;goto 40;end{:652};
5,9,11:if mem[p+2].int<dvigone then goto 45 else{653:}begin k:=mem[p+2].
int-dvioffset;if k<0 then k:=k+dvibufsize;dvibuf[k]:=dvibuf[k]+10;
mem[p].hh.lh:=2;goto 40;end{:653};1,2,8,13:goto 40;
others:end{:651}else case mstate+mem[p].hh.lh of 1:mstate:=6;
2:mstate:=12;8,13:goto 45;others:end;p:=mem[p].hh.rh;end;45:{:650};
{649:}mem[q].hh.lh:=3;
if abs(w)>=8388608 then begin begin dvibuf[dviptr]:=o+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(w);goto 10;end;
if abs(w)>=32768 then begin begin dvibuf[dviptr]:=o+2;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if w<0 then w:=w+16777216;
begin dvibuf[dviptr]:=w div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;w:=w mod 65536;goto 2;end;
if abs(w)>=128 then begin begin dvibuf[dviptr]:=o+1;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if w<0 then w:=w+65536;goto 2;end;
begin dvibuf[dviptr]:=o;incr(dviptr);if dviptr=dvilimit then dviswap;
end;if w<0 then w:=w+256;goto 1;2:begin dvibuf[dviptr]:=w div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
1:begin dvibuf[dviptr]:=w mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;goto 10{:649};
40:{648:}mem[q].hh.lh:=mem[p].hh.lh;
if mem[q].hh.lh=1 then begin begin dvibuf[dviptr]:=o+4;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
while mem[q].hh.rh<>p do begin q:=mem[q].hh.rh;
case mem[q].hh.lh of 3:mem[q].hh.lh:=5;4:mem[q].hh.lh:=6;others:end;end;
end else begin begin dvibuf[dviptr]:=o+9;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
while mem[q].hh.rh<>p do begin q:=mem[q].hh.rh;
case mem[q].hh.lh of 3:mem[q].hh.lh:=4;5:mem[q].hh.lh:=6;others:end;end;
end{:648};10:end;{:646}{654:}procedure prunemovements(l:integer);
label 30,10;var p:halfword;
begin while downptr<>-1073741823 do begin if mem[downptr+2].int<l then
goto 30;p:=downptr;downptr:=mem[p].hh.rh;freenode(p,3);end;
30:while rightptr<>-1073741823 do begin if mem[rightptr+2].int<l then
goto 10;p:=rightptr;rightptr:=mem[p].hh.rh;freenode(p,3);end;10:end;
{:654}{657:}procedure vlistout;forward;
{:657}{658:}{1412:}procedure specialout(p:halfword);label 30;
var oldsetting:0..21;h:halfword;k:poolpointer;q,r:halfword;
oldmode:integer;s,t,cw,num,denom:scaled;bl:boolean;i:smallnumber;
begin if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
oldsetting:=selector;if mem[p].hh.b1=4 then begin{1415:}q:=getavail;
mem[q].hh.lh:=131197;r:=getavail;mem[q].hh.rh:=r;
mem[r].hh.lh:=536909729;begintokenlist(q,4);
begintokenlist(mem[p+1].hh.rh,16);q:=getavail;mem[q].hh.lh:=65659;
begintokenlist(q,4);oldmode:=curlist.modefield;curlist.modefield:=0;
curcs:=writeloc;q:=scantoks(false,true);curlist.modefield:=oldmode;
gettoken;
if curtok<>536909729 then{1416:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(709);
end;begin helpptr:=2;helpline[1]:=1527;helpline[0]:=1184;end;error;
repeat gettoken;until curtok=536909729;end{:1416};endtokenlist{:1415};
h:=defref;end else h:=mem[p+1].hh.rh;selector:=21;
showtokenlist(mem[h].hh.rh,-1073741823,poolsize-poolptr);
selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(260,poolsize-initpoolptr);end;
if(poolptr-strstart[strptr])<256 then begin begin dvibuf[dviptr]:=239;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(poolptr-strstart[strptr]);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=242;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour((poolptr-strstart[strptr]));
end;
for k:=strstart[strptr]to poolptr-1 do begin dvibuf[dviptr]:=strpool[k];
incr(dviptr);if dviptr=dvilimit then dviswap;end;
if eqtb[114439].int>0 then{1785:}begin k:=strstart[strptr];
if k+(10)>poolptr then goto 30 else if(strpool[k+0]<>'p')or(strpool[k+1]
<>'a')or(strpool[k+2]<>'p')or(strpool[k+3]<>'e')or(strpool[k+4]<>'r')or(
strpool[k+5]<>'s')or(strpool[k+6]<>'i')or(strpool[k+7]<>'z')or(strpool[k
+8]<>'e')or(strpool[k+9]<>'=')then goto 30;k:=k+10;{1786:}s:=0;t:=0;
bl:=true;
while(k<poolptr)and bl do if(strpool[k]>='0')and(strpool[k]<='9')then
begin s:=10*s+strpool[k]-'0';incr(k);end else bl:=false;
if k+(1)>poolptr then goto 30 else if strpool[k]='.'then begin incr(k);
bl:=true;i:=0;dig[0]:=0;
while(k<poolptr)and bl do begin if(strpool[k]>='0')and(strpool[k]<='9')
then begin if i<17 then begin dig[i]:=strpool[k]-'0';incr(i);end;
incr(k);end else bl:=false;end;t:=rounddecimals(i);end;
if k+4>poolptr then if(strpool[k]='t')and(strpool[k+1]='r')and(strpool[k
+2]='u')and(strpool[k+3]='e')then k:=k+4;
if eqtb[114378].int<>1000 then begin s:=xnoverd(s,1000,eqtb[114378].int)
;t:=(1000*t+65536*texremainder)div eqtb[114378].int;s:=s+(t div 65536);
t:=t mod 65536;end;bl:=true;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('p')
and(strpool[k+1]=('t'))then begin bl:=false;k:=k+2;s:=s*65536+t end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('i')
and(strpool[k+1]=('n'))then begin bl:=false;k:=k+2;num:=7227;
s:=xnoverd(s,num,100);
s:=s*65536+((num*t+65536*texremainder)div 100)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('p')
and(strpool[k+1]=('c'))then begin bl:=false;k:=k+2;num:=12;
s:=xnoverd(s,num,1);s:=s*65536+((num*t+65536*texremainder)div 1)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('c')
and(strpool[k+1]=('m'))then begin bl:=false;k:=k+2;num:=7227;
s:=xnoverd(s,num,254);
s:=s*65536+((num*t+65536*texremainder)div 254)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('m')
and(strpool[k+1]=('m'))then begin bl:=false;k:=k+2;num:=7227;
s:=xnoverd(s,num,2540);
s:=s*65536+((num*t+65536*texremainder)div 2540)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('b')
and(strpool[k+1]=('p'))then begin bl:=false;k:=k+2;num:=7227;
s:=xnoverd(s,num,7200);
s:=s*65536+((num*t+65536*texremainder)div 7200)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('d')
and(strpool[k+1]=('d'))then begin bl:=false;k:=k+2;num:=1238;
s:=xnoverd(s,num,1157);
s:=s*65536+((num*t+65536*texremainder)div 1157)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('c')
and(strpool[k+1]=('c'))then begin bl:=false;k:=k+2;num:=14856;
s:=xnoverd(s,num,1157);
s:=s*65536+((num*t+65536*texremainder)div 1157)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('s')
and(strpool[k+1]=('p'))then begin bl:=false;k:=k+2;end end;{:1786};
if k+(1)>poolptr then goto 30 else if strpool[k]=','then begin incr(k);
cw:=s;{1786:}s:=0;t:=0;bl:=true;
while(k<poolptr)and bl do if(strpool[k]>='0')and(strpool[k]<='9')then
begin s:=10*s+strpool[k]-'0';incr(k);end else bl:=false;
if k+(1)>poolptr then goto 30 else if strpool[k]='.'then begin incr(k);
bl:=true;i:=0;dig[0]:=0;
while(k<poolptr)and bl do begin if(strpool[k]>='0')and(strpool[k]<='9')
then begin if i<17 then begin dig[i]:=strpool[k]-'0';incr(i);end;
incr(k);end else bl:=false;end;t:=rounddecimals(i);end;
if k+4>poolptr then if(strpool[k]='t')and(strpool[k+1]='r')and(strpool[k
+2]='u')and(strpool[k+3]='e')then k:=k+4;
if eqtb[114378].int<>1000 then begin s:=xnoverd(s,1000,eqtb[114378].int)
;t:=(1000*t+65536*texremainder)div eqtb[114378].int;s:=s+(t div 65536);
t:=t mod 65536;end;bl:=true;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('p')
and(strpool[k+1]=('t'))then begin bl:=false;k:=k+2;s:=s*65536+t end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('i')
and(strpool[k+1]=('n'))then begin bl:=false;k:=k+2;num:=7227;
s:=xnoverd(s,num,100);
s:=s*65536+((num*t+65536*texremainder)div 100)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('p')
and(strpool[k+1]=('c'))then begin bl:=false;k:=k+2;num:=12;
s:=xnoverd(s,num,1);s:=s*65536+((num*t+65536*texremainder)div 1)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('c')
and(strpool[k+1]=('m'))then begin bl:=false;k:=k+2;num:=7227;
s:=xnoverd(s,num,254);
s:=s*65536+((num*t+65536*texremainder)div 254)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('m')
and(strpool[k+1]=('m'))then begin bl:=false;k:=k+2;num:=7227;
s:=xnoverd(s,num,2540);
s:=s*65536+((num*t+65536*texremainder)div 2540)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('b')
and(strpool[k+1]=('p'))then begin bl:=false;k:=k+2;num:=7227;
s:=xnoverd(s,num,7200);
s:=s*65536+((num*t+65536*texremainder)div 7200)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('d')
and(strpool[k+1]=('d'))then begin bl:=false;k:=k+2;num:=1238;
s:=xnoverd(s,num,1157);
s:=s*65536+((num*t+65536*texremainder)div 1157)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('c')
and(strpool[k+1]=('c'))then begin bl:=false;k:=k+2;num:=14856;
s:=xnoverd(s,num,1157);
s:=s*65536+((num*t+65536*texremainder)div 1157)end end;
if bl then begin if k+(2)>poolptr then goto 30 else if strpool[k]=('s')
and(strpool[k+1]=('p'))then begin bl:=false;k:=k+2;end end;{:1786};
if poolptr>k then goto 30;geqworddefine(114980,cw);
geqworddefine(114981,s);curpageheight:=s;curpagewidth:=cw;end;end;
{:1785};30:poolptr:=strstart[strptr];
if mem[p].hh.b1=4 then flushlist(defref);end;
{:1412}{1414:}procedure writeout(p:halfword);var oldsetting:0..21;
oldmode:integer;j:smallnumber;q,r:halfword;k:integer;d:integer;
clobbered:boolean;runsystemret:integer;begin{1415:}q:=getavail;
mem[q].hh.lh:=131197;r:=getavail;mem[q].hh.rh:=r;
mem[r].hh.lh:=536909729;begintokenlist(q,4);
begintokenlist(mem[p+1].hh.rh,16);q:=getavail;mem[q].hh.lh:=65659;
begintokenlist(q,4);oldmode:=curlist.modefield;curlist.modefield:=0;
curcs:=writeloc;q:=scantoks(false,true);curlist.modefield:=oldmode;
gettoken;
if curtok<>536909729 then{1416:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(709);
end;begin helpptr:=2;helpline[1]:=1527;helpline[0]:=1184;end;error;
repeat gettoken;until curtok=536909729;end{:1416};endtokenlist{:1415};
oldsetting:=selector;j:=mem[p+1].hh.lh;
if j=18 then selector:=21 else if writeopen[j]then selector:=j else
begin if(j=17)and(selector=19)then selector:=18;printnl(349);end;
tokenshow(defref);println;flushlist(defref);
if j=18 then begin if(eqtb[114390].int<=0)then selector:=18 else
selector:=19;if not logopened then selector:=17;printnl(1519);
for d:=0 to(poolptr-strstart[strptr])-1 do begin if strpool[strstart[
strptr]+d]>=256 then printchar(strpool[strstart[strptr]+d])else print(
strpool[strstart[strptr]+d]);end;print(1520);
if shellenabledp then begin begin if poolptr+1>poolsize then overflow(
260,poolsize-initpoolptr);end;begin strpool[poolptr]:=0;incr(poolptr);
end;clobbered:=false;
for d:=0 to(poolptr-strstart[strptr])-1 do begin strpool[strstart[strptr
]+d]:=xchr[strpool[strstart[strptr]+d]];
if(strpool[strstart[strptr]+d]=0)and(d<(poolptr-strstart[strptr])-1)then
clobbered:=true;end;
if clobbered then print(1521)else begin if nameoffile then libcfree(
nameoffile);nameoffile:=xmalloc((poolptr-strstart[strptr])*4+1);k:=0;
for d:=0 to(poolptr-strstart[strptr])-1 do begin if(strpool[strstart[
strptr]+d])>=256 then begin c:=(strpool[strstart[strptr]+d])-256;
begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];end;
end else begin c:=strpool[strstart[strptr]+d];
if(c>=128)and(not isinternalUPTEX)and isterminalUTF8 then begin begin
incr(k);if k<=maxint then nameoffile[k]:=xchr[94];end;begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[94];end;
if(c div 16)<10 then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c div 16)+48];
end else begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c div 16)+87];end;
if(c mod 16)<10 then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c mod 16)+48];
end else begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[(c mod 16)+87];end;
end else begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];end;
end end;nameoffile[k+1]:=0;
runsystemret:=runsystem(conststringcast(nameoffile+1));
if runsystemret=-1 then print(1522)else if runsystemret=0 then print(
1523)else if runsystemret=1 then print(1524)else if runsystemret=2 then
print(1525)end;end else begin print(1526);end;printchar(46);
printnl(349);println;poolptr:=strstart[strptr];end;selector:=oldsetting;
end;{:1414}{1417:}procedure outwhat(p:halfword);var j:smallnumber;
oldsetting:0..21;
begin case mem[p].hh.b1 of 0,1,2:{1418:}if not doingleaders then begin j
:=mem[p+1].hh.lh;
if mem[p].hh.b1=1 then writeout(p)else begin if writeopen[j]then begin
aclose(writefile[j]);writeopen[j]:=false;end;
if mem[p].hh.b1=2 then else if j<16 then begin curname:=mem[p+1].hh.rh;
curarea:=mem[p+2].hh.lh;curext:=mem[p+2].hh.rh;
if curext=349 then curext:=947;packfilename(curname,curarea,curext);
while not kpseoutnameok(stringcast(nameoffile+1))or not aopenout(
writefile[j])do promptfilename(1529,947);writeopen[j]:=true;
if logopened and texmfyesno('log_openout')then begin oldsetting:=
selector;if(eqtb[114390].int<=0)then selector:=18 else selector:=19;
printnl(1530);printint(j);print(1531);
printfilename(curname,curarea,curext);print(946);printnl(349);println;
selector:=oldsetting;end;end;end;end{:1418};3,4:specialout(p);5:;
8:{1783:}begin case dvidir of 4:begin pdflastxpos:=curh;
pdflastypos:=curv;end;3:begin pdflastxpos:=-curv;pdflastypos:=curh;end;
1:begin pdflastxpos:=curv;pdflastypos:=-curh;end;end;
pdflastxpos:=pdflastxpos+4736286;
pdflastypos:=curpageheight-pdflastypos-4736286;end{:1783};
others:confusion(1528)end;end;
{:1417}{1496:}function newedge(s:smallnumber;w:scaled):halfword;
var p:halfword;begin p:=getnode(3);mem[p].hh.b0:=16;mem[p].hh.b1:=s;
mem[p+1].int:=w;mem[p+2].int:=0;newedge:=p;end;
{:1496}{1500:}function reverse(thisbox,t:halfword;var curg:scaled;
var curglue:real):halfword;label 21,15,30;var l,la:halfword;
disp,disp2:scaled;disped:boolean;p:halfword;q:halfword;gorder:glueord;
gsign:0..2;gluetemp:real;m,n:halfword;
begin gorder:=mem[thisbox+5].hh.b1;gsign:=mem[thisbox+5].hh.b0;
disp:=revdisp;disped:=false;l:=t;p:=tempptr;m:=-1073741823;
n:=-1073741823;
while true do begin while p<>-1073741823 do{1505:}21:if(p>=himemmin)then
repeat f:=mem[p].hh.b0;c:=mem[p].hh.b1;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true
,f,c)].qqqq.b0].int;if fontdir[f]<>0 then begin q:=mem[p].hh.rh;la:=l;
l:=p;p:=mem[q].hh.rh;mem[q].hh.rh:=la;end else begin q:=mem[p].hh.rh;
mem[p].hh.rh:=l;l:=p;p:=q;end;
until not(p>=himemmin)else{1506:}begin q:=mem[p].hh.rh;
case mem[p].hh.b0 of 0,1,3,13:rulewd:=mem[p+1].int;
{1507:}12:begin g:=mem[p+1].hh.lh;rulewd:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;rulewd:=rulewd+curg;
{1476:}if(((gsign=1)and(mem[g].hh.b0=gorder))or((gsign=2)and(mem[g].hh.
b1=gorder)))then begin begin if mem[g].hh.rh=-1073741823 then freenode(g
,4)else decr(mem[g].hh.rh);end;
if mem[p].hh.b1<100 then begin mem[p].hh.b0:=13;mem[p+1].int:=rulewd;
end else begin g:=getnode(4);mem[g].hh.b0:=5;mem[g].hh.b1:=5;
mem[g+1].int:=rulewd;mem[g+2].int:=0;mem[g+3].int:=0;mem[p+1].hh.lh:=g;
end;end{:1476};end;{:1507}{1508:}8:begin flushnodelist(mem[p+1].hh.rh);
tempptr:=p;p:=getavail;mem[p]:=mem[tempptr+1];mem[p].hh.rh:=q;
freenode(tempptr,2);goto 21;end;
{:1508}{1509:}11:begin rulewd:=mem[p+1].int;
if odd(mem[p].hh.b1)then if mem[LRptr].hh.lh<>(4*(mem[p].hh.b1 div 4)+3)
then begin mem[p].hh.b0:=13;incr(LRproblems);
end else begin begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if n>-1073741823 then begin decr(n);decr(mem[p].hh.b1);
end else begin mem[p].hh.b0:=13;
if m>-1073741823 then decr(m)else{1510:}begin freenode(p,4);
mem[t].hh.rh:=q;mem[t+1].int:=rulewd;mem[t+2].int:=-curh-rulewd;goto 30;
end{:1510};end;end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(n>-1073741823)or((mem[p].hh.b1 div 8)<>curdir)then begin incr(n);
incr(mem[p].hh.b1);end else begin mem[p].hh.b0:=13;incr(m);end;end;end;
{:1509}16:confusion(1612);5:begin disp2:=mem[p+1].int;
mem[p+1].int:=disp;disp:=disp2;if not disped then disped:=true;end;
others:goto 15 end;curh:=curh+rulewd;15:mem[p].hh.rh:=l;
if mem[p].hh.b0=13 then if(rulewd=0)or(l=-1073741823)then begin freenode
(p,4);p:=l;end;l:=p;p:=q;end{:1506}{:1505};
if(t=-1073741823)and(m=-1073741823)and(n=-1073741823)then goto 30;
p:=newmath(0,mem[LRptr].hh.lh);LRproblems:=LRproblems+10000;end;
30:if(l<>-1073741823)and(mem[l].hh.b0<>5)then begin p:=getnode(2);
mem[p].hh.b0:=5;mem[p+1].int:=disp;mem[p].hh.rh:=l;reverse:=p;
end else reverse:=l;end;
{:1500}{1501:}{[1502:]function newsegment(s:smallnumber;
f:halfword):halfword;var p:halfword;begin p:=getnode(3);
mem[p].hh.b0:=16;mem[p].hh.b1:=s;mem[p+1].int:=0;mem[p+2].hh.lh:=f;
mem[p+2].hh.rh:=f;newsegment:=p;end;
[:1502][1504:]function haswhatsit(p:halfword):boolean;label 10;
begin p:=mem[p+5].hh.rh;haswhatsit:=true;
while p<>-1073741823 do begin if not(p>=himemmin)then case mem[p].hh.b0
of 0,1:if haswhatsit(p)then goto 10;10:goto 10;others:end;
p:=mem[p].hh.rh;end;haswhatsit:=false;10:end;
[:1504]function reverse(thisbox,t:halfword;var curg:scaled;
var curglue:real):halfword;label 21,15,30;var l:halfword;p:halfword;
q:halfword;gorder:glueord;gsign:0..2;gluetemp:real;m,n:halfword;
begin gorder:=mem[thisbox+5].hh.b1;gsign:=mem[thisbox+5].hh.b0;
[1503:]begin end[:1503];l:=t;p:=tempptr;m:=-1073741823;n:=-1073741823;
while true do begin while p<>-1073741823 do[1505:]21:if(p>=himemmin)then
repeat f:=mem[p].hh.b0;c:=mem[p].hh.b1;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true
,f,c)].qqqq.b0].int;if fontdir[f]<>0 then begin q:=mem[p].hh.rh;la:=l;
l:=p;p:=mem[q].hh.rh;mem[q].hh.rh:=la;end else begin q:=mem[p].hh.rh;
mem[p].hh.rh:=l;l:=p;p:=q;end;
until not(p>=himemmin)else[1506:]begin q:=mem[p].hh.rh;
case mem[p].hh.b0 of 0,1,3,13:rulewd:=mem[p+1].int;
[1507:]12:begin g:=mem[p+1].hh.lh;rulewd:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;rulewd:=rulewd+curg;
[1476:]if(((gsign=1)and(mem[g].hh.b0=gorder))or((gsign=2)and(mem[g].hh.
b1=gorder)))then begin begin if mem[g].hh.rh=-1073741823 then freenode(g
,4)else decr(mem[g].hh.rh);end;
if mem[p].hh.b1<100 then begin mem[p].hh.b0:=13;mem[p+1].int:=rulewd;
end else begin g:=getnode(4);mem[g].hh.b0:=5;mem[g].hh.b1:=5;
mem[g+1].int:=rulewd;mem[g+2].int:=0;mem[g+3].int:=0;mem[p+1].hh.lh:=g;
end;end[:1476];end;[:1507][1508:]8:begin flushnodelist(mem[p+1].hh.rh);
tempptr:=p;p:=getavail;mem[p]:=mem[tempptr+1];mem[p].hh.rh:=q;
freenode(tempptr,2);goto 21;end;
[:1508][1509:]11:begin rulewd:=mem[p+1].int;
if odd(mem[p].hh.b1)then if mem[LRptr].hh.lh<>(4*(mem[p].hh.b1 div 4)+3)
then begin mem[p].hh.b0:=13;incr(LRproblems);
end else begin begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if n>-1073741823 then begin decr(n);decr(mem[p].hh.b1);
end else begin mem[p].hh.b0:=13;
if m>-1073741823 then decr(m)else[1510:]begin freenode(p,4);
mem[t].hh.rh:=q;mem[t+1].int:=rulewd;mem[t+2].int:=-curh-rulewd;goto 30;
end[:1510];end;end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(n>-1073741823)or((mem[p].hh.b1 div 8)<>curdir)then begin incr(n);
incr(mem[p].hh.b1);end else begin mem[p].hh.b0:=13;incr(m);end;end;end;
[:1509]16:confusion(1612);5:begin disp2:=mem[p+1].int;
mem[p+1].int:=disp;disp:=disp2;if not disped then disped:=true;end;
others:goto 15 end;curh:=curh+rulewd;15:mem[p].hh.rh:=l;
if mem[p].hh.b0=13 then if(rulewd=0)or(l=-1073741823)then begin freenode
(p,4);p:=l;end;l:=p;p:=q;end[:1506][:1505];
if(t=-1073741823)and(m=-1073741823)and(n=-1073741823)then goto 30;
p:=newmath(0,mem[LRptr].hh.lh);LRproblems:=LRproblems+10000;end;
30:reverse:=l;end;}{:1501}{1709:}procedure synchdir;var tmp:scaled;
begin case curdirhv of 4:if dvidir<>curdirhv then begin if curh<>dvih
then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=255;incr(dviptr);if dviptr=dvilimit then dviswap;
end;begin dvibuf[dviptr]:=0;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dirused:=true;
case dvidir of 3:begin tmp:=curh;curh:=-curv;curv:=tmp end;
1:begin tmp:=curh;curh:=curv;curv:=-tmp end;end;dvih:=curh;dviv:=curv;
dvidir:=curdirhv;end;
3:if dvidir<>curdirhv then begin if curh<>dvih then begin movement(curh-
dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=255;incr(dviptr);if dviptr=dvilimit then dviswap;
end;begin dvibuf[dviptr]:=1;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dirused:=true;
case dvidir of 4:begin tmp:=curh;curh:=curv;curv:=-tmp end;
1:begin curv:=-curv;curh:=-curh;end;end;dvih:=curh;dviv:=curv;
dvidir:=curdirhv;end;
1:if dvidir<>curdirhv then begin if curh<>dvih then begin movement(curh-
dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=255;incr(dviptr);if dviptr=dvilimit then dviswap;
end;begin dvibuf[dviptr]:=3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dirused:=true;
case dvidir of 4:begin tmp:=curh;curh:=-curv;curv:=tmp end;
3:begin curv:=-curv;curh:=-curh;end;end;dvih:=curh;dviv:=curv;
dvidir:=curdirhv;end;others:confusion(1705);end end;
{:1709}{1711:}function checkbox(boxp:halfword):boolean;label 30;
var p:halfword;flag:boolean;begin flag:=false;p:=boxp;
while p<>-1073741823 do begin if(p>=himemmin)then repeat if
findfirstchar then begin firstchar:=p;findfirstchar:=false end;
lastchar:=p;flag:=true;if fontdir[mem[p].hh.b0]<>0 then p:=mem[p].hh.rh;
p:=mem[p].hh.rh;if p=-1073741823 then goto 30;until not(p>=himemmin);
case mem[p].hh.b0 of 0:begin flag:=true;
if mem[p+4].int=0 then begin if checkbox(mem[p+5].hh.rh)then flag:=true;
end else if findfirstchar then findfirstchar:=false else lastchar:=
-1073741823;end;8:if checkbox(mem[p+1].hh.rh)then flag:=true;
4,5,6,7,10,14:;
11:if(mem[p].hh.b1=0)or(mem[p].hh.b1=1)then begin if findfirstchar then
begin findfirstchar:=false;firstchar:=p;end;lastchar:=p;flag:=true;
end else;13:if mem[p].hh.b1=2 then begin p:=mem[p].hh.rh;
if(p>=himemmin)then if fontdir[mem[p].hh.b0]<>0 then p:=mem[p].hh.rh;
p:=mem[mem[p].hh.rh].hh.rh;
if findfirstchar then begin findfirstchar:=false;firstchar:=p;end;
lastchar:=p;flag:=true;if fontdir[mem[p].hh.b0]<>0 then p:=mem[p].hh.rh;
end else begin flag:=true;
if findfirstchar then findfirstchar:=false else lastchar:=-1073741823;
end;others:begin flag:=true;
if findfirstchar then findfirstchar:=false else lastchar:=-1073741823;
end;end;p:=mem[p].hh.rh;end;30:checkbox:=flag;end;
{:1711}{1712:}procedure adjusthlist(p:halfword;pf:boolean);label 10;
var q,s,t,u,v,x,z:halfword;i,k:halfword;a:halfword;insertskip:0..2;
cx:KANJIcode;ax:sixteenbits;doins:boolean;
begin if mem[p].hh.rh=-1073741823 then goto 10;
if eqtb[51756].hh.rh>0 then begin deleteglueref(mem[p+7].hh.rh);
mem[p+7].hh.rh:=eqtb[49940].hh.rh;incr(mem[eqtb[49940].hh.rh].hh.rh);
end;if eqtb[51757].hh.rh>0 then begin deleteglueref(mem[p+7].hh.lh);
mem[p+7].hh.lh:=eqtb[49941].hh.rh;incr(mem[eqtb[49941].hh.rh].hh.rh);
end;u:=mem[p+7].hh.rh;incr(mem[u].hh.rh);s:=mem[p+7].hh.lh;
incr(mem[s].hh.rh);
if not(mem[p].hh.rh>=himemmin)then if(mem[mem[p].hh.rh].hh.b0=12)and(mem
[mem[p].hh.rh].hh.b1=21)then begin v:=mem[p].hh.rh;
mem[p].hh.rh:=mem[v].hh.rh;
begin if mem[mem[v+1].hh.lh].hh.rh=-1073741823 then freenode(mem[v+1].hh
.lh,4)else decr(mem[mem[v+1].hh.lh].hh.rh);end;freenode(v,2);
end else if(mem[mem[p].hh.rh].hh.b0=14)and(mem[mem[p].hh.rh].hh.b1=2)
then begin v:=mem[mem[p].hh.rh].hh.rh;
if(not(v>=himemmin))and(mem[v].hh.b0=12)and(mem[v].hh.b1=21)then begin
mem[mem[p].hh.rh].hh.rh:=mem[v].hh.rh;
begin if mem[mem[v+1].hh.lh].hh.rh=-1073741823 then freenode(mem[v+1].hh
.lh,4)else decr(mem[mem[v+1].hh.lh].hh.rh);end;freenode(v,2);end end;
i:=0;insertskip:=0;p:=mem[p].hh.rh;v:=p;q:=p;
while p<>-1073741823 do begin if(p>=himemmin)then begin repeat{1713:}if
fontdir[mem[p].hh.b0]<>0 then begin cx:=ktokentochr(mem[mem[p].hh.rh].hh
.lh);if insertskip=1 then{1720:}begin begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=1)then
doins:=false else doins:=true else doins:=true;end;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1720};
p:=mem[p].hh.rh;insertskip:=2;end else begin ax:=mem[p].hh.b1;
if insertskip=2 then{1721:}begin if(eqtb[64175+ax].hh.rh mod 2)=1 then
begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=2)then
doins:=false else doins:=true else doins:=true;end else doins:=false;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1721};
if eqtb[64175+ax].hh.rh>=2 then insertskip:=1 else insertskip:=0;
end{:1713};q:=p;p:=mem[p].hh.rh;incr(i);
if(i>5)and pf then begin if(v>=himemmin)then if fontdir[mem[v].hh.b0]<>0
then v:=mem[v].hh.rh;v:=mem[v].hh.rh;end;until not(p>=himemmin);
end else begin case mem[p].hh.b0 of 0:{1714:}begin findfirstchar:=true;
firstchar:=-1073741823;lastchar:=-1073741823;
if mem[p+4].int=0 then begin if checkbox(mem[p+5].hh.rh)then begin if
firstchar<>-1073741823 then{1715:}if mem[firstchar].hh.b0=11 then begin
ax:=48;
if insertskip=2 then{1721:}begin if(eqtb[64175+ax].hh.rh mod 2)=1 then
begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=2)then
doins:=false else doins:=true else doins:=true;end else doins:=false;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1721};
end else if fontdir[mem[firstchar].hh.b0]<>0 then begin cx:=ktokentochr(
mem[mem[firstchar].hh.rh].hh.lh);
if insertskip=1 then{1720:}begin begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=1)then
doins:=false else doins:=true else doins:=true;end;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;
end{:1720}else if insertskip=2 then{1722:}begin z:=newglue(u);
mem[z].hh.b1:=16;mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;
end{:1722};end else begin ax:=mem[firstchar].hh.b1;
if insertskip=2 then{1721:}begin if(eqtb[64175+ax].hh.rh mod 2)=1 then
begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=2)then
doins:=false else doins:=true else doins:=true;end else doins:=false;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1721};end;
{:1715};
if lastchar<>-1073741823 then begin{1716:}if mem[lastchar].hh.b0=11 then
begin ax:=48;
if eqtb[64175+ax].hh.rh>=2 then insertskip:=1 else insertskip:=0;
end else if fontdir[mem[lastchar].hh.b0]<>0 then begin insertskip:=2;
cx:=ktokentochr(mem[mem[lastchar].hh.rh].hh.lh);
if(mem[p].hh.rh>=himemmin)and(fontdir[mem[mem[p].hh.rh].hh.b0]<>0)then
begin{1723:}begin z:=newglue(u);mem[z].hh.b1:=16;
mem[z].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=z;p:=mem[z].hh.rh;q:=z;
end{:1723};p:=mem[p].hh.rh;end;end else begin ax:=mem[lastchar].hh.b1;
if eqtb[64175+ax].hh.rh>=2 then insertskip:=1 else insertskip:=0;end;
{:1716};end else insertskip:=0;end else insertskip:=0;
end else insertskip:=0;end{:1714};8:{1718:}begin t:=mem[p+1].hh.rh;
if(t>=himemmin)then begin ax:=mem[t].hh.b1;
if insertskip=2 then{1721:}begin if(eqtb[64175+ax].hh.rh mod 2)=1 then
begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=2)then
doins:=false else doins:=true else doins:=true;end else doins:=false;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1721};
while mem[t].hh.rh<>-1073741823 do t:=mem[t].hh.rh;
if(t>=himemmin)then begin ax:=mem[t].hh.b1;
if eqtb[64175+ax].hh.rh>=2 then insertskip:=1 else insertskip:=0;end;
end;end{:1718};
14,5:{1719:}begin if(mem[p].hh.rh>=himemmin)then begin q:=p;
p:=mem[p].hh.rh;
if fontdir[mem[p].hh.b0]<>0 then begin cx:=ktokentochr(mem[mem[p].hh.rh]
.hh.lh);if insertskip=1 then{1720:}begin begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=1)then
doins:=false else doins:=true else doins:=true;end;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;
end{:1720}else if insertskip=2 then{1722:}begin z:=newglue(u);
mem[z].hh.b1:=16;mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;
end{:1722};p:=mem[p].hh.rh;insertskip:=2;
end else begin ax:=mem[p].hh.b1;
if insertskip=2 then{1721:}begin if(eqtb[64175+ax].hh.rh mod 2)=1 then
begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=2)then
doins:=false else doins:=true else doins:=true;end else doins:=false;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1721};
if eqtb[64175+ax].hh.rh>=2 then insertskip:=1 else insertskip:=0;end;
end end{:1719};
13:if mem[p].hh.b1=1 then insertskip:=0 else if mem[p].hh.b1=2 then
begin if q=p then begin t:=mem[p].hh.rh;
if(t>=himemmin)then if fontdir[mem[t].hh.b0]<>0 then t:=mem[t].hh.rh;
p:=mem[mem[t].hh.rh].hh.rh;
if fontdir[mem[p].hh.b0]<>0 then begin p:=mem[p].hh.rh;insertskip:=2;
end else insertskip:=1;end else begin a:=p;t:=mem[p].hh.rh;
if(t>=himemmin)then if fontdir[mem[t].hh.b0]<>0 then t:=mem[t].hh.rh;
t:=mem[mem[t].hh.rh].hh.rh;mem[q].hh.rh:=t;p:=t;
{1713:}if fontdir[mem[p].hh.b0]<>0 then begin cx:=ktokentochr(mem[mem[p]
.hh.rh].hh.lh);
if insertskip=1 then{1720:}begin begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=1)then
doins:=false else doins:=true else doins:=true;end;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1720};
p:=mem[p].hh.rh;insertskip:=2;end else begin ax:=mem[p].hh.b1;
if insertskip=2 then{1721:}begin if(eqtb[64175+ax].hh.rh mod 2)=1 then
begin x:=getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=2)then
doins:=false else doins:=true else doins:=true;end else doins:=false;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1721};
if eqtb[64175+ax].hh.rh>=2 then insertskip:=1 else insertskip:=0;
end{:1713};incr(i);
if(i>5)and pf then begin if(v>=himemmin)then if fontdir[mem[v].hh.b0]<>0
then v:=mem[v].hh.rh;v:=mem[v].hh.rh;end;
if mem[q].hh.rh<>t then mem[mem[q].hh.rh].hh.rh:=a else mem[q].hh.rh:=a;
end;end;
11:{1717:}begin if(mem[p].hh.b1=0)and(insertskip=2)then begin ax:=48;
{1721:}begin if(eqtb[64175+ax].hh.rh mod 2)=1 then begin x:=
getinhibitpos(cx,1);
if x<>10000 then if(eqtb[76079+x].hh.b0=0)or(eqtb[76079+x].hh.b0=2)then
doins:=false else doins:=true else doins:=true;end else doins:=false;
if doins then begin z:=newglue(s);mem[z].hh.b1:=17;
mem[z].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=z;q:=z;end;end{:1721};
insertskip:=0;end else if mem[p].hh.b1=1 then begin ax:=48;
if eqtb[64175+ax].hh.rh>=2 then insertskip:=1 else insertskip:=0;
end else insertskip:=0;end{:1717};6,7,4,10:;others:insertskip:=0;end;
q:=p;p:=mem[p].hh.rh;end;end;
if not(q>=himemmin)and(mem[q].hh.b0=12)and(mem[q].hh.b1=21)then begin
begin if mem[mem[q+1].hh.lh].hh.rh=-1073741823 then freenode(mem[q+1].hh
.lh,4)else decr(mem[mem[q+1].hh.lh].hh.rh);end;mem[q+1].hh.lh:=membot;
incr(mem[membot].hh.rh);end;deleteglueref(u);deleteglueref(s);
if(v<>-1073741823)and pf and(i>5)then{1724:}begin q:=v;p:=mem[v].hh.rh;
if(v>=himemmin)and(fontdir[mem[v].hh.b0]<>0)then begin q:=p;
p:=mem[p].hh.rh;end;t:=q;s:=-1073741823;{1725:}k:=0;
while(p<>-1073741823)do begin if(p>=himemmin)then begin if fontdir[mem[p
].hh.b0]<>0 then begin cx:=ktokentochr(mem[mem[p].hh.rh].hh.lh);
i:=ktokentocmd(mem[mem[p].hh.rh].hh.lh);k:=0;
if(i=16)or(i=17)or(i=19)or(i=20)then begin t:=q;s:=p;end;
p:=mem[p].hh.rh;q:=p;end else begin k:=k+1;if k>1 then begin q:=p;
s:=-1073741823;end;end;
end else begin case mem[p].hh.b0 of 14,6,7,10,12,13,11,5:;
others:begin q:=p;s:=-1073741823;end;end;end;p:=mem[p].hh.rh;end{:1725};
if s<>-1073741823 then begin s:=mem[t].hh.rh;
if not(s>=himemmin)and(mem[s].hh.b0=14)then mem[s+1].int:=mem[s+1].int+
eqtb[114417].int else if eqtb[114417].int<>0 then begin s:=newpenalty(
eqtb[114417].int);mem[s].hh.b1:=1;mem[s].hh.rh:=mem[t].hh.rh;
mem[t].hh.rh:=s;t:=mem[s].hh.rh;
while(not(t>=himemmin))do begin if(mem[t].hh.b0=12)or(mem[t].hh.b0=13)
then goto 10;t:=mem[t].hh.rh;end;z:=newglue(u);mem[z].hh.b1:=16;
mem[z].hh.rh:=mem[s].hh.rh;mem[s].hh.rh:=z;end;end;end;{:1724};10:end;
{:1712}{1726:}procedure dirout;var thisbox:halfword;
begin thisbox:=tempptr;tempptr:=mem[thisbox+5].hh.rh;
if(mem[tempptr].hh.b0<>0)and(mem[tempptr].hh.b0<>1)then confusion(1706);
case abs(((mem[thisbox].hh.b1)mod 16-5))of 4:case abs(((mem[tempptr].hh.
b1)mod 16-5))of 3:begin curv:=curv-mem[thisbox+3].int;
curh:=curh+mem[tempptr+2].int end;1:begin curv:=curv+mem[thisbox+2].int;
curh:=curh+mem[tempptr+3].int end;end;
3:case abs(((mem[tempptr].hh.b1)mod 16-5))of 4:begin curv:=curv+mem[
thisbox+2].int;curh:=curh+mem[tempptr+3].int end;
1:begin curv:=curv+mem[thisbox+2].int-mem[tempptr+3].int;
curh:=curh+mem[tempptr+1].int end;end;
1:case abs(((mem[tempptr].hh.b1)mod 16-5))of 4:begin curv:=curv-mem[
thisbox+3].int;curh:=curh+mem[tempptr+2].int end;
3:begin curv:=curv+mem[thisbox+2].int-mem[tempptr+3].int;
curh:=curh+mem[tempptr+1].int end;end;end;
curdirhv:=abs(((mem[tempptr].hh.b1)mod 16-5));
if mem[tempptr].hh.b0=1 then vlistout else hlistout;end;
{:1726}procedure hlistout;label 21,13,14,15,22,40;var baseline:scaled;
disp:scaled;savedir:eightbits;jc:KANJIcode;kspptr:halfword;
leftedge:scaled;saveh,savev:scaled;thisbox:halfword;gorder:glueord;
gsign:0..2;p:halfword;saveloc:integer;leaderbox:halfword;
leaderwd:scaled;lx:scaled;outerdoingleaders:boolean;edge:scaled;
prevp:halfword;gluetemp:real;curglue:real;curg:scaled;begin curg:=0;
curglue:=0.0;thisbox:=tempptr;gorder:=mem[thisbox+5].hh.b1;
gsign:=mem[thisbox+5].hh.b0;p:=mem[thisbox+5].hh.rh;
kspptr:=mem[thisbox+7].hh.rh;incr(curs);
if curs>0 then begin dvibuf[dviptr]:=141;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if curs>maxpush then maxpush:=curs;
saveloc:=dvioffset+dviptr;synchdir;baseline:=curv;disp:=0;revdisp:=0;
prevp:=thisbox+5;
{1491:}if(eTeXmode=1)then begin{1487:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1487};
if((mem[thisbox].hh.b1)div 16)=2 then if curdir=1 then begin curdir:=0;
curh:=curh-mem[thisbox+1].int;
end else mem[thisbox].hh.b1:=((mem[thisbox].hh.b1)mod 16-5)+5+16*(0);
if(curdir=1)and(((mem[thisbox].hh.b1)div 16)<>1)then{1498:}begin saveh:=
curh;tempptr:=p;p:=newkern(0);mem[p+2].int:=0;mem[prevp].hh.rh:=p;
curh:=0;mem[p].hh.rh:=reverse(thisbox,-1073741823,curg,curglue);
mem[p+1].int:=-curh;curh:=saveh;
mem[thisbox].hh.b1:=((mem[thisbox].hh.b1)mod 16-5)+5+16*(1);end{:1498};
end{:1491};leftedge:=curh;{1766:}synctexhlist(thisbox);{:1766};
while p<>-1073741823 do{659:}21:if(p>=himemmin)then begin if curh<>dvih
then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
chain:=false;repeat f:=mem[p].hh.b0;c:=mem[p].hh.b1;
if f<>dvif then{660:}begin if not fontused[f]then begin dvifontdef(f);
fontused[f]:=true;end;if f<=64 then begin dvibuf[dviptr]:=f+170;
incr(dviptr);if dviptr=dvilimit then dviswap;
end else if f<=256 then begin begin dvibuf[dviptr]:=235;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=f-1;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=236;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=(f-1)div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(f-1)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;dvif:=f;end{:660};
if fontdir[f]=0 then begin chain:=false;
c:=ptencucsto8bitcode(fontenc[f],c);
if fontec[f]>=c then if fontbc[f]<=c then if(fontinfo[charbase[f]+c].
qqqq.b0>0)then begin if c>=256 then begin begin dvibuf[dviptr]:=129;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=Hi(c);incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=Lo(c);
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if c>=128 then begin dvibuf[dviptr]:=128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=c;
incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+c].qqqq.b0].int;
goto 22;end;
if mltexenabledp then{1668:}begin{1670:}if c>=eqtb[114423].int then if c
<=eqtb[114424].int then if(eqtb[114105+c].hh.rh>0)then begin basec:=(
eqtb[114105+c].hh.rh mod 256);accentc:=(eqtb[114105+c].hh.rh div 256);
if(fontec[f]>=basec)then if(fontbc[f]<=basec)then if(fontec[f]>=accentc)
then if(fontbc[f]<=accentc)then begin iac:=fontinfo[charbase[f]+
effectivechar(true,f,accentc)].qqqq;
ibc:=fontinfo[charbase[f]+effectivechar(true,f,basec)].qqqq;
if(ibc.b0>0)then if(iac.b0>0)then goto 40;end;begindiagnostic;
printnl(1656);print(c);print(1410);print(accentc);print(32);
print(basec);print(987);slowprint(fontname[f]);printchar(33);
enddiagnostic(false);goto 22;end;begindiagnostic;printnl(986);
print(1655);print(c);print(987);slowprint(fontname[f]);printchar(33);
enddiagnostic(false);goto 22{:1670};
40:{1671:}if eqtb[114396].int>99 then begin begindiagnostic;
printnl(1657);print(c);print(1410);print(accentc);print(32);
print(basec);print(987);slowprint(fontname[f]);printchar(46);
enddiagnostic(false);end{:1671};
{1672:}basexheight:=fontinfo[5+parambase[f]].int;
baseslant:=fontinfo[1+parambase[f]].int/65536.0;accentslant:=baseslant;
basewidth:=fontinfo[widthbase[f]+ibc.b0].int;
baseheight:=fontinfo[heightbase[f]+(ibc.b1)div 256].int;
accentwidth:=fontinfo[widthbase[f]+iac.b0].int;
accentheight:=fontinfo[heightbase[f]+(iac.b1)div 256].int;
delta:=round((basewidth-accentwidth)/2.0+baseheight*baseslant-
basexheight*accentslant);dvih:=curh;curh:=curh+delta;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if((baseheight<>basexheight)and(accentheight>0))then begin curv:=
baseline+(basexheight-baseheight);
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
if accentc>=128 then begin dvibuf[dviptr]:=128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=accentc;
incr(dviptr);if dviptr=dvilimit then dviswap;end;curv:=baseline;
end else begin if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;if accentc>=128 then begin dvibuf[dviptr]:=128;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=accentc;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;curh:=curh+accentwidth;
dvih:=curh;curh:=curh+(-accentwidth-delta);
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
if basec>=128 then begin dvibuf[dviptr]:=128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=basec;
incr(dviptr);if dviptr=dvilimit then dviswap;end;curh:=curh+basewidth;
dvih:=curh{:1672};end{:1668};
22:end else begin if chain=false then chain:=true else begin curh:=curh+
mem[kspptr+1].int;
if gsign<>0 then begin if gsign=1 then begin if mem[kspptr].hh.b0=gorder
then curh:=curh+round(mem[thisbox+6].gr*mem[kspptr+2].int);
end else begin if mem[kspptr].hh.b1=gorder then curh:=curh-round(mem[
thisbox+6].gr*mem[kspptr+3].int);end;end;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;end;
prevp:=mem[prevp].hh.rh;p:=mem[p].hh.rh;jc:=ktokentochr(mem[p].hh.lh);
if fontenc[f]=2 then jc:=toUCS(jc)else if fontenc[f]=1 then begin if
toJIS(jc)=0 then charwarningjis(f,jc);jc:=toJIS(jc);
end else jc:=toDVI(jc);if(jc<65536)then begin begin dvibuf[dviptr]:=129;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else if(jc<16777216)then begin begin dvibuf[dviptr]:=130;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=BYTE2(jc);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=131;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=BYTE1(jc);
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=BYTE2(jc);incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;begin dvibuf[dviptr]:=BYTE3(jc);
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=BYTE4(jc);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+c].qqqq.b0].int;
end;dvih:=curh;p:=mem[p].hh.rh;until not(p>=himemmin);
{1769:}synctexcurrent;{:1769};chain:=false;
end else{661:}begin case mem[p].hh.b0 of 0,1,2:{662:}if mem[p+5].hh.rh=
-1073741823 then begin if mem[p].hh.b0<>2 then{1768:}if mem[p].hh.b0=1
then begin synctexvoidvlist(p,thisbox);
end else begin synctexvoidhlist(p,thisbox);end;{:1768};
curh:=curh+mem[p+1].int;end else begin saveh:=dvih;savev:=dviv;
savedir:=dvidir;curv:=baseline+disp+mem[p+4].int;tempptr:=p;
edge:=curh+mem[p+1].int;if curdir=1 then curh:=edge;
case mem[p].hh.b0 of 0:hlistout;1:vlistout;2:dirout;end;dvih:=saveh;
dviv:=savev;dvidir:=savedir;curh:=edge;curv:=baseline+disp;
curdirhv:=savedir;end{:662};3:begin ruleht:=mem[p+3].int;
ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;goto 14;end;
10:{1411:}outwhat(p){:1411};5:begin disp:=mem[p+1].int;revdisp:=disp;
curv:=baseline+disp;end;12:{664:}begin g:=mem[p+1].hh.lh;
rulewd:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;rulewd:=rulewd+curg;
if(eTeXmode=1)then{1476:}if(((gsign=1)and(mem[g].hh.b0=gorder))or((gsign
=2)and(mem[g].hh.b1=gorder)))then begin begin if mem[g].hh.rh=
-1073741823 then freenode(g,4)else decr(mem[g].hh.rh);end;
if mem[p].hh.b1<100 then begin mem[p].hh.b0:=13;mem[p+1].int:=rulewd;
end else begin g:=getnode(4);mem[g].hh.b0:=5;mem[g].hh.b1:=5;
mem[g+1].int:=rulewd;mem[g+2].int:=0;mem[g+3].int:=0;mem[p+1].hh.lh:=g;
end;end{:1476};
if mem[p].hh.b1>=100 then{665:}begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=3 then begin ruleht:=mem[leaderbox+3].int;
ruledp:=mem[leaderbox+2].int;goto 14;end;leaderwd:=mem[leaderbox+1].int;
if(leaderwd>0)and(rulewd>0)then begin rulewd:=rulewd+10;
if curdir=1 then curh:=curh-10;edge:=curh+rulewd;lx:=0;
{666:}if mem[p].hh.b1=100 then begin saveh:=curh;
curh:=leftedge+leaderwd*((curh-leftedge)div leaderwd);
if curh<saveh then curh:=curh+leaderwd;
end else begin lq:=rulewd div leaderwd;lr:=rulewd mod leaderwd;
if mem[p].hh.b1=101 then curh:=curh+(lr div 2)else begin lx:=lr div(lq+1
);curh:=curh+((lr-(lq-1)*lx)div 2);end;end{:666};
while curh+leaderwd<=edge do{667:}begin curv:=baseline+disp+mem[
leaderbox+4].int;if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;savev:=dviv;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
saveh:=dvih;savedir:=dvidir;tempptr:=leaderbox;
if curdir=1 then curh:=curh+leaderwd;outerdoingleaders:=doingleaders;
doingleaders:=true;case mem[leaderbox].hh.b0 of 0:hlistout;1:vlistout;
2:dirout;end;doingleaders:=outerdoingleaders;dviv:=savev;dvih:=saveh;
dvidir:=savedir;curv:=baseline;curh:=saveh+leaderwd+lx;
curdirhv:=savedir;end{:667};
if curdir=1 then curh:=edge else curh:=edge-10;goto 15;end;end{:665};
goto 13;end{:664};13:begin{1771:}synctexkern(p,thisbox);{:1771};
curh:=curh+mem[p+1].int;end;11:begin{1772:}synctexmath(p,thisbox);
{:1772};
{1493:}begin if(eTeXmode=1)then{1494:}begin if odd(mem[p].hh.b1)then if
mem[LRptr].hh.lh=(4*(mem[p].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;
end else begin if mem[p].hh.b1>4 then incr(LRproblems);
end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(mem[p].hh.b1 div 8)<>curdir then{1499:}begin saveh:=curh;
tempptr:=mem[p].hh.rh;rulewd:=mem[p+1].int;freenode(p,4);
curdir:=1-curdir;p:=newedge(curdir,rulewd);mem[prevp].hh.rh:=p;
curh:=curh-leftedge+rulewd;
mem[p].hh.rh:=reverse(thisbox,newedge(1-curdir,0),curg,curglue);
mem[p+2].int:=curh;curdir:=1-curdir;curh:=saveh;goto 21;end{:1499};end;
mem[p].hh.b0:=13;end{:1494};curh:=curh+mem[p+1].int;end{:1493};end;
8:{691:}begin mem[memtop-12]:=mem[p+1];
mem[memtop-12].hh.rh:=mem[p].hh.rh;p:=memtop-12;goto 21;end{:691};
{1497:}16:begin curh:=curh+mem[p+1].int;leftedge:=curh+mem[p+2].int;
curdir:=mem[p].hh.b1;end;{:1497}others:end;goto 15;
14:{663:}if(ruleht=-1073741824)then ruleht:=mem[thisbox+3].int+disp;
if(ruledp=-1073741824)then ruledp:=mem[thisbox+2].int-disp;
ruleht:=ruleht+ruledp;
if(ruleht>0)and(rulewd>0)then begin if curh<>dvih then begin movement(
curh-dvih,143);dvih:=curh;end;curv:=baseline+ruledp;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=132;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);curv:=baseline;dvih:=dvih+rulewd;
end{:663};13:begin curh:=curh+rulewd;
{1770:}synctexhorizontalruleorglue(p,thisbox);{:1770};end;15:prevp:=p;
p:=mem[p].hh.rh;end{:661}{:659};{1767:}synctextsilh(thisbox);{:1767};
{1492:}if(eTeXmode=1)then begin{1495:}begin while mem[LRptr].hh.lh<>0 do
begin if mem[LRptr].hh.lh>4 then LRproblems:=LRproblems+10000;
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;end;
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;end{:1495};
if((mem[thisbox].hh.b1)div 16)=2 then curdir:=1;end{:1492};
prunemovements(saveloc);if curs>0 then dvipop(saveloc);decr(curs);end;
{:658}{668:}procedure vlistout;label 13,14,15;var leftedge:scaled;
topedge:scaled;saveh,savev:scaled;thisbox:halfword;gorder:glueord;
gsign:0..2;p:halfword;saveloc:integer;leaderbox:halfword;
leaderht:scaled;lx:scaled;outerdoingleaders:boolean;edge:scaled;
gluetemp:real;curglue:real;curg:scaled;savedir:integer;begin curg:=0;
curglue:=0.0;thisbox:=tempptr;gorder:=mem[thisbox+5].hh.b1;
gsign:=mem[thisbox+5].hh.b0;p:=mem[thisbox+5].hh.rh;incr(curs);
if curs>0 then begin dvibuf[dviptr]:=141;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if curs>maxpush then maxpush:=curs;
saveloc:=dvioffset+dviptr;synchdir;leftedge:=curh;
{1764:}synctexvlist(thisbox);{:1764};curv:=curv-mem[thisbox+3].int;
topedge:=curv;
while p<>-1073741823 do{669:}begin if(p>=himemmin)then confusion(994)
else{670:}begin case mem[p].hh.b0 of 0,1,2:{671:}if mem[p+5].hh.rh=
-1073741823 then begin curv:=curv+mem[p+3].int;
if mem[p].hh.b0<>2 then{1768:}if mem[p].hh.b0=1 then begin
synctexvoidvlist(p,thisbox);end else begin synctexvoidhlist(p,thisbox);
end;{:1768};curv:=curv+mem[p+2].int;
end else begin curv:=curv+mem[p+3].int;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
saveh:=dvih;savev:=dviv;savedir:=dvidir;
if curdir=1 then curh:=leftedge-mem[p+4].int else curh:=leftedge+mem[p+4
].int;tempptr:=p;case mem[p].hh.b0 of 0:hlistout;1:vlistout;2:dirout;
end;dvih:=saveh;dviv:=savev;dvidir:=savedir;curv:=savev+mem[p+2].int;
curh:=leftedge;curdirhv:=savedir;end{:671};3:begin ruleht:=mem[p+3].int;
ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;goto 14;end;
10:{1410:}outwhat(p){:1410};12:{673:}begin g:=mem[p+1].hh.lh;
ruleht:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;ruleht:=ruleht+curg;
if mem[p].hh.b1>=100 then{674:}begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=3 then begin rulewd:=mem[leaderbox+1].int;
ruledp:=0;goto 14;end;
leaderht:=mem[leaderbox+3].int+mem[leaderbox+2].int;
if(leaderht>0)and(ruleht>0)then begin ruleht:=ruleht+10;
edge:=curv+ruleht;lx:=0;
{675:}if mem[p].hh.b1=100 then begin savev:=curv;
curv:=topedge+leaderht*((curv-topedge)div leaderht);
if curv<savev then curv:=curv+leaderht;
end else begin lq:=ruleht div leaderht;lr:=ruleht mod leaderht;
if mem[p].hh.b1=101 then curv:=curv+(lr div 2)else begin lx:=lr div(lq+1
);curv:=curv+((lr-(lq-1)*lx)div 2);end;end{:675};
while curv+leaderht<=edge do{676:}begin if curdir=1 then curh:=leftedge-
mem[leaderbox+4].int else curh:=leftedge+mem[leaderbox+4].int;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
saveh:=dvih;curv:=curv+mem[leaderbox+3].int;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
savev:=dviv;savedir:=dvidir;tempptr:=leaderbox;
outerdoingleaders:=doingleaders;doingleaders:=true;
case mem[leaderbox].hh.b0 of 0:hlistout;1:vlistout;2:dirout;end;
doingleaders:=outerdoingleaders;dviv:=savev;dvih:=saveh;dvidir:=savedir;
curh:=leftedge;curv:=savev-mem[leaderbox+3].int+leaderht+lx;
curdirhv:=savedir;end{:676};curv:=edge-10;goto 15;end;end{:674};goto 13;
end{:673};13:curv:=curv+mem[p+1].int;others:end;goto 15;
14:{672:}if(rulewd=-1073741824)then rulewd:=mem[thisbox+1].int;
ruleht:=ruleht+ruledp;curv:=curv+ruleht;
if(ruleht>0)and(rulewd>0)then begin if curdir=1 then curh:=curh-rulewd;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=137;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);curh:=leftedge;end;goto 15{:672};
13:curv:=curv+ruleht;end{:670};15:p:=mem[p].hh.rh;end{:669};
{1765:}synctextsilv(thisbox);{:1765};prunemovements(saveloc);
if curs>0 then dvipop(saveloc);decr(curs);end;
{:668}{677:}procedure shipout(p:halfword);label 30;var pageloc:integer;
delnode:halfword;j,k:0..9;s:poolpointer;oldsetting:0..21;
begin{1762:}synctexsheet(eqtb[114378].int);{:1762};
begin if eqtb[114395].int>0 then begin printnl(349);println;print(995);
end;if termoffset>maxprintline-9 then println else if(termoffset>0)or(
fileoffset>0)then printchar(32);printchar(91);j:=9;
while(eqtb[114445+j].int=0)and(j>0)do decr(j);
for k:=0 to j do begin printint(eqtb[114445+k].int);
if k<j then printchar(46);end;fflush(stdout);
if eqtb[114395].int>0 then begin printchar(93);begindiagnostic;
showbox(p);enddiagnostic(true);end;
if mem[p].hh.b0=2 then begin delnode:=p;p:=mem[p+5].hh.rh;
deleteglueref(mem[delnode+7].hh.rh);deleteglueref(mem[delnode+7].hh.lh);
freenode(delnode,10);end;flushnodelist(mem[p].hh.rh);
mem[p].hh.rh:=-1073741823;
if abs(((mem[p].hh.b1)mod 16-5))<>4 then p:=newdirnode(p,4);
{679:}{680:}if(mem[p+3].int>1073741823)or(mem[p+2].int>1073741823)or(mem
[p+3].int+mem[p+2].int+eqtb[114976].int>1073741823)or(mem[p+1].int+eqtb[
114975].int>1073741823)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(999);
end;begin helpptr:=2;helpline[1]:=1000;helpline[0]:=1001;end;error;
if eqtb[114395].int<=0 then begin begindiagnostic;printnl(1002);
showbox(p);enddiagnostic(true);end;goto 30;end;
if mem[p+3].int+mem[p+2].int+eqtb[114976].int>maxv then maxv:=mem[p+3].
int+mem[p+2].int+eqtb[114976].int;
if mem[p+1].int+eqtb[114975].int>maxh then maxh:=mem[p+1].int+eqtb[
114975].int{:680};
{656:}{1784:}if eqtb[114981].int<>0 then curpageheight:=eqtb[114981].int
else if(((mem[p].hh.b1)mod 16-5)=3)or(((mem[p].hh.b1)mod 16-5)=1)then
curpageheight:=mem[p+1].int+2*eqtb[114976].int+2*4736286 else
curpageheight:=mem[p+3].int+mem[p+2].int+2*eqtb[114976].int+2*4736286;
if eqtb[114980].int<>0 then curpagewidth:=eqtb[114980].int else if(((mem
[p].hh.b1)mod 16-5)=3)or(((mem[p].hh.b1)mod 16-5)=1)then curpagewidth:=
mem[p+3].int+mem[p+2].int+2*eqtb[114975].int+2*4736286 else curpagewidth
:=mem[p+1].int+2*eqtb[114975].int+2*4736286{:1784};dvih:=0;dviv:=0;
curh:=eqtb[114975].int;dvif:=0;dvidir:=4;curdirhv:=dvidir;
if outputfilename=0 then begin if jobname=0 then openlogfile;
packjobname(951);while not bopenout(dvifile)do promptfilename(952,951);
outputfilename:=bmakenamestring(dvifile);end;
if totalpages=0 then begin begin dvibuf[dviptr]:=247;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=2;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(25400000);
dvifour(473628672);preparemag;dvifour(eqtb[114378].int);
if outputcomment then begin l:=strlen(outputcomment);
begin dvibuf[dviptr]:=l;incr(dviptr);if dviptr=dvilimit then dviswap;
end;for s:=0 to l-1 do begin dvibuf[dviptr]:=outputcomment[s];
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oldsetting:=selector;selector:=21;print(993);
printint(eqtb[114384].int);printchar(46);printtwo(eqtb[114383].int);
printchar(46);printtwo(eqtb[114382].int);printchar(58);
printtwo(eqtb[114381].int div 60);printtwo(eqtb[114381].int mod 60);
selector:=oldsetting;begin dvibuf[dviptr]:=(poolptr-strstart[strptr]);
incr(dviptr);if dviptr=dvilimit then dviswap;end;
for s:=strstart[strptr]to poolptr-1 do begin dvibuf[dviptr]:=strpool[s];
incr(dviptr);if dviptr=dvilimit then dviswap;end;
poolptr:=strstart[strptr];end;end{:656};pageloc:=dvioffset+dviptr;
begin dvibuf[dviptr]:=139;incr(dviptr);if dviptr=dvilimit then dviswap;
end;for k:=0 to 9 do dvifour(eqtb[114445+k].int);dvifour(lastbop);
lastbop:=pageloc;curv:=mem[p+3].int+eqtb[114976].int;tempptr:=p;
case mem[p].hh.b0 of 0:hlistout;1:vlistout;2:dirout;end;
begin dvibuf[dviptr]:=140;incr(dviptr);if dviptr=dvilimit then dviswap;
end;incr(totalpages);curs:=-1;
ifdef('IPC')if ipcon>0 then begin if dvilimit=halfbuf then begin
writedvi(halfbuf,dvibufsize-1);flushdvi;dvigone:=dvigone+halfbuf;end;
if dviptr>(2147483647-dvioffset)then begin curs:=-2;fatalerror(992);end;
if dviptr>0 then begin writedvi(0,dviptr-1);flushdvi;
dvioffset:=dvioffset+dviptr;dvigone:=dvigone+dviptr;end;dviptr:=0;
dvilimit:=dvibufsize;ipcpage(dvigone);end;endif('IPC');30:{:679};
if(eTeXmode=1)then{1511:}begin if LRproblems>0 then begin{1490:}begin
println;printnl(1609);printint(LRproblems div 10000);print(1610);
printint(LRproblems mod 10000);print(1611);LRproblems:=0;end{:1490};
printchar(41);println;end;
if(LRptr<>-1073741823)or(curdir<>0)then confusion(1613);end{:1511};
if eqtb[114395].int<=0 then printchar(93);deadcycles:=0;fflush(stdout);
{678:}ifdef('STAT')if eqtb[114392].int>1 then begin printnl(996);
printint(varused);printchar(38);printint(dynused);printchar(59);end;
endif('STAT')flushnodelist(p);
ifdef('STAT')if eqtb[114392].int>1 then begin print(997);
printint(varused);printchar(38);printint(dynused);print(998);
printint(himemmin-lomemmax-1);println;end;endif('STAT'){:678};end;
{1763:}synctexteehs;{:1763};end;
{:677}{684:}procedure scanspec(c:groupcode;threecodes:boolean);label 40;
var s:integer;speccode:0..1;
begin if threecodes then s:=savestack[saveptr+0].int;
if scankeyword(1008)then speccode:=0 else if scankeyword(1009)then
speccode:=1 else begin speccode:=1;curval:=0;goto 40;end;
scandimen(false,false,false);
40:if threecodes then begin savestack[saveptr+0].int:=s;incr(saveptr);
end;savestack[saveptr+0].int:=speccode;savestack[saveptr+1].int:=curval;
saveptr:=saveptr+2;newsavelevel(c);scanleftbrace;end;
{:684}{688:}function hpack(p:halfword;w:scaled;m:smallnumber):halfword;
label 21,50,10;var r:halfword;k:halfword;disp:scaled;q:halfword;
h,d,x:scaled;s:scaled;g:halfword;o:glueord;f:internalfontnumber;
i:fourquarters;hd:sixteenbits;cx:integer;begin lastbadness:=0;
r:=getnode(10);mem[r].hh.b0:=0;mem[r].hh.b1:=0;mem[r+4].int:=0;
mem[r].hh.b1:=((mem[r].hh.b1)div 16)*16+5;mem[r+7].hh.rh:=curkanjiskip;
mem[r+7].hh.lh:=curxkanjiskip;incr(mem[curkanjiskip].hh.rh);
incr(mem[curxkanjiskip].hh.rh);k:=curkanjiskip;q:=r+5;mem[q].hh.rh:=p;
h:=0;{689:}d:=0;x:=0;totalstretch[0]:=0;totalshrink[0]:=0;
totalstretch[1]:=0;totalshrink[1]:=0;totalstretch[2]:=0;
totalshrink[2]:=0;totalstretch[3]:=0;totalshrink[3]:=0;
totalstretch[4]:=0;totalshrink[4]:=0{:689};disp:=0;
if(eqtb[114444].int>0)then{1487:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1487};while p<>-1073741823 do{690:}begin 21:chain:=false;
while(p>=himemmin)do{693:}begin f:=mem[p].hh.b0;
cx:=ptencucsto8bitcode(fontenc[f],mem[p].hh.b1);
i:=fontinfo[charbase[f]+effectivechar(true,f,cx)].qqqq;hd:=i.b1;
x:=x+fontinfo[widthbase[f]+i.b0].int;
s:=fontinfo[heightbase[f]+(hd)div 256].int-disp;if s>h then h:=s;
s:=fontinfo[depthbase[f]+(hd)mod 256].int+disp;if s>d then d:=s;
if fontdir[f]<>0 then begin p:=mem[p].hh.rh;
if chain then begin x:=x+mem[k+1].int;o:=mem[k].hh.b0;
totalstretch[o]:=totalstretch[o]+mem[k+2].int;o:=mem[k].hh.b1;
totalshrink[o]:=totalshrink[o]+mem[k+3].int;end else chain:=true;
end else chain:=false;p:=mem[p].hh.rh;end{:693};
if p<>-1073741823 then begin case mem[p].hh.b0 of 0,1,2,3,15:{692:}begin
x:=x+mem[p+1].int;
if mem[p].hh.b0>=3 then s:=disp else s:=mem[p+4].int+disp;
if mem[p+3].int-s>h then h:=mem[p+3].int-s;
if mem[p+2].int+s>d then d:=mem[p+2].int+s;end{:692};
4,6,7:if(adjusttail<>-1073741823)or(preadjusttail<>-1073741823)then
{696:}begin while mem[q].hh.rh<>p do q:=mem[q].hh.rh;
if mem[p].hh.b0=7 then begin if mem[p].hh.b1<>0 then begin if
preadjusttail=-1073741823 then confusion(1010);
mem[preadjusttail].hh.rh:=mem[p+1].int;
while mem[preadjusttail].hh.rh<>-1073741823 do preadjusttail:=mem[
preadjusttail].hh.rh;
end else begin if adjusttail=-1073741823 then confusion(1010);
mem[adjusttail].hh.rh:=mem[p+1].int;
while mem[adjusttail].hh.rh<>-1073741823 do adjusttail:=mem[adjusttail].
hh.rh;end;p:=mem[p].hh.rh;freenode(mem[q].hh.rh,2);
end else begin mem[adjusttail].hh.rh:=p;adjusttail:=p;p:=mem[p].hh.rh;
end;mem[q].hh.rh:=p;p:=q;end{:696};10:{1404:}{:1404};
5:begin disp:=mem[p+1].int;revdisp:=disp;end;
12:{697:}begin g:=mem[p+1].hh.lh;x:=x+mem[g+1].int;o:=mem[g].hh.b0;
totalstretch[o]:=totalstretch[o]+mem[g+2].int;o:=mem[g].hh.b1;
totalshrink[o]:=totalshrink[o]+mem[g+3].int;
if mem[p].hh.b1>=100 then begin g:=mem[p+1].hh.rh;
if mem[g+3].int>h then h:=mem[g+3].int;
if mem[g+2].int>d then d:=mem[g+2].int;end;end{:697};
13:x:=x+mem[p+1].int;11:begin x:=x+mem[p+1].int;
if(eqtb[114444].int>0)then{1488:}if odd(mem[p].hh.b1)then if mem[LRptr].
hh.lh=(4*(mem[p].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;
end else begin incr(LRproblems);mem[p].hh.b0:=13;mem[p].hh.b1:=1;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1488};end;
8:{691:}begin mem[memtop-12]:=mem[p+1];
mem[memtop-12].hh.rh:=mem[p].hh.rh;p:=memtop-12;goto 21;end{:691};
others:end;p:=mem[p].hh.rh;end;end{:690};
if adjusttail<>-1073741823 then mem[adjusttail].hh.rh:=-1073741823;
if preadjusttail<>-1073741823 then mem[preadjusttail].hh.rh:=-1073741823
;mem[r+3].int:=h;mem[r+2].int:=d;{698:}if m=1 then w:=x+w;
mem[r+1].int:=w;x:=w-x;if x=0 then begin mem[r+5].hh.b0:=0;
mem[r+5].hh.b1:=0;mem[r+6].gr:=0.0;goto 10;
end else if x>0 then{699:}begin{700:}if totalstretch[4]<>0 then o:=4
else if totalstretch[3]<>0 then o:=3 else if totalstretch[2]<>0 then o:=
2 else if totalstretch[1]<>0 then o:=1 else o:=0{:700};
mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=1;
if totalstretch[o]<>0 then mem[r+6].gr:=x/totalstretch[o]else begin mem[
r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if o=0 then if mem[r+5].hh.rh<>-1073741823 then{701:}begin lastbadness:=
badness(x,totalstretch[0]);
if lastbadness>eqtb[114387].int then begin println;
if lastbadness>100 then printnl(1011)else printnl(1012);print(1013);
printint(lastbadness);goto 50;end;end{:701};goto 10;
end{:699}else{705:}begin{706:}if totalshrink[4]<>0 then o:=4 else if
totalshrink[3]<>0 then o:=3 else if totalshrink[2]<>0 then o:=2 else if
totalshrink[1]<>0 then o:=1 else o:=0{:706};mem[r+5].hh.b1:=o;
mem[r+5].hh.b0:=2;
if totalshrink[o]<>0 then mem[r+6].gr:=(-x)/totalshrink[o]else begin mem
[r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if(totalshrink[o]<-x)and(o=0)and(mem[r+5].hh.rh<>-1073741823)then begin
lastbadness:=1000000;mem[r+6].gr:=1.0;
{707:}if(-x-totalshrink[0]>eqtb[114965].int)or(eqtb[114387].int<100)then
begin if(eqtb[114973].int>0)and(-x-totalshrink[0]>eqtb[114965].int)then
begin while mem[q].hh.rh<>-1073741823 do q:=mem[q].hh.rh;
mem[q].hh.rh:=newrule;mem[mem[q].hh.rh+1].int:=eqtb[114973].int;end;
println;printnl(1019);printscaled(-x-totalshrink[0]);print(1020);
goto 50;end{:707};
end else if o=0 then if mem[r+5].hh.rh<>-1073741823 then{708:}begin
lastbadness:=badness(-x,totalshrink[0]);
if lastbadness>eqtb[114387].int then begin println;printnl(1021);
printint(lastbadness);goto 50;end;end{:708};goto 10;end{:705}{:698};
50:{704:}if outputactive then print(1014)else begin if packbeginline<>0
then begin if packbeginline>0 then print(1015)else print(1016);
printint(abs(packbeginline));print(1017);end else print(1018);
printint(line);end;println;fontinshortdisplay:=0;
shortdisplay(mem[r+5].hh.rh);println;begindiagnostic;showbox(r);
enddiagnostic(true){:704};10:lastdisp:=disp;
if(eqtb[114444].int>0)then{1489:}begin if mem[LRptr].hh.lh<>0 then begin
while mem[q].hh.rh<>-1073741823 do q:=mem[q].hh.rh;repeat tempptr:=q;
q:=newmath(0,mem[LRptr].hh.lh);mem[tempptr].hh.rh:=q;
LRproblems:=LRproblems+10000;begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
until mem[LRptr].hh.lh=0;end;
if LRproblems>0 then begin{1490:}begin println;printnl(1609);
printint(LRproblems div 10000);print(1610);
printint(LRproblems mod 10000);print(1611);LRproblems:=0;end{:1490};
goto 50;end;begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if LRptr<>-1073741823 then confusion(1608);end{:1489};hpack:=r;end;
{:688}{709:}function vpackage(p:halfword;h:scaled;m:smallnumber;
l:scaled):halfword;label 50,10;var r:halfword;w,d,x:scaled;s:scaled;
g:halfword;o:glueord;begin lastbadness:=0;r:=getnode(10);
mem[r].hh.b0:=1;mem[r].hh.b1:=0;mem[r+4].int:=0;
mem[r].hh.b1:=((mem[r].hh.b1)div 16)*16+5;mem[r+7].hh.rh:=membot;
mem[r+7].hh.lh:=membot;incr(mem[membot].hh.rh);incr(mem[membot].hh.rh);
mem[r+5].hh.rh:=p;w:=0;{689:}d:=0;x:=0;totalstretch[0]:=0;
totalshrink[0]:=0;totalstretch[1]:=0;totalshrink[1]:=0;
totalstretch[2]:=0;totalshrink[2]:=0;totalstretch[3]:=0;
totalshrink[3]:=0;totalstretch[4]:=0;totalshrink[4]:=0{:689};
while p<>-1073741823 do{710:}begin if(p>=himemmin)then confusion(1022)
else case mem[p].hh.b0 of 0,1,2,3,15:{711:}begin x:=x+d+mem[p+3].int;
d:=mem[p+2].int;if mem[p].hh.b0>=3 then s:=0 else s:=mem[p+4].int;
if mem[p+1].int+s>w then w:=mem[p+1].int+s;end{:711};10:{1403:}{:1403};
12:{712:}begin x:=x+d;d:=0;g:=mem[p+1].hh.lh;x:=x+mem[g+1].int;
o:=mem[g].hh.b0;totalstretch[o]:=totalstretch[o]+mem[g+2].int;
o:=mem[g].hh.b1;totalshrink[o]:=totalshrink[o]+mem[g+3].int;
if mem[p].hh.b1>=100 then begin g:=mem[p+1].hh.rh;
if mem[g+1].int>w then w:=mem[g+1].int;end;end{:712};
13:begin x:=x+d+mem[p+1].int;d:=0;end;others:end;p:=mem[p].hh.rh;
end{:710};mem[r+1].int:=w;if d>l then begin x:=x+d-l;mem[r+2].int:=l;
end else mem[r+2].int:=d;{713:}if m=1 then h:=x+h;mem[r+3].int:=h;
x:=h-x;if x=0 then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;goto 10;
end else if x>0 then{714:}begin{700:}if totalstretch[4]<>0 then o:=4
else if totalstretch[3]<>0 then o:=3 else if totalstretch[2]<>0 then o:=
2 else if totalstretch[1]<>0 then o:=1 else o:=0{:700};
mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=1;
if totalstretch[o]<>0 then mem[r+6].gr:=x/totalstretch[o]else begin mem[
r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if o=0 then if mem[r+5].hh.rh<>-1073741823 then{715:}begin lastbadness:=
badness(x,totalstretch[0]);
if lastbadness>eqtb[114388].int then begin println;
if lastbadness>100 then printnl(1011)else printnl(1012);print(1023);
printint(lastbadness);goto 50;end;end{:715};goto 10;
end{:714}else{717:}begin{706:}if totalshrink[4]<>0 then o:=4 else if
totalshrink[3]<>0 then o:=3 else if totalshrink[2]<>0 then o:=2 else if
totalshrink[1]<>0 then o:=1 else o:=0{:706};mem[r+5].hh.b1:=o;
mem[r+5].hh.b0:=2;
if totalshrink[o]<>0 then mem[r+6].gr:=(-x)/totalshrink[o]else begin mem
[r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if(totalshrink[o]<-x)and(o=0)and(mem[r+5].hh.rh<>-1073741823)then begin
lastbadness:=1000000;mem[r+6].gr:=1.0;
{718:}if(-x-totalshrink[0]>eqtb[114966].int)or(eqtb[114388].int<100)then
begin println;printnl(1024);printscaled(-x-totalshrink[0]);print(1025);
goto 50;end{:718};
end else if o=0 then if mem[r+5].hh.rh<>-1073741823 then{719:}begin
lastbadness:=badness(-x,totalshrink[0]);
if lastbadness>eqtb[114388].int then begin println;printnl(1026);
printint(lastbadness);goto 50;end;end{:719};goto 10;end{:717}{:713};
50:{716:}if outputactive then print(1014)else begin if packbeginline<>0
then begin print(1016);printint(abs(packbeginline));print(1017);
end else print(1018);printint(line);println;end;begindiagnostic;
showbox(r);enddiagnostic(true){:716};10:vpackage:=r;end;
{:709}{720:}procedure appendtovlist(b:halfword);var d:scaled;p:halfword;
begin if curlist.auxfield.int>-65536000 then begin d:=mem[eqtb[49926].hh
.rh+1].int-curlist.auxfield.int-mem[b+3].int;
if d<eqtb[114959].int then p:=newparamglue(0)else begin p:=newskipparam(
1);mem[tempptr+1].int:=d;end;mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=p;end;mem[curlist.tailfield].hh.rh:=b;
curlist.tailfield:=b;curlist.auxfield.int:=mem[b+2].int;end;
{:720}{727:}function newnoad:halfword;var p:halfword;
begin p:=getnode(5);mem[p].hh.b0:=18;mem[p].hh.b1:=0;
mem[p+1].hh:=emptyfield;mem[p+3].hh:=emptyfield;mem[p+2].hh:=emptyfield;
mem[p+4].hh:=emptyfield;newnoad:=p;end;
{:727}{729:}function newstyle(s:smallnumber):halfword;var p:halfword;
begin p:=getnode(3);mem[p].hh.b0:=16;mem[p].hh.b1:=s;mem[p+1].int:=0;
mem[p+2].int:=0;newstyle:=p;end;{:729}{730:}function newchoice:halfword;
var p:halfword;begin p:=getnode(3);mem[p].hh.b0:=17;mem[p].hh.b1:=0;
mem[p+1].hh.lh:=-1073741823;mem[p+1].hh.rh:=-1073741823;
mem[p+2].hh.lh:=-1073741823;mem[p+2].hh.rh:=-1073741823;newchoice:=p;
end;{:730}{734:}procedure showinfo;
begin shownodelist(mem[tempptr].hh.lh);end;
{:734}{745:}function fractionrule(t:scaled):halfword;var p:halfword;
begin p:=newrule;mem[p+3].int:=t;mem[p+2].int:=0;fractionrule:=p;end;
{:745}{746:}function overbar(b:halfword;k,t:scaled):halfword;
var p,q:halfword;begin p:=newkern(k);mem[p].hh.rh:=b;q:=fractionrule(t);
mem[q].hh.rh:=p;p:=newkern(t);mem[p].hh.rh:=q;
overbar:=vpackage(p,0,1,1073741823);end;
{:746}{747:}{750:}function charbox(f:internalfontnumber;
c:quarterword):halfword;var q:fourquarters;hd:sixteenbits;b,p:halfword;
begin q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;hd:=q.b1;
b:=newnullbox;
mem[b+1].int:=fontinfo[widthbase[f]+q.b0].int+fontinfo[italicbase[f]+(q.
b2)div 256].int;mem[b+3].int:=fontinfo[heightbase[f]+(hd)div 256].int;
mem[b+2].int:=fontinfo[depthbase[f]+(hd)mod 256].int;p:=getavail;
mem[p].hh.b1:=c;mem[p].hh.b0:=f;mem[b+5].hh.rh:=p;charbox:=b;end;
{:750}{752:}procedure stackintobox(b:halfword;f:internalfontnumber;
c:quarterword);var p:halfword;begin p:=charbox(f,c);
mem[p].hh.rh:=mem[b+5].hh.rh;mem[b+5].hh.rh:=p;
mem[b+3].int:=mem[p+3].int;end;
{:752}{753:}function heightplusdepth(f:internalfontnumber;
c:quarterword):scaled;var q:fourquarters;hd:sixteenbits;
begin q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;hd:=q.b1;
heightplusdepth:=fontinfo[heightbase[f]+(hd)div 256].int+fontinfo[
depthbase[f]+(hd)mod 256].int;end;
{:753}function vardelimiter(d:halfword;s:integer;v:scaled):halfword;
label 40,22;var b:halfword;f,g:internalfontnumber;c,x,y:quarterword;
m,n:integer;u:scaled;w:scaled;q:fourquarters;hd:sixteenbits;
r:fourquarters;z:integer;largeattempt:boolean;begin f:=0;w:=0;
largeattempt:=false;z:=mem[d].qqqq.b0;x:=mem[d].qqqq.b1;
while true do begin{748:}if(z<>0)or(x<>0)then begin z:=z+s+256;
repeat z:=z-256;g:=eqtb[50986+z].hh.rh;if g<>0 then{749:}begin y:=x;
if(y>=fontbc[g])and(y<=fontec[g])then begin 22:q:=fontinfo[charbase[g]+y
].qqqq;if(q.b0>0)then begin if((q.b2)mod 4)=3 then begin f:=g;c:=y;
goto 40;end;hd:=q.b1;
u:=fontinfo[heightbase[g]+(hd)div 256].int+fontinfo[depthbase[g]+(hd)mod
256].int;if u>w then begin f:=g;c:=y;w:=u;if u>=v then goto 40;end;
if((q.b2)mod 4)=2 then begin y:=q.b3;goto 22;end;end;end;end{:749};
until z<256;end{:748};if largeattempt then goto 40;largeattempt:=true;
z:=mem[d].qqqq.b2;x:=mem[d].qqqq.b3;end;
40:if f<>0 then{751:}if((q.b2)mod 4)=3 then{754:}begin b:=newnullbox;
mem[b].hh.b0:=1;r:=fontinfo[extenbase[f]+q.b3].qqqq;{755:}c:=r.b3;
u:=heightplusdepth(f,c);w:=0;
q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;
mem[b+1].int:=fontinfo[widthbase[f]+q.b0].int+fontinfo[italicbase[f]+(q.
b2)div 256].int;c:=r.b2;if c<>0 then w:=w+heightplusdepth(f,c);c:=r.b1;
if c<>0 then w:=w+heightplusdepth(f,c);c:=r.b0;
if c<>0 then w:=w+heightplusdepth(f,c);n:=0;
if u>0 then while w<v do begin w:=w+u;incr(n);if r.b1<>0 then w:=w+u;
end{:755};c:=r.b2;if c<>0 then stackintobox(b,f,c);c:=r.b3;
for m:=1 to n do stackintobox(b,f,c);c:=r.b1;
if c<>0 then begin stackintobox(b,f,c);c:=r.b3;
for m:=1 to n do stackintobox(b,f,c);end;c:=r.b0;
if c<>0 then stackintobox(b,f,c);mem[b+2].int:=w-mem[b+3].int;
end{:754}else b:=charbox(f,c){:751}else begin b:=newnullbox;
mem[b+1].int:=eqtb[114968].int;end;
mem[b+4].int:=half(mem[b+3].int-mem[b+2].int)-fontinfo[22+parambase[eqtb
[50988+s].hh.rh]].int;vardelimiter:=b;end;
{:747}{756:}function rebox(b:halfword;w:scaled):halfword;var p:halfword;
f:internalfontnumber;v:scaled;
begin if(mem[b+1].int<>w)and(mem[b+5].hh.rh<>-1073741823)then begin if
mem[b].hh.b0<>0 then b:=hpack(b,0,1);p:=mem[b+5].hh.rh;
if(p>=himemmin)then if fontdir[mem[p].hh.b0]<>0 then begin if mem[mem[p]
.hh.rh].hh.rh=-1073741823 then begin f:=mem[p].hh.b0;
v:=fontinfo[widthbase[f]+fontinfo[charbase[f]+mem[p].hh.b1].qqqq.b0].int
;
if v<>mem[b+1].int then mem[mem[p].hh.rh].hh.rh:=newkern(mem[b+1].int-v)
;end end else if mem[p].hh.rh=-1073741823 then begin f:=mem[p].hh.b0;
v:=fontinfo[widthbase[f]+fontinfo[charbase[f]+mem[p].hh.b1].qqqq.b0].int
;if v<>mem[b+1].int then mem[p].hh.rh:=newkern(mem[b+1].int-v);end;
deleteglueref(mem[b+7].hh.rh);deleteglueref(mem[b+7].hh.lh);
freenode(b,10);b:=newglue(membot+16);mem[b].hh.rh:=p;
while mem[p].hh.rh<>-1073741823 do p:=mem[p].hh.rh;
mem[p].hh.rh:=newglue(membot+16);rebox:=hpack(b,w,0);
end else begin mem[b+1].int:=w;rebox:=b;end;end;
{:756}{757:}function mathglue(g:halfword;m:scaled):halfword;
var p:halfword;n:integer;f:scaled;begin n:=xovern(m,65536);
f:=texremainder;if f<0 then begin decr(n);f:=f+65536;end;p:=getnode(4);
mem[p+1].int:=multandadd(n,mem[g+1].int,xnoverd(mem[g+1].int,f,65536),
1073741823);mem[p].hh.b0:=mem[g].hh.b0;
if mem[p].hh.b0=0 then mem[p+2].int:=multandadd(n,mem[g+2].int,xnoverd(
mem[g+2].int,f,65536),1073741823)else mem[p+2].int:=mem[g+2].int;
mem[p].hh.b1:=mem[g].hh.b1;
if mem[p].hh.b1=0 then mem[p+3].int:=multandadd(n,mem[g+3].int,xnoverd(
mem[g+3].int,f,65536),1073741823)else mem[p+3].int:=mem[g+3].int;
mathglue:=p;end;{:757}{758:}procedure mathkern(p:halfword;m:scaled);
var n:integer;f:scaled;
begin if mem[p].hh.b1=99 then begin n:=xovern(m,65536);f:=texremainder;
if f<0 then begin decr(n);f:=f+65536;end;
mem[p+1].int:=multandadd(n,mem[p+1].int,xnoverd(mem[p+1].int,f,65536),
1073741823);mem[p].hh.b1:=1;end;end;{:758}{759:}procedure flushmath;
begin flushnodelist(mem[curlist.headfield].hh.rh);
flushnodelist(curlist.auxfield.int);
mem[curlist.headfield].hh.rh:=-1073741823;
curlist.tailfield:=curlist.headfield;curlist.auxfield.int:=-1073741823;
end;{:759}{761:}procedure mlisttohlist;forward;
function shiftsubexpbox(q:halfword):halfword;var d:halfword;
begin if abs(curlist.dirfield)=abs(((mem[mem[q].hh.lh].hh.b1)mod 16-5))
then begin if abs(curlist.dirfield)=3 then begin if((mem[mem[q].hh.lh].
hh.b1)mod 16-5)=3 then d:=eqtb[114978].int else d:=eqtb[114979].int end
else d:=eqtb[114979].int;
if curstyle<4 then d:=xnoverd(d,eqtb[114418].int,1000)else if curstyle<6
then d:=xnoverd(d,eqtb[114419].int,1000)else d:=xnoverd(d,eqtb[114420].
int,1000);mem[mem[q].hh.lh+4].int:=mem[mem[q].hh.lh+4].int-d;end;
mem[q].hh.rh:=2;shiftsubexpbox:=mem[q].hh.lh;end;
function cleanbox(p:halfword;s:smallnumber;jc:halfword):halfword;
label 40;var q:halfword;savestyle:smallnumber;x:halfword;r:halfword;
begin case mem[p].hh.rh of 1:begin curmlist:=newnoad;
mem[curmlist+1]:=mem[p];end;6:begin curmlist:=newnoad;
mem[curmlist+1]:=mem[p];mem[curmlist+4].hh.lh:=jc;end;
2:begin q:=mem[p].hh.lh;goto 40;end;3:begin q:=shiftsubexpbox(p);
goto 40;end;4:curmlist:=mem[p].hh.lh;others:begin q:=newnullbox;goto 40;
end end;savestyle:=curstyle;curstyle:=s;mlistpenalties:=false;
mlisttohlist;q:=mem[memtop-3].hh.rh;curstyle:=savestyle;
{744:}begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2
)div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[50988+cursize].hh.rh]].int,18);
end{:744};
40:if(q>=himemmin)or(q=-1073741823)then x:=hpack(q,0,1)else if(mem[q].hh
.rh=-1073741823)and(mem[q].hh.b0<=2)and(mem[q+4].int=0)then x:=q else x
:=hpack(q,0,1);{762:}q:=mem[x+5].hh.rh;
if(q>=himemmin)then begin if fontdir[mem[q].hh.b0]<>0 then q:=mem[q].hh.
rh;r:=mem[q].hh.rh;
if r<>-1073741823 then if mem[r].hh.rh=-1073741823 then if not(r>=
himemmin)then if mem[r].hh.b0=13 then begin freenode(r,4);
mem[q].hh.rh:=-1073741823;end;end{:762};cleanbox:=x;end;
{:761}{763:}procedure fetch(a:halfword);begin curc:=mem[a].hh.b1;
curf:=eqtb[50986+mem[a].hh.b0+cursize].hh.rh;
if curf=0 then{764:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(349);
end;printsize(cursize);printchar(32);printint(mem[a].hh.b0);print(1052);
print(curc);printchar(41);begin helpptr:=4;helpline[3]:=1053;
helpline[2]:=1054;helpline[1]:=1055;helpline[0]:=1056;end;error;
curi:=nullcharacter;mem[a].hh.rh:=0;
end{:764}else begin if fontdir[curf]<>0 then curc:=getjfmpos(mem[a+3].hh
.lh,curf);
if(curc>=fontbc[curf])and(curc<=fontec[curf])then curi:=fontinfo[
charbase[curf]+curc].qqqq else curi:=nullcharacter;
if not((curi.b0>0))then begin charwarning(curf,curc);mem[a].hh.rh:=0;
curi:=nullcharacter;end;end;end;
{:763}{767:}{775:}procedure makeover(q:halfword);
begin mem[q+1].hh.lh:=overbar(cleanbox(q+1,2*(curstyle div 2)+1,mem[q+4]
.hh.lh),3*fontinfo[8+parambase[eqtb[50989+cursize].hh.rh]].int,fontinfo[
8+parambase[eqtb[50989+cursize].hh.rh]].int);mem[q+1].hh.rh:=2;end;
{:775}{776:}procedure makeunder(q:halfword);var p,x,y:halfword;
delta:scaled;begin x:=cleanbox(q+1,curstyle,mem[q+4].hh.lh);
p:=newkern(3*fontinfo[8+parambase[eqtb[50989+cursize].hh.rh]].int);
mem[x].hh.rh:=p;
mem[p].hh.rh:=fractionrule(fontinfo[8+parambase[eqtb[50989+cursize].hh.
rh]].int);y:=vpackage(x,0,1,1073741823);
delta:=mem[y+3].int+mem[y+2].int+fontinfo[8+parambase[eqtb[50989+cursize
].hh.rh]].int;mem[y+3].int:=mem[x+3].int;
mem[y+2].int:=delta-mem[y+3].int;mem[q+1].hh.lh:=y;mem[q+1].hh.rh:=2;
end;{:776}{777:}procedure makevcenter(q:halfword);var v:halfword;
delta:scaled;begin v:=mem[q+1].hh.lh;
if mem[v].hh.b0=2 then begin if mem[mem[v+5].hh.rh].hh.b0<>1 then
confusion(1058)end else begin if mem[v].hh.b0<>1 then confusion(611)end;
delta:=mem[v+3].int+mem[v+2].int;
mem[v+3].int:=fontinfo[22+parambase[eqtb[50988+cursize].hh.rh]].int+half
(delta);mem[v+2].int:=delta-mem[v+3].int;end;
{:777}{778:}procedure makeradical(q:halfword);var x,y:halfword;
delta,clr:scaled;
begin x:=cleanbox(q+1,2*(curstyle div 2)+1,mem[q+4].hh.lh);
if curstyle<2 then clr:=fontinfo[8+parambase[eqtb[50989+cursize].hh.rh]]
.int+(abs(fontinfo[5+parambase[eqtb[50988+cursize].hh.rh]].int)div 4)
else begin clr:=fontinfo[8+parambase[eqtb[50989+cursize].hh.rh]].int;
clr:=clr+(abs(clr)div 4);end;
y:=vardelimiter(q+5,cursize,mem[x+3].int+mem[x+2].int+clr+fontinfo[8+
parambase[eqtb[50989+cursize].hh.rh]].int);
delta:=mem[y+2].int-(mem[x+3].int+mem[x+2].int+clr);
if delta>0 then clr:=clr+half(delta);mem[y+4].int:=-(mem[x+3].int+clr);
mem[y].hh.rh:=overbar(x,clr,mem[y+3].int);mem[q+1].hh.lh:=hpack(y,0,1);
mem[q+1].hh.rh:=2;end;{:778}{779:}procedure makemathaccent(q:halfword);
label 30,31;var p,x,y:halfword;a:integer;c:quarterword;
f:internalfontnumber;i:fourquarters;s:scaled;h:scaled;delta:scaled;
w:scaled;begin fetch(q+5);if(curi.b0>0)then begin i:=curi;c:=curc;
f:=curf;{782:}s:=0;if mem[q+1].hh.rh=1 then begin fetch(q+1);
if((curi.b2)mod 4)=1 then begin a:=ligkernbase[curf]+curi.b3;
curi:=fontinfo[a].qqqq;
if curi.b0>128 then begin a:=ligkernbase[curf]+256*curi.b2+curi.b3
+32768-256*(128);curi:=fontinfo[a].qqqq;end;
while true do begin if curi.b1=skewchar[curf]then begin if curi.b2>=128
then if curi.b0<=128 then s:=fontinfo[kernbase[curf]+256*curi.b2+curi.b3
].int;goto 31;end;if curi.b0>=128 then goto 31;a:=a+curi.b0+1;
curi:=fontinfo[a].qqqq;end;end;end;31:{:782};
x:=cleanbox(q+1,2*(curstyle div 2)+1,mem[q+4].hh.lh);w:=mem[x+1].int;
h:=mem[x+3].int;
{781:}while true do begin if((i.b2)mod 4)<>2 then goto 30;y:=i.b3;
i:=fontinfo[charbase[f]+y].qqqq;if not(i.b0>0)then goto 30;
if fontinfo[widthbase[f]+i.b0].int>w then goto 30;c:=y;end;30:{:781};
if h<fontinfo[5+parambase[f]].int then delta:=h else delta:=fontinfo[5+
parambase[f]].int;
if(mem[q+2].hh.rh<>0)or(mem[q+3].hh.rh<>0)then if mem[q+1].hh.rh=1 then
{783:}begin flushnodelist(x);x:=newnoad;mem[x+1]:=mem[q+1];
mem[x+2]:=mem[q+2];mem[x+3]:=mem[q+3];mem[q+2].hh:=emptyfield;
mem[q+3].hh:=emptyfield;mem[q+1].hh.rh:=4;mem[q+1].hh.lh:=x;
x:=cleanbox(q+1,curstyle,mem[q+4].hh.lh);delta:=delta+mem[x+3].int-h;
h:=mem[x+3].int;end{:783};y:=charbox(f,c);
mem[y+4].int:=s+half(w-mem[y+1].int);mem[y+1].int:=0;p:=newkern(-delta);
mem[p].hh.rh:=x;mem[y].hh.rh:=p;y:=vpackage(y,0,1,1073741823);
mem[y+1].int:=mem[x+1].int;
if mem[y+3].int<h then{780:}begin p:=newkern(h-mem[y+3].int);
mem[p].hh.rh:=mem[y+5].hh.rh;mem[y+5].hh.rh:=p;mem[y+3].int:=h;
end{:780};mem[q+1].hh.lh:=y;mem[q+1].hh.rh:=2;end;end;
{:779}{784:}procedure makefraction(q:halfword);var p,v,x,y,z:halfword;
delta,delta1,delta2,shiftup,shiftdown,clr:scaled;
begin if mem[q+1].int=1073741824 then mem[q+1].int:=fontinfo[8+parambase
[eqtb[50989+cursize].hh.rh]].int;
{785:}x:=cleanbox(q+2,curstyle+2-2*(curstyle div 6),mem[q+4].hh.lh);
z:=cleanbox(q+3,2*(curstyle div 2)+3-2*(curstyle div 6),mem[q+4].hh.lh);
if mem[x+1].int<mem[z+1].int then x:=rebox(x,mem[z+1].int)else z:=rebox(
z,mem[x+1].int);
if curstyle<2 then begin shiftup:=fontinfo[8+parambase[eqtb[50988+
cursize].hh.rh]].int;
shiftdown:=fontinfo[11+parambase[eqtb[50988+cursize].hh.rh]].int;
end else begin shiftdown:=fontinfo[12+parambase[eqtb[50988+cursize].hh.
rh]].int;
if mem[q+1].int<>0 then shiftup:=fontinfo[9+parambase[eqtb[50988+cursize
].hh.rh]].int else shiftup:=fontinfo[10+parambase[eqtb[50988+cursize].hh
.rh]].int;end{:785};
if mem[q+1].int=0 then{786:}begin if curstyle<2 then clr:=7*fontinfo[8+
parambase[eqtb[50989+cursize].hh.rh]].int else clr:=3*fontinfo[8+
parambase[eqtb[50989+cursize].hh.rh]].int;
delta:=half(clr-((shiftup-mem[x+2].int)-(mem[z+3].int-shiftdown)));
if delta>0 then begin shiftup:=shiftup+delta;shiftdown:=shiftdown+delta;
end;
end{:786}else{787:}begin if curstyle<2 then clr:=3*mem[q+1].int else clr
:=mem[q+1].int;delta:=half(mem[q+1].int);
delta1:=clr-((shiftup-mem[x+2].int)-(fontinfo[22+parambase[eqtb[50988+
cursize].hh.rh]].int+delta));
delta2:=clr-((fontinfo[22+parambase[eqtb[50988+cursize].hh.rh]].int-
delta)-(mem[z+3].int-shiftdown));
if delta1>0 then shiftup:=shiftup+delta1;
if delta2>0 then shiftdown:=shiftdown+delta2;end{:787};
{788:}v:=newnullbox;mem[v].hh.b0:=1;mem[v+3].int:=shiftup+mem[x+3].int;
mem[v+2].int:=mem[z+2].int+shiftdown;mem[v+1].int:=mem[x+1].int;
if mem[q+1].int=0 then begin p:=newkern((shiftup-mem[x+2].int)-(mem[z+3]
.int-shiftdown));mem[p].hh.rh:=z;
end else begin y:=fractionrule(mem[q+1].int);
p:=newkern((fontinfo[22+parambase[eqtb[50988+cursize].hh.rh]].int-delta)
-(mem[z+3].int-shiftdown));mem[y].hh.rh:=p;mem[p].hh.rh:=z;
p:=newkern((shiftup-mem[x+2].int)-(fontinfo[22+parambase[eqtb[50988+
cursize].hh.rh]].int+delta));mem[p].hh.rh:=y;end;mem[x].hh.rh:=p;
mem[v+5].hh.rh:=x{:788};
{789:}if curstyle<2 then delta:=fontinfo[20+parambase[eqtb[50988+cursize
].hh.rh]].int else delta:=fontinfo[21+parambase[eqtb[50988+cursize].hh.
rh]].int;x:=vardelimiter(q+5,cursize,delta);mem[x].hh.rh:=v;
z:=vardelimiter(q+4,cursize,delta);mem[v].hh.rh:=z;
mem[q+1].int:=hpack(x,0,1){:789};end;
{:784}{790:}function makeop(q:halfword):scaled;var delta:scaled;
p,v,x,y,z:halfword;c:quarterword;i:fourquarters;
shiftup,shiftdown:scaled;
begin if(mem[q].hh.b1=0)and(curstyle<2)then mem[q].hh.b1:=1;
if mem[q+1].hh.rh=1 then begin fetch(q+1);
if(curstyle<2)and(((curi.b2)mod 4)=2)then begin c:=curi.b3;
i:=fontinfo[charbase[curf]+c].qqqq;if(i.b0>0)then begin curc:=c;curi:=i;
mem[q+1].hh.b1:=c;end;end;
delta:=fontinfo[italicbase[curf]+(curi.b2)div 256].int;
x:=cleanbox(q+1,curstyle,mem[q+4].hh.lh);
if(mem[q+3].hh.rh<>0)and(mem[q].hh.b1<>1)then mem[x+1].int:=mem[x+1].int
-delta;
mem[x+4].int:=half(mem[x+3].int-mem[x+2].int)-fontinfo[22+parambase[eqtb
[50988+cursize].hh.rh]].int;mem[q+1].hh.rh:=2;mem[q+1].hh.lh:=x;
end else delta:=0;
if mem[q].hh.b1=1 then{791:}begin x:=cleanbox(q+2,2*(curstyle div 4)+4+(
curstyle mod 2),mem[q+4].hh.lh);
y:=cleanbox(q+1,curstyle,mem[q+4].hh.lh);
z:=cleanbox(q+3,2*(curstyle div 4)+5,mem[q+4].hh.lh);v:=newnullbox;
mem[v].hh.b0:=1;mem[v+1].int:=mem[y+1].int;
if mem[x+1].int>mem[v+1].int then mem[v+1].int:=mem[x+1].int;
if mem[z+1].int>mem[v+1].int then mem[v+1].int:=mem[z+1].int;
x:=rebox(x,mem[v+1].int);y:=rebox(y,mem[v+1].int);
z:=rebox(z,mem[v+1].int);mem[x+4].int:=half(delta);
mem[z+4].int:=-mem[x+4].int;mem[v+3].int:=mem[y+3].int;
mem[v+2].int:=mem[y+2].int;
{792:}if mem[q+2].hh.rh=0 then begin deleteglueref(mem[x+7].hh.rh);
deleteglueref(mem[x+7].hh.lh);freenode(x,10);mem[v+5].hh.rh:=y;
end else begin shiftup:=fontinfo[11+parambase[eqtb[50989+cursize].hh.rh]
].int-mem[x+2].int;
if shiftup<fontinfo[9+parambase[eqtb[50989+cursize].hh.rh]].int then
shiftup:=fontinfo[9+parambase[eqtb[50989+cursize].hh.rh]].int;
p:=newkern(shiftup);mem[p].hh.rh:=y;mem[x].hh.rh:=p;
p:=newkern(fontinfo[13+parambase[eqtb[50989+cursize].hh.rh]].int);
mem[p].hh.rh:=x;mem[v+5].hh.rh:=p;
mem[v+3].int:=mem[v+3].int+fontinfo[13+parambase[eqtb[50989+cursize].hh.
rh]].int+mem[x+3].int+mem[x+2].int+shiftup;end;
if mem[q+3].hh.rh=0 then begin deleteglueref(mem[z+7].hh.rh);
deleteglueref(mem[z+7].hh.lh);
freenode(z,10)end else begin shiftdown:=fontinfo[12+parambase[eqtb[
50989+cursize].hh.rh]].int-mem[z+3].int;
if shiftdown<fontinfo[10+parambase[eqtb[50989+cursize].hh.rh]].int then
shiftdown:=fontinfo[10+parambase[eqtb[50989+cursize].hh.rh]].int;
p:=newkern(shiftdown);mem[y].hh.rh:=p;mem[p].hh.rh:=z;
p:=newkern(fontinfo[13+parambase[eqtb[50989+cursize].hh.rh]].int);
mem[z].hh.rh:=p;
mem[v+2].int:=mem[v+2].int+fontinfo[13+parambase[eqtb[50989+cursize].hh.
rh]].int+mem[z+3].int+mem[z+2].int+shiftdown;end{:792};mem[q+1].int:=v;
end{:791};makeop:=delta;end;{:790}{793:}procedure makeord(q:halfword);
label 20,10;var a:integer;gp,gq,p,r:halfword;rr:halfword;
begin 20:if(mem[q+3].hh.rh=0)and(mem[q+2].hh.rh=0)and((mem[q+1].hh.rh=1)
or(mem[q+1].hh.rh=6))then begin p:=mem[q].hh.rh;
if p<>-1073741823 then if(mem[p].hh.b0>=18)and(mem[p].hh.b0<=24)then if
mem[p+1].hh.b0=mem[q+1].hh.b0 then if mem[p+1].hh.rh=1 then begin mem[q
+1].hh.rh:=5;fetch(q+1);
if((curi.b2)mod 4)=1 then begin a:=ligkernbase[curf]+curi.b3;
curc:=mem[p+1].hh.b1;curi:=fontinfo[a].qqqq;
if curi.b0>128 then begin a:=ligkernbase[curf]+256*curi.b2+curi.b3
+32768-256*(128);curi:=fontinfo[a].qqqq;end;
while true do begin{794:}if curi.b1=curc then if curi.b0<=128 then if
curi.b2>=128 then begin p:=newkern(fontinfo[kernbase[curf]+256*curi.b2+
curi.b3].int);mem[p].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=p;goto 10;
end else begin begin if interrupt<>0 then pauseforinstructions;end;
case curi.b2 of 1,5:mem[q+1].hh.b1:=curi.b3;2,6:mem[p+1].hh.b1:=curi.b3;
3,7,11:begin r:=newnoad;mem[r+1].hh.b1:=curi.b3;
mem[r+1].hh.b0:=mem[q+1].hh.b0;mem[q].hh.rh:=r;mem[r].hh.rh:=p;
if curi.b2<11 then mem[r+1].hh.rh:=1 else mem[r+1].hh.rh:=5;end;
others:begin mem[q].hh.rh:=mem[p].hh.rh;mem[q+1].hh.b1:=curi.b3;
mem[q+3]:=mem[p+3];mem[q+2]:=mem[p+2];freenode(p,5);end end;
if curi.b2>3 then goto 10;mem[q+1].hh.rh:=1;goto 20;end{:794};
if curi.b0>=128 then goto 10;a:=a+curi.b0+1;curi:=fontinfo[a].qqqq;end;
end;end else if mem[p+1].hh.rh=6 then begin mem[q+1].hh.rh:=7;
fetch(p+1);a:=curc;fetch(q+1);if((curi.b2)mod 4)=1 then begin curc:=a;
a:=ligkernbase[curf]+curi.b3;curi:=fontinfo[a].qqqq;
if curi.b0>128 then begin a:=ligkernbase[curf]+256*curi.b2+curi.b3
+32768-256*(128);curi:=fontinfo[a].qqqq;end;
while true do begin if curi.b1=curc then if curi.b0<=128 then if curi.b2
<128 then begin gp:=fontglue[curf];rr:=curi.b2*256+curi.b3;
if gp<>-1073741823 then begin while((mem[gp].hh.b0<>rr)and(mem[gp].hh.rh
<>-1073741823))do begin gp:=mem[gp].hh.rh;end;gq:=mem[gp+1].hh.lh;
end else begin gp:=getnode(2);fontglue[curf]:=gp;gq:=-1073741823;end;
if gq=-1073741823 then begin mem[gp].hh.b0:=rr;gq:=newspec(membot);
mem[gp+1].hh.lh:=gq;a:=extenbase[curf]+(rr)*3;
mem[gq+1].int:=fontinfo[a].int;mem[gq+2].int:=fontinfo[a+1].int;
mem[gq+3].int:=fontinfo[a+2].int;incr(mem[gq].hh.rh);
mem[gp].hh.rh:=getnode(2);gp:=mem[gp].hh.rh;
mem[gp+1].hh.lh:=-1073741823;mem[gp].hh.rh:=-1073741823;end;
p:=newglue(gq);mem[p].hh.b1:=21;mem[p].hh.rh:=mem[q].hh.rh;
mem[q].hh.rh:=p;goto 10;
end else begin p:=newkern(fontinfo[kernbase[curf]+256*curi.b2+curi.b3].
int);mem[p].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=p;goto 10;end;
if curi.b0>=128 then goto 10;a:=a+curi.b0+1;curi:=fontinfo[a].qqqq;end;
end;end;end;10:end;{:793}{797:}procedure makescripts(q:halfword;
delta:scaled);var p,x,y,z:halfword;shiftup,shiftdown,clr:scaled;
t:integer;begin p:=mem[q+1].int;if(p>=himemmin)then begin shiftup:=0;
shiftdown:=0;end else begin z:=hpack(p,0,1);
if curstyle<4 then t:=256 else t:=512;
shiftup:=mem[z+3].int-fontinfo[18+parambase[eqtb[50988+t].hh.rh]].int;
shiftdown:=mem[z+2].int+fontinfo[19+parambase[eqtb[50988+t].hh.rh]].int;
deleteglueref(mem[z+7].hh.rh);deleteglueref(mem[z+7].hh.lh);
freenode(z,10);end;
if mem[q+2].hh.rh=0 then{798:}begin x:=cleanbox(q+3,2*(curstyle div 4)+5
,mem[q+4].hh.lh);mem[x+1].int:=mem[x+1].int+eqtb[114969].int;
if shiftdown<fontinfo[16+parambase[eqtb[50988+cursize].hh.rh]].int then
shiftdown:=fontinfo[16+parambase[eqtb[50988+cursize].hh.rh]].int;
clr:=mem[x+3].int-(abs(fontinfo[5+parambase[eqtb[50988+cursize].hh.rh]].
int*4)div 5);if shiftdown<clr then shiftdown:=clr;
mem[x+4].int:=shiftdown;
end{:798}else begin{799:}begin x:=cleanbox(q+2,2*(curstyle div 4)+4+(
curstyle mod 2),mem[q+4].hh.lh);
mem[x+1].int:=mem[x+1].int+eqtb[114969].int;
if odd(curstyle)then clr:=fontinfo[15+parambase[eqtb[50988+cursize].hh.
rh]].int else if curstyle<2 then clr:=fontinfo[13+parambase[eqtb[50988+
cursize].hh.rh]].int else clr:=fontinfo[14+parambase[eqtb[50988+cursize]
.hh.rh]].int;if shiftup<clr then shiftup:=clr;
clr:=mem[x+2].int+(abs(fontinfo[5+parambase[eqtb[50988+cursize].hh.rh]].
int)div 4);if shiftup<clr then shiftup:=clr;end{:799};
if mem[q+3].hh.rh=0 then mem[x+4].int:=-shiftup else{800:}begin y:=
cleanbox(q+3,2*(curstyle div 4)+5,mem[q+4].hh.lh);
mem[y+1].int:=mem[y+1].int+eqtb[114969].int;
if shiftdown<fontinfo[17+parambase[eqtb[50988+cursize].hh.rh]].int then
shiftdown:=fontinfo[17+parambase[eqtb[50988+cursize].hh.rh]].int;
clr:=4*fontinfo[8+parambase[eqtb[50989+cursize].hh.rh]].int-((shiftup-
mem[x+2].int)-(mem[y+3].int-shiftdown));
if clr>0 then begin shiftdown:=shiftdown+clr;
clr:=(abs(fontinfo[5+parambase[eqtb[50988+cursize].hh.rh]].int*4)div 5)-
(shiftup-mem[x+2].int);if clr>0 then begin shiftup:=shiftup+clr;
shiftdown:=shiftdown-clr;end;end;mem[x+4].int:=delta;
p:=newkern((shiftup-mem[x+2].int)-(mem[y+3].int-shiftdown));
mem[x].hh.rh:=p;mem[p].hh.rh:=y;x:=vpackage(x,0,1,1073741823);
mem[x+4].int:=shiftdown;end{:800};end;
if mem[q+1].int=-1073741823 then mem[q+1].int:=x else begin p:=mem[q+1].
int;while mem[p].hh.rh<>-1073741823 do p:=mem[p].hh.rh;mem[p].hh.rh:=x;
end;end;{:797}{803:}function makeleftright(q:halfword;style:smallnumber;
maxd,maxh:scaled):smallnumber;var delta,delta1,delta2:scaled;
begin curstyle:=style;
{744:}begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2
)div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[50988+cursize].hh.rh]].int,18);
end{:744};
delta2:=maxd+fontinfo[22+parambase[eqtb[50988+cursize].hh.rh]].int;
delta1:=maxh+maxd-delta2;if delta2>delta1 then delta1:=delta2;
delta:=(delta1 div 500)*eqtb[114379].int;
delta2:=delta1+delta1-eqtb[114967].int;
if delta<delta2 then delta:=delta2;
mem[q+1].int:=vardelimiter(q+1,cursize,delta);
makeleftright:=mem[q].hh.b0-(10);end;{:803}procedure mlisttohlist;
label 21,82,80,81,83,30;var mlist:halfword;penalties:boolean;
style:smallnumber;u:halfword;savestyle:smallnumber;q:halfword;
r:halfword;rtype:smallnumber;t:smallnumber;p,x,y,z:halfword;pen:integer;
s:integer;maxh,maxd:scaled;delta:scaled;begin mlist:=curmlist;
penalties:=mlistpenalties;style:=curstyle;q:=mlist;r:=-1073741823;
rtype:=19;maxh:=0;maxd:=0;
{744:}begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2
)div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[50988+cursize].hh.rh]].int,18);
end{:744};while q<>-1073741823 do{768:}begin{769:}21:delta:=0;
case mem[q].hh.b0 of 20:case rtype of 20,19,21,22,24,32:begin mem[q].hh.
b0:=18;goto 21;end;others:end;
21,23,24,33:begin{770:}if rtype=20 then mem[r].hh.b0:=18{:770};
if mem[q].hh.b0=33 then goto 80;end;{774:}32:goto 80;
27:begin makefraction(q);goto 82;end;19:begin delta:=makeop(q);
if mem[q].hh.b1=1 then goto 82;end;18:makeord(q);22,25:;
26:makeradical(q);29:makeover(q);28:makeunder(q);30:makemathaccent(q);
31:makevcenter(q);{:774}{771:}16:begin curstyle:=mem[q].hh.b1;
{744:}begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2
)div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[50988+cursize].hh.rh]].int,18);
end{:744};goto 81;end;
17:{772:}begin case curstyle div 2 of 0:begin p:=mem[q+1].hh.lh;
mem[q+1].hh.lh:=-1073741823;end;1:begin p:=mem[q+1].hh.rh;
mem[q+1].hh.rh:=-1073741823;end;2:begin p:=mem[q+2].hh.lh;
mem[q+2].hh.lh:=-1073741823;end;3:begin p:=mem[q+2].hh.rh;
mem[q+2].hh.rh:=-1073741823;end;end;flushnodelist(mem[q+1].hh.lh);
flushnodelist(mem[q+1].hh.rh);flushnodelist(mem[q+2].hh.lh);
flushnodelist(mem[q+2].hh.rh);mem[q].hh.b0:=16;mem[q].hh.b1:=curstyle;
mem[q+1].int:=0;mem[q+2].int:=0;
if p<>-1073741823 then begin z:=mem[q].hh.rh;mem[q].hh.rh:=p;
while mem[p].hh.rh<>-1073741823 do p:=mem[p].hh.rh;mem[p].hh.rh:=z;end;
goto 81;end{:772};4,6,7,10,14,9:goto 81;
3:begin if mem[q+3].int>maxh then maxh:=mem[q+3].int;
if mem[q+2].int>maxd then maxd:=mem[q+2].int;goto 81;end;
12:begin{773:}if mem[q].hh.b1=99 then begin x:=mem[q+1].hh.lh;
y:=mathglue(x,curmu);deleteglueref(x);mem[q+1].hh.lh:=y;mem[q].hh.b1:=0;
end else if(cursize<>0)and(mem[q].hh.b1=98)then begin p:=mem[q].hh.rh;
if p<>-1073741823 then if(mem[p].hh.b0=12)or(mem[p].hh.b0=13)then begin
mem[q].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=-1073741823;flushnodelist(p);
end;end{:773};goto 81;end;13:begin mathkern(q,curmu);goto 81;end;
5:goto 81;{:771}others:confusion(1057)end;
{795:}case mem[q+1].hh.rh of 1,5,6,7:{796:}begin fetch(q+1);
if(curi.b0>0)then begin delta:=fontinfo[italicbase[curf]+(curi.b2)div
256].int;p:=newcharacter(curf,curc);u:=p;
if fontdir[curf]<>0 then begin mem[u].hh.rh:=getavail;u:=mem[u].hh.rh;
mem[u].hh.lh:=mem[q+4].hh.lh;end;
if((mem[q+1].hh.rh=5)or(mem[q+1].hh.rh=7))and(fontinfo[2+parambase[curf]
].int<>0)then delta:=0;
if(mem[q+3].hh.rh=0)and(delta<>0)then begin mem[u].hh.rh:=newkern(delta)
;delta:=0;end;end else p:=-1073741823;end{:796};0:p:=-1073741823;
2:p:=mem[q+1].hh.lh;3:p:=shiftsubexpbox(q+1);
4:begin curmlist:=mem[q+1].hh.lh;savestyle:=curstyle;
mlistpenalties:=false;mlisttohlist;curstyle:=savestyle;
{744:}begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2
)div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[50988+cursize].hh.rh]].int,18);
end{:744};p:=hpack(mem[memtop-3].hh.rh,0,1);end;
others:confusion(1059)end;mem[q+1].int:=p;
if(mem[q+3].hh.rh=0)and(mem[q+2].hh.rh=0)then goto 82;
makescripts(q,delta){:795}{:769};82:z:=hpack(mem[q+1].int,0,1);
if mem[z+3].int>maxh then maxh:=mem[z+3].int;
if mem[z+2].int>maxd then maxd:=mem[z+2].int;
deleteglueref(mem[z+7].hh.rh);deleteglueref(mem[z+7].hh.lh);
freenode(z,10);80:r:=q;rtype:=mem[r].hh.b0;
if rtype=33 then begin rtype:=32;curstyle:=style;
{744:}begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2
)div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[50988+cursize].hh.rh]].int,18);
end{:744};end;81:q:=mem[q].hh.rh;end{:768};
{770:}if rtype=20 then mem[r].hh.b0:=18{:770};{801:}p:=memtop-3;
mem[p].hh.rh:=-1073741823;q:=mlist;rtype:=0;curstyle:=style;
{744:}begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2
)div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[50988+cursize].hh.rh]].int,18);
end{:744};while q<>-1073741823 do begin{802:}t:=18;s:=5;pen:=10000;
case mem[q].hh.b0 of 19,22,23,24,25:t:=mem[q].hh.b0;20:begin t:=20;
pen:=eqtb[114370].int;end;21:begin t:=21;pen:=eqtb[114371].int;end;
18,31,29,28:;26:s:=6;30:s:=6;27:s:=6;
32,33:t:=makeleftright(q,style,maxd,maxh);
16:{804:}begin curstyle:=mem[q].hh.b1;s:=3;
{744:}begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2
)div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[50988+cursize].hh.rh]].int,18);
end{:744};goto 83;end{:804};10,14,3,9,7,4,6,12,13:begin mem[p].hh.rh:=q;
p:=q;q:=mem[q].hh.rh;mem[p].hh.rh:=-1073741823;goto 30;end;
5:begin mem[p].hh.rh:=q;p:=q;q:=mem[q].hh.rh;mem[p].hh.rh:=-1073741823;
goto 30;end;others:confusion(1060)end{:802};
{807:}if rtype>0 then begin case strpool[rtype*8+t+magicoffset]of 48:x:=
0;49:if curstyle<4 then x:=17 else x:=0;50:x:=17;
51:if curstyle<4 then x:=18 else x:=0;
52:if curstyle<4 then x:=19 else x:=0;others:confusion(1062)end;
if x<>0 then begin y:=mathglue(eqtb[49925+x].hh.rh,curmu);z:=newglue(y);
mem[y].hh.rh:=-1073741823;mem[p].hh.rh:=z;p:=z;mem[z].hh.b1:=x+1;end;
end{:807};
{808:}if mem[q+1].int<>-1073741823 then begin mem[p].hh.rh:=mem[q+1].int
;repeat p:=mem[p].hh.rh;until mem[p].hh.rh=-1073741823;end;
if penalties then if mem[q].hh.rh<>-1073741823 then if pen<10000 then
begin rtype:=mem[mem[q].hh.rh].hh.b0;
if rtype<>14 then if rtype<>21 then begin z:=newpenalty(pen);
mem[p].hh.rh:=z;p:=z;end;end{:808};if mem[q].hh.b0=33 then t:=22;
rtype:=t;83:r:=q;q:=mem[q].hh.rh;freenode(r,s);30:end{:801};
p:=newnullbox;mem[p].hh.rh:=mem[memtop-3].hh.rh;adjusthlist(p,false);
mem[memtop-3].hh.rh:=mem[p].hh.rh;deleteglueref(mem[p+7].hh.rh);
deleteglueref(mem[p+7].hh.lh);freenode(p,10);end;
{:767}{813:}procedure pushalignment;var p:halfword;begin p:=getnode(6);
mem[p].hh.rh:=alignptr;mem[p].hh.lh:=curalign;
mem[p+1].hh.lh:=mem[memtop-8].hh.rh;mem[p+1].hh.rh:=curspan;
mem[p+2].int:=curloop;mem[p+3].int:=alignstate;mem[p+4].hh.lh:=curhead;
mem[p+4].hh.rh:=curtail;mem[p+5].hh.lh:=curprehead;
mem[p+5].hh.rh:=curpretail;alignptr:=p;curhead:=getavail;
curprehead:=getavail;end;procedure popalignment;var p:halfword;
begin begin mem[curhead].hh.rh:=avail;avail:=curhead;
ifdef('STAT')decr(dynused);endif('STAT')end;
begin mem[curprehead].hh.rh:=avail;avail:=curprehead;
ifdef('STAT')decr(dynused);endif('STAT')end;p:=alignptr;
curtail:=mem[p+4].hh.rh;curhead:=mem[p+4].hh.lh;
curpretail:=mem[p+5].hh.rh;curprehead:=mem[p+5].hh.lh;
alignstate:=mem[p+3].int;curloop:=mem[p+2].int;curspan:=mem[p+1].hh.rh;
mem[memtop-8].hh.rh:=mem[p+1].hh.lh;curalign:=mem[p].hh.lh;
alignptr:=mem[p].hh.rh;freenode(p,6);end;
{:813}{815:}{823:}procedure getpreambletoken;label 20;begin 20:gettoken;
while(curchr=16777216)and(curcmd=4)do begin gettoken;
if curcmd>118 then begin expand;gettoken;end;end;
if curcmd=9 then fatalerror(686);
if(curcmd=85)and(curchr=49936)then begin scanoptionalequals;scanglue(2);
if eqtb[114404].int>0 then geqdefine(49936,135,curval)else eqdefine(
49936,135,curval);goto 20;end;end;{:823}procedure alignpeek;forward;
procedure normalparagraph;forward;procedure initalign;label 30,31,32,22;
var savecsptr:halfword;p:halfword;begin savecsptr:=curcs;pushalignment;
alignstate:=-1000000;
{817:}if(curlist.modefield=239)and((curlist.tailfield<>curlist.headfield
)or(curlist.auxfield.int<>-1073741823))then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(265);
print(784);end;printesc(588);print(1063);begin helpptr:=3;
helpline[2]:=1064;helpline[1]:=1065;helpline[0]:=1066;end;error;
flushmath;end{:817};pushnest;
{816:}if curlist.modefield=239 then begin curlist.modefield:=-1;
curlist.auxfield.int:=nest[nestptr-2].auxfield.int;
end else if curlist.modefield>0 then curlist.modefield:=-curlist.
modefield{:816};scanspec(6,false);
{818:}mem[memtop-8].hh.rh:=-1073741823;curalign:=memtop-8;
curloop:=-1073741823;scannerstatus:=4;warningindex:=savecsptr;
alignstate:=-1000000;
while true do begin{819:}mem[curalign].hh.rh:=newparamglue(11);
curalign:=mem[curalign].hh.rh{:819};if curcmd=5 then goto 30;
{820:}{824:}p:=memtop-4;mem[p].hh.rh:=-1073741823;
while true do begin getpreambletoken;if curcmd=6 then goto 31;
if(curcmd<=5)and(curcmd>=4)and(alignstate=-1000000)then if(p=memtop-4)
and(curloop=-1073741823)and(curcmd=4)then curloop:=curalign else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1072);
end;begin helpptr:=3;helpline[2]:=1073;helpline[1]:=1074;
helpline[0]:=1075;end;backerror;goto 31;
end else if(curcmd<>10)or(p<>memtop-4)then begin mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=curtok;end;end;31:{:824};
mem[curalign].hh.rh:=newnullbox;curalign:=mem[curalign].hh.rh;
mem[curalign].hh.lh:=memtop-9;mem[curalign+1].int:=-1073741824;
mem[curalign+3].int:=mem[memtop-4].hh.rh;{825:}p:=memtop-4;
mem[p].hh.rh:=-1073741823;while true do begin 22:getpreambletoken;
if(curcmd<=5)and(curcmd>=4)and(alignstate=-1000000)then goto 32;
if curcmd=6 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1076);
end;begin helpptr:=3;helpline[2]:=1073;helpline[1]:=1074;
helpline[0]:=1077;end;error;goto 22;end;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=curtok;end;32:mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=536909726{:825};
mem[curalign+2].int:=mem[memtop-4].hh.rh{:820};end;
30:scannerstatus:=0{:818};newsavelevel(6);
if eqtb[50466].hh.rh<>-1073741823 then begintokenlist(eqtb[50466].hh.rh,
13);alignpeek;end;{:815}{827:}{828:}procedure initspan(p:halfword);
begin pushnest;
if curlist.modefield=-120 then curlist.auxfield.hh.lh:=1000 else begin
curlist.auxfield.int:=-65536000;normalparagraph;end;
curlist.inhibitglueflagfield:=false;curspan:=p;end;
{:828}procedure initrow;begin pushnest;
curlist.modefield:=(-121)-curlist.modefield;
if curlist.modefield=-120 then curlist.auxfield.hh.lh:=0 else curlist.
auxfield.int:=0;
begin mem[curlist.tailfield].hh.rh:=newglue(mem[mem[memtop-8].hh.rh+1].
hh.lh);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=12;
curalign:=mem[mem[memtop-8].hh.rh].hh.rh;curtail:=curhead;
curpretail:=curprehead;initspan(curalign);end;
{:827}{829:}procedure initcol;begin mem[curalign+5].hh.lh:=curcmd;
if curcmd=69 then alignstate:=0 else begin backinput;
begintokenlist(mem[curalign+3].int,1);end;end;
{:829}{832:}function fincol:boolean;label 10;var p:halfword;
q,r:halfword;s:halfword;u:halfword;w:scaled;o:glueord;n:halfword;
begin if curalign=-1073741823 then confusion(1078);
q:=mem[curalign].hh.rh;if q=-1073741823 then confusion(1078);
if alignstate<500000 then fatalerror(686);p:=mem[q].hh.rh;
{833:}if(p=-1073741823)and(mem[curalign+5].hh.lh<16777217)then if
curloop<>-1073741823 then{834:}begin mem[q].hh.rh:=newnullbox;
p:=mem[q].hh.rh;mem[p].hh.lh:=memtop-9;mem[p+1].int:=-1073741824;
curloop:=mem[curloop].hh.rh;{835:}q:=memtop-4;r:=mem[curloop+3].int;
while r<>-1073741823 do begin mem[q].hh.rh:=getavail;q:=mem[q].hh.rh;
mem[q].hh.lh:=mem[r].hh.lh;r:=mem[r].hh.rh;end;
mem[q].hh.rh:=-1073741823;mem[p+3].int:=mem[memtop-4].hh.rh;q:=memtop-4;
r:=mem[curloop+2].int;
while r<>-1073741823 do begin mem[q].hh.rh:=getavail;q:=mem[q].hh.rh;
mem[q].hh.lh:=mem[r].hh.lh;r:=mem[r].hh.rh;end;
mem[q].hh.rh:=-1073741823;mem[p+2].int:=mem[memtop-4].hh.rh{:835};
curloop:=mem[curloop].hh.rh;mem[p].hh.rh:=newglue(mem[curloop+1].hh.lh);
mem[mem[p].hh.rh].hh.b1:=12;
end{:834}else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1079);
end;printesc(1068);begin helpptr:=3;helpline[2]:=1080;helpline[1]:=1081;
helpline[0]:=1082;end;mem[curalign+5].hh.lh:=16777217;error;end{:833};
if mem[curalign+5].hh.lh<>16777216 then begin unsave;newsavelevel(6);
{837:}begin if curlist.modefield=-120 then begin adjusttail:=curtail;
preadjusttail:=curpretail;adjusthlist(curlist.headfield,false);
deleteglueref(curkanjiskip);deleteglueref(curxkanjiskip);
curkanjiskip:=mem[curlist.headfield+7].hh.rh;
curxkanjiskip:=mem[curlist.headfield+7].hh.lh;
incr(mem[curkanjiskip].hh.rh);incr(mem[curxkanjiskip].hh.rh);
u:=hpack(mem[curlist.headfield].hh.rh,0,1);w:=mem[u+1].int;
curtail:=adjusttail;adjusttail:=-1073741823;curpretail:=preadjusttail;
preadjusttail:=-1073741823;
end else begin u:=vpackage(mem[curlist.headfield].hh.rh,0,1,0);
w:=mem[u+3].int;end;n:=0;
if curspan<>curalign then{839:}begin q:=curspan;repeat incr(n);
q:=mem[mem[q].hh.rh].hh.rh;until q=curalign;
if n>65535 then confusion(1083);q:=curspan;
while mem[mem[q].hh.lh].hh.rh<n do q:=mem[q].hh.lh;
if mem[mem[q].hh.lh].hh.rh>n then begin s:=getnode(2);
mem[s].hh.lh:=mem[q].hh.lh;mem[s].hh.rh:=n;mem[q].hh.lh:=s;
mem[s+1].int:=w;
end else if mem[mem[q].hh.lh+1].int<w then mem[mem[q].hh.lh+1].int:=w;
end{:839}else if w>mem[curalign+1].int then mem[curalign+1].int:=w;
mem[u].hh.b0:=15;mem[u].hh.b1:=n;
{700:}if totalstretch[4]<>0 then o:=4 else if totalstretch[3]<>0 then o
:=3 else if totalstretch[2]<>0 then o:=2 else if totalstretch[1]<>0 then
o:=1 else o:=0{:700};mem[u+5].hh.b1:=o;mem[u+6].int:=totalstretch[o];
{706:}if totalshrink[4]<>0 then o:=4 else if totalshrink[3]<>0 then o:=3
else if totalshrink[2]<>0 then o:=2 else if totalshrink[1]<>0 then o:=1
else o:=0{:706};mem[u+5].hh.b0:=o;mem[u+4].int:=totalshrink[o];popnest;
mem[curlist.tailfield].hh.rh:=u;curlist.tailfield:=u;end{:837};
{836:}begin mem[curlist.tailfield].hh.rh:=newglue(mem[mem[curalign].hh.
rh+1].hh.lh);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=12{:836};
if mem[curalign+5].hh.lh>=16777217 then begin fincol:=true;goto 10;end;
initspan(p);end;alignstate:=1000000;repeat getxorprotected;
until curcmd<>10;curalign:=p;initcol;fincol:=false;10:end;
{:832}{840:}procedure finrow;var p:halfword;
begin if curlist.modefield=-120 then begin adjusthlist(curlist.headfield
,false);deleteglueref(curkanjiskip);deleteglueref(curxkanjiskip);
curkanjiskip:=mem[curlist.headfield+7].hh.rh;
curxkanjiskip:=mem[curlist.headfield+7].hh.lh;
incr(mem[curkanjiskip].hh.rh);incr(mem[curxkanjiskip].hh.rh);
p:=hpack(mem[curlist.headfield].hh.rh,0,1);popnest;
if curprehead<>curpretail then begin mem[curlist.tailfield].hh.rh:=mem[
curprehead].hh.rh;curlist.tailfield:=curpretail;end;appendtovlist(p);
if curhead<>curtail then begin mem[curlist.tailfield].hh.rh:=mem[curhead
].hh.rh;curlist.tailfield:=curtail;end;
end else begin p:=vpackage(mem[curlist.headfield].hh.rh,0,1,1073741823);
popnest;mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
curlist.auxfield.hh.lh:=1000;curlist.inhibitglueflagfield:=false;end;
mem[p].hh.b0:=15;mem[p+6].int:=0;
if eqtb[50466].hh.rh<>-1073741823 then begintokenlist(eqtb[50466].hh.rh,
13);alignpeek;end;{:840}{841:}procedure doassignments;forward;
procedure resumeafterdisplay;forward;procedure buildpage;forward;
procedure finalign;var p,q,r,s,u,v,z:halfword;t,w:scaled;o:scaled;
n:halfword;rulesave:scaled;auxsave:memoryword;
begin if curgroup<>6 then confusion(1084);unsave;
if curgroup<>6 then confusion(1085);unsave;
if nest[nestptr-1].modefield=239 then o:=eqtb[114972].int else o:=0;
{842:}q:=mem[mem[memtop-8].hh.rh].hh.rh;repeat flushlist(mem[q+3].int);
flushlist(mem[q+2].int);p:=mem[mem[q].hh.rh].hh.rh;
if mem[q+1].int=-1073741824 then{843:}begin mem[q+1].int:=0;
r:=mem[q].hh.rh;s:=mem[r+1].hh.lh;
if s<>membot then begin incr(mem[membot].hh.rh);deleteglueref(s);
mem[r+1].hh.lh:=membot;end;end{:843};
if mem[q].hh.lh<>memtop-9 then{844:}begin t:=mem[q+1].int+mem[mem[mem[q]
.hh.rh+1].hh.lh+1].int;r:=mem[q].hh.lh;s:=memtop-9;mem[s].hh.lh:=p;n:=1;
repeat mem[r+1].int:=mem[r+1].int-t;u:=mem[r].hh.lh;
while mem[r].hh.rh>n do begin s:=mem[s].hh.lh;
n:=mem[mem[s].hh.lh].hh.rh+1;end;
if mem[r].hh.rh<n then begin mem[r].hh.lh:=mem[s].hh.lh;mem[s].hh.lh:=r;
decr(mem[r].hh.rh);s:=r;
end else begin if mem[r+1].int>mem[mem[s].hh.lh+1].int then mem[mem[s].
hh.lh+1].int:=mem[r+1].int;freenode(r,2);end;r:=u;until r=memtop-9;
end{:844};mem[q].hh.b0:=15;mem[q].hh.b1:=0;mem[q+3].int:=0;
mem[q+2].int:=0;mem[q+5].hh.b1:=0;mem[q+5].hh.b0:=0;mem[q+6].int:=0;
mem[q+4].int:=0;q:=p;until q=-1073741823{:842};{845:}saveptr:=saveptr-2;
packbeginline:=-curlist.mlfield;
if curlist.modefield=-1 then begin rulesave:=eqtb[114973].int;
eqtb[114973].int:=0;z:=newnullbox;mem[z].hh.rh:=mem[memtop-8].hh.rh;
adjusthlist(z,false);deleteglueref(curkanjiskip);
deleteglueref(curxkanjiskip);curkanjiskip:=mem[z+7].hh.rh;
curxkanjiskip:=mem[z+7].hh.lh;incr(mem[curkanjiskip].hh.rh);
incr(mem[curxkanjiskip].hh.rh);
p:=hpack(mem[memtop-8].hh.rh,savestack[saveptr+1].int,savestack[saveptr
+0].int);eqtb[114973].int:=rulesave;deleteglueref(mem[z+7].hh.rh);
deleteglueref(mem[z+7].hh.lh);freenode(z,10);
end else begin q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat mem[q+3].int:=mem[q+1].int;mem[q+1].int:=0;
q:=mem[mem[q].hh.rh].hh.rh;until q=-1073741823;
p:=vpackage(mem[memtop-8].hh.rh,savestack[saveptr+1].int,savestack[
saveptr+0].int,1073741823);q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat mem[q+1].int:=mem[q+3].int;mem[q+3].int:=0;
q:=mem[mem[q].hh.rh].hh.rh;until q=-1073741823;end;
packbeginline:=0{:845};{846:}q:=mem[curlist.headfield].hh.rh;
s:=curlist.headfield;
while q<>-1073741823 do begin if not(q>=himemmin)then if mem[q].hh.b0=15
then{848:}begin if curlist.modefield=-1 then begin mem[q].hh.b0:=0;
mem[q+1].int:=mem[p+1].int;
if nest[nestptr-1].modefield=239 then mem[q].hh.b1:=((mem[q].hh.b1)mod
16-5)+5+16*(2);end else begin mem[q].hh.b0:=1;
mem[q+3].int:=mem[p+3].int;end;
mem[q].hh.b1:=((mem[q].hh.b1)div 16)*16+curlist.dirfield+5;
mem[q+5].hh.b1:=mem[p+5].hh.b1;mem[q+5].hh.b0:=mem[p+5].hh.b0;
mem[q+6].gr:=mem[p+6].gr;mem[q+4].int:=o;r:=mem[mem[q+5].hh.rh].hh.rh;
s:=mem[mem[p+5].hh.rh].hh.rh;repeat{849:}n:=mem[r].hh.b1;
t:=mem[s+1].int;w:=t;u:=memtop-4;
mem[r].hh.b1:=((mem[r].hh.b1)mod 16-5)+5+16*(0);
while n>0 do begin decr(n);{850:}s:=mem[s].hh.rh;v:=mem[s+1].hh.lh;
mem[u].hh.rh:=newglue(v);u:=mem[u].hh.rh;mem[u].hh.b1:=12;
t:=t+mem[v+1].int;
if mem[p+5].hh.b0=1 then begin if mem[v].hh.b0=mem[p+5].hh.b1 then t:=t+
round(mem[p+6].gr*mem[v+2].int);
end else if mem[p+5].hh.b0=2 then begin if mem[v].hh.b1=mem[p+5].hh.b1
then t:=t-round(mem[p+6].gr*mem[v+3].int);end;s:=mem[s].hh.rh;
mem[u].hh.rh:=newnullbox;u:=mem[u].hh.rh;t:=t+mem[s+1].int;
if curlist.modefield=-1 then mem[u+1].int:=mem[s+1].int else begin mem[u
].hh.b0:=1;mem[u+3].int:=mem[s+1].int;end;
mem[u].hh.b1:=((mem[u].hh.b1)div 16)*16+curlist.dirfield+5{:850};end;
if curlist.modefield=-1 then{851:}begin mem[r+3].int:=mem[q+3].int;
mem[r+2].int:=mem[q+2].int;
if t=mem[r+1].int then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;
end else if t>mem[r+1].int then begin mem[r+5].hh.b0:=1;
if mem[r+6].int=0 then mem[r+6].gr:=0.0 else mem[r+6].gr:=(t-mem[r+1].
int)/mem[r+6].int;end else begin mem[r+5].hh.b1:=mem[r+5].hh.b0;
mem[r+5].hh.b0:=2;
if mem[r+4].int=0 then mem[r+6].gr:=0.0 else if(mem[r+5].hh.b1=0)and(mem
[r+1].int-t>mem[r+4].int)then mem[r+6].gr:=1.0 else mem[r+6].gr:=(mem[r
+1].int-t)/mem[r+4].int;end;mem[r+1].int:=w;mem[r].hh.b0:=0;
mem[r].hh.b1:=((mem[r].hh.b1)div 16)*16+curlist.dirfield+5;
end{:851}else{852:}begin mem[r+1].int:=mem[q+1].int;
if t=mem[r+3].int then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;
end else if t>mem[r+3].int then begin mem[r+5].hh.b0:=1;
if mem[r+6].int=0 then mem[r+6].gr:=0.0 else mem[r+6].gr:=(t-mem[r+3].
int)/mem[r+6].int;end else begin mem[r+5].hh.b1:=mem[r+5].hh.b0;
mem[r+5].hh.b0:=2;
if mem[r+4].int=0 then mem[r+6].gr:=0.0 else if(mem[r+5].hh.b1=0)and(mem
[r+3].int-t>mem[r+4].int)then mem[r+6].gr:=1.0 else mem[r+6].gr:=(mem[r
+3].int-t)/mem[r+4].int;end;mem[r+3].int:=w;mem[r].hh.b0:=1;
mem[r].hh.b1:=((mem[r].hh.b1)div 16)*16+curlist.dirfield+5;end{:852};
mem[r+4].int:=0;if u<>memtop-4 then begin mem[u].hh.rh:=mem[r].hh.rh;
mem[r].hh.rh:=mem[memtop-4].hh.rh;r:=u;end{:849};
r:=mem[mem[r].hh.rh].hh.rh;s:=mem[mem[s].hh.rh].hh.rh;
until r=-1073741823;
end{:848}else if mem[q].hh.b0=3 then{847:}begin if(mem[q+1].int=
-1073741824)then mem[q+1].int:=mem[p+1].int;
if(mem[q+3].int=-1073741824)then mem[q+3].int:=mem[p+3].int;
if(mem[q+2].int=-1073741824)then mem[q+2].int:=mem[p+2].int;
if o<>0 then begin r:=mem[q].hh.rh;mem[q].hh.rh:=-1073741823;
q:=hpack(q,0,1);mem[q+4].int:=o;mem[q].hh.rh:=r;mem[s].hh.rh:=q;end;
end{:847};s:=q;q:=mem[q].hh.rh;end{:846};flushnodelist(p);popalignment;
{853:}auxsave:=curlist.auxfield;p:=mem[curlist.headfield].hh.rh;
q:=curlist.tailfield;popnest;
if curlist.modefield=239 then{1249:}begin doassignments;
if curcmd<>3 then{1250:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1373);
end;begin helpptr:=2;helpline[1]:=1064;helpline[0]:=1065;end;backerror;
end{:1250}else{1240:}begin repeat getxtoken;
until(eqtb[114442].int=0)or(curcmd<>13);
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1369);
end;begin helpptr:=2;helpline[1]:=1370;helpline[0]:=1371;end;backerror;
end;end{:1240};flushnodelist(curlist.eTeXauxfield);popnest;
begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[114372].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newparamglue(3);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.rh:=p;
if p<>-1073741823 then curlist.tailfield:=q;
begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[114373].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newparamglue(4);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.auxfield.int:=auxsave.int;resumeafterdisplay;
end{:1249}else begin curlist.auxfield:=auxsave;
mem[curlist.tailfield].hh.rh:=p;
if p<>-1073741823 then curlist.tailfield:=q;
if curlist.modefield=1 then buildpage;end{:853};end;
{826:}procedure alignpeek;label 20;begin 20:alignstate:=1000000;
repeat getxorprotected;until curcmd<>10;
if curcmd=40 then begin scanleftbrace;newsavelevel(7);
if curlist.modefield=-1 then normalparagraph;
end else if curcmd=2 then finalign else if(curcmd=5)and(curchr=16777218)
then goto 20 else begin initrow;initcol;end;end;
{:826}{:841}{856:}{867:}function finiteshrink(p:halfword):halfword;
var q:halfword;
begin if noshrinkerroryet then begin noshrinkerroryet:=false;
ifdef('STAT')if eqtb[114393].int>0 then enddiagnostic(true);
endif('STAT')begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1086);
end;begin helpptr:=5;helpline[4]:=1087;helpline[3]:=1088;
helpline[2]:=1089;helpline[1]:=1090;helpline[0]:=1091;end;error;
ifdef('STAT')if eqtb[114393].int>0 then begindiagnostic;
endif('STAT')end;q:=newspec(p);mem[q].hh.b1:=0;deleteglueref(p);
finiteshrink:=q;end;{:867}{870:}procedure trybreak(pi:integer;
breaktype:smallnumber);label 10,30,31,22,60,40,45;var r:halfword;
prevr:halfword;oldl:halfword;nobreakyet:boolean;
{871:}prevprevr:halfword;s:halfword;q:halfword;v:halfword;t:integer;
f:internalfontnumber;l:halfword;noderstaysactive:boolean;
linewidth:scaled;fitclass:0..3;b:halfword;d:integer;
artificialdemerits:boolean;savelink:halfword;shortfall:scaled;
{:871}{1625:}g:scaled;
{:1625}begin{872:}if abs(pi)>=10000 then if pi>0 then goto 10 else pi:=
-10000{:872};nobreakyet:=true;prevr:=memtop-7;oldl:=0;
curactivewidth[1]:=activewidth[1];curactivewidth[2]:=activewidth[2];
curactivewidth[3]:=activewidth[3];curactivewidth[4]:=activewidth[4];
curactivewidth[5]:=activewidth[5];curactivewidth[6]:=activewidth[6];
curactivewidth[7]:=activewidth[7];
while true do begin 22:r:=mem[prevr].hh.rh;
{873:}if mem[r].hh.b0=2 then begin curactivewidth[1]:=curactivewidth[1]+
mem[r+1].int;curactivewidth[2]:=curactivewidth[2]+mem[r+2].int;
curactivewidth[3]:=curactivewidth[3]+mem[r+3].int;
curactivewidth[4]:=curactivewidth[4]+mem[r+4].int;
curactivewidth[5]:=curactivewidth[5]+mem[r+5].int;
curactivewidth[6]:=curactivewidth[6]+mem[r+6].int;
curactivewidth[7]:=curactivewidth[7]+mem[r+7].int;prevprevr:=prevr;
prevr:=r;goto 22;end{:873};{876:}begin l:=mem[r+1].hh.lh;
if l>oldl then begin if(minimumdemerits<1073741823)and((oldl<>easyline)
or(r=memtop-7))then{877:}begin if nobreakyet then{878:}begin nobreakyet
:=false;breakwidth[1]:=background[1];breakwidth[2]:=background[2];
breakwidth[3]:=background[3];breakwidth[4]:=background[4];
breakwidth[5]:=background[5];breakwidth[6]:=background[6];
breakwidth[7]:=background[7];s:=curp;
if breaktype>0 then if curp<>-1073741823 then{881:}begin t:=mem[curp].hh
.b1;v:=curp;s:=mem[curp+1].hh.rh;while t>0 do begin decr(t);
v:=mem[v].hh.rh;{882:}if(v>=himemmin)then begin f:=mem[v].hh.b0;
breakwidth[1]:=breakwidth[1]-fontinfo[widthbase[f]+fontinfo[charbase[f]+
mem[v].hh.b1].qqqq.b0].int;if fontdir[f]<>0 then v:=mem[v].hh.rh;
end else case mem[v].hh.b0 of 8:begin f:=mem[v+1].hh.b0;
breakwidth[1]:=breakwidth[1]-fontinfo[widthbase[f]+fontinfo[charbase[f]+
mem[v+1].hh.b1].qqqq.b0].int;end;
0,1,2,3,13:breakwidth[1]:=breakwidth[1]-mem[v+1].int;5:;
others:confusion(1092)end{:882};end;
while s<>-1073741823 do begin{883:}if(s>=himemmin)then begin f:=mem[s].
hh.b0;
breakwidth[1]:=breakwidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f]+
mem[s].hh.b1].qqqq.b0].int;if fontdir[f]<>0 then s:=mem[s].hh.rh;
end else case mem[s].hh.b0 of 8:begin f:=mem[s+1].hh.b0;
breakwidth[1]:=breakwidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f]+
mem[s+1].hh.b1].qqqq.b0].int;end;
0,1,2,3,13:breakwidth[1]:=breakwidth[1]+mem[s+1].int;5:;
others:confusion(1093)end{:883};s:=mem[s].hh.rh;end;
breakwidth[1]:=breakwidth[1]+discwidth;
if mem[curp+1].hh.rh=-1073741823 then s:=mem[v].hh.rh;end{:881};
while s<>-1073741823 do begin if(s>=himemmin)then begin if chain then
begin breakwidth[1]:=breakwidth[1]-mem[curkanjiskip+1].int;
breakwidth[2+mem[curkanjiskip].hh.b0]:=breakwidth[2+mem[curkanjiskip].hh
.b0]-mem[curkanjiskip+2].int;
breakwidth[7]:=breakwidth[7]-mem[curkanjiskip+3].int;end;goto 30 end;
case mem[s].hh.b0 of 12:{879:}begin v:=mem[s+1].hh.lh;
breakwidth[1]:=breakwidth[1]-mem[v+1].int;
breakwidth[2+mem[v].hh.b0]:=breakwidth[2+mem[v].hh.b0]-mem[v+2].int;
breakwidth[7]:=breakwidth[7]-mem[v+3].int;end{:879};14:;
11:breakwidth[1]:=breakwidth[1]-mem[s+1].int;
13:if(mem[s].hh.b1<>1)and(mem[s].hh.b1<>3)then goto 30 else breakwidth[1
]:=breakwidth[1]-mem[s+1].int;others:goto 30 end;s:=mem[s].hh.rh;end;
30:end{:878};
{884:}if mem[prevr].hh.b0=2 then begin mem[prevr+1].int:=mem[prevr+1].
int-curactivewidth[1]+breakwidth[1];
mem[prevr+2].int:=mem[prevr+2].int-curactivewidth[2]+breakwidth[2];
mem[prevr+3].int:=mem[prevr+3].int-curactivewidth[3]+breakwidth[3];
mem[prevr+4].int:=mem[prevr+4].int-curactivewidth[4]+breakwidth[4];
mem[prevr+5].int:=mem[prevr+5].int-curactivewidth[5]+breakwidth[5];
mem[prevr+6].int:=mem[prevr+6].int-curactivewidth[6]+breakwidth[6];
mem[prevr+7].int:=mem[prevr+7].int-curactivewidth[7]+breakwidth[7];
end else if prevr=memtop-7 then begin activewidth[1]:=breakwidth[1];
activewidth[2]:=breakwidth[2];activewidth[3]:=breakwidth[3];
activewidth[4]:=breakwidth[4];activewidth[5]:=breakwidth[5];
activewidth[6]:=breakwidth[6];activewidth[7]:=breakwidth[7];
end else begin q:=getnode(8);mem[q].hh.rh:=r;mem[q].hh.b0:=2;
mem[q].hh.b1:=0;mem[q+1].int:=breakwidth[1]-curactivewidth[1];
mem[q+2].int:=breakwidth[2]-curactivewidth[2];
mem[q+3].int:=breakwidth[3]-curactivewidth[3];
mem[q+4].int:=breakwidth[4]-curactivewidth[4];
mem[q+5].int:=breakwidth[5]-curactivewidth[5];
mem[q+6].int:=breakwidth[6]-curactivewidth[6];
mem[q+7].int:=breakwidth[7]-curactivewidth[7];mem[prevr].hh.rh:=q;
prevprevr:=prevr;prevr:=q;end{:884};
if abs(eqtb[114377].int)>=1073741823-minimumdemerits then
minimumdemerits:=1073741822 else minimumdemerits:=minimumdemerits+abs(
eqtb[114377].int);
for fitclass:=0 to 3 do begin if minimaldemerits[fitclass]<=
minimumdemerits then{886:}begin q:=getnode(2);mem[q].hh.rh:=passive;
passive:=q;mem[q+1].hh.rh:=curp;ifdef('STAT')incr(passnumber);
mem[q].hh.lh:=passnumber;
endif('STAT')mem[q+1].hh.lh:=bestplace[fitclass];
q:=getnode(activenodesize);mem[q+1].hh.rh:=passive;
mem[q+1].hh.lh:=bestplline[fitclass]+1;mem[q].hh.b1:=fitclass;
mem[q].hh.b0:=breaktype;mem[q+2].int:=minimaldemerits[fitclass];
if dolastlinefit then{1632:}begin mem[q+3].int:=bestplshort[fitclass];
mem[q+4].int:=bestplglue[fitclass];end{:1632};mem[q].hh.rh:=r;
mem[prevr].hh.rh:=q;prevr:=q;
ifdef('STAT')if eqtb[114393].int>0 then{887:}begin printnl(1094);
printint(mem[passive].hh.lh);print(1095);printint(mem[q+1].hh.lh-1);
printchar(46);printint(fitclass);if breaktype=1 then printchar(45);
print(1096);printint(mem[q+2].int);
if dolastlinefit then{1633:}begin print(1647);printscaled(mem[q+3].int);
if curp=-1073741823 then print(1648)else print(1167);
printscaled(mem[q+4].int);end{:1633};print(1097);
if mem[passive+1].hh.lh=-1073741823 then printchar(48)else printint(mem[
mem[passive+1].hh.lh].hh.lh);end{:887};endif('STAT')end{:886};
minimaldemerits[fitclass]:=1073741823;end;minimumdemerits:=1073741823;
{885:}if r<>memtop-7 then begin q:=getnode(8);mem[q].hh.rh:=r;
mem[q].hh.b0:=2;mem[q].hh.b1:=0;
mem[q+1].int:=curactivewidth[1]-breakwidth[1];
mem[q+2].int:=curactivewidth[2]-breakwidth[2];
mem[q+3].int:=curactivewidth[3]-breakwidth[3];
mem[q+4].int:=curactivewidth[4]-breakwidth[4];
mem[q+5].int:=curactivewidth[5]-breakwidth[5];
mem[q+6].int:=curactivewidth[6]-breakwidth[6];
mem[q+7].int:=curactivewidth[7]-breakwidth[7];mem[prevr].hh.rh:=q;
prevprevr:=prevr;prevr:=q;end{:885};end{:877};
if r=memtop-7 then goto 10;
{891:}if l>easyline then begin linewidth:=secondwidth;oldl:=1073741822;
end else begin oldl:=l;
if l>lastspecialline then linewidth:=secondwidth else if eqtb[50458].hh.
rh=-1073741823 then linewidth:=firstwidth else linewidth:=mem[eqtb[50458
].hh.rh+2*l].int;end{:891};end;end{:876};
{892:}begin artificialdemerits:=false;
shortfall:=linewidth-curactivewidth[1];
if shortfall>0 then{893:}if(curactivewidth[3]<>0)or(curactivewidth[4]<>0
)or(curactivewidth[5]<>0)or(curactivewidth[6]<>0)then begin if
dolastlinefit then begin if curp=-1073741823 then{1627:}begin if(mem[r+3
].int=0)or(mem[r+4].int<=0)then goto 45;
if(curactivewidth[3]<>fillwidth[0])or(curactivewidth[4]<>fillwidth[1])or
(curactivewidth[5]<>fillwidth[2])or(curactivewidth[6]<>fillwidth[3])then
goto 45;
if mem[r+3].int>0 then g:=curactivewidth[2]else g:=curactivewidth[7];
if g<=0 then goto 45;aritherror:=false;
g:=fract(g,mem[r+3].int,mem[r+4].int,1073741823);
if eqtb[114436].int<1000 then g:=fract(g,eqtb[114436].int,1000,
1073741823);
if aritherror then if mem[r+3].int>0 then g:=1073741823 else g:=
-1073741823;if g>0 then{1628:}begin if g>shortfall then g:=shortfall;
if g>7230584 then if curactivewidth[2]<1663497 then begin b:=10000;
fitclass:=0;goto 40;end;b:=badness(g,curactivewidth[2]);
if b>12 then if b>99 then fitclass:=0 else fitclass:=1 else fitclass:=2;
goto 40;
end{:1628}else if g<0 then{1629:}begin if-g>curactivewidth[7]then g:=-
curactivewidth[7];b:=badness(-g,curactivewidth[7]);
if b>12 then fitclass:=3 else fitclass:=2;goto 40;end{:1629};
45:end{:1627};shortfall:=0;end;b:=0;fitclass:=2;
end else begin if shortfall>7230584 then if curactivewidth[2]<1663497
then begin b:=10000;fitclass:=0;goto 31;end;
b:=badness(shortfall,curactivewidth[2]);
if b>12 then if b>99 then fitclass:=0 else fitclass:=1 else fitclass:=2;
31:end{:893}else{894:}begin if-shortfall>curactivewidth[7]then b:=10001
else b:=badness(-shortfall,curactivewidth[7]);
if b>12 then fitclass:=3 else fitclass:=2;end{:894};
if dolastlinefit then{1630:}begin if curp=-1073741823 then shortfall:=0;
if shortfall>0 then g:=curactivewidth[2]else if shortfall<0 then g:=
curactivewidth[7]else g:=0;end{:1630};
40:if(b>10000)or(pi=-10000)then{895:}begin if finalpass and(
minimumdemerits=1073741823)and(mem[r].hh.rh=memtop-7)and(prevr=memtop-7)
then artificialdemerits:=true else if b>threshold then goto 60;
noderstaysactive:=false;end{:895}else begin prevr:=r;
if b>threshold then goto 22;noderstaysactive:=true;end;
{896:}if artificialdemerits then d:=0 else{900:}begin d:=eqtb[114363].
int+b;if abs(d)>=10000 then d:=100000000 else d:=d*d;
if pi<>0 then if pi>0 then d:=d+pi*pi else if pi>-10000 then d:=d-pi*pi;
if(breaktype=1)and(mem[r].hh.b0=1)then if curp<>-1073741823 then d:=d+
eqtb[114375].int else d:=d+eqtb[114376].int;
if abs(fitclass-mem[r].hh.b1)>1 then d:=d+eqtb[114377].int;end{:900};
ifdef('STAT')if eqtb[114393].int>0 then{897:}begin if printednode<>curp
then{898:}begin printnl(349);
if curp=-1073741823 then shortdisplay(mem[printednode].hh.rh)else begin
savelink:=mem[curp].hh.rh;mem[curp].hh.rh:=-1073741823;printnl(349);
shortdisplay(mem[printednode].hh.rh);mem[curp].hh.rh:=savelink;end;
printednode:=curp;end{:898};printnl(64);
if curp=-1073741823 then printesc(688)else if(mem[curp].hh.b0<>12)and(
not(curp>=himemmin))then begin if mem[curp].hh.b0=14 then printesc(602)
else if mem[curp].hh.b0=9 then printesc(364)else if mem[curp].hh.b0=13
then printesc(351)else printesc(356);end;print(1098);
if mem[r+1].hh.rh=-1073741823 then printchar(48)else printint(mem[mem[r
+1].hh.rh].hh.lh);print(1099);
if b>10000 then printchar(42)else printint(b);print(1100);printint(pi);
print(1101);if artificialdemerits then printchar(42)else printint(d);
end{:897};endif('STAT')d:=d+mem[r+2].int;
if d<=minimaldemerits[fitclass]then begin minimaldemerits[fitclass]:=d;
bestplace[fitclass]:=mem[r+1].hh.rh;bestplline[fitclass]:=l;
if dolastlinefit then{1631:}begin bestplshort[fitclass]:=shortfall;
bestplglue[fitclass]:=g;end{:1631};
if d<minimumdemerits then minimumdemerits:=d;end{:896};
if noderstaysactive then goto 22;
60:{901:}mem[prevr].hh.rh:=mem[r].hh.rh;freenode(r,activenodesize);
if prevr=memtop-7 then{902:}begin r:=mem[memtop-7].hh.rh;
if mem[r].hh.b0=2 then begin activewidth[1]:=activewidth[1]+mem[r+1].int
;activewidth[2]:=activewidth[2]+mem[r+2].int;
activewidth[3]:=activewidth[3]+mem[r+3].int;
activewidth[4]:=activewidth[4]+mem[r+4].int;
activewidth[5]:=activewidth[5]+mem[r+5].int;
activewidth[6]:=activewidth[6]+mem[r+6].int;
activewidth[7]:=activewidth[7]+mem[r+7].int;
curactivewidth[1]:=activewidth[1];curactivewidth[2]:=activewidth[2];
curactivewidth[3]:=activewidth[3];curactivewidth[4]:=activewidth[4];
curactivewidth[5]:=activewidth[5];curactivewidth[6]:=activewidth[6];
curactivewidth[7]:=activewidth[7];mem[memtop-7].hh.rh:=mem[r].hh.rh;
freenode(r,8);end;
end{:902}else if mem[prevr].hh.b0=2 then begin r:=mem[prevr].hh.rh;
if r=memtop-7 then begin curactivewidth[1]:=curactivewidth[1]-mem[prevr
+1].int;curactivewidth[2]:=curactivewidth[2]-mem[prevr+2].int;
curactivewidth[3]:=curactivewidth[3]-mem[prevr+3].int;
curactivewidth[4]:=curactivewidth[4]-mem[prevr+4].int;
curactivewidth[5]:=curactivewidth[5]-mem[prevr+5].int;
curactivewidth[6]:=curactivewidth[6]-mem[prevr+6].int;
curactivewidth[7]:=curactivewidth[7]-mem[prevr+7].int;
mem[prevprevr].hh.rh:=memtop-7;freenode(prevr,8);prevr:=prevprevr;
end else if mem[r].hh.b0=2 then begin curactivewidth[1]:=curactivewidth[
1]+mem[r+1].int;curactivewidth[2]:=curactivewidth[2]+mem[r+2].int;
curactivewidth[3]:=curactivewidth[3]+mem[r+3].int;
curactivewidth[4]:=curactivewidth[4]+mem[r+4].int;
curactivewidth[5]:=curactivewidth[5]+mem[r+5].int;
curactivewidth[6]:=curactivewidth[6]+mem[r+6].int;
curactivewidth[7]:=curactivewidth[7]+mem[r+7].int;
mem[prevr+1].int:=mem[prevr+1].int+mem[r+1].int;
mem[prevr+2].int:=mem[prevr+2].int+mem[r+2].int;
mem[prevr+3].int:=mem[prevr+3].int+mem[r+3].int;
mem[prevr+4].int:=mem[prevr+4].int+mem[r+4].int;
mem[prevr+5].int:=mem[prevr+5].int+mem[r+5].int;
mem[prevr+6].int:=mem[prevr+6].int+mem[r+6].int;
mem[prevr+7].int:=mem[prevr+7].int+mem[r+7].int;
mem[prevr].hh.rh:=mem[r].hh.rh;freenode(r,8);end;end{:901};end{:892};
end;
10:ifdef('STAT'){899:}if curp=printednode then if curp<>-1073741823 then
if mem[curp].hh.b0=9 then begin t:=mem[curp].hh.b1;
while t>0 do begin decr(t);printednode:=mem[printednode].hh.rh;end;
end{:899}endif('STAT')end;
{:870}{918:}procedure postlinebreak(d:boolean);label 30,31;
var q,r,s:halfword;discbreak:boolean;postdiscbreak:boolean;
curwidth:scaled;curindent:scaled;t:quarterword;pen:integer;
curline:halfword;LRptr:halfword;begin LRptr:=curlist.eTeXauxfield;
{919:}q:=mem[bestbet+1].hh.rh;curp:=-1073741823;repeat r:=q;
q:=mem[q+1].hh.lh;mem[r+1].hh.lh:=curp;curp:=r;
until q=-1073741823{:919};curline:=curlist.pgfield+1;lastdisp:=0;
repeat{921:}if(eqtb[114444].int>0)then{1484:}begin q:=mem[memtop-3].hh.
rh;if LRptr<>-1073741823 then begin tempptr:=LRptr;r:=q;
repeat s:=newmath(0,(mem[tempptr].hh.lh-1));mem[s].hh.rh:=r;r:=s;
tempptr:=mem[tempptr].hh.rh;until tempptr=-1073741823;
mem[memtop-3].hh.rh:=r;end;
while q<>mem[curp+1].hh.rh do begin if not(q>=himemmin)then if mem[q].hh
.b0=11 then{1485:}if odd(mem[q].hh.b1)then begin if LRptr<>-1073741823
then if mem[LRptr].hh.lh=(4*(mem[q].hh.b1 div 4)+3)then begin tempptr:=
LRptr;LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1485};q:=mem[q].hh.rh;end;
end{:1484};{922:}q:=mem[curp+1].hh.rh;discbreak:=false;
postdiscbreak:=false;
if q<>-1073741823 then begin if not(q>=himemmin)then if mem[q].hh.b0=12
then begin deleteglueref(mem[q+1].hh.lh);
mem[q+1].hh.lh:=eqtb[49933].hh.rh;mem[q].hh.b1:=9;
incr(mem[eqtb[49933].hh.rh].hh.rh);goto 30;
end else begin if mem[q].hh.b0=9 then{923:}begin t:=mem[q].hh.b1;
{924:}if t=0 then r:=mem[q].hh.rh else begin r:=q;
while t>1 do begin r:=mem[r].hh.rh;decr(t);end;s:=mem[r].hh.rh;
r:=mem[s].hh.rh;mem[s].hh.rh:=-1073741823;flushnodelist(mem[q].hh.rh);
mem[q].hh.b1:=0;end{:924};
if mem[q+1].hh.rh<>-1073741823 then{925:}begin s:=mem[q+1].hh.rh;
while mem[s].hh.rh<>-1073741823 do s:=mem[s].hh.rh;mem[s].hh.rh:=r;
r:=mem[q+1].hh.rh;mem[q+1].hh.rh:=-1073741823;postdiscbreak:=true;
end{:925};
if mem[q+1].hh.lh<>-1073741823 then{926:}begin s:=mem[q+1].hh.lh;
mem[q].hh.rh:=s;while mem[s].hh.rh<>-1073741823 do s:=mem[s].hh.rh;
mem[q+1].hh.lh:=-1073741823;q:=s;end{:926};mem[q].hh.rh:=r;
discbreak:=true;
end{:923}else if mem[q].hh.b0=13 then mem[q+1].int:=0 else if mem[q].hh.
b0=11 then begin mem[q+1].int:=0;
if(eqtb[114444].int>0)then{1485:}if odd(mem[q].hh.b1)then begin if LRptr
<>-1073741823 then if mem[LRptr].hh.lh=(4*(mem[q].hh.b1 div 4)+3)then
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1485};end;
end end else begin q:=memtop-3;
while mem[q].hh.rh<>-1073741823 do q:=mem[q].hh.rh;end;
{927:}r:=newparamglue(8);mem[r].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=r;
q:=r{:927};30:{:922};
if(eqtb[114444].int>0)then{1486:}if LRptr<>-1073741823 then begin s:=
memtop-3;r:=mem[s].hh.rh;while r<>q do begin s:=r;r:=mem[s].hh.rh;end;
r:=LRptr;while r<>-1073741823 do begin tempptr:=newmath(0,mem[r].hh.lh);
mem[s].hh.rh:=tempptr;s:=tempptr;r:=mem[r].hh.rh;end;mem[s].hh.rh:=q;
end{:1486};{928:}r:=mem[q].hh.rh;mem[q].hh.rh:=-1073741823;
q:=mem[memtop-3].hh.rh;mem[memtop-3].hh.rh:=r;
if lastdisp<>0 then begin r:=getnode(2);mem[r].hh.b0:=5;
mem[r+1].int:=lastdisp;mem[r].hh.rh:=q;q:=r;
curlist.dispcalledfield:=true;end;
if eqtb[49932].hh.rh<>membot then begin r:=newparamglue(7);
mem[r].hh.rh:=q;q:=r;end{:928};
{930:}if curline>lastspecialline then begin curwidth:=secondwidth;
curindent:=secondindent;
end else if eqtb[50458].hh.rh=-1073741823 then begin curwidth:=
firstwidth;curindent:=firstindent;
end else begin curwidth:=mem[eqtb[50458].hh.rh+2*curline].int;
curindent:=mem[eqtb[50458].hh.rh+2*curline-1].int;end;
adjusttail:=memtop-5;preadjusttail:=memtop-14;
justbox:=hpack(q,curwidth,0);mem[justbox+4].int:=curindent{:930};
{929:}if memtop-14<>preadjusttail then begin mem[curlist.tailfield].hh.
rh:=mem[memtop-14].hh.rh;curlist.tailfield:=preadjusttail;end;
preadjusttail:=-1073741823;appendtovlist(justbox);
if memtop-5<>adjusttail then begin mem[curlist.tailfield].hh.rh:=mem[
memtop-5].hh.rh;curlist.tailfield:=adjusttail;end;
adjusttail:=-1073741823{:929};
{931:}if curline+1<>bestline then begin q:=eqtb[50725].hh.rh;
if q<>-1073741823 then begin r:=curline;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=mem[q+r+1].int;
end else pen:=eqtb[114374].int;q:=eqtb[50726].hh.rh;
if q<>-1073741823 then begin r:=curline-curlist.pgfield;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=pen+mem[q+r+1].int;
end else if curline=curlist.pgfield+1 then pen:=pen+eqtb[114366].int;
if d then q:=eqtb[50728].hh.rh else q:=eqtb[50727].hh.rh;
if q<>-1073741823 then begin r:=bestline-curline-1;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=pen+mem[q+r+1].int;
end else if curline+2=bestline then if d then pen:=pen+eqtb[114368].int
else pen:=pen+eqtb[114367].int;
if discbreak then pen:=pen+eqtb[114369].int;
if pen<>0 then begin r:=newpenalty(pen);mem[curlist.tailfield].hh.rh:=r;
curlist.tailfield:=r;end;end{:931}{:921};incr(curline);
curp:=mem[curp+1].hh.lh;
if curp<>-1073741823 then if not postdiscbreak then{920:}begin r:=memtop
-3;while true do begin q:=mem[r].hh.rh;
if q=mem[curp+1].hh.rh then goto 31;if(q>=himemmin)then goto 31;
if(mem[q].hh.b0<11)then goto 31;
if mem[q].hh.b0=13 then if(mem[q].hh.b1<>1)and(mem[q].hh.b1<>3)then goto
31;r:=q;
if mem[q].hh.b0=11 then if(eqtb[114444].int>0)then{1485:}if odd(mem[q].
hh.b1)then begin if LRptr<>-1073741823 then if mem[LRptr].hh.lh=(4*(mem[
q].hh.b1 div 4)+3)then begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1485};end;
31:if r<>memtop-3 then begin mem[r].hh.rh:=-1073741823;
flushnodelist(mem[memtop-3].hh.rh);mem[memtop-3].hh.rh:=q;end;end{:920};
until curp=-1073741823;
if(curline<>bestline)or(mem[memtop-3].hh.rh<>-1073741823)then confusion(
1108);curlist.pgfield:=bestline-1;curlist.eTeXauxfield:=LRptr;end;
{:918}{937:}{948:}function reconstitute(j,n:smallnumber;
bchar,hchar:halfword):smallnumber;label 22,30;var p:halfword;t:halfword;
q:fourquarters;currh:halfword;testchar:halfword;w:scaled;k:fontindex;
begin hyphenpassed:=0;t:=memtop-4;w:=0;mem[memtop-4].hh.rh:=-1073741823;
{950:}curl:=hu[j];curq:=t;if j=0 then begin ligaturepresent:=initlig;
p:=initlist;if ligaturepresent then lfthit:=initlft;
while p>-1073741823 do begin begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=mem[p].hh.b1;end;
p:=mem[p].hh.rh;end;
end else if curl<11904 then begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=curl;end;
ligstack:=-1073741823;begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=11904;end{:950};
22:{951:}if curl=11904 then begin k:=bcharlabel[hf];
if k=0 then goto 30 else q:=fontinfo[k].qqqq;
end else begin q:=fontinfo[charbase[hf]+effectivechar(true,hf,
ptencucsto8bitcode(fontenc[hf],curl))].qqqq;
if((q.b2)mod 4)<>1 then goto 30;k:=ligkernbase[hf]+q.b3;
q:=fontinfo[k].qqqq;
if q.b0>128 then begin k:=ligkernbase[hf]+256*q.b2+q.b3+32768-256*(128);
q:=fontinfo[k].qqqq;end;end;
if currh<11904 then testchar:=currh else testchar:=curr;
while true do begin if q.b1=testchar then if q.b0<=128 then if currh<
11904 then begin hyphenpassed:=j;hchar:=11904;currh:=11904;goto 22;
end else begin if hchar<11904 then if odd(hyf[j])then begin hyphenpassed
:=j;hchar:=11904;end;
if q.b2<128 then{953:}begin if curl=11904 then lfthit:=true;
if j=n then if ligstack=-1073741823 then rthit:=true;
begin if interrupt<>0 then pauseforinstructions;end;
case q.b2 of 1,5:begin curl:=q.b3;ligaturepresent:=true;end;
2,6:begin curr:=q.b3;
if ligstack>-1073741823 then mem[ligstack].hh.b1:=curr else begin
ligstack:=newligitem(curr);
if j=n then bchar:=11904 else begin p:=getavail;
mem[ligstack+1].hh.rh:=p;mem[p].hh.b1:=hu[j+1];mem[p].hh.b0:=hf;end;end;
end;3:begin curr:=q.b3;p:=ligstack;ligstack:=newligitem(curr);
mem[ligstack].hh.rh:=p;end;
7,11:begin if ligaturepresent then begin p:=newligature(hf,curl,mem[curq
].hh.rh);if lfthit then begin mem[p].hh.b1:=2;lfthit:=false;end;
if false then if ligstack=-1073741823 then begin incr(mem[p].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=p;t:=p;ligaturepresent:=false;end;
curq:=t;curl:=q.b3;ligaturepresent:=true;end;others:begin curl:=q.b3;
ligaturepresent:=true;
if ligstack>-1073741823 then begin if mem[ligstack+1].hh.rh>-1073741823
then begin mem[t].hh.rh:=mem[ligstack+1].hh.rh;t:=mem[t].hh.rh;incr(j);
end;p:=ligstack;ligstack:=mem[p].hh.rh;freenode(p,2);
if ligstack=-1073741823 then begin if j<n then curr:=hu[j+1]else curr:=
bchar;if odd(hyf[j])then currh:=hchar else currh:=11904;
end else curr:=mem[ligstack].hh.b1;
end else if j=n then goto 30 else begin begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=curr;end;incr(j);
begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=11904;end;end;end end;
if q.b2>4 then if q.b2<>7 then goto 30;goto 22;end{:953};
w:=fontinfo[kernbase[hf]+256*q.b2+q.b3].int;goto 30;end;
if q.b0>=128 then if currh=11904 then goto 30 else begin currh:=11904;
goto 22;end;k:=k+q.b0+1;q:=fontinfo[k].qqqq;end;30:{:951};
{952:}if ligaturepresent then begin p:=newligature(hf,curl,mem[curq].hh.
rh);if lfthit then begin mem[p].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[p].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=p;t:=p;ligaturepresent:=false;end;
if w<>0 then begin mem[t].hh.rh:=newkern(w);t:=mem[t].hh.rh;w:=0;
mem[t+2].int:=0;end;if ligstack>-1073741823 then begin curq:=t;
curl:=mem[ligstack].hh.b1;ligaturepresent:=true;
begin if mem[ligstack+1].hh.rh>-1073741823 then begin mem[t].hh.rh:=mem[
ligstack+1].hh.rh;t:=mem[t].hh.rh;incr(j);end;p:=ligstack;
ligstack:=mem[p].hh.rh;freenode(p,2);
if ligstack=-1073741823 then begin if j<n then curr:=hu[j+1]else curr:=
bchar;if odd(hyf[j])then currh:=hchar else currh:=11904;
end else curr:=mem[ligstack].hh.b1;end;goto 22;end{:952};
reconstitute:=j;end;{:948}procedure hyphenate;
label 50,30,40,41,42,45,10;var{943:}i,j,l:0..65;q,r,s:halfword;
bchar:halfword;{:943}{954:}majortail,minortail:halfword;c:sixteenbits;
cloc:0..63;rcount:integer;hyfnode:halfword;{:954}{964:}z:triepointer;
v:integer;{:964}{971:}h:hyphpointer;k:strnumber;u:poolpointer;
{:971}begin{965:}for j:=0 to hn do hyf[j]:=0;{972:}h:=hc[1];incr(hn);
hc[hn]:=curlang;for j:=2 to hn do h:=(h+h+hc[j])mod 607;
while true do begin{973:}k:=hyphword[h];if k=0 then goto 45;
if(strstart[k+1]-strstart[k])=hn then begin j:=1;u:=strstart[k];
repeat if strpool[u]<>hc[j]then goto 30;incr(j);incr(u);until j>hn;
{974:}s:=hyphlist[h];while s<>-1073741823 do begin hyf[mem[s].hh.lh]:=1;
s:=mem[s].hh.rh;end{:974};decr(hn);goto 40;end;30:{:973};h:=hyphlink[h];
if h=0 then goto 45;decr(h);end;45:decr(hn){:972};
if trietrc[curlang+1]<>curlang then goto 10;hc[0]:=0;hc[hn+1]:=0;
hc[hn+2]:=11904;
for j:=0 to hn-rhyf+1 do begin z:=trietrl[curlang+1]+hc[j];l:=j;
while hc[l]=trietrc[z]do begin if trietro[z]<>mintrieop then{966:}begin
v:=trietro[z];repeat v:=v+opstart[curlang];i:=l-hyfdistance[v];
if hyfnum[v]>hyf[i]then hyf[i]:=hyfnum[v];v:=hyfnext[v];
until v=mintrieop;end{:966};incr(l);z:=trietrl[z]+hc[l];end;end;
40:for j:=0 to lhyf-1 do hyf[j]:=0;
for j:=0 to rhyf-1 do hyf[hn-j]:=0{:965};
{944:}for j:=lhyf to hn-rhyf do if odd(hyf[j])then goto 41;goto 10;
41:{:944};{945:}q:=mem[hb].hh.rh;mem[hb].hh.rh:=-1073741823;
r:=mem[ha].hh.rh;mem[ha].hh.rh:=-1073741823;bchar:=hyfbchar;
if(ha>=himemmin)then if mem[ha].hh.b0<>hf then goto 42 else begin
initlist:=ha;initlig:=false;hu[0]:=mem[ha].hh.b1;
end else if mem[ha].hh.b0=8 then if mem[ha+1].hh.b0<>hf then goto 42
else begin initlist:=mem[ha+1].hh.rh;initlig:=true;
initlft:=(mem[ha].hh.b1>1);hu[0]:=mem[ha+1].hh.b1;
if initlist=-1073741823 then if initlft then begin hu[0]:=11904;
initlig:=false;end;freenode(ha,2);
end else begin if not(r>=himemmin)then if mem[r].hh.b0=8 then if mem[r].
hh.b1>1 then goto 42;j:=1;s:=ha;initlist:=-1073741823;goto 50;end;
s:=curp;while mem[s].hh.rh<>ha do s:=mem[s].hh.rh;j:=0;goto 50;42:s:=ha;
j:=0;hu[0]:=11904;initlig:=false;initlist:=-1073741823;
50:flushnodelist(r);{955:}repeat l:=j;
j:=reconstitute(j,hn,bchar,hyfchar)+1;
if hyphenpassed=0 then begin mem[s].hh.rh:=mem[memtop-4].hh.rh;
while mem[s].hh.rh>-1073741823 do s:=mem[s].hh.rh;
if odd(hyf[j-1])then begin l:=j;hyphenpassed:=j-1;
mem[memtop-4].hh.rh:=-1073741823;end;end;
if hyphenpassed>0 then{956:}repeat r:=getnode(2);
mem[r].hh.rh:=mem[memtop-4].hh.rh;mem[r].hh.b0:=9;majortail:=r;
rcount:=0;
while mem[majortail].hh.rh>-1073741823 do begin majortail:=mem[majortail
].hh.rh;incr(rcount);end;i:=hyphenpassed;hyf[i]:=0;
{957:}minortail:=-1073741823;mem[r+1].hh.lh:=-1073741823;
hyfnode:=newcharacter(hf,hyfchar);
if hyfnode<>-1073741823 then begin incr(i);c:=hu[i];hu[i]:=hyfchar;
begin mem[hyfnode].hh.rh:=avail;avail:=hyfnode;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
while l<=i do begin l:=reconstitute(l,i,fontbchar[hf],11904)+1;
if mem[memtop-4].hh.rh>-1073741823 then begin if minortail=-1073741823
then mem[r+1].hh.lh:=mem[memtop-4].hh.rh else mem[minortail].hh.rh:=mem[
memtop-4].hh.rh;minortail:=mem[memtop-4].hh.rh;
while mem[minortail].hh.rh>-1073741823 do minortail:=mem[minortail].hh.
rh;end;end;if hyfnode<>-1073741823 then begin hu[i]:=c;l:=i;decr(i);
end{:957};{958:}minortail:=-1073741823;mem[r+1].hh.rh:=-1073741823;
cloc:=0;if bcharlabel[hf]<>0 then begin decr(l);c:=hu[l];cloc:=l;
hu[l]:=11904;end;
while l<j do begin repeat l:=reconstitute(l,hn,bchar,11904)+1;
if cloc>0 then begin hu[cloc]:=c;cloc:=0;end;
if mem[memtop-4].hh.rh>-1073741823 then begin if minortail=-1073741823
then mem[r+1].hh.rh:=mem[memtop-4].hh.rh else mem[minortail].hh.rh:=mem[
memtop-4].hh.rh;minortail:=mem[memtop-4].hh.rh;
while mem[minortail].hh.rh>-1073741823 do minortail:=mem[minortail].hh.
rh;end;until l>=j;
while l>j do{959:}begin j:=reconstitute(j,hn,bchar,11904)+1;
mem[majortail].hh.rh:=mem[memtop-4].hh.rh;
while mem[majortail].hh.rh>-1073741823 do begin majortail:=mem[majortail
].hh.rh;incr(rcount);end;end{:959};end{:958};
{960:}if rcount>127 then begin mem[s].hh.rh:=mem[r].hh.rh;
mem[r].hh.rh:=-1073741823;flushnodelist(r);
end else begin mem[s].hh.rh:=r;mem[r].hh.b1:=rcount;end;
s:=majortail{:960};hyphenpassed:=j-1;mem[memtop-4].hh.rh:=-1073741823;
until not odd(hyf[j-1]){:956};until j>hn;mem[s].hh.rh:=q{:955};
flushlist(initlist){:945};10:end;
{:937}{984:}ifdef('INITEX'){986:}function newtrieop(d,n:smallnumber;
v:trieopcode):trieopcode;label 10;var h:negtrieopsize..trieopsize;
u:trieopcode;l:0..trieopsize;
begin h:=abs(n+313*d+361*v+1009*curlang)mod(trieopsize-negtrieopsize)+
negtrieopsize;while true do begin l:=trieophash[h];
if l=0 then begin if trieopptr=trieopsize then overflow(1118,trieopsize)
;u:=trieused[curlang];
if u=maxtrieop then overflow(1119,maxtrieop-mintrieop);incr(trieopptr);
incr(u);trieused[curlang]:=u;if u>maxopused then maxopused:=u;
hyfdistance[trieopptr]:=d;hyfnum[trieopptr]:=n;hyfnext[trieopptr]:=v;
trieoplang[trieopptr]:=curlang;trieophash[h]:=trieopptr;
trieopval[trieopptr]:=u;newtrieop:=u;goto 10;end;
if(hyfdistance[l]=d)and(hyfnum[l]=n)and(hyfnext[l]=v)and(trieoplang[l]=
curlang)then begin newtrieop:=trieopval[l];goto 10;end;
if h>-trieopsize then decr(h)else h:=trieopsize;end;10:end;
{:986}{990:}function trienode(p:triepointer):triepointer;label 10;
var h:triepointer;q:triepointer;
begin h:=abs(triec[p]+1009*trieo[p]+2718*triel[p]+3142*trier[p])mod
triesize;while true do begin q:=triehash[h];
if q=0 then begin triehash[h]:=p;trienode:=p;goto 10;end;
if(triec[q]=triec[p])and(trieo[q]=trieo[p])and(triel[q]=triel[p])and(
trier[q]=trier[p])then begin trienode:=q;goto 10;end;
if h>0 then decr(h)else h:=triesize;end;10:end;
{:990}{991:}function compresstrie(p:triepointer):triepointer;
begin if p=0 then compresstrie:=0 else begin triel[p]:=compresstrie(
triel[p]);trier[p]:=compresstrie(trier[p]);compresstrie:=trienode(p);
end;end;{:991}{995:}procedure firstfit(p:triepointer);label 45,40;
var h:triepointer;z:triepointer;q:triepointer;c:ASCIIcode;
l,r:triepointer;ll:1..11904;begin c:=triec[p];z:=triemin[c];
while true do begin h:=z-c;
{996:}if triemax<h+maxhyphchar then begin if triesize<=h+maxhyphchar
then overflow(1120,triesize);repeat incr(triemax);
trietaken[triemax]:=false;trietrl[triemax]:=triemax+1;
trietro[triemax]:=triemax-1;until triemax=h+maxhyphchar;end{:996};
if trietaken[h]then goto 45;{997:}q:=trier[p];
while q>0 do begin if trietrl[h+triec[q]]=0 then goto 45;q:=trier[q];
end;goto 40{:997};45:z:=trietrl[z];end;40:{998:}trietaken[h]:=true;
triehash[p]:=h;q:=p;repeat z:=h+triec[q];l:=trietro[z];r:=trietrl[z];
trietro[r]:=l;trietrl[l]:=r;trietrl[z]:=0;
if l<maxhyphchar then begin if z<maxhyphchar then ll:=z else ll:=
maxhyphchar;repeat triemin[l]:=r;incr(l);until l=ll;end;q:=trier[q];
until q=0{:998};end;{:995}{999:}procedure triepack(p:triepointer);
var q:triepointer;begin repeat q:=triel[p];
if(q>0)and(triehash[q]=0)then begin firstfit(q);triepack(q);end;
p:=trier[p];until p=0;end;{:999}{1001:}procedure triefix(p:triepointer);
var q:triepointer;c:ASCIIcode;z:triepointer;begin z:=triehash[p];
repeat q:=triel[p];c:=triec[p];trietrl[z+c]:=triehash[q];
trietrc[z+c]:=c;trietro[z+c]:=trieo[p];if q>0 then triefix(q);
p:=trier[p];until p=0;end;{:1001}{1002:}procedure newpatterns;
label 30,31;var k,l:0..64;digitsensed:boolean;v:trieopcode;
p,q:triepointer;firstchild:boolean;c:ASCIIcode;
begin if trienotready then begin if eqtb[114412].int<=0 then curlang:=0
else if eqtb[114412].int>255 then curlang:=0 else curlang:=eqtb[114412].
int;scanleftbrace;{1003:}k:=0;hyf[0]:=0;digitsensed:=false;
while true do begin getxtoken;
case curcmd of 11,12:{1004:}if digitsensed or(curchr<48)or(curchr>57)
then begin if curchr=46 then curchr:=0 else begin curchr:=eqtb[78137+
curchr].hh.rh;if curchr=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1126);
end;begin helpptr:=1;helpline[0]:=1125;end;error;end;end;
if curchr>maxhyphchar then maxhyphchar:=curchr;
if k<63 then begin incr(k);hc[k]:=curchr;hyf[k]:=0;digitsensed:=false;
end;end else if k<63 then begin hyf[k]:=curchr-48;digitsensed:=true;
end{:1004};
10,2:begin if k>0 then{1005:}begin{1007:}if hc[1]=0 then hyf[0]:=0;
if hc[k]=0 then hyf[k]:=0;l:=k;v:=mintrieop;
while true do begin if hyf[l]<>0 then v:=newtrieop(k-l,hyf[l],v);
if l>0 then decr(l)else goto 31;end;31:{:1007};q:=0;hc[0]:=curlang;
while l<=k do begin c:=hc[l];incr(l);p:=triel[q];firstchild:=true;
while(p>0)and(c>triec[p])do begin q:=p;p:=trier[q];firstchild:=false;
end;
if(p=0)or(c<triec[p])then{1006:}begin if trieptr=triesize then overflow(
1120,triesize);incr(trieptr);trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1006};q:=p;end;
if trieo[q]<>mintrieop then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1127);
end;begin helpptr:=1;helpline[0]:=1125;end;error;end;trieo[q]:=v;
end{:1005};if curcmd=2 then goto 30;k:=0;hyf[0]:=0;digitsensed:=false;
end;others:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1124);
end;printesc(1122);begin helpptr:=1;helpline[0]:=1125;end;error;end end;
end;30:{:1003};if eqtb[114438].int>0 then{1636:}begin c:=curlang;
firstchild:=false;p:=0;repeat q:=p;p:=trier[q];
until(p=0)or(c<=triec[p]);
if(p=0)or(c<triec[p])then{1006:}begin if trieptr=triesize then overflow(
1120,triesize);incr(trieptr);trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1006};q:=p;{1637:}p:=triel[q];firstchild:=true;
for c:=0 to 255 do if(eqtb[78137+c].hh.rh>0)or((c=255)and firstchild)
then begin if p=0 then{1006:}begin if trieptr=triesize then overflow(
1120,triesize);incr(trieptr);trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1006}else triec[p]:=c;
trieo[p]:=eqtb[78137+c].hh.rh;q:=p;p:=trier[q];firstchild:=false;end;
if firstchild then triel[q]:=0 else trier[q]:=0{:1637};end{:1636};
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1121);
end;printesc(1122);begin helpptr:=1;helpline[0]:=1123;end;error;
mem[memtop-12].hh.rh:=scantoks(false,false);flushlist(defref);end;end;
{:1002}{1008:}procedure inittrie;var p:triepointer;j,k,t:integer;
r,s:triepointer;begin incr(maxhyphchar);
{994:}{987:}opstart[0]:=-mintrieop;
for j:=1 to 255 do opstart[j]:=opstart[j-1]+trieused[j-1];
for j:=1 to trieopptr do trieophash[j]:=opstart[trieoplang[j]]+trieopval
[j];
for j:=1 to trieopptr do while trieophash[j]>j do begin k:=trieophash[j]
;t:=hyfdistance[k];hyfdistance[k]:=hyfdistance[j];hyfdistance[j]:=t;
t:=hyfnum[k];hyfnum[k]:=hyfnum[j];hyfnum[j]:=t;t:=hyfnext[k];
hyfnext[k]:=hyfnext[j];hyfnext[j]:=t;trieophash[j]:=trieophash[k];
trieophash[k]:=k;end{:987};for p:=0 to triesize do triehash[p]:=0;
trier[0]:=compresstrie(trier[0]);triel[0]:=compresstrie(triel[0]);
for p:=0 to trieptr do triehash[p]:=0;
for p:=0 to 11903 do triemin[p]:=p+1;trietrl[0]:=1;triemax:=0{:994};
if triel[0]<>0 then begin firstfit(triel[0]);triepack(triel[0]);end;
if trier[0]<>0 then{1638:}begin if triel[0]=0 then for p:=0 to 255 do
triemin[p]:=p+2;firstfit(trier[0]);triepack(trier[0]);
hyphstart:=triehash[trier[0]];end{:1638};
{1000:}if triemax=0 then begin for r:=0 to maxhyphchar do begin trietrl[
r]:=0;trietro[r]:=mintrieop;trietrc[r]:=0;end;triemax:=maxhyphchar;
end else begin if trier[0]>0 then triefix(trier[0]);
if triel[0]>0 then triefix(triel[0]);r:=0;repeat s:=trietrl[r];
begin trietrl[r]:=0;trietro[r]:=mintrieop;trietrc[r]:=0;end;r:=s;
until r>triemax;end;trietrc[0]:=63;{:1000};trienotready:=false;end;
{:1008}endif('INITEX'){:984}procedure linebreak(d:boolean);
label 30,31,32,33,34,35,22;var{903:}autobreaking:boolean;prevp:halfword;
q,r,s,prevs:halfword;f,postf:internalfontnumber;postp:halfword;
cc:sixteenbits;firstuse:boolean;{:903}{935:}j:smallnumber;c:sixteenbits;
{:935}begin packbeginline:=curlist.mlfield;{857:}firstuse:=true;
chain:=false;deleteglueref(curkanjiskip);deleteglueref(curxkanjiskip);
curkanjiskip:=mem[curlist.headfield+7].hh.rh;
curxkanjiskip:=mem[curlist.headfield+7].hh.lh;
incr(mem[curkanjiskip].hh.rh);incr(mem[curxkanjiskip].hh.rh);
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin freenode(curlist.tailfield,2);
curlist.tailfield:=curlist.pnodefield;
mem[curlist.tailfield].hh.rh:=-1073741823 end;
mem[memtop-3].hh.rh:=mem[curlist.headfield].hh.rh;
if(curlist.tailfield>=himemmin)then begin mem[curlist.tailfield].hh.rh:=
newpenalty(10000);curlist.tailfield:=mem[curlist.tailfield].hh.rh;
end else if mem[curlist.tailfield].hh.b0<>12 then begin mem[curlist.
tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;
end else begin mem[curlist.tailfield].hh.b0:=14;
deleteglueref(mem[curlist.tailfield+1].hh.lh);
flushnodelist(mem[curlist.tailfield+1].hh.rh);
mem[curlist.tailfield+1].int:=10000;end;
mem[curlist.tailfield].hh.rh:=newparamglue(14);
lastlinefill:=mem[curlist.tailfield].hh.rh;
initcurlang:=curlist.pgfield mod 65536;
initlhyf:=curlist.pgfield div 4194304;
initrhyf:=(curlist.pgfield div 65536)mod 64;popnest;
{:857}{868:}noshrinkerroryet:=true;
if(mem[eqtb[49932].hh.rh].hh.b1<>0)and(mem[eqtb[49932].hh.rh+3].int<>0)
then begin eqtb[49932].hh.rh:=finiteshrink(eqtb[49932].hh.rh);end;
if(mem[eqtb[49933].hh.rh].hh.b1<>0)and(mem[eqtb[49933].hh.rh+3].int<>0)
then begin eqtb[49933].hh.rh:=finiteshrink(eqtb[49933].hh.rh);end;
q:=eqtb[49932].hh.rh;r:=eqtb[49933].hh.rh;
background[1]:=mem[q+1].int+mem[r+1].int;background[2]:=0;
background[3]:=0;background[4]:=0;background[5]:=0;background[6]:=0;
background[2+mem[q].hh.b0]:=mem[q+2].int;
background[2+mem[r].hh.b0]:=background[2+mem[r].hh.b0]+mem[r+2].int;
background[7]:=mem[q+3].int+mem[r+3].int;{1624:}dolastlinefit:=false;
activenodesize:=3;
if eqtb[114436].int>0 then begin q:=mem[lastlinefill+1].hh.lh;
if(mem[q+2].int>0)and(mem[q].hh.b0>0)then if(background[3]=0)and(
background[4]=0)and(background[5]=0)and(background[6]=0)then begin
dolastlinefit:=true;activenodesize:=5;fillwidth[0]:=0;fillwidth[1]:=0;
fillwidth[2]:=0;fillwidth[3]:=0;fillwidth[mem[q].hh.b0-1]:=mem[q+2].int;
end;end{:1624};{:868}{875:}minimumdemerits:=1073741823;
minimaldemerits[3]:=1073741823;minimaldemerits[2]:=1073741823;
minimaldemerits[1]:=1073741823;minimaldemerits[0]:=1073741823;
{:875}{889:}if eqtb[50458].hh.rh=-1073741823 then if eqtb[114974].int=0
then begin lastspecialline:=0;secondwidth:=eqtb[114960].int;
secondindent:=0;
end else{890:}begin lastspecialline:=abs(eqtb[114402].int);
if eqtb[114402].int<0 then begin firstwidth:=eqtb[114960].int-abs(eqtb[
114974].int);
if eqtb[114974].int>=0 then firstindent:=eqtb[114974].int else
firstindent:=0;secondwidth:=eqtb[114960].int;secondindent:=0;
end else begin firstwidth:=eqtb[114960].int;firstindent:=0;
secondwidth:=eqtb[114960].int-abs(eqtb[114974].int);
if eqtb[114974].int>=0 then secondindent:=eqtb[114974].int else
secondindent:=0;end;
end{:890}else begin lastspecialline:=mem[eqtb[50458].hh.rh].hh.lh-1;
secondwidth:=mem[eqtb[50458].hh.rh+2*(lastspecialline+1)].int;
secondindent:=mem[eqtb[50458].hh.rh+2*lastspecialline+1].int;end;
if eqtb[114380].int=0 then easyline:=lastspecialline else easyline:=
1073741823{:889};{904:}threshold:=eqtb[114361].int;
if threshold>=0 then begin ifdef('STAT')if eqtb[114393].int>0 then begin
begindiagnostic;printnl(1102);end;endif('STAT')secondpass:=false;
finalpass:=false;end else begin threshold:=eqtb[114362].int;
secondpass:=true;finalpass:=(eqtb[114977].int<=0);
ifdef('STAT')if eqtb[114393].int>0 then begindiagnostic;
endif('STAT')end;
while true do begin if threshold>10000 then threshold:=10000;
if secondpass then{932:}begin ifdef('INITEX')if trienotready then
inittrie;endif('INITEX')curlang:=initcurlang;lhyf:=initlhyf;
rhyf:=initrhyf;
if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0 else hyphindex
:=trietrl[hyphstart+curlang];end{:932};{905:}q:=getnode(activenodesize);
mem[q].hh.b0:=0;mem[q].hh.b1:=2;mem[q].hh.rh:=memtop-7;
mem[q+1].hh.rh:=-1073741823;mem[q+1].hh.lh:=curlist.pgfield+1;
mem[q+2].int:=0;mem[memtop-7].hh.rh:=q;
if dolastlinefit then{1626:}begin mem[q+3].int:=0;mem[q+4].int:=0;
end{:1626};activewidth[1]:=background[1];activewidth[2]:=background[2];
activewidth[3]:=background[3];activewidth[4]:=background[4];
activewidth[5]:=background[5];activewidth[6]:=background[6];
activewidth[7]:=background[7];passive:=-1073741823;
printednode:=memtop-3;passnumber:=0;fontinshortdisplay:=0{:905};
curp:=mem[memtop-3].hh.rh;autobreaking:=true;prevp:=curp;
while(curp<>-1073741823)and(mem[memtop-7].hh.rh<>memtop-7)do{907:}begin
if(curp>=himemmin)then{908:}begin chain:=false;
if(curp>=himemmin)then if fontdir[mem[curp].hh.b0]<>0 then begin case
mem[prevp].hh.b0 of 0,1,2,3,8,9,11:begin curp:=prevp;trybreak(0,0);
curp:=mem[curp].hh.rh;end;others:;end;end;prevp:=curp;postp:=curp;
postf:=mem[postp].hh.b0;repeat f:=postf;
cc:=ptencucsto8bitcode(fontenc[f],mem[curp].hh.b1);
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+cc].qqqq.b0].int;postp:=mem[curp].hh.rh;
if fontdir[f]<>0 then begin prevp:=curp;curp:=postp;
postp:=mem[postp].hh.rh;
if(postp>=himemmin)then begin postf:=mem[postp].hh.b0;
if fontdir[postf]<>0 then chain:=true else chain:=false;trybreak(0,0);
end else begin chain:=false;
case mem[postp].hh.b0 of 0,1,2,3,8,9,11:trybreak(0,0);others:;end;end;
if chain then begin if firstuse then begin if(mem[curkanjiskip].hh.b1<>0
)and(mem[curkanjiskip+3].int<>0)then begin curkanjiskip:=finiteshrink(
curkanjiskip);end;firstuse:=false;end;
activewidth[1]:=activewidth[1]+mem[curkanjiskip+1].int;
activewidth[2+mem[curkanjiskip].hh.b0]:=activewidth[2+mem[curkanjiskip].
hh.b0]+mem[curkanjiskip+2].int;
activewidth[7]:=activewidth[7]+mem[curkanjiskip+3].int;end;prevp:=curp;
end else if(postp>=himemmin)then begin postf:=mem[postp].hh.b0;
chain:=false;if fontdir[postf]<>0 then trybreak(0,0);end;curp:=postp;
until not(curp>=himemmin);chain:=false;end{:908};
case mem[curp].hh.b0 of 0,1,2,3:activewidth[1]:=activewidth[1]+mem[curp
+1].int;
10:{1406:}if mem[curp].hh.b1=5 then begin curlang:=mem[curp+1].hh.rh;
lhyf:=mem[curp+1].hh.b0;rhyf:=mem[curp+1].hh.b1;
if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0 else hyphindex
:=trietrl[hyphstart+curlang];end{:1406};
12:begin{909:}if autobreaking then begin if(prevp>=himemmin)then
trybreak(0,0)else if(mem[prevp].hh.b0<11)then trybreak(0,0)else if mem[
prevp].hh.b0=13 then if(mem[prevp].hh.b1<>1)and(mem[prevp].hh.b1<>3)then
trybreak(0,0);end;
if(mem[mem[curp+1].hh.lh].hh.b1<>0)and(mem[mem[curp+1].hh.lh+3].int<>0)
then begin mem[curp+1].hh.lh:=finiteshrink(mem[curp+1].hh.lh);end;
q:=mem[curp+1].hh.lh;activewidth[1]:=activewidth[1]+mem[q+1].int;
activewidth[2+mem[q].hh.b0]:=activewidth[2+mem[q].hh.b0]+mem[q+2].int;
activewidth[7]:=activewidth[7]+mem[q+3].int{:909};
if secondpass and autobreaking then{936:}begin prevs:=curp;
s:=mem[prevs].hh.rh;
if s<>-1073741823 then begin{938:}while true do begin if(s>=himemmin)
then begin hf:=mem[s].hh.b0;if fontdir[hf]<>0 then begin prevs:=s;
s:=mem[prevs].hh.rh;c:=mem[s].hh.lh;goto 22;end else c:=mem[s].hh.b1;
end else if mem[s].hh.b0=5 then goto 22 else if(mem[s].hh.b0=14)and(mem[
s].hh.b1<>0)then goto 22 else if mem[s].hh.b0=8 then if mem[s+1].hh.rh=
-1073741823 then goto 22 else begin q:=mem[s+1].hh.rh;c:=mem[q].hh.b1;
hf:=mem[q].hh.b0;
end else if(mem[s].hh.b0=13)and(mem[s].hh.b1=0)then goto 22 else if(mem[
s].hh.b0=11)and(mem[s].hh.b1>=4)then goto 22 else if mem[s].hh.b0=10
then begin{1407:}if mem[s].hh.b1=5 then begin curlang:=mem[s+1].hh.rh;
lhyf:=mem[s+1].hh.b0;rhyf:=mem[s+1].hh.b1;
if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0 else hyphindex
:=trietrl[hyphstart+curlang];end{:1407};goto 22;end else goto 31;
if hyphindex=0 then hc[0]:=eqtb[78137+c].hh.rh else if trietrc[hyphindex
+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]<>0 then if(hc[0]=c)or(eqtb[114399].int>0)then goto 32 else goto
31;22:prevs:=s;s:=mem[prevs].hh.rh;end;32:hyfchar:=hyphenchar[hf];
if hyfchar<0 then goto 31;if hyfchar>=11904 then goto 31;
ha:=prevs{:938};if lhyf+rhyf>63 then goto 31;{939:}hn:=0;
while true do begin if(s>=himemmin)then begin if mem[s].hh.b0<>hf then
goto 33;hyfbchar:=mem[s].hh.b1;c:=hyfbchar;
if hyphindex=0 then hc[0]:=eqtb[78137+c].hh.rh else if trietrc[hyphindex
+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]=0 then goto 33;if hc[0]>maxhyphchar then goto 33;
if hn=63 then goto 33;hb:=s;incr(hn);hu[hn]:=c;hc[hn]:=hc[0];
hyfbchar:=11904;
end else if mem[s].hh.b0=8 then{940:}begin if mem[s+1].hh.b0<>hf then
goto 33;j:=hn;q:=mem[s+1].hh.rh;
if q>-1073741823 then hyfbchar:=mem[q].hh.b1;
while q>-1073741823 do begin c:=mem[q].hh.b1;
if hyphindex=0 then hc[0]:=eqtb[78137+c].hh.rh else if trietrc[hyphindex
+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]=0 then goto 33;if hc[0]>maxhyphchar then goto 33;
if j=63 then goto 33;incr(j);hu[j]:=c;hc[j]:=hc[0];q:=mem[q].hh.rh;end;
hb:=s;hn:=j;
if odd(mem[s].hh.b1)then hyfbchar:=fontbchar[hf]else hyfbchar:=11904;
end{:940}else if(mem[s].hh.b0=13)and(mem[s].hh.b1=0)then begin hb:=s;
hyfbchar:=fontbchar[hf];end else goto 33;s:=mem[s].hh.rh;end;33:{:939};
{941:}if hn<lhyf+rhyf then goto 31;
while true do begin if not((s>=himemmin))then case mem[s].hh.b0 of 8:;
13:if mem[s].hh.b1<>0 then goto 34;5:;10,12,14,4,7,6:goto 34;
11:if mem[s].hh.b1>=4 then goto 34 else goto 31;others:goto 31 end;
s:=mem[s].hh.rh;end;34:{:941};hyphenate;end;31:end{:936};end;
13:if(mem[curp].hh.b1=1)or(mem[curp].hh.b1=3)then begin if not(mem[curp]
.hh.rh>=himemmin)and autobreaking then if mem[mem[curp].hh.rh].hh.b0=12
then trybreak(0,0);activewidth[1]:=activewidth[1]+mem[curp+1].int;
end else activewidth[1]:=activewidth[1]+mem[curp+1].int;
8:begin f:=mem[curp+1].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,ptencucsto8bitcode(fontenc[f],mem[curp+1].hh.b1))
].qqqq.b0].int;end;9:{910:}begin s:=mem[curp+1].hh.lh;discwidth:=0;
if s=-1073741823 then trybreak(eqtb[114365].int,1)else begin repeat
{911:}if(s>=himemmin)then begin f:=mem[s].hh.b0;
discwidth:=discwidth+fontinfo[widthbase[f]+fontinfo[charbase[f]+mem[s].
hh.b1].qqqq.b0].int;
if fontdir[f]<>0 then s:=mem[s].hh.rh end else case mem[s].hh.b0 of 8:
begin f:=mem[s+1].hh.b0;
discwidth:=discwidth+fontinfo[widthbase[f]+fontinfo[charbase[f]+mem[s+1]
.hh.b1].qqqq.b0].int;end;0,1,2,3,13:discwidth:=discwidth+mem[s+1].int;
5:;others:confusion(1106)end{:911};s:=mem[s].hh.rh;until s=-1073741823;
activewidth[1]:=activewidth[1]+discwidth;trybreak(eqtb[114364].int,1);
activewidth[1]:=activewidth[1]-discwidth;end;r:=mem[curp].hh.b1;
s:=mem[curp].hh.rh;
while r>0 do begin{912:}if(s>=himemmin)then begin f:=mem[s].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+mem[s].hh.b1].qqqq.b0].int;
if fontdir[f]<>0 then s:=mem[s].hh.rh end else case mem[s].hh.b0 of 8:
begin f:=mem[s+1].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+mem[s+1].hh.b1].qqqq.b0].int;end;
0,1,2,3,13:activewidth[1]:=activewidth[1]+mem[s+1].int;5:;
others:confusion(1107)end{:912};decr(r);s:=mem[s].hh.rh;end;prevp:=curp;
curp:=s;goto 35;end{:910};
11:begin if mem[curp].hh.b1<4 then autobreaking:=odd(mem[curp].hh.b1);
begin if not(mem[curp].hh.rh>=himemmin)and autobreaking then if mem[mem[
curp].hh.rh].hh.b0=12 then trybreak(0,0);
activewidth[1]:=activewidth[1]+mem[curp+1].int;end;end;
14:trybreak(mem[curp+1].int,0);5,6,4,7:;others:confusion(1105)end;
prevp:=curp;curp:=mem[curp].hh.rh;35:end{:907};
if curp=-1073741823 then{914:}begin trybreak(-10000,1);
if mem[memtop-7].hh.rh<>memtop-7 then begin{915:}r:=mem[memtop-7].hh.rh;
fewestdemerits:=1073741823;
repeat if mem[r].hh.b0<>2 then if mem[r+2].int<fewestdemerits then begin
fewestdemerits:=mem[r+2].int;bestbet:=r;end;r:=mem[r].hh.rh;
until r=memtop-7;bestline:=mem[bestbet+1].hh.lh{:915};
if eqtb[114380].int=0 then goto 30;{916:}begin r:=mem[memtop-7].hh.rh;
actuallooseness:=0;
repeat if mem[r].hh.b0<>2 then begin linediff:=mem[r+1].hh.lh-bestline;
if((linediff<actuallooseness)and(eqtb[114380].int<=linediff))or((
linediff>actuallooseness)and(eqtb[114380].int>=linediff))then begin
bestbet:=r;actuallooseness:=linediff;fewestdemerits:=mem[r+2].int;
end else if(linediff=actuallooseness)and(mem[r+2].int<fewestdemerits)
then begin bestbet:=r;fewestdemerits:=mem[r+2].int;end;end;
r:=mem[r].hh.rh;until r=memtop-7;bestline:=mem[bestbet+1].hh.lh;
end{:916};if(actuallooseness=eqtb[114380].int)or finalpass then goto 30;
end;end{:914};{906:}q:=mem[memtop-7].hh.rh;
while q<>memtop-7 do begin curp:=mem[q].hh.rh;
if mem[q].hh.b0=2 then freenode(q,8)else freenode(q,activenodesize);
q:=curp;end;q:=passive;while q<>-1073741823 do begin curp:=mem[q].hh.rh;
freenode(q,2);q:=curp;end{:906};
if not secondpass then begin ifdef('STAT')if eqtb[114393].int>0 then
printnl(1103);endif('STAT')threshold:=eqtb[114362].int;secondpass:=true;
finalpass:=(eqtb[114977].int<=0);
end else begin ifdef('STAT')if eqtb[114393].int>0 then printnl(1104);
endif('STAT')background[2]:=background[2]+eqtb[114977].int;
finalpass:=true;end;end;
30:ifdef('STAT')if eqtb[114393].int>0 then begin enddiagnostic(true);
normalizeselector;end;
endif('STAT')if dolastlinefit then{1634:}if mem[bestbet+3].int=0 then
dolastlinefit:=false else begin q:=newspec(mem[lastlinefill+1].hh.lh);
deleteglueref(mem[lastlinefill+1].hh.lh);
mem[q+1].int:=mem[q+1].int+mem[bestbet+3].int-mem[bestbet+4].int;
mem[q+2].int:=0;mem[lastlinefill+1].hh.lh:=q;end{:1634};{:904};
{917:}postlinebreak(d){:917};{906:}q:=mem[memtop-7].hh.rh;
while q<>memtop-7 do begin curp:=mem[q].hh.rh;
if mem[q].hh.b0=2 then freenode(q,8)else freenode(q,activenodesize);
q:=curp;end;q:=passive;while q<>-1073741823 do begin curp:=mem[q].hh.rh;
freenode(q,2);q:=curp;end{:906};packbeginline:=0;end;
{1433:}function eTeXenabled(b:boolean;j:quarterword;k:halfword):boolean;
begin if not b then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(784);
end;printcmdchr(j,k);begin helpptr:=1;helpline[0]:=1547;end;error;end;
eTeXenabled:=b;end;{:1433}{1456:}procedure showsavegroups;
label 41,42,40,30;var p:0..nestsize;m:-239..239;v:savepointer;
l:quarterword;c:groupcode;a:-1..1;i:integer;j:quarterword;s:strnumber;
begin p:=nestptr;nest[p]:=curlist;v:=saveptr;l:=curlevel;c:=curgroup;
saveptr:=curboundary;decr(curlevel);a:=1;printnl(349);println;
while true do begin printnl(386);printgroup(true);
if curgroup=0 then goto 30;repeat m:=nest[p].modefield;
if p>0 then decr(p)else m:=1;until m<>120;print(287);
case curgroup of 1:begin incr(p);goto 42;end;2,3:s:=1233;4:s:=1136;
5:s:=1232;6:if a=0 then begin if m=-1 then s:=588 else s:=610;a:=1;
goto 41;end else begin if a=1 then print(1590)else printesc(1068);
if p>=a then p:=p-a;a:=0;goto 40;end;7:begin incr(p);a:=-1;
printesc(597);goto 42;end;8:begin printesc(426);goto 40;end;9:goto 42;
10,13:begin if curgroup=10 then printesc(364)else printesc(595);
for i:=1 to 3 do if i<=savestack[saveptr-2].int then print(1027);
goto 42;end;
11:begin if savestack[saveptr-2].int=255 then printesc(367)else begin
printesc(341);printint(savestack[saveptr-2].int);end;goto 42;end;
12:begin s:=611;goto 41;end;14:begin incr(p);printesc(576);goto 40;end;
15:begin if m=239 then printchar(36)else if nest[p].modefield=239 then
begin printcmdchr(54,savestack[saveptr-2].int);goto 40;end;
printchar(36);goto 40;end;
16:begin if mem[nest[p+1].eTeXauxfield].hh.b0=32 then printesc(1043)else
printesc(1045);goto 40;end;end;{1458:}i:=savestack[saveptr-4].int;
if i<>0 then if i<1073741824 then begin if abs(nest[p].modefield)=1 then
j:=27 else j:=28;if i>0 then printcmdchr(j,0)else printcmdchr(j,1);
printscaled(abs(i));print(425);
end else if i<1073872896 then begin if i>=1073807360 then begin printesc
(1376);i:=i-(65536);end;printesc(608);printint(i-1073741824);
printchar(61);end else printcmdchr(37,i-(1073872797)){:1458};
41:printesc(s);
{1457:}if savestack[saveptr-2].int<>0 then begin printchar(32);
if savestack[saveptr-3].int=0 then print(1008)else print(1009);
printscaled(savestack[saveptr-2].int);print(425);end{:1457};
42:printchar(123);40:printchar(41);decr(curlevel);
curgroup:=savestack[saveptr].hh.b1;
saveptr:=savestack[saveptr].hh.rh end;30:saveptr:=v;curlevel:=l;
curgroup:=c;end;{:1456}{1472:}procedure newinteraction;forward;
{:1472}{:856}{976:}procedure newhyphexceptions;label 21,10,40,45,46;
var n:0..64;j:0..64;h:hyphpointer;k:strnumber;p:halfword;q:halfword;
s:strnumber;u,v:poolpointer;begin scanleftbrace;
if eqtb[114412].int<=0 then curlang:=0 else if eqtb[114412].int>255 then
curlang:=0 else curlang:=eqtb[114412].int;
ifdef('INITEX')if trienotready then begin hyphindex:=0;goto 46;end;
endif('INITEX')if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0
else hyphindex:=trietrl[hyphstart+curlang];46:{977:}n:=0;p:=-1073741823;
while true do begin getxtoken;
21:case curcmd of 11,12,74:{979:}if curchr=45 then{980:}begin if n<63
then begin q:=getavail;mem[q].hh.rh:=p;mem[q].hh.lh:=n;p:=q;end;
end{:980}else begin if hyphindex=0 then hc[0]:=eqtb[78137+curchr].hh.rh
else if trietrc[hyphindex+curchr]<>curchr then hc[0]:=0 else hc[0]:=
trietro[hyphindex+curchr];
if hc[0]=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1114);
end;begin helpptr:=2;helpline[1]:=1115;helpline[0]:=1116;end;error;
end else if n<63 then begin incr(n);hc[n]:=hc[0];end;end{:979};
21:begin scancharnum;curchr:=curval;curcmd:=74;goto 21;end;
10,2:begin if n>1 then{981:}begin incr(n);hc[n]:=curlang;
begin if poolptr+n>poolsize then overflow(260,poolsize-initpoolptr);end;
h:=0;for j:=1 to n do begin h:=(h+h+hc[j])mod 607;
begin strpool[poolptr]:=hc[j];incr(poolptr);end;end;s:=makestring;
{982:}if hyphnext<=607 then while(hyphnext>0)and(hyphword[hyphnext-1]>0)
do decr(hyphnext);
if(hyphcount=hyphsize)or(hyphnext=0)then overflow(1117,hyphsize);
incr(hyphcount);while hyphword[h]<>0 do begin{983:}k:=hyphword[h];
if(strstart[k+1]-strstart[k])<>(strstart[s+1]-strstart[s])then goto 45;
u:=strstart[k];v:=strstart[s];
repeat if strpool[u]<>strpool[v]then goto 45;incr(u);incr(v);
until u=strstart[k+1];begin decr(strptr);poolptr:=strstart[strptr];end;
s:=hyphword[h];decr(hyphcount);goto 40;45:{:983};
if hyphlink[h]=0 then begin hyphlink[h]:=hyphnext;
if hyphnext>=hyphsize then hyphnext:=607;
if hyphnext>607 then incr(hyphnext);end;h:=hyphlink[h]-1;end;
40:hyphword[h]:=s;hyphlist[h]:=p{:982};end{:981};
if curcmd=2 then goto 10;n:=0;p:=-1073741823;end;
others:{978:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(784);
end;printesc(1110);print(1111);begin helpptr:=2;helpline[1]:=1112;
helpline[0]:=1113;end;error;end{:978}end;end{:977};10:end;
{:976}{1010:}function prunepagetop(p:halfword;s:boolean):halfword;
var prevp:halfword;q,r:halfword;begin prevp:=memtop-3;
mem[memtop-3].hh.rh:=p;
while p<>-1073741823 do case mem[p].hh.b0 of 2,0,1,3:{1011:}begin q:=
newskipparam(10);mem[prevp].hh.rh:=q;mem[q].hh.rh:=p;
if mem[tempptr+1].int>mem[p+3].int then mem[tempptr+1].int:=mem[tempptr
+1].int-mem[p+3].int else mem[tempptr+1].int:=0;p:=-1073741823;
end{:1011};10,6,4:begin prevp:=p;p:=mem[prevp].hh.rh;end;
12,13,14:begin q:=p;p:=mem[q].hh.rh;mem[q].hh.rh:=-1073741823;
mem[prevp].hh.rh:=p;
if s then begin if discptr[3]=-1073741823 then discptr[3]:=q else mem[r]
.hh.rh:=q;r:=q;end else flushnodelist(q);end;others:confusion(1128)end;
prunepagetop:=mem[memtop-3].hh.rh;end;
{:1010}{1012:}function vertbreak(p:halfword;h,d:scaled):halfword;
label 30,45,90;var prevp:halfword;q,r:halfword;pi:integer;b:integer;
leastcost:integer;bestplace:halfword;prevdp:scaled;t:smallnumber;
begin prevp:=p;leastcost:=1073741823;activewidth[1]:=0;
activewidth[2]:=0;activewidth[3]:=0;activewidth[4]:=0;activewidth[5]:=0;
activewidth[6]:=0;activewidth[7]:=0;prevdp:=0;
while true do begin{1014:}if p=-1073741823 then pi:=-10000 else{1015:}
case mem[p].hh.b0 of 2,0,1,3:begin activewidth[1]:=activewidth[1]+prevdp
+mem[p+3].int;prevdp:=mem[p+2].int;goto 45;end;10:{1409:}goto 45{:1409};
12:if(mem[prevp].hh.b0<11)then pi:=0 else goto 90;
13:begin if mem[p].hh.rh=-1073741823 then t:=14 else t:=mem[mem[p].hh.rh
].hh.b0;if t=12 then pi:=0 else goto 90;end;14:pi:=mem[p+1].int;
6,4:goto 45;others:confusion(1129)end{:1015};
{1016:}if pi<10000 then begin{1017:}if activewidth[1]<h then if(
activewidth[3]<>0)or(activewidth[4]<>0)or(activewidth[5]<>0)or(
activewidth[6]<>0)then b:=0 else b:=badness(h-activewidth[1],activewidth
[2])else if activewidth[1]-h>activewidth[7]then b:=1073741823 else b:=
badness(activewidth[1]-h,activewidth[7]){:1017};
if b<1073741823 then if pi<=-10000 then b:=pi else if b<10000 then b:=b+
pi else b:=100000;if b<=leastcost then begin bestplace:=p;leastcost:=b;
bestheightplusdepth:=activewidth[1]+prevdp;end;
if(b=1073741823)or(pi<=-10000)then goto 30;end{:1016};
if(mem[p].hh.b0<12)or(mem[p].hh.b0>13)then goto 45;
90:{1018:}if mem[p].hh.b0=13 then q:=p else begin q:=mem[p+1].hh.lh;
activewidth[2+mem[q].hh.b0]:=activewidth[2+mem[q].hh.b0]+mem[q+2].int;
activewidth[7]:=activewidth[7]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin if isbitset(eqtb[
114443].int,1)then begin oldselectorignorederr:=selector;selector:=18;
writeln(logfile);write(logfile,'ignored: ');print(1130);
selector:=oldselectorignorederr;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1130);
end;begin helpptr:=4;helpline[3]:=1131;helpline[2]:=1132;
helpline[1]:=1133;helpline[0]:=1091;end;error;end;r:=newspec(q);
mem[r].hh.b1:=0;deleteglueref(q);mem[p+1].hh.lh:=r;q:=r;end;end;
activewidth[1]:=activewidth[1]+prevdp+mem[q+1].int;prevdp:=0{:1018};
45:if prevdp>d then begin activewidth[1]:=activewidth[1]+prevdp-d;
prevdp:=d;end;{:1014};prevp:=p;p:=mem[prevp].hh.rh;end;
30:vertbreak:=bestplace;end;
{:1012}{1019:}{1606:}function domarks(a,l:smallnumber;
q:halfword):boolean;var i:smallnumber;
begin if l<5 then begin for i:=0 to 15 do begin if odd(i)then curptr:=
mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div 2)+1].hh.lh;
if curptr<>-1073741823 then if domarks(a,l+1,curptr)then begin if odd(i)
then mem[q+(i div 2)+1].hh.rh:=-1073741823 else mem[q+(i div 2)+1].hh.lh
:=-1073741823;decr(mem[q].hh.b1);end;end;
if mem[q].hh.b1=0 then begin freenode(q,9);q:=-1073741823;end;
end else begin case a of{1607:}0:if mem[q+2].hh.rh<>-1073741823 then
begin deletetokenref(mem[q+2].hh.rh);mem[q+2].hh.rh:=-1073741823;
deletetokenref(mem[q+3].hh.lh);mem[q+3].hh.lh:=-1073741823;end;
{:1607}{1609:}1:if mem[q+2].hh.lh<>-1073741823 then begin if mem[q+1].hh
.lh<>-1073741823 then deletetokenref(mem[q+1].hh.lh);
deletetokenref(mem[q+1].hh.rh);mem[q+1].hh.rh:=-1073741823;
if mem[mem[q+2].hh.lh].hh.rh=-1073741823 then begin deletetokenref(mem[q
+2].hh.lh);mem[q+2].hh.lh:=-1073741823;
end else incr(mem[mem[q+2].hh.lh].hh.lh);mem[q+1].hh.lh:=mem[q+2].hh.lh;
end;{:1609}{1610:}2:if(mem[q+1].hh.lh<>-1073741823)and(mem[q+1].hh.rh=
-1073741823)then begin mem[q+1].hh.rh:=mem[q+1].hh.lh;
incr(mem[mem[q+1].hh.lh].hh.lh);end;
{:1610}{1612:}ifdef('INITEX')3:for i:=0 to 4 do begin if odd(i)then
curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div 2)+1].hh.lh;
if curptr<>-1073741823 then begin deletetokenref(curptr);
if odd(i)then mem[q+(i div 2)+1].hh.rh:=-1073741823 else mem[q+(i div 2)
+1].hh.lh:=-1073741823;end;end;endif('INITEX'){:1612}end;
if mem[q+2].hh.lh=-1073741823 then if mem[q+3].hh.lh=-1073741823 then
begin freenode(q,4);q:=-1073741823;end;end;domarks:=(q=-1073741823);end;
{:1606}function vsplit(n:halfword;h:scaled):halfword;label 10,30;
var v:halfword;w:halfword;p:halfword;q:halfword;begin curval:=n;
if curval<256 then v:=eqtb[50729+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-1073741823 then v:=-1073741823 else v:=mem[curptr+1].hh.rh;
end;flushnodelist(discptr[3]);discptr[3]:=-1073741823;
if saroot[6]<>-1073741823 then if domarks(0,0,saroot[6])then saroot[6]:=
-1073741823;
if curmark[3]<>-1073741823 then begin deletetokenref(curmark[3]);
curmark[3]:=-1073741823;deletetokenref(curmark[4]);
curmark[4]:=-1073741823;end;
{1020:}if v=-1073741823 then begin vsplit:=-1073741823;goto 10;end;
if mem[v].hh.b0=2 then begin w:=v;v:=mem[v+5].hh.rh;
deleteglueref(mem[w+7].hh.rh);deleteglueref(mem[w+7].hh.lh);
freenode(w,10);end;
if mem[v].hh.b0<>1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(349);
end;printesc(1134);print(1135);printesc(1136);begin helpptr:=2;
helpline[1]:=1137;helpline[0]:=1138;end;error;vsplit:=-1073741823;
goto 10;end;flushnodelist(mem[v].hh.rh);
mem[v].hh.rh:=-1073741823{:1020};
q:=vertbreak(mem[v+5].hh.rh,h,eqtb[114963].int);
{1021:}p:=mem[v+5].hh.rh;
if p=q then mem[v+5].hh.rh:=-1073741823 else while true do begin if mem[
p].hh.b0=6 then if mem[p+1].hh.lh<>0 then{1608:}begin findsaelement(6,
mem[p+1].hh.lh,true);
if mem[curptr+2].hh.rh=-1073741823 then begin mem[curptr+2].hh.rh:=mem[p
+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end else deletetokenref(mem[curptr+3].hh.lh);
mem[curptr+3].hh.lh:=mem[p+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end{:1608}else if curmark[3]=-1073741823 then begin curmark[3]:=mem[p+1]
.hh.rh;curmark[4]:=curmark[3];
mem[curmark[3]].hh.lh:=mem[curmark[3]].hh.lh+2;
end else begin deletetokenref(curmark[4]);curmark[4]:=mem[p+1].hh.rh;
incr(mem[curmark[4]].hh.lh);end;
if mem[p].hh.rh=q then begin mem[p].hh.rh:=-1073741823;goto 30;end;
p:=mem[p].hh.rh;end;30:{:1021};q:=prunepagetop(q,eqtb[114437].int>0);
p:=mem[v+5].hh.rh;
if q<>-1073741823 then begin q:=vpackage(q,0,1,1073741823);
mem[q].hh.b1:=((mem[q].hh.b1)div 16)*16+((mem[v].hh.b1)mod 16-5)+5;end;
if curval<256 then eqtb[50729+curval].hh.rh:=q else begin findsaelement(
4,curval,false);
if curptr<>-1073741823 then begin mem[curptr+1].hh.rh:=q;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;
q:=vpackage(p,h,0,eqtb[114963].int);
mem[q].hh.b1:=((mem[q].hh.b1)div 16)*16+((mem[v].hh.b1)mod 16-5)+5;
deleteglueref(mem[v+7].hh.rh);deleteglueref(mem[v+7].hh.lh);
freenode(v,10);vsplit:=q;10:end;{:1019}{1027:}procedure printtotals;
begin printscaled(pagesofar[1]);
if pagesofar[2]<>0 then begin print(322);printscaled(pagesofar[2]);
print(349);end;if pagesofar[3]<>0 then begin print(322);
printscaled(pagesofar[3]);print(321);end;
if pagesofar[4]<>0 then begin print(322);printscaled(pagesofar[4]);
print(1148);end;if pagesofar[5]<>0 then begin print(322);
printscaled(pagesofar[5]);print(1149);end;
if pagesofar[6]<>0 then begin print(322);printscaled(pagesofar[6]);
print(1150);end;if pagesofar[7]<>0 then begin print(323);
printscaled(pagesofar[7]);end;end;
{:1027}{1029:}procedure freezepagespecs(s:smallnumber);
begin pagecontents:=s;pagesofar[0]:=eqtb[114961].int;
pagemaxdepth:=eqtb[114962].int;pagesofar[8]:=0;pagesofar[1]:=0;
pagesofar[2]:=0;pagesofar[3]:=0;pagesofar[4]:=0;pagesofar[5]:=0;
pagesofar[6]:=0;pagesofar[7]:=0;leastpagecost:=1073741823;
ifdef('STAT')if eqtb[114394].int>0 then begin begindiagnostic;
printnl(1158);printscaled(pagesofar[0]);print(1159);
printscaled(pagemaxdepth);enddiagnostic(false);end;endif('STAT')end;
{:1029}{1034:}procedure boxerror(n:eightbits);begin error;
begindiagnostic;printnl(1002);showbox(eqtb[50729+n].hh.rh);
enddiagnostic(true);flushnodelist(eqtb[50729+n].hh.rh);
eqtb[50729+n].hh.rh:=-1073741823;end;
{:1034}{1035:}procedure ensurevbox(n:eightbits);var p:halfword;
begin p:=eqtb[50729+n].hh.rh;
if p<>-1073741823 then if mem[p].hh.b0=2 then begin p:=mem[p+5].hh.rh;
deleteglueref(mem[eqtb[50729+n].hh.rh+7].hh.rh);
deleteglueref(mem[eqtb[50729+n].hh.rh+7].hh.lh);
freenode(eqtb[50729+n].hh.rh,10);eqtb[50729+n].hh.rh:=p end;
if p<>-1073741823 then if mem[p].hh.b0<>1 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1160);
end;begin helpptr:=3;helpline[2]:=1161;helpline[1]:=1162;
helpline[0]:=1163;end;boxerror(n);end;end;
{:1035}{1036:}{1054:}procedure fireup(c:halfword);label 10;
var p,q,r,s:halfword;prevp:halfword;n:0..255;wait:boolean;
savevbadness:integer;savevfuzz:scaled;savesplittopskip:halfword;
begin{1055:}if mem[bestpagebreak].hh.b0=14 then begin geqworddefine(
114400,mem[bestpagebreak+1].int);mem[bestpagebreak+1].int:=10000;
end else geqworddefine(114400,10000){:1055};
if saroot[6]<>-1073741823 then if domarks(1,0,saroot[6])then saroot[6]:=
-1073741823;
if curmark[2]<>-1073741823 then begin if curmark[0]<>-1073741823 then
deletetokenref(curmark[0]);curmark[0]:=curmark[2];
incr(mem[curmark[0]].hh.lh);deletetokenref(curmark[1]);
curmark[1]:=-1073741823;end;
{1056:}if c=bestpagebreak then bestpagebreak:=-1073741823;
{1057:}if eqtb[50984].hh.rh<>-1073741823 then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(265);
print(349);end;printesc(437);print(1176);begin helpptr:=2;
helpline[1]:=1177;helpline[0]:=1163;end;boxerror(255);end{:1057};
insertpenalties:=0;savesplittopskip:=eqtb[49935].hh.rh;
if eqtb[114415].int<=0 then{1060:}begin r:=mem[memtop].hh.rh;
while r<>memtop do begin if mem[r+2].hh.lh<>-1073741823 then begin n:=
mem[r].hh.b1;ensurevbox(n);
if eqtb[50729+n].hh.rh=-1073741823 then eqtb[50729+n].hh.rh:=newnullbox;
p:=eqtb[50729+n].hh.rh+5;
while mem[p].hh.rh<>-1073741823 do p:=mem[p].hh.rh;mem[r+2].hh.rh:=p;
end;r:=mem[r].hh.rh;end;end{:1060};q:=memtop-4;
mem[q].hh.rh:=-1073741823;prevp:=memtop-2;p:=mem[prevp].hh.rh;
while p<>bestpagebreak do begin if mem[p].hh.b0=4 then begin if eqtb[
114415].int<=0 then{1062:}begin r:=mem[memtop].hh.rh;
while mem[r].hh.b1<>mem[p].hh.b1 do r:=mem[r].hh.rh;
if mem[r+2].hh.lh=-1073741823 then wait:=true else begin wait:=false;
n:=mem[p].hh.b1;
case abs(((mem[eqtb[50729+n].hh.rh].hh.b1)mod 16-5))of 4,3,1:if abs((mem
[p+5].hh.b1-5))<>abs(((mem[eqtb[50729+n].hh.rh].hh.b1)mod 16-5))then
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1169);
end;begin helpptr:=3;helpline[2]:=1161;helpline[1]:=1170;
helpline[0]:=1163;end;boxerror(n);eqtb[50729+n].hh.rh:=newnullbox;
mem[r+2].hh.rh:=eqtb[50729+n].hh.rh+5;end;
others:mem[eqtb[50729+n].hh.rh].hh.b1:=((mem[eqtb[50729+n].hh.rh].hh.b1)
div 16)*16+abs((mem[p+5].hh.b1-5))+5;end;s:=mem[r+2].hh.rh;
mem[s].hh.rh:=mem[p+4].hh.lh;
if mem[r+2].hh.lh=p then{1063:}begin if mem[r].hh.b0=1 then if(mem[r+1].
hh.lh=p)and(mem[r+1].hh.rh<>-1073741823)then begin while mem[s].hh.rh<>
mem[r+1].hh.rh do s:=mem[s].hh.rh;mem[s].hh.rh:=-1073741823;
eqtb[49935].hh.rh:=mem[p+4].hh.rh;
mem[p+4].hh.lh:=prunepagetop(mem[r+1].hh.rh,false);
if mem[p+4].hh.lh<>-1073741823 then begin tempptr:=vpackage(mem[p+4].hh.
lh,0,1,1073741823);mem[p+3].int:=mem[tempptr+3].int+mem[tempptr+2].int;
deleteglueref(mem[tempptr+7].hh.rh);deleteglueref(mem[tempptr+7].hh.lh);
freenode(tempptr,10);wait:=true;end;end;mem[r+2].hh.lh:=-1073741823;
n:=mem[r].hh.b1;tempptr:=mem[eqtb[50729+n].hh.rh+5].hh.rh;
deleteglueref(mem[eqtb[50729+n].hh.rh+7].hh.rh);
deleteglueref(mem[eqtb[50729+n].hh.rh+7].hh.lh);
flushnodelist(mem[eqtb[50729+n].hh.rh].hh.rh);
freenode(eqtb[50729+n].hh.rh,10);
eqtb[50729+n].hh.rh:=vpackage(tempptr,0,1,1073741823);
mem[eqtb[50729+n].hh.rh].hh.b1:=((mem[eqtb[50729+n].hh.rh].hh.b1)div 16)
*16+abs((mem[p+5].hh.b1-5))+5;
end{:1063}else begin while mem[s].hh.rh<>-1073741823 do s:=mem[s].hh.rh;
mem[r+2].hh.rh:=s;end;end;{1064:}mem[prevp].hh.rh:=mem[p].hh.rh;
mem[p].hh.rh:=-1073741823;if wait then begin mem[q].hh.rh:=p;q:=p;
incr(insertpenalties);end else begin deleteglueref(mem[p+4].hh.rh);
freenode(p,6);end;p:=prevp{:1064};end{:1062};
end else if mem[p].hh.b0=6 then if mem[p+1].hh.lh<>0 then{1611:}begin
findsaelement(6,mem[p+1].hh.lh,true);
if mem[curptr+1].hh.rh=-1073741823 then begin mem[curptr+1].hh.rh:=mem[p
+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);end;
if mem[curptr+2].hh.lh<>-1073741823 then deletetokenref(mem[curptr+2].hh
.lh);mem[curptr+2].hh.lh:=mem[p+1].hh.rh;
incr(mem[mem[p+1].hh.rh].hh.lh);
end{:1611}else{1058:}begin if curmark[1]=-1073741823 then begin curmark[
1]:=mem[p+1].hh.rh;incr(mem[curmark[1]].hh.lh);end;
if curmark[2]<>-1073741823 then deletetokenref(curmark[2]);
curmark[2]:=mem[p+1].hh.rh;incr(mem[curmark[2]].hh.lh);end{:1058};
prevp:=p;p:=mem[prevp].hh.rh;end;eqtb[49935].hh.rh:=savesplittopskip;
{1059:}if p<>-1073741823 then begin if mem[memtop-1].hh.rh=-1073741823
then if nestptr=0 then curlist.tailfield:=pagetail else nest[0].
tailfield:=pagetail;mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;
mem[memtop-1].hh.rh:=p;mem[prevp].hh.rh:=-1073741823;end;
savevbadness:=eqtb[114388].int;eqtb[114388].int:=10000;
savevfuzz:=eqtb[114966].int;eqtb[114966].int:=1073741823;
eqtb[50984].hh.rh:=vpackage(mem[memtop-2].hh.rh,bestsize,0,pagemaxdepth)
;
mem[eqtb[50984].hh.rh].hh.b1:=((mem[eqtb[50984].hh.rh].hh.b1)div 16)*16+
pagedir+5;eqtb[114388].int:=savevbadness;eqtb[114966].int:=savevfuzz;
if lastglue<>1073741823 then deleteglueref(lastglue);
{1033:}pagecontents:=0;pagetail:=memtop-2;
mem[memtop-2].hh.rh:=-1073741823;lastglue:=1073741823;lastpenalty:=0;
lastkern:=0;lastnodetype:=-1;lastnodesubtype:=-1;pagesofar[8]:=0;
pagemaxdepth:=0{:1033};
if q<>memtop-4 then begin mem[memtop-2].hh.rh:=mem[memtop-4].hh.rh;
pagetail:=q;end{:1059};{1061:}r:=mem[memtop].hh.rh;
while r<>memtop do begin q:=mem[r].hh.rh;freenode(r,4);r:=q;end;
mem[memtop].hh.rh:=memtop{:1061}{:1056};
if saroot[6]<>-1073741823 then if domarks(2,0,saroot[6])then saroot[6]:=
-1073741823;
if(curmark[0]<>-1073741823)and(curmark[1]=-1073741823)then begin curmark
[1]:=curmark[0];incr(mem[curmark[0]].hh.lh);end;
if eqtb[50459].hh.rh<>-1073741823 then if deadcycles>=eqtb[114401].int
then{1066:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1178);
end;printint(deadcycles);print(1179);begin helpptr:=3;helpline[2]:=1180;
helpline[1]:=1181;helpline[0]:=1182;end;error;
end{:1066}else{1067:}begin outputactive:=true;incr(deadcycles);pushnest;
curlist.modefield:=-1;curlist.auxfield.int:=-65536000;
curlist.mlfield:=-line;begintokenlist(eqtb[50459].hh.rh,6);
newsavelevel(8);normalparagraph;scanleftbrace;goto 10;end{:1067};
{1065:}begin if mem[memtop-2].hh.rh<>-1073741823 then begin if mem[
memtop-1].hh.rh=-1073741823 then if nestptr=0 then curlist.tailfield:=
pagetail else nest[0].tailfield:=pagetail else mem[pagetail].hh.rh:=mem[
memtop-1].hh.rh;mem[memtop-1].hh.rh:=mem[memtop-2].hh.rh;
mem[memtop-2].hh.rh:=-1073741823;pagetail:=memtop-2;end;
flushnodelist(discptr[2]);discptr[2]:=-1073741823;
shipout(eqtb[50984].hh.rh);eqtb[50984].hh.rh:=-1073741823;end{:1065};
10:end;{:1054}procedure buildpage;label 10,30,31,22,80,90;
var p:halfword;q,r:halfword;b,c:integer;pi:integer;n:0..255;
delta,h,w:scaled;
begin if(mem[memtop-1].hh.rh=-1073741823)or outputactive then goto 10;
repeat 22:p:=mem[memtop-1].hh.rh;
{1038:}if lastglue<>1073741823 then deleteglueref(lastglue);
lastpenalty:=0;lastkern:=0;
if mem[p].hh.b0<2 then lastnodetype:=mem[p].hh.b0+1 else if mem[p].hh.b0
=2 then lastnodetype:=mem[mem[p+5].hh.rh].hh.b0+1 else if mem[p].hh.b0<5
then lastnodetype:=mem[p].hh.b0 else lastnodetype:=mem[p].hh.b0-1;
lastnodesubtype:=mem[p].hh.b1;
if mem[p].hh.b0=12 then begin lastglue:=mem[p+1].hh.lh;
incr(mem[lastglue].hh.rh);end else begin lastglue:=1073741823;
if mem[p].hh.b0=14 then lastpenalty:=mem[p+1].int else if mem[p].hh.b0=
13 then lastkern:=mem[p+1].int;end{:1038};
{1039:}{1042:}case mem[p].hh.b0 of 0,1,2,3:if pagecontents<2 then{1043:}
begin if pagecontents=0 then freezepagespecs(2)else pagecontents:=2;
q:=newskipparam(9);
if mem[tempptr+1].int>mem[p+3].int then mem[tempptr+1].int:=mem[tempptr
+1].int-mem[p+3].int else mem[tempptr+1].int:=0;mem[q].hh.rh:=p;
mem[memtop-1].hh.rh:=q;goto 22;
end{:1043}else{1044:}begin pagesofar[1]:=pagesofar[1]+pagesofar[8]+mem[p
+3].int;pagesofar[8]:=mem[p+2].int;goto 80;end{:1044};
10:{1408:}goto 80{:1408};
12:if pagecontents<2 then goto 31 else if(mem[pagetail].hh.b0<11)then pi
:=0 else goto 90;
13:if pagecontents<2 then goto 31 else if mem[p].hh.rh=-1073741823 then
goto 10 else if mem[mem[p].hh.rh].hh.b0=12 then pi:=0 else goto 90;
14:if pagecontents<2 then goto 31 else pi:=mem[p+1].int;6:goto 80;
4:{1050:}begin if pagecontents=0 then freezepagespecs(1);
n:=mem[p].hh.b1;r:=memtop;
while n>=mem[mem[r].hh.rh].hh.b1 do r:=mem[r].hh.rh;n:=n;
if mem[r].hh.b1<>n then{1051:}begin q:=getnode(4);
mem[q].hh.rh:=mem[r].hh.rh;mem[r].hh.rh:=q;r:=q;mem[r].hh.b1:=n;
mem[r].hh.b0:=0;ensurevbox(n);
if eqtb[50729+n].hh.rh=-1073741823 then mem[r+3].int:=0 else begin if
abs((mem[p+5].hh.b1-5))<>abs(((mem[eqtb[50729+n].hh.rh].hh.b1)mod 16-5))
then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1169);
end;begin helpptr:=3;helpline[2]:=1161;helpline[1]:=1170;
helpline[0]:=1163;end;
boxerror(n)end else mem[r+3].int:=mem[eqtb[50729+n].hh.rh+3].int+mem[
eqtb[50729+n].hh.rh+2].int;end;mem[r+2].hh.lh:=-1073741823;
q:=eqtb[49946+n].hh.rh;
if eqtb[114445+n].int=1000 then h:=mem[r+3].int else h:=xovern(mem[r+3].
int,1000)*eqtb[114445+n].int;pagesofar[0]:=pagesofar[0]-h-mem[q+1].int;
pagesofar[2+mem[q].hh.b0]:=pagesofar[2+mem[q].hh.b0]+mem[q+2].int;
pagesofar[7]:=pagesofar[7]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(265);
print(1171);end;printesc(423);printint(n);begin helpptr:=3;
helpline[2]:=1172;helpline[1]:=1173;helpline[0]:=1091;end;error;end;
end{:1051};
if mem[r].hh.b0=1 then insertpenalties:=insertpenalties+mem[p+1].int
else begin mem[r+2].hh.rh:=p;
delta:=pagesofar[0]-pagesofar[1]-pagesofar[8]+pagesofar[7];
if eqtb[114445+n].int=1000 then h:=mem[p+3].int else h:=xovern(mem[p+3].
int,1000)*eqtb[114445+n].int;
if((h<=0)or(h<=delta))and(mem[p+3].int+mem[r+3].int<=eqtb[114982+n].int)
then begin pagesofar[0]:=pagesofar[0]-h;
mem[r+3].int:=mem[r+3].int+mem[p+3].int;
end else{1052:}begin if eqtb[114445+n].int<=0 then w:=1073741823 else
begin w:=pagesofar[0]-pagesofar[1]-pagesofar[8];
if eqtb[114445+n].int<>1000 then w:=xovern(w,eqtb[114445+n].int)*1000;
end;
if w>eqtb[114982+n].int-mem[r+3].int then w:=eqtb[114982+n].int-mem[r+3]
.int;q:=vertbreak(mem[p+4].hh.lh,w,mem[p+2].int);
mem[r+3].int:=mem[r+3].int+bestheightplusdepth;
ifdef('STAT')if eqtb[114394].int>0 then{1053:}begin begindiagnostic;
printnl(1174);printint(n);print(1175);printscaled(w);printchar(44);
printscaled(bestheightplusdepth);print(1100);
if q=-1073741823 then printint(-10000)else if mem[q].hh.b0=14 then
printint(mem[q+1].int)else printchar(48);enddiagnostic(false);
end{:1053};
endif('STAT')if eqtb[114445+n].int<>1000 then bestheightplusdepth:=
xovern(bestheightplusdepth,1000)*eqtb[114445+n].int;
pagesofar[0]:=pagesofar[0]-bestheightplusdepth;mem[r].hh.b0:=1;
mem[r+1].hh.rh:=q;mem[r+1].hh.lh:=p;
if q=-1073741823 then insertpenalties:=insertpenalties-10000 else if mem
[q].hh.b0=14 then insertpenalties:=insertpenalties+mem[q+1].int;
end{:1052};end;goto 80;end{:1050};others:confusion(1164)end{:1042};
{1047:}if pi<10000 then begin{1049:}if pagesofar[1]<pagesofar[0]then if(
pagesofar[3]<>0)or(pagesofar[4]<>0)or(pagesofar[5]<>0)or(pagesofar[6]<>0
)then b:=0 else b:=badness(pagesofar[0]-pagesofar[1],pagesofar[2])else
if pagesofar[1]-pagesofar[0]>pagesofar[7]then b:=1073741823 else b:=
badness(pagesofar[1]-pagesofar[0],pagesofar[7]){:1049};
if b<1073741823 then if pi<=-10000 then c:=pi else if b<10000 then c:=b+
pi+insertpenalties else c:=100000 else c:=b;
if insertpenalties>=10000 then c:=1073741823;
ifdef('STAT')if eqtb[114394].int>0 then{1048:}begin begindiagnostic;
printnl(37);print(1096);printtotals;print(1167);
printscaled(pagesofar[0]);print(1099);
if b=1073741823 then printchar(42)else printint(b);print(1100);
printint(pi);print(1168);
if c=1073741823 then printchar(42)else printint(c);
if c<=leastpagecost then printchar(35);enddiagnostic(false);end{:1048};
endif('STAT')if c<=leastpagecost then begin bestpagebreak:=p;
bestsize:=pagesofar[0];leastpagecost:=c;r:=mem[memtop].hh.rh;
while r<>memtop do begin mem[r+2].hh.lh:=mem[r+2].hh.rh;r:=mem[r].hh.rh;
end;end;if(c=1073741823)or(pi<=-10000)then begin fireup(p);
if outputactive then goto 10;goto 30;end;end{:1047};
if(mem[p].hh.b0<12)or(mem[p].hh.b0>13)then goto 80;
90:{1046:}if mem[p].hh.b0=13 then q:=p else begin q:=mem[p+1].hh.lh;
pagesofar[2+mem[q].hh.b0]:=pagesofar[2+mem[q].hh.b0]+mem[q+2].int;
pagesofar[7]:=pagesofar[7]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(265);
print(1165);end;begin helpptr:=4;helpline[3]:=1166;helpline[2]:=1132;
helpline[1]:=1133;helpline[0]:=1091;end;error;r:=newspec(q);
mem[r].hh.b1:=0;deleteglueref(q);mem[p+1].hh.lh:=r;q:=r;end;end;
pagesofar[1]:=pagesofar[1]+pagesofar[8]+mem[q+1].int;
pagesofar[8]:=0{:1046};
80:{1045:}if pagesofar[8]>pagemaxdepth then begin pagesofar[1]:=
pagesofar[1]+pagesofar[8]-pagemaxdepth;pagesofar[8]:=pagemaxdepth;end;
{:1045};{1040:}mem[pagetail].hh.rh:=p;pagetail:=p;
mem[memtop-1].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=-1073741823;
goto 30{:1040};31:{1041:}mem[memtop-1].hh.rh:=mem[p].hh.rh;
mem[p].hh.rh:=-1073741823;
if eqtb[114437].int>0 then begin if discptr[2]=-1073741823 then discptr[
2]:=p else mem[discptr[1]].hh.rh:=p;discptr[1]:=p;
end else flushnodelist(p){:1041};30:{:1039};
until mem[memtop-1].hh.rh=-1073741823;
{1037:}if nestptr=0 then curlist.tailfield:=memtop-1 else nest[0].
tailfield:=memtop-1{:1037};10:end;
{:1036}{1072:}{1086:}procedure appspace;var q:halfword;
begin if(curlist.auxfield.hh.lh>=2000)and(eqtb[49938].hh.rh<>membot)then
q:=newparamglue(13)else begin if eqtb[49937].hh.rh<>membot then mainp:=
eqtb[49937].hh.rh else{1085:}begin mainp:=fontglue[eqtb[50985].hh.rh];
if mainp=-1073741823 then begin mainp:=newspec(membot);
maink:=parambase[eqtb[50985].hh.rh]+2;
mem[mainp+1].int:=fontinfo[maink].int;
mem[mainp+2].int:=fontinfo[maink+1].int;
mem[mainp+3].int:=fontinfo[maink+2].int;
fontglue[eqtb[50985].hh.rh]:=mainp;end;end{:1085};mainp:=newspec(mainp);
{1087:}if curlist.auxfield.hh.lh>=2000 then mem[mainp+1].int:=mem[mainp
+1].int+fontinfo[7+parambase[eqtb[50985].hh.rh]].int;
mem[mainp+2].int:=xnoverd(mem[mainp+2].int,curlist.auxfield.hh.lh,1000);
mem[mainp+3].int:=xnoverd(mem[mainp+3].int,1000,curlist.auxfield.hh.lh)
{:1087};q:=newglue(mainp);mem[mainp].hh.rh:=-1073741823;end;
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin mem[curlist.pnodefield].hh.rh:=q;
mem[q].hh.rh:=curlist.tailfield;curlist.pnodefield:=q;
end else begin mem[curlist.tailfield].hh.rh:=q;curlist.tailfield:=q;
end end;{:1086}{1090:}procedure insertdollarsign;begin backinput;
curtok:=196644;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1189);
end;begin helpptr:=2;helpline[1]:=1190;helpline[0]:=1191;end;inserror;
end;{:1090}{1092:}procedure youcant;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(789);
end;printcmdchr(curcmd,curchr);printinmode(curlist.modefield);end;
{:1092}{1093:}procedure reportillegalcase;begin youcant;
begin helpptr:=4;helpline[3]:=1192;helpline[2]:=1193;helpline[1]:=1194;
helpline[0]:=1195;end;error;end;
{:1093}{1094:}function privileged:boolean;
begin if curlist.modefield>0 then privileged:=true else begin
reportillegalcase;privileged:=false;end;end;
{:1094}{1097:}function itsallover:boolean;label 10;
begin if privileged then begin if(memtop-2=pagetail)and(curlist.
headfield=curlist.tailfield)and(deadcycles=0)then begin itsallover:=true
;goto 10;end;backinput;begin mem[curlist.tailfield].hh.rh:=newnullbox;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield+1].int:=eqtb[114960].int;
begin mem[curlist.tailfield].hh.rh:=newglue(membot+12);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newpenalty(-1073741824);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;buildpage;end;
itsallover:=false;10:end;{:1097}{1103:}procedure appendglue;
var s:smallnumber;begin s:=curchr;case s of 0:curval:=membot+4;
1:curval:=membot+8;2:curval:=membot+12;3:curval:=membot+16;
4:curval:=membot+20;5:scanglue(2);6:scanglue(3);end;
begin mem[curlist.tailfield].hh.rh:=newglue(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.inhibitglueflagfield:=false;
if s>=5 then begin decr(mem[curval].hh.rh);
if s>5 then mem[curlist.tailfield].hh.b1:=99;end;end;
{:1103}{1104:}procedure appendkern;var s:quarterword;begin s:=curchr;
scandimen(s=99,false,false);curlist.inhibitglueflagfield:=false;
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin begin mem[curlist.pnodefield].hh.rh:=newkern(curval);
mem[mem[curlist.pnodefield].hh.rh].hh.rh:=curlist.tailfield;
curlist.pnodefield:=mem[curlist.pnodefield].hh.rh;end;
mem[curlist.pnodefield].hh.b1:=s;
end else begin begin mem[curlist.tailfield].hh.rh:=newkern(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=s;end;end;{:1104}{1107:}procedure offsave;
var p:halfword;
begin if curgroup=0 then{1109:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(935);
end;printcmdchr(curcmd,curchr);begin helpptr:=1;helpline[0]:=1215;end;
error;end{:1109}else begin backinput;p:=getavail;mem[memtop-3].hh.rh:=p;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(720);
end;{1108:}case curgroup of 14:begin mem[p].hh.lh:=536909723;
printesc(582);end;15:begin mem[p].hh.lh:=196644;printchar(36);end;
16:begin mem[p].hh.lh:=536909724;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
mem[p].hh.lh:=786478;printesc(1214);end;
others:begin mem[p].hh.lh:=131197;printchar(125);end end{:1108};
print(721);begintokenlist(mem[memtop-3].hh.rh,4);begin helpptr:=5;
helpline[4]:=1209;helpline[3]:=1210;helpline[2]:=1211;helpline[1]:=1212;
helpline[0]:=1213;end;error;end;end;
{:1107}{1112:}procedure extrarightbrace;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1220);
end;case curgroup of 14:printesc(582);15:printchar(36);
16:printesc(1044);end;begin helpptr:=5;helpline[4]:=1221;
helpline[3]:=1222;helpline[2]:=1223;helpline[1]:=1224;helpline[0]:=1225;
end;error;incr(alignstate);end;{:1112}{1113:}procedure normalparagraph;
begin if eqtb[114380].int<>0 then eqworddefine(114380,0);
if eqtb[114974].int<>0 then eqworddefine(114974,0);
if eqtb[114402].int<>1 then eqworddefine(114402,1);
if eqtb[50458].hh.rh<>-1073741823 then eqdefine(50458,136,-1073741823);
if eqtb[50725].hh.rh<>-1073741823 then eqdefine(50725,136,-1073741823);
end;{:1113}{1118:}procedure boxend(boxcontext:integer);var p:halfword;
q:halfword;a:smallnumber;
begin if boxcontext<1073741824 then{1119:}begin if curbox<>-1073741823
then begin p:=mem[curbox].hh.rh;mem[curbox].hh.rh:=-1073741823;
while p<>-1073741823 do begin q:=p;p:=mem[p].hh.rh;
if abs(((mem[q].hh.b1)mod 16-5))=abs(curlist.dirfield)then begin mem[q+5
].hh.rh:=curbox;curbox:=q;mem[curbox].hh.rh:=-1073741823;
end else begin deleteglueref(mem[q+7].hh.rh);
deleteglueref(mem[q+7].hh.lh);freenode(q,10);end;end;
if abs(((mem[curbox].hh.b1)mod 16-5))<>abs(curlist.dirfield)then curbox
:=newdirnode(curbox,abs(curlist.dirfield));
mem[curbox+4].int:=boxcontext;
if abs(curlist.modefield)=1 then begin if preadjusttail<>-1073741823
then begin if memtop-14<>preadjusttail then begin mem[curlist.tailfield]
.hh.rh:=mem[memtop-14].hh.rh;curlist.tailfield:=preadjusttail;end;
preadjusttail:=-1073741823;end;appendtovlist(curbox);
if adjusttail<>-1073741823 then begin if memtop-5<>adjusttail then begin
mem[curlist.tailfield].hh.rh:=mem[memtop-5].hh.rh;
curlist.tailfield:=adjusttail;end;adjusttail:=-1073741823;end;
if curlist.modefield>0 then buildpage;
end else begin if abs(curlist.modefield)=120 then begin curlist.auxfield
.hh.lh:=1000;curlist.inhibitglueflagfield:=false;
end else begin p:=newnoad;mem[p+1].hh.rh:=3;mem[p+1].hh.lh:=curbox;
curbox:=p;end;mem[curlist.tailfield].hh.rh:=curbox;
curlist.tailfield:=curbox;end;end;
end{:1119}else if boxcontext<1073872896 then{1120:}begin if boxcontext<
1073807360 then begin curval:=boxcontext-1073741824;a:=0;
end else begin curval:=boxcontext-1073807360;a:=4;end;
if curval<256 then if(a>=4)then geqdefine(50729+curval,137,curbox)else
eqdefine(50729+curval,137,curbox)else begin findsaelement(4,curval,true)
;if(a>=4)then gsadef(curptr,curbox)else sadef(curptr,curbox);end;
end{:1120}else if curbox<>-1073741823 then if boxcontext>1073872896 then
{1121:}begin{440:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:440};
if((curcmd=32)and(abs(curlist.modefield)<>1))or((curcmd=33)and(abs(
curlist.modefield)=1))then begin appendglue;
mem[curlist.tailfield].hh.b1:=boxcontext-(1073872797);
if mem[curbox].hh.b0<=2 then begin p:=mem[curbox].hh.rh;
mem[curbox].hh.rh:=-1073741823;while p<>-1073741823 do begin q:=p;
p:=mem[p].hh.rh;
if abs(((mem[q].hh.b1)mod 16-5))=abs(curlist.dirfield)then begin mem[q+5
].hh.rh:=curbox;curbox:=q;mem[curbox].hh.rh:=-1073741823;
end else begin deleteglueref(mem[q+7].hh.rh);
deleteglueref(mem[q+7].hh.lh);freenode(q,10);end;end;
if abs(((mem[curbox].hh.b1)mod 16-5))<>abs(curlist.dirfield)then curbox
:=newdirnode(curbox,abs(curlist.dirfield));end;
mem[curlist.tailfield+1].hh.rh:=curbox;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1252);
end;begin helpptr:=3;helpline[2]:=1253;helpline[1]:=1254;
helpline[0]:=1255;end;backerror;flushnodelist(curbox);end;
end{:1121}else shipout(curbox);end;
{:1118}{1122:}procedure beginbox(boxcontext:integer);label 10,30;
var p,q:halfword;r:halfword;s:halfword;t:halfword;fm:integer;gm:integer;
fd,gd:integer;disp,pdisp:scaled;adir:eightbits;tx:halfword;
m:quarterword;k:halfword;n:halfword;
begin case curchr of 0:begin scanregisternum;
if curval<256 then curbox:=eqtb[50729+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-1073741823 then curbox:=-1073741823 else curbox:=mem[curptr+1
].hh.rh;end;
if curval<256 then eqtb[50729+curval].hh.rh:=-1073741823 else begin
findsaelement(4,curval,false);
if curptr<>-1073741823 then begin mem[curptr+1].hh.rh:=-1073741823;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;end;
1:begin scanregisternum;
if curval<256 then q:=eqtb[50729+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-1073741823 then q:=-1073741823 else q:=mem[curptr+1].hh.rh;
end;curbox:=copynodelist(q);end;2:{1123:}begin curbox:=-1073741823;
if abs(curlist.modefield)=239 then begin youcant;begin helpptr:=1;
helpline[0]:=1261;end;error;
end else if(curlist.modefield=1)and(curlist.headfield=curlist.tailfield)
then begin youcant;begin helpptr:=2;helpline[1]:=1262;helpline[0]:=1263;
end;error;end else begin tx:=curlist.tailfield;
if not(tx>=himemmin)then if mem[tx].hh.b0=5 then tx:=curlist.pnodefield;
if not(tx>=himemmin)then if(mem[tx].hh.b0=5)or((mem[tx].hh.b0=11)and(mem
[tx].hh.b1=3))then begin r:=curlist.headfield;
q:=mem[curlist.headfield].hh.rh;
while q<>tx do begin if(q>=himemmin)then r:=q else if(mem[q].hh.b0<>5)
and((mem[q].hh.b0<>11)or(mem[q].hh.b1<>3))then r:=q;q:=mem[q].hh.rh;end;
tx:=r;end;
if not(tx>=himemmin)and(curlist.headfield<>tx)then if(mem[tx].hh.b0=0)or
(mem[tx].hh.b0=1)or(mem[tx].hh.b0=2)then{1124:}begin q:=curlist.
headfield;p:=-1073741823;r:=-1073741823;fm:=0;fd:=0;disp:=0;pdisp:=0;
repeat s:=r;r:=p;p:=q;fm:=fm div 2;fd:=fd div 2;
if not(q>=himemmin)then if mem[q].hh.b0=9 then begin for m:=1 to mem[q].
hh.b1 do begin p:=mem[p].hh.rh;if p=tx then goto 30;
end end else if(mem[q].hh.b0=11)and(mem[q].hh.b1=2)then fm:=2 else if
mem[q].hh.b0=5 then begin pdisp:=disp;disp:=mem[q+1].int;fd:=2;end;
q:=mem[p].hh.rh;until q=tx;q:=mem[tx].hh.rh;mem[p].hh.rh:=q;
mem[tx].hh.rh:=-1073741823;
if q=-1073741823 then begin curlist.tailfield:=p;gm:=0;gd:=0;
end else begin if mem[q].hh.b0=11 then begin gm:=2;
if mem[q].hh.rh=-1073741823 then gd:=0 else if mem[mem[q].hh.rh].hh.b0=5
then gd:=1 else confusion(1257);
end else if mem[q].hh.b0=5 then begin curlist.pnodefield:=p;gd:=2;
if mem[q].hh.rh=-1073741823 then gm:=0 else if mem[mem[q].hh.rh].hh.b0=
11 then gm:=1 else confusion(1258);end else confusion(1259);end;
if gm=0 then if fm=2 then confusion(1256)else if fm=1 then confusion(
1260);if(fm+fd)=1 then begin fm:=0;fd:=0;end;if gm=0 then fm:=0;
if gd=0 then fd:=0;if fd>0 then begin if gm=0 then begin t:=q;
q:=-1073741823;mem[p].hh.rh:=q;curlist.tailfield:=p;
end else if gm=1 then begin t:=q;q:=mem[q].hh.rh;mem[p].hh.rh:=q;gm:=2;
end else begin t:=mem[q].hh.rh;mem[q].hh.rh:=-1073741823;
curlist.tailfield:=q;end;if fd=1 then begin curlist.pnodefield:=s;
mem[r+1].int:=mem[t+1].int;end else begin curlist.pnodefield:=r;
mem[p+1].int:=mem[t+1].int;end;curlist.pdispfield:=pdisp;freenode(t,2);
gd:=0;end;if fm>0 then begin if gd=0 then begin t:=q;q:=-1073741823;
mem[p].hh.rh:=q;curlist.tailfield:=p;end else if gd=1 then begin t:=q;
q:=mem[q].hh.rh;mem[p].hh.rh:=q;curlist.pnodefield:=p;
mem[t].hh.rh:=-1073741823 end else begin t:=mem[q].hh.rh;
mem[q].hh.rh:=-1073741823;curlist.tailfield:=q;end;
if fm=1 then begin mem[s].hh.rh:=p;mem[r].hh.rh:=t;t:=r;
curlist.pnodefield:=s;end else begin mem[r].hh.rh:=q;mem[p].hh.rh:=t;
t:=p;
if q=-1073741823 then curlist.tailfield:=r else curlist.pnodefield:=r;
end;flushnodelist(t);end;curbox:=tx;mem[curbox+4].int:=0;
if mem[curbox].hh.b0=2 then begin mem[mem[curbox+5].hh.rh].hh.rh:=curbox
;curbox:=mem[curbox+5].hh.rh;
mem[mem[curbox].hh.rh+5].hh.rh:=-1073741823;
end else if((mem[curbox].hh.b1)mod 16-5)=0 then mem[curbox].hh.b1:=((mem
[curbox].hh.b1)div 16)*16+curlist.dirfield+5;end{:1124};30:end;
end{:1123};3:{1125:}begin scanregisternum;n:=curval;
if not scankeyword(1008)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1264);
end;begin helpptr:=2;helpline[1]:=1265;helpline[0]:=1266;end;error;end;
scandimen(false,false,false);curbox:=vsplit(n,curval);end{:1125};
others:{1126:}begin k:=curchr-4;savestack[saveptr+0].int:=boxcontext;
adir:=curlist.adjdirfield;
if k=120 then if(boxcontext<1073741824)and(abs(curlist.modefield)=1)then
begin adir:=abs(curlist.dirfield);scanspec(3,true);
end else scanspec(2,true)else begin if k=1 then scanspec(4,true)else
begin scanspec(5,true);k:=1;end;normalparagraph;end;pushnest;
curlist.modefield:=-k;curlist.adjdirfield:=adir;
if k=1 then begin curlist.auxfield.int:=-65536000;
if eqtb[50464].hh.rh<>-1073741823 then begintokenlist(eqtb[50464].hh.rh,
11);end else begin curlist.auxfield.hh.lh:=1000;
curlist.inhibitglueflagfield:=false;
if eqtb[50463].hh.rh<>-1073741823 then begintokenlist(eqtb[50463].hh.rh,
10);end;goto 10;end{:1126}end;boxend(boxcontext);10:end;
{:1122}{1127:}procedure scanbox(boxcontext:integer);
begin{440:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:440};
if curcmd=26 then beginbox(boxcontext)else if(boxcontext>=1073872897)and
((curcmd=42)or(curcmd=41))then begin curbox:=scanrulespec;
boxend(boxcontext);end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1267);
end;begin helpptr:=3;helpline[2]:=1268;helpline[1]:=1269;
helpline[0]:=1270;end;backerror;end;end;
{:1127}{1129:}procedure package(c:smallnumber);var h:scaled;p:halfword;
d:scaled;begin d:=eqtb[114964].int;deleteglueref(curkanjiskip);
deleteglueref(curxkanjiskip);
if eqtb[51756].hh.rh>0 then curkanjiskip:=eqtb[49940].hh.rh else
curkanjiskip:=membot;
if eqtb[51757].hh.rh>0 then curxkanjiskip:=eqtb[49941].hh.rh else
curxkanjiskip:=membot;incr(mem[curkanjiskip].hh.rh);
incr(mem[curxkanjiskip].hh.rh);unsave;saveptr:=saveptr-3;
if curlist.modefield=-120 then begin curbox:=hpack(mem[curlist.headfield
].hh.rh,savestack[saveptr+2].int,savestack[saveptr+1].int);
mem[curbox].hh.b1:=((mem[curbox].hh.b1)div 16)*16+curlist.dirfield+5;
popnest;
end else begin curbox:=vpackage(mem[curlist.headfield].hh.rh,savestack[
saveptr+2].int,savestack[saveptr+1].int,d);
mem[curbox].hh.b1:=((mem[curbox].hh.b1)div 16)*16+curlist.dirfield+5;
popnest;if c=4 then{1130:}begin h:=0;p:=mem[curbox+5].hh.rh;
if p<>-1073741823 then if mem[p].hh.b0<=3 then h:=mem[p+3].int;
mem[curbox+2].int:=mem[curbox+2].int-h+mem[curbox+3].int;
mem[curbox+3].int:=h;end{:1130};end;boxend(savestack[saveptr+0].int);
end;{:1129}{1134:}function normmin(h:integer):smallnumber;
begin if h<=0 then normmin:=1 else if h>=63 then normmin:=63 else
normmin:=h;end;procedure newgraf(indented:boolean);
begin curlist.pgfield:=0;
if(curlist.modefield=1)or(curlist.headfield<>curlist.tailfield)then
begin mem[curlist.tailfield].hh.rh:=newparamglue(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.inhibitglueflagfield:=false;pushnest;
curlist.adjdirfield:=curlist.dirfield;curlist.modefield:=120;
curlist.auxfield.hh.lh:=1000;
if eqtb[114412].int<=0 then curlang:=0 else if eqtb[114412].int>255 then
curlang:=0 else curlang:=eqtb[114412].int;
curlist.auxfield.hh.rh:=curlang;
curlist.pgfield:=(normmin(eqtb[114413].int)*64+normmin(eqtb[114414].int)
)*65536+curlang;if indented then begin curlist.tailfield:=newnullbox;
mem[curlist.headfield].hh.rh:=curlist.tailfield;
mem[curlist.tailfield+1].int:=eqtb[114957].int;
if(insertsrcspecialeverypar)then insertsrcspecial;end;
if eqtb[50460].hh.rh<>-1073741823 then begintokenlist(eqtb[50460].hh.rh,
7);if nestptr=1 then buildpage;end;
{:1134}{1136:}procedure indentinhmode;var p,q:halfword;
begin if curchr>0 then begin p:=newnullbox;
mem[p+1].int:=eqtb[114957].int;
if abs(curlist.modefield)=120 then begin curlist.auxfield.hh.lh:=1000;
curlist.inhibitglueflagfield:=false;end else begin q:=newnoad;
mem[q+1].hh.rh:=2;mem[q+1].hh.lh:=p;p:=q;end;
begin mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
{:1136}{1138:}procedure headforvmode;
begin if curlist.modefield<0 then if curcmd<>42 then offsave else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(789);
end;printesc(589);print(1273);begin helpptr:=2;helpline[1]:=1274;
helpline[0]:=1275;end;error;end else begin backinput;curtok:=partoken;
backinput;curinput.indexfield:=4;end;end;
{:1138}{1139:}procedure endgraf;
begin if curlist.modefield=120 then begin if(mem[curlist.headfield].hh.
rh=curlist.tailfield)and(not(curlist.tailfield>=himemmin)and(mem[curlist
.tailfield].hh.b0=5))then begin freenode(curlist.tailfield,2);
curlist.tailfield:=curlist.headfield;
mem[curlist.headfield].hh.rh:=-1073741823;end;
if curlist.headfield=curlist.tailfield then popnest else begin
adjusthlist(curlist.headfield,true);linebreak(false)end;
if curlist.eTeXauxfield<>-1073741823 then begin flushlist(curlist.
eTeXauxfield);curlist.eTeXauxfield:=-1073741823;end;normalparagraph;
errorcount:=0;end;end;{:1139}{1142:}procedure begininsertoradjust;
begin if curcmd=44 then curval:=255 else begin scaneightbitint;
if curval=255 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1276);
end;printesc(341);printint(255);begin helpptr:=1;helpline[0]:=1277;end;
error;curval:=0;end;end;savestack[saveptr+0].int:=curval;
if(curcmd=44)and scankeyword(456)then savestack[saveptr+1].int:=1 else
savestack[saveptr+1].int:=0;saveptr:=saveptr+2;
curlist.inhibitglueflagfield:=false;newsavelevel(11);scanleftbrace;
normalparagraph;pushnest;curlist.modefield:=-1;
curlist.dirfield:=curlist.adjdirfield;curlist.auxfield.int:=-65536000;
end;{:1142}{1144:}procedure makemark;var p:halfword;c:halfword;
begin if curchr=0 then c:=0 else begin scanregisternum;c:=curval;end;
p:=scantoks(false,true);p:=getnode(2);mem[p+1].hh.lh:=c;mem[p].hh.b0:=6;
mem[p].hh.b1:=0;curlist.inhibitglueflagfield:=false;
mem[p+1].hh.rh:=defref;
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin mem[curlist.pnodefield].hh.rh:=p;
mem[mem[curlist.pnodefield].hh.rh].hh.rh:=curlist.tailfield;
curlist.pnodefield:=mem[curlist.pnodefield].hh.rh;
end else begin mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;
{:1144}{1146:}procedure appendpenalty;begin scanint;
curlist.inhibitglueflagfield:=false;
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin mem[curlist.pnodefield].hh.rh:=newpenalty(curval);
mem[mem[curlist.pnodefield].hh.rh].hh.rh:=curlist.tailfield;
curlist.pnodefield:=mem[curlist.pnodefield].hh.rh;
end else begin mem[curlist.tailfield].hh.rh:=newpenalty(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if curlist.modefield=1 then buildpage;end;
{:1146}{1148:}procedure deletelast;label 10;var p,q:halfword;r:halfword;
s:halfword;t:halfword;fm:integer;gm:integer;fd,gd:integer;
disp,pdisp:scaled;tx:halfword;m:quarterword;
begin if(curlist.modefield=1)and(curlist.tailfield=curlist.headfield)
then{1149:}begin if(curchr<>12)or(lastglue<>1073741823)then begin
youcant;begin helpptr:=2;helpline[1]:=1262;helpline[0]:=1280;end;
if curchr=13 then helpline[0]:=(1281)else if curchr<>12 then helpline[0]
:=(1282);error;end;end{:1149}else begin tx:=curlist.tailfield;
if not(tx>=himemmin)then if mem[tx].hh.b0=5 then tx:=curlist.pnodefield;
if not(tx>=himemmin)then if(mem[tx].hh.b0=5)or((mem[tx].hh.b0=11)and(mem
[tx].hh.b1=3))then begin r:=curlist.headfield;
q:=mem[curlist.headfield].hh.rh;
while q<>tx do begin if(q>=himemmin)then r:=q else if(mem[q].hh.b0<>5)
and((mem[q].hh.b0<>11)or(mem[q].hh.b1<>3))then r:=q;q:=mem[q].hh.rh;end;
tx:=r;end;
if not(tx>=himemmin)then if mem[tx].hh.b0=curchr then begin q:=curlist.
headfield;p:=-1073741823;r:=-1073741823;fm:=0;fd:=0;disp:=0;pdisp:=0;
repeat s:=r;r:=p;p:=q;fm:=fm div 2;fd:=fd div 2;
if not(q>=himemmin)then if mem[q].hh.b0=9 then begin for m:=1 to mem[q].
hh.b1 do begin p:=mem[p].hh.rh;if p=tx then goto 10;
end end else if(mem[q].hh.b0=11)and(mem[q].hh.b1=2)then fm:=2 else if
mem[q].hh.b0=5 then begin pdisp:=disp;disp:=mem[q+1].int;fd:=2;end;
q:=mem[p].hh.rh;until q=tx;q:=mem[tx].hh.rh;mem[p].hh.rh:=q;
mem[tx].hh.rh:=-1073741823;
if q=-1073741823 then begin curlist.tailfield:=p;gm:=0;gd:=0;
end else begin if mem[q].hh.b0=11 then begin gm:=2;
if mem[q].hh.rh=-1073741823 then gd:=0 else if mem[mem[q].hh.rh].hh.b0=5
then gd:=1 else confusion(1257);
end else if mem[q].hh.b0=5 then begin curlist.pnodefield:=p;gd:=2;
if mem[q].hh.rh=-1073741823 then gm:=0 else if mem[mem[q].hh.rh].hh.b0=
11 then gm:=1 else confusion(1258);end else confusion(1259);end;
if gm=0 then if fm=2 then confusion(1256)else if fm=1 then confusion(
1260);if(fm+fd)=1 then begin fm:=0;fd:=0;end;if gm=0 then fm:=0;
if gd=0 then fd:=0;if fd>0 then begin if gm=0 then begin t:=q;
q:=-1073741823;mem[p].hh.rh:=q;curlist.tailfield:=p;
end else if gm=1 then begin t:=q;q:=mem[q].hh.rh;mem[p].hh.rh:=q;gm:=2;
end else begin t:=mem[q].hh.rh;mem[q].hh.rh:=-1073741823;
curlist.tailfield:=q;end;if fd=1 then begin curlist.pnodefield:=s;
mem[r+1].int:=mem[t+1].int;end else begin curlist.pnodefield:=r;
mem[p+1].int:=mem[t+1].int;end;curlist.pdispfield:=pdisp;freenode(t,2);
gd:=0;end;if fm>0 then begin if gd=0 then begin t:=q;q:=-1073741823;
mem[p].hh.rh:=q;curlist.tailfield:=p;end else if gd=1 then begin t:=q;
q:=mem[q].hh.rh;mem[p].hh.rh:=q;curlist.pnodefield:=p;
mem[t].hh.rh:=-1073741823 end else begin t:=mem[q].hh.rh;
mem[q].hh.rh:=-1073741823;curlist.tailfield:=q;end;
if fm=1 then begin mem[s].hh.rh:=p;mem[r].hh.rh:=t;t:=r;
curlist.pnodefield:=s;end else begin mem[r].hh.rh:=q;mem[p].hh.rh:=t;
t:=p;
if q=-1073741823 then curlist.tailfield:=r else curlist.pnodefield:=r;
end;flushnodelist(t);end;flushnodelist(tx);end;end;10:end;
{:1148}{1153:}procedure unpackage;label 30,10;var p:halfword;c:0..1;
disp:scaled;
begin if curchr>1 then{1644:}begin mem[curlist.tailfield].hh.rh:=discptr
[curchr];discptr[curchr]:=-1073741823;goto 30;end{:1644};c:=curchr;
scanregisternum;
if curval<256 then p:=eqtb[50729+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-1073741823 then p:=-1073741823 else p:=mem[curptr+1].hh.rh;
end;if p=-1073741823 then goto 10;
if mem[p].hh.b0=2 then p:=mem[p+5].hh.rh;
if(abs(curlist.modefield)=239)or((abs(curlist.modefield)=1)and(mem[p].hh
.b0<>1))or((abs(curlist.modefield)=120)and(mem[p].hh.b0<>0))then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1290);
end;begin helpptr:=3;helpline[2]:=1291;helpline[1]:=1292;
helpline[0]:=1293;end;error;goto 10;end;
case abs(((mem[p].hh.b1)mod 16-5))of 4,3,1:if abs(curlist.dirfield)<>abs
(((mem[p].hh.b1)mod 16-5))then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1294);
end;begin helpptr:=2;helpline[1]:=1291;helpline[0]:=1295;end;error;
goto 10;end;end;disp:=0;
if c=1 then mem[curlist.tailfield].hh.rh:=copynodelist(mem[p+5].hh.rh)
else begin if mem[p].hh.b0=2 then begin deleteglueref(mem[p+7].hh.rh);
deleteglueref(mem[p+7].hh.lh);freenode(p,10);end;
flushnodelist(mem[p].hh.rh);
mem[curlist.tailfield].hh.rh:=mem[p+5].hh.rh;
if curval<256 then eqtb[50729+curval].hh.rh:=-1073741823 else begin
findsaelement(4,curval,false);
if curptr<>-1073741823 then begin mem[curptr+1].hh.rh:=-1073741823;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;
deleteglueref(mem[p+7].hh.rh);deleteglueref(mem[p+7].hh.lh);
freenode(p,10);end;
30:while mem[curlist.tailfield].hh.rh<>-1073741823 do begin p:=curlist.
tailfield;curlist.tailfield:=mem[curlist.tailfield].hh.rh;
if(curlist.tailfield>=himemmin)then begin curlist.inhibitglueflagfield:=
false;
if fontdir[mem[curlist.tailfield].hh.b0]<>0 then curlist.lastjchrfield:=
mem[curlist.tailfield].hh.rh;
end else case mem[curlist.tailfield].hh.b0 of 12:begin curlist.
inhibitglueflagfield:=false;
if(mem[curlist.tailfield].hh.b1=16)or(mem[curlist.tailfield].hh.b1=17)
then begin mem[p].hh.rh:=mem[curlist.tailfield].hh.rh;
deleteglueref(mem[curlist.tailfield+1].hh.lh);
freenode(curlist.tailfield,2);curlist.tailfield:=p;end;end;
14:begin curlist.inhibitglueflagfield:=false;
if mem[curlist.tailfield].hh.b1=1 then begin mem[p].hh.rh:=mem[curlist.
tailfield].hh.rh;freenode(curlist.tailfield,2);curlist.tailfield:=p;end;
end;5:begin curlist.pdispfield:=disp;disp:=mem[curlist.tailfield+1].int;
curlist.pnodefield:=p;end;others:curlist.inhibitglueflagfield:=false;
end;end;10:end;{:1153}{1156:}procedure appenditaliccorrection;label 10;
var p:halfword;f:internalfontnumber;d:halfword;
begin if curlist.tailfield<>curlist.headfield then begin if not(curlist.
tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)then begin d:=
curlist.tailfield;curlist.tailfield:=curlist.pnodefield;
end else d:=-1073741823;
if(curlist.lastjchrfield<>-1073741823)and(mem[curlist.lastjchrfield].hh.
rh=curlist.tailfield)and((curlist.tailfield>=himemmin))then p:=curlist.
lastjchrfield else if(curlist.tailfield>=himemmin)then p:=curlist.
tailfield else if mem[curlist.tailfield].hh.b0=8 then p:=curlist.
tailfield+1 else goto 10;f:=mem[p].hh.b0;
begin mem[curlist.tailfield].hh.rh:=newkern(fontinfo[italicbase[f]+(
fontinfo[charbase[f]+effectivechar(true,f,mem[p].hh.b1)].qqqq.b2)div 256
].int);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=3;
if d<>-1073741823 then begin curlist.pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=d;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;10:end;
{:1156}{1160:}procedure appenddiscretionary;var c:integer;
begin begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.inhibitglueflagfield:=false;
if curchr=1 then begin c:=hyphenchar[eqtb[50985].hh.rh];
if c>=0 then if c<11904 then mem[curlist.tailfield+1].hh.lh:=
newcharacter(eqtb[50985].hh.rh,c);end else begin incr(saveptr);
savestack[saveptr-1].int:=0;newsavelevel(10);scanleftbrace;pushnest;
curlist.modefield:=-120;curlist.auxfield.hh.lh:=1000;end;end;
{:1160}{1162:}procedure builddiscretionary;label 30,10;var p,q:halfword;
n:integer;d:integer;begin unsave;{1164:}q:=curlist.headfield;
p:=mem[q].hh.rh;n:=0;
while p<>-1073741823 do begin if not(p>=himemmin)then if(mem[p].hh.b0>3)
and(mem[p].hh.b0<>13)and(mem[p].hh.b0<>8)and(mem[p].hh.b0<>5)then if(mem
[p].hh.b0=14)and(mem[p].hh.b1<>0)then begin mem[q].hh.rh:=mem[p].hh.rh;
freenode(p,2);p:=q;end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1306);
end;begin helpptr:=1;helpline[0]:=1307;end;error;begindiagnostic;
printnl(1308);showbox(p);enddiagnostic(true);flushnodelist(p);
mem[q].hh.rh:=-1073741823;goto 30;end;q:=p;p:=mem[q].hh.rh;incr(n);end;
30:{:1164};p:=mem[curlist.headfield].hh.rh;d:=abs(curlist.dirfield);
popnest;
case savestack[saveptr-1].int of 0:if abs(curlist.dirfield)=d then mem[
curlist.tailfield+1].hh.lh:=p else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1278);
end;begin helpptr:=2;helpline[1]:=1296;helpline[0]:=1297;end;error;
mem[curlist.tailfield+1].hh.lh:=-1073741823;flushnodelist(p);end;
1:if abs(curlist.dirfield)=d then mem[curlist.tailfield+1].hh.rh:=p else
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1278);
end;begin helpptr:=2;helpline[1]:=1296;helpline[0]:=1298;end;error;
mem[curlist.tailfield+1].hh.rh:=-1073741823;flushnodelist(p);end;
2:{1163:}begin if(n>0)and(abs(curlist.modefield)=239)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1299);
end;printesc(364);begin helpptr:=2;helpline[1]:=1300;helpline[0]:=1301;
end;flushnodelist(p);n:=0;error;
end else if(n>0)and(abs(curlist.dirfield)<>d)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1278);
end;begin helpptr:=2;helpline[1]:=1296;helpline[0]:=1302;end;
flushnodelist(p);n:=0;error;end else mem[curlist.tailfield].hh.rh:=p;
if n<=65535 then mem[curlist.tailfield].hh.b1:=n else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1303);
end;begin helpptr:=2;helpline[1]:=1304;helpline[0]:=1305;end;error;end;
if n>0 then curlist.tailfield:=q;decr(saveptr);
curlist.pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=0;
curlist.pdispfield:=0;goto 10;end{:1163};end;
incr(savestack[saveptr-1].int);newsavelevel(10);scanleftbrace;pushnest;
curlist.modefield:=-120;curlist.auxfield.hh.lh:=1000;
curlist.inhibitglueflagfield:=false;10:end;
{:1162}{1166:}procedure makeaccent;var s,t:real;disp:scaled;
cx:KANJIcode;p,q,r:halfword;f:internalfontnumber;a,h,x,w,delta:scaled;
i:fourquarters;begin scancharnum;
if checkecharrange(curval)=0 then begin cx:=curval;
if curlist.dirfield=3 then f:=eqtb[51755].hh.rh else f:=eqtb[51754].hh.
rh;p:=newcharacter(f,getjfmpos(cx,f));
if p<>-1073741823 then begin mem[p].hh.rh:=getavail;
if(eqtb[63663+kcatcodekey(cx)].hh.rh=16)and(cx>=16777216)then mem[mem[p]
.hh.rh].hh.lh:=cx+23*16777216 else mem[mem[p].hh.rh].hh.lh:=cx+eqtb[
63663+kcatcodekey(cx)].hh.rh*16777216;end;
end else begin f:=eqtb[50985].hh.rh;p:=newcharacter(f,curval);end;
if p<>-1073741823 then begin x:=fontinfo[5+parambase[f]].int;
s:=fontinfo[1+parambase[f]].int/65536.0;
a:=fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true,f,mem[p
].hh.b1)].qqqq.b0].int;doassignments;{1167:}q:=-1073741823;
f:=eqtb[50985].hh.rh;cx:=0;
if(curcmd=11)or(curcmd=12)then q:=newcharacter(f,curchr)else if(curcmd>=
16)and(curcmd<=20)then begin if curlist.dirfield=3 then f:=eqtb[51755].
hh.rh else f:=eqtb[51754].hh.rh;cx:=curchr;
end else if curcmd=74 then if checkecharrange(curchr)then q:=
newcharacter(f,curchr)else begin if curlist.dirfield=3 then f:=eqtb[
51755].hh.rh else f:=eqtb[51754].hh.rh;cx:=curchr;
curcmd:=eqtb[63663+kcatcodekey(cx)].hh.rh;
end else if curcmd=21 then begin scancharnum;
if checkecharrange(curval)then q:=newcharacter(f,curval)else begin if
curlist.dirfield=3 then f:=eqtb[51755].hh.rh else f:=eqtb[51754].hh.rh;
cx:=curval;curcmd:=eqtb[63663+kcatcodekey(cx)].hh.rh;
end end else if curcmd=75 then begin if curlist.dirfield=3 then f:=eqtb[
51755].hh.rh else f:=eqtb[51754].hh.rh;cx:=curchr;
curcmd:=eqtb[63663+kcatcodekey(cx)].hh.rh;
end else if curcmd=22 then begin scancharnum;
if curlist.dirfield=3 then f:=eqtb[51755].hh.rh else f:=eqtb[51754].hh.
rh;cx:=curval;curcmd:=eqtb[63663+kcatcodekey(cx)].hh.rh;
end else backinput;
if curlist.dirfield=3 then begin if fontdir[f]=3 then disp:=0 else if
fontdir[f]=4 then disp:=eqtb[114978].int-eqtb[114979].int else disp:=
eqtb[114978].int end else begin if fontdir[f]=4 then disp:=0 else if
fontdir[f]=3 then disp:=eqtb[114979].int-eqtb[114978].int else disp:=
eqtb[114979].int end;
{1731:}begin if not(curlist.tailfield>=himemmin)and(mem[curlist.
tailfield].hh.b0=5)then begin if curlist.pdispfield=disp then begin
freenode(curlist.tailfield,2);curlist.tailfield:=curlist.pnodefield;
mem[curlist.tailfield].hh.rh:=-1073741823;
end else mem[curlist.tailfield+1].int:=disp;
end else if disp<>0 or not curlist.dispcalledfield then begin curlist.
pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=disp;
curlist.pdispfield:=disp;curlist.dispcalledfield:=true end;end;{:1731};
if cx<>0 then begin q:=newcharacter(f,getjfmpos(cx,f));
mem[q].hh.rh:=getavail;
if(eqtb[63663+kcatcodekey(cx)].hh.rh=16)and(cx>=16777216)then mem[mem[q]
.hh.rh].hh.lh:=cx+23*16777216 else mem[mem[q].hh.rh].hh.lh:=cx+eqtb[
63663+kcatcodekey(cx)].hh.rh*16777216;curlist.lastjchrfield:=q;end;
{:1167};
if q<>-1073741823 then{1168:}begin t:=fontinfo[1+parambase[f]].int
/65536.0;
i:=fontinfo[charbase[f]+effectivechar(true,f,mem[q].hh.b1)].qqqq;
w:=fontinfo[widthbase[f]+i.b0].int;
h:=fontinfo[heightbase[f]+(i.b1)div 256].int;
if h<>x then begin deleteglueref(curkanjiskip);
deleteglueref(curxkanjiskip);curkanjiskip:=membot;curxkanjiskip:=membot;
incr(mem[curkanjiskip].hh.rh);incr(mem[curxkanjiskip].hh.rh);
p:=hpack(p,0,1);mem[p+4].int:=x-h;end;delta:=round((w-a)/2.0+h*t-x*s);
r:=newkern(delta);mem[r].hh.b1:=2;mem[curlist.tailfield].hh.rh:=r;
mem[r].hh.rh:=p;curlist.tailfield:=newkern(-a-delta);
mem[curlist.tailfield].hh.b1:=2;
if h=x then begin if fontdir[mem[p].hh.b0]<>0 then mem[mem[p].hh.rh].hh.
rh:=curlist.tailfield else mem[p].hh.rh:=curlist.tailfield;
end else mem[p].hh.rh:=curlist.tailfield;p:=q;end{:1168};
mem[curlist.tailfield].hh.rh:=p;
if mem[p].hh.rh<>-1073741823 then curlist.tailfield:=mem[p].hh.rh else
curlist.tailfield:=p;
{1732:}if disp<>0 then begin if not(curlist.tailfield>=himemmin)and(mem[
curlist.tailfield].hh.b0=5)then begin mem[curlist.tailfield+1].int:=0;
end else begin curlist.pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=0;
curlist.pdispfield:=disp;curlist.dispcalledfield:=true end;end;{:1732};
curlist.auxfield.hh.lh:=1000;curlist.inhibitglueflagfield:=false;end;
end;{:1166}{1170:}procedure alignerror;
begin if abs(alignstate)>2 then{1171:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1313);
end;printcmdchr(curcmd,curchr);
if curtok=262182 then begin begin helpptr:=6;helpline[5]:=1314;
helpline[4]:=1315;helpline[3]:=1316;helpline[2]:=1317;helpline[1]:=1318;
helpline[0]:=1319;end;end else begin begin helpptr:=5;helpline[4]:=1314;
helpline[3]:=1320;helpline[2]:=1317;helpline[1]:=1318;helpline[0]:=1319;
end;end;error;end{:1171}else begin backinput;
if alignstate<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(752);
end;incr(alignstate);curtok:=65659;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1309);
end;decr(alignstate);curtok:=131197;end;begin helpptr:=3;
helpline[2]:=1310;helpline[1]:=1311;helpline[0]:=1312;end;inserror;end;
end;{:1170}{1172:}procedure noalignerror;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1313);
end;printesc(597);begin helpptr:=2;helpline[1]:=1321;helpline[0]:=1322;
end;error;end;procedure omiterror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1313);
end;printesc(600);begin helpptr:=2;helpline[1]:=1323;helpline[0]:=1322;
end;error;end;{:1172}{1174:}procedure doendv;begin baseptr:=inputptr;
inputstack[baseptr]:=curinput;
while(inputstack[baseptr].indexfield<>2)and(inputstack[baseptr].locfield
=-1073741823)and(inputstack[baseptr].statefield=0)do decr(baseptr);
if(inputstack[baseptr].indexfield<>2)or(inputstack[baseptr].locfield<>
-1073741823)or(inputstack[baseptr].statefield<>0)then fatalerror(686);
if curgroup=6 then begin endgraf;if fincol then finrow;end else offsave;
end;{:1174}{1178:}procedure cserror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(935);
end;printesc(569);begin helpptr:=1;helpline[0]:=1325;end;error;end;
{:1178}{1179:}procedure pushmath(c:groupcode);begin pushnest;
curlist.modefield:=-239;curlist.auxfield.int:=-1073741823;
newsavelevel(c);end;
{:1179}{1181:}{1514:}procedure justcopy(p,h,t:halfword);label 40,45;
var r:halfword;words:0..5;begin while p<>-1073741823 do begin words:=1;
if(p>=himemmin)then r:=getavail else case mem[p].hh.b0 of 2,0,1:begin r
:=getnode(10);{1774:}mem[r+8].int:=mem[p+8].int;
mem[r+9].int:=mem[p+9].int;{:1774};mem[r+7]:=mem[p+7];
mem[r+6]:=mem[p+6];mem[r+5]:=mem[p+5];incr(mem[mem[r+7].hh.rh].hh.rh);
incr(mem[mem[r+7].hh.lh].hh.rh);words:=5;mem[r+5].hh.rh:=-1073741823;
end;3:begin r:=getnode(6);words:=6;end;8:begin r:=getavail;
mem[r]:=mem[p+1];goto 40;end;13,11:begin words:=4;r:=getnode(words);end;
12:begin r:=getnode(4);incr(mem[mem[p+1].hh.lh].hh.rh);
{1776:}mem[r+2].int:=mem[p+2].int;mem[r+3].int:=mem[p+3].int;{:1776};
mem[r+1].hh.lh:=mem[p+1].hh.lh;mem[r+1].hh.rh:=-1073741823;end;
10:{1401:}case mem[p].hh.b1 of 0:begin r:=getnode(3);words:=3;end;
1,3,4:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
2,5:begin r:=getnode(2);words:=2;end;8:r:=getnode(2);
others:confusion(1516)end{:1401};others:goto 45 end;
while words>0 do begin decr(words);mem[r+words]:=mem[p+words];end;
40:mem[h].hh.rh:=r;h:=r;45:p:=mem[p].hh.rh;end;mem[h].hh.rh:=t;end;
{:1514}{1519:}procedure justreverse(p:halfword);label 30;var l:halfword;
t:halfword;q:halfword;m,n:halfword;begin m:=-1073741823;n:=-1073741823;
if mem[memtop-3].hh.rh=-1073741823 then begin justcopy(mem[p].hh.rh,
memtop-3,-1073741823);q:=mem[memtop-3].hh.rh;
end else begin q:=mem[p].hh.rh;mem[p].hh.rh:=-1073741823;
flushnodelist(mem[memtop-3].hh.rh);end;t:=newedge(curdir,0);l:=t;
curdir:=1-curdir;
while q<>-1073741823 do if(q>=himemmin)then repeat p:=q;q:=mem[p].hh.rh;
mem[p].hh.rh:=l;l:=p;until not(q>=himemmin)else begin p:=q;
q:=mem[p].hh.rh;
if mem[p].hh.b0=11 then{1520:}if odd(mem[p].hh.b1)then if mem[LRptr].hh.
lh<>(4*(mem[p].hh.b1 div 4)+3)then begin mem[p].hh.b0:=13;
incr(LRproblems);end else begin begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
if n>-1073741823 then begin decr(n);decr(mem[p].hh.b1);
end else begin if m>-1073741823 then decr(m)else begin mem[t+1].int:=mem
[p+1].int;mem[t].hh.rh:=q;freenode(p,4);goto 30;end;mem[p].hh.b0:=13;
end;end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(n>-1073741823)or((mem[p].hh.b1 div 8)<>curdir)then begin incr(n);
incr(mem[p].hh.b1);end else begin mem[p].hh.b0:=13;incr(m);end;
end{:1520};mem[p].hh.rh:=l;l:=p;end;goto 30;mem[t+1].int:=mem[p+1].int;
mem[t].hh.rh:=q;freenode(p,2);30:mem[memtop-3].hh.rh:=l;end;
{:1519}procedure initmath;label 21,40,45,30;var w:scaled;j:halfword;
x:integer;l:scaled;s:scaled;p:halfword;q:halfword;f:internalfontnumber;
n:integer;v:scaled;d:scaled;begin gettoken;
if(curcmd=3)and(curlist.modefield>0)then{1188:}begin j:=-1073741823;
w:=-1073741823;
if curlist.headfield=curlist.tailfield then{1513:}begin popnest;
{1512:}if curlist.eTeXauxfield=-1073741823 then x:=0 else if mem[curlist
.eTeXauxfield].hh.lh>=8 then x:=-1 else x:=1{:1512};
end{:1513}else if(mem[curlist.headfield].hh.rh=curlist.tailfield)and(not
(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5))then
begin freenode(curlist.tailfield,2);
curlist.tailfield:=curlist.headfield;
mem[curlist.headfield].hh.rh:=-1073741823;{1513:}begin popnest;
{1512:}if curlist.eTeXauxfield=-1073741823 then x:=0 else if mem[curlist
.eTeXauxfield].hh.lh>=8 then x:=-1 else x:=1{:1512};
end{:1513}end else begin adjusthlist(curlist.headfield,true);
linebreak(true);
{1189:}{1515:}if(eTeXmode=1)then{1521:}begin if eqtb[49933].hh.rh=membot
then j:=newkern(0)else j:=newparamglue(8);
if eqtb[49932].hh.rh=membot then p:=newkern(0)else p:=newparamglue(7);
mem[p].hh.rh:=j;j:=newnullbox;mem[j+1].int:=mem[justbox+1].int;
mem[j+4].int:=mem[justbox+4].int;mem[j+5].hh.rh:=p;
mem[j+5].hh.b1:=mem[justbox+5].hh.b1;
mem[j+5].hh.b0:=mem[justbox+5].hh.b0;mem[j+6].gr:=mem[justbox+6].gr;
end{:1521};v:=mem[justbox+4].int;
{1512:}if curlist.eTeXauxfield=-1073741823 then x:=0 else if mem[curlist
.eTeXauxfield].hh.lh>=8 then x:=-1 else x:=1{:1512};
if x>=0 then begin p:=mem[justbox+5].hh.rh;
mem[memtop-3].hh.rh:=-1073741823;
end else begin v:=-v-mem[justbox+1].int;p:=newmath(0,6);
mem[memtop-3].hh.rh:=p;justcopy(mem[justbox+5].hh.rh,p,newmath(0,7));
curdir:=1;end;v:=v+2*fontinfo[6+parambase[eqtb[50985].hh.rh]].int;
if(eqtb[114444].int>0)then{1487:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1487}{:1515};
while p<>-1073741823 do begin{1190:}21:if(p>=himemmin)then begin f:=mem[
p].hh.b0;
d:=fontinfo[widthbase[f]+fontinfo[charbase[f]+mem[p].hh.b1].qqqq.b0].int
;if fontdir[f]<>0 then p:=mem[p].hh.rh;goto 40;end;
case mem[p].hh.b0 of 0,1,2,3:begin d:=mem[p+1].int;goto 40;end;
8:{691:}begin mem[memtop-12]:=mem[p+1];
mem[memtop-12].hh.rh:=mem[p].hh.rh;p:=memtop-12;goto 21;end{:691};
13:d:=mem[p+1].int;{1517:}11:begin d:=mem[p+1].int;
if(eqtb[114444].int>0)then{1518:}if odd(mem[p].hh.b1)then begin if mem[
LRptr].hh.lh=(4*(mem[p].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;
end else if mem[p].hh.b1>4 then begin w:=1073741823;goto 30;
end end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(mem[p].hh.b1 div 8)<>curdir then begin justreverse(p);p:=memtop-3;
end;end{:1518}else if mem[p].hh.b1>=4 then begin w:=1073741823;goto 30;
end;end;16:begin d:=mem[p+1].int;curdir:=mem[p].hh.b1;end;
{:1517}12:{1191:}begin q:=mem[p+1].hh.lh;d:=mem[q+1].int;
if mem[justbox+5].hh.b0=1 then begin if(mem[justbox+5].hh.b1=mem[q].hh.
b0)and(mem[q+2].int<>0)then v:=1073741823;
end else if mem[justbox+5].hh.b0=2 then begin if(mem[justbox+5].hh.b1=
mem[q].hh.b1)and(mem[q+3].int<>0)then v:=1073741823;end;
if mem[p].hh.b1>=100 then goto 40;end{:1191};10:{1405:}d:=0{:1405};
others:d:=0 end{:1190};if v<1073741823 then v:=v+d;goto 45;
40:if v<1073741823 then begin v:=v+d;w:=v;end else begin w:=1073741823;
goto 30;end;45:p:=mem[p].hh.rh;end;
30:{1516:}if(eqtb[114444].int>0)then begin while LRptr<>-1073741823 do
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if LRproblems<>0 then begin w:=1073741823;LRproblems:=0;end;end;
curdir:=0;flushnodelist(mem[memtop-3].hh.rh){:1516}{:1189};end;
{1192:}if eqtb[50458].hh.rh=-1073741823 then if(eqtb[114974].int<>0)and(
((eqtb[114402].int>=0)and(curlist.pgfield+2>eqtb[114402].int))or(curlist
.pgfield+1<-eqtb[114402].int))then begin l:=eqtb[114960].int-abs(eqtb[
114974].int);if eqtb[114974].int>0 then s:=eqtb[114974].int else s:=0;
end else begin l:=eqtb[114960].int;s:=0;
end else begin n:=mem[eqtb[50458].hh.rh].hh.lh;
if curlist.pgfield+2>=n then p:=eqtb[50458].hh.rh+2*n else p:=eqtb[50458
].hh.rh+2*(curlist.pgfield+2);s:=mem[p-1].int;l:=mem[p].int;end{:1192};
pushmath(15);curlist.modefield:=239;eqworddefine(114405,-1);
eqworddefine(114970,w);curlist.eTeXauxfield:=j;
if(eTeXmode=1)then eqworddefine(114435,x);eqworddefine(114971,l);
eqworddefine(114972,s);
if eqtb[50462].hh.rh<>-1073741823 then begintokenlist(eqtb[50462].hh.rh,
9);if nestptr=1 then buildpage;end{:1188}else begin backinput;
{1182:}begin pushmath(15);eqworddefine(114405,-1);
if(insertsrcspecialeverymath)then insertsrcspecial;
if eqtb[50461].hh.rh<>-1073741823 then begintokenlist(eqtb[50461].hh.rh,
8);end{:1182};end;curlist.dirfield:=-abs(curlist.dirfield);end;
{:1181}{1185:}procedure starteqno;
begin savestack[saveptr+0].int:=curchr;incr(saveptr);
{1182:}begin pushmath(15);eqworddefine(114405,-1);
if(insertsrcspecialeverymath)then insertsrcspecial;
if eqtb[50461].hh.rh<>-1073741823 then begintokenlist(eqtb[50461].hh.rh,
8);end{:1182};end;{:1185}{1194:}procedure scanmath(p,q:halfword);
label 20,21,10;var c:integer;cx:KANJIcode;begin cx:=0;
20:{440:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:440};
21:case curcmd of 11,12,74:if checkecharrange(curchr)then begin c:=eqtb[
113849+curchr].hh.rh;if c=524288 then begin{1195:}begin curcs:=curchr+1;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;xtoken;backinput;
end{:1195};goto 20;end;end else cx:=curchr;16,17,18,19,20:cx:=curchr;
75:cx:=curchr;21:begin scancharnum;curchr:=curval;curcmd:=74;goto 21;
end;22:begin scancharnum;curchr:=curval;curcmd:=75;goto 21;end;
23:begin if curchr=0 then scanfifteenbitint else scanbigfifteenbitint;
c:=curval;end;76:c:=((curchr div 4096)*65536)+(curchr mod 4096);
77:c:=((curchr div 65536)*256)+(curchr mod 256);
15:begin if curchr=0 then scantwentysevenbitint else scanfiftyonebitint;
c:=curval;end;others:{1196:}begin backinput;scanleftbrace;
savestack[saveptr+0].int:=p;incr(saveptr);pushmath(9);goto 10;
end{:1196}end;if cx=0 then begin mem[p].hh.rh:=1;
mem[p].hh.b1:=c mod 256;
if(c>=458752)and(((eqtb[114405].int>=0)and(eqtb[114405].int<256)))then
mem[p].hh.b0:=eqtb[114405].int else mem[p].hh.b0:=(c div 256)mod 256;
if fontdir[eqtb[50986+mem[p].hh.b0+cursize].hh.rh]<>0 then begin begin
if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1328);
end;begin helpptr:=1;helpline[0]:=1329;end;error;
end end else begin if q=-1073741823 then begin mem[p].hh.rh:=4;
mem[p].hh.lh:=newnoad;p:=mem[p].hh.lh+1;q:=p+3;end;mem[p].hh.rh:=6;
mem[p].hh.b0:=eqtb[114406].int;mem[p].hh.b1:=0;
if(eqtb[63663+kcatcodekey(cx)].hh.rh=16)and(cx>=16777216)then mem[p+3].
hh.lh:=cx+23*16777216 else mem[p+3].hh.lh:=cx+eqtb[63663+kcatcodekey(cx)
].hh.rh*16777216;
if fontdir[eqtb[50986+mem[p].hh.b0+cursize].hh.rh]=0 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1330);
end;begin helpptr:=1;helpline[0]:=1329;end;error;end end;10:end;
{:1194}{1198:}procedure setmathchar(c:integer);var p:halfword;
begin if c>=524288 then{1195:}begin curcs:=curchr+1;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;xtoken;backinput;
end{:1195}else begin p:=newnoad;mem[p+1].hh.rh:=1;
mem[p+1].hh.b1:=c mod 256;mem[p+1].hh.b0:=(c div 256)mod 256;
if c>=458752 then begin if((eqtb[114405].int>=0)and(eqtb[114405].int<256
))then mem[p+1].hh.b0:=eqtb[114405].int;mem[p].hh.b0:=18;
end else mem[p].hh.b0:=18+(c div 65536);mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=p;
if fontdir[eqtb[50986+mem[p+1].hh.b0+cursize].hh.rh]<>0 then begin begin
if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1328);
end;begin helpptr:=1;helpline[0]:=1329;end;error;end;end;end;
{:1198}{1202:}procedure mathlimitswitch;label 10;
begin if curlist.headfield<>curlist.tailfield then if mem[curlist.
tailfield].hh.b0=19 then begin mem[curlist.tailfield].hh.b1:=curchr;
goto 10;end;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1332);
end;begin helpptr:=1;helpline[0]:=1333;end;error;10:end;
{:1202}{1203:}procedure scandelimiter(p:halfword;r:boolean);
begin if r=1 then scantwentysevenbitint else if r=2 then
scanfiftyonebitint else begin{440:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:440};
case curcmd of 11,12:begin curval:=eqtb[114701+curchr].int;
curval1:=getintone(eqtb[114701+curchr]);end;
15:if curchr=0 then scantwentysevenbitint else scanfiftyonebitint;
others:begin curval:=-1;curval1:=-1;end;end;end;
if curval<0 then begin{1204:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1334);
end;begin helpptr:=6;helpline[5]:=1335;helpline[4]:=1336;
helpline[3]:=1337;helpline[2]:=1338;helpline[1]:=1339;helpline[0]:=1340;
end;backerror;curval:=0;end{:1204};curval1:=0;end;
mem[p].qqqq.b0:=(curval div 256)mod 256;mem[p].qqqq.b1:=curval mod 256;
mem[p].qqqq.b2:=(curval1 div 256)mod 256;
mem[p].qqqq.b3:=curval1 mod 256;end;{:1203}{1206:}procedure mathradical;
begin begin mem[curlist.tailfield].hh.rh:=getnode(6);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=26;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].hh:=emptyfield;
mem[curlist.tailfield+3].hh:=emptyfield;
mem[curlist.tailfield+2].hh:=emptyfield;
scandelimiter(curlist.tailfield+5,curchr+1);
scanmath(curlist.tailfield+1,curlist.tailfield+4);end;
{:1206}{1208:}procedure mathac;
begin if curcmd=51 then{1209:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1341);
end;printesc(591);print(1342);begin helpptr:=2;helpline[1]:=1343;
helpline[0]:=1344;end;error;end{:1209};
begin mem[curlist.tailfield].hh.rh:=getnode(6);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=30;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].hh:=emptyfield;
mem[curlist.tailfield+3].hh:=emptyfield;
mem[curlist.tailfield+2].hh:=emptyfield;
mem[curlist.tailfield+5].hh.rh:=1;
if curchr=0 then scanfifteenbitint else scanbigfifteenbitint;
mem[curlist.tailfield+5].hh.b1:=curval mod 256;
if(curval>=458752)and((eqtb[114405].int>=0)and(eqtb[114405].int<256))
then mem[curlist.tailfield+5].hh.b0:=eqtb[114405].int else mem[curlist.
tailfield+5].hh.b0:=(curval div 256)mod 256;
scanmath(curlist.tailfield+1,curlist.tailfield+4);end;
{:1208}{1215:}procedure appendchoices;
begin begin mem[curlist.tailfield].hh.rh:=newchoice;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;incr(saveptr);
savestack[saveptr-1].int:=0;pushmath(13);scanleftbrace;end;
{:1215}{1217:}{1227:}function finmlist(p:halfword):halfword;
var q:halfword;
begin if curlist.auxfield.int<>-1073741823 then{1228:}begin mem[curlist.
auxfield.int+3].hh.rh:=4;
mem[curlist.auxfield.int+3].hh.lh:=mem[curlist.headfield].hh.rh;
if p=-1073741823 then q:=curlist.auxfield.int else begin q:=mem[curlist.
auxfield.int+2].hh.lh;
if(mem[q].hh.b0<>32)or(curlist.eTeXauxfield=-1073741823)then confusion(
1044);
mem[curlist.auxfield.int+2].hh.lh:=mem[curlist.eTeXauxfield].hh.rh;
mem[curlist.eTeXauxfield].hh.rh:=curlist.auxfield.int;
mem[curlist.auxfield.int].hh.rh:=p;end;
end{:1228}else begin mem[curlist.tailfield].hh.rh:=p;
q:=mem[curlist.headfield].hh.rh;end;popnest;finmlist:=q;end;
{:1227}procedure buildchoices;label 10;var p:halfword;begin unsave;
p:=finmlist(-1073741823);
case savestack[saveptr-1].int of 0:mem[curlist.tailfield+1].hh.lh:=p;
1:mem[curlist.tailfield+1].hh.rh:=p;2:mem[curlist.tailfield+2].hh.lh:=p;
3:begin mem[curlist.tailfield+2].hh.rh:=p;decr(saveptr);goto 10;end;end;
incr(savestack[saveptr-1].int);pushmath(13);scanleftbrace;10:end;
{:1217}{1219:}procedure subsup;var t:smallnumber;p:halfword;begin t:=0;
p:=-1073741823;
if curlist.tailfield<>curlist.headfield then if(mem[curlist.tailfield].
hh.b0>=18)and(mem[curlist.tailfield].hh.b0<32)then begin p:=curlist.
tailfield+2+curcmd-7;t:=mem[p].hh.rh;end;
if(p=-1073741823)or(t<>0)then{1220:}begin begin mem[curlist.tailfield].
hh.rh:=newnoad;curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
p:=curlist.tailfield+2+curcmd-7;
if t<>0 then begin if curcmd=7 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1345);
end;begin helpptr:=1;helpline[0]:=1346;end;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1347);
end;begin helpptr:=1;helpline[0]:=1348;end;end;error;end;end{:1220};
scanmath(p,-1073741823);end;{:1219}{1224:}procedure mathfraction;
var c:smallnumber;begin c:=curchr;
if curlist.auxfield.int<>-1073741823 then{1226:}begin if c>=3 then begin
scandelimiter(memtop-12,false);scandelimiter(memtop-12,false);end;
if c mod 3=0 then scandimen(false,false,false);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1355);
end;begin helpptr:=3;helpline[2]:=1356;helpline[1]:=1357;
helpline[0]:=1358;end;error;
end{:1226}else begin curlist.auxfield.int:=getnode(6);
mem[curlist.auxfield.int].hh.b0:=27;mem[curlist.auxfield.int].hh.b1:=0;
mem[curlist.auxfield.int+2].hh.rh:=4;
mem[curlist.auxfield.int+2].hh.lh:=mem[curlist.headfield].hh.rh;
mem[curlist.auxfield.int+3].hh:=emptyfield;
mem[curlist.auxfield.int+5].qqqq:=nulldelimiter;
mem[curlist.auxfield.int+4].qqqq:=nulldelimiter;
mem[curlist.headfield].hh.rh:=-1073741823;
curlist.tailfield:=curlist.headfield;
{1225:}if c>=3 then begin scandelimiter(curlist.auxfield.int+5,false);
scandelimiter(curlist.auxfield.int+4,false);end;
case c mod 3 of 0:begin scandimen(false,false,false);
mem[curlist.auxfield.int+1].int:=curval;end;
1:mem[curlist.auxfield.int+1].int:=1073741824;
2:mem[curlist.auxfield.int+1].int:=0;end{:1225};end;end;
{:1224}{1234:}procedure mathleftright;var t:smallnumber;p:halfword;
q:halfword;begin t:=curchr;
if(t<>32)and(curgroup<>16)then{1235:}begin if curgroup=15 then begin
scandelimiter(memtop-12,false);begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(935);
end;if t=1 then begin printesc(1045);begin helpptr:=1;helpline[0]:=1359;
end;end else begin printesc(1044);begin helpptr:=1;helpline[0]:=1360;
end;end;error;end else offsave;end{:1235}else begin p:=newnoad;
mem[p].hh.b0:=t;scandelimiter(p+1,false);
if t=1 then begin mem[p].hh.b0:=33;mem[p].hh.b1:=1;end;
if t=32 then q:=p else begin q:=finmlist(p);unsave;end;
if t<>33 then begin pushmath(16);mem[curlist.headfield].hh.rh:=q;
curlist.tailfield:=p;curlist.eTeXauxfield:=p;
end else begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=25;mem[curlist.tailfield+1].hh.rh:=4;
mem[curlist.tailfield+1].hh.lh:=q;end;end;end;
{:1234}{1237:}{1525:}procedure appdisplay(j,b:halfword;d:scaled);
var z:scaled;s:scaled;e:scaled;x:integer;p,q,r,t,u:halfword;
begin s:=eqtb[114972].int;x:=eqtb[114435].int;
if x=0 then mem[b+4].int:=s+d else begin z:=eqtb[114971].int;p:=b;
{1526:}if x>0 then e:=z-d-mem[p+1].int else begin e:=d;
d:=z-e-mem[p+1].int;end;if j<>-1073741823 then begin b:=copynodelist(j);
mem[b+3].int:=mem[p+3].int;mem[b+2].int:=mem[p+2].int;s:=s-mem[b+4].int;
d:=d+s;e:=e+mem[b+1].int-z-s;end;
if((mem[p].hh.b1)div 16)=2 then q:=p else begin r:=mem[p+5].hh.rh;
freenode(p,10);if r=-1073741823 then confusion(1614);
if x>0 then begin p:=r;repeat q:=r;r:=mem[r].hh.rh;until r=-1073741823;
end else begin p:=-1073741823;q:=r;repeat t:=mem[r].hh.rh;
mem[r].hh.rh:=p;p:=r;r:=t;until r=-1073741823;end;end{:1526};
{1527:}if j=-1073741823 then begin r:=newkern(0);t:=newkern(0);
end else begin r:=mem[b+5].hh.rh;t:=mem[r].hh.rh;end;u:=newmath(0,3);
if mem[t].hh.b0=12 then begin j:=newskipparam(8);mem[q].hh.rh:=j;
mem[j].hh.rh:=u;j:=mem[t+1].hh.lh;mem[tempptr].hh.b0:=mem[j].hh.b0;
mem[tempptr].hh.b1:=mem[j].hh.b1;mem[tempptr+1].int:=e-mem[j+1].int;
mem[tempptr+2].int:=-mem[j+2].int;mem[tempptr+3].int:=-mem[j+3].int;
mem[u].hh.rh:=t;end else begin mem[t+1].int:=e;mem[t].hh.rh:=u;
mem[q].hh.rh:=t;end;u:=newmath(0,2);
if mem[r].hh.b0=12 then begin j:=newskipparam(7);mem[u].hh.rh:=j;
mem[j].hh.rh:=p;j:=mem[r+1].hh.lh;mem[tempptr].hh.b0:=mem[j].hh.b0;
mem[tempptr].hh.b1:=mem[j].hh.b1;mem[tempptr+1].int:=d-mem[j+1].int;
mem[tempptr+2].int:=-mem[j+2].int;mem[tempptr+3].int:=-mem[j+3].int;
mem[r].hh.rh:=u;end else begin mem[r+1].int:=d;mem[r].hh.rh:=p;
mem[u].hh.rh:=r;if j=-1073741823 then begin b:=hpack(u,0,1);
mem[b+4].int:=s;end else mem[b+5].hh.rh:=u;end{:1527};end;
appendtovlist(b);end;{:1525}procedure aftermath;var l:boolean;
disp:scaled;danger:boolean;m:integer;p:halfword;a:halfword;
{1241:}b:halfword;w:scaled;z:scaled;e:scaled;q:scaled;d:scaled;s:scaled;
g1,g2:smallnumber;r:halfword;t:halfword;pret:halfword;
{:1241}{1522:}j:halfword;{:1522}begin danger:=false;
{1523:}if curlist.modefield=239 then j:=curlist.eTeXauxfield{:1523};
{1238:}if(fontparams[eqtb[50988].hh.rh]<22)or(fontparams[eqtb[51244].hh.
rh]<22)or(fontparams[eqtb[51500].hh.rh]<22)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1361);
end;begin helpptr:=3;helpline[2]:=1362;helpline[1]:=1363;
helpline[0]:=1364;end;error;flushmath;danger:=true;
end else if(fontparams[eqtb[50989].hh.rh]<13)or(fontparams[eqtb[51245].
hh.rh]<13)or(fontparams[eqtb[51501].hh.rh]<13)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1365);
end;begin helpptr:=3;helpline[2]:=1366;helpline[1]:=1367;
helpline[0]:=1368;end;error;flushmath;danger:=true;end{:1238};
deleteglueref(curkanjiskip);deleteglueref(curxkanjiskip);
if eqtb[51756].hh.rh>0 then curkanjiskip:=eqtb[49940].hh.rh else
curkanjiskip:=membot;
if eqtb[51757].hh.rh>0 then curxkanjiskip:=eqtb[49941].hh.rh else
curxkanjiskip:=membot;incr(mem[curkanjiskip].hh.rh);
incr(mem[curxkanjiskip].hh.rh);m:=curlist.modefield;l:=false;
p:=finmlist(-1073741823);
if curlist.modefield=-m then begin{1240:}begin repeat getxtoken;
until(eqtb[114442].int=0)or(curcmd<>13);
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1369);
end;begin helpptr:=2;helpline[1]:=1370;helpline[0]:=1371;end;backerror;
end;end{:1240};curmlist:=p;curstyle:=2;mlistpenalties:=false;
mlisttohlist;a:=hpack(mem[memtop-3].hh.rh,0,1);
mem[a].hh.b1:=((mem[a].hh.b1)mod 16-5)+5+16*(2);unsave;decr(saveptr);
if savestack[saveptr+0].int=1 then l:=true;danger:=false;
{1523:}if curlist.modefield=239 then j:=curlist.eTeXauxfield{:1523};
{1238:}if(fontparams[eqtb[50988].hh.rh]<22)or(fontparams[eqtb[51244].hh.
rh]<22)or(fontparams[eqtb[51500].hh.rh]<22)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1361);
end;begin helpptr:=3;helpline[2]:=1362;helpline[1]:=1363;
helpline[0]:=1364;end;error;flushmath;danger:=true;
end else if(fontparams[eqtb[50989].hh.rh]<13)or(fontparams[eqtb[51245].
hh.rh]<13)or(fontparams[eqtb[51501].hh.rh]<13)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1365);
end;begin helpptr:=3;helpline[2]:=1366;helpline[1]:=1367;
helpline[0]:=1368;end;error;flushmath;danger:=true;end{:1238};
m:=curlist.modefield;p:=finmlist(-1073741823);end else a:=-1073741823;
if m<0 then{1239:}begin if curlist.dirfield=3 then disp:=eqtb[114978].
int else disp:=eqtb[114979].int;
{1731:}begin if not(curlist.tailfield>=himemmin)and(mem[curlist.
tailfield].hh.b0=5)then begin if curlist.pdispfield=disp then begin
freenode(curlist.tailfield,2);curlist.tailfield:=curlist.pnodefield;
mem[curlist.tailfield].hh.rh:=-1073741823;
end else mem[curlist.tailfield+1].int:=disp;
end else if disp<>0 or not curlist.dispcalledfield then begin curlist.
pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=disp;
curlist.pdispfield:=disp;curlist.dispcalledfield:=true end;end;{:1731};
begin mem[curlist.tailfield].hh.rh:=newmath(eqtb[114958].int,0);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;curmlist:=p;
curstyle:=2;mlistpenalties:=(curlist.modefield>0);mlisttohlist;
mem[curlist.tailfield].hh.rh:=mem[memtop-3].hh.rh;
while mem[curlist.tailfield].hh.rh<>-1073741823 do curlist.tailfield:=
mem[curlist.tailfield].hh.rh;
begin mem[curlist.tailfield].hh.rh:=newmath(eqtb[114958].int,1);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
{1732:}if disp<>0 then begin if not(curlist.tailfield>=himemmin)and(mem[
curlist.tailfield].hh.b0=5)then begin mem[curlist.tailfield+1].int:=0;
end else begin curlist.pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=0;
curlist.pdispfield:=disp;curlist.dispcalledfield:=true end;end;{:1732};
curlist.auxfield.hh.lh:=1000;curlist.inhibitglueflagfield:=false;unsave;
end{:1239}else begin if a=-1073741823 then{1240:}begin repeat getxtoken;
until(eqtb[114442].int=0)or(curcmd<>13);
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1369);
end;begin helpptr:=2;helpline[1]:=1370;helpline[0]:=1371;end;backerror;
end;end{:1240};{1242:}curmlist:=p;curstyle:=0;mlistpenalties:=false;
mlisttohlist;p:=mem[memtop-3].hh.rh;adjusttail:=memtop-5;
preadjusttail:=memtop-14;b:=hpack(p,0,1);p:=mem[b+5].hh.rh;
t:=adjusttail;adjusttail:=-1073741823;pret:=preadjusttail;
preadjusttail:=-1073741823;w:=mem[b+1].int;z:=eqtb[114971].int;
s:=eqtb[114972].int;if eqtb[114435].int<0 then s:=-s-z;
if(a=-1073741823)or danger then begin e:=0;q:=0;
end else begin e:=mem[a+1].int;
q:=e+fontinfo[6+parambase[eqtb[50988].hh.rh]].int;end;
if w+q>z then{1244:}begin if(e<>0)and((w-totalshrink[0]+q<=z)or(
totalshrink[1]<>0)or(totalshrink[2]<>0)or(totalshrink[3]<>0)or(
totalshrink[4]<>0))then begin deleteglueref(mem[b+7].hh.rh);
deleteglueref(mem[b+7].hh.lh);freenode(b,10);b:=hpack(p,z-q,0);
end else begin e:=0;if w>z then begin deleteglueref(mem[b+7].hh.rh);
deleteglueref(mem[b+7].hh.lh);freenode(b,10);b:=hpack(p,z,0);end;end;
w:=mem[b+1].int;end{:1244};
{1245:}mem[b].hh.b1:=((mem[b].hh.b1)mod 16-5)+5+16*(2);d:=half(z-w);
if(e>0)and(d<2*e)then begin d:=half(z-w-e);
if p<>-1073741823 then if not(p>=himemmin)then if mem[p].hh.b0=12 then d
:=0;end{:1245};
{1246:}begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[114372].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if(d+s<=eqtb[114970].int)or l then begin g1:=3;g2:=4;
end else begin g1:=5;g2:=6;end;
if l and(e=0)then begin appdisplay(j,a,0);
begin mem[curlist.tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
end else begin mem[curlist.tailfield].hh.rh:=newparamglue(g1);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1246};
{1247:}if e<>0 then begin r:=newkern(z-w-e-d);
if l then begin mem[a].hh.rh:=r;mem[r].hh.rh:=b;b:=a;d:=0;
end else begin mem[b].hh.rh:=r;mem[r].hh.rh:=a;end;b:=hpack(b,0,1);end;
appdisplay(j,b,d){:1247};
{1248:}if(a<>-1073741823)and(e=0)and not l then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
appdisplay(j,a,z-mem[a+1].int);g2:=0;end;
if t<>memtop-5 then begin mem[curlist.tailfield].hh.rh:=mem[memtop-5].hh
.rh;curlist.tailfield:=t;end;
if pret<>memtop-14 then begin mem[curlist.tailfield].hh.rh:=mem[memtop
-14].hh.rh;curlist.tailfield:=pret;end;
begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[114373].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if g2>0 then begin mem[curlist.tailfield].hh.rh:=newparamglue(g2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1248};
{1524:}flushnodelist(j){:1524};resumeafterdisplay{:1242};end;end;
{:1237}{1243:}procedure resumeafterdisplay;
begin if curgroup<>15 then confusion(1372);unsave;
curlist.pgfield:=curlist.pgfield+3;pushnest;
curlist.adjdirfield:=curlist.dirfield;
curlist.inhibitglueflagfield:=false;curlist.modefield:=120;
curlist.auxfield.hh.lh:=1000;
if eqtb[114412].int<=0 then curlang:=0 else if eqtb[114412].int>255 then
curlang:=0 else curlang:=eqtb[114412].int;
curlist.auxfield.hh.rh:=curlang;
curlist.pgfield:=(normmin(eqtb[114413].int)*64+normmin(eqtb[114414].int)
)*65536+curlang;{480:}begin getxtoken;if curcmd<>10 then backinput;
end{:480};if nestptr=1 then buildpage;end;
{:1243}{1254:}{1676:}function scankeywordnoexpand(s:strnumber):boolean;
label 10;var p:halfword;q:halfword;k:poolpointer;begin p:=memtop-13;
mem[p].hh.rh:=-1073741823;k:=strstart[s];
while k<strstart[s+1]do begin gettoken;
if(curcs=0)and((curchr=strpool[k])or(curchr=strpool[k]-32))then begin
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;incr(k);
end else if(curcmd<>10)or(p<>memtop-13)then begin backinput;
if p<>memtop-13 then begintokenlist(mem[memtop-13].hh.rh,3);
scankeywordnoexpand:=false;goto 10;end;end;
flushlist(mem[memtop-13].hh.rh);scankeywordnoexpand:=true;10:end;
{:1676}{1258:}procedure getrtoken;label 20;begin 20:repeat gettoken;
until curtok<>655392;
if(curcs=0)or(curcs>eqtbtop)or((curcs>38810)and(curcs<=116261))then
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1390);
end;begin helpptr:=5;helpline[4]:=1391;helpline[3]:=1392;
helpline[2]:=1393;helpline[1]:=1394;helpline[0]:=1395;end;
if curcs=0 then backinput;curtok:=536909721;inserror;goto 20;end;end;
{:1258}{1272:}procedure trapzeroglue;
begin if(mem[curval+1].int=0)and(mem[curval+2].int=0)and(mem[curval+3].
int=0)then begin incr(mem[membot].hh.rh);deleteglueref(curval);
curval:=membot;end;end;
{:1272}{1280:}procedure doregistercommand(a:smallnumber);label 40,10;
var l,q,r,s:halfword;p:0..3;e:boolean;w:integer;begin q:=curcmd;
e:=false;{1281:}begin if q<>104 then begin getxtoken;
if(curcmd>=83)and(curcmd<=86)then begin l:=curchr;p:=curcmd-83;goto 40;
end;if curcmd<>104 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(789);
end;printcmdchr(curcmd,curchr);print(790);printcmdchr(q,0);
begin helpptr:=1;helpline[0]:=1425;end;error;goto 10;end;end;
if(curchr<membot)or(curchr>membot+23)then begin l:=curchr;
p:=(mem[l].hh.b0 div 16);e:=true;end else begin p:=curchr-membot;
scanregisternum;if curval>255 then begin findsaelement(p,curval,true);
l:=curptr;e:=true;end else case p of 0:l:=curval+114445;
1:l:=curval+114982;2:l:=curval+49946;3:l:=curval+50202;end;end;end;
40:if p<2 then if e then w:=mem[l+2].int else w:=eqtb[l].int else if e
then s:=mem[l+1].hh.rh else s:=eqtb[l].hh.rh{:1281};
if q=104 then scanoptionalequals else if scankeyword(1421)then;
aritherror:=false;
if q<106 then{1282:}if p<2 then begin if p=0 then scanint else scandimen
(false,false,false);if q=105 then curval:=curval+w;
end else begin scanglue(p);if q=105 then{1283:}begin q:=newspec(curval);
r:=s;deleteglueref(curval);mem[q+1].int:=mem[q+1].int+mem[r+1].int;
if mem[q+2].int=0 then mem[q].hh.b0:=0;
if mem[q].hh.b0=mem[r].hh.b0 then mem[q+2].int:=mem[q+2].int+mem[r+2].
int else if(mem[q].hh.b0<mem[r].hh.b0)and(mem[r+2].int<>0)then begin mem
[q+2].int:=mem[r+2].int;mem[q].hh.b0:=mem[r].hh.b0;end;
if mem[q+3].int=0 then mem[q].hh.b1:=0;
if mem[q].hh.b1=mem[r].hh.b1 then mem[q+3].int:=mem[q+3].int+mem[r+3].
int else if(mem[q].hh.b1<mem[r].hh.b1)and(mem[r+3].int<>0)then begin mem
[q+3].int:=mem[r+3].int;mem[q].hh.b1:=mem[r].hh.b1;end;curval:=q;
end{:1283};end{:1282}else{1284:}begin scanint;
if p<2 then if q=106 then if p=0 then curval:=multandadd(w,curval,0,
2147483647)else curval:=multandadd(w,curval,0,1073741823)else curval:=
xovern(w,curval)else begin r:=newspec(s);
if q=106 then begin mem[r+1].int:=multandadd(mem[s+1].int,curval,0,
1073741823);mem[r+2].int:=multandadd(mem[s+2].int,curval,0,1073741823);
mem[r+3].int:=multandadd(mem[s+3].int,curval,0,1073741823);
end else begin mem[r+1].int:=xovern(mem[s+1].int,curval);
mem[r+2].int:=xovern(mem[s+2].int,curval);
mem[r+3].int:=xovern(mem[s+3].int,curval);end;curval:=r;end;end{:1284};
if aritherror then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1422);
end;begin helpptr:=2;helpline[1]:=1423;helpline[0]:=1424;end;
if p>=2 then deleteglueref(curval);error;goto 10;end;
if p<2 then if e then if(a>=4)then gsawdef(l,curval)else sawdef(l,curval
)else if(a>=4)then geqworddefine(l,curval)else eqworddefine(l,curval)
else begin trapzeroglue;
if e then if(a>=4)then gsadef(l,curval)else sadef(l,curval)else if(a>=4)
then geqdefine(l,135,curval)else eqdefine(l,135,curval);end;10:end;
{:1280}{1287:}procedure alteraux;var c:halfword;
begin if curchr<>abs(curlist.modefield)then reportillegalcase else begin
c:=curchr;scanoptionalequals;
if c=1 then begin scandimen(false,false,false);
curlist.auxfield.int:=curval;end else begin scanint;
if(curval<=0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1428);
end;begin helpptr:=1;helpline[0]:=1429;end;interror(curval);
end else curlist.auxfield.hh.lh:=curval;end;end;end;
{:1287}{1288:}procedure alterprevgraf;var p:0..nestsize;
begin nest[nestptr]:=curlist;p:=nestptr;
while abs(nest[p].modefield)<>1 do decr(p);scanoptionalequals;scanint;
if curval<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1124);
end;printesc(603);begin helpptr:=1;helpline[0]:=1430;end;
interror(curval);end else begin nest[p].pgfield:=curval;
curlist:=nest[nestptr];end;end;{:1288}{1289:}procedure alterpagesofar;
var c:0..7;begin c:=curchr;scanoptionalequals;
scandimen(false,false,false);pagesofar[c]:=curval;end;
{:1289}{1290:}procedure alterinteger;var c:smallnumber;begin c:=curchr;
scanoptionalequals;scanint;
if c=0 then deadcycles:=curval{1473:}else if c=2 then begin if(curval<0)
or(curval>3)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1599);
end;begin helpptr:=2;helpline[1]:=1600;helpline[0]:=1601;end;
interror(curval);end else begin curchr:=curval;newinteraction;end;
end{:1473}else insertpenalties:=curval;end;
{:1290}{1291:}procedure alterboxdimen;var c:smallnumber;p,q:halfword;
b:halfword;begin c:=curchr;scanregisternum;
if curval<256 then b:=eqtb[50729+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-1073741823 then b:=-1073741823 else b:=mem[curptr+1].hh.rh;
end;scanoptionalequals;scandimen(false,false,false);
if b<>-1073741823 then begin q:=b;p:=mem[q].hh.rh;
while p<>-1073741823 do begin if abs(curlist.dirfield)=abs(((mem[p].hh.
b1)mod 16-5))then q:=p;p:=mem[p].hh.rh;end;
if abs(((mem[q].hh.b1)mod 16-5))<>abs(curlist.dirfield)then begin p:=mem
[b].hh.rh;mem[b].hh.rh:=-1073741823;
q:=newdirnode(q,abs(curlist.dirfield));mem[q+5].hh.rh:=-1073741823;
mem[q].hh.rh:=p;mem[b].hh.rh:=q;end;mem[q+c].int:=curval;end;end;
{:1291}{1301:}procedure newfont(a:smallnumber);label 50;var u:halfword;
s:scaled;f:internalfontnumber;t:strnumber;oldsetting:0..21;
begin if jobname=0 then openlogfile;{1677:}begin jfmenc:=0;
if scankeywordnoexpand(826)then if scankeywordnoexpand(854)then jfmenc:=
1 else if scankeywordnoexpand(856)then jfmenc:=2 else if
scankeywordnoexpand(1658)then jfmenc:=128 else if scankeywordnoexpand(
1659)then jfmenc:=129 else if scankeywordnoexpand(1660)then jfmenc:=130
else if scankeywordnoexpand(1661)then jfmenc:=131 else if
scankeywordnoexpand(1662)then jfmenc:=132 else if scankeywordnoexpand(
1663)then jfmenc:=144 else if scankeywordnoexpand(1664)then jfmenc:=145
else if scankeywordnoexpand(1665)then jfmenc:=146 else if
scankeywordnoexpand(1666)then jfmenc:=160 else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1667);
end;begin helpptr:=1;helpline[0]:=1668;end;error;end;end{:1677};
getrtoken;u:=curcs;
if u>=23810 then t:=hash[u].rh else if u>=11905 then if u=23809 then t:=
1434 else t:=u-11905 else begin oldsetting:=selector;selector:=21;
print(1434);print(u-1);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(260,poolsize-initpoolptr);end;
t:=makestring;end;if(a>=4)then geqdefine(u,100,0)else eqdefine(u,100,0);
scanoptionalequals;scanfilename;{1302:}nameinprogress:=true;
if scankeyword(1435)then{1303:}begin scandimen(false,false,false);
s:=curval;
if(s<=0)or(s>=134217728)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1437);
end;printscaled(s);print(1438);begin helpptr:=2;helpline[1]:=1439;
helpline[0]:=1440;end;error;s:=10*65536;end;
end{:1303}else if scankeyword(1436)then begin scanint;s:=-curval;
if(curval<=0)or(curval>32768)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(641);
end;begin helpptr:=1;helpline[0]:=642;end;interror(curval);s:=-1000;end;
end else s:=-1000;nameinprogress:=false{:1302};
{1304:}for f:=1 to fontptr do if streqstr(fontname[f],curname)and
streqstr(fontarea[f],curarea)then begin if s>0 then begin if s=fontsize[
f]then goto 50;end else begin aritherror:=false;
if fontsize[f]=xnoverd(fontdsize[f],-s,1000)then if not aritherror then
goto 50;end;end{:1304};f:=readfontinfo(u,curname,curarea,s);
50:if(a>=4)then geqdefine(u,100,f)else eqdefine(u,100,f);
eqtb[40923+f]:=eqtb[u];hash[40923+f].rh:=t;end;
{:1301}{1309:}procedure newinteraction;begin println;
interaction:=curchr;
if interaction=0 then kpsemaketexdiscarderrors:=1 else
kpsemaketexdiscarderrors:=0;
{77:}if interaction=0 then selector:=16 else selector:=17{:77};
if logopened then selector:=selector+2;end;
{:1309}procedure prefixedcommand;label 30,10;var a:smallnumber;
m:integer;f:internalfontnumber;j:halfword;k:fontindex;p,q:halfword;
n:integer;e:boolean;begin a:=0;
while curcmd=108 do begin if not odd(a div curchr)then a:=a+curchr;
{440:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:440};
if curcmd<=80 then{1255:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1382);
end;printcmdchr(curcmd,curchr);printchar(39);begin helpptr:=1;
helpline[0]:=1383;end;if(eTeXmode=1)then helpline[0]:=1384;backerror;
goto 10;end{:1255};
if eqtb[114397].int>2 then if(eTeXmode=1)then showcurcmdchr;end;
{1256:}if a>=8 then begin j:=917505;a:=a-8;end else j:=0;
if(curcmd<>112)and((a mod 4<>0)or(j<>0))then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(265);
print(789);end;printesc(1374);print(1385);printesc(1375);
begin helpptr:=1;helpline[0]:=1386;end;
if(eTeXmode=1)then begin helpline[0]:=1387;print(1385);printesc(1388);
end;print(1389);printcmdchr(curcmd,curchr);printchar(39);error;
end{:1256};
{1257:}if eqtb[114404].int<>0 then if eqtb[114404].int<0 then begin if(a
>=4)then a:=a-4;end else begin if not(a>=4)then a:=a+4;end{:1257};
case curcmd of{1260:}100:begin if fontdir[curchr]=4 then if(a>=4)then
geqdefine(51754,138,curchr)else eqdefine(51754,138,curchr)else if
fontdir[curchr]=3 then if(a>=4)then geqdefine(51755,138,curchr)else
eqdefine(51755,138,curchr)else if(a>=4)then geqdefine(50985,138,curchr)
else eqdefine(50985,138,curchr)end;
{:1260}{1261:}112:begin if odd(curchr)and not(a>=4)and(eqtb[114404].int
>=0)then a:=a+4;e:=(curchr>=2);getrtoken;p:=curcs;q:=scantoks(true,e);
if j<>0 then begin q:=getavail;mem[q].hh.lh:=j;
mem[q].hh.rh:=mem[defref].hh.rh;mem[defref].hh.rh:=q;end;
if(a>=4)then geqdefine(p,129+(a mod 4),defref)else eqdefine(p,129+(a mod
4),defref);end;{:1261}{1264:}109:begin n:=curchr;getrtoken;p:=curcs;
if n=0 then begin repeat gettoken;until curcmd<>10;
if curtok=786493 then begin gettoken;if curcmd=10 then gettoken;end;
end else begin gettoken;q:=curtok;gettoken;backinput;curtok:=q;
backinput;end;
if curcmd>=129 then incr(mem[curchr].hh.lh)else if(curcmd=104)or(curcmd=
81)then if(curchr<membot)or(curchr>membot+23)then incr(mem[curchr+1].hh.
lh);
if(a>=4)then geqdefine(p,curcmd,curchr)else eqdefine(p,curcmd,curchr);
end;{:1264}{1267:}110:if curchr=8 then begin scancharnum;
p:=114105+curval;scanoptionalequals;scancharnum;n:=curval;scancharnum;
if(eqtb[114425].int>0)then begin begindiagnostic;printnl(1409);
print(p-114105);print(1410);print(n);printchar(32);print(curval);
enddiagnostic(false);end;n:=n*256+curval;
if(a>=4)then geqdefine(p,138,n)else eqdefine(p,138,n);
if(p-114105)<eqtb[114423].int then if(a>=4)then geqworddefine(114423,p
-114105)else eqworddefine(114423,p-114105);
if(p-114105)>eqtb[114424].int then if(a>=4)then geqworddefine(114424,p
-114105)else eqworddefine(114424,p-114105);end else begin n:=curchr;
getrtoken;p:=curcs;
if(a>=4)then geqdefine(p,0,256)else eqdefine(p,0,256);
scanoptionalequals;case n of 0:begin scancharnum;
if(a>=4)then geqdefine(p,74,curval)else eqdefine(p,74,curval);end;
9:begin scancharnum;
if(a>=4)then geqdefine(p,75,curval)else eqdefine(p,75,curval);end;
1:begin scanrealfifteenbitint;
if(a>=4)then geqdefine(p,76,curval)else eqdefine(p,76,curval);end;
2:begin scanomegafifteenbitint;
if(a>=4)then geqdefine(p,77,curval)else eqdefine(p,77,curval);end;
others:begin scanregisternum;if curval>255 then begin j:=n-3;
if j>3 then j:=5;findsaelement(j,curval,true);incr(mem[curptr+1].hh.lh);
if j=5 then j:=81 else j:=104;
if(a>=4)then geqdefine(p,j,curptr)else eqdefine(p,j,curptr);
end else case n of 3:if(a>=4)then geqdefine(p,83,114445+curval)else
eqdefine(p,83,114445+curval);
4:if(a>=4)then geqdefine(p,84,114982+curval)else eqdefine(p,84,114982+
curval);
5:if(a>=4)then geqdefine(p,85,49946+curval)else eqdefine(p,85,49946+
curval);
6:if(a>=4)then geqdefine(p,86,50202+curval)else eqdefine(p,86,50202+
curval);
7:if(a>=4)then geqdefine(p,82,50469+curval)else eqdefine(p,82,50469+
curval);end;end end;end;{:1267}{1268:}111:begin j:=curchr;scanint;
n:=curval;
if not scankeyword(1008)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1264);
end;begin helpptr:=2;helpline[1]:=1411;helpline[0]:=1412;end;error;end;
getrtoken;p:=curcs;readtoks(n,p,j);
if(a>=4)then geqdefine(p,129,curval)else eqdefine(p,129,curval);end;
{:1268}{1269:}81,82:begin q:=curcs;e:=false;
if curcmd=81 then if curchr=membot then begin scanregisternum;
if curval>255 then begin findsaelement(5,curval,true);curchr:=curptr;
e:=true;end else curchr:=50469+curval;end else e:=true;p:=curchr;
scanoptionalequals;{440:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:440};
if curcmd<>1 then{1270:}if(curcmd=81)or(curcmd=82)then begin if curcmd=
81 then if curchr=membot then begin scanregisternum;
if curval<256 then q:=eqtb[50469+curval].hh.rh else begin findsaelement(
5,curval,false);
if curptr=-1073741823 then q:=-1073741823 else q:=mem[curptr+1].hh.rh;
end;end else q:=mem[curchr+1].hh.rh else q:=eqtb[curchr].hh.rh;
if q=-1073741823 then if e then if(a>=4)then gsadef(p,-1073741823)else
sadef(p,-1073741823)else if(a>=4)then geqdefine(p,119,-1073741823)else
eqdefine(p,119,-1073741823)else begin incr(mem[q].hh.lh);
if e then if(a>=4)then gsadef(p,q)else sadef(p,q)else if(a>=4)then
geqdefine(p,129,q)else eqdefine(p,129,q);end;goto 30;end{:1270};
backinput;curcs:=q;q:=scantoks(false,false);
if mem[defref].hh.rh=-1073741823 then begin if e then if(a>=4)then
gsadef(p,-1073741823)else sadef(p,-1073741823)else if(a>=4)then
geqdefine(p,119,-1073741823)else eqdefine(p,119,-1073741823);
begin mem[defref].hh.rh:=avail;avail:=defref;ifdef('STAT')decr(dynused);
endif('STAT')end;
end else begin if(p=50459)and not e then begin mem[q].hh.rh:=getavail;
q:=mem[q].hh.rh;mem[q].hh.lh:=131197;q:=getavail;mem[q].hh.lh:=65659;
mem[q].hh.rh:=mem[defref].hh.rh;mem[defref].hh.rh:=q;end;
if e then if(a>=4)then gsadef(p,defref)else sadef(p,defref)else if(a>=4)
then geqdefine(p,129,defref)else eqdefine(p,129,defref);end;end;
{:1269}{1271:}83:begin p:=curchr;scanoptionalequals;scanint;
if p=114405 then begin if fontdir[eqtb[50986+curval].hh.rh]<>0 then if(a
>=4)then geqworddefine(114406,curval)else eqworddefine(114406,curval)
else if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);
end else if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval)
;end;84:begin p:=curchr;scanoptionalequals;scandimen(false,false,false);
if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);end;
85,86:begin p:=curchr;n:=curcmd;scanoptionalequals;
if n=86 then scanglue(3)else scanglue(2);trapzeroglue;
if(a>=4)then geqdefine(p,135,curval)else eqdefine(p,135,curval);end;
{:1271}{1275:}98:begin if curchr=(114829)then begin p:=curchr-128;
scanasciinum;p:=p+curval;scanoptionalequals;scanint;curval1:=curval;
scanint;
if(curval1>16777215)or(curval>16777215)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(265);
print(882);end;printint(curval1);print(32);printint(curval);print(1415);
begin helpptr:=1;helpline[0]:=1416;end;error;curval1:=0;curval:=0;end;
curval1:=(curval1 div 65536)*256+(curval1 mod 256);
curval:=(curval div 65536)*256+(curval mod 256);
if(a>=4)then delgeqworddefine(p,curval1,curval)else deleqworddefine(p,
curval1,curval);
end else begin{1276:}if curchr=63663 then m:=14 else m:=0{:1276};
{1277:}if curchr=51759 then n:=15 else if curchr=63663 then n:=20 else
if curchr<113849 then n:=11904 else if curchr=113849 then n:=32768 else
if curchr=(113977)then n:=134217728 else if curchr=101945 then n:=32767
else if curchr=114701 then n:=16777215 else n:=255{:1277};p:=curchr;
curval1:=p;if p=63663 then begin scancharnum;p:=p+kcatcodekey(curval);
if curval>=11904 then m:=15;
end else if p<113849 then begin scanlatinnum;p:=p+curval;
end else begin scanasciinum;p:=p+curval;end;scanoptionalequals;scanint;
if((curval<m)and(p<114701))or(curval>n)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(265);
print(882);end;printint(curval);if p<114701 then begin print(1417);
printint(m);print(1418);end else print(1419);printint(n);
if m=0 then begin begin helpptr:=1;helpline[0]:=1416;end;error;
curval:=0;end else begin begin helpptr:=1;helpline[0]:=1420;end;error;
curval:=16;end;end;
if p<113849 then if(a>=4)then geqdefine(p,138,curval)else eqdefine(p,138
,curval)else if curval1=113849 then begin if curval=32768 then curval:=
524288 else curval:=((curval div 4096)*65536)+(curval mod 4096);
if(a>=4)then geqdefine(p,138,curval)else eqdefine(p,138,curval);
end else if curval1=113977 then begin curval:=((curval div 65536)*256)+(
curval mod 256);
if(a>=4)then geqdefine(p-128,138,curval)else eqdefine(p-128,138,curval);
end else if curval1=114701 then begin if curval>=0 then begin curval1:=
curval div 4096;curval1:=(curval1 div 4096)*65536+curval1 mod 4096;
curval:=curval mod 4096;
if(a>=4)then delgeqworddefine(p,curval1,curval)else deleqworddefine(p,
curval1,curval);
end else if(a>=4)then delgeqworddefine(p,-1,curval)else deleqworddefine(
p,-1,curval);
end else if(a>=4)then geqdefine(p,138,curval)else eqdefine(p,138,curval)
;end;end;{:1275}{1278:}99:begin p:=curchr;scanbigfourbitint;p:=p+curval;
scanoptionalequals;scanfontident;
if(a>=4)then geqdefine(p,138,curval)else eqdefine(p,138,curval);end;
{:1278}{1279:}104,105,106,107:doregistercommand(a);
{:1279}{1285:}113:begin scanregisternum;
if(a>=4)then n:=1073807360+curval else n:=1073741824+curval;
scanoptionalequals;
if setboxallowed then scanbox(n)else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(784);
end;printesc(608);begin helpptr:=2;helpline[1]:=1426;helpline[0]:=1427;
end;error;end;end;{:1285}{1286:}92:alteraux;93:alterprevgraf;
94:alterpagesofar;95:alterinteger;96:alterboxdimen;
{:1286}{1292:}97:begin q:=curchr;scanoptionalequals;scanint;n:=curval;
if n<=0 then p:=-1073741823 else if q>50458 then begin n:=(curval div 2)
+1;p:=getnode(2*n+1);mem[p].hh.lh:=n;n:=curval;mem[p+1].int:=n;
for j:=p+2 to p+n+1 do begin scanint;mem[j].int:=curval;end;
if not odd(n)then mem[p+n+2].int:=0;end else begin p:=getnode(2*n+1);
mem[p].hh.lh:=n;for j:=1 to n do begin scandimen(false,false,false);
mem[p+2*j-1].int:=curval;scandimen(false,false,false);
mem[p+2*j].int:=curval;end;end;
if(a>=4)then geqdefine(q,136,p)else eqdefine(q,136,p);end;
{:1292}{1296:}114:if curchr=1 then begin ifdef('INITEX')if iniversion
then begin newpatterns;goto 30;end;
endif('INITEX')begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1431);
end;helpptr:=0;error;repeat gettoken;until curcmd=2;goto 10;
end else begin newhyphexceptions;goto 30;end;
{:1296}{1297:}87:begin findfontdimen(true);k:=curval;scanoptionalequals;
scandimen(false,false,false);fontinfo[k].int:=curval;end;
88:begin n:=curchr;scanfontident;f:=curval;scanoptionalequals;scanint;
if n=0 then hyphenchar[f]:=curval else skewchar[f]:=curval;end;
{:1297}{1300:}103,102,101:newfont(a);{:1300}{1308:}115:newinteraction;
{:1308}{1684:}91:begin p:=curchr;scanint;n:=curval;scanoptionalequals;
scanint;
if not ischarkanji(curval)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1669);
end;if curval<0 then printint(curval)else printhex(curval);
printchar(41);begin helpptr:=1;helpline[0]:=1670;end;error;goto 10;
end else if(n<0)or(n>9)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1671);
end;printint(n);printchar(41);begin helpptr:=1;helpline[0]:=1670;end;
error;goto 10;
end else if(a>=4)then geqdefine(78127+n,n,toDVI(curval))else eqdefine(
78127+n,n,toDVI(curval));end;
{:1684}{1690:}116:begin if curchr<2 then p:=51756 else begin p:=51757;
curchr:=(curchr mod 2);end;
if(a>=4)then geqdefine(p,138,curchr)else eqdefine(p,138,curchr);end;
117:if(a>=4)then geqdefine(51758,138,curchr)else eqdefine(51758,138,
curchr);{:1690}{1697:}90:begin p:=curchr;scanint;n:=curval;
scanoptionalequals;scanint;
if ischarkanji(n)then begin j:=getinhibitpos(n,0);
if(j<>10000)and(curval>2)then begin if(a>=4)or(curlevel=1)then curval:=4
else curval:=3;
end else if j=10000 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1694);
end;begin helpptr:=1;helpline[0]:=1670;end;error;goto 10;end;
if(a>=4)then geqdefine(76079+j,curval,n)else eqdefine(76079+j,curval,n);
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1695);
end;if n<0 then printint(n)else printhex(n);printchar(41);
begin helpptr:=1;helpline[0]:=1670;end;error;goto 10;end;end;
{:1697}{1702:}89:begin p:=curchr;scanint;n:=curval;scanoptionalequals;
scanint;
if ischarascii(n)or ischarkanji(n)then begin j:=getkinsokupos(n,0);
if(j<>10000)and(curval=0)and((a>=4)or(curlevel=1))then if(a>=4)then
geqdefine(77103+j,3,0)else eqdefine(77103+j,3,0)else begin if j=10000
then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1701);
end;begin helpptr:=1;helpline[0]:=1670;end;error;goto 10;end;
if(p=1)or(p=2)then begin if(a>=4)then geqdefine(77103+j,p,n)else
eqdefine(77103+j,p,n);
if(a>=4)then geqworddefine(115238+j,curval)else eqworddefine(115238+j,
curval);end else confusion(1702);
end end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1703);
end;if p=1 then print(456)else if p=2 then print(457)else printchar(63);
print(1704);if n<0 then printint(n)else printhex(n);printchar(41);
begin helpptr:=1;helpline[0]:=1670;end;error;goto 10;end;end;
{:1702}others:confusion(1381)end;
30:{1313:}if aftertoken<>0 then begin curtok:=aftertoken;backinput;
aftertoken:=0;end{:1313};10:end;{:1254}{1314:}procedure doassignments;
label 10;begin while true do begin{440:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:440};if curcmd<=80 then goto 10;
setboxallowed:=false;prefixedcommand;setboxallowed:=true;end;10:end;
{:1314}{1319:}procedure openorclosein;var c:0..1;n:0..15;
begin c:=curchr;scanfourbitint;n:=curval;
if readopen[n]<>2 then begin aclose(readfile[n]);readopen[n]:=2;end;
if c<>0 then begin scanoptionalequals;scanfilename;
packfilename(curname,curarea,curext);texinputtype:=0;
if kpseinnameok(stringcast(nameoffile+1))and aopenin(readfile[n],
kpsetexformat)then readopen[n]:=1;end;end;
{:1319}{1323:}procedure issuemessage;var oldsetting:0..21;c:0..1;
s:strnumber;begin c:=curchr;mem[memtop-12].hh.rh:=scantoks(false,true);
oldsetting:=selector;selector:=21;tokenshow(defref);
selector:=oldsetting;flushlist(defref);
begin if poolptr+1>poolsize then overflow(260,poolsize-initpoolptr);end;
s:=makestring;
if c=0 then{1324:}begin if termoffset+(strstart[s+1]-strstart[s])>
maxprintline-2 then println else if(termoffset>0)or(fileoffset>0)then
printchar(32);slowprint(s);fflush(stdout);
end{:1324}else{1327:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(349);
end;slowprint(s);
if eqtb[50467].hh.rh<>-1073741823 then useerrhelp:=true else if
longhelpseen then begin helpptr:=1;helpline[0]:=1447;
end else begin if interaction<3 then longhelpseen:=true;
begin helpptr:=4;helpline[3]:=1448;helpline[2]:=1449;helpline[1]:=1450;
helpline[0]:=1451;end;end;error;useerrhelp:=false;end{:1327};
begin decr(strptr);poolptr:=strstart[strptr];end;end;
{:1323}{1332:}procedure shiftcase;var b:halfword;p:halfword;t:halfword;
c:sixteenbits;begin b:=curchr;p:=scantoks(false,false);
p:=mem[defref].hh.rh;
while p<>-1073741823 do begin{1333:}t:=mem[p].hh.lh;
if(t<536882816)and(checkkanji(t)<2)then begin c:=t mod 65536;
if eqtb[b+c].hh.rh<>0 then mem[p].hh.lh:=t-c+eqtb[b+c].hh.rh;end{:1333};
p:=mem[p].hh.rh;end;begintokenlist(mem[defref].hh.rh,3);
begin mem[defref].hh.rh:=avail;avail:=defref;ifdef('STAT')decr(dynused);
endif('STAT')end;end;{:1332}{1337:}procedure showwhatever;label 50;
var p:halfword;t:smallnumber;m:0..4;l:integer;n:integer;
begin case curchr of 3:begin{1795:}if(eqtb[114428].int>=0)and(eqtb[
114428].int<16)and writeopen[eqtb[114428].int]then selector:=eqtb[114428
].int;{:1795}begindiagnostic;showactivities;end;
1:{1340:}begin scanregisternum;
if curval<256 then p:=eqtb[50729+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-1073741823 then p:=-1073741823 else p:=mem[curptr+1].hh.rh;
end;
{1795:}if(eqtb[114428].int>=0)and(eqtb[114428].int<16)and writeopen[eqtb
[114428].int]then selector:=eqtb[114428].int;{:1795}begindiagnostic;
printnl(1468);printint(curval);printchar(61);
if p=-1073741823 then print(438)else showbox(p);end{:1340};
0:{1338:}begin gettoken;
{1795:}if(eqtb[114428].int>=0)and(eqtb[114428].int<16)and writeopen[eqtb
[114428].int]then selector:=eqtb[114428].int;
{:1795}if interaction=3 then;printnl(1464);
if curcs<>0 then begin sprintcs(curcs);printchar(61);end;printmeaning;
goto 50;end{:1338};
7:{1691:}begin{1795:}if(eqtb[114428].int>=0)and(eqtb[114428].int<16)and
writeopen[eqtb[114428].int]then selector:=eqtb[114428].int;
{:1795}printnl(1464);
if eqtb[51756].hh.rh>0 then print(1687)else print(1688);printnl(1464);
if eqtb[51757].hh.rh>0 then print(1689)else print(1690);goto 50;
end{:1691};
{1454:}4:begin{1795:}if(eqtb[114428].int>=0)and(eqtb[114428].int<16)and
writeopen[eqtb[114428].int]then selector:=eqtb[114428].int;
{:1795}begindiagnostic;showsavegroups;end;
{:1454}{1468:}6:begin{1795:}if(eqtb[114428].int>=0)and(eqtb[114428].int<
16)and writeopen[eqtb[114428].int]then selector:=eqtb[114428].int;
{:1795}begindiagnostic;printnl(349);println;
if condptr=-1073741823 then begin printnl(386);print(1596);
end else begin p:=condptr;n:=0;repeat incr(n);p:=mem[p].hh.rh;
until p=-1073741823;p:=condptr;t:=curif;l:=ifline;m:=iflimit;
repeat printnl(1597);printint(n);print(657);printcmdchr(123,t);
if m=2 then printesc(934);if l<>0 then begin print(1595);printint(l);
end;decr(n);t:=mem[p].hh.b1;l:=mem[p+1].int;m:=mem[p].hh.b0;
p:=mem[p].hh.rh;until p=-1073741823;end;end;
{:1468}others:{1341:}begin p:=thetoks;
{1795:}if(eqtb[114428].int>=0)and(eqtb[114428].int<16)and writeopen[eqtb
[114428].int]then selector:=eqtb[114428].int;
{:1795}if interaction=3 then;printnl(1464);tokenshow(memtop-3);
flushlist(mem[memtop-3].hh.rh);goto 50;end{:1341}end;
{1342:}enddiagnostic(true);begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1469);
end;if selector=19 then if eqtb[114390].int<=0 then begin selector:=17;
print(1470);selector:=19;end{:1342};
50:if selector<16 then begin println;
{77:}if interaction=0 then selector:=16 else selector:=17{:77};
if logopened then selector:=selector+2;
end else begin if interaction<3 then begin helpptr:=0;decr(errorcount);
end else if eqtb[114390].int>0 then begin begin helpptr:=3;
helpline[2]:=1459;helpline[1]:=1460;helpline[0]:=1461;end;
end else begin begin helpptr:=5;helpline[4]:=1459;helpline[3]:=1460;
helpline[2]:=1461;helpline[1]:=1462;helpline[0]:=1463;end;end;error;end;
end;{:1337}{1346:}ifdef('INITEX')procedure storefmtfile;
label 41,42,31,32;var j,k,l:integer;p,q:halfword;x:integer;
w:fourquarters;formatengine:^ASCIIcode;
begin{1348:}if saveptr<>0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1472);
end;begin helpptr:=1;helpline[0]:=1473;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end{:1348};
{1372:}selector:=21;print(1489);print(jobname);printchar(32);
printint(eqtb[114384].int);printchar(46);printint(eqtb[114383].int);
printchar(46);printint(eqtb[114382].int);printchar(41);
if interaction=0 then selector:=18 else selector:=19;
begin if poolptr+1>poolsize then overflow(260,poolsize-initpoolptr);end;
formatident:=makestring;packjobname(942);
while not wopenout(fmtfile)do promptfilename(1490,942);printnl(1491);
slowprint(wmakenamestring(fmtfile));begin decr(strptr);
poolptr:=strstart[strptr];end;printnl(349);
slowprint(formatident){:1372};{1351:}dumpint(1462916184);
x:=strlen(enginename);formatengine:=xmallocarray(ASCIIcode,x+4);
strcpy(stringcast(formatengine),enginename);
for k:=x to x+3 do formatengine[k]:=0;x:=x+4-(x mod 4);dumpint(x);
dumpthings(formatengine[0],x);libcfree(formatengine);dumpkanji(fmtfile);
dumpint(457706218);{1656:}dumpthings(xord[0],256);
dumpthings(xchr[0],256);dumpthings(xprn[0],256);{:1656};
dumpint(1073741823);dumpint(hashhigh);{1431:}dumpint(eTeXmode);
for j:=0 to-0 do eqtb[114444+j].int:=0;
{:1431}{1539:}while pseudofiles<>-1073741823 do pseudoclose;
{:1539}dumpint(membot);dumpint(memtop);dumpint(116261);dumpint(8501);
dumpint(607){:1351};{1673:}dumpint(1296847960);
if mltexp then dumpint(1)else dumpint(0);{:1673};
{1353:}dumpint(poolptr);dumpint(strptr);
dumpthings(strstart[0],strptr+1);
for k:=0 to strptr do dumpint(strstart[k]);k:=0;
while k+4<poolptr do begin w.b0:=strpool[k];w.b1:=strpool[k+1];
w.b2:=strpool[k+2];w.b3:=strpool[k+3];dumpqqqq(w);k:=k+4;end;
k:=poolptr-4;w.b0:=strpool[k];w.b1:=strpool[k+1];w.b2:=strpool[k+2];
w.b3:=strpool[k+3];dumpqqqq(w);println;printint(strptr);print(1474);
printint(poolptr){:1353};{1355:}sortavail;varused:=0;dumpint(lomemmax);
dumpint(rover);if(eTeXmode=1)then for k:=0 to 5 do dumpint(saroot[k]);
p:=membot;q:=rover;x:=0;repeat dumpthings(mem[p],q+2-p);x:=x+q+2-p;
varused:=varused+q-p;p:=q+mem[q].hh.lh;q:=mem[q+1].hh.rh;until q=rover;
varused:=varused+lomemmax-p;dynused:=memend+1-himemmin;
dumpthings(mem[p],lomemmax+1-p);x:=x+lomemmax+1-p;dumpint(himemmin);
dumpint(avail);dumpthings(mem[himemmin],memend+1-himemmin);
x:=x+memend+1-himemmin;p:=avail;
while p<>-1073741823 do begin decr(dynused);p:=mem[p].hh.rh;end;
dumpint(varused);dumpint(dynused);println;printint(x);print(1475);
printint(varused);printchar(38);printint(dynused){:1355};
{1357:}{1359:}k:=1;repeat j:=k;
while j<114360 do begin if(eqtb[j].hh.rh=eqtb[j+1].hh.rh)and(eqtb[j].hh.
b0=eqtb[j+1].hh.b0)and(eqtb[j].hh.b1=eqtb[j+1].hh.b1)then goto 41;
incr(j);end;l:=114361;goto 31;41:incr(j);l:=j;
while j<114360 do begin if(eqtb[j].hh.rh<>eqtb[j+1].hh.rh)or(eqtb[j].hh.
b0<>eqtb[j+1].hh.b0)or(eqtb[j].hh.b1<>eqtb[j+1].hh.b1)then goto 31;
incr(j);end;31:dumpint(l-k);dumpthings(eqtb[k],l-k);k:=j+1;dumpint(k-l);
until k=114361{:1359};{1360:}repeat j:=k;
while j<116261 do begin if(eqtb[j].int=eqtb[j+1].int)and(getintone(eqtb[
j])=getintone(eqtb[j+1]))then goto 42;incr(j);end;l:=116262;goto 32;
42:incr(j);l:=j;
while j<116261 do begin if(eqtb[j].int<>eqtb[j+1].int)or(getintone(eqtb[
j])<>getintone(eqtb[j+1]))then goto 32;incr(j);end;32:dumpint(l-k);
dumpthings(eqtb[k],l-k);k:=j+1;dumpint(k-l);until k>116261;
if hashhigh>0 then dumpthings(eqtb[116262],hashhigh);{:1360};
dumpint(parloc);dumpint(writeloc);
{1362:}for p:=0 to 2100 do dumphh(prim[p]);dumpint(hashused);
cscount:=38809-hashused+hashhigh;
for p:=23810 to hashused do if hash[p].rh<>0 then begin dumpint(p);
dumphh(hash[p]);incr(cscount);end;
dumpthings(hash[hashused+1],49923-hashused);
if hashhigh>0 then dumpthings(hash[116262],hashhigh);dumpint(cscount);
println;printint(cscount);print(1476){:1362}{:1357};
{1364:}dumpint(fmemptr);dumpthings(fontinfo[0],fmemptr);
dumpint(fontptr);{1366:}begin dumpthings(fontdir[0],fontptr+1);
dumpthings(fontenc[0],fontptr+1);dumpthings(fontnumext[0],fontptr+1);
dumpthings(fontcheck[0],fontptr+1);dumpthings(fontsize[0],fontptr+1);
dumpthings(fontdsize[0],fontptr+1);dumpthings(fontparams[0],fontptr+1);
dumpthings(hyphenchar[0],fontptr+1);dumpthings(skewchar[0],fontptr+1);
dumpthings(fontname[0],fontptr+1);dumpthings(fontarea[0],fontptr+1);
dumpthings(fontbc[0],fontptr+1);dumpthings(fontec[0],fontptr+1);
dumpthings(ctypebase[0],fontptr+1);dumpthings(charbase[0],fontptr+1);
dumpthings(widthbase[0],fontptr+1);dumpthings(heightbase[0],fontptr+1);
dumpthings(depthbase[0],fontptr+1);dumpthings(italicbase[0],fontptr+1);
dumpthings(ligkernbase[0],fontptr+1);dumpthings(kernbase[0],fontptr+1);
dumpthings(extenbase[0],fontptr+1);dumpthings(parambase[0],fontptr+1);
dumpthings(fontglue[0],fontptr+1);dumpthings(bcharlabel[0],fontptr+1);
dumpthings(fontbchar[0],fontptr+1);
dumpthings(fontfalsebchar[0],fontptr+1);
for k:=0 to fontptr do begin printnl(1480);printesc(hash[40923+k].rh);
printchar(61);printfilename(fontname[k],fontarea[k],349);
if fontsize[k]<>fontdsize[k]then begin print(888);
printscaled(fontsize[k]);print(425);end;end;end{:1366};println;
printint(fmemptr-7);print(1477);printint(fontptr-0);
if fontptr<>1 then print(1478)else print(1479){:1364};
{1368:}dumpint(hyphcount);if hyphnext<=607 then hyphnext:=hyphsize;
dumpint(hyphnext);
for k:=0 to hyphsize do if hyphword[k]<>0 then begin dumpint(k+65536*
hyphlink[k]);dumpint(hyphword[k]);dumpint(hyphlist[k]);end;println;
printint(hyphcount);if hyphcount<>1 then print(1481)else print(1482);
if trienotready then inittrie;dumpint(triemax);dumpint(hyphstart);
dumpthings(trietrl[0],triemax+1);dumpthings(trietro[0],triemax+1);
dumpthings(trietrc[0],triemax+1);dumpint(trieopptr);
dumpthings(hyfdistance[1],trieopptr);dumpthings(hyfnum[1],trieopptr);
dumpthings(hyfnext[1],trieopptr);printnl(1483);printint(triemax);
print(1484);printint(trieopptr);
if trieopptr<>1 then print(1485)else print(1486);print(1487);
printint(trieopsize);
for k:=255 downto 0 do if trieused[k]>0 then begin printnl(958);
printint(trieused[k]);print(1488);printint(k);dumpint(k);
dumpint(trieused[k]);end{:1368};{1370:}dumpint(interaction);
dumpint(formatident);dumpint(69069);eqtb[114392].int:=0{:1370};
{1373:}wclose(fmtfile){:1373};end;
endif('INITEX'){:1346}{1392:}{1393:}procedure newwhatsit(s:smallnumber;
w:smallnumber);var p:halfword;begin p:=getnode(w);mem[p].hh.b0:=10;
mem[p].hh.b1:=s;mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
end;{:1393}{1394:}procedure newwritewhatsit(w:smallnumber);
begin newwhatsit(curchr,w);
if w<>2 then scanfourbitint else begin scanint;
if curval<0 then curval:=17 else if(curval>15)and(curval<>18)then curval
:=16;end;mem[curlist.tailfield+1].hh.lh:=curval;
curlist.inhibitglueflagfield:=false;end;
{:1394}{1422:}procedure eptexsetinputencoding;var j,k:integer;
begin scanfilename;packfilename(curname,curarea,curext);
if curinput.statefield=0 then begin k:=inputptr-1;j:=-1;
while k>=0 do begin if inputstack[k].statefield=0 then decr(k)else if
inputstack[k].namefield>19 then begin j:=inputstack[k].indexfield;k:=-1;
end else begin j:=-(inputstack[k].namefield+1);k:=-1;
end end end else if curinput.namefield>19 then j:=curinput.indexfield
else j:=-(curinput.namefield+1);
if(j>=0)or(j=-1)or(j=-18)then begin k:=true;
if j>=0 then k:=setinfileenc(inputfile[j],stringcast(nameoffile+1))else
k:=setstdinenc(stringcast(nameoffile+1));
if k=false then begin begindiagnostic;printnl(1532);slowprint(curarea);
slowprint(curname);slowprint(curext);print(39);enddiagnostic(false);
end end else begin begindiagnostic;j:=-j-1;println;printnl(1533);
printnl(1534);if j>=18 then print(1535)else begin print(1536);
printint(j);print(46);end;enddiagnostic(false);end end;
{:1422}{1780:}procedure comparestrings;label 30;var s1,s2:strnumber;
i1,i2,j1,j2:poolpointer;c1,c2:integer;savecurcs:halfword;
begin savecurcs:=curcs;begin if scantoks(false,true)<>0 then end;
isprintutf8:=true;s1:=tokenstostring(defref);isprintutf8:=false;
deletetokenref(defref);curcs:=savecurcs;
begin if scantoks(false,true)<>0 then end;isprintutf8:=true;
s2:=tokenstostring(defref);isprintutf8:=false;deletetokenref(defref);
i1:=strstart[s1];j1:=strstart[s1+1];i2:=strstart[s2];j2:=strstart[s2+1];
while(i1<j1)and(i2<j2)do begin if strpool[i1]>=256 then c1:=strpool[i1]
-256 else c1:=strpool[i1];
if strpool[i2]>=256 then c2:=strpool[i2]-256 else c2:=strpool[i2];
if c1<c2 then begin curval:=-1;goto 30;
end else if c1>c2 then begin curval:=1;goto 30;end;incr(i1);incr(i2);
end;if(i1=j1)and(i2=j2)then curval:=0 else if i1<j1 then curval:=1 else
curval:=-1;30:flushstr(s2);flushstr(s1);curvallevel:=0;end;
{:1780}{1788:}procedure scanpdfexttoks;
begin begin if scantoks(false,true)<>0 then end;end;
{:1788}procedure doextension;var k:integer;p:halfword;
begin case curchr of 0:{1395:}begin newwritewhatsit(3);
scanoptionalequals;scanfilename;mem[curlist.tailfield+1].hh.rh:=curname;
mem[curlist.tailfield+2].hh.lh:=curarea;
mem[curlist.tailfield+2].hh.rh:=curext;end{:1395};
1:{1396:}begin k:=curcs;newwritewhatsit(2);curcs:=k;
p:=scantoks(false,false);mem[curlist.tailfield+1].hh.rh:=defref;
end{:1396};2:{1397:}begin newwritewhatsit(2);
mem[curlist.tailfield+1].hh.rh:=-1073741823;end{:1397};
3:{1398:}begin if scankeyword(1237)then begin newwhatsit(4,2);
mem[curlist.tailfield+1].hh.lh:=-1073741823;p:=scantoks(false,false);
mem[curlist.tailfield+1].hh.rh:=defref;end else begin newwhatsit(3,2);
mem[curlist.tailfield+1].hh.lh:=-1073741823;p:=scantoks(false,true);
mem[curlist.tailfield+1].hh.rh:=defref;end;
curlist.inhibitglueflagfield:=false;end{:1398};5:{1419:}begin getxtoken;
if(curcmd=65)and(curchr<=2)then begin k:=curlist.inhibitglueflagfield;
p:=curlist.tailfield;doextension;outwhat(curlist.tailfield);
flushnodelist(curlist.tailfield);curlist.tailfield:=p;
mem[p].hh.rh:=-1073741823;curlist.inhibitglueflagfield:=k;
end else backinput;end{:1419};
6:{1421:}if abs(curlist.modefield)<>120 then reportillegalcase else
begin curlist.inhibitglueflagfield:=false;newwhatsit(5,2);scanint;
if curval<=0 then curlist.auxfield.hh.rh:=0 else if curval>255 then
curlist.auxfield.hh.rh:=0 else curlist.auxfield.hh.rh:=curval;
mem[curlist.tailfield+1].hh.rh:=curlist.auxfield.hh.rh;
mem[curlist.tailfield+1].hh.b0:=normmin(eqtb[114413].int);
mem[curlist.tailfield+1].hh.b1:=normmin(eqtb[114414].int);end{:1421};
8:{1782:}begin newwhatsit(8,2);curlist.inhibitglueflagfield:=false;
end{:1782};9:{1791:}begin scanint;if curval<0 then curval:=-curval;
randomseed:=curval;initrandoms(randomseed);end{:1791};
10:{1792:}begin secondsandmicros(epochseconds,microseconds);end{:1792};
7:{1423:}eptexsetinputencoding{:1423};others:confusion(1512)end;end;
{:1392}{1420:}procedure fixlanguage;var l:ASCIIcode;
begin if eqtb[114412].int<=0 then l:=0 else if eqtb[114412].int>255 then
l:=0 else l:=eqtb[114412].int;
if l<>curlist.auxfield.hh.rh then begin curlist.inhibitglueflagfield:=
false;newwhatsit(5,2);mem[curlist.tailfield+1].hh.rh:=l;
curlist.auxfield.hh.rh:=l;
mem[curlist.tailfield+1].hh.b0:=normmin(eqtb[114413].int);
mem[curlist.tailfield+1].hh.b1:=normmin(eqtb[114414].int);end;end;
{:1420}{1729:}procedure setmathkchar(c:integer);var p:halfword;
begin p:=newnoad;mem[p+1].hh.rh:=6;mem[p+1].hh.b1:=0;mem[p+4].hh.lh:=c;
mem[p+1].hh.b0:=eqtb[114406].int;
if fontdir[eqtb[50986+mem[p+1].hh.b0+cursize].hh.rh]=0 then begin begin
if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1330);
end;begin helpptr:=1;helpline[0]:=1329;end;error;end;mem[p].hh.b0:=18;
mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;end;
{:1729}{1735:}procedure changepagedirection(d:halfword);label 30;
var p:halfword;flag:boolean;begin flag:=(pagecontents=0);
if flag and(curlist.headfield<>curlist.tailfield)then begin p:=mem[
curlist.headfield].hh.rh;
while p<>-1073741823 do case mem[p].hh.b0 of 0,1,2,3,4:begin flag:=false
;goto 30;end;others:p:=mem[p].hh.rh;end;30:;end;
if flag then begin curlist.dirfield:=d;pagedir:=d;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1245);
end;printcmdchr(curcmd,d);print(1712);begin helpptr:=3;
helpline[2]:=1713;helpline[1]:=1714;helpline[0]:=1715;end;error;end;end;
{:1735}{1793:}procedure insertsrcspecial;var toklist,p,q:halfword;
begin if(sourcefilenamestack[inopen]>0 and isnewsource(
sourcefilenamestack[inopen],line))then begin toklist:=getavail;
p:=toklist;mem[p].hh.lh:=536909731;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=65659;
q:=strtoks(makesrcspecial(sourcefilenamestack[inopen],line));
mem[p].hh.rh:=mem[memtop-3].hh.rh;p:=q;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=131197;begintokenlist(toklist,4);
remembersourceinfo(sourcefilenamestack[inopen],line);end;end;
procedure appendsrcspecial;var q:halfword;
begin if(sourcefilenamestack[inopen]>0 and isnewsource(
sourcefilenamestack[inopen],line))then begin newwhatsit(3,2);
mem[curlist.tailfield+1].hh.lh:=0;defref:=getavail;
mem[defref].hh.lh:=-1073741823;
q:=strtoks(makesrcspecial(sourcefilenamestack[inopen],line));
mem[defref].hh.rh:=mem[memtop-3].hh.rh;
mem[curlist.tailfield+1].hh.rh:=defref;
remembersourceinfo(sourcefilenamestack[inopen],line);end;end;
{:1793}{1111:}procedure handlerightbrace;var p,q:halfword;r:halfword;
d:scaled;f:integer;begin case curgroup of 1:unsave;
0:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1216);
end;begin helpptr:=2;helpline[1]:=1217;helpline[0]:=1218;end;error;end;
14,15,16:extrarightbrace;
{1128:}2:begin adjusthlist(curlist.headfield,false);package(0);end;
3:begin adjusthlist(curlist.headfield,false);adjusttail:=memtop-5;
preadjusttail:=memtop-14;package(0);end;
4:if(eqtb[114427].int>0)and(curlist.modefield=120)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;package(0);end;
5:if(eqtb[114427].int>0)and(curlist.modefield=120)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;package(4);end;
{:1128}{1143:}11:if(eqtb[114427].int>1)and(curlist.modefield=120)then
begin backinput;curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;q:=eqtb[49935].hh.rh;incr(mem[q].hh.rh);
d:=eqtb[114963].int;f:=eqtb[114403].int;unsave;saveptr:=saveptr-2;
p:=vpackage(mem[curlist.headfield].hh.rh,0,1,1073741823);
mem[p].hh.b1:=((mem[p].hh.b1)div 16)*16+curlist.dirfield+5;popnest;
if savestack[saveptr+0].int<255 then begin r:=getnode(6);
mem[r].hh.b0:=4;mem[r].hh.b1:=savestack[saveptr+0].int;
mem[r+3].int:=mem[p+3].int+mem[p+2].int;mem[r+4].hh.lh:=mem[p+5].hh.rh;
mem[r+4].hh.rh:=q;mem[r+2].int:=d;mem[r+1].int:=f;
mem[r+5].hh.b1:=((mem[p].hh.b1)mod 16-5)+5;
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin mem[curlist.pnodefield].hh.rh:=r;
mem[mem[curlist.pnodefield].hh.rh].hh.rh:=curlist.tailfield;
curlist.pnodefield:=mem[curlist.pnodefield].hh.rh;
end else begin mem[curlist.tailfield].hh.rh:=r;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
end else begin if abs(((mem[p].hh.b1)mod 16-5))<>abs(curlist.adjdirfield
)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1278);
end;begin helpptr:=1;helpline[0]:=1279;end;error;
flushnodelist(mem[p+5].hh.rh);end else begin r:=getnode(2);
mem[r].hh.b0:=7;mem[r].hh.b1:=savestack[saveptr+1].int;
mem[r+1].int:=mem[p+5].hh.rh;deleteglueref(q);
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin mem[curlist.pnodefield].hh.rh:=r;
mem[mem[curlist.pnodefield].hh.rh].hh.rh:=curlist.tailfield;
curlist.pnodefield:=mem[curlist.pnodefield].hh.rh;
end else begin mem[curlist.tailfield].hh.rh:=r;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
deleteglueref(mem[p+7].hh.rh);deleteglueref(mem[p+7].hh.lh);
freenode(p,10);if nestptr=0 then buildpage;end;
8:if(eqtb[114427].int>1)and(curlist.modefield=120)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=4;
end else{1068:}begin while(curinput.statefield=0)and(curinput.locfield=
-1073741823)and(curinput.indexfield=3)do endtokenlist;
if(curinput.statefield<>0)or(curinput.locfield<>-1073741823)or(curinput.
indexfield<>6)then{1069:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(685);
end;begin helpptr:=2;helpline[1]:=1183;helpline[0]:=1184;end;error;
repeat gettoken;until curinput.locfield=-1073741823;end{:1069};
outputcanend:=true;endtokenlist;outputcanend:=false;endgraf;unsave;
outputactive:=false;insertpenalties:=0;
{1070:}if eqtb[50984].hh.rh<>-1073741823 then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(265);
print(1185);end;printesc(437);printint(255);begin helpptr:=3;
helpline[2]:=1186;helpline[1]:=1187;helpline[0]:=1188;end;boxerror(255);
end{:1070};
if curlist.tailfield<>curlist.headfield then begin mem[pagetail].hh.rh:=
mem[curlist.headfield].hh.rh;pagetail:=curlist.tailfield;end;
if mem[memtop-2].hh.rh<>-1073741823 then begin if mem[memtop-1].hh.rh=
-1073741823 then nest[0].tailfield:=pagetail;
mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;
mem[memtop-1].hh.rh:=mem[memtop-2].hh.rh;
mem[memtop-2].hh.rh:=-1073741823;pagetail:=memtop-2;end;
flushnodelist(discptr[2]);discptr[2]:=-1073741823;popnest;buildpage;
end{:1068};{:1143}{1161:}10:builddiscretionary;
{:1161}{1175:}6:begin backinput;curtok:=536909722;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(720);
end;printesc(1068);print(721);begin helpptr:=1;helpline[0]:=1324;end;
inserror;end;
{:1175}{1176:}7:if(eqtb[114427].int>1)and(curlist.modefield=120)then
begin backinput;curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;unsave;alignpeek;end;
{:1176}{1211:}12:if(eqtb[114427].int>0)and(curlist.modefield=120)then
begin backinput;curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;unsave;saveptr:=saveptr-2;
p:=vpackage(mem[curlist.headfield].hh.rh,savestack[saveptr+1].int,
savestack[saveptr+0].int,1073741823);
mem[p].hh.b1:=((mem[p].hh.b1)div 16)*16+curlist.dirfield+5;popnest;
if abs(((mem[p].hh.b1)mod 16-5))<>abs(curlist.dirfield)then p:=
newdirnode(p,abs(curlist.dirfield));
begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=31;mem[curlist.tailfield+1].hh.rh:=2;
mem[curlist.tailfield+1].hh.lh:=p;end;{:1211}{1216:}13:buildchoices;
{:1216}{1229:}9:begin unsave;decr(saveptr);
mem[savestack[saveptr+0].int].hh.rh:=4;p:=finmlist(-1073741823);
mem[savestack[saveptr+0].int].hh.lh:=p;
if p<>-1073741823 then if mem[p].hh.rh=-1073741823 then if mem[p].hh.b0=
18 then begin if mem[p+3].hh.rh=0 then if((mem[p+2].hh.rh=0)and(mem[p+4]
.hh.lh=-1073741823))then begin mem[savestack[saveptr+0].int].hh:=mem[p+1
].hh;freenode(p,5);end;
end else if mem[p].hh.b0=30 then if savestack[saveptr+0].int=curlist.
tailfield+1 then if mem[curlist.tailfield].hh.b0=18 then{1230:}begin q:=
curlist.headfield;
while mem[q].hh.rh<>curlist.tailfield do q:=mem[q].hh.rh;
mem[q].hh.rh:=p;freenode(curlist.tailfield,5);curlist.tailfield:=p;
end{:1230};end;{:1229}others:confusion(1219)end;end;
{:1111}procedure maincontrol;
label 60,21,70,80,130,131,133,141,150,90,91,92,95,100,101,110,111,112,
120,10;var t:integer;cx:KANJIcode;cy:sixteenbits;kp:halfword;
gp,gq:halfword;disp:scaled;inskp:boolean;
begin if eqtb[50465].hh.rh<>-1073741823 then begintokenlist(eqtb[50465].
hh.rh,12);60:getxtoken;
21:{1073:}if interrupt<>0 then if OKtointerrupt then begin backinput;
begin if interrupt<>0 then pauseforinstructions;end;goto 60;end;
ifdef('TEXMF_DEBUG')if panicking then checkmem(false);
endif('TEXMF_DEBUG')if eqtb[114397].int>0 then showcurcmdchr{:1073};
inskp:=false;case abs(curlist.modefield)+curcmd of 131,132:goto 70;
136,137,138,139,140:goto 130;
194:if checkecharrange(curchr)then goto 70 else begin curcmd:=eqtb[
63663+kcatcodekey(curchr)].hh.rh;if(curcmd<=15)then curcmd:=18;goto 130;
end;195:begin curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;goto 130;
end;141:begin scancharnum;curchr:=curval;
if checkecharrange(curchr)then goto 70 else begin curcmd:=eqtb[63663+
kcatcodekey(curchr)].hh.rh;if(curcmd<=15)then curcmd:=18;goto 130;end;
end;142:begin scancharnum;curchr:=curval;
curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;goto 130;end;
191:begin getxtoken;
if(curcmd=11)or(curcmd=12)or((curcmd>=16)and(curcmd<=20))or(curcmd=74)or
(curcmd=21)or(curcmd=75)or(curcmd=22)then cancelboundary:=true;goto 21;
end;130:if curlist.auxfield.hh.lh=1000 then goto 120 else appspace;
190,309:goto 120;{1088:}1,120,239,11,249,310:;
46,165,284:begin if curchr=0 then begin{442:}repeat getxtoken;
until curcmd<>10{:442};goto 21;end else begin t:=scannerstatus;
scannerstatus:=0;getnext;scannerstatus:=t;
if curcs<23810 then curcs:=primlookup(curcs-11905)else curcs:=primlookup
(hash[curcs].rh);if curcs<>0 then begin curcmd:=eqtb[38822+curcs].hh.b0;
curchr:=eqtb[38822+curcs].hh.rh;curtok:=536909733+curcs;goto 21;end;end;
end;15:if itsallover then goto 10;
{1091:}29,147,266,79,198,317,{:1091}{1141:}45,{:1141}{1154:}51,{:1154}
{1187:}55,174,{:1187}7,126,245:reportillegalcase;
{1089:}8,127,9,128,24,143,77,196,78,197,57,176,16,135,56,175,59,178,73,
192,60,179,61,180,63,182,62,181,37,156,58,177,35,154,53,172,248,253,272,
269,278,281{:1089}:insertdollarsign;
252:if eqtb[114442].int=0 then insertdollarsign;
{1099:}43,161,280:begin begin mem[curlist.tailfield].hh.rh:=scanrulespec
;curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.inhibitglueflagfield:=false;
if abs(curlist.modefield)=1 then curlist.auxfield.int:=-65536000 else if
abs(curlist.modefield)=120 then curlist.auxfield.hh.lh:=1000;end;
{:1099}{1100:}34,152,271,273:appendglue;36,155,274,275:appendkern;
{:1100}{1106:}2,121:newsavelevel(1);68,187,306:newsavelevel(14);
69,188,307:if curgroup=14 then unsave else offsave;
{:1106}{1110:}3,122,241:handlerightbrace;
{:1110}{1116:}28,148,267:begin t:=curchr;scandimen(false,false,false);
if t=0 then scanbox(curval)else scanbox(-curval);end;
38,157,276:scanbox(1073872797+curchr);27,146,265:beginbox(0);
81,200,319:begin if curgroup<>6 then if curlist.modefield=120 then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1241);
end;printcmdchr(curcmd,curchr);print(39);begin helpptr:=2;
helpline[1]:=1242;helpline[0]:=1243;end;error;
end else if abs(curlist.modefield)=239 then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(265);
print(1241);end;printcmdchr(curcmd,curchr);print(39);begin helpptr:=1;
helpline[0]:=1244;end;error;
end else if nestptr=0 then changepagedirection(curchr)else if curlist.
headfield=curlist.tailfield then curlist.dirfield:=curchr else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(1245);
end;printcmdchr(curcmd,curchr);print(1246);begin helpptr:=2;
helpline[1]:=1247;helpline[0]:=1248;end;error;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(265);print(789);
end;printcmdchr(curcmd,curchr);print(1249);begin helpptr:=2;
helpline[1]:=1250;helpline[0]:=1251;end;error;end end;
{:1116}{1133:}50:newgraf(curchr>0);
12,13,22,75,23,76,4,30,42,52,54,33,40,17,18,19,20,21,71,72:begin
backinput;newgraf(true);end;{:1133}{1135:}169,288:indentinhmode;
{:1135}{1137:}14:begin normalparagraph;
if curlist.modefield>0 then buildpage;end;
133:begin if alignstate<0 then offsave;endgraf;
if curlist.modefield=1 then buildpage;end;
134,153,162,150,158:headforvmode;
{:1137}{1140:}44,163,282,164,283:begininsertoradjust;
25,144,263:makemark;{:1140}{1145:}49,168,287:appendpenalty;
{:1145}{1147:}32,151,270:deletelast;{:1147}{1152:}31,149,268:unpackage;
{:1152}{1155:}170:appenditaliccorrection;
289:begin mem[curlist.tailfield].hh.rh:=newkern(0);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
{:1155}{1159:}173,292:appenddiscretionary;{:1159}{1165:}171:makeaccent;
{:1165}{1169:}6,125,244,5,124,243:alignerror;41,160,279:noalignerror;
70,189,308:omiterror;{:1169}{1173:}39:initalign;
159:{1480:}if curchr>0 then begin if eTeXenabled((eqtb[114444].int>0),
curcmd,curchr)then begin mem[curlist.tailfield].hh.rh:=newmath(0,curchr)
;curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
end else{:1480}initalign;
277:if privileged then if curgroup=15 then initalign else offsave;
10,129:if(eqtb[114427].int>1)and(curlist.modefield=120)then begin
backinput;curtok:=partoken;backinput;curinput.indexfield:=4;
end else doendv;{:1173}{1177:}74,193,312:cserror;
{:1177}{1180:}123:initmath;
{:1180}{1183:}293:if privileged then if curgroup=15 then starteqno else
offsave;
{:1183}{1193:}240:begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;backinput;
scanmath(curlist.tailfield+1,curlist.tailfield+4);end;
{:1193}{1197:}250,251,313:if checkecharrange(curchr)then setmathchar(
eqtb[113849+curchr].hh.rh)else setmathkchar(curchr);
255,256,257,258,259:begin cx:=curchr;setmathkchar(cx);end;
260:begin scancharnum;curchr:=curval;
if checkecharrange(curchr)then setmathchar(eqtb[113849+curchr].hh.rh)
else setmathkchar(curchr);end;314:setmathkchar(curchr);
261:begin scancharnum;curchr:=curval;setmathkchar(curchr);end;
262:begin if curchr=0 then scanfifteenbitint else scanbigfifteenbitint;
setmathchar(curval);end;
315:begin setmathchar(((curchr div 4096)*65536)+(curchr mod 4096));end;
316:begin setmathchar(((curchr div 65536)*256)+(curchr mod 256));end;
254:begin if curchr=0 then scantwentysevenbitint else scanfiftyonebitint
;setmathchar(curval);end;
{:1197}{1201:}295:begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=curchr;
scanmath(curlist.tailfield+1,curlist.tailfield+4);end;
296:mathlimitswitch;{:1201}{1205:}311:mathradical;
{:1205}{1207:}290,291:mathac;{:1207}{1210:}301:begin scanspec(12,false);
normalparagraph;pushnest;curlist.modefield:=-1;
curlist.auxfield.int:=-65536000;
if(insertsrcspecialeveryvbox)then insertsrcspecial;
if eqtb[50464].hh.rh<>-1073741823 then begintokenlist(eqtb[50464].hh.rh,
11);end;
{:1210}{1214:}298:begin mem[curlist.tailfield].hh.rh:=newstyle(curchr);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
300:begin begin mem[curlist.tailfield].hh.rh:=newglue(membot);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=98;end;299:appendchoices;
{:1214}{1218:}247,246:subsup;{:1218}{1223:}297:mathfraction;
{:1223}{1233:}294:mathleftright;
{:1233}{1236:}242:if curgroup=15 then aftermath else offsave;
{:1236}{1253:}90,209,328,91,210,329,117,236,355,118,237,356,92,211,330,
82,201,320,83,202,321,84,203,322,103,222,341,104,223,342,85,204,323,86,
205,324,87,206,325,88,207,326,89,208,327,93,212,331,94,213,332,95,214,
333,96,215,334,97,216,335,98,217,336,99,218,337,100,219,338,101,220,339,
102,221,340,105,224,343,106,225,344,107,226,345,108,227,346,109,228,347,
110,229,348,111,230,349,112,231,350,113,232,351,114,233,352,115,234,353,
116,235,354:prefixedcommand;{:1253}{1312:}47,166,285:begin gettoken;
aftertoken:=curtok;end;{:1312}{1315:}48,167,286:begin gettoken;
saveforafter(curtok);end;119,238,357:begin gettoken;
if curcs>0 then begin parloc:=curcs;partoken:=curtok;end;end;
{:1315}{1318:}67,186,305:openorclosein;
{:1318}{1320:}65,184,303:issuemessage;
{:1320}{1329:}64,183,302:shiftcase;
{:1329}{1334:}26,145,264:showwhatever;
{:1334}{1693:}80,199,318:curlist.inhibitglueflagfield:=(curchr=0);
{:1693}{1391:}66,185,304:doextension;{:1391}{:1088}end;goto 60;
130:{1730:}if(curlist.tailfield>=himemmin)then begin if not((curlist.
lastjchrfield<>-1073741823)and(mem[curlist.lastjchrfield].hh.rh=curlist.
tailfield))then begin cx:=mem[curlist.tailfield].hh.b1;
{1706:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=2 then begin begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[
115238+kp].int);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1706};end;
end else if mem[curlist.tailfield].hh.b0=8 then begin cx:=mem[curlist.
tailfield+1].hh.b1;{1706:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=2 then begin begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[
115238+kp].int);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1706};end;
if curlist.dirfield=3 then begin if fontdir[mainf]=3 then disp:=0 else
if fontdir[mainf]=4 then disp:=eqtb[114978].int-eqtb[114979].int else
disp:=eqtb[114978].int;mainf:=eqtb[51755].hh.rh;
end else begin if fontdir[mainf]=4 then disp:=0 else if fontdir[mainf]=3
then disp:=eqtb[114979].int-eqtb[114978].int else disp:=eqtb[114979].int
;mainf:=eqtb[51754].hh.rh;end;
{1732:}if disp<>0 then begin if not(curlist.tailfield>=himemmin)and(mem[
curlist.tailfield].hh.b0=5)then begin mem[curlist.tailfield+1].int:=0;
end else begin curlist.pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=0;
curlist.pdispfield:=disp;curlist.dispcalledfield:=true end;end;{:1732};
inskp:=false;ligaturepresent:=false;curl:=getjfmpos(curchr,mainf);
maini:=fontinfo[charbase[mainf]+0].qqqq;goto 133;
131:curlist.auxfield.hh.lh:=1000;
if mainf<>0 then begin if(curcmd=20)then begin cx:=mem[mainp].hh.lh mod
16777216;
if(UVScombinecode(cx,curchr)>0)then begin cx:=UVScombinecode(cx,curchr);
if(eqtb[63663+kcatcodekey(cx)].hh.rh=16)and(cx>=16777216)then mem[mainp]
.hh.lh:=cx+23*16777216 else mem[mainp].hh.lh:=cx+eqtb[63663+kcatcodekey(
cx)].hh.rh*16777216;inskp:=false;
goto 150 end else if((mem[mainp].hh.lh div 16777216)=0 and(curq>0))then
begin cx:=mem[curq].hh.lh mod 16777216;kp:=getkinsokupos(cx,1);
if(UVScombinecode(cx,curchr)>0 and(kp<>10000)and(eqtb[115238+kp].int<>0)
and(eqtb[77103+kp].hh.b0=1))then begin cx:=UVScombinecode(cx,curchr);
if(eqtb[63663+kcatcodekey(cx)].hh.rh=16)and(cx>=16777216)then mem[curq].
hh.lh:=cx+23*16777216 else mem[curq].hh.lh:=cx+eqtb[63663+kcatcodekey(cx
)].hh.rh*16777216;inskp:=false;goto 150 end end end;
if not curlist.dispcalledfield then begin curlist.pnodefield:=curlist.
tailfield;begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=0;
curlist.dispcalledfield:=true end;begin mainp:=avail;
if mainp=-1073741823 then mainp:=getavail else begin avail:=mem[mainp].
hh.rh;mem[mainp].hh.rh:=-1073741823;ifdef('STAT')incr(dynused);
endif('STAT')end;end;mem[mainp].hh.b0:=mainf;mem[mainp].hh.b1:=curl;
mem[curlist.tailfield].hh.rh:=mainp;curlist.tailfield:=mainp;
curlist.lastjchrfield:=curlist.tailfield;begin mainp:=avail;
if mainp=-1073741823 then mainp:=getavail else begin avail:=mem[mainp].
hh.rh;mem[mainp].hh.rh:=-1073741823;ifdef('STAT')incr(dynused);
endif('STAT')end;end;
if(curcmd=16)and(curchr>=16777216)then mem[mainp].hh.lh:=curchr+23
*16777216 else if(curcmd>=16)and(curcmd<=20)then mem[mainp].hh.lh:=
curchr+curcmd*16777216 else if curcmd=15 then mem[mainp].hh.lh:=curchr
+18*16777216 else if curcmd=14 then mem[mainp].hh.lh:=curchr+eqtb[51759+
curchr].hh.rh*16777216 else mem[mainp].hh.lh:=curchr+eqtb[63663+
kcatcodekey(curchr)].hh.rh*16777216;mem[curlist.tailfield].hh.rh:=mainp;
curlist.tailfield:=mainp;cx:=curchr;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
150:getnext;maini:=fontinfo[charbase[mainf]+curl].qqqq;
case curcmd of 16,17,18,19,20:begin curl:=getjfmpos(curchr,mainf);
goto 133;end;11,12:begin inskp:=true;curl:=0;goto 133;end;end;xtoken;
case curcmd of 16,17,18,19,20:curl:=getjfmpos(curchr,mainf);
11,12:begin inskp:=true;curl:=0;end;
74:begin if checkecharrange(curchr)then begin inskp:=true;curl:=0;
end else curl:=getjfmpos(curchr,mainf);
curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;end;21:begin scancharnum;
curchr:=curval;if checkecharrange(curchr)then begin inskp:=true;curl:=0;
end else curl:=getjfmpos(curchr,mainf);
curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;end;
75:begin curl:=getjfmpos(curchr,mainf);
curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;end;22:begin scancharnum;
curchr:=curval;curl:=getjfmpos(curchr,mainf);
curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;end;
79:begin curlist.inhibitglueflagfield:=(curchr=0);goto 150;end;
others:begin inskp:=1073741823;curl:=-1;curr:=11904;
ligstack:=-1073741823;end;end;
133:if inskp=true then{1705:}begin kp:=getkinsokupos(curchr,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then if not(curlist.tailfield>=himemmin)and(mem[curlist.
tailfield].hh.b0=14)then mem[curlist.tailfield+1].int:=mem[curlist.
tailfield+1].int+eqtb[115238+kp].int else begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1705};
if mainf<>0 then begin{1733:}curq:=curlist.tailfield;
if curlist.inhibitglueflagfield<>true then begin if curl<0 then curl:=0
else curlist.inhibitglueflagfield:=false;
if(curlist.tailfield=mem[curlist.headfield].hh.rh)and(not(curlist.
tailfield>=himemmin))and(mem[curlist.tailfield].hh.b0=5)then goto 141
else begin if((maini.b2)mod 4)=1 then begin maink:=ligkernbase[mainf]+
maini.b3;mainj:=fontinfo[maink].qqqq;
if mainj.b0>128 then begin maink:=ligkernbase[mainf]+256*mainj.b2+mainj.
b3+32768-256*(128);mainj:=fontinfo[maink].qqqq;end;
while true do begin if mainj.b1=curl then if mainj.b0<=128 then begin if
mainj.b2<128 then begin gp:=fontglue[mainf];curr:=mainj.b2*256+mainj.b3;
if gp<>-1073741823 then begin while((mem[gp].hh.b0<>curr)and(mem[gp].hh.
rh<>-1073741823))do gp:=mem[gp].hh.rh;gq:=mem[gp+1].hh.lh;
end else begin gp:=getnode(2);fontglue[mainf]:=gp;gq:=-1073741823;end;
if gq=-1073741823 then begin mem[gp].hh.b0:=curr;gq:=newspec(membot);
mem[gp+1].hh.lh:=gq;maink:=extenbase[mainf]+(curr)*3;
mem[gq+1].int:=fontinfo[maink].int;mem[gq+2].int:=fontinfo[maink+1].int;
mem[gq+3].int:=fontinfo[maink+2].int;incr(mem[gq].hh.rh);
mem[gp].hh.rh:=getnode(2);gp:=mem[gp].hh.rh;
mem[gp+1].hh.lh:=-1073741823;mem[gp].hh.rh:=-1073741823;end;
begin mem[curlist.tailfield].hh.rh:=newglue(gq);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=21;goto 141;
end else begin begin mem[curlist.tailfield].hh.rh:=newkern(fontinfo[
kernbase[mainf]+256*mainj.b2+mainj.b3].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;goto 141;end;end;
if mainj.b0>=128 then goto 141;maink:=maink+mainj.b0+1;
mainj:=fontinfo[maink].qqqq;end;end;end;
end else begin if curl<0 then curl:=0 else curlist.inhibitglueflagfield
:=false;end;141:;{:1733};end else curlist.inhibitglueflagfield:=false;
if inskp=false then begin goto 131;
end else if inskp=true then begin inskp:=false;goto 70;
end else begin goto 21;end;{:1730};
70:curlist.inhibitglueflagfield:=false;
{1076:}if((curlist.headfield=curlist.tailfield)and(curlist.modefield>0))
then begin if(insertsrcspecialauto)then appendsrcspecial;end;
mains:=eqtb[101945+curchr].hh.rh;
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;
if curlist.dirfield=3 then disp:=eqtb[114978].int else disp:=eqtb[114979
].int;{1731:}begin if not(curlist.tailfield>=himemmin)and(mem[curlist.
tailfield].hh.b0=5)then begin if curlist.pdispfield=disp then begin
freenode(curlist.tailfield,2);curlist.tailfield:=curlist.pnodefield;
mem[curlist.tailfield].hh.rh:=-1073741823;
end else mem[curlist.tailfield+1].int:=disp;
end else if disp<>0 or not curlist.dispcalledfield then begin curlist.
pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=disp;
curlist.pdispfield:=disp;curlist.dispcalledfield:=true end;end;{:1731};
mainf:=eqtb[50985].hh.rh;bchar:=fontbchar[mainf];
falsebchar:=fontfalsebchar[mainf];
if curlist.modefield>0 then if eqtb[114412].int<>curlist.auxfield.hh.rh
then fixlanguage;begin ligstack:=avail;
if ligstack=-1073741823 then ligstack:=getavail else begin avail:=mem[
ligstack].hh.rh;mem[ligstack].hh.rh:=-1073741823;
ifdef('STAT')incr(dynused);endif('STAT')end;end;
mem[ligstack].hh.b0:=mainf;curl:=curchr;mem[ligstack].hh.b1:=curl;
curq:=curlist.tailfield;
if cancelboundary then begin cancelboundary:=false;maink:=0;
end else maink:=bcharlabel[mainf];if maink=0 then goto 92;curr:=curl;
curl:=11904;goto 111;
80:{1077:}if curl<11904 then begin if mem[curq].hh.rh>-1073741823 then
if mem[curlist.tailfield].hh.b1=hyphenchar[mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end{:1077};
90:{1078:}if ligstack=-1073741823 then begin{1732:}if disp<>0 then begin
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin mem[curlist.tailfield+1].int:=0;
end else begin curlist.pnodefield:=curlist.tailfield;
begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield+1].int:=0;
curlist.pdispfield:=disp;curlist.dispcalledfield:=true end;end;{:1732};
goto 21;end;curq:=curlist.tailfield;curl:=mem[ligstack].hh.b1;
91:if not(ligstack>=himemmin)then goto 95;
92:curchr:=ptencucsto8bitcode(fontenc[mainf],curchr);
if(effectivechar(false,mainf,curchr)>fontec[mainf])or(effectivechar(
false,mainf,curchr)<fontbc[mainf])then begin charwarning(mainf,curchr);
begin mem[ligstack].hh.rh:=avail;avail:=ligstack;
ifdef('STAT')decr(dynused);endif('STAT')end;goto 60;end;
if not ligaturepresent then curl:=ptencucsto8bitcode(fontenc[mainf],curl
);maini:=effectivecharinfo(mainf,curl);
if not(maini.b0>0)then begin charwarning(mainf,curchr);
begin mem[ligstack].hh.rh:=avail;avail:=ligstack;
ifdef('STAT')decr(dynused);endif('STAT')end;goto 60;end;
mem[curlist.tailfield].hh.rh:=ligstack;
curlist.tailfield:=ligstack{:1078};100:{1080:}getnext;
if curcmd=11 then goto 101;
if(curcmd>=16)and(curcmd<=20)then{1081:}begin bchar:=11904;curr:=bchar;
ligstack:=-1073741823;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if inskp=true then begin cx:=curl;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
goto 130;end{:1081};if curcmd=12 then goto 101;
if curcmd=74 then begin if checkecharrange(curchr)then goto 101 else
begin curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
{1081:}begin bchar:=11904;curr:=bchar;ligstack:=-1073741823;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if inskp=true then begin cx:=curl;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
goto 130;end{:1081};end;end;
if curcmd=75 then begin curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
{1081:}begin bchar:=11904;curr:=bchar;ligstack:=-1073741823;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if inskp=true then begin cx:=curl;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
goto 130;end{:1081};end;xtoken;if curcmd=11 then goto 101;
if(curcmd>=16)and(curcmd<=20)then{1081:}begin bchar:=11904;curr:=bchar;
ligstack:=-1073741823;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if inskp=true then begin cx:=curl;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
goto 130;end{:1081};if curcmd=12 then goto 101;
if curcmd=74 then begin if checkecharrange(curchr)then goto 101 else
begin curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
{1081:}begin bchar:=11904;curr:=bchar;ligstack:=-1073741823;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if inskp=true then begin cx:=curl;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
goto 130;end{:1081};end;end;
if curcmd=75 then begin curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
{1081:}begin bchar:=11904;curr:=bchar;ligstack:=-1073741823;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if inskp=true then begin cx:=curl;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
goto 130;end{:1081};end;if curcmd=21 then begin scancharnum;
curchr:=curval;
if checkecharrange(curchr)then goto 101 else begin curcmd:=eqtb[63663+
kcatcodekey(curchr)].hh.rh;{1081:}begin bchar:=11904;curr:=bchar;
ligstack:=-1073741823;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if inskp=true then begin cx:=curl;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
goto 130;end{:1081};end;end;if curcmd=22 then begin scancharnum;
curchr:=curval;curcmd:=eqtb[63663+kcatcodekey(curchr)].hh.rh;
{1081:}begin bchar:=11904;curr:=bchar;ligstack:=-1073741823;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if inskp=true then begin cx:=curl;
{1704:}begin kp:=getkinsokupos(cx,1);
if kp<>10000 then if eqtb[115238+kp].int<>0 then begin if eqtb[77103+kp]
.hh.b0=1 then begin if not(curq>=himemmin)and(mem[curq].hh.b0=14)then
mem[curq+1].int:=mem[curq+1].int+eqtb[115238+kp].int else begin mainp:=
mem[curq].hh.rh;mem[curq].hh.rh:=newpenalty(eqtb[115238+kp].int);
mem[mem[curq].hh.rh].hh.b1:=2;mem[mem[curq].hh.rh].hh.rh:=mainp;end;
end else if eqtb[77103+kp].hh.b0=2 then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(eqtb[115238+kp].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=2;end;end;end;{:1704};end;inskp:=false;
goto 130;end{:1081};end;
if curcmd=79 then begin curlist.inhibitglueflagfield:=true;goto 100;end;
if curcmd=71 then bchar:=11904;curr:=bchar;ligstack:=-1073741823;
goto 110;101:mains:=eqtb[101945+curchr].hh.rh;
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;
curlist.inhibitglueflagfield:=false;begin ligstack:=avail;
if ligstack=-1073741823 then ligstack:=getavail else begin avail:=mem[
ligstack].hh.rh;mem[ligstack].hh.rh:=-1073741823;
ifdef('STAT')incr(dynused);endif('STAT')end;end;
mem[ligstack].hh.b0:=mainf;curr:=curchr;mem[ligstack].hh.b1:=curr;
if curr=falsebchar then curr:=11904{:1080};
110:{1082:}if((maini.b2)mod 4)<>1 then goto 80;
if curr=11904 then goto 80;maink:=ligkernbase[mainf]+maini.b3;
mainj:=fontinfo[maink].qqqq;if mainj.b0<=128 then goto 112;
maink:=ligkernbase[mainf]+256*mainj.b2+mainj.b3+32768-256*(128);
111:mainj:=fontinfo[maink].qqqq;
112:cy:=ptencucsto8bitcode(fontenc[mainf],curr);
if mainj.b1=cy then if mainj.b0<=128 then{1083:}begin if mainj.b2>=128
then begin if curl<11904 then begin if mem[curq].hh.rh>-1073741823 then
if mem[curlist.tailfield].hh.b1=hyphenchar[mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
begin mem[curlist.tailfield].hh.rh:=newkern(fontinfo[kernbase[mainf]+256
*mainj.b2+mainj.b3].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;goto 90;end;
if curl=11904 then lfthit:=true else if ligstack=-1073741823 then rthit
:=true;begin if interrupt<>0 then pauseforinstructions;end;
case mainj.b2 of 1,5:begin curl:=mainj.b3;
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;end;2,6:begin curr:=mainj.b3;
if ligstack=-1073741823 then begin ligstack:=newligitem(curr);
bchar:=11904;end else if(ligstack>=himemmin)then begin mainp:=ligstack;
ligstack:=newligitem(curr);mem[ligstack+1].hh.rh:=mainp;
end else mem[ligstack].hh.b1:=curr;end;3:begin curr:=mainj.b3;
mainp:=ligstack;ligstack:=newligitem(curr);mem[ligstack].hh.rh:=mainp;
end;
7,11:begin if curl<11904 then begin if mem[curq].hh.rh>-1073741823 then
if mem[curlist.tailfield].hh.b1=hyphenchar[mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if false then if ligstack=-1073741823 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
curq:=curlist.tailfield;curl:=mainj.b3;
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;end;others:begin curl:=mainj.b3;
ligaturepresent:=true;if ligstack=-1073741823 then goto 80 else goto 91;
end end;if mainj.b2>4 then if mainj.b2<>7 then goto 80;
if curl<11904 then goto 110;maink:=bcharlabel[mainf];goto 111;
end{:1083};
if mainj.b0=0 then incr(maink)else begin if mainj.b0>=128 then goto 80;
maink:=maink+mainj.b0+1;end;goto 111{:1082};
95:{1079:}mainp:=mem[ligstack+1].hh.rh;
if mainp>-1073741823 then begin mem[curlist.tailfield].hh.rh:=mainp;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;tempptr:=ligstack;
ligstack:=mem[tempptr].hh.rh;freenode(tempptr,2);
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;
if ligstack=-1073741823 then if mainp>-1073741823 then goto 100 else
curr:=bchar else curr:=mem[ligstack].hh.b1;goto 110{:1079}{:1076};
120:{1084:}if eqtb[49937].hh.rh=membot then begin{1085:}begin mainp:=
fontglue[eqtb[50985].hh.rh];
if mainp=-1073741823 then begin mainp:=newspec(membot);
maink:=parambase[eqtb[50985].hh.rh]+2;
mem[mainp+1].int:=fontinfo[maink].int;
mem[mainp+2].int:=fontinfo[maink+1].int;
mem[mainp+3].int:=fontinfo[maink+2].int;
fontglue[eqtb[50985].hh.rh]:=mainp;end;end{:1085};
tempptr:=newglue(mainp);end else tempptr:=newparamglue(12);
if not(curlist.tailfield>=himemmin)and(mem[curlist.tailfield].hh.b0=5)
then begin mem[curlist.pnodefield].hh.rh:=tempptr;
mem[tempptr].hh.rh:=curlist.tailfield;curlist.pnodefield:=tempptr;
end else begin mem[curlist.tailfield].hh.rh:=tempptr;
curlist.tailfield:=tempptr;end;goto 60{:1084};10:end;
{:1072}{1328:}procedure giveerrhelp;begin tokenshow(eqtb[50467].hh.rh);
end;{:1328}{1347:}{562:}function openfmtfile:boolean;label 40,10;
var j:0..bufsize;begin j:=curinput.locfield;
if buffer[curinput.locfield]=38 then begin incr(curinput.locfield);
j:=curinput.locfield;buffer[last]:=32;while buffer[j]<>32 do incr(j);
packbufferedname(0,curinput.locfield,j-1);
if wopenin(fmtfile)then goto 40;;
write(stdout,'Sorry, I can''t find the format `');
fputs(stringcast(nameoffile+1),stdout);write(stdout,'''; will try `');
fputs(TEXformatdefault+1,stdout);writeln(stdout,'''.');fflush(stdout);
end;packbufferedname(formatdefaultlength-4,1,0);
if not wopenin(fmtfile)then begin;
write(stdout,'I can''t find the format file `');
fputs(TEXformatdefault+1,stdout);writeln(stdout,'''!');
openfmtfile:=false;goto 10;end;40:curinput.locfield:=j;
openfmtfile:=true;10:end;{:562}function loadfmtfile:boolean;
label 6666,10;var j,k:integer;p,q:halfword;x:integer;w:fourquarters;
formatengine:^ASCIIcode;dummyxord:ASCIIcode;dummyxchr:extASCIIcode;
dummyxprn:ASCIIcode;
begin{1352:}ifdef('INITEX')if iniversion then begin libcfree(fontinfo);
libcfree(strpool);libcfree(strstart);libcfree(yhash);libcfree(zeqtb);
libcfree(yzmem);end;endif('INITEX')undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'format magic number');writeln(stderr,' = ',x);end;;
if x<>1462916184 then goto 6666;undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'engine name size');writeln(stderr,' = ',x);end;;
if(x<0)or(x>256)then goto 6666;formatengine:=xmallocarray(ASCIIcode,x);
undumpthings(formatengine[0],x);formatengine[x-1]:=0;
if strcmp(enginename,stringcast(formatengine))then begin;
writeln(stdout,'---! ',stringcast(nameoffile+1),' was written by ',
formatengine);libcfree(formatengine);goto 6666;end;
libcfree(formatengine);undumpkanji(fmtfile);undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'string pool checksum');writeln(stderr,' = ',x);end;;
if x<>457706218 then begin;
writeln(stdout,'---! ',stringcast(nameoffile+1),
' made by different executable version, strings are different');
goto 6666;end;
{1657:}if translatefilename then begin for k:=0 to 255 do undumpthings(
dummyxord,1);for k:=0 to 255 do undumpthings(dummyxchr,1);
for k:=0 to 255 do undumpthings(dummyxprn,1);
end else begin undumpthings(xord[0],256);undumpthings(xchr[0],256);
undumpthings(xprn[0],256);
if eightbitp then for k:=0 to 255 do xprn[k]:=1;end;
for k:=256 to 511 do xchr[k]:=k;{:1657};undumpint(x);
if x<>1073741823 then goto 6666;undumpint(hashhigh);
if(hashhigh<0)or(hashhigh>suphashextra)then goto 6666;
if hashextra<hashhigh then hashextra:=hashhigh;
eqtbtop:=116261+hashextra;
if hashextra=0 then hashtop:=49924 else hashtop:=eqtbtop;
yhash:=xmallocarray(twohalves,1+hashtop-hashoffset);
hash:=yhash-hashoffset;hash[23810].lh:=0;hash[23810].rh:=0;
for x:=23811 to hashtop do hash[x]:=hash[23810];
zeqtb:=xmallocarray(memoryword,eqtbtop+1);eqtb:=zeqtb;
eqtb[49924].hh.b0:=119;eqtb[49924].hh.rh:=-1073741823;
eqtb[49924].hh.b1:=0;for x:=116262 to eqtbtop do eqtb[x]:=eqtb[49924];
{1432:}begin undumpint(x);if(x<0)or(x>1)then goto 6666 else eTeXmode:=x;
end;if(eTeXmode=1)then begin{1594:}maxregnum:=65535;
maxreghelpline:=1646;{:1594}end else begin{1593:}maxregnum:=255;
maxreghelpline:=792;{:1593}end;{:1432}undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:','mem_bot');
writeln(stderr,' = ',x);end;;if x<>membot then goto 6666;
undumpint(memtop);
if debugformatfile then begin write(stderr,'fmtdebug:','mem_top');
writeln(stderr,' = ',memtop);end;;if membot+1100>memtop then goto 6666;
curlist.headfield:=memtop-1;curlist.tailfield:=memtop-1;
pagetail:=memtop-2;memmin:=membot-extramembot;
memmax:=memtop+extramemtop;
yzmem:=xmallocarray(memoryword,memmax-memmin+1);zmem:=yzmem-memmin;
mem:=zmem;undumpint(x);if x<>116261 then goto 6666;undumpint(x);
if x<>8501 then goto 6666;undumpint(x);if x<>607 then goto 6666{:1352};
{1674:}undumpint(x);if x<>1296847960 then goto 6666;undumpint(x);
if x=1 then mltexenabledp:=true else if x<>0 then goto 6666;{:1674};
{1354:}begin undumpint(x);if x<0 then goto 6666;
if x>suppoolsize-poolfree then begin;
writeln(stdout,'---! Must increase the ','string pool size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'string pool size');writeln(stderr,' = ',x);end;;poolptr:=x;end;
if poolsize<poolptr+poolfree then poolsize:=poolptr+poolfree;
begin undumpint(x);if x<0 then goto 6666;
if x>supmaxstrings-stringsfree then begin;
writeln(stdout,'---! Must increase the ','sup strings');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'sup strings');writeln(stderr,' = ',x);end;;strptr:=x;end;
if maxstrings<strptr+stringsfree then maxstrings:=strptr+stringsfree;
strstart:=xmallocarray(poolpointer,maxstrings);
undumpcheckedthings(0,poolptr,strstart[0],strptr+1);
strpool:=xmallocarray(packedASCIIcode,poolsize);
for k:=0 to strptr do begin undumpint(x);
if(x<0)or(x>poolptr)then goto 6666 else strstart[k]:=x;end;k:=0;
while k+4<poolptr do begin undumpqqqq(w);strpool[k]:=w.b0;
strpool[k+1]:=w.b1;strpool[k+2]:=w.b2;strpool[k+3]:=w.b3;k:=k+4;end;
k:=poolptr-4;undumpqqqq(w);strpool[k]:=w.b0;strpool[k+1]:=w.b1;
strpool[k+2]:=w.b2;strpool[k+3]:=w.b3;initstrptr:=strptr;
initpoolptr:=poolptr{:1354};{1356:}begin undumpint(x);
if(x<membot+1023)or(x>memtop-15)then goto 6666 else lomemmax:=x;end;
begin undumpint(x);
if(x<membot+24)or(x>lomemmax)then goto 6666 else rover:=x;end;
if(eTeXmode=1)then for k:=0 to 5 do begin undumpint(x);
if(x<-1073741823)or(x>lomemmax)then goto 6666 else saroot[k]:=x;end;
p:=membot;q:=rover;repeat undumpthings(mem[p],q+2-p);
if(mem[q].hh.lh>lomemmax-q)or(mem[q+1].hh.rh>lomemmax)or((q>=mem[q+1].hh
.rh)and(mem[q+1].hh.rh<>rover))then goto 6666;p:=q+mem[q].hh.lh;
q:=mem[q+1].hh.rh;until q=rover;undumpthings(mem[p],lomemmax+1-p);
if memmin<membot-2 then begin p:=mem[rover+1].hh.lh;q:=memmin+1;
mem[memmin].hh.rh:=-1073741823;mem[memmin].hh.lh:=-1073741823;
mem[p+1].hh.rh:=q;mem[rover+1].hh.lh:=q;mem[q+1].hh.rh:=rover;
mem[q+1].hh.lh:=p;mem[q].hh.rh:=1073741823;mem[q].hh.lh:=membot-q;end;
begin undumpint(x);
if(x<lomemmax+1)or(x>memtop-14)then goto 6666 else himemmin:=x;end;
begin undumpint(x);
if(x<-1073741823)or(x>memtop)then goto 6666 else avail:=x;end;
memend:=memtop;undumpthings(mem[himemmin],memend+1-himemmin);
undumpint(varused);undumpint(dynused){:1356};{1358:}{1361:}k:=1;
repeat undumpint(x);if(x<1)or(k+x>116262)then goto 6666;
undumpthings(eqtb[k],x);k:=k+x;undumpint(x);
if(x<0)or(k+x>116262)then goto 6666;
for j:=k to k+x-1 do eqtb[j]:=eqtb[k-1];k:=k+x;until k>116261;
if hashhigh>0 then undumpthings(eqtb[116262],hashhigh);{:1361};
undumpint(parloc);partoken:=536870911+parloc;begin undumpint(x);
if(x<23810)or(x>hashtop)then goto 6666 else writeloc:=x;end;
{1363:}for p:=0 to 2100 do undumphh(prim[p]);begin undumpint(x);
if(x<23810)or(x>38810)then goto 6666 else hashused:=x;end;p:=23809;
repeat begin undumpint(x);
if(x<p+1)or(x>hashused)then goto 6666 else p:=x;end;undumphh(hash[p]);
until p=hashused;undumpthings(hash[hashused+1],49923-hashused);
if debugformatfile then begin printcsnames(23810,49923);end;
if hashhigh>0 then begin undumpthings(hash[116262],hashhigh);
if debugformatfile then begin printcsnames(116262,hashhigh-(116262));
end;end;undumpint(cscount){:1363}{:1358};{1365:}begin undumpint(x);
if x<7 then goto 6666;if x>supfontmemsize then begin;
writeln(stdout,'---! Must increase the ','font mem size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'font mem size');writeln(stderr,' = ',x);end;;fmemptr:=x;end;
if fmemptr>fontmemsize then fontmemsize:=fmemptr;
fontinfo:=xmallocarray(memoryword,fontmemsize);
undumpthings(fontinfo[0],fmemptr);begin undumpint(x);
if x<0 then goto 6666;if x>9000 then begin;
writeln(stdout,'---! Must increase the ','font max');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'font max');writeln(stderr,' = ',x);end;;fontptr:=x;end;
{1367:}begin fontdir:=xmallocarray(eightbits,fontmax);
fontenc:=xmallocarray(eightbits,fontmax);
fontnumext:=xmallocarray(integer,fontmax);
fontcheck:=xmallocarray(fourquarters,fontmax);
fontsize:=xmallocarray(scaled,fontmax);
fontdsize:=xmallocarray(scaled,fontmax);
fontparams:=xmallocarray(fontindex,fontmax);
fontname:=xmallocarray(strnumber,fontmax);
fontarea:=xmallocarray(strnumber,fontmax);
fontbc:=xmallocarray(sixteenbits,fontmax);
fontec:=xmallocarray(sixteenbits,fontmax);
fontglue:=xmallocarray(halfword,fontmax);
hyphenchar:=xmallocarray(integer,fontmax);
skewchar:=xmallocarray(integer,fontmax);
bcharlabel:=xmallocarray(fontindex,fontmax);
fontbchar:=xmallocarray(ninebits,fontmax);
fontfalsebchar:=xmallocarray(ninebits,fontmax);
ctypebase:=xmallocarray(integer,fontmax);
charbase:=xmallocarray(integer,fontmax);
widthbase:=xmallocarray(integer,fontmax);
heightbase:=xmallocarray(integer,fontmax);
depthbase:=xmallocarray(integer,fontmax);
italicbase:=xmallocarray(integer,fontmax);
ligkernbase:=xmallocarray(integer,fontmax);
kernbase:=xmallocarray(integer,fontmax);
extenbase:=xmallocarray(integer,fontmax);
parambase:=xmallocarray(integer,fontmax);
undumpthings(fontdir[0],fontptr+1);undumpthings(fontenc[0],fontptr+1);
undumpthings(fontnumext[0],fontptr+1);
undumpthings(fontcheck[0],fontptr+1);
undumpthings(fontsize[0],fontptr+1);
undumpthings(fontdsize[0],fontptr+1);
undumpcheckedthings(-1073741823,1073741823,fontparams[0],fontptr+1);
undumpthings(hyphenchar[0],fontptr+1);
undumpthings(skewchar[0],fontptr+1);
undumpuppercheckthings(strptr,fontname[0],fontptr+1);
undumpuppercheckthings(strptr,fontarea[0],fontptr+1);
undumpthings(fontbc[0],fontptr+1);undumpthings(fontec[0],fontptr+1);
undumpthings(ctypebase[0],fontptr+1);
undumpthings(charbase[0],fontptr+1);
undumpthings(widthbase[0],fontptr+1);
undumpthings(heightbase[0],fontptr+1);
undumpthings(depthbase[0],fontptr+1);
undumpthings(italicbase[0],fontptr+1);
undumpthings(ligkernbase[0],fontptr+1);
undumpthings(kernbase[0],fontptr+1);
undumpthings(extenbase[0],fontptr+1);
undumpthings(parambase[0],fontptr+1);
undumpcheckedthings(-1073741823,lomemmax,fontglue[0],fontptr+1);
undumpcheckedthings(0,fmemptr-1,bcharlabel[0],fontptr+1);
undumpcheckedthings(0,11904,fontbchar[0],fontptr+1);
undumpcheckedthings(0,11904,fontfalsebchar[0],fontptr+1);end{:1367};
{:1365};{1369:}begin undumpint(x);if x<0 then goto 6666;
if x>hyphsize then begin;
writeln(stdout,'---! Must increase the ','hyph_size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'hyph_size');writeln(stderr,' = ',x);end;;hyphcount:=x;end;
begin undumpint(x);if x<607 then goto 6666;if x>hyphsize then begin;
writeln(stdout,'---! Must increase the ','hyph_size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'hyph_size');writeln(stderr,' = ',x);end;;hyphnext:=x;end;j:=0;
for k:=1 to hyphcount do begin undumpint(j);if j<0 then goto 6666;
if j>65535 then begin hyphnext:=j div 65536;j:=j-hyphnext*65536;
end else hyphnext:=0;if(j>=hyphsize)or(hyphnext>hyphsize)then goto 6666;
hyphlink[j]:=hyphnext;begin undumpint(x);
if(x<0)or(x>strptr)then goto 6666 else hyphword[j]:=x;end;
begin undumpint(x);
if(x<-1073741823)or(x>1073741823)then goto 6666 else hyphlist[j]:=x;end;
end;incr(j);if j<607 then j:=607;hyphnext:=j;
if hyphnext>=hyphsize then hyphnext:=607 else if hyphnext>=607 then incr
(hyphnext);begin undumpint(x);if x<0 then goto 6666;
if x>triesize then begin;
writeln(stdout,'---! Must increase the ','trie size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'trie size');writeln(stderr,' = ',x);end;;j:=x;end;
ifdef('INITEX')triemax:=j;endif('INITEX')begin undumpint(x);
if(x<0)or(x>j)then goto 6666 else hyphstart:=x;end;
if not trietrl then trietrl:=xmallocarray(triepointer,j+1);
undumpthings(trietrl[0],j+1);
if not trietro then trietro:=xmallocarray(triepointer,j+1);
undumpthings(trietro[0],j+1);
if not trietrc then trietrc:=xmallocarray(quarterword,j+1);
undumpthings(trietrc[0],j+1);begin undumpint(x);if x<0 then goto 6666;
if x>trieopsize then begin;
writeln(stdout,'---! Must increase the ','trie op size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'trie op size');writeln(stderr,' = ',x);end;;j:=x;end;
ifdef('INITEX')trieopptr:=j;
endif('INITEX')undumpthings(hyfdistance[1],j);undumpthings(hyfnum[1],j);
undumpuppercheckthings(maxtrieop,hyfnext[1],j);
ifdef('INITEX')for k:=0 to 255 do trieused[k]:=0;endif('INITEX')k:=256;
while j>0 do begin begin undumpint(x);
if(x<0)or(x>k-1)then goto 6666 else k:=x;end;begin undumpint(x);
if(x<1)or(x>j)then goto 6666 else x:=x;end;
ifdef('INITEX')trieused[k]:=x;endif('INITEX')j:=j-x;opstart[k]:=j;end;
ifdef('INITEX')trienotready:=false endif('INITEX'){:1369};
{1371:}begin undumpint(x);
if(x<0)or(x>3)then goto 6666 else interaction:=x;end;
if interactionoption<>4 then interaction:=interactionoption;
begin undumpint(x);
if(x<0)or(x>strptr)then goto 6666 else formatident:=x;end;undumpint(x);
if x<>69069 then goto 6666{:1371};loadfmtfile:=true;goto 10;6666:;
writeln(stdout,'(Fatal format file error; I''m stymied)');
loadfmtfile:=false;10:end;
{:1347}{1374:}{1377:}procedure closefilesandterminate;var k:integer;
begin{1424:}for k:=0 to 15 do if writeopen[k]then aclose(writefile[k])
{:1424};eqtb[114411].int:=-1;
ifdef('STAT')if eqtb[114392].int>0 then{1378:}if logopened then begin
writeln(logfile,' ');
writeln(logfile,'Here is how much of TeX''s memory',' you used:');
write(logfile,' ',strptr-initstrptr:1,' string');
if strptr<>initstrptr+1 then write(logfile,'s');
writeln(logfile,' out of ',maxstrings-initstrptr:1);
writeln(logfile,' ',poolptr-initpoolptr:1,' string characters out of ',
poolsize-initpoolptr:1);
writeln(logfile,' ',lomemmax-memmin+memend-himemmin+2:1,
' words of memory out of ',memend+1-memmin:1);
writeln(logfile,' ',cscount:1,' multiletter control sequences out of ',
15000:1,'+',hashextra:1);
write(logfile,' ',fmemptr:1,' words of font info for ',fontptr-0:1,
' font');if fontptr<>1 then write(logfile,'s');
writeln(logfile,', out of ',fontmemsize:1,' for ',fontmax-0:1);
write(logfile,' ',hyphcount:1,' hyphenation exception');
if hyphcount<>1 then write(logfile,'s');
writeln(logfile,' out of ',hyphsize:1);
writeln(logfile,' ',maxinstack:1,'i,',maxneststack:1,'n,',maxparamstack:
1,'p,',maxbufstack+1:1,'b,',maxsavestack+6:1,'s stack positions out of '
,stacksize:1,'i,',nestsize:1,'n,',paramsize:1,'p,',bufsize:1,'b,',
savesize:1,'s');end{:1378};endif('STAT');
{681:}while curs>-1 do begin if curs>0 then begin dvibuf[dviptr]:=142;
incr(dviptr);if dviptr=dvilimit then dviswap;
end else begin begin dvibuf[dviptr]:=140;incr(dviptr);
if dviptr=dvilimit then dviswap;end;incr(totalpages);end;decr(curs);end;
if totalpages=0 then printnl(1003)else if curs<>-2 then begin begin
dvibuf[dviptr]:=248;incr(dviptr);if dviptr=dvilimit then dviswap;end;
dvifour(lastbop);lastbop:=dvioffset+dviptr-5;dvifour(25400000);
dvifour(473628672);preparemag;dvifour(eqtb[114378].int);dvifour(maxv);
dvifour(maxh);begin dvibuf[dviptr]:=maxpush div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=maxpush mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(totalpages div 256)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=totalpages mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
{682:}while fontptr>0 do begin if fontused[fontptr]then dvifontdef(
fontptr);decr(fontptr);end{:682};begin dvibuf[dviptr]:=249;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(lastbop);
if dirused then begin dvibuf[dviptr]:=3;incr(dviptr);
if dviptr=dvilimit then dviswap;end else begin dvibuf[dviptr]:=2;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
ifdef('IPC')k:=7-((3+dvioffset+dviptr)mod 4);
endif('IPC')ifndef('IPC')k:=4+((dvibufsize-dviptr)mod 4);
endifn('IPC')while k>0 do begin begin dvibuf[dviptr]:=223;incr(dviptr);
if dviptr=dvilimit then dviswap;end;decr(k);end;
{638:}if dvilimit=halfbuf then writedvi(halfbuf,dvibufsize-1);
if dviptr>(2147483647-dvioffset)then begin curs:=-2;fatalerror(992);end;
if dviptr>0 then writedvi(0,dviptr-1){:638};printnl(1004);
printfilename(0,outputfilename,0);print(287);printint(totalpages);
if totalpages<>1 then print(1005)else print(1006);print(387);
printint(dvioffset+dviptr);print(1007);bclose(dvifile);end{:681};
{1760:}synctexterminate(logopened);{:1760};
if logopened then begin writeln(logfile);aclose(logfile);
selector:=selector-2;if selector=17 then begin printnl(1492);
printfilename(0,texmflogname,0);printchar(46);end;end;println;
if(editnamestart<>0)and(interaction>0)then calledit(strpool,
editnamestart,editnamelength,editline);end;
{:1377}{1379:}procedure finalcleanup;label 10;var c:smallnumber;
begin c:=curchr;if c<>1 then eqtb[114411].int:=-1;
if jobname=0 then openlogfile;
while inputptr>0 do if curinput.statefield=0 then endtokenlist else
endfilereading;while openparens>0 do begin print(1493);decr(openparens);
end;if curlevel>1 then begin printnl(40);printesc(1494);print(1495);
printint(curlevel-1);printchar(41);if(eTeXmode=1)then showsavegroups;
end;while condptr<>-1073741823 do begin printnl(40);printesc(1494);
print(1496);printcmdchr(123,curif);if ifline<>0 then begin print(1497);
printint(ifline);end;print(1498);ifline:=mem[condptr+1].int;
curif:=mem[condptr].hh.b1;tempptr:=condptr;condptr:=mem[condptr].hh.rh;
freenode(tempptr,2);end;
if history<>0 then if((history=1)or(interaction<3))then if selector=19
then begin selector:=17;printnl(1499);selector:=19;end;
if c=1 then begin ifdef('INITEX')if iniversion then begin for c:=0 to 4
do if curmark[c]<>-1073741823 then deletetokenref(curmark[c]);
if saroot[6]<>-1073741823 then if domarks(3,0,saroot[6])then saroot[6]:=
-1073741823;for c:=2 to 3 do flushnodelist(discptr[c]);
if lastglue<>1073741823 then deleteglueref(lastglue);storefmtfile;
goto 10;end;endif('INITEX')printnl(1500);goto 10;end;10:end;
{:1379}{1380:}ifdef('INITEX')procedure initprim;
begin nonewcontrolsequence:=false;first:=0;
{251:}primitive(401,85,49925);primitive(402,85,49926);
primitive(403,85,49927);primitive(404,85,49928);primitive(405,85,49929);
primitive(406,85,49930);primitive(407,85,49931);primitive(408,85,49932);
primitive(409,85,49933);primitive(410,85,49934);primitive(411,85,49935);
primitive(412,85,49936);primitive(413,85,49937);primitive(414,85,49938);
primitive(415,85,49939);primitive(416,86,49942);primitive(417,86,49943);
primitive(418,86,49944);primitive(419,85,49940);primitive(420,85,49941);
{:251}{255:}primitive(426,82,50459);primitive(427,82,50460);
primitive(428,82,50461);primitive(429,82,50462);primitive(430,82,50463);
primitive(431,82,50464);primitive(432,82,50465);primitive(433,82,50466);
primitive(434,82,50467);{:255}{263:}primitive(463,83,114361);
primitive(464,83,114362);primitive(465,83,114363);
primitive(466,83,114364);primitive(467,83,114365);
primitive(468,83,114366);primitive(469,83,114367);
primitive(470,83,114368);primitive(471,83,114369);
primitive(472,83,114370);primitive(473,83,114371);
primitive(474,83,114372);primitive(475,83,114373);
primitive(476,83,114374);primitive(477,83,114375);
primitive(478,83,114376);primitive(479,83,114377);
primitive(480,83,114378);primitive(481,83,114379);
primitive(482,83,114380);primitive(483,83,114381);
primitive(484,83,114382);primitive(485,83,114383);
primitive(486,83,114384);primitive(487,83,114385);
primitive(488,83,114386);primitive(489,83,114387);
primitive(490,83,114388);primitive(491,83,114389);
primitive(492,83,114390);primitive(493,83,114391);
primitive(494,83,114392);primitive(495,83,114393);
primitive(496,83,114394);primitive(497,83,114395);
primitive(498,83,114396);primitive(499,83,114397);
primitive(500,83,114398);primitive(501,83,114399);
primitive(502,83,114400);primitive(503,83,114401);
primitive(504,83,114402);primitive(505,83,114403);
primitive(506,83,114404);primitive(507,83,114405);
primitive(508,83,114407);primitive(509,83,114408);
primitive(510,83,114409);primitive(511,83,114410);
primitive(512,83,114411);primitive(513,83,114406);
primitive(514,83,114417);primitive(515,83,114418);
primitive(516,83,114419);primitive(517,83,114420);
primitive(518,83,114421);primitive(519,83,114422);
primitive(520,83,114412);primitive(521,83,114413);
primitive(522,83,114414);primitive(523,83,114415);
primitive(524,83,114416);if mltexp then begin mltexenabledp:=true;
if false then primitive(525,83,114423);primitive(526,83,114424);
primitive(527,83,114425);end;primitive(528,83,114426);
primitive(532,118,0);primitive(529,83,114427);primitive(530,83,114428);
{:263}{273:}primitive(535,84,114957);primitive(536,84,114958);
primitive(537,84,114959);primitive(538,84,114960);
primitive(539,84,114961);primitive(540,84,114962);
primitive(541,84,114963);primitive(542,84,114964);
primitive(543,84,114965);primitive(544,84,114966);
primitive(545,84,114967);primitive(546,84,114968);
primitive(547,84,114969);primitive(548,84,114970);
primitive(549,84,114971);primitive(550,84,114972);
primitive(551,84,114973);primitive(552,84,114974);
primitive(553,84,114975);primitive(554,84,114976);
primitive(555,84,114978);primitive(556,84,114979);
primitive(557,84,114977);{:273}{294:}primitive(32,70,0);
primitive(47,50,0);primitive(572,51,0);primitive(573,105,0);
primitive(574,46,0);primitive(575,47,0);primitive(576,67,0);
primitive(577,21,0);primitive(578,22,0);primitive(568,125,0);
primitive(579,15,0);primitive(580,15,1);primitive(581,107,0);
primitive(569,73,0);primitive(582,68,0);hash[38812].rh:=582;
eqtb[38812]:=eqtb[curval];primitive(583,120,0);primitive(584,101,0);
primitive(585,102,0);primitive(586,103,0);primitive(587,87,0);
primitive(588,38,0);primitive(589,42,0);primitive(590,45,0);
primitive(341,43,0);primitive(366,24,0);primitive(591,52,0);
primitive(592,23,0);primitive(593,52,1);primitive(594,23,1);
primitive(595,60,0);primitive(596,106,0);primitive(597,40,0);
primitive(598,71,0);primitive(599,121,0);primitive(346,61,0);
primitive(600,69,0);primitive(601,97,50458);primitive(602,48,0);
primitive(603,93,0);primitive(604,72,0);primitive(605,72,1);
primitive(606,111,0);primitive(607,0,16777216);hash[38817].rh:=607;
eqtb[38817]:=eqtb[curval];primitive(608,113,0);primitive(609,127,0);
primitive(435,81,membot);primitive(367,44,0);primitive(610,39,0);
primitive(611,62,0);primitive(612,41,0);
{:294}{364:}primitive(688,13,16777216);parloc:=curval;
partoken:=536870911+parloc;{:364}{412:}primitive(724,122,0);
primitive(725,122,1);{:412}{420:}primitive(726,128,0);
primitive(727,128,1);primitive(728,128,2);primitive(729,128,3);
primitive(730,128,4);{:420}{447:}primitive(533,104,membot+0);
primitive(561,104,membot+1);primitive(423,104,membot+2);
primitive(424,104,membot+3);{:447}{453:}primitive(768,92,120);
primitive(769,92,1);primitive(770,95,0);primitive(771,95,1);
primitive(772,96,1);primitive(773,96,3);primitive(774,96,2);
primitive(775,78,0);primitive(776,78,1);primitive(777,78,2);
primitive(778,78,7);primitive(779,78,8);primitive(780,78,9);
primitive(781,78,10);primitive(782,78,11);primitive(783,78,12);
{:453}{505:}primitive(846,126,0);primitive(847,126,1);
primitive(848,126,3);primitive(849,126,4);primitive(850,126,5);
primitive(851,126,2);primitive(852,126,6);primitive(853,126,7);
primitive(854,126,8);primitive(855,126,9);primitive(856,126,10);
primitive(857,126,11);primitive(858,126,12);primitive(859,126,13);
primitive(860,126,14);primitive(861,126,15);primitive(862,126,17);
primitive(863,126,28);{:505}{525:}primitive(904,123,0);
primitive(905,123,1);primitive(906,123,2);primitive(907,123,3);
primitive(908,123,4);primitive(909,123,5);primitive(910,123,6);
primitive(911,123,7);primitive(912,123,8);primitive(913,123,9);
primitive(914,123,10);primitive(915,123,11);primitive(916,123,12);
primitive(917,123,13);primitive(918,123,14);primitive(919,123,15);
primitive(920,123,16);primitive(921,123,22);primitive(922,123,23);
primitive(923,123,24);primitive(924,123,25);primitive(925,123,26);
primitive(926,123,27);primitive(927,123,28);primitive(928,123,29);
primitive(929,123,30);primitive(930,123,31);
{:525}{529:}primitive(321,124,2);hash[38814].rh:=321;
eqtb[38814]:=eqtb[curval];primitive(933,124,4);primitive(934,124,3);
{:529}{591:}primitive(960,100,0);hash[40923].rh:=960;
eqtb[40923]:=eqtb[curval];{:591}{821:}primitive(1067,4,16777216);
primitive(1068,5,16777217);hash[38811].rh:=1068;
eqtb[38811]:=eqtb[curval];primitive(1069,5,16777218);
hash[38815].rh:=1070;hash[38816].rh:=1070;eqtb[38816].hh.b0:=9;
eqtb[38816].hh.rh:=memtop-11;eqtb[38816].hh.b1:=1;
eqtb[38815]:=eqtb[38816];eqtb[38815].hh.b0:=133;
{:821}{1025:}primitive(1139,94,0);primitive(1140,94,1);
primitive(1141,94,2);primitive(1142,94,3);primitive(1143,94,4);
primitive(1144,94,5);primitive(1145,94,6);primitive(1146,94,7);
primitive(1147,94,8);{:1025}{1095:}primitive(354,14,0);
primitive(1196,14,1);{:1095}{1101:}primitive(1197,32,5);
primitive(1198,32,0);primitive(1199,32,1);primitive(1200,32,2);
primitive(1201,32,3);primitive(1202,32,4);primitive(1203,33,5);
primitive(1204,33,0);primitive(1205,33,1);primitive(1206,33,2);
primitive(1207,33,3);primitive(1208,33,4);primitive(347,34,6);
primitive(351,35,1);primitive(353,36,99);
{:1101}{1114:}primitive(1226,27,1);primitive(1227,27,0);
primitive(1228,28,1);primitive(1229,28,0);primitive(437,26,0);
primitive(1230,26,1);primitive(1231,26,2);primitive(1134,26,3);
primitive(1232,26,4);primitive(1136,26,5);primitive(1233,26,124);
primitive(1234,80,3);primitive(1235,80,4);primitive(1236,80,1);
primitive(1237,37,99);primitive(1238,37,100);primitive(1239,37,101);
primitive(1240,37,102);{:1114}{1131:}primitive(1271,49,1);
primitive(1272,49,0);{:1131}{1150:}primitive(1283,31,14);
primitive(1284,31,13);primitive(1285,31,12);primitive(1286,29,0);
primitive(1287,29,1);primitive(1288,30,0);primitive(1289,30,1);
{:1150}{1157:}primitive(45,53,1);primitive(364,53,0);
{:1157}{1184:}primitive(1326,54,0);primitive(1327,54,1);
{:1184}{1199:}primitive(1033,56,18);primitive(1034,56,19);
primitive(1035,56,20);primitive(1036,56,21);primitive(1037,56,22);
primitive(1038,56,23);primitive(1039,56,24);primitive(1040,56,25);
primitive(1042,56,28);primitive(1041,56,29);primitive(1331,57,0);
primitive(1046,57,1);primitive(1047,57,2);
{:1199}{1212:}primitive(1028,59,0);primitive(1029,59,2);
primitive(1030,59,4);primitive(1031,59,6);
{:1212}{1221:}primitive(1349,58,0);primitive(1350,58,1);
primitive(1351,58,2);primitive(1352,58,3);primitive(1353,58,4);
primitive(1354,58,5);{:1221}{1231:}primitive(1043,55,32);
primitive(1044,55,33);hash[38813].rh:=1044;eqtb[38813]:=eqtb[curval];
{:1231}{1251:}primitive(1374,108,1);primitive(1375,108,2);
primitive(1376,108,4);primitive(1377,112,0);primitive(1378,112,1);
primitive(1379,112,2);primitive(1380,112,3);
{:1251}{1262:}primitive(1397,109,0);primitive(1398,109,1);
{:1262}{1265:}primitive(1399,110,0);primitive(1400,110,9);
primitive(1401,110,1);primitive(1402,110,2);primitive(1403,110,3);
primitive(1404,110,4);primitive(1405,110,5);primitive(1406,110,6);
primitive(1407,110,7);if mltexp then begin primitive(1408,110,8);end;
{:1265}{1273:}primitive(443,98,51759);primitive(444,98,63663);
primitive(445,98,64175);primitive(462,98,113849);
primitive(1413,98,113977);primitive(459,98,78137);
primitive(460,98,90041);primitive(461,98,101945);
primitive(534,98,114701);primitive(1414,98,114829);
primitive(440,99,50986);primitive(441,99,51242);primitive(442,99,51498);
{:1273}{1294:}primitive(1110,114,0);primitive(1122,114,1);
{:1294}{1298:}primitive(1432,88,0);primitive(1433,88,1);
{:1298}{1306:}primitive(275,115,0);primitive(276,115,1);
primitive(277,115,2);primitive(1442,115,3);
{:1306}{1316:}primitive(1443,66,1);primitive(1444,66,0);
{:1316}{1321:}primitive(1445,64,0);primitive(1446,64,1);
{:1321}{1330:}primitive(1452,63,78137);primitive(1453,63,90041);
{:1330}{1335:}primitive(1454,25,0);primitive(1455,25,1);
primitive(1456,25,2);primitive(1457,25,3);primitive(1458,25,7);
{:1335}{1388:}primitive(1502,65,0);primitive(684,65,1);writeloc:=curval;
primitive(1503,65,2);primitive(1504,65,3);hash[38820].rh:=1504;
eqtb[38820]:=eqtb[curval];primitive(1505,65,5);primitive(1506,65,6);
primitive(1507,65,7);{:1388}{1682:}primitive(458,91,0);
{:1682}{1688:}primitive(1672,116,1);primitive(1673,116,0);
primitive(1674,116,3);primitive(1675,116,2);primitive(1676,117,0);
primitive(1677,117,1);primitive(1678,117,2);
{:1688}{1694:}primitive(1691,79,0);primitive(1692,79,1);
primitive(1693,90,76079);{:1694}{1699:}primitive(1696,89,1);
primitive(1697,89,2);{:1699}{1747:}primitive(1719,83,114429);{:1747};
nonewcontrolsequence:=true;end;
endif('INITEX'){:1380}{1382:}ifdef('TEXMF_DEBUG')procedure debughelp;
label 888,10;var k,l,m,n:integer;begin;while true do begin;
printnl(1501);fflush(stdout);read(stdin,m);
if m<0 then goto 10 else if m=0 then dumpcore else begin read(stdin,n);
case m of{1383:}1:printword(mem[n]);2:printint(mem[n].hh.lh);
3:printint(mem[n].hh.rh);4:printword(eqtb[n]);
5:begin printscaled(fontinfo[n].int);printchar(32);
printint(fontinfo[n].qqqq.b0);printchar(58);
printint(fontinfo[n].qqqq.b1);printchar(58);
printint(fontinfo[n].qqqq.b2);printchar(58);
printint(fontinfo[n].qqqq.b3);end;6:printword(savestack[n]);
7:showbox(n);8:begin breadthmax:=10000;
depththreshold:=poolsize-poolptr-10;shownodelist(n);end;
9:showtokenlist(n,-1073741823,1000);10:slowprint(n);11:checkmem(n>0);
12:searchmem(n);13:begin read(stdin,l);printcmdchr(n,l);end;
14:for k:=0 to n do print(buffer[k]);15:begin fontinshortdisplay:=0;
shortdisplay(n);end;16:panicking:=not panicking;
{:1383}others:print(63)end;end;end;10:end;
endif('TEXMF_DEBUG'){:1382}{:1374}{1376:}procedure mainbody;
begin bounddefault:=0;boundname:='mem_bot';
setupboundvariable(addressof(membot),boundname,bounddefault);
bounddefault:=250000;boundname:='main_memory';
setupboundvariable(addressof(mainmemory),boundname,bounddefault);
bounddefault:=0;boundname:='extra_mem_top';
setupboundvariable(addressof(extramemtop),boundname,bounddefault);
bounddefault:=0;boundname:='extra_mem_bot';
setupboundvariable(addressof(extramembot),boundname,bounddefault);
bounddefault:=200000;boundname:='pool_size';
setupboundvariable(addressof(poolsize),boundname,bounddefault);
bounddefault:=75000;boundname:='string_vacancies';
setupboundvariable(addressof(stringvacancies),boundname,bounddefault);
bounddefault:=5000;boundname:='pool_free';
setupboundvariable(addressof(poolfree),boundname,bounddefault);
bounddefault:=15000;boundname:='max_strings';
setupboundvariable(addressof(maxstrings),boundname,bounddefault);
bounddefault:=100;boundname:='strings_free';
setupboundvariable(addressof(stringsfree),boundname,bounddefault);
bounddefault:=100000;boundname:='font_mem_size';
setupboundvariable(addressof(fontmemsize),boundname,bounddefault);
bounddefault:=500;boundname:='font_max';
setupboundvariable(addressof(fontmax),boundname,bounddefault);
bounddefault:=20000;boundname:='trie_size';
setupboundvariable(addressof(triesize),boundname,bounddefault);
bounddefault:=659;boundname:='hyph_size';
setupboundvariable(addressof(hyphsize),boundname,bounddefault);
bounddefault:=3000;boundname:='buf_size';
setupboundvariable(addressof(bufsize),boundname,bounddefault);
bounddefault:=50;boundname:='nest_size';
setupboundvariable(addressof(nestsize),boundname,bounddefault);
bounddefault:=15;boundname:='max_in_open';
setupboundvariable(addressof(maxinopen),boundname,bounddefault);
bounddefault:=60;boundname:='param_size';
setupboundvariable(addressof(paramsize),boundname,bounddefault);
bounddefault:=4000;boundname:='save_size';
setupboundvariable(addressof(savesize),boundname,bounddefault);
bounddefault:=300;boundname:='stack_size';
setupboundvariable(addressof(stacksize),boundname,bounddefault);
bounddefault:=16384;boundname:='dvi_buf_size';
setupboundvariable(addressof(dvibufsize),boundname,bounddefault);
bounddefault:=79;boundname:='error_line';
setupboundvariable(addressof(errorline),boundname,bounddefault);
bounddefault:=50;boundname:='half_error_line';
setupboundvariable(addressof(halferrorline),boundname,bounddefault);
bounddefault:=79;boundname:='max_print_line';
setupboundvariable(addressof(maxprintline),boundname,bounddefault);
bounddefault:=0;boundname:='hash_extra';
setupboundvariable(addressof(hashextra),boundname,bounddefault);
bounddefault:=10000;boundname:='expand_depth';
setupboundvariable(addressof(expanddepth),boundname,bounddefault);
begin if membot<infmembot then membot:=infmembot else if membot>
supmembot then membot:=supmembot end;
begin if mainmemory<infmainmemory then mainmemory:=infmainmemory else if
mainmemory>supmainmemory then mainmemory:=supmainmemory end;
ifdef('INITEX')if iniversion then begin extramemtop:=0;extramembot:=0;
end;endif('INITEX')if extramembot>supmainmemory then extramembot:=
supmainmemory;
if extramemtop>supmainmemory then extramemtop:=supmainmemory;
memtop:=membot+mainmemory-1;memmin:=membot;memmax:=memtop;
begin if triesize<inftriesize then triesize:=inftriesize else if
triesize>suptriesize then triesize:=suptriesize end;
begin if hyphsize<infhyphsize then hyphsize:=infhyphsize else if
hyphsize>suphyphsize then hyphsize:=suphyphsize end;
begin if bufsize<infbufsize then bufsize:=infbufsize else if bufsize>
supbufsize then bufsize:=supbufsize end;
begin if nestsize<infnestsize then nestsize:=infnestsize else if
nestsize>supnestsize then nestsize:=supnestsize end;
begin if maxinopen<infmaxinopen then maxinopen:=infmaxinopen else if
maxinopen>supmaxinopen then maxinopen:=supmaxinopen end;
begin if paramsize<infparamsize then paramsize:=infparamsize else if
paramsize>supparamsize then paramsize:=supparamsize end;
begin if savesize<infsavesize then savesize:=infsavesize else if
savesize>supsavesize then savesize:=supsavesize end;
begin if stacksize<infstacksize then stacksize:=infstacksize else if
stacksize>supstacksize then stacksize:=supstacksize end;
begin if dvibufsize<infdvibufsize then dvibufsize:=infdvibufsize else if
dvibufsize>supdvibufsize then dvibufsize:=supdvibufsize end;
begin if poolsize<infpoolsize then poolsize:=infpoolsize else if
poolsize>suppoolsize then poolsize:=suppoolsize end;
begin if stringvacancies<infstringvacancies then stringvacancies:=
infstringvacancies else if stringvacancies>supstringvacancies then
stringvacancies:=supstringvacancies end;
begin if poolfree<infpoolfree then poolfree:=infpoolfree else if
poolfree>suppoolfree then poolfree:=suppoolfree end;
begin if maxstrings<infmaxstrings then maxstrings:=infmaxstrings else if
maxstrings>supmaxstrings then maxstrings:=supmaxstrings end;
begin if stringsfree<infstringsfree then stringsfree:=infstringsfree
else if stringsfree>supstringsfree then stringsfree:=supstringsfree end;
begin if fontmemsize<inffontmemsize then fontmemsize:=inffontmemsize
else if fontmemsize>supfontmemsize then fontmemsize:=supfontmemsize end;
begin if fontmax<inffontmax then fontmax:=inffontmax else if fontmax>
supfontmax then fontmax:=supfontmax end;
begin if hashextra<infhashextra then hashextra:=infhashextra else if
hashextra>suphashextra then hashextra:=suphashextra end;
if errorline>255 then errorline:=255;
buffer:=xmallocarray(ASCIIcode,bufsize);
buffer2:=xmallocarray(ASCIIcode,bufsize);
nest:=xmallocarray(liststaterecord,nestsize);
savestack:=xmallocarray(memoryword,savesize);
inputstack:=xmallocarray(instaterecord,stacksize);
inputfile:=xmallocarray(alphafile,maxinopen);
linestack:=xmallocarray(integer,maxinopen);
eofseen:=xmallocarray(boolean,maxinopen);
grpstack:=xmallocarray(savepointer,maxinopen);
ifstack:=xmallocarray(halfword,maxinopen);
sourcefilenamestack:=xmallocarray(strnumber,maxinopen);
fullsourcefilenamestack:=xmallocarray(strnumber,maxinopen);
paramstack:=xmallocarray(halfword,paramsize);
dvibuf:=xmallocarray(eightbits,dvibufsize);
hyphword:=xmallocarray(strnumber,hyphsize);
hyphlist:=xmallocarray(halfword,hyphsize);
hyphlink:=xmallocarray(hyphpointer,hyphsize);
ifdef('INITEX')if iniversion then begin yzmem:=xmallocarray(memoryword,
memtop-membot+1);zmem:=yzmem-membot;eqtbtop:=116261+hashextra;
if hashextra=0 then hashtop:=49924 else hashtop:=eqtbtop;
yhash:=xmallocarray(twohalves,1+hashtop-hashoffset);
hash:=yhash-hashoffset;hash[23810].lh:=0;hash[23810].rh:=0;
for hashused:=23811 to hashtop do hash[hashused]:=hash[23810];
zeqtb:=xmallocarray(memoryword,eqtbtop);eqtb:=zeqtb;
strstart:=xmallocarray(poolpointer,maxstrings);
strpool:=xmallocarray(packedASCIIcode,poolsize);
fontinfo:=xmallocarray(memoryword,fontmemsize);end;
endif('INITEX')history:=3;;if readyalready=314159 then goto 1;
{14:}bad:=0;
if(halferrorline<30)or(halferrorline>errorline-15)then bad:=1;
if maxprintline<60 then bad:=2;if dvibufsize mod 8<>0 then bad:=3;
if membot+1100>memtop then bad:=4;if 8501>15000 then bad:=5;
if maxinopen>=128 then bad:=6;if memtop<267 then bad:=7;
{:14}{131:}ifdef('INITEX')if(memmin<>membot)or(memmax<>memtop)then bad:=
10;endif('INITEX')if(memmin>membot)or(memmax<memtop)then bad:=10;
if(0>0)or(65535<127)then bad:=11;
if(-1073741823>0)or(1073741823<32767)then bad:=12;
if(0<-1073741823)or(65535>1073741823)then bad:=13;
if(membot-supmainmemory<-1073741823)or(memtop+supmainmemory>=1073741823)
or(0<>0)then bad:=14;
if(9000<-1073741823)or(9000>1073741823)then bad:=15;
if fontmax>9000 then bad:=16;
if(savesize>1073741823)or(maxstrings>1073741823)then bad:=17;
if bufsize>1073741823 then bad:=18;if 65535<255 then bad:=19;
{:131}{320:}if 536987172+hashextra>1073741823 then bad:=21;
if(hashoffset<0)or(hashoffset>23810)then bad:=42;
{:320}{560:}if formatdefaultlength>maxint then bad:=31;
{:560}{1293:}if 2*1073741823<memtop-memmin then bad:=41;
{:1293}if bad>0 then begin writeln(stdout,
'Ouch---my internal constants have been clobbered!','---case ',bad:1);
goto 9999;end;initialize;
ifdef('INITEX')if iniversion then begin if not getstringsstarted then
goto 9999;initprim;initstrptr:=strptr;initpoolptr:=poolptr;
fixdateandtime;end;endif('INITEX')readyalready:=314159;
1:{56:}selector:=17;tally:=0;termoffset:=0;fileoffset:=0;kcodepos:=0;
{:56}{62:}if srcspecialsp or filelineerrorstylep or parsefirstlinep then
write(stdout,'This is e-upTeX, Version 3.141592653','-p4.1.2','-u2.02',
'-251130','-2.6')else write(stdout,
'This is e-upTeX, Version 3.141592653','-p4.1.2','-u2.02','-251130',
'-2.6');write(stdout,' (');write(stdout,conststringcast(getencstring));
write(stdout,')');write(stdout,versionstring);
if formatident=0 then writeln(stdout,' (preloaded format=',dumpname,')')
else begin slowprint(formatident);println;end;
if shellenabledp then begin write(stdout,' ');
if restrictedshell then begin write(stdout,'restricted ');end;
writeln(stdout,'\write18 enabled.');end;
if srcspecialsp then begin writeln(stdout,' Source specials enabled.')
end;if translatefilename then begin write(stdout,' (');
fputs(translatefilename,stdout);writeln(stdout,')');end;fflush(stdout);
{:62}{566:}jobname:=0;nameinprogress:=false;logopened:=false;
{:566}{571:}outputfilename:=0;{:571};
{1381:}begin{361:}begin inputptr:=0;maxinstack:=0;
sourcefilenamestack[0]:=0;fullsourcefilenamestack[0]:=0;inopen:=0;
openparens:=0;maxbufstack:=0;grpstack[0]:=0;ifstack[0]:=-1073741823;
paramptr:=0;maxparamstack:=0;first:=bufsize;repeat buffer[first]:=0;
buffer2[first]:=0;decr(first);until first=0;buffer[0]:=0;
scannerstatus:=0;warningindex:=-1073741823;first:=1;
curinput.statefield:=85;curinput.startfield:=1;curinput.indexfield:=0;
line:=0;curinput.namefield:=0;forceeof:=false;alignstate:=1000000;
if not initterminal then goto 9999;curinput.limitfield:=last;
first:=last+1;end{:361};
{1425:}ifdef('INITEX')if(etexp or(buffer[curinput.locfield]=42))and(
formatident=1471)then begin nonewcontrolsequence:=false;
{1426:}primitive(1537,78,3);primitive(1538,78,4);primitive(1539,78,5);
primitive(1540,78,6);primitive(1541,78,18);primitive(864,126,16);
primitive(565,121,1);primitive(865,126,18);primitive(866,126,19);
primitive(867,126,20);primitive(868,126,21);primitive(869,126,22);
primitive(870,126,23);primitive(1508,65,8);primitive(558,84,114980);
primitive(559,84,114981);primitive(1542,78,13);primitive(1543,78,14);
primitive(1544,78,15);primitive(932,123,21);primitive(871,126,24);
primitive(872,126,25);primitive(1545,78,17);primitive(1509,65,9);
primitive(1546,78,16);primitive(1510,65,10);primitive(873,126,26);
primitive(874,126,27);{:1426}{1434:}primitive(1548,82,50468);
primitive(1549,83,114430);primitive(1550,83,114431);
primitive(1551,83,114432);primitive(1552,83,114433);
primitive(1553,83,114434);primitive(1554,83,114435);
primitive(1555,83,114436);primitive(1556,83,114437);
primitive(1557,83,114438);primitive(1558,83,114439);
primitive(1559,83,114440);primitive(1560,83,114441);
primitive(1561,83,114442);primitive(1562,83,114443);
{:1434}{1440:}primitive(1577,78,19);primitive(1578,78,20);
{:1440}{1443:}primitive(1579,78,21);primitive(1580,78,22);
primitive(1581,78,23);{:1443}{1446:}primitive(1582,78,29);
primitive(1583,78,30);primitive(1584,78,31);primitive(1585,78,32);
{:1446}{1449:}primitive(1586,78,33);primitive(1587,78,34);
primitive(1588,78,35);{:1449}{1452:}primitive(1589,25,4);
{:1452}{1461:}primitive(1591,25,5);{:1461}{1463:}primitive(1592,127,1);
primitive(1593,127,5);{:1463}{1466:}primitive(1594,25,6);
{:1466}{1469:}primitive(1598,95,2);{:1469}{1474:}primitive(1045,55,1);
{:1474}{1478:}primitive(1602,83,114444);primitive(1603,39,6);
primitive(1604,39,7);primitive(1605,39,10);primitive(1606,39,11);
{:1478}{1528:}primitive(1615,122,2);{:1528}{1540:}primitive(1617,111,1);
{:1540}{1543:}primitive(931,120,1);primitive(1618,123,17);
primitive(1619,123,18);primitive(1620,123,19);primitive(1621,123,20);
{:1543}{1551:}primitive(1388,108,8);{:1551}{1559:}primitive(1627,78,40);
primitive(1628,78,41);primitive(1629,78,42);primitive(1630,78,43);
{:1559}{1582:}primitive(1634,78,24);primitive(1635,78,25);
primitive(1636,78,36);primitive(1637,78,37);
{:1582}{1586:}primitive(1638,78,38);primitive(1639,78,39);
{:1586}{1590:}primitive(1640,24,5);primitive(1641,128,5);
primitive(1642,128,6);primitive(1643,128,7);primitive(1644,128,8);
primitive(1645,128,9);{:1590}{1642:}primitive(1649,30,2);
primitive(1650,30,3);{:1642}{1645:}primitive(1651,97,50725);
primitive(1652,97,50726);primitive(1653,97,50727);
primitive(1654,97,50728);{:1645}{1737:}primitive(1716,78,26);
primitive(1717,78,27);{:1737}{1740:}primitive(1718,78,28);
{:1740}if(buffer[curinput.locfield]=42)then incr(curinput.locfield);
eTeXmode:=1;{1594:}maxregnum:=65535;maxreghelpline:=1646;{:1594}end;
endif('INITEX')if not nonewcontrolsequence then nonewcontrolsequence:=
true else{:1425}if(formatident=0)or(buffer[curinput.locfield]=38)or
dumpline then begin if formatident<>0 then initialize;
if not openfmtfile then goto 9999;
if not loadfmtfile then begin wclose(fmtfile);goto 9999;end;
wclose(fmtfile);eqtb:=zeqtb;
while(curinput.locfield<curinput.limitfield)and(buffer[curinput.locfield
]=32)do incr(curinput.locfield);end;
if(eTeXmode=1)then writeln(stdout,'entering extended mode');
if(eqtb[114410].int<0)or(eqtb[114410].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[114410].int;
if mltexenabledp then begin writeln(stdout,'MLTeX v2.2 enabled');end;
last:=ptencconvfirstline(curinput.locfield,last,buffer,bufsize);
curinput.limitfield:=last;fixdateandtime;isprintutf8:=false;
randomseed:=(microseconds*1000)+(epochseconds mod 1000000);
initrandoms(randomseed);
ifdef('INITEX')if trienotready then begin trietrl:=xmallocarray(
triepointer,triesize);trietro:=xmallocarray(triepointer,triesize);
trietrc:=xmallocarray(quarterword,triesize);
triec:=xmallocarray(packedASCIIcode,triesize);
trieo:=xmallocarray(trieopcode,triesize);
triel:=xmallocarray(triepointer,triesize);
trier:=xmallocarray(triepointer,triesize);
triehash:=xmallocarray(triepointer,triesize);
trietaken:=xmallocarray(boolean,triesize);triel[0]:=0;triec[0]:=0;
trieptr:=0;trier[0]:=0;hyphstart:=0;
fontdir:=xmallocarray(eightbits,fontmax);
fontenc:=xmallocarray(eightbits,fontmax);
fontnumext:=xmallocarray(integer,fontmax);
fontcheck:=xmallocarray(fourquarters,fontmax);
fontsize:=xmallocarray(scaled,fontmax);
fontdsize:=xmallocarray(scaled,fontmax);
fontparams:=xmallocarray(fontindex,fontmax);
fontname:=xmallocarray(strnumber,fontmax);
fontarea:=xmallocarray(strnumber,fontmax);
fontbc:=xmallocarray(sixteenbits,fontmax);
fontec:=xmallocarray(sixteenbits,fontmax);
fontglue:=xmallocarray(halfword,fontmax);
hyphenchar:=xmallocarray(integer,fontmax);
skewchar:=xmallocarray(integer,fontmax);
bcharlabel:=xmallocarray(fontindex,fontmax);
fontbchar:=xmallocarray(ninebits,fontmax);
fontfalsebchar:=xmallocarray(ninebits,fontmax);
ctypebase:=xmallocarray(integer,fontmax);
charbase:=xmallocarray(integer,fontmax);
widthbase:=xmallocarray(integer,fontmax);
heightbase:=xmallocarray(integer,fontmax);
depthbase:=xmallocarray(integer,fontmax);
italicbase:=xmallocarray(integer,fontmax);
ligkernbase:=xmallocarray(integer,fontmax);
kernbase:=xmallocarray(integer,fontmax);
extenbase:=xmallocarray(integer,fontmax);
parambase:=xmallocarray(integer,fontmax);fontptr:=0;fmemptr:=7;
fontdir[0]:=0;fontenc[0]:=0;fontnumext[0]:=0;fontname[0]:=960;
fontarea[0]:=349;hyphenchar[0]:=45;skewchar[0]:=-1;bcharlabel[0]:=0;
fontbchar[0]:=11904;fontfalsebchar[0]:=11904;fontbc[0]:=1;fontec[0]:=0;
fontsize[0]:=0;fontdsize[0]:=0;ctypebase[0]:=0;charbase[0]:=0;
widthbase[0]:=0;heightbase[0]:=0;depthbase[0]:=0;italicbase[0]:=0;
ligkernbase[0]:=0;kernbase[0]:=0;extenbase[0]:=0;
fontglue[0]:=-1073741823;fontparams[0]:=7;parambase[0]:=-1;
for fontk:=0 to 6 do fontinfo[fontk].int:=0;end;
endif('INITEX')fontused:=xmallocarray(boolean,fontmax);
for fontk:=0 to fontmax do fontused[fontk]:=false;
{806:}magicoffset:=strstart[1061]-9*18{:806};
{77:}if interaction=0 then selector:=16 else selector:=17{:77};
if(curinput.locfield<curinput.limitfield)and(eqtb[51759+buffer[curinput.
locfield]].hh.rh<>0)then startinput;end{:1381};history:=0;
{1752:}synctexinitcommand;{:1752}maincontrol;finalcleanup;
closefilesandterminate;9999:begin fflush(stdout);readyalready:=0;
if(history<>0)and(history<>1)then uexit(1)else uexit(0);end;end;
{:1376}{1662:}procedure scanfilenamebraced;
var savescannerstatus:smallnumber;savedefref:halfword;
savecurcs:halfword;s:strnumber;p:halfword;i:integer;
savestopatspace:boolean;dummy:boolean;
begin savescannerstatus:=scannerstatus;savedefref:=defref;
savecurcs:=curcs;curcs:=warningindex;if scantoks(false,true)<>0 then;
oldsetting:=selector;selector:=21;
showtokenlist(mem[defref].hh.rh,-1073741823,poolsize-poolptr);
selector:=oldsetting;s:=makestring;deletetokenref(defref);
defref:=savedefref;curcs:=savecurcs;scannerstatus:=savescannerstatus;
savestopatspace:=stopatspace;stopatspace:=false;beginname;
for i:=strstart[s]to strstart[s+1]-1 do if strpool[i]>=256 then begin
begin if poolptr+1>poolsize then overflow(260,poolsize-initpoolptr);end;
begin strpool[poolptr]:=strpool[i];incr(poolptr);end;
end else dummy:=morename(strpool[i]);stopatspace:=savestopatspace;end;
{:1662}{1794:}function getnullstr:strnumber;begin getnullstr:=349;end;
{:1794}
