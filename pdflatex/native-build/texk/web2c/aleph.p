{4:}{9:}{$C-,A+,D-}ifdef('TEXMF_DEBUG'){$C+,D+}endif('TEXMF_DEBUG'){:9}
program ALEPH;const{11:}membot=0;fontmax=65535;hashoffset=514;
trieopsize=15011;negtrieopsize=-35111;mintrieop=0;maxtrieop=65535;
poolname=TEXMFPOOLNAME;enginename=TEXMFENGINENAME;infmainmemory=2000000;
supmainmemory=256000000;inftriesize=80000;suptriesize=4194303;
infmaxstrings=100000;supmaxstrings=2097151;infstringsfree=100;
supstringsfree=supmaxstrings;infbufsize=500;supbufsize=30000000;
infnestsize=40;supnestsize=4000;infmaxinopen=6;supmaxinopen=127;
infparamsize=60;supparamsize=32767;infsavesize=600;supsavesize=30000000;
infstacksize=200;supstacksize=30000;infdvibufsize=800;
supdvibufsize=65536;infpoolsize=32000;suppoolsize=40000000;
infpoolfree=1000;suppoolfree=suppoolsize;infstringvacancies=8000;
supstringvacancies=suppoolsize-23000;suphyphsize=65535;infhyphsize=610;
supocplistsize=1000000;infocplistsize=1000;supocpbufsize=1000000;
infocpbufsize=1000;supocpstacksize=1000000;infocpstacksize=1000;
infexpanddepth=10;supexpanddepth=10000000;activememsize=50000;
ocpmaxint=268435456;{:11}type{18:}ASCIIcode=0..65535;{:18}{25:}
eightbits=0..65535;realeightbits=0..255;
alphafile=packed file of ASCIIcode;
bytefile=packed file of realeightbits;{:25}{38:}poolpointer=integer;
strnumber=0..2097151;packedASCIIcode=0..65535;{:38}{101:}scaled=integer;
nonnegativeinteger=0..2147483647;smallnumber=0..63;{:101}{109:}{:109}
{113:}quarterword=0..65535;halfword=0..1073741823;twochoices=1..2;
fourchoices=1..4;
#include "texmfmem.h";#include "alephmem.h";wordfile=file of memoryword;
{:113}{150:}glueord=0..4;{:150}{212:}
liststaterecord=record modefield:-237..237;headfield,tailfield:halfword;
eTeXauxfield:halfword;pgfield,mlfield:integer;auxfield:memoryword;
dirsfield:halfword;mathfield:integer;localparfield:halfword;
localparboolfield:boolean;end;{:212}{274:}groupcode=0..17;{:274}{305:}
instaterecord=record statefield,indexfield:quarterword;
startfield,locfield,limitfield,namefield,ocplstackfield:halfword;
ocpnofield:halfword;end;{:305}{556:}internalfontnumber=0..fontmax;
fontindex=integer;{:556}{591:}activeindex=0..activememsize;{:591}{596:}
internalocpnumber=0..65535;ocpindex=integer;{:596}{611:}
internalocplistnumber=0..65535;ocplistindex=integer;
ocplstackindex=integer;{:611}{628:}dviindex=0..dvibufsize;{:628}{956:}
triepointer=0..4194303;{:956}{961:}hyphpointer=0..65535;{:961}{1483:}
savepointer=0..savesize;{:1483}{1643:}{:1643}var{13:}bad:integer;{:13}
{20:}xchr:array[0..255]of ASCIIcode;{:20}{26:}nameoffile:^char;
namelength:0..maxint;{:26}{30:}buffer:^ASCIIcode;first:0..bufsize;
last:0..bufsize;maxbufstack:0..bufsize;terminmode:halfword;
termintranslation:halfword;{:30}{32:}ifdef('INITEX')iniversion:boolean;
dumpoption:boolean;dumpline:boolean;
endif('INITEX')dumpname:constcstring;bounddefault:integer;
boundname:constcstring;mainmemory:integer;extramembot:integer;
memmin:integer;memtop:integer;extramemtop:integer;memmax:integer;
errorline:integer;halferrorline:integer;maxprintline:integer;
ocplistsize:integer;ocpbufsize:integer;ocpstacksize:integer;
maxstrings:integer;stringsfree:integer;stringvacancies:integer;
poolsize:integer;poolfree:integer;hyphsize:integer;triesize:integer;
bufsize:integer;stacksize:integer;maxinopen:integer;paramsize:integer;
nestsize:integer;savesize:integer;dvibufsize:integer;
expanddepth:integer;quotedfilename:boolean;specialloc:halfword;
specialtoken:halfword;parsefirstlinep:cinttype;
filelineerrorstylep:cinttype;haltonerrorp:boolean;
haltingonerrorp:boolean;srcspecialsp:boolean;
insertsrcspecialauto:boolean;insertsrcspecialeverypar:boolean;
insertsrcspecialeveryparend:boolean;insertsrcspecialeverycr:boolean;
insertsrcspecialeverymath:boolean;insertsrcspecialeveryhbox:boolean;
insertsrcspecialeveryvbox:boolean;insertsrcspecialeverydisplay:boolean;
{:32}{39:}strpool:^packedASCIIcode;strstartar:^poolpointer;
poolptr:poolpointer;strptr:strnumber;initpoolptr:poolpointer;
initstrptr:strnumber;{:39}{50:}ifdef('INITEX')poolfile:alphafile;
endif('INITEX'){:50}{54:}logfile:alphafile;termoutmode:halfword;
termouttranslation:halfword;selector:0..21;dig:array[0..22]of 0..15;
tally:integer;termoffset:0..maxprintline;fileoffset:0..maxprintline;
trickbuf:array[0..255]of ASCIIcode;trickcount:integer;
firstcount:integer;{:54}{73:}interaction:0..3;interactionoption:0..4;
{:73}{76:}deletionsallowed:boolean;setboxallowed:boolean;history:0..3;
errorcount:-1..100;{:76}{79:}helpline:array[0..5]of strnumber;
helpptr:0..6;useerrhelp:boolean;{:79}{96:}interrupt:integer;
OKtointerrupt:boolean;{:96}{104:}aritherror:boolean;texremainder:scaled;
{:104}{115:}tempptr:halfword;{:115}{116:}yzmem:^memoryword;
zmem:^memoryword;lomemmax:halfword;himemmin:halfword;{:116}{117:}
varused,dynused:integer;{:117}{118:}avail:halfword;memend:halfword;
{:118}{124:}rover:halfword;{:124}{165:}
ifdef('TEXMF_DEBUG')freearr:packed array[0..9]of boolean;
wasfree:packed array[0..9]of boolean;
wasmemend,waslomax,washimin:halfword;panicking:boolean;
endif('TEXMF_DEBUG'){:165}{173:}fontinshortdisplay:integer;{:173}{181:}
depththreshold:integer;breadthmax:integer;{:181}{213:}
nest:^liststaterecord;nestptr:0..nestsize;maxneststack:0..nestsize;
curlist:liststaterecord;shownmode:-237..237;{:213}{250:}
oldsetting:0..21;systime,sysday,sysmonth,sysyear:integer;{:250}{261:}
hashused:halfword;nonewcontrolsequence:boolean;cscount:integer;{:261}
{276:}savestack:^memoryword;saveptr:0..savesize;
maxsavestack:0..savesize;curlevel:quarterword;curgroup:groupcode;
curboundary:0..savesize;{:276}{291:}magset:integer;{:291}{302:}
curcmd:eightbits;curchr:halfword;curcs:halfword;curtok:halfword;{:302}
{306:}inputstack:^instaterecord;inputptr:0..stacksize;
maxinstack:0..stacksize;curinput:instaterecord;{:306}{309:}
inopen:0..maxinopen;openparens:0..maxinopen;inputfile:^alphafile;
inputfilemode:^halfword;inputfiletranslation:^halfword;line:integer;
linestack:^integer;sourcefilenamestack:^strnumber;
fullsourcefilenamestack:^strnumber;{:309}{310:}scannerstatus:0..5;
warningindex:halfword;defref:halfword;{:310}{313:}paramstack:^halfword;
paramptr:0..paramsize;maxparamstack:integer;{:313}{314:}
alignstate:integer;{:314}{315:}baseptr:0..stacksize;{:315}{338:}
parloc:halfword;partoken:halfword;{:338}{366:}forceeof:boolean;{:366}
{387:}curmark:array[0..4]of halfword;{:387}{392:}longstate:128..131;
{:392}{393:}pstack:array[0..8]of halfword;{:393}{416:}curval:integer;
curval1:integer;curvallevel:0..4;{:416}{445:}radix:smallnumber;{:445}
{454:}curorder:glueord;{:454}{487:}readfile:array[0..15]of alphafile;
readfilemode:array[0..15]of halfword;
readfiletranslation:array[0..15]of halfword;
readopen:array[0..16]of 0..2;{:487}{496:}condptr:halfword;iflimit:0..4;
curif:smallnumber;ifline:integer;{:496}{500:}skipline:integer;{:500}
{519:}curname:strnumber;curarea:strnumber;curext:strnumber;{:519}{520:}
areadelimiter:poolpointer;extdelimiter:poolpointer;{:520}{527:}
formatdefaultlength:integer;TEXformatdefault:^char;{:527}{535:}
nameinprogress:boolean;jobname:strnumber;logopened:boolean;{:535}{540:}
dvifile:bytefile;outputfilename:strnumber;texmflogname:strnumber;{:540}
{547:}tfmfile:bytefile;{:547}{557:}fontptr:internalfontnumber;{:557}
{558:}dimenfont:integer;{:558}{563:}nullcharacter:fourquarters;{:563}
{592:}activeinfo:array[activeindex]of memoryword;
activeminptr:activeindex;activemaxptr:activeindex;
activereal:activeindex;holding:array[activeindex]of ocplistindex;{:592}
{595:}ocpfile:bytefile;{:595}{597:}ocpptr:internalocpnumber;{:597}{612:}
ocplistinfo:^memoryword;ocplistmemptr:ocplistindex;
ocplistmemrunptr:ocplistindex;ocplstackinfo:^memoryword;
ocplstackmemptr:ocplstackindex;ocplstackmemrunptr:ocplstackindex;
ocplistptr:internalocplistnumber;ocplistlist:^ocplistindex;{:612}{626:}
totalpages:integer;maxv:scaled;maxh:scaled;maxpush:integer;
lastbop:integer;deadcycles:integer;doingleaders:boolean;c,f:quarterword;
oval,ocmd:integer;ruleht,ruledp,rulewd:scaled;g:halfword;lq,lr:integer;
{:626}{629:}dvibuf:^realeightbits;halfbuf:integer;dvilimit:integer;
dviptr:integer;dvioffset:integer;dvigone:integer;{:629}{639:}
downptr,rightptr:halfword;{:639}{650:}dvih,dviv:scaled;curh,curv:scaled;
dvif:internalfontnumber;curs:integer;{:650}{678:}packdirection:integer;
specdirection:integer;{:678}{680:}
totalstretch,totalshrink:array[glueord]of scaled;lastbadness:integer;
{:680}{681:}adjusttail:halfword;{:681}{695:}packbeginline:integer;{:695}
{718:}emptyfield:twohalves;nulldelimiter:fourquarters;{:718}{753:}
curmlist:halfword;curstyle:integer;cursize:integer;curmu:scaled;
mlistpenalties:boolean;{:753}{758:}curf:internalfontnumber;
curc:quarterword;curi:fourquarters;{:758}{798:}magicoffset:integer;
{:798}{804:}curalign:halfword;curspan:halfword;curloop:halfword;
alignptr:halfword;curhead,curtail:halfword;{:804}{848:}justbox:halfword;
internalpeninter:integer;internalpenbroken:integer;
internalleftbox:halfword;internalleftboxwidth:integer;
initinternalleftbox:halfword;initinternalleftboxwidth:integer;
internalrightbox:halfword;internalrightboxwidth:integer;
paragraphdir:integer;linebreakdir:integer;breakchtdp:quarterword;
tempnowhatsits:integer;tempnodirs:integer;temporarydir:integer;
dirptr,dirtmp,dirrover:halfword;{:848}{856:}passive:halfword;
printednode:halfword;passnumber:halfword;finalparglue:halfword;{:856}
{858:}activewidth:array[1..7]of scaled;
curactivewidth:array[1..7]of scaled;background:array[1..7]of scaled;
breakwidth:array[1..7]of scaled;{:858}{860:}noshrinkerroryet:boolean;
{:860}{863:}curp:halfword;secondpass:boolean;finalpass:boolean;
threshold:integer;{:863}{868:}minimaldemerits:array[0..3]of integer;
minimumdemerits:integer;bestplace:array[0..3]of halfword;
bestplline:array[0..3]of halfword;{:868}{874:}discwidth:scaled;{:874}
{882:}easyline:halfword;lastspecialline:halfword;firstwidth:scaled;
secondwidth:scaled;firstindent:scaled;secondindent:scaled;{:882}{907:}
bestbet:halfword;fewestdemerits:integer;bestline:halfword;
actuallooseness:integer;linediff:integer;{:907}{927:}
hc:array[0..65]of 0..65536;hn:0..64;ha,hb:halfword;
hf:internalfontnumber;hu:array[0..63]of 0..65536;hyfchar:integer;
curlang,initcurlang:0..255;lhyf,rhyf,initlhyf,initrhyf:integer;
hyfbchar:halfword;maxhyphchar:integer;{:927}{936:}
hyf:array[0..64]of 0..9;initlist:halfword;initlig:boolean;
initlft:boolean;{:936}{941:}hyphenpassed:smallnumber;{:941}{943:}
curl,curr:halfword;curq:halfword;ligstack:halfword;
ligaturepresent:boolean;lfthit,rthit:boolean;{:943}{957:}
trie:^twohalves;hyfdistance:array[1..trieopsize]of smallnumber;
hyfnum:array[1..trieopsize]of smallnumber;
hyfnext:array[1..trieopsize]of quarterword;
opstart:array[0..255]of 0..trieopsize;{:957}{962:}hyphword:^strnumber;
hyphlist:^halfword;hyphlink:^hyphpointer;hyphcount:integer;
hyphnext:integer;{:962}{979:}
ifdef('INITEX')trieophash:array[negtrieopsize..trieopsize]of 0..
trieopsize;trieused:array[0..255]of quarterword;
trieoplang:array[1..trieopsize]of 0..255;
trieopval:array[1..trieopsize]of quarterword;trieopptr:0..trieopsize;
endif('INITEX'){:979}{983:}ifdef('INITEX')triec:^ASCIIcode;
trieo:^quarterword;triel:^triepointer;trier:^triepointer;
trieptr:triepointer;triehash:^triepointer;endif('INITEX'){:983}{986:}
ifdef('INITEX')trietaken:^boolean;triemin:^triepointer;
triemax:triepointer;trienotready:boolean;endif('INITEX'){:986}{1007:}
bestheightplusdepth:scaled;{:1007}{1016:}pagetail:halfword;
pagecontents:0..2;pagemaxdepth:scaled;bestpagebreak:halfword;
leastpagecost:integer;bestsize:scaled;{:1016}{1018:}
pagesofar:array[0..7]of scaled;lastglue:halfword;lastpenalty:integer;
lastkern:scaled;lastnodetype:integer;insertpenalties:integer;{:1018}
{1025:}outputactive:boolean;{:1025}{1068:}mainf:internalfontnumber;
maini:fourquarters;mainj:fourquarters;maink:fontindex;mainp:halfword;
mains:integer;bchar:halfword;falsebchar:halfword;cancelboundary:boolean;
leftghost:boolean;rightghost:boolean;newleftghost:boolean;
newrightghost:boolean;insdisc:boolean;kglue:integer;
fontgluespec:halfword;{:1068}{1111:}curbox:halfword;{:1111}{1303:}
aftertoken:halfword;{:1303}{1318:}longhelpseen:boolean;{:1318}{1336:}
formatident:strnumber;{:1336}{1342:}fmtfile:wordfile;{:1342}{1373:}
readyalready:integer;{:1373}{1384:}
outsidestringarray:array[0..1000]of 0..255;
writefile:array[0..15]of alphafile;
writefilemode:array[0..15]of halfword;
writefiletranslation:array[0..15]of halfword;
writeopen:array[0..17]of boolean;negwd:scaled;poswd:scaled;neght:scaled;
dvidirection:integer;dirprimary:array[0..31]of 0..31;
dirsecondary:array[0..31]of 0..31;dirtertiary:array[0..31]of 0..31;
dirrearrange:array[0..3]of 0..31;dirnames:array[0..3]of strnumber;
textdirptr:halfword;textdirtmp:halfword;{:1384}{1387:}writeloc:halfword;
{:1387}{1457:}eTeXmode:0..1;etexp:boolean;{:1457}{1465:}
eofseen:^boolean;{:1465}{1507:}pseudofiles:halfword;{:1507}{1530:}
grpstack:^savepointer;ifstack:^halfword;{:1530}{1571:}
maxregnum:halfword;maxreghelpline:strnumber;{:1571}{1573:}
samark:halfword;curptr:halfword;sanull:memoryword;{:1573}{1592:}
sachain:halfword;salevel:quarterword;{:1592}{1599:}
lastlinefill:halfword;dolastlinefit:boolean;activenodesize:smallnumber;
fillwidth:array[0..2]of scaled;bestplshort:array[0..3]of scaled;
bestplglue:array[0..3]of scaled;{:1599}{1615:}hyphstart:triepointer;
hyphindex:triepointer;{:1615}{1616:}discptr:array[1..3]of halfword;
{:1616}{1624:}editnamestart:poolpointer;editnamelength,editline:integer;
ipcon:cinttype;stopatspace:boolean;{:1624}{1626:}savestrptr:strnumber;
savepoolptr:poolpointer;shellenabledp:cinttype;restrictedshell:cinttype;
outputcomment:^char;k,l:0..65535;{:1626}{1628:}debugformatfile:boolean;
{:1628}{1634:}expanddepthcount:integer;{:1634}{1645:}
otpinitinputstart:halfword;otpinitinputlast:halfword;
otpinitinputend:halfword;otpi:halfword;otpinitinputbuf:^quarterword;
otpinputstart:halfword;otpinputlast:halfword;otpinputend:halfword;
otpinputbuf:^quarterword;otpoutputend:halfword;
otpoutputbuf:^quarterword;otpstackused:halfword;otpstacklast:halfword;
otpstacknew:halfword;otpstackbuf:^quarterword;otppc:halfword;
otpcalcptr:halfword;otpcalcs:^halfword;otpstateptr:halfword;
otpstates:^halfword;otpinputchar:halfword;otpcalculatedchar:halfword;
otpnoinputchars:halfword;otpinstruction:halfword;otpinstr:halfword;
otparg:halfword;otpfirstarg:halfword;otpsecondarg:halfword;
otpinputocp:halfword;otpcounter:halfword;otpfinished:boolean;
otpextstr:integer;otpextstrarg:integer;otpexti:integer;{:1645}
procedure initialize;var{19:}i:integer;{:19}{163:}k:integer;{:163}{963:}
z:hyphpointer;{:963}begin{8:}{21:}xchr[32]:=' ';xchr[33]:='!';
xchr[34]:='"';xchr[35]:='#';xchr[36]:='$';xchr[37]:='%';xchr[38]:='&';
xchr[39]:='''';xchr[40]:='(';xchr[41]:=')';xchr[42]:='*';xchr[43]:='+';
xchr[44]:=',';xchr[45]:='-';xchr[46]:='.';xchr[47]:='/';xchr[48]:='0';
xchr[49]:='1';xchr[50]:='2';xchr[51]:='3';xchr[52]:='4';xchr[53]:='5';
xchr[54]:='6';xchr[55]:='7';xchr[56]:='8';xchr[57]:='9';xchr[58]:=':';
xchr[59]:=';';xchr[60]:='<';xchr[61]:='=';xchr[62]:='>';xchr[63]:='?';
xchr[64]:='@';xchr[65]:='A';xchr[66]:='B';xchr[67]:='C';xchr[68]:='D';
xchr[69]:='E';xchr[70]:='F';xchr[71]:='G';xchr[72]:='H';xchr[73]:='I';
xchr[74]:='J';xchr[75]:='K';xchr[76]:='L';xchr[77]:='M';xchr[78]:='N';
xchr[79]:='O';xchr[80]:='P';xchr[81]:='Q';xchr[82]:='R';xchr[83]:='S';
xchr[84]:='T';xchr[85]:='U';xchr[86]:='V';xchr[87]:='W';xchr[88]:='X';
xchr[89]:='Y';xchr[90]:='Z';xchr[91]:='[';xchr[92]:='\';xchr[93]:=']';
xchr[94]:='^';xchr[95]:='_';xchr[96]:='`';xchr[97]:='a';xchr[98]:='b';
xchr[99]:='c';xchr[100]:='d';xchr[101]:='e';xchr[102]:='f';
xchr[103]:='g';xchr[104]:='h';xchr[105]:='i';xchr[106]:='j';
xchr[107]:='k';xchr[108]:='l';xchr[109]:='m';xchr[110]:='n';
xchr[111]:='o';xchr[112]:='p';xchr[113]:='q';xchr[114]:='r';
xchr[115]:='s';xchr[116]:='t';xchr[117]:='u';xchr[118]:='v';
xchr[119]:='w';xchr[120]:='x';xchr[121]:='y';xchr[122]:='z';
xchr[123]:='{';xchr[124]:='|';xchr[125]:='}';xchr[126]:='~';{:21}{23:}
for i:=0 to 31 do xchr[i]:=chr(i);for i:=127 to 255 do xchr[i]:=chr(i);
initeqtbtable;{:23}{24:}{:24}{74:}
if interactionoption=4 then interaction:=3 else interaction:=
interactionoption;{:74}{77:}deletionsallowed:=true;setboxallowed:=true;
errorcount:=0;{:77}{80:}helpptr:=0;useerrhelp:=false;{:80}{97:}
interrupt:=0;OKtointerrupt:=true;{:97}{166:}
ifdef('TEXMF_DEBUG')wasmemend:=memmin;waslomax:=memmin;washimin:=memmax;
panicking:=false;endif('TEXMF_DEBUG'){:166}{215:}nestptr:=0;
maxneststack:=0;curlist.modefield:=1;curlist.headfield:=memtop-1;
curlist.tailfield:=memtop-1;curlist.eTeXauxfield:=0;
curlist.auxfield.int:=-65536000;curlist.mlfield:=0;curlist.pgfield:=0;
shownmode:=0;curlist.dirsfield:=0;curlist.mathfield:=false;
curlist.localparfield:=0;curlist.localparboolfield:=false;
pagecontents:=0;pagetail:=memtop-2;lastglue:=1073741823;lastpenalty:=0;
lastkern:=0;lastnodetype:=-1;pagesofar[7]:=0;pagemaxdepth:=0;{:215}
{259:}{:259}{262:}nonewcontrolsequence:=true;{:262}{277:}saveptr:=0;
curlevel:=1;curgroup:=0;curboundary:=0;maxsavestack:=0;{:277}{292:}
magset:=0;{:292}{388:}curmark[0]:=0;curmark[1]:=0;curmark[2]:=0;
curmark[3]:=0;curmark[4]:=0;{:388}{446:}curval:=0;curvallevel:=0;
radix:=0;curorder:=0;{:446}{488:}for k:=0 to 16 do readopen[k]:=2;{:488}
{497:}condptr:=0;iflimit:=0;curif:=0;ifline:=0;{:497}{559:}{:559}{564:}
nullcharacter.b0:=0;nullcharacter.b1:=0;nullcharacter.b2:=0;
nullcharacter.b3:=0;{:564}{627:}totalpages:=0;maxv:=0;maxh:=0;
maxpush:=0;lastbop:=-1;doingleaders:=false;deadcycles:=0;curs:=-1;{:627}
{630:}halfbuf:=dvibufsize div 2;dvilimit:=dvibufsize;dviptr:=0;
dvioffset:=0;dvigone:=0;{:630}{640:}downptr:=0;rightptr:=0;{:640}{682:}
adjusttail:=0;lastbadness:=0;{:682}{696:}packbeginline:=0;{:696}{719:}
emptyfield.rh:=0;emptyfield.lh:=0;nulldelimiter.b0:=0;
nulldelimiter.b1:=0;nulldelimiter.b2:=0;nulldelimiter.b3:=0;{:719}{805:}
alignptr:=0;curalign:=0;curspan:=0;curloop:=0;curhead:=0;curtail:=0;
{:805}{849:}tempnowhatsits:=0;tempnodirs:=0;temporarydir:=0;dirptr:=0;
dirtmp:=0;dirrover:=0;tempnowhatsits:=0;{:849}{928:}maxhyphchar:=256;
{:928}{964:}for z:=0 to hyphsize do begin hyphword[z]:=0;hyphlist[z]:=0;
hyphlink[z]:=0;end;hyphcount:=0;hyphnext:=608;
if hyphnext>hyphsize then hyphnext:=607;{:964}{1026:}
outputactive:=false;insertpenalties:=0;{:1026}{1069:}
ligaturepresent:=false;cancelboundary:=false;lfthit:=false;rthit:=false;
leftghost:=false;rightghost:=false;newleftghost:=false;
newrightghost:=false;insdisc:=false;{:1069}{1304:}aftertoken:=0;{:1304}
{1319:}longhelpseen:=false;{:1319}{1337:}formatident:=0;{:1337}{1385:}
for k:=0 to 17 do writeopen[k]:=false;setneweqtbint(1049479,0);
setneweqtbint(1049480,0);setneweqtbint(1049481,0);
setneweqtbint(1049482,0);setneweqtbint(1049483,0);packdirection:=-1;
setneweqtbsc(1180578,55380984);setneweqtbsc(1180577,39158276);
setneweqtbsc(1180580,4736287);setneweqtbsc(1180579,4736287);
for k:=0 to 7 do begin dirprimary[k]:=0;dirprimary[k+8]:=1;
dirprimary[k+16]:=2;dirprimary[k+24]:=3;end;
for k:=0 to 3 do begin dirsecondary[k]:=1;dirsecondary[k+4]:=3;
dirsecondary[k+8]:=0;dirsecondary[k+12]:=2;dirsecondary[k+16]:=1;
dirsecondary[k+20]:=3;dirsecondary[k+24]:=0;dirsecondary[k+28]:=2;end;
for k:=0 to 7 do begin dirtertiary[k*4]:=0;dirtertiary[k*4+1]:=1;
dirtertiary[k*4+2]:=2;dirtertiary[k*4+3]:=3;end;dirrearrange[0]:=0;
dirrearrange[1]:=0;dirrearrange[2]:=1;dirrearrange[3]:=1;
dirnames[0]:=84;dirnames[1]:=76;dirnames[2]:=66;dirnames[3]:=82;{:1385}
{1508:}pseudofiles:=0;{:1508}{1574:}samark:=0;sanull.hh.lh:=0;
sanull.hh.rh:=0;{:1574}{1593:}sachain:=0;salevel:=0;{:1593}{1617:}
discptr[2]:=0;discptr[3]:=0;{:1617}{1625:}editnamestart:=0;
stopatspace:=true;haltingonerrorp:=false;{:1625}{1635:}
expanddepthcount:=0;{:1635}ifdef('INITEX')if iniversion then begin{164:}
for k:=membot+1 to membot+23 do mem[k].int:=0;k:=membot;
while k<=membot+23 do begin mem[k].hh.rh:=1;mem[k].hh.b0:=0;
mem[k].hh.b1:=0;k:=k+4;end;mem[membot+6].int:=65536;
mem[membot+4].hh.b0:=1;mem[membot+10].int:=65536;mem[membot+8].hh.b0:=2;
mem[membot+14].int:=65536;mem[membot+12].hh.b0:=3;
mem[membot+18].int:=65536;mem[membot+16].hh.b0:=2;
mem[membot+19].int:=65536;mem[membot+16].hh.b1:=2;
mem[membot+22].int:=-65536;mem[membot+20].hh.b0:=2;rover:=membot+24;
mem[rover].hh.rh:=1073741823;mem[rover].hh.lh:=1000;
mem[rover+1].hh.lh:=rover;mem[rover+1].hh.rh:=rover;
lomemmax:=rover+1000;mem[lomemmax].hh.rh:=0;mem[lomemmax].hh.lh:=0;
for k:=memtop-13 to memtop do mem[k]:=mem[lomemmax];{824:}
mem[memtop-10].hh.lh:=1245190;{:824}{831:}mem[memtop-9].hh.rh:=65536;
mem[memtop-9].hh.lh:=0;{:831}{855:}mem[memtop-7].hh.b0:=1;
mem[memtop-6].hh.lh:=1073741823;mem[memtop-7].hh.b1:=0;{:855}{1017:}
mem[memtop].hh.b1:=255;mem[memtop].hh.b0:=1;mem[memtop].hh.rh:=memtop;
{:1017}{1024:}mem[memtop-2].hh.b0:=10;mem[memtop-2].hh.b1:=0;{:1024};
avail:=0;memend:=memtop;himemmin:=memtop-13;varused:=membot+24-membot;
dynused:=14;{:164}{224:}seteqtype(393229,118);setequiv(393229,0);
seteqlevel(393229,0);{:224}{230:}setequiv(393230,membot);
seteqlevel(393230,1);seteqtype(393230,134);
mem[membot].hh.rh:=mem[membot].hh.rh+131090;{:230}{234:}
setequiv(524320,0);seteqtype(524320,135);seteqlevel(524320,1);
setequiv(721741,5);setequiv(721760,10);setequiv(721820,0);
setequiv(721765,14);setequiv(721855,15);setequiv(721728,9);
for k:=48 to 57 do setequiv(983872+k,k+117440512);
for k:=65 to 90 do begin setequiv(721728+k,11);setequiv(721728+k+32,11);
setequiv(983872+k,k+117506048);setequiv(983872+k+32,k+117506080);
setequiv(787264+k,k+32);setequiv(787264+k+32,k+32);setequiv(852800+k,k);
setequiv(852800+k+32,k);setequiv(918336+k,999);end;{:234}{242:}
setneweqtbint(1049425,1000);setneweqtbint(1049409,10000);
setneweqtbint(1049449,1);setneweqtbint(1049448,25);
setneweqtbint(1049453,92);setneweqtbint(1049456,13);
setneweqtbint(1049467,1);setequiv(1115066,0);setequiv1(1115066,0);{:242}
{254:}{:254}{263:}hashused:=196610;cscount:=0;seteqtype(196619,133);
sethashtext(1442735,65792);{:263}{560:}fontptr:=0;
allocatefonttable(0,152);fonttables[0,0].int:=152;
fonttables[0,15].int:=false;fonttables[0,10].int:=66133;
fonttables[0,11].int:=65624;fonttables[0,16].int:=45;
fonttables[0,17].int:=-1;fonttables[0,18].int:=0;
fonttables[0,19].int:=65536;fonttables[0,20].int:=65536;
fonttables[0,12].int:=1;fonttables[0,13].int:=0;fonttables[0,6].int:=0;
fonttables[0,7].int:=0;fonttables[0,34].int:=44;
fonttables[0,35].int:=44;fonttables[0,22].int:=44;
fonttables[0,23].int:=44;fonttables[0,24].int:=44;
fonttables[0,25].int:=44;fonttables[0,26].int:=44;
fonttables[0,27].int:=44;fonttables[0,28].int:=44;
fonttables[0,29].int:=44;fonttables[0,30].int:=44;
fonttables[0,31].int:=44;fonttables[0,32].int:=44;
fonttables[0,33].int:=44;fonttables[0,36].int:=44;
fonttables[0,37].int:=44;fonttables[0,38].int:=44;
fonttables[0,39].int:=44;fonttables[0,40].int:=44;
fonttables[0,41].int:=44;fonttables[0,42].int:=44;
fonttables[0,14].int:=0;fonttables[0,8].int:=7;fonttables[0,43].int:=43;
fonttables[0,5].int:=0;
for k:=1 to 7 do fonttables[0,fonttables[0,43].int+k].int:=0;{:560}
{593:}activeminptr:=0;activereal:=0;{:593}{599:}ocpptr:=0;
allocateocptable(0,17);ocptables[0,0]:=17;ocptables[0,1]:=66160;
ocptables[0,2]:=65624;ocptables[0,3]:=0;ocptables[0,4]:=0;
ocptables[0,5]:=1;ocptables[0,6]:=1;ocptables[0,7]:=0;ocptables[0,8]:=1;
ocptables[f,9]:=11;ocptables[f,10]:=11;ocptables[0,11]:=13;
ocptables[0,12]:=16;ocptables[0,13]:=23;ocptables[0,14]:=3;
ocptables[0,15]:=36;{:599}{613:}ocplistmemptr:=2;
ocplistinfo[0].hh.b1:=0;ocplistinfo[1].int:=ocpmaxint;
ocplistinfo[0].hh.b0:=0;ocplistptr:=0;ocplistlist[0]:=0;
ocplstackmemptr:=1;{:613}{982:}
for k:=-trieopsize to trieopsize do trieophash[k]:=0;
for k:=0 to 255 do trieused[k]:=0;trieopptr:=0;{:982}{987:}
trienotready:=true;{:987}{1253:}sethashtext(1442726,66557);{:1253}
{1338:}if iniversion then formatident:=66633;{:1338}{1411:}
sethashtext(1442734,66685);seteqlevel(196618,1);seteqtype(196618,130);
setequiv(196618,0);{:1411}{1458:}eTeXmode:=0;{1569:}maxregnum:=255;
maxreghelpline:=66792;{:1569}{:1458}{1611:}{:1611}{1646:}{:1646}end;
endif('INITEX'){:8}end;{57:}procedure println;
begin case selector of 19:begin writeln(stdout);writeln(logfile);
termoffset:=0;fileoffset:=0;end;18:begin writeln(logfile);fileoffset:=0;
end;17:begin writeln(stdout);termoffset:=0;end;16,20,21:;
others:writeln(writefile[selector])end;end;{:57}{58:}
procedure printchar(s:ASCIIcode);label 10;begin if{248:}
s=neweqtbint(1049457){:248}then if selector<20 then begin println;
goto 10;end;
case selector of 19:begin case termoutmode of 0:write(stdout,xchr[s]);
1,2:write(stdout,xchr[s]);3:begin write(stdout,xchr[s div 256]);
write(stdout,xchr[s mod 256]);end;4:begin write(stdout,xchr[s mod 256]);
write(stdout,xchr[s div 256]);end;end;
case termoutmode of 0:write(logfile,xchr[s]);1,2:write(logfile,xchr[s]);
3:begin write(logfile,xchr[s div 256]);write(logfile,xchr[s mod 256]);
end;4:begin write(logfile,xchr[s mod 256]);
write(logfile,xchr[s div 256]);end;end;incr(termoffset);
incr(fileoffset);if termoffset=maxprintline then begin writeln(stdout);
termoffset:=0;end;
if fileoffset=maxprintline then begin writeln(logfile);fileoffset:=0;
end;end;18:begin case termoutmode of 0:write(logfile,xchr[s]);
1,2:write(logfile,xchr[s]);3:begin write(logfile,xchr[s div 256]);
write(logfile,xchr[s mod 256]);end;
4:begin write(logfile,xchr[s mod 256]);write(logfile,xchr[s div 256]);
end;end;incr(fileoffset);if fileoffset=maxprintline then println;end;
17:begin case termoutmode of 0:write(stdout,xchr[s]);
1,2:write(stdout,xchr[s]);3:begin write(stdout,xchr[s div 256]);
write(stdout,xchr[s mod 256]);end;4:begin write(stdout,xchr[s mod 256]);
write(stdout,xchr[s div 256]);end;end;incr(termoffset);
if termoffset=maxprintline then println;end;16:;
20:if tally<trickcount then trickbuf[tally mod errorline]:=s;
21:begin if poolptr<poolsize then begin strpool[poolptr]:=s;
incr(poolptr);end;end;
others:case writefilemode[selector]of 0:write(writefile[selector],xchr[s
]);1,2:write(writefile[selector],xchr[s]);
3:begin write(writefile[selector],xchr[s div 256]);
write(writefile[selector],xchr[s mod 256]);end;
4:begin write(writefile[selector],xchr[s mod 256]);
write(writefile[selector],xchr[s div 256]);end;end end;incr(tally);
10:end;{:58}{59:}procedure print(s:integer);label 10;var j:poolpointer;
nl:integer;l:integer;
begin if s>=strptr then s:=65545 else if s<65535 then if s<0 then s:=
65545 else begin if selector>20 then begin printchar(s);goto 10;end;
if({248:}s=neweqtbint(1049457){:248}
)then if selector<20 then begin println;goto 10;end;
nl:=neweqtbint(1049457);{243:}setneweqtbint(1049457,-1){:243};
if s<32 then begin printchar(94);printchar(94);printchar(s+64);
end else if s<127 then printchar(s)else if s=127 then begin printchar(94
);printchar(94);printchar(s-64);
end else if s<256 then begin printchar(94);printchar(94);
l:=(s mod 256)div 16;if l<10 then printchar(l+48)else printchar(l+87);;
l:=s mod 16;if l<10 then printchar(l+48)else printchar(l+87);;
end else begin printchar(94);printchar(94);printchar(94);printchar(94);
l:=s div 4096;if l<10 then printchar(l+48)else printchar(l+87);;
l:=(s mod 4096)div 256;if l<10 then printchar(l+48)else printchar(l+87);
;l:=(s mod 256)div 16;if l<10 then printchar(l+48)else printchar(l+87);;
l:=s mod 16;if l<10 then printchar(l+48)else printchar(l+87);;end;{244:}
setneweqtbint(1049457,nl){:244};goto 10;end;j:=strstartar[s-65536];
while j<strstartar[s-65535]do begin printchar(strpool[j]);incr(j);end;
10:end;procedure printnl(s:strnumber);
begin if((termoffset>0)and(odd(selector)))or((fileoffset>0)and(selector
>=18))then println;print(s);end;procedure overflowocpbufsize;forward;
procedure overflowocpstacksize;forward;
procedure omegaprint(s:strnumber);var news:strnumber;
ommode,omtranslation:integer;j:integer;begin ommode:=0;omtranslation:=0;
case selector of 19,18,17:begin ommode:=termoutmode;
if ommode<>0 then omtranslation:=termouttranslation;end;16,20,21:;
others:begin ommode:=writefilemode[selector];
if ommode<>0 then omtranslation:=writefiletranslation[selector];end end;
if(ommode=0)or((ommode=1)and(omtranslation=0))then begin j:=strstartar[s
-65536];while j<strstartar[s-65535]do begin news:=strpool[j];
if(news=neweqtbint(1049457))and(selector<20)then println else if news<32
then begin printchar(94);printchar(94);printchar(news+64);
end else if news<127 then printchar(news)else if news=127 then begin
printchar(94);printchar(94);printchar(news-64);
end else if news<256 then begin printchar(94);printchar(94);
l:=(news mod 256)div 16;
if l<10 then printchar(l+48)else printchar(l+87);;l:=news mod 16;
if l<10 then printchar(l+48)else printchar(l+87);;
end else begin printchar(94);printchar(94);printchar(94);printchar(94);
l:=news div 4096;if l<10 then printchar(l+48)else printchar(l+87);;
l:=(news mod 4096)div 256;
if l<10 then printchar(l+48)else printchar(l+87);;
l:=(news mod 256)div 16;
if l<10 then printchar(l+48)else printchar(l+87);;l:=news mod 16;
if l<10 then printchar(l+48)else printchar(l+87);;end;incr(j);end;
end else begin if omtranslation=0 then begin j:=strstartar[s-65536];
otpcounter:=1;
while j<strstartar[s-65535]do begin otpoutputbuf[otpcounter]:=strpool[j]
;incr(otpcounter);incr(j);end;otpoutputend:=otpcounter;
end else begin otpinputstart:=0;otpinputlast:=0;otpstackused:=0;
otpstacklast:=0;otpstacknew:=0;otpoutputend:=0;otppc:=0;
otpfinished:=false;otpcalcptr:=0;otpcalcs[otpcalcptr]:=0;otpstateptr:=0;
otpstates[otpstateptr]:=0;otpinputocp:=omtranslation;
j:=strstartar[s-65536];otpcounter:=1;
while j<strstartar[s-65535]do begin otpinputbuf[otpcounter]:=strpool[j];
incr(otpcounter);incr(j);end;otpinputend:=otpcounter;
while not otpfinished do{1652:}
begin begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;case otpinstr of{1653:}
1:begin incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalcs[otpcalcptr];decr(otpcalcptr);
incr(otppc);end;2:begin incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otparg;incr(otppc);end;
3:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpoutputend);if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;incr(otppc);end;
4:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;incr(otppc);end;
5:begin otpfirstarg:=otparg+1;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
otpsecondarg:=otpnoinputchars-otparg;
for otpcounter:=otpfirstarg to otpsecondarg do begin begin if(1>
otpcounter)or(otpcounter>otpnoinputchars)then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpcounter>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otpcounter-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpcounter];end;end;
incr(otpoutputend);if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;end;incr(otppc);end{:1653}
;{1654:}6:begin incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalcs[otpcalcptr];decr(otpcalcptr);
incr(otppc);end;7:begin incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otparg;incr(otppc);end;
8:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;incr(otppc);end;
9:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;incr(otppc);end;
10:begin otpfirstarg:=otparg+1;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
otpsecondarg:=otpnoinputchars-otparg;
for otpcounter:=otpfirstarg to otpsecondarg do begin begin if(1>
otpcounter)or(otpcounter>otpnoinputchars)then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpcounter>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otpcounter-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpcounter];end;end;
incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;end;incr(otppc);end{:1654};
{1655:}11:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]+otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
12:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]-otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
13:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]*otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
14:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]div otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
15:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]mod otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
16:begin if otpcalcs[otpcalcptr]>=ocptables[otpinputocp,ocptables[
otpinputocp,9]+otpcalcs[otpcalcptr-1]*2+1]then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66828);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpcalcs[otpcalcptr-1]:=ocptables[otpinputocp,ocptables[otpinputocp,
ocptables[otpinputocp,9]+otpcalcs[otpcalcptr-1]*2]+otpcalcs[otpcalcptr]]
;incr(otppc);decr(otpcalcptr);end;17:begin incr(otpcalcptr);
if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otparg;incr(otppc);end;
18:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpcalcptr);if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otpcalculatedchar;incr(otppc);end;
19:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpcalcptr);
if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otpcalculatedchar;incr(otppc);end{:1655};{1656:}
20:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;otpstates[otpstateptr]:=otparg;otppc:=0;end;
21:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;incr(otpstateptr);
if otpstateptr>=ocpstacksize then overflowocpstacksize;
otpstates[otpstateptr]:=otparg;otppc:=0;end;
22:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;if otpstateptr>0 then decr(otpstateptr);otppc:=0;
end{:1656};{1657:}23:begin otpinputstart:=otpinputlast;
otpinputlast:=otpinputstart;otpstackused:=0;
if(otpstacklast=0)and(otpinputlast>=otpinputend)then otpfinished:=true
else if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];otpnoinputchars:=1;incr(otppc);
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];otpnoinputchars:=1;incr(otppc);
end;end;24:begin otpinputlast:=otpinputstart;otpstackused:=0;
if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];otpnoinputchars:=1;incr(otppc);
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];otpnoinputchars:=1;incr(otppc);
end;end;
25:begin if otpinputstart<otpinputlast then begin decr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];
end else begin decr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];end;decr(otpnoinputchars);
incr(otppc);end{:1657};{1658:}26:begin otppc:=otparg;end;
27:begin otpfirstarg:=otparg;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<>otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;28:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;29:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;30:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;31:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar>otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;32:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar>=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;
33:begin if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];incr(otpnoinputchars);
incr(otppc);
end else if otpinputlast>=otpinputend then begin otppc:=otparg;
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];incr(otpnoinputchars);
incr(otppc);end;end;34:begin if otpinputlast=0 then begin otppc:=otparg;
end else begin incr(otppc);end;end;
35:begin if otpinputlast>=otpinputend then begin otppc:=otparg;
end else begin incr(otppc);end;end{:1658};{1659:}
36:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;otppc:=0;end{:1659};
others:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66826);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end end;end{:1652};end;
for otpcounter:=1 to(otpoutputend-1)do begin news:=otpoutputbuf[
otpcounter];if(ommode<3)and(news>255)then begin printchar(94);
printchar(94);printchar(94);printchar(94);l:=news div 4096;
if l<10 then printchar(l+48)else printchar(l+87);;
l:=(news mod 4096)div 256;
if l<10 then printchar(l+48)else printchar(l+87);;
l:=(news mod 256)div 16;
if l<10 then printchar(l+48)else printchar(l+87);;l:=news mod 16;
if l<10 then printchar(l+48)else printchar(l+87);;
end else printchar(news);end;end;end;{:59}{60:}
procedure slowprint(s:integer);
begin if(s>=strptr)or(s<=65535)then print(s)else omegaprint(s);end;{:60}
{62:}{:62}{63:}procedure printesc(s:strnumber);var c:integer;begin{247:}
c:=neweqtbint(1049453){:247};if c>=0 then if c<=65535 then print(c);
slowprint(s);end;{:63}{64:}procedure printthedigs(k:eightbits);
begin while k>0 do begin decr(k);
if dig[k]<10 then printchar(48+dig[k])else printchar(55+dig[k]);end;end;
{:64}{65:}procedure printint(n:integer);var k:0..23;m:integer;
begin k:=0;if n<0 then begin printchar(45);
if n>-100000000 then n:=-n else begin m:=-1-n;n:=m div 10;
m:=(m mod 10)+1;k:=1;if m<10 then dig[0]:=m else begin dig[0]:=0;
incr(n);end;end;end;repeat dig[k]:=n mod 10;n:=n div 10;incr(k);
until n=0;printthedigs(k);end;{:65}{267:}procedure printcs(p:integer);
begin if p<131074 then if p>=65537 then if p=131073 then begin printesc(
65794);printesc(65795);printchar(32);end else begin printesc(p-65537);
if newequiv(721728+p-65537)=11 then printchar(32);
end else if p<1 then printesc(65796)else print(p-1)else if p>=393229
then printesc(65796)else if(newhashtext(1246116+p)>=strptr)then printesc
(65797)else begin printesc(newhashtext(1246116+p));printchar(32);end;
end;{:267}{268:}procedure sprintcs(p:halfword);
begin if p<131074 then if p<65537 then print(p-1)else if p<131073 then
printesc(p-65537)else begin printesc(65794);printesc(65795);
end else printesc(newhashtext(1246116+p));end;{:268}{525:}
procedure printfilename(n,a,e:integer);var mustquote:boolean;
j:poolpointer;begin mustquote:=false;
if a<>0 then begin j:=strstartar[a-65536];
while(not mustquote)and(j<strstartar[a-65535])do begin mustquote:=
strpool[j]=32;incr(j);end;end;if n<>0 then begin j:=strstartar[n-65536];
while(not mustquote)and(j<strstartar[n-65535])do begin mustquote:=
strpool[j]=32;incr(j);end;end;if e<>0 then begin j:=strstartar[e-65536];
while(not mustquote)and(j<strstartar[e-65535])do begin mustquote:=
strpool[j]=32;incr(j);end;end;if mustquote then printchar(34);
if a<>0 then for j:=strstartar[a-65536]to strstartar[a-65535]-1 do if
strpool[j]<>34 then printchar(strpool[j]);
if n<>0 then for j:=strstartar[n-65536]to strstartar[n-65535]-1 do if
strpool[j]<>34 then printchar(strpool[j]);
if e<>0 then for j:=strstartar[e-65536]to strstartar[e-65535]-1 do if
strpool[j]<>34 then printchar(strpool[j]);
if mustquote then printchar(34);end;{:525}{733:}
procedure printsize(s:integer);
begin if s=0 then printesc(65698)else if s=256 then printesc(65699)else
printesc(65700);end;{:733}{1397:}
procedure printwritewhatsit(s:strnumber;p:halfword);begin printesc(s);
if mem[p+1].hh.lh<16 then printint(mem[p+1].hh.lh)else if mem[p+1].hh.lh
=16 then printchar(42)else printchar(45);end;{:1397}{1579:}
procedure printsanum(q:halfword);var n:halfword;
begin if false then n:=mem[q+1].hh.rh else begin n:=mem[q].hh.b0 mod 16;
q:=mem[q].hh.rh;n:=n+16*mem[q].hh.b0;q:=mem[q].hh.rh;
n:=n+256*(mem[q].hh.b0+16*mem[mem[q].hh.rh].hh.b0);end;printint(n);end;
{:1579}{1627:}procedure printcsnames(hstart:integer;hfinish:integer);
var c,h:integer;
begin writeln(stderr,'fmtdebug:csnames from ',hstart,' to ',hfinish,':')
;
for h:=hstart to hfinish do begin if newhashtext(1246116+h)>0 then begin
for c:=strstartar[newhashtext(1246116+h)-65536]to strstartar[newhashtext
(1246116+h)-65535]-1 do begin putbyte(strpool[c],stderr);end;
writeln(stderr,'|');end;end;end;{:1627}{1629:}procedure printfileline;
var level:0..maxinopen;begin level:=inopen;
while(level>0)and(fullsourcefilenamestack[level]=0)do decr(level);
if level=0 then printnl(65548)else begin printnl(65624);
print(fullsourcefilenamestack[level]);print(58);
if level=inopen then printint(line)else printint(linestack[level+1]);
print(65873);end;end;{:1629}{78:}procedure normalizeselector;forward;
procedure gettoken;forward;procedure terminput;forward;
procedure showcontext;forward;procedure beginfilereading;forward;
procedure openlogfile;forward;procedure closefilesandterminate;forward;
procedure clearforerrorprompt;forward;procedure giveerrhelp;forward;
ifdef('TEXMF_DEBUG')procedure debughelp;forward;
endif('TEXMF_DEBUG'){:78}{81:}procedure jumpout;
begin closefilesandterminate;begin fflush(stdout);readyalready:=0;
if(history<>0)and(history<>1)then uexit(1)else uexit(0);end;end;{:81}
{82:}procedure error;label 22,10;var c:ASCIIcode;s1,s2,s3,s4:integer;
begin if history<2 then history:=2;printchar(46);showcontext;
if(haltonerrorp)then begin if(haltingonerrorp)then begin fflush(stdout);
readyalready:=0;if(history<>0)and(history<>1)then uexit(1)else uexit(0);
end;haltingonerrorp:=true;history:=3;jumpout;end;
if interaction=3 then{83:}
while true do begin 22:if interaction<>3 then goto 10;
clearforerrorprompt;begin;print(65550);terminput;end;
if last=first then goto 10;c:=buffer[first];if c>=97 then c:=c-32;{84:}
case c of 48,49,50,51,52,53,54,55,56,57:if deletionsallowed then{88:}
begin s1:=curtok;s2:=curcmd;s3:=curchr;s4:=alignstate;
alignstate:=1000000;OKtointerrupt:=false;
if(last>first+1)and(buffer[first+1]>=48)and(buffer[first+1]<=57)then c:=
c*10+buffer[first+1]-48*11 else c:=c-48;while c>0 do begin gettoken;
decr(c);end;curtok:=s1;curcmd:=s2;curchr:=s3;alignstate:=s4;
OKtointerrupt:=true;begin helpptr:=2;helpline[1]:=65563;
helpline[0]:=65564;end;showcontext;goto 22;end{:88};
ifdef('TEXMF_DEBUG')68:begin debughelp;goto 22;end;
endif('TEXMF_DEBUG')69:if baseptr>0 then if inputstack[baseptr].
namefield>=256 then begin editnamestart:=strstartar[inputstack[baseptr].
namefield-65536];
editnamelength:=strstartar[inputstack[baseptr].namefield-65535]-
strstartar[inputstack[baseptr].namefield-65536];editline:=line;jumpout;
end;72:{89:}begin if useerrhelp then begin giveerrhelp;
useerrhelp:=false;end else begin if helpptr=0 then begin helpptr:=2;
helpline[1]:=65565;helpline[0]:=65566;end;repeat decr(helpptr);
print(helpline[helpptr]);println;until helpptr=0;end;begin helpptr:=4;
helpline[3]:=65567;helpline[2]:=65566;helpline[1]:=65568;
helpline[0]:=65569;end;goto 22;end{:89};73:{87:}begin beginfilereading;
if last>first+1 then begin curinput.locfield:=first+1;buffer[first]:=32;
end else begin begin;print(65562);terminput;end;
curinput.locfield:=first;end;first:=last;curinput.limitfield:=last-1;
goto 10;end{:87};81,82,83:{86:}begin errorcount:=0;interaction:=0+c-81;
print(65557);case c of 81:begin printesc(65558);decr(selector);end;
82:printesc(65559);83:printesc(65560);end;print(65561);println;
fflush(stdout);goto 10;end{:86};88:begin interaction:=2;jumpout;end;
others:end;{85:}begin print(65551);printnl(65552);printnl(65553);
if baseptr>0 then if inputstack[baseptr].namefield>=256 then print(65554
);if deletionsallowed then printnl(65555);printnl(65556);end{:85}{:84};
end{:83};incr(errorcount);if errorcount=100 then begin printnl(65549);
history:=3;jumpout;end;{90:}if interaction>0 then decr(selector);
if useerrhelp then begin println;giveerrhelp;
end else while helpptr>0 do begin decr(helpptr);
printnl(helpline[helpptr]);end;println;
if interaction>0 then incr(selector);println{:90};10:end;{:82}{93:}
procedure fatalerror(s:strnumber);begin normalizeselector;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65571);end;begin helpptr:=1;helpline[0]:=s;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;{:93}{94:}
procedure overflow(s:strnumber;n:integer);begin normalizeselector;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65572);end;print(s);printchar(61);printint(n);printchar(93);
begin helpptr:=2;helpline[1]:=65573;helpline[0]:=65574;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
procedure overflowocpbufsize;begin overflow(65575,ocpbufsize);end;
procedure overflowocpstacksize;begin overflow(65576,ocpstacksize);end;
{:94}{95:}procedure confusion(s:strnumber);begin normalizeselector;
if history<2 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65577);end;print(s);printchar(41);begin helpptr:=1;
helpline[0]:=65578;end;end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65579);end;begin helpptr:=2;helpline[1]:=65580;helpline[0]:=65581;
end;end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;{:95}{:4}{37:}
function initterminal:boolean;label 10;begin topenin;
if last>first then begin curinput.locfield:=first;
while(curinput.locfield<last)and(buffer[curinput.locfield]=' ')do incr(
curinput.locfield);
if curinput.locfield<last then begin initterminal:=true;goto 10;end;end;
while true do begin;write(stdout,'**');fflush(stdout);
if not newinputln(stdin,terminmode,termintranslation,true)then begin
writeln(stdout);writeln(stdout,'! End of file on the terminal... why?');
initterminal:=false;goto 10;end;curinput.locfield:=first;
while(curinput.locfield<last)and(buffer[curinput.locfield]=32)do incr(
curinput.locfield);
if curinput.locfield<last then begin initterminal:=true;goto 10;end;
writeln(stdout,'Please type the name of your input file.');end;10:end;
{:37}{40:}function length(s:strnumber):integer;
begin if(s>=65536)then length:=strstartar[s-65535]-strstartar[s-65536]
else if(s>=32)and(s<127)then length:=1 else if(s<=127)then length:=3
else if(s<256)then length:=4 else length:=8 end;{:40}{43:}
function makestring:strnumber;
begin if strptr=maxstrings then overflow(65544,maxstrings-initstrptr);
incr(strptr);strstartar[strptr-65536]:=poolptr;makestring:=strptr-1;end;
{:43}{45:}function streqbuf(s:strnumber;k:integer):boolean;label 45;
var j:poolpointer;result:boolean;begin j:=strstartar[s-65536];
while j<strstartar[s-65535]do begin if strpool[j]<>buffer[k]then begin
result:=false;goto 45;end;incr(j);incr(k);end;result:=true;
45:streqbuf:=result;end;{:45}{46:}
function streqstr(s,t:strnumber):boolean;label 45;var j,k:poolpointer;
result:boolean;begin result:=false;if length(s)<>length(t)then goto 45;
if(length(s)=1)then begin if s<65536 then begin if t<65536 then begin if
s<>t then goto 45;
end else begin if s<>strpool[strstartar[t-65536]]then goto 45;end;
end else begin if t<65536 then begin if strpool[strstartar[s-65536]]<>t
then goto 45;
end else begin if strpool[strstartar[s-65536]]<>strpool[strstartar[t
-65536]]then goto 45;end;end;end else begin j:=strstartar[s-65536];
k:=strstartar[t-65536];
while j<strstartar[s-65535]do begin if strpool[j]<>strpool[k]then goto
45;incr(j);incr(k);end;end;result:=true;45:streqstr:=result;end;{:46}
{47:}{1631:}function searchstring(search:strnumber):strnumber;label 40;
var result:strnumber;s:strnumber;len:integer;begin result:=0;
len:=length(search);if len=0 then begin result:=65624;goto 40;
end else begin s:=search-1;
while s>65535 do begin if length(s)=len then if streqstr(s,search)then
begin result:=s;goto 40;end;decr(s);end;end;40:searchstring:=result;end;
{:1631}{1632:}function slowmakestring:strnumber;label 10;
var s:strnumber;t:strnumber;begin t:=makestring;s:=searchstring(t);
if s>0 then begin begin decr(strptr);poolptr:=strstartar[strptr-65536];
end;slowmakestring:=s;goto 10;end;slowmakestring:=t;10:end;{:1632}
ifdef('INITEX')function getstringsstarted:boolean;label 30,10;
var g:strnumber;begin poolptr:=0;strptr:=0;strstartar[0]:=0;
strstartar[1]:=0;{48:}begin strptr:=65536;end{:48};{51:}
g:=loadpoolstrings((poolsize-stringvacancies));if g=0 then begin;
writeln(stdout,'! You have to increase POOLSIZE.');
getstringsstarted:=false;goto 10;end;getstringsstarted:=true;{:51};
10:end;endif('INITEX'){:47}{66:}procedure printtwo(n:integer);
begin n:=abs(n)mod 100;printchar(48+(n div 10));
printchar(48+(n mod 10));end;{:66}{67:}procedure printhex(n:integer);
var k:0..22;begin k:=0;printchar(34);repeat dig[k]:=n mod 16;
n:=n div 16;incr(k);until n=0;printthedigs(k);end;{:67}{69:}
procedure printromanint(n:integer);label 10;var j,k:poolpointer;
u,v:nonnegativeinteger;begin j:=strstartar[10];v:=1000;
while true do begin while n>=v do begin printchar(strpool[j]);n:=n-v;
end;if n<=0 then goto 10;k:=j+2;u:=v div(strpool[k-1]-48);
if strpool[k-1]=50 then begin k:=k+2;u:=u div(strpool[k-1]-48);end;
if n+u>=v then begin printchar(strpool[k]);n:=n+u;end else begin j:=j+2;
v:=v div(strpool[j-1]-48);end;end;10:end;{:69}{70:}
procedure printcurrentstring;var j:poolpointer;
begin j:=strstartar[strptr-65536];
while j<poolptr do begin printchar(strpool[j]);incr(j);end;end;{:70}
{71:}procedure terminput;var k:0..bufsize;begin fflush(stdout);
if not newinputln(stdin,terminmode,termintranslation,true)then begin
curinput.limitfield:=0;fatalerror(65547);end;termoffset:=0;
decr(selector);
if last<>first then for k:=first to last-1 do print(buffer[k]);println;
incr(selector);end;{:71}{91:}procedure interror(n:integer);
begin print(65570);printint(n);printchar(41);error;end;{:91}{92:}
procedure normalizeselector;
begin if logopened then selector:=19 else selector:=17;
if jobname=0 then openlogfile;if interaction=0 then decr(selector);end;
{:92}{98:}procedure pauseforinstructions;
begin if OKtointerrupt then begin interaction:=3;
if(selector=18)or(selector=16)then incr(selector);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65582);end;begin helpptr:=3;helpline[2]:=65583;helpline[1]:=65584;
helpline[0]:=65585;end;deletionsallowed:=false;error;
deletionsallowed:=true;interrupt:=0;end;end;{:98}{100:}
function half(x:integer):integer;
begin if odd(x)then half:=(x+1)div 2 else half:=x div 2;end;{:100}{102:}
function rounddecimals(k:smallnumber):scaled;var a:integer;begin a:=0;
while k>0 do begin decr(k);a:=(a+dig[k]*131072)div 10;end;
rounddecimals:=(a+1)div 2;end;{:102}{103:}
procedure printscaled(s:scaled);var delta:scaled;
begin if s<0 then begin printchar(45);s:=-s;end;printint(s div 65536);
printchar(46);s:=10*(s mod 65536)+5;delta:=10;
repeat if delta>65536 then s:=s-17232;printchar(48+(s div 65536));
s:=10*(s mod 65536);delta:=delta*10;until s<=delta;end;{:103}{105:}
function multandadd(n:integer;x,y,maxanswer:scaled):scaled;
begin if n<0 then begin x:=-x;n:=-n;end;
if n=0 then multandadd:=y else if((x<=(maxanswer-y)div n)and(-x<=(
maxanswer+y)div n))then multandadd:=n*x+y else begin aritherror:=true;
multandadd:=0;end;end;{:105}{106:}function xovern(x:scaled;
n:integer):scaled;var negative:boolean;begin negative:=false;
if n=0 then begin aritherror:=true;xovern:=0;texremainder:=x;
end else begin if n<0 then begin x:=-x;n:=-n;negative:=true;end;
if x>=0 then begin xovern:=x div n;texremainder:=x mod n;
end else begin xovern:=-((-x)div n);texremainder:=-((-x)mod n);end;end;
if negative then texremainder:=-texremainder;end;{:106}{107:}
function xnoverd(x:scaled;n,d:integer):scaled;var positive:boolean;
t,u,v:nonnegativeinteger;
begin if x>=0 then positive:=true else begin x:=-x;positive:=false;end;
t:=(x mod 32768)*n;u:=(x div 32768)*n+(t div 32768);
v:=(u mod d)*32768+(t mod 32768);
if u div d>=32768 then aritherror:=true else u:=32768*(u div d)+(v div d
);if positive then begin xnoverd:=u;texremainder:=v mod d;
end else begin xnoverd:=-u;texremainder:=-(v mod d);end;end;{:107}{108:}
function badness(t,s:scaled):halfword;var r:integer;
begin if t=0 then badness:=0 else if s<=0 then badness:=10000 else begin
if t<=7230584 then r:=(t*297)div s else if s>=1663497 then r:=t div(s
div 297)else r:=t;
if r>1290 then badness:=10000 else badness:=(r*r*r+131072)div 262144;
end;end;{:108}{114:}
ifdef('TEXMF_DEBUG')procedure printword(w:memoryword);
begin printint(w.int);printchar(32);printscaled(w.int);printchar(32);
printscaled(round(65536*w.gr));println;printint(w.hh.lh);printchar(61);
printint(w.hh.b0);printchar(58);printint(w.hh.b1);printchar(59);
printint(w.hh.rh);printchar(32);printint(w.qqqq.b0);printchar(58);
printint(w.qqqq.b1);printchar(58);printint(w.qqqq.b2);printchar(58);
printint(w.qqqq.b3);end;endif('TEXMF_DEBUG'){:114}{119:}{297:}
procedure showtokenlist(p,q:integer;l:integer);label 10;var m,c:integer;
matchchr:ASCIIcode;n:ASCIIcode;begin matchchr:=35;n:=48;tally:=0;
while(p<>0)and(tally<l)do begin if p=q then{325:}
begin firstcount:=tally;trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end{:325};{298:}
if(p<himemmin)or(p>memend)then begin printesc(65595);goto 10;end;
if mem[p].hh.lh>=1048575 then printcs(mem[p].hh.lh-1048575)else begin m
:=mem[p].hh.lh div 65536;c:=mem[p].hh.lh mod 65536;
if mem[p].hh.lh<0 then printesc(65860)else{299:}
case m of 1,2,3,4,7,8,10,11,12:print(c);6:begin print(c);print(c);end;
5:begin print(matchchr);
if c<=9 then printchar(c+48)else begin printchar(33);goto 10;end;end;
13:begin matchchr:=c;print(c);incr(n);printchar(n);if n>57 then goto 10;
end;14:if c=0 then print(65861);others:printesc(65860)end{:299};
end{:298};p:=mem[p].hh.rh;end;if p<>0 then printesc(65694);10:end;{:297}
{311:}procedure runaway;var p:halfword;
begin if scannerstatus>1 then begin printnl(65875);
case scannerstatus of 2:begin print(65876);p:=defref;end;
3:begin print(65877);p:=memtop-3;end;4:begin print(65878);p:=memtop-4;
end;5:begin print(65879);p:=defref;end;end;printchar(63);println;
showtokenlist(mem[p].hh.rh,0,errorline-10);end;end;{:311}{:119}{120:}
function getavail:halfword;var p:halfword;begin p:=avail;
if p<>0 then avail:=mem[avail].hh.rh else if memend<memmax then begin
incr(memend);p:=memend;end else begin decr(himemmin);p:=himemmin;
if himemmin<=lomemmax then begin runaway;
overflow(65586,memmax+1-memmin);end;end;mem[p].hh.rh:=0;
ifdef('STAT')incr(dynused);endif('STAT')getavail:=p;end;{:120}{123:}
procedure flushlist(p:halfword);var q,r:halfword;
begin if p<>0 then begin r:=p;repeat q:=r;r:=mem[r].hh.rh;
ifdef('STAT')decr(dynused);endif('STAT')until r=0;mem[q].hh.rh:=avail;
avail:=p;end;end;{:123}{125:}function getnode(s:integer):halfword;
label 40,10,20;var p:halfword;q:halfword;r:integer;t:integer;
begin 20:p:=rover;repeat{127:}q:=p+mem[p].hh.lh;
while(mem[q].hh.rh=1073741823)do begin t:=mem[q+1].hh.rh;
if q=rover then rover:=t;mem[t+1].hh.lh:=mem[q+1].hh.lh;
mem[mem[q+1].hh.lh+1].hh.rh:=t;q:=q+mem[q].hh.lh;end;r:=q-s;
if r>p+1 then{128:}begin mem[p].hh.lh:=r-p;rover:=p;goto 40;end{:128};
if r=p then if mem[p+1].hh.rh<>p then{129:}begin rover:=mem[p+1].hh.rh;
t:=mem[p+1].hh.lh;mem[rover+1].hh.lh:=t;mem[t+1].hh.rh:=rover;goto 40;
end{:129};mem[p].hh.lh:=q-p{:127};p:=mem[p+1].hh.rh;until p=rover;
if s=1073741824 then begin getnode:=1073741823;goto 10;end;
if lomemmax+2<himemmin then if lomemmax+2<=membot+1073741823 then{126:}
begin if himemmin-lomemmax>=1998 then t:=lomemmax+1000 else t:=lomemmax
+1+(himemmin-lomemmax)div 2;p:=mem[rover+1].hh.lh;q:=lomemmax;
mem[p+1].hh.rh:=q;mem[rover+1].hh.lh:=q;
if t>membot+1073741823 then t:=membot+1073741823;mem[q+1].hh.rh:=rover;
mem[q+1].hh.lh:=p;mem[q].hh.rh:=1073741823;mem[q].hh.lh:=t-lomemmax;
lomemmax:=t;mem[lomemmax].hh.rh:=0;mem[lomemmax].hh.lh:=0;rover:=q;
goto 20;end{:126};overflow(65586,memmax+1-memmin);40:mem[r].hh.rh:=0;
ifdef('STAT')varused:=varused+s;endif('STAT')getnode:=r;10:end;{:125}
{130:}procedure freenode(p:halfword;s:halfword);var q:halfword;
begin mem[p].hh.lh:=s;mem[p].hh.rh:=1073741823;q:=mem[rover+1].hh.lh;
mem[p+1].hh.lh:=q;mem[p+1].hh.rh:=rover;mem[rover+1].hh.lh:=p;
mem[q+1].hh.rh:=p;ifdef('STAT')varused:=varused-s;endif('STAT')end;
{:130}{131:}ifdef('INITEX')procedure sortavail;var p,q,r:halfword;
oldrover:halfword;begin p:=getnode(1073741824);p:=mem[rover+1].hh.rh;
mem[rover+1].hh.rh:=1073741823;oldrover:=rover;
while p<>oldrover do{132:}if p<rover then begin q:=p;p:=mem[q+1].hh.rh;
mem[q+1].hh.rh:=rover;rover:=q;end else begin q:=rover;
while mem[q+1].hh.rh<p do q:=mem[q+1].hh.rh;r:=mem[p+1].hh.rh;
mem[p+1].hh.rh:=mem[q+1].hh.rh;mem[q+1].hh.rh:=p;p:=r;end{:132};
p:=rover;
while mem[p+1].hh.rh<>1073741823 do begin mem[mem[p+1].hh.rh+1].hh.lh:=p
;p:=mem[p+1].hh.rh;end;mem[p+1].hh.rh:=rover;mem[rover+1].hh.lh:=p;end;
endif('INITEX'){:131}{136:}function newnullbox:halfword;var p:halfword;
begin p:=getnode(8);mem[p].hh.b0:=0;mem[p].hh.b1:=0;mem[p+1].int:=0;
mem[p+2].int:=0;mem[p+3].int:=0;mem[p+4].int:=0;mem[p+5].hh.rh:=0;
mem[p+5].hh.b0:=0;mem[p+5].hh.b1:=0;mem[p+6].gr:=0.0;
mem[p+7].int:=neweqtbint(1049482);newnullbox:=p;end;{:136}{139:}
function newrule:halfword;var p:halfword;begin p:=getnode(5);
mem[p].hh.b0:=2;mem[p].hh.b1:=0;mem[p+1].int:=-1073741824;
mem[p+2].int:=-1073741824;mem[p+3].int:=-1073741824;mem[p+4].hh.lh:=-1;
newrule:=p;end;{:139}{144:}function newligature(f,c:quarterword;
q:halfword):halfword;var p:halfword;begin p:=getnode(2);mem[p].hh.b0:=6;
mem[p+1].hh.b0:=f;mem[p+1].hh.b1:=c;mem[p+1].hh.rh:=q;mem[p].hh.b1:=0;
newligature:=p;end;function newligitem(c:quarterword):halfword;
var p:halfword;begin p:=getnode(2);mem[p].hh.b1:=c;mem[p+1].hh.rh:=0;
newligitem:=p;end;{:144}{145:}function newdisc:halfword;var p:halfword;
begin p:=getnode(2);mem[p].hh.b0:=7;mem[p].hh.b1:=0;mem[p+1].hh.lh:=0;
mem[p+1].hh.rh:=0;newdisc:=p;end;{:145}{147:}function newmath(w:scaled;
s:smallnumber):halfword;var p:halfword;begin p:=getnode(2);
mem[p].hh.b0:=9;mem[p].hh.b1:=s;mem[p+1].int:=w;newmath:=p;end;{:147}
{151:}function newspec(p:halfword):halfword;var q:halfword;
begin q:=getnode(4);mem[q]:=mem[p];mem[q].hh.rh:=0;
mem[q+1].int:=mem[p+1].int;mem[q+2].int:=mem[p+2].int;
mem[q+3].int:=mem[p+3].int;newspec:=q;end;{:151}{152:}
function newparamglue(n:smallnumber):halfword;var p:halfword;q:halfword;
begin p:=getnode(2);mem[p].hh.b0:=10;mem[p].hh.b1:=n+1;
mem[p+1].hh.rh:=0;q:={226:}newequiv(393230+n){:226};mem[p+1].hh.lh:=q;
incr(mem[q].hh.rh);newparamglue:=p;end;{:152}{153:}
function newglue(q:halfword):halfword;var p:halfword;
begin p:=getnode(2);mem[p].hh.b0:=10;mem[p].hh.b1:=0;mem[p+1].hh.rh:=0;
mem[p+1].hh.lh:=q;incr(mem[q].hh.rh);newglue:=p;end;{:153}{154:}
function newskipparam(n:smallnumber):halfword;var p:halfword;
begin tempptr:=newspec({226:}newequiv(393230+n){:226});
p:=newglue(tempptr);mem[tempptr].hh.rh:=0;mem[p].hh.b1:=n+1;
newskipparam:=p;end;{:154}{156:}function newkern(w:scaled):halfword;
var p:halfword;begin p:=getnode(2);mem[p].hh.b0:=11;mem[p].hh.b1:=0;
mem[p+1].int:=w;newkern:=p;end;{:156}{158:}
function newpenalty(m:integer):halfword;var p:halfword;
begin p:=getnode(2);mem[p].hh.b0:=12;mem[p].hh.b1:=0;mem[p+1].int:=m;
newpenalty:=p;end;{:158}{167:}
ifdef('TEXMF_DEBUG')procedure checkmem(printlocs:boolean);label 31,32;
var p,q:halfword;clobbered:boolean;
begin for p:=memmin to lomemmax do freearr[p]:=false;
for p:=himemmin to memend do freearr[p]:=false;{168:}p:=avail;q:=0;
clobbered:=false;
while p<>0 do begin if(p>memend)or(p<himemmin)then clobbered:=true else
if freearr[p]then clobbered:=true;
if clobbered then begin printnl(65587);printint(q);goto 31;end;
freearr[p]:=true;q:=p;p:=mem[q].hh.rh;end;31:{:168};{169:}p:=rover;q:=0;
clobbered:=false;
repeat if(p>=lomemmax)or(p<memmin)then clobbered:=true else if(mem[p+1].
hh.rh>=lomemmax)or(mem[p+1].hh.rh<memmin)then clobbered:=true else if
not((mem[p].hh.rh=1073741823))or(mem[p].hh.lh<2)or(p+mem[p].hh.lh>
lomemmax)or(mem[mem[p+1].hh.rh+1].hh.lh<>p)then clobbered:=true;
if clobbered then begin printnl(65588);printint(q);goto 32;end;
for q:=p to p+mem[p].hh.lh-1 do begin if freearr[q]then begin printnl(
65589);printint(q);goto 32;end;freearr[q]:=true;end;q:=p;
p:=mem[p+1].hh.rh;until p=rover;32:{:169};{170:}p:=memmin;
while p<=lomemmax do begin if(mem[p].hh.rh=1073741823)then begin printnl
(65590);printint(p);end;while(p<=lomemmax)and not freearr[p]do incr(p);
while(p<=lomemmax)and freearr[p]do incr(p);end{:170};
if printlocs then{171:}begin printnl(65591);
for p:=memmin to lomemmax do if not freearr[p]and((p>waslomax)or wasfree
[p])then begin printchar(32);printint(p);end;
for p:=himemmin to memend do if not freearr[p]and((p<washimin)or(p>
wasmemend)or wasfree[p])then begin printchar(32);printint(p);end;
end{:171};for p:=memmin to lomemmax do wasfree[p]:=freearr[p];
for p:=himemmin to memend do wasfree[p]:=freearr[p];wasmemend:=memend;
waslomax:=lomemmax;washimin:=himemmin;end;endif('TEXMF_DEBUG'){:167}
{172:}ifdef('TEXMF_DEBUG')procedure searchmem(p:halfword);var q:integer;
begin for q:=memmin to lomemmax do begin if mem[q].hh.rh=p then begin
printnl(65592);printint(q);printchar(41);end;
if mem[q].hh.lh=p then begin printnl(65593);printint(q);printchar(41);
end;end;
for q:=himemmin to memend do begin if mem[q].hh.rh=p then begin printnl(
65592);printint(q);printchar(41);end;
if mem[q].hh.lh=p then begin printnl(65593);printint(q);printchar(41);
end;end;{260:}
for q:=1 to 720958 do begin if newequiv(q)=p then begin printnl(65791);
printint(q);printchar(41);end;end{:260};{290:}
if saveptr>0 then for q:=0 to saveptr-1 do begin if savestack[q].hh.rh=p
then begin printnl(65852);printint(q);printchar(41);end;end{:290};{969:}
for q:=0 to hyphsize do begin if hyphlist[q]=p then begin printnl(66299)
;printint(q);printchar(41);end;end{:969};end;endif('TEXMF_DEBUG'){:172}
{174:}procedure shortdisplay(p:integer);var n:integer;
begin while p>memmin do begin if(p>=himemmin)then begin if p<=memend
then begin if mem[p].hh.b0<>fontinshortdisplay then begin{272:}
printesc(newhashtext(1442736+mem[p].hh.b0)){:272};printchar(32);
fontinshortdisplay:=mem[p].hh.b0;end;print(mem[p].hh.b1);end;
end else{175:}case mem[p].hh.b0 of 0,1,3,8,4,5,13:print(65594);
2:printchar(124);10:if mem[p+1].hh.lh<>membot then printchar(32);
9:printchar(36);6:shortdisplay(mem[p+1].hh.rh);
7:begin shortdisplay(mem[p+1].hh.lh);shortdisplay(mem[p+1].hh.rh);
n:=mem[p].hh.b1;
while n>0 do begin if mem[p].hh.rh<>0 then p:=mem[p].hh.rh;decr(n);end;
end;others:end{:175};p:=mem[p].hh.rh;end;end;{:174}{176:}
procedure printfontandchar(p:integer);
begin if p>memend then printesc(65595)else begin{272:}
printesc(newhashtext(1442736+mem[p].hh.b0)){:272};printchar(32);
print(mem[p].hh.b1);end;end;procedure printmark(p:integer);
begin printchar(123);
if(p<himemmin)or(p>memend)then printesc(65595)else showtokenlist(mem[p].
hh.rh,0,maxprintline-10);printchar(125);end;
procedure printruledimen(d:scaled);
begin if(d=-1073741824)then printchar(42)else printscaled(d);end;
procedure printdir(d:integer);begin print(dirnames[dirprimary[d]]);
print(dirnames[dirsecondary[d]]);print(dirnames[dirtertiary[d]]);end;
{:176}{177:}procedure printglue(d:scaled;order:integer;s:strnumber);
begin printscaled(d);
if(order<0)or(order>4)then print(65596)else if order>0 then begin print(
65597);while order>1 do begin printchar(108);decr(order);end;
end else if s<>0 then print(s);end;{:177}{178:}
procedure printspec(p:integer;s:strnumber);
begin if(p<memmin)or(p>=lomemmax)then printchar(42)else begin
printscaled(mem[p+1].int);if s<>0 then print(s);
if mem[p+2].int<>0 then begin print(65598);
printglue(mem[p+2].int,mem[p].hh.b0,s);end;
if mem[p+3].int<>0 then begin print(65599);
printglue(mem[p+3].int,mem[p].hh.b1,s);end;end;end;{:178}{179:}{725:}
procedure printfamandchar(p:halfword);begin printesc(65750);
printint(mem[p].hh.b0);printchar(32);print(mem[p].hh.b1);end;
procedure printdelimiter(p:halfword);var a:integer;
begin a:=mem[p].qqqq.b0*256+mem[p].qqqq.b1;
a:=a*4096+mem[p].qqqq.b2*256+mem[p].qqqq.b3;
if a<0 then printint(a)else printhex(a);end;{:725}{726:}
procedure showinfo;forward;procedure printsubsidiarydata(p:halfword;
c:ASCIIcode);
begin if(poolptr-strstartar[strptr-65536])>=depththreshold then begin if
mem[p].hh.rh<>0 then print(65600);
end else begin begin strpool[poolptr]:=c;incr(poolptr);end;tempptr:=p;
case mem[p].hh.rh of 1:begin println;printcurrentstring;
printfamandchar(p);end;2:showinfo;
3:if mem[p].hh.lh=0 then begin println;printcurrentstring;print(66218);
end else showinfo;others:end;decr(poolptr);end;end;{:726}{728:}
procedure printstyle(c:integer);begin case c div 2 of 0:printesc(66219);
1:printesc(66220);2:printesc(66221);3:printesc(66222);
others:print(66223)end;end;{:728}{227:}
procedure printskipparam(n:integer);begin case n of 0:printesc(65662);
1:printesc(65663);2:printesc(65664);3:printesc(65665);4:printesc(65666);
5:printesc(65667);6:printesc(65668);7:printesc(65669);8:printesc(65670);
9:printesc(65671);10:printesc(65672);11:printesc(65673);
12:printesc(65674);13:printesc(65675);14:printesc(65676);
15:printesc(65677);16:printesc(65678);17:printesc(65679);
others:print(65680)end;end;{:227}{:179}{182:}
procedure shownodelist(p:integer);label 10;var n:integer;g:real;
begin if(poolptr-strstartar[strptr-65536])>depththreshold then begin if
p>0 then print(65600);goto 10;end;n:=0;while p>memmin do begin println;
printcurrentstring;if p>memend then begin print(65601);goto 10;end;
incr(n);if n>breadthmax then begin print(65602);goto 10;end;{183:}
if(p>=himemmin)then printfontandchar(p)else case mem[p].hh.b0 of 0,1,13:
{184:}
begin if mem[p].hh.b0=0 then printesc(104)else if mem[p].hh.b0=1 then
printesc(118)else printesc(65604);print(65605);
printscaled(mem[p+3].int);printchar(43);printscaled(mem[p+2].int);
print(65606);printscaled(mem[p+1].int);if mem[p].hh.b0=13 then{185:}
begin if mem[p].hh.b1<>0 then begin print(65570);
printint(mem[p].hh.b1+1);print(65609);end;
if mem[p+6].int<>0 then begin print(65610);
printglue(mem[p+6].int,mem[p+5].hh.b1,0);end;
if mem[p+4].int<>0 then begin print(65611);
printglue(mem[p+4].int,mem[p+5].hh.b0,0);end;end{:185}else begin{186:}
g:=mem[p+6].gr;if(g<>0.0)and(mem[p+5].hh.b0<>0)then begin print(65612);
if mem[p+5].hh.b0=2 then print(65613);
if fabs(g)>20000.0 then begin if g>0.0 then printchar(62)else print(
65614);printglue(20000*65536,mem[p+5].hh.b1,0);
end else printglue(round(65536*g),mem[p+5].hh.b1,0);end{:186};
if mem[p+4].int<>0 then begin print(65607);printscaled(mem[p+4].int);
end;print(65608);printdir(mem[p+7].int);end;
begin begin strpool[poolptr]:=46;incr(poolptr);end;
shownodelist(mem[p+5].hh.rh);decr(poolptr);end;end{:184};2:{187:}
begin printesc(65615);printruledimen(mem[p+3].int);printchar(43);
printruledimen(mem[p+2].int);print(65606);printruledimen(mem[p+1].int);
end{:187};3:{188:}begin printesc(65616);printint(mem[p].hh.b1);
print(65617);printscaled(mem[p+3].int);print(65618);
printspec(mem[p+4].hh.rh,0);printchar(44);printscaled(mem[p+2].int);
print(65619);printint(mem[p+1].int);begin begin strpool[poolptr]:=46;
incr(poolptr);end;shownodelist(mem[p+4].hh.lh);decr(poolptr);end;
end{:188};8:{1398:}
case mem[p].hh.b1 of 0:begin printwritewhatsit(66664,p);printchar(61);
printfilename(mem[p+1].hh.rh,mem[p+2].hh.lh,mem[p+2].hh.rh);end;
1:begin printwritewhatsit(65903,p);printmark(mem[p+1].hh.rh);end;
2:printwritewhatsit(66665,p);3:begin printesc(66666);
printmark(mem[p+1].hh.rh);end;4:begin printesc(66666);print(66678);
printmark(mem[p+1].hh.rh);end;5:begin printesc(66668);
printint(mem[p+1].hh.rh);print(66679);printint(mem[p+1].hh.b0);
printchar(44);printint(mem[p+1].hh.b1);printchar(41);end;
7:if mem[p+1].hh.lh<0 then begin printesc(66680);print(32);
printdir(mem[p+1].hh.lh+64);end else begin printesc(66681);print(32);
printdir(mem[p+1].hh.lh);end;{1424:}6:begin printesc(66700);
begin strpool[poolptr]:=46;incr(poolptr);end;println;printcurrentstring;
printesc(66669);print(61);printint(mem[p+1].int);println;
printcurrentstring;printesc(66670);print(61);printint(mem[p+2].int);
println;printcurrentstring;printesc(66462);
if mem[p+3].int=0 then print(66701)else begin begin strpool[poolptr]:=46
;incr(poolptr);end;shownodelist(mem[p+3].int);decr(poolptr);end;println;
printcurrentstring;printesc(66463);
if mem[p+5].int=0 then print(66701)else begin begin strpool[poolptr]:=46
;incr(poolptr);end;shownodelist(mem[p+5].int);decr(poolptr);end;
decr(poolptr);end{:1424};others:print(66682)end{:1398};10:{189:}
if mem[p].hh.b1>=100 then{190:}begin printesc(65624);
if mem[p].hh.b1=101 then printchar(99)else if mem[p].hh.b1=102 then
printchar(120);print(65625);printspec(mem[p+1].hh.lh,0);
begin begin strpool[poolptr]:=46;incr(poolptr);end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);end;end{:190}
else begin printesc(65620);if mem[p].hh.b1<>0 then begin printchar(40);
if mem[p].hh.b1<98 then printskipparam(mem[p].hh.b1-1)else if mem[p].hh.
b1=98 then printesc(65621)else printesc(65622);printchar(41);end;
if mem[p].hh.b1<>98 then begin printchar(32);
if mem[p].hh.b1<98 then printspec(mem[p+1].hh.lh,0)else printspec(mem[p
+1].hh.lh,65623);end;end{:189};11:{191:}
if mem[p].hh.b1<>99 then begin printesc(65626);
if mem[p].hh.b1<>0 then printchar(32);printscaled(mem[p+1].int);
if mem[p].hh.b1=2 then print(65627);end else begin printesc(65628);
printscaled(mem[p+1].int);print(65623);end{:191};9:{192:}
begin printesc(65629);
if mem[p].hh.b1=0 then print(65630)else print(65631);
if mem[p+1].int<>0 then begin print(65632);printscaled(mem[p+1].int);
end;end{:192};6:{193:}begin printfontandchar(p+1);print(65633);
if mem[p].hh.b1>1 then printchar(124);
fontinshortdisplay:=mem[p+1].hh.b0;shortdisplay(mem[p+1].hh.rh);
if odd(mem[p].hh.b1)then printchar(124);printchar(41);end{:193};
12:{194:}begin printesc(65634);printint(mem[p+1].int);end{:194};7:{195:}
begin printesc(65635);if mem[p].hh.b1>0 then begin print(65636);
printint(mem[p].hh.b1);end;begin begin strpool[poolptr]:=46;
incr(poolptr);end;shownodelist(mem[p+1].hh.lh);decr(poolptr);end;
begin strpool[poolptr]:=124;incr(poolptr);end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);end{:195};4:{196:}
begin printesc(65637);if mem[p+1].hh.lh<>0 then begin printchar(115);
printint(mem[p+1].hh.lh);end;printmark(mem[p+1].hh.rh);end{:196};
5:{197:}begin printesc(65638);begin begin strpool[poolptr]:=46;
incr(poolptr);end;shownodelist(mem[p+1].int);decr(poolptr);end;end{:197}
;{724:}14:printstyle(mem[p].hh.b1);15:{729:}begin printesc(65823);
begin strpool[poolptr]:=68;incr(poolptr);end;
shownodelist(mem[p+1].hh.lh);decr(poolptr);begin strpool[poolptr]:=84;
incr(poolptr);end;shownodelist(mem[p+1].hh.rh);decr(poolptr);
begin strpool[poolptr]:=83;incr(poolptr);end;
shownodelist(mem[p+2].hh.lh);decr(poolptr);begin strpool[poolptr]:=115;
incr(poolptr);end;shownodelist(mem[p+2].hh.rh);decr(poolptr);end{:729};
16,17,18,19,20,21,22,23,24,27,26,29,28,30,31:{730:}
begin case mem[p].hh.b0 of 16:printesc(66224);17:printesc(66225);
18:printesc(66226);19:printesc(66227);20:printesc(66228);
21:printesc(66229);22:printesc(66230);23:printesc(66231);
27:printesc(66232);26:printesc(66233);29:printesc(65840);
24:begin printesc(65832);printdelimiter(p+4);end;
28:begin printesc(65798);printfamandchar(p+4);end;
30:begin printesc(66234);printdelimiter(p+1);end;
31:begin if mem[p].hh.b1=0 then printesc(66235)else printesc(66236);
printdelimiter(p+1);end;end;
if mem[p].hh.b0<30 then begin if mem[p].hh.b1<>0 then if mem[p].hh.b1=1
then printesc(66237)else printesc(66238);printsubsidiarydata(p+1,46);
end;printsubsidiarydata(p+2,94);printsubsidiarydata(p+3,95);end{:730};
25:{731:}begin printesc(66239);
if mem[p+1].int=1073741824 then print(66240)else printscaled(mem[p+1].
int);
if(mem[p+4].qqqq.b0<>0)or(mem[p+4].qqqq.b1<>0)or(mem[p+4].qqqq.b2<>0)or(
mem[p+4].qqqq.b3<>0)then begin print(66241);printdelimiter(p+4);end;
if(mem[p+5].qqqq.b0<>0)or(mem[p+5].qqqq.b1<>0)or(mem[p+5].qqqq.b2<>0)or(
mem[p+5].qqqq.b3<>0)then begin print(66242);printdelimiter(p+5);end;
printsubsidiarydata(p+2,92);printsubsidiarydata(p+3,47);end{:731};{:724}
others:print(65603)end{:183};p:=mem[p].hh.rh;end;10:end;{:182}{198:}
procedure showbox(p:halfword);begin{238:}
depththreshold:=neweqtbint(1049433);
breadthmax:=neweqtbint(1049432){:238};
if breadthmax<=0 then breadthmax:=5;
if poolptr+depththreshold>=poolsize then depththreshold:=poolsize-
poolptr-1;shownodelist(p);println;end;{:198}{200:}
procedure deletetokenref(p:halfword);
begin if mem[p].hh.lh=0 then flushlist(p)else decr(mem[p].hh.lh);end;
{:200}{201:}procedure deleteglueref(p:halfword);
begin if mem[p].hh.rh=0 then freenode(p,4)else decr(mem[p].hh.rh);end;
{:201}{202:}procedure flushnodelist(p:halfword);label 30;var q:halfword;
begin while p<>0 do begin q:=mem[p].hh.rh;
if(p>=himemmin)then begin mem[p].hh.rh:=avail;avail:=p;
ifdef('STAT')decr(dynused);
endif('STAT')end else begin case mem[p].hh.b0 of 0,1,13:begin
flushnodelist(mem[p+5].hh.rh);freenode(p,8);goto 30;end;
2:begin freenode(p,5);goto 30;end;3:begin flushnodelist(mem[p+4].hh.lh);
deleteglueref(mem[p+4].hh.rh);freenode(p,5);goto 30;end;8:{1400:}
begin case mem[p].hh.b1 of 0:freenode(p,3);
1,3,4:begin deletetokenref(mem[p+1].hh.rh);freenode(p,2);goto 30;end;
2,5:freenode(p,2);7:freenode(p,4);6:freenode(p,8);
others:confusion(66684)end;goto 30;end{:1400};
10:begin begin if mem[mem[p+1].hh.lh].hh.rh=0 then freenode(mem[p+1].hh.
lh,4)else decr(mem[mem[p+1].hh.lh].hh.rh);end;
if mem[p+1].hh.rh<>0 then flushnodelist(mem[p+1].hh.rh);end;11,9,12:;
6:flushnodelist(mem[p+1].hh.rh);4:deletetokenref(mem[p+1].hh.rh);
7:begin flushnodelist(mem[p+1].hh.lh);flushnodelist(mem[p+1].hh.rh);end;
5:flushnodelist(mem[p+1].int);{732:}14:begin freenode(p,3);goto 30;end;
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
flushnodelist(mem[p+3].hh.lh);freenode(p,6);goto 30;end;{:732}
others:confusion(65639)end;freenode(p,2);30:end;p:=q;end;end;{:202}
{204:}function copynodelist(p:halfword):halfword;var h:halfword;
q:halfword;r:halfword;words:0..8;begin h:=getavail;q:=h;
while p<>0 do begin{205:}words:=1;
if(p>=himemmin)then r:=getavail else{206:}
case mem[p].hh.b0 of 0,1,13:begin r:=getnode(8);mem[r+7]:=mem[p+7];
mem[r+6]:=mem[p+6];mem[r+5]:=mem[p+5];
mem[r+5].hh.rh:=copynodelist(mem[p+5].hh.rh);words:=5;end;
2:begin r:=getnode(5);words:=5;end;3:begin r:=getnode(5);
mem[r+4]:=mem[p+4];incr(mem[mem[p+4].hh.rh].hh.rh);
mem[r+4].hh.lh:=copynodelist(mem[p+4].hh.lh);words:=4;end;8:{1399:}
case mem[p].hh.b1 of 0:begin r:=getnode(3);words:=3;end;
1,3,4:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
2,5:begin r:=getnode(2);words:=2;end;7:begin r:=getnode(4);words:=4;end;
6:begin r:=getnode(8);words:=8;end;others:confusion(66683)end{:1399};
10:begin r:=getnode(2);incr(mem[mem[p+1].hh.lh].hh.rh);
mem[r+1].hh.lh:=mem[p+1].hh.lh;
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;
11,9,12:begin r:=getnode(2);words:=2;end;6:begin r:=getnode(2);
mem[r+1]:=mem[p+1];mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;
7:begin r:=getnode(2);mem[r+1].hh.lh:=copynodelist(mem[p+1].hh.lh);
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;4:begin r:=getnode(2);
incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;5:begin r:=getnode(2);
mem[r+1].int:=copynodelist(mem[p+1].int);end;
others:confusion(65640)end{:206};while words>0 do begin decr(words);
mem[r+words]:=mem[p+words];end{:205};mem[q].hh.rh:=r;q:=r;
p:=mem[p].hh.rh;end;mem[q].hh.rh:=0;q:=mem[h].hh.rh;
begin mem[h].hh.rh:=avail;avail:=h;ifdef('STAT')decr(dynused);
endif('STAT')end;copynodelist:=q;end;{:204}{211:}
procedure printmode(m:integer);
begin if m>0 then case m div(118)of 0:print(65641);1:print(65642);
2:print(65643);
end else if m=0 then print(65644)else case(-m)div(118)of 0:print(65645);
1:print(65646);2:print(65629);end;print(65647);end;{:211}{216:}{1421:}
function makelocalparnode:halfword;var p:halfword;begin p:=getnode(8);
mem[p].hh.b0:=8;mem[p].hh.b1:=6;mem[p].hh.rh:=0;
mem[p+1].int:=neweqtbint(1049463);mem[p+2].int:=neweqtbint(1049464);
if newequiv(655421)=0 then begin mem[p+3].int:=0;mem[p+4].int:=0;
end else begin mem[p+3].int:=copynodelist(newequiv(655421));
mem[p+4].int:=mem[newequiv(655421)+1].int;end;
if newequiv(655422)=0 then begin mem[p+5].int:=0;mem[p+6].int:=0;
end else begin mem[p+5].int:=copynodelist(newequiv(655422));
mem[p+6].int:=mem[newequiv(655422)+1].int;end;
mem[p+7].int:=neweqtbint(1049481);makelocalparnode:=p;end{:1421};{:216}
{217:}{1429:}function newdir(s:smallnumber):halfword;var p:halfword;
begin p:=getnode(4);mem[p].hh.b0:=8;mem[p].hh.b1:=7;mem[p+1].hh.lh:=s;
mem[p+3].hh.lh:=0;mem[p+2].hh.lh:=-1;mem[p+1].hh.rh:=curlevel;newdir:=p;
end{:1429};{:217}{218:}procedure pushnest;
begin if nestptr>maxneststack then begin maxneststack:=nestptr;
if nestptr=nestsize then overflow(65648,nestsize);end;
nest[nestptr]:=curlist;incr(nestptr);curlist.headfield:=getavail;
curlist.tailfield:=curlist.headfield;curlist.pgfield:=0;
curlist.mlfield:=line;curlist.eTeXauxfield:=0;curlist.dirsfield:=0;
curlist.mathfield:=false;curlist.localparfield:=makelocalparnode;
curlist.localparboolfield:=false;end;{:218}{219:}procedure popnest;
begin if curlist.localparfield<>0 then begin if curlist.
localparboolfield then begin end else freenode(curlist.localparfield,8);
end;begin mem[curlist.headfield].hh.rh:=avail;avail:=curlist.headfield;
ifdef('STAT')decr(dynused);endif('STAT')end;decr(nestptr);
curlist:=nest[nestptr];end;{:219}{220:}procedure printtotals;forward;
procedure showactivities;var p:0..nestsize;m:-237..237;a:memoryword;
q,r:halfword;t:integer;begin nest[nestptr]:=curlist;printnl(65624);
println;for p:=nestptr downto 0 do begin m:=nest[p].modefield;
a:=nest[p].auxfield;printnl(65649);printmode(m);print(65650);
printint(abs(nest[p].mlfield));
if m=119 then if nest[p].pgfield<>8585216 then begin print(65651);
printint(nest[p].pgfield mod 65536);print(65652);
printint(nest[p].pgfield div 4194304);printchar(44);
printint((nest[p].pgfield div 65536)mod 64);printchar(41);end;
if nest[p].mlfield<0 then print(65653);if p=0 then begin{1022:}
if memtop-2<>pagetail then begin printnl(66340);
if outputactive then print(66341);showbox(mem[memtop-2].hh.rh);
if pagecontents>0 then begin printnl(66342);printtotals;printnl(66343);
printscaled(pagesofar[0]);r:=mem[memtop].hh.rh;
while r<>memtop do begin println;printesc(65616);t:=mem[r].hh.b1;
printint(t);print(66344);
if neweqtbint(1049484+t)=1000 then t:=mem[r+3].int else t:=xovern(mem[r
+3].int,1000)*neweqtbint(1049484+t);printscaled(t);
if mem[r].hh.b0=1 then begin q:=memtop-2;t:=0;repeat q:=mem[q].hh.rh;
if(mem[q].hh.b0=3)and(mem[q].hh.b1=mem[r].hh.b1)then incr(t);
until q=mem[r+1].hh.lh;print(66345);printint(t);print(66346);end;
r:=mem[r].hh.rh;end;end;end{:1022};
if mem[memtop-1].hh.rh<>0 then printnl(65654);end;
showbox(mem[nest[p].headfield].hh.rh);{221:}
case abs(m)div(118)of 0:begin printnl(65655);
if a.int<=-65536000 then print(65656)else printscaled(a.int);
if nest[p].pgfield<>0 then begin print(65657);printint(nest[p].pgfield);
print(65658);if nest[p].pgfield<>1 then printchar(115);end;end;
1:begin printnl(65659);printint(a.hh.lh);
if m>0 then if a.hh.rh>0 then begin print(65660);printint(a.hh.rh);end;
end;2:if a.int<>0 then begin print(65661);showbox(a.int);end;end{:221};
end;end;{:220}{239:}procedure printparam(n:integer);
begin case n of 0:printesc(65706);1:printesc(65707);2:printesc(65708);
3:printesc(65709);4:printesc(65710);5:printesc(65711);6:printesc(65712);
7:printesc(65713);8:printesc(65714);9:printesc(65715);
10:printesc(65716);11:printesc(65717);12:printesc(65718);
13:printesc(65719);14:printesc(65720);15:printesc(65721);
16:printesc(65722);17:printesc(65723);18:printesc(65724);
19:printesc(65725);20:printesc(65726);21:printesc(65727);
22:printesc(65728);23:printesc(65729);24:printesc(65730);
25:printesc(65731);26:printesc(65732);27:printesc(65733);
28:printesc(65734);29:printesc(65735);30:printesc(65736);
31:printesc(65737);32:printesc(65738);33:printesc(65739);
34:printesc(65740);35:printesc(65741);36:printesc(65742);
37:printesc(65743);38:printesc(65744);39:printesc(65745);
40:printesc(65746);41:printesc(65747);42:printesc(65748);
43:printesc(65749);44:printesc(65750);45:printesc(65751);
46:printesc(65752);47:printesc(65753);48:printesc(65754);
49:printesc(65755);50:printesc(65756);51:printesc(65757);
52:printesc(65758);53:printesc(65759);54:printesc(65760);{1464:}
61:printesc(66714);62:printesc(66715);63:printesc(66716);
64:printesc(66717);65:printesc(66718);66:printesc(66719);
67:printesc(66720);68:printesc(66721);69:printesc(66722);{:1464}
others:print(65761)end;end;{:239}{249:}procedure begindiagnostic;
begin oldsetting:=selector;
if(neweqtbint(1049437)<=0)and(selector=19)then begin decr(selector);
if history=0 then history:=1;end;end;
procedure enddiagnostic(blankline:boolean);begin printnl(65624);
if blankline then println;selector:=oldsetting;end;{:249}{251:}
procedure printlengthparam(n:integer);begin case n of 0:printesc(65764);
1:printesc(65765);2:printesc(65766);3:printesc(65767);4:printesc(65768);
5:printesc(65769);6:printesc(65770);7:printesc(65771);8:printesc(65772);
9:printesc(65773);10:printesc(65774);11:printesc(65775);
12:printesc(65776);13:printesc(65777);14:printesc(65778);
15:printesc(65779);16:printesc(65780);17:printesc(65781);
18:printesc(65782);19:printesc(65783);20:printesc(65784);
21:printesc(65785);22:printesc(65786);23:printesc(65787);
24:printesc(65788);others:print(65789)end;end;{:251}{255:}
function initeqtbentry(p:halfword):memoryword;var mw:memoryword;
begin if(p>=1)and(p<=393229)then begin mw.hh.rh:=0;mw.hh.b0:=118;
mw.hh.b1:=0;
end else if(p>=393230)and(p<=524321)then begin mw.hh.rh:=membot;
mw.hh.b0:=134;mw.hh.b1:=1;
end else if(p>=524320)and(p<524325)then begin mw.hh.rh:=0;mw.hh.b0:=135;
mw.hh.b1:=1;end else if(p>=524325)and(p<=655420)then begin mw.hh.rh:=0;
mw.hh.b0:=118;mw.hh.b1:=0;
end else if(p>=655423)and(p<=720958)then begin mw.hh.rh:=0;
mw.hh.b0:=136;mw.hh.b1:=1;
end else if(p>=720959)and(p<=721727)then begin mw.hh.rh:=0;
mw.hh.b0:=137;mw.hh.b1:=1;
end else if(p>=721728)and(p<=787263)then begin mw.hh.rh:=12;
mw.hh.b0:=137;mw.hh.b1:=1;
end else if(p>=787264)and(p<=918335)then begin mw.hh.rh:=0;
mw.hh.b0:=137;mw.hh.b1:=1;
end else if(p>=918336)and(p<=983871)then begin mw.hh.rh:=1000;
mw.hh.b0:=137;mw.hh.b1:=1;
end else if(p>=983872)and(p<=1049407)then begin mw.hh.rh:=p-983872;
mw.hh.b0:=137;mw.hh.b1:=1;
end else if(p>=1049408)and(p<=1115019)then begin setintzero(mw,0);
setintone(mw,0);
end else if(p>=1115020)and(p<=1180555)then begin setintzero(mw,-1);
setintone(mw,-1);
end else if(p>=1180556)and(p<=1246116)then begin setintzero(mw,0);
setintone(mw,0);end else begin mw.hh.rh:=0;mw.hh.b0:=118;mw.hh.b1:=0;
end;initeqtbentry:=mw;end;{:255}{257:}{303:}
procedure printcmdchr(cmd:quarterword;chrcode:halfword);var n:integer;
begin case cmd of 1:begin print(65862);print(chrcode);end;
2:begin print(65863);print(chrcode);end;3:begin print(65864);
print(chrcode);end;6:begin print(65865);print(chrcode);end;
7:begin print(65866);print(chrcode);end;8:begin print(65867);
print(chrcode);end;9:print(65868);10:begin print(65869);print(chrcode);
end;11:begin print(65870);print(chrcode);end;12:begin print(65871);
print(chrcode);end;{229:}
78,79:if chrcode<393248 then printskipparam(chrcode-393230)else if
chrcode<458784 then begin printesc(65681);printint(chrcode-393248);
end else begin printesc(65682);printint(chrcode-458784);end;{:229}{233:}
75:if chrcode>=589885 then begin printesc(65693);
printint(chrcode-589885);
end else case chrcode of 524325:printesc(65684);524326:printesc(65685);
524327:printesc(65686);524328:printesc(65687);524329:printesc(65688);
524330:printesc(65689);524331:printesc(65690);524332:printesc(65691);
{1463:}524333:printesc(66713);{:1463}others:printesc(65692)end;{:233}
{241:}76:if chrcode<1049484 then printparam(chrcode-1049408)else begin
printesc(65762);printint(chrcode-1049484);end;{:241}{253:}
77:if chrcode<1180581 then printlengthparam(chrcode-1180556)else begin
printesc(65790);printint(chrcode-1180581);end;{:253}{271:}
45:printesc(65798);96:printesc(65799);40:printesc(65800);
41:printesc(65801);
80:if chrcode=0 then printesc(65810)else if chrcode=1 then printesc(
65811)else if chrcode=2 then printesc(65812)else if chrcode=3 then
printesc(65813)else if chrcode=4 then printesc(65814)else print(65842);
61:printesc(65802);42:printesc(65830);16:printesc(65803);
68:if curchr=0 then printesc(65818)else printesc(65836);
124:printesc(65794);91:printesc(65809);
15:if chrcode=0 then printesc(65804)else printesc(65805);
98:printesc(65806);67:printesc(65795);62:printesc(65807);
64:printesc(32);119:if chrcode=0 then printesc(65808){1520:}
else printesc(66103){:1520};32:printesc(65815);36:printesc(65816);
39:printesc(65817);37:printesc(65616);44:printesc(47);
18:begin printesc(65637);if chrcode>0 then printchar(115);end;
46:if chrcode=0 then printesc(65819)else printesc(65821);
17:if chrcode=0 then printesc(65820)else printesc(65822);
54:printesc(65823);97:printesc(65824);34:printesc(65825);
65:printesc(65826);120:printesc(65827);55:printesc(65621);
63:printesc(65828);
66:if chrcode=0 then printesc(65832)else printesc(65833);
102:if chrcode=0 then printesc(65834){1517:}else printesc(66764){:1517};
0:printesc(65835);104:printesc(65837);83:printesc(65831);
87:case chrcode of 524320:printesc(65829);{1622:}524321:printesc(66797);
524322:printesc(66798);524323:printesc(66799);524324:printesc(66800);
{:1622}end;126:if chrcode=0 then printesc(65838){1492:}
else if chrcode=1 then printesc(66752)else printesc(66753){:1492};
74:{1590:}begin printesc(65693);
if chrcode<>membot then printsanum(chrcode);end{:1590};
38:printesc(65638);33:printesc(65839);56:printesc(65840);
35:printesc(65841);{:271}{340:}13:printesc(65906);{:340}{382:}
121:if chrcode=0 then printesc(65939){1505:}
else if chrcode=2 then printesc(66762){:1505}else printesc(65940);{:382}
{390:}127:begin case(chrcode mod 5)of 1:printesc(65942);
2:printesc(65943);3:printesc(65944);4:printesc(65945);
others:printesc(65941)end;if chrcode>=5 then printchar(115);end;{:390}
{418:}92:{1589:}
begin if(chrcode<membot)or(chrcode>membot+23)then cmd:=(mem[chrcode].hh.
b0 div 256)else begin cmd:=chrcode-membot;chrcode:=0;end;
if cmd=0 then printesc(65762)else if cmd=1 then printesc(65790)else if
cmd=2 then printesc(65681)else printesc(65682);
if chrcode<>0 then printsanum(chrcode);end{:1589};{:418}{423:}
82:if chrcode=1 then printesc(65985)else printesc(65984);
85:if chrcode=0 then printesc(65986){1498:}
else if chrcode=2 then printesc(66758){:1498}else printesc(65987);
86:if chrcode=1 then printesc(65988)else if chrcode=3 then printesc(
65989)else if chrcode=2 then printesc(65990)else print(65996);
73:case chrcode of 0:printesc(65991);1:printesc(65992);
2:printesc(65993);4:printesc(65994);{1452:}3:printesc(66702);
6:printesc(66703);7:printesc(66704);11:printesc(66705);
8:printesc(66706);9:printesc(66707);10:printesc(66708);{:1452}{1469:}
12:printesc(66737);13:printesc(66738);{:1469}{1472:}14:printesc(66739);
15:printesc(66740);16:printesc(66741);{:1472}{1475:}19:printesc(66742);
20:printesc(66743);21:printesc(66744);22:printesc(66745);{:1475}{1478:}
23:printesc(66746);24:printesc(66747);25:printesc(66748);{:1478}{1536:}
30:printesc(66773);31:printesc(66774);32:printesc(66775);
33:printesc(66776);{:1536}{1559:}17:printesc(66780);18:printesc(66781);
26:printesc(66782);27:printesc(66783);{:1559}{1563:}28:printesc(66784);
29:printesc(66785);{:1563}others:printesc(65995)end;{:423}{476:}
125:case chrcode of 0:printesc(66061);1:printesc(66062);
2:printesc(66063);3:printesc(66064);4:printesc(66065);5:printesc(66066);
6:printesc(66067);7:printesc(66068);8:printesc(66069);{1454:}
9:printesc(66709);10:printesc(66710);11:printesc(66711);{:1454}
others:printesc(65545)end;{:476}{495:}
122:begin if chrcode>=32 then printesc(66103);
case chrcode mod 32 of 1:printesc(66087);2:printesc(66088);
3:printesc(66089);4:printesc(66090);5:printesc(66091);6:printesc(66092);
7:printesc(66093);8:printesc(66094);9:printesc(66095);
10:printesc(66096);11:printesc(66097);12:printesc(66098);
13:printesc(66099);14:printesc(66100);15:printesc(66101);
16:printesc(66102);{1521:}17:printesc(66765);18:printesc(66766);
19:printesc(66767);{:1521}others:printesc(66086)end;end;{:495}{499:}
123:if chrcode=2 then printesc(65597)else if chrcode=4 then printesc(
66104)else printesc(66105);{:499}{815:}
4:if chrcode=65537 then printesc(66257)else begin print(66261);
print(chrcode);end;
5:if chrcode=65538 then printesc(66258)else printesc(66259);{:815}
{1020:}84:case chrcode of 0:printesc(66329);1:printesc(66330);
2:printesc(66331);3:printesc(66332);4:printesc(66333);5:printesc(66334);
6:printesc(66335);others:printesc(66336)end;{:1020}{1090:}
14:if chrcode=1 then printesc(66386)else printesc(66385);{:1090}{1096:}
26:case chrcode of 4:printesc(66387);0:printesc(66388);
1:printesc(66389);2:printesc(66390);others:printesc(66391)end;
27:case chrcode of 4:printesc(66392);0:printesc(66393);
1:printesc(66394);2:printesc(66395);others:printesc(66396)end;
28:printesc(65622);29:printesc(65626);30:printesc(65628);{:1096}{1109:}
21:if chrcode=1 then printesc(66414)else printesc(66415);
22:if chrcode=1 then printesc(66416)else printesc(66417);
20:case chrcode of 0:printesc(65695);1:printesc(66418);
2:printesc(66419);3:printesc(66324);4:printesc(66420);5:printesc(66326);
others:printesc(66421)end;
31:if chrcode=100 then printesc(66423)else if chrcode=101 then printesc(
66424)else if chrcode=102 then printesc(66425)else printesc(66422);
{:1109}{1126:}43:if chrcode=0 then printesc(66442)else printesc(66441);
{:1126}{1145:}
25:if chrcode=10 then printesc(66453)else if chrcode=11 then printesc(
66452)else printesc(66451);
23:if chrcode=1 then printesc(66455)else printesc(66454);
24:if chrcode=1 then printesc(66457){1619:}
else if chrcode=2 then printesc(66795)else if chrcode=3 then printesc(
66796){:1619}else printesc(66456);{:1145}{1152:}
47:if chrcode=1 then printesc(45)else printesc(65635);
69:if chrcode=0 then printesc(66462)else printesc(66463);{:1152}{1180:}
48:if chrcode=1 then printesc(66491)else printesc(66490);{:1180}{1194:}
50:case chrcode of 16:printesc(66224);17:printesc(66225);
18:printesc(66226);19:printesc(66227);20:printesc(66228);
21:printesc(66229);22:printesc(66230);23:printesc(66231);
26:printesc(66233);others:printesc(66232)end;
51:if chrcode=1 then printesc(66237)else if chrcode=2 then printesc(
66238)else printesc(66492);{:1194}{1207:}53:printstyle(chrcode);{:1207}
{1216:}52:case chrcode of 1:printesc(66511);2:printesc(66512);
3:printesc(66513);4:printesc(66514);5:printesc(66515);
others:printesc(66510)end;{:1216}{1226:}
49:if chrcode=30 then printesc(66234){1503:}
else if chrcode=1 then printesc(66236){:1503}else printesc(66235);
{:1226}{1246:}
99:if chrcode=1 then printesc(66535)else if chrcode=2 then printesc(
66536){1528:}else if chrcode=8 then printesc(66549){:1528}
else printesc(66537);
103:if chrcode=0 then printesc(66538)else if chrcode=1 then printesc(
66539)else if chrcode=2 then printesc(66540)else printesc(66541);{:1246}
{1257:}100:if chrcode<>0 then printesc(66559)else printesc(66558);
{:1257}{1260:}101:case chrcode of 0:printesc(66560);1:printesc(66561);
2:printesc(66562);3:printesc(66563);4:printesc(66564);5:printesc(66565);
6:printesc(66566);others:printesc(66567)end;70:begin printesc(65803);
printhex(chrcode);end;71:begin printesc(65820);printhex(chrcode);end;
72:begin printesc(65822);printhex(chrcode);end;{:1260}{1268:}
88:if chrcode=721728 then printesc(65701)else if chrcode=983872 then
printesc(65705)else if chrcode=984128 then printesc(66570)else if
chrcode=787264 then printesc(65702)else if chrcode=852800 then printesc(
65703)else if chrcode=918336 then printesc(65704)else if chrcode=1115020
then printesc(65763)else printesc(66571);89:printsize(chrcode-720960);
{:1268}{1288:}105:if chrcode=1 then printesc(66312)else printesc(66300);
{:1288}{1292:}81:if chrcode=0 then printesc(66591)else printesc(66592);
{:1292}{1298:}90:begin print(66604);
slowprint(fonttables[chrcode,10].int);
if fonttables[chrcode,6].int<>fonttables[chrcode,7].int then begin print
(66070);printscaled(fonttables[chrcode,6].int);print(65683);end;end;
{:1298}{1300:}106:case chrcode of 0:printesc(65558);1:printesc(65559);
2:printesc(65560);others:printesc(66605)end;{:1300}{1310:}
60:if chrcode=0 then printesc(66607)else printesc(66606);{:1310}{1315:}
58:if chrcode=0 then printesc(66608)else printesc(66609);{:1315}{1324:}
57:if chrcode=787264 then printesc(66615)else printesc(66616);{:1324}
{1329:}19:case chrcode of 1:printesc(66618);2:printesc(66619);
3:printesc(66620);{1481:}4:printesc(66749);{:1481}{1490:}
5:printesc(66751);{:1490}{1495:}6:printesc(66754);{:1495}
others:printesc(66617)end;{:1329}{1332:}118:print(66627);
128,129,130,131:begin n:=cmd-128;
if mem[mem[chrcode].hh.rh].hh.lh=917505 then n:=n+4;
if odd(n div 4)then printesc(66549);if odd(n)then printesc(66535);
if odd(n div 2)then printesc(66536);if n>0 then printchar(32);
print(66628);end;132:printesc(66629);{:1332}{1388:}
59:case chrcode of 0:printesc(66664);1:printesc(65903);
2:printesc(66665);3:printesc(66666);5:printesc(66667);6:printesc(66668);
others:print(66676)end;{:1388}{1640:}
116:case chrcode of 0:printesc(66801);1:printesc(66802);
2:printesc(66803);3:printesc(66804);4:printesc(66805);5:printesc(66806);
6:printesc(66807);7:printesc(66808);end;
117:case chrcode of 0:printesc(66809);1:printesc(66810);
2:printesc(66811);3:printesc(66812);4:printesc(66813);5:printesc(66814);
6:printesc(66815);7:printesc(66816);end;{:1640}{1661:}
107:begin print(66840);slowprint(ocptables[chrcode,1]);end;
108:if curchr=0 then printesc(66829)else printesc(66830);
109:print(66841);110:printesc(66831);112:printesc(66832);
113:printesc(66833);111:printesc(66834);
114:if chrcode=1 then printesc(66835)else if chrcode=2 then printesc(
66836)else if chrcode=3 then printesc(66837)else printesc(66838);
115:printesc(66839);{:1661}others:print(65872)end;end;{:303}
ifdef('STAT')procedure showeqtb(n:halfword);
begin if n<1 then printchar(63)else if n<393230 then{225:}
begin sprintcs(n);printchar(61);printcmdchr(neweqtype(n),newequiv(n));
if neweqtype(n)>=128 then begin printchar(58);
showtokenlist(mem[newequiv(n)].hh.rh,0,32);end;end{:225}
else if n<524320 then{231:}
if n<393248 then begin printskipparam(n-393230);printchar(61);
if n<393245 then printspec(newequiv(n),65683)else printspec(newequiv(n),
65623);end else if n<458784 then begin printesc(65681);
printint(n-393248);printchar(61);printspec(newequiv(n),65683);
end else begin printesc(65682);printint(n-458784);printchar(61);
printspec(newequiv(n),65623);end{:231}else if n<1049408 then{235:}
if n<524325 then begin printcmdchr(87,n);printchar(61);
if newequiv(n)=0 then printchar(48)else if n>524320 then begin printint(
mem[newequiv(n)+1].int);printchar(32);printint(mem[newequiv(n)+2].int);
if mem[newequiv(n)+1].int>1 then printesc(65694);
end else printint(mem[newequiv(524320)].hh.lh);
end else if n<589885 then begin printcmdchr(75,n);printchar(61);
if newequiv(n)<>0 then showtokenlist(mem[newequiv(n)].hh.rh,0,32);
end else if n<655423 then begin printesc(65693);printint(n-589885);
printchar(61);
if newequiv(n)<>0 then showtokenlist(mem[newequiv(n)].hh.rh,0,32);
end else if n<720959 then begin printesc(65695);printint(n-655423);
printchar(61);
if newequiv(n)=0 then print(65696)else begin depththreshold:=0;
breadthmax:=1;shownodelist(newequiv(n));end;
end else if n<721728 then{236:}
begin if n=720959 then print(65697)else if n<721216 then begin printesc(
65698);printint(n-720960);
end else if n<721472 then begin printesc(65699);printint(n-721216);
end else begin printesc(65700);printint(n-721472);end;printchar(61);
printesc(newhashtext(1442736+newequiv(n)));end{:236}else{237:}
if n<983872 then begin if n<787264 then begin printesc(65701);
printint(n-721728);end else if n<852800 then begin printesc(65702);
printint(n-787264);end else if n<918336 then begin printesc(65703);
printint(n-852800);end else begin printesc(65704);printint(n-918336);
end;printchar(61);printint(newequiv(n));end else begin printesc(65705);
printint(n-983872);printchar(61);printint(newequiv(n));end{:237}{:235}
else if n<1180556 then{246:}
begin if n<1049484 then printparam(n-1049408)else if n<1115020 then
begin printesc(65762);printint(n-1049484);
end else begin printesc(65763);printint(n-1115020);end;printchar(61);
printint(neweqtbint(n));end{:246}else if n<=1246116 then{256:}
begin if n<1180581 then printlengthparam(n-1180556)else begin printesc(
65790);printint(n-1180581);end;printchar(61);printscaled(neweqtbsc(n));
print(65683);end{:256}else printchar(63);end;endif('STAT'){:257}{264:}
function idlookup(j,l:integer):halfword;label 40;var h:integer;
d:integer;p:halfword;k:halfword;newstring:integer;begin{266:}
h:=buffer[j];for k:=j+1 to j+l-1 do begin h:=h+h+buffer[k];
while h>=55711 do h:=h-55711;end{:266};p:=h+131074;
while true do begin if newhashtext(1246116+p)>0 then if length(
newhashtext(1246116+p))=l then if streqbuf(newhashtext(1246116+p),j)then
goto 40;
if newhashnext(1246116+p)=0 then begin if nonewcontrolsequence then p:=
393229 else{265:}
begin if newhashtext(1246116+p)>0 then begin repeat if(hashused=131074)
then overflow(65793,65536);decr(hashused);
until newhashtext(1246116+hashused)=0;sethashnext(1246116+p,hashused);
p:=hashused;end;
begin if poolptr+l>poolsize then overflow(65543,poolsize-initpoolptr);
end;d:=(poolptr-strstartar[strptr-65536]);
while poolptr>strstartar[strptr-65536]do begin decr(poolptr);
strpool[poolptr+l]:=strpool[poolptr];end;
for k:=j to j+l-1 do begin strpool[poolptr]:=buffer[k];incr(poolptr);
end;newstring:=makestring;sethashtext(1246116+p,newstring);
poolptr:=poolptr+d;ifdef('STAT')incr(cscount);endif('STAT')end{:265};
goto 40;end;p:=newhashnext(1246116+p);end;40:idlookup:=p;end;{:264}
{269:}ifdef('INITEX')procedure primitive(s:strnumber;c:quarterword;
o:halfword);var k:poolpointer;j:0..bufsize;l:smallnumber;
begin if s<=65535 then curval:=s+65537 else begin k:=strstartar[s-65536]
;l:=strstartar[s-65535]-k;
if first+l>bufsize+1 then overflow(65542,bufsize);
for j:=0 to l-1 do buffer[first+j]:=strpool[k+j];
curval:=idlookup(first,l);begin decr(strptr);
poolptr:=strstartar[strptr-65536];end;sethashtext(1246116+curval,s);end;
seteqlevel(curval,1);seteqtype(curval,c);setequiv(curval,o);end;
endif('INITEX'){:269}{273:}{289:}
ifdef('STAT')procedure restoretrace(p:halfword;s:strnumber);
begin begindiagnostic;printchar(123);print(s);printchar(32);showeqtb(p);
printchar(125);enddiagnostic(false);end;endif('STAT'){:289}{1466:}
procedure printgroup(e:boolean);label 10;
begin case curgroup of 0:begin print(66723);goto 10;end;
1,14:begin if curgroup=14 then print(66724);print(66725);end;
2,3:begin if curgroup=3 then print(66726);print(66421);end;
4:print(66326);5:print(66420);6,7:begin if curgroup=7 then print(66727);
print(66728);end;8:print(65684);10:print(66729);11:print(65616);
12:print(65840);9,13,15,16:begin print(65629);
if curgroup=13 then print(66730)else if curgroup=15 then print(66731)
else if curgroup=16 then print(66732);end;end;print(66733);
printint(curlevel);printchar(41);
if savestack[saveptr-1].int<>0 then begin if e then print(65650)else
print(66734);printint(savestack[saveptr-1].int);end;10:end;{:1466}
{1467:}ifdef('STAT')procedure grouptrace(e:boolean);
begin begindiagnostic;printchar(123);
if e then print(66735)else print(66736);printgroup(e);printchar(125);
enddiagnostic(false);end;endif('STAT'){:1467}{1513:}
function pseudoinput:boolean;var p:halfword;sz:integer;w:fourquarters;
r:halfword;begin last:=first;p:=mem[pseudofiles].hh.lh;
if p=0 then pseudoinput:=false else begin mem[pseudofiles].hh.lh:=mem[p]
.hh.rh;sz:=mem[p].hh.lh;if 4*sz-3>=bufsize-last then{35:}
begin curinput.locfield:=first;curinput.limitfield:=last-1;
overflow(65542,bufsize);end{:35};last:=first;
for r:=p+1 to p+sz-1 do begin w:=mem[r].qqqq;buffer[last]:=w.b0;
buffer[last+1]:=w.b1;buffer[last+2]:=w.b2;buffer[last+3]:=w.b3;
last:=last+4;end;if last>=maxbufstack then maxbufstack:=last+1;
while(last>first)and(buffer[last-1]=32)do decr(last);freenode(p,sz);
pseudoinput:=true;end;end;{:1513}{1514:}procedure pseudoclose;
var p,q:halfword;begin p:=mem[pseudofiles].hh.rh;
q:=mem[pseudofiles].hh.lh;begin mem[pseudofiles].hh.rh:=avail;
avail:=pseudofiles;ifdef('STAT')decr(dynused);endif('STAT')end;
pseudofiles:=p;while q<>0 do begin p:=q;q:=mem[p].hh.rh;
freenode(p,mem[p].hh.lh);end;end;{:1514}{1531:}procedure groupwarning;
var i:0..maxinopen;w:boolean;begin baseptr:=inputptr;
inputstack[baseptr]:=curinput;i:=inopen;w:=false;
while(grpstack[i]=curboundary)and(i>0)do begin{1532:}
if neweqtbint(1049473)>0 then begin while(inputstack[baseptr].statefield
=0)or(inputstack[baseptr].indexfield>i)do decr(baseptr);
if inputstack[baseptr].namefield>17 then w:=true;end{:1532};
grpstack[i]:=savestack[saveptr].hh.rh;decr(i);end;
if w then begin printnl(66769);printgroup(true);print(66770);println;
if neweqtbint(1049473)>1 then showcontext;if history=0 then history:=1;
end;end;{:1531}{1533:}procedure ifwarning;var i:0..maxinopen;w:boolean;
begin baseptr:=inputptr;inputstack[baseptr]:=curinput;i:=inopen;
w:=false;while ifstack[i]=condptr do begin{1532:}
if neweqtbint(1049473)>0 then begin while(inputstack[baseptr].statefield
=0)or(inputstack[baseptr].indexfield>i)do decr(baseptr);
if inputstack[baseptr].namefield>17 then w:=true;end{:1532};
ifstack[i]:=mem[condptr].hh.rh;decr(i);end;
if w then begin printnl(66769);printcmdchr(122,curif);
if ifline<>0 then begin print(66755);printint(ifline);end;print(66770);
println;if neweqtbint(1049473)>1 then showcontext;
if history=0 then history:=1;end;end;{:1533}{1534:}
procedure filewarning;var p:halfword;l:quarterword;c:quarterword;
i:integer;begin p:=saveptr;l:=curlevel;c:=curgroup;saveptr:=curboundary;
while grpstack[inopen]<>saveptr do begin decr(curlevel);printnl(66771);
printgroup(true);print(66772);curgroup:=savestack[saveptr].hh.b1;
saveptr:=savestack[saveptr].hh.rh end;saveptr:=p;curlevel:=l;
curgroup:=c;p:=condptr;l:=iflimit;c:=curif;i:=ifline;
while ifstack[inopen]<>condptr do begin printnl(66771);
printcmdchr(122,curif);if iflimit=2 then printesc(66105);
if ifline<>0 then begin print(66755);printint(ifline);end;print(66772);
ifline:=mem[condptr+1].int;curif:=mem[condptr].hh.b1;
iflimit:=mem[condptr].hh.b0;condptr:=mem[condptr].hh.rh;end;condptr:=p;
iflimit:=l;curif:=c;ifline:=i;println;
if neweqtbint(1049473)>1 then showcontext;if history=0 then history:=1;
end;{:1534}{1578:}procedure deletesaref(q:halfword);label 10;
var p:halfword;i:smallnumber;s:smallnumber;begin decr(mem[q+1].hh.lh);
if mem[q+1].hh.lh<>0 then goto 10;
if false then if mem[q+2].int=0 then s:=3 else goto 10 else begin if
false then if mem[q+1].hh.rh=membot then deleteglueref(membot)else goto
10 else if mem[q+1].hh.rh<>0 then goto 10;s:=2;end;
repeat i:=mem[q].hh.b0 mod 16;p:=q;q:=mem[p].hh.rh;freenode(p,s);
if q=0 then begin samark:=0;goto 10;end;
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=0 else mem[q+(i div 2)+1].
hh.lh:=0;decr(mem[q].hh.b1);end;s:=9;until mem[q].hh.b1>0;10:end;{:1578}
{1580:}ifdef('STAT')procedure showsa(p:halfword;s:strnumber);
begin begindiagnostic;printchar(123);print(s);printchar(32);
printchar(125);enddiagnostic(false);end;endif('STAT'){:1580}{1594:}
procedure sasave(p:halfword);var q:halfword;i:quarterword;
begin if curlevel<>salevel then begin if saveptr>maxsavestack then begin
maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(65843,savesize);end;
savestack[saveptr].hh.b0:=4;savestack[saveptr].hh.b1:=salevel;
savestack[saveptr].hh.rh:=sachain;incr(saveptr);sachain:=0;
salevel:=curlevel;end;i:=mem[p].hh.b0;
if false then begin if mem[p+2].int=0 then begin q:=getnode(2);i:=i;
end else begin q:=getnode(3);mem[q+2].int:=mem[p+2].int;end;
mem[q+1].hh.rh:=0;end else begin q:=getnode(2);
mem[q+1].hh.rh:=mem[p+1].hh.rh;end;mem[q+1].hh.lh:=p;mem[q].hh.b0:=i;
mem[q].hh.b1:=mem[p].hh.b1;mem[q].hh.rh:=sachain;sachain:=q;
incr(mem[p+1].hh.lh);end;{:1594}{1595:}procedure sadestroy(p:halfword);
begin if false then deleteglueref(mem[p+1].hh.rh)else if mem[p+1].hh.rh
<>0 then if false then flushnodelist(mem[p+1].hh.rh)else deletetokenref(
mem[p+1].hh.rh);end;{:1595}{1596:}procedure sadef(p:halfword;
e:halfword);begin incr(mem[p+1].hh.lh);
if mem[p+1].hh.rh=e then begin ifdef('STAT')if neweqtbint(1049469)>0
then showsa(p,65845);endif('STAT')sadestroy(p);
end else begin ifdef('STAT')if neweqtbint(1049469)>0 then showsa(p,65846
);endif('STAT')if mem[p].hh.b1=curlevel then sadestroy(p)else sasave(p);
mem[p].hh.b1:=curlevel;mem[p+1].hh.rh:=e;
ifdef('STAT')if neweqtbint(1049469)>0 then showsa(p,65847);
endif('STAT')end;deletesaref(p);end;procedure sawdef(p:halfword;
w:integer);begin incr(mem[p+1].hh.lh);
if mem[p+2].int=w then begin ifdef('STAT')if neweqtbint(1049469)>0 then
showsa(p,65845);
endif('STAT')end else begin ifdef('STAT')if neweqtbint(1049469)>0 then
showsa(p,65846);endif('STAT')if mem[p].hh.b1<>curlevel then sasave(p);
mem[p].hh.b1:=curlevel;mem[p+2].int:=w;
ifdef('STAT')if neweqtbint(1049469)>0 then showsa(p,65847);
endif('STAT')end;deletesaref(p);end;{:1596}{1597:}
procedure gsadef(p:halfword;e:halfword);begin incr(mem[p+1].hh.lh);
ifdef('STAT')if neweqtbint(1049469)>0 then showsa(p,65848);
endif('STAT')sadestroy(p);mem[p].hh.b1:=1;mem[p+1].hh.rh:=e;
ifdef('STAT')if neweqtbint(1049469)>0 then showsa(p,65847);
endif('STAT')deletesaref(p);end;procedure gsawdef(p:halfword;w:integer);
begin incr(mem[p+1].hh.lh);
ifdef('STAT')if neweqtbint(1049469)>0 then showsa(p,65848);
endif('STAT')mem[p].hh.b1:=1;mem[p+2].int:=w;
ifdef('STAT')if neweqtbint(1049469)>0 then showsa(p,65847);
endif('STAT')deletesaref(p);end;{:1597}{1598:}procedure sarestore;
var p:halfword;begin repeat p:=mem[sachain+1].hh.lh;
if mem[p].hh.b1=1 then begin sadestroy(sachain);
ifdef('STAT')if neweqtbint(1049445)>0 then showsa(p,65850);
endif('STAT')end else begin if false then if false then mem[p+2].int:=
mem[sachain+2].int else mem[p+2].int:=0 else begin sadestroy(p);
mem[p+1].hh.rh:=mem[sachain+1].hh.rh;end;
mem[p].hh.b1:=mem[sachain].hh.b1;
ifdef('STAT')if neweqtbint(1049445)>0 then showsa(p,65851);
endif('STAT')end;deletesaref(p);p:=sachain;sachain:=mem[p].hh.rh;
if false then freenode(p,3)else freenode(p,2);until sachain=0;end;
{:1598}{:273}{279:}procedure newsavelevel(c:groupcode);
begin if saveptr>maxsavestack then begin maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(65843,savesize);end;
if(eTeXmode=1)then begin savestack[saveptr+0].int:=line;incr(saveptr);
end;savestack[saveptr].hh.b0:=3;savestack[saveptr].hh.b1:=curgroup;
savestack[saveptr].hh.rh:=curboundary;
if curlevel=65535 then overflow(65844,65535);curboundary:=saveptr;
curgroup:=c;
ifdef('STAT')if neweqtbint(1049470)>0 then grouptrace(false);
endif('STAT')incr(curlevel);incr(saveptr);end;{:279}{280:}
procedure eqdestroy(w:memoryword);var q:halfword;
begin case w.hh.b0 of 128,129,130,131:deletetokenref(w.hh.rh);
134:deleteglueref(w.hh.rh);135:begin q:=w.hh.rh;
if q<>0 then freenode(q,mem[q].hh.lh+mem[q].hh.lh+1);end;
136:flushnodelist(w.hh.rh);{1591:}
74,92:if(w.hh.rh<membot)or(w.hh.rh>membot+23)then deletesaref(w.hh.rh);
{:1591}others:end;end;{:280}{281:}procedure eqsave(p:halfword;
l:quarterword);
begin if saveptr>maxsavestack then begin maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(65843,savesize);end;
if l=0 then savestack[saveptr].hh.b0:=1 else begin savestack[saveptr]:=
neweqtb(p);incr(saveptr);savestack[saveptr].hh.b0:=0;end;
savestack[saveptr].hh.b1:=l;savestack[saveptr].hh.rh:=p;incr(saveptr);
end;{:281}{282:}procedure eqdefine(p:halfword;t:quarterword;e:halfword);
label 10;
begin if(eTeXmode=1)and(neweqtype(p)=t)and(newequiv(p)=e)then begin
ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65845);
endif('STAT')eqdestroy(neweqtb(p));goto 10;end;
ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65846);
endif('STAT')if neweqlevel(p)=curlevel then eqdestroy(neweqtb(p))else if
curlevel>1 then eqsave(p,neweqlevel(p));seteqlevel(p,curlevel);
seteqtype(p,t);setequiv(p,e);
ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65847);
endif('STAT')10:end;{:282}{283:}procedure eqworddefine(p:halfword;
w:integer);label 10;
begin if(eTeXmode=1)and(neweqtbint(p)=w)then begin ifdef('STAT')if
neweqtbint(1049469)>0 then restoretrace(p,65845);endif('STAT')goto 10;
end;ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65846);
endif('STAT')if newxeqlevel(2492232+p)<>curlevel then begin eqsave(p,
newxeqlevel(2492232+p));setneweqtbint(2492232+p,curlevel);end;
setneweqtbint(p,w);
ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65847);
endif('STAT')10:end;procedure deleqworddefine(p:halfword;
w,wone:integer);
begin if newxeqlevel(2492232+p)<>curlevel then begin eqsave(p,
newxeqlevel(2492232+p));setneweqtbint(2492232+p,curlevel);end;
setequiv(p,w);setequiv1(p,wone);end;{:283}{284:}
procedure geqdefine(p:halfword;t:quarterword;e:halfword);
begin ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65848);
endif('STAT')begin eqdestroy(neweqtb(p));seteqlevel(p,1);seteqtype(p,t);
setequiv(p,e);end;
ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65847);
endif('STAT')end;procedure geqworddefine(p:halfword;w:integer);
begin ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65848);
endif('STAT')begin setneweqtbint(p,w);setneweqtbint(2492232+p,1);end;
ifdef('STAT')if neweqtbint(1049469)>0 then restoretrace(p,65847);
endif('STAT')end;procedure delgeqworddefine(p:halfword;w,wone:integer);
begin setequiv(p,w);setequiv1(p,wone);setneweqtbint(2492232+p,1);end;
{:284}{285:}procedure saveforafter(t:halfword);
begin if curlevel>1 then begin if saveptr>maxsavestack then begin
maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(65843,savesize);end;
savestack[saveptr].hh.b0:=2;savestack[saveptr].hh.b1:=0;
savestack[saveptr].hh.rh:=t;incr(saveptr);end;end;{:285}{286:}
procedure backinput;forward;procedure unsave;label 30;var p:halfword;
l:quarterword;t:halfword;a:boolean;begin a:=false;
if curlevel>1 then begin decr(curlevel);{287:}
while true do begin decr(saveptr);
if savestack[saveptr].hh.b0=3 then goto 30;p:=savestack[saveptr].hh.rh;
if savestack[saveptr].hh.b0=2 then{331:}begin t:=curtok;curtok:=p;
if a then begin p:=getavail;mem[p].hh.lh:=curtok;
mem[p].hh.rh:=curinput.locfield;curinput.locfield:=p;
curinput.startfield:=p;
if curtok<196608 then if curtok<131072 then decr(alignstate)else incr(
alignstate);end else begin backinput;a:=(eTeXmode=1);end;curtok:=t;
end{:331}else if savestack[saveptr].hh.b0=4 then begin sarestore;
sachain:=p;salevel:=savestack[saveptr].hh.b1;
end else begin if savestack[saveptr].hh.b0=0 then begin l:=savestack[
saveptr].hh.b1;decr(saveptr);
end else savestack[saveptr]:=neweqtb(393229);{288:}
if p<1049408 then if neweqlevel(p)=1 then begin eqdestroy(savestack[
saveptr]);
ifdef('STAT')if neweqtbint(1049445)>0 then restoretrace(p,65850);
endif('STAT')end else begin eqdestroy(neweqtb(p));
setneweqtb(p,savestack[saveptr]);
ifdef('STAT')if neweqtbint(1049445)>0 then restoretrace(p,65851);
endif('STAT')end else if newxeqlevel(2492232+p)<>1 then begin setneweqtb
(p,savestack[saveptr]);setneweqtbint(2492232+p,l);
ifdef('STAT')if neweqtbint(1049445)>0 then restoretrace(p,65851);
endif('STAT')end else begin ifdef('STAT')if neweqtbint(1049445)>0 then
restoretrace(p,65850);endif('STAT')end{:288};end;end;
30:ifdef('STAT')if neweqtbint(1049470)>0 then grouptrace(true);
endif('STAT')if grpstack[inopen]=curboundary then groupwarning;
curgroup:=savestack[saveptr].hh.b1;
curboundary:=savestack[saveptr].hh.rh;
if(eTeXmode=1)then decr(saveptr){:287};end else confusion(65849);end;
{:286}{293:}procedure preparemag;
begin if(magset>0)and(neweqtbint(1049425)<>magset)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65853);end;printint(neweqtbint(1049425));print(65854);
printnl(65855);begin helpptr:=2;helpline[1]:=65856;helpline[0]:=65857;
end;interror(magset);geqworddefine(1049425,magset);end;
if(neweqtbint(1049425)<=0)or(neweqtbint(1049425)>32768)then begin begin
if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65858);end;begin helpptr:=1;helpline[0]:=65859;end;
interror(neweqtbint(1049425));geqworddefine(1049425,1000);end;
magset:=neweqtbint(1049425);end;{:293}{300:}
procedure tokenshow(p:halfword);
begin if p<>0 then showtokenlist(mem[p].hh.rh,0,10000000);end;{:300}
{301:}procedure printmeaning;begin printcmdchr(curcmd,curchr);
if curcmd>=128 then begin printchar(58);println;tokenshow(curchr);
end else if(curcmd=127)and(curchr<5)then begin printchar(58);println;
tokenshow(curmark[curchr]);end;end;{:301}{304:}procedure showcurcmdchr;
var n:integer;l:integer;p:halfword;begin begindiagnostic;printnl(123);
if curlist.modefield<>shownmode then begin printmode(curlist.modefield);
print(65873);shownmode:=curlist.modefield;end;
printcmdchr(curcmd,curchr);
if neweqtbint(1049471)>0 then if curcmd>=122 then if curcmd<=123 then
begin print(65873);if curcmd=123 then begin printcmdchr(122,curif);
printchar(32);n:=0;l:=ifline;end else begin n:=1;l:=line;end;p:=condptr;
while p<>0 do begin incr(n);p:=mem[p].hh.rh;end;print(65874);
printint(n);printchar(41);if l<>0 then begin print(66755);printint(l);
end;end;printchar(125);enddiagnostic(false);end;{:304}{316:}
procedure showcontext;label 30;var oldsetting:0..21;nn:integer;
bottomline:boolean;{320:}i:0..bufsize;j:0..bufsize;l:0..halferrorline;
m:integer;n:0..errorline;p:integer;q:integer;{:320}
begin baseptr:=inputptr;inputstack[baseptr]:=curinput;nn:=-1;
bottomline:=false;while true do begin curinput:=inputstack[baseptr];
if(curinput.statefield<>0)then if(curinput.namefield>19)or(baseptr=0)
then bottomline:=true;
if(baseptr=inputptr)or bottomline or(nn<neweqtbint(1049462))then{317:}
begin if(baseptr=inputptr)or(curinput.statefield<>0)or(curinput.
indexfield<>3)or(curinput.locfield<>0)then begin tally:=0;
oldsetting:=selector;
if curinput.ocplstackfield>0 then begin printnl(65880);
printscaled(curinput.ocplstackfield);print(65881);
printint(curinput.ocpnofield);print(58);{323:}begin l:=tally;tally:=0;
selector:=20;trickcount:=1000000;end;
if buffer[curinput.limitfield]=neweqtbint(1049456)then j:=curinput.
limitfield else j:=curinput.limitfield+1;
if j>0 then for i:=curinput.startfield to j-1 do begin if i=curinput.
locfield then begin firstcount:=tally;
trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;print(buffer[i]);
end{:323};end else if curinput.statefield<>0 then begin{318:}
if curinput.namefield<=17 then if(curinput.namefield=0)then if baseptr=0
then printnl(65882)else printnl(65883)else begin printnl(65884);
if curinput.namefield=17 then printchar(42)else printint(curinput.
namefield-1);printchar(62);end else begin printnl(65885);
if curinput.indexfield=inopen then printint(line)else printint(linestack
[curinput.indexfield+1]);end;printchar(32){:318};{323:}begin l:=tally;
tally:=0;selector:=20;trickcount:=1000000;end;
if buffer[curinput.limitfield]=neweqtbint(1049456)then j:=curinput.
limitfield else j:=curinput.limitfield+1;
if j>0 then for i:=curinput.startfield to j-1 do begin if i=curinput.
locfield then begin firstcount:=tally;
trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;print(buffer[i]);
end{:323};end else begin{319:}
case curinput.indexfield of 0:printnl(65886);1,2:printnl(65887);
3:if curinput.locfield=0 then printnl(65888)else printnl(65889);
4:printnl(65890);5:begin println;printcs(curinput.namefield);end;
6:printnl(65891);7:printnl(65892);8:printnl(65893);9:printnl(65894);
10:printnl(65895);11:printnl(65896);12:printnl(65897);13:printnl(65898);
14:printnl(65899);15:printnl(65900);16:printnl(65901);
others:printnl(63)end{:319};{324:}begin l:=tally;tally:=0;selector:=20;
trickcount:=1000000;end;
if curinput.indexfield<5 then showtokenlist(curinput.startfield,curinput
.locfield,100000)else showtokenlist(mem[curinput.startfield].hh.rh,
curinput.locfield,100000){:324};end;selector:=oldsetting;{322:}
if trickcount=1000000 then begin firstcount:=tally;
trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;
if tally<trickcount then m:=tally-firstcount else m:=trickcount-
firstcount;if l+firstcount<=halferrorline then begin p:=0;
n:=l+firstcount;end else begin print(65561);
p:=l+firstcount-halferrorline+3;n:=halferrorline;end;
for q:=p to firstcount-1 do printchar(trickbuf[q mod errorline]);
println;for q:=1 to n do printchar(32);
if m+n<=errorline then p:=firstcount+m else p:=firstcount+(errorline-n-3
);for q:=firstcount to p-1 do printchar(trickbuf[q mod errorline]);
if m+n>errorline then print(65561){:322};incr(nn);end;end{:317}
else if nn=neweqtbint(1049462)then begin printnl(65561);incr(nn);end;
if bottomline then goto 30;decr(baseptr);end;
30:curinput:=inputstack[inputptr];end;{:316}{328:}
procedure begintokenlist(p:halfword;t:quarterword);
begin begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(65902,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.statefield:=0;curinput.startfield:=p;curinput.indexfield:=t;
if t>=5 then begin incr(mem[p].hh.lh);
if t=5 then curinput.limitfield:=paramptr else begin curinput.locfield:=
mem[p].hh.rh;if neweqtbint(1049438)>1 then begin begindiagnostic;
printnl(65624);case t of 15:printesc(65637);16:printesc(65903);
others:printcmdchr(75,t+524319)end;print(65861);tokenshow(p);
enddiagnostic(false);end;end;end else curinput.locfield:=p;end;{:328}
{329:}procedure endtokenlist;
begin if curinput.indexfield>=3 then begin if curinput.indexfield<=4
then flushlist(curinput.startfield)else begin deletetokenref(curinput.
startfield);
if curinput.indexfield=5 then while paramptr>curinput.limitfield do
begin decr(paramptr);flushlist(paramstack[paramptr]);end;end;
end else if curinput.indexfield=1 then if alignstate>500000 then
alignstate:=0 else fatalerror(65904);begin decr(inputptr);
curinput:=inputstack[inputptr];end;
begin if interrupt<>0 then pauseforinstructions;end;end;{:329}{330:}
procedure backinput;var p:halfword;
begin while(curinput.statefield=0)and(curinput.locfield=0)and(curinput.
indexfield<>2)do endtokenlist;p:=getavail;mem[p].hh.lh:=curtok;
if curtok<196608 then if curtok<131072 then decr(alignstate)else incr(
alignstate);
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(65902,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.statefield:=0;curinput.startfield:=p;curinput.indexfield:=3;
curinput.locfield:=p;end;{:330}{332:}procedure backerror;
begin OKtointerrupt:=false;backinput;OKtointerrupt:=true;error;end;
procedure inserror;begin OKtointerrupt:=false;backinput;
curinput.indexfield:=4;OKtointerrupt:=true;error;end;{:332}{333:}
procedure beginfilereading;
begin if inopen=maxinopen then overflow(65905,maxinopen);
if first=bufsize then overflow(65542,bufsize);incr(inopen);
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(65902,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.indexfield:=inopen;sourcefilenamestack[curinput.indexfield]:=0;
fullsourcefilenamestack[curinput.indexfield]:=0;
eofseen[curinput.indexfield]:=false;
grpstack[curinput.indexfield]:=curboundary;
ifstack[curinput.indexfield]:=condptr;
linestack[curinput.indexfield]:=line;curinput.startfield:=first;
curinput.statefield:=1;curinput.namefield:=0;end;{:333}{334:}
procedure endfilereading;begin first:=curinput.startfield;
line:=linestack[curinput.indexfield];
if(curinput.namefield=18)or(curinput.namefield=19)then pseudoclose else
if curinput.namefield>17 then aclose(inputfile[curinput.indexfield]);
begin decr(inputptr);curinput:=inputstack[inputptr];end;decr(inopen);
end;{:334}{335:}procedure clearforerrorprompt;
begin while(curinput.statefield<>0)and(curinput.namefield=0)and(inputptr
>0)and(curinput.locfield>curinput.limitfield)do endfilereading;println;;
end;{:335}{341:}procedure checkoutervalidity;var p:halfword;q:halfword;
begin if scannerstatus<>0 then begin deletionsallowed:=false;{342:}
if curcs<>0 then begin if(curinput.statefield=0)or(curinput.namefield<1)
or(curinput.namefield>17)then begin p:=getavail;
mem[p].hh.lh:=1048575+curcs;begintokenlist(p,3);end;curcmd:=10;
curchr:=32;end{:342};if scannerstatus>1 then{343:}begin runaway;
if curcs=0 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65913);end else begin curcs:=0;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65914);end;end;print(65915);{344:}p:=getavail;
case scannerstatus of 2:begin print(65876);mem[p].hh.lh:=131197;end;
3:begin print(65921);mem[p].hh.lh:=partoken;longstate:=130;end;
4:begin print(65878);mem[p].hh.lh:=131197;q:=p;p:=getavail;
mem[p].hh.rh:=q;mem[p].hh.lh:=1245186;alignstate:=-1000000;end;
5:begin print(65879);mem[p].hh.lh:=131197;end;end;
begintokenlist(p,4){:344};print(65916);sprintcs(warningindex);
begin helpptr:=4;helpline[3]:=65917;helpline[2]:=65918;
helpline[1]:=65919;helpline[0]:=65920;end;error;end{:343}
else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65907);end;printcmdchr(122,curif);print(65908);printint(skipline);
begin helpptr:=3;helpline[2]:=65909;helpline[1]:=65910;
helpline[0]:=65911;end;
if curcs<>0 then curcs:=0 else helpline[2]:=65912;curtok:=1245189;
inserror;end;deletionsallowed:=true;end;end;{:341}{345:}
procedure firmuptheline;forward;{:345}{346:}procedure getnext;
label 20,25,21,26,40,10;var k:0..bufsize;t:halfword;cat:0..15;
c,cc,ccc,cccc:ASCIIcode;d:2..7;begin 20:curcs:=0;
if curinput.statefield<>0 then{348:}
begin 25:if curinput.locfield<=curinput.limitfield then begin curchr:=
buffer[curinput.locfield];incr(curinput.locfield);
21:curcmd:=newequiv(721728+curchr);{349:}
case curinput.statefield+curcmd of{350:}10,26,42,27,43{:350}:goto 25;
1,17,33:{359:}
begin if curinput.locfield>curinput.limitfield then curcs:=131073 else
begin 26:k:=curinput.locfield;curchr:=buffer[k];
cat:=newequiv(721728+curchr);incr(k);
if cat=11 then curinput.statefield:=17 else if cat=10 then curinput.
statefield:=17 else curinput.statefield:=1;
if(cat=11)and(k<=curinput.limitfield)then{361:}
begin repeat curchr:=buffer[k];cat:=newequiv(721728+curchr);incr(k);
until(cat<>11)or(k>curinput.limitfield);{360:}
begin if buffer[k]=curchr then if cat=7 then if k<curinput.limitfield
then begin if(curchr=buffer[k+1])and(curchr=buffer[k+2])and((k+6)<=
curinput.limitfield)then begin c:=buffer[k+3];cc:=buffer[k+4];
ccc:=buffer[k+5];cccc:=buffer[k+6];
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))and(((cc>=48)and(cc<=57))or
((cc>=97)and(cc<=102)))and(((ccc>=48)and(ccc<=57))or((ccc>=97)and(ccc<=
102)))and(((cccc>=48)and(cccc<=57))or((cccc>=97)and(cccc<=102)))then
begin d:=7;if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
if ccc<=57 then curchr:=16*curchr+ccc-48 else curchr:=16*curchr+ccc-87;
if cccc<=57 then curchr:=16*curchr+cccc-48 else curchr:=16*curchr+cccc
-87;buffer[k-1]:=curchr;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end end else begin c:=buffer[k+1];if c<128 then begin d:=2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if k+2<=curinput.
limitfield then begin cc:=buffer[k+2];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then incr(d);end;
if d>2 then begin if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
buffer[k-1]:=curchr;
end else if c<64 then buffer[k-1]:=c+64 else buffer[k-1]:=c-64;
curinput.limitfield:=curinput.limitfield-d;first:=first-d;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end end end end{:360};if cat<>11 then decr(k);
if k>curinput.locfield+1 then begin curcs:=idlookup(curinput.locfield,k-
curinput.locfield);curinput.locfield:=k;goto 40;end;end{:361}else{360:}
begin if buffer[k]=curchr then if cat=7 then if k<curinput.limitfield
then begin if(curchr=buffer[k+1])and(curchr=buffer[k+2])and((k+6)<=
curinput.limitfield)then begin c:=buffer[k+3];cc:=buffer[k+4];
ccc:=buffer[k+5];cccc:=buffer[k+6];
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))and(((cc>=48)and(cc<=57))or
((cc>=97)and(cc<=102)))and(((ccc>=48)and(ccc<=57))or((ccc>=97)and(ccc<=
102)))and(((cccc>=48)and(cccc<=57))or((cccc>=97)and(cccc<=102)))then
begin d:=7;if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
if ccc<=57 then curchr:=16*curchr+ccc-48 else curchr:=16*curchr+ccc-87;
if cccc<=57 then curchr:=16*curchr+cccc-48 else curchr:=16*curchr+cccc
-87;buffer[k-1]:=curchr;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end end else begin c:=buffer[k+1];if c<128 then begin d:=2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if k+2<=curinput.
limitfield then begin cc:=buffer[k+2];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then incr(d);end;
if d>2 then begin if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
buffer[k-1]:=curchr;
end else if c<64 then buffer[k-1]:=c+64 else buffer[k-1]:=c-64;
curinput.limitfield:=curinput.limitfield-d;first:=first-d;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end end end end{:360};
curcs:=65537+buffer[curinput.locfield];incr(curinput.locfield);end;
40:curcmd:=neweqtype(curcs);curchr:=newequiv(curcs);
if curcmd>=130 then checkoutervalidity;end{:359};14,30,46:{358:}
begin curcs:=curchr+1;curcmd:=neweqtype(curcs);curchr:=newequiv(curcs);
curinput.statefield:=1;if curcmd>=130 then checkoutervalidity;end{:358};
8,24,40:{357:}
begin if curchr=buffer[curinput.locfield]then if curinput.locfield<
curinput.limitfield then begin if(curchr=buffer[curinput.locfield+1])and
(curchr=buffer[curinput.locfield+2])and((curinput.locfield+6)<=curinput.
limitfield)then begin c:=buffer[curinput.locfield+3];
cc:=buffer[curinput.locfield+4];ccc:=buffer[curinput.locfield+5];
cccc:=buffer[curinput.locfield+6];
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))and(((cc>=48)and(cc<=57))or
((cc>=97)and(cc<=102)))and(((ccc>=48)and(ccc<=57))or((ccc>=97)and(ccc<=
102)))and(((cccc>=48)and(cccc<=57))or((cccc>=97)and(cccc<=102)))then
begin curinput.locfield:=curinput.locfield+7;
if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
if ccc<=57 then curchr:=16*curchr+ccc-48 else curchr:=16*curchr+ccc-87;
if cccc<=57 then curchr:=16*curchr+cccc-48 else curchr:=16*curchr+cccc
-87;goto 21;end;end;c:=buffer[curinput.locfield+1];
if c<128 then begin curinput.locfield:=curinput.locfield+2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if curinput.locfield<=
curinput.limitfield then begin cc:=buffer[curinput.locfield];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then begin incr(
curinput.locfield);if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
goto 21;end;end;if c<64 then curchr:=c+64 else curchr:=c-64;goto 21;end;
end;curinput.statefield:=1;end{:357};16,32,48:{351:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65922);end;begin helpptr:=2;helpline[1]:=65923;helpline[0]:=65924;
end;deletionsallowed:=false;error;deletionsallowed:=true;goto 20;
end{:351};{352:}11:{354:}begin curinput.statefield:=17;curchr:=32;
end{:354};6:{353:}begin curinput.locfield:=curinput.limitfield+1;
curcmd:=10;curchr:=32;end{:353};22,15,31,47:{355:}
begin curinput.locfield:=curinput.limitfield+1;goto 25;end{:355};
38:{356:}begin curinput.locfield:=curinput.limitfield+1;curcs:=parloc;
curcmd:=neweqtype(curcs);curchr:=newequiv(curcs);
if curcmd>=130 then checkoutervalidity;end{:356};2:incr(alignstate);
18,34:begin curinput.statefield:=1;incr(alignstate);end;
3:decr(alignstate);19,35:begin curinput.statefield:=1;decr(alignstate);
end;20,21,23,25,28,29,36,37,39,41,44,45:curinput.statefield:=1;{:352}
others:end{:349};
end else begin if curinput.ocplstackfield>0 then begin begin decr(
inputptr);curinput:=inputstack[inputptr];end;goto 20;end;
curinput.statefield:=33;{365:}if curinput.namefield>17 then{367:}
begin incr(line);first:=curinput.startfield;
if not forceeof then if curinput.namefield<=19 then begin if pseudoinput
then firmuptheline else if(newequiv(524333)<>0)and not eofseen[curinput.
indexfield]then begin curinput.limitfield:=first-1;
eofseen[curinput.indexfield]:=true;begintokenlist(newequiv(524333),14);
goto 20;end else forceeof:=true;
end else begin if newinputln(inputfile[curinput.indexfield],
inputfilemode[curinput.indexfield],inputfiletranslation[curinput.
indexfield],true)then firmuptheline else if(newequiv(524333)<>0)and not
eofseen[curinput.indexfield]then begin curinput.limitfield:=first-1;
eofseen[curinput.indexfield]:=true;begintokenlist(newequiv(524333),14);
goto 20;end else forceeof:=true;end;
if forceeof then begin if neweqtbint(1049473)>0 then if(grpstack[inopen]
<>curboundary)or(ifstack[inopen]<>condptr)then filewarning;
if curinput.namefield>=19 then begin printchar(41);decr(openparens);
fflush(stdout);end;forceeof:=false;endfilereading;checkoutervalidity;
goto 20;end;
if(neweqtbint(1049456)<0)or(neweqtbint(1049456)>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=neweqtbint(1049456);
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end{:367}else begin if not(curinput.namefield=0)then begin curcmd:=0;
curchr:=0;goto 10;end;if inputptr>0 then begin endfilereading;goto 20;
end;if selector<18 then openlogfile;
if interaction>1 then begin if(neweqtbint(1049456)<0)or(neweqtbint(
1049456)>255)then incr(curinput.limitfield);
if curinput.limitfield=curinput.startfield then printnl(65925);println;
first:=curinput.startfield;begin;print(42);terminput;end;
curinput.limitfield:=last;
if(neweqtbint(1049456)<0)or(neweqtbint(1049456)>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=neweqtbint(1049456);
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end else fatalerror(65926);end{:365};
begin if interrupt<>0 then pauseforinstructions;end;goto 25;end;
end{:348}else{362:}
if curinput.locfield<>0 then begin t:=mem[curinput.locfield].hh.lh;
curinput.locfield:=mem[curinput.locfield].hh.rh;
if t>=1048575 then begin curcs:=t-1048575;curcmd:=neweqtype(curcs);
curchr:=newequiv(curcs);if curcmd>=130 then if curcmd=133 then{363:}
begin curcs:=mem[curinput.locfield].hh.lh-1048575;curinput.locfield:=0;
curcmd:=neweqtype(curcs);curchr:=newequiv(curcs);
if curcmd>117 then begin curcmd:=0;curchr:=65537;end;end{:363}
else checkoutervalidity;end else begin curcmd:=t div 65536;
curchr:=t mod 65536;case curcmd of 1:incr(alignstate);
2:decr(alignstate);5:{364:}
begin begintokenlist(paramstack[curinput.limitfield+curchr-1],0);
goto 20;end{:364};others:end;end;end else begin endtokenlist;goto 20;
end{:362};{347:}
if curcmd<=5 then if curcmd>=4 then if alignstate=0 then{823:}
begin if(scannerstatus=4)or(curalign=0)then fatalerror(65904);
curcmd:=mem[curalign+5].hh.lh;mem[curalign+5].hh.lh:=curchr;
if curcmd=63 then begintokenlist(memtop-10,2)else begintokenlist(mem[
curalign+2].int,2);alignstate:=1000000;goto 20;end{:823}{:347};10:end;
{:346}{368:}procedure firmuptheline;var k:0..bufsize;
begin curinput.limitfield:=last;
if neweqtbint(1049436)>0 then if interaction>1 then begin;println;
if curinput.startfield<curinput.limitfield then for k:=curinput.
startfield to curinput.limitfield-1 do print(buffer[k]);
first:=curinput.limitfield;begin;print(65927);terminput;end;
if last>first then begin for k:=first to last-1 do buffer[k+curinput.
startfield-first]:=buffer[k];
curinput.limitfield:=curinput.startfield+last-first;end;end;end;{:368}
{370:}procedure gettoken;begin nonewcontrolsequence:=false;getnext;
nonewcontrolsequence:=true;
if curcs=0 then curtok:=(curcmd*65536)+curchr else curtok:=1048575+curcs
;end;{:370}{371:}{394:}procedure macrocall;label 10,22,30,31,40;
var r:halfword;p:halfword;q:halfword;s:halfword;t:halfword;u,v:halfword;
rbraceptr:halfword;n:smallnumber;unbalance:halfword;m:halfword;
refcount:halfword;savescannerstatus:smallnumber;
savewarningindex:halfword;matchchr:ASCIIcode;
begin savescannerstatus:=scannerstatus;savewarningindex:=warningindex;
warningindex:=curcs;refcount:=curchr;r:=mem[refcount].hh.rh;n:=0;
if neweqtbint(1049438)>0 then{406:}begin begindiagnostic;println;
printcs(warningindex);tokenshow(refcount);enddiagnostic(false);end{:406}
;if mem[r].hh.lh=917505 then r:=mem[r].hh.rh;
if mem[r].hh.lh<>917504 then{396:}begin scannerstatus:=3;unbalance:=0;
longstate:=neweqtype(curcs);
if longstate>=130 then longstate:=longstate-2;
repeat mem[memtop-3].hh.rh:=0;
if(mem[r].hh.lh>=917504)or(mem[r].hh.lh<851968)then s:=0 else begin
matchchr:=mem[r].hh.lh-851968;s:=mem[r].hh.rh;r:=s;p:=memtop-3;m:=0;end;
{397:}22:gettoken;if curtok=mem[r].hh.lh then{399:}
begin r:=mem[r].hh.rh;
if(mem[r].hh.lh>=851968)and(mem[r].hh.lh<=917504)then begin if curtok<
131072 then decr(alignstate);goto 40;end else goto 22;end{:399};{402:}
if s<>r then if s=0 then{403:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65960);end;sprintcs(warningindex);print(65961);begin helpptr:=4;
helpline[3]:=65962;helpline[2]:=65963;helpline[1]:=65964;
helpline[0]:=65965;end;error;goto 10;end{:403}else begin t:=s;
repeat begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=mem[t].hh.lh;
p:=q;end;incr(m);u:=mem[t].hh.rh;v:=s;
while true do begin if u=r then if curtok<>mem[v].hh.lh then goto 30
else begin r:=mem[v].hh.rh;goto 22;end;
if mem[u].hh.lh<>mem[v].hh.lh then goto 30;u:=mem[u].hh.rh;
v:=mem[v].hh.rh;end;30:t:=mem[t].hh.rh;until t=r;r:=s;end{:402};
if curtok=partoken then if longstate<>129 then{401:}
begin if longstate=128 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65955);end;sprintcs(warningindex);print(65956);begin helpptr:=3;
helpline[2]:=65957;helpline[1]:=65958;helpline[0]:=65959;end;backerror;
end;pstack[n]:=mem[memtop-3].hh.rh;alignstate:=alignstate-unbalance;
for m:=0 to n do flushlist(pstack[m]);goto 10;end{:401};
if curtok<196608 then if curtok<131072 then{404:}begin unbalance:=1;
while true do begin begin begin q:=avail;
if q=0 then q:=getavail else begin avail:=mem[q].hh.rh;mem[q].hh.rh:=0;
ifdef('STAT')incr(dynused);endif('STAT')end;end;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;gettoken;
if curtok=partoken then if longstate<>129 then{401:}
begin if longstate=128 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65955);end;sprintcs(warningindex);print(65956);begin helpptr:=3;
helpline[2]:=65957;helpline[1]:=65958;helpline[0]:=65959;end;backerror;
end;pstack[n]:=mem[memtop-3].hh.rh;alignstate:=alignstate-unbalance;
for m:=0 to n do flushlist(pstack[m]);goto 10;end{:401};
if curtok<196608 then if curtok<131072 then incr(unbalance)else begin
decr(unbalance);if unbalance=0 then goto 31;end;end;31:rbraceptr:=p;
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;
end{:404}else{400:}begin backinput;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65947);end;sprintcs(warningindex);print(65948);begin helpptr:=6;
helpline[5]:=65949;helpline[4]:=65950;helpline[3]:=65951;
helpline[2]:=65952;helpline[1]:=65953;helpline[0]:=65954;end;
incr(alignstate);longstate:=128;curtok:=partoken;inserror;goto 22;
end{:400}else{398:}
begin if curtok=655392 then if mem[r].hh.lh<=917504 then if mem[r].hh.lh
>=851968 then goto 22;begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end{:398};incr(m);
if mem[r].hh.lh>917504 then goto 22;if mem[r].hh.lh<851968 then goto 22;
40:if s<>0 then{405:}
begin if(m=1)and(mem[p].hh.lh<196608)then begin mem[rbraceptr].hh.rh:=0;
begin mem[p].hh.rh:=avail;avail:=p;ifdef('STAT')decr(dynused);
endif('STAT')end;p:=mem[memtop-3].hh.rh;pstack[n]:=mem[p].hh.rh;
begin mem[p].hh.rh:=avail;avail:=p;ifdef('STAT')decr(dynused);
endif('STAT')end;end else pstack[n]:=mem[memtop-3].hh.rh;incr(n);
if neweqtbint(1049438)>0 then begin begindiagnostic;printnl(matchchr);
printint(n);print(65966);showtokenlist(pstack[n-1],0,1000);
enddiagnostic(false);end;end{:405}{:397};until mem[r].hh.lh=917504;
end{:396};{395:}
while(curinput.statefield=0)and(curinput.locfield=0)and(curinput.
indexfield<>2)do endtokenlist;begintokenlist(refcount,5);
curinput.namefield:=warningindex;curinput.locfield:=mem[r].hh.rh;
if n>0 then begin if paramptr+n>maxparamstack then begin maxparamstack:=
paramptr+n;if maxparamstack>paramsize then overflow(65946,paramsize);
end;for m:=0 to n-1 do paramstack[paramptr+m]:=pstack[m];
paramptr:=paramptr+n;end{:395};10:scannerstatus:=savescannerstatus;
warningindex:=savewarningindex;end;{:394}{384:}procedure insertrelax;
begin curtok:=1048575+curcs;backinput;curtok:=1245192;backinput;
curinput.indexfield:=4;end;{:384}{1509:}procedure pseudostart;forward;
{:1509}{1567:}procedure scanregisternum;forward;{:1567}{1572:}
procedure newindex(i:quarterword;q:halfword);var k:smallnumber;
begin curptr:=getnode(9);mem[curptr].hh.b0:=i;mem[curptr].hh.b1:=0;
mem[curptr].hh.rh:=q;for k:=1 to 8 do mem[curptr+k]:=sanull;end;{:1572}
{1575:}procedure findsaelement(t:smallnumber;n:halfword;w:boolean);
label 45,46,47,48,49,10;var q:halfword;i:smallnumber;
begin begin if t<>8 then begin curptr:=0;goto 10;end;end;curptr:=samark;
begin if curptr=0 then if w then goto 45 else goto 10;end;q:=curptr;
i:=n div 4096;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;begin if curptr=0 then if w then goto 46 else goto 10;end;
q:=curptr;i:=(n div 256)mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;begin if curptr=0 then if w then goto 47 else goto 10;end;
q:=curptr;i:=(n div 16)mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;begin if curptr=0 then if w then goto 48 else goto 10;end;
q:=curptr;i:=n mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;if(curptr=0)and w then goto 49;goto 10;45:newindex(t,0);
samark:=curptr;q:=curptr;i:=n div 4096;46:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;
i:=(n div 256)mod 16;47:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;i:=(n div 16)mod 16;
48:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;i:=n mod 16;
49:{1577:}if t=8 then begin curptr:=getnode(4);mem[curptr+1]:=sanull;
mem[curptr+2]:=sanull;mem[curptr+3]:=sanull;end;
mem[curptr].hh.b0:=256*t+i;mem[curptr].hh.b1:=1{:1577};
mem[curptr].hh.rh:=q;
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;10:end;{:1575}
procedure passtext;forward;procedure startinput;forward;
procedure conditional;forward;procedure getxtoken;forward;
procedure convtoks;forward;procedure insthetoks;forward;
procedure expand;label 21;var t:halfword;p,q,r:halfword;j:0..bufsize;
cvbackup:integer;cvlbackup,radixbackup,cobackup:smallnumber;
backupbackup:halfword;savescannerstatus:smallnumber;
begin incr(expanddepthcount);
if expanddepthcount>=expanddepth then overflow(65928,expanddepth);
cvbackup:=curval;cvlbackup:=curvallevel;radixbackup:=radix;
cobackup:=curorder;backupbackup:=mem[memtop-13].hh.rh;
21:if curcmd<128 then{372:}
begin if neweqtbint(1049444)>1 then showcurcmdchr;
case curcmd of 127:{391:}begin t:=curchr mod 5;
if curchr>=5 then scanregisternum else curval:=0;
if curval=0 then curptr:=curmark[t]else{1581:}
begin findsaelement(8,curval,false);
if curptr<>0 then if odd(t)then curptr:=mem[curptr+(t div 2)+1].hh.rh
else curptr:=mem[curptr+(t div 2)+1].hh.lh;end{:1581};
if curptr<>0 then begintokenlist(curptr,15);end{:391};
119:if curchr=0 then{373:}begin gettoken;t:=curtok;gettoken;
if curcmd>117 then expand else backinput;curtok:=t;backinput;end{:373}
else{1522:}begin gettoken;
if(curcmd=122)and(curchr<>16)then begin curchr:=curchr+32;goto 21;end;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66003);end;printesc(66103);print(66768);
printcmdchr(curcmd,curchr);printchar(39);begin helpptr:=1;
helpline[0]:=65924;end;backerror;end{:1522};120:{374:}
begin savescannerstatus:=scannerstatus;scannerstatus:=0;gettoken;
scannerstatus:=savescannerstatus;t:=curtok;backinput;
if(t>=1048575)and(t<>1245193)then begin p:=getavail;
mem[p].hh.lh:=1245194;mem[p].hh.rh:=curinput.locfield;
curinput.startfield:=p;curinput.locfield:=p;end;end{:374};124:{377:}
begin r:=getavail;p:=r;repeat getxtoken;
if curcs=0 then begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;
p:=q;end;until curcs<>0;if curcmd<>67 then{378:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65935);end;printesc(65795);print(65936);begin helpptr:=2;
helpline[1]:=65937;helpline[0]:=65938;end;backerror;end{:378};{379:}
j:=first;p:=mem[r].hh.rh;
while p<>0 do begin if j>=maxbufstack then begin maxbufstack:=j+1;
if maxbufstack=bufsize then overflow(65542,bufsize);end;
buffer[j]:=mem[p].hh.lh mod 65536;incr(j);p:=mem[p].hh.rh;end;
if j>first+1 then begin nonewcontrolsequence:=false;
curcs:=idlookup(first,j-first);nonewcontrolsequence:=true;
end else if j=first then curcs:=131073 else curcs:=65537+buffer[first]{:
379};flushlist(r);
if neweqtype(curcs)=118 then begin eqdefine(curcs,0,65536);end;
curtok:=curcs+1048575;backinput;end{:377};125:convtoks;126:insthetoks;
122:conditional;123:{517:}
begin if neweqtbint(1049471)>0 then if neweqtbint(1049444)<=1 then
showcurcmdchr;
if curchr>iflimit then if iflimit=1 then insertrelax else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66106);end;printcmdchr(123,curchr);begin helpptr:=1;
helpline[0]:=66107;end;error;end else begin while curchr<>2 do passtext;
{503:}begin if ifstack[inopen]=condptr then ifwarning;p:=condptr;
ifline:=mem[p+1].int;curif:=mem[p].hh.b1;iflimit:=mem[p].hh.b0;
condptr:=mem[p].hh.rh;freenode(p,2);end{:503};end;end{:517};121:{383:}
if curchr=1 then forceeof:=true{1506:}
else if curchr=2 then pseudostart{:1506}
else if nameinprogress then insertrelax else startinput{:383};
others:{375:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65929);end;begin helpptr:=5;helpline[4]:=65930;helpline[3]:=65931;
helpline[2]:=65932;helpline[1]:=65933;helpline[0]:=65934;end;error;
end{:375}end;end{:372}else if curcmd<132 then macrocall else{380:}
begin curtok:=1245191;backinput;end{:380};curval:=cvbackup;
curvallevel:=cvlbackup;radix:=radixbackup;curorder:=cobackup;
mem[memtop-13].hh.rh:=backupbackup;decr(expanddepthcount);end;{:371}
{385:}procedure getxtoken;label 20,30;begin 20:getnext;
if curcmd<=117 then goto 30;
if curcmd>=128 then if curcmd<132 then macrocall else begin curcs:=
196616;curcmd:=9;goto 30;end else expand;goto 20;
30:if curcs=0 then curtok:=(curcmd*65536)+curchr else curtok:=1048575+
curcs;end;{:385}{386:}procedure xtoken;
begin while curcmd>117 do begin expand;getnext;end;
if curcs=0 then curtok:=(curcmd*65536)+curchr else curtok:=1048575+curcs
;end;{:386}{408:}procedure scanleftbrace;begin{410:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:410};
if curcmd<>1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65967);end;begin helpptr:=4;helpline[3]:=65968;helpline[2]:=65969;
helpline[1]:=65970;helpline[0]:=65971;end;backerror;curtok:=65659;
curcmd:=1;curchr:=123;incr(alignstate);end;end;{:408}{409:}
procedure scanrightbrace;begin{410:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:410};
if curcmd<>2 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65967);end;begin helpptr:=4;helpline[3]:=65972;helpline[2]:=65969;
helpline[1]:=65970;helpline[0]:=65971;end;backerror;curtok:=131197;
curcmd:=2;curchr:=125;incr(alignstate);end;end;{:409}{411:}
procedure scanoptionalequals;begin{412:}repeat getxtoken;
until curcmd<>10{:412};if curtok<>786493 then backinput;end;{:411}{413:}
function scankeyword(s:strnumber):boolean;label 10;var p:halfword;
q:halfword;k:poolpointer;begin p:=memtop-13;mem[p].hh.rh:=0;
if s<65536 then begin while true do begin getxtoken;
if(curcs=0)and((curchr=s)or(curchr=s-32))then begin begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;
flushlist(mem[memtop-13].hh.rh);scankeyword:=true;goto 10;
end else if(curcmd<>10)or(p<>memtop-13)then begin backinput;
if p<>memtop-13 then begintokenlist(mem[memtop-13].hh.rh,3);
scankeyword:=false;goto 10;end;end;end;k:=strstartar[s-65536];
while k<strstartar[s-65535]do begin getxtoken;
if(curcs=0)and((curchr=strpool[k])or(curchr=strpool[k]-32))then begin
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;incr(k);
end else if(curcmd<>10)or(p<>memtop-13)then begin backinput;
if p<>memtop-13 then begintokenlist(mem[memtop-13].hh.rh,3);
scankeyword:=false;goto 10;end;end;flushlist(mem[memtop-13].hh.rh);
scankeyword:=true;10:end;{:413}{414:}procedure muerror;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65973);end;begin helpptr:=1;helpline[0]:=65974;end;error;end;
{:414}{415:}procedure scanint;forward;{439:}procedure scandir;
var d1,d2,d3:integer;begin getxtoken;
if curcmd=95 then begin curval:=neweqtbint(curchr);goto 10;
end else backinput;
begin if scankeyword(84)then d1:=0 else if scankeyword(76)then d1:=1
else if scankeyword(66)then d1:=2 else if scankeyword(82)then d1:=3 else
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66005);end;curval:=0;goto 10;end end;
begin if scankeyword(84)then d2:=0 else if scankeyword(76)then d2:=1
else if scankeyword(66)then d2:=2 else if scankeyword(82)then d2:=3 else
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66005);end;curval:=0;goto 10;end end;
if((d1)mod 2)=((d2)mod 2)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66005);end;curval:=0;goto 10;end;
begin if scankeyword(84)then d3:=0 else if scankeyword(76)then d3:=1
else if scankeyword(66)then d3:=2 else if scankeyword(82)then d3:=3 else
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66005);end;curval:=0;goto 10;end end;
curval:=d1*8+dirrearrange[d2]*4+d3;10:end;{:439}{440:}
procedure scaneightbitint;begin scanint;
if(curval<0)or(curval>65535)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66006);end;begin helpptr:=2;helpline[1]:=66007;helpline[0]:=65977;
end;interror(curval);curval:=0;end;end;{:440}{441:}
procedure scancharnum;begin scanint;
if(curval<0)or(curval>65535)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66008);end;begin helpptr:=2;helpline[1]:=66009;helpline[0]:=65977;
end;interror(curval);curval:=0;end;end;{:441}{442:}
procedure scanfourbitint;begin scanint;
if(curval<0)or(curval>15)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66010);end;begin helpptr:=2;helpline[1]:=66011;helpline[0]:=65977;
end;interror(curval);curval:=0;end;end;procedure scanbigfourbitint;
begin scanint;
if(curval<0)or(curval>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66010);end;begin helpptr:=2;helpline[1]:=66012;helpline[0]:=65977;
end;interror(curval);curval:=0;end;end;{:442}{443:}
procedure scanrealfifteenbitint;begin scanint;
if(curval<0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66013);end;begin helpptr:=2;helpline[1]:=66014;helpline[0]:=65977;
end;interror(curval);curval:=0;end;end;procedure scanfifteenbitint;
begin scanint;
if(curval<0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66013);end;begin helpptr:=2;helpline[1]:=66014;helpline[0]:=65977;
end;interror(curval);curval:=0;end;
curval:=((curval div 4096)*16777216)+(((curval mod 4096)div 256)*65536)+
(curval mod 256);end;procedure scanbigfifteenbitint;begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66015);end;begin helpptr:=2;helpline[1]:=66016;helpline[0]:=65977;
end;interror(curval);curval:=0;end;end;{:443}{444:}
procedure scantwentysevenbitint;begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66017);end;begin helpptr:=2;helpline[1]:=65979;helpline[0]:=65977;
end;interror(curval);curval:=0;end;
curval1:=(((curval mod 4096)div 256)*65536)+(curval mod 256);
curval:=curval div 4096;
curval:=((curval div 4096)*16777216)+(((curval mod 4096)div 256)*65536)+
(curval mod 256);end;procedure scanfiftyonebitint;var iiii:integer;
begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66017);end;begin helpptr:=2;helpline[1]:=66018;helpline[0]:=65977;
end;interror(curval);curval:=0;end;iiii:=curval;scanint;
if(curval<0)or(curval>16777215)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66017);end;begin helpptr:=2;helpline[1]:=66019;helpline[0]:=65977;
end;interror(curval);curval:=0;end;curval1:=curval;curval:=iiii;end;
procedure scanstringargument;var s:integer;begin scanleftbrace;
getxtoken;
while(curcmd<>2)do begin if(curcmd=11)or(curcmd=12)then begin begin if
poolptr+1>poolsize then overflow(65543,poolsize-initpoolptr);end;
begin strpool[poolptr]:=curchr;incr(poolptr);end;
end else if(curcmd=10)then begin begin if poolptr+1>poolsize then
overflow(65543,poolsize-initpoolptr);end;begin strpool[poolptr]:=32;
incr(poolptr);end;end else begin print(66020);end;getxtoken;end;
s:=makestring;if streqstr(66021,s)then s:=66021;
if streqstr(66022,s)then s:=66022;if streqstr(66023,s)then s:=66023;
curval:=s;end;{:444}{1568:}procedure scanregisternum;begin scanint;
if(curval<0)or(curval>maxregnum)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66006);end;begin helpptr:=2;helpline[1]:=maxreghelpline;
helpline[0]:=65977;end;interror(curval);curval:=0;end;end;{:1568}{1630:}
procedure scanfourbitintor18;begin scanint;
if(curval<0)or((curval>15)and(curval<>18))then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66010);end;begin helpptr:=2;helpline[1]:=66011;helpline[0]:=65977;
end;interror(curval);curval:=0;end;end;{:1630}{1487:}
procedure scangeneraltext;forward;{:1487}{1529:}
procedure getxorprotected;label 10;begin while true do begin gettoken;
if curcmd<=117 then goto 10;
if(curcmd>=128)and(curcmd<132)then if mem[mem[curchr].hh.rh].hh.lh=
917505 then goto 10;expand;end;10:end;{:1529}{1538:}procedure scanexpr;
forward;{:1538}{1543:}procedure scannormalglue;forward;
procedure scanmuglue;forward;{:1543}{585:}procedure scanfontident;
var f:internalfontnumber;m:halfword;begin{412:}repeat getxtoken;
until curcmd<>10{:412};
if curcmd=91 then f:=newequiv(720959)else if curcmd=90 then f:=curchr
else if curcmd=89 then begin m:=curchr;scanbigfourbitint;
f:=newequiv(m+curval);end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66149);end;begin helpptr:=2;helpline[1]:=66150;helpline[0]:=66151;
end;backerror;f:=0;end;curval:=f;end;{:585}{586:}
procedure findfontdimen(writing:boolean);var f:internalfontnumber;
n:integer;begin scanint;n:=curval;scanfontident;f:=curval;dimenfont:=f;
if n<=0 then curval:=fonttables[f,0].int else begin if writing and(n<=4)
and(n>=2)and(fonttables[f,14].int<>0)then begin deleteglueref(fonttables
[f,14].int);fonttables[f,14].int:=0;end;
if n>fonttables[f,8].int then if f<fontptr then curval:=fonttables[f,0].
int else{588:}
begin if n+fonttables[f,8].int>fonttables[f,0].int then begin printnl(
66156);begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
repeat fonttables[f,fonttables[f,43].int+fonttables[f,8].int].int:=0;
incr(fonttables[f,8].int);until n=fonttables[f,8].int;
curval:=fonttables[f,43].int+fonttables[f,8].int;end{:588}
else curval:=n+fonttables[f,43].int;end;{587:}
if curval=fonttables[f,0].int then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66134);end;printesc(newhashtext(1442736+f));print(66152);
printint(fonttables[f,8].int);print(66153);begin helpptr:=2;
helpline[1]:=66154;helpline[0]:=66155;end;error;end{:587};end;{:586}
{610:}procedure scanocpident;var f:internalocpnumber;begin{412:}
repeat getxtoken;until curcmd<>10{:412};
if curcmd=107 then f:=curchr else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66172);end;begin helpptr:=2;helpline[1]:=66150;helpline[0]:=66173;
end;backerror;f:=0;end;curval:=f;end;{:610}{:415}{419:}
procedure scansomethinginternal(level:smallnumber;negative:boolean);
label 10;var m:halfword;q:halfword;i:fourquarters;p:0..nestsize;
begin m:=curchr;case curcmd of 88:{420:}begin scancharnum;
if m=983872 then begin curval1:=newequiv(983872+curval);
if((curval1 div 16777216)>8)or(((curval1 mod 16777216)div 65536)>15)or((
curval1 mod 65536)>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65975);end;begin helpptr:=2;helpline[1]:=65976;helpline[0]:=65977;
end;interror(curval1);curval1:=0;end;
curval1:=((curval1 div 16777216)*4096)+(((curval1 mod 16777216)div 65536
)*256)+(curval1 mod 65536);begin curval:=curval1;curvallevel:=0;
end end else if m=(984128)then begin curval:=newequiv(983872+curval);
curvallevel:=0;
end else if m=1115020 then begin curval1:=newequiv1(1115020+curval);
curval:=newequiv(1115020+curval);
curval1:=(curval1 div 65536)*256+(curval1 mod 65536);
curval:=(curval div 65536)*256+(curval mod 65536);
if((curval div 256)mod 256>15)or(curval1>=4096)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65978);end;begin helpptr:=2;helpline[1]:=65979;helpline[0]:=65977;
end;error;begin curval:=0;curvallevel:=0;end;
end else begin curval:=curval*4096+curval1;curvallevel:=0;end;
end else if m=(1115276)then begin begin curval:=-1;curvallevel:=0;end;
end else if m<983872 then begin curval:=newequiv(m+curval);
curvallevel:=0;end else begin curval:=neweqtbint(m+curval);
curvallevel:=0;end;end{:420};74,75,89,90,91:{421:}
if level<>6 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65980);end;begin helpptr:=3;helpline[2]:=65981;helpline[1]:=65982;
helpline[0]:=65983;end;backerror;begin curval:=0;curvallevel:=1;end;
end else if curcmd<=75 then begin if curcmd<75 then begin
scaneightbitint;m:=589885+curval;end;begin curval:=newequiv(m);
curvallevel:=6;end;end else begin backinput;scanfontident;
begin curval:=196620+curval;curvallevel:=5;end;end{:421};
76:begin curval:=neweqtbint(m);curvallevel:=0;end;
94:begin scaneightbitint;m:=curval;
if newequiv(655423+m)<>0 then curval:=mem[newequiv(655423+m)+7].int else
curval:=0;curvallevel:=4;end;95:begin curval:=neweqtbint(m);
curvallevel:=4;end;77:begin curval:=neweqtbsc(m);curvallevel:=1;end;
78:begin curval:=newequiv(m);curvallevel:=2;end;
79:begin curval:=newequiv(m);curvallevel:=3;end;82:{424:}
if abs(curlist.modefield)<>m then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65997);end;printcmdchr(82,m);begin helpptr:=4;helpline[3]:=65998;
helpline[2]:=65999;helpline[1]:=66000;helpline[0]:=66001;end;error;
if level<>6 then begin curval:=0;curvallevel:=1;
end else begin curval:=0;curvallevel:=0;end;
end else if m=1 then begin curval:=curlist.auxfield.int;curvallevel:=1;
end else begin curval:=curlist.auxfield.hh.lh;curvallevel:=0;end{:424};
83:{428:}if curlist.modefield=0 then begin curval:=0;curvallevel:=0;
end else begin nest[nestptr]:=curlist;p:=nestptr;
while abs(nest[p].modefield)<>1 do decr(p);
begin curval:=nest[p].pgfield;curvallevel:=0;end;end{:428};85:{425:}
begin if m=0 then curval:=deadcycles{1499:}
else if m=2 then curval:=interaction{:1499}else curval:=insertpenalties;
curvallevel:=0;end{:425};84:{427:}
begin if(pagecontents=0)and(not outputactive)then if m=0 then curval:=
1073741823 else curval:=0 else curval:=pagesofar[m];curvallevel:=1;
end{:427};87:{429:}begin if m>524320 then{1623:}begin scanint;
if(newequiv(m)=0)or(curval<0)then curval:=0 else begin if curval>mem[
newequiv(m)+1].int then curval:=mem[newequiv(m)+1].int;
curval:=mem[newequiv(m)+curval+1].int;end;end{:1623}
else if newequiv(524320)=0 then curval:=0 else curval:=mem[newequiv(
524320)].hh.lh;curvallevel:=0;end{:429};86:{426:}
if m<=3 then begin scanregisternum;
if curval<65536 then q:=newequiv(655423+curval)else begin findsaelement(
7,curval,false);if curptr=0 then q:=0 else q:=mem[curptr+1].hh.rh;end;
if q=0 then curval:=0 else curval:=mem[q+m].int;curvallevel:=1;
end else begin confusion(66002);end{:426};70,71,72:begin curval:=curchr;
curvallevel:=0;end;80:{431:}if m=0 then begin findfontdimen(false);
fonttables[dimenfont,fonttables[dimenfont,0].int].int:=0;
begin curval:=fonttables[dimenfont,curval].int;curvallevel:=1;end;
end else begin scancharnum;
if m=1 then begin curval:=fonttables[mainf,fonttables[mainf,36].int+
fonttables[mainf,fonttables[mainf,34].int-fonttables[mainf,5].int+curval
].qqqq.b0].int end else if m=2 then begin curval:=fonttables[mainf,
fonttables[mainf,37].int+(fonttables[mainf,fonttables[mainf,34].int-
fonttables[mainf,5].int+curval].qqqq.b1)div 256].int end else if m=3
then begin curval:=fonttables[mainf,fonttables[mainf,38].int+(fonttables
[mainf,fonttables[mainf,34].int-fonttables[mainf,5].int+curval].qqqq.b1)
mod 256].int end else if m=4 then begin curval:=fonttables[mainf,
fonttables[mainf,39].int+(fonttables[mainf,fonttables[mainf,34].int-
fonttables[mainf,5].int+curval].qqqq.b2)div 256].int;
end else confusion(65810);curvallevel:=1;end{:431};81:{432:}
begin scanfontident;if m=0 then begin curval:=fonttables[curval,16].int;
curvallevel:=0;end else begin curval:=fonttables[curval,17].int;
curvallevel:=0;end;end{:432};92:{433:}begin scaneightbitint;
case m of 0:curval:=neweqtbint(1049484+curval);
1:curval:=neweqtbsc(1180581+(curval));2:curval:=newequiv(393248+curval);
3:curval:=newequiv(458784+curval);end;curvallevel:=m;end{:433};73:{430:}
if m>3 then if m>=28 then{1537:}
begin if m<29 then begin case m of{1564:}28:scanmuglue;{:1564}end;
curvallevel:=2;end else if m<30 then begin case m of{1565:}
29:scannormalglue;{:1565}end;curvallevel:=3;
end else begin curvallevel:=m-30;scanexpr;end;
while curvallevel>level do begin if curvallevel=2 then begin m:=curval;
curval:=mem[m+1].int;deleteglueref(m);
end else if curvallevel=3 then muerror;decr(curvallevel);end;
if negative then if curvallevel>=2 then begin m:=curval;
curval:=newspec(m);deleteglueref(m);{437:}
begin mem[curval+1].int:=-mem[curval+1].int;
mem[curval+2].int:=-mem[curval+2].int;
mem[curval+3].int:=-mem[curval+3].int;end{:437};
end else curval:=-curval;goto 10;end{:1537}
else if m>=19 then begin case m of{1476:}
19,20,21,22:begin scanfontident;q:=curval;scancharnum;
if(fonttables[q,12].int<=curval)and(fonttables[q,13].int>=curval)then
begin i:=fonttables[q,fonttables[q,34].int-fonttables[q,5].int+curval].
qqqq;case m of 19:curval:=fonttables[q,fonttables[q,36].int+i.b0].int;
20:curval:=fonttables[q,fonttables[q,37].int+(i.b1)div 256].int;
21:curval:=fonttables[q,fonttables[q,38].int+(i.b1)mod 256].int;
22:curval:=fonttables[q,fonttables[q,39].int+(i.b2)div 256].int;end;
end else curval:=0;end;{:1476}{1479:}23,24,25:begin q:=curchr-23;
scanint;
if(newequiv(524320)=0)or(curval<=0)then curval:=0 else begin if q=2 then
begin q:=curval mod 2;curval:=(curval+q)div 2;end;
if curval>mem[newequiv(524320)].hh.lh then curval:=mem[newequiv(524320)]
.hh.lh;curval:=mem[newequiv(524320)+2*curval-q].int;end;curvallevel:=1;
end;{:1479}{1561:}26,27:begin scannormalglue;q:=curval;
if m=26 then curval:=mem[q+2].int else curval:=mem[q+3].int;
deleteglueref(q);end;{:1561}end;curvallevel:=1;
end else begin case m of 4:curval:=line;5:curval:=lastbadness;{1453:}
6:curval:=0;7:curval:=1;11:curval:=2;8:curval:=0;9:curval:=15;
10:curval:=1;{:1453}{1470:}12:curval:=curlevel-1;13:curval:=curgroup;
{:1470}{1473:}14:begin q:=condptr;curval:=0;
while q<>0 do begin incr(curval);q:=mem[q].hh.rh;end;end;
15:if condptr=0 then curval:=0 else if curif<32 then curval:=curif+1
else curval:=-(curif-31);
16:if(iflimit=4)or(iflimit=3)then curval:=1 else if iflimit=2 then
curval:=-1 else curval:=0;{:1473}{1560:}17,18:begin scannormalglue;
q:=curval;if m=17 then curval:=mem[q].hh.b0 else curval:=mem[q].hh.b1;
deleteglueref(q);end;{:1560}end;curvallevel:=0;
end else begin if curchr=2 then curval:=membot else curval:=0;
if curchr=3 then begin curval:=0;
if(curlist.tailfield=curlist.headfield)or(curlist.modefield=0)then
curval:=-1;end else curvallevel:=curchr;
if not(curlist.tailfield>=himemmin)and(curlist.modefield<>0)then case
curchr of 0:if mem[curlist.tailfield].hh.b0=12 then curval:=mem[curlist.
tailfield+1].int;
1:if mem[curlist.tailfield].hh.b0=11 then curval:=mem[curlist.tailfield
+1].int;
2:if mem[curlist.tailfield].hh.b0=10 then begin curval:=mem[curlist.
tailfield+1].hh.lh;
if mem[curlist.tailfield].hh.b1=99 then curvallevel:=3;end;
3:if(mem[curlist.tailfield].hh.b0<>9)then if mem[curlist.tailfield].hh.
b0<=13 then curval:=mem[curlist.tailfield].hh.b0+1 else curval:=15;
end else if(curlist.modefield=1)and(curlist.tailfield=curlist.headfield)
then case curchr of 0:curval:=lastpenalty;1:curval:=lastkern;
2:if lastglue<>1073741823 then curval:=lastglue;3:curval:=lastnodetype;
end;end{:430};others:{434:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66003);end;printcmdchr(curcmd,curchr);print(66004);
printesc(65838);begin helpptr:=1;helpline[0]:=66001;end;error;
if level<>6 then begin curval:=0;curvallevel:=1;
end else begin curval:=0;curvallevel:=0;end;end{:434}end;
while curvallevel>level do{435:}
begin if curvallevel=2 then curval:=mem[curval+1].int else if
curvallevel=3 then muerror;decr(curvallevel);end{:435};{436:}
if negative then if curvallevel>=2 then begin curval:=newspec(curval);
{437:}begin mem[curval+1].int:=-mem[curval+1].int;
mem[curval+2].int:=-mem[curval+2].int;
mem[curval+3].int:=-mem[curval+3].int;end{:437};
end else curval:=-curval else if(curvallevel>=2)and(curvallevel<=3)then
incr(mem[curval].hh.rh){:436};10:end;{:419}{447:}procedure scanint;
label 30;var negative:boolean;m:integer;d:smallnumber;vacuous:boolean;
OKsofar:boolean;begin radix:=0;OKsofar:=true;{448:}negative:=false;
repeat{412:}repeat getxtoken;until curcmd<>10{:412};
if curtok=786477 then begin negative:=not negative;curtok:=786475;end;
until curtok<>786475{:448};if curtok=786528 then{449:}begin gettoken;
if curtok<1048575 then begin curval:=curchr;
if curcmd<=2 then if curcmd=2 then incr(alignstate)else decr(alignstate)
;end else if curtok<1114112 then curval:=curtok-1048576 else curval:=
curtok-1114112;if curval>65535 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66024);end;begin helpptr:=2;helpline[1]:=66025;helpline[0]:=66026;
end;curval:=48;backerror;end else{450:}begin getxtoken;
if curcmd<>10 then backinput;end{:450};end{:449}
else if(curcmd>=70)and(curcmd<=95)then scansomethinginternal(0,false)
else{451:}begin radix:=10;m:=214748364;
if curtok=786471 then begin radix:=8;m:=268435456;getxtoken;
end else if curtok=786466 then begin radix:=16;m:=134217728;getxtoken;
end;vacuous:=true;curval:=0;{452:}
while true do begin if(curtok<786480+radix)and(curtok>=786480)and(curtok
<=786489)then d:=curtok-786480 else if radix=16 then if(curtok<=720966)
and(curtok>=720961)then d:=curtok-720951 else if(curtok<=786502)and(
curtok>=786497)then d:=curtok-786487 else goto 30 else goto 30;
vacuous:=false;
if(curval>=m)and((curval>m)or(d>7)or(radix<>10))then begin if OKsofar
then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66027);end;begin helpptr:=2;helpline[1]:=66028;helpline[0]:=66029;
end;error;curval:=2147483647;OKsofar:=false;end;
end else curval:=curval*radix+d;getxtoken;end;30:{:452};
if vacuous then{453:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65980);end;begin helpptr:=3;helpline[2]:=65981;helpline[1]:=65982;
helpline[0]:=65983;end;backerror;end{:453}
else if curcmd<>10 then backinput;end{:451};
if negative then curval:=-curval;end;{:447}{455:}
procedure scandimen(mu,inf,shortcut:boolean);label 30,31,32,40,45,88,89;
var negative:boolean;f:integer;{457:}num,denom:1..65536;
k,kk:smallnumber;p,q:halfword;v:scaled;savecurval:integer;{:457}
begin f:=0;aritherror:=false;curorder:=0;negative:=false;
if not shortcut then begin{448:}negative:=false;repeat{412:}
repeat getxtoken;until curcmd<>10{:412};
if curtok=786477 then begin negative:=not negative;curtok:=786475;end;
until curtok<>786475{:448};if(curcmd>=70)and(curcmd<=95)then{456:}
if mu then begin scansomethinginternal(3,false);{458:}
if curvallevel>=2 then begin v:=mem[curval+1].int;deleteglueref(curval);
curval:=v;end{:458};if curvallevel=3 then goto 89;
if curvallevel<>0 then muerror;
end else begin scansomethinginternal(1,false);
if curvallevel=1 then goto 89;end{:456}else begin backinput;
if curtok=786476 then curtok:=786478;
if curtok<>786478 then scanint else begin radix:=10;curval:=0;end;
if curtok=786476 then curtok:=786478;
if(radix=10)and(curtok=786478)then{459:}begin k:=0;p:=0;gettoken;
while true do begin getxtoken;
if(curtok>786489)or(curtok<786480)then goto 31;
if k<17 then begin q:=getavail;mem[q].hh.rh:=p;
mem[q].hh.lh:=curtok-786480;p:=q;incr(k);end;end;
31:for kk:=k downto 1 do begin dig[kk-1]:=mem[p].hh.lh;q:=p;
p:=mem[p].hh.rh;begin mem[q].hh.rh:=avail;avail:=q;
ifdef('STAT')decr(dynused);endif('STAT')end;end;f:=rounddecimals(k);
if curcmd<>10 then backinput;end{:459};end;end;
if curval<0 then begin negative:=not negative;curval:=-curval;end;{460:}
if inf then{461:}if scankeyword(65597)then begin curorder:=1;
while scankeyword(108)do begin if curorder=4 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66031);end;print(66032);begin helpptr:=1;helpline[0]:=66033;end;
error;end else incr(curorder);end;goto 88;end{:461};{462:}
savecurval:=curval;{412:}repeat getxtoken;until curcmd<>10{:412};
if(curcmd<70)or(curcmd>95)then backinput else begin if mu then begin
scansomethinginternal(3,false);{458:}
if curvallevel>=2 then begin v:=mem[curval+1].int;deleteglueref(curval);
curval:=v;end{:458};if curvallevel<>3 then muerror;
end else scansomethinginternal(1,false);v:=curval;goto 40;end;
if mu then goto 45;if scankeyword(66034)then v:=({566:}
fonttables[newequiv(720959),fonttables[newequiv(720959),43].int+6].int{:
566})else if scankeyword(66035)then v:=({567:}
fonttables[newequiv(720959),fonttables[newequiv(720959),43].int+5].int{:
567})else goto 45;{450:}begin getxtoken;if curcmd<>10 then backinput;
end{:450};
40:curval:=multandadd(savecurval,v,xnoverd(v,f,65536),1073741823);
goto 89;45:{:462};if mu then{463:}
if scankeyword(65623)then goto 88 else begin begin if interaction=3 then
;if filelineerrorstylep then printfileline else printnl(65548);
print(66031);end;print(66036);begin helpptr:=4;helpline[3]:=66037;
helpline[2]:=66038;helpline[1]:=66039;helpline[0]:=66040;end;error;
goto 88;end{:463};if scankeyword(66030)then{464:}begin preparemag;
if neweqtbint(1049425)<>1000 then begin curval:=xnoverd(curval,1000,
neweqtbint(1049425));
f:=(1000*f+65536*texremainder)div neweqtbint(1049425);
curval:=curval+(f div 65536);f:=f mod 65536;end;end{:464};
if scankeyword(65683)then goto 88;{465:}
if scankeyword(66041)then begin num:=7227;denom:=100;
end else if scankeyword(66042)then begin num:=12;denom:=1;
end else if scankeyword(66043)then begin num:=7227;denom:=254;
end else if scankeyword(66044)then begin num:=7227;denom:=2540;
end else if scankeyword(66045)then begin num:=7227;denom:=7200;
end else if scankeyword(66046)then begin num:=1238;denom:=1157;
end else if scankeyword(66047)then begin num:=14856;denom:=1157;
end else if scankeyword(66048)then goto 30 else{466:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66031);end;print(66049);begin helpptr:=6;helpline[5]:=66050;
helpline[4]:=66051;helpline[3]:=66052;helpline[2]:=66038;
helpline[1]:=66039;helpline[0]:=66040;end;error;goto 32;end{:466};
curval:=xnoverd(curval,num,denom);
f:=(num*f+65536*texremainder)div denom;curval:=curval+(f div 65536);
f:=f mod 65536;32:{:465};
88:if curval>=16384 then aritherror:=true else curval:=curval*65536+f;
30:{:460};{450:}begin getxtoken;if curcmd<>10 then backinput;end{:450};
89:if aritherror or(abs(curval)>=1073741824)then{467:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66053);end;begin helpptr:=2;helpline[1]:=66054;helpline[0]:=66055;
end;error;curval:=1073741823;aritherror:=false;end{:467};
if negative then curval:=-curval;end;{:455}{468:}
procedure scanglue(level:smallnumber);label 10;var negative:boolean;
q:halfword;mu:boolean;begin mu:=(level=3);{448:}negative:=false;
repeat{412:}repeat getxtoken;until curcmd<>10{:412};
if curtok=786477 then begin negative:=not negative;curtok:=786475;end;
until curtok<>786475{:448};
if(curcmd>=70)and(curcmd<=95)then begin scansomethinginternal(level,
negative);
if curvallevel>=2 then begin if curvallevel<>level then muerror;goto 10;
end;if curvallevel=0 then scandimen(mu,false,true)else if level=3 then
muerror;end else begin backinput;scandimen(mu,false,false);
if negative then curval:=-curval;end;{469:}q:=newspec(membot);
mem[q+1].int:=curval;
if scankeyword(66056)then begin scandimen(mu,true,false);
mem[q+2].int:=curval;mem[q].hh.b0:=curorder;end;
if scankeyword(66057)then begin scandimen(mu,true,false);
mem[q+3].int:=curval;mem[q].hh.b1:=curorder;end;curval:=q{:469};10:end;
{1539:}{1550:}function addorsub(x,y,maxanswer:integer;
negative:boolean):integer;var a:integer;begin if negative then y:=-y;
if x>=0 then if y<=maxanswer-x then a:=x+y else begin aritherror:=true;
a:=0;
end else if y>=-maxanswer-x then a:=x+y else begin aritherror:=true;
a:=0;end;addorsub:=a;end;{:1550}{1554:}
function quotient(n,d:integer):integer;var negative:boolean;a:integer;
begin if d=0 then begin aritherror:=true;a:=0;
end else begin if d>0 then negative:=false else begin d:=-d;
negative:=true;end;if n<0 then begin n:=-n;negative:=not negative;end;
a:=n div d;n:=n-a*d;d:=n-d;if d+n>=0 then incr(a);
if negative then a:=-a;end;quotient:=a;end;{:1554}{1556:}
function fract(x,n,d,maxanswer:integer):integer;label 40,41,88,30;
var negative:boolean;a:integer;f:integer;h:integer;r:integer;t:integer;
begin if d=0 then goto 88;a:=0;
if d>0 then negative:=false else begin d:=-d;negative:=true;end;
if x<0 then begin x:=-x;negative:=not negative;
end else if x=0 then goto 30;if n<0 then begin n:=-n;
negative:=not negative;end;t:=n div d;if t>maxanswer div x then goto 88;
a:=t*x;n:=n-t*d;if n=0 then goto 40;t:=x div d;
if t>(maxanswer-a)div n then goto 88;a:=a+t*n;x:=x-t*d;
if x=0 then goto 40;if x<n then begin t:=x;x:=n;n:=t;end;{1557:}f:=0;
r:=(d div 2)-d;h:=-r;while true do begin if odd(n)then begin r:=r+x;
if r>=0 then begin r:=r-d;incr(f);end;end;n:=n div 2;
if n=0 then goto 41;if x<h then x:=x+x else begin t:=x-d;x:=t+x;f:=f+n;
if x<n then begin if x=0 then goto 41;t:=x;x:=n;n:=t;end;end;end;
41:{:1557}if f>(maxanswer-a)then goto 88;a:=a+f;
40:if negative then a:=-a;goto 30;88:begin aritherror:=true;a:=0;end;
30:fract:=a;end;{:1556}procedure scanexpr;label 20,22,40;
var a,b:boolean;l:smallnumber;r:smallnumber;s:smallnumber;o:smallnumber;
e:integer;t:integer;f:integer;n:integer;p:halfword;q:halfword;
begin l:=curvallevel;a:=aritherror;b:=false;p:=0;incr(expanddepthcount);
if expanddepthcount>=expanddepth then overflow(65928,expanddepth);
{1540:}20:r:=0;e:=0;s:=0;t:=0;n:=0;22:if s=0 then o:=l else o:=0;{1542:}
{412:}repeat getxtoken;until curcmd<>10{:412};
if curtok=786472 then{1545:}begin q:=getnode(4);mem[q].hh.rh:=p;
mem[q].hh.b0:=l;mem[q].hh.b1:=4*s+r;mem[q+1].int:=e;mem[q+2].int:=t;
mem[q+3].int:=n;p:=q;l:=o;goto 20;end{:1545};backinput;
if o=0 then scanint else if o=1 then scandimen(false,false,false)else if
o=2 then scannormalglue else scanmuglue;f:=curval{:1542};40:{1541:}
{412:}repeat getxtoken;until curcmd<>10{:412};
if curtok=786475 then o:=1 else if curtok=786477 then o:=2 else if
curtok=786474 then o:=3 else if curtok=786479 then o:=4 else begin o:=0;
if p=0 then begin if curcmd<>0 then backinput;
end else if curtok<>786473 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66778);end;begin helpptr:=1;helpline[0]:=66779;end;backerror;end;
end{:1541};aritherror:=b;{1547:}
if(l=0)or(s>2)then begin if(f>2147483647)or(f<-2147483647)then begin
aritherror:=true;f:=0;end;
end else if l=1 then begin if abs(f)>1073741823 then begin aritherror:=
true;f:=0;end;
end else begin if(abs(mem[f+1].int)>1073741823)or(abs(mem[f+2].int)>
1073741823)or(abs(mem[f+3].int)>1073741823)then begin aritherror:=true;
deleteglueref(f);f:=newspec(membot);end;end{:1547};case s of{1548:}
0:if(l>=2)and(o<>0)then begin t:=newspec(f);deleteglueref(f);
if mem[t+2].int=0 then mem[t].hh.b0:=0;
if mem[t+3].int=0 then mem[t].hh.b1:=0;end else t:=f;{:1548}{1552:}
3:if o=4 then begin n:=f;o:=5;
end else if l=0 then t:=multandadd(t,f,0,2147483647)else if l=1 then t:=
multandadd(t,f,0,1073741823)else begin mem[t+1].int:=multandadd(mem[t+1]
.int,f,0,1073741823);
mem[t+2].int:=multandadd(mem[t+2].int,f,0,1073741823);
mem[t+3].int:=multandadd(mem[t+3].int,f,0,1073741823);end;{:1552}{1553:}
4:if l<2 then t:=quotient(t,f)else begin mem[t+1].int:=quotient(mem[t+1]
.int,f);mem[t+2].int:=quotient(mem[t+2].int,f);
mem[t+3].int:=quotient(mem[t+3].int,f);end;{:1553}{1555:}
5:if l=0 then t:=fract(t,n,f,2147483647)else if l=1 then t:=fract(t,n,f,
1073741823)else begin mem[t+1].int:=fract(mem[t+1].int,n,f,1073741823);
mem[t+2].int:=fract(mem[t+2].int,n,f,1073741823);
mem[t+3].int:=fract(mem[t+3].int,n,f,1073741823);end;{:1555}end;
if o>2 then s:=o else{1549:}begin s:=0;
if r=0 then e:=t else if l=0 then e:=addorsub(e,t,2147483647,r=2)else if
l=1 then e:=addorsub(e,t,1073741823,r=2)else{1551:}
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
if mem[e+3].int=0 then mem[e].hh.b1:=0;end{:1551};r:=o;end{:1549};
b:=aritherror;if o<>0 then goto 22;if p<>0 then{1546:}begin f:=e;q:=p;
e:=mem[q+1].int;t:=mem[q+2].int;n:=mem[q+3].int;s:=mem[q].hh.b1 div 4;
r:=mem[q].hh.b1 mod 4;l:=mem[q].hh.b0;p:=mem[q].hh.rh;freenode(q,4);
goto 40;end{:1546}{:1540};decr(expanddepthcount);
if b then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66578);end;begin helpptr:=2;helpline[1]:=66777;helpline[0]:=66580;
end;error;if l>=2 then begin deleteglueref(e);e:=membot;
incr(mem[e].hh.rh);end else e:=0;end;aritherror:=a;curval:=e;
curvallevel:=l;end;{:1539}{1544:}procedure scannormalglue;
begin scanglue(2);end;procedure scanmuglue;begin scanglue(3);end;{:1544}
{:468}{470:}function scanrulespec:halfword;label 21;var q:halfword;
begin q:=newrule;if curcmd=35 then begin mem[q+1].int:=26214;
mem[q+4].hh.lh:=neweqtbint(1049480);end else begin mem[q+3].int:=26214;
mem[q+2].int:=0;mem[q+4].hh.lh:=neweqtbint(1049482);end;
21:if scankeyword(66058)then begin scandimen(false,false,false);
mem[q+1].int:=curval;goto 21;end;
if scankeyword(66059)then begin scandimen(false,false,false);
mem[q+3].int:=curval;goto 21;end;
if scankeyword(66060)then begin scandimen(false,false,false);
mem[q+2].int:=curval;goto 21;end;scanrulespec:=q;end;{:470}{471:}{1488:}
procedure scangeneraltext;label 40;var s:0..5;w:halfword;d:halfword;
p:halfword;q:halfword;unbalance:halfword;begin s:=scannerstatus;
w:=warningindex;d:=defref;scannerstatus:=5;warningindex:=curcs;
defref:=getavail;mem[defref].hh.lh:=0;p:=defref;scanleftbrace;
unbalance:=1;while true do begin gettoken;
if curtok<196608 then if curcmd<2 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 40;end;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;
40:q:=mem[defref].hh.rh;begin mem[defref].hh.rh:=avail;avail:=defref;
ifdef('STAT')decr(dynused);endif('STAT')end;
if q=0 then curval:=memtop-3 else curval:=p;mem[memtop-3].hh.rh:=q;
scannerstatus:=s;warningindex:=w;defref:=d;end;{:1488}{1510:}
procedure pseudostart;var oldsetting:0..21;s:strnumber;l,m:poolpointer;
p,q,r:halfword;w:fourquarters;nl,sz:integer;begin scangeneraltext;
oldsetting:=selector;selector:=21;tokenshow(memtop-3);
selector:=oldsetting;flushlist(mem[memtop-3].hh.rh);
begin if poolptr+1>poolsize then overflow(65543,poolsize-initpoolptr);
end;s:=makestring;{1511:}strpool[poolptr]:=32;l:=strstartar[s-65536];
nl:=neweqtbint(1049457);p:=getavail;q:=p;while l<poolptr do begin m:=l;
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
pseudofiles:=p{:1511};begin decr(strptr);
poolptr:=strstartar[strptr-65536];end;{1512:}beginfilereading;line:=0;
curinput.limitfield:=curinput.startfield;
curinput.locfield:=curinput.limitfield+1;
if neweqtbint(1049472)>0 then begin if termoffset>maxprintline-3 then
println else if(termoffset>0)or(fileoffset>0)then printchar(32);
curinput.namefield:=19;print(66763);incr(openparens);fflush(stdout);
end else curinput.namefield:=18{:1512};end;{:1510}
function strtoks(b:poolpointer):halfword;var p:halfword;q:halfword;
t:halfword;k:poolpointer;
begin begin if poolptr+1>poolsize then overflow(65543,poolsize-
initpoolptr);end;p:=memtop-3;mem[p].hh.rh:=0;k:=b;
while k<poolptr do begin t:=strpool[k];
if t=32 then t:=655392 else t:=786432+t;begin begin q:=avail;
if q=0 then q:=getavail else begin avail:=mem[q].hh.rh;mem[q].hh.rh:=0;
ifdef('STAT')incr(dynused);endif('STAT')end;end;mem[p].hh.rh:=q;
mem[q].hh.lh:=t;p:=q;end;incr(k);end;poolptr:=b;strtoks:=p;end;{:471}
{472:}function thetoks:halfword;label 10;var oldsetting:0..21;
p,q,r:halfword;b:poolpointer;c:smallnumber;begin{1493:}
if odd(curchr)then begin c:=curchr;scangeneraltext;
if c=1 then thetoks:=curval else begin oldsetting:=selector;
selector:=21;b:=poolptr;p:=getavail;mem[p].hh.rh:=mem[memtop-3].hh.rh;
tokenshow(p);flushlist(p);selector:=oldsetting;thetoks:=strtoks(b);end;
goto 10;end{:1493};getxtoken;scansomethinginternal(6,false);
if curvallevel>=5 then{473:}begin p:=memtop-3;mem[p].hh.rh:=0;
if curvallevel=5 then begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=1048575+curval;p:=q;
end else if curval<>0 then begin r:=mem[curval].hh.rh;
while r<>0 do begin begin begin q:=avail;
if q=0 then q:=getavail else begin avail:=mem[q].hh.rh;mem[q].hh.rh:=0;
ifdef('STAT')incr(dynused);endif('STAT')end;end;mem[p].hh.rh:=q;
mem[q].hh.lh:=mem[r].hh.lh;p:=q;end;r:=mem[r].hh.rh;end;end;thetoks:=p;
end{:473}else begin oldsetting:=selector;selector:=21;b:=poolptr;
case curvallevel of 0:printint(curval);4:printdir(curval);
1:begin printscaled(curval);print(65683);end;
2:begin printspec(curval,65683);deleteglueref(curval);end;
3:begin printspec(curval,65623);deleteglueref(curval);end;end;
selector:=oldsetting;thetoks:=strtoks(b);end;10:end;{:472}{474:}
procedure insthetoks;begin mem[memtop-12].hh.rh:=thetoks;
begintokenlist(mem[memtop-3].hh.rh,4);end;{:474}{477:}
procedure convtoks;var oldsetting:0..21;c:smallnumber;
savescannerstatus:smallnumber;b:poolpointer;begin c:=curchr;{478:}
case c of 0,1:scanint;2,3:begin savescannerstatus:=scannerstatus;
scannerstatus:=0;gettoken;scannerstatus:=savescannerstatus;end;
4:scanfontident;5:;6:;7:;8:if jobname=0 then openlogfile;{1455:}9:;10:;
11:;{:1455}end{:478};oldsetting:=selector;selector:=21;b:=poolptr;{479:}
case c of 0:printint(curval);1:printromanint(curval);
2:if curcs<>0 then sprintcs(curcs)else printchar(curchr);3:printmeaning;
4:begin print(fonttables[curval,10].int);
if fonttables[curval,6].int<>fonttables[curval,7].int then begin print(
66070);printscaled(fonttables[curval,6].int);print(65683);end;end;
5:print(65536);6:print(65537);7:print(65538);8:print(jobname);{1456:}
9:print(65541);10:print(65540);11:print(65539);{:1456}end{:479};
selector:=oldsetting;mem[memtop-12].hh.rh:=strtoks(b);
begintokenlist(mem[memtop-3].hh.rh,4);end;{:477}{480:}
function scantoks(macrodef,xpand:boolean):halfword;label 40,22,30,31,32;
var t:halfword;s:halfword;p:halfword;q:halfword;unbalance:halfword;
hashbrace:halfword;
begin if macrodef then scannerstatus:=2 else scannerstatus:=5;
warningindex:=curcs;defref:=getavail;mem[defref].hh.lh:=0;p:=defref;
hashbrace:=0;t:=786480;if macrodef then{481:}
begin while true do begin 22:gettoken;if curtok<196608 then goto 31;
if curcmd=6 then{483:}begin s:=851968+curchr;gettoken;
if curtok<131072 then begin hashbrace:=curtok;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=917504;p:=q;end;goto 30;end;
if t=786489 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66073);end;begin helpptr:=2;helpline[1]:=66074;helpline[0]:=66075;
end;error;goto 22;end else begin incr(t);
if curtok<>t then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66076);end;begin helpptr:=2;helpline[1]:=66077;helpline[0]:=66078;
end;backerror;end;curtok:=s;end;end{:483};begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;31:begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=917504;p:=q;end;if curcmd=2 then{482:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65967);end;incr(alignstate);begin helpptr:=2;helpline[1]:=66071;
helpline[0]:=66072;end;error;goto 40;end{:482};30:end{:481}
else scanleftbrace;{484:}unbalance:=1;
while true do begin if xpand then{485:}
begin while true do begin getnext;
if curcmd>=128 then if mem[mem[curchr].hh.rh].hh.lh=917505 then begin
curcmd:=0;curchr:=65537;end;if curcmd<=117 then goto 32;
if curcmd<>126 then expand else begin q:=thetoks;
if mem[memtop-3].hh.rh<>0 then begin mem[p].hh.rh:=mem[memtop-3].hh.rh;
p:=q;end;end;end;32:xtoken end{:485}else gettoken;
if curtok<196608 then if curcmd<2 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 40;
end else if curcmd=6 then if macrodef then{486:}begin s:=curtok;
if xpand then getxtoken else gettoken;
if curcmd<>6 then if(curtok<=786480)or(curtok>t)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66079);end;sprintcs(warningindex);begin helpptr:=3;
helpline[2]:=66080;helpline[1]:=66081;helpline[0]:=66082;end;backerror;
curtok:=s;end else curtok:=327632+curchr;end{:486};begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end{:484};
40:scannerstatus:=0;if hashbrace<>0 then begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=hashbrace;p:=q;end;scantoks:=p;end;{:480}
{489:}procedure readtoks(n:integer;r:halfword;j:halfword);label 30;
var p:halfword;q:halfword;s:integer;m:smallnumber;
begin scannerstatus:=2;warningindex:=r;defref:=getavail;
mem[defref].hh.lh:=0;p:=defref;begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=917504;p:=q;end;if(n<0)or(n>15)then m:=16 else m:=n;
s:=alignstate;alignstate:=1000000;repeat{490:}beginfilereading;
curinput.namefield:=m+1;if readopen[m]=2 then{491:}
if interaction>1 then if n<0 then begin;print(65624);terminput;
end else begin;println;sprintcs(r);begin;print(61);terminput;end;n:=-1;
end else begin curinput.limitfield:=0;fatalerror(66083);end{:491}
else if readopen[m]=1 then{492:}
begin readfilemode[m]:=getfilemode(readfile[m],newequiv(589875));
if readfilemode[m]>0 then readfiletranslation[m]:=newequiv(589876+
readfilemode[m]-1);
if newinputln(readfile[m],readfilemode[m],readfiletranslation[m],false)
then readopen[m]:=0 else begin aclose(readfile[m]);readopen[m]:=2;
end end{:492}else{493:}
begin if not newinputln(readfile[m],readfilemode[m],readfiletranslation[
m],true)then begin aclose(readfile[m]);readopen[m]:=2;
if alignstate<>1000000 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66084);end;printesc(65834);begin helpptr:=1;helpline[0]:=66085;
end;alignstate:=1000000;curinput.limitfield:=0;error;end;end;end{:493};
curinput.limitfield:=last;
if(neweqtbint(1049456)<0)or(neweqtbint(1049456)>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=neweqtbint(1049456);
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
curinput.statefield:=33;{1518:}
if j=1 then begin while curinput.locfield<=curinput.limitfield do begin
curchr:=buffer[curinput.locfield];incr(curinput.locfield);
if curchr=32 then curtok:=655392 else curtok:=curchr+786432;
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;
goto 30;end{:1518};while true do begin gettoken;
if curtok=0 then goto 30;
if alignstate<1000000 then begin repeat gettoken;until curtok=0;
alignstate:=1000000;goto 30;end;begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end;30:endfilereading{:490};
until alignstate=1000000;curval:=defref;scannerstatus:=0;alignstate:=s;
end;{:489}{501:}procedure passtext;label 30;var l:integer;
savescannerstatus:smallnumber;begin savescannerstatus:=scannerstatus;
scannerstatus:=1;l:=0;skipline:=line;while true do begin getnext;
if curcmd=123 then begin if l=0 then goto 30;if curchr=2 then decr(l);
end else if curcmd=122 then incr(l);end;
30:scannerstatus:=savescannerstatus;
if neweqtbint(1049471)>0 then showcurcmdchr;end;{:501}{504:}
procedure changeiflimit(l:smallnumber;p:halfword);label 10;
var q:halfword;begin if p=condptr then iflimit:=l else begin q:=condptr;
while true do begin if q=0 then confusion(66086);
if mem[q].hh.rh=p then begin mem[q].hh.b0:=l;goto 10;end;
q:=mem[q].hh.rh;end;end;10:end;{:504}{505:}procedure conditional;
label 10,50;var b:boolean;r:60..62;m,n:integer;p,q:halfword;
savescannerstatus:smallnumber;savecondptr:halfword;thisif:smallnumber;
isunless:boolean;
begin if neweqtbint(1049471)>0 then if neweqtbint(1049444)<=1 then
showcurcmdchr;{502:}begin p:=getnode(2);mem[p].hh.rh:=condptr;
mem[p].hh.b0:=iflimit;mem[p].hh.b1:=curif;mem[p+1].int:=ifline;
condptr:=p;curif:=curchr;iflimit:=1;ifline:=line;end{:502};
savecondptr:=condptr;isunless:=(curchr>=32);thisif:=curchr mod 32;{508:}
case thisif of 0,1:{513:}begin begin getxtoken;
if curcmd=0 then if curchr=65537 then begin curcmd:=13;
curchr:=curtok-1048576;end;end;
if(curcmd>13)or(curchr>65535)then begin m:=0;n:=65536;
end else begin m:=curcmd;n:=curchr;end;begin getxtoken;
if curcmd=0 then if curchr=65537 then begin curcmd:=13;
curchr:=curtok-1048576;end;end;
if(curcmd>13)or(curchr>65535)then begin curcmd:=0;curchr:=65536;end;
if thisif=0 then b:=(n=curchr)else b:=(m=curcmd);end{:513};2,3:{510:}
begin if thisif=2 then scanint else scandimen(false,false,false);
n:=curval;{412:}repeat getxtoken;until curcmd<>10{:412};
if(curtok>=786492)and(curtok<=786494)then r:=curtok-786432 else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66110);end;printcmdchr(122,thisif);begin helpptr:=1;
helpline[0]:=66111;end;backerror;r:=61;end;
if thisif=2 then scanint else scandimen(false,false,false);
case r of 60:b:=(n<curval);61:b:=(n=curval);62:b:=(n>curval);end;
end{:510};4:{511:}begin scanint;b:=odd(curval);end{:511};
5:b:=(abs(curlist.modefield)=1);6:b:=(abs(curlist.modefield)=119);
7:b:=(abs(curlist.modefield)=237);8:b:=(curlist.modefield<0);
9,10,11:{512:}begin scanregisternum;
if curval<65536 then p:=newequiv(655423+curval)else begin findsaelement(
7,curval,false);if curptr=0 then p:=0 else p:=mem[curptr+1].hh.rh;end;
if thisif=9 then b:=(p=0)else if p=0 then b:=false else if thisif=10
then b:=(mem[p].hh.b0=0)else b:=(mem[p].hh.b0=1);end{:512};12:{514:}
begin savescannerstatus:=scannerstatus;scannerstatus:=0;getnext;
n:=curcs;p:=curcmd;q:=curchr;getnext;
if curcmd<>p then b:=false else if curcmd<128 then b:=(curchr=q)else{515
:}begin p:=mem[curchr].hh.rh;q:=mem[newequiv(n)].hh.rh;
if p=q then b:=true else begin while(p<>0)and(q<>0)do if mem[p].hh.lh<>
mem[q].hh.lh then p:=0 else begin p:=mem[p].hh.rh;q:=mem[q].hh.rh;end;
b:=((p=0)and(q=0));end;end{:515};scannerstatus:=savescannerstatus;
end{:514};13:begin scanfourbitintor18;
if curval=18 then b:=not shellenabledp else b:=(readopen[curval]=2);end;
14:b:=true;15:b:=false;{1523:}17:begin savescannerstatus:=scannerstatus;
scannerstatus:=0;getnext;b:=(curcmd<>118);
scannerstatus:=savescannerstatus;end;{:1523}{1524:}18:begin n:=getavail;
p:=n;repeat getxtoken;if curcs=0 then begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;until curcs<>0;if curcmd<>67 then{378:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65935);end;printesc(65795);print(65936);begin helpptr:=2;
helpline[1]:=65937;helpline[0]:=65938;end;backerror;end{:378};{1525:}
m:=first;p:=mem[n].hh.rh;
while p<>0 do begin if m>=maxbufstack then begin maxbufstack:=m+1;
if maxbufstack=bufsize then overflow(65542,bufsize);end;
buffer[m]:=mem[p].hh.lh mod 256;incr(m);p:=mem[p].hh.rh;end;
if m>first+1 then curcs:=idlookup(first,m-first)else if m=first then
curcs:=131073 else curcs:=65537+buffer[first]{:1525};flushlist(n);
b:=(neweqtype(curcs)<>118);end;{:1524}{1526:}19:begin scanfontident;
n:=curval;scancharnum;
if(fonttables[n,12].int<=curval)and(fonttables[n,13].int>=curval)then b
:=(fonttables[n,fonttables[n,34].int-fonttables[n,5].int+curval].qqqq.b0
>0)else b:=false;end;{:1526}16:{516:}begin scanint;n:=curval;
if neweqtbint(1049444)>1 then begin begindiagnostic;print(66112);
printint(n);printchar(125);enddiagnostic(false);end;
while n<>0 do begin passtext;
if condptr=savecondptr then if curchr=4 then decr(n)else goto 50 else if
curchr=2 then{503:}begin if ifstack[inopen]=condptr then ifwarning;
p:=condptr;ifline:=mem[p+1].int;curif:=mem[p].hh.b1;
iflimit:=mem[p].hh.b0;condptr:=mem[p].hh.rh;freenode(p,2);end{:503};end;
changeiflimit(4,savecondptr);goto 10;end{:516};end{:508};
if isunless then b:=not b;if neweqtbint(1049444)>1 then{509:}
begin begindiagnostic;if b then print(66108)else print(66109);
enddiagnostic(false);end{:509};
if b then begin changeiflimit(3,savecondptr);goto 10;end;{507:}
while true do begin passtext;
if condptr=savecondptr then begin if curchr<>4 then goto 50;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66106);end;printesc(66104);begin helpptr:=1;helpline[0]:=66107;
end;error;end else if curchr=2 then{503:}
begin if ifstack[inopen]=condptr then ifwarning;p:=condptr;
ifline:=mem[p+1].int;curif:=mem[p].hh.b1;iflimit:=mem[p].hh.b0;
condptr:=mem[p].hh.rh;freenode(p,2);end{:503};end{:507};
50:if curchr=2 then{503:}
begin if ifstack[inopen]=condptr then ifwarning;p:=condptr;
ifline:=mem[p+1].int;curif:=mem[p].hh.b1;iflimit:=mem[p].hh.b0;
condptr:=mem[p].hh.rh;freenode(p,2);end{:503}else iflimit:=2;10:end;
{:505}{522:}procedure beginname;begin areadelimiter:=0;extdelimiter:=0;
quotedfilename:=false;end;{:522}{523:}
function morename(c:ASCIIcode):boolean;
begin if(c=32)and stopatspace and(not quotedfilename)then morename:=
false else if c=34 then begin quotedfilename:=not quotedfilename;
morename:=true;
end else begin begin if poolptr+1>poolsize then overflow(65543,poolsize-
initpoolptr);end;begin strpool[poolptr]:=c;incr(poolptr);end;
if ISDIRSEP(c)then begin areadelimiter:=(poolptr-strstartar[strptr-65536
]);extdelimiter:=0;
end else if c=46 then extdelimiter:=(poolptr-strstartar[strptr-65536]);
morename:=true;end;end;{:523}{524:}procedure endname;
var tempstr:strnumber;j,s,t:poolpointer;mustquote:boolean;
begin if strptr+3>maxstrings then overflow(65544,maxstrings-initstrptr);
begin if poolptr+6>poolsize then overflow(65543,poolsize-initpoolptr);
end;if areadelimiter<>0 then begin mustquote:=false;
s:=strstartar[strptr-65536];t:=strstartar[strptr-65536]+areadelimiter;
j:=s;while(not mustquote)and(j<t)do begin mustquote:=strpool[j]=32;
incr(j);end;
if mustquote then begin for j:=poolptr-1 downto t do strpool[j+2]:=
strpool[j];strpool[t+1]:=34;
for j:=t-1 downto s do strpool[j+1]:=strpool[j];strpool[s]:=34;
if extdelimiter<>0 then extdelimiter:=extdelimiter+2;
areadelimiter:=areadelimiter+2;poolptr:=poolptr+2;end;end;
s:=strstartar[strptr-65536]+areadelimiter;
if extdelimiter=0 then t:=poolptr else t:=strstartar[strptr-65536]+
extdelimiter-1;mustquote:=false;j:=s;
while(not mustquote)and(j<t)do begin mustquote:=strpool[j]=32;incr(j);
end;if mustquote then begin for j:=poolptr-1 downto t do strpool[j+2]:=
strpool[j];strpool[t+1]:=34;
for j:=t-1 downto s do strpool[j+1]:=strpool[j];strpool[s]:=34;
if extdelimiter<>0 then extdelimiter:=extdelimiter+2;poolptr:=poolptr+2;
end;
if extdelimiter<>0 then begin s:=strstartar[strptr-65536]+extdelimiter-1
;t:=poolptr;mustquote:=false;j:=s;
while(not mustquote)and(j<t)do begin mustquote:=strpool[j]=32;incr(j);
end;if mustquote then begin strpool[t+1]:=34;
for j:=t-1 downto s do strpool[j+1]:=strpool[j];strpool[s]:=34;
poolptr:=poolptr+2;end;end;
if areadelimiter=0 then curarea:=65624 else begin curarea:=strptr;
strstartar[strptr-65535]:=strstartar[strptr-65536]+areadelimiter;
incr(strptr);tempstr:=searchstring(curarea);
if tempstr>0 then begin curarea:=tempstr;decr(strptr);
for j:=strstartar[strptr-65535]to poolptr-1 do begin strpool[j-
areadelimiter]:=strpool[j];end;poolptr:=poolptr-areadelimiter;end;end;
if extdelimiter=0 then begin curext:=65624;curname:=slowmakestring;
end else begin curname:=strptr;
strstartar[strptr-65535]:=strstartar[strptr-65536]+extdelimiter-
areadelimiter-1;incr(strptr);curext:=makestring;decr(strptr);
tempstr:=searchstring(curname);if tempstr>0 then begin curname:=tempstr;
decr(strptr);
for j:=strstartar[strptr-65535]to poolptr-1 do begin strpool[j-
extdelimiter+areadelimiter+1]:=strpool[j];end;
poolptr:=poolptr-extdelimiter+areadelimiter+1;end;
curext:=slowmakestring;end;end;{:524}{526:}
procedure packfilename(n,a,e:strnumber);var k:integer;c:ASCIIcode;
j:poolpointer;begin k:=0;if nameoffile then libcfree(nameoffile);
nameoffile:=xmallocarray(char,1+length(a)+length(n)+length(e));
for j:=strstartar[a-65536]to strstartar[a-65535]-1 do begin c:=strpool[j
];if not(c=34)then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end end;
for j:=strstartar[n-65536]to strstartar[n-65535]-1 do begin c:=strpool[j
];if not(c=34)then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end end;
for j:=strstartar[e-65536]to strstartar[e-65535]-1 do begin c:=strpool[j
];if not(c=34)then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end end;
if k<=maxint then namelength:=k else namelength:=maxint;
nameoffile[namelength+1]:=0;end;{:526}{530:}
procedure packbufferedname(n:smallnumber;a,b:integer);var k:integer;
c:ASCIIcode;j:integer;begin if n+b-a+5>maxint then b:=a+maxint-n-5;k:=0;
if nameoffile then libcfree(nameoffile);
nameoffile:=xmallocarray(char,1+n+(b-a+1)+4);
for j:=1 to n do begin c:=TEXformatdefault[j];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;for j:=a to b do begin c:=buffer[j];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;for j:=formatdefaultlength-3 to formatdefaultlength do begin c:=
TEXformatdefault[j];if not(c=34)then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end end;
if k<=maxint then namelength:=k else namelength:=maxint;
nameoffile[namelength+1]:=0;end;{:530}{532:}
function makenamestring:strnumber;var k:1..maxint;
saveareadelimiter,saveextdelimiter:poolpointer;
savenameinprogress,savestopatspace:boolean;
begin if(poolptr+namelength>poolsize)or(strptr=maxstrings)or((poolptr-
strstartar[strptr-65536])>0)then makenamestring:=63 else begin for k:=1
to namelength do begin strpool[poolptr]:=nameoffile[k];incr(poolptr);
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
begin wmakenamestring:=makenamestring;end;{:532}{533:}
procedure scanfilename;label 30;var savewarningindex:halfword;
begin savewarningindex:=warningindex;warningindex:=curcs;{410:}
repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:410};backinput;
if curcmd=1 then scanfilenamebraced else begin nameinprogress:=true;
beginname;{412:}repeat getxtoken;until curcmd<>10{:412};
while true do begin if(curcmd>12)or(curchr>65535)then begin backinput;
goto 30;end;
if(curchr=32)and(curinput.statefield<>0)and(curinput.locfield>curinput.
limitfield)then goto 30;if not morename(curchr)then goto 30;getxtoken;
end;end;30:endname;nameinprogress:=false;warningindex:=savewarningindex;
end;{:533}{534:}procedure scanfilenamebraced;
var savescannerstatus:smallnumber;savedefref:halfword;
savecurcs:halfword;s:strnumber;p:halfword;i:integer;
savestopatspace:boolean;dummy:boolean;
begin savescannerstatus:=scannerstatus;savedefref:=defref;
savecurcs:=curcs;curcs:=warningindex;if scantoks(false,true)<>0 then;
oldsetting:=selector;selector:=21;
showtokenlist(mem[defref].hh.rh,0,poolsize-poolptr);
selector:=oldsetting;s:=makestring;deletetokenref(defref);
defref:=savedefref;curcs:=savecurcs;scannerstatus:=savescannerstatus;
savestopatspace:=stopatspace;stopatspace:=false;beginname;
for i:=strstartar[s-65536]to strstartar[s-65535]-1 do dummy:=morename(
strpool[i]);stopatspace:=savestopatspace;end;{:534}{537:}
procedure packjobname(s:strnumber);begin curarea:=65624;curext:=s;
curname:=jobname;packfilename(curname,curarea,curext);end;{:537}{538:}
procedure promptfilename(s,e:strnumber);label 30;var k:0..bufsize;
savedcurname:strnumber;savedcurext:strnumber;savedcurarea:strnumber;
begin if interaction=2 then;if s=66115 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66116);end else begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66117);end;printfilename(curname,curarea,curext);print(66118);
if(e=66119)or(e=65624)then showcontext;println;
printcstring(promptfilenamehelpmsg);if(e<>65624)then begin print(66120);
print(e);print(39);end;print(41);println;printnl(66121);print(s);
if interaction<2 then fatalerror(66122);savedcurname:=curname;
savedcurext:=curext;savedcurarea:=curarea;;begin;print(65873);terminput;
end;{539:}begin beginname;k:=first;
while(buffer[k]=32)and(k<last)do incr(k);
while true do begin if k=last then goto 30;
if not morename(buffer[k])then goto 30;incr(k);end;30:endname;end{:539};
if(length(curname)=0)and(curext=65624)and(curarea=65624)then begin
curname:=savedcurname;curext:=savedcurext;curarea:=savedcurarea;
end else if curext=65624 then curext:=e;
packfilename(curname,curarea,curext);end;{:538}{542:}
procedure openlogfile;var oldsetting:0..21;k:0..bufsize;l:0..bufsize;
months:constcstring;begin oldsetting:=selector;
if jobname=0 then jobname:=getjobname(66125);packjobname(66126);
recorderchangefilename(stringcast(nameoffile+1));packjobname(66127);
while not aopenout(logfile)do{543:}begin selector:=17;
promptfilename(66129,66127);end{:543};
texmflogname:=amakenamestring(logfile);selector:=18;logopened:=true;
{544:}
begin if srcspecialsp or filelineerrorstylep or parsefirstlinep then
write(logfile,'This is Aleph, Version 3.141592653-','1.15','-','2.1','-'
,'0.1')else write(logfile,'This is Aleph, Version 3.141592653-','1.15',
'-','2.1','-','0.1');write(logfile,versionstring);
if shellenabledp then begin writeln(logfile);write(logfile,' ');
if restrictedshell then begin write(logfile,'restricted ');end;
write(logfile,'\write18 enabled.')end;
if srcspecialsp then begin writeln(logfile);
write(logfile,' Source specials enabled.')end;
if filelineerrorstylep then begin writeln(logfile);
write(logfile,' file:line:error style messages enabled.')end;
if parsefirstlinep then begin writeln(logfile);
write(logfile,' %&-line parsing enabled.');end;slowprint(formatident);
printnl(65624);printint(neweqtbint(1049429));printchar(32);
months:=' JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC';
if(neweqtbint(1049430)<1)or(neweqtbint(1049430)>12)then fatalerror(66130
);
for k:=3*neweqtbint(1049430)-2 to 3*neweqtbint(1049430)do write(logfile,
months[k]);printchar(32);printint(neweqtbint(1049431));printchar(32);
printtwo(neweqtbint(1049428)div 60);printchar(58);
printtwo(neweqtbint(1049428)mod 60);printnl(66131);printnl(66132);
if(eTeXmode=1)then begin;writeln(logfile);
write(logfile,'entering extended mode');end;end{:544};
inputstack[inputptr]:=curinput;printnl(66128);
l:=inputstack[0].limitfield;
if buffer[l]=neweqtbint(1049456)then decr(l);
for k:=1 to l do print(buffer[k]);println;selector:=oldsetting+2;end;
{:542}{545:}procedure startinput;label 30;var tempstr:strnumber;
begin scanfilename;packfilename(curname,curarea,curext);
while true do begin beginfilereading;texinputtype:=1;
if kpseinnameok(nameoffile+1)and aopenin(inputfile[curinput.indexfield],
kpsetexformat)then goto 30;endfilereading;promptfilename(66115,65624);
end;
30:curinput.namefield:=amakenamestring(inputfile[curinput.indexfield]);
sourcefilenamestack[inopen]:=curinput.namefield;
fullsourcefilenamestack[inopen]:=makefullnamestring;
if curinput.namefield=strptr-1 then begin tempstr:=searchstring(curinput
.namefield);if tempstr>0 then begin curinput.namefield:=tempstr;
begin decr(strptr);poolptr:=strstartar[strptr-65536];end;end;end;
if jobname=0 then begin jobname:=getjobname(curname);openlogfile;end;
if termoffset+length(curinput.namefield)>maxprintline-2 then println
else if(termoffset>0)or(fileoffset>0)then printchar(32);printchar(40);
incr(openparens);slowprint(curinput.namefield);fflush(stdout);
curinput.statefield:=33;{546:}begin line:=1;
inputfilemode[curinput.indexfield]:=getfilemode(inputfile[curinput.
indexfield],newequiv(589875));
if inputfilemode[curinput.indexfield]>0 then inputfiletranslation[
curinput.indexfield]:=newequiv(589876+inputfilemode[curinput.indexfield]
-1);if newinputln(inputfile[curinput.indexfield],inputfilemode[curinput.
indexfield],inputfiletranslation[curinput.indexfield],false)then;
firmuptheline;
if(neweqtbint(1049456)<0)or(neweqtbint(1049456)>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=neweqtbint(1049456);
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end{:546};end;{:545}{568:}function readfontinfo(u:halfword;
nom,aire:strnumber;s:scaled;offset:quarterword;
naturaldir:integer):internalfontnumber;label 30,11,45;var k:fontindex;
nametoolong:boolean;fileopened:boolean;
lf,lh,bc,ec,nw,nh,nd,ni,nl,nk,ne,np:halfword;fontdir:halfword;
f:internalfontnumber;g:internalfontnumber;a,b,c,d:integer;
i,kparam,param,fontcounter:integer;fontlevel,headerlength:integer;
nco,ncw,npc,nlw,neew:integer;nki,nwi,nkf,nwf,nkm,nwm:integer;
nkr,nwr,nkg,nwg,nkp,nwp:integer;tablesize:array[0..31]of integer;
bytesperentry,extracharbytes:integer;repeatno,tablecounter:integer;
qw:fourquarters;sw:scaled;bchlabel:integer;bchar:0..65536;
firsttwo:integer;z:scaled;alpha:integer;beta:1..16;begin g:=0;{570:}
{571:}fileopened:=false;
nametoolong:=(length(nom)>255)or(length(aire)>255);
if nametoolong then goto 11;packfilename(nom,aire,65624);
if not ofmopenin(tfmfile)then goto 11;fileopened:=true{:571};{573:}
nco:=0;ncw:=0;npc:=0;nki:=0;nwi:=0;nkf:=0;nwf:=0;nkm:=0;nwm:=0;nkr:=0;
nwr:=0;nkg:=0;nwg:=0;nkp:=0;nwp:=0;begin firsttwo:=tfmtemp;
if firsttwo>127 then goto 11;tfmtemp:=getc(tfmfile);
firsttwo:=firsttwo*256+tfmtemp;end;
if firsttwo<>0 then begin fontlevel:=-1;lf:=firsttwo;
tfmtemp:=getc(tfmfile);begin lh:=tfmtemp;if lh>127 then goto 11;
tfmtemp:=getc(tfmfile);lh:=lh*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin bc:=tfmtemp;if bc>127 then goto 11;tfmtemp:=getc(tfmfile);
bc:=bc*256+tfmtemp;end;tfmtemp:=getc(tfmfile);begin ec:=tfmtemp;
if ec>127 then goto 11;tfmtemp:=getc(tfmfile);ec:=ec*256+tfmtemp;end;
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
np:=np*256+tfmtemp;end;headerlength:=6;ncw:=(ec-bc+1);nlw:=nl;neew:=ne;
end else begin tfmtemp:=getc(tfmfile);begin fontlevel:=tfmtemp;
if fontlevel>127 then goto 11;tfmtemp:=getc(tfmfile);
fontlevel:=fontlevel*256+tfmtemp;end;
if(fontlevel<>0)and(fontlevel<>1)then goto 11;tfmtemp:=getc(tfmfile);
begin lf:=tfmtemp;if lf>127 then goto 11;tfmtemp:=getc(tfmfile);
lf:=lf*256+tfmtemp;tfmtemp:=getc(tfmfile);lf:=lf*256+tfmtemp;
tfmtemp:=getc(tfmfile);lf:=lf*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin lh:=tfmtemp;if lh>127 then goto 11;tfmtemp:=getc(tfmfile);
lh:=lh*256+tfmtemp;tfmtemp:=getc(tfmfile);lh:=lh*256+tfmtemp;
tfmtemp:=getc(tfmfile);lh:=lh*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
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
tfmtemp:=getc(tfmfile);begin fontdir:=tfmtemp;
if fontdir>127 then goto 11;tfmtemp:=getc(tfmfile);
fontdir:=fontdir*256+tfmtemp;tfmtemp:=getc(tfmfile);
fontdir:=fontdir*256+tfmtemp;tfmtemp:=getc(tfmfile);
fontdir:=fontdir*256+tfmtemp;end;nlw:=2*nl;neew:=2*ne;
if fontlevel=0 then begin headerlength:=14;ncw:=2*(ec-bc+1);
end else begin headerlength:=29;tfmtemp:=getc(tfmfile);
begin nco:=tfmtemp;if nco>127 then goto 11;tfmtemp:=getc(tfmfile);
nco:=nco*256+tfmtemp;tfmtemp:=getc(tfmfile);nco:=nco*256+tfmtemp;
tfmtemp:=getc(tfmfile);nco:=nco*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin ncw:=tfmtemp;if ncw>127 then goto 11;tfmtemp:=getc(tfmfile);
ncw:=ncw*256+tfmtemp;tfmtemp:=getc(tfmfile);ncw:=ncw*256+tfmtemp;
tfmtemp:=getc(tfmfile);ncw:=ncw*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin npc:=tfmtemp;if npc>127 then goto 11;tfmtemp:=getc(tfmfile);
npc:=npc*256+tfmtemp;tfmtemp:=getc(tfmfile);npc:=npc*256+tfmtemp;
tfmtemp:=getc(tfmfile);npc:=npc*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nki:=tfmtemp;if nki>127 then goto 11;tfmtemp:=getc(tfmfile);
nki:=nki*256+tfmtemp;tfmtemp:=getc(tfmfile);nki:=nki*256+tfmtemp;
tfmtemp:=getc(tfmfile);nki:=nki*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nwi:=tfmtemp;if nwi>127 then goto 11;tfmtemp:=getc(tfmfile);
nwi:=nwi*256+tfmtemp;tfmtemp:=getc(tfmfile);nwi:=nwi*256+tfmtemp;
tfmtemp:=getc(tfmfile);nwi:=nwi*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nkf:=tfmtemp;if nkf>127 then goto 11;tfmtemp:=getc(tfmfile);
nkf:=nkf*256+tfmtemp;tfmtemp:=getc(tfmfile);nkf:=nkf*256+tfmtemp;
tfmtemp:=getc(tfmfile);nkf:=nkf*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nwf:=tfmtemp;if nwf>127 then goto 11;tfmtemp:=getc(tfmfile);
nwf:=nwf*256+tfmtemp;tfmtemp:=getc(tfmfile);nwf:=nwf*256+tfmtemp;
tfmtemp:=getc(tfmfile);nwf:=nwf*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nkm:=tfmtemp;if nkm>127 then goto 11;tfmtemp:=getc(tfmfile);
nkm:=nkm*256+tfmtemp;tfmtemp:=getc(tfmfile);nkm:=nkm*256+tfmtemp;
tfmtemp:=getc(tfmfile);nkm:=nkm*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nwm:=tfmtemp;if nwm>127 then goto 11;tfmtemp:=getc(tfmfile);
nwm:=nwm*256+tfmtemp;tfmtemp:=getc(tfmfile);nwm:=nwm*256+tfmtemp;
tfmtemp:=getc(tfmfile);nwm:=nwm*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nkr:=tfmtemp;if nkr>127 then goto 11;tfmtemp:=getc(tfmfile);
nkr:=nkr*256+tfmtemp;tfmtemp:=getc(tfmfile);nkr:=nkr*256+tfmtemp;
tfmtemp:=getc(tfmfile);nkr:=nkr*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nwr:=tfmtemp;if nwr>127 then goto 11;tfmtemp:=getc(tfmfile);
nwr:=nwr*256+tfmtemp;tfmtemp:=getc(tfmfile);nwr:=nwr*256+tfmtemp;
tfmtemp:=getc(tfmfile);nwr:=nwr*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nkg:=tfmtemp;if nkg>127 then goto 11;tfmtemp:=getc(tfmfile);
nkg:=nkg*256+tfmtemp;tfmtemp:=getc(tfmfile);nkg:=nkg*256+tfmtemp;
tfmtemp:=getc(tfmfile);nkg:=nkg*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nwg:=tfmtemp;if nwg>127 then goto 11;tfmtemp:=getc(tfmfile);
nwg:=nwg*256+tfmtemp;tfmtemp:=getc(tfmfile);nwg:=nwg*256+tfmtemp;
tfmtemp:=getc(tfmfile);nwg:=nwg*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nkp:=tfmtemp;if nkp>127 then goto 11;tfmtemp:=getc(tfmfile);
nkp:=nkp*256+tfmtemp;tfmtemp:=getc(tfmfile);nkp:=nkp*256+tfmtemp;
tfmtemp:=getc(tfmfile);nkp:=nkp*256+tfmtemp;end;tfmtemp:=getc(tfmfile);
begin nwp:=tfmtemp;if nwp>127 then goto 11;tfmtemp:=getc(tfmfile);
nwp:=nwp*256+tfmtemp;tfmtemp:=getc(tfmfile);nwp:=nwp*256+tfmtemp;
tfmtemp:=getc(tfmfile);nwp:=nwp*256+tfmtemp;end;end end;
if lf<>(headerlength+lh+ncw+nw+nh+nd+ni+nlw+nk+neew+np+nki+nwi+nkf+nwf+
nkm+nwm+nkr+nwr+nkg+nwg+nkp+nwp)then goto 11;{:573};{574:}
case fontlevel of-1:lf:=lf-6-lh;0:lf:=lf-14-lh-(ec-bc+1)-nl-ne;
1:lf:=lf-29-lh-ncw+(1+npc)*(ec-bc+1)-nl-ne;end;if np<7 then lf:=lf+7-np;
if(fontptr=fontmax)then{575:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66134);end;sprintcs(u);printchar(61);
printfilename(nom,aire,65624);if s>=0 then begin print(66070);
printscaled(s);print(65683);
end else if s<>-1000 then begin print(66135);printint(-s);end;
print(66144);begin helpptr:=4;helpline[3]:=66145;helpline[2]:=66146;
helpline[1]:=66147;helpline[0]:=66148;end;error;goto 30;end{:575};
f:=fontptr+1;allocatefonttable(f,44+lf+100);
fonttables[f,0].int:=44+lf+100;fonttables[f,15].int:=false;
fonttables[f,5].int:=offset;fonttables[f,21].int:=naturaldir;
fonttables[f,34].int:=44-bc;
fonttables[f,35].int:=fonttables[f,34].int+ec+1;
fonttables[f,22].int:=fonttables[f,35].int+npc*(ec-bc+1);
fonttables[f,23].int:=fonttables[f,22].int+nki;
fonttables[f,24].int:=fonttables[f,23].int+nkf;
fonttables[f,25].int:=fonttables[f,24].int+nkm;
fonttables[f,26].int:=fonttables[f,25].int+nkr;
fonttables[f,27].int:=fonttables[f,26].int+nkg;
fonttables[f,28].int:=fonttables[f,27].int+nkp;
fonttables[f,29].int:=fonttables[f,28].int+nwi;
fonttables[f,30].int:=fonttables[f,29].int+nwf;
fonttables[f,31].int:=fonttables[f,30].int+nwm;
fonttables[f,32].int:=fonttables[f,31].int+nwr;
fonttables[f,33].int:=fonttables[f,32].int+nwg;
fonttables[f,36].int:=fonttables[f,33].int+nwp;
fonttables[f,37].int:=fonttables[f,36].int+nw;
fonttables[f,38].int:=fonttables[f,37].int+nh;
fonttables[f,39].int:=fonttables[f,38].int+nd;
fonttables[f,40].int:=fonttables[f,39].int+ni;
fonttables[f,41].int:=fonttables[f,40].int+nl-256*(128);
fonttables[f,42].int:=fonttables[f,41].int+256*(128)+nk;
fonttables[f,43].int:=fonttables[f,42].int+ne;{:574};{576:}
begin if lh<2 then goto 11;tfmtemp:=getc(tfmfile);
fonttables[f,1].int:=tfmtemp;tfmtemp:=getc(tfmfile);
fonttables[f,2].int:=tfmtemp;tfmtemp:=getc(tfmfile);
fonttables[f,3].int:=tfmtemp;tfmtemp:=getc(tfmfile);
fonttables[f,4].int:=tfmtemp;tfmtemp:=getc(tfmfile);begin z:=tfmtemp;
if z>127 then goto 11;tfmtemp:=getc(tfmfile);z:=z*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);z:=z*256+tfmtemp;tfmtemp:=getc(tfmfile);
z:=(z*16)+(tfmtemp div 16);if z<65536 then goto 11;
while lh>2 do begin tfmtemp:=getc(tfmfile);tfmtemp:=getc(tfmfile);
tfmtemp:=getc(tfmfile);tfmtemp:=getc(tfmfile);decr(lh);end;
fonttables[f,7].int:=z;
if s<>-1000 then if s>=0 then z:=s else z:=xnoverd(z,-s,1000);
fonttables[f,6].int:=z;end{:576};{577:}if fontlevel=1 then begin i:=0;
k:=fonttables[f,22].int;fontcounter:=fonttables[f,28].int;
while k<fonttables[f,23].int do begin begin param:=tfmtemp;
if param>127 then goto 11;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;end;fonttables[f,k].int:=fontcounter;
fontcounter:=fontcounter+param;tablesize[i]:=1;incr(i);incr(k);end;
while k<fonttables[f,24].int do begin begin param:=tfmtemp;
if param>127 then goto 11;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;end;fonttables[f,k].int:=fontcounter;
fontcounter:=fontcounter+param;tablesize[i]:=1;incr(i);incr(k);end;
while k<fonttables[f,25].int do begin begin param:=tfmtemp;
if param>127 then goto 11;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;end;fonttables[f,k].int:=fontcounter;
fontcounter:=fontcounter+param;tablesize[i]:=1;incr(i);incr(k);end;
while k<fonttables[f,26].int do begin begin param:=tfmtemp;
if param>127 then goto 11;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;end;fonttables[f,k].int:=fontcounter;
fontcounter:=fontcounter+param*3;tablesize[i]:=3;incr(i);incr(k);end;
while k<fonttables[f,27].int do begin begin param:=tfmtemp;
if param>127 then goto 11;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;end;fonttables[f,k].int:=fontcounter;
fontcounter:=fontcounter+param*4;tablesize[i]:=4;incr(i);incr(k);end;
while k<fonttables[f,28].int do begin begin param:=tfmtemp;
if param>127 then goto 11;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;end;fonttables[f,k].int:=fontcounter;
fontcounter:=fontcounter+param*1;tablesize[i]:=1;incr(i);incr(k);end;
while k<fonttables[f,29].int do begin begin fonttables[f,k].int:=tfmtemp
;if fonttables[f,k].int>127 then goto 11;tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;end;incr(k);end;
while k<fonttables[f,30].int do begin begin fonttables[f,k].int:=tfmtemp
;if fonttables[f,k].int>127 then goto 11;tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;end;incr(k);end;
while k<fonttables[f,31].int do begin begin fonttables[f,k].int:=tfmtemp
;if fonttables[f,k].int>127 then goto 11;tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;end;incr(k);end;
while k<fonttables[f,32].int do begin begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,k].int:=sw else if a=255 then fonttables[f,k].
int:=sw-alpha else goto 11;end;begin tfmtemp:=getc(tfmfile);a:=tfmtemp;
tfmtemp:=getc(tfmfile);b:=tfmtemp;tfmtemp:=getc(tfmfile);c:=tfmtemp;
tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,k+1].int:=sw else if a=255 then fonttables[f,k
+1].int:=sw-alpha else goto 11;end;begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,k+2].int:=sw else if a=255 then fonttables[f,k
+2].int:=sw-alpha else goto 11;end;k:=k+3;end;
while k<fonttables[f,33].int do begin tfmtemp:=getc(tfmfile);
begin fonttables[f,k].hh.lhfield:=tfmtemp;
if fonttables[f,k].hh.lhfield>127 then goto 11;tfmtemp:=getc(tfmfile);
fonttables[f,k].hh.lhfield:=fonttables[f,k].hh.lhfield*256+tfmtemp;end;
tfmtemp:=getc(tfmfile);begin fonttables[f,k].hh.rh:=tfmtemp;
if fonttables[f,k].hh.rh>127 then goto 11;tfmtemp:=getc(tfmfile);
fonttables[f,k].hh.rh:=fonttables[f,k].hh.rh*256+tfmtemp;end;
begin tfmtemp:=getc(tfmfile);a:=tfmtemp;tfmtemp:=getc(tfmfile);
b:=tfmtemp;tfmtemp:=getc(tfmfile);c:=tfmtemp;tfmtemp:=getc(tfmfile);
d:=tfmtemp;sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,k+1].int:=sw else if a=255 then fonttables[f,k
+1].int:=sw-alpha else goto 11;end;begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,k+2].int:=sw else if a=255 then fonttables[f,k
+2].int:=sw-alpha else goto 11;end;begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,k+3].int:=sw else if a=255 then fonttables[f,k
+3].int:=sw-alpha else goto 11;end;k:=k+4;end;
while k<44 do begin begin fonttables[f,k].int:=tfmtemp;
if fonttables[f,k].int>127 then goto 11;tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,k].int:=fonttables[f,k].int*256+tfmtemp;end;incr(k);end;
end;k:=fonttables[f,34].int+bc;kparam:=fonttables[f,35].int;
bytesperentry:=(12+2*npc)div 4*4;
extracharbytes:=bytesperentry-(10+2*npc);
while k<fonttables[f,35].int do begin begin if(fontlevel<>-1)then begin
tfmtemp:=getc(tfmfile);begin a:=tfmtemp;tfmtemp:=getc(tfmfile);
a:=a*256+tfmtemp;end;qw.b0:=a;tfmtemp:=getc(tfmfile);begin b:=tfmtemp;
tfmtemp:=getc(tfmfile);b:=b*256+tfmtemp;end;qw.b1:=b;
tfmtemp:=getc(tfmfile);begin c:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=c*256+tfmtemp;end;qw.b2:=c;tfmtemp:=getc(tfmfile);begin d:=tfmtemp;
tfmtemp:=getc(tfmfile);d:=d*256+tfmtemp;end;qw.b3:=d;
fonttables[f,k].qqqq:=qw end else begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;qw.b0:=a;tfmtemp:=getc(tfmfile);b:=tfmtemp;
b:=((b div 16)*256)+(b mod 16);qw.b1:=b;tfmtemp:=getc(tfmfile);
c:=tfmtemp;c:=((c div 4)*256)+(c mod 4);qw.b2:=c;tfmtemp:=getc(tfmfile);
d:=tfmtemp;qw.b3:=d;fonttables[f,k].qqqq:=qw end end;
if(a>=nw)or((b div 256)>=nh)or((b mod 256)>=nd)or((c div 256)>=ni)then
goto 11;case c mod 4 of 1:if d>=nl then goto 11;3:if d>=ne then goto 11;
2:{578:}begin begin if(d<bc)or(d>ec)then goto 11 end;
while d<k-fonttables[f,34].int do begin qw:=fonttables[f,fonttables[f,34
].int-fonttables[f,5].int+d].qqqq;if((qw.b2)mod 4)<>2 then goto 45;
d:=qw.b3;end;if d=k-fonttables[f,34].int then goto 11;45:end{:578};
others:end;incr(k);if fontlevel=1 then begin tfmtemp:=getc(tfmfile);
begin repeatno:=tfmtemp;tfmtemp:=getc(tfmfile);
repeatno:=repeatno*256+tfmtemp;end;
for i:=0 to npc-1 do begin tfmtemp:=getc(tfmfile);begin param:=tfmtemp;
if param>127 then goto 11;tfmtemp:=getc(tfmfile);
param:=param*256+tfmtemp;end;
fonttables[f,kparam].int:=fonttables[f,fonttables[f,22].int+i].int+param
*tablesize[i];incr(kparam);end;
for i:=1 to extracharbytes do tfmtemp:=getc(tfmfile);
for i:=1 to repeatno do begin fonttables[f,k]:=fonttables[f,k-1];
incr(k);for tablecounter:=0 to npc-1 do begin fonttables[f,kparam].int:=
fonttables[f,kparam-npc].int;incr(kparam);end;end;end;end{:577};{579:}
begin{580:}begin alpha:=16;while z>=8388608 do begin z:=z div 2;
alpha:=alpha+alpha;end;beta:=256 div alpha;alpha:=alpha*z;end{:580};
for k:=fonttables[f,36].int to fonttables[f,40].int-1 do begin tfmtemp:=
getc(tfmfile);a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,k].int:=sw else if a=255 then fonttables[f,k].
int:=sw-alpha else goto 11;end;
if fonttables[f,fonttables[f,36].int].int<>0 then goto 11;
if fonttables[f,fonttables[f,37].int].int<>0 then goto 11;
if fonttables[f,fonttables[f,38].int].int<>0 then goto 11;
if fonttables[f,fonttables[f,39].int].int<>0 then goto 11;end{:579};
{581:}bchlabel:=nl;bchar:=65536;
if nl>0 then begin for k:=fonttables[f,40].int to fonttables[f,41].int
+256*(128)-1 do begin begin if(fontlevel<>-1)then begin tfmtemp:=getc(
tfmfile);begin a:=tfmtemp;tfmtemp:=getc(tfmfile);a:=a*256+tfmtemp;end;
qw.b0:=a;tfmtemp:=getc(tfmfile);begin b:=tfmtemp;tfmtemp:=getc(tfmfile);
b:=b*256+tfmtemp;end;qw.b1:=b;tfmtemp:=getc(tfmfile);begin c:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=c*256+tfmtemp;end;qw.b2:=c;
tfmtemp:=getc(tfmfile);begin d:=tfmtemp;tfmtemp:=getc(tfmfile);
d:=d*256+tfmtemp;end;qw.b3:=d;
fonttables[f,k].qqqq:=qw end else begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;qw.b0:=a;tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;
tfmtemp:=getc(tfmfile);c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);
d:=tfmtemp;qw.b3:=d;fonttables[f,k].qqqq:=qw end end;
if a>128 then begin if 256*c+d>=nl then goto 11;
if a=255 then if k=fonttables[f,40].int then bchar:=b;
end else begin if b<>bchar then begin begin if(b<bc)or(b>ec)then goto 11
end;
qw:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+b+fonttables[f
,5].int].qqqq;if not(qw.b0>0)then goto 11;end;
if c<128 then begin begin if(d<bc)or(d>ec)then goto 11 end;
qw:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+d+fonttables[f
,5].int].qqqq;if not(qw.b0>0)then goto 11;
end else if 256*(c-128)+d>=nk then goto 11;
if a<128 then if k-fonttables[f,40].int+a+1>=nl then goto 11;end;end;
if a=255 then bchlabel:=256*c+d;end;
for k:=fonttables[f,41].int+256*(128)to fonttables[f,42].int-1 do begin
tfmtemp:=getc(tfmfile);a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,k].int:=sw else if a=255 then fonttables[f,k].
int:=sw-alpha else goto 11;end;{:581};{582:}
for k:=fonttables[f,42].int to fonttables[f,43].int-1 do begin begin if(
fontlevel<>-1)then begin tfmtemp:=getc(tfmfile);begin a:=tfmtemp;
tfmtemp:=getc(tfmfile);a:=a*256+tfmtemp;end;qw.b0:=a;
tfmtemp:=getc(tfmfile);begin b:=tfmtemp;tfmtemp:=getc(tfmfile);
b:=b*256+tfmtemp;end;qw.b1:=b;tfmtemp:=getc(tfmfile);begin c:=tfmtemp;
tfmtemp:=getc(tfmfile);c:=c*256+tfmtemp;end;qw.b2:=c;
tfmtemp:=getc(tfmfile);begin d:=tfmtemp;tfmtemp:=getc(tfmfile);
d:=d*256+tfmtemp;end;qw.b3:=d;
fonttables[f,k].qqqq:=qw end else begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;qw.b0:=a;tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;
tfmtemp:=getc(tfmfile);c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);
d:=tfmtemp;qw.b3:=d;fonttables[f,k].qqqq:=qw end end;
if a<>0 then begin begin if(a<bc)or(a>ec)then goto 11 end;
qw:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+a+fonttables[f
,5].int].qqqq;if not(qw.b0>0)then goto 11;end;
if b<>0 then begin begin if(b<bc)or(b>ec)then goto 11 end;
qw:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+b+fonttables[f
,5].int].qqqq;if not(qw.b0>0)then goto 11;end;
if c<>0 then begin begin if(c<bc)or(c>ec)then goto 11 end;
qw:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+c+fonttables[f
,5].int].qqqq;if not(qw.b0>0)then goto 11;end;
begin begin if(d<bc)or(d>ec)then goto 11 end;
qw:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+d+fonttables[f
,5].int].qqqq;if not(qw.b0>0)then goto 11;end;end{:582};{583:}
begin for k:=1 to np do if k=1 then begin tfmtemp:=getc(tfmfile);
sw:=tfmtemp;if sw>127 then sw:=sw-256;tfmtemp:=getc(tfmfile);
sw:=sw*256+tfmtemp;tfmtemp:=getc(tfmfile);sw:=sw*256+tfmtemp;
tfmtemp:=getc(tfmfile);
fonttables[f,fonttables[f,43].int].int:=(sw*16)+(tfmtemp div 16);
end else begin tfmtemp:=getc(tfmfile);a:=tfmtemp;tfmtemp:=getc(tfmfile);
b:=tfmtemp;tfmtemp:=getc(tfmfile);c:=tfmtemp;tfmtemp:=getc(tfmfile);
d:=tfmtemp;sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fonttables[f,fonttables[f,43].int+k-1].int:=sw else if a=255
then fonttables[f,fonttables[f,43].int+k-1].int:=sw-alpha else goto 11;
end;if feof(tfmfile)then goto 11;
for k:=np+1 to 7 do fonttables[f,fonttables[f,43].int+k-1].int:=0;
end{:583};{584:}
if np>=7 then fonttables[f,8].int:=np else fonttables[f,8].int:=7;
fonttables[f,5].int:=offset;
fonttables[f,16].int:=neweqtbint(1049454)+offset;
fonttables[f,17].int:=neweqtbint(1049455)+offset;bchar:=bchar+offset;
if bchlabel<nl then fonttables[f,18].int:=bchlabel+fonttables[f,40].int
else fonttables[f,18].int:=0;fonttables[f,19].int:=bchar;
fonttables[f,20].int:=bchar;
if bchar<=ec then if bchar>=bc then begin qw:=fonttables[f,fonttables[f,
34].int-fonttables[f,5].int+bchar].qqqq;
if(qw.b0>0)then fonttables[f,20].int:=65536;end;
fonttables[f,10].int:=nom;fonttables[f,11].int:=aire;
fonttables[f,12].int:=bc;fonttables[f,13].int:=ec;
fonttables[f,14].int:=0;fonttables[f,12].int:=bc+offset;
fonttables[f,13].int:=ec+offset;fonttables[f,14].int:=0;
fonttables[f,34].int:=fonttables[f,34].int;
fonttables[f,36].int:=fonttables[f,36].int;
fonttables[f,40].int:=fonttables[f,40].int;
fonttables[f,41].int:=fonttables[f,41].int;
fonttables[f,42].int:=fonttables[f,42].int;decr(fonttables[f,43].int);
fontptr:=f;g:=f;goto 30{:584}{:570};11:{569:}
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66134);end;sprintcs(u);printchar(61);
printfilename(nom,aire,65624);if s>=0 then begin print(66070);
printscaled(s);print(65683);
end else if s<>-1000 then begin print(66135);printint(-s);end;
if fileopened then print(66136)else if nametoolong then print(66137)else
print(66138);begin helpptr:=5;helpline[4]:=66139;helpline[3]:=66140;
helpline[2]:=66141;helpline[1]:=66142;helpline[0]:=66143;end;error{:569}
;30:if fileopened then bclose(tfmfile);readfontinfo:=g;end;{:568}{589:}
procedure charwarning(f:internalfontnumber;c:eightbits);
var oldsetting:integer;
begin if neweqtbint(1049443)>0 then begin oldsetting:=neweqtbint(1049437
);if(eTeXmode=1)and(neweqtbint(1049443)>1)then setneweqtbint(1049437,1);
begin begindiagnostic;printnl(66157);print(c);print(66158);
slowprint(fonttables[f,10].int);printchar(33);enddiagnostic(false);end;
setneweqtbint(1049437,oldsetting);end;end;{:589}{590:}
function newcharacter(f:internalfontnumber;c:eightbits):halfword;
label 10;var p:halfword;
begin if fonttables[f,12].int<=c then if fonttables[f,13].int>=c then if
(fonttables[f,fonttables[f,34].int-fonttables[f,5].int+c].qqqq.b0>0)then
begin p:=getavail;mem[p].hh.b0:=f;mem[p].hh.b1:=c;newcharacter:=p;
goto 10;end;charwarning(f,c);newcharacter:=0;10:end;{:590}{594:}
function islastocp(llstackno:scaled;counter:integer):integer;
begin activeminptr:=newequiv(524337);activemaxptr:=newequiv(524338);
activereal:=activeminptr;
while(activereal<activemaxptr)and(activeinfo[activereal+1].int<llstackno
)do begin activereal:=activereal+2;end;
while(activereal<activemaxptr)and(activeinfo[activereal+1].int=llstackno
)and(activeinfo[activereal].hh.b1<=counter)do begin activereal:=
activereal+2;end;islastocp:=(activereal=activemaxptr);end;
procedure printactiveocps;var i:integer;begin printnl(66159);
i:=activeminptr;while i<activemaxptr do begin print(40);
printscaled(activeinfo[i+1].int);print(44);
printint(activeinfo[i].hh.b1);print(44);
printesc(newhashtext(1508273+activeinfo[i].hh.b0));print(41);
if i<>(activemaxptr-2)then print(44);i:=i+2;end;print(93);end;
procedure addocpstack(minindex:integer;minvalue:scaled);
var p:ocplstackindex;llstackno:scaled;counter:integer;
begin p:=ocplistinfo[holding[minindex]].hh.b1;
llstackno:=ocplistinfo[holding[minindex]+1].int;counter:=0;
while not(p=0)do begin activeinfo[activemaxptr].hh.b0:=ocplstackinfo[p].
hh.b1;activeinfo[activemaxptr].hh.b1:=counter;
activeinfo[activemaxptr+1].int:=llstackno;p:=ocplstackinfo[p].hh.b0;
activemaxptr:=activemaxptr+2;incr(counter);end;end;
procedure activecompile;var i:integer;minindex:integer;
minstackocp:scaled;oldmin:scaled;maxactive:integer;stackvalue:scaled;
begin activeminptr:=activemaxptr;minstackocp:=ocpmaxint;
maxactive:=newequiv(524336)-1;
for i:=maxactive downto 0 do begin holding[i]:=ocplistlist[newequiv(
524339+i)];stackvalue:=ocplistinfo[holding[i]+1].int;
if stackvalue<minstackocp then begin minindex:=i;
minstackocp:=stackvalue;end;end;
while minstackocp<ocpmaxint do begin addocpstack(minindex,minstackocp);
oldmin:=minstackocp;minstackocp:=ocpmaxint;
for i:=maxactive downto 0 do begin stackvalue:=ocplistinfo[holding[i]+1]
.int;
while oldmin=stackvalue do begin holding[i]:=ocplistinfo[holding[i]].hh.
b0;stackvalue:=ocplistinfo[holding[i]+1].int;end;
if stackvalue<minstackocp then begin minindex:=i;
minstackocp:=stackvalue;end;end;end;end;{:594}{602:}
function readocpinfo(u:halfword;nom,aire,ext:strnumber;
externalocp:boolean):internalocpnumber;label 30,11,45;
var fileopened:boolean;f:internalocpnumber;g:internalocpnumber;
ocpword:integer;ocpmemrunptr:ocpindex;ocplength,realocplength:integer;
previousaddress:ocpindex;tempocpinput:integer;tempocpoutput:integer;
tempocpnotables:integer;tempocpnostates:integer;
i,newoffset,roomfortables,roomforstates:integer;begin g:=0;{604:}
fileopened:=false;if(ocpptr=65535)then{605:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66162);end;sprintcs(u);printchar(61);
printfilename(nom,aire,65624);;print(66144);begin helpptr:=2;
helpline[1]:=66167;helpline[0]:=66166;end;error;goto 30;end{:605};
if externalocp then{606:}begin packfilename(nom,aire,ext);btestin;
if namelength=0 then begin print(66161);print(66168);print(41);println;
goto 11 end;f:=ocpptr+1;allocateocptable(f,13);ocptables[f,0]:=13;
for i:=1 to namelength do begin begin strpool[poolptr]:=nameoffile[i];
incr(poolptr);end;end;ocptables[f,3]:=makestring;scanstringargument;
ocptables[f,4]:=curval;ocptables[f,1]:=65624;ocptables[f,2]:=65624;
ocptables[f,10]:=0;ocptables[f,9]:=0;ocptables[f,5]:=1;
ocptables[f,6]:=1;ocptables[f,11]:=0;ocpptr:=f;g:=f;goto 30;end{:606}
else begin{607:}packfilename(nom,aire,66169);
if not ocpopenin(ocpfile)then begin print(66161);print(66168);print(41);
println;goto 11 end;fileopened:=true{:607};{609:}begin f:=ocpptr+1;
ocpmemrunptr:=11;begin ocpword:=ocptemp;
if ocpword>127 then begin print(66161);print(66170);print(41);println;
goto 11 end;ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;ocplength:=ocpword;
end;realocplength:=ocplength-7;begin ocptemp:=getc(ocpfile);
begin ocpword:=ocptemp;if ocpword>127 then begin print(66161);
print(66170);print(41);println;goto 11 end;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;tempocpinput:=ocpword;end;end;
begin ocptemp:=getc(ocpfile);begin ocpword:=ocptemp;
if ocpword>127 then begin print(66161);print(66170);print(41);println;
goto 11 end;ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
tempocpoutput:=ocpword;end;end;begin ocptemp:=getc(ocpfile);
begin ocpword:=ocptemp;if ocpword>127 then begin print(66161);
print(66170);print(41);println;goto 11 end;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;tempocpnotables:=ocpword;end;end;
begin ocptemp:=getc(ocpfile);begin ocpword:=ocptemp;
if ocpword>127 then begin print(66161);print(66170);print(41);println;
goto 11 end;ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
roomfortables:=ocpword;end;end;begin ocptemp:=getc(ocpfile);
begin ocpword:=ocptemp;if ocpword>127 then begin print(66161);
print(66170);print(41);println;goto 11 end;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;tempocpnostates:=ocpword;end;end;
begin ocptemp:=getc(ocpfile);begin ocpword:=ocptemp;
if ocpword>127 then begin print(66161);print(66170);print(41);println;
goto 11 end;ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
roomforstates:=ocpword;end;end;
if realocplength<>(tempocpnotables+roomfortables+tempocpnostates+
roomforstates)then begin print(66161);print(66171);print(41);println;
goto 11 end;
realocplength:=realocplength+12+tempocpnostates+tempocpnotables;
allocateocptable(f,realocplength);ocptables[f,3]:=0;ocptables[f,4]:=0;
ocptables[f,0]:=realocplength;ocptables[f,5]:=tempocpinput;
ocptables[f,6]:=tempocpoutput;ocptables[f,7]:=tempocpnotables;
ocptables[f,8]:=tempocpnostates;ocptables[f,9]:=ocpmemrunptr;
if ocptables[f,7]<>0 then begin previousaddress:=ocpmemrunptr+2*(
ocptables[f,7]);
for i:=1 to ocptables[f,7]do begin begin ocptables[f,ocpmemrunptr]:=
previousaddress;incr(ocpmemrunptr);end;begin ocptemp:=getc(ocpfile);
begin ocpword:=ocptemp;if ocpword>127 then begin print(66161);
print(66170);print(41);println;goto 11 end;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;newoffset:=ocpword;end;end;
begin ocptables[f,ocpmemrunptr]:=newoffset;incr(ocpmemrunptr);end;
previousaddress:=previousaddress+newoffset;end end;
if roomfortables<>0 then begin for i:=1 to roomfortables do begin begin
begin ocptemp:=getc(ocpfile);begin ocpword:=ocptemp;
if ocpword>127 then begin print(66161);print(66170);print(41);println;
goto 11 end;ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;ocpword:=ocpword;
end;end;begin ocptables[f,ocpmemrunptr]:=ocpword;incr(ocpmemrunptr);end;
end;end end;ocptables[f,10]:=ocpmemrunptr;
if ocptables[f,8]<>0 then begin previousaddress:=ocpmemrunptr+2*(
ocptables[f,8]);
for i:=1 to ocptables[f,8]do begin begin ocptables[f,ocpmemrunptr]:=
previousaddress;incr(ocpmemrunptr);end;begin ocptemp:=getc(ocpfile);
begin ocpword:=ocptemp;if ocpword>127 then begin print(66161);
print(66170);print(41);println;goto 11 end;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;ocptemp:=getc(ocpfile);
ocpword:=ocpword*256+ocptemp;newoffset:=ocpword;end;end;
begin ocptables[f,ocpmemrunptr]:=newoffset;incr(ocpmemrunptr);end;
previousaddress:=previousaddress+newoffset;end;end;
if roomforstates<>0 then begin for i:=1 to roomforstates do begin begin
begin ocptemp:=getc(ocpfile);begin ocpword:=ocptemp;
if ocpword>127 then begin print(66161);print(66170);print(41);println;
goto 11 end;ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;
ocptemp:=getc(ocpfile);ocpword:=ocpword*256+ocptemp;ocpword:=ocpword;
end;end;begin ocptables[f,ocpmemrunptr]:=ocpword;incr(ocpmemrunptr);end;
end;end end;ocpptr:=f;g:=f;goto 30;end{:609};end;ocptables[f,1]:=nom;
ocptables[f,2]:=aire{:604};11:{603:}begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66162);end;sprintcs(u);printchar(61);
printfilename(nom,aire,65624);;
if fileopened then print(66163)else print(66164);begin helpptr:=2;
helpline[1]:=66165;helpline[0]:=66166;end;error{:603};
30:if fileopened then bclose(ocpfile);readocpinfo:=g;end;{:602}{616:}
function makeocplistnode(llstack:ocplstackindex;llstackno:scaled;
llnext:ocplistindex):ocplistindex;var p:ocplistindex;
begin p:=ocplistmemrunptr;ocplistinfo[p].hh.b1:=llstack;
ocplistinfo[p+1].int:=llstackno;ocplistinfo[p].hh.b0:=llnext;
ocplistmemrunptr:=ocplistmemrunptr+2;makeocplistnode:=p;end;
function makeocplstacknode(locp:internalocpnumber;
llnext:ocplstackindex):ocplstackindex;var p:ocplstackindex;
begin p:=ocplstackmemrunptr;ocplstackinfo[p].hh.b1:=locp;
ocplstackinfo[p].hh.b0:=llnext;incr(ocplstackmemrunptr);
makeocplstacknode:=p;end;
function copyocplstack(llstack:ocplstackindex):ocplstackindex;
var result:ocplstackindex;
begin if llstack=0 then result:=0 else result:=makeocplstacknode(
ocplstackinfo[llstack].hh.b1,copyocplstack(ocplstackinfo[llstack].hh.b0)
);copyocplstack:=result;end;
function copyocplist(list:ocplistindex):ocplistindex;
var result:ocplistindex;
begin if ocplistinfo[list+1].int=ocpmaxint then result:=makeocplistnode(
0,ocpmaxint,0)else result:=makeocplistnode(copyocplstack(ocplistinfo[
list].hh.b1),ocplistinfo[list+1].int,copyocplist(ocplistinfo[list].hh.b0
));copyocplist:=result;end;function ocpensurelstack(list:ocplistindex;
llstackno:scaled):ocplistindex;var p:ocplistindex;q:ocplistindex;
begin p:=list;
if ocplistinfo[p+1].int=ocpmaxint then begin ocplistinfo[p+1].int:=
llstackno;ocplistinfo[p].hh.b0:=makeocplistnode(0,ocpmaxint,0);
end else if ocplistinfo[p+1].int>llstackno then begin ocplistinfo[p].hh.
b0:=makeocplistnode(ocplistinfo[p].hh.b1,ocplistinfo[p+1].int,
ocplistinfo[p].hh.b0);ocplistinfo[p].hh.b1:=0;
ocplistinfo[p+1].int:=llstackno;end else begin q:=ocplistinfo[p].hh.b0;
while(not(ocplistinfo[q+1].int=ocpmaxint))and ocplistinfo[q+1].int<=
llstackno do begin p:=q;q:=ocplistinfo[q].hh.b0;end;
if ocplistinfo[p+1].int<llstackno then begin ocplistinfo[p].hh.b0:=
makeocplistnode(0,llstackno,q);p:=ocplistinfo[p].hh.b0;end;end;
ocpensurelstack:=p;end;procedure ocpapplyadd(listentry:ocplistindex;
lbefore:boolean;locp:internalocpnumber);var p:ocplstackindex;
q:ocplstackindex;begin p:=ocplistinfo[listentry].hh.b1;
if lbefore or(p=0)then begin ocplistinfo[listentry].hh.b1:=
makeocplstacknode(locp,p);end else begin q:=ocplstackinfo[p].hh.b0;
while q<>0 do begin p:=q;q:=ocplstackinfo[q].hh.b0;end;
ocplstackinfo[p].hh.b0:=makeocplstacknode(locp,0);end;end;
procedure ocpapplyremove(listentry:ocplistindex;lbefore:boolean);
var p:ocplstackindex;q:ocplstackindex;r:ocplstackindex;
begin p:=ocplistinfo[listentry].hh.b1;
if p=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66175);end;println end else begin q:=ocplstackinfo[p].hh.b0;
if lbefore or(q=0)then ocplistinfo[listentry].hh.b1:=q else begin r:=
ocplstackinfo[q].hh.b0;while r<>0 do begin p:=q;q:=r;
r:=ocplstackinfo[r].hh.b0;end;ocplstackinfo[p].hh.b0:=0;end end;end;
procedure scanscaled;label 30,31,32,40,45,88;var negative:boolean;
f:integer;k,kk:smallnumber;p,q:halfword;begin f:=0;aritherror:=false;
negative:=false;{448:}negative:=false;repeat{412:}repeat getxtoken;
until curcmd<>10{:412};
if curtok=786477 then begin negative:=not negative;curtok:=786475;end;
until curtok<>786475{:448};backinput;
if curtok=786476 then curtok:=786478;
if curtok<>786478 then scanint else begin radix:=10;curval:=0;end;
if curtok=786476 then curtok:=786478;
if(radix=10)and(curtok=786478)then{459:}begin k:=0;p:=0;gettoken;
while true do begin getxtoken;
if(curtok>786489)or(curtok<786480)then goto 31;
if k<17 then begin q:=getavail;mem[q].hh.rh:=p;
mem[q].hh.lh:=curtok-786480;p:=q;incr(k);end;end;
31:for kk:=k downto 1 do begin dig[kk-1]:=mem[p].hh.lh;q:=p;
p:=mem[p].hh.rh;begin mem[q].hh.rh:=avail;avail:=q;
ifdef('STAT')decr(dynused);endif('STAT')end;end;f:=rounddecimals(k);
if curcmd<>10 then backinput;end{:459};
if curval<0 then begin negative:=not negative;curval:=-curval;end;
if curval>16384 then aritherror:=true else curval:=curval*65536+f;
if aritherror or(abs(curval)>=1073741824)then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66176);end;end;if negative then curval:=-curval;end;
procedure printocplstack(lstackentry:ocplstackindex);
var p:ocplstackindex;begin p:=lstackentry;
while(p<>0)do begin printesc(newhashtext(1508273+ocplstackinfo[p].hh.b1)
);p:=ocplstackinfo[p].hh.b0;if(p<>0)then print(44);end;end;
procedure printocplist(listentry:ocplistindex);var p:ocplistindex;
begin print(91);p:=listentry;
while not(ocplistinfo[p+1].int=ocpmaxint)do begin print(40);
printscaled(ocplistinfo[p+1].int);print(66177);
printocplstack(ocplistinfo[p].hh.b1);print(41);p:=ocplistinfo[p].hh.b0;
if not(ocplistinfo[p+1].int=ocpmaxint)then print(66178);end;print(93);
end;function scanocplist:ocplistindex;var llstackno:scaled;
lop:quarterword;lstackentry:ocplistindex;otherlist:ocplistindex;
ocpident:internalocpnumber;result:ocplistindex;begin getrtoken;
if curcmd=109 then result:=copyocplist(ocplistlist[curchr])else if
curcmd<>114 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66179);end;begin helpptr:=1;helpline[0]:=66180;end;
result:=makeocplistnode(0,ocpmaxint,0);end else begin lop:=curchr;
scanscaled;llstackno:=curval;
if(llstackno<=0)or(llstackno>=ocpmaxint)then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66181);end;result:=makeocplistnode(0,ocpmaxint,0);
end else begin if lop<=2 then begin scanocpident;ocpident:=curval;end;
otherlist:=scanocplist;
lstackentry:=ocpensurelstack(otherlist,llstackno);
if lop<=2 then ocpapplyadd(lstackentry,(lop=1),ocpident)else
ocpapplyremove(lstackentry,(lop=3));result:=otherlist;end;end;
scanocplist:=result;end;function readocplist:internalocplistnumber;
var f:internalocplistnumber;g:internalocplistnumber;begin g:=0;
f:=ocplistptr+1;ocplistmemrunptr:=ocplistmemptr;
ocplstackmemrunptr:=ocplstackmemptr;ocplistlist[f]:=scanocplist;
ocplistptr:=f;ocplistmemptr:=ocplistmemrunptr;
ocplstackmemptr:=ocplstackmemrunptr;g:=f;readocplist:=g;end;
procedure scanocplistident;var f:internalocplistnumber;begin{412:}
repeat getxtoken;until curcmd<>10{:412};
if curcmd=109 then f:=curchr else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66182);end;begin helpptr:=2;helpline[1]:=66150;helpline[0]:=66183;
end;backerror;f:=0;end;curval:=f;end;{:616}{632:}procedure dviswap;
begin if dviptr>(2147483647-dvioffset)then begin curs:=-2;
fatalerror(66184);end;
if dvilimit=dvibufsize then begin writedvi(0,halfbuf-1);
dvilimit:=halfbuf;dvioffset:=dvioffset+dvibufsize;dviptr:=0;
end else begin writedvi(halfbuf,dvibufsize-1);dvilimit:=dvibufsize;end;
dvigone:=dvigone+halfbuf;end;{:632}{634:}procedure dvifour(x:integer);
begin if x>=0 then begin dvibuf[dviptr]:=x div 16777216;incr(dviptr);
if dviptr=dvilimit then dviswap;end else begin x:=x+1073741824;
x:=x+1073741824;begin dvibuf[dviptr]:=(x div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;x:=x mod 16777216;
begin dvibuf[dviptr]:=x div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;x:=x mod 65536;
begin dvibuf[dviptr]:=x div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=x mod 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;end;{:634}{635:}
procedure dvipop(l:integer);
begin if(l=dvioffset+dviptr)and(dviptr>0)then decr(dviptr)else begin
dvibuf[dviptr]:=142;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end;{:635}{636:}procedure dvifontdef(f:internalfontnumber);
var k:poolpointer;begin oval:=f-1;ocmd:=243;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;
begin dvibuf[dviptr]:=fonttables[f,1].int;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=fonttables[f,2].int;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=fonttables[f,3].int;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=fonttables[f,4].int;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(fonttables[f,6].int);
dvifour(fonttables[f,7].int);
begin dvibuf[dviptr]:=length(fonttables[f,11].int);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=length(fonttables[f,10].int);incr(dviptr);
if dviptr=dvilimit then dviswap;end;{637:}
for k:=strstartar[fonttables[f,11].int-65536]to strstartar[fonttables[f,
11].int-65535]-1 do begin dvibuf[dviptr]:=strpool[k];incr(dviptr);
if dviptr=dvilimit then dviswap;end;
for k:=strstartar[fonttables[f,10].int-65536]to strstartar[fonttables[f,
10].int-65535]-1 do begin dvibuf[dviptr]:=strpool[k];incr(dviptr);
if dviptr=dvilimit then dviswap;end{:637};end;{:636}{641:}
procedure movement(w:scaled;o:eightbits);label 10,40,45,2,1;
var mstate:smallnumber;p,q:halfword;k:integer;
begin case(dvidirection div 4)of 0:begin end;
1:begin if o=143 then w:=-w;end;
2:begin if o=143 then o:=157 else o:=143;end;
3:begin if o=143 then begin o:=157;w:=-w;end else o:=143;end;
4:begin if o=157 then w:=-w;end;5:begin w:=-w;end;
6:begin if o=143 then o:=157 else begin o:=143;w:=-w;end;end;
7:begin if o=143 then o:=157 else o:=143;w:=-w;end;end;
if false then begin q:=getnode(3);mem[q+1].int:=w;
mem[q+2].int:=dvioffset+dviptr;
if o=157 then begin mem[q].hh.rh:=downptr;downptr:=q;
end else begin mem[q].hh.rh:=rightptr;rightptr:=q;end;{645:}
p:=mem[q].hh.rh;mstate:=0;
while p<>0 do begin if mem[p+1].int=w then{646:}
case mstate+mem[p].hh.lh of 3,4,15,16:if mem[p+2].int<dvigone then goto
45 else{647:}begin k:=mem[p+2].int-dvioffset;
if k<0 then k:=k+dvibufsize;dvibuf[k]:=dvibuf[k]+5;mem[p].hh.lh:=1;
goto 40;end{:647};5,9,11:if mem[p+2].int<dvigone then goto 45 else{648:}
begin k:=mem[p+2].int-dvioffset;if k<0 then k:=k+dvibufsize;
dvibuf[k]:=dvibuf[k]+10;mem[p].hh.lh:=2;goto 40;end{:648};
1,2,8,13:goto 40;others:end{:646}
else case mstate+mem[p].hh.lh of 1:mstate:=6;2:mstate:=12;8,13:goto 45;
others:end;p:=mem[p].hh.rh;end;45:{:645};end;{644:}
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
if dviptr=dvilimit then dviswap;end;goto 10{:644};40:{643:}
mem[q].hh.lh:=mem[p].hh.lh;
if mem[q].hh.lh=1 then begin begin dvibuf[dviptr]:=o+4;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
while mem[q].hh.rh<>p do begin q:=mem[q].hh.rh;
case mem[q].hh.lh of 3:mem[q].hh.lh:=5;4:mem[q].hh.lh:=6;others:end;end;
end else begin begin dvibuf[dviptr]:=o+9;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
while mem[q].hh.rh<>p do begin q:=mem[q].hh.rh;
case mem[q].hh.lh of 3:mem[q].hh.lh:=4;5:mem[q].hh.lh:=6;others:end;end;
end{:643};10:end;{:641}{649:}procedure prunemovements(l:integer);
label 30,10;var p:halfword;
begin while downptr<>0 do begin if mem[downptr+2].int<l then goto 30;
p:=downptr;downptr:=mem[p].hh.rh;freenode(p,3);end;
30:while rightptr<>0 do begin if mem[rightptr+2].int<l then goto 10;
p:=rightptr;rightptr:=mem[p].hh.rh;freenode(p,3);end;10:end;{:649}{652:}
procedure vlistout;forward;{:652}{653:}{1410:}
procedure specialout(p:halfword);var oldsetting:0..21;k:poolpointer;
h:halfword;q,r:halfword;oldmode:integer;
begin if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
oldsetting:=selector;if mem[p].hh.b1=4 then begin{1413:}q:=getavail;
mem[q].hh.lh:=131197;r:=getavail;mem[q].hh.rh:=r;mem[r].hh.lh:=1245193;
begintokenlist(q,4);begintokenlist(mem[p+1].hh.rh,16);q:=getavail;
mem[q].hh.lh:=65659;begintokenlist(q,4);oldmode:=curlist.modefield;
curlist.modefield:=0;curcs:=writeloc;q:=scantoks(false,true);gettoken;
if curtok<>1245193 then{1414:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66694);end;begin helpptr:=2;helpline[1]:=66695;helpline[0]:=66372;
end;error;repeat gettoken;until curtok=1245193;end{:1414};
curlist.modefield:=oldmode;endtokenlist{:1413};h:=defref;
end else h:=mem[p+1].hh.rh;selector:=21;
showtokenlist(mem[h].hh.rh,0,poolsize-poolptr);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(65543,poolsize-initpoolptr);
end;
if(poolptr-strstartar[strptr-65536])<256 then begin begin dvibuf[dviptr]
:=239;incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(poolptr-strstartar[strptr-65536]);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=242;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
dvifour((poolptr-strstartar[strptr-65536]));end;
for k:=strstartar[strptr-65536]to poolptr-1 do begin dvibuf[dviptr]:=
strpool[k];incr(dviptr);if dviptr=dvilimit then dviswap;end;
poolptr:=strstartar[strptr-65536];
if mem[p].hh.b1=4 then flushlist(defref);end;{:1410}{1412:}
procedure writeout(p:halfword);var oldsetting:0..21;oldmode:integer;
j:smallnumber;q,r:halfword;d:integer;clobbered:boolean;
runsystemret:integer;begin{1413:}q:=getavail;mem[q].hh.lh:=131197;
r:=getavail;mem[q].hh.rh:=r;mem[r].hh.lh:=1245193;begintokenlist(q,4);
begintokenlist(mem[p+1].hh.rh,16);q:=getavail;mem[q].hh.lh:=65659;
begintokenlist(q,4);oldmode:=curlist.modefield;curlist.modefield:=0;
curcs:=writeloc;q:=scantoks(false,true);gettoken;
if curtok<>1245193 then{1414:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66694);end;begin helpptr:=2;helpline[1]:=66695;helpline[0]:=66372;
end;error;repeat gettoken;until curtok=1245193;end{:1414};
curlist.modefield:=oldmode;endtokenlist{:1413};oldsetting:=selector;
j:=mem[p+1].hh.lh;
if j=18 then selector:=21 else if writeopen[j]then selector:=j else
begin if(j=17)and(selector=19)then selector:=18;printnl(65624);end;
tokenshow(defref);println;flushlist(defref);
if j=18 then begin if(neweqtbint(1049437)<=0)then selector:=18 else
selector:=19;if not logopened then selector:=17;printnl(66686);
for d:=0 to(poolptr-strstartar[strptr-65536])-1 do begin print(strpool[
strstartar[strptr-65536]+d]);end;print(66687);
if shellenabledp then begin begin if poolptr+1>poolsize then overflow(
65543,poolsize-initpoolptr);end;begin strpool[poolptr]:=0;incr(poolptr);
end;clobbered:=false;
for d:=0 to(poolptr-strstartar[strptr-65536])-1 do begin strpool[
strstartar[strptr-65536]+d]:=xchr[strpool[strstartar[strptr-65536]+d]];
if(strpool[strstartar[strptr-65536]+d]=0)and(d<(poolptr-strstartar[
strptr-65536])-1)then clobbered:=true;end;
if clobbered then print(66688)else begin for d:=0 to(poolptr-strstartar[
strptr-65536])-1 do begin outsidestringarray[d]:=xchr[strpool[strstartar
[strptr-65536]+d]];end;
outsidestringarray[(poolptr-strstartar[strptr-65536])]:=0;
runsystemret:=runsystem(stringcast(outsidestringarray));
if runsystemret=-1 then print(66689)else if runsystemret=0 then print(
66690)else if runsystemret=1 then print(66691)else if runsystemret=2
then print(66692)end;end else begin print(66693);end;printchar(46);
printnl(65624);println;poolptr:=strstartar[strptr-65536];end;
selector:=oldsetting;end;{:1412}{1415:}procedure outwhat(p:halfword);
var j:smallnumber;oldsetting:0..21;
begin case mem[p].hh.b1 of 0,1,2:{1416:}
if not doingleaders then begin j:=mem[p+1].hh.lh;
if mem[p].hh.b1=1 then writeout(p)else begin if writeopen[j]then begin
aclose(writefile[j]);writeopen[j]:=false;end;
if mem[p].hh.b1=2 then else if j<16 then begin curname:=mem[p+1].hh.rh;
curarea:=mem[p+2].hh.lh;curext:=mem[p+2].hh.rh;
if curext=65624 then curext:=66119;packfilename(curname,curarea,curext);
while not kpseoutnameok(nameoffile+1)or not aopenout(writefile[j])do
promptfilename(66697,66119);writeopen[j]:=true;
if logopened and texmfyesno('log_openout')then begin oldsetting:=
selector;if(neweqtbint(1049437)<=0)then selector:=18 else selector:=19;
printnl(66698);printint(j);print(66699);
printfilename(curname,curarea,curext);print(66118);printnl(65624);
println;selector:=oldsetting;end;end;end;end{:1416};3,4:specialout(p);
5:;6:;others:confusion(66696)end;end;{:1415}procedure hlistout;
label 21,13,14,15;var baseline:scaled;cwd,cht,cdp:scaled;
chtdp:quarterword;cinfo:fourquarters;edgev:scaled;edgeh:scaled;
effectivehorizontal:scaled;basepointhorizontal:scaled;
basepointvertical:scaled;savingh:scaled;savingv:scaled;
savedirection:integer;dirtmp,dirptr:halfword;
dvidirh,dvidirptr,dvitempptr:integer;leftedge:scaled;saveh,savev:scaled;
thisbox:halfword;gorder:glueord;gsign:0..2;p:halfword;saveloc:integer;
leaderbox:halfword;leaderwd:scaled;lx:scaled;outerdoingleaders:boolean;
edge:scaled;gluetemp:real;curglue:real;curg:scaled;begin curg:=0;
curglue:=0.0;thisbox:=tempptr;gorder:=mem[thisbox+5].hh.b1;
gsign:=mem[thisbox+5].hh.b0;p:=mem[thisbox+5].hh.rh;
savedirection:=dvidirection;dvidirection:=mem[thisbox+7].int;{1446:}
begin dirptr:=0;begin dirtmp:=newdir(dvidirection);
mem[dirtmp].hh.rh:=dirptr;dirptr:=dirtmp;dirptr:=dirtmp;end;
mem[dirptr+2].hh.lh:=dviptr;end{:1446};savingh:=dvih;savingv:=dviv;
incr(curs);if curs>0 then begin dvibuf[dviptr]:=141;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if curs>maxpush then maxpush:=curs;
saveloc:=dvioffset+dviptr;baseline:=curv;leftedge:=curh;
while p<>0 do{654:}
21:if(p>=himemmin)then begin if curh<>dvih then begin movement(curh-dvih
,143);dvih:=curh;end;if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;repeat f:=mem[p].hh.b0;c:=mem[p].hh.b1;
if f<>dvif then{655:}
begin if not fonttables[f,15].int then begin dvifontdef(f);
fonttables[f,15].int:=true;end;oval:=f-1;ocmd:=235;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;dvif:=f;end{:655};
cinfo:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+c].qqqq;
chtdp:=cinfo.b1;
if((dirsecondary[dvidirection])mod 2)=((dirtertiary[dvidirection])mod 2)
then begin cht:=fonttables[f,fonttables[f,36].int+cinfo.b0].int div 2;
cwd:=fonttables[f,fonttables[f,37].int+(chtdp)div 256].int+fonttables[f,
fonttables[f,38].int+(chtdp)mod 256].int;
end else begin cht:=fonttables[f,fonttables[f,37].int+(chtdp)div 256].
int;cdp:=fonttables[f,fonttables[f,38].int+(chtdp)mod 256].int;
cwd:=fonttables[f,fonttables[f,36].int+cinfo.b0].int;end;curh:=curh+cwd;
if(fonttables[f,21].int<>-1)then case(dvidirection mod 16)of 0,2:begin
oval:=c-fonttables[f,5].int;ocmd:=128;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;end;
4,6:begin oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-cwd);;end;
9,11:begin oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cwd);;end;
13,15:begin oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-cwd);;end;
1,3:begin oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cwd);;end;
5,7:begin oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-cwd);;end;
8,10:begin oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cwd);;end;
12,14:begin oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-cwd);;end;
end else case(dvidirection mod 16)of 0:begin oval:=c-fonttables[f,5].int
;ocmd:=128;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;end;
2:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(cht);;
oval:=c-fonttables[f,5].int;ocmd:=128;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-cht);;end;
4:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-cwd);;
oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;end;
6:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-cwd);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(cht);;oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-cht);;end;
9:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(cwd);;
begin dvibuf[dviptr]:=146;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-cht);;oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cht);;end;
11:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(cwd);;
begin dvibuf[dviptr]:=146;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-cdp);;oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cdp);;end;
13:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-cht);;
oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cht);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-cwd);;end;15:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-cdp);;
oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cdp);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-cwd);;end;1,3:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(cht);;
oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-cht);;
begin dvibuf[dviptr]:=146;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(cwd);;end;5,7:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-cwd);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(cht);;oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-cht);;end;
8,10:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(cwd);;
begin dvibuf[dviptr]:=146;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-cht);;oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cht);;end;
12,14:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-cht);;
oval:=c-fonttables[f,5].int;ocmd:=133;
begin if(oval<256)and(oval>=0)then begin if(ocmd<>128)or(oval>127)then
if(ocmd=235)and(oval<64)then oval:=oval+171 else begin begin dvibuf[
dviptr]:=ocmd;incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
end else begin if(oval<65536)and(oval>=0)then begin begin dvibuf[dviptr]
:=ocmd+1;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin if(oval<16777216)and(oval>=0)then begin begin dvibuf[
dviptr]:=ocmd+2;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin begin dvibuf[dviptr]:=ocmd+3;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;
if oval>=0 then begin begin dvibuf[dviptr]:=oval div 16777216;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oval:=oval+1073741824;oval:=oval+1073741824;
begin begin dvibuf[dviptr]:=(oval div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 16777216;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 65536;end;
begin begin dvibuf[dviptr]:=oval div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;oval:=oval mod 256;end;
begin begin dvibuf[dviptr]:=oval;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end end;begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(cht);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-cwd);;end;end;p:=mem[p].hh.rh;until not(p>=himemmin);
dvih:=curh;end else{656:}begin case mem[p].hh.b0 of 0,1:{657:}
begin if not(((dirprimary[mem[p+7].int])mod 2)<>(dirprimary[dvidirection
]mod 2))then begin effectivehorizontal:=mem[p+1].int;
basepointvertical:=0;
if(((dirsecondary[mem[p+7].int])+2)mod 4)=((dirsecondary[dvidirection])
mod 4)then basepointhorizontal:=mem[p+1].int else basepointhorizontal:=0
;end else begin effectivehorizontal:=mem[p+3].int+mem[p+2].int;
if not((((dirprimary[mem[p+7].int])+2)mod 4)=((dirtertiary[mem[p+7].int]
)mod 4))then if(dirprimary[mem[p+7].int])=(dirsecondary[dvidirection])
then basepointhorizontal:=mem[p+3].int else basepointhorizontal:=mem[p+2
].int else if(dirprimary[mem[p+7].int])=(dirsecondary[dvidirection])then
basepointhorizontal:=mem[p+2].int else basepointhorizontal:=mem[p+3].int
;if(dirsecondary[mem[p+7].int])=(dirprimary[dvidirection])then
basepointvertical:=-(mem[p+1].int div 2)else basepointvertical:=(mem[p+1
].int div 2);end;
if not((((dirprimary[dvidirection])+2)mod 4)=((dirtertiary[dvidirection]
)mod 4))then basepointvertical:=basepointvertical+mem[p+4].int else
basepointvertical:=basepointvertical-mem[p+4].int;
if mem[p+5].hh.rh=0 then curh:=curh+effectivehorizontal else begin
tempptr:=p;edge:=curh;curh:=curh+basepointhorizontal;edgev:=curv;
curv:=baseline+basepointvertical;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
saveh:=dvih;savev:=dviv;if mem[p].hh.b0=1 then vlistout else hlistout;
dvih:=saveh;dviv:=savev;curh:=edge+effectivehorizontal;curv:=baseline;
end end{:657};
2:begin if not(((dirprimary[mem[p+4].hh.lh])mod 2)<>(dirprimary[
dvidirection]mod 2))then begin ruleht:=mem[p+3].int;
ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;
end else begin ruleht:=mem[p+1].int div 2;ruledp:=mem[p+1].int div 2;
rulewd:=mem[p+3].int+mem[p+2].int;end;goto 14;end;8:{1409:}
if mem[p].hh.b1<>7 then outwhat(p)else{1449:}
begin if mem[p+1].hh.lh>=0 then begin if curh<>dvih then begin movement(
curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dirtmp:=getnode(4);mem[dirtmp].hh.b0:=8;mem[dirtmp].hh.b1:=7;
mem[dirtmp+1].hh.lh:=mem[p+1].hh.lh;mem[dirtmp+1].hh.rh:=mem[p+1].hh.rh;
mem[dirtmp+3].hh.lh:=mem[p+3].hh.lh;mem[dirtmp+2].hh.lh:=mem[p+2].hh.lh;
mem[dirtmp].hh.rh:=dirptr;dirptr:=dirtmp;end;
if(((dirsecondary[mem[dirptr+1].hh.lh])+2)mod 4)=((dirsecondary[
dvidirection])mod 4)then begin if(dirsecondary[dvidirection]=0)or(
dirsecondary[dvidirection]=2)then begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;
end else begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;mem[dirptr+2].hh.lh:=dviptr;
mem[dirptr+3].hh.lh:=dvih;dvifour(0);curh:=0;dvih:=0;
end else begin mem[dirptr+2].hh.lh:=dviptr;mem[dirptr+3].hh.lh:=dvih;
end;dvidirection:=mem[dirptr+1].hh.lh;
end else begin dvidirh:=mem[dirptr+3].hh.lh;
dvidirptr:=mem[dirptr+2].hh.lh;begin dirtmp:=dirptr;
dirptr:=mem[dirtmp].hh.rh;freenode(dirtmp,4);end;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
dvidirection:=mem[dirptr+1].hh.lh;
if(((dirsecondary[mem[p+1].hh.lh+64])+2)mod 4)=((dirsecondary[
dvidirection])mod 4)then begin dvitempptr:=dviptr;dviptr:=dvidirptr;
if(dirsecondary[dvidirection]=0)or(dirsecondary[dvidirection]=1)then
dvifour(dvih)else dvifour(-dvih);dviptr:=dvitempptr;
if(dirsecondary[dvidirection]=0)or(dirsecondary[dvidirection]=2)then
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end else begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
if(dirsecondary[dvidirection]=0)or(dirsecondary[dvidirection]=1)then
dvifour(dvih)else dvifour(-dvih);end;curh:=dvidirh+dvih;dvih:=curh;
end end{:1449}{:1409};10:{659:}begin g:=mem[p+1].hh.lh;
rulewd:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;rulewd:=rulewd+curg;if mem[p].hh.b1>=100 then{660:}
begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=2 then begin ruleht:=mem[leaderbox+3].int;
ruledp:=mem[leaderbox+2].int;goto 14;end;
if not(((dirprimary[mem[leaderbox+7].int])mod 2)<>(dirprimary[
dvidirection]mod 2))then leaderwd:=mem[leaderbox+1].int else leaderwd:=
mem[leaderbox+3].int+mem[leaderbox+2].int;
if(leaderwd>0)and(rulewd>0)then begin rulewd:=rulewd+10;
edge:=curh+rulewd;lx:=0;{661:}
if mem[p].hh.b1=100 then begin saveh:=curh;
curh:=leftedge+leaderwd*((curh-leftedge)div leaderwd);
if curh<saveh then curh:=curh+leaderwd;
end else begin lq:=rulewd div leaderwd;lr:=rulewd mod leaderwd;
if mem[p].hh.b1=101 then curh:=curh+(lr div 2)else begin lx:=lr div(lq+1
);curh:=curh+((lr-(lq-1)*lx)div 2);end;end{:661};
while curh+leaderwd<=edge do{662:}
begin if not(((dirprimary[mem[leaderbox+7].int])mod 2)<>(dirprimary[
dvidirection]mod 2))then begin basepointvertical:=0;
if(((dirsecondary[mem[leaderbox+7].int])+2)mod 4)=((dirsecondary[
dvidirection])mod 4)then basepointhorizontal:=mem[leaderbox+1].int else
basepointhorizontal:=0;
end else begin if not((((dirprimary[mem[leaderbox+7].int])+2)mod 4)=((
dirtertiary[mem[leaderbox+7].int])mod 4))then if(dirprimary[mem[
leaderbox+7].int])=(dirsecondary[dvidirection])then basepointhorizontal
:=mem[leaderbox+3].int else basepointhorizontal:=mem[leaderbox+2].int
else if(dirprimary[mem[leaderbox+7].int])=(dirsecondary[dvidirection])
then basepointhorizontal:=mem[leaderbox+2].int else basepointhorizontal
:=mem[leaderbox+3].int;
if(dirsecondary[mem[leaderbox+7].int])=(dirprimary[dvidirection])then
basepointvertical:=-(mem[leaderbox+1].int div 2)else basepointvertical:=
(mem[leaderbox+1].int div 2);end;
if not((((dirprimary[dvidirection])+2)mod 4)=((dirtertiary[dvidirection]
)mod 4))then basepointvertical:=basepointvertical+mem[leaderbox+4].int
else basepointvertical:=basepointvertical-mem[leaderbox+4].int;
tempptr:=leaderbox;edgeh:=curh;curh:=curh+basepointhorizontal;
edgev:=curv;curv:=baseline+basepointvertical;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
saveh:=dvih;savev:=dviv;outerdoingleaders:=doingleaders;
doingleaders:=true;
if mem[leaderbox].hh.b0=1 then vlistout else hlistout;
doingleaders:=outerdoingleaders;dvih:=saveh;dviv:=savev;
curh:=edgeh+leaderwd+lx;curv:=baseline;end{:662};curh:=edge-10;goto 15;
end;end{:660};goto 13;end{:659};11,9:curh:=curh+mem[p+1].int;6:{686:}
begin mem[memtop-12]:=mem[p+1];mem[memtop-12].hh.rh:=mem[p].hh.rh;
p:=memtop-12;goto 21;end{:686};others:end;goto 15;14:{658:}
if(ruleht=-1073741824)then ruleht:=mem[thisbox+3].int;
if(ruledp=-1073741824)then ruledp:=mem[thisbox+2].int;
ruleht:=ruleht+ruledp;
if(ruleht>0)and(rulewd>0)then begin if curh<>dvih then begin movement(
curh-dvih,143);dvih:=curh;end;curv:=baseline+ruledp;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
case(dvidirection mod 16)of 0:begin begin dvibuf[dviptr]:=132;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(ruleht);
dvifour(rulewd);end;2:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(ruleht);;
begin dvibuf[dviptr]:=132;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-ruleht);;end;
4:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-rulewd);;
begin dvibuf[dviptr]:=137;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);end;
6:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-rulewd);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);;begin dvibuf[dviptr]:=137;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(ruleht);dvifour(rulewd);
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-ruleht);;end;9:begin begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(rulewd);;
begin dvibuf[dviptr]:=146;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-ruleht);;begin dvibuf[dviptr]:=132;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(rulewd);dvifour(ruleht);end;
11:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(rulewd);;
begin dvibuf[dviptr]:=137;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(rulewd);dvifour(ruleht);end;
13:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-ruleht);;
begin dvibuf[dviptr]:=132;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(rulewd);dvifour(ruleht);begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-rulewd);;end;
15:begin begin dvibuf[dviptr]:=137;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(rulewd);dvifour(ruleht);
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-rulewd);;end;end;curv:=baseline;dvih:=dvih+rulewd;end{:658}
;13:curh:=curh+rulewd;15:p:=mem[p].hh.rh;end{:656}{:654};curh:=savingh;
curv:=savingv;if curh<>dvih then begin movement(curh-dvih,143);
dvih:=curh;end;if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;prunemovements(saveloc);if curs>0 then dvipop(saveloc);
decr(curs);dvidirection:=savedirection;{1438:}
begin while dirptr<>0 do begin dirtmp:=dirptr;dirptr:=mem[dirtmp].hh.rh;
freenode(dirtmp,4);end end{:1438};end;{:653}{663:}procedure vlistout;
label 13,14,15;var leftedge:scaled;topedge:scaled;saveh,savev:scaled;
thisbox:halfword;gorder:glueord;gsign:0..2;p:halfword;saveloc:integer;
leaderbox:halfword;leaderht:scaled;lx:scaled;outerdoingleaders:boolean;
edge:scaled;gluetemp:real;curglue:real;curg:scaled;
savedirection:integer;effectivevertical:scaled;
basepointhorizontal:scaled;basepointvertical:scaled;edgev:scaled;
savingv:scaled;savingh:scaled;begin curg:=0;curglue:=0.0;
thisbox:=tempptr;gorder:=mem[thisbox+5].hh.b1;
gsign:=mem[thisbox+5].hh.b0;p:=mem[thisbox+5].hh.rh;savingv:=dviv;
savingh:=dvih;savedirection:=dvidirection;
dvidirection:=mem[thisbox+7].int;incr(curs);
if curs>0 then begin dvibuf[dviptr]:=141;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if curs>maxpush then maxpush:=curs;
saveloc:=dvioffset+dviptr;leftedge:=curh;curv:=curv-mem[thisbox+3].int;
topedge:=curv;while p<>0 do{664:}
begin if(p>=himemmin)then confusion(66186)else{665:}
begin case mem[p].hh.b0 of 0,1:{666:}
begin if not(((dirprimary[mem[p+7].int])mod 2)<>(dirprimary[dvidirection
]mod 2))then begin effectivevertical:=mem[p+3].int+mem[p+2].int;
if(mem[p].hh.b0=0)and((((dirprimary[mem[p+7].int])+2)mod 4)=((
dirtertiary[mem[p+7].int])mod 4))then basepointvertical:=mem[p+2].int
else basepointvertical:=mem[p+3].int;
if(((dirsecondary[mem[p+7].int])+2)mod 4)=((dirsecondary[dvidirection])
mod 4)then basepointhorizontal:=mem[p+1].int else basepointhorizontal:=0
;end else begin effectivevertical:=mem[p+1].int;
if not((((dirprimary[mem[p+7].int])+2)mod 4)=((dirtertiary[mem[p+7].int]
)mod 4))then if(dirprimary[mem[p+7].int])=(dirsecondary[dvidirection])
then basepointhorizontal:=mem[p+3].int else basepointhorizontal:=mem[p+2
].int else if(dirprimary[mem[p+7].int])=(dirsecondary[dvidirection])then
basepointhorizontal:=mem[p+2].int else basepointhorizontal:=mem[p+3].int
;if(dirsecondary[mem[p+7].int])=(dirprimary[dvidirection])then
basepointvertical:=0 else basepointvertical:=mem[p+1].int;end;
basepointhorizontal:=basepointhorizontal+mem[p+4].int;
if mem[p+5].hh.rh=0 then begin curv:=curv+effectivevertical;
end else begin if curh<>dvih then begin movement(curh-dvih,143);
dvih:=curh;end;if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;edgev:=curv;curh:=leftedge+basepointhorizontal;
curv:=curv+basepointvertical;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
saveh:=dvih;savev:=dviv;tempptr:=p;
if mem[p].hh.b0=1 then vlistout else hlistout;dvih:=saveh;dviv:=savev;
curh:=leftedge;curv:=edgev+effectivevertical;end end{:666};
2:begin if not(((dirprimary[mem[p+4].hh.lh])mod 2)<>(dirprimary[
dvidirection]mod 2))then begin ruleht:=mem[p+3].int;
ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;
end else begin ruleht:=mem[p+1].int div 2;ruledp:=mem[p+1].int div 2;
rulewd:=mem[p+3].int+mem[p+2].int;end;goto 14;end;8:{1408:}
outwhat(p){:1408};10:{668:}begin g:=mem[p+1].hh.lh;
ruleht:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;ruleht:=ruleht+curg;if mem[p].hh.b1>=100 then{669:}
begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=2 then begin rulewd:=mem[leaderbox+1].int;
ruledp:=0;goto 14;end;
if not(((dirprimary[mem[leaderbox+7].int])mod 2)<>(dirprimary[
dvidirection]mod 2))then leaderht:=mem[leaderbox+3].int+mem[leaderbox+2]
.int else leaderht:=mem[leaderbox+1].int;
if(leaderht>0)and(ruleht>0)then begin ruleht:=ruleht+10;
edge:=curv+ruleht;lx:=0;{670:}
if mem[p].hh.b1=100 then begin savev:=curv;
curv:=topedge+leaderht*((curv-topedge)div leaderht);
if curv<savev then curv:=curv+leaderht;
end else begin lq:=ruleht div leaderht;lr:=ruleht mod leaderht;
if mem[p].hh.b1=101 then curv:=curv+(lr div 2)else begin lx:=lr div(lq+1
);curv:=curv+((lr-(lq-1)*lx)div 2);end;end{:670};
while curv+leaderht<=edge do{671:}
begin if not(((dirprimary[mem[leaderbox+7].int])mod 2)<>(dirprimary[
dvidirection]mod 2))then begin effectivevertical:=mem[leaderbox+3].int+
mem[leaderbox+2].int;
if(mem[leaderbox].hh.b0=0)and((((dirprimary[mem[leaderbox+7].int])+2)mod
4)=((dirtertiary[mem[leaderbox+7].int])mod 4))then basepointvertical:=
mem[leaderbox+2].int else basepointvertical:=mem[leaderbox+3].int;
if(((dirsecondary[mem[leaderbox+7].int])+2)mod 4)=((dirsecondary[
dvidirection])mod 4)then basepointhorizontal:=mem[leaderbox+1].int else
basepointhorizontal:=0;
end else begin effectivevertical:=mem[leaderbox+1].int;
if not((((dirprimary[mem[leaderbox+7].int])+2)mod 4)=((dirtertiary[mem[
leaderbox+7].int])mod 4))then if(dirprimary[mem[leaderbox+7].int])=(
dirsecondary[dvidirection])then basepointhorizontal:=mem[leaderbox+3].
int else basepointhorizontal:=mem[leaderbox+2].int else if(dirprimary[
mem[leaderbox+7].int])=(dirsecondary[dvidirection])then
basepointhorizontal:=mem[leaderbox+2].int else basepointhorizontal:=mem[
leaderbox+3].int;
if(dirsecondary[mem[leaderbox+7].int])=(dirprimary[dvidirection])then
basepointvertical:=mem[leaderbox+1].int else basepointvertical:=0;end;
basepointhorizontal:=basepointhorizontal+mem[leaderbox+4].int;
tempptr:=leaderbox;curh:=leftedge+basepointhorizontal;edgev:=curv;
curv:=curv+basepointvertical;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
saveh:=dvih;savev:=dviv;outerdoingleaders:=doingleaders;
doingleaders:=true;
if mem[leaderbox].hh.b0=1 then vlistout else hlistout;
doingleaders:=outerdoingleaders;dvih:=saveh;dviv:=savev;curh:=leftedge;
curv:=edgev+leaderht+lx;end{:671};curv:=edge-10;goto 15;end;end{:669};
goto 13;end{:668};11:curv:=curv+mem[p+1].int;others:end;goto 15;
14:{667:}if(rulewd=-1073741824)then rulewd:=mem[thisbox+1].int;
ruleht:=ruleht+ruledp;curv:=curv+ruleht;
if(ruleht>0)and(rulewd>0)then begin if curh<>dvih then begin movement(
curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
case(dvidirection mod 16)of 0:begin begin dvibuf[dviptr]:=137;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(ruleht);
dvifour(rulewd);end;2:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(ruleht);;
begin dvibuf[dviptr]:=137;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-ruleht);;end;
4:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-rulewd);;
begin dvibuf[dviptr]:=132;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);end;
6:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(ruleht);;
begin dvibuf[dviptr]:=146;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-rulewd);;begin dvibuf[dviptr]:=132;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(ruleht);dvifour(rulewd);
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-ruleht);;end;9:begin begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(rulewd);;
begin dvibuf[dviptr]:=146;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-ruleht);;begin dvibuf[dviptr]:=132;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(rulewd);dvifour(ruleht);
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-rulewd);;end;11:begin begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(rulewd);;
begin dvibuf[dviptr]:=137;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(rulewd);dvifour(ruleht);begin dvibuf[dviptr]:=160;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(-rulewd);;end;
13:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-ruleht);;
begin dvibuf[dviptr]:=132;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(rulewd);dvifour(ruleht);end;
15:begin begin dvibuf[dviptr]:=137;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(rulewd);dvifour(ruleht);end;
end;end;goto 15{:667};13:curv:=curv+ruleht;end{:665};15:p:=mem[p].hh.rh;
end{:664};curv:=savingv;curh:=savingh;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
prunemovements(saveloc);if curs>0 then dvipop(saveloc);decr(curs);
dvidirection:=savedirection;end;{:663}{672:}
procedure shipout(p:halfword);label 30;var pageloc:integer;j,k:0..9;
s:poolpointer;oldsetting:0..21;
begin if neweqtbint(1049442)>0 then begin printnl(65624);println;
print(66187);end;
if termoffset>maxprintline-9 then println else if(termoffset>0)or(
fileoffset>0)then printchar(32);printchar(91);j:=9;
while(neweqtbint(1049484+j)=0)and(j>0)do decr(j);
for k:=0 to j do begin printint(neweqtbint(1049484+k));
if k<j then printchar(46);end;fflush(stdout);
if neweqtbint(1049442)>0 then begin printchar(93);begindiagnostic;
showbox(p);enddiagnostic(true);end;{674:}{675:}
if(mem[p+3].int>1073741823)or(mem[p+2].int>1073741823)or(mem[p+3].int+
mem[p+2].int+neweqtbsc(1180556+(19))>1073741823)or(mem[p+1].int+
neweqtbsc(1180556+(18))>1073741823)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65548);
print(66191);end;begin helpptr:=2;helpline[1]:=66192;helpline[0]:=66193;
end;error;if neweqtbint(1049442)<=0 then begin begindiagnostic;
printnl(66194);showbox(p);enddiagnostic(true);end;goto 30;end;
if mem[p+3].int+mem[p+2].int+neweqtbsc(1180556+(19))>maxv then maxv:=mem
[p+3].int+mem[p+2].int+neweqtbsc(1180556+(19));
if mem[p+1].int+neweqtbsc(1180556+(18))>maxh then maxh:=mem[p+1].int+
neweqtbsc(1180556+(18)){:675};{651:}dvih:=0;dviv:=0;curh:=0;curv:=0;
dvif:=0;if outputfilename=0 then begin if jobname=0 then openlogfile;
packjobname(66123);
while not bopenout(dvifile)do promptfilename(66124,66123);
outputfilename:=bmakenamestring(dvifile);end;
if totalpages=0 then begin begin dvibuf[dviptr]:=247;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=2;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(25400000);
dvifour(473628672);preparemag;dvifour(neweqtbint(1049425));
if outputcomment then begin l:=strlen(outputcomment);
begin dvibuf[dviptr]:=l;incr(dviptr);if dviptr=dvilimit then dviswap;
end;for s:=0 to l-1 do begin dvibuf[dviptr]:=outputcomment[s];
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oldsetting:=selector;selector:=21;print(66185);
printint(neweqtbint(1049431));printchar(46);
printtwo(neweqtbint(1049430));printchar(46);
printtwo(neweqtbint(1049429));printchar(58);
printtwo(neweqtbint(1049428)div 60);printtwo(neweqtbint(1049428)mod 60);
selector:=oldsetting;
begin dvibuf[dviptr]:=(poolptr-strstartar[strptr-65536]);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
for s:=strstartar[strptr-65536]to poolptr-1 do begin dvibuf[dviptr]:=
strpool[s];incr(dviptr);if dviptr=dvilimit then dviswap;end;
poolptr:=strstartar[strptr-65536];end;end{:651};
pageloc:=dvioffset+dviptr;begin dvibuf[dviptr]:=139;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
for k:=0 to 9 do dvifour(neweqtbint(1049484+k));dvifour(lastbop);
lastbop:=pageloc;dvidirection:=neweqtbint(1049479);
case(dvidirection div 4)of 0,2:begin end;
1,6:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
dvifour(neweqtbsc(1180556+(21))-neweqtbsc(1180556+(23)));;
dvih:=-neweqtbsc(1180556+(23));end;7,5:begin begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
dvifour(neweqtbsc(1180556+(21))-neweqtbsc(1180556+(23)));;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(neweqtbsc(1180556+(22))-neweqtbsc(1180556+(24)));;
dvih:=-neweqtbsc(1180556+(23));dviv:=-neweqtbsc(1180556+(24));end;
4,3:begin begin dvibuf[dviptr]:=160;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
dvifour(neweqtbsc(1180556+(22))-neweqtbsc(1180556+(24)));;
dviv:=-neweqtbsc(1180556+(24));end;end;curh:=neweqtbsc(1180556+(18));
curv:=mem[p+3].int+neweqtbsc(1180556+(19));
case(dvidirection div 4)of 0:begin begin dvibuf[dviptr]:=146;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(curh);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(curv);;end;1:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-curh);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(curv);;end;2:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(curv);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(curh);;end;3:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(curv);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-curh);;end;4:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(curh);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-curv);;end;5:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-curh);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-curv);;end;6:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-curv);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(curh);;end;7:begin begin dvibuf[dviptr]:=146;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(-curv);;
begin dvibuf[dviptr]:=160;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(-curh);;end;end;tempptr:=p;dvih:=dvih+curh;dviv:=dviv+curv;
if mem[p].hh.b0=1 then vlistout else hlistout;begin dvibuf[dviptr]:=140;
incr(dviptr);if dviptr=dvilimit then dviswap;end;incr(totalpages);
curs:=-1;
ifdef('IPC')if ipcon>0 then begin if dvilimit=halfbuf then begin
writedvi(halfbuf,dvibufsize-1);flushdvi;dvigone:=dvigone+halfbuf;end;
if dviptr>(2147483647-dvioffset)then begin curs:=-2;fatalerror(66184);
end;if dviptr>0 then begin writedvi(0,dviptr-1);flushdvi;
dvioffset:=dvioffset+dviptr;dvigone:=dvigone+dviptr;end;dviptr:=0;
dvilimit:=dvibufsize;ipcpage(dvigone);end;endif('IPC');30:{:674};
if neweqtbint(1049442)<=0 then printchar(93);deadcycles:=0;
fflush(stdout);{673:}
ifdef('STAT')if neweqtbint(1049439)>1 then begin printnl(66188);
printint(varused);printchar(38);printint(dynused);printchar(59);end;
endif('STAT')flushnodelist(p);
ifdef('STAT')if neweqtbint(1049439)>1 then begin print(66189);
printint(varused);printchar(38);printint(dynused);print(66190);
printint(himemmin-lomemmax-1);println;end;endif('STAT'){:673};end;{:672}
{679:}procedure scanspec(c:groupcode;threecodes:boolean);label 40;
var s:integer;speccode:0..1;
begin if threecodes then s:=savestack[saveptr+0].int;
if(c<>6)and(c<>12)then begin if scankeyword(66199)then begin scandir;
specdirection:=curval;end;end;
if scankeyword(66200)then speccode:=0 else if scankeyword(66201)then
speccode:=1 else begin speccode:=1;curval:=0;goto 40;end;
scandimen(false,false,false);
40:if threecodes then begin savestack[saveptr+0].int:=s;incr(saveptr);
end;savestack[saveptr+0].int:=speccode;savestack[saveptr+1].int:=curval;
if(c<>6)and(c<>12)then begin savestack[saveptr+2].int:=specdirection;
{1441:}begin if specdirection<>-1 then begin savestack[saveptr+3].int:=
textdirptr;textdirptr:=newdir(specdirection);
end else savestack[saveptr+3].int:=0;end{:1441};saveptr:=saveptr+4;
newsavelevel(c);scanleftbrace;eqworddefine(1049480,specdirection);
eqworddefine(1049481,specdirection);eqworddefine(1049482,specdirection);
eqworddefine(1049467,curlevel);end else begin saveptr:=saveptr+2;
newsavelevel(c);scanleftbrace;end;specdirection:=-1;end;{:679}{683:}
function hpack(p:halfword;w:scaled;m:smallnumber):halfword;
label 21,50,10;var r:halfword;q:halfword;h,d,x:scaled;s:scaled;
g:halfword;o:glueord;f:internalfontnumber;i:fourquarters;hd:eightbits;
dirtmp,dirptr:halfword;hpackdir:integer;begin lastbadness:=0;
r:=getnode(8);mem[r].hh.b0:=0;
if packdirection=-1 then mem[r+7].int:=neweqtbint(1049482)else begin mem
[r+7].int:=packdirection;packdirection:=-1;end;hpackdir:=mem[r+7].int;
{1447:}begin dirptr:=0;begin dirtmp:=newdir(hpackdir);
mem[dirtmp].hh.rh:=dirptr;dirptr:=dirtmp;dirptr:=dirtmp;end end{:1447};
mem[r].hh.b1:=0;mem[r+4].int:=0;q:=r+5;mem[q].hh.rh:=p;h:=0;{684:}d:=0;
x:=0;totalstretch[0]:=0;totalshrink[0]:=0;totalstretch[1]:=0;
totalshrink[1]:=0;totalstretch[2]:=0;totalshrink[2]:=0;
totalstretch[3]:=0;totalshrink[3]:=0;totalstretch[4]:=0;
totalshrink[4]:=0{:684};while p<>0 do{685:}
begin 21:while(p>=himemmin)do{688:}begin f:=mem[p].hh.b0;
i:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[p].hh.b1].
qqqq;hd:=i.b1;
if((dirsecondary[hpackdir])mod 2)=((dirtertiary[hpackdir])mod 2)then
begin x:=x+fonttables[f,fonttables[f,37].int+(hd)div 256].int+fonttables
[f,fonttables[f,38].int+(hd)mod 256].int;
s:=fonttables[f,fonttables[f,36].int+i.b0].int div 2;if s>h then h:=s;
s:=fonttables[f,fonttables[f,36].int+i.b0].int div 2;if s>d then d:=s;
end else if(((dirtertiary[hpackdir])+2)mod 4)=((dirtertiary[mem[r+7].int
])mod 4)then begin x:=x+fonttables[f,fonttables[f,36].int+i.b0].int;
s:=fonttables[f,fonttables[f,38].int+(hd)mod 256].int;if s>h then h:=s;
s:=fonttables[f,fonttables[f,37].int+(hd)div 256].int;if s>d then d:=s;
end else begin x:=x+fonttables[f,fonttables[f,36].int+i.b0].int;
s:=fonttables[f,fonttables[f,37].int+(hd)div 256].int;if s>h then h:=s;
s:=fonttables[f,fonttables[f,38].int+(hd)mod 256].int;if s>d then d:=s;
end;p:=mem[p].hh.rh;end{:688};
if p<>0 then begin case mem[p].hh.b0 of 0,1,2,13:{687:}
begin if(mem[p].hh.b0=0)or(mem[p].hh.b0=1)then begin if((dirprimary[mem[
p+7].int])mod 2)<>(dirprimary[hpackdir]mod 2)then begin x:=x+mem[p+3].
int+mem[p+2].int;s:=mem[p+4].int;
if(mem[p+1].int div 2)-s>h then h:=(mem[p+1].int div 2)-s;
if(mem[p+1].int div 2)+s>d then d:=(mem[p+1].int div 2)+s;
end else if(mem[p].hh.b0=0)and((((dirprimary[hpackdir])+2)mod 4)=((
dirtertiary[hpackdir])mod 4))then begin x:=x+mem[p+1].int;
s:=mem[p+4].int;if mem[p+2].int-s>h then h:=mem[p+2].int-s;
if mem[p+3].int+s>d then d:=mem[p+3].int+s;
end else begin x:=x+mem[p+1].int;s:=mem[p+4].int;
if mem[p+3].int-s>h then h:=mem[p+3].int-s;
if mem[p+2].int+s>d then d:=mem[p+2].int+s;
end end else begin x:=x+mem[p+1].int;
if mem[p].hh.b0>=2 then s:=0 else s:=mem[p+4].int;
if mem[p+3].int-s>h then h:=mem[p+3].int-s;
if mem[p+2].int+s>d then d:=mem[p+2].int+s;end;end{:687};
3,4,5:if adjusttail<>0 then{689:}
begin while mem[q].hh.rh<>p do q:=mem[q].hh.rh;
if mem[p].hh.b0=5 then begin mem[adjusttail].hh.rh:=mem[p+1].int;
while mem[adjusttail].hh.rh<>0 do adjusttail:=mem[adjusttail].hh.rh;
p:=mem[p].hh.rh;freenode(mem[q].hh.rh,2);
end else begin mem[adjusttail].hh.rh:=p;adjusttail:=p;p:=mem[p].hh.rh;
end;mem[q].hh.rh:=p;p:=q;end{:689};8:{1402:}
begin if mem[p].hh.b1=7 then begin{1434:}
begin if mem[p+1].hh.lh>=0 then begin hpackdir:=mem[p+1].hh.lh;
begin dirtmp:=getnode(4);mem[dirtmp].hh.b0:=8;mem[dirtmp].hh.b1:=7;
mem[dirtmp+1].hh.lh:=mem[p+1].hh.lh;mem[dirtmp+1].hh.rh:=mem[p+1].hh.rh;
mem[dirtmp+3].hh.lh:=mem[p+3].hh.lh;mem[dirtmp+2].hh.lh:=mem[p+2].hh.lh;
mem[dirtmp].hh.rh:=dirptr;dirptr:=dirtmp;end;
end else begin begin dirtmp:=dirptr;dirptr:=mem[dirtmp].hh.rh;
freenode(dirtmp,4);end;hpackdir:=mem[dirptr+1].hh.lh;end end{:1434};end;
end{:1402};10:{690:}begin g:=mem[p+1].hh.lh;x:=x+mem[g+1].int;
o:=mem[g].hh.b0;totalstretch[o]:=totalstretch[o]+mem[g+2].int;
o:=mem[g].hh.b1;totalshrink[o]:=totalshrink[o]+mem[g+3].int;
if mem[p].hh.b1>=100 then begin g:=mem[p+1].hh.rh;
if mem[g+3].int>h then h:=mem[g+3].int;
if mem[g+2].int>d then d:=mem[g+2].int;end;end{:690};
11,9:x:=x+mem[p+1].int;6:{686:}begin mem[memtop-12]:=mem[p+1];
mem[memtop-12].hh.rh:=mem[p].hh.rh;p:=memtop-12;goto 21;end{:686};
others:end;p:=mem[p].hh.rh;end;end{:685};
if adjusttail<>0 then mem[adjusttail].hh.rh:=0;mem[r+3].int:=h;
mem[r+2].int:=d;{691:}if m=1 then w:=x+w;mem[r+1].int:=w;x:=w-x;
if x=0 then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;mem[r+6].gr:=0.0;
goto 10;end else if x>0 then{692:}begin{693:}
if totalstretch[4]<>0 then o:=4 else if totalstretch[3]<>0 then o:=3
else if totalstretch[2]<>0 then o:=2 else if totalstretch[1]<>0 then o:=
1 else o:=0{:693};mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=1;
if totalstretch[o]<>0 then mem[r+6].gr:=x/totalstretch[o]else begin mem[
r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if o=0 then if mem[r+5].hh.rh<>0 then{694:}
begin lastbadness:=badness(x,totalstretch[0]);
if lastbadness>neweqtbint(1049434)then begin println;
if lastbadness>100 then printnl(66202)else printnl(66203);print(66204);
printint(lastbadness);goto 50;end;end{:694};goto 10;end{:692}else{698:}
begin{699:}
if totalshrink[4]<>0 then o:=4 else if totalshrink[3]<>0 then o:=3 else
if totalshrink[2]<>0 then o:=2 else if totalshrink[1]<>0 then o:=1 else
o:=0{:699};mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=2;
if totalshrink[o]<>0 then mem[r+6].gr:=(-x)/totalshrink[o]else begin mem
[r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if(totalshrink[o]<-x)and(o=0)and(mem[r+5].hh.rh<>0)then begin
lastbadness:=1000000;mem[r+6].gr:=1.0;{700:}
if(-x-totalshrink[0]>neweqtbsc(1180556+(8)))or(neweqtbint(1049434)<100)
then begin if(neweqtbsc(1180556+(16))>0)and(-x-totalshrink[0]>neweqtbsc(
1180556+(8)))then begin while mem[q].hh.rh<>0 do q:=mem[q].hh.rh;
mem[q].hh.rh:=newrule;mem[mem[q].hh.rh+4].hh.lh:=mem[r+7].int;
mem[mem[q].hh.rh+1].int:=neweqtbsc(1180556+(16));end;println;
printnl(66210);printscaled(-x-totalshrink[0]);print(66211);goto 50;
end{:700};end else if o=0 then if mem[r+5].hh.rh<>0 then{701:}
begin lastbadness:=badness(-x,totalshrink[0]);
if lastbadness>neweqtbint(1049434)then begin println;printnl(66212);
printint(lastbadness);goto 50;end;end{:701};goto 10;end{:698}{:691};
50:{697:}
if outputactive then print(66205)else begin if packbeginline<>0 then
begin if packbeginline>0 then print(66206)else print(66207);
printint(abs(packbeginline));print(66208);end else print(66209);
printint(line);end;println;fontinshortdisplay:=0;
shortdisplay(mem[r+5].hh.rh);println;begindiagnostic;showbox(r);
enddiagnostic(true){:697};10:{1438:}
begin while dirptr<>0 do begin dirtmp:=dirptr;dirptr:=mem[dirtmp].hh.rh;
freenode(dirtmp,4);end end{:1438};hpack:=r;end;{:683}{702:}
function vpackage(p:halfword;h:scaled;m:smallnumber;l:scaled):halfword;
label 50,10;var r:halfword;w,d,x:scaled;s:scaled;g:halfword;o:glueord;
begin lastbadness:=0;r:=getnode(8);mem[r].hh.b0:=1;
if packdirection=-1 then mem[r+7].int:=neweqtbint(1049480)else begin mem
[r+7].int:=packdirection;packdirection:=-1;end;mem[r].hh.b1:=0;
mem[r+4].int:=0;mem[r+5].hh.rh:=p;w:=0;{684:}d:=0;x:=0;
totalstretch[0]:=0;totalshrink[0]:=0;totalstretch[1]:=0;
totalshrink[1]:=0;totalstretch[2]:=0;totalshrink[2]:=0;
totalstretch[3]:=0;totalshrink[3]:=0;totalstretch[4]:=0;
totalshrink[4]:=0{:684};while p<>0 do{703:}
begin if(p>=himemmin)then confusion(66213)else case mem[p].hh.b0 of 0,1,
2,13:{704:}
begin if(mem[p].hh.b0=0)or(mem[p].hh.b0=1)then begin if((dirprimary[mem[
p+7].int])mod 2)<>(dirprimary[mem[r+7].int]mod 2)then begin x:=x+d+(mem[
p+1].int div 2);d:=mem[p+1].int div 2;s:=mem[p+4].int;
if mem[p+2].int+mem[p+3].int+s>w then w:=mem[p+2].int+mem[p+3].int+s;
end else if(mem[p].hh.b0=0)and((((dirprimary[mem[p+7].int])+2)mod 4)=((
dirtertiary[mem[p+7].int])mod 4))then begin x:=x+d+mem[p+2].int;
d:=mem[p+3].int;s:=mem[p+4].int;
if mem[p+1].int+s>w then w:=mem[p+1].int+s;
end else begin x:=x+d+mem[p+3].int;d:=mem[p+2].int;s:=mem[p+4].int;
if mem[p+1].int+s>w then w:=mem[p+1].int+s;
end end else begin x:=x+d+mem[p+3].int;d:=mem[p+2].int;
if mem[p].hh.b0>=2 then s:=0 else s:=mem[p+4].int;
if mem[p+1].int+s>w then w:=mem[p+1].int+s;end;end{:704};8:{1401:}
{:1401};10:{705:}begin x:=x+d;d:=0;g:=mem[p+1].hh.lh;x:=x+mem[g+1].int;
o:=mem[g].hh.b0;totalstretch[o]:=totalstretch[o]+mem[g+2].int;
o:=mem[g].hh.b1;totalshrink[o]:=totalshrink[o]+mem[g+3].int;
if mem[p].hh.b1>=100 then begin g:=mem[p+1].hh.rh;
if mem[g+1].int>w then w:=mem[g+1].int;end;end{:705};
11:begin x:=x+d+mem[p+1].int;d:=0;end;others:end;p:=mem[p].hh.rh;
end{:703};mem[r+1].int:=w;if d>l then begin x:=x+d-l;mem[r+2].int:=l;
end else mem[r+2].int:=d;{706:}if m=1 then h:=x+h;mem[r+3].int:=h;
x:=h-x;if x=0 then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;goto 10;end else if x>0 then{707:}begin{693:}
if totalstretch[4]<>0 then o:=4 else if totalstretch[3]<>0 then o:=3
else if totalstretch[2]<>0 then o:=2 else if totalstretch[1]<>0 then o:=
1 else o:=0{:693};mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=1;
if totalstretch[o]<>0 then mem[r+6].gr:=x/totalstretch[o]else begin mem[
r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if o=0 then if mem[r+5].hh.rh<>0 then{708:}
begin lastbadness:=badness(x,totalstretch[0]);
if lastbadness>neweqtbint(1049435)then begin println;
if lastbadness>100 then printnl(66202)else printnl(66203);print(66214);
printint(lastbadness);goto 50;end;end{:708};goto 10;end{:707}else{710:}
begin{699:}
if totalshrink[4]<>0 then o:=4 else if totalshrink[3]<>0 then o:=3 else
if totalshrink[2]<>0 then o:=2 else if totalshrink[1]<>0 then o:=1 else
o:=0{:699};mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=2;
if totalshrink[o]<>0 then mem[r+6].gr:=(-x)/totalshrink[o]else begin mem
[r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if(totalshrink[o]<-x)and(o=0)and(mem[r+5].hh.rh<>0)then begin
lastbadness:=1000000;mem[r+6].gr:=1.0;{711:}
if(-x-totalshrink[0]>neweqtbsc(1180556+(9)))or(neweqtbint(1049435)<100)
then begin println;printnl(66215);printscaled(-x-totalshrink[0]);
print(66216);goto 50;end{:711};
end else if o=0 then if mem[r+5].hh.rh<>0 then{712:}
begin lastbadness:=badness(-x,totalshrink[0]);
if lastbadness>neweqtbint(1049435)then begin println;printnl(66217);
printint(lastbadness);goto 50;end;end{:712};goto 10;end{:710}{:706};
50:{709:}
if outputactive then print(66205)else begin if packbeginline<>0 then
begin print(66207);printint(abs(packbeginline));print(66208);
end else print(66209);printint(line);println;end;begindiagnostic;
showbox(r);enddiagnostic(true){:709};10:vpackage:=r;end;{:702}{713:}
procedure appendtovlist(b:halfword);var d:scaled;p:halfword;
begin if curlist.auxfield.int>-65536000 then begin if(mem[b].hh.b0=0)and
((((dirprimary[mem[b+7].int])+2)mod 4)=((dirtertiary[mem[b+7].int])mod 4
))then d:=mem[newequiv(393231)+1].int-curlist.auxfield.int-mem[b+2].int
else d:=mem[newequiv(393231)+1].int-curlist.auxfield.int-mem[b+3].int;
if d<neweqtbsc(1180556+(2))then p:=newparamglue(0)else begin p:=
newskipparam(1);mem[tempptr+1].int:=d;end;
mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;end;
mem[curlist.tailfield].hh.rh:=b;curlist.tailfield:=b;
if(mem[b].hh.b0=0)and((((dirprimary[mem[b+7].int])+2)mod 4)=((
dirtertiary[mem[b+7].int])mod 4))then curlist.auxfield.int:=mem[b+3].int
else curlist.auxfield.int:=mem[b+2].int;end;{:713}{720:}
function newnoad:halfword;var p:halfword;begin p:=getnode(4);
mem[p].hh.b0:=16;mem[p].hh.b1:=0;mem[p+1].hh:=emptyfield;
mem[p+3].hh:=emptyfield;mem[p+2].hh:=emptyfield;newnoad:=p;end;{:720}
{722:}function newstyle(s:smallnumber):halfword;var p:halfword;
begin p:=getnode(3);mem[p].hh.b0:=14;mem[p].hh.b1:=s;mem[p+1].int:=0;
mem[p+2].int:=0;newstyle:=p;end;{:722}{723:}function newchoice:halfword;
var p:halfword;begin p:=getnode(3);mem[p].hh.b0:=15;mem[p].hh.b1:=0;
mem[p+1].hh.lh:=0;mem[p+1].hh.rh:=0;mem[p+2].hh.lh:=0;mem[p+2].hh.rh:=0;
newchoice:=p;end;{:723}{727:}procedure showinfo;
begin shownodelist(mem[tempptr].hh.lh);end;{:727}{738:}
function fractionrule(t:scaled):halfword;var p:halfword;
begin p:=newrule;mem[p+4].hh.lh:=neweqtbint(1049483);mem[p+3].int:=t;
mem[p+2].int:=0;fractionrule:=p;end;{:738}{739:}
function overbar(b:halfword;k,t:scaled):halfword;var p,q:halfword;
begin p:=newkern(k);mem[p].hh.rh:=b;q:=fractionrule(t);mem[q].hh.rh:=p;
p:=newkern(t);mem[p].hh.rh:=q;packdirection:=neweqtbint(1049483);
overbar:=vpackage(p,0,1,1073741823);end;{:739}{740:}{743:}
function charbox(f:internalfontnumber;c:quarterword):halfword;
var q:fourquarters;hd:eightbits;b,p:halfword;
begin q:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+c].qqqq;
hd:=q.b1;b:=newnullbox;
mem[b+1].int:=fonttables[f,fonttables[f,36].int+q.b0].int+fonttables[f,
fonttables[f,39].int+(q.b2)div 256].int;
mem[b+3].int:=fonttables[f,fonttables[f,37].int+(hd)div 256].int;
mem[b+2].int:=fonttables[f,fonttables[f,38].int+(hd)mod 256].int;
p:=getavail;mem[p].hh.b1:=c;mem[p].hh.b0:=f;mem[b+5].hh.rh:=p;
charbox:=b;end;{:743}{745:}procedure stackintobox(b:halfword;
f:internalfontnumber;c:quarterword);var p:halfword;
begin p:=charbox(f,c);mem[p].hh.rh:=mem[b+5].hh.rh;mem[b+5].hh.rh:=p;
mem[b+3].int:=mem[p+3].int;end;{:745}{746:}
function heightplusdepth(f:internalfontnumber;c:quarterword):scaled;
var q:fourquarters;hd:eightbits;
begin q:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+c].qqqq;
hd:=q.b1;
heightplusdepth:=fonttables[f,fonttables[f,37].int+(hd)div 256].int+
fonttables[f,fonttables[f,38].int+(hd)mod 256].int;end;{:746}
function vardelimiter(d:halfword;s:integer;v:scaled):halfword;
label 40,22;var b:halfword;f,g:internalfontnumber;c,x,y:quarterword;
m,n:integer;u:scaled;w:scaled;q:fourquarters;hd:eightbits;
r:fourquarters;z:integer;largeattempt:boolean;begin f:=0;w:=0;
largeattempt:=false;z:=mem[d].qqqq.b0;x:=mem[d].qqqq.b1;
while true do begin{741:}if(z<>0)or(x<>0)then begin z:=z+s+256;
repeat z:=z-256;g:=newequiv(720960+z);if g<>0 then{742:}begin y:=x;
if(y>=fonttables[g,12].int)and(y<=fonttables[g,13].int)then begin 22:q:=
fonttables[g,fonttables[g,34].int-fonttables[g,5].int+y].qqqq;
if(q.b0>0)then begin if((q.b2)mod 4)=3 then begin f:=g;c:=y;goto 40;end;
hd:=q.b1;
u:=fonttables[g,fonttables[g,37].int+(hd)div 256].int+fonttables[g,
fonttables[g,38].int+(hd)mod 256].int;if u>w then begin f:=g;c:=y;w:=u;
if u>=v then goto 40;end;if((q.b2)mod 4)=2 then begin y:=q.b3;goto 22;
end;end;end;end{:742};until z<256;end{:741};
if largeattempt then goto 40;largeattempt:=true;z:=mem[d].qqqq.b2;
x:=mem[d].qqqq.b3;end;40:if f<>0 then{744:}if((q.b2)mod 4)=3 then{747:}
begin b:=newnullbox;mem[b].hh.b0:=1;
r:=fonttables[f,fonttables[f,42].int+q.b3].qqqq;{748:}
c:=fonttables[f,5].int+r.b3;u:=heightplusdepth(f,c);w:=0;
q:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+c].qqqq;
mem[b+1].int:=fonttables[f,fonttables[f,36].int+q.b0].int+fonttables[f,
fonttables[f,39].int+(q.b2)div 256].int;c:=fonttables[f,5].int+r.b2;
if c<>0 then w:=w+heightplusdepth(f,c);c:=fonttables[f,5].int+r.b1;
if c<>0 then w:=w+heightplusdepth(f,c);c:=fonttables[f,5].int+r.b0;
if c<>0 then w:=w+heightplusdepth(f,c);n:=0;
if u>0 then while w<v do begin w:=w+u;incr(n);
if(fonttables[f,5].int+r.b1)<>0 then w:=w+u;end{:748};
c:=fonttables[f,5].int+r.b2;if c<>0 then stackintobox(b,f,c);
c:=fonttables[f,5].int+r.b3;for m:=1 to n do stackintobox(b,f,c);
c:=fonttables[f,5].int+r.b1;if c<>0 then begin stackintobox(b,f,c);
c:=fonttables[f,5].int+r.b3;for m:=1 to n do stackintobox(b,f,c);end;
c:=fonttables[f,5].int+r.b0;if c<>0 then stackintobox(b,f,c);
mem[b+2].int:=w-mem[b+3].int;end{:747}else b:=charbox(f,c){:744}
else begin b:=newnullbox;mem[b+1].int:=neweqtbsc(1180556+(11));end;
z:=cursize;cursize:=s;
mem[b+4].int:=half(mem[b+3].int-mem[b+2].int)-fonttables[newequiv(
720962+cursize),22+fonttables[newequiv(720962+cursize),43].int].int;
cursize:=z;vardelimiter:=b;end;{:740}{749:}function rebox(b:halfword;
w:scaled):halfword;var p:halfword;f:internalfontnumber;v:scaled;
begin if(mem[b+1].int<>w)and(mem[b+5].hh.rh<>0)then begin if mem[b].hh.
b0=1 then b:=hpack(b,0,1);p:=mem[b+5].hh.rh;
if((p>=himemmin))and(mem[p].hh.rh=0)then begin f:=mem[p].hh.b0;
v:=fonttables[f,fonttables[f,36].int+fonttables[f,fonttables[f,34].int-
fonttables[f,5].int+mem[p].hh.b1].qqqq.b0].int;
if v<>mem[b+1].int then mem[p].hh.rh:=newkern(mem[b+1].int-v);end;
freenode(b,8);b:=newglue(membot+16);mem[b].hh.rh:=p;
while mem[p].hh.rh<>0 do p:=mem[p].hh.rh;
mem[p].hh.rh:=newglue(membot+16);rebox:=hpack(b,w,0);
end else begin mem[b+1].int:=w;rebox:=b;end;end;{:749}{750:}
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
mathglue:=p;end;{:750}{751:}procedure mathkern(p:halfword;m:scaled);
var n:integer;f:scaled;
begin if mem[p].hh.b1=99 then begin n:=xovern(m,65536);f:=texremainder;
if f<0 then begin decr(n);f:=f+65536;end;
mem[p+1].int:=multandadd(n,mem[p+1].int,xnoverd(mem[p+1].int,f,65536),
1073741823);mem[p].hh.b1:=1;end;end;{:751}{752:}procedure flushmath;
begin flushnodelist(mem[curlist.headfield].hh.rh);
flushnodelist(curlist.auxfield.int);mem[curlist.headfield].hh.rh:=0;
curlist.tailfield:=curlist.headfield;curlist.auxfield.int:=0;end;{:752}
{754:}procedure mlisttohlist;forward;function cleanbox(p:halfword;
s:integer):halfword;label 40;var q:halfword;savestyle:integer;
x:halfword;r:halfword;
begin case mem[p].hh.rh of 1:begin curmlist:=newnoad;
mem[curmlist+1]:=mem[p];end;2:begin q:=mem[p].hh.lh;goto 40;end;
3:curmlist:=mem[p].hh.lh;others:begin q:=newnullbox;goto 40;end end;
savestyle:=curstyle;curstyle:=s;mlistpenalties:=false;mlisttohlist;
q:=mem[memtop-3].hh.rh;curstyle:=savestyle;{737:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);
curmu:=xovern(fonttables[newequiv(720962+cursize),6+fonttables[newequiv(
720962+cursize),43].int].int,18);end{:737};
40:if(q>=himemmin)or(q=0)then x:=hpack(q,0,1)else if(mem[q].hh.rh=0)and(
mem[q].hh.b0<=1)and(mem[q+4].int=0)then x:=q else x:=hpack(q,0,1);{755:}
q:=mem[x+5].hh.rh;if(q>=himemmin)then begin r:=mem[q].hh.rh;
if r<>0 then if mem[r].hh.rh=0 then if not(r>=himemmin)then if mem[r].hh
.b0=11 then begin freenode(r,2);mem[q].hh.rh:=0;end;end{:755};
cleanbox:=x;end;{:754}{756:}procedure fetch(a:halfword);
begin curc:=mem[a].hh.b1;curf:=newequiv(720960+mem[a].hh.b0+cursize);
if curf=0 then{757:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65624);end;printsize(cursize);printchar(32);
printint(mem[a].hh.b0);print(66243);print(curc);printchar(41);
begin helpptr:=4;helpline[3]:=66244;helpline[2]:=66245;
helpline[1]:=66246;helpline[0]:=66247;end;error;curi:=nullcharacter;
mem[a].hh.rh:=0;end{:757}
else begin if(curc>=fonttables[curf,12].int)and(curc<=fonttables[curf,13
].int)then curi:=fonttables[curf,fonttables[curf,34].int-fonttables[curf
,5].int+curc].qqqq else curi:=nullcharacter;
if not((curi.b0>0))then begin charwarning(curf,curc);mem[a].hh.rh:=0;
curi:=nullcharacter;end;end;end;{:756}{760:}{768:}
procedure makeover(q:halfword);
begin mem[q+1].hh.lh:=overbar(cleanbox(q+1,2*(curstyle div 2)+1),3*
fonttables[newequiv(720963+cursize),8+fonttables[newequiv(720963+cursize
),43].int].int,fonttables[newequiv(720963+cursize),8+fonttables[newequiv
(720963+cursize),43].int].int);mem[q+1].hh.rh:=2;end;{:768}{769:}
procedure makeunder(q:halfword);var p,x,y:halfword;delta:scaled;
begin x:=cleanbox(q+1,curstyle);
p:=newkern(3*fonttables[newequiv(720963+cursize),8+fonttables[newequiv(
720963+cursize),43].int].int);mem[x].hh.rh:=p;
mem[p].hh.rh:=fractionrule(fonttables[newequiv(720963+cursize),8+
fonttables[newequiv(720963+cursize),43].int].int);
packdirection:=neweqtbint(1049483);y:=vpackage(x,0,1,1073741823);
delta:=mem[y+3].int+mem[y+2].int+fonttables[newequiv(720963+cursize),8+
fonttables[newequiv(720963+cursize),43].int].int;
mem[y+3].int:=mem[x+3].int;mem[y+2].int:=delta-mem[y+3].int;
mem[q+1].hh.lh:=y;mem[q+1].hh.rh:=2;end;{:769}{770:}
procedure makevcenter(q:halfword);var v:halfword;delta:scaled;
begin v:=mem[q+1].hh.lh;if mem[v].hh.b0<>1 then confusion(65840);
delta:=mem[v+3].int+mem[v+2].int;
mem[v+3].int:=fonttables[newequiv(720962+cursize),22+fonttables[newequiv
(720962+cursize),43].int].int+half(delta);
mem[v+2].int:=delta-mem[v+3].int;end;{:770}{771:}
procedure makeradical(q:halfword);var x,y:halfword;delta,clr:scaled;
begin x:=cleanbox(q+1,2*(curstyle div 2)+1);
if curstyle<2 then clr:=fonttables[newequiv(720963+cursize),8+fonttables
[newequiv(720963+cursize),43].int].int+(abs(fonttables[newequiv(720962+
cursize),5+fonttables[newequiv(720962+cursize),43].int].int)div 4)else
begin clr:=fonttables[newequiv(720963+cursize),8+fonttables[newequiv(
720963+cursize),43].int].int;clr:=clr+(abs(clr)div 4);end;
y:=vardelimiter(q+4,cursize,mem[x+3].int+mem[x+2].int+clr+fonttables[
newequiv(720963+cursize),8+fonttables[newequiv(720963+cursize),43].int].
int);delta:=mem[y+2].int-(mem[x+3].int+mem[x+2].int+clr);
if delta>0 then clr:=clr+half(delta);mem[y+4].int:=-(mem[x+3].int+clr);
mem[y].hh.rh:=overbar(x,clr,mem[y+3].int);mem[q+1].hh.lh:=hpack(y,0,1);
mem[q+1].hh.rh:=2;end;{:771}{772:}procedure makemathaccent(q:halfword);
label 30,31;var p,x,y:halfword;a:integer;c:quarterword;
f:internalfontnumber;i:fourquarters;s:scaled;h:scaled;delta:scaled;
w:scaled;begin fetch(q+4);if(curi.b0>0)then begin i:=curi;c:=curc;
f:=curf;{775:}s:=0;if mem[q+1].hh.rh=1 then begin fetch(q+1);
if((curi.b2)mod 4)=1 then begin a:=fonttables[curf,40].int+curi.b3;
curi:=fonttables[curf,a].qqqq;
if(curi.b0 mod 256)>128 then begin a:=fonttables[curf,40].int+256*curi.
b2+curi.b3+32768-256*(128);curi:=fonttables[curf,a].qqqq;end;
while true do begin if(fonttables[curf,5].int+curi.b1)=fonttables[curf,
17].int then begin if curi.b2>=128 then if(curi.b0 mod 256)<=128 then s
:=fonttables[curf,fonttables[curf,41].int+256*curi.b2+curi.b3].int;
goto 31;end;if(curi.b0 mod 256)>=128 then goto 31;
a:=a+(curi.b0 mod 256)+1;curi:=fonttables[curf,a].qqqq;end;end;end;
31:{:775};x:=cleanbox(q+1,2*(curstyle div 2)+1);w:=mem[x+1].int;
h:=mem[x+3].int;{774:}
while true do begin if((i.b2)mod 4)<>2 then goto 30;y:=i.b3;
i:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+y].qqqq;
if not(i.b0>0)then goto 30;
if fonttables[f,fonttables[f,36].int+i.b0].int>w then goto 30;c:=y;end;
30:{:774};
if h<fonttables[f,fonttables[f,43].int+5].int then delta:=h else delta:=
fonttables[f,fonttables[f,43].int+5].int;
if(mem[q+2].hh.rh<>0)or(mem[q+3].hh.rh<>0)then if mem[q+1].hh.rh=1 then{
776:}begin flushnodelist(x);x:=newnoad;mem[x+1]:=mem[q+1];
mem[x+2]:=mem[q+2];mem[x+3]:=mem[q+3];mem[q+2].hh:=emptyfield;
mem[q+3].hh:=emptyfield;mem[q+1].hh.rh:=3;mem[q+1].hh.lh:=x;
x:=cleanbox(q+1,curstyle);delta:=delta+mem[x+3].int-h;h:=mem[x+3].int;
end{:776};y:=charbox(f,c);mem[y+4].int:=s+half(w-mem[y+1].int);
mem[y+1].int:=0;p:=newkern(-delta);mem[p].hh.rh:=x;mem[y].hh.rh:=p;
packdirection:=neweqtbint(1049483);y:=vpackage(y,0,1,1073741823);
mem[y+1].int:=mem[x+1].int;if mem[y+3].int<h then{773:}
begin p:=newkern(h-mem[y+3].int);mem[p].hh.rh:=mem[y+5].hh.rh;
mem[y+5].hh.rh:=p;mem[y+3].int:=h;end{:773};mem[q+1].hh.lh:=y;
mem[q+1].hh.rh:=2;end;end;{:772}{777:}
procedure makefraction(q:halfword);var p,v,x,y,z:halfword;
delta,delta1,delta2,shiftup,shiftdown,clr:scaled;
begin if mem[q+1].int=1073741824 then mem[q+1].int:=fonttables[newequiv(
720963+cursize),8+fonttables[newequiv(720963+cursize),43].int].int;
{778:}x:=cleanbox(q+2,curstyle+2-2*(curstyle div 6));
z:=cleanbox(q+3,2*(curstyle div 2)+3-2*(curstyle div 6));
if mem[x+1].int<mem[z+1].int then x:=rebox(x,mem[z+1].int)else z:=rebox(
z,mem[x+1].int);
if curstyle<2 then begin shiftup:=fonttables[newequiv(720962+cursize),8+
fonttables[newequiv(720962+cursize),43].int].int;
shiftdown:=fonttables[newequiv(720962+cursize),11+fonttables[newequiv(
720962+cursize),43].int].int;
end else begin shiftdown:=fonttables[newequiv(720962+cursize),12+
fonttables[newequiv(720962+cursize),43].int].int;
if mem[q+1].int<>0 then shiftup:=fonttables[newequiv(720962+cursize),9+
fonttables[newequiv(720962+cursize),43].int].int else shiftup:=
fonttables[newequiv(720962+cursize),10+fonttables[newequiv(720962+
cursize),43].int].int;end{:778};if mem[q+1].int=0 then{779:}
begin if curstyle<2 then clr:=7*fonttables[newequiv(720963+cursize),8+
fonttables[newequiv(720963+cursize),43].int].int else clr:=3*fonttables[
newequiv(720963+cursize),8+fonttables[newequiv(720963+cursize),43].int].
int;delta:=half(clr-((shiftup-mem[x+2].int)-(mem[z+3].int-shiftdown)));
if delta>0 then begin shiftup:=shiftup+delta;shiftdown:=shiftdown+delta;
end;end{:779}else{780:}
begin if curstyle<2 then clr:=3*mem[q+1].int else clr:=mem[q+1].int;
delta:=half(mem[q+1].int);
delta1:=clr-((shiftup-mem[x+2].int)-(fonttables[newequiv(720962+cursize)
,22+fonttables[newequiv(720962+cursize),43].int].int+delta));
delta2:=clr-((fonttables[newequiv(720962+cursize),22+fonttables[newequiv
(720962+cursize),43].int].int-delta)-(mem[z+3].int-shiftdown));
if delta1>0 then shiftup:=shiftup+delta1;
if delta2>0 then shiftdown:=shiftdown+delta2;end{:780};{781:}
v:=newnullbox;mem[v].hh.b0:=1;mem[v+3].int:=shiftup+mem[x+3].int;
mem[v+2].int:=mem[z+2].int+shiftdown;mem[v+1].int:=mem[x+1].int;
if mem[q+1].int=0 then begin p:=newkern((shiftup-mem[x+2].int)-(mem[z+3]
.int-shiftdown));mem[p].hh.rh:=z;
end else begin y:=fractionrule(mem[q+1].int);
p:=newkern((fonttables[newequiv(720962+cursize),22+fonttables[newequiv(
720962+cursize),43].int].int-delta)-(mem[z+3].int-shiftdown));
mem[y].hh.rh:=p;mem[p].hh.rh:=z;
p:=newkern((shiftup-mem[x+2].int)-(fonttables[newequiv(720962+cursize),
22+fonttables[newequiv(720962+cursize),43].int].int+delta));
mem[p].hh.rh:=y;end;mem[x].hh.rh:=p;mem[v+5].hh.rh:=x{:781};{782:}
if curstyle<2 then delta:=fonttables[newequiv(720962+cursize),20+
fonttables[newequiv(720962+cursize),43].int].int else delta:=fonttables[
newequiv(720962+cursize),21+fonttables[newequiv(720962+cursize),43].int]
.int;x:=vardelimiter(q+4,cursize,delta);mem[x].hh.rh:=v;
z:=vardelimiter(q+5,cursize,delta);mem[v].hh.rh:=z;
mem[q+1].int:=hpack(x,0,1){:782};end;{:777}{783:}
function makeop(q:halfword):scaled;var delta:scaled;p,v,x,y,z:halfword;
c:quarterword;i:fourquarters;shiftup,shiftdown:scaled;
begin if(mem[q].hh.b1=0)and(curstyle<2)then mem[q].hh.b1:=1;
if mem[q+1].hh.rh=1 then begin fetch(q+1);
if(curstyle<2)and(((curi.b2)mod 4)=2)then begin c:=curi.b3;
i:=fonttables[curf,fonttables[curf,34].int-fonttables[curf,5].int+c].
qqqq;if(i.b0>0)then begin curc:=c;curi:=i;mem[q+1].hh.b1:=c;end;end;
delta:=fonttables[curf,fonttables[curf,39].int+(curi.b2)div 256].int;
x:=cleanbox(q+1,curstyle);
if(mem[q+3].hh.rh<>0)and(mem[q].hh.b1<>1)then mem[x+1].int:=mem[x+1].int
-delta;
mem[x+4].int:=half(mem[x+3].int-mem[x+2].int)-fonttables[newequiv(
720962+cursize),22+fonttables[newequiv(720962+cursize),43].int].int;
mem[q+1].hh.rh:=2;mem[q+1].hh.lh:=x;end else delta:=0;
if mem[q].hh.b1=1 then{784:}
begin x:=cleanbox(q+2,2*(curstyle div 4)+4+(curstyle mod 2));
y:=cleanbox(q+1,curstyle);z:=cleanbox(q+3,2*(curstyle div 4)+5);
v:=newnullbox;mem[v].hh.b0:=1;mem[v+1].int:=mem[y+1].int;
if mem[x+1].int>mem[v+1].int then mem[v+1].int:=mem[x+1].int;
if mem[z+1].int>mem[v+1].int then mem[v+1].int:=mem[z+1].int;
x:=rebox(x,mem[v+1].int);y:=rebox(y,mem[v+1].int);
z:=rebox(z,mem[v+1].int);mem[x+4].int:=half(delta);
mem[z+4].int:=-mem[x+4].int;mem[v+3].int:=mem[y+3].int;
mem[v+2].int:=mem[y+2].int;{785:}
if mem[q+2].hh.rh=0 then begin freenode(x,8);mem[v+5].hh.rh:=y;
end else begin shiftup:=fonttables[newequiv(720963+cursize),11+
fonttables[newequiv(720963+cursize),43].int].int-mem[x+2].int;
if shiftup<fonttables[newequiv(720963+cursize),9+fonttables[newequiv(
720963+cursize),43].int].int then shiftup:=fonttables[newequiv(720963+
cursize),9+fonttables[newequiv(720963+cursize),43].int].int;
p:=newkern(shiftup);mem[p].hh.rh:=y;mem[x].hh.rh:=p;
p:=newkern(fonttables[newequiv(720963+cursize),13+fonttables[newequiv(
720963+cursize),43].int].int);mem[p].hh.rh:=x;mem[v+5].hh.rh:=p;
mem[v+3].int:=mem[v+3].int+fonttables[newequiv(720963+cursize),13+
fonttables[newequiv(720963+cursize),43].int].int+mem[x+3].int+mem[x+2].
int+shiftup;end;
if mem[q+3].hh.rh=0 then freenode(z,8)else begin shiftdown:=fonttables[
newequiv(720963+cursize),12+fonttables[newequiv(720963+cursize),43].int]
.int-mem[z+3].int;
if shiftdown<fonttables[newequiv(720963+cursize),10+fonttables[newequiv(
720963+cursize),43].int].int then shiftdown:=fonttables[newequiv(720963+
cursize),10+fonttables[newequiv(720963+cursize),43].int].int;
p:=newkern(shiftdown);mem[y].hh.rh:=p;mem[p].hh.rh:=z;
p:=newkern(fonttables[newequiv(720963+cursize),13+fonttables[newequiv(
720963+cursize),43].int].int);mem[z].hh.rh:=p;
mem[v+2].int:=mem[v+2].int+fonttables[newequiv(720963+cursize),13+
fonttables[newequiv(720963+cursize),43].int].int+mem[z+3].int+mem[z+2].
int+shiftdown;end{:785};mem[q+1].int:=v;end{:784};makeop:=delta;end;
{:783}{786:}procedure makeord(q:halfword);label 20,10;var a:integer;
p,r:halfword;
begin 20:if mem[q+3].hh.rh=0 then if mem[q+2].hh.rh=0 then if mem[q+1].
hh.rh=1 then begin p:=mem[q].hh.rh;
if p<>0 then if(mem[p].hh.b0>=16)and(mem[p].hh.b0<=22)then if mem[p+1].
hh.rh=1 then if mem[p+1].hh.b0=mem[q+1].hh.b0 then begin mem[q+1].hh.rh
:=4;fetch(q+1);
if((curi.b2)mod 4)=1 then begin a:=fonttables[curf,40].int+curi.b3;
curc:=mem[p+1].hh.b1;curi:=fonttables[curf,a].qqqq;
if(curi.b0 mod 256)>128 then begin a:=fonttables[curf,40].int+256*curi.
b2+curi.b3+32768-256*(128);curi:=fonttables[curf,a].qqqq;end;
while true do begin{787:}
if(fonttables[curf,5].int+curi.b1)=curc then if(curi.b0 mod 256)<=128
then if curi.b2>=128 then begin p:=newkern(fonttables[curf,fonttables[
curf,41].int+256*curi.b2+curi.b3].int);mem[p].hh.rh:=mem[q].hh.rh;
mem[q].hh.rh:=p;goto 10;
end else begin begin if interrupt<>0 then pauseforinstructions;end;
case curi.b2 of 1,5:mem[q+1].hh.b1:=curi.b3;2,6:mem[p+1].hh.b1:=curi.b3;
3,7,11:begin r:=newnoad;mem[r+1].hh.b1:=curi.b3;
mem[r+1].hh.b0:=mem[q+1].hh.b0;mem[q].hh.rh:=r;mem[r].hh.rh:=p;
if curi.b2<11 then mem[r+1].hh.rh:=1 else mem[r+1].hh.rh:=4;end;
others:begin mem[q].hh.rh:=mem[p].hh.rh;mem[q+1].hh.b1:=curi.b3;
mem[q+3]:=mem[p+3];mem[q+2]:=mem[p+2];freenode(p,4);end end;
if curi.b2>3 then goto 10;mem[q+1].hh.rh:=1;goto 20;end{:787};
if(curi.b0 mod 256)>=128 then goto 10;a:=a+(curi.b0 mod 256)+1;
curi:=fonttables[curf,a].qqqq;end;end;end;end;10:end;{:786}{790:}
procedure makescripts(q:halfword;delta:scaled);var p,x,y,z:halfword;
shiftup,shiftdown,clr:scaled;t:integer;begin p:=mem[q+1].int;
if(p>=himemmin)then begin shiftup:=0;shiftdown:=0;
end else begin z:=hpack(p,0,1);t:=cursize;
if curstyle<4 then cursize:=256 else cursize:=512;
shiftup:=mem[z+3].int-fonttables[newequiv(720962+cursize),18+fonttables[
newequiv(720962+cursize),43].int].int;
shiftdown:=mem[z+2].int+fonttables[newequiv(720962+cursize),19+
fonttables[newequiv(720962+cursize),43].int].int;cursize:=t;
freenode(z,8);end;if mem[q+2].hh.rh=0 then{791:}
begin x:=cleanbox(q+3,2*(curstyle div 4)+5);
mem[x+1].int:=mem[x+1].int+neweqtbsc(1180556+(12));
if shiftdown<fonttables[newequiv(720962+cursize),16+fonttables[newequiv(
720962+cursize),43].int].int then shiftdown:=fonttables[newequiv(720962+
cursize),16+fonttables[newequiv(720962+cursize),43].int].int;
clr:=mem[x+3].int-(abs(fonttables[newequiv(720962+cursize),5+fonttables[
newequiv(720962+cursize),43].int].int*4)div 5);
if shiftdown<clr then shiftdown:=clr;mem[x+4].int:=shiftdown;end{:791}
else begin{792:}
begin x:=cleanbox(q+2,2*(curstyle div 4)+4+(curstyle mod 2));
mem[x+1].int:=mem[x+1].int+neweqtbsc(1180556+(12));
if odd(curstyle)then clr:=fonttables[newequiv(720962+cursize),15+
fonttables[newequiv(720962+cursize),43].int].int else if curstyle<2 then
clr:=fonttables[newequiv(720962+cursize),13+fonttables[newequiv(720962+
cursize),43].int].int else clr:=fonttables[newequiv(720962+cursize),14+
fonttables[newequiv(720962+cursize),43].int].int;
if shiftup<clr then shiftup:=clr;
clr:=mem[x+2].int+(abs(fonttables[newequiv(720962+cursize),5+fonttables[
newequiv(720962+cursize),43].int].int)div 4);
if shiftup<clr then shiftup:=clr;end{:792};
if mem[q+3].hh.rh=0 then mem[x+4].int:=-shiftup else{793:}
begin y:=cleanbox(q+3,2*(curstyle div 4)+5);
mem[y+1].int:=mem[y+1].int+neweqtbsc(1180556+(12));
if shiftdown<fonttables[newequiv(720962+cursize),17+fonttables[newequiv(
720962+cursize),43].int].int then shiftdown:=fonttables[newequiv(720962+
cursize),17+fonttables[newequiv(720962+cursize),43].int].int;
clr:=4*fonttables[newequiv(720963+cursize),8+fonttables[newequiv(720963+
cursize),43].int].int-((shiftup-mem[x+2].int)-(mem[y+3].int-shiftdown));
if clr>0 then begin shiftdown:=shiftdown+clr;
clr:=(abs(fonttables[newequiv(720962+cursize),5+fonttables[newequiv(
720962+cursize),43].int].int*4)div 5)-(shiftup-mem[x+2].int);
if clr>0 then begin shiftup:=shiftup+clr;shiftdown:=shiftdown-clr;end;
end;mem[x+4].int:=delta;
p:=newkern((shiftup-mem[x+2].int)-(mem[y+3].int-shiftdown));
mem[x].hh.rh:=p;mem[p].hh.rh:=y;packdirection:=neweqtbint(1049483);
x:=vpackage(x,0,1,1073741823);mem[x+4].int:=shiftdown;end{:793};end;
if mem[q+1].int=0 then mem[q+1].int:=x else begin p:=mem[q+1].int;
while mem[p].hh.rh<>0 do p:=mem[p].hh.rh;mem[p].hh.rh:=x;end;end;{:790}
{796:}function makeleftright(q:halfword;style:integer;
maxd,maxh:scaled):integer;var delta,delta1,delta2:scaled;
begin curstyle:=style;{737:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);
curmu:=xovern(fonttables[newequiv(720962+cursize),6+fonttables[newequiv(
720962+cursize),43].int].int,18);end{:737};
delta2:=maxd+fonttables[newequiv(720962+cursize),22+fonttables[newequiv(
720962+cursize),43].int].int;delta1:=maxh+maxd-delta2;
if delta2>delta1 then delta1:=delta2;
delta:=(delta1 div 500)*neweqtbint(1049426);
delta2:=delta1+delta1-neweqtbsc(1180556+(10));
if delta<delta2 then delta:=delta2;
mem[q+1].int:=vardelimiter(q+1,cursize,delta);
makeleftright:=mem[q].hh.b0-(10);end;{:796}procedure mlisttohlist;
label 21,82,80,81,83,30;var mlist:halfword;penalties:boolean;
style:integer;savestyle:integer;q:halfword;r:halfword;rtype:integer;
t:integer;p,x,y,z:halfword;pen:integer;s:integer;maxh,maxd:scaled;
delta:scaled;begin mlist:=curmlist;penalties:=mlistpenalties;
style:=curstyle;q:=mlist;r:=0;rtype:=17;maxh:=0;maxd:=0;{737:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);
curmu:=xovern(fonttables[newequiv(720962+cursize),6+fonttables[newequiv(
720962+cursize),43].int].int,18);end{:737};while q<>0 do{761:}
begin{762:}21:delta:=0;
case mem[q].hh.b0 of 18:case rtype of 18,17,19,20,22,30:begin mem[q].hh.
b0:=16;goto 21;end;others:end;19,21,22,31:begin{763:}
if rtype=18 then mem[r].hh.b0:=16{:763};if mem[q].hh.b0=31 then goto 80;
end;{767:}30:goto 80;25:begin makefraction(q);goto 82;end;
17:begin delta:=makeop(q);if mem[q].hh.b1=1 then goto 82;end;
16:makeord(q);20,23:;24:makeradical(q);27:makeover(q);26:makeunder(q);
28:makemathaccent(q);29:makevcenter(q);{:767}{764:}
14:begin curstyle:=mem[q].hh.b1;{737:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);
curmu:=xovern(fonttables[newequiv(720962+cursize),6+fonttables[newequiv(
720962+cursize),43].int].int,18);end{:737};goto 81;end;15:{765:}
begin case curstyle div 2 of 0:begin p:=mem[q+1].hh.lh;
mem[q+1].hh.lh:=0;end;1:begin p:=mem[q+1].hh.rh;mem[q+1].hh.rh:=0;end;
2:begin p:=mem[q+2].hh.lh;mem[q+2].hh.lh:=0;end;
3:begin p:=mem[q+2].hh.rh;mem[q+2].hh.rh:=0;end;end;
flushnodelist(mem[q+1].hh.lh);flushnodelist(mem[q+1].hh.rh);
flushnodelist(mem[q+2].hh.lh);flushnodelist(mem[q+2].hh.rh);
mem[q].hh.b0:=14;mem[q].hh.b1:=curstyle;mem[q+1].int:=0;mem[q+2].int:=0;
if p<>0 then begin z:=mem[q].hh.rh;mem[q].hh.rh:=p;
while mem[p].hh.rh<>0 do p:=mem[p].hh.rh;mem[p].hh.rh:=z;end;goto 81;
end{:765};3,4,5,8,12,7:goto 81;
2:begin if mem[q+3].int>maxh then maxh:=mem[q+3].int;
if mem[q+2].int>maxd then maxd:=mem[q+2].int;goto 81;end;10:begin{766:}
if mem[q].hh.b1=99 then begin x:=mem[q+1].hh.lh;y:=mathglue(x,curmu);
deleteglueref(x);mem[q+1].hh.lh:=y;mem[q].hh.b1:=0;
end else if(cursize<>0)and(mem[q].hh.b1=98)then begin p:=mem[q].hh.rh;
if p<>0 then if(mem[p].hh.b0=10)or(mem[p].hh.b0=11)then begin mem[q].hh.
rh:=mem[p].hh.rh;mem[p].hh.rh:=0;flushnodelist(p);end;end{:766};goto 81;
end;11:begin mathkern(q,curmu);goto 81;end;{:764}
others:confusion(66248)end;{788:}case mem[q+1].hh.rh of 1,4:{789:}
begin fetch(q+1);
if(curi.b0>0)then begin delta:=fonttables[curf,fonttables[curf,39].int+(
curi.b2)div 256].int;p:=newcharacter(curf,curc);
if(mem[q+1].hh.rh=4)and(fonttables[curf,fonttables[curf,43].int+2].int<>
0)then delta:=0;
if(mem[q+3].hh.rh=0)and(delta<>0)then begin mem[p].hh.rh:=newkern(delta)
;delta:=0;end;end else p:=0;end{:789};0:p:=0;2:p:=mem[q+1].hh.lh;
3:begin curmlist:=mem[q+1].hh.lh;savestyle:=curstyle;
mlistpenalties:=false;mlisttohlist;curstyle:=savestyle;{737:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);
curmu:=xovern(fonttables[newequiv(720962+cursize),6+fonttables[newequiv(
720962+cursize),43].int].int,18);end{:737};
p:=hpack(mem[memtop-3].hh.rh,0,1);end;others:confusion(66249)end;
mem[q+1].int:=p;if(mem[q+3].hh.rh=0)and(mem[q+2].hh.rh=0)then goto 82;
makescripts(q,delta){:788}{:762};82:z:=hpack(mem[q+1].int,0,1);
if mem[z+3].int>maxh then maxh:=mem[z+3].int;
if mem[z+2].int>maxd then maxd:=mem[z+2].int;freenode(z,8);80:r:=q;
rtype:=mem[r].hh.b0;if rtype=31 then begin rtype:=30;curstyle:=style;
{737:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);
curmu:=xovern(fonttables[newequiv(720962+cursize),6+fonttables[newequiv(
720962+cursize),43].int].int,18);end{:737};end;81:q:=mem[q].hh.rh;
end{:761};{763:}if rtype=18 then mem[r].hh.b0:=16{:763};{794:}
p:=memtop-3;mem[p].hh.rh:=0;q:=mlist;rtype:=0;curstyle:=style;{737:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);
curmu:=xovern(fonttables[newequiv(720962+cursize),6+fonttables[newequiv(
720962+cursize),43].int].int,18);end{:737};while q<>0 do begin{795:}
t:=16;s:=4;pen:=10000;
case mem[q].hh.b0 of 17,20,21,22,23:t:=mem[q].hh.b0;18:begin t:=18;
pen:=neweqtbint(1049417);end;19:begin t:=19;pen:=neweqtbint(1049418);
end;16,29,27,26:;24:s:=5;28:s:=5;25:s:=6;
30,31:t:=makeleftright(q,style,maxd,maxh);14:{797:}
begin curstyle:=mem[q].hh.b1;s:=3;{737:}
begin if curstyle<4 then cursize:=0 else cursize:=256*((curstyle-2)div 2
);
curmu:=xovern(fonttables[newequiv(720962+cursize),6+fonttables[newequiv(
720962+cursize),43].int].int,18);end{:737};goto 83;end{:797};
8,12,2,7,5,3,4,10,11:begin mem[p].hh.rh:=q;p:=q;q:=mem[q].hh.rh;
mem[p].hh.rh:=0;goto 30;end;others:confusion(66250)end{:795};{800:}
if rtype>0 then begin case strpool[rtype*8+t+magicoffset]of 48:x:=0;
49:if curstyle<4 then x:=15 else x:=0;50:x:=15;
51:if curstyle<4 then x:=16 else x:=0;
52:if curstyle<4 then x:=17 else x:=0;others:confusion(66252)end;
if x<>0 then begin y:=mathglue(newequiv(393230+x),curmu);z:=newglue(y);
mem[y].hh.rh:=0;mem[p].hh.rh:=z;p:=z;mem[z].hh.b1:=x+1;end;end{:800};
{801:}if mem[q+1].int<>0 then begin mem[p].hh.rh:=mem[q+1].int;
repeat p:=mem[p].hh.rh;until mem[p].hh.rh=0;end;
if penalties then if mem[q].hh.rh<>0 then if pen<10000 then begin rtype
:=mem[mem[q].hh.rh].hh.b0;
if rtype<>12 then if rtype<>19 then begin z:=newpenalty(pen);
mem[p].hh.rh:=z;p:=z;end;end{:801};if mem[q].hh.b0=31 then t:=20;
rtype:=t;83:r:=q;q:=mem[q].hh.rh;freenode(r,s);30:end{:794};end;{:760}
{806:}procedure pushalignment;var p:halfword;begin p:=getnode(5);
mem[p].hh.rh:=alignptr;mem[p].hh.lh:=curalign;
mem[p+1].hh.lh:=mem[memtop-8].hh.rh;mem[p+1].hh.rh:=curspan;
mem[p+2].int:=curloop;mem[p+3].int:=alignstate;mem[p+4].hh.lh:=curhead;
mem[p+4].hh.rh:=curtail;alignptr:=p;curhead:=getavail;end;
procedure popalignment;var p:halfword;
begin begin mem[curhead].hh.rh:=avail;avail:=curhead;
ifdef('STAT')decr(dynused);endif('STAT')end;p:=alignptr;
curtail:=mem[p+4].hh.rh;curhead:=mem[p+4].hh.lh;
alignstate:=mem[p+3].int;curloop:=mem[p+2].int;curspan:=mem[p+1].hh.rh;
mem[memtop-8].hh.rh:=mem[p+1].hh.lh;curalign:=mem[p].hh.lh;
alignptr:=mem[p].hh.rh;freenode(p,5);end;{:806}{808:}{816:}
procedure getpreambletoken;label 20;begin 20:gettoken;
while(curchr=65537)and(curcmd=4)do begin gettoken;
if curcmd>117 then begin expand;gettoken;end;end;
if curcmd=9 then fatalerror(65904);
if(curcmd=78)and(curchr=393241)then begin scanoptionalequals;
scanglue(2);
if neweqtbint(1049451)>0 then geqdefine(393241,134,curval)else eqdefine(
393241,134,curval);goto 20;end;end;{:816}procedure alignpeek;forward;
procedure normalparagraph;forward;procedure initalign;label 30,31,32,22;
var savecsptr:halfword;p:halfword;begin savecsptr:=curcs;pushalignment;
alignstate:=-1000000;{810:}
if(curlist.modefield=237)and((curlist.tailfield<>curlist.headfield)or(
curlist.auxfield.int<>0))then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65997);end;printesc(65815);print(66253);begin helpptr:=3;
helpline[2]:=66254;helpline[1]:=66255;helpline[0]:=66256;end;error;
flushmath;end{:810};pushnest;{809:}
if curlist.modefield=237 then begin curlist.modefield:=-1;
curlist.auxfield.int:=nest[nestptr-2].auxfield.int;
end else if curlist.modefield>0 then curlist.modefield:=-curlist.
modefield{:809};scanspec(6,false);{811:}mem[memtop-8].hh.rh:=0;
curalign:=memtop-8;curloop:=0;scannerstatus:=4;warningindex:=savecsptr;
alignstate:=-1000000;while true do begin{812:}
mem[curalign].hh.rh:=newparamglue(11);
curalign:=mem[curalign].hh.rh{:812};if curcmd=5 then goto 30;{813:}
{817:}p:=memtop-4;mem[p].hh.rh:=0;while true do begin getpreambletoken;
if curcmd=6 then goto 31;
if(curcmd<=5)and(curcmd>=4)and(alignstate=-1000000)then if(p=memtop-4)
and(curloop=0)and(curcmd=4)then curloop:=curalign else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66262);end;begin helpptr:=3;helpline[2]:=66263;helpline[1]:=66264;
helpline[0]:=66265;end;backerror;goto 31;
end else if(curcmd<>10)or(p<>memtop-4)then begin mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=curtok;end;end;31:{:817};
mem[curalign].hh.rh:=newnullbox;curalign:=mem[curalign].hh.rh;
mem[curalign].hh.lh:=memtop-9;mem[curalign+1].int:=-1073741824;
mem[curalign+3].int:=mem[memtop-4].hh.rh;{818:}p:=memtop-4;
mem[p].hh.rh:=0;while true do begin 22:getpreambletoken;
if(curcmd<=5)and(curcmd>=4)and(alignstate=-1000000)then goto 32;
if curcmd=6 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66266);end;begin helpptr:=3;helpline[2]:=66263;helpline[1]:=66264;
helpline[0]:=66267;end;error;goto 22;end;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=curtok;end;32:mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=1245190{:818};
mem[curalign+2].int:=mem[memtop-4].hh.rh{:813};end;
30:scannerstatus:=0{:811};newsavelevel(6);
if newequiv(524332)<>0 then begintokenlist(newequiv(524332),13);
alignpeek;end;{:808}{820:}{821:}procedure initspan(p:halfword);
begin pushnest;
if curlist.modefield=-119 then curlist.auxfield.hh.lh:=1000 else begin
curlist.auxfield.int:=-65536000;normalparagraph;end;curspan:=p;end;
{:821}procedure initrow;begin pushnest;
curlist.modefield:=(-120)-curlist.modefield;
if curlist.modefield=-119 then curlist.auxfield.hh.lh:=0 else curlist.
auxfield.int:=0;
begin mem[curlist.tailfield].hh.rh:=newglue(mem[mem[memtop-8].hh.rh+1].
hh.lh);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=12;
curalign:=mem[mem[memtop-8].hh.rh].hh.rh;curtail:=curhead;
initspan(curalign);end;{:820}{822:}procedure initcol;
begin mem[curalign+5].hh.lh:=curcmd;
if curcmd=63 then alignstate:=0 else begin backinput;
begintokenlist(mem[curalign+3].int,1);end;end;{:822}{825:}
function fincol:boolean;label 10;var p:halfword;q,r:halfword;s:halfword;
u:halfword;w:scaled;o:glueord;n:halfword;
begin if curalign=0 then confusion(66268);q:=mem[curalign].hh.rh;
if q=0 then confusion(66268);
if alignstate<500000 then fatalerror(65904);p:=mem[q].hh.rh;{826:}
if(p=0)and(mem[curalign+5].hh.lh<65538)then if curloop<>0 then{827:}
begin mem[q].hh.rh:=newnullbox;p:=mem[q].hh.rh;mem[p].hh.lh:=memtop-9;
mem[p+1].int:=-1073741824;curloop:=mem[curloop].hh.rh;{828:}q:=memtop-4;
r:=mem[curloop+3].int;while r<>0 do begin mem[q].hh.rh:=getavail;
q:=mem[q].hh.rh;mem[q].hh.lh:=mem[r].hh.lh;r:=mem[r].hh.rh;end;
mem[q].hh.rh:=0;mem[p+3].int:=mem[memtop-4].hh.rh;q:=memtop-4;
r:=mem[curloop+2].int;while r<>0 do begin mem[q].hh.rh:=getavail;
q:=mem[q].hh.rh;mem[q].hh.lh:=mem[r].hh.lh;r:=mem[r].hh.rh;end;
mem[q].hh.rh:=0;mem[p+2].int:=mem[memtop-4].hh.rh{:828};
curloop:=mem[curloop].hh.rh;mem[p].hh.rh:=newglue(mem[curloop+1].hh.lh);
mem[mem[p].hh.rh].hh.b1:=12;end{:827}
else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66269);end;printesc(66258);begin helpptr:=3;helpline[2]:=66270;
helpline[1]:=66271;helpline[0]:=66272;end;mem[curalign+5].hh.lh:=65538;
error;end{:826};if mem[curalign+5].hh.lh<>65537 then begin unsave;
newsavelevel(6);{830:}
begin if curlist.modefield=-119 then begin adjusttail:=curtail;
u:=hpack(mem[curlist.headfield].hh.rh,0,1);w:=mem[u+1].int;
curtail:=adjusttail;adjusttail:=0;
end else begin u:=vpackage(mem[curlist.headfield].hh.rh,0,1,0);
w:=mem[u+3].int;end;n:=0;if curspan<>curalign then{832:}
begin q:=curspan;repeat incr(n);q:=mem[mem[q].hh.rh].hh.rh;
until q=curalign;if n>65535 then confusion(66273);q:=curspan;
while mem[mem[q].hh.lh].hh.rh<n do q:=mem[q].hh.lh;
if mem[mem[q].hh.lh].hh.rh>n then begin s:=getnode(2);
mem[s].hh.lh:=mem[q].hh.lh;mem[s].hh.rh:=n;mem[q].hh.lh:=s;
mem[s+1].int:=w;
end else if mem[mem[q].hh.lh+1].int<w then mem[mem[q].hh.lh+1].int:=w;
end{:832}else if w>mem[curalign+1].int then mem[curalign+1].int:=w;
mem[u].hh.b0:=13;mem[u].hh.b1:=n;{693:}
if totalstretch[4]<>0 then o:=4 else if totalstretch[3]<>0 then o:=3
else if totalstretch[2]<>0 then o:=2 else if totalstretch[1]<>0 then o:=
1 else o:=0{:693};mem[u+5].hh.b1:=o;mem[u+6].int:=totalstretch[o];{699:}
if totalshrink[4]<>0 then o:=4 else if totalshrink[3]<>0 then o:=3 else
if totalshrink[2]<>0 then o:=2 else if totalshrink[1]<>0 then o:=1 else
o:=0{:699};mem[u+5].hh.b0:=o;mem[u+4].int:=totalshrink[o];popnest;
mem[curlist.tailfield].hh.rh:=u;curlist.tailfield:=u;end{:830};{829:}
begin mem[curlist.tailfield].hh.rh:=newglue(mem[mem[curalign].hh.rh+1].
hh.lh);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=12{:829};
if mem[curalign+5].hh.lh>=65538 then begin fincol:=true;goto 10;end;
initspan(p);end;alignstate:=1000000;repeat getxorprotected;
until curcmd<>10;curalign:=p;initcol;fincol:=false;10:end;{:825}{833:}
procedure finrow;var p:halfword;
begin if curlist.modefield=-119 then begin p:=hpack(mem[curlist.
headfield].hh.rh,0,1);popnest;appendtovlist(p);
if curhead<>curtail then begin mem[curlist.tailfield].hh.rh:=mem[curhead
].hh.rh;curlist.tailfield:=curtail;end;
end else begin p:=vpackage(mem[curlist.headfield].hh.rh,0,1,1073741823);
popnest;mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
curlist.auxfield.hh.lh:=1000;end;mem[p].hh.b0:=13;mem[p+6].int:=0;
if newequiv(524332)<>0 then begintokenlist(newequiv(524332),13);
alignpeek;end;{:833}{834:}procedure doassignments;forward;
procedure resumeafterdisplay;forward;procedure buildpage;forward;
procedure finalign;var p,q,r,s,u,v:halfword;t,w:scaled;o:scaled;
n:halfword;rulesave:scaled;auxsave:memoryword;
begin if curgroup<>6 then confusion(66274);unsave;
if curgroup<>6 then confusion(66275);unsave;
if nest[nestptr-1].modefield=237 then o:=neweqtbsc(1180556+(15))else o:=
0;{835:}q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat flushlist(mem[q+3].int);flushlist(mem[q+2].int);
p:=mem[mem[q].hh.rh].hh.rh;if mem[q+1].int=-1073741824 then{836:}
begin mem[q+1].int:=0;r:=mem[q].hh.rh;s:=mem[r+1].hh.lh;
if s<>membot then begin incr(mem[membot].hh.rh);deleteglueref(s);
mem[r+1].hh.lh:=membot;end;end{:836};
if mem[q].hh.lh<>memtop-9 then{837:}
begin t:=mem[q+1].int+mem[mem[mem[q].hh.rh+1].hh.lh+1].int;
r:=mem[q].hh.lh;s:=memtop-9;mem[s].hh.lh:=p;n:=1;
repeat mem[r+1].int:=mem[r+1].int-t;u:=mem[r].hh.lh;
while mem[r].hh.rh>n do begin s:=mem[s].hh.lh;
n:=mem[mem[s].hh.lh].hh.rh+1;end;
if mem[r].hh.rh<n then begin mem[r].hh.lh:=mem[s].hh.lh;mem[s].hh.lh:=r;
decr(mem[r].hh.rh);s:=r;
end else begin if mem[r+1].int>mem[mem[s].hh.lh+1].int then mem[mem[s].
hh.lh+1].int:=mem[r+1].int;freenode(r,2);end;r:=u;until r=memtop-9;
end{:837};mem[q].hh.b0:=13;mem[q].hh.b1:=0;mem[q+3].int:=0;
mem[q+2].int:=0;mem[q+5].hh.b1:=0;mem[q+5].hh.b0:=0;mem[q+6].int:=0;
mem[q+4].int:=0;q:=p;until q=0{:835};{838:}saveptr:=saveptr-2;
packbeginline:=-curlist.mlfield;
if curlist.modefield=-1 then begin rulesave:=neweqtbsc(1180556+(16));
setneweqtbsc(1180572,0);
p:=hpack(mem[memtop-8].hh.rh,savestack[saveptr+1].int,savestack[saveptr
+0].int);setneweqtbsc(1180572,rulesave);
end else begin q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat mem[q+3].int:=mem[q+1].int;mem[q+1].int:=0;
q:=mem[mem[q].hh.rh].hh.rh;until q=0;
p:=vpackage(mem[memtop-8].hh.rh,savestack[saveptr+1].int,savestack[
saveptr+0].int,1073741823);q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat mem[q+1].int:=mem[q+3].int;mem[q+3].int:=0;
q:=mem[mem[q].hh.rh].hh.rh;until q=0;end;packbeginline:=0{:838};{839:}
q:=mem[curlist.headfield].hh.rh;s:=curlist.headfield;
while q<>0 do begin if not(q>=himemmin)then if mem[q].hh.b0=13 then{841:
}begin if curlist.modefield=-1 then begin mem[q].hh.b0:=0;
mem[q+1].int:=mem[p+1].int;end else begin mem[q].hh.b0:=1;
mem[q+3].int:=mem[p+3].int;end;mem[q+5].hh.b1:=mem[p+5].hh.b1;
mem[q+5].hh.b0:=mem[p+5].hh.b0;mem[q+6].gr:=mem[p+6].gr;mem[q+4].int:=o;
r:=mem[mem[q+5].hh.rh].hh.rh;s:=mem[mem[p+5].hh.rh].hh.rh;repeat{842:}
n:=mem[r].hh.b1;t:=mem[s+1].int;w:=t;u:=memtop-4;
while n>0 do begin decr(n);{843:}s:=mem[s].hh.rh;v:=mem[s+1].hh.lh;
mem[u].hh.rh:=newglue(v);u:=mem[u].hh.rh;mem[u].hh.b1:=12;
t:=t+mem[v+1].int;
if mem[p+5].hh.b0=1 then begin if mem[v].hh.b0=mem[p+5].hh.b1 then t:=t+
round(mem[p+6].gr*mem[v+2].int);
end else if mem[p+5].hh.b0=2 then begin if mem[v].hh.b1=mem[p+5].hh.b1
then t:=t-round(mem[p+6].gr*mem[v+3].int);end;s:=mem[s].hh.rh;
mem[u].hh.rh:=newnullbox;u:=mem[u].hh.rh;t:=t+mem[s+1].int;
if curlist.modefield=-1 then mem[u+1].int:=mem[s+1].int else begin mem[u
].hh.b0:=1;mem[u+3].int:=mem[s+1].int;end{:843};end;
if curlist.modefield=-1 then{844:}begin mem[r+3].int:=mem[q+3].int;
mem[r+2].int:=mem[q+2].int;
if t=mem[r+1].int then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;
end else if t>mem[r+1].int then begin mem[r+5].hh.b0:=1;
if mem[r+6].int=0 then mem[r+6].gr:=0.0 else mem[r+6].gr:=(t-mem[r+1].
int)/mem[r+6].int;end else begin mem[r+5].hh.b1:=mem[r+5].hh.b0;
mem[r+5].hh.b0:=2;
if mem[r+4].int=0 then mem[r+6].gr:=0.0 else if(mem[r+5].hh.b1=0)and(mem
[r+1].int-t>mem[r+4].int)then mem[r+6].gr:=1.0 else mem[r+6].gr:=(mem[r
+1].int-t)/mem[r+4].int;end;mem[r+1].int:=w;mem[r].hh.b0:=0;end{:844}
else{845:}begin mem[r+1].int:=mem[q+1].int;
if t=mem[r+3].int then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;
end else if t>mem[r+3].int then begin mem[r+5].hh.b0:=1;
if mem[r+6].int=0 then mem[r+6].gr:=0.0 else mem[r+6].gr:=(t-mem[r+3].
int)/mem[r+6].int;end else begin mem[r+5].hh.b1:=mem[r+5].hh.b0;
mem[r+5].hh.b0:=2;
if mem[r+4].int=0 then mem[r+6].gr:=0.0 else if(mem[r+5].hh.b1=0)and(mem
[r+3].int-t>mem[r+4].int)then mem[r+6].gr:=1.0 else mem[r+6].gr:=(mem[r
+3].int-t)/mem[r+4].int;end;mem[r+3].int:=w;mem[r].hh.b0:=1;end{:845};
mem[r+4].int:=0;if u<>memtop-4 then begin mem[u].hh.rh:=mem[r].hh.rh;
mem[r].hh.rh:=mem[memtop-4].hh.rh;r:=u;end{:842};
r:=mem[mem[r].hh.rh].hh.rh;s:=mem[mem[s].hh.rh].hh.rh;until r=0;
end{:841}else if mem[q].hh.b0=2 then{840:}
begin if(mem[q+1].int=-1073741824)then mem[q+1].int:=mem[p+1].int;
if(mem[q+3].int=-1073741824)then mem[q+3].int:=mem[p+3].int;
if(mem[q+2].int=-1073741824)then mem[q+2].int:=mem[p+2].int;
if o<>0 then begin r:=mem[q].hh.rh;mem[q].hh.rh:=0;q:=hpack(q,0,1);
mem[q+4].int:=o;mem[q].hh.rh:=r;mem[s].hh.rh:=q;end;end{:840};s:=q;
q:=mem[q].hh.rh;end{:839};flushnodelist(p);popalignment;{846:}
auxsave:=curlist.auxfield;p:=mem[curlist.headfield].hh.rh;
q:=curlist.tailfield;popnest;if curlist.modefield=237 then{1243:}
begin doassignments;if curcmd<>3 then{1244:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66534);end;begin helpptr:=2;helpline[1]:=66254;helpline[0]:=66255;
end;backerror;end{:1244}else{1234:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66530);end;begin helpptr:=2;helpline[1]:=66531;helpline[0]:=66532;
end;backerror;end;end{:1234};popnest;
begin mem[curlist.tailfield].hh.rh:=newpenalty(neweqtbint(1049419));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newparamglue(3);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.rh:=p;if p<>0 then curlist.tailfield:=q;
begin mem[curlist.tailfield].hh.rh:=newpenalty(neweqtbint(1049420));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newparamglue(4);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.auxfield.int:=auxsave.int;resumeafterdisplay;end{:1243}
else begin curlist.auxfield:=auxsave;mem[curlist.tailfield].hh.rh:=p;
if p<>0 then curlist.tailfield:=q;if curlist.modefield=1 then buildpage;
end{:846};end;{819:}procedure alignpeek;label 20;
begin 20:alignstate:=1000000;repeat getxorprotected;until curcmd<>10;
if curcmd=34 then begin scanleftbrace;newsavelevel(7);
if curlist.modefield=-1 then normalparagraph;
end else if curcmd=2 then finalign else if(curcmd=5)and(curchr=65539)
then goto 20 else begin initrow;initcol;end;end;{:819}{:834}{850:}{861:}
function finiteshrink(p:halfword):halfword;var q:halfword;
begin if noshrinkerroryet then begin noshrinkerroryet:=false;
ifdef('STAT')if neweqtbint(1049440)>0 then enddiagnostic(true);
endif('STAT')begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66276);end;begin helpptr:=5;helpline[4]:=66277;helpline[3]:=66278;
helpline[2]:=66279;helpline[1]:=66280;helpline[0]:=66281;end;error;
ifdef('STAT')if neweqtbint(1049440)>0 then begindiagnostic;
endif('STAT')end;q:=newspec(p);mem[q].hh.b1:=0;deleteglueref(p);
finiteshrink:=q;end;{:861}{864:}procedure trybreak(pi:integer;
breaktype:smallnumber);label 10,30,31,22,60,40,45;var r:halfword;
prevr:halfword;oldl:halfword;nobreakyet:boolean;{865:}
prevprevr:halfword;s:halfword;q:halfword;v:halfword;t:integer;
f:internalfontnumber;l:halfword;noderstaysactive:boolean;
linewidth:scaled;fitclass:0..3;b:halfword;d:integer;
artificialdemerits:boolean;savelink:halfword;shortfall:scaled;{:865}
{1601:}g:scaled;{:1601}begin{866:}
if abs(pi)>=10000 then if pi>0 then goto 10 else pi:=-10000{:866};
nobreakyet:=true;prevr:=memtop-7;oldl:=0;
curactivewidth[1]:=activewidth[1];curactivewidth[2]:=activewidth[2];
curactivewidth[3]:=activewidth[3];curactivewidth[4]:=activewidth[4];
curactivewidth[5]:=activewidth[5];curactivewidth[6]:=activewidth[6];
curactivewidth[7]:=activewidth[7];
while true do begin 22:r:=mem[prevr].hh.rh;{867:}
if mem[r].hh.b0=2 then begin curactivewidth[1]:=curactivewidth[1]+mem[r
+1].int;curactivewidth[2]:=curactivewidth[2]+mem[r+2].int;
curactivewidth[3]:=curactivewidth[3]+mem[r+3].int;
curactivewidth[4]:=curactivewidth[4]+mem[r+4].int;
curactivewidth[5]:=curactivewidth[5]+mem[r+5].int;
curactivewidth[6]:=curactivewidth[6]+mem[r+6].int;
curactivewidth[7]:=curactivewidth[7]+mem[r+7].int;prevprevr:=prevr;
prevr:=r;goto 22;end{:867};{870:}begin l:=mem[r+1].hh.lh;
if l>oldl then begin if(minimumdemerits<1073741823)and((oldl<>easyline)
or(r=memtop-7))then{871:}begin if nobreakyet then{872:}
begin nobreakyet:=false;breakwidth[1]:=background[1];
breakwidth[2]:=background[2];breakwidth[3]:=background[3];
breakwidth[4]:=background[4];breakwidth[5]:=background[5];
breakwidth[6]:=background[6];breakwidth[7]:=background[7];s:=curp;
if breaktype>0 then if curp<>0 then{875:}begin t:=mem[curp].hh.b1;
v:=curp;s:=mem[curp+1].hh.rh;while t>0 do begin decr(t);v:=mem[v].hh.rh;
{876:}if(v>=himemmin)then begin f:=mem[v].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[v].hh.b1].qqqq.b1;
breakwidth[1]:=breakwidth[1]-fonttables[f,fonttables[f,37].int+(
breakchtdp)div 256].int-fonttables[f,fonttables[f,38].int+(breakchtdp)
mod 256].int;
end else breakwidth[1]:=breakwidth[1]-fonttables[f,fonttables[f,36].int+
fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[v].hh.b1].qqqq
.b0].int;end else case mem[v].hh.b0 of 6:begin f:=mem[v+1].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[v+1].hh.b1].qqqq.b1;
breakwidth[1]:=breakwidth[1]-fonttables[f,fonttables[f,37].int+(
breakchtdp)div 256].int-fonttables[f,fonttables[f,38].int+(breakchtdp)
mod 256].int;
end else breakwidth[1]:=breakwidth[1]-fonttables[f,fonttables[f,36].int+
fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[v+1].hh.b1].
qqqq.b0].int;end;
0,1:if not(((dirprimary[mem[v+7].int])mod 2)<>(dirprimary[linebreakdir]
mod 2))then breakwidth[1]:=breakwidth[1]-mem[v+1].int else breakwidth[1]
:=breakwidth[1]-(mem[v+2].int+mem[v+3].int);
2,11:breakwidth[1]:=breakwidth[1]-mem[v+1].int;
others:confusion(66282)end{:876};end;while s<>0 do begin{877:}
if(s>=himemmin)then begin f:=mem[s].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[s].hh.b1].qqqq.b1;
breakwidth[1]:=breakwidth[1]+fonttables[f,fonttables[f,37].int+(
breakchtdp)div 256].int+fonttables[f,fonttables[f,38].int+(breakchtdp)
mod 256].int;
end else breakwidth[1]:=breakwidth[1]+fonttables[f,fonttables[f,36].int+
fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[s].hh.b1].qqqq
.b0].int;end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[s+1].hh.b1].qqqq.b1;
breakwidth[1]:=breakwidth[1]+fonttables[f,fonttables[f,37].int+(
breakchtdp)div 256].int+fonttables[f,fonttables[f,38].int+(breakchtdp)
mod 256].int;
end else breakwidth[1]:=breakwidth[1]+fonttables[f,fonttables[f,36].int+
fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[s+1].hh.b1].
qqqq.b0].int;end;
0,1:if not(((dirprimary[mem[s+7].int])mod 2)<>(dirprimary[linebreakdir]
mod 2))then breakwidth[1]:=breakwidth[1]+mem[s+1].int else breakwidth[1]
:=breakwidth[1]+(mem[s+2].int+mem[s+3].int);
2,11:breakwidth[1]:=breakwidth[1]+mem[s+1].int;
others:confusion(66283)end{:877};s:=mem[s].hh.rh;end;
breakwidth[1]:=breakwidth[1]+discwidth;
if mem[curp+1].hh.rh=0 then s:=mem[v].hh.rh;end{:875};
while s<>0 do begin if(s>=himemmin)then goto 30;
case mem[s].hh.b0 of 10:{873:}begin v:=mem[s+1].hh.lh;
breakwidth[1]:=breakwidth[1]-mem[v+1].int;
breakwidth[2+mem[v].hh.b0]:=breakwidth[2+mem[v].hh.b0]-mem[v+2].int;
breakwidth[7]:=breakwidth[7]-mem[v+3].int;end{:873};12:;
9:breakwidth[1]:=breakwidth[1]-mem[s+1].int;
11:if mem[s].hh.b1<>1 then goto 30 else breakwidth[1]:=breakwidth[1]-mem
[s+1].int;others:goto 30 end;s:=mem[s].hh.rh;end;30:end{:872};{878:}
if mem[prevr].hh.b0=2 then begin mem[prevr+1].int:=mem[prevr+1].int-
curactivewidth[1]+breakwidth[1];
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
prevprevr:=prevr;prevr:=q;end{:878};
if abs(neweqtbint(1049424))>=1073741823-minimumdemerits then
minimumdemerits:=1073741822 else minimumdemerits:=minimumdemerits+abs(
neweqtbint(1049424));
for fitclass:=0 to 3 do begin if minimaldemerits[fitclass]<=
minimumdemerits then{880:}begin q:=getnode(10);mem[q].hh.rh:=passive;
passive:=q;mem[q+1].hh.rh:=curp;ifdef('STAT')incr(passnumber);
mem[q].hh.lh:=passnumber;
endif('STAT')mem[q+1].hh.lh:=bestplace[fitclass];
mem[q+2].int:=internalpeninter;mem[q+3].int:=internalpenbroken;
mem[q+6].int:=internalleftbox;mem[q+7].int:=internalleftboxwidth;
if mem[q+1].hh.lh<>0 then begin mem[q+4].int:=mem[mem[q+1].hh.lh+6].int;
mem[q+5].int:=mem[mem[q+1].hh.lh+7].int;
end else begin mem[q+4].int:=initinternalleftbox;
mem[q+5].int:=initinternalleftboxwidth;end;
mem[q+8].int:=internalrightbox;mem[q+9].int:=internalrightboxwidth;
q:=getnode(activenodesize);mem[q+1].hh.rh:=passive;
mem[q+1].hh.lh:=bestplline[fitclass]+1;mem[q].hh.b1:=fitclass;
mem[q].hh.b0:=breaktype;mem[q+2].int:=minimaldemerits[fitclass];
if dolastlinefit then{1608:}begin mem[q+3].int:=bestplshort[fitclass];
mem[q+4].int:=bestplglue[fitclass];end{:1608};mem[q].hh.rh:=r;
mem[prevr].hh.rh:=q;prevr:=q;
ifdef('STAT')if neweqtbint(1049440)>0 then{881:}begin printnl(66284);
printint(mem[passive].hh.lh);print(66285);printint(mem[q+1].hh.lh-1);
printchar(46);printint(fitclass);if breaktype=1 then printchar(45);
print(66286);printint(mem[q+2].int);if dolastlinefit then{1609:}
begin print(66793);printscaled(mem[q+3].int);
if curp=0 then print(66794)else print(66356);printscaled(mem[q+4].int);
end{:1609};print(66287);
if mem[passive+1].hh.lh=0 then printchar(48)else printint(mem[mem[
passive+1].hh.lh].hh.lh);end{:881};endif('STAT')end{:880};
minimaldemerits[fitclass]:=1073741823;end;minimumdemerits:=1073741823;
{879:}if r<>memtop-7 then begin q:=getnode(8);mem[q].hh.rh:=r;
mem[q].hh.b0:=2;mem[q].hh.b1:=0;
mem[q+1].int:=curactivewidth[1]-breakwidth[1];
mem[q+2].int:=curactivewidth[2]-breakwidth[2];
mem[q+3].int:=curactivewidth[3]-breakwidth[3];
mem[q+4].int:=curactivewidth[4]-breakwidth[4];
mem[q+5].int:=curactivewidth[5]-breakwidth[5];
mem[q+6].int:=curactivewidth[6]-breakwidth[6];
mem[q+7].int:=curactivewidth[7]-breakwidth[7];mem[prevr].hh.rh:=q;
prevprevr:=prevr;prevr:=q;end{:879};end{:871};
if r=memtop-7 then goto 10;{885:}
if l>easyline then begin linewidth:=secondwidth;oldl:=1073741822;
end else begin oldl:=l;
if l>lastspecialline then linewidth:=secondwidth else if newequiv(524320
)=0 then linewidth:=firstwidth else linewidth:=mem[newequiv(524320)+2*l]
.int;end{:885};end;end{:870};{886:}begin artificialdemerits:=false;
shortfall:=linewidth-curactivewidth[1];
if mem[r+1].hh.rh=0 then shortfall:=shortfall-initinternalleftboxwidth
else shortfall:=shortfall-mem[mem[r+1].hh.rh+7].int;
shortfall:=shortfall-internalrightboxwidth;if shortfall>0 then{887:}
if(curactivewidth[3]<>0)or(curactivewidth[4]<>0)or(curactivewidth[5]<>0)
or(curactivewidth[6]<>0)then begin if dolastlinefit then begin if curp=0
then{1603:}begin if(mem[r+3].int=0)or(mem[r+4].int<=0)then goto 45;
if(curactivewidth[3]<>fillwidth[0])or(curactivewidth[4]<>fillwidth[1])or
(curactivewidth[5]<>fillwidth[2])then goto 45;
if mem[r+3].int>0 then g:=curactivewidth[2]else g:=curactivewidth[6];
if g<=0 then goto 45;aritherror:=false;
g:=fract(g,mem[r+3].int,mem[r+4].int,1073741823);
if neweqtbint(1049475)<1000 then g:=fract(g,neweqtbint(1049475),1000,
1073741823);
if aritherror then if mem[r+3].int>0 then g:=1073741823 else g:=
-1073741823;if g>0 then{1604:}begin if g>shortfall then g:=shortfall;
if g>7230584 then if curactivewidth[2]<1663497 then begin b:=10000;
fitclass:=0;goto 40;end;b:=badness(g,curactivewidth[2]);
if b>12 then if b>99 then fitclass:=0 else fitclass:=1 else fitclass:=2;
goto 40;end{:1604}else if g<0 then{1605:}
begin if-g>curactivewidth[6]then g:=-curactivewidth[6];
b:=badness(-g,curactivewidth[6]);
if b>12 then fitclass:=3 else fitclass:=2;goto 40;end{:1605};
45:end{:1603};shortfall:=0;end;b:=0;fitclass:=2;
end else begin if shortfall>7230584 then if curactivewidth[2]<1663497
then begin b:=10000;fitclass:=0;goto 31;end;
b:=badness(shortfall,curactivewidth[2]);
if b>12 then if b>99 then fitclass:=0 else fitclass:=1 else fitclass:=2;
31:end{:887}else{888:}
begin if-shortfall>curactivewidth[7]then b:=10001 else b:=badness(-
shortfall,curactivewidth[7]);if b>12 then fitclass:=3 else fitclass:=2;
end{:888};if dolastlinefit then{1606:}begin if curp=0 then shortfall:=0;
if shortfall>0 then g:=curactivewidth[2]else if shortfall<0 then g:=
curactivewidth[6]else g:=0;end{:1606};
40:if(b>10000)or(pi=-10000)then{889:}
begin if finalpass and(minimumdemerits=1073741823)and(mem[r].hh.rh=
memtop-7)and(prevr=memtop-7)then artificialdemerits:=true else if b>
threshold then goto 60;noderstaysactive:=false;end{:889}
else begin prevr:=r;if b>threshold then goto 22;noderstaysactive:=true;
end;{890:}if artificialdemerits then d:=0 else{894:}
begin d:=neweqtbint(1049410)+b;
if abs(d)>=10000 then d:=100000000 else d:=d*d;
if pi<>0 then if pi>0 then d:=d+pi*pi else if pi>-10000 then d:=d-pi*pi;
if(breaktype=1)and(mem[r].hh.b0=1)then if curp<>0 then d:=d+neweqtbint(
1049422)else d:=d+neweqtbint(1049423);
if abs(fitclass-mem[r].hh.b1)>1 then d:=d+neweqtbint(1049424);end{:894};
ifdef('STAT')if neweqtbint(1049440)>0 then{891:}
begin if printednode<>curp then{892:}begin printnl(65624);
if curp=0 then shortdisplay(mem[printednode].hh.rh)else begin savelink:=
mem[curp].hh.rh;mem[curp].hh.rh:=0;printnl(65624);
shortdisplay(mem[printednode].hh.rh);mem[curp].hh.rh:=savelink;end;
printednode:=curp;end{:892};printnl(64);
if curp=0 then printesc(65906)else if mem[curp].hh.b0<>10 then begin if
mem[curp].hh.b0=12 then printesc(65830)else if mem[curp].hh.b0=7 then
printesc(65635)else if mem[curp].hh.b0=11 then printesc(65626)else
printesc(65629);end;print(66288);
if mem[r+1].hh.rh=0 then printchar(48)else printint(mem[mem[r+1].hh.rh].
hh.lh);print(66289);if b>10000 then printchar(42)else printint(b);
print(66290);printint(pi);print(66291);
if artificialdemerits then printchar(42)else printint(d);end{:891};
endif('STAT')d:=d+mem[r+2].int;
if d<=minimaldemerits[fitclass]then begin minimaldemerits[fitclass]:=d;
bestplace[fitclass]:=mem[r+1].hh.rh;bestplline[fitclass]:=l;
if dolastlinefit then{1607:}begin bestplshort[fitclass]:=shortfall;
bestplglue[fitclass]:=g;end{:1607};
if d<minimumdemerits then minimumdemerits:=d;end{:890};
if noderstaysactive then goto 22;60:{895:}
mem[prevr].hh.rh:=mem[r].hh.rh;freenode(r,activenodesize);
if prevr=memtop-7 then{896:}begin r:=mem[memtop-7].hh.rh;
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
freenode(r,8);end;end{:896}
else if mem[prevr].hh.b0=2 then begin r:=mem[prevr].hh.rh;
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
mem[prevr].hh.rh:=mem[r].hh.rh;freenode(r,8);end;end{:895};end{:886};
end;10:ifdef('STAT'){893:}
if curp=printednode then if curp<>0 then if mem[curp].hh.b0=7 then begin
t:=mem[curp].hh.b1;while t>0 do begin decr(t);
printednode:=mem[printednode].hh.rh;end;end{:893}endif('STAT')end;{:864}
{912:}procedure postlinebreak(d:boolean);label 30,31;var q,r,s:halfword;
discbreak:boolean;postdiscbreak:boolean;curwidth:scaled;
curindent:scaled;t:quarterword;pen:integer;curline:halfword;
begin dirptr:=curlist.dirsfield;{913:}q:=mem[bestbet+1].hh.rh;curp:=0;
repeat r:=q;q:=mem[q+1].hh.lh;mem[r+1].hh.lh:=curp;curp:=r;
until q=0{:913};curline:=curlist.pgfield+1;repeat{915:}{1435:}
begin dirrover:=dirptr;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh);
mem[dirtmp].hh.rh:=mem[memtop-3].hh.rh;mem[memtop-3].hh.rh:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end end{:1435};{1436:}
begin flushnodelist(dirptr);dirptr:=0;q:=mem[memtop-3].hh.rh;
while q<>mem[curp+1].hh.rh do begin if not(q>=himemmin)then if mem[q].hh
.b0=8 then if mem[q].hh.b1=7 then begin if mem[q+1].hh.lh>=0 then begin
begin dirtmp:=getnode(4);mem[dirtmp].hh.b0:=8;mem[dirtmp].hh.b1:=7;
mem[dirtmp+1].hh.lh:=mem[q+1].hh.lh;mem[dirtmp+1].hh.rh:=mem[q+1].hh.rh;
mem[dirtmp+3].hh.lh:=mem[q+3].hh.lh;mem[dirtmp+2].hh.lh:=mem[q+2].hh.lh;
mem[dirtmp].hh.rh:=dirptr;dirptr:=dirtmp;
end end else if dirptr<>0 then if mem[dirptr+1].hh.lh=(mem[q+1].hh.lh+64
)then begin begin dirtmp:=dirptr;dirptr:=mem[dirtmp].hh.rh;
freenode(dirtmp,4);end;end;end;q:=mem[q].hh.rh;end end{:1436};{916:}
q:=mem[curp+1].hh.rh;discbreak:=false;postdiscbreak:=false;
if q<>0 then if mem[q].hh.b0=10 then begin if mem[curp+8].int<>0 then
begin r:=memtop-3;while mem[r].hh.rh<>q do r:=mem[r].hh.rh;{1437:}
if dirptr<>0 then begin if mem[r].hh.rh=q then begin dirrover:=dirptr;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=q;mem[r].hh.rh:=dirtmp;r:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;
end else if r=finalparglue then begin s:=memtop-3;
while mem[s].hh.rh<>r do s:=mem[s].hh.rh;dirrover:=dirptr;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=q;mem[s].hh.rh:=dirtmp;s:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;end else begin dirrover:=dirptr;
s:=mem[q].hh.rh;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=s;mem[q].hh.rh:=dirtmp;q:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;r:=q;end end{:1437};
s:=copynodelist(mem[curp+8].int);mem[r].hh.rh:=s;mem[s].hh.rh:=q;
end else begin r:=memtop-3;while mem[r].hh.rh<>q do r:=mem[r].hh.rh;
{1437:}
if dirptr<>0 then begin if mem[r].hh.rh=q then begin dirrover:=dirptr;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=q;mem[r].hh.rh:=dirtmp;r:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;
end else if r=finalparglue then begin s:=memtop-3;
while mem[s].hh.rh<>r do s:=mem[s].hh.rh;dirrover:=dirptr;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=q;mem[s].hh.rh:=dirtmp;s:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;end else begin dirrover:=dirptr;
s:=mem[q].hh.rh;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=s;mem[q].hh.rh:=dirtmp;q:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;r:=q;end end{:1437};end;
deleteglueref(mem[q+1].hh.lh);mem[q+1].hh.lh:=newequiv(393238);
mem[q].hh.b1:=9;incr(mem[newequiv(393238)].hh.rh);goto 30;
end else begin if mem[q].hh.b0=7 then{917:}begin t:=mem[q].hh.b1;{918:}
if t=0 then r:=mem[q].hh.rh else begin r:=q;
while t>1 do begin r:=mem[r].hh.rh;decr(t);end;s:=mem[r].hh.rh;
r:=mem[s].hh.rh;mem[s].hh.rh:=0;flushnodelist(mem[q].hh.rh);
mem[q].hh.b1:=0;end{:918};if mem[q+1].hh.rh<>0 then{919:}
begin s:=mem[q+1].hh.rh;while mem[s].hh.rh<>0 do s:=mem[s].hh.rh;
mem[s].hh.rh:=r;r:=mem[q+1].hh.rh;mem[q+1].hh.rh:=0;postdiscbreak:=true;
end{:919};if mem[q+1].hh.lh<>0 then{920:}begin s:=mem[q+1].hh.lh;
mem[q].hh.rh:=s;while mem[s].hh.rh<>0 do s:=mem[s].hh.rh;
mem[q+1].hh.lh:=0;q:=s;end{:920};mem[q].hh.rh:=r;discbreak:=true;
end{:917}else if(mem[q].hh.b0=9)or(mem[q].hh.b0=11)then mem[q+1].int:=0;
end else begin q:=memtop-3;while mem[q].hh.rh<>0 do q:=mem[q].hh.rh;end;
r:=q;{1437:}
if dirptr<>0 then begin if mem[r].hh.rh=q then begin dirrover:=dirptr;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=q;mem[r].hh.rh:=dirtmp;r:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;
end else if r=finalparglue then begin s:=memtop-3;
while mem[s].hh.rh<>r do s:=mem[s].hh.rh;dirrover:=dirptr;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=q;mem[s].hh.rh:=dirtmp;s:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;end else begin dirrover:=dirptr;
s:=mem[q].hh.rh;
while dirrover<>0 do begin dirtmp:=newdir(mem[dirrover+1].hh.lh-64);
mem[dirtmp].hh.rh:=s;mem[q].hh.rh:=dirtmp;q:=dirtmp;
dirrover:=mem[dirrover].hh.rh;end;r:=q;end end{:1437};
if mem[curp+8].int<>0 then begin r:=copynodelist(mem[curp+8].int);
mem[r].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=r;q:=r;end;{921:}
r:=newparamglue(8);mem[r].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=r;q:=r{:921}
;30:{:916};{922:}r:=mem[q].hh.rh;mem[q].hh.rh:=0;q:=mem[memtop-3].hh.rh;
mem[memtop-3].hh.rh:=r;
if mem[curp+4].int<>0 then begin r:=copynodelist(mem[curp+4].int);
s:=mem[q].hh.rh;mem[r].hh.rh:=q;q:=r;
if(curline=curlist.pgfield+1)and(s<>0)then if mem[s].hh.b0=0 then if mem
[s+5].hh.rh=0 then begin q:=mem[q].hh.rh;mem[r].hh.rh:=mem[s].hh.rh;
mem[s].hh.rh:=r;end;end;
if newequiv(393237)<>membot then begin r:=newparamglue(7);
mem[r].hh.rh:=q;q:=r;end{:922};{924:}
if curline>lastspecialline then begin curwidth:=secondwidth;
curindent:=secondindent;
end else if newequiv(524320)=0 then begin curwidth:=firstwidth;
curindent:=firstindent;
end else begin curwidth:=mem[newequiv(524320)+2*curline].int;
curindent:=mem[newequiv(524320)+2*curline-1].int;end;
adjusttail:=memtop-5;packdirection:=paragraphdir;
justbox:=hpack(q,curwidth,0);mem[justbox+4].int:=curindent{:924};{923:}
appendtovlist(justbox);
if memtop-5<>adjusttail then begin mem[curlist.tailfield].hh.rh:=mem[
memtop-5].hh.rh;curlist.tailfield:=adjusttail;end;adjusttail:=0{:923};
{925:}if curline+1<>bestline then begin q:=newequiv(524321);
if q<>0 then begin r:=curline;if r>mem[q+1].int then r:=mem[q+1].int;
pen:=mem[q+r+1].int;
end else begin if mem[curp+2].int<>0 then pen:=mem[curp+2].int else pen
:=neweqtbint(1049421);end;q:=newequiv(524322);
if q<>0 then begin r:=curline-curlist.pgfield;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=pen+mem[q+r+1].int;
end else if curline=curlist.pgfield+1 then pen:=pen+neweqtbint(1049413);
if d then q:=newequiv(524324)else q:=newequiv(524323);
if q<>0 then begin r:=bestline-curline-1;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=pen+mem[q+r+1].int;
end else if curline+2=bestline then if d then pen:=pen+neweqtbint(
1049415)else pen:=pen+neweqtbint(1049414);
if discbreak then if mem[curp+3].int<>0 then pen:=pen+mem[curp+3].int
else pen:=pen+neweqtbint(1049416);
if pen<>0 then begin r:=newpenalty(pen);mem[curlist.tailfield].hh.rh:=r;
curlist.tailfield:=r;end;end{:925}{:915};incr(curline);
curp:=mem[curp+1].hh.lh;if curp<>0 then if not postdiscbreak then{914:}
begin r:=memtop-3;while true do begin q:=mem[r].hh.rh;
if q=mem[curp+1].hh.rh then goto 31;if(q>=himemmin)then goto 31;
if{1426:}((mem[q].hh.b0=8)and(mem[q].hh.b1=6)){:1426}
then begin end else begin if(mem[q].hh.b0<9)then goto 31;
if mem[q].hh.b0=11 then if mem[q].hh.b1<>1 then goto 31;end;r:=q;end;
31:if r<>memtop-3 then begin mem[r].hh.rh:=0;
flushnodelist(mem[memtop-3].hh.rh);mem[memtop-3].hh.rh:=q;end;end{:914};
until curp=0;
if(curline<>bestline)or(mem[memtop-3].hh.rh<>0)then confusion(66298);
curlist.pgfield:=bestline-1;curlist.dirsfield:=dirptr;end;{:912}{931:}
{942:}function reconstitute(j,n:smallnumber;
bchar,hchar:halfword):smallnumber;label 22,30;var p:halfword;t:halfword;
q:fourquarters;currh:halfword;testchar:halfword;w:scaled;k:fontindex;
begin hyphenpassed:=0;t:=memtop-4;w:=0;mem[memtop-4].hh.rh:=0;{944:}
curl:=hu[j];curq:=t;if j=0 then begin ligaturepresent:=initlig;
p:=initlist;if ligaturepresent then lfthit:=initlft;
while p>0 do begin begin mem[t].hh.rh:=getavail;t:=mem[t].hh.rh;
mem[t].hh.b0:=hf;mem[t].hh.b1:=mem[p].hh.b1;end;p:=mem[p].hh.rh;end;
end else if curl<65536 then begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=curl;end;ligstack:=0;
begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=65536;end{:944};22:{945:}
if curl=65536 then begin k:=fonttables[hf,18].int;
if k=0 then goto 30 else q:=fonttables[hf,k].qqqq;
end else begin q:=fonttables[hf,fonttables[hf,34].int-fonttables[hf,5].
int+curl].qqqq;if((q.b2)mod 4)<>1 then goto 30;
k:=fonttables[hf,40].int+q.b3;q:=fonttables[hf,k].qqqq;
if(q.b0 mod 256)>128 then begin k:=fonttables[hf,40].int+256*q.b2+q.b3
+32768-256*(128);q:=fonttables[hf,k].qqqq;end;end;
if currh<65536 then testchar:=currh else testchar:=curr;
while true do begin if(fonttables[hf,5].int+q.b1)=testchar then if(q.b0
mod 256)<=128 then if currh<65536 then begin hyphenpassed:=j;
hchar:=65536;currh:=65536;goto 22;
end else begin if hchar<65536 then if odd(hyf[j])then begin hyphenpassed
:=j;hchar:=65536;end;if q.b2<128 then{947:}
begin if curl=65536 then lfthit:=true;
if j=n then if ligstack=0 then rthit:=true;
begin if interrupt<>0 then pauseforinstructions;end;
case q.b2 of 1,5:begin curl:=q.b3;ligaturepresent:=true;end;
2,6:begin curr:=q.b3;
if ligstack>0 then mem[ligstack].hh.b1:=curr else begin ligstack:=
newligitem(curr);if j=n then bchar:=65536 else begin p:=getavail;
mem[ligstack+1].hh.rh:=p;mem[p].hh.b1:=hu[j+1];mem[p].hh.b0:=hf;end;end;
end;3:begin curr:=q.b3;p:=ligstack;ligstack:=newligitem(curr);
mem[ligstack].hh.rh:=p;end;
7,11:begin if ligaturepresent then begin p:=newligature(hf,curl,mem[curq
].hh.rh);if lfthit then begin mem[p].hh.b1:=2;lfthit:=false;end;
if false then if ligstack=0 then begin incr(mem[p].hh.b1);rthit:=false;
end;mem[curq].hh.rh:=p;t:=p;ligaturepresent:=false;end;curq:=t;
curl:=q.b3;ligaturepresent:=true;end;others:begin curl:=q.b3;
ligaturepresent:=true;
if ligstack>0 then begin if mem[ligstack+1].hh.rh>0 then begin mem[t].hh
.rh:=mem[ligstack+1].hh.rh;t:=mem[t].hh.rh;incr(j);end;p:=ligstack;
ligstack:=mem[p].hh.rh;freenode(p,2);
if ligstack=0 then begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=65536;
end else curr:=mem[ligstack].hh.b1;
end else if j=n then goto 30 else begin begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=curr;end;incr(j);
begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=65536;end;end;end end;
if q.b2>4 then if q.b2<>7 then goto 30;goto 22;end{:947};
w:=fonttables[hf,fonttables[hf,41].int+256*q.b2+q.b3].int;goto 30;end;
if(q.b0 mod 256)>=128 then if currh=65536 then goto 30 else begin currh
:=65536;goto 22;end;k:=k+(q.b0 mod 256)+1;q:=fonttables[hf,k].qqqq;end;
30:{:945};{946:}
if ligaturepresent then begin p:=newligature(hf,curl,mem[curq].hh.rh);
if lfthit then begin mem[p].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=0 then begin incr(mem[p].hh.b1);rthit:=false;
end;mem[curq].hh.rh:=p;t:=p;ligaturepresent:=false;end;
if w<>0 then begin mem[t].hh.rh:=newkern(w);t:=mem[t].hh.rh;w:=0;end;
if ligstack>0 then begin curq:=t;curl:=mem[ligstack].hh.b1;
ligaturepresent:=true;
begin if mem[ligstack+1].hh.rh>0 then begin mem[t].hh.rh:=mem[ligstack+1
].hh.rh;t:=mem[t].hh.rh;incr(j);end;p:=ligstack;ligstack:=mem[p].hh.rh;
freenode(p,2);
if ligstack=0 then begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=65536;
end else curr:=mem[ligstack].hh.b1;end;goto 22;end{:946};
reconstitute:=j;end;{:942}procedure hyphenate;
label 50,30,40,41,42,45,10;var{937:}i,j,l:0..65;q,r,s:halfword;
bchar:halfword;{:937}{948:}majortail,minortail:halfword;c:ASCIIcode;
cloc:0..63;rcount:integer;hyfnode:halfword;{:948}{958:}z:triepointer;
v:integer;{:958}{965:}h:hyphpointer;k:strnumber;u:poolpointer;{:965}
begin{959:}for j:=0 to hn do hyf[j]:=0;{966:}h:=hc[1];incr(hn);
hc[hn]:=curlang;for j:=2 to hn do h:=(h+h+hc[j])mod 607;
while true do begin{967:}k:=hyphword[h];if k=0 then goto 45;
if length(k)=hn then begin j:=1;u:=strstartar[k-65536];
repeat if strpool[u]<>hc[j]then goto 30;incr(j);incr(u);until j>hn;
{968:}s:=hyphlist[h];while s<>0 do begin hyf[mem[s].hh.lh]:=1;
s:=mem[s].hh.rh;end{:968};decr(hn);goto 40;end;30:{:967};h:=hyphlink[h];
if h=0 then goto 45;decr(h);end;45:decr(hn){:966};
if trie[curlang+1].b1<>curlang then goto 10;hc[0]:=0;hc[hn+1]:=0;
hc[hn+2]:=maxhyphchar;
for j:=0 to hn-rhyf+1 do begin z:=trie[curlang+1].rh+hc[j];l:=j;
while hc[l]=trie[z].b1 do begin if trie[z].b0<>0 then{960:}
begin v:=trie[z].b0;repeat v:=v+opstart[curlang];i:=l-hyfdistance[v];
if hyfnum[v]>hyf[i]then hyf[i]:=hyfnum[v];v:=hyfnext[v];until v=0;
end{:960};incr(l);z:=trie[z].rh+hc[l];end;end;
40:for j:=0 to lhyf-1 do hyf[j]:=0;
for j:=0 to rhyf-1 do hyf[hn-j]:=0{:959};{938:}
for j:=lhyf to hn-rhyf do if odd(hyf[j])then goto 41;goto 10;41:{:938};
{939:}q:=mem[hb].hh.rh;mem[hb].hh.rh:=0;r:=mem[ha].hh.rh;
mem[ha].hh.rh:=0;bchar:=hyfbchar;
if(ha>=himemmin)then if mem[ha].hh.b0<>hf then goto 42 else begin
initlist:=ha;initlig:=false;hu[0]:=mem[ha].hh.b1;
end else if mem[ha].hh.b0=6 then if mem[ha+1].hh.b0<>hf then goto 42
else begin initlist:=mem[ha+1].hh.rh;initlig:=true;
initlft:=(mem[ha].hh.b1>1);hu[0]:=mem[ha+1].hh.b1;
if initlist=0 then if initlft then begin hu[0]:=maxhyphchar;
initlig:=false;end;freenode(ha,2);
end else begin if not(r>=himemmin)then if mem[r].hh.b0=6 then if mem[r].
hh.b1>1 then goto 42;j:=1;s:=ha;initlist:=0;goto 50;end;s:=curp;
while mem[s].hh.rh<>ha do s:=mem[s].hh.rh;j:=0;goto 50;42:s:=ha;j:=0;
hu[0]:=maxhyphchar;initlig:=false;initlist:=0;50:flushnodelist(r);{949:}
repeat l:=j;j:=reconstitute(j,hn,bchar,hyfchar)+1;
if hyphenpassed=0 then begin mem[s].hh.rh:=mem[memtop-4].hh.rh;
while mem[s].hh.rh>0 do s:=mem[s].hh.rh;if odd(hyf[j-1])then begin l:=j;
hyphenpassed:=j-1;mem[memtop-4].hh.rh:=0;end;end;
if hyphenpassed>0 then{950:}repeat r:=getnode(2);
mem[r].hh.rh:=mem[memtop-4].hh.rh;mem[r].hh.b0:=7;majortail:=r;
rcount:=0;
while mem[majortail].hh.rh>0 do begin majortail:=mem[majortail].hh.rh;
incr(rcount);end;i:=hyphenpassed;hyf[i]:=0;{951:}minortail:=0;
mem[r+1].hh.lh:=0;hyfnode:=newcharacter(hf,hyfchar);
if hyfnode<>0 then begin incr(i);c:=hu[i];hu[i]:=hyfchar;
begin mem[hyfnode].hh.rh:=avail;avail:=hyfnode;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
while l<=i do begin l:=reconstitute(l,i,fonttables[hf,19].int,65536)+1;
if mem[memtop-4].hh.rh>0 then begin if minortail=0 then mem[r+1].hh.lh:=
mem[memtop-4].hh.rh else mem[minortail].hh.rh:=mem[memtop-4].hh.rh;
minortail:=mem[memtop-4].hh.rh;
while mem[minortail].hh.rh>0 do minortail:=mem[minortail].hh.rh;end;end;
if hyfnode<>0 then begin hu[i]:=c;l:=i;decr(i);end{:951};{952:}
minortail:=0;mem[r+1].hh.rh:=0;cloc:=0;
if fonttables[hf,18].int<>0 then begin decr(l);c:=hu[l];cloc:=l;
hu[l]:=maxhyphchar;end;
while l<j do begin repeat l:=reconstitute(l,hn,bchar,65536)+1;
if cloc>0 then begin hu[cloc]:=c;cloc:=0;end;
if mem[memtop-4].hh.rh>0 then begin if minortail=0 then mem[r+1].hh.rh:=
mem[memtop-4].hh.rh else mem[minortail].hh.rh:=mem[memtop-4].hh.rh;
minortail:=mem[memtop-4].hh.rh;
while mem[minortail].hh.rh>0 do minortail:=mem[minortail].hh.rh;end;
until l>=j;while l>j do{953:}begin j:=reconstitute(j,hn,bchar,65536)+1;
mem[majortail].hh.rh:=mem[memtop-4].hh.rh;
while mem[majortail].hh.rh>0 do begin majortail:=mem[majortail].hh.rh;
incr(rcount);end;end{:953};end{:952};{954:}
if rcount>127 then begin mem[s].hh.rh:=mem[r].hh.rh;mem[r].hh.rh:=0;
flushnodelist(r);end else begin mem[s].hh.rh:=r;mem[r].hh.b1:=rcount;
end;s:=majortail{:954};hyphenpassed:=j-1;mem[memtop-4].hh.rh:=0;
until not odd(hyf[j-1]){:950};until j>hn;mem[s].hh.rh:=q{:949};
flushlist(initlist){:939};10:end;{:931}{978:}ifdef('INITEX'){980:}
function newtrieop(d,n:smallnumber;v:quarterword):quarterword;label 10;
var h:negtrieopsize..trieopsize;u:quarterword;l:0..trieopsize;
begin h:=abs(n+313*d+361*v+1009*curlang)mod(trieopsize-negtrieopsize)+
negtrieopsize;while true do begin l:=trieophash[h];
if l=0 then begin if trieopptr=trieopsize then overflow(66308,trieopsize
);u:=trieused[curlang];if u=65535 then overflow(66309,65535);
incr(trieopptr);incr(u);trieused[curlang]:=u;hyfdistance[trieopptr]:=d;
hyfnum[trieopptr]:=n;hyfnext[trieopptr]:=v;
trieoplang[trieopptr]:=curlang;trieophash[h]:=trieopptr;
trieopval[trieopptr]:=u;newtrieop:=u;goto 10;end;
if(hyfdistance[l]=d)and(hyfnum[l]=n)and(hyfnext[l]=v)and(trieoplang[l]=
curlang)then begin newtrieop:=trieopval[l];goto 10;end;
if h>-trieopsize then decr(h)else h:=trieopsize;end;10:end;{:980}{984:}
function trienode(p:triepointer):triepointer;label 10;var h:triepointer;
q:triepointer;
begin h:=abs(triec[p]+1009*trieo[p]+2718*triel[p]+3142*trier[p])mod
triesize;while true do begin q:=triehash[h];
if q=0 then begin triehash[h]:=p;trienode:=p;goto 10;end;
if(triec[q]=triec[p])and(trieo[q]=trieo[p])and(triel[q]=triel[p])and(
trier[q]=trier[p])then begin trienode:=q;goto 10;end;
if h>0 then decr(h)else h:=triesize;end;10:end;{:984}{985:}
function compresstrie(p:triepointer):triepointer;
begin if p=0 then compresstrie:=0 else begin triel[p]:=compresstrie(
triel[p]);trier[p]:=compresstrie(trier[p]);compresstrie:=trienode(p);
end;end;{:985}{989:}procedure firstfit(p:triepointer);label 45,40;
var h:triepointer;z:triepointer;q:triepointer;c:ASCIIcode;
l,r:triepointer;ll:1..65536;begin c:=triec[p];z:=triemin[c];
while true do begin h:=z-c;{990:}
if triemax<h+maxhyphchar then begin if triesize<=h+maxhyphchar then
overflow(66310,triesize);repeat incr(triemax);trietaken[triemax]:=false;
trie[triemax].rh:=triemax+1;trie[triemax].lh:=triemax-1;
until triemax=h+maxhyphchar;end{:990};if trietaken[h]then goto 45;{991:}
q:=trier[p];while q>0 do begin if trie[h+triec[q]].rh=0 then goto 45;
q:=trier[q];end;goto 40{:991};45:z:=trie[z].rh;end;40:{992:}
trietaken[h]:=true;triehash[p]:=h;q:=p;repeat z:=h+triec[q];
l:=trie[z].lh;r:=trie[z].rh;trie[r].lh:=l;trie[l].rh:=r;trie[z].rh:=0;
if l<maxhyphchar then begin if z<maxhyphchar then ll:=z else ll:=
maxhyphchar;repeat triemin[l]:=r;incr(l);until l=ll;end;q:=trier[q];
until q=0{:992};end;{:989}{993:}procedure triepack(p:triepointer);
var q:triepointer;begin repeat q:=triel[p];
if(q>0)and(triehash[q]=0)then begin firstfit(q);triepack(q);end;
p:=trier[p];until p=0;end;{:993}{995:}procedure triefix(p:triepointer);
var q:triepointer;c:ASCIIcode;z:triepointer;begin z:=triehash[p];
repeat q:=triel[p];c:=triec[p];trie[z+c].rh:=triehash[q];
trie[z+c].b1:=c;trie[z+c].b0:=trieo[p];if q>0 then triefix(q);
p:=trier[p];until p=0;end;{:995}{996:}procedure newpatterns;label 30,31;
var k,l:0..64;digitsensed:boolean;v:quarterword;p,q:triepointer;
firstchild:boolean;c:ASCIIcode;
begin if trienotready then begin if neweqtbint(1049458)<=0 then curlang
:=0 else if neweqtbint(1049458)>255 then curlang:=0 else curlang:=
neweqtbint(1049458);scanleftbrace;{997:}k:=0;hyf[0]:=0;
digitsensed:=false;while true do begin getxtoken;
case curcmd of 11,12:{998:}
if digitsensed or(curchr<48)or(curchr>57)then begin if curchr=46 then
curchr:=0 else begin curchr:=newequiv(787264+curchr);
if curchr=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66316);end;begin helpptr:=1;helpline[0]:=66315;end;error;end;end;
if curchr>maxhyphchar then maxhyphchar:=curchr;
if k<63 then begin incr(k);hc[k]:=curchr;hyf[k]:=0;digitsensed:=false;
end;end else if k<63 then begin hyf[k]:=curchr-48;digitsensed:=true;
end{:998};10,2:begin if k>0 then{999:}begin{1001:}
if hc[1]=0 then hyf[0]:=0;if hc[k]=0 then hyf[k]:=0;l:=k;v:=0;
while true do begin if hyf[l]<>0 then v:=newtrieop(k-l,hyf[l],v);
if l>0 then decr(l)else goto 31;end;31:{:1001};q:=0;hc[0]:=curlang;
while l<=k do begin c:=hc[l];incr(l);p:=triel[q];firstchild:=true;
while(p>0)and(c>triec[p])do begin q:=p;p:=trier[q];firstchild:=false;
end;if(p=0)or(c<triec[p])then{1000:}
begin if trieptr=triesize then overflow(66310,triesize);incr(trieptr);
trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;trieo[p]:=0;
end{:1000};q:=p;end;
if trieo[q]<>0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66317);end;begin helpptr:=1;helpline[0]:=66315;end;error;end;
trieo[q]:=v;end{:999};if curcmd=2 then goto 30;k:=0;hyf[0]:=0;
digitsensed:=false;end;others:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66314);end;printesc(66312);begin helpptr:=1;helpline[0]:=66315;
end;error;end end;end;30:{:997};if neweqtbint(1049477)>0 then{1612:}
begin c:=curlang;firstchild:=false;p:=0;repeat q:=p;p:=trier[q];
until(p=0)or(c<=triec[p]);if(p=0)or(c<triec[p])then{1000:}
begin if trieptr=triesize then overflow(66310,triesize);incr(trieptr);
trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;trieo[p]:=0;
end{:1000};q:=p;{1613:}p:=triel[q];firstchild:=true;
for c:=0 to 255 do if(newequiv(787264+c)>0)or((c=255)and firstchild)then
begin if p=0 then{1000:}
begin if trieptr=triesize then overflow(66310,triesize);incr(trieptr);
trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;trieo[p]:=0;
end{:1000}else triec[p]:=c;trieo[p]:=newequiv(787264+c);q:=p;
p:=trier[q];firstchild:=false;end;
if firstchild then triel[q]:=0 else trier[q]:=0{:1613};end{:1612};
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66311);end;printesc(66312);begin helpptr:=1;helpline[0]:=66313;
end;error;mem[memtop-12].hh.rh:=scantoks(false,false);flushlist(defref);
end;end;{:996}{1002:}procedure inittrie;var p:triepointer;j,k,t:integer;
r,s:triepointer;h:twohalves;begin incr(maxhyphchar);{988:}{981:}
opstart[0]:=-0;
for j:=1 to 255 do opstart[j]:=opstart[j-1]+trieused[j-1];
for j:=1 to trieopptr do trieophash[j]:=opstart[trieoplang[j]]+trieopval
[j];
for j:=1 to trieopptr do while trieophash[j]>j do begin k:=trieophash[j]
;t:=hyfdistance[k];hyfdistance[k]:=hyfdistance[j];hyfdistance[j]:=t;
t:=hyfnum[k];hyfnum[k]:=hyfnum[j];hyfnum[j]:=t;t:=hyfnext[k];
hyfnext[k]:=hyfnext[j];hyfnext[j]:=t;trieophash[j]:=trieophash[k];
trieophash[k]:=k;end{:981};for p:=0 to triesize do triehash[p]:=0;
trier[0]:=compresstrie(trier[0]);triel[0]:=compresstrie(triel[0]);
for p:=0 to trieptr do triehash[p]:=0;
for p:=0 to 65535 do triemin[p]:=p+1;trie[0].rh:=1;triemax:=0{:988};
if triel[0]<>0 then begin firstfit(triel[0]);triepack(triel[0]);end;
if trier[0]<>0 then{1614:}
begin if triel[0]=0 then for p:=0 to 255 do triemin[p]:=p+2;
firstfit(trier[0]);triepack(trier[0]);hyphstart:=triehash[trier[0]];
end{:1614};{994:}h.rh:=0;h.b0:=0;h.b1:=0;
if triemax=0 then begin for r:=0 to maxhyphchar do trie[r]:=h;
triemax:=maxhyphchar;
end else begin if trier[0]>0 then triefix(trier[0]);
if triel[0]>0 then triefix(triel[0]);r:=0;repeat s:=trie[r].rh;
trie[r]:=h;r:=s;until r>triemax;end;trie[0].b1:=63;{:994};
trienotready:=false;end;{:1002}endif('INITEX'){:978}
procedure linebreak(d:boolean);label 30,31,32,33,34,35,22;var{897:}
autobreaking:boolean;prevp:halfword;q,r,s,prevs:halfword;
f:internalfontnumber;{:897}{929:}j:smallnumber;c:ASCIIcode;{:929}
begin packbeginline:=curlist.mlfield;{851:}
mem[memtop-3].hh.rh:=mem[curlist.headfield].hh.rh;
if(curlist.tailfield>=himemmin)then begin mem[curlist.tailfield].hh.rh:=
newpenalty(10000);curlist.tailfield:=mem[curlist.tailfield].hh.rh;
end else if mem[curlist.tailfield].hh.b0<>10 then begin mem[curlist.
tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;
end else begin mem[curlist.tailfield].hh.b0:=12;
deleteglueref(mem[curlist.tailfield+1].hh.lh);
flushnodelist(mem[curlist.tailfield+1].hh.rh);
mem[curlist.tailfield+1].int:=10000;end;finalparglue:=newparamglue(14);
mem[curlist.tailfield].hh.rh:=finalparglue;
lastlinefill:=mem[curlist.tailfield].hh.rh;
initcurlang:=curlist.pgfield mod 65536;
initlhyf:=curlist.pgfield div 4194304;
initrhyf:=(curlist.pgfield div 65536)mod 64;
paragraphdir:=mem[mem[curlist.headfield].hh.rh+7].int;
linebreakdir:=paragraphdir;{1448:}begin dirptr:=0;
begin dirtmp:=newdir(paragraphdir);mem[dirtmp].hh.rh:=dirptr;
dirptr:=dirtmp;dirptr:=dirtmp;end;end{:1448};popnest;{:851}{862:}
noshrinkerroryet:=true;
if(mem[newequiv(393237)].hh.b1<>0)and(mem[newequiv(393237)+3].int<>0)
then begin setequiv(393237,finiteshrink(newequiv(393237)));end;
if(mem[newequiv(393238)].hh.b1<>0)and(mem[newequiv(393238)+3].int<>0)
then begin setequiv(393238,finiteshrink(newequiv(393238)));end;
q:=newequiv(393237);r:=newequiv(393238);
background[1]:=mem[q+1].int+mem[r+1].int;background[2]:=0;
background[3]:=0;background[4]:=0;background[5]:=0;background[6]:=0;
background[2+mem[q].hh.b0]:=mem[q+2].int;
background[2+mem[r].hh.b0]:=background[2+mem[r].hh.b0]+mem[r+2].int;
background[7]:=mem[q+3].int+mem[r+3].int;{1600:}dolastlinefit:=false;
activenodesize:=3;
if neweqtbint(1049475)>0 then begin q:=mem[lastlinefill+1].hh.lh;
if(mem[q+2].int>0)and(mem[q].hh.b0>0)then if(background[3]=0)and(
background[4]=0)and(background[5]=0)then begin dolastlinefit:=true;
activenodesize:=5;fillwidth[0]:=0;fillwidth[1]:=0;fillwidth[2]:=0;
fillwidth[mem[q].hh.b0-1]:=mem[q+2].int;end;end{:1600};{:862}{869:}
minimumdemerits:=1073741823;minimaldemerits[3]:=1073741823;
minimaldemerits[2]:=1073741823;minimaldemerits[1]:=1073741823;
minimaldemerits[0]:=1073741823;{:869}{883:}
if newequiv(524320)=0 then if neweqtbsc(1180556+(17))=0 then begin
lastspecialline:=0;secondwidth:=neweqtbsc(1180556+(3));secondindent:=0;
end else{884:}begin lastspecialline:=abs(neweqtbint(1049449));
if neweqtbint(1049449)<0 then begin firstwidth:=neweqtbsc(1180556+(3))-
abs(neweqtbsc(1180556+(17)));
if neweqtbsc(1180556+(17))>=0 then firstindent:=neweqtbsc(1180556+(17))
else firstindent:=0;secondwidth:=neweqtbsc(1180556+(3));secondindent:=0;
end else begin firstwidth:=neweqtbsc(1180556+(3));firstindent:=0;
secondwidth:=neweqtbsc(1180556+(3))-abs(neweqtbsc(1180556+(17)));
if neweqtbsc(1180556+(17))>=0 then secondindent:=neweqtbsc(1180556+(17))
else secondindent:=0;end;end{:884}
else begin lastspecialline:=mem[newequiv(524320)].hh.lh-1;
secondwidth:=mem[newequiv(524320)+2*(lastspecialline+1)].int;
secondindent:=mem[newequiv(524320)+2*lastspecialline+1].int;end;
if neweqtbint(1049427)=0 then easyline:=lastspecialline else easyline:=
1073741823{:883};{898:}threshold:=neweqtbint(1049408);
if threshold>=0 then begin ifdef('STAT')if neweqtbint(1049440)>0 then
begin begindiagnostic;printnl(66292);end;endif('STAT')secondpass:=false;
finalpass:=false;end else begin threshold:=neweqtbint(1049409);
secondpass:=true;finalpass:=(neweqtbsc(1180556+(20))<=0);
ifdef('STAT')if neweqtbint(1049440)>0 then begindiagnostic;
endif('STAT')end;
while true do begin if threshold>10000 then threshold:=10000;
if secondpass then{926:}
begin ifdef('INITEX')if trienotready then inittrie;
endif('INITEX')curlang:=initcurlang;lhyf:=initlhyf;rhyf:=initrhyf;
if trie[hyphstart+curlang].b1<>curlang then hyphindex:=0 else hyphindex
:=trie[hyphstart+curlang].rh;end{:926};{899:}q:=getnode(activenodesize);
mem[q].hh.b0:=0;mem[q].hh.b1:=2;mem[q].hh.rh:=memtop-7;
mem[q+1].hh.rh:=0;mem[q+1].hh.lh:=curlist.pgfield+1;mem[q+2].int:=0;
mem[memtop-7].hh.rh:=q;if dolastlinefit then{1602:}
begin mem[q+3].int:=0;mem[q+4].int:=0;end{:1602};
activewidth[1]:=background[1];activewidth[2]:=background[2];
activewidth[3]:=background[3];activewidth[4]:=background[4];
activewidth[5]:=background[5];activewidth[6]:=background[6];
activewidth[7]:=background[7];passive:=0;printednode:=memtop-3;
passnumber:=0;fontinshortdisplay:=0{:899};curp:=mem[memtop-3].hh.rh;
autobreaking:=true;prevp:=curp;{1422:}
if mem[curp].hh.b1=6 then begin internalpeninter:=mem[curp+1].int;
internalpenbroken:=mem[curp+2].int;initinternalleftbox:=mem[curp+3].int;
initinternalleftboxwidth:=mem[curp+4].int;
internalleftbox:=initinternalleftbox;
internalleftboxwidth:=initinternalleftboxwidth;
internalrightbox:=mem[curp+5].int;
internalrightboxwidth:=mem[curp+6].int;end{:1422};
while(curp<>0)and(mem[memtop-7].hh.rh<>memtop-7)do{901:}
begin if(curp>=himemmin)then{902:}begin prevp:=curp;
repeat f:=mem[curp].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[curp].hh.b1].qqqq.b1;
activewidth[1]:=activewidth[1]+fonttables[f,fonttables[f,37].int+(
breakchtdp)div 256].int+fonttables[f,fonttables[f,38].int+(breakchtdp)
mod 256].int;
end else activewidth[1]:=activewidth[1]+fonttables[f,fonttables[f,36].
int+fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[curp].hh.
b1].qqqq.b0].int;curp:=mem[curp].hh.rh;until not(curp>=himemmin);
end{:902};
case mem[curp].hh.b0 of 0,1:if not(((dirprimary[mem[curp+7].int])mod 2)
<>(dirprimary[linebreakdir]mod 2))then activewidth[1]:=activewidth[1]+
mem[curp+1].int else activewidth[1]:=activewidth[1]+(mem[curp+2].int+mem
[curp+3].int);2:activewidth[1]:=activewidth[1]+mem[curp+1].int;8:{1404:}
if mem[curp].hh.b1=5 then begin curlang:=mem[curp+1].hh.rh;
lhyf:=mem[curp+1].hh.b0;rhyf:=mem[curp+1].hh.b1;end else{1423:}
if mem[curp].hh.b1=6 then begin internalpeninter:=mem[curp+1].int;
internalpenbroken:=mem[curp+2].int;internalleftbox:=mem[curp+3].int;
internalleftboxwidth:=mem[curp+4].int;internalrightbox:=mem[curp+5].int;
internalrightboxwidth:=mem[curp+6].int;end{:1423}else{1433:}
if mem[curp].hh.b1=7 then begin if mem[curp+1].hh.lh>=0 then begin
linebreakdir:=mem[curp+1].hh.lh;begin dirtmp:=getnode(4);
mem[dirtmp].hh.b0:=8;mem[dirtmp].hh.b1:=7;
mem[dirtmp+1].hh.lh:=mem[curp+1].hh.lh;
mem[dirtmp+1].hh.rh:=mem[curp+1].hh.rh;
mem[dirtmp+3].hh.lh:=mem[curp+3].hh.lh;
mem[dirtmp+2].hh.lh:=mem[curp+2].hh.lh;mem[dirtmp].hh.rh:=dirptr;
dirptr:=dirtmp;end;end else begin begin dirtmp:=dirptr;
dirptr:=mem[dirtmp].hh.rh;freenode(dirtmp,4);end;
linebreakdir:=mem[dirptr+1].hh.lh;end end{:1433}{:1404};10:begin{903:}
if autobreaking then begin if(prevp>=himemmin)then trybreak(0,0)else if(
mem[prevp].hh.b0<9)then trybreak(0,0)else if(mem[prevp].hh.b0=11)and(mem
[prevp].hh.b1<>1)then trybreak(0,0);end;
if(mem[mem[curp+1].hh.lh].hh.b1<>0)and(mem[mem[curp+1].hh.lh+3].int<>0)
then begin mem[curp+1].hh.lh:=finiteshrink(mem[curp+1].hh.lh);end;
q:=mem[curp+1].hh.lh;activewidth[1]:=activewidth[1]+mem[q+1].int;
activewidth[2+mem[q].hh.b0]:=activewidth[2+mem[q].hh.b0]+mem[q+2].int;
activewidth[7]:=activewidth[7]+mem[q+3].int{:903};
if secondpass and autobreaking then{930:}begin prevs:=curp;
s:=mem[prevs].hh.rh;if s<>0 then begin{932:}
while true do begin if(s>=himemmin)then begin c:=mem[s].hh.b1;
hf:=mem[s].hh.b0;
end else if mem[s].hh.b0=6 then if mem[s+1].hh.rh=0 then goto 22 else
begin q:=mem[s+1].hh.rh;c:=mem[q].hh.b1;hf:=mem[q].hh.b0;
end else if(mem[s].hh.b0=11)and(mem[s].hh.b1=0)then goto 22 else if mem[
s].hh.b0=8 then begin{1405:}
if mem[s].hh.b1=5 then begin curlang:=mem[s+1].hh.rh;
lhyf:=mem[s+1].hh.b0;rhyf:=mem[s+1].hh.b1;
if trie[hyphstart+curlang].b1<>curlang then hyphindex:=0 else hyphindex
:=trie[hyphstart+curlang].rh;end{:1405};goto 22;end else goto 31;
if hyphindex=0 then hc[0]:=newequiv(787264+c)else if trie[hyphindex+c].
b1<>c then hc[0]:=0 else hc[0]:=trie[hyphindex+c].b0;
if hc[0]<>0 then if(hc[0]=c)or(neweqtbint(1049446)>0)then goto 32 else
goto 31;22:prevs:=s;s:=mem[prevs].hh.rh;end;
32:hyfchar:=fonttables[hf,16].int;if hyfchar<0 then goto 31;
if hyfchar>65535 then goto 31;ha:=prevs{:932};
if lhyf+rhyf>63 then goto 31;{933:}hn:=0;
while true do begin if(s>=himemmin)then begin if mem[s].hh.b0<>hf then
goto 33;hyfbchar:=mem[s].hh.b1;c:=hyfbchar;
if hyphindex=0 then hc[0]:=newequiv(787264+c)else if trie[hyphindex+c].
b1<>c then hc[0]:=0 else hc[0]:=trie[hyphindex+c].b0;
if hc[0]=0 then goto 33;if newequiv(787264+c)>maxhyphchar then goto 33;
if hn=63 then goto 33;hb:=s;incr(hn);hu[hn]:=c;hc[hn]:=hc[0];
hyfbchar:=65536;end else if mem[s].hh.b0=6 then{934:}
begin if mem[s+1].hh.b0<>hf then goto 33;j:=hn;q:=mem[s+1].hh.rh;
if q>0 then hyfbchar:=mem[q].hh.b1;while q>0 do begin c:=mem[q].hh.b1;
if hyphindex=0 then hc[0]:=newequiv(787264+c)else if trie[hyphindex+c].
b1<>c then hc[0]:=0 else hc[0]:=trie[hyphindex+c].b0;
if hc[0]=0 then goto 33;if newequiv(787264+c)>maxhyphchar then goto 33;
if j=63 then goto 33;incr(j);hu[j]:=c;hc[j]:=hc[0];q:=mem[q].hh.rh;end;
hb:=s;hn:=j;
if odd(mem[s].hh.b1)then hyfbchar:=fonttables[hf,19].int else hyfbchar:=
65536;end{:934}
else if(mem[s].hh.b0=11)and(mem[s].hh.b1=0)then begin hb:=s;
hyfbchar:=fonttables[hf,19].int;end else goto 33;s:=mem[s].hh.rh;end;
33:{:933};{935:}if hn<lhyf+rhyf then goto 31;
while true do begin if not((s>=himemmin))then case mem[s].hh.b0 of 6:;
11:if mem[s].hh.b1<>0 then goto 34;8,10,12,3,5,4:goto 34;
others:goto 31 end;s:=mem[s].hh.rh;end;34:{:935};hyphenate;end;
31:end{:930};end;
11:if mem[curp].hh.b1=1 then begin if not(mem[curp].hh.rh>=himemmin)and
autobreaking then if mem[mem[curp].hh.rh].hh.b0=10 then trybreak(0,0);
activewidth[1]:=activewidth[1]+mem[curp+1].int;
end else activewidth[1]:=activewidth[1]+mem[curp+1].int;
6:begin f:=mem[curp+1].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[curp+1].hh.b1].qqqq.b1;
activewidth[1]:=activewidth[1]+fonttables[f,fonttables[f,37].int+(
breakchtdp)div 256].int+fonttables[f,fonttables[f,38].int+(breakchtdp)
mod 256].int;
end else activewidth[1]:=activewidth[1]+fonttables[f,fonttables[f,36].
int+fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[curp+1].hh
.b1].qqqq.b0].int;end;7:{904:}begin s:=mem[curp+1].hh.lh;discwidth:=0;
if s=0 then trybreak(neweqtbint(1049412),1)else begin repeat{905:}
if(s>=himemmin)then begin f:=mem[s].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[s].hh.b1].qqqq.b1;
discwidth:=discwidth+fonttables[f,fonttables[f,37].int+(breakchtdp)div
256].int+fonttables[f,fonttables[f,38].int+(breakchtdp)mod 256].int;
end else discwidth:=discwidth+fonttables[f,fonttables[f,36].int+
fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[s].hh.b1].qqqq
.b0].int;end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[s+1].hh.b1].qqqq.b1;
discwidth:=discwidth+fonttables[f,fonttables[f,37].int+(breakchtdp)div
256].int+fonttables[f,fonttables[f,38].int+(breakchtdp)mod 256].int;
end else discwidth:=discwidth+fonttables[f,fonttables[f,36].int+
fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[s+1].hh.b1].
qqqq.b0].int;end;
0,1:if not(((dirprimary[mem[s+7].int])mod 2)<>(dirprimary[linebreakdir]
mod 2))then discwidth:=discwidth+mem[s+1].int else discwidth:=discwidth+
(mem[s+2].int+mem[s+3].int);2,11:discwidth:=discwidth+mem[s+1].int;
others:confusion(66296)end{:905};s:=mem[s].hh.rh;until s=0;
activewidth[1]:=activewidth[1]+discwidth;
trybreak(neweqtbint(1049411),1);
activewidth[1]:=activewidth[1]-discwidth;end;r:=mem[curp].hh.b1;
s:=mem[curp].hh.rh;while r>0 do begin{906:}
if(s>=himemmin)then begin f:=mem[s].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[s].hh.b1].qqqq.b1;
activewidth[1]:=activewidth[1]+fonttables[f,fonttables[f,37].int+(
breakchtdp)div 256].int+fonttables[f,fonttables[f,38].int+(breakchtdp)
mod 256].int;
end else activewidth[1]:=activewidth[1]+fonttables[f,fonttables[f,36].
int+fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[s].hh.b1].
qqqq.b0].int;end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
if((dirsecondary[linebreakdir])mod 2)=((dirtertiary[linebreakdir])mod 2)
then begin breakchtdp:=fonttables[f,fonttables[f,34].int-fonttables[f,5]
.int+mem[s+1].hh.b1].qqqq.b1;
activewidth[1]:=activewidth[1]+fonttables[f,fonttables[f,37].int+(
breakchtdp)div 256].int+fonttables[f,fonttables[f,38].int+(breakchtdp)
mod 256].int;
end else activewidth[1]:=activewidth[1]+fonttables[f,fonttables[f,36].
int+fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[s+1].hh.b1
].qqqq.b0].int;end;
0,1:if not(((dirprimary[mem[s+7].int])mod 2)<>(dirprimary[linebreakdir]
mod 2))then activewidth[1]:=activewidth[1]+mem[s+1].int else activewidth
[1]:=activewidth[1]+(mem[s+2].int+mem[s+3].int);
2,11:activewidth[1]:=activewidth[1]+mem[s+1].int;
others:confusion(66297)end{:906};decr(r);s:=mem[s].hh.rh;end;
prevp:=curp;curp:=s;goto 35;end{:904};
9:begin autobreaking:=(mem[curp].hh.b1=1);
begin if not(mem[curp].hh.rh>=himemmin)and autobreaking then if mem[mem[
curp].hh.rh].hh.b0=10 then trybreak(0,0);
activewidth[1]:=activewidth[1]+mem[curp+1].int;end;end;
12:trybreak(mem[curp+1].int,0);4,3,5:;others:confusion(66295)end;
prevp:=curp;curp:=mem[curp].hh.rh;35:end{:901};if curp=0 then{908:}
begin trybreak(-10000,1);
if mem[memtop-7].hh.rh<>memtop-7 then begin{909:}r:=mem[memtop-7].hh.rh;
fewestdemerits:=1073741823;
repeat if mem[r].hh.b0<>2 then if mem[r+2].int<fewestdemerits then begin
fewestdemerits:=mem[r+2].int;bestbet:=r;end;r:=mem[r].hh.rh;
until r=memtop-7;bestline:=mem[bestbet+1].hh.lh{:909};
if neweqtbint(1049427)=0 then goto 30;{910:}
begin r:=mem[memtop-7].hh.rh;actuallooseness:=0;
repeat if mem[r].hh.b0<>2 then begin linediff:=mem[r+1].hh.lh-bestline;
if((linediff<actuallooseness)and(neweqtbint(1049427)<=linediff))or((
linediff>actuallooseness)and(neweqtbint(1049427)>=linediff))then begin
bestbet:=r;actuallooseness:=linediff;fewestdemerits:=mem[r+2].int;
end else if(linediff=actuallooseness)and(mem[r+2].int<fewestdemerits)
then begin bestbet:=r;fewestdemerits:=mem[r+2].int;end;end;
r:=mem[r].hh.rh;until r=memtop-7;bestline:=mem[bestbet+1].hh.lh;
end{:910};
if(actuallooseness=neweqtbint(1049427))or finalpass then goto 30;end;
end{:908};{900:}q:=mem[memtop-7].hh.rh;
while q<>memtop-7 do begin curp:=mem[q].hh.rh;
if mem[q].hh.b0=2 then freenode(q,8)else freenode(q,activenodesize);
q:=curp;end;q:=passive;while q<>0 do begin curp:=mem[q].hh.rh;
freenode(q,10);q:=curp;end{:900};
if not secondpass then begin ifdef('STAT')if neweqtbint(1049440)>0 then
printnl(66293);endif('STAT')threshold:=neweqtbint(1049409);
secondpass:=true;finalpass:=(neweqtbsc(1180556+(20))<=0);
end else begin ifdef('STAT')if neweqtbint(1049440)>0 then printnl(66294)
;endif('STAT')background[2]:=background[2]+neweqtbsc(1180556+(20));
finalpass:=true;end;end;
30:ifdef('STAT')if neweqtbint(1049440)>0 then begin enddiagnostic(true);
normalizeselector;end;endif('STAT')if dolastlinefit then{1610:}
if mem[bestbet+3].int=0 then dolastlinefit:=false else begin q:=newspec(
mem[lastlinefill+1].hh.lh);deleteglueref(mem[lastlinefill+1].hh.lh);
mem[q+1].int:=mem[q+1].int+mem[bestbet+3].int-mem[bestbet+4].int;
mem[q+2].int:=0;mem[lastlinefill+1].hh.lh:=q;end{:1610};{:898};{911:}
postlinebreak(d){:911};{900:}q:=mem[memtop-7].hh.rh;
while q<>memtop-7 do begin curp:=mem[q].hh.rh;
if mem[q].hh.b0=2 then freenode(q,8)else freenode(q,activenodesize);
q:=curp;end;q:=passive;while q<>0 do begin curp:=mem[q].hh.rh;
freenode(q,10);q:=curp;end{:900};packbeginline:=0;end;{1461:}
function eTeXenabled(b:boolean;j:quarterword;k:halfword):boolean;
begin if not b then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65997);end;printcmdchr(j,k);begin helpptr:=1;helpline[0]:=66712;
end;error;end;eTeXenabled:=b;end;{:1461}{1484:}procedure showsavegroups;
label 41,42,40,30;var p:0..nestsize;m:-237..237;v:savepointer;
l:quarterword;c:groupcode;a:-1..1;i:integer;j:quarterword;s:strnumber;
begin p:=nestptr;nest[p]:=curlist;v:=saveptr;l:=curlevel;c:=curgroup;
saveptr:=curboundary;decr(curlevel);a:=1;printnl(65624);println;
while true do begin printnl(65649);printgroup(true);
if curgroup=0 then goto 30;repeat m:=nest[p].modefield;
if p>0 then decr(p)else m:=1;until m<>119;print(65570);
case curgroup of 1:begin incr(p);goto 42;end;2,3:s:=66421;4:s:=66326;
5:s:=66420;6:if a=0 then begin if m=-1 then s:=65815 else s:=65839;a:=1;
goto 41;end else begin if a=1 then print(66750)else printesc(66258);
if p>=a then p:=p-a;a:=0;goto 40;end;7:begin incr(p);a:=-1;
printesc(65825);goto 42;end;8:begin printesc(65684);goto 40;end;
9:goto 42;
10,13:begin if curgroup=10 then printesc(65635)else printesc(65823);
for i:=1 to 3 do if i<=savestack[saveptr-2].int then print(66218);
goto 42;end;
11:begin if savestack[saveptr-2].int=255 then printesc(65638)else begin
printesc(65616);printint(savestack[saveptr-2].int);end;goto 42;end;
12:begin s:=65840;goto 41;end;14:begin incr(p);printesc(65802);goto 40;
end;
15:begin if m=237 then printchar(36)else if nest[p].modefield=237 then
begin printcmdchr(48,savestack[saveptr-2].int);goto 40;end;
printchar(36);goto 40;end;
16:begin if mem[nest[p+1].eTeXauxfield].hh.b0=30 then printesc(66234)
else printesc(66236);goto 40;end;end;{1486:}i:=savestack[saveptr-4].int;
if i<>0 then if i<1073741824 then begin if abs(nest[p].modefield)=1 then
j:=21 else j:=22;if i>0 then printcmdchr(j,0)else printcmdchr(j,1);
printscaled(abs(i));print(65683);
end else if i<(((1073807360)+65536)+1)then begin if i>=(1073807360)then
begin printesc(66537);i:=i-((1073807360)-1073741824);end;
printesc(65837);printint(i-1073741824);printchar(61);
end else printcmdchr(31,i-((((1073807360)+65536)+1)-99)){:1486};
41:printesc(s);{1485:}
if savestack[saveptr-2].int<>0 then begin printchar(32);
if savestack[saveptr-3].int=0 then print(66200)else print(66201);
printscaled(savestack[saveptr-2].int);print(65683);end{:1485};
42:printchar(123);40:printchar(41);decr(curlevel);
curgroup:=savestack[saveptr].hh.b1;
saveptr:=savestack[saveptr].hh.rh end;30:saveptr:=v;curlevel:=l;
curgroup:=c;end;{:1484}{1500:}procedure newinteraction;forward;{:1500}
{:850}{970:}procedure newhyphexceptions;label 21,10,40,45,46;
var n:0..64;j:0..64;h:hyphpointer;k:strnumber;p:halfword;q:halfword;
s:strnumber;u,v:poolpointer;begin scanleftbrace;
if neweqtbint(1049458)<=0 then curlang:=0 else if neweqtbint(1049458)>
255 then curlang:=0 else curlang:=neweqtbint(1049458);
ifdef('INITEX')if trienotready then begin hyphindex:=0;goto 46;end;
endif('INITEX')if trie[hyphstart+curlang].b1<>curlang then hyphindex:=0
else hyphindex:=trie[hyphstart+curlang].rh;46:{971:}n:=0;p:=0;
while true do begin getxtoken;21:case curcmd of 11,12,70:{973:}
if curchr=45 then{974:}begin if n<63 then begin q:=getavail;
mem[q].hh.rh:=p;mem[q].hh.lh:=n;p:=q;end;end{:974}
else begin if hyphindex=0 then hc[0]:=newequiv(787264+curchr)else if
trie[hyphindex+curchr].b1<>curchr then hc[0]:=0 else hc[0]:=trie[
hyphindex+curchr].b0;if hc[0]=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66304);end;begin helpptr:=2;helpline[1]:=66305;helpline[0]:=66306;
end;error;end else if n<63 then begin incr(n);hc[n]:=hc[0];end;end{:973}
;16:begin scancharnum;curchr:=curval;curcmd:=70;goto 21;end;
10,2:begin if n>1 then{975:}begin incr(n);hc[n]:=curlang;
begin if poolptr+n>poolsize then overflow(65543,poolsize-initpoolptr);
end;h:=0;for j:=1 to n do begin h:=(h+h+hc[j])mod 607;
begin strpool[poolptr]:=hc[j];incr(poolptr);end;end;s:=makestring;{976:}
if hyphnext<=607 then while(hyphnext>0)and(hyphword[hyphnext-1]>0)do
decr(hyphnext);
if(hyphcount=hyphsize)or(hyphnext=0)then overflow(66307,hyphsize);
incr(hyphcount);while hyphword[h]<>0 do begin{977:}k:=hyphword[h];
if length(k)<>length(s)then goto 45;u:=strstartar[k-65536];
v:=strstartar[s-65536];repeat if strpool[u]<>strpool[v]then goto 45;
incr(u);incr(v);until u=strstartar[k-65535];begin decr(strptr);
poolptr:=strstartar[strptr-65536];end;s:=hyphword[h];decr(hyphcount);
goto 40;45:{:977};if hyphlink[h]=0 then begin hyphlink[h]:=hyphnext;
if hyphnext>=hyphsize then hyphnext:=607;
if hyphnext>607 then incr(hyphnext);end;h:=hyphlink[h]-1;end;
40:hyphword[h]:=s;hyphlist[h]:=p{:976};end{:975};
if curcmd=2 then goto 10;n:=0;p:=0;end;others:{972:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65997);end;printesc(66300);print(66301);begin helpptr:=2;
helpline[1]:=66302;helpline[0]:=66303;end;error;end{:972}end;end{:971};
10:end;{:970}{1004:}function prunepagetop(p:halfword;
s:boolean):halfword;var prevp:halfword;q,r:halfword;
begin prevp:=memtop-3;mem[memtop-3].hh.rh:=p;
while p<>0 do case mem[p].hh.b0 of 0,1,2:{1005:}
begin q:=newskipparam(10);mem[prevp].hh.rh:=q;mem[q].hh.rh:=p;
if mem[tempptr+1].int>mem[p+3].int then mem[tempptr+1].int:=mem[tempptr
+1].int-mem[p+3].int else mem[tempptr+1].int:=0;p:=0;end{:1005};
8,4,3:begin prevp:=p;p:=mem[prevp].hh.rh;end;10,11,12:begin q:=p;
p:=mem[q].hh.rh;mem[q].hh.rh:=0;mem[prevp].hh.rh:=p;
if s then begin if discptr[3]=0 then discptr[3]:=q else mem[r].hh.rh:=q;
r:=q;end else flushnodelist(q);end;others:confusion(66318)end;
prunepagetop:=mem[memtop-3].hh.rh;end;{:1004}{1006:}
function vertbreak(p:halfword;h,d:scaled):halfword;label 30,45,90;
var prevp:halfword;q,r:halfword;pi:integer;b:integer;leastcost:integer;
bestplace:halfword;prevdp:scaled;t:smallnumber;begin prevp:=p;
leastcost:=1073741823;activewidth[1]:=0;activewidth[2]:=0;
activewidth[3]:=0;activewidth[4]:=0;activewidth[5]:=0;activewidth[6]:=0;
activewidth[7]:=0;prevdp:=0;while true do begin{1008:}
if p=0 then pi:=-10000 else{1009:}
case mem[p].hh.b0 of 0,1,2:begin activewidth[1]:=activewidth[1]+prevdp+
mem[p+3].int;prevdp:=mem[p+2].int;goto 45;end;8:{1407:}goto 45{:1407};
10:if(mem[prevp].hh.b0<9)then pi:=0 else goto 90;
11:begin if mem[p].hh.rh=0 then t:=12 else t:=mem[mem[p].hh.rh].hh.b0;
if t=10 then pi:=0 else goto 90;end;12:pi:=mem[p+1].int;4,3:goto 45;
others:confusion(66319)end{:1009};{1010:}if pi<10000 then begin{1011:}
if activewidth[1]<h then if(activewidth[3]<>0)or(activewidth[4]<>0)or(
activewidth[5]<>0)or(activewidth[6]<>0)then b:=0 else b:=badness(h-
activewidth[1],activewidth[2])else if activewidth[1]-h>activewidth[7]
then b:=1073741823 else b:=badness(activewidth[1]-h,activewidth[7]){:
1011};
if b<1073741823 then if pi<=-10000 then b:=pi else if b<10000 then b:=b+
pi else b:=100000;if b<=leastcost then begin bestplace:=p;leastcost:=b;
bestheightplusdepth:=activewidth[1]+prevdp;end;
if(b=1073741823)or(pi<=-10000)then goto 30;end{:1010};
if(mem[p].hh.b0<10)or(mem[p].hh.b0>11)then goto 45;90:{1012:}
if mem[p].hh.b0=11 then q:=p else begin q:=mem[p+1].hh.lh;
activewidth[2+mem[q].hh.b0]:=activewidth[2+mem[q].hh.b0]+mem[q+2].int;
activewidth[7]:=activewidth[7]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65548);
print(66320);end;begin helpptr:=4;helpline[3]:=66321;helpline[2]:=66322;
helpline[1]:=66323;helpline[0]:=66281;end;error;r:=newspec(q);
mem[r].hh.b1:=0;deleteglueref(q);mem[p+1].hh.lh:=r;q:=r;end;end;
activewidth[1]:=activewidth[1]+prevdp+mem[q+1].int;prevdp:=0{:1012};
45:if prevdp>d then begin activewidth[1]:=activewidth[1]+prevdp-d;
prevdp:=d;end;{:1008};prevp:=p;p:=mem[prevp].hh.rh;end;
30:vertbreak:=bestplace;end;{:1006}{1013:}{1582:}
function domarks(a,l:smallnumber;q:halfword):boolean;var i:smallnumber;
begin if l<4 then begin for i:=0 to 15 do begin if odd(i)then curptr:=
mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div 2)+1].hh.lh;
if curptr<>0 then if domarks(a,l+1,curptr)then begin if odd(i)then mem[q
+(i div 2)+1].hh.rh:=0 else mem[q+(i div 2)+1].hh.lh:=0;
decr(mem[q].hh.b1);end;end;if mem[q].hh.b1=0 then begin freenode(q,9);
q:=0;end;end else begin case a of{1583:}
0:if mem[q+2].hh.rh<>0 then begin deletetokenref(mem[q+2].hh.rh);
mem[q+2].hh.rh:=0;deletetokenref(mem[q+3].hh.lh);mem[q+3].hh.lh:=0;end;
{:1583}{1585:}
1:if mem[q+2].hh.lh<>0 then begin if mem[q+1].hh.lh<>0 then
deletetokenref(mem[q+1].hh.lh);deletetokenref(mem[q+1].hh.rh);
mem[q+1].hh.rh:=0;
if mem[mem[q+2].hh.lh].hh.rh=0 then begin deletetokenref(mem[q+2].hh.lh)
;mem[q+2].hh.lh:=0;end else incr(mem[mem[q+2].hh.lh].hh.lh);
mem[q+1].hh.lh:=mem[q+2].hh.lh;end;{:1585}{1586:}
2:if(mem[q+1].hh.lh<>0)and(mem[q+1].hh.rh=0)then begin mem[q+1].hh.rh:=
mem[q+1].hh.lh;incr(mem[mem[q+1].hh.lh].hh.lh);end;{:1586}{1588:}
ifdef('INITEX')3:for i:=0 to 4 do begin if odd(i)then curptr:=mem[q+(i
div 2)+1].hh.rh else curptr:=mem[q+(i div 2)+1].hh.lh;
if curptr<>0 then begin deletetokenref(curptr);
if odd(i)then mem[q+(i div 2)+1].hh.rh:=0 else mem[q+(i div 2)+1].hh.lh
:=0;end;end;endif('INITEX'){:1588}end;
if mem[q+2].hh.lh=0 then if mem[q+3].hh.lh=0 then begin freenode(q,4);
q:=0;end;end;domarks:=(q=0);end;{:1582}function vsplit(n:halfword;
h:scaled):halfword;label 10,30;var v:halfword;vdir:integer;p:halfword;
q:halfword;begin curval:=n;
if curval<65536 then v:=newequiv(655423+curval)else begin findsaelement(
7,curval,false);if curptr=0 then v:=0 else v:=mem[curptr+1].hh.rh;end;
vdir:=mem[v+7].int;flushnodelist(discptr[3]);discptr[3]:=0;
if samark<>0 then if domarks(0,0,samark)then samark:=0;
if curmark[3]<>0 then begin deletetokenref(curmark[3]);curmark[3]:=0;
deletetokenref(curmark[4]);curmark[4]:=0;end;{1014:}
if v=0 then begin vsplit:=0;goto 10;end;
if mem[v].hh.b0<>1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65624);end;printesc(66324);print(66325);printesc(66326);
begin helpptr:=2;helpline[1]:=66327;helpline[0]:=66328;end;error;
vsplit:=0;goto 10;end{:1014};
q:=vertbreak(mem[v+5].hh.rh,h,neweqtbsc(1180556+(6)));{1015:}
p:=mem[v+5].hh.rh;
if p=q then mem[v+5].hh.rh:=0 else while true do begin if mem[p].hh.b0=4
then if mem[p+1].hh.lh<>0 then{1584:}
begin findsaelement(8,mem[p+1].hh.lh,true);
if mem[curptr+2].hh.rh=0 then begin mem[curptr+2].hh.rh:=mem[p+1].hh.rh;
incr(mem[mem[p+1].hh.rh].hh.lh);
end else deletetokenref(mem[curptr+3].hh.lh);
mem[curptr+3].hh.lh:=mem[p+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end{:1584}else if curmark[3]=0 then begin curmark[3]:=mem[p+1].hh.rh;
curmark[4]:=curmark[3];mem[curmark[3]].hh.lh:=mem[curmark[3]].hh.lh+2;
end else begin deletetokenref(curmark[4]);curmark[4]:=mem[p+1].hh.rh;
incr(mem[curmark[4]].hh.lh);end;
if mem[p].hh.rh=q then begin mem[p].hh.rh:=0;goto 30;end;
p:=mem[p].hh.rh;end;30:{:1015};q:=prunepagetop(q,neweqtbint(1049476)>0);
p:=mem[v+5].hh.rh;freenode(v,8);packdirection:=vdir;
if q<>0 then q:=vpackage(q,0,1,1073741823);setequiv(655423+curval,q);
vsplit:=vpackage(p,h,0,neweqtbsc(1180556+(6)));10:end;{:1013}{1021:}
procedure printtotals;begin printscaled(pagesofar[1]);
if pagesofar[2]<>0 then begin print(65598);printscaled(pagesofar[2]);
print(65624);end;if pagesofar[3]<>0 then begin print(65598);
printscaled(pagesofar[3]);print(66337);end;
if pagesofar[4]<>0 then begin print(65598);printscaled(pagesofar[4]);
print(66338);end;if pagesofar[5]<>0 then begin print(65598);
printscaled(pagesofar[5]);print(66339);end;
if pagesofar[6]<>0 then begin print(65599);printscaled(pagesofar[6]);
end;end;{:1021}{1023:}procedure freezepagespecs(s:smallnumber);
begin pagecontents:=s;pagesofar[0]:=neweqtbsc(1180556+(4));
pagemaxdepth:=neweqtbsc(1180556+(5));pagesofar[7]:=0;pagesofar[1]:=0;
pagesofar[2]:=0;pagesofar[3]:=0;pagesofar[4]:=0;pagesofar[5]:=0;
pagesofar[6]:=0;pagesofar[7]:=0;leastpagecost:=1073741823;
ifdef('STAT')if neweqtbint(1049441)>0 then begin begindiagnostic;
printnl(66347);printscaled(pagesofar[0]);print(66348);
printscaled(pagemaxdepth);enddiagnostic(false);end;endif('STAT')end;
{:1023}{1028:}procedure boxerror(n:eightbits);begin error;
begindiagnostic;printnl(66194);showbox(newequiv(655423+n));
enddiagnostic(true);flushnodelist(newequiv(655423+n));
setequiv(655423+n,0);end;{:1028}{1029:}
procedure ensurevbox(n:eightbits);var p:halfword;
begin p:=newequiv(655423+n);
if p<>0 then if mem[p].hh.b0=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66349);end;begin helpptr:=3;helpline[2]:=66350;helpline[1]:=66351;
helpline[0]:=66352;end;boxerror(n);end;end;{:1029}{1030:}{1048:}
procedure fireup(c:halfword);label 10;var p,q,r,s:halfword;
prevp:halfword;n:0..65535;wait:boolean;savevbadness:integer;
savevfuzz:scaled;savesplittopskip:halfword;begin{1049:}
if mem[bestpagebreak].hh.b0=12 then begin geqworddefine(1049447,mem[
bestpagebreak+1].int);mem[bestpagebreak+1].int:=10000;
end else geqworddefine(1049447,10000){:1049};
if samark<>0 then if domarks(1,0,samark)then samark:=0;
if curmark[2]<>0 then begin if curmark[0]<>0 then deletetokenref(curmark
[0]);curmark[0]:=curmark[2];incr(mem[curmark[0]].hh.lh);
deletetokenref(curmark[1]);curmark[1]:=0;end;{1050:}
if c=bestpagebreak then bestpagebreak:=0;{1051:}
if newequiv(655678)<>0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65624);end;printesc(65695);print(66363);begin helpptr:=2;
helpline[1]:=66364;helpline[0]:=66352;end;boxerror(255);end{:1051};
insertpenalties:=0;savesplittopskip:=newequiv(393240);
if neweqtbint(1049461)<=0 then{1054:}begin r:=mem[memtop].hh.rh;
while r<>memtop do begin if mem[r+2].hh.lh<>0 then begin n:=mem[r].hh.b1
;ensurevbox(n);
if newequiv(655423+n)=0 then setequiv(655423+n,newnullbox);
p:=newequiv(655423+n)+5;while mem[p].hh.rh<>0 do p:=mem[p].hh.rh;
mem[r+2].hh.rh:=p;end;r:=mem[r].hh.rh;end;end{:1054};q:=memtop-4;
mem[q].hh.rh:=0;prevp:=memtop-2;p:=mem[prevp].hh.rh;
while p<>bestpagebreak do begin if mem[p].hh.b0=3 then begin if
neweqtbint(1049461)<=0 then{1056:}begin r:=mem[memtop].hh.rh;
while mem[r].hh.b1<>mem[p].hh.b1 do r:=mem[r].hh.rh;
if mem[r+2].hh.lh=0 then wait:=true else begin wait:=false;
s:=mem[r+2].hh.rh;mem[s].hh.rh:=mem[p+4].hh.lh;
if mem[r+2].hh.lh=p then{1057:}
begin if mem[r].hh.b0=1 then if(mem[r+1].hh.lh=p)and(mem[r+1].hh.rh<>0)
then begin while mem[s].hh.rh<>mem[r+1].hh.rh do s:=mem[s].hh.rh;
mem[s].hh.rh:=0;setequiv(393240,mem[p+4].hh.rh);
mem[p+4].hh.lh:=prunepagetop(mem[r+1].hh.rh,false);
if mem[p+4].hh.lh<>0 then begin tempptr:=vpackage(mem[p+4].hh.lh,0,1,
1073741823);mem[p+3].int:=mem[tempptr+3].int+mem[tempptr+2].int;
freenode(tempptr,8);wait:=true;end;end;mem[r+2].hh.lh:=0;
n:=mem[r].hh.b1;tempptr:=mem[newequiv(655423+n)+5].hh.rh;
freenode(newequiv(655423+n),8);packdirection:=neweqtbint(1049480);
setequiv(655423+n,vpackage(tempptr,0,1,1073741823));end{:1057}
else begin while mem[s].hh.rh<>0 do s:=mem[s].hh.rh;mem[r+2].hh.rh:=s;
end;end;{1058:}mem[prevp].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=0;
if wait then begin mem[q].hh.rh:=p;q:=p;incr(insertpenalties);
end else begin deleteglueref(mem[p+4].hh.rh);freenode(p,5);end;
p:=prevp{:1058};end{:1056};
end else if mem[p].hh.b0=4 then if mem[p+1].hh.lh<>0 then{1587:}
begin findsaelement(8,mem[p+1].hh.lh,true);
if mem[curptr+1].hh.rh=0 then begin mem[curptr+1].hh.rh:=mem[p+1].hh.rh;
incr(mem[mem[p+1].hh.rh].hh.lh);end;
if mem[curptr+2].hh.lh<>0 then deletetokenref(mem[curptr+2].hh.lh);
mem[curptr+2].hh.lh:=mem[p+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end{:1587}else{1052:}
begin if curmark[1]=0 then begin curmark[1]:=mem[p+1].hh.rh;
incr(mem[curmark[1]].hh.lh);end;
if curmark[2]<>0 then deletetokenref(curmark[2]);
curmark[2]:=mem[p+1].hh.rh;incr(mem[curmark[2]].hh.lh);end{:1052};
prevp:=p;p:=mem[prevp].hh.rh;end;setequiv(393240,savesplittopskip);
{1053:}
if p<>0 then begin if mem[memtop-1].hh.rh=0 then if nestptr=0 then
curlist.tailfield:=pagetail else nest[0].tailfield:=pagetail;
mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;mem[memtop-1].hh.rh:=p;
mem[prevp].hh.rh:=0;end;savevbadness:=neweqtbint(1049435);
setneweqtbint(1049435,10000);savevfuzz:=neweqtbsc(1180556+(9));
setneweqtbsc(1180565,1073741823);packdirection:=neweqtbint(1049480);
setequiv(655678,vpackage(mem[memtop-2].hh.rh,bestsize,0,pagemaxdepth));
setneweqtbint(1049435,savevbadness);setneweqtbsc(1180565,savevfuzz);
if lastglue<>1073741823 then deleteglueref(lastglue);{1027:}
pagecontents:=0;pagetail:=memtop-2;mem[memtop-2].hh.rh:=0;
lastglue:=1073741823;lastpenalty:=0;lastkern:=0;lastnodetype:=-1;
pagesofar[7]:=0;pagemaxdepth:=0{:1027};
if q<>memtop-4 then begin mem[memtop-2].hh.rh:=mem[memtop-4].hh.rh;
pagetail:=q;end{:1053};{1055:}r:=mem[memtop].hh.rh;
while r<>memtop do begin q:=mem[r].hh.rh;freenode(r,4);r:=q;end;
mem[memtop].hh.rh:=memtop{:1055}{:1050};
if samark<>0 then if domarks(2,0,samark)then samark:=0;
if(curmark[0]<>0)and(curmark[1]=0)then begin curmark[1]:=curmark[0];
incr(mem[curmark[0]].hh.lh);end;
if newequiv(524325)<>0 then if deadcycles>=neweqtbint(1049448)then{1060:
}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66365);end;printint(deadcycles);print(66366);begin helpptr:=3;
helpline[2]:=66367;helpline[1]:=66368;helpline[0]:=66369;end;error;
end{:1060}else{1061:}begin outputactive:=true;incr(deadcycles);pushnest;
curlist.modefield:=-1;curlist.auxfield.int:=-65536000;
curlist.mlfield:=-line;begintokenlist(newequiv(524325),6);
newsavelevel(8);normalparagraph;scanleftbrace;goto 10;end{:1061};{1059:}
begin if mem[memtop-2].hh.rh<>0 then begin if mem[memtop-1].hh.rh=0 then
if nestptr=0 then curlist.tailfield:=pagetail else nest[0].tailfield:=
pagetail else mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;
mem[memtop-1].hh.rh:=mem[memtop-2].hh.rh;mem[memtop-2].hh.rh:=0;
pagetail:=memtop-2;end;flushnodelist(discptr[2]);discptr[2]:=0;
shipout(newequiv(655678));setequiv(655678,0);end{:1059};10:end;{:1048}
procedure buildpage;label 10,30,31,22,80,90;var p:halfword;q,r:halfword;
b,c:integer;pi:integer;n:0..65535;delta,h,w:scaled;
begin if(mem[memtop-1].hh.rh=0)or outputactive then goto 10;
repeat 22:p:=mem[memtop-1].hh.rh;{1032:}
if lastglue<>1073741823 then deleteglueref(lastglue);lastpenalty:=0;
lastkern:=0;lastnodetype:=mem[p].hh.b0+1;
if mem[p].hh.b0=10 then begin lastglue:=mem[p+1].hh.lh;
incr(mem[lastglue].hh.rh);end else begin lastglue:=1073741823;
if mem[p].hh.b0=12 then lastpenalty:=mem[p+1].int else if mem[p].hh.b0=
11 then lastkern:=mem[p+1].int;end{:1032};{1033:}{1036:}
case mem[p].hh.b0 of 0,1,2:if pagecontents<2 then{1037:}
begin if pagecontents=0 then freezepagespecs(2)else pagecontents:=2;
q:=newskipparam(9);
if(mem[p].hh.b0=0)and((((dirprimary[neweqtbint(1049480)])+2)mod 4)=((
dirtertiary[neweqtbint(1049480)])mod 4))then begin if mem[tempptr+1].int
>mem[p+2].int then mem[tempptr+1].int:=mem[tempptr+1].int-mem[p+2].int
else mem[tempptr+1].int:=0;
end else begin if mem[tempptr+1].int>mem[p+3].int then mem[tempptr+1].
int:=mem[tempptr+1].int-mem[p+3].int else mem[tempptr+1].int:=0;end;
mem[q].hh.rh:=p;mem[memtop-1].hh.rh:=q;goto 22;end{:1037}else{1038:}
begin if(mem[p].hh.b0=0)and((((dirprimary[neweqtbint(1049480)])+2)mod 4)
=((dirtertiary[neweqtbint(1049480)])mod 4))then begin pagesofar[1]:=
pagesofar[1]+pagesofar[7]+mem[p+2].int;pagesofar[7]:=mem[p+3].int;
end else begin pagesofar[1]:=pagesofar[1]+pagesofar[7]+mem[p+3].int;
pagesofar[7]:=mem[p+2].int;end;goto 80;end{:1038};8:{1406:}
goto 80{:1406};
10:if pagecontents<2 then goto 31 else if(mem[pagetail].hh.b0<9)then pi
:=0 else goto 90;
11:if pagecontents<2 then goto 31 else if mem[p].hh.rh=0 then goto 10
else if mem[mem[p].hh.rh].hh.b0=10 then pi:=0 else goto 90;
12:if pagecontents<2 then goto 31 else pi:=mem[p+1].int;4:goto 80;
3:{1044:}begin if pagecontents=0 then freezepagespecs(1);
n:=mem[p].hh.b1;r:=memtop;
while n>=mem[mem[r].hh.rh].hh.b1 do r:=mem[r].hh.rh;n:=n;
if mem[r].hh.b1<>n then{1045:}begin q:=getnode(4);
mem[q].hh.rh:=mem[r].hh.rh;mem[r].hh.rh:=q;r:=q;mem[r].hh.b1:=n;
mem[r].hh.b0:=0;ensurevbox(n);
if newequiv(655423+n)=0 then mem[r+3].int:=0 else mem[r+3].int:=mem[
newequiv(655423+n)+3].int+mem[newequiv(655423+n)+2].int;
mem[r+2].hh.lh:=0;q:=newequiv(393248+n);
if neweqtbint(1049484+n)=1000 then h:=mem[r+3].int else h:=xovern(mem[r
+3].int,1000)*neweqtbint(1049484+n);
pagesofar[0]:=pagesofar[0]-h-mem[q+1].int;
pagesofar[2+mem[q].hh.b0]:=pagesofar[2+mem[q].hh.b0]+mem[q+2].int;
pagesofar[6]:=pagesofar[6]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65548);
print(66358);end;printesc(65681);printint(n);begin helpptr:=3;
helpline[2]:=66359;helpline[1]:=66360;helpline[0]:=66281;end;error;end;
end{:1045};
if mem[r].hh.b0=1 then insertpenalties:=insertpenalties+mem[p+1].int
else begin mem[r+2].hh.rh:=p;
delta:=pagesofar[0]-pagesofar[1]-pagesofar[7]+pagesofar[6];
if neweqtbint(1049484+n)=1000 then h:=mem[p+3].int else h:=xovern(mem[p
+3].int,1000)*neweqtbint(1049484+n);
if((h<=0)or(h<=delta))and(mem[p+3].int+mem[r+3].int<=neweqtbsc(1180581+(
n)))then begin pagesofar[0]:=pagesofar[0]-h;
mem[r+3].int:=mem[r+3].int+mem[p+3].int;end else{1046:}
begin if neweqtbint(1049484+n)<=0 then w:=1073741823 else begin w:=
pagesofar[0]-pagesofar[1]-pagesofar[7];
if neweqtbint(1049484+n)<>1000 then w:=xovern(w,neweqtbint(1049484+n))
*1000;end;
if w>neweqtbsc(1180581+(n))-mem[r+3].int then w:=neweqtbsc(1180581+(n))-
mem[r+3].int;q:=vertbreak(mem[p+4].hh.lh,w,mem[p+2].int);
mem[r+3].int:=mem[r+3].int+bestheightplusdepth;
ifdef('STAT')if neweqtbint(1049441)>0 then{1047:}begin begindiagnostic;
printnl(66361);printint(n);print(66362);printscaled(w);printchar(44);
printscaled(bestheightplusdepth);print(66290);
if q=0 then printint(-10000)else if mem[q].hh.b0=12 then printint(mem[q
+1].int)else printchar(48);enddiagnostic(false);end{:1047};
endif('STAT')if neweqtbint(1049484+n)<>1000 then bestheightplusdepth:=
xovern(bestheightplusdepth,1000)*neweqtbint(1049484+n);
pagesofar[0]:=pagesofar[0]-bestheightplusdepth;mem[r].hh.b0:=1;
mem[r+1].hh.rh:=q;mem[r+1].hh.lh:=p;
if q=0 then insertpenalties:=insertpenalties-10000 else if mem[q].hh.b0=
12 then insertpenalties:=insertpenalties+mem[q+1].int;end{:1046};end;
goto 80;end{:1044};others:confusion(66353)end{:1036};{1041:}
if pi<10000 then begin{1043:}
if pagesofar[1]<pagesofar[0]then if(pagesofar[3]<>0)or(pagesofar[4]<>0)
or(pagesofar[5]<>0)then b:=0 else b:=badness(pagesofar[0]-pagesofar[1],
pagesofar[2])else if pagesofar[1]-pagesofar[0]>pagesofar[6]then b:=
1073741823 else b:=badness(pagesofar[1]-pagesofar[0],pagesofar[6]){:1043
};
if b<1073741823 then if pi<=-10000 then c:=pi else if b<10000 then c:=b+
pi+insertpenalties else c:=100000 else c:=b;
if insertpenalties>=10000 then c:=1073741823;
ifdef('STAT')if neweqtbint(1049441)>0 then{1042:}begin begindiagnostic;
printnl(37);print(66286);printtotals;print(66356);
printscaled(pagesofar[0]);print(66289);
if b=1073741823 then printchar(42)else printint(b);print(66290);
printint(pi);print(66357);
if c=1073741823 then printchar(42)else printint(c);
if c<=leastpagecost then printchar(35);enddiagnostic(false);end{:1042};
endif('STAT')if c<=leastpagecost then begin bestpagebreak:=p;
bestsize:=pagesofar[0];leastpagecost:=c;r:=mem[memtop].hh.rh;
while r<>memtop do begin mem[r+2].hh.lh:=mem[r+2].hh.rh;r:=mem[r].hh.rh;
end;end;if(c=1073741823)or(pi<=-10000)then begin fireup(p);
if outputactive then goto 10;goto 30;end;end{:1041};
if(mem[p].hh.b0<10)or(mem[p].hh.b0>11)then goto 80;90:{1040:}
if mem[p].hh.b0=11 then q:=p else begin q:=mem[p+1].hh.lh;
pagesofar[2+mem[q].hh.b0]:=pagesofar[2+mem[q].hh.b0]+mem[q+2].int;
pagesofar[6]:=pagesofar[6]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65548);
print(66354);end;begin helpptr:=4;helpline[3]:=66355;helpline[2]:=66322;
helpline[1]:=66323;helpline[0]:=66281;end;error;r:=newspec(q);
mem[r].hh.b1:=0;deleteglueref(q);mem[p+1].hh.lh:=r;q:=r;end;end;
pagesofar[1]:=pagesofar[1]+pagesofar[7]+mem[q+1].int;
pagesofar[7]:=0{:1040};80:{1039:}
if pagesofar[7]>pagemaxdepth then begin pagesofar[1]:=pagesofar[1]+
pagesofar[7]-pagemaxdepth;pagesofar[7]:=pagemaxdepth;end;{:1039};{1034:}
mem[pagetail].hh.rh:=p;pagetail:=p;mem[memtop-1].hh.rh:=mem[p].hh.rh;
mem[p].hh.rh:=0;goto 30{:1034};31:{1035:}
mem[memtop-1].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=0;
if neweqtbint(1049476)>0 then begin if discptr[2]=0 then discptr[2]:=p
else mem[discptr[1]].hh.rh:=p;discptr[1]:=p;
end else flushnodelist(p){:1035};30:{:1033};until mem[memtop-1].hh.rh=0;
{1031:}
if nestptr=0 then curlist.tailfield:=memtop-1 else nest[0].tailfield:=
memtop-1{:1031};10:end;{:1030}{1066:}{1080:}procedure appspace;
var q:halfword;
begin if(curlist.auxfield.hh.lh>=2000)and(newequiv(393243)<>membot)then
q:=newparamglue(13)else begin if newequiv(393242)<>membot then mainp:=
newequiv(393242)else{1079:}
begin mainp:=fonttables[newequiv(720959),14].int;
if mainp=0 then begin mainp:=newspec(membot);
maink:=fonttables[newequiv(720959),43].int+2;
mem[mainp+1].int:=fonttables[newequiv(720959),maink].int;
mem[mainp+2].int:=fonttables[newequiv(720959),maink+1].int;
mem[mainp+3].int:=fonttables[newequiv(720959),maink+2].int;
fonttables[newequiv(720959),14].int:=mainp;end;end{:1079};
mainp:=newspec(mainp);{1081:}
if curlist.auxfield.hh.lh>=2000 then mem[mainp+1].int:=mem[mainp+1].int+
fonttables[newequiv(720959),fonttables[newequiv(720959),43].int+7].int;
mem[mainp+2].int:=xnoverd(mem[mainp+2].int,curlist.auxfield.hh.lh,1000);
mem[mainp+3].int:=xnoverd(mem[mainp+3].int,1000,curlist.auxfield.hh.lh){
:1081};q:=newglue(mainp);mem[mainp].hh.rh:=0;end;
mem[curlist.tailfield].hh.rh:=q;curlist.tailfield:=q;end;{:1080}{1084:}
procedure insertdollarsign;begin backinput;curtok:=196644;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66377);end;begin helpptr:=2;helpline[1]:=66378;helpline[0]:=66379;
end;inserror;end;{:1084}{1086:}procedure youcant;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66003);end;printcmdchr(curcmd,curchr);print(66380);
printmode(curlist.modefield);end;{:1086}{1087:}
procedure reportillegalcase;begin youcant;begin helpptr:=4;
helpline[3]:=66381;helpline[2]:=66382;helpline[1]:=66383;
helpline[0]:=66384;end;error;end;{:1087}{1088:}
function privileged:boolean;
begin if curlist.modefield>0 then privileged:=true else begin
reportillegalcase;privileged:=false;end;end;{:1088}{1091:}
function itsallover:boolean;label 10;
begin if privileged then begin if(memtop-2=pagetail)and(curlist.
headfield=curlist.tailfield)and(deadcycles=0)then begin itsallover:=true
;goto 10;end;backinput;begin mem[curlist.tailfield].hh.rh:=newnullbox;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield+1].int:=neweqtbsc(1180556+(3));
begin mem[curlist.tailfield].hh.rh:=newglue(membot+12);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin mem[curlist.tailfield].hh.rh:=newpenalty(-1073741824);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;buildpage;end;
itsallover:=false;10:end;{:1091}{1097:}procedure appendglue;
var s:smallnumber;begin s:=curchr;case s of 0:curval:=membot+8;
1:curval:=membot+12;2:curval:=membot+16;3:curval:=membot+20;
4:scanglue(2);5:scanglue(3);end;
begin mem[curlist.tailfield].hh.rh:=newglue(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if s>=4 then begin decr(mem[curval].hh.rh);
if s>4 then mem[curlist.tailfield].hh.b1:=99;end;end;{:1097}{1098:}
procedure appendkern;var s:quarterword;begin s:=curchr;
scandimen(s=99,false,false);
begin mem[curlist.tailfield].hh.rh:=newkern(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=s;end;{:1098}{1101:}procedure offsave;
var p:halfword;begin if curgroup=0 then{1103:}
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66106);end;printcmdchr(curcmd,curchr);begin helpptr:=1;
helpline[0]:=66403;end;error;end{:1103}else begin backinput;p:=getavail;
mem[memtop-3].hh.rh:=p;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65935);end;{1102:}case curgroup of 14:begin mem[p].hh.lh:=1245187;
printesc(65807);end;15:begin mem[p].hh.lh:=196644;printchar(36);end;
16:begin mem[p].hh.lh:=1245188;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
mem[p].hh.lh:=786478;printesc(66402);end;
others:begin mem[p].hh.lh:=131197;printchar(125);end end{:1102};
print(65936);begintokenlist(mem[memtop-3].hh.rh,4);begin helpptr:=5;
helpline[4]:=66397;helpline[3]:=66398;helpline[2]:=66399;
helpline[1]:=66400;helpline[0]:=66401;end;error;end;end;{:1101}{1106:}
procedure extrarightbrace;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66408);end;case curgroup of 14:printesc(65807);15:printchar(36);
16:printesc(66235);end;begin helpptr:=5;helpline[4]:=66409;
helpline[3]:=66410;helpline[2]:=66411;helpline[1]:=66412;
helpline[0]:=66413;end;error;incr(alignstate);end;{:1106}{1107:}
procedure normalparagraph;
begin if neweqtbint(1049427)<>0 then eqworddefine(1049427,0);
if neweqtbsc(1180556+(17))<>0 then eqworddefine(1180573,0);
if neweqtbint(1049449)<>1 then eqworddefine(1049449,1);
if newequiv(524320)<>0 then eqdefine(524320,135,0);
if newequiv(524321)<>0 then eqdefine(524321,135,0);end;{:1107}{1112:}
procedure boxend(boxcontext:integer);var p:halfword;
begin if boxcontext<1073741824 then{1113:}
begin if curbox<>0 then begin mem[curbox+4].int:=boxcontext;
if abs(curlist.modefield)=1 then begin appendtovlist(curbox);
if adjusttail<>0 then begin if memtop-5<>adjusttail then begin mem[
curlist.tailfield].hh.rh:=mem[memtop-5].hh.rh;
curlist.tailfield:=adjusttail;end;adjusttail:=0;end;
if curlist.modefield>0 then buildpage;
end else begin if abs(curlist.modefield)=119 then curlist.auxfield.hh.lh
:=1000 else begin p:=newnoad;mem[p+1].hh.rh:=2;mem[p+1].hh.lh:=curbox;
curbox:=p;end;mem[curlist.tailfield].hh.rh:=curbox;
curlist.tailfield:=curbox;end;end;end{:1113}
else if boxcontext<(((1073807360)+65536)+1)then{1114:}
if boxcontext<(1073807360)then eqdefine(655423+boxcontext-1073741824,136
,curbox)else geqdefine(655423+boxcontext-(1073807360),136,curbox){:1114}
else if curbox<>0 then if boxcontext>(((1073807360)+65536)+1)then{1115:}
begin{410:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:410};
if((curcmd=26)and(abs(curlist.modefield)<>1))or((curcmd=27)and(abs(
curlist.modefield)=1))then begin appendglue;
mem[curlist.tailfield].hh.b1:=boxcontext-((((1073807360)+65536)+1)-99);
mem[curlist.tailfield+1].hh.rh:=curbox;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66427);end;begin helpptr:=3;helpline[2]:=66428;helpline[1]:=66429;
helpline[0]:=66430;end;backerror;flushnodelist(curbox);end;end{:1115}
else shipout(curbox);end;{:1112}{1116:}
procedure beginbox(boxcontext:integer);label 10,30;var p,q:halfword;
m:quarterword;k:halfword;n:eightbits;
begin case curchr of 0:begin scaneightbitint;
curbox:=newequiv(655423+curval);setequiv(655423+curval,0);end;
1:begin scaneightbitint;curbox:=copynodelist(newequiv(655423+curval));
end;2:{1117:}begin curbox:=0;
if abs(curlist.modefield)=237 then begin youcant;begin helpptr:=1;
helpline[0]:=66431;end;error;
end else if(curlist.modefield=1)and(curlist.headfield=curlist.tailfield)
then begin youcant;begin helpptr:=2;helpline[1]:=66432;
helpline[0]:=66433;end;error;
end else begin if not(curlist.tailfield>=himemmin)then if(mem[curlist.
tailfield].hh.b0=0)or(mem[curlist.tailfield].hh.b0=1)then{1118:}
begin q:=curlist.headfield;repeat p:=q;
if not(q>=himemmin)then if mem[q].hh.b0=7 then begin for m:=1 to mem[q].
hh.b1 do p:=mem[p].hh.rh;if p=curlist.tailfield then goto 30;end;
q:=mem[p].hh.rh;until q=curlist.tailfield;curbox:=curlist.tailfield;
mem[curbox+4].int:=0;curlist.tailfield:=p;mem[p].hh.rh:=0;30:end{:1118};
end;end{:1117};3:{1119:}begin scaneightbitint;n:=curval;
if not scankeyword(66200)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66434);end;begin helpptr:=2;helpline[1]:=66435;helpline[0]:=66436;
end;error;end;scandimen(false,false,false);curbox:=vsplit(n,curval);
end{:1119};others:{1120:}begin k:=curchr-4;
savestack[saveptr+0].int:=boxcontext;
case abs(curlist.modefield)of 1:specdirection:=neweqtbint(1049480);
119:specdirection:=neweqtbint(1049482);
237:specdirection:=neweqtbint(1049483);end;
if k=119 then if(boxcontext<1073741824)and(abs(curlist.modefield)=1)then
scanspec(3,true)else scanspec(2,true)else begin if k=1 then scanspec(4,
true)else begin scanspec(5,true);k:=1;end;normalparagraph;end;pushnest;
curlist.modefield:=-k;if k=1 then begin curlist.auxfield.int:=-65536000;
if newequiv(524330)<>0 then begintokenlist(newequiv(524330),11);
end else begin curlist.auxfield.hh.lh:=1000;
if newequiv(524329)<>0 then begintokenlist(newequiv(524329),10);end;
goto 10;end{:1120}end;boxend(boxcontext);10:end;{:1116}{1121:}
procedure scanbox(boxcontext:integer);begin{410:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:410};
if curcmd=20 then beginbox(boxcontext)else if(boxcontext>=(((1073807360)
+65536)+1)+1)and((curcmd=36)or(curcmd=35))then begin curbox:=
scanrulespec;boxend(boxcontext);
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66437);end;begin helpptr:=3;helpline[2]:=66438;helpline[1]:=66439;
helpline[0]:=66440;end;backerror;end;end;{:1121}{1123:}
procedure package(c:smallnumber);var h:scaled;p:halfword;d:scaled;
begin d:=neweqtbsc(1180556+(7));unsave;saveptr:=saveptr-5;
packdirection:=savestack[saveptr+3].int;
if curlist.modefield=-119 then curbox:=hpack(mem[curlist.headfield].hh.
rh,savestack[saveptr+2].int,savestack[saveptr+1].int)else begin curbox:=
vpackage(mem[curlist.headfield].hh.rh,savestack[saveptr+2].int,savestack
[saveptr+1].int,d);if c=4 then{1124:}begin h:=0;p:=mem[curbox+5].hh.rh;
if p<>0 then if mem[p].hh.b0<=2 then h:=mem[p+3].int;
mem[curbox+2].int:=mem[curbox+2].int-h+mem[curbox+3].int;
mem[curbox+3].int:=h;end{:1124};end;
if savestack[saveptr+4].int<>0 then{1442:}
begin flushnodelist(textdirptr);textdirptr:=savestack[saveptr+4].int;
end{:1442};popnest;boxend(savestack[saveptr+0].int);end;{:1123}{1128:}
function normmin(h:integer):smallnumber;
begin if h<=0 then normmin:=1 else if h>=63 then normmin:=63 else
normmin:=h;end;procedure newgraf(indented:boolean);
var p,q,dirgraftmp:halfword;begin curlist.pgfield:=0;
if(curlist.modefield=1)or(curlist.headfield<>curlist.tailfield)then
begin mem[curlist.tailfield].hh.rh:=newparamglue(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;pushnest;
curlist.modefield:=119;curlist.auxfield.hh.lh:=1000;
if neweqtbint(1049458)<=0 then curlang:=0 else if neweqtbint(1049458)>
255 then curlang:=0 else curlang:=neweqtbint(1049458);
curlist.auxfield.hh.rh:=curlang;
curlist.pgfield:=(normmin(neweqtbint(1049459))*64+normmin(neweqtbint(
1049460)))*65536+curlang;{1425:}
begin begin mem[curlist.tailfield].hh.rh:=makelocalparnode;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end end{:1425};
if indented then begin p:=newnullbox;mem[p+7].int:=neweqtbint(1049481);
mem[p+1].int:=neweqtbsc(1180556+(0));
begin mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if(insertsrcspecialeverypar)then insertsrcspecial;end;
q:=curlist.tailfield;dirrover:=textdirptr;
while dirrover<>0 do begin if(mem[dirrover].hh.rh<>0)or(mem[dirrover+1].
hh.lh<>neweqtbint(1049481))then begin dirgraftmp:=newdir(mem[dirrover+1]
.hh.lh);mem[dirgraftmp].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=dirgraftmp;
end;dirrover:=mem[dirrover].hh.rh;end;q:=curlist.headfield;
while mem[q].hh.rh<>0 do q:=mem[q].hh.rh;curlist.tailfield:=q;
if newequiv(524326)<>0 then begintokenlist(newequiv(524326),7);
if nestptr=1 then buildpage;end;{:1128}{1130:}procedure indentinhmode;
var p,q:halfword;begin if curchr>0 then begin p:=newnullbox;
mem[p+1].int:=neweqtbsc(1180556+(0));
if abs(curlist.modefield)=119 then curlist.auxfield.hh.lh:=1000 else
begin q:=newnoad;mem[q+1].hh.rh:=2;mem[q+1].hh.lh:=p;p:=q;end;
begin mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;{:1130}
{1132:}procedure headforvmode;
begin if curlist.modefield<0 then if curcmd<>36 then offsave else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66003);end;printesc(65816);print(66443);begin helpptr:=2;
helpline[1]:=66444;helpline[0]:=66445;end;error;
end else begin backinput;curtok:=partoken;backinput;
curinput.indexfield:=4;end;end;{:1132}{1133:}procedure endgraf;
begin if curlist.modefield=119 then begin if(curlist.headfield=curlist.
tailfield)or(mem[curlist.headfield].hh.rh=curlist.tailfield)then popnest
else linebreak(neweqtbint(1049414));
if curlist.dirsfield<>0 then begin flushnodelist(curlist.dirsfield);
curlist.dirsfield:=0;end;normalparagraph;errorcount:=0;end;end;{:1133}
{1136:}procedure begininsertoradjust;
begin if curcmd=38 then curval:=255 else begin scaneightbitint;
if curval=255 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66446);end;printesc(65616);printint(255);begin helpptr:=1;
helpline[0]:=66447;end;error;curval:=0;end;end;
savestack[saveptr+0].int:=curval;incr(saveptr);newsavelevel(11);
scanleftbrace;normalparagraph;pushnest;curlist.modefield:=-1;
curlist.auxfield.int:=-65536000;end;{:1136}{1138:}procedure makemark;
var p:halfword;c:halfword;
begin if curchr=0 then c:=0 else begin scanregisternum;c:=curval;end;
p:=scantoks(false,true);p:=getnode(2);mem[p+1].hh.lh:=c;mem[p].hh.b0:=4;
mem[p].hh.b1:=0;mem[p+1].hh.rh:=defref;mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=p;end;{:1138}{1140:}procedure appendpenalty;
begin scanint;begin mem[curlist.tailfield].hh.rh:=newpenalty(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if curlist.modefield=1 then buildpage;end;{:1140}{1142:}
procedure deletelast;label 10;var p,q:halfword;m:quarterword;
begin if(curlist.modefield=1)and(curlist.tailfield=curlist.headfield)
then{1143:}
begin if(curchr<>10)or(lastglue<>1073741823)then begin youcant;
begin helpptr:=2;helpline[1]:=66432;helpline[0]:=66448;end;
if curchr=11 then helpline[0]:=(66449)else if curchr<>10 then helpline[0
]:=(66450);error;end;end{:1143}
else begin if not(curlist.tailfield>=himemmin)then if mem[curlist.
tailfield].hh.b0=curchr then begin q:=curlist.headfield;repeat p:=q;
if not(q>=himemmin)then if mem[q].hh.b0=7 then begin for m:=1 to mem[q].
hh.b1 do p:=mem[p].hh.rh;if p=curlist.tailfield then goto 10;end;
q:=mem[p].hh.rh;until q=curlist.tailfield;mem[p].hh.rh:=0;
flushnodelist(curlist.tailfield);curlist.tailfield:=p;end;end;10:end;
{:1142}{1147:}procedure unpackage;label 30,10;var p:halfword;c:0..1;
begin if curchr>1 then{1620:}
begin mem[curlist.tailfield].hh.rh:=discptr[curchr];discptr[curchr]:=0;
goto 30;end{:1620};c:=curchr;scaneightbitint;p:=newequiv(655423+curval);
if p=0 then goto 10;
if(abs(curlist.modefield)=237)or((abs(curlist.modefield)=1)and(mem[p].hh
.b0<>1))or((abs(curlist.modefield)=119)and(mem[p].hh.b0<>0))then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66458);end;begin helpptr:=3;helpline[2]:=66459;helpline[1]:=66460;
helpline[0]:=66461;end;error;goto 10;end;
if c=1 then mem[curlist.tailfield].hh.rh:=copynodelist(mem[p+5].hh.rh)
else begin mem[curlist.tailfield].hh.rh:=mem[p+5].hh.rh;
setequiv(655423+curval,0);freenode(p,8);end;
30:while mem[curlist.tailfield].hh.rh<>0 do curlist.tailfield:=mem[
curlist.tailfield].hh.rh;10:end;{:1147}{1150:}
procedure appenditaliccorrection;label 10;var p:halfword;
f:internalfontnumber;
begin if curlist.tailfield<>curlist.headfield then begin if(curlist.
tailfield>=himemmin)then p:=curlist.tailfield else if mem[curlist.
tailfield].hh.b0=6 then p:=curlist.tailfield+1 else goto 10;
f:=mem[p].hh.b0;
begin mem[curlist.tailfield].hh.rh:=newkern(fonttables[f,fonttables[f,39
].int+(fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[p].hh.
b1].qqqq.b2)div 256].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=1;end;10:end;{:1150}{1154:}
procedure appendlocalbox(kind:integer);begin incr(saveptr);
savestack[saveptr-1].int:=kind;newsavelevel(17);scanleftbrace;pushnest;
curlist.modefield:=-119;curlist.auxfield.hh.lh:=1000;end;
procedure appenddiscretionary;var c:integer;
begin begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if curchr=1 then begin c:=fonttables[newequiv(720959),16].int;
if c>=0 then if c<=65535 then mem[curlist.tailfield+1].hh.lh:=
newcharacter(newequiv(720959),c);end else begin incr(saveptr);
savestack[saveptr-1].int:=0;newsavelevel(10);scanleftbrace;pushnest;
curlist.modefield:=-119;curlist.auxfield.hh.lh:=1000;end;end;{:1154}
{1156:}procedure buildlocalbox;var p:halfword;kind:integer;begin unsave;
kind:=savestack[saveptr-1].int;decr(saveptr);
p:=mem[curlist.headfield].hh.rh;popnest;p:=hpack(p,0,1);
if kind=0 then eqdefine(655421,136,p)else eqdefine(655422,136,p);
if abs(curlist.modefield)=119 then{1425:}
begin begin mem[curlist.tailfield].hh.rh:=makelocalparnode;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end end{:1425};
eqworddefine(1049465,neweqtbint(1049465)+1);end;
procedure builddiscretionary;label 30,10;var p,q:halfword;n:integer;
begin unsave;{1158:}q:=curlist.headfield;p:=mem[q].hh.rh;n:=0;
while p<>0 do begin if not(p>=himemmin)then if mem[p].hh.b0>2 then if
mem[p].hh.b0<>11 then if mem[p].hh.b0<>6 then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66470);end;begin helpptr:=1;helpline[0]:=66471;end;error;
begindiagnostic;printnl(66472);showbox(p);enddiagnostic(true);
flushnodelist(p);mem[q].hh.rh:=0;goto 30;end;q:=p;p:=mem[q].hh.rh;
incr(n);end;30:{:1158};p:=mem[curlist.headfield].hh.rh;popnest;
case savestack[saveptr-1].int of 0:mem[curlist.tailfield+1].hh.lh:=p;
1:mem[curlist.tailfield+1].hh.rh:=p;2:{1157:}
begin if(n>0)and(abs(curlist.modefield)=237)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66464);end;printesc(65635);begin helpptr:=2;helpline[1]:=66465;
helpline[0]:=66466;end;flushnodelist(p);n:=0;error;
end else mem[curlist.tailfield].hh.rh:=p;
if n<=65535 then mem[curlist.tailfield].hh.b1:=n else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66467);end;begin helpptr:=2;helpline[1]:=66468;helpline[0]:=66469;
end;error;end;if n>0 then curlist.tailfield:=q;decr(saveptr);goto 10;
end{:1157};end;incr(savestack[saveptr-1].int);newsavelevel(10);
scanleftbrace;pushnest;curlist.modefield:=-119;
curlist.auxfield.hh.lh:=1000;10:end;{:1156}{1160:}procedure makeaccent;
var s,t:real;p,q,r:halfword;f:internalfontnumber;a,h,x,w,delta:scaled;
i:fourquarters;begin scancharnum;f:=newequiv(720959);
p:=newcharacter(f,curval);
if p<>0 then begin x:=fonttables[f,fonttables[f,43].int+5].int;
s:=fonttables[f,fonttables[f,43].int+1].int/65536.0;
a:=fonttables[f,fonttables[f,36].int+fonttables[f,fonttables[f,34].int-
fonttables[f,5].int+mem[p].hh.b1].qqqq.b0].int;doassignments;{1161:}
q:=0;f:=newequiv(720959);
if(curcmd=11)or(curcmd=12)or(curcmd=70)then q:=newcharacter(f,curchr)
else if curcmd=16 then begin scancharnum;q:=newcharacter(f,curval);
end else backinput{:1161};if q<>0 then{1162:}
begin t:=fonttables[f,fonttables[f,43].int+1].int/65536.0;
i:=fonttables[f,fonttables[f,34].int-fonttables[f,5].int+mem[q].hh.b1].
qqqq;w:=fonttables[f,fonttables[f,36].int+i.b0].int;
h:=fonttables[f,fonttables[f,37].int+(i.b1)div 256].int;
if h<>x then begin p:=hpack(p,0,1);mem[p+4].int:=x-h;end;
delta:=round((w-a)/2.0+h*t-x*s);r:=newkern(delta);mem[r].hh.b1:=2;
mem[curlist.tailfield].hh.rh:=r;mem[r].hh.rh:=p;
curlist.tailfield:=newkern(-a-delta);mem[curlist.tailfield].hh.b1:=2;
mem[p].hh.rh:=curlist.tailfield;p:=q;end{:1162};
mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
curlist.auxfield.hh.lh:=1000;end;end;{:1160}{1164:}procedure alignerror;
begin if abs(alignstate)>2 then{1165:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66477);end;printcmdchr(curcmd,curchr);
if curtok=262182 then begin begin helpptr:=6;helpline[5]:=66478;
helpline[4]:=66479;helpline[3]:=66480;helpline[2]:=66481;
helpline[1]:=66482;helpline[0]:=66483;end;
end else begin begin helpptr:=5;helpline[4]:=66478;helpline[3]:=66484;
helpline[2]:=66481;helpline[1]:=66482;helpline[0]:=66483;end;end;error;
end{:1165}else begin backinput;
if alignstate<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65967);end;incr(alignstate);curtok:=65659;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66473);end;decr(alignstate);curtok:=131197;end;begin helpptr:=3;
helpline[2]:=66474;helpline[1]:=66475;helpline[0]:=66476;end;inserror;
end;end;{:1164}{1166:}procedure noalignerror;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66477);end;printesc(65825);begin helpptr:=2;helpline[1]:=66485;
helpline[0]:=66486;end;error;end;procedure omiterror;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66477);end;printesc(65828);begin helpptr:=2;helpline[1]:=66487;
helpline[0]:=66486;end;error;end;{:1166}{1168:}procedure doendv;
begin baseptr:=inputptr;inputstack[baseptr]:=curinput;
while(inputstack[baseptr].indexfield<>2)and(inputstack[baseptr].locfield
=0)and(inputstack[baseptr].statefield=0)do decr(baseptr);
if(inputstack[baseptr].indexfield<>2)or(inputstack[baseptr].locfield<>0)
or(inputstack[baseptr].statefield<>0)then fatalerror(65904);
if curgroup=6 then begin endgraf;if fincol then finrow;end else offsave;
end;{:1168}{1172:}procedure cserror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66106);end;printesc(65795);begin helpptr:=1;helpline[0]:=66489;
end;error;end;{:1172}{1173:}procedure pushmath(c:groupcode);
begin if neweqtbint(1049483)<>neweqtbint(1049482)then curlist.mathfield
:=true;pushnest;curlist.modefield:=-237;curlist.auxfield.int:=0;{1440:}
begin savestack[saveptr+0].int:=textdirptr;
textdirptr:=newdir(neweqtbint(1049483));incr(saveptr);newsavelevel(c);
eqworddefine(1049480,neweqtbint(1049483));
eqworddefine(1049481,neweqtbint(1049483));
eqworddefine(1049482,neweqtbint(1049483));
eqworddefine(1049467,curlevel);end{:1440};end;{:1173}{1175:}
procedure initmath;label 21,40,45,30;var w:scaled;l:scaled;s:scaled;
p:halfword;q:halfword;f:internalfontnumber;n:integer;v:scaled;d:scaled;
begin gettoken;if(curcmd=3)and(curlist.modefield>0)then{1182:}
begin if curlist.headfield=curlist.tailfield then begin popnest;
w:=-1073741823;end else begin linebreak(neweqtbint(1049415));{1183:}
v:=mem[justbox+4].int+2*fonttables[newequiv(720959),fonttables[newequiv(
720959),43].int+6].int;w:=-1073741823;p:=mem[justbox+5].hh.rh;
while p<>0 do begin{1184:}21:if(p>=himemmin)then begin f:=mem[p].hh.b0;
d:=fonttables[f,fonttables[f,36].int+fonttables[f,fonttables[f,34].int-
fonttables[f,5].int+mem[p].hh.b1].qqqq.b0].int;goto 40;end;
case mem[p].hh.b0 of 0,1,2:begin d:=mem[p+1].int;goto 40;end;6:{686:}
begin mem[memtop-12]:=mem[p+1];mem[memtop-12].hh.rh:=mem[p].hh.rh;
p:=memtop-12;goto 21;end{:686};11,9:d:=mem[p+1].int;10:{1185:}
begin q:=mem[p+1].hh.lh;d:=mem[q+1].int;
if mem[justbox+5].hh.b0=1 then begin if(mem[justbox+5].hh.b1=mem[q].hh.
b0)and(mem[q+2].int<>0)then v:=1073741823;
end else if mem[justbox+5].hh.b0=2 then begin if(mem[justbox+5].hh.b1=
mem[q].hh.b1)and(mem[q+3].int<>0)then v:=1073741823;end;
if mem[p].hh.b1>=100 then goto 40;end{:1185};8:{1403:}d:=0{:1403};
others:d:=0 end{:1184};if v<1073741823 then v:=v+d;goto 45;
40:if v<1073741823 then begin v:=v+d;w:=v;end else begin w:=1073741823;
goto 30;end;45:p:=mem[p].hh.rh;end;30:{:1183};end;{1186:}
if newequiv(524320)=0 then if(neweqtbsc(1180556+(17))<>0)and(((
neweqtbint(1049449)>=0)and(curlist.pgfield+2>neweqtbint(1049449)))or(
curlist.pgfield+1<-neweqtbint(1049449)))then begin l:=neweqtbsc(1180556+
(3))-abs(neweqtbsc(1180556+(17)));
if neweqtbsc(1180556+(17))>0 then s:=neweqtbsc(1180556+(17))else s:=0;
end else begin l:=neweqtbsc(1180556+(3));s:=0;
end else begin n:=mem[newequiv(524320)].hh.lh;
if curlist.pgfield+2>=n then p:=newequiv(524320)+2*n else p:=newequiv(
524320)+2*(curlist.pgfield+2);s:=mem[p-1].int;l:=mem[p].int;end{:1186};
pushmath(15);curlist.modefield:=237;eqworddefine(1049452,-1);
eqworddefine(1180569,w);eqworddefine(1180570,l);eqworddefine(1180571,s);
if newequiv(524328)<>0 then begintokenlist(newequiv(524328),9);
if nestptr=1 then buildpage;end{:1182}else begin backinput;{1176:}
begin pushmath(15);eqworddefine(1049452,-1);
if(insertsrcspecialeverymath)then insertsrcspecial;
if newequiv(524327)<>0 then begintokenlist(newequiv(524327),8);
end{:1176};end;end;{:1175}{1179:}procedure starteqno;
begin savestack[saveptr+0].int:=curchr;incr(saveptr);{1176:}
begin pushmath(15);eqworddefine(1049452,-1);
if(insertsrcspecialeverymath)then insertsrcspecial;
if newequiv(524327)<>0 then begintokenlist(newequiv(524327),8);
end{:1176};end;{:1179}{1188:}{1221:}
function finmlist(p:halfword):halfword;var q:halfword;
begin if curlist.auxfield.int<>0 then{1222:}
begin mem[curlist.auxfield.int+3].hh.rh:=3;
mem[curlist.auxfield.int+3].hh.lh:=mem[curlist.headfield].hh.rh;
if p=0 then q:=curlist.auxfield.int else begin q:=mem[curlist.auxfield.
int+2].hh.lh;
if(mem[q].hh.b0<>30)or(curlist.eTeXauxfield=0)then confusion(66235);
mem[curlist.auxfield.int+2].hh.lh:=mem[curlist.eTeXauxfield].hh.rh;
mem[curlist.eTeXauxfield].hh.rh:=curlist.auxfield.int;
mem[curlist.auxfield.int].hh.rh:=p;end;end{:1222}
else begin mem[curlist.tailfield].hh.rh:=p;
q:=mem[curlist.headfield].hh.rh;end;popnest;finmlist:=q;end;{:1221}
procedure scanmath(p:halfword);label 20,21,10;var c:integer;
begin 20:{410:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:410};
21:case curcmd of 11,12,70:begin c:=newequiv(983872+curchr);
if c=134217728 then begin{1189:}begin curcs:=curchr+1;
curcmd:=neweqtype(curcs);curchr:=newequiv(curcs);xtoken;backinput;
end{:1189};goto 20;end;end;16:begin scancharnum;curchr:=curval;
curcmd:=70;goto 21;end;
17:begin if curchr=0 then scanfifteenbitint else scanbigfifteenbitint;
c:=curval;end;
71:begin c:=((curchr div 4096)*16777216)+(((curchr mod 4096)div 256)
*65536)+(curchr mod 256);end;72:begin c:=curchr;end;
15:begin if curchr=0 then scantwentysevenbitint else scanfiftyonebitint;
c:=curval;end;others:{1190:}begin backinput;scanleftbrace;
savestack[saveptr+0].int:=p;incr(saveptr);pushmath(9);goto 10;end{:1190}
end;mem[p].hh.rh:=1;mem[p].hh.b1:=c mod 65536;
if(c>=117440512)and((neweqtbint(1049452)>=0)and(neweqtbint(1049452)<256)
)then mem[p].hh.b0:=neweqtbint(1049452)else mem[p].hh.b0:=(c div 65536)
mod 256;10:end;{:1188}{1192:}procedure setmathchar(c:integer);
var p:halfword;begin if c>=134217728 then{1189:}begin curcs:=curchr+1;
curcmd:=neweqtype(curcs);curchr:=newequiv(curcs);xtoken;backinput;
end{:1189}else begin p:=newnoad;mem[p+1].hh.rh:=1;
mem[p+1].hh.b1:=c mod 65536;mem[p+1].hh.b0:=(c div 65536)mod 256;
if c>=117440512 then begin if((neweqtbint(1049452)>=0)and(neweqtbint(
1049452)<256))then mem[p+1].hh.b0:=neweqtbint(1049452);mem[p].hh.b0:=16;
end else mem[p].hh.b0:=16+(c div 16777216);
mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;end;end;{:1192}
{1196:}procedure mathlimitswitch;label 10;
begin if curlist.headfield<>curlist.tailfield then if mem[curlist.
tailfield].hh.b0=17 then begin mem[curlist.tailfield].hh.b1:=curchr;
goto 10;end;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66493);end;begin helpptr:=1;helpline[0]:=66494;end;error;10:end;
{:1196}{1197:}procedure scandelimiter(p:halfword;r:integer);
begin if r=1 then scantwentysevenbitint else if r=2 then
scanfiftyonebitint else begin{410:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:410};
case curcmd of 11,12:begin curval:=newequiv(1115020+curchr);
curval1:=newequiv1(1115020+curchr);end;
15:if curchr=0 then scantwentysevenbitint else scanfiftyonebitint;
others:begin curval:=-1;curval1:=-1;end;end;end;
if curval<0 then begin{1198:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66495);end;begin helpptr:=6;helpline[5]:=66496;helpline[4]:=66497;
helpline[3]:=66498;helpline[2]:=66499;helpline[1]:=66500;
helpline[0]:=66501;end;backerror;curval:=0;end{:1198};curval1:=0;end;
mem[p].qqqq.b0:=(curval div 65536)mod 256;
mem[p].qqqq.b1:=curval mod 65536;
mem[p].qqqq.b2:=(curval1 div 65536)mod 256;
mem[p].qqqq.b3:=curval1 mod 65536;end;{:1197}{1200:}
procedure mathradical;
begin begin mem[curlist.tailfield].hh.rh:=getnode(5);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=24;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].hh:=emptyfield;
mem[curlist.tailfield+3].hh:=emptyfield;
mem[curlist.tailfield+2].hh:=emptyfield;
scandelimiter(curlist.tailfield+4,curchr+1);
scanmath(curlist.tailfield+1);end;{:1200}{1202:}procedure mathac;
begin if curcmd=45 then{1203:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66502);end;printesc(65819);print(66503);begin helpptr:=2;
helpline[1]:=66504;helpline[0]:=66505;end;error;end{:1203};
begin mem[curlist.tailfield].hh.rh:=getnode(5);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=28;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].hh:=emptyfield;
mem[curlist.tailfield+3].hh:=emptyfield;
mem[curlist.tailfield+2].hh:=emptyfield;
mem[curlist.tailfield+4].hh.rh:=1;
if curchr=0 then scanfifteenbitint else scanbigfifteenbitint;
mem[curlist.tailfield+4].hh.b1:=curval mod 65536;
if(curval>=117440512)and((neweqtbint(1049452)>=0)and(neweqtbint(1049452)
<256))then mem[curlist.tailfield+4].hh.b0:=neweqtbint(1049452)else mem[
curlist.tailfield+4].hh.b0:=(curval div 65536)mod 256;
scanmath(curlist.tailfield+1);end;{:1202}{1209:}procedure appendchoices;
begin begin mem[curlist.tailfield].hh.rh:=newchoice;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;incr(saveptr);
savestack[saveptr-1].int:=0;pushmath(13);scanleftbrace;end;{:1209}
{1211:}procedure buildchoices;label 10;var p:halfword;begin{1439:}
begin unsave;decr(saveptr);flushnodelist(textdirptr);
textdirptr:=savestack[saveptr+0].int;end{:1439};p:=finmlist(0);
case savestack[saveptr-1].int of 0:mem[curlist.tailfield+1].hh.lh:=p;
1:mem[curlist.tailfield+1].hh.rh:=p;2:mem[curlist.tailfield+2].hh.lh:=p;
3:begin mem[curlist.tailfield+2].hh.rh:=p;decr(saveptr);goto 10;end;end;
incr(savestack[saveptr-1].int);pushmath(13);scanleftbrace;10:end;{:1211}
{1213:}procedure subsup;var t:smallnumber;p:halfword;begin t:=0;p:=0;
if curlist.tailfield<>curlist.headfield then if(mem[curlist.tailfield].
hh.b0>=16)and(mem[curlist.tailfield].hh.b0<30)then begin p:=curlist.
tailfield+2+curcmd-7;t:=mem[p].hh.rh;end;if(p=0)or(t<>0)then{1214:}
begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
p:=curlist.tailfield+2+curcmd-7;
if t<>0 then begin if curcmd=7 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66506);end;begin helpptr:=1;helpline[0]:=66507;end;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66508);end;begin helpptr:=1;helpline[0]:=66509;end;end;error;end;
end{:1214};scanmath(p);end;{:1213}{1218:}procedure mathfraction;
var c:smallnumber;begin c:=curchr;if curlist.auxfield.int<>0 then{1220:}
begin if c>=3 then begin scandelimiter(memtop-12,false);
scandelimiter(memtop-12,false);end;
if c mod 3=0 then scandimen(false,false,false);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66516);end;begin helpptr:=3;helpline[2]:=66517;helpline[1]:=66518;
helpline[0]:=66519;end;error;end{:1220}
else begin curlist.auxfield.int:=getnode(6);
mem[curlist.auxfield.int].hh.b0:=25;mem[curlist.auxfield.int].hh.b1:=0;
mem[curlist.auxfield.int+2].hh.rh:=3;
mem[curlist.auxfield.int+2].hh.lh:=mem[curlist.headfield].hh.rh;
mem[curlist.auxfield.int+3].hh:=emptyfield;
mem[curlist.auxfield.int+4].qqqq:=nulldelimiter;
mem[curlist.auxfield.int+5].qqqq:=nulldelimiter;
mem[curlist.headfield].hh.rh:=0;curlist.tailfield:=curlist.headfield;
{1219:}if c>=3 then begin scandelimiter(curlist.auxfield.int+4,false);
scandelimiter(curlist.auxfield.int+5,false);end;
case c mod 3 of 0:begin scandimen(false,false,false);
mem[curlist.auxfield.int+1].int:=curval;end;
1:mem[curlist.auxfield.int+1].int:=1073741824;
2:mem[curlist.auxfield.int+1].int:=0;end{:1219};end;end;{:1218}{1228:}
procedure mathleftright;var t:smallnumber;p:halfword;q:halfword;
begin t:=curchr;if(t<>30)and(curgroup<>16)then{1229:}
begin if curgroup=15 then begin scandelimiter(memtop-12,false);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66106);end;if t=1 then begin printesc(66236);begin helpptr:=1;
helpline[0]:=66520;end;end else begin printesc(66235);begin helpptr:=1;
helpline[0]:=66521;end;end;error;end else offsave;end{:1229}
else begin p:=newnoad;mem[p].hh.b0:=t;scandelimiter(p+1,false);
if t=1 then begin mem[p].hh.b0:=31;mem[p].hh.b1:=1;end;
if t=30 then q:=p else begin q:=finmlist(p);{1439:}begin unsave;
decr(saveptr);flushnodelist(textdirptr);
textdirptr:=savestack[saveptr+0].int;end{:1439};end;
if t<>31 then begin pushmath(16);mem[curlist.headfield].hh.rh:=q;
curlist.tailfield:=p;curlist.eTeXauxfield:=p;
end else begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=23;mem[curlist.tailfield+1].hh.rh:=3;
mem[curlist.tailfield+1].hh.lh:=q;end;end;end;{:1228}{1231:}
procedure aftermath;var l:boolean;danger:boolean;m:integer;p:halfword;
a:halfword;{1235:}b:halfword;w:scaled;z:scaled;e:scaled;q:scaled;
d:scaled;s:scaled;g1,g2:smallnumber;r:halfword;t:halfword;{:1235}
begin danger:=false;{1232:}
if(fonttables[newequiv(720962),8].int<22)or(fonttables[newequiv(721218),
8].int<22)or(fonttables[newequiv(721474),8].int<22)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66522);end;begin helpptr:=3;helpline[2]:=66523;helpline[1]:=66524;
helpline[0]:=66525;end;error;flushmath;danger:=true;
end else if(fonttables[newequiv(720963),8].int<13)or(fonttables[newequiv
(721219),8].int<13)or(fonttables[newequiv(721475),8].int<13)then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66526);end;begin helpptr:=3;helpline[2]:=66527;helpline[1]:=66528;
helpline[0]:=66529;end;error;flushmath;danger:=true;end{:1232};
m:=curlist.modefield;l:=false;p:=finmlist(0);
if curlist.modefield=-m then begin{1234:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66530);end;begin helpptr:=2;helpline[1]:=66531;helpline[0]:=66532;
end;backerror;end;end{:1234};curmlist:=p;curstyle:=2;
mlistpenalties:=false;mlisttohlist;a:=hpack(mem[memtop-3].hh.rh,0,1);
{1439:}begin unsave;decr(saveptr);flushnodelist(textdirptr);
textdirptr:=savestack[saveptr+0].int;end{:1439};decr(saveptr);
if savestack[saveptr+0].int=1 then l:=true;danger:=false;{1232:}
if(fonttables[newequiv(720962),8].int<22)or(fonttables[newequiv(721218),
8].int<22)or(fonttables[newequiv(721474),8].int<22)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66522);end;begin helpptr:=3;helpline[2]:=66523;helpline[1]:=66524;
helpline[0]:=66525;end;error;flushmath;danger:=true;
end else if(fonttables[newequiv(720963),8].int<13)or(fonttables[newequiv
(721219),8].int<13)or(fonttables[newequiv(721475),8].int<13)then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66526);end;begin helpptr:=3;helpline[2]:=66527;helpline[1]:=66528;
helpline[0]:=66529;end;error;flushmath;danger:=true;end{:1232};
m:=curlist.modefield;p:=finmlist(0);end else a:=0;if m<0 then{1233:}
begin begin mem[curlist.tailfield].hh.rh:=newmath(neweqtbsc(1180556+(1))
,0);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if curlist.mathfield then{1430:}
begin mem[curlist.tailfield].hh.rh:=newdir(neweqtbint(1049483));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1430};curmlist:=p;
curstyle:=2;mlistpenalties:=(curlist.modefield>0);mlisttohlist;
mem[curlist.tailfield].hh.rh:=mem[memtop-3].hh.rh;
while mem[curlist.tailfield].hh.rh<>0 do curlist.tailfield:=mem[curlist.
tailfield].hh.rh;if curlist.mathfield then{1431:}
begin mem[curlist.tailfield].hh.rh:=newdir(neweqtbint(1049483)-64);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1431};
curlist.mathfield:=false;
begin mem[curlist.tailfield].hh.rh:=newmath(neweqtbsc(1180556+(1)),1);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.auxfield.hh.lh:=1000;{1439:}begin unsave;decr(saveptr);
flushnodelist(textdirptr);textdirptr:=savestack[saveptr+0].int;
end{:1439};end{:1233}else begin if a=0 then{1234:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66530);end;begin helpptr:=2;helpline[1]:=66531;helpline[0]:=66532;
end;backerror;end;end{:1234};{1236:}curmlist:=p;curstyle:=0;
mlistpenalties:=false;mlisttohlist;p:=mem[memtop-3].hh.rh;
adjusttail:=memtop-5;b:=hpack(p,0,1);p:=mem[b+5].hh.rh;t:=adjusttail;
adjusttail:=0;w:=mem[b+1].int;z:=neweqtbsc(1180556+(14));
s:=neweqtbsc(1180556+(15));if(a=0)or danger then begin e:=0;q:=0;
end else begin e:=mem[a+1].int;
q:=e+fonttables[newequiv(720962+cursize),6+fonttables[newequiv(720962+
cursize),43].int].int;end;if w+q>z then{1238:}
begin if(e<>0)and((w-totalshrink[0]+q<=z)or(totalshrink[1]<>0)or(
totalshrink[2]<>0)or(totalshrink[3]<>0)or(totalshrink[4]<>0))then begin
freenode(b,8);b:=hpack(p,z-q,0);end else begin e:=0;
if w>z then begin freenode(b,8);b:=hpack(p,z,0);end;end;w:=mem[b+1].int;
end{:1238};{1239:}d:=half(z-w);
if(e>0)and(d<2*e)then begin d:=half(z-w-e);
if p<>0 then if not(p>=himemmin)then if mem[p].hh.b0=10 then d:=0;
end{:1239};{1240:}
begin mem[curlist.tailfield].hh.rh:=newpenalty(neweqtbint(1049419));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if(d+s<=neweqtbsc(1180556+(13)))or l then begin g1:=3;g2:=4;
end else begin g1:=5;g2:=6;end;if l and(e=0)then begin mem[a+4].int:=s;
appendtovlist(a);begin mem[curlist.tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
end else begin mem[curlist.tailfield].hh.rh:=newparamglue(g1);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1240};{1241:}
if e<>0 then begin r:=newkern(z-w-e-d);if l then begin mem[a].hh.rh:=r;
mem[r].hh.rh:=b;b:=a;d:=0;end else begin mem[b].hh.rh:=r;
mem[r].hh.rh:=a;end;b:=hpack(b,0,1);end;mem[b+4].int:=s+d;
appendtovlist(b){:1241};{1242:}
if(a<>0)and(e=0)and not l then begin begin mem[curlist.tailfield].hh.rh
:=newpenalty(10000);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[a+4].int:=s+z-mem[a+1].int;appendtovlist(a);g2:=0;end;
if t<>memtop-5 then begin mem[curlist.tailfield].hh.rh:=mem[memtop-5].hh
.rh;curlist.tailfield:=t;end;
begin mem[curlist.tailfield].hh.rh:=newpenalty(neweqtbint(1049420));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if g2>0 then begin mem[curlist.tailfield].hh.rh:=newparamglue(g2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1242};
resumeafterdisplay{:1236};end;end;{:1231}{1237:}
procedure resumeafterdisplay;
begin if curgroup<>15 then confusion(66533);{1439:}begin unsave;
decr(saveptr);flushnodelist(textdirptr);
textdirptr:=savestack[saveptr+0].int;end{:1439};
curlist.pgfield:=curlist.pgfield+3;pushnest;curlist.modefield:=119;
curlist.auxfield.hh.lh:=1000;
if neweqtbint(1049458)<=0 then curlang:=0 else if neweqtbint(1049458)>
255 then curlang:=0 else curlang:=neweqtbint(1049458);
curlist.auxfield.hh.rh:=curlang;
curlist.pgfield:=(normmin(neweqtbint(1049459))*64+normmin(neweqtbint(
1049460)))*65536+curlang;{1425:}
begin begin mem[curlist.tailfield].hh.rh:=makelocalparnode;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end end{:1425};{450:}
begin getxtoken;if curcmd<>10 then backinput;end{:450};
if nestptr=1 then buildpage;end;{:1237}{1248:}{1252:}
procedure getrtoken;label 20;begin 20:repeat gettoken;
until curtok<>655392;
if(curcs=0)or(curcs>196610)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66551);end;begin helpptr:=5;helpline[4]:=66552;helpline[3]:=66553;
helpline[2]:=66554;helpline[1]:=66555;helpline[0]:=66556;end;
if curcs=0 then backinput;curtok:=1245185;inserror;goto 20;end;end;
{:1252}{1266:}procedure trapzeroglue;
begin if(mem[curval+1].int=0)and(mem[curval+2].int=0)and(mem[curval+3].
int=0)then begin incr(mem[membot].hh.rh);deleteglueref(curval);
curval:=membot;end;end;{:1266}{1273:}
procedure doregistercommand(a:smallnumber);label 40,10;
var l,q,r,s:halfword;p:0..3;begin q:=curcmd;{1274:}
begin if q<>92 then begin getxtoken;
if(curcmd>=76)and(curcmd<=79)then begin l:=curchr;p:=curcmd-76;goto 40;
end;if curcmd<>92 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66003);end;printcmdchr(curcmd,curchr);print(66004);
printcmdchr(q,0);begin helpptr:=1;helpline[0]:=66581;end;error;goto 10;
end;end;p:=curchr;scaneightbitint;case p of 0:l:=curval+1049484;
1:l:=curval+1180581;2:l:=curval+393248;3:l:=curval+458784;end;end;
40:{:1274};
if q=92 then scanoptionalequals else if scankeyword(66577)then;
aritherror:=false;if q<97 then{1275:}
if p<2 then begin if p=0 then scanint else scandimen(false,false,false);
if q=96 then curval:=curval+neweqtbint(l);end else begin scanglue(p);
if q=96 then{1276:}begin q:=newspec(curval);r:=newequiv(l);
deleteglueref(curval);mem[q+1].int:=mem[q+1].int+mem[r+1].int;
if mem[q+2].int=0 then mem[q].hh.b0:=0;
if mem[q].hh.b0=mem[r].hh.b0 then mem[q+2].int:=mem[q+2].int+mem[r+2].
int else if(mem[q].hh.b0<mem[r].hh.b0)and(mem[r+2].int<>0)then begin mem
[q+2].int:=mem[r+2].int;mem[q].hh.b0:=mem[r].hh.b0;end;
if mem[q+3].int=0 then mem[q].hh.b1:=0;
if mem[q].hh.b1=mem[r].hh.b1 then mem[q+3].int:=mem[q+3].int+mem[r+3].
int else if(mem[q].hh.b1<mem[r].hh.b1)and(mem[r+3].int<>0)then begin mem
[q+3].int:=mem[r+3].int;mem[q].hh.b1:=mem[r].hh.b1;end;curval:=q;
end{:1276};end{:1275}else{1277:}begin scanint;
if p<2 then if q=97 then if p=0 then curval:=multandadd(neweqtbint(l),
curval,0,2147483647)else curval:=multandadd(neweqtbint(l),curval,0,
1073741823)else curval:=xovern(neweqtbint(l),curval)else begin s:=
newequiv(l);r:=newspec(s);
if q=97 then begin mem[r+1].int:=multandadd(mem[s+1].int,curval,0,
1073741823);mem[r+2].int:=multandadd(mem[s+2].int,curval,0,1073741823);
mem[r+3].int:=multandadd(mem[s+3].int,curval,0,1073741823);
end else begin mem[r+1].int:=xovern(mem[s+1].int,curval);
mem[r+2].int:=xovern(mem[s+2].int,curval);
mem[r+3].int:=xovern(mem[s+3].int,curval);end;curval:=r;end;end{:1277};
if aritherror then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66578);end;begin helpptr:=2;helpline[1]:=66579;helpline[0]:=66580;
end;if p>=2 then deleteglueref(curval);error;goto 10;end;
if p<2 then if(a>=4)then geqworddefine(l,curval)else eqworddefine(l,
curval)else begin trapzeroglue;
if(a>=4)then geqdefine(l,134,curval)else eqdefine(l,134,curval);end;
10:end;{:1273}{1280:}procedure alteraux;var c:halfword;
begin if curchr<>abs(curlist.modefield)then reportillegalcase else begin
c:=curchr;scanoptionalequals;
if c=1 then begin scandimen(false,false,false);
curlist.auxfield.int:=curval;end else begin scanint;
if(curval<=0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66584);end;begin helpptr:=1;helpline[0]:=66585;end;
interror(curval);end else curlist.auxfield.hh.lh:=curval;end;end;end;
{:1280}{1281:}procedure alterprevgraf;var p:0..nestsize;
begin nest[nestptr]:=curlist;p:=nestptr;
while abs(nest[p].modefield)<>1 do decr(p);scanoptionalequals;scanint;
if curval<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66314);end;printesc(65831);begin helpptr:=1;helpline[0]:=66586;
end;interror(curval);end else begin nest[p].pgfield:=curval;
curlist:=nest[nestptr];end;end;{:1281}{1282:}procedure alterpagesofar;
var c:0..7;begin c:=curchr;scanoptionalequals;
scandimen(false,false,false);pagesofar[c]:=curval;end;{:1282}{1283:}
procedure alterinteger;var c:smallnumber;begin c:=curchr;
scanoptionalequals;scanint;if c=0 then deadcycles:=curval{1501:}
else if c=2 then begin if(curval<0)or(curval>3)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66759);end;begin helpptr:=2;helpline[1]:=66760;helpline[0]:=66761;
end;interror(curval);end else begin curchr:=curval;newinteraction;end;
end{:1501}else insertpenalties:=curval;end;{:1283}{1284:}
procedure alterboxdimen;var c:smallnumber;b:eightbits;begin c:=curchr;
scaneightbitint;b:=curval;scanoptionalequals;
scandimen(false,false,false);
if newequiv(655423+b)<>0 then mem[newequiv(655423+b)+c].int:=curval;end;
{:1284}{1294:}procedure newfont(a:smallnumber);label 50;var u:halfword;
s:scaled;f:internalfontnumber;t:strnumber;oldsetting:0..21;
offset:integer;naturaldir:integer;begin if jobname=0 then openlogfile;
getrtoken;u:=curcs;
if u>=131074 then t:=newhashtext(1246116+u)else if u>=65537 then if u=
131073 then t:=66593 else t:=u-65537 else begin oldsetting:=selector;
selector:=21;print(66593);print(u-1);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(65543,poolsize-initpoolptr);
end;t:=makestring;end;
if(a>=4)then geqdefine(u,90,0)else eqdefine(u,90,0);scanoptionalequals;
scanfilename;{1295:}nameinprogress:=true;
if scankeyword(66598)then{1296:}begin scandimen(false,false,false);
s:=curval;
if(s<=0)or(s>=134217728)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66600);end;printscaled(s);print(66601);begin helpptr:=2;
helpline[1]:=66602;helpline[0]:=66603;end;error;s:=10*65536;end;
end{:1296}else if scankeyword(66599)then begin scanint;s:=-curval;
if(curval<=0)or(curval>32768)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65858);end;begin helpptr:=1;helpline[0]:=65859;end;
interror(curval);s:=-1000;end;end else s:=-1000;
nameinprogress:=false{:1295};nameinprogress:=true;
if scankeyword(66594)then begin scanint;offset:=curval;
if(curval<0)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66595);end;begin helpptr:=1;helpline[0]:=66596;end;
interror(curval);offset:=0;end end else offset:=0;
if scankeyword(66597)then begin scandir;naturaldir:=curval;
end else naturaldir:=-1;nameinprogress:=false;{1297:}
for f:=1 to fontptr do begin if streqstr(fonttables[f,10].int,curname)
and streqstr(fonttables[f,11].int,curarea)then begin if s>0 then begin
if s=fonttables[f,6].int then goto 50;
end else if fonttables[f,6].int=xnoverd(fonttables[f,7].int,-s,1000)then
goto 50;end end{:1297};
f:=readfontinfo(u,curname,curarea,s,offset,naturaldir);50:setequiv(u,f);
setneweqtb(196620+f,neweqtb(u));sethashtext(1442736+f,t);end;{:1294}
{1302:}procedure newinteraction;begin println;interaction:=curchr;
if interaction=0 then kpsemaketexdiscarderrors:=1 else
kpsemaketexdiscarderrors:=0;{75:}
if interaction=0 then selector:=16 else selector:=17{:75};
if logopened then selector:=selector+2;end;{:1302}{1641:}
procedure scanfilereferrent;
begin if scankeyword(66817)then curval:=1073741823 else scanint;end;
procedure scanmode;
begin if scankeyword(66818)then curval:=1 else if scankeyword(66819)then
curval:=2 else if scankeyword(66820)then curval:=3 else if scankeyword(
66821)then curval:=4 else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66822);end;curval:=0;end;end;procedure dochartranslation;
var kind:halfword;fileref:halfword;moderef:halfword;ocpref:halfword;
begin fileref:=0;moderef:=0;ocpref:=0;kind:=curchr;
if(kind mod 4)<=1 then begin scanfilereferrent;fileref:=curval;
end else begin scanmode;moderef:=curval;end;
if kind<4 then begin scanocpident;ocpref:=curval;end;
case(kind mod 4)of 0:begin if(fileref>=0)and(fileref<=15)then begin
readfiletranslation[fileref]:=ocpref;
end else if fileref<>1073741823 then begin termintranslation:=ocpref;
end else begin baseptr:=inputptr;inputstack[baseptr]:=curinput;
while curinput.statefield=0 do begin decr(baseptr);
curinput:=inputstack[baseptr];end;
if curinput.namefield>17 then inputfiletranslation[curinput.indexfield]
:=ocpref;curinput:=inputstack[inputptr];end;end;
1:begin if(fileref>=0)and(fileref<=15)then begin writefiletranslation[
fileref]:=ocpref;end else begin termouttranslation:=ocpref;end;end;
2:begin geqdefine(589875+moderef,137,ocpref);end;
3:begin geqdefine(589880+moderef,137,ocpref);end;end;end;
procedure docharmode;var kind:halfword;fileref:halfword;
moderef:halfword;begin fileref:=0;moderef:=0;kind:=curchr;
if(kind mod 4)<=1 then begin scanfilereferrent;fileref:=curval;end;
if kind<4 then begin scanmode;moderef:=curval;end;
case(kind mod 4)of 0:begin if(fileref>=0)and(fileref<=15)then begin
readfilemode[fileref]:=moderef;
end else if fileref<>1073741823 then begin terminmode:=moderef;
end else begin baseptr:=inputptr;inputstack[baseptr]:=curinput;
while curinput.statefield=0 do begin decr(baseptr);
curinput:=inputstack[baseptr];end;
if curinput.namefield>17 then inputfilemode[curinput.indexfield]:=
moderef;curinput:=inputstack[inputptr];end;end;
1:begin if(fileref>=0)and(fileref<=15)then begin writefilemode[fileref]
:=moderef;end else begin termoutmode:=moderef;end;end;
2:begin geqdefine(589875,137,moderef);end;
3:begin geqdefine(589880,137,moderef);end;end;end;
function pnewinputln(f:alphafile;themode,translation:halfword;
bypasseoln:boolean):boolean;
begin if(themode=0)or((themode=1)and(translation=0))then pnewinputln:=
inputln(f,bypasseoln)else if not newinputline(f,themode,bypasseoln)then
pnewinputln:=false else if translation=0 then begin if(first+otpinputend
)>=bufsize then overflow(65542,bufsize);curinput.statefield:=33;
curinput.startfield:=first;last:=curinput.startfield;
curinput.locfield:=curinput.startfield;
for otpcounter:=1 to otpinputend do begin buffer[last]:=otpinputbuf[
otpcounter];incr(last);end;while buffer[last-1]=' 'do decr(last);
curinput.limitfield:=last-1;
pnewinputln:=true end else begin otpinputstart:=0;otpinputlast:=0;
otpstackused:=0;otpstacklast:=0;otpstacknew:=0;otpoutputend:=0;otppc:=0;
otpfinished:=false;otpcalcptr:=0;otpcalcs[otpcalcptr]:=0;otpstateptr:=0;
otpstates[otpstateptr]:=0;otpinputocp:=translation;
while not otpfinished do{1652:}
begin begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;case otpinstr of{1653:}
1:begin incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalcs[otpcalcptr];decr(otpcalcptr);
incr(otppc);end;2:begin incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otparg;incr(otppc);end;
3:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpoutputend);if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;incr(otppc);end;
4:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;incr(otppc);end;
5:begin otpfirstarg:=otparg+1;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
otpsecondarg:=otpnoinputchars-otparg;
for otpcounter:=otpfirstarg to otpsecondarg do begin begin if(1>
otpcounter)or(otpcounter>otpnoinputchars)then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpcounter>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otpcounter-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpcounter];end;end;
incr(otpoutputend);if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;end;incr(otppc);end{:1653}
;{1654:}6:begin incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalcs[otpcalcptr];decr(otpcalcptr);
incr(otppc);end;7:begin incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otparg;incr(otppc);end;
8:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;incr(otppc);end;
9:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;incr(otppc);end;
10:begin otpfirstarg:=otparg+1;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
otpsecondarg:=otpnoinputchars-otparg;
for otpcounter:=otpfirstarg to otpsecondarg do begin begin if(1>
otpcounter)or(otpcounter>otpnoinputchars)then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpcounter>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otpcounter-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpcounter];end;end;
incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;end;incr(otppc);end{:1654};
{1655:}11:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]+otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
12:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]-otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
13:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]*otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
14:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]div otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
15:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]mod otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
16:begin if otpcalcs[otpcalcptr]>=ocptables[otpinputocp,ocptables[
otpinputocp,9]+otpcalcs[otpcalcptr-1]*2+1]then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66828);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpcalcs[otpcalcptr-1]:=ocptables[otpinputocp,ocptables[otpinputocp,
ocptables[otpinputocp,9]+otpcalcs[otpcalcptr-1]*2]+otpcalcs[otpcalcptr]]
;incr(otppc);decr(otpcalcptr);end;17:begin incr(otpcalcptr);
if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otparg;incr(otppc);end;
18:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpcalcptr);if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otpcalculatedchar;incr(otppc);end;
19:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpcalcptr);
if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otpcalculatedchar;incr(otppc);end{:1655};{1656:}
20:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;otpstates[otpstateptr]:=otparg;otppc:=0;end;
21:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;incr(otpstateptr);
if otpstateptr>=ocpstacksize then overflowocpstacksize;
otpstates[otpstateptr]:=otparg;otppc:=0;end;
22:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;if otpstateptr>0 then decr(otpstateptr);otppc:=0;
end{:1656};{1657:}23:begin otpinputstart:=otpinputlast;
otpinputlast:=otpinputstart;otpstackused:=0;
if(otpstacklast=0)and(otpinputlast>=otpinputend)then otpfinished:=true
else if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];otpnoinputchars:=1;incr(otppc);
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];otpnoinputchars:=1;incr(otppc);
end;end;24:begin otpinputlast:=otpinputstart;otpstackused:=0;
if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];otpnoinputchars:=1;incr(otppc);
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];otpnoinputchars:=1;incr(otppc);
end;end;
25:begin if otpinputstart<otpinputlast then begin decr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];
end else begin decr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];end;decr(otpnoinputchars);
incr(otppc);end{:1657};{1658:}26:begin otppc:=otparg;end;
27:begin otpfirstarg:=otparg;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<>otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;28:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;29:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;30:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;31:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar>otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;32:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar>=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;
33:begin if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];incr(otpnoinputchars);
incr(otppc);
end else if otpinputlast>=otpinputend then begin otppc:=otparg;
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];incr(otpnoinputchars);
incr(otppc);end;end;34:begin if otpinputlast=0 then begin otppc:=otparg;
end else begin incr(otppc);end;end;
35:begin if otpinputlast>=otpinputend then begin otppc:=otparg;
end else begin incr(otppc);end;end{:1658};{1659:}
36:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;otppc:=0;end{:1659};
others:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66826);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end end;end{:1652};
if(first+otpoutputend)>=bufsize then overflow(65542,bufsize);
curinput.statefield:=33;curinput.startfield:=first;
last:=curinput.startfield;curinput.locfield:=curinput.startfield;
for otpcounter:=1 to otpoutputend do begin buffer[last]:=otpoutputbuf[
otpcounter];incr(last);end;while buffer[last-1]=' 'do decr(last);
curinput.limitfield:=last-1;pnewinputln:=true end end;{:1641}{1663:}
procedure newocp(a:smallnumber);label 50;var u:halfword;
f:internalocpnumber;t:strnumber;oldsetting:0..21;
flushablestring:strnumber;externalocp:boolean;
begin if jobname=0 then openlogfile;
if curchr=1 then externalocp:=true else externalocp:=false;getrtoken;
u:=curcs;
if u>=131074 then t:=newhashtext(1246116+u)else if u>=65537 then if u=
131073 then t:=66846 else t:=u-65537 else begin oldsetting:=selector;
selector:=21;print(66846);print(u-1);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(65543,poolsize-initpoolptr);
end;t:=makestring;end;
if(a>=4)then geqdefine(u,107,0)else eqdefine(u,107,0);
scanoptionalequals;scanfilename;{1664:}flushablestring:=strptr-1;
for f:=1 to ocpptr do if streqstr(ocptables[f,1],curname)and streqstr(
ocptables[f,2],curarea)then begin if curname=flushablestring then begin
begin decr(strptr);poolptr:=strstartar[strptr-65536];end;
curname:=ocptables[f,1];end;goto 50 end{:1664};
f:=readocpinfo(u,curname,curarea,curext,externalocp);50:setequiv(u,f);
setneweqtb(262157+f,neweqtb(u));sethashtext(1508273+f,t);
if newequiv(524335)=1 then begin printnl(65624);printesc(66829);
printesc(t);print(61);print(curname);end;end;{:1663}{1665:}
procedure newocplist(a:smallnumber);var u:halfword;
f:internalocplistnumber;t:strnumber;oldsetting:0..21;
begin if jobname=0 then openlogfile;getrtoken;u:=curcs;
if u>=131074 then t:=newhashtext(1246116+u)else if u>=65537 then if u=
131073 then t:=66847 else t:=u-65537 else begin oldsetting:=selector;
selector:=21;print(66847);print(u-1);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(65543,poolsize-initpoolptr);
end;t:=makestring;end;
if(a>=4)then geqdefine(u,109,0)else eqdefine(u,109,0);
scanoptionalequals;f:=readocplist;setequiv(u,f);
setneweqtb(327693+f,neweqtb(u));sethashtext(1573809+f,t);
if newequiv(524335)=1 then begin printnl(65624);printesc(66831);
printesc(t);print(61);printocplist(ocplistlist[f]);end;end;{:1665}
{1666:}procedure dopushocplist(a:smallnumber);var ocplistno:halfword;
oldnumber:halfword;i:integer;begin scanocplistident;ocplistno:=curval;
oldnumber:=newequiv(524336);
if(a>=4)then geqdefine(524339+oldnumber,137,ocplistno)else eqdefine(
524339+oldnumber,137,ocplistno);
if(a>=4)then geqdefine(524336,137,(oldnumber+1))else eqdefine(524336,137
,(oldnumber+1));if newequiv(524335)=1 then begin printnl(66848);
for i:=oldnumber downto 0 do begin printesc(newhashtext(1573809+newequiv
(524339+i)));print(61);printocplist(ocplistlist[newequiv(524339+i)]);
if i<>0 then print(44);end;print(125);end;activecompile;
if(a>=4)then geqdefine(524337,137,activeminptr)else eqdefine(524337,137,
activeminptr);
if(a>=4)then geqdefine(524338,137,activemaxptr)else eqdefine(524338,137,
activemaxptr);end;{:1666}{1667:}procedure dopopocplist(a:smallnumber);
var oldnumber:halfword;i:integer;begin oldnumber:=newequiv(524336);
if oldnumber=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66849);end;
end else if(a>=4)then geqdefine(524336,137,(oldnumber-1))else eqdefine(
524336,137,(oldnumber-1));
if newequiv(524335)=1 then begin printnl(66848);
for i:=(oldnumber-2)downto 0 do begin printesc(newhashtext(1573809+
newequiv(524339+i)));print(61);
printocplist(ocplistlist[newequiv(524339+i)]);if i<>0 then print(44);
end;print(125);end;activecompile;
if(a>=4)then geqdefine(524337,137,activeminptr)else eqdefine(524337,137,
activeminptr);
if(a>=4)then geqdefine(524338,137,activemaxptr)else eqdefine(524338,137,
activemaxptr);end;{:1667}{1668:}
procedure doclearocplists(a:smallnumber);
begin if(a>=4)then geqdefine(524336,137,0)else eqdefine(524336,137,0);
activecompile;
if(a>=4)then geqdefine(524337,137,activeminptr)else eqdefine(524337,137,
activeminptr);
if(a>=4)then geqdefine(524338,137,activemaxptr)else eqdefine(524338,137,
activemaxptr);end;{:1668}procedure prefixedcommand;label 30,10;
var a:smallnumber;f:internalfontnumber;j:halfword;k:fontindex;
p,q:halfword;n:integer;e:boolean;begin a:=0;
while curcmd=99 do begin if not odd(a div curchr)then a:=a+curchr;{410:}
repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:410};
if curcmd<=73 then{1249:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66543);end;printcmdchr(curcmd,curchr);printchar(39);
begin helpptr:=1;helpline[0]:=66544;end;
if(eTeXmode=1)then helpline[0]:=66545;backerror;goto 10;end{:1249};
if neweqtbint(1049444)>2 then if(eTeXmode=1)then showcurcmdchr;end;
{1250:}if a>=8 then begin j:=917505;a:=a-8;end else j:=0;
if(curcmd<>103)and((a mod 4<>0)or(j<>0))then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66003);end;printesc(66535);print(66546);printesc(66536);
begin helpptr:=1;helpline[0]:=66547;end;
if(eTeXmode=1)then begin helpline[0]:=66548;print(66546);
printesc(66549);end;print(66550);printcmdchr(curcmd,curchr);
printchar(39);error;end{:1250};{1251:}
if neweqtbint(1049451)<>0 then if neweqtbint(1049451)<0 then begin if(a
>=4)then a:=a-4;end else begin if not(a>=4)then a:=a+4;end{:1251};
case curcmd of{1254:}
90:if(a>=4)then geqdefine(720959,137,curchr)else eqdefine(720959,137,
curchr);{:1254}{1255:}
103:begin if odd(curchr)and not(a>=4)and(neweqtbint(1049451)>=0)then a:=
a+4;e:=(curchr>=2);getrtoken;p:=curcs;q:=scantoks(true,e);
if j<>0 then begin q:=getavail;mem[q].hh.lh:=j;
mem[q].hh.rh:=mem[defref].hh.rh;mem[defref].hh.rh:=q;end;
if(a>=4)then geqdefine(p,128+(a mod 4),defref)else eqdefine(p,128+(a mod
4),defref);end;{:1255}{1258:}100:begin n:=curchr;getrtoken;p:=curcs;
if n=0 then begin repeat gettoken;until curcmd<>10;
if curtok=786493 then begin gettoken;if curcmd=10 then gettoken;end;
end else begin gettoken;q:=curtok;gettoken;backinput;curtok:=q;
backinput;end;if curcmd>=128 then incr(mem[curchr].hh.lh);
if(a>=4)then geqdefine(p,curcmd,curchr)else eqdefine(p,curcmd,curchr);
end;{:1258}{1261:}101:begin n:=curchr;getrtoken;p:=curcs;
if(a>=4)then geqdefine(p,0,65536)else eqdefine(p,0,65536);
scanoptionalequals;case n of 0:begin scancharnum;
if(a>=4)then geqdefine(p,70,curval)else eqdefine(p,70,curval);end;
1:begin scanrealfifteenbitint;
if(a>=4)then geqdefine(p,71,curval)else eqdefine(p,71,curval);end;
2:begin scanbigfifteenbitint;
if(a>=4)then geqdefine(p,72,curval)else eqdefine(p,72,curval);end;
others:begin scaneightbitint;
case n of 3:if(a>=4)then geqdefine(p,76,1049484+curval)else eqdefine(p,
76,1049484+curval);
4:if(a>=4)then geqdefine(p,77,1180581+curval)else eqdefine(p,77,1180581+
curval);
5:if(a>=4)then geqdefine(p,78,393248+curval)else eqdefine(p,78,393248+
curval);
6:if(a>=4)then geqdefine(p,79,458784+curval)else eqdefine(p,79,458784+
curval);
7:if(a>=4)then geqdefine(p,75,589885+curval)else eqdefine(p,75,589885+
curval);end;end end;end;{:1261}{1262:}102:begin j:=curchr;scanint;
n:=curval;
if not scankeyword(66200)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66434);end;begin helpptr:=2;helpline[1]:=66568;helpline[0]:=66569;
end;error;end;getrtoken;p:=curcs;readtoks(n,p,j);
if(a>=4)then geqdefine(p,128,curval)else eqdefine(p,128,curval);end;
{:1262}{1263:}74,75:begin q:=curcs;
if curcmd=74 then begin scaneightbitint;p:=589885+curval;
end else p:=curchr;scanoptionalequals;{410:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:410};if curcmd<>1 then{1264:}
begin if curcmd=74 then begin scaneightbitint;curcmd:=75;
curchr:=589885+curval;end;if curcmd=75 then begin q:=newequiv(curchr);
if q=0 then if(a>=4)then geqdefine(p,118,0)else eqdefine(p,118,0)else
begin incr(mem[q].hh.lh);
if(a>=4)then geqdefine(p,128,q)else eqdefine(p,128,q);end;goto 30;end;
end{:1264};backinput;curcs:=q;q:=scantoks(false,false);
if mem[defref].hh.rh=0 then begin if(a>=4)then geqdefine(p,118,0)else
eqdefine(p,118,0);begin mem[defref].hh.rh:=avail;avail:=defref;
ifdef('STAT')decr(dynused);endif('STAT')end;
end else begin if p=524325 then begin mem[q].hh.rh:=getavail;
q:=mem[q].hh.rh;mem[q].hh.lh:=131197;q:=getavail;mem[q].hh.lh:=65659;
mem[q].hh.rh:=mem[defref].hh.rh;mem[defref].hh.rh:=q;end;
if(a>=4)then geqdefine(p,128,defref)else eqdefine(p,128,defref);end;end;
{:1263}{1265:}76:begin p:=curchr;scanoptionalequals;scanint;
if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);
if(abs(curlist.modefield)=119)and((p=(1049463))or(p=(1049464)))then
begin{1425:}begin begin mem[curlist.tailfield].hh.rh:=makelocalparnode;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end end{:1425};
eqworddefine(1049465,neweqtbint(1049465)+1);
curlist.localparboolfield:=true;end;end;95:begin{1427:}
case curchr of 1049479:begin if itsallover then begin scandir;
eqworddefine(1049479,curval);end;end;
1049480:begin if itsallover then begin scandir;
eqworddefine(1049480,curval);end;end;1049481:begin scandir;
eqworddefine(1049481,curval);end;1049482:begin scandir;
if(neweqtbint(1049466)>0)and(abs(curlist.modefield)=119)then begin{1432:
}begin mem[curlist.tailfield].hh.rh:=newdir(neweqtbint(1049482));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1432};
mem[curlist.tailfield+1].hh.lh:=mem[curlist.tailfield+1].hh.lh-64;end;
if mem[textdirptr+1].hh.rh=curlevel then{1444:}
begin textdirtmp:=mem[textdirptr].hh.rh;freenode(textdirptr,4);
textdirptr:=textdirtmp;end{:1444};eqworddefine(1049482,curval);{1443:}
begin textdirtmp:=newdir(neweqtbint(1049482));
mem[textdirtmp].hh.rh:=textdirptr;textdirptr:=textdirtmp;end{:1443};
if abs(curlist.modefield)=119 then begin{1432:}
begin mem[curlist.tailfield].hh.rh:=newdir(neweqtbint(1049482));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1432};
mem[curlist.tailfield+1].hh.rh:=curlevel;end;
eqworddefine(1049466,neweqtbint(1049466)+1);
eqworddefine(1049467,curlevel);end;1049483:begin scandir;
eqworddefine(1049483,curval);end;end;{:1427}end;77:begin p:=curchr;
scanoptionalequals;scandimen(false,false,false);
if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);end;
78,79:begin p:=curchr;n:=curcmd;scanoptionalequals;
if n=79 then scanglue(3)else scanglue(2);trapzeroglue;
if(a>=4)then geqdefine(p,134,curval)else eqdefine(p,134,curval);end;
{:1265}{1269:}88:begin if curchr=(1115276)then begin p:=curchr-256;
scancharnum;p:=p+curval;scanoptionalequals;scanint;curval1:=curval;
scanint;
if(curval1>16777215)or(curval>16777215)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(65548);
print(66572);end;printint(curval1);print(32);printint(curval);
print(66573);begin helpptr:=1;helpline[0]:=66574;end;error;curval1:=0;
curval:=0;end;
if(a>=4)then delgeqworddefine(p,curval1,curval)else deleqworddefine(p,
curval1,curval);end else begin{1270:}
if curchr=721728 then n:=15 else if curchr=983872 then n:=32768 else if
curchr=(984128)then n:=134217728 else if curchr=918336 then n:=32767
else if curchr=1115020 then n:=16777215 else n:=65535{:1270};p:=curchr;
scancharnum;p:=p+curval;scanoptionalequals;scanint;
if((curval<0)and(p<1115020))or(curval>n)then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66572);end;printint(curval);
if p<1115020 then print(66575)else print(66576);printint(n);
begin helpptr:=1;helpline[0]:=66574;end;error;curval:=0;end;
if p<983872 then if(a>=4)then geqdefine(p,137,curval)else eqdefine(p,137
,curval)else if p<(984128)then begin if curval=32768 then curval:=
134217728 else curval:=((curval div 4096)*16777216)+(((curval mod 4096)
div 256)*65536)+(curval mod 256);
if(a>=4)then geqdefine(p,137,curval)else eqdefine(p,137,curval);
end else if p<1115020 then if(a>=4)then geqdefine(p-256,137,curval)else
eqdefine(p-256,137,curval)else begin curval1:=curval div 4096;
curval1:=(curval1 div 256)*65536+(curval1 mod 256);
curval:=curval mod 4096;curval:=(curval div 256)*65536+(curval mod 256);
if(a>=4)then delgeqworddefine(p,curval1,curval)else deleqworddefine(p,
curval1,curval);end;end;end;{:1269}{1271:}89:begin p:=curchr;
scanbigfourbitint;p:=p+curval;scanoptionalequals;scanfontident;
if(a>=4)then geqdefine(p,137,curval)else eqdefine(p,137,curval);end;
{:1271}{1272:}92,96,97,98:doregistercommand(a);{:1272}{1278:}
104:begin scaneightbitint;
if(a>=4)then n:=(1073807360)+curval else n:=1073741824+curval;
scanoptionalequals;
if setboxallowed then scanbox(n)else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65997);end;printesc(65837);begin helpptr:=2;helpline[1]:=66582;
helpline[0]:=66583;end;error;end;end;{:1278}{1279:}82:alteraux;
83:alterprevgraf;84:alterpagesofar;85:alterinteger;86:alterboxdimen;
{:1279}{1285:}87:begin q:=curchr;scanoptionalequals;scanint;n:=curval;
if n<=0 then p:=0 else if q>524320 then begin n:=(curval div 2)+1;
p:=getnode(2*n+1);mem[p].hh.lh:=n;n:=curval;mem[p+1].int:=n;
for j:=p+2 to p+n+1 do begin scanint;mem[j].int:=curval;end;
if not odd(n)then mem[p+n+2].int:=0;end else begin p:=getnode(2*n+1);
mem[p].hh.lh:=n;for j:=1 to n do begin scandimen(false,false,false);
mem[p+2*j-1].int:=curval;scandimen(false,false,false);
mem[p+2*j].int:=curval;end;end;
if(a>=4)then geqdefine(q,135,p)else eqdefine(q,135,p);end;{:1285}{1289:}
105:if curchr=1 then begin ifdef('INITEX')if iniversion then begin
newpatterns;goto 30;end;endif('INITEX')begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66587);end;helpptr:=0;error;repeat gettoken;until curcmd=2;
goto 10;end else begin newhyphexceptions;goto 30;end;{:1289}{1290:}
80:begin n:=curchr;if n=0 then begin findfontdimen(true);k:=curval;
scanoptionalequals;scandimen(false,false,false);
fonttables[dimenfont,k].int:=curval;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66588);end;begin helpptr:=2;helpline[1]:=66589;helpline[0]:=66590;
end;error;scancharnum;scanoptionalequals;scandimen(false,false,false);
end end;81:begin n:=curchr;scanfontident;f:=curval;scanoptionalequals;
scanint;
if n=0 then fonttables[f,16].int:=curval else fonttables[f,17].int:=
curval;end;{:1290}{1293:}91:newfont(a);{:1293}{1301:}106:newinteraction;
{:1301}{1662:}107:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66842);end;printesc(66832);print(66843);println end;108:newocp(a);
109:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66844);end;printesc(66832);print(66843);println end;
110:newocplist(a);112:dopushocplist(a);113:dopopocplist(a);
111:doclearocplists(a);114:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66845);end;printesc(66831);print(66843);println end;
115:begin scanoptionalequals;scanint;if curval<>0 then curval:=1;
if(a>=4)then geqdefine(524335,137,curval)else eqdefine(524335,137,curval
);end;{:1662}others:confusion(66542)end;30:{1306:}
if aftertoken<>0 then begin curtok:=aftertoken;backinput;aftertoken:=0;
end{:1306};10:end;{:1248}{1307:}procedure doassignments;label 10;
begin while true do begin{410:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:410};if curcmd<=73 then goto 10;
setboxallowed:=false;prefixedcommand;setboxallowed:=true;end;10:end;
{:1307}{1312:}procedure openorclosein;var c:0..1;n:0..15;
begin c:=curchr;scanfourbitint;n:=curval;
if readopen[n]<>2 then begin aclose(readfile[n]);readopen[n]:=2;end;
if c<>0 then begin scanoptionalequals;scanfilename;
packfilename(curname,curarea,curext);texinputtype:=0;
if kpseinnameok(nameoffile+1)and aopenin(readfile[n],kpsetexformat)then
readopen[n]:=1;end;end;{:1312}{1316:}procedure issuemessage;
var oldsetting:0..21;c:0..1;s:strnumber;begin c:=curchr;
mem[memtop-12].hh.rh:=scantoks(false,true);oldsetting:=selector;
selector:=21;tokenshow(defref);selector:=oldsetting;flushlist(defref);
begin if poolptr+1>poolsize then overflow(65543,poolsize-initpoolptr);
end;s:=makestring;if c=0 then{1317:}
begin if termoffset+length(s)>maxprintline-2 then println else if(
termoffset>0)or(fileoffset>0)then printchar(32);slowprint(s);
fflush(stdout);end{:1317}else{1320:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65624);end;slowprint(s);
if newequiv(524334)<>0 then useerrhelp:=true else if longhelpseen then
begin helpptr:=1;helpline[0]:=66610;
end else begin if interaction<3 then longhelpseen:=true;
begin helpptr:=4;helpline[3]:=66611;helpline[2]:=66612;
helpline[1]:=66613;helpline[0]:=66614;end;end;error;useerrhelp:=false;
end{:1320};begin decr(strptr);poolptr:=strstartar[strptr-65536];end;end;
{:1316}{1325:}procedure shiftcase;var b:halfword;p:halfword;t:halfword;
c:eightbits;begin b:=curchr;p:=scantoks(false,false);
p:=mem[defref].hh.rh;while p<>0 do begin{1326:}t:=mem[p].hh.lh;
if t<1114112 then begin c:=t mod 65536;
if newequiv(b+c)<>0 then mem[p].hh.lh:=t-c+newequiv(b+c);end{:1326};
p:=mem[p].hh.rh;end;begintokenlist(mem[defref].hh.rh,3);
begin mem[defref].hh.rh:=avail;avail:=defref;ifdef('STAT')decr(dynused);
endif('STAT')end;end;{:1325}{1330:}procedure showwhatever;label 50;
var p:halfword;t:smallnumber;m:0..4;l:integer;n:integer;
begin case curchr of 3:begin begindiagnostic;showactivities;end;
1:{1333:}begin scaneightbitint;begindiagnostic;printnl(66630);
printint(curval);printchar(61);
if newequiv(655423+curval)=0 then print(65696)else showbox(newequiv(
655423+curval));end{:1333};0:{1331:}begin gettoken;
if interaction=3 then;printnl(66626);
if curcs<>0 then begin sprintcs(curcs);printchar(61);end;printmeaning;
goto 50;end{:1331};{1482:}4:begin begindiagnostic;showsavegroups;end;
{:1482}{1496:}6:begin begindiagnostic;printnl(65624);println;
if condptr=0 then begin printnl(65649);print(66756);
end else begin p:=condptr;n:=0;repeat incr(n);p:=mem[p].hh.rh;until p=0;
p:=condptr;t:=curif;l:=ifline;m:=iflimit;repeat printnl(66757);
printint(n);print(65873);printcmdchr(122,t);if m=2 then printesc(66105);
if l<>0 then begin print(66755);printint(l);end;decr(n);t:=mem[p].hh.b1;
l:=mem[p+1].int;m:=mem[p].hh.b0;p:=mem[p].hh.rh;until p=0;end;end;
{:1496}others:{1334:}begin p:=thetoks;if interaction=3 then;
printnl(66626);tokenshow(memtop-3);flushlist(mem[memtop-3].hh.rh);
goto 50;end{:1334}end;{1335:}enddiagnostic(true);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66631);end;
if selector=19 then if neweqtbint(1049437)<=0 then begin selector:=17;
print(66632);selector:=19;end{:1335};
50:if interaction<3 then begin helpptr:=0;decr(errorcount);
end else if neweqtbint(1049437)>0 then begin begin helpptr:=3;
helpline[2]:=66621;helpline[1]:=66622;helpline[0]:=66623;end;
end else begin begin helpptr:=5;helpline[4]:=66621;helpline[3]:=66622;
helpline[2]:=66623;helpline[1]:=66624;helpline[0]:=66625;end;end;error;
end;{:1330}{1339:}ifdef('INITEX')procedure storefmtfile;
label 41,42,31,32;var j,k:integer;p,q:halfword;x:integer;
formatengine:^char;begin{1341:}
if saveptr<>0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66634);end;begin helpptr:=1;helpline[0]:=66635;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end{:1341};{1370:}
selector:=21;print(66651);print(jobname);printchar(32);
printint(neweqtbint(1049431));printchar(46);
printint(neweqtbint(1049430));printchar(46);
printint(neweqtbint(1049429));printchar(41);
if interaction=0 then selector:=18 else selector:=19;
begin if poolptr+1>poolsize then overflow(65543,poolsize-initpoolptr);
end;formatident:=makestring;packjobname(66114);
while not wopenout(fmtfile)do promptfilename(66652,66114);
printnl(66653);slowprint(wmakenamestring(fmtfile));begin decr(strptr);
poolptr:=strstartar[strptr-65536];end;printnl(65624);
slowprint(formatident){:1370};{1344:}dumpint(1462916184);
x:=strlen(enginename);formatengine:=xmallocarray(char,x+4);
strcpy(formatengine,enginename);for k:=x to x+3 do formatengine[k]:=0;
x:=x+4-(x mod 4);dumpint(x);dumpthings(formatengine[0],x);
libcfree(formatengine);dumpint(143720498);dumpint(1073741823);{1459:}
dumpint(eTeXmode);for j:=0 to-0 do setneweqtbint(1049478+j,0);{:1459}
{1515:}while pseudofiles<>0 do pseudoclose;{:1515}dumpint(membot);
dumpint(memtop);dumpint(1246116);dumpint(55711);dumpint(607){:1344};
{1346:}dumpint(poolptr);dumpint(strptr);
dumpthings(strstartar[-0],strptr-65535);dumpthings(strpool[0],poolptr);
println;printint(strptr);print(66636);printint(poolptr){:1346};{1348:}
sortavail;varused:=0;dumpint(lomemmax);dumpint(rover);p:=membot;
q:=rover;x:=0;repeat dumpthings(mem[p],q+2-p);x:=x+q+2-p;
varused:=varused+q-p;p:=q+mem[q].hh.lh;q:=mem[q+1].hh.rh;until q=rover;
varused:=varused+lomemmax-p;dynused:=memend+1-himemmin;
dumpthings(mem[p],lomemmax+1-p);x:=x+lomemmax+1-p;dumpint(himemmin);
dumpint(avail);dumpthings(mem[himemmin],memend+1-himemmin);
x:=x+memend+1-himemmin;p:=avail;while p<>0 do begin decr(dynused);
p:=mem[p].hh.rh;end;dumpint(varused);dumpint(dynused);println;
printint(x);print(66637);printint(varused);printchar(38);
printint(dynused){:1348};{1350:}dumpeqtbtable;dumpint(parloc);
dumpint(writeloc);dumpint(specialloc);{1352:}dumpint(hashused);{:1352}
{:1350};{1354:}dumpint(fontptr);for k:=0 to fontptr do{1356:}
begin dumpfonttable(k,fonttables[k,43].int+fonttables[k,8].int+1);
printnl(66639);printesc(newhashtext(1442736+k));printchar(61);
printfilename(fonttables[k,10].int,fonttables[k,11].int,65624);
if fonttables[k,6].int<>fonttables[k,7].int then begin print(66070);
printscaled(fonttables[k,6].int);print(65683);end;end{:1356};println;
printint(fontptr-0);print(66638);
if fontptr<>1 then printchar(115){:1354};{1358:}dumpint(activeminptr);
dumpint(activemaxptr);dumpthings(activeinfo[0],activemaxptr);println;
printint(activemaxptr);print(66640);{:1358};{1360:}dumpint(ocpptr);
for k:=0 to ocpptr do{1362:}begin dumpocptable(k);printnl(66642);
printesc(newhashtext(1508273+k));printchar(61);
printfilename(ocptables[k,1],ocptables[k,2],65624);end{:1362};println;
printint(ocpptr-0);print(66641);if ocpptr<>1 then printchar(115){:1360};
{1364:}dumpint(ocplistmemptr);dumpthings(ocplistinfo[0],ocplistmemptr);
dumpint(ocplistptr);dumpthings(ocplistlist[0],ocplistptr+1);
for k:=0 to ocplistptr do begin printnl(66643);
printesc(newhashtext(1573809+k));printchar(61);
printocplist(ocplistlist[k]);end;dumpint(ocplstackmemptr);
dumpthings(ocplstackinfo[0],ocplstackmemptr){:1364};{1366:}
dumpint(hyphcount);if hyphnext<=607 then hyphnext:=hyphsize;
dumpint(hyphnext);
for k:=0 to hyphsize do if hyphword[k]<>0 then begin dumpint(k+65536*
hyphlink[k]);dumpint(hyphword[k]);dumpint(hyphlist[k]);end;println;
printint(hyphcount);print(66644);if hyphcount<>1 then printchar(115);
if trienotready then inittrie;dumpint(triemax);dumpint(hyphstart);
dumpthings(trie[0],triemax+1);dumpint(maxhyphchar);dumpint(trieopptr);
dumpthings(hyfdistance[1],trieopptr);dumpthings(hyfnum[1],trieopptr);
dumpthings(hyfnext[1],trieopptr);printnl(66645);printint(triemax);
print(66646);printint(trieopptr);print(66647);
if trieopptr<>1 then printchar(115);print(66648);printint(trieopsize);
for k:=255 downto 0 do if trieused[k]>0 then begin printnl(66649);
printint(trieused[k]);print(66650);printint(k);dumpint(k);
dumpint(trieused[k]);end{:1366};{1368:}dumpint(interaction);
dumpint(formatident);dumpint(69069);setneweqtbint(1049439,0){:1368};
{1371:}wclose(fmtfile){:1371};end;endif('INITEX'){:1339}{1390:}{1391:}
procedure newwhatsit(s:smallnumber;w:smallnumber);var p:halfword;
begin p:=getnode(w);mem[p].hh.b0:=8;mem[p].hh.b1:=s;
mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;end;{:1391}{1392:}
procedure newwritewhatsit(w:smallnumber);begin newwhatsit(curchr,w);
if w<>2 then scanfourbitint else begin scanint;
if curval<0 then curval:=17 else if(curval>15)and(curval<>18)then curval
:=16;end;mem[curlist.tailfield+1].hh.lh:=curval;end;{:1392}
procedure doextension;var k:integer;p:halfword;
begin case curchr of 0:{1393:}begin newwritewhatsit(3);
scanoptionalequals;scanfilename;mem[curlist.tailfield+1].hh.rh:=curname;
mem[curlist.tailfield+2].hh.lh:=curarea;
mem[curlist.tailfield+2].hh.rh:=curext;end{:1393};1:{1394:}
begin k:=curcs;newwritewhatsit(2);curcs:=k;p:=scantoks(false,false);
mem[curlist.tailfield+1].hh.rh:=defref;end{:1394};2:{1395:}
begin newwritewhatsit(2);mem[curlist.tailfield+1].hh.rh:=0;end{:1395};
3:{1396:}begin if scankeyword(66422)then begin newwhatsit(4,2);
mem[curlist.tailfield+1].hh.lh:=0;p:=scantoks(false,false);
mem[curlist.tailfield+1].hh.rh:=defref;end else begin newwhatsit(3,2);
mem[curlist.tailfield+1].hh.lh:=0;p:=scantoks(false,true);
mem[curlist.tailfield+1].hh.rh:=defref;end;end{:1396};5:{1417:}
begin getxtoken;
if(curcmd=59)and(curchr<=2)then begin p:=curlist.tailfield;doextension;
outwhat(curlist.tailfield);flushnodelist(curlist.tailfield);
curlist.tailfield:=p;mem[p].hh.rh:=0;end else backinput;end{:1417};
6:{1419:}
if abs(curlist.modefield)<>119 then reportillegalcase else begin
newwhatsit(5,2);scanint;
if curval<=0 then curlist.auxfield.hh.rh:=0 else if curval>255 then
curlist.auxfield.hh.rh:=0 else curlist.auxfield.hh.rh:=curval;
mem[curlist.tailfield+1].hh.rh:=curlist.auxfield.hh.rh;
mem[curlist.tailfield+1].hh.b0:=normmin(neweqtbint(1049459));
mem[curlist.tailfield+1].hh.b1:=normmin(neweqtbint(1049460));end{:1419};
others:confusion(66677)end;end;{:1390}{1418:}procedure fixlanguage;
var l:ASCIIcode;
begin if neweqtbint(1049458)<=0 then l:=0 else if neweqtbint(1049458)>
255 then l:=0 else l:=neweqtbint(1049458);
if l<>curlist.auxfield.hh.rh then begin newwhatsit(5,2);
mem[curlist.tailfield+1].hh.rh:=l;curlist.auxfield.hh.rh:=l;
mem[curlist.tailfield+1].hh.b0:=normmin(neweqtbint(1049459));
mem[curlist.tailfield+1].hh.b1:=normmin(neweqtbint(1049460));end;end;
{:1418}{1669:}procedure insertsrcspecial;var toklist,p,q:halfword;
begin if(sourcefilenamestack[inopen]>0 and isnewsource(
sourcefilenamestack[inopen],line))then begin toklist:=getavail;
p:=toklist;mem[p].hh.lh:=specialtoken;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=65659;
q:=strtoks(makesrcspecial(sourcefilenamestack[inopen],line));
mem[p].hh.rh:=mem[memtop-3].hh.rh;p:=q;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=131197;begintokenlist(toklist,4);
remembersourceinfo(sourcefilenamestack[inopen],line);end;end;
procedure appendsrcspecial;var q:halfword;
begin if(sourcefilenamestack[inopen]>0 and isnewsource(
sourcefilenamestack[inopen],line))then begin newwhatsit(3,2);
mem[curlist.tailfield+1].hh.lh:=0;defref:=getavail;mem[defref].hh.lh:=0;
q:=strtoks(makesrcspecial(sourcefilenamestack[inopen],line));
mem[defref].hh.rh:=mem[memtop-3].hh.rh;
mem[curlist.tailfield+1].hh.rh:=defref;
remembersourceinfo(sourcefilenamestack[inopen],line);end;end;{:1669}
{1105:}procedure handlerightbrace;var p,q:halfword;d:scaled;f:integer;
begin case curgroup of 1:begin tempnowhatsits:=neweqtbint(1049465);
tempnodirs:=neweqtbint(1049466);temporarydir:=neweqtbint(1049482);
if mem[textdirptr+1].hh.rh=curlevel then{1444:}
begin textdirtmp:=mem[textdirptr].hh.rh;freenode(textdirptr,4);
textdirptr:=textdirtmp;end{:1444};unsave;
if abs(curlist.modefield)=119 then begin if tempnodirs<>0 then begin{
1432:}begin mem[curlist.tailfield].hh.rh:=newdir(neweqtbint(1049482));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1432};
mem[curlist.tailfield+1].hh.lh:=temporarydir-64;end;
if tempnowhatsits<>0 then{1425:}
begin begin mem[curlist.tailfield].hh.rh:=makelocalparnode;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end end{:1425};end end;
0:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66404);end;begin helpptr:=2;helpline[1]:=66405;helpline[0]:=66406;
end;error;end;14,15,16:extrarightbrace;{1122:}2:package(0);
3:begin adjusttail:=memtop-5;package(0);end;4:begin endgraf;package(0);
end;5:begin endgraf;package(4);end;{:1122}{1137:}11:begin endgraf;
q:=newequiv(393240);incr(mem[q].hh.rh);d:=neweqtbsc(1180556+(6));
f:=neweqtbint(1049450);unsave;decr(saveptr);
p:=vpackage(mem[curlist.headfield].hh.rh,0,1,1073741823);popnest;
if savestack[saveptr+0].int<>255 then begin begin mem[curlist.tailfield]
.hh.rh:=getnode(5);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=3;
mem[curlist.tailfield].hh.b1:=savestack[saveptr+0].int;
mem[curlist.tailfield+3].int:=mem[p+3].int+mem[p+2].int;
mem[curlist.tailfield+4].hh.lh:=mem[p+5].hh.rh;
mem[curlist.tailfield+4].hh.rh:=q;mem[curlist.tailfield+2].int:=d;
mem[curlist.tailfield+1].int:=f;
end else begin begin mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].int:=mem[p+5].hh.rh;deleteglueref(q);end;
freenode(p,8);if nestptr=0 then buildpage;end;8:{1062:}
begin if(curinput.locfield<>0)or((curinput.indexfield<>6)and(curinput.
indexfield<>3))then{1063:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66370);end;begin helpptr:=2;helpline[1]:=66371;helpline[0]:=66372;
end;error;repeat gettoken;until curinput.locfield=0;end{:1063};
endtokenlist;endgraf;unsave;outputactive:=false;insertpenalties:=0;
{1064:}if newequiv(655678)<>0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66373);end;printesc(65695);printint(255);begin helpptr:=3;
helpline[2]:=66374;helpline[1]:=66375;helpline[0]:=66376;end;
boxerror(255);end{:1064};
if curlist.tailfield<>curlist.headfield then begin mem[pagetail].hh.rh:=
mem[curlist.headfield].hh.rh;pagetail:=curlist.tailfield;end;
if mem[memtop-2].hh.rh<>0 then begin if mem[memtop-1].hh.rh=0 then nest[
0].tailfield:=pagetail;mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;
mem[memtop-1].hh.rh:=mem[memtop-2].hh.rh;mem[memtop-2].hh.rh:=0;
pagetail:=memtop-2;end;flushnodelist(discptr[2]);discptr[2]:=0;popnest;
buildpage;end{:1062};{:1137}{1155:}10:builddiscretionary;
17:buildlocalbox;{:1155}{1169:}6:begin backinput;curtok:=1245186;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(65935);end;printesc(66258);print(65936);begin helpptr:=1;
helpline[0]:=66488;end;inserror;end;{:1169}{1170:}7:begin endgraf;
unsave;alignpeek;end;{:1170}{1205:}12:begin endgraf;unsave;
saveptr:=saveptr-2;
p:=vpackage(mem[curlist.headfield].hh.rh,savestack[saveptr+1].int,
savestack[saveptr+0].int,1073741823);popnest;
begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=29;mem[curlist.tailfield+1].hh.rh:=2;
mem[curlist.tailfield+1].hh.lh:=p;end;{:1205}{1210:}13:buildchoices;
{:1210}{1223:}9:begin{1439:}begin unsave;decr(saveptr);
flushnodelist(textdirptr);textdirptr:=savestack[saveptr+0].int;
end{:1439};decr(saveptr);mem[savestack[saveptr+0].int].hh.rh:=3;
p:=finmlist(0);mem[savestack[saveptr+0].int].hh.lh:=p;
if p<>0 then if mem[p].hh.rh=0 then if mem[p].hh.b0=16 then begin if mem
[p+3].hh.rh=0 then if mem[p+2].hh.rh=0 then begin mem[savestack[saveptr
+0].int].hh:=mem[p+1].hh;freenode(p,4);end;
end else if mem[p].hh.b0=28 then if savestack[saveptr+0].int=curlist.
tailfield+1 then if mem[curlist.tailfield].hh.b0=16 then{1224:}
begin q:=curlist.headfield;
while mem[q].hh.rh<>curlist.tailfield do q:=mem[q].hh.rh;
mem[q].hh.rh:=p;freenode(curlist.tailfield,4);curlist.tailfield:=p;
end{:1224};end;{:1223}others:confusion(66407)end;end;{:1105}
procedure maincontrol;
label 60,21,70,80,90,91,92,95,100,101,110,111,112,120,10;var t:integer;
begin if newequiv(524331)<>0 then begintokenlist(newequiv(524331),12);
60:getxtoken;21:{1067:}
if interrupt<>0 then if OKtointerrupt then begin backinput;
begin if interrupt<>0 then pauseforinstructions;end;goto 60;end;
ifdef('TEXMF_DEBUG')if panicking then checkmem(false);
endif('TEXMF_DEBUG')if neweqtbint(1049444)>0 then showcurcmdchr{:1067};
case abs(curlist.modefield)+curcmd of 130,131,189:goto 70;
135:begin scancharnum;curchr:=curval;goto 70;end;184:begin getxtoken;
if(curcmd=11)or(curcmd=12)or(curcmd=70)or(curcmd=16)then cancelboundary
:=true;goto 21;end;187:begin t:=curchr;getxtoken;
if(curcmd=11)or(curcmd=12)or(curcmd=70)or(curcmd=16)then begin if t=0
then newleftghost:=true else newrightghost:=true;end;goto 21;end;
129:if curlist.auxfield.hh.lh=1000 then goto 120 else appspace;
183,301:goto 120;{1082:}1,119,237,11,247,302:;40,158,276:begin{412:}
repeat getxtoken;until curcmd<>10{:412};goto 21;end;
15:if itsallover then goto 10;{1085:}23,140,258,74,192,310,{:1085}
{1135:}39,{:1135}{1148:}45,{:1148}{1181:}49,167,{:1181}
7,125,243:reportillegalcase;{1083:}
8,126,9,127,18,136,72,190,73,191,51,169,16,134,50,168,53,171,67,185,54,
172,55,173,57,175,56,174,31,149,52,170,29,147,47,165,246,250,251,264,261
,270,273{:1083}:insertdollarsign;{1093:}
37,154,272:begin begin mem[curlist.tailfield].hh.rh:=scanrulespec;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if abs(curlist.modefield)=1 then curlist.auxfield.int:=-65536000 else if
abs(curlist.modefield)=119 then curlist.auxfield.hh.lh:=1000;end;{:1093}
{1094:}28,145,263,265:appendglue;30,148,266,267:appendkern;{:1094}
{1100:}2,120:begin newsavelevel(1);eqworddefine(1049465,0);
eqworddefine(1049466,0);end;62,180,298:begin newsavelevel(14);
eqworddefine(1049465,0);eqworddefine(1049466,0);end;
63,181,299:if curgroup=14 then begin tempnowhatsits:=neweqtbint(1049465)
;tempnodirs:=neweqtbint(1049466);temporarydir:=neweqtbint(1049482);
if mem[textdirptr+1].hh.rh=curlevel then{1444:}
begin textdirtmp:=mem[textdirptr].hh.rh;freenode(textdirptr,4);
textdirptr:=textdirtmp;end{:1444};unsave;
if abs(curlist.modefield)=119 then begin if tempnodirs<>0 then begin{
1432:}begin mem[curlist.tailfield].hh.rh:=newdir(neweqtbint(1049482));
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1432};
mem[curlist.tailfield+1].hh.lh:=temporarydir-64;end;
if tempnowhatsits<>0 then{1425:}
begin begin mem[curlist.tailfield].hh.rh:=makelocalparnode;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end end{:1425};
end end else offsave;{:1100}{1104:}3,121,239:handlerightbrace;{:1104}
{1110:}22,141,259:begin t:=curchr;scandimen(false,false,false);
if t=0 then scanbox(curval)else scanbox(-curval);end;
32,150,268:scanbox((((1073807360)+65536)+1)-99+curchr);
21,139,257:beginbox(0);95,213,331:begin scaneightbitint;
curbox:=newequiv(655423+curval);scanoptionalequals;scandir;
if curbox<>0 then mem[curbox+7].int:=curval;end;{:1110}{1127:}
44:newgraf(curchr>0);
12,13,17,71,69,4,24,36,46,48,27,34,65,66:begin backinput;newgraf(true);
end;{:1127}{1129:}162,280:indentinhmode;{:1129}{1131:}
14:begin normalparagraph;if curlist.modefield>0 then buildpage;end;
132:begin if alignstate<0 then offsave;endgraf;
if curlist.modefield=1 then buildpage;end;
133,146,155,143,151:headforvmode;{:1131}{1134:}
38,156,274,157,275:begininsertoradjust;19,137,255:makemark;{:1134}
{1139:}43,161,279:appendpenalty;{:1139}{1141:}26,144,262:deletelast;
{:1141}{1146:}25,142,260:unpackage;{:1146}{1149:}
163:appenditaliccorrection;
281:begin mem[curlist.tailfield].hh.rh:=newkern(0);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;{:1149}{1153:}
166,284:appenddiscretionary;70,188,306:appendlocalbox(curchr);{:1153}
{1159:}164:makeaccent;{:1159}{1163:}6,124,242,5,123,241:alignerror;
35,153,271:noalignerror;64,182,300:omiterror;{:1163}{1167:}
33,152:initalign;
269:if privileged then if curgroup=15 then initalign else offsave;
10,128:doendv;{:1167}{1171:}68,186,304:cserror;{:1171}{1174:}
122:initmath;{:1174}{1177:}
285:if privileged then if curgroup=15 then starteqno else offsave;
{:1177}{1187:}238:begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;backinput;
scanmath(curlist.tailfield+1);end;{:1187}{1191:}
248,249,307:setmathchar(newequiv(983872+curchr));253:begin scancharnum;
curchr:=curval;setmathchar(newequiv(983872+curchr));end;
254:begin if curchr=0 then scanfifteenbitint else scanbigfifteenbitint;
setmathchar(curval);end;
308:begin setmathchar(((curchr div 4096)*16777216)+(((curchr mod 4096)
div 256)*65536)+(curchr mod 256));end;309:begin setmathchar(curchr);end;
252:begin if curchr=0 then scantwentysevenbitint else scanfiftyonebitint
;setmathchar(curval);end;{:1191}{1195:}
287:begin begin mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=curchr;scanmath(curlist.tailfield+1);end;
288:mathlimitswitch;{:1195}{1199:}303:mathradical;{:1199}{1201:}
282,283:mathac;{:1201}{1204:}293:begin scanspec(12,false);
normalparagraph;pushnest;curlist.modefield:=-1;
curlist.auxfield.int:=-65536000;
if(insertsrcspecialeveryvbox)then insertsrcspecial;
if newequiv(524330)<>0 then begintokenlist(newequiv(524330),11);end;
{:1204}{1208:}290:begin mem[curlist.tailfield].hh.rh:=newstyle(curchr);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
292:begin begin mem[curlist.tailfield].hh.rh:=newglue(membot);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=98;end;291:appendchoices;{:1208}{1212:}
245,244:subsup;{:1212}{1217:}289:mathfraction;{:1217}{1227:}
286:mathleftright;{:1227}{1230:}
240:if curgroup=15 then aftermath else offsave;{:1230}{1247:}
75,193,311,76,194,312,77,195,313,96,214,332,78,196,314,79,197,315,80,198
,316,81,199,317,82,200,318,83,201,319,84,202,320,85,203,321,86,204,322,
87,205,323,88,206,324,89,207,325,90,208,326,91,209,327,92,210,328,93,211
,329,97,215,333,98,216,334,99,217,335,100,218,336,101,219,337,102,220,
338,103,221,339,104,222,340,105,223,341,106,224,342,107,225,343,108,226,
344,109,227,345,110,228,346,111,229,347,112,230,348,113,231,349,114,232,
350,115,233,351,116,234,352:prefixedcommand;118,236,354:docharmode;
117,235,353:dochartranslation;{:1247}{1305:}41,159,277:begin gettoken;
aftertoken:=curtok;end;{:1305}{1308:}42,160,278:begin gettoken;
saveforafter(curtok);end;{:1308}{1311:}61,179,297:openorclosein;{:1311}
{1313:}59,177,295:issuemessage;{:1313}{1322:}58,176,294:shiftcase;
{:1322}{1327:}20,138,256:showwhatever;{:1327}{1389:}
60,178,296:doextension;{:1389}{:1082}end;goto 60;
70:if islastocp(curinput.ocplstackfield,curinput.ocpnofield)then begin{
1070:}
if((curlist.headfield=curlist.tailfield)and(curlist.modefield>0))then
begin if(insertsrcspecialauto)then appendsrcspecial;end;
mains:=newequiv(918336+curchr);
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;mainf:=newequiv(720959);
bchar:=fonttables[mainf,19].int;falsebchar:=fonttables[mainf,20].int;
if curlist.modefield>0 then if neweqtbint(1049458)<>curlist.auxfield.hh.
rh then fixlanguage;begin ligstack:=avail;
if ligstack=0 then ligstack:=getavail else begin avail:=mem[ligstack].hh
.rh;mem[ligstack].hh.rh:=0;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[ligstack].hh.b0:=mainf;curl:=curchr;mem[ligstack].hh.b1:=curl;
curq:=curlist.tailfield;
if cancelboundary then begin cancelboundary:=false;maink:=0;
leftghost:=newleftghost;rightghost:=newrightghost;newleftghost:=false;
newrightghost:=false;end else maink:=fonttables[mainf,18].int;
if maink=0 then goto 92;curr:=curl;curl:=65536;
if not newrightghost then goto 111;80:{1071:}
if curl<65536 then begin if mem[curq].hh.rh>0 then if mem[curlist.
tailfield].hh.b1=fonttables[mainf,16].int then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=0 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end{:1071};
90:{1072:}if ligstack=0 then goto 21;curq:=curlist.tailfield;
curl:=mem[ligstack].hh.b1;91:if not(ligstack>=himemmin)then goto 95;
92:leftghost:=newleftghost;rightghost:=newrightghost;
newleftghost:=false;newrightghost:=false;
if(curchr<fonttables[mainf,12].int)or(curchr>fonttables[mainf,13].int)
then begin charwarning(mainf,curchr);begin mem[ligstack].hh.rh:=avail;
avail:=ligstack;ifdef('STAT')decr(dynused);endif('STAT')end;goto 60;end;
maini:=fonttables[mainf,fonttables[mainf,34].int-fonttables[mainf,5].int
+curl].qqqq;if not(maini.b0>0)then begin charwarning(mainf,curchr);
begin mem[ligstack].hh.rh:=avail;avail:=ligstack;
ifdef('STAT')decr(dynused);endif('STAT')end;goto 60;end;
if not(leftghost or rightghost)then begin mem[curlist.tailfield].hh.rh:=
ligstack;curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1072};
100:{1074:}getnext;if curcmd=11 then goto 101;
if curcmd=12 then goto 101;if curcmd=70 then goto 101;xtoken;
if curcmd=11 then goto 101;if curcmd=12 then goto 101;
if curcmd=70 then goto 101;if curcmd=16 then begin scancharnum;
curchr:=curval;goto 101;end;if curcmd=68 then begin t:=curchr;getxtoken;
if(curcmd=11)or(curcmd=12)or(curcmd=70)or(curcmd=16)then begin if t=0
then newleftghost:=true else newrightghost:=true;backinput;goto 100;end;
end;if curcmd=65 then bchar:=65536;curr:=bchar;ligstack:=0;goto 110;
101:mains:=newequiv(918336+curchr);
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;begin ligstack:=avail;
if ligstack=0 then ligstack:=getavail else begin avail:=mem[ligstack].hh
.rh;mem[ligstack].hh.rh:=0;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[ligstack].hh.b0:=mainf;curr:=curchr;mem[ligstack].hh.b1:=curr;
if curr=falsebchar then curr:=65536{:1074};110:{1075:}
if newrightghost or leftghost then goto 80;
if((maini.b2)mod 4)<>1 then goto 80;
maink:=fonttables[mainf,40].int+maini.b3;
mainj:=fonttables[mainf,maink].qqqq;
if(mainj.b0 mod 256)<=128 then goto 112;
maink:=fonttables[mainf,40].int+256*mainj.b2+mainj.b3+32768-256*(128);
111:mainj:=fonttables[mainf,maink].qqqq;
112:if(mainj.b0 div 256)=0 then begin if fonttables[mainf,5].int+mainj.
b1=curr then if(mainj.b0 mod 256)<=128 then{1077:}
begin if mainj.b2>=128 then begin if curl<65536 then begin if mem[curq].
hh.rh>0 then if mem[curlist.tailfield].hh.b1=fonttables[mainf,16].int
then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=0 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
begin mem[curlist.tailfield].hh.rh:=newkern(fonttables[mainf,fonttables[
mainf,41].int+256*mainj.b2+mainj.b3].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if newleftghost or rightghost then begin mem[curlist.tailfield].hh.b1:=1
;end;goto 90;end;if newleftghost or rightghost then goto 80;
if curl=65536 then lfthit:=true else if ligstack=0 then rthit:=true;
begin if interrupt<>0 then pauseforinstructions;end;
case mainj.b2 of 1,5:begin curl:=fonttables[mainf,5].int+mainj.b3;
maini:=fonttables[mainf,fonttables[mainf,34].int-fonttables[mainf,5].int
+curl].qqqq;ligaturepresent:=true;end;
2,6:begin curr:=fonttables[mainf,5].int+mainj.b3;
if ligstack=0 then begin ligstack:=newligitem(curr);bchar:=65536;
end else if(ligstack>=himemmin)then begin mainp:=ligstack;
ligstack:=newligitem(curr);mem[ligstack+1].hh.rh:=mainp;
end else mem[ligstack].hh.b1:=curr;end;
3:begin curr:=fonttables[mainf,5].int+mainj.b3;mainp:=ligstack;
ligstack:=newligitem(curr);mem[ligstack].hh.rh:=mainp;end;
7,11:begin if curl<65536 then begin if mem[curq].hh.rh>0 then if mem[
curlist.tailfield].hh.b1=fonttables[mainf,16].int then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if false then if ligstack=0 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
curq:=curlist.tailfield;curl:=fonttables[mainf,5].int+mainj.b3;
maini:=fonttables[mainf,fonttables[mainf,34].int-fonttables[mainf,5].int
+curl].qqqq;ligaturepresent:=true;end;
others:begin curl:=fonttables[mainf,5].int+mainj.b3;
ligaturepresent:=true;if ligstack=0 then goto 80 else goto 91;end end;
if mainj.b2>4 then if mainj.b2<>7 then goto 80;
if curl<65536 then goto 110;maink:=fonttables[mainf,18].int;goto 111;
end{:1077};
end else begin if(fonttables[mainf,12].int<=curr)then if(fonttables[
mainf,13].int>=curr)then if((fonttables[mainf,fonttables[mainf,34].int-
fonttables[mainf,5].int+curr].qqqq.b0>0))then if curr<>bchar then if
fonttables[mainf,5].int+mainj.b1=fonttables[mainf,fonttables[mainf,
fonttables[mainf,35].int+curr].int].int then{1076:}
begin if newleftghost or rightghost then goto 80;
case mainj.b2 of 20:begin if curl<65536 then begin if mem[curq].hh.rh>0
then if mem[curlist.tailfield].hh.b1=fonttables[mainf,16].int then
insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=0 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
begin mem[curlist.tailfield].hh.rh:=newkern(fonttables[mainf,fonttables[
mainf,30].int+mainj.b3].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;
18:begin if curl<65536 then begin if mem[curq].hh.rh>0 then if mem[
curlist.tailfield].hh.b1=fonttables[mainf,16].int then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=0 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
kglue:=fonttables[mainf,32].int+(mainj.b3*4);
fontgluespec:=newspec(membot);
mem[fontgluespec+1].int:=fonttables[mainf,kglue+1].int;
mem[fontgluespec+2].int:=fonttables[mainf,kglue+2].int;
mem[fontgluespec+3].int:=fonttables[mainf,kglue+3].int;
begin mem[curlist.tailfield].hh.rh:=newglue(fontgluespec);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;
19:begin if curl<65536 then begin if mem[curq].hh.rh>0 then if mem[
curlist.tailfield].hh.b1=fonttables[mainf,16].int then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=0 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
begin mem[curlist.tailfield].hh.rh:=newpenalty(fonttables[mainf,
fonttables[mainf,33].int+(mainj.b3 div 256)].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
kglue:=fonttables[mainf,32].int+((mainj.b3 mod 256)*4);
fontgluespec:=newspec(membot);
mem[fontgluespec+1].int:=fonttables[mainf,kglue+1].int;
mem[fontgluespec+2].int:=fonttables[mainf,kglue+2].int;
mem[fontgluespec+3].int:=fonttables[mainf,kglue+3].int;
begin mem[curlist.tailfield].hh.rh:=newglue(fontgluespec);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;
17:begin if curl<65536 then begin if mem[curq].hh.rh>0 then if mem[
curlist.tailfield].hh.b1=fonttables[mainf,16].int then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=0 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=mainp;curlist.tailfield:=mainp;
ligaturepresent:=false;end;if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
begin mem[curlist.tailfield].hh.rh:=newpenalty(fonttables[mainf,
fonttables[mainf,33].int+mainj.b3].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;goto 90;
end{:1076};end;
if(mainj.b0 mod 256)=0 then incr(maink)else begin if(mainj.b0 mod 256)>=
128 then goto 80;maink:=maink+(mainj.b0 mod 256)+1;end;goto 111{:1075};
95:{1073:}mainp:=mem[ligstack+1].hh.rh;
if mainp>0 then begin mem[curlist.tailfield].hh.rh:=mainp;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;tempptr:=ligstack;
ligstack:=mem[tempptr].hh.rh;freenode(tempptr,2);
maini:=fonttables[mainf,fonttables[mainf,34].int-fonttables[mainf,5].int
+curl].qqqq;ligaturepresent:=true;
if ligstack=0 then if mainp>0 then goto 100 else curr:=bchar else curr:=
mem[ligstack].hh.b1;goto 110{:1073}{:1070};end else begin{1647:}
begin if(curcmd=70)or(curcmd=16)then{1648:}begin backinput;
curinput.ocplstackfield:=activeinfo[activereal+1].int;
curinput.ocpnofield:=activeinfo[activereal].hh.b1;end{:1648}
else begin{1649:}begin otpinitinputend:=0;
while(curcmd=11)or(curcmd=12)or(curcmd=10)do begin incr(otpinitinputend)
;if otpinitinputend>ocpbufsize then overflowocpbufsize;
otpinitinputbuf[otpinitinputend]:=curchr;getxtoken;
if(curcmd=16)then begin scancharnum;curchr:=curval;end;end;backinput;
otpinputend:=otpinitinputend;
for otpi:=0 to otpinitinputend do begin otpinputbuf[otpi]:=
otpinitinputbuf[otpi];end;end{:1649};{1650:}
begin otpinputocp:=activeinfo[activereal].hh.b0;
if otpinputocp=0 then begin printnl(66823);otpoutputend:=0;
end else if ocptables[otpinputocp,3]=0 then begin otpinputstart:=0;
otpinputlast:=0;otpstackused:=0;otpstacklast:=0;otpstacknew:=0;
otpoutputend:=0;otppc:=0;otpfinished:=false;otpcalcptr:=0;
otpcalcs[otpcalcptr]:=0;otpstateptr:=0;otpstates[otpstateptr]:=0;
while not otpfinished do{1652:}
begin begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;case otpinstr of{1653:}
1:begin incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalcs[otpcalcptr];decr(otpcalcptr);
incr(otppc);end;2:begin incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otparg;incr(otppc);end;
3:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpoutputend);if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;incr(otppc);end;
4:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpoutputend);
if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;incr(otppc);end;
5:begin otpfirstarg:=otparg+1;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
otpsecondarg:=otpnoinputchars-otparg;
for otpcounter:=otpfirstarg to otpsecondarg do begin begin if(1>
otpcounter)or(otpcounter>otpnoinputchars)then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpcounter>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otpcounter-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpcounter];end;end;
incr(otpoutputend);if otpoutputend>ocpbufsize then overflowocpbufsize;
otpoutputbuf[otpoutputend]:=otpcalculatedchar;end;incr(otppc);end{:1653}
;{1654:}6:begin incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalcs[otpcalcptr];decr(otpcalcptr);
incr(otppc);end;7:begin incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otparg;incr(otppc);end;
8:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;incr(otppc);end;
9:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;incr(otppc);end;
10:begin otpfirstarg:=otparg+1;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
otpsecondarg:=otpnoinputchars-otparg;
for otpcounter:=otpfirstarg to otpsecondarg do begin begin if(1>
otpcounter)or(otpcounter>otpnoinputchars)then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpcounter>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otpcounter-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpcounter];end;end;
incr(otpstacknew);
if otpstacknew>=ocpstacksize then overflowocpstacksize;
otpstackbuf[otpstacknew]:=otpcalculatedchar;end;incr(otppc);end{:1654};
{1655:}11:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]+otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
12:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]-otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
13:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]*otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
14:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]div otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
15:begin otpcalcs[otpcalcptr-1]:=otpcalcs[otpcalcptr-1]mod otpcalcs[
otpcalcptr];incr(otppc);decr(otpcalcptr);end;
16:begin if otpcalcs[otpcalcptr]>=ocptables[otpinputocp,ocptables[
otpinputocp,9]+otpcalcs[otpcalcptr-1]*2+1]then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66828);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpcalcs[otpcalcptr-1]:=ocptables[otpinputocp,ocptables[otpinputocp,
ocptables[otpinputocp,9]+otpcalcs[otpcalcptr-1]*2]+otpcalcs[otpcalcptr]]
;incr(otppc);decr(otpcalcptr);end;17:begin incr(otpcalcptr);
if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otparg;incr(otppc);end;
18:begin begin if(1>otparg)or(otparg>otpnoinputchars)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otparg>otpstacklast then begin otpcalculatedchar:=otpinputbuf[
otpinputstart+otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otparg];end;end;
incr(otpcalcptr);if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otpcalculatedchar;incr(otppc);end;
19:begin begin if(1>otpnoinputchars-otparg)or(otpnoinputchars-otparg>
otpnoinputchars)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66827);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
if otpnoinputchars-otparg>otpstacklast then begin otpcalculatedchar:=
otpinputbuf[otpinputstart+otpnoinputchars-otparg-otpstacklast];
end else begin otpcalculatedchar:=otpstackbuf[otpnoinputchars-otparg];
end;end;incr(otpcalcptr);
if otpcalcptr>=ocpstacksize then overflowocpstacksize;
otpcalcs[otpcalcptr]:=otpcalculatedchar;incr(otppc);end{:1655};{1656:}
20:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;otpstates[otpstateptr]:=otparg;otppc:=0;end;
21:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;incr(otpstateptr);
if otpstateptr>=ocpstacksize then overflowocpstacksize;
otpstates[otpstateptr]:=otparg;otppc:=0;end;
22:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;if otpstateptr>0 then decr(otpstateptr);otppc:=0;
end{:1656};{1657:}23:begin otpinputstart:=otpinputlast;
otpinputlast:=otpinputstart;otpstackused:=0;
if(otpstacklast=0)and(otpinputlast>=otpinputend)then otpfinished:=true
else if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];otpnoinputchars:=1;incr(otppc);
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];otpnoinputchars:=1;incr(otppc);
end;end;24:begin otpinputlast:=otpinputstart;otpstackused:=0;
if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];otpnoinputchars:=1;incr(otppc);
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];otpnoinputchars:=1;incr(otppc);
end;end;
25:begin if otpinputstart<otpinputlast then begin decr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];
end else begin decr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];end;decr(otpnoinputchars);
incr(otppc);end{:1657};{1658:}26:begin otppc:=otparg;end;
27:begin otpfirstarg:=otparg;incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<>otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;28:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;29:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;30:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar<=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;31:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar>otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;32:begin otpfirstarg:=otparg;
incr(otppc);
begin if otppc>=ocptables[otpinputocp,ocptables[otpinputocp,10]+
otpstates[otpstateptr]*2+1]then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66825);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
otpinstruction:=ocptables[otpinputocp,ocptables[otpinputocp,ocptables[
otpinputocp,10]+otpstates[otpstateptr]*2]+otppc];
otpinstr:=otpinstruction div 16777216;
otparg:=otpinstruction mod 16777216;end;
if otpinputchar>=otpfirstarg then begin otppc:=otparg;
end else begin incr(otppc);end;end;
33:begin if(otpstackused<otpstacklast)then begin incr(otpstackused);
otpinputchar:=otpstackbuf[otpstackused];incr(otpnoinputchars);
incr(otppc);
end else if otpinputlast>=otpinputend then begin otppc:=otparg;
end else begin incr(otpinputlast);
otpinputchar:=otpinputbuf[otpinputlast];incr(otpnoinputchars);
incr(otppc);end;end;34:begin if otpinputlast=0 then begin otppc:=otparg;
end else begin incr(otppc);end;end;
35:begin if otpinputlast>=otpinputend then begin otppc:=otparg;
end else begin incr(otppc);end;end{:1658};{1659:}
36:begin otpinputstart:=otpinputlast;
for otpcounter:=1 to(otpstacknew-otpstackused)do begin otpstackbuf[
otpcounter]:=otpstackbuf[otpcounter+otpstackused];end;
otpstacknew:=otpstacknew-otpstackused;otpstacklast:=otpstacknew;
otpstackused:=0;otppc:=0;end{:1659};
others:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(65548);
print(66826);end;begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end end;end{:1652};
end else begin k:=0;if nameoffile then libcfree(nameoffile);
otpextstr:=ocptables[otpinputocp,3];
otpextstrarg:=ocptables[otpinputocp,4];
nameoffile:=xmalloc(4+length(otpextstr)+length(otpextstrarg));
for otpexti:=strstartar[otpextstr-65536]to strstartar[otpextstr-65536]+
length(otpextstr)-1 do begin c:=strpool[otpexti];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;begin c:=32;if not(c=34)then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end end;
for otpexti:=strstartar[otpextstrarg-65536]to strstartar[otpextstrarg
-65536]+length(otpextstrarg)-1 do begin c:=strpool[otpexti];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;nameoffile[length(otpextstr)+length(otpextstrarg)+2]:=0;
runexternalocp(nameoffile);end end{:1650};{1651:}
if otpoutputend>0 then begin if(first+otpoutputend)>=bufsize then begin
overflow(66824,bufsize);end;
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(65902,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.ocplstackfield:=activeinfo[activereal+1].int;
curinput.ocpnofield:=activeinfo[activereal].hh.b1;
curinput.statefield:=1;last:=first;curinput.startfield:=first;
curinput.locfield:=first;
for otpcounter:=1 to otpoutputend do begin buffer[last]:=otpoutputbuf[
otpcounter];incr(last);end;curinput.limitfield:=last-1;first:=last;
end{:1651};end;goto 60;end;{:1647};end;120:{1078:}
if newequiv(393242)=membot then begin{1079:}
begin mainp:=fonttables[newequiv(720959),14].int;
if mainp=0 then begin mainp:=newspec(membot);
maink:=fonttables[newequiv(720959),43].int+2;
mem[mainp+1].int:=fonttables[newequiv(720959),maink].int;
mem[mainp+2].int:=fonttables[newequiv(720959),maink+1].int;
mem[mainp+3].int:=fonttables[newequiv(720959),maink+2].int;
fonttables[newequiv(720959),14].int:=mainp;end;end{:1079};
tempptr:=newglue(mainp);end else tempptr:=newparamglue(12);
mem[curlist.tailfield].hh.rh:=tempptr;curlist.tailfield:=tempptr;
goto 60{:1078};10:end;{:1066}{1321:}procedure giveerrhelp;
begin tokenshow(newequiv(524334));end;{:1321}{1340:}{531:}
function openfmtfile:boolean;label 40,10;var j:0..bufsize;
begin j:=curinput.locfield;
if buffer[curinput.locfield]=38 then begin incr(curinput.locfield);
j:=curinput.locfield;buffer[last]:=32;while buffer[j]<>32 do incr(j);
packbufferedname(0,curinput.locfield,j-1);
if wopenin(fmtfile)then goto 40;;
write(stdout,'Sorry, I can''t find the format `');
fputs(nameoffile+1,stdout);write(stdout,'''; will try `');
fputs(TEXformatdefault+1,stdout);writeln(stdout,'''.');fflush(stdout);
end;packbufferedname(formatdefaultlength-4,1,0);
if not wopenin(fmtfile)then begin;
write(stdout,'I can''t find the format file `');
fputs(TEXformatdefault+1,stdout);writeln(stdout,'''!');
openfmtfile:=false;goto 10;end;40:curinput.locfield:=j;
openfmtfile:=true;10:end;{:531}function loadfmtfile:boolean;
label 6666,10;var j,k:integer;p,q:halfword;x:integer;formatengine:^char;
begin{1345:}ifdef('INITEX')if iniversion then begin libcfree(strpool);
libcfree(strstartar);libcfree(yzmem);end;endif('INITEX')undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'format magic number');writeln(stderr,' = ',x);end;;
if x<>1462916184 then goto 6666;undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'engine name size');writeln(stderr,' = ',x);end;;
if(x<0)or(x>256)then goto 6666;formatengine:=xmallocarray(char,x);
undumpthings(formatengine[0],x);formatengine[x-1]:=0;
if strcmp(enginename,formatengine)then begin;
writeln(stdout,'---! ',stringcast(nameoffile+1),' was written by ',
formatengine);libcfree(formatengine);goto 6666;end;
libcfree(formatengine);undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'string pool checksum');writeln(stderr,' = ',x);end;;
if x<>143720498 then begin;
writeln(stdout,'---! ',stringcast(nameoffile+1),
' made by different executable version, strings are different');
goto 6666;end;undumpint(x);if x<>1073741823 then goto 6666;{1460:}
begin undumpint(x);if(x<0)or(x>1)then goto 6666 else eTeXmode:=x;end;
if(eTeXmode=1)then begin{1570:}maxregnum:=65535;maxreghelpline:=66007;
{:1570}end else begin{1569:}maxregnum:=255;maxreghelpline:=66792;{:1569}
end;{:1460}undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:','mem_bot');
writeln(stderr,' = ',x);end;;if x<>membot then goto 6666;
undumpint(memtop);
if debugformatfile then begin write(stderr,'fmtdebug:','mem_top');
writeln(stderr,' = ',memtop);end;;if membot+1100>memtop then goto 6666;
curlist.headfield:=memtop-1;curlist.tailfield:=memtop-1;
pagetail:=memtop-2;memmin:=membot-extramembot;
memmax:=memtop+extramemtop;
yzmem:=xmallocarray(memoryword,memmax-memmin+1);zmem:=yzmem-memmin;
mem:=zmem;undumpint(x);if x<>1246116 then goto 6666;undumpint(x);
if x<>55711 then goto 6666;undumpint(x);if x<>607 then goto 6666{:1345};
{1347:}begin undumpint(x);if x<0 then goto 6666;
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
strstartar:=xmallocarray(poolpointer,maxstrings-65535);
undumpthings(strstartar[-0],strptr-65535);
strpool:=xmallocarray(packedASCIIcode,poolsize);
undumpthings(strpool[0],poolptr);initstrptr:=strptr;
initpoolptr:=poolptr{:1347};{1349:}begin undumpint(x);
if(x<membot+1023)or(x>memtop-14)then goto 6666 else lomemmax:=x;end;
begin undumpint(x);
if(x<membot+24)or(x>lomemmax)then goto 6666 else rover:=x;end;p:=membot;
q:=rover;repeat undumpthings(mem[p],q+2-p);p:=q+mem[q].hh.lh;
if(p>lomemmax)or((q>=mem[q+1].hh.rh)and(mem[q+1].hh.rh<>rover))then goto
6666;q:=mem[q+1].hh.rh;until q=rover;undumpthings(mem[p],lomemmax+1-p);
if memmin<membot-2 then begin p:=mem[rover+1].hh.lh;q:=memmin+1;
mem[memmin].hh.rh:=0;mem[memmin].hh.lh:=0;mem[p+1].hh.rh:=q;
mem[rover+1].hh.lh:=q;mem[q+1].hh.rh:=rover;mem[q+1].hh.lh:=p;
mem[q].hh.rh:=1073741823;mem[q].hh.lh:=membot-q;end;begin undumpint(x);
if(x<lomemmax+1)or(x>memtop-13)then goto 6666 else himemmin:=x;end;
begin undumpint(x);if(x<0)or(x>memtop)then goto 6666 else avail:=x;end;
memend:=memtop;undumpthings(mem[himemmin],memend+1-himemmin);
undumpint(varused);undumpint(dynused){:1349};{1351:}undumpeqtbtable;
begin undumpint(x);
if(x<131074)or(x>196610)then goto 6666 else parloc:=x;end;
partoken:=1048575+parloc;begin undumpint(x);
if(x<131074)or(x>196610)then goto 6666 else writeloc:=x;end;
begin undumpint(x);
if(x<131074)or(x>196610)then goto 6666 else specialloc:=x;end;
specialtoken:=1048575+specialloc;{1353:}begin undumpint(x);
if(x<131074)or(x>196610)then goto 6666 else hashused:=x;end;{:1353}
{:1351};{1355:}begin undumpint(x);if x<0 then goto 6666;
if x>fontmax then begin;
writeln(stdout,'---! Must increase the ','font max');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'font max');writeln(stderr,' = ',x);end;;fontptr:=x;end;
for k:=0 to fontptr do{1357:}begin undumpfonttable(k);end{:1357}{:1355};
{1359:}begin undumpint(x);if x<0 then goto 6666;
if x>activememsize then begin;
writeln(stdout,'---! Must increase the ','active start point');
goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'active start point');writeln(stderr,' = ',x);end;;activeminptr:=x;end;
begin undumpint(x);if x<0 then goto 6666;if x>activememsize then begin;
writeln(stdout,'---! Must increase the ','active mem size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'active mem size');writeln(stderr,' = ',x);end;;activemaxptr:=x;end;
undumpthings(activeinfo[0],activemaxptr);{:1359};{1361:}
begin undumpint(x);if x<0 then goto 6666;if x>65535 then begin;
writeln(stdout,'---! Must increase the ','ocp max');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'ocp max');writeln(stderr,' = ',x);end;;ocpptr:=x;end;
for k:=0 to ocpptr do{1363:}begin undumpocptable(k);end{:1363}{:1361};
{1365:}begin undumpint(x);if x<1 then goto 6666;if x>1000000 then begin;
writeln(stdout,'---! Must increase the ','ocp list mem size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'ocp list mem size');writeln(stderr,' = ',x);end;;ocplistmemptr:=x;end;
undumpthings(ocplistinfo[0],ocplistmemptr);begin undumpint(x);
if x<0 then goto 6666;if x>1000000 then begin;
writeln(stdout,'---! Must increase the ','ocp list max');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'ocp list max');writeln(stderr,' = ',x);end;;ocplistptr:=x;end;
undumpthings(ocplistlist[0],ocplistptr+1);begin undumpint(x);
if x<0 then goto 6666;if x>1000000 then begin;
writeln(stdout,'---! Must increase the ','ocp lstack mem size');
goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'ocp lstack mem size');writeln(stderr,' = ',x);end;;ocplstackmemptr:=x;
end;undumpthings(ocplstackinfo[0],ocplstackmemptr){:1365};{1367:}
begin undumpint(x);if x<0 then goto 6666;if x>hyphsize then begin;
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
if(x<0)or(x>1073741823)then goto 6666 else hyphlist[j]:=x;end;end;
incr(j);if j<607 then j:=607;hyphnext:=j;
if hyphnext>=hyphsize then hyphnext:=607 else if hyphnext>=607 then incr
(hyphnext);begin undumpint(x);if x<0 then goto 6666;
if x>triesize then begin;
writeln(stdout,'---! Must increase the ','trie size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'trie size');writeln(stderr,' = ',x);end;;j:=x;end;
ifdef('INITEX')triemax:=j;endif('INITEX')begin undumpint(x);
if(x<0)or(x>j)then goto 6666 else hyphstart:=x;end;
if not trie then trie:=xmallocarray(twohalves,j+1);
undumpthings(trie[0],j+1);;undumpint(maxhyphchar);begin undumpint(x);
if x<0 then goto 6666;if x>trieopsize then begin;
writeln(stdout,'---! Must increase the ','trie op size');goto 6666;
end else if debugformatfile then begin write(stderr,'fmtdebug:',
'trie op size');writeln(stderr,' = ',x);end;;j:=x;end;
ifdef('INITEX')trieopptr:=j;
endif('INITEX')undumpthings(hyfdistance[1],j);undumpthings(hyfnum[1],j);
undumpuppercheckthings(65535,hyfnext[1],j);
ifdef('INITEX')for k:=0 to 255 do trieused[k]:=0;endif('INITEX')k:=256;
while j>0 do begin begin undumpint(x);
if(x<0)or(x>k-1)then goto 6666 else k:=x;end;begin undumpint(x);
if(x<1)or(x>j)then goto 6666 else x:=x;end;
ifdef('INITEX')trieused[k]:=x;endif('INITEX')j:=j-x;opstart[k]:=j;end;
ifdef('INITEX')trienotready:=false endif('INITEX'){:1367};{1369:}
begin undumpint(x);if(x<0)or(x>3)then goto 6666 else interaction:=x;end;
if interactionoption<>4 then interaction:=interactionoption;
begin undumpint(x);
if(x<0)or(x>strptr)then goto 6666 else formatident:=x;end;undumpint(x);
if x<>69069 then goto 6666{:1369};loadfmtfile:=true;goto 10;6666:;
writeln(stdout,'(Fatal format file error; I''m stymied)');
loadfmtfile:=false;10:end;{:1340}{1372:}{1375:}
procedure closefilesandterminate;var k:integer;begin{1420:}
for k:=0 to 15 do if writeopen[k]then aclose(writefile[k]){:1420};
setneweqtbint(1049457,-1);
ifdef('STAT')if neweqtbint(1049439)>0 then{1376:}
if logopened then begin writeln(logfile,' ');
writeln(logfile,'Here is how much of Omega''s memory',' you used:');
write(logfile,' ',strptr-initstrptr:1,' string');
if strptr<>initstrptr+1 then write(logfile,'s');
writeln(logfile,' out of ',maxstrings-initstrptr:1);
writeln(logfile,' ',poolptr-initpoolptr:1,' string characters out of ',
poolsize-initpoolptr:1);
writeln(logfile,' ',lomemmax-memmin+memend-himemmin+2:1,
' words of memory out of ',memend+1-memmin:1);
writeln(logfile,' ',cscount:1,' multiletter control sequences out of ',
65536:1);write(logfile,fontptr-0:1,' font');
if fontptr<>1 then write(logfile,'s');
write(logfile,' ',hyphcount:1,' hyphenation exception');
if hyphcount<>1 then write(logfile,'s');
writeln(logfile,' out of ',hyphsize:1);
writeln(logfile,' ',maxinstack:1,'i,',maxneststack:1,'n,',maxparamstack:
1,'p,',maxbufstack+1:1,'b,',maxsavestack+6:1,'s stack positions out of '
,stacksize:1,'i,',nestsize:1,'n,',paramsize:1,'p,',bufsize:1,'b,',
savesize:1,'s');end{:1376};endif('STAT');{676:}
while curs>-1 do begin if curs>0 then begin dvibuf[dviptr]:=142;
incr(dviptr);if dviptr=dvilimit then dviswap;
end else begin begin dvibuf[dviptr]:=140;incr(dviptr);
if dviptr=dvilimit then dviswap;end;incr(totalpages);end;decr(curs);end;
if totalpages=0 then printnl(66195)else if curs<>-2 then begin begin
dvibuf[dviptr]:=248;incr(dviptr);if dviptr=dvilimit then dviswap;end;
dvifour(lastbop);lastbop:=dvioffset+dviptr-5;dvifour(25400000);
dvifour(473628672);preparemag;dvifour(neweqtbint(1049425));
dvifour(maxv);dvifour(maxh);begin dvibuf[dviptr]:=maxpush div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=maxpush mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(totalpages div 256)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=totalpages mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;{677:}
while fontptr>0 do begin if fonttables[fontptr,15].int then dvifontdef(
fontptr);decr(fontptr);end{:677};begin dvibuf[dviptr]:=249;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(lastbop);
begin dvibuf[dviptr]:=2;incr(dviptr);if dviptr=dvilimit then dviswap;
end;ifdef('IPC')k:=7-((3+dvioffset+dviptr)mod 4);
endif('IPC')ifndef('IPC')k:=4+((dvibufsize-dviptr)mod 4);
endifn('IPC')while k>0 do begin begin dvibuf[dviptr]:=223;incr(dviptr);
if dviptr=dvilimit then dviswap;end;decr(k);end;{633:}
if dvilimit=halfbuf then writedvi(halfbuf,dvibufsize-1);
if dviptr>(2147483647-dvioffset)then begin curs:=-2;fatalerror(66184);
end;if dviptr>0 then writedvi(0,dviptr-1){:633};printnl(66196);
printfilename(0,outputfilename,0);print(65570);printint(totalpages);
print(66197);if totalpages<>1 then printchar(115);print(66178);
printint(dvioffset+dviptr);print(66198);bclose(dvifile);end{:676};
if logopened then begin writeln(logfile);aclose(logfile);
selector:=selector-2;if selector=17 then begin printnl(66654);
printfilename(0,texmflogname,0);printchar(46);end;end;println;
if(editnamestart<>0)and(interaction>0)then calledit(strpool,
editnamestart,editnamelength,editline);end;{:1375}{1377:}
procedure finalcleanup;label 10;var c:smallnumber;begin c:=curchr;
if c<>1 then setneweqtbint(1049457,-1);if jobname=0 then openlogfile;
while inputptr>0 do if curinput.statefield=0 then endtokenlist else
endfilereading;while openparens>0 do begin print(66655);
decr(openparens);end;if curlevel>1 then begin printnl(40);
printesc(66656);print(66657);printint(curlevel-1);printchar(41);
if(eTeXmode=1)then showsavegroups;end;
while condptr<>0 do begin printnl(40);printesc(66656);print(66658);
printcmdchr(122,curif);if ifline<>0 then begin print(66659);
printint(ifline);end;print(66660);ifline:=mem[condptr+1].int;
curif:=mem[condptr].hh.b1;tempptr:=condptr;condptr:=mem[condptr].hh.rh;
freenode(tempptr,2);end;
if history<>0 then if((history=1)or(interaction<3))then if selector=19
then begin selector:=17;printnl(66661);selector:=19;end;
if c=1 then begin ifdef('INITEX')if iniversion then begin for c:=0 to 4
do if curmark[c]<>0 then deletetokenref(curmark[c]);
if samark<>0 then if domarks(3,0,samark)then samark:=0;
for c:=2 to 3 do flushnodelist(discptr[c]);storefmtfile;goto 10;end;
endif('INITEX')printnl(66662);goto 10;end;10:end;{:1377}{1378:}
ifdef('INITEX')procedure initprim;begin nonewcontrolsequence:=false;
first:=0;{228:}primitive(65662,78,393230);primitive(65663,78,393231);
primitive(65664,78,393232);primitive(65665,78,393233);
primitive(65666,78,393234);primitive(65667,78,393235);
primitive(65668,78,393236);primitive(65669,78,393237);
primitive(65670,78,393238);primitive(65671,78,393239);
primitive(65672,78,393240);primitive(65673,78,393241);
primitive(65674,78,393242);primitive(65675,78,393243);
primitive(65676,78,393244);primitive(65677,79,393245);
primitive(65678,79,393246);primitive(65679,79,393247);{:228}{232:}
primitive(65684,75,524325);primitive(65685,75,524326);
primitive(65686,75,524327);primitive(65687,75,524328);
primitive(65688,75,524329);primitive(65689,75,524330);
primitive(65690,75,524331);primitive(65691,75,524332);
primitive(65692,75,524334);{:232}{240:}primitive(65706,76,1049408);
primitive(65707,76,1049409);primitive(65708,76,1049410);
primitive(65709,76,1049411);primitive(65710,76,1049412);
primitive(65711,76,1049413);primitive(65712,76,1049414);
primitive(65713,76,1049415);primitive(65714,76,1049416);
primitive(65715,76,1049417);primitive(65716,76,1049418);
primitive(65717,76,1049419);primitive(65718,76,1049420);
primitive(65719,76,1049421);primitive(65720,76,1049422);
primitive(65721,76,1049423);primitive(65722,76,1049424);
primitive(65723,76,1049425);primitive(65724,76,1049426);
primitive(65725,76,1049427);primitive(65726,76,1049428);
primitive(65727,76,1049429);primitive(65728,76,1049430);
primitive(65729,76,1049431);primitive(65730,76,1049432);
primitive(65731,76,1049433);primitive(65732,76,1049434);
primitive(65733,76,1049435);primitive(65734,76,1049436);
primitive(65735,76,1049437);primitive(65736,76,1049438);
primitive(65737,76,1049439);primitive(65738,76,1049440);
primitive(65739,76,1049441);primitive(65740,76,1049442);
primitive(65741,76,1049443);primitive(65742,76,1049444);
primitive(65743,76,1049445);primitive(65744,76,1049446);
primitive(65745,76,1049447);primitive(65746,76,1049448);
primitive(65747,76,1049449);primitive(65748,76,1049450);
primitive(65749,76,1049451);primitive(65750,76,1049452);
primitive(65751,76,1049453);primitive(65752,76,1049454);
primitive(65753,76,1049455);primitive(65754,76,1049456);
primitive(65755,76,1049457);primitive(65756,76,1049458);
primitive(65757,76,1049459);primitive(65758,76,1049460);
primitive(65759,76,1049461);primitive(65760,76,1049462);{:240}{252:}
primitive(65764,77,1180556);primitive(65765,77,1180557);
primitive(65766,77,1180558);primitive(65767,77,1180559);
primitive(65768,77,1180560);primitive(65769,77,1180561);
primitive(65770,77,1180562);primitive(65771,77,1180563);
primitive(65772,77,1180564);primitive(65773,77,1180565);
primitive(65774,77,1180566);primitive(65775,77,1180567);
primitive(65776,77,1180568);primitive(65777,77,1180569);
primitive(65778,77,1180570);primitive(65779,77,1180571);
primitive(65780,77,1180572);primitive(65781,77,1180573);
primitive(65782,77,1180574);primitive(65783,77,1180575);
primitive(65784,77,1180576);{:252}{270:}primitive(32,64,0);
primitive(47,44,0);primitive(65798,45,0);primitive(65799,96,0);
primitive(65800,40,0);primitive(65801,41,0);primitive(65802,61,0);
primitive(65803,16,0);primitive(65794,124,0);primitive(65804,15,0);
primitive(65805,15,1);primitive(65806,98,0);primitive(65795,67,0);
primitive(65807,62,0);sethashtext(1442728,65807);
setneweqtb(196612,neweqtb(curval));primitive(65808,119,0);
primitive(65809,91,0);primitive(65810,80,0);primitive(65811,80,1);
primitive(65812,80,2);primitive(65813,80,3);primitive(65814,80,4);
primitive(65815,32,0);primitive(65816,36,0);primitive(65817,39,0);
primitive(65616,37,0);primitive(65818,68,0);primitive(65637,18,0);
primitive(65819,46,0);primitive(65820,17,0);primitive(65821,46,1);
primitive(65822,17,1);primitive(65823,54,0);primitive(65824,97,0);
primitive(65825,34,0);primitive(65826,65,0);primitive(65827,120,0);
primitive(65621,55,0);primitive(65828,63,0);primitive(65829,87,524320);
primitive(65830,42,0);primitive(65831,83,0);primitive(65832,66,0);
primitive(65833,66,1);primitive(65834,102,0);primitive(65835,0,65536);
sethashtext(1442733,65835);setneweqtb(196617,neweqtb(curval));
primitive(65836,68,1);primitive(65837,104,0);primitive(65838,126,0);
primitive(65693,74,membot);primitive(65638,38,0);primitive(65839,33,0);
primitive(65840,56,0);primitive(65841,35,0);{:270}{339:}
primitive(65906,13,65536);parloc:=curval;partoken:=1048575+parloc;{:339}
{381:}primitive(65939,121,0);primitive(65940,121,1);{:381}{389:}
primitive(65941,127,0);primitive(65942,127,1);primitive(65943,127,2);
primitive(65944,127,3);primitive(65945,127,4);{:389}{417:}
primitive(65762,92,membot+0);primitive(65790,92,membot+1);
primitive(65681,92,membot+2);primitive(65682,92,membot+3);{:417}{422:}
primitive(65984,82,119);primitive(65985,82,1);primitive(65986,85,0);
primitive(65987,85,1);primitive(65988,86,1);primitive(65989,86,3);
primitive(65990,86,2);primitive(65991,73,0);primitive(65992,73,1);
primitive(65993,73,2);primitive(65994,73,4);primitive(65995,73,5);{:422}
{475:}primitive(66061,125,0);primitive(66062,125,1);
primitive(66063,125,2);primitive(66064,125,3);primitive(66065,125,4);
primitive(66066,125,5);primitive(66067,125,6);primitive(66068,125,7);
primitive(66069,125,8);{:475}{494:}primitive(66086,122,0);
primitive(66087,122,1);primitive(66088,122,2);primitive(66089,122,3);
primitive(66090,122,4);primitive(66091,122,5);primitive(66092,122,6);
primitive(66093,122,7);primitive(66094,122,8);primitive(66095,122,9);
primitive(66096,122,10);primitive(66097,122,11);primitive(66098,122,12);
primitive(66099,122,13);primitive(66100,122,14);primitive(66101,122,15);
primitive(66102,122,16);{:494}{498:}primitive(65597,123,2);
sethashtext(1442730,65597);setneweqtb(196614,neweqtb(curval));
primitive(66104,123,4);primitive(66105,123,3);{:498}{561:}
primitive(66133,90,0);sethashtext(1442736,66133);
setneweqtb(196620,neweqtb(curval));{:561}{600:}primitive(66160,107,0);
sethashtext(1508273,66160);setneweqtb(262157,neweqtb(curval));
geqdefine(524336,137,0);geqdefine(524337,137,0);geqdefine(524338,137,0);
{:600}{615:}primitive(66174,109,0);sethashtext(1573809,66174);
setneweqtb(327693,neweqtb(curval));{:615}{814:}primitive(66257,4,65537);
primitive(66258,5,65538);sethashtext(1442727,66258);
setneweqtb(196611,neweqtb(curval));primitive(66259,5,65539);
sethashtext(1442731,66260);sethashtext(1442732,66260);
seteqtype(196616,9);setequiv(196616,memtop-11);seteqlevel(196616,1);
setneweqtb(196615,neweqtb(196616));seteqtype(196615,132);{:814}{1019:}
primitive(66329,84,0);primitive(66330,84,1);primitive(66331,84,2);
primitive(66332,84,3);primitive(66333,84,4);primitive(66334,84,5);
primitive(66335,84,6);primitive(66336,84,7);{:1019}{1089:}
primitive(66385,14,0);primitive(66386,14,1);{:1089}{1095:}
primitive(66387,26,4);primitive(66388,26,0);primitive(66389,26,1);
primitive(66390,26,2);primitive(66391,26,3);primitive(66392,27,4);
primitive(66393,27,0);primitive(66394,27,1);primitive(66395,27,2);
primitive(66396,27,3);primitive(65622,28,5);primitive(65626,29,1);
primitive(65628,30,99);{:1095}{1108:}primitive(66414,21,1);
primitive(66415,21,0);primitive(66416,22,1);primitive(66417,22,0);
primitive(65695,20,0);primitive(66418,20,1);primitive(66419,20,2);
primitive(66324,20,3);primitive(66420,20,4);primitive(66326,20,5);
primitive(66421,20,123);primitive(66422,31,99);primitive(66423,31,100);
primitive(66424,31,101);primitive(66425,31,102);primitive(66426,94,0);
{:1108}{1125:}primitive(66441,43,1);primitive(66442,43,0);{:1125}{1144:}
primitive(66451,25,12);primitive(66452,25,11);primitive(66453,25,10);
primitive(66454,23,0);primitive(66455,23,1);primitive(66456,24,0);
primitive(66457,24,1);{:1144}{1151:}primitive(45,47,1);
primitive(65635,47,0);primitive(66462,69,0);primitive(66463,69,1);
{:1151}{1178:}primitive(66490,48,0);primitive(66491,48,1);{:1178}{1193:}
primitive(66224,50,16);primitive(66225,50,17);primitive(66226,50,18);
primitive(66227,50,19);primitive(66228,50,20);primitive(66229,50,21);
primitive(66230,50,22);primitive(66231,50,23);primitive(66233,50,26);
primitive(66232,50,27);primitive(66492,51,0);primitive(66237,51,1);
primitive(66238,51,2);{:1193}{1206:}primitive(66219,53,0);
primitive(66220,53,2);primitive(66221,53,4);primitive(66222,53,6);
{:1206}{1215:}primitive(66510,52,0);primitive(66511,52,1);
primitive(66512,52,2);primitive(66513,52,3);primitive(66514,52,4);
primitive(66515,52,5);{:1215}{1225:}primitive(66234,49,30);
primitive(66235,49,31);sethashtext(1442729,66235);
setneweqtb(196613,neweqtb(curval));{:1225}{1245:}primitive(66535,99,1);
primitive(66536,99,2);primitive(66537,99,4);primitive(66538,103,0);
primitive(66539,103,1);primitive(66540,103,2);primitive(66541,103,3);
{:1245}{1256:}primitive(66558,100,0);primitive(66559,100,1);{:1256}
{1259:}primitive(66560,101,0);primitive(66561,101,1);
primitive(66562,101,2);primitive(66563,101,3);primitive(66564,101,4);
primitive(66565,101,5);primitive(66566,101,6);primitive(66567,101,7);
{:1259}{1267:}primitive(65701,88,721728);primitive(65705,88,983872);
primitive(66570,88,984128);primitive(65702,88,787264);
primitive(65703,88,852800);primitive(65704,88,918336);
primitive(65763,88,1115020);primitive(66571,88,1115276);
primitive(65698,89,720960);primitive(65699,89,721216);
primitive(65700,89,721472);{:1267}{1287:}primitive(66300,105,0);
primitive(66312,105,1);{:1287}{1291:}primitive(66591,81,0);
primitive(66592,81,1);{:1291}{1299:}primitive(65558,106,0);
primitive(65559,106,1);primitive(65560,106,2);primitive(66605,106,3);
{:1299}{1309:}primitive(66606,60,1);primitive(66607,60,0);{:1309}{1314:}
primitive(66608,58,0);primitive(66609,58,1);{:1314}{1323:}
primitive(66615,57,787264);primitive(66616,57,852800);{:1323}{1328:}
primitive(66617,19,0);primitive(66618,19,1);primitive(66619,19,2);
primitive(66620,19,3);{:1328}{1386:}primitive(66664,59,0);
primitive(65903,59,1);writeloc:=curval;primitive(66665,59,2);
primitive(66666,59,3);specialloc:=curval;
specialtoken:=1048575+specialloc;primitive(66667,59,5);
primitive(66668,59,6);primitive(66669,76,55);primitive(66670,76,56);
primitive(66671,95,1049479);primitive(66672,95,1049480);
primitive(66673,95,1049481);primitive(66674,95,1049482);
primitive(66675,95,1049483);primitive(65786,77,1180578);
primitive(65785,77,1180577);primitive(65787,77,1180579);
primitive(65788,77,1180580);{:1386}{1639:}primitive(66801,116,0);
primitive(66802,116,1);primitive(66803,116,2);primitive(66804,116,3);
primitive(66805,116,4);primitive(66806,116,5);primitive(66807,116,6);
primitive(66808,116,7);primitive(66809,117,0);primitive(66810,117,1);
primitive(66811,117,2);primitive(66812,117,3);primitive(66813,117,4);
primitive(66814,117,5);primitive(66815,117,6);primitive(66816,117,7);
geqdefine(589876,137,0);geqdefine(589877,137,0);geqdefine(589878,137,0);
geqdefine(589879,137,0);geqdefine(589875,137,0);geqdefine(589881,137,0);
geqdefine(589882,137,0);geqdefine(589883,137,0);geqdefine(589884,137,0);
geqdefine(589880,137,0);{:1639}{1660:}primitive(66829,108,0);
primitive(66830,108,1);primitive(66831,110,0);primitive(66832,112,0);
primitive(66833,113,0);primitive(66834,111,0);primitive(66835,114,1);
primitive(66836,114,2);primitive(66837,114,3);primitive(66838,114,4);
primitive(66839,115,0);setequiv(524335,0);{:1660};
nonewcontrolsequence:=true;end;endif('INITEX'){:1378}{1380:}
ifdef('TEXMF_DEBUG')procedure debughelp;label 888,10;
var k,l,m,n:integer;begin;while true do begin;printnl(66663);
fflush(stdout);read(stdin,m);
if m<0 then goto 10 else if m=0 then dumpcore else begin read(stdin,n);
case m of{1381:}1:printword(mem[n]);2:printint(mem[n].hh.lh);
3:printint(mem[n].hh.rh);4:printword(neweqtb(n));5:;
6:printword(savestack[n]);7:showbox(n);8:begin breadthmax:=10000;
depththreshold:=poolsize-poolptr-10;shownodelist(n);end;
9:showtokenlist(n,0,1000);10:slowprint(n);11:checkmem(n>0);
12:searchmem(n);13:begin read(stdin,l);printcmdchr(n,l);end;
14:for k:=0 to n do print(buffer[k]);15:begin fontinshortdisplay:=0;
shortdisplay(n);end;16:panicking:=not panicking;{:1381}
others:print(63)end;end;end;10:end;endif('TEXMF_DEBUG'){:1380}{:1372}
{1374:}procedure mainbody;begin bounddefault:=1000000;
boundname:='main_memory';
setupboundvariable(addressof(mainmemory),boundname,bounddefault);;
bounddefault:=0;boundname:='extra_mem_top';
setupboundvariable(addressof(extramemtop),boundname,bounddefault);;
bounddefault:=0;boundname:='extra_mem_bot';
setupboundvariable(addressof(extramembot),boundname,bounddefault);;
bounddefault:=300000;boundname:='pool_size';
setupboundvariable(addressof(poolsize),boundname,bounddefault);;
bounddefault:=200000;boundname:='string_vacancies';
setupboundvariable(addressof(stringvacancies),boundname,bounddefault);;
bounddefault:=5000;boundname:='pool_free';
setupboundvariable(addressof(poolfree),boundname,bounddefault);;
bounddefault:=100000;boundname:='max_strings';
setupboundvariable(addressof(maxstrings),boundname,bounddefault);;
bounddefault:=100;boundname:='strings_free';
setupboundvariable(addressof(stringsfree),boundname,bounddefault);;
bounddefault:=20000;boundname:='trie_size';
setupboundvariable(addressof(triesize),boundname,bounddefault);;
bounddefault:=659;boundname:='hyph_size';
setupboundvariable(addressof(hyphsize),boundname,bounddefault);;
bounddefault:=20000;boundname:='buf_size';
setupboundvariable(addressof(bufsize),boundname,bounddefault);;
bounddefault:=50;boundname:='nest_size';
setupboundvariable(addressof(nestsize),boundname,bounddefault);;
bounddefault:=15;boundname:='max_in_open';
setupboundvariable(addressof(maxinopen),boundname,bounddefault);;
bounddefault:=60;boundname:='param_size';
setupboundvariable(addressof(paramsize),boundname,bounddefault);;
bounddefault:=4000;boundname:='save_size';
setupboundvariable(addressof(savesize),boundname,bounddefault);;
bounddefault:=300;boundname:='stack_size';
setupboundvariable(addressof(stacksize),boundname,bounddefault);;
bounddefault:=16384;boundname:='dvi_buf_size';
setupboundvariable(addressof(dvibufsize),boundname,bounddefault);;
bounddefault:=79;boundname:='error_line';
setupboundvariable(addressof(errorline),boundname,bounddefault);;
bounddefault:=50;boundname:='half_error_line';
setupboundvariable(addressof(halferrorline),boundname,bounddefault);;
bounddefault:=79;boundname:='max_print_line';
setupboundvariable(addressof(maxprintline),boundname,bounddefault);;
bounddefault:=1000;boundname:='ocp_list_size';
setupboundvariable(addressof(ocplistsize),boundname,bounddefault);;
bounddefault:=1000;boundname:='ocp_buf_size';
setupboundvariable(addressof(ocpbufsize),boundname,bounddefault);;
bounddefault:=1000;boundname:='ocp_stack_size';
setupboundvariable(addressof(ocpstacksize),boundname,bounddefault);;
bounddefault:=10000;boundname:='expand_depth';
setupboundvariable(addressof(expanddepth),boundname,bounddefault);;
begin if mainmemory<infmainmemory then mainmemory:=infmainmemory else if
mainmemory>supmainmemory then mainmemory:=supmainmemory end;
ifdef('INITEX')if iniversion then begin extramemtop:=0;end;
endif('INITEX')extramembot:=0;
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
if errorline>255 then errorline:=255;
buffer:=xmallocarray(ASCIIcode,bufsize);
nest:=xmallocarray(liststaterecord,nestsize);
savestack:=xmallocarray(memoryword,savesize);
inputstack:=xmallocarray(instaterecord,stacksize);
inputfile:=xmallocarray(alphafile,maxinopen);
inputfilemode:=xmallocarray(halfword,maxinopen);
inputfiletranslation:=xmallocarray(halfword,maxinopen);
linestack:=xmallocarray(integer,maxinopen);
eofseen:=xmallocarray(boolean,maxinopen);
grpstack:=xmallocarray(savepointer,maxinopen);
ifstack:=xmallocarray(halfword,maxinopen);
sourcefilenamestack:=xmallocarray(strnumber,maxinopen);
fullsourcefilenamestack:=xmallocarray(strnumber,maxinopen);
paramstack:=xmallocarray(halfword,paramsize);
dvibuf:=xmallocarray(realeightbits,dvibufsize);
hyphword:=xmallocarray(strnumber,hyphsize);
hyphlist:=xmallocarray(halfword,hyphsize);
hyphlink:=xmallocarray(hyphpointer,hyphsize);
ocplistinfo:=xmallocarray(memoryword,ocplistsize);
ocplstackinfo:=xmallocarray(memoryword,ocplistsize);
ocplistlist:=xmallocarray(ocplistindex,ocplistsize);
otpinitinputbuf:=xmallocarray(quarterword,ocpbufsize);
otpinputbuf:=xmallocarray(quarterword,ocpbufsize);
otpoutputbuf:=xmallocarray(quarterword,ocpbufsize);
otpstackbuf:=xmallocarray(quarterword,ocpstacksize);
otpcalcs:=xmallocarray(halfword,ocpstacksize);
otpstates:=xmallocarray(halfword,ocpstacksize);
ifdef('INITEX')if iniversion then begin yzmem:=xmallocarray(memoryword,
memtop-membot+1);zmem:=yzmem-membot;
strstartar:=xmallocarray(poolpointer,maxstrings-65535);
strpool:=xmallocarray(packedASCIIcode,poolsize);end;
endif('INITEX')history:=3;;if readyalready=314159 then goto 1;{14:}
bad:=0;if(halferrorline<30)or(halferrorline>errorline-15)then bad:=1;
if maxprintline<60 then bad:=2;if dvibufsize mod 8<>0 then bad:=3;
if membot+1100>memtop then bad:=4;if 55711>65536 then bad:=5;
if maxinopen>=128 then bad:=6;if memtop<267 then bad:=7;{:14}{111:}
ifdef('INITEX')if(memmin<>membot)or(memmax<>memtop)then bad:=10;
endif('INITEX')if(memmin>membot)or(memmax<memtop)then bad:=10;
if(0>0)or(65535<32767)then bad:=11;
if(0<>0)or(1073741823<1073741823)then bad:=12;
if(0<0)or(65535>1073741823)then bad:=13;
if(memmin<0)or(memtop+supmainmemory>=1073741823)then bad:=14;
if(0<0)or(fontmax>65535)then bad:=15;if fontmax>65536 then bad:=16;
if(savesize>1073741823)or(maxstrings>1073741823)then bad:=17;
if bufsize>1073741823 then bad:=18;if 65535<65535 then bad:=19;{:111}
{295:}if 1441804>1073741823 then bad:=21;{:295}{529:}
if formatdefaultlength>maxint then bad:=31;{:529}{1286:}
if 2*1073741823<memtop-memmin then bad:=41;{:1286}
if bad>0 then begin writeln(stdout,
'Ouch---my internal constants have been clobbered!','---case ',bad:1);
goto 9999;end;initialize;
ifdef('INITEX')if iniversion then begin if not getstringsstarted then
goto 9999;initprim;initstrptr:=strptr;initpoolptr:=poolptr;
odateandtime(1049428,1049429,1049430,1049431);end;
endif('INITEX')readyalready:=314159;1:{55:}selector:=17;tally:=0;
termoffset:=0;fileoffset:=0;{:55}{61:}
if srcspecialsp or filelineerrorstylep or parsefirstlinep then write(
stdout,'This is Aleph, Version 3.141592653-','1.15','-','2.1','-','0.1')
else write(stdout,'This is Aleph, Version 3.141592653-','1.15','-','2.1'
,'-','0.1');write(stdout,versionstring);
if formatident=0 then writeln(stdout,' (preloaded format=',dumpname,')')
else begin slowprint(formatident);println;end;
if shellenabledp then begin write(stdout,' ');
if restrictedshell then begin write(stdout,'restricted ');end;
writeln(stdout,'\write18 enabled.');end;
if srcspecialsp then begin writeln(stdout,' Source specials enabled.')
end;fflush(stdout);{:61}{536:}jobname:=0;nameinprogress:=false;
logopened:=false;{:536}{541:}outputfilename:=0;{:541};{1379:}begin{336:}
begin inputptr:=0;maxinstack:=0;sourcefilenamestack[0]:=0;
fullsourcefilenamestack[0]:=0;inopen:=0;openparens:=0;maxbufstack:=0;
grpstack[0]:=0;ifstack[0]:=0;paramptr:=0;maxparamstack:=0;
geqdefine(589875,137,1);terminmode:=newequiv(589875);
termoutmode:=newequiv(589875);
if terminmode>0 then termintranslation:=newequiv(589876+terminmode-1);
if termoutmode>0 then termouttranslation:=newequiv(589881+terminmode-1);
first:=bufsize;repeat buffer[first]:=0;decr(first);until first=0;
scannerstatus:=0;warningindex:=0;first:=1;curinput.statefield:=33;
curinput.startfield:=1;curinput.indexfield:=0;line:=0;
curinput.namefield:=0;curinput.ocplstackfield:=0;curinput.ocpnofield:=0;
forceeof:=false;alignstate:=1000000;if not initterminal then goto 9999;
curinput.limitfield:=last;first:=last+1;end{:336};{1450:}
ifdef('INITEX')if(etexp or(buffer[curinput.locfield]=42))and(formatident
=66633)then begin nonewcontrolsequence:=false;{1451:}
primitive(66702,73,3);primitive(66703,73,6);primitive(66704,73,7);
primitive(66705,73,11);primitive(66706,73,8);primitive(66707,73,9);
primitive(66708,73,10);primitive(66709,125,9);primitive(66710,125,10);
primitive(66711,125,11);{:1451}{1462:}primitive(66713,75,524333);
primitive(66714,76,1049469);primitive(66715,76,1049470);
primitive(66716,76,1049471);primitive(66717,76,1049472);
primitive(66718,76,1049473);primitive(66719,76,1049474);
primitive(66720,76,1049475);primitive(66721,76,1049476);
primitive(66722,76,1049477);{:1462}{1468:}primitive(66737,73,12);
primitive(66738,73,13);{:1468}{1471:}primitive(66739,73,14);
primitive(66740,73,15);primitive(66741,73,16);{:1471}{1474:}
primitive(66742,73,19);primitive(66743,73,20);primitive(66744,73,21);
primitive(66745,73,22);{:1474}{1477:}primitive(66746,73,23);
primitive(66747,73,24);primitive(66748,73,25);{:1477}{1480:}
primitive(66749,19,4);{:1480}{1489:}primitive(66751,19,5);{:1489}{1491:}
primitive(66752,126,1);primitive(66753,126,5);{:1491}{1494:}
primitive(66754,19,6);{:1494}{1497:}primitive(66758,85,2);{:1497}{1502:}
primitive(66236,49,1);{:1502}{1504:}primitive(66762,121,2);{:1504}
{1516:}primitive(66764,102,1);{:1516}{1519:}primitive(66103,119,1);
primitive(66765,122,17);primitive(66766,122,18);primitive(66767,122,19);
{:1519}{1527:}primitive(66549,99,8);{:1527}{1535:}
primitive(66773,73,30);primitive(66774,73,31);primitive(66775,73,32);
primitive(66776,73,33);{:1535}{1558:}primitive(66780,73,17);
primitive(66781,73,18);primitive(66782,73,26);primitive(66783,73,27);
{:1558}{1562:}primitive(66784,73,28);primitive(66785,73,29);{:1562}
{1566:}primitive(66786,18,5);primitive(66787,127,5);
primitive(66788,127,6);primitive(66789,127,7);primitive(66790,127,8);
primitive(66791,127,9);{:1566}{1618:}primitive(66795,24,2);
primitive(66796,24,3);{:1618}{1621:}primitive(66797,87,524321);
primitive(66798,87,524322);primitive(66799,87,524323);
primitive(66800,87,524324);{:1621}
if(buffer[curinput.locfield]=42)then incr(curinput.locfield);
eTeXmode:=1;{1570:}maxregnum:=65535;maxreghelpline:=66007;{:1570}end;
endif('INITEX')if not nonewcontrolsequence then nonewcontrolsequence:=
true else{:1450}
if(formatident=0)or(buffer[curinput.locfield]=38)or dumpline then begin
if formatident<>0 then initialize;if not openfmtfile then goto 9999;
if not loadfmtfile then begin wclose(fmtfile);goto 9999;end;
wclose(fmtfile);
while(curinput.locfield<curinput.limitfield)and(buffer[curinput.locfield
]=32)do incr(curinput.locfield);end;
if(eTeXmode=1)then writeln(stdout,'entering extended mode');
if(neweqtbint(1049456)<0)or(neweqtbint(1049456)>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=neweqtbint(1049456);
odateandtime(1049428,1049429,1049430,1049431);
ifdef('INITEX')if trienotready then begin trie:=xmallocarray(twohalves,
triesize);triec:=xmallocarray(ASCIIcode,triesize);
trieo:=xmallocarray(quarterword,triesize);
triel:=xmallocarray(triepointer,triesize);
trier:=xmallocarray(triepointer,triesize);
triehash:=xmallocarray(triepointer,triesize);
trietaken:=xmallocarray(boolean,triesize);
triemin:=xmallocarray(triepointer,65536);triel[0]:=0;triec[0]:=0;
trieptr:=0;trier[0]:=0;hyphstart:=0;end;endif('INITEX'){799:}
magicoffset:=strstartar[715]-9*16{:799};{75:}
if interaction=0 then selector:=16 else selector:=17{:75};
if(curinput.locfield<curinput.limitfield)and(newequiv(721728+buffer[
curinput.locfield])<>0)then startinput;{1445:}
begin textdirptr:=newdir(0);end{:1445};end{:1379};history:=0;
maincontrol;finalcleanup;closefilesandterminate;
9999:begin fflush(stdout);readyalready:=0;
if(history<>0)and(history<>1)then uexit(1)else uexit(0);end;end;{:1374}
{1633:}function getnullstr:strnumber;begin getnullstr:=65624;end;{:1633}
