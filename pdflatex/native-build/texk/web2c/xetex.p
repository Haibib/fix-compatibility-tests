{4:}{9:}{$C-,A+,D-}ifdef('TEXMF_DEBUG'){$C+,D+}endif('TEXMF_DEBUG'){:9}
program XETEX;const{11:}hashoffset=514;trieopsize=35111;
negtrieopsize=-35111;mintrieop=0;maxtrieop=65535;poolname=TEXMFPOOLNAME;
enginename=TEXMFENGINENAME;infmembot=0;supmembot=1;infmainmemory=3000;
supmainmemory=256000000;inftriesize=8000;suptriesize=4194303;
infmaxstrings=3000;supmaxstrings=2097151;infstringsfree=100;
supstringsfree=supmaxstrings;infbufsize=500;supbufsize=30000000;
infnestsize=40;supnestsize=4000;infmaxinopen=6;supmaxinopen=127;
infparamsize=60;supparamsize=32767;infsavesize=600;supsavesize=30000000;
infstacksize=200;supstacksize=30000;infdvibufsize=800;
supdvibufsize=65536;inffontmemsize=20000;supfontmemsize=147483647;
supfontmax=9000;inffontmax=50;infpoolsize=32000;suppoolsize=40000000;
infpoolfree=1000;suppoolfree=suppoolsize;infstringvacancies=8000;
supstringvacancies=suppoolsize-23000;suphashextra=supmaxstrings;
infhashextra=0;suphyphsize=65535;infhyphsize=610;infexpanddepth=10;
supexpanddepth=10000000;{:11}type{18:}UTF16code=0..65535;
UTF8code=0..255;UnicodeScalar=0..1114111;{:18}{25:}eightbits=0..255;
alphafile=packed file of UTF16code;bytefile=packed file of eightbits;
{:25}{38:}poolpointer=integer;strnumber=0..2097151;
packedUTF16code=0..65535;{:38}{105:}scaled=integer;
nonnegativeinteger=0..2147483647;smallnumber=0..4095;{:105}{113:}{:113}
{135:}quarterword=0..65535;halfword=-268435455..1073741823;
twochoices=1..2;fourchoices=1..4;#include "texmfmem.h";wordfile=gzFile;
{:135}{174:}glueord=0..3;{:174}{238:}
liststaterecord=record modefield:-209..209;headfield,tailfield:halfword;
eTeXauxfield:halfword;pgfield,mlfield:integer;auxfield:memoryword;end;
{:238}{299:}groupcode=0..16;{:299}{330:}
instaterecord=record statefield,indexfield:quarterword;
startfield,locfield,limitfield,namefield:halfword;
synctextagfield:integer;end;{:330}{583:}internalfontnumber=integer;
fontindex=integer;ninebits=0..65536;{:583}{630:}dviindex=0..dvibufsize;
{:630}{974:}triepointer=0..4194303;trieopcode=0..65535;{:974}{979:}
hyphpointer=0..65535;{:979}{1488:}savepointer=0..savesize;{:1488}
var{13:}bad:integer;{:13}{20:}xchr:^UTF16code;{:20}{26:}
nameoffile:^UTF8code;nameoffile16:^UTF16code;namelength:0..maxint;
namelength16:0..maxint;{:26}{30:}buffer:^UnicodeScalar;first:0..bufsize;
last:0..bufsize;maxbufstack:0..bufsize;{:30}{32:}
ifdef('INITEX')iniversion:boolean;dumpoption:boolean;dumpline:boolean;
endif('INITEX')dumpname:constcstring;termin:unicodefile;
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
{:32}{39:}strpool:^packedUTF16code;strstart:^poolpointer;
poolptr:poolpointer;strptr:strnumber;initpoolptr:poolpointer;
initstrptr:strnumber;{:39}{50:}ifdef('INITEX')poolfile:alphafile;
endif('INITEX'){:50}{54:}logfile:alphafile;selector:0..21;
dig:array[0..22]of 0..15;tally:integer;termoffset:0..maxprintline;
fileoffset:0..maxprintline;trickbuf:array[0..255]of UnicodeScalar;
trickcount:integer;firstcount:integer;{:54}{61:}doingspecial:boolean;
nativetext:^UTF16code;nativetextsize:integer;nativelen:integer;
savenativelen:integer;{:61}{77:}interaction:0..3;interactionoption:0..4;
{:77}{80:}deletionsallowed:boolean;setboxallowed:boolean;history:0..4;
errorcount:-1..100;{:80}{83:}helpline:array[0..5]of strnumber;
helpptr:0..6;useerrhelp:boolean;{:83}{100:}interrupt:integer;
OKtointerrupt:boolean;{:100}{108:}savearitherror:boolean;
aritherror:boolean;texremainder:scaled;{:108}{114:}
randoms:array[0..54]of integer;jrandom:0..54;randomseed:scaled;{:114}
{121:}twotothe:array[0..30]of integer;speclog:array[1..28]of integer;
{:121}{137:}tempptr:halfword;{:137}{138:}yzmem:^memoryword;
zmem:^memoryword;lomemmax:halfword;himemmin:halfword;{:138}{139:}
varused,dynused:integer;{:139}{140:}avail:halfword;memend:halfword;
{:140}{146:}rover:halfword;{:146}{181:}lastleftmostchar:halfword;
lastrightmostchar:halfword;hliststack:array[0..512]of halfword;
hliststacklevel:0..512;firstp:halfword;globalprevp:halfword;{:181}{190:}
ifdef('TEXMF_DEBUG')freearr:packed array[0..9]of boolean;
wasfree:packed array[0..9]of boolean;
wasmemend,waslomax,washimin:halfword;panicking:boolean;
endif('TEXMF_DEBUG'){:190}{199:}fontinshortdisplay:integer;{:199}{207:}
depththreshold:integer;breadthmax:integer;{:207}{239:}
nest:^liststaterecord;nestptr:0..nestsize;maxneststack:0..nestsize;
curlist:liststaterecord;shownmode:-209..209;{:239}{272:}
oldsetting:0..21;oldselectorignorederr:0..21;
systime,sysday,sysmonth,sysyear:integer;{:272}{279:}zeqtb:^memoryword;
xeqlevel:array[7892264..9006998]of quarterword;{:279}{282:}
hash:^twohalves;yhash:^twohalves;hashused:halfword;hashextra:halfword;
hashtop:halfword;eqtbtop:halfword;hashhigh:halfword;
nonewcontrolsequence:boolean;cscount:integer;{:282}{283:}
prim:array[0..2100]of twohalves;primused:halfword;{:283}{301:}
savestack:^memoryword;saveptr:0..savesize;maxsavestack:0..savesize;
curlevel:quarterword;curgroup:groupcode;curboundary:0..savesize;{:301}
{316:}magset:integer;{:316}{327:}curcmd:eightbits;curchr:halfword;
curcs:halfword;curtok:halfword;{:327}{331:}inputstack:^instaterecord;
inputptr:0..stacksize;maxinstack:0..stacksize;curinput:instaterecord;
{:331}{334:}inopen:0..maxinopen;openparens:0..maxinopen;
inputfile:^unicodefile;line:integer;linestack:^integer;
sourcefilenamestack:^strnumber;fullsourcefilenamestack:^strnumber;{:334}
{335:}scannerstatus:0..5;warningindex:halfword;defref:halfword;{:335}
{338:}paramstack:^halfword;paramptr:0..paramsize;maxparamstack:integer;
{:338}{339:}alignstate:integer;{:339}{340:}baseptr:0..stacksize;{:340}
{363:}parloc:halfword;partoken:halfword;{:363}{391:}forceeof:boolean;
{:391}{397:}isincsname:boolean;{:397}{416:}
curmark:array[0..4]of halfword;{:416}{421:}longstate:114..117;{:421}
{422:}pstack:array[0..8]of halfword;{:422}{444:}curval:integer;
curval1:integer;curvallevel:0..5;{:444}{472:}radix:smallnumber;{:472}
{481:}curorder:glueord;{:481}{515:}readfile:array[0..15]of unicodefile;
readopen:array[0..16]of 0..2;{:515}{524:}condptr:halfword;iflimit:0..4;
curif:smallnumber;ifline:integer;{:524}{528:}skipline:integer;{:528}
{547:}curname:strnumber;curarea:strnumber;curext:strnumber;{:547}{548:}
areadelimiter:poolpointer;extdelimiter:poolpointer;
filenamequotechar:UTF16code;{:548}{555:}formatdefaultlength:integer;
TEXformatdefault:cstring;{:555}{562:}nameinprogress:boolean;
jobname:strnumber;logopened:boolean;{:562}{567:}
outputfileextension:strnumber;nopdfoutput:boolean;dvifile:bytefile;
outputfilename:strnumber;texmflogname:strnumber;{:567}{574:}
tfmfile:bytefile;{:574}{584:}fontinfo:^fmemoryword;fmemptr:fontindex;
fontptr:internalfontnumber;fontcheck:^fourquarters;fontsize:^scaled;
fontdsize:^scaled;fontparams:^fontindex;fontname:^strnumber;
fontarea:^strnumber;fontbc:^UTF16code;fontec:^UTF16code;
fontglue:^halfword;fontused:^boolean;hyphenchar:^integer;
skewchar:^integer;bcharlabel:^fontindex;fontbchar:^ninebits;
fontfalsebchar:^ninebits;fontlayoutengine:^voidpointer;
fontmapping:^voidpointer;fontflags:^char;fontletterspace:^scaled;
loadedfontmapping:voidpointer;loadedfontflags:char;
loadedfontletterspace:scaled;loadedfontdesignsize:scaled;
mappedtext:^UTF16code;xdvbuffer:^char;{:584}{585:}charbase:^integer;
widthbase:^integer;heightbase:^integer;depthbase:^integer;
italicbase:^integer;ligkernbase:^integer;kernbase:^integer;
extenbase:^integer;parambase:^integer;{:585}{590:}
nullcharacter:fourquarters;{:590}{628:}totalpages:integer;maxv:scaled;
maxh:scaled;maxpush:integer;lastbop:integer;deadcycles:integer;
doingleaders:boolean;c:quarterword;f:internalfontnumber;
ruleht,ruledp,rulewd:scaled;g:halfword;lq,lr:integer;{:628}{631:}
dvibuf:^eightbits;halfbuf:integer;dvilimit:integer;dviptr:integer;
dvioffset:integer;dvigone:integer;{:631}{641:}downptr,rightptr:halfword;
{:641}{652:}dvih,dviv:scaled;curh,curv:scaled;dvif:internalfontnumber;
curs:integer;{:652}{682:}epochseconds:integer;microseconds:integer;
{:682}{685:}totalstretch,totalshrink:array[glueord]of scaled;
lastbadness:integer;{:685}{686:}adjusttail:halfword;{:686}{695:}
preadjusttail:halfword;{:695}{703:}packbeginline:integer;{:703}{726:}
emptyfield:twohalves;nulldelimiter:fourquarters;{:726}{762:}
curmlist:halfword;curstyle:smallnumber;cursize:integer;curmu:scaled;
mlistpenalties:boolean;{:762}{767:}curf:internalfontnumber;curc:integer;
curi:fourquarters;{:767}{812:}magicoffset:integer;{:812}{818:}
curalign:halfword;curspan:halfword;curloop:halfword;alignptr:halfword;
curhead,curtail:halfword;curprehead,curpretail:halfword;{:818}{862:}
justbox:halfword;{:862}{869:}passive:halfword;printednode:halfword;
passnumber:halfword;{:869}{871:}activewidth:array[1..6]of scaled;
curactivewidth:array[1..6]of scaled;background:array[1..6]of scaled;
breakwidth:array[1..6]of scaled;{:871}{873:}noshrinkerroryet:boolean;
{:873}{876:}curp:halfword;secondpass:boolean;finalpass:boolean;
threshold:integer;{:876}{881:}minimaldemerits:array[0..3]of integer;
minimumdemerits:integer;bestplace:array[0..3]of halfword;
bestplline:array[0..3]of halfword;{:881}{887:}discwidth:scaled;{:887}
{895:}easyline:halfword;lastspecialline:halfword;firstwidth:scaled;
secondwidth:scaled;firstindent:scaled;secondindent:scaled;{:895}{920:}
bestbet:halfword;fewestdemerits:integer;bestline:halfword;
actuallooseness:integer;linediff:integer;{:920}{940:}
hc:array[0..4098]of 0..1114112;hn:smallnumber;ha,hb:halfword;
hf:internalfontnumber;hu:array[0..4096]of 0..65536;hyfchar:integer;
curlang,initcurlang:0..255;lhyf,rhyf,initlhyf,initrhyf:integer;
hyfbchar:halfword;maxhyphchar:integer;{:940}{953:}
hyf:array[0..4096]of 0..9;initlist:halfword;initlig:boolean;
initlft:boolean;{:953}{959:}hyphenpassed:smallnumber;{:959}{961:}
curl,curr:halfword;curq:halfword;ligstack:halfword;
ligaturepresent:boolean;lfthit,rthit:boolean;{:961}{975:}
trietrl:^triepointer;trietro:^triepointer;trietrc:^quarterword;
hyfdistance:array[1..trieopsize]of smallnumber;
hyfnum:array[1..trieopsize]of smallnumber;
hyfnext:array[1..trieopsize]of trieopcode;
opstart:array[0..255]of 0..trieopsize;{:975}{980:}hyphword:^strnumber;
hyphlist:^halfword;hyphlink:^hyphpointer;hyphcount:integer;
hyphnext:integer;{:980}{997:}
ifdef('INITEX')trieophash:array[negtrieopsize..trieopsize]of 0..
trieopsize;trieused:array[0..255]of trieopcode;
trieoplang:array[1..trieopsize]of 0..255;
trieopval:array[1..trieopsize]of trieopcode;trieopptr:0..trieopsize;
endif('INITEX')maxopused:trieopcode;smallop:boolean;{:997}{1001:}
ifdef('INITEX')triec:^packedUTF16code;trieo:^trieopcode;
triel:^triepointer;trier:^triepointer;trieptr:triepointer;
triehash:^triepointer;endif('INITEX'){:1001}{1004:}
ifdef('INITEX')trietaken:^boolean;
triemin:array[UTF16code]of triepointer;triemax:triepointer;
trienotready:boolean;endif('INITEX'){:1004}{1025:}
bestheightplusdepth:scaled;{:1025}{1034:}pagetail:halfword;
pagecontents:0..2;pagemaxdepth:scaled;bestpagebreak:halfword;
leastpagecost:integer;bestsize:scaled;{:1034}{1036:}
pagesofar:array[0..7]of scaled;lastglue:halfword;lastpenalty:integer;
lastkern:scaled;lastnodetype:integer;insertpenalties:integer;{:1036}
{1043:}outputactive:boolean;outputcanend:boolean;{:1043}{1086:}
mainf:internalfontnumber;maini:fourquarters;mainj:fourquarters;
maink:fontindex;mainp:halfword;mainpp,mainppp:halfword;mainh:halfword;
ishyph:boolean;spaceclass:integer;prevclass:integer;mains:integer;
bchar:halfword;falsebchar:halfword;cancelboundary:boolean;
insdisc:boolean;{:1086}{1128:}curbox:halfword;{:1128}{1320:}
aftertoken:halfword;{:1320}{1335:}longhelpseen:boolean;{:1335}{1353:}
formatident:strnumber;{:1353}{1359:}fmtfile:wordfile;{:1359}{1385:}
readyalready:integer;{:1385}{1396:}writefile:array[0..15]of alphafile;
writeopen:array[0..17]of boolean;{:1396}{1400:}writeloc:halfword;{:1400}
{1429:}curpagewidth:scaled;curpageheight:scaled;curhoffset:scaled;
curvoffset:scaled;{:1429}{1449:}pdflastxpos:integer;pdflastypos:integer;
{:1449}{1462:}eTeXmode:0..1;etexp:boolean;{:1462}{1470:}
eofseen:^boolean;{:1470}{1515:}LRptr:halfword;LRproblems:integer;
curdir:smallnumber;{:1515}{1561:}pseudofiles:halfword;{:1561}{1584:}
grpstack:^savepointer;ifstack:^halfword;{:1584}{1625:}
maxregnum:halfword;maxreghelpline:strnumber;{:1625}{1627:}
saroot:array[0..7]of halfword;curptr:halfword;sanull:memoryword;{:1627}
{1646:}sachain:halfword;salevel:quarterword;{:1646}{1653:}
lastlinefill:halfword;dolastlinefit:boolean;activenodesize:smallnumber;
fillwidth:array[0..2]of scaled;bestplshort:array[0..3]of scaled;
bestplglue:array[0..3]of scaled;{:1653}{1669:}hyphstart:triepointer;
hyphindex:triepointer;{:1669}{1670:}discptr:array[1..3]of halfword;
{:1670}{1678:}editnamestart:poolpointer;editnamelength,editline:integer;
ipcon:cinttype;stopatspace:boolean;{:1678}{1680:}savestrptr:strnumber;
savepoolptr:poolpointer;shellenabledp:cinttype;restrictedshell:cinttype;
outputcomment:^char;k,l:0..255;{:1680}{1682:}debugformatfile:boolean;
{:1682}{1687:}expanddepthcount:integer;{:1687}{1690:}mltexp:boolean;
{:1690}{1691:}mltexenabledp:boolean;nativefonttypeflag:integer;
xtxligaturepresent:boolean;{:1691}{1696:}accentc,basec,replacec:integer;
iac,ibc:fourquarters;baseslant,accentslant:real;basexheight:scaled;
basewidth,baseheight:scaled;accentwidth,accentheight:scaled;
delta:scaled;{:1696}{1704:}synctexoption:integer;{:1704}{1709:}
synctexoffset:integer;{:1709}procedure initialize;var{19:}i:integer;
{:19}{188:}k:integer;{:188}{981:}z:hyphpointer;{:981}begin{8:}{23:}{:23}
{24:}{:24}{62:}doingspecial:=false;nativetextsize:=128;
nativetext:=xmalloc(nativetextsize*sizeof(UTF16code));{:62}{78:}
if interactionoption=4 then interaction:=3 else interaction:=
interactionoption;{:78}{81:}deletionsallowed:=true;setboxallowed:=true;
errorcount:=0;{:81}{84:}helpptr:=0;useerrhelp:=false;{:84}{101:}
interrupt:=0;OKtointerrupt:=true;{:101}{122:}twotothe[0]:=1;
for k:=1 to 30 do twotothe[k]:=2*twotothe[k-1];speclog[1]:=93032640;
speclog[2]:=38612034;speclog[3]:=17922280;speclog[4]:=8662214;
speclog[5]:=4261238;speclog[6]:=2113709;speclog[7]:=1052693;
speclog[8]:=525315;speclog[9]:=262400;speclog[10]:=131136;
speclog[11]:=65552;speclog[12]:=32772;speclog[13]:=16385;
for k:=14 to 27 do speclog[k]:=twotothe[27-k];speclog[28]:=1;{:122}
{191:}ifdef('TEXMF_DEBUG')wasmemend:=memmin;waslomax:=memmin;
washimin:=memmax;panicking:=false;endif('TEXMF_DEBUG'){:191}{241:}
nestptr:=0;maxneststack:=0;curlist.modefield:=1;
curlist.headfield:=memtop-1;curlist.tailfield:=memtop-1;
curlist.eTeXauxfield:=-268435455;curlist.auxfield.int:=-65536000;
curlist.mlfield:=0;curlist.pgfield:=0;shownmode:=0;pagecontents:=0;
pagetail:=memtop-2;lastglue:=1073741823;lastpenalty:=0;lastkern:=0;
lastnodetype:=-1;pagesofar[7]:=0;pagemaxdepth:=0;{:241}{280:}
for k:=7892264 to 9006998 do xeqlevel[k]:=1;{:280}{284:}
nonewcontrolsequence:=true;prim[0].lh:=0;prim[0].rh:=0;
for k:=1 to 2100 do prim[k]:=prim[0];{:284}{302:}saveptr:=0;curlevel:=1;
curgroup:=0;curboundary:=0;maxsavestack:=0;{:302}{317:}magset:=0;{:317}
{398:}isincsname:=false;{:398}{417:}curmark[0]:=-268435455;
curmark[1]:=-268435455;curmark[2]:=-268435455;curmark[3]:=-268435455;
curmark[4]:=-268435455;{:417}{473:}curval:=0;curvallevel:=0;radix:=0;
curorder:=0;{:473}{516:}for k:=0 to 16 do readopen[k]:=2;{:516}{525:}
condptr:=-268435455;iflimit:=0;curif:=0;ifline:=0;{:525}{586:}{:586}
{591:}nullcharacter.b0:=0;nullcharacter.b1:=0;nullcharacter.b2:=0;
nullcharacter.b3:=0;{:591}{629:}totalpages:=0;maxv:=0;maxh:=0;
maxpush:=0;lastbop:=-1;doingleaders:=false;deadcycles:=0;curs:=-1;{:629}
{632:}halfbuf:=dvibufsize div 2;dvilimit:=dvibufsize;dviptr:=0;
dvioffset:=0;dvigone:=0;{:632}{642:}downptr:=-268435455;
rightptr:=-268435455;{:642}{687:}adjusttail:=-268435455;lastbadness:=0;
{:687}{696:}preadjusttail:=-268435455;{:696}{704:}packbeginline:=0;
{:704}{727:}emptyfield.rh:=0;emptyfield.lh:=-268435455;
nulldelimiter.b0:=0;nulldelimiter.b1:=0;nulldelimiter.b2:=0;
nulldelimiter.b3:=0;{:727}{819:}alignptr:=-268435455;
curalign:=-268435455;curspan:=-268435455;curloop:=-268435455;
curhead:=-268435455;curtail:=-268435455;curprehead:=-268435455;
curpretail:=-268435455;{:819}{941:}maxhyphchar:=256;{:941}{982:}
for z:=0 to hyphsize do begin hyphword[z]:=0;hyphlist[z]:=-268435455;
hyphlink[z]:=0;end;hyphcount:=0;hyphnext:=608;
if hyphnext>hyphsize then hyphnext:=607;{:982}{1044:}
outputactive:=false;outputcanend:=false;insertpenalties:=0;{:1044}
{1087:}ligaturepresent:=false;cancelboundary:=false;lfthit:=false;
rthit:=false;insdisc:=false;{:1087}{1321:}aftertoken:=0;{:1321}{1336:}
longhelpseen:=false;{:1336}{1354:}formatident:=0;{:1354}{1397:}
for k:=0 to 17 do writeopen[k]:=false;{:1397}{1412:}
secondsandmicros(epochseconds,microseconds);initstarttime;{:1412}{1516:}
LRptr:=-268435455;LRproblems:=0;curdir:=0;{:1516}{1562:}
pseudofiles:=-268435455;{:1562}{1628:}saroot[7]:=-268435455;
sanull.hh.lh:=-268435455;sanull.hh.rh:=-268435455;{:1628}{1647:}
sachain:=-268435455;salevel:=0;{:1647}{1671:}discptr[2]:=-268435455;
discptr[3]:=-268435455;{:1671}{1679:}editnamestart:=0;stopatspace:=true;
haltingonerrorp:=false;{:1679}{1688:}expanddepthcount:=0;{:1688}{1692:}
mltexenabledp:=false;{:1692}
ifdef('INITEX')if iniversion then begin{189:}
for k:=membot+1 to membot+19 do mem[k].int:=0;k:=membot;
while k<=membot+19 do begin mem[k].hh.rh:=-268435454;mem[k].hh.b0:=0;
mem[k].hh.b1:=0;k:=k+4;end;mem[membot+6].int:=65536;
mem[membot+4].hh.b0:=1;mem[membot+10].int:=65536;mem[membot+8].hh.b0:=2;
mem[membot+14].int:=65536;mem[membot+12].hh.b0:=1;
mem[membot+15].int:=65536;mem[membot+12].hh.b1:=1;
mem[membot+18].int:=-65536;mem[membot+16].hh.b0:=1;rover:=membot+20;
mem[rover].hh.rh:=1073741823;mem[rover].hh.lh:=1000;
mem[rover+1].hh.lh:=rover;mem[rover+1].hh.rh:=rover;
lomemmax:=rover+1000;mem[lomemmax].hh.rh:=-268435455;
mem[lomemmax].hh.lh:=-268435455;
for k:=memtop-14 to memtop do mem[k]:=mem[lomemmax];{838:}
mem[memtop-10].hh.lh:=34749086;{:838}{845:}mem[memtop-9].hh.rh:=65536;
mem[memtop-9].hh.lh:=-268435455;{:845}{868:}mem[memtop-7].hh.b0:=1;
mem[memtop-6].hh.lh:=1073741823;mem[memtop-7].hh.b1:=0;{:868}{1035:}
mem[memtop].hh.b1:=255;mem[memtop].hh.b0:=1;mem[memtop].hh.rh:=memtop;
{:1035}{1042:}mem[memtop-2].hh.b0:=10;mem[memtop-2].hh.b1:=0;{:1042};
avail:=-268435455;memend:=memtop;himemmin:=memtop-14;
varused:=membot+20-membot;dynused:=15;{:189}{248:}
eqtb[1205763].hh.b0:=104;eqtb[1205763].hh.rh:=-268435455;
eqtb[1205763].hh.b1:=0;for k:=1 to eqtbtop do eqtb[k]:=eqtb[1205763];
{:248}{254:}eqtb[1205764].hh.rh:=membot;eqtb[1205764].hh.b1:=1;
eqtb[1205764].hh.b0:=120;
for k:=1205765 to 1206294 do eqtb[k]:=eqtb[1205764];
mem[membot].hh.rh:=mem[membot].hh.rh+531;{:254}{258:}
eqtb[1206295].hh.rh:=-268435455;eqtb[1206295].hh.b0:=121;
eqtb[1206295].hh.b1:=1;
for k:=1206563 to 1206566 do eqtb[k]:=eqtb[1206295];
for k:=1206296 to 1206562 do eqtb[k]:=eqtb[1205763];
eqtb[1206567].hh.rh:=-268435455;eqtb[1206567].hh.b0:=122;
eqtb[1206567].hh.b1:=1;
for k:=1206568 to 1206822 do eqtb[k]:=eqtb[1206567];
eqtb[1206823].hh.rh:=0;eqtb[1206823].hh.b0:=123;eqtb[1206823].hh.b1:=1;
for k:=1206824 to 1207591 do eqtb[k]:=eqtb[1206823];
eqtb[1207592].hh.rh:=0;eqtb[1207592].hh.b0:=123;eqtb[1207592].hh.b1:=1;
for k:=1207593 to 7892263 do eqtb[k]:=eqtb[1207592];
for k:=0 to 1114111 do begin eqtb[1207592+k].hh.rh:=12;
eqtb[5664040+k].hh.rh:=k;eqtb[4549928+k].hh.rh:=1000;end;
eqtb[1207605].hh.rh:=5;eqtb[1207624].hh.rh:=10;eqtb[1207684].hh.rh:=0;
eqtb[1207629].hh.rh:=14;eqtb[1207719].hh.rh:=15;eqtb[1207592].hh.rh:=9;
for k:=48 to 57 do eqtb[5664040+k].hh.rh:=k+setclassfield(7);
for k:=65 to 90 do begin eqtb[1207592+k].hh.rh:=11;
eqtb[1207592+k+32].hh.rh:=11;
eqtb[5664040+k].hh.rh:=k+setfamilyfield(1)+setclassfield(7);
eqtb[5664040+k+32].hh.rh:=k+32+setfamilyfield(1)+setclassfield(7);
eqtb[2321704+k].hh.rh:=k+32;eqtb[2321704+k+32].hh.rh:=k+32;
eqtb[3435816+k].hh.rh:=k;eqtb[3435816+k+32].hh.rh:=k;
eqtb[4549928+k].hh.rh:=999;end;{:258}{266:}
for k:=7892264 to 7892607 do eqtb[k].int:=0;eqtb[7892319].int:=256;
eqtb[7892320].int:=-1;eqtb[7892281].int:=1000;eqtb[7892265].int:=10000;
eqtb[7892305].int:=1;eqtb[7892304].int:=25;eqtb[7892309].int:=92;
eqtb[7892312].int:=13;for k:=0 to 1114111 do eqtb[7892608+k].int:=-1;
eqtb[7892654].int:=0;eqtb[7892324].int:=-1;{:266}{276:}
for k:=9006720 to 9006998 do eqtb[k].int:=0;{:276}{285:}primused:=2100;
hashused:=1194650;hashhigh:=0;cscount:=0;eqtb[1194659].hh.b0:=119;
hash[1194659].rh:=65813;eqtb[1194661].hh.b0:=39;eqtb[1194661].hh.rh:=1;
eqtb[1194661].hh.b1:=1;hash[1194661].rh:=65814;{:285}{587:}{:587}{1000:}
for k:=-trieopsize to trieopsize do trieophash[k]:=0;
for k:=0 to 255 do trieused[k]:=mintrieop;maxopused:=mintrieop;
trieopptr:=0;{:1000}{1005:}trienotready:=true;{:1005}{1270:}
hash[1194650].rh:=66631;{:1270}{1355:}
if iniversion then formatident:=66713;{:1355}{1432:}
hash[1194658].rh:=66772;eqtb[1194658].hh.b1:=1;eqtb[1194658].hh.b0:=116;
eqtb[1194658].hh.rh:=-268435455;{:1432}{1463:}eTeXmode:=0;{1623:}
maxregnum:=255;maxreghelpline:=66964;{:1623}{:1463}{1629:}
for i:=0 to 6 do saroot[i]:=-268435455;{:1629}{1665:}
eqtb[7892350].int:=63;{:1665}end;endif('INITEX'){:8}{1710:}
synctexoffset:=7892351;{:1710}end;{57:}procedure println;
begin case selector of 19:begin writeln(stdout);writeln(logfile);
termoffset:=0;fileoffset:=0;end;18:begin writeln(logfile);fileoffset:=0;
end;17:begin writeln(stdout);termoffset:=0;end;16,20,21:;
others:writeln(writefile[selector])end;end;{:57}{58:}
procedure printrawchar(s:UnicodeScalar;incroffset:boolean);label 10;
begin case selector of 19:begin write(stdout,xchr[s]);
write(logfile,xchr[s]);if incroffset then begin incr(termoffset);
incr(fileoffset);end;
if termoffset=maxprintline then begin writeln(stdout);termoffset:=0;end;
if fileoffset=maxprintline then begin writeln(logfile);fileoffset:=0;
end;end;18:begin write(logfile,xchr[s]);
if incroffset then incr(fileoffset);
if fileoffset=maxprintline then println;end;
17:begin write(stdout,xchr[s]);if incroffset then incr(termoffset);
if termoffset=maxprintline then println;end;16:;
20:if tally<trickcount then trickbuf[tally mod errorline]:=s;
21:begin if poolptr<poolsize then begin if(s>65535)then begin strpool[
poolptr]:=(s-65536)div 1024+55296;incr(poolptr);
strpool[poolptr]:=(s)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=s;incr(poolptr);end;end;end;
others:write(writefile[selector],xchr[s])end;incr(tally);10:end;{:58}
{59:}procedure printchar(s:integer);label 10;var l:smallnumber;
begin if(selector>20)and(not doingspecial)then begin if s>=65536 then
begin printrawchar(55296+(s-65536)div 1024,true);
printrawchar(56320+(s-65536)mod 1024,true);
end else printrawchar(s,true);goto 10;end;if{270:}
s=eqtb[7892313].int{:270}then if selector<20 then begin println;goto 10;
end;
if(s<32)and(eightbitp=0)and(not doingspecial)then begin printrawchar(94,
true);printrawchar(94,true);printrawchar(s+64,true);
end else if s<127 then printrawchar(s,true)else if(s=127)then begin if(
eightbitp=0)and(not doingspecial)then begin printrawchar(94,true);
printrawchar(94,true);
printrawchar(63,true)end else printrawchar(s,true)end else if(s<160)and(
eightbitp=0)and(not doingspecial)then begin printrawchar(94,true);
printrawchar(94,true);l:=(s mod 256)div 16;
if l<10 then printrawchar(l+48,true)else printrawchar(l+87,true);
l:=s mod 16;
if l<10 then printrawchar(l+48,true)else printrawchar(l+87,true);
end else if selector=20 then printrawchar(s,true)else begin if s<2048
then begin printrawchar(192+s div 64,false);
printrawchar(128+s mod 64,true);
end else if s<65536 then begin printrawchar(224+(s div 4096),false);
printrawchar(128+(s mod 4096)div 64,false);
printrawchar(128+(s mod 64),true);
end else begin printrawchar(240+(s div 262144),false);
printrawchar(128+(s mod 262144)div 4096,false);
printrawchar(128+(s mod 4096)div 64,false);
printrawchar(128+(s mod 64),true);end end;10:end;{:59}{63:}
procedure print(s:integer);label 10;var j:poolpointer;nl:integer;
begin if s>=strptr then s:=65541 else if s<65535 then if s<0 then s:=
65541 else begin if selector>20 then begin printchar(s);goto 10;end;
if({270:}s=eqtb[7892313].int{:270}
)then if selector<20 then begin println;goto 10;end;
nl:=eqtb[7892313].int;eqtb[7892313].int:=-1;printchar(s);
eqtb[7892313].int:=nl;goto 10;end;j:=strstart[(s)-65536];
while j<strstart[(s+1)-65536]do begin if(strpool[j]>=55296)and(strpool[j
]<=56319)and(j+1<strstart[(s+1)-65536])and(strpool[j+1]>=56320)and(
strpool[j+1]<=57343)then begin printchar(65536+(strpool[j]-55296)*1024+
strpool[j+1]-56320);j:=j+2;end else begin printchar(strpool[j]);incr(j);
end;end;10:end;{:63}{66:}procedure printnl(s:strnumber);
begin if(selector<16)or((termoffset>0)and(odd(selector)))or((fileoffset>
0)and(selector>=18))then println;print(s);end;{:66}{67:}
procedure printesc(s:strnumber);var c:integer;begin{269:}
c:=eqtb[7892309].int{:269};if c>=0 then if c<=1114111 then printchar(c);
print(s);end;{:67}{68:}procedure printthedigs(k:eightbits);
begin while k>0 do begin decr(k);
if dig[k]<10 then printchar(48+dig[k])else printchar(55+dig[k]);end;end;
{:68}{69:}procedure printint(n:integer);var k:0..23;m:integer;
begin k:=0;if n<0 then begin printchar(45);
if n>-100000000 then n:=-n else begin m:=-1-n;n:=m div 10;
m:=(m mod 10)+1;k:=1;if m<10 then dig[0]:=m else begin dig[0]:=0;
incr(n);end;end;end;repeat dig[k]:=n mod 10;n:=n div 10;incr(k);
until n=0;printthedigs(k);end;{:69}{292:}procedure printcs(p:integer);
begin if p<1179650 then if p>=1114113 then if p=1179649 then begin
printesc(65817);printesc(65818);printchar(32);
end else begin printesc(p-1114113);
if eqtb[1207592+p-1114113].hh.rh=11 then printchar(32);
end else if p<1 then printesc(65819)else printchar(p-1)else if((p>=
1205763)and(p<=9006998))or(p>eqtbtop)then printesc(65819)else if(hash[p]
.rh>=strptr)then printesc(65820)else begin if(p>=1194662)and(p<1196762)
then printesc(prim[p-1194662].rh-1)else printesc(hash[p].rh);
printchar(32);end;end;{:292}{293:}procedure sprintcs(p:halfword);
begin if p<1179650 then if p<1114113 then printchar(p-1)else if p<
1179649 then printesc(p-1114113)else begin printesc(65817);
printesc(65818);
end else if(p>=1194662)and(p<1196762)then printesc(prim[p-1194662].rh-1)
else printesc(hash[p].rh);end;{:293}{553:}
procedure printfilename(n,a,e:integer);var mustquote:boolean;
quotechar:integer;j:poolpointer;begin mustquote:=false;quotechar:=0;
if a<>0 then begin j:=strstart[(a)-65536];
while((not mustquote)or(quotechar=0))and(j<strstart[(a+1)-65536])do
begin if strpool[j]=32 then mustquote:=true else if(strpool[j]=34)or(
strpool[j]=39)then begin mustquote:=true;quotechar:=73-strpool[j];end;
incr(j);end;end;if n<>0 then begin j:=strstart[(n)-65536];
while((not mustquote)or(quotechar=0))and(j<strstart[(n+1)-65536])do
begin if strpool[j]=32 then mustquote:=true else if(strpool[j]=34)or(
strpool[j]=39)then begin mustquote:=true;quotechar:=73-strpool[j];end;
incr(j);end;end;if e<>0 then begin j:=strstart[(e)-65536];
while((not mustquote)or(quotechar=0))and(j<strstart[(e+1)-65536])do
begin if strpool[j]=32 then mustquote:=true else if(strpool[j]=34)or(
strpool[j]=39)then begin mustquote:=true;quotechar:=73-strpool[j];end;
incr(j);end;end;
if mustquote then begin if quotechar=0 then quotechar:=34;
printchar(quotechar);end;
if a<>0 then for j:=strstart[(a)-65536]to strstart[(a+1)-65536]-1 do
begin if strpool[j]=quotechar then begin print(quotechar);
quotechar:=73-quotechar;print(quotechar);end;
if(strpool[j]>=55296)and(strpool[j]<=56319)and(j+1<strstart[(a+1)-65536]
)and(strpool[j+1]>=56320)and(strpool[j+1]<=57343)then begin printchar(
65536+(strpool[j]-55296)*1024+strpool[j+1]-56320);incr(j);
end else print(strpool[j]);end;
if n<>0 then for j:=strstart[(n)-65536]to strstart[(n+1)-65536]-1 do
begin if strpool[j]=quotechar then begin print(quotechar);
quotechar:=73-quotechar;print(quotechar);end;
if(strpool[j]>=55296)and(strpool[j]<=56319)and(j+1<strstart[(n+1)-65536]
)and(strpool[j+1]>=56320)and(strpool[j+1]<=57343)then begin printchar(
65536+(strpool[j]-55296)*1024+strpool[j+1]-56320);incr(j);
end else print(strpool[j]);end;
if e<>0 then for j:=strstart[(e)-65536]to strstart[(e+1)-65536]-1 do
begin if strpool[j]=quotechar then begin print(quotechar);
quotechar:=73-quotechar;print(quotechar);end;
if(strpool[j]>=55296)and(strpool[j]<=56319)and(j+1<strstart[(e+1)-65536]
)and(strpool[j+1]>=56320)and(strpool[j+1]<=57343)then begin printchar(
65536+(strpool[j]-55296)*1024+strpool[j+1]-56320);incr(j);
end else print(strpool[j]);end;
if quotechar<>0 then printchar(quotechar);end;{:553}{741:}
procedure printsize(s:integer);
begin if s=0 then printesc(65712)else if s=256 then printesc(65713)else
printesc(65714);end;{:741}{1415:}
procedure printwritewhatsit(s:strnumber;p:halfword);begin printesc(s);
if mem[p+1].hh.lh<16 then printint(mem[p+1].hh.lh)else if mem[p+1].hh.lh
=16 then printchar(42)else printchar(45);end;
procedure printnativeword(p:halfword);var i,c,cc:integer;
begin for i:=0 to mem[p+4].qqqq.b2-1 do begin c:=getnativechar(p,i);
if(c>=55296)and(c<=56319)then begin if i<mem[p+4].qqqq.b2-1 then begin
cc:=getnativechar(p,i+1);
if(cc>=56320)and(cc<=57343)then begin c:=65536+(c-55296)*1024+(cc-56320)
;printchar(c);incr(i);end else print(46);end else print(46);
end else printchar(c);end end;{:1415}{1633:}
procedure printsanum(q:halfword);var n:halfword;
begin if mem[q].hh.b0<128 then n:=mem[q+1].hh.rh else begin n:=mem[q].hh
.b0 mod 64;q:=mem[q].hh.rh;n:=n+64*mem[q].hh.b0;q:=mem[q].hh.rh;
n:=n+64*64*(mem[q].hh.b0+64*mem[mem[q].hh.rh].hh.b0);end;printint(n);
end;{:1633}{1681:}procedure printcsnames(hstart:integer;
hfinish:integer);var c,h:integer;
begin writeln(stderr,'fmtdebug:csnames from ',hstart,' to ',hfinish,':')
;for h:=hstart to hfinish do begin if hash[h].rh>0 then begin for c:=
strstart[(hash[h].rh)-65536]to strstart[(hash[h].rh+1)-65536]-1 do begin
putbyte(strpool[c],stderr);end;writeln(stderr,'|');end;end;end;{:1681}
{1683:}procedure printfileline;var level:0..maxinopen;
begin level:=inopen;
while(level>0)and(fullsourcefilenamestack[level]=0)do decr(level);
if level=0 then printnl(65544)else begin printnl(65626);
print(fullsourcefilenamestack[level]);print(58);
if level=inopen then printint(line)else printint(linestack[level+1]);
print(65593);end;end;{:1683}{82:}procedure normalizeselector;forward;
procedure gettoken;forward;procedure terminput;forward;
procedure showcontext;forward;procedure beginfilereading;forward;
procedure openlogfile;forward;procedure closefilesandterminate;forward;
procedure clearforerrorprompt;forward;procedure giveerrhelp;forward;
ifdef('TEXMF_DEBUG')procedure debughelp;forward;
endif('TEXMF_DEBUG'){:82}{85:}noreturn procedure jumpout;
begin closefilesandterminate;begin fflush(stdout);readyalready:=0;
if(history<>0)and(history<>1)then uexit(1)else uexit(0);end;end;{:85}
{86:}procedure error;label 22,10;var c:UnicodeScalar;
s1,s2,s3,s4:integer;begin if history<2 then history:=2;printchar(46);
showcontext;
if(haltonerrorp)then begin if(haltingonerrorp)then begin fflush(stdout);
readyalready:=0;if(history<>0)and(history<>1)then uexit(1)else uexit(0);
end;haltingonerrorp:=true;{94:}if interaction>0 then decr(selector);
if useerrhelp then begin println;giveerrhelp;
end else while helpptr>0 do begin decr(helpptr);
printnl(helpline[helpptr]);end;println;
if interaction>0 then incr(selector);println{:94};history:=3;jumpout;
end;if interaction=3 then{87:}
while true do begin 22:if interaction<>3 then goto 10;
clearforerrorprompt;begin;print(65546);terminput;end;
if last=first then goto 10;c:=buffer[first];if c>=97 then c:=c-32;{88:}
case c of 48,49,50,51,52,53,54,55,56,57:if deletionsallowed then{92:}
begin s1:=curtok;s2:=curcmd;s3:=curchr;s4:=alignstate;
alignstate:=1000000;OKtointerrupt:=false;
if(last>first+1)and(buffer[first+1]>=48)and(buffer[first+1]<=57)then c:=
c*10+buffer[first+1]-48*11 else c:=c-48;while c>0 do begin gettoken;
decr(c);end;curtok:=s1;curcmd:=s2;curchr:=s3;alignstate:=s4;
OKtointerrupt:=true;begin helpptr:=2;helpline[1]:=65559;
helpline[0]:=65560;end;showcontext;goto 22;end{:92};
ifdef('TEXMF_DEBUG')68:begin debughelp;goto 22;end;
endif('TEXMF_DEBUG')69:if baseptr>0 then if inputstack[baseptr].
namefield>=256 then begin editnamestart:=strstart[(inputstack[baseptr].
namefield)-65536];
editnamelength:=strstart[(inputstack[baseptr].namefield+1)-65536]-
strstart[(inputstack[baseptr].namefield)-65536];editline:=line;jumpout;
end;72:{93:}begin if useerrhelp then begin giveerrhelp;
useerrhelp:=false;end else begin if helpptr=0 then begin helpptr:=2;
helpline[1]:=65561;helpline[0]:=65562;end;repeat decr(helpptr);
print(helpline[helpptr]);println;until helpptr=0;end;begin helpptr:=4;
helpline[3]:=65563;helpline[2]:=65562;helpline[1]:=65564;
helpline[0]:=65565;end;goto 22;end{:93};73:{91:}begin beginfilereading;
if last>first+1 then begin curinput.locfield:=first+1;buffer[first]:=32;
end else begin begin;print(65558);terminput;end;
curinput.locfield:=first;end;first:=last;curinput.limitfield:=last-1;
goto 10;end{:91};81,82,83:{90:}begin errorcount:=0;interaction:=0+c-81;
print(65553);case c of 81:begin printesc(65554);decr(selector);end;
82:printesc(65555);83:printesc(65556);end;print(65557);println;
fflush(stdout);goto 10;end{:90};88:begin interaction:=2;jumpout;end;
others:end;{89:}begin print(65547);printnl(65548);printnl(65549);
if baseptr>0 then if inputstack[baseptr].namefield>=256 then print(65550
);if deletionsallowed then printnl(65551);printnl(65552);end{:89}{:88};
end{:87};incr(errorcount);if errorcount=100 then begin printnl(65545);
history:=3;jumpout;end;{94:}if interaction>0 then decr(selector);
if useerrhelp then begin println;giveerrhelp;
end else while helpptr>0 do begin decr(helpptr);
printnl(helpline[helpptr]);end;println;
if interaction>0 then incr(selector);println{:94};10:end;{:86}{97:}
noreturn procedure fatalerror(s:strnumber);begin normalizeselector;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65567);end;begin helpptr:=1;helpline[0]:=s;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;{:97}{98:}
noreturn procedure overflow(s:strnumber;n:integer);
begin normalizeselector;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65568);end;print(s);printchar(61);printint(n);printchar(93);
begin helpptr:=2;helpline[1]:=65569;helpline[0]:=65570;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;{:98}{99:}
noreturn procedure confusion(s:strnumber);begin normalizeselector;
if history<2 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65571);end;print(s);printchar(41);begin helpptr:=1;
helpline[0]:=65572;end;end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65573);end;begin helpptr:=2;helpline[1]:=65574;helpline[0]:=65575;
end;end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;{:99}{1455:}
procedure scanandpackname;forward;{:1455}{:4}{31:}
{[35:]begin curinput.locfield:=first;curinput.limitfield:=last-1;
overflow(65538,bufsize);end[:35]}{:31}{37:}
function initterminal:boolean;label 10;begin topenin;
if last>first then begin curinput.locfield:=first;
while(curinput.locfield<last)and(buffer[curinput.locfield]=' ')do incr(
curinput.locfield);
if curinput.locfield<last then begin initterminal:=true;goto 10;end;end;
while true do begin;write(stdout,'**');fflush(stdout);
if not inputln(termin,true)then begin writeln(stdout);
writeln(stdout,'! End of file on the terminal... why?');
initterminal:=false;goto 10;end;curinput.locfield:=first;
while(curinput.locfield<last)and(buffer[curinput.locfield]=32)do incr(
curinput.locfield);
if curinput.locfield<last then begin initterminal:=true;goto 10;end;
writeln(stdout,'Please type the name of your input file.');end;10:end;
{:37}{40:}function length(s:strnumber):integer;
begin if(s>=65536)then length:=strstart[(s+1)-65536]-strstart[(s)-65536]
else if(s>=32)and(s<127)then length:=1 else if(s<=127)then length:=3
else if(s<256)then length:=4 else length:=8 end;{:40}{43:}
function makestring:strnumber;
begin if strptr=maxstrings then overflow(65540,maxstrings-initstrptr);
incr(strptr);strstart[(strptr)-65536]:=poolptr;makestring:=strptr-1;end;
{:43}{44:}procedure appendstr(s:strnumber);var i:integer;j:poolpointer;
begin i:=length(s);
begin if poolptr+i>poolsize then overflow(65539,poolsize-initpoolptr);
end;j:=strstart[(s)-65536];
while(i>0)do begin begin if(strpool[j]>65535)then begin strpool[poolptr]
:=(strpool[j]-65536)div 1024+55296;incr(poolptr);
strpool[poolptr]:=(strpool[j])mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=strpool[j];incr(poolptr);end;end;
incr(j);decr(i);end;end;{:44}{45:}function streqbuf(s:strnumber;
k:integer):boolean;label 45;var j:poolpointer;result:boolean;
begin j:=strstart[(s)-65536];
while j<strstart[(s+1)-65536]do begin if buffer[k]>=65536 then if
strpool[j]<>55296+(buffer[k]-65536)div 1024 then begin result:=false;
goto 45;
end else if strpool[j+1]<>56320+(buffer[k]-65536)mod 1024 then begin
result:=false;goto 45;
end else incr(j)else if strpool[j]<>buffer[k]then begin result:=false;
goto 45;end;incr(j);incr(k);end;result:=true;45:streqbuf:=result;end;
{:45}{46:}function streqstr(s,t:strnumber):boolean;label 45;
var j,k:poolpointer;result:boolean;begin result:=false;
if length(s)<>length(t)then goto 45;
if(length(s)=1)then begin if s<65536 then begin if t<65536 then begin if
s<>t then goto 45;
end else begin if s<>strpool[strstart[(t)-65536]]then goto 45;end;
end else begin if t<65536 then begin if strpool[strstart[(s)-65536]]<>t
then goto 45;
end else begin if strpool[strstart[(s)-65536]]<>strpool[strstart[(t)
-65536]]then goto 45;end;end;end else begin j:=strstart[(s)-65536];
k:=strstart[(t)-65536];
while j<strstart[(s+1)-65536]do begin if strpool[j]<>strpool[k]then goto
45;incr(j);incr(k);end;end;result:=true;45:streqstr:=result;end;{:46}
{47:}{1685:}function searchstring(search:strnumber):strnumber;label 40;
var result:strnumber;s:strnumber;len:integer;begin result:=0;
len:=length(search);if len=0 then begin result:=65626;goto 40;
end else begin s:=search-1;
while s>65535 do begin if length(s)=len then if streqstr(s,search)then
begin result:=s;goto 40;end;decr(s);end;end;40:searchstring:=result;end;
{:1685}{1686:}function slowmakestring:strnumber;label 10;
var s:strnumber;t:strnumber;begin t:=makestring;s:=searchstring(t);
if s>0 then begin begin decr(strptr);poolptr:=strstart[(strptr)-65536];
end;slowmakestring:=s;goto 10;end;slowmakestring:=t;10:end;{:1686}
ifdef('INITEX')function getstringsstarted:boolean;label 30,10;
var g:strnumber;begin poolptr:=0;strptr:=0;strstart[0]:=0;{48:}
begin strptr:=65536;strstart[(strptr)-65536]:=poolptr;end{:48};{51:}
g:=loadpoolstrings((poolsize-stringvacancies));if g=0 then begin;
writeln(stdout,'! You have to increase POOLSIZE.');
getstringsstarted:=false;goto 10;end;getstringsstarted:=true;{:51};
10:end;endif('INITEX'){:47}{70:}procedure printtwo(n:integer);
begin n:=abs(n)mod 100;printchar(48+(n div 10));
printchar(48+(n mod 10));end;{:70}{71:}procedure printhex(n:integer);
var k:0..22;begin k:=0;printchar(34);repeat dig[k]:=n mod 16;
n:=n div 16;incr(k);until n=0;printthedigs(k);end;{:71}{73:}
procedure printromanint(n:integer);label 10;var j,k:poolpointer;
u,v:nonnegativeinteger;begin j:=strstart[(65542)-65536];v:=1000;
while true do begin while n>=v do begin printchar(strpool[j]);n:=n-v;
end;if n<=0 then goto 10;k:=j+2;u:=v div(strpool[k-1]-48);
if strpool[k-1]=50 then begin k:=k+2;u:=u div(strpool[k-1]-48);end;
if n+u>=v then begin printchar(strpool[k]);n:=n+u;end else begin j:=j+2;
v:=v div(strpool[j-1]-48);end;end;10:end;{:73}{74:}
procedure printcurrentstring;var j:poolpointer;
begin j:=strstart[(strptr)-65536];
while j<poolptr do begin printchar(strpool[j]);incr(j);end;end;{:74}
{75:}procedure terminput;var k:0..bufsize;begin fflush(stdout);
if not inputln(termin,true)then begin curinput.limitfield:=0;
fatalerror(65543);end;termoffset:=0;decr(selector);
if last<>first then for k:=first to last-1 do print(buffer[k]);println;
incr(selector);end;{:75}{95:}procedure interror(n:integer);
begin print(65566);printint(n);printchar(41);error;end;{:95}{96:}
procedure normalizeselector;
begin if logopened then selector:=19 else selector:=17;
if jobname=0 then openlogfile;if interaction=0 then decr(selector);end;
{:96}{102:}procedure pauseforinstructions;
begin if OKtointerrupt then begin interaction:=3;
if(selector=18)or(selector=16)then incr(selector);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65576);end;begin helpptr:=3;helpline[2]:=65577;helpline[1]:=65578;
helpline[0]:=65579;end;deletionsallowed:=false;error;
deletionsallowed:=true;interrupt:=0;end;end;{:102}{104:}
function half(x:integer):integer;
begin if odd(x)then half:=(x+1)div 2 else half:=x div 2;end;{:104}{106:}
function rounddecimals(k:smallnumber):scaled;var a:integer;begin a:=0;
while k>0 do begin decr(k);a:=(a+dig[k]*131072)div 10;end;
rounddecimals:=(a+1)div 2;end;{:106}{107:}
procedure printscaled(s:scaled);var delta:scaled;
begin if s<0 then begin printchar(45);s:=-s;end;printint(s div 65536);
printchar(46);s:=10*(s mod 65536)+5;delta:=10;
repeat if delta>65536 then s:=s-17232;printchar(48+(s div 65536));
s:=10*(s mod 65536);delta:=delta*10;until s<=delta;end;{:107}{109:}
function multandadd(n:integer;x,y,maxanswer:scaled):scaled;
begin if n<0 then begin x:=-x;n:=-n;end;
if n=0 then multandadd:=y else if((x<=(maxanswer-y)div n)and(-x<=(
maxanswer+y)div n))then multandadd:=n*x+y else begin aritherror:=true;
multandadd:=0;end;end;{:109}{110:}function xovern(x:scaled;
n:integer):scaled;var negative:boolean;begin negative:=false;
if n=0 then begin aritherror:=true;xovern:=0;texremainder:=x;
end else begin if n<0 then begin x:=-x;n:=-n;negative:=true;end;
if x>=0 then begin xovern:=x div n;texremainder:=x mod n;
end else begin xovern:=-((-x)div n);texremainder:=-((-x)mod n);end;end;
if negative then texremainder:=-texremainder;end;{:110}{111:}
function xnoverd(x:scaled;n,d:integer):scaled;var positive:boolean;
t,u,v:nonnegativeinteger;
begin if x>=0 then positive:=true else begin x:=-x;positive:=false;end;
t:=(x mod 32768)*n;u:=(x div 32768)*n+(t div 32768);
v:=(u mod d)*32768+(t mod 32768);
if u div d>=32768 then aritherror:=true else u:=32768*(u div d)+(v div d
);if positive then begin xnoverd:=u;texremainder:=v mod d;
end else begin xnoverd:=-u;texremainder:=-(v mod d);end;end;{:111}{112:}
function badness(t,s:scaled):halfword;var r:integer;
begin if t=0 then badness:=0 else if s<=0 then badness:=10000 else begin
if t<=7230584 then r:=(t*297)div s else if s>=1663497 then r:=t div(s
div 297)else r:=t;
if r>1290 then badness:=10000 else badness:=(r*r*r+131072)div 262144;
end;end;{:112}{116:}function makefrac(p,q:integer):integer;
var f:integer;n:integer;negative:boolean;becareful:integer;
begin if p>=0 then negative:=false else begin p:=-p;negative:=true;end;
if q<=0 then begin ifdef('TEXMF_DEBUG')if q=0 then confusion(47);
endif('TEXMF_DEBUG')q:=-q;negative:=not negative;end;n:=p div q;
p:=p mod q;if n>=8 then begin aritherror:=true;
if negative then makefrac:=-2147483647 else makefrac:=2147483647;
end else begin n:=(n-1)*268435456;{117:}f:=1;repeat becareful:=p-q;
p:=becareful+p;if p>=0 then f:=f+f+1 else begin f:=f+f;p:=p+q;end;
until f>=268435456;becareful:=p-q;if becareful+p>=0 then incr(f){:117};
if negative then makefrac:=-(f+n)else makefrac:=f+n;end;end;{:116}{118:}
function takefrac(q:integer;f:integer):integer;var p:integer;
negative:boolean;n:integer;becareful:integer;begin{119:}
if f>=0 then negative:=false else begin f:=-f;negative:=true;end;
if q<0 then begin q:=-q;negative:=not negative;end;{:119};
if f<268435456 then n:=0 else begin n:=f div 268435456;
f:=f mod 268435456;
if q<=2147483647 div n then n:=n*q else begin aritherror:=true;
n:=2147483647;end;end;f:=f+268435456;{120:}p:=134217728;
if q<1073741824 then repeat if odd(f)then p:=(p+q)div 2 else p:=(p)div 2
;f:=(f)div 2;
until f=1 else repeat if odd(f)then p:=p+(q-p)div 2 else p:=(p)div 2;
f:=(f)div 2;until f=1{:120};becareful:=n-2147483647;
if becareful+p>0 then begin aritherror:=true;n:=2147483647-p;end;
if negative then takefrac:=-(n+p)else takefrac:=n+p;end;{:118}{123:}
function mlog(x:integer):integer;var y,z:integer;k:integer;
begin if x<=0 then{125:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65580);end;printscaled(x);print(65581);begin helpptr:=2;
helpline[1]:=65582;helpline[0]:=65583;end;error;mlog:=0;end{:125}
else begin y:=1302456860;z:=6581195;while x<1073741824 do begin x:=x+x;
y:=y-93032639;z:=z-48782;end;y:=y+(z div 65536);k:=2;
while x>1073741828 do{124:}begin z:=((x-1)div twotothe[k])+1;
while x<1073741824+z do begin z:=(z+1)div 2;k:=k+1;end;y:=y+speclog[k];
x:=x-z;end{:124};mlog:=y div 8;end;end;{:123}{126:}
function abvscd(a,b,c,d:integer):integer;label 10;var q,r:integer;
begin{127:}if a<0 then begin a:=-a;b:=-b;end;if c<0 then begin c:=-c;
d:=-d;end;
if d<=0 then begin if b>=0 then if((a=0)or(b=0))and((c=0)or(d=0))then
begin abvscd:=0;goto 10;end else begin abvscd:=1;goto 10;end;
if d=0 then if a=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=-1;goto 10;end;q:=a;a:=c;c:=q;q:=-b;b:=-d;d:=q;
end else if b<=0 then begin if b<0 then if a>0 then begin abvscd:=-1;
goto 10;end;if c=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=-1;goto 10;end;end{:127};
while true do begin q:=a div d;r:=c div b;
if q<>r then if q>r then begin abvscd:=1;goto 10;
end else begin abvscd:=-1;goto 10;end;q:=a mod d;r:=c mod b;
if r=0 then if q=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=1;goto 10;end;if q=0 then begin abvscd:=-1;
goto 10;end;a:=b;b:=q;c:=d;d:=r;end;10:end;{:126}{128:}
procedure newrandoms;var k:0..54;x:integer;
begin for k:=0 to 23 do begin x:=randoms[k]-randoms[k+31];
if x<0 then x:=x+268435456;randoms[k]:=x;end;
for k:=24 to 54 do begin x:=randoms[k]-randoms[k-24];
if x<0 then x:=x+268435456;randoms[k]:=x;end;jrandom:=54;end;{:128}
{129:}procedure initrandoms(seed:integer);var j,jj,k:integer;i:0..54;
begin j:=abs(seed);while j>=268435456 do j:=(j)div 2;k:=1;
for i:=0 to 54 do begin jj:=k;k:=j-k;j:=jj;if k<0 then k:=k+268435456;
randoms[(i*21)mod 55]:=j;end;newrandoms;newrandoms;newrandoms;end;{:129}
{130:}function unifrand(x:integer):integer;var y:integer;
begin if jrandom=0 then newrandoms else decr(jrandom);
y:=takefrac(abs(x),randoms[jrandom]);
if y=abs(x)then unifrand:=0 else if x>0 then unifrand:=y else unifrand:=
-y;end;{:130}{131:}function normrand:integer;var x,u,l:integer;
begin repeat repeat if jrandom=0 then newrandoms else decr(jrandom);
x:=takefrac(112429,randoms[jrandom]-134217728);
if jrandom=0 then newrandoms else decr(jrandom);u:=randoms[jrandom];
until abs(x)<u;x:=makefrac(x,u);l:=139548960-mlog(u);
until abvscd(1024,l,x,x)>=0;normrand:=x;end;{:131}{136:}
ifdef('TEXMF_DEBUG')procedure printword(w:memoryword);
begin printint(w.int);printchar(32);printscaled(w.int);printchar(32);
printscaled(round(65536*w.gr));println;printint(w.hh.lh);printchar(61);
printint(w.hh.b0);printchar(58);printint(w.hh.b1);printchar(59);
printint(w.hh.rh);printchar(32);printint(w.qqqq.b0);printchar(58);
printint(w.qqqq.b1);printchar(58);printint(w.qqqq.b2);printchar(58);
printint(w.qqqq.b3);end;endif('TEXMF_DEBUG'){:136}{141:}{322:}
procedure showtokenlist(p,q:integer;l:integer);label 10;var m,c:integer;
matchchr:integer;n:UTF16code;begin matchchr:=35;n:=48;tally:=0;
while(p<>-268435455)and(tally<l)do begin if p=q then{350:}
begin firstcount:=tally;trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end{:350};{323:}
if(p<himemmin)or(p>memend)then begin printesc(65595);goto 10;end;
if mem[p].hh.lh>=33554431 then printcs(mem[p].hh.lh-33554431)else begin
m:=mem[p].hh.lh div 2097152;c:=mem[p].hh.lh mod 2097152;
if mem[p].hh.lh<0 then printesc(65882)else{324:}
case m of 1,2,3,4,7,8,10,11,12:printchar(c);6:begin printchar(c);
printchar(c);end;5:begin printchar(matchchr);
if c<=9 then printchar(c+48)else begin printchar(33);goto 10;end;end;
13:begin matchchr:=c;printchar(c);incr(n);printchar(n);
if n>57 then goto 10;end;14:if c=0 then print(65883);
others:printesc(65882)end{:324};end{:323};p:=mem[p].hh.rh;end;
if p<>-268435455 then printesc(65708);10:end;{:322}{336:}
procedure runaway;var p:halfword;
begin if scannerstatus>1 then begin case scannerstatus of 2:begin
printnl(65896);p:=defref;end;3:begin printnl(65897);p:=memtop-3;end;
4:begin printnl(65898);p:=memtop-4;end;5:begin printnl(65899);p:=defref;
end;end;printchar(63);println;
showtokenlist(mem[p].hh.rh,-268435455,errorline-10);end;end;{:336}{:141}
{142:}function getavail:halfword;var p:halfword;begin p:=avail;
if p<>-268435455 then avail:=mem[avail].hh.rh else if memend<memmax then
begin incr(memend);p:=memend;end else begin decr(himemmin);p:=himemmin;
if himemmin<=lomemmax then begin runaway;
overflow(65584,memmax+1-memmin);end;end;mem[p].hh.rh:=-268435455;
ifdef('STAT')incr(dynused);endif('STAT')getavail:=p;end;{:142}{145:}
procedure flushlist(p:halfword);var q,r:halfword;
begin if p<>-268435455 then begin r:=p;repeat q:=r;r:=mem[r].hh.rh;
ifdef('STAT')decr(dynused);endif('STAT')until r=-268435455;
mem[q].hh.rh:=avail;avail:=p;end;end;{:145}{147:}
function getnode(s:integer):halfword;label 40,10,20;var p:halfword;
q:halfword;r:integer;t:integer;begin 20:p:=rover;repeat{149:}
q:=p+mem[p].hh.lh;
while(mem[q].hh.rh=1073741823)do begin t:=mem[q+1].hh.rh;
if q=rover then rover:=t;mem[t+1].hh.lh:=mem[q+1].hh.lh;
mem[mem[q+1].hh.lh+1].hh.rh:=t;q:=q+mem[q].hh.lh;end;r:=q-s;
if r>p+1 then{150:}begin mem[p].hh.lh:=r-p;rover:=p;goto 40;end{:150};
if r=p then if mem[p+1].hh.rh<>p then{151:}begin rover:=mem[p+1].hh.rh;
t:=mem[p+1].hh.lh;mem[rover+1].hh.lh:=t;mem[t+1].hh.rh:=rover;goto 40;
end{:151};mem[p].hh.lh:=q-p{:149};p:=mem[p+1].hh.rh;until p=rover;
if s=1073741824 then begin getnode:=1073741823;goto 10;end;
if lomemmax+2<himemmin then if lomemmax+2<=membot+1073741823 then{148:}
begin if himemmin-lomemmax>=1998 then t:=lomemmax+1000 else t:=lomemmax
+1+(himemmin-lomemmax)div 2;p:=mem[rover+1].hh.lh;q:=lomemmax;
mem[p+1].hh.rh:=q;mem[rover+1].hh.lh:=q;
if t>membot+1073741823 then t:=membot+1073741823;mem[q+1].hh.rh:=rover;
mem[q+1].hh.lh:=p;mem[q].hh.rh:=1073741823;mem[q].hh.lh:=t-lomemmax;
lomemmax:=t;mem[lomemmax].hh.rh:=-268435455;
mem[lomemmax].hh.lh:=-268435455;rover:=q;goto 20;end{:148};
overflow(65584,memmax+1-memmin);40:mem[r].hh.rh:=-268435455;
ifdef('STAT')varused:=varused+s;endif('STAT'){1714:}
if s>=3 then begin mem[r+s-1].hh.lh:=curinput.synctextagfield;
mem[r+s-1].hh.rh:=line;end;{:1714};getnode:=r;10:end;{:147}{152:}
procedure freenode(p:halfword;s:halfword);var q:halfword;
begin mem[p].hh.lh:=s;mem[p].hh.rh:=1073741823;q:=mem[rover+1].hh.lh;
mem[p+1].hh.lh:=q;mem[p+1].hh.rh:=rover;mem[rover+1].hh.lh:=p;
mem[q+1].hh.rh:=p;ifdef('STAT')varused:=varused-s;endif('STAT')end;
{:152}{153:}ifdef('INITEX')procedure sortavail;var p,q,r:halfword;
oldrover:halfword;begin p:=getnode(1073741824);p:=mem[rover+1].hh.rh;
mem[rover+1].hh.rh:=1073741823;oldrover:=rover;
while p<>oldrover do{154:}if p<rover then begin q:=p;p:=mem[q+1].hh.rh;
mem[q+1].hh.rh:=rover;rover:=q;end else begin q:=rover;
while mem[q+1].hh.rh<p do q:=mem[q+1].hh.rh;r:=mem[p+1].hh.rh;
mem[p+1].hh.rh:=mem[q+1].hh.rh;mem[q+1].hh.rh:=p;p:=r;end{:154};
p:=rover;
while mem[p+1].hh.rh<>1073741823 do begin mem[mem[p+1].hh.rh+1].hh.lh:=p
;p:=mem[p+1].hh.rh;end;mem[p+1].hh.rh:=rover;mem[rover+1].hh.lh:=p;end;
endif('INITEX'){:153}{158:}function newnullbox:halfword;var p:halfword;
begin p:=getnode(8);mem[p].hh.b0:=0;mem[p].hh.b1:=0;mem[p+1].int:=0;
mem[p+2].int:=0;mem[p+3].int:=0;mem[p+4].int:=0;
mem[p+5].hh.rh:=-268435455;mem[p+5].hh.b0:=0;mem[p+5].hh.b1:=0;
mem[p+6].gr:=0.0;newnullbox:=p;end;{:158}{161:}
function newrule:halfword;var p:halfword;begin p:=getnode(5);
mem[p].hh.b0:=2;mem[p].hh.b1:=0;mem[p+1].int:=-1073741824;
mem[p+2].int:=-1073741824;mem[p+3].int:=-1073741824;newrule:=p;end;
{:161}{166:}function newligature(f:internalfontnumber;c:quarterword;
q:halfword):halfword;var p:halfword;begin p:=getnode(2);mem[p].hh.b0:=6;
mem[p+1].hh.b0:=f;mem[p+1].hh.b1:=c;mem[p+1].hh.rh:=q;mem[p].hh.b1:=0;
newligature:=p;end;function newligitem(c:quarterword):halfword;
var p:halfword;begin p:=getnode(2);mem[p].hh.b1:=c;
mem[p+1].hh.rh:=-268435455;newligitem:=p;end;{:166}{167:}
function newdisc:halfword;var p:halfword;begin p:=getnode(2);
mem[p].hh.b0:=7;mem[p].hh.b1:=0;mem[p+1].hh.lh:=-268435455;
mem[p+1].hh.rh:=-268435455;newdisc:=p;end;{:167}{169:}
procedure copynativeglyphinfo(src:halfword;dest:halfword);
var glyphcount:integer;
begin if mem[src+5].ptr<>nullptr then begin glyphcount:=mem[src+4].qqqq.
b3;mem[dest+5].ptr:=xmallocarray(char,glyphcount*10);
memcpy(mem[dest+5].ptr,mem[src+5].ptr,glyphcount*10);
mem[dest+4].qqqq.b3:=glyphcount;end end;{:169}{171:}
function newmath(w:scaled;s:smallnumber):halfword;var p:halfword;
begin p:=getnode(3);mem[p].hh.b0:=9;mem[p].hh.b1:=s;mem[p+1].int:=w;
newmath:=p;end;{:171}{175:}function newspec(p:halfword):halfword;
var q:halfword;begin q:=getnode(4);mem[q]:=mem[p];
mem[q].hh.rh:=-268435455;mem[q+1].int:=mem[p+1].int;
mem[q+2].int:=mem[p+2].int;mem[q+3].int:=mem[p+3].int;newspec:=q;end;
{:175}{176:}function newparamglue(n:smallnumber):halfword;
var p:halfword;q:halfword;begin p:=getnode(3);mem[p].hh.b0:=10;
mem[p].hh.b1:=n+1;mem[p+1].hh.rh:=-268435455;q:={250:}
eqtb[1205764+n].hh.rh{:250};mem[p+1].hh.lh:=q;incr(mem[q].hh.rh);
newparamglue:=p;end;{:176}{177:}function newglue(q:halfword):halfword;
var p:halfword;begin p:=getnode(3);mem[p].hh.b0:=10;mem[p].hh.b1:=0;
mem[p+1].hh.rh:=-268435455;mem[p+1].hh.lh:=q;incr(mem[q].hh.rh);
newglue:=p;end;{:177}{178:}
function newskipparam(n:smallnumber):halfword;var p:halfword;
begin tempptr:=newspec({250:}eqtb[1205764+n].hh.rh{:250});
p:=newglue(tempptr);mem[tempptr].hh.rh:=-268435455;mem[p].hh.b1:=n+1;
newskipparam:=p;end;{:178}{180:}function newkern(w:scaled):halfword;
var p:halfword;begin p:=getnode(3);mem[p].hh.b0:=11;mem[p].hh.b1:=0;
mem[p+1].int:=w;newkern:=p;end;{:180}{183:}
function newpenalty(m:integer):halfword;var p:halfword;
begin p:=getnode(3);mem[p].hh.b0:=12;mem[p].hh.b1:=0;mem[p+1].int:=m;
newpenalty:=p;end;{:183}{192:}
ifdef('TEXMF_DEBUG')procedure checkmem(printlocs:boolean);label 31,32;
var p,q:halfword;clobbered:boolean;
begin for p:=memmin to lomemmax do freearr[p]:=false;
for p:=himemmin to memend do freearr[p]:=false;{193:}p:=avail;
q:=-268435455;clobbered:=false;
while p<>-268435455 do begin if(p>memend)or(p<himemmin)then clobbered:=
true else if freearr[p]then clobbered:=true;
if clobbered then begin printnl(65585);printint(q);goto 31;end;
freearr[p]:=true;q:=p;p:=mem[q].hh.rh;end;31:{:193};{194:}p:=rover;
q:=-268435455;clobbered:=false;
repeat if(p>=lomemmax)or(p<memmin)then clobbered:=true else if(mem[p+1].
hh.rh>=lomemmax)or(mem[p+1].hh.rh<memmin)then clobbered:=true else if
not((mem[p].hh.rh=1073741823))or(mem[p].hh.lh<2)or(p+mem[p].hh.lh>
lomemmax)or(mem[mem[p+1].hh.rh+1].hh.lh<>p)then clobbered:=true;
if clobbered then begin printnl(65586);printint(q);goto 32;end;
for q:=p to p+mem[p].hh.lh-1 do begin if freearr[q]then begin printnl(
65587);printint(q);goto 32;end;freearr[q]:=true;end;q:=p;
p:=mem[p+1].hh.rh;until p=rover;32:{:194};{195:}p:=memmin;
while p<=lomemmax do begin if(mem[p].hh.rh=1073741823)then begin printnl
(65588);printint(p);end;while(p<=lomemmax)and not freearr[p]do incr(p);
while(p<=lomemmax)and freearr[p]do incr(p);end{:195};
if printlocs then{196:}begin printnl(65589);
for p:=memmin to lomemmax do if not freearr[p]and((p>waslomax)or wasfree
[p])then begin printchar(32);printint(p);end;
for p:=himemmin to memend do if not freearr[p]and((p<washimin)or(p>
wasmemend)or wasfree[p])then begin printchar(32);printint(p);end;
end{:196};for p:=memmin to lomemmax do wasfree[p]:=freearr[p];
for p:=himemmin to memend do wasfree[p]:=freearr[p];wasmemend:=memend;
waslomax:=lomemmax;washimin:=himemmin;end;endif('TEXMF_DEBUG'){:192}
{197:}ifdef('TEXMF_DEBUG')procedure searchmem(p:halfword);var q:integer;
begin for q:=memmin to lomemmax do begin if mem[q].hh.rh=p then begin
printnl(65590);printint(q);printchar(41);end;
if mem[q].hh.lh=p then begin printnl(65591);printint(q);printchar(41);
end;end;
for q:=himemmin to memend do begin if mem[q].hh.rh=p then begin printnl(
65590);printint(q);printchar(41);end;
if mem[q].hh.lh=p then begin printnl(65591);printint(q);printchar(41);
end;end;{281:}
for q:=1 to 1206822 do begin if eqtb[q].hh.rh=p then begin printnl(65812
);printint(q);printchar(41);end;end{:281};{315:}
if saveptr>0 then for q:=0 to saveptr-1 do begin if savestack[q].hh.rh=p
then begin printnl(65874);printint(q);printchar(41);end;end{:315};{987:}
for q:=0 to hyphsize do begin if hyphlist[q]=p then begin printnl(66376)
;printint(q);printchar(41);end;end{:987};end;endif('TEXMF_DEBUG'){:197}
{198:}procedure pdferror(t,p:strnumber);begin normalizeselector;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65592);end;if t<>0 then begin print(65566);print(t);print(41);end;
print(65593);print(p);begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
function prevrightmost(s,e:halfword):halfword;var p:halfword;
begin prevrightmost:=-268435455;p:=s;if p=-268435455 then goto 10;
while mem[p].hh.rh<>e do begin p:=mem[p].hh.rh;
if p=-268435455 then goto 10;end;prevrightmost:=p;end;
function roundxnoverd(x:scaled;n,d:integer):scaled;var positive:boolean;
t,u,v:nonnegativeinteger;
begin if x>=0 then positive:=true else begin x:=-x;positive:=false;end;
t:=(x mod 32768)*n;u:=(x div 32768)*n+(t div 32768);
v:=(u mod d)*32768+(t mod 32768);
if u div d>=32768 then aritherror:=true else u:=32768*(u div d)+(v div d
);v:=v mod d;if 2*v>=d then incr(u);
if positive then roundxnoverd:=u else roundxnoverd:=-u;end;
function isbitset(n:integer;s:smallnumber):boolean;var m,i:integer;
begin m:=1;for i:=1 to s-1 do m:=m*2;isbitset:=(n div m)mod 2;end;
{1411:}function getmicrointerval:integer;var s,m:integer;
begin secondsandmicros(s,m);
if(s-epochseconds)>32767 then getmicrointerval:=2147483647 else if(
microseconds>m)then getmicrointerval:=((s-1-epochseconds)*65536)+(((m
+1000000-microseconds)/100)*65536)/10000 else getmicrointerval:=((s-
epochseconds)*65536)+(((m-microseconds)/100)*65536)/10000;end;{:1411}
{:198}{200:}procedure shortdisplay(p:integer);var n:integer;
begin while p>memmin do begin if(p>=himemmin)then begin if p<=memend
then begin if mem[p].hh.b0<>fontinshortdisplay then begin if(mem[p].hh.
b0>fontmax)then printchar(42)else{297:}
printesc(hash[1196762+mem[p].hh.b0].rh){:297};printchar(32);
fontinshortdisplay:=mem[p].hh.b0;end;print(mem[p].hh.b1);end;
end else{201:}case mem[p].hh.b0 of 0,1,3,4,5,13:print(65594);
8:case mem[p].hh.b1 of 40,41:begin if mem[p+4].qqqq.b1<>
fontinshortdisplay then begin printesc(hash[1196762+mem[p+4].qqqq.b1].rh
);printchar(32);fontinshortdisplay:=mem[p+4].qqqq.b1;end;
printnativeword(p);end;others:print(65594)end;2:printchar(124);
10:if mem[p+1].hh.lh<>membot then printchar(32);
9:if mem[p].hh.b1>=4 then print(65594)else printchar(36);
6:shortdisplay(mem[p+1].hh.rh);7:begin shortdisplay(mem[p+1].hh.lh);
shortdisplay(mem[p+1].hh.rh);n:=mem[p].hh.b1;
while n>0 do begin if mem[p].hh.rh<>-268435455 then p:=mem[p].hh.rh;
decr(n);end;end;others:end{:201};p:=mem[p].hh.rh;end;end;{:200}{202:}
procedure printfontandchar(p:integer);
begin if p>memend then printesc(65595)else begin if(mem[p].hh.b0>fontmax
)then printchar(42)else{297:}
printesc(hash[1196762+mem[p].hh.b0].rh){:297};printchar(32);
print(mem[p].hh.b1);end;end;procedure printmark(p:integer);
begin printchar(123);
if(p<himemmin)or(p>memend)then printesc(65595)else showtokenlist(mem[p].
hh.rh,-268435455,maxprintline-10);printchar(125);end;
procedure printruledimen(d:scaled);
begin if(d=-1073741824)then printchar(42)else printscaled(d);end;{:202}
{203:}procedure printglue(d:scaled;order:integer;s:strnumber);
begin printscaled(d);
if(order<0)or(order>3)then print(65596)else if order>0 then begin print(
65597);while order>1 do begin printchar(108);decr(order);end;
end else if s<>0 then print(s);end;{:203}{204:}
procedure printspec(p:integer;s:strnumber);
begin if(p<memmin)or(p>=lomemmax)then printchar(42)else begin
printscaled(mem[p+1].int);if s<>0 then print(s);
if mem[p+2].int<>0 then begin print(65598);
printglue(mem[p+2].int,mem[p].hh.b0,s);end;
if mem[p+3].int<>0 then begin print(65599);
printglue(mem[p+3].int,mem[p].hh.b1,s);end;end;end;{:204}{205:}{733:}
procedure printfamandchar(p:halfword);var c:integer;
begin printesc(65764);printint((mem[p].hh.b0 mod 256)mod 256);
printchar(32);
c:=(casttoushort(mem[p].hh.b1)+((mem[p].hh.b0 div 256)*65536));
if c<65536 then print(c)else printchar(c);end;
procedure printdelimiter(p:halfword);var a:integer;
begin a:=(mem[p].qqqq.b0 mod 256)*256+(mem[p].qqqq.b1+(mem[p].qqqq.b0
div 256)*65536);
a:=a*4096+(mem[p].qqqq.b2 mod 256)*256+(mem[p].qqqq.b3+(mem[p].qqqq.b2
div 256)*65536);if a<0 then printint(a)else printhex(a);end;{:733}{734:}
procedure showinfo;forward;procedure printsubsidiarydata(p:halfword;
c:UTF16code);
begin if(poolptr-strstart[(strptr)-65536])>=depththreshold then begin if
mem[p].hh.rh<>0 then print(65600);
end else begin begin if(c>65535)then begin strpool[poolptr]:=(c-65536)
div 1024+55296;incr(poolptr);strpool[poolptr]:=(c)mod 1024+56320;
incr(poolptr);end else begin strpool[poolptr]:=c;incr(poolptr);end;end;
tempptr:=p;case mem[p].hh.rh of 1:begin println;printcurrentstring;
printfamandchar(p);end;2:showinfo;
3:if mem[p].hh.lh=-268435455 then begin println;printcurrentstring;
print(66270);end else showinfo;others:end;decr(poolptr);end;end;{:734}
{736:}procedure printstyle(c:integer);
begin case c div 2 of 0:printesc(66271);1:printesc(66272);
2:printesc(66273);3:printesc(66274);others:print(66275)end;end;{:736}
{251:}procedure printskipparam(n:integer);
begin case n of 0:printesc(65675);1:printesc(65676);2:printesc(65677);
3:printesc(65678);4:printesc(65679);5:printesc(65680);6:printesc(65681);
7:printesc(65682);8:printesc(65683);9:printesc(65684);
10:printesc(65685);11:printesc(65686);12:printesc(65687);
13:printesc(65688);14:printesc(65689);15:printesc(65690);
16:printesc(65691);17:printesc(65692);18:printesc(65693);
others:print(65694)end;end;{:251}{:205}{208:}
procedure shownodelist(p:integer);label 10;var n:integer;i:integer;
g:real;
begin if(poolptr-strstart[(strptr)-65536])>depththreshold then begin if
p>-268435455 then print(65600);goto 10;end;n:=0;
while p>memmin do begin println;printcurrentstring;
if p>memend then begin print(65601);goto 10;end;incr(n);
if n>breadthmax then begin print(65602);goto 10;end;{209:}
if(p>=himemmin)then printfontandchar(p)else case mem[p].hh.b0 of 0,1,13:
{210:}
begin if mem[p].hh.b0=0 then printesc(104)else if mem[p].hh.b0=1 then
printesc(118)else printesc(65607);print(65608);
printscaled(mem[p+3].int);printchar(43);printscaled(mem[p+2].int);
print(65609);printscaled(mem[p+1].int);if mem[p].hh.b0=13 then{211:}
begin if mem[p].hh.b1<>0 then begin print(65566);
printint(mem[p].hh.b1+1);print(65611);end;
if mem[p+6].int<>0 then begin print(65612);
printglue(mem[p+6].int,mem[p+5].hh.b1,0);end;
if mem[p+4].int<>0 then begin print(65613);
printglue(mem[p+4].int,mem[p+5].hh.b0,0);end;end{:211}else begin{212:}
g:=mem[p+6].gr;if(g<>0.0)and(mem[p+5].hh.b0<>0)then begin print(65614);
if mem[p+5].hh.b0=2 then print(65615);
if fabs(g)>20000.0 then begin if g>0.0 then printchar(62)else print(
65616);printglue(20000*65536,mem[p+5].hh.b1,0);
end else printglue(round(65536*g),mem[p+5].hh.b1,0);end{:212};
if mem[p+4].int<>0 then begin print(65610);printscaled(mem[p+4].int);
end;if(eTeXmode=1)then{1514:}
if(mem[p].hh.b0=0)and((mem[p].hh.b1)=2)then print(66925){:1514};end;
begin begin if(46>65535)then begin strpool[poolptr]:=(-65490)div 1024
+55296;incr(poolptr);strpool[poolptr]:=(46)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=46;incr(poolptr);end;end;
shownodelist(mem[p+5].hh.rh);decr(poolptr);end;end{:210};2:{213:}
begin printesc(65617);printruledimen(mem[p+3].int);printchar(43);
printruledimen(mem[p+2].int);print(65609);printruledimen(mem[p+1].int);
end{:213};3:{214:}begin printesc(65618);printint(mem[p].hh.b1);
print(65619);printscaled(mem[p+3].int);print(65620);
printspec(mem[p+4].hh.rh,0);printchar(44);printscaled(mem[p+2].int);
print(65621);printint(mem[p+1].int);
begin begin if(46>65535)then begin strpool[poolptr]:=(-65490)div 1024
+55296;incr(poolptr);strpool[poolptr]:=(46)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=46;incr(poolptr);end;end;
shownodelist(mem[p+4].hh.lh);decr(poolptr);end;end{:214};8:{1416:}
case mem[p].hh.b1 of 0:begin printwritewhatsit(66748,p);printchar(61);
printfilename(mem[p+1].hh.rh,mem[p+2].hh.lh,mem[p+2].hh.rh);end;
1:begin printwritewhatsit(65922,p);printmark(mem[p+1].hh.rh);end;
2:printwritewhatsit(66749,p);3:begin printesc(66750);
printmark(mem[p+1].hh.rh);end;4:begin printesc(66750);print(66765);
printmark(mem[p+1].hh.rh);end;5:begin printesc(66752);
printint(mem[p+1].hh.rh);print(66766);printint(mem[p+1].hh.b0);
printchar(44);printint(mem[p+1].hh.b1);printchar(41);end;
23:printesc(66760);
40,41:begin printesc(hash[1196762+mem[p+4].qqqq.b1].rh);printchar(32);
printnativeword(p);end;
42:begin printesc(hash[1196762+mem[p+4].qqqq.b1].rh);print(66767);
printint(mem[p+4].qqqq.b2);end;
43,44:begin if mem[p].hh.b1=43 then printesc(66755)else printesc(66756);
print(66768);
for i:=0 to mem[p+4].hh.b0-1 do printrawchar(picpathbyte(p,i),true);
print(34);end;others:print(66769)end{:1416};10:{215:}
if mem[p].hh.b1>=100 then{216:}begin printesc(65626);
if mem[p].hh.b1=101 then printchar(99)else if mem[p].hh.b1=102 then
printchar(120);print(65627);printspec(mem[p+1].hh.lh,0);
begin begin if(46>65535)then begin strpool[poolptr]:=(-65490)div 1024
+55296;incr(poolptr);strpool[poolptr]:=(46)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=46;incr(poolptr);end;end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);end;end{:216}
else begin printesc(65622);if mem[p].hh.b1<>0 then begin printchar(40);
if mem[p].hh.b1<98 then printskipparam(mem[p].hh.b1-1)else if mem[p].hh.
b1=98 then printesc(65623)else printesc(65624);printchar(41);end;
if mem[p].hh.b1<>98 then begin printchar(32);
if mem[p].hh.b1<98 then printspec(mem[p+1].hh.lh,0)else printspec(mem[p
+1].hh.lh,65625);end;end{:215};11:{217:}
if mem[p].hh.b1<>99 then begin printesc(65603);
if mem[p].hh.b1<>0 then printchar(32);printscaled(mem[p+1].int);
if mem[p].hh.b1=2 then print(65628)else if mem[p].hh.b1=3 then print(
65629);end else begin printesc(65630);printscaled(mem[p+1].int);
print(65625);end{:217};40:begin printesc(65603);
printscaled(mem[p+1].int);
if mem[p].hh.b1=0 then print(65604)else print(65605);end;9:{218:}
if mem[p].hh.b1>1 then begin if odd(mem[p].hh.b1)then printesc(65631)
else printesc(65632);
if mem[p].hh.b1>8 then printchar(82)else if mem[p].hh.b1>4 then
printchar(76)else printchar(77);end else begin printesc(65633);
if mem[p].hh.b1=0 then print(65634)else print(65635);
if mem[p+1].int<>0 then begin print(65636);printscaled(mem[p+1].int);
end;end{:218};6:{219:}begin printfontandchar(p+1);print(65637);
if mem[p].hh.b1>1 then printchar(124);
fontinshortdisplay:=mem[p+1].hh.b0;shortdisplay(mem[p+1].hh.rh);
if odd(mem[p].hh.b1)then printchar(124);printchar(41);end{:219};
12:{220:}begin printesc(65638);printint(mem[p+1].int);end{:220};7:{221:}
begin printesc(65639);if mem[p].hh.b1>0 then begin print(65640);
printint(mem[p].hh.b1);end;
begin begin if(46>65535)then begin strpool[poolptr]:=(-65490)div 1024
+55296;incr(poolptr);strpool[poolptr]:=(46)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=46;incr(poolptr);end;end;
shownodelist(mem[p+1].hh.lh);decr(poolptr);end;
begin if(124>65535)then begin strpool[poolptr]:=(-65412)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(124)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=124;incr(poolptr);end;end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);end{:221};4:{222:}
begin printesc(65641);if mem[p+1].hh.lh<>0 then begin printchar(115);
printint(mem[p+1].hh.lh);end;printmark(mem[p+1].hh.rh);end{:222};
5:{223:}begin printesc(65642);if mem[p].hh.b1<>0 then print(65643);
begin begin if(46>65535)then begin strpool[poolptr]:=(-65490)div 1024
+55296;incr(poolptr);strpool[poolptr]:=(46)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=46;incr(poolptr);end;end;
shownodelist(mem[p+1].int);decr(poolptr);end;end{:223};{732:}
14:printstyle(mem[p].hh.b1);15:{737:}begin printesc(65846);
begin if(68>65535)then begin strpool[poolptr]:=(-65468)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(68)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=68;incr(poolptr);end;end;
shownodelist(mem[p+1].hh.lh);decr(poolptr);
begin if(84>65535)then begin strpool[poolptr]:=(-65452)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(84)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=84;incr(poolptr);end;end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);
begin if(83>65535)then begin strpool[poolptr]:=(-65453)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(83)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=83;incr(poolptr);end;end;
shownodelist(mem[p+2].hh.lh);decr(poolptr);
begin if(115>65535)then begin strpool[poolptr]:=(-65421)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(115)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=115;incr(poolptr);end;end;
shownodelist(mem[p+2].hh.rh);decr(poolptr);end{:737};
16,17,18,19,20,21,22,23,24,27,26,29,28,30,31:{738:}
begin case mem[p].hh.b0 of 16:printesc(66276);17:printesc(66277);
18:printesc(66278);19:printesc(66279);20:printesc(66280);
21:printesc(66281);22:printesc(66282);23:printesc(66283);
27:printesc(66284);26:printesc(66285);29:printesc(65863);
24:begin printesc(65855);printdelimiter(p+4);end;
28:begin printesc(65821);printfamandchar(p+4);end;
30:begin printesc(66286);printdelimiter(p+1);end;
31:begin if mem[p].hh.b1=0 then printesc(66287)else printesc(66288);
printdelimiter(p+1);end;end;
if mem[p].hh.b0<30 then begin if mem[p].hh.b1<>0 then if mem[p].hh.b1=1
then printesc(66289)else printesc(66290);printsubsidiarydata(p+1,46);
end;printsubsidiarydata(p+2,94);printsubsidiarydata(p+3,95);end{:738};
25:{739:}begin printesc(66291);
if mem[p+1].int=1073741824 then print(66292)else printscaled(mem[p+1].
int);
if((mem[p+4].qqqq.b0 mod 256)<>0)or((mem[p+4].qqqq.b1+(mem[p+4].qqqq.b0
div 256)*65536)<>0)or((mem[p+4].qqqq.b2 mod 256)<>0)or((mem[p+4].qqqq.b3
+(mem[p+4].qqqq.b2 div 256)*65536)<>0)then begin print(66293);
printdelimiter(p+4);end;
if((mem[p+5].qqqq.b0 mod 256)<>0)or((mem[p+5].qqqq.b1+(mem[p+5].qqqq.b0
div 256)*65536)<>0)or((mem[p+5].qqqq.b2 mod 256)<>0)or((mem[p+5].qqqq.b3
+(mem[p+5].qqqq.b2 div 256)*65536)<>0)then begin print(66294);
printdelimiter(p+5);end;printsubsidiarydata(p+2,92);
printsubsidiarydata(p+3,47);end{:739};{:732}others:print(65606)end{:209}
;p:=mem[p].hh.rh;end;10:end;{:208}{224:}procedure showbox(p:halfword);
begin{262:}depththreshold:=eqtb[7892289].int;
breadthmax:=eqtb[7892288].int{:262};if breadthmax<=0 then breadthmax:=5;
if poolptr+depththreshold>=poolsize then depththreshold:=poolsize-
poolptr-1;shownodelist(p);println;end;
procedure shortdisplayn(p,m:integer);begin breadthmax:=m;
depththreshold:=poolsize-poolptr-1;shownodelist(p);end;{:224}{226:}
procedure deletetokenref(p:halfword);
begin if mem[p].hh.lh=-268435455 then flushlist(p)else decr(mem[p].hh.lh
);end;{:226}{227:}procedure deleteglueref(p:halfword);
begin if mem[p].hh.rh=-268435455 then freenode(p,4)else decr(mem[p].hh.
rh);end;{:227}{228:}procedure flushnodelist(p:halfword);label 30;
var q:halfword;begin while p<>-268435455 do begin q:=mem[p].hh.rh;
if(p>=himemmin)then begin mem[p].hh.rh:=avail;avail:=p;
ifdef('STAT')decr(dynused);
endif('STAT')end else begin case mem[p].hh.b0 of 0,1,13:begin
flushnodelist(mem[p+5].hh.rh);freenode(p,8);goto 30;end;
2:begin freenode(p,5);goto 30;end;3:begin flushnodelist(mem[p+4].hh.lh);
deleteglueref(mem[p+4].hh.rh);freenode(p,5);goto 30;end;8:{1418:}
begin case mem[p].hh.b1 of 0:freenode(p,3);
1,3,4:begin deletetokenref(mem[p+1].hh.rh);freenode(p,2);goto 30;end;
2,5:freenode(p,2);
40,41:begin begin if mem[p+5].ptr<>nullptr then begin libcfree(mem[p+5].
ptr);mem[p+5].ptr:=nullptr;mem[p+4].qqqq.b3:=0;end end;
freenode(p,mem[p+4].qqqq.b0);end;42:freenode(p,5);
43,44:freenode(p,(9+(mem[p+4].hh.b0+sizeof(memoryword)-1)div sizeof(
memoryword)));23:freenode(p,2);others:confusion(66771)end;goto 30;
end{:1418};
10:begin begin if mem[mem[p+1].hh.lh].hh.rh=-268435455 then freenode(mem
[p+1].hh.lh,4)else decr(mem[mem[p+1].hh.lh].hh.rh);end;
if mem[p+1].hh.rh<>-268435455 then flushnodelist(mem[p+1].hh.rh);
freenode(p,3);goto 30;end;11,9,12:begin freenode(p,3);goto 30;end;
40:begin freenode(p,3);goto 30;end;6:flushnodelist(mem[p+1].hh.rh);
4:deletetokenref(mem[p+1].hh.rh);7:begin flushnodelist(mem[p+1].hh.lh);
flushnodelist(mem[p+1].hh.rh);end;5:flushnodelist(mem[p+1].int);{740:}
14:begin freenode(p,3);goto 30;end;
15:begin flushnodelist(mem[p+1].hh.lh);flushnodelist(mem[p+1].hh.rh);
flushnodelist(mem[p+2].hh.lh);flushnodelist(mem[p+2].hh.rh);
freenode(p,3);goto 30;end;
16,17,18,19,20,21,22,23,24,27,26,29,28:begin if mem[p+1].hh.rh>=2 then
flushnodelist(mem[p+1].hh.lh);
if mem[p+2].hh.rh>=2 then flushnodelist(mem[p+2].hh.lh);
if mem[p+3].hh.rh>=2 then flushnodelist(mem[p+3].hh.lh);
if mem[p].hh.b0=24 then freenode(p,5)else if mem[p].hh.b0=28 then
freenode(p,5)else freenode(p,4);goto 30;end;30,31:begin freenode(p,4);
goto 30;end;25:begin flushnodelist(mem[p+2].hh.lh);
flushnodelist(mem[p+3].hh.lh);freenode(p,6);goto 30;end;{:740}
others:confusion(65644)end;freenode(p,2);30:end;p:=q;end;end;{:228}
{230:}function copynodelist(p:halfword):halfword;var h:halfword;
q:halfword;r:halfword;words:0..5;begin h:=getavail;q:=h;
while p<>-268435455 do begin{231:}words:=1;
if(p>=himemmin)then r:=getavail else{232:}
case mem[p].hh.b0 of 0,1,13:begin r:=getnode(8);{1733:}
mem[r+7].hh.lh:=mem[p+7].hh.lh;mem[r+7].hh.rh:=mem[p+7].hh.rh;{:1733};
mem[r+6]:=mem[p+6];mem[r+5]:=mem[p+5];
mem[r+5].hh.rh:=copynodelist(mem[p+5].hh.rh);words:=5;end;
2:begin r:=getnode(5);words:=4;{1734:}{:1734};end;3:begin r:=getnode(5);
mem[r+4]:=mem[p+4];incr(mem[mem[p+4].hh.rh].hh.rh);
mem[r+4].hh.lh:=copynodelist(mem[p+4].hh.lh);words:=4;end;8:{1417:}
case mem[p].hh.b1 of 0:begin r:=getnode(3);words:=3;end;
1,3,4:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
2,5:begin r:=getnode(2);words:=2;end;
40,41:begin words:=mem[p+4].qqqq.b0;r:=getnode(words);
while words>0 do begin decr(words);mem[r+words]:=mem[p+words];end;
mem[r+5].ptr:=nullptr;mem[r+4].qqqq.b3:=0;copynativeglyphinfo(p,r);end;
42:begin r:=getnode(5);words:=5;end;
43,44:begin words:=(9+(mem[p+4].hh.b0+sizeof(memoryword)-1)div sizeof(
memoryword));r:=getnode(words);end;23:r:=getnode(2);
others:confusion(66770)end{:1417};10:begin r:=getnode(3);
incr(mem[mem[p+1].hh.lh].hh.rh);{1735:}mem[r+2].hh.lh:=mem[p+2].hh.lh;
mem[r+2].hh.rh:=mem[p+2].hh.rh;{:1735};mem[r+1].hh.lh:=mem[p+1].hh.lh;
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;
11,9,12:begin r:=getnode(3);words:=3;end;40:begin r:=getnode(3);
words:=3;end;6:begin r:=getnode(2);mem[r+1]:=mem[p+1];
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;7:begin r:=getnode(2);
mem[r+1].hh.lh:=copynodelist(mem[p+1].hh.lh);
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;4:begin r:=getnode(2);
incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;5:begin r:=getnode(2);
mem[r+1].int:=copynodelist(mem[p+1].int);end;
others:confusion(65645)end{:232};while words>0 do begin decr(words);
mem[r+words]:=mem[p+words];end{:231};mem[q].hh.rh:=r;q:=r;
p:=mem[p].hh.rh;end;mem[q].hh.rh:=-268435455;q:=mem[h].hh.rh;
begin mem[h].hh.rh:=avail;avail:=h;ifdef('STAT')decr(dynused);
endif('STAT')end;copynodelist:=q;end;{:230}{237:}
procedure printmode(m:integer);
begin if m>0 then case m div(104)of 0:print(65646);1:print(65647);
2:print(65648);
end else if m=0 then print(65649)else case(-m)div(104)of 0:print(65650);
1:print(65651);2:print(65652);end;end;procedure printinmode(m:integer);
begin if m>0 then case m div(104)of 0:print(65653);1:print(65654);
2:print(65655);
end else if m=0 then print(65656)else case(-m)div(104)of 0:print(65657);
1:print(65658);2:print(65659);end;end;{:237}{242:}procedure pushnest;
begin if nestptr>maxneststack then begin maxneststack:=nestptr;
if nestptr=nestsize then overflow(65660,nestsize);end;
nest[nestptr]:=curlist;incr(nestptr);curlist.headfield:=getavail;
curlist.tailfield:=curlist.headfield;curlist.pgfield:=0;
curlist.mlfield:=line;curlist.eTeXauxfield:=-268435455;end;{:242}{243:}
procedure popnest;begin begin mem[curlist.headfield].hh.rh:=avail;
avail:=curlist.headfield;ifdef('STAT')decr(dynused);endif('STAT')end;
decr(nestptr);curlist:=nest[nestptr];end;{:243}{244:}
procedure printtotals;forward;procedure showactivities;
var p:0..nestsize;m:-209..209;a:memoryword;q,r:halfword;t:integer;
begin nest[nestptr]:=curlist;printnl(65626);println;
for p:=nestptr downto 0 do begin m:=nest[p].modefield;
a:=nest[p].auxfield;printnl(65661);printmode(m);print(65662);
printint(abs(nest[p].mlfield));
if m=105 then if nest[p].pgfield<>8585216 then begin print(65663);
printint(nest[p].pgfield mod 65536);print(65664);
printint(nest[p].pgfield div 4194304);printchar(44);
printint((nest[p].pgfield div 65536)mod 64);printchar(41);end;
if nest[p].mlfield<0 then print(65665);if p=0 then begin{1040:}
if memtop-2<>pagetail then begin printnl(66416);
if outputactive then print(66417);showbox(mem[memtop-2].hh.rh);
if pagecontents>0 then begin printnl(66418);printtotals;printnl(66419);
printscaled(pagesofar[0]);r:=mem[memtop].hh.rh;
while r<>memtop do begin println;printesc(65618);t:=mem[r].hh.b1;
printint(t);print(66420);
if eqtb[7892352+t].int=1000 then t:=mem[r+3].int else t:=xovern(mem[r+3]
.int,1000)*eqtb[7892352+t].int;printscaled(t);
if mem[r].hh.b0=1 then begin q:=memtop-2;t:=0;repeat q:=mem[q].hh.rh;
if(mem[q].hh.b0=3)and(mem[q].hh.b1=mem[r].hh.b1)then incr(t);
until q=mem[r+1].hh.lh;print(66421);printint(t);print(66422);end;
r:=mem[r].hh.rh;end;end;end{:1040};
if mem[memtop-1].hh.rh<>-268435455 then printnl(65666);end;
showbox(mem[nest[p].headfield].hh.rh);{245:}
case abs(m)div(104)of 0:begin printnl(65667);
if a.int<=-65536000 then print(65668)else printscaled(a.int);
if nest[p].pgfield<>0 then begin print(65669);printint(nest[p].pgfield);
if nest[p].pgfield<>1 then print(65670)else print(65671);end;end;
1:begin printnl(65672);printint(a.hh.lh);
if m>0 then if a.hh.rh>0 then begin print(65673);printint(a.hh.rh);end;
end;2:if a.int<>-268435455 then begin print(65674);showbox(a.int);end;
end{:245};end;end;{:244}{263:}procedure printparam(n:integer);
begin case n of 0:printesc(65720);1:printesc(65721);2:printesc(65722);
3:printesc(65723);4:printesc(65724);5:printesc(65725);6:printesc(65726);
7:printesc(65727);8:printesc(65728);9:printesc(65729);
10:printesc(65730);11:printesc(65731);12:printesc(65732);
13:printesc(65733);14:printesc(65734);15:printesc(65735);
16:printesc(65736);17:printesc(65737);18:printesc(65738);
19:printesc(65739);20:printesc(65740);21:printesc(65741);
22:printesc(65742);23:printesc(65743);24:printesc(65744);
25:printesc(65745);26:printesc(65746);27:printesc(65747);
28:printesc(65748);29:printesc(65749);30:printesc(65750);
31:printesc(65751);32:printesc(65752);33:printesc(65753);
34:printesc(65754);35:printesc(65755);36:printesc(65756);
37:printesc(65757);38:printesc(65758);39:printesc(65759);
40:printesc(65760);41:printesc(65761);42:printesc(65762);
43:printesc(65763);44:printesc(65764);45:printesc(65765);
46:printesc(65766);47:printesc(65767);48:printesc(65768);
49:printesc(65769);50:printesc(65770);51:printesc(65771);
52:printesc(65772);53:printesc(65773);54:printesc(65774);
55:printesc(65775);56:printesc(65776);57:printesc(65777);
58:printesc(65778);59:printesc(65779);60:printesc(65780);
73:printesc(65781);74:printesc(65782);{1707:}87:printesc(66977);{:1707}
{1469:}61:printesc(66862);62:printesc(66863);63:printesc(66864);
64:printesc(66865);65:printesc(66866);66:printesc(66867);
67:printesc(66868);68:printesc(66869);69:printesc(66870);
71:printesc(66871);{:1469}{1510:}70:printesc(66910);75:printesc(66911);
77:printesc(66912);78:printesc(66913);79:printesc(66914);
76:printesc(66915);80:printesc(66916);83:printesc(66917);
84:printesc(66918);85:printesc(66919);86:printesc(66920);{:1510}
others:print(65783)end;end;{:263}{267:}procedure fixdateandtime;
begin dateandtime(systime,sysday,sysmonth,sysyear);
eqtb[7892284].int:=systime;eqtb[7892285].int:=sysday;
eqtb[7892286].int:=sysmonth;eqtb[7892287].int:=sysyear;end;{:267}{271:}
procedure begindiagnostic;begin oldsetting:=selector;
if(eqtb[7892293].int<=0)and(selector=19)then begin decr(selector);
if history=0 then history:=1;end;end;
procedure enddiagnostic(blankline:boolean);begin printnl(65626);
if blankline then println;selector:=oldsetting;end;{:271}{273:}
procedure printlengthparam(n:integer);begin case n of 0:printesc(65787);
1:printesc(65788);2:printesc(65789);3:printesc(65790);4:printesc(65791);
5:printesc(65792);6:printesc(65793);7:printesc(65794);8:printesc(65795);
9:printesc(65796);10:printesc(65797);11:printesc(65798);
12:printesc(65799);13:printesc(65800);14:printesc(65801);
15:printesc(65802);16:printesc(65803);17:printesc(65804);
18:printesc(65805);19:printesc(65806);20:printesc(65807);
21:printesc(65808);22:printesc(65809);others:print(65810)end;end;{:273}
{278:}{328:}procedure printcmdchr(cmd:quarterword;chrcode:halfword);
var n:integer;fontnamestr:strnumber;quotechar:UTF16code;
begin case cmd of 1:begin print(65884);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
2:begin print(65885);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
3:begin print(65886);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
6:begin print(65887);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
7:begin print(65888);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
8:begin print(65889);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
9:print(65890);10:begin print(65891);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
11:begin print(65892);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
12:begin print(65893);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;{253:}
76,77:if chrcode<1205783 then printskipparam(chrcode-1205764)else if
chrcode<1206039 then begin printesc(65695);printint(chrcode-1205783);
end else begin printesc(65696);printint(chrcode-1206039);end;{:253}
{257:}73:if chrcode>=1206307 then begin printesc(65707);
printint(chrcode-1206307);
end else case chrcode of 1206296:printesc(65698);
1206297:printesc(65699);1206298:printesc(65700);1206299:printesc(65701);
1206300:printesc(65702);1206301:printesc(65703);1206302:printesc(65704);
1206303:printesc(65705);{1468:}1206305:printesc(66861);
1206306:printesc(66759);{:1468}others:printesc(65706)end;{:257}{265:}
74:if chrcode<7892352 then printparam(chrcode-7892264)else begin
printesc(65785);printint(chrcode-7892352);end;{:265}{275:}
75:if chrcode<9006743 then printlengthparam(chrcode-9006720)else begin
printesc(65811);printint(chrcode-9006743);end;{:275}{296:}
45:printesc(65821);92:printesc(65822);40:printesc(65823);
41:printesc(65824);78:printesc(65834);61:printesc(65825);
42:printesc(65853);16:printesc(65826);110:printesc(65817);
90:printesc(65833);
15:if chrcode=1 then printesc(65829)else printesc(65827);
94:printesc(65830);67:printesc(65818);62:printesc(65831);
64:printesc(32);105:if chrcode=0 then printesc(65832){1574:}
else printesc(66164){:1574};32:printesc(65835);36:printesc(65836);
39:if chrcode=0 then printesc(65837)else printesc(65814);
37:printesc(65618);44:printesc(47);18:begin printesc(65641);
if chrcode>0 then printchar(115);end;
46:if chrcode=1 then printesc(65840)else printesc(65838);
17:if chrcode=2 then printesc(65845)else if chrcode=1 then printesc(
65843)else printesc(65841);54:printesc(65846);93:printesc(65847);
34:printesc(65848);65:printesc(65849);
106:if chrcode=0 then printesc(65850)else printesc(65814);
55:printesc(65623);63:printesc(65851);
66:if chrcode=1 then printesc(65857)else printesc(65855);
98:if chrcode=0 then printesc(65858){1571:}else printesc(66935){:1571};
0:printesc(65859);100:printesc(65860);81:printesc(65854);
85:case chrcode of 1206295:printesc(65852);{1676:}
1206563:printesc(66970);1206564:printesc(66971);1206565:printesc(66972);
1206566:printesc(66973);{:1676}end;
112:if chrcode=0 then printesc(65861){1497:}
else if chrcode=1 then printesc(66900)else printesc(66901){:1497};
72:{1644:}begin printesc(65707);
if chrcode<>membot then printsanum(chrcode);end{:1644};
38:printesc(65642);33:if chrcode=0 then printesc(65862){1512:}
else case chrcode of 6:printesc(66921);7:printesc(66922);
10:printesc(66923);others:printesc(66924)end{:1512};56:printesc(65863);
35:printesc(65864);103:printesc(65784);{:296}{365:}13:printesc(65926);
{:365}{411:}107:if chrcode=0 then printesc(65962){1559:}
else if chrcode=2 then printesc(66933){:1559}else printesc(65963);{:411}
{419:}113:begin case(chrcode mod 5)of 1:printesc(65965);
2:printesc(65966);3:printesc(65967);4:printesc(65968);
others:printesc(65964)end;if chrcode>=5 then printchar(115);end;{:419}
{446:}91:{1643:}
begin if(chrcode<membot)or(chrcode>membot+19)then cmd:=(mem[chrcode].hh.
b0 div 64)else begin cmd:=chrcode-membot;chrcode:=-268435455;end;
if cmd=0 then printesc(65785)else if cmd=1 then printesc(65811)else if
cmd=2 then printesc(65695)else printesc(65696);
if chrcode<>-268435455 then printsanum(chrcode);end{:1643};{:446}{451:}
80:if chrcode=1 then printesc(66013)else printesc(66012);
83:if chrcode=0 then printesc(66014){1503:}
else if chrcode=2 then printesc(66906){:1503}else printesc(66015);
84:if chrcode=1 then printesc(66016)else if chrcode=3 then printesc(
66017)else printesc(66018);71:case chrcode of 0:printesc(66019);
1:printesc(66020);2:printesc(66021);4:printesc(66022);{1453:}
3:printesc(66816);19:printesc(66817);27:printesc(66818);
28:printesc(66820);29:printesc(66821);30:printesc(66822);
31:printesc(66823);32:printesc(66824);33:printesc(66825);
34:printesc(66826);35:printesc(66827);36:printesc(66828);
37:printesc(66829);38:printesc(66830);39:printesc(66831);
40:printesc(66832);41:printesc(66833);42:printesc(66834);
43:printesc(66838);44:printesc(66839);45:printesc(66840);
46:printesc(66841);47:printesc(66842);48:printesc(66843);
49:printesc(66844);50:printesc(66845);55:printesc(66846);
51:printesc(66848);52:printesc(66849);53:printesc(66850);
54:printesc(66851);{:1453}{1474:}20:printesc(66885);21:printesc(66886);
{:1474}{1477:}22:printesc(66887);23:printesc(66888);24:printesc(66889);
{:1477}{1480:}56:printesc(66890);57:printesc(66891);58:printesc(66892);
59:printesc(66893);{:1480}{1483:}60:printesc(66894);61:printesc(66895);
62:printesc(66896);{:1483}{1590:}67:printesc(66945);68:printesc(66946);
69:printesc(66947);70:printesc(66948);{:1590}{1613:}25:printesc(66952);
26:printesc(66953);63:printesc(66954);64:printesc(66955);{:1613}{1617:}
65:printesc(66956);66:printesc(66957);{:1617}12:printesc(66024);
13:printesc(66025);16:printesc(66026);17:printesc(66027);
18:printesc(66028);others:printesc(66023)end;{:451}{504:}
111:case chrcode of 0:printesc(66096);1:printesc(66097);
2:printesc(66098);3:printesc(66099);4:printesc(66100);5:printesc(66115);
6:printesc(66101);16:printesc(66102);17:printesc(66103);
22:printesc(66104);23:printesc(66105);24:printesc(66106);
25:printesc(66107);26:printesc(66108);18:printesc(66109);
29:printesc(66110);30:printesc(66111);{1459:}33:printesc(66819);
34:printesc(66835);35:printesc(66836);36:printesc(66837);
37:printesc(66847);38:printesc(66113);39:printesc(66114);{:1459}
others:printesc(66112)end;{:504}{523:}
108:begin if chrcode>=32 then printesc(66164);
case chrcode mod 32 of 1:printesc(66147);2:printesc(66148);
3:printesc(66149);4:printesc(66150);5:printesc(66151);6:printesc(66152);
7:printesc(66153);8:printesc(66154);9:printesc(66155);
10:printesc(66156);11:printesc(66157);12:printesc(66158);
13:printesc(66159);14:printesc(66160);15:printesc(66161);
16:printesc(66162);21:printesc(66163);{1575:}17:printesc(66936);
18:printesc(66937);19:printesc(66938);20:printesc(66939);{:1575}
others:printesc(66146)end;end;{:523}{527:}
109:if chrcode=2 then printesc(66165)else if chrcode=4 then printesc(
66166)else printesc(66167);{:527}{829:}
4:if chrcode=1114113 then printesc(66326)else begin print(66330);
if chrcode<65536 then print(chrcode)else printchar(chrcode);end;
5:if chrcode=1114114 then printesc(66327)else printesc(66328);{:829}
{1038:}82:case chrcode of 0:printesc(66406);1:printesc(66407);
2:printesc(66408);3:printesc(66409);4:printesc(66410);5:printesc(66411);
6:printesc(66412);others:printesc(66413)end;{:1038}{1107:}
14:if chrcode=1 then printesc(66459)else printesc(65631);{:1107}{1113:}
26:case chrcode of 4:printesc(66460);0:printesc(66461);
1:printesc(66462);2:printesc(66463);others:printesc(66464)end;
27:case chrcode of 4:printesc(66465);0:printesc(66466);
1:printesc(66467);2:printesc(66468);others:printesc(66469)end;
28:printesc(65624);29:printesc(65603);30:printesc(65630);{:1113}{1126:}
21:if chrcode=1 then printesc(66487)else printesc(66488);
22:if chrcode=1 then printesc(66489)else printesc(66490);
20:case chrcode of 0:printesc(65709);1:printesc(66491);
2:printesc(66492);3:printesc(66401);4:printesc(66493);5:printesc(66403);
others:printesc(66494)end;
31:if chrcode=100 then printesc(66496)else if chrcode=101 then printesc(
66497)else if chrcode=102 then printesc(66498)else printesc(66495);
{:1126}{1143:}43:if chrcode=0 then printesc(66515)else printesc(66514);
{:1143}{1162:}
25:if chrcode=10 then printesc(66527)else if chrcode=11 then printesc(
66526)else printesc(66525);
23:if chrcode=1 then printesc(66529)else printesc(66528);
24:if chrcode=1 then printesc(66531){1673:}
else if chrcode=2 then printesc(66968)else if chrcode=3 then printesc(
66969){:1673}else printesc(66530);{:1162}{1169:}
47:if chrcode=1 then printesc(45)else printesc(65639);{:1169}{1197:}
48:if chrcode=1 then printesc(66563)else printesc(66562);{:1197}{1211:}
50:case chrcode of 16:printesc(66276);17:printesc(66277);
18:printesc(66278);19:printesc(66279);20:printesc(66280);
21:printesc(66281);22:printesc(66282);23:printesc(66283);
26:printesc(66285);others:printesc(66284)end;
51:if chrcode=1 then printesc(66289)else if chrcode=2 then printesc(
66290)else printesc(66564);{:1211}{1224:}53:printstyle(chrcode);{:1224}
{1233:}52:case chrcode of 1:printesc(66585);2:printesc(66586);
3:printesc(66587);4:printesc(66588);5:printesc(66589);
others:printesc(66584)end;{:1233}{1243:}
49:if chrcode=30 then printesc(66286){1508:}
else if chrcode=1 then printesc(66288){:1508}else printesc(66287);
{:1243}{1263:}
95:if chrcode=1 then printesc(66609)else if chrcode=2 then printesc(
66610){1582:}else if chrcode=8 then printesc(66623){:1582}
else printesc(66611);
99:if chrcode=0 then printesc(66612)else if chrcode=1 then printesc(
66613)else if chrcode=2 then printesc(66614)else printesc(66615);{:1263}
{1274:}96:if chrcode<>0 then printesc(66633)else printesc(66632);{:1274}
{1277:}97:case chrcode of 0:printesc(66634);1:printesc(66635);
9:printesc(66639);8:printesc(66637);2:printesc(66640);3:printesc(66641);
4:printesc(66642);5:printesc(66643);7:printesc(66645);
others:printesc(66644)end;68:begin printesc(65826);printhex(chrcode);
end;69:begin printesc(65841);printhex(chrcode);end;
70:begin printesc(65845);printhex(mathclassfield(chrcode));
printhex(mathfamfield(chrcode));printhex(mathcharfield(chrcode));end;
{:1277}{1285:}
86:if chrcode=1207592 then printesc(65715)else if chrcode=5664040 then
printesc(65719)else if chrcode=2321704 then printesc(65716)else if
chrcode=3435816 then printesc(65717)else if chrcode=4549928 then
printesc(65718)else printesc(65786);
87:if chrcode=4549928 then printesc(66654)else if chrcode=5664040 then
printesc(66651)else if chrcode=5664041 then printesc(66653)else if
chrcode=7892608 then printesc(66656)else printesc(66658);
88:printsize(chrcode-1206824);{:1285}{1305:}
101:if chrcode=1 then printesc(66389)else printesc(66377);{:1305}{1309:}
79:case chrcode of 0:printesc(66673);1:printesc(66674);
2:printesc(66675);3:printesc(66676);end;{:1309}{1315:}
89:begin print(66684);fontnamestr:=fontname[chrcode];
if((fontarea[chrcode]=65535)or(fontarea[chrcode]=65534))then begin
quotechar:=34;
for n:=0 to length(fontnamestr)-1 do if strpool[strstart[(fontnamestr)
-65536]+n]=34 then quotechar:=39;printchar(quotechar);
print(fontnamestr);printchar(quotechar);end else print(fontnamestr);
if fontsize[chrcode]<>fontdsize[chrcode]then begin print(66130);
printscaled(fontsize[chrcode]);print(65697);end;end;{:1315}{1317:}
102:case chrcode of 0:printesc(65554);1:printesc(65555);
2:printesc(65556);others:printesc(66685)end;{:1317}{1327:}
60:if chrcode=0 then printesc(66687)else printesc(66686);{:1327}{1332:}
58:if chrcode=0 then printesc(66688)else printesc(66689);{:1332}{1341:}
57:if chrcode=2321704 then printesc(66695)else printesc(66696);{:1341}
{1346:}19:case chrcode of 1:printesc(66698);2:printesc(66699);
3:printesc(66700);{1486:}4:printesc(66897);{:1486}{1495:}
5:printesc(66899);{:1495}{1500:}6:printesc(66902);{:1500}
others:printesc(66697)end;{:1346}{1349:}104:print(66707);
114,115,116,117:begin n:=cmd-114;
if mem[mem[chrcode].hh.rh].hh.lh=29360129 then n:=n+4;
if odd(n div 4)then printesc(66623);if odd(n)then printesc(66609);
if odd(n div 2)then printesc(66610);if n>0 then printchar(32);
print(66708);end;118:printesc(66709);{:1349}{1401:}
59:case chrcode of 0:printesc(66748);1:printesc(65922);
2:printesc(66749);3:printesc(66750);5:printesc(66751);6:printesc(66752);
23:printesc(66760);33:printesc(66753);35:printesc(66754);
41:printesc(66755);42:printesc(66756);43:printesc(66757);
46:printesc(66758);44:printesc(66761);45:printesc(66762);
others:print(66763)end;{:1401}others:print(65894)end;end;{:328}{1457:}
procedure notaatfonterror(cmd,c:integer;f:integer);
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66852);end;printcmdchr(cmd,c);print(66853);print(fontname[f]);
print(66854);error;end;procedure notaatgrfonterror(cmd,c:integer;
f:integer);begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66852);end;printcmdchr(cmd,c);print(66853);print(fontname[f]);
print(66855);error;end;procedure nototfonterror(cmd,c:integer;
f:integer);begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66852);end;printcmdchr(cmd,c);print(66853);print(fontname[f]);
print(66856);error;end;procedure notnativefonterror(cmd,c:integer;
f:integer);begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66852);end;printcmdchr(cmd,c);print(66853);print(fontname[f]);
print(66857);error;end;{:1457}
ifdef('STAT')procedure showeqtb(n:halfword);
begin if n<1 then printchar(63)else if(n<1205764)or((n>9006998)and(n<=
eqtbtop))then{249:}begin sprintcs(n);printchar(61);
printcmdchr(eqtb[n].hh.b0,eqtb[n].hh.rh);
if eqtb[n].hh.b0>=114 then begin printchar(58);
showtokenlist(mem[eqtb[n].hh.rh].hh.rh,-268435455,32);end;end{:249}
else if n<1206295 then{255:}
if n<1205783 then begin printskipparam(n-1205764);printchar(61);
if n<1205780 then printspec(eqtb[n].hh.rh,65697)else printspec(eqtb[n].
hh.rh,65625);end else if n<1206039 then begin printesc(65695);
printint(n-1205783);printchar(61);printspec(eqtb[n].hh.rh,65697);
end else begin printesc(65696);printint(n-1206039);printchar(61);
printspec(eqtb[n].hh.rh,65625);end{:255}else if n<7892264 then{259:}
if(n=1206295)or((n>=1206563)and(n<1206567))then begin printcmdchr(85,n);
printchar(61);
if eqtb[n].hh.rh=-268435455 then printchar(48)else if n>1206295 then
begin printint(mem[eqtb[n].hh.rh+1].int);printchar(32);
printint(mem[eqtb[n].hh.rh+2].int);
if mem[eqtb[n].hh.rh+1].int>1 then printesc(65708);
end else printint(mem[eqtb[1206295].hh.rh].hh.lh);
end else if n<1206307 then begin printcmdchr(73,n);printchar(61);
if eqtb[n].hh.rh<>-268435455 then showtokenlist(mem[eqtb[n].hh.rh].hh.rh
,-268435455,32);end else if n<1206567 then begin printesc(65707);
printint(n-1206307);printchar(61);
if eqtb[n].hh.rh<>-268435455 then showtokenlist(mem[eqtb[n].hh.rh].hh.rh
,-268435455,32);end else if n<1206823 then begin printesc(65709);
printint(n-1206567);printchar(61);
if eqtb[n].hh.rh=-268435455 then print(65710)else begin depththreshold:=
0;breadthmax:=1;shownodelist(eqtb[n].hh.rh);end;
end else if n<1207592 then{260:}
begin if n=1206823 then print(65711)else if n<1207080 then begin
printesc(65712);printint(n-1206824);
end else if n<1207336 then begin printesc(65713);printint(n-1207080);
end else begin printesc(65714);printint(n-1207336);end;printchar(61);
printesc(hash[1196762+eqtb[n].hh.rh].rh);end{:260}else{261:}
if n<5664040 then begin if n<2321704 then begin printesc(65715);
printint(n-1207592);end else if n<3435816 then begin printesc(65716);
printint(n-2321704);end else if n<4549928 then begin printesc(65717);
printint(n-3435816);end else begin printesc(65718);printint(n-4549928);
end;printchar(61);printint(eqtb[n].hh.rh);
end else begin printesc(65719);printint(n-5664040);printchar(61);
printint(eqtb[n].hh.rh);end{:261}{:259}else if n<9006720 then{268:}
begin if n<7892352 then printparam(n-7892264)else if n<7892608 then
begin printesc(65785);printint(n-7892352);
end else begin printesc(65786);printint(n-7892608);end;printchar(61);
printint(eqtb[n].int);end{:268}else if n<=9006998 then{277:}
begin if n<9006743 then printlengthparam(n-9006720)else begin printesc(
65811);printint(n-9006743);end;printchar(61);printscaled(eqtb[n].int);
print(65697);end{:277}else printchar(63);end;endif('STAT'){:278}{286:}
function idlookup(j,l:integer):halfword;label 40;var h:integer;
d:integer;p:halfword;k:halfword;ll:integer;begin{288:}h:=0;
for k:=j to j+l-1 do begin h:=h+h+buffer[k];while h>=8501 do h:=h-8501;
end{:288};p:=h+1179650;ll:=l;
for d:=0 to l-1 do if buffer[j+d]>=65536 then incr(ll);
while true do begin if hash[p].rh>0 then if length(hash[p].rh)=ll then
if streqbuf(hash[p].rh,j)then goto 40;
if hash[p].lh=0 then begin if nonewcontrolsequence then p:=1205763 else{
287:}
begin if hash[p].rh>0 then begin if hashhigh<hashextra then begin incr(
hashhigh);hash[p].lh:=hashhigh+9006998;p:=hashhigh+9006998;
end else begin repeat if(hashused=1179650)then overflow(65815,15000+
hashextra);decr(hashused);until hash[hashused].rh=0;
hash[p].lh:=hashused;p:=hashused;end;end;
begin if poolptr+ll>poolsize then overflow(65539,poolsize-initpoolptr);
end;d:=(poolptr-strstart[(strptr)-65536]);
while poolptr>strstart[(strptr)-65536]do begin decr(poolptr);
strpool[poolptr+l]:=strpool[poolptr];end;
for k:=j to j+l-1 do begin if buffer[k]<65536 then begin if(buffer[k]>
65535)then begin strpool[poolptr]:=(buffer[k]-65536)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(buffer[k])mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=buffer[k];incr(poolptr);end;
end else begin begin if(55296+(buffer[k]-65536)div 1024>65535)then begin
strpool[poolptr]:=(55296+(buffer[k]-65536)div 1024-65536)div 1024+55296;
incr(poolptr);
strpool[poolptr]:=(55296+(buffer[k]-65536)div 1024)mod 1024+56320;
incr(poolptr);
end else begin strpool[poolptr]:=55296+(buffer[k]-65536)div 1024;
incr(poolptr);end;end;
begin if(56320+(buffer[k]-65536)mod 1024>65535)then begin strpool[
poolptr]:=(56320+(buffer[k]-65536)mod 1024-65536)div 1024+55296;
incr(poolptr);
strpool[poolptr]:=(56320+(buffer[k]-65536)mod 1024)mod 1024+56320;
incr(poolptr);
end else begin strpool[poolptr]:=56320+(buffer[k]-65536)mod 1024;
incr(poolptr);end;end;end end;hash[p].rh:=makestring;poolptr:=poolptr+d;
ifdef('STAT')incr(cscount);endif('STAT')end{:287};goto 40;end;
p:=hash[p].lh;end;40:idlookup:=p;end;{:286}{289:}
function primlookup(s:strnumber):halfword;label 40;var h:integer;
p:halfword;k:halfword;j,l:integer;
begin if s<=65535 then begin if s<0 then begin p:=0;goto 40;
end else p:=(s mod 1777)+1;end else begin j:=strstart[(s)-65536];
if s=strptr then l:=(poolptr-strstart[(strptr)-65536])else l:=length(s);
{291:}h:=strpool[j];for k:=j+1 to j+l-1 do begin h:=h+h+strpool[k];
while h>=1777 do h:=h-1777;end{:291};p:=h+1;end;
while true do begin if prim[p].rh>65536 then begin if length(prim[p].rh
-1)=l then if streqstr(prim[p].rh-1,s)then goto 40;
end else if prim[p].rh=1+s then goto 40;
if prim[p].lh=0 then begin if nonewcontrolsequence then p:=0 else{290:}
begin if prim[p].rh>0 then begin repeat if(primused=1)then overflow(
65816,2100);decr(primused);until prim[primused].rh=0;
prim[p].lh:=primused;p:=primused;end;prim[p].rh:=s+1;end{:290};goto 40;
end;p:=prim[p].lh;end;40:primlookup:=p;end;{:289}{294:}
ifdef('INITEX')procedure primitive(s:strnumber;c:quarterword;
o:halfword);var k:poolpointer;j:0..bufsize;l:smallnumber;
primval:integer;begin if s<256 then begin curval:=s+1114113;
primval:=primlookup(s);end else begin k:=strstart[(s)-65536];
l:=strstart[(s+1)-65536]-k;
if first+l>bufsize+1 then overflow(65538,bufsize);
for j:=0 to l-1 do buffer[first+j]:=strpool[k+j];
curval:=idlookup(first,l);begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;hash[curval].rh:=s;
primval:=primlookup(s);end;eqtb[curval].hh.b1:=1;eqtb[curval].hh.b0:=c;
eqtb[curval].hh.rh:=o;eqtb[1194662+primval].hh.b1:=1;
eqtb[1194662+primval].hh.b0:=c;eqtb[1194662+primval].hh.rh:=o;end;
endif('INITEX'){:294}{298:}{314:}
ifdef('STAT')procedure restoretrace(p:halfword;s:strnumber);
begin begindiagnostic;printchar(123);print(s);printchar(32);showeqtb(p);
printchar(125);enddiagnostic(false);end;endif('STAT'){:314}{1471:}
procedure printgroup(e:boolean);label 10;
begin case curgroup of 0:begin print(66872);goto 10;end;
1,14:begin if curgroup=14 then print(66873);print(66874);end;
2,3:begin if curgroup=3 then print(66875);print(66494);end;
4:print(66403);5:print(66493);6,7:begin if curgroup=7 then print(66876);
print(66877);end;8:print(65698);10:print(66878);11:print(65618);
12:print(65863);9,13,15,16:begin print(65633);
if curgroup=13 then print(66879)else if curgroup=15 then print(66880)
else if curgroup=16 then print(66881);end;end;print(66882);
printint(curlevel);printchar(41);
if savestack[saveptr-1].int<>0 then begin if e then print(65662)else
print(66310);printint(savestack[saveptr-1].int);end;10:end;{:1471}
{1472:}ifdef('STAT')procedure grouptrace(e:boolean);
begin begindiagnostic;printchar(123);
if e then print(66883)else print(66884);printgroup(e);printchar(125);
enddiagnostic(false);end;endif('STAT'){:1472}{1567:}
function pseudoinput:boolean;var p:halfword;sz:integer;w:fourquarters;
r:halfword;begin last:=first;p:=mem[pseudofiles].hh.lh;
if p=-268435455 then pseudoinput:=false else begin mem[pseudofiles].hh.
lh:=mem[p].hh.rh;sz:=mem[p].hh.lh;if 4*sz-3>=bufsize-last then{35:}
begin curinput.locfield:=first;curinput.limitfield:=last-1;
overflow(65538,bufsize);end{:35};last:=first;
for r:=p+1 to p+sz-1 do begin w:=mem[r].qqqq;buffer[last]:=w.b0;
buffer[last+1]:=w.b1;buffer[last+2]:=w.b2;buffer[last+3]:=w.b3;
last:=last+4;end;if last>=maxbufstack then maxbufstack:=last+1;
while(last>first)and(buffer[last-1]=32)do decr(last);freenode(p,sz);
pseudoinput:=true;end;end;{:1567}{1568:}procedure pseudoclose;
var p,q:halfword;begin p:=mem[pseudofiles].hh.rh;
q:=mem[pseudofiles].hh.lh;begin mem[pseudofiles].hh.rh:=avail;
avail:=pseudofiles;ifdef('STAT')decr(dynused);endif('STAT')end;
pseudofiles:=p;while q<>-268435455 do begin p:=q;q:=mem[p].hh.rh;
freenode(p,mem[p].hh.lh);end;end;{:1568}{1585:}procedure groupwarning;
var i:0..maxinopen;w:boolean;begin baseptr:=inputptr;
inputstack[baseptr]:=curinput;i:=inopen;w:=false;
while(grpstack[i]=curboundary)and(i>0)do begin{1586:}
if eqtb[7892329].int>0 then begin while(inputstack[baseptr].statefield=0
)or(inputstack[baseptr].indexfield>i)do decr(baseptr);
if inputstack[baseptr].namefield>17 then w:=true;end{:1586};
grpstack[i]:=savestack[saveptr].hh.rh;decr(i);end;
if w then begin printnl(66941);printgroup(true);print(66942);println;
if eqtb[7892329].int>1 then showcontext;if history=0 then history:=1;
end;end;{:1585}{1587:}procedure ifwarning;var i:0..maxinopen;w:boolean;
begin baseptr:=inputptr;inputstack[baseptr]:=curinput;i:=inopen;
w:=false;while ifstack[i]=condptr do begin{1586:}
if eqtb[7892329].int>0 then begin while(inputstack[baseptr].statefield=0
)or(inputstack[baseptr].indexfield>i)do decr(baseptr);
if inputstack[baseptr].namefield>17 then w:=true;end{:1586};
ifstack[i]:=mem[condptr].hh.rh;decr(i);end;
if w then begin printnl(66941);printcmdchr(108,curif);
if ifline<>0 then begin print(66903);printint(ifline);end;print(66942);
println;if eqtb[7892329].int>1 then showcontext;
if history=0 then history:=1;end;end;{:1587}{1588:}
procedure filewarning;var p:halfword;l:quarterword;c:quarterword;
i:integer;begin p:=saveptr;l:=curlevel;c:=curgroup;saveptr:=curboundary;
while grpstack[inopen]<>saveptr do begin decr(curlevel);printnl(66943);
printgroup(true);print(66944);curgroup:=savestack[saveptr].hh.b1;
saveptr:=savestack[saveptr].hh.rh end;saveptr:=p;curlevel:=l;
curgroup:=c;p:=condptr;l:=iflimit;c:=curif;i:=ifline;
while ifstack[inopen]<>condptr do begin printnl(66943);
printcmdchr(108,curif);if iflimit=2 then printesc(66167);
if ifline<>0 then begin print(66903);printint(ifline);end;print(66944);
ifline:=mem[condptr+1].int;curif:=mem[condptr].hh.b1;
iflimit:=mem[condptr].hh.b0;condptr:=mem[condptr].hh.rh;end;condptr:=p;
iflimit:=l;curif:=c;ifline:=i;println;
if eqtb[7892329].int>1 then showcontext;if history=0 then history:=1;
end;{:1588}{1632:}procedure deletesaref(q:halfword);label 10;
var p:halfword;i:smallnumber;s:smallnumber;begin decr(mem[q+1].hh.lh);
if mem[q+1].hh.lh<>-268435455 then goto 10;
if mem[q].hh.b0<128 then if mem[q+2].int=0 then s:=3 else goto 10 else
begin if mem[q].hh.b0<256 then if mem[q+1].hh.rh=membot then
deleteglueref(membot)else goto 10 else if mem[q+1].hh.rh<>-268435455
then goto 10;s:=2;end;repeat i:=mem[q].hh.b0 mod 64;p:=q;
q:=mem[p].hh.rh;freenode(p,s);
if q=-268435455 then begin saroot[i]:=-268435455;goto 10;end;
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=-268435455 else mem[q+(i
div 2)+1].hh.lh:=-268435455;decr(mem[q].hh.b1);end;s:=33;
until mem[q].hh.b1>0;10:end;{:1632}{1634:}
ifdef('STAT')procedure showsa(p:halfword;s:strnumber);var t:smallnumber;
begin begindiagnostic;printchar(123);print(s);printchar(32);
if p=-268435455 then printchar(63)else begin t:=(mem[p].hh.b0 div 64);
if t<4 then printcmdchr(91,p)else if t=4 then begin printesc(65709);
printsanum(p);end else if t=5 then printcmdchr(72,p)else printchar(63);
printchar(61);
if t=0 then printint(mem[p+2].int)else if t=1 then begin printscaled(mem
[p+2].int);print(65697);end else begin p:=mem[p+1].hh.rh;
if t=2 then printspec(p,65697)else if t=3 then printspec(p,65625)else if
t=4 then if p=-268435455 then print(65710)else begin depththreshold:=0;
breadthmax:=1;shownodelist(p);
end else if t=5 then begin if p<>-268435455 then showtokenlist(mem[p].hh
.rh,-268435455,32);end else printchar(63);end;end;printchar(125);
enddiagnostic(false);end;endif('STAT'){:1634}{1648:}
procedure sasave(p:halfword);var q:halfword;i:quarterword;
begin if curlevel<>salevel then begin if saveptr>maxsavestack then begin
maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(65865,savesize);end;
savestack[saveptr].hh.b0:=4;savestack[saveptr].hh.b1:=salevel;
savestack[saveptr].hh.rh:=sachain;incr(saveptr);sachain:=-268435455;
salevel:=curlevel;end;i:=mem[p].hh.b0;
if i<128 then begin if mem[p+2].int=0 then begin q:=getnode(2);i:=384;
end else begin q:=getnode(3);mem[q+2].int:=mem[p+2].int;end;
mem[q+1].hh.rh:=-268435455;end else begin q:=getnode(2);
mem[q+1].hh.rh:=mem[p+1].hh.rh;end;mem[q+1].hh.lh:=p;mem[q].hh.b0:=i;
mem[q].hh.b1:=mem[p].hh.b1;mem[q].hh.rh:=sachain;sachain:=q;
incr(mem[p+1].hh.lh);end;{:1648}{1649:}procedure sadestroy(p:halfword);
begin if mem[p].hh.b0<256 then deleteglueref(mem[p+1].hh.rh)else if mem[
p+1].hh.rh<>-268435455 then if mem[p].hh.b0<320 then flushnodelist(mem[p
+1].hh.rh)else deletetokenref(mem[p+1].hh.rh);end;{:1649}{1650:}
procedure sadef(p:halfword;e:halfword);begin incr(mem[p+1].hh.lh);
if mem[p+1].hh.rh=e then begin ifdef('STAT')if eqtb[7892325].int>0 then
showsa(p,65867);endif('STAT')sadestroy(p);
end else begin ifdef('STAT')if eqtb[7892325].int>0 then showsa(p,65868);
endif('STAT')if mem[p].hh.b1=curlevel then sadestroy(p)else sasave(p);
mem[p].hh.b1:=curlevel;mem[p+1].hh.rh:=e;
ifdef('STAT')if eqtb[7892325].int>0 then showsa(p,65869);
endif('STAT')end;deletesaref(p);end;procedure sawdef(p:halfword;
w:integer);begin incr(mem[p+1].hh.lh);
if mem[p+2].int=w then begin ifdef('STAT')if eqtb[7892325].int>0 then
showsa(p,65867);
endif('STAT')end else begin ifdef('STAT')if eqtb[7892325].int>0 then
showsa(p,65868);endif('STAT')if mem[p].hh.b1<>curlevel then sasave(p);
mem[p].hh.b1:=curlevel;mem[p+2].int:=w;
ifdef('STAT')if eqtb[7892325].int>0 then showsa(p,65869);
endif('STAT')end;deletesaref(p);end;{:1650}{1651:}
procedure gsadef(p:halfword;e:halfword);begin incr(mem[p+1].hh.lh);
ifdef('STAT')if eqtb[7892325].int>0 then showsa(p,65870);
endif('STAT')sadestroy(p);mem[p].hh.b1:=1;mem[p+1].hh.rh:=e;
ifdef('STAT')if eqtb[7892325].int>0 then showsa(p,65869);
endif('STAT')deletesaref(p);end;procedure gsawdef(p:halfword;w:integer);
begin incr(mem[p+1].hh.lh);
ifdef('STAT')if eqtb[7892325].int>0 then showsa(p,65870);
endif('STAT')mem[p].hh.b1:=1;mem[p+2].int:=w;
ifdef('STAT')if eqtb[7892325].int>0 then showsa(p,65869);
endif('STAT')deletesaref(p);end;{:1651}{1652:}procedure sarestore;
var p:halfword;begin repeat p:=mem[sachain+1].hh.lh;
if mem[p].hh.b1=1 then begin if mem[p].hh.b0>=128 then sadestroy(sachain
);ifdef('STAT')if eqtb[7892301].int>0 then showsa(p,65872);
endif('STAT')end else begin if mem[p].hh.b0<128 then if mem[sachain].hh.
b0<128 then mem[p+2].int:=mem[sachain+2].int else mem[p+2].int:=0 else
begin sadestroy(p);mem[p+1].hh.rh:=mem[sachain+1].hh.rh;end;
mem[p].hh.b1:=mem[sachain].hh.b1;
ifdef('STAT')if eqtb[7892301].int>0 then showsa(p,65873);
endif('STAT')end;deletesaref(p);p:=sachain;sachain:=mem[p].hh.rh;
if mem[p].hh.b0<128 then freenode(p,3)else freenode(p,2);
until sachain=-268435455;end;{:1652}{:298}{304:}
procedure newsavelevel(c:groupcode);
begin if saveptr>maxsavestack then begin maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(65865,savesize);end;
if(eTeXmode=1)then begin savestack[saveptr+0].int:=line;incr(saveptr);
end;savestack[saveptr].hh.b0:=3;savestack[saveptr].hh.b1:=curgroup;
savestack[saveptr].hh.rh:=curboundary;
if curlevel=65535 then overflow(65866,65535);curboundary:=saveptr;
curgroup:=c;ifdef('STAT')if eqtb[7892326].int>0 then grouptrace(false);
endif('STAT')incr(curlevel);incr(saveptr);end;{:304}{305:}
procedure eqdestroy(w:memoryword);var q:halfword;
begin case w.hh.b0 of 114,115,116,117:deletetokenref(w.hh.rh);
120:deleteglueref(w.hh.rh);121:begin q:=w.hh.rh;
if q<>-268435455 then freenode(q,mem[q].hh.lh+mem[q].hh.lh+1);end;
122:flushnodelist(w.hh.rh);{1645:}
72,91:if(w.hh.rh<membot)or(w.hh.rh>membot+19)then deletesaref(w.hh.rh);
{:1645}others:end;end;{:305}{306:}procedure eqsave(p:halfword;
l:quarterword);
begin if saveptr>maxsavestack then begin maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(65865,savesize);end;
if l=0 then savestack[saveptr].hh.b0:=1 else begin savestack[saveptr]:=
eqtb[p];incr(saveptr);savestack[saveptr].hh.b0:=0;end;
savestack[saveptr].hh.b1:=l;savestack[saveptr].hh.rh:=p;incr(saveptr);
end;{:306}{307:}procedure eqdefine(p:halfword;t:quarterword;e:halfword);
label 10;
begin if(eTeXmode=1)and(eqtb[p].hh.b0=t)and(eqtb[p].hh.rh=e)then begin
ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65867);
endif('STAT')eqdestroy(eqtb[p]);goto 10;end;
ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65868);
endif('STAT')if eqtb[p].hh.b1=curlevel then eqdestroy(eqtb[p])else if
curlevel>1 then eqsave(p,eqtb[p].hh.b1);eqtb[p].hh.b1:=curlevel;
eqtb[p].hh.b0:=t;eqtb[p].hh.rh:=e;
ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65869);
endif('STAT')10:end;{:307}{308:}procedure eqworddefine(p:halfword;
w:integer);label 10;
begin if(eTeXmode=1)and(eqtb[p].int=w)then begin ifdef('STAT')if eqtb[
7892325].int>0 then restoretrace(p,65867);endif('STAT')goto 10;end;
ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65868);
endif('STAT')if xeqlevel[p]<>curlevel then begin eqsave(p,xeqlevel[p]);
xeqlevel[p]:=curlevel;end;eqtb[p].int:=w;
ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65869);
endif('STAT')10:end;{:308}{309:}procedure geqdefine(p:halfword;
t:quarterword;e:halfword);
begin ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65870);
endif('STAT')begin eqdestroy(eqtb[p]);eqtb[p].hh.b1:=1;eqtb[p].hh.b0:=t;
eqtb[p].hh.rh:=e;end;
ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65869);
endif('STAT')end;procedure geqworddefine(p:halfword;w:integer);
begin ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65870);
endif('STAT')begin eqtb[p].int:=w;xeqlevel[p]:=1;end;
ifdef('STAT')if eqtb[7892325].int>0 then restoretrace(p,65869);
endif('STAT')end;{:309}{310:}procedure saveforafter(t:halfword);
begin if curlevel>1 then begin if saveptr>maxsavestack then begin
maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(65865,savesize);end;
savestack[saveptr].hh.b0:=2;savestack[saveptr].hh.b1:=0;
savestack[saveptr].hh.rh:=t;incr(saveptr);end;end;{:310}{311:}
procedure backinput;forward;procedure unsave;label 30;var p:halfword;
l:quarterword;t:halfword;a:boolean;begin a:=false;
if curlevel>1 then begin decr(curlevel);{312:}
while true do begin decr(saveptr);
if savestack[saveptr].hh.b0=3 then goto 30;p:=savestack[saveptr].hh.rh;
if savestack[saveptr].hh.b0=2 then{356:}begin t:=curtok;curtok:=p;
if a then begin p:=getavail;mem[p].hh.lh:=curtok;
mem[p].hh.rh:=curinput.locfield;curinput.locfield:=p;
curinput.startfield:=p;
if curtok<6291456 then if curtok<4194304 then decr(alignstate)else incr(
alignstate);end else begin backinput;a:=(eTeXmode=1);end;curtok:=t;
end{:356}else if savestack[saveptr].hh.b0=4 then begin sarestore;
sachain:=p;salevel:=savestack[saveptr].hh.b1;
end else begin if savestack[saveptr].hh.b0=0 then begin l:=savestack[
saveptr].hh.b1;decr(saveptr);end else savestack[saveptr]:=eqtb[1205763];
{313:}
if(p<7892264)or(p>9006998)then if eqtb[p].hh.b1=1 then begin eqdestroy(
savestack[saveptr]);
ifdef('STAT')if eqtb[7892301].int>0 then restoretrace(p,65872);
endif('STAT')end else begin eqdestroy(eqtb[p]);
eqtb[p]:=savestack[saveptr];
ifdef('STAT')if eqtb[7892301].int>0 then restoretrace(p,65873);
endif('STAT')end else if xeqlevel[p]<>1 then begin eqtb[p]:=savestack[
saveptr];xeqlevel[p]:=l;
ifdef('STAT')if eqtb[7892301].int>0 then restoretrace(p,65873);
endif('STAT')end else begin ifdef('STAT')if eqtb[7892301].int>0 then
restoretrace(p,65872);endif('STAT')end{:313};end;end;
30:ifdef('STAT')if eqtb[7892326].int>0 then grouptrace(true);
endif('STAT')if grpstack[inopen]=curboundary then groupwarning;
curgroup:=savestack[saveptr].hh.b1;
curboundary:=savestack[saveptr].hh.rh;
if(eTeXmode=1)then decr(saveptr){:312};end else confusion(65871);end;
{:311}{318:}procedure preparemag;
begin if(magset>0)and(eqtb[7892281].int<>magset)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65875);end;printint(eqtb[7892281].int);print(65876);
printnl(65877);begin helpptr:=2;helpline[1]:=65878;helpline[0]:=65879;
end;interror(magset);geqworddefine(7892281,magset);end;
if(eqtb[7892281].int<=0)or(eqtb[7892281].int>32768)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65880);end;begin helpptr:=1;helpline[0]:=65881;end;
interror(eqtb[7892281].int);geqworddefine(7892281,1000);end;
magset:=eqtb[7892281].int;end;{:318}{325:}
procedure tokenshow(p:halfword);
begin if p<>-268435455 then showtokenlist(mem[p].hh.rh,-268435455,
10000000);end;{:325}{326:}procedure printmeaning;
begin printcmdchr(curcmd,curchr);
if curcmd>=114 then begin printchar(58);println;tokenshow(curchr);
end else if(curcmd=113)and(curchr<5)then begin printchar(58);println;
tokenshow(curmark[curchr]);end;end;{:326}{329:}procedure showcurcmdchr;
var n:integer;l:integer;p:halfword;begin begindiagnostic;printnl(123);
if curlist.modefield<>shownmode then begin printmode(curlist.modefield);
print(65593);shownmode:=curlist.modefield;end;
printcmdchr(curcmd,curchr);
if eqtb[7892327].int>0 then if curcmd>=108 then if curcmd<=109 then
begin print(65593);if curcmd=109 then begin printcmdchr(108,curif);
printchar(32);n:=0;l:=ifline;end else begin n:=1;l:=line;end;p:=condptr;
while p<>-268435455 do begin incr(n);p:=mem[p].hh.rh;end;print(65895);
printint(n);printchar(41);if l<>0 then begin print(66903);printint(l);
end;end;printchar(125);enddiagnostic(false);end;{:329}{341:}
procedure showcontext;label 30;var oldsetting:0..21;nn:integer;
bottomline:boolean;{345:}i:0..bufsize;j:0..bufsize;l:0..halferrorline;
m:integer;n:0..errorline;p:integer;q:integer;{:345}
begin baseptr:=inputptr;inputstack[baseptr]:=curinput;nn:=-1;
bottomline:=false;while true do begin curinput:=inputstack[baseptr];
if(curinput.statefield<>0)then if(curinput.namefield>19)or(baseptr=0)
then bottomline:=true;
if(baseptr=inputptr)or bottomline or(nn<eqtb[7892318].int)then{342:}
begin if(baseptr=inputptr)or(curinput.statefield<>0)or(curinput.
indexfield<>3)or(curinput.locfield<>-268435455)then begin tally:=0;
oldsetting:=selector;if curinput.statefield<>0 then begin{343:}
if curinput.namefield<=17 then if(curinput.namefield=0)then if baseptr=0
then printnl(65900)else printnl(65901)else begin printnl(65902);
if curinput.namefield=17 then printchar(42)else printint(curinput.
namefield-1);printchar(62);end else begin printnl(65903);
if curinput.indexfield=inopen then printint(line)else printint(linestack
[curinput.indexfield+1]);end;printchar(32){:343};{348:}begin l:=tally;
tally:=0;selector:=20;trickcount:=1000000;end;
if buffer[curinput.limitfield]=eqtb[7892312].int then j:=curinput.
limitfield else j:=curinput.limitfield+1;
if j>0 then for i:=curinput.startfield to j-1 do begin if i=curinput.
locfield then begin firstcount:=tally;
trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;
printchar(buffer[i]);end{:348};end else begin{344:}
case curinput.indexfield of 0:printnl(65904);1,2:printnl(65905);
3,4:if curinput.locfield=-268435455 then printnl(65906)else printnl(
65907);5:printnl(65908);6:begin println;printcs(curinput.namefield);end;
7:printnl(65909);8:printnl(65910);9:printnl(65911);10:printnl(65912);
11:printnl(65913);12:printnl(65914);13:printnl(65915);14:printnl(65916);
15:printnl(65917);16:printnl(65918);17:printnl(65919);18:printnl(65920);
others:printnl(63)end{:344};{349:}begin l:=tally;tally:=0;selector:=20;
trickcount:=1000000;end;
if curinput.indexfield<6 then showtokenlist(curinput.startfield,curinput
.locfield,100000)else showtokenlist(mem[curinput.startfield].hh.rh,
curinput.locfield,100000){:349};end;selector:=oldsetting;{347:}
if trickcount=1000000 then begin firstcount:=tally;
trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;
if tally<trickcount then m:=tally-firstcount else m:=trickcount-
firstcount;if l+firstcount<=halferrorline then begin p:=0;
n:=l+firstcount;end else begin print(65557);
p:=l+firstcount-halferrorline+3;n:=halferrorline;end;
for q:=p to firstcount-1 do printchar(trickbuf[q mod errorline]);
println;for q:=1 to n do printrawchar(32,true);
if m+n<=errorline then p:=firstcount+m else p:=firstcount+(errorline-n-3
);for q:=firstcount to p-1 do printchar(trickbuf[q mod errorline]);
if m+n>errorline then print(65557){:347};incr(nn);end;end{:342}
else if nn=eqtb[7892318].int then begin printnl(65557);incr(nn);end;
if bottomline then goto 30;decr(baseptr);end;
30:curinput:=inputstack[inputptr];end;{:341}{353:}
procedure begintokenlist(p:halfword;t:quarterword);
begin begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(65921,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.statefield:=0;curinput.startfield:=p;curinput.indexfield:=t;
if t>=6 then begin incr(mem[p].hh.lh);
if t=6 then curinput.limitfield:=paramptr else begin curinput.locfield:=
mem[p].hh.rh;if eqtb[7892294].int>1 then begin begindiagnostic;
printnl(65626);case t of 15:printesc(65641);18:printesc(65922);
others:printcmdchr(73,t+1206289)end;print(65883);tokenshow(p);
enddiagnostic(false);end;end;end else curinput.locfield:=p;end;{:353}
{354:}procedure endtokenlist;
begin if curinput.indexfield>=3 then begin if curinput.indexfield<=5
then flushlist(curinput.startfield)else begin deletetokenref(curinput.
startfield);
if curinput.indexfield=6 then while paramptr>curinput.limitfield do
begin decr(paramptr);flushlist(paramstack[paramptr]);
end else if(curinput.indexfield=7)and(not outputcanend)then fatalerror(
65923);end;
end else if curinput.indexfield=1 then if alignstate>500000 then
alignstate:=0 else fatalerror(65924);begin decr(inputptr);
curinput:=inputstack[inputptr];end;
begin if interrupt<>0 then pauseforinstructions;end;end;{:354}{355:}
procedure backinput;var p:halfword;
begin while(curinput.locfield=-268435455)and(curinput.indexfield<>2)and(
curinput.indexfield<>7)do endtokenlist;p:=getavail;mem[p].hh.lh:=curtok;
if curtok<6291456 then if curtok<4194304 then decr(alignstate)else incr(
alignstate);
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(65921,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.statefield:=0;curinput.startfield:=p;curinput.indexfield:=3;
curinput.locfield:=p;end;{:355}{357:}procedure backerror;
begin OKtointerrupt:=false;backinput;OKtointerrupt:=true;error;end;
procedure inserror;begin OKtointerrupt:=false;backinput;
curinput.indexfield:=5;OKtointerrupt:=true;error;end;{:357}{358:}
procedure beginfilereading;
begin if inopen=maxinopen then overflow(65925,maxinopen);
if first=bufsize then overflow(65538,bufsize);incr(inopen);
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(65921,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.indexfield:=inopen;sourcefilenamestack[curinput.indexfield]:=0;
fullsourcefilenamestack[curinput.indexfield]:=0;
eofseen[curinput.indexfield]:=false;
grpstack[curinput.indexfield]:=curboundary;
ifstack[curinput.indexfield]:=condptr;
linestack[curinput.indexfield]:=line;curinput.startfield:=first;
curinput.statefield:=1;curinput.namefield:=0;{1717:}
curinput.synctextagfield:=0;{:1717};end;{:358}{359:}
procedure endfilereading;begin first:=curinput.startfield;
line:=linestack[curinput.indexfield];
if(curinput.namefield=18)or(curinput.namefield=19)then pseudoclose else
if curinput.namefield>17 then uclose(inputfile[curinput.indexfield]);
begin decr(inputptr);curinput:=inputstack[inputptr];end;decr(inopen);
end;{:359}{360:}procedure clearforerrorprompt;
begin while(curinput.statefield<>0)and(curinput.namefield=0)and(inputptr
>0)and(curinput.locfield>curinput.limitfield)do endfilereading;println;;
end;{:360}{366:}procedure checkoutervalidity;var p:halfword;q:halfword;
begin if scannerstatus<>0 then begin deletionsallowed:=false;{367:}
if curcs<>0 then begin if(curinput.statefield=0)or(curinput.namefield<1)
or(curinput.namefield>17)then begin p:=getavail;
mem[p].hh.lh:=33554431+curcs;begintokenlist(p,3);end;curcmd:=10;
curchr:=32;end{:367};if scannerstatus>1 then{368:}begin runaway;
if curcs=0 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65933);end else begin curcs:=0;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65934);end;end;{369:}p:=getavail;
case scannerstatus of 2:begin print(65940);mem[p].hh.lh:=4194429;end;
3:begin print(65941);mem[p].hh.lh:=partoken;longstate:=116;end;
4:begin print(65942);mem[p].hh.lh:=4194429;q:=p;p:=getavail;
mem[p].hh.rh:=q;mem[p].hh.lh:=34749082;alignstate:=-1000000;end;
5:begin print(65943);mem[p].hh.lh:=4194429;end;end;
begintokenlist(p,5){:369};print(65935);sprintcs(warningindex);
begin helpptr:=4;helpline[3]:=65936;helpline[2]:=65937;
helpline[1]:=65938;helpline[0]:=65939;end;error;end{:368}
else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65927);end;printcmdchr(108,curif);print(65928);printint(skipline);
begin helpptr:=3;helpline[2]:=65929;helpline[1]:=65930;
helpline[0]:=65931;end;
if curcs<>0 then curcs:=0 else helpline[2]:=65932;curtok:=34749085;
inserror;end;deletionsallowed:=true;end;end;{:366}{370:}
procedure firmuptheline;forward;{:370}{371:}procedure getnext;
label 20,25,21,26,40,27,10;var k:0..bufsize;t:halfword;cat:0..15;
c:UnicodeScalar;lower:UTF16code;d:smallnumber;supcount:smallnumber;
begin 20:curcs:=0;if curinput.statefield<>0 then{373:}
begin 25:if curinput.locfield<=curinput.limitfield then begin curchr:=
buffer[curinput.locfield];incr(curinput.locfield);
if(curchr>=55296)and(curchr<56320)and(curinput.locfield<=curinput.
limitfield)and(buffer[curinput.locfield]>=56320)and(buffer[curinput.
locfield]<57344)then begin lower:=buffer[curinput.locfield]-56320;
incr(curinput.locfield);curchr:=65536+(curchr-55296)*1024+lower;end;
21:curcmd:=eqtb[1207592+curchr].hh.rh;{374:}
case curinput.statefield+curcmd of{375:}10,26,42,27,43{:375}:goto 25;
1,17,33:{384:}
begin if curinput.locfield>curinput.limitfield then curcs:=1179649 else
begin 26:k:=curinput.locfield;curchr:=buffer[k];
cat:=eqtb[1207592+curchr].hh.rh;incr(k);
if cat=11 then curinput.statefield:=17 else if cat=10 then curinput.
statefield:=17 else curinput.statefield:=1;
if(cat=11)and(k<=curinput.limitfield)then{386:}
begin repeat curchr:=buffer[k];cat:=eqtb[1207592+curchr].hh.rh;incr(k);
until(cat<>11)or(k>curinput.limitfield);{385:}
begin if(cat=7)and(buffer[k]=curchr)and(k<curinput.limitfield)then begin
supcount:=2;
while(supcount<6)and(k+2*supcount-2<=curinput.limitfield)and(buffer[k+
supcount-1]=curchr)do incr(supcount);
for d:=1 to supcount do if not(((buffer[k+supcount-2+d]>=48)and(buffer[k
+supcount-2+d]<=57))or((buffer[k+supcount-2+d]>=97)and(buffer[k+supcount
-2+d]<=102)))then begin c:=buffer[k+1];
if c<128 then begin if c<64 then buffer[k-1]:=c+64 else buffer[k-1]:=c
-64;d:=2;curinput.limitfield:=curinput.limitfield-d;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end else supcount:=0;end;if supcount>0 then begin curchr:=0;
for d:=1 to supcount do begin c:=buffer[k+supcount-2+d];
if c<=57 then curchr:=16*curchr+c-48 else curchr:=16*curchr+c-87;end;
if curchr>1114111 then curchr:=buffer[k]else begin buffer[k-1]:=curchr;
d:=2*supcount-1;curinput.limitfield:=curinput.limitfield-d;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end end end end{:385};if cat<>11 then decr(k);
if k>curinput.locfield+1 then begin curcs:=idlookup(curinput.locfield,k-
curinput.locfield);curinput.locfield:=k;goto 40;end;end{:386}else{385:}
begin if(cat=7)and(buffer[k]=curchr)and(k<curinput.limitfield)then begin
supcount:=2;
while(supcount<6)and(k+2*supcount-2<=curinput.limitfield)and(buffer[k+
supcount-1]=curchr)do incr(supcount);
for d:=1 to supcount do if not(((buffer[k+supcount-2+d]>=48)and(buffer[k
+supcount-2+d]<=57))or((buffer[k+supcount-2+d]>=97)and(buffer[k+supcount
-2+d]<=102)))then begin c:=buffer[k+1];
if c<128 then begin if c<64 then buffer[k-1]:=c+64 else buffer[k-1]:=c
-64;d:=2;curinput.limitfield:=curinput.limitfield-d;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end else supcount:=0;end;if supcount>0 then begin curchr:=0;
for d:=1 to supcount do begin c:=buffer[k+supcount-2+d];
if c<=57 then curchr:=16*curchr+c-48 else curchr:=16*curchr+c-87;end;
if curchr>1114111 then curchr:=buffer[k]else begin buffer[k-1]:=curchr;
d:=2*supcount-1;curinput.limitfield:=curinput.limitfield-d;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end end end end{:385};
if buffer[curinput.locfield]>65535 then begin curcs:=idlookup(curinput.
locfield,1);incr(curinput.locfield);goto 40;end;
curcs:=1114113+buffer[curinput.locfield];incr(curinput.locfield);end;
40:curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;
if curcmd>=116 then checkoutervalidity;end{:384};14,30,46:{383:}
begin curcs:=curchr+1;curcmd:=eqtb[curcs].hh.b0;
curchr:=eqtb[curcs].hh.rh;curinput.statefield:=1;
if curcmd>=116 then checkoutervalidity;end{:383};8,24,40:{382:}
begin if curchr=buffer[curinput.locfield]then if curinput.locfield<
curinput.limitfield then begin supcount:=2;
while(supcount<6)and(curinput.locfield+2*supcount-2<=curinput.limitfield
)and(curchr=buffer[curinput.locfield+supcount-1])do incr(supcount);
for d:=1 to supcount do if not(((buffer[curinput.locfield+supcount-2+d]
>=48)and(buffer[curinput.locfield+supcount-2+d]<=57))or((buffer[curinput
.locfield+supcount-2+d]>=97)and(buffer[curinput.locfield+supcount-2+d]<=
102)))then begin c:=buffer[curinput.locfield+1];
if c<128 then begin curinput.locfield:=curinput.locfield+2;
if c<64 then curchr:=c+64 else curchr:=c-64;goto 21;end;goto 27;end;
curchr:=0;
for d:=1 to supcount do begin c:=buffer[curinput.locfield+supcount-2+d];
if c<=57 then curchr:=16*curchr+c-48 else curchr:=16*curchr+c-87;end;
if curchr>1114111 then begin curchr:=buffer[curinput.locfield];goto 27;
end;curinput.locfield:=curinput.locfield+2*supcount-1;goto 21;end;
27:curinput.statefield:=1;end{:382};16,32,48:{376:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65944);end;begin helpptr:=2;helpline[1]:=65945;helpline[0]:=65946;
end;deletionsallowed:=false;error;deletionsallowed:=true;goto 20;
end{:376};{377:}11:{379:}begin curinput.statefield:=17;curchr:=32;
end{:379};6:{378:}begin curinput.locfield:=curinput.limitfield+1;
curcmd:=10;curchr:=32;end{:378};22,15,31,47:{380:}
begin curinput.locfield:=curinput.limitfield+1;goto 25;end{:380};
38:{381:}begin curinput.locfield:=curinput.limitfield+1;curcs:=parloc;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;
if curcmd>=116 then checkoutervalidity;end{:381};2:incr(alignstate);
18,34:begin curinput.statefield:=1;incr(alignstate);end;
3:decr(alignstate);19,35:begin curinput.statefield:=1;decr(alignstate);
end;20,21,23,25,28,29,36,37,39,41,44,45:curinput.statefield:=1;{:377}
others:end{:374};end else begin curinput.statefield:=33;{390:}
if curinput.namefield>17 then{392:}begin incr(line);
first:=curinput.startfield;
if not forceeof then if curinput.namefield<=19 then begin if pseudoinput
then firmuptheline else if(eqtb[1206305].hh.rh<>-268435455)and not
eofseen[curinput.indexfield]then begin curinput.limitfield:=first-1;
eofseen[curinput.indexfield]:=true;
begintokenlist(eqtb[1206305].hh.rh,16);goto 20;end else forceeof:=true;
end else begin if inputln(inputfile[curinput.indexfield],true)then
firmuptheline else if(eqtb[1206305].hh.rh<>-268435455)and not eofseen[
curinput.indexfield]then begin curinput.limitfield:=first-1;
eofseen[curinput.indexfield]:=true;
begintokenlist(eqtb[1206305].hh.rh,16);goto 20;end else forceeof:=true;
end;
if forceeof then begin if eqtb[7892329].int>0 then if(grpstack[inopen]<>
curboundary)or(ifstack[inopen]<>condptr)then filewarning;
if curinput.namefield>=19 then begin printchar(41);decr(openparens);
fflush(stdout);end;forceeof:=false;endfilereading;checkoutervalidity;
goto 20;end;
if(eqtb[7892312].int<0)or(eqtb[7892312].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[7892312].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end{:392}else begin if not(curinput.namefield=0)then begin curcmd:=0;
curchr:=0;goto 10;end;if inputptr>0 then begin endfilereading;goto 20;
end;if selector<18 then openlogfile;
if interaction>1 then begin if(eqtb[7892312].int<0)or(eqtb[7892312].int>
255)then incr(curinput.limitfield);
if curinput.limitfield=curinput.startfield then printnl(65948);println;
first:=curinput.startfield;begin;print(42);terminput;end;
curinput.limitfield:=last;
if(eqtb[7892312].int<0)or(eqtb[7892312].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[7892312].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end else fatalerror(65949);end{:390};
begin if interrupt<>0 then pauseforinstructions;end;goto 25;end;
end{:373}else{387:}
if curinput.locfield<>-268435455 then begin t:=mem[curinput.locfield].hh
.lh;curinput.locfield:=mem[curinput.locfield].hh.rh;
if t>=33554431 then begin curcs:=t-33554431;curcmd:=eqtb[curcs].hh.b0;
curchr:=eqtb[curcs].hh.rh;if curcmd>=116 then if curcmd=119 then{388:}
begin curcs:=mem[curinput.locfield].hh.lh-33554431;
curinput.locfield:=-268435455;curcmd:=eqtb[curcs].hh.b0;
curchr:=eqtb[curcs].hh.rh;if curcmd>103 then begin curcmd:=0;
curchr:=1114113;end;end{:388}
else begin if(curcs=1194658)and(curlist.modefield=0)then fatalerror(
65947);checkoutervalidity;end;end else begin curcmd:=t div 2097152;
curchr:=t mod 2097152;case curcmd of 1:incr(alignstate);
2:decr(alignstate);5:{389:}
begin begintokenlist(paramstack[curinput.limitfield+curchr-1],0);
goto 20;end{:389};others:end;end;end else begin endtokenlist;goto 20;
end{:387};{372:}
if curcmd<=5 then if curcmd>=4 then if alignstate=0 then{837:}
begin if(scannerstatus=4)or(curalign=-268435455)then fatalerror(65924);
curcmd:=mem[curalign+5].hh.lh;mem[curalign+5].hh.lh:=curchr;
if curcmd=63 then begintokenlist(memtop-10,2)else begintokenlist(mem[
curalign+2].int,2);alignstate:=1000000;goto 20;end{:837}{:372};10:end;
{:371}{393:}procedure firmuptheline;var k:0..bufsize;
begin curinput.limitfield:=last;
if eqtb[7892292].int>0 then if interaction>1 then begin;println;
if curinput.startfield<curinput.limitfield then for k:=curinput.
startfield to curinput.limitfield-1 do print(buffer[k]);
first:=curinput.limitfield;begin;print(65950);terminput;end;
if last>first then begin for k:=first to last-1 do buffer[k+curinput.
startfield-first]:=buffer[k];
curinput.limitfield:=curinput.startfield+last-first;end;end;end;{:393}
{395:}procedure gettoken;begin nonewcontrolsequence:=false;getnext;
nonewcontrolsequence:=true;
if curcs=0 then curtok:=(curcmd*2097152)+curchr else curtok:=33554431+
curcs;end;{:395}{396:}{423:}procedure macrocall;label 10,22,30,31,40;
var r:halfword;p:halfword;q:halfword;s:halfword;t:halfword;u,v:halfword;
rbraceptr:halfword;n:smallnumber;unbalance:halfword;m:halfword;
refcount:halfword;savescannerstatus:smallnumber;
savewarningindex:halfword;matchchr:UTF16code;
begin savescannerstatus:=scannerstatus;savewarningindex:=warningindex;
warningindex:=curcs;refcount:=curchr;r:=mem[refcount].hh.rh;n:=0;
if eqtb[7892294].int>0 then{435:}begin begindiagnostic;
if eqtb[7892322].int>0 then if inputptr<eqtb[7892322].int then begin v:=
inputptr;println;printchar(126);while v>0 do begin printchar(46);
decr(v);end;printcs(warningindex);tokenshow(refcount);
end else begin printchar(126);printchar(126);printcs(warningindex);
end else begin println;printcs(warningindex);tokenshow(refcount);end;
enddiagnostic(false);end{:435};
if mem[r].hh.lh=29360129 then r:=mem[r].hh.rh;
if mem[r].hh.lh<>29360128 then{425:}begin scannerstatus:=3;unbalance:=0;
longstate:=eqtb[curcs].hh.b0;
if longstate>=116 then longstate:=longstate-2;
repeat mem[memtop-3].hh.rh:=-268435455;
if(mem[r].hh.lh>=29360128)or(mem[r].hh.lh<27262976)then s:=-268435455
else begin matchchr:=mem[r].hh.lh-27262976;s:=mem[r].hh.rh;r:=s;
p:=memtop-3;m:=0;end;{426:}22:gettoken;if curtok=mem[r].hh.lh then{428:}
begin r:=mem[r].hh.rh;
if(mem[r].hh.lh>=27262976)and(mem[r].hh.lh<=29360128)then begin if
curtok<4194304 then decr(alignstate);goto 40;end else goto 22;end{:428};
{431:}if s<>r then if s=-268435455 then{432:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65983);end;sprintcs(warningindex);print(65984);begin helpptr:=4;
helpline[3]:=65985;helpline[2]:=65986;helpline[1]:=65987;
helpline[0]:=65988;end;error;goto 10;end{:432}else begin t:=s;
repeat begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=mem[t].hh.lh;
p:=q;end;incr(m);u:=mem[t].hh.rh;v:=s;
while true do begin if u=r then if curtok<>mem[v].hh.lh then goto 30
else begin r:=mem[v].hh.rh;goto 22;end;
if mem[u].hh.lh<>mem[v].hh.lh then goto 30;u:=mem[u].hh.rh;
v:=mem[v].hh.rh;end;30:t:=mem[t].hh.rh;until t=r;r:=s;end{:431};
if curtok=partoken then if longstate<>115 then{430:}
begin if longstate=114 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65978);end;sprintcs(warningindex);print(65979);begin helpptr:=3;
helpline[2]:=65980;helpline[1]:=65981;helpline[0]:=65982;end;backerror;
end;pstack[n]:=mem[memtop-3].hh.rh;alignstate:=alignstate-unbalance;
for m:=0 to n do flushlist(pstack[m]);goto 10;end{:430};
if curtok<6291456 then if curtok<4194304 then{433:}begin unbalance:=1;
while true do begin begin begin q:=avail;
if q=-268435455 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-268435455;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;gettoken;
if curtok=partoken then if longstate<>115 then{430:}
begin if longstate=114 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65978);end;sprintcs(warningindex);print(65979);begin helpptr:=3;
helpline[2]:=65980;helpline[1]:=65981;helpline[0]:=65982;end;backerror;
end;pstack[n]:=mem[memtop-3].hh.rh;alignstate:=alignstate-unbalance;
for m:=0 to n do flushlist(pstack[m]);goto 10;end{:430};
if curtok<6291456 then if curtok<4194304 then incr(unbalance)else begin
decr(unbalance);if unbalance=0 then goto 31;end;end;31:rbraceptr:=p;
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;
end{:433}else{429:}begin backinput;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65970);end;sprintcs(warningindex);print(65971);begin helpptr:=6;
helpline[5]:=65972;helpline[4]:=65973;helpline[3]:=65974;
helpline[2]:=65975;helpline[1]:=65976;helpline[0]:=65977;end;
incr(alignstate);longstate:=114;curtok:=partoken;inserror;goto 22;
end{:429}else{427:}
begin if curtok=20971552 then if mem[r].hh.lh<=29360128 then if mem[r].
hh.lh>=27262976 then goto 22;begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end{:427};incr(m);
if mem[r].hh.lh>29360128 then goto 22;
if mem[r].hh.lh<27262976 then goto 22;40:if s<>-268435455 then{434:}
begin if(m=1)and(mem[p].hh.lh<6291456)then begin mem[rbraceptr].hh.rh:=
-268435455;begin mem[p].hh.rh:=avail;avail:=p;
ifdef('STAT')decr(dynused);endif('STAT')end;p:=mem[memtop-3].hh.rh;
pstack[n]:=mem[p].hh.rh;begin mem[p].hh.rh:=avail;avail:=p;
ifdef('STAT')decr(dynused);endif('STAT')end;
end else pstack[n]:=mem[memtop-3].hh.rh;incr(n);
if eqtb[7892294].int>0 then if(eqtb[7892322].int=0)or(inputptr<eqtb[
7892322].int)then begin begindiagnostic;printnl(matchchr);printint(n);
print(65989);showtokenlist(pstack[n-1],-268435455,1000);
enddiagnostic(false);end;end{:434}{:426};until mem[r].hh.lh=29360128;
end{:425};{424:}
while(curinput.locfield=-268435455)and(curinput.indexfield<>2)and(
curinput.indexfield<>7)do endtokenlist;begintokenlist(refcount,6);
curinput.namefield:=warningindex;curinput.locfield:=mem[r].hh.rh;
if n>0 then begin if paramptr+n>maxparamstack then begin maxparamstack:=
paramptr+n;if maxparamstack>paramsize then overflow(65969,paramsize);
end;for m:=0 to n-1 do paramstack[paramptr+m]:=pstack[m];
paramptr:=paramptr+n;end{:424};10:scannerstatus:=savescannerstatus;
warningindex:=savewarningindex;end;{:423}{413:}procedure insertrelax;
begin curtok:=33554431+curcs;backinput;curtok:=34749088;backinput;
curinput.indexfield:=5;end;{:413}{1563:}procedure pseudostart;forward;
{:1563}{1621:}procedure scanregisternum;forward;{:1621}{1626:}
procedure newindex(i:quarterword;q:halfword);var k:smallnumber;
begin curptr:=getnode(33);mem[curptr].hh.b0:=i;mem[curptr].hh.b1:=0;
mem[curptr].hh.rh:=q;for k:=1 to 32 do mem[curptr+k]:=sanull;end;{:1626}
{1630:}procedure findsaelement(t:smallnumber;n:halfword;w:boolean);
label 45,46,47,48,49,10;var q:halfword;i:smallnumber;
begin curptr:=saroot[t];
begin if curptr=-268435455 then if w then goto 45 else goto 10;end;
q:=curptr;i:=n div 262144;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-268435455 then if w then goto 46 else goto 10;end;
q:=curptr;i:=(n div 4096)mod 64;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-268435455 then if w then goto 47 else goto 10;end;
q:=curptr;i:=(n div 64)mod 64;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-268435455 then if w then goto 48 else goto 10;end;
q:=curptr;i:=n mod 64;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;if(curptr=-268435455)and w then goto 49;goto 10;
45:newindex(t,-268435455);saroot[t]:=curptr;q:=curptr;i:=n div 262144;
46:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;
i:=(n div 4096)mod 64;47:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;i:=(n div 64)mod 64;
48:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;i:=n mod 64;
49:{1631:}if t=7 then begin curptr:=getnode(4);mem[curptr+1]:=sanull;
mem[curptr+2]:=sanull;mem[curptr+3]:=sanull;
end else begin if t<=1 then begin curptr:=getnode(3);
mem[curptr+2].int:=0;mem[curptr+1].hh.rh:=n;
end else begin curptr:=getnode(2);
if t<=3 then begin mem[curptr+1].hh.rh:=membot;incr(mem[membot].hh.rh);
end else mem[curptr+1].hh.rh:=-268435455;end;
mem[curptr+1].hh.lh:=-268435455;end;mem[curptr].hh.b0:=64*t+i;
mem[curptr].hh.b1:=1{:1631};mem[curptr].hh.rh:=q;
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;10:end;{:1630}
procedure passtext;forward;procedure startinput;forward;
procedure conditional;forward;procedure getxtoken;forward;
procedure convtoks;forward;procedure insthetoks;forward;
procedure expand;label 21;var t:halfword;b:boolean;p,q,r:halfword;
j:0..bufsize;cvbackup:integer;
cvlbackup,radixbackup,cobackup:smallnumber;backupbackup:halfword;
savescannerstatus:smallnumber;begin incr(expanddepthcount);
if expanddepthcount>=expanddepth then overflow(65951,expanddepth);
cvbackup:=curval;cvlbackup:=curvallevel;radixbackup:=radix;
cobackup:=curorder;backupbackup:=mem[memtop-13].hh.rh;
21:if curcmd<114 then{399:}
begin if eqtb[7892300].int>1 then showcurcmdchr;
case curcmd of 113:{420:}begin t:=curchr mod 5;
if curchr>=5 then scanregisternum else curval:=0;
if curval=0 then curptr:=curmark[t]else{1635:}
begin findsaelement(7,curval,false);
if curptr<>-268435455 then if odd(t)then curptr:=mem[curptr+(t div 2)+1]
.hh.rh else curptr:=mem[curptr+(t div 2)+1].hh.lh;end{:1635};
if curptr<>-268435455 then begintokenlist(curptr,15);end{:420};
105:if curchr=0 then{400:}begin gettoken;t:=curtok;gettoken;
if curcmd>103 then expand else backinput;curtok:=t;backinput;end{:400}
else{1576:}begin gettoken;
if(curcmd=108)and(curchr<>16)then begin curchr:=curchr+32;goto 21;end;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66034);end;printesc(66164);print(66940);
printcmdchr(curcmd,curchr);printchar(39);begin helpptr:=1;
helpline[0]:=65946;end;backerror;end{:1576};106:if curchr=0 then{401:}
begin savescannerstatus:=scannerstatus;scannerstatus:=0;gettoken;
scannerstatus:=savescannerstatus;t:=curtok;backinput;
if(t>=33554431)and(t<>34749089)then begin p:=getavail;
mem[p].hh.lh:=34749090;mem[p].hh.rh:=curinput.locfield;
curinput.startfield:=p;curinput.locfield:=p;end;end{:401}else{402:}
begin savescannerstatus:=scannerstatus;scannerstatus:=0;gettoken;
scannerstatus:=savescannerstatus;
if curcs<1179650 then curcs:=primlookup(curcs-1114113)else curcs:=
primlookup(hash[curcs].rh);
if curcs<>0 then begin t:=eqtb[1194662+curcs].hh.b0;
if t>103 then begin curcmd:=t;curchr:=eqtb[1194662+curcs].hh.rh;
curtok:=(curcmd*2097152)+curchr;curcs:=0;goto 21;
end else begin backinput;p:=getavail;mem[p].hh.lh:=34749092;
mem[p].hh.rh:=curinput.locfield;curinput.locfield:=p;
curinput.startfield:=p;end;end;end{:402};110:{406:}begin r:=getavail;
p:=r;b:=isincsname;isincsname:=true;repeat getxtoken;
if curcs=0 then begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;
p:=q;end;until curcs<>0;if curcmd<>67 then{407:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65958);end;printesc(65818);print(65959);begin helpptr:=2;
helpline[1]:=65960;helpline[0]:=65961;end;backerror;end{:407};
isincsname:=b;{408:}j:=first;p:=mem[r].hh.rh;
while p<>-268435455 do begin if j>=maxbufstack then begin maxbufstack:=j
+1;if maxbufstack=bufsize then overflow(65538,bufsize);end;
buffer[j]:=mem[p].hh.lh mod 2097152;incr(j);p:=mem[p].hh.rh;end;
if(j>first+1)or(buffer[first]>65535)then begin nonewcontrolsequence:=
false;curcs:=idlookup(first,j-first);nonewcontrolsequence:=true;
end else if j=first then curcs:=1179649 else curcs:=1114113+buffer[first
]{:408};flushlist(r);
if eqtb[curcs].hh.b0=104 then begin eqdefine(curcs,0,1114112);end;
curtok:=curcs+33554431;backinput;end{:406};111:convtoks;112:insthetoks;
108:conditional;109:{545:}
begin if eqtb[7892327].int>0 then if eqtb[7892300].int<=1 then
showcurcmdchr;
if curchr>iflimit then if iflimit=1 then insertrelax else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66168);end;printcmdchr(109,curchr);begin helpptr:=1;
helpline[0]:=66169;end;error;end else begin while curchr<>2 do passtext;
{531:}begin if ifstack[inopen]=condptr then ifwarning;p:=condptr;
ifline:=mem[p+1].int;curif:=mem[p].hh.b1;iflimit:=mem[p].hh.b0;
condptr:=mem[p].hh.rh;freenode(p,2);end{:531};end;end{:545};107:{412:}
if curchr=1 then forceeof:=true{1560:}
else if curchr=2 then pseudostart{:1560}
else if nameinprogress then insertrelax else startinput{:412};
others:{404:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65952);end;begin helpptr:=5;helpline[4]:=65953;helpline[3]:=65954;
helpline[2]:=65955;helpline[1]:=65956;helpline[0]:=65957;end;error;
end{:404}end;end{:399}else if curcmd<118 then macrocall else{409:}
begin curtok:=34749087;backinput;end{:409};curval:=cvbackup;
curvallevel:=cvlbackup;radix:=radixbackup;curorder:=cobackup;
mem[memtop-13].hh.rh:=backupbackup;decr(expanddepthcount);end;{:396}
{414:}procedure getxtoken;label 20,30;begin 20:getnext;
if curcmd<=103 then goto 30;
if curcmd>=114 then if curcmd<118 then macrocall else begin curcs:=
1194656;curcmd:=9;goto 30;end else expand;goto 20;
30:if curcs=0 then curtok:=(curcmd*2097152)+curchr else curtok:=
33554431+curcs;end;{:414}{415:}procedure xtoken;
begin while curcmd>103 do begin expand;getnext;end;
if curcs=0 then curtok:=(curcmd*2097152)+curchr else curtok:=33554431+
curcs;end;{:415}{437:}procedure scanleftbrace;begin{438:}
repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:438};
if curcmd<>1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65990);end;begin helpptr:=4;helpline[3]:=65991;helpline[2]:=65992;
helpline[1]:=65993;helpline[0]:=65994;end;backerror;curtok:=2097275;
curcmd:=1;curchr:=123;incr(alignstate);end;end;{:437}{439:}
procedure scanoptionalequals;begin{440:}repeat getxtoken;
until curcmd<>10{:440};if curtok<>25165885 then backinput;end;{:439}
{441:}function scankeyword(s:strnumber):boolean;label 10;var p:halfword;
q:halfword;k:poolpointer;savecurcs:halfword;begin p:=memtop-13;
mem[p].hh.rh:=-268435455;
if s<65536 then begin while true do begin getxtoken;
if(curcs=0)and((curchr=s)or(curchr=s-32))then begin begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;
flushlist(mem[memtop-13].hh.rh);scankeyword:=true;goto 10;
end else if(curcmd<>10)or(p<>memtop-13)then begin backinput;
if p<>memtop-13 then begintokenlist(mem[memtop-13].hh.rh,3);
scankeyword:=false;goto 10;end;end;end;k:=strstart[(s)-65536];
savecurcs:=curcs;while k<strstart[(s+1)-65536]do begin getxtoken;
if(curcs=0)and((curchr=strpool[k])or(curchr=strpool[k]-32))then begin
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;incr(k);
end else if(curcmd<>10)or(p<>memtop-13)then begin backinput;
if p<>memtop-13 then begintokenlist(mem[memtop-13].hh.rh,3);
curcs:=savecurcs;scankeyword:=false;goto 10;end;end;
flushlist(mem[memtop-13].hh.rh);scankeyword:=true;10:end;{:441}{442:}
procedure muerror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65995);end;begin helpptr:=1;helpline[0]:=65996;end;error;end;
{:442}{443:}procedure scanint;forward;{467:}
procedure scanglyphnumber(f:internalfontnumber);
begin if scankeyword(47)then begin scanandpackname;
begin curval:=mapglyphtoindex(f);curvallevel:=0;end;
end else if scankeyword(117)then begin scancharnum;
begin curval:=mapchartoglyph(f,curval);curvallevel:=0;end;
end else scanint;end;procedure scancharclass;begin scanint;
if(curval<0)or(curval>4096)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66036);end;begin helpptr:=2;helpline[1]:=66037;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;
procedure scancharclassnotignored;begin scanint;
if(curval<0)or(curval>4096)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66036);end;begin helpptr:=2;helpline[1]:=66038;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;procedure scaneightbitint;
begin scanint;
if(curval<0)or(curval>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66039);end;begin helpptr:=2;helpline[1]:=66040;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;{:467}{468:}procedure scanusvnum;
begin scanint;
if(curval<0)or(curval>1114111)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66041);end;begin helpptr:=2;helpline[1]:=66042;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;procedure scancharnum;
begin scanint;
if(curval<0)or(curval>65535)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66041);end;begin helpptr:=2;helpline[1]:=66043;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;{:468}{469:}
procedure scanxetexmathcharint;begin scanint;
if mathcharfield(curval)=2097151 then begin if curval<>2097151 then
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66044);end;begin helpptr:=2;helpline[1]:=66045;helpline[0]:=66046;
end;interror(curval);curval:=2097151;
end end else if mathcharfield(curval)>1114111 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66047);end;begin helpptr:=2;helpline[1]:=66048;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;procedure scanmathclassint;
begin scanint;
if(curval<0)or(curval>7)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66049);end;begin helpptr:=2;helpline[1]:=66050;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;procedure scanmathfamint;
begin scanint;
if(curval<0)or(curval>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66051);end;begin helpptr:=2;helpline[1]:=66052;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;procedure scanfourbitint;
begin scanint;
if(curval<0)or(curval>15)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66053);end;begin helpptr:=2;helpline[1]:=66054;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;{:469}{470:}
procedure scanfifteenbitint;begin scanint;
if(curval<0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66055);end;begin helpptr:=2;helpline[1]:=66056;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;{:470}{471:}
procedure scandelimiterint;begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66057);end;begin helpptr:=2;helpline[1]:=66058;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;{:471}{1622:}
procedure scanregisternum;begin scanint;
if(curval<0)or(curval>maxregnum)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66039);end;begin helpptr:=2;helpline[1]:=maxreghelpline;
helpline[0]:=66005;end;interror(curval);curval:=0;end;end;{:1622}{1684:}
procedure scanfourbitintor18;begin scanint;
if(curval<0)or((curval>15)and(curval<>18))then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66053);end;begin helpptr:=2;helpline[1]:=66054;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;{:1684}{1492:}
procedure scangeneraltext;forward;{:1492}{1583:}
procedure getxorprotected;label 10;begin while true do begin gettoken;
if curcmd<=103 then goto 10;
if(curcmd>=114)and(curcmd<118)then if mem[mem[curchr].hh.rh].hh.lh=
29360129 then goto 10;expand;end;10:end;{:1583}{1592:}
procedure scanexpr;forward;{:1592}{1597:}procedure scannormalglue;
forward;procedure scanmuglue;forward;{:1597}{1693:}
function effectivechar(errp:boolean;f:internalfontnumber;
c:quarterword):integer;label 40;var basec:integer;result:integer;
begin if(not xtxligaturepresent)and(fontmapping[f]<>nil)then c:=
applytfmfontmapping(fontmapping[f],c);xtxligaturepresent:=false;
result:=c;if not mltexenabledp then goto 40;
if fontec[f]>=c then if fontbc[f]<=c then if(fontinfo[charbase[f]+c].
qqqq.b0>0)then goto 40;
if c>=eqtb[7892319].int then if c<=eqtb[7892320].int then if(eqtb[
6778152+c].hh.rh>0)then begin basec:=(eqtb[6778152+c].hh.rh mod 256);
result:=basec;if not errp then goto 40;
if fontec[f]>=basec then if fontbc[f]<=basec then if(fontinfo[charbase[f
]+basec].qqqq.b0>0)then goto 40;end;if errp then begin begindiagnostic;
printnl(66224);print(66974);print(c);print(66225);print(fontname[f]);
printchar(33);enddiagnostic(false);result:=fontbc[f];end;
40:effectivechar:=result;end;{:1693}{612:}procedure scanfontident;
var f:internalfontnumber;m:halfword;begin{440:}repeat getxtoken;
until curcmd<>10{:440};
if curcmd=90 then f:=eqtb[1206823].hh.rh else if curcmd=89 then f:=
curchr else if curcmd=88 then begin m:=curchr;scanmathfamint;
f:=eqtb[m+curval].hh.rh;end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66215);end;begin helpptr:=2;helpline[1]:=66216;helpline[0]:=66217;
end;backerror;f:=0;end;curval:=f;end;{:612}{613:}
procedure findfontdimen(writing:boolean);var f:internalfontnumber;
n:integer;begin scanint;n:=curval;scanfontident;f:=curval;
if n<=0 then curval:=fmemptr else begin if writing and(n<=4)and(n>=2)and
(fontglue[f]<>-268435455)then begin deleteglueref(fontglue[f]);
fontglue[f]:=-268435455;end;
if n>fontparams[f]then if f<fontptr then curval:=fmemptr else{615:}
begin repeat if fmemptr=fontmemsize then overflow(66222,fontmemsize);
fontinfo[fmemptr].int:=0;incr(fmemptr);incr(fontparams[f]);
until n=fontparams[f];curval:=fmemptr-1;end{:615}
else curval:=n+parambase[f];end;{614:}
if curval=fmemptr then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66199);end;printesc(hash[1196762+f].rh);print(66218);
printint(fontparams[f]);print(66219);begin helpptr:=2;
helpline[1]:=66220;helpline[0]:=66221;end;error;end{:614};end;{:613}
{:443}{447:}procedure scansomethinginternal(level:smallnumber;
negative:boolean);label 10,20;var m:halfword;n,k,kk:integer;
q,r:halfword;tx:halfword;i:fourquarters;p:0..nestsize;
begin 20:m:=curchr;case curcmd of 86:{448:}begin scanusvnum;
if m=5664040 then begin curval1:=eqtb[5664040+curval].hh.rh;
if mathcharfield(curval1)=2097151 then curval1:=32768 else if(
mathclassfield(curval1)>7)or(mathfamfield(curval1)>15)or(mathcharfield(
curval1)>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66003);end;begin helpptr:=2;helpline[1]:=66004;helpline[0]:=66005;
end;interror(curval1);curval1:=0;end;
curval1:=(mathclassfield(curval1)*4096)+(mathfamfield(curval1)*256)+
mathcharfield(curval1);begin curval:=curval1;curvallevel:=0;
end end else if m=7892608 then begin curval1:=eqtb[7892608+curval].int;
if curval1>=1073741824 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66006);end;begin helpptr:=2;helpline[1]:=66007;helpline[0]:=66005;
end;error;begin curval:=0;curvallevel:=0;end;
end else begin begin curval:=curval1;curvallevel:=0;end;
end end else if m<4549928 then begin curval:=eqtb[m+curval].hh.rh;
curvallevel:=0;
end else if m<5664040 then begin curval:=eqtb[m+curval].hh.rh mod 65536;
curvallevel:=0;end else begin curval:=eqtb[m+curval].int;curvallevel:=0;
end;end{:448};87:begin scanusvnum;
if m=4549928 then begin begin curval:=eqtb[4549928+curval].hh.rh div
65536;curvallevel:=0;
end end else if m=5664040 then begin begin curval:=eqtb[5664040+curval].
hh.rh;curvallevel:=0;
end end else if m=5664041 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65997);end;begin helpptr:=2;helpline[1]:=65998;helpline[0]:=65999;
end;error;begin curval:=0;curvallevel:=0;
end end else if m=7892608 then begin begin curval:=eqtb[7892608+curval].
int;curvallevel:=0;end end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66000);end;begin helpptr:=2;helpline[1]:=66001;helpline[0]:=66002;
end;error;begin curval:=0;curvallevel:=0;end;end;end;
72,73,88,89,90:{449:}if level<>5 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66008);end;begin helpptr:=3;helpline[2]:=66009;helpline[1]:=66010;
helpline[0]:=66011;end;backerror;begin curval:=0;curvallevel:=1;end;
end else if curcmd<=73 then begin if curcmd<73 then if m=membot then
begin scanregisternum;
if curval<256 then curval:=eqtb[1206307+curval].hh.rh else begin
findsaelement(5,curval,false);
if curptr=-268435455 then curval:=-268435455 else curval:=mem[curptr+1].
hh.rh;end;
end else curval:=mem[m+1].hh.rh else if curchr=1206306 then begin
scancharclassnotignored;curptr:=curval;scancharclassnotignored;
findsaelement(6,curptr*4096+curval,false);
if curptr=-268435455 then curval:=-268435455 else curval:=mem[curptr+1].
hh.rh;end else curval:=eqtb[m].hh.rh;curvallevel:=5;
end else begin backinput;scanfontident;begin curval:=1196762+curval;
curvallevel:=4;end;end{:449};74:begin curval:=eqtb[m].int;
curvallevel:=0;end;75:begin curval:=eqtb[m].int;curvallevel:=1;end;
76:begin curval:=eqtb[m].hh.rh;curvallevel:=2;end;
77:begin curval:=eqtb[m].hh.rh;curvallevel:=3;end;80:{452:}
if abs(curlist.modefield)<>m then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66029);end;printcmdchr(80,m);begin helpptr:=4;helpline[3]:=66030;
helpline[2]:=66031;helpline[1]:=66032;helpline[0]:=66033;end;error;
if level<>5 then begin curval:=0;curvallevel:=1;
end else begin curval:=0;curvallevel:=0;end;
end else if m=1 then begin curval:=curlist.auxfield.int;curvallevel:=1;
end else begin curval:=curlist.auxfield.hh.lh;curvallevel:=0;end{:452};
81:{456:}if curlist.modefield=0 then begin curval:=0;curvallevel:=0;
end else begin nest[nestptr]:=curlist;p:=nestptr;
while abs(nest[p].modefield)<>1 do decr(p);
begin curval:=nest[p].pgfield;curvallevel:=0;end;end{:456};83:{453:}
begin if m=0 then curval:=deadcycles{1504:}
else if m=2 then curval:=interaction{:1504}else curval:=insertpenalties;
curvallevel:=0;end{:453};82:{455:}
begin if(pagecontents=0)and(not outputactive)then if m=0 then curval:=
1073741823 else curval:=0 else curval:=pagesofar[m];curvallevel:=1;
end{:455};85:{457:}begin if m>1206295 then{1677:}begin scanint;
if(eqtb[m].hh.rh=-268435455)or(curval<0)then curval:=0 else begin if
curval>mem[eqtb[m].hh.rh+1].int then curval:=mem[eqtb[m].hh.rh+1].int;
curval:=mem[eqtb[m].hh.rh+curval+1].int;end;end{:1677}
else if eqtb[1206295].hh.rh=-268435455 then curval:=0 else curval:=mem[
eqtb[1206295].hh.rh].hh.lh;curvallevel:=0;end{:457};84:{454:}
begin scanregisternum;
if curval<256 then q:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then q:=-268435455 else q:=mem[curptr+1].hh.rh;end;
if q=-268435455 then curval:=0 else curval:=mem[q+m].int;curvallevel:=1;
end{:454};68,69,70:begin curval:=curchr;curvallevel:=0;end;78:{459:}
begin findfontdimen(false);fontinfo[fmemptr].int:=0;
begin curval:=fontinfo[curval].int;curvallevel:=1;end;end{:459};
79:{460:}begin scanfontident;
if m=0 then begin curval:=hyphenchar[curval];curvallevel:=0;
end else if m=1 then begin curval:=skewchar[curval];curvallevel:=0;
end else begin n:=curval;
if((fontarea[n]=65535)or(fontarea[n]=65534))then scanglyphnumber(n)else
scancharnum;k:=curval;case m of 2:begin curval:=getcpcode(n,k,0);
curvallevel:=0;end;3:begin curval:=getcpcode(n,k,1);curvallevel:=0;end;
end;end;end{:460};91:{461:}
begin if(m<membot)or(m>membot+19)then begin curvallevel:=(mem[m].hh.b0
div 64);
if curvallevel<2 then curval:=mem[m+2].int else curval:=mem[m+1].hh.rh;
end else begin scanregisternum;curvallevel:=m-membot;
if curval>255 then begin findsaelement(curvallevel,curval,false);
if curptr=-268435455 then if curvallevel<2 then curval:=0 else curval:=
membot else if curvallevel<2 then curval:=mem[curptr+2].int else curval
:=mem[curptr+1].hh.rh;
end else case curvallevel of 0:curval:=eqtb[7892352+curval].int;
1:curval:=eqtb[9006743+curval].int;2:curval:=eqtb[1205783+curval].hh.rh;
3:curval:=eqtb[1206039+curval].hh.rh;end;end;end{:461};71:{458:}
if m>=4 then if m>=65 then{1591:}
begin if m<66 then begin case m of{1618:}65:scanmuglue;{:1618}end;
curvallevel:=2;end else if m<67 then begin case m of{1619:}
66:scannormalglue;{:1619}end;curvallevel:=3;
end else begin curvallevel:=m-67;scanexpr;end;
while curvallevel>level do begin if curvallevel=2 then begin m:=curval;
curval:=mem[m+1].int;deleteglueref(m);
end else if curvallevel=3 then muerror;decr(curvallevel);end;
if negative then if curvallevel>=2 then begin m:=curval;
curval:=newspec(m);deleteglueref(m);{465:}
begin mem[curval+1].int:=-mem[curval+1].int;
mem[curval+2].int:=-mem[curval+2].int;
mem[curval+3].int:=-mem[curval+3].int;end{:465};
end else curval:=-curval;goto 10;end{:1591}
else if m>=55 then begin case m of{1458:}
55:begin if((fontarea[eqtb[1206823].hh.rh]=65535)or(fontarea[eqtb[
1206823].hh.rh]=65534))then begin scanint;n:=curval;
if(n<1)or(n>4)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66858);end;printnl(66859);printint(n);error;curval:=0;
end else begin scanint;
curval:=getglyphbounds(eqtb[1206823].hh.rh,n,curval);
end end else begin notnativefonterror(71,m,eqtb[1206823].hh.rh);
curval:=0 end end;{:1458}{1481:}56,57,58,59:begin scanfontident;
q:=curval;scanusvnum;
if((fontarea[q]=65535)or(fontarea[q]=65534))then begin case m of 56:
curval:=getnativecharwd(q,curval);57:curval:=getnativecharht(q,curval);
58:curval:=getnativechardp(q,curval);
59:curval:=getnativecharic(q,curval);end;
end else begin if(fontbc[q]<=curval)and(fontec[q]>=curval)then begin i:=
fontinfo[charbase[q]+effectivechar(true,q,curval)].qqqq;
case m of 56:curval:=fontinfo[widthbase[q]+i.b0].int;
57:curval:=fontinfo[heightbase[q]+(i.b1)div 16].int;
58:curval:=fontinfo[depthbase[q]+(i.b1)mod 16].int;
59:curval:=fontinfo[italicbase[q]+(i.b2)div 4].int;end;
end else curval:=0;end end;{:1481}{1484:}60,61,62:begin q:=curchr-60;
scanint;
if(eqtb[1206295].hh.rh=-268435455)or(curval<=0)then curval:=0 else begin
if q=2 then begin q:=curval mod 2;curval:=(curval+q)div 2;end;
if curval>mem[eqtb[1206295].hh.rh].hh.lh then curval:=mem[eqtb[1206295].
hh.rh].hh.lh;curval:=mem[eqtb[1206295].hh.rh+2*curval-q].int;end;
curvallevel:=1;end;{:1484}{1615:}63,64:begin scannormalglue;q:=curval;
if m=63 then curval:=mem[q+2].int else curval:=mem[q+3].int;
deleteglueref(q);end;{:1615}end;curvallevel:=1;
end else begin case m of 4:curval:=line;5:curval:=lastbadness;
16:curval:=getmicrointerval;18:curval:=randomseed;
17:begin if shellenabledp then begin if restrictedshell then curval:=2
else curval:=1;end else curval:=0;end;{1454:}19:curval:=2;27:curval:=0;
28:begin scanfontident;n:=curval;
if(fontarea[n]=65535)then curval:=aatfontget(m-27,fontlayoutengine[n])
else if(fontarea[n]=65534)then curval:=otfontget(m-27,fontlayoutengine[n
])else curval:=0;end;35:begin scanfontident;n:=curval;
if(fontarea[n]=65535)then curval:=aatfontget(m-27,fontlayoutengine[n])
else if((fontarea[n]=65534)and(usingGraphite(fontlayoutengine[n])))then
curval:=otfontget(m-27,fontlayoutengine[n])else curval:=0;end;
30,32,33,34,29:begin scanfontident;n:=curval;curval:=0;end;
36,38,39:begin scanfontident;n:=curval;
if(fontarea[n]=65535)then begin scanint;k:=curval;
curval:=aatfontget1(m-27,fontlayoutengine[n],k);
end else if((fontarea[n]=65534)and(usingGraphite(fontlayoutengine[n])))
then begin scanint;k:=curval;
curval:=otfontget1(m-27,fontlayoutengine[n],k);
end else begin notaatgrfonterror(71,m,n);curval:=-1;end;end;
40,42:begin scanfontident;n:=curval;
if(fontarea[n]=65535)then begin scanint;k:=curval;scanint;
curval:=aatfontget2(m-27,fontlayoutengine[n],k,curval);
end else if((fontarea[n]=65534)and(usingGraphite(fontlayoutengine[n])))
then begin scanint;k:=curval;scanint;
curval:=otfontget2(m-27,fontlayoutengine[n],k,curval);
end else begin notaatgrfonterror(71,m,n);curval:=-1;end;end;
31:begin scanfontident;n:=curval;
if(fontarea[n]=65535)then begin scanandpackname;
curval:=aatfontgetnamed(m-27,fontlayoutengine[n]);
end else begin notaatfonterror(71,m,n);curval:=-1;end;end;
37:begin scanfontident;n:=curval;
if(fontarea[n]=65535)then begin scanandpackname;
curval:=aatfontgetnamed(m-27,fontlayoutengine[n]);
end else if((fontarea[n]=65534)and(usingGraphite(fontlayoutengine[n])))
then begin scanandpackname;
curval:=grfontgetnamed(m-27,fontlayoutengine[n]);
end else begin notaatgrfonterror(71,m,n);curval:=-1;end;end;
41:begin scanfontident;n:=curval;
if(fontarea[n]=65535)then begin scanint;k:=curval;scanandpackname;
curval:=aatfontgetnamed1(m-27,fontlayoutengine[n],k);
end else if((fontarea[n]=65534)and(usingGraphite(fontlayoutengine[n])))
then begin scanint;k:=curval;scanandpackname;
curval:=grfontgetnamed1(m-27,fontlayoutengine[n],k);
end else begin notaatgrfonterror(71,m,n);curval:=-1;end;end;
43:begin scanfontident;n:=curval;
if((fontarea[n]=65534)and(usingOpenType(fontlayoutengine[n])))then
curval:=otfontget(m-27,fontlayoutengine[n])else begin curval:=0;end;end;
44,46:begin scanfontident;n:=curval;
if((fontarea[n]=65534)and(usingOpenType(fontlayoutengine[n])))then begin
scanint;curval:=otfontget1(m-27,fontlayoutengine[n],curval);
end else begin nototfonterror(71,m,n);curval:=-1;end;end;
45,47:begin scanfontident;n:=curval;
if((fontarea[n]=65534)and(usingOpenType(fontlayoutengine[n])))then begin
scanint;k:=curval;scanint;
curval:=otfontget2(m-27,fontlayoutengine[n],k,curval);
end else begin nototfonterror(71,m,n);curval:=-1;end;end;
48:begin scanfontident;n:=curval;
if((fontarea[n]=65534)and(usingOpenType(fontlayoutengine[n])))then begin
scanint;k:=curval;scanint;kk:=curval;scanint;
curval:=otfontget3(m-27,fontlayoutengine[n],k,kk,curval);
end else begin nototfonterror(71,m,n);curval:=-1;end;end;
49:begin if((fontarea[eqtb[1206823].hh.rh]=65535)or(fontarea[eqtb[
1206823].hh.rh]=65534))then begin scanint;n:=curval;
curval:=mapchartoglyph(eqtb[1206823].hh.rh,n)end else begin
notnativefonterror(71,m,eqtb[1206823].hh.rh);curval:=0 end end;
50:begin if((fontarea[eqtb[1206823].hh.rh]=65535)or(fontarea[eqtb[
1206823].hh.rh]=65534))then begin scanandpackname;
curval:=mapglyphtoindex(eqtb[1206823].hh.rh)end else begin
notnativefonterror(71,m,eqtb[1206823].hh.rh);curval:=0 end end;
51:begin scanfontident;n:=curval;
if(fontarea[n]=65535)then curval:=1 else if((fontarea[n]=65534)and(
usingOpenType(fontlayoutengine[n])))then curval:=2 else if((fontarea[n]=
65534)and(usingGraphite(fontlayoutengine[n])))then curval:=3 else curval
:=0;end;52,53:begin scanfontident;n:=curval;
if((fontarea[n]=65535)or(fontarea[n]=65534))then curval:=
getfontcharrange(n,m=52)else begin if m=52 then curval:=fontbc[n]else
curval:=fontec[n];end end;12:curval:=pdflastxpos;13:curval:=pdflastypos;
54:begin scanandpackname;curval:=countpdffilepages;end;{:1454}{1475:}
20:curval:=curlevel-1;21:curval:=curgroup;{:1475}{1478:}
22:begin q:=condptr;curval:=0;while q<>-268435455 do begin incr(curval);
q:=mem[q].hh.rh;end;end;
23:if condptr=-268435455 then curval:=0 else if curif<32 then curval:=
curif+1 else curval:=-(curif-31);
24:if(iflimit=4)or(iflimit=3)then curval:=1 else if iflimit=2 then
curval:=-1 else curval:=0;{:1478}{1614:}25,26:begin scannormalglue;
q:=curval;if m=25 then curval:=mem[q].hh.b0 else curval:=mem[q].hh.b1;
deleteglueref(q);end;{:1614}end;curvallevel:=0;
end else begin if curchr=2 then curval:=membot else curval:=0;
tx:=curlist.tailfield;
if not(tx>=himemmin)then if(mem[tx].hh.b0=9)and(mem[tx].hh.b1=3)then
begin r:=curlist.headfield;repeat q:=r;r:=mem[q].hh.rh;until r=tx;tx:=q;
end;if curchr=3 then begin curvallevel:=0;
if(tx=curlist.headfield)or(curlist.modefield=0)then curval:=-1;
end else curvallevel:=curchr;
if not(tx>=himemmin)and(curlist.modefield<>0)then case curchr of 0:if
mem[tx].hh.b0=12 then curval:=mem[tx+1].int;
1:if mem[tx].hh.b0=11 then curval:=mem[tx+1].int;
2:if mem[tx].hh.b0=10 then begin curval:=mem[tx+1].hh.lh;
if mem[tx].hh.b1=99 then curvallevel:=3;end;
3:if mem[tx].hh.b0<=13 then curval:=mem[tx].hh.b0+1 else curval:=15;
end else if(curlist.modefield=1)and(tx=curlist.headfield)then case
curchr of 0:curval:=lastpenalty;1:curval:=lastkern;
2:if lastglue<>1073741823 then curval:=lastglue;3:curval:=lastnodetype;
end;end{:458};39:if curchr=1 then{403:}begin gettoken;
if curcs<1179650 then curcs:=primlookup(curcs-1114113)else curcs:=
primlookup(hash[curcs].rh);
if curcs<>0 then begin curcmd:=eqtb[1194662+curcs].hh.b0;
curchr:=eqtb[1194662+curcs].hh.rh;curcs:=1194662+curcs;
curtok:=33554431+curcs;end else begin curcmd:=0;curchr:=0;
curtok:=34749088;curcs:=1194657;end;goto 20;end{:403};others:{462:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66034);end;printcmdchr(curcmd,curchr);print(66035);
printesc(65861);begin helpptr:=1;helpline[0]:=66033;end;error;
if level<>5 then begin curval:=0;curvallevel:=1;
end else begin curval:=0;curvallevel:=0;end;end{:462}end;
while curvallevel>level do{463:}
begin if curvallevel=2 then curval:=mem[curval+1].int else if
curvallevel=3 then muerror;decr(curvallevel);end{:463};{464:}
if negative then if curvallevel>=2 then begin curval:=newspec(curval);
{465:}begin mem[curval+1].int:=-mem[curval+1].int;
mem[curval+2].int:=-mem[curval+2].int;
mem[curval+3].int:=-mem[curval+3].int;end{:465};
end else curval:=-curval else if(curvallevel>=2)and(curvallevel<=3)then
incr(mem[curval].hh.rh){:464};10:end;{:447}{474:}procedure scanint;
label 30,20;var negative:boolean;m:integer;d:smallnumber;
vacuous:boolean;OKsofar:boolean;begin radix:=0;OKsofar:=true;{475:}
negative:=false;repeat{440:}repeat getxtoken;until curcmd<>10{:440};
if curtok=25165869 then begin negative:=not negative;curtok:=25165867;
end;until curtok<>25165867{:475};20:if curtok=25165920 then{476:}
begin gettoken;if curtok<33554431 then begin curval:=curchr;
if curcmd<=2 then if curcmd=2 then incr(alignstate)else decr(alignstate)
;
end else if curtok<34668544 then curval:=curtok-33554432 else if curtok<
34734080 then curval:=curtok-34668544 else begin m:=hash[curtok-33554431
].rh;
if strstart[(m+1)-65536]=2+strstart[(m)-65536]then begin m:=strstart[(m)
-65536];
if(strpool[m]>=55296)and(strpool[m]<=56319)and(strpool[m+1]>=56320)and(
strpool[m+1]<=57343)then curval:=65536+(strpool[m]-55296)*1024+strpool[m
+1]-56320 else curval:=1114112;end else curval:=1114112;end;
if curval>1114111 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66059);end;begin helpptr:=2;helpline[1]:=66060;helpline[0]:=66061;
end;curval:=48;backerror;end else{477:}begin getxtoken;
if curcmd<>10 then backinput;end{:477};end{:476}
else if curtok=34749092 then{403:}begin gettoken;
if curcs<1179650 then curcs:=primlookup(curcs-1114113)else curcs:=
primlookup(hash[curcs].rh);
if curcs<>0 then begin curcmd:=eqtb[1194662+curcs].hh.b0;
curchr:=eqtb[1194662+curcs].hh.rh;curcs:=1194662+curcs;
curtok:=33554431+curcs;end else begin curcmd:=0;curchr:=0;
curtok:=34749088;curcs:=1194657;end;goto 20;end{:403}
else if(curcmd>=68)and(curcmd<=91)then scansomethinginternal(0,false)
else{478:}begin radix:=10;m:=214748364;
if curtok=25165863 then begin radix:=8;m:=268435456;getxtoken;
end else if curtok=25165858 then begin radix:=16;m:=134217728;getxtoken;
end;vacuous:=true;curval:=0;{479:}
while true do begin if(curtok<25165872+radix)and(curtok>=25165872)and(
curtok<=25165881)then d:=curtok-25165872 else if radix=16 then if(curtok
<=23068742)and(curtok>=23068737)then d:=curtok-23068727 else if(curtok<=
25165894)and(curtok>=25165889)then d:=curtok-25165879 else goto 30 else
goto 30;vacuous:=false;
if(curval>=m)and((curval>m)or(d>7)or(radix<>10))then begin if OKsofar
then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66062);end;begin helpptr:=2;helpline[1]:=66063;helpline[0]:=66064;
end;error;curval:=2147483647;OKsofar:=false;end;
end else curval:=curval*radix+d;getxtoken;end;30:{:479};
if vacuous then{480:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66008);end;begin helpptr:=3;helpline[2]:=66009;helpline[1]:=66010;
helpline[0]:=66011;end;backerror;end{:480}
else if curcmd<>10 then backinput;end{:478};
if negative then curval:=-curval;end;{:474}{482:}
procedure xetexscandimen(mu,inf,shortcut,requiresunits:boolean);
label 30,31,32,40,45,88,89;var negative:boolean;f:integer;{485:}
num,denom:1..65536;k,kk:smallnumber;p,q:halfword;v:scaled;
savecurval:integer;{:485}begin f:=0;aritherror:=false;curorder:=0;
negative:=false;if not shortcut then begin{475:}negative:=false;
repeat{440:}repeat getxtoken;until curcmd<>10{:440};
if curtok=25165869 then begin negative:=not negative;curtok:=25165867;
end;until curtok<>25165867{:475};if(curcmd>=68)and(curcmd<=91)then{484:}
if mu then begin scansomethinginternal(3,false);
if curvallevel<>0 then begin{486:}
if curvallevel>=2 then begin v:=mem[curval+1].int;deleteglueref(curval);
curval:=v;end{:486};if curvallevel<>3 then muerror;goto 89;end;
end else begin scansomethinginternal(1,false);
if curvallevel=1 then goto 89;end{:484}else begin backinput;
if curtok=25165868 then curtok:=25165870;
if curtok<>25165870 then scanint else begin radix:=10;curval:=0;end;
if curtok=25165868 then curtok:=25165870;
if(radix=10)and(curtok=25165870)then{487:}begin k:=0;p:=-268435455;
gettoken;while true do begin getxtoken;
if(curtok>25165881)or(curtok<25165872)then goto 31;
if k<17 then begin q:=getavail;mem[q].hh.rh:=p;
mem[q].hh.lh:=curtok-25165872;p:=q;incr(k);end;end;
31:for kk:=k downto 1 do begin dig[kk-1]:=mem[p].hh.lh;q:=p;
p:=mem[p].hh.rh;begin mem[q].hh.rh:=avail;avail:=q;
ifdef('STAT')decr(dynused);endif('STAT')end;end;f:=rounddecimals(k);
if curcmd<>10 then backinput;end{:487};end;end;
if curval<0 then begin negative:=not negative;curval:=-curval;end;
if requiresunits then begin{488:}if inf then{489:}
if scankeyword(65597)then begin curorder:=1;
while scankeyword(108)do begin if curorder=3 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66066);end;print(66067);begin helpptr:=1;helpline[0]:=66068;end;
error;end else incr(curorder);end;goto 88;end{:489};{490:}
savecurval:=curval;{440:}repeat getxtoken;until curcmd<>10{:440};
if(curcmd<68)or(curcmd>91)then backinput else begin if mu then begin
scansomethinginternal(3,false);{486:}
if curvallevel>=2 then begin v:=mem[curval+1].int;deleteglueref(curval);
curval:=v;end{:486};if curvallevel<>3 then muerror;
end else scansomethinginternal(1,false);v:=curval;goto 40;end;
if mu then goto 45;if scankeyword(66069)then v:=({593:}
fontinfo[6+parambase[eqtb[1206823].hh.rh]].int{:593}
)else if scankeyword(66070)then v:=({594:}
fontinfo[5+parambase[eqtb[1206823].hh.rh]].int{:594})else goto 45;{477:}
begin getxtoken;if curcmd<>10 then backinput;end{:477};
40:curval:=multandadd(savecurval,v,xnoverd(v,f,65536),1073741823);
goto 89;45:{:490};if mu then{491:}
if scankeyword(65625)then goto 88 else begin begin if interaction=3 then
;if filelineerrorstylep then printfileline else printnl(65544);
print(66066);end;print(66071);begin helpptr:=4;helpline[3]:=66072;
helpline[2]:=66073;helpline[1]:=66074;helpline[0]:=66075;end;error;
goto 88;end{:491};if scankeyword(66065)then{492:}begin preparemag;
if eqtb[7892281].int<>1000 then begin curval:=xnoverd(curval,1000,eqtb[
7892281].int);f:=(1000*f+65536*texremainder)div eqtb[7892281].int;
curval:=curval+(f div 65536);f:=f mod 65536;end;end{:492};
if scankeyword(65697)then goto 88;{493:}
if scankeyword(66076)then begin num:=7227;denom:=100;
end else if scankeyword(66077)then begin num:=12;denom:=1;
end else if scankeyword(66078)then begin num:=7227;denom:=254;
end else if scankeyword(66079)then begin num:=7227;denom:=2540;
end else if scankeyword(66080)then begin num:=7227;denom:=7200;
end else if scankeyword(66081)then begin num:=1238;denom:=1157;
end else if scankeyword(66082)then begin num:=14856;denom:=1157;
end else if scankeyword(66083)then goto 30 else{494:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66066);end;print(66084);begin helpptr:=6;helpline[5]:=66085;
helpline[4]:=66086;helpline[3]:=66087;helpline[2]:=66073;
helpline[1]:=66074;helpline[0]:=66075;end;error;goto 32;end{:494};
curval:=xnoverd(curval,num,denom);
f:=(num*f+65536*texremainder)div denom;curval:=curval+(f div 65536);
f:=f mod 65536;32:{:493};
88:if curval>=16384 then aritherror:=true else curval:=curval*65536+f;
30:{:488};{477:}begin getxtoken;if curcmd<>10 then backinput;end{:477};
end else begin if curval>=16384 then aritherror:=true else curval:=
curval*65536+f;end;
89:if aritherror or(abs(curval)>=1073741824)then{495:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66088);end;begin helpptr:=2;helpline[1]:=66089;helpline[0]:=66090;
end;error;curval:=1073741823;aritherror:=false;end{:495};
if negative then curval:=-curval;end;
procedure scandimen(mu,inf,shortcut:boolean);
begin xetexscandimen(mu,inf,shortcut,true);end;{:482}{483:}
procedure scandecimal;begin xetexscandimen(false,false,false,false);end;
{:483}{496:}procedure scanglue(level:smallnumber);label 10;
var negative:boolean;q:halfword;mu:boolean;begin mu:=(level=3);{475:}
negative:=false;repeat{440:}repeat getxtoken;until curcmd<>10{:440};
if curtok=25165869 then begin negative:=not negative;curtok:=25165867;
end;until curtok<>25165867{:475};
if(curcmd>=68)and(curcmd<=91)then begin scansomethinginternal(level,
negative);
if curvallevel>=2 then begin if curvallevel<>level then muerror;goto 10;
end;if curvallevel=0 then scandimen(mu,false,true)else if level=3 then
muerror;end else begin backinput;scandimen(mu,false,false);
if negative then curval:=-curval;end;{497:}q:=newspec(membot);
mem[q+1].int:=curval;
if scankeyword(66091)then begin scandimen(mu,true,false);
mem[q+2].int:=curval;mem[q].hh.b0:=curorder;end;
if scankeyword(66092)then begin scandimen(mu,true,false);
mem[q+3].int:=curval;mem[q].hh.b1:=curorder;end;curval:=q{:497};10:end;
{1593:}{1604:}function addorsub(x,y,maxanswer:integer;
negative:boolean):integer;var a:integer;begin if negative then y:=-y;
if x>=0 then if y<=maxanswer-x then a:=x+y else begin aritherror:=true;
a:=0;
end else if y>=-maxanswer-x then a:=x+y else begin aritherror:=true;
a:=0;end;addorsub:=a;end;{:1604}{1608:}
function quotient(n,d:integer):integer;var negative:boolean;a:integer;
begin if d=0 then begin aritherror:=true;a:=0;
end else begin if d>0 then negative:=false else begin d:=-d;
negative:=true;end;if n<0 then begin n:=-n;negative:=not negative;end;
a:=n div d;n:=n-a*d;d:=n-d;if d+n>=0 then incr(a);
if negative then a:=-a;end;quotient:=a;end;{:1608}{1610:}
function fract(x,n,d,maxanswer:integer):integer;label 40,41,88,30;
var negative:boolean;a:integer;f:integer;h:integer;r:integer;t:integer;
begin if d=0 then goto 88;a:=0;
if d>0 then negative:=false else begin d:=-d;negative:=true;end;
if x<0 then begin x:=-x;negative:=not negative;
end else if x=0 then goto 30;if n<0 then begin n:=-n;
negative:=not negative;end;t:=n div d;if t>maxanswer div x then goto 88;
a:=t*x;n:=n-t*d;if n=0 then goto 40;t:=x div d;
if t>(maxanswer-a)div n then goto 88;a:=a+t*n;x:=x-t*d;
if x=0 then goto 40;if x<n then begin t:=x;x:=n;n:=t;end;{1611:}f:=0;
r:=(d div 2)-d;h:=-r;while true do begin if odd(n)then begin r:=r+x;
if r>=0 then begin r:=r-d;incr(f);end;end;n:=n div 2;
if n=0 then goto 41;if x<h then x:=x+x else begin t:=x-d;x:=t+x;f:=f+n;
if x<n then begin if x=0 then goto 41;t:=x;x:=n;n:=t;end;end;end;
41:{:1611}if f>(maxanswer-a)then goto 88;a:=a+f;
40:if negative then a:=-a;goto 30;88:begin aritherror:=true;a:=0;end;
30:fract:=a;end;{:1610}procedure scanexpr;label 20,22,40;
var a,b:boolean;l:smallnumber;r:smallnumber;s:smallnumber;o:smallnumber;
e:integer;t:integer;f:integer;n:integer;p:halfword;q:halfword;
begin l:=curvallevel;a:=aritherror;b:=false;p:=-268435455;
incr(expanddepthcount);
if expanddepthcount>=expanddepth then overflow(65951,expanddepth);
{1594:}20:r:=0;e:=0;s:=0;t:=0;n:=0;22:if s=0 then o:=l else o:=0;{1596:}
{440:}repeat getxtoken;until curcmd<>10{:440};
if curtok=25165864 then{1599:}begin q:=getnode(4);mem[q].hh.rh:=p;
mem[q].hh.b0:=l;mem[q].hh.b1:=4*s+r;mem[q+1].int:=e;mem[q+2].int:=t;
mem[q+3].int:=n;p:=q;l:=o;goto 20;end{:1599};backinput;
if o=0 then scanint else if o=1 then scandimen(false,false,false)else if
o=2 then scannormalglue else scanmuglue;f:=curval{:1596};40:{1595:}
{440:}repeat getxtoken;until curcmd<>10{:440};
if curtok=25165867 then o:=1 else if curtok=25165869 then o:=2 else if
curtok=25165866 then o:=3 else if curtok=25165871 then o:=4 else begin o
:=0;if p=-268435455 then begin if curcmd<>0 then backinput;
end else if curtok<>25165865 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66950);end;begin helpptr:=1;helpline[0]:=66951;end;backerror;end;
end{:1595};aritherror:=b;{1601:}
if(l=0)or(s>2)then begin if(f>2147483647)or(f<-2147483647)then begin
aritherror:=true;f:=0;end;
end else if l=1 then begin if abs(f)>1073741823 then begin aritherror:=
true;f:=0;end;
end else begin if(abs(mem[f+1].int)>1073741823)or(abs(mem[f+2].int)>
1073741823)or(abs(mem[f+3].int)>1073741823)then begin aritherror:=true;
deleteglueref(f);f:=newspec(membot);end;end{:1601};case s of{1602:}
0:if(l>=2)and(o<>0)then begin t:=newspec(f);deleteglueref(f);
if mem[t+2].int=0 then mem[t].hh.b0:=0;
if mem[t+3].int=0 then mem[t].hh.b1:=0;end else t:=f;{:1602}{1606:}
3:if o=4 then begin n:=f;o:=5;
end else if l=0 then t:=multandadd(t,f,0,2147483647)else if l=1 then t:=
multandadd(t,f,0,1073741823)else begin mem[t+1].int:=multandadd(mem[t+1]
.int,f,0,1073741823);
mem[t+2].int:=multandadd(mem[t+2].int,f,0,1073741823);
mem[t+3].int:=multandadd(mem[t+3].int,f,0,1073741823);end;{:1606}{1607:}
4:if l<2 then t:=quotient(t,f)else begin mem[t+1].int:=quotient(mem[t+1]
.int,f);mem[t+2].int:=quotient(mem[t+2].int,f);
mem[t+3].int:=quotient(mem[t+3].int,f);end;{:1607}{1609:}
5:if l=0 then t:=fract(t,n,f,2147483647)else if l=1 then t:=fract(t,n,f,
1073741823)else begin mem[t+1].int:=fract(mem[t+1].int,n,f,1073741823);
mem[t+2].int:=fract(mem[t+2].int,n,f,1073741823);
mem[t+3].int:=fract(mem[t+3].int,n,f,1073741823);end;{:1609}end;
if o>2 then s:=o else{1603:}begin s:=0;
if r=0 then e:=t else if l=0 then e:=addorsub(e,t,2147483647,r=2)else if
l=1 then e:=addorsub(e,t,1073741823,r=2)else{1605:}
begin mem[e+1].int:=addorsub(mem[e+1].int,mem[t+1].int,1073741823,r=2);
if mem[e].hh.b0=mem[t].hh.b0 then mem[e+2].int:=addorsub(mem[e+2].int,
mem[t+2].int,1073741823,r=2)else if(mem[e].hh.b0<mem[t].hh.b0)and(mem[t
+2].int<>0)then begin mem[e+2].int:=mem[t+2].int;
mem[e].hh.b0:=mem[t].hh.b0;end;
if mem[e].hh.b1=mem[t].hh.b1 then mem[e+3].int:=addorsub(mem[e+3].int,
mem[t+3].int,1073741823,r=2)else if(mem[e].hh.b1<mem[t].hh.b1)and(mem[t
+3].int<>0)then begin mem[e+3].int:=mem[t+3].int;
mem[e].hh.b1:=mem[t].hh.b1;end;deleteglueref(t);
if mem[e+2].int=0 then mem[e].hh.b0:=0;
if mem[e+3].int=0 then mem[e].hh.b1:=0;end{:1605};r:=o;end{:1603};
b:=aritherror;if o<>0 then goto 22;if p<>-268435455 then{1600:}
begin f:=e;q:=p;e:=mem[q+1].int;t:=mem[q+2].int;n:=mem[q+3].int;
s:=mem[q].hh.b1 div 4;r:=mem[q].hh.b1 mod 4;l:=mem[q].hh.b0;
p:=mem[q].hh.rh;freenode(q,4);goto 40;end{:1600}{:1594};
decr(expanddepthcount);if b then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66663);end;begin helpptr:=2;helpline[1]:=66949;helpline[0]:=66665;
end;error;if l>=2 then begin deleteglueref(e);e:=membot;
incr(mem[e].hh.rh);end else e:=0;end;aritherror:=a;curval:=e;
curvallevel:=l;end;{:1593}{1598:}procedure scannormalglue;
begin scanglue(2);end;procedure scanmuglue;begin scanglue(3);end;{:1598}
{:496}{498:}function scanrulespec:halfword;label 21;var q:halfword;
begin q:=newrule;
if curcmd=35 then mem[q+1].int:=26214 else begin mem[q+3].int:=26214;
mem[q+2].int:=0;end;
21:if scankeyword(66093)then begin scandimen(false,false,false);
mem[q+1].int:=curval;goto 21;end;
if scankeyword(66094)then begin scandimen(false,false,false);
mem[q+3].int:=curval;goto 21;end;
if scankeyword(66095)then begin scandimen(false,false,false);
mem[q+2].int:=curval;goto 21;end;scanrulespec:=q;end;{:498}{499:}{1493:}
procedure scangeneraltext;label 40;var s:0..5;w:halfword;d:halfword;
p:halfword;q:halfword;unbalance:halfword;begin s:=scannerstatus;
w:=warningindex;d:=defref;scannerstatus:=5;warningindex:=curcs;
defref:=getavail;mem[defref].hh.lh:=-268435455;p:=defref;scanleftbrace;
unbalance:=1;while true do begin gettoken;
if curtok<6291456 then if curcmd<2 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 40;end;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;
40:q:=mem[defref].hh.rh;begin mem[defref].hh.rh:=avail;avail:=defref;
ifdef('STAT')decr(dynused);endif('STAT')end;
if q=-268435455 then curval:=memtop-3 else curval:=p;
mem[memtop-3].hh.rh:=q;scannerstatus:=s;warningindex:=w;defref:=d;end;
{:1493}{1564:}procedure pseudostart;var oldsetting:0..21;s:strnumber;
l,m:poolpointer;p,q,r:halfword;w:fourquarters;nl,sz:integer;
begin scangeneraltext;oldsetting:=selector;selector:=21;
tokenshow(memtop-3);selector:=oldsetting;flushlist(mem[memtop-3].hh.rh);
begin if poolptr+1>poolsize then overflow(65539,poolsize-initpoolptr);
end;s:=makestring;{1565:}strpool[poolptr]:=32;l:=strstart[(s)-65536];
nl:=eqtb[7892313].int;p:=getavail;q:=p;while l<poolptr do begin m:=l;
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
pseudofiles:=p{:1565};begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;{1566:}beginfilereading;line:=0;
curinput.limitfield:=curinput.startfield;
curinput.locfield:=curinput.limitfield+1;
if eqtb[7892328].int>0 then begin if termoffset>maxprintline-3 then
println else if(termoffset>0)or(fileoffset>0)then printchar(32);
curinput.namefield:=19;print(66934);incr(openparens);fflush(stdout);
end else begin curinput.namefield:=18;{1718:}
curinput.synctextagfield:=0;{:1718};end{:1566};end;{:1564}
function strtokscat(b:poolpointer;cat:smallnumber):halfword;
var p:halfword;q:halfword;t:halfword;k:poolpointer;
begin begin if poolptr+1>poolsize then overflow(65539,poolsize-
initpoolptr);end;p:=memtop-3;mem[p].hh.rh:=-268435455;k:=b;
while k<poolptr do begin t:=strpool[k];
if(t=32)and(cat=0)then t:=20971552 else begin if(t>=55296)and(t<=56319)
and(k+1<poolptr)and(strpool[k+1]>=56320)and(strpool[k+1]<=57343)then
begin incr(k);t:=65536+(t-55296)*1024+(strpool[k]-56320);end;
if cat=0 then t:=25165824+t else if cat=13 then t:=33554432+t else t:=
2097152*cat+t;end;begin begin q:=avail;
if q=-268435455 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-268435455;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=t;p:=q;end;incr(k);end;poolptr:=b;
strtokscat:=p;end;function strtoks(b:poolpointer):halfword;
begin strtoks:=strtokscat(b,0);end;{:499}{500:}
function thetoks:halfword;label 10;var oldsetting:0..21;p,q,r:halfword;
b:poolpointer;c:smallnumber;begin{1498:}
if odd(curchr)then begin c:=curchr;scangeneraltext;
if c=1 then thetoks:=curval else begin oldsetting:=selector;
selector:=21;b:=poolptr;p:=getavail;mem[p].hh.rh:=mem[memtop-3].hh.rh;
tokenshow(p);flushlist(p);selector:=oldsetting;thetoks:=strtoks(b);end;
goto 10;end{:1498};getxtoken;scansomethinginternal(5,false);
if curvallevel>=4 then{501:}begin p:=memtop-3;mem[p].hh.rh:=-268435455;
if curvallevel=4 then begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=33554431+curval;p:=q;
end else if curval<>-268435455 then begin r:=mem[curval].hh.rh;
while r<>-268435455 do begin begin begin q:=avail;
if q=-268435455 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-268435455;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=mem[r].hh.lh;p:=q;end;r:=mem[r].hh.rh;
end;end;thetoks:=p;end{:501}else begin oldsetting:=selector;
selector:=21;b:=poolptr;case curvallevel of 0:printint(curval);
1:begin printscaled(curval);print(65697);end;
2:begin printspec(curval,65697);deleteglueref(curval);end;
3:begin printspec(curval,65625);deleteglueref(curval);end;end;
selector:=oldsetting;thetoks:=strtoks(b);end;10:end;{:500}{502:}
procedure insthetoks;begin mem[memtop-12].hh.rh:=thetoks;
begintokenlist(mem[memtop-3].hh.rh,5);end;{:502}{505:}
procedure convtoks;var oldsetting:0..21;
savewarningindex,savedefref:halfword;boolvar:boolean;s:strnumber;
u:strnumber;j:integer;c:smallnumber;savescannerstatus:smallnumber;
b:poolpointer;fnt,arg1,arg2:integer;fontnamestr:strnumber;i:smallnumber;
quotechar:UTF16code;cat:smallnumber;savedchr:UnicodeScalar;p,q:halfword;
begin cat:=0;c:=curchr;{506:}case c of 0,1:scanint;
2,3:begin savescannerstatus:=scannerstatus;scannerstatus:=0;gettoken;
scannerstatus:=savescannerstatus;end;4:scanfontident;5:;
6:begin savescannerstatus:=scannerstatus;savewarningindex:=warningindex;
savedefref:=defref;
if strstart[(strptr)-65536]<poolptr then u:=makestring else u:=0;
scanpdfexttoks;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;begintokenlist(mem[defref].hh.rh,5);
begin mem[defref].hh.rh:=avail;avail:=defref;ifdef('STAT')decr(dynused);
endif('STAT')end;defref:=savedefref;if u<>0 then decr(strptr);goto 10;
end;16,17:begin scanregisternum;
if curval<256 then p:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
if(p=-268435455)or(mem[p].hh.b0<>0)then pdferror(66116,66117)end;
22:begin b:=poolptr;getcreationdate;mem[memtop-12].hh.rh:=strtoks(b);
begintokenlist(mem[memtop-3].hh.rh,5);goto 10;end;
23:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[(strptr)-65536]<poolptr then u:=makestring else u:=0;
scanpdfexttoks;if selector=21 then pdferror(66118,66119);
oldsetting:=selector;selector:=21;
showtokenlist(mem[defref].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;deletetokenref(defref);
defref:=savedefref;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;b:=poolptr;getfilemoddate(s);
mem[memtop-12].hh.rh:=strtoks(b);if(s=strptr-1)then begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;
begintokenlist(mem[memtop-3].hh.rh,5);if u<>0 then decr(strptr);goto 10;
end;24:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[(strptr)-65536]<poolptr then u:=makestring else u:=0;
scanpdfexttoks;if selector=21 then pdferror(66118,66119);
oldsetting:=selector;selector:=21;
showtokenlist(mem[defref].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;deletetokenref(defref);
defref:=savedefref;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;b:=poolptr;getfilesize(s);
mem[memtop-12].hh.rh:=strtoks(b);if(s=strptr-1)then begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;
begintokenlist(mem[memtop-3].hh.rh,5);if u<>0 then decr(strptr);goto 10;
end;25:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[(strptr)-65536]<poolptr then u:=makestring else u:=0;
boolvar:=scankeyword(66120);scanpdfexttoks;
if selector=21 then pdferror(66118,66119);oldsetting:=selector;
selector:=21;
showtokenlist(mem[defref].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;deletetokenref(defref);
defref:=savedefref;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;b:=poolptr;getmd5sum(s,boolvar);
mem[memtop-12].hh.rh:=strtoks(b);if(s=strptr-1)then begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;
begintokenlist(mem[memtop-3].hh.rh,5);if u<>0 then decr(strptr);goto 10;
end;26:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[(strptr)-65536]<poolptr then u:=makestring else u:=0;
curval:=0;if(scankeyword(66121))then begin scanint;
if(curval<0)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66122);end;begin helpptr:=2;helpline[1]:=66123;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;i:=curval;curval:=0;
if(scankeyword(66124))then begin scanint;
if(curval<0)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66125);end;begin helpptr:=2;helpline[1]:=66126;helpline[0]:=66005;
end;interror(curval);curval:=0;end;end;j:=curval;scanpdfexttoks;
if selector=21 then pdferror(66118,66119);oldsetting:=selector;
selector:=21;
showtokenlist(mem[defref].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;deletetokenref(defref);
defref:=savedefref;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;b:=poolptr;getfiledump(s,i,j);
mem[memtop-12].hh.rh:=strtoks(b);if(s=strptr-1)then begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;
begintokenlist(mem[memtop-3].hh.rh,5);if u<>0 then decr(strptr);goto 10;
end;18:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[(strptr)-65536]<poolptr then u:=makestring else u:=0;
comparestrings;defref:=savedefref;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;if u<>0 then decr(strptr);end;
38:scanusvnum;39:begin scanusvnum;savedchr:=curval;scanint;
if(curval<1)or(curval>13)or(curval=5)or(curval=9)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66127);end;printint(curval);print(66128);begin helpptr:=1;
helpline[0]:=66129;end;error;cat:=12;end else cat:=curval;
curval:=savedchr;end;{1460:}33:;34:begin scanfontident;fnt:=curval;
if(fontarea[fnt]=65535)then begin scanint;arg1:=curval;arg2:=0;
end else notaatfonterror(111,c,fnt);end;35:begin scanfontident;
fnt:=curval;
if(fontarea[fnt]=65535)or((fontarea[fnt]=65534)and(usingGraphite(
fontlayoutengine[fnt])))then begin scanint;arg1:=curval;arg2:=0;
end else notaatgrfonterror(111,c,fnt);end;36:begin scanfontident;
fnt:=curval;
if(fontarea[fnt]=65535)or((fontarea[fnt]=65534)and(usingGraphite(
fontlayoutengine[fnt])))then begin scanint;arg1:=curval;scanint;
arg2:=curval;end else notaatgrfonterror(111,c,fnt);end;
37:begin scanfontident;fnt:=curval;
if((fontarea[fnt]=65535)or(fontarea[fnt]=65534))then begin scanint;
arg1:=curval;end else notnativefonterror(111,c,fnt);end;{:1460}
40:if jobname=0 then openlogfile;29:scanint;30:;end{:506};
oldsetting:=selector;selector:=21;b:=poolptr;{507:}
case c of 0:printint(curval);1:printromanint(curval);
2:if curcs<>0 then sprintcs(curcs)else printchar(curchr);3:printmeaning;
4:begin fontnamestr:=fontname[curval];
if((fontarea[curval]=65535)or(fontarea[curval]=65534))then begin
quotechar:=34;
for i:=0 to length(fontnamestr)-1 do if strpool[strstart[(fontnamestr)
-65536]+i]=34 then quotechar:=39;printchar(quotechar);
print(fontnamestr);printchar(quotechar);end else print(fontnamestr);
if fontsize[curval]<>fontdsize[curval]then begin print(66130);
printscaled(fontsize[curval]);print(65697);end;end;5:print(65536);
16:begin p:=mem[p+5].hh.rh;
while(p<>-268435455)and((not(p>=himemmin)and((mem[p].hh.b0=3)or(mem[p].
hh.b0=4)or(mem[p].hh.b0=5)or(mem[p].hh.b0=12)or((mem[p].hh.b0=7)and(mem[
p+1].hh.lh=-268435455)and(mem[p+1].hh.rh=-268435455)and(mem[p].hh.b1=0))
or((mem[p].hh.b0=9)and(mem[p+1].int=0))or((mem[p].hh.b0=11)and((mem[p+1]
.int=0)or(mem[p].hh.b1=0)))or((mem[p].hh.b0=10)and(mem[p+1].hh.lh=membot
))or((mem[p].hh.b0=0)and(mem[p+1].int=0)and(mem[p+3].int=0)and(mem[p+2].
int=0)and(mem[p+5].hh.rh=-268435455))))or((not(p>=himemmin))and(mem[p].
hh.b0=10)and(mem[p].hh.b1=8)))do p:=mem[p].hh.rh;
if(p<>-268435455)and(not(p>=himemmin))and(mem[p].hh.b0=40)and(mem[p].hh.
b1=0)then printscaled(mem[p+1].int)else print(48);print(65697);end;
17:begin q:=mem[p+5].hh.rh;p:=prevrightmost(q,-268435455);
while(p<>-268435455)and((not(p>=himemmin)and((mem[p].hh.b0=3)or(mem[p].
hh.b0=4)or(mem[p].hh.b0=5)or(mem[p].hh.b0=12)or((mem[p].hh.b0=7)and(mem[
p+1].hh.lh=-268435455)and(mem[p+1].hh.rh=-268435455)and(mem[p].hh.b1=0))
or((mem[p].hh.b0=9)and(mem[p+1].int=0))or((mem[p].hh.b0=11)and((mem[p+1]
.int=0)or(mem[p].hh.b1=0)))or((mem[p].hh.b0=10)and(mem[p+1].hh.lh=membot
))or((mem[p].hh.b0=0)and(mem[p+1].int=0)and(mem[p+3].int=0)and(mem[p+2].
int=0)and(mem[p+5].hh.rh=-268435455))))or((not(p>=himemmin))and(mem[p].
hh.b0=10)and(mem[p].hh.b1=9)))do p:=prevrightmost(q,p);
if(p<>-268435455)and(not(p>=himemmin))and(mem[p].hh.b0=40)and(mem[p].hh.
b1=1)then printscaled(mem[p+1].int)else print(48);print(65697);end;
18:printint(curval);29:printint(unifrand(curval));30:printint(normrand);
38,39:printchar(curval);{1461:}33:print(65537);
34:if(fontarea[fnt]=65535)then aatprintfontname(c,fontlayoutengine[fnt],
arg1,arg2);
35,36:if(fontarea[fnt]=65535)then aatprintfontname(c,fontlayoutengine[
fnt],arg1,arg2)else if((fontarea[fnt]=65534)and(usingGraphite(
fontlayoutengine[fnt])))then grprintfontname(c,fontlayoutengine[fnt],
arg1,arg2);
37:if((fontarea[fnt]=65535)or(fontarea[fnt]=65534))then printglyphname(
fnt,arg1);{:1461}40:printfilename(jobname,0,0);end{:507};
selector:=oldsetting;mem[memtop-12].hh.rh:=strtokscat(b,cat);
begintokenlist(mem[memtop-3].hh.rh,5);end;{:505}{508:}
function scantoks(macrodef,xpand:boolean):halfword;label 40,22,30,31,32;
var t:halfword;s:halfword;p:halfword;q:halfword;unbalance:halfword;
hashbrace:halfword;
begin if macrodef then scannerstatus:=2 else scannerstatus:=5;
warningindex:=curcs;defref:=getavail;mem[defref].hh.lh:=-268435455;
p:=defref;hashbrace:=0;t:=25165872;if macrodef then{509:}
begin while true do begin 22:gettoken;if curtok<6291456 then goto 31;
if curcmd=6 then{511:}begin s:=27262976+curchr;gettoken;
if curtok<4194304 then begin hashbrace:=curtok;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=29360128;p:=q;end;goto 30;end;
if t=25165881 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66133);end;begin helpptr:=2;helpline[1]:=66134;helpline[0]:=66135;
end;error;goto 22;end else begin incr(t);
if curtok<>t then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66136);end;begin helpptr:=2;helpline[1]:=66137;helpline[0]:=66138;
end;backerror;end;curtok:=s;end;end{:511};begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;31:begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=29360128;p:=q;end;if curcmd=2 then{510:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65990);end;incr(alignstate);begin helpptr:=2;helpline[1]:=66131;
helpline[0]:=66132;end;error;goto 40;end{:510};30:end{:509}
else scanleftbrace;{512:}unbalance:=1;
while true do begin if xpand then{513:}
begin while true do begin getnext;
if curcmd>=114 then if mem[mem[curchr].hh.rh].hh.lh=29360129 then begin
curcmd:=0;curchr:=1114113;end;if curcmd<=103 then goto 32;
if curcmd<>112 then expand else begin q:=thetoks;
if mem[memtop-3].hh.rh<>-268435455 then begin mem[p].hh.rh:=mem[memtop-3
].hh.rh;p:=q;end;end;end;32:xtoken end{:513}else gettoken;
if curtok<6291456 then if curcmd<2 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 40;
end else if curcmd=6 then if macrodef then{514:}begin s:=curtok;
if xpand then getxtoken else gettoken;
if curcmd<>6 then if(curtok<=25165872)or(curtok>t)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66139);end;sprintcs(warningindex);begin helpptr:=3;
helpline[2]:=66140;helpline[1]:=66141;helpline[0]:=66142;end;backerror;
curtok:=s;end else curtok:=10485712+curchr;end{:514};begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end{:512};
40:scannerstatus:=0;if hashbrace<>0 then begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=hashbrace;p:=q;end;scantoks:=p;end;{:508}
{517:}procedure readtoks(n:integer;r:halfword;j:halfword);label 30;
var p:halfword;q:halfword;s:integer;m:smallnumber;
begin scannerstatus:=2;warningindex:=r;defref:=getavail;
mem[defref].hh.lh:=-268435455;p:=defref;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=29360128;p:=q;end;
if(n<0)or(n>15)then m:=16 else m:=n;s:=alignstate;alignstate:=1000000;
repeat{518:}beginfilereading;curinput.namefield:=m+1;
if readopen[m]=2 then{519:}if interaction>1 then if n<0 then begin;
print(65626);terminput;end else begin;println;sprintcs(r);begin;
print(61);terminput;end;n:=-1;end else begin curinput.limitfield:=0;
fatalerror(66143);end{:519}else if readopen[m]=1 then{520:}
if inputln(readfile[m],false)then readopen[m]:=0 else begin uclose(
readfile[m]);readopen[m]:=2;end{:520}else{521:}
begin if not inputln(readfile[m],true)then begin uclose(readfile[m]);
readopen[m]:=2;if alignstate<>1000000 then begin runaway;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66144);end;printesc(65858);begin helpptr:=1;helpline[0]:=66145;
end;alignstate:=1000000;curinput.limitfield:=0;error;end;end;end{:521};
curinput.limitfield:=last;
if(eqtb[7892312].int<0)or(eqtb[7892312].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[7892312].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
curinput.statefield:=33;{1572:}
if j=1 then begin while curinput.locfield<=curinput.limitfield do begin
curchr:=buffer[curinput.locfield];incr(curinput.locfield);
if curchr=32 then curtok:=20971552 else curtok:=curchr+25165824;
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;
goto 30;end{:1572};while true do begin gettoken;
if curtok=0 then goto 30;
if alignstate<1000000 then begin repeat gettoken;until curtok=0;
alignstate:=1000000;goto 30;end;begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end;30:endfilereading{:518};
until alignstate=1000000;curval:=defref;scannerstatus:=0;alignstate:=s;
end;{:517}{529:}procedure passtext;label 30;var l:integer;
savescannerstatus:smallnumber;begin savescannerstatus:=scannerstatus;
scannerstatus:=1;l:=0;skipline:=line;while true do begin getnext;
if curcmd=109 then begin if l=0 then goto 30;if curchr=2 then decr(l);
end else if curcmd=108 then incr(l);end;
30:scannerstatus:=savescannerstatus;
if eqtb[7892327].int>0 then showcurcmdchr;end;{:529}{532:}
procedure changeiflimit(l:smallnumber;p:halfword);label 10;
var q:halfword;begin if p=condptr then iflimit:=l else begin q:=condptr;
while true do begin if q=-268435455 then confusion(66146);
if mem[q].hh.rh=p then begin mem[q].hh.b0:=l;goto 10;end;
q:=mem[q].hh.rh;end;end;10:end;{:532}{533:}procedure conditional;
label 10,50;var b:boolean;e:boolean;r:60..62;m,n:integer;p,q:halfword;
savescannerstatus:smallnumber;savecondptr:halfword;thisif:smallnumber;
isunless:boolean;
begin if eqtb[7892327].int>0 then if eqtb[7892300].int<=1 then
showcurcmdchr;{530:}begin p:=getnode(2);mem[p].hh.rh:=condptr;
mem[p].hh.b0:=iflimit;mem[p].hh.b1:=curif;mem[p+1].int:=ifline;
condptr:=p;curif:=curchr;iflimit:=1;ifline:=line;end{:530};
savecondptr:=condptr;isunless:=(curchr>=32);thisif:=curchr mod 32;{536:}
case thisif of 0,1:{541:}begin begin getxtoken;
if curcmd=0 then if curchr=1114113 then begin curcmd:=13;
curchr:=curtok-33554432;end;end;
if(curcmd>13)or(curchr>1114111)then begin m:=0;n:=1114112;
end else begin m:=curcmd;n:=curchr;end;begin getxtoken;
if curcmd=0 then if curchr=1114113 then begin curcmd:=13;
curchr:=curtok-33554432;end;end;
if(curcmd>13)or(curchr>1114111)then begin curcmd:=0;curchr:=1114112;end;
if thisif=0 then b:=(n=curchr)else b:=(m=curcmd);end{:541};2,3:{538:}
begin if thisif=2 then scanint else scandimen(false,false,false);
n:=curval;{440:}repeat getxtoken;until curcmd<>10{:440};
if(curtok>=25165884)and(curtok<=25165886)then r:=curtok-25165824 else
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66172);end;printcmdchr(108,thisif);begin helpptr:=1;
helpline[0]:=66173;end;backerror;r:=61;end;
if thisif=2 then scanint else scandimen(false,false,false);
case r of 60:b:=(n<curval);61:b:=(n=curval);62:b:=(n>curval);end;
end{:538};4:{539:}begin scanint;b:=odd(curval);end{:539};
5:b:=(abs(curlist.modefield)=1);6:b:=(abs(curlist.modefield)=105);
7:b:=(abs(curlist.modefield)=209);8:b:=(curlist.modefield<0);
9,10,11:{540:}begin scanregisternum;
if curval<256 then p:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
if thisif=9 then b:=(p=-268435455)else if p=-268435455 then b:=false
else if thisif=10 then b:=(mem[p].hh.b0=0)else b:=(mem[p].hh.b0=1);
end{:540};12:{542:}begin savescannerstatus:=scannerstatus;
scannerstatus:=0;getnext;n:=curcs;p:=curcmd;q:=curchr;getnext;
if curcmd<>p then b:=false else if curcmd<114 then b:=(curchr=q)else{543
:}begin p:=mem[curchr].hh.rh;q:=mem[eqtb[n].hh.rh].hh.rh;
if p=q then b:=true else begin while(p<>-268435455)and(q<>-268435455)do
if mem[p].hh.lh<>mem[q].hh.lh then p:=-268435455 else begin p:=mem[p].hh
.rh;q:=mem[q].hh.rh;end;b:=((p=-268435455)and(q=-268435455));end;
end{:543};scannerstatus:=savescannerstatus;end{:542};
13:begin scanfourbitintor18;
if curval=18 then b:=not shellenabledp else b:=(readopen[curval]=2);end;
14:b:=true;15:b:=false;{1577:}17:begin savescannerstatus:=scannerstatus;
scannerstatus:=0;getnext;b:=(curcmd<>104);
scannerstatus:=savescannerstatus;end;{:1577}{1578:}18:begin n:=getavail;
p:=n;e:=isincsname;isincsname:=true;repeat getxtoken;
if curcs=0 then begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;
p:=q;end;until curcs<>0;if curcmd<>67 then{407:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65958);end;printesc(65818);print(65959);begin helpptr:=2;
helpline[1]:=65960;helpline[0]:=65961;end;backerror;end{:407};{1579:}
m:=first;p:=mem[n].hh.rh;
while p<>-268435455 do begin if m>=maxbufstack then begin maxbufstack:=m
+1;if maxbufstack=bufsize then overflow(65538,bufsize);end;
buffer[m]:=mem[p].hh.lh mod 2097152;incr(m);p:=mem[p].hh.rh;end;
if m>first+1 then curcs:=idlookup(first,m-first)else if m=first then
curcs:=1179649 else curcs:=1114113+buffer[first]{:1579};flushlist(n);
b:=(eqtb[curcs].hh.b0<>104);isincsname:=e;end;{:1578}{1580:}
20:b:=isincsname;19:begin scanfontident;n:=curval;scanusvnum;
if((fontarea[n]=65535)or(fontarea[n]=65534))then b:=(mapchartoglyph(n,
curval)>0)else begin if(fontbc[n]<=curval)and(fontec[n]>=curval)then b:=
(fontinfo[charbase[n]+effectivechar(true,n,curval)].qqqq.b0>0)else b:=
false;end;end;{:1580}16:{544:}begin scanint;n:=curval;
if eqtb[7892300].int>1 then begin begindiagnostic;print(66174);
printint(n);printchar(125);enddiagnostic(false);end;
while n<>0 do begin passtext;
if condptr=savecondptr then if curchr=4 then decr(n)else goto 50 else if
curchr=2 then{531:}begin if ifstack[inopen]=condptr then ifwarning;
p:=condptr;ifline:=mem[p+1].int;curif:=mem[p].hh.b1;
iflimit:=mem[p].hh.b0;condptr:=mem[p].hh.rh;freenode(p,2);end{:531};end;
changeiflimit(4,savecondptr);goto 10;end{:544};
21:begin savescannerstatus:=scannerstatus;scannerstatus:=0;getnext;
scannerstatus:=savescannerstatus;
if curcs<1179650 then m:=primlookup(curcs-1114113)else m:=primlookup(
hash[curcs].rh);
b:=((curcmd<>104)and(m<>0)and(curcmd=eqtb[1194662+m].hh.b0)and(curchr=
eqtb[1194662+m].hh.rh));end;end{:536};if isunless then b:=not b;
if eqtb[7892300].int>1 then{537:}begin begindiagnostic;
if b then print(66170)else print(66171);enddiagnostic(false);end{:537};
if b then begin changeiflimit(3,savecondptr);goto 10;end;{535:}
while true do begin passtext;
if condptr=savecondptr then begin if curchr<>4 then goto 50;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66168);end;printesc(66166);begin helpptr:=1;helpline[0]:=66169;
end;error;end else if curchr=2 then{531:}
begin if ifstack[inopen]=condptr then ifwarning;p:=condptr;
ifline:=mem[p+1].int;curif:=mem[p].hh.b1;iflimit:=mem[p].hh.b0;
condptr:=mem[p].hh.rh;freenode(p,2);end{:531};end{:535};
50:if curchr=2 then{531:}
begin if ifstack[inopen]=condptr then ifwarning;p:=condptr;
ifline:=mem[p+1].int;curif:=mem[p].hh.b1;iflimit:=mem[p].hh.b0;
condptr:=mem[p].hh.rh;freenode(p,2);end{:531}else iflimit:=2;10:end;
{:533}{550:}procedure beginname;begin areadelimiter:=0;extdelimiter:=0;
quotedfilename:=false;filenamequotechar:=0;end;{:550}{551:}
function morename(c:UnicodeScalar):boolean;
begin if stopatspace and(c=32)and(filenamequotechar=0)then morename:=
false else if stopatspace and(filenamequotechar<>0)and(c=
filenamequotechar)then begin filenamequotechar:=0;morename:=true;
end else if stopatspace and(filenamequotechar=0)and((c=34)or(c=39))then
begin filenamequotechar:=c;quotedfilename:=true;morename:=true;
end else begin if(c>65535)then begin if poolptr+2>poolsize then overflow
(65539,poolsize-initpoolptr);
end else begin if poolptr+1>poolsize then overflow(65539,poolsize-
initpoolptr);end;
begin if(c>65535)then begin strpool[poolptr]:=(c-65536)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(c)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=c;incr(poolptr);end;end;
if ISDIRSEP(c)then begin areadelimiter:=(poolptr-strstart[(strptr)-65536
]);extdelimiter:=0;
end else if c=46 then extdelimiter:=(poolptr-strstart[(strptr)-65536]);
morename:=true;end;end;{:551}{552:}procedure endname;
var tempstr:strnumber;j:poolpointer;
begin if strptr+3>maxstrings then overflow(65540,maxstrings-initstrptr);
if areadelimiter=0 then curarea:=65626 else begin curarea:=strptr;
strstart[(strptr+1)-65536]:=strstart[(strptr)-65536]+areadelimiter;
incr(strptr);tempstr:=searchstring(curarea);
if tempstr>0 then begin curarea:=tempstr;decr(strptr);
for j:=strstart[(strptr+1)-65536]to poolptr-1 do begin strpool[j-
areadelimiter]:=strpool[j];end;poolptr:=poolptr-areadelimiter;end;end;
if extdelimiter=0 then begin curext:=65626;curname:=slowmakestring;
end else begin curname:=strptr;
strstart[(strptr+1)-65536]:=strstart[(strptr)-65536]+extdelimiter-
areadelimiter-1;incr(strptr);curext:=makestring;decr(strptr);
tempstr:=searchstring(curname);if tempstr>0 then begin curname:=tempstr;
decr(strptr);
for j:=strstart[(strptr+1)-65536]to poolptr-1 do begin strpool[j-
extdelimiter+areadelimiter+1]:=strpool[j];end;
poolptr:=poolptr-extdelimiter+areadelimiter+1;end;
curext:=slowmakestring;end;end;{:552}{554:}
procedure packfilename(n,a,e:strnumber);var k:integer;c:UnicodeScalar;
j:poolpointer;begin k:=0;if nameoffile then libcfree(nameoffile);
nameoffile:=xmallocarray(UTF8code,(length(a)+length(n)+length(e))*3+1);
for j:=strstart[(a)-65536]to strstart[(a+1)-65536]-1 do begin c:=strpool
[j];incr(k);
if k<=maxint then begin if(c<128)then nameoffile[k]:=c else if(c<2048)
then begin nameoffile[k]:=192+c div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<55296)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<56320)and(k+3<maxint)then begin nameoffile[k]:=240+(c
-55232)div 4096;incr(k);nameoffile[k]:=128+((c-55232)mod 4096)div 4;
incr(k);nameoffile[k]:=128+(c-55232)mod 4*16;incr(k);nameoffile[k]:=128;
end else if(c<57344)and(k>4)then begin decr(k);
nameoffile[k-1]:=nameoffile[k-1]+(c-56320)div 64;
nameoffile[k]:=nameoffile[k]+(c-56320)mod 64;
end else if(c<65536)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;end else begin nameoffile[k]:=239;incr(k);
nameoffile[k]:=191;incr(k);nameoffile[k]:=189;end end end;
for j:=strstart[(n)-65536]to strstart[(n+1)-65536]-1 do begin c:=strpool
[j];incr(k);
if k<=maxint then begin if(c<128)then nameoffile[k]:=c else if(c<2048)
then begin nameoffile[k]:=192+c div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<55296)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<56320)and(k+3<maxint)then begin nameoffile[k]:=240+(c
-55232)div 4096;incr(k);nameoffile[k]:=128+((c-55232)mod 4096)div 4;
incr(k);nameoffile[k]:=128+(c-55232)mod 4*16;incr(k);nameoffile[k]:=128;
end else if(c<57344)and(k>4)then begin decr(k);
nameoffile[k-1]:=nameoffile[k-1]+(c-56320)div 64;
nameoffile[k]:=nameoffile[k]+(c-56320)mod 64;
end else if(c<65536)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;end else begin nameoffile[k]:=239;incr(k);
nameoffile[k]:=191;incr(k);nameoffile[k]:=189;end end end;
for j:=strstart[(e)-65536]to strstart[(e+1)-65536]-1 do begin c:=strpool
[j];incr(k);
if k<=maxint then begin if(c<128)then nameoffile[k]:=c else if(c<2048)
then begin nameoffile[k]:=192+c div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<55296)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<56320)and(k+3<maxint)then begin nameoffile[k]:=240+(c
-55232)div 4096;incr(k);nameoffile[k]:=128+((c-55232)mod 4096)div 4;
incr(k);nameoffile[k]:=128+(c-55232)mod 4*16;incr(k);nameoffile[k]:=128;
end else if(c<57344)and(k>4)then begin decr(k);
nameoffile[k-1]:=nameoffile[k-1]+(c-56320)div 64;
nameoffile[k]:=nameoffile[k]+(c-56320)mod 64;
end else if(c<65536)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;end else begin nameoffile[k]:=239;incr(k);
nameoffile[k]:=191;incr(k);nameoffile[k]:=189;end end end;
if k<=maxint then namelength:=k else namelength:=maxint;
nameoffile[namelength+1]:=0;end;{:554}{558:}
procedure packbufferedname(n:smallnumber;a,b:integer);var k:integer;
c:UTF16code;j:integer;begin if n+b-a+5>maxint then b:=a+maxint-n-5;k:=0;
if nameoffile then libcfree(nameoffile);
nameoffile:=xmallocarray(UTF8code,n+(b-a+1)+5);
for j:=1 to n do begin c:=TEXformatdefault[j];incr(k);
if k<=maxint then begin if(c<128)then nameoffile[k]:=c else if(c<2048)
then begin nameoffile[k]:=192+c div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<55296)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<56320)and(k+3<maxint)then begin nameoffile[k]:=240+(c
-55232)div 4096;incr(k);nameoffile[k]:=128+((c-55232)mod 4096)div 4;
incr(k);nameoffile[k]:=128+(c-55232)mod 4*16;incr(k);nameoffile[k]:=128;
end else if(c<57344)and(k>4)then begin decr(k);
nameoffile[k-1]:=nameoffile[k-1]+(c-56320)div 64;
nameoffile[k]:=nameoffile[k]+(c-56320)mod 64;
end else if(c<65536)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;end else begin nameoffile[k]:=239;incr(k);
nameoffile[k]:=191;incr(k);nameoffile[k]:=189;end end end;
for j:=a to b do begin c:=buffer[j];incr(k);
if k<=maxint then begin if(c<128)then nameoffile[k]:=c else if(c<2048)
then begin nameoffile[k]:=192+c div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<55296)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<56320)and(k+3<maxint)then begin nameoffile[k]:=240+(c
-55232)div 4096;incr(k);nameoffile[k]:=128+((c-55232)mod 4096)div 4;
incr(k);nameoffile[k]:=128+(c-55232)mod 4*16;incr(k);nameoffile[k]:=128;
end else if(c<57344)and(k>4)then begin decr(k);
nameoffile[k-1]:=nameoffile[k-1]+(c-56320)div 64;
nameoffile[k]:=nameoffile[k]+(c-56320)mod 64;
end else if(c<65536)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;end else begin nameoffile[k]:=239;incr(k);
nameoffile[k]:=191;incr(k);nameoffile[k]:=189;end end end;
for j:=formatdefaultlength-3 to formatdefaultlength do begin c:=
TEXformatdefault[j];incr(k);
if k<=maxint then begin if(c<128)then nameoffile[k]:=c else if(c<2048)
then begin nameoffile[k]:=192+c div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<55296)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<56320)and(k+3<maxint)then begin nameoffile[k]:=240+(c
-55232)div 4096;incr(k);nameoffile[k]:=128+((c-55232)mod 4096)div 4;
incr(k);nameoffile[k]:=128+(c-55232)mod 4*16;incr(k);nameoffile[k]:=128;
end else if(c<57344)and(k>4)then begin decr(k);
nameoffile[k-1]:=nameoffile[k-1]+(c-56320)div 64;
nameoffile[k]:=nameoffile[k]+(c-56320)mod 64;
end else if(c<65536)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;end else begin nameoffile[k]:=239;incr(k);
nameoffile[k]:=191;incr(k);nameoffile[k]:=189;end end end;
if k<=maxint then namelength:=k else namelength:=maxint;
nameoffile[namelength+1]:=0;end;{:558}{560:}
function makenamestring:strnumber;var k:0..maxint;
saveareadelimiter,saveextdelimiter:poolpointer;
savenameinprogress,savestopatspace:boolean;
begin if(poolptr+namelength>poolsize)or(strptr=maxstrings)or((poolptr-
strstart[(strptr)-65536])>0)then makenamestring:=63 else begin
makeutf16name;
for k:=0 to namelength16-1 do begin if(nameoffile16[k]>65535)then begin
strpool[poolptr]:=(nameoffile16[k]-65536)div 1024+55296;incr(poolptr);
strpool[poolptr]:=(nameoffile16[k])mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=nameoffile16[k];incr(poolptr);end;end;
makenamestring:=makestring;saveareadelimiter:=areadelimiter;
saveextdelimiter:=extdelimiter;savenameinprogress:=nameinprogress;
savestopatspace:=stopatspace;nameinprogress:=true;beginname;
stopatspace:=false;k:=0;
while(k<namelength16)and(morename(nameoffile16[k]))do incr(k);
stopatspace:=savestopatspace;endname;nameinprogress:=savenameinprogress;
areadelimiter:=saveareadelimiter;extdelimiter:=saveextdelimiter;end;end;
function umakenamestring(var f:unicodefile):strnumber;
begin umakenamestring:=makenamestring;end;
function amakenamestring(var f:alphafile):strnumber;
begin amakenamestring:=makenamestring;end;
function bmakenamestring(var f:bytefile):strnumber;
begin bmakenamestring:=makenamestring;end;
function wmakenamestring(var f:wordfile):strnumber;
begin wmakenamestring:=makenamestring;end;{:560}{561:}
procedure scanfilename;label 30;var savewarningindex:halfword;
begin nameinprogress:=true;savewarningindex:=warningindex;
warningindex:=curcs;{440:}repeat getxtoken;until curcmd<>10{:440};
backinput;if curcmd=1 then begin scanfilenamebraced;
end else begin nameinprogress:=true;beginname;{440:}repeat getxtoken;
until curcmd<>10{:440};
while true do begin if(curcmd>12)or(curchr>1114111)then begin backinput;
goto 30;end;if not morename(curchr)then goto 30;getxtoken;end;end;
30:endname;nameinprogress:=false;warningindex:=savewarningindex;end;
{:561}{564:}procedure packjobname(s:strnumber);begin curarea:=65626;
curext:=s;curname:=jobname;packfilename(curname,curarea,curext);end;
{:564}{565:}procedure promptfilename(s,e:strnumber);label 30;
var k:0..bufsize;savedcurname:strnumber;savedcurext:strnumber;
savedcurarea:strnumber;begin if interaction=2 then;
if s=66176 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66177);end else begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66178);end;printfilename(curname,curarea,curext);print(66179);
if(e=66180)or(e=65626)then showcontext;println;
printcstring(promptfilenamehelpmsg);if(e<>65626)then begin print(66181);
print(e);print(39);end;print(41);println;printnl(66182);print(s);
if interaction<2 then fatalerror(66183);savedcurname:=curname;
savedcurext:=curext;savedcurarea:=curarea;;begin;print(65593);terminput;
end;{566:}begin beginname;k:=first;
while(buffer[k]=32)and(k<last)do incr(k);
while true do begin if k=last then goto 30;
if not morename(buffer[k])then goto 30;incr(k);end;30:endname;end{:566};
if(length(curname)=0)and(curext=65626)and(curarea=65626)then begin
curname:=savedcurname;curext:=savedcurext;curarea:=savedcurarea;
end else if curext=65626 then curext:=e;
packfilename(curname,curarea,curext);end;{:565}{569:}
procedure openlogfile;var oldsetting:0..21;k:0..bufsize;l:0..bufsize;
months:constcstring;begin oldsetting:=selector;
if jobname=0 then jobname:=getjobname(66187);packjobname(66188);
recorderchangefilename(stringcast(nameoffile+1));packjobname(66189);
while not aopenout(logfile)do{570:}begin selector:=17;
promptfilename(66191,66189);end{:570};
texmflogname:=amakenamestring(logfile);selector:=18;logopened:=true;
{571:}
begin if srcspecialsp or filelineerrorstylep or parsefirstlinep then
write(logfile,'This is XeTeX, Version 3.141592653','-2.6','-0.999998')
else write(logfile,'This is XeTeX, Version 3.141592653','-2.6',
'-0.999998');write(logfile,versionstring);print(formatident);
print(66192);printint(sysday);printchar(32);
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
if translatefilename then begin writeln(logfile);
write(logfile,' (WARNING: translate-file "');
fputs(translatefilename,logfile);write(logfile,'" ignored)');end;
end{:571};if mltexenabledp then begin writeln(logfile);
write(logfile,'MLTeX v2.2 enabled');end;inputstack[inputptr]:=curinput;
printnl(66190);l:=inputstack[0].limitfield;
if buffer[l]=eqtb[7892312].int then decr(l);
for k:=1 to l do print(buffer[k]);println;selector:=oldsetting+2;end;
{:569}{572:}procedure startinput;label 30;var tempstr:strnumber;
v:halfword;k:0..maxint;begin scanfilename;
packfilename(curname,curarea,curext);
while true do begin beginfilereading;texinputtype:=1;
if kpseinnameok(stringcast(nameoffile+1))and uopenin(inputfile[curinput.
indexfield],kpsetexformat,eqtb[7892345].int,eqtb[7892346].int)then begin
makeutf16name;nameinprogress:=true;beginname;stopatspace:=false;k:=0;
while(k<namelength16)and(morename(nameoffile16[k]))do incr(k);
stopatspace:=true;endname;nameinprogress:=false;goto 30;end;
endfilereading;promptfilename(66176,65626);end;
30:curinput.namefield:=amakenamestring(inputfile[curinput.indexfield]);
sourcefilenamestack[inopen]:=curinput.namefield;
fullsourcefilenamestack[inopen]:=makefullnamestring;
if curinput.namefield=strptr-1 then begin tempstr:=searchstring(curinput
.namefield);if tempstr>0 then begin curinput.namefield:=tempstr;
begin decr(strptr);poolptr:=strstart[(strptr)-65536];end;end;end;
if jobname=0 then begin jobname:=getjobname(curname);openlogfile;end;
if termoffset+length(fullsourcefilenamestack[inopen])>maxprintline-2
then println else if(termoffset>0)or(fileoffset>0)then printchar(32);
printchar(40);incr(openparens);print(fullsourcefilenamestack[inopen]);
fflush(stdout);if eqtb[7892322].int>0 then begin begindiagnostic;
println;printchar(126);v:=inputptr-1;
if v<eqtb[7892322].int then while v>0 do begin printchar(46);decr(v);
end else printchar(126);print(66193);print(curname);print(curext);
println;enddiagnostic(false);end;curinput.statefield:=33;{1716:}
synctexstartinput;{:1716};{573:}begin line:=1;
if inputln(inputfile[curinput.indexfield],false)then;firmuptheline;
if(eqtb[7892312].int<0)or(eqtb[7892312].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[7892312].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end{:573};end;{:572}{595:}{1694:}
function effectivecharinfo(f:internalfontnumber;
c:quarterword):fourquarters;label 10;var ci:fourquarters;basec:integer;
begin if(not xtxligaturepresent)and(fontmapping[f]<>nil)then c:=
applytfmfontmapping(fontmapping[f],c);xtxligaturepresent:=false;
if not mltexenabledp then begin effectivecharinfo:=fontinfo[charbase[f]+
c].qqqq;goto 10;end;
if fontec[f]>=c then if fontbc[f]<=c then begin ci:=fontinfo[charbase[f]
+c].qqqq;if(ci.b0>0)then begin effectivecharinfo:=ci;goto 10;end;end;
if c>=eqtb[7892319].int then if c<=eqtb[7892320].int then if(eqtb[
6778152+c].hh.rh>0)then begin basec:=(eqtb[6778152+c].hh.rh mod 256);
if fontec[f]>=basec then if fontbc[f]<=basec then begin ci:=fontinfo[
charbase[f]+basec].qqqq;if(ci.b0>0)then begin effectivecharinfo:=ci;
goto 10;end;end;end;effectivecharinfo:=nullcharacter;10:end;{616:}
procedure printucscode(n:UnicodeScalar);var k:0..22;begin k:=0;
print(66223);repeat dig[k]:=n mod 16;n:=n div 16;incr(k);until n=0;
while k<4 do begin dig[k]:=0;incr(k);end;printthedigs(k);end;
procedure charwarning(f:internalfontnumber;c:integer);
var oldsetting:integer;
begin if eqtb[7892299].int>0 then begin oldsetting:=eqtb[7892293].int;
if(eTeXmode=1)and(eqtb[7892299].int>1)then eqtb[7892293].int:=1;
if eqtb[7892299].int>2 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66224);end else begin begindiagnostic;printnl(66224)end;
if c<65536 then print(c)else printchar(c);print(65566);
if((fontarea[f]=65535)or(fontarea[f]=65534))then printucscode(c)else
printhex(c);print(41);print(66225);print(fontname[f]);
if eqtb[7892299].int<3 then printchar(33);eqtb[7892293].int:=oldsetting;
if eqtb[7892299].int>2 then begin helpptr:=0;error;
end else enddiagnostic(false);end;end;{:616}{744:}
function newnativewordnode(f:internalfontnumber;n:integer):halfword;
var l:integer;q:halfword;
begin l:=6+(n*sizeof(UTF16code)+sizeof(memoryword)-1)div sizeof(
memoryword);q:=getnode(l);mem[q].hh.b0:=8;
if(eqtb[7892349].int>0)then mem[q].hh.b1:=41 else mem[q].hh.b1:=40;
mem[q+4].qqqq.b0:=l;mem[q+4].qqqq.b1:=f;mem[q+4].qqqq.b2:=n;
mem[q+4].qqqq.b3:=0;mem[q+5].ptr:=nullptr;newnativewordnode:=q;end;
function newnativecharacter(f:internalfontnumber;
c:UnicodeScalar):halfword;var p:halfword;i,len:integer;
begin if fontmapping[f]<>0 then begin if(c>65535)then begin if poolptr+2
>poolsize then overflow(65539,poolsize-initpoolptr);
end else begin if poolptr+1>poolsize then overflow(65539,poolsize-
initpoolptr);end;
begin if(c>65535)then begin strpool[poolptr]:=(c-65536)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(c)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=c;incr(poolptr);end;end;
len:=applymapping(fontmapping[f],addressof(strpool[strstart[(strptr)
-65536]]),(poolptr-strstart[(strptr)-65536]));
poolptr:=strstart[(strptr)-65536];i:=0;
while i<len do begin if(mappedtext[i]>=55296)and(mappedtext[i]<56320)
then begin c:=(mappedtext[i]-55296)*1024+mappedtext[i+1]+9216;
if mapchartoglyph(f,c)=0 then begin charwarning(f,c);end;i:=i+2;
end else begin if mapchartoglyph(f,mappedtext[i])=0 then begin
charwarning(f,mappedtext[i]);end;i:=i+1;end;end;
p:=newnativewordnode(f,len);
for i:=0 to len-1 do begin setnativechar(p,i,mappedtext[i]);
end end else begin if eqtb[7892299].int>0 then if mapchartoglyph(f,c)=0
then begin charwarning(f,c);end;p:=getnode(7);mem[p].hh.b0:=8;
mem[p].hh.b1:=40;mem[p+4].qqqq.b0:=7;mem[p+4].qqqq.b3:=0;
mem[p+5].ptr:=nullptr;mem[p+4].qqqq.b1:=f;
if c>65535 then begin mem[p+4].qqqq.b2:=2;
setnativechar(p,0,(c-65536)div 1024+55296);
setnativechar(p,1,(c-65536)mod 1024+56320);
end else begin mem[p+4].qqqq.b2:=1;setnativechar(p,0,c);end;end;
setnativemetrics(p,(eqtb[7892342].int>0));newnativecharacter:=p;end;
procedure fontfeaturewarning(featureNameP:voidpointer;featLen:integer;
settingNameP:voidpointer;setLen:integer);var i:integer;
begin begindiagnostic;printnl(66295);
if setLen>0 then begin print(66296);printutf8str(settingNameP,setLen);
print(66297);end;print(66298);printutf8str(featureNameP,featLen);
print(66299);i:=1;
while ord(nameoffile[i])<>0 do begin printrawchar(nameoffile[i],true);
incr(i);end;print(66179);enddiagnostic(false);end;
procedure fontmappingwarning(mappingNameP:voidpointer;
mappingNameLen:integer;warningType:integer);var i:integer;
begin begindiagnostic;
if warningType=0 then printnl(66300)else printnl(66301);
printutf8str(mappingNameP,mappingNameLen);print(66302);i:=1;
while ord(nameoffile[i])<>0 do begin printrawchar(nameoffile[i],true);
incr(i);end;case warningType of 1:print(66303);2:begin print(66304);
printnl(66305);end;others:print(66179)end;enddiagnostic(false);end;
procedure graphitewarning;var i:integer;begin begindiagnostic;
printnl(66306);i:=1;
while ord(nameoffile[i])<>0 do begin printrawchar(nameoffile[i],true);
incr(i);end;print(66307);enddiagnostic(false);end;
function loadnativefont(u:halfword;nom,aire:strnumber;
s:scaled):internalfontnumber;label 30;const firstmathfontdimen=10;
var k,numfontdimens:integer;fontengine:voidpointer;actualsize:scaled;
p:halfword;ascent,descent,fontslant,xht,capht:scaled;
f:internalfontnumber;fullname:strnumber;begin loadnativefont:=0;
fontengine:=findnativefont(nameoffile+1,s);if fontengine=0 then goto 30;
if s>=0 then actualsize:=s else begin if(s<>-1000)then actualsize:=
xnoverd(loadedfontdesignsize,-s,1000)else actualsize:=
loadedfontdesignsize;end;
begin if poolptr+namelength>poolsize then overflow(65539,poolsize-
initpoolptr);end;
for k:=1 to namelength do begin if(nameoffile[k]>65535)then begin
strpool[poolptr]:=(nameoffile[k]-65536)div 1024+55296;incr(poolptr);
strpool[poolptr]:=(nameoffile[k])mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=nameoffile[k];incr(poolptr);end;end;
fullname:=makestring;
for f:=1 to fontptr do if(fontarea[f]=nativefonttypeflag)and streqstr(
fontname[f],fullname)and(fontsize[f]=actualsize)then begin
releasefontengine(fontengine,nativefonttypeflag);begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;loadnativefont:=f;goto 30;end;
if(nativefonttypeflag=65534)and isOpenTypeMathFont(fontengine)then
numfontdimens:=firstmathfontdimen+55 else numfontdimens:=8;
if(fontptr=fontmax)or(fmemptr+numfontdimens>fontmemsize)then begin{602:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66199);end;sprintcs(u);printchar(61);
if filenamequotechar<>0 then printchar(filenamequotechar);
printfilename(nom,aire,curext);
if filenamequotechar<>0 then printchar(filenamequotechar);
if s>=0 then begin print(66130);printscaled(s);print(65697);
end else if s<>-1000 then begin print(66196);printint(-s);end;
print(66208);begin helpptr:=4;helpline[3]:=66209;helpline[2]:=66210;
helpline[1]:=66211;helpline[0]:=66212;end;error;goto 30;end{:602};end;
incr(fontptr);fontarea[fontptr]:=nativefonttypeflag;
fontname[fontptr]:=fullname;fontcheck[fontptr].b0:=0;
fontcheck[fontptr].b1:=0;fontcheck[fontptr].b2:=0;
fontcheck[fontptr].b3:=0;fontglue[fontptr]:=-268435455;
fontdsize[fontptr]:=loadedfontdesignsize;fontsize[fontptr]:=actualsize;
if(nativefonttypeflag=65535)then begin aatgetfontmetrics(fontengine,
addressof(ascent),addressof(descent),addressof(xht),addressof(capht),
addressof(fontslant))end else begin otgetfontmetrics(fontengine,
addressof(ascent),addressof(descent),addressof(xht),addressof(capht),
addressof(fontslant));end;heightbase[fontptr]:=ascent;
depthbase[fontptr]:=-descent;fontparams[fontptr]:=numfontdimens;
fontbc[fontptr]:=0;fontec[fontptr]:=65535;fontused[fontptr]:=false;
hyphenchar[fontptr]:=eqtb[7892310].int;
skewchar[fontptr]:=eqtb[7892311].int;parambase[fontptr]:=fmemptr-1;
fontlayoutengine[fontptr]:=fontengine;fontmapping[fontptr]:=0;
fontletterspace[fontptr]:=loadedfontletterspace;
p:=newnativecharacter(fontptr,32);s:=mem[p+1].int+loadedfontletterspace;
freenode(p,mem[p+4].qqqq.b0);fontinfo[fmemptr].int:=fontslant;
incr(fmemptr);fontinfo[fmemptr].int:=s;incr(fmemptr);
fontinfo[fmemptr].int:=s div 2;incr(fmemptr);
fontinfo[fmemptr].int:=s div 3;incr(fmemptr);fontinfo[fmemptr].int:=xht;
incr(fmemptr);fontinfo[fmemptr].int:=fontsize[fontptr];incr(fmemptr);
fontinfo[fmemptr].int:=s div 3;incr(fmemptr);
fontinfo[fmemptr].int:=capht;incr(fmemptr);
if numfontdimens=firstmathfontdimen+55 then begin fontinfo[fmemptr].int
:=numfontdimens;incr(fmemptr);
for k:=0 to 55 do begin fontinfo[fmemptr].int:=getotmathconstant(fontptr
,k);incr(fmemptr);end;end;fontmapping[fontptr]:=loadedfontmapping;
fontflags[fontptr]:=loadedfontflags;loadnativefont:=fontptr;30:end;
procedure dolocalelinebreaks(s:integer;len:integer);
var offs,prevOffs,i:integer;usepenalty,useskip:boolean;
begin if(eqtb[7892336].int=0)or(len=1)then begin mem[curlist.tailfield].
hh.rh:=newnativewordnode(mainf,len);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;
for i:=0 to len-1 do setnativechar(curlist.tailfield,i,nativetext[s+i]);
setnativemetrics(curlist.tailfield,(eqtb[7892342].int>0));
end else begin useskip:=eqtb[1205779].hh.rh<>membot;
usepenalty:=eqtb[7892337].int<>0 or not useskip;
linebreakstart(mainf,eqtb[7892336].int,nativetext+s,len);offs:=0;
repeat prevOffs:=offs;offs:=linebreaknext;
if offs>0 then begin if prevOffs<>0 then begin if usepenalty then begin
mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[7892337].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if useskip then begin mem[curlist.tailfield].hh.rh:=newparamglue(15);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;
mem[curlist.tailfield].hh.rh:=newnativewordnode(mainf,offs-prevOffs);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;
for i:=prevOffs to offs-1 do setnativechar(curlist.tailfield,i-prevOffs,
nativetext[s+i]);
setnativemetrics(curlist.tailfield,(eqtb[7892342].int>0));end;
until offs<0;end end;procedure badutf8warning;begin begindiagnostic;
printnl(66308);
if(curinput.namefield=0)then print(66309)else begin print(66310);
printint(line);end;print(66311);enddiagnostic(false);end;
function getinputnormalizationstate:integer;
begin if eqtb=nil then getinputnormalizationstate:=0 else
getinputnormalizationstate:=eqtb[7892344].int;end;
function gettracingfontsstate:integer;
begin gettracingfontsstate:=eqtb[7892347].int;end;{:744}{:1694}
function readfontinfo(u:halfword;nom,aire:strnumber;
s:scaled):internalfontnumber;label 30,11,45;var k:fontindex;
nametoolong:boolean;fileopened:boolean;
lf,lh,bc,ec,nw,nh,nd,ni,nl,nk,ne,np:halfword;f:internalfontnumber;
g:internalfontnumber;a,b,c,d:eightbits;qw:fourquarters;sw:scaled;
bchlabel:integer;bchar:0..256;z:scaled;alpha:integer;beta:1..16;
begin g:=0;fileopened:=false;packfilename(nom,aire,curext);
if eqtb[7892347].int>0 then begin begindiagnostic;printnl(66195);
printcstring(stringcast(nameoffile+1));print('"');
if s<0 then begin print(66196);printint(-s);end else begin print(66130);
printscaled(s);print(65697);end;enddiagnostic(false);end;
if quotedfilename then begin g:=loadnativefont(u,nom,aire,s);
if g<>0 then goto 30;end;{597:}{598:}
nametoolong:=(length(nom)>255)or(length(aire)>255);
if nametoolong then goto 11;packfilename(nom,aire,65626);
checkfortfmfontmapping;
if bopenin(tfmfile)then begin fileopened:=true{:598};{600:}
begin begin lf:=tfmtemp;if lf>127 then goto 11;tfmtemp:=getc(tfmfile);
lf:=lf*256+tfmtemp;end;tfmtemp:=getc(tfmfile);begin lh:=tfmtemp;
if lh>127 then goto 11;tfmtemp:=getc(tfmfile);lh:=lh*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin bc:=tfmtemp;if bc>127 then goto 11;
tfmtemp:=getc(tfmfile);bc:=bc*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin ec:=tfmtemp;if ec>127 then goto 11;tfmtemp:=getc(tfmfile);
ec:=ec*256+tfmtemp;end;if(bc>ec+1)or(ec>255)then goto 11;
if bc>255 then begin bc:=1;ec:=0;end;tfmtemp:=getc(tfmfile);
begin nw:=tfmtemp;if nw>127 then goto 11;tfmtemp:=getc(tfmfile);
nw:=nw*256+tfmtemp;end;tfmtemp:=getc(tfmfile);begin nh:=tfmtemp;
if nh>127 then goto 11;tfmtemp:=getc(tfmfile);nh:=nh*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin nd:=tfmtemp;if nd>127 then goto 11;
tfmtemp:=getc(tfmfile);nd:=nd*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin ni:=tfmtemp;if ni>127 then goto 11;tfmtemp:=getc(tfmfile);
ni:=ni*256+tfmtemp;end;tfmtemp:=getc(tfmfile);begin nl:=tfmtemp;
if nl>127 then goto 11;tfmtemp:=getc(tfmfile);nl:=nl*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin nk:=tfmtemp;if nk>127 then goto 11;
tfmtemp:=getc(tfmfile);nk:=nk*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin ne:=tfmtemp;if ne>127 then goto 11;tfmtemp:=getc(tfmfile);
ne:=ne*256+tfmtemp;end;tfmtemp:=getc(tfmfile);begin np:=tfmtemp;
if np>127 then goto 11;tfmtemp:=getc(tfmfile);np:=np*256+tfmtemp;end;
if lf<>6+lh+(ec-bc+1)+nw+nh+nd+ni+nl+nk+ne+np then goto 11;
if(nw=0)or(nh=0)or(nd=0)or(ni=0)then goto 11;end{:600};{601:}
lf:=lf-6-lh;if np<7 then lf:=lf+7-np;
if(fontptr=fontmax)or(fmemptr+lf>fontmemsize)then{602:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66199);end;sprintcs(u);printchar(61);
if filenamequotechar<>0 then printchar(filenamequotechar);
printfilename(nom,aire,curext);
if filenamequotechar<>0 then printchar(filenamequotechar);
if s>=0 then begin print(66130);printscaled(s);print(65697);
end else if s<>-1000 then begin print(66196);printint(-s);end;
print(66208);begin helpptr:=4;helpline[3]:=66209;helpline[2]:=66210;
helpline[1]:=66211;helpline[0]:=66212;end;error;goto 30;end{:602};
f:=fontptr+1;charbase[f]:=fmemptr-bc;widthbase[f]:=charbase[f]+ec+1;
heightbase[f]:=widthbase[f]+nw;depthbase[f]:=heightbase[f]+nh;
italicbase[f]:=depthbase[f]+nd;ligkernbase[f]:=italicbase[f]+ni;
kernbase[f]:=ligkernbase[f]+nl-256*(128);
extenbase[f]:=kernbase[f]+256*(128)+nk;
parambase[f]:=extenbase[f]+ne{:601};{603:}begin if lh<2 then goto 11;
begin tfmtemp:=getc(tfmfile);a:=tfmtemp;qw.b0:=a;tfmtemp:=getc(tfmfile);
b:=tfmtemp;qw.b1:=b;tfmtemp:=getc(tfmfile);c:=tfmtemp;qw.b2:=c;
tfmtemp:=getc(tfmfile);d:=tfmtemp;qw.b3:=d;fontcheck[f]:=qw;end;
tfmtemp:=getc(tfmfile);begin z:=tfmtemp;if z>127 then goto 11;
tfmtemp:=getc(tfmfile);z:=z*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
z:=z*256+tfmtemp;tfmtemp:=getc(tfmfile);z:=(z*16)+(tfmtemp div 16);
if z<65536 then goto 11;while lh>2 do begin tfmtemp:=getc(tfmfile);
tfmtemp:=getc(tfmfile);tfmtemp:=getc(tfmfile);tfmtemp:=getc(tfmfile);
decr(lh);end;fontdsize[f]:=z;
if s<>-1000 then if s>=0 then z:=s else begin savearitherror:=aritherror
;sw:=z;z:=xnoverd(z,-s,1000);
if aritherror or z>=134217728 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66199);end;sprintcs(u);printchar(61);
if filenamequotechar<>0 then printchar(filenamequotechar);
printfilename(nom,aire,curext);
if filenamequotechar<>0 then printchar(filenamequotechar);
if s>=0 then begin print(66130);printscaled(s);print(65697);
end else if s<>-1000 then begin print(66196);printint(-s);end;
print(66213);begin helpptr:=1;helpline[0]:=66214;end;error;z:=sw;end;
aritherror:=savearitherror;end;fontsize[f]:=z;end{:603};{604:}
for k:=fmemptr to widthbase[f]-1 do begin begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;qw.b0:=a;tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;
tfmtemp:=getc(tfmfile);c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);
d:=tfmtemp;qw.b3:=d;fontinfo[k].qqqq:=qw;end;
if(a>=nw)or(b div 16>=nh)or(b mod 16>=nd)or(c div 4>=ni)then goto 11;
case c mod 4 of 1:if d>=nl then goto 11;3:if d>=ne then goto 11;2:{605:}
begin begin if(d<bc)or(d>ec)then goto 11 end;
while d<k+bc-fmemptr do begin qw:=fontinfo[charbase[f]+d].qqqq;
if((qw.b2)mod 4)<>2 then goto 45;d:=qw.b3;end;
if d=k+bc-fmemptr then goto 11;45:end{:605};others:end;end{:604};{606:}
begin{607:}begin alpha:=16;while z>=8388608 do begin z:=z div 2;
alpha:=alpha+alpha;end;beta:=256 div alpha;alpha:=alpha*z;end{:607};
for k:=widthbase[f]to ligkernbase[f]-1 do begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fontinfo[k].int:=sw else if a=255 then fontinfo[k].int:=sw-
alpha else goto 11;end;if fontinfo[widthbase[f]].int<>0 then goto 11;
if fontinfo[heightbase[f]].int<>0 then goto 11;
if fontinfo[depthbase[f]].int<>0 then goto 11;
if fontinfo[italicbase[f]].int<>0 then goto 11;end{:606};{608:}
bchlabel:=32767;bchar:=256;
if nl>0 then begin for k:=ligkernbase[f]to kernbase[f]+256*(128)-1 do
begin begin tfmtemp:=getc(tfmfile);a:=tfmtemp;qw.b0:=a;
tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;tfmtemp:=getc(tfmfile);
c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);d:=tfmtemp;qw.b3:=d;
fontinfo[k].qqqq:=qw;end;
if a>128 then begin if 256*c+d>=nl then goto 11;
if a=255 then if k=ligkernbase[f]then bchar:=b;
end else begin if b<>bchar then begin begin if(b<bc)or(b>ec)then goto 11
end;qw:=fontinfo[charbase[f]+b].qqqq;if not(qw.b0>0)then goto 11;end;
if c<128 then begin begin if(d<bc)or(d>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+d].qqqq;if not(qw.b0>0)then goto 11;
end else if 256*(c-128)+d>=nk then goto 11;
if a<128 then if k-ligkernbase[f]+a+1>=nl then goto 11;end;end;
if a=255 then bchlabel:=256*c+d;end;
for k:=kernbase[f]+256*(128)to extenbase[f]-1 do begin tfmtemp:=getc(
tfmfile);a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fontinfo[k].int:=sw else if a=255 then fontinfo[k].int:=sw-
alpha else goto 11;end;{:608};{609:}
for k:=extenbase[f]to parambase[f]-1 do begin begin tfmtemp:=getc(
tfmfile);a:=tfmtemp;qw.b0:=a;tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;
tfmtemp:=getc(tfmfile);c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);
d:=tfmtemp;qw.b3:=d;fontinfo[k].qqqq:=qw;end;
if a<>0 then begin begin if(a<bc)or(a>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+a].qqqq;if not(qw.b0>0)then goto 11;end;
if b<>0 then begin begin if(b<bc)or(b>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+b].qqqq;if not(qw.b0>0)then goto 11;end;
if c<>0 then begin begin if(c<bc)or(c>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+c].qqqq;if not(qw.b0>0)then goto 11;end;
begin begin if(d<bc)or(d>ec)then goto 11 end;
qw:=fontinfo[charbase[f]+d].qqqq;if not(qw.b0>0)then goto 11;end;
end{:609};{610:}
begin for k:=1 to np do if k=1 then begin tfmtemp:=getc(tfmfile);
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
for k:=np+1 to 7 do fontinfo[parambase[f]+k-1].int:=0;end{:610};{611:}
if np>=7 then fontparams[f]:=np else fontparams[f]:=7;
hyphenchar[f]:=eqtb[7892310].int;skewchar[f]:=eqtb[7892311].int;
if bchlabel<nl then bcharlabel[f]:=bchlabel+ligkernbase[f]else
bcharlabel[f]:=0;fontbchar[f]:=bchar;fontfalsebchar[f]:=bchar;
if bchar<=ec then if bchar>=bc then begin qw:=fontinfo[charbase[f]+bchar
].qqqq;if(qw.b0>0)then fontfalsebchar[f]:=65536;end;fontname[f]:=nom;
fontarea[f]:=aire;fontbc[f]:=bc;fontec[f]:=ec;fontglue[f]:=-268435455;
charbase[f]:=charbase[f];widthbase[f]:=widthbase[f];
ligkernbase[f]:=ligkernbase[f];kernbase[f]:=kernbase[f];
extenbase[f]:=extenbase[f];decr(parambase[f]);fmemptr:=fmemptr+lf;
fontptr:=f;g:=f;fontmapping[f]:=loadtfmfontmapping;goto 30{:611};
end{:597};if g<>0 then goto 30;
if not quotedfilename then begin g:=loadnativefont(u,nom,aire,s);
if g<>0 then goto 30 end;11:if eqtb[7892334].int=0 then begin{596:}
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66199);end;sprintcs(u);printchar(61);
if filenamequotechar<>0 then printchar(filenamequotechar);
printfilename(nom,aire,curext);
if filenamequotechar<>0 then printchar(filenamequotechar);
if s>=0 then begin print(66130);printscaled(s);print(65697);
end else if s<>-1000 then begin print(66196);printint(-s);end;
if fileopened then print(66200)else if nametoolong then print(66201)else
print(66202);begin helpptr:=5;helpline[4]:=66203;helpline[3]:=66204;
helpline[2]:=66205;helpline[1]:=66206;helpline[0]:=66207;end;error{:596}
;end;30:if fileopened then bclose(tfmfile);
if eqtb[7892347].int>0 then begin if g=0 then begin begindiagnostic;
printnl(66197);enddiagnostic(false);
end else if fileopened then begin begindiagnostic;printnl(66198);
printcstring(stringcast(nameoffile+1));enddiagnostic(false);end;end;
readfontinfo:=g;end;{:595}{618:}
function newcharacter(f:internalfontnumber;c:UTF16code):halfword;
label 10;var p:halfword;ec:quarterword;
begin if((fontarea[f]=65535)or(fontarea[f]=65534))then begin
newcharacter:=newnativecharacter(f,c);goto 10;end;
ec:=effectivechar(false,f,c);
if fontbc[f]<=ec then if fontec[f]>=ec then if(fontinfo[charbase[f]+ec].
qqqq.b0>0)then begin p:=getavail;mem[p].hh.b0:=f;mem[p].hh.b1:=c;
newcharacter:=p;goto 10;end;charwarning(f,c);newcharacter:=-268435455;
10:end;{:618}{634:}procedure dviswap;
begin if dviptr>(2147483647-dvioffset)then begin curs:=-2;
fatalerror(66226);end;
if dvilimit=dvibufsize then begin writedvi(0,halfbuf-1);
dvilimit:=halfbuf;dvioffset:=dvioffset+dvibufsize;dviptr:=0;
end else begin writedvi(halfbuf,dvibufsize-1);dvilimit:=dvibufsize;end;
dvigone:=dvigone+halfbuf;end;{:634}{636:}procedure dvifour(x:integer);
begin if x>=0 then begin dvibuf[dviptr]:=x div 16777216;incr(dviptr);
if dviptr=dvilimit then dviswap;end else begin x:=x+1073741824;
x:=x+1073741824;begin dvibuf[dviptr]:=(x div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;x:=x mod 16777216;
begin dvibuf[dviptr]:=x div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;x:=x mod 65536;
begin dvibuf[dviptr]:=x div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=x mod 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
procedure dvitwo(s:UTF16code);begin begin dvibuf[dviptr]:=s div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=s mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;{:636}{637:}
procedure dvipop(l:integer);
begin if(l=dvioffset+dviptr)and(dviptr>0)then decr(dviptr)else begin
dvibuf[dviptr]:=142;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end;{:637}{638:}procedure dvinativefontdef(f:internalfontnumber);
var fontdeflength,i:integer;begin begin dvibuf[dviptr]:=252;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(f-1);
fontdeflength:=makefontdef(f);
for i:=0 to fontdeflength-1 do begin dvibuf[dviptr]:=xdvbuffer[i];
incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
procedure dvifontdef(f:internalfontnumber);var k:poolpointer;l:integer;
begin if((fontarea[f]=65535)or(fontarea[f]=65534))then dvinativefontdef(
f)else begin if f<=256 then begin begin dvibuf[dviptr]:=243;
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
dvifour(fontdsize[f]);begin dvibuf[dviptr]:=length(fontarea[f]);
incr(dviptr);if dviptr=dvilimit then dviswap;end;{639:}l:=0;
k:=strstart[(fontname[f])-65536];
while(l=0)and(k<strstart[(fontname[f]+1)-65536])do begin if strpool[k]=
58 then l:=k-strstart[(fontname[f])-65536];incr(k);end;
if l=0 then l:=length(fontname[f]);begin dvibuf[dviptr]:=l;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
for k:=strstart[(fontarea[f])-65536]to strstart[(fontarea[f]+1)-65536]-1
do begin dvibuf[dviptr]:=strpool[k];incr(dviptr);
if dviptr=dvilimit then dviswap;end;
for k:=strstart[(fontname[f])-65536]to strstart[(fontname[f])-65536]+l-1
do begin dvibuf[dviptr]:=strpool[k];incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;{:639};end;{:638}{643:}
procedure movement(w:scaled;o:eightbits);label 10,40,45,2,1;
var mstate:smallnumber;p,q:halfword;k:integer;begin q:=getnode(3);
mem[q+1].int:=w;mem[q+2].int:=dvioffset+dviptr;
if o=157 then begin mem[q].hh.rh:=downptr;downptr:=q;
end else begin mem[q].hh.rh:=rightptr;rightptr:=q;end;{647:}
p:=mem[q].hh.rh;mstate:=0;
while p<>-268435455 do begin if mem[p+1].int=w then{648:}
case mstate+mem[p].hh.lh of 3,4,15,16:if mem[p+2].int<dvigone then goto
45 else{649:}begin k:=mem[p+2].int-dvioffset;
if k<0 then k:=k+dvibufsize;dvibuf[k]:=dvibuf[k]+5;mem[p].hh.lh:=1;
goto 40;end{:649};5,9,11:if mem[p+2].int<dvigone then goto 45 else{650:}
begin k:=mem[p+2].int-dvioffset;if k<0 then k:=k+dvibufsize;
dvibuf[k]:=dvibuf[k]+10;mem[p].hh.lh:=2;goto 40;end{:650};
1,2,8,13:goto 40;others:end{:648}
else case mstate+mem[p].hh.lh of 1:mstate:=6;2:mstate:=12;8,13:goto 45;
others:end;p:=mem[p].hh.rh;end;45:{:647};{646:}mem[q].hh.lh:=3;
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
if dviptr=dvilimit then dviswap;end;goto 10{:646};40:{645:}
mem[q].hh.lh:=mem[p].hh.lh;
if mem[q].hh.lh=1 then begin begin dvibuf[dviptr]:=o+4;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
while mem[q].hh.rh<>p do begin q:=mem[q].hh.rh;
case mem[q].hh.lh of 3:mem[q].hh.lh:=5;4:mem[q].hh.lh:=6;others:end;end;
end else begin begin dvibuf[dviptr]:=o+9;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
while mem[q].hh.rh<>p do begin q:=mem[q].hh.rh;
case mem[q].hh.lh of 3:mem[q].hh.lh:=4;5:mem[q].hh.lh:=6;others:end;end;
end{:645};10:end;{:643}{651:}procedure prunemovements(l:integer);
label 30,10;var p:halfword;
begin while downptr<>-268435455 do begin if mem[downptr+2].int<l then
goto 30;p:=downptr;downptr:=mem[p].hh.rh;freenode(p,3);end;
30:while rightptr<>-268435455 do begin if mem[rightptr+2].int<l then
goto 10;p:=rightptr;rightptr:=mem[p].hh.rh;freenode(p,3);end;10:end;
{:651}{654:}procedure vlistout;forward;{:654}{655:}{1431:}
procedure specialout(p:halfword);var oldsetting:0..21;k:poolpointer;
h:halfword;q,r:halfword;oldmode:integer;
begin if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
doingspecial:=true;oldsetting:=selector;
if mem[p].hh.b1=4 then begin{1434:}q:=getavail;mem[q].hh.lh:=4194429;
r:=getavail;mem[q].hh.rh:=r;mem[r].hh.lh:=34749089;begintokenlist(q,5);
begintokenlist(mem[p+1].hh.rh,18);q:=getavail;mem[q].hh.lh:=2097275;
begintokenlist(q,5);oldmode:=curlist.modefield;curlist.modefield:=0;
curcs:=writeloc;q:=scantoks(false,true);curlist.modefield:=oldmode;
gettoken;if curtok<>34749089 then{1435:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65947);end;begin helpptr:=2;helpline[1]:=66781;helpline[0]:=66447;
end;error;repeat gettoken;until curtok=34749089;end{:1435};
endtokenlist{:1434};h:=defref;end else h:=mem[p+1].hh.rh;selector:=21;
showtokenlist(mem[h].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(65539,poolsize-initpoolptr);
end;
if(poolptr-strstart[(strptr)-65536])<256 then begin begin dvibuf[dviptr]
:=239;incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(poolptr-strstart[(strptr)-65536]);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=242;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
dvifour((poolptr-strstart[(strptr)-65536]));end;
for k:=strstart[(strptr)-65536]to poolptr-1 do begin dvibuf[dviptr]:=
strpool[k];incr(dviptr);if dviptr=dvilimit then dviswap;end;
poolptr:=strstart[(strptr)-65536];
if mem[p].hh.b1=4 then flushlist(defref);doingspecial:=false;end;{:1431}
{1433:}procedure writeout(p:halfword);var oldsetting:0..21;
oldmode:integer;j:smallnumber;k:integer;q,r:halfword;d:integer;
clobbered:boolean;runsystemret:integer;begin{1434:}q:=getavail;
mem[q].hh.lh:=4194429;r:=getavail;mem[q].hh.rh:=r;
mem[r].hh.lh:=34749089;begintokenlist(q,5);
begintokenlist(mem[p+1].hh.rh,18);q:=getavail;mem[q].hh.lh:=2097275;
begintokenlist(q,5);oldmode:=curlist.modefield;curlist.modefield:=0;
curcs:=writeloc;q:=scantoks(false,true);curlist.modefield:=oldmode;
gettoken;if curtok<>34749089 then{1435:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65947);end;begin helpptr:=2;helpline[1]:=66781;helpline[0]:=66447;
end;error;repeat gettoken;until curtok=34749089;end{:1435};
endtokenlist{:1434};oldsetting:=selector;j:=mem[p+1].hh.lh;
if j=18 then selector:=21 else if writeopen[j]then selector:=j else
begin if(j=17)and(selector=19)then selector:=18;printnl(65626);end;
tokenshow(defref);println;flushlist(defref);
if j=18 then begin if(eqtb[7892293].int<=0)then selector:=18 else
selector:=19;if not logopened then selector:=17;printnl(66773);
for d:=0 to(poolptr-strstart[(strptr)-65536])-1 do begin print(strpool[
strstart[(strptr)-65536]+d]);end;print(66774);
if shellenabledp then begin begin if poolptr+1>poolsize then overflow(
65539,poolsize-initpoolptr);end;
begin if(0>65535)then begin strpool[poolptr]:=(-65536)div 1024+55296;
incr(poolptr);strpool[poolptr]:=(0)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=0;incr(poolptr);end;end;
clobbered:=false;
for d:=0 to(poolptr-strstart[(strptr)-65536])-1 do begin if(strpool[
strstart[(strptr)-65536]+d]=0)and(d<(poolptr-strstart[(strptr)-65536])-1
)then clobbered:=true;end;
if clobbered then print(66775)else begin if nameoffile then libcfree(
nameoffile);nameoffile:=xmalloc((poolptr-strstart[(strptr)-65536])*3+2);
k:=0;
for d:=0 to(poolptr-strstart[(strptr)-65536])-1 do begin c:=strpool[
strstart[(strptr)-65536]+d];incr(k);
if k<=maxint then begin if(c<128)then nameoffile[k]:=c else if(c<2048)
then begin nameoffile[k]:=192+c div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<55296)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;
end else if(c<56320)and(k+3<maxint)then begin nameoffile[k]:=240+(c
-55232)div 4096;incr(k);nameoffile[k]:=128+((c-55232)mod 4096)div 4;
incr(k);nameoffile[k]:=128+(c-55232)mod 4*16;incr(k);nameoffile[k]:=128;
end else if(c<57344)and(k>4)then begin decr(k);
nameoffile[k-1]:=nameoffile[k-1]+(c-56320)div 64;
nameoffile[k]:=nameoffile[k]+(c-56320)mod 64;
end else if(c<65536)then begin nameoffile[k]:=224+c div 4096;incr(k);
nameoffile[k]:=128+(c mod 4096)div 64;incr(k);
nameoffile[k]:=128+c mod 64;end else begin nameoffile[k]:=239;incr(k);
nameoffile[k]:=191;incr(k);nameoffile[k]:=189;end end end;
nameoffile[k+1]:=0;
runsystemret:=runsystem(conststringcast(nameoffile+1));
if runsystemret=-1 then print(66776)else if runsystemret=0 then print(
66777)else if runsystemret=1 then print(66778)else if runsystemret=2
then print(66779)end;end else begin print(66780);end;printchar(46);
printnl(65626);println;poolptr:=strstart[(strptr)-65536];end;
selector:=oldsetting;end;{:1433}{1436:}procedure picout(p:halfword);
var oldsetting:0..21;i:integer;k:poolpointer;
begin if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
oldsetting:=selector;selector:=21;print(66782);print(66783);
printscaled(mem[p+5].hh.lh);print(32);printscaled(mem[p+5].hh.rh);
print(32);printscaled(mem[p+6].hh.lh);print(32);
printscaled(mem[p+6].hh.rh);print(32);printscaled(mem[p+7].hh.lh);
print(32);printscaled(mem[p+7].hh.rh);print(32);print(66784);
printint(mem[p+4].hh.b1);print(32);
case mem[p+8].hh.b0 of 1:print(66785);2:print(66786);3:print(66787);
5:print(66788);4:print(66789);others:;end;print(40);
for i:=0 to mem[p+4].hh.b0-1 do printrawchar(picpathbyte(p,i),true);
print(41);selector:=oldsetting;
if(poolptr-strstart[(strptr)-65536])<256 then begin begin dvibuf[dviptr]
:=239;incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(poolptr-strstart[(strptr)-65536]);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=242;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
dvifour((poolptr-strstart[(strptr)-65536]));end;
for k:=strstart[(strptr)-65536]to poolptr-1 do begin dvibuf[dviptr]:=
strpool[k];incr(dviptr);if dviptr=dvilimit then dviswap;end;
poolptr:=strstart[(strptr)-65536];end;procedure outwhat(p:halfword);
var j:smallnumber;oldsetting:0..21;
begin case mem[p].hh.b1 of 0,1,2:{1437:}
if not doingleaders then begin j:=mem[p+1].hh.lh;
if mem[p].hh.b1=1 then writeout(p)else begin if writeopen[j]then begin
aclose(writefile[j]);writeopen[j]:=false;end;
if mem[p].hh.b1=2 then else if j<16 then begin curname:=mem[p+1].hh.rh;
curarea:=mem[p+2].hh.lh;curext:=mem[p+2].hh.rh;
if curext=65626 then curext:=66180;packfilename(curname,curarea,curext);
while not kpseoutnameok(stringcast(nameoffile+1))or not aopenout(
writefile[j])do promptfilename(66791,66180);writeopen[j]:=true;
if logopened and texmfyesno('log_openout')then begin oldsetting:=
selector;if(eqtb[7892293].int<=0)then selector:=18 else selector:=19;
printnl(66792);printint(j);print(66793);
printfilename(curname,curarea,curext);print(66179);printnl(65626);
println;selector:=oldsetting;end;end;end;end{:1437};3,4:specialout(p);
5:;others:confusion(66790)end;end;{:1436}{1529:}
function newedge(s:smallnumber;w:scaled):halfword;var p:halfword;
begin p:=getnode(3);mem[p].hh.b0:=14;mem[p].hh.b1:=s;mem[p+1].int:=w;
mem[p+2].int:=0;newedge:=p;end;{:1529}{1533:}
function reverse(thisbox,t:halfword;var curg:scaled;
var curglue:real):halfword;label 21,15,30;var l:halfword;p:halfword;
q:halfword;gorder:glueord;gsign:0..2;gluetemp:real;m,n:halfword;
begin gorder:=mem[thisbox+5].hh.b1;gsign:=mem[thisbox+5].hh.b0;l:=t;
p:=tempptr;m:=-268435455;n:=-268435455;
while true do begin while p<>-268435455 do{1534:}
21:if(p>=himemmin)then repeat f:=mem[p].hh.b0;c:=mem[p].hh.b1;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true
,f,c)].qqqq.b0].int;q:=mem[p].hh.rh;mem[p].hh.rh:=l;l:=p;p:=q;
until not(p>=himemmin)else{1535:}begin q:=mem[p].hh.rh;
case mem[p].hh.b0 of 0,1,2,11:rulewd:=mem[p+1].int;{1536:}
8:if(((mem[p].hh.b1>=40)and(mem[p].hh.b1<=41)))or(mem[p].hh.b1=42)or(mem
[p].hh.b1=43)or(mem[p].hh.b1=44)then rulewd:=mem[p+1].int else goto 15;
{:1536}{1537:}10:begin g:=mem[p+1].hh.lh;rulewd:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;rulewd:=rulewd+curg;{1509:}
if(((gsign=1)and(mem[g].hh.b0=gorder))or((gsign=2)and(mem[g].hh.b1=
gorder)))then begin begin if mem[g].hh.rh=-268435455 then freenode(g,4)
else decr(mem[g].hh.rh);end;
if mem[p].hh.b1<100 then begin mem[p].hh.b0:=11;mem[p+1].int:=rulewd;
end else begin g:=getnode(4);mem[g].hh.b0:=4;mem[g].hh.b1:=4;
mem[g+1].int:=rulewd;mem[g+2].int:=0;mem[g+3].int:=0;mem[p+1].hh.lh:=g;
end;end{:1509};end;{:1537}{1538:}6:begin flushnodelist(mem[p+1].hh.rh);
tempptr:=p;p:=getavail;mem[p]:=mem[tempptr+1];mem[p].hh.rh:=q;
freenode(tempptr,2);goto 21;end;{:1538}{1539:}
9:begin rulewd:=mem[p+1].int;
if odd(mem[p].hh.b1)then if mem[LRptr].hh.lh<>(4*(mem[p].hh.b1 div 4)+3)
then begin mem[p].hh.b0:=11;incr(LRproblems);
end else begin begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if n>-268435455 then begin decr(n);decr(mem[p].hh.b1);
end else begin mem[p].hh.b0:=11;if m>-268435455 then decr(m)else{1540:}
begin freenode(p,3);mem[t].hh.rh:=q;mem[t+1].int:=rulewd;
mem[t+2].int:=-curh-rulewd;goto 30;end{:1540};end;
end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(n>-268435455)or((mem[p].hh.b1 div 8)<>curdir)then begin incr(n);
incr(mem[p].hh.b1);end else begin mem[p].hh.b0:=11;incr(m);end;end;end;
{:1539}14:confusion(66930);others:goto 15 end;curh:=curh+rulewd;
15:mem[p].hh.rh:=l;
if mem[p].hh.b0=11 then if(rulewd=0)or(l=-268435455)then begin freenode(
p,3);p:=l;end;l:=p;p:=q;end{:1535}{:1534};
if(t=-268435455)and(m=-268435455)and(n=-268435455)then goto 30;
p:=newmath(0,mem[LRptr].hh.lh);LRproblems:=LRproblems+10000;end;
30:reverse:=l;end;{:1533}procedure hlistout;
label 21,13,14,15,22,40,1236,1237;var baseline:scaled;leftedge:scaled;
saveh,savev:scaled;thisbox:halfword;gorder:glueord;gsign:0..2;
p:halfword;saveloc:integer;leaderbox:halfword;leaderwd:scaled;lx:scaled;
outerdoingleaders:boolean;edge:scaled;prevp:halfword;len:integer;
q,r:halfword;k,j:integer;gluetemp:real;curglue:real;curg:scaled;
begin curg:=0;curglue:=0.0;thisbox:=tempptr;
gorder:=mem[thisbox+5].hh.b1;gsign:=mem[thisbox+5].hh.b0;
if eqtb[7892348].int>1 then begin{656:}p:=mem[thisbox+5].hh.rh;
prevp:=thisbox+5;
while p<>-268435455 do begin if mem[p].hh.rh<>-268435455 then begin if((
(p)<>-268435455)and(not(p>=himemmin))and(mem[p].hh.b0=8)and(((mem[p].hh.
b1>=40)and(mem[p].hh.b1<=41))))and(fontletterspace[mem[p+4].qqqq.b1]=0)
then begin r:=p;k:=mem[r+4].qqqq.b2;q:=mem[p].hh.rh;1236:{657:}
while(q<>-268435455)and not(q>=himemmin)and((mem[q].hh.b0=12)or(mem[q].
hh.b0=3)or(mem[q].hh.b0=4)or(mem[q].hh.b0=5)or((mem[q].hh.b0=8)and(mem[q
].hh.b1<=4)))do q:=mem[q].hh.rh{:657};
if(q<>-268435455)and not(q>=himemmin)then begin if(mem[q].hh.b0=10)and(
mem[q].hh.b1=0)then begin if(mem[q+1].hh.lh=fontglue[mem[r+4].qqqq.b1])
then begin q:=mem[q].hh.rh;{657:}
while(q<>-268435455)and not(q>=himemmin)and((mem[q].hh.b0=12)or(mem[q].
hh.b0=3)or(mem[q].hh.b0=4)or(mem[q].hh.b0=5)or((mem[q].hh.b0=8)and(mem[q
].hh.b1<=4)))do q:=mem[q].hh.rh{:657};
if(((q)<>-268435455)and(not(q>=himemmin))and(mem[q].hh.b0=8)and(((mem[q]
.hh.b1>=40)and(mem[q].hh.b1<=41))))and(mem[q+4].qqqq.b1=mem[r+4].qqqq.b1
)then begin p:=q;k:=k+1+mem[q+4].qqqq.b2;q:=mem[q].hh.rh;goto 1236;
end end else q:=mem[q].hh.rh;
if(q<>-268435455)and not(q>=himemmin)and(mem[q].hh.b0=11)and(mem[q].hh.
b1=3)then begin q:=mem[q].hh.rh;{657:}
while(q<>-268435455)and not(q>=himemmin)and((mem[q].hh.b0=12)or(mem[q].
hh.b0=3)or(mem[q].hh.b0=4)or(mem[q].hh.b0=5)or((mem[q].hh.b0=8)and(mem[q
].hh.b1<=4)))do q:=mem[q].hh.rh{:657};
if(((q)<>-268435455)and(not(q>=himemmin))and(mem[q].hh.b0=8)and(((mem[q]
.hh.b1>=40)and(mem[q].hh.b1<=41))))and(mem[q+4].qqqq.b1=mem[r+4].qqqq.b1
)then begin p:=q;k:=k+1+mem[q+4].qqqq.b2;q:=mem[q].hh.rh;goto 1236;
end end;goto 1237;end;
if(((q)<>-268435455)and(not(q>=himemmin))and(mem[q].hh.b0=8)and(((mem[q]
.hh.b1>=40)and(mem[q].hh.b1<=41))))and(mem[q+4].qqqq.b1=mem[r+4].qqqq.b1
)then begin p:=q;q:=mem[q].hh.rh;goto 1236;end end;
1237:if p<>r then begin begin if poolptr+k>poolsize then overflow(65539,
poolsize-initpoolptr);end;k:=0;q:=r;
while true do begin if mem[q].hh.b0=8 then begin if(((mem[q].hh.b1>=40)
and(mem[q].hh.b1<=41)))then begin for j:=0 to mem[q+4].qqqq.b2-1 do
begin if(getnativechar(q,j)>65535)then begin strpool[poolptr]:=(
getnativechar(q,j)-65536)div 1024+55296;incr(poolptr);
strpool[poolptr]:=(getnativechar(q,j))mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=getnativechar(q,j);incr(poolptr);end;
end;k:=k+mem[q+1].int;
end end else if mem[q].hh.b0=10 then begin begin if(32>65535)then begin
strpool[poolptr]:=(-65504)div 1024+55296;incr(poolptr);
strpool[poolptr]:=(32)mod 1024+56320;incr(poolptr);
end else begin strpool[poolptr]:=32;incr(poolptr);end;end;
g:=mem[q+1].hh.lh;k:=k+mem[g+1].int;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin k:=k+round(mem[thisbox+6].gr*mem[g+2].int)end end else begin if
mem[g].hh.b1=gorder then begin k:=k-round(mem[thisbox+6].gr*mem[g+3].int
)end end end end else if mem[q].hh.b0=11 then begin k:=k+mem[q+1].int;
end;if q=p then break else q:=mem[q].hh.rh;end;
q:=newnativewordnode(mem[r+4].qqqq.b1,(poolptr-strstart[(strptr)-65536])
);mem[q].hh.b1:=mem[r].hh.b1;
for j:=0 to(poolptr-strstart[(strptr)-65536])-1 do setnativechar(q,j,
strpool[strstart[(strptr)-65536]+j]);mem[q+1].int:=k;
setjustifiednativeglyphs(q);mem[prevp].hh.rh:=q;
mem[q].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=-268435455;prevp:=r;
p:=mem[r].hh.rh;
while p<>-268435455 do begin if not(p>=himemmin)and((mem[p].hh.b0=12)or(
mem[p].hh.b0=3)or(mem[p].hh.b0=4)or(mem[p].hh.b0=5)or((mem[p].hh.b0=8)
and(mem[p].hh.b1<=4)))then begin mem[prevp].hh.rh:=mem[p].hh.rh;
mem[p].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=p;q:=p;end;prevp:=p;
p:=mem[p].hh.rh;end;flushnodelist(r);poolptr:=strstart[(strptr)-65536];
p:=q;end end;prevp:=p;end;p:=mem[p].hh.rh;end{:656};end;
p:=mem[thisbox+5].hh.rh;incr(curs);
if curs>0 then begin dvibuf[dviptr]:=141;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if curs>maxpush then maxpush:=curs;
saveloc:=dvioffset+dviptr;baseline:=curv;prevp:=thisbox+5;{1524:}
if(eTeXmode=1)then begin{1520:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1520};
if(mem[thisbox].hh.b1)=2 then if curdir=1 then begin curdir:=0;
curh:=curh-mem[thisbox+1].int;end else mem[thisbox].hh.b1:=0;
if(curdir=1)and((mem[thisbox].hh.b1)<>1)then{1531:}begin saveh:=curh;
tempptr:=p;p:=newkern(0);mem[p+2].hh.lh:=0;mem[prevp].hh.rh:=p;curh:=0;
mem[p].hh.rh:=reverse(thisbox,-268435455,curg,curglue);
mem[p+1].int:=-curh;curh:=saveh;mem[thisbox].hh.b1:=1;end{:1531};
end{:1524};leftedge:=curh;{1725:}synctexhlist(thisbox);{:1725};
while p<>-268435455 do{658:}
21:if(p>=himemmin)then begin if curh<>dvih then begin movement(curh-dvih
,143);dvih:=curh;end;if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;repeat f:=mem[p].hh.b0;c:=mem[p].hh.b1;
if(p<>memtop-12)and(fontmapping[f]<>nil)then c:=applytfmfontmapping(
fontmapping[f],c);if f<>dvif then{659:}
begin if not fontused[f]then begin dvifontdef(f);fontused[f]:=true;end;
if f<=64 then begin dvibuf[dviptr]:=f+170;incr(dviptr);
if dviptr=dvilimit then dviswap;
end else if f<=256 then begin begin dvibuf[dviptr]:=235;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=f-1;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=236;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=(f-1)div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(f-1)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;dvif:=f;end{:659};
if fontec[f]>=c then if fontbc[f]<=c then if(fontinfo[charbase[f]+c].
qqqq.b0>0)then begin if c>=128 then begin dvibuf[dviptr]:=128;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=c;incr(dviptr);if dviptr=dvilimit then dviswap;
end;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+c].qqqq.b0].int;
goto 22;end;if mltexenabledp then{1695:}begin{1697:}
if c>=eqtb[7892319].int then if c<=eqtb[7892320].int then if(eqtb[
6778152+c].hh.rh>0)then begin basec:=(eqtb[6778152+c].hh.rh mod 256);
accentc:=(eqtb[6778152+c].hh.rh div 256);
if(fontec[f]>=basec)then if(fontbc[f]<=basec)then if(fontec[f]>=accentc)
then if(fontbc[f]<=accentc)then begin iac:=fontinfo[charbase[f]+
effectivechar(true,f,accentc)].qqqq;
ibc:=fontinfo[charbase[f]+effectivechar(true,f,basec)].qqqq;
if(ibc.b0>0)then if(iac.b0>0)then goto 40;end;begindiagnostic;
printnl(66975);print(c);print(66647);print(accentc);print(32);
print(basec);print(66225);print(fontname[f]);printchar(33);
enddiagnostic(false);goto 22;end;begindiagnostic;printnl(66224);
print(66974);print(c);print(66225);print(fontname[f]);printchar(33);
enddiagnostic(false);goto 22{:1697};40:{1698:}
if eqtb[7892299].int>99 then begin begindiagnostic;printnl(66976);
print(c);print(66647);print(accentc);print(32);print(basec);
print(66225);print(fontname[f]);printchar(46);enddiagnostic(false);
end{:1698};{1699:}basexheight:=fontinfo[5+parambase[f]].int;
baseslant:=fontinfo[1+parambase[f]].int/65536.0;accentslant:=baseslant;
basewidth:=fontinfo[widthbase[f]+ibc.b0].int;
baseheight:=fontinfo[heightbase[f]+(ibc.b1)div 16].int;
accentwidth:=fontinfo[widthbase[f]+iac.b0].int;
accentheight:=fontinfo[heightbase[f]+(iac.b1)div 16].int;
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
dvih:=curh{:1699};end{:1695};22:prevp:=mem[prevp].hh.rh;p:=mem[p].hh.rh;
until not(p>=himemmin);{1728:}synctexcurrent;{:1728};dvih:=curh;
end else{660:}begin case mem[p].hh.b0 of 0,1:{661:}
if mem[p+5].hh.rh=-268435455 then begin{1727:}
if mem[p].hh.b0=1 then begin synctexvoidvlist(p,thisbox);
end else begin synctexvoidhlist(p,thisbox);end;{:1727};
curh:=curh+mem[p+1].int;end else begin saveh:=dvih;savev:=dviv;
curv:=baseline+mem[p+4].int;tempptr:=p;edge:=curh+mem[p+1].int;
if curdir=1 then curh:=edge;
if mem[p].hh.b0=1 then vlistout else hlistout;dvih:=saveh;dviv:=savev;
curh:=edge;curv:=baseline;end{:661};2:begin ruleht:=mem[p+3].int;
ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;goto 14;end;8:{1430:}
begin case mem[p].hh.b1 of 40,41,42:begin if curh<>dvih then begin
movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
f:=mem[p+4].qqqq.b1;if f<>dvif then{659:}
begin if not fontused[f]then begin dvifontdef(f);fontused[f]:=true;end;
if f<=64 then begin dvibuf[dviptr]:=f+170;incr(dviptr);
if dviptr=dvilimit then dviswap;
end else if f<=256 then begin begin dvibuf[dviptr]:=235;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=f-1;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=236;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=(f-1)div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(f-1)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;dvif:=f;end{:659};
if mem[p].hh.b1=42 then begin begin dvibuf[dviptr]:=253;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(mem[p+1].int);dvitwo(1);
dvifour(0);dvifour(0);dvitwo(mem[p+4].qqqq.b2);curh:=curh+mem[p+1].int;
end else begin if mem[p].hh.b1=41 then begin if(mem[p+4].qqqq.b2>0)or(
mem[p+5].ptr<>nullptr)then begin begin dvibuf[dviptr]:=254;incr(dviptr);
if dviptr=dvilimit then dviswap;end;len:=mem[p+4].qqqq.b2;dvitwo(len);
for k:=0 to len-1 do begin dvitwo(getnativechar(p,k));end;
len:=makexdvglypharraydata(p);
for k:=0 to len-1 do begin dvibuf[dviptr]:=xdvbufferbyte(k);
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end end else begin if mem[p+5].ptr<>nullptr then begin begin dvibuf[
dviptr]:=253;incr(dviptr);if dviptr=dvilimit then dviswap;end;
len:=makexdvglypharraydata(p);
for k:=0 to len-1 do begin dvibuf[dviptr]:=xdvbufferbyte(k);
incr(dviptr);if dviptr=dvilimit then dviswap;end;end end;
curh:=curh+mem[p+1].int;end;dvih:=curh;end;43,44:begin saveh:=dvih;
savev:=dviv;curv:=baseline;edge:=curh+mem[p+1].int;picout(p);
dvih:=saveh;dviv:=savev;curh:=edge;curv:=baseline;end;23:{1427:}
begin pdflastxpos:=curh+4736286;pdflastypos:=curpageheight-curv-4736286;
end{:1427};others:outwhat(p)end end{:1430};10:{663:}
begin g:=mem[p+1].hh.lh;rulewd:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;rulewd:=rulewd+curg;if(eTeXmode=1)then{1509:}
if(((gsign=1)and(mem[g].hh.b0=gorder))or((gsign=2)and(mem[g].hh.b1=
gorder)))then begin begin if mem[g].hh.rh=-268435455 then freenode(g,4)
else decr(mem[g].hh.rh);end;
if mem[p].hh.b1<100 then begin mem[p].hh.b0:=11;mem[p+1].int:=rulewd;
end else begin g:=getnode(4);mem[g].hh.b0:=4;mem[g].hh.b1:=4;
mem[g+1].int:=rulewd;mem[g+2].int:=0;mem[g+3].int:=0;mem[p+1].hh.lh:=g;
end;end{:1509};if mem[p].hh.b1>=100 then{664:}
begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=2 then begin ruleht:=mem[leaderbox+3].int;
ruledp:=mem[leaderbox+2].int;goto 14;end;leaderwd:=mem[leaderbox+1].int;
if(leaderwd>0)and(rulewd>0)then begin rulewd:=rulewd+10;
if curdir=1 then curh:=curh-10;edge:=curh+rulewd;lx:=0;{665:}
if mem[p].hh.b1=100 then begin saveh:=curh;
curh:=leftedge+leaderwd*((curh-leftedge)div leaderwd);
if curh<saveh then curh:=curh+leaderwd;
end else begin lq:=rulewd div leaderwd;lr:=rulewd mod leaderwd;
if mem[p].hh.b1=101 then curh:=curh+(lr div 2)else begin lx:=lr div(lq+1
);curh:=curh+((lr-(lq-1)*lx)div 2);end;end{:665};
while curh+leaderwd<=edge do{666:}
begin curv:=baseline+mem[leaderbox+4].int;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
savev:=dviv;if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;
end;saveh:=dvih;tempptr:=leaderbox;if curdir=1 then curh:=curh+leaderwd;
outerdoingleaders:=doingleaders;doingleaders:=true;
if mem[leaderbox].hh.b0=1 then vlistout else hlistout;
doingleaders:=outerdoingleaders;dviv:=savev;dvih:=saveh;curv:=baseline;
curh:=saveh+leaderwd+lx;end{:666};
if curdir=1 then curh:=edge else curh:=edge-10;goto 15;end;end{:664};
goto 13;end{:663};40:begin curh:=curh+mem[p+1].int;end;11:begin{1730:}
synctexkern(p,thisbox);{:1730};curh:=curh+mem[p+1].int;end;
9:begin{1731:}synctexmath(p,thisbox);{:1731};{1526:}
begin if(eTeXmode=1)then{1527:}
begin if odd(mem[p].hh.b1)then if mem[LRptr].hh.lh=(4*(mem[p].hh.b1 div
4)+3)then begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;
end else begin if mem[p].hh.b1>4 then incr(LRproblems);
end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(mem[p].hh.b1 div 8)<>curdir then{1532:}begin saveh:=curh;
tempptr:=mem[p].hh.rh;rulewd:=mem[p+1].int;freenode(p,3);
curdir:=1-curdir;p:=newedge(curdir,rulewd);mem[prevp].hh.rh:=p;
curh:=curh-leftedge+rulewd;
mem[p].hh.rh:=reverse(thisbox,newedge(1-curdir,0),curg,curglue);
mem[p+2].int:=curh;curdir:=1-curdir;curh:=saveh;goto 21;end{:1532};end;
mem[p].hh.b0:=11;end{:1527};curh:=curh+mem[p+1].int;end{:1526};end;
6:{692:}begin mem[memtop-12]:=mem[p+1];
mem[memtop-12].hh.rh:=mem[p].hh.rh;p:=memtop-12;
xtxligaturepresent:=true;goto 21;end{:692};{1530:}
14:begin curh:=curh+mem[p+1].int;leftedge:=curh+mem[p+2].int;
curdir:=mem[p].hh.b1;end;{:1530}others:end;goto 15;14:{662:}
if(ruleht=-1073741824)then ruleht:=mem[thisbox+3].int;
if(ruledp=-1073741824)then ruledp:=mem[thisbox+2].int;
ruleht:=ruleht+ruledp;
if(ruleht>0)and(rulewd>0)then begin if curh<>dvih then begin movement(
curh-dvih,143);dvih:=curh;end;curv:=baseline+ruledp;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=132;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);curv:=baseline;dvih:=dvih+rulewd;
end{:662};13:begin curh:=curh+rulewd;{1729:}
synctexhorizontalruleorglue(p,thisbox);{:1729};end;15:prevp:=p;
p:=mem[p].hh.rh;end{:660}{:658};{1726:}synctextsilh(thisbox);{:1726};
{1525:}if(eTeXmode=1)then begin{1528:}
begin while mem[LRptr].hh.lh<>0 do begin if mem[LRptr].hh.lh>4 then
LRproblems:=LRproblems+10000;begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;end;
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;end{:1528};
if(mem[thisbox].hh.b1)=2 then curdir:=1;end{:1525};
prunemovements(saveloc);if curs>0 then dvipop(saveloc);decr(curs);end;
{:655}{667:}procedure vlistout;label 13,14,15;var leftedge:scaled;
topedge:scaled;saveh,savev:scaled;thisbox:halfword;gorder:glueord;
gsign:0..2;p:halfword;saveloc:integer;leaderbox:halfword;
leaderht:scaled;lx:scaled;outerdoingleaders:boolean;edge:scaled;
gluetemp:real;curglue:real;curg:scaled;upwards:boolean;begin curg:=0;
curglue:=0.0;thisbox:=tempptr;gorder:=mem[thisbox+5].hh.b1;
gsign:=mem[thisbox+5].hh.b0;p:=mem[thisbox+5].hh.rh;
upwards:=(mem[thisbox].hh.b1=1);incr(curs);
if curs>0 then begin dvibuf[dviptr]:=141;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if curs>maxpush then maxpush:=curs;
saveloc:=dvioffset+dviptr;leftedge:=curh;{1723:}synctexvlist(thisbox);
{:1723};
if upwards then curv:=curv+mem[thisbox+2].int else curv:=curv-mem[
thisbox+3].int;topedge:=curv;while p<>-268435455 do{668:}
begin if(p>=himemmin)then confusion(66228)else{669:}
begin case mem[p].hh.b0 of 0,1:{670:}
if mem[p+5].hh.rh=-268435455 then begin if upwards then curv:=curv-mem[p
+2].int else curv:=curv+mem[p+3].int;{1727:}
if mem[p].hh.b0=1 then begin synctexvoidvlist(p,thisbox);
end else begin synctexvoidhlist(p,thisbox);end;{:1727};
if upwards then curv:=curv-mem[p+3].int else curv:=curv+mem[p+2].int;
end else begin if upwards then curv:=curv-mem[p+2].int else curv:=curv+
mem[p+3].int;if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;saveh:=dvih;savev:=dviv;
if curdir=1 then curh:=leftedge-mem[p+4].int else curh:=leftedge+mem[p+4
].int;tempptr:=p;if mem[p].hh.b0=1 then vlistout else hlistout;
dvih:=saveh;dviv:=savev;
if upwards then curv:=savev-mem[p+3].int else curv:=savev+mem[p+2].int;
curh:=leftedge;end{:670};2:begin ruleht:=mem[p+3].int;
ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;goto 14;end;8:{1426:}
begin case mem[p].hh.b1 of 42:begin curv:=curv+mem[p+3].int;
curh:=leftedge;if curh<>dvih then begin movement(curh-dvih,143);
dvih:=curh;end;if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;f:=mem[p+4].qqqq.b1;if f<>dvif then{659:}
begin if not fontused[f]then begin dvifontdef(f);fontused[f]:=true;end;
if f<=64 then begin dvibuf[dviptr]:=f+170;incr(dviptr);
if dviptr=dvilimit then dviswap;
end else if f<=256 then begin begin dvibuf[dviptr]:=235;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=f-1;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=236;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=(f-1)div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(f-1)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;dvif:=f;end{:659};
begin dvibuf[dviptr]:=253;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(0);dvitwo(1);dvifour(0);dvifour(0);dvitwo(mem[p+4].qqqq.b2);
curv:=curv+mem[p+2].int;curh:=leftedge;end;43,44:begin saveh:=dvih;
savev:=dviv;curv:=curv+mem[p+3].int;picout(p);dvih:=saveh;dviv:=savev;
curv:=savev+mem[p+2].int;curh:=leftedge;end;23:{1427:}
begin pdflastxpos:=curh+4736286;pdflastypos:=curpageheight-curv-4736286;
end{:1427};others:outwhat(p)end end{:1426};10:{672:}
begin g:=mem[p+1].hh.lh;ruleht:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;ruleht:=ruleht+curg;if mem[p].hh.b1>=100 then{673:}
begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=2 then begin rulewd:=mem[leaderbox+1].int;
ruledp:=0;goto 14;end;
leaderht:=mem[leaderbox+3].int+mem[leaderbox+2].int;
if(leaderht>0)and(ruleht>0)then begin ruleht:=ruleht+10;
edge:=curv+ruleht;lx:=0;{674:}
if mem[p].hh.b1=100 then begin savev:=curv;
curv:=topedge+leaderht*((curv-topedge)div leaderht);
if curv<savev then curv:=curv+leaderht;
end else begin lq:=ruleht div leaderht;lr:=ruleht mod leaderht;
if mem[p].hh.b1=101 then curv:=curv+(lr div 2)else begin lx:=lr div(lq+1
);curv:=curv+((lr-(lq-1)*lx)div 2);end;end{:674};
while curv+leaderht<=edge do{675:}
begin if curdir=1 then curh:=leftedge-mem[leaderbox+4].int else curh:=
leftedge+mem[leaderbox+4].int;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
saveh:=dvih;curv:=curv+mem[leaderbox+3].int;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
savev:=dviv;tempptr:=leaderbox;outerdoingleaders:=doingleaders;
doingleaders:=true;
if mem[leaderbox].hh.b0=1 then vlistout else hlistout;
doingleaders:=outerdoingleaders;dviv:=savev;dvih:=saveh;curh:=leftedge;
curv:=savev-mem[leaderbox+3].int+leaderht+lx;end{:675};curv:=edge-10;
goto 15;end;end{:673};goto 13;end{:672};
11:if upwards then curv:=curv-mem[p+1].int else curv:=curv+mem[p+1].int;
others:end;goto 15;14:{671:}
if(rulewd=-1073741824)then rulewd:=mem[thisbox+1].int;
ruleht:=ruleht+ruledp;
if upwards then curv:=curv-ruleht else curv:=curv+ruleht;
if(ruleht>0)and(rulewd>0)then begin if curdir=1 then curh:=curh-rulewd;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=137;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);curh:=leftedge;end;goto 15{:671};
13:if upwards then curv:=curv-ruleht else curv:=curv+ruleht;end{:669};
15:p:=mem[p].hh.rh;end{:668};{1724:}synctextsilv(thisbox);{:1724};
prunemovements(saveloc);if curs>0 then dvipop(saveloc);decr(curs);end;
{:667}{676:}procedure shipout(p:halfword);label 30;var pageloc:integer;
j,k:0..9;s:poolpointer;oldsetting:0..21;begin{1721:}
synctexsheet(eqtb[7892281].int);{:1721};
begin if jobname=0 then openlogfile;
if eqtb[7892298].int>0 then begin printnl(65626);println;print(66229);
end;if termoffset>maxprintline-9 then println else if(termoffset>0)or(
fileoffset>0)then printchar(32);printchar(91);j:=9;
while(eqtb[7892352+j].int=0)and(j>0)do decr(j);
for k:=0 to j do begin printint(eqtb[7892352+k].int);
if k<j then printchar(46);end;fflush(stdout);
if eqtb[7892298].int>0 then begin printchar(93);begindiagnostic;
showbox(p);enddiagnostic(true);end;{678:}{679:}
if(mem[p+3].int>1073741823)or(mem[p+2].int>1073741823)or(mem[p+3].int+
mem[p+2].int+eqtb[9006739].int>1073741823)or(mem[p+1].int+eqtb[9006738].
int>1073741823)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66235);end;begin helpptr:=2;helpline[1]:=66236;helpline[0]:=66237;
end;error;if eqtb[7892298].int<=0 then begin begindiagnostic;
printnl(66238);showbox(p);enddiagnostic(true);end;goto 30;end;
if mem[p+3].int+mem[p+2].int+eqtb[9006739].int>maxv then maxv:=mem[p+3].
int+mem[p+2].int+eqtb[9006739].int;
if mem[p+1].int+eqtb[9006738].int>maxh then maxh:=mem[p+1].int+eqtb[
9006738].int{:679};{653:}dvih:=0;dviv:=0;curh:=eqtb[9006738].int;
dvif:=0;{1428:}curhoffset:=eqtb[9006738].int+(65536*7227)/100;
curvoffset:=eqtb[9006739].int+(65536*7227)/100;
if eqtb[9006741].int<>0 then curpagewidth:=eqtb[9006741].int else
curpagewidth:=mem[p+1].int+2*curhoffset;
if eqtb[9006742].int<>0 then curpageheight:=eqtb[9006742].int else
curpageheight:=mem[p+3].int+mem[p+2].int+2*curvoffset{:1428};
if outputfilename=0 then begin if jobname=0 then openlogfile;
packjobname(outputfileextension);
while not dviopenout(dvifile)do promptfilename(66184,outputfileextension
);outputfilename:=bmakenamestring(dvifile);end;
if totalpages=0 then begin begin dvibuf[dviptr]:=247;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=7;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(25400000);
dvifour(473628672);preparemag;dvifour(eqtb[7892281].int);
if outputcomment then begin l:=strlen(outputcomment);
begin dvibuf[dviptr]:=l;incr(dviptr);if dviptr=dvilimit then dviswap;
end;for s:=0 to l-1 do begin dvibuf[dviptr]:=outputcomment[s];
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oldsetting:=selector;selector:=21;print(66227);
printint(eqtb[7892287].int);printchar(46);printtwo(eqtb[7892286].int);
printchar(46);printtwo(eqtb[7892285].int);printchar(58);
printtwo(eqtb[7892284].int div 60);printtwo(eqtb[7892284].int mod 60);
selector:=oldsetting;
begin dvibuf[dviptr]:=(poolptr-strstart[(strptr)-65536]);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
for s:=strstart[(strptr)-65536]to poolptr-1 do begin dvibuf[dviptr]:=
strpool[s];incr(dviptr);if dviptr=dvilimit then dviswap;end;
poolptr:=strstart[(strptr)-65536];end;end{:653};
pageloc:=dvioffset+dviptr;begin dvibuf[dviptr]:=139;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
for k:=0 to 9 do dvifour(eqtb[7892352+k].int);dvifour(lastbop);
lastbop:=pageloc;oldsetting:=selector;selector:=21;print(66233);
if(eqtb[9006741].int>0)and(eqtb[9006742].int>0)then begin print(66093);
print(32);printscaled(eqtb[9006741].int);print(65697);print(32);
print(66094);print(32);printscaled(eqtb[9006742].int);print(65697);
end else print(66234);selector:=oldsetting;begin dvibuf[dviptr]:=239;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(poolptr-strstart[(strptr)-65536]);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
for s:=strstart[(strptr)-65536]to poolptr-1 do begin dvibuf[dviptr]:=
strpool[s];incr(dviptr);if dviptr=dvilimit then dviswap;end;
poolptr:=strstart[(strptr)-65536];curv:=mem[p+3].int+eqtb[9006739].int;
tempptr:=p;if mem[p].hh.b0=1 then vlistout else hlistout;
begin dvibuf[dviptr]:=140;incr(dviptr);if dviptr=dvilimit then dviswap;
end;incr(totalpages);curs:=-1;if not nopdfoutput then fflush(dvifile);
ifdef('IPC')if ipcon>0 then begin if dvilimit=halfbuf then begin
writedvi(halfbuf,dvibufsize-1);flushdvi;dvigone:=dvigone+halfbuf;end;
if dviptr>(2147483647-dvioffset)then begin curs:=-2;fatalerror(66226);
end;if dviptr>0 then begin writedvi(0,dviptr-1);flushdvi;
dvioffset:=dvioffset+dviptr;dvigone:=dvigone+dviptr;end;dviptr:=0;
dvilimit:=dvibufsize;ipcpage(dvigone);end;endif('IPC');30:{:678};
if(eTeXmode=1)then{1541:}begin if LRproblems>0 then begin{1523:}
begin println;printnl(66927);printint(LRproblems div 10000);
print(66928);printint(LRproblems mod 10000);print(66929);LRproblems:=0;
end{:1523};printchar(41);println;end;
if(LRptr<>-268435455)or(curdir<>0)then confusion(66931);end{:1541};
if eqtb[7892298].int<=0 then printchar(93);deadcycles:=0;fflush(stdout);
{677:}ifdef('STAT')if eqtb[7892295].int>1 then begin printnl(66230);
printint(varused);printchar(38);printint(dynused);printchar(59);end;
endif('STAT')flushnodelist(p);
ifdef('STAT')if eqtb[7892295].int>1 then begin print(66231);
printint(varused);printchar(38);printint(dynused);print(66232);
printint(himemmin-lomemmax-1);println;end;endif('STAT'){:677};end;
{1722:}synctexteehs;{:1722};end;{:676}{684:}
procedure scanspec(c:groupcode;threecodes:boolean);label 40;
var s:integer;speccode:0..1;
begin if threecodes then s:=savestack[saveptr+0].int;
if scankeyword(66251)then speccode:=0 else if scankeyword(66252)then
speccode:=1 else begin speccode:=1;curval:=0;goto 40;end;
scandimen(false,false,false);
40:if threecodes then begin savestack[saveptr+0].int:=s;incr(saveptr);
end;savestack[saveptr+0].int:=speccode;savestack[saveptr+1].int:=curval;
saveptr:=saveptr+2;newsavelevel(c);scanleftbrace;end;{:684}{688:}
function charpw(p:halfword;side:smallnumber):scaled;
var f:internalfontnumber;c:integer;begin charpw:=0;
if side=0 then lastleftmostchar:=-268435455 else lastrightmostchar:=
-268435455;if p=-268435455 then goto 10;
if(((p)<>-268435455)and(not(p>=himemmin))and(mem[p].hh.b0=8)and(((mem[p]
.hh.b1>=40)and(mem[p].hh.b1<=41))))then begin if mem[p+5].ptr<>nullptr
then begin f:=mem[p+4].qqqq.b1;
charpw:=roundxnoverd(fontinfo[6+parambase[f]].int,getnativewordcp(p,side
),1000);end;goto 10;end;
if(((p)<>-268435455 and(not(p>=himemmin))and(mem[p].hh.b0=8)and(mem[p].
hh.b1=42)))then begin f:=mem[p+4].qqqq.b1;
charpw:=roundxnoverd(fontinfo[6+parambase[f]].int,getcpcode(f,mem[p+4].
qqqq.b2,side),1000);goto 10;end;
if not(p>=himemmin)then begin if mem[p].hh.b0=6 then p:=p+1 else goto 10
;end;f:=mem[p].hh.b0;c:=getcpcode(f,mem[p].hh.b1,side);
case side of 0:lastleftmostchar:=p;1:lastrightmostchar:=p;end;
if c=0 then goto 10;
charpw:=roundxnoverd(fontinfo[6+parambase[f]].int,c,1000);end;
function newmarginkern(w:scaled;p:halfword;side:smallnumber):halfword;
var k:halfword;begin k:=getnode(3);mem[k].hh.b0:=40;mem[k].hh.b1:=side;
mem[k+1].int:=w;newmarginkern:=k;end;{:688}{689:}
function hpack(p:halfword;w:scaled;m:smallnumber):halfword;
label 21,50,10,20;var r:halfword;q:halfword;h,d,x:scaled;s:scaled;
g:halfword;o:glueord;f:internalfontnumber;i:fourquarters;hd:eightbits;
pp,ppp:halfword;totalchars,k:integer;begin lastbadness:=0;r:=getnode(8);
mem[r].hh.b0:=0;mem[r].hh.b1:=0;mem[r+4].int:=0;q:=r+5;mem[q].hh.rh:=p;
h:=0;{690:}d:=0;x:=0;totalstretch[0]:=0;totalshrink[0]:=0;
totalstretch[1]:=0;totalshrink[1]:=0;totalstretch[2]:=0;
totalshrink[2]:=0;totalstretch[3]:=0;totalshrink[3]:=0{:690};
if(eqtb[7892339].int>0)then{1520:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1520};while p<>-268435455 do{691:}
begin 21:while(p>=himemmin)do{694:}begin f:=mem[p].hh.b0;
i:=fontinfo[charbase[f]+effectivechar(true,f,mem[p].hh.b1)].qqqq;
hd:=i.b1;x:=x+fontinfo[widthbase[f]+i.b0].int;
s:=fontinfo[heightbase[f]+(hd)div 16].int;if s>h then h:=s;
s:=fontinfo[depthbase[f]+(hd)mod 16].int;if s>d then d:=s;
p:=mem[p].hh.rh;end{:694};
if p<>-268435455 then begin case mem[p].hh.b0 of 0,1,2,13:{693:}
begin x:=x+mem[p+1].int;
if mem[p].hh.b0>=2 then s:=0 else s:=mem[p+4].int;
if mem[p+3].int-s>h then h:=mem[p+3].int-s;
if mem[p+2].int+s>d then d:=mem[p+2].int+s;end{:693};
3,4,5:if(adjusttail<>-268435455)or(preadjusttail<>-268435455)then{697:}
begin while mem[q].hh.rh<>p do q:=mem[q].hh.rh;
if mem[p].hh.b0=5 then begin if mem[p].hh.b1<>0 then begin if
preadjusttail=-268435455 then confusion(66253);
mem[preadjusttail].hh.rh:=mem[p+1].int;
while mem[preadjusttail].hh.rh<>-268435455 do preadjusttail:=mem[
preadjusttail].hh.rh;
end else begin if adjusttail=-268435455 then confusion(66253);
mem[adjusttail].hh.rh:=mem[p+1].int;
while mem[adjusttail].hh.rh<>-268435455 do adjusttail:=mem[adjusttail].
hh.rh;end;p:=mem[p].hh.rh;freenode(mem[q].hh.rh,2);
end else begin mem[adjusttail].hh.rh:=p;adjusttail:=p;p:=mem[p].hh.rh;
end;mem[q].hh.rh:=p;p:=q;end{:697};8:{1420:}
begin case mem[p].hh.b1 of 40,41:begin if(q<>r+5)and(mem[q].hh.b0=7)then
k:=mem[q].hh.b1 else k:=0;while(mem[q].hh.rh<>p)do begin decr(k);
q:=mem[q].hh.rh;if mem[q].hh.b0=7 then k:=mem[q].hh.b1;end;
pp:=mem[p].hh.rh;
20:if(k<=0)and(pp<>-268435455)and(not(pp>=himemmin))then begin if(mem[pp
].hh.b0=8)and(((mem[pp].hh.b1>=40)and(mem[pp].hh.b1<=41)))and(mem[pp+4].
qqqq.b1=mem[p+4].qqqq.b1)then begin pp:=mem[pp].hh.rh;goto 20;
end else if(mem[pp].hh.b0=7)then begin ppp:=mem[pp].hh.rh;
if(((ppp)<>-268435455)and(not(ppp>=himemmin))and(mem[ppp].hh.b0=8)and(((
mem[ppp].hh.b1>=40)and(mem[ppp].hh.b1<=41))))and(mem[ppp+4].qqqq.b1=mem[
p+4].qqqq.b1)then begin pp:=mem[ppp].hh.rh;goto 20;end end end;
if(pp<>mem[p].hh.rh)then begin totalchars:=0;p:=mem[q].hh.rh;
while(p<>pp)do begin if(mem[p].hh.b0=8)then totalchars:=totalchars+mem[p
+4].qqqq.b2;ppp:=p;p:=mem[p].hh.rh;end;p:=mem[q].hh.rh;
pp:=newnativewordnode(mem[p+4].qqqq.b1,totalchars);
mem[pp].hh.b1:=mem[p].hh.b1;mem[q].hh.rh:=pp;
mem[pp].hh.rh:=mem[ppp].hh.rh;mem[ppp].hh.rh:=-268435455;totalchars:=0;
ppp:=p;
repeat if(mem[ppp].hh.b0=8)then for k:=0 to mem[ppp+4].qqqq.b2-1 do
begin setnativechar(pp,totalchars,getnativechar(ppp,k));
incr(totalchars);end;ppp:=mem[ppp].hh.rh;until(ppp=-268435455);
flushnodelist(p);p:=mem[q].hh.rh;
setnativemetrics(p,(eqtb[7892342].int>0));end;
if mem[p+3].int>h then h:=mem[p+3].int;
if mem[p+2].int>d then d:=mem[p+2].int;x:=x+mem[p+1].int;end;
42,43,44:begin if mem[p+3].int>h then h:=mem[p+3].int;
if mem[p+2].int>d then d:=mem[p+2].int;x:=x+mem[p+1].int;end;others:end;
end{:1420};10:{698:}begin g:=mem[p+1].hh.lh;x:=x+mem[g+1].int;
o:=mem[g].hh.b0;totalstretch[o]:=totalstretch[o]+mem[g+2].int;
o:=mem[g].hh.b1;totalshrink[o]:=totalshrink[o]+mem[g+3].int;
if mem[p].hh.b1>=100 then begin g:=mem[p+1].hh.rh;
if mem[g+3].int>h then h:=mem[g+3].int;
if mem[g+2].int>d then d:=mem[g+2].int;end;end{:698};
11:x:=x+mem[p+1].int;40:x:=x+mem[p+1].int;9:begin x:=x+mem[p+1].int;
if(eqtb[7892339].int>0)then{1521:}
if odd(mem[p].hh.b1)then if mem[LRptr].hh.lh=(4*(mem[p].hh.b1 div 4)+3)
then begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;
end else begin incr(LRproblems);mem[p].hh.b0:=11;mem[p].hh.b1:=1;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1521};end;6:{692:}
begin mem[memtop-12]:=mem[p+1];mem[memtop-12].hh.rh:=mem[p].hh.rh;
p:=memtop-12;xtxligaturepresent:=true;goto 21;end{:692};others:end;
p:=mem[p].hh.rh;end;end{:691};
if adjusttail<>-268435455 then mem[adjusttail].hh.rh:=-268435455;
if preadjusttail<>-268435455 then mem[preadjusttail].hh.rh:=-268435455;
mem[r+3].int:=h;mem[r+2].int:=d;{699:}if m=1 then w:=x+w;
mem[r+1].int:=w;x:=w-x;if x=0 then begin mem[r+5].hh.b0:=0;
mem[r+5].hh.b1:=0;mem[r+6].gr:=0.0;goto 10;end else if x>0 then{700:}
begin{701:}
if totalstretch[3]<>0 then o:=3 else if totalstretch[2]<>0 then o:=2
else if totalstretch[1]<>0 then o:=1 else o:=0{:701};mem[r+5].hh.b1:=o;
mem[r+5].hh.b0:=1;
if totalstretch[o]<>0 then mem[r+6].gr:=x/totalstretch[o]else begin mem[
r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if o=0 then if mem[r+5].hh.rh<>-268435455 then{702:}
begin lastbadness:=badness(x,totalstretch[0]);
if lastbadness>eqtb[7892290].int then begin println;
if lastbadness>100 then printnl(66254)else printnl(66255);print(66256);
printint(lastbadness);goto 50;end;end{:702};goto 10;end{:700}else{706:}
begin{707:}
if totalshrink[3]<>0 then o:=3 else if totalshrink[2]<>0 then o:=2 else
if totalshrink[1]<>0 then o:=1 else o:=0{:707};mem[r+5].hh.b1:=o;
mem[r+5].hh.b0:=2;
if totalshrink[o]<>0 then mem[r+6].gr:=(-x)/totalshrink[o]else begin mem
[r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if(totalshrink[o]<-x)and(o=0)and(mem[r+5].hh.rh<>-268435455)then begin
lastbadness:=1000000;mem[r+6].gr:=1.0;{708:}
if(-x-totalshrink[0]>eqtb[9006728].int)or(eqtb[7892290].int<100)then
begin if(eqtb[9006736].int>0)and(-x-totalshrink[0]>eqtb[9006728].int)
then begin while mem[q].hh.rh<>-268435455 do q:=mem[q].hh.rh;
mem[q].hh.rh:=newrule;mem[mem[q].hh.rh+1].int:=eqtb[9006736].int;end;
println;printnl(66262);printscaled(-x-totalshrink[0]);print(66263);
goto 50;end{:708};
end else if o=0 then if mem[r+5].hh.rh<>-268435455 then{709:}
begin lastbadness:=badness(-x,totalshrink[0]);
if lastbadness>eqtb[7892290].int then begin println;printnl(66264);
printint(lastbadness);goto 50;end;end{:709};goto 10;end{:706}{:699};
50:{705:}
if outputactive then print(66257)else begin if packbeginline<>0 then
begin if packbeginline>0 then print(66258)else print(66259);
printint(abs(packbeginline));print(66260);end else print(66261);
printint(line);end;println;fontinshortdisplay:=0;
shortdisplay(mem[r+5].hh.rh);println;begindiagnostic;showbox(r);
enddiagnostic(true){:705};10:if(eqtb[7892339].int>0)then{1522:}
begin if mem[LRptr].hh.lh<>0 then begin while mem[q].hh.rh<>-268435455
do q:=mem[q].hh.rh;repeat tempptr:=q;q:=newmath(0,mem[LRptr].hh.lh);
mem[tempptr].hh.rh:=q;LRproblems:=LRproblems+10000;begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
until mem[LRptr].hh.lh=0;end;if LRproblems>0 then begin{1523:}
begin println;printnl(66927);printint(LRproblems div 10000);
print(66928);printint(LRproblems mod 10000);print(66929);LRproblems:=0;
end{:1523};goto 50;end;begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if LRptr<>-268435455 then confusion(66926);end{:1522};hpack:=r;end;
{:689}{710:}function vpackage(p:halfword;h:scaled;m:smallnumber;
l:scaled):halfword;label 50,10;var r:halfword;w,d,x:scaled;s:scaled;
g:halfword;o:glueord;begin lastbadness:=0;r:=getnode(8);mem[r].hh.b0:=1;
if(eqtb[7892341].int>0)then mem[r].hh.b1:=1 else mem[r].hh.b1:=0;
mem[r+4].int:=0;mem[r+5].hh.rh:=p;w:=0;{690:}d:=0;x:=0;
totalstretch[0]:=0;totalshrink[0]:=0;totalstretch[1]:=0;
totalshrink[1]:=0;totalstretch[2]:=0;totalshrink[2]:=0;
totalstretch[3]:=0;totalshrink[3]:=0{:690};while p<>-268435455 do{711:}
begin if(p>=himemmin)then confusion(66265)else case mem[p].hh.b0 of 0,1,
2,13:{712:}begin x:=x+d+mem[p+3].int;d:=mem[p+2].int;
if mem[p].hh.b0>=2 then s:=0 else s:=mem[p+4].int;
if mem[p+1].int+s>w then w:=mem[p+1].int+s;end{:712};8:{1419:}
begin if(mem[p].hh.b1=43)or(mem[p].hh.b1=44)then begin x:=x+d+mem[p+3].
int;d:=mem[p+2].int;if mem[p+1].int>w then w:=mem[p+1].int;end;
end{:1419};10:{713:}begin x:=x+d;d:=0;g:=mem[p+1].hh.lh;
x:=x+mem[g+1].int;o:=mem[g].hh.b0;
totalstretch[o]:=totalstretch[o]+mem[g+2].int;o:=mem[g].hh.b1;
totalshrink[o]:=totalshrink[o]+mem[g+3].int;
if mem[p].hh.b1>=100 then begin g:=mem[p+1].hh.rh;
if mem[g+1].int>w then w:=mem[g+1].int;end;end{:713};
11:begin x:=x+d+mem[p+1].int;d:=0;end;others:end;p:=mem[p].hh.rh;
end{:711};mem[r+1].int:=w;if d>l then begin x:=x+d-l;mem[r+2].int:=l;
end else mem[r+2].int:=d;{714:}if m=1 then h:=x+h;mem[r+3].int:=h;
x:=h-x;if x=0 then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;goto 10;end else if x>0 then{715:}begin{701:}
if totalstretch[3]<>0 then o:=3 else if totalstretch[2]<>0 then o:=2
else if totalstretch[1]<>0 then o:=1 else o:=0{:701};mem[r+5].hh.b1:=o;
mem[r+5].hh.b0:=1;
if totalstretch[o]<>0 then mem[r+6].gr:=x/totalstretch[o]else begin mem[
r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if o=0 then if mem[r+5].hh.rh<>-268435455 then{716:}
begin lastbadness:=badness(x,totalstretch[0]);
if lastbadness>eqtb[7892291].int then begin println;
if lastbadness>100 then printnl(66254)else printnl(66255);print(66266);
printint(lastbadness);goto 50;end;end{:716};goto 10;end{:715}else{718:}
begin{707:}
if totalshrink[3]<>0 then o:=3 else if totalshrink[2]<>0 then o:=2 else
if totalshrink[1]<>0 then o:=1 else o:=0{:707};mem[r+5].hh.b1:=o;
mem[r+5].hh.b0:=2;
if totalshrink[o]<>0 then mem[r+6].gr:=(-x)/totalshrink[o]else begin mem
[r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if(totalshrink[o]<-x)and(o=0)and(mem[r+5].hh.rh<>-268435455)then begin
lastbadness:=1000000;mem[r+6].gr:=1.0;{719:}
if(-x-totalshrink[0]>eqtb[9006729].int)or(eqtb[7892291].int<100)then
begin println;printnl(66267);printscaled(-x-totalshrink[0]);
print(66268);goto 50;end{:719};
end else if o=0 then if mem[r+5].hh.rh<>-268435455 then{720:}
begin lastbadness:=badness(-x,totalshrink[0]);
if lastbadness>eqtb[7892291].int then begin println;printnl(66269);
printint(lastbadness);goto 50;end;end{:720};goto 10;end{:718}{:714};
50:{717:}
if outputactive then print(66257)else begin if packbeginline<>0 then
begin print(66259);printint(abs(packbeginline));print(66260);
end else print(66261);printint(line);println;end;begindiagnostic;
showbox(r);enddiagnostic(true){:717};10:vpackage:=r;end;{:710}{721:}
procedure appendtovlist(b:halfword);var d:scaled;p:halfword;
upwards:boolean;begin upwards:=(eqtb[7892341].int>0);
if curlist.auxfield.int>-65536000 then begin if upwards then d:=mem[eqtb
[1205765].hh.rh+1].int-curlist.auxfield.int-mem[b+2].int else d:=mem[
eqtb[1205765].hh.rh+1].int-curlist.auxfield.int-mem[b+3].int;
if d<eqtb[9006722].int then p:=newparamglue(0)else begin p:=newskipparam
(1);mem[tempptr+1].int:=d;end;mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=p;end;mem[curlist.tailfield].hh.rh:=b;
curlist.tailfield:=b;
if upwards then curlist.auxfield.int:=mem[b+3].int else curlist.auxfield
.int:=mem[b+2].int;end;{:721}{728:}function newnoad:halfword;
var p:halfword;begin p:=getnode(4);mem[p].hh.b0:=16;mem[p].hh.b1:=0;
mem[p+1].hh:=emptyfield;mem[p+3].hh:=emptyfield;mem[p+2].hh:=emptyfield;
newnoad:=p;end;{:728}{730:}function newstyle(s:smallnumber):halfword;
var p:halfword;begin p:=getnode(3);mem[p].hh.b0:=14;mem[p].hh.b1:=s;
mem[p+1].int:=0;mem[p+2].int:=0;newstyle:=p;end;{:730}{731:}
function newchoice:halfword;var p:halfword;begin p:=getnode(3);
mem[p].hh.b0:=15;mem[p].hh.b1:=0;mem[p+1].hh.lh:=-268435455;
mem[p+1].hh.rh:=-268435455;mem[p+2].hh.lh:=-268435455;
mem[p+2].hh.rh:=-268435455;newchoice:=p;end;{:731}{735:}
procedure showinfo;begin shownodelist(mem[tempptr].hh.lh);end;{:735}
{742:}function mathxheight(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,5)else rval:=fontinfo[5+parambase[f]].int;
mathxheight:=rval;end;function mathquad(sizecode:integer):scaled;
var f:integer;rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,6)else rval:=fontinfo[6+parambase[f]].int;
mathquad:=rval;end;function num1(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,8)else rval:=fontinfo[8+parambase[f]].int;
num1:=rval;end;function num2(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,9)else rval:=fontinfo[9+parambase[f]].int;
num2:=rval;end;function num3(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,10)else rval:=fontinfo[10+parambase[f]].int
;num3:=rval;end;function denom1(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,11)else rval:=fontinfo[11+parambase[f]].int
;denom1:=rval;end;function denom2(sizecode:integer):scaled;
var f:integer;rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,12)else rval:=fontinfo[12+parambase[f]].int
;denom2:=rval;end;function sup1(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,13)else rval:=fontinfo[13+parambase[f]].int
;sup1:=rval;end;function sup2(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,14)else rval:=fontinfo[14+parambase[f]].int
;sup2:=rval;end;function sup3(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,15)else rval:=fontinfo[15+parambase[f]].int
;sup3:=rval;end;function sub1(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,16)else rval:=fontinfo[16+parambase[f]].int
;sub1:=rval;end;function sub2(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,17)else rval:=fontinfo[17+parambase[f]].int
;sub2:=rval;end;function supdrop(sizecode:integer):scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,18)else rval:=fontinfo[18+parambase[f]].int
;supdrop:=rval;end;function subdrop(sizecode:integer):scaled;
var f:integer;rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,19)else rval:=fontinfo[19+parambase[f]].int
;subdrop:=rval;end;function delim1(sizecode:integer):scaled;
var f:integer;rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,20)else rval:=fontinfo[20+parambase[f]].int
;delim1:=rval;end;function delim2(sizecode:integer):scaled;
var f:integer;rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,21)else rval:=fontinfo[21+parambase[f]].int
;delim2:=rval;end;function axisheight(sizecode:integer):scaled;
var f:integer;rval:scaled;begin f:=eqtb[1206826+sizecode].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathsyparam(f,22)else rval:=fontinfo[22+parambase[f]].int
;axisheight:=rval;end;{:742}{743:}function defaultrulethickness:scaled;
var f:integer;rval:scaled;begin f:=eqtb[1206827+cursize].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathexparam(f,8)else rval:=fontinfo[8+parambase[f]].int;
defaultrulethickness:=rval;end;function bigopspacing1:scaled;
var f:integer;rval:scaled;begin f:=eqtb[1206827+cursize].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathexparam(f,9)else rval:=fontinfo[9+parambase[f]].int;
bigopspacing1:=rval;end;function bigopspacing2:scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206827+cursize].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathexparam(f,10)else rval:=fontinfo[10+parambase[f]].int
;bigopspacing2:=rval;end;function bigopspacing3:scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206827+cursize].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathexparam(f,11)else rval:=fontinfo[11+parambase[f]].int
;bigopspacing3:=rval;end;function bigopspacing4:scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206827+cursize].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathexparam(f,12)else rval:=fontinfo[12+parambase[f]].int
;bigopspacing4:=rval;end;function bigopspacing5:scaled;var f:integer;
rval:scaled;begin f:=eqtb[1206827+cursize].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rval:=getnativemathexparam(f,13)else rval:=fontinfo[13+parambase[f]].int
;bigopspacing5:=rval;end;{:743}{747:}
function fractionrule(t:scaled):halfword;var p:halfword;
begin p:=newrule;mem[p+3].int:=t;mem[p+2].int:=0;fractionrule:=p;end;
{:747}{748:}function overbar(b:halfword;k,t:scaled):halfword;
var p,q:halfword;begin p:=newkern(k);mem[p].hh.rh:=b;q:=fractionrule(t);
mem[q].hh.rh:=p;p:=newkern(t);mem[p].hh.rh:=q;
overbar:=vpackage(p,0,1,1073741823);end;{:748}{749:}{752:}
function charbox(f:internalfontnumber;c:integer):halfword;
var q:fourquarters;hd:eightbits;b,p:halfword;
begin if((fontarea[f]=65535)or(fontarea[f]=65534))then begin b:=
newnullbox;p:=newnativecharacter(f,c);mem[b+5].hh.rh:=p;
mem[b+3].int:=mem[p+3].int;mem[b+1].int:=mem[p+1].int;
if mem[p+2].int<0 then mem[b+2].int:=0 else mem[b+2].int:=mem[p+2].int;
end else begin q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;
hd:=q.b1;b:=newnullbox;
mem[b+1].int:=fontinfo[widthbase[f]+q.b0].int+fontinfo[italicbase[f]+(q.
b2)div 4].int;mem[b+3].int:=fontinfo[heightbase[f]+(hd)div 16].int;
mem[b+2].int:=fontinfo[depthbase[f]+(hd)mod 16].int;p:=getavail;
mem[p].hh.b1:=c;mem[p].hh.b0:=f;end;mem[b+5].hh.rh:=p;charbox:=b;end;
{:752}{754:}procedure stackintobox(b:halfword;f:internalfontnumber;
c:quarterword);var p:halfword;begin p:=charbox(f,c);
mem[p].hh.rh:=mem[b+5].hh.rh;mem[b+5].hh.rh:=p;
mem[b+3].int:=mem[p+3].int;end;{:754}{755:}
function heightplusdepth(f:internalfontnumber;c:quarterword):scaled;
var q:fourquarters;hd:eightbits;
begin q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;hd:=q.b1;
heightplusdepth:=fontinfo[heightbase[f]+(hd)div 16].int+fontinfo[
depthbase[f]+(hd)mod 16].int;end;{:755}
procedure stackglyphintobox(b:halfword;f:internalfontnumber;g:integer);
var p,q:halfword;begin p:=getnode(5);mem[p].hh.b0:=8;mem[p].hh.b1:=42;
mem[p+4].qqqq.b1:=f;mem[p+4].qqqq.b2:=g;setnativeglyphmetrics(p,1);
if mem[b].hh.b0=0 then begin q:=mem[b+5].hh.rh;
if q=-268435455 then mem[b+5].hh.rh:=p else begin while mem[q].hh.rh<>
-268435455 do q:=mem[q].hh.rh;mem[q].hh.rh:=p;
if(mem[b+3].int<mem[p+3].int)then mem[b+3].int:=mem[p+3].int;
if(mem[b+2].int<mem[p+2].int)then mem[b+2].int:=mem[p+2].int;end;
end else begin mem[p].hh.rh:=mem[b+5].hh.rh;mem[b+5].hh.rh:=p;
mem[b+3].int:=mem[p+3].int;
if(mem[b+1].int<mem[p+1].int)then mem[b+1].int:=mem[p+1].int;end;end;
procedure stackglueintobox(b:halfword;min,max:scaled);var p,q:halfword;
begin q:=newspec(membot);mem[q+1].int:=min;mem[q+2].int:=max-min;
p:=newglue(q);if mem[b].hh.b0=0 then begin q:=mem[b+5].hh.rh;
if q=-268435455 then mem[b+5].hh.rh:=p else begin while mem[q].hh.rh<>
-268435455 do q:=mem[q].hh.rh;mem[q].hh.rh:=p;end;
end else begin mem[p].hh.rh:=mem[b+5].hh.rh;mem[b+5].hh.rh:=p;
mem[b+3].int:=mem[p+3].int;mem[b+1].int:=mem[p+1].int;end;end;
function buildopentypeassembly(f:internalfontnumber;a:voidpointer;
s:scaled;horiz:boolean):halfword;var b:halfword;n:integer;i,j:integer;
g:integer;p:halfword;smax,o,oo,prevo,mino:scaled;noextenders:boolean;
nat,str:scaled;begin b:=newnullbox;
if horiz then mem[b].hh.b0:=0 else mem[b].hh.b0:=1;n:=-1;
noextenders:=true;mino:=otminconnectoroverlap(f);repeat n:=n+1;smax:=0;
prevo:=0;
for i:=0 to otpartcount(a)-1 do begin if otpartisextender(a,i)then begin
noextenders:=false;
for j:=1 to n do begin o:=otpartstartconnector(f,a,i);
if mino<o then o:=mino;if prevo<o then o:=prevo;
smax:=smax-o+otpartfulladvance(f,a,i);prevo:=otpartendconnector(f,a,i);
end end else begin o:=otpartstartconnector(f,a,i);
if mino<o then o:=mino;if prevo<o then o:=prevo;
smax:=smax-o+otpartfulladvance(f,a,i);prevo:=otpartendconnector(f,a,i);
end;end;until(smax>=s)or noextenders;prevo:=0;
for i:=0 to otpartcount(a)-1 do begin if otpartisextender(a,i)then begin
for j:=1 to n do begin o:=otpartstartconnector(f,a,i);
if prevo<o then o:=prevo;oo:=o;if mino<o then o:=mino;
if oo>0 then stackglueintobox(b,-oo,-o);g:=otpartglyph(a,i);
stackglyphintobox(b,f,g);prevo:=otpartendconnector(f,a,i);
end end else begin o:=otpartstartconnector(f,a,i);
if prevo<o then o:=prevo;oo:=o;if mino<o then o:=mino;
if oo>0 then stackglueintobox(b,-oo,-o);g:=otpartglyph(a,i);
stackglyphintobox(b,f,g);prevo:=otpartendconnector(f,a,i);end;end;
p:=mem[b+5].hh.rh;nat:=0;str:=0;
while p<>-268435455 do begin if mem[p].hh.b0=8 then begin if horiz then
nat:=nat+mem[p+1].int else nat:=nat+mem[p+3].int+mem[p+2].int;
end else if mem[p].hh.b0=10 then begin nat:=nat+mem[mem[p+1].hh.lh+1].
int;str:=str+mem[mem[p+1].hh.lh+2].int;end;p:=mem[p].hh.rh;end;o:=0;
if(s>nat)and(str>0)then begin o:=(s-nat);if(o>str)then o:=str;
mem[b+5].hh.b1:=0;mem[b+5].hh.b0:=1;mem[b+6].gr:=o/str;
if horiz then mem[b+1].int:=nat+round(str*mem[b+6].gr)else mem[b+3].int
:=nat+round(str*mem[b+6].gr);
end else if horiz then mem[b+1].int:=nat else mem[b+3].int:=nat;
buildopentypeassembly:=b;end;function vardelimiter(d:halfword;s:integer;
v:scaled):halfword;label 40,22;var b:halfword;otassemblyptr:voidpointer;
f,g:internalfontnumber;c,x,y:quarterword;m,n:integer;u:scaled;w:scaled;
q:fourquarters;hd:eightbits;r:fourquarters;z:integer;
largeattempt:boolean;begin f:=0;w:=0;largeattempt:=false;
z:=(mem[d].qqqq.b0 mod 256);
x:=(mem[d].qqqq.b1+(mem[d].qqqq.b0 div 256)*65536);otassemblyptr:=nil;
while true do begin{750:}if(z<>0)or(x<>0)then begin z:=z+s+256;
repeat z:=z-256;g:=eqtb[1206824+z].hh.rh;if g<>0 then{751:}
if((fontarea[g]=65534)and(usingOpenType(fontlayoutengine[g])))then begin
x:=mapchartoglyph(g,x);f:=g;c:=x;w:=0;n:=0;
repeat y:=getotmathvariant(g,x,n,addressof(u),0);if u>w then begin c:=y;
w:=u;if u>=v then goto 40;end;n:=n+1;until u<0;
otassemblyptr:=getotassemblyptr(g,x,0);
if otassemblyptr<>nil then goto 40;end else begin y:=x;
if(y>=fontbc[g])and(y<=fontec[g])then begin 22:q:=fontinfo[charbase[g]+y
].qqqq;if(q.b0>0)then begin if((q.b2)mod 4)=3 then begin f:=g;c:=y;
goto 40;end;hd:=q.b1;
u:=fontinfo[heightbase[g]+(hd)div 16].int+fontinfo[depthbase[g]+(hd)mod
16].int;if u>w then begin f:=g;c:=y;w:=u;if u>=v then goto 40;end;
if((q.b2)mod 4)=2 then begin y:=q.b3;goto 22;end;end;end;end{:751};
until z<256;end{:750};if largeattempt then goto 40;largeattempt:=true;
z:=(mem[d].qqqq.b2 mod 256);
x:=(mem[d].qqqq.b3+(mem[d].qqqq.b2 div 256)*65536);end;
40:if f<>0 then begin if not((fontarea[f]=65534)and(usingOpenType(
fontlayoutengine[f])))then{753:}if((q.b2)mod 4)=3 then{756:}
begin b:=newnullbox;mem[b].hh.b0:=1;r:=fontinfo[extenbase[f]+q.b3].qqqq;
{757:}c:=r.b3;u:=heightplusdepth(f,c);w:=0;
q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;
mem[b+1].int:=fontinfo[widthbase[f]+q.b0].int+fontinfo[italicbase[f]+(q.
b2)div 4].int;c:=r.b2;if c<>0 then w:=w+heightplusdepth(f,c);c:=r.b1;
if c<>0 then w:=w+heightplusdepth(f,c);c:=r.b0;
if c<>0 then w:=w+heightplusdepth(f,c);n:=0;
if u>0 then while w<v do begin w:=w+u;incr(n);if r.b1<>0 then w:=w+u;
end{:757};c:=r.b2;if c<>0 then stackintobox(b,f,c);c:=r.b3;
for m:=1 to n do stackintobox(b,f,c);c:=r.b1;
if c<>0 then begin stackintobox(b,f,c);c:=r.b3;
for m:=1 to n do stackintobox(b,f,c);end;c:=r.b0;
if c<>0 then stackintobox(b,f,c);mem[b+2].int:=w-mem[b+3].int;end{:756}
else b:=charbox(f,c){:753}
else begin if otassemblyptr<>nil then b:=buildopentypeassembly(f,
otassemblyptr,v,0)else begin b:=newnullbox;mem[b].hh.b0:=1;
mem[b+5].hh.rh:=getnode(5);mem[mem[b+5].hh.rh].hh.b0:=8;
mem[mem[b+5].hh.rh].hh.b1:=42;mem[mem[b+5].hh.rh+4].qqqq.b1:=f;
mem[mem[b+5].hh.rh+4].qqqq.b2:=c;
setnativeglyphmetrics(mem[b+5].hh.rh,1);
mem[b+1].int:=mem[mem[b+5].hh.rh+1].int;
mem[b+3].int:=mem[mem[b+5].hh.rh+3].int;
mem[b+2].int:=mem[mem[b+5].hh.rh+2].int;
end end end else begin b:=newnullbox;mem[b+1].int:=eqtb[9006731].int;
end;mem[b+4].int:=half(mem[b+3].int-mem[b+2].int)-axisheight(s);
freeotassembly(otassemblyptr);vardelimiter:=b;end;{:749}{758:}
function rebox(b:halfword;w:scaled):halfword;var p:halfword;
f:internalfontnumber;v:scaled;
begin if(mem[b+1].int<>w)and(mem[b+5].hh.rh<>-268435455)then begin if
mem[b].hh.b0=1 then b:=hpack(b,0,1);p:=mem[b+5].hh.rh;
if((p>=himemmin))and(mem[p].hh.rh=-268435455)then begin f:=mem[p].hh.b0;
v:=fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true,f,mem[p
].hh.b1)].qqqq.b0].int;
if v<>mem[b+1].int then mem[p].hh.rh:=newkern(mem[b+1].int-v);end;
freenode(b,8);b:=newglue(membot+12);mem[b].hh.rh:=p;
while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;
mem[p].hh.rh:=newglue(membot+12);rebox:=hpack(b,w,0);
end else begin mem[b+1].int:=w;rebox:=b;end;end;{:758}{759:}
function mathglue(g:halfword;m:scaled):halfword;var p:halfword;
n:integer;f:scaled;begin n:=xovern(m,65536);f:=texremainder;
if f<0 then begin decr(n);f:=f+65536;end;p:=getnode(4);
mem[p+1].int:=multandadd(n,mem[g+1].int,xnoverd(mem[g+1].int,f,65536),
1073741823);mem[p].hh.b0:=mem[g].hh.b0;
if mem[p].hh.b0=0 then mem[p+2].int:=multandadd(n,mem[g+2].int,xnoverd(
mem[g+2].int,f,65536),1073741823)else mem[p+2].int:=mem[g+2].int;
mem[p].hh.b1:=mem[g].hh.b1;
if mem[p].hh.b1=0 then mem[p+3].int:=multandadd(n,mem[g+3].int,xnoverd(
mem[g+3].int,f,65536),1073741823)else mem[p+3].int:=mem[g+3].int;
mathglue:=p;end;{:759}{760:}procedure mathkern(p:halfword;m:scaled);
var n:integer;f:scaled;
begin if mem[p].hh.b1=99 then begin n:=xovern(m,65536);f:=texremainder;
if f<0 then begin decr(n);f:=f+65536;end;
mem[p+1].int:=multandadd(n,mem[p+1].int,xnoverd(mem[p+1].int,f,65536),
1073741823);mem[p].hh.b1:=1;end;end;{:760}{761:}procedure flushmath;
begin flushnodelist(mem[curlist.headfield].hh.rh);
flushnodelist(curlist.auxfield.int);
mem[curlist.headfield].hh.rh:=-268435455;
curlist.tailfield:=curlist.headfield;curlist.auxfield.int:=-268435455;
end;{:761}{763:}procedure mlisttohlist;forward;
function cleanbox(p:halfword;s:smallnumber):halfword;label 40;
var q:halfword;savestyle:smallnumber;x:halfword;r:halfword;
begin case mem[p].hh.rh of 1:begin curmlist:=newnoad;
mem[curmlist+1]:=mem[p];end;2:begin q:=mem[p].hh.lh;goto 40;end;
3:curmlist:=mem[p].hh.lh;others:begin q:=newnullbox;goto 40;end end;
savestyle:=curstyle;curstyle:=s;mlistpenalties:=false;mlisttohlist;
q:=mem[memtop-3].hh.rh;curstyle:=savestyle;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};
40:if(q>=himemmin)or(q=-268435455)then x:=hpack(q,0,1)else if(mem[q].hh.
rh=-268435455)and(mem[q].hh.b0<=1)and(mem[q+4].int=0)then x:=q else x:=
hpack(q,0,1);{764:}q:=mem[x+5].hh.rh;
if(q>=himemmin)then begin r:=mem[q].hh.rh;
if r<>-268435455 then if mem[r].hh.rh=-268435455 then if not(r>=himemmin
)then if mem[r].hh.b0=11 then begin freenode(r,3);
mem[q].hh.rh:=-268435455;end;end{:764};cleanbox:=x;end;{:763}{765:}
procedure fetch(a:halfword);begin curc:=casttoushort(mem[a].hh.b1);
curf:=eqtb[1206824+(mem[a].hh.b0 mod 256)+cursize].hh.rh;
curc:=curc+(mem[a].hh.b0 div 256)*65536;if curf=0 then{766:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65626);end;printsize(cursize);printchar(32);
printint((mem[a].hh.b0 mod 256));print(66312);print(curc);printchar(41);
begin helpptr:=4;helpline[3]:=66313;helpline[2]:=66314;
helpline[1]:=66315;helpline[0]:=66316;end;error;curi:=nullcharacter;
mem[a].hh.rh:=0;end{:766}
else if((fontarea[curf]=65535)or(fontarea[curf]=65534))then begin curi:=
nullcharacter;
end else begin if(curc>=fontbc[curf])and(curc<=fontec[curf])then curi:=
fontinfo[charbase[curf]+curc].qqqq else curi:=nullcharacter;
if not((curi.b0>0))then begin charwarning(curf,curc);mem[a].hh.rh:=0;
curi:=nullcharacter;end;end;end;{:765}{769:}{777:}
procedure makeover(q:halfword);
begin mem[q+1].hh.lh:=overbar(cleanbox(q+1,2*(curstyle div 2)+1),3*
defaultrulethickness,defaultrulethickness);mem[q+1].hh.rh:=2;end;{:777}
{778:}procedure makeunder(q:halfword);var p,x,y:halfword;delta:scaled;
begin x:=cleanbox(q+1,curstyle);p:=newkern(3*defaultrulethickness);
mem[x].hh.rh:=p;mem[p].hh.rh:=fractionrule(defaultrulethickness);
y:=vpackage(x,0,1,1073741823);
delta:=mem[y+3].int+mem[y+2].int+defaultrulethickness;
mem[y+3].int:=mem[x+3].int;mem[y+2].int:=delta-mem[y+3].int;
mem[q+1].hh.lh:=y;mem[q+1].hh.rh:=2;end;{:778}{779:}
procedure makevcenter(q:halfword);var v:halfword;delta:scaled;
begin v:=mem[q+1].hh.lh;if mem[v].hh.b0<>1 then confusion(65863);
delta:=mem[v+3].int+mem[v+2].int;
mem[v+3].int:=axisheight(cursize)+half(delta);
mem[v+2].int:=delta-mem[v+3].int;end;{:779}{780:}
procedure makeradical(q:halfword);var x,y:halfword;f:internalfontnumber;
rulethickness:scaled;delta,clr:scaled;
begin f:=eqtb[1206824+(mem[q+4].qqqq.b0 mod 256)+cursize].hh.rh;
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
rulethickness:=getotmathconstant(f,51)else rulethickness:=
defaultrulethickness;x:=cleanbox(q+1,2*(curstyle div 2)+1);
if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
begin if curstyle<2 then clr:=getotmathconstant(f,50)else clr:=
getotmathconstant(f,49);
end else begin if curstyle<2 then clr:=rulethickness+(abs(mathxheight(
cursize))div 4)else begin clr:=rulethickness;clr:=clr+(abs(clr)div 4);
end;end;
y:=vardelimiter(q+4,cursize,mem[x+3].int+mem[x+2].int+clr+rulethickness)
;if((fontarea[f]=65534)and(isOpenTypeMathFont(fontlayoutengine[f])))then
begin mem[y+2].int:=mem[y+3].int+mem[y+2].int-rulethickness;
mem[y+3].int:=rulethickness;end;
delta:=mem[y+2].int-(mem[x+3].int+mem[x+2].int+clr);
if delta>0 then clr:=clr+half(delta);mem[y+4].int:=-(mem[x+3].int+clr);
mem[y].hh.rh:=overbar(x,clr,mem[y+3].int);mem[q+1].hh.lh:=hpack(y,0,1);
mem[q+1].hh.rh:=2;end;{:780}{781:}
function computeotmathaccentpos(p:halfword):scaled;var q,r:halfword;
s,g:scaled;begin if(mem[p+1].hh.rh=1)then begin fetch(p+1);
q:=newnativecharacter(curf,curc);g:=getnativeglyph(q,0);
s:=getotmathaccentpos(curf,g);
end else begin if(mem[p+1].hh.rh=3)then begin r:=mem[p+1].hh.lh;
if(r<>-268435455)and(mem[r].hh.b0=28)then s:=computeotmathaccentpos(r)
else s:=2147483647;end else s:=2147483647;end;computeotmathaccentpos:=s;
end;procedure makemathaccent(q:halfword);label 30,31;var p,x,y:halfword;
a:integer;c,g:integer;f:internalfontnumber;i:fourquarters;s,sa:scaled;
h:scaled;delta:scaled;w,w2:scaled;otassemblyptr:voidpointer;
begin fetch(q+4);x:=-268435455;otassemblyptr:=nil;
if((fontarea[curf]=65535)or(fontarea[curf]=65534))then begin c:=curc;
f:=curf;
if not((mem[q].hh.b1=2)or(mem[q].hh.b1=3))then s:=computeotmathaccentpos
(q)else s:=0;x:=cleanbox(q+1,2*(curstyle div 2)+1);w:=mem[x+1].int;
h:=mem[x+3].int;end else if(curi.b0>0)then begin i:=curi;c:=curc;
f:=curf;{785:}s:=0;if mem[q+1].hh.rh=1 then begin fetch(q+1);
if((curi.b2)mod 4)=1 then begin a:=ligkernbase[curf]+curi.b3;
curi:=fontinfo[a].qqqq;
if curi.b0>128 then begin a:=ligkernbase[curf]+256*curi.b2+curi.b3
+32768-256*(128);curi:=fontinfo[a].qqqq;end;
while true do begin if curi.b1=skewchar[curf]then begin if curi.b2>=128
then if curi.b0<=128 then s:=fontinfo[kernbase[curf]+256*curi.b2+curi.b3
].int;goto 31;end;if curi.b0>=128 then goto 31;a:=a+curi.b0+1;
curi:=fontinfo[a].qqqq;end;end;end;31:{:785};
x:=cleanbox(q+1,2*(curstyle div 2)+1);w:=mem[x+1].int;h:=mem[x+3].int;
{784:}while true do begin if((i.b2)mod 4)<>2 then goto 30;y:=i.b3;
i:=fontinfo[charbase[f]+y].qqqq;if not(i.b0>0)then goto 30;
if fontinfo[widthbase[f]+i.b0].int>w then goto 30;c:=y;end;30:{:784};
end;
if x<>-268435455 then begin if((fontarea[f]=65534)and(isOpenTypeMathFont
(fontlayoutengine[f])))then if((mem[q].hh.b1=2)or(mem[q].hh.b1=3))then
delta:=0 else if h<getotmathconstant(f,6)then delta:=h else delta:=
getotmathconstant(f,6)else if h<fontinfo[5+parambase[f]].int then delta
:=h else delta:=fontinfo[5+parambase[f]].int;
if(mem[q+2].hh.rh<>0)or(mem[q+3].hh.rh<>0)then if mem[q+1].hh.rh=1 then{
786:}begin flushnodelist(x);x:=newnoad;mem[x+1]:=mem[q+1];
mem[x+2]:=mem[q+2];mem[x+3]:=mem[q+3];mem[q+2].hh:=emptyfield;
mem[q+3].hh:=emptyfield;mem[q+1].hh.rh:=3;mem[q+1].hh.lh:=x;
x:=cleanbox(q+1,curstyle);delta:=delta+mem[x+3].int-h;h:=mem[x+3].int;
end{:786};y:=charbox(f,c);
if((fontarea[f]=65535)or(fontarea[f]=65534))then begin p:=getnode(5);
mem[p].hh.b0:=8;mem[p].hh.b1:=42;mem[p+4].qqqq.b1:=f;
mem[p+4].qqqq.b2:=getnativeglyph(mem[y+5].hh.rh,0);
setnativeglyphmetrics(p,1);
freenode(mem[y+5].hh.rh,mem[mem[y+5].hh.rh+4].qqqq.b0);
mem[y+5].hh.rh:=p;{783:}
if odd(mem[q].hh.b1)then setnativeglyphmetrics(p,1)else begin c:=mem[p+4
].qqqq.b2;a:=0;repeat g:=getotmathvariant(f,c,a,addressof(w2),1);
if(w2>0)and(w2<=w)then begin mem[p+4].qqqq.b2:=g;
setnativeglyphmetrics(p,1);incr(a);end;until(w2<0)or(w2>=w);
if(w2<0)then begin otassemblyptr:=getotassemblyptr(f,c,1);
if otassemblyptr<>nil then begin freenode(p,5);
p:=buildopentypeassembly(f,otassemblyptr,w,1);mem[y+5].hh.rh:=p;goto 40;
end;end else setnativeglyphmetrics(p,1);end;
40:mem[y+1].int:=mem[p+1].int;mem[y+3].int:=mem[p+3].int;
mem[y+2].int:=mem[p+2].int;
if((mem[q].hh.b1=2)or(mem[q].hh.b1=3))then begin if mem[y+3].int<0 then
mem[y+3].int:=0 end else if mem[y+2].int<0 then mem[y+2].int:=0;{:783};
if(((p)<>-268435455 and(not(p>=himemmin))and(mem[p].hh.b0=8)and(mem[p].
hh.b1=42)))then begin sa:=getotmathaccentpos(f,mem[p+4].qqqq.b2);
if sa=2147483647 then sa:=half(mem[y+1].int);
end else sa:=half(mem[y+1].int);
if((mem[q].hh.b1=2)or(mem[q].hh.b1=3))or(s=2147483647)then s:=half(w);
mem[y+4].int:=s-sa;end else mem[y+4].int:=s+half(w-mem[y+1].int);
mem[y+1].int:=0;
if((mem[q].hh.b1=2)or(mem[q].hh.b1=3))then begin mem[x].hh.rh:=y;
y:=vpackage(x,0,1,1073741823);mem[y+4].int:=-(h-mem[y+3].int);
end else begin p:=newkern(-delta);mem[p].hh.rh:=x;mem[y].hh.rh:=p;
y:=vpackage(y,0,1,1073741823);if mem[y+3].int<h then{782:}
begin p:=newkern(h-mem[y+3].int);mem[p].hh.rh:=mem[y+5].hh.rh;
mem[y+5].hh.rh:=p;mem[y+3].int:=h;end{:782};end;
mem[y+1].int:=mem[x+1].int;mem[q+1].hh.lh:=y;mem[q+1].hh.rh:=2;end;
freeotassembly(otassemblyptr);end;{:781}{787:}
procedure makefraction(q:halfword);var p,v,x,y,z:halfword;
delta,delta1,delta2,shiftup,shiftdown,clr:scaled;
begin if mem[q+1].int=1073741824 then mem[q+1].int:=defaultrulethickness
;{788:}x:=cleanbox(q+2,curstyle+2-2*(curstyle div 6));
z:=cleanbox(q+3,2*(curstyle div 2)+3-2*(curstyle div 6));
if mem[x+1].int<mem[z+1].int then x:=rebox(x,mem[z+1].int)else z:=rebox(
z,mem[x+1].int);if curstyle<2 then begin shiftup:=num1(cursize);
shiftdown:=denom1(cursize);end else begin shiftdown:=denom2(cursize);
if mem[q+1].int<>0 then shiftup:=num2(cursize)else shiftup:=num3(cursize
);end{:788};if mem[q+1].int=0 then{789:}
begin if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[
curf])))then begin if curstyle<2 then clr:=getotmathconstant(curf,27)
else clr:=getotmathconstant(curf,26);
end else begin if curstyle<2 then clr:=7*defaultrulethickness else clr:=
3*defaultrulethickness;end;
delta:=half(clr-((shiftup-mem[x+2].int)-(mem[z+3].int-shiftdown)));
if delta>0 then begin shiftup:=shiftup+delta;shiftdown:=shiftdown+delta;
end;end{:789}else{790:}
begin if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[
curf])))then begin delta:=half(mem[q+1].int);
if curstyle<2 then clr:=getotmathconstant(curf,37)else clr:=
getotmathconstant(curf,36);
delta1:=clr-((shiftup-mem[x+2].int)-(axisheight(cursize)+delta));
if curstyle<2 then clr:=getotmathconstant(curf,40)else clr:=
getotmathconstant(curf,39);
delta2:=clr-((axisheight(cursize)-delta)-(mem[z+3].int-shiftdown));
end else begin if curstyle<2 then clr:=3*mem[q+1].int else clr:=mem[q+1]
.int;delta:=half(mem[q+1].int);
delta1:=clr-((shiftup-mem[x+2].int)-(axisheight(cursize)+delta));
delta2:=clr-((axisheight(cursize)-delta)-(mem[z+3].int-shiftdown));end;
if delta1>0 then shiftup:=shiftup+delta1;
if delta2>0 then shiftdown:=shiftdown+delta2;end{:790};{791:}
v:=newnullbox;mem[v].hh.b0:=1;mem[v+3].int:=shiftup+mem[x+3].int;
mem[v+2].int:=mem[z+2].int+shiftdown;mem[v+1].int:=mem[x+1].int;
if mem[q+1].int=0 then begin p:=newkern((shiftup-mem[x+2].int)-(mem[z+3]
.int-shiftdown));mem[p].hh.rh:=z;
end else begin y:=fractionrule(mem[q+1].int);
p:=newkern((axisheight(cursize)-delta)-(mem[z+3].int-shiftdown));
mem[y].hh.rh:=p;mem[p].hh.rh:=z;
p:=newkern((shiftup-mem[x+2].int)-(axisheight(cursize)+delta));
mem[p].hh.rh:=y;end;mem[x].hh.rh:=p;mem[v+5].hh.rh:=x{:791};{792:}
if curstyle<2 then delta:=delim1(cursize)else delta:=delim2(cursize);
x:=vardelimiter(q+4,cursize,delta);mem[x].hh.rh:=v;
z:=vardelimiter(q+5,cursize,delta);mem[v].hh.rh:=z;
mem[q+1].int:=hpack(x,0,1){:792};end;{:787}{793:}
function makeop(q:halfword):scaled;label 40;var delta:scaled;
p,v,x,y,z:halfword;c:quarterword;i:fourquarters;
shiftup,shiftdown:scaled;h1,h2:scaled;n,g:integer;
otassemblyptr:voidpointer;savef:internalfontnumber;
begin if(mem[q].hh.b1=0)and(curstyle<2)then mem[q].hh.b1:=1;delta:=0;
otassemblyptr:=nil;if mem[q+1].hh.rh=1 then begin fetch(q+1);
if not((fontarea[curf]=65534)and(usingOpenType(fontlayoutengine[curf])))
then begin if(curstyle<2)and(((curi.b2)mod 4)=2)then begin c:=curi.b3;
i:=fontinfo[charbase[curf]+c].qqqq;if(i.b0>0)then begin curc:=c;curi:=i;
mem[q+1].hh.b1:=c;end;end;
delta:=fontinfo[italicbase[curf]+(curi.b2)div 4].int;end;
x:=cleanbox(q+1,curstyle);
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then begin p:=mem[x+5].hh.rh;
if(((p)<>-268435455 and(not(p>=himemmin))and(mem[p].hh.b0=8)and(mem[p].
hh.b1=42)))then begin if curstyle<2 then begin h1:=getotmathconstant(
curf,3);
if h1<(mem[p+3].int+mem[p+2].int)*5/4 then h1:=(mem[p+3].int+mem[p+2].
int)*5/4;c:=mem[p+4].qqqq.b2;n:=0;
repeat g:=getotmathvariant(curf,c,n,addressof(h2),0);
if h2>0 then begin mem[p+4].qqqq.b2:=g;setnativeglyphmetrics(p,1);end;
incr(n);until(h2<0)or(h2>=h1);
if(h2<0)then begin otassemblyptr:=getotassemblyptr(curf,c,0);
if otassemblyptr<>nil then begin freenode(p,5);
p:=buildopentypeassembly(curf,otassemblyptr,h1,0);mem[x+5].hh.rh:=p;
delta:=0;goto 40;end;end else setnativeglyphmetrics(p,1);end;
delta:=getotmathitalcorr(curf,mem[p+4].qqqq.b2);
40:mem[x+1].int:=mem[p+1].int;mem[x+3].int:=mem[p+3].int;
mem[x+2].int:=mem[p+2].int;end end;
if(mem[q+3].hh.rh<>0)and(mem[q].hh.b1<>1)then mem[x+1].int:=mem[x+1].int
-delta;
mem[x+4].int:=half(mem[x+3].int-mem[x+2].int)-axisheight(cursize);
mem[q+1].hh.rh:=2;mem[q+1].hh.lh:=x;end;savef:=curf;
if mem[q].hh.b1=1 then{794:}
begin x:=cleanbox(q+2,2*(curstyle div 4)+4+(curstyle mod 2));
y:=cleanbox(q+1,curstyle);z:=cleanbox(q+3,2*(curstyle div 4)+5);
v:=newnullbox;mem[v].hh.b0:=1;mem[v+1].int:=mem[y+1].int;
if mem[x+1].int>mem[v+1].int then mem[v+1].int:=mem[x+1].int;
if mem[z+1].int>mem[v+1].int then mem[v+1].int:=mem[z+1].int;
x:=rebox(x,mem[v+1].int);y:=rebox(y,mem[v+1].int);
z:=rebox(z,mem[v+1].int);mem[x+4].int:=half(delta);
mem[z+4].int:=-mem[x+4].int;mem[v+3].int:=mem[y+3].int;
mem[v+2].int:=mem[y+2].int;{795:}curf:=savef;
if mem[q+2].hh.rh=0 then begin freenode(x,8);mem[v+5].hh.rh:=y;
end else begin shiftup:=bigopspacing3-mem[x+2].int;
if shiftup<bigopspacing1 then shiftup:=bigopspacing1;
p:=newkern(shiftup);mem[p].hh.rh:=y;mem[x].hh.rh:=p;
p:=newkern(bigopspacing5);mem[p].hh.rh:=x;mem[v+5].hh.rh:=p;
mem[v+3].int:=mem[v+3].int+bigopspacing5+mem[x+3].int+mem[x+2].int+
shiftup;end;if mem[q+3].hh.rh=0 then freenode(z,8)else begin shiftdown:=
bigopspacing4-mem[z+3].int;
if shiftdown<bigopspacing2 then shiftdown:=bigopspacing2;
p:=newkern(shiftdown);mem[y].hh.rh:=p;mem[p].hh.rh:=z;
p:=newkern(bigopspacing5);mem[z].hh.rh:=p;
mem[v+2].int:=mem[v+2].int+bigopspacing5+mem[z+3].int+mem[z+2].int+
shiftdown;end{:795};mem[q+1].int:=v;end{:794};
freeotassembly(otassemblyptr);makeop:=delta;end;{:793}{796:}
procedure makeord(q:halfword);label 20,10;var a:integer;p,r:halfword;
begin 20:if mem[q+3].hh.rh=0 then if mem[q+2].hh.rh=0 then if mem[q+1].
hh.rh=1 then begin p:=mem[q].hh.rh;
if p<>-268435455 then if(mem[p].hh.b0>=16)and(mem[p].hh.b0<=22)then if
mem[p+1].hh.rh=1 then if(mem[p+1].hh.b0 mod 256)=(mem[q+1].hh.b0 mod 256
)then begin mem[q+1].hh.rh:=4;fetch(q+1);
if((curi.b2)mod 4)=1 then begin a:=ligkernbase[curf]+curi.b3;
curc:=mem[p+1].hh.b1;curi:=fontinfo[a].qqqq;
if curi.b0>128 then begin a:=ligkernbase[curf]+256*curi.b2+curi.b3
+32768-256*(128);curi:=fontinfo[a].qqqq;end;while true do begin{797:}
if curi.b1=curc then if curi.b0<=128 then if curi.b2>=128 then begin p:=
newkern(fontinfo[kernbase[curf]+256*curi.b2+curi.b3].int);
mem[p].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=p;goto 10;
end else begin begin if interrupt<>0 then pauseforinstructions;end;
case curi.b2 of 1,5:mem[q+1].hh.b1:=curi.b3;2,6:mem[p+1].hh.b1:=curi.b3;
3,7,11:begin r:=newnoad;mem[r+1].hh.b1:=curi.b3;
mem[r+1].hh.b0:=(mem[q+1].hh.b0 mod 256);mem[q].hh.rh:=r;
mem[r].hh.rh:=p;
if curi.b2<11 then mem[r+1].hh.rh:=1 else mem[r+1].hh.rh:=4;end;
others:begin mem[q].hh.rh:=mem[p].hh.rh;mem[q+1].hh.b1:=curi.b3;
mem[q+3]:=mem[p+3];mem[q+2]:=mem[p+2];freenode(p,4);end end;
if curi.b2>3 then goto 10;mem[q+1].hh.rh:=1;goto 20;end{:797};
if curi.b0>=128 then goto 10;a:=a+curi.b0+1;curi:=fontinfo[a].qqqq;end;
end;end;end;10:end;{:796}{800:}
function attachhkerntonewhlist(q:halfword;delta:scaled):halfword;
var y,z:halfword;begin z:=newkern(delta);
if mem[q+1].int=-268435455 then mem[q+1].int:=z else begin y:=mem[q+1].
int;while mem[y].hh.rh<>-268435455 do y:=mem[y].hh.rh;mem[y].hh.rh:=z;
end;attachhkerntonewhlist:=mem[q+1].int;end;
procedure makescripts(q:halfword;delta:scaled);var p,x,y,z:halfword;
shiftup,shiftdown,clr,subkern,supkern:scaled;scriptc:halfword;
scriptg:quarterword;scriptf:internalfontnumber;supg:quarterword;
supf:internalfontnumber;subg:quarterword;subf:internalfontnumber;
t:integer;savef:internalfontnumber;scripthead:halfword;
scriptptr:halfword;savedmathstyle:smallnumber;thismathstyle:smallnumber;
begin p:=mem[q+1].int;scriptc:=-268435455;scriptg:=0;scriptf:=0;
supkern:=0;subkern:=0;
if(p>=himemmin)or(((p)<>-268435455 and(not(p>=himemmin))and(mem[p].hh.b0
=8)and(mem[p].hh.b1=42)))then begin shiftup:=0;shiftdown:=0;
end else begin z:=hpack(p,0,1);if curstyle<4 then t:=256 else t:=512;
shiftup:=mem[z+3].int-supdrop(t);shiftdown:=mem[z+2].int+subdrop(t);
freenode(z,8);end;if mem[q+2].hh.rh=0 then{801:}begin scripthead:=q+3;
{805:}scriptc:=-268435455;scriptg:=0;scriptf:=0;
thismathstyle:=2*(curstyle div 4)+5;
if mem[scripthead].hh.rh=3 then begin scriptptr:=mem[scripthead].hh.lh;
scripthead:=-268435455;
while((scriptptr>=memmin)and(scriptptr<=memend))do begin case mem[
scriptptr].hh.b0 of 11,10:;14:begin thismathstyle:=mem[scriptptr].hh.b1;
end;15:;16,17,18,19,20,21,22:begin scripthead:=scriptptr+1;
scriptptr:=-268435455;end;others:scriptptr:=-268435455 end;
if((scriptptr>=memmin)and(scriptptr<=memend))then if mem[scriptptr].hh.
b0=15 then case thismathstyle div 2 of 0:scriptptr:=mem[scriptptr+1].hh.
lh;1:scriptptr:=mem[scriptptr+1].hh.rh;
2:scriptptr:=mem[scriptptr+2].hh.lh;3:scriptptr:=mem[scriptptr+2].hh.rh;
end else scriptptr:=mem[scriptptr].hh.rh;end;end;
if((scripthead>=memmin)and(scripthead<=memend))and mem[scripthead].hh.rh
=1 then begin savef:=curf;savedmathstyle:=curstyle;
curstyle:=thismathstyle;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};fetch(scripthead);
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then begin scriptc:=newnativecharacter(curf,curc);
scriptg:=getnativeglyph(scriptc,0);scriptf:=curf;end;curf:=savef;
curstyle:=savedmathstyle;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};end;{:805};
subg:=scriptg;subf:=scriptf;savef:=curf;
x:=cleanbox(q+3,2*(curstyle div 4)+5);curf:=savef;
mem[x+1].int:=mem[x+1].int+eqtb[9006732].int;
if shiftdown<sub1(cursize)then shiftdown:=sub1(cursize);
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then clr:=mem[x+3].int-getotmathconstant(curf,9)else clr:=mem[x+3].int-
(abs(mathxheight(cursize)*4)div 5);if shiftdown<clr then shiftdown:=clr;
mem[x+4].int:=shiftdown;
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then{806:}
begin if(((p)<>-268435455 and(not(p>=himemmin))and(mem[p].hh.b0=8)and(
mem[p].hh.b1=42)))then begin subkern:=getotmathkern(mem[p+4].qqqq.b1,mem
[p+4].qqqq.b2,subf,subg,1,shiftdown);
if subkern<>0 then p:=attachhkerntonewhlist(q,subkern);end;end;{:806}
end{:801}else begin{802:}begin scripthead:=q+2;{805:}
scriptc:=-268435455;scriptg:=0;scriptf:=0;
thismathstyle:=2*(curstyle div 4)+5;
if mem[scripthead].hh.rh=3 then begin scriptptr:=mem[scripthead].hh.lh;
scripthead:=-268435455;
while((scriptptr>=memmin)and(scriptptr<=memend))do begin case mem[
scriptptr].hh.b0 of 11,10:;14:begin thismathstyle:=mem[scriptptr].hh.b1;
end;15:;16,17,18,19,20,21,22:begin scripthead:=scriptptr+1;
scriptptr:=-268435455;end;others:scriptptr:=-268435455 end;
if((scriptptr>=memmin)and(scriptptr<=memend))then if mem[scriptptr].hh.
b0=15 then case thismathstyle div 2 of 0:scriptptr:=mem[scriptptr+1].hh.
lh;1:scriptptr:=mem[scriptptr+1].hh.rh;
2:scriptptr:=mem[scriptptr+2].hh.lh;3:scriptptr:=mem[scriptptr+2].hh.rh;
end else scriptptr:=mem[scriptptr].hh.rh;end;end;
if((scripthead>=memmin)and(scripthead<=memend))and mem[scripthead].hh.rh
=1 then begin savef:=curf;savedmathstyle:=curstyle;
curstyle:=thismathstyle;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};fetch(scripthead);
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then begin scriptc:=newnativecharacter(curf,curc);
scriptg:=getnativeglyph(scriptc,0);scriptf:=curf;end;curf:=savef;
curstyle:=savedmathstyle;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};end;{:805};
supg:=scriptg;supf:=scriptf;savef:=curf;
x:=cleanbox(q+2,2*(curstyle div 4)+4+(curstyle mod 2));curf:=savef;
mem[x+1].int:=mem[x+1].int+eqtb[9006732].int;
if odd(curstyle)then clr:=sup3(cursize)else if curstyle<2 then clr:=sup1
(cursize)else clr:=sup2(cursize);if shiftup<clr then shiftup:=clr;
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then clr:=mem[x+2].int+getotmathconstant(curf,13)else clr:=mem[x+2].int
+(abs(mathxheight(cursize))div 4);if shiftup<clr then shiftup:=clr;
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then{807:}
begin if mem[q+3].hh.rh=0 then if(((p)<>-268435455 and(not(p>=himemmin))
and(mem[p].hh.b0=8)and(mem[p].hh.b1=42)))then begin supkern:=
getotmathkern(mem[p+4].qqqq.b1,mem[p+4].qqqq.b2,supf,supg,0,shiftup);
if supkern<>0 then p:=attachhkerntonewhlist(q,supkern);end;end;{:807}
end{:802};if mem[q+3].hh.rh=0 then mem[x+4].int:=-shiftup else{803:}
begin savef:=curf;scripthead:=q+3;{805:}scriptc:=-268435455;scriptg:=0;
scriptf:=0;thismathstyle:=2*(curstyle div 4)+5;
if mem[scripthead].hh.rh=3 then begin scriptptr:=mem[scripthead].hh.lh;
scripthead:=-268435455;
while((scriptptr>=memmin)and(scriptptr<=memend))do begin case mem[
scriptptr].hh.b0 of 11,10:;14:begin thismathstyle:=mem[scriptptr].hh.b1;
end;15:;16,17,18,19,20,21,22:begin scripthead:=scriptptr+1;
scriptptr:=-268435455;end;others:scriptptr:=-268435455 end;
if((scriptptr>=memmin)and(scriptptr<=memend))then if mem[scriptptr].hh.
b0=15 then case thismathstyle div 2 of 0:scriptptr:=mem[scriptptr+1].hh.
lh;1:scriptptr:=mem[scriptptr+1].hh.rh;
2:scriptptr:=mem[scriptptr+2].hh.lh;3:scriptptr:=mem[scriptptr+2].hh.rh;
end else scriptptr:=mem[scriptptr].hh.rh;end;end;
if((scripthead>=memmin)and(scripthead<=memend))and mem[scripthead].hh.rh
=1 then begin savef:=curf;savedmathstyle:=curstyle;
curstyle:=thismathstyle;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};fetch(scripthead);
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then begin scriptc:=newnativecharacter(curf,curc);
scriptg:=getnativeglyph(scriptc,0);scriptf:=curf;end;curf:=savef;
curstyle:=savedmathstyle;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};end;{:805};
subg:=scriptg;subf:=scriptf;y:=cleanbox(q+3,2*(curstyle div 4)+5);
curf:=savef;mem[y+1].int:=mem[y+1].int+eqtb[9006732].int;
if shiftdown<sub2(cursize)then shiftdown:=sub2(cursize);
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then clr:=getotmathconstant(curf,15)-((shiftup-mem[x+2].int)-(mem[y+3].
int-shiftdown))else clr:=4*defaultrulethickness-((shiftup-mem[x+2].int)-
(mem[y+3].int-shiftdown));if clr>0 then begin shiftdown:=shiftdown+clr;
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then clr:=getotmathconstant(curf,16)-(shiftup-mem[x+2].int)else clr:=(
abs(mathxheight(cursize)*4)div 5)-(shiftup-mem[x+2].int);
if clr>0 then begin shiftup:=shiftup+clr;shiftdown:=shiftdown-clr;end;
end;
if((fontarea[curf]=65534)and(isOpenTypeMathFont(fontlayoutengine[curf]))
)then begin{806:}
begin if(((p)<>-268435455 and(not(p>=himemmin))and(mem[p].hh.b0=8)and(
mem[p].hh.b1=42)))then begin subkern:=getotmathkern(mem[p+4].qqqq.b1,mem
[p+4].qqqq.b2,subf,subg,1,shiftdown);
if subkern<>0 then p:=attachhkerntonewhlist(q,subkern);end;end;{:806}
{807:}
begin if mem[q+3].hh.rh=0 then if(((p)<>-268435455 and(not(p>=himemmin))
and(mem[p].hh.b0=8)and(mem[p].hh.b1=42)))then begin supkern:=
getotmathkern(mem[p+4].qqqq.b1,mem[p+4].qqqq.b2,supf,supg,0,shiftup);
if supkern<>0 then p:=attachhkerntonewhlist(q,supkern);end;end;{:807}
end else begin supkern:=0;subkern:=0;end;
mem[x+4].int:=supkern+delta-subkern;
p:=newkern((shiftup-mem[x+2].int)-(mem[y+3].int-shiftdown));
mem[x].hh.rh:=p;mem[p].hh.rh:=y;x:=vpackage(x,0,1,1073741823);
mem[x+4].int:=shiftdown;end{:803};end;
if mem[q+1].int=-268435455 then mem[q+1].int:=x else begin p:=mem[q+1].
int;while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;mem[p].hh.rh:=x;
end;end;{:800}{810:}function makeleftright(q:halfword;style:smallnumber;
maxd,maxh:scaled):smallnumber;var delta,delta1,delta2:scaled;
begin curstyle:=style;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};
delta2:=maxd+axisheight(cursize);delta1:=maxh+maxd-delta2;
if delta2>delta1 then delta1:=delta2;
delta:=(delta1 div 500)*eqtb[7892282].int;
delta2:=delta1+delta1-eqtb[9006730].int;
if delta<delta2 then delta:=delta2;
mem[q+1].int:=vardelimiter(q+1,cursize,delta);
makeleftright:=mem[q].hh.b0-(10);end;{:810}procedure mlisttohlist;
label 21,82,80,81,83,30;var mlist:halfword;penalties:boolean;
style:smallnumber;savestyle:smallnumber;q:halfword;r:halfword;
rtype:smallnumber;t:smallnumber;p,x,y,z:halfword;pen:integer;
s:smallnumber;maxh,maxd:scaled;delta:scaled;begin mlist:=curmlist;
penalties:=mlistpenalties;style:=curstyle;q:=mlist;r:=-268435455;
rtype:=17;maxh:=0;maxd:=0;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};
while q<>-268435455 do{770:}begin{771:}21:delta:=0;
case mem[q].hh.b0 of 18:case rtype of 18,17,19,20,22,30:begin mem[q].hh.
b0:=16;goto 21;end;others:end;19,21,22,31:begin{772:}
if rtype=18 then mem[r].hh.b0:=16{:772};if mem[q].hh.b0=31 then goto 80;
end;{776:}30:goto 80;25:begin makefraction(q);goto 82;end;
17:begin delta:=makeop(q);if mem[q].hh.b1=1 then goto 82;end;
16:makeord(q);20,23:;24:makeradical(q);27:makeover(q);26:makeunder(q);
28:makemathaccent(q);29:makevcenter(q);{:776}{773:}
14:begin curstyle:=mem[q].hh.b1;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};goto 81;end;15:{774:}
begin case curstyle div 2 of 0:begin p:=mem[q+1].hh.lh;
mem[q+1].hh.lh:=-268435455;end;1:begin p:=mem[q+1].hh.rh;
mem[q+1].hh.rh:=-268435455;end;2:begin p:=mem[q+2].hh.lh;
mem[q+2].hh.lh:=-268435455;end;3:begin p:=mem[q+2].hh.rh;
mem[q+2].hh.rh:=-268435455;end;end;flushnodelist(mem[q+1].hh.lh);
flushnodelist(mem[q+1].hh.rh);flushnodelist(mem[q+2].hh.lh);
flushnodelist(mem[q+2].hh.rh);mem[q].hh.b0:=14;mem[q].hh.b1:=curstyle;
mem[q+1].int:=0;mem[q+2].int:=0;
if p<>-268435455 then begin z:=mem[q].hh.rh;mem[q].hh.rh:=p;
while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;mem[p].hh.rh:=z;end;
goto 81;end{:774};3,4,5,8,12,7:goto 81;
2:begin if mem[q+3].int>maxh then maxh:=mem[q+3].int;
if mem[q+2].int>maxd then maxd:=mem[q+2].int;goto 81;end;10:begin{775:}
if mem[q].hh.b1=99 then begin x:=mem[q+1].hh.lh;y:=mathglue(x,curmu);
deleteglueref(x);mem[q+1].hh.lh:=y;mem[q].hh.b1:=0;
end else if(cursize<>0)and(mem[q].hh.b1=98)then begin p:=mem[q].hh.rh;
if p<>-268435455 then if(mem[p].hh.b0=10)or(mem[p].hh.b0=11)then begin
mem[q].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=-268435455;flushnodelist(p);
end;end{:775};goto 81;end;11:begin mathkern(q,curmu);goto 81;end;{:773}
others:confusion(66317)end;{798:}case mem[q+1].hh.rh of 1,4:{799:}
begin fetch(q+1);
if((fontarea[curf]=65535)or(fontarea[curf]=65534))then begin z:=
newnativecharacter(curf,curc);p:=getnode(5);mem[p].hh.b0:=8;
mem[p].hh.b1:=42;mem[p+4].qqqq.b1:=curf;
mem[p+4].qqqq.b2:=getnativeglyph(z,0);setnativeglyphmetrics(p,1);
freenode(z,mem[z+4].qqqq.b0);
delta:=getotmathitalcorr(curf,mem[p+4].qqqq.b2);
if(mem[q+1].hh.rh=4)and(not((fontarea[curf]=65534)and(isOpenTypeMathFont
(fontlayoutengine[curf])))<>0)then delta:=0;
if(mem[q+3].hh.rh=0)and(delta<>0)then begin mem[p].hh.rh:=newkern(delta)
;delta:=0;end;
end else if(curi.b0>0)then begin delta:=fontinfo[italicbase[curf]+(curi.
b2)div 4].int;p:=newcharacter(curf,curc);
if(mem[q+1].hh.rh=4)and(fontinfo[2+parambase[curf]].int<>0)then delta:=0
;
if(mem[q+3].hh.rh=0)and(delta<>0)then begin mem[p].hh.rh:=newkern(delta)
;delta:=0;end;end else p:=-268435455;end{:799};0:p:=-268435455;
2:p:=mem[q+1].hh.lh;3:begin curmlist:=mem[q+1].hh.lh;
savestyle:=curstyle;mlistpenalties:=false;mlisttohlist;
curstyle:=savestyle;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};
p:=hpack(mem[memtop-3].hh.rh,0,1);end;others:confusion(66318)end;
mem[q+1].int:=p;if(mem[q+3].hh.rh=0)and(mem[q+2].hh.rh=0)then goto 82;
makescripts(q,delta){:798}{:771};82:z:=hpack(mem[q+1].int,0,1);
if mem[z+3].int>maxh then maxh:=mem[z+3].int;
if mem[z+2].int>maxd then maxd:=mem[z+2].int;freenode(z,8);80:r:=q;
rtype:=mem[r].hh.b0;if rtype=31 then begin rtype:=30;curstyle:=style;
{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};end;81:q:=mem[q].hh.rh;
end{:770};{772:}if rtype=18 then mem[r].hh.b0:=16{:772};{808:}
p:=memtop-3;mem[p].hh.rh:=-268435455;q:=mlist;rtype:=0;curstyle:=style;
{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};
while q<>-268435455 do begin{809:}t:=16;s:=4;pen:=10000;
case mem[q].hh.b0 of 17,20,21,22,23:t:=mem[q].hh.b0;18:begin t:=18;
pen:=eqtb[7892273].int;end;19:begin t:=19;pen:=eqtb[7892274].int;end;
16,29,27,26:;24:s:=5;28:s:=5;25:s:=6;
30,31:t:=makeleftright(q,style,maxd,maxh);14:{811:}
begin curstyle:=mem[q].hh.b1;s:=3;{746:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);curmu:=xovern(mathquad(cursize),18);end{:746};goto 83;end{:811};
8,12,2,7,5,3,4,10,11:begin mem[p].hh.rh:=q;p:=q;q:=mem[q].hh.rh;
mem[p].hh.rh:=-268435455;goto 30;end;others:confusion(66319)end{:809};
{814:}
if rtype>0 then begin case strpool[rtype*8+t+magicoffset]of 48:x:=0;
49:if curstyle<4 then x:=16 else x:=0;50:x:=16;
51:if curstyle<4 then x:=17 else x:=0;
52:if curstyle<4 then x:=18 else x:=0;others:confusion(66321)end;
if x<>0 then begin y:=mathglue(eqtb[1205764+x].hh.rh,curmu);
z:=newglue(y);mem[y].hh.rh:=-268435455;mem[p].hh.rh:=z;p:=z;
mem[z].hh.b1:=x+1;end;end{:814};{815:}
if mem[q+1].int<>-268435455 then begin mem[p].hh.rh:=mem[q+1].int;
repeat p:=mem[p].hh.rh;until mem[p].hh.rh=-268435455;end;
if penalties then if mem[q].hh.rh<>-268435455 then if pen<10000 then
begin rtype:=mem[mem[q].hh.rh].hh.b0;
if rtype<>12 then if rtype<>19 then begin z:=newpenalty(pen);
mem[p].hh.rh:=z;p:=z;end;end{:815};if mem[q].hh.b0=31 then t:=20;
rtype:=t;83:r:=q;q:=mem[q].hh.rh;freenode(r,s);30:end{:808};end;{:769}
{820:}procedure pushalignment;var p:halfword;begin p:=getnode(6);
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
alignptr:=mem[p].hh.rh;freenode(p,6);end;{:820}{822:}{830:}
procedure getpreambletoken;label 20;begin 20:gettoken;
while(curchr=1114113)and(curcmd=4)do begin gettoken;
if curcmd>103 then begin expand;gettoken;end;end;
if curcmd=9 then fatalerror(65924);
if(curcmd=76)and(curchr=1205775)then begin scanoptionalequals;
scanglue(2);
if eqtb[7892307].int>0 then geqdefine(1205775,120,curval)else eqdefine(
1205775,120,curval);goto 20;end;end;{:830}procedure alignpeek;forward;
procedure normalparagraph;forward;procedure initalign;label 30,31,32,22;
var savecsptr:halfword;p:halfword;begin savecsptr:=curcs;pushalignment;
alignstate:=-1000000;{824:}
if(curlist.modefield=209)and((curlist.tailfield<>curlist.headfield)or(
curlist.auxfield.int<>-268435455))then begin begin if interaction=3 then
;if filelineerrorstylep then printfileline else printnl(65544);
print(66029);end;printesc(65835);print(66322);begin helpptr:=3;
helpline[2]:=66323;helpline[1]:=66324;helpline[0]:=66325;end;error;
flushmath;end{:824};pushnest;{823:}
if curlist.modefield=209 then begin curlist.modefield:=-1;
curlist.auxfield.int:=nest[nestptr-2].auxfield.int;
end else if curlist.modefield>0 then curlist.modefield:=-curlist.
modefield{:823};scanspec(6,false);{825:}mem[memtop-8].hh.rh:=-268435455;
curalign:=memtop-8;curloop:=-268435455;scannerstatus:=4;
warningindex:=savecsptr;alignstate:=-1000000;while true do begin{826:}
mem[curalign].hh.rh:=newparamglue(11);
curalign:=mem[curalign].hh.rh{:826};if curcmd=5 then goto 30;{827:}
{831:}p:=memtop-4;mem[p].hh.rh:=-268435455;
while true do begin getpreambletoken;if curcmd=6 then goto 31;
if(curcmd<=5)and(curcmd>=4)and(alignstate=-1000000)then if(p=memtop-4)
and(curloop=-268435455)and(curcmd=4)then curloop:=curalign else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66331);end;begin helpptr:=3;helpline[2]:=66332;helpline[1]:=66333;
helpline[0]:=66334;end;backerror;goto 31;
end else if(curcmd<>10)or(p<>memtop-4)then begin mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=curtok;end;end;31:{:831};
mem[curalign].hh.rh:=newnullbox;curalign:=mem[curalign].hh.rh;
mem[curalign].hh.lh:=memtop-9;mem[curalign+1].int:=-1073741824;
mem[curalign+3].int:=mem[memtop-4].hh.rh;{832:}p:=memtop-4;
mem[p].hh.rh:=-268435455;while true do begin 22:getpreambletoken;
if(curcmd<=5)and(curcmd>=4)and(alignstate=-1000000)then goto 32;
if curcmd=6 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66335);end;begin helpptr:=3;helpline[2]:=66332;helpline[1]:=66333;
helpline[0]:=66336;end;error;goto 22;end;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=curtok;end;32:mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=34749086{:832};
mem[curalign+2].int:=mem[memtop-4].hh.rh{:827};end;
30:scannerstatus:=0{:825};newsavelevel(6);
if eqtb[1206303].hh.rh<>-268435455 then begintokenlist(eqtb[1206303].hh.
rh,14);alignpeek;end;{:822}{834:}{835:}procedure initspan(p:halfword);
begin pushnest;
if curlist.modefield=-105 then curlist.auxfield.hh.lh:=1000 else begin
curlist.auxfield.int:=-65536000;normalparagraph;end;curspan:=p;end;
{:835}procedure initrow;begin pushnest;
curlist.modefield:=(-106)-curlist.modefield;
if curlist.modefield=-105 then curlist.auxfield.hh.lh:=0 else curlist.
auxfield.int:=0;
begin mem[curlist.tailfield].hh.rh:=newglue(mem[mem[memtop-8].hh.rh+1].
hh.lh);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=12;
curalign:=mem[mem[memtop-8].hh.rh].hh.rh;curtail:=curhead;
curpretail:=curprehead;initspan(curalign);end;{:834}{836:}
procedure initcol;begin mem[curalign+5].hh.lh:=curcmd;
if curcmd=63 then alignstate:=0 else begin backinput;
begintokenlist(mem[curalign+3].int,1);end;end;{:836}{839:}
function fincol:boolean;label 10;var p:halfword;q,r:halfword;s:halfword;
u:halfword;w:scaled;o:glueord;n:halfword;
begin if curalign=-268435455 then confusion(66337);
q:=mem[curalign].hh.rh;if q=-268435455 then confusion(66337);
if alignstate<500000 then fatalerror(65924);p:=mem[q].hh.rh;{840:}
if(p=-268435455)and(mem[curalign+5].hh.lh<1114114)then if curloop<>
-268435455 then{841:}begin mem[q].hh.rh:=newnullbox;p:=mem[q].hh.rh;
mem[p].hh.lh:=memtop-9;mem[p+1].int:=-1073741824;
curloop:=mem[curloop].hh.rh;{842:}q:=memtop-4;r:=mem[curloop+3].int;
while r<>-268435455 do begin mem[q].hh.rh:=getavail;q:=mem[q].hh.rh;
mem[q].hh.lh:=mem[r].hh.lh;r:=mem[r].hh.rh;end;mem[q].hh.rh:=-268435455;
mem[p+3].int:=mem[memtop-4].hh.rh;q:=memtop-4;r:=mem[curloop+2].int;
while r<>-268435455 do begin mem[q].hh.rh:=getavail;q:=mem[q].hh.rh;
mem[q].hh.lh:=mem[r].hh.lh;r:=mem[r].hh.rh;end;mem[q].hh.rh:=-268435455;
mem[p+2].int:=mem[memtop-4].hh.rh{:842};curloop:=mem[curloop].hh.rh;
mem[p].hh.rh:=newglue(mem[curloop+1].hh.lh);mem[mem[p].hh.rh].hh.b1:=12;
end{:841}else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66338);end;printesc(66327);begin helpptr:=3;helpline[2]:=66339;
helpline[1]:=66340;helpline[0]:=66341;end;
mem[curalign+5].hh.lh:=1114114;error;end{:840};
if mem[curalign+5].hh.lh<>1114113 then begin unsave;newsavelevel(6);
{844:}begin if curlist.modefield=-105 then begin adjusttail:=curtail;
preadjusttail:=curpretail;u:=hpack(mem[curlist.headfield].hh.rh,0,1);
w:=mem[u+1].int;curtail:=adjusttail;adjusttail:=-268435455;
curpretail:=preadjusttail;preadjusttail:=-268435455;
end else begin u:=vpackage(mem[curlist.headfield].hh.rh,0,1,0);
w:=mem[u+3].int;end;n:=0;if curspan<>curalign then{846:}
begin q:=curspan;repeat incr(n);q:=mem[mem[q].hh.rh].hh.rh;
until q=curalign;if n>65535 then confusion(66342);q:=curspan;
while mem[mem[q].hh.lh].hh.rh<n do q:=mem[q].hh.lh;
if mem[mem[q].hh.lh].hh.rh>n then begin s:=getnode(2);
mem[s].hh.lh:=mem[q].hh.lh;mem[s].hh.rh:=n;mem[q].hh.lh:=s;
mem[s+1].int:=w;
end else if mem[mem[q].hh.lh+1].int<w then mem[mem[q].hh.lh+1].int:=w;
end{:846}else if w>mem[curalign+1].int then mem[curalign+1].int:=w;
mem[u].hh.b0:=13;mem[u].hh.b1:=n;{701:}
if totalstretch[3]<>0 then o:=3 else if totalstretch[2]<>0 then o:=2
else if totalstretch[1]<>0 then o:=1 else o:=0{:701};mem[u+5].hh.b1:=o;
mem[u+6].int:=totalstretch[o];{707:}
if totalshrink[3]<>0 then o:=3 else if totalshrink[2]<>0 then o:=2 else
if totalshrink[1]<>0 then o:=1 else o:=0{:707};mem[u+5].hh.b0:=o;
mem[u+4].int:=totalshrink[o];popnest;mem[curlist.tailfield].hh.rh:=u;
curlist.tailfield:=u;end{:844};{843:}
begin mem[curlist.tailfield].hh.rh:=newglue(mem[mem[curalign].hh.rh+1].
hh.lh);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=12{:843};
if mem[curalign+5].hh.lh>=1114114 then begin fincol:=true;goto 10;end;
initspan(p);end;alignstate:=1000000;repeat getxorprotected;
until curcmd<>10;curalign:=p;initcol;fincol:=false;10:end;{:839}{847:}
procedure finrow;var p:halfword;
begin if curlist.modefield=-105 then begin p:=hpack(mem[curlist.
headfield].hh.rh,0,1);popnest;
if curprehead<>curpretail then begin mem[curlist.tailfield].hh.rh:=mem[
curprehead].hh.rh;curlist.tailfield:=curpretail;end;appendtovlist(p);
if curhead<>curtail then begin mem[curlist.tailfield].hh.rh:=mem[curhead
].hh.rh;curlist.tailfield:=curtail;end;
end else begin p:=vpackage(mem[curlist.headfield].hh.rh,0,1,1073741823);
popnest;mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
curlist.auxfield.hh.lh:=1000;end;mem[p].hh.b0:=13;mem[p+6].int:=0;
if eqtb[1206303].hh.rh<>-268435455 then begintokenlist(eqtb[1206303].hh.
rh,14);alignpeek;end;{:847}{848:}procedure doassignments;forward;
procedure resumeafterdisplay;forward;procedure buildpage;forward;
procedure finalign;var p,q,r,s,u,v:halfword;t,w:scaled;o:scaled;
n:halfword;rulesave:scaled;auxsave:memoryword;
begin if curgroup<>6 then confusion(66343);unsave;
if curgroup<>6 then confusion(66344);unsave;
if nest[nestptr-1].modefield=209 then o:=eqtb[9006735].int else o:=0;
{849:}q:=mem[mem[memtop-8].hh.rh].hh.rh;repeat flushlist(mem[q+3].int);
flushlist(mem[q+2].int);p:=mem[mem[q].hh.rh].hh.rh;
if mem[q+1].int=-1073741824 then{850:}begin mem[q+1].int:=0;
r:=mem[q].hh.rh;s:=mem[r+1].hh.lh;
if s<>membot then begin incr(mem[membot].hh.rh);deleteglueref(s);
mem[r+1].hh.lh:=membot;end;end{:850};
if mem[q].hh.lh<>memtop-9 then{851:}
begin t:=mem[q+1].int+mem[mem[mem[q].hh.rh+1].hh.lh+1].int;
r:=mem[q].hh.lh;s:=memtop-9;mem[s].hh.lh:=p;n:=1;
repeat mem[r+1].int:=mem[r+1].int-t;u:=mem[r].hh.lh;
while mem[r].hh.rh>n do begin s:=mem[s].hh.lh;
n:=mem[mem[s].hh.lh].hh.rh+1;end;
if mem[r].hh.rh<n then begin mem[r].hh.lh:=mem[s].hh.lh;mem[s].hh.lh:=r;
decr(mem[r].hh.rh);s:=r;
end else begin if mem[r+1].int>mem[mem[s].hh.lh+1].int then mem[mem[s].
hh.lh+1].int:=mem[r+1].int;freenode(r,2);end;r:=u;until r=memtop-9;
end{:851};mem[q].hh.b0:=13;mem[q].hh.b1:=0;mem[q+3].int:=0;
mem[q+2].int:=0;mem[q+5].hh.b1:=0;mem[q+5].hh.b0:=0;mem[q+6].int:=0;
mem[q+4].int:=0;q:=p;until q=-268435455{:849};{852:}saveptr:=saveptr-2;
packbeginline:=-curlist.mlfield;
if curlist.modefield=-1 then begin rulesave:=eqtb[9006736].int;
eqtb[9006736].int:=0;
p:=hpack(mem[memtop-8].hh.rh,savestack[saveptr+1].int,savestack[saveptr
+0].int);eqtb[9006736].int:=rulesave;
end else begin q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat mem[q+3].int:=mem[q+1].int;mem[q+1].int:=0;
q:=mem[mem[q].hh.rh].hh.rh;until q=-268435455;
p:=vpackage(mem[memtop-8].hh.rh,savestack[saveptr+1].int,savestack[
saveptr+0].int,1073741823);q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat mem[q+1].int:=mem[q+3].int;mem[q+3].int:=0;
q:=mem[mem[q].hh.rh].hh.rh;until q=-268435455;end;packbeginline:=0{:852}
;{853:}q:=mem[curlist.headfield].hh.rh;s:=curlist.headfield;
while q<>-268435455 do begin if not(q>=himemmin)then if mem[q].hh.b0=13
then{855:}begin if curlist.modefield=-1 then begin mem[q].hh.b0:=0;
mem[q+1].int:=mem[p+1].int;
if nest[nestptr-1].modefield=209 then mem[q].hh.b1:=2;
end else begin mem[q].hh.b0:=1;mem[q+3].int:=mem[p+3].int;end;
mem[q+5].hh.b1:=mem[p+5].hh.b1;mem[q+5].hh.b0:=mem[p+5].hh.b0;
mem[q+6].gr:=mem[p+6].gr;mem[q+4].int:=o;r:=mem[mem[q+5].hh.rh].hh.rh;
s:=mem[mem[p+5].hh.rh].hh.rh;repeat{856:}n:=mem[r].hh.b1;
t:=mem[s+1].int;w:=t;u:=memtop-4;mem[r].hh.b1:=0;
while n>0 do begin decr(n);{857:}s:=mem[s].hh.rh;v:=mem[s+1].hh.lh;
mem[u].hh.rh:=newglue(v);u:=mem[u].hh.rh;mem[u].hh.b1:=12;
t:=t+mem[v+1].int;
if mem[p+5].hh.b0=1 then begin if mem[v].hh.b0=mem[p+5].hh.b1 then t:=t+
round(mem[p+6].gr*mem[v+2].int);
end else if mem[p+5].hh.b0=2 then begin if mem[v].hh.b1=mem[p+5].hh.b1
then t:=t-round(mem[p+6].gr*mem[v+3].int);end;s:=mem[s].hh.rh;
mem[u].hh.rh:=newnullbox;u:=mem[u].hh.rh;t:=t+mem[s+1].int;
if curlist.modefield=-1 then mem[u+1].int:=mem[s+1].int else begin mem[u
].hh.b0:=1;mem[u+3].int:=mem[s+1].int;end{:857};end;
if curlist.modefield=-1 then{858:}begin mem[r+3].int:=mem[q+3].int;
mem[r+2].int:=mem[q+2].int;
if t=mem[r+1].int then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;
end else if t>mem[r+1].int then begin mem[r+5].hh.b0:=1;
if mem[r+6].int=0 then mem[r+6].gr:=0.0 else mem[r+6].gr:=(t-mem[r+1].
int)/mem[r+6].int;end else begin mem[r+5].hh.b1:=mem[r+5].hh.b0;
mem[r+5].hh.b0:=2;
if mem[r+4].int=0 then mem[r+6].gr:=0.0 else if(mem[r+5].hh.b1=0)and(mem
[r+1].int-t>mem[r+4].int)then mem[r+6].gr:=1.0 else mem[r+6].gr:=(mem[r
+1].int-t)/mem[r+4].int;end;mem[r+1].int:=w;mem[r].hh.b0:=0;end{:858}
else{859:}begin mem[r+1].int:=mem[q+1].int;
if t=mem[r+3].int then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;
end else if t>mem[r+3].int then begin mem[r+5].hh.b0:=1;
if mem[r+6].int=0 then mem[r+6].gr:=0.0 else mem[r+6].gr:=(t-mem[r+3].
int)/mem[r+6].int;end else begin mem[r+5].hh.b1:=mem[r+5].hh.b0;
mem[r+5].hh.b0:=2;
if mem[r+4].int=0 then mem[r+6].gr:=0.0 else if(mem[r+5].hh.b1=0)and(mem
[r+3].int-t>mem[r+4].int)then mem[r+6].gr:=1.0 else mem[r+6].gr:=(mem[r
+3].int-t)/mem[r+4].int;end;mem[r+3].int:=w;mem[r].hh.b0:=1;end{:859};
mem[r+4].int:=0;if u<>memtop-4 then begin mem[u].hh.rh:=mem[r].hh.rh;
mem[r].hh.rh:=mem[memtop-4].hh.rh;r:=u;end{:856};
r:=mem[mem[r].hh.rh].hh.rh;s:=mem[mem[s].hh.rh].hh.rh;
until r=-268435455;end{:855}else if mem[q].hh.b0=2 then{854:}
begin if(mem[q+1].int=-1073741824)then mem[q+1].int:=mem[p+1].int;
if(mem[q+3].int=-1073741824)then mem[q+3].int:=mem[p+3].int;
if(mem[q+2].int=-1073741824)then mem[q+2].int:=mem[p+2].int;
if o<>0 then begin r:=mem[q].hh.rh;mem[q].hh.rh:=-268435455;
q:=hpack(q,0,1);mem[q+4].int:=o;mem[q].hh.rh:=r;mem[s].hh.rh:=q;end;
end{:854};s:=q;q:=mem[q].hh.rh;end{:853};flushnodelist(p);popalignment;
{860:}auxsave:=curlist.auxfield;p:=mem[curlist.headfield].hh.rh;
q:=curlist.tailfield;popnest;if curlist.modefield=209 then{1260:}
begin doassignments;if curcmd<>3 then{1261:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66608);end;begin helpptr:=2;helpline[1]:=66323;helpline[0]:=66324;
end;backerror;end{:1261}else{1251:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66604);end;begin helpptr:=2;helpline[1]:=66605;helpline[0]:=66606;
end;backerror;end;end{:1251};flushnodelist(curlist.eTeXauxfield);
popnest;
begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[7892275].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newparamglue(3);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.rh:=p;
if p<>-268435455 then curlist.tailfield:=q;
begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[7892276].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newparamglue(4);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.auxfield.int:=auxsave.int;resumeafterdisplay;end{:1260}
else begin curlist.auxfield:=auxsave;mem[curlist.tailfield].hh.rh:=p;
if p<>-268435455 then curlist.tailfield:=q;
if curlist.modefield=1 then buildpage;end{:860};end;{833:}
procedure alignpeek;label 20;begin 20:alignstate:=1000000;
repeat getxorprotected;until curcmd<>10;
if curcmd=34 then begin scanleftbrace;newsavelevel(7);
if curlist.modefield=-1 then normalparagraph;
end else if curcmd=2 then finalign else if(curcmd=5)and(curchr=1114115)
then goto 20 else begin initrow;initcol;end;end;{:833}{:848}{863:}{874:}
function finiteshrink(p:halfword):halfword;var q:halfword;
begin if noshrinkerroryet then begin noshrinkerroryet:=false;
ifdef('STAT')if eqtb[7892296].int>0 then enddiagnostic(true);
endif('STAT')begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66345);end;begin helpptr:=5;helpline[4]:=66346;helpline[3]:=66347;
helpline[2]:=66348;helpline[1]:=66349;helpline[0]:=66350;end;error;
ifdef('STAT')if eqtb[7892296].int>0 then begindiagnostic;
endif('STAT')end;q:=newspec(p);mem[q].hh.b1:=0;deleteglueref(p);
finiteshrink:=q;end;{:874}{877:}procedure pushnode(p:halfword);
begin if hliststacklevel>512 then pdferror(66351,66352);
hliststack[hliststacklevel]:=p;hliststacklevel:=hliststacklevel+1;end;
function popnode:halfword;begin hliststacklevel:=hliststacklevel-1;
if hliststacklevel<0 then pdferror(66353,66354);
popnode:=hliststack[hliststacklevel];end;
function findprotcharleft(l:halfword;d:boolean):halfword;var t:halfword;
run:boolean;
begin if(mem[l].hh.rh<>-268435455)and(mem[l].hh.b0=0)and(mem[l+1].int=0)
and(mem[l+3].int=0)and(mem[l+2].int=0)and(mem[l+5].hh.rh=-268435455)then
l:=mem[l].hh.rh else if d then while(mem[l].hh.rh<>-268435455)and(not((l
>=himemmin)or(mem[l].hh.b0<9)))do l:=mem[l].hh.rh;hliststacklevel:=0;
run:=true;repeat t:=l;
while run and(mem[l].hh.b0=0)and(mem[l+5].hh.rh<>-268435455)do begin
pushnode(l);l:=mem[l+5].hh.rh;end;
while run and(not(l>=himemmin)and((mem[l].hh.b0=3)or(mem[l].hh.b0=4)or(
mem[l].hh.b0=5)or(mem[l].hh.b0=12)or((mem[l].hh.b0=7)and(mem[l+1].hh.lh=
-268435455)and(mem[l+1].hh.rh=-268435455)and(mem[l].hh.b1=0))or((mem[l].
hh.b0=9)and(mem[l+1].int=0))or((mem[l].hh.b0=11)and((mem[l+1].int=0)or(
mem[l].hh.b1=0)))or((mem[l].hh.b0=10)and(mem[l+1].hh.lh=membot))or((mem[
l].hh.b0=0)and(mem[l+1].int=0)and(mem[l+3].int=0)and(mem[l+2].int=0)and(
mem[l+5].hh.rh=-268435455))))do begin while(mem[l].hh.rh=-268435455)and(
hliststacklevel>0)do begin l:=popnode;end;
if mem[l].hh.rh<>-268435455 then l:=mem[l].hh.rh else if hliststacklevel
=0 then run:=false end;until t=l;findprotcharleft:=l;end;
function findprotcharright(l,r:halfword):halfword;var t:halfword;
run:boolean;begin findprotcharright:=-268435455;
if r=-268435455 then goto 10;hliststacklevel:=0;run:=true;repeat t:=r;
while run and(mem[r].hh.b0=0)and(mem[r+5].hh.rh<>-268435455)do begin
pushnode(l);pushnode(r);l:=mem[r+5].hh.rh;r:=l;
while mem[r].hh.rh<>-268435455 do r:=mem[r].hh.rh;end;
while run and(not(r>=himemmin)and((mem[r].hh.b0=3)or(mem[r].hh.b0=4)or(
mem[r].hh.b0=5)or(mem[r].hh.b0=12)or((mem[r].hh.b0=7)and(mem[r+1].hh.lh=
-268435455)and(mem[r+1].hh.rh=-268435455)and(mem[r].hh.b1=0))or((mem[r].
hh.b0=9)and(mem[r+1].int=0))or((mem[r].hh.b0=11)and((mem[r+1].int=0)or(
mem[r].hh.b1=0)))or((mem[r].hh.b0=10)and(mem[r+1].hh.lh=membot))or((mem[
r].hh.b0=0)and(mem[r+1].int=0)and(mem[r+3].int=0)and(mem[r+2].int=0)and(
mem[r+5].hh.rh=-268435455))))do begin while(r=l)and(hliststacklevel>0)do
begin r:=popnode;l:=popnode;end;
if(r<>l)and(r<>-268435455)then r:=prevrightmost(l,r)else if(r=l)and(
hliststacklevel=0)then run:=false end;until t=r;findprotcharright:=r;
end;function totalpw(q,p:halfword):scaled;var l,r:halfword;n:integer;
begin if mem[q+1].hh.rh=-268435455 then l:=firstp else l:=mem[mem[q+1].
hh.rh+1].hh.rh;r:=prevrightmost(globalprevp,p);
if(p<>-268435455)and(mem[p].hh.b0=7)and(mem[p+1].hh.lh<>-268435455)then
begin r:=mem[p+1].hh.lh;
while mem[r].hh.rh<>-268435455 do r:=mem[r].hh.rh;
end else r:=findprotcharright(l,r);
if(l<>-268435455)and(mem[l].hh.b0=7)then begin if mem[l+1].hh.rh<>
-268435455 then begin l:=mem[l+1].hh.rh;goto 30;
end else begin n:=mem[l].hh.b1;l:=mem[l].hh.rh;
while n>0 do begin if mem[l].hh.rh<>-268435455 then l:=mem[l].hh.rh;
decr(n);end;end;end;l:=findprotcharleft(l,true);
30:totalpw:=charpw(l,0)+charpw(r,1);end;procedure trybreak(pi:integer;
breaktype:smallnumber);label 10,30,31,22,60,40,45;var r:halfword;
prevr:halfword;oldl:halfword;nobreakyet:boolean;{878:}
prevprevr:halfword;s:halfword;q:halfword;v:halfword;t:integer;
f:internalfontnumber;l:halfword;noderstaysactive:boolean;
linewidth:scaled;fitclass:0..3;b:halfword;d:integer;
artificialdemerits:boolean;savelink:halfword;shortfall:scaled;{:878}
{1655:}g:scaled;{:1655}begin{879:}
if abs(pi)>=10000 then if pi>0 then goto 10 else pi:=-10000{:879};
nobreakyet:=true;prevr:=memtop-7;oldl:=0;
curactivewidth[1]:=activewidth[1];curactivewidth[2]:=activewidth[2];
curactivewidth[3]:=activewidth[3];curactivewidth[4]:=activewidth[4];
curactivewidth[5]:=activewidth[5];curactivewidth[6]:=activewidth[6];
while true do begin 22:r:=mem[prevr].hh.rh;{880:}
if mem[r].hh.b0=2 then begin curactivewidth[1]:=curactivewidth[1]+mem[r
+1].int;curactivewidth[2]:=curactivewidth[2]+mem[r+2].int;
curactivewidth[3]:=curactivewidth[3]+mem[r+3].int;
curactivewidth[4]:=curactivewidth[4]+mem[r+4].int;
curactivewidth[5]:=curactivewidth[5]+mem[r+5].int;
curactivewidth[6]:=curactivewidth[6]+mem[r+6].int;prevprevr:=prevr;
prevr:=r;goto 22;end{:880};{883:}begin l:=mem[r+1].hh.lh;
if l>oldl then begin if(minimumdemerits<1073741823)and((oldl<>easyline)
or(r=memtop-7))then{884:}begin if nobreakyet then{885:}
begin nobreakyet:=false;breakwidth[1]:=background[1];
breakwidth[2]:=background[2];breakwidth[3]:=background[3];
breakwidth[4]:=background[4];breakwidth[5]:=background[5];
breakwidth[6]:=background[6];s:=curp;
if breaktype>0 then if curp<>-268435455 then{888:}
begin t:=mem[curp].hh.b1;v:=curp;s:=mem[curp+1].hh.rh;
while t>0 do begin decr(t);v:=mem[v].hh.rh;{889:}
if(v>=himemmin)then begin f:=mem[v].hh.b0;
breakwidth[1]:=breakwidth[1]-fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[v].hh.b1)].qqqq.b0].int;
end else case mem[v].hh.b0 of 6:begin f:=mem[v+1].hh.b0;
xtxligaturepresent:=true;
breakwidth[1]:=breakwidth[1]-fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[v+1].hh.b1)].qqqq.b0].int;end;
0,1,2,11:breakwidth[1]:=breakwidth[1]-mem[v+1].int;
8:if(((mem[v].hh.b1>=40)and(mem[v].hh.b1<=41)))or(mem[v].hh.b1=42)or(mem
[v].hh.b1=43)or(mem[v].hh.b1=44)then breakwidth[1]:=breakwidth[1]-mem[v
+1].int else confusion(66355);others:confusion(66356)end{:889};end;
while s<>-268435455 do begin{890:}
if(s>=himemmin)then begin f:=mem[s].hh.b0;
breakwidth[1]:=breakwidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[s].hh.b1)].qqqq.b0].int;
end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
xtxligaturepresent:=true;
breakwidth[1]:=breakwidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[s+1].hh.b1)].qqqq.b0].int;end;
0,1,2,11:breakwidth[1]:=breakwidth[1]+mem[s+1].int;
8:if(((mem[s].hh.b1>=40)and(mem[s].hh.b1<=41)))or(mem[s].hh.b1=42)or(mem
[s].hh.b1=43)or(mem[s].hh.b1=44)then breakwidth[1]:=breakwidth[1]+mem[s
+1].int else confusion(66357);others:confusion(66358)end{:890};
s:=mem[s].hh.rh;end;breakwidth[1]:=breakwidth[1]+discwidth;
if mem[curp+1].hh.rh=-268435455 then s:=mem[v].hh.rh;end{:888};
while s<>-268435455 do begin if(s>=himemmin)then goto 30;
case mem[s].hh.b0 of 10:{886:}begin v:=mem[s+1].hh.lh;
breakwidth[1]:=breakwidth[1]-mem[v+1].int;
breakwidth[2+mem[v].hh.b0]:=breakwidth[2+mem[v].hh.b0]-mem[v+2].int;
breakwidth[6]:=breakwidth[6]-mem[v+3].int;end{:886};12:;
9:breakwidth[1]:=breakwidth[1]-mem[s+1].int;
11:if mem[s].hh.b1<>1 then goto 30 else breakwidth[1]:=breakwidth[1]-mem
[s+1].int;others:goto 30 end;s:=mem[s].hh.rh;end;30:end{:885};{891:}
if mem[prevr].hh.b0=2 then begin mem[prevr+1].int:=mem[prevr+1].int-
curactivewidth[1]+breakwidth[1];
mem[prevr+2].int:=mem[prevr+2].int-curactivewidth[2]+breakwidth[2];
mem[prevr+3].int:=mem[prevr+3].int-curactivewidth[3]+breakwidth[3];
mem[prevr+4].int:=mem[prevr+4].int-curactivewidth[4]+breakwidth[4];
mem[prevr+5].int:=mem[prevr+5].int-curactivewidth[5]+breakwidth[5];
mem[prevr+6].int:=mem[prevr+6].int-curactivewidth[6]+breakwidth[6];
end else if prevr=memtop-7 then begin activewidth[1]:=breakwidth[1];
activewidth[2]:=breakwidth[2];activewidth[3]:=breakwidth[3];
activewidth[4]:=breakwidth[4];activewidth[5]:=breakwidth[5];
activewidth[6]:=breakwidth[6];end else begin q:=getnode(7);
mem[q].hh.rh:=r;mem[q].hh.b0:=2;mem[q].hh.b1:=0;
mem[q+1].int:=breakwidth[1]-curactivewidth[1];
mem[q+2].int:=breakwidth[2]-curactivewidth[2];
mem[q+3].int:=breakwidth[3]-curactivewidth[3];
mem[q+4].int:=breakwidth[4]-curactivewidth[4];
mem[q+5].int:=breakwidth[5]-curactivewidth[5];
mem[q+6].int:=breakwidth[6]-curactivewidth[6];mem[prevr].hh.rh:=q;
prevprevr:=prevr;prevr:=q;end{:891};
if abs(eqtb[7892280].int)>=1073741823-minimumdemerits then
minimumdemerits:=1073741822 else minimumdemerits:=minimumdemerits+abs(
eqtb[7892280].int);
for fitclass:=0 to 3 do begin if minimaldemerits[fitclass]<=
minimumdemerits then{893:}begin q:=getnode(2);mem[q].hh.rh:=passive;
passive:=q;mem[q+1].hh.rh:=curp;ifdef('STAT')incr(passnumber);
mem[q].hh.lh:=passnumber;
endif('STAT')mem[q+1].hh.lh:=bestplace[fitclass];
q:=getnode(activenodesize);mem[q+1].hh.rh:=passive;
mem[q+1].hh.lh:=bestplline[fitclass]+1;mem[q].hh.b1:=fitclass;
mem[q].hh.b0:=breaktype;mem[q+2].int:=minimaldemerits[fitclass];
if dolastlinefit then{1662:}begin mem[q+3].int:=bestplshort[fitclass];
mem[q+4].int:=bestplglue[fitclass];end{:1662};mem[q].hh.rh:=r;
mem[prevr].hh.rh:=q;prevr:=q;
ifdef('STAT')if eqtb[7892296].int>0 then{894:}begin printnl(66359);
printint(mem[passive].hh.lh);print(66360);printint(mem[q+1].hh.lh-1);
printchar(46);printint(fitclass);if breaktype=1 then printchar(45);
print(66361);printint(mem[q+2].int);if dolastlinefit then{1663:}
begin print(66966);printscaled(mem[q+3].int);
if curp=-268435455 then print(66967)else print(66432);
printscaled(mem[q+4].int);end{:1663};print(66362);
if mem[passive+1].hh.lh=-268435455 then printchar(48)else printint(mem[
mem[passive+1].hh.lh].hh.lh);end{:894};endif('STAT')end{:893};
minimaldemerits[fitclass]:=1073741823;end;minimumdemerits:=1073741823;
{892:}if r<>memtop-7 then begin q:=getnode(7);mem[q].hh.rh:=r;
mem[q].hh.b0:=2;mem[q].hh.b1:=0;
mem[q+1].int:=curactivewidth[1]-breakwidth[1];
mem[q+2].int:=curactivewidth[2]-breakwidth[2];
mem[q+3].int:=curactivewidth[3]-breakwidth[3];
mem[q+4].int:=curactivewidth[4]-breakwidth[4];
mem[q+5].int:=curactivewidth[5]-breakwidth[5];
mem[q+6].int:=curactivewidth[6]-breakwidth[6];mem[prevr].hh.rh:=q;
prevprevr:=prevr;prevr:=q;end{:892};end{:884};
if r=memtop-7 then goto 10;{898:}
if l>easyline then begin linewidth:=secondwidth;oldl:=1073741822;
end else begin oldl:=l;
if l>lastspecialline then linewidth:=secondwidth else if eqtb[1206295].
hh.rh=-268435455 then linewidth:=firstwidth else linewidth:=mem[eqtb[
1206295].hh.rh+2*l].int;end{:898};end;end{:883};{899:}
begin artificialdemerits:=false;shortfall:=linewidth-curactivewidth[1];
if eqtb[7892338].int>1 then shortfall:=shortfall+totalpw(r,curp);
if shortfall>0 then{900:}
if(curactivewidth[3]<>0)or(curactivewidth[4]<>0)or(curactivewidth[5]<>0)
then begin if dolastlinefit then begin if curp=-268435455 then{1657:}
begin if(mem[r+3].int=0)or(mem[r+4].int<=0)then goto 45;
if(curactivewidth[3]<>fillwidth[0])or(curactivewidth[4]<>fillwidth[1])or
(curactivewidth[5]<>fillwidth[2])then goto 45;
if mem[r+3].int>0 then g:=curactivewidth[2]else g:=curactivewidth[6];
if g<=0 then goto 45;aritherror:=false;
g:=fract(g,mem[r+3].int,mem[r+4].int,1073741823);
if eqtb[7892331].int<1000 then g:=fract(g,eqtb[7892331].int,1000,
1073741823);
if aritherror then if mem[r+3].int>0 then g:=1073741823 else g:=
-1073741823;if g>0 then{1658:}begin if g>shortfall then g:=shortfall;
if g>7230584 then if curactivewidth[2]<1663497 then begin b:=10000;
fitclass:=0;goto 40;end;b:=badness(g,curactivewidth[2]);
if b>12 then if b>99 then fitclass:=0 else fitclass:=1 else fitclass:=2;
goto 40;end{:1658}else if g<0 then{1659:}
begin if-g>curactivewidth[6]then g:=-curactivewidth[6];
b:=badness(-g,curactivewidth[6]);
if b>12 then fitclass:=3 else fitclass:=2;goto 40;end{:1659};
45:end{:1657};shortfall:=0;end;b:=0;fitclass:=2;
end else begin if shortfall>7230584 then if curactivewidth[2]<1663497
then begin b:=10000;fitclass:=0;goto 31;end;
b:=badness(shortfall,curactivewidth[2]);
if b>12 then if b>99 then fitclass:=0 else fitclass:=1 else fitclass:=2;
31:end{:900}else{901:}
begin if-shortfall>curactivewidth[6]then b:=10001 else b:=badness(-
shortfall,curactivewidth[6]);if b>12 then fitclass:=3 else fitclass:=2;
end{:901};if dolastlinefit then{1660:}
begin if curp=-268435455 then shortfall:=0;
if shortfall>0 then g:=curactivewidth[2]else if shortfall<0 then g:=
curactivewidth[6]else g:=0;end{:1660};
40:if(b>10000)or(pi=-10000)then{902:}
begin if finalpass and(minimumdemerits=1073741823)and(mem[r].hh.rh=
memtop-7)and(prevr=memtop-7)then artificialdemerits:=true else if b>
threshold then goto 60;noderstaysactive:=false;end{:902}
else begin prevr:=r;if b>threshold then goto 22;noderstaysactive:=true;
end;{903:}if artificialdemerits then d:=0 else{907:}
begin d:=eqtb[7892266].int+b;
if abs(d)>=10000 then d:=100000000 else d:=d*d;
if pi<>0 then if pi>0 then d:=d+pi*pi else if pi>-10000 then d:=d-pi*pi;
if(breaktype=1)and(mem[r].hh.b0=1)then if curp<>-268435455 then d:=d+
eqtb[7892278].int else d:=d+eqtb[7892279].int;
if abs(fitclass-mem[r].hh.b1)>1 then d:=d+eqtb[7892280].int;end{:907};
ifdef('STAT')if eqtb[7892296].int>0 then{904:}
begin if printednode<>curp then{905:}begin printnl(65626);
if curp=-268435455 then shortdisplay(mem[printednode].hh.rh)else begin
savelink:=mem[curp].hh.rh;mem[curp].hh.rh:=-268435455;printnl(65626);
shortdisplay(mem[printednode].hh.rh);mem[curp].hh.rh:=savelink;end;
printednode:=curp;end{:905};printnl(64);
if curp=-268435455 then printesc(65926)else if mem[curp].hh.b0<>10 then
begin if mem[curp].hh.b0=12 then printesc(65853)else if mem[curp].hh.b0=
7 then printesc(65639)else if mem[curp].hh.b0=11 then printesc(65603)
else printesc(65633);end;print(66363);
if mem[r+1].hh.rh=-268435455 then printchar(48)else printint(mem[mem[r+1
].hh.rh].hh.lh);print(66364);
if b>10000 then printchar(42)else printint(b);print(66365);printint(pi);
print(66366);if artificialdemerits then printchar(42)else printint(d);
end{:904};endif('STAT')d:=d+mem[r+2].int;
if d<=minimaldemerits[fitclass]then begin minimaldemerits[fitclass]:=d;
bestplace[fitclass]:=mem[r+1].hh.rh;bestplline[fitclass]:=l;
if dolastlinefit then{1661:}begin bestplshort[fitclass]:=shortfall;
bestplglue[fitclass]:=g;end{:1661};
if d<minimumdemerits then minimumdemerits:=d;end{:903};
if noderstaysactive then goto 22;60:{908:}
mem[prevr].hh.rh:=mem[r].hh.rh;freenode(r,activenodesize);
if prevr=memtop-7 then{909:}begin r:=mem[memtop-7].hh.rh;
if mem[r].hh.b0=2 then begin activewidth[1]:=activewidth[1]+mem[r+1].int
;activewidth[2]:=activewidth[2]+mem[r+2].int;
activewidth[3]:=activewidth[3]+mem[r+3].int;
activewidth[4]:=activewidth[4]+mem[r+4].int;
activewidth[5]:=activewidth[5]+mem[r+5].int;
activewidth[6]:=activewidth[6]+mem[r+6].int;
curactivewidth[1]:=activewidth[1];curactivewidth[2]:=activewidth[2];
curactivewidth[3]:=activewidth[3];curactivewidth[4]:=activewidth[4];
curactivewidth[5]:=activewidth[5];curactivewidth[6]:=activewidth[6];
mem[memtop-7].hh.rh:=mem[r].hh.rh;freenode(r,7);end;end{:909}
else if mem[prevr].hh.b0=2 then begin r:=mem[prevr].hh.rh;
if r=memtop-7 then begin curactivewidth[1]:=curactivewidth[1]-mem[prevr
+1].int;curactivewidth[2]:=curactivewidth[2]-mem[prevr+2].int;
curactivewidth[3]:=curactivewidth[3]-mem[prevr+3].int;
curactivewidth[4]:=curactivewidth[4]-mem[prevr+4].int;
curactivewidth[5]:=curactivewidth[5]-mem[prevr+5].int;
curactivewidth[6]:=curactivewidth[6]-mem[prevr+6].int;
mem[prevprevr].hh.rh:=memtop-7;freenode(prevr,7);prevr:=prevprevr;
end else if mem[r].hh.b0=2 then begin curactivewidth[1]:=curactivewidth[
1]+mem[r+1].int;curactivewidth[2]:=curactivewidth[2]+mem[r+2].int;
curactivewidth[3]:=curactivewidth[3]+mem[r+3].int;
curactivewidth[4]:=curactivewidth[4]+mem[r+4].int;
curactivewidth[5]:=curactivewidth[5]+mem[r+5].int;
curactivewidth[6]:=curactivewidth[6]+mem[r+6].int;
mem[prevr+1].int:=mem[prevr+1].int+mem[r+1].int;
mem[prevr+2].int:=mem[prevr+2].int+mem[r+2].int;
mem[prevr+3].int:=mem[prevr+3].int+mem[r+3].int;
mem[prevr+4].int:=mem[prevr+4].int+mem[r+4].int;
mem[prevr+5].int:=mem[prevr+5].int+mem[r+5].int;
mem[prevr+6].int:=mem[prevr+6].int+mem[r+6].int;
mem[prevr].hh.rh:=mem[r].hh.rh;freenode(r,7);end;end{:908};end{:899};
end;10:ifdef('STAT'){906:}
if curp=printednode then if curp<>-268435455 then if mem[curp].hh.b0=7
then begin t:=mem[curp].hh.b1;while t>0 do begin decr(t);
printednode:=mem[printednode].hh.rh;end;end{:906}endif('STAT')end;{:877}
{925:}procedure postlinebreak(d:boolean);label 30,31;var q,r,s:halfword;
p,k:halfword;w:scaled;gluebreak:boolean;ptmp:halfword;discbreak:boolean;
postdiscbreak:boolean;curwidth:scaled;curindent:scaled;t:quarterword;
pen:integer;curline:halfword;LRptr:halfword;
begin LRptr:=curlist.eTeXauxfield;{926:}q:=mem[bestbet+1].hh.rh;
curp:=-268435455;repeat r:=q;q:=mem[q+1].hh.lh;mem[r+1].hh.lh:=curp;
curp:=r;until q=-268435455{:926};curline:=curlist.pgfield+1;repeat{928:}
if(eqtb[7892339].int>0)then{1517:}begin q:=mem[memtop-3].hh.rh;
if LRptr<>-268435455 then begin tempptr:=LRptr;r:=q;
repeat s:=newmath(0,(mem[tempptr].hh.lh-1));mem[s].hh.rh:=r;r:=s;
tempptr:=mem[tempptr].hh.rh;until tempptr=-268435455;
mem[memtop-3].hh.rh:=r;end;
while q<>mem[curp+1].hh.rh do begin if not(q>=himemmin)then if mem[q].hh
.b0=9 then{1518:}
if odd(mem[q].hh.b1)then begin if LRptr<>-268435455 then if mem[LRptr].
hh.lh=(4*(mem[q].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1518};q:=mem[q].hh.rh;end;
end{:1517};{929:}q:=mem[curp+1].hh.rh;discbreak:=false;
postdiscbreak:=false;gluebreak:=false;
if q<>-268435455 then if mem[q].hh.b0=10 then begin deleteglueref(mem[q
+1].hh.lh);mem[q+1].hh.lh:=eqtb[1205772].hh.rh;mem[q].hh.b1:=9;
incr(mem[eqtb[1205772].hh.rh].hh.rh);gluebreak:=true;goto 30;
end else begin if mem[q].hh.b0=7 then{930:}begin t:=mem[q].hh.b1;{931:}
if t=0 then r:=mem[q].hh.rh else begin r:=q;
while t>1 do begin r:=mem[r].hh.rh;decr(t);end;s:=mem[r].hh.rh;
r:=mem[s].hh.rh;mem[s].hh.rh:=-268435455;flushnodelist(mem[q].hh.rh);
mem[q].hh.b1:=0;end{:931};if mem[q+1].hh.rh<>-268435455 then{932:}
begin s:=mem[q+1].hh.rh;
while mem[s].hh.rh<>-268435455 do s:=mem[s].hh.rh;mem[s].hh.rh:=r;
r:=mem[q+1].hh.rh;mem[q+1].hh.rh:=-268435455;postdiscbreak:=true;
end{:932};if mem[q+1].hh.lh<>-268435455 then{933:}
begin s:=mem[q+1].hh.lh;mem[q].hh.rh:=s;
while mem[s].hh.rh<>-268435455 do s:=mem[s].hh.rh;
mem[q+1].hh.lh:=-268435455;q:=s;end{:933};mem[q].hh.rh:=r;
discbreak:=true;end{:930}
else if mem[q].hh.b0=11 then mem[q+1].int:=0 else if mem[q].hh.b0=9 then
begin mem[q+1].int:=0;if(eqtb[7892339].int>0)then{1518:}
if odd(mem[q].hh.b1)then begin if LRptr<>-268435455 then if mem[LRptr].
hh.lh=(4*(mem[q].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1518};end;
end else begin q:=memtop-3;
while mem[q].hh.rh<>-268435455 do q:=mem[q].hh.rh;end;
30:if eqtb[7892338].int>0 then begin if discbreak and((q>=himemmin)or(
mem[q].hh.b0<>7))then begin p:=q;ptmp:=p;
end else begin p:=prevrightmost(mem[memtop-3].hh.rh,q);ptmp:=p;
p:=findprotcharright(mem[memtop-3].hh.rh,p);end;w:=charpw(p,1);
if w<>0 then begin k:=newmarginkern(-w,lastrightmostchar,1);
mem[k].hh.rh:=mem[ptmp].hh.rh;mem[ptmp].hh.rh:=k;
if(ptmp=q)then q:=mem[q].hh.rh;end;end;if not gluebreak then begin{934:}
r:=newparamglue(8);mem[r].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=r;q:=r{:934}
;end;{:929};if(eqtb[7892339].int>0)then{1519:}
if LRptr<>-268435455 then begin s:=memtop-3;r:=mem[s].hh.rh;
while r<>q do begin s:=r;r:=mem[s].hh.rh;end;r:=LRptr;
while r<>-268435455 do begin tempptr:=newmath(0,mem[r].hh.lh);
mem[s].hh.rh:=tempptr;s:=tempptr;r:=mem[r].hh.rh;end;mem[s].hh.rh:=q;
end{:1519};{935:}r:=mem[q].hh.rh;mem[q].hh.rh:=-268435455;
q:=mem[memtop-3].hh.rh;mem[memtop-3].hh.rh:=r;
if eqtb[7892338].int>0 then begin p:=q;p:=findprotcharleft(p,false);
w:=charpw(p,0);
if w<>0 then begin k:=newmarginkern(-w,lastleftmostchar,0);
mem[k].hh.rh:=q;q:=k;end;end;
if eqtb[1205771].hh.rh<>membot then begin r:=newparamglue(7);
mem[r].hh.rh:=q;q:=r;end{:935};{937:}
if curline>lastspecialline then begin curwidth:=secondwidth;
curindent:=secondindent;
end else if eqtb[1206295].hh.rh=-268435455 then begin curwidth:=
firstwidth;curindent:=firstindent;
end else begin curwidth:=mem[eqtb[1206295].hh.rh+2*curline].int;
curindent:=mem[eqtb[1206295].hh.rh+2*curline-1].int;end;
adjusttail:=memtop-5;preadjusttail:=memtop-14;
justbox:=hpack(q,curwidth,0);mem[justbox+4].int:=curindent{:937};{936:}
if memtop-14<>preadjusttail then begin mem[curlist.tailfield].hh.rh:=mem
[memtop-14].hh.rh;curlist.tailfield:=preadjusttail;end;
preadjusttail:=-268435455;appendtovlist(justbox);
if memtop-5<>adjusttail then begin mem[curlist.tailfield].hh.rh:=mem[
memtop-5].hh.rh;curlist.tailfield:=adjusttail;end;
adjusttail:=-268435455{:936};{938:}
if curline+1<>bestline then begin q:=eqtb[1206563].hh.rh;
if q<>-268435455 then begin r:=curline;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=mem[q+r+1].int;
end else pen:=eqtb[7892277].int;q:=eqtb[1206564].hh.rh;
if q<>-268435455 then begin r:=curline-curlist.pgfield;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=pen+mem[q+r+1].int;
end else if curline=curlist.pgfield+1 then pen:=pen+eqtb[7892269].int;
if d then q:=eqtb[1206566].hh.rh else q:=eqtb[1206565].hh.rh;
if q<>-268435455 then begin r:=bestline-curline-1;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=pen+mem[q+r+1].int;
end else if curline+2=bestline then if d then pen:=pen+eqtb[7892271].int
else pen:=pen+eqtb[7892270].int;
if discbreak then pen:=pen+eqtb[7892272].int;
if pen<>0 then begin r:=newpenalty(pen);mem[curlist.tailfield].hh.rh:=r;
curlist.tailfield:=r;end;end{:938}{:928};incr(curline);
curp:=mem[curp+1].hh.lh;
if curp<>-268435455 then if not postdiscbreak then{927:}
begin r:=memtop-3;while true do begin q:=mem[r].hh.rh;
if q=mem[curp+1].hh.rh then goto 31;if(q>=himemmin)then goto 31;
if(mem[q].hh.b0<9)then goto 31;
if mem[q].hh.b0=11 then if(mem[q].hh.b1<>1)and(mem[q].hh.b1<>3)then goto
31;r:=q;if mem[q].hh.b0=9 then if(eqtb[7892339].int>0)then{1518:}
if odd(mem[q].hh.b1)then begin if LRptr<>-268435455 then if mem[LRptr].
hh.lh=(4*(mem[q].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1518};end;
31:if r<>memtop-3 then begin mem[r].hh.rh:=-268435455;
flushnodelist(mem[memtop-3].hh.rh);mem[memtop-3].hh.rh:=q;end;end{:927};
until curp=-268435455;
if(curline<>bestline)or(mem[memtop-3].hh.rh<>-268435455)then confusion(
66375);curlist.pgfield:=bestline-1;curlist.eTeXauxfield:=LRptr;end;
{:925}{944:}{960:}function reconstitute(j,n:smallnumber;
bchar,hchar:halfword):smallnumber;label 22,30;var p:halfword;t:halfword;
q:fourquarters;currh:halfword;testchar:halfword;w:scaled;k:fontindex;
begin hyphenpassed:=0;t:=memtop-4;w:=0;mem[memtop-4].hh.rh:=-268435455;
{962:}curl:=hu[j];curq:=t;if j=0 then begin ligaturepresent:=initlig;
p:=initlist;if ligaturepresent then lfthit:=initlft;
while p>-268435455 do begin begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=mem[p].hh.b1;end;
p:=mem[p].hh.rh;end;
end else if curl<65536 then begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=curl;end;
ligstack:=-268435455;begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=65536;end{:962};22:{963:}
if curl=65536 then begin k:=bcharlabel[hf];
if k=0 then goto 30 else q:=fontinfo[k].qqqq;
end else begin q:=fontinfo[charbase[hf]+effectivechar(true,hf,curl)].
qqqq;if((q.b2)mod 4)<>1 then goto 30;k:=ligkernbase[hf]+q.b3;
q:=fontinfo[k].qqqq;
if q.b0>128 then begin k:=ligkernbase[hf]+256*q.b2+q.b3+32768-256*(128);
q:=fontinfo[k].qqqq;end;end;
if currh<65536 then testchar:=currh else testchar:=curr;
while true do begin if q.b1=testchar then if q.b0<=128 then if currh<
65536 then begin hyphenpassed:=j;hchar:=65536;currh:=65536;goto 22;
end else begin if hchar<65536 then if odd(hyf[j])then begin hyphenpassed
:=j;hchar:=65536;end;if q.b2<128 then{965:}
begin if curl=65536 then lfthit:=true;
if j=n then if ligstack=-268435455 then rthit:=true;
begin if interrupt<>0 then pauseforinstructions;end;
case q.b2 of 1,5:begin curl:=q.b3;ligaturepresent:=true;end;
2,6:begin curr:=q.b3;
if ligstack>-268435455 then mem[ligstack].hh.b1:=curr else begin
ligstack:=newligitem(curr);
if j=n then bchar:=65536 else begin p:=getavail;
mem[ligstack+1].hh.rh:=p;mem[p].hh.b1:=hu[j+1];mem[p].hh.b0:=hf;end;end;
end;3:begin curr:=q.b3;p:=ligstack;ligstack:=newligitem(curr);
mem[ligstack].hh.rh:=p;end;
7,11:begin if ligaturepresent then begin p:=newligature(hf,curl,mem[curq
].hh.rh);if lfthit then begin mem[p].hh.b1:=2;lfthit:=false;end;
if false then if ligstack=-268435455 then begin incr(mem[p].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=p;t:=p;ligaturepresent:=false;end;
curq:=t;curl:=q.b3;ligaturepresent:=true;end;others:begin curl:=q.b3;
ligaturepresent:=true;
if ligstack>-268435455 then begin if mem[ligstack+1].hh.rh>-268435455
then begin mem[t].hh.rh:=mem[ligstack+1].hh.rh;t:=mem[t].hh.rh;incr(j);
end;p:=ligstack;ligstack:=mem[p].hh.rh;freenode(p,2);
if ligstack=-268435455 then begin if j<n then curr:=hu[j+1]else curr:=
bchar;if odd(hyf[j])then currh:=hchar else currh:=65536;
end else curr:=mem[ligstack].hh.b1;
end else if j=n then goto 30 else begin begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=curr;end;incr(j);
begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=65536;end;end;end end;
if q.b2>4 then if q.b2<>7 then goto 30;goto 22;end{:965};
w:=fontinfo[kernbase[hf]+256*q.b2+q.b3].int;goto 30;end;
if q.b0>=128 then if currh=65536 then goto 30 else begin currh:=65536;
goto 22;end;k:=k+q.b0+1;q:=fontinfo[k].qqqq;end;30:{:963};{964:}
if ligaturepresent then begin p:=newligature(hf,curl,mem[curq].hh.rh);
if lfthit then begin mem[p].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-268435455 then begin incr(mem[p].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=p;t:=p;ligaturepresent:=false;end;
if w<>0 then begin mem[t].hh.rh:=newkern(w);t:=mem[t].hh.rh;w:=0;
mem[t+2].hh.lh:=0;end;if ligstack>-268435455 then begin curq:=t;
curl:=mem[ligstack].hh.b1;ligaturepresent:=true;
begin if mem[ligstack+1].hh.rh>-268435455 then begin mem[t].hh.rh:=mem[
ligstack+1].hh.rh;t:=mem[t].hh.rh;incr(j);end;p:=ligstack;
ligstack:=mem[p].hh.rh;freenode(p,2);
if ligstack=-268435455 then begin if j<n then curr:=hu[j+1]else curr:=
bchar;if odd(hyf[j])then currh:=hchar else currh:=65536;
end else curr:=mem[ligstack].hh.b1;end;goto 22;end{:964};
reconstitute:=j;end;{:960}procedure hyphenate;
label 50,30,40,41,42,45,10;var{954:}i,j,l:0..4097;q,r,s:halfword;
bchar:halfword;{:954}{966:}majortail,minortail:halfword;c:UnicodeScalar;
cloc:0..4095;rcount:integer;hyfnode:halfword;{:966}{976:}z:triepointer;
v:integer;{:976}{983:}h:hyphpointer;k:strnumber;u:poolpointer;{:983}
begin{977:}for j:=0 to hn do hyf[j]:=0;{984:}h:=hc[1];incr(hn);
hc[hn]:=curlang;for j:=2 to hn do h:=(h+h+hc[j])mod 607;
while true do begin{985:}k:=hyphword[h];if k=0 then goto 45;
if length(k)=hn then begin j:=1;u:=strstart[(k)-65536];
repeat if strpool[u]<>hc[j]then goto 30;incr(j);incr(u);until j>hn;
{986:}s:=hyphlist[h];while s<>-268435455 do begin hyf[mem[s].hh.lh]:=1;
s:=mem[s].hh.rh;end{:986};decr(hn);goto 40;end;30:{:985};h:=hyphlink[h];
if h=0 then goto 45;decr(h);end;45:decr(hn){:984};
if trietrc[curlang+1]<>curlang then goto 10;hc[0]:=0;hc[hn+1]:=0;
hc[hn+2]:=maxhyphchar;
for j:=0 to hn-rhyf+1 do begin z:=trietrl[curlang+1]+hc[j];l:=j;
while hc[l]=trietrc[z]do begin if trietro[z]<>mintrieop then{978:}
begin v:=trietro[z];repeat v:=v+opstart[curlang];i:=l-hyfdistance[v];
if hyfnum[v]>hyf[i]then hyf[i]:=hyfnum[v];v:=hyfnext[v];
until v=mintrieop;end{:978};incr(l);z:=trietrl[z]+hc[l];end;end;
40:for j:=0 to lhyf-1 do hyf[j]:=0;
for j:=0 to rhyf-1 do hyf[hn-j]:=0{:977};{955:}
for j:=lhyf to hn-rhyf do if odd(hyf[j])then goto 41;goto 10;41:{:955};
{956:}
if(((ha)<>-268435455)and(not(ha>=himemmin))and(mem[ha].hh.b0=8)and(((mem
[ha].hh.b1>=40)and(mem[ha].hh.b1<=41))))then begin{957:}s:=curp;
while mem[s].hh.rh<>ha do s:=mem[s].hh.rh;hyphenpassed:=0;
for j:=lhyf to hn-rhyf do begin if odd(hyf[j])then begin q:=
newnativewordnode(hf,j-hyphenpassed);mem[q].hh.b1:=mem[ha].hh.b1;
for i:=0 to j-hyphenpassed-1 do setnativechar(q,i,getnativechar(ha,i+
hyphenpassed));setnativemetrics(q,(eqtb[7892342].int>0));
mem[s].hh.rh:=q;s:=q;q:=newdisc;
mem[q+1].hh.lh:=newnativecharacter(hf,hyfchar);mem[s].hh.rh:=q;s:=q;
hyphenpassed:=j;end end;hn:=mem[ha+4].qqqq.b2;
q:=newnativewordnode(hf,hn-hyphenpassed);mem[q].hh.b1:=mem[ha].hh.b1;
for i:=0 to hn-hyphenpassed-1 do setnativechar(q,i,getnativechar(ha,i+
hyphenpassed));setnativemetrics(q,(eqtb[7892342].int>0));
mem[s].hh.rh:=q;s:=q;q:=mem[ha].hh.rh;mem[s].hh.rh:=q;
mem[ha].hh.rh:=-268435455;flushnodelist(ha);{:957};
end else begin q:=mem[hb].hh.rh;mem[hb].hh.rh:=-268435455;
r:=mem[ha].hh.rh;mem[ha].hh.rh:=-268435455;bchar:=hyfbchar;
if(ha>=himemmin)then if mem[ha].hh.b0<>hf then goto 42 else begin
initlist:=ha;initlig:=false;hu[0]:=mem[ha].hh.b1;
end else if mem[ha].hh.b0=6 then if mem[ha+1].hh.b0<>hf then goto 42
else begin initlist:=mem[ha+1].hh.rh;initlig:=true;
initlft:=(mem[ha].hh.b1>1);hu[0]:=mem[ha+1].hh.b1;
if initlist=-268435455 then if initlft then begin hu[0]:=maxhyphchar;
initlig:=false;end;freenode(ha,2);
end else begin if not(r>=himemmin)then if mem[r].hh.b0=6 then if mem[r].
hh.b1>1 then goto 42;j:=1;s:=ha;initlist:=-268435455;goto 50;end;
s:=curp;while mem[s].hh.rh<>ha do s:=mem[s].hh.rh;j:=0;goto 50;42:s:=ha;
j:=0;hu[0]:=maxhyphchar;initlig:=false;initlist:=-268435455;
50:flushnodelist(r);{967:}repeat l:=j;
j:=reconstitute(j,hn,bchar,hyfchar)+1;
if hyphenpassed=0 then begin mem[s].hh.rh:=mem[memtop-4].hh.rh;
while mem[s].hh.rh>-268435455 do s:=mem[s].hh.rh;
if odd(hyf[j-1])then begin l:=j;hyphenpassed:=j-1;
mem[memtop-4].hh.rh:=-268435455;end;end;if hyphenpassed>0 then{968:}
repeat r:=getnode(2);mem[r].hh.rh:=mem[memtop-4].hh.rh;mem[r].hh.b0:=7;
majortail:=r;rcount:=0;
while mem[majortail].hh.rh>-268435455 do begin majortail:=mem[majortail]
.hh.rh;incr(rcount);end;i:=hyphenpassed;hyf[i]:=0;{969:}
minortail:=-268435455;mem[r+1].hh.lh:=-268435455;
hyfnode:=newcharacter(hf,hyfchar);
if hyfnode<>-268435455 then begin incr(i);c:=hu[i];hu[i]:=hyfchar;
begin mem[hyfnode].hh.rh:=avail;avail:=hyfnode;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
while l<=i do begin l:=reconstitute(l,i,fontbchar[hf],65536)+1;
if mem[memtop-4].hh.rh>-268435455 then begin if minortail=-268435455
then mem[r+1].hh.lh:=mem[memtop-4].hh.rh else mem[minortail].hh.rh:=mem[
memtop-4].hh.rh;minortail:=mem[memtop-4].hh.rh;
while mem[minortail].hh.rh>-268435455 do minortail:=mem[minortail].hh.rh
;end;end;if hyfnode<>-268435455 then begin hu[i]:=c;l:=i;decr(i);
end{:969};{970:}minortail:=-268435455;mem[r+1].hh.rh:=-268435455;
cloc:=0;if bcharlabel[hf]<>0 then begin decr(l);c:=hu[l];cloc:=l;
hu[l]:=maxhyphchar;end;
while l<j do begin repeat l:=reconstitute(l,hn,bchar,65536)+1;
if cloc>0 then begin hu[cloc]:=c;cloc:=0;end;
if mem[memtop-4].hh.rh>-268435455 then begin if minortail=-268435455
then mem[r+1].hh.rh:=mem[memtop-4].hh.rh else mem[minortail].hh.rh:=mem[
memtop-4].hh.rh;minortail:=mem[memtop-4].hh.rh;
while mem[minortail].hh.rh>-268435455 do minortail:=mem[minortail].hh.rh
;end;until l>=j;while l>j do{971:}
begin j:=reconstitute(j,hn,bchar,65536)+1;
mem[majortail].hh.rh:=mem[memtop-4].hh.rh;
while mem[majortail].hh.rh>-268435455 do begin majortail:=mem[majortail]
.hh.rh;incr(rcount);end;end{:971};end{:970};{972:}
if rcount>127 then begin mem[s].hh.rh:=mem[r].hh.rh;
mem[r].hh.rh:=-268435455;flushnodelist(r);
end else begin mem[s].hh.rh:=r;mem[r].hh.b1:=rcount;end;
s:=majortail{:972};hyphenpassed:=j-1;mem[memtop-4].hh.rh:=-268435455;
until not odd(hyf[j-1]){:968};until j>hn;mem[s].hh.rh:=q{:967};
flushlist(initlist);end{:956};10:end;
function maxhyphenatablelength:integer;
begin if eqtb[7892350].int>4095 then maxhyphenatablelength:=4095 else
maxhyphenatablelength:=eqtb[7892350].int;end;{:944}{996:}
ifdef('INITEX'){998:}function newtrieop(d,n:smallnumber;
v:trieopcode):trieopcode;label 10;var h:negtrieopsize..trieopsize;
u:trieopcode;l:0..trieopsize;
begin h:=abs(n+313*d+361*v+1009*curlang)mod(trieopsize-negtrieopsize)+
negtrieopsize;while true do begin l:=trieophash[h];
if l=0 then begin if trieopptr=trieopsize then overflow(66385,trieopsize
);u:=trieused[curlang];
if u=maxtrieop then overflow(66386,maxtrieop-mintrieop);incr(trieopptr);
incr(u);trieused[curlang]:=u;if u>maxopused then maxopused:=u;
hyfdistance[trieopptr]:=d;hyfnum[trieopptr]:=n;hyfnext[trieopptr]:=v;
trieoplang[trieopptr]:=curlang;trieophash[h]:=trieopptr;
trieopval[trieopptr]:=u;newtrieop:=u;goto 10;end;
if(hyfdistance[l]=d)and(hyfnum[l]=n)and(hyfnext[l]=v)and(trieoplang[l]=
curlang)then begin newtrieop:=trieopval[l];goto 10;end;
if h>-trieopsize then decr(h)else h:=trieopsize;end;10:end;{:998}{1002:}
function trienode(p:triepointer):triepointer;label 10;var h:triepointer;
q:triepointer;
begin h:=abs(triec[p]+1009*trieo[p]+2718*triel[p]+3142*trier[p])mod
triesize;while true do begin q:=triehash[h];
if q=0 then begin triehash[h]:=p;trienode:=p;goto 10;end;
if(triec[q]=triec[p])and(trieo[q]=trieo[p])and(triel[q]=triel[p])and(
trier[q]=trier[p])then begin trienode:=q;goto 10;end;
if h>0 then decr(h)else h:=triesize;end;10:end;{:1002}{1003:}
function compresstrie(p:triepointer):triepointer;
begin if p=0 then compresstrie:=0 else begin triel[p]:=compresstrie(
triel[p]);trier[p]:=compresstrie(trier[p]);compresstrie:=trienode(p);
end;end;{:1003}{1007:}procedure firstfit(p:triepointer);label 45,40;
var h:triepointer;z:triepointer;q:triepointer;c:UTF16code;
l,r:triepointer;ll:1..65536;begin c:=triec[p];z:=triemin[c];
while true do begin h:=z-c;{1008:}
if triemax<h+maxhyphchar then begin if triesize<=h+maxhyphchar then
overflow(66387,triesize);repeat incr(triemax);trietaken[triemax]:=false;
trietrl[triemax]:=triemax+1;trietro[triemax]:=triemax-1;
until triemax=h+maxhyphchar;end{:1008};if trietaken[h]then goto 45;
{1009:}q:=trier[p];
while q>0 do begin if trietrl[h+triec[q]]=0 then goto 45;q:=trier[q];
end;goto 40{:1009};45:z:=trietrl[z];end;40:{1010:}trietaken[h]:=true;
triehash[p]:=h;q:=p;repeat z:=h+triec[q];l:=trietro[z];r:=trietrl[z];
trietro[r]:=l;trietrl[l]:=r;trietrl[z]:=0;
if l<maxhyphchar then begin if z<maxhyphchar then ll:=z else ll:=
maxhyphchar;repeat triemin[l]:=r;incr(l);until l=ll;end;q:=trier[q];
until q=0{:1010};end;{:1007}{1011:}procedure triepack(p:triepointer);
var q:triepointer;begin repeat q:=triel[p];
if(q>0)and(triehash[q]=0)then begin firstfit(q);triepack(q);end;
p:=trier[p];until p=0;end;{:1011}{1013:}
procedure triefix(p:triepointer);var q:triepointer;c:UTF16code;
z:triepointer;begin z:=triehash[p];repeat q:=triel[p];c:=triec[p];
trietrl[z+c]:=triehash[q];trietrc[z+c]:=c;trietro[z+c]:=trieo[p];
if q>0 then triefix(q);p:=trier[p];until p=0;end;{:1013}{1014:}
procedure newpatterns;label 30,31;var k,l:0..4096;digitsensed:boolean;
v:trieopcode;p,q:triepointer;firstchild:boolean;c:UTF16code;
begin if trienotready then begin if eqtb[7892314].int<=0 then curlang:=0
else if eqtb[7892314].int>255 then curlang:=0 else curlang:=eqtb[7892314
].int;scanleftbrace;{1015:}k:=0;hyf[0]:=0;digitsensed:=false;
while true do begin getxtoken;case curcmd of 11,12:{1016:}
if digitsensed or(curchr<48)or(curchr>57)then begin if curchr=46 then
curchr:=0 else begin curchr:=eqtb[2321704+curchr].hh.rh;
if curchr=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66393);end;begin helpptr:=1;helpline[0]:=66392;end;error;end;end;
if curchr>maxhyphchar then maxhyphchar:=curchr;
if k<maxhyphenatablelength then begin incr(k);hc[k]:=curchr;hyf[k]:=0;
digitsensed:=false;end;
end else if k<maxhyphenatablelength then begin hyf[k]:=curchr-48;
digitsensed:=true;end{:1016};10,2:begin if k>0 then{1017:}begin{1019:}
if hc[1]=0 then hyf[0]:=0;if hc[k]=0 then hyf[k]:=0;l:=k;v:=mintrieop;
while true do begin if hyf[l]<>0 then v:=newtrieop(k-l,hyf[l],v);
if l>0 then decr(l)else goto 31;end;31:{:1019};q:=0;hc[0]:=curlang;
while l<=k do begin c:=hc[l];incr(l);p:=triel[q];firstchild:=true;
while(p>0)and(c>triec[p])do begin q:=p;p:=trier[q];firstchild:=false;
end;if(p=0)or(c<triec[p])then{1018:}
begin if trieptr=triesize then overflow(66387,triesize);incr(trieptr);
trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1018};q:=p;end;
if trieo[q]<>mintrieop then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66394);end;begin helpptr:=1;helpline[0]:=66392;end;error;end;
trieo[q]:=v;end{:1017};if curcmd=2 then goto 30;k:=0;hyf[0]:=0;
digitsensed:=false;end;others:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66391);end;printesc(66389);begin helpptr:=1;helpline[0]:=66392;
end;error;end end;end;30:{:1015};if eqtb[7892333].int>0 then{1666:}
begin c:=curlang;firstchild:=false;p:=0;repeat q:=p;p:=trier[q];
until(p=0)or(c<=triec[p]);if(p=0)or(c<triec[p])then{1018:}
begin if trieptr=triesize then overflow(66387,triesize);incr(trieptr);
trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1018};q:=p;{1667:}p:=triel[q];firstchild:=true;
for c:=0 to 255 do if(eqtb[2321704+c].hh.rh>0)or((c=255)and firstchild)
then begin if p=0 then{1018:}
begin if trieptr=triesize then overflow(66387,triesize);incr(trieptr);
trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1018}else triec[p]:=c;
trieo[p]:=eqtb[2321704+c].hh.rh;q:=p;p:=trier[q];firstchild:=false;end;
if firstchild then triel[q]:=0 else trier[q]:=0{:1667};end{:1666};
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66388);end;printesc(66389);begin helpptr:=1;helpline[0]:=66390;
end;error;mem[memtop-12].hh.rh:=scantoks(false,false);flushlist(defref);
end;end;{:1014}{1020:}procedure inittrie;var p:triepointer;
j,k,t:integer;r,s:triepointer;begin incr(maxhyphchar);{1006:}{999:}
opstart[0]:=-mintrieop;
for j:=1 to 255 do opstart[j]:=opstart[j-1]+trieused[j-1];
for j:=1 to trieopptr do trieophash[j]:=opstart[trieoplang[j]]+trieopval
[j];
for j:=1 to trieopptr do while trieophash[j]>j do begin k:=trieophash[j]
;t:=hyfdistance[k];hyfdistance[k]:=hyfdistance[j];hyfdistance[j]:=t;
t:=hyfnum[k];hyfnum[k]:=hyfnum[j];hyfnum[j]:=t;t:=hyfnext[k];
hyfnext[k]:=hyfnext[j];hyfnext[j]:=t;trieophash[j]:=trieophash[k];
trieophash[k]:=k;end{:999};for p:=0 to triesize do triehash[p]:=0;
trier[0]:=compresstrie(trier[0]);triel[0]:=compresstrie(triel[0]);
for p:=0 to trieptr do triehash[p]:=0;
for p:=0 to 65535 do triemin[p]:=p+1;trietrl[0]:=1;triemax:=0{:1006};
if triel[0]<>0 then begin firstfit(triel[0]);triepack(triel[0]);end;
if trier[0]<>0 then{1668:}
begin if triel[0]=0 then for p:=0 to 255 do triemin[p]:=p+2;
firstfit(trier[0]);triepack(trier[0]);hyphstart:=triehash[trier[0]];
end{:1668};{1012:}
if triemax=0 then begin for r:=0 to maxhyphchar do begin trietrl[r]:=0;
trietro[r]:=mintrieop;trietrc[r]:=0;end;triemax:=maxhyphchar;
end else begin if trier[0]>0 then triefix(trier[0]);
if triel[0]>0 then triefix(triel[0]);r:=0;repeat s:=trietrl[r];
begin trietrl[r]:=0;trietro[r]:=mintrieop;trietrc[r]:=0;end;r:=s;
until r>triemax;end;trietrc[0]:=63;{:1012};trienotready:=false;end;
{:1020}endif('INITEX'){:996}procedure linebreak(d:boolean);
label 30,31,32,33,34,35,36,22,20;var{910:}autobreaking:boolean;
prevp:halfword;q,r,s,prevs:halfword;f:internalfontnumber;{:910}{942:}
j:smallnumber;c:UnicodeScalar;{:942}{948:}l:integer;i:integer;{:948}
begin packbeginline:=curlist.mlfield;{864:}
mem[memtop-3].hh.rh:=mem[curlist.headfield].hh.rh;
if(curlist.tailfield>=himemmin)then begin mem[curlist.tailfield].hh.rh:=
newpenalty(10000);curlist.tailfield:=mem[curlist.tailfield].hh.rh;
end else if mem[curlist.tailfield].hh.b0<>10 then begin mem[curlist.
tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;
end else begin mem[curlist.tailfield].hh.b0:=12;
deleteglueref(mem[curlist.tailfield+1].hh.lh);
flushnodelist(mem[curlist.tailfield+1].hh.rh);
mem[curlist.tailfield+1].int:=10000;end;
mem[curlist.tailfield].hh.rh:=newparamglue(14);
lastlinefill:=mem[curlist.tailfield].hh.rh;
initcurlang:=curlist.pgfield mod 65536;
initlhyf:=curlist.pgfield div 4194304;
initrhyf:=(curlist.pgfield div 65536)mod 64;popnest;{:864}{875:}
noshrinkerroryet:=true;
if(mem[eqtb[1205771].hh.rh].hh.b1<>0)and(mem[eqtb[1205771].hh.rh+3].int
<>0)then begin eqtb[1205771].hh.rh:=finiteshrink(eqtb[1205771].hh.rh);
end;
if(mem[eqtb[1205772].hh.rh].hh.b1<>0)and(mem[eqtb[1205772].hh.rh+3].int
<>0)then begin eqtb[1205772].hh.rh:=finiteshrink(eqtb[1205772].hh.rh);
end;q:=eqtb[1205771].hh.rh;r:=eqtb[1205772].hh.rh;
background[1]:=mem[q+1].int+mem[r+1].int;background[2]:=0;
background[3]:=0;background[4]:=0;background[5]:=0;
background[2+mem[q].hh.b0]:=mem[q+2].int;
background[2+mem[r].hh.b0]:=background[2+mem[r].hh.b0]+mem[r+2].int;
background[6]:=mem[q+3].int+mem[r+3].int;{1654:}dolastlinefit:=false;
activenodesize:=3;
if eqtb[7892331].int>0 then begin q:=mem[lastlinefill+1].hh.lh;
if(mem[q+2].int>0)and(mem[q].hh.b0>0)then if(background[3]=0)and(
background[4]=0)and(background[5]=0)then begin dolastlinefit:=true;
activenodesize:=5;fillwidth[0]:=0;fillwidth[1]:=0;fillwidth[2]:=0;
fillwidth[mem[q].hh.b0-1]:=mem[q+2].int;end;end{:1654};{:875}{882:}
minimumdemerits:=1073741823;minimaldemerits[3]:=1073741823;
minimaldemerits[2]:=1073741823;minimaldemerits[1]:=1073741823;
minimaldemerits[0]:=1073741823;{:882}{896:}
if eqtb[1206295].hh.rh=-268435455 then if eqtb[9006737].int=0 then begin
lastspecialline:=0;secondwidth:=eqtb[9006723].int;secondindent:=0;
end else{897:}begin lastspecialline:=abs(eqtb[7892305].int);
if eqtb[7892305].int<0 then begin firstwidth:=eqtb[9006723].int-abs(eqtb
[9006737].int);
if eqtb[9006737].int>=0 then firstindent:=eqtb[9006737].int else
firstindent:=0;secondwidth:=eqtb[9006723].int;secondindent:=0;
end else begin firstwidth:=eqtb[9006723].int;firstindent:=0;
secondwidth:=eqtb[9006723].int-abs(eqtb[9006737].int);
if eqtb[9006737].int>=0 then secondindent:=eqtb[9006737].int else
secondindent:=0;end;end{:897}
else begin lastspecialline:=mem[eqtb[1206295].hh.rh].hh.lh-1;
secondwidth:=mem[eqtb[1206295].hh.rh+2*(lastspecialline+1)].int;
secondindent:=mem[eqtb[1206295].hh.rh+2*lastspecialline+1].int;end;
if eqtb[7892283].int=0 then easyline:=lastspecialline else easyline:=
1073741823{:896};{911:}threshold:=eqtb[7892264].int;
if threshold>=0 then begin ifdef('STAT')if eqtb[7892296].int>0 then
begin begindiagnostic;printnl(66367);end;endif('STAT')secondpass:=false;
finalpass:=false;end else begin threshold:=eqtb[7892265].int;
secondpass:=true;finalpass:=(eqtb[9006740].int<=0);
ifdef('STAT')if eqtb[7892296].int>0 then begindiagnostic;
endif('STAT')end;
while true do begin if threshold>10000 then threshold:=10000;
if secondpass then{939:}
begin ifdef('INITEX')if trienotready then inittrie;
endif('INITEX')curlang:=initcurlang;lhyf:=initlhyf;rhyf:=initrhyf;
if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0 else hyphindex
:=trietrl[hyphstart+curlang];end{:939};{912:}q:=getnode(activenodesize);
mem[q].hh.b0:=0;mem[q].hh.b1:=2;mem[q].hh.rh:=memtop-7;
mem[q+1].hh.rh:=-268435455;mem[q+1].hh.lh:=curlist.pgfield+1;
mem[q+2].int:=0;mem[memtop-7].hh.rh:=q;if dolastlinefit then{1656:}
begin mem[q+3].int:=0;mem[q+4].int:=0;end{:1656};
activewidth[1]:=background[1];activewidth[2]:=background[2];
activewidth[3]:=background[3];activewidth[4]:=background[4];
activewidth[5]:=background[5];activewidth[6]:=background[6];
passive:=-268435455;printednode:=memtop-3;passnumber:=0;
fontinshortdisplay:=0{:912};curp:=mem[memtop-3].hh.rh;
autobreaking:=true;begin prevp:=curp;globalprevp:=curp;end;firstp:=curp;
while(curp<>-268435455)and(mem[memtop-7].hh.rh<>memtop-7)do{914:}
begin if(curp>=himemmin)then{915:}begin begin prevp:=curp;
globalprevp:=curp;end;repeat f:=mem[curp].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,mem[curp].hh.b1)].qqqq.b0].int;
curp:=mem[curp].hh.rh;until not(curp>=himemmin);end{:915};
case mem[curp].hh.b0 of 0,1,2:activewidth[1]:=activewidth[1]+mem[curp+1]
.int;8:{1422:}
if mem[curp].hh.b1=5 then begin curlang:=mem[curp+1].hh.rh;
lhyf:=mem[curp+1].hh.b0;rhyf:=mem[curp+1].hh.b1;
if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0 else hyphindex
:=trietrl[hyphstart+curlang];
end else if(((mem[curp].hh.b1>=40)and(mem[curp].hh.b1<=41)))or(mem[curp]
.hh.b1=42)or(mem[curp].hh.b1=43)or(mem[curp].hh.b1=44)then begin
activewidth[1]:=activewidth[1]+mem[curp+1].int;end{:1422};10:begin{916:}
if autobreaking then begin if(prevp>=himemmin)then trybreak(0,0)else if(
mem[prevp].hh.b0<9)then trybreak(0,0)else if(mem[prevp].hh.b0=11)and(mem
[prevp].hh.b1<>1)then trybreak(0,0);end;
if(mem[mem[curp+1].hh.lh].hh.b1<>0)and(mem[mem[curp+1].hh.lh+3].int<>0)
then begin mem[curp+1].hh.lh:=finiteshrink(mem[curp+1].hh.lh);end;
q:=mem[curp+1].hh.lh;activewidth[1]:=activewidth[1]+mem[q+1].int;
activewidth[2+mem[q].hh.b0]:=activewidth[2+mem[q].hh.b0]+mem[q+2].int;
activewidth[6]:=activewidth[6]+mem[q+3].int{:916};
if secondpass and autobreaking then{943:}begin prevs:=curp;
s:=mem[prevs].hh.rh;if s<>-268435455 then begin{949:}
while true do begin if(s>=himemmin)then begin c:=mem[s].hh.b1;
hf:=mem[s].hh.b0;
end else if mem[s].hh.b0=6 then if mem[s+1].hh.rh=-268435455 then goto
22 else begin q:=mem[s+1].hh.rh;c:=mem[q].hh.b1;hf:=mem[q].hh.b0;
end else if(mem[s].hh.b0=11)and(mem[s].hh.b1=0)then goto 22 else if(mem[
s].hh.b0=9)and(mem[s].hh.b1>=4)then goto 22 else if mem[s].hh.b0=8 then
begin if(((mem[s].hh.b1>=40)and(mem[s].hh.b1<=41)))then begin for l:=0
to mem[s+4].qqqq.b2-1 do begin c:=getnativeusv(s,l);
if eqtb[2321704+c].hh.rh<>0 then begin hf:=mem[s+4].qqqq.b1;prevs:=s;
if(eqtb[2321704+c].hh.rh=c)or(eqtb[7892302].int>0)then goto 32 else goto
31;end;if c>=65536 then incr(l);end end;{1423:}
if mem[s].hh.b1=5 then begin curlang:=mem[s+1].hh.rh;
lhyf:=mem[s+1].hh.b0;rhyf:=mem[s+1].hh.b1;
if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0 else hyphindex
:=trietrl[hyphstart+curlang];end{:1423};goto 22 end else goto 31;
if(hyphindex=0)or((c)>255)then hc[0]:=eqtb[2321704+c].hh.rh else if
trietrc[hyphindex+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]<>0 then if(hc[0]=c)or(eqtb[7892302].int>0)then goto 32 else
goto 31;22:prevs:=s;s:=mem[prevs].hh.rh;end;32:hyfchar:=hyphenchar[hf];
if hyfchar<0 then goto 31;if hyfchar>65535 then goto 31;ha:=prevs{:949};
if lhyf+rhyf>maxhyphenatablelength then goto 31;
if(((ha)<>-268435455)and(not(ha>=himemmin))and(mem[ha].hh.b0=8)and(((mem
[ha].hh.b1>=40)and(mem[ha].hh.b1<=41))))then begin{945:}
s:=mem[ha].hh.rh;
while true do begin if not((s>=himemmin))then case mem[s].hh.b0 of 6:;
11:if mem[s].hh.b1<>0 then goto 36;8,10,12,3,5,4:goto 36;
others:goto 31 end;s:=mem[s].hh.rh;end;36:{:945};{946:}hn:=0;
20:for l:=0 to mem[ha+4].qqqq.b2-1 do begin c:=getnativeusv(ha,l);
if(hyphindex=0)or((c)>255)then hc[0]:=eqtb[2321704+c].hh.rh else if
trietrc[hyphindex+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if(hc[0]=0)then begin if(hn>0)then begin{947:}
q:=newnativewordnode(hf,mem[ha+4].qqqq.b2-l);
mem[q].hh.b1:=mem[ha].hh.b1;
for i:=l to mem[ha+4].qqqq.b2-1 do setnativechar(q,i-l,getnativechar(ha,
i));setnativemetrics(q,(eqtb[7892342].int>0));
mem[q].hh.rh:=mem[ha].hh.rh;mem[ha].hh.rh:=q;mem[ha+4].qqqq.b2:=l;
setnativemetrics(ha,(eqtb[7892342].int>0));{:947};goto 33;
end end else if(hn=0)and(l>0)then begin{947:}
q:=newnativewordnode(hf,mem[ha+4].qqqq.b2-l);
mem[q].hh.b1:=mem[ha].hh.b1;
for i:=l to mem[ha+4].qqqq.b2-1 do setnativechar(q,i-l,getnativechar(ha,
i));setnativemetrics(q,(eqtb[7892342].int>0));
mem[q].hh.rh:=mem[ha].hh.rh;mem[ha].hh.rh:=q;mem[ha+4].qqqq.b2:=l;
setnativemetrics(ha,(eqtb[7892342].int>0));{:947};ha:=mem[ha].hh.rh;
goto 20;
end else if(hn=maxhyphenatablelength)then goto 33 else begin incr(hn);
if c<65536 then begin hu[hn]:=c;hc[hn]:=hc[0];
end else begin hu[hn]:=(c-65536)div 1024+55296;
hc[hn]:=(hc[0]-65536)div 1024+55296;incr(hn);hu[hn]:=c mod 1024+56320;
hc[hn]:=hc[0]mod 1024+56320;incr(l);end;hyfbchar:=65536;end end;{:946};
end else begin{950:}hn:=0;
while true do begin if(s>=himemmin)then begin if mem[s].hh.b0<>hf then
goto 33;hyfbchar:=mem[s].hh.b1;c:=hyfbchar;
if(hyphindex=0)or((c)>255)then hc[0]:=eqtb[2321704+c].hh.rh else if
trietrc[hyphindex+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]=0 then goto 33;if hc[0]>maxhyphchar then goto 33;
if hn=maxhyphenatablelength then goto 33;hb:=s;incr(hn);hu[hn]:=c;
hc[hn]:=hc[0];hyfbchar:=65536;end else if mem[s].hh.b0=6 then{951:}
begin if mem[s+1].hh.b0<>hf then goto 33;j:=hn;q:=mem[s+1].hh.rh;
if q>-268435455 then hyfbchar:=mem[q].hh.b1;
while q>-268435455 do begin c:=mem[q].hh.b1;
if(hyphindex=0)or((c)>255)then hc[0]:=eqtb[2321704+c].hh.rh else if
trietrc[hyphindex+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]=0 then goto 33;if hc[0]>maxhyphchar then goto 33;
if j=maxhyphenatablelength then goto 33;incr(j);hu[j]:=c;hc[j]:=hc[0];
q:=mem[q].hh.rh;end;hb:=s;hn:=j;
if odd(mem[s].hh.b1)then hyfbchar:=fontbchar[hf]else hyfbchar:=65536;
end{:951}else if(mem[s].hh.b0=11)and(mem[s].hh.b1=0)then begin hb:=s;
hyfbchar:=fontbchar[hf];end else goto 33;s:=mem[s].hh.rh;end;33:{:950};
end;{952:}if hn<lhyf+rhyf then goto 31;
while true do begin if not((s>=himemmin))then case mem[s].hh.b0 of 6:;
11:if mem[s].hh.b1<>0 then goto 34;8,10,12,3,5,4:goto 34;
9:if mem[s].hh.b1>=4 then goto 34 else goto 31;others:goto 31 end;
s:=mem[s].hh.rh;end;34:{:952};hyphenate;end;31:end{:943};end;
11:if mem[curp].hh.b1=1 then begin if not(mem[curp].hh.rh>=himemmin)and
autobreaking then if mem[mem[curp].hh.rh].hh.b0=10 then trybreak(0,0);
activewidth[1]:=activewidth[1]+mem[curp+1].int;
end else activewidth[1]:=activewidth[1]+mem[curp+1].int;
6:begin f:=mem[curp+1].hh.b0;xtxligaturepresent:=true;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,mem[curp+1].hh.b1)].qqqq.b0].int;end;7:{917:}
begin s:=mem[curp+1].hh.lh;discwidth:=0;
if s=-268435455 then trybreak(eqtb[7892268].int,1)else begin repeat{918:
}if(s>=himemmin)then begin f:=mem[s].hh.b0;
discwidth:=discwidth+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[s].hh.b1)].qqqq.b0].int;
end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
xtxligaturepresent:=true;
discwidth:=discwidth+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[s+1].hh.b1)].qqqq.b0].int;end;
0,1,2,11:discwidth:=discwidth+mem[s+1].int;
8:if(((mem[s].hh.b1>=40)and(mem[s].hh.b1<=41)))or(mem[s].hh.b1=42)or(mem
[s].hh.b1=43)or(mem[s].hh.b1=44)then discwidth:=discwidth+mem[s+1].int
else confusion(66371);others:confusion(66372)end{:918};s:=mem[s].hh.rh;
until s=-268435455;activewidth[1]:=activewidth[1]+discwidth;
trybreak(eqtb[7892267].int,1);activewidth[1]:=activewidth[1]-discwidth;
end;r:=mem[curp].hh.b1;s:=mem[curp].hh.rh;while r>0 do begin{919:}
if(s>=himemmin)then begin f:=mem[s].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,mem[s].hh.b1)].qqqq.b0].int;
end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
xtxligaturepresent:=true;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,mem[s+1].hh.b1)].qqqq.b0].int;end;
0,1,2,11:activewidth[1]:=activewidth[1]+mem[s+1].int;
8:if(((mem[s].hh.b1>=40)and(mem[s].hh.b1<=41)))or(mem[s].hh.b1=42)or(mem
[s].hh.b1=43)or(mem[s].hh.b1=44)then activewidth[1]:=activewidth[1]+mem[
s+1].int else confusion(66373);others:confusion(66374)end{:919};decr(r);
s:=mem[s].hh.rh;end;begin prevp:=curp;globalprevp:=curp;end;curp:=s;
goto 35;end{:917};
9:begin if mem[curp].hh.b1<4 then autobreaking:=odd(mem[curp].hh.b1);
begin if not(mem[curp].hh.rh>=himemmin)and autobreaking then if mem[mem[
curp].hh.rh].hh.b0=10 then trybreak(0,0);
activewidth[1]:=activewidth[1]+mem[curp+1].int;end;end;
12:trybreak(mem[curp+1].int,0);4,3,5:;others:confusion(66370)end;
begin prevp:=curp;globalprevp:=curp;end;curp:=mem[curp].hh.rh;
35:end{:914};if curp=-268435455 then{921:}begin trybreak(-10000,1);
if mem[memtop-7].hh.rh<>memtop-7 then begin{922:}r:=mem[memtop-7].hh.rh;
fewestdemerits:=1073741823;
repeat if mem[r].hh.b0<>2 then if mem[r+2].int<fewestdemerits then begin
fewestdemerits:=mem[r+2].int;bestbet:=r;end;r:=mem[r].hh.rh;
until r=memtop-7;bestline:=mem[bestbet+1].hh.lh{:922};
if eqtb[7892283].int=0 then goto 30;{923:}begin r:=mem[memtop-7].hh.rh;
actuallooseness:=0;
repeat if mem[r].hh.b0<>2 then begin linediff:=mem[r+1].hh.lh-bestline;
if((linediff<actuallooseness)and(eqtb[7892283].int<=linediff))or((
linediff>actuallooseness)and(eqtb[7892283].int>=linediff))then begin
bestbet:=r;actuallooseness:=linediff;fewestdemerits:=mem[r+2].int;
end else if(linediff=actuallooseness)and(mem[r+2].int<fewestdemerits)
then begin bestbet:=r;fewestdemerits:=mem[r+2].int;end;end;
r:=mem[r].hh.rh;until r=memtop-7;bestline:=mem[bestbet+1].hh.lh;
end{:923};
if(actuallooseness=eqtb[7892283].int)or finalpass then goto 30;end;
end{:921};{913:}q:=mem[memtop-7].hh.rh;
while q<>memtop-7 do begin curp:=mem[q].hh.rh;
if mem[q].hh.b0=2 then freenode(q,7)else freenode(q,activenodesize);
q:=curp;end;q:=passive;while q<>-268435455 do begin curp:=mem[q].hh.rh;
freenode(q,2);q:=curp;end{:913};
if not secondpass then begin ifdef('STAT')if eqtb[7892296].int>0 then
printnl(66368);endif('STAT')threshold:=eqtb[7892265].int;
secondpass:=true;finalpass:=(eqtb[9006740].int<=0);
end else begin ifdef('STAT')if eqtb[7892296].int>0 then printnl(66369);
endif('STAT')background[2]:=background[2]+eqtb[9006740].int;
finalpass:=true;end;end;
30:ifdef('STAT')if eqtb[7892296].int>0 then begin enddiagnostic(true);
normalizeselector;end;endif('STAT')if dolastlinefit then{1664:}
if mem[bestbet+3].int=0 then dolastlinefit:=false else begin q:=newspec(
mem[lastlinefill+1].hh.lh);deleteglueref(mem[lastlinefill+1].hh.lh);
mem[q+1].int:=mem[q+1].int+mem[bestbet+3].int-mem[bestbet+4].int;
mem[q+2].int:=0;mem[lastlinefill+1].hh.lh:=q;end{:1664};{:911};{924:}
postlinebreak(d){:924};{913:}q:=mem[memtop-7].hh.rh;
while q<>memtop-7 do begin curp:=mem[q].hh.rh;
if mem[q].hh.b0=2 then freenode(q,7)else freenode(q,activenodesize);
q:=curp;end;q:=passive;while q<>-268435455 do begin curp:=mem[q].hh.rh;
freenode(q,2);q:=curp;end{:913};packbeginline:=0;end;{1466:}
function eTeXenabled(b:boolean;j:quarterword;k:halfword):boolean;
begin if not b then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66029);end;printcmdchr(j,k);begin helpptr:=1;helpline[0]:=66860;
end;error;end;eTeXenabled:=b;end;{:1466}{1489:}procedure showsavegroups;
label 41,42,40,30;var p:0..nestsize;m:-209..209;v:savepointer;
l:quarterword;c:groupcode;a:-1..1;i:integer;j:quarterword;s:strnumber;
begin p:=nestptr;nest[p]:=curlist;v:=saveptr;l:=curlevel;c:=curgroup;
saveptr:=curboundary;decr(curlevel);a:=1;printnl(65626);println;
while true do begin printnl(65661);printgroup(true);
if curgroup=0 then goto 30;repeat m:=nest[p].modefield;
if p>0 then decr(p)else m:=1;until m<>105;print(65566);
case curgroup of 1:begin incr(p);goto 42;end;2,3:s:=66494;4:s:=66403;
5:s:=66493;6:if a=0 then begin if m=-1 then s:=65835 else s:=65862;a:=1;
goto 41;end else begin if a=1 then print(66898)else printesc(66327);
if p>=a then p:=p-a;a:=0;goto 40;end;7:begin incr(p);a:=-1;
printesc(65848);goto 42;end;8:begin printesc(65698);goto 40;end;
9:goto 42;
10,13:begin if curgroup=10 then printesc(65639)else printesc(65846);
for i:=1 to 3 do if i<=savestack[saveptr-2].int then print(66270);
goto 42;end;
11:begin if savestack[saveptr-2].int=255 then printesc(65642)else begin
printesc(65618);printint(savestack[saveptr-2].int);end;goto 42;end;
12:begin s:=65863;goto 41;end;14:begin incr(p);printesc(65825);goto 40;
end;
15:begin if m=209 then printchar(36)else if nest[p].modefield=209 then
begin printcmdchr(48,savestack[saveptr-2].int);goto 40;end;
printchar(36);goto 40;end;
16:begin if mem[nest[p+1].eTeXauxfield].hh.b0=30 then printesc(66286)
else printesc(66288);goto 40;end;end;{1491:}i:=savestack[saveptr-4].int;
if i<>0 then if i<1073741824 then begin if abs(nest[p].modefield)=1 then
j:=21 else j:=22;if i>0 then printcmdchr(j,0)else printcmdchr(j,1);
printscaled(abs(i));print(65697);
end else if i<1073807360 then begin if i>=1073774592 then begin printesc
(66611);i:=i-(32768);end;printesc(65860);printint(i-1073741824);
printchar(61);end else printcmdchr(31,i-(1073807261)){:1491};
41:printesc(s);{1490:}
if savestack[saveptr-2].int<>0 then begin printchar(32);
if savestack[saveptr-3].int=0 then print(66251)else print(66252);
printscaled(savestack[saveptr-2].int);print(65697);end{:1490};
42:printchar(123);40:printchar(41);decr(curlevel);
curgroup:=savestack[saveptr].hh.b1;
saveptr:=savestack[saveptr].hh.rh end;30:saveptr:=v;curlevel:=l;
curgroup:=c;end;{:1489}{1505:}procedure newinteraction;forward;{:1505}
{:863}{988:}procedure newhyphexceptions;label 21,10,40,45,46;
var n:0..4096;j:0..4096;h:hyphpointer;k:strnumber;p:halfword;q:halfword;
s:strnumber;u,v:poolpointer;begin scanleftbrace;
if eqtb[7892314].int<=0 then curlang:=0 else if eqtb[7892314].int>255
then curlang:=0 else curlang:=eqtb[7892314].int;
ifdef('INITEX')if trienotready then begin hyphindex:=0;goto 46;end;
endif('INITEX')if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0
else hyphindex:=trietrl[hyphstart+curlang];46:{989:}n:=0;p:=-268435455;
while true do begin getxtoken;21:case curcmd of 11,12,68:{991:}
if curchr=45 then{992:}
begin if n<maxhyphenatablelength then begin q:=getavail;mem[q].hh.rh:=p;
mem[q].hh.lh:=n;p:=q;end;end{:992}
else begin if(hyphindex=0)or((curchr)>255)then hc[0]:=eqtb[2321704+
curchr].hh.rh else if trietrc[hyphindex+curchr]<>curchr then hc[0]:=0
else hc[0]:=trietro[hyphindex+curchr];
if hc[0]=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66381);end;begin helpptr:=2;helpline[1]:=66382;helpline[0]:=66383;
end;error;end else if n<maxhyphenatablelength then begin incr(n);
if hc[0]<65536 then hc[n]:=hc[0]else begin hc[n]:=(hc[0]-65536)div 1024
+55296;incr(n);hc[n]:=hc[0]mod 1024+56320;end;end;end{:991};
16:begin scancharnum;curchr:=curval;curcmd:=68;goto 21;end;
10,2:begin if n>1 then{993:}begin incr(n);hc[n]:=curlang;
begin if poolptr+n>poolsize then overflow(65539,poolsize-initpoolptr);
end;h:=0;for j:=1 to n do begin h:=(h+h+hc[j])mod 607;
begin if(hc[j]>65535)then begin strpool[poolptr]:=(hc[j]-65536)div 1024
+55296;incr(poolptr);strpool[poolptr]:=(hc[j])mod 1024+56320;
incr(poolptr);end else begin strpool[poolptr]:=hc[j];incr(poolptr);end;
end;end;s:=makestring;{994:}
if hyphnext<=607 then while(hyphnext>0)and(hyphword[hyphnext-1]>0)do
decr(hyphnext);
if(hyphcount=hyphsize)or(hyphnext=0)then overflow(66384,hyphsize);
incr(hyphcount);while hyphword[h]<>0 do begin{995:}k:=hyphword[h];
if length(k)<>length(s)then goto 45;u:=strstart[(k)-65536];
v:=strstart[(s)-65536];repeat if strpool[u]<>strpool[v]then goto 45;
incr(u);incr(v);until u=strstart[(k+1)-65536];begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;s:=hyphword[h];decr(hyphcount);
goto 40;45:{:995};if hyphlink[h]=0 then begin hyphlink[h]:=hyphnext;
if hyphnext>=hyphsize then hyphnext:=607;
if hyphnext>607 then incr(hyphnext);end;h:=hyphlink[h]-1;end;
40:hyphword[h]:=s;hyphlist[h]:=p{:994};end{:993};
if curcmd=2 then goto 10;n:=0;p:=-268435455;end;others:{990:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66029);end;printesc(66377);print(66378);begin helpptr:=2;
helpline[1]:=66379;helpline[0]:=66380;end;error;end{:990}end;end{:989};
10:end;{:988}{1022:}function prunepagetop(p:halfword;
s:boolean):halfword;var prevp:halfword;q,r:halfword;
begin prevp:=memtop-3;mem[memtop-3].hh.rh:=p;
while p<>-268435455 do case mem[p].hh.b0 of 0,1,2:{1023:}
begin q:=newskipparam(10);mem[prevp].hh.rh:=q;mem[q].hh.rh:=p;
if(eqtb[7892341].int>0)then begin if mem[tempptr+1].int>mem[p+2].int
then mem[tempptr+1].int:=mem[tempptr+1].int-mem[p+2].int else mem[
tempptr+1].int:=0;
end else begin if mem[tempptr+1].int>mem[p+3].int then mem[tempptr+1].
int:=mem[tempptr+1].int-mem[p+3].int else mem[tempptr+1].int:=0;end;
p:=-268435455;end{:1023};8,4,3:begin prevp:=p;p:=mem[prevp].hh.rh;end;
10,11,12:begin q:=p;p:=mem[q].hh.rh;mem[q].hh.rh:=-268435455;
mem[prevp].hh.rh:=p;
if s then begin if discptr[3]=-268435455 then discptr[3]:=q else mem[r].
hh.rh:=q;r:=q;end else flushnodelist(q);end;others:confusion(66395)end;
prunepagetop:=mem[memtop-3].hh.rh;end;{:1022}{1024:}
function vertbreak(p:halfword;h,d:scaled):halfword;label 30,45,90;
var prevp:halfword;q,r:halfword;pi:integer;b:integer;leastcost:integer;
bestplace:halfword;prevdp:scaled;t:smallnumber;begin prevp:=p;
leastcost:=1073741823;activewidth[1]:=0;activewidth[2]:=0;
activewidth[3]:=0;activewidth[4]:=0;activewidth[5]:=0;activewidth[6]:=0;
prevdp:=0;while true do begin{1026:}
if p=-268435455 then pi:=-10000 else{1027:}
case mem[p].hh.b0 of 0,1,2:begin activewidth[1]:=activewidth[1]+prevdp+
mem[p+3].int;prevdp:=mem[p+2].int;goto 45;end;8:{1425:}
begin if(mem[p].hh.b1=43)or(mem[p].hh.b1=44)then begin activewidth[1]:=
activewidth[1]+prevdp+mem[p+3].int;prevdp:=mem[p+2].int;end;goto 45;
end{:1425};10:if(mem[prevp].hh.b0<9)then pi:=0 else goto 90;
11:begin if mem[p].hh.rh=-268435455 then t:=12 else t:=mem[mem[p].hh.rh]
.hh.b0;if t=10 then pi:=0 else goto 90;end;12:pi:=mem[p+1].int;
4,3:goto 45;others:confusion(66396)end{:1027};{1028:}
if pi<10000 then begin{1029:}
if activewidth[1]<h then if(activewidth[3]<>0)or(activewidth[4]<>0)or(
activewidth[5]<>0)then b:=0 else b:=badness(h-activewidth[1],activewidth
[2])else if activewidth[1]-h>activewidth[6]then b:=1073741823 else b:=
badness(activewidth[1]-h,activewidth[6]){:1029};
if b<1073741823 then if pi<=-10000 then b:=pi else if b<10000 then b:=b+
pi else b:=100000;if b<=leastcost then begin bestplace:=p;leastcost:=b;
bestheightplusdepth:=activewidth[1]+prevdp;end;
if(b=1073741823)or(pi<=-10000)then goto 30;end{:1028};
if(mem[p].hh.b0<10)or(mem[p].hh.b0>11)then goto 45;90:{1030:}
if mem[p].hh.b0=11 then q:=p else begin q:=mem[p+1].hh.lh;
activewidth[2+mem[q].hh.b0]:=activewidth[2+mem[q].hh.b0]+mem[q+2].int;
activewidth[6]:=activewidth[6]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin if isbitset(eqtb[
7892335].int,1)then begin oldselectorignorederr:=selector;selector:=18;
writeln(logfile);write(logfile,'ignored: ');print(66397);
selector:=oldselectorignorederr;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66397);end;begin helpptr:=4;helpline[3]:=66398;helpline[2]:=66399;
helpline[1]:=66400;helpline[0]:=66350;end;error;end;r:=newspec(q);
mem[r].hh.b1:=0;deleteglueref(q);mem[p+1].hh.lh:=r;q:=r;end;end;
activewidth[1]:=activewidth[1]+prevdp+mem[q+1].int;prevdp:=0{:1030};
45:if prevdp>d then begin activewidth[1]:=activewidth[1]+prevdp-d;
prevdp:=d;end;{:1026};prevp:=p;p:=mem[prevp].hh.rh;end;
30:vertbreak:=bestplace;end;{:1024}{1031:}{1636:}
function domarks(a,l:smallnumber;q:halfword):boolean;var i:smallnumber;
begin if l<4 then begin for i:=0 to 15 do begin if odd(i)then curptr:=
mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div 2)+1].hh.lh;
if curptr<>-268435455 then if domarks(a,l+1,curptr)then begin if odd(i)
then mem[q+(i div 2)+1].hh.rh:=-268435455 else mem[q+(i div 2)+1].hh.lh
:=-268435455;decr(mem[q].hh.b1);end;end;
if mem[q].hh.b1=0 then begin freenode(q,33);q:=-268435455;end;
end else begin case a of{1637:}
0:if mem[q+2].hh.rh<>-268435455 then begin deletetokenref(mem[q+2].hh.rh
);mem[q+2].hh.rh:=-268435455;deletetokenref(mem[q+3].hh.lh);
mem[q+3].hh.lh:=-268435455;end;{:1637}{1639:}
1:if mem[q+2].hh.lh<>-268435455 then begin if mem[q+1].hh.lh<>-268435455
then deletetokenref(mem[q+1].hh.lh);deletetokenref(mem[q+1].hh.rh);
mem[q+1].hh.rh:=-268435455;
if mem[mem[q+2].hh.lh].hh.rh=-268435455 then begin deletetokenref(mem[q
+2].hh.lh);mem[q+2].hh.lh:=-268435455;
end else incr(mem[mem[q+2].hh.lh].hh.lh);mem[q+1].hh.lh:=mem[q+2].hh.lh;
end;{:1639}{1640:}
2:if(mem[q+1].hh.lh<>-268435455)and(mem[q+1].hh.rh=-268435455)then begin
mem[q+1].hh.rh:=mem[q+1].hh.lh;incr(mem[mem[q+1].hh.lh].hh.lh);end;
{:1640}{1642:}
ifdef('INITEX')3:for i:=0 to 4 do begin if odd(i)then curptr:=mem[q+(i
div 2)+1].hh.rh else curptr:=mem[q+(i div 2)+1].hh.lh;
if curptr<>-268435455 then begin deletetokenref(curptr);
if odd(i)then mem[q+(i div 2)+1].hh.rh:=-268435455 else mem[q+(i div 2)
+1].hh.lh:=-268435455;end;end;endif('INITEX'){:1642}end;
if mem[q+2].hh.lh=-268435455 then if mem[q+3].hh.lh=-268435455 then
begin freenode(q,4);q:=-268435455;end;end;domarks:=(q=-268435455);end;
{:1636}function vsplit(n:halfword;h:scaled):halfword;label 10,30;
var v:halfword;p:halfword;q:halfword;begin curval:=n;
if curval<256 then v:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then v:=-268435455 else v:=mem[curptr+1].hh.rh;end;
flushnodelist(discptr[3]);discptr[3]:=-268435455;
if saroot[7]<>-268435455 then if domarks(0,0,saroot[7])then saroot[7]:=
-268435455;
if curmark[3]<>-268435455 then begin deletetokenref(curmark[3]);
curmark[3]:=-268435455;deletetokenref(curmark[4]);
curmark[4]:=-268435455;end;{1032:}
if v=-268435455 then begin vsplit:=-268435455;goto 10;end;
if mem[v].hh.b0<>1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65626);end;printesc(66401);print(66402);printesc(66403);
begin helpptr:=2;helpline[1]:=66404;helpline[0]:=66405;end;error;
vsplit:=-268435455;goto 10;end{:1032};
q:=vertbreak(mem[v+5].hh.rh,h,eqtb[9006726].int);{1033:}
p:=mem[v+5].hh.rh;
if p=q then mem[v+5].hh.rh:=-268435455 else while true do begin if mem[p
].hh.b0=4 then if mem[p+1].hh.lh<>0 then{1638:}
begin findsaelement(7,mem[p+1].hh.lh,true);
if mem[curptr+2].hh.rh=-268435455 then begin mem[curptr+2].hh.rh:=mem[p
+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end else deletetokenref(mem[curptr+3].hh.lh);
mem[curptr+3].hh.lh:=mem[p+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end{:1638}
else if curmark[3]=-268435455 then begin curmark[3]:=mem[p+1].hh.rh;
curmark[4]:=curmark[3];mem[curmark[3]].hh.lh:=mem[curmark[3]].hh.lh+2;
end else begin deletetokenref(curmark[4]);curmark[4]:=mem[p+1].hh.rh;
incr(mem[curmark[4]].hh.lh);end;
if mem[p].hh.rh=q then begin mem[p].hh.rh:=-268435455;goto 30;end;
p:=mem[p].hh.rh;end;30:{:1033};q:=prunepagetop(q,eqtb[7892332].int>0);
p:=mem[v+5].hh.rh;freenode(v,8);
if q<>-268435455 then q:=vpackage(q,0,1,1073741823);
if curval<256 then eqtb[1206567+curval].hh.rh:=q else begin
findsaelement(4,curval,false);
if curptr<>-268435455 then begin mem[curptr+1].hh.rh:=q;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;
vsplit:=vpackage(p,h,0,eqtb[9006726].int);10:end;{:1031}{1039:}
procedure printtotals;begin printscaled(pagesofar[1]);
if pagesofar[2]<>0 then begin print(65598);printscaled(pagesofar[2]);
print(65626);end;if pagesofar[3]<>0 then begin print(65598);
printscaled(pagesofar[3]);print(65597);end;
if pagesofar[4]<>0 then begin print(65598);printscaled(pagesofar[4]);
print(66414);end;if pagesofar[5]<>0 then begin print(65598);
printscaled(pagesofar[5]);print(66415);end;
if pagesofar[6]<>0 then begin print(65599);printscaled(pagesofar[6]);
end;end;{:1039}{1041:}procedure freezepagespecs(s:smallnumber);
begin pagecontents:=s;pagesofar[0]:=eqtb[9006724].int;
pagemaxdepth:=eqtb[9006725].int;pagesofar[7]:=0;pagesofar[1]:=0;
pagesofar[2]:=0;pagesofar[3]:=0;pagesofar[4]:=0;pagesofar[5]:=0;
pagesofar[6]:=0;leastpagecost:=1073741823;
ifdef('STAT')if eqtb[7892297].int>0 then begin begindiagnostic;
printnl(66423);printscaled(pagesofar[0]);print(66424);
printscaled(pagemaxdepth);enddiagnostic(false);end;endif('STAT')end;
{:1041}{1046:}procedure boxerror(n:eightbits);begin error;
begindiagnostic;printnl(66238);showbox(eqtb[1206567+n].hh.rh);
enddiagnostic(true);flushnodelist(eqtb[1206567+n].hh.rh);
eqtb[1206567+n].hh.rh:=-268435455;end;{:1046}{1047:}
procedure ensurevbox(n:eightbits);var p:halfword;
begin p:=eqtb[1206567+n].hh.rh;
if p<>-268435455 then if mem[p].hh.b0=0 then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(65544);
print(66425);end;begin helpptr:=3;helpline[2]:=66426;helpline[1]:=66427;
helpline[0]:=66428;end;boxerror(n);end;end;{:1047}{1048:}{1066:}
procedure fireup(c:halfword);label 10;var p,q,r,s:halfword;
prevp:halfword;n:0..255;wait:boolean;savevbadness:integer;
savevfuzz:scaled;savesplittopskip:halfword;begin{1067:}
if mem[bestpagebreak].hh.b0=12 then begin geqworddefine(7892303,mem[
bestpagebreak+1].int);mem[bestpagebreak+1].int:=10000;
end else geqworddefine(7892303,10000){:1067};
if saroot[7]<>-268435455 then if domarks(1,0,saroot[7])then saroot[7]:=
-268435455;
if curmark[2]<>-268435455 then begin if curmark[0]<>-268435455 then
deletetokenref(curmark[0]);curmark[0]:=curmark[2];
incr(mem[curmark[0]].hh.lh);deletetokenref(curmark[1]);
curmark[1]:=-268435455;end;{1068:}
if c=bestpagebreak then bestpagebreak:=-268435455;{1069:}
if eqtb[1206822].hh.rh<>-268435455 then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65544);
print(65626);end;printesc(65709);print(66439);begin helpptr:=2;
helpline[1]:=66440;helpline[0]:=66428;end;boxerror(255);end{:1069};
insertpenalties:=0;savesplittopskip:=eqtb[1205774].hh.rh;
if eqtb[7892317].int<=0 then{1072:}begin r:=mem[memtop].hh.rh;
while r<>memtop do begin if mem[r+2].hh.lh<>-268435455 then begin n:=mem
[r].hh.b1;ensurevbox(n);
if eqtb[1206567+n].hh.rh=-268435455 then eqtb[1206567+n].hh.rh:=
newnullbox;p:=eqtb[1206567+n].hh.rh+5;
while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;mem[r+2].hh.rh:=p;end;
r:=mem[r].hh.rh;end;end{:1072};q:=memtop-4;mem[q].hh.rh:=-268435455;
prevp:=memtop-2;p:=mem[prevp].hh.rh;
while p<>bestpagebreak do begin if mem[p].hh.b0=3 then begin if eqtb[
7892317].int<=0 then{1074:}begin r:=mem[memtop].hh.rh;
while mem[r].hh.b1<>mem[p].hh.b1 do r:=mem[r].hh.rh;
if mem[r+2].hh.lh=-268435455 then wait:=true else begin wait:=false;
s:=mem[r+2].hh.rh;mem[s].hh.rh:=mem[p+4].hh.lh;
if mem[r+2].hh.lh=p then{1075:}
begin if mem[r].hh.b0=1 then if(mem[r+1].hh.lh=p)and(mem[r+1].hh.rh<>
-268435455)then begin while mem[s].hh.rh<>mem[r+1].hh.rh do s:=mem[s].hh
.rh;mem[s].hh.rh:=-268435455;eqtb[1205774].hh.rh:=mem[p+4].hh.rh;
mem[p+4].hh.lh:=prunepagetop(mem[r+1].hh.rh,false);
if mem[p+4].hh.lh<>-268435455 then begin tempptr:=vpackage(mem[p+4].hh.
lh,0,1,1073741823);mem[p+3].int:=mem[tempptr+3].int+mem[tempptr+2].int;
freenode(tempptr,8);wait:=true;end;end;mem[r+2].hh.lh:=-268435455;
n:=mem[r].hh.b1;tempptr:=mem[eqtb[1206567+n].hh.rh+5].hh.rh;
freenode(eqtb[1206567+n].hh.rh,8);
eqtb[1206567+n].hh.rh:=vpackage(tempptr,0,1,1073741823);end{:1075}
else begin while mem[s].hh.rh<>-268435455 do s:=mem[s].hh.rh;
mem[r+2].hh.rh:=s;end;end;{1076:}mem[prevp].hh.rh:=mem[p].hh.rh;
mem[p].hh.rh:=-268435455;if wait then begin mem[q].hh.rh:=p;q:=p;
incr(insertpenalties);end else begin deleteglueref(mem[p+4].hh.rh);
freenode(p,5);end;p:=prevp{:1076};end{:1074};
end else if mem[p].hh.b0=4 then if mem[p+1].hh.lh<>0 then{1641:}
begin findsaelement(7,mem[p+1].hh.lh,true);
if mem[curptr+1].hh.rh=-268435455 then begin mem[curptr+1].hh.rh:=mem[p
+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);end;
if mem[curptr+2].hh.lh<>-268435455 then deletetokenref(mem[curptr+2].hh.
lh);mem[curptr+2].hh.lh:=mem[p+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end{:1641}else{1070:}
begin if curmark[1]=-268435455 then begin curmark[1]:=mem[p+1].hh.rh;
incr(mem[curmark[1]].hh.lh);end;
if curmark[2]<>-268435455 then deletetokenref(curmark[2]);
curmark[2]:=mem[p+1].hh.rh;incr(mem[curmark[2]].hh.lh);end{:1070};
prevp:=p;p:=mem[prevp].hh.rh;end;eqtb[1205774].hh.rh:=savesplittopskip;
{1071:}
if p<>-268435455 then begin if mem[memtop-1].hh.rh=-268435455 then if
nestptr=0 then curlist.tailfield:=pagetail else nest[0].tailfield:=
pagetail;mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;
mem[memtop-1].hh.rh:=p;mem[prevp].hh.rh:=-268435455;end;
savevbadness:=eqtb[7892291].int;eqtb[7892291].int:=10000;
savevfuzz:=eqtb[9006729].int;eqtb[9006729].int:=1073741823;
eqtb[1206822].hh.rh:=vpackage(mem[memtop-2].hh.rh,bestsize,0,
pagemaxdepth);eqtb[7892291].int:=savevbadness;
eqtb[9006729].int:=savevfuzz;
if lastglue<>1073741823 then deleteglueref(lastglue);{1045:}
pagecontents:=0;pagetail:=memtop-2;mem[memtop-2].hh.rh:=-268435455;
lastglue:=1073741823;lastpenalty:=0;lastkern:=0;lastnodetype:=-1;
pagesofar[7]:=0;pagemaxdepth:=0{:1045};
if q<>memtop-4 then begin mem[memtop-2].hh.rh:=mem[memtop-4].hh.rh;
pagetail:=q;end{:1071};{1073:}r:=mem[memtop].hh.rh;
while r<>memtop do begin q:=mem[r].hh.rh;freenode(r,4);r:=q;end;
mem[memtop].hh.rh:=memtop{:1073}{:1068};
if saroot[7]<>-268435455 then if domarks(2,0,saroot[7])then saroot[7]:=
-268435455;
if(curmark[0]<>-268435455)and(curmark[1]=-268435455)then begin curmark[1
]:=curmark[0];incr(mem[curmark[0]].hh.lh);end;
if eqtb[1206296].hh.rh<>-268435455 then if deadcycles>=eqtb[7892304].int
then{1078:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66441);end;printint(deadcycles);print(66442);begin helpptr:=3;
helpline[2]:=66443;helpline[1]:=66444;helpline[0]:=66445;end;error;
end{:1078}else{1079:}begin outputactive:=true;incr(deadcycles);pushnest;
curlist.modefield:=-1;curlist.auxfield.int:=-65536000;
curlist.mlfield:=-line;begintokenlist(eqtb[1206296].hh.rh,7);
newsavelevel(8);normalparagraph;scanleftbrace;goto 10;end{:1079};{1077:}
begin if mem[memtop-2].hh.rh<>-268435455 then begin if mem[memtop-1].hh.
rh=-268435455 then if nestptr=0 then curlist.tailfield:=pagetail else
nest[0].tailfield:=pagetail else mem[pagetail].hh.rh:=mem[memtop-1].hh.
rh;mem[memtop-1].hh.rh:=mem[memtop-2].hh.rh;
mem[memtop-2].hh.rh:=-268435455;pagetail:=memtop-2;end;
flushnodelist(discptr[2]);discptr[2]:=-268435455;
shipout(eqtb[1206822].hh.rh);eqtb[1206822].hh.rh:=-268435455;end{:1077};
10:end;{:1066}procedure buildpage;label 10,30,31,22,80,90;
var p:halfword;q,r:halfword;b,c:integer;pi:integer;n:0..255;
delta,h,w:scaled;
begin if(mem[memtop-1].hh.rh=-268435455)or outputactive then goto 10;
repeat 22:p:=mem[memtop-1].hh.rh;{1050:}
if lastglue<>1073741823 then deleteglueref(lastglue);lastpenalty:=0;
lastkern:=0;lastnodetype:=mem[p].hh.b0+1;
if mem[p].hh.b0=10 then begin lastglue:=mem[p+1].hh.lh;
incr(mem[lastglue].hh.rh);end else begin lastglue:=1073741823;
if mem[p].hh.b0=12 then lastpenalty:=mem[p+1].int else if mem[p].hh.b0=
11 then lastkern:=mem[p+1].int;end{:1050};{1051:}{1054:}
case mem[p].hh.b0 of 0,1,2:if pagecontents<2 then{1055:}
begin if pagecontents=0 then freezepagespecs(2)else pagecontents:=2;
q:=newskipparam(9);
if(eqtb[7892341].int>0)then begin if mem[tempptr+1].int>mem[p+2].int
then mem[tempptr+1].int:=mem[tempptr+1].int-mem[p+2].int else mem[
tempptr+1].int:=0;
end else begin if mem[tempptr+1].int>mem[p+3].int then mem[tempptr+1].
int:=mem[tempptr+1].int-mem[p+3].int else mem[tempptr+1].int:=0;end;
mem[q].hh.rh:=p;mem[memtop-1].hh.rh:=q;goto 22;end{:1055}else{1056:}
begin pagesofar[1]:=pagesofar[1]+pagesofar[7]+mem[p+3].int;
pagesofar[7]:=mem[p+2].int;goto 80;end{:1056};8:{1424:}
begin if(mem[p].hh.b1=43)or(mem[p].hh.b1=44)then begin pagesofar[1]:=
pagesofar[1]+pagesofar[7]+mem[p+3].int;pagesofar[7]:=mem[p+2].int;end;
goto 80;end{:1424};
10:if pagecontents<2 then goto 31 else if(mem[pagetail].hh.b0<9)then pi
:=0 else goto 90;
11:if pagecontents<2 then goto 31 else if mem[p].hh.rh=-268435455 then
goto 10 else if mem[mem[p].hh.rh].hh.b0=10 then pi:=0 else goto 90;
12:if pagecontents<2 then goto 31 else pi:=mem[p+1].int;4:goto 80;
3:{1062:}begin if pagecontents=0 then freezepagespecs(1);
n:=mem[p].hh.b1;r:=memtop;
while n>=mem[mem[r].hh.rh].hh.b1 do r:=mem[r].hh.rh;n:=n;
if mem[r].hh.b1<>n then{1063:}begin q:=getnode(4);
mem[q].hh.rh:=mem[r].hh.rh;mem[r].hh.rh:=q;r:=q;mem[r].hh.b1:=n;
mem[r].hh.b0:=0;ensurevbox(n);
if eqtb[1206567+n].hh.rh=-268435455 then mem[r+3].int:=0 else mem[r+3].
int:=mem[eqtb[1206567+n].hh.rh+3].int+mem[eqtb[1206567+n].hh.rh+2].int;
mem[r+2].hh.lh:=-268435455;q:=eqtb[1205783+n].hh.rh;
if eqtb[7892352+n].int=1000 then h:=mem[r+3].int else h:=xovern(mem[r+3]
.int,1000)*eqtb[7892352+n].int;
pagesofar[0]:=pagesofar[0]-h-mem[q+1].int;
pagesofar[2+mem[q].hh.b0]:=pagesofar[2+mem[q].hh.b0]+mem[q+2].int;
pagesofar[6]:=pagesofar[6]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65544);
print(66434);end;printesc(65695);printint(n);begin helpptr:=3;
helpline[2]:=66435;helpline[1]:=66436;helpline[0]:=66350;end;error;end;
end{:1063};
if mem[r].hh.b0=1 then insertpenalties:=insertpenalties+mem[p+1].int
else begin mem[r+2].hh.rh:=p;
delta:=pagesofar[0]-pagesofar[1]-pagesofar[7]+pagesofar[6];
if eqtb[7892352+n].int=1000 then h:=mem[p+3].int else h:=xovern(mem[p+3]
.int,1000)*eqtb[7892352+n].int;
if((h<=0)or(h<=delta))and(mem[p+3].int+mem[r+3].int<=eqtb[9006743+n].int
)then begin pagesofar[0]:=pagesofar[0]-h;
mem[r+3].int:=mem[r+3].int+mem[p+3].int;end else{1064:}
begin if eqtb[7892352+n].int<=0 then w:=1073741823 else begin w:=
pagesofar[0]-pagesofar[1]-pagesofar[7];
if eqtb[7892352+n].int<>1000 then w:=xovern(w,eqtb[7892352+n].int)*1000;
end;
if w>eqtb[9006743+n].int-mem[r+3].int then w:=eqtb[9006743+n].int-mem[r
+3].int;q:=vertbreak(mem[p+4].hh.lh,w,mem[p+2].int);
mem[r+3].int:=mem[r+3].int+bestheightplusdepth;
ifdef('STAT')if eqtb[7892297].int>0 then{1065:}begin begindiagnostic;
printnl(66437);printint(n);print(66438);printscaled(w);printchar(44);
printscaled(bestheightplusdepth);print(66365);
if q=-268435455 then printint(-10000)else if mem[q].hh.b0=12 then
printint(mem[q+1].int)else printchar(48);enddiagnostic(false);end{:1065}
;endif('STAT')if eqtb[7892352+n].int<>1000 then bestheightplusdepth:=
xovern(bestheightplusdepth,1000)*eqtb[7892352+n].int;
pagesofar[0]:=pagesofar[0]-bestheightplusdepth;mem[r].hh.b0:=1;
mem[r+1].hh.rh:=q;mem[r+1].hh.lh:=p;
if q=-268435455 then insertpenalties:=insertpenalties-10000 else if mem[
q].hh.b0=12 then insertpenalties:=insertpenalties+mem[q+1].int;
end{:1064};end;goto 80;end{:1062};others:confusion(66429)end{:1054};
{1059:}if pi<10000 then begin{1061:}
if pagesofar[1]<pagesofar[0]then if(pagesofar[3]<>0)or(pagesofar[4]<>0)
or(pagesofar[5]<>0)then b:=0 else b:=badness(pagesofar[0]-pagesofar[1],
pagesofar[2])else if pagesofar[1]-pagesofar[0]>pagesofar[6]then b:=
1073741823 else b:=badness(pagesofar[1]-pagesofar[0],pagesofar[6]){:1061
};
if b<1073741823 then if pi<=-10000 then c:=pi else if b<10000 then c:=b+
pi+insertpenalties else c:=100000 else c:=b;
if insertpenalties>=10000 then c:=1073741823;
ifdef('STAT')if eqtb[7892297].int>0 then{1060:}begin begindiagnostic;
printnl(37);print(66361);printtotals;print(66432);
printscaled(pagesofar[0]);print(66364);
if b=1073741823 then printchar(42)else printint(b);print(66365);
printint(pi);print(66433);
if c=1073741823 then printchar(42)else printint(c);
if c<=leastpagecost then printchar(35);enddiagnostic(false);end{:1060};
endif('STAT')if c<=leastpagecost then begin bestpagebreak:=p;
bestsize:=pagesofar[0];leastpagecost:=c;r:=mem[memtop].hh.rh;
while r<>memtop do begin mem[r+2].hh.lh:=mem[r+2].hh.rh;r:=mem[r].hh.rh;
end;end;if(c=1073741823)or(pi<=-10000)then begin fireup(p);
if outputactive then goto 10;goto 30;end;end{:1059};
if(mem[p].hh.b0<10)or(mem[p].hh.b0>11)then goto 80;90:{1058:}
if mem[p].hh.b0=11 then q:=p else begin q:=mem[p+1].hh.lh;
pagesofar[2+mem[q].hh.b0]:=pagesofar[2+mem[q].hh.b0]+mem[q+2].int;
pagesofar[6]:=pagesofar[6]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65544);
print(66430);end;begin helpptr:=4;helpline[3]:=66431;helpline[2]:=66399;
helpline[1]:=66400;helpline[0]:=66350;end;error;r:=newspec(q);
mem[r].hh.b1:=0;deleteglueref(q);mem[p+1].hh.lh:=r;q:=r;end;end;
pagesofar[1]:=pagesofar[1]+pagesofar[7]+mem[q+1].int;
pagesofar[7]:=0{:1058};80:{1057:}
if pagesofar[7]>pagemaxdepth then begin pagesofar[1]:=pagesofar[1]+
pagesofar[7]-pagemaxdepth;pagesofar[7]:=pagemaxdepth;end;{:1057};{1052:}
mem[pagetail].hh.rh:=p;pagetail:=p;mem[memtop-1].hh.rh:=mem[p].hh.rh;
mem[p].hh.rh:=-268435455;goto 30{:1052};31:{1053:}
mem[memtop-1].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=-268435455;
if eqtb[7892332].int>0 then begin if discptr[2]=-268435455 then discptr[
2]:=p else mem[discptr[1]].hh.rh:=p;discptr[1]:=p;
end else flushnodelist(p){:1053};30:{:1051};
until mem[memtop-1].hh.rh=-268435455;{1049:}
if nestptr=0 then curlist.tailfield:=memtop-1 else nest[0].tailfield:=
memtop-1{:1049};10:end;{:1048}{1084:}{1097:}procedure appspace;
var q:halfword;
begin if(curlist.auxfield.hh.lh>=2000)and(eqtb[1205777].hh.rh<>membot)
then q:=newparamglue(13)else begin if eqtb[1205776].hh.rh<>membot then
mainp:=eqtb[1205776].hh.rh else{1096:}
begin mainp:=fontglue[eqtb[1206823].hh.rh];
if mainp=-268435455 then begin mainp:=newspec(membot);
maink:=parambase[eqtb[1206823].hh.rh]+2;
mem[mainp+1].int:=fontinfo[maink].int;
mem[mainp+2].int:=fontinfo[maink+1].int;
mem[mainp+3].int:=fontinfo[maink+2].int;
fontglue[eqtb[1206823].hh.rh]:=mainp;end;end{:1096};
mainp:=newspec(mainp);{1098:}
if curlist.auxfield.hh.lh>=2000 then mem[mainp+1].int:=mem[mainp+1].int+
fontinfo[7+parambase[eqtb[1206823].hh.rh]].int;
mem[mainp+2].int:=xnoverd(mem[mainp+2].int,curlist.auxfield.hh.lh,1000);
mem[mainp+3].int:=xnoverd(mem[mainp+3].int,1000,curlist.auxfield.hh.lh){
:1098};q:=newglue(mainp);mem[mainp].hh.rh:=-268435455;end;
mem[curlist.tailfield].hh.rh:=q;curlist.tailfield:=q;end;{:1097}{1101:}
procedure insertdollarsign;begin backinput;curtok:=6291492;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66452);end;begin helpptr:=2;helpline[1]:=66453;helpline[0]:=66454;
end;inserror;end;{:1101}{1103:}procedure youcant;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66034);end;printcmdchr(curcmd,curchr);
printinmode(curlist.modefield);end;{:1103}{1104:}
procedure reportillegalcase;begin youcant;begin helpptr:=4;
helpline[3]:=66455;helpline[2]:=66456;helpline[1]:=66457;
helpline[0]:=66458;end;error;end;{:1104}{1105:}
function privileged:boolean;
begin if curlist.modefield>0 then privileged:=true else begin
reportillegalcase;privileged:=false;end;end;{:1105}{1108:}
function itsallover:boolean;label 10;
begin if privileged then begin if(memtop-2=pagetail)and(curlist.
headfield=curlist.tailfield)and(deadcycles=0)then begin itsallover:=true
;goto 10;end;backinput;begin mem[curlist.tailfield].hh.rh:=newnullbox;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield+1].int:=eqtb[9006723].int;
begin mem[curlist.tailfield].hh.rh:=newglue(membot+8);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newpenalty(-1073741824);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;buildpage;end;
itsallover:=false;10:end;{:1108}{1114:}procedure appendglue;
var s:smallnumber;begin s:=curchr;case s of 0:curval:=membot+4;
1:curval:=membot+8;2:curval:=membot+12;3:curval:=membot+16;
4:scanglue(2);5:scanglue(3);end;
begin mem[curlist.tailfield].hh.rh:=newglue(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if s>=4 then begin decr(mem[curval].hh.rh);
if s>4 then mem[curlist.tailfield].hh.b1:=99;end;end;{:1114}{1115:}
procedure appendkern;var s:quarterword;begin s:=curchr;
scandimen(s=99,false,false);
begin mem[curlist.tailfield].hh.rh:=newkern(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=s;end;{:1115}{1118:}procedure offsave;
var p:halfword;begin if curgroup=0 then{1120:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66168);end;printcmdchr(curcmd,curchr);begin helpptr:=1;
helpline[0]:=66476;end;error;end{:1120}else begin backinput;p:=getavail;
mem[memtop-3].hh.rh:=p;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65958);end;{1119:}
case curgroup of 14:begin mem[p].hh.lh:=34749083;printesc(65831);end;
15:begin mem[p].hh.lh:=6291492;printchar(36);end;
16:begin mem[p].hh.lh:=34749084;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
mem[p].hh.lh:=25165870;printesc(66475);end;
others:begin mem[p].hh.lh:=4194429;printchar(125);end end{:1119};
print(65959);begintokenlist(mem[memtop-3].hh.rh,5);begin helpptr:=5;
helpline[4]:=66470;helpline[3]:=66471;helpline[2]:=66472;
helpline[1]:=66473;helpline[0]:=66474;end;error;end;end;{:1118}{1123:}
procedure extrarightbrace;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66481);end;case curgroup of 14:printesc(65831);15:printchar(36);
16:printesc(66287);end;begin helpptr:=5;helpline[4]:=66482;
helpline[3]:=66483;helpline[2]:=66484;helpline[1]:=66485;
helpline[0]:=66486;end;error;incr(alignstate);end;{:1123}{1124:}
procedure normalparagraph;
begin if eqtb[7892283].int<>0 then eqworddefine(7892283,0);
if eqtb[9006737].int<>0 then eqworddefine(9006737,0);
if eqtb[7892305].int<>1 then eqworddefine(7892305,1);
if eqtb[1206295].hh.rh<>-268435455 then eqdefine(1206295,121,-268435455)
;
if eqtb[1206563].hh.rh<>-268435455 then eqdefine(1206563,121,-268435455)
;end;{:1124}{1129:}procedure boxend(boxcontext:integer);var p:halfword;
a:smallnumber;begin if boxcontext<1073741824 then{1130:}
begin if curbox<>-268435455 then begin mem[curbox+4].int:=boxcontext;
if abs(curlist.modefield)=1 then begin if preadjusttail<>-268435455 then
begin if memtop-14<>preadjusttail then begin mem[curlist.tailfield].hh.
rh:=mem[memtop-14].hh.rh;curlist.tailfield:=preadjusttail;end;
preadjusttail:=-268435455;end;appendtovlist(curbox);
if adjusttail<>-268435455 then begin if memtop-5<>adjusttail then begin
mem[curlist.tailfield].hh.rh:=mem[memtop-5].hh.rh;
curlist.tailfield:=adjusttail;end;adjusttail:=-268435455;end;
if curlist.modefield>0 then buildpage;
end else begin if abs(curlist.modefield)=105 then curlist.auxfield.hh.lh
:=1000 else begin p:=newnoad;mem[p+1].hh.rh:=2;mem[p+1].hh.lh:=curbox;
curbox:=p;end;mem[curlist.tailfield].hh.rh:=curbox;
curlist.tailfield:=curbox;end;end;end{:1130}
else if boxcontext<1073807360 then{1131:}
begin if boxcontext<1073774592 then begin curval:=boxcontext-1073741824;
a:=0;end else begin curval:=boxcontext-1073774592;a:=4;end;
if curval<256 then if(a>=4)then geqdefine(1206567+curval,122,curbox)else
eqdefine(1206567+curval,122,curbox)else begin findsaelement(4,curval,
true);if(a>=4)then gsadef(curptr,curbox)else sadef(curptr,curbox);end;
end{:1131}
else if curbox<>-268435455 then if boxcontext>1073807360 then{1132:}
begin{438:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:438};
if((curcmd=26)and(abs(curlist.modefield)<>1))or((curcmd=27)and(abs(
curlist.modefield)=1))then begin appendglue;
mem[curlist.tailfield].hh.b1:=boxcontext-(1073807261);
mem[curlist.tailfield+1].hh.rh:=curbox;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66499);end;begin helpptr:=3;helpline[2]:=66500;helpline[1]:=66501;
helpline[0]:=66502;end;backerror;flushnodelist(curbox);end;end{:1132}
else shipout(curbox);end;{:1129}{1133:}
procedure beginbox(boxcontext:integer);label 10,30;var p,q:halfword;
r:halfword;fm:boolean;tx:halfword;m:quarterword;k:halfword;n:halfword;
begin case curchr of 0:begin scanregisternum;
if curval<256 then curbox:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then curbox:=-268435455 else curbox:=mem[curptr+1].
hh.rh;end;
if curval<256 then eqtb[1206567+curval].hh.rh:=-268435455 else begin
findsaelement(4,curval,false);
if curptr<>-268435455 then begin mem[curptr+1].hh.rh:=-268435455;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;end;
1:begin scanregisternum;
if curval<256 then q:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then q:=-268435455 else q:=mem[curptr+1].hh.rh;end;
curbox:=copynodelist(q);end;2:{1134:}begin curbox:=-268435455;
if abs(curlist.modefield)=209 then begin youcant;begin helpptr:=1;
helpline[0]:=66504;end;error;
end else if(curlist.modefield=1)and(curlist.headfield=curlist.tailfield)
then begin youcant;begin helpptr:=2;helpline[1]:=66505;
helpline[0]:=66506;end;error;end else begin tx:=curlist.tailfield;
if not(tx>=himemmin)then if(mem[tx].hh.b0=9)and(mem[tx].hh.b1=3)then
begin r:=curlist.headfield;repeat q:=r;r:=mem[q].hh.rh;until r=tx;tx:=q;
end;
if not(tx>=himemmin)then if(mem[tx].hh.b0=0)or(mem[tx].hh.b0=1)then{1135
:}begin q:=curlist.headfield;p:=-268435455;repeat r:=p;p:=q;fm:=false;
if not(q>=himemmin)then if mem[q].hh.b0=7 then begin for m:=1 to mem[q].
hh.b1 do p:=mem[p].hh.rh;if p=tx then goto 30;
end else if(mem[q].hh.b0=9)and(mem[q].hh.b1=2)then fm:=true;
q:=mem[p].hh.rh;until q=tx;q:=mem[tx].hh.rh;mem[p].hh.rh:=q;
mem[tx].hh.rh:=-268435455;
if q=-268435455 then if fm then confusion(66503)else curlist.tailfield:=
p else if fm then begin curlist.tailfield:=r;mem[r].hh.rh:=-268435455;
flushnodelist(p);end;curbox:=tx;mem[curbox+4].int:=0;end{:1135};30:end;
end{:1134};3:{1136:}begin scanregisternum;n:=curval;
if not scankeyword(66251)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66507);end;begin helpptr:=2;helpline[1]:=66508;helpline[0]:=66509;
end;error;end;scandimen(false,false,false);curbox:=vsplit(n,curval);
end{:1136};others:{1137:}begin k:=curchr-4;
savestack[saveptr+0].int:=boxcontext;
if k=105 then if(boxcontext<1073741824)and(abs(curlist.modefield)=1)then
scanspec(3,true)else scanspec(2,true)else begin if k=1 then scanspec(4,
true)else begin scanspec(5,true);k:=1;end;normalparagraph;end;pushnest;
curlist.modefield:=-k;if k=1 then begin curlist.auxfield.int:=-65536000;
if eqtb[1206301].hh.rh<>-268435455 then begintokenlist(eqtb[1206301].hh.
rh,12);end else begin curlist.auxfield.hh.lh:=1000;
if eqtb[1206300].hh.rh<>-268435455 then begintokenlist(eqtb[1206300].hh.
rh,11);end;goto 10;end{:1137}end;boxend(boxcontext);10:end;{:1133}
{1138:}procedure scanbox(boxcontext:integer);begin{438:}
repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:438};
if curcmd=20 then beginbox(boxcontext)else if(boxcontext>=1073807361)and
((curcmd=36)or(curcmd=35))then begin curbox:=scanrulespec;
boxend(boxcontext);end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66510);end;begin helpptr:=3;helpline[2]:=66511;helpline[1]:=66512;
helpline[0]:=66513;end;backerror;end;end;{:1138}{1140:}
procedure package(c:smallnumber);var h:scaled;p:halfword;d:scaled;
u,v:integer;begin d:=eqtb[9006727].int;u:=eqtb[7892341].int;unsave;
saveptr:=saveptr-3;v:=eqtb[7892341].int;eqtb[7892341].int:=u;
if curlist.modefield=-105 then curbox:=hpack(mem[curlist.headfield].hh.
rh,savestack[saveptr+2].int,savestack[saveptr+1].int)else begin curbox:=
vpackage(mem[curlist.headfield].hh.rh,savestack[saveptr+2].int,savestack
[saveptr+1].int,d);if c=4 then{1141:}begin h:=0;p:=mem[curbox+5].hh.rh;
if p<>-268435455 then if mem[p].hh.b0<=2 then h:=mem[p+3].int;
mem[curbox+2].int:=mem[curbox+2].int-h+mem[curbox+3].int;
mem[curbox+3].int:=h;end{:1141};end;eqtb[7892341].int:=v;popnest;
boxend(savestack[saveptr+0].int);end;{:1140}{1145:}
function normmin(h:integer):smallnumber;
begin if h<=0 then normmin:=1 else if h>=63 then normmin:=63 else
normmin:=h;end;procedure newgraf(indented:boolean);
begin curlist.pgfield:=0;
if(curlist.modefield=1)or(curlist.headfield<>curlist.tailfield)then
begin mem[curlist.tailfield].hh.rh:=newparamglue(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;pushnest;
curlist.modefield:=105;curlist.auxfield.hh.lh:=1000;
if eqtb[7892314].int<=0 then curlang:=0 else if eqtb[7892314].int>255
then curlang:=0 else curlang:=eqtb[7892314].int;
curlist.auxfield.hh.rh:=curlang;
curlist.pgfield:=(normmin(eqtb[7892315].int)*64+normmin(eqtb[7892316].
int))*65536+curlang;
if indented then begin curlist.tailfield:=newnullbox;
mem[curlist.headfield].hh.rh:=curlist.tailfield;
mem[curlist.tailfield+1].int:=eqtb[9006720].int;
if(insertsrcspecialeverypar)then insertsrcspecial;end;
if eqtb[1206297].hh.rh<>-268435455 then begintokenlist(eqtb[1206297].hh.
rh,8);if nestptr=1 then buildpage;end;{:1145}{1147:}
procedure indentinhmode;var p,q:halfword;
begin if curchr>0 then begin p:=newnullbox;
mem[p+1].int:=eqtb[9006720].int;
if abs(curlist.modefield)=105 then curlist.auxfield.hh.lh:=1000 else
begin q:=newnoad;mem[q+1].hh.rh:=2;mem[q+1].hh.lh:=p;p:=q;end;
begin mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;{:1147}
{1149:}procedure headforvmode;
begin if curlist.modefield<0 then if curcmd<>36 then offsave else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66034);end;printesc(65836);print(66516);begin helpptr:=2;
helpline[1]:=66517;helpline[0]:=66518;end;error;
end else begin backinput;curtok:=partoken;backinput;
curinput.indexfield:=5;end;end;{:1149}{1150:}procedure endgraf;
begin if curlist.modefield=105 then begin if curlist.headfield=curlist.
tailfield then popnest else linebreak(false);
if curlist.eTeXauxfield<>-268435455 then begin flushlist(curlist.
eTeXauxfield);curlist.eTeXauxfield:=-268435455;end;normalparagraph;
errorcount:=0;end;end;{:1150}{1153:}procedure begininsertoradjust;
begin if curcmd=38 then curval:=255 else begin scaneightbitint;
if curval=255 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66519);end;printesc(65618);printint(255);begin helpptr:=1;
helpline[0]:=66520;end;error;curval:=0;end;end;
savestack[saveptr+0].int:=curval;
if(curcmd=38)and scankeyword(66521)then savestack[saveptr+1].int:=1 else
savestack[saveptr+1].int:=0;saveptr:=saveptr+2;newsavelevel(11);
scanleftbrace;normalparagraph;pushnest;curlist.modefield:=-1;
curlist.auxfield.int:=-65536000;end;{:1153}{1155:}procedure makemark;
var p:halfword;c:halfword;
begin if curchr=0 then c:=0 else begin scanregisternum;c:=curval;end;
p:=scantoks(false,true);p:=getnode(2);mem[p+1].hh.lh:=c;mem[p].hh.b0:=4;
mem[p].hh.b1:=0;mem[p+1].hh.rh:=defref;mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=p;end;{:1155}{1157:}procedure appendpenalty;
begin scanint;begin mem[curlist.tailfield].hh.rh:=newpenalty(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if curlist.modefield=1 then buildpage;end;{:1157}{1159:}
procedure deletelast;label 10;var p,q:halfword;r:halfword;fm:boolean;
tx:halfword;m:quarterword;
begin if(curlist.modefield=1)and(curlist.tailfield=curlist.headfield)
then{1160:}
begin if(curchr<>10)or(lastglue<>1073741823)then begin youcant;
begin helpptr:=2;helpline[1]:=66505;helpline[0]:=66522;end;
if curchr=11 then helpline[0]:=(66523)else if curchr<>10 then helpline[0
]:=(66524);error;end;end{:1160}else begin tx:=curlist.tailfield;
if not(tx>=himemmin)then if(mem[tx].hh.b0=9)and(mem[tx].hh.b1=3)then
begin r:=curlist.headfield;repeat q:=r;r:=mem[q].hh.rh;until r=tx;tx:=q;
end;
if not(tx>=himemmin)then if mem[tx].hh.b0=curchr then begin q:=curlist.
headfield;p:=-268435455;repeat r:=p;p:=q;fm:=false;
if not(q>=himemmin)then if mem[q].hh.b0=7 then begin for m:=1 to mem[q].
hh.b1 do p:=mem[p].hh.rh;if p=tx then goto 10;
end else if(mem[q].hh.b0=9)and(mem[q].hh.b1=2)then fm:=true;
q:=mem[p].hh.rh;until q=tx;q:=mem[tx].hh.rh;mem[p].hh.rh:=q;
mem[tx].hh.rh:=-268435455;
if q=-268435455 then if fm then confusion(66503)else curlist.tailfield:=
p else if fm then begin curlist.tailfield:=r;mem[r].hh.rh:=-268435455;
flushnodelist(p);end;flushnodelist(tx);end;end;10:end;{:1159}{1164:}
procedure unpackage;label 30,10;var p:halfword;r:halfword;c:0..1;
begin if curchr>1 then{1674:}
begin mem[curlist.tailfield].hh.rh:=discptr[curchr];
discptr[curchr]:=-268435455;goto 30;end{:1674};c:=curchr;
scanregisternum;
if curval<256 then p:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
if p=-268435455 then goto 10;
if(abs(curlist.modefield)=209)or((abs(curlist.modefield)=1)and(mem[p].hh
.b0<>1))or((abs(curlist.modefield)=105)and(mem[p].hh.b0<>0))then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66532);end;begin helpptr:=3;helpline[2]:=66533;helpline[1]:=66534;
helpline[0]:=66535;end;error;goto 10;end;
if c=1 then mem[curlist.tailfield].hh.rh:=copynodelist(mem[p+5].hh.rh)
else begin mem[curlist.tailfield].hh.rh:=mem[p+5].hh.rh;
if curval<256 then eqtb[1206567+curval].hh.rh:=-268435455 else begin
findsaelement(4,curval,false);
if curptr<>-268435455 then begin mem[curptr+1].hh.rh:=-268435455;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;freenode(p,8);end;
30:while mem[curlist.tailfield].hh.rh<>-268435455 do begin r:=mem[
curlist.tailfield].hh.rh;
if not(r>=himemmin)and(mem[r].hh.b0=40)then begin mem[curlist.tailfield]
.hh.rh:=mem[r].hh.rh;freenode(r,3);end;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;10:end;{:1164}
{1167:}procedure appenditaliccorrection;label 10;var p:halfword;
f:internalfontnumber;
begin if curlist.tailfield<>curlist.headfield then begin if(curlist.
tailfield>=himemmin)then p:=curlist.tailfield else if mem[curlist.
tailfield].hh.b0=6 then p:=curlist.tailfield+1 else if(mem[curlist.
tailfield].hh.b0=8)then begin if((mem[curlist.tailfield].hh.b1>=40)and(
mem[curlist.tailfield].hh.b1<=41))then begin begin mem[curlist.tailfield
].hh.rh:=newkern(getnativeitaliccorrection(curlist.tailfield));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=1;
end else if(mem[curlist.tailfield].hh.b1=42)then begin begin mem[curlist
.tailfield].hh.rh:=newkern(getnativeglyphitaliccorrection(curlist.
tailfield));curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=1;end;goto 10;end else goto 10;
f:=mem[p].hh.b0;
begin mem[curlist.tailfield].hh.rh:=newkern(fontinfo[italicbase[f]+(
fontinfo[charbase[f]+effectivechar(true,f,mem[p].hh.b1)].qqqq.b2)div 4].
int);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=1;end;10:end;{:1167}{1171:}
procedure appenddiscretionary;var c:integer;
begin begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if curchr=1 then begin c:=hyphenchar[eqtb[1206823].hh.rh];
if c>=0 then if c<=65535 then mem[curlist.tailfield+1].hh.lh:=
newcharacter(eqtb[1206823].hh.rh,c);end else begin incr(saveptr);
savestack[saveptr-1].int:=0;newsavelevel(10);scanleftbrace;pushnest;
curlist.modefield:=-105;curlist.auxfield.hh.lh:=1000;end;end;{:1171}
{1173:}procedure builddiscretionary;label 30,10;var p,q:halfword;
n:integer;begin unsave;{1175:}q:=curlist.headfield;p:=mem[q].hh.rh;n:=0;
while p<>-268435455 do begin if not(p>=himemmin)then if mem[p].hh.b0>2
then if mem[p].hh.b0<>11 then if mem[p].hh.b0<>6 then if(mem[p].hh.b0<>8
)or(not((mem[p].hh.b1>=40)and(mem[p].hh.b1<=41))and(mem[p].hh.b1<>42))
then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66542);end;begin helpptr:=1;helpline[0]:=66543;end;error;
begindiagnostic;printnl(66544);showbox(p);enddiagnostic(true);
flushnodelist(p);mem[q].hh.rh:=-268435455;goto 30;end;q:=p;
p:=mem[q].hh.rh;incr(n);end;30:{:1175};p:=mem[curlist.headfield].hh.rh;
popnest;
case savestack[saveptr-1].int of 0:mem[curlist.tailfield+1].hh.lh:=p;
1:mem[curlist.tailfield+1].hh.rh:=p;2:{1174:}
begin if(n>0)and(abs(curlist.modefield)=209)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66536);end;printesc(65639);begin helpptr:=2;helpline[1]:=66537;
helpline[0]:=66538;end;flushnodelist(p);n:=0;error;
end else mem[curlist.tailfield].hh.rh:=p;
if n<=65535 then mem[curlist.tailfield].hh.b1:=n else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66539);end;begin helpptr:=2;helpline[1]:=66540;helpline[0]:=66541;
end;error;end;if n>0 then curlist.tailfield:=q;decr(saveptr);goto 10;
end{:1174};end;incr(savestack[saveptr-1].int);newsavelevel(10);
scanleftbrace;pushnest;curlist.modefield:=-105;
curlist.auxfield.hh.lh:=1000;10:end;{:1173}{1177:}procedure makeaccent;
var s,t:real;p,q,r:halfword;f:internalfontnumber;
a,h,x,w,delta,lsb,rsb:scaled;i:fourquarters;begin scancharnum;
f:=eqtb[1206823].hh.rh;p:=newcharacter(f,curval);
if p<>-268435455 then begin x:=fontinfo[5+parambase[f]].int;
s:=fontinfo[1+parambase[f]].int/65536.0;
if((fontarea[f]=65535)or(fontarea[f]=65534))then begin a:=mem[p+1].int;
if a=0 then getnativecharsidebearings(f,curval,addressof(lsb),addressof(
rsb))end else a:=fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[p].hh.b1)].qqqq.b0].int;doassignments;{1178:}
q:=-268435455;f:=eqtb[1206823].hh.rh;
if(curcmd=11)or(curcmd=12)or(curcmd=68)then begin q:=newcharacter(f,
curchr);curval:=curchr end else if curcmd=16 then begin scancharnum;
q:=newcharacter(f,curval);end else backinput{:1178};
if q<>-268435455 then{1179:}
begin t:=fontinfo[1+parambase[f]].int/65536.0;
if((fontarea[f]=65535)or(fontarea[f]=65534))then begin w:=mem[q+1].int;
getnativecharheightdepth(f,curval,addressof(h),addressof(delta))end else
begin i:=fontinfo[charbase[f]+effectivechar(true,f,mem[q].hh.b1)].qqqq;
w:=fontinfo[widthbase[f]+i.b0].int;
h:=fontinfo[heightbase[f]+(i.b1)div 16].int end;
if h<>x then begin p:=hpack(p,0,1);mem[p+4].int:=x-h;end;
if((fontarea[f]=65535)or(fontarea[f]=65534))and(a=0)then delta:=round((w
-lsb+rsb)/2.0+h*t-x*s)else delta:=round((w-a)/2.0+h*t-x*s);
r:=newkern(delta);mem[r].hh.b1:=2;mem[curlist.tailfield].hh.rh:=r;
mem[r].hh.rh:=p;curlist.tailfield:=newkern(-a-delta);
mem[curlist.tailfield].hh.b1:=2;mem[p].hh.rh:=curlist.tailfield;p:=q;
end{:1179};mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
curlist.auxfield.hh.lh:=1000;end;end;{:1177}{1181:}procedure alignerror;
begin if abs(alignstate)>2 then{1182:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66549);end;printcmdchr(curcmd,curchr);
if curtok=8388646 then begin begin helpptr:=6;helpline[5]:=66550;
helpline[4]:=66551;helpline[3]:=66552;helpline[2]:=66553;
helpline[1]:=66554;helpline[0]:=66555;end;
end else begin begin helpptr:=5;helpline[4]:=66550;helpline[3]:=66556;
helpline[2]:=66553;helpline[1]:=66554;helpline[0]:=66555;end;end;error;
end{:1182}else begin backinput;
if alignstate<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65990);end;incr(alignstate);curtok:=2097275;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66545);end;decr(alignstate);curtok:=4194429;end;begin helpptr:=3;
helpline[2]:=66546;helpline[1]:=66547;helpline[0]:=66548;end;inserror;
end;end;{:1181}{1183:}procedure noalignerror;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66549);end;printesc(65848);begin helpptr:=2;helpline[1]:=66557;
helpline[0]:=66558;end;error;end;procedure omiterror;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66549);end;printesc(65851);begin helpptr:=2;helpline[1]:=66559;
helpline[0]:=66558;end;error;end;{:1183}{1185:}procedure doendv;
begin baseptr:=inputptr;inputstack[baseptr]:=curinput;
while(inputstack[baseptr].indexfield<>2)and(inputstack[baseptr].locfield
=-268435455)and(inputstack[baseptr].statefield=0)do decr(baseptr);
if(inputstack[baseptr].indexfield<>2)or(inputstack[baseptr].locfield<>
-268435455)or(inputstack[baseptr].statefield<>0)then fatalerror(65924);
if curgroup=6 then begin endgraf;if fincol then finrow;end else offsave;
end;{:1185}{1189:}procedure cserror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66168);end;printesc(65818);begin helpptr:=1;helpline[0]:=66561;
end;error;end;{:1189}{1190:}procedure pushmath(c:groupcode);
begin pushnest;curlist.modefield:=-209;curlist.auxfield.int:=-268435455;
newsavelevel(c);end;{:1190}{1192:}{1544:}
procedure justcopy(p,h,t:halfword);label 40,45;var r:halfword;
words:0..5;begin while p<>-268435455 do begin words:=1;
if(p>=himemmin)then r:=getavail else case mem[p].hh.b0 of 0,1:begin r:=
getnode(8);{1733:}mem[r+7].hh.lh:=mem[p+7].hh.lh;
mem[r+7].hh.rh:=mem[p+7].hh.rh;{:1733};mem[r+6]:=mem[p+6];
mem[r+5]:=mem[p+5];words:=5;mem[r+5].hh.rh:=-268435455;end;
2:begin r:=getnode(5);words:=5;end;6:begin r:=getavail;mem[r]:=mem[p+1];
goto 40;end;11,9:begin words:=3;r:=getnode(words);end;
10:begin r:=getnode(3);incr(mem[mem[p+1].hh.lh].hh.rh);{1735:}
mem[r+2].hh.lh:=mem[p+2].hh.lh;mem[r+2].hh.rh:=mem[p+2].hh.rh;{:1735};
mem[r+1].hh.lh:=mem[p+1].hh.lh;mem[r+1].hh.rh:=-268435455;end;8:{1417:}
case mem[p].hh.b1 of 0:begin r:=getnode(3);words:=3;end;
1,3,4:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
2,5:begin r:=getnode(2);words:=2;end;
40,41:begin words:=mem[p+4].qqqq.b0;r:=getnode(words);
while words>0 do begin decr(words);mem[r+words]:=mem[p+words];end;
mem[r+5].ptr:=nullptr;mem[r+4].qqqq.b3:=0;copynativeglyphinfo(p,r);end;
42:begin r:=getnode(5);words:=5;end;
43,44:begin words:=(9+(mem[p+4].hh.b0+sizeof(memoryword)-1)div sizeof(
memoryword));r:=getnode(words);end;23:r:=getnode(2);
others:confusion(66770)end{:1417};others:goto 45 end;
while words>0 do begin decr(words);mem[r+words]:=mem[p+words];end;
40:mem[h].hh.rh:=r;h:=r;45:p:=mem[p].hh.rh;end;mem[h].hh.rh:=t;end;
{:1544}{1549:}procedure justreverse(p:halfword);label 30;var l:halfword;
t:halfword;q:halfword;m,n:halfword;begin m:=-268435455;n:=-268435455;
if mem[memtop-3].hh.rh=-268435455 then begin justcopy(mem[p].hh.rh,
memtop-3,-268435455);q:=mem[memtop-3].hh.rh;
end else begin q:=mem[p].hh.rh;mem[p].hh.rh:=-268435455;
flushnodelist(mem[memtop-3].hh.rh);end;t:=newedge(curdir,0);l:=t;
curdir:=1-curdir;while q<>-268435455 do if(q>=himemmin)then repeat p:=q;
q:=mem[p].hh.rh;mem[p].hh.rh:=l;l:=p;
until not(q>=himemmin)else begin p:=q;q:=mem[p].hh.rh;
if mem[p].hh.b0=9 then{1550:}
if odd(mem[p].hh.b1)then if mem[LRptr].hh.lh<>(4*(mem[p].hh.b1 div 4)+3)
then begin mem[p].hh.b0:=11;incr(LRproblems);
end else begin begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if n>-268435455 then begin decr(n);decr(mem[p].hh.b1);
end else begin if m>-268435455 then decr(m)else begin mem[t+1].int:=mem[
p+1].int;mem[t].hh.rh:=q;freenode(p,3);goto 30;end;mem[p].hh.b0:=11;end;
end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(n>-268435455)or((mem[p].hh.b1 div 8)<>curdir)then begin incr(n);
incr(mem[p].hh.b1);end else begin mem[p].hh.b0:=11;incr(m);end;
end{:1550};mem[p].hh.rh:=l;l:=p;end;goto 30;mem[t+1].int:=mem[p+1].int;
mem[t].hh.rh:=q;freenode(p,2);30:mem[memtop-3].hh.rh:=l;end;{:1549}
procedure initmath;label 21,40,45,30;var w:scaled;j:halfword;x:integer;
l:scaled;s:scaled;p:halfword;q:halfword;f:internalfontnumber;n:integer;
v:scaled;d:scaled;begin gettoken;
if(curcmd=3)and(curlist.modefield>0)then{1199:}begin j:=-268435455;
w:=-1073741823;if curlist.headfield=curlist.tailfield then{1543:}
begin popnest;{1542:}
if curlist.eTeXauxfield=-268435455 then x:=0 else if mem[curlist.
eTeXauxfield].hh.lh>=8 then x:=-1 else x:=1{:1542};end{:1543}
else begin linebreak(true);{1200:}{1545:}if(eTeXmode=1)then{1551:}
begin if eqtb[1205772].hh.rh=membot then j:=newkern(0)else j:=
newparamglue(8);
if eqtb[1205771].hh.rh=membot then p:=newkern(0)else p:=newparamglue(7);
mem[p].hh.rh:=j;j:=newnullbox;mem[j+1].int:=mem[justbox+1].int;
mem[j+4].int:=mem[justbox+4].int;mem[j+5].hh.rh:=p;
mem[j+5].hh.b1:=mem[justbox+5].hh.b1;
mem[j+5].hh.b0:=mem[justbox+5].hh.b0;mem[j+6].gr:=mem[justbox+6].gr;
end{:1551};v:=mem[justbox+4].int;{1542:}
if curlist.eTeXauxfield=-268435455 then x:=0 else if mem[curlist.
eTeXauxfield].hh.lh>=8 then x:=-1 else x:=1{:1542};
if x>=0 then begin p:=mem[justbox+5].hh.rh;
mem[memtop-3].hh.rh:=-268435455;end else begin v:=-v-mem[justbox+1].int;
p:=newmath(0,6);mem[memtop-3].hh.rh:=p;
justcopy(mem[justbox+5].hh.rh,p,newmath(0,7));curdir:=1;end;
v:=v+2*fontinfo[6+parambase[eqtb[1206823].hh.rh]].int;
if(eqtb[7892339].int>0)then{1520:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1520}{:1545};while p<>-268435455 do begin{1201:}
21:if(p>=himemmin)then begin f:=mem[p].hh.b0;
d:=fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true,f,mem[p
].hh.b1)].qqqq.b0].int;goto 40;end;
case mem[p].hh.b0 of 0,1,2:begin d:=mem[p+1].int;goto 40;end;6:{692:}
begin mem[memtop-12]:=mem[p+1];mem[memtop-12].hh.rh:=mem[p].hh.rh;
p:=memtop-12;xtxligaturepresent:=true;goto 21;end{:692};
11:d:=mem[p+1].int;40:d:=mem[p+1].int;{1547:}9:begin d:=mem[p+1].int;
if(eqtb[7892339].int>0)then{1548:}
if odd(mem[p].hh.b1)then begin if mem[LRptr].hh.lh=(4*(mem[p].hh.b1 div
4)+3)then begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;
end else if mem[p].hh.b1>4 then begin w:=1073741823;goto 30;
end end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(mem[p].hh.b1 div 8)<>curdir then begin justreverse(p);p:=memtop-3;
end;end{:1548}else if mem[p].hh.b1>=4 then begin w:=1073741823;goto 30;
end;end;14:begin d:=mem[p+1].int;curdir:=mem[p].hh.b1;end;{:1547}
10:{1202:}begin q:=mem[p+1].hh.lh;d:=mem[q+1].int;
if mem[justbox+5].hh.b0=1 then begin if(mem[justbox+5].hh.b1=mem[q].hh.
b0)and(mem[q+2].int<>0)then v:=1073741823;
end else if mem[justbox+5].hh.b0=2 then begin if(mem[justbox+5].hh.b1=
mem[q].hh.b1)and(mem[q+3].int<>0)then v:=1073741823;end;
if mem[p].hh.b1>=100 then goto 40;end{:1202};8:{1421:}
if(((mem[p].hh.b1>=40)and(mem[p].hh.b1<=41)))or(mem[p].hh.b1=42)or(mem[p
].hh.b1=43)or(mem[p].hh.b1=44)then begin d:=mem[p+1].int;goto 40;
end else d:=0{:1421};others:d:=0 end{:1201};if v<1073741823 then v:=v+d;
goto 45;40:if v<1073741823 then begin v:=v+d;w:=v;
end else begin w:=1073741823;goto 30;end;45:p:=mem[p].hh.rh;end;
30:{1546:}
if(eqtb[7892339].int>0)then begin while LRptr<>-268435455 do begin
tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if LRproblems<>0 then begin w:=1073741823;LRproblems:=0;end;end;
curdir:=0;flushnodelist(mem[memtop-3].hh.rh){:1546}{:1200};end;{1203:}
if eqtb[1206295].hh.rh=-268435455 then if(eqtb[9006737].int<>0)and(((
eqtb[7892305].int>=0)and(curlist.pgfield+2>eqtb[7892305].int))or(curlist
.pgfield+1<-eqtb[7892305].int))then begin l:=eqtb[9006723].int-abs(eqtb[
9006737].int);
if eqtb[9006737].int>0 then s:=eqtb[9006737].int else s:=0;
end else begin l:=eqtb[9006723].int;s:=0;
end else begin n:=mem[eqtb[1206295].hh.rh].hh.lh;
if curlist.pgfield+2>=n then p:=eqtb[1206295].hh.rh+2*n else p:=eqtb[
1206295].hh.rh+2*(curlist.pgfield+2);s:=mem[p-1].int;l:=mem[p].int;
end{:1203};pushmath(15);curlist.modefield:=209;eqworddefine(7892308,-1);
eqworddefine(9006733,w);curlist.eTeXauxfield:=j;
if(eTeXmode=1)then eqworddefine(7892330,x);eqworddefine(9006734,l);
eqworddefine(9006735,s);
if eqtb[1206299].hh.rh<>-268435455 then begintokenlist(eqtb[1206299].hh.
rh,10);if nestptr=1 then buildpage;end{:1199}else begin backinput;
{1193:}begin pushmath(15);eqworddefine(7892308,-1);
if(insertsrcspecialeverymath)then insertsrcspecial;
if eqtb[1206298].hh.rh<>-268435455 then begintokenlist(eqtb[1206298].hh.
rh,9);end{:1193};end;end;{:1192}{1196:}procedure starteqno;
begin savestack[saveptr+0].int:=curchr;incr(saveptr);{1193:}
begin pushmath(15);eqworddefine(7892308,-1);
if(insertsrcspecialeverymath)then insertsrcspecial;
if eqtb[1206298].hh.rh<>-268435455 then begintokenlist(eqtb[1206298].hh.
rh,9);end{:1193};end;{:1196}{1205:}procedure scanmath(p:halfword);
label 20,21,10;var c:integer;begin 20:{438:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:438};
21:case curcmd of 11,12,68:begin c:=eqtb[5664040+curchr].hh.rh;
if mathcharfield(c)=2097151 then begin{1206:}begin curcs:=curchr+1;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;xtoken;backinput;
end{:1206};goto 20;end;end;16:begin scancharnum;curchr:=curval;
curcmd:=68;goto 21;end;17:if curchr=2 then begin scanmathclassint;
c:=setclassfield(curval);scanmathfamint;c:=c+setfamilyfield(curval);
scanusvnum;c:=c+curval;
end else if curchr=1 then begin scanxetexmathcharint;c:=curval;
end else begin scanfifteenbitint;
c:=setclassfield(curval div 4096)+setfamilyfield((curval mod 4096)div
256)+(curval mod 256);end;
69:begin c:=setclassfield(curchr div 4096)+setfamilyfield((curchr mod
4096)div 256)+(curchr mod 256);end;70:c:=curchr;
15:begin if curchr=1 then begin scanmathclassint;
c:=setclassfield(curval);scanmathfamint;c:=c+setfamilyfield(curval);
scanusvnum;c:=c+curval;end else begin scandelimiterint;
c:=curval div 4096;
c:=setclassfield(c div 4096)+setfamilyfield((c mod 4096)div 256)+(c mod
256);end;end;others:{1207:}begin backinput;scanleftbrace;
savestack[saveptr+0].int:=p;incr(saveptr);pushmath(9);goto 10;end{:1207}
end;mem[p].hh.rh:=1;mem[p].hh.b1:=c mod 65536;
if(mathclassfield(c)=7)and((eqtb[7892308].int>=0)and(eqtb[7892308].int<
256))then mem[p].hh.b0:=eqtb[7892308].int else mem[p].hh.b0:=(
mathfamfield(c));
mem[p].hh.b0:=mem[p].hh.b0+(mathcharfield(c)div 65536)*256;10:end;
{:1205}{1209:}procedure setmathchar(c:integer);var p:halfword;
ch:UnicodeScalar;begin if mathcharfield(c)=2097151 then{1206:}
begin curcs:=curchr+1;curcmd:=eqtb[curcs].hh.b0;
curchr:=eqtb[curcs].hh.rh;xtoken;backinput;end{:1206}
else begin p:=newnoad;mem[p+1].hh.rh:=1;ch:=mathcharfield(c);
mem[p+1].hh.b1:=ch mod 65536;mem[p+1].hh.b0:=mathfamfield(c);
if mathclassfield(c)=7 then begin if((eqtb[7892308].int>=0)and(eqtb[
7892308].int<256))then mem[p+1].hh.b0:=eqtb[7892308].int;
mem[p].hh.b0:=16;end else mem[p].hh.b0:=16+mathclassfield(c);
mem[p+1].hh.b0:=mem[p+1].hh.b0+(ch div 65536)*256;
mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;end;end;{:1209}
{1213:}procedure mathlimitswitch;label 10;
begin if curlist.headfield<>curlist.tailfield then if mem[curlist.
tailfield].hh.b0=17 then begin mem[curlist.tailfield].hh.b1:=curchr;
goto 10;end;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66565);end;begin helpptr:=1;helpline[0]:=66566;end;error;10:end;
{:1213}{1214:}procedure scandelimiter(p:halfword;r:boolean);
begin if r then begin if curchr=1 then begin curval1:=1073741824;
scanmathfamint;curval1:=curval1+curval*2097152;scanusvnum;
curval:=curval1+curval;end else scandelimiterint;end else begin{438:}
repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:438};
case curcmd of 11,12:begin curval:=eqtb[7892608+curchr].int;end;
15:if curchr=1 then begin curval1:=1073741824;scanmathclassint;
scanmathfamint;curval1:=curval1+curval*2097152;scanusvnum;
curval:=curval1+curval;end else scandelimiterint;
others:begin curval:=-1;end;end;end;if curval<0 then begin{1215:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66567);end;begin helpptr:=6;helpline[5]:=66568;helpline[4]:=66569;
helpline[3]:=66570;helpline[2]:=66571;helpline[1]:=66572;
helpline[0]:=66573;end;backerror;curval:=0;end{:1215};end;
if curval>=1073741824 then begin mem[p].qqqq.b0:=((curval mod 2097152)
div 65536)*256+(curval div 2097152)mod 256;
mem[p].qqqq.b1:=curval mod 65536;mem[p].qqqq.b2:=0;mem[p].qqqq.b3:=0;
end else begin mem[p].qqqq.b0:=(curval div 1048576)mod 16;
mem[p].qqqq.b1:=(curval div 4096)mod 256;
mem[p].qqqq.b2:=(curval div 256)mod 16;mem[p].qqqq.b3:=curval mod 256;
end;end;{:1214}{1217:}procedure mathradical;
begin begin mem[curlist.tailfield].hh.rh:=getnode(5);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=24;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].hh:=emptyfield;
mem[curlist.tailfield+3].hh:=emptyfield;
mem[curlist.tailfield+2].hh:=emptyfield;
scandelimiter(curlist.tailfield+4,true);scanmath(curlist.tailfield+1);
end;{:1217}{1219:}procedure mathac;var c:integer;
begin if curcmd=45 then{1220:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66576);end;printesc(65838);print(66577);begin helpptr:=2;
helpline[1]:=66578;helpline[0]:=66579;end;error;end{:1220};
begin mem[curlist.tailfield].hh.rh:=getnode(5);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=28;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].hh:=emptyfield;
mem[curlist.tailfield+3].hh:=emptyfield;
mem[curlist.tailfield+2].hh:=emptyfield;
mem[curlist.tailfield+4].hh.rh:=1;
if curchr=1 then begin if scankeyword(66574)then mem[curlist.tailfield].
hh.b1:=1 else if scankeyword(66575)then begin if scankeyword(66574)then
mem[curlist.tailfield].hh.b1:=3 else mem[curlist.tailfield].hh.b1:=2;
end;scanmathclassint;c:=setclassfield(curval);scanmathfamint;
c:=c+setfamilyfield(curval);scanusvnum;curval:=curval+c;
end else begin scanfifteenbitint;
curval:=setclassfield(curval div 4096)+setfamilyfield((curval mod 4096)
div 256)+(curval mod 256);end;
mem[curlist.tailfield+4].hh.b1:=curval mod 65536;
if(mathclassfield(curval)=7)and((eqtb[7892308].int>=0)and(eqtb[7892308].
int<256))then mem[curlist.tailfield+4].hh.b0:=eqtb[7892308].int else mem
[curlist.tailfield+4].hh.b0:=mathfamfield(curval);
mem[curlist.tailfield+4].hh.b0:=mem[curlist.tailfield+4].hh.b0+(
mathcharfield(curval)div 65536)*256;scanmath(curlist.tailfield+1);end;
{:1219}{1226:}procedure appendchoices;
begin begin mem[curlist.tailfield].hh.rh:=newchoice;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;incr(saveptr);
savestack[saveptr-1].int:=0;pushmath(13);scanleftbrace;end;{:1226}
{1228:}{1238:}function finmlist(p:halfword):halfword;var q:halfword;
begin if curlist.auxfield.int<>-268435455 then{1239:}
begin mem[curlist.auxfield.int+3].hh.rh:=3;
mem[curlist.auxfield.int+3].hh.lh:=mem[curlist.headfield].hh.rh;
if p=-268435455 then q:=curlist.auxfield.int else begin q:=mem[curlist.
auxfield.int+2].hh.lh;
if(mem[q].hh.b0<>30)or(curlist.eTeXauxfield=-268435455)then confusion(
66287);
mem[curlist.auxfield.int+2].hh.lh:=mem[curlist.eTeXauxfield].hh.rh;
mem[curlist.eTeXauxfield].hh.rh:=curlist.auxfield.int;
mem[curlist.auxfield.int].hh.rh:=p;end;end{:1239}
else begin mem[curlist.tailfield].hh.rh:=p;
q:=mem[curlist.headfield].hh.rh;end;popnest;finmlist:=q;end;{:1238}
procedure buildchoices;label 10;var p:halfword;begin unsave;
p:=finmlist(-268435455);
case savestack[saveptr-1].int of 0:mem[curlist.tailfield+1].hh.lh:=p;
1:mem[curlist.tailfield+1].hh.rh:=p;2:mem[curlist.tailfield+2].hh.lh:=p;
3:begin mem[curlist.tailfield+2].hh.rh:=p;decr(saveptr);goto 10;end;end;
incr(savestack[saveptr-1].int);pushmath(13);scanleftbrace;10:end;{:1228}
{1230:}procedure subsup;var t:smallnumber;p:halfword;begin t:=0;
p:=-268435455;
if curlist.tailfield<>curlist.headfield then if(mem[curlist.tailfield].
hh.b0>=16)and(mem[curlist.tailfield].hh.b0<30)then begin p:=curlist.
tailfield+2+curcmd-7;t:=mem[p].hh.rh;end;
if(p=-268435455)or(t<>0)then{1231:}
begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
p:=curlist.tailfield+2+curcmd-7;
if t<>0 then begin if curcmd=7 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66580);end;begin helpptr:=1;helpline[0]:=66581;end;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66582);end;begin helpptr:=1;helpline[0]:=66583;end;end;error;end;
end{:1231};scanmath(p);end;{:1230}{1235:}procedure mathfraction;
var c:smallnumber;begin c:=curchr;
if curlist.auxfield.int<>-268435455 then{1237:}
begin if c>=3 then begin scandelimiter(memtop-12,false);
scandelimiter(memtop-12,false);end;
if c mod 3=0 then scandimen(false,false,false);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66590);end;begin helpptr:=3;helpline[2]:=66591;helpline[1]:=66592;
helpline[0]:=66593;end;error;end{:1237}
else begin curlist.auxfield.int:=getnode(6);
mem[curlist.auxfield.int].hh.b0:=25;mem[curlist.auxfield.int].hh.b1:=0;
mem[curlist.auxfield.int+2].hh.rh:=3;
mem[curlist.auxfield.int+2].hh.lh:=mem[curlist.headfield].hh.rh;
mem[curlist.auxfield.int+3].hh:=emptyfield;
mem[curlist.auxfield.int+4].qqqq:=nulldelimiter;
mem[curlist.auxfield.int+5].qqqq:=nulldelimiter;
mem[curlist.headfield].hh.rh:=-268435455;
curlist.tailfield:=curlist.headfield;{1236:}
if c>=3 then begin scandelimiter(curlist.auxfield.int+4,false);
scandelimiter(curlist.auxfield.int+5,false);end;
case c mod 3 of 0:begin scandimen(false,false,false);
mem[curlist.auxfield.int+1].int:=curval;end;
1:mem[curlist.auxfield.int+1].int:=1073741824;
2:mem[curlist.auxfield.int+1].int:=0;end{:1236};end;end;{:1235}{1245:}
procedure mathleftright;var t:smallnumber;p:halfword;q:halfword;
begin t:=curchr;if(t<>30)and(curgroup<>16)then{1246:}
begin if curgroup=15 then begin scandelimiter(memtop-12,false);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66168);end;if t=1 then begin printesc(66288);begin helpptr:=1;
helpline[0]:=66594;end;end else begin printesc(66287);begin helpptr:=1;
helpline[0]:=66595;end;end;error;end else offsave;end{:1246}
else begin p:=newnoad;mem[p].hh.b0:=t;scandelimiter(p+1,false);
if t=1 then begin mem[p].hh.b0:=31;mem[p].hh.b1:=1;end;
if t=30 then q:=p else begin q:=finmlist(p);unsave;end;
if t<>31 then begin pushmath(16);mem[curlist.headfield].hh.rh:=q;
curlist.tailfield:=p;curlist.eTeXauxfield:=p;
end else begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=23;mem[curlist.tailfield+1].hh.rh:=3;
mem[curlist.tailfield+1].hh.lh:=q;end;end;end;{:1245}{1248:}{1555:}
procedure appdisplay(j,b:halfword;d:scaled);var z:scaled;s:scaled;
e:scaled;x:integer;p,q,r,t,u:halfword;begin s:=eqtb[9006735].int;
x:=eqtb[7892330].int;
if x=0 then mem[b+4].int:=s+d else begin z:=eqtb[9006734].int;p:=b;
{1556:}if x>0 then e:=z-d-mem[p+1].int else begin e:=d;
d:=z-e-mem[p+1].int;end;if j<>-268435455 then begin b:=copynodelist(j);
mem[b+3].int:=mem[p+3].int;mem[b+2].int:=mem[p+2].int;s:=s-mem[b+4].int;
d:=d+s;e:=e+mem[b+1].int-z-s;end;
if(mem[p].hh.b1)=2 then q:=p else begin r:=mem[p+5].hh.rh;freenode(p,8);
if r=-268435455 then confusion(66932);if x>0 then begin p:=r;
repeat q:=r;r:=mem[r].hh.rh;until r=-268435455;
end else begin p:=-268435455;q:=r;repeat t:=mem[r].hh.rh;
mem[r].hh.rh:=p;p:=r;r:=t;until r=-268435455;end;end{:1556};{1557:}
if j=-268435455 then begin r:=newkern(0);t:=newkern(0);
end else begin r:=mem[b+5].hh.rh;t:=mem[r].hh.rh;end;u:=newmath(0,3);
if mem[t].hh.b0=10 then begin j:=newskipparam(8);mem[q].hh.rh:=j;
mem[j].hh.rh:=u;j:=mem[t+1].hh.lh;mem[tempptr].hh.b0:=mem[j].hh.b0;
mem[tempptr].hh.b1:=mem[j].hh.b1;mem[tempptr+1].int:=e-mem[j+1].int;
mem[tempptr+2].int:=-mem[j+2].int;mem[tempptr+3].int:=-mem[j+3].int;
mem[u].hh.rh:=t;end else begin mem[t+1].int:=e;mem[t].hh.rh:=u;
mem[q].hh.rh:=t;end;u:=newmath(0,2);
if mem[r].hh.b0=10 then begin j:=newskipparam(7);mem[u].hh.rh:=j;
mem[j].hh.rh:=p;j:=mem[r+1].hh.lh;mem[tempptr].hh.b0:=mem[j].hh.b0;
mem[tempptr].hh.b1:=mem[j].hh.b1;mem[tempptr+1].int:=d-mem[j+1].int;
mem[tempptr+2].int:=-mem[j+2].int;mem[tempptr+3].int:=-mem[j+3].int;
mem[r].hh.rh:=u;end else begin mem[r+1].int:=d;mem[r].hh.rh:=p;
mem[u].hh.rh:=r;if j=-268435455 then begin b:=hpack(u,0,1);
mem[b+4].int:=s;end else mem[b+5].hh.rh:=u;end{:1557};end;
appendtovlist(b);end;{:1555}procedure aftermath;var l:boolean;
danger:boolean;m:integer;p:halfword;a:halfword;{1252:}b:halfword;
w:scaled;z:scaled;e:scaled;q:scaled;d:scaled;s:scaled;g1,g2:smallnumber;
r:halfword;t:halfword;pret:halfword;{:1252}{1552:}j:halfword;{:1552}
begin danger:=false;{1553:}
if curlist.modefield=209 then j:=curlist.eTeXauxfield{:1553};{1249:}
if((fontparams[eqtb[1206826].hh.rh]<22)and(not((fontarea[eqtb[1206826].
hh.rh]=65534)and(isOpenTypeMathFont(fontlayoutengine[eqtb[1206826].hh.rh
])))))or((fontparams[eqtb[1207082].hh.rh]<22)and(not((fontarea[eqtb[
1207082].hh.rh]=65534)and(isOpenTypeMathFont(fontlayoutengine[eqtb[
1207082].hh.rh])))))or((fontparams[eqtb[1207338].hh.rh]<22)and(not((
fontarea[eqtb[1207338].hh.rh]=65534)and(isOpenTypeMathFont(
fontlayoutengine[eqtb[1207338].hh.rh])))))then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66596);end;begin helpptr:=3;helpline[2]:=66597;helpline[1]:=66598;
helpline[0]:=66599;end;error;flushmath;danger:=true;
end else if((fontparams[eqtb[1206827].hh.rh]<13)and(not((fontarea[eqtb[
1206827].hh.rh]=65534)and(isOpenTypeMathFont(fontlayoutengine[eqtb[
1206827].hh.rh])))))or((fontparams[eqtb[1207083].hh.rh]<13)and(not((
fontarea[eqtb[1207083].hh.rh]=65534)and(isOpenTypeMathFont(
fontlayoutengine[eqtb[1207083].hh.rh])))))or((fontparams[eqtb[1207339].
hh.rh]<13)and(not((fontarea[eqtb[1207339].hh.rh]=65534)and(
isOpenTypeMathFont(fontlayoutengine[eqtb[1207339].hh.rh])))))then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66600);end;begin helpptr:=3;helpline[2]:=66601;helpline[1]:=66602;
helpline[0]:=66603;end;error;flushmath;danger:=true;end{:1249};
m:=curlist.modefield;l:=false;p:=finmlist(-268435455);
if curlist.modefield=-m then begin{1251:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66604);end;begin helpptr:=2;helpline[1]:=66605;helpline[0]:=66606;
end;backerror;end;end{:1251};curmlist:=p;curstyle:=2;
mlistpenalties:=false;mlisttohlist;a:=hpack(mem[memtop-3].hh.rh,0,1);
mem[a].hh.b1:=2;unsave;decr(saveptr);
if savestack[saveptr+0].int=1 then l:=true;danger:=false;{1553:}
if curlist.modefield=209 then j:=curlist.eTeXauxfield{:1553};{1249:}
if((fontparams[eqtb[1206826].hh.rh]<22)and(not((fontarea[eqtb[1206826].
hh.rh]=65534)and(isOpenTypeMathFont(fontlayoutengine[eqtb[1206826].hh.rh
])))))or((fontparams[eqtb[1207082].hh.rh]<22)and(not((fontarea[eqtb[
1207082].hh.rh]=65534)and(isOpenTypeMathFont(fontlayoutengine[eqtb[
1207082].hh.rh])))))or((fontparams[eqtb[1207338].hh.rh]<22)and(not((
fontarea[eqtb[1207338].hh.rh]=65534)and(isOpenTypeMathFont(
fontlayoutengine[eqtb[1207338].hh.rh])))))then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66596);end;begin helpptr:=3;helpline[2]:=66597;helpline[1]:=66598;
helpline[0]:=66599;end;error;flushmath;danger:=true;
end else if((fontparams[eqtb[1206827].hh.rh]<13)and(not((fontarea[eqtb[
1206827].hh.rh]=65534)and(isOpenTypeMathFont(fontlayoutengine[eqtb[
1206827].hh.rh])))))or((fontparams[eqtb[1207083].hh.rh]<13)and(not((
fontarea[eqtb[1207083].hh.rh]=65534)and(isOpenTypeMathFont(
fontlayoutengine[eqtb[1207083].hh.rh])))))or((fontparams[eqtb[1207339].
hh.rh]<13)and(not((fontarea[eqtb[1207339].hh.rh]=65534)and(
isOpenTypeMathFont(fontlayoutengine[eqtb[1207339].hh.rh])))))then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66600);end;begin helpptr:=3;helpline[2]:=66601;helpline[1]:=66602;
helpline[0]:=66603;end;error;flushmath;danger:=true;end{:1249};
m:=curlist.modefield;p:=finmlist(-268435455);end else a:=-268435455;
if m<0 then{1250:}
begin begin mem[curlist.tailfield].hh.rh:=newmath(eqtb[9006721].int,0);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;curmlist:=p;
curstyle:=2;mlistpenalties:=(curlist.modefield>0);mlisttohlist;
mem[curlist.tailfield].hh.rh:=mem[memtop-3].hh.rh;
while mem[curlist.tailfield].hh.rh<>-268435455 do curlist.tailfield:=mem
[curlist.tailfield].hh.rh;
begin mem[curlist.tailfield].hh.rh:=newmath(eqtb[9006721].int,1);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.auxfield.hh.lh:=1000;unsave;end{:1250}
else begin if a=-268435455 then{1251:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66604);end;begin helpptr:=2;helpline[1]:=66605;helpline[0]:=66606;
end;backerror;end;end{:1251};{1253:}curmlist:=p;curstyle:=0;
mlistpenalties:=false;mlisttohlist;p:=mem[memtop-3].hh.rh;
adjusttail:=memtop-5;preadjusttail:=memtop-14;b:=hpack(p,0,1);
p:=mem[b+5].hh.rh;t:=adjusttail;adjusttail:=-268435455;
pret:=preadjusttail;preadjusttail:=-268435455;w:=mem[b+1].int;
z:=eqtb[9006734].int;s:=eqtb[9006735].int;
if eqtb[7892330].int<0 then s:=-s-z;
if(a=-268435455)or danger then begin e:=0;q:=0;
end else begin e:=mem[a+1].int;q:=e+mathquad(0);end;if w+q>z then{1255:}
begin if(e<>0)and((w-totalshrink[0]+q<=z)or(totalshrink[1]<>0)or(
totalshrink[2]<>0)or(totalshrink[3]<>0))then begin freenode(b,8);
b:=hpack(p,z-q,0);end else begin e:=0;if w>z then begin freenode(b,8);
b:=hpack(p,z,0);end;end;w:=mem[b+1].int;end{:1255};{1256:}
mem[b].hh.b1:=2;d:=half(z-w);if(e>0)and(d<2*e)then begin d:=half(z-w-e);
if p<>-268435455 then if not(p>=himemmin)then if mem[p].hh.b0=10 then d
:=0;end{:1256};{1257:}
begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[7892275].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if(d+s<=eqtb[9006733].int)or l then begin g1:=3;g2:=4;
end else begin g1:=5;g2:=6;end;
if l and(e=0)then begin appdisplay(j,a,0);
begin mem[curlist.tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
end else begin mem[curlist.tailfield].hh.rh:=newparamglue(g1);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1257};{1258:}
if e<>0 then begin r:=newkern(z-w-e-d);if l then begin mem[a].hh.rh:=r;
mem[r].hh.rh:=b;b:=a;d:=0;end else begin mem[b].hh.rh:=r;
mem[r].hh.rh:=a;end;b:=hpack(b,0,1);end;appdisplay(j,b,d){:1258};{1259:}
if(a<>-268435455)and(e=0)and not l then begin begin mem[curlist.
tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
appdisplay(j,a,z-mem[a+1].int);g2:=0;end;
if t<>memtop-5 then begin mem[curlist.tailfield].hh.rh:=mem[memtop-5].hh
.rh;curlist.tailfield:=t;end;
if pret<>memtop-14 then begin mem[curlist.tailfield].hh.rh:=mem[memtop
-14].hh.rh;curlist.tailfield:=pret;end;
begin mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[7892276].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if g2>0 then begin mem[curlist.tailfield].hh.rh:=newparamglue(g2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1259};{1554:}
flushnodelist(j){:1554};resumeafterdisplay{:1253};end;end;{:1248}{1254:}
procedure resumeafterdisplay;
begin if curgroup<>15 then confusion(66607);unsave;
curlist.pgfield:=curlist.pgfield+3;pushnest;curlist.modefield:=105;
curlist.auxfield.hh.lh:=1000;
if eqtb[7892314].int<=0 then curlang:=0 else if eqtb[7892314].int>255
then curlang:=0 else curlang:=eqtb[7892314].int;
curlist.auxfield.hh.rh:=curlang;
curlist.pgfield:=(normmin(eqtb[7892315].int)*64+normmin(eqtb[7892316].
int))*65536+curlang;{477:}begin getxtoken;if curcmd<>10 then backinput;
end{:477};if nestptr=1 then buildpage;end;{:1254}{1265:}{1269:}
procedure getrtoken;label 20;begin 20:repeat gettoken;
until curtok<>20971552;
if(curcs=0)or(curcs>eqtbtop)or((curcs>1194650)and(curcs<=9006998))then
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66625);end;begin helpptr:=5;helpline[4]:=66626;helpline[3]:=66627;
helpline[2]:=66628;helpline[1]:=66629;helpline[0]:=66630;end;
if curcs=0 then backinput;curtok:=34749081;inserror;goto 20;end;end;
{:1269}{1283:}procedure trapzeroglue;
begin if(mem[curval+1].int=0)and(mem[curval+2].int=0)and(mem[curval+3].
int=0)then begin incr(mem[membot].hh.rh);deleteglueref(curval);
curval:=membot;end;end;{:1283}{1290:}
procedure doregistercommand(a:smallnumber);label 40,10;
var l,q,r,s:halfword;p:0..3;e:boolean;w:integer;begin q:=curcmd;
e:=false;{1291:}begin if q<>91 then begin getxtoken;
if(curcmd>=74)and(curcmd<=77)then begin l:=curchr;p:=curcmd-74;goto 40;
end;if curcmd<>91 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66034);end;printcmdchr(curcmd,curchr);print(66035);
printcmdchr(q,0);begin helpptr:=1;helpline[0]:=66666;end;error;goto 10;
end;end;if(curchr<membot)or(curchr>membot+19)then begin l:=curchr;
p:=(mem[l].hh.b0 div 64);e:=true;end else begin p:=curchr-membot;
scanregisternum;if curval>255 then begin findsaelement(p,curval,true);
l:=curptr;e:=true;end else case p of 0:l:=curval+7892352;
1:l:=curval+9006743;2:l:=curval+1205783;3:l:=curval+1206039;end;end;end;
40:if p<2 then if e then w:=mem[l+2].int else w:=eqtb[l].int else if e
then s:=mem[l+1].hh.rh else s:=eqtb[l].hh.rh{:1291};
if q=91 then scanoptionalequals else if scankeyword(66662)then;
aritherror:=false;if q<93 then{1292:}
if p<2 then begin if p=0 then scanint else scandimen(false,false,false);
if q=92 then curval:=curval+w;end else begin scanglue(p);
if q=92 then{1293:}begin q:=newspec(curval);r:=s;deleteglueref(curval);
mem[q+1].int:=mem[q+1].int+mem[r+1].int;
if mem[q+2].int=0 then mem[q].hh.b0:=0;
if mem[q].hh.b0=mem[r].hh.b0 then mem[q+2].int:=mem[q+2].int+mem[r+2].
int else if(mem[q].hh.b0<mem[r].hh.b0)and(mem[r+2].int<>0)then begin mem
[q+2].int:=mem[r+2].int;mem[q].hh.b0:=mem[r].hh.b0;end;
if mem[q+3].int=0 then mem[q].hh.b1:=0;
if mem[q].hh.b1=mem[r].hh.b1 then mem[q+3].int:=mem[q+3].int+mem[r+3].
int else if(mem[q].hh.b1<mem[r].hh.b1)and(mem[r+3].int<>0)then begin mem
[q+3].int:=mem[r+3].int;mem[q].hh.b1:=mem[r].hh.b1;end;curval:=q;
end{:1293};end{:1292}else{1294:}begin scanint;
if p<2 then if q=93 then if p=0 then curval:=multandadd(w,curval,0,
2147483647)else curval:=multandadd(w,curval,0,1073741823)else curval:=
xovern(w,curval)else begin r:=newspec(s);
if q=93 then begin mem[r+1].int:=multandadd(mem[s+1].int,curval,0,
1073741823);mem[r+2].int:=multandadd(mem[s+2].int,curval,0,1073741823);
mem[r+3].int:=multandadd(mem[s+3].int,curval,0,1073741823);
end else begin mem[r+1].int:=xovern(mem[s+1].int,curval);
mem[r+2].int:=xovern(mem[s+2].int,curval);
mem[r+3].int:=xovern(mem[s+3].int,curval);end;curval:=r;end;end{:1294};
if aritherror then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66663);end;begin helpptr:=2;helpline[1]:=66664;helpline[0]:=66665;
end;if p>=2 then deleteglueref(curval);error;goto 10;end;
if p<2 then if e then if(a>=4)then gsawdef(l,curval)else sawdef(l,curval
)else if(a>=4)then geqworddefine(l,curval)else eqworddefine(l,curval)
else begin trapzeroglue;
if e then if(a>=4)then gsadef(l,curval)else sadef(l,curval)else if(a>=4)
then geqdefine(l,120,curval)else eqdefine(l,120,curval);end;10:end;
{:1290}{1297:}procedure alteraux;var c:halfword;
begin if curchr<>abs(curlist.modefield)then reportillegalcase else begin
c:=curchr;scanoptionalequals;
if c=1 then begin scandimen(false,false,false);
curlist.auxfield.int:=curval;end else begin scanint;
if(curval<=0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66669);end;begin helpptr:=1;helpline[0]:=66670;end;
interror(curval);end else curlist.auxfield.hh.lh:=curval;end;end;end;
{:1297}{1298:}procedure alterprevgraf;var p:0..nestsize;
begin nest[nestptr]:=curlist;p:=nestptr;
while abs(nest[p].modefield)<>1 do decr(p);scanoptionalequals;scanint;
if curval<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66391);end;printesc(65854);begin helpptr:=1;helpline[0]:=66671;
end;interror(curval);end else begin nest[p].pgfield:=curval;
curlist:=nest[nestptr];end;end;{:1298}{1299:}procedure alterpagesofar;
var c:0..7;begin c:=curchr;scanoptionalequals;
scandimen(false,false,false);pagesofar[c]:=curval;end;{:1299}{1300:}
procedure alterinteger;var c:smallnumber;begin c:=curchr;
scanoptionalequals;scanint;if c=0 then deadcycles:=curval{1506:}
else if c=2 then begin if(curval<0)or(curval>3)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66907);end;begin helpptr:=2;helpline[1]:=66908;helpline[0]:=66909;
end;interror(curval);end else begin curchr:=curval;newinteraction;end;
end{:1506}else insertpenalties:=curval;end;{:1300}{1301:}
procedure alterboxdimen;var c:smallnumber;b:halfword;begin c:=curchr;
scanregisternum;
if curval<256 then b:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then b:=-268435455 else b:=mem[curptr+1].hh.rh;end;
scanoptionalequals;scandimen(false,false,false);
if b<>-268435455 then mem[b+c].int:=curval;end;{:1301}{1311:}
procedure newfont(a:smallnumber);label 50;var u:halfword;s:scaled;
f:internalfontnumber;t:strnumber;oldsetting:0..21;
begin if jobname=0 then openlogfile;getrtoken;u:=curcs;
if u>=1179650 then t:=hash[u].rh else if u>=1114113 then if u=1179649
then t:=66677 else t:=u-1114113 else begin oldsetting:=selector;
selector:=21;print(66677);print(u-1);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(65539,poolsize-initpoolptr);
end;t:=makestring;end;
if(a>=4)then geqdefine(u,89,0)else eqdefine(u,89,0);scanoptionalequals;
scanfilename;{1312:}nameinprogress:=true;
if scankeyword(66678)then{1313:}begin scandimen(false,false,false);
s:=curval;
if(s<=0)or(s>=134217728)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66680);end;printscaled(s);print(66681);begin helpptr:=2;
helpline[1]:=66682;helpline[0]:=66683;end;error;s:=10*65536;end;
end{:1313}else if scankeyword(66679)then begin scanint;s:=-curval;
if(curval<=0)or(curval>32768)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65880);end;begin helpptr:=1;helpline[0]:=65881;end;
interror(curval);s:=-1000;end;end else s:=-1000;
nameinprogress:=false{:1312};{1314:}
for f:=1 to fontptr do begin if streqstr(fontname[f],curname)and(((
curarea=65626)and((fontarea[f]=65535)or(fontarea[f]=65534)))or streqstr(
fontarea[f],curarea))then begin if s>0 then begin if s=fontsize[f]then
goto 50;end else begin aritherror:=false;
if fontsize[f]=xnoverd(fontdsize[f],-s,1000)then if not aritherror then
goto 50;end;end;appendstr(curarea);appendstr(curname);appendstr(curext);
if streqstr(fontname[f],makestring)then begin begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;
if((fontarea[f]=65535)or(fontarea[f]=65534))then begin if s>0 then begin
if s=fontsize[f]then goto 50;
end else if fontsize[f]=xnoverd(fontdsize[f],-s,1000)then goto 50;
end end else begin decr(strptr);poolptr:=strstart[(strptr)-65536];end;
end{:1314};f:=readfontinfo(u,curname,curarea,s);
50:if(a>=4)then geqdefine(u,89,f)else eqdefine(u,89,f);
eqtb[1196762+f]:=eqtb[u];hash[1196762+f].rh:=t;end;{:1311}{1319:}
procedure newinteraction;begin println;interaction:=curchr;
if interaction=0 then kpsemaketexdiscarderrors:=1 else
kpsemaketexdiscarderrors:=0;{79:}
if interaction=0 then selector:=16 else selector:=17{:79};
if logopened then selector:=selector+2;end;{:1319}
procedure prefixedcommand;label 30,10;var a:smallnumber;
f:internalfontnumber;j:halfword;k:fontindex;p,q:halfword;n:integer;
e:boolean;begin a:=0;
while curcmd=95 do begin if not odd(a div curchr)then a:=a+curchr;{438:}
repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:438};
if curcmd<=71 then{1266:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66617);end;printcmdchr(curcmd,curchr);printchar(39);
begin helpptr:=1;helpline[0]:=66618;end;
if(eTeXmode=1)then helpline[0]:=66619;backerror;goto 10;end{:1266};
if eqtb[7892300].int>2 then if(eTeXmode=1)then showcurcmdchr;end;{1267:}
if a>=8 then begin j:=29360129;a:=a-8;end else j:=0;
if(curcmd<>99)and((a mod 4<>0)or(j<>0))then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65544);
print(66034);end;printesc(66609);print(66620);printesc(66610);
begin helpptr:=1;helpline[0]:=66621;end;
if(eTeXmode=1)then begin helpline[0]:=66622;print(66620);
printesc(66623);end;print(66624);printcmdchr(curcmd,curchr);
printchar(39);error;end{:1267};{1268:}
if eqtb[7892307].int<>0 then if eqtb[7892307].int<0 then begin if(a>=4)
then a:=a-4;end else begin if not(a>=4)then a:=a+4;end{:1268};
case curcmd of{1271:}
89:if(a>=4)then geqdefine(1206823,123,curchr)else eqdefine(1206823,123,
curchr);{:1271}{1272:}
99:begin if odd(curchr)and not(a>=4)and(eqtb[7892307].int>=0)then a:=a+4
;e:=(curchr>=2);getrtoken;p:=curcs;q:=scantoks(true,e);
if j<>0 then begin q:=getavail;mem[q].hh.lh:=j;
mem[q].hh.rh:=mem[defref].hh.rh;mem[defref].hh.rh:=q;end;
if(a>=4)then geqdefine(p,114+(a mod 4),defref)else eqdefine(p,114+(a mod
4),defref);end;{:1272}{1275:}96:begin n:=curchr;getrtoken;p:=curcs;
if n=0 then begin repeat gettoken;until curcmd<>10;
if curtok=25165885 then begin gettoken;if curcmd=10 then gettoken;end;
end else begin gettoken;q:=curtok;gettoken;backinput;curtok:=q;
backinput;end;
if curcmd>=114 then incr(mem[curchr].hh.lh)else if(curcmd=91)or(curcmd=
72)then if(curchr<membot)or(curchr>membot+19)then incr(mem[curchr+1].hh.
lh);
if(a>=4)then geqdefine(p,curcmd,curchr)else eqdefine(p,curcmd,curchr);
end;{:1275}{1278:}97:if curchr=7 then begin scancharnum;
p:=6778152+curval;scanoptionalequals;scancharnum;n:=curval;scancharnum;
if(eqtb[7892321].int>0)then begin begindiagnostic;printnl(66646);
print(p-6778152);print(66647);print(n);printchar(32);print(curval);
enddiagnostic(false);end;n:=n*256+curval;
if(a>=4)then geqdefine(p,123,n)else eqdefine(p,123,n);
if(p-6778152)<eqtb[7892319].int then if(a>=4)then geqworddefine(7892319,
p-6778152)else eqworddefine(7892319,p-6778152);
if(p-6778152)>eqtb[7892320].int then if(a>=4)then geqworddefine(7892320,
p-6778152)else eqworddefine(7892320,p-6778152);end else begin n:=curchr;
getrtoken;p:=curcs;
if(a>=4)then geqdefine(p,0,1114112)else eqdefine(p,0,1114112);
scanoptionalequals;case n of 0:begin scanusvnum;
if(a>=4)then geqdefine(p,68,curval)else eqdefine(p,68,curval);end;
1:begin scanfifteenbitint;
if(a>=4)then geqdefine(p,69,curval)else eqdefine(p,69,curval);end;
8:begin scanxetexmathcharint;
if(a>=4)then geqdefine(p,70,curval)else eqdefine(p,70,curval);end;
9:begin scanmathclassint;n:=setclassfield(curval);scanmathfamint;
n:=n+setfamilyfield(curval);scanusvnum;n:=n+curval;
if(a>=4)then geqdefine(p,70,n)else eqdefine(p,70,n);end;
others:begin scanregisternum;if curval>255 then begin j:=n-2;
if j>3 then j:=5;findsaelement(j,curval,true);incr(mem[curptr+1].hh.lh);
if j=5 then j:=72 else j:=91;
if(a>=4)then geqdefine(p,j,curptr)else eqdefine(p,j,curptr);
end else case n of 2:if(a>=4)then geqdefine(p,74,7892352+curval)else
eqdefine(p,74,7892352+curval);
3:if(a>=4)then geqdefine(p,75,9006743+curval)else eqdefine(p,75,9006743+
curval);
4:if(a>=4)then geqdefine(p,76,1205783+curval)else eqdefine(p,76,1205783+
curval);
5:if(a>=4)then geqdefine(p,77,1206039+curval)else eqdefine(p,77,1206039+
curval);
6:if(a>=4)then geqdefine(p,73,1206307+curval)else eqdefine(p,73,1206307+
curval);end;end end;end;{:1278}{1279:}98:begin j:=curchr;scanint;
n:=curval;
if not scankeyword(66251)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66507);end;begin helpptr:=2;helpline[1]:=66648;helpline[0]:=66649;
end;error;end;getrtoken;p:=curcs;readtoks(n,p,j);
if(a>=4)then geqdefine(p,114,curval)else eqdefine(p,114,curval);end;
{:1279}{1280:}72,73:begin q:=curcs;e:=false;
if curcmd=72 then if curchr=membot then begin scanregisternum;
if curval>255 then begin findsaelement(5,curval,true);curchr:=curptr;
e:=true;end else curchr:=1206307+curval;
end else e:=true else if curchr=1206306 then begin
scancharclassnotignored;curptr:=curval;scancharclassnotignored;
findsaelement(6,curptr*4096+curval,true);curchr:=curptr;e:=true;end;
p:=curchr;scanoptionalequals;{438:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:438};if curcmd<>1 then{1281:}
if(curcmd=72)or(curcmd=73)then begin if curcmd=72 then if curchr=membot
then begin scanregisternum;
if curval<256 then q:=eqtb[1206307+curval].hh.rh else begin
findsaelement(5,curval,false);
if curptr=-268435455 then q:=-268435455 else q:=mem[curptr+1].hh.rh;end;
end else q:=mem[curchr+1].hh.rh else if curchr=1206306 then begin
scancharclassnotignored;curptr:=curval;scancharclassnotignored;
findsaelement(6,curptr*4096+curval,false);
if curptr=-268435455 then q:=-268435455 else q:=mem[curptr+1].hh.rh;
end else q:=eqtb[curchr].hh.rh;
if q=-268435455 then if e then if(a>=4)then gsadef(p,-268435455)else
sadef(p,-268435455)else if(a>=4)then geqdefine(p,104,-268435455)else
eqdefine(p,104,-268435455)else begin incr(mem[q].hh.lh);
if e then if(a>=4)then gsadef(p,q)else sadef(p,q)else if(a>=4)then
geqdefine(p,114,q)else eqdefine(p,114,q);end;goto 30;end{:1281};
backinput;curcs:=q;q:=scantoks(false,false);
if mem[defref].hh.rh=-268435455 then begin if e then if(a>=4)then gsadef
(p,-268435455)else sadef(p,-268435455)else if(a>=4)then geqdefine(p,104,
-268435455)else eqdefine(p,104,-268435455);
begin mem[defref].hh.rh:=avail;avail:=defref;ifdef('STAT')decr(dynused);
endif('STAT')end;
end else begin if(p=1206296)and not e then begin mem[q].hh.rh:=getavail;
q:=mem[q].hh.rh;mem[q].hh.lh:=4194429;q:=getavail;mem[q].hh.lh:=2097275;
mem[q].hh.rh:=mem[defref].hh.rh;mem[defref].hh.rh:=q;end;
if e then if(a>=4)then gsadef(p,defref)else sadef(p,defref)else if(a>=4)
then geqdefine(p,114,defref)else eqdefine(p,114,defref);end;end;{:1280}
{1282:}74:begin p:=curchr;scanoptionalequals;scanint;
if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);end;
75:begin p:=curchr;scanoptionalequals;scandimen(false,false,false);
if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);end;
76,77:begin p:=curchr;n:=curcmd;scanoptionalequals;
if n=77 then scanglue(3)else scanglue(2);trapzeroglue;
if(a>=4)then geqdefine(p,120,curval)else eqdefine(p,120,curval);end;
{:1282}{1286:}87:begin if curchr=4549928 then begin p:=curchr;
scanusvnum;p:=p+curval;n:=eqtb[4549928+curval].hh.rh mod 65536;
scanoptionalequals;scancharclass;
if(a>=4)then geqdefine(p,123,curval*65536+n)else eqdefine(p,123,curval
*65536+n);end else if curchr=5664040 then begin p:=curchr;scanusvnum;
p:=p+curval;scanoptionalequals;scanxetexmathcharint;
if(a>=4)then geqdefine(p,123,curval)else eqdefine(p,123,curval);
end else if curchr=5664041 then begin p:=curchr-1;scanusvnum;
p:=p+curval;scanoptionalequals;scanmathclassint;
n:=setclassfield(curval);scanmathfamint;n:=n+setfamilyfield(curval);
scanusvnum;n:=n+curval;
if(a>=4)then geqdefine(p,123,n)else eqdefine(p,123,n);
end else if curchr=7892608 then begin p:=curchr;scanusvnum;p:=p+curval;
scanoptionalequals;scanint;
if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);
end else begin p:=curchr-1;scanusvnum;p:=p+curval;scanoptionalequals;
n:=1073741824;scanmathfamint;n:=n+curval*2097152;scanusvnum;n:=n+curval;
if(a>=4)then geqworddefine(p,n)else eqworddefine(p,n);end;end;
86:begin{1287:}
if curchr=1207592 then n:=15 else if curchr=5664040 then n:=32768 else
if curchr=4549928 then n:=32767 else if curchr=7892608 then n:=16777215
else n:=1114111{:1287};p:=curchr;scanusvnum;p:=p+curval;
scanoptionalequals;scanint;
if((curval<0)and(p<7892608))or(curval>n)then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(65544);
print(66127);end;printint(curval);
if p<7892608 then print(66659)else print(66660);printint(n);
begin helpptr:=1;helpline[0]:=66661;end;error;curval:=0;end;
if p<5664040 then begin if p>=4549928 then begin n:=eqtb[p].hh.rh div
65536;
if(a>=4)then geqdefine(p,123,n*65536+curval)else eqdefine(p,123,n*65536+
curval);
end else if(a>=4)then geqdefine(p,123,curval)else eqdefine(p,123,curval)
end else if p<7892608 then begin if curval=32768 then curval:=2097151
else curval:=setclassfield(curval div 4096)+setfamilyfield((curval mod
4096)div 256)+(curval mod 256);
if(a>=4)then geqdefine(p,123,curval)else eqdefine(p,123,curval);
end else if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval)
;end;{:1286}{1288:}88:begin p:=curchr;scanmathfamint;p:=p+curval;
scanoptionalequals;scanfontident;
if(a>=4)then geqdefine(p,123,curval)else eqdefine(p,123,curval);end;
{:1288}{1289:}91,92,93,94:doregistercommand(a);{:1289}{1295:}
100:begin scanregisternum;
if(a>=4)then n:=1073774592+curval else n:=1073741824+curval;
scanoptionalequals;
if setboxallowed then scanbox(n)else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66029);end;printesc(65860);begin helpptr:=2;helpline[1]:=66667;
helpline[0]:=66668;end;error;end;end;{:1295}{1296:}80:alteraux;
81:alterprevgraf;82:alterpagesofar;83:alterinteger;84:alterboxdimen;
{:1296}{1302:}85:begin q:=curchr;scanoptionalequals;scanint;n:=curval;
if n<=0 then p:=-268435455 else if q>1206295 then begin n:=(curval div 2
)+1;p:=getnode(2*n+1);mem[p].hh.lh:=n;n:=curval;mem[p+1].int:=n;
for j:=p+2 to p+n+1 do begin scanint;mem[j].int:=curval;end;
if not odd(n)then mem[p+n+2].int:=0;end else begin p:=getnode(2*n+1);
mem[p].hh.lh:=n;for j:=1 to n do begin scandimen(false,false,false);
mem[p+2*j-1].int:=curval;scandimen(false,false,false);
mem[p+2*j].int:=curval;end;end;
if(a>=4)then geqdefine(q,121,p)else eqdefine(q,121,p);end;{:1302}{1306:}
101:if curchr=1 then begin ifdef('INITEX')if iniversion then begin
newpatterns;goto 30;end;endif('INITEX')begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66672);end;helpptr:=0;error;repeat gettoken;until curcmd=2;
goto 10;end else begin newhyphexceptions;goto 30;end;{:1306}{1307:}
78:begin findfontdimen(true);k:=curval;scanoptionalequals;
scandimen(false,false,false);fontinfo[k].int:=curval;end;
79:begin n:=curchr;scanfontident;f:=curval;
if n<2 then begin scanoptionalequals;scanint;
if n=0 then hyphenchar[f]:=curval else skewchar[f]:=curval;
end else begin if((fontarea[f]=65535)or(fontarea[f]=65534))then
scanglyphnumber(f)else scancharnum;p:=curval;scanoptionalequals;scanint;
case n of 2:setcpcode(f,p,0,curval);3:setcpcode(f,p,1,curval);end;end;
end;{:1307}{1310:}90:newfont(a);{:1310}{1318:}102:newinteraction;{:1318}
others:confusion(66616)end;30:{1323:}
if aftertoken<>0 then begin curtok:=aftertoken;backinput;aftertoken:=0;
end{:1323};10:end;{:1265}{1324:}procedure doassignments;label 10;
begin while true do begin{438:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:438};if curcmd<=71 then goto 10;
setboxallowed:=false;prefixedcommand;setboxallowed:=true;end;10:end;
{:1324}{1329:}procedure openorclosein;var c:0..1;n:0..15;k:0..maxint;
begin c:=curchr;scanfourbitint;n:=curval;
if readopen[n]<>2 then begin uclose(readfile[n]);readopen[n]:=2;end;
if c<>0 then begin scanoptionalequals;scanfilename;
packfilename(curname,curarea,curext);texinputtype:=0;
if kpseinnameok(stringcast(nameoffile+1))and uopenin(readfile[n],
kpsetexformat,eqtb[7892345].int,eqtb[7892346].int)then begin
makeutf16name;nameinprogress:=true;beginname;stopatspace:=false;k:=0;
while(k<namelength16)and(morename(nameoffile16[k]))do incr(k);
stopatspace:=true;endname;nameinprogress:=false;readopen[n]:=1;end;end;
end;{:1329}{1333:}procedure issuemessage;var oldsetting:0..21;c:0..1;
s:strnumber;begin c:=curchr;mem[memtop-12].hh.rh:=scantoks(false,true);
oldsetting:=selector;selector:=21;tokenshow(defref);
selector:=oldsetting;flushlist(defref);
begin if poolptr+1>poolsize then overflow(65539,poolsize-initpoolptr);
end;s:=makestring;if c=0 then{1334:}
begin if termoffset+length(s)>maxprintline-2 then println else if(
termoffset>0)or(fileoffset>0)then printchar(32);print(s);fflush(stdout);
end{:1334}else{1337:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65626);end;print(s);
if eqtb[1206304].hh.rh<>-268435455 then useerrhelp:=true else if
longhelpseen then begin helpptr:=1;helpline[0]:=66690;
end else begin if interaction<3 then longhelpseen:=true;
begin helpptr:=4;helpline[3]:=66691;helpline[2]:=66692;
helpline[1]:=66693;helpline[0]:=66694;end;end;error;useerrhelp:=false;
end{:1337};begin decr(strptr);poolptr:=strstart[(strptr)-65536];end;end;
{:1333}{1342:}procedure shiftcase;var b:halfword;p:halfword;t:halfword;
c:integer;begin b:=curchr;p:=scantoks(false,false);p:=mem[defref].hh.rh;
while p<>-268435455 do begin{1343:}t:=mem[p].hh.lh;
if t<34668544 then begin c:=t mod 2097152;
if eqtb[b+c].hh.rh<>0 then mem[p].hh.lh:=t-c+eqtb[b+c].hh.rh;end{:1343};
p:=mem[p].hh.rh;end;begintokenlist(mem[defref].hh.rh,3);
begin mem[defref].hh.rh:=avail;avail:=defref;ifdef('STAT')decr(dynused);
endif('STAT')end;end;{:1342}{1347:}procedure showwhatever;label 50;
var p:halfword;t:smallnumber;m:0..4;l:integer;n:integer;
begin case curchr of 3:begin{1739:}
if(eqtb[7892324].int>=0)and(eqtb[7892324].int<16)and writeopen[eqtb[
7892324].int]then selector:=eqtb[7892324].int;{:1739}begindiagnostic;
showactivities;end;1:{1350:}begin scanregisternum;
if curval<256 then p:=eqtb[1206567+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
{1739:}
if(eqtb[7892324].int>=0)and(eqtb[7892324].int<16)and writeopen[eqtb[
7892324].int]then selector:=eqtb[7892324].int;{:1739}begindiagnostic;
printnl(66710);printint(curval);printchar(61);
if p=-268435455 then print(65710)else showbox(p);end{:1350};0:{1348:}
begin gettoken;{1739:}
if(eqtb[7892324].int>=0)and(eqtb[7892324].int<16)and writeopen[eqtb[
7892324].int]then selector:=eqtb[7892324].int;{:1739}
if interaction=3 then;printnl(66706);
if curcs<>0 then begin sprintcs(curcs);printchar(61);end;printmeaning;
goto 50;end{:1348};{1487:}4:begin{1739:}
if(eqtb[7892324].int>=0)and(eqtb[7892324].int<16)and writeopen[eqtb[
7892324].int]then selector:=eqtb[7892324].int;{:1739}begindiagnostic;
showsavegroups;end;{:1487}{1501:}6:begin{1739:}
if(eqtb[7892324].int>=0)and(eqtb[7892324].int<16)and writeopen[eqtb[
7892324].int]then selector:=eqtb[7892324].int;{:1739}begindiagnostic;
printnl(65626);println;if condptr=-268435455 then begin printnl(65661);
print(66904);end else begin p:=condptr;n:=0;repeat incr(n);
p:=mem[p].hh.rh;until p=-268435455;p:=condptr;t:=curif;l:=ifline;
m:=iflimit;repeat printnl(66905);printint(n);print(65593);
printcmdchr(108,t);if m=2 then printesc(66167);
if l<>0 then begin print(66903);printint(l);end;decr(n);t:=mem[p].hh.b1;
l:=mem[p+1].int;m:=mem[p].hh.b0;p:=mem[p].hh.rh;until p=-268435455;end;
end;{:1501}others:{1351:}begin p:=thetoks;{1739:}
if(eqtb[7892324].int>=0)and(eqtb[7892324].int<16)and writeopen[eqtb[
7892324].int]then selector:=eqtb[7892324].int;{:1739}
if interaction=3 then;printnl(66706);tokenshow(memtop-3);
flushlist(mem[memtop-3].hh.rh);goto 50;end{:1351}end;{1352:}
enddiagnostic(true);begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66711);end;
if selector=19 then if eqtb[7892293].int<=0 then begin selector:=17;
print(66712);selector:=19;end{:1352};
50:if selector<16 then begin println;{79:}
if interaction=0 then selector:=16 else selector:=17{:79};
if logopened then selector:=selector+2;
end else begin if interaction<3 then begin helpptr:=0;decr(errorcount);
end else if eqtb[7892293].int>0 then begin begin helpptr:=3;
helpline[2]:=66701;helpline[1]:=66702;helpline[0]:=66703;end;
end else begin begin helpptr:=5;helpline[4]:=66701;helpline[3]:=66702;
helpline[2]:=66703;helpline[1]:=66704;helpline[0]:=66705;end;end;error;
end;end;{:1347}{1356:}ifdef('INITEX')procedure storefmtfile;
label 41,42,31,32;var j,k,l:integer;p,q:halfword;x:integer;
formatengine:^char;begin{1358:}
if saveptr<>0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66714);end;begin helpptr:=1;helpline[0]:=66715;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end{:1358};{1382:}
selector:=21;print(66735);print(jobname);printchar(32);
printint(eqtb[7892287].int);printchar(46);printint(eqtb[7892286].int);
printchar(46);printint(eqtb[7892285].int);printchar(41);
if interaction=0 then selector:=18 else selector:=19;
begin if poolptr+1>poolsize then overflow(65539,poolsize-initpoolptr);
end;formatident:=makestring;packjobname(66175);
while not wopenout(fmtfile)do promptfilename(66736,66175);
printnl(66737);print(wmakenamestring(fmtfile));begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;printnl(65626);
print(formatident){:1382};{1361:}dumpint(1462916184);
x:=strlen(enginename);formatengine:=xmallocarray(char,x+4);
strcpy(stringcast(formatengine),enginename);
for k:=x to x+3 do formatengine[k]:=0;x:=x+4-(x mod 4);dumpint(x);
dumpthings(formatengine[0],x);libcfree(formatengine);dumpint(84944223);
dumpint(1073741823);dumpint(hashhigh);{1464:}dumpint(eTeXmode);{:1464}
{1569:}while pseudofiles<>-268435455 do pseudoclose;{:1569}
dumpint(membot);dumpint(memtop);dumpint(9006998);dumpint(8501);
dumpint(607){:1361};{1700:}dumpint(1296847960);
if mltexp then dumpint(1)else dumpint(0);{:1700};{1363:}
dumpint(poolptr);dumpint(strptr);
dumpthings(strstart[(65536)-65536],strptr-65535);
dumpthings(strpool[0],poolptr);println;printint(strptr);print(66716);
printint(poolptr){:1363};{1365:}sortavail;varused:=0;dumpint(lomemmax);
dumpint(rover);if(eTeXmode=1)then for k:=0 to 6 do dumpint(saroot[k]);
p:=membot;q:=rover;x:=0;repeat dumpthings(mem[p],q+2-p);x:=x+q+2-p;
varused:=varused+q-p;p:=q+mem[q].hh.lh;q:=mem[q+1].hh.rh;until q=rover;
varused:=varused+lomemmax-p;dynused:=memend+1-himemmin;
dumpthings(mem[p],lomemmax+1-p);x:=x+lomemmax+1-p;dumpint(himemmin);
dumpint(avail);dumpthings(mem[himemmin],memend+1-himemmin);
x:=x+memend+1-himemmin;p:=avail;
while p<>-268435455 do begin decr(dynused);p:=mem[p].hh.rh;end;
dumpint(varused);dumpint(dynused);println;printint(x);print(66717);
printint(varused);printchar(38);printint(dynused){:1365};{1367:}{1369:}
k:=1;repeat j:=k;
while j<7892263 do begin if(eqtb[j].hh.rh=eqtb[j+1].hh.rh)and(eqtb[j].hh
.b0=eqtb[j+1].hh.b0)and(eqtb[j].hh.b1=eqtb[j+1].hh.b1)then goto 41;
incr(j);end;l:=7892264;goto 31;41:incr(j);l:=j;
while j<7892263 do begin if(eqtb[j].hh.rh<>eqtb[j+1].hh.rh)or(eqtb[j].hh
.b0<>eqtb[j+1].hh.b0)or(eqtb[j].hh.b1<>eqtb[j+1].hh.b1)then goto 31;
incr(j);end;31:dumpint(l-k);dumpthings(eqtb[k],l-k);k:=j+1;dumpint(k-l);
until k=7892264{:1369};{1370:}repeat j:=k;
while j<9006998 do begin if eqtb[j].int=eqtb[j+1].int then goto 42;
incr(j);end;l:=9006999;goto 32;42:incr(j);l:=j;
while j<9006998 do begin if eqtb[j].int<>eqtb[j+1].int then goto 32;
incr(j);end;32:dumpint(l-k);dumpthings(eqtb[k],l-k);k:=j+1;dumpint(k-l);
until k>9006998;if hashhigh>0 then dumpthings(eqtb[9006999],hashhigh);
{:1370};dumpint(parloc);dumpint(writeloc);{1372:}
for p:=0 to 2100 do dumphh(prim[p]);dumpint(hashused);
cscount:=1194649-hashused+hashhigh;
for p:=1179650 to hashused do if hash[p].rh<>0 then begin dumpint(p);
dumphh(hash[p]);incr(cscount);end;
dumpthings(hash[hashused+1],1205762-hashused);
if hashhigh>0 then dumpthings(hash[9006999],hashhigh);dumpint(cscount);
println;printint(cscount);print(66718){:1372}{:1367};{1374:}
dumpint(fmemptr);dumpthings(fontinfo[0],fmemptr);dumpint(fontptr);
{1376:}begin dumpthings(fontcheck[0],fontptr+1);
dumpthings(fontsize[0],fontptr+1);dumpthings(fontdsize[0],fontptr+1);
dumpthings(fontparams[0],fontptr+1);dumpthings(hyphenchar[0],fontptr+1);
dumpthings(skewchar[0],fontptr+1);dumpthings(fontname[0],fontptr+1);
dumpthings(fontarea[0],fontptr+1);dumpthings(fontbc[0],fontptr+1);
dumpthings(fontec[0],fontptr+1);dumpthings(charbase[0],fontptr+1);
dumpthings(widthbase[0],fontptr+1);dumpthings(heightbase[0],fontptr+1);
dumpthings(depthbase[0],fontptr+1);dumpthings(italicbase[0],fontptr+1);
dumpthings(ligkernbase[0],fontptr+1);dumpthings(kernbase[0],fontptr+1);
dumpthings(extenbase[0],fontptr+1);dumpthings(parambase[0],fontptr+1);
dumpthings(fontglue[0],fontptr+1);dumpthings(bcharlabel[0],fontptr+1);
dumpthings(fontbchar[0],fontptr+1);
dumpthings(fontfalsebchar[0],fontptr+1);
for k:=0 to fontptr do begin printnl(66722);
printesc(hash[1196762+k].rh);printchar(61);
if((fontarea[k]=65535)or(fontarea[k]=65534))or(fontmapping[k]<>0)then
begin printfilename(fontname[k],65626,65626);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66723);end;begin helpptr:=3;helpline[2]:=66724;helpline[1]:=66725;
helpline[0]:=66726;end;error;
end else printfilename(fontname[k],fontarea[k],65626);
if fontsize[k]<>fontdsize[k]then begin print(66130);
printscaled(fontsize[k]);print(65697);end;end;end{:1376};println;
printint(fmemptr-7);print(66719);printint(fontptr-0);
if fontptr<>1 then print(66720)else print(66721){:1374};{1378:}
dumpint(hyphcount);if hyphnext<=607 then hyphnext:=hyphsize;
dumpint(hyphnext);
for k:=0 to hyphsize do if hyphword[k]<>0 then begin dumpint(k+65536*
hyphlink[k]);dumpint(hyphword[k]);dumpint(hyphlist[k]);end;println;
printint(hyphcount);if hyphcount<>1 then print(66727)else print(66728);
if trienotready then inittrie;dumpint(triemax);dumpint(hyphstart);
dumpthings(trietrl[0],triemax+1);dumpthings(trietro[0],triemax+1);
dumpthings(trietrc[0],triemax+1);dumpint(maxhyphchar);
dumpint(trieopptr);dumpthings(hyfdistance[1],trieopptr);
dumpthings(hyfnum[1],trieopptr);dumpthings(hyfnext[1],trieopptr);
printnl(66729);printint(triemax);print(66730);printint(trieopptr);
if trieopptr<>1 then print(66731)else print(66732);print(66733);
printint(trieopsize);
for k:=255 downto 0 do if trieused[k]>0 then begin printnl(66192);
printint(trieused[k]);print(66734);printint(k);dumpint(k);
dumpint(trieused[k]);end{:1378};{1380:}dumpint(interaction);
dumpint(formatident);dumpint(69069);eqtb[7892295].int:=0{:1380};{1383:}
wclose(fmtfile){:1383};end;endif('INITEX'){:1356}{1403:}{1404:}
procedure newwhatsit(s:smallnumber;w:smallnumber);var p:halfword;
begin p:=getnode(w);mem[p].hh.b0:=8;mem[p].hh.b1:=s;
mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;end;{:1404}{1405:}
procedure newwritewhatsit(w:smallnumber);begin newwhatsit(curchr,w);
if w<>2 then scanfourbitint else begin scanint;
if curval<0 then curval:=17 else if(curval>15)and(curval<>18)then curval
:=16;end;mem[curlist.tailfield+1].hh.lh:=curval;end;{:1405}{1445:}
procedure loadpicture(ispdf:boolean);var picpath:^char;bounds:realrect;
t,t2:transform;corners:array[0..3]of realpoint;xsizereq,ysizereq:real;
checkkeywords:boolean;xmin,xmax,ymin,ymax:real;i:smallnumber;
page:integer;pdfboxtype:integer;result:integer;begin scanfilename;
packfilename(curname,curarea,curext);pdfboxtype:=0;page:=0;
if ispdf then begin if scankeyword(66429)then begin scanint;
page:=curval;end;pdfboxtype:=6;
if scankeyword(66796)then pdfboxtype:=1 else if scankeyword(66797)then
pdfboxtype:=2 else if scankeyword(66798)then pdfboxtype:=3 else if
scankeyword(66799)then pdfboxtype:=4 else if scankeyword(66800)then
pdfboxtype:=5;end;
if pdfboxtype=6 then result:=findpicfile(addressof(picpath),addressof(
bounds),1,page)else result:=findpicfile(addressof(picpath),addressof(
bounds),pdfboxtype,page);
setPoint(corners[0],xField(bounds),yField(bounds));
setPoint(corners[1],xField(corners[0]),yField(bounds)+htField(bounds));
setPoint(corners[2],xField(bounds)+wdField(bounds),yField(corners[1]));
setPoint(corners[3],xField(corners[2]),yField(corners[0]));
xsizereq:=0.0;ysizereq:=0.0;makeidentity(addressof(t));
checkkeywords:=true;
while checkkeywords do begin if scankeyword(66679)then begin scanint;
if(xsizereq=0.0)and(ysizereq=0.0)then begin makescale(addressof(t2),
curval/1000.0,curval/1000.0);
for i:=0 to 3 do transformpoint(addressof(corners[i]),addressof(t2));
transformconcat(addressof(t),addressof(t2));
end end else if scankeyword(66801)then begin scanint;
if(xsizereq=0.0)and(ysizereq=0.0)then begin makescale(addressof(t2),
curval/1000.0,1.0);
for i:=0 to 3 do transformpoint(addressof(corners[i]),addressof(t2));
transformconcat(addressof(t),addressof(t2));
end end else if scankeyword(66802)then begin scanint;
if(xsizereq=0.0)and(ysizereq=0.0)then begin makescale(addressof(t2),1.0,
curval/1000.0);
for i:=0 to 3 do transformpoint(addressof(corners[i]),addressof(t2));
transformconcat(addressof(t),addressof(t2));
end end else if scankeyword(66093)then begin scandimen(false,false,false
);if curval<=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66803);end;print(66804);printscaled(curval);print(66805);
begin helpptr:=2;helpline[1]:=66806;helpline[0]:=66807;end;error;
end else xsizereq:=Fix2D(curval);
end else if scankeyword(66094)then begin scandimen(false,false,false);
if curval<=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66803);end;print(66804);printscaled(curval);print(66805);
begin helpptr:=2;helpline[1]:=66806;helpline[0]:=66807;end;error;
end else ysizereq:=Fix2D(curval);
end else if scankeyword(66808)then begin scandecimal;
if(xsizereq<>0.0)or(ysizereq<>0.0)then begin begin xmin:=1000000.0;
xmax:=-xmin;ymin:=xmin;ymax:=xmax;
for i:=0 to 3 do begin if xCoord(corners[i])<xmin then xmin:=xCoord(
corners[i]);if xCoord(corners[i])>xmax then xmax:=xCoord(corners[i]);
if yCoord(corners[i])<ymin then ymin:=yCoord(corners[i]);
if yCoord(corners[i])>ymax then ymax:=yCoord(corners[i]);end;end;
if xsizereq=0.0 then begin makescale(addressof(t2),ysizereq/(ymax-ymin),
ysizereq/(ymax-ymin));
end else if ysizereq=0.0 then begin makescale(addressof(t2),xsizereq/(
xmax-xmin),xsizereq/(xmax-xmin));
end else begin makescale(addressof(t2),xsizereq/(xmax-xmin),ysizereq/(
ymax-ymin));end;
for i:=0 to 3 do transformpoint(addressof(corners[i]),addressof(t2));
xsizereq:=0.0;ysizereq:=0.0;transformconcat(addressof(t),addressof(t2));
end;makerotation(addressof(t2),Fix2D(curval)*3.141592653589793/180.0);
for i:=0 to 3 do transformpoint(addressof(corners[i]),addressof(t2));
begin xmin:=1000000.0;xmax:=-xmin;ymin:=xmin;ymax:=xmax;
for i:=0 to 3 do begin if xCoord(corners[i])<xmin then xmin:=xCoord(
corners[i]);if xCoord(corners[i])>xmax then xmax:=xCoord(corners[i]);
if yCoord(corners[i])<ymin then ymin:=yCoord(corners[i]);
if yCoord(corners[i])>ymax then ymax:=yCoord(corners[i]);end;end;
setPoint(corners[0],xmin,ymin);setPoint(corners[1],xmin,ymax);
setPoint(corners[2],xmax,ymax);setPoint(corners[3],xmax,ymin);
transformconcat(addressof(t),addressof(t2));
end else checkkeywords:=false;end;
if(xsizereq<>0.0)or(ysizereq<>0.0)then begin begin xmin:=1000000.0;
xmax:=-xmin;ymin:=xmin;ymax:=xmax;
for i:=0 to 3 do begin if xCoord(corners[i])<xmin then xmin:=xCoord(
corners[i]);if xCoord(corners[i])>xmax then xmax:=xCoord(corners[i]);
if yCoord(corners[i])<ymin then ymin:=yCoord(corners[i]);
if yCoord(corners[i])>ymax then ymax:=yCoord(corners[i]);end;end;
if xsizereq=0.0 then begin makescale(addressof(t2),ysizereq/(ymax-ymin),
ysizereq/(ymax-ymin));
end else if ysizereq=0.0 then begin makescale(addressof(t2),xsizereq/(
xmax-xmin),xsizereq/(xmax-xmin));
end else begin makescale(addressof(t2),xsizereq/(xmax-xmin),ysizereq/(
ymax-ymin));end;
for i:=0 to 3 do transformpoint(addressof(corners[i]),addressof(t2));
xsizereq:=0.0;ysizereq:=0.0;transformconcat(addressof(t),addressof(t2));
end;begin xmin:=1000000.0;xmax:=-xmin;ymin:=xmin;ymax:=xmax;
for i:=0 to 3 do begin if xCoord(corners[i])<xmin then xmin:=xCoord(
corners[i]);if xCoord(corners[i])>xmax then xmax:=xCoord(corners[i]);
if yCoord(corners[i])<ymin then ymin:=yCoord(corners[i]);
if yCoord(corners[i])>ymax then ymax:=yCoord(corners[i]);end;end;
maketranslation(addressof(t2),-xmin*72/72.27,-ymin*72/72.27);
transformconcat(addressof(t),addressof(t2));
if result=0 then begin newwhatsit(43,9+(strlen(picpath)+sizeof(
memoryword)-1)div sizeof(memoryword));
if ispdf then begin mem[curlist.tailfield].hh.b1:=44;end;
mem[curlist.tailfield+4].hh.b0:=strlen(picpath);
mem[curlist.tailfield+4].hh.b1:=page;
mem[curlist.tailfield+8].hh.b0:=pdfboxtype;
mem[curlist.tailfield+1].int:=D2Fix(xmax-xmin);
mem[curlist.tailfield+3].int:=D2Fix(ymax-ymin);
mem[curlist.tailfield+2].int:=0;
mem[curlist.tailfield+5].hh.lh:=D2Fix(aField(t));
mem[curlist.tailfield+5].hh.rh:=D2Fix(bField(t));
mem[curlist.tailfield+6].hh.lh:=D2Fix(cField(t));
mem[curlist.tailfield+6].hh.rh:=D2Fix(dField(t));
mem[curlist.tailfield+7].hh.lh:=D2Fix(xField(t));
mem[curlist.tailfield+7].hh.rh:=D2Fix(yField(t));
memcpy(addressof(mem[curlist.tailfield+9]),picpath,strlen(picpath));
libcfree(picpath);end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66809);end;printfilename(curname,curarea,curext);print(39);
if result=-43 then begin begin helpptr:=2;helpline[1]:=66810;
helpline[0]:=66811;end;end else begin begin helpptr:=2;
helpline[1]:=66810;helpline[0]:=66812;end;end;error;end;end;{:1445}
{1456:}procedure scanandpackname;begin scanfilename;
packfilename(curname,curarea,curext);end;{:1456}procedure doextension;
var i,j,k:integer;p:halfword;begin case curchr of 0:{1406:}
begin newwritewhatsit(3);scanoptionalequals;scanfilename;
mem[curlist.tailfield+1].hh.rh:=curname;
mem[curlist.tailfield+2].hh.lh:=curarea;
mem[curlist.tailfield+2].hh.rh:=curext;end{:1406};1:{1407:}
begin k:=curcs;newwritewhatsit(2);curcs:=k;p:=scantoks(false,false);
mem[curlist.tailfield+1].hh.rh:=defref;end{:1407};2:{1408:}
begin newwritewhatsit(2);mem[curlist.tailfield+1].hh.rh:=-268435455;
end{:1408};3:{1409:}
begin if scankeyword(66495)then begin newwhatsit(4,2);
mem[curlist.tailfield+1].hh.lh:=-268435455;p:=scantoks(false,false);
mem[curlist.tailfield+1].hh.rh:=defref;end else begin newwhatsit(3,2);
mem[curlist.tailfield+1].hh.lh:=-268435455;p:=scantoks(false,true);
mem[curlist.tailfield+1].hh.rh:=defref;end;end{:1409};5:{1438:}
begin getxtoken;
if(curcmd=59)and(curchr<=2)then begin p:=curlist.tailfield;doextension;
outwhat(curlist.tailfield);flushnodelist(curlist.tailfield);
curlist.tailfield:=p;mem[p].hh.rh:=-268435455;end else backinput;
end{:1438};6:{1440:}
if abs(curlist.modefield)<>105 then reportillegalcase else begin
newwhatsit(5,2);scanint;
if curval<=0 then curlist.auxfield.hh.rh:=0 else if curval>255 then
curlist.auxfield.hh.rh:=0 else curlist.auxfield.hh.rh:=curval;
mem[curlist.tailfield+1].hh.rh:=curlist.auxfield.hh.rh;
mem[curlist.tailfield+1].hh.b0:=normmin(eqtb[7892315].int);
mem[curlist.tailfield+1].hh.b1:=normmin(eqtb[7892316].int);end{:1440};
23:{1450:}begin newwhatsit(23,2);end{:1450};33:{1414:}
begin secondsandmicros(epochseconds,microseconds);end{:1414};35:{1413:}
begin scanint;if curval<0 then curval:=-curval;randomseed:=curval;
initrandoms(randomseed);end{:1413};41:{1442:}
if abs(curlist.modefield)=209 then reportillegalcase else loadpicture(
false){:1442};42:{1443:}
if abs(curlist.modefield)=209 then reportillegalcase else loadpicture(
true){:1443};43:{1444:}
begin if abs(curlist.modefield)=1 then begin backinput;newgraf(true);
end else if abs(curlist.modefield)=209 then reportillegalcase else begin
if((fontarea[eqtb[1206823].hh.rh]=65535)or(fontarea[eqtb[1206823].hh.rh]
=65534))then begin newwhatsit(42,5);scanint;
if(curval<0)or(curval>65535)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66794);end;begin helpptr:=2;helpline[1]:=66795;helpline[0]:=66005;
end;interror(curval);curval:=0;end;
mem[curlist.tailfield+4].qqqq.b1:=eqtb[1206823].hh.rh;
mem[curlist.tailfield+4].qqqq.b2:=curval;
setnativeglyphmetrics(curlist.tailfield,(eqtb[7892342].int>0));
end else notnativefonterror(59,43,eqtb[1206823].hh.rh);end end{:1444};
44:{1446:}begin scanandpackname;i:=getencodingmodeandinfo(addressof(j));
if i=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66813);end;begin helpptr:=2;helpline[1]:=66814;helpline[0]:=66815;
end;error;end else setinputfileencoding(inputfile[inopen],i,j);
end{:1446};45:{1447:}begin scanandpackname;
i:=getencodingmodeandinfo(addressof(j));eqtb[7892345].int:=i;
eqtb[7892346].int:=j;end{:1447};46:{1448:}begin scanfilename;
if length(curname)=0 then eqtb[7892336].int:=0 else eqtb[7892336].int:=
curname;end{:1448};others:confusion(66764)end;end;{:1403}{1439:}
procedure fixlanguage;var l:UTF16code;
begin if eqtb[7892314].int<=0 then l:=0 else if eqtb[7892314].int>255
then l:=0 else l:=eqtb[7892314].int;
if l<>curlist.auxfield.hh.rh then begin newwhatsit(5,2);
mem[curlist.tailfield+1].hh.rh:=l;curlist.auxfield.hh.rh:=l;
mem[curlist.tailfield+1].hh.b0:=normmin(eqtb[7892315].int);
mem[curlist.tailfield+1].hh.b1:=normmin(eqtb[7892316].int);end;end;
{:1439}{1737:}procedure insertsrcspecial;var toklist,p,q:halfword;
begin if(sourcefilenamestack[inopen]>0 and isnewsource(
sourcefilenamestack[inopen],line))then begin toklist:=getavail;
p:=toklist;mem[p].hh.lh:=34749091;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=2097275;
q:=strtoks(makesrcspecial(sourcefilenamestack[inopen],line));
mem[p].hh.rh:=mem[memtop-3].hh.rh;p:=q;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=4194429;begintokenlist(toklist,5);
remembersourceinfo(sourcefilenamestack[inopen],line);end;end;
procedure appendsrcspecial;var q:halfword;
begin if(sourcefilenamestack[inopen]>0 and isnewsource(
sourcefilenamestack[inopen],line))then begin newwhatsit(3,2);
mem[curlist.tailfield+1].hh.lh:=0;defref:=getavail;
mem[defref].hh.lh:=-268435455;
q:=strtoks(makesrcspecial(sourcefilenamestack[inopen],line));
mem[defref].hh.rh:=mem[memtop-3].hh.rh;
mem[curlist.tailfield+1].hh.rh:=defref;
remembersourceinfo(sourcefilenamestack[inopen],line);end;end;{:1737}
{1122:}procedure handlerightbrace;var p,q:halfword;d:scaled;f:integer;
begin case curgroup of 1:unsave;0:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(66477);end;begin helpptr:=2;helpline[1]:=66478;helpline[0]:=66479;
end;error;end;14,15,16:extrarightbrace;{1139:}2:package(0);
3:begin adjusttail:=memtop-5;preadjusttail:=memtop-14;package(0);end;
4:if(eqtb[7892323].int>0)and(curlist.modefield=105)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=5;
end else begin endgraf;package(0);end;
5:if(eqtb[7892323].int>0)and(curlist.modefield=105)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=5;
end else begin endgraf;package(4);end;{:1139}{1154:}
11:if(eqtb[7892323].int>1)and(curlist.modefield=105)then begin backinput
;curtok:=partoken;backinput;curinput.indexfield:=5;
end else begin endgraf;q:=eqtb[1205774].hh.rh;incr(mem[q].hh.rh);
d:=eqtb[9006726].int;f:=eqtb[7892306].int;unsave;saveptr:=saveptr-2;
p:=vpackage(mem[curlist.headfield].hh.rh,0,1,1073741823);popnest;
if savestack[saveptr+0].int<255 then begin begin mem[curlist.tailfield].
hh.rh:=getnode(5);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=3;
mem[curlist.tailfield].hh.b1:=savestack[saveptr+0].int;
mem[curlist.tailfield+3].int:=mem[p+3].int+mem[p+2].int;
mem[curlist.tailfield+4].hh.lh:=mem[p+5].hh.rh;
mem[curlist.tailfield+4].hh.rh:=q;mem[curlist.tailfield+2].int:=d;
mem[curlist.tailfield+1].int:=f;
end else begin begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;
mem[curlist.tailfield].hh.b1:=savestack[saveptr+1].int;
mem[curlist.tailfield+1].int:=mem[p+5].hh.rh;deleteglueref(q);end;
freenode(p,8);if nestptr=0 then buildpage;end;
8:if(eqtb[7892323].int>1)and(curlist.modefield=105)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=5;end else{1080:}
begin while(curinput.statefield=0)and(curinput.locfield=-268435455)and(
curinput.indexfield=3)do endtokenlist;
if(curinput.statefield<>0)or(curinput.locfield<>-268435455)or(curinput.
indexfield<>7)then{1081:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65923);end;begin helpptr:=2;helpline[1]:=66446;helpline[0]:=66447;
end;error;repeat gettoken;until curinput.locfield=-268435455;end{:1081};
outputcanend:=true;endtokenlist;outputcanend:=false;endgraf;unsave;
outputactive:=false;insertpenalties:=0;{1082:}
if eqtb[1206822].hh.rh<>-268435455 then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65544);
print(66448);end;printesc(65709);printint(255);begin helpptr:=3;
helpline[2]:=66449;helpline[1]:=66450;helpline[0]:=66451;end;
boxerror(255);end{:1082};
if curlist.tailfield<>curlist.headfield then begin mem[pagetail].hh.rh:=
mem[curlist.headfield].hh.rh;pagetail:=curlist.tailfield;end;
if mem[memtop-2].hh.rh<>-268435455 then begin if mem[memtop-1].hh.rh=
-268435455 then nest[0].tailfield:=pagetail;
mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;
mem[memtop-1].hh.rh:=mem[memtop-2].hh.rh;
mem[memtop-2].hh.rh:=-268435455;pagetail:=memtop-2;end;
flushnodelist(discptr[2]);discptr[2]:=-268435455;popnest;buildpage;
end{:1080};{:1154}{1172:}10:builddiscretionary;{:1172}{1186:}
6:begin backinput;curtok:=34749082;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65544);
print(65958);end;printesc(66327);print(65959);begin helpptr:=1;
helpline[0]:=66560;end;inserror;end;{:1186}{1187:}
7:if(eqtb[7892323].int>1)and(curlist.modefield=105)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=5;
end else begin endgraf;unsave;alignpeek;end;{:1187}{1222:}
12:if(eqtb[7892323].int>0)and(curlist.modefield=105)then begin backinput
;curtok:=partoken;backinput;curinput.indexfield:=5;
end else begin endgraf;unsave;saveptr:=saveptr-2;
p:=vpackage(mem[curlist.headfield].hh.rh,savestack[saveptr+1].int,
savestack[saveptr+0].int,1073741823);popnest;
begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=29;mem[curlist.tailfield+1].hh.rh:=2;
mem[curlist.tailfield+1].hh.lh:=p;end;{:1222}{1227:}13:buildchoices;
{:1227}{1240:}9:begin unsave;decr(saveptr);
mem[savestack[saveptr+0].int].hh.rh:=3;p:=finmlist(-268435455);
mem[savestack[saveptr+0].int].hh.lh:=p;
if p<>-268435455 then if mem[p].hh.rh=-268435455 then if mem[p].hh.b0=16
then begin if mem[p+3].hh.rh=0 then if mem[p+2].hh.rh=0 then begin mem[
savestack[saveptr+0].int].hh:=mem[p+1].hh;freenode(p,4);end;
end else if mem[p].hh.b0=28 then if savestack[saveptr+0].int=curlist.
tailfield+1 then if mem[curlist.tailfield].hh.b0=16 then{1241:}
begin q:=curlist.headfield;
while mem[q].hh.rh<>curlist.tailfield do q:=mem[q].hh.rh;
mem[q].hh.rh:=p;freenode(curlist.tailfield,4);curlist.tailfield:=p;
end{:1241};end;{:1240}others:confusion(66480)end;end;{:1122}
procedure maincontrol;
label 60,21,70,80,90,91,92,95,100,101,110,111,112,71,72,120,10;
var t:integer;
begin if eqtb[1206302].hh.rh<>-268435455 then begintokenlist(eqtb[
1206302].hh.rh,13);60:getxtoken;21:{1085:}
if interrupt<>0 then if OKtointerrupt then begin backinput;
begin if interrupt<>0 then pauseforinstructions;end;goto 60;end;
ifdef('TEXMF_DEBUG')if panicking then checkmem(false);
endif('TEXMF_DEBUG')if eqtb[7892300].int>0 then showcurcmdchr{:1085};
case abs(curlist.modefield)+curcmd of 116,117,173:goto 70;
121:begin scanusvnum;curchr:=curval;goto 70;end;170:begin getxtoken;
if(curcmd=11)or(curcmd=12)or(curcmd=68)or(curcmd=16)then cancelboundary
:=true;goto 21;end;
others:begin if abs(curlist.modefield)=105 then if(eqtb[7892343].int>0)
and(spaceclass<>4096)and(prevclass<>(4095))then begin prevclass:=(4095);
findsaelement(6,spaceclass*4096+(4095),false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcs=0 then begin if curcmd=16 then curcmd:=12;
curtok:=(curcmd*2097152)+curchr;end else curtok:=33554431+curcs;
backinput;begintokenlist(mem[curptr+1].hh.rh,17);goto 60;end;end;
case abs(curlist.modefield)+curcmd of 115:if curlist.auxfield.hh.lh=1000
then goto 120 else appspace;169,273:goto 120;{1099:}
1,105,209,11,219,274:;40,144,248:begin if curchr=0 then begin{440:}
repeat getxtoken;until curcmd<>10{:440};goto 21;
end else begin t:=scannerstatus;scannerstatus:=0;getnext;
scannerstatus:=t;
if curcs<1179650 then curcs:=primlookup(curcs-1114113)else curcs:=
primlookup(hash[curcs].rh);
if curcs<>0 then begin curcmd:=eqtb[1194662+curcs].hh.b0;
curchr:=eqtb[1194662+curcs].hh.rh;curtok:=34749093+curcs;goto 21;end;
end;end;15:if itsallover then goto 10;{1102:}
23,126,230,72,176,280,{:1102}{1152:}39,{:1152}{1165:}45,{:1165}{1198:}
49,153,{:1198}7,111,215:reportillegalcase;{1100:}
8,112,9,113,18,122,70,174,71,175,51,155,16,120,50,154,53,157,67,171,54,
158,55,159,57,161,56,160,31,135,52,156,29,133,47,151,218,222,223,236,233
,242,245{:1100}:insertdollarsign;{1110:}
37,140,244:begin begin mem[curlist.tailfield].hh.rh:=scanrulespec;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if abs(curlist.modefield)=1 then curlist.auxfield.int:=-65536000 else if
abs(curlist.modefield)=105 then curlist.auxfield.hh.lh:=1000;end;{:1110}
{1111:}28,131,235,237:appendglue;30,134,238,239:appendkern;{:1111}
{1117:}2,106:newsavelevel(1);62,166,270:newsavelevel(14);
63,167,271:if curgroup=14 then unsave else offsave;{:1117}{1121:}
3,107,211:handlerightbrace;{:1121}{1127:}22,127,231:begin t:=curchr;
scandimen(false,false,false);
if t=0 then scanbox(curval)else scanbox(-curval);end;
32,136,240:scanbox(1073807261+curchr);21,125,229:beginbox(0);{:1127}
{1144:}44:newgraf(curchr>0);
12,13,17,69,4,24,36,46,48,27,34,65,66:begin backinput;newgraf(true);end;
{:1144}{1146:}148,252:indentinhmode;{:1146}{1148:}
14:begin normalparagraph;if curlist.modefield>0 then buildpage;end;
118:begin if alignstate<0 then offsave;endgraf;
if curlist.modefield=1 then buildpage;end;
119,132,141,129,137:headforvmode;{:1148}{1151:}
38,142,246,143,247:begininsertoradjust;19,123,227:makemark;{:1151}
{1156:}43,147,251:appendpenalty;{:1156}{1158:}26,130,234:deletelast;
{:1158}{1163:}25,128,232:unpackage;{:1163}{1166:}
149:appenditaliccorrection;
253:begin mem[curlist.tailfield].hh.rh:=newkern(0);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;{:1166}{1170:}
152,256:appenddiscretionary;{:1170}{1176:}150:makeaccent;{:1176}{1180:}
6,110,214,5,109,213:alignerror;35,139,243:noalignerror;
64,168,272:omiterror;{:1180}{1184:}33:initalign;138:{1513:}
if curchr>0 then begin if eTeXenabled((eqtb[7892339].int>0),curcmd,
curchr)then begin mem[curlist.tailfield].hh.rh:=newmath(0,curchr);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end else{:1513}
initalign;
241:if privileged then if curgroup=15 then initalign else offsave;
10,114:if(eqtb[7892323].int>1)and(curlist.modefield=105)then begin
backinput;curtok:=partoken;backinput;curinput.indexfield:=5;
end else doendv;{:1184}{1188:}68,172,276:cserror;{:1188}{1191:}
108:initmath;{:1191}{1194:}
257:if privileged then if curgroup=15 then starteqno else offsave;
{:1194}{1204:}210:begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;backinput;
scanmath(curlist.tailfield+1);end;{:1204}{1208:}
220,221,277:setmathchar(eqtb[5664040+curchr].hh.rh);
225:begin scancharnum;curchr:=curval;
setmathchar(eqtb[5664040+curchr].hh.rh);end;
226:if curchr=2 then begin scanmathclassint;t:=setclassfield(curval);
scanmathfamint;t:=t+setfamilyfield(curval);scanusvnum;t:=t+curval;
setmathchar(t);end else if curchr=1 then begin scanxetexmathcharint;
setmathchar(curval);end else begin scanfifteenbitint;
setmathchar(setclassfield(curval div 4096)+setfamilyfield((curval mod
4096)div 256)+(curval mod 256));end;
278:begin setmathchar(setclassfield(curchr div 4096)+setfamilyfield((
curchr mod 4096)div 256)+(curchr mod 256));end;279:setmathchar(curchr);
224:begin if curchr=1 then begin scanmathclassint;
t:=setclassfield(curval);scanmathfamint;t:=t+setfamilyfield(curval);
scanusvnum;t:=t+curval;setmathchar(t);end else begin scandelimiterint;
curval:=curval div 4096;
setmathchar(setclassfield(curval div 4096)+setfamilyfield((curval mod
4096)div 256)+(curval mod 256));end;end;{:1208}{1212:}
259:begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=curchr;scanmath(curlist.tailfield+1);end;
260:mathlimitswitch;{:1212}{1216:}275:mathradical;{:1216}{1218:}
254,255:mathac;{:1218}{1221:}265:begin scanspec(12,false);
normalparagraph;pushnest;curlist.modefield:=-1;
curlist.auxfield.int:=-65536000;
if(insertsrcspecialeveryvbox)then insertsrcspecial;
if eqtb[1206301].hh.rh<>-268435455 then begintokenlist(eqtb[1206301].hh.
rh,12);end;{:1221}{1225:}
262:begin mem[curlist.tailfield].hh.rh:=newstyle(curchr);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
264:begin begin mem[curlist.tailfield].hh.rh:=newglue(membot);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=98;end;263:appendchoices;{:1225}{1229:}
217,216:subsup;{:1229}{1234:}261:mathfraction;{:1234}{1244:}
258:mathleftright;{:1244}{1247:}
212:if curgroup=15 then aftermath else offsave;{:1247}{1264:}
73,177,281,74,178,282,75,179,283,76,180,284,77,181,285,78,182,286,79,183
,287,80,184,288,81,185,289,82,186,290,83,187,291,84,188,292,85,189,293,
86,190,294,87,191,295,88,192,296,89,193,297,90,194,298,91,195,299,92,196
,300,93,197,301,94,198,302,95,199,303,96,200,304,97,201,305,98,202,306,
99,203,307,100,204,308,101,205,309,102,206,310,103,207,311:
prefixedcommand;{:1264}{1322:}41,145,249:begin gettoken;
aftertoken:=curtok;end;{:1322}{1325:}42,146,250:begin gettoken;
saveforafter(curtok);end;104,208,312:begin gettoken;
if curcs>0 then begin parloc:=curcs;partoken:=curtok;end;end;{:1325}
{1328:}61,165,269:openorclosein;{:1328}{1330:}59,163,267:issuemessage;
{:1330}{1339:}58,162,266:shiftcase;{:1339}{1344:}
20,124,228:showwhatever;{:1344}{1402:}60,164,268:doextension;{:1402}
{:1099}end end end;goto 60;70:{1088:}
if((curlist.headfield=curlist.tailfield)and(curlist.modefield>0))then
begin if(insertsrcspecialauto)then appendsrcspecial;end;
prevclass:=(4095);
if((fontarea[eqtb[1206823].hh.rh]=65535)or(fontarea[eqtb[1206823].hh.rh]
=65534))then begin if curlist.modefield>0 then if eqtb[7892314].int<>
curlist.auxfield.hh.rh then fixlanguage;mainh:=0;
mainf:=eqtb[1206823].hh.rh;nativelen:=0;
71:mains:=eqtb[4549928+curchr].hh.rh mod 65536;
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;curptr:=-268435455;
spaceclass:=eqtb[4549928+curchr].hh.rh div 65536;
if(eqtb[7892343].int>0)and spaceclass<>4096 then begin if prevclass=(
4095)then begin if(curinput.statefield<>0)or(curinput.indexfield<>4)then
begin findsaelement(6,(4095)*4096+spaceclass,false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcmd<>11 then curcmd:=12;curtok:=(curcmd*2097152)+curchr;backinput;
curinput.indexfield:=4;begintokenlist(mem[curptr+1].hh.rh,17);goto 60;
end end end else begin findsaelement(6,prevclass*4096+spaceclass,false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcmd<>11 then curcmd:=12;curtok:=(curcmd*2097152)+curchr;backinput;
curinput.indexfield:=4;begintokenlist(mem[curptr+1].hh.rh,17);
prevclass:=(4095);goto 72;end;end;prevclass:=spaceclass;end;
if(curchr>65535)then begin while nativetextsize<=nativelen+2 do begin
nativetextsize:=nativetextsize+128;
nativetext:=xrealloc(nativetext,nativetextsize*sizeof(UTF16code));end;
begin nativetext[nativelen]:=(curchr-65536)div 1024+55296;
incr(nativelen);end;
begin nativetext[nativelen]:=(curchr-65536)mod 1024+56320;
incr(nativelen);end;
end else begin while nativetextsize<=nativelen+1 do begin nativetextsize
:=nativetextsize+128;
nativetext:=xrealloc(nativetext,nativetextsize*sizeof(UTF16code));end;
begin nativetext[nativelen]:=curchr;incr(nativelen);end;end;
ishyph:=(curchr=hyphenchar[mainf])or((eqtb[7892340].int>0)and((curchr=
8212)or(curchr=8211)));if(mainh=0)and ishyph then mainh:=nativelen;
getnext;if(curcmd=11)or(curcmd=12)or(curcmd=68)then goto 71;xtoken;
if(curcmd=11)or(curcmd=12)or(curcmd=68)then goto 71;
if curcmd=16 then begin scanusvnum;curchr:=curval;goto 71;end;
if(eqtb[7892343].int>0)and(spaceclass<>4096)and(prevclass<>(4095))then
begin prevclass:=(4095);findsaelement(6,spaceclass*4096+(4095),false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcs=0 then begin if curcmd=16 then curcmd:=12;
curtok:=(curcmd*2097152)+curchr;end else curtok:=33554431+curcs;
backinput;begintokenlist(mem[curptr+1].hh.rh,17);goto 72;end;end;
72:if(fontmapping[mainf]<>0)then begin maink:=applymapping(fontmapping[
mainf],nativetext,nativelen);nativelen:=0;
while nativetextsize<=nativelen+maink do begin nativetextsize:=
nativetextsize+128;
nativetext:=xrealloc(nativetext,nativetextsize*sizeof(UTF16code));end;
mainh:=0;
for mainp:=0 to maink-1 do begin begin nativetext[nativelen]:=mappedtext
[mainp];incr(nativelen);end;
if(mainh=0)and((mappedtext[mainp]=hyphenchar[mainf])or((eqtb[7892340].
int>0)and((mappedtext[mainp]=8212)or(mappedtext[mainp]=8211))))then
mainh:=nativelen;end end;if eqtb[7892299].int>0 then begin tempptr:=0;
while(tempptr<nativelen)do begin maink:=nativetext[tempptr];
incr(tempptr);
if(maink>=55296)and(maink<56320)then begin maink:=65536+(maink-55296)
*1024;maink:=maink+nativetext[tempptr]-56320;incr(tempptr);end;
if mapchartoglyph(mainf,maink)=0 then charwarning(mainf,maink);end end;
maink:=nativelen;mainpp:=curlist.tailfield;
if curlist.modefield=105 then begin mainppp:=curlist.headfield;
while(mainppp<>mainpp)and(mem[mainppp].hh.rh<>mainpp)do begin if(not(
mainppp>=himemmin))and(mem[mainppp].hh.b0=7)then begin tempptr:=mainppp;
for mainp:=1 to mem[tempptr].hh.b1 do mainppp:=mem[mainppp].hh.rh;end;
if mainppp<>mainpp then mainppp:=mem[mainppp].hh.rh;end;tempptr:=0;
repeat if mainh=0 then mainh:=maink;
if(((mainpp)<>-268435455)and(not(mainpp>=himemmin))and(mem[mainpp].hh.b0
=8)and(((mem[mainpp].hh.b1>=40)and(mem[mainpp].hh.b1<=41))))and(mem[
mainpp+4].qqqq.b1=mainf)and(mainppp<>mainpp)and(not(mainppp>=himemmin))
and(mem[mainppp].hh.b0<>7)then begin maink:=mainh+mem[mainpp+4].qqqq.b2;
while nativetextsize<=nativelen+maink do begin nativetextsize:=
nativetextsize+128;
nativetext:=xrealloc(nativetext,nativetextsize*sizeof(UTF16code));end;
savenativelen:=nativelen;
for mainp:=0 to mem[mainpp+4].qqqq.b2-1 do begin nativetext[nativelen]:=
getnativechar(mainpp,mainp);incr(nativelen);end;
for mainp:=0 to mainh-1 do begin nativetext[nativelen]:=nativetext[
tempptr+mainp];incr(nativelen);end;
dolocalelinebreaks(savenativelen,maink);nativelen:=savenativelen;
maink:=nativelen-mainh-tempptr;tempptr:=mainh;mainh:=0;
while(mainh<maink)and(nativetext[tempptr+mainh]<>hyphenchar[mainf])and((
not(eqtb[7892340].int>0))or((nativetext[tempptr+mainh]<>8212)and(
nativetext[tempptr+mainh]<>8211)))do incr(mainh);
if(mainh<maink)then incr(mainh);mem[mainppp].hh.rh:=mem[mainpp].hh.rh;
mem[mainpp].hh.rh:=-268435455;flushnodelist(mainpp);
mainpp:=curlist.tailfield;
while(mem[mainppp].hh.rh<>mainpp)do mainppp:=mem[mainppp].hh.rh;
end else begin dolocalelinebreaks(tempptr,mainh);tempptr:=tempptr+mainh;
maink:=maink-mainh;mainh:=0;
while(mainh<maink)and(nativetext[tempptr+mainh]<>hyphenchar[mainf])and((
not(eqtb[7892340].int>0))or((nativetext[tempptr+mainh]<>8212)and(
nativetext[tempptr+mainh]<>8211)))do incr(mainh);
if(mainh<maink)then incr(mainh);end;
if(maink>0)or ishyph then begin begin mem[curlist.tailfield].hh.rh:=
newdisc;curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mainpp:=curlist.tailfield;end;until maink=0;
end else begin mainppp:=curlist.headfield;
while(mainppp<>mainpp)and(mem[mainppp].hh.rh<>mainpp)do begin if(not(
mainppp>=himemmin))and(mem[mainppp].hh.b0=7)then begin tempptr:=mainppp;
for mainp:=1 to mem[tempptr].hh.b1 do mainppp:=mem[mainppp].hh.rh;end;
if mainppp<>mainpp then mainppp:=mem[mainppp].hh.rh;end;
if(((mainpp)<>-268435455)and(not(mainpp>=himemmin))and(mem[mainpp].hh.b0
=8)and(((mem[mainpp].hh.b1>=40)and(mem[mainpp].hh.b1<=41))))and(mem[
mainpp+4].qqqq.b1=mainf)and(mainppp<>mainpp)and(not(mainppp>=himemmin))
and(mem[mainppp].hh.b0<>7)then begin mem[mainpp].hh.rh:=
newnativewordnode(mainf,maink+mem[mainpp+4].qqqq.b2);
curlist.tailfield:=mem[mainpp].hh.rh;
for mainp:=0 to mem[mainpp+4].qqqq.b2-1 do setnativechar(curlist.
tailfield,mainp,getnativechar(mainpp,mainp));
for mainp:=0 to maink-1 do setnativechar(curlist.tailfield,mainp+mem[
mainpp+4].qqqq.b2,nativetext[mainp]);
setnativemetrics(curlist.tailfield,(eqtb[7892342].int>0));
mainp:=curlist.headfield;
if mainp<>mainpp then while mem[mainp].hh.rh<>mainpp do mainp:=mem[mainp
].hh.rh;mem[mainp].hh.rh:=mem[mainpp].hh.rh;
mem[mainpp].hh.rh:=-268435455;flushnodelist(mainpp);
end else begin mem[mainpp].hh.rh:=newnativewordnode(mainf,maink);
curlist.tailfield:=mem[mainpp].hh.rh;
for mainp:=0 to maink-1 do setnativechar(curlist.tailfield,mainp,
nativetext[mainp]);
setnativemetrics(curlist.tailfield,(eqtb[7892342].int>0));end end;
if eqtb[7892348].int>0 then begin mainp:=curlist.headfield;
mainpp:=-268435455;
while mainp<>curlist.tailfield do begin if(((mainp)<>-268435455)and(not(
mainp>=himemmin))and(mem[mainp].hh.b0=8)and(((mem[mainp].hh.b1>=40)and(
mem[mainp].hh.b1<=41))))then mainpp:=mainp;mainp:=mem[mainp].hh.rh;end;
if(mainpp<>-268435455)then begin if(mem[mainpp+4].qqqq.b1=mainf)then
begin mainp:=mem[mainpp].hh.rh;
while not(mainp>=himemmin)and((mem[mainp].hh.b0=12)or(mem[mainp].hh.b0=3
)or(mem[mainp].hh.b0=4)or(mem[mainp].hh.b0=5)or((mem[mainp].hh.b0=8)and(
mem[mainp].hh.b1<=4)))do mainp:=mem[mainp].hh.rh;
if not(mainp>=himemmin)and(mem[mainp].hh.b0=10)then begin mainppp:=mem[
mainp].hh.rh;
while not(mainppp>=himemmin)and((mem[mainppp].hh.b0=12)or(mem[mainppp].
hh.b0=3)or(mem[mainppp].hh.b0=4)or(mem[mainppp].hh.b0=5)or((mem[mainppp]
.hh.b0=8)and(mem[mainppp].hh.b1<=4)))do mainppp:=mem[mainppp].hh.rh;
if mainppp=curlist.tailfield then begin tempptr:=newnativewordnode(mainf
,mem[mainpp+4].qqqq.b2+1+mem[curlist.tailfield+4].qqqq.b2);maink:=0;
for t:=0 to mem[mainpp+4].qqqq.b2-1 do begin setnativechar(tempptr,maink
,getnativechar(mainpp,t));incr(maink);end;
setnativechar(tempptr,maink,32);incr(maink);
for t:=0 to mem[curlist.tailfield+4].qqqq.b2-1 do begin setnativechar(
tempptr,maink,getnativechar(curlist.tailfield,t));incr(maink);end;
setnativemetrics(tempptr,(eqtb[7892342].int>0));
t:=mem[tempptr+1].int-mem[mainpp+1].int-mem[curlist.tailfield+1].int;
freenode(tempptr,mem[tempptr+4].qqqq.b0);
if t<>mem[fontglue[mainf]+1].int then begin tempptr:=newkern(t-mem[
fontglue[mainf]+1].int);mem[tempptr].hh.b1:=3;
mem[tempptr].hh.rh:=mem[mainp].hh.rh;mem[mainp].hh.rh:=tempptr;
end end end end end end;if curptr<>-268435455 then goto 60 else goto 21;
end;mains:=eqtb[4549928+curchr].hh.rh mod 65536;
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;curptr:=-268435455;
spaceclass:=eqtb[4549928+curchr].hh.rh div 65536;
if(eqtb[7892343].int>0)and spaceclass<>4096 then begin if prevclass=(
4095)then begin if(curinput.statefield<>0)or(curinput.indexfield<>4)then
begin findsaelement(6,(4095)*4096+spaceclass,false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcmd<>11 then curcmd:=12;curtok:=(curcmd*2097152)+curchr;backinput;
curinput.indexfield:=4;begintokenlist(mem[curptr+1].hh.rh,17);goto 60;
end end end else begin findsaelement(6,prevclass*4096+spaceclass,false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcmd<>11 then curcmd:=12;curtok:=(curcmd*2097152)+curchr;backinput;
curinput.indexfield:=4;begintokenlist(mem[curptr+1].hh.rh,17);
prevclass:=(4095);goto 60;end;end;prevclass:=spaceclass;end;
mainf:=eqtb[1206823].hh.rh;bchar:=fontbchar[mainf];
falsebchar:=fontfalsebchar[mainf];
if curlist.modefield>0 then if eqtb[7892314].int<>curlist.auxfield.hh.rh
then fixlanguage;begin ligstack:=avail;
if ligstack=-268435455 then ligstack:=getavail else begin avail:=mem[
ligstack].hh.rh;mem[ligstack].hh.rh:=-268435455;
ifdef('STAT')incr(dynused);endif('STAT')end;end;
mem[ligstack].hh.b0:=mainf;curl:=curchr;mem[ligstack].hh.b1:=curl;
curq:=curlist.tailfield;
if cancelboundary then begin cancelboundary:=false;maink:=0;
end else maink:=bcharlabel[mainf];if maink=0 then goto 92;curr:=curl;
curl:=65536;goto 111;80:{1089:}
if curl<65536 then begin if mem[curq].hh.rh>-268435455 then if mem[
curlist.tailfield].hh.b1=hyphenchar[mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-268435455 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end{:1089};
90:{1090:}if ligstack=-268435455 then goto 21;curq:=curlist.tailfield;
curl:=mem[ligstack].hh.b1;91:if not(ligstack>=himemmin)then goto 95;
92:if(effectivechar(false,mainf,curchr)>fontec[mainf])or(effectivechar(
false,mainf,curchr)<fontbc[mainf])then begin charwarning(mainf,curchr);
begin mem[ligstack].hh.rh:=avail;avail:=ligstack;
ifdef('STAT')decr(dynused);endif('STAT')end;goto 60;end;
maini:=effectivecharinfo(mainf,curl);
if not(maini.b0>0)then begin charwarning(mainf,curchr);
begin mem[ligstack].hh.rh:=avail;avail:=ligstack;
ifdef('STAT')decr(dynused);endif('STAT')end;goto 60;end;
mem[curlist.tailfield].hh.rh:=ligstack;
curlist.tailfield:=ligstack{:1090};100:{1092:}getnext;
if curcmd=11 then goto 101;if curcmd=12 then goto 101;
if curcmd=68 then goto 101;xtoken;if curcmd=11 then goto 101;
if curcmd=12 then goto 101;if curcmd=68 then goto 101;
if curcmd=16 then begin scancharnum;curchr:=curval;goto 101;end;
if curcmd=65 then bchar:=65536;curr:=bchar;ligstack:=-268435455;
goto 110;101:mains:=eqtb[4549928+curchr].hh.rh mod 65536;
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;curptr:=-268435455;
spaceclass:=eqtb[4549928+curchr].hh.rh div 65536;
if(eqtb[7892343].int>0)and spaceclass<>4096 then begin if prevclass=(
4095)then begin if(curinput.statefield<>0)or(curinput.indexfield<>4)then
begin findsaelement(6,(4095)*4096+spaceclass,false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcmd<>11 then curcmd:=12;curtok:=(curcmd*2097152)+curchr;backinput;
curinput.indexfield:=4;begintokenlist(mem[curptr+1].hh.rh,17);goto 60;
end end end else begin findsaelement(6,prevclass*4096+spaceclass,false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcmd<>11 then curcmd:=12;curtok:=(curcmd*2097152)+curchr;backinput;
curinput.indexfield:=4;begintokenlist(mem[curptr+1].hh.rh,17);
prevclass:=(4095);goto 60;end;end;prevclass:=spaceclass;end;
begin ligstack:=avail;
if ligstack=-268435455 then ligstack:=getavail else begin avail:=mem[
ligstack].hh.rh;mem[ligstack].hh.rh:=-268435455;
ifdef('STAT')incr(dynused);endif('STAT')end;end;
mem[ligstack].hh.b0:=mainf;curr:=curchr;mem[ligstack].hh.b1:=curr;
if curr=falsebchar then curr:=65536{:1092};110:{1093:}
if((maini.b2)mod 4)<>1 then goto 80;if curr=65536 then goto 80;
maink:=ligkernbase[mainf]+maini.b3;mainj:=fontinfo[maink].qqqq;
if mainj.b0<=128 then goto 112;
maink:=ligkernbase[mainf]+256*mainj.b2+mainj.b3+32768-256*(128);
111:mainj:=fontinfo[maink].qqqq;
112:if mainj.b1=curr then if mainj.b0<=128 then{1094:}
begin if mainj.b2>=128 then begin if curl<65536 then begin if mem[curq].
hh.rh>-268435455 then if mem[curlist.tailfield].hh.b1=hyphenchar[mainf]
then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-268435455 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
begin mem[curlist.tailfield].hh.rh:=newkern(fontinfo[kernbase[mainf]+256
*mainj.b2+mainj.b3].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;goto 90;end;
if curl=65536 then lfthit:=true else if ligstack=-268435455 then rthit:=
true;begin if interrupt<>0 then pauseforinstructions;end;
case mainj.b2 of 1,5:begin curl:=mainj.b3;
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;end;2,6:begin curr:=mainj.b3;
if ligstack=-268435455 then begin ligstack:=newligitem(curr);
bchar:=65536;end else if(ligstack>=himemmin)then begin mainp:=ligstack;
ligstack:=newligitem(curr);mem[ligstack+1].hh.rh:=mainp;
end else mem[ligstack].hh.b1:=curr;end;3:begin curr:=mainj.b3;
mainp:=ligstack;ligstack:=newligitem(curr);mem[ligstack].hh.rh:=mainp;
end;
7,11:begin if curl<65536 then begin if mem[curq].hh.rh>-268435455 then
if mem[curlist.tailfield].hh.b1=hyphenchar[mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if false then if ligstack=-268435455 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
curq:=curlist.tailfield;curl:=mainj.b3;
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;end;others:begin curl:=mainj.b3;
ligaturepresent:=true;if ligstack=-268435455 then goto 80 else goto 91;
end end;if mainj.b2>4 then if mainj.b2<>7 then goto 80;
if curl<65536 then goto 110;maink:=bcharlabel[mainf];goto 111;end{:1094}
;if mainj.b0=0 then incr(maink)else begin if mainj.b0>=128 then goto 80;
maink:=maink+mainj.b0+1;end;goto 111{:1093};95:{1091:}
mainp:=mem[ligstack+1].hh.rh;
if mainp>-268435455 then begin mem[curlist.tailfield].hh.rh:=mainp;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;tempptr:=ligstack;
ligstack:=mem[tempptr].hh.rh;freenode(tempptr,2);
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;
if ligstack=-268435455 then if mainp>-268435455 then goto 100 else curr
:=bchar else curr:=mem[ligstack].hh.b1;goto 110{:1091}{:1088};
120:if(eqtb[7892343].int>0)and(spaceclass<>4096)and(prevclass<>(4095))
then begin prevclass:=(4095);
findsaelement(6,spaceclass*4096+(4095),false);
if(curptr<>-268435455)and(mem[curptr+1].hh.rh<>-268435455)then begin if
curcs=0 then begin if curcmd=16 then curcmd:=12;
curtok:=(curcmd*2097152)+curchr;end else curtok:=33554431+curcs;
backinput;begintokenlist(mem[curptr+1].hh.rh,17);goto 60;end;end;{1095:}
if eqtb[1205776].hh.rh=membot then begin{1096:}
begin mainp:=fontglue[eqtb[1206823].hh.rh];
if mainp=-268435455 then begin mainp:=newspec(membot);
maink:=parambase[eqtb[1206823].hh.rh]+2;
mem[mainp+1].int:=fontinfo[maink].int;
mem[mainp+2].int:=fontinfo[maink+1].int;
mem[mainp+3].int:=fontinfo[maink+2].int;
fontglue[eqtb[1206823].hh.rh]:=mainp;end;end{:1096};
tempptr:=newglue(mainp);end else tempptr:=newparamglue(12);
mem[curlist.tailfield].hh.rh:=tempptr;curlist.tailfield:=tempptr;
goto 60{:1095};10:end;{:1084}{1338:}procedure giveerrhelp;
begin tokenshow(eqtb[1206304].hh.rh);end;{:1338}{1357:}{559:}
function openfmtfile:boolean;label 40,10;var j:0..bufsize;
begin j:=curinput.locfield;
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
openfmtfile:=true;10:end;{:559}function loadfmtfile:boolean;
label 6666,10;var j,k:integer;p,q:halfword;x:integer;formatengine:^char;
begin{1362:}ifdef('INITEX')if iniversion then begin libcfree(fontinfo);
libcfree(strpool);libcfree(strstart);libcfree(yhash);libcfree(zeqtb);
libcfree(yzmem);end;endif('INITEX')undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'format magic number');writeln(stderr,' = ',x);end;;
if x<>1462916184 then goto 6666;undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'engine name size');writeln(stderr,' = ',x);end;;
if(x<0)or(x>256)then goto 6666;formatengine:=xmallocarray(char,x);
undumpthings(formatengine[0],x);formatengine[x-1]:=0;
if strcmp(enginename,stringcast(formatengine))then begin;
writeln(stdout,'---! ',stringcast(nameoffile+1),' was written by ',
formatengine);libcfree(formatengine);goto 6666;end;
libcfree(formatengine);undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'string pool checksum');writeln(stderr,' = ',x);end;;
if x<>84944223 then begin;
writeln(stdout,'---! ',stringcast(nameoffile+1),
' made by different executable version, strings are different');
goto 6666;end;undumpint(x);if x<>1073741823 then goto 6666;
undumpint(hashhigh);
if(hashhigh<0)or(hashhigh>suphashextra)then goto 6666;
if hashextra<hashhigh then hashextra:=hashhigh;
eqtbtop:=9006998+hashextra;
if hashextra=0 then hashtop:=1205763 else hashtop:=eqtbtop;
yhash:=xmallocarray(twohalves,1+hashtop-hashoffset);
hash:=yhash-hashoffset;hash[1179650].lh:=0;hash[1179650].rh:=0;
for x:=1179651 to hashtop do hash[x]:=hash[1179650];
zeqtb:=xmallocarray(memoryword,eqtbtop+1);eqtb:=zeqtb;
eqtb[1205763].hh.b0:=104;eqtb[1205763].hh.rh:=-268435455;
eqtb[1205763].hh.b1:=0;
for x:=9006999 to eqtbtop do eqtb[x]:=eqtb[1205763];{1465:}
begin undumpint(x);if(x<0)or(x>1)then goto 6666 else eTeXmode:=x;end;
if(eTeXmode=1)then begin{1624:}maxregnum:=32767;maxreghelpline:=66965;
{:1624}end else begin{1623:}maxregnum:=255;maxreghelpline:=66964;{:1623}
end;{:1465}undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:','mem_bot');
writeln(stderr,' = ',x);end;;if x<>membot then goto 6666;
undumpint(memtop);
if debugformatfile then begin write(stderr,'fmtdebug:','mem_top');
writeln(stderr,' = ',memtop);end;;if membot+1100>memtop then goto 6666;
curlist.headfield:=memtop-1;curlist.tailfield:=memtop-1;
pagetail:=memtop-2;memmin:=membot-extramembot;
memmax:=memtop+extramemtop;
yzmem:=xmallocarray(memoryword,memmax-memmin+1);zmem:=yzmem-memmin;
mem:=zmem;undumpint(x);if x<>9006998 then goto 6666;undumpint(x);
if x<>8501 then goto 6666;undumpint(x);if x<>607 then goto 6666{:1362};
{1701:}undumpint(x);if x<>1296847960 then goto 6666;undumpint(x);
if x=1 then mltexenabledp:=true else if x<>0 then goto 6666;{:1701};
{1364:}begin undumpint(x);if x<0 then goto 6666;
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
undumpcheckedthings(0,poolptr,strstart[(65536)-65536],strptr-65535);
strpool:=xmallocarray(packedUTF16code,poolsize);
undumpthings(strpool[0],poolptr);initstrptr:=strptr;
initpoolptr:=poolptr{:1364};{1366:}begin undumpint(x);
if(x<membot+1019)or(x>memtop-15)then goto 6666 else lomemmax:=x;end;
begin undumpint(x);
if(x<membot+20)or(x>lomemmax)then goto 6666 else rover:=x;end;
if(eTeXmode=1)then for k:=0 to 6 do begin undumpint(x);
if(x<-268435455)or(x>lomemmax)then goto 6666 else saroot[k]:=x;end;
p:=membot;q:=rover;repeat undumpthings(mem[p],q+2-p);
if(mem[q].hh.lh>lomemmax-q)or(mem[q+1].hh.rh>lomemmax)or((q>=mem[q+1].hh
.rh)and(mem[q+1].hh.rh<>rover))then goto 6666;p:=q+mem[q].hh.lh;
q:=mem[q+1].hh.rh;until q=rover;undumpthings(mem[p],lomemmax+1-p);
if memmin<membot-2 then begin p:=mem[rover+1].hh.lh;q:=memmin+1;
mem[memmin].hh.rh:=-268435455;mem[memmin].hh.lh:=-268435455;
mem[p+1].hh.rh:=q;mem[rover+1].hh.lh:=q;mem[q+1].hh.rh:=rover;
mem[q+1].hh.lh:=p;mem[q].hh.rh:=1073741823;mem[q].hh.lh:=membot-q;end;
begin undumpint(x);
if(x<lomemmax+1)or(x>memtop-14)then goto 6666 else himemmin:=x;end;
begin undumpint(x);
if(x<-268435455)or(x>memtop)then goto 6666 else avail:=x;end;
memend:=memtop;undumpthings(mem[himemmin],memend+1-himemmin);
undumpint(varused);undumpint(dynused){:1366};{1368:}{1371:}k:=1;
repeat undumpint(x);if(x<1)or(k+x>9006999)then goto 6666;
undumpthings(eqtb[k],x);k:=k+x;undumpint(x);
if(x<0)or(k+x>9006999)then goto 6666;
for j:=k to k+x-1 do eqtb[j]:=eqtb[k-1];k:=k+x;until k>9006998;
if hashhigh>0 then undumpthings(eqtb[9006999],hashhigh);{:1371};
undumpint(parloc);partoken:=33554431+parloc;begin undumpint(x);
if(x<1179650)or(x>hashtop)then goto 6666 else writeloc:=x;end;{1373:}
for p:=0 to 2100 do undumphh(prim[p]);begin undumpint(x);
if(x<1179650)or(x>1194650)then goto 6666 else hashused:=x;end;
p:=1179649;repeat begin undumpint(x);
if(x<p+1)or(x>hashused)then goto 6666 else p:=x;end;undumphh(hash[p]);
until p=hashused;undumpthings(hash[hashused+1],1205762-hashused);
if debugformatfile then begin printcsnames(1179650,1205762);end;
if hashhigh>0 then begin undumpthings(hash[9006999],hashhigh);
if debugformatfile then begin printcsnames(9006999,hashhigh-(9006999));
end;end;undumpint(cscount){:1373}{:1368};{1375:}begin undumpint(x);
if x<7 then goto 6666;if x>supfontmemsize then begin;
writeln(stdout,'---! Must increase the ','font mem size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'font mem size');writeln(stderr,' = ',x);end;;fmemptr:=x;end;
if fmemptr>fontmemsize then fontmemsize:=fmemptr;
fontinfo:=xmallocarray(fmemoryword,fontmemsize);
undumpthings(fontinfo[0],fmemptr);begin undumpint(x);
if x<0 then goto 6666;if x>9000 then begin;
writeln(stdout,'---! Must increase the ','font max');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'font max');writeln(stderr,' = ',x);end;;fontptr:=x;end;{1377:}
begin fontmapping:=xmallocarray(voidpointer,fontmax);
fontlayoutengine:=xmallocarray(voidpointer,fontmax);
fontflags:=xmallocarray(char,fontmax);
fontletterspace:=xmallocarray(scaled,fontmax);
fontcheck:=xmallocarray(fourquarters,fontmax);
fontsize:=xmallocarray(scaled,fontmax);
fontdsize:=xmallocarray(scaled,fontmax);
fontparams:=xmallocarray(fontindex,fontmax);
fontname:=xmallocarray(strnumber,fontmax);
fontarea:=xmallocarray(strnumber,fontmax);
fontbc:=xmallocarray(UTF16code,fontmax);
fontec:=xmallocarray(UTF16code,fontmax);
fontglue:=xmallocarray(halfword,fontmax);
hyphenchar:=xmallocarray(integer,fontmax);
skewchar:=xmallocarray(integer,fontmax);
bcharlabel:=xmallocarray(fontindex,fontmax);
fontbchar:=xmallocarray(ninebits,fontmax);
fontfalsebchar:=xmallocarray(ninebits,fontmax);
charbase:=xmallocarray(integer,fontmax);
widthbase:=xmallocarray(integer,fontmax);
heightbase:=xmallocarray(integer,fontmax);
depthbase:=xmallocarray(integer,fontmax);
italicbase:=xmallocarray(integer,fontmax);
ligkernbase:=xmallocarray(integer,fontmax);
kernbase:=xmallocarray(integer,fontmax);
extenbase:=xmallocarray(integer,fontmax);
parambase:=xmallocarray(integer,fontmax);
for k:=0 to fontptr do fontmapping[k]:=0;
undumpthings(fontcheck[0],fontptr+1);
undumpthings(fontsize[0],fontptr+1);
undumpthings(fontdsize[0],fontptr+1);
undumpcheckedthings(-268435455,1073741823,fontparams[0],fontptr+1);
undumpthings(hyphenchar[0],fontptr+1);
undumpthings(skewchar[0],fontptr+1);
undumpuppercheckthings(strptr,fontname[0],fontptr+1);
undumpuppercheckthings(strptr,fontarea[0],fontptr+1);
undumpthings(fontbc[0],fontptr+1);undumpthings(fontec[0],fontptr+1);
undumpthings(charbase[0],fontptr+1);
undumpthings(widthbase[0],fontptr+1);
undumpthings(heightbase[0],fontptr+1);
undumpthings(depthbase[0],fontptr+1);
undumpthings(italicbase[0],fontptr+1);
undumpthings(ligkernbase[0],fontptr+1);
undumpthings(kernbase[0],fontptr+1);
undumpthings(extenbase[0],fontptr+1);
undumpthings(parambase[0],fontptr+1);
undumpcheckedthings(-268435455,lomemmax,fontglue[0],fontptr+1);
undumpcheckedthings(0,fmemptr-1,bcharlabel[0],fontptr+1);
undumpcheckedthings(0,65536,fontbchar[0],fontptr+1);
undumpcheckedthings(0,65536,fontfalsebchar[0],fontptr+1);end{:1377};
{:1375};{1379:}begin undumpint(x);if x<0 then goto 6666;
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
if(x<-268435455)or(x>1073741823)then goto 6666 else hyphlist[j]:=x;end;
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
undumpthings(trietrc[0],j+1);undumpint(maxhyphchar);begin undumpint(x);
if x<0 then goto 6666;if x>trieopsize then begin;
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
ifdef('INITEX')trienotready:=false endif('INITEX'){:1379};{1381:}
begin undumpint(x);if(x<0)or(x>3)then goto 6666 else interaction:=x;end;
if interactionoption<>4 then interaction:=interactionoption;
begin undumpint(x);
if(x<0)or(x>strptr)then goto 6666 else formatident:=x;end;undumpint(x);
if x<>69069 then goto 6666{:1381};loadfmtfile:=true;goto 10;6666:;
writeln(stdout,'(Fatal format file error; I''m stymied)');
loadfmtfile:=false;10:end;{:1357}{1384:}{1387:}
procedure closefilesandterminate;var k:integer;begin{1441:}
terminatefontmanager;
for k:=0 to 15 do if writeopen[k]then aclose(writefile[k]){:1441};
eqtb[7892313].int:=-1;ifdef('STAT')if eqtb[7892295].int>0 then{1388:}
if logopened then begin writeln(logfile,' ');
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
savesize:1,'s');end{:1388};endif('STAT');{680:}
while curs>-1 do begin if curs>0 then begin dvibuf[dviptr]:=142;
incr(dviptr);if dviptr=dvilimit then dviswap;
end else begin begin dvibuf[dviptr]:=140;incr(dviptr);
if dviptr=dvilimit then dviswap;end;incr(totalpages);end;decr(curs);end;
if totalpages=0 then printnl(66239)else if curs<>-2 then begin begin
dvibuf[dviptr]:=248;incr(dviptr);if dviptr=dvilimit then dviswap;end;
dvifour(lastbop);lastbop:=dvioffset+dviptr-5;dvifour(25400000);
dvifour(473628672);preparemag;dvifour(eqtb[7892281].int);dvifour(maxv);
dvifour(maxh);begin dvibuf[dviptr]:=maxpush div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=maxpush mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(totalpages div 256)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=totalpages mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;{681:}
while fontptr>0 do begin if fontused[fontptr]then dvifontdef(fontptr);
decr(fontptr);end{:681};begin dvibuf[dviptr]:=249;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(lastbop);
begin dvibuf[dviptr]:=7;incr(dviptr);if dviptr=dvilimit then dviswap;
end;ifdef('IPC')k:=7-((3+dvioffset+dviptr)mod 4);
endif('IPC')ifndef('IPC')k:=4+((dvibufsize-dviptr)mod 4);
endifn('IPC')while k>0 do begin begin dvibuf[dviptr]:=223;incr(dviptr);
if dviptr=dvilimit then dviswap;end;decr(k);end;{635:}
if dvilimit=halfbuf then writedvi(halfbuf,dvibufsize-1);
if dviptr>(2147483647-dvioffset)then begin curs:=-2;fatalerror(66226);
end;if dviptr>0 then writedvi(0,dviptr-1){:635};k:=dviclose(dvifile);
if k=0 then begin printnl(66240);print(outputfilename);print(65566);
printint(totalpages);
if totalpages<>1 then print(66241)else print(66242);
if nopdfoutput then begin print(66243);printint(dvioffset+dviptr);
print(66244);end else print(66245);end else begin printnl(66246);
printint(k);print(65566);
if nopdfoutput then printcstring(strerror(k))else print(66247);
print(66248);printnl(66249);print(outputfilename);print(66250);
history:=4;end;end{:680};{1719:}synctexterminate(logopened);{:1719};
if logopened then begin writeln(logfile);aclose(logfile);
selector:=selector-2;if selector=17 then begin printnl(66738);
print(texmflogname);printchar(46);end;end;println;
if(editnamestart<>0)and(interaction>0)then calledit(strpool,
editnamestart,editnamelength,editline);end;{:1387}{1389:}
procedure finalcleanup;label 10;var c:smallnumber;begin c:=curchr;
if c<>1 then eqtb[7892313].int:=-1;if jobname=0 then openlogfile;
while inputptr>0 do if curinput.statefield=0 then endtokenlist else
endfilereading;while openparens>0 do begin print(66739);
decr(openparens);end;if curlevel>1 then begin printnl(40);
printesc(66740);print(66741);printint(curlevel-1);printchar(41);
if(eTeXmode=1)then showsavegroups;end;
while condptr<>-268435455 do begin printnl(40);printesc(66740);
print(66742);printcmdchr(108,curif);
if ifline<>0 then begin print(66743);printint(ifline);end;print(66744);
ifline:=mem[condptr+1].int;curif:=mem[condptr].hh.b1;tempptr:=condptr;
condptr:=mem[condptr].hh.rh;freenode(tempptr,2);end;
if history<>0 then if((history=1)or(interaction<3))then if selector=19
then begin selector:=17;printnl(66745);selector:=19;end;
if c=1 then begin ifdef('INITEX')if iniversion then begin for c:=0 to 4
do if curmark[c]<>-268435455 then deletetokenref(curmark[c]);
if saroot[7]<>-268435455 then if domarks(3,0,saroot[7])then saroot[7]:=
-268435455;for c:=2 to 3 do flushnodelist(discptr[c]);
if lastglue<>1073741823 then deleteglueref(lastglue);storefmtfile;
goto 10;end;endif('INITEX')printnl(66746);goto 10;end;10:end;{:1389}
{1390:}ifdef('INITEX')procedure initprim;
begin nonewcontrolsequence:=false;first:=0;{252:}
primitive(65675,76,1205764);primitive(65676,76,1205765);
primitive(65677,76,1205766);primitive(65678,76,1205767);
primitive(65679,76,1205768);primitive(65680,76,1205769);
primitive(65681,76,1205770);primitive(65682,76,1205771);
primitive(65683,76,1205772);primitive(65684,76,1205773);
primitive(65685,76,1205774);primitive(65686,76,1205775);
primitive(65687,76,1205776);primitive(65688,76,1205777);
primitive(65689,76,1205778);primitive(65690,76,1205779);
primitive(65691,77,1205780);primitive(65692,77,1205781);
primitive(65693,77,1205782);{:252}{256:}primitive(65698,73,1206296);
primitive(65699,73,1206297);primitive(65700,73,1206298);
primitive(65701,73,1206299);primitive(65702,73,1206300);
primitive(65703,73,1206301);primitive(65704,73,1206302);
primitive(65705,73,1206303);primitive(65706,73,1206304);{:256}{264:}
primitive(65720,74,7892264);primitive(65721,74,7892265);
primitive(65722,74,7892266);primitive(65723,74,7892267);
primitive(65724,74,7892268);primitive(65725,74,7892269);
primitive(65726,74,7892270);primitive(65727,74,7892271);
primitive(65728,74,7892272);primitive(65729,74,7892273);
primitive(65730,74,7892274);primitive(65731,74,7892275);
primitive(65732,74,7892276);primitive(65733,74,7892277);
primitive(65734,74,7892278);primitive(65735,74,7892279);
primitive(65736,74,7892280);primitive(65737,74,7892281);
primitive(65738,74,7892282);primitive(65739,74,7892283);
primitive(65740,74,7892284);primitive(65741,74,7892285);
primitive(65742,74,7892286);primitive(65743,74,7892287);
primitive(65744,74,7892288);primitive(65745,74,7892289);
primitive(65746,74,7892290);primitive(65747,74,7892291);
primitive(65748,74,7892292);primitive(65749,74,7892293);
primitive(65750,74,7892294);primitive(65751,74,7892295);
primitive(65752,74,7892296);primitive(65753,74,7892297);
primitive(65754,74,7892298);primitive(65755,74,7892299);
primitive(65756,74,7892300);primitive(65757,74,7892301);
primitive(65758,74,7892302);primitive(65759,74,7892303);
primitive(65760,74,7892304);primitive(65761,74,7892305);
primitive(65762,74,7892306);primitive(65763,74,7892307);
primitive(65764,74,7892308);primitive(65765,74,7892309);
primitive(65766,74,7892310);primitive(65767,74,7892311);
primitive(65768,74,7892312);primitive(65769,74,7892313);
primitive(65770,74,7892314);primitive(65771,74,7892315);
primitive(65772,74,7892316);primitive(65773,74,7892317);
primitive(65774,74,7892318);if mltexp then begin mltexenabledp:=true;
if false then primitive(65775,74,7892319);primitive(65776,74,7892320);
primitive(65777,74,7892321);end;primitive(65778,74,7892322);
primitive(65784,103,0);primitive(65779,74,7892323);
primitive(65780,74,7892324);primitive(65781,74,7892337);
primitive(65782,74,7892338);{:264}{274:}primitive(65787,75,9006720);
primitive(65788,75,9006721);primitive(65789,75,9006722);
primitive(65790,75,9006723);primitive(65791,75,9006724);
primitive(65792,75,9006725);primitive(65793,75,9006726);
primitive(65794,75,9006727);primitive(65795,75,9006728);
primitive(65796,75,9006729);primitive(65797,75,9006730);
primitive(65798,75,9006731);primitive(65799,75,9006732);
primitive(65800,75,9006733);primitive(65801,75,9006734);
primitive(65802,75,9006735);primitive(65803,75,9006736);
primitive(65804,75,9006737);primitive(65805,75,9006738);
primitive(65806,75,9006739);primitive(65807,75,9006740);
primitive(65808,75,9006741);primitive(65809,75,9006742);{:274}{295:}
primitive(32,64,0);primitive(47,44,0);primitive(65821,45,0);
primitive(65822,92,0);primitive(65823,40,0);primitive(65824,41,0);
primitive(65825,61,0);primitive(65826,16,0);primitive(65817,110,0);
primitive(65827,15,0);primitive(65828,15,1);primitive(65829,15,1);
primitive(65830,94,0);primitive(65818,67,0);primitive(65831,62,0);
hash[1194652].rh:=65831;eqtb[1194652]:=eqtb[curval];
primitive(65832,105,0);primitive(65833,90,0);primitive(65834,78,0);
primitive(65835,32,0);primitive(65836,36,0);primitive(65837,39,0);
primitive(65618,37,0);primitive(65641,18,0);primitive(65838,46,0);
primitive(65839,46,1);primitive(65840,46,1);primitive(65841,17,0);
primitive(65842,17,1);primitive(65843,17,1);primitive(65844,17,2);
primitive(65845,17,2);primitive(65846,54,0);primitive(65847,93,0);
primitive(65848,34,0);primitive(65849,65,0);primitive(65850,106,0);
primitive(65814,106,1);primitive(65623,55,0);primitive(65851,63,0);
primitive(65852,85,1206295);primitive(65853,42,0);primitive(65854,81,0);
primitive(65855,66,0);primitive(65856,66,1);primitive(65857,66,1);
primitive(65858,98,0);primitive(65859,0,1114112);
hash[1194657].rh:=65859;eqtb[1194657]:=eqtb[curval];
primitive(65860,100,0);primitive(65861,112,0);
primitive(65707,72,membot);primitive(65642,38,0);primitive(65862,33,0);
primitive(65863,56,0);primitive(65864,35,0);{:295}{364:}
primitive(65926,13,1114112);parloc:=curval;partoken:=33554431+parloc;
{:364}{410:}primitive(65962,107,0);primitive(65963,107,1);{:410}{418:}
primitive(65964,113,0);primitive(65965,113,1);primitive(65966,113,2);
primitive(65967,113,3);primitive(65968,113,4);{:418}{445:}
primitive(65785,91,membot+0);primitive(65811,91,membot+1);
primitive(65695,91,membot+2);primitive(65696,91,membot+3);{:445}{450:}
primitive(66012,80,105);primitive(66013,80,1);primitive(66014,83,0);
primitive(66015,83,1);primitive(66016,84,1);primitive(66017,84,3);
primitive(66018,84,2);primitive(66019,71,0);primitive(66020,71,1);
primitive(66021,71,2);primitive(66022,71,4);primitive(66023,71,5);
primitive(66024,71,12);primitive(66025,71,13);primitive(66026,71,16);
primitive(66027,71,17);primitive(66028,71,18);{:450}{503:}
primitive(66096,111,0);primitive(66097,111,1);primitive(66098,111,2);
primitive(66099,111,3);primitive(66100,111,4);primitive(66101,111,6);
primitive(66102,111,16);primitive(66103,111,17);primitive(66104,111,22);
primitive(66105,111,23);primitive(66106,111,24);primitive(66107,111,25);
primitive(66108,111,26);primitive(66109,111,18);primitive(66110,111,29);
primitive(66111,111,30);primitive(66112,111,40);primitive(66113,111,38);
primitive(66114,111,39);{:503}{522:}primitive(66146,108,0);
primitive(66147,108,1);primitive(66148,108,2);primitive(66149,108,3);
primitive(66150,108,4);primitive(66151,108,5);primitive(66152,108,6);
primitive(66153,108,7);primitive(66154,108,8);primitive(66155,108,9);
primitive(66156,108,10);primitive(66157,108,11);primitive(66158,108,12);
primitive(66159,108,13);primitive(66160,108,14);primitive(66161,108,15);
primitive(66162,108,16);primitive(66163,108,21);{:522}{526:}
primitive(66165,109,2);hash[1194654].rh:=66165;
eqtb[1194654]:=eqtb[curval];primitive(66166,109,4);
primitive(66167,109,3);{:526}{588:}primitive(66194,89,0);
hash[1196762].rh:=66194;eqtb[1196762]:=eqtb[curval];{:588}{828:}
primitive(66326,4,1114113);primitive(66327,5,1114114);
hash[1194651].rh:=66327;eqtb[1194651]:=eqtb[curval];
primitive(66328,5,1114115);hash[1194655].rh:=66329;
hash[1194656].rh:=66329;eqtb[1194656].hh.b0:=9;
eqtb[1194656].hh.rh:=memtop-11;eqtb[1194656].hh.b1:=1;
eqtb[1194655]:=eqtb[1194656];eqtb[1194655].hh.b0:=118;{:828}{1037:}
primitive(66406,82,0);primitive(66407,82,1);primitive(66408,82,2);
primitive(66409,82,3);primitive(66410,82,4);primitive(66411,82,5);
primitive(66412,82,6);primitive(66413,82,7);{:1037}{1106:}
primitive(65631,14,0);primitive(66459,14,1);{:1106}{1112:}
primitive(66460,26,4);primitive(66461,26,0);primitive(66462,26,1);
primitive(66463,26,2);primitive(66464,26,3);primitive(66465,27,4);
primitive(66466,27,0);primitive(66467,27,1);primitive(66468,27,2);
primitive(66469,27,3);primitive(65624,28,5);primitive(65603,29,1);
primitive(65630,30,99);{:1112}{1125:}primitive(66487,21,1);
primitive(66488,21,0);primitive(66489,22,1);primitive(66490,22,0);
primitive(65709,20,0);primitive(66491,20,1);primitive(66492,20,2);
primitive(66401,20,3);primitive(66493,20,4);primitive(66403,20,5);
primitive(66494,20,109);primitive(66495,31,99);primitive(66496,31,100);
primitive(66497,31,101);primitive(66498,31,102);{:1125}{1142:}
primitive(66514,43,1);primitive(66515,43,0);{:1142}{1161:}
primitive(66525,25,12);primitive(66526,25,11);primitive(66527,25,10);
primitive(66528,23,0);primitive(66529,23,1);primitive(66530,24,0);
primitive(66531,24,1);{:1161}{1168:}primitive(45,47,1);
primitive(65639,47,0);{:1168}{1195:}primitive(66562,48,0);
primitive(66563,48,1);{:1195}{1210:}primitive(66276,50,16);
primitive(66277,50,17);primitive(66278,50,18);primitive(66279,50,19);
primitive(66280,50,20);primitive(66281,50,21);primitive(66282,50,22);
primitive(66283,50,23);primitive(66285,50,26);primitive(66284,50,27);
primitive(66564,51,0);primitive(66289,51,1);primitive(66290,51,2);
{:1210}{1223:}primitive(66271,53,0);primitive(66272,53,2);
primitive(66273,53,4);primitive(66274,53,6);{:1223}{1232:}
primitive(66584,52,0);primitive(66585,52,1);primitive(66586,52,2);
primitive(66587,52,3);primitive(66588,52,4);primitive(66589,52,5);
{:1232}{1242:}primitive(66286,49,30);primitive(66287,49,31);
hash[1194653].rh:=66287;eqtb[1194653]:=eqtb[curval];{:1242}{1262:}
primitive(66609,95,1);primitive(66610,95,2);primitive(66611,95,4);
primitive(66612,99,0);primitive(66613,99,1);primitive(66614,99,2);
primitive(66615,99,3);{:1262}{1273:}primitive(66632,96,0);
primitive(66633,96,1);{:1273}{1276:}primitive(66634,97,0);
primitive(66635,97,1);primitive(66636,97,8);primitive(66637,97,8);
primitive(66638,97,9);primitive(66639,97,9);primitive(66640,97,2);
primitive(66641,97,3);primitive(66642,97,4);primitive(66643,97,5);
primitive(66644,97,6);if mltexp then begin primitive(66645,97,7);end;
{:1276}{1284:}primitive(65715,86,1207592);primitive(65719,86,5664040);
primitive(66650,87,5664040);primitive(66651,87,5664040);
primitive(66652,87,5664041);primitive(66653,87,5664041);
primitive(65716,86,2321704);primitive(65717,86,3435816);
primitive(65718,86,4549928);primitive(66654,87,4549928);
primitive(65786,86,7892608);primitive(66655,87,7892608);
primitive(66656,87,7892608);primitive(66657,87,7892609);
primitive(66658,87,7892609);primitive(65712,88,1206824);
primitive(65713,88,1207080);primitive(65714,88,1207336);{:1284}{1304:}
primitive(66377,101,0);primitive(66389,101,1);{:1304}{1308:}
primitive(66673,79,0);primitive(66674,79,1);primitive(66675,79,2);
primitive(66676,79,3);{:1308}{1316:}primitive(65554,102,0);
primitive(65555,102,1);primitive(65556,102,2);primitive(66685,102,3);
{:1316}{1326:}primitive(66686,60,1);primitive(66687,60,0);{:1326}{1331:}
primitive(66688,58,0);primitive(66689,58,1);{:1331}{1340:}
primitive(66695,57,2321704);primitive(66696,57,3435816);{:1340}{1345:}
primitive(66697,19,0);primitive(66698,19,1);primitive(66699,19,2);
primitive(66700,19,3);{:1345}{1398:}primitive(66748,59,0);
primitive(65922,59,1);writeloc:=curval;primitive(66749,59,2);
primitive(66750,59,3);hash[1194660].rh:=66750;
eqtb[1194660]:=eqtb[curval];primitive(66751,59,5);primitive(66752,59,6);
primitive(66753,59,33);primitive(66754,59,35);{:1398}{1706:}
primitive(66977,74,7892351);{:1706};nonewcontrolsequence:=true;end;
endif('INITEX'){:1390}{1392:}ifdef('TEXMF_DEBUG')procedure debughelp;
label 888,10;var k,l,m,n:integer;begin;while true do begin;
printnl(66747);fflush(stdout);read(termin,m);
if m<0 then goto 10 else if m=0 then dumpcore else begin read(termin,n);
case m of{1393:}1:printword(mem[n]);2:printint(mem[n].hh.lh);
3:printint(mem[n].hh.rh);4:printword(eqtb[n]);
5:begin printscaled(fontinfo[n].int);printchar(32);
printint(fontinfo[n].qqqq.b0);printchar(58);
printint(fontinfo[n].qqqq.b1);printchar(58);
printint(fontinfo[n].qqqq.b2);printchar(58);
printint(fontinfo[n].qqqq.b3);end;6:printword(savestack[n]);
7:showbox(n);8:begin breadthmax:=10000;
depththreshold:=poolsize-poolptr-10;shownodelist(n);end;
9:showtokenlist(n,-268435455,1000);10:print(n);11:checkmem(n>0);
12:searchmem(n);13:begin read(termin,l);printcmdchr(n,l);end;
14:for k:=0 to n do print(buffer[k]);15:begin fontinshortdisplay:=0;
shortdisplay(n);end;16:panicking:=not panicking;{:1393}
others:print(63)end;end;end;10:end;endif('TEXMF_DEBUG'){:1392}{:1384}
{1386:}procedure mainbody;begin bounddefault:=0;boundname:='mem_bot';
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
maxstrings:=maxstrings+65536;bounddefault:=100;
boundname:='strings_free';
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
buffer:=xmallocarray(UnicodeScalar,bufsize);
nest:=xmallocarray(liststaterecord,nestsize);
savestack:=xmallocarray(memoryword,savesize);
inputstack:=xmallocarray(instaterecord,stacksize);
inputfile:=xmallocarray(unicodefile,maxinopen);
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
memtop-membot+1);zmem:=yzmem-membot;eqtbtop:=9006998+hashextra;
if hashextra=0 then hashtop:=1205763 else hashtop:=eqtbtop;
yhash:=xmallocarray(twohalves,1+hashtop-hashoffset);
hash:=yhash-hashoffset;hash[1179650].lh:=0;hash[1179650].rh:=0;
for hashused:=1179651 to hashtop do hash[hashused]:=hash[1179650];
zeqtb:=xmallocarray(memoryword,eqtbtop);eqtb:=zeqtb;
strstart:=xmallocarray(poolpointer,maxstrings);
strpool:=xmallocarray(packedUTF16code,poolsize);
fontinfo:=xmallocarray(fmemoryword,fontmemsize);end;
endif('INITEX')history:=3;;if readyalready=314159 then goto 1;{14:}
bad:=0;if(halferrorline<30)or(halferrorline>errorline-15)then bad:=1;
if maxprintline<60 then bad:=2;if dvibufsize mod 8<>0 then bad:=3;
if membot+1100>memtop then bad:=4;if 8501>15000 then bad:=5;
if maxinopen>=128 then bad:=6;if memtop<267 then bad:=7;{:14}{133:}
ifdef('INITEX')if(memmin<>membot)or(memmax<>memtop)then bad:=10;
endif('INITEX')if(memmin>membot)or(memmax<memtop)then bad:=10;
if(0>0)or(65535<32767)then bad:=11;
if(-268435455>0)or(1073741823<1073741823)then bad:=12;
if(0<-268435455)or(65535>1073741823)then bad:=13;
if(membot-supmainmemory<-268435455)or(memtop+supmainmemory>=1073741823)
then bad:=14;if(9000<-268435455)or(9000>1073741823)then bad:=15;
if fontmax>9000 then bad:=16;
if(savesize>1073741823)or(maxstrings>1073741823)then bad:=17;
if bufsize>1073741823 then bad:=18;if 65535<65535 then bad:=19;{:133}
{320:}if 42561429+hashextra>1073741823 then bad:=21;
if(hashoffset<0)or(hashoffset>1179650)then bad:=42;{:320}{557:}
if formatdefaultlength>maxint then bad:=31;{:557}{1303:}
if 2*1073741823<memtop-memmin then bad:=41;{:1303}
if bad>0 then begin writeln(stdout,
'Ouch---my internal constants have been clobbered!','---case ',bad:1);
goto 9999;end;initialize;
ifdef('INITEX')if iniversion then begin if not getstringsstarted then
goto 9999;initprim;initstrptr:=strptr;initpoolptr:=poolptr;
fixdateandtime;end;endif('INITEX')readyalready:=314159;1:{55:}
selector:=17;tally:=0;termoffset:=0;fileoffset:=0;{:55}{65:}
if srcspecialsp or filelineerrorstylep or parsefirstlinep then write(
stdout,'This is XeTeX, Version 3.141592653','-2.6','-0.999998')else
write(stdout,'This is XeTeX, Version 3.141592653','-2.6','-0.999998');
write(stdout,versionstring);
if formatident=0 then writeln(stdout,' (preloaded format=',dumpname,')')
else begin print(formatident);println;end;
if shellenabledp then begin write(stdout,' ');
if restrictedshell then begin write(stdout,'restricted ');end;
writeln(stdout,'\write18 enabled.');end;
if srcspecialsp then begin writeln(stdout,' Source specials enabled.')
end;if translatefilename then begin write(stdout,
' (WARNING: translate-file "');fputs(translatefilename,stdout);
writeln(stdout,'" ignored)');end;fflush(stdout);{:65}{563:}jobname:=0;
nameinprogress:=false;logopened:=false;{:563}{568:}outputfilename:=0;
if nopdfoutput then outputfileextension:=66185 else outputfileextension
:=66186;{:568};{1391:}begin{361:}begin inputptr:=0;maxinstack:=0;
sourcefilenamestack[0]:=0;fullsourcefilenamestack[0]:=0;inopen:=0;
openparens:=0;maxbufstack:=0;grpstack[0]:=0;ifstack[0]:=-268435455;
paramptr:=0;maxparamstack:=0;first:=bufsize;repeat buffer[first]:=0;
decr(first);until first=0;buffer[0]:=0;scannerstatus:=0;
warningindex:=-268435455;first:=1;curinput.statefield:=33;
curinput.startfield:=1;curinput.indexfield:=0;line:=0;
curinput.namefield:=0;forceeof:=false;alignstate:=1000000;
if not initterminal then goto 9999;curinput.limitfield:=last;
first:=last+1;end{:361};{1451:}
ifdef('INITEX')if(etexp or(buffer[curinput.locfield]=42))and(formatident
=66713)then begin nonewcontrolsequence:=false;{1399:}
primitive(66755,59,41);primitive(66756,59,42);primitive(66757,59,43);
primitive(66758,59,46);primitive(66759,73,1206306);
primitive(66760,59,23);{:1399}{1452:}primitive(66816,71,3);
primitive(66817,71,19);primitive(66115,111,5);primitive(66818,71,27);
primitive(66819,111,33);primitive(66820,71,28);primitive(66821,71,29);
primitive(66822,71,30);primitive(66823,71,31);primitive(66824,71,32);
primitive(66825,71,33);primitive(66826,71,34);primitive(66827,71,35);
primitive(66828,71,36);primitive(66829,71,37);primitive(66830,71,38);
primitive(66831,71,39);primitive(66832,71,40);primitive(66833,71,41);
primitive(66834,71,42);primitive(66835,111,34);primitive(66836,111,35);
primitive(66837,111,36);primitive(66838,71,43);primitive(66839,71,44);
primitive(66840,71,45);primitive(66841,71,46);primitive(66842,71,47);
primitive(66843,71,48);primitive(66844,71,49);primitive(66845,71,50);
primitive(66846,71,55);primitive(66847,111,37);primitive(66848,71,51);
primitive(66849,71,52);primitive(66850,71,53);primitive(66851,71,54);
{:1452}{1467:}primitive(66861,73,1206305);primitive(66862,74,7892325);
primitive(66863,74,7892326);primitive(66864,74,7892327);
primitive(66865,74,7892328);primitive(66866,74,7892329);
primitive(66867,74,7892330);primitive(66868,74,7892331);
primitive(66869,74,7892332);primitive(66870,74,7892333);
primitive(66871,74,7892335);{:1467}{1473:}primitive(66885,71,20);
primitive(66886,71,21);{:1473}{1476:}primitive(66887,71,22);
primitive(66888,71,23);primitive(66889,71,24);{:1476}{1479:}
primitive(66890,71,56);primitive(66891,71,57);primitive(66892,71,58);
primitive(66893,71,59);{:1479}{1482:}primitive(66894,71,60);
primitive(66895,71,61);primitive(66896,71,62);{:1482}{1485:}
primitive(66897,19,4);{:1485}{1494:}primitive(66899,19,5);{:1494}{1496:}
primitive(66900,112,1);primitive(66901,112,5);{:1496}{1499:}
primitive(66902,19,6);{:1499}{1502:}primitive(66906,83,2);{:1502}{1507:}
primitive(66288,49,1);{:1507}{1511:}primitive(66910,74,7892334);
primitive(66911,74,7892339);primitive(66912,74,7892341);
primitive(66913,74,7892342);primitive(66914,74,7892343);
primitive(66915,74,7892340);primitive(66916,74,7892344);
primitive(66917,74,7892347);primitive(66918,74,7892348);
primitive(66919,74,7892349);primitive(66920,74,7892350);
primitive(66761,59,44);primitive(66762,59,45);primitive(66921,33,6);
primitive(66922,33,7);primitive(66923,33,10);primitive(66924,33,11);
{:1511}{1558:}primitive(66933,107,2);{:1558}{1570:}
primitive(66935,98,1);{:1570}{1573:}primitive(66164,105,1);
primitive(66936,108,17);primitive(66937,108,18);primitive(66938,108,19);
primitive(66939,108,20);{:1573}{1581:}primitive(66623,95,8);{:1581}
{1589:}primitive(66945,71,67);primitive(66946,71,68);
primitive(66947,71,69);primitive(66948,71,70);{:1589}{1612:}
primitive(66952,71,25);primitive(66953,71,26);primitive(66954,71,63);
primitive(66955,71,64);{:1612}{1616:}primitive(66956,71,65);
primitive(66957,71,66);{:1616}{1620:}primitive(66958,18,5);
primitive(66959,113,5);primitive(66960,113,6);primitive(66961,113,7);
primitive(66962,113,8);primitive(66963,113,9);{:1620}{1672:}
primitive(66968,24,2);primitive(66969,24,3);{:1672}{1675:}
primitive(66970,85,1206563);primitive(66971,85,1206564);
primitive(66972,85,1206565);primitive(66973,85,1206566);{:1675}
if buffer[curinput.locfield]=42 then incr(curinput.locfield);
eTeXmode:=1;{1624:}maxregnum:=32767;maxreghelpline:=66965;{:1624}end;
endif('INITEX')if not nonewcontrolsequence then nonewcontrolsequence:=
true else{:1451}
if(formatident=0)or(buffer[curinput.locfield]=38)or dumpline then begin
if formatident<>0 then initialize;if not openfmtfile then goto 9999;
if not loadfmtfile then begin wclose(fmtfile);goto 9999;end;
wclose(fmtfile);eqtb:=zeqtb;
while(curinput.locfield<curinput.limitfield)and(buffer[curinput.locfield
]=32)do incr(curinput.locfield);end;
if(eTeXmode=1)then writeln(stdout,'entering extended mode');
if(eqtb[7892312].int<0)or(eqtb[7892312].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[7892312].int;
if mltexenabledp then begin writeln(stdout,'MLTeX v2.2 enabled');end;
fixdateandtime;
ifdef('INITEX')if trienotready then begin trietrl:=xmallocarray(
triepointer,triesize);trietro:=xmallocarray(triepointer,triesize);
trietrc:=xmallocarray(quarterword,triesize);
triec:=xmallocarray(packedUTF16code,triesize);
trieo:=xmallocarray(trieopcode,triesize);
triel:=xmallocarray(triepointer,triesize);
trier:=xmallocarray(triepointer,triesize);
triehash:=xmallocarray(triepointer,triesize);
trietaken:=xmallocarray(boolean,triesize);triel[0]:=0;triec[0]:=0;
trieptr:=0;trier[0]:=0;hyphstart:=0;
fontmapping:=xmallocarray(voidpointer,fontmax);
fontlayoutengine:=xmallocarray(voidpointer,fontmax);
fontflags:=xmallocarray(char,fontmax);
fontletterspace:=xmallocarray(scaled,fontmax);
fontcheck:=xmallocarray(fourquarters,fontmax);
fontsize:=xmallocarray(scaled,fontmax);
fontdsize:=xmallocarray(scaled,fontmax);
fontparams:=xmallocarray(fontindex,fontmax);
fontname:=xmallocarray(strnumber,fontmax);
fontarea:=xmallocarray(strnumber,fontmax);
fontbc:=xmallocarray(UTF16code,fontmax);
fontec:=xmallocarray(UTF16code,fontmax);
fontglue:=xmallocarray(halfword,fontmax);
hyphenchar:=xmallocarray(integer,fontmax);
skewchar:=xmallocarray(integer,fontmax);
bcharlabel:=xmallocarray(fontindex,fontmax);
fontbchar:=xmallocarray(ninebits,fontmax);
fontfalsebchar:=xmallocarray(ninebits,fontmax);
charbase:=xmallocarray(integer,fontmax);
widthbase:=xmallocarray(integer,fontmax);
heightbase:=xmallocarray(integer,fontmax);
depthbase:=xmallocarray(integer,fontmax);
italicbase:=xmallocarray(integer,fontmax);
ligkernbase:=xmallocarray(integer,fontmax);
kernbase:=xmallocarray(integer,fontmax);
extenbase:=xmallocarray(integer,fontmax);
parambase:=xmallocarray(integer,fontmax);fontptr:=0;fmemptr:=7;
fontname[0]:=66194;fontarea[0]:=65626;hyphenchar[0]:=45;skewchar[0]:=-1;
bcharlabel[0]:=0;fontbchar[0]:=65536;fontfalsebchar[0]:=65536;
fontbc[0]:=1;fontec[0]:=0;fontsize[0]:=0;fontdsize[0]:=0;charbase[0]:=0;
widthbase[0]:=0;heightbase[0]:=0;depthbase[0]:=0;italicbase[0]:=0;
ligkernbase[0]:=0;kernbase[0]:=0;extenbase[0]:=0;
fontglue[0]:=-268435455;fontparams[0]:=7;fontmapping[0]:=0;
parambase[0]:=-1;for fontk:=0 to 6 do fontinfo[fontk].int:=0;end;
endif('INITEX')fontused:=xmallocarray(boolean,fontmax);
for fontk:=0 to fontmax do fontused[fontk]:=false;
randomseed:=(microseconds*1000)+(epochseconds mod 1000000);
initrandoms(randomseed);{813:}
magicoffset:=strstart[(66320)-65536]-9*16{:813};{79:}
if interaction=0 then selector:=16 else selector:=17{:79};
if(curinput.locfield<curinput.limitfield)and(eqtb[1207592+buffer[
curinput.locfield]].hh.rh<>0)then startinput;end{:1391};history:=0;
{1711:}synctexinitcommand;{:1711}maincontrol;finalcleanup;
closefilesandterminate;9999:begin fflush(stdout);readyalready:=0;
if(history<>0)and(history<>1)then uexit(1)else uexit(0);end;end;{:1386}
{1410:}procedure flushstr(s:strnumber);
begin if(s=strptr-1)then begin decr(strptr);
poolptr:=strstart[(strptr)-65536];end;end;
function tokenstostring(p:halfword):strnumber;
begin if selector=21 then pdferror(66118,66119);oldsetting:=selector;
selector:=21;showtokenlist(mem[p].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;tokenstostring:=makestring;end;
procedure scanpdfexttoks;
begin begin if scantoks(false,true)<>0 then end;end;
procedure comparestrings;label 30;var s1,s2:strnumber;
i1,i2,j1,j2:poolpointer;savecurcs:halfword;begin savecurcs:=curcs;
begin if scantoks(false,true)<>0 then end;s1:=tokenstostring(defref);
deletetokenref(defref);curcs:=savecurcs;
begin if scantoks(false,true)<>0 then end;s2:=tokenstostring(defref);
deletetokenref(defref);i1:=strstart[(s1)-65536];
j1:=strstart[(s1+1)-65536];i2:=strstart[(s2)-65536];
j2:=strstart[(s2+1)-65536];
while(i1<j1)and(i2<j2)do begin if strpool[i1]<strpool[i2]then begin
curval:=-1;goto 30;end;if strpool[i1]>strpool[i2]then begin curval:=1;
goto 30;end;incr(i1);incr(i2);end;
if(i1=j1)and(i2=j2)then curval:=0 else if i1<j1 then curval:=1 else
curval:=-1;30:flushstr(s2);flushstr(s1);curvallevel:=0;end;{:1410}
{1689:}procedure scanfilenamebraced;var savescannerstatus:smallnumber;
savedefref:halfword;savecurcs:halfword;s:strnumber;p:halfword;i:integer;
savestopatspace:boolean;dummy:boolean;
begin savescannerstatus:=scannerstatus;savedefref:=defref;
savecurcs:=curcs;curcs:=warningindex;if scantoks(false,true)<>0 then;
oldsetting:=selector;selector:=21;
showtokenlist(mem[defref].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;deletetokenref(defref);
defref:=savedefref;curcs:=savecurcs;scannerstatus:=savescannerstatus;
savestopatspace:=stopatspace;stopatspace:=false;beginname;
for i:=strstart[(s)-65536]to strstart[(s+1)-65536]-1 do dummy:=morename(
strpool[i]);stopatspace:=savestopatspace;end;{:1689}{1738:}
function getnullstr:strnumber;begin getnullstr:=65626;end;{:1738}
