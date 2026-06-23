{4:}{9:}{$C-,A+,D-}ifdef('TEXMF_DEBUG'){$C+,D+}
endif('TEXMF_DEBUG'){:9}program PDFTEX;const{11:}hashoffset=514;
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
supexpanddepth=10000000;{:11}{675:}infpdfmemsize=10000;
suppdfmemsize=10000000;{:675}{679:}pdfopbufsize=16384;infpdfosbufsize=1;
suppdfosbufsize=5000000;pdfosmaxobjs=100;{:679}{695:}infobjtabsize=1000;
supobjtabsize=8388607;infdestnamessize=1000;supdestnamessize=500000;
infpkdpi=72;suppkdpi=8000;pdfobjtypemax=10;
{:695}{721:}vfmaxrecursion=10;vfstacksize=100;
{:721}{1631:}pdfmaxlinklevel=10;{:1631}type{18:}ASCIIcode=0..255;
{:18}{25:}eightbits=0..255;alphafile=packed file of ASCIIcode;
bytefile=packed file of eightbits;{:25}{38:}poolpointer=integer;
strnumber=0..2097151;packedASCIIcode=0..255;{:38}{101:}scaled=integer;
nonnegativeinteger=0..2147483647;smallnumber=0..63;
{:101}{109:}{:109}{131:}quarterword=0..255;
halfword=-268435455..268435455;twochoices=1..2;fourchoices=1..4;
#include "texmfmem.h";wordfile=gzFile;{:131}{168:}glueord=0..3;
{:168}{230:}liststaterecord=record modefield:-209..209;
headfield,tailfield:halfword;eTeXauxfield:halfword;
pgfield,mlfield:integer;auxfield:memoryword;end;
{:230}{291:}groupcode=0..16;
{:291}{322:}instaterecord=record statefield,indexfield:quarterword;
startfield,locfield,limitfield,namefield:halfword;
synctextagfield:integer;end;{:322}{574:}internalfontnumber=integer;
fontindex=integer;ninebits=0..256;{:574}{621:}dviindex=0..dvibufsize;
{:621}{694:}objentry=record int0,int1:integer;int2:longinteger;
int3,int4:integer;end;
{:694}{707:}charusedarray=array[0..31]of eightbits;
charmaparray=array[0..32]of eightbits;fmentryptr=^integer;
{:707}{722:}vfstackindex=0..vfstacksize;
vfstackrecord=record stackh,stackv,stackw,stackx,stacky,stackz:scaled;
end;{:722}{1097:}triepointer=0..4194303;trieopcode=0..65535;
{:1097}{1102:}hyphpointer=0..65535;
{:1102}{1627:}destnameentry=record objname:strnumber;objnum:integer;end;
{:1627}{1632:}pdflinkstackrecord=record nestinglevel:integer;
linknode:halfword;reflinknode:halfword;end;
{:1632}{1678:}savepointer=0..savesize;{:1678}var{13:}bad:integer;
{:13}{20:}xord:array[ASCIIcode]of ASCIIcode;
xchr:array[ASCIIcode]of ASCIIcode;xprn:array[ASCIIcode]of ASCIIcode;
mubyteread:array[ASCIIcode]of halfword;
mubytewrite:array[ASCIIcode]of strnumber;
mubytecswrite:array[0..127]of halfword;mubyteskip:integer;
mubytekeep:integer;mubyteskeep:integer;mubyteprefix:integer;
mubytetablein:boolean;mubytetableout:boolean;mubyterelax:boolean;
mubytestart:boolean;mubytesstart:boolean;mubytetoken:halfword;
mubytestoken:halfword;mubytesout:integer;mubyteslog:integer;
specsout:integer;noconvert:boolean;activenoconvert:boolean;
writenoexpanding:boolean;csconverting:boolean;specialprinting:boolean;
messageprinting:boolean;{:20}{26:}nameoffile:^ASCIIcode;
namelength:0..maxint;{:26}{30:}buffer:^ASCIIcode;first:0..bufsize;
last:0..bufsize;maxbufstack:0..bufsize;
{:30}{32:}ifdef('INITEX')iniversion:boolean;dumpoption:boolean;
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
{:32}{39:}strpool:^packedASCIIcode;strstart:^poolpointer;
poolptr:poolpointer;strptr:strnumber;initpoolptr:poolpointer;
initstrptr:strnumber;{:39}{50:}ifdef('INITEX')poolfile:alphafile;
endif('INITEX'){:50}{54:}logfile:alphafile;selector:0..21;
dig:array[0..22]of 0..15;tally:integer;termoffset:0..maxprintline;
fileoffset:0..maxprintline;trickbuf:array[0..255]of ASCIIcode;
trickcount:integer;firstcount:integer;{:54}{73:}interaction:0..3;
interactionoption:0..4;{:73}{76:}deletionsallowed:boolean;
setboxallowed:boolean;history:0..3;errorcount:-1..100;
{:76}{79:}helpline:array[0..5]of strnumber;helpptr:0..6;
useerrhelp:boolean;{:79}{96:}interrupt:integer;OKtointerrupt:boolean;
{:96}{104:}savearitherror:boolean;aritherror:boolean;
texremainder:scaled;{:104}{110:}randoms:array[0..54]of integer;
jrandom:0..54;randomseed:scaled;
{:110}{117:}twotothe:array[0..30]of integer;
speclog:array[1..28]of integer;{:117}{133:}tempptr:halfword;
{:133}{134:}yzmem:^memoryword;zmem:^memoryword;lomemmax:halfword;
himemmin:halfword;{:134}{135:}varused,dynused:integer;
{:135}{136:}avail:halfword;memend:halfword;{:136}{142:}rover:halfword;
{:142}{183:}ifdef('TEXMF_DEBUG')freearr:packed array[0..9]of boolean;
wasfree:packed array[0..9]of boolean;
wasmemend,waslomax,washimin:halfword;panicking:boolean;
endif('TEXMF_DEBUG'){:183}{191:}fontinshortdisplay:integer;
{:191}{199:}depththreshold:integer;breadthmax:integer;
{:199}{231:}nest:^liststaterecord;nestptr:0..nestsize;
maxneststack:0..nestsize;curlist:liststaterecord;shownmode:-209..209;
savetail:halfword;prevtail:halfword;{:231}{264:}oldsetting:0..21;
oldselectorignorederr:0..21;systime,sysday,sysmonth,sysyear:integer;
{:264}{271:}zeqtb:^memoryword;
xeqlevel:array[29277..30192]of quarterword;{:271}{274:}hash:^twohalves;
yhash:^twohalves;hashused:halfword;hashextra:halfword;hashtop:halfword;
eqtbtop:halfword;hashhigh:halfword;nonewcontrolsequence:boolean;
cscount:integer;{:274}{275:}prim:array[0..2100]of twohalves;
primused:halfword;{:275}{293:}savestack:^memoryword;saveptr:0..savesize;
maxsavestack:0..savesize;curlevel:quarterword;curgroup:groupcode;
curboundary:0..savesize;{:293}{308:}magset:integer;
{:308}{319:}curcmd:eightbits;curchr:halfword;curcs:halfword;
curtok:halfword;{:319}{323:}inputstack:^instaterecord;
inputptr:0..stacksize;maxinstack:0..stacksize;curinput:instaterecord;
{:323}{326:}inopen:0..maxinopen;openparens:0..maxinopen;
inputfile:^alphafile;line:integer;linestack:^integer;
sourcefilenamestack:^strnumber;fullsourcefilenamestack:^strnumber;
{:326}{327:}scannerstatus:0..5;warningindex:halfword;defref:halfword;
{:327}{330:}paramstack:^halfword;paramptr:0..paramsize;
maxparamstack:integer;{:330}{331:}alignstate:integer;
{:331}{332:}baseptr:0..stacksize;{:332}{355:}parloc:halfword;
partoken:halfword;{:355}{383:}forceeof:boolean;
{:383}{389:}isincsname:boolean;
{:389}{408:}curmark:array[0..4]of halfword;
{:408}{413:}longstate:114..117;
{:413}{414:}pstack:array[0..8]of halfword;{:414}{436:}curval:integer;
curvallevel:0..5;{:436}{464:}radix:smallnumber;
{:464}{473:}curorder:glueord;
{:473}{506:}readfile:array[0..15]of alphafile;
readopen:array[0..16]of 0..2;{:506}{515:}condptr:halfword;iflimit:0..4;
curif:smallnumber;ifline:integer;{:515}{519:}skipline:integer;
{:519}{538:}curname:strnumber;curarea:strnumber;curext:strnumber;
{:538}{539:}areadelimiter:poolpointer;extdelimiter:poolpointer;
{:539}{546:}formatdefaultlength:integer;TEXformatdefault:cstring;
{:546}{553:}nameinprogress:boolean;jobname:strnumber;logopened:boolean;
{:553}{558:}dvifile:bytefile;outputfilename:strnumber;
texmflogname:strnumber;{:558}{565:}tfmfile:bytefile;
{:565}{575:}fontinfo:^fmemoryword;fmemptr:fontindex;
fontptr:internalfontnumber;fontcheck:^fourquarters;fontsize:^scaled;
fontdsize:^scaled;fontparams:^fontindex;fontname:^strnumber;
fontarea:^strnumber;fontbc:^eightbits;fontec:^eightbits;
fontglue:^halfword;fontused:^boolean;hyphenchar:^integer;
skewchar:^integer;bcharlabel:^fontindex;fontbchar:^ninebits;
fontfalsebchar:^ninebits;{:575}{576:}charbase:^integer;
widthbase:^integer;heightbase:^integer;depthbase:^integer;
italicbase:^integer;ligkernbase:^integer;kernbase:^integer;
extenbase:^integer;parambase:^integer;
{:576}{581:}nullcharacter:fourquarters;{:581}{619:}totalpages:integer;
maxv:scaled;maxh:scaled;maxpush:integer;lastbop:integer;
deadcycles:integer;doingleaders:boolean;c:quarterword;
f:internalfontnumber;ruleht,ruledp,rulewd:scaled;g:halfword;
lq,lr:integer;{:619}{622:}dvibuf:^eightbits;halfbuf:integer;
dvilimit:integer;dviptr:integer;dvioffset:integer;dvigone:integer;
{:622}{632:}downptr,rightptr:halfword;{:632}{643:}dvih,dviv:scaled;
curh,curv:scaled;dvif:internalfontnumber;curs:integer;
{:643}{676:}pdfmemsize:integer;pdfmem:^integer;pdfmemptr:integer;
{:676}{680:}pdffile:bytefile;pdfbuf:^eightbits;pdfbufsize:integer;
pdfptr:integer;pdfopbuf:^eightbits;pdfosbuf:^eightbits;
pdfosbufsize:integer;pdfosobjnum:^integer;pdfosobjoff:^integer;
pdfosobjidx:halfword;pdfoscntr:integer;pdfopptr:integer;
pdfosptr:integer;pdfosmode:boolean;pdfosenable:boolean;
pdfoscurobjnum:integer;pdfgone:longinteger;pdfsaveoffset:longinteger;
zipwritestate:integer;fixedpdfmajorversion:integer;
fixedpdfminorversion:integer;fixedpdfobjcompresslevel:integer;
pdfversionwritten:boolean;fixedpdfoutput:integer;
fixedpdfoutputset:boolean;fixedgamma:integer;fixedimagegamma:integer;
fixedimagehicolor:boolean;fixedimageapplygamma:integer;
epochseconds:integer;microseconds:integer;fixedpdfdraftmode:integer;
fixedpdfdraftmodeset:boolean;pdfpagegroupval:integer;
{:680}{687:}onebp:scaled;onehundredbp:scaled;onehundredinch:scaled;
oneinch:integer;tenpow:array[0..9]of integer;scaledout:integer;
initpdfoutput:boolean;advcharwidths:integer;advcharwidthsout:scaled;
{:687}{691:}pdff:internalfontnumber;pdfh:scaled;pdfv:scaled;
pdftjstarth:scaled;curdeltah:scaled;pdfdeltah:scaled;pdforiginh:scaled;
pdforiginv:scaled;pdfdoingstring:boolean;pdfdoingtext:boolean;
minbpval:scaled;minfontval:scaled;fixedpkresolution:integer;
fixeddecimaldigits:integer;fixedgentounicode:integer;
fixedinclusioncopyfont:integer;pkscalefactor:integer;
pdfoutputoption:integer;pdfoutputvalue:integer;
pdfdraftmodeoption:integer;pdfdraftmodevalue:integer;pdfcurTma:integer;
pdflastf:internalfontnumber;pdflastfs:internalfontnumber;
pdfdummyfont:internalfontnumber;{:691}{696:}objtabsize:integer;
objtab:^objentry;headtab:array[1..10]of integer;pagestail:integer;
objptr:integer;sysobjptr:integer;pdflastpages:integer;
pdflastpage:integer;pdflaststream:integer;pdfstreamlength:longinteger;
pdfstreamlengthoffset:longinteger;pdfseekwritelength:boolean;
pdflastbyte:eightbits;pdfappendlistarg:integer;ff:integer;
pdfboxspecmedia:integer;pdfboxspeccrop:integer;pdfboxspecbleed:integer;
pdfboxspectrim:integer;pdfboxspecart:integer;
{:696}{701:}pdfimageprocset:integer;pdftextprocset:boolean;
{:701}{704:}pdffonttype:^eightbits;pdffontattr:^strnumber;
pdffontnobuiltintounicode:^boolean;
{:704}{708:}pdfcharused:^charusedarray;pdffontsize:^scaled;
pdffontnum:^integer;pdffontmap:^fmentryptr;pdffontlist:halfword;
pdfresnameprefix:strnumber;lasttokensstring:strnumber;
{:708}{710:}vfpacketbase:^integer;vfdefaultfont:^internalfontnumber;
vflocalfontnum:^internalfontnumber;vfpacketlength:integer;
vffile:bytefile;vfnf:internalfontnumber;vfefnts:^integer;
vfifnts:^internalfontnumber;tmpw:memoryword;
{:710}{723:}vfcurs:0..vfmaxrecursion;
vfstack:array[vfstackindex]of vfstackrecord;vfstackptr:vfstackindex;
{:723}{774:}savedpdfcurform:integer;{:774}{811:}pdftexbanner:strnumber;
{:811}{818:}totalstretch,totalshrink:array[glueord]of scaled;
lastbadness:integer;{:818}{819:}adjusttail:halfword;
{:819}{821:}pdffontblink:^internalfontnumber;
pdffontelink:^internalfontnumber;pdffonthasspacechar:^boolean;
pdffontstretch:^integer;pdffontshrink:^integer;pdffontstep:^integer;
pdffontexpandratio:^integer;pdffontautoexpand:^boolean;
pdffontlpbase:^integer;pdffontrpbase:^integer;pdffontefbase:^integer;
pdffontknbsbase:^integer;pdffontstbsbase:^integer;
pdffontshbsbase:^integer;pdffontknbcbase:^integer;
pdffontknacbase:^integer;fontexpandratio:integer;
lastleftmostchar:halfword;lastrightmostchar:halfword;
hliststack:array[0..512]of halfword;hliststacklevel:0..512;
{:821}{829:}preadjusttail:halfword;{:829}{837:}packbeginline:integer;
{:837}{860:}emptyfield:twohalves;nulldelimiter:fourquarters;
{:860}{895:}curmlist:halfword;curstyle:smallnumber;cursize:smallnumber;
curmu:scaled;mlistpenalties:boolean;{:895}{900:}curf:internalfontnumber;
curc:quarterword;curi:fourquarters;{:900}{940:}magicoffset:integer;
{:940}{946:}curalign:halfword;curspan:halfword;curloop:halfword;
alignptr:halfword;curhead,curtail:halfword;
curprehead,curpretail:halfword;{:946}{990:}justbox:halfword;
{:990}{997:}passive:halfword;printednode:halfword;passnumber:halfword;
{:997}{999:}activewidth:array[1..8]of scaled;
curactivewidth:array[1..8]of scaled;background:array[1..8]of scaled;
breakwidth:array[1..8]of scaled;autobreaking:boolean;prevp:halfword;
firstp:halfword;prevcharp:halfword;nextcharp:halfword;
tryprevbreak:boolean;prevlegal:halfword;prevprevlegal:halfword;
prevautobreaking:boolean;prevactivewidth:array[1..8]of scaled;
rejectedcurp:halfword;beforerejectedcurp:boolean;
maxstretchratio:integer;maxshrinkratio:integer;curfontstep:integer;
{:999}{1001:}noshrinkerroryet:boolean;{:1001}{1004:}curp:halfword;
secondpass:boolean;finalpass:boolean;threshold:integer;
{:1004}{1009:}minimaldemerits:array[0..3]of integer;
minimumdemerits:integer;bestplace:array[0..3]of halfword;
bestplline:array[0..3]of halfword;
{:1009}{1015:}discwidth:array[1..8]of scaled;
{:1015}{1023:}easyline:halfword;lastspecialline:halfword;
firstwidth:scaled;secondwidth:scaled;firstindent:scaled;
secondindent:scaled;{:1023}{1048:}bestbet:halfword;
fewestdemerits:integer;bestline:halfword;actuallooseness:integer;
linediff:integer;{:1048}{1069:}hc:array[0..65]of 0..256;hn:0..64;
ha,hb:halfword;hf:internalfontnumber;hu:array[0..63]of 0..256;
hyfchar:integer;curlang,initcurlang:ASCIIcode;
lhyf,rhyf,initlhyf,initrhyf:integer;hyfbchar:halfword;
{:1069}{1077:}hyf:array[0..64]of 0..9;initlist:halfword;initlig:boolean;
initlft:boolean;{:1077}{1082:}hyphenpassed:smallnumber;
{:1082}{1084:}curl,curr:halfword;curq:halfword;ligstack:halfword;
ligaturepresent:boolean;lfthit,rthit:boolean;
{:1084}{1098:}trietrl:^triepointer;trietro:^triepointer;
trietrc:^quarterword;hyfdistance:array[1..trieopsize]of smallnumber;
hyfnum:array[1..trieopsize]of smallnumber;
hyfnext:array[1..trieopsize]of trieopcode;
opstart:array[ASCIIcode]of 0..trieopsize;
{:1098}{1103:}hyphword:^strnumber;hyphlist:^halfword;
hyphlink:^hyphpointer;hyphcount:integer;hyphnext:integer;
{:1103}{1120:}ifdef('INITEX')trieophash:array[negtrieopsize..trieopsize]
of 0..trieopsize;trieused:array[ASCIIcode]of trieopcode;
trieoplang:array[1..trieopsize]of ASCIIcode;
trieopval:array[1..trieopsize]of trieopcode;trieopptr:0..trieopsize;
endif('INITEX')maxopused:trieopcode;smallop:boolean;
{:1120}{1124:}ifdef('INITEX')triec:^packedASCIIcode;trieo:^trieopcode;
triel:^triepointer;trier:^triepointer;trieptr:triepointer;
triehash:^triepointer;
endif('INITEX'){:1124}{1127:}ifdef('INITEX')trietaken:^boolean;
triemin:array[ASCIIcode]of triepointer;triemax:triepointer;
trienotready:boolean;
endif('INITEX'){:1127}{1148:}bestheightplusdepth:scaled;
{:1148}{1157:}pagetail:halfword;pagecontents:0..2;pagemaxdepth:scaled;
bestpagebreak:halfword;leastpagecost:integer;bestsize:scaled;
{:1157}{1159:}pagesofar:array[0..7]of scaled;lastglue:halfword;
lastpenalty:integer;lastkern:scaled;lastnodetype:integer;
insertpenalties:integer;{:1159}{1166:}outputactive:boolean;
outputcanend:boolean;{:1166}{1209:}mainf:internalfontnumber;
maini:fourquarters;mainj:fourquarters;maink:fontindex;mainp:halfword;
mains:integer;bchar:halfword;falsebchar:halfword;cancelboundary:boolean;
insdisc:boolean;{:1209}{1252:}curbox:halfword;
{:1252}{1444:}aftertoken:halfword;{:1444}{1459:}longhelpseen:boolean;
{:1459}{1477:}formatident:strnumber;{:1477}{1483:}fmtfile:wordfile;
{:1483}{1511:}readyalready:integer;
{:1511}{1522:}writefile:array[0..15]of alphafile;
writeopen:array[0..17]of boolean;{:1522}{1525:}writeloc:halfword;
{:1525}{1543:}pdflastobj:integer;{:1543}{1547:}pdflastxform:integer;
{:1547}{1550:}pdflastximage:integer;pdflastximagepages:integer;
pdflastximagecolordepth:integer;altrule:halfword;warnpdfpagebox:boolean;
{:1550}{1557:}pdflastannot:integer;{:1557}{1559:}pdflastlink:integer;
{:1559}{1570:}pdflastxpos:integer;pdflastypos:integer;
pdfsnapxrefpos:integer;pdfsnapyrefpos:integer;countdosnapy:integer;
{:1570}{1583:}pdfretval:integer;{:1583}{1628:}curpagewidth:scaled;
curpageheight:scaled;curhoffset:scaled;curvoffset:scaled;
pdfobjlist:halfword;pdfxformlist:halfword;pdfximagelist:halfword;
lastthread:halfword;pdfthreadht,pdfthreaddp,pdfthreadwd:scaled;
pdflastthreadid:halfword;pdflastthreadnamedid:boolean;
pdfthreadlevel:integer;pdfannotlist:halfword;pdflinklist:halfword;
pdfdestlist:halfword;pdfbeadlist:halfword;pdfobjcount:integer;
pdfxformcount:integer;pdfximagecount:integer;pdfcurform:integer;
pdffirstoutline,pdflastoutline,pdfparentoutline:integer;
pdfxformwidth,pdfxformheight,pdfxformdepth:scaled;pdfinfotoks:halfword;
pdfcatalogtoks:halfword;pdfcatalogopenaction:integer;
pdfnamestoks:halfword;pdfdestnamesptr:integer;destnamessize:integer;
destnames:^destnameentry;pkdpi:integer;imageorigx,imageorigy:integer;
pdftrailertoks:halfword;pdftraileridtoks:halfword;
genfakedinterwordspace:boolean;genrunninglink:boolean;
pdfspacefontname:strnumber;
{:1628}{1633:}pdflinkstack:array[1..pdfmaxlinklevel]of
pdflinkstackrecord;pdflinkstackptr:smallnumber;
{:1633}{1640:}isshippingpage:boolean;{:1640}{1652:}eTeXmode:0..1;
etexp:boolean;{:1652}{1660:}eofseen:^boolean;
{:1660}{1705:}LRptr:halfword;LRproblems:integer;curdir:smallnumber;
{:1705}{1750:}pseudofiles:halfword;{:1750}{1773:}grpstack:^savepointer;
ifstack:^halfword;{:1773}{1814:}maxregnum:halfword;
maxreghelpline:strnumber;{:1814}{1816:}saroot:array[0..6]of halfword;
curptr:halfword;sanull:memoryword;{:1816}{1835:}sachain:halfword;
salevel:quarterword;{:1835}{1842:}lastlinefill:halfword;
dolastlinefit:boolean;activenodesize:smallnumber;
fillwidth:array[0..2]of scaled;bestplshort:array[0..3]of scaled;
bestplglue:array[0..3]of scaled;{:1842}{1858:}hyphstart:triepointer;
hyphindex:triepointer;{:1858}{1859:}discptr:array[1..3]of halfword;
{:1859}{1867:}editnamestart:poolpointer;editnamelength,editline:integer;
ipcon:cinttype;stopatspace:boolean;{:1867}{1869:}savestrptr:strnumber;
savepoolptr:poolpointer;shellenabledp:cinttype;restrictedshell:cinttype;
outputcomment:^char;k,l:0..255;{:1869}{1871:}debugformatfile:boolean;
{:1871}{1878:}expanddepthcount:integer;{:1878}{1881:}mltexp:boolean;
{:1881}{1882:}mltexenabledp:boolean;
{:1882}{1888:}accentc,basec,replacec:integer;iac,ibc:fourquarters;
baseslant,accentslant:real;basexheight:scaled;
basewidth,baseheight:scaled;accentwidth,accentheight:scaled;
delta:scaled;{:1888}{1896:}enctexp:boolean;
{:1896}{1897:}enctexenabledp:boolean;
{:1897}{1906:}synctexoption:integer;{:1906}{1911:}synctexoffset:integer;
{:1911}procedure initialize;var{19:}i:integer;{:19}{181:}k:integer;
{:181}{1104:}z:hyphpointer;{:1104}begin{8:}{21:}xchr[32]:=' ';
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
for i:=127 to 255 do xchr[i]:=i;
for i:=0 to 255 do mubyteread[i]:=-268435455;
for i:=0 to 255 do mubytewrite[i]:=0;
for i:=0 to 127 do mubytecswrite[i]:=-268435455;mubytekeep:=0;
mubytestart:=false;writenoexpanding:=false;csconverting:=false;
specialprinting:=false;messageprinting:=false;noconvert:=false;
activenoconvert:=false;{:23}{24:}for i:=0 to 255 do xord[chr(i)]:=127;
for i:=128 to 255 do xord[xchr[i]]:=i;
for i:=0 to 126 do xord[xchr[i]]:=i;
for i:=0 to 255 do xprn[i]:=(eightbitp or((i>=32)and(i<=126)));
if translatefilename then readtcxfile;
{:24}{74:}if interactionoption=4 then interaction:=3 else interaction:=
interactionoption;{:74}{77:}deletionsallowed:=true;setboxallowed:=true;
errorcount:=0;{:77}{80:}helpptr:=0;useerrhelp:=false;
{:80}{97:}interrupt:=0;OKtointerrupt:=true;{:97}{118:}twotothe[0]:=1;
for k:=1 to 30 do twotothe[k]:=2*twotothe[k-1];speclog[1]:=93032640;
speclog[2]:=38612034;speclog[3]:=17922280;speclog[4]:=8662214;
speclog[5]:=4261238;speclog[6]:=2113709;speclog[7]:=1052693;
speclog[8]:=525315;speclog[9]:=262400;speclog[10]:=131136;
speclog[11]:=65552;speclog[12]:=32772;speclog[13]:=16385;
for k:=14 to 27 do speclog[k]:=twotothe[27-k];speclog[28]:=1;
{:118}{184:}ifdef('TEXMF_DEBUG')wasmemend:=memmin;waslomax:=memmin;
washimin:=memmax;panicking:=false;
endif('TEXMF_DEBUG'){:184}{233:}nestptr:=0;maxneststack:=0;
curlist.modefield:=1;curlist.headfield:=memtop-1;
curlist.tailfield:=memtop-1;curlist.eTeXauxfield:=-268435455;
savetail:=-268435455;curlist.auxfield.int:=-65536000;curlist.mlfield:=0;
curlist.pgfield:=0;shownmode:=0;pagecontents:=0;pagetail:=memtop-2;
lastglue:=268435455;lastpenalty:=0;lastkern:=0;lastnodetype:=-1;
pagesofar[7]:=0;pagemaxdepth:=0;
{:233}{272:}for k:=29277 to 30192 do xeqlevel[k]:=1;
{:272}{276:}nonewcontrolsequence:=true;prim[0].lh:=0;prim[0].rh:=0;
for k:=1 to 2100 do prim[k]:=prim[0];{:276}{294:}saveptr:=0;curlevel:=1;
curgroup:=0;curboundary:=0;maxsavestack:=0;{:294}{309:}magset:=0;
{:309}{390:}isincsname:=false;{:390}{409:}curmark[0]:=-268435455;
curmark[1]:=-268435455;curmark[2]:=-268435455;curmark[3]:=-268435455;
curmark[4]:=-268435455;{:409}{465:}curval:=0;curvallevel:=0;radix:=0;
curorder:=0;{:465}{507:}for k:=0 to 16 do readopen[k]:=2;
{:507}{516:}condptr:=-268435455;iflimit:=0;curif:=0;ifline:=0;
{:516}{577:}{:577}{582:}nullcharacter.b0:=0;nullcharacter.b1:=0;
nullcharacter.b2:=0;nullcharacter.b3:=0;{:582}{620:}totalpages:=0;
maxv:=0;maxh:=0;maxpush:=0;lastbop:=-1;doingleaders:=false;
deadcycles:=0;curs:=-1;{:620}{623:}halfbuf:=dvibufsize div 2;
dvilimit:=dvibufsize;dviptr:=0;dvioffset:=0;dvigone:=0;
{:623}{633:}downptr:=-268435455;rightptr:=-268435455;
{:633}{677:}pdfmemptr:=1;pdfmemsize:=infpdfmemsize;
{:677}{681:}pdfgone:=0;pdfosmode:=false;pdfptr:=0;pdfopptr:=0;
pdfosptr:=0;pdfoscurobjnum:=0;pdfoscntr:=0;pdfbufsize:=pdfopbufsize;
pdfosbufsize:=infpdfosbufsize;pdfbuf:=pdfopbuf;
pdfseekwritelength:=false;zipwritestate:=0;pdfversionwritten:=false;
fixedpdfoutputset:=false;fixedpdfdraftmodeset:=false;
{:681}{688:}onebp:=65782;onehundredbp:=6578176;
onehundredinch:=473628672;oneinch:=226;tenpow[0]:=1;
for i:=1 to 9 do tenpow[i]:=10*tenpow[i-1];initpdfoutput:=false;
{:688}{697:}objptr:=0;sysobjptr:=0;objtabsize:=infobjtabsize;
destnamessize:=infdestnamessize;for k:=1 to 10 do headtab[k]:=0;
pdfboxspecmedia:=1;pdfboxspeccrop:=2;pdfboxspecbleed:=3;
pdfboxspectrim:=4;pdfboxspecart:=5;pdfdummyfont:=0;
{:697}{709:}pdfresnameprefix:=0;lasttokensstring:=0;{:709}{711:}vfnf:=0;
{:711}{724:}vfcurs:=0;vfstackptr:=0;{:724}{820:}adjusttail:=-268435455;
lastbadness:=0;{:820}{830:}preadjusttail:=-268435455;
{:830}{838:}packbeginline:=0;{:838}{861:}emptyfield.rh:=0;
emptyfield.lh:=-268435455;nulldelimiter.b0:=0;nulldelimiter.b1:=0;
nulldelimiter.b2:=0;nulldelimiter.b3:=0;
{:861}{947:}alignptr:=-268435455;curalign:=-268435455;
curspan:=-268435455;curloop:=-268435455;curhead:=-268435455;
curtail:=-268435455;curprehead:=-268435455;curpretail:=-268435455;
{:947}{1105:}for z:=0 to hyphsize do begin hyphword[z]:=0;
hyphlist[z]:=-268435455;hyphlink[z]:=0;end;hyphcount:=0;hyphnext:=608;
if hyphnext>hyphsize then hyphnext:=607;
{:1105}{1167:}outputactive:=false;outputcanend:=false;
insertpenalties:=0;{:1167}{1210:}ligaturepresent:=false;
cancelboundary:=false;lfthit:=false;rthit:=false;insdisc:=false;
{:1210}{1445:}aftertoken:=0;{:1445}{1460:}longhelpseen:=false;
{:1460}{1478:}formatident:=0;
{:1478}{1523:}for k:=0 to 17 do writeopen[k]:=false;
{:1523}{1551:}altrule:=-268435455;warnpdfpagebox:=true;
{:1551}{1571:}countdosnapy:=0;
{:1571}{1584:}secondsandmicros(epochseconds,microseconds);initstarttime;
{:1584}{1629:}pdffirstoutline:=0;pdflastoutline:=0;pdfparentoutline:=0;
pdfobjcount:=0;pdfxformcount:=0;pdfximagecount:=0;pdfdestnamesptr:=0;
pdfinfotoks:=-268435455;pdfcatalogtoks:=-268435455;
pdfnamestoks:=-268435455;pdfcatalogopenaction:=0;
pdftrailertoks:=-268435455;pdftraileridtoks:=-268435455;
genfakedinterwordspace:=false;genrunninglink:=true;
pdfspacefontname:=1948;{:1629}{1634:}pdflinkstackptr:=0;
{:1634}{1706:}LRptr:=-268435455;LRproblems:=0;curdir:=0;
{:1706}{1751:}pseudofiles:=-268435455;
{:1751}{1817:}saroot[6]:=-268435455;sanull.hh.lh:=-268435455;
sanull.hh.rh:=-268435455;{:1817}{1836:}sachain:=-268435455;salevel:=0;
{:1836}{1860:}discptr[2]:=-268435455;discptr[3]:=-268435455;
{:1860}{1868:}editnamestart:=0;stopatspace:=true;haltingonerrorp:=false;
{:1868}{1879:}expanddepthcount:=0;{:1879}{1883:}mltexenabledp:=false;
{:1883}{1898:}enctexenabledp:=false;
{:1898}ifdef('INITEX')if iniversion then begin{182:}for k:=membot+1 to
membot+19 do mem[k].int:=0;k:=membot;
while k<=membot+19 do begin mem[k].hh.rh:=-268435454;mem[k].hh.b0:=0;
mem[k].hh.b1:=0;k:=k+4;end;mem[membot+6].int:=65536;
mem[membot+4].hh.b0:=1;mem[membot+10].int:=65536;mem[membot+8].hh.b0:=2;
mem[membot+14].int:=65536;mem[membot+12].hh.b0:=1;
mem[membot+15].int:=65536;mem[membot+12].hh.b1:=1;
mem[membot+18].int:=-65536;mem[membot+16].hh.b0:=1;rover:=membot+20;
mem[rover].hh.rh:=268435455;mem[rover].hh.lh:=1000;
mem[rover+1].hh.lh:=rover;mem[rover+1].hh.rh:=rover;
lomemmax:=rover+1000;mem[lomemmax].hh.rh:=-268435455;
mem[lomemmax].hh.lh:=-268435455;
for k:=memtop-14 to memtop do mem[k]:=mem[lomemmax];
{966:}mem[memtop-10].hh.lh:=19614;{:966}{973:}mem[memtop-9].hh.rh:=256;
mem[memtop-9].hh.lh:=-268435455;{:973}{996:}mem[memtop-7].hh.b0:=1;
mem[memtop-6].hh.lh:=268435455;mem[memtop-7].hh.b1:=0;
{:996}{1158:}mem[memtop].hh.b1:=255;mem[memtop].hh.b0:=1;
mem[memtop].hh.rh:=memtop;{:1158}{1165:}mem[memtop-2].hh.b0:=10;
mem[memtop-2].hh.b1:=0;{:1165};avail:=-268435455;memend:=memtop;
himemmin:=memtop-14;varused:=membot+20-membot;dynused:=15;
{:182}{240:}eqtb[26627].hh.b0:=104;eqtb[26627].hh.rh:=-268435455;
eqtb[26627].hh.b1:=0;for k:=1 to eqtbtop do eqtb[k]:=eqtb[26627];
{:240}{246:}eqtb[26628].hh.rh:=membot;eqtb[26628].hh.b1:=1;
eqtb[26628].hh.b0:=120;for k:=26629 to 27157 do eqtb[k]:=eqtb[26628];
mem[membot].hh.rh:=mem[membot].hh.rh+530;
{:246}{250:}eqtb[27158].hh.rh:=-268435455;eqtb[27158].hh.b0:=121;
eqtb[27158].hh.b1:=1;for k:=27429 to 27432 do eqtb[k]:=eqtb[27158];
for k:=27159 to 27428 do eqtb[k]:=eqtb[26627];
eqtb[27433].hh.rh:=-268435455;eqtb[27433].hh.b0:=122;
eqtb[27433].hh.b1:=1;for k:=27434 to 27688 do eqtb[k]:=eqtb[27433];
eqtb[27689].hh.rh:=0;eqtb[27689].hh.b0:=123;eqtb[27689].hh.b1:=1;
for k:=27693 to 27740 do eqtb[k]:=eqtb[27689];eqtb[27741].hh.rh:=0;
eqtb[27741].hh.b0:=123;eqtb[27741].hh.b1:=1;
for k:=27742 to 29276 do eqtb[k]:=eqtb[27741];
for k:=0 to 255 do begin eqtb[27741+k].hh.rh:=12;eqtb[28765+k].hh.rh:=k;
eqtb[28509+k].hh.rh:=1000;end;eqtb[27754].hh.rh:=5;
eqtb[27773].hh.rh:=10;eqtb[27833].hh.rh:=0;eqtb[27778].hh.rh:=14;
eqtb[27868].hh.rh:=15;eqtb[27741].hh.rh:=9;
for k:=48 to 57 do eqtb[28765+k].hh.rh:=k+28672;
for k:=65 to 90 do begin eqtb[27741+k].hh.rh:=11;
eqtb[27741+k+32].hh.rh:=11;eqtb[28765+k].hh.rh:=k+28928;
eqtb[28765+k+32].hh.rh:=k+28960;eqtb[27997+k].hh.rh:=k+32;
eqtb[27997+k+32].hh.rh:=k+32;eqtb[28253+k].hh.rh:=k;
eqtb[28253+k+32].hh.rh:=k;eqtb[28509+k].hh.rh:=999;end;
{:250}{258:}for k:=29277 to 29646 do eqtb[k].int:=0;
eqtb[29332].int:=256;eqtb[29333].int:=-1;eqtb[29294].int:=1000;
eqtb[29278].int:=10000;eqtb[29318].int:=1;eqtb[29317].int:=25;
eqtb[29322].int:=92;eqtb[29325].int:=13;
for k:=0 to 255 do eqtb[29647+k].int:=-1;eqtb[29693].int:=0;
eqtb[29337].int:=-1;{:258}{268:}for k:=29903 to 30192 do eqtb[k].int:=0;
{:268}{277:}primused:=2100;hashused:=15514;hashhigh:=0;cscount:=0;
eqtb[15523].hh.b0:=119;hash[15523].rh:=585;eqtb[15525].hh.b0:=39;
eqtb[15525].hh.rh:=1;eqtb[15525].hh.b1:=1;hash[15525].rh:=586;
{:277}{578:}{:578}{672:}eqtb[29924].int:=(onehundredinch+50)div 100;
eqtb[29925].int:=(onehundredinch+50)div 100;eqtb[29343].int:=9;
eqtb[29363].int:=0;eqtb[29344].int:=3;eqtb[29346].int:=72;
eqtb[29351].int:=1;eqtb[29352].int:=4;eqtb[29356].int:=1000;
eqtb[29357].int:=2200;eqtb[29358].int:=1;eqtb[29359].int:=0;
eqtb[29936].int:=onebp;eqtb[29368].int:=0;
{:672}{1064:}eqtb[29935].int:=-65536000;
eqtb[29933].int:=eqtb[29935].int;eqtb[29934].int:=eqtb[29935].int;
eqtb[29931].int:=eqtb[29935].int;eqtb[29932].int:=eqtb[29935].int;
{:1064}{1123:}for k:=-trieopsize to trieopsize do trieophash[k]:=0;
for k:=0 to 255 do trieused[k]:=mintrieop;maxopused:=mintrieop;
trieopptr:=0;{:1123}{1128:}trienotready:=true;
{:1128}{1394:}hash[15514].rh:=1623;
{:1394}{1479:}if iniversion then formatident:=1710;
{:1479}{1616:}hash[15522].rh:=1933;eqtb[15522].hh.b1:=1;
eqtb[15522].hh.b0:=116;eqtb[15522].hh.rh:=-268435455;
{:1616}{1653:}eTeXmode:=0;{1812:}maxregnum:=255;maxreghelpline:=800;
{:1812}{:1653}{1818:}for i:=0 to 5 do saroot[i]:=-268435455;
{:1818}{1854:}{:1854}end;endif('INITEX'){:8}{1912:}synctexoffset:=29390;
{:1912}end;{57:}procedure println;
begin case selector of 19:begin writeln(stdout);writeln(logfile);
termoffset:=0;fileoffset:=0;end;18:begin writeln(logfile);fileoffset:=0;
end;17:begin writeln(stdout);termoffset:=0;end;16,20,21:;
others:writeln(writefile[selector])end;end;
{:57}{58:}procedure printchar(s:ASCIIcode);label 10;
begin if{262:}s=eqtb[29326].int{:262}then if selector<20 then begin
println;goto 10;end;case selector of 19:begin write(stdout,xchr[s]);
write(logfile,xchr[s]);incr(termoffset);incr(fileoffset);
if termoffset=maxprintline then begin writeln(stdout);termoffset:=0;end;
if fileoffset=maxprintline then begin writeln(logfile);fileoffset:=0;
end;end;18:begin write(logfile,xchr[s]);incr(fileoffset);
if fileoffset=maxprintline then println;end;
17:begin write(stdout,xchr[s]);incr(termoffset);
if termoffset=maxprintline then println;end;16:;
20:if tally<trickcount then trickbuf[tally mod errorline]:=s;
21:begin if poolptr<poolsize then begin strpool[poolptr]:=s;
incr(poolptr);end;end;others:write(writefile[selector],xchr[s])end;
incr(tally);10:end;{:58}{59:}procedure print(s:integer);label 10;
var j:poolpointer;nl:integer;
begin if s>=strptr then s:=261 else if s<256 then if s<0 then s:=261
else begin if(selector>20)and(not specialprinting)and(not
messageprinting)then begin printchar(s);goto 10;end;
if({262:}s=eqtb[29326].int{:262})then if selector<20 then begin println;
noconvert:=false;goto 10;
end else if messageprinting then begin printchar(s);noconvert:=false;
goto 10;end;
if(eqtb[29340].int>0)and(not noconvert)and(mubytewrite[s]>0)then s:=
mubytewrite[s]else if xprn[s]or specialprinting then begin printchar(s);
noconvert:=false;goto 10;end;noconvert:=false;nl:=eqtb[29326].int;
eqtb[29326].int:=-1;j:=strstart[s];
while j<strstart[s+1]do begin printchar(strpool[j]);incr(j);end;
eqtb[29326].int:=nl;goto 10;end;j:=strstart[s];
while j<strstart[s+1]do begin printchar(strpool[j]);incr(j);end;10:end;
{:59}{60:}procedure slowprint(s:integer);var j:poolpointer;
begin if(s>=strptr)or(s<256)then print(s)else begin j:=strstart[s];
while j<strstart[s+1]do begin print(strpool[j]);incr(j);end;end;end;
{:60}{62:}procedure printnl(s:strnumber);
begin if(selector<16)or((termoffset>0)and(odd(selector)))or((fileoffset>
0)and(selector>=18))then println;print(s);end;
{:62}{63:}procedure printesc(s:strnumber);var c:integer;
begin{261:}c:=eqtb[29322].int{:261};if c>=0 then if c<256 then print(c);
slowprint(s);end;{:63}{64:}procedure printthedigs(k:eightbits);
begin while k>0 do begin decr(k);
if dig[k]<10 then printchar(48+dig[k])else printchar(55+dig[k]);end;end;
{:64}{65:}procedure printint(n:longinteger);var k:0..23;m:longinteger;
begin k:=0;if n<0 then begin printchar(45);
if n>-100000000 then n:=-n else begin m:=-1-n;n:=m div 10;
m:=(m mod 10)+1;k:=1;if m<10 then dig[0]:=m else begin dig[0]:=0;
incr(n);end;end;end;repeat dig[k]:=n mod 10;n:=n div 10;incr(k);
until n=0;printthedigs(k);end;{:65}{284:}procedure printcs(p:integer);
var q:halfword;s:strnumber;
begin if activenoconvert and(not noconvert)and(eqtb[p].hh.b0=94)and(eqtb
[p].hh.rh=11)then begin noconvert:=true;goto 10;end;s:=0;
if csconverting and(not noconvert)then begin q:=mubytecswrite[p mod 128]
;
while q<>-268435455 do if mem[q].hh.lh=p then begin s:=mem[mem[q].hh.rh]
.hh.lh;q:=-268435455;end else q:=mem[mem[q].hh.rh].hh.rh;end;
noconvert:=false;
if s>0 then print(s)else if p<514 then if p>=257 then if p=513 then
begin printesc(589);printesc(590);printchar(32);
end else begin printesc(p-257);
if eqtb[27741+p-257].hh.rh=11 then printchar(32);
end else if p<1 then printesc(591)else print(p-1)else if((p>=26627)and(p
<=30192))or(p>eqtbtop)then printesc(591)else if(hash[p].rh>=strptr)then
printesc(592)else begin if(p>=15526)and(p<17626)then printesc(prim[p
-15526].rh-1)else printesc(hash[p].rh);printchar(32);end;10:end;
{:284}{285:}procedure sprintcs(p:halfword);
begin if p<514 then if p<257 then print(p-1)else if p<513 then printesc(
p-257)else begin printesc(589);printesc(590);
end else if(p>=15526)and(p<17626)then printesc(prim[p-15526].rh-1)else
printesc(hash[p].rh);end;
{:285}{544:}procedure printfilename(n,a,e:integer);
var mustquote:boolean;j:poolpointer;begin mustquote:=false;
if a<>0 then begin j:=strstart[a];
while(not mustquote)and(j<strstart[a+1])do begin mustquote:=strpool[j]=
32;incr(j);end;end;if n<>0 then begin j:=strstart[n];
while(not mustquote)and(j<strstart[n+1])do begin mustquote:=strpool[j]=
32;incr(j);end;end;if e<>0 then begin j:=strstart[e];
while(not mustquote)and(j<strstart[e+1])do begin mustquote:=strpool[j]=
32;incr(j);end;end;if mustquote then printchar(34);
if a<>0 then for j:=strstart[a]to strstart[a+1]-1 do if strpool[j]<>34
then print(strpool[j]);
if n<>0 then for j:=strstart[n]to strstart[n+1]-1 do if strpool[j]<>34
then print(strpool[j]);
if e<>0 then for j:=strstart[e]to strstart[e+1]-1 do if strpool[j]<>34
then print(strpool[j]);if mustquote then printchar(34);end;
{:544}{875:}procedure printsize(s:integer);
begin if s=0 then printesc(433)else if s=16 then printesc(434)else
printesc(435);end;{:875}{1602:}procedure printwritewhatsit(s:strnumber;
p:halfword);begin printesc(s);
if mem[p+1].hh.b0<16 then printint(mem[p+1].hh.b0)else if mem[p+1].hh.b0
=16 then printchar(42)else printchar(45);
if(s=687)and(mem[p+1].hh.b1<>64)then begin printchar(60);
printint(mem[p+1].hh.b1-64);printchar(62);end;end;
{:1602}{1822:}procedure printsanum(q:halfword);var n:halfword;
begin if mem[q].hh.b0<32 then n:=mem[q+1].hh.rh else begin n:=mem[q].hh.
b0 mod 16;q:=mem[q].hh.rh;n:=n+16*mem[q].hh.b0;q:=mem[q].hh.rh;
n:=n+256*(mem[q].hh.b0+16*mem[mem[q].hh.rh].hh.b0);end;printint(n);end;
{:1822}{1870:}procedure printcsnames(hstart:integer;hfinish:integer);
var c,h:integer;
begin writeln(stderr,'fmtdebug:csnames from ',hstart,' to ',hfinish,':')
;for h:=hstart to hfinish do begin if hash[h].rh>0 then begin for c:=
strstart[hash[h].rh]to strstart[hash[h].rh+1]-1 do begin putbyte(strpool
[c],stderr);end;writeln(stderr,'|');end;end;end;
{:1870}{1872:}procedure printfileline;var level:0..maxinopen;
begin level:=inopen;
while(level>0)and(fullsourcefilenamestack[level]=0)do decr(level);
if level=0 then printnl(264)else begin printnl(345);
print(fullsourcefilenamestack[level]);print(58);
if level=inopen then printint(line)else printint(linestack[level+1]);
print(660);end;end;
{:1872}{1899:}function readbuffer(var i:integer):ASCIIcode;
var p:halfword;lastfound:integer;lasttype:integer;begin mubyteskip:=0;
mubytetoken:=0;readbuffer:=buffer[i];
if eqtb[29338].int=0 then begin if mubytekeep>0 then mubytekeep:=0;
goto 10;end;lastfound:=-2;
if(i=curinput.startfield)and(not mubytestart)then begin mubytekeep:=0;
if(eqtb[29325].int>=0)and(eqtb[29325].int<256)then if mubyteread[eqtb[
29325].int]<>-268435455 then begin mubytestart:=true;mubyteskip:=-1;
p:=mubyteread[eqtb[29325].int];goto 22;end;end;20:mubytestart:=false;
if(mubyteread[buffer[i]]=-268435455)or(mubytekeep>0)then begin if
mubytekeep>0 then decr(mubytekeep);goto 10;end;p:=mubyteread[buffer[i]];
22:if mem[p].hh.b0>=64 then begin lasttype:=mem[p].hh.b0-64;
p:=mem[p].hh.rh;mubytetoken:=mem[p].hh.lh;lastfound:=mubyteskip;
end else if mem[p].hh.b0>0 then begin lasttype:=mem[p].hh.b0;
mubytetoken:=mem[p].hh.rh;goto 40;end;incr(mubyteskip);
if i+mubyteskip>curinput.limitfield then begin mubyteskip:=0;
if mubytestart then goto 20;goto 10;end;repeat p:=mem[p].hh.rh;
if mem[mem[p].hh.lh].hh.b1=buffer[i+mubyteskip]then begin p:=mem[p].hh.
lh;goto 22;end;until mem[p].hh.rh=-268435455;mubyteskip:=0;
if mubytestart then goto 20;if lastfound=-2 then goto 10;
mubyteskip:=lastfound;
40:if mubytetoken<256 then begin readbuffer:=mubytetoken;mubytetoken:=0;
i:=i+mubyteskip;
if mubytestart and(i>=curinput.startfield)then mubytestart:=false;
goto 10;end else begin readbuffer:=0;
if lasttype=60 then i:=i+mubyteskip else begin decr(i);
mubytekeep:=lasttype;if i<curinput.startfield then mubytestart:=true;
if lasttype=52 then mubytekeep:=10000;
if lasttype=51 then mubytekeep:=mubyteskip+1;mubyteskip:=-1;end;
if mubytestart and(i>=curinput.startfield)then mubytestart:=false;
goto 10;end;10:end;{:1899}{1901:}procedure printbuffer(var i:integer);
var c:ASCIIcode;
begin if eqtb[29338].int=0 then print(buffer[i])else if eqtb[29340].int>
0 then printchar(buffer[i])else begin c:=readbuffer(i);
if mubytetoken>0 then printcs(mubytetoken-4095)else print(c);end;
incr(i);end;{:1901}{78:}procedure normalizeselector;forward;
procedure gettoken;forward;procedure terminput;forward;
procedure showcontext;forward;procedure beginfilereading;forward;
procedure openlogfile;forward;procedure closefilesandterminate;forward;
procedure clearforerrorprompt;forward;procedure giveerrhelp;forward;
ifdef('TEXMF_DEBUG')procedure debughelp;forward;
endif('TEXMF_DEBUG'){:78}{81:}noreturn procedure jumpout;
begin closefilesandterminate;begin fflush(stdout);readyalready:=0;
if(history<>0)and(history<>1)then uexit(1)else uexit(0);end;end;
{:81}{82:}procedure error;label 22,10;var c:ASCIIcode;
s1,s2,s3,s4:integer;begin if history<2 then history:=2;printchar(46);
showcontext;
if(haltonerrorp)then begin if(haltingonerrorp)then begin fflush(stdout);
readyalready:=0;if(history<>0)and(history<>1)then uexit(1)else uexit(0);
end;haltingonerrorp:=true;{90:}if interaction>0 then decr(selector);
if useerrhelp then begin println;giveerrhelp;
end else while helpptr>0 do begin decr(helpptr);
printnl(helpline[helpptr]);end;println;
if interaction>0 then incr(selector);println{:90};history:=3;jumpout;
end;
if interaction=3 then{83:}while true do begin 22:if interaction<>3 then
goto 10;clearforerrorprompt;begin;print(266);terminput;end;
if last=first then goto 10;c:=buffer[first];if c>=97 then c:=c-32;
{84:}case c of 48,49,50,51,52,53,54,55,56,57:if deletionsallowed then
{88:}begin s1:=curtok;s2:=curcmd;s3:=curchr;s4:=alignstate;
alignstate:=1000000;OKtointerrupt:=false;
if(last>first+1)and(buffer[first+1]>=48)and(buffer[first+1]<=57)then c:=
c*10+buffer[first+1]-48*11 else c:=c-48;while c>0 do begin gettoken;
decr(c);end;curtok:=s1;curcmd:=s2;curchr:=s3;alignstate:=s4;
OKtointerrupt:=true;begin helpptr:=2;helpline[1]:=279;helpline[0]:=280;
end;showcontext;goto 22;end{:88};ifdef('TEXMF_DEBUG')68:begin debughelp;
goto 22;end;
endif('TEXMF_DEBUG')69:if baseptr>0 then if inputstack[baseptr].
namefield>=256 then begin editnamestart:=strstart[inputstack[baseptr].
namefield];
editnamelength:=strstart[inputstack[baseptr].namefield+1]-strstart[
inputstack[baseptr].namefield];editline:=line;jumpout;end;
72:{89:}begin if useerrhelp then begin giveerrhelp;useerrhelp:=false;
end else begin if helpptr=0 then begin helpptr:=2;helpline[1]:=281;
helpline[0]:=282;end;repeat decr(helpptr);print(helpline[helpptr]);
println;until helpptr=0;end;begin helpptr:=4;helpline[3]:=283;
helpline[2]:=282;helpline[1]:=284;helpline[0]:=285;end;goto 22;end{:89};
73:{87:}begin beginfilereading;
if last>first+1 then begin curinput.locfield:=first+1;buffer[first]:=32;
end else begin begin;print(278);terminput;end;curinput.locfield:=first;
end;first:=last;curinput.limitfield:=last-1;goto 10;end{:87};
81,82,83:{86:}begin errorcount:=0;interaction:=0+c-81;print(273);
case c of 81:begin printesc(274);decr(selector);end;82:printesc(275);
83:printesc(276);end;print(277);println;fflush(stdout);goto 10;end{:86};
88:begin interaction:=2;jumpout;end;others:end;{85:}begin print(267);
printnl(268);printnl(269);
if baseptr>0 then if inputstack[baseptr].namefield>=256 then print(270);
if deletionsallowed then printnl(271);printnl(272);end{:85}{:84};
end{:83};incr(errorcount);if errorcount=100 then begin printnl(265);
history:=3;jumpout;end;{90:}if interaction>0 then decr(selector);
if useerrhelp then begin println;giveerrhelp;
end else while helpptr>0 do begin decr(helpptr);
printnl(helpline[helpptr]);end;println;
if interaction>0 then incr(selector);println{:90};10:end;
{:82}{93:}noreturn procedure fatalerror(s:strnumber);
begin normalizeselector;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(287);
end;begin helpptr:=1;helpline[0]:=s;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
{:93}{94:}noreturn procedure overflow(s:strnumber;n:integer);
begin normalizeselector;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(288);
end;print(s);printchar(61);printint(n);printchar(93);begin helpptr:=2;
helpline[1]:=289;helpline[0]:=290;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
{:94}{95:}noreturn procedure confusion(s:strnumber);
begin normalizeselector;
if history<2 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(291);
end;print(s);printchar(41);begin helpptr:=1;helpline[0]:=292;end;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(293);
end;begin helpptr:=2;helpline[1]:=294;helpline[0]:=295;end;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
{:95}{:4}{31:}{[35:]begin curinput.locfield:=first;
curinput.limitfield:=last-1;overflow(258,bufsize);end[:35]}
{:31}{37:}function initterminal:boolean;label 10;begin topenin;
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
{:37}{43:}function makestring:strnumber;
begin if strptr=maxstrings then overflow(260,maxstrings-initstrptr);
incr(strptr);strstart[strptr]:=poolptr;makestring:=strptr-1;end;
{:43}{45:}function streqbuf(s:strnumber;k:integer):boolean;label 45;
var j:poolpointer;result:boolean;begin j:=strstart[s];
while j<strstart[s+1]do begin if strpool[j]<>buffer[k]then begin result
:=false;goto 45;end;incr(j);incr(k);end;result:=true;
45:streqbuf:=result;end;
{:45}{46:}function streqstr(s,t:strnumber):boolean;label 45;
var j,k:poolpointer;result:boolean;begin result:=false;
if(strstart[s+1]-strstart[s])<>(strstart[t+1]-strstart[t])then goto 45;
j:=strstart[s];k:=strstart[t];
while j<strstart[s+1]do begin if strpool[j]<>strpool[k]then goto 45;
incr(j);incr(k);end;result:=true;45:streqstr:=result;end;
{:46}{47:}{1876:}function searchstring(search:strnumber):strnumber;
label 40;var result:strnumber;s:strnumber;len:integer;begin result:=0;
len:=(strstart[search+1]-strstart[search]);
if len=0 then begin result:=345;goto 40;end else begin s:=search-1;
while s>255 do begin if(strstart[s+1]-strstart[s])=len then if streqstr(
s,search)then begin result:=s;goto 40;end;decr(s);end;end;
40:searchstring:=result;end;
{:1876}{1877:}function slowmakestring:strnumber;label 10;
var s:strnumber;t:strnumber;begin t:=makestring;s:=searchstring(t);
if s>0 then begin begin decr(strptr);poolptr:=strstart[strptr];end;
slowmakestring:=s;goto 10;end;slowmakestring:=t;10:end;
{:1877}ifdef('INITEX')function getstringsstarted:boolean;label 30,10;
var k,l:0..255;g:strnumber;begin poolptr:=0;strptr:=0;strstart[0]:=0;
{48:}for k:=0 to 255 do begin if({49:}(k<32)or(k>126){:49})then begin
begin strpool[poolptr]:=94;incr(poolptr);end;begin strpool[poolptr]:=94;
incr(poolptr);end;if k<64 then begin strpool[poolptr]:=k+64;
incr(poolptr);end else if k<128 then begin strpool[poolptr]:=k-64;
incr(poolptr);end else begin l:=k div 16;
if l<10 then begin strpool[poolptr]:=l+48;incr(poolptr);
end else begin strpool[poolptr]:=l+87;incr(poolptr);end;l:=k mod 16;
if l<10 then begin strpool[poolptr]:=l+48;incr(poolptr);
end else begin strpool[poolptr]:=l+87;incr(poolptr);end;end;
end else begin strpool[poolptr]:=k;incr(poolptr);end;g:=makestring;
end{:48};{51:}g:=loadpoolstrings((poolsize-stringvacancies));
if g=0 then begin;writeln(stdout,'! You have to increase POOLSIZE.');
getstringsstarted:=false;goto 10;end;getstringsstarted:=true;{:51};
10:end;endif('INITEX'){:47}{66:}procedure printtwo(n:integer);
begin n:=abs(n)mod 100;printchar(48+(n div 10));
printchar(48+(n mod 10));end;{:66}{67:}procedure printhex(n:integer);
var k:0..22;begin k:=0;printchar(34);repeat dig[k]:=n mod 16;
n:=n div 16;incr(k);until n=0;printthedigs(k);end;
{:67}{69:}procedure printromanint(n:integer);label 10;
var j,k:poolpointer;u,v:nonnegativeinteger;begin j:=strstart[262];
v:=1000;while true do begin while n>=v do begin printchar(strpool[j]);
n:=n-v;end;if n<=0 then goto 10;k:=j+2;u:=v div(strpool[k-1]-48);
if strpool[k-1]=50 then begin k:=k+2;u:=u div(strpool[k-1]-48);end;
if n+u>=v then begin printchar(strpool[k]);n:=n+u;end else begin j:=j+2;
v:=v div(strpool[j-1]-48);end;end;10:end;
{:69}{70:}procedure printcurrentstring;var j:poolpointer;
begin j:=strstart[strptr];
while j<poolptr do begin printchar(strpool[j]);incr(j);end;end;
{:70}{71:}procedure terminput;var k:0..bufsize;begin fflush(stdout);
if not inputln(stdin,true)then begin curinput.limitfield:=0;
fatalerror(263);end;termoffset:=0;decr(selector);k:=first;
while k<last do begin printbuffer(k)end;println;incr(selector);end;
{:71}{91:}procedure interror(n:integer);begin print(286);printint(n);
printchar(41);error;end;{:91}{92:}procedure normalizeselector;
begin if logopened then selector:=19 else selector:=17;
if jobname=0 then openlogfile;if interaction=0 then decr(selector);end;
{:92}{98:}procedure pauseforinstructions;
begin if OKtointerrupt then begin interaction:=3;
if(selector=18)or(selector=16)then incr(selector);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(296);
end;begin helpptr:=3;helpline[2]:=297;helpline[1]:=298;helpline[0]:=299;
end;deletionsallowed:=false;error;deletionsallowed:=true;interrupt:=0;
end;end;{:98}{100:}function half(x:integer):integer;
begin if odd(x)then half:=(x+1)div 2 else half:=x div 2;end;
{:100}{102:}function rounddecimals(k:smallnumber):scaled;var a:integer;
begin a:=0;while k>0 do begin decr(k);a:=(a+dig[k]*131072)div 10;end;
rounddecimals:=(a+1)div 2;end;
{:102}{103:}procedure printscaled(s:scaled);var delta:scaled;
begin if s<0 then begin printchar(45);s:=-s;end;printint(s div 65536);
printchar(46);s:=10*(s mod 65536)+5;delta:=10;
repeat if delta>65536 then s:=s-17232;printchar(48+(s div 65536));
s:=10*(s mod 65536);delta:=delta*10;until s<=delta;end;
{:103}{105:}function multandadd(n:integer;x,y,maxanswer:scaled):scaled;
begin if n<0 then begin x:=-x;n:=-n;end;
if n=0 then multandadd:=y else if((x<=(maxanswer-y)div n)and(-x<=(
maxanswer+y)div n))then multandadd:=n*x+y else begin aritherror:=true;
multandadd:=0;end;end;{:105}{106:}function xovern(x:scaled;
n:integer):scaled;var negative:boolean;begin negative:=false;
if n=0 then begin aritherror:=true;xovern:=0;texremainder:=x;
end else begin if n<0 then begin x:=-x;n:=-n;negative:=true;end;
if x>=0 then begin xovern:=x div n;texremainder:=x mod n;
end else begin xovern:=-((-x)div n);texremainder:=-((-x)mod n);end;end;
if negative then texremainder:=-texremainder;end;
{:106}{107:}function xnoverd(x:scaled;n,d:integer):scaled;
var positive:boolean;t,u,v:nonnegativeinteger;
begin if x>=0 then positive:=true else begin x:=-x;positive:=false;end;
t:=(x mod 32768)*n;u:=(x div 32768)*n+(t div 32768);
v:=(u mod d)*32768+(t mod 32768);
if u div d>=32768 then aritherror:=true else u:=32768*(u div d)+(v div d
);if positive then begin xnoverd:=u;texremainder:=v mod d;
end else begin xnoverd:=-u;texremainder:=-(v mod d);end;end;
{:107}{108:}function badness(t,s:scaled):halfword;var r:integer;
begin if t=0 then badness:=0 else if s<=0 then badness:=10000 else begin
if t<=7230584 then r:=(t*297)div s else if s>=1663497 then r:=t div(s
div 297)else r:=t;
if r>1290 then badness:=10000 else badness:=(r*r*r+131072)div 262144;
end;end;{:108}{112:}function makefrac(p,q:integer):integer;
var f:integer;n:integer;negative:boolean;becareful:integer;
begin if p>=0 then negative:=false else begin p:=-p;negative:=true;end;
if q<=0 then begin ifdef('TEXMF_DEBUG')if q=0 then confusion(47);
endif('TEXMF_DEBUG')q:=-q;negative:=not negative;end;n:=p div q;
p:=p mod q;if n>=8 then begin aritherror:=true;
if negative then makefrac:=-2147483647 else makefrac:=2147483647;
end else begin n:=(n-1)*268435456;{113:}f:=1;repeat becareful:=p-q;
p:=becareful+p;if p>=0 then f:=f+f+1 else begin f:=f+f;p:=p+q;end;
until f>=268435456;becareful:=p-q;if becareful+p>=0 then incr(f){:113};
if negative then makefrac:=-(f+n)else makefrac:=f+n;end;end;
{:112}{114:}function takefrac(q:integer;f:integer):integer;
var p:integer;negative:boolean;n:integer;becareful:integer;
begin{115:}if f>=0 then negative:=false else begin f:=-f;negative:=true;
end;if q<0 then begin q:=-q;negative:=not negative;end;{:115};
if f<268435456 then n:=0 else begin n:=f div 268435456;
f:=f mod 268435456;
if q<=2147483647 div n then n:=n*q else begin aritherror:=true;
n:=2147483647;end;end;f:=f+268435456;{116:}p:=134217728;
if q<1073741824 then repeat if odd(f)then p:=(p+q)div 2 else p:=(p)div 2
;f:=(f)div 2;
until f=1 else repeat if odd(f)then p:=p+(q-p)div 2 else p:=(p)div 2;
f:=(f)div 2;until f=1{:116};becareful:=n-2147483647;
if becareful+p>0 then begin aritherror:=true;n:=2147483647-p;end;
if negative then takefrac:=-(n+p)else takefrac:=n+p;end;
{:114}{119:}function mlog(x:integer):integer;var y,z:integer;k:integer;
begin if x<=0 then{121:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(300);
end;printscaled(x);print(301);begin helpptr:=2;helpline[1]:=302;
helpline[0]:=303;end;error;mlog:=0;end{:121}else begin y:=1302456860;
z:=6581195;while x<1073741824 do begin x:=x+x;y:=y-93032639;z:=z-48782;
end;y:=y+(z div 65536);k:=2;
while x>1073741828 do{120:}begin z:=((x-1)div twotothe[k])+1;
while x<1073741824+z do begin z:=(z+1)div 2;k:=k+1;end;y:=y+speclog[k];
x:=x-z;end{:120};mlog:=y div 8;end;end;
{:119}{122:}function abvscd(a,b,c,d:integer):integer;label 10;
var q,r:integer;begin{123:}if a<0 then begin a:=-a;b:=-b;end;
if c<0 then begin c:=-c;d:=-d;end;
if d<=0 then begin if b>=0 then if((a=0)or(b=0))and((c=0)or(d=0))then
begin abvscd:=0;goto 10;end else begin abvscd:=1;goto 10;end;
if d=0 then if a=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=-1;goto 10;end;q:=a;a:=c;c:=q;q:=-b;b:=-d;d:=q;
end else if b<=0 then begin if b<0 then if a>0 then begin abvscd:=-1;
goto 10;end;if c=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=-1;goto 10;end;end{:123};
while true do begin q:=a div d;r:=c div b;
if q<>r then if q>r then begin abvscd:=1;goto 10;
end else begin abvscd:=-1;goto 10;end;q:=a mod d;r:=c mod b;
if r=0 then if q=0 then begin abvscd:=0;goto 10;
end else begin abvscd:=1;goto 10;end;if q=0 then begin abvscd:=-1;
goto 10;end;a:=b;b:=q;c:=d;d:=r;end;10:end;
{:122}{124:}procedure newrandoms;var k:0..54;x:integer;
begin for k:=0 to 23 do begin x:=randoms[k]-randoms[k+31];
if x<0 then x:=x+268435456;randoms[k]:=x;end;
for k:=24 to 54 do begin x:=randoms[k]-randoms[k-24];
if x<0 then x:=x+268435456;randoms[k]:=x;end;jrandom:=54;end;
{:124}{125:}procedure initrandoms(seed:integer);var j,jj,k:integer;
i:0..54;begin j:=abs(seed);while j>=268435456 do j:=(j)div 2;k:=1;
for i:=0 to 54 do begin jj:=k;k:=j-k;j:=jj;if k<0 then k:=k+268435456;
randoms[(i*21)mod 55]:=j;end;newrandoms;newrandoms;newrandoms;end;
{:125}{126:}function unifrand(x:integer):integer;var y:integer;
begin if jrandom=0 then newrandoms else decr(jrandom);
y:=takefrac(abs(x),randoms[jrandom]);
if y=abs(x)then unifrand:=0 else if x>0 then unifrand:=y else unifrand:=
-y;end;{:126}{127:}function normrand:integer;var x,u,l:integer;
begin repeat repeat if jrandom=0 then newrandoms else decr(jrandom);
x:=takefrac(112429,randoms[jrandom]-134217728);
if jrandom=0 then newrandoms else decr(jrandom);u:=randoms[jrandom];
until abs(x)<u;x:=makefrac(x,u);l:=139548960-mlog(u);
until abvscd(1024,l,x,x)>=0;normrand:=x;end;
{:127}{132:}ifdef('TEXMF_DEBUG')procedure printword(w:memoryword);
begin printint(w.int);printchar(32);printscaled(w.int);printchar(32);
printscaled(round(65536*w.gr));println;printint(w.hh.lh);printchar(61);
printint(w.hh.b0);printchar(58);printint(w.hh.b1);printchar(59);
printint(w.hh.rh);printchar(32);printint(w.qqqq.b0);printchar(58);
printint(w.qqqq.b1);printchar(58);printint(w.qqqq.b2);printchar(58);
printint(w.qqqq.b3);end;
endif('TEXMF_DEBUG'){:132}{137:}{314:}procedure showtokenlist(p,q:
integer;l:integer);label 10;var m,c:integer;matchchr:ASCIIcode;
n:ASCIIcode;begin matchchr:=35;n:=48;tally:=0;
while(p<>-268435455)and(tally<l)do begin if p=q then{342:}begin
firstcount:=tally;trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end{:342};
{315:}if(p<himemmin)or(p>memend)then begin printesc(314);goto 10;end;
if mem[p].hh.lh>=4095 then printcs(mem[p].hh.lh-4095)else begin m:=mem[p
].hh.lh div 256;c:=mem[p].hh.lh mod 256;
if mem[p].hh.lh<0 then printesc(647)else{316:}case m of 1,2,3,4,7,8,10,
11,12:print(c);6:begin print(c);print(c);end;5:begin print(matchchr);
if c<=9 then printchar(c+48)else begin printchar(33);goto 10;end;end;
13:begin matchchr:=c;print(c);incr(n);printchar(n);if n>57 then goto 10;
end;14:if c=0 then print(648);others:printesc(647)end{:316};end{:315};
p:=mem[p].hh.rh;end;if p<>-268435455 then printesc(429);10:end;
{:314}{328:}procedure runaway;var p:halfword;
begin if scannerstatus>1 then begin case scannerstatus of 2:begin
printnl(662);p:=defref;end;3:begin printnl(663);p:=memtop-3;end;
4:begin printnl(664);p:=memtop-4;end;5:begin printnl(665);p:=defref;end;
end;printchar(63);println;
showtokenlist(mem[p].hh.rh,-268435455,errorline-10);end;end;
{:328}{:137}{138:}function getavail:halfword;var p:halfword;
begin p:=avail;
if p<>-268435455 then avail:=mem[avail].hh.rh else if memend<memmax then
begin incr(memend);p:=memend;end else begin decr(himemmin);p:=himemmin;
if himemmin<=lomemmax then begin runaway;overflow(304,memmax+1-memmin);
end;end;mem[p].hh.rh:=-268435455;ifdef('STAT')incr(dynused);
endif('STAT')getavail:=p;end;
{:138}{141:}procedure flushlist(p:halfword);var q,r:halfword;
begin if p<>-268435455 then begin r:=p;repeat q:=r;r:=mem[r].hh.rh;
ifdef('STAT')decr(dynused);endif('STAT')until r=-268435455;
mem[q].hh.rh:=avail;avail:=p;end;end;
{:141}{143:}function getnode(s:integer):halfword;label 40,10,20;
var p:halfword;q:halfword;r:integer;t:integer;begin 20:p:=rover;
repeat{145:}q:=p+mem[p].hh.lh;
while(mem[q].hh.rh=268435455)do begin t:=mem[q+1].hh.rh;
if q=rover then rover:=t;mem[t+1].hh.lh:=mem[q+1].hh.lh;
mem[mem[q+1].hh.lh+1].hh.rh:=t;q:=q+mem[q].hh.lh;end;r:=q-s;
if r>p+1 then{146:}begin mem[p].hh.lh:=r-p;rover:=p;goto 40;end{:146};
if r=p then if mem[p+1].hh.rh<>p then{147:}begin rover:=mem[p+1].hh.rh;
t:=mem[p+1].hh.lh;mem[rover+1].hh.lh:=t;mem[t+1].hh.rh:=rover;goto 40;
end{:147};mem[p].hh.lh:=q-p{:145};p:=mem[p+1].hh.rh;until p=rover;
if s=1073741824 then begin getnode:=268435455;goto 10;end;
if lomemmax+2<himemmin then if lomemmax+2<=membot+268435455 then{144:}
begin if himemmin-lomemmax>=1998 then t:=lomemmax+1000 else t:=lomemmax
+1+(himemmin-lomemmax)div 2;p:=mem[rover+1].hh.lh;q:=lomemmax;
mem[p+1].hh.rh:=q;mem[rover+1].hh.lh:=q;
if t>membot+268435455 then t:=membot+268435455;mem[q+1].hh.rh:=rover;
mem[q+1].hh.lh:=p;mem[q].hh.rh:=268435455;mem[q].hh.lh:=t-lomemmax;
lomemmax:=t;mem[lomemmax].hh.rh:=-268435455;
mem[lomemmax].hh.lh:=-268435455;rover:=q;goto 20;end{:144};
overflow(304,memmax+1-memmin);40:mem[r].hh.rh:=-268435455;
ifdef('STAT')varused:=varused+s;
endif('STAT'){1916:}if s>=4 then begin mem[r+s-2].int:=curinput.
synctextagfield;mem[r+s-1].int:=line;end;{:1916};getnode:=r;10:end;
{:143}{148:}procedure freenode(p:halfword;s:halfword);var q:halfword;
begin mem[p].hh.lh:=s;mem[p].hh.rh:=268435455;q:=mem[rover+1].hh.lh;
mem[p+1].hh.lh:=q;mem[p+1].hh.rh:=rover;mem[rover+1].hh.lh:=p;
mem[q+1].hh.rh:=p;ifdef('STAT')varused:=varused-s;endif('STAT')end;
{:148}{149:}ifdef('INITEX')procedure sortavail;var p,q,r:halfword;
oldrover:halfword;begin p:=getnode(1073741824);p:=mem[rover+1].hh.rh;
mem[rover+1].hh.rh:=268435455;oldrover:=rover;
while p<>oldrover do{150:}if p<rover then begin q:=p;p:=mem[q+1].hh.rh;
mem[q+1].hh.rh:=rover;rover:=q;end else begin q:=rover;
while mem[q+1].hh.rh<p do q:=mem[q+1].hh.rh;r:=mem[p+1].hh.rh;
mem[p+1].hh.rh:=mem[q+1].hh.rh;mem[q+1].hh.rh:=p;p:=r;end{:150};
p:=rover;
while mem[p+1].hh.rh<>268435455 do begin mem[mem[p+1].hh.rh+1].hh.lh:=p;
p:=mem[p+1].hh.rh;end;mem[p+1].hh.rh:=rover;mem[rover+1].hh.lh:=p;end;
endif('INITEX'){:149}{154:}function newnullbox:halfword;var p:halfword;
begin p:=getnode(9);mem[p].hh.b0:=0;mem[p].hh.b1:=0;mem[p+1].int:=0;
mem[p+2].int:=0;mem[p+3].int:=0;mem[p+4].int:=0;
mem[p+5].hh.rh:=-268435455;mem[p+5].hh.b0:=0;mem[p+5].hh.b1:=0;
mem[p+6].gr:=0.0;newnullbox:=p;end;
{:154}{157:}function newrule:halfword;var p:halfword;
begin p:=getnode(6);mem[p].hh.b0:=2;mem[p].hh.b1:=0;
mem[p+1].int:=-1073741824;mem[p+2].int:=-1073741824;
mem[p+3].int:=-1073741824;newrule:=p;end;
{:157}{162:}function newligature(f:internalfontnumber;c:quarterword;
q:halfword):halfword;var p:halfword;begin p:=getnode(2);mem[p].hh.b0:=6;
mem[p+1].hh.b0:=f;mem[p+1].hh.b1:=c;mem[p+1].hh.rh:=q;mem[p].hh.b1:=0;
newligature:=p;end;function newligitem(c:quarterword):halfword;
var p:halfword;begin p:=getnode(2);mem[p].hh.b1:=c;
mem[p+1].hh.rh:=-268435455;newligitem:=p;end;
{:162}{163:}function newdisc:halfword;var p:halfword;
begin p:=getnode(2);mem[p].hh.b0:=7;mem[p].hh.b1:=0;
mem[p+1].hh.lh:=-268435455;mem[p+1].hh.rh:=-268435455;newdisc:=p;end;
{:163}{165:}function newmath(w:scaled;s:smallnumber):halfword;
var p:halfword;begin p:=getnode(4);mem[p].hh.b0:=9;mem[p].hh.b1:=s;
mem[p+1].int:=w;newmath:=p;end;
{:165}{169:}function newspec(p:halfword):halfword;var q:halfword;
begin q:=getnode(4);mem[q]:=mem[p];mem[q].hh.rh:=-268435455;
mem[q+1].int:=mem[p+1].int;mem[q+2].int:=mem[p+2].int;
mem[q+3].int:=mem[p+3].int;newspec:=q;end;
{:169}{170:}function newparamglue(n:smallnumber):halfword;
var p:halfword;q:halfword;begin p:=getnode(4);mem[p].hh.b0:=10;
mem[p].hh.b1:=n+1;mem[p+1].hh.rh:=-268435455;
q:={242:}eqtb[26628+n].hh.rh{:242};mem[p+1].hh.lh:=q;incr(mem[q].hh.rh);
newparamglue:=p;end;{:170}{171:}function newglue(q:halfword):halfword;
var p:halfword;begin p:=getnode(4);mem[p].hh.b0:=10;mem[p].hh.b1:=0;
mem[p+1].hh.rh:=-268435455;mem[p+1].hh.lh:=q;incr(mem[q].hh.rh);
newglue:=p;end;
{:171}{172:}function newskipparam(n:smallnumber):halfword;
var p:halfword;begin tempptr:=newspec({242:}eqtb[26628+n].hh.rh{:242});
p:=newglue(tempptr);mem[tempptr].hh.rh:=-268435455;mem[p].hh.b1:=n+1;
newskipparam:=p;end;{:172}{174:}function newkern(w:scaled):halfword;
var p:halfword;begin p:=getnode(4);mem[p].hh.b0:=11;mem[p].hh.b1:=0;
mem[p+1].int:=w;newkern:=p;end;
{:174}{176:}function newpenalty(m:integer):halfword;var p:halfword;
begin p:=getnode(4);mem[p].hh.b0:=12;mem[p].hh.b1:=0;mem[p+1].int:=m;
newpenalty:=p;end;
{:176}{185:}ifdef('TEXMF_DEBUG')procedure checkmem(printlocs:boolean);
label 31,32;var p,q:halfword;clobbered:boolean;
begin for p:=memmin to lomemmax do freearr[p]:=false;
for p:=himemmin to memend do freearr[p]:=false;{186:}p:=avail;
q:=-268435455;clobbered:=false;
while p<>-268435455 do begin if(p>memend)or(p<himemmin)then clobbered:=
true else if freearr[p]then clobbered:=true;
if clobbered then begin printnl(305);printint(q);goto 31;end;
freearr[p]:=true;q:=p;p:=mem[q].hh.rh;end;31:{:186};{187:}p:=rover;
q:=-268435455;clobbered:=false;
repeat if(p>=lomemmax)or(p<memmin)then clobbered:=true else if(mem[p+1].
hh.rh>=lomemmax)or(mem[p+1].hh.rh<memmin)then clobbered:=true else if
not((mem[p].hh.rh=268435455))or(mem[p].hh.lh<2)or(p+mem[p].hh.lh>
lomemmax)or(mem[mem[p+1].hh.rh+1].hh.lh<>p)then clobbered:=true;
if clobbered then begin printnl(306);printint(q);goto 32;end;
for q:=p to p+mem[p].hh.lh-1 do begin if freearr[q]then begin printnl(
307);printint(q);goto 32;end;freearr[q]:=true;end;q:=p;
p:=mem[p+1].hh.rh;until p=rover;32:{:187};{188:}p:=memmin;
while p<=lomemmax do begin if(mem[p].hh.rh=268435455)then begin printnl(
308);printint(p);end;while(p<=lomemmax)and not freearr[p]do incr(p);
while(p<=lomemmax)and freearr[p]do incr(p);end{:188};
if printlocs then{189:}begin printnl(309);
for p:=memmin to lomemmax do if not freearr[p]and((p>waslomax)or wasfree
[p])then begin printchar(32);printint(p);end;
for p:=himemmin to memend do if not freearr[p]and((p<washimin)or(p>
wasmemend)or wasfree[p])then begin printchar(32);printint(p);end;
end{:189};for p:=memmin to lomemmax do wasfree[p]:=freearr[p];
for p:=himemmin to memend do wasfree[p]:=freearr[p];wasmemend:=memend;
waslomax:=lomemmax;washimin:=himemmin;end;
endif('TEXMF_DEBUG'){:185}{190:}ifdef('TEXMF_DEBUG')procedure searchmem(
p:halfword);var q:integer;
begin for q:=memmin to lomemmax do begin if mem[q].hh.rh=p then begin
printnl(310);printint(q);printchar(41);end;
if mem[q].hh.lh=p then begin printnl(311);printint(q);printchar(41);end;
end;
for q:=himemmin to memend do begin if mem[q].hh.rh=p then begin printnl(
310);printint(q);printchar(41);end;
if mem[q].hh.lh=p then begin printnl(311);printint(q);printchar(41);end;
end;
{273:}for q:=1 to 27688 do begin if eqtb[q].hh.rh=p then begin printnl(
584);printint(q);printchar(41);end;end{:273};
{307:}if saveptr>0 then for q:=0 to saveptr-1 do begin if savestack[q].
hh.rh=p then begin printnl(639);printint(q);printchar(41);end;end{:307};
{1110:}for q:=0 to hyphsize do begin if hyphlist[q]=p then begin printnl
(1367);printint(q);printchar(41);end;end{:1110};end;
endif('TEXMF_DEBUG'){686:}procedure pdferror(t,p:strnumber);
begin normalizeselector;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1038);
end;if t<>0 then begin print(286);print(t);print(41);end;print(660);
print(p);begin if interaction=3 then interaction:=2;
if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end;
procedure pdfwarning(t,p:strnumber;prependnl,appendnl:boolean);
begin if interaction=3 then;if prependnl then println;print(1039);
if t<>0 then begin print(286);print(t);print(41);end;print(660);
print(p);if appendnl then println;if history=0 then history:=1;end;
procedure pdfosgetosbuf(s:integer);var a:integer;
begin if s>suppdfosbufsize-pdfptr then overflow(1040,pdfosbufsize);
if pdfptr+s>pdfosbufsize then begin a:=0.2*pdfosbufsize;
if pdfptr+s>pdfosbufsize+a then pdfosbufsize:=pdfptr+s else if
pdfosbufsize<suppdfosbufsize-a then pdfosbufsize:=pdfosbufsize+a else
pdfosbufsize:=suppdfosbufsize;
pdfosbuf:=xreallocarray(pdfosbuf,eightbits,pdfosbufsize);
pdfbuf:=pdfosbuf;pdfbufsize:=pdfosbufsize;end;end;
procedure removelastspace;
begin if(pdfptr>0)and(pdfbuf[pdfptr-1]=32)then decr(pdfptr);end;
procedure pdfprintoctal(n:integer);var k:0..23;begin k:=0;
repeat dig[k]:=n mod 8;n:=n div 8;incr(k);until n=0;
if k=1 then begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=48;incr(pdfptr);end;end;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=48;incr(pdfptr);end;end;end;
if k=2 then begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=48;incr(pdfptr);end;end;
while k>0 do begin decr(k);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=48+dig[k];incr(pdfptr);end;end;end;end;
procedure pdfprintchar(f:internalfontnumber;c:integer);
begin pdfmarkchar(f,c);
if(c<=32)or(c=92)or(c=40)or(c=41)or(c>127)then begin begin begin if
pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)else if not
pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)else if not
pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=92;incr(pdfptr);end;end;pdfprintoctal(c);
end else begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=c;incr(pdfptr);end;end;end;
procedure pdfprint(s:strnumber);var j:poolpointer;c:integer;
begin j:=strstart[s];while j<strstart[s+1]do begin c:=strpool[j];
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=c;incr(pdfptr);end;end;incr(j);end;end;
function strinstr(s,r:strnumber;i:integer):boolean;label 45;
var j,k:poolpointer;begin strinstr:=false;
if(strstart[s+1]-strstart[s])<i+(strstart[r+1]-strstart[r])then goto 10;
j:=i+strstart[s];k:=strstart[r];
while(j<strstart[s+1])and(k<strstart[r+1])do begin if strpool[j]<>
strpool[k]then goto 10;incr(j);incr(k);end;strinstr:=true;end;
procedure pdfprintint(n:longinteger);var k:integer;m:longinteger;
begin k:=0;
if n<0 then begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=45;incr(pdfptr);end;end;
if n>-100000000 then n:=-n else begin m:=-1-n;n:=m div 10;
m:=(m mod 10)+1;k:=1;if m<10 then dig[0]:=m else begin dig[0]:=0;
incr(n);end;end;end;repeat dig[k]:=n mod 10;n:=n div 10;incr(k);
until n=0;
begin if pdfosmode and(k+pdfptr>pdfbufsize)then pdfosgetosbuf(k)else if
not pdfosmode and(k>pdfbufsize)then overflow(1018,pdfopbufsize)else if
not pdfosmode and(k+pdfptr>pdfbufsize)then pdfflush;end;
while k>0 do begin decr(k);begin pdfbuf[pdfptr]:=48+dig[k];incr(pdfptr);
end;end;end;procedure pdfprinttwo(n:integer);begin n:=abs(n)mod 100;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=48+(n div 10);incr(pdfptr);end;end;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=48+(n mod 10);incr(pdfptr);end;end;end;
function tokenstostring(p:halfword):strnumber;
begin if selector=21 then pdferror(1041,1042);oldsetting:=selector;
selector:=21;showtokenlist(mem[p].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;lasttokensstring:=makestring;
tokenstostring:=lasttokensstring;end;
{:686}{689:}function dividescaled(s,m:scaled;dd:integer):scaled;
var q,r:scaled;sign,i:integer;begin sign:=1;
if s<0 then begin sign:=-sign;s:=-s;end;if m<0 then begin sign:=-sign;
m:=-m;end;
if m=0 then pdferror(1043,1044)else if m>=(2147483647 div 10)then
pdferror(1043,1045);q:=s div m;r:=s mod m;
for i:=1 to dd do begin q:=10*q+(10*r)div m;r:=(10*r)mod m;end;
if 2*r>=m then begin incr(q);r:=r-m;end;
scaledout:=sign*(s-(r div tenpow[dd]));dividescaled:=sign*q;end;
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
{:689}{698:}procedure appenddestname(s:strnumber;n:integer);
var a:integer;
begin if pdfdestnamesptr=supdestnamessize then overflow(1078,
destnamessize);
if pdfdestnamesptr=destnamessize then begin a:=0.2*destnamessize;
if destnamessize<supdestnamessize-a then destnamessize:=destnamessize+a
else destnamessize:=supdestnamessize;
destnames:=xreallocarray(destnames,destnameentry,destnamessize);end;
destnames[pdfdestnamesptr].objname:=s;
destnames[pdfdestnamesptr].objnum:=n;incr(pdfdestnamesptr);end;
procedure pdfcreateobj(t,i:integer);label 30;var a,p,q:integer;
begin if sysobjptr=supobjtabsize then overflow(1079,objtabsize);
if sysobjptr=objtabsize then begin a:=0.2*objtabsize;
if objtabsize<supobjtabsize-a then objtabsize:=objtabsize+a else
objtabsize:=supobjtabsize;
objtab:=xreallocarray(objtab,objentry,objtabsize);end;incr(sysobjptr);
objptr:=sysobjptr;objtab[objptr].int0:=i;objtab[objptr].int2:=-2;
objtab[objptr].int4:=0;avlputobj(objptr,t);
if t=1 then begin p:=headtab[t];
if(p=0)or(objtab[p].int0<i)then begin objtab[objptr].int1:=p;
headtab[t]:=objptr;
end else begin while p<>0 do begin if objtab[p].int0<i then goto 30;
q:=p;p:=objtab[p].int1;end;30:objtab[q].int1:=objptr;
objtab[objptr].int1:=p;end;
end else if t<>0 then begin objtab[objptr].int1:=headtab[t];
headtab[t]:=objptr;
if(t=5)and(i<0)then appenddestname(-objtab[objptr].int0,objptr);end;end;
function pdfnewobjnum:integer;begin pdfcreateobj(0,0);
pdfnewobjnum:=objptr;end;procedure pdfosswitch(pdfos:boolean);
begin if pdfos and pdfosenable then begin if not pdfosmode then begin
pdfopptr:=pdfptr;pdfptr:=pdfosptr;pdfbuf:=pdfosbuf;
pdfbufsize:=pdfosbufsize;pdfosmode:=true;end;
end else begin if pdfosmode then begin pdfosptr:=pdfptr;
pdfptr:=pdfopptr;pdfbuf:=pdfopbuf;pdfbufsize:=pdfopbufsize;
pdfosmode:=false;end;end;end;procedure pdfosprepareobj(i:integer;
pdfoslevel:integer);
begin pdfosswitch((pdfoslevel>0)and(fixedpdfobjcompresslevel>=pdfoslevel
));
if pdfosmode then begin if pdfoscurobjnum=0 then begin pdfoscurobjnum:=
pdfnewobjnum;decr(objptr);incr(pdfoscntr);pdfosobjidx:=0;pdfptr:=0;
end else incr(pdfosobjidx);objtab[i].int3:=pdfosobjidx;
objtab[i].int2:=pdfoscurobjnum;pdfosobjnum[pdfosobjidx]:=i;
pdfosobjoff[pdfosobjidx]:=pdfptr;
end else begin objtab[i].int2:=(pdfgone+pdfptr);objtab[i].int3:=-1;end;
end;procedure pdfbeginobj(i:integer;pdfoslevel:integer);
begin checkpdfversion;pdfosprepareobj(i,pdfoslevel);
if not pdfosmode then begin pdfprintint(i);begin pdfprint(1080);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
end else if eqtb[29343].int=0 then begin pdfprint(1081);pdfprintint(i);
begin pdfprint(1080);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;end;
procedure pdfnewobj(t,i:integer;pdfos:integer);begin pdfcreateobj(t,i);
pdfbeginobj(objptr,pdfos);end;procedure pdfendobj;
begin if pdfosmode then begin if pdfosobjidx=pdfosmaxobjs-1 then
pdfoswriteobjstream;end else begin pdfprint(1082);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
procedure pdfbegindict(i:integer;pdfoslevel:integer);
begin checkpdfversion;pdfosprepareobj(i,pdfoslevel);
if not pdfosmode then begin pdfprintint(i);begin pdfprint(1080);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
end else if eqtb[29343].int=0 then begin pdfprint(1081);pdfprintint(i);
begin pdfprint(1080);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
begin pdfprint(1083);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
procedure pdfnewdict(t,i:integer;pdfos:integer);begin pdfcreateobj(t,i);
pdfbegindict(objptr,pdfos);end;procedure pdfenddict;
begin if pdfosmode then begin begin pdfprint(1035);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if pdfosobjidx=pdfosmaxobjs-1 then pdfoswriteobjstream;
end else begin begin pdfprint(1035);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(1082);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;end;
{:698}{699:}procedure pdfoswriteobjstream;var i,j,p,q:halfword;
begin if pdfoscurobjnum=0 then goto 10;p:=pdfptr;i:=0;j:=0;
while i<=pdfosobjidx do begin pdfprintint(pdfosobjnum[i]);pdfprint(32);
pdfprintint(pdfosobjoff[i]);
if j=9 then begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;j:=0;
end else begin pdfprint(32);incr(j);end;incr(i);end;
pdfbuf[pdfptr-1]:=10;q:=pdfptr;pdfbegindict(pdfoscurobjnum,0);
begin pdfprint(1084);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfprint(1085);
begin pdfprintint(pdfosobjidx+1);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfprint(1086);
begin pdfprintint(q-p);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfbeginstream;
begin if pdfosmode and(q-p+pdfptr>pdfbufsize)then pdfosgetosbuf(q-p)else
if not pdfosmode and(q-p>pdfbufsize)then overflow(1018,pdfopbufsize)else
if not pdfosmode and(q-p+pdfptr>pdfbufsize)then pdfflush;end;i:=p;
while i<q do begin begin pdfbuf[pdfptr]:=pdfosbuf[i];incr(pdfptr);end;
incr(i);end;i:=0;while i<p do begin q:=i+pdfbufsize;if q>p then q:=p;
begin if pdfosmode and(q-i+pdfptr>pdfbufsize)then pdfosgetosbuf(q-i)else
if not pdfosmode and(q-i>pdfbufsize)then overflow(1018,pdfopbufsize)else
if not pdfosmode and(q-i+pdfptr>pdfbufsize)then pdfflush;end;
while i<q do begin begin pdfbuf[pdfptr]:=pdfosbuf[i];incr(pdfptr);end;
incr(i);end;end;pdfendstream;pdfoscurobjnum:=0;end;
{:699}{700:}function appendptr(p:halfword;i:integer):halfword;
var q:halfword;begin appendptr:=p;begin q:=avail;
if q=-268435455 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-268435455;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[q].hh.lh:=i;mem[q].hh.rh:=-268435455;
if p=-268435455 then begin appendptr:=q;goto 10;end;
while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;mem[p].hh.rh:=q;end;
function pdflookuplist(p:halfword;i:integer):halfword;
begin pdflookuplist:=-268435455;
while p<>-268435455 do begin if mem[p].hh.lh=i then begin pdflookuplist
:=p;goto 10;end;p:=mem[p].hh.rh;end;end;
{:700}{703:}procedure pdfcheckvfcurval;forward;
procedure pdfinitfontcurval;forward;procedure scanpdfexttoks;forward;
{:703}{1545:}function prevrightmost(s,e:halfword):halfword;
var p:halfword;begin prevrightmost:=-268435455;p:=s;
if p=-268435455 then goto 10;
while mem[p].hh.rh<>e do begin p:=mem[p].hh.rh;
if p=-268435455 then goto 10;end;prevrightmost:=p;end;
procedure pdfcheckobj(t,n:integer);var k:integer;begin k:=headtab[t];
while(k<>0)and(k<>n)do k:=objtab[k].int1;
if k=0 then pdferror(1792,1817);end;
{:1545}{1555:}function findobj(t,i:integer;byname:boolean):integer;
begin findobj:=avlfindobj(t,i,byname);end;
procedure flushstr(s:strnumber);
begin if(s=strptr-1)then begin decr(strptr);poolptr:=strstart[strptr];
end;end;function getobj(t,i:integer;byname:boolean):integer;
var r:integer;s:strnumber;
begin if byname>0 then begin s:=tokenstostring(i);r:=findobj(t,s,true);
end else begin s:=0;r:=findobj(t,i,false);end;
if r=0 then begin if byname>0 then begin pdfcreateobj(t,-s);s:=0;
end else pdfcreateobj(t,i);r:=objptr;
if(t=5)or(t=6)then objtab[r].int4:=-268435455;end;
if s<>0 then flushstr(s);getobj:=r;end;
function getmicrointerval:integer;var s,m:integer;
begin secondsandmicros(s,m);
if(s-epochseconds)>32767 then getmicrointerval:=2147483647 else if(
microseconds>m)then getmicrointerval:=((s-1-epochseconds)*65536)+(((m
+1000000-microseconds)/100)*65536)/10000 else getmicrointerval:=((s-
epochseconds)*65536)+(((m-microseconds)/100)*65536)/10000;end;
{:1555}{:190}{192:}procedure printfontidentifier(f:internalfontnumber);
begin if pdffontblink[f]=0 then printesc(hash[17626+f].rh)else printesc(
hash[17626+pdffontblink[f]].rh);
if eqtb[29362].int>0 then begin print(286);print(fontname[f]);
if fontsize[f]<>fontdsize[f]then begin print(64);
printscaled(fontsize[f]);print(312);end;print(41);
end else if pdffontexpandratio[f]<>0 then begin print(286);
if pdffontexpandratio[f]>0 then print(43);
printint(pdffontexpandratio[f]);print(41);end;end;
procedure shortdisplay(p:integer);var n:integer;
begin while p>memmin do begin if(p>=himemmin)then begin if p<=memend
then begin if mem[p].hh.b0<>fontinshortdisplay then begin if(mem[p].hh.
b0>fontmax)then printchar(42)else printfontidentifier(mem[p].hh.b0);
printchar(32);fontinshortdisplay:=mem[p].hh.b0;end;print(mem[p].hh.b1);
end;end else{193:}case mem[p].hh.b0 of 0,1,3,8,4,5,13:print(313);
2:printchar(124);10:if mem[p+1].hh.lh<>membot then printchar(32);
9:if mem[p].hh.b1>=4 then print(313)else printchar(36);
6:shortdisplay(mem[p+1].hh.rh);7:begin shortdisplay(mem[p+1].hh.lh);
shortdisplay(mem[p+1].hh.rh);n:=mem[p].hh.b1;
while n>0 do begin if mem[p].hh.rh<>-268435455 then p:=mem[p].hh.rh;
decr(n);end;end;others:end{:193};p:=mem[p].hh.rh;end;end;
{:192}{194:}procedure printfontandchar(p:integer);
begin if p>memend then printesc(314)else begin if(mem[p].hh.b0>fontmax)
then printchar(42)else printfontidentifier(mem[p].hh.b0);printchar(32);
print(mem[p].hh.b1);end;end;procedure printmark(p:integer);
begin printchar(123);
if(p<himemmin)or(p>memend)then printesc(314)else showtokenlist(mem[p].hh
.rh,-268435455,maxprintline-10);printchar(125);end;
procedure printruledimen(d:scaled);
begin if(d=-1073741824)then printchar(42)else printscaled(d);end;
{:194}{195:}procedure printglue(d:scaled;order:integer;s:strnumber);
begin printscaled(d);
if(order<0)or(order>3)then print(315)else if order>0 then begin print(
316);while order>1 do begin printchar(108);decr(order);end;
end else if s<>0 then print(s);end;
{:195}{196:}procedure printspec(p:integer;s:strnumber);
begin if(p<memmin)or(p>=lomemmax)then printchar(42)else begin
printscaled(mem[p+1].int);if s<>0 then print(s);
if mem[p+2].int<>0 then begin print(317);
printglue(mem[p+2].int,mem[p].hh.b0,s);end;
if mem[p+3].int<>0 then begin print(318);
printglue(mem[p+3].int,mem[p].hh.b1,s);end;end;end;
{:196}{197:}{867:}procedure printfamandchar(p:halfword);
begin printesc(485);printint(mem[p].hh.b0);printchar(32);
print(mem[p].hh.b1);end;procedure printdelimiter(p:halfword);
var a:integer;begin a:=mem[p].qqqq.b0*256+mem[p].qqqq.b1;
a:=a*4096+mem[p].qqqq.b2*256+mem[p].qqqq.b3;
if a<0 then printint(a)else printhex(a);end;
{:867}{868:}procedure showinfo;forward;
procedure printsubsidiarydata(p:halfword;c:ASCIIcode);
begin if(poolptr-strstart[strptr])>=depththreshold then begin if mem[p].
hh.rh<>0 then print(319);end else begin begin strpool[poolptr]:=c;
incr(poolptr);end;tempptr:=p;case mem[p].hh.rh of 1:begin println;
printcurrentstring;printfamandchar(p);end;2:showinfo;
3:if mem[p].hh.lh=-268435455 then begin println;printcurrentstring;
print(1282);end else showinfo;others:end;decr(poolptr);end;end;
{:868}{870:}procedure printstyle(c:integer);
begin case c div 2 of 0:printesc(1283);1:printesc(1284);
2:printesc(1285);3:printesc(1286);others:print(1287)end;end;
{:870}{243:}procedure printskipparam(n:integer);
begin case n of 0:printesc(394);1:printesc(395);2:printesc(396);
3:printesc(397);4:printesc(398);5:printesc(399);6:printesc(400);
7:printesc(401);8:printesc(402);9:printesc(403);10:printesc(404);
11:printesc(405);12:printesc(406);13:printesc(407);14:printesc(408);
15:printesc(409);16:printesc(410);17:printesc(411);others:print(412)end;
end;{:243}{:197}{200:}procedure shownodelist(p:integer);label 10;
var n:integer;g:real;
begin if(poolptr-strstart[strptr])>depththreshold then begin if p>
-268435455 then print(319);goto 10;end;n:=0;
while p>memmin do begin println;printcurrentstring;
if p>memend then begin print(320);goto 10;end;incr(n);
if n>breadthmax then begin print(321);goto 10;end;
{201:}if(p>=himemmin)then printfontandchar(p)else case mem[p].hh.b0 of 0
,1,13:{202:}begin if mem[p].hh.b0=0 then printesc(104)else if mem[p].hh.
b0=1 then printesc(118)else printesc(326);print(327);
printscaled(mem[p+3].int);printchar(43);printscaled(mem[p+2].int);
print(328);printscaled(mem[p+1].int);
if mem[p].hh.b0=13 then{203:}begin if mem[p].hh.b1<>0 then begin print(
286);printint(mem[p].hh.b1+1);print(330);end;
if mem[p+6].int<>0 then begin print(331);
printglue(mem[p+6].int,mem[p+5].hh.b1,0);end;
if mem[p+4].int<>0 then begin print(332);
printglue(mem[p+4].int,mem[p+5].hh.b0,0);end;
end{:203}else begin{204:}g:=mem[p+6].gr;
if(g<>0.0)and(mem[p+5].hh.b0<>0)then begin print(333);
if mem[p+5].hh.b0=2 then print(334);
if fabs(g)>20000.0 then begin if g>0.0 then printchar(62)else print(335)
;printglue(20000*65536,mem[p+5].hh.b1,0);
end else printglue(round(65536*g),mem[p+5].hh.b1,0);end{:204};
if mem[p+4].int<>0 then begin print(329);printscaled(mem[p+4].int);end;
if(eTeXmode=1)then{1704:}if(mem[p].hh.b0=0)and((mem[p].hh.b1)=2)then
print(2051){:1704};end;begin begin strpool[poolptr]:=46;incr(poolptr);
end;shownodelist(mem[p+5].hh.rh);decr(poolptr);end;end{:202};
2:{205:}begin printesc(336);printruledimen(mem[p+3].int);printchar(43);
printruledimen(mem[p+2].int);print(328);printruledimen(mem[p+1].int);
end{:205};3:{206:}begin printesc(337);printint(mem[p].hh.b1);print(338);
printscaled(mem[p+3].int);print(339);printspec(mem[p+4].hh.rh,0);
printchar(44);printscaled(mem[p+2].int);print(340);
printint(mem[p+1].int);begin begin strpool[poolptr]:=46;incr(poolptr);
end;shownodelist(mem[p+4].hh.lh);decr(poolptr);end;end{:206};
8:{1603:}case mem[p].hh.b1 of 0:begin printwritewhatsit(1744,p);
printchar(61);
printfilename(mem[p+1].hh.rh,mem[p+2].hh.lh,mem[p+2].hh.rh);end;
1:begin printwritewhatsit(687,p);printmark(mem[p+1].hh.rh);end;
2:printwritewhatsit(1745,p);3:begin printesc(1746);
if mem[p+1].hh.b0<>64 then begin printchar(60);
printint(mem[p+1].hh.b0-64);
if(mem[p+1].hh.b0-64=2)or(mem[p+1].hh.b0-64=3)then begin printchar(58);
printint(mem[p+1].hh.b1-64);end;printchar(62);end;
printmark(mem[p+1].hh.rh);end;4:begin printesc(1746);print(1905);
printmark(mem[p+1].hh.rh);end;5:begin printesc(1748);
printint(mem[p+1].hh.rh);print(1906);printint(mem[p+1].hh.b0);
printchar(44);printint(mem[p+1].hh.b1);printchar(41);end;
7,8:begin printesc(1749);if mem[p].hh.b1=8 then print(1905);
case mem[p+1].hh.lh of 0:;1:print(1014);2:print(1907);
others:confusion(1908)end;printmark(mem[p+1].hh.rh);end;
40:begin printesc(1909);printint(mem[p+1].hh.rh);
case mem[p+1].hh.lh of 0:print(1910);1:print(1911);2:print(1912);
3:print(1913);others:confusion(1145)end;
if mem[p+1].hh.lh<=1 then printmark(mem[p+2].hh.rh);end;
41:begin printesc(1750);printmark(mem[p+1].hh.rh);end;
42:begin printesc(1751);end;43:begin printesc(1752);end;
10:begin printesc(1754);
if pdfmem[objtab[mem[p+1].hh.lh].int4+1]>0 then begin if pdfmem[objtab[
mem[p+1].hh.lh].int4+2]<>-268435455 then begin print(1914);
printmark(pdfmem[objtab[mem[p+1].hh.lh].int4+2]);end;print(1915);end;
if pdfmem[objtab[mem[p+1].hh.lh].int4+3]>0 then print(1916);
printmark(pdfmem[objtab[mem[p+1].hh.lh].int4+0]);end;
12:begin printesc(1756);print(40);
printscaled(pdfmem[objtab[mem[p+4].hh.lh].int4+1]);printchar(43);
printscaled(pdfmem[objtab[mem[p+4].hh.lh].int4+2]);print(328);
printscaled(pdfmem[objtab[mem[p+4].hh.lh].int4+0]);end;
14:begin printesc(1758);print(40);
printscaled(pdfmem[objtab[mem[p+4].hh.lh].int4+1]);printchar(43);
printscaled(pdfmem[objtab[mem[p+4].hh.lh].int4+2]);print(328);
printscaled(pdfmem[objtab[mem[p+4].hh.lh].int4+0]);end;
15:begin printesc(1759);{1601:}print(40);printruledimen(mem[p+2].int);
printchar(43);printruledimen(mem[p+3].int);print(328);
printruledimen(mem[p+1].int){:1601};printmark(mem[p+5].hh.lh);end;
16:begin printesc(1760);{1601:}print(40);printruledimen(mem[p+2].int);
printchar(43);printruledimen(mem[p+3].int);print(328);
printruledimen(mem[p+1].int){:1601};
if mem[p+5].hh.lh<>-268435455 then begin print(1914);
printmark(mem[p+5].hh.lh);end;print(1917);
if mem[mem[p+5].hh.rh].hh.b0=3 then begin print(1918);
printmark(mem[mem[p+5].hh.rh+2].hh.lh);
end else begin if mem[mem[p+5].hh.rh+1].hh.lh<>-268435455 then begin
print(1916);printmark(mem[mem[p+5].hh.rh+1].hh.lh);end;
case mem[mem[p+5].hh.rh].hh.b0 of 1:begin if(mem[mem[p+5].hh.rh].hh.b1
mod 2)=1 then begin print(1919);printmark(mem[mem[p+5].hh.rh].hh.rh);
end else begin print(1920);printint(mem[mem[p+5].hh.rh].hh.rh)end;end;
0:begin print(1014);printint(mem[mem[p+5].hh.rh].hh.rh);
printmark(mem[mem[p+5].hh.rh+2].hh.lh);end;
2:begin if(mem[mem[p+5].hh.rh].hh.b1 mod 2)=1 then begin print(1921);
printmark(mem[mem[p+5].hh.rh].hh.rh);end else begin print(1922);
printint(mem[mem[p+5].hh.rh].hh.rh);end;end;others:pdferror(1923,1924);
end;end end;17:printesc(1761);19:begin printesc(1763);
if mem[p+6].hh.rh<>-268435455 then begin print(1925);
printint(mem[p+6].hh.rh);end;if mem[p+5].hh.b1>0 then begin print(1926);
printmark(mem[p+5].hh.rh);end else begin print(1927);
printint(mem[p+5].hh.rh);end;print(32);
case mem[p+5].hh.b0 of 0:begin print(1865);
if mem[p+6].hh.lh<>-268435455 then begin print(1928);
printint(mem[p+6].hh.lh);end;end;5:print(1867);6:print(1868);
4:print(1869);2:print(1870);3:print(1871);7:begin print(1872);
{1601:}print(40);printruledimen(mem[p+2].int);printchar(43);
printruledimen(mem[p+3].int);print(328);
printruledimen(mem[p+1].int){:1601};end;1:print(1873);
others:print(1929);end;end;
20,21:begin if mem[p].hh.b1=20 then printesc(1764)else printesc(1765);
print(40);printruledimen(mem[p+2].int);printchar(43);
printruledimen(mem[p+3].int);print(328);printruledimen(mem[p+1].int);
if mem[p+6].hh.lh<>-268435455 then begin print(1914);
printmark(mem[p+6].hh.lh);end;
if mem[p+5].hh.b1>0 then begin print(1926);printmark(mem[p+5].hh.rh);
end else begin print(1927);printint(mem[p+5].hh.rh);end;end;
22:printesc(1766);23:printesc(1767);36:printesc(1768);
37:begin printesc(1769);printchar(32);printspec(mem[p+1].hh.lh,0);
printchar(32);printspec(mem[p+2].int,0);end;38:begin printesc(1770);
printchar(32);printint(mem[p+1].int);end;45:printesc(1785);
46:printesc(1786);47:printesc(1787);48:printesc(1788);49:printesc(1789);
others:print(1930)end{:1603};
10:{207:}if mem[p].hh.b1>=100 then{208:}begin printesc(345);
if mem[p].hh.b1=101 then printchar(99)else if mem[p].hh.b1=102 then
printchar(120);print(346);printspec(mem[p+1].hh.lh,0);
begin begin strpool[poolptr]:=46;incr(poolptr);end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);end;
end{:208}else begin printesc(341);
if mem[p].hh.b1<>0 then begin printchar(40);
if mem[p].hh.b1<98 then printskipparam(mem[p].hh.b1-1)else if mem[p].hh.
b1=98 then printesc(342)else printesc(343);printchar(41);end;
if mem[p].hh.b1<>98 then begin printchar(32);
if mem[p].hh.b1<98 then printspec(mem[p+1].hh.lh,0)else printspec(mem[p
+1].hh.lh,344);end;end{:207};40:begin printesc(322);
printscaled(mem[p+1].int);
if mem[p].hh.b1=0 then print(323)else print(324);end;
11:{209:}if mem[p].hh.b1<>99 then begin printesc(322);
if mem[p].hh.b1<>0 then printchar(32);printscaled(mem[p+1].int);
if mem[p].hh.b1=2 then print(347);if mem[p].hh.b1=3 then print(348);
end else begin printesc(349);printscaled(mem[p+1].int);print(344);
end{:209};
9:{210:}if mem[p].hh.b1>1 then begin if odd(mem[p].hh.b1)then printesc(
350)else printesc(351);
if mem[p].hh.b1>8 then printchar(82)else if mem[p].hh.b1>4 then
printchar(76)else printchar(77);end else begin printesc(352);
if mem[p].hh.b1=0 then print(353)else print(354);
if mem[p+1].int<>0 then begin print(355);printscaled(mem[p+1].int);end;
end{:210};6:{211:}begin printfontandchar(p+1);print(356);
if mem[p].hh.b1>1 then printchar(124);
fontinshortdisplay:=mem[p+1].hh.b0;shortdisplay(mem[p+1].hh.rh);
if odd(mem[p].hh.b1)then printchar(124);printchar(41);end{:211};
12:{212:}begin printesc(357);printint(mem[p+1].int);end{:212};
7:{213:}begin printesc(358);if mem[p].hh.b1>0 then begin print(359);
printint(mem[p].hh.b1);end;begin begin strpool[poolptr]:=46;
incr(poolptr);end;shownodelist(mem[p+1].hh.lh);decr(poolptr);end;
begin strpool[poolptr]:=124;incr(poolptr);end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);end{:213};
4:{214:}begin printesc(360);
if mem[p+1].hh.lh<>0 then begin printchar(115);printint(mem[p+1].hh.lh);
end;printmark(mem[p+1].hh.rh);end{:214};5:{215:}begin printesc(361);
if mem[p].hh.b1<>0 then print(362);begin begin strpool[poolptr]:=46;
incr(poolptr);end;shownodelist(mem[p+1].int);decr(poolptr);end;
end{:215};{866:}14:printstyle(mem[p].hh.b1);
15:{871:}begin printesc(613);begin strpool[poolptr]:=68;incr(poolptr);
end;shownodelist(mem[p+1].hh.lh);decr(poolptr);
begin strpool[poolptr]:=84;incr(poolptr);end;
shownodelist(mem[p+1].hh.rh);decr(poolptr);begin strpool[poolptr]:=83;
incr(poolptr);end;shownodelist(mem[p+2].hh.lh);decr(poolptr);
begin strpool[poolptr]:=115;incr(poolptr);end;
shownodelist(mem[p+2].hh.rh);decr(poolptr);end{:871};
16,17,18,19,20,21,22,23,24,27,26,29,28,30,31:{872:}begin case mem[p].hh.
b0 of 16:printesc(1288);17:printesc(1289);18:printesc(1290);
19:printesc(1291);20:printesc(1292);21:printesc(1293);22:printesc(1294);
23:printesc(1295);27:printesc(1296);26:printesc(1297);29:printesc(628);
24:begin printesc(622);printdelimiter(p+4);end;28:begin printesc(593);
printfamandchar(p+4);end;30:begin printesc(1298);printdelimiter(p+1);
end;31:begin if mem[p].hh.b1=0 then printesc(1299)else printesc(1300);
printdelimiter(p+1);end;end;
if mem[p].hh.b0<30 then begin if mem[p].hh.b1<>0 then if mem[p].hh.b1=1
then printesc(1301)else printesc(1302);printsubsidiarydata(p+1,46);end;
printsubsidiarydata(p+2,94);printsubsidiarydata(p+3,95);end{:872};
25:{873:}begin printesc(1303);
if mem[p+1].int=1073741824 then print(1304)else printscaled(mem[p+1].int
);
if(mem[p+4].qqqq.b0<>0)or(mem[p+4].qqqq.b1<>0)or(mem[p+4].qqqq.b2<>0)or(
mem[p+4].qqqq.b3<>0)then begin print(1305);printdelimiter(p+4);end;
if(mem[p+5].qqqq.b0<>0)or(mem[p+5].qqqq.b1<>0)or(mem[p+5].qqqq.b2<>0)or(
mem[p+5].qqqq.b3<>0)then begin print(1306);printdelimiter(p+5);end;
printsubsidiarydata(p+2,92);printsubsidiarydata(p+3,47);end{:873};
{:866}others:print(325)end{:201};p:=mem[p].hh.rh;end;10:end;
{:200}{216:}procedure showbox(p:halfword);
begin{254:}depththreshold:=eqtb[29302].int;
breadthmax:=eqtb[29301].int{:254};if breadthmax<=0 then breadthmax:=5;
if poolptr+depththreshold>=poolsize then depththreshold:=poolsize-
poolptr-1;shownodelist(p);println;end;
{:216}{218:}procedure deletetokenref(p:halfword);
begin if mem[p].hh.lh=-268435455 then flushlist(p)else decr(mem[p].hh.lh
);end;{:218}{219:}procedure deleteglueref(p:halfword);
begin if mem[p].hh.rh=-268435455 then freenode(p,4)else decr(mem[p].hh.
rh);end;{:219}{220:}procedure flushnodelist(p:halfword);label 30;
var q:halfword;begin while p<>-268435455 do begin q:=mem[p].hh.rh;
if(p>=himemmin)then begin mem[p].hh.rh:=avail;avail:=p;
ifdef('STAT')decr(dynused);
endif('STAT')end else begin case mem[p].hh.b0 of 0,1,13:begin
flushnodelist(mem[p+5].hh.rh);freenode(p,9);goto 30;end;
2:begin freenode(p,6);goto 30;end;3:begin flushnodelist(mem[p+4].hh.lh);
deleteglueref(mem[p+4].hh.rh);freenode(p,5);goto 30;end;
8:{1605:}begin case mem[p].hh.b1 of 0:freenode(p,3);
1,3,4:begin deletetokenref(mem[p+1].hh.rh);freenode(p,2);goto 30;end;
2,5:freenode(p,2);7,8:begin deletetokenref(mem[p+1].hh.rh);
freenode(p,2);end;
40:begin if mem[p+1].hh.lh<=1 then begin deletetokenref(mem[p+2].hh.rh);
freenode(p,3);end else freenode(p,2);end;
41:begin deletetokenref(mem[p+1].hh.rh);freenode(p,2);end;
42:begin freenode(p,2);end;43:begin freenode(p,2);end;10:freenode(p,2);
12:freenode(p,5);14:freenode(p,5);
15:begin deletetokenref(mem[p+5].hh.lh);freenode(p,7);end;
16:begin if mem[p+5].hh.lh<>-268435455 then deletetokenref(mem[p+5].hh.
lh);
begin if mem[mem[p+5].hh.rh+2].hh.rh=-268435455 then begin if mem[mem[p
+5].hh.rh].hh.b0=3 then deletetokenref(mem[mem[p+5].hh.rh+2].hh.lh)else
begin if mem[mem[p+5].hh.rh+1].hh.lh<>-268435455 then deletetokenref(mem
[mem[p+5].hh.rh+1].hh.lh);
if mem[mem[p+5].hh.rh].hh.b0=0 then deletetokenref(mem[mem[p+5].hh.rh+2]
.hh.lh)else if(mem[mem[p+5].hh.rh].hh.b1 and 1)=1 then deletetokenref(
mem[mem[p+5].hh.rh].hh.rh);
if(mem[mem[p+5].hh.rh].hh.b1 and 2)=2 then deletetokenref(mem[mem[p+5].
hh.rh+3].hh.rh);end;freenode(mem[p+5].hh.rh,4);
end else decr(mem[mem[p+5].hh.rh+2].hh.rh);end;freenode(p,7);end;
17:freenode(p,2);
19:begin if mem[p+5].hh.b1>0 then deletetokenref(mem[p+5].hh.rh);
freenode(p,7);end;
20,21:begin if mem[p+5].hh.b1>0 then deletetokenref(mem[p+5].hh.rh);
if mem[p+6].hh.lh<>-268435455 then deletetokenref(mem[p+6].hh.lh);
freenode(p,7);end;22:freenode(p,2);23:freenode(p,2);36:freenode(p,2);
37:begin deleteglueref(mem[p+1].hh.lh);freenode(p,3);end;
38:freenode(p,2);45:freenode(p,2);46:freenode(p,2);47:freenode(p,2);
48:freenode(p,2);49:freenode(p,2);others:confusion(1932)end;goto 30;
end{:1605};
10:begin begin if mem[mem[p+1].hh.lh].hh.rh=-268435455 then freenode(mem
[p+1].hh.lh,4)else decr(mem[mem[p+1].hh.lh].hh.rh);end;
if mem[p+1].hh.rh<>-268435455 then flushnodelist(mem[p+1].hh.rh);
freenode(p,4);goto 30;end;11,9,12:begin freenode(p,4);goto 30;end;
40:begin begin mem[mem[p+2].hh.lh].hh.rh:=avail;avail:=mem[p+2].hh.lh;
ifdef('STAT')decr(dynused);endif('STAT')end;freenode(p,3);goto 30;end;
6:flushnodelist(mem[p+1].hh.rh);4:deletetokenref(mem[p+1].hh.rh);
7:begin flushnodelist(mem[p+1].hh.lh);flushnodelist(mem[p+1].hh.rh);end;
5:flushnodelist(mem[p+1].int);{874:}14:begin freenode(p,3);goto 30;end;
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
flushnodelist(mem[p+3].hh.lh);freenode(p,6);goto 30;end;
{:874}others:confusion(363)end;freenode(p,2);30:end;p:=q;end;end;
{:220}{222:}function copynodelist(p:halfword):halfword;var h:halfword;
q:halfword;r:halfword;words:0..5;begin h:=getavail;q:=h;
while p<>-268435455 do begin{223:}words:=1;
if(p>=himemmin)then r:=getavail else{224:}case mem[p].hh.b0 of 0,1,13:
begin r:=getnode(9);{1935:}mem[r+7].int:=mem[p+7].int;
mem[r+8].int:=mem[p+8].int;{:1935};mem[r+6]:=mem[p+6];
mem[r+5]:=mem[p+5];mem[r+5].hh.rh:=copynodelist(mem[p+5].hh.rh);
words:=5;end;2:begin r:=getnode(6);words:=4;{1936:}{:1936};end;
3:begin r:=getnode(5);mem[r+4]:=mem[p+4];
incr(mem[mem[p+4].hh.rh].hh.rh);
mem[r+4].hh.lh:=copynodelist(mem[p+4].hh.lh);words:=4;end;
8:{1604:}case mem[p].hh.b1 of 0:begin r:=getnode(3);words:=3;end;
1,3,4:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
2,5:begin r:=getnode(2);words:=2;end;7,8:begin r:=getnode(2);
incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
40:begin if mem[p+1].hh.lh<=1 then begin r:=getnode(3);
incr(mem[mem[p+2].hh.rh].hh.lh);words:=3;end else begin r:=getnode(2);
words:=2;end;end;41:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);
words:=2;end;42:begin r:=getnode(2);words:=2;end;43:begin r:=getnode(2);
words:=2;end;10:begin r:=getnode(2);words:=2;end;12:begin r:=getnode(5);
words:=5;end;14:begin r:=getnode(5);words:=5;end;15:begin r:=getnode(7);
incr(mem[mem[p+5].hh.lh].hh.lh);words:=7;end;16:begin r:=getnode(7);
mem[r+2].int:=mem[p+2].int;mem[r+3].int:=mem[p+3].int;
mem[r+1].int:=mem[p+1].int;mem[r+5].hh.lh:=mem[p+5].hh.lh;
if mem[r+5].hh.lh<>-268435455 then incr(mem[mem[r+5].hh.lh].hh.lh);
mem[r+5].hh.rh:=mem[p+5].hh.rh;incr(mem[mem[r+5].hh.rh+2].hh.rh);
mem[r+6].int:=mem[p+6].int;end;17:r:=getnode(2);19:begin r:=getnode(7);
if mem[p+5].hh.b1>0 then incr(mem[mem[p+5].hh.rh].hh.lh);words:=7;end;
20,21:begin r:=getnode(7);
if mem[p+5].hh.b1>0 then incr(mem[mem[p+5].hh.rh].hh.lh);
if mem[p+6].hh.lh<>-268435455 then incr(mem[mem[p+6].hh.lh].hh.lh);
words:=7;end;22:r:=getnode(2);23:r:=getnode(2);36:r:=getnode(2);
37:begin incr(mem[mem[p+1].hh.lh].hh.rh);r:=getnode(3);words:=3;end;
38:r:=getnode(2);45:r:=getnode(2);46:r:=getnode(2);47:r:=getnode(2);
48:r:=getnode(2);49:r:=getnode(2);others:confusion(1931)end{:1604};
10:begin r:=getnode(4);incr(mem[mem[p+1].hh.lh].hh.rh);
{1937:}mem[r+2].int:=mem[p+2].int;mem[r+3].int:=mem[p+3].int;{:1937};
mem[r+1].hh.lh:=mem[p+1].hh.lh;
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;
11,9,12:begin r:=getnode(4);words:=4;end;40:begin r:=getnode(3);
begin mem[r+2].hh.lh:=avail;
if mem[r+2].hh.lh=-268435455 then mem[r+2].hh.lh:=getavail else begin
avail:=mem[mem[r+2].hh.lh].hh.rh;mem[mem[r+2].hh.lh].hh.rh:=-268435455;
ifdef('STAT')incr(dynused);endif('STAT')end;end;
mem[mem[r+2].hh.lh].hh.b0:=mem[mem[p+2].hh.lh].hh.b0;
mem[mem[r+2].hh.lh].hh.b1:=mem[mem[p+2].hh.lh].hh.b1;words:=2;end;
6:begin r:=getnode(2);mem[r+1]:=mem[p+1];
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;7:begin r:=getnode(2);
mem[r+1].hh.lh:=copynodelist(mem[p+1].hh.lh);
mem[r+1].hh.rh:=copynodelist(mem[p+1].hh.rh);end;4:begin r:=getnode(2);
incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;5:begin r:=getnode(2);
mem[r+1].int:=copynodelist(mem[p+1].int);end;
others:confusion(364)end{:224};while words>0 do begin decr(words);
mem[r+words]:=mem[p+words];end{:223};mem[q].hh.rh:=r;q:=r;
p:=mem[p].hh.rh;end;mem[q].hh.rh:=-268435455;q:=mem[h].hh.rh;
begin mem[h].hh.rh:=avail;avail:=h;ifdef('STAT')decr(dynused);
endif('STAT')end;copynodelist:=q;end;
{:222}{229:}procedure printmode(m:integer);
begin if m>0 then case m div(104)of 0:print(365);1:print(366);
2:print(367);
end else if m=0 then print(368)else case(-m)div(104)of 0:print(369);
1:print(370);2:print(371);end;end;procedure printinmode(m:integer);
begin if m>0 then case m div(104)of 0:print(372);1:print(373);
2:print(374);
end else if m=0 then print(375)else case(-m)div(104)of 0:print(376);
1:print(377);2:print(378);end;end;{:229}{234:}procedure pushnest;
begin if nestptr>maxneststack then begin maxneststack:=nestptr;
if nestptr=nestsize then overflow(379,nestsize);end;
nest[nestptr]:=curlist;incr(nestptr);curlist.headfield:=getavail;
curlist.tailfield:=curlist.headfield;curlist.pgfield:=0;
curlist.mlfield:=line;curlist.eTeXauxfield:=-268435455;end;
{:234}{235:}procedure popnest;
begin begin mem[curlist.headfield].hh.rh:=avail;
avail:=curlist.headfield;ifdef('STAT')decr(dynused);endif('STAT')end;
decr(nestptr);curlist:=nest[nestptr];end;
{:235}{236:}procedure printtotals;forward;procedure showactivities;
var p:0..nestsize;m:-209..209;a:memoryword;q,r:halfword;t:integer;
begin nest[nestptr]:=curlist;printnl(345);println;
for p:=nestptr downto 0 do begin m:=nest[p].modefield;
a:=nest[p].auxfield;printnl(380);printmode(m);print(381);
printint(abs(nest[p].mlfield));
if m=105 then if nest[p].pgfield<>8585216 then begin print(382);
printint(nest[p].pgfield mod 65536);print(383);
printint(nest[p].pgfield div 4194304);printchar(44);
printint((nest[p].pgfield div 65536)mod 64);printchar(41);end;
if nest[p].mlfield<0 then print(384);
if p=0 then begin{1163:}if memtop-2<>pagetail then begin printnl(1409);
if outputactive then print(1410);showbox(mem[memtop-2].hh.rh);
if pagecontents>0 then begin printnl(1411);printtotals;printnl(1412);
printscaled(pagesofar[0]);r:=mem[memtop].hh.rh;
while r<>memtop do begin println;printesc(337);t:=mem[r].hh.b1;
printint(t);print(1413);
if eqtb[29391+t].int=1000 then t:=mem[r+3].int else t:=xovern(mem[r+3].
int,1000)*eqtb[29391+t].int;printscaled(t);
if mem[r].hh.b0=1 then begin q:=memtop-2;t:=0;repeat q:=mem[q].hh.rh;
if(mem[q].hh.b0=3)and(mem[q].hh.b1=mem[r].hh.b1)then incr(t);
until q=mem[r+1].hh.lh;print(1414);printint(t);print(1415);end;
r:=mem[r].hh.rh;end;end;end{:1163};
if mem[memtop-1].hh.rh<>-268435455 then printnl(385);end;
showbox(mem[nest[p].headfield].hh.rh);
{237:}case abs(m)div(104)of 0:begin printnl(386);
if a.int<=eqtb[29935].int then print(387)else printscaled(a.int);
if nest[p].pgfield<>0 then begin print(388);printint(nest[p].pgfield);
if nest[p].pgfield<>1 then print(389)else print(390);end;end;
1:begin printnl(391);printint(a.hh.lh);
if m>0 then if a.hh.rh>0 then begin print(392);printint(a.hh.rh);end;
end;2:if a.int<>-268435455 then begin print(393);showbox(a.int);end;
end{:237};end;end;{:236}{255:}procedure printparam(n:integer);
begin case n of 0:printesc(441);1:printesc(442);2:printesc(443);
3:printesc(444);4:printesc(445);5:printesc(446);6:printesc(447);
7:printesc(448);8:printesc(449);9:printesc(450);10:printesc(451);
11:printesc(452);12:printesc(453);13:printesc(454);14:printesc(455);
15:printesc(456);16:printesc(457);17:printesc(458);18:printesc(459);
19:printesc(460);20:printesc(461);21:printesc(462);22:printesc(463);
23:printesc(464);24:printesc(465);25:printesc(466);26:printesc(467);
27:printesc(468);28:printesc(469);29:printesc(470);30:printesc(471);
31:printesc(472);32:printesc(473);33:printesc(474);34:printesc(475);
35:printesc(476);36:printesc(477);37:printesc(478);38:printesc(479);
39:printesc(480);40:printesc(481);41:printesc(482);42:printesc(483);
43:printesc(484);44:printesc(485);45:printesc(486);46:printesc(487);
47:printesc(488);48:printesc(489);49:printesc(490);50:printesc(491);
51:printesc(492);52:printesc(493);53:printesc(494);54:printesc(495);
55:printesc(496);56:printesc(497);57:printesc(498);61:printesc(499);
62:printesc(500);63:printesc(501);64:printesc(502);58:printesc(503);
59:printesc(504);60:printesc(505);65:printesc(506);66:printesc(507);
86:printesc(508);67:printesc(509);68:printesc(510);69:printesc(511);
70:printesc(512);71:printesc(513);72:printesc(514);73:printesc(515);
74:printesc(516);75:printesc(517);76:printesc(518);77:printesc(519);
78:printesc(520);79:printesc(521);80:printesc(522);81:printesc(523);
82:printesc(524);83:printesc(525);84:printesc(526);85:printesc(527);
87:printesc(528);88:printesc(529);89:printesc(530);90:printesc(531);
91:printesc(532);92:printesc(533);93:printesc(534);94:printesc(535);
95:printesc(536);96:printesc(537);97:printesc(538);98:printesc(539);
99:printesc(540);100:printesc(541);101:printesc(542);
{1909:}113:printesc(2104);{:1909}{1659:}102:printesc(1997);
103:printesc(1998);104:printesc(1999);105:printesc(2000);
106:printesc(2001);107:printesc(2002);108:printesc(2003);
109:printesc(2004);110:printesc(2005);111:printesc(2006);
{:1659}{1700:}112:printesc(2046);{:1700}others:print(543)end;end;
{:255}{259:}procedure fixdateandtime;
begin dateandtime(systime,sysday,sysmonth,sysyear);
eqtb[29297].int:=systime;eqtb[29298].int:=sysday;
eqtb[29299].int:=sysmonth;eqtb[29300].int:=sysyear;end;
{:259}{263:}procedure begindiagnostic;begin oldsetting:=selector;
if(eqtb[29306].int<=0)and(selector=19)then begin decr(selector);
if history=0 then history:=1;end;end;
procedure enddiagnostic(blankline:boolean);begin printnl(345);
if blankline then println;selector:=oldsetting;end;
{:263}{265:}procedure printlengthparam(n:integer);
begin case n of 0:printesc(548);1:printesc(549);2:printesc(550);
3:printesc(551);4:printesc(552);5:printesc(553);6:printesc(554);
7:printesc(555);8:printesc(556);9:printesc(557);10:printesc(558);
11:printesc(559);12:printesc(560);13:printesc(561);14:printesc(562);
15:printesc(563);16:printesc(564);17:printesc(565);18:printesc(566);
19:printesc(567);20:printesc(568);21:printesc(569);22:printesc(570);
23:printesc(571);24:printesc(572);25:printesc(573);26:printesc(574);
27:printesc(575);28:printesc(576);29:printesc(577);30:printesc(578);
31:printesc(579);32:printesc(580);33:printesc(581);others:print(582)end;
end;{:265}{270:}{320:}procedure printcmdchr(cmd:quarterword;
chrcode:halfword);var n:integer;begin case cmd of 1:begin print(649);
print(chrcode);end;2:begin print(650);print(chrcode);end;
3:begin print(651);print(chrcode);end;6:begin print(652);print(chrcode);
end;7:begin print(653);print(chrcode);end;8:begin print(654);
print(chrcode);end;9:print(655);10:begin print(656);print(chrcode);end;
11:begin print(657);print(chrcode);end;12:begin print(658);
print(chrcode);end;
{245:}75,76:if chrcode<26646 then printskipparam(chrcode-26628)else if
chrcode<26902 then begin printesc(413);printint(chrcode-26646);
end else begin printesc(414);printint(chrcode-26902);end;
{:245}{249:}72:if chrcode>=27173 then begin printesc(428);
printint(chrcode-27173);end else case chrcode of 27159:printesc(415);
27160:printesc(416);27161:printesc(417);27162:printesc(418);
27163:printesc(419);27164:printesc(420);27165:printesc(421);
27166:printesc(422);{1658:}27172:printesc(1996);
{:1658}27168:printesc(424);27169:printesc(425);27170:printesc(426);
27171:printesc(427);others:printesc(423)end;
{:249}{257:}73:if chrcode<29391 then printparam(chrcode-29277)else begin
printesc(546);printint(chrcode-29391);end;
{:257}{267:}74:if chrcode<29937 then printlengthparam(chrcode-29903)else
begin printesc(583);printint(chrcode-29937);end;
{:267}{288:}45:printesc(593);90:printesc(594);40:printesc(595);
41:printesc(596);77:printesc(607);61:printesc(597);42:printesc(620);
16:printesc(598);110:printesc(589);88:printesc(604);101:printesc(605);
102:printesc(606);15:printesc(599);92:printesc(600);
67:if chrcode=10 then printesc(601)else printesc(590);62:printesc(602);
64:printesc(32);
105:if chrcode=0 then printesc(603){1763:}else printesc(940){:1763};
32:printesc(608);36:printesc(609);
39:if chrcode=0 then printesc(610)else printesc(586);37:printesc(337);
44:printesc(47);18:begin printesc(360);if chrcode>0 then printchar(115);
end;46:printesc(611);17:printesc(612);54:printesc(613);91:printesc(614);
34:printesc(615);65:printesc(616);
106:if chrcode=0 then printesc(617)else printesc(586);55:printesc(342);
63:printesc(618);66:printesc(622);
96:if chrcode=0 then printesc(623){1760:}else printesc(2061){:1760};
0:printesc(624);98:printesc(625);80:printesc(621);
84:case chrcode of 27158:printesc(619);{1865:}27429:printesc(2097);
27430:printesc(2098);27431:printesc(2099);27432:printesc(2100);
{:1865}end;
112:if chrcode=0 then printesc(626){1687:}else if chrcode=1 then
printesc(2036)else printesc(2037){:1687};71:{1833:}begin printesc(428);
if chrcode<>membot then printsanum(chrcode);end{:1833};38:printesc(361);
33:if chrcode=0 then printesc(627){1702:}else case chrcode of 6:printesc
(2047);7:printesc(2048);10:printesc(2049);
others:printesc(2050)end{:1702};56:printesc(628);35:printesc(629);
103:printesc(544);{:288}{357:}13:printesc(691);
{:357}{403:}107:if chrcode=0 then printesc(727){1748:}else if chrcode=2
then printesc(2059){:1748}else printesc(728);
{:403}{411:}113:begin case(chrcode mod 5)of 1:printesc(730);
2:printesc(731);3:printesc(732);4:printesc(733);others:printesc(729)end;
if chrcode>=5 then printchar(115);end;
{:411}{438:}89:{1832:}begin if(chrcode<membot)or(chrcode>membot+19)then
cmd:=(mem[chrcode].hh.b0 div 16)else begin cmd:=chrcode-membot;
chrcode:=-268435455;end;
if cmd=0 then printesc(546)else if cmd=1 then printesc(583)else if cmd=2
then printesc(413)else printesc(414);
if chrcode<>-268435455 then printsanum(chrcode);end{:1832};
{:438}{443:}79:if chrcode=1 then printesc(767)else printesc(766);
82:if chrcode=0 then printesc(768){1693:}else if chrcode=2 then printesc
(2042){:1693}else printesc(769);
83:if chrcode=1 then printesc(770)else if chrcode=3 then printesc(771)
else printesc(772);70:case chrcode of 0:printesc(773);1:printesc(774);
2:printesc(775);4:printesc(776);{1650:}3:printesc(1993);
20:printesc(1994);{:1650}{1664:}21:printesc(2021);22:printesc(2022);
{:1664}{1667:}23:printesc(2023);24:printesc(2024);25:printesc(2025);
{:1667}{1670:}28:printesc(2026);29:printesc(2027);30:printesc(2028);
31:printesc(2029);{:1670}{1673:}32:printesc(2030);33:printesc(2031);
34:printesc(2032);{:1673}{1779:}39:printesc(2073);40:printesc(2074);
41:printesc(2075);42:printesc(2076);{:1779}{1802:}26:printesc(2080);
27:printesc(2081);35:printesc(2082);36:printesc(2083);
{:1802}{1806:}37:printesc(2084);38:printesc(2085);
{:1806}6:printesc(778);7:printesc(779);8:printesc(780);9:printesc(781);
10:printesc(782);11:printesc(783);12:printesc(784);13:printesc(785);
14:printesc(786);15:printesc(787);16:printesc(788);17:printesc(789);
18:printesc(790);19:printesc(791);others:printesc(777)end;
{:443}{495:}111:case chrcode of 0:printesc(850);1:printesc(851);
2:printesc(852);3:printesc(853);4:printesc(854);5:printesc(883);
6:printesc(855);7:printesc(856);8:printesc(857);9:printesc(858);
10:printesc(859);11:printesc(860);12:printesc(861);16:printesc(862);
17:printesc(863);13:printesc(864);14:printesc(865);15:printesc(866);
20:printesc(867);21:printesc(868);22:printesc(869);23:printesc(870);
24:printesc(871);25:printesc(872);26:printesc(873);27:printesc(874);
28:printesc(875);18:printesc(876);19:printesc(877);29:printesc(878);
30:printesc(879);31:printesc(881);32:printesc(882);
others:printesc(880)end;
{:495}{514:}108:begin if chrcode>=32 then printesc(940);
case chrcode mod 32 of 1:printesc(923);2:printesc(924);3:printesc(925);
4:printesc(926);5:printesc(927);6:printesc(928);7:printesc(929);
8:printesc(930);9:printesc(931);10:printesc(932);11:printesc(933);
12:printesc(934);13:printesc(935);14:printesc(936);15:printesc(937);
16:printesc(938);21:printesc(939);{1764:}17:printesc(2062);
18:printesc(2063);19:printesc(2064);20:printesc(2065);22:printesc(2066);
23:printesc(2067);{:1764}others:printesc(922)end;end;
{:514}{518:}109:if chrcode=2 then printesc(941)else if chrcode=4 then
printesc(942)else printesc(943);
{:518}{957:}4:if chrcode=256 then printesc(1321)else begin print(1325);
print(chrcode);end;
5:if chrcode=257 then printesc(1322)else printesc(1323);
{:957}{1161:}81:case chrcode of 0:printesc(1399);1:printesc(1400);
2:printesc(1401);3:printesc(1402);4:printesc(1403);5:printesc(1404);
6:printesc(1405);others:printesc(1406)end;
{:1161}{1231:}14:if chrcode=1 then printesc(1451)else printesc(350);
{:1231}{1237:}26:case chrcode of 4:printesc(1452);0:printesc(1453);
1:printesc(1454);2:printesc(1455);others:printesc(1456)end;
27:case chrcode of 4:printesc(1457);0:printesc(1458);1:printesc(1459);
2:printesc(1460);others:printesc(1461)end;28:printesc(343);
29:printesc(322);30:printesc(349);
{:1237}{1250:}21:if chrcode=1 then printesc(1479)else printesc(1480);
22:if chrcode=1 then printesc(1481)else printesc(1482);
20:case chrcode of 0:printesc(430);1:printesc(1483);2:printesc(1484);
3:printesc(1394);4:printesc(1485);5:printesc(1396);
others:printesc(1486)end;
31:if chrcode=100 then printesc(1488)else if chrcode=101 then printesc(
1489)else if chrcode=102 then printesc(1490)else printesc(1487);
{:1250}{1267:}43:if chrcode=0 then printesc(1507)else if chrcode=1 then
printesc(1506)else printesc(1508);
{:1267}{1286:}25:if chrcode=10 then printesc(1520)else if chrcode=11
then printesc(1519)else printesc(1518);
23:if chrcode=1 then printesc(1522)else printesc(1521);
24:if chrcode=1 then printesc(1524){1862:}else if chrcode=2 then
printesc(2095)else if chrcode=3 then printesc(2096){:1862}else printesc(
1523);{:1286}{1293:}47:if chrcode=1 then printesc(45)else printesc(358);
{:1293}{1321:}48:if chrcode=1 then printesc(1557)else printesc(1556);
{:1321}{1335:}50:case chrcode of 16:printesc(1288);17:printesc(1289);
18:printesc(1290);19:printesc(1291);20:printesc(1292);21:printesc(1293);
22:printesc(1294);23:printesc(1295);26:printesc(1297);
others:printesc(1296)end;
51:if chrcode=1 then printesc(1301)else if chrcode=2 then printesc(1302)
else printesc(1558);{:1335}{1348:}53:printstyle(chrcode);
{:1348}{1357:}52:case chrcode of 1:printesc(1577);2:printesc(1578);
3:printesc(1579);4:printesc(1580);5:printesc(1581);
others:printesc(1576)end;
{:1357}{1367:}49:if chrcode=30 then printesc(1298){1698:}else if chrcode
=1 then printesc(1300){:1698}else printesc(1299);
{:1367}{1387:}93:if chrcode=1 then printesc(1601)else if chrcode=2 then
printesc(1602){1771:}else if chrcode=8 then printesc(1615){:1771}else
printesc(1603);
97:if chrcode=0 then printesc(1604)else if chrcode=1 then printesc(1605)
else if chrcode=2 then printesc(1606)else printesc(1607);
{:1387}{1398:}94:if chrcode<>0 then if chrcode=10 then printesc(1626)
else if chrcode=11 then printesc(1627)else printesc(1625)else printesc(
1624);{:1398}{1401:}95:case chrcode of 0:printesc(1633);
1:printesc(1634);2:printesc(1635);3:printesc(1636);4:printesc(1637);
5:printesc(1638);7:printesc(1640);others:printesc(1639)end;
68:begin printesc(598);printhex(chrcode);end;69:begin printesc(612);
printhex(chrcode);end;
{:1401}{1409:}85:if chrcode=27690 then printesc(1645)else if chrcode=
27691 then printesc(1646)else if chrcode=27692 then printesc(1647)else
if chrcode=27741 then printesc(436)else if chrcode=28765 then printesc(
440)else if chrcode=27997 then printesc(437)else if chrcode=28253 then
printesc(438)else if chrcode=28509 then printesc(439)else printesc(547);
86:printsize(chrcode-27693);
{:1409}{1429:}99:if chrcode=1 then printesc(1380)else printesc(1368);
{:1429}{1433:}78:case chrcode of 0:printesc(1663);1:printesc(1664);
2:printesc(1665);3:printesc(1666);4:printesc(1667);5:printesc(1668);
7:printesc(1669);8:printesc(1670);9:printesc(1671);10:printesc(1672);
11:printesc(1673);6:printesc(1674);end;
{:1433}{1439:}87:begin print(1681);slowprint(fontname[chrcode]);
if fontsize[chrcode]<>fontdsize[chrcode]then begin print(906);
printscaled(fontsize[chrcode]);print(312);end;end;
{:1439}{1441:}100:case chrcode of 0:printesc(274);1:printesc(275);
2:printesc(276);others:printesc(1682)end;
{:1441}{1451:}60:if chrcode=0 then printesc(1684)else printesc(1683);
{:1451}{1456:}58:if chrcode=0 then printesc(1685)else printesc(1686);
{:1456}{1465:}57:if chrcode=27997 then printesc(1692)else printesc(1693)
;{:1465}{1470:}19:case chrcode of 1:printesc(1695);2:printesc(1696);
3:printesc(1697);{1676:}4:printesc(2033);{:1676}{1685:}5:printesc(2035);
{:1685}{1690:}6:printesc(2038);{:1690}others:printesc(1694)end;
{:1470}{1473:}104:print(1704);114,115,116,117:begin n:=cmd-114;
if mem[mem[chrcode].hh.rh].hh.lh=3585 then n:=n+4;
if odd(n div 4)then printesc(1615);if odd(n)then printesc(1601);
if odd(n div 2)then printesc(1602);if n>0 then printchar(32);
print(1705);end;118:printesc(1706);
{:1473}{1526:}59:case chrcode of 0:printesc(1744);1:printesc(687);
2:printesc(1745);3:printesc(1746);5:printesc(1747);6:printesc(1748);
15:printesc(1759);25:printesc(1772);19:printesc(1763);17:printesc(1761);
22:printesc(1766);27:printesc(1775);34:printesc(1782);28:printesc(1774);
24:printesc(1771);7:printesc(1749);40:printesc(1145);41:printesc(1750);
42:printesc(1751);43:printesc(1752);29:printesc(1776);30:printesc(1777);
26:printesc(1773);9:printesc(1753);18:printesc(1762);10:printesc(1754);
12:printesc(1756);14:printesc(1758);23:printesc(1767);36:printesc(1768);
38:printesc(1770);37:printesc(1769);16:printesc(1760);21:printesc(1765);
20:printesc(1764);31:printesc(1778);32:printesc(1779);11:printesc(1755);
13:printesc(1757);33:printesc(1780);35:printesc(1781);44:printesc(1784);
39:printesc(1783);45:printesc(1785);46:printesc(1786);47:printesc(1787);
48:printesc(1788);49:printesc(1789);50:printesc(1790);
others:print(1791)end;{:1526}others:print(659)end;end;
{:320}ifdef('STAT')procedure showeqtb(n:halfword);
begin if n<1 then printchar(63)else if(n<26628)or((n>30192)and(n<=
eqtbtop))then{241:}begin sprintcs(n);printchar(61);
printcmdchr(eqtb[n].hh.b0,eqtb[n].hh.rh);
if eqtb[n].hh.b0>=114 then begin printchar(58);
showtokenlist(mem[eqtb[n].hh.rh].hh.rh,-268435455,32);end;
end{:241}else if n<27158 then{247:}if n<26646 then begin printskipparam(
n-26628);printchar(61);
if n<26643 then printspec(eqtb[n].hh.rh,312)else printspec(eqtb[n].hh.rh
,344);end else if n<26902 then begin printesc(413);printint(n-26646);
printchar(61);printspec(eqtb[n].hh.rh,312);end else begin printesc(414);
printint(n-26902);printchar(61);printspec(eqtb[n].hh.rh,344);
end{:247}else if n<29277 then{251:}if(n=27158)or((n>=27429)and(n<27433))
then begin printcmdchr(84,n);printchar(61);
if eqtb[n].hh.rh=-268435455 then printchar(48)else if n>27158 then begin
printint(mem[eqtb[n].hh.rh+1].int);printchar(32);
printint(mem[eqtb[n].hh.rh+2].int);
if mem[eqtb[n].hh.rh+1].int>1 then printesc(429);
end else printint(mem[eqtb[27158].hh.rh].hh.lh);
end else if n<27173 then begin printcmdchr(72,n);printchar(61);
if eqtb[n].hh.rh<>-268435455 then showtokenlist(mem[eqtb[n].hh.rh].hh.rh
,-268435455,32);end else if n<27433 then begin printesc(428);
printint(n-27173);printchar(61);
if eqtb[n].hh.rh<>-268435455 then showtokenlist(mem[eqtb[n].hh.rh].hh.rh
,-268435455,32);end else if n<27689 then begin printesc(430);
printint(n-27433);printchar(61);
if eqtb[n].hh.rh=-268435455 then print(431)else begin depththreshold:=0;
breadthmax:=1;shownodelist(eqtb[n].hh.rh);end;
end else if n<27741 then{252:}begin if n=27689 then print(432)else if n<
27709 then begin printesc(433);printint(n-27693);
end else if n<27725 then begin printesc(434);printint(n-27709);
end else begin printesc(435);printint(n-27725);end;printchar(61);
printesc(hash[17626+eqtb[n].hh.rh].rh);
end{:252}else{253:}if n<28765 then begin if n<27997 then begin printesc(
436);printint(n-27741);end else if n<28253 then begin printesc(437);
printint(n-27997);end else if n<28509 then begin printesc(438);
printint(n-28253);end else begin printesc(439);printint(n-28509);end;
printchar(61);printint(eqtb[n].hh.rh);end else begin printesc(440);
printint(n-28765);printchar(61);printint(eqtb[n].hh.rh);
end{:253}{:251}else if n<29903 then{260:}begin if n<29391 then
printparam(n-29277)else if n<29647 then begin printesc(546);
printint(n-29391);end else begin printesc(547);printint(n-29647);end;
printchar(61);printint(eqtb[n].int);
end{:260}else if n<=30192 then{269:}begin if n<29937 then
printlengthparam(n-29903)else begin printesc(583);printint(n-29937);end;
printchar(61);printscaled(eqtb[n].int);print(312);
end{:269}else printchar(63);end;
endif('STAT'){:270}{278:}function idlookup(j,l:integer):halfword;
label 40;var h:integer;d:integer;p:halfword;k:halfword;
begin{280:}h:=buffer[j];for k:=j+1 to j+l-1 do begin h:=h+h+buffer[k];
while h>=8501 do h:=h-8501;end{:280};p:=h+514;
while true do begin if hash[p].rh>0 then if(strstart[hash[p].rh+1]-
strstart[hash[p].rh])=l then if streqbuf(hash[p].rh,j)then goto 40;
if hash[p].lh=0 then begin if nonewcontrolsequence then p:=26627 else
{279:}begin if hash[p].rh>0 then begin if hashhigh<hashextra then begin
incr(hashhigh);hash[p].lh:=hashhigh+30192;p:=hashhigh+30192;
end else begin repeat if(hashused=514)then overflow(587,15000+hashextra)
;decr(hashused);until hash[hashused].rh=0;hash[p].lh:=hashused;
p:=hashused;end;end;
begin if poolptr+l>poolsize then overflow(259,poolsize-initpoolptr);end;
d:=(poolptr-strstart[strptr]);
while poolptr>strstart[strptr]do begin decr(poolptr);
strpool[poolptr+l]:=strpool[poolptr];end;
for k:=j to j+l-1 do begin strpool[poolptr]:=buffer[k];incr(poolptr);
end;hash[p].rh:=makestring;poolptr:=poolptr+d;
ifdef('STAT')incr(cscount);endif('STAT')end{:279};goto 40;end;
p:=hash[p].lh;end;40:idlookup:=p;end;
{:278}{281:}function primlookup(s:strnumber):halfword;label 40;
var h:integer;p:halfword;k:halfword;j,l:integer;
begin if s<=255 then begin if s<0 then begin p:=0;goto 40;
end else p:=(s mod 1777)+1;end else begin j:=strstart[s];
if s=strptr then l:=(poolptr-strstart[strptr])else l:=(strstart[s+1]-
strstart[s]);{283:}h:=strpool[j];
for k:=j+1 to j+l-1 do begin h:=h+h+strpool[k];
while h>=1777 do h:=h-1777;end{:283};p:=h+1;end;
while true do begin if prim[p].rh>256 then begin if(strstart[prim[p].rh
+0]-strstart[prim[p].rh-1])=l then if streqstr(prim[p].rh-1,s)then goto
40;end else if prim[p].rh=1+s then goto 40;
if prim[p].lh=0 then begin if nonewcontrolsequence then p:=0 else{282:}
begin if prim[p].rh>0 then begin repeat if(primused=1)then overflow(588,
2100);decr(primused);until prim[primused].rh=0;prim[p].lh:=primused;
p:=primused;end;prim[p].rh:=s+1;end{:282};goto 40;end;p:=prim[p].lh;end;
40:primlookup:=p;end;
{:281}{286:}ifdef('INITEX')procedure primitive(s:strnumber;
c:quarterword;o:halfword);var k:poolpointer;j:0..bufsize;l:smallnumber;
primval:integer;begin if s<256 then begin curval:=s+257;
primval:=primlookup(s);end else begin k:=strstart[s];l:=strstart[s+1]-k;
if first+l>bufsize+1 then overflow(258,bufsize);
for j:=0 to l-1 do buffer[first+j]:=strpool[k+j];
curval:=idlookup(first,l);begin decr(strptr);poolptr:=strstart[strptr];
end;hash[curval].rh:=s;primval:=primlookup(s);end;eqtb[curval].hh.b1:=1;
eqtb[curval].hh.b0:=c;eqtb[curval].hh.rh:=o;
eqtb[15526+primval].hh.b1:=1;eqtb[15526+primval].hh.b0:=c;
eqtb[15526+primval].hh.rh:=o;end;
endif('INITEX'){:286}{290:}{306:}ifdef('STAT')procedure restoretrace(p:
halfword;s:strnumber);begin begindiagnostic;printchar(123);print(s);
printchar(32);showeqtb(p);printchar(125);enddiagnostic(false);end;
endif('STAT'){:306}{1661:}procedure printgroup(e:boolean);label 10;
begin case curgroup of 0:begin print(2007);goto 10;end;
1,14:begin if curgroup=14 then print(2008);print(2009);end;
2,3:begin if curgroup=3 then print(2010);print(1486);end;4:print(1396);
5:print(1485);6,7:begin if curgroup=7 then print(2011);print(2012);end;
8:print(415);10:print(2013);11:print(337);12:print(628);
9,13,15,16:begin print(352);
if curgroup=13 then print(2014)else if curgroup=15 then print(2015)else
if curgroup=16 then print(2016);end;end;print(2017);printint(curlevel);
printchar(41);
if savestack[saveptr-1].int<>0 then begin if e then print(381)else print
(2018);printint(savestack[saveptr-1].int);end;10:end;
{:1661}{1662:}ifdef('STAT')procedure grouptrace(e:boolean);
begin begindiagnostic;printchar(123);
if e then print(2019)else print(2020);printgroup(e);printchar(125);
enddiagnostic(false);end;
endif('STAT'){:1662}{1756:}function pseudoinput:boolean;var p:halfword;
sz:integer;w:fourquarters;r:halfword;begin last:=first;
p:=mem[pseudofiles].hh.lh;
if p=-268435455 then pseudoinput:=false else begin mem[pseudofiles].hh.
lh:=mem[p].hh.rh;sz:=mem[p].hh.lh;
if 4*sz-3>=bufsize-last then{35:}begin curinput.locfield:=first;
curinput.limitfield:=last-1;overflow(258,bufsize);end{:35};last:=first;
for r:=p+1 to p+sz-1 do begin w:=mem[r].qqqq;buffer[last]:=w.b0;
buffer[last+1]:=w.b1;buffer[last+2]:=w.b2;buffer[last+3]:=w.b3;
last:=last+4;end;if last>=maxbufstack then maxbufstack:=last+1;
while(last>first)and(buffer[last-1]=32)do decr(last);freenode(p,sz);
pseudoinput:=true;end;end;{:1756}{1757:}procedure pseudoclose;
var p,q:halfword;begin p:=mem[pseudofiles].hh.rh;
q:=mem[pseudofiles].hh.lh;begin mem[pseudofiles].hh.rh:=avail;
avail:=pseudofiles;ifdef('STAT')decr(dynused);endif('STAT')end;
pseudofiles:=p;while q<>-268435455 do begin p:=q;q:=mem[p].hh.rh;
freenode(p,mem[p].hh.lh);end;end;{:1757}{1774:}procedure groupwarning;
var i:0..maxinopen;w:boolean;begin baseptr:=inputptr;
inputstack[baseptr]:=curinput;i:=inopen;w:=false;
while(grpstack[i]=curboundary)and(i>0)do begin{1775:}if eqtb[29383].int>
0 then begin while(inputstack[baseptr].statefield=0)or(inputstack[
baseptr].indexfield>i)do decr(baseptr);
if inputstack[baseptr].namefield>17 then w:=true;end{:1775};
grpstack[i]:=savestack[saveptr].hh.rh;decr(i);end;
if w then begin printnl(2069);printgroup(true);print(2070);println;
if eqtb[29383].int>1 then showcontext;if history=0 then history:=1;end;
end;{:1774}{1776:}procedure ifwarning;var i:0..maxinopen;w:boolean;
begin baseptr:=inputptr;inputstack[baseptr]:=curinput;i:=inopen;
w:=false;
while ifstack[i]=condptr do begin{1775:}if eqtb[29383].int>0 then begin
while(inputstack[baseptr].statefield=0)or(inputstack[baseptr].indexfield
>i)do decr(baseptr);if inputstack[baseptr].namefield>17 then w:=true;
end{:1775};ifstack[i]:=mem[condptr].hh.rh;decr(i);end;
if w then begin printnl(2069);printcmdchr(108,curif);
if ifline<>0 then begin print(2039);printint(ifline);end;print(2070);
println;if eqtb[29383].int>1 then showcontext;
if history=0 then history:=1;end;end;
{:1776}{1777:}procedure filewarning;var p:halfword;l:quarterword;
c:quarterword;i:integer;begin p:=saveptr;l:=curlevel;c:=curgroup;
saveptr:=curboundary;
while grpstack[inopen]<>saveptr do begin decr(curlevel);printnl(2071);
printgroup(true);print(2072);curgroup:=savestack[saveptr].hh.b1;
saveptr:=savestack[saveptr].hh.rh end;saveptr:=p;curlevel:=l;
curgroup:=c;p:=condptr;l:=iflimit;c:=curif;i:=ifline;
while ifstack[inopen]<>condptr do begin printnl(2071);
printcmdchr(108,curif);if iflimit=2 then printesc(943);
if ifline<>0 then begin print(2039);printint(ifline);end;print(2072);
ifline:=mem[condptr+1].int;curif:=mem[condptr].hh.b1;
iflimit:=mem[condptr].hh.b0;condptr:=mem[condptr].hh.rh;end;condptr:=p;
iflimit:=l;curif:=c;ifline:=i;println;
if eqtb[29383].int>1 then showcontext;if history=0 then history:=1;end;
{:1777}{1821:}procedure deletesaref(q:halfword);label 10;var p:halfword;
i:smallnumber;s:smallnumber;begin decr(mem[q+1].hh.lh);
if mem[q+1].hh.lh<>-268435455 then goto 10;
if mem[q].hh.b0<32 then if mem[q+2].int=0 then s:=3 else goto 10 else
begin if mem[q].hh.b0<64 then if mem[q+1].hh.rh=membot then
deleteglueref(membot)else goto 10 else if mem[q+1].hh.rh<>-268435455
then goto 10;s:=2;end;repeat i:=mem[q].hh.b0 mod 16;p:=q;
q:=mem[p].hh.rh;freenode(p,s);
if q=-268435455 then begin saroot[i]:=-268435455;goto 10;end;
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=-268435455 else mem[q+(i
div 2)+1].hh.lh:=-268435455;decr(mem[q].hh.b1);end;s:=9;
until mem[q].hh.b1>0;10:end;
{:1821}{1823:}ifdef('STAT')procedure showsa(p:halfword;s:strnumber);
var t:smallnumber;begin begindiagnostic;printchar(123);print(s);
printchar(32);
if p=-268435455 then printchar(63)else begin t:=(mem[p].hh.b0 div 16);
if t<4 then printcmdchr(89,p)else if t=4 then begin printesc(430);
printsanum(p);end else if t=5 then printcmdchr(71,p)else printchar(63);
printchar(61);
if t=0 then printint(mem[p+2].int)else if t=1 then begin printscaled(mem
[p+2].int);print(312);end else begin p:=mem[p+1].hh.rh;
if t=2 then printspec(p,312)else if t=3 then printspec(p,344)else if t=4
then if p=-268435455 then print(431)else begin depththreshold:=0;
breadthmax:=1;shownodelist(p);
end else if t=5 then begin if p<>-268435455 then showtokenlist(mem[p].hh
.rh,-268435455,32);end else printchar(63);end;end;printchar(125);
enddiagnostic(false);end;
endif('STAT'){:1823}{1837:}procedure sasave(p:halfword);var q:halfword;
i:quarterword;
begin if curlevel<>salevel then begin if saveptr>maxsavestack then begin
maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(630,savesize);end;
savestack[saveptr].hh.b0:=4;savestack[saveptr].hh.b1:=salevel;
savestack[saveptr].hh.rh:=sachain;incr(saveptr);sachain:=-268435455;
salevel:=curlevel;end;i:=mem[p].hh.b0;
if i<32 then begin if mem[p+2].int=0 then begin q:=getnode(2);i:=96;
end else begin q:=getnode(3);mem[q+2].int:=mem[p+2].int;end;
mem[q+1].hh.rh:=-268435455;end else begin q:=getnode(2);
mem[q+1].hh.rh:=mem[p+1].hh.rh;end;mem[q+1].hh.lh:=p;mem[q].hh.b0:=i;
mem[q].hh.b1:=mem[p].hh.b1;mem[q].hh.rh:=sachain;sachain:=q;
incr(mem[p+1].hh.lh);end;{:1837}{1838:}procedure sadestroy(p:halfword);
begin if mem[p].hh.b0<64 then deleteglueref(mem[p+1].hh.rh)else if mem[p
+1].hh.rh<>-268435455 then if mem[p].hh.b0<80 then flushnodelist(mem[p+1
].hh.rh)else deletetokenref(mem[p+1].hh.rh);end;
{:1838}{1839:}procedure sadef(p:halfword;e:halfword);
begin incr(mem[p+1].hh.lh);
if mem[p+1].hh.rh=e then begin ifdef('STAT')if eqtb[29379].int>0 then
showsa(p,632);endif('STAT')sadestroy(p);
end else begin ifdef('STAT')if eqtb[29379].int>0 then showsa(p,633);
endif('STAT')if mem[p].hh.b1=curlevel then sadestroy(p)else sasave(p);
mem[p].hh.b1:=curlevel;mem[p+1].hh.rh:=e;
ifdef('STAT')if eqtb[29379].int>0 then showsa(p,634);endif('STAT')end;
deletesaref(p);end;procedure sawdef(p:halfword;w:integer);
begin incr(mem[p+1].hh.lh);
if mem[p+2].int=w then begin ifdef('STAT')if eqtb[29379].int>0 then
showsa(p,632);
endif('STAT')end else begin ifdef('STAT')if eqtb[29379].int>0 then
showsa(p,633);endif('STAT')if mem[p].hh.b1<>curlevel then sasave(p);
mem[p].hh.b1:=curlevel;mem[p+2].int:=w;
ifdef('STAT')if eqtb[29379].int>0 then showsa(p,634);endif('STAT')end;
deletesaref(p);end;{:1839}{1840:}procedure gsadef(p:halfword;
e:halfword);begin incr(mem[p+1].hh.lh);
ifdef('STAT')if eqtb[29379].int>0 then showsa(p,635);
endif('STAT')sadestroy(p);mem[p].hh.b1:=1;mem[p+1].hh.rh:=e;
ifdef('STAT')if eqtb[29379].int>0 then showsa(p,634);
endif('STAT')deletesaref(p);end;procedure gsawdef(p:halfword;w:integer);
begin incr(mem[p+1].hh.lh);
ifdef('STAT')if eqtb[29379].int>0 then showsa(p,635);
endif('STAT')mem[p].hh.b1:=1;mem[p+2].int:=w;
ifdef('STAT')if eqtb[29379].int>0 then showsa(p,634);
endif('STAT')deletesaref(p);end;{:1840}{1841:}procedure sarestore;
var p:halfword;begin repeat p:=mem[sachain+1].hh.lh;
if mem[p].hh.b1=1 then begin if mem[p].hh.b0>=32 then sadestroy(sachain)
;ifdef('STAT')if eqtb[29314].int>0 then showsa(p,637);
endif('STAT')end else begin if mem[p].hh.b0<32 then if mem[sachain].hh.
b0<32 then mem[p+2].int:=mem[sachain+2].int else mem[p+2].int:=0 else
begin sadestroy(p);mem[p+1].hh.rh:=mem[sachain+1].hh.rh;end;
mem[p].hh.b1:=mem[sachain].hh.b1;
ifdef('STAT')if eqtb[29314].int>0 then showsa(p,638);endif('STAT')end;
deletesaref(p);p:=sachain;sachain:=mem[p].hh.rh;
if mem[p].hh.b0<32 then freenode(p,3)else freenode(p,2);
until sachain=-268435455;end;
{:1841}{:290}{296:}procedure newsavelevel(c:groupcode);
begin if saveptr>maxsavestack then begin maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(630,savesize);end;
if(eTeXmode=1)then begin savestack[saveptr+0].int:=line;incr(saveptr);
end;savestack[saveptr].hh.b0:=3;savestack[saveptr].hh.b1:=curgroup;
savestack[saveptr].hh.rh:=curboundary;
if curlevel=255 then overflow(631,255);curboundary:=saveptr;curgroup:=c;
ifdef('STAT')if eqtb[29380].int>0 then grouptrace(false);
endif('STAT')incr(curlevel);incr(saveptr);end;
{:296}{297:}procedure eqdestroy(w:memoryword);var q:halfword;
begin case w.hh.b0 of 114,115,116,117:deletetokenref(w.hh.rh);
120:deleteglueref(w.hh.rh);121:begin q:=w.hh.rh;
if q<>-268435455 then freenode(q,mem[q].hh.lh+mem[q].hh.lh+1);end;
122:flushnodelist(w.hh.rh);
{1834:}71,89:if(w.hh.rh<membot)or(w.hh.rh>membot+19)then deletesaref(w.
hh.rh);{:1834}others:end;end;{:297}{298:}procedure eqsave(p:halfword;
l:quarterword);
begin if saveptr>maxsavestack then begin maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(630,savesize);end;
if l=0 then savestack[saveptr].hh.b0:=1 else begin savestack[saveptr]:=
eqtb[p];incr(saveptr);savestack[saveptr].hh.b0:=0;end;
savestack[saveptr].hh.b1:=l;savestack[saveptr].hh.rh:=p;incr(saveptr);
end;{:298}{299:}procedure eqdefine(p:halfword;t:quarterword;e:halfword);
label 10;
begin if(eTeXmode=1)and(eqtb[p].hh.b0=t)and(eqtb[p].hh.rh=e)then begin
ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,632);
endif('STAT')eqdestroy(eqtb[p]);goto 10;end;
ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,633);
endif('STAT')if eqtb[p].hh.b1=curlevel then eqdestroy(eqtb[p])else if
curlevel>1 then eqsave(p,eqtb[p].hh.b1);eqtb[p].hh.b1:=curlevel;
eqtb[p].hh.b0:=t;eqtb[p].hh.rh:=e;
ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,634);
endif('STAT')10:end;{:299}{300:}procedure eqworddefine(p:halfword;
w:integer);label 10;
begin if(eTeXmode=1)and(eqtb[p].int=w)then begin ifdef('STAT')if eqtb[
29379].int>0 then restoretrace(p,632);endif('STAT')goto 10;end;
ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,633);
endif('STAT')if xeqlevel[p]<>curlevel then begin eqsave(p,xeqlevel[p]);
xeqlevel[p]:=curlevel;end;eqtb[p].int:=w;
ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,634);
endif('STAT')10:end;{:300}{301:}procedure geqdefine(p:halfword;
t:quarterword;e:halfword);
begin ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,635);
endif('STAT')begin eqdestroy(eqtb[p]);eqtb[p].hh.b1:=1;eqtb[p].hh.b0:=t;
eqtb[p].hh.rh:=e;end;
ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,634);
endif('STAT')end;procedure geqworddefine(p:halfword;w:integer);
begin ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,635);
endif('STAT')begin eqtb[p].int:=w;xeqlevel[p]:=1;end;
ifdef('STAT')if eqtb[29379].int>0 then restoretrace(p,634);
endif('STAT')end;{:301}{302:}procedure saveforafter(t:halfword);
begin if curlevel>1 then begin if saveptr>maxsavestack then begin
maxsavestack:=saveptr;
if maxsavestack>savesize-7 then overflow(630,savesize);end;
savestack[saveptr].hh.b0:=2;savestack[saveptr].hh.b1:=0;
savestack[saveptr].hh.rh:=t;incr(saveptr);end;end;
{:302}{303:}procedure backinput;forward;procedure unsave;label 30;
var p:halfword;l:quarterword;t:halfword;a:boolean;begin a:=false;
if curlevel>1 then begin decr(curlevel);
{304:}while true do begin decr(saveptr);
if savestack[saveptr].hh.b0=3 then goto 30;p:=savestack[saveptr].hh.rh;
if savestack[saveptr].hh.b0=2 then{348:}begin t:=curtok;curtok:=p;
if a then begin p:=getavail;mem[p].hh.lh:=curtok;
mem[p].hh.rh:=curinput.locfield;curinput.locfield:=p;
curinput.startfield:=p;
if curtok<768 then if curtok<512 then decr(alignstate)else incr(
alignstate);end else begin backinput;a:=(eTeXmode=1);end;curtok:=t;
end{:348}else if savestack[saveptr].hh.b0=4 then begin sarestore;
sachain:=p;salevel:=savestack[saveptr].hh.b1;
end else begin if savestack[saveptr].hh.b0=0 then begin l:=savestack[
saveptr].hh.b1;decr(saveptr);end else savestack[saveptr]:=eqtb[26627];
{305:}if(p<29277)or(p>30192)then if eqtb[p].hh.b1=1 then begin eqdestroy
(savestack[saveptr]);
ifdef('STAT')if eqtb[29314].int>0 then restoretrace(p,637);
endif('STAT')end else begin eqdestroy(eqtb[p]);
eqtb[p]:=savestack[saveptr];
ifdef('STAT')if eqtb[29314].int>0 then restoretrace(p,638);
endif('STAT')end else if xeqlevel[p]<>1 then begin eqtb[p]:=savestack[
saveptr];xeqlevel[p]:=l;
ifdef('STAT')if eqtb[29314].int>0 then restoretrace(p,638);
endif('STAT')end else begin ifdef('STAT')if eqtb[29314].int>0 then
restoretrace(p,637);endif('STAT')end{:305};end;end;
30:ifdef('STAT')if eqtb[29380].int>0 then grouptrace(true);
endif('STAT')if grpstack[inopen]=curboundary then groupwarning;
curgroup:=savestack[saveptr].hh.b1;
curboundary:=savestack[saveptr].hh.rh;
if(eTeXmode=1)then decr(saveptr){:304};end else confusion(636);end;
{:303}{310:}procedure preparemag;
begin if(magset>0)and(eqtb[29294].int<>magset)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(640);
end;printint(eqtb[29294].int);print(641);printnl(642);begin helpptr:=2;
helpline[1]:=643;helpline[0]:=644;end;interror(magset);
geqworddefine(29294,magset);end;
if(eqtb[29294].int<=0)or(eqtb[29294].int>32768)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(645);
end;begin helpptr:=1;helpline[0]:=646;end;interror(eqtb[29294].int);
geqworddefine(29294,1000);end;magset:=eqtb[29294].int;end;
{:310}{317:}procedure tokenshow(p:halfword);
begin if p<>-268435455 then showtokenlist(mem[p].hh.rh,-268435455,
10000000);end;{:317}{318:}procedure printmeaning;
begin printcmdchr(curcmd,curchr);
if curcmd>=114 then begin printchar(58);println;tokenshow(curchr);
end else if(curcmd=113)and(curchr<5)then begin printchar(58);println;
tokenshow(curmark[curchr]);end;end;{:318}{321:}procedure showcurcmdchr;
var n:integer;l:integer;p:halfword;begin begindiagnostic;printnl(123);
if curlist.modefield<>shownmode then begin printmode(curlist.modefield);
print(660);shownmode:=curlist.modefield;end;printcmdchr(curcmd,curchr);
if eqtb[29381].int>0 then if curcmd>=108 then if curcmd<=109 then begin
print(660);if curcmd=109 then begin printcmdchr(108,curif);
printchar(32);n:=0;l:=ifline;end else begin n:=1;l:=line;end;p:=condptr;
while p<>-268435455 do begin incr(n);p:=mem[p].hh.rh;end;print(661);
printint(n);printchar(41);if l<>0 then begin print(2039);printint(l);
end;end;printchar(125);enddiagnostic(false);end;
{:321}{333:}procedure showcontext;label 30;var oldsetting:0..21;
nn:integer;bottomline:boolean;{337:}i:0..bufsize;j:0..bufsize;
l:0..halferrorline;m:integer;n:0..errorline;p:integer;q:integer;
{:337}begin baseptr:=inputptr;inputstack[baseptr]:=curinput;nn:=-1;
bottomline:=false;while true do begin curinput:=inputstack[baseptr];
if(curinput.statefield<>0)then if(curinput.namefield>19)or(baseptr=0)
then bottomline:=true;
if(baseptr=inputptr)or bottomline or(nn<eqtb[29331].int)then{334:}begin
if(baseptr=inputptr)or(curinput.statefield<>0)or(curinput.indexfield<>3)
or(curinput.locfield<>-268435455)then begin tally:=0;
oldsetting:=selector;
if curinput.statefield<>0 then begin{335:}if curinput.namefield<=17 then
if(curinput.namefield=0)then if baseptr=0 then printnl(666)else printnl(
667)else begin printnl(668);
if curinput.namefield=17 then printchar(42)else printint(curinput.
namefield-1);printchar(62);end else begin printnl(669);
if curinput.indexfield=inopen then printint(line)else printint(linestack
[curinput.indexfield+1]);end;printchar(32){:335};{340:}begin l:=tally;
tally:=0;selector:=20;trickcount:=1000000;end;
if buffer[curinput.limitfield]=eqtb[29325].int then j:=curinput.
limitfield else j:=curinput.limitfield+1;i:=curinput.startfield;
mubyteskeep:=mubytekeep;mubytesstart:=mubytestart;mubytestart:=false;
if j>0 then while i<j do begin if i=curinput.locfield then begin
firstcount:=tally;trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;printbuffer(i);
end;mubytekeep:=mubyteskeep;mubytestart:=mubytesstart{:340};
end else begin{336:}case curinput.indexfield of 0:printnl(670);
1,2:printnl(671);
3:if curinput.locfield=-268435455 then printnl(672)else printnl(673);
4:printnl(674);5:begin println;printcs(curinput.namefield);end;
6:printnl(675);7:printnl(676);8:printnl(677);9:printnl(678);
10:printnl(679);11:printnl(680);12:printnl(681);13:printnl(682);
14:printnl(683);19:printnl(684);20:printnl(685);
others:printnl(63)end{:336};{341:}begin l:=tally;tally:=0;selector:=20;
trickcount:=1000000;end;
if curinput.indexfield<5 then showtokenlist(curinput.startfield,curinput
.locfield,100000)else showtokenlist(mem[curinput.startfield].hh.rh,
curinput.locfield,100000){:341};end;selector:=oldsetting;
{339:}if trickcount=1000000 then begin firstcount:=tally;
trickcount:=tally+1+errorline-halferrorline;
if trickcount<errorline then trickcount:=errorline;end;
if tally<trickcount then m:=tally-firstcount else m:=trickcount-
firstcount;if l+firstcount<=halferrorline then begin p:=0;
n:=l+firstcount;end else begin print(277);
p:=l+firstcount-halferrorline+3;n:=halferrorline;end;
for q:=p to firstcount-1 do printchar(trickbuf[q mod errorline]);
println;for q:=1 to n do printchar(32);
if m+n<=errorline then p:=firstcount+m else p:=firstcount+(errorline-n-3
);for q:=firstcount to p-1 do printchar(trickbuf[q mod errorline]);
if m+n>errorline then print(277){:339};incr(nn);end;
end{:334}else if nn=eqtb[29331].int then begin printnl(277);incr(nn);
end;if bottomline then goto 30;decr(baseptr);end;
30:curinput:=inputstack[inputptr];end;
{:333}{345:}procedure begintokenlist(p:halfword;t:quarterword);
begin begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(686,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.statefield:=0;curinput.startfield:=p;curinput.indexfield:=t;
if t>=5 then begin incr(mem[p].hh.lh);
if t=5 then curinput.limitfield:=paramptr else begin curinput.locfield:=
mem[p].hh.rh;if eqtb[29307].int>1 then begin begindiagnostic;
printnl(345);case t of 14:printesc(360);20:printesc(687);
others:printcmdchr(72,t+27153)end;print(648);tokenshow(p);
enddiagnostic(false);end;end;end else curinput.locfield:=p;end;
{:345}{346:}procedure endtokenlist;
begin if curinput.indexfield>=3 then begin if curinput.indexfield<=4
then flushlist(curinput.startfield)else begin deletetokenref(curinput.
startfield);
if curinput.indexfield=5 then while paramptr>curinput.limitfield do
begin decr(paramptr);flushlist(paramstack[paramptr]);
end else if(curinput.indexfield=6)and(not outputcanend)then fatalerror(
688);end;
end else if curinput.indexfield=1 then if alignstate>500000 then
alignstate:=0 else fatalerror(689);begin decr(inputptr);
curinput:=inputstack[inputptr];end;
begin if interrupt<>0 then pauseforinstructions;end;end;
{:346}{347:}procedure backinput;var p:halfword;
begin while(curinput.locfield=-268435455)and(curinput.indexfield<>2)and(
curinput.indexfield<>6)do endtokenlist;p:=getavail;mem[p].hh.lh:=curtok;
if curtok<768 then if curtok<512 then decr(alignstate)else incr(
alignstate);
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(686,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.statefield:=0;curinput.startfield:=p;curinput.indexfield:=3;
curinput.locfield:=p;end;{:347}{349:}procedure backerror;
begin OKtointerrupt:=false;backinput;OKtointerrupt:=true;error;end;
procedure inserror;begin OKtointerrupt:=false;backinput;
curinput.indexfield:=4;OKtointerrupt:=true;error;end;
{:349}{350:}procedure beginfilereading;
begin if inopen=maxinopen then overflow(690,maxinopen);
if first=bufsize then overflow(258,bufsize);incr(inopen);
begin if inputptr>maxinstack then begin maxinstack:=inputptr;
if inputptr=stacksize then overflow(686,stacksize);end;
inputstack[inputptr]:=curinput;incr(inputptr);end;
curinput.indexfield:=inopen;sourcefilenamestack[curinput.indexfield]:=0;
fullsourcefilenamestack[curinput.indexfield]:=0;
eofseen[curinput.indexfield]:=false;
grpstack[curinput.indexfield]:=curboundary;
ifstack[curinput.indexfield]:=condptr;
linestack[curinput.indexfield]:=line;curinput.startfield:=first;
curinput.statefield:=1;curinput.namefield:=0;
{1919:}curinput.synctextagfield:=0;{:1919};end;
{:350}{351:}procedure endfilereading;begin first:=curinput.startfield;
line:=linestack[curinput.indexfield];
if(curinput.namefield=18)or(curinput.namefield=19)then pseudoclose else
if curinput.namefield>17 then aclose(inputfile[curinput.indexfield]);
begin decr(inputptr);curinput:=inputstack[inputptr];end;decr(inopen);
end;{:351}{352:}procedure clearforerrorprompt;
begin while(curinput.statefield<>0)and(curinput.namefield=0)and(inputptr
>0)and(curinput.locfield>curinput.limitfield)do endfilereading;println;;
end;{:352}{354:}{1900:}procedure mubyteupdate;var j:poolpointer;
p:halfword;q:halfword;inmutree:integer;begin j:=strstart[strptr];
if mubyteread[strpool[j]]=-268435455 then begin inmutree:=0;p:=getavail;
mubyteread[strpool[j]]:=p;mem[p].hh.b1:=strpool[j];mem[p].hh.b0:=0;
end else begin inmutree:=1;p:=mubyteread[strpool[j]];end;incr(j);
while j<poolptr do begin if inmutree=0 then begin mem[p].hh.rh:=getavail
;p:=mem[p].hh.rh;mem[p].hh.lh:=getavail;p:=mem[p].hh.lh;
mem[p].hh.b1:=strpool[j];mem[p].hh.b0:=0;
end else if(mem[p].hh.b0>0)and(mem[p].hh.b0<64)then begin mem[p].hh.b0:=
mem[p].hh.b0+64;q:=mem[p].hh.rh;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
mem[p].hh.lh:=q;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
mem[p].hh.lh:=getavail;p:=mem[p].hh.lh;mem[p].hh.b1:=strpool[j];
mem[p].hh.b0:=0;inmutree:=0;
end else begin if mem[p].hh.b0>=64 then p:=mem[p].hh.rh;
repeat p:=mem[p].hh.rh;
if mem[mem[p].hh.lh].hh.b1=strpool[j]then begin p:=mem[p].hh.lh;goto 22;
end;until mem[p].hh.rh=-268435455;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=getavail;p:=mem[p].hh.lh;
mem[p].hh.b1:=strpool[j];mem[p].hh.b0:=0;inmutree:=0;end;22:incr(j);end;
if inmutree=1 then begin if mem[p].hh.b0=0 then begin mem[p].hh.b0:=
mubyteprefix+64;q:=mem[p].hh.rh;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
mem[p].hh.rh:=q;mem[p].hh.lh:=mubytestoken;goto 10;end;
if mem[p].hh.b0>=64 then begin mem[p].hh.b0:=mubyteprefix+64;
p:=mem[p].hh.rh;mem[p].hh.lh:=mubytestoken;goto 10;end;end;
mem[p].hh.b0:=mubyteprefix;mem[p].hh.rh:=mubytestoken;10:end;
procedure disposemunode(p:halfword);var q:halfword;
begin if(mem[p].hh.b0>0)and(mem[p].hh.b0<64)then begin mem[p].hh.rh:=
avail;avail:=p;ifdef('STAT')decr(dynused);
endif('STAT')end else begin if mem[p].hh.b0>=64 then begin q:=mem[p].hh.
rh;begin mem[p].hh.rh:=avail;avail:=p;ifdef('STAT')decr(dynused);
endif('STAT')end;p:=q;end;q:=mem[p].hh.rh;begin mem[p].hh.rh:=avail;
avail:=p;ifdef('STAT')decr(dynused);endif('STAT')end;p:=q;
while p<>-268435455 do begin disposemunode(mem[p].hh.lh);
q:=mem[p].hh.rh;begin mem[p].hh.rh:=avail;avail:=p;
ifdef('STAT')decr(dynused);endif('STAT')end;p:=q;end;end;end;
procedure disposemutableout(cs:halfword);var p,q,r:halfword;
begin p:=mubytecswrite[cs mod 128];r:=-268435455;
while p<>-268435455 do if mem[p].hh.lh=cs then begin if r<>-268435455
then mem[r].hh.rh:=mem[mem[p].hh.rh].hh.rh else mubytecswrite[cs mod 128
]:=mem[mem[p].hh.rh].hh.rh;q:=mem[mem[p].hh.rh].hh.rh;
begin mem[mem[p].hh.rh].hh.rh:=avail;avail:=mem[p].hh.rh;
ifdef('STAT')decr(dynused);endif('STAT')end;begin mem[p].hh.rh:=avail;
avail:=p;ifdef('STAT')decr(dynused);endif('STAT')end;p:=q;
end else begin r:=mem[p].hh.rh;p:=mem[r].hh.rh;end;end;
{:1900}{:354}{358:}procedure checkoutervalidity;var p:halfword;
q:halfword;begin if scannerstatus<>0 then begin deletionsallowed:=false;
{359:}if curcs<>0 then begin if(curinput.statefield=0)or(curinput.
namefield<1)or(curinput.namefield>17)then begin p:=getavail;
mem[p].hh.lh:=4095+curcs;begintokenlist(p,3);end;curcmd:=10;curchr:=32;
end{:359};if scannerstatus>1 then{360:}begin runaway;
if curcs=0 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(698);
end else begin curcs:=0;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(699);
end;end;{361:}p:=getavail;case scannerstatus of 2:begin print(705);
mem[p].hh.lh:=637;end;3:begin print(706);mem[p].hh.lh:=partoken;
longstate:=116;end;4:begin print(707);mem[p].hh.lh:=637;q:=p;
p:=getavail;mem[p].hh.rh:=q;mem[p].hh.lh:=19610;alignstate:=-1000000;
end;5:begin print(708);mem[p].hh.lh:=637;end;end;
begintokenlist(p,4){:361};print(700);sprintcs(warningindex);
begin helpptr:=4;helpline[3]:=701;helpline[2]:=702;helpline[1]:=703;
helpline[0]:=704;end;error;
end{:360}else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(692);
end;printcmdchr(108,curif);print(693);printint(skipline);
begin helpptr:=3;helpline[2]:=694;helpline[1]:=695;helpline[0]:=696;end;
if curcs<>0 then curcs:=0 else helpline[2]:=697;curtok:=19613;inserror;
end;deletionsallowed:=true;end;end;{:358}{362:}procedure firmuptheline;
forward;{:362}{363:}procedure getnext;label 20,25,21,26,40,10;
var k:0..bufsize;t:halfword;i,j:0..bufsize;mubyteincs:boolean;
p:halfword;cat:0..15;c,cc:ASCIIcode;d:2..3;begin 20:curcs:=0;
if curinput.statefield<>0 then{365:}begin 25:if curinput.locfield<=
curinput.limitfield then begin k:=curinput.locfield;
curchr:=readbuffer(k);curinput.locfield:=k;incr(curinput.locfield);
if(mubytetoken>0)then begin curinput.statefield:=1;
curcs:=mubytetoken-4095;goto 40;end;21:curcmd:=eqtb[27741+curchr].hh.rh;
{366:}case curinput.statefield+curcmd of{367:}10,26,42,27,43{:367}:goto
25;
1,17,33:{376:}begin if curinput.locfield>curinput.limitfield then curcs
:=513 else begin 26:mubyteincs:=false;k:=curinput.locfield;
mubyteskeep:=mubytekeep;curchr:=readbuffer(k);
cat:=eqtb[27741+curchr].hh.rh;
if(eqtb[29338].int>0)and(not mubyteincs)and((mubyteskip>0)or(curchr<>
buffer[k]))then mubyteincs:=true;incr(k);
if mubytetoken>0 then begin curinput.statefield:=1;
curcs:=mubytetoken-4095;goto 40;end;
if cat=11 then curinput.statefield:=17 else if cat=10 then curinput.
statefield:=17 else curinput.statefield:=1;
if(cat=11)and(k<=curinput.limitfield)then{378:}begin repeat curchr:=
readbuffer(k);cat:=eqtb[27741+curchr].hh.rh;
if mubytetoken>0 then cat:=0;
if(eqtb[29338].int>0)and(not mubyteincs)and(cat=11)and((mubyteskip>0)or(
curchr<>buffer[k]))then mubyteincs:=true;incr(k);
until(cat<>11)or(k>curinput.limitfield);
{377:}begin if buffer[k]=curchr then if cat=7 then if k<curinput.
limitfield then begin c:=buffer[k+1];if c<128 then begin d:=2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if k+2<=curinput.
limitfield then begin cc:=buffer[k+2];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then incr(d);end;
if d>2 then begin if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
buffer[k-1]:=curchr;
end else if c<64 then buffer[k-1]:=c+64 else buffer[k-1]:=c-64;
curinput.limitfield:=curinput.limitfield-d;first:=first-d;
if eqtb[29338].int>0 then mubytekeep:=k-curinput.locfield;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end;end;end{:377};if cat<>11 then begin decr(k);
k:=k-mubyteskip;end;
if k>curinput.locfield+1 then begin if mubyteincs then begin i:=curinput
.locfield;j:=first;mubytekeep:=mubyteskeep;
if j-curinput.locfield+k>maxbufstack then begin maxbufstack:=j-curinput.
locfield+k;if maxbufstack>=bufsize then begin maxbufstack:=bufsize;
overflow(258,bufsize);end;end;
while i<k do begin buffer[j]:=readbuffer(i);incr(i);incr(j);end;
if j=first+1 then curcs:=257+buffer[first]else curcs:=idlookup(first,j-
first);end else curcs:=idlookup(curinput.locfield,k-curinput.locfield);
curinput.locfield:=k;goto 40;end;
end{:378}else{377:}begin if buffer[k]=curchr then if cat=7 then if k<
curinput.limitfield then begin c:=buffer[k+1];if c<128 then begin d:=2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if k+2<=curinput.
limitfield then begin cc:=buffer[k+2];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then incr(d);end;
if d>2 then begin if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
buffer[k-1]:=curchr;
end else if c<64 then buffer[k-1]:=c+64 else buffer[k-1]:=c-64;
curinput.limitfield:=curinput.limitfield-d;first:=first-d;
if eqtb[29338].int>0 then mubytekeep:=k-curinput.locfield;
while k<=curinput.limitfield do begin buffer[k]:=buffer[k+d];incr(k);
end;goto 26;end;end;end{:377};mubytekeep:=mubyteskeep;
curcs:=257+readbuffer(curinput.locfield);incr(curinput.locfield);end;
40:curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;
if curcmd>=116 then checkoutervalidity;
if writenoexpanding then begin p:=mubytecswrite[curcs mod 128];
while p<>-268435455 do if mem[p].hh.lh=curcs then begin curcmd:=0;
curchr:=256;p:=-268435455;end else p:=mem[mem[p].hh.rh].hh.rh;end;
end{:376};14,30,46:{375:}begin curcs:=curchr+1;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;
curinput.statefield:=1;if curcmd>=116 then checkoutervalidity;end{:375};
8,24,40:{374:}begin if curchr=buffer[curinput.locfield]then if curinput.
locfield<curinput.limitfield then begin c:=buffer[curinput.locfield+1];
if c<128 then begin curinput.locfield:=curinput.locfield+2;
if(((c>=48)and(c<=57))or((c>=97)and(c<=102)))then if curinput.locfield<=
curinput.limitfield then begin cc:=buffer[curinput.locfield];
if(((cc>=48)and(cc<=57))or((cc>=97)and(cc<=102)))then begin incr(
curinput.locfield);if c<=57 then curchr:=c-48 else curchr:=c-87;
if cc<=57 then curchr:=16*curchr+cc-48 else curchr:=16*curchr+cc-87;
goto 21;end;end;if c<64 then curchr:=c+64 else curchr:=c-64;goto 21;end;
end;curinput.statefield:=1;end{:374};
16,32,48:{368:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(709);
end;begin helpptr:=2;helpline[1]:=710;helpline[0]:=711;end;
deletionsallowed:=false;error;deletionsallowed:=true;goto 20;end{:368};
{369:}11:{371:}begin curinput.statefield:=17;curchr:=32;end{:371};
6:{370:}begin curinput.locfield:=curinput.limitfield+1;curcmd:=10;
curchr:=32;end{:370};
22,15,31,47:{372:}begin curinput.locfield:=curinput.limitfield+1;
goto 25;end{:372};
38:{373:}begin curinput.locfield:=curinput.limitfield+1;curcs:=parloc;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;
if curcmd>=116 then checkoutervalidity;end{:373};2:incr(alignstate);
18,34:begin curinput.statefield:=1;incr(alignstate);end;
3:decr(alignstate);19,35:begin curinput.statefield:=1;decr(alignstate);
end;20,21,23,25,28,29,36,37,39,41,44,45:curinput.statefield:=1;
{:369}others:end{:366};end else begin curinput.statefield:=33;
{382:}if curinput.namefield>17 then{384:}begin incr(line);
first:=curinput.startfield;
if not forceeof then if curinput.namefield<=19 then begin if pseudoinput
then firmuptheline else if(eqtb[27172].hh.rh<>-268435455)and not eofseen
[curinput.indexfield]then begin curinput.limitfield:=first-1;
eofseen[curinput.indexfield]:=true;begintokenlist(eqtb[27172].hh.rh,19);
goto 20;end else forceeof:=true;
end else begin if inputln(inputfile[curinput.indexfield],true)then
firmuptheline else if(eqtb[27172].hh.rh<>-268435455)and not eofseen[
curinput.indexfield]then begin curinput.limitfield:=first-1;
eofseen[curinput.indexfield]:=true;begintokenlist(eqtb[27172].hh.rh,19);
goto 20;end else forceeof:=true;end;
if forceeof then begin if eqtb[29383].int>0 then if(grpstack[inopen]<>
curboundary)or(ifstack[inopen]<>condptr)then filewarning;
if curinput.namefield>=19 then begin printchar(41);decr(openparens);
fflush(stdout);end;forceeof:=false;endfilereading;checkoutervalidity;
goto 20;end;
if(eqtb[29325].int<0)or(eqtb[29325].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[29325].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end{:384}else begin if not(curinput.namefield=0)then begin curcmd:=0;
curchr:=0;goto 10;end;if inputptr>0 then begin endfilereading;goto 20;
end;if selector<18 then openlogfile;
if interaction>1 then begin if(eqtb[29325].int<0)or(eqtb[29325].int>255)
then incr(curinput.limitfield);
if curinput.limitfield=curinput.startfield then printnl(713);println;
first:=curinput.startfield;begin;print(42);terminput;end;
curinput.limitfield:=last;
if(eqtb[29325].int<0)or(eqtb[29325].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[29325].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end else fatalerror(714);end{:382};
begin if interrupt<>0 then pauseforinstructions;end;goto 25;end;
end{:365}else{379:}if curinput.locfield<>-268435455 then begin t:=mem[
curinput.locfield].hh.lh;
curinput.locfield:=mem[curinput.locfield].hh.rh;
if t>=4095 then begin curcs:=t-4095;curcmd:=eqtb[curcs].hh.b0;
curchr:=eqtb[curcs].hh.rh;
if curcmd>=116 then if curcmd=119 then{380:}begin curcs:=mem[curinput.
locfield].hh.lh-4095;curinput.locfield:=-268435455;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;
if curcmd>103 then begin curcmd:=0;curchr:=257;end;
end{:380}else begin if(curcs=15522)and(curlist.modefield=0)then
fatalerror(712);checkoutervalidity;end;
if writenoexpanding then begin p:=mubytecswrite[curcs mod 128];
while p<>-268435455 do if mem[p].hh.lh=curcs then begin curcmd:=0;
curchr:=256;p:=-268435455;end else p:=mem[mem[p].hh.rh].hh.rh;end;
end else begin curcmd:=t div 256;curchr:=t mod 256;
case curcmd of 1:incr(alignstate);2:decr(alignstate);
5:{381:}begin begintokenlist(paramstack[curinput.limitfield+curchr-1],0)
;goto 20;end{:381};others:end;end;end else begin endtokenlist;goto 20;
end{:379};
{364:}if curcmd<=5 then if curcmd>=4 then if alignstate=0 then{965:}
begin if(scannerstatus=4)or(curalign=-268435455)then fatalerror(689);
curcmd:=mem[curalign+5].hh.lh;mem[curalign+5].hh.lh:=curchr;
if curcmd=63 then begintokenlist(memtop-10,2)else begintokenlist(mem[
curalign+2].int,2);alignstate:=1000000;goto 20;end{:965}{:364};10:end;
{:363}{385:}procedure firmuptheline;var k:0..bufsize;
begin curinput.limitfield:=last;
if eqtb[29305].int>0 then if interaction>1 then begin;println;
k:=curinput.startfield;
while k<curinput.limitfield do begin printbuffer(k)end;
first:=curinput.limitfield;begin;print(715);terminput;end;
if last>first then begin for k:=first to last-1 do buffer[k+curinput.
startfield-first]:=buffer[k];
curinput.limitfield:=curinput.startfield+last-first;end;end;end;
{:385}{387:}procedure gettoken;begin nonewcontrolsequence:=false;
getnext;nonewcontrolsequence:=true;
if curcs=0 then curtok:=(curcmd*256)+curchr else curtok:=4095+curcs;end;
{:387}{388:}{415:}procedure macrocall;label 10,22,30,31,40;
var r:halfword;p:halfword;q:halfword;s:halfword;t:halfword;u,v:halfword;
rbraceptr:halfword;n:smallnumber;unbalance:halfword;m:halfword;
refcount:halfword;savescannerstatus:smallnumber;
savewarningindex:halfword;matchchr:ASCIIcode;
begin savescannerstatus:=scannerstatus;savewarningindex:=warningindex;
warningindex:=curcs;refcount:=curchr;r:=mem[refcount].hh.rh;n:=0;
if eqtb[29307].int>0 then{427:}begin begindiagnostic;
if eqtb[29335].int>0 then if inputptr<eqtb[29335].int then begin v:=
inputptr;println;printchar(126);while v>0 do begin printchar(46);
decr(v);end;printcs(warningindex);tokenshow(refcount);
end else begin printchar(126);printchar(126);printcs(warningindex);
end else begin println;printcs(warningindex);tokenshow(refcount);end;
enddiagnostic(false);end{:427};
if mem[r].hh.lh=3585 then r:=mem[r].hh.rh;
if mem[r].hh.lh<>3584 then{417:}begin scannerstatus:=3;unbalance:=0;
longstate:=eqtb[curcs].hh.b0;
if longstate>=116 then longstate:=longstate-2;
repeat mem[memtop-3].hh.rh:=-268435455;
if(mem[r].hh.lh>3583)or(mem[r].hh.lh<3328)then s:=-268435455 else begin
matchchr:=mem[r].hh.lh-3328;s:=mem[r].hh.rh;r:=s;p:=memtop-3;m:=0;end;
{418:}22:gettoken;
if curtok=mem[r].hh.lh then{420:}begin r:=mem[r].hh.rh;
if(mem[r].hh.lh>=3328)and(mem[r].hh.lh<=3584)then begin if curtok<512
then decr(alignstate);goto 40;end else goto 22;end{:420};
{423:}if s<>r then if s=-268435455 then{424:}begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(264);
print(748);end;sprintcs(warningindex);print(749);begin helpptr:=4;
helpline[3]:=750;helpline[2]:=751;helpline[1]:=752;helpline[0]:=753;end;
error;goto 10;end{:424}else begin t:=s;repeat begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=mem[t].hh.lh;p:=q;end;incr(m);
u:=mem[t].hh.rh;v:=s;
while true do begin if u=r then if curtok<>mem[v].hh.lh then goto 30
else begin r:=mem[v].hh.rh;goto 22;end;
if mem[u].hh.lh<>mem[v].hh.lh then goto 30;u:=mem[u].hh.rh;
v:=mem[v].hh.rh;end;30:t:=mem[t].hh.rh;until t=r;r:=s;end{:423};
if curtok=partoken then if longstate<>115 then{422:}begin if longstate=
114 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(743);
end;sprintcs(warningindex);print(744);begin helpptr:=3;helpline[2]:=745;
helpline[1]:=746;helpline[0]:=747;end;backerror;end;
pstack[n]:=mem[memtop-3].hh.rh;alignstate:=alignstate-unbalance;
for m:=0 to n do flushlist(pstack[m]);goto 10;end{:422};
if curtok<768 then if curtok<512 then{425:}begin unbalance:=1;
while true do begin begin begin q:=avail;
if q=-268435455 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-268435455;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;gettoken;
if curtok=partoken then if longstate<>115 then{422:}begin if longstate=
114 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(743);
end;sprintcs(warningindex);print(744);begin helpptr:=3;helpline[2]:=745;
helpline[1]:=746;helpline[0]:=747;end;backerror;end;
pstack[n]:=mem[memtop-3].hh.rh;alignstate:=alignstate-unbalance;
for m:=0 to n do flushlist(pstack[m]);goto 10;end{:422};
if curtok<768 then if curtok<512 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 31;end;end;31:rbraceptr:=p;
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;
end{:425}else{421:}begin backinput;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(735);
end;sprintcs(warningindex);print(736);begin helpptr:=6;helpline[5]:=737;
helpline[4]:=738;helpline[3]:=739;helpline[2]:=740;helpline[1]:=741;
helpline[0]:=742;end;incr(alignstate);longstate:=114;curtok:=partoken;
inserror;goto 22;
end{:421}else{419:}begin if curtok=2592 then if mem[r].hh.lh<=3584 then
if mem[r].hh.lh>=3328 then goto 22;begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end{:419};incr(m);
if mem[r].hh.lh>3584 then goto 22;if mem[r].hh.lh<3328 then goto 22;
40:if s<>-268435455 then{426:}begin if(m=1)and(mem[p].hh.lh<768)then
begin mem[rbraceptr].hh.rh:=-268435455;begin mem[p].hh.rh:=avail;
avail:=p;ifdef('STAT')decr(dynused);endif('STAT')end;
p:=mem[memtop-3].hh.rh;pstack[n]:=mem[p].hh.rh;
begin mem[p].hh.rh:=avail;avail:=p;ifdef('STAT')decr(dynused);
endif('STAT')end;end else pstack[n]:=mem[memtop-3].hh.rh;incr(n);
if eqtb[29307].int>0 then if(eqtb[29335].int=0)or(inputptr<eqtb[29335].
int)then begin begindiagnostic;printnl(matchchr);printint(n);print(754);
showtokenlist(pstack[n-1],-268435455,1000);enddiagnostic(false);end;
end{:426}{:418};until mem[r].hh.lh=3584;end{:417};
{416:}while(curinput.locfield=-268435455)and(curinput.indexfield<>2)and(
curinput.indexfield<>6)do endtokenlist;begintokenlist(refcount,5);
curinput.namefield:=warningindex;curinput.locfield:=mem[r].hh.rh;
if n>0 then begin if paramptr+n>maxparamstack then begin maxparamstack:=
paramptr+n;if maxparamstack>paramsize then overflow(734,paramsize);end;
for m:=0 to n-1 do paramstack[paramptr+m]:=pstack[m];
paramptr:=paramptr+n;end{:416};10:scannerstatus:=savescannerstatus;
warningindex:=savewarningindex;end;{:415}{405:}procedure insertrelax;
begin curtok:=4095+curcs;backinput;curtok:=19616;backinput;
curinput.indexfield:=4;end;{:405}{1752:}procedure pseudostart;forward;
{:1752}{1810:}procedure scanregisternum;forward;
{:1810}{1815:}procedure newindex(i:quarterword;q:halfword);
var k:smallnumber;begin curptr:=getnode(9);mem[curptr].hh.b0:=i;
mem[curptr].hh.b1:=0;mem[curptr].hh.rh:=q;
for k:=1 to 8 do mem[curptr+k]:=sanull;end;
{:1815}{1819:}procedure findsaelement(t:smallnumber;n:halfword;
w:boolean);label 45,46,47,48,49,10;var q:halfword;i:smallnumber;
begin curptr:=saroot[t];
begin if curptr=-268435455 then if w then goto 45 else goto 10;end;
q:=curptr;i:=n div 4096;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-268435455 then if w then goto 46 else goto 10;end;
q:=curptr;i:=(n div 256)mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-268435455 then if w then goto 47 else goto 10;end;
q:=curptr;i:=(n div 16)mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;
begin if curptr=-268435455 then if w then goto 48 else goto 10;end;
q:=curptr;i:=n mod 16;
if odd(i)then curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div
2)+1].hh.lh;if(curptr=-268435455)and w then goto 49;goto 10;
45:newindex(t,-268435455);saroot[t]:=curptr;q:=curptr;i:=n div 4096;
46:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;
i:=(n div 256)mod 16;47:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;i:=(n div 16)mod 16;
48:newindex(i,q);
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;q:=curptr;i:=n mod 16;
49:{1820:}if t=6 then begin curptr:=getnode(4);mem[curptr+1]:=sanull;
mem[curptr+2]:=sanull;mem[curptr+3]:=sanull;
end else begin if t<=1 then begin curptr:=getnode(3);
mem[curptr+2].int:=0;mem[curptr+1].hh.rh:=n;
end else begin curptr:=getnode(2);
if t<=3 then begin mem[curptr+1].hh.rh:=membot;incr(mem[membot].hh.rh);
end else mem[curptr+1].hh.rh:=-268435455;end;
mem[curptr+1].hh.lh:=-268435455;end;mem[curptr].hh.b0:=16*t+i;
mem[curptr].hh.b1:=1{:1820};mem[curptr].hh.rh:=q;
begin if odd(i)then mem[q+(i div 2)+1].hh.rh:=curptr else mem[q+(i div 2
)+1].hh.lh:=curptr;incr(mem[q].hh.b1);end;10:end;
{:1819}procedure passtext;forward;procedure startinput;forward;
procedure conditional;forward;procedure getxtoken;forward;
procedure convtoks;forward;procedure insthetoks;forward;
procedure expand;label 21;var t:halfword;b:boolean;p,q,r:halfword;
j:0..bufsize;cvbackup:integer;
cvlbackup,radixbackup,cobackup:smallnumber;backupbackup:halfword;
savescannerstatus:smallnumber;begin incr(expanddepthcount);
if expanddepthcount>=expanddepth then overflow(716,expanddepth);
cvbackup:=curval;cvlbackup:=curvallevel;radixbackup:=radix;
cobackup:=curorder;backupbackup:=mem[memtop-13].hh.rh;
21:if curcmd<114 then{391:}begin if eqtb[29313].int>1 then showcurcmdchr
;case curcmd of 113:{412:}begin t:=curchr mod 5;
if curchr>=5 then scanregisternum else curval:=0;
if curval=0 then curptr:=curmark[t]else{1824:}begin findsaelement(6,
curval,false);
if curptr<>-268435455 then if odd(t)then curptr:=mem[curptr+(t div 2)+1]
.hh.rh else curptr:=mem[curptr+(t div 2)+1].hh.lh;end{:1824};
if curptr<>-268435455 then begintokenlist(curptr,14);end{:412};
105:if curchr=0 then{392:}begin gettoken;t:=curtok;gettoken;
if curcmd>103 then expand else backinput;curtok:=t;backinput;
end{:392}else{1765:}begin gettoken;
if(curcmd=108)and(curchr<>16)then begin curchr:=curchr+32;goto 21;end;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(797);
end;printesc(940);print(2068);printcmdchr(curcmd,curchr);printchar(39);
begin helpptr:=1;helpline[0]:=711;end;backerror;end{:1765};
106:if curchr=0 then{393:}begin savescannerstatus:=scannerstatus;
scannerstatus:=0;gettoken;scannerstatus:=savescannerstatus;t:=curtok;
backinput;if(t>=4095)and(t<>19617)then begin p:=getavail;
mem[p].hh.lh:=19618;mem[p].hh.rh:=curinput.locfield;
curinput.startfield:=p;curinput.locfield:=p;end;
end{:393}else{394:}begin savescannerstatus:=scannerstatus;
scannerstatus:=0;gettoken;scannerstatus:=savescannerstatus;
if curcs<514 then curcs:=primlookup(curcs-257)else curcs:=primlookup(
hash[curcs].rh);if curcs<>0 then begin t:=eqtb[15526+curcs].hh.b0;
if t>103 then begin curcmd:=t;curchr:=eqtb[15526+curcs].hh.rh;
curtok:=(curcmd*256)+curchr;curcs:=0;goto 21;end else begin backinput;
p:=getavail;mem[p].hh.lh:=19620;mem[p].hh.rh:=curinput.locfield;
curinput.locfield:=p;curinput.startfield:=p;end;end;end{:394};
110:{398:}begin r:=getavail;p:=r;b:=isincsname;isincsname:=true;
repeat getxtoken;if curcs=0 then begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;until curcs<>0;
if(curcmd<>67)or(curchr<>0)then{399:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(723);
end;printesc(590);print(724);begin helpptr:=2;helpline[1]:=725;
helpline[0]:=726;end;backerror;end{:399};isincsname:=b;{400:}j:=first;
p:=mem[r].hh.rh;
while p<>-268435455 do begin if j>=maxbufstack then begin maxbufstack:=j
+1;if maxbufstack=bufsize then overflow(258,bufsize);end;
buffer[j]:=mem[p].hh.lh mod 256;incr(j);p:=mem[p].hh.rh;end;
if j>first+1 then begin nonewcontrolsequence:=false;
curcs:=idlookup(first,j-first);nonewcontrolsequence:=true;
end else if j=first then curcs:=513 else curcs:=257+buffer[first]{:400};
flushlist(r);if eqtb[curcs].hh.b0=104 then begin eqdefine(curcs,0,256);
end;curtok:=curcs+4095;backinput;end{:398};111:convtoks;112:insthetoks;
108:conditional;
109:{536:}begin if eqtb[29381].int>0 then if eqtb[29313].int<=1 then
showcurcmdchr;
if curchr>iflimit then if iflimit=1 then insertrelax else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(944);
end;printcmdchr(109,curchr);begin helpptr:=1;helpline[0]:=945;end;error;
end else begin while curchr<>2 do passtext;
{522:}begin if ifstack[inopen]=condptr then ifwarning;p:=condptr;
ifline:=mem[p+1].int;curif:=mem[p].hh.b1;iflimit:=mem[p].hh.b0;
condptr:=mem[p].hh.rh;freenode(p,2);end{:522};end;end{:536};
107:{404:}if curchr=1 then forceeof:=true{1749:}else if curchr=2 then
pseudostart{:1749}else if nameinprogress then insertrelax else
startinput{:404};others:{396:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(717);
end;begin helpptr:=5;helpline[4]:=718;helpline[3]:=719;helpline[2]:=720;
helpline[1]:=721;helpline[0]:=722;end;error;end{:396}end;
end{:391}else if curcmd<118 then macrocall else{401:}begin curtok:=19615
;backinput;end{:401};curval:=cvbackup;curvallevel:=cvlbackup;
radix:=radixbackup;curorder:=cobackup;
mem[memtop-13].hh.rh:=backupbackup;decr(expanddepthcount);end;
{:388}{406:}procedure getxtoken;label 20,30;begin 20:getnext;
if curcmd<=103 then goto 30;
if curcmd>=114 then if curcmd<118 then macrocall else begin curcs:=15520
;curcmd:=9;goto 30;end else expand;goto 20;
30:if curcs=0 then curtok:=(curcmd*256)+curchr else curtok:=4095+curcs;
end;{:406}{407:}procedure xtoken;begin while curcmd>103 do begin expand;
getnext;end;
if curcs=0 then curtok:=(curcmd*256)+curchr else curtok:=4095+curcs;end;
{:407}{429:}procedure scanleftbrace;begin{430:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:430};
if curcmd<>1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(755);
end;begin helpptr:=4;helpline[3]:=756;helpline[2]:=757;helpline[1]:=758;
helpline[0]:=759;end;backerror;curtok:=379;curcmd:=1;curchr:=123;
incr(alignstate);end;end;{:429}{431:}procedure scanoptionalequals;
begin{432:}repeat getxtoken;until curcmd<>10{:432};
if curtok<>3133 then backinput;end;
{:431}{433:}function scankeyword(s:strnumber):boolean;label 10;
var p:halfword;q:halfword;k:poolpointer;savecurcs:halfword;
begin p:=memtop-13;mem[p].hh.rh:=-268435455;k:=strstart[s];
savecurcs:=curcs;while k<strstart[s+1]do begin getxtoken;
if(curcs=0)and((curchr=strpool[k])or(curchr=strpool[k]-32))then begin
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;incr(k);
end else if(curcmd<>10)or(p<>memtop-13)then begin backinput;
if p<>memtop-13 then begintokenlist(mem[memtop-13].hh.rh,3);
curcs:=savecurcs;scankeyword:=false;goto 10;end;end;
flushlist(mem[memtop-13].hh.rh);scankeyword:=true;10:end;
{:433}{434:}procedure muerror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(760);
end;begin helpptr:=1;helpline[0]:=761;end;error;end;
{:434}{435:}procedure scanint;forward;{459:}procedure scaneightbitint;
begin scanint;
if(curval<0)or(curval>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(799);
end;begin helpptr:=2;helpline[1]:=800;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;{:459}{460:}procedure scancharnum;
begin scanint;
if(curval<0)or(curval>255)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(802);
end;begin helpptr:=2;helpline[1]:=803;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;{:460}{461:}procedure scanfourbitint;
begin scanint;
if(curval<0)or(curval>15)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(804);
end;begin helpptr:=2;helpline[1]:=805;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;
{:461}{462:}procedure scanfifteenbitint;begin scanint;
if(curval<0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(806);
end;begin helpptr:=2;helpline[1]:=807;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;
{:462}{463:}procedure scantwentysevenbitint;begin scanint;
if(curval<0)or(curval>134217727)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(808);
end;begin helpptr:=2;helpline[1]:=809;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;
{:463}{1811:}procedure scanregisternum;begin scanint;
if(curval<0)or(curval>maxregnum)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(799);
end;begin helpptr:=2;helpline[1]:=maxreghelpline;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;
{:1811}{1873:}procedure scanfourbitintor18;begin scanint;
if(curval<0)or((curval>15)and(curval<>18))then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(804);
end;begin helpptr:=2;helpline[1]:=805;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;
{:1873}{1682:}procedure scangeneraltext;forward;
{:1682}{1772:}procedure getxorprotected;label 10;
begin while true do begin gettoken;if curcmd<=103 then goto 10;
if(curcmd>=114)and(curcmd<118)then if mem[mem[curchr].hh.rh].hh.lh=3585
then goto 10;expand;end;10:end;{:1772}{1781:}procedure scanexpr;forward;
{:1781}{1786:}procedure scannormalglue;forward;procedure scanmuglue;
forward;{:1786}{1884:}function effectivechar(errp:boolean;
f:internalfontnumber;c:quarterword):integer;label 40;var basec:integer;
result:integer;begin result:=c;if not mltexenabledp then goto 40;
if fontec[f]>=c then if fontbc[f]<=c then if(fontinfo[charbase[f]+c].
qqqq.b0>0)then goto 40;
if c>=eqtb[29332].int then if c<=eqtb[29333].int then if(eqtb[29021+c].
hh.rh>0)then begin basec:=(eqtb[29021+c].hh.rh mod 256);result:=basec;
if not errp then goto 40;
if fontec[f]>=basec then if fontbc[f]<=basec then if(fontinfo[charbase[f
]+basec].qqqq.b0>0)then goto 40;end;if errp then begin begindiagnostic;
printnl(998);print(2101);print(c);print(999);slowprint(fontname[f]);
printchar(33);enddiagnostic(false);result:=fontbc[f];end;
40:effectivechar:=result;end;
{:1884}{604:}function testnoligatures(f:internalfontnumber):integer;
label 10;var c:integer;begin testnoligatures:=1;
for c:=fontbc[f]to fontec[f]do if(fontinfo[charbase[f]+c].qqqq.b0>0)then
if odd(((fontinfo[charbase[f]+c].qqqq.b2)mod 4))then begin
testnoligatures:=0;goto 10;end;10:end;
function gettagcode(f:internalfontnumber;c:eightbits):integer;
var i:smallnumber;
begin if((fontbc[f]<=c)and(c<=fontec[f])and(fontinfo[charbase[f]+c].qqqq
.b0>0))then begin i:=((fontinfo[charbase[f]+c].qqqq.b2)mod 4);
if i=1 then gettagcode:=1 else if i=2 then gettagcode:=2 else if i=3
then gettagcode:=4 else gettagcode:=0;end else gettagcode:=-1;end;
procedure scanfontident;var f:internalfontnumber;m:halfword;
begin{432:}repeat getxtoken;until curcmd<>10{:432};
if(curcmd=88)or(curcmd=101)or(curcmd=102)then f:=eqtb[27689].hh.rh else
if curcmd=87 then f:=curchr else if curcmd=86 then begin m:=curchr;
scanfourbitint;f:=eqtb[m+curval].hh.rh;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(990);
end;begin helpptr:=2;helpline[1]:=991;helpline[0]:=992;end;backerror;
f:=0;end;curval:=f;end;
{:604}{605:}procedure findfontdimen(writing:boolean);
var f:internalfontnumber;n:integer;begin scanint;n:=curval;
scanfontident;f:=curval;
if n<=0 then curval:=fmemptr else begin if writing and(n<=4)and(n>=2)and
(fontglue[f]<>-268435455)then begin deleteglueref(fontglue[f]);
fontglue[f]:=-268435455;end;
if n>fontparams[f]then if f<fontptr then curval:=fmemptr else{607:}begin
repeat if fmemptr=fontmemsize then overflow(997,fontmemsize);
fontinfo[fmemptr].int:=0;incr(fmemptr);incr(fontparams[f]);
until n=fontparams[f];curval:=fmemptr-1;
end{:607}else curval:=n+parambase[f];end;
{606:}if curval=fmemptr then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(970);
end;printesc(hash[17626+f].rh);print(993);printint(fontparams[f]);
print(994);begin helpptr:=2;helpline[1]:=995;helpline[0]:=996;end;error;
end{:606};end;
{:605}{:435}{439:}procedure scansomethinginternal(level:smallnumber;
negative:boolean);label 10,20;var m:halfword;n,k:integer;q,r:halfword;
tx:halfword;i:fourquarters;p:0..nestsize;begin 20:m:=curchr;
case curcmd of 85:{440:}begin scancharnum;
if m=27690 then begin curval:=xord[curval];curvallevel:=0;
end else if m=27691 then begin curval:=xchr[curval];curvallevel:=0;
end else if m=27692 then begin curval:=xprn[curval];curvallevel:=0;
end else if m=28765 then begin curval:=eqtb[28765+curval].hh.rh;
curvallevel:=0;
end else if m<28765 then begin curval:=eqtb[m+curval].hh.rh;
curvallevel:=0;end else begin curval:=eqtb[m+curval].int;curvallevel:=0;
end;end{:440};
71,72,86,87,88,101,102:{441:}if level<>5 then begin begin if interaction
=3 then;if filelineerrorstylep then printfileline else printnl(264);
print(762);end;begin helpptr:=3;helpline[2]:=763;helpline[1]:=764;
helpline[0]:=765;end;backerror;begin curval:=0;curvallevel:=1;end;
end else if curcmd<=72 then begin if curcmd<72 then if m=membot then
begin scanregisternum;
if curval<256 then curval:=eqtb[27173+curval].hh.rh else begin
findsaelement(5,curval,false);
if curptr=-268435455 then curval:=-268435455 else curval:=mem[curptr+1].
hh.rh;end;end else curval:=mem[m+1].hh.rh else curval:=eqtb[m].hh.rh;
curvallevel:=5;end else begin backinput;scanfontident;
begin curval:=17626+curval;curvallevel:=4;end;end{:441};
73:begin curval:=eqtb[m].int;curvallevel:=0;end;
74:begin curval:=eqtb[m].int;curvallevel:=1;end;
75:begin curval:=eqtb[m].hh.rh;curvallevel:=2;end;
76:begin curval:=eqtb[m].hh.rh;curvallevel:=3;end;
79:{444:}if abs(curlist.modefield)<>m then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(264);
print(792);end;printcmdchr(79,m);begin helpptr:=4;helpline[3]:=793;
helpline[2]:=794;helpline[1]:=795;helpline[0]:=796;end;error;
if level<>5 then begin curval:=0;curvallevel:=1;
end else begin curval:=0;curvallevel:=0;end;
end else if m=1 then begin curval:=curlist.auxfield.int;curvallevel:=1;
end else begin curval:=curlist.auxfield.hh.lh;curvallevel:=0;end{:444};
80:{448:}if curlist.modefield=0 then begin curval:=0;curvallevel:=0;
end else begin nest[nestptr]:=curlist;p:=nestptr;
while abs(nest[p].modefield)<>1 do decr(p);
begin curval:=nest[p].pgfield;curvallevel:=0;end;end{:448};
82:{445:}begin if m=0 then curval:=deadcycles{1694:}else if m=2 then
curval:=interaction{:1694}else curval:=insertpenalties;curvallevel:=0;
end{:445};
81:{447:}begin if(pagecontents=0)and(not outputactive)then if m=0 then
curval:=1073741823 else curval:=0 else curval:=pagesofar[m];
curvallevel:=1;end{:447};
84:{449:}begin if m>27158 then{1866:}begin scanint;
if(eqtb[m].hh.rh=-268435455)or(curval<0)then curval:=0 else begin if
curval>mem[eqtb[m].hh.rh+1].int then curval:=mem[eqtb[m].hh.rh+1].int;
curval:=mem[eqtb[m].hh.rh+curval+1].int;end;
end{:1866}else if eqtb[27158].hh.rh=-268435455 then curval:=0 else
curval:=mem[eqtb[27158].hh.rh].hh.lh;curvallevel:=0;end{:449};
83:{446:}begin scanregisternum;
if curval<256 then q:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then q:=-268435455 else q:=mem[curptr+1].hh.rh;end;
if q=-268435455 then curval:=0 else curval:=mem[q+m].int;curvallevel:=1;
end{:446};68,69:begin curval:=curchr;curvallevel:=0;end;
77:{451:}begin findfontdimen(false);fontinfo[fmemptr].int:=0;
begin curval:=fontinfo[curval].int;curvallevel:=1;end;end{:451};
78:{452:}begin scanfontident;
if m=0 then begin curval:=hyphenchar[curval];curvallevel:=0;
end else if m=1 then begin curval:=skewchar[curval];curvallevel:=0;
end else if m=6 then begin curval:=testnoligatures(curval);
curvallevel:=0;end else begin n:=curval;scancharnum;k:=curval;
case m of 2:begin curval:=getlpcode(n,k);curvallevel:=0;end;
3:begin curval:=getrpcode(n,k);curvallevel:=0;end;
4:begin curval:=getefcode(n,k);curvallevel:=0;end;
5:begin curval:=gettagcode(n,k);curvallevel:=0;end;
7:begin curval:=getknbscode(n,k);curvallevel:=0;end;
8:begin curval:=getstbscode(n,k);curvallevel:=0;end;
9:begin curval:=getshbscode(n,k);curvallevel:=0;end;
10:begin curval:=getknbccode(n,k);curvallevel:=0;end;
11:begin curval:=getknaccode(n,k);curvallevel:=0;end;end;end;end{:452};
89:{453:}begin if(m<membot)or(m>membot+19)then begin curvallevel:=(mem[m
].hh.b0 div 16);
if curvallevel<2 then curval:=mem[m+2].int else curval:=mem[m+1].hh.rh;
end else begin scanregisternum;curvallevel:=m-membot;
if curval>255 then begin findsaelement(curvallevel,curval,false);
if curptr=-268435455 then if curvallevel<2 then curval:=0 else curval:=
membot else if curvallevel<2 then curval:=mem[curptr+2].int else curval
:=mem[curptr+1].hh.rh;
end else case curvallevel of 0:curval:=eqtb[29391+curval].int;
1:curval:=eqtb[29937+curval].int;2:curval:=eqtb[26646+curval].hh.rh;
3:curval:=eqtb[26902+curval].hh.rh;end;end;end{:453};
70:{450:}if m>=4 then if m>=37 then{1780:}begin if m<38 then begin case
m of{1807:}37:scanmuglue;{:1807}end;curvallevel:=2;
end else if m<39 then begin case m of{1808:}38:scannormalglue;
{:1808}end;curvallevel:=3;end else begin curvallevel:=m-39;scanexpr;end;
while curvallevel>level do begin if curvallevel=2 then begin m:=curval;
curval:=mem[m+1].int;deleteglueref(m);
end else if curvallevel=3 then muerror;decr(curvallevel);end;
if negative then if curvallevel>=2 then begin m:=curval;
curval:=newspec(m);deleteglueref(m);
{457:}begin mem[curval+1].int:=-mem[curval+1].int;
mem[curval+2].int:=-mem[curval+2].int;
mem[curval+3].int:=-mem[curval+3].int;end{:457};
end else curval:=-curval;goto 10;
end{:1780}else if m>=28 then begin case m of{1671:}28,29,30,31:begin
scanfontident;q:=curval;scancharnum;
if(fontbc[q]<=curval)and(fontec[q]>=curval)then begin i:=fontinfo[
charbase[q]+effectivechar(true,q,curval)].qqqq;
case m of 28:curval:=fontinfo[widthbase[q]+i.b0].int;
29:curval:=fontinfo[heightbase[q]+(i.b1)div 16].int;
30:curval:=fontinfo[depthbase[q]+(i.b1)mod 16].int;
31:curval:=fontinfo[italicbase[q]+(i.b2)div 4].int;end;
end else curval:=0;end;{:1671}{1674:}32,33,34:begin q:=curchr-32;
scanint;
if(eqtb[27158].hh.rh=-268435455)or(curval<=0)then curval:=0 else begin
if q=2 then begin q:=curval mod 2;curval:=(curval+q)div 2;end;
if curval>mem[eqtb[27158].hh.rh].hh.lh then curval:=mem[eqtb[27158].hh.
rh].hh.lh;curval:=mem[eqtb[27158].hh.rh+2*curval-q].int;end;
curvallevel:=1;end;{:1674}{1804:}35,36:begin scannormalglue;q:=curval;
if m=35 then curval:=mem[q+2].int else curval:=mem[q+3].int;
deleteglueref(q);end;{:1804}end;curvallevel:=1;
end else begin case m of 4:curval:=line;5:curval:=lastbadness;
6:curval:=140;7:curval:=pdflastobj;8:curval:=pdflastxform;
9:curval:=pdflastximage;10:curval:=pdflastximagepages;
11:curval:=pdflastannot;12:curval:=pdflastxpos;13:curval:=pdflastypos;
14:curval:=pdfretval;15:curval:=pdflastximagecolordepth;
16:curval:=getmicrointerval;18:curval:=randomseed;
17:begin if shellenabledp then begin if restrictedshell then curval:=2
else curval:=1;end else curval:=0;end;19:curval:=pdflastlink;
{1651:}20:curval:=2;{:1651}{1665:}21:curval:=curlevel-1;
22:curval:=curgroup;{:1665}{1668:}23:begin q:=condptr;curval:=0;
while q<>-268435455 do begin incr(curval);q:=mem[q].hh.rh;end;end;
24:if condptr=-268435455 then curval:=0 else if curif<32 then curval:=
curif+1 else curval:=-(curif-31);
25:if(iflimit=4)or(iflimit=3)then curval:=1 else if iflimit=2 then
curval:=-1 else curval:=0;{:1668}{1803:}26,27:begin scannormalglue;
q:=curval;if m=26 then curval:=mem[q].hh.b0 else curval:=mem[q].hh.b1;
deleteglueref(q);end;{:1803}end;curvallevel:=0;
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
2:if lastglue<>268435455 then curval:=lastglue;3:curval:=lastnodetype;
end;end{:450};39:if curchr=1 then{395:}begin gettoken;
if curcs<514 then curcs:=primlookup(curcs-257)else curcs:=primlookup(
hash[curcs].rh);if curcs<>0 then begin curcmd:=eqtb[15526+curcs].hh.b0;
curchr:=eqtb[15526+curcs].hh.rh;curcs:=15526+curcs;curtok:=4095+curcs;
end else begin curcmd:=0;curchr:=0;curtok:=19616;curcs:=15521;end;
goto 20;end{:395};others:{454:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(797);
end;printcmdchr(curcmd,curchr);print(798);printesc(626);
begin helpptr:=1;helpline[0]:=796;end;error;
if level<>5 then begin curval:=0;curvallevel:=1;
end else begin curval:=0;curvallevel:=0;end;end{:454}end;
while curvallevel>level do{455:}begin if curvallevel=2 then curval:=mem[
curval+1].int else if curvallevel=3 then muerror;decr(curvallevel);
end{:455};
{456:}if negative then if curvallevel>=2 then begin curval:=newspec(
curval);{457:}begin mem[curval+1].int:=-mem[curval+1].int;
mem[curval+2].int:=-mem[curval+2].int;
mem[curval+3].int:=-mem[curval+3].int;end{:457};
end else curval:=-curval else if(curvallevel>=2)and(curvallevel<=3)then
incr(mem[curval].hh.rh){:456};10:end;{:439}{466:}procedure scanint;
label 30,20;var negative:boolean;m:integer;d:smallnumber;
vacuous:boolean;OKsofar:boolean;begin radix:=0;OKsofar:=true;
{467:}negative:=false;repeat{432:}repeat getxtoken;
until curcmd<>10{:432};if curtok=3117 then begin negative:=not negative;
curtok:=3115;end;until curtok<>3115{:467};
20:if curtok=3168 then{468:}begin gettoken;
if curtok<4095 then begin curval:=curchr;
if curcmd<=2 then if curcmd=2 then incr(alignstate)else decr(alignstate)
;end else if curtok<4352 then curval:=curtok-4096 else curval:=curtok
-4352;if curval>255 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(810);
end;begin helpptr:=2;helpline[1]:=811;helpline[0]:=812;end;curval:=48;
backerror;end else{469:}begin getxtoken;if curcmd<>10 then backinput;
end{:469};end{:468}else if curtok=19620 then{395:}begin gettoken;
if curcs<514 then curcs:=primlookup(curcs-257)else curcs:=primlookup(
hash[curcs].rh);if curcs<>0 then begin curcmd:=eqtb[15526+curcs].hh.b0;
curchr:=eqtb[15526+curcs].hh.rh;curcs:=15526+curcs;curtok:=4095+curcs;
end else begin curcmd:=0;curchr:=0;curtok:=19616;curcs:=15521;end;
goto 20;
end{:395}else if(curcmd>=68)and(curcmd<=89)then scansomethinginternal(0,
false)else{470:}begin radix:=10;m:=214748364;
if curtok=3111 then begin radix:=8;m:=268435456;getxtoken;
end else if curtok=3106 then begin radix:=16;m:=134217728;getxtoken;end;
vacuous:=true;curval:=0;
{471:}while true do begin if(curtok<3120+radix)and(curtok>=3120)and(
curtok<=3129)then d:=curtok-3120 else if radix=16 then if(curtok<=2886)
and(curtok>=2881)then d:=curtok-2871 else if(curtok<=3142)and(curtok>=
3137)then d:=curtok-3127 else goto 30 else goto 30;vacuous:=false;
if(curval>=m)and((curval>m)or(d>7)or(radix<>10))then begin if OKsofar
then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(813);
end;begin helpptr:=2;helpline[1]:=814;helpline[0]:=815;end;error;
curval:=2147483647;OKsofar:=false;end;end else curval:=curval*radix+d;
getxtoken;end;30:{:471};
if vacuous then{472:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(762);
end;begin helpptr:=3;helpline[2]:=763;helpline[1]:=764;helpline[0]:=765;
end;backerror;end{:472}else if curcmd<>10 then backinput;end{:470};
if negative then curval:=-curval;end;
{:466}{474:}procedure scandimen(mu,inf,shortcut:boolean);
label 30,31,32,40,45,88,89;var negative:boolean;f:integer;
{476:}num,denom:1..65536;k,kk:smallnumber;p,q:halfword;v:scaled;
savecurval:integer;{:476}begin f:=0;aritherror:=false;curorder:=0;
negative:=false;if not shortcut then begin{467:}negative:=false;
repeat{432:}repeat getxtoken;until curcmd<>10{:432};
if curtok=3117 then begin negative:=not negative;curtok:=3115;end;
until curtok<>3115{:467};
if(curcmd>=68)and(curcmd<=89)then{475:}if mu then begin
scansomethinginternal(3,false);
if curvallevel<>0 then begin{477:}if curvallevel>=2 then begin v:=mem[
curval+1].int;deleteglueref(curval);curval:=v;end{:477};
if curvallevel<>3 then muerror;goto 89;end;
end else begin scansomethinginternal(1,false);
if curvallevel=1 then goto 89;end{:475}else begin backinput;
if curtok=3116 then curtok:=3118;
if curtok<>3118 then scanint else begin radix:=10;curval:=0;end;
if curtok=3116 then curtok:=3118;
if(radix=10)and(curtok=3118)then{478:}begin k:=0;p:=-268435455;gettoken;
while true do begin getxtoken;
if(curtok>3129)or(curtok<3120)then goto 31;
if k<17 then begin q:=getavail;mem[q].hh.rh:=p;
mem[q].hh.lh:=curtok-3120;p:=q;incr(k);end;end;
31:for kk:=k downto 1 do begin dig[kk-1]:=mem[p].hh.lh;q:=p;
p:=mem[p].hh.rh;begin mem[q].hh.rh:=avail;avail:=q;
ifdef('STAT')decr(dynused);endif('STAT')end;end;f:=rounddecimals(k);
if curcmd<>10 then backinput;end{:478};end;end;
if curval<0 then begin negative:=not negative;curval:=-curval;end;
{479:}if inf then{480:}if scankeyword(316)then begin curorder:=1;
while scankeyword(108)do begin if curorder=3 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(817);
end;print(818);begin helpptr:=1;helpline[0]:=819;end;error;
end else incr(curorder);end;goto 88;end{:480};{481:}savecurval:=curval;
{432:}repeat getxtoken;until curcmd<>10{:432};
if(curcmd<68)or(curcmd>89)then backinput else begin if mu then begin
scansomethinginternal(3,false);
{477:}if curvallevel>=2 then begin v:=mem[curval+1].int;
deleteglueref(curval);curval:=v;end{:477};
if curvallevel<>3 then muerror;end else scansomethinginternal(1,false);
v:=curval;goto 40;end;if mu then goto 45;
if scankeyword(820)then v:=({584:}fontinfo[6+parambase[eqtb[27689].hh.rh
]].int{:584})else if scankeyword(821)then v:=({585:}fontinfo[5+parambase
[eqtb[27689].hh.rh]].int{:585})else if scankeyword(822)then v:=eqtb[
29936].int else goto 45;{469:}begin getxtoken;
if curcmd<>10 then backinput;end{:469};
40:curval:=multandadd(savecurval,v,xnoverd(v,f,65536),1073741823);
goto 89;45:{:481};
if mu then{482:}if scankeyword(344)then goto 88 else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(817);
end;print(823);begin helpptr:=4;helpline[3]:=824;helpline[2]:=825;
helpline[1]:=826;helpline[0]:=827;end;error;goto 88;end{:482};
if scankeyword(816)then{483:}begin preparemag;
if eqtb[29294].int<>1000 then begin curval:=xnoverd(curval,1000,eqtb[
29294].int);f:=(1000*f+65536*texremainder)div eqtb[29294].int;
curval:=curval+(f div 65536);f:=f mod 65536;end;end{:483};
if scankeyword(312)then goto 88;
{484:}if scankeyword(828)then begin num:=7227;denom:=100;
end else if scankeyword(829)then begin num:=12;denom:=1;
end else if scankeyword(830)then begin num:=7227;denom:=254;
end else if scankeyword(831)then begin num:=7227;denom:=2540;
end else if scankeyword(832)then begin num:=7227;denom:=7200;
end else if scankeyword(833)then begin num:=1238;denom:=1157;
end else if scankeyword(834)then begin num:=14856;denom:=1157;
end else if scankeyword(835)then begin num:=685;denom:=642;
end else if scankeyword(836)then begin num:=1370;denom:=107;
end else if scankeyword(837)then goto 30 else{485:}begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(817);
end;print(838);begin helpptr:=6;helpline[5]:=839;helpline[4]:=840;
helpline[3]:=841;helpline[2]:=825;helpline[1]:=826;helpline[0]:=827;end;
error;goto 32;end{:485};curval:=xnoverd(curval,num,denom);
f:=(num*f+65536*texremainder)div denom;curval:=curval+(f div 65536);
f:=f mod 65536;32:{:484};
88:if curval>=16384 then aritherror:=true else curval:=curval*65536+f;
30:{:479};{469:}begin getxtoken;if curcmd<>10 then backinput;end{:469};
89:if aritherror or(abs(curval)>=1073741824)then{486:}begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(842);
end;begin helpptr:=2;helpline[1]:=843;helpline[0]:=844;end;error;
curval:=1073741823;aritherror:=false;end{:486};
if negative then curval:=-curval;end;
{:474}{487:}procedure scanglue(level:smallnumber);label 10;
var negative:boolean;q:halfword;mu:boolean;begin mu:=(level=3);
{467:}negative:=false;repeat{432:}repeat getxtoken;
until curcmd<>10{:432};if curtok=3117 then begin negative:=not negative;
curtok:=3115;end;until curtok<>3115{:467};
if(curcmd>=68)and(curcmd<=89)then begin scansomethinginternal(level,
negative);
if curvallevel>=2 then begin if curvallevel<>level then muerror;goto 10;
end;if curvallevel=0 then scandimen(mu,false,true)else if level=3 then
muerror;end else begin backinput;scandimen(mu,false,false);
if negative then curval:=-curval;end;{488:}q:=newspec(membot);
mem[q+1].int:=curval;
if scankeyword(845)then begin scandimen(mu,true,false);
mem[q+2].int:=curval;mem[q].hh.b0:=curorder;end;
if scankeyword(846)then begin scandimen(mu,true,false);
mem[q+3].int:=curval;mem[q].hh.b1:=curorder;end;curval:=q{:488};10:end;
{1782:}{1793:}function addorsub(x,y,maxanswer:integer;
negative:boolean):integer;var a:integer;begin if negative then y:=-y;
if x>=0 then if y<=maxanswer-x then a:=x+y else begin aritherror:=true;
a:=0;
end else if y>=-maxanswer-x then a:=x+y else begin aritherror:=true;
a:=0;end;addorsub:=a;end;
{:1793}{1797:}function quotient(n,d:integer):integer;
var negative:boolean;a:integer;begin if d=0 then begin aritherror:=true;
a:=0;end else begin if d>0 then negative:=false else begin d:=-d;
negative:=true;end;if n<0 then begin n:=-n;negative:=not negative;end;
a:=n div d;n:=n-a*d;d:=n-d;if d+n>=0 then incr(a);
if negative then a:=-a;end;quotient:=a;end;
{:1797}{1799:}function fract(x,n,d,maxanswer:integer):integer;
label 40,41,88,30;var negative:boolean;a:integer;f:integer;h:integer;
r:integer;t:integer;begin if d=0 then goto 88;a:=0;
if d>0 then negative:=false else begin d:=-d;negative:=true;end;
if x<0 then begin x:=-x;negative:=not negative;
end else if x=0 then goto 30;if n<0 then begin n:=-n;
negative:=not negative;end;t:=n div d;if t>maxanswer div x then goto 88;
a:=t*x;n:=n-t*d;if n=0 then goto 40;t:=x div d;
if t>(maxanswer-a)div n then goto 88;a:=a+t*n;x:=x-t*d;
if x=0 then goto 40;if x<n then begin t:=x;x:=n;n:=t;end;{1800:}f:=0;
r:=(d div 2)-d;h:=-r;while true do begin if odd(n)then begin r:=r+x;
if r>=0 then begin r:=r-d;incr(f);end;end;n:=n div 2;
if n=0 then goto 41;if x<h then x:=x+x else begin t:=x-d;x:=t+x;f:=f+n;
if x<n then begin if x=0 then goto 41;t:=x;x:=n;n:=t;end;end;end;
41:{:1800}if f>(maxanswer-a)then goto 88;a:=a+f;
40:if negative then a:=-a;goto 30;88:begin aritherror:=true;a:=0;end;
30:fract:=a;end;{:1799}procedure scanexpr;label 20,22,40;
var a,b:boolean;l:smallnumber;r:smallnumber;s:smallnumber;o:smallnumber;
e:integer;t:integer;f:integer;n:integer;p:halfword;q:halfword;
begin l:=curvallevel;a:=aritherror;b:=false;p:=-268435455;
incr(expanddepthcount);
if expanddepthcount>=expanddepth then overflow(716,expanddepth);
{1783:}20:r:=0;e:=0;s:=0;t:=0;n:=0;22:if s=0 then o:=l else o:=0;
{1785:}{432:}repeat getxtoken;until curcmd<>10{:432};
if curtok=3112 then{1788:}begin q:=getnode(4);mem[q].hh.rh:=p;
mem[q].hh.b0:=l;mem[q].hh.b1:=4*s+r;mem[q+1].int:=e;mem[q+2].int:=t;
mem[q+3].int:=n;p:=q;l:=o;goto 20;end{:1788};backinput;
if o=0 then scanint else if o=1 then scandimen(false,false,false)else if
o=2 then scannormalglue else scanmuglue;f:=curval{:1785};
40:{1784:}{432:}repeat getxtoken;until curcmd<>10{:432};
if curtok=3115 then o:=1 else if curtok=3117 then o:=2 else if curtok=
3114 then o:=3 else if curtok=3119 then o:=4 else begin o:=0;
if p=-268435455 then begin if curcmd<>0 then backinput;
end else if curtok<>3113 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(2078);
end;begin helpptr:=1;helpline[0]:=2079;end;backerror;end;end{:1784};
aritherror:=b;
{1790:}if(l=0)or(s>2)then begin if(f>2147483647)or(f<-2147483647)then
begin aritherror:=true;f:=0;end;
end else if l=1 then begin if abs(f)>1073741823 then begin aritherror:=
true;f:=0;end;
end else begin if(abs(mem[f+1].int)>1073741823)or(abs(mem[f+2].int)>
1073741823)or(abs(mem[f+3].int)>1073741823)then begin aritherror:=true;
deleteglueref(f);f:=newspec(membot);end;end{:1790};
case s of{1791:}0:if(l>=2)and(o<>0)then begin t:=newspec(f);
deleteglueref(f);if mem[t+2].int=0 then mem[t].hh.b0:=0;
if mem[t+3].int=0 then mem[t].hh.b1:=0;end else t:=f;
{:1791}{1795:}3:if o=4 then begin n:=f;o:=5;
end else if l=0 then t:=multandadd(t,f,0,2147483647)else if l=1 then t:=
multandadd(t,f,0,1073741823)else begin mem[t+1].int:=multandadd(mem[t+1]
.int,f,0,1073741823);
mem[t+2].int:=multandadd(mem[t+2].int,f,0,1073741823);
mem[t+3].int:=multandadd(mem[t+3].int,f,0,1073741823);end;
{:1795}{1796:}4:if l<2 then t:=quotient(t,f)else begin mem[t+1].int:=
quotient(mem[t+1].int,f);mem[t+2].int:=quotient(mem[t+2].int,f);
mem[t+3].int:=quotient(mem[t+3].int,f);end;
{:1796}{1798:}5:if l=0 then t:=fract(t,n,f,2147483647)else if l=1 then t
:=fract(t,n,f,1073741823)else begin mem[t+1].int:=fract(mem[t+1].int,n,f
,1073741823);mem[t+2].int:=fract(mem[t+2].int,n,f,1073741823);
mem[t+3].int:=fract(mem[t+3].int,n,f,1073741823);end;{:1798}end;
if o>2 then s:=o else{1792:}begin s:=0;
if r=0 then e:=t else if l=0 then e:=addorsub(e,t,2147483647,r=2)else if
l=1 then e:=addorsub(e,t,1073741823,r=2)else{1794:}begin mem[e+1].int:=
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
if mem[e+3].int=0 then mem[e].hh.b1:=0;end{:1794};r:=o;end{:1792};
b:=aritherror;if o<>0 then goto 22;
if p<>-268435455 then{1789:}begin f:=e;q:=p;e:=mem[q+1].int;
t:=mem[q+2].int;n:=mem[q+3].int;s:=mem[q].hh.b1 div 4;
r:=mem[q].hh.b1 mod 4;l:=mem[q].hh.b0;p:=mem[q].hh.rh;freenode(q,4);
goto 40;end{:1789}{:1783};decr(expanddepthcount);
if b then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1653);
end;begin helpptr:=2;helpline[1]:=2077;helpline[0]:=1655;end;error;
if l>=2 then begin deleteglueref(e);e:=membot;incr(mem[e].hh.rh);
end else e:=0;end;aritherror:=a;curval:=e;curvallevel:=l;end;
{:1782}{1787:}procedure scannormalglue;begin scanglue(2);end;
procedure scanmuglue;begin scanglue(3);end;
{:1787}{:487}{489:}function scanrulespec:halfword;label 21;
var q:halfword;begin q:=newrule;
if curcmd=35 then mem[q+1].int:=26214 else begin mem[q+3].int:=26214;
mem[q+2].int:=0;end;
21:if scankeyword(847)then begin scandimen(false,false,false);
mem[q+1].int:=curval;goto 21;end;
if scankeyword(848)then begin scandimen(false,false,false);
mem[q+3].int:=curval;goto 21;end;
if scankeyword(849)then begin scandimen(false,false,false);
mem[q+2].int:=curval;goto 21;end;scanrulespec:=q;end;
{:489}{490:}{1683:}procedure scangeneraltext;label 40;var s:0..5;
w:halfword;d:halfword;p:halfword;q:halfword;unbalance:halfword;
begin s:=scannerstatus;w:=warningindex;d:=defref;scannerstatus:=5;
warningindex:=curcs;defref:=getavail;mem[defref].hh.lh:=-268435455;
p:=defref;scanleftbrace;unbalance:=1;while true do begin gettoken;
if curtok<768 then if curcmd<2 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 40;end;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;
40:q:=mem[defref].hh.rh;begin mem[defref].hh.rh:=avail;avail:=defref;
ifdef('STAT')decr(dynused);endif('STAT')end;
if q=-268435455 then curval:=memtop-3 else curval:=p;
mem[memtop-3].hh.rh:=q;scannerstatus:=s;warningindex:=w;defref:=d;end;
{:1683}{1753:}procedure pseudostart;var oldsetting:0..21;s:strnumber;
l,m:poolpointer;p,q,r:halfword;w:fourquarters;nl,sz:integer;
begin scangeneraltext;oldsetting:=selector;selector:=21;
tokenshow(memtop-3);selector:=oldsetting;flushlist(mem[memtop-3].hh.rh);
begin if poolptr+1>poolsize then overflow(259,poolsize-initpoolptr);end;
s:=makestring;{1754:}strpool[poolptr]:=32;l:=strstart[s];
nl:=eqtb[29326].int;p:=getavail;q:=p;while l<poolptr do begin m:=l;
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
pseudofiles:=p{:1754};begin decr(strptr);poolptr:=strstart[strptr];end;
{1755:}beginfilereading;line:=0;
curinput.limitfield:=curinput.startfield;
curinput.locfield:=curinput.limitfield+1;
if eqtb[29382].int>0 then begin if termoffset>maxprintline-3 then
println else if(termoffset>0)or(fileoffset>0)then printchar(32);
curinput.namefield:=19;print(2060);incr(openparens);fflush(stdout);
end else begin curinput.namefield:=18;
{1920:}curinput.synctextagfield:=0;{:1920};end{:1755};end;
{:1753}function strtoks(b:poolpointer):halfword;var p:halfword;
q:halfword;t:halfword;k:poolpointer;
begin begin if poolptr+1>poolsize then overflow(259,poolsize-initpoolptr
);end;p:=memtop-3;mem[p].hh.rh:=-268435455;k:=b;
while k<poolptr do begin t:=strpool[k];
if t=32 then t:=2592 else t:=3072+t;begin begin q:=avail;
if q=-268435455 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-268435455;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=t;p:=q;end;incr(k);end;poolptr:=b;
strtoks:=p;end;{:490}{491:}function thetoks:halfword;label 10;
var oldsetting:0..21;p,q,r:halfword;b:poolpointer;c:smallnumber;
begin{1688:}if odd(curchr)then begin c:=curchr;scangeneraltext;
if c=1 then thetoks:=curval else begin oldsetting:=selector;
selector:=21;b:=poolptr;p:=getavail;mem[p].hh.rh:=mem[memtop-3].hh.rh;
tokenshow(p);flushlist(p);selector:=oldsetting;thetoks:=strtoks(b);end;
goto 10;end{:1688};getxtoken;scansomethinginternal(5,false);
if curvallevel>=4 then{492:}begin p:=memtop-3;mem[p].hh.rh:=-268435455;
if curvallevel=4 then begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=4095+curval;p:=q;
end else if curval<>-268435455 then begin r:=mem[curval].hh.rh;
while r<>-268435455 do begin begin begin q:=avail;
if q=-268435455 then q:=getavail else begin avail:=mem[q].hh.rh;
mem[q].hh.rh:=-268435455;ifdef('STAT')incr(dynused);endif('STAT')end;
end;mem[p].hh.rh:=q;mem[q].hh.lh:=mem[r].hh.lh;p:=q;end;r:=mem[r].hh.rh;
end;end;thetoks:=p;end{:492}else begin oldsetting:=selector;
selector:=21;b:=poolptr;case curvallevel of 0:printint(curval);
1:begin printscaled(curval);print(312);end;
2:begin printspec(curval,312);deleteglueref(curval);end;
3:begin printspec(curval,344);deleteglueref(curval);end;end;
selector:=oldsetting;thetoks:=strtoks(b);end;10:end;
{:491}{493:}procedure insthetoks;begin mem[memtop-12].hh.rh:=thetoks;
begintokenlist(mem[memtop-3].hh.rh,4);end;
{:493}{496:}procedure convtoks;label 10;var oldsetting:0..21;
p,q:halfword;c:0..33;savescannerstatus:smallnumber;savedefref:halfword;
savewarningindex:halfword;booltemp:boolean;i:integer;j:integer;
b:poolpointer;s:strnumber;t:strnumber;u:strnumber;begin c:=curchr;u:=0;
{497:}case c of 0,1:scanint;2,3:begin savescannerstatus:=scannerstatus;
scannerstatus:=0;gettoken;scannerstatus:=savescannerstatus;end;
4:scanfontident;5:;6:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;scanpdfexttoks;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
begintokenlist(mem[defref].hh.rh,4);begin mem[defref].hh.rh:=avail;
avail:=defref;ifdef('STAT')decr(dynused);endif('STAT')end;
defref:=savedefref;if u<>0 then begin decr(strptr);u:=0;end;goto 10;end;
7:;8:;9,10,11:begin scanfontident;if curval=0 then pdferror(604,884);
if c<>11 then begin pdfcheckvfcurval;
if not fontused[curval]then pdfinitfontcurval;end;end;12:begin scanint;
if curval<=0 then pdferror(885,886);end;16,17:begin scanregisternum;
if curval<256 then p:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
if(p=-268435455)or(mem[p].hh.b0<>0)then pdferror(887,888)end;
13:begin scanint;pdfcheckobj(8,curval);end;
14:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;escapestring(strstart[s]);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then begin decr(strptr);u:=0;end;goto 10;end;
15:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;escapename(strstart[s]);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then begin decr(strptr);u:=0;end;goto 10;end;
20:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;escapehex(strstart[s]);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then begin decr(strptr);u:=0;end;goto 10;end;
21:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;unescapehex(strstart[s]);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then begin decr(strptr);u:=0;end;goto 10;end;
22:begin b:=poolptr;getcreationdate;mem[memtop-12].hh.rh:=strtoks(b);
begintokenlist(mem[memtop-3].hh.rh,4);goto 10;end;
23:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;getfilemoddate(s);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then begin decr(strptr);u:=0;end;goto 10;end;
24:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;getfilesize(s);mem[memtop-12].hh.rh:=strtoks(b);flushstr(s);
begintokenlist(mem[memtop-3].hh.rh,4);if u<>0 then begin decr(strptr);
u:=0;end;goto 10;end;25:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;
booltemp:=scankeyword(889);scanpdfexttoks;s:=tokenstostring(defref);
deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;getmd5sum(s,booltemp);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then begin decr(strptr);u:=0;end;goto 10;end;
26:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;curval:=0;
if(scankeyword(890))then begin scanint;
if(curval<0)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(891);
end;begin helpptr:=2;helpline[1]:=892;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;i:=curval;curval:=0;
if(scankeyword(893))then begin scanint;
if(curval<0)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(894);
end;begin helpptr:=2;helpline[1]:=895;helpline[0]:=801;end;
interror(curval);curval:=0;end;end;j:=curval;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;getfiledump(s,i,j);mem[memtop-12].hh.rh:=strtoks(b);
flushstr(s);begintokenlist(mem[memtop-3].hh.rh,4);
if u<>0 then begin decr(strptr);u:=0;end;goto 10;end;
27:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;
booltemp:=scankeyword(896);i:=-1;if scankeyword(897)then begin scanint;
i:=curval;end;scanpdfexttoks;s:=tokenstostring(defref);
deletetokenref(defref);scanpdfexttoks;t:=tokenstostring(defref);
deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
b:=poolptr;matchstrings(s,t,i,booltemp);
mem[memtop-12].hh.rh:=strtoks(b);flushstr(t);flushstr(s);
begintokenlist(mem[memtop-3].hh.rh,4);if u<>0 then begin decr(strptr);
u:=0;end;goto 10;end;28:begin scanint;
if curval<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(898);
end;begin helpptr:=2;helpline[1]:=899;helpline[0]:=801;end;
interror(curval);curval:=0;end;b:=poolptr;getmatch(curval);
mem[memtop-12].hh.rh:=strtoks(b);begintokenlist(mem[memtop-3].hh.rh,4);
goto 10;end;18:begin savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;comparestrings;
defref:=savedefref;warningindex:=savewarningindex;
scannerstatus:=savescannerstatus;if u<>0 then begin decr(strptr);u:=0;
end;end;19:begin booltemp:=scankeyword(900);
if scankeyword(901)then curval:=2 else if scankeyword(900)then curval:=1
else curval:=0;savescannerstatus:=scannerstatus;
savewarningindex:=warningindex;savedefref:=defref;
if strstart[strptr]<poolptr then u:=makestring;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);defref:=savedefref;
warningindex:=savewarningindex;scannerstatus:=savescannerstatus;
curval:=newcolorstack(s,curval,booltemp);flushstr(s);curvallevel:=0;
if curval<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(902);
end;begin helpptr:=2;helpline[1]:=903;helpline[0]:=904;end;error;
curval:=0;if u<>0 then begin decr(strptr);u:=0;end;end;end;
33:if jobname=0 then openlogfile;29:scanint;30:;31:scanregisternum;
32:begin scanint;pdfcheckobj(9,curval);i:=pdfmem[objtab[curval].int4+4];
scanint;j:=curval;if(j<1)or(j>4)then pdferror(882,905);end;end{:497};
oldsetting:=selector;selector:=21;b:=poolptr;
{498:}case c of 0:printint(curval);1:printromanint(curval);
2:if curcs<>0 then sprintcs(curcs)else printchar(curchr);3:printmeaning;
4:begin print(fontname[curval]);
if fontsize[curval]<>fontdsize[curval]then begin print(906);
printscaled(fontsize[curval]);print(312);end;end;5:print(256);
7:print(257);8:print(pdftexbanner);
9,10:begin begin if pdffontnum[curval]<0 then ff:=-pdffontnum[curval]
else ff:=curval;end;
if c=9 then printint(objtab[pdffontnum[ff]].int0)else printint(
pdffontnum[ff]);end;11:begin printscaled(fontsize[curval]);print(312);
end;12:printint(getobj(1,curval,false));16:begin p:=mem[p+5].hh.rh;
while(p<>-268435455)and((not(p>=himemmin)and((mem[p].hh.b0=3)or(mem[p].
hh.b0=4)or(mem[p].hh.b0=5)or(mem[p].hh.b0=12)or((mem[p].hh.b0=8)and(mem[
p].hh.b1<>14)and(mem[p].hh.b1<>12))or((mem[p].hh.b0=7)and(mem[p+1].hh.lh
=-268435455)and(mem[p+1].hh.rh=-268435455)and(mem[p].hh.b1=0))or((mem[p]
.hh.b0=9)and(mem[p+1].int=0))or((mem[p].hh.b0=11)and((mem[p+1].int=0)or(
mem[p].hh.b1=0)or(mem[p].hh.b1=3)))or((mem[p].hh.b0=10)and(mem[p+1].hh.
lh=membot))or((mem[p].hh.b0=0)and(mem[p+1].int=0)and(mem[p+3].int=0)and(
mem[p+2].int=0)and(mem[p+5].hh.rh=-268435455))))or((not(p>=himemmin))and
(mem[p].hh.b0=10)and(mem[p].hh.b1=8)))do p:=mem[p].hh.rh;
if(p<>-268435455)and(not(p>=himemmin))and(mem[p].hh.b0=40)and(mem[p].hh.
b1=0)then printscaled(mem[p+1].int)else print(48);print(312);end;
17:begin q:=mem[p+5].hh.rh;p:=prevrightmost(q,-268435455);
while(p<>-268435455)and((not(p>=himemmin)and((mem[p].hh.b0=3)or(mem[p].
hh.b0=4)or(mem[p].hh.b0=5)or(mem[p].hh.b0=12)or((mem[p].hh.b0=8)and(mem[
p].hh.b1<>14)and(mem[p].hh.b1<>12))or((mem[p].hh.b0=7)and(mem[p+1].hh.lh
=-268435455)and(mem[p+1].hh.rh=-268435455)and(mem[p].hh.b1=0))or((mem[p]
.hh.b0=9)and(mem[p+1].int=0))or((mem[p].hh.b0=11)and((mem[p+1].int=0)or(
mem[p].hh.b1=0)or(mem[p].hh.b1=3)))or((mem[p].hh.b0=10)and(mem[p+1].hh.
lh=membot))or((mem[p].hh.b0=0)and(mem[p+1].int=0)and(mem[p+3].int=0)and(
mem[p+2].int=0)and(mem[p+5].hh.rh=-268435455))))or((not(p>=himemmin))and
(mem[p].hh.b0=10)and(mem[p].hh.b1=9)))do p:=prevrightmost(q,p);
if(p<>-268435455)and(not(p>=himemmin))and(mem[p].hh.b0=40)and(mem[p].hh.
b1=1)then printscaled(mem[p+1].int)else print(48);print(312);end;
13:printint(objtab[curval].int0);18:printint(curval);
19:printint(curval);29:printint(unifrand(curval));30:printint(normrand);
31:begin i:=curval;p:=memtop;
while i>=mem[mem[p].hh.rh].hh.b1 do p:=mem[p].hh.rh;
if mem[p].hh.b1=i then printscaled(mem[p+3].int)else print(48);
print(312);end;
32:begin if ispdfimage(i)then begin case j of 1:printscaled(epdforigx(i)
);2:printscaled(epdforigy(i));3:printscaled(epdforigx(i)+imagewidth(i));
4:printscaled(epdforigy(i)+imageheight(i));end;end else printscaled(0);
print(312);end;33:print(jobname);end{:498};selector:=oldsetting;
mem[memtop-12].hh.rh:=strtoks(b);begintokenlist(mem[memtop-3].hh.rh,4);
10:end;{:496}{499:}function scantoks(macrodef,xpand:boolean):halfword;
label 40,22,30,31,32;var t:halfword;s:halfword;p:halfword;q:halfword;
unbalance:halfword;hashbrace:halfword;
begin if macrodef then scannerstatus:=2 else scannerstatus:=5;
warningindex:=curcs;defref:=getavail;mem[defref].hh.lh:=-268435455;
p:=defref;hashbrace:=0;t:=3120;
if macrodef then{500:}begin while true do begin 22:gettoken;
if curtok<768 then goto 31;if curcmd=6 then{502:}begin s:=3328+curchr;
gettoken;if curtok<512 then begin hashbrace:=curtok;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=3584;p:=q;end;goto 30;end;
if t=3129 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(909);
end;begin helpptr:=2;helpline[1]:=910;helpline[0]:=911;end;error;
goto 22;end else begin incr(t);
if curtok<>t then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(912);
end;begin helpptr:=2;helpline[1]:=913;helpline[0]:=914;end;backerror;
end;curtok:=s;end;end{:502};begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end;31:begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=3584;p:=q;end;
if curcmd=2 then{501:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(755);
end;incr(alignstate);begin helpptr:=2;helpline[1]:=907;helpline[0]:=908;
end;error;goto 40;end{:501};30:end{:500}else scanleftbrace;
{503:}unbalance:=1;
while true do begin if xpand then{504:}begin while true do begin getnext
;if curcmd>=114 then if mem[mem[curchr].hh.rh].hh.lh=3585 then begin
curcmd:=0;curchr:=257;end;if curcmd<=103 then goto 32;
if curcmd<>112 then expand else begin q:=thetoks;
if mem[memtop-3].hh.rh<>-268435455 then begin mem[p].hh.rh:=mem[memtop-3
].hh.rh;p:=q;end;end;end;32:xtoken end{:504}else gettoken;
if curtok<768 then if curcmd<2 then incr(unbalance)else begin decr(
unbalance);if unbalance=0 then goto 40;
end else if curcmd=6 then if macrodef then{505:}begin s:=curtok;
if xpand then getxtoken else gettoken;
if curcmd<>6 then if(curtok<=3120)or(curtok>t)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(915);
end;sprintcs(warningindex);begin helpptr:=3;helpline[2]:=916;
helpline[1]:=917;helpline[0]:=918;end;backerror;curtok:=s;
end else curtok:=1232+curchr;end{:505};begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end{:503};
40:scannerstatus:=0;if hashbrace<>0 then begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=hashbrace;p:=q;end;scantoks:=p;end;
{:499}{508:}procedure readtoks(n:integer;r:halfword;j:halfword);
label 30;var p:halfword;q:halfword;s:integer;m:smallnumber;
begin scannerstatus:=2;warningindex:=r;defref:=getavail;
mem[defref].hh.lh:=-268435455;p:=defref;begin q:=getavail;
mem[p].hh.rh:=q;mem[q].hh.lh:=3584;p:=q;end;
if(n<0)or(n>15)then m:=16 else m:=n;s:=alignstate;alignstate:=1000000;
repeat{509:}beginfilereading;curinput.namefield:=m+1;
if readopen[m]=2 then{510:}if interaction>1 then if n<0 then begin;
print(345);terminput;end else begin;println;sprintcs(r);begin;print(61);
terminput;end;n:=-1;end else begin curinput.limitfield:=0;
fatalerror(919);
end{:510}else if readopen[m]=1 then{511:}if inputln(readfile[m],false)
then readopen[m]:=0 else begin aclose(readfile[m]);readopen[m]:=2;
end{:511}else{512:}begin if not inputln(readfile[m],true)then begin
aclose(readfile[m]);readopen[m]:=2;
if alignstate<>1000000 then begin runaway;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(920);
end;printesc(623);begin helpptr:=1;helpline[0]:=921;end;
alignstate:=1000000;curinput.limitfield:=0;error;end;end;end{:512};
curinput.limitfield:=last;
if(eqtb[29325].int<0)or(eqtb[29325].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[29325].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
curinput.statefield:=33;
{1761:}if j=1 then begin while curinput.locfield<=curinput.limitfield do
begin curchr:=buffer[curinput.locfield];incr(curinput.locfield);
if curchr=32 then curtok:=2592 else curtok:=curchr+3072;
begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;p:=q;end;end;
goto 30;end{:1761};while true do begin gettoken;
if curtok=0 then goto 30;
if alignstate<1000000 then begin repeat gettoken;until curtok=0;
alignstate:=1000000;goto 30;end;begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;end;30:endfilereading{:509};
until alignstate=1000000;curval:=defref;scannerstatus:=0;alignstate:=s;
end;{:508}{520:}procedure passtext;label 30;var l:integer;
savescannerstatus:smallnumber;begin savescannerstatus:=scannerstatus;
scannerstatus:=1;l:=0;skipline:=line;while true do begin getnext;
if curcmd=109 then begin if l=0 then goto 30;if curchr=2 then decr(l);
end else if curcmd=108 then incr(l);end;
30:scannerstatus:=savescannerstatus;
if eqtb[29381].int>0 then showcurcmdchr;end;
{:520}{523:}procedure changeiflimit(l:smallnumber;p:halfword);label 10;
var q:halfword;begin if p=condptr then iflimit:=l else begin q:=condptr;
while true do begin if q=-268435455 then confusion(922);
if mem[q].hh.rh=p then begin mem[q].hh.b0:=l;goto 10;end;
q:=mem[q].hh.rh;end;end;10:end;{:523}{524:}procedure conditional;
label 10,50;var b:boolean;e:boolean;r:60..62;m,n:integer;p,q:halfword;
savescannerstatus:smallnumber;savecondptr:halfword;thisif:smallnumber;
isunless:boolean;
begin if eqtb[29381].int>0 then if eqtb[29313].int<=1 then showcurcmdchr
;{521:}begin p:=getnode(2);mem[p].hh.rh:=condptr;mem[p].hh.b0:=iflimit;
mem[p].hh.b1:=curif;mem[p+1].int:=ifline;condptr:=p;curif:=curchr;
iflimit:=1;ifline:=line;end{:521};savecondptr:=condptr;
isunless:=(curchr>=32);thisif:=curchr mod 32;
{527:}case thisif of 0,1:{532:}begin begin getxtoken;
if curcmd=0 then if curchr=257 then begin curcmd:=13;
curchr:=curtok-4096;end;end;if(curcmd>13)or(curchr>255)then begin m:=0;
n:=256;end else begin m:=curcmd;n:=curchr;end;begin getxtoken;
if curcmd=0 then if curchr=257 then begin curcmd:=13;
curchr:=curtok-4096;end;end;
if(curcmd>13)or(curchr>255)then begin curcmd:=0;curchr:=256;end;
if thisif=0 then b:=(n=curchr)else b:=(m=curcmd);end{:532};
2,3:{529:}begin if thisif=2 then scanint else scandimen(false,false,
false);n:=curval;{432:}repeat getxtoken;until curcmd<>10{:432};
if(curtok>=3132)and(curtok<=3134)then r:=curtok-3072 else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(948);
end;printcmdchr(108,thisif);begin helpptr:=1;helpline[0]:=949;end;
backerror;r:=61;end;
if thisif=2 then scanint else scandimen(false,false,false);
case r of 60:b:=(n<curval);61:b:=(n=curval);62:b:=(n>curval);end;
end{:529};4:{530:}begin scanint;b:=odd(curval);end{:530};
5:b:=(abs(curlist.modefield)=1);6:b:=(abs(curlist.modefield)=105);
7:b:=(abs(curlist.modefield)=209);8:b:=(curlist.modefield<0);
9,10,11:{531:}begin scanregisternum;
if curval<256 then p:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
if thisif=9 then b:=(p=-268435455)else if p=-268435455 then b:=false
else if thisif=10 then b:=(mem[p].hh.b0=0)else b:=(mem[p].hh.b0=1);
end{:531};12:{533:}begin savescannerstatus:=scannerstatus;
scannerstatus:=0;getnext;n:=curcs;p:=curcmd;q:=curchr;getnext;
if curcmd<>p then b:=false else if curcmd<114 then b:=(curchr=q)else
{534:}begin p:=mem[curchr].hh.rh;q:=mem[eqtb[n].hh.rh].hh.rh;
if p=q then b:=true else begin while(p<>-268435455)and(q<>-268435455)do
if mem[p].hh.lh<>mem[q].hh.lh then p:=-268435455 else begin p:=mem[p].hh
.rh;q:=mem[q].hh.rh;end;b:=((p=-268435455)and(q=-268435455));end;
end{:534};scannerstatus:=savescannerstatus;end{:533};
13:begin scanfourbitintor18;
if curval=18 then b:=not shellenabledp else b:=(readopen[curval]=2);end;
14:b:=true;15:b:=false;{1766:}17:begin savescannerstatus:=scannerstatus;
scannerstatus:=0;getnext;b:=(curcmd<>104);
scannerstatus:=savescannerstatus;end;{:1766}{1767:}18:begin n:=getavail;
p:=n;e:=isincsname;isincsname:=true;repeat getxtoken;
if curcs=0 then begin q:=getavail;mem[p].hh.rh:=q;mem[q].hh.lh:=curtok;
p:=q;end;until curcs<>0;
if curcmd<>67 then{399:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(723);
end;printesc(590);print(724);begin helpptr:=2;helpline[1]:=725;
helpline[0]:=726;end;backerror;end{:399};{1768:}m:=first;
p:=mem[n].hh.rh;
while p<>-268435455 do begin if m>=maxbufstack then begin maxbufstack:=m
+1;if maxbufstack=bufsize then overflow(258,bufsize);end;
buffer[m]:=mem[p].hh.lh mod 256;incr(m);p:=mem[p].hh.rh;end;
if m>first+1 then curcs:=idlookup(first,m-first)else if m=first then
curcs:=513 else curcs:=257+buffer[first]{:1768};flushlist(n);
b:=(eqtb[curcs].hh.b0<>104);isincsname:=e;end;
{:1767}{1769:}20:b:=isincsname;
23,22:begin if thisif=22 then scanint else scandimen(false,false,false);
n:=curval;if n<0 then n:=-n;{432:}repeat getxtoken;
until curcmd<>10{:432};
if(curtok>=3132)and(curtok<=3134)then r:=curtok-3072 else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(948);
end;printcmdchr(108,thisif);begin helpptr:=1;helpline[0]:=949;end;
backerror;r:=61;end;
if thisif=22 then scanint else scandimen(false,false,false);
if curval<0 then curval:=-curval;case r of 60:b:=(n<curval);
61:b:=(n=curval);62:b:=(n>curval);end;end;19:begin scanfontident;
n:=curval;scancharnum;
if(fontbc[n]<=curval)and(fontec[n]>=curval)then b:=(fontinfo[charbase[n]
+effectivechar(true,n,curval)].qqqq.b0>0)else b:=false;end;
{:1769}16:{535:}begin scanint;n:=curval;
if eqtb[29313].int>1 then begin begindiagnostic;print(950);printint(n);
printchar(125);enddiagnostic(false);end;while n<>0 do begin passtext;
if condptr=savecondptr then if curchr=4 then decr(n)else goto 50 else if
curchr=2 then{522:}begin if ifstack[inopen]=condptr then ifwarning;
p:=condptr;ifline:=mem[p+1].int;curif:=mem[p].hh.b1;
iflimit:=mem[p].hh.b0;condptr:=mem[p].hh.rh;freenode(p,2);end{:522};end;
changeiflimit(4,savecondptr);goto 10;end{:535};
21:begin savescannerstatus:=scannerstatus;scannerstatus:=0;getnext;
scannerstatus:=savescannerstatus;
if curcs<514 then m:=primlookup(curcs-257)else m:=primlookup(hash[curcs]
.rh);
b:=((curcmd<>104)and(m<>0)and(curcmd=eqtb[15526+m].hh.b0)and(curchr=eqtb
[15526+m].hh.rh));end;end{:527};if isunless then b:=not b;
if eqtb[29313].int>1 then{528:}begin begindiagnostic;
if b then print(946)else print(947);enddiagnostic(false);end{:528};
if b then begin changeiflimit(3,savecondptr);goto 10;end;
{526:}while true do begin passtext;
if condptr=savecondptr then begin if curchr<>4 then goto 50;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(944);
end;printesc(942);begin helpptr:=1;helpline[0]:=945;end;error;
end else if curchr=2 then{522:}begin if ifstack[inopen]=condptr then
ifwarning;p:=condptr;ifline:=mem[p+1].int;curif:=mem[p].hh.b1;
iflimit:=mem[p].hh.b0;condptr:=mem[p].hh.rh;freenode(p,2);end{:522};
end{:526};
50:if curchr=2 then{522:}begin if ifstack[inopen]=condptr then ifwarning
;p:=condptr;ifline:=mem[p+1].int;curif:=mem[p].hh.b1;
iflimit:=mem[p].hh.b0;condptr:=mem[p].hh.rh;freenode(p,2);
end{:522}else iflimit:=2;10:end;{:524}{541:}procedure beginname;
begin areadelimiter:=0;extdelimiter:=0;quotedfilename:=false;end;
{:541}{542:}function morename(c:ASCIIcode):boolean;
begin if(c=32)and stopatspace and(not quotedfilename)then morename:=
false else if c=34 then begin quotedfilename:=not quotedfilename;
morename:=true;
end else begin begin if poolptr+1>poolsize then overflow(259,poolsize-
initpoolptr);end;begin strpool[poolptr]:=c;incr(poolptr);end;
if ISDIRSEP(c)then begin areadelimiter:=(poolptr-strstart[strptr]);
extdelimiter:=0;
end else if c=46 then extdelimiter:=(poolptr-strstart[strptr]);
morename:=true;end;end;{:542}{543:}procedure endname;
var tempstr:strnumber;j,s,t:poolpointer;mustquote:boolean;
begin if strptr+3>maxstrings then overflow(260,maxstrings-initstrptr);
begin if poolptr+6>poolsize then overflow(259,poolsize-initpoolptr);end;
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
if areadelimiter=0 then curarea:=345 else begin curarea:=strptr;
strstart[strptr+1]:=strstart[strptr]+areadelimiter;incr(strptr);
tempstr:=searchstring(curarea);if tempstr>0 then begin curarea:=tempstr;
decr(strptr);
for j:=strstart[strptr+1]to poolptr-1 do begin strpool[j-areadelimiter]
:=strpool[j];end;poolptr:=poolptr-areadelimiter;end;end;
if extdelimiter=0 then begin curext:=345;curname:=slowmakestring;
end else begin curname:=strptr;
strstart[strptr+1]:=strstart[strptr]+extdelimiter-areadelimiter-1;
incr(strptr);curext:=makestring;decr(strptr);
tempstr:=searchstring(curname);if tempstr>0 then begin curname:=tempstr;
decr(strptr);
for j:=strstart[strptr+1]to poolptr-1 do begin strpool[j-extdelimiter+
areadelimiter+1]:=strpool[j];end;
poolptr:=poolptr-extdelimiter+areadelimiter+1;end;
curext:=slowmakestring;end;end;
{:543}{545:}procedure packfilename(n,a,e:strnumber);var k:integer;
c:ASCIIcode;j:poolpointer;begin k:=0;
if nameoffile then libcfree(nameoffile);
nameoffile:=xmallocarray(ASCIIcode,(strstart[a+1]-strstart[a])+(strstart
[n+1]-strstart[n])+(strstart[e+1]-strstart[e])+1);
for j:=strstart[a]to strstart[a+1]-1 do begin c:=strpool[j];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;for j:=strstart[n]to strstart[n+1]-1 do begin c:=strpool[j];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;for j:=strstart[e]to strstart[e+1]-1 do begin c:=strpool[j];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;if k<=maxint then namelength:=k else namelength:=maxint;
nameoffile[namelength+1]:=0;end;
{:545}{549:}procedure packbufferedname(n:smallnumber;a,b:integer);
var k:integer;c:ASCIIcode;j:integer;
begin if n+b-a+5>maxint then b:=a+maxint-n-5;k:=0;
if nameoffile then libcfree(nameoffile);
nameoffile:=xmallocarray(ASCIIcode,n+(b-a+1)+5);
for j:=1 to n do begin c:=xord[ucharcast(TEXformatdefault[j])];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;for j:=a to b do begin c:=buffer[j];
if not(c=34)then begin incr(k);if k<=maxint then nameoffile[k]:=xchr[c];
end end;
for j:=formatdefaultlength-3 to formatdefaultlength do begin c:=xord[
ucharcast(TEXformatdefault[j])];if not(c=34)then begin incr(k);
if k<=maxint then nameoffile[k]:=xchr[c];end end;
if k<=maxint then namelength:=k else namelength:=maxint;
nameoffile[namelength+1]:=0;end;
{:549}{551:}function makenamestring:strnumber;var k:1..maxint;
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
{:551}{552:}procedure scanfilename;label 30;
var savewarningindex:halfword;begin nameinprogress:=true;
savewarningindex:=warningindex;warningindex:=curcs;
{432:}repeat getxtoken;until curcmd<>10{:432};backinput;
if curcmd=1 then begin scanfilenamebraced;
end else begin nameinprogress:=true;beginname;{432:}repeat getxtoken;
until curcmd<>10{:432};
while true do begin if(curcmd>12)or(curchr>255)then begin backinput;
goto 30;end;
if(curchr=32)and(curinput.statefield<>0)and(curinput.locfield>curinput.
limitfield)then goto 30;if not morename(curchr)then goto 30;getxtoken;
end;end;30:endname;nameinprogress:=false;warningindex:=savewarningindex;
end;{:552}{555:}procedure packjobname(s:strnumber);begin curarea:=345;
curext:=s;curname:=jobname;packfilename(curname,curarea,curext);end;
{:555}{556:}procedure promptfilename(s,e:strnumber);label 30;
var k:0..bufsize;savedcurname:strnumber;savedcurext:strnumber;
savedcurarea:strnumber;begin if interaction=2 then;
if s=952 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(953);
end else begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(954);
end;printfilename(curname,curarea,curext);print(955);
if(e=956)or(e=345)then showcontext;println;
printcstring(promptfilenamehelpmsg);if(e<>345)then begin print(957);
print(e);print(39);end;print(41);println;printnl(958);print(s);
if interaction<2 then fatalerror(959);savedcurname:=curname;
savedcurext:=curext;savedcurarea:=curarea;;begin;print(660);terminput;
end;{557:}begin beginname;k:=first;
while(buffer[k]=32)and(k<last)do incr(k);
while true do begin if k=last then goto 30;
if not morename(buffer[k])then goto 30;incr(k);end;30:endname;end{:557};
if((strstart[curname+1]-strstart[curname])=0)and(curext=345)and(curarea=
345)then begin curname:=savedcurname;curext:=savedcurext;
curarea:=savedcurarea;end else if curext=345 then curext:=e;
packfilename(curname,curarea,curext);end;
{:556}{560:}procedure openlogfile;var oldsetting:0..21;k:0..bufsize;
l:0..bufsize;months:constcstring;begin oldsetting:=selector;
if jobname=0 then jobname:=getjobname(962);packjobname(963);
recorderchangefilename(stringcast(nameoffile+1));packjobname(964);
while not aopenout(logfile)do{561:}begin selector:=17;
promptfilename(966,964);end{:561};
texmflogname:=amakenamestring(logfile);selector:=18;logopened:=true;
{562:}begin if srcspecialsp or filelineerrorstylep or parsefirstlinep
then write(logfile,'This is pdfTeX, Version 3.141592653','-2.6',
'-1.40.29')else write(logfile,'This is pdfTeX, Version 3.141592653',
'-2.6','-1.40.29');write(logfile,versionstring);slowprint(formatident);
print(967);printint(sysday);printchar(32);
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
fputs(translatefilename,logfile);write(logfile,')');end;end{:562};
if mltexenabledp then begin writeln(logfile);
write(logfile,'MLTeX v2.2 enabled');end;
if enctexenabledp then begin writeln(logfile);
write(logfile,' encTeX v. Jun. 2004');
write(logfile,', reencoding enabled');
if translatefilename then begin writeln(logfile);
write(logfile,' (\xordcode, \xchrcode, \xprncode overridden by TCX)');
end;end;inputstack[inputptr]:=curinput;printnl(965);
l:=inputstack[0].limitfield;if buffer[l]=eqtb[29325].int then decr(l);
for k:=1 to l do print(buffer[k]);println;selector:=oldsetting+2;end;
{:560}{563:}procedure startinput;label 30;var tempstr:strnumber;
v:halfword;begin scanfilename;packfilename(curname,curarea,curext);
while true do begin beginfilereading;texinputtype:=1;
if kpseinnameok(stringcast(nameoffile+1))and aopenin(inputfile[curinput.
indexfield],kpsetexformat)then goto 30;endfilereading;
promptfilename(952,345);end;
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
incr(openparens);slowprint(fullsourcefilenamestack[inopen]);
fflush(stdout);if eqtb[29335].int>0 then begin begindiagnostic;println;
printchar(126);v:=inputptr-1;
if v<eqtb[29335].int then while v>0 do begin printchar(46);decr(v);
end else printchar(126);slowprint(968);slowprint(curname);
slowprint(curext);println;enddiagnostic(false);end;
curinput.statefield:=33;{1918:}synctexstartinput;{:1918};
{564:}begin line:=1;
if inputln(inputfile[curinput.indexfield],false)then;firmuptheline;
if(eqtb[29325].int<0)or(eqtb[29325].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[29325].int;
first:=curinput.limitfield+1;curinput.locfield:=curinput.startfield;
end{:564};end;
{:563}{586:}{1885:}function effectivecharinfo(f:internalfontnumber;
c:quarterword):fourquarters;label 10;var ci:fourquarters;basec:integer;
begin if not mltexenabledp then begin effectivecharinfo:=fontinfo[
charbase[f]+c].qqqq;goto 10;end;
if fontec[f]>=c then if fontbc[f]<=c then begin ci:=fontinfo[charbase[f]
+c].qqqq;if(ci.b0>0)then begin effectivecharinfo:=ci;goto 10;end;end;
if c>=eqtb[29332].int then if c<=eqtb[29333].int then if(eqtb[29021+c].
hh.rh>0)then begin basec:=(eqtb[29021+c].hh.rh mod 256);
if fontec[f]>=basec then if fontbc[f]<=basec then begin ci:=fontinfo[
charbase[f]+basec].qqqq;if(ci.b0>0)then begin effectivecharinfo:=ci;
goto 10;end;end;end;effectivecharinfo:=nullcharacter;10:end;
{:1885}function readfontinfo(u:halfword;nom,aire:strnumber;
s:scaled):internalfontnumber;label 30,11,45;var k:fontindex;
nametoolong:boolean;fileopened:boolean;
lf,lh,bc,ec,nw,nh,nd,ni,nl,nk,ne,np:halfword;f:internalfontnumber;
g:internalfontnumber;a,b,c,d:eightbits;qw:fourquarters;sw:scaled;
bchlabel:integer;bchar:0..256;z:scaled;alpha:integer;beta:1..16;
begin g:=0;{588:}{589:}fileopened:=false;
nametoolong:=((strstart[nom+1]-strstart[nom])>255)or((strstart[aire+1]-
strstart[aire])>255);if nametoolong then goto 11;
packfilename(nom,aire,345);if not bopenin(tfmfile)then goto 11;
fileopened:=true{:589};{591:}begin begin lf:=tfmtemp;
if lf>127 then goto 11;tfmtemp:=getc(tfmfile);lf:=lf*256+tfmtemp;end;
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
np:=np*256+tfmtemp;end;
if lf<>6+lh+(ec-bc+1)+nw+nh+nd+ni+nl+nk+ne+np then goto 11;
if(nw=0)or(nh=0)or(nd=0)or(ni=0)then goto 11;end{:591};
{592:}lf:=lf-6-lh;if np<7 then lf:=lf+7-np;
if(fontptr=fontmax)or(fmemptr+lf>fontmemsize)then{593:}begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(970);
end;sprintcs(u);printchar(61);printfilename(nom,aire,345);
if s>=0 then begin print(906);printscaled(s);print(312);
end else if s<>-1000 then begin print(971);printint(-s);end;print(980);
begin helpptr:=4;helpline[3]:=981;helpline[2]:=982;helpline[1]:=983;
helpline[0]:=984;end;error;goto 30;end{:593};f:=fontptr+1;
charbase[f]:=fmemptr-bc;widthbase[f]:=charbase[f]+ec+1;
heightbase[f]:=widthbase[f]+nw;depthbase[f]:=heightbase[f]+nh;
italicbase[f]:=depthbase[f]+nd;ligkernbase[f]:=italicbase[f]+ni;
kernbase[f]:=ligkernbase[f]+nl-256*(128);
extenbase[f]:=kernbase[f]+256*(128)+nk;
parambase[f]:=extenbase[f]+ne{:592};{594:}begin if lh<2 then goto 11;
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
if filelineerrorstylep then printfileline else printnl(264);print(970);
end;sprintcs(u);printchar(61);printfilename(nom,aire,345);
if s>=0 then begin print(906);printscaled(s);print(312);
end else if s<>-1000 then begin print(971);printint(-s);end;print(985);
begin helpptr:=1;helpline[0]:=986;end;error;z:=sw;end;
aritherror:=savearitherror;end;fontsize[f]:=z;end{:594};
{595:}for k:=fmemptr to widthbase[f]-1 do begin begin tfmtemp:=getc(
tfmfile);a:=tfmtemp;qw.b0:=a;tfmtemp:=getc(tfmfile);b:=tfmtemp;qw.b1:=b;
tfmtemp:=getc(tfmfile);c:=tfmtemp;qw.b2:=c;tfmtemp:=getc(tfmfile);
d:=tfmtemp;qw.b3:=d;fontinfo[k].qqqq:=qw;end;
if(a>=nw)or(b div 16>=nh)or(b mod 16>=nd)or(c div 4>=ni)then goto 11;
case c mod 4 of 1:if d>=nl then goto 11;3:if d>=ne then goto 11;
2:{596:}begin begin if(d<bc)or(d>ec)then goto 11 end;
while d<k+bc-fmemptr do begin qw:=fontinfo[charbase[f]+d].qqqq;
if((qw.b2)mod 4)<>2 then goto 45;d:=qw.b3;end;
if d=k+bc-fmemptr then goto 11;45:end{:596};others:end;end{:595};
{598:}begin{599:}begin alpha:=16;if z>=134217728 then pdferror(604,987);
while z>=8388608 do begin z:=z div 2;alpha:=alpha+alpha;end;
beta:=256 div alpha;alpha:=alpha*z;end{:599};
for k:=widthbase[f]to ligkernbase[f]-1 do begin tfmtemp:=getc(tfmfile);
a:=tfmtemp;tfmtemp:=getc(tfmfile);b:=tfmtemp;tfmtemp:=getc(tfmfile);
c:=tfmtemp;tfmtemp:=getc(tfmfile);d:=tfmtemp;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then fontinfo[k].int:=sw else if a=255 then fontinfo[k].int:=sw-
alpha else goto 11;end;if fontinfo[widthbase[f]].int<>0 then goto 11;
if fontinfo[heightbase[f]].int<>0 then goto 11;
if fontinfo[depthbase[f]].int<>0 then goto 11;
if fontinfo[italicbase[f]].int<>0 then goto 11;end{:598};
{600:}bchlabel:=32767;bchar:=256;
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
alpha else goto 11;end;{:600};
{601:}for k:=extenbase[f]to parambase[f]-1 do begin begin tfmtemp:=getc(
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
end{:601};
{602:}begin for k:=1 to np do if k=1 then begin tfmtemp:=getc(tfmfile);
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
for k:=np+1 to 7 do fontinfo[parambase[f]+k-1].int:=0;end{:602};
{603:}if np>=7 then fontparams[f]:=np else fontparams[f]:=7;
hyphenchar[f]:=eqtb[29323].int;skewchar[f]:=eqtb[29324].int;
if bchlabel<nl then bcharlabel[f]:=bchlabel+ligkernbase[f]else
bcharlabel[f]:=0;fontbchar[f]:=bchar;fontfalsebchar[f]:=bchar;
if bchar<=ec then if bchar>=bc then begin qw:=fontinfo[charbase[f]+bchar
].qqqq;if(qw.b0>0)then fontfalsebchar[f]:=256;end;fontname[f]:=nom;
fontarea[f]:=aire;fontbc[f]:=bc;fontec[f]:=ec;fontglue[f]:=-268435455;
charbase[f]:=charbase[f];widthbase[f]:=widthbase[f];
ligkernbase[f]:=ligkernbase[f];kernbase[f]:=kernbase[f];
extenbase[f]:=extenbase[f];decr(parambase[f]);fmemptr:=fmemptr+lf;
fontptr:=f;g:=f;goto 30{:603}{:588};
11:{587:}begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(970);
end;sprintcs(u);printchar(61);printfilename(nom,aire,345);
if s>=0 then begin print(906);printscaled(s);print(312);
end else if s<>-1000 then begin print(971);printint(-s);end;
if fileopened then print(972)else if nametoolong then print(973)else
print(974);begin helpptr:=5;helpline[4]:=975;helpline[3]:=976;
helpline[2]:=977;helpline[1]:=978;helpline[0]:=979;end;error{:587};
30:if fileopened then bclose(tfmfile);readfontinfo:=g;end;
{:586}{597:}function storescaledf(sq,z:scaled):scaled;
var a,b,c,d:eightbits;sw:scaled;alpha:integer;beta:1..16;
begin alpha:=16;if z>=134217728 then pdferror(604,987);
while z>=8388608 do begin z:=z div 2;alpha:=alpha+alpha;end;
beta:=256 div alpha;alpha:=alpha*z;if sq>=0 then begin d:=sq mod 256;
sq:=sq div 256;c:=sq mod 256;sq:=sq div 256;b:=sq mod 256;
sq:=sq div 256;a:=sq mod 256;
end else begin sq:=(sq+1073741824)+1073741824;d:=sq mod 256;
sq:=sq div 256;c:=sq mod 256;sq:=sq div 256;b:=sq mod 256;
sq:=sq div 256;a:=(sq+128)mod 256;end;
sw:=(((((d*z)div 256)+(c*z))div 256)+(b*z))div beta;
if a=0 then storescaledf:=sw else if a=255 then storescaledf:=sw-alpha
else pdferror(988,989);end;
{:597}{608:}procedure charwarning(f:internalfontnumber;c:eightbits);
var oldsetting:integer;
begin if eqtb[29312].int>0 then begin oldsetting:=eqtb[29306].int;
if(eTeXmode=1)and(eqtb[29312].int>1)then eqtb[29306].int:=1;
if eqtb[29312].int>2 then begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(998);
end else begin begindiagnostic;printnl(998)end;print(c);
if eqtb[29312].int>2 then begin print(286);printhex(c);print(41);end;
print(999);slowprint(fontname[f]);
if eqtb[29312].int<3 then printchar(33);eqtb[29306].int:=oldsetting;
if eqtb[29312].int>2 then begin helpptr:=0;error;
end else enddiagnostic(false);end;end;
{:608}{609:}function newcharacter(f:internalfontnumber;
c:eightbits):halfword;label 10;var p:halfword;ec:quarterword;
begin ec:=effectivechar(false,f,c);
if fontbc[f]<=ec then if fontec[f]>=ec then if(fontinfo[charbase[f]+ec].
qqqq.b0>0)then begin p:=getavail;mem[p].hh.b0:=f;mem[p].hh.b1:=c;
newcharacter:=p;goto 10;end;charwarning(f,c);newcharacter:=-268435455;
10:end;{:609}{625:}procedure dviswap;
begin if dviptr>(2147483647-dvioffset)then begin curs:=-2;
fatalerror(1000);end;
if dvilimit=dvibufsize then begin writedvi(0,halfbuf-1);
dvilimit:=halfbuf;dvioffset:=dvioffset+dvibufsize;dviptr:=0;
end else begin writedvi(halfbuf,dvibufsize-1);dvilimit:=dvibufsize;end;
dvigone:=dvigone+halfbuf;end;{:625}{627:}procedure dvifour(x:integer);
begin if x>=0 then begin dvibuf[dviptr]:=x div 16777216;incr(dviptr);
if dviptr=dvilimit then dviswap;end else begin x:=x+1073741824;
x:=x+1073741824;begin dvibuf[dviptr]:=(x div 16777216)+128;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;x:=x mod 16777216;
begin dvibuf[dviptr]:=x div 65536;incr(dviptr);
if dviptr=dvilimit then dviswap;end;x:=x mod 65536;
begin dvibuf[dviptr]:=x div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=x mod 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;end;
{:627}{628:}procedure dvipop(l:integer);
begin if(l=dvioffset+dviptr)and(dviptr>0)then decr(dviptr)else begin
dvibuf[dviptr]:=142;incr(dviptr);if dviptr=dvilimit then dviswap;end;
end;{:628}{629:}procedure dvifontdef(f:internalfontnumber);
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
{630:}for k:=strstart[fontarea[f]]to strstart[fontarea[f]+1]-1 do begin
dvibuf[dviptr]:=strpool[k];incr(dviptr);if dviptr=dvilimit then dviswap;
end;
for k:=strstart[fontname[f]]to strstart[fontname[f]+1]-1 do begin dvibuf
[dviptr]:=strpool[k];incr(dviptr);if dviptr=dvilimit then dviswap;
end{:630};end;{:629}{634:}procedure movement(w:scaled;o:eightbits);
label 10,40,45,2,1;var mstate:smallnumber;p,q:halfword;k:integer;
begin q:=getnode(3);mem[q+1].int:=w;mem[q+2].int:=dvioffset+dviptr;
if o=157 then begin mem[q].hh.rh:=downptr;downptr:=q;
end else begin mem[q].hh.rh:=rightptr;rightptr:=q;end;
{638:}p:=mem[q].hh.rh;mstate:=0;
while p<>-268435455 do begin if mem[p+1].int=w then{639:}case mstate+mem
[p].hh.lh of 3,4,15,16:if mem[p+2].int<dvigone then goto 45 else{640:}
begin k:=mem[p+2].int-dvioffset;if k<0 then k:=k+dvibufsize;
dvibuf[k]:=dvibuf[k]+5;mem[p].hh.lh:=1;goto 40;end{:640};
5,9,11:if mem[p+2].int<dvigone then goto 45 else{641:}begin k:=mem[p+2].
int-dvioffset;if k<0 then k:=k+dvibufsize;dvibuf[k]:=dvibuf[k]+10;
mem[p].hh.lh:=2;goto 40;end{:641};1,2,8,13:goto 40;
others:end{:639}else case mstate+mem[p].hh.lh of 1:mstate:=6;
2:mstate:=12;8,13:goto 45;others:end;p:=mem[p].hh.rh;end;45:{:638};
{637:}mem[q].hh.lh:=3;
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
if dviptr=dvilimit then dviswap;end;goto 10{:637};
40:{636:}mem[q].hh.lh:=mem[p].hh.lh;
if mem[q].hh.lh=1 then begin begin dvibuf[dviptr]:=o+4;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
while mem[q].hh.rh<>p do begin q:=mem[q].hh.rh;
case mem[q].hh.lh of 3:mem[q].hh.lh:=5;4:mem[q].hh.lh:=6;others:end;end;
end else begin begin dvibuf[dviptr]:=o+9;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
while mem[q].hh.rh<>p do begin q:=mem[q].hh.rh;
case mem[q].hh.lh of 3:mem[q].hh.lh:=4;5:mem[q].hh.lh:=6;others:end;end;
end{:636};10:end;{:634}{642:}procedure prunemovements(l:integer);
label 30,10;var p:halfword;
begin while downptr<>-268435455 do begin if mem[downptr+2].int<l then
goto 30;p:=downptr;downptr:=mem[p].hh.rh;freenode(p,3);end;
30:while rightptr<>-268435455 do begin if mem[rightptr+2].int<l then
goto 10;p:=rightptr;rightptr:=mem[p].hh.rh;freenode(p,3);end;10:end;
{:642}{646:}procedure vlistout;forward;
{:646}{647:}{1615:}procedure specialout(p:halfword);
var oldsetting:0..21;k:poolpointer;h:halfword;q,r:halfword;
oldmode:integer;begin if curh<>dvih then begin movement(curh-dvih,143);
dvih:=curh;end;if curv<>dviv then begin movement(curv-dviv,157);
dviv:=curv;end;oldsetting:=selector;selector:=21;
specsout:=eqtb[29341].int;eqtb[29341].int:=mem[p+1].hh.b0-64;
mubytesout:=eqtb[29339].int;eqtb[29339].int:=mem[p+1].hh.b1-64;
activenoconvert:=true;mubyteslog:=eqtb[29340].int;eqtb[29340].int:=0;
if(eqtb[29339].int>0)or(eqtb[29339].int=-1)then eqtb[29340].int:=1;
if(eqtb[29341].int=2)or(eqtb[29341].int=3)then begin if(eqtb[29339].int>
0)or(eqtb[29339].int=-1)then begin specialprinting:=true;
eqtb[29340].int:=1;end;if eqtb[29339].int>1 then csconverting:=true;end;
selector:=oldsetting;if mem[p].hh.b1=4 then begin{1618:}q:=getavail;
mem[q].hh.lh:=637;r:=getavail;mem[q].hh.rh:=r;mem[r].hh.lh:=19617;
begintokenlist(q,4);begintokenlist(mem[p+1].hh.rh,20);q:=getavail;
mem[q].hh.lh:=379;begintokenlist(q,4);oldmode:=curlist.modefield;
curlist.modefield:=0;curcs:=writeloc;q:=scantoks(false,true);
curlist.modefield:=oldmode;gettoken;
if curtok<>19617 then{1619:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(712);
end;begin helpptr:=2;helpline[1]:=1942;helpline[0]:=1439;end;error;
repeat gettoken;until curtok=19617;end{:1619};endtokenlist{:1618};
h:=defref;end else h:=mem[p+1].hh.rh;selector:=21;
showtokenlist(mem[h].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(259,poolsize-initpoolptr);end;
if(poolptr-strstart[strptr])<256 then begin begin dvibuf[dviptr]:=239;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(poolptr-strstart[strptr]);incr(dviptr);
if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=242;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour((poolptr-strstart[strptr]));
end;
if(eqtb[29341].int=1)or(eqtb[29341].int=3)then for k:=strstart[strptr]to
poolptr-1 do strpool[k]:=xchr[strpool[k]];
for k:=strstart[strptr]to poolptr-1 do begin dvibuf[dviptr]:=strpool[k];
incr(dviptr);if dviptr=dvilimit then dviswap;end;
eqtb[29341].int:=specsout;eqtb[29339].int:=mubytesout;
eqtb[29340].int:=mubyteslog;specialprinting:=false;csconverting:=false;
activenoconvert:=false;poolptr:=strstart[strptr];
if mem[p].hh.b1=4 then flushlist(defref);end;
{:1615}{1617:}procedure writeout(p:halfword);var oldsetting:0..21;
oldmode:integer;j:smallnumber;q,r:halfword;d:integer;clobbered:boolean;
runsystemret:integer;begin mubytesout:=eqtb[29339].int;
eqtb[29339].int:=mem[p+1].hh.b1-64;
if(eqtb[29339].int>2)or(eqtb[29339].int=-1)or(eqtb[29339].int=-2)then
writenoexpanding:=true;{1618:}q:=getavail;mem[q].hh.lh:=637;r:=getavail;
mem[q].hh.rh:=r;mem[r].hh.lh:=19617;begintokenlist(q,4);
begintokenlist(mem[p+1].hh.rh,20);q:=getavail;mem[q].hh.lh:=379;
begintokenlist(q,4);oldmode:=curlist.modefield;curlist.modefield:=0;
curcs:=writeloc;q:=scantoks(false,true);curlist.modefield:=oldmode;
gettoken;if curtok<>19617 then{1619:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(712);
end;begin helpptr:=2;helpline[1]:=1942;helpline[0]:=1439;end;error;
repeat gettoken;until curtok=19617;end{:1619};endtokenlist{:1618};
oldsetting:=selector;j:=mem[p+1].hh.b0;
if j=18 then selector:=21 else if writeopen[j]then selector:=j else
begin if(j=17)and(selector=19)then selector:=18;printnl(345);end;
activenoconvert:=true;if eqtb[29339].int>1 then csconverting:=true;
mubyteslog:=eqtb[29340].int;
if(eqtb[29339].int>0)or(eqtb[29339].int=-1)then eqtb[29340].int:=1 else
eqtb[29340].int:=0;tokenshow(defref);println;csconverting:=false;
writenoexpanding:=false;activenoconvert:=false;
eqtb[29339].int:=mubytesout;eqtb[29340].int:=mubyteslog;
flushlist(defref);
if j=18 then begin if(eqtb[29306].int<=0)then selector:=18 else selector
:=19;if not logopened then selector:=17;printnl(1934);
for d:=0 to(poolptr-strstart[strptr])-1 do begin print(strpool[strstart[
strptr]+d]);end;print(1935);
if shellenabledp then begin begin if poolptr+1>poolsize then overflow(
259,poolsize-initpoolptr);end;begin strpool[poolptr]:=0;incr(poolptr);
end;clobbered:=false;
for d:=0 to(poolptr-strstart[strptr])-1 do begin strpool[strstart[strptr
]+d]:=xchr[strpool[strstart[strptr]+d]];
if(strpool[strstart[strptr]+d]=0)and(d<(poolptr-strstart[strptr])-1)then
clobbered:=true;end;
if clobbered then print(1936)else begin runsystemret:=runsystem(
conststringcast(addressof(strpool[strstart[strptr]])));
if runsystemret=-1 then print(1937)else if runsystemret=0 then print(
1938)else if runsystemret=1 then print(1939)else if runsystemret=2 then
print(1940)end;end else begin print(1941);end;printchar(46);
printnl(345);println;poolptr:=strstart[strptr];end;selector:=oldsetting;
end;{:1617}{1620:}procedure outwhat(p:halfword);var j:smallnumber;
oldsetting:0..21;
begin case mem[p].hh.b1 of 0,1,2:{1622:}if not doingleaders then begin j
:=mem[p+1].hh.b0;
if mem[p].hh.b1=1 then writeout(p)else begin if writeopen[j]then begin
aclose(writefile[j]);writeopen[j]:=false;end;
if mem[p].hh.b1=2 then else if j<16 then begin curname:=mem[p+1].hh.rh;
curarea:=mem[p+2].hh.lh;curext:=mem[p+2].hh.rh;
if curext=345 then curext:=956;packfilename(curname,curarea,curext);
while not kpseoutnameok(stringcast(nameoffile+1))or not aopenout(
writefile[j])do promptfilename(1944,956);writeopen[j]:=true;
if logopened and texmfyesno('log_openout')then begin oldsetting:=
selector;if(eqtb[29306].int<=0)then selector:=18 else selector:=19;
printnl(1945);printint(j);print(1946);
printfilename(curname,curarea,curext);print(955);printnl(345);println;
selector:=oldsetting;end;end;end;end{:1622};3,4:specialout(p);5:;
23:{1621:}begin pdflastxpos:=curh+4736286;
pdflastypos:=curpageheight-curv-4736286;end{:1621};
others:begin if(7<=mem[p].hh.b1)and(mem[p].hh.b1<=50)then pdferror(1875,
1943)else confusion(1875)end;end;end;
{:1620}{1719:}function newedge(s:smallnumber;w:scaled):halfword;
var p:halfword;begin p:=getnode(3);mem[p].hh.b0:=14;mem[p].hh.b1:=s;
mem[p+1].int:=w;mem[p+2].int:=0;newedge:=p;end;
{:1719}{1723:}function reverse(thisbox,t:halfword;var curg:scaled;
var curglue:real):halfword;label 21,15,30;var l:halfword;p:halfword;
q:halfword;gorder:glueord;gsign:0..2;gluetemp:real;m,n:halfword;
begin gorder:=mem[thisbox+5].hh.b1;gsign:=mem[thisbox+5].hh.b0;l:=t;
p:=tempptr;m:=-268435455;n:=-268435455;
while true do begin while p<>-268435455 do{1724:}21:if(p>=himemmin)then
repeat f:=mem[p].hh.b0;c:=mem[p].hh.b1;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true
,f,c)].qqqq.b0].int;q:=mem[p].hh.rh;mem[p].hh.rh:=l;l:=p;p:=q;
until not(p>=himemmin)else{1725:}begin q:=mem[p].hh.rh;
case mem[p].hh.b0 of 0,1,2,11:rulewd:=mem[p+1].int;
{1726:}10:begin g:=mem[p+1].hh.lh;rulewd:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;rulewd:=rulewd+curg;
{1699:}if(((gsign=1)and(mem[g].hh.b0=gorder))or((gsign=2)and(mem[g].hh.
b1=gorder)))then begin begin if mem[g].hh.rh=-268435455 then freenode(g,
4)else decr(mem[g].hh.rh);end;
if mem[p].hh.b1<100 then begin mem[p].hh.b0:=11;mem[p+1].int:=rulewd;
end else begin g:=getnode(4);mem[g].hh.b0:=4;mem[g].hh.b1:=4;
mem[g+1].int:=rulewd;mem[g+2].int:=0;mem[g+3].int:=0;mem[p+1].hh.lh:=g;
end;end{:1699};end;{:1726}{1727:}6:begin flushnodelist(mem[p+1].hh.rh);
tempptr:=p;p:=getavail;mem[p]:=mem[tempptr+1];mem[p].hh.rh:=q;
freenode(tempptr,2);goto 21;end;
{:1727}{1728:}9:begin rulewd:=mem[p+1].int;
if odd(mem[p].hh.b1)then if mem[LRptr].hh.lh<>(4*(mem[p].hh.b1 div 4)+3)
then begin mem[p].hh.b0:=11;incr(LRproblems);
end else begin begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if n>-268435455 then begin decr(n);decr(mem[p].hh.b1);
end else begin mem[p].hh.b0:=11;
if m>-268435455 then decr(m)else{1729:}begin freenode(p,4);
mem[t].hh.rh:=q;mem[t+1].int:=rulewd;mem[t+2].int:=-curh-rulewd;goto 30;
end{:1729};end;end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(n>-268435455)or((mem[p].hh.b1 div 8)<>curdir)then begin incr(n);
incr(mem[p].hh.b1);end else begin mem[p].hh.b0:=11;incr(m);end;end;end;
{:1728}14:confusion(2056);others:goto 15 end;curh:=curh+rulewd;
15:mem[p].hh.rh:=l;
if mem[p].hh.b0=11 then if(rulewd=0)or(l=-268435455)then begin freenode(
p,4);p:=l;end;l:=p;p:=q;end{:1725}{:1724};
if(t=-268435455)and(m=-268435455)and(n=-268435455)then goto 30;
p:=newmath(0,mem[LRptr].hh.lh);LRproblems:=LRproblems+10000;end;
30:reverse:=l;end;{:1723}procedure hlistout;label 21,13,14,15,22,40;
var baseline:scaled;leftedge:scaled;saveh,savev:scaled;thisbox:halfword;
gorder:glueord;gsign:0..2;p:halfword;saveloc:integer;leaderbox:halfword;
leaderwd:scaled;lx:scaled;outerdoingleaders:boolean;edge:scaled;
prevp:halfword;gluetemp:real;curglue:real;curg:scaled;begin curg:=0;
curglue:=0.0;thisbox:=tempptr;gorder:=mem[thisbox+5].hh.b1;
gsign:=mem[thisbox+5].hh.b0;p:=mem[thisbox+5].hh.rh;incr(curs);
if curs>0 then begin dvibuf[dviptr]:=141;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if curs>maxpush then maxpush:=curs;
saveloc:=dvioffset+dviptr;baseline:=curv;prevp:=thisbox+5;
{1714:}if(eTeXmode=1)then begin{1710:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1710};
if(mem[thisbox].hh.b1)=2 then if curdir=1 then begin curdir:=0;
curh:=curh-mem[thisbox+1].int;end else mem[thisbox].hh.b1:=0;
if(curdir=1)and((mem[thisbox].hh.b1)<>1)then{1721:}begin saveh:=curh;
tempptr:=p;p:=newkern(0);mem[p+2].int:=0;mem[prevp].hh.rh:=p;curh:=0;
mem[p].hh.rh:=reverse(thisbox,-268435455,curg,curglue);
mem[p+1].int:=-curh;curh:=saveh;mem[thisbox].hh.b1:=1;end{:1721};
end{:1714};leftedge:=curh;{1927:}synctexhlist(thisbox);{:1927};
while p<>-268435455 do{648:}21:if(p>=himemmin)then begin if curh<>dvih
then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
repeat f:=mem[p].hh.b0;c:=mem[p].hh.b1;
if f<>dvif then{649:}begin if not fontused[f]then begin dvifontdef(f);
fontused[f]:=true;end;if f<=64 then begin dvibuf[dviptr]:=f+170;
incr(dviptr);if dviptr=dvilimit then dviswap;
end else if f<=256 then begin begin dvibuf[dviptr]:=235;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=f-1;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin begin dvibuf[dviptr]:=236;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=(f-1)div 256;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(f-1)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;end;dvif:=f;end{:649};
if fontec[f]>=c then if fontbc[f]<=c then if(fontinfo[charbase[f]+c].
qqqq.b0>0)then begin if c>=128 then begin dvibuf[dviptr]:=128;
incr(dviptr);if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=c;incr(dviptr);if dviptr=dvilimit then dviswap;
end;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+c].qqqq.b0].int;
goto 22;end;
if mltexenabledp then{1886:}begin{1889:}if c>=eqtb[29332].int then if c
<=eqtb[29333].int then if(eqtb[29021+c].hh.rh>0)then begin basec:=(eqtb[
29021+c].hh.rh mod 256);accentc:=(eqtb[29021+c].hh.rh div 256);
if(fontec[f]>=basec)then if(fontbc[f]<=basec)then if(fontec[f]>=accentc)
then if(fontbc[f]<=accentc)then begin iac:=fontinfo[charbase[f]+
effectivechar(true,f,accentc)].qqqq;
ibc:=fontinfo[charbase[f]+effectivechar(true,f,basec)].qqqq;
if(ibc.b0>0)then if(iac.b0>0)then goto 40;end;begindiagnostic;
printnl(2102);print(c);print(1642);print(accentc);print(32);
print(basec);print(999);slowprint(fontname[f]);printchar(33);
enddiagnostic(false);goto 22;end;begindiagnostic;printnl(998);
print(2101);print(c);print(999);slowprint(fontname[f]);printchar(33);
enddiagnostic(false);goto 22{:1889};
40:{1890:}if eqtb[29312].int>99 then begin begindiagnostic;
printnl(2103);print(c);print(1642);print(accentc);print(32);
print(basec);print(999);slowprint(fontname[f]);printchar(46);
enddiagnostic(false);end{:1890};
{1891:}basexheight:=fontinfo[5+parambase[f]].int;
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
dvih:=curh{:1891};end{:1886};22:prevp:=mem[prevp].hh.rh;p:=mem[p].hh.rh;
until not(p>=himemmin);{1930:}synctexcurrent;{:1930};dvih:=curh;
end else{650:}begin case mem[p].hh.b0 of 0,1:{651:}if mem[p+5].hh.rh=
-268435455 then begin{1929:}if mem[p].hh.b0=1 then begin
synctexvoidvlist(p,thisbox);end else begin synctexvoidhlist(p,thisbox);
end;{:1929};curh:=curh+mem[p+1].int;end else begin saveh:=dvih;
savev:=dviv;curv:=baseline+mem[p+4].int;tempptr:=p;
edge:=curh+mem[p+1].int;if curdir=1 then curh:=edge;
if mem[p].hh.b0=1 then vlistout else hlistout;dvih:=saveh;dviv:=savev;
curh:=edge;curv:=baseline;end{:651};2:begin ruleht:=mem[p+3].int;
ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;goto 14;end;
8:{1614:}outwhat(p){:1614};10:{653:}begin g:=mem[p+1].hh.lh;
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
if(eTeXmode=1)then{1699:}if(((gsign=1)and(mem[g].hh.b0=gorder))or((gsign
=2)and(mem[g].hh.b1=gorder)))then begin begin if mem[g].hh.rh=-268435455
then freenode(g,4)else decr(mem[g].hh.rh);end;
if mem[p].hh.b1<100 then begin mem[p].hh.b0:=11;mem[p+1].int:=rulewd;
end else begin g:=getnode(4);mem[g].hh.b0:=4;mem[g].hh.b1:=4;
mem[g+1].int:=rulewd;mem[g+2].int:=0;mem[g+3].int:=0;mem[p+1].hh.lh:=g;
end;end{:1699};
if mem[p].hh.b1>=100 then{654:}begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=2 then begin ruleht:=mem[leaderbox+3].int;
ruledp:=mem[leaderbox+2].int;goto 14;end;leaderwd:=mem[leaderbox+1].int;
if(leaderwd>0)and(rulewd>0)then begin rulewd:=rulewd+10;
if curdir=1 then curh:=curh-10;edge:=curh+rulewd;lx:=0;
{655:}if mem[p].hh.b1=100 then begin saveh:=curh;
curh:=leftedge+leaderwd*((curh-leftedge)div leaderwd);
if curh<saveh then curh:=curh+leaderwd;
end else begin lq:=rulewd div leaderwd;lr:=rulewd mod leaderwd;
if mem[p].hh.b1=101 then curh:=curh+(lr div 2)else begin lx:=lr div(lq+1
);curh:=curh+((lr-(lq-1)*lx)div 2);end;end{:655};
while curh+leaderwd<=edge do{656:}begin curv:=baseline+mem[leaderbox+4].
int;if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
savev:=dviv;if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;
end;saveh:=dvih;tempptr:=leaderbox;if curdir=1 then curh:=curh+leaderwd;
outerdoingleaders:=doingleaders;doingleaders:=true;
if mem[leaderbox].hh.b0=1 then vlistout else hlistout;
doingleaders:=outerdoingleaders;dviv:=savev;dvih:=saveh;curv:=baseline;
curh:=saveh+leaderwd+lx;end{:656};
if curdir=1 then curh:=edge else curh:=edge-10;goto 15;end;end{:654};
goto 13;end{:653};40:curh:=curh+mem[p+1].int;
11:begin{1932:}synctexkern(p,thisbox);{:1932};curh:=curh+mem[p+1].int;
end;9:begin{1933:}synctexmath(p,thisbox);{:1933};
{1716:}begin if(eTeXmode=1)then{1717:}begin if odd(mem[p].hh.b1)then if
mem[LRptr].hh.lh=(4*(mem[p].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;
end else begin if mem[p].hh.b1>4 then incr(LRproblems);
end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(mem[p].hh.b1 div 8)<>curdir then{1722:}begin saveh:=curh;
tempptr:=mem[p].hh.rh;rulewd:=mem[p+1].int;freenode(p,4);
curdir:=1-curdir;p:=newedge(curdir,rulewd);mem[prevp].hh.rh:=p;
curh:=curh-leftedge+rulewd;
mem[p].hh.rh:=reverse(thisbox,newedge(1-curdir,0),curg,curglue);
mem[p+2].int:=curh;curdir:=1-curdir;curh:=saveh;goto 21;end{:1722};end;
mem[p].hh.b0:=11;end{:1717};curh:=curh+mem[p+1].int;end{:1716};end;
6:{826:}begin mem[memtop-12]:=mem[p+1];
mem[memtop-12].hh.rh:=mem[p].hh.rh;p:=memtop-12;goto 21;end{:826};
{1720:}14:begin curh:=curh+mem[p+1].int;leftedge:=curh+mem[p+2].int;
curdir:=mem[p].hh.b1;end;{:1720}others:end;goto 15;
14:{652:}if(ruleht=-1073741824)then ruleht:=mem[thisbox+3].int;
if(ruledp=-1073741824)then ruledp:=mem[thisbox+2].int;
ruleht:=ruleht+ruledp;
if(ruleht>0)and(rulewd>0)then begin if curh<>dvih then begin movement(
curh-dvih,143);dvih:=curh;end;curv:=baseline+ruledp;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=132;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);curv:=baseline;dvih:=dvih+rulewd;
end{:652};13:begin curh:=curh+rulewd;
{1931:}synctexhorizontalruleorglue(p,thisbox);{:1931};end;15:prevp:=p;
p:=mem[p].hh.rh;end{:650}{:648};{1928:}synctextsilh(thisbox);{:1928};
{1715:}if(eTeXmode=1)then begin{1718:}begin while mem[LRptr].hh.lh<>0 do
begin if mem[LRptr].hh.lh>4 then LRproblems:=LRproblems+10000;
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;end;
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;end{:1718};
if(mem[thisbox].hh.b1)=2 then curdir:=1;end{:1715};
prunemovements(saveloc);if curs>0 then dvipop(saveloc);decr(curs);end;
{:647}{657:}procedure vlistout;label 13,14,15;var leftedge:scaled;
topedge:scaled;saveh,savev:scaled;thisbox:halfword;gorder:glueord;
gsign:0..2;p:halfword;saveloc:integer;leaderbox:halfword;
leaderht:scaled;lx:scaled;outerdoingleaders:boolean;edge:scaled;
gluetemp:real;curglue:real;curg:scaled;begin curg:=0;curglue:=0.0;
thisbox:=tempptr;gorder:=mem[thisbox+5].hh.b1;
gsign:=mem[thisbox+5].hh.b0;p:=mem[thisbox+5].hh.rh;incr(curs);
if curs>0 then begin dvibuf[dviptr]:=141;incr(dviptr);
if dviptr=dvilimit then dviswap;end;if curs>maxpush then maxpush:=curs;
saveloc:=dvioffset+dviptr;leftedge:=curh;{1925:}synctexvlist(thisbox);
{:1925};curv:=curv-mem[thisbox+3].int;topedge:=curv;
while p<>-268435455 do{658:}begin if(p>=himemmin)then confusion(1002)
else{659:}begin case mem[p].hh.b0 of 0,1:{660:}if mem[p+5].hh.rh=
-268435455 then begin curv:=curv+mem[p+3].int;
{1929:}if mem[p].hh.b0=1 then begin synctexvoidvlist(p,thisbox);
end else begin synctexvoidhlist(p,thisbox);end;{:1929};
curv:=curv+mem[p+2].int;end else begin curv:=curv+mem[p+3].int;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
saveh:=dvih;savev:=dviv;
if curdir=1 then curh:=leftedge-mem[p+4].int else curh:=leftedge+mem[p+4
].int;tempptr:=p;if mem[p].hh.b0=1 then vlistout else hlistout;
dvih:=saveh;dviv:=savev;curv:=savev+mem[p+2].int;curh:=leftedge;
end{:660};2:begin ruleht:=mem[p+3].int;ruledp:=mem[p+2].int;
rulewd:=mem[p+1].int;goto 14;end;8:{1613:}outwhat(p){:1613};
10:{662:}begin g:=mem[p+1].hh.lh;ruleht:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;ruleht:=ruleht+curg;
if mem[p].hh.b1>=100 then{663:}begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=2 then begin rulewd:=mem[leaderbox+1].int;
ruledp:=0;goto 14;end;
leaderht:=mem[leaderbox+3].int+mem[leaderbox+2].int;
if(leaderht>0)and(ruleht>0)then begin ruleht:=ruleht+10;
edge:=curv+ruleht;lx:=0;
{664:}if mem[p].hh.b1=100 then begin savev:=curv;
curv:=topedge+leaderht*((curv-topedge)div leaderht);
if curv<savev then curv:=curv+leaderht;
end else begin lq:=ruleht div leaderht;lr:=ruleht mod leaderht;
if mem[p].hh.b1=101 then curv:=curv+(lr div 2)else begin lx:=lr div(lq+1
);curv:=curv+((lr-(lq-1)*lx)div 2);end;end{:664};
while curv+leaderht<=edge do{665:}begin if curdir=1 then curh:=leftedge-
mem[leaderbox+4].int else curh:=leftedge+mem[leaderbox+4].int;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
saveh:=dvih;curv:=curv+mem[leaderbox+3].int;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
savev:=dviv;tempptr:=leaderbox;outerdoingleaders:=doingleaders;
doingleaders:=true;
if mem[leaderbox].hh.b0=1 then vlistout else hlistout;
doingleaders:=outerdoingleaders;dviv:=savev;dvih:=saveh;curh:=leftedge;
curv:=savev-mem[leaderbox+3].int+leaderht+lx;end{:665};curv:=edge-10;
goto 15;end;end{:663};goto 13;end{:662};11:curv:=curv+mem[p+1].int;
others:end;goto 15;
14:{661:}if(rulewd=-1073741824)then rulewd:=mem[thisbox+1].int;
ruleht:=ruleht+ruledp;curv:=curv+ruleht;
if(ruleht>0)and(rulewd>0)then begin if curdir=1 then curh:=curh-rulewd;
if curh<>dvih then begin movement(curh-dvih,143);dvih:=curh;end;
if curv<>dviv then begin movement(curv-dviv,157);dviv:=curv;end;
begin dvibuf[dviptr]:=137;incr(dviptr);if dviptr=dvilimit then dviswap;
end;dvifour(ruleht);dvifour(rulewd);curh:=leftedge;end;goto 15{:661};
13:curv:=curv+ruleht;end{:659};15:p:=mem[p].hh.rh;end{:658};
{1926:}synctextsilv(thisbox);{:1926};prunemovements(saveloc);
if curs>0 then dvipop(saveloc);decr(curs);end;
{:657}{666:}procedure dvishipout(p:halfword);label 30;
var pageloc:integer;j,k:0..9;s:poolpointer;oldsetting:0..21;
begin{1923:}synctexsheet(eqtb[29294].int);{:1923};
begin if eqtb[29311].int>0 then begin printnl(345);println;print(1003);
end;if termoffset>maxprintline-9 then println else if(termoffset>0)or(
fileoffset>0)then printchar(32);printchar(91);j:=9;
while(eqtb[29391+j].int=0)and(j>0)do decr(j);
for k:=0 to j do begin printint(eqtb[29391+k].int);
if k<j then printchar(46);end;fflush(stdout);
if eqtb[29311].int>0 then begin printchar(93);begindiagnostic;
showbox(p);enddiagnostic(true);end;
{668:}{669:}if(mem[p+3].int>1073741823)or(mem[p+2].int>1073741823)or(mem
[p+3].int+mem[p+2].int+eqtb[29922].int>1073741823)or(mem[p+1].int+eqtb[
29921].int>1073741823)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1007);
end;begin helpptr:=2;helpline[1]:=1008;helpline[0]:=1009;end;error;
if eqtb[29311].int<=0 then begin begindiagnostic;printnl(1010);
showbox(p);enddiagnostic(true);end;goto 30;end;
if mem[p+3].int+mem[p+2].int+eqtb[29922].int>maxv then maxv:=mem[p+3].
int+mem[p+2].int+eqtb[29922].int;
if mem[p+1].int+eqtb[29921].int>maxh then maxh:=mem[p+1].int+eqtb[29921]
.int{:669};{645:}dvih:=0;dviv:=0;curh:=eqtb[29921].int;dvif:=0;
{644:}curhoffset:=eqtb[29921].int;curvoffset:=eqtb[29922].int;
if eqtb[29926].int<>0 then curpagewidth:=eqtb[29926].int else
curpagewidth:=mem[p+1].int+2*curhoffset+2*4736286;
if eqtb[29927].int<>0 then curpageheight:=eqtb[29927].int else
curpageheight:=mem[p+3].int+mem[p+2].int+2*curvoffset+2*4736286{:644};
if outputfilename=0 then begin if jobname=0 then openlogfile;
packjobname(960);while not bopenout(dvifile)do promptfilename(961,960);
outputfilename:=bmakenamestring(dvifile);end;
if totalpages=0 then begin begin dvibuf[dviptr]:=247;incr(dviptr);
if dviptr=dvilimit then dviswap;end;begin dvibuf[dviptr]:=2;
incr(dviptr);if dviptr=dvilimit then dviswap;end;dvifour(25400000);
dvifour(473628672);preparemag;dvifour(eqtb[29294].int);
if outputcomment then begin l:=strlen(outputcomment);
begin dvibuf[dviptr]:=l;incr(dviptr);if dviptr=dvilimit then dviswap;
end;for s:=0 to l-1 do begin dvibuf[dviptr]:=outputcomment[s];
incr(dviptr);if dviptr=dvilimit then dviswap;end;
end else begin oldsetting:=selector;selector:=21;print(1001);
printint(eqtb[29300].int);printchar(46);printtwo(eqtb[29299].int);
printchar(46);printtwo(eqtb[29298].int);printchar(58);
printtwo(eqtb[29297].int div 60);printtwo(eqtb[29297].int mod 60);
selector:=oldsetting;begin dvibuf[dviptr]:=(poolptr-strstart[strptr]);
incr(dviptr);if dviptr=dvilimit then dviswap;end;
for s:=strstart[strptr]to poolptr-1 do begin dvibuf[dviptr]:=strpool[s];
incr(dviptr);if dviptr=dvilimit then dviswap;end;
poolptr:=strstart[strptr];end;end{:645};pageloc:=dvioffset+dviptr;
begin dvibuf[dviptr]:=139;incr(dviptr);if dviptr=dvilimit then dviswap;
end;for k:=0 to 9 do dvifour(eqtb[29391+k].int);dvifour(lastbop);
lastbop:=pageloc;curv:=mem[p+3].int+eqtb[29922].int;tempptr:=p;
if mem[p].hh.b0=1 then vlistout else hlistout;begin dvibuf[dviptr]:=140;
incr(dviptr);if dviptr=dvilimit then dviswap;end;incr(totalpages);
curs:=-1;
ifdef('IPC')if ipcon>0 then begin if dvilimit=halfbuf then begin
writedvi(halfbuf,dvibufsize-1);flushdvi;dvigone:=dvigone+halfbuf;end;
if dviptr>(2147483647-dvioffset)then begin curs:=-2;fatalerror(1000);
end;if dviptr>0 then begin writedvi(0,dviptr-1);flushdvi;
dvioffset:=dvioffset+dviptr;dvigone:=dvigone+dviptr;end;dviptr:=0;
dvilimit:=dvibufsize;ipcpage(dvigone);end;endif('IPC');30:{:668};
if(eTeXmode=1)then{1730:}begin if LRproblems>0 then begin{1713:}begin
println;printnl(2053);printint(LRproblems div 10000);print(2054);
printint(LRproblems mod 10000);print(2055);LRproblems:=0;end{:1713};
printchar(41);println;end;
if(LRptr<>-268435455)or(curdir<>0)then confusion(2057);end{:1730};
if eqtb[29311].int<=0 then printchar(93);deadcycles:=0;fflush(stdout);
{667:}ifdef('STAT')if eqtb[29308].int>1 then begin printnl(1004);
printint(varused);printchar(38);printint(dynused);printchar(59);end;
endif('STAT')flushnodelist(p);
ifdef('STAT')if eqtb[29308].int>1 then begin print(1005);
printint(varused);printchar(38);printint(dynused);print(1006);
printint(himemmin-lomemmax-1);println;end;endif('STAT'){:667};end;
{1924:}synctexteehs;{:1924};end;
{:666}{673:}function getpdfcompresslevel:integer;
begin getpdfcompresslevel:=eqtb[29343].int;end;
function getpdfsuppresswarningdupmap:integer;
begin getpdfsuppresswarningdupmap:=eqtb[29371].int;end;
function getpdfsuppresswarningpagegroup:integer;
begin getpdfsuppresswarningpagegroup:=eqtb[29372].int;end;
function getpdfsuppressptexinfo:integer;
begin getpdfsuppressptexinfo:=eqtb[29374].int;end;
function getpdfomitcharset:integer;
begin getpdfomitcharset:=eqtb[29375].int;end;
function getptexuseunderscore:boolean;
begin getptexuseunderscore:=(eqtb[29378].int>0)or(eqtb[29351].int>=2)end
;function getnullfont:internalfontnumber;begin getnullfont:=0;end;
function getfontbase:internalfontnumber;begin getfontbase:=0;end;
function getnullcs:halfword;begin getnullcs:=513;end;
function getnullptr:halfword;begin getnullptr:=-268435455;end;
function gettexint(code:integer):integer;
begin gettexint:=eqtb[29277+code].int;end;
function gettexdimen(code:integer):scaled;
begin gettexdimen:=eqtb[29903+code].int;end;
function getxheight(f:internalfontnumber):scaled;
begin getxheight:=fontinfo[5+parambase[f]].int;end;
function getcharwidth(f:internalfontnumber;c:eightbits):scaled;
begin if((fontbc[f]<=c)and(c<=fontec[f])and(fontinfo[charbase[f]+c].qqqq
.b0>0))then getcharwidth:=fontinfo[widthbase[f]+fontinfo[charbase[f]+c].
qqqq.b0].int else getcharwidth:=0;end;
function getcharheight(f:internalfontnumber;c:eightbits):scaled;
begin if((fontbc[f]<=c)and(c<=fontec[f])and(fontinfo[charbase[f]+c].qqqq
.b0>0))then getcharheight:=fontinfo[heightbase[f]+(fontinfo[charbase[f]+
c].qqqq.b1)div 16].int else getcharheight:=0;end;
function getchardepth(f:internalfontnumber;c:eightbits):scaled;
begin if((fontbc[f]<=c)and(c<=fontec[f])and(fontinfo[charbase[f]+c].qqqq
.b0>0))then getchardepth:=fontinfo[depthbase[f]+(fontinfo[charbase[f]+c]
.qqqq.b1)mod 16].int else getchardepth:=0;end;
function getquad(f:internalfontnumber):scaled;
begin getquad:=fontinfo[6+parambase[f]].int;end;
function getslant(f:internalfontnumber):scaled;
begin getslant:=fontinfo[1+parambase[f]].int;end;
{:673}{674:}procedure shortdisplayn(p,m:integer);var n:integer;
i:integer;begin i:=0;fontinshortdisplay:=0;if p=-268435455 then goto 10;
while p>memmin do begin if(p>=himemmin)then begin if p<=memend then
begin if mem[p].hh.b0<>fontinshortdisplay then begin if(mem[p].hh.b0<0)
or(mem[p].hh.b0>fontmax)then printchar(42)else printfontidentifier(mem[p
].hh.b0);printchar(32);fontinshortdisplay:=mem[p].hh.b0;end;
print(mem[p].hh.b1);end;
end else begin if(mem[p].hh.b0=10)or(mem[p].hh.b0=7)or(mem[p].hh.b0=12)
or((mem[p].hh.b0=11)and(mem[p].hh.b1=1))then incr(i);
if i>=m then goto 10;if(mem[p].hh.b0=7)then begin print(124);
shortdisplay(mem[p+1].hh.lh);print(124);shortdisplay(mem[p+1].hh.rh);
print(124);n:=mem[p].hh.b1;
while n>0 do begin if mem[p].hh.rh<>-268435455 then p:=mem[p].hh.rh;
decr(n);end;
end else{193:}case mem[p].hh.b0 of 0,1,3,8,4,5,13:print(313);
2:printchar(124);10:if mem[p+1].hh.lh<>membot then printchar(32);
9:if mem[p].hh.b1>=4 then print(313)else printchar(36);
6:shortdisplay(mem[p+1].hh.rh);7:begin shortdisplay(mem[p+1].hh.lh);
shortdisplay(mem[p+1].hh.rh);n:=mem[p].hh.b1;
while n>0 do begin if mem[p].hh.rh<>-268435455 then p:=mem[p].hh.rh;
decr(n);end;end;others:end{:193};end;p:=mem[p].hh.rh;
if p=-268435455 then goto 10;end;fflush(stdout);end;
{:674}{678:}function pdfgetmem(s:integer):integer;var a:integer;
begin if s>suppdfmemsize-pdfmemptr then overflow(1017,pdfmemsize);
if pdfmemptr+s>pdfmemsize then begin a:=0.2*pdfmemsize;
if pdfmemptr+s>pdfmemsize+a then pdfmemsize:=pdfmemptr+s else if
pdfmemsize<suppdfmemsize-a then pdfmemsize:=pdfmemsize+a else pdfmemsize
:=suppdfmemsize;pdfmem:=xreallocarray(pdfmem,integer,pdfmemsize);end;
pdfgetmem:=pdfmemptr;pdfmemptr:=pdfmemptr+s;end;
{:678}{682:}function fixint(val,min,max:integer):integer;
begin if val<min then fixint:=min else if val>max then fixint:=max else
fixint:=val;end;{:682}{683:}procedure checkpdfversion;
begin if not pdfversionwritten then begin pdfversionwritten:=true;
if eqtb[29351].int<1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1019);
end;println;begin helpptr:=2;helpline[1]:=1020;helpline[0]:=1021;end;
interror(eqtb[29351].int);eqtb[29351].int:=1;end;
if(eqtb[29352].int<0)or(eqtb[29352].int>9)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1022);
end;println;begin helpptr:=2;helpline[1]:=1023;helpline[0]:=1024;end;
interror(eqtb[29352].int);eqtb[29352].int:=4;end;
fixedpdfmajorversion:=eqtb[29351].int;
fixedpdfminorversion:=eqtb[29352].int;
fixedgamma:=fixint(eqtb[29356].int,0,1000000);
fixedimagegamma:=fixint(eqtb[29357].int,0,1000000);
fixedimagehicolor:=fixint(eqtb[29358].int,0,1);
fixedimageapplygamma:=fixint(eqtb[29359].int,0,1);
fixedpdfobjcompresslevel:=fixint(eqtb[29363].int,0,3);
fixedpdfdraftmode:=fixint(eqtb[29368].int,0,1);
fixedinclusioncopyfont:=fixint(eqtb[29369].int,0,1);
if((fixedpdfmajorversion>1)or(fixedpdfminorversion>=5))and(
fixedpdfobjcompresslevel>0)then pdfosenable:=true else begin if
fixedpdfobjcompresslevel>0 then begin pdfwarning(1025,1026,true,true);
fixedpdfobjcompresslevel:=0;end;pdfosenable:=false;end;ensurepdfopen;
fixpdfoutput;pdfprint(1027);pdfprintint(fixedpdfmajorversion);
pdfprint(46);begin pdfprintint(fixedpdfminorversion);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfprint(37);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=208;incr(pdfptr);end;end;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=212;incr(pdfptr);end;end;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=197;incr(pdfptr);end;end;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=216;incr(pdfptr);end;end;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;
end else begin if(fixedpdfminorversion<>eqtb[29352].int)or(
fixedpdfmajorversion<>eqtb[29351].int)then pdferror(1028,1029);end;end;
{:683}{684:}procedure ensurepdfopen;
begin if outputfilename<>0 then goto 10;if jobname=0 then openlogfile;
packjobname(1030);
if fixedpdfdraftmode=0 then while not bopenout(pdffile)do promptfilename
(961,1030);outputfilename:=bmakenamestring(pdffile);end;
{:684}{685:}procedure pdfflush;var savedpdfgone:longinteger;
begin if not pdfosmode then begin savedpdfgone:=pdfgone;
case zipwritestate of 0:if pdfptr>0 then begin if fixedpdfdraftmode=0
then writepdf(0,pdfptr-1);pdfgone:=pdfgone+pdfptr;
pdflastbyte:=pdfbuf[pdfptr-1];end;
1:if fixedpdfdraftmode=0 then writezip(false);
2:begin if fixedpdfdraftmode=0 then writezip(true);zipwritestate:=0;end;
end;pdfptr:=0;if savedpdfgone>pdfgone then pdferror(1031,1032);end;end;
procedure pdfbeginstream;begin begin pdfprint(1033);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfseekwritelength:=true;pdfstreamlengthoffset:=(pdfgone+pdfptr)-11;
pdfstreamlength:=0;pdflastbyte:=0;
if eqtb[29343].int>0 then begin begin pdfprint(1034);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(1035);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(1036);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfflush;
zipwritestate:=1;end else begin begin pdfprint(1035);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(1036);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfsaveoffset:=(pdfgone+pdfptr);end;end;procedure pdfendstream;
begin if zipwritestate=1 then zipwritestate:=2 else pdfstreamlength:=(
pdfgone+pdfptr)-pdfsaveoffset;pdfflush;
if pdfseekwritelength then writestreamlength(pdfstreamlength,
pdfstreamlengthoffset);pdfseekwritelength:=false;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;begin pdfprint(1037);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfendobj;end;
{:685}{690:}procedure advcharwidth(f:internalfontnumber;c:eightbits);
var w,sout:scaled;s:integer;
begin w:=fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true,f
,c)].qqqq.b0].int;
if isscalable(f)then begin if pdfcurTma=0 then begin s:=dividescaled(w,
pdffontsize[f],4);sout:=scaledout;pdfdeltah:=pdfdeltah+sout;
end else begin s:=dividescaled(roundxnoverd(w,1000,1000+pdfcurTma),
pdffontsize[f],4);
sout:=roundxnoverd(roundxnoverd(pdffontsize[f],abs(s),10000),1000+
pdfcurTma,1000);if s<0 then sout:=-sout;pdfdeltah:=pdfdeltah+sout;end;
advcharwidths:=round(s/10);advcharwidthsout:=sout;
end else pdfdeltah:=pdfdeltah+getpkcharwidth(f,w);end;
procedure pdfprintreal(m,d:integer);
begin if m<0 then begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize
)then pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then
overflow(1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize
)then pdfflush;end;begin pdfbuf[pdfptr]:=45;incr(pdfptr);end;end;m:=-m;
end;pdfprintint(m div tenpow[d]);m:=m mod tenpow[d];
if m>0 then begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=46;incr(pdfptr);end;end;decr(d);
while m<tenpow[d]do begin begin begin if pdfosmode and(1+pdfptr>
pdfbufsize)then pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)
then overflow(1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>
pdfbufsize)then pdfflush;end;begin pdfbuf[pdfptr]:=48;incr(pdfptr);end;
end;decr(d);end;while m mod 10=0 do m:=m div 10;pdfprintint(m);end;end;
procedure pdfprintbp(s:scaled);
begin pdfprintreal(dividescaled(s,onehundredbp,fixeddecimaldigits+2),
fixeddecimaldigits);end;procedure pdfprintmagbp(s:scaled);
begin preparemag;
if eqtb[29294].int<>1000 then s:=roundxnoverd(s,eqtb[29294].int,1000);
pdfprintbp(s);end;{:690}{692:}procedure pdfsetorigin(h,v:scaled);
begin if(abs(h-pdforiginh)>=minbpval)or(abs(v-pdforiginv)>=minbpval)then
begin pdfprint(1046);pdfprintbp(h-pdforiginh);
pdforiginh:=pdforiginh+scaledout;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;pdfprintbp(pdforiginv-v);
pdforiginv:=pdforiginv-scaledout;begin pdfprint(1047);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;pdfh:=pdforiginh;
pdftjstarth:=pdfh;pdfv:=pdforiginv;end;
procedure pdfsetorigintemp(h,v:scaled);
begin if(abs(h-pdforiginh)>=minbpval)or(abs(v-pdforiginv)>=minbpval)then
begin pdfprint(1046);pdfprintbp(h-pdforiginh);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;pdfprintbp(pdforiginv-v);
begin pdfprint(1047);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;end;
procedure pdfendstring;
begin if pdfdoingstring then begin pdfprint(1048);pdfdoingstring:=false;
end;end;procedure pdfendstringnl;
begin if pdfdoingstring then begin begin pdfprint(1048);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfdoingstring:=false;
end;end;function getfontautoexpandratio(f:internalfontnumber):integer;
begin if pdffontautoexpand[f]then getfontautoexpandratio:=
pdffontexpandratio[f]else getfontautoexpandratio:=0;end;
procedure pdfsettextpos(v,vout:scaled;f:internalfontnumber);
var pdfnewTma:integer;
begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfnewTma:=getfontautoexpandratio(f);
if(pdfnewTma<>0)or((pdfnewTma=0)and(pdfcurTma<>0))then begin
pdfprintreal(1000+pdfnewTma,3);pdfprint(1049);
pdfprintbp(curh-pdforiginh);pdfh:=pdforiginh+scaledout;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintbp(pdforiginv-curv);pdfv:=pdforiginv-scaledout;pdfprint(1050);
pdfcurTma:=pdfnewTma;pdfassert(pdfcurTma>-1000);
end else begin pdfprintbp(curh-pdftjstarth);pdfh:=pdftjstarth+scaledout;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintreal(v,fixeddecimaldigits);pdfv:=pdfv-vout;pdfprint(1051);end;
pdftjstarth:=pdfh;pdfdeltah:=0;end;
procedure pdfusefont(f:internalfontnumber;fontnum:integer);
begin begin if dividescaled(fontsize[f],onehundredbp,6)<>0 then end;
pdffontsize[f]:=scaledout;fontused[f]:=true;
pdfassert((fontnum>0)or((fontnum<0)and(pdffontnum[-fontnum]>0)));
pdffontnum[f]:=fontnum;
if eqtb[29345].int>0 then begin pdfwarning(0,1052,true,true);
eqtb[29345].int:=0;end;end;
{:692}{693:}procedure pdfinitfont(f:internalfontnumber);
var k,b:internalfontnumber;i:integer;begin pdfassert(not fontused[f]);
if pdffontautoexpand[f]and(pdffontblink[f]<>0)then begin b:=pdffontblink
[f];if not isscalable(b)then pdferror(1053,1054);
if not fontused[b]then pdfinitfont(b);pdffontmap[f]:=pdffontmap[b];end;
if isscalable(f)then begin i:=headtab[3];
while i<>0 do begin k:=objtab[i].int0;
if isscalable(k)and(pdffontmap[k]=pdffontmap[f])and(streqstr(fontname[k]
,fontname[f])or(pdffontautoexpand[f]and(pdffontblink[f]<>0)and streqstr(
fontname[k],fontname[pdffontblink[f]])))then begin pdfassert(pdffontnum[
k]<>0);
if pdffontnum[k]<0 then pdfusefont(f,pdffontnum[k])else pdfusefont(f,-k)
;goto 10;end;i:=objtab[i].int1;end;end;pdfcreateobj(3,f);
pdffonthasspacechar[f]:=hasspacechar(f)and(fontinfo[widthbase[f]+
fontinfo[charbase[f]+effectivechar(true,f,32)].qqqq.b0].int>onebp);
pdfusefont(f,objptr);end;procedure pdfinitfontcurval;
begin pdfinitfont(curval);end;
procedure pdfsetfont(f:internalfontnumber);label 40,41;var p:halfword;
k:internalfontnumber;begin pdff:=f;
if not fontused[f]then pdfinitfont(f);
begin if pdffontnum[f]<0 then ff:=-pdffontnum[f]else ff:=f;end;k:=ff;
p:=pdffontlist;
while p<>-268435455 do begin begin if pdffontnum[mem[p].hh.lh]<0 then ff
:=-pdffontnum[mem[p].hh.lh]else ff:=mem[p].hh.lh;end;
if ff=k then goto 40;p:=mem[p].hh.rh;end;begin pdfappendlistarg:=f;
pdffontlist:=appendptr(pdffontlist,pdfappendlistarg);end;
40:if(k=pdflastf)and(fontsize[f]=pdflastfs)then goto 10;pdfprint(1055);
pdfprintint(k);if pdfresnameprefix<>0 then pdfprint(pdfresnameprefix);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintreal(dividescaled(fontsize[f],onehundredbp,6),4);pdfprint(1056);
pdflastf:=k;pdflastfs:=fontsize[f];end;procedure pdfbegintext;
begin pdfsetorigin(0,curpageheight);begin pdfprint(1057);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfdoingtext:=true;
pdff:=0;pdflastf:=0;pdflastfs:=0;pdfdoingstring:=false;pdfcurTma:=0;end;
procedure pdfreaddummyfont;
begin if pdfdummyfont=0 then begin pdfdummyfont:=readfontinfo(513,
pdfspacefontname,345,-1000);pdfmaplinesp;pdfmarkchar(pdfdummyfont,32);
end;end;procedure pdfinsertinterwordspace;begin pdfreaddummyfont;
pdfsetfont(pdfdummyfont);pdfprint(1058);end;
procedure pdfbeginstring(f:internalfontnumber);var sout,v,vout:scaled;
s:integer;mustendstring:boolean;mustinsertspace:boolean;
mustsettextpos:boolean;movelookslikeinterwordspace:boolean;
begin mustendstring:=false;mustinsertspace:=false;mustsettextpos:=false;
if not pdfdoingtext then begin pdfbegintext;mustsettextpos:=true;end;
if(not genfakedinterwordspace and pdff<>f)or(genfakedinterwordspace and
not(fontused[f]and fontused[pdff]))then begin pdfendstring;
pdfsetfont(f);end;
if pdfcurTma=0 then begin s:=dividescaled(curh-(pdftjstarth+pdfdeltah),
pdffontsize[f],3);sout:=scaledout;
end else begin s:=dividescaled(roundxnoverd(curh-(pdftjstarth+pdfdeltah)
,1000,1000+pdfcurTma),pdffontsize[f],3);
if abs(s)<32768 then begin sout:=roundxnoverd(roundxnoverd(pdffontsize[f
],abs(s),1000),1000+pdfcurTma,1000);if s<0 then sout:=-sout;end;end;
if abs(curv-pdfv)>=minbpval then begin v:=dividescaled(pdfv-curv,
onehundredbp,fixeddecimaldigits+2);vout:=scaledout;end else begin v:=0;
vout:=0;end;
if not mustsettextpos then begin mustsettextpos:=(v<>0)or(abs(s)>=32768)
or(getfontautoexpandratio(f)<>pdfcurTma)or getfontautoexpandratio(f)<>
getfontautoexpandratio(pdff);end;
if mustsettextpos then begin mustendstring:=true;end;
movelookslikeinterwordspace:=(fontinfo[2+parambase[f]].int>onebp)and(
sout>fontinfo[2+parambase[f]].int-fontinfo[4+parambase[f]].int-onebp div
10)and(v=0);
if genfakedinterwordspace and movelookslikeinterwordspace then begin
mustinsertspace:=true;end;
if(mustinsertspace)then begin if pdffonthasspacechar[f]and
pdfdoingstring then begin begin begin if pdfosmode and(1+pdfptr>
pdfbufsize)then pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)
then overflow(1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>
pdfbufsize)then pdfflush;end;begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;
end;advcharwidth(f,32);s:=s-advcharwidths;sout:=sout-advcharwidthsout;
pdfmarkchar(f,32);end else mustendstring:=true;end;
if mustendstring then begin pdfendstring;
if(mustinsertspace)and(not pdffonthasspacechar[f])then begin
pdfinsertinterwordspace;end;pdfsetfont(f);pdfsettextpos(v,vout,f);s:=0;
end;if genfakedinterwordspace and(pdff<>f)then begin pdfendstring;
pdfsetfont(f);end;if not pdfdoingstring then begin pdfprint(1059);
if s=0 then begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=40;incr(pdfptr);end;end;end;
if s<>0 then begin if pdfdoingstring then begin begin if pdfosmode and(
1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)else if not pdfosmode and(1>
pdfbufsize)then overflow(1018,pdfopbufsize)else if not pdfosmode and(1+
pdfptr>pdfbufsize)then pdfflush;end;begin pdfbuf[pdfptr]:=41;
incr(pdfptr);end;end;pdfprintint(-s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=40;incr(pdfptr);end;end;pdfdeltah:=pdfdeltah+sout;
end;pdfdoingstring:=true;end;procedure pdfinsertfakespace;var s:integer;
begin s:=genfakedinterwordspace;genfakedinterwordspace:=0;
pdfreaddummyfont;pdfbeginstring(pdfdummyfont);pdfprint(32);
advcharwidth(pdfdummyfont,32);pdfendstringnl;genfakedinterwordspace:=s;
end;procedure pdfendtext;
begin if pdfdoingtext then begin pdfendstringnl;begin pdfprint(1060);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfdoingtext:=false;
end;end;procedure pdfsetrule(x,y,w,h:scaled);begin pdfendtext;
begin pdfprint(113);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if h<=onebp then begin pdfsetorigintemp(x,y-(h+1)/2);pdfprint(1061);
pdfprintbp(h);pdfprint(1062);pdfprintbp(w);begin pdfprint(1063);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
end else if w<=onebp then begin pdfsetorigintemp(x+(w+1)/2,y);
pdfprint(1061);pdfprintbp(w);pdfprint(1064);pdfprintbp(h);
begin pdfprint(1065);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
end else begin pdfsetorigintemp(x,y);pdfprint(1066);pdfprintbp(w);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;pdfprintbp(h);
begin pdfprint(1067);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
begin pdfprint(81);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
procedure pdfrectangle(left,top,right,bottom:scaled);begin preparemag;
pdfprint(1068);pdfprintmagbp(((left)-pdforiginh));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintmagbp((pdforiginv-(bottom)));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintmagbp(((right)-pdforiginh));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintmagbp((pdforiginv-(top)));begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
procedure slowprintsubstr(s,maxlen:integer);var j:poolpointer;
begin if(s>=strptr)or(s<256)then print(s)else begin j:=strstart[s];
while(j<strstart[s+1])and(j<=strstart[s]+maxlen)do begin print(strpool[j
]);incr(j);end;end;if j<strstart[s+1]then print(277);end;
procedure literal(s:strnumber;literalmode:integer;warn:boolean);
var j:poolpointer;begin j:=strstart[s];
if literalmode=3 then begin if not(strinstr(s,1069,0)or strinstr(s,1070,
0))then begin if warn and not(strinstr(s,1071,0)or strinstr(s,1072,0)or(
(strstart[s+1]-strstart[s])=0))then begin printnl(1073);printnl(1074);
slowprintsubstr(s,64);println;end;goto 10;end;
j:=j+(strstart[1070]-strstart[1069]);
if strinstr(s,1075,(strstart[1070]-strstart[1069]))then begin j:=j+(
strstart[1076]-strstart[1075]);literalmode:=2;
end else if strinstr(s,1076,(strstart[1070]-strstart[1069]))then begin j
:=j+(strstart[1077]-strstart[1076]);literalmode:=1;
end else literalmode:=0;end;case literalmode of 0:begin pdfendtext;
pdfsetorigin(curh,curv);end;1:pdfendtext;2:pdfendstringnl;
others:confusion(1077)end;
while j<strstart[s+1]do begin begin begin if pdfosmode and(1+pdfptr>
pdfbufsize)then pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)
then overflow(1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>
pdfbufsize)then pdfflush;end;begin pdfbuf[pdfptr]:=strpool[j];
incr(pdfptr);end;end;incr(j);end;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
{:693}{702:}procedure pdfprintfwint(n:longinteger;w:integer);
var k:integer;begin k:=0;repeat dig[k]:=n mod 10;n:=n div 10;incr(k);
until k=w;
begin if pdfosmode and(k+pdfptr>pdfbufsize)then pdfosgetosbuf(k)else if
not pdfosmode and(k>pdfbufsize)then overflow(1018,pdfopbufsize)else if
not pdfosmode and(k+pdfptr>pdfbufsize)then pdfflush;end;
while k>0 do begin decr(k);begin pdfbuf[pdfptr]:=48+dig[k];incr(pdfptr);
end;end;end;procedure pdfoutbytes(n:longinteger;w:integer);
var k:integer;byte:array[0..7]of integer;begin k:=0;
repeat byte[k]:=n mod 256;n:=n div 256;incr(k);until k=w;
begin if pdfosmode and(k+pdfptr>pdfbufsize)then pdfosgetosbuf(k)else if
not pdfosmode and(k>pdfbufsize)then overflow(1018,pdfopbufsize)else if
not pdfosmode and(k+pdfptr>pdfbufsize)then pdfflush;end;
while k>0 do begin decr(k);begin pdfbuf[pdfptr]:=byte[k];incr(pdfptr);
end;end;end;procedure pdfintentry(s:strnumber;v:integer);
begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=47;incr(pdfptr);end;end;pdfprint(s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;pdfprintint(v);end;
procedure pdfintentryln(s:strnumber;v:integer);begin pdfintentry(s,v);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
procedure pdfindirect(s:strnumber;o:integer);
begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=47;incr(pdfptr);end;end;pdfprint(s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;pdfprintint(o);
pdfprint(1087);end;procedure pdfindirectln(s:strnumber;o:integer);
begin pdfindirect(s,o);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
procedure pdfprintstr(s:strnumber);label 30;var i,j:poolpointer;
ishexstring:boolean;begin i:=strstart[s];
j:=i+(strstart[s+1]-strstart[s])-1;if i>j then begin pdfprint(1088);
goto 10;end;if(strpool[i]='(')and(strpool[j]=')')then begin pdfprint(s);
goto 10;end;ishexstring:=false;
if(strpool[i]<>'<')or(strpool[j]<>'>')or odd((strstart[s+1]-strstart[s])
)then goto 30;incr(i);decr(j);
while i<j do begin if(((strpool[i]>='0')and(strpool[i]<='9'))or((strpool
[i]>='A')and(strpool[i]<='F'))or((strpool[i]>='a')and(strpool[i]<='f')))
and(((strpool[i+1]>='0')and(strpool[i+1]<='9'))or((strpool[i+1]>='A')and
(strpool[i+1]<='F'))or((strpool[i+1]>='a')and(strpool[i+1]<='f')))then i
:=i+2 else goto 30;end;ishexstring:=true;
30:if ishexstring then pdfprint(s)else begin begin begin if pdfosmode
and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)else if not pdfosmode and(1
>pdfbufsize)then overflow(1018,pdfopbufsize)else if not pdfosmode and(1+
pdfptr>pdfbufsize)then pdfflush;end;begin pdfbuf[pdfptr]:=40;
incr(pdfptr);end;end;pdfprint(s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=41;incr(pdfptr);end;end;end;end;
procedure pdfprintstrln(s:strnumber);begin pdfprintstr(s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
procedure pdfstrentry(s,v:strnumber);begin if v=0 then goto 10;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=47;incr(pdfptr);end;end;pdfprint(s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;pdfprintstr(v);end;
procedure pdfstrentryln(s,v:strnumber);begin if v=0 then goto 10;
pdfstrentry(s,v);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
{:702}{705:}procedure settagcode(f:internalfontnumber;c:eightbits;
i:integer);var fixedi:integer;
begin if((fontbc[f]<=c)and(c<=fontec[f])and(fontinfo[charbase[f]+c].qqqq
.b0>0))then begin fixedi:=abs(fixint(i,-7,0));
if fixedi>=4 then begin if((fontinfo[charbase[f]+effectivechar(true,f,c)
].qqqq.b2)mod 4)=3 then fontinfo[charbase[f]+effectivechar(true,f,c)].
qqqq.b2:=(fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq.b2)-3;
fixedi:=fixedi-4;end;
if fixedi>=2 then begin if((fontinfo[charbase[f]+effectivechar(true,f,c)
].qqqq.b2)mod 4)=2 then fontinfo[charbase[f]+effectivechar(true,f,c)].
qqqq.b2:=(fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq.b2)-2;
fixedi:=fixedi-2;end;
if fixedi>=1 then begin if((fontinfo[charbase[f]+effectivechar(true,f,c)
].qqqq.b2)mod 4)=1 then fontinfo[charbase[f]+effectivechar(true,f,c)].
qqqq.b2:=(fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq.b2)-1;end;
end;end;procedure setnoligatures(f:internalfontnumber);var c:integer;
begin for c:=fontbc[f]to fontec[f]do if(fontinfo[charbase[f]+c].qqqq.b0>
0)then if((fontinfo[charbase[f]+c].qqqq.b2)mod 4)=1 then fontinfo[
charbase[f]+c].qqqq.b2:=(fontinfo[charbase[f]+c].qqqq.b2)-1;end;
function initfontbase(v:integer):integer;var i,j:integer;
begin i:=pdfgetmem(256);for j:=0 to 255 do pdfmem[i+j]:=v;
initfontbase:=i;end;procedure setlpcode(f:internalfontnumber;
c:eightbits;i:integer);
begin if pdffontlpbase[f]=0 then pdffontlpbase[f]:=initfontbase(0);
pdfmem[pdffontlpbase[f]+c]:=fixint(i,-1000,1000);end;
procedure setrpcode(f:internalfontnumber;c:eightbits;i:integer);
begin if pdffontrpbase[f]=0 then pdffontrpbase[f]:=initfontbase(0);
pdfmem[pdffontrpbase[f]+c]:=fixint(i,-1000,1000);end;
procedure setefcode(f:internalfontnumber;c:eightbits;i:integer);
begin if pdffontefbase[f]=0 then pdffontefbase[f]:=initfontbase(1000);
pdfmem[pdffontefbase[f]+c]:=fixint(i,0,1000);end;
procedure setknbscode(f:internalfontnumber;c:eightbits;i:integer);
begin if pdffontknbsbase[f]=0 then pdffontknbsbase[f]:=initfontbase(0);
pdfmem[pdffontknbsbase[f]+c]:=fixint(i,-1000,1000);end;
procedure setstbscode(f:internalfontnumber;c:eightbits;i:integer);
begin if pdffontstbsbase[f]=0 then pdffontstbsbase[f]:=initfontbase(0);
pdfmem[pdffontstbsbase[f]+c]:=fixint(i,-1000,1000);end;
procedure setshbscode(f:internalfontnumber;c:eightbits;i:integer);
begin if pdffontshbsbase[f]=0 then pdffontshbsbase[f]:=initfontbase(0);
pdfmem[pdffontshbsbase[f]+c]:=fixint(i,-1000,1000);end;
procedure setknbccode(f:internalfontnumber;c:eightbits;i:integer);
begin if pdffontknbcbase[f]=0 then pdffontknbcbase[f]:=initfontbase(0);
pdfmem[pdffontknbcbase[f]+c]:=fixint(i,-1000,1000);end;
procedure setknaccode(f:internalfontnumber;c:eightbits;i:integer);
begin if pdffontknacbase[f]=0 then pdffontknacbase[f]:=initfontbase(0);
pdfmem[pdffontknacbase[f]+c]:=fixint(i,-1000,1000);end;
procedure adjustinterwordglue(p,g:halfword);var kn,st,sh:scaled;
q,r:halfword;c:halfword;f:internalfontnumber;
begin if not(not(g>=himemmin)and mem[g].hh.b0=10)then begin pdfwarning(
1090,1091,true,true);goto 10;end;c:=256;
if(p>=himemmin)then begin c:=mem[p].hh.b1;f:=mem[p].hh.b0;
end else if mem[p].hh.b0=6 then begin c:=mem[p+1].hh.b1;
f:=mem[p+1].hh.b0;
end else if(mem[p].hh.b0=11)and(mem[p].hh.b1=3)and(savetail<>-268435455)
then begin r:=savetail;
while(mem[r].hh.rh<>-268435455)and(mem[r].hh.rh<>p)do r:=mem[r].hh.rh;
if(mem[r].hh.rh=p)then if(r>=himemmin)then begin c:=mem[r].hh.b1;
f:=mem[r].hh.b0;end else if mem[r].hh.b0=6 then begin c:=mem[r+1].hh.b1;
f:=mem[r+1].hh.b0;end;end;if(c=256)then goto 10;kn:=getknbscode(f,c);
st:=getstbscode(f,c);sh:=getshbscode(f,c);
if(kn<>0)or(st<>0)or(sh<>0)then begin q:=newspec(mem[g+1].hh.lh);
deleteglueref(mem[g+1].hh.lh);
mem[q+1].int:=mem[q+1].int+roundxnoverd(fontinfo[6+parambase[f]].int,kn,
1000);
mem[q+2].int:=mem[q+2].int+roundxnoverd(fontinfo[6+parambase[f]].int,st,
1000);
mem[q+3].int:=mem[q+3].int+roundxnoverd(fontinfo[6+parambase[f]].int,sh,
1000);mem[g+1].hh.lh:=q;end;end;
function getautokern(f:internalfontnumber;l,r:halfword):halfword;
var tmpw:scaled;k:integer;p:halfword;begin pdfassert((l>=0)and(r>=0));
getautokern:=-268435455;
if(eqtb[29366].int<=0)and(eqtb[29365].int<=0)then goto 10;tmpw:=0;
if(eqtb[29366].int>0)and(l<256)then begin k:=getknaccode(f,l);
if k<>0 then tmpw:=roundxnoverd(fontinfo[6+parambase[f]].int,k,1000);
end;if(eqtb[29365].int>0)and(r<256)then begin k:=getknbccode(f,r);
if k<>0 then tmpw:=tmpw+roundxnoverd(fontinfo[6+parambase[f]].int,k,1000
);end;if tmpw<>0 then begin p:=newkern(tmpw);mem[p].hh.b1:=3;
getautokern:=p;end;end;function expandfontname(f:internalfontnumber;
e:integer):strnumber;var oldsetting:0..21;begin oldsetting:=selector;
selector:=21;print(fontname[f]);if e>0 then print(43);printint(e);
selector:=oldsetting;expandfontname:=makestring;end;
function autoexpandfont(f:internalfontnumber;
e:integer):internalfontnumber;var k:internalfontnumber;
nw,nk,ni,i:integer;begin k:=fontptr+1;incr(fontptr);
if(fontptr>=fontmax)then overflow(1092,fontmax);
fontname[k]:=expandfontname(f,e);fontarea[k]:=fontarea[f];
hash[17626+k].rh:=hash[17626+f].rh;hyphenchar[k]:=hyphenchar[f];
skewchar[k]:=skewchar[f];fontbchar[k]:=fontbchar[f];
fontfalsebchar[k]:=fontfalsebchar[f];fontbc[k]:=fontbc[f];
fontec[k]:=fontec[f];fontsize[k]:=fontsize[f];
fontdsize[k]:=fontdsize[f];fontparams[k]:=fontparams[f];
fontglue[k]:=fontglue[f];bcharlabel[k]:=bcharlabel[f];
charbase[k]:=charbase[f];heightbase[k]:=heightbase[f];
depthbase[k]:=depthbase[f];ligkernbase[k]:=ligkernbase[f];
extenbase[k]:=extenbase[f];parambase[k]:=parambase[f];
nw:=heightbase[f]-widthbase[f];ni:=ligkernbase[f]-italicbase[f];
nk:=extenbase[f]-(kernbase[f]+256*(128));
if(fmemptr+nw+ni+nk>=fontmemsize)then overflow(1093,fontmemsize);
widthbase[k]:=fmemptr;italicbase[k]:=widthbase[k]+nw;
kernbase[k]:=italicbase[k]+ni-256*(128);fmemptr:=fmemptr+nw+ni+nk;
for i:=0 to nw-1 do fontinfo[widthbase[k]+i].int:=roundxnoverd(fontinfo[
widthbase[f]+i].int,1000+e,1000);
for i:=0 to ni-1 do fontinfo[italicbase[k]+i].int:=roundxnoverd(fontinfo
[italicbase[f]+i].int,1000+e,1000);
for i:=0 to nk-1 do fontinfo[kernbase[k]+256*(128)+i].int:=roundxnoverd(
fontinfo[kernbase[f]+256*(128)+i].int,1000+e,1000);autoexpandfont:=k;
end;procedure copyexpandparams(k,f:internalfontnumber;e:integer);
begin if pdffontrpbase[f]=0 then pdffontrpbase[f]:=initfontbase(0);
if pdffontlpbase[f]=0 then pdffontlpbase[f]:=initfontbase(0);
if pdffontefbase[f]=0 then pdffontefbase[f]:=initfontbase(1000);
pdffontexpandratio[k]:=e;pdffontstep[k]:=pdffontstep[f];
pdffontautoexpand[k]:=pdffontautoexpand[f];pdffontblink[k]:=f;
pdffontlpbase[k]:=pdffontlpbase[f];pdffontrpbase[k]:=pdffontrpbase[f];
pdffontefbase[k]:=pdffontefbase[f];
if pdffontknbsbase[f]=0 then pdffontknbsbase[f]:=initfontbase(0);
if pdffontstbsbase[f]=0 then pdffontstbsbase[f]:=initfontbase(0);
if pdffontshbsbase[f]=0 then pdffontshbsbase[f]:=initfontbase(0);
if pdffontknbcbase[f]=0 then pdffontknbcbase[f]:=initfontbase(0);
if pdffontknacbase[f]=0 then pdffontknacbase[f]:=initfontbase(0);
pdffontknbsbase[k]:=pdffontknbsbase[f];
pdffontstbsbase[k]:=pdffontstbsbase[f];
pdffontshbsbase[k]:=pdffontshbsbase[f];
pdffontknbcbase[k]:=pdffontknbcbase[f];
pdffontknacbase[k]:=pdffontknacbase[f];end;
function tfmlookup(s:strnumber;fs:scaled):internalfontnumber;
var k:internalfontnumber;
begin if fs<>0 then begin for k:=1 to fontptr do if(fontarea[k]<>1089)
and streqstr(fontname[k],s)and(fontsize[k]=fs)then begin flushstr(s);
tfmlookup:=k;goto 10;end;
end else begin for k:=1 to fontptr do if(fontarea[k]<>1089)and streqstr(
fontname[k],s)then begin flushstr(s);tfmlookup:=k;goto 10;end;end;
tfmlookup:=0;end;function loadexpandfont(f:internalfontnumber;
e:integer):internalfontnumber;label 40;var s:strnumber;
k:internalfontnumber;begin s:=expandfontname(f,e);
k:=tfmlookup(s,fontsize[f]);
if k=0 then begin if pdffontautoexpand[f]then k:=autoexpandfont(f,e)else
k:=readfontinfo(513,s,345,fontsize[f]);end;
if k<>0 then copyexpandparams(k,f,e);loadexpandfont:=k;end;
function fixexpandvalue(f:internalfontnumber;e:integer):integer;
var step:integer;maxexpand:integer;neg:boolean;begin fixexpandvalue:=0;
if e=0 then goto 10;if e<0 then begin e:=-e;neg:=true;
maxexpand:=-pdffontexpandratio[pdffontshrink[f]];
end else begin neg:=false;
maxexpand:=pdffontexpandratio[pdffontstretch[f]];end;
if e>maxexpand then e:=maxexpand else begin step:=pdffontstep[f];
if e mod step>0 then e:=step*roundxnoverd(e,1,step);end;
if neg then e:=-e;fixexpandvalue:=e;end;
function getexpandfont(f:internalfontnumber;
e:integer):internalfontnumber;var k:internalfontnumber;
begin k:=pdffontelink[f];
while k<>0 do begin if pdffontexpandratio[k]=e then begin getexpandfont
:=k;goto 10;end;k:=pdffontelink[k];end;k:=loadexpandfont(f,e);
pdffontelink[k]:=pdffontelink[f];pdffontelink[f]:=k;getexpandfont:=k;
end;function expandfont(f:internalfontnumber;
e:integer):internalfontnumber;begin expandfont:=f;if e=0 then goto 10;
e:=fixexpandvalue(f,e);if e=0 then goto 10;
if pdffontelink[f]=0 then pdferror(1053,1094);
expandfont:=getexpandfont(f,e);end;
procedure setexpandparams(f:internalfontnumber;autoexpand:boolean;
stretchlimit,shrinklimit,fontstep,expandratio:integer);
begin pdffontstep[f]:=fontstep;pdffontautoexpand[f]:=autoexpand;
if stretchlimit>0 then pdffontstretch[f]:=getexpandfont(f,stretchlimit);
if shrinklimit>0 then pdffontshrink[f]:=getexpandfont(f,-shrinklimit);
if expandratio<>0 then pdffontexpandratio[f]:=expandratio;end;
procedure vfexpandlocalfonts(f:internalfontnumber);
var lf:internalfontnumber;k:integer;begin pdfassert(pdffonttype[f]=1);
for k:=0 to vflocalfontnum[f]-1 do begin lf:=vfifnts[vfdefaultfont[f]+k]
;setexpandparams(lf,pdffontautoexpand[f],pdffontexpandratio[
pdffontstretch[f]],-pdffontexpandratio[pdffontshrink[f]],pdffontstep[f],
pdffontexpandratio[f]);if pdffonttype[lf]=1 then vfexpandlocalfonts(lf);
end;end;procedure readexpandfont;
var shrinklimit,stretchlimit,fontstep:integer;f:internalfontnumber;
autoexpand:boolean;begin scanfontident;f:=curval;
if f=0 then pdferror(1053,884);
if pdffontblink[f]<>0 then pdferror(1053,1095);scanoptionalequals;
scanint;stretchlimit:=fixint(curval,0,1000);scanint;
shrinklimit:=fixint(curval,0,500);scanint;
fontstep:=fixint(curval,0,100);if fontstep=0 then pdferror(1053,1096);
stretchlimit:=stretchlimit-stretchlimit mod fontstep;
if stretchlimit<0 then stretchlimit:=0;
shrinklimit:=shrinklimit-shrinklimit mod fontstep;
if shrinklimit<0 then shrinklimit:=0;
if(stretchlimit=0)and(shrinklimit=0)then pdferror(1053,1097);
autoexpand:=false;if scankeyword(1098)then begin autoexpand:=true;
{469:}begin getxtoken;if curcmd<>10 then backinput;end{:469};end;
if(pdffontexpandratio[f]<>0)then pdferror(1053,1099);
if(pdffontstep[f]<>0)then begin if pdffontstep[f]<>fontstep then
pdferror(1053,1100);
if((pdffontstretch[f]=0)and(stretchlimit<>0))or((pdffontstretch[f]<>0)
and(pdffontexpandratio[pdffontstretch[f]]<>stretchlimit))then pdferror(
1053,1101);
if((pdffontshrink[f]=0)and(shrinklimit<>0))or((pdffontshrink[f]<>0)and(-
pdffontexpandratio[pdffontshrink[f]]<>shrinklimit))then pdferror(1053,
1102);if pdffontautoexpand[f]<>autoexpand then pdferror(1053,1103);
end else begin if(pdffonttype[f]<>0)and(pdffonttype[f]<>1)then
pdfwarning(1053,1104,true,true);
setexpandparams(f,autoexpand,stretchlimit,shrinklimit,fontstep,0);
if pdffonttype[f]=1 then vfexpandlocalfonts(f);end;end;
{:705}{706:}function letterspacefont(u:halfword;f:internalfontnumber;
e:integer):internalfontnumber;var k:internalfontnumber;w,r:scaled;
s:strnumber;i,nw:integer;oldsetting:0..21;vfz:integer;vfalpha:integer;
vfbeta:1..16;begin k:=readfontinfo(u,fontname[f],345,fontsize[f]);
if scankeyword(1105)then setnoligatures(k);
nw:=heightbase[k]-widthbase[k];
if(fontinfo[6+parambase[k]].int=0)and(fontinfo[6+parambase[f]].int>0)
then fontinfo[6+parambase[k]].int:=fontinfo[6+parambase[f]].int;
if fontinfo[6+parambase[k]].int=0 then pdfwarning(1106,1107,true,true);
for i:=0 to nw-1 do fontinfo[widthbase[k]+i].int:=fontinfo[widthbase[k]+
i].int+roundxnoverd(fontinfo[6+parambase[k]].int,e,1000);
begin if poolptr+(strstart[fontname[k]+1]-strstart[fontname[k]])+7>
poolsize then overflow(259,poolsize-initpoolptr);end;
oldsetting:=selector;selector:=21;print(fontname[k]);
if e>0 then print(43);printint(e);print(1108);selector:=oldsetting;
fontname[k]:=makestring;allocvffnts;vfefnts[vfnf]:=0;vfifnts[vfnf]:=f;
incr(vfnf);vflocalfontnum[k]:=1;vfdefaultfont[k]:=vfnf-1;
pdffonttype[k]:=1;vfz:=fontsize[f];begin vfalpha:=16;
while vfz>=8388608 do begin vfz:=vfz div 2;vfalpha:=vfalpha+vfalpha;end;
vfbeta:=256 div vfalpha;vfalpha:=vfalpha*vfz;end;
w:=roundxnoverd(fontinfo[6+parambase[f]].int,e,2000);
if w>=0 then tmpw.qqqq.b0:=0 else begin tmpw.qqqq.b0:=255;w:=vfalpha+w;
end;r:=w*vfbeta;tmpw.qqqq.b1:=r div vfz;r:=r mod vfz;
if r=0 then tmpw.qqqq.b2:=0 else begin r:=r*256;tmpw.qqqq.b2:=r div vfz;
r:=r mod vfz;end;if r=0 then tmpw.qqqq.b3:=0 else begin r:=r*256;
tmpw.qqqq.b3:=r div vfz;end;vfpacketbase[k]:=newvfpacket(k);
for c:=fontbc[k]to fontec[k]do begin begin if poolptr+12>poolsize then
overflow(259,poolsize-initpoolptr);end;begin strpool[poolptr]:=146;
incr(poolptr);end;begin strpool[poolptr]:=tmpw.qqqq.b0;incr(poolptr);
end;begin strpool[poolptr]:=tmpw.qqqq.b1;incr(poolptr);end;
begin strpool[poolptr]:=tmpw.qqqq.b2;incr(poolptr);end;
begin strpool[poolptr]:=tmpw.qqqq.b3;incr(poolptr);end;
if c<128 then begin strpool[poolptr]:=c;incr(poolptr);
end else begin begin strpool[poolptr]:=128;incr(poolptr);end;
begin strpool[poolptr]:=c;incr(poolptr);end;end;
begin strpool[poolptr]:=146;incr(poolptr);end;
begin strpool[poolptr]:=tmpw.qqqq.b0;incr(poolptr);end;
begin strpool[poolptr]:=tmpw.qqqq.b1;incr(poolptr);end;
begin strpool[poolptr]:=tmpw.qqqq.b2;incr(poolptr);end;
begin strpool[poolptr]:=tmpw.qqqq.b3;incr(poolptr);end;s:=makestring;
storepacket(k,c,s);flushstr(s);end;letterspacefont:=k;end;
procedure newletterspacedfont(a:smallnumber);var u:halfword;t:strnumber;
oldsetting:0..21;f,k:internalfontnumber;begin getrtoken;u:=curcs;
if u>=514 then t:=hash[u].rh else if u>=257 then if u=513 then t:=1109
else t:=u-257 else begin oldsetting:=selector;selector:=21;print(1109);
print(u-1);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(259,poolsize-initpoolptr);end;
t:=makestring;end;if(a>=4)then geqdefine(u,87,0)else eqdefine(u,87,0);
scanoptionalequals;scanfontident;k:=curval;scanint;
f:=letterspacefont(u,k,fixint(curval,-1000,1000));eqtb[u].hh.rh:=f;
eqtb[17626+f]:=eqtb[u];hash[17626+f].rh:=t;end;
function isletterspacedfont(f:internalfontnumber):boolean;label 30;
var i,j:poolpointer;begin isletterspacedfont:=false;
if pdffonttype[f]<>1 then goto 10;i:=strstart[fontname[f]+1]-1;
j:=strstart[fontname[f]];
if(strpool[i-1]<>'l')or(strpool[i]<>'s')then goto 10;i:=i-2;
while i>=j do begin if(strpool[i]<'0')or(strpool[i]>'9')then goto 30;
i:=i-1;end;30:if i<j then goto 10;
if(strpool[i]<>'+')and(strpool[i]<>'-')then goto 10;
isletterspacedfont:=true;end;
function copyfontinfo(f:internalfontnumber):internalfontnumber;
var lf,bc,ec,i:halfword;k:internalfontnumber;
begin if(pdffontexpandratio[f]<>0)or(pdffontstep[f]<>0)then pdferror(
1110,1111);if isletterspacedfont(f)then pdferror(1110,1112);
k:=fontptr+1;incr(fontptr);
if(fontptr>=fontmax)then overflow(1092,fontmax);
fontname[k]:=fontname[f];fontarea[k]:=1089;hyphenchar[k]:=hyphenchar[f];
skewchar[k]:=skewchar[f];fontbchar[k]:=fontbchar[f];
fontfalsebchar[k]:=fontfalsebchar[f];fontbc[k]:=fontbc[f];
fontec[k]:=fontec[f];fontsize[k]:=fontsize[f];
fontdsize[k]:=fontdsize[f];fontparams[k]:=fontparams[f];
fontglue[k]:=fontglue[f];bcharlabel[k]:=bcharlabel[f];bc:=fontbc[f];
ec:=fontec[f];charbase[k]:=fmemptr-bc;widthbase[k]:=charbase[k]+ec+1;
heightbase[k]:=widthbase[k]+(heightbase[f]-widthbase[f]);
depthbase[k]:=heightbase[k]+(depthbase[f]-heightbase[f]);
italicbase[k]:=depthbase[k]+(italicbase[f]-depthbase[f]);
ligkernbase[k]:=italicbase[k]+(ligkernbase[f]-italicbase[f]);
kernbase[k]:=ligkernbase[k]+(kernbase[f]-ligkernbase[f]);
extenbase[k]:=kernbase[k]+(extenbase[f]-kernbase[f]);
parambase[k]:=extenbase[k]+(parambase[f]-extenbase[f]);
lf:=(parambase[f]-charbase[f])+fontparams[f]+1;
if(fmemptr+lf>=fontmemsize)then overflow(1093,fontmemsize);
for i:=0 to lf-1 do fontinfo[charbase[k]+bc+i]:=fontinfo[charbase[f]+bc+
i];fmemptr:=fmemptr+lf;copyfontinfo:=k;end;
procedure makefontcopy(a:smallnumber);var u:halfword;t:strnumber;
oldsetting:0..21;f,k:internalfontnumber;begin getrtoken;u:=curcs;
if u>=514 then t:=hash[u].rh else if u>=257 then if u=513 then t:=1109
else t:=u-257 else begin oldsetting:=selector;selector:=21;print(1109);
print(u-1);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(259,poolsize-initpoolptr);end;
t:=makestring;end;if(a>=4)then geqdefine(u,87,0)else eqdefine(u,87,0);
scanoptionalequals;scanfontident;k:=curval;f:=copyfontinfo(k);
eqtb[u].hh.rh:=f;eqtb[17626+f]:=eqtb[u];hash[17626+f].rh:=t;end;
{:706}{712:}procedure vferror(filename,msg:strnumber);
var oldsetting:0..21;s:strnumber;
begin begin if poolptr+(strstart[filename+1]-strstart[filename])+3>
poolsize then overflow(259,poolsize-initpoolptr);end;
oldsetting:=selector;selector:=21;print(filename);print(1113);
s:=makestring;selector:=oldsetting;pdferror(s,msg);end;
function vfbyte:eightbits;var i:integer;begin i:=getc(vffile);
if i<0 then pdferror(1114,1115);vfbyte:=i;end;
function vfreadsigned(k:integer):integer;var i:integer;
begin pdfassert((k>0)and(k<=4));i:=vfbyte;if i>=128 then i:=i-256;
decr(k);while k>0 do begin i:=i*256+vfbyte;decr(k);end;vfreadsigned:=i;
end;function vfreadunsigned(k:integer):integer;var i:integer;
begin pdfassert((k>0)and(k<=4));i:=vfbyte;
if(k=4)and(i>=128)then vferror(fontname[f],1045);decr(k);
while k>0 do begin i:=i*256+vfbyte;decr(k);end;vfreadunsigned:=i;end;
procedure vflocalfontwarning(f,k:internalfontnumber;s:strnumber);
begin printnl(s);print(1116);print(fontname[k]);print(1117);
print(fontname[f]);print(1118);end;
function vfdeffont(f:internalfontnumber):internalfontnumber;
var k:internalfontnumber;s:strnumber;ds,fs:scaled;cs:fourquarters;
begin cs.b0:=vfbyte;cs.b1:=vfbyte;cs.b2:=vfbyte;cs.b3:=vfbyte;
fs:=storescaledf(vfreadsigned(4),fontsize[f]);ds:=vfreadsigned(4)div 16;
tmpw.qqqq.b0:=vfbyte;tmpw.qqqq.b1:=vfbyte;
while tmpw.qqqq.b0>0 do begin decr(tmpw.qqqq.b0);
begin if vfbyte<>0 then end;end;
begin if poolptr+tmpw.qqqq.b1>poolsize then overflow(259,poolsize-
initpoolptr);end;while tmpw.qqqq.b1>0 do begin decr(tmpw.qqqq.b1);
begin strpool[poolptr]:=vfbyte;incr(poolptr);end;end;s:=makestring;
k:=tfmlookup(s,fs);if k=0 then k:=readfontinfo(513,s,345,fs);
if k<>0 then begin if((cs.b0<>0)or(cs.b1<>0)or(cs.b2<>0)or(cs.b3<>0))and
((fontcheck[k].b0<>0)or(fontcheck[k].b1<>0)or(fontcheck[k].b2<>0)or(
fontcheck[k].b3<>0))and((cs.b0<>fontcheck[k].b0)or(cs.b1<>fontcheck[k].
b1)or(cs.b2<>fontcheck[k].b2)or(cs.b3<>fontcheck[k].b3))then
vflocalfontwarning(f,k,1119);
if ds<>fontdsize[k]then vflocalfontwarning(f,k,1120);
if(pdffontstep[f]<>0)then setexpandparams(k,pdffontautoexpand[f],
pdffontexpandratio[pdffontstretch[f]],-pdffontexpandratio[pdffontshrink[
f]],pdffontstep[f],pdffontexpandratio[f]);end;vfdeffont:=k;end;
procedure dovf(f:internalfontnumber);var cmd,k,n:integer;
cc,cmdlength,packetlength:integer;tfmwidth:scaled;s:strnumber;
stacklevel:vfstackindex;savevfnf:internalfontnumber;
begin pdffonttype[f]:=2;if autoexpandvf(f)then goto 10;stacklevel:=0;
{713:}packfilename(fontname[f],345,1113);
if not vfbopenin(vffile)then goto 10{:713};
{714:}if vfbyte<>247 then vferror(fontname[f],1122);
if vfbyte<>202 then vferror(fontname[f],1123);cmdlength:=vfbyte;
for k:=1 to cmdlength do begin if vfbyte<>0 then end;
tmpw.qqqq.b0:=vfbyte;tmpw.qqqq.b1:=vfbyte;tmpw.qqqq.b2:=vfbyte;
tmpw.qqqq.b3:=vfbyte;
if((tmpw.qqqq.b0<>0)or(tmpw.qqqq.b1<>0)or(tmpw.qqqq.b2<>0)or(tmpw.qqqq.
b3<>0))and((fontcheck[f].b0<>0)or(fontcheck[f].b1<>0)or(fontcheck[f].b2
<>0)or(fontcheck[f].b3<>0))and((tmpw.qqqq.b0<>fontcheck[f].b0)or(tmpw.
qqqq.b1<>fontcheck[f].b1)or(tmpw.qqqq.b2<>fontcheck[f].b2)or(tmpw.qqqq.
b3<>fontcheck[f].b3))then begin printnl(1124);print(fontname[f]);
print(1125);end;
if vfreadsigned(4)div 16<>fontdsize[f]then begin printnl(1126);
print(fontname[f]);print(1125);end;fflush(stdout){:714};
{715:}cmd:=vfbyte;savevfnf:=vfnf;
while(cmd>=243)and(cmd<=246)do begin allocvffnts;
vfefnts[vfnf]:=vfreadunsigned(cmd-242);vfifnts[vfnf]:=vfdeffont(f);
incr(vfnf);cmd:=vfbyte;end;vfdefaultfont[f]:=savevfnf;
vflocalfontnum[f]:=vfnf-savevfnf;{:715};
{716:}vfpacketbase[f]:=newvfpacket(f){:716};
while cmd<=242 do begin{717:}if cmd=242 then begin packetlength:=
vfreadunsigned(4);cc:=vfreadunsigned(4);
if not((fontbc[f]<=cc)and(cc<=fontec[f])and(fontinfo[charbase[f]+cc].
qqqq.b0>0))then vferror(fontname[f],1127);
tfmwidth:=storescaledf(vfreadsigned(4),fontsize[f]);
end else begin packetlength:=cmd;cc:=vfbyte;
if not((fontbc[f]<=cc)and(cc<=fontec[f])and(fontinfo[charbase[f]+cc].
qqqq.b0>0))then vferror(fontname[f],1127);
tfmwidth:=storescaledf(vfreadunsigned(3),fontsize[f]);end;
if packetlength<0 then vferror(fontname[f],1128);
if packetlength>10000 then vferror(fontname[f],1129);
if tfmwidth<>fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(
true,f,cc)].qqqq.b0].int then begin printnl(1130);print(fontname[f]);
print(1125);end;
begin if poolptr+packetlength>poolsize then overflow(259,poolsize-
initpoolptr);end;while packetlength>0 do begin cmd:=vfbyte;
decr(packetlength);
{719:}if(cmd>=0)and(cmd<=127)then cmdlength:=0 else if((171<=cmd)and(cmd
<=234))or((235<=cmd)and(cmd<=238))then begin if cmd>=235 then begin k:=
vfreadunsigned(cmd-234);packetlength:=packetlength-(cmd-234);
end else k:=cmd-171;if k>=256 then vferror(fontname[f],1133);n:=0;
while(n<vflocalfontnum[f])and(vfefnts[vfdefaultfont[f]+n]<>k)do incr(n);
if n=vflocalfontnum[f]then vferror(fontname[f],1134);
if k<=63 then begin strpool[poolptr]:=171+k;incr(poolptr);
end else begin begin strpool[poolptr]:=235;incr(poolptr);end;
begin strpool[poolptr]:=k;incr(poolptr);end;end;cmdlength:=0;cmd:=138;
end else case cmd of 132,137:cmdlength:=8;
128,129,130,131:cmdlength:=cmd-127;133,134,135,136:cmdlength:=cmd-132;
143,144,145,146:cmdlength:=cmd-142;148,149,150,151:cmdlength:=cmd-147;
153,154,155,156:cmdlength:=cmd-152;157,158,159,160:cmdlength:=cmd-156;
162,163,164,165:cmdlength:=cmd-161;167,168,169,170:cmdlength:=cmd-166;
239,240,241,242:begin cmdlength:=vfreadunsigned(cmd-238);
packetlength:=packetlength-(cmd-238);
if cmdlength>10000 then vferror(fontname[f],1129);
if cmdlength<0 then vferror(fontname[f],1135);
begin strpool[poolptr]:=239;incr(poolptr);end;
begin strpool[poolptr]:=cmdlength;incr(poolptr);end;cmd:=138;end;
147,152,161,166,138:cmdlength:=0;141,142:begin cmdlength:=0;
if cmd=141 then if stacklevel=vfstacksize then overflow(1136,vfstacksize
)else incr(stacklevel)else if stacklevel=0 then vferror(fontname[f],1137
)else decr(stacklevel);end;others:vferror(fontname[f],1138);end{:719};
if cmd<>138 then begin strpool[poolptr]:=cmd;incr(poolptr);end;
packetlength:=packetlength-cmdlength;
while cmdlength>0 do begin decr(cmdlength);
begin strpool[poolptr]:=vfbyte;incr(poolptr);end;end;end;
if stacklevel<>0 then vferror(fontname[f],1131);
if packetlength<>0 then vferror(fontname[f],1132);{718:}s:=makestring;
storepacket(f,cc,s);flushstr(s){:718};cmd:=vfbyte{:717};end;
if cmd<>248 then vferror(fontname[f],1121);bclose(vffile);
pdffonttype[f]:=1;end;{:712}{720:}procedure pdfcheckvfcurval;
var f:internalfontnumber;begin f:=curval;dovf(f);
if pdffonttype[f]=1 then pdferror(604,1139);end;
function autoexpandvf(f:internalfontnumber):boolean;
var bf,lf:internalfontnumber;e,k:integer;begin autoexpandvf:=false;
if(not pdffontautoexpand[f])or(pdffontblink[f]=0)then goto 10;
bf:=pdffontblink[f];if pdffonttype[bf]=0 then dovf(bf);
if pdffonttype[bf]<>1 then goto 10;e:=pdffontexpandratio[f];
for k:=0 to vflocalfontnum[bf]-1 do begin lf:=vfdefaultfont[bf]+k;
allocvffnts;vfefnts[vfnf]:=vfefnts[lf];
vfifnts[vfnf]:=autoexpandfont(vfifnts[lf],e);
copyexpandparams(vfifnts[vfnf],vfifnts[lf],e);incr(vfnf);end;
vfpacketbase[f]:=vfpacketbase[bf];vflocalfontnum[f]:=vflocalfontnum[bf];
vfdefaultfont[f]:=vfnf-vflocalfontnum[f];pdffonttype[f]:=1;
autoexpandvf:=true;end;
{:720}{725:}function packetreadsigned(k:integer):integer;var i:integer;
begin pdfassert((k>0)and(k<=4));i:=packetbyte;if i>=128 then i:=i-256;
decr(k);while k>0 do begin i:=i*256+packetbyte;decr(k);end;
packetreadsigned:=i;end;function packetreadunsigned(k:integer):integer;
var i:integer;begin pdfassert((k>0)and(k<=4));i:=packetbyte;
if(k=4)and(i>=128)then vferror(fontname[f],1045);decr(k);
while k>0 do begin i:=i*256+packetbyte;decr(k);end;
packetreadunsigned:=i;end;function packetscaled(k:integer;
fs:scaled):scaled;
begin packetscaled:=storescaledf(packetreadsigned(k),fs);end;
procedure dovfpacket(vff:internalfontnumber;c:eightbits);label 70,22;
var f,k,n:internalfontnumber;savecurh,savecurv:scaled;cmd:integer;
charmove:boolean;w,x,y,z:scaled;s:strnumber;begin incr(vfcurs);
if vfcurs>vfmaxrecursion then overflow(1140,vfmaxrecursion);
savecurv:=curv;savecurh:=curh;pushpacketstate;startpacket(vff,c);
f:=vfifnts[vfdefaultfont[vff]];w:=0;x:=0;y:=0;z:=0;
while vfpacketlength>0 do begin cmd:=packetbyte;
{726:}if(cmd>=0)and(cmd<=127)then begin if not((fontbc[f]<=cmd)and(cmd<=
fontec[f])and(fontinfo[charbase[f]+cmd].qqqq.b0>0))then begin
charwarning(f,cmd);goto 22;end;c:=cmd;charmove:=true;goto 70;
end else if((171<=cmd)and(cmd<=234))or(cmd=235)then begin if cmd=235
then k:=packetbyte else k:=cmd-171;n:=0;
while(n<vflocalfontnum[vff])and(vfefnts[vfdefaultfont[vff]+n]<>k)do incr
(n);if(n=vflocalfontnum[vff])then pdferror(1114,1141)else f:=vfifnts[
vfdefaultfont[vff]+n];
end else case cmd of 141:begin vfstack[vfstackptr].stackh:=curh;
vfstack[vfstackptr].stackv:=curv;vfstack[vfstackptr].stackw:=w;
vfstack[vfstackptr].stackx:=x;vfstack[vfstackptr].stacky:=y;
vfstack[vfstackptr].stackz:=z;incr(vfstackptr);end;
142:begin decr(vfstackptr);curh:=vfstack[vfstackptr].stackh;
curv:=vfstack[vfstackptr].stackv;w:=vfstack[vfstackptr].stackw;
x:=vfstack[vfstackptr].stackx;y:=vfstack[vfstackptr].stacky;
z:=vfstack[vfstackptr].stackz;end;
128,129,130,131,133,134,135,136:begin if(128<=cmd)and(cmd<=131)then
begin tmpw.int:=packetreadunsigned(cmd-127);charmove:=true;
end else begin tmpw.int:=packetreadunsigned(cmd-132);charmove:=false;
end;if not((fontbc[f]<=tmpw.int)and(tmpw.int<=fontec[f])and(fontinfo[
charbase[f]+tmpw.int].qqqq.b0>0))then begin charwarning(f,tmpw.int);
goto 22;end;c:=tmpw.int;goto 70;end;
132,137:begin ruleht:=packetscaled(4,fontsize[vff]);
rulewd:=packetscaled(4,fontsize[vff]);
if(rulewd>0)and(ruleht>0)then begin pdfsetrule(curh,curv,rulewd,ruleht);
if cmd=132 then curh:=curh+rulewd;end;end;
143,144,145,146:curh:=curh+packetscaled(cmd-142,fontsize[vff]);
147,148,149,150,151:begin if cmd>147 then w:=packetscaled(cmd-147,
fontsize[vff]);curh:=curh+w;end;
152,153,154,155,156:begin if cmd>152 then x:=packetscaled(cmd-152,
fontsize[vff]);curh:=curh+x;end;
157,158,159,160:curv:=curv+packetscaled(cmd-156,fontsize[vff]);
161,162,163,164,165:begin if cmd>161 then y:=packetscaled(cmd-161,
fontsize[vff]);curv:=curv+y;end;
166,167,168,169,170:begin if cmd>166 then z:=packetscaled(cmd-166,
fontsize[vff]);curv:=curv+z;end;
239,240,241,242:begin tmpw.int:=packetreadunsigned(cmd-238);
begin if poolptr+tmpw.int>poolsize then overflow(259,poolsize-
initpoolptr);end;while tmpw.int>0 do begin decr(tmpw.int);
begin strpool[poolptr]:=packetbyte;incr(poolptr);end;end;s:=makestring;
literal(s,3,false);flushstr(s);end;others:pdferror(1114,1142);end;
goto 22;
70:if((fontbc[f]<=c)and(c<=fontec[f])and(fontinfo[charbase[f]+c].qqqq.b0
>0))then begin if pdffonttype[f]=0 then dovf(f);
if pdffonttype[f]=1 then dovfpacket(f,c)else begin pdfbeginstring(f);
pdfprintchar(f,c);advcharwidth(f,c);end;end else charwarning(f,c);
if charmove then curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,c)].qqqq.b0].int{:726};22:end;poppacketstate;
curv:=savecurv;curh:=savecurh;decr(vfcurs);end;
{:725}{728:}procedure pdfvlistout;forward;
{:728}{729:}{727:}procedure pdfoutliteral(p:halfword);
var oldsetting:0..21;s:strnumber;h:halfword;q,r:halfword;
oldmode:integer;begin oldsetting:=selector;
if mem[p].hh.b1=8 then begin{1618:}q:=getavail;mem[q].hh.lh:=637;
r:=getavail;mem[q].hh.rh:=r;mem[r].hh.lh:=19617;begintokenlist(q,4);
begintokenlist(mem[p+1].hh.rh,20);q:=getavail;mem[q].hh.lh:=379;
begintokenlist(q,4);oldmode:=curlist.modefield;curlist.modefield:=0;
curcs:=writeloc;q:=scantoks(false,true);curlist.modefield:=oldmode;
gettoken;if curtok<>19617 then{1619:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(712);
end;begin helpptr:=2;helpline[1]:=1942;helpline[0]:=1439;end;error;
repeat gettoken;until curtok=19617;end{:1619};endtokenlist{:1618};
h:=defref;end else h:=mem[p+1].hh.rh;selector:=21;
showtokenlist(mem[h].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;literal(s,mem[p+1].hh.lh,false);
flushstr(s);if mem[p].hh.b1=8 then flushlist(defref);end;
procedure pdfoutcolorstack(p:halfword);var oldsetting:0..21;s:strnumber;
cmd:integer;stackno:integer;literalmode:integer;
begin cmd:=mem[p+1].hh.lh;stackno:=mem[p+1].hh.rh;
if stackno>=colorstackused then begin printnl(345);print(1143);
printint(stackno);print(1144);printnl(345);goto 10;end;
case cmd of 0,1:begin oldsetting:=selector;selector:=21;
showtokenlist(mem[mem[p+2].hh.rh].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;
if cmd=0 then literalmode:=colorstackset(stackno,s)else literalmode:=
colorstackpush(stackno,s);
if(strstart[s+1]-strstart[s])>0 then literal(s,literalmode,false);
flushstr(s);goto 10;end;2:literalmode:=colorstackpop(stackno);
3:literalmode:=colorstackcurrent(stackno);others:confusion(1145)end;
if(poolptr-strstart[strptr])>0 then begin s:=makestring;
literal(s,literalmode,false);flushstr(s);end end;
procedure pdfoutcolorstackstartpage;var i:integer;max:integer;
startstatus:integer;literalmode:integer;s:strnumber;begin i:=0;
max:=colorstackused;
while i<max do begin startstatus:=colorstackskippagestart(i);
if startstatus=0 then begin literalmode:=colorstackcurrent(i);
if(poolptr-strstart[strptr])>0 then begin s:=makestring;
literal(s,literalmode,false);flushstr(s);end;end;incr(i);end;end;
procedure pdfoutsetmatrix(p:halfword);var oldsetting:0..21;s:strnumber;
begin oldsetting:=selector;selector:=21;
showtokenlist(mem[mem[p+1].hh.rh].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;
begin if poolptr+7>poolsize then overflow(259,poolsize-initpoolptr);end;
strpool[poolptr]:=0;
if pdfsetmatrix(strstart[strptr],curh,curpageheight-curv)=1 then begin
begin if poolptr+7>poolsize then overflow(259,poolsize-initpoolptr);end;
begin strpool[poolptr]:=32;incr(poolptr);end;begin strpool[poolptr]:=48;
incr(poolptr);end;begin strpool[poolptr]:=32;incr(poolptr);end;
begin strpool[poolptr]:=48;incr(poolptr);end;begin strpool[poolptr]:=32;
incr(poolptr);end;begin strpool[poolptr]:=99;incr(poolptr);end;
begin strpool[poolptr]:=109;incr(poolptr);end;s:=makestring;
literal(s,0,false);end else begin pdferror(1146,1147);end;flushstr(s);
end;procedure pdfoutsave(p:halfword);begin checkpdfsave(curh,curv);
literal(113,0,false);end;procedure pdfoutrestore(p:halfword);
begin checkpdfrestore(curh,curv);literal(81,0,false);end;
procedure pdfspecial(p:halfword);var oldsetting:0..21;s:strnumber;
h:halfword;q,r:halfword;oldmode:integer;begin oldsetting:=selector;
selector:=selector;if mem[p].hh.b1=4 then begin{1618:}q:=getavail;
mem[q].hh.lh:=637;r:=getavail;mem[q].hh.rh:=r;mem[r].hh.lh:=19617;
begintokenlist(q,4);begintokenlist(mem[p+1].hh.rh,20);q:=getavail;
mem[q].hh.lh:=379;begintokenlist(q,4);oldmode:=curlist.modefield;
curlist.modefield:=0;curcs:=writeloc;q:=scantoks(false,true);
curlist.modefield:=oldmode;gettoken;
if curtok<>19617 then{1619:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(712);
end;begin helpptr:=2;helpline[1]:=1942;helpline[0]:=1439;end;error;
repeat gettoken;until curtok=19617;end{:1619};endtokenlist{:1618};
h:=defref;end else h:=mem[p+1].hh.rh;selector:=21;
showtokenlist(mem[h].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;literal(s,3,true);flushstr(s);
if mem[p].hh.b1=4 then flushlist(defref);end;
procedure pdfprinttoks(p:halfword);var s:strnumber;
begin s:=tokenstostring(p);
if(strstart[s+1]-strstart[s])>0 then pdfprint(s);flushstr(s);end;
procedure pdfprinttoksln(p:halfword);var s:strnumber;
begin s:=tokenstostring(p);
if(strstart[s+1]-strstart[s])>0 then begin begin pdfprint(s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;flushstr(s);end;
{:727}{772:}procedure pdfwriteobj(n:integer);var s:strnumber;f:bytefile;
begin s:=tokenstostring(pdfmem[objtab[n].int4+0]);
begin deletetokenref(pdfmem[objtab[n].int4+0]);
pdfmem[objtab[n].int4+0]:=-268435455;end;
if pdfmem[objtab[n].int4+1]>0 then begin pdfbegindict(n,0);
if pdfmem[objtab[n].int4+2]<>-268435455 then begin pdfprinttoksln(pdfmem
[objtab[n].int4+2]);begin deletetokenref(pdfmem[objtab[n].int4+2]);
pdfmem[objtab[n].int4+2]:=-268435455;end;end;pdfbeginstream;
end else pdfbeginobj(n,1);
if pdfmem[objtab[n].int4+3]>0 then begin curname:=s;curarea:=345;
curext:=345;packfilename(curname,curarea,curext);
if not texbopenin(f)then begin printnl(264);print(s);print(1178);
pdferror(1179,1180);end;print(1083);print(s);
if not eof(f)then begin while not eof(f)do begin begin if pdfosmode and(
1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)else if not pdfosmode and(1>
pdfbufsize)then overflow(1018,pdfopbufsize)else if not pdfosmode and(1+
pdfptr>pdfbufsize)then pdfflush;end;begin pdfbuf[pdfptr]:=getc(f);
incr(pdfptr);end;end;
if(not pdfmem[objtab[n].int4+1])and(pdfptr>0)and(pdfbuf[pdfptr-1]<>10)
then begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf
(1)else if not pdfosmode and(1>pdfbufsize)then overflow(1018,
pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush
;end;begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;print(1035);
bclose(f);
end else if pdfmem[objtab[n].int4+1]>0 then pdfprint(s)else begin
pdfprint(s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if pdfmem[objtab[n].int4+1]>0 then pdfendstream else pdfendobj;
flushstr(s);end;procedure flushwhatsitnode(p:halfword;s:smallnumber);
begin mem[p].hh.b0:=8;mem[p].hh.b1:=s;
if mem[p].hh.rh<>-268435455 then pdferror(1181,1182);flushnodelist(p);
end;{:772}{778:}procedure pdfwriteimage(n:integer);
begin pdfbegindict(n,0);
if pdfmem[objtab[n].int4+3]<>-268435455 then begin pdfprinttoksln(pdfmem
[objtab[n].int4+3]);begin deletetokenref(pdfmem[objtab[n].int4+3]);
pdfmem[objtab[n].int4+3]:=-268435455;end;end;
if fixedpdfdraftmode=0 then writeimage(pdfmem[objtab[n].int4+4]);
deleteimage(pdfmem[objtab[n].int4+4]);end;
{:778}{785:}procedure pdfprintrectspec(r:halfword);
begin pdfprintmagbp(((mem[r+1].int)-pdforiginh));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintmagbp((pdforiginv-(mem[r+4].int)));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintmagbp(((mem[r+3].int)-pdforiginh));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintmagbp((pdforiginv-(mem[r+2].int)));end;
{:785}{1564:}procedure warndestdup(id:integer;byname:smallnumber;
s1,s2:strnumber);begin if eqtb[29370].int>0 then goto 10;
pdfwarning(s1,1861,true,false);if byname>0 then begin print(1845);
printmark(id);end else begin print(1208);printint(id);end;print(1862);
print(s2);println;showcontext;end;
{:1564}{1630:}procedure writeaction(p:halfword);var s:strnumber;
d:integer;
begin if mem[p].hh.b0=3 then begin pdfprinttoksln(mem[p+2].hh.lh);
goto 10;end;pdfprint(1254);
if mem[p+1].hh.lh<>-268435455 then begin pdfprint(1949);
s:=tokenstostring(mem[p+1].hh.lh);
if(strpool[strstart[s]]=40)and(strpool[strstart[s]+(strstart[s+1]-
strstart[s])-1]=41)then pdfprint(s)else begin pdfprintstr(s);end;
flushstr(s);pdfprint(32);if mem[p+1].hh.rh>0 then begin pdfprint(1950);
if mem[p+1].hh.rh=1 then pdfprint(1951)else pdfprint(1952);end;end;
case mem[p].hh.b0 of 0:begin if mem[p+1].hh.lh=-268435455 then begin
pdfprint(1953);pdfprintint(getobj(1,mem[p].hh.rh,false));pdfprint(1087);
end else begin pdfprint(1954);pdfprintint(mem[p].hh.rh-1);end;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprint(tokenstostring(mem[p+2].hh.lh));flushstr(lasttokensstring);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=93;incr(pdfptr);end;end;end;
1:begin if mem[p+1].hh.lh=-268435455 then begin pdfprint(1955);
d:=getobj(5,mem[p].hh.rh,mem[p].hh.b1 mod 2);end else pdfprint(1956);
if(mem[p].hh.b1 mod 2)=1 then begin pdfstrentry(68,tokenstostring(mem[p]
.hh.rh));flushstr(lasttokensstring);
end else if mem[p+1].hh.lh=-268435455 then pdfindirect(68,d)else
pdferror(1875,1850);end;2:begin pdfprint(1957);
if mem[p+1].hh.lh=-268435455 then d:=getobj(10,mem[p].hh.rh,mem[p].hh.b1
mod 2);
if(mem[p].hh.b1 mod 2)=1 then begin pdfstrentry(68,tokenstostring(mem[p]
.hh.rh));flushstr(lasttokensstring);
end else if mem[p+1].hh.lh=-268435455 then pdfindirect(68,d)else
pdfintentry(68,mem[p].hh.rh);end;end;
if mem[p+3].hh.rh<>-268435455 then begin begin begin if pdfosmode and(1+
pdfptr>pdfbufsize)then pdfosgetosbuf(1)else if not pdfosmode and(1>
pdfbufsize)then overflow(1018,pdfopbufsize)else if not pdfosmode and(1+
pdfptr>pdfbufsize)then pdfflush;end;begin pdfbuf[pdfptr]:=32;
incr(pdfptr);end;end;
if mem[p+1].hh.lh=-268435455 then pdfindirect(1958,getobj(6,mem[p+3].hh.
rh,(mem[p].hh.b1 div 2)mod 2))else begin pdfprint(1959);
pdfprint(tokenstostring(mem[p+3].hh.rh));flushstr(lasttokensstring);end;
end;begin pdfprint(1255);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
procedure setrectdimens(p,parentbox:halfword;x,y,w,h,d,margin:scaled);
begin mem[p+1].int:=curh;
if(w=-1073741824)then mem[p+3].int:=x+mem[parentbox+1].int else mem[p+3]
.int:=curh+w;
if(h=-1073741824)then mem[p+2].int:=y-mem[parentbox+3].int else mem[p+2]
.int:=curv-h;
if(d=-1073741824)then mem[p+4].int:=y+mem[parentbox+2].int else mem[p+4]
.int:=curv+d;
if isshippingpage and matrixused then begin matrixtransformrect(mem[p+1]
.int,curpageheight-mem[p+4].int,mem[p+3].int,curpageheight-mem[p+2].int)
;mem[p+1].int:=getllx;mem[p+4].int:=curpageheight-getlly;
mem[p+3].int:=geturx;mem[p+2].int:=curpageheight-getury;end;
mem[p+1].int:=mem[p+1].int-margin;mem[p+2].int:=mem[p+2].int-margin;
mem[p+3].int:=mem[p+3].int+margin;mem[p+4].int:=mem[p+4].int+margin;end;
procedure doannot(p,parentbox:halfword;x,y:scaled);
begin if not isshippingpage then pdferror(1875,1960);
if doingleaders then goto 10;
if(objtab[mem[p+6].int].int2>-2)then mem[p+6].int:=pdfnewobjnum;
setrectdimens(p,parentbox,x,y,mem[p+1].int,mem[p+2].int,mem[p+3].int,0);
objtab[mem[p+6].int].int4:=p;begin pdfappendlistarg:=mem[p+6].int;
pdfannotlist:=appendptr(pdfannotlist,pdfappendlistarg);end;
if objtab[mem[p+6].int].int2=-2 then objtab[mem[p+6].int].int2:=-1;end;
{:1630}{1635:}procedure pushlinklevel(p:halfword);
begin if pdflinkstackptr>=pdfmaxlinklevel then overflow(1961,
pdfmaxlinklevel);pdfassert((mem[p].hh.b0=8)and(mem[p].hh.b1=16));
incr(pdflinkstackptr);pdflinkstack[pdflinkstackptr].nestinglevel:=curs;
pdflinkstack[pdflinkstackptr].linknode:=copynodelist(p);
pdflinkstack[pdflinkstackptr].reflinknode:=p;end;procedure poplinklevel;
begin pdfassert(pdflinkstackptr>0);
flushnodelist(pdflinkstack[pdflinkstackptr].linknode);
decr(pdflinkstackptr);end;procedure dolink(p,parentbox:halfword;
x,y:scaled);begin if not isshippingpage then pdferror(1875,1962);
pdfassert(mem[parentbox].hh.b0=0);
if(objtab[mem[p+6].int].int2>-2)then mem[p+6].int:=pdfnewobjnum;
pushlinklevel(p);
setrectdimens(p,parentbox,x,y,mem[p+1].int,mem[p+2].int,mem[p+3].int,
eqtb[29928].int);objtab[mem[p+6].int].int4:=p;
begin pdfappendlistarg:=mem[p+6].int;
pdflinklist:=appendptr(pdflinklist,pdfappendlistarg);end;
if objtab[mem[p+6].int].int2=-2 then objtab[mem[p+6].int].int2:=-1;end;
procedure endlink;var p:halfword;
begin if pdflinkstackptr<1 then pdferror(1875,1963);
if pdflinkstack[pdflinkstackptr].nestinglevel<>curs then pdfwarning(0,
1964,true,true);
if(mem[pdflinkstack[pdflinkstackptr].linknode+1].int=-1073741824)then
begin p:=pdflinkstack[pdflinkstackptr].reflinknode;
if isshippingpage and matrixused then begin matrixrecalculate(curh+eqtb[
29928].int);mem[p+1].int:=getllx-eqtb[29928].int;
mem[p+2].int:=curpageheight-getury-eqtb[29928].int;
mem[p+3].int:=geturx+eqtb[29928].int;
mem[p+4].int:=curpageheight-getlly+eqtb[29928].int;
end else mem[p+3].int:=curh+eqtb[29928].int;end;poplinklevel;end;
{:1635}{1636:}procedure appendlink(parentbox:halfword;x,y:scaled;
i:smallnumber);var p:halfword;begin pdfassert(mem[parentbox].hh.b0=0);
p:=copynodelist(pdflinkstack[i].linknode);
pdflinkstack[i].reflinknode:=p;mem[p].hh.lh:=268435455;
mem[p].hh.rh:=-268435455;
setrectdimens(p,parentbox,x,y,mem[p+1].int,mem[p+2].int,mem[p+3].int,
eqtb[29928].int);pdfcreateobj(0,0);objtab[objptr].int4:=p;
begin pdfappendlistarg:=objptr;
pdflinklist:=appendptr(pdflinklist,pdfappendlistarg);end;end;
{:1636}{1637:}procedure appendbead(p:halfword);var a,b,c,t:integer;
begin if not isshippingpage then pdferror(1875,1965);
t:=getobj(10,mem[p+5].hh.rh,mem[p+5].hh.b1);b:=pdfnewobjnum;
objtab[b].int4:=pdfgetmem(5);pdfmem[objtab[b].int4+1]:=pdflastpage;
pdfmem[objtab[b].int4]:=p;
if mem[p+6].hh.lh<>-268435455 then pdfmem[objtab[b].int4+4]:=
tokenstostring(mem[p+6].hh.lh)else pdfmem[objtab[b].int4+4]:=0;
if objtab[t].int4=0 then begin objtab[t].int4:=b;
pdfmem[objtab[b].int4+2]:=b;pdfmem[objtab[b].int4+3]:=b;
end else begin a:=objtab[t].int4;c:=pdfmem[objtab[a].int4+3];
pdfmem[objtab[b].int4+3]:=c;pdfmem[objtab[b].int4+2]:=a;
pdfmem[objtab[a].int4+3]:=b;pdfmem[objtab[c].int4+2]:=b;end;
begin pdfappendlistarg:=b;
pdfbeadlist:=appendptr(pdfbeadlist,pdfappendlistarg);end;end;
procedure dothread(p,parentbox:halfword;x,y:scaled);
begin if doingleaders then goto 10;
if mem[p].hh.b1=21 then begin pdfthreadwd:=mem[p+1].int;
pdfthreadht:=mem[p+2].int;pdfthreaddp:=mem[p+3].int;
pdflastthreadid:=mem[p+5].hh.rh;
pdflastthreadnamedid:=(mem[p+5].hh.b1>0);
if pdflastthreadnamedid then incr(mem[mem[p+5].hh.rh].hh.lh);
pdfthreadlevel:=curs;end;
setrectdimens(p,parentbox,x,y,mem[p+1].int,mem[p+2].int,mem[p+3].int,
eqtb[29930].int);appendbead(p);lastthread:=p;end;
procedure appendthread(parentbox:halfword;x,y:scaled);var p:halfword;
begin p:=getnode(7);mem[p].hh.lh:=268435455;mem[p].hh.rh:=-268435455;
mem[p+1].int:=pdfthreadwd;mem[p+2].int:=pdfthreadht;
mem[p+3].int:=pdfthreaddp;mem[p+6].hh.lh:=-268435455;
mem[p+5].hh.rh:=pdflastthreadid;
if pdflastthreadnamedid then begin incr(mem[mem[p+5].hh.rh].hh.lh);
mem[p+5].hh.b1:=1;end else mem[p+5].hh.b1:=0;
setrectdimens(p,parentbox,x,y,mem[p+1].int,mem[p+2].int,mem[p+3].int,
eqtb[29930].int);appendbead(p);lastthread:=p;end;procedure endthread;
begin if pdfthreadlevel<>curs then pdferror(1875,1966);
if(pdfthreaddp=-1073741824)and(lastthread<>-268435455)then mem[
lastthread+4].int:=curv+eqtb[29930].int;
if pdflastthreadnamedid then deletetokenref(pdflastthreadid);
lastthread:=-268435455;end;function opensubentries(p:halfword):integer;
var k,c:integer;l,r:integer;begin k:=0;
if pdfmem[objtab[p].int4+4]<>0 then begin l:=pdfmem[objtab[p].int4+4];
repeat incr(k);c:=opensubentries(l);if objtab[l].int0>0 then k:=k+c;
pdfmem[objtab[l].int4+1]:=p;r:=pdfmem[objtab[l].int4+3];
if r=0 then pdfmem[objtab[p].int4+5]:=l;l:=r;until l=0;end;
if objtab[p].int0>0 then objtab[p].int0:=k else objtab[p].int0:=-k;
opensubentries:=k;end;procedure dodest(p,parentbox:halfword;x,y:scaled);
var k:integer;begin if not isshippingpage then pdferror(1875,1967);
if doingleaders then goto 10;
if mem[p+6].hh.rh=-268435455 then k:=getobj(5,mem[p+5].hh.rh,mem[p+5].hh
.b1)else k:=getobj(6,mem[p+5].hh.rh,mem[p+5].hh.b1);
if objtab[k].int4<>-268435455 then begin warndestdup(mem[p+5].hh.rh,mem[
p+5].hh.b1,1875,1876);goto 10;end;objtab[k].int4:=p;
begin pdfappendlistarg:=k;
pdfdestlist:=appendptr(pdfdestlist,pdfappendlistarg);end;
case mem[p+5].hh.b0 of 0:if matrixused then setrectdimens(p,parentbox,x,
y,mem[p+1].int,mem[p+2].int,mem[p+3].int,eqtb[29929].int)else begin mem[
p+1].int:=curh;mem[p+2].int:=curv;end;
2,5:if matrixused then setrectdimens(p,parentbox,x,y,mem[p+1].int,mem[p
+2].int,mem[p+3].int,eqtb[29929].int)else mem[p+2].int:=curv;
3,6:if matrixused then setrectdimens(p,parentbox,x,y,mem[p+1].int,mem[p
+2].int,mem[p+3].int,eqtb[29929].int)else mem[p+1].int:=curh;1,4:;
7:setrectdimens(p,parentbox,x,y,mem[p+1].int,mem[p+2].int,mem[p+3].int,
eqtb[29929].int);end;end;procedure outform(p:halfword);
begin synctexpdfrefxform(mem[p+4].hh.lh);pdfendtext;begin pdfprint(113);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if pdflookuplist(pdfxformlist,mem[p+4].hh.lh)=-268435455 then begin
pdfappendlistarg:=mem[p+4].hh.lh;
pdfxformlist:=appendptr(pdfxformlist,pdfappendlistarg);end;
curv:=curv+pdfmem[objtab[mem[p+4].hh.lh].int4+2];pdfprint(1046);
pdfprintbp(((curh)-pdforiginh));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintbp((pdforiginv-(curv)));begin pdfprint(1047);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfprint(1162);
pdfprintint(objtab[mem[p+4].hh.lh].int0);
if pdfresnameprefix<>0 then pdfprint(pdfresnameprefix);
begin pdfprint(1968);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(81);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
procedure outimage(p:halfword);var image,groupref:integer;
imgw,imgh:integer;begin image:=pdfmem[objtab[mem[p+4].hh.lh].int4+4];
if(imagerotate(image)=90)or(imagerotate(image)=270)then begin imgh:=
imagewidth(image);imgw:=imageheight(image);
end else begin imgw:=imagewidth(image);imgh:=imageheight(image);end;
pdfendtext;begin pdfprint(113);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if pdflookuplist(pdfximagelist,mem[p+4].hh.lh)=-268435455 then begin
pdfappendlistarg:=mem[p+4].hh.lh;
pdfximagelist:=appendptr(pdfximagelist,pdfappendlistarg);end;
if not ispdfimage(image)then begin if ispngimage(image)then begin
groupref:=getimagegroupref(image);
if(groupref>0)and(pdfpagegroupval=0)then pdfpagegroupval:=groupref;end;
pdfprintreal(extxnoverd(mem[p+1].int,tenpow[6],onehundredbp),4);
pdfprint(1157);
pdfprintreal(extxnoverd(mem[p+2].int+mem[p+3].int,tenpow[6],onehundredbp
),4);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintbp(((curh)-pdforiginh));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintbp((pdforiginv-(curv)));
end else begin groupref:=getimagegroupref(image);
if(groupref<>0)and(pdfpagegroupval=0)then begin if groupref=-1 then
begin pdfpagegroupval:=pdfnewobjnum;
setimagegroupref(image,pdfpagegroupval);
end else pdfpagegroupval:=groupref;end;
pdfprintreal(extxnoverd(mem[p+1].int,tenpow[6],imgw),6);pdfprint(1157);
pdfprintreal(extxnoverd(mem[p+2].int+mem[p+3].int,tenpow[6],imgh),6);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintbp(((curh)-pdforiginh)-extxnoverd(mem[p+1].int,epdforigx(image),
imgw));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintbp((pdforiginv-(curv))-extxnoverd(mem[p+2].int+mem[p+3].int,
epdforigy(image),imgh));end;begin pdfprint(1047);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfprint(1163);
pdfprintint(objtab[mem[p+4].hh.lh].int0);
if pdfresnameprefix<>0 then pdfprint(pdfresnameprefix);
begin pdfprint(1968);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(81);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
function gapamount(p:halfword;curpos:scaled):scaled;
var snapunit,stretchamount,shrinkamount:scaled;
lastpos,nextpos,g,g2:scaled;begin snapunit:=mem[mem[p+1].hh.lh+1].int;
if mem[mem[p+1].hh.lh].hh.b0>0 then stretchamount:=1073741823 else
stretchamount:=mem[mem[p+1].hh.lh+2].int;
if mem[mem[p+1].hh.lh].hh.b1>0 then shrinkamount:=1073741823 else
shrinkamount:=mem[mem[p+1].hh.lh+3].int;
if mem[p].hh.b1=37 then lastpos:=pdfsnapyrefpos+snapunit*((curpos-
pdfsnapyrefpos)div snapunit)else pdferror(1969,1970);
nextpos:=lastpos+snapunit;{printnl(1971);printscaled(pdfsnapyrefpos);
printnl(1972);printspec(mem[p+1].hh.lh,0);printnl(1973);
printscaled(snapunit);printnl(1974);printscaled(stretchamount);
printnl(1975);printscaled(shrinkamount);printnl(1976);
printscaled(lastpos);printnl(1977);printscaled(curpos);printnl(1978);
printscaled(nextpos);}g:=1073741823;g2:=1073741823;gapamount:=0;
if curpos-lastpos<shrinkamount then g:=curpos-lastpos;
if(nextpos-curpos<stretchamount)then g2:=nextpos-curpos;
if(g=1073741823)and(g2=1073741823)then goto 10;
if g2<=g then gapamount:=g2 else gapamount:=-g;end;
function getvpos(p,q,b:halfword):halfword;var tmpv:scaled;
gorder:glueord;gsign:0..2;gluetemp:real;curglue:real;curg:scaled;
thisbox:halfword;begin tmpv:=curv;thisbox:=b;curg:=0;curglue:=0.0;
gorder:=mem[thisbox+5].hh.b1;gsign:=mem[thisbox+5].hh.b0;
while(p<>q)and(p<>-268435455)do begin if(p>=himemmin)then confusion(1979
)else begin case mem[p].hh.b0 of 0,1,2:tmpv:=tmpv+mem[p+3].int+mem[p+2].
int;
8:if(mem[p].hh.b1=12)or(mem[p].hh.b1=14)then tmpv:=tmpv+mem[p+2].int+mem
[p+3].int;10:begin{1638:}begin g:=mem[p+1].hh.lh;
ruleht:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;ruleht:=ruleht+curg;end{:1638};tmpv:=tmpv+ruleht;end;
11:tmpv:=tmpv+mem[p+1].int;others:;end;end;p:=mem[p].hh.rh;end;
getvpos:=tmpv;end;procedure dosnapycomp(p,b:halfword);var q:halfword;
tmpv,g,g2:scaled;
begin if not(not(p>=himemmin)and(mem[p].hh.b0=8)and(mem[p].hh.b1=38))
then pdferror(1969,1980);q:=p;
while(q<>-268435455)do begin if not(q>=himemmin)and(mem[q].hh.b0=8)and(
mem[q].hh.b1=37)then begin tmpv:=getvpos(p,q,b);g:=gapamount(q,tmpv);
g2:=roundxnoverd(g,mem[p+1].int,1000);{printnl(1981);printscaled(tmpv);
printnl(1982);printscaled(curv);printnl(1983);printscaled(g);
printnl(1984);printscaled(g2);}curv:=curv+g2;mem[q+2].int:=g-g2;
if mem[q+2].int=0 then mem[q+2].int:=1;goto 10;end;q:=mem[q].hh.rh;end;
end;procedure dosnapy(p:halfword);begin incr(countdosnapy);
{printnl(1985);printint(countdosnapy);printnl(1986);printscaled(curv);
printnl(1987);printscaled(mem[p+2].int);}
if mem[p+2].int<>0 then curv:=curv+mem[p+2].int else curv:=curv+
gapamount(p,curv);{printnl(1988);printscaled(curv);}end;
{:1637}procedure pdfhlistout;label 21,13,14,15,40,22;
var baseline:scaled;leftedge:scaled;saveh:scaled;thisbox:halfword;
gorder:glueord;gsign:0..2;p:halfword;leaderbox:halfword;leaderwd:scaled;
lx:scaled;outerdoingleaders:boolean;edge:scaled;prevp:halfword;
gluetemp:real;curglue:real;curg:scaled;i:smallnumber;begin curg:=0;
curglue:=0.0;thisbox:=tempptr;gorder:=mem[thisbox+5].hh.b1;
gsign:=mem[thisbox+5].hh.b0;p:=mem[thisbox+5].hh.rh;incr(curs);
baseline:=curv;prevp:=thisbox+5;
{1714:}if(eTeXmode=1)then begin{1710:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1710};
if(mem[thisbox].hh.b1)=2 then if curdir=1 then begin curdir:=0;
curh:=curh-mem[thisbox+1].int;end else mem[thisbox].hh.b1:=0;
if(curdir=1)and((mem[thisbox].hh.b1)<>1)then{1721:}begin saveh:=curh;
tempptr:=p;p:=newkern(0);mem[p+2].int:=0;mem[prevp].hh.rh:=p;curh:=0;
mem[p].hh.rh:=reverse(thisbox,-268435455,curg,curglue);
mem[p+1].int:=-curh;curh:=saveh;mem[thisbox].hh.b1:=1;end{:1721};
end{:1714};leftedge:=curh;
{730:}for i:=1 to pdflinkstackptr do begin pdfassert((mem[pdflinkstack[i
].linknode+1].int=-1073741824));
if(pdflinkstack[i].nestinglevel=curs)and genrunninglink then appendlink(
thisbox,leftedge,baseline,i);end{:730};{1927:}synctexhlist(thisbox);
{:1927};
while p<>-268435455 do{731:}21:if(p>=himemmin)then begin repeat f:=mem[p
].hh.b0;c:=mem[p].hh.b1;
if((fontbc[f]<=c)and(c<=fontec[f])and(fontinfo[charbase[f]+c].qqqq.b0>0)
)then begin begin if pdffonttype[f]=0 then dovf(f);
if pdffonttype[f]=1 then dovfpacket(f,c)else begin pdfbeginstring(f);
pdfprintchar(f,c);advcharwidth(f,c);end;end;
curh:=curh+fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true
,f,c)].qqqq.b0].int;goto 22;end;
if mltexenabledp then{1887:}begin{1889:}if c>=eqtb[29332].int then if c
<=eqtb[29333].int then if(eqtb[29021+c].hh.rh>0)then begin basec:=(eqtb[
29021+c].hh.rh mod 256);accentc:=(eqtb[29021+c].hh.rh div 256);
if(fontec[f]>=basec)then if(fontbc[f]<=basec)then if(fontec[f]>=accentc)
then if(fontbc[f]<=accentc)then begin iac:=fontinfo[charbase[f]+
effectivechar(true,f,accentc)].qqqq;
ibc:=fontinfo[charbase[f]+effectivechar(true,f,basec)].qqqq;
if(ibc.b0>0)then if(iac.b0>0)then goto 40;end;begindiagnostic;
printnl(2102);print(c);print(1642);print(accentc);print(32);
print(basec);print(999);slowprint(fontname[f]);printchar(33);
enddiagnostic(false);goto 22;end;begindiagnostic;printnl(998);
print(2101);print(c);print(999);slowprint(fontname[f]);printchar(33);
enddiagnostic(false);goto 22{:1889};
40:{1890:}if eqtb[29312].int>99 then begin begindiagnostic;
printnl(2103);print(c);print(1642);print(accentc);print(32);
print(basec);print(999);slowprint(fontname[f]);printchar(46);
enddiagnostic(false);end{:1890};
{1892:}basexheight:=fontinfo[5+parambase[f]].int;
baseslant:=fontinfo[1+parambase[f]].int/65536.0;accentslant:=baseslant;
basewidth:=fontinfo[widthbase[f]+ibc.b0].int;
baseheight:=fontinfo[heightbase[f]+(ibc.b1)div 16].int;
accentwidth:=fontinfo[widthbase[f]+iac.b0].int;
accentheight:=fontinfo[heightbase[f]+(iac.b1)div 16].int;
delta:=round((basewidth-accentwidth)/2.0+baseheight*baseslant-
basexheight*accentslant);curh:=curh+delta;
if((baseheight<>basexheight)and(accentheight>0))then begin curv:=
baseline+(basexheight-baseheight);
begin if pdffonttype[f]=0 then dovf(f);
if pdffonttype[f]=1 then dovfpacket(f,accentc)else begin pdfbeginstring(
f);pdfprintchar(f,accentc);advcharwidth(f,accentc);end;end;
curv:=baseline;end else begin begin if pdffonttype[f]=0 then dovf(f);
if pdffonttype[f]=1 then dovfpacket(f,accentc)else begin pdfbeginstring(
f);pdfprintchar(f,accentc);advcharwidth(f,accentc);end;end;end;
curh:=curh+accentwidth;curh:=curh+(-accentwidth-delta);
begin if pdffonttype[f]=0 then dovf(f);
if pdffonttype[f]=1 then dovfpacket(f,basec)else begin pdfbeginstring(f)
;pdfprintchar(f,basec);advcharwidth(f,basec);end;end;
curh:=curh+basewidth;{:1892};end{:1887};22:prevp:=mem[prevp].hh.rh;
p:=mem[p].hh.rh;until not(p>=himemmin);{1930:}synctexcurrent;{:1930};
end else{732:}begin case mem[p].hh.b0 of 0,1:{733:}if mem[p+5].hh.rh=
-268435455 then begin{1929:}if mem[p].hh.b0=1 then begin
synctexvoidvlist(p,thisbox);end else begin synctexvoidhlist(p,thisbox);
end;{:1929};curh:=curh+mem[p+1].int;
end else begin curv:=baseline+mem[p+4].int;tempptr:=p;
edge:=curh+mem[p+1].int;if curdir=1 then curh:=edge;
if mem[p].hh.b0=1 then pdfvlistout else pdfhlistout;curh:=edge;
curv:=baseline;end{:733};2:begin ruleht:=mem[p+3].int;
ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;goto 14;end;
8:{1645:}case mem[p].hh.b1 of 7,8:pdfoutliteral(p);
40:pdfoutcolorstack(p);41:pdfoutsetmatrix(p);42:pdfoutsave(p);
43:pdfoutrestore(p);10:begin pdfappendlistarg:=mem[p+1].hh.lh;
pdfobjlist:=appendptr(pdfobjlist,pdfappendlistarg);end;
12:{1647:}begin curv:=baseline;edge:=curh;outform(p);
curh:=edge+mem[p+1].int;curv:=baseline;end{:1647};
14:{1646:}begin curv:=baseline+mem[p+3].int;edge:=curh;outimage(p);
curh:=edge+mem[p+1].int;curv:=baseline;end{:1646};
15:doannot(p,thisbox,leftedge,baseline);
16:dolink(p,thisbox,leftedge,baseline);17:endlink;
19:dodest(p,thisbox,leftedge,baseline);
20:dothread(p,thisbox,leftedge,baseline);21:pdferror(1875,1991);
22:pdferror(1875,1992);23:{1641:}begin pdflastxpos:=curh;
if isshippingpage then pdflastypos:=curpageheight-curv else pdflastypos
:=pdfxformheight+pdfxformdepth-curv;end{:1641};3,4:pdfspecial(p);
36:{1642:}begin pdfsnapxrefpos:=curh;pdfsnapyrefpos:=curv;end{:1642};
38,37:;45:genfakedinterwordspace:=true;46:genfakedinterwordspace:=false;
47:pdfinsertfakespace;48:genrunninglink:=false;49:genrunninglink:=true;
others:outwhat(p);end{:1645};10:{735:}begin g:=mem[p+1].hh.lh;
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
if(eTeXmode=1)then{1699:}if(((gsign=1)and(mem[g].hh.b0=gorder))or((gsign
=2)and(mem[g].hh.b1=gorder)))then begin begin if mem[g].hh.rh=-268435455
then freenode(g,4)else decr(mem[g].hh.rh);end;
if mem[p].hh.b1<100 then begin mem[p].hh.b0:=11;mem[p+1].int:=rulewd;
end else begin g:=getnode(4);mem[g].hh.b0:=4;mem[g].hh.b1:=4;
mem[g+1].int:=rulewd;mem[g+2].int:=0;mem[g+3].int:=0;mem[p+1].hh.lh:=g;
end;end{:1699};
if mem[p].hh.b1>=100 then{736:}begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=2 then begin ruleht:=mem[leaderbox+3].int;
ruledp:=mem[leaderbox+2].int;goto 14;end;leaderwd:=mem[leaderbox+1].int;
if(leaderwd>0)and(rulewd>0)then begin rulewd:=rulewd+10;
if curdir=1 then curh:=curh-10;edge:=curh+rulewd;lx:=0;
{655:}if mem[p].hh.b1=100 then begin saveh:=curh;
curh:=leftedge+leaderwd*((curh-leftedge)div leaderwd);
if curh<saveh then curh:=curh+leaderwd;
end else begin lq:=rulewd div leaderwd;lr:=rulewd mod leaderwd;
if mem[p].hh.b1=101 then curh:=curh+(lr div 2)else begin lx:=lr div(lq+1
);curh:=curh+((lr-(lq-1)*lx)div 2);end;end{:655};
while curh+leaderwd<=edge do{737:}begin curv:=baseline+mem[leaderbox+4].
int;saveh:=curh;tempptr:=leaderbox;if curdir=1 then curh:=curh+leaderwd;
outerdoingleaders:=doingleaders;doingleaders:=true;
if mem[leaderbox].hh.b0=1 then pdfvlistout else pdfhlistout;
doingleaders:=outerdoingleaders;curv:=baseline;curh:=saveh+leaderwd+lx;
end{:737};if curdir=1 then curh:=edge else curh:=edge-10;goto 15;end;
end{:736};goto 13;end{:735};40:curh:=curh+mem[p+1].int;
11:begin{1932:}synctexkern(p,thisbox);{:1932};curh:=curh+mem[p+1].int;
end;9:begin{1933:}synctexmath(p,thisbox);{:1933};
{1716:}begin if(eTeXmode=1)then{1717:}begin if odd(mem[p].hh.b1)then if
mem[LRptr].hh.lh=(4*(mem[p].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;
end else begin if mem[p].hh.b1>4 then incr(LRproblems);
end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(mem[p].hh.b1 div 8)<>curdir then{1722:}begin saveh:=curh;
tempptr:=mem[p].hh.rh;rulewd:=mem[p+1].int;freenode(p,4);
curdir:=1-curdir;p:=newedge(curdir,rulewd);mem[prevp].hh.rh:=p;
curh:=curh-leftedge+rulewd;
mem[p].hh.rh:=reverse(thisbox,newedge(1-curdir,0),curg,curglue);
mem[p+2].int:=curh;curdir:=1-curdir;curh:=saveh;goto 21;end{:1722};end;
mem[p].hh.b0:=11;end{:1717};curh:=curh+mem[p+1].int;end{:1716};end;
6:{826:}begin mem[memtop-12]:=mem[p+1];
mem[memtop-12].hh.rh:=mem[p].hh.rh;p:=memtop-12;goto 21;end{:826};
{1720:}14:begin curh:=curh+mem[p+1].int;leftedge:=curh+mem[p+2].int;
curdir:=mem[p].hh.b1;end;{:1720}others:end;goto 15;
14:{734:}if(ruleht=-1073741824)then ruleht:=mem[thisbox+3].int;
if(ruledp=-1073741824)then ruledp:=mem[thisbox+2].int;
ruleht:=ruleht+ruledp;
if(ruleht>0)and(rulewd>0)then begin curv:=baseline+ruledp;
pdfsetrule(curh,curv,rulewd,ruleht);curv:=baseline;end{:734};
13:begin curh:=curh+rulewd;
{1931:}synctexhorizontalruleorglue(p,thisbox);{:1931};end;15:prevp:=p;
p:=mem[p].hh.rh;end{:732}{:731};{1928:}synctextsilh(thisbox);{:1928};
{1715:}if(eTeXmode=1)then begin{1718:}begin while mem[LRptr].hh.lh<>0 do
begin if mem[LRptr].hh.lh>4 then LRproblems:=LRproblems+10000;
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;end;
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;end{:1718};
if(mem[thisbox].hh.b1)=2 then curdir:=1;end{:1715};decr(curs);end;
{:729}{738:}procedure pdfvlistout;label 13,14,15;var leftedge:scaled;
topedge:scaled;savev:scaled;thisbox:halfword;gorder:glueord;gsign:0..2;
p:halfword;leaderbox:halfword;leaderht:scaled;lx:scaled;
outerdoingleaders:boolean;edge:scaled;gluetemp:real;curglue:real;
curg:scaled;begin curg:=0;curglue:=0.0;thisbox:=tempptr;
gorder:=mem[thisbox+5].hh.b1;gsign:=mem[thisbox+5].hh.b0;
p:=mem[thisbox+5].hh.rh;incr(curs);leftedge:=curh;
{1925:}synctexvlist(thisbox);{:1925};curv:=curv-mem[thisbox+3].int;
topedge:=curv;
{739:}if(lastthread<>-268435455)and(pdfthreaddp=-1073741824)and(
pdfthreadlevel=curs)then appendthread(thisbox,leftedge,topedge+mem[
thisbox+3].int){:739};
while p<>-268435455 do{740:}begin if(p>=himemmin)then confusion(1148)
else{741:}begin case mem[p].hh.b0 of 0,1:{742:}if mem[p+5].hh.rh=
-268435455 then begin curv:=curv+mem[p+3].int;
{1929:}if mem[p].hh.b0=1 then begin synctexvoidvlist(p,thisbox);
end else begin synctexvoidhlist(p,thisbox);end;{:1929};
curv:=curv+mem[p+2].int;end else begin curv:=curv+mem[p+3].int;
savev:=curv;
if curdir=1 then curh:=leftedge-mem[p+4].int else curh:=leftedge+mem[p+4
].int;tempptr:=p;if mem[p].hh.b0=1 then pdfvlistout else pdfhlistout;
curv:=savev+mem[p+2].int;curh:=leftedge;end{:742};
2:begin ruleht:=mem[p+3].int;ruledp:=mem[p+2].int;rulewd:=mem[p+1].int;
goto 14;end;8:{1639:}case mem[p].hh.b1 of 7,8:pdfoutliteral(p);
40:pdfoutcolorstack(p);41:pdfoutsetmatrix(p);42:pdfoutsave(p);
43:pdfoutrestore(p);10:begin pdfappendlistarg:=mem[p+1].hh.lh;
pdfobjlist:=appendptr(pdfobjlist,pdfappendlistarg);end;
12:{1644:}begin curv:=curv+mem[p+2].int;savev:=curv;curh:=leftedge;
outform(p);curv:=savev+mem[p+3].int;curh:=leftedge;end{:1644};
14:{1643:}begin curv:=curv+mem[p+2].int+mem[p+3].int;savev:=curv;
curh:=leftedge;outimage(p);curv:=savev;curh:=leftedge;end{:1643};
15:doannot(p,thisbox,leftedge,topedge+mem[thisbox+3].int);
16:pdferror(1875,1989);17:pdferror(1875,1990);
19:dodest(p,thisbox,leftedge,topedge+mem[thisbox+3].int);
20,21:dothread(p,thisbox,leftedge,topedge+mem[thisbox+3].int);
22:endthread;23:{1641:}begin pdflastxpos:=curh;
if isshippingpage then pdflastypos:=curpageheight-curv else pdflastypos
:=pdfxformheight+pdfxformdepth-curv;end{:1641};3,4:pdfspecial(p);
36:{1642:}begin pdfsnapxrefpos:=curh;pdfsnapyrefpos:=curv;end{:1642};
38:dosnapycomp(p,thisbox);37:dosnapy(p);45:genfakedinterwordspace:=true;
46:genfakedinterwordspace:=false;47:pdfinsertfakespace;
48:genrunninglink:=false;49:genrunninglink:=true;others:outwhat(p);
end{:1639};10:{744:}begin g:=mem[p+1].hh.lh;ruleht:=mem[g+1].int-curg;
if gsign<>0 then begin if gsign=1 then begin if mem[g].hh.b0=gorder then
begin curglue:=curglue+mem[g+2].int;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end else if mem[g].hh.b1=gorder then begin curglue:=curglue-mem[g+3].int
;gluetemp:=mem[thisbox+6].gr*curglue;
if gluetemp>1000000000.0 then gluetemp:=1000000000.0 else if gluetemp<
-1000000000.0 then gluetemp:=-1000000000.0;curg:=round(gluetemp);end;
end;ruleht:=ruleht+curg;
if mem[p].hh.b1>=100 then{745:}begin leaderbox:=mem[p+1].hh.rh;
if mem[leaderbox].hh.b0=2 then begin rulewd:=mem[leaderbox+1].int;
ruledp:=0;goto 14;end;
leaderht:=mem[leaderbox+3].int+mem[leaderbox+2].int;
if(leaderht>0)and(ruleht>0)then begin ruleht:=ruleht+10;
edge:=curv+ruleht;lx:=0;
{664:}if mem[p].hh.b1=100 then begin savev:=curv;
curv:=topedge+leaderht*((curv-topedge)div leaderht);
if curv<savev then curv:=curv+leaderht;
end else begin lq:=ruleht div leaderht;lr:=ruleht mod leaderht;
if mem[p].hh.b1=101 then curv:=curv+(lr div 2)else begin lx:=lr div(lq+1
);curv:=curv+((lr-(lq-1)*lx)div 2);end;end{:664};
while curv+leaderht<=edge do{746:}begin if curdir=1 then curh:=leftedge-
mem[leaderbox+4].int else curh:=leftedge+mem[leaderbox+4].int;
curv:=curv+mem[leaderbox+3].int;savev:=curv;tempptr:=leaderbox;
outerdoingleaders:=doingleaders;doingleaders:=true;
if mem[leaderbox].hh.b0=1 then pdfvlistout else pdfhlistout;
doingleaders:=outerdoingleaders;curh:=leftedge;
curv:=savev-mem[leaderbox+3].int+leaderht+lx;end{:746};curv:=edge-10;
goto 15;end;end{:745};goto 13;end{:744};11:curv:=curv+mem[p+1].int;
others:end;goto 15;
14:{743:}if(rulewd=-1073741824)then rulewd:=mem[thisbox+1].int;
ruleht:=ruleht+ruledp;curv:=curv+ruleht;
if(ruleht>0)and(rulewd>0)then begin if curdir=1 then curh:=curh-rulewd;
pdfsetrule(curh,curv,rulewd,ruleht);curh:=leftedge;end;goto 15{:743};
13:curv:=curv+ruleht;end{:741};15:p:=mem[p].hh.rh;end{:740};
{1926:}synctextsilv(thisbox);{:1926};decr(curs);end;
{:738}{747:}procedure fixpdfoutput;
begin if not fixedpdfoutputset then begin fixedpdfoutput:=eqtb[29342].
int;fixedpdfoutputset:=true;
end else if fixedpdfoutput<>eqtb[29342].int then pdferror(1028,1149);
if fixedpdfoutputset then fixpdfdraftmode;end;
{:747}{748:}procedure fixpdfdraftmode;
begin if not fixedpdfdraftmodeset then begin fixedpdfdraftmode:=eqtb[
29368].int;fixedpdfdraftmodeset:=true;
end else if fixedpdfdraftmode<>eqtb[29368].int then pdferror(1028,1150);
if fixedpdfdraftmodeset and fixedpdfdraftmode>0 then begin
fixedpdfdraftmodeset:=true;eqtb[29343].int:=0;
fixedpdfobjcompresslevel:=0;end;end;
{:748}{749:}function substrofstr(s,t:strnumber):boolean;label 22,10;
var j,k,kk:poolpointer;begin k:=strstart[t];
while(k<strstart[t+1]-(strstart[s+1]-strstart[s]))do begin j:=strstart[s
];kk:=k;
while(j<strstart[s+1])do begin if strpool[j]<>strpool[kk]then goto 22;
incr(j);incr(kk);end;substrofstr:=true;goto 10;22:incr(k);end;
substrofstr:=false;end;{:749}{750:}procedure pdfshipout(p:halfword;
shippingpage:boolean);label 30,31;var i,j,k:integer;s:poolpointer;
mediaboxgiven:boolean;savefontlist:halfword;saveobjlist:halfword;
saveximagelist:halfword;savexformlist:halfword;saveimageprocset:integer;
savetextprocset:integer;pdflastresources:integer;
begin if eqtb[29311].int>0 then begin printnl(345);println;print(1003);
end;if not initpdfoutput then begin{792:}checkpdfversion;preparemag;
fixeddecimaldigits:=fixint(eqtb[29344].int,0,4);
minbpval:=dividescaled(onehundredbp,tenpow[fixeddecimaldigits+2],0);
if eqtb[29347].int=0 then eqtb[29347].int:=pkdpi;
fixedpkresolution:=fixint(eqtb[29347].int,72,8000);
pkscalefactor:=dividescaled(72,fixedpkresolution,5+fixeddecimaldigits);
if eqtb[27171].hh.rh<>-268435455 then begin kpseinitprog('PDFTEX',
fixedpkresolution,makecstring(tokenstostring(eqtb[27171].hh.rh)),nil);
begin decr(strptr);poolptr:=strstart[strptr];end;
end else kpseinitprog('PDFTEX',fixedpkresolution,nil,nil);
kpsesetprogramenabled(kpsepkformat,1,kpsesrccompile);
setjobid(eqtb[29300].int,eqtb[29299].int,eqtb[29298].int,eqtb[29297].int
);if(eqtb[29348].int>0)and(pdfresnameprefix=0)then pdfresnameprefix:=
getresnameprefix{:792};initpdfoutput:=true;end;
isshippingpage:=shippingpage;
if shippingpage then begin if termoffset>maxprintline-9 then println
else if(termoffset>0)or(fileoffset>0)then printchar(32);printchar(91);
j:=9;while(eqtb[29391+j].int=0)and(j>0)do decr(j);
for k:=0 to j do begin printint(eqtb[29391+k].int);
if k<j then printchar(46);end;fflush(stdout);end;
if eqtb[29311].int>0 then begin if shippingpage then printchar(93);
begindiagnostic;showbox(p);enddiagnostic(true);end;
pdfoutputvalue:=eqtb[29342].int;
if shippingpage then synctexsheet(eqtb[29294].int)else synctexpdfxform(p
);
{751:}{669:}if(mem[p+3].int>1073741823)or(mem[p+2].int>1073741823)or(mem
[p+3].int+mem[p+2].int+eqtb[29922].int>1073741823)or(mem[p+1].int+eqtb[
29921].int>1073741823)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1007);
end;begin helpptr:=2;helpline[1]:=1008;helpline[0]:=1009;end;error;
if eqtb[29311].int<=0 then begin begindiagnostic;printnl(1010);
showbox(p);enddiagnostic(true);end;goto 30;end;
if mem[p+3].int+mem[p+2].int+eqtb[29922].int>maxv then maxv:=mem[p+3].
int+mem[p+2].int+eqtb[29922].int;
if mem[p+1].int+eqtb[29921].int>maxh then maxh:=mem[p+1].int+eqtb[29921]
.int{:669};{752:}fixpdfoutput;tempptr:=p;preparemag;
pdflastresources:=pdfnewobjnum;pdfpagegroupval:=0;
{753:}pdffontlist:=-268435455;pdfobjlist:=-268435455;
pdfxformlist:=-268435455;pdfximagelist:=-268435455;
pdftextprocset:=false;pdfimageprocset:=0{:753};
if not shippingpage then begin pdfxformwidth:=mem[p+1].int;
pdfxformheight:=mem[p+3].int;pdfxformdepth:=mem[p+2].int;
pdfbegindict(pdfcurform,0);pdflaststream:=pdfcurform;curv:=mem[p+3].int;
curh:=0;pdforiginh:=0;pdforiginv:=pdfxformheight+pdfxformdepth;
end else begin{755:}curhoffset:=eqtb[29924].int+eqtb[29921].int;
curvoffset:=eqtb[29925].int+eqtb[29922].int;
if eqtb[29926].int<>0 then curpagewidth:=eqtb[29926].int else
curpagewidth:=mem[p+1].int+2*curhoffset;
if eqtb[29927].int<>0 then curpageheight:=eqtb[29927].int else
curpageheight:=mem[p+3].int+mem[p+2].int+2*curvoffset{:755};
pdflastpage:=getobj(1,totalpages+1,0);objtab[pdflastpage].int4:=1;
pdfnewdict(0,0,0);pdflaststream:=objptr;curh:=curhoffset;
curv:=mem[p+3].int+curvoffset;pdforiginh:=0;pdforiginv:=curpageheight;
{754:}pdfannotlist:=-268435455;pdflinklist:=-268435455;
pdfdestlist:=-268435455;pdfbeadlist:=-268435455;
lastthread:=-268435455{:754};end;
if not shippingpage then begin{756:}begin pdfprint(1151);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(1152);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if pdfmem[objtab[pdfcurform].int4+4]<>-268435455 then begin
pdfprinttoksln(pdfmem[objtab[pdfcurform].int4+4]);
begin deletetokenref(pdfmem[objtab[pdfcurform].int4+4]);
pdfmem[objtab[pdfcurform].int4+4]:=-268435455;end;end;pdfprint(1153);
pdfprint(1066);pdfprintbp(pdfxformwidth);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintbp(pdfxformheight+pdfxformdepth);begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(1154);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(1155);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfindirectln(1156,pdflastresources){:756};end;{757:}pdfbeginstream;
if shippingpage then begin{758:}preparemag;
if eqtb[29294].int<>1000 then begin pdfprintreal(eqtb[29294].int,3);
pdfprint(1157);pdfprintreal(eqtb[29294].int,3);begin pdfprint(1158);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end{:758};end;
pdfshipoutbegin(shippingpage);
if shippingpage then pdfoutcolorstackstartpage;{:757}{:752};
if mem[p].hh.b0=1 then pdfvlistout else pdfhlistout;
if shippingpage then incr(totalpages);curs:=-1;{759:}{760:}pdfendtext;
pdfshipoutend(shippingpage);pdfendstream{:760};
if shippingpage then begin{769:}pdfbegindict(pdflastpage,1);
begin pdfprint(1170);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfindirectln(1171,pdflaststream);pdfindirectln(1156,pdflastresources);
mediaboxgiven:=false;
if eqtb[27169].hh.rh<>-268435455 then begin s:=tokenstostring(eqtb[27169
].hh.rh);mediaboxgiven:=substrofstr(1172,s);flushstr(s);end;
if not mediaboxgiven then begin pdfprint(1173);
pdfprintmagbp(curpagewidth);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintmagbp(curpageheight);begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
if eqtb[27169].hh.rh<>-268435455 then pdfprinttoksln(eqtb[27169].hh.rh);
{770:}if totalpages mod 6=1 then begin pdfcreateobj(2,6);
pdflastpages:=objptr;end;pdfindirectln(1175,pdflastpages){:770};
if pdfpagegroupval>0 then begin pdfprint(1174);
pdfprintint(pdfpagegroupval);begin pdfprint(1087);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
{771:}if(pdfannotlist<>-268435455)or(pdflinklist<>-268435455)then begin
pdfprint(1176);k:=pdfannotlist;
while k<>-268435455 do begin pdfprintint(mem[k].hh.lh);pdfprint(1160);
k:=mem[k].hh.rh;end;k:=pdflinklist;
while k<>-268435455 do begin pdfprintint(mem[k].hh.lh);pdfprint(1160);
k:=mem[k].hh.rh;end;begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
if pdfbeadlist<>-268435455 then begin k:=pdfbeadlist;pdfprint(1177);
while k<>-268435455 do begin pdfprintint(mem[k].hh.lh);pdfprint(1160);
k:=mem[k].hh.rh;end;begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end{:771};
pdfenddict{:769};end;
{761:}{773:}if pdfobjlist<>-268435455 then begin k:=pdfobjlist;
while k<>-268435455 do begin if not(objtab[mem[k].hh.lh].int2>-1)then
pdfwriteobj(mem[k].hh.lh);k:=mem[k].hh.rh;end;end{:773};
{779:}if pdfximagelist<>-268435455 then begin k:=pdfximagelist;
while k<>-268435455 do begin if not(objtab[mem[k].hh.lh].int2>-1)then
pdfwriteimage(mem[k].hh.lh);k:=mem[k].hh.rh;end;end{:779};
{775:}if pdfxformlist<>-268435455 then begin k:=pdfxformlist;
while k<>-268435455 do begin if not(objtab[mem[k].hh.lh].int2>-1)then
begin savedpdfcurform:=pdfcurform;pdfcurform:=mem[k].hh.lh;
{776:}savefontlist:=pdffontlist;saveobjlist:=pdfobjlist;
savexformlist:=pdfxformlist;saveximagelist:=pdfximagelist;
savetextprocset:=pdftextprocset;saveimageprocset:=pdfimageprocset{:776};
{753:}pdffontlist:=-268435455;pdfobjlist:=-268435455;
pdfxformlist:=-268435455;pdfximagelist:=-268435455;
pdftextprocset:=false;pdfimageprocset:=0{:753};
pdfshipout(pdfmem[objtab[pdfcurform].int4+3],false);
pdfcurform:=savedpdfcurform;{777:}pdffontlist:=savefontlist;
pdfobjlist:=saveobjlist;pdfxformlist:=savexformlist;
pdfximagelist:=saveximagelist;pdftextprocset:=savetextprocset;
pdfimageprocset:=saveimageprocset{:777};end;k:=mem[k].hh.rh;end;
end{:775}{:761};if shippingpage then begin{780:}pdforiginh:=0;
pdforiginv:=curpageheight;
{781:}if pdfannotlist<>-268435455 then begin k:=pdfannotlist;
while k<>-268435455 do begin i:=objtab[mem[k].hh.lh].int4;
pdfbegindict(mem[k].hh.lh,1);begin pdfprint(1183);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfprinttoksln(mem[i+5].hh.lh);
pdfrectangle(mem[i+1].int,mem[i+2].int,mem[i+3].int,mem[i+4].int);
pdfenddict;k:=mem[k].hh.rh;end;end{:781};
{782:}if pdflinklist<>-268435455 then begin k:=pdflinklist;
while k<>-268435455 do begin i:=objtab[mem[k].hh.lh].int4;
pdfbegindict(mem[k].hh.lh,1);begin pdfprint(1183);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if mem[mem[i+5].hh.rh].hh.b0<>3 then begin pdfprint(1184);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if mem[i+5].hh.lh<>-268435455 then pdfprinttoksln(mem[i+5].hh.lh);
pdfrectangle(mem[i+1].int,mem[i+2].int,mem[i+3].int,mem[i+4].int);
if mem[mem[i+5].hh.rh].hh.b0<>3 then pdfprint(1185);
writeaction(mem[i+5].hh.rh);pdfenddict;k:=mem[k].hh.rh;end;
{783:}k:=pdflinklist;
while k<>-268435455 do begin i:=objtab[mem[k].hh.lh].int4;
if mem[i].hh.lh=268435455 then flushwhatsitnode(i,16);k:=mem[k].hh.rh;
end{:783};end{:782};
{784:}if pdfdestlist<>-268435455 then begin k:=pdfdestlist;
while k<>-268435455 do begin if(objtab[mem[k].hh.lh].int2>-1)then
pdferror(1179,1186)else begin i:=objtab[mem[k].hh.lh].int4;
if(mem[i+5].hh.b1>0)and(mem[i+6].hh.rh=-268435455)then begin
pdfbegindict(mem[k].hh.lh,1);pdfprint(1187);
end else pdfbeginobj(mem[k].hh.lh,1);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=91;incr(pdfptr);end;end;
if mem[i+6].hh.rh=-268435455 then pdfprintint(pdflastpage)else
pdfprintint(mem[i+6].hh.rh);pdfprint(1160);
case mem[i+5].hh.b0 of 0:begin pdfprint(1188);
pdfprintmagbp(((mem[i+1].int)-pdforiginh));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintmagbp((pdforiginv-(mem[i+2].int)));
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
if mem[i+6].hh.lh=-268435455 then pdfprint(1189)else begin pdfprintint(
mem[i+6].hh.lh div 1000);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=46;incr(pdfptr);end;end;
pdfprintint((mem[i+6].hh.lh mod 1000));end;end;1:pdfprint(1190);
2:begin pdfprint(1191);pdfprintmagbp((pdforiginv-(mem[i+2].int)));end;
3:begin pdfprint(1192);pdfprintmagbp(((mem[i+1].int)-pdforiginh));end;
4:pdfprint(1193);5:begin pdfprint(1194);
pdfprintmagbp((pdforiginv-(mem[i+2].int)));end;6:begin pdfprint(1195);
pdfprintmagbp(((mem[i+1].int)-pdforiginh));end;7:begin pdfprint(1196);
pdfprintrectspec(i);end;others:pdferror(1179,1197);end;
begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if(mem[i+5].hh.b1>0)and(mem[i+6].hh.rh=-268435455)then pdfenddict else
pdfendobj;end;k:=mem[k].hh.rh;end;end{:784};
{786:}if pdfbeadlist<>-268435455 then begin k:=pdfbeadlist;
while k<>-268435455 do begin pdfnewobj(0,0,1);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=91;incr(pdfptr);end;end;
i:=pdfmem[objtab[mem[k].hh.lh].int4];pdfprintrectspec(i);
if mem[i].hh.lh=268435455 then flushwhatsitnode(i,21);
begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfmem[objtab[mem[k].hh.lh].int4]:=objptr;pdfendobj;k:=mem[k].hh.rh;end;
end{:786}{:780};end;{762:}pdfbegindict(pdflastresources,1);
{763:}if shippingpage then begin if eqtb[27170].hh.rh<>-268435455 then
pdfprinttoksln(eqtb[27170].hh.rh);
end else begin if pdfmem[objtab[pdfcurform].int4+5]<>-268435455 then
begin pdfprinttoksln(pdfmem[objtab[pdfcurform].int4+5]);
begin deletetokenref(pdfmem[objtab[pdfcurform].int4+5]);
pdfmem[objtab[pdfcurform].int4+5]:=-268435455;end;end;end{:763};
{766:}if pdffontlist<>-268435455 then begin pdfprint(1159);
k:=pdffontlist;while k<>-268435455 do begin pdfprint(1055);
begin if pdffontnum[mem[k].hh.lh]<0 then ff:=-pdffontnum[mem[k].hh.lh]
else ff:=mem[k].hh.lh;end;pdfprintint(ff);
if pdfresnameprefix<>0 then pdfprint(pdfresnameprefix);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintint(pdffontnum[ff]);pdfprint(1160);k:=mem[k].hh.rh;end;
begin pdfprint(1035);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdftextprocset:=true;
end{:766};
{767:}if(pdfxformlist<>-268435455)or(pdfximagelist<>-268435455)then
begin pdfprint(1161);k:=pdfxformlist;
while k<>-268435455 do begin pdfprint(1162);
pdfprintint(objtab[mem[k].hh.lh].int0);
if pdfresnameprefix<>0 then pdfprint(pdfresnameprefix);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;pdfprintint(mem[k].hh.lh);
pdfprint(1160);k:=mem[k].hh.rh;end;k:=pdfximagelist;
while k<>-268435455 do begin pdfprint(1163);
pdfprintint(objtab[mem[k].hh.lh].int0);
if pdfresnameprefix<>0 then pdfprint(pdfresnameprefix);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;pdfprintint(mem[k].hh.lh);
pdfprint(1160);updateimageprocset(pdfmem[objtab[mem[k].hh.lh].int4+4]);
k:=mem[k].hh.rh;end;begin pdfprint(1035);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end{:767};
{768:}if(eqtb[29377].int<0)or((eqtb[29377].int=0)and(eqtb[29351].int<2))
then begin pdfprint(1164);if pdftextprocset then pdfprint(1165);
if checkimageb(pdfimageprocset)then pdfprint(1166);
if checkimagec(pdfimageprocset)then pdfprint(1167);
if checkimagei(pdfimageprocset)then pdfprint(1168);begin pdfprint(1169);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end end{:768};
pdfenddict{:762};{764:}flushlist(pdffontlist);flushlist(pdfobjlist);
flushlist(pdfxformlist);flushlist(pdfximagelist){:764};
if shippingpage then begin{765:}flushlist(pdfannotlist);
flushlist(pdflinklist);flushlist(pdfdestlist);
flushlist(pdfbeadlist){:765};end{:759};30:{:751};
if shippingpage then synctexteehs else synctexmrofxfdp;
if(eTeXmode=1)then{1730:}begin if LRproblems>0 then begin{1713:}begin
println;printnl(2053);printint(LRproblems div 10000);print(2054);
printint(LRproblems mod 10000);print(2055);LRproblems:=0;end{:1713};
printchar(41);println;end;
if(LRptr<>-268435455)or(curdir<>0)then confusion(2057);end{:1730};
if(eqtb[29311].int<=0)and shippingpage then printchar(93);deadcycles:=0;
fflush(stdout);
{667:}ifdef('STAT')if eqtb[29308].int>1 then begin printnl(1004);
printint(varused);printchar(38);printint(dynused);printchar(59);end;
endif('STAT')flushnodelist(p);
ifdef('STAT')if eqtb[29308].int>1 then begin print(1005);
printint(varused);printchar(38);printint(dynused);print(1006);
printint(himemmin-lomemmax-1);println;end;endif('STAT'){:667};end;
{:750}{791:}procedure shipout(p:halfword);begin fixpdfoutput;
if eqtb[29342].int>0 then pdfshipout(p,true)else dvishipout(p);end;
{:791}{793:}function strlessstr(s1,s2:strnumber):boolean;
var j1,j2,e1,e2:poolpointer;c1,c2:packedASCIIcode;
begin j1:=strstart[s1];j2:=strstart[s2];
e1:=j1+(strstart[s1+1]-strstart[s1]);
e2:=j2+(strstart[s2+1]-strstart[s2]);
while(j1<e1)and(j2<e2)do begin c1:=strpool[j1];incr(j1);
if(c1=92)and(j1<e1)then begin c1:=strpool[j1];incr(j1);
if(c1>=48)and(c1<=55)then begin c1:=c1-48;
if(j1<e1)and(strpool[j1]>=48)and(strpool[j1]<=55)then begin c1:=8*c1+
strpool[j1]-48;incr(j1);
if(j1<e1)and(strpool[j1]>=48)and(strpool[j1]<=55)and(c1<32)then begin c1
:=8*c1+strpool[j1]-48;incr(j1);end;end;
end else begin case c1 of 98:c1:=8;102:c1:=12;110:c1:=10;114:c1:=13;
116:c1:=9;others:end;end;end;c2:=strpool[j2];incr(j2);
if(c2=92)and(j2<e2)then begin c2:=strpool[j2];incr(j2);
if(c2>=48)and(c2<=55)then begin c2:=c2-48;
if(j2<e2)and(strpool[j2]>=48)and(strpool[j2]<=55)then begin c2:=8*c2+
strpool[j2]-48;incr(j2);
if(j2<e2)and(strpool[j2]>=48)and(strpool[j2]<=55)and(c2<32)then begin c2
:=8*c2+strpool[j2]-48;incr(j2);end;end;
end else begin case c2 of 98:c2:=8;102:c2:=12;110:c2:=10;114:c2:=13;
116:c2:=9;others:end;end;end;if c1<c2 then begin strlessstr:=true;
goto 10;end else if c1>c2 then begin strlessstr:=false;goto 10;end;end;
if(j1>=e1)and(j2<e2)then strlessstr:=true else strlessstr:=false;10:end;
procedure sortdestnames(l,r:integer);var i,j:integer;s:strnumber;
e:destnameentry;begin i:=l;j:=r;s:=destnames[(l+r)div 2].objname;
repeat while strlessstr(destnames[i].objname,s)do incr(i);
while strlessstr(s,destnames[j].objname)do decr(j);
if i<=j then begin e:=destnames[i];destnames[i]:=destnames[j];
destnames[j]:=e;incr(i);decr(j);end;until i>j;
if l<j then sortdestnames(l,j);if i<r then sortdestnames(i,r);end;
{:793}{795:}procedure pdffixdest(k:integer);
begin if objtab[k].int4<>-268435455 then goto 10;
pdfwarning(1206,345,true,false);
if objtab[k].int0<0 then begin print(1207);print(-objtab[k].int0);
print(125);end else begin print(1208);printint(objtab[k].int0);end;
print(1209);println;println;pdfbeginobj(k,1);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=91;incr(pdfptr);end;end;pdfprintint(headtab[1]);
begin pdfprint(1210);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfendobj;end;
{:795}{797:}procedure pdffixstructdest(k:integer);
begin if objtab[k].int4<>-268435455 then goto 10;
pdfwarning(1211,345,false,false);
if objtab[k].int0<0 then begin print(1207);print(-objtab[k].int0);
print(125);end else begin print(1208);printint(objtab[k].int0);end;
print(1212);println;println;{pdfbeginobj(k,1);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=91;incr(pdfptr);end;end;pdfprintint(headtab[1]);
begin pdfprint(1210);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfendobj;}end;
{:797}{807:}procedure pdfprintinfo;var s:strnumber;
creatorgiven,producergiven,creationdategiven,moddategiven,trappedgiven:
boolean;begin pdfnewdict(0,0,3);creatorgiven:=false;
producergiven:=false;creationdategiven:=false;moddategiven:=false;
trappedgiven:=false;
if pdfinfotoks<>-268435455 then begin s:=tokenstostring(pdfinfotoks);
creatorgiven:=substrofstr(1230,s);producergiven:=substrofstr(1231,s);
creationdategiven:=substrofstr(1232,s);
moddategiven:=substrofstr(1233,s);trappedgiven:=substrofstr(1234,s);end;
if not producergiven then begin{808:}pdfprint(1240);
pdfprintint(140 div 100);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=46;incr(pdfptr);end;end;pdfprintint(140 mod 100);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=46;incr(pdfptr);end;end;pdfprint(257);
begin pdfprint(41);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end{:808};end;
if pdfinfotoks<>-268435455 then begin if(strstart[s+1]-strstart[s])>0
then begin begin pdfprint(s);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;flushstr(s);
begin deletetokenref(pdfinfotoks);pdfinfotoks:=-268435455;end;end;
if not creatorgiven then pdfstrentryln(1235,1236);
if eqtb[29373].int=0 then begin if not creationdategiven then begin
{809:}printcreationdate;{:809};end;
if not moddategiven then begin{810:}printmoddate;{:810};end;end;
if not trappedgiven then begin begin pdfprint(1237);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
if eqtb[29374].int mod 2=0 then begin if getptexuseunderscore then
pdfstrentryln(1238,pdftexbanner)else pdfstrentryln(1239,pdftexbanner);
end;pdfenddict;end;{:807}{817:}procedure scanspec(c:groupcode;
threecodes:boolean);label 40;var s:integer;speccode:0..1;
begin if threecodes then s:=savestack[saveptr+0].int;
if scankeyword(1258)then speccode:=0 else if scankeyword(1259)then
speccode:=1 else begin speccode:=1;curval:=0;goto 40;end;
scandimen(false,false,false);
40:if threecodes then begin savestack[saveptr+0].int:=s;incr(saveptr);
end;savestack[saveptr+0].int:=speccode;savestack[saveptr+1].int:=curval;
saveptr:=saveptr+2;newsavelevel(c);scanleftbrace;end;
{:817}{823:}function checkexpandpars(f:internalfontnumber):boolean;
var k:internalfontnumber;begin checkexpandpars:=false;
if(pdffontstep[f]=0)or((pdffontstretch[f]=0)and(pdffontshrink[f]=0))then
goto 10;
if curfontstep<0 then curfontstep:=pdffontstep[f]else if curfontstep<>
pdffontstep[f]then pdferror(1053,1260);k:=pdffontstretch[f];
if k<>0 then begin if maxstretchratio<0 then maxstretchratio:=
pdffontexpandratio[k]else if maxstretchratio<>pdffontexpandratio[k]then
pdferror(1053,1261);end;k:=pdffontshrink[f];
if k<>0 then begin if maxshrinkratio<0 then maxshrinkratio:=-
pdffontexpandratio[k]else if maxshrinkratio<>-pdffontexpandratio[k]then
pdferror(1053,1261);end;checkexpandpars:=true;end;
function charstretch(f:internalfontnumber;c:eightbits):scaled;
var k:internalfontnumber;dw:scaled;ef:integer;begin charstretch:=0;
k:=pdffontstretch[f];ef:=getefcode(f,c);
if(k<>0)and(ef>0)then begin dw:=fontinfo[widthbase[k]+fontinfo[charbase[
k]+effectivechar(true,k,c)].qqqq.b0].int-fontinfo[widthbase[f]+fontinfo[
charbase[f]+effectivechar(true,f,c)].qqqq.b0].int;
if dw>0 then charstretch:=roundxnoverd(dw,ef,1000);end;end;
function charshrink(f:internalfontnumber;c:eightbits):scaled;
var k:internalfontnumber;dw:scaled;ef:integer;begin charshrink:=0;
k:=pdffontshrink[f];ef:=getefcode(f,c);
if(k<>0)and(ef>0)then begin dw:=fontinfo[widthbase[f]+fontinfo[charbase[
f]+effectivechar(true,f,c)].qqqq.b0].int-fontinfo[widthbase[k]+fontinfo[
charbase[k]+effectivechar(true,k,c)].qqqq.b0].int;
if dw>0 then charshrink:=roundxnoverd(dw,ef,1000);end;end;
function getkern(f:internalfontnumber;lc,rc:eightbits):scaled;label 22;
var i:fourquarters;j:fourquarters;k:fontindex;begin getkern:=0;
i:=fontinfo[charbase[f]+effectivechar(true,f,lc)].qqqq;
if((i.b2)mod 4)<>1 then goto 10;k:=ligkernbase[f]+i.b3;
j:=fontinfo[k].qqqq;if j.b0<=128 then goto 23;
k:=ligkernbase[f]+256*j.b2+j.b3+32768-256*(128);22:j:=fontinfo[k].qqqq;
23:if(j.b1=rc)and(j.b0<=128)and(j.b2>=128)then begin getkern:=fontinfo[
kernbase[f]+256*j.b2+j.b3].int;goto 10;end;
if j.b0=0 then incr(k)else begin if j.b0>=128 then goto 10;k:=k+j.b0+1;
end;goto 22;end;function kernstretch(p:halfword):scaled;
var l,r:halfword;d:scaled;begin kernstretch:=0;
if(prevcharp=-268435455)or(mem[prevcharp].hh.rh<>p)or(mem[p].hh.rh=
-268435455)then goto 10;l:=prevcharp;r:=mem[p].hh.rh;
if not(l>=himemmin)then if mem[l].hh.b0=6 then l:=l+1 else goto 10;
if not(r>=himemmin)then if mem[r].hh.b0=6 then r:=r+1 else goto 10;
if not((mem[l].hh.b0=mem[r].hh.b0)and(pdffontstretch[mem[l].hh.b0]<>0))
then goto 10;
d:=getkern(pdffontstretch[mem[l].hh.b0],mem[l].hh.b1,mem[r].hh.b1);
kernstretch:=roundxnoverd(d-mem[p+1].int,getefcode(mem[l].hh.b0,mem[l].
hh.b1),1000);end;function kernshrink(p:halfword):scaled;
var l,r:halfword;d:scaled;begin kernshrink:=0;
if(prevcharp=-268435455)or(mem[prevcharp].hh.rh<>p)or(mem[p].hh.rh=
-268435455)then goto 10;l:=prevcharp;r:=mem[p].hh.rh;
if not(l>=himemmin)then if mem[l].hh.b0=6 then l:=l+1 else goto 10;
if not(r>=himemmin)then if mem[r].hh.b0=6 then r:=r+1 else goto 10;
if not((mem[l].hh.b0=mem[r].hh.b0)and(pdffontshrink[mem[l].hh.b0]<>0))
then goto 10;
d:=getkern(pdffontshrink[mem[l].hh.b0],mem[l].hh.b1,mem[r].hh.b1);
kernshrink:=roundxnoverd(mem[p+1].int-d,getefcode(mem[l].hh.b0,mem[l].hh
.b1),1000);end;procedure dosubstfont(p:halfword;exratio:integer);
var f,k:internalfontnumber;r:halfword;ef:integer;
begin if not(p>=himemmin)and(mem[p].hh.b0=7)then begin r:=mem[p+1].hh.lh
;while r<>-268435455 do begin if(r>=himemmin)or(mem[r].hh.b0=6)then
dosubstfont(r,exratio);r:=mem[r].hh.rh;end;r:=mem[p+1].hh.rh;
while r<>-268435455 do begin if(r>=himemmin)or(mem[r].hh.b0=6)then
dosubstfont(r,exratio);r:=mem[r].hh.rh;end;goto 10;end;
if(p>=himemmin)then r:=p else if mem[p].hh.b0=6 then r:=p+1 else begin
pdferror(1053,1262);end;f:=mem[r].hh.b0;ef:=getefcode(f,mem[r].hh.b1);
if ef=0 then goto 10;
if(pdffontstretch[f]<>0)and(exratio>0)then k:=expandfont(f,extxnoverd(
exratio*ef,pdffontexpandratio[pdffontstretch[f]],1000000))else if(
pdffontshrink[f]<>0)and(exratio<0)then k:=expandfont(f,extxnoverd(
exratio*ef,-pdffontexpandratio[pdffontshrink[f]],1000000))else k:=f;
if k<>f then begin mem[r].hh.b0:=k;
if not(p>=himemmin)then begin r:=mem[p+1].hh.rh;
while r<>-268435455 do begin mem[r].hh.b0:=k;r:=mem[r].hh.rh;end;end;
end;end;function charpw(p:halfword;side:smallnumber):scaled;
var f:internalfontnumber;c:integer;begin charpw:=0;
if side=0 then lastleftmostchar:=-268435455 else lastrightmostchar:=
-268435455;if p=-268435455 then goto 10;
if not(p>=himemmin)then begin if mem[p].hh.b0=6 then p:=p+1 else goto 10
;end;f:=mem[p].hh.b0;if side=0 then begin c:=getlpcode(f,mem[p].hh.b1);
lastleftmostchar:=p;end else begin c:=getrpcode(f,mem[p].hh.b1);
lastrightmostchar:=p;end;if c=0 then goto 10;
charpw:=roundxnoverd(fontinfo[6+parambase[f]].int,c,1000);end;
function newmarginkern(w:scaled;p:halfword;side:smallnumber):halfword;
var k:halfword;begin k:=getnode(3);mem[k].hh.b0:=40;mem[k].hh.b1:=side;
mem[k+1].int:=w;if p=-268435455 then pdferror(1263,1264);
begin mem[k+2].hh.lh:=avail;
if mem[k+2].hh.lh=-268435455 then mem[k+2].hh.lh:=getavail else begin
avail:=mem[mem[k+2].hh.lh].hh.rh;mem[mem[k+2].hh.lh].hh.rh:=-268435455;
ifdef('STAT')incr(dynused);endif('STAT')end;end;
mem[mem[k+2].hh.lh].hh.b1:=mem[p].hh.b1;
mem[mem[k+2].hh.lh].hh.b0:=mem[p].hh.b0;newmarginkern:=k;end;
function hpack(p:halfword;w:scaled;m:smallnumber):halfword;
label 21,50,10;var r:halfword;q:halfword;h,d,x:scaled;s:scaled;
g:halfword;o:glueord;f:internalfontnumber;i:fourquarters;hd:eightbits;
fontstretch:scaled;fontshrink:scaled;k:scaled;begin lastbadness:=0;
r:=getnode(9);mem[r].hh.b0:=0;mem[r].hh.b1:=0;mem[r+4].int:=0;q:=r+5;
mem[q].hh.rh:=p;if m=2 then begin prevcharp:=-268435455;fontstretch:=0;
fontshrink:=0;fontexpandratio:=0;end;h:=0;{824:}d:=0;x:=0;
totalstretch[0]:=0;totalshrink[0]:=0;totalstretch[1]:=0;
totalshrink[1]:=0;totalstretch[2]:=0;totalshrink[2]:=0;
totalstretch[3]:=0;totalshrink[3]:=0{:824};
if(eqtb[29389].int>0)then{1710:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1710};
while p<>-268435455 do{825:}begin 21:while(p>=himemmin)do{828:}begin if
m>=2 then begin prevcharp:=p;case m of 2:begin f:=mem[p].hh.b0;
fontstretch:=fontstretch+charstretch(f,mem[p].hh.b1);
fontshrink:=fontshrink+charshrink(f,mem[p].hh.b1);end;
3:dosubstfont(p,fontexpandratio);end;end;f:=mem[p].hh.b0;
i:=fontinfo[charbase[f]+effectivechar(true,f,mem[p].hh.b1)].qqqq;
hd:=i.b1;x:=x+fontinfo[widthbase[f]+i.b0].int;
s:=fontinfo[heightbase[f]+(hd)div 16].int;if s>h then h:=s;
s:=fontinfo[depthbase[f]+(hd)mod 16].int;if s>d then d:=s;
p:=mem[p].hh.rh;end{:828};
if p<>-268435455 then begin case mem[p].hh.b0 of 0,1,2,13:{827:}begin x
:=x+mem[p+1].int;if mem[p].hh.b0>=2 then s:=0 else s:=mem[p+4].int;
if mem[p+3].int-s>h then h:=mem[p+3].int-s;
if mem[p+2].int+s>d then d:=mem[p+2].int+s;end{:827};
3,4,5:if(adjusttail<>-268435455)or(preadjusttail<>-268435455)then{831:}
begin while mem[q].hh.rh<>p do q:=mem[q].hh.rh;
if mem[p].hh.b0=5 then begin if mem[p].hh.b1<>0 then begin if
preadjusttail=-268435455 then confusion(1265);
mem[preadjusttail].hh.rh:=mem[p+1].int;
while mem[preadjusttail].hh.rh<>-268435455 do preadjusttail:=mem[
preadjusttail].hh.rh;
end else begin if adjusttail=-268435455 then confusion(1265);
mem[adjusttail].hh.rh:=mem[p+1].int;
while mem[adjusttail].hh.rh<>-268435455 do adjusttail:=mem[adjusttail].
hh.rh;end;p:=mem[p].hh.rh;freenode(mem[q].hh.rh,2);
end else begin mem[adjusttail].hh.rh:=p;adjusttail:=p;p:=mem[p].hh.rh;
end;mem[q].hh.rh:=p;p:=q;end{:831};
8:{1607:}if(mem[p].hh.b1=12)or(mem[p].hh.b1=14)then begin x:=x+mem[p+1].
int;s:=0;if mem[p+2].int-s>h then h:=mem[p+2].int-s;
if mem[p+3].int+s>d then d:=mem[p+3].int+s;end{:1607};
10:{832:}begin g:=mem[p+1].hh.lh;x:=x+mem[g+1].int;o:=mem[g].hh.b0;
totalstretch[o]:=totalstretch[o]+mem[g+2].int;o:=mem[g].hh.b1;
totalshrink[o]:=totalshrink[o]+mem[g+3].int;
if mem[p].hh.b1>=100 then begin g:=mem[p+1].hh.rh;
if mem[g+3].int>h then h:=mem[g+3].int;
if mem[g+2].int>d then d:=mem[g+2].int;end;end{:832};
40:begin if m=2 then begin f:=mem[mem[p+2].hh.lh].hh.b0;
dosubstfont(mem[p+2].hh.lh,1000);
if f<>mem[mem[p+2].hh.lh].hh.b0 then fontstretch:=fontstretch-mem[p+1].
int-charpw(mem[p+2].hh.lh,mem[p].hh.b1);mem[mem[p+2].hh.lh].hh.b0:=f;
dosubstfont(mem[p+2].hh.lh,-1000);
if f<>mem[mem[p+2].hh.lh].hh.b0 then fontshrink:=fontshrink-mem[p+1].int
-charpw(mem[p+2].hh.lh,mem[p].hh.b1);mem[mem[p+2].hh.lh].hh.b0:=f;
end else if m=3 then begin dosubstfont(mem[p+2].hh.lh,fontexpandratio);
mem[p+1].int:=-charpw(mem[p+2].hh.lh,mem[p].hh.b1);end;
x:=x+mem[p+1].int;end;
11:begin if mem[p].hh.b1=0 then begin if m=2 then begin fontstretch:=
fontstretch+kernstretch(p);fontshrink:=fontshrink+kernshrink(p);
end else if m=3 then begin if fontexpandratio>0 then k:=kernstretch(p)
else if fontexpandratio<0 then k:=kernshrink(p)else pdfassert(0);
if k<>0 then begin if(mem[p].hh.rh>=himemmin)then mem[p+1].int:=getkern(
mem[prevcharp].hh.b0,mem[prevcharp].hh.b1,mem[mem[p].hh.rh].hh.b1)else
if mem[mem[p].hh.rh].hh.b0=6 then mem[p+1].int:=getkern(mem[prevcharp].
hh.b0,mem[prevcharp].hh.b1,mem[mem[p].hh.rh+1].hh.b1);end;end;end;
x:=x+mem[p+1].int;end;9:begin x:=x+mem[p+1].int;
if(eqtb[29389].int>0)then{1711:}if odd(mem[p].hh.b1)then if mem[LRptr].
hh.lh=(4*(mem[p].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;
end else begin incr(LRproblems);mem[p].hh.b0:=11;mem[p].hh.b1:=1;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1711};end;
6:begin if m=3 then dosubstfont(p,fontexpandratio);
{826:}begin mem[memtop-12]:=mem[p+1];mem[memtop-12].hh.rh:=mem[p].hh.rh;
p:=memtop-12;goto 21;end{:826};end;
7:if m=3 then dosubstfont(p,fontexpandratio);others:end;p:=mem[p].hh.rh;
end;end{:825};
if adjusttail<>-268435455 then mem[adjusttail].hh.rh:=-268435455;
if preadjusttail<>-268435455 then mem[preadjusttail].hh.rh:=-268435455;
mem[r+3].int:=h;mem[r+2].int:=d;{833:}if m=1 then w:=x+w;
mem[r+1].int:=w;x:=w-x;if x=0 then begin mem[r+5].hh.b0:=0;
mem[r+5].hh.b1:=0;mem[r+6].gr:=0.0;goto 10;
end else if x>0 then{834:}begin{835:}if totalstretch[3]<>0 then o:=3
else if totalstretch[2]<>0 then o:=2 else if totalstretch[1]<>0 then o:=
1 else o:=0{:835};
if(m=2)and(o=0)and(fontstretch>0)then begin fontexpandratio:=
dividescaled(x,fontstretch,3);goto 10;end;mem[r+5].hh.b1:=o;
mem[r+5].hh.b0:=1;
if totalstretch[o]<>0 then mem[r+6].gr:=x/totalstretch[o]else begin mem[
r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if o=0 then if mem[r+5].hh.rh<>-268435455 then{836:}begin lastbadness:=
badness(x,totalstretch[0]);
if lastbadness>eqtb[29303].int then begin println;
if lastbadness>100 then printnl(1266)else printnl(1267);print(1268);
printint(lastbadness);goto 50;end;end{:836};goto 10;
end{:834}else{840:}begin{841:}if totalshrink[3]<>0 then o:=3 else if
totalshrink[2]<>0 then o:=2 else if totalshrink[1]<>0 then o:=1 else o:=
0{:841};
if(m=2)and(o=0)and(fontshrink>0)then begin fontexpandratio:=dividescaled
(x,fontshrink,3);goto 10;end;mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=2;
if totalshrink[o]<>0 then mem[r+6].gr:=(-x)/totalshrink[o]else begin mem
[r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if(totalshrink[o]<-x)and(o=0)and(mem[r+5].hh.rh<>-268435455)then begin
lastbadness:=1000000;mem[r+6].gr:=1.0;
{842:}if(-x-totalshrink[0]>eqtb[29911].int)or(eqtb[29303].int<100)then
begin if(eqtb[29919].int>0)and(-x-totalshrink[0]>eqtb[29911].int)then
begin while mem[q].hh.rh<>-268435455 do q:=mem[q].hh.rh;
mem[q].hh.rh:=newrule;mem[mem[q].hh.rh+1].int:=eqtb[29919].int;end;
println;printnl(1274);printscaled(-x-totalshrink[0]);print(1275);
goto 50;end{:842};
end else if o=0 then if mem[r+5].hh.rh<>-268435455 then{843:}begin
lastbadness:=badness(-x,totalshrink[0]);
if lastbadness>eqtb[29303].int then begin println;printnl(1276);
printint(lastbadness);goto 50;end;end{:843};goto 10;end{:840}{:833};
50:{839:}if outputactive then print(1269)else begin if packbeginline<>0
then begin if packbeginline>0 then print(1270)else print(1271);
printint(abs(packbeginline));print(1272);end else print(1273);
printint(line);end;println;fontinshortdisplay:=0;
shortdisplay(mem[r+5].hh.rh);println;begindiagnostic;showbox(r);
enddiagnostic(true){:839};
10:if(eqtb[29389].int>0)then{1712:}begin if mem[LRptr].hh.lh<>0 then
begin while mem[q].hh.rh<>-268435455 do q:=mem[q].hh.rh;
repeat tempptr:=q;q:=newmath(0,mem[LRptr].hh.lh);mem[tempptr].hh.rh:=q;
LRproblems:=LRproblems+10000;begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
until mem[LRptr].hh.lh=0;end;
if LRproblems>0 then begin{1713:}begin println;printnl(2053);
printint(LRproblems div 10000);print(2054);
printint(LRproblems mod 10000);print(2055);LRproblems:=0;end{:1713};
goto 50;end;begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if LRptr<>-268435455 then confusion(2052);end{:1712};
if(m=2)and(fontexpandratio<>0)then begin fontexpandratio:=fixint(
fontexpandratio,-1000,1000);q:=mem[r+5].hh.rh;freenode(r,9);
r:=hpack(q,w,3);end;hpack:=r;end;
{:823}{844:}function vpackage(p:halfword;h:scaled;m:smallnumber;
l:scaled):halfword;label 50,10;var r:halfword;w,d,x:scaled;s:scaled;
g:halfword;o:glueord;begin lastbadness:=0;r:=getnode(9);mem[r].hh.b0:=1;
mem[r].hh.b1:=0;mem[r+4].int:=0;mem[r+5].hh.rh:=p;w:=0;{824:}d:=0;x:=0;
totalstretch[0]:=0;totalshrink[0]:=0;totalstretch[1]:=0;
totalshrink[1]:=0;totalstretch[2]:=0;totalshrink[2]:=0;
totalstretch[3]:=0;totalshrink[3]:=0{:824};
while p<>-268435455 do{845:}begin if(p>=himemmin)then confusion(1277)
else case mem[p].hh.b0 of 0,1,2,13:{846:}begin x:=x+d+mem[p+3].int;
d:=mem[p+2].int;if mem[p].hh.b0>=2 then s:=0 else s:=mem[p+4].int;
if mem[p+1].int+s>w then w:=mem[p+1].int+s;end{:846};
8:{1606:}if(mem[p].hh.b1=12)or(mem[p].hh.b1=14)then begin x:=x+d+mem[p+2
].int;d:=mem[p+3].int;s:=0;if mem[p+1].int+s>w then w:=mem[p+1].int+s;
end{:1606};10:{847:}begin x:=x+d;d:=0;g:=mem[p+1].hh.lh;
x:=x+mem[g+1].int;o:=mem[g].hh.b0;
totalstretch[o]:=totalstretch[o]+mem[g+2].int;o:=mem[g].hh.b1;
totalshrink[o]:=totalshrink[o]+mem[g+3].int;
if mem[p].hh.b1>=100 then begin g:=mem[p+1].hh.rh;
if mem[g+1].int>w then w:=mem[g+1].int;end;end{:847};
11:begin x:=x+d+mem[p+1].int;d:=0;end;others:end;p:=mem[p].hh.rh;
end{:845};mem[r+1].int:=w;if d>l then begin x:=x+d-l;mem[r+2].int:=l;
end else mem[r+2].int:=d;{848:}if m=1 then h:=x+h;mem[r+3].int:=h;
x:=h-x;if x=0 then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;goto 10;
end else if x>0 then{849:}begin{835:}if totalstretch[3]<>0 then o:=3
else if totalstretch[2]<>0 then o:=2 else if totalstretch[1]<>0 then o:=
1 else o:=0{:835};mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=1;
if totalstretch[o]<>0 then mem[r+6].gr:=x/totalstretch[o]else begin mem[
r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if o=0 then if mem[r+5].hh.rh<>-268435455 then{850:}begin lastbadness:=
badness(x,totalstretch[0]);
if lastbadness>eqtb[29304].int then begin println;
if lastbadness>100 then printnl(1266)else printnl(1267);print(1278);
printint(lastbadness);goto 50;end;end{:850};goto 10;
end{:849}else{852:}begin{841:}if totalshrink[3]<>0 then o:=3 else if
totalshrink[2]<>0 then o:=2 else if totalshrink[1]<>0 then o:=1 else o:=
0{:841};mem[r+5].hh.b1:=o;mem[r+5].hh.b0:=2;
if totalshrink[o]<>0 then mem[r+6].gr:=(-x)/totalshrink[o]else begin mem
[r+5].hh.b0:=0;mem[r+6].gr:=0.0;end;
if(totalshrink[o]<-x)and(o=0)and(mem[r+5].hh.rh<>-268435455)then begin
lastbadness:=1000000;mem[r+6].gr:=1.0;
{853:}if(-x-totalshrink[0]>eqtb[29912].int)or(eqtb[29304].int<100)then
begin println;printnl(1279);printscaled(-x-totalshrink[0]);print(1280);
goto 50;end{:853};
end else if o=0 then if mem[r+5].hh.rh<>-268435455 then{854:}begin
lastbadness:=badness(-x,totalshrink[0]);
if lastbadness>eqtb[29304].int then begin println;printnl(1281);
printint(lastbadness);goto 50;end;end{:854};goto 10;end{:852}{:848};
50:{851:}if outputactive then print(1269)else begin if packbeginline<>0
then begin print(1271);printint(abs(packbeginline));print(1272);
end else print(1273);printint(line);println;end;begindiagnostic;
showbox(r);enddiagnostic(true){:851};10:vpackage:=r;end;
{:844}{855:}procedure appendtovlist(b:halfword);var d:scaled;p:halfword;
begin if curlist.auxfield.int>eqtb[29935].int then begin d:=mem[eqtb[
26629].hh.rh+1].int-curlist.auxfield.int-mem[b+3].int;
if d<eqtb[29905].int then p:=newparamglue(0)else begin p:=newskipparam(1
);mem[tempptr+1].int:=d;end;mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=p;end;mem[curlist.tailfield].hh.rh:=b;
curlist.tailfield:=b;curlist.auxfield.int:=mem[b+2].int;end;
{:855}{862:}function newnoad:halfword;var p:halfword;
begin p:=getnode(4);mem[p].hh.b0:=16;mem[p].hh.b1:=0;
mem[p+1].hh:=emptyfield;mem[p+3].hh:=emptyfield;mem[p+2].hh:=emptyfield;
newnoad:=p;end;{:862}{864:}function newstyle(s:smallnumber):halfword;
var p:halfword;begin p:=getnode(3);mem[p].hh.b0:=14;mem[p].hh.b1:=s;
mem[p+1].int:=0;mem[p+2].int:=0;newstyle:=p;end;
{:864}{865:}function newchoice:halfword;var p:halfword;
begin p:=getnode(3);mem[p].hh.b0:=15;mem[p].hh.b1:=0;
mem[p+1].hh.lh:=-268435455;mem[p+1].hh.rh:=-268435455;
mem[p+2].hh.lh:=-268435455;mem[p+2].hh.rh:=-268435455;newchoice:=p;end;
{:865}{869:}procedure showinfo;begin shownodelist(mem[tempptr].hh.lh);
end;{:869}{880:}function fractionrule(t:scaled):halfword;var p:halfword;
begin p:=newrule;mem[p+3].int:=t;mem[p+2].int:=0;fractionrule:=p;end;
{:880}{881:}function overbar(b:halfword;k,t:scaled):halfword;
var p,q:halfword;begin p:=newkern(k);mem[p].hh.rh:=b;q:=fractionrule(t);
mem[q].hh.rh:=p;p:=newkern(t);mem[p].hh.rh:=q;
overbar:=vpackage(p,0,1,1073741823);end;
{:881}{882:}{885:}function charbox(f:internalfontnumber;
c:quarterword):halfword;var q:fourquarters;hd:eightbits;b,p:halfword;
begin q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;hd:=q.b1;
b:=newnullbox;
mem[b+1].int:=fontinfo[widthbase[f]+q.b0].int+fontinfo[italicbase[f]+(q.
b2)div 4].int;mem[b+3].int:=fontinfo[heightbase[f]+(hd)div 16].int;
mem[b+2].int:=fontinfo[depthbase[f]+(hd)mod 16].int;p:=getavail;
mem[p].hh.b1:=c;mem[p].hh.b0:=f;mem[b+5].hh.rh:=p;charbox:=b;end;
{:885}{887:}procedure stackintobox(b:halfword;f:internalfontnumber;
c:quarterword);var p:halfword;begin p:=charbox(f,c);
mem[p].hh.rh:=mem[b+5].hh.rh;mem[b+5].hh.rh:=p;
mem[b+3].int:=mem[p+3].int;end;
{:887}{888:}function heightplusdepth(f:internalfontnumber;
c:quarterword):scaled;var q:fourquarters;hd:eightbits;
begin q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;hd:=q.b1;
heightplusdepth:=fontinfo[heightbase[f]+(hd)div 16].int+fontinfo[
depthbase[f]+(hd)mod 16].int;end;{:888}function vardelimiter(d:halfword;
s:smallnumber;v:scaled):halfword;label 40,22;var b:halfword;
f,g:internalfontnumber;c,x,y:quarterword;m,n:integer;u:scaled;w:scaled;
q:fourquarters;hd:eightbits;r:fourquarters;z:smallnumber;
largeattempt:boolean;begin f:=0;w:=0;largeattempt:=false;
z:=mem[d].qqqq.b0;x:=mem[d].qqqq.b1;
while true do begin{883:}if(z<>0)or(x<>0)then begin z:=z+s+16;
repeat z:=z-16;g:=eqtb[27693+z].hh.rh;if g<>0 then{884:}begin y:=x;
if(y>=fontbc[g])and(y<=fontec[g])then begin 22:q:=fontinfo[charbase[g]+y
].qqqq;if(q.b0>0)then begin if((q.b2)mod 4)=3 then begin f:=g;c:=y;
goto 40;end;hd:=q.b1;
u:=fontinfo[heightbase[g]+(hd)div 16].int+fontinfo[depthbase[g]+(hd)mod
16].int;if u>w then begin f:=g;c:=y;w:=u;if u>=v then goto 40;end;
if((q.b2)mod 4)=2 then begin y:=q.b3;goto 22;end;end;end;end{:884};
until z<16;end{:883};if largeattempt then goto 40;largeattempt:=true;
z:=mem[d].qqqq.b2;x:=mem[d].qqqq.b3;end;
40:if f<>0 then{886:}if((q.b2)mod 4)=3 then{889:}begin b:=newnullbox;
mem[b].hh.b0:=1;r:=fontinfo[extenbase[f]+q.b3].qqqq;{890:}c:=r.b3;
u:=heightplusdepth(f,c);w:=0;
q:=fontinfo[charbase[f]+effectivechar(true,f,c)].qqqq;
mem[b+1].int:=fontinfo[widthbase[f]+q.b0].int+fontinfo[italicbase[f]+(q.
b2)div 4].int;c:=r.b2;if c<>0 then w:=w+heightplusdepth(f,c);c:=r.b1;
if c<>0 then w:=w+heightplusdepth(f,c);c:=r.b0;
if c<>0 then w:=w+heightplusdepth(f,c);n:=0;
if u>0 then while w<v do begin w:=w+u;incr(n);if r.b1<>0 then w:=w+u;
end{:890};c:=r.b2;if c<>0 then stackintobox(b,f,c);c:=r.b3;
for m:=1 to n do stackintobox(b,f,c);c:=r.b1;
if c<>0 then begin stackintobox(b,f,c);c:=r.b3;
for m:=1 to n do stackintobox(b,f,c);end;c:=r.b0;
if c<>0 then stackintobox(b,f,c);mem[b+2].int:=w-mem[b+3].int;
end{:889}else b:=charbox(f,c){:886}else begin b:=newnullbox;
mem[b+1].int:=eqtb[29914].int;end;
mem[b+4].int:=half(mem[b+3].int-mem[b+2].int)-fontinfo[22+parambase[eqtb
[27695+s].hh.rh]].int;vardelimiter:=b;end;
{:882}{891:}function rebox(b:halfword;w:scaled):halfword;var p:halfword;
f:internalfontnumber;v:scaled;
begin if(mem[b+1].int<>w)and(mem[b+5].hh.rh<>-268435455)then begin if
mem[b].hh.b0=1 then b:=hpack(b,0,1);p:=mem[b+5].hh.rh;
if((p>=himemmin))and(mem[p].hh.rh=-268435455)then begin f:=mem[p].hh.b0;
v:=fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true,f,mem[p
].hh.b1)].qqqq.b0].int;
if v<>mem[b+1].int then mem[p].hh.rh:=newkern(mem[b+1].int-v);end;
freenode(b,9);b:=newglue(membot+12);mem[b].hh.rh:=p;
while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;
mem[p].hh.rh:=newglue(membot+12);rebox:=hpack(b,w,0);
end else begin mem[b+1].int:=w;rebox:=b;end;end;
{:891}{892:}function mathglue(g:halfword;m:scaled):halfword;
var p:halfword;n:integer;f:scaled;begin n:=xovern(m,65536);
f:=texremainder;if f<0 then begin decr(n);f:=f+65536;end;p:=getnode(4);
mem[p+1].int:=multandadd(n,mem[g+1].int,xnoverd(mem[g+1].int,f,65536),
1073741823);mem[p].hh.b0:=mem[g].hh.b0;
if mem[p].hh.b0=0 then mem[p+2].int:=multandadd(n,mem[g+2].int,xnoverd(
mem[g+2].int,f,65536),1073741823)else mem[p+2].int:=mem[g+2].int;
mem[p].hh.b1:=mem[g].hh.b1;
if mem[p].hh.b1=0 then mem[p+3].int:=multandadd(n,mem[g+3].int,xnoverd(
mem[g+3].int,f,65536),1073741823)else mem[p+3].int:=mem[g+3].int;
mathglue:=p;end;{:892}{893:}procedure mathkern(p:halfword;m:scaled);
var n:integer;f:scaled;
begin if mem[p].hh.b1=99 then begin n:=xovern(m,65536);f:=texremainder;
if f<0 then begin decr(n);f:=f+65536;end;
mem[p+1].int:=multandadd(n,mem[p+1].int,xnoverd(mem[p+1].int,f,65536),
1073741823);mem[p].hh.b1:=1;end;end;{:893}{894:}procedure flushmath;
begin flushnodelist(mem[curlist.headfield].hh.rh);
flushnodelist(curlist.auxfield.int);
mem[curlist.headfield].hh.rh:=-268435455;
curlist.tailfield:=curlist.headfield;curlist.auxfield.int:=-268435455;
end;{:894}{896:}procedure mlisttohlist;forward;
function cleanbox(p:halfword;s:smallnumber):halfword;label 40;
var q:halfword;savestyle:smallnumber;x:halfword;r:halfword;
begin case mem[p].hh.rh of 1:begin curmlist:=newnoad;
mem[curmlist+1]:=mem[p];end;2:begin q:=mem[p].hh.lh;goto 40;end;
3:curmlist:=mem[p].hh.lh;others:begin q:=newnullbox;goto 40;end end;
savestyle:=curstyle;curstyle:=s;mlistpenalties:=false;mlisttohlist;
q:=mem[memtop-3].hh.rh;curstyle:=savestyle;
{879:}begin if curstyle<4 then cursize:=0 else cursize:=16*((curstyle-2)
div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[27695+cursize].hh.rh]].int,18);
end{:879};
40:if(q>=himemmin)or(q=-268435455)then x:=hpack(q,0,1)else if(mem[q].hh.
rh=-268435455)and(mem[q].hh.b0<=1)and(mem[q+4].int=0)then x:=q else x:=
hpack(q,0,1);{897:}q:=mem[x+5].hh.rh;
if(q>=himemmin)then begin r:=mem[q].hh.rh;
if r<>-268435455 then if mem[r].hh.rh=-268435455 then if not(r>=himemmin
)then if mem[r].hh.b0=11 then begin freenode(r,4);
mem[q].hh.rh:=-268435455;end;end{:897};cleanbox:=x;end;
{:896}{898:}procedure fetch(a:halfword);begin curc:=mem[a].hh.b1;
curf:=eqtb[27693+mem[a].hh.b0+cursize].hh.rh;
if curf=0 then{899:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(345);
end;printsize(cursize);printchar(32);printint(mem[a].hh.b0);print(1307);
print(curc);printchar(41);begin helpptr:=4;helpline[3]:=1308;
helpline[2]:=1309;helpline[1]:=1310;helpline[0]:=1311;end;error;
curi:=nullcharacter;mem[a].hh.rh:=0;
end{:899}else begin if(curc>=fontbc[curf])and(curc<=fontec[curf])then
curi:=fontinfo[charbase[curf]+curc].qqqq else curi:=nullcharacter;
if not((curi.b0>0))then begin charwarning(curf,curc);mem[a].hh.rh:=0;
curi:=nullcharacter;end;end;end;
{:898}{902:}{910:}procedure makeover(q:halfword);
begin mem[q+1].hh.lh:=overbar(cleanbox(q+1,2*(curstyle div 2)+1),3*
fontinfo[8+parambase[eqtb[27696+cursize].hh.rh]].int,fontinfo[8+
parambase[eqtb[27696+cursize].hh.rh]].int);mem[q+1].hh.rh:=2;end;
{:910}{911:}procedure makeunder(q:halfword);var p,x,y:halfword;
delta:scaled;begin x:=cleanbox(q+1,curstyle);
p:=newkern(3*fontinfo[8+parambase[eqtb[27696+cursize].hh.rh]].int);
mem[x].hh.rh:=p;
mem[p].hh.rh:=fractionrule(fontinfo[8+parambase[eqtb[27696+cursize].hh.
rh]].int);y:=vpackage(x,0,1,1073741823);
delta:=mem[y+3].int+mem[y+2].int+fontinfo[8+parambase[eqtb[27696+cursize
].hh.rh]].int;mem[y+3].int:=mem[x+3].int;
mem[y+2].int:=delta-mem[y+3].int;mem[q+1].hh.lh:=y;mem[q+1].hh.rh:=2;
end;{:911}{912:}procedure makevcenter(q:halfword);var v:halfword;
delta:scaled;begin v:=mem[q+1].hh.lh;
if mem[v].hh.b0<>1 then confusion(628);delta:=mem[v+3].int+mem[v+2].int;
mem[v+3].int:=fontinfo[22+parambase[eqtb[27695+cursize].hh.rh]].int+half
(delta);mem[v+2].int:=delta-mem[v+3].int;end;
{:912}{913:}procedure makeradical(q:halfword);var x,y:halfword;
delta,clr:scaled;begin x:=cleanbox(q+1,2*(curstyle div 2)+1);
if curstyle<2 then clr:=fontinfo[8+parambase[eqtb[27696+cursize].hh.rh]]
.int+(abs(fontinfo[5+parambase[eqtb[27695+cursize].hh.rh]].int)div 4)
else begin clr:=fontinfo[8+parambase[eqtb[27696+cursize].hh.rh]].int;
clr:=clr+(abs(clr)div 4);end;
y:=vardelimiter(q+4,cursize,mem[x+3].int+mem[x+2].int+clr+fontinfo[8+
parambase[eqtb[27696+cursize].hh.rh]].int);
delta:=mem[y+2].int-(mem[x+3].int+mem[x+2].int+clr);
if delta>0 then clr:=clr+half(delta);mem[y+4].int:=-(mem[x+3].int+clr);
mem[y].hh.rh:=overbar(x,clr,mem[y+3].int);mem[q+1].hh.lh:=hpack(y,0,1);
mem[q+1].hh.rh:=2;end;{:913}{914:}procedure makemathaccent(q:halfword);
label 30,31;var p,x,y:halfword;a:integer;c:quarterword;
f:internalfontnumber;i:fourquarters;s:scaled;h:scaled;delta:scaled;
w:scaled;begin fetch(q+4);if(curi.b0>0)then begin i:=curi;c:=curc;
f:=curf;{917:}s:=0;if mem[q+1].hh.rh=1 then begin fetch(q+1);
if((curi.b2)mod 4)=1 then begin a:=ligkernbase[curf]+curi.b3;
curi:=fontinfo[a].qqqq;
if curi.b0>128 then begin a:=ligkernbase[curf]+256*curi.b2+curi.b3
+32768-256*(128);curi:=fontinfo[a].qqqq;end;
while true do begin if curi.b1=skewchar[curf]then begin if curi.b2>=128
then if curi.b0<=128 then s:=fontinfo[kernbase[curf]+256*curi.b2+curi.b3
].int;goto 31;end;if curi.b0>=128 then goto 31;a:=a+curi.b0+1;
curi:=fontinfo[a].qqqq;end;end;end;31:{:917};
x:=cleanbox(q+1,2*(curstyle div 2)+1);w:=mem[x+1].int;h:=mem[x+3].int;
{916:}while true do begin if((i.b2)mod 4)<>2 then goto 30;y:=i.b3;
i:=fontinfo[charbase[f]+y].qqqq;if not(i.b0>0)then goto 30;
if fontinfo[widthbase[f]+i.b0].int>w then goto 30;c:=y;end;30:{:916};
if h<fontinfo[5+parambase[f]].int then delta:=h else delta:=fontinfo[5+
parambase[f]].int;
if(mem[q+2].hh.rh<>0)or(mem[q+3].hh.rh<>0)then if mem[q+1].hh.rh=1 then
{918:}begin flushnodelist(x);x:=newnoad;mem[x+1]:=mem[q+1];
mem[x+2]:=mem[q+2];mem[x+3]:=mem[q+3];mem[q+2].hh:=emptyfield;
mem[q+3].hh:=emptyfield;mem[q+1].hh.rh:=3;mem[q+1].hh.lh:=x;
x:=cleanbox(q+1,curstyle);delta:=delta+mem[x+3].int-h;h:=mem[x+3].int;
end{:918};y:=charbox(f,c);mem[y+4].int:=s+half(w-mem[y+1].int);
mem[y+1].int:=0;p:=newkern(-delta);mem[p].hh.rh:=x;mem[y].hh.rh:=p;
y:=vpackage(y,0,1,1073741823);mem[y+1].int:=mem[x+1].int;
if mem[y+3].int<h then{915:}begin p:=newkern(h-mem[y+3].int);
mem[p].hh.rh:=mem[y+5].hh.rh;mem[y+5].hh.rh:=p;mem[y+3].int:=h;
end{:915};mem[q+1].hh.lh:=y;mem[q+1].hh.rh:=2;end;end;
{:914}{919:}procedure makefraction(q:halfword);var p,v,x,y,z:halfword;
delta,delta1,delta2,shiftup,shiftdown,clr:scaled;
begin if mem[q+1].int=1073741824 then mem[q+1].int:=fontinfo[8+parambase
[eqtb[27696+cursize].hh.rh]].int;
{920:}x:=cleanbox(q+2,curstyle+2-2*(curstyle div 6));
z:=cleanbox(q+3,2*(curstyle div 2)+3-2*(curstyle div 6));
if mem[x+1].int<mem[z+1].int then x:=rebox(x,mem[z+1].int)else z:=rebox(
z,mem[x+1].int);
if curstyle<2 then begin shiftup:=fontinfo[8+parambase[eqtb[27695+
cursize].hh.rh]].int;
shiftdown:=fontinfo[11+parambase[eqtb[27695+cursize].hh.rh]].int;
end else begin shiftdown:=fontinfo[12+parambase[eqtb[27695+cursize].hh.
rh]].int;
if mem[q+1].int<>0 then shiftup:=fontinfo[9+parambase[eqtb[27695+cursize
].hh.rh]].int else shiftup:=fontinfo[10+parambase[eqtb[27695+cursize].hh
.rh]].int;end{:920};
if mem[q+1].int=0 then{921:}begin if curstyle<2 then clr:=7*fontinfo[8+
parambase[eqtb[27696+cursize].hh.rh]].int else clr:=3*fontinfo[8+
parambase[eqtb[27696+cursize].hh.rh]].int;
delta:=half(clr-((shiftup-mem[x+2].int)-(mem[z+3].int-shiftdown)));
if delta>0 then begin shiftup:=shiftup+delta;shiftdown:=shiftdown+delta;
end;
end{:921}else{922:}begin if curstyle<2 then clr:=3*mem[q+1].int else clr
:=mem[q+1].int;delta:=half(mem[q+1].int);
delta1:=clr-((shiftup-mem[x+2].int)-(fontinfo[22+parambase[eqtb[27695+
cursize].hh.rh]].int+delta));
delta2:=clr-((fontinfo[22+parambase[eqtb[27695+cursize].hh.rh]].int-
delta)-(mem[z+3].int-shiftdown));
if delta1>0 then shiftup:=shiftup+delta1;
if delta2>0 then shiftdown:=shiftdown+delta2;end{:922};
{923:}v:=newnullbox;mem[v].hh.b0:=1;mem[v+3].int:=shiftup+mem[x+3].int;
mem[v+2].int:=mem[z+2].int+shiftdown;mem[v+1].int:=mem[x+1].int;
if mem[q+1].int=0 then begin p:=newkern((shiftup-mem[x+2].int)-(mem[z+3]
.int-shiftdown));mem[p].hh.rh:=z;
end else begin y:=fractionrule(mem[q+1].int);
p:=newkern((fontinfo[22+parambase[eqtb[27695+cursize].hh.rh]].int-delta)
-(mem[z+3].int-shiftdown));mem[y].hh.rh:=p;mem[p].hh.rh:=z;
p:=newkern((shiftup-mem[x+2].int)-(fontinfo[22+parambase[eqtb[27695+
cursize].hh.rh]].int+delta));mem[p].hh.rh:=y;end;mem[x].hh.rh:=p;
mem[v+5].hh.rh:=x{:923};
{924:}if curstyle<2 then delta:=fontinfo[20+parambase[eqtb[27695+cursize
].hh.rh]].int else delta:=fontinfo[21+parambase[eqtb[27695+cursize].hh.
rh]].int;x:=vardelimiter(q+4,cursize,delta);mem[x].hh.rh:=v;
z:=vardelimiter(q+5,cursize,delta);mem[v].hh.rh:=z;
mem[q+1].int:=hpack(x,0,1){:924};end;
{:919}{925:}function makeop(q:halfword):scaled;var delta:scaled;
p,v,x,y,z:halfword;c:quarterword;i:fourquarters;
shiftup,shiftdown:scaled;
begin if(mem[q].hh.b1=0)and(curstyle<2)then mem[q].hh.b1:=1;
if mem[q+1].hh.rh=1 then begin fetch(q+1);
if(curstyle<2)and(((curi.b2)mod 4)=2)then begin c:=curi.b3;
i:=fontinfo[charbase[curf]+c].qqqq;if(i.b0>0)then begin curc:=c;curi:=i;
mem[q+1].hh.b1:=c;end;end;
delta:=fontinfo[italicbase[curf]+(curi.b2)div 4].int;
x:=cleanbox(q+1,curstyle);
if(mem[q+3].hh.rh<>0)and(mem[q].hh.b1<>1)then mem[x+1].int:=mem[x+1].int
-delta;
mem[x+4].int:=half(mem[x+3].int-mem[x+2].int)-fontinfo[22+parambase[eqtb
[27695+cursize].hh.rh]].int;mem[q+1].hh.rh:=2;mem[q+1].hh.lh:=x;
end else delta:=0;
if mem[q].hh.b1=1 then{926:}begin x:=cleanbox(q+2,2*(curstyle div 4)+4+(
curstyle mod 2));y:=cleanbox(q+1,curstyle);
z:=cleanbox(q+3,2*(curstyle div 4)+5);v:=newnullbox;mem[v].hh.b0:=1;
mem[v+1].int:=mem[y+1].int;
if mem[x+1].int>mem[v+1].int then mem[v+1].int:=mem[x+1].int;
if mem[z+1].int>mem[v+1].int then mem[v+1].int:=mem[z+1].int;
x:=rebox(x,mem[v+1].int);y:=rebox(y,mem[v+1].int);
z:=rebox(z,mem[v+1].int);mem[x+4].int:=half(delta);
mem[z+4].int:=-mem[x+4].int;mem[v+3].int:=mem[y+3].int;
mem[v+2].int:=mem[y+2].int;
{927:}if mem[q+2].hh.rh=0 then begin freenode(x,9);mem[v+5].hh.rh:=y;
end else begin shiftup:=fontinfo[11+parambase[eqtb[27696+cursize].hh.rh]
].int-mem[x+2].int;
if shiftup<fontinfo[9+parambase[eqtb[27696+cursize].hh.rh]].int then
shiftup:=fontinfo[9+parambase[eqtb[27696+cursize].hh.rh]].int;
p:=newkern(shiftup);mem[p].hh.rh:=y;mem[x].hh.rh:=p;
p:=newkern(fontinfo[13+parambase[eqtb[27696+cursize].hh.rh]].int);
mem[p].hh.rh:=x;mem[v+5].hh.rh:=p;
mem[v+3].int:=mem[v+3].int+fontinfo[13+parambase[eqtb[27696+cursize].hh.
rh]].int+mem[x+3].int+mem[x+2].int+shiftup;end;
if mem[q+3].hh.rh=0 then freenode(z,9)else begin shiftdown:=fontinfo[12+
parambase[eqtb[27696+cursize].hh.rh]].int-mem[z+3].int;
if shiftdown<fontinfo[10+parambase[eqtb[27696+cursize].hh.rh]].int then
shiftdown:=fontinfo[10+parambase[eqtb[27696+cursize].hh.rh]].int;
p:=newkern(shiftdown);mem[y].hh.rh:=p;mem[p].hh.rh:=z;
p:=newkern(fontinfo[13+parambase[eqtb[27696+cursize].hh.rh]].int);
mem[z].hh.rh:=p;
mem[v+2].int:=mem[v+2].int+fontinfo[13+parambase[eqtb[27696+cursize].hh.
rh]].int+mem[z+3].int+mem[z+2].int+shiftdown;end{:927};mem[q+1].int:=v;
end{:926};makeop:=delta;end;{:925}{928:}procedure makeord(q:halfword);
label 20,10;var a:integer;p,r:halfword;
begin 20:if mem[q+3].hh.rh=0 then if mem[q+2].hh.rh=0 then if mem[q+1].
hh.rh=1 then begin p:=mem[q].hh.rh;
if p<>-268435455 then if(mem[p].hh.b0>=16)and(mem[p].hh.b0<=22)then if
mem[p+1].hh.rh=1 then if mem[p+1].hh.b0=mem[q+1].hh.b0 then begin mem[q
+1].hh.rh:=4;fetch(q+1);
if((curi.b2)mod 4)=1 then begin a:=ligkernbase[curf]+curi.b3;
curc:=mem[p+1].hh.b1;curi:=fontinfo[a].qqqq;
if curi.b0>128 then begin a:=ligkernbase[curf]+256*curi.b2+curi.b3
+32768-256*(128);curi:=fontinfo[a].qqqq;end;
while true do begin{929:}if curi.b1=curc then if curi.b0<=128 then if
curi.b2>=128 then begin p:=newkern(fontinfo[kernbase[curf]+256*curi.b2+
curi.b3].int);mem[p].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=p;goto 10;
end else begin begin if interrupt<>0 then pauseforinstructions;end;
case curi.b2 of 1,5:mem[q+1].hh.b1:=curi.b3;2,6:mem[p+1].hh.b1:=curi.b3;
3,7,11:begin r:=newnoad;mem[r+1].hh.b1:=curi.b3;
mem[r+1].hh.b0:=mem[q+1].hh.b0;mem[q].hh.rh:=r;mem[r].hh.rh:=p;
if curi.b2<11 then mem[r+1].hh.rh:=1 else mem[r+1].hh.rh:=4;end;
others:begin mem[q].hh.rh:=mem[p].hh.rh;mem[q+1].hh.b1:=curi.b3;
mem[q+3]:=mem[p+3];mem[q+2]:=mem[p+2];freenode(p,4);end end;
if curi.b2>3 then goto 10;mem[q+1].hh.rh:=1;goto 20;end{:929};
if curi.b0>=128 then goto 10;a:=a+curi.b0+1;curi:=fontinfo[a].qqqq;end;
end;end;end;10:end;{:928}{932:}procedure makescripts(q:halfword;
delta:scaled);var p,x,y,z:halfword;shiftup,shiftdown,clr:scaled;
t:smallnumber;begin p:=mem[q+1].int;
if(p>=himemmin)then begin shiftup:=0;shiftdown:=0;
end else begin z:=hpack(p,0,1);if curstyle<4 then t:=16 else t:=32;
shiftup:=mem[z+3].int-fontinfo[18+parambase[eqtb[27695+t].hh.rh]].int;
shiftdown:=mem[z+2].int+fontinfo[19+parambase[eqtb[27695+t].hh.rh]].int;
freenode(z,9);end;
if mem[q+2].hh.rh=0 then{933:}begin x:=cleanbox(q+3,2*(curstyle div 4)+5
);mem[x+1].int:=mem[x+1].int+eqtb[29915].int;
if shiftdown<fontinfo[16+parambase[eqtb[27695+cursize].hh.rh]].int then
shiftdown:=fontinfo[16+parambase[eqtb[27695+cursize].hh.rh]].int;
clr:=mem[x+3].int-(abs(fontinfo[5+parambase[eqtb[27695+cursize].hh.rh]].
int*4)div 5);if shiftdown<clr then shiftdown:=clr;
mem[x+4].int:=shiftdown;
end{:933}else begin{934:}begin x:=cleanbox(q+2,2*(curstyle div 4)+4+(
curstyle mod 2));mem[x+1].int:=mem[x+1].int+eqtb[29915].int;
if odd(curstyle)then clr:=fontinfo[15+parambase[eqtb[27695+cursize].hh.
rh]].int else if curstyle<2 then clr:=fontinfo[13+parambase[eqtb[27695+
cursize].hh.rh]].int else clr:=fontinfo[14+parambase[eqtb[27695+cursize]
.hh.rh]].int;if shiftup<clr then shiftup:=clr;
clr:=mem[x+2].int+(abs(fontinfo[5+parambase[eqtb[27695+cursize].hh.rh]].
int)div 4);if shiftup<clr then shiftup:=clr;end{:934};
if mem[q+3].hh.rh=0 then mem[x+4].int:=-shiftup else{935:}begin y:=
cleanbox(q+3,2*(curstyle div 4)+5);
mem[y+1].int:=mem[y+1].int+eqtb[29915].int;
if shiftdown<fontinfo[17+parambase[eqtb[27695+cursize].hh.rh]].int then
shiftdown:=fontinfo[17+parambase[eqtb[27695+cursize].hh.rh]].int;
clr:=4*fontinfo[8+parambase[eqtb[27696+cursize].hh.rh]].int-((shiftup-
mem[x+2].int)-(mem[y+3].int-shiftdown));
if clr>0 then begin shiftdown:=shiftdown+clr;
clr:=(abs(fontinfo[5+parambase[eqtb[27695+cursize].hh.rh]].int*4)div 5)-
(shiftup-mem[x+2].int);if clr>0 then begin shiftup:=shiftup+clr;
shiftdown:=shiftdown-clr;end;end;mem[x+4].int:=delta;
p:=newkern((shiftup-mem[x+2].int)-(mem[y+3].int-shiftdown));
mem[x].hh.rh:=p;mem[p].hh.rh:=y;x:=vpackage(x,0,1,1073741823);
mem[x+4].int:=shiftdown;end{:935};end;
if mem[q+1].int=-268435455 then mem[q+1].int:=x else begin p:=mem[q+1].
int;while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;mem[p].hh.rh:=x;
end;end;{:932}{938:}function makeleftright(q:halfword;style:smallnumber;
maxd,maxh:scaled):smallnumber;var delta,delta1,delta2:scaled;
begin curstyle:=style;
{879:}begin if curstyle<4 then cursize:=0 else cursize:=16*((curstyle-2)
div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[27695+cursize].hh.rh]].int,18);
end{:879};
delta2:=maxd+fontinfo[22+parambase[eqtb[27695+cursize].hh.rh]].int;
delta1:=maxh+maxd-delta2;if delta2>delta1 then delta1:=delta2;
delta:=(delta1 div 500)*eqtb[29295].int;
delta2:=delta1+delta1-eqtb[29913].int;
if delta<delta2 then delta:=delta2;
mem[q+1].int:=vardelimiter(q+1,cursize,delta);
makeleftright:=mem[q].hh.b0-(10);end;{:938}procedure mlisttohlist;
label 21,82,80,81,83,30;var mlist:halfword;penalties:boolean;
style:smallnumber;savestyle:smallnumber;q:halfword;r:halfword;
rtype:smallnumber;t:smallnumber;p,x,y,z:halfword;pen:integer;
s:smallnumber;maxh,maxd:scaled;delta:scaled;begin mlist:=curmlist;
penalties:=mlistpenalties;style:=curstyle;q:=mlist;r:=-268435455;
rtype:=17;maxh:=0;maxd:=0;
{879:}begin if curstyle<4 then cursize:=0 else cursize:=16*((curstyle-2)
div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[27695+cursize].hh.rh]].int,18);
end{:879};while q<>-268435455 do{903:}begin{904:}21:delta:=0;
case mem[q].hh.b0 of 18:case rtype of 18,17,19,20,22,30:begin mem[q].hh.
b0:=16;goto 21;end;others:end;
19,21,22,31:begin{905:}if rtype=18 then mem[r].hh.b0:=16{:905};
if mem[q].hh.b0=31 then goto 80;end;{909:}30:goto 80;
25:begin makefraction(q);goto 82;end;17:begin delta:=makeop(q);
if mem[q].hh.b1=1 then goto 82;end;16:makeord(q);20,23:;
24:makeradical(q);27:makeover(q);26:makeunder(q);28:makemathaccent(q);
29:makevcenter(q);{:909}{906:}14:begin curstyle:=mem[q].hh.b1;
{879:}begin if curstyle<4 then cursize:=0 else cursize:=16*((curstyle-2)
div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[27695+cursize].hh.rh]].int,18);
end{:879};goto 81;end;
15:{907:}begin case curstyle div 2 of 0:begin p:=mem[q+1].hh.lh;
mem[q+1].hh.lh:=-268435455;end;1:begin p:=mem[q+1].hh.rh;
mem[q+1].hh.rh:=-268435455;end;2:begin p:=mem[q+2].hh.lh;
mem[q+2].hh.lh:=-268435455;end;3:begin p:=mem[q+2].hh.rh;
mem[q+2].hh.rh:=-268435455;end;end;flushnodelist(mem[q+1].hh.lh);
flushnodelist(mem[q+1].hh.rh);flushnodelist(mem[q+2].hh.lh);
flushnodelist(mem[q+2].hh.rh);mem[q].hh.b0:=14;mem[q].hh.b1:=curstyle;
mem[q+1].int:=0;mem[q+2].int:=0;
if p<>-268435455 then begin z:=mem[q].hh.rh;mem[q].hh.rh:=p;
while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;mem[p].hh.rh:=z;end;
goto 81;end{:907};3,4,5,8,12,7:goto 81;
2:begin if mem[q+3].int>maxh then maxh:=mem[q+3].int;
if mem[q+2].int>maxd then maxd:=mem[q+2].int;goto 81;end;
10:begin{908:}if mem[q].hh.b1=99 then begin x:=mem[q+1].hh.lh;
y:=mathglue(x,curmu);deleteglueref(x);mem[q+1].hh.lh:=y;mem[q].hh.b1:=0;
end else if(cursize<>0)and(mem[q].hh.b1=98)then begin p:=mem[q].hh.rh;
if p<>-268435455 then if(mem[p].hh.b0=10)or(mem[p].hh.b0=11)then begin
mem[q].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=-268435455;flushnodelist(p);
end;end{:908};goto 81;end;11:begin mathkern(q,curmu);goto 81;end;
{:906}others:confusion(1312)end;
{930:}case mem[q+1].hh.rh of 1,4:{931:}begin fetch(q+1);
if(curi.b0>0)then begin delta:=fontinfo[italicbase[curf]+(curi.b2)div 4]
.int;p:=newcharacter(curf,curc);
if(mem[q+1].hh.rh=4)and(fontinfo[2+parambase[curf]].int<>0)then delta:=0
;
if(mem[q+3].hh.rh=0)and(delta<>0)then begin mem[p].hh.rh:=newkern(delta)
;delta:=0;end;end else p:=-268435455;end{:931};0:p:=-268435455;
2:p:=mem[q+1].hh.lh;3:begin curmlist:=mem[q+1].hh.lh;
savestyle:=curstyle;mlistpenalties:=false;mlisttohlist;
curstyle:=savestyle;
{879:}begin if curstyle<4 then cursize:=0 else cursize:=16*((curstyle-2)
div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[27695+cursize].hh.rh]].int,18);
end{:879};p:=hpack(mem[memtop-3].hh.rh,0,1);end;
others:confusion(1313)end;mem[q+1].int:=p;
if(mem[q+3].hh.rh=0)and(mem[q+2].hh.rh=0)then goto 82;
makescripts(q,delta){:930}{:904};82:z:=hpack(mem[q+1].int,0,1);
if mem[z+3].int>maxh then maxh:=mem[z+3].int;
if mem[z+2].int>maxd then maxd:=mem[z+2].int;freenode(z,9);80:r:=q;
rtype:=mem[r].hh.b0;if rtype=31 then begin rtype:=30;curstyle:=style;
{879:}begin if curstyle<4 then cursize:=0 else cursize:=16*((curstyle-2)
div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[27695+cursize].hh.rh]].int,18);
end{:879};end;81:q:=mem[q].hh.rh;end{:903};
{905:}if rtype=18 then mem[r].hh.b0:=16{:905};{936:}p:=memtop-3;
mem[p].hh.rh:=-268435455;q:=mlist;rtype:=0;curstyle:=style;
{879:}begin if curstyle<4 then cursize:=0 else cursize:=16*((curstyle-2)
div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[27695+cursize].hh.rh]].int,18);
end{:879};while q<>-268435455 do begin{937:}t:=16;s:=4;pen:=10000;
case mem[q].hh.b0 of 17,20,21,22,23:t:=mem[q].hh.b0;18:begin t:=18;
pen:=eqtb[29286].int;end;19:begin t:=19;pen:=eqtb[29287].int;end;
16,29,27,26:;24:s:=5;28:s:=5;25:s:=6;
30,31:t:=makeleftright(q,style,maxd,maxh);
14:{939:}begin curstyle:=mem[q].hh.b1;s:=3;
{879:}begin if curstyle<4 then cursize:=0 else cursize:=16*((curstyle-2)
div 2);
curmu:=xovern(fontinfo[6+parambase[eqtb[27695+cursize].hh.rh]].int,18);
end{:879};goto 83;end{:939};8,12,2,7,5,3,4,10,11:begin mem[p].hh.rh:=q;
p:=q;q:=mem[q].hh.rh;mem[p].hh.rh:=-268435455;goto 30;end;
others:confusion(1314)end{:937};
{942:}if rtype>0 then begin case strpool[rtype*8+t+magicoffset]of 48:x:=
0;49:if curstyle<4 then x:=15 else x:=0;50:x:=15;
51:if curstyle<4 then x:=16 else x:=0;
52:if curstyle<4 then x:=17 else x:=0;others:confusion(1316)end;
if x<>0 then begin y:=mathglue(eqtb[26628+x].hh.rh,curmu);z:=newglue(y);
mem[y].hh.rh:=-268435455;mem[p].hh.rh:=z;p:=z;mem[z].hh.b1:=x+1;end;
end{:942};
{943:}if mem[q+1].int<>-268435455 then begin mem[p].hh.rh:=mem[q+1].int;
repeat p:=mem[p].hh.rh;until mem[p].hh.rh=-268435455;end;
if penalties then if mem[q].hh.rh<>-268435455 then if pen<10000 then
begin rtype:=mem[mem[q].hh.rh].hh.b0;
if rtype<>12 then if rtype<>19 then begin z:=newpenalty(pen);
mem[p].hh.rh:=z;p:=z;end;end{:943};if mem[q].hh.b0=31 then t:=20;
rtype:=t;83:r:=q;q:=mem[q].hh.rh;freenode(r,s);30:end{:936};end;
{:902}{948:}procedure pushalignment;var p:halfword;begin p:=getnode(6);
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
{:948}{950:}{958:}procedure getpreambletoken;label 20;begin 20:gettoken;
while(curchr=256)and(curcmd=4)do begin gettoken;
if curcmd>103 then begin expand;gettoken;end;end;
if curcmd=9 then fatalerror(689);
if(curcmd=75)and(curchr=26639)then begin scanoptionalequals;scanglue(2);
if eqtb[29320].int>0 then geqdefine(26639,120,curval)else eqdefine(26639
,120,curval);goto 20;end;end;{:958}procedure alignpeek;forward;
procedure normalparagraph;forward;procedure initalign;label 30,31,32,22;
var savecsptr:halfword;p:halfword;begin savecsptr:=curcs;pushalignment;
alignstate:=-1000000;
{952:}if(curlist.modefield=209)and((curlist.tailfield<>curlist.headfield
)or(curlist.auxfield.int<>-268435455))then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(264);
print(792);end;printesc(608);print(1317);begin helpptr:=3;
helpline[2]:=1318;helpline[1]:=1319;helpline[0]:=1320;end;error;
flushmath;end{:952};pushnest;
{951:}if curlist.modefield=209 then begin curlist.modefield:=-1;
curlist.auxfield.int:=nest[nestptr-2].auxfield.int;
end else if curlist.modefield>0 then curlist.modefield:=-curlist.
modefield{:951};scanspec(6,false);{953:}mem[memtop-8].hh.rh:=-268435455;
curalign:=memtop-8;curloop:=-268435455;scannerstatus:=4;
warningindex:=savecsptr;alignstate:=-1000000;
while true do begin{954:}mem[curalign].hh.rh:=newparamglue(11);
curalign:=mem[curalign].hh.rh{:954};if curcmd=5 then goto 30;
{955:}{959:}p:=memtop-4;mem[p].hh.rh:=-268435455;
while true do begin getpreambletoken;if curcmd=6 then goto 31;
if(curcmd<=5)and(curcmd>=4)and(alignstate=-1000000)then if(p=memtop-4)
and(curloop=-268435455)and(curcmd=4)then curloop:=curalign else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1326);
end;begin helpptr:=3;helpline[2]:=1327;helpline[1]:=1328;
helpline[0]:=1329;end;backerror;goto 31;
end else if(curcmd<>10)or(p<>memtop-4)then begin mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=curtok;end;end;31:{:959};
mem[curalign].hh.rh:=newnullbox;curalign:=mem[curalign].hh.rh;
mem[curalign].hh.lh:=memtop-9;mem[curalign+1].int:=-1073741824;
mem[curalign+3].int:=mem[memtop-4].hh.rh;{960:}p:=memtop-4;
mem[p].hh.rh:=-268435455;while true do begin 22:getpreambletoken;
if(curcmd<=5)and(curcmd>=4)and(alignstate=-1000000)then goto 32;
if curcmd=6 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1330);
end;begin helpptr:=3;helpline[2]:=1327;helpline[1]:=1328;
helpline[0]:=1331;end;error;goto 22;end;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=curtok;end;32:mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=19614{:960};
mem[curalign+2].int:=mem[memtop-4].hh.rh{:955};end;
30:scannerstatus:=0{:953};newsavelevel(6);
if eqtb[27166].hh.rh<>-268435455 then begintokenlist(eqtb[27166].hh.rh,
13);alignpeek;end;{:950}{962:}{963:}procedure initspan(p:halfword);
begin pushnest;
if curlist.modefield=-105 then curlist.auxfield.hh.lh:=1000 else begin
curlist.auxfield.int:=eqtb[29935].int;normalparagraph;end;curspan:=p;
end;{:963}procedure initrow;begin pushnest;
curlist.modefield:=(-106)-curlist.modefield;
if curlist.modefield=-105 then curlist.auxfield.hh.lh:=0 else curlist.
auxfield.int:=0;begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newglue(mem[mem[memtop-8].hh.rh+1].hh.lh);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=12;
curalign:=mem[mem[memtop-8].hh.rh].hh.rh;curtail:=curhead;
curpretail:=curprehead;initspan(curalign);end;
{:962}{964:}procedure initcol;begin mem[curalign+5].hh.lh:=curcmd;
if curcmd=63 then alignstate:=0 else begin backinput;
begintokenlist(mem[curalign+3].int,1);end;end;
{:964}{967:}function fincol:boolean;label 10;var p:halfword;
q,r:halfword;s:halfword;u:halfword;w:scaled;o:glueord;n:halfword;
begin if curalign=-268435455 then confusion(1332);
q:=mem[curalign].hh.rh;if q=-268435455 then confusion(1332);
if alignstate<500000 then fatalerror(689);p:=mem[q].hh.rh;
{968:}if(p=-268435455)and(mem[curalign+5].hh.lh<257)then if curloop<>
-268435455 then{969:}begin mem[q].hh.rh:=newnullbox;p:=mem[q].hh.rh;
mem[p].hh.lh:=memtop-9;mem[p+1].int:=-1073741824;
curloop:=mem[curloop].hh.rh;{970:}q:=memtop-4;r:=mem[curloop+3].int;
while r<>-268435455 do begin mem[q].hh.rh:=getavail;q:=mem[q].hh.rh;
mem[q].hh.lh:=mem[r].hh.lh;r:=mem[r].hh.rh;end;mem[q].hh.rh:=-268435455;
mem[p+3].int:=mem[memtop-4].hh.rh;q:=memtop-4;r:=mem[curloop+2].int;
while r<>-268435455 do begin mem[q].hh.rh:=getavail;q:=mem[q].hh.rh;
mem[q].hh.lh:=mem[r].hh.lh;r:=mem[r].hh.rh;end;mem[q].hh.rh:=-268435455;
mem[p+2].int:=mem[memtop-4].hh.rh{:970};curloop:=mem[curloop].hh.rh;
mem[p].hh.rh:=newglue(mem[curloop+1].hh.lh);mem[mem[p].hh.rh].hh.b1:=12;
end{:969}else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1333);
end;printesc(1322);begin helpptr:=3;helpline[2]:=1334;helpline[1]:=1335;
helpline[0]:=1336;end;mem[curalign+5].hh.lh:=257;error;end{:968};
if mem[curalign+5].hh.lh<>256 then begin unsave;newsavelevel(6);
{972:}begin if curlist.modefield=-105 then begin adjusttail:=curtail;
preadjusttail:=curpretail;u:=hpack(mem[curlist.headfield].hh.rh,0,1);
w:=mem[u+1].int;curtail:=adjusttail;adjusttail:=-268435455;
curpretail:=preadjusttail;preadjusttail:=-268435455;
end else begin u:=vpackage(mem[curlist.headfield].hh.rh,0,1,0);
w:=mem[u+3].int;end;n:=0;
if curspan<>curalign then{974:}begin q:=curspan;repeat incr(n);
q:=mem[mem[q].hh.rh].hh.rh;until q=curalign;
if n>255 then confusion(1337);q:=curspan;
while mem[mem[q].hh.lh].hh.rh<n do q:=mem[q].hh.lh;
if mem[mem[q].hh.lh].hh.rh>n then begin s:=getnode(2);
mem[s].hh.lh:=mem[q].hh.lh;mem[s].hh.rh:=n;mem[q].hh.lh:=s;
mem[s+1].int:=w;
end else if mem[mem[q].hh.lh+1].int<w then mem[mem[q].hh.lh+1].int:=w;
end{:974}else if w>mem[curalign+1].int then mem[curalign+1].int:=w;
mem[u].hh.b0:=13;mem[u].hh.b1:=n;
{835:}if totalstretch[3]<>0 then o:=3 else if totalstretch[2]<>0 then o
:=2 else if totalstretch[1]<>0 then o:=1 else o:=0{:835};
mem[u+5].hh.b1:=o;mem[u+6].int:=totalstretch[o];
{841:}if totalshrink[3]<>0 then o:=3 else if totalshrink[2]<>0 then o:=2
else if totalshrink[1]<>0 then o:=1 else o:=0{:841};mem[u+5].hh.b0:=o;
mem[u+4].int:=totalshrink[o];popnest;mem[curlist.tailfield].hh.rh:=u;
curlist.tailfield:=u;end{:972};{971:}begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newglue(mem[mem[curalign].hh.rh+1].hh.lh);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=12{:971};
if mem[curalign+5].hh.lh>=257 then begin fincol:=true;goto 10;end;
initspan(p);end;alignstate:=1000000;repeat getxorprotected;
until curcmd<>10;curalign:=p;initcol;fincol:=false;10:end;
{:967}{975:}procedure finrow;var p:halfword;
begin if curlist.modefield=-105 then begin p:=hpack(mem[curlist.
headfield].hh.rh,0,1);popnest;
if curprehead<>curpretail then begin mem[curlist.tailfield].hh.rh:=mem[
curprehead].hh.rh;curlist.tailfield:=curpretail;end;appendtovlist(p);
if curhead<>curtail then begin mem[curlist.tailfield].hh.rh:=mem[curhead
].hh.rh;curlist.tailfield:=curtail;end;
end else begin p:=vpackage(mem[curlist.headfield].hh.rh,0,1,1073741823);
popnest;mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
curlist.auxfield.hh.lh:=1000;end;mem[p].hh.b0:=13;mem[p+6].int:=0;
if eqtb[27166].hh.rh<>-268435455 then begintokenlist(eqtb[27166].hh.rh,
13);alignpeek;end;{:975}{976:}procedure doassignments;forward;
procedure resumeafterdisplay;forward;procedure buildpage;forward;
procedure finalign;var p,q,r,s,u,v:halfword;t,w:scaled;o:scaled;
n:halfword;rulesave:scaled;auxsave:memoryword;
begin if curgroup<>6 then confusion(1338);unsave;
if curgroup<>6 then confusion(1339);unsave;
if nest[nestptr-1].modefield=209 then o:=eqtb[29918].int else o:=0;
{977:}q:=mem[mem[memtop-8].hh.rh].hh.rh;repeat flushlist(mem[q+3].int);
flushlist(mem[q+2].int);p:=mem[mem[q].hh.rh].hh.rh;
if mem[q+1].int=-1073741824 then{978:}begin mem[q+1].int:=0;
r:=mem[q].hh.rh;s:=mem[r+1].hh.lh;
if s<>membot then begin incr(mem[membot].hh.rh);deleteglueref(s);
mem[r+1].hh.lh:=membot;end;end{:978};
if mem[q].hh.lh<>memtop-9 then{979:}begin t:=mem[q+1].int+mem[mem[mem[q]
.hh.rh+1].hh.lh+1].int;r:=mem[q].hh.lh;s:=memtop-9;mem[s].hh.lh:=p;n:=1;
repeat mem[r+1].int:=mem[r+1].int-t;u:=mem[r].hh.lh;
while mem[r].hh.rh>n do begin s:=mem[s].hh.lh;
n:=mem[mem[s].hh.lh].hh.rh+1;end;
if mem[r].hh.rh<n then begin mem[r].hh.lh:=mem[s].hh.lh;mem[s].hh.lh:=r;
decr(mem[r].hh.rh);s:=r;
end else begin if mem[r+1].int>mem[mem[s].hh.lh+1].int then mem[mem[s].
hh.lh+1].int:=mem[r+1].int;freenode(r,2);end;r:=u;until r=memtop-9;
end{:979};mem[q].hh.b0:=13;mem[q].hh.b1:=0;mem[q+3].int:=0;
mem[q+2].int:=0;mem[q+5].hh.b1:=0;mem[q+5].hh.b0:=0;mem[q+6].int:=0;
mem[q+4].int:=0;q:=p;until q=-268435455{:977};{980:}saveptr:=saveptr-2;
packbeginline:=-curlist.mlfield;
if curlist.modefield=-1 then begin rulesave:=eqtb[29919].int;
eqtb[29919].int:=0;
p:=hpack(mem[memtop-8].hh.rh,savestack[saveptr+1].int,savestack[saveptr
+0].int);eqtb[29919].int:=rulesave;
end else begin q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat mem[q+3].int:=mem[q+1].int;mem[q+1].int:=0;
q:=mem[mem[q].hh.rh].hh.rh;until q=-268435455;
p:=vpackage(mem[memtop-8].hh.rh,savestack[saveptr+1].int,savestack[
saveptr+0].int,1073741823);q:=mem[mem[memtop-8].hh.rh].hh.rh;
repeat mem[q+1].int:=mem[q+3].int;mem[q+3].int:=0;
q:=mem[mem[q].hh.rh].hh.rh;until q=-268435455;end;
packbeginline:=0{:980};{981:}q:=mem[curlist.headfield].hh.rh;
s:=curlist.headfield;
while q<>-268435455 do begin if not(q>=himemmin)then if mem[q].hh.b0=13
then{983:}begin if curlist.modefield=-1 then begin mem[q].hh.b0:=0;
mem[q+1].int:=mem[p+1].int;
if nest[nestptr-1].modefield=209 then mem[q].hh.b1:=2;
end else begin mem[q].hh.b0:=1;mem[q+3].int:=mem[p+3].int;end;
mem[q+5].hh.b1:=mem[p+5].hh.b1;mem[q+5].hh.b0:=mem[p+5].hh.b0;
mem[q+6].gr:=mem[p+6].gr;mem[q+4].int:=o;r:=mem[mem[q+5].hh.rh].hh.rh;
s:=mem[mem[p+5].hh.rh].hh.rh;repeat{984:}n:=mem[r].hh.b1;
t:=mem[s+1].int;w:=t;u:=memtop-4;mem[r].hh.b1:=0;
while n>0 do begin decr(n);{985:}s:=mem[s].hh.rh;v:=mem[s+1].hh.lh;
mem[u].hh.rh:=newglue(v);u:=mem[u].hh.rh;mem[u].hh.b1:=12;
t:=t+mem[v+1].int;
if mem[p+5].hh.b0=1 then begin if mem[v].hh.b0=mem[p+5].hh.b1 then t:=t+
round(mem[p+6].gr*mem[v+2].int);
end else if mem[p+5].hh.b0=2 then begin if mem[v].hh.b1=mem[p+5].hh.b1
then t:=t-round(mem[p+6].gr*mem[v+3].int);end;s:=mem[s].hh.rh;
mem[u].hh.rh:=newnullbox;u:=mem[u].hh.rh;t:=t+mem[s+1].int;
if curlist.modefield=-1 then mem[u+1].int:=mem[s+1].int else begin mem[u
].hh.b0:=1;mem[u+3].int:=mem[s+1].int;end{:985};end;
if curlist.modefield=-1 then{986:}begin mem[r+3].int:=mem[q+3].int;
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
end{:986}else{987:}begin mem[r+1].int:=mem[q+1].int;
if t=mem[r+3].int then begin mem[r+5].hh.b0:=0;mem[r+5].hh.b1:=0;
mem[r+6].gr:=0.0;
end else if t>mem[r+3].int then begin mem[r+5].hh.b0:=1;
if mem[r+6].int=0 then mem[r+6].gr:=0.0 else mem[r+6].gr:=(t-mem[r+3].
int)/mem[r+6].int;end else begin mem[r+5].hh.b1:=mem[r+5].hh.b0;
mem[r+5].hh.b0:=2;
if mem[r+4].int=0 then mem[r+6].gr:=0.0 else if(mem[r+5].hh.b1=0)and(mem
[r+3].int-t>mem[r+4].int)then mem[r+6].gr:=1.0 else mem[r+6].gr:=(mem[r
+3].int-t)/mem[r+4].int;end;mem[r+3].int:=w;mem[r].hh.b0:=1;end{:987};
mem[r+4].int:=0;if u<>memtop-4 then begin mem[u].hh.rh:=mem[r].hh.rh;
mem[r].hh.rh:=mem[memtop-4].hh.rh;r:=u;end{:984};
r:=mem[mem[r].hh.rh].hh.rh;s:=mem[mem[s].hh.rh].hh.rh;
until r=-268435455;
end{:983}else if mem[q].hh.b0=2 then{982:}begin if(mem[q+1].int=
-1073741824)then mem[q+1].int:=mem[p+1].int;
if(mem[q+3].int=-1073741824)then mem[q+3].int:=mem[p+3].int;
if(mem[q+2].int=-1073741824)then mem[q+2].int:=mem[p+2].int;
if o<>0 then begin r:=mem[q].hh.rh;mem[q].hh.rh:=-268435455;
q:=hpack(q,0,1);mem[q+4].int:=o;mem[q].hh.rh:=r;mem[s].hh.rh:=q;end;
end{:982};s:=q;q:=mem[q].hh.rh;end{:981};flushnodelist(p);popalignment;
{988:}auxsave:=curlist.auxfield;p:=mem[curlist.headfield].hh.rh;
q:=curlist.tailfield;popnest;
if curlist.modefield=209 then{1384:}begin doassignments;
if curcmd<>3 then{1385:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1600);
end;begin helpptr:=2;helpline[1]:=1318;helpline[0]:=1319;end;backerror;
end{:1385}else{1375:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1596);
end;begin helpptr:=2;helpline[1]:=1597;helpline[0]:=1598;end;backerror;
end;end{:1375};flushnodelist(curlist.eTeXauxfield);popnest;
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[29288].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newparamglue(3);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.rh:=p;
if p<>-268435455 then curlist.tailfield:=q;
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[29289].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newparamglue(4);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.auxfield.int:=auxsave.int;resumeafterdisplay;
end{:1384}else begin curlist.auxfield:=auxsave;
mem[curlist.tailfield].hh.rh:=p;
if p<>-268435455 then curlist.tailfield:=q;
if curlist.modefield=1 then buildpage;end{:988};end;
{961:}procedure alignpeek;label 20;begin 20:alignstate:=1000000;
repeat getxorprotected;until curcmd<>10;
if curcmd=34 then begin scanleftbrace;newsavelevel(7);
if curlist.modefield=-1 then normalparagraph;
end else if curcmd=2 then finalign else if(curcmd=5)and(curchr=258)then
goto 20 else begin initrow;initcol;end;end;
{:961}{:976}{991:}{1002:}function finiteshrink(p:halfword):halfword;
var q:halfword;
begin if noshrinkerroryet then begin noshrinkerroryet:=false;
ifdef('STAT')if eqtb[29309].int>0 then enddiagnostic(true);
endif('STAT')begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1340);
end;begin helpptr:=5;helpline[4]:=1341;helpline[3]:=1342;
helpline[2]:=1343;helpline[1]:=1344;helpline[0]:=1345;end;error;
ifdef('STAT')if eqtb[29309].int>0 then begindiagnostic;endif('STAT')end;
q:=newspec(p);mem[q].hh.b1:=0;deleteglueref(p);finiteshrink:=q;end;
{:1002}{1005:}procedure pushnode(p:halfword);
begin if hliststacklevel>512 then pdferror(1346,1347);
hliststack[hliststacklevel]:=p;hliststacklevel:=hliststacklevel+1;end;
function popnode:halfword;begin hliststacklevel:=hliststacklevel-1;
if hliststacklevel<0 then pdferror(1348,1349);
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
mem[l].hh.b0=5)or(mem[l].hh.b0=12)or((mem[l].hh.b0=8)and(mem[l].hh.b1<>
14)and(mem[l].hh.b1<>12))or((mem[l].hh.b0=7)and(mem[l+1].hh.lh=
-268435455)and(mem[l+1].hh.rh=-268435455)and(mem[l].hh.b1=0))or((mem[l].
hh.b0=9)and(mem[l+1].int=0))or((mem[l].hh.b0=11)and((mem[l+1].int=0)or(
mem[l].hh.b1=0)or(mem[l].hh.b1=3)))or((mem[l].hh.b0=10)and(mem[l+1].hh.
lh=membot))or((mem[l].hh.b0=0)and(mem[l+1].int=0)and(mem[l+3].int=0)and(
mem[l+2].int=0)and(mem[l+5].hh.rh=-268435455))))do begin while(mem[l].hh
.rh=-268435455)and(hliststacklevel>0)do begin l:=popnode;end;
if mem[l].hh.rh<>-268435455 then l:=mem[l].hh.rh else if hliststacklevel
=0 then run:=false end;until t=l;findprotcharleft:=l;end;
function findprotcharright(l,r:halfword):halfword;var t:halfword;
run:boolean;begin findprotcharright:=-268435455;
if r=-268435455 then goto 10;hliststacklevel:=0;run:=true;repeat t:=r;
while run and(mem[r].hh.b0=0)and(mem[r+5].hh.rh<>-268435455)do begin
pushnode(l);pushnode(r);l:=mem[r+5].hh.rh;r:=l;
while mem[r].hh.rh<>-268435455 do r:=mem[r].hh.rh;end;
while run and(not(r>=himemmin)and((mem[r].hh.b0=3)or(mem[r].hh.b0=4)or(
mem[r].hh.b0=5)or(mem[r].hh.b0=12)or((mem[r].hh.b0=8)and(mem[r].hh.b1<>
14)and(mem[r].hh.b1<>12))or((mem[r].hh.b0=7)and(mem[r+1].hh.lh=
-268435455)and(mem[r+1].hh.rh=-268435455)and(mem[r].hh.b1=0))or((mem[r].
hh.b0=9)and(mem[r+1].int=0))or((mem[r].hh.b0=11)and((mem[r+1].int=0)or(
mem[r].hh.b1=0)or(mem[r].hh.b1=3)))or((mem[r].hh.b0=10)and(mem[r+1].hh.
lh=membot))or((mem[r].hh.b0=0)and(mem[r+1].int=0)and(mem[r+3].int=0)and(
mem[r+2].int=0)and(mem[r+5].hh.rh=-268435455))))do begin while(r=l)and(
hliststacklevel>0)do begin r:=popnode;l:=popnode;end;
if(r<>l)and(r<>-268435455)then r:=prevrightmost(l,r)else if(r=l)and(
hliststacklevel=0)then run:=false end;until t=r;findprotcharright:=r;
end;function totalpw(q,p:halfword):scaled;var l,r:halfword;n:integer;
begin if mem[q+1].hh.rh=-268435455 then l:=firstp else l:=mem[mem[q+1].
hh.rh+1].hh.rh;r:=prevrightmost(prevp,p);{shortdisplayn(r,2);print(38);
shortdisplayn(p,2);println;}
if(p<>-268435455)and(mem[p].hh.b0=7)and(mem[p+1].hh.lh<>-268435455)then
begin r:=mem[p+1].hh.lh;
while mem[r].hh.rh<>-268435455 do r:=mem[r].hh.rh;
end else r:=findprotcharright(l,r);{shortdisplayn(l,2);println;
breadthmax:=10;depththreshold:=2;shownodelist(l);println;}
if(l<>-268435455)and(mem[l].hh.b0=7)then begin if mem[l+1].hh.rh<>
-268435455 then begin l:=mem[l+1].hh.rh;goto 30;
end else begin n:=mem[l].hh.b1;l:=mem[l].hh.rh;
while n>0 do begin if mem[l].hh.rh<>-268435455 then l:=mem[l].hh.rh;
decr(n);end;end;end;l:=findprotcharleft(l,true);
30:totalpw:=charpw(l,0)+charpw(r,1);end;procedure trybreak(pi:integer;
breaktype:smallnumber);label 10,30,31,22,60,40,45;var r:halfword;
marginkernstretch:scaled;marginkernshrink:scaled;lp,rp,cp:halfword;
prevr:halfword;oldl:halfword;nobreakyet:boolean;
{1006:}prevprevr:halfword;s:halfword;q:halfword;v:halfword;t:integer;
f:internalfontnumber;l:halfword;noderstaysactive:boolean;
linewidth:scaled;fitclass:0..3;b:halfword;d:integer;
artificialdemerits:boolean;savelink:halfword;shortfall:scaled;
{:1006}{1844:}g:scaled;
{:1844}begin{1007:}if abs(pi)>=10000 then if pi>0 then goto 10 else pi:=
-10000{:1007};nobreakyet:=true;prevr:=memtop-7;oldl:=0;
curactivewidth[1]:=activewidth[1];curactivewidth[2]:=activewidth[2];
curactivewidth[3]:=activewidth[3];curactivewidth[4]:=activewidth[4];
curactivewidth[5]:=activewidth[5];curactivewidth[6]:=activewidth[6];
if eqtb[29360].int>1 then begin curactivewidth[7]:=activewidth[7];
curactivewidth[8]:=activewidth[8];end;
while true do begin 22:r:=mem[prevr].hh.rh;
{1008:}if mem[r].hh.b0=2 then begin curactivewidth[1]:=curactivewidth[1]
+mem[r+1].int;curactivewidth[2]:=curactivewidth[2]+mem[r+2].int;
curactivewidth[3]:=curactivewidth[3]+mem[r+3].int;
curactivewidth[4]:=curactivewidth[4]+mem[r+4].int;
curactivewidth[5]:=curactivewidth[5]+mem[r+5].int;
curactivewidth[6]:=curactivewidth[6]+mem[r+6].int;
if eqtb[29360].int>1 then begin curactivewidth[7]:=curactivewidth[7]+mem
[r+7].int;curactivewidth[8]:=curactivewidth[8]+mem[r+8].int;end;
prevprevr:=prevr;prevr:=r;goto 22;end{:1008};
{1011:}begin l:=mem[r+1].hh.lh;
if l>oldl then begin if(minimumdemerits<1073741823)and((oldl<>easyline)
or(r=memtop-7))then{1012:}begin if nobreakyet then{1013:}begin
nobreakyet:=false;breakwidth[1]:=background[1];
breakwidth[2]:=background[2];breakwidth[3]:=background[3];
breakwidth[4]:=background[4];breakwidth[5]:=background[5];
breakwidth[6]:=background[6];
if eqtb[29360].int>1 then begin breakwidth[7]:=background[7];
breakwidth[8]:=background[8];end;s:=curp;
if breaktype>0 then if curp<>-268435455 then{1016:}begin t:=mem[curp].hh
.b1;v:=curp;s:=mem[curp+1].hh.rh;while t>0 do begin decr(t);
v:=mem[v].hh.rh;{1017:}if(v>=himemmin)then begin f:=mem[v].hh.b0;
breakwidth[1]:=breakwidth[1]-fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[v].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=v;
breakwidth[7]:=breakwidth[7]-charstretch(f,mem[v].hh.b1);
breakwidth[8]:=breakwidth[8]-charshrink(f,mem[v].hh.b1);end;
end else case mem[v].hh.b0 of 6:begin f:=mem[v+1].hh.b0;
breakwidth[1]:=breakwidth[1]-fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[v+1].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=v;
breakwidth[7]:=breakwidth[7]-charstretch(f,mem[v+1].hh.b1);
breakwidth[8]:=breakwidth[8]-charshrink(f,mem[v+1].hh.b1);end;end;
0,1,2,11:begin breakwidth[1]:=breakwidth[1]-mem[v+1].int;
if(mem[v].hh.b0=11)and(eqtb[29360].int>1)and(mem[v].hh.b1=0)then begin
breakwidth[7]:=breakwidth[7]-kernstretch(v);
breakwidth[8]:=breakwidth[8]-kernshrink(v);end;end;
others:confusion(1350)end{:1017};end;
while s<>-268435455 do begin{1018:}if(s>=himemmin)then begin f:=mem[s].
hh.b0;
breakwidth[1]:=breakwidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[s].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=s;
breakwidth[7]:=breakwidth[7]+charstretch(f,mem[s].hh.b1);
breakwidth[8]:=breakwidth[8]+charshrink(f,mem[s].hh.b1);end;
end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
breakwidth[1]:=breakwidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[s+1].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=s;
breakwidth[7]:=breakwidth[7]+charstretch(f,mem[s+1].hh.b1);
breakwidth[8]:=breakwidth[8]+charshrink(f,mem[s+1].hh.b1);end;end;
0,1,2,11:begin breakwidth[1]:=breakwidth[1]+mem[s+1].int;
if(mem[s].hh.b0=11)and(eqtb[29360].int>1)and(mem[s].hh.b1=0)then begin
breakwidth[7]:=breakwidth[7]+kernstretch(s);
breakwidth[8]:=breakwidth[8]+kernshrink(s);end;end;
others:confusion(1351)end{:1018};s:=mem[s].hh.rh;end;
breakwidth[1]:=breakwidth[1]+discwidth[1];
if eqtb[29360].int>1 then begin breakwidth[7]:=breakwidth[7]+discwidth[7
];breakwidth[8]:=breakwidth[8]+discwidth[8];end;
if mem[curp+1].hh.rh=-268435455 then s:=mem[v].hh.rh;end{:1016};
while s<>-268435455 do begin if(s>=himemmin)then goto 30;
case mem[s].hh.b0 of 10:{1014:}begin v:=mem[s+1].hh.lh;
breakwidth[1]:=breakwidth[1]-mem[v+1].int;
breakwidth[2+mem[v].hh.b0]:=breakwidth[2+mem[v].hh.b0]-mem[v+2].int;
breakwidth[6]:=breakwidth[6]-mem[v+3].int;end{:1014};12:;
9:breakwidth[1]:=breakwidth[1]-mem[s+1].int;
11:if mem[s].hh.b1<>1 then goto 30 else breakwidth[1]:=breakwidth[1]-mem
[s+1].int;others:goto 30 end;s:=mem[s].hh.rh;end;30:end{:1013};
{1019:}if mem[prevr].hh.b0=2 then begin mem[prevr+1].int:=mem[prevr+1].
int-curactivewidth[1]+breakwidth[1];
mem[prevr+2].int:=mem[prevr+2].int-curactivewidth[2]+breakwidth[2];
mem[prevr+3].int:=mem[prevr+3].int-curactivewidth[3]+breakwidth[3];
mem[prevr+4].int:=mem[prevr+4].int-curactivewidth[4]+breakwidth[4];
mem[prevr+5].int:=mem[prevr+5].int-curactivewidth[5]+breakwidth[5];
mem[prevr+6].int:=mem[prevr+6].int-curactivewidth[6]+breakwidth[6];
if eqtb[29360].int>1 then begin mem[prevr+7].int:=mem[prevr+7].int-
curactivewidth[7]+breakwidth[7];
mem[prevr+8].int:=mem[prevr+8].int-curactivewidth[8]+breakwidth[8];end;
end else if prevr=memtop-7 then begin activewidth[1]:=breakwidth[1];
activewidth[2]:=breakwidth[2];activewidth[3]:=breakwidth[3];
activewidth[4]:=breakwidth[4];activewidth[5]:=breakwidth[5];
activewidth[6]:=breakwidth[6];
if eqtb[29360].int>1 then begin activewidth[7]:=breakwidth[7];
activewidth[8]:=breakwidth[8];end;end else begin q:=getnode(9);
mem[q].hh.rh:=r;mem[q].hh.b0:=2;mem[q].hh.b1:=0;
mem[q+1].int:=breakwidth[1]-curactivewidth[1];
mem[q+2].int:=breakwidth[2]-curactivewidth[2];
mem[q+3].int:=breakwidth[3]-curactivewidth[3];
mem[q+4].int:=breakwidth[4]-curactivewidth[4];
mem[q+5].int:=breakwidth[5]-curactivewidth[5];
mem[q+6].int:=breakwidth[6]-curactivewidth[6];
if eqtb[29360].int>1 then begin mem[q+7].int:=breakwidth[7]-
curactivewidth[7];mem[q+8].int:=breakwidth[8]-curactivewidth[8];end;
mem[prevr].hh.rh:=q;prevprevr:=prevr;prevr:=q;end{:1019};
if abs(eqtb[29293].int)>=1073741823-minimumdemerits then minimumdemerits
:=1073741822 else minimumdemerits:=minimumdemerits+abs(eqtb[29293].int);
for fitclass:=0 to 3 do begin if minimaldemerits[fitclass]<=
minimumdemerits then{1021:}begin q:=getnode(2);mem[q].hh.rh:=passive;
passive:=q;mem[q+1].hh.rh:=curp;ifdef('STAT')incr(passnumber);
mem[q].hh.lh:=passnumber;
endif('STAT')mem[q+1].hh.lh:=bestplace[fitclass];
q:=getnode(activenodesize);mem[q+1].hh.rh:=passive;
mem[q+1].hh.lh:=bestplline[fitclass]+1;mem[q].hh.b1:=fitclass;
mem[q].hh.b0:=breaktype;mem[q+2].int:=minimaldemerits[fitclass];
if dolastlinefit then{1851:}begin mem[q+3].int:=bestplshort[fitclass];
mem[q+4].int:=bestplglue[fitclass];end{:1851};mem[q].hh.rh:=r;
mem[prevr].hh.rh:=q;prevr:=q;
ifdef('STAT')if eqtb[29309].int>0 then{1022:}begin printnl(1352);
printint(mem[passive].hh.lh);print(1353);printint(mem[q+1].hh.lh-1);
printchar(46);printint(fitclass);if breaktype=1 then printchar(45);
print(1354);printint(mem[q+2].int);
if dolastlinefit then{1852:}begin print(2093);printscaled(mem[q+3].int);
if curp=-268435455 then print(2094)else print(1424);
printscaled(mem[q+4].int);end{:1852};print(1355);
if mem[passive+1].hh.lh=-268435455 then printchar(48)else printint(mem[
mem[passive+1].hh.lh].hh.lh);end{:1022};endif('STAT')end{:1021};
minimaldemerits[fitclass]:=1073741823;end;minimumdemerits:=1073741823;
{1020:}if r<>memtop-7 then begin q:=getnode(9);mem[q].hh.rh:=r;
mem[q].hh.b0:=2;mem[q].hh.b1:=0;
mem[q+1].int:=curactivewidth[1]-breakwidth[1];
mem[q+2].int:=curactivewidth[2]-breakwidth[2];
mem[q+3].int:=curactivewidth[3]-breakwidth[3];
mem[q+4].int:=curactivewidth[4]-breakwidth[4];
mem[q+5].int:=curactivewidth[5]-breakwidth[5];
mem[q+6].int:=curactivewidth[6]-breakwidth[6];
if eqtb[29360].int>1 then begin mem[q+7].int:=curactivewidth[7]-
breakwidth[7];mem[q+8].int:=curactivewidth[8]-breakwidth[8];end;
mem[prevr].hh.rh:=q;prevprevr:=prevr;prevr:=q;end{:1020};end{:1012};
if r=memtop-7 then goto 10;
{1026:}if l>easyline then begin linewidth:=secondwidth;oldl:=268435454;
end else begin oldl:=l;
if l>lastspecialline then linewidth:=secondwidth else if eqtb[27158].hh.
rh=-268435455 then linewidth:=firstwidth else linewidth:=mem[eqtb[27158]
.hh.rh+2*l].int;end{:1026};end;end{:1011};
{1027:}begin artificialdemerits:=false;
shortfall:=linewidth-curactivewidth[1];
{if eqtb[29342].int>2 then begin println;
if(r<>-268435455)and(mem[r+1].hh.rh<>-268435455)then shortdisplayn(mem[
mem[r+1].hh.rh+1].hh.rh,5);println;shortdisplayn(curp,5);println;end;}
if eqtb[29361].int>1 then shortfall:=shortfall+totalpw(r,curp);
if(eqtb[29360].int>1)and(shortfall<>0)then begin marginkernstretch:=0;
marginkernshrink:=0;
if eqtb[29361].int>1 then{822:}begin lp:=lastleftmostchar;
rp:=lastrightmostchar;begin cp:=avail;
if cp=-268435455 then cp:=getavail else begin avail:=mem[cp].hh.rh;
mem[cp].hh.rh:=-268435455;ifdef('STAT')incr(dynused);endif('STAT')end;
end;if lp<>-268435455 then begin mem[cp].hh.b1:=mem[lp].hh.b1;
mem[cp].hh.b0:=mem[lp].hh.b0;dosubstfont(cp,1000);
if mem[cp].hh.b0<>mem[lp].hh.b0 then marginkernstretch:=
marginkernstretch+charpw(lp,0)-charpw(cp,0);
mem[cp].hh.b0:=mem[lp].hh.b0;dosubstfont(cp,-1000);
if mem[cp].hh.b0<>mem[lp].hh.b0 then marginkernshrink:=marginkernshrink+
charpw(cp,0)-charpw(lp,0);end;
if rp<>-268435455 then begin mem[cp].hh.b1:=mem[rp].hh.b1;
mem[cp].hh.b0:=mem[rp].hh.b0;dosubstfont(cp,1000);
if mem[cp].hh.b0<>mem[rp].hh.b0 then marginkernstretch:=
marginkernstretch+charpw(rp,0)-charpw(cp,0);
mem[cp].hh.b0:=mem[rp].hh.b0;dosubstfont(cp,-1000);
if mem[cp].hh.b0<>mem[rp].hh.b0 then marginkernshrink:=marginkernshrink+
charpw(cp,0)-charpw(rp,0);end;begin mem[cp].hh.rh:=avail;avail:=cp;
ifdef('STAT')decr(dynused);endif('STAT')end;end{:822};
if(shortfall>0)and((curactivewidth[7]+marginkernstretch)>0)then begin if
(curactivewidth[7]+marginkernstretch)>shortfall then shortfall:=((
curactivewidth[7]+marginkernstretch)div(maxstretchratio div curfontstep)
)div 2 else shortfall:=shortfall-(curactivewidth[7]+marginkernstretch);
end else if(shortfall<0)and((curactivewidth[8]+marginkernshrink)>0)then
begin if(curactivewidth[8]+marginkernshrink)>-shortfall then shortfall:=
-((curactivewidth[8]+marginkernshrink)div(maxshrinkratio div curfontstep
))div 2 else shortfall:=shortfall+(curactivewidth[8]+marginkernshrink);
end;end;
if shortfall>0 then{1028:}if(curactivewidth[3]<>0)or(curactivewidth[4]<>
0)or(curactivewidth[5]<>0)then begin if dolastlinefit then begin if curp
=-268435455 then{1846:}begin if(mem[r+3].int=0)or(mem[r+4].int<=0)then
goto 45;
if(curactivewidth[3]<>fillwidth[0])or(curactivewidth[4]<>fillwidth[1])or
(curactivewidth[5]<>fillwidth[2])then goto 45;
if mem[r+3].int>0 then g:=curactivewidth[2]else g:=curactivewidth[6];
if g<=0 then goto 45;aritherror:=false;
g:=fract(g,mem[r+3].int,mem[r+4].int,1073741823);
if eqtb[29385].int<1000 then g:=fract(g,eqtb[29385].int,1000,1073741823)
;if aritherror then if mem[r+3].int>0 then g:=1073741823 else g:=
-1073741823;if g>0 then{1847:}begin if g>shortfall then g:=shortfall;
if g>7230584 then if curactivewidth[2]<1663497 then begin b:=10000;
fitclass:=0;goto 40;end;b:=badness(g,curactivewidth[2]);
if b>12 then if b>99 then fitclass:=0 else fitclass:=1 else fitclass:=2;
goto 40;
end{:1847}else if g<0 then{1848:}begin if-g>curactivewidth[6]then g:=-
curactivewidth[6];b:=badness(-g,curactivewidth[6]);
if b>12 then fitclass:=3 else fitclass:=2;goto 40;end{:1848};
45:end{:1846};shortfall:=0;end;b:=0;fitclass:=2;
end else begin if shortfall>7230584 then if curactivewidth[2]<1663497
then begin b:=10000;fitclass:=0;goto 31;end;
b:=badness(shortfall,curactivewidth[2]);
if b>12 then if b>99 then fitclass:=0 else fitclass:=1 else fitclass:=2;
31:end{:1028}else{1029:}begin if-shortfall>curactivewidth[6]then b:=
10001 else b:=badness(-shortfall,curactivewidth[6]);
if b>12 then fitclass:=3 else fitclass:=2;end{:1029};
if dolastlinefit then{1849:}begin if curp=-268435455 then shortfall:=0;
if shortfall>0 then g:=curactivewidth[2]else if shortfall<0 then g:=
curactivewidth[6]else g:=0;end{:1849};
40:if(b>10000)or(pi=-10000)then{1030:}begin if finalpass and(
minimumdemerits=1073741823)and(mem[r].hh.rh=memtop-7)and(prevr=memtop-7)
then artificialdemerits:=true else if b>threshold then goto 60;
noderstaysactive:=false;end{:1030}else begin prevr:=r;
if b>threshold then goto 22;noderstaysactive:=true;end;
{1031:}if artificialdemerits then d:=0 else{1035:}begin d:=eqtb[29279].
int+b;if abs(d)>=10000 then d:=100000000 else d:=d*d;
if pi<>0 then if pi>0 then d:=d+pi*pi else if pi>-10000 then d:=d-pi*pi;
if(breaktype=1)and(mem[r].hh.b0=1)then if curp<>-268435455 then d:=d+
eqtb[29291].int else d:=d+eqtb[29292].int;
if abs(fitclass-mem[r].hh.b1)>1 then d:=d+eqtb[29293].int;end{:1035};
ifdef('STAT')if eqtb[29309].int>0 then{1032:}begin if printednode<>curp
then{1033:}begin printnl(345);
if curp=-268435455 then shortdisplay(mem[printednode].hh.rh)else begin
savelink:=mem[curp].hh.rh;mem[curp].hh.rh:=-268435455;printnl(345);
shortdisplay(mem[printednode].hh.rh);mem[curp].hh.rh:=savelink;end;
printednode:=curp;end{:1033};printnl(64);
if curp=-268435455 then printesc(691)else if mem[curp].hh.b0<>10 then
begin if mem[curp].hh.b0=12 then printesc(620)else if mem[curp].hh.b0=7
then printesc(358)else if mem[curp].hh.b0=11 then printesc(322)else
printesc(352);end;print(1356);
if mem[r+1].hh.rh=-268435455 then printchar(48)else printint(mem[mem[r+1
].hh.rh].hh.lh);print(1357);
if b>10000 then printchar(42)else printint(b);print(1358);printint(pi);
print(1359);if artificialdemerits then printchar(42)else printint(d);
end{:1032};endif('STAT')d:=d+mem[r+2].int;
if d<=minimaldemerits[fitclass]then begin minimaldemerits[fitclass]:=d;
bestplace[fitclass]:=mem[r+1].hh.rh;bestplline[fitclass]:=l;
if dolastlinefit then{1850:}begin bestplshort[fitclass]:=shortfall;
bestplglue[fitclass]:=g;end{:1850};
if d<minimumdemerits then minimumdemerits:=d;end{:1031};
if noderstaysactive then goto 22;
60:{1036:}mem[prevr].hh.rh:=mem[r].hh.rh;freenode(r,activenodesize);
if prevr=memtop-7 then{1037:}begin r:=mem[memtop-7].hh.rh;
if mem[r].hh.b0=2 then begin activewidth[1]:=activewidth[1]+mem[r+1].int
;activewidth[2]:=activewidth[2]+mem[r+2].int;
activewidth[3]:=activewidth[3]+mem[r+3].int;
activewidth[4]:=activewidth[4]+mem[r+4].int;
activewidth[5]:=activewidth[5]+mem[r+5].int;
activewidth[6]:=activewidth[6]+mem[r+6].int;
if eqtb[29360].int>1 then begin activewidth[7]:=activewidth[7]+mem[r+7].
int;activewidth[8]:=activewidth[8]+mem[r+8].int;end;
curactivewidth[1]:=activewidth[1];curactivewidth[2]:=activewidth[2];
curactivewidth[3]:=activewidth[3];curactivewidth[4]:=activewidth[4];
curactivewidth[5]:=activewidth[5];curactivewidth[6]:=activewidth[6];
if eqtb[29360].int>1 then begin curactivewidth[7]:=activewidth[7];
curactivewidth[8]:=activewidth[8];end;mem[memtop-7].hh.rh:=mem[r].hh.rh;
freenode(r,9);end;
end{:1037}else if mem[prevr].hh.b0=2 then begin r:=mem[prevr].hh.rh;
if r=memtop-7 then begin curactivewidth[1]:=curactivewidth[1]-mem[prevr
+1].int;curactivewidth[2]:=curactivewidth[2]-mem[prevr+2].int;
curactivewidth[3]:=curactivewidth[3]-mem[prevr+3].int;
curactivewidth[4]:=curactivewidth[4]-mem[prevr+4].int;
curactivewidth[5]:=curactivewidth[5]-mem[prevr+5].int;
curactivewidth[6]:=curactivewidth[6]-mem[prevr+6].int;
if eqtb[29360].int>1 then begin curactivewidth[7]:=curactivewidth[7]-mem
[prevr+7].int;curactivewidth[8]:=curactivewidth[8]-mem[prevr+8].int;end;
mem[prevprevr].hh.rh:=memtop-7;freenode(prevr,9);prevr:=prevprevr;
end else if mem[r].hh.b0=2 then begin curactivewidth[1]:=curactivewidth[
1]+mem[r+1].int;curactivewidth[2]:=curactivewidth[2]+mem[r+2].int;
curactivewidth[3]:=curactivewidth[3]+mem[r+3].int;
curactivewidth[4]:=curactivewidth[4]+mem[r+4].int;
curactivewidth[5]:=curactivewidth[5]+mem[r+5].int;
curactivewidth[6]:=curactivewidth[6]+mem[r+6].int;
if eqtb[29360].int>1 then begin curactivewidth[7]:=curactivewidth[7]+mem
[r+7].int;curactivewidth[8]:=curactivewidth[8]+mem[r+8].int;end;
mem[prevr+1].int:=mem[prevr+1].int+mem[r+1].int;
mem[prevr+2].int:=mem[prevr+2].int+mem[r+2].int;
mem[prevr+3].int:=mem[prevr+3].int+mem[r+3].int;
mem[prevr+4].int:=mem[prevr+4].int+mem[r+4].int;
mem[prevr+5].int:=mem[prevr+5].int+mem[r+5].int;
mem[prevr+6].int:=mem[prevr+6].int+mem[r+6].int;
if eqtb[29360].int>1 then begin mem[prevr+7].int:=mem[prevr+7].int+mem[r
+7].int;mem[prevr+8].int:=mem[prevr+8].int+mem[r+8].int;end;
mem[prevr].hh.rh:=mem[r].hh.rh;freenode(r,9);end;end{:1036};end{:1027};
end;
10:ifdef('STAT'){1034:}if curp=printednode then if curp<>-268435455 then
if mem[curp].hh.b0=7 then begin t:=mem[curp].hh.b1;
while t>0 do begin decr(t);printednode:=mem[printednode].hh.rh;end;
end{:1034}endif('STAT')end;
{:1005}{1053:}procedure postlinebreak(d:boolean);label 30,31;
var q,r,s:halfword;p,k:halfword;w:scaled;gluebreak:boolean;
ptmp:halfword;discbreak:boolean;postdiscbreak:boolean;curwidth:scaled;
curindent:scaled;t:quarterword;pen:integer;curline:halfword;
LRptr:halfword;begin LRptr:=curlist.eTeXauxfield;
{1054:}q:=mem[bestbet+1].hh.rh;curp:=-268435455;repeat r:=q;
q:=mem[q+1].hh.lh;mem[r+1].hh.lh:=curp;curp:=r;
until q=-268435455{:1054};curline:=curlist.pgfield+1;
repeat{1056:}if(eqtb[29389].int>0)then{1707:}begin q:=mem[memtop-3].hh.
rh;if LRptr<>-268435455 then begin tempptr:=LRptr;r:=q;
repeat s:=newmath(0,(mem[tempptr].hh.lh-1));mem[s].hh.rh:=r;r:=s;
tempptr:=mem[tempptr].hh.rh;until tempptr=-268435455;
mem[memtop-3].hh.rh:=r;end;
while q<>mem[curp+1].hh.rh do begin if not(q>=himemmin)then if mem[q].hh
.b0=9 then{1708:}if odd(mem[q].hh.b1)then begin if LRptr<>-268435455
then if mem[LRptr].hh.lh=(4*(mem[q].hh.b1 div 4)+3)then begin tempptr:=
LRptr;LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1708};q:=mem[q].hh.rh;end;
end{:1707};{1057:}q:=mem[curp+1].hh.rh;discbreak:=false;
postdiscbreak:=false;gluebreak:=false;
if q<>-268435455 then if mem[q].hh.b0=10 then begin deleteglueref(mem[q
+1].hh.lh);mem[q+1].hh.lh:=eqtb[26636].hh.rh;mem[q].hh.b1:=9;
incr(mem[eqtb[26636].hh.rh].hh.rh);gluebreak:=true;goto 30;
end else begin if mem[q].hh.b0=7 then{1058:}begin t:=mem[q].hh.b1;
{1059:}if t=0 then r:=mem[q].hh.rh else begin r:=q;
while t>1 do begin r:=mem[r].hh.rh;decr(t);end;s:=mem[r].hh.rh;
r:=mem[s].hh.rh;mem[s].hh.rh:=-268435455;flushnodelist(mem[q].hh.rh);
mem[q].hh.b1:=0;end{:1059};
if mem[q+1].hh.rh<>-268435455 then{1060:}begin s:=mem[q+1].hh.rh;
while mem[s].hh.rh<>-268435455 do s:=mem[s].hh.rh;mem[s].hh.rh:=r;
r:=mem[q+1].hh.rh;mem[q+1].hh.rh:=-268435455;postdiscbreak:=true;
end{:1060};
if mem[q+1].hh.lh<>-268435455 then{1061:}begin s:=mem[q+1].hh.lh;
mem[q].hh.rh:=s;while mem[s].hh.rh<>-268435455 do s:=mem[s].hh.rh;
mem[q+1].hh.lh:=-268435455;q:=s;end{:1061};mem[q].hh.rh:=r;
discbreak:=true;
end{:1058}else if mem[q].hh.b0=11 then mem[q+1].int:=0 else if mem[q].hh
.b0=9 then begin mem[q+1].int:=0;
if(eqtb[29389].int>0)then{1708:}if odd(mem[q].hh.b1)then begin if LRptr
<>-268435455 then if mem[LRptr].hh.lh=(4*(mem[q].hh.b1 div 4)+3)then
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1708};end;
end else begin q:=memtop-3;
while mem[q].hh.rh<>-268435455 do q:=mem[q].hh.rh;end;
30:if eqtb[29361].int>0 then begin if discbreak and((q>=himemmin)or(mem[
q].hh.b0<>7))then begin p:=q;ptmp:=p;
end else begin p:=prevrightmost(mem[memtop-3].hh.rh,q);ptmp:=p;
p:=findprotcharright(mem[memtop-3].hh.rh,p);end;{shortdisplayn(p,1);
println;}w:=charpw(p,1);
if w<>0 then begin k:=newmarginkern(-w,lastrightmostchar,1);
mem[k].hh.rh:=mem[ptmp].hh.rh;mem[ptmp].hh.rh:=k;
if(ptmp=q)then q:=mem[q].hh.rh;end;end;
if not gluebreak then begin{1062:}r:=newparamglue(8);
mem[r].hh.rh:=mem[q].hh.rh;mem[q].hh.rh:=r;q:=r{:1062};end;{:1057};
if(eqtb[29389].int>0)then{1709:}if LRptr<>-268435455 then begin s:=
memtop-3;r:=mem[s].hh.rh;while r<>q do begin s:=r;r:=mem[s].hh.rh;end;
r:=LRptr;while r<>-268435455 do begin tempptr:=newmath(0,mem[r].hh.lh);
mem[s].hh.rh:=tempptr;s:=tempptr;r:=mem[r].hh.rh;end;mem[s].hh.rh:=q;
end{:1709};{1063:}r:=mem[q].hh.rh;mem[q].hh.rh:=-268435455;
q:=mem[memtop-3].hh.rh;mem[memtop-3].hh.rh:=r;
if eqtb[29361].int>0 then begin p:=q;p:=findprotcharleft(p,false);
w:=charpw(p,0);
if w<>0 then begin k:=newmarginkern(-w,lastleftmostchar,0);
mem[k].hh.rh:=q;q:=k;end;end;
if eqtb[26635].hh.rh<>membot then begin r:=newparamglue(7);
mem[r].hh.rh:=q;q:=r;end{:1063};
{1066:}if curline>lastspecialline then begin curwidth:=secondwidth;
curindent:=secondindent;
end else if eqtb[27158].hh.rh=-268435455 then begin curwidth:=firstwidth
;curindent:=firstindent;
end else begin curwidth:=mem[eqtb[27158].hh.rh+2*curline].int;
curindent:=mem[eqtb[27158].hh.rh+2*curline-1].int;end;
adjusttail:=memtop-5;preadjusttail:=memtop-14;
if eqtb[29360].int>0 then justbox:=hpack(q,curwidth,2)else justbox:=
hpack(q,curwidth,0);mem[justbox+4].int:=curindent{:1066};
{1065:}if eqtb[29933].int<>eqtb[29935].int then mem[justbox+3].int:=eqtb
[29933].int;
if eqtb[29934].int<>eqtb[29935].int then mem[justbox+2].int:=eqtb[29934]
.int;
if(eqtb[29931].int<>eqtb[29935].int)and(curline=curlist.pgfield+1)then
mem[justbox+3].int:=eqtb[29931].int;
if(eqtb[29932].int<>eqtb[29935].int)and(curline+1=bestline)then mem[
justbox+2].int:=eqtb[29932].int;
if memtop-14<>preadjusttail then begin mem[curlist.tailfield].hh.rh:=mem
[memtop-14].hh.rh;curlist.tailfield:=preadjusttail;end;
preadjusttail:=-268435455;appendtovlist(justbox);
if memtop-5<>adjusttail then begin mem[curlist.tailfield].hh.rh:=mem[
memtop-5].hh.rh;curlist.tailfield:=adjusttail;end;
adjusttail:=-268435455{:1065};
{1067:}if curline+1<>bestline then begin q:=eqtb[27429].hh.rh;
if q<>-268435455 then begin r:=curline;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=mem[q+r+1].int;
end else pen:=eqtb[29290].int;q:=eqtb[27430].hh.rh;
if q<>-268435455 then begin r:=curline-curlist.pgfield;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=pen+mem[q+r+1].int;
end else if curline=curlist.pgfield+1 then pen:=pen+eqtb[29282].int;
if d then q:=eqtb[27432].hh.rh else q:=eqtb[27431].hh.rh;
if q<>-268435455 then begin r:=bestline-curline-1;
if r>mem[q+1].int then r:=mem[q+1].int;pen:=pen+mem[q+r+1].int;
end else if curline+2=bestline then if d then pen:=pen+eqtb[29284].int
else pen:=pen+eqtb[29283].int;
if discbreak then pen:=pen+eqtb[29285].int;
if pen<>0 then begin r:=newpenalty(pen);mem[curlist.tailfield].hh.rh:=r;
curlist.tailfield:=r;end;end{:1067}{:1056};incr(curline);
curp:=mem[curp+1].hh.lh;
if curp<>-268435455 then if not postdiscbreak then{1055:}begin r:=memtop
-3;while true do begin q:=mem[r].hh.rh;
if q=mem[curp+1].hh.rh then goto 31;if(q>=himemmin)then goto 31;
if(mem[q].hh.b0<9)then goto 31;
if mem[q].hh.b0=11 then if mem[q].hh.b1<>1 then goto 31;r:=q;
if mem[q].hh.b0=9 then if(eqtb[29389].int>0)then{1708:}if odd(mem[q].hh.
b1)then begin if LRptr<>-268435455 then if mem[LRptr].hh.lh=(4*(mem[q].
hh.b1 div 4)+3)then begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
end else begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[q].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end{:1708};end;
31:if r<>memtop-3 then begin mem[r].hh.rh:=-268435455;
flushnodelist(mem[memtop-3].hh.rh);mem[memtop-3].hh.rh:=q;end;
end{:1055};until curp=-268435455;
if(curline<>bestline)or(mem[memtop-3].hh.rh<>-268435455)then confusion(
1366);curlist.pgfield:=bestline-1;curlist.eTeXauxfield:=LRptr;end;
{:1053}{1072:}{1083:}function reconstitute(j,n:smallnumber;
bchar,hchar:halfword):smallnumber;label 22,30;var p:halfword;t:halfword;
q:fourquarters;currh:halfword;testchar:halfword;w:scaled;k:fontindex;
begin hyphenpassed:=0;t:=memtop-4;w:=0;mem[memtop-4].hh.rh:=-268435455;
{1085:}curl:=hu[j];curq:=t;if j=0 then begin ligaturepresent:=initlig;
p:=initlist;if ligaturepresent then lfthit:=initlft;
while p>-268435455 do begin begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=mem[p].hh.b1;end;
p:=mem[p].hh.rh;end;
end else if curl<256 then begin mem[t].hh.rh:=getavail;t:=mem[t].hh.rh;
mem[t].hh.b0:=hf;mem[t].hh.b1:=curl;end;ligstack:=-268435455;
begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=256;end{:1085};
22:{1086:}if curl=256 then begin k:=bcharlabel[hf];
if k=0 then goto 30 else q:=fontinfo[k].qqqq;
end else begin q:=fontinfo[charbase[hf]+effectivechar(true,hf,curl)].
qqqq;if((q.b2)mod 4)<>1 then goto 30;k:=ligkernbase[hf]+q.b3;
q:=fontinfo[k].qqqq;
if q.b0>128 then begin k:=ligkernbase[hf]+256*q.b2+q.b3+32768-256*(128);
q:=fontinfo[k].qqqq;end;end;
if currh<256 then testchar:=currh else testchar:=curr;
while true do begin if q.b1=testchar then if q.b0<=128 then if currh<256
then begin hyphenpassed:=j;hchar:=256;currh:=256;goto 22;
end else begin if hchar<256 then if odd(hyf[j])then begin hyphenpassed:=
j;hchar:=256;end;
if q.b2<128 then{1088:}begin if curl=256 then lfthit:=true;
if j=n then if ligstack=-268435455 then rthit:=true;
begin if interrupt<>0 then pauseforinstructions;end;
case q.b2 of 1,5:begin curl:=q.b3;ligaturepresent:=true;end;
2,6:begin curr:=q.b3;
if ligstack>-268435455 then mem[ligstack].hh.b1:=curr else begin
ligstack:=newligitem(curr);
if j=n then bchar:=256 else begin p:=getavail;mem[ligstack+1].hh.rh:=p;
mem[p].hh.b1:=hu[j+1];mem[p].hh.b0:=hf;end;end;end;3:begin curr:=q.b3;
p:=ligstack;ligstack:=newligitem(curr);mem[ligstack].hh.rh:=p;end;
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
bchar;if odd(hyf[j])then currh:=hchar else currh:=256;
end else curr:=mem[ligstack].hh.b1;
end else if j=n then goto 30 else begin begin mem[t].hh.rh:=getavail;
t:=mem[t].hh.rh;mem[t].hh.b0:=hf;mem[t].hh.b1:=curr;end;incr(j);
begin if j<n then curr:=hu[j+1]else curr:=bchar;
if odd(hyf[j])then currh:=hchar else currh:=256;end;end;end end;
if q.b2>4 then if q.b2<>7 then goto 30;goto 22;end{:1088};
w:=fontinfo[kernbase[hf]+256*q.b2+q.b3].int;goto 30;end;
if q.b0>=128 then if currh=256 then goto 30 else begin currh:=256;
goto 22;end;k:=k+q.b0+1;q:=fontinfo[k].qqqq;end;30:{:1086};
{1087:}if ligaturepresent then begin p:=newligature(hf,curl,mem[curq].hh
.rh);if lfthit then begin mem[p].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-268435455 then begin incr(mem[p].hh.b1);
rthit:=false;end;mem[curq].hh.rh:=p;t:=p;ligaturepresent:=false;end;
if w<>0 then begin mem[t].hh.rh:=newkern(w);t:=mem[t].hh.rh;w:=0;
mem[t+2].int:=0;end;if ligstack>-268435455 then begin curq:=t;
curl:=mem[ligstack].hh.b1;ligaturepresent:=true;
begin if mem[ligstack+1].hh.rh>-268435455 then begin mem[t].hh.rh:=mem[
ligstack+1].hh.rh;t:=mem[t].hh.rh;incr(j);end;p:=ligstack;
ligstack:=mem[p].hh.rh;freenode(p,2);
if ligstack=-268435455 then begin if j<n then curr:=hu[j+1]else curr:=
bchar;if odd(hyf[j])then currh:=hchar else currh:=256;
end else curr:=mem[ligstack].hh.b1;end;goto 22;end{:1087};
reconstitute:=j;end;{:1083}procedure hyphenate;
label 50,30,40,41,42,45,10;var{1078:}i,j,l:0..65;q,r,s:halfword;
bchar:halfword;{:1078}{1089:}majortail,minortail:halfword;c:ASCIIcode;
cloc:0..63;rcount:integer;hyfnode:halfword;{:1089}{1099:}z:triepointer;
v:integer;{:1099}{1106:}h:hyphpointer;k:strnumber;u:poolpointer;
{:1106}begin{1100:}for j:=0 to hn do hyf[j]:=0;{1107:}h:=hc[1];incr(hn);
hc[hn]:=curlang;for j:=2 to hn do h:=(h+h+hc[j])mod 607;
while true do begin{1108:}k:=hyphword[h];if k=0 then goto 45;
if(strstart[k+1]-strstart[k])=hn then begin j:=1;u:=strstart[k];
repeat if strpool[u]<>hc[j]then goto 30;incr(j);incr(u);until j>hn;
{1109:}s:=hyphlist[h];while s<>-268435455 do begin hyf[mem[s].hh.lh]:=1;
s:=mem[s].hh.rh;end{:1109};decr(hn);goto 40;end;30:{:1108};
h:=hyphlink[h];if h=0 then goto 45;decr(h);end;45:decr(hn){:1107};
if trietrc[curlang+1]<>curlang then goto 10;hc[0]:=0;hc[hn+1]:=0;
hc[hn+2]:=256;
for j:=0 to hn-rhyf+1 do begin z:=trietrl[curlang+1]+hc[j];l:=j;
while hc[l]=trietrc[z]do begin if trietro[z]<>mintrieop then{1101:}begin
v:=trietro[z];repeat v:=v+opstart[curlang];i:=l-hyfdistance[v];
if hyfnum[v]>hyf[i]then hyf[i]:=hyfnum[v];v:=hyfnext[v];
until v=mintrieop;end{:1101};incr(l);z:=trietrl[z]+hc[l];end;end;
40:for j:=0 to lhyf-1 do hyf[j]:=0;
for j:=0 to rhyf-1 do hyf[hn-j]:=0{:1100};
{1079:}for j:=lhyf to hn-rhyf do if odd(hyf[j])then goto 41;goto 10;
41:{:1079};{1080:}q:=mem[hb].hh.rh;mem[hb].hh.rh:=-268435455;
r:=mem[ha].hh.rh;mem[ha].hh.rh:=-268435455;bchar:=hyfbchar;
if(ha>=himemmin)then if mem[ha].hh.b0<>hf then goto 42 else begin
initlist:=ha;initlig:=false;hu[0]:=mem[ha].hh.b1;
end else if mem[ha].hh.b0=6 then if mem[ha+1].hh.b0<>hf then goto 42
else begin initlist:=mem[ha+1].hh.rh;initlig:=true;
initlft:=(mem[ha].hh.b1>1);hu[0]:=mem[ha+1].hh.b1;
if initlist=-268435455 then if initlft then begin hu[0]:=256;
initlig:=false;end;freenode(ha,2);
end else begin if not(r>=himemmin)then if mem[r].hh.b0=6 then if mem[r].
hh.b1>1 then goto 42;j:=1;s:=ha;initlist:=-268435455;goto 50;end;
s:=curp;while mem[s].hh.rh<>ha do s:=mem[s].hh.rh;j:=0;goto 50;42:s:=ha;
j:=0;hu[0]:=256;initlig:=false;initlist:=-268435455;50:flushnodelist(r);
{1090:}repeat l:=j;j:=reconstitute(j,hn,bchar,hyfchar)+1;
if hyphenpassed=0 then begin mem[s].hh.rh:=mem[memtop-4].hh.rh;
while mem[s].hh.rh>-268435455 do s:=mem[s].hh.rh;
if odd(hyf[j-1])then begin l:=j;hyphenpassed:=j-1;
mem[memtop-4].hh.rh:=-268435455;end;end;
if hyphenpassed>0 then{1091:}repeat r:=getnode(2);
mem[r].hh.rh:=mem[memtop-4].hh.rh;mem[r].hh.b0:=7;majortail:=r;
rcount:=0;
while mem[majortail].hh.rh>-268435455 do begin majortail:=mem[majortail]
.hh.rh;incr(rcount);end;i:=hyphenpassed;hyf[i]:=0;
{1092:}minortail:=-268435455;mem[r+1].hh.lh:=-268435455;
hyfnode:=newcharacter(hf,hyfchar);
if hyfnode<>-268435455 then begin incr(i);c:=hu[i];hu[i]:=hyfchar;
begin mem[hyfnode].hh.rh:=avail;avail:=hyfnode;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
while l<=i do begin l:=reconstitute(l,i,fontbchar[hf],256)+1;
if mem[memtop-4].hh.rh>-268435455 then begin if minortail=-268435455
then mem[r+1].hh.lh:=mem[memtop-4].hh.rh else mem[minortail].hh.rh:=mem[
memtop-4].hh.rh;minortail:=mem[memtop-4].hh.rh;
while mem[minortail].hh.rh>-268435455 do minortail:=mem[minortail].hh.rh
;end;end;if hyfnode<>-268435455 then begin hu[i]:=c;l:=i;decr(i);
end{:1092};{1093:}minortail:=-268435455;mem[r+1].hh.rh:=-268435455;
cloc:=0;if bcharlabel[hf]<>0 then begin decr(l);c:=hu[l];cloc:=l;
hu[l]:=256;end;
while l<j do begin repeat l:=reconstitute(l,hn,bchar,256)+1;
if cloc>0 then begin hu[cloc]:=c;cloc:=0;end;
if mem[memtop-4].hh.rh>-268435455 then begin if minortail=-268435455
then mem[r+1].hh.rh:=mem[memtop-4].hh.rh else mem[minortail].hh.rh:=mem[
memtop-4].hh.rh;minortail:=mem[memtop-4].hh.rh;
while mem[minortail].hh.rh>-268435455 do minortail:=mem[minortail].hh.rh
;end;until l>=j;
while l>j do{1094:}begin j:=reconstitute(j,hn,bchar,256)+1;
mem[majortail].hh.rh:=mem[memtop-4].hh.rh;
while mem[majortail].hh.rh>-268435455 do begin majortail:=mem[majortail]
.hh.rh;incr(rcount);end;end{:1094};end{:1093};
{1095:}if rcount>127 then begin mem[s].hh.rh:=mem[r].hh.rh;
mem[r].hh.rh:=-268435455;flushnodelist(r);
end else begin mem[s].hh.rh:=r;mem[r].hh.b1:=rcount;end;
s:=majortail{:1095};hyphenpassed:=j-1;mem[memtop-4].hh.rh:=-268435455;
until not odd(hyf[j-1]){:1091};until j>hn;mem[s].hh.rh:=q{:1090};
flushlist(initlist){:1080};10:end;
{:1072}{1119:}ifdef('INITEX'){1121:}function newtrieop(d,n:smallnumber;
v:trieopcode):trieopcode;label 10;var h:negtrieopsize..trieopsize;
u:trieopcode;l:0..trieopsize;
begin h:=abs(n+313*d+361*v+1009*curlang)mod(trieopsize-negtrieopsize)+
negtrieopsize;while true do begin l:=trieophash[h];
if l=0 then begin if trieopptr=trieopsize then overflow(1376,trieopsize)
;u:=trieused[curlang];
if u=maxtrieop then overflow(1377,maxtrieop-mintrieop);incr(trieopptr);
incr(u);trieused[curlang]:=u;if u>maxopused then maxopused:=u;
hyfdistance[trieopptr]:=d;hyfnum[trieopptr]:=n;hyfnext[trieopptr]:=v;
trieoplang[trieopptr]:=curlang;trieophash[h]:=trieopptr;
trieopval[trieopptr]:=u;newtrieop:=u;goto 10;end;
if(hyfdistance[l]=d)and(hyfnum[l]=n)and(hyfnext[l]=v)and(trieoplang[l]=
curlang)then begin newtrieop:=trieopval[l];goto 10;end;
if h>-trieopsize then decr(h)else h:=trieopsize;end;10:end;
{:1121}{1125:}function trienode(p:triepointer):triepointer;label 10;
var h:triepointer;q:triepointer;
begin h:=abs(triec[p]+1009*trieo[p]+2718*triel[p]+3142*trier[p])mod
triesize;while true do begin q:=triehash[h];
if q=0 then begin triehash[h]:=p;trienode:=p;goto 10;end;
if(triec[q]=triec[p])and(trieo[q]=trieo[p])and(triel[q]=triel[p])and(
trier[q]=trier[p])then begin trienode:=q;goto 10;end;
if h>0 then decr(h)else h:=triesize;end;10:end;
{:1125}{1126:}function compresstrie(p:triepointer):triepointer;
begin if p=0 then compresstrie:=0 else begin triel[p]:=compresstrie(
triel[p]);trier[p]:=compresstrie(trier[p]);compresstrie:=trienode(p);
end;end;{:1126}{1130:}procedure firstfit(p:triepointer);label 45,40;
var h:triepointer;z:triepointer;q:triepointer;c:ASCIIcode;
l,r:triepointer;ll:1..256;begin c:=triec[p];z:=triemin[c];
while true do begin h:=z-c;
{1131:}if triemax<h+256 then begin if triesize<=h+256 then overflow(1378
,triesize);repeat incr(triemax);trietaken[triemax]:=false;
trietrl[triemax]:=triemax+1;trietro[triemax]:=triemax-1;
until triemax=h+256;end{:1131};if trietaken[h]then goto 45;
{1132:}q:=trier[p];
while q>0 do begin if trietrl[h+triec[q]]=0 then goto 45;q:=trier[q];
end;goto 40{:1132};45:z:=trietrl[z];end;40:{1133:}trietaken[h]:=true;
triehash[p]:=h;q:=p;repeat z:=h+triec[q];l:=trietro[z];r:=trietrl[z];
trietro[r]:=l;trietrl[l]:=r;trietrl[z]:=0;
if l<256 then begin if z<256 then ll:=z else ll:=256;
repeat triemin[l]:=r;incr(l);until l=ll;end;q:=trier[q];
until q=0{:1133};end;{:1130}{1134:}procedure triepack(p:triepointer);
var q:triepointer;begin repeat q:=triel[p];
if(q>0)and(triehash[q]=0)then begin firstfit(q);triepack(q);end;
p:=trier[p];until p=0;end;
{:1134}{1136:}procedure triefix(p:triepointer);var q:triepointer;
c:ASCIIcode;z:triepointer;begin z:=triehash[p];repeat q:=triel[p];
c:=triec[p];trietrl[z+c]:=triehash[q];trietrc[z+c]:=c;
trietro[z+c]:=trieo[p];if q>0 then triefix(q);p:=trier[p];until p=0;end;
{:1136}{1137:}procedure newpatterns;label 30,31;var k,l:0..64;
digitsensed:boolean;v:trieopcode;p,q:triepointer;firstchild:boolean;
c:ASCIIcode;
begin if trienotready then begin if eqtb[29327].int<=0 then curlang:=0
else if eqtb[29327].int>255 then curlang:=0 else curlang:=eqtb[29327].
int;scanleftbrace;{1138:}k:=0;hyf[0]:=0;digitsensed:=false;
while true do begin getxtoken;
case curcmd of 11,12:{1139:}if digitsensed or(curchr<48)or(curchr>57)
then begin if curchr=46 then curchr:=0 else begin curchr:=eqtb[27997+
curchr].hh.rh;if curchr=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1384);
end;begin helpptr:=1;helpline[0]:=1383;end;error;end;end;
if k<63 then begin incr(k);hc[k]:=curchr;hyf[k]:=0;digitsensed:=false;
end;end else if k<63 then begin hyf[k]:=curchr-48;digitsensed:=true;
end{:1139};
10,2:begin if k>0 then{1140:}begin{1142:}if hc[1]=0 then hyf[0]:=0;
if hc[k]=0 then hyf[k]:=0;l:=k;v:=mintrieop;
while true do begin if hyf[l]<>0 then v:=newtrieop(k-l,hyf[l],v);
if l>0 then decr(l)else goto 31;end;31:{:1142};q:=0;hc[0]:=curlang;
while l<=k do begin c:=hc[l];incr(l);p:=triel[q];firstchild:=true;
while(p>0)and(c>triec[p])do begin q:=p;p:=trier[q];firstchild:=false;
end;
if(p=0)or(c<triec[p])then{1141:}begin if trieptr=triesize then overflow(
1378,triesize);incr(trieptr);trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1141};q:=p;end;
if trieo[q]<>mintrieop then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1385);
end;begin helpptr:=1;helpline[0]:=1383;end;error;end;trieo[q]:=v;
end{:1140};if curcmd=2 then goto 30;k:=0;hyf[0]:=0;digitsensed:=false;
end;others:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1382);
end;printesc(1380);begin helpptr:=1;helpline[0]:=1383;end;error;end end;
end;30:{:1138};if eqtb[29387].int>0 then{1855:}begin c:=curlang;
firstchild:=false;p:=0;repeat q:=p;p:=trier[q];
until(p=0)or(c<=triec[p]);
if(p=0)or(c<triec[p])then{1141:}begin if trieptr=triesize then overflow(
1378,triesize);incr(trieptr);trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1141};q:=p;{1856:}p:=triel[q];firstchild:=true;
for c:=0 to 255 do if(eqtb[27997+c].hh.rh>0)or((c=255)and firstchild)
then begin if p=0 then{1141:}begin if trieptr=triesize then overflow(
1378,triesize);incr(trieptr);trier[trieptr]:=p;p:=trieptr;triel[p]:=0;
if firstchild then triel[q]:=p else trier[q]:=p;triec[p]:=c;
trieo[p]:=mintrieop;end{:1141}else triec[p]:=c;
trieo[p]:=eqtb[27997+c].hh.rh;q:=p;p:=trier[q];firstchild:=false;end;
if firstchild then triel[q]:=0 else trier[q]:=0{:1856};end{:1855};
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1379);
end;printesc(1380);begin helpptr:=1;helpline[0]:=1381;end;error;
mem[memtop-12].hh.rh:=scantoks(false,false);flushlist(defref);end;end;
{:1137}{1143:}procedure inittrie;var p:triepointer;j,k,t:integer;
r,s:triepointer;begin{1129:}{1122:}opstart[0]:=-mintrieop;
for j:=1 to 255 do opstart[j]:=opstart[j-1]+trieused[j-1];
for j:=1 to trieopptr do trieophash[j]:=opstart[trieoplang[j]]+trieopval
[j];
for j:=1 to trieopptr do while trieophash[j]>j do begin k:=trieophash[j]
;t:=hyfdistance[k];hyfdistance[k]:=hyfdistance[j];hyfdistance[j]:=t;
t:=hyfnum[k];hyfnum[k]:=hyfnum[j];hyfnum[j]:=t;t:=hyfnext[k];
hyfnext[k]:=hyfnext[j];hyfnext[j]:=t;trieophash[j]:=trieophash[k];
trieophash[k]:=k;end{:1122};for p:=0 to triesize do triehash[p]:=0;
trier[0]:=compresstrie(trier[0]);triel[0]:=compresstrie(triel[0]);
for p:=0 to trieptr do triehash[p]:=0;
for p:=0 to 255 do triemin[p]:=p+1;trietrl[0]:=1;triemax:=0{:1129};
if triel[0]<>0 then begin firstfit(triel[0]);triepack(triel[0]);end;
if trier[0]<>0 then{1857:}begin if triel[0]=0 then for p:=0 to 255 do
triemin[p]:=p+2;firstfit(trier[0]);triepack(trier[0]);
hyphstart:=triehash[trier[0]];end{:1857};
{1135:}if triemax=0 then begin for r:=0 to 256 do begin trietrl[r]:=0;
trietro[r]:=mintrieop;trietrc[r]:=0;end;triemax:=256;
end else begin if trier[0]>0 then triefix(trier[0]);
if triel[0]>0 then triefix(triel[0]);r:=0;repeat s:=trietrl[r];
begin trietrl[r]:=0;trietro[r]:=mintrieop;trietrc[r]:=0;end;r:=s;
until r>triemax;end;trietrc[0]:=63;{:1135};trienotready:=false;end;
{:1143}endif('INITEX'){:1119}procedure linebreak(d:boolean);
label 30,31,32,33,34,35,22;var{1038:}q,r,s,prevs:halfword;
f:internalfontnumber;{:1038}{1070:}j:smallnumber;c:0..255;
{:1070}begin packbeginline:=curlist.mlfield;
{992:}mem[memtop-3].hh.rh:=mem[curlist.headfield].hh.rh;
if(curlist.tailfield>=himemmin)then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;
end else if mem[curlist.tailfield].hh.b0<>10 then begin prevtail:=
curlist.tailfield;mem[curlist.tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;
end else begin mem[curlist.tailfield].hh.b0:=12;
deleteglueref(mem[curlist.tailfield+1].hh.lh);
flushnodelist(mem[curlist.tailfield+1].hh.rh);
mem[curlist.tailfield+1].int:=10000;end;
mem[curlist.tailfield].hh.rh:=newparamglue(14);
lastlinefill:=mem[curlist.tailfield].hh.rh;
initcurlang:=curlist.pgfield mod 65536;
initlhyf:=curlist.pgfield div 4194304;
initrhyf:=(curlist.pgfield div 65536)mod 64;popnest;
{:992}{1003:}noshrinkerroryet:=true;
if(mem[eqtb[26635].hh.rh].hh.b1<>0)and(mem[eqtb[26635].hh.rh+3].int<>0)
then begin eqtb[26635].hh.rh:=finiteshrink(eqtb[26635].hh.rh);end;
if(mem[eqtb[26636].hh.rh].hh.b1<>0)and(mem[eqtb[26636].hh.rh+3].int<>0)
then begin eqtb[26636].hh.rh:=finiteshrink(eqtb[26636].hh.rh);end;
q:=eqtb[26635].hh.rh;r:=eqtb[26636].hh.rh;
background[1]:=mem[q+1].int+mem[r+1].int;background[2]:=0;
background[3]:=0;background[4]:=0;background[5]:=0;
background[2+mem[q].hh.b0]:=mem[q+2].int;
background[2+mem[r].hh.b0]:=background[2+mem[r].hh.b0]+mem[r+2].int;
background[6]:=mem[q+3].int+mem[r+3].int;
if eqtb[29360].int>1 then begin background[7]:=0;background[8]:=0;
maxstretchratio:=-1;maxshrinkratio:=-1;curfontstep:=-1;
prevcharp:=-268435455;end;{1843:}dolastlinefit:=false;activenodesize:=3;
if eqtb[29385].int>0 then begin q:=mem[lastlinefill+1].hh.lh;
if(mem[q+2].int>0)and(mem[q].hh.b0>0)then if(background[3]=0)and(
background[4]=0)and(background[5]=0)then begin dolastlinefit:=true;
activenodesize:=5;fillwidth[0]:=0;fillwidth[1]:=0;fillwidth[2]:=0;
fillwidth[mem[q].hh.b0-1]:=mem[q+2].int;end;end{:1843};
{:1003}{1010:}minimumdemerits:=1073741823;
minimaldemerits[3]:=1073741823;minimaldemerits[2]:=1073741823;
minimaldemerits[1]:=1073741823;minimaldemerits[0]:=1073741823;
{:1010}{1024:}if eqtb[27158].hh.rh=-268435455 then if eqtb[29920].int=0
then begin lastspecialline:=0;secondwidth:=eqtb[29906].int;
secondindent:=0;
end else{1025:}begin lastspecialline:=abs(eqtb[29318].int);
if eqtb[29318].int<0 then begin firstwidth:=eqtb[29906].int-abs(eqtb[
29920].int);
if eqtb[29920].int>=0 then firstindent:=eqtb[29920].int else firstindent
:=0;secondwidth:=eqtb[29906].int;secondindent:=0;
end else begin firstwidth:=eqtb[29906].int;firstindent:=0;
secondwidth:=eqtb[29906].int-abs(eqtb[29920].int);
if eqtb[29920].int>=0 then secondindent:=eqtb[29920].int else
secondindent:=0;end;
end{:1025}else begin lastspecialline:=mem[eqtb[27158].hh.rh].hh.lh-1;
secondwidth:=mem[eqtb[27158].hh.rh+2*(lastspecialline+1)].int;
secondindent:=mem[eqtb[27158].hh.rh+2*lastspecialline+1].int;end;
if eqtb[29296].int=0 then easyline:=lastspecialline else easyline:=
268435455{:1024};{1039:}threshold:=eqtb[29277].int;
if threshold>=0 then begin ifdef('STAT')if eqtb[29309].int>0 then begin
begindiagnostic;printnl(1360);end;endif('STAT')secondpass:=false;
finalpass:=false;end else begin threshold:=eqtb[29278].int;
secondpass:=true;finalpass:=(eqtb[29923].int<=0);
ifdef('STAT')if eqtb[29309].int>0 then begindiagnostic;endif('STAT')end;
while true do begin if threshold>10000 then threshold:=10000;
if secondpass then{1068:}begin ifdef('INITEX')if trienotready then
inittrie;endif('INITEX')curlang:=initcurlang;lhyf:=initlhyf;
rhyf:=initrhyf;
if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0 else hyphindex
:=trietrl[hyphstart+curlang];end{:1068};
{1040:}q:=getnode(activenodesize);mem[q].hh.b0:=0;mem[q].hh.b1:=2;
mem[q].hh.rh:=memtop-7;mem[q+1].hh.rh:=-268435455;
mem[q+1].hh.lh:=curlist.pgfield+1;mem[q+2].int:=0;
mem[memtop-7].hh.rh:=q;
if dolastlinefit then{1845:}begin mem[q+3].int:=0;mem[q+4].int:=0;
end{:1845};activewidth[1]:=background[1];activewidth[2]:=background[2];
activewidth[3]:=background[3];activewidth[4]:=background[4];
activewidth[5]:=background[5];activewidth[6]:=background[6];
if eqtb[29360].int>1 then begin activewidth[7]:=background[7];
activewidth[8]:=background[8];end;passive:=-268435455;
printednode:=memtop-3;passnumber:=0;fontinshortdisplay:=0{:1040};
curp:=mem[memtop-3].hh.rh;autobreaking:=true;prevp:=curp;
prevcharp:=-268435455;prevlegal:=-268435455;rejectedcurp:=-268435455;
tryprevbreak:=false;beforerejectedcurp:=false;firstp:=curp;
while(curp<>-268435455)and(mem[memtop-7].hh.rh<>memtop-7)do{1042:}begin
if(curp>=himemmin)then{1043:}begin prevp:=curp;
repeat f:=mem[curp].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,mem[curp].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=curp;
activewidth[7]:=activewidth[7]+charstretch(f,mem[curp].hh.b1);
activewidth[8]:=activewidth[8]+charshrink(f,mem[curp].hh.b1);end;
curp:=mem[curp].hh.rh;until not(curp>=himemmin);end{:1043};
case mem[curp].hh.b0 of 0,1,2:activewidth[1]:=activewidth[1]+mem[curp+1]
.int;
8:{1609:}begin if mem[curp].hh.b1=5 then begin curlang:=mem[curp+1].hh.
rh;lhyf:=mem[curp+1].hh.b0;rhyf:=mem[curp+1].hh.b1;end;
if(mem[curp].hh.b1=12)or(mem[curp].hh.b1=14)then activewidth[1]:=
activewidth[1]+mem[curp+1].int;end{:1609};
10:begin{1044:}if autobreaking then begin if(prevp>=himemmin)then
trybreak(0,0)else if(mem[prevp].hh.b0<9)then trybreak(0,0)else if(mem[
prevp].hh.b0=11)and(mem[prevp].hh.b1<>1)then trybreak(0,0);end;
if(mem[mem[curp+1].hh.lh].hh.b1<>0)and(mem[mem[curp+1].hh.lh+3].int<>0)
then begin mem[curp+1].hh.lh:=finiteshrink(mem[curp+1].hh.lh);end;
q:=mem[curp+1].hh.lh;activewidth[1]:=activewidth[1]+mem[q+1].int;
activewidth[2+mem[q].hh.b0]:=activewidth[2+mem[q].hh.b0]+mem[q+2].int;
activewidth[6]:=activewidth[6]+mem[q+3].int{:1044};
if secondpass and autobreaking then{1071:}begin prevs:=curp;
s:=mem[prevs].hh.rh;
if s<>-268435455 then begin{1073:}while true do begin if(s>=himemmin)
then begin c:=mem[s].hh.b1;hf:=mem[s].hh.b0;
end else if mem[s].hh.b0=6 then if mem[s+1].hh.rh=-268435455 then goto
22 else begin q:=mem[s+1].hh.rh;c:=mem[q].hh.b1;hf:=mem[q].hh.b0;
end else if(mem[s].hh.b0=11)and(mem[s].hh.b1=0)then goto 22 else if(mem[
s].hh.b0=9)and(mem[s].hh.b1>=4)then goto 22 else if mem[s].hh.b0=8 then
begin{1610:}if mem[s].hh.b1=5 then begin curlang:=mem[s+1].hh.rh;
lhyf:=mem[s+1].hh.b0;rhyf:=mem[s+1].hh.b1;
if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0 else hyphindex
:=trietrl[hyphstart+curlang];end{:1610};goto 22;end else goto 31;
if hyphindex=0 then hc[0]:=eqtb[27997+c].hh.rh else if trietrc[hyphindex
+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]<>0 then if(hc[0]=c)or(eqtb[29315].int>0)then goto 32 else goto
31;22:prevs:=s;s:=mem[prevs].hh.rh;end;32:hyfchar:=hyphenchar[hf];
if hyfchar<0 then goto 31;if hyfchar>255 then goto 31;ha:=prevs{:1073};
if lhyf+rhyf>63 then goto 31;{1074:}hn:=0;
while true do begin if(s>=himemmin)then begin if mem[s].hh.b0<>hf then
goto 33;hyfbchar:=mem[s].hh.b1;c:=hyfbchar;
if hyphindex=0 then hc[0]:=eqtb[27997+c].hh.rh else if trietrc[hyphindex
+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]=0 then goto 33;if hn=63 then goto 33;hb:=s;incr(hn);hu[hn]:=c;
hc[hn]:=hc[0];hyfbchar:=256;
end else if mem[s].hh.b0=6 then{1075:}begin if mem[s+1].hh.b0<>hf then
goto 33;j:=hn;q:=mem[s+1].hh.rh;
if q>-268435455 then hyfbchar:=mem[q].hh.b1;
while q>-268435455 do begin c:=mem[q].hh.b1;
if hyphindex=0 then hc[0]:=eqtb[27997+c].hh.rh else if trietrc[hyphindex
+c]<>c then hc[0]:=0 else hc[0]:=trietro[hyphindex+c];
if hc[0]=0 then goto 33;if j=63 then goto 33;incr(j);hu[j]:=c;
hc[j]:=hc[0];q:=mem[q].hh.rh;end;hb:=s;hn:=j;
if odd(mem[s].hh.b1)then hyfbchar:=fontbchar[hf]else hyfbchar:=256;
end{:1075}else if(mem[s].hh.b0=11)and(mem[s].hh.b1=0)then begin hb:=s;
hyfbchar:=fontbchar[hf];end else goto 33;s:=mem[s].hh.rh;end;33:{:1074};
{1076:}if hn<lhyf+rhyf then goto 31;
while true do begin if not((s>=himemmin))then case mem[s].hh.b0 of 6:;
11:if mem[s].hh.b1<>0 then goto 34;8,10,12,3,5,4:goto 34;
9:if mem[s].hh.b1>=4 then goto 34 else goto 31;others:goto 31 end;
s:=mem[s].hh.rh;end;34:{:1076};hyphenate;end;31:end{:1071};end;
11:if mem[curp].hh.b1=1 then begin if not(mem[curp].hh.rh>=himemmin)and
autobreaking then if mem[mem[curp].hh.rh].hh.b0=10 then trybreak(0,0);
activewidth[1]:=activewidth[1]+mem[curp+1].int;
end else begin activewidth[1]:=activewidth[1]+mem[curp+1].int;
if(eqtb[29360].int>1)and(mem[curp].hh.b1=0)then begin activewidth[7]:=
activewidth[7]+kernstretch(curp);
activewidth[8]:=activewidth[8]+kernshrink(curp);end;end;
6:begin f:=mem[curp+1].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,mem[curp+1].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=curp;
activewidth[7]:=activewidth[7]+charstretch(f,mem[curp+1].hh.b1);
activewidth[8]:=activewidth[8]+charshrink(f,mem[curp+1].hh.b1);end;end;
7:{1045:}begin s:=mem[curp+1].hh.lh;discwidth[1]:=0;
if eqtb[29360].int>1 then begin discwidth[7]:=0;discwidth[8]:=0;end;
if s=-268435455 then trybreak(eqtb[29281].int,1)else begin repeat{1046:}
if(s>=himemmin)then begin f:=mem[s].hh.b0;
discwidth[1]:=discwidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[s].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=s;
discwidth[7]:=discwidth[7]+charstretch(f,mem[s].hh.b1);
discwidth[8]:=discwidth[8]+charshrink(f,mem[s].hh.b1);end;
end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
discwidth[1]:=discwidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f]+
effectivechar(true,f,mem[s+1].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=s;
discwidth[7]:=discwidth[7]+charstretch(f,mem[s+1].hh.b1);
discwidth[8]:=discwidth[8]+charshrink(f,mem[s+1].hh.b1);end;end;
0,1,2,11:begin discwidth[1]:=discwidth[1]+mem[s+1].int;
if(mem[s].hh.b0=11)and(eqtb[29360].int>1)and(mem[s].hh.b1=0)then begin
discwidth[7]:=discwidth[7]+kernstretch(s);
discwidth[8]:=discwidth[8]+kernshrink(s);end;end;
others:confusion(1364)end{:1046};s:=mem[s].hh.rh;until s=-268435455;
activewidth[1]:=activewidth[1]+discwidth[1];
if eqtb[29360].int>1 then begin activewidth[7]:=activewidth[7]+discwidth
[7];activewidth[8]:=activewidth[8]+discwidth[8];end;
trybreak(eqtb[29280].int,1);activewidth[1]:=activewidth[1]-discwidth[1];
if eqtb[29360].int>1 then begin activewidth[7]:=activewidth[7]-discwidth
[7];activewidth[8]:=activewidth[8]-discwidth[8];end;end;
r:=mem[curp].hh.b1;s:=mem[curp].hh.rh;
while r>0 do begin{1047:}if(s>=himemmin)then begin f:=mem[s].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,mem[s].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=s;
activewidth[7]:=activewidth[7]+charstretch(f,mem[s].hh.b1);
activewidth[8]:=activewidth[8]+charshrink(f,mem[s].hh.b1);end;
end else case mem[s].hh.b0 of 6:begin f:=mem[s+1].hh.b0;
activewidth[1]:=activewidth[1]+fontinfo[widthbase[f]+fontinfo[charbase[f
]+effectivechar(true,f,mem[s+1].hh.b1)].qqqq.b0].int;
if(eqtb[29360].int>1)and checkexpandpars(f)then begin prevcharp:=s;
activewidth[7]:=activewidth[7]+charstretch(f,mem[s+1].hh.b1);
activewidth[8]:=activewidth[8]+charshrink(f,mem[s+1].hh.b1);end;end;
0,1,2,11:begin activewidth[1]:=activewidth[1]+mem[s+1].int;
if(mem[s].hh.b0=11)and(eqtb[29360].int>1)and(mem[s].hh.b1=0)then begin
activewidth[7]:=activewidth[7]+kernstretch(s);
activewidth[8]:=activewidth[8]+kernshrink(s);end;end;
others:confusion(1365)end{:1047};decr(r);s:=mem[s].hh.rh;end;
prevp:=curp;curp:=s;goto 35;end{:1045};
9:begin if mem[curp].hh.b1<4 then autobreaking:=odd(mem[curp].hh.b1);
begin if not(mem[curp].hh.rh>=himemmin)and autobreaking then if mem[mem[
curp].hh.rh].hh.b0=10 then trybreak(0,0);
activewidth[1]:=activewidth[1]+mem[curp+1].int;end;end;
12:trybreak(mem[curp+1].int,0);4,3,5:;others:confusion(1363)end;
prevp:=curp;curp:=mem[curp].hh.rh;35:end{:1042};
if curp=-268435455 then{1049:}begin trybreak(-10000,1);
if mem[memtop-7].hh.rh<>memtop-7 then begin{1050:}r:=mem[memtop-7].hh.rh
;fewestdemerits:=1073741823;
repeat if mem[r].hh.b0<>2 then if mem[r+2].int<fewestdemerits then begin
fewestdemerits:=mem[r+2].int;bestbet:=r;end;r:=mem[r].hh.rh;
until r=memtop-7;bestline:=mem[bestbet+1].hh.lh{:1050};
if eqtb[29296].int=0 then goto 30;{1051:}begin r:=mem[memtop-7].hh.rh;
actuallooseness:=0;
repeat if mem[r].hh.b0<>2 then begin linediff:=mem[r+1].hh.lh-bestline;
if((linediff<actuallooseness)and(eqtb[29296].int<=linediff))or((linediff
>actuallooseness)and(eqtb[29296].int>=linediff))then begin bestbet:=r;
actuallooseness:=linediff;fewestdemerits:=mem[r+2].int;
end else if(linediff=actuallooseness)and(mem[r+2].int<fewestdemerits)
then begin bestbet:=r;fewestdemerits:=mem[r+2].int;end;end;
r:=mem[r].hh.rh;until r=memtop-7;bestline:=mem[bestbet+1].hh.lh;
end{:1051};if(actuallooseness=eqtb[29296].int)or finalpass then goto 30;
end;end{:1049};{1041:}q:=mem[memtop-7].hh.rh;
while q<>memtop-7 do begin curp:=mem[q].hh.rh;
if mem[q].hh.b0=2 then freenode(q,9)else freenode(q,activenodesize);
q:=curp;end;q:=passive;while q<>-268435455 do begin curp:=mem[q].hh.rh;
freenode(q,2);q:=curp;end{:1041};
if not secondpass then begin ifdef('STAT')if eqtb[29309].int>0 then
printnl(1361);endif('STAT')threshold:=eqtb[29278].int;secondpass:=true;
finalpass:=(eqtb[29923].int<=0);
end else begin ifdef('STAT')if eqtb[29309].int>0 then printnl(1362);
endif('STAT')background[2]:=background[2]+eqtb[29923].int;
finalpass:=true;end;end;
30:ifdef('STAT')if eqtb[29309].int>0 then begin enddiagnostic(true);
normalizeselector;end;
endif('STAT')if dolastlinefit then{1853:}if mem[bestbet+3].int=0 then
dolastlinefit:=false else begin q:=newspec(mem[lastlinefill+1].hh.lh);
deleteglueref(mem[lastlinefill+1].hh.lh);
mem[q+1].int:=mem[q+1].int+mem[bestbet+3].int-mem[bestbet+4].int;
mem[q+2].int:=0;mem[lastlinefill+1].hh.lh:=q;end{:1853};{:1039};
{1052:}postlinebreak(d){:1052};{1041:}q:=mem[memtop-7].hh.rh;
while q<>memtop-7 do begin curp:=mem[q].hh.rh;
if mem[q].hh.b0=2 then freenode(q,9)else freenode(q,activenodesize);
q:=curp;end;q:=passive;while q<>-268435455 do begin curp:=mem[q].hh.rh;
freenode(q,2);q:=curp;end{:1041};packbeginline:=0;end;
{1656:}function eTeXenabled(b:boolean;j:quarterword;k:halfword):boolean;
begin if not b then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(792);
end;printcmdchr(j,k);begin helpptr:=1;helpline[0]:=1995;end;error;end;
eTeXenabled:=b;end;{:1656}{1679:}procedure showsavegroups;
label 41,42,40,30;var p:0..nestsize;m:-209..209;v:savepointer;
l:quarterword;c:groupcode;a:-1..1;i:integer;j:quarterword;s:strnumber;
begin p:=nestptr;nest[p]:=curlist;v:=saveptr;l:=curlevel;c:=curgroup;
saveptr:=curboundary;decr(curlevel);a:=1;printnl(345);println;
while true do begin printnl(380);printgroup(true);
if curgroup=0 then goto 30;repeat m:=nest[p].modefield;
if p>0 then decr(p)else m:=1;until m<>105;print(286);
case curgroup of 1:begin incr(p);goto 42;end;2,3:s:=1486;4:s:=1396;
5:s:=1485;6:if a=0 then begin if m=-1 then s:=608 else s:=627;a:=1;
goto 41;end else begin if a=1 then print(2034)else printesc(1322);
if p>=a then p:=p-a;a:=0;goto 40;end;7:begin incr(p);a:=-1;
printesc(615);goto 42;end;8:begin printesc(415);goto 40;end;9:goto 42;
10,13:begin if curgroup=10 then printesc(358)else printesc(613);
for i:=1 to 3 do if i<=savestack[saveptr-2].int then print(1282);
goto 42;end;
11:begin if savestack[saveptr-2].int=255 then printesc(361)else begin
printesc(337);printint(savestack[saveptr-2].int);end;goto 42;end;
12:begin s:=628;goto 41;end;14:begin incr(p);printesc(597);goto 40;end;
15:begin if m=209 then printchar(36)else if nest[p].modefield=209 then
begin printcmdchr(48,savestack[saveptr-2].int);goto 40;end;
printchar(36);goto 40;end;
16:begin if mem[nest[p+1].eTeXauxfield].hh.b0=30 then printesc(1298)else
printesc(1300);goto 40;end;end;{1681:}i:=savestack[saveptr-4].int;
if i<>0 then if i<1073741824 then begin if abs(nest[p].modefield)=1 then
j:=21 else j:=22;if i>0 then printcmdchr(j,0)else printcmdchr(j,1);
printscaled(abs(i));print(312);
end else if i<1073807360 then begin if i>=1073774592 then begin printesc
(1603);i:=i-(32768);end;printesc(625);printint(i-1073741824);
printchar(61);end else printcmdchr(31,i-(1073807261)){:1681};
41:printesc(s);
{1680:}if savestack[saveptr-2].int<>0 then begin printchar(32);
if savestack[saveptr-3].int=0 then print(1258)else print(1259);
printscaled(savestack[saveptr-2].int);print(312);end{:1680};
42:printchar(123);40:printchar(41);decr(curlevel);
curgroup:=savestack[saveptr].hh.b1;
saveptr:=savestack[saveptr].hh.rh end;30:saveptr:=v;curlevel:=l;
curgroup:=c;end;{:1679}{1695:}procedure newinteraction;forward;
{:1695}{:991}{1111:}procedure newhyphexceptions;label 21,10,40,45,46;
var n:0..64;j:0..64;h:hyphpointer;k:strnumber;p:halfword;q:halfword;
s:strnumber;u,v:poolpointer;begin scanleftbrace;
if eqtb[29327].int<=0 then curlang:=0 else if eqtb[29327].int>255 then
curlang:=0 else curlang:=eqtb[29327].int;
ifdef('INITEX')if trienotready then begin hyphindex:=0;goto 46;end;
endif('INITEX')if trietrc[hyphstart+curlang]<>curlang then hyphindex:=0
else hyphindex:=trietrl[hyphstart+curlang];46:{1112:}n:=0;p:=-268435455;
while true do begin getxtoken;
21:case curcmd of 11,12,68:{1114:}if curchr=45 then{1115:}begin if n<63
then begin q:=getavail;mem[q].hh.rh:=p;mem[q].hh.lh:=n;p:=q;end;
end{:1115}else begin if hyphindex=0 then hc[0]:=eqtb[27997+curchr].hh.rh
else if trietrc[hyphindex+curchr]<>curchr then hc[0]:=0 else hc[0]:=
trietro[hyphindex+curchr];
if hc[0]=0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1372);
end;begin helpptr:=2;helpline[1]:=1373;helpline[0]:=1374;end;error;
end else if n<63 then begin incr(n);hc[n]:=hc[0];end;end{:1114};
16:begin scancharnum;curchr:=curval;curcmd:=68;goto 21;end;
10,2:begin if n>1 then{1116:}begin incr(n);hc[n]:=curlang;
begin if poolptr+n>poolsize then overflow(259,poolsize-initpoolptr);end;
h:=0;for j:=1 to n do begin h:=(h+h+hc[j])mod 607;
begin strpool[poolptr]:=hc[j];incr(poolptr);end;end;s:=makestring;
{1117:}if hyphnext<=607 then while(hyphnext>0)and(hyphword[hyphnext-1]>0
)do decr(hyphnext);
if(hyphcount=hyphsize)or(hyphnext=0)then overflow(1375,hyphsize);
incr(hyphcount);while hyphword[h]<>0 do begin{1118:}k:=hyphword[h];
if(strstart[k+1]-strstart[k])<>(strstart[s+1]-strstart[s])then goto 45;
u:=strstart[k];v:=strstart[s];
repeat if strpool[u]<>strpool[v]then goto 45;incr(u);incr(v);
until u=strstart[k+1];begin decr(strptr);poolptr:=strstart[strptr];end;
s:=hyphword[h];decr(hyphcount);goto 40;45:{:1118};
if hyphlink[h]=0 then begin hyphlink[h]:=hyphnext;
if hyphnext>=hyphsize then hyphnext:=607;
if hyphnext>607 then incr(hyphnext);end;h:=hyphlink[h]-1;end;
40:hyphword[h]:=s;hyphlist[h]:=p{:1117};end{:1116};
if curcmd=2 then goto 10;n:=0;p:=-268435455;end;
others:{1113:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(792);
end;printesc(1368);print(1369);begin helpptr:=2;helpline[1]:=1370;
helpline[0]:=1371;end;error;end{:1113}end;end{:1112};10:end;
{:1111}{1145:}function prunepagetop(p:halfword;s:boolean):halfword;
label 60;var prevp:halfword;q,r:halfword;begin prevp:=memtop-3;
mem[memtop-3].hh.rh:=p;
while p<>-268435455 do case mem[p].hh.b0 of 0,1,2:{1146:}begin q:=
newskipparam(10);mem[prevp].hh.rh:=q;mem[q].hh.rh:=p;
if mem[tempptr+1].int>mem[p+3].int then mem[tempptr+1].int:=mem[tempptr
+1].int-mem[p+3].int else mem[tempptr+1].int:=0;p:=-268435455;
end{:1146};
8,4,3:begin if(mem[p].hh.b0=8)and((mem[p].hh.b1=37)or(mem[p].hh.b1=38))
then begin print(1386);goto 60;end;prevp:=p;p:=mem[prevp].hh.rh;end;
10,11,12:begin 60:{print(1387);shownodelist(p);println;}q:=p;
p:=mem[q].hh.rh;mem[q].hh.rh:=-268435455;mem[prevp].hh.rh:=p;
if s then begin if discptr[3]=-268435455 then discptr[3]:=q else mem[r].
hh.rh:=q;r:=q;end else flushnodelist(q);end;others:confusion(1388)end;
prunepagetop:=mem[memtop-3].hh.rh;end;
{:1145}{1147:}function vertbreak(p:halfword;h,d:scaled):halfword;
label 30,45,90;var prevp:halfword;q,r:halfword;pi:integer;b:integer;
leastcost:integer;bestplace:halfword;prevdp:scaled;t:smallnumber;
begin prevp:=p;leastcost:=1073741823;activewidth[1]:=0;
activewidth[2]:=0;activewidth[3]:=0;activewidth[4]:=0;activewidth[5]:=0;
activewidth[6]:=0;prevdp:=0;
while true do begin{1149:}if p=-268435455 then pi:=-10000 else{1150:}
case mem[p].hh.b0 of 0,1,2:begin activewidth[1]:=activewidth[1]+prevdp+
mem[p+3].int;prevdp:=mem[p+2].int;goto 45;end;
8:{1612:}begin if(mem[p].hh.b1=12)or(mem[p].hh.b1=14)then begin
activewidth[1]:=activewidth[1]+prevdp+mem[p+2].int;prevdp:=mem[p+3].int;
end;goto 45;end{:1612};10:if(mem[prevp].hh.b0<9)then pi:=0 else goto 90;
11:begin if mem[p].hh.rh=-268435455 then t:=12 else t:=mem[mem[p].hh.rh]
.hh.b0;if t=10 then pi:=0 else goto 90;end;12:pi:=mem[p+1].int;
4,3:goto 45;others:confusion(1389)end{:1150};
{1151:}if pi<10000 then begin{1152:}if activewidth[1]<h then if(
activewidth[3]<>0)or(activewidth[4]<>0)or(activewidth[5]<>0)then b:=0
else b:=badness(h-activewidth[1],activewidth[2])else if activewidth[1]-h
>activewidth[6]then b:=1073741823 else b:=badness(activewidth[1]-h,
activewidth[6]){:1152};
if b<1073741823 then if pi<=-10000 then b:=pi else if b<10000 then b:=b+
pi else b:=100000;if b<=leastcost then begin bestplace:=p;leastcost:=b;
bestheightplusdepth:=activewidth[1]+prevdp;end;
if(b=1073741823)or(pi<=-10000)then goto 30;end{:1151};
if(mem[p].hh.b0<10)or(mem[p].hh.b0>11)then goto 45;
90:{1153:}if mem[p].hh.b0=11 then q:=p else begin q:=mem[p+1].hh.lh;
activewidth[2+mem[q].hh.b0]:=activewidth[2+mem[q].hh.b0]+mem[q+2].int;
activewidth[6]:=activewidth[6]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin if isbitset(eqtb[29388
].int,1)then begin oldselectorignorederr:=selector;selector:=18;
writeln(logfile);write(logfile,'ignored: ');print(1390);
selector:=oldselectorignorederr;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1390);
end;begin helpptr:=4;helpline[3]:=1391;helpline[2]:=1392;
helpline[1]:=1393;helpline[0]:=1345;end;error;end;r:=newspec(q);
mem[r].hh.b1:=0;deleteglueref(q);mem[p+1].hh.lh:=r;q:=r;end;end;
activewidth[1]:=activewidth[1]+prevdp+mem[q+1].int;prevdp:=0{:1153};
45:if prevdp>d then begin activewidth[1]:=activewidth[1]+prevdp-d;
prevdp:=d;end;{:1149};prevp:=p;p:=mem[prevp].hh.rh;end;
30:vertbreak:=bestplace;end;
{:1147}{1154:}{1825:}function domarks(a,l:smallnumber;
q:halfword):boolean;var i:smallnumber;
begin if l<4 then begin for i:=0 to 15 do begin if odd(i)then curptr:=
mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div 2)+1].hh.lh;
if curptr<>-268435455 then if domarks(a,l+1,curptr)then begin if odd(i)
then mem[q+(i div 2)+1].hh.rh:=-268435455 else mem[q+(i div 2)+1].hh.lh
:=-268435455;decr(mem[q].hh.b1);end;end;
if mem[q].hh.b1=0 then begin freenode(q,9);q:=-268435455;end;
end else begin case a of{1826:}0:if mem[q+2].hh.rh<>-268435455 then
begin deletetokenref(mem[q+2].hh.rh);mem[q+2].hh.rh:=-268435455;
deletetokenref(mem[q+3].hh.lh);mem[q+3].hh.lh:=-268435455;end;
{:1826}{1828:}1:if mem[q+2].hh.lh<>-268435455 then begin if mem[q+1].hh.
lh<>-268435455 then deletetokenref(mem[q+1].hh.lh);
deletetokenref(mem[q+1].hh.rh);mem[q+1].hh.rh:=-268435455;
if mem[mem[q+2].hh.lh].hh.rh=-268435455 then begin deletetokenref(mem[q
+2].hh.lh);mem[q+2].hh.lh:=-268435455;
end else incr(mem[mem[q+2].hh.lh].hh.lh);mem[q+1].hh.lh:=mem[q+2].hh.lh;
end;{:1828}{1829:}2:if(mem[q+1].hh.lh<>-268435455)and(mem[q+1].hh.rh=
-268435455)then begin mem[q+1].hh.rh:=mem[q+1].hh.lh;
incr(mem[mem[q+1].hh.lh].hh.lh);end;
{:1829}{1831:}ifdef('INITEX')3:for i:=0 to 4 do begin if odd(i)then
curptr:=mem[q+(i div 2)+1].hh.rh else curptr:=mem[q+(i div 2)+1].hh.lh;
if curptr<>-268435455 then begin deletetokenref(curptr);
if odd(i)then mem[q+(i div 2)+1].hh.rh:=-268435455 else mem[q+(i div 2)
+1].hh.lh:=-268435455;end;end;endif('INITEX'){:1831}end;
if mem[q+2].hh.lh=-268435455 then if mem[q+3].hh.lh=-268435455 then
begin freenode(q,4);q:=-268435455;end;end;domarks:=(q=-268435455);end;
{:1825}function vsplit(n:halfword;h:scaled):halfword;label 10,30;
var v:halfword;p:halfword;q:halfword;begin curval:=n;
if curval<256 then v:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then v:=-268435455 else v:=mem[curptr+1].hh.rh;end;
flushnodelist(discptr[3]);discptr[3]:=-268435455;
if saroot[6]<>-268435455 then if domarks(0,0,saroot[6])then saroot[6]:=
-268435455;
if curmark[3]<>-268435455 then begin deletetokenref(curmark[3]);
curmark[3]:=-268435455;deletetokenref(curmark[4]);
curmark[4]:=-268435455;end;
{1155:}if v=-268435455 then begin vsplit:=-268435455;goto 10;end;
if mem[v].hh.b0<>1 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(345);
end;printesc(1394);print(1395);printesc(1396);begin helpptr:=2;
helpline[1]:=1397;helpline[0]:=1398;end;error;vsplit:=-268435455;
goto 10;end{:1155};q:=vertbreak(mem[v+5].hh.rh,h,eqtb[29909].int);
{1156:}p:=mem[v+5].hh.rh;
if p=q then mem[v+5].hh.rh:=-268435455 else while true do begin if mem[p
].hh.b0=4 then if mem[p+1].hh.lh<>0 then{1827:}begin findsaelement(6,mem
[p+1].hh.lh,true);
if mem[curptr+2].hh.rh=-268435455 then begin mem[curptr+2].hh.rh:=mem[p
+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end else deletetokenref(mem[curptr+3].hh.lh);
mem[curptr+3].hh.lh:=mem[p+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end{:1827}else if curmark[3]=-268435455 then begin curmark[3]:=mem[p+1].
hh.rh;curmark[4]:=curmark[3];
mem[curmark[3]].hh.lh:=mem[curmark[3]].hh.lh+2;
end else begin deletetokenref(curmark[4]);curmark[4]:=mem[p+1].hh.rh;
incr(mem[curmark[4]].hh.lh);end;
if mem[p].hh.rh=q then begin mem[p].hh.rh:=-268435455;goto 30;end;
p:=mem[p].hh.rh;end;30:{:1156};q:=prunepagetop(q,eqtb[29386].int>0);
p:=mem[v+5].hh.rh;freenode(v,9);
if q<>-268435455 then q:=vpackage(q,0,1,1073741823);
if curval<256 then eqtb[27433+curval].hh.rh:=q else begin findsaelement(
4,curval,false);if curptr<>-268435455 then begin mem[curptr+1].hh.rh:=q;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;
vsplit:=vpackage(p,h,0,eqtb[29909].int);10:end;
{:1154}{1162:}procedure printtotals;begin printscaled(pagesofar[1]);
if pagesofar[2]<>0 then begin print(317);printscaled(pagesofar[2]);
print(345);end;if pagesofar[3]<>0 then begin print(317);
printscaled(pagesofar[3]);print(316);end;
if pagesofar[4]<>0 then begin print(317);printscaled(pagesofar[4]);
print(1407);end;if pagesofar[5]<>0 then begin print(317);
printscaled(pagesofar[5]);print(1408);end;
if pagesofar[6]<>0 then begin print(318);printscaled(pagesofar[6]);end;
end;{:1162}{1164:}procedure freezepagespecs(s:smallnumber);
begin pagecontents:=s;pagesofar[0]:=eqtb[29907].int;
pagemaxdepth:=eqtb[29908].int;pagesofar[7]:=0;pagesofar[1]:=0;
pagesofar[2]:=0;pagesofar[3]:=0;pagesofar[4]:=0;pagesofar[5]:=0;
pagesofar[6]:=0;leastpagecost:=1073741823;
ifdef('STAT')if eqtb[29310].int>0 then begin begindiagnostic;
printnl(1416);printscaled(pagesofar[0]);print(1417);
printscaled(pagemaxdepth);enddiagnostic(false);end;endif('STAT')end;
{:1164}{1169:}procedure boxerror(n:eightbits);begin error;
begindiagnostic;printnl(1010);showbox(eqtb[27433+n].hh.rh);
enddiagnostic(true);flushnodelist(eqtb[27433+n].hh.rh);
eqtb[27433+n].hh.rh:=-268435455;end;
{:1169}{1170:}procedure ensurevbox(n:eightbits);var p:halfword;
begin p:=eqtb[27433+n].hh.rh;
if p<>-268435455 then if mem[p].hh.b0=0 then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(264);
print(1418);end;begin helpptr:=3;helpline[2]:=1419;helpline[1]:=1420;
helpline[0]:=1421;end;boxerror(n);end;end;
{:1170}{1171:}{1189:}procedure fireup(c:halfword);label 10;
var p,q,r,s:halfword;prevp:halfword;n:0..255;wait:boolean;
savevbadness:integer;savevfuzz:scaled;savesplittopskip:halfword;
begin{1190:}if mem[bestpagebreak].hh.b0=12 then begin geqworddefine(
29316,mem[bestpagebreak+1].int);mem[bestpagebreak+1].int:=10000;
end else geqworddefine(29316,10000){:1190};
if saroot[6]<>-268435455 then if domarks(1,0,saroot[6])then saroot[6]:=
-268435455;
if curmark[2]<>-268435455 then begin if curmark[0]<>-268435455 then
deletetokenref(curmark[0]);curmark[0]:=curmark[2];
incr(mem[curmark[0]].hh.lh);deletetokenref(curmark[1]);
curmark[1]:=-268435455;end;
{1191:}if c=bestpagebreak then bestpagebreak:=-268435455;
{1192:}if eqtb[27688].hh.rh<>-268435455 then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(264);
print(345);end;printesc(430);print(1431);begin helpptr:=2;
helpline[1]:=1432;helpline[0]:=1421;end;boxerror(255);end{:1192};
insertpenalties:=0;savesplittopskip:=eqtb[26638].hh.rh;
if eqtb[29330].int<=0 then{1195:}begin r:=mem[memtop].hh.rh;
while r<>memtop do begin if mem[r+2].hh.lh<>-268435455 then begin n:=mem
[r].hh.b1;ensurevbox(n);
if eqtb[27433+n].hh.rh=-268435455 then eqtb[27433+n].hh.rh:=newnullbox;
p:=eqtb[27433+n].hh.rh+5;
while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;mem[r+2].hh.rh:=p;end;
r:=mem[r].hh.rh;end;end{:1195};q:=memtop-4;mem[q].hh.rh:=-268435455;
prevp:=memtop-2;p:=mem[prevp].hh.rh;
while p<>bestpagebreak do begin if mem[p].hh.b0=3 then begin if eqtb[
29330].int<=0 then{1197:}begin r:=mem[memtop].hh.rh;
while mem[r].hh.b1<>mem[p].hh.b1 do r:=mem[r].hh.rh;
if mem[r+2].hh.lh=-268435455 then wait:=true else begin wait:=false;
s:=mem[r+2].hh.rh;mem[s].hh.rh:=mem[p+4].hh.lh;
if mem[r+2].hh.lh=p then{1198:}begin if mem[r].hh.b0=1 then if(mem[r+1].
hh.lh=p)and(mem[r+1].hh.rh<>-268435455)then begin while mem[s].hh.rh<>
mem[r+1].hh.rh do s:=mem[s].hh.rh;mem[s].hh.rh:=-268435455;
eqtb[26638].hh.rh:=mem[p+4].hh.rh;
mem[p+4].hh.lh:=prunepagetop(mem[r+1].hh.rh,false);
if mem[p+4].hh.lh<>-268435455 then begin tempptr:=vpackage(mem[p+4].hh.
lh,0,1,1073741823);mem[p+3].int:=mem[tempptr+3].int+mem[tempptr+2].int;
freenode(tempptr,9);wait:=true;end;end;mem[r+2].hh.lh:=-268435455;
n:=mem[r].hh.b1;tempptr:=mem[eqtb[27433+n].hh.rh+5].hh.rh;
freenode(eqtb[27433+n].hh.rh,9);
eqtb[27433+n].hh.rh:=vpackage(tempptr,0,1,1073741823);
end{:1198}else begin while mem[s].hh.rh<>-268435455 do s:=mem[s].hh.rh;
mem[r+2].hh.rh:=s;end;end;{1199:}mem[prevp].hh.rh:=mem[p].hh.rh;
mem[p].hh.rh:=-268435455;if wait then begin mem[q].hh.rh:=p;q:=p;
incr(insertpenalties);end else begin deleteglueref(mem[p+4].hh.rh);
freenode(p,5);end;p:=prevp{:1199};end{:1197};
end else if mem[p].hh.b0=4 then if mem[p+1].hh.lh<>0 then{1830:}begin
findsaelement(6,mem[p+1].hh.lh,true);
if mem[curptr+1].hh.rh=-268435455 then begin mem[curptr+1].hh.rh:=mem[p
+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);end;
if mem[curptr+2].hh.lh<>-268435455 then deletetokenref(mem[curptr+2].hh.
lh);mem[curptr+2].hh.lh:=mem[p+1].hh.rh;incr(mem[mem[p+1].hh.rh].hh.lh);
end{:1830}else{1193:}begin if curmark[1]=-268435455 then begin curmark[1
]:=mem[p+1].hh.rh;incr(mem[curmark[1]].hh.lh);end;
if curmark[2]<>-268435455 then deletetokenref(curmark[2]);
curmark[2]:=mem[p+1].hh.rh;incr(mem[curmark[2]].hh.lh);end{:1193};
prevp:=p;p:=mem[prevp].hh.rh;end;eqtb[26638].hh.rh:=savesplittopskip;
{1194:}if p<>-268435455 then begin if mem[memtop-1].hh.rh=-268435455
then if nestptr=0 then curlist.tailfield:=pagetail else nest[0].
tailfield:=pagetail;mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;
mem[memtop-1].hh.rh:=p;mem[prevp].hh.rh:=-268435455;end;
savevbadness:=eqtb[29304].int;eqtb[29304].int:=10000;
savevfuzz:=eqtb[29912].int;eqtb[29912].int:=1073741823;
eqtb[27688].hh.rh:=vpackage(mem[memtop-2].hh.rh,bestsize,0,pagemaxdepth)
;eqtb[29304].int:=savevbadness;eqtb[29912].int:=savevfuzz;
if lastglue<>268435455 then deleteglueref(lastglue);
{1168:}pagecontents:=0;pagetail:=memtop-2;
mem[memtop-2].hh.rh:=-268435455;lastglue:=268435455;lastpenalty:=0;
lastkern:=0;lastnodetype:=-1;pagesofar[7]:=0;pagemaxdepth:=0{:1168};
if q<>memtop-4 then begin mem[memtop-2].hh.rh:=mem[memtop-4].hh.rh;
pagetail:=q;end{:1194};{1196:}r:=mem[memtop].hh.rh;
while r<>memtop do begin q:=mem[r].hh.rh;freenode(r,4);r:=q;end;
mem[memtop].hh.rh:=memtop{:1196}{:1191};
if saroot[6]<>-268435455 then if domarks(2,0,saroot[6])then saroot[6]:=
-268435455;
if(curmark[0]<>-268435455)and(curmark[1]=-268435455)then begin curmark[1
]:=curmark[0];incr(mem[curmark[0]].hh.lh);end;
if eqtb[27159].hh.rh<>-268435455 then if deadcycles>=eqtb[29317].int
then{1201:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1433);
end;printint(deadcycles);print(1434);begin helpptr:=3;helpline[2]:=1435;
helpline[1]:=1436;helpline[0]:=1437;end;error;
end{:1201}else{1202:}begin outputactive:=true;incr(deadcycles);pushnest;
curlist.modefield:=-1;curlist.auxfield.int:=eqtb[29935].int;
curlist.mlfield:=-line;begintokenlist(eqtb[27159].hh.rh,6);
newsavelevel(8);normalparagraph;scanleftbrace;goto 10;end{:1202};
{1200:}begin if mem[memtop-2].hh.rh<>-268435455 then begin if mem[memtop
-1].hh.rh=-268435455 then if nestptr=0 then curlist.tailfield:=pagetail
else nest[0].tailfield:=pagetail else mem[pagetail].hh.rh:=mem[memtop-1]
.hh.rh;mem[memtop-1].hh.rh:=mem[memtop-2].hh.rh;
mem[memtop-2].hh.rh:=-268435455;pagetail:=memtop-2;end;
flushnodelist(discptr[2]);discptr[2]:=-268435455;
shipout(eqtb[27688].hh.rh);eqtb[27688].hh.rh:=-268435455;end{:1200};
10:end;{:1189}procedure buildpage;label 10,30,31,22,80,90;
var p:halfword;q,r:halfword;b,c:integer;pi:integer;n:0..255;
delta,h,w:scaled;
begin if(mem[memtop-1].hh.rh=-268435455)or outputactive then goto 10;
repeat 22:p:=mem[memtop-1].hh.rh;
{1173:}if lastglue<>268435455 then deleteglueref(lastglue);
lastpenalty:=0;lastkern:=0;lastnodetype:=mem[p].hh.b0+1;
if mem[p].hh.b0=10 then begin lastglue:=mem[p+1].hh.lh;
incr(mem[lastglue].hh.rh);end else begin lastglue:=268435455;
if mem[p].hh.b0=12 then lastpenalty:=mem[p+1].int else if mem[p].hh.b0=
11 then lastkern:=mem[p+1].int;end{:1173};
{1174:}{1177:}case mem[p].hh.b0 of 0,1,2:if pagecontents<2 then{1178:}
begin if pagecontents=0 then freezepagespecs(2)else pagecontents:=2;
q:=newskipparam(9);
if mem[tempptr+1].int>mem[p+3].int then mem[tempptr+1].int:=mem[tempptr
+1].int-mem[p+3].int else mem[tempptr+1].int:=0;mem[q].hh.rh:=p;
mem[memtop-1].hh.rh:=q;goto 22;
end{:1178}else{1179:}begin pagesofar[1]:=pagesofar[1]+pagesofar[7]+mem[p
+3].int;pagesofar[7]:=mem[p+2].int;goto 80;end{:1179};
8:if(pagecontents<2)and((mem[p].hh.b1=37)or(mem[p].hh.b1=38))then begin
print(1386);goto 31;
end else{1611:}begin if(mem[p].hh.b1=12)or(mem[p].hh.b1=14)then begin
pagesofar[1]:=pagesofar[1]+pagesofar[7]+mem[p+2].int;
pagesofar[7]:=mem[p+3].int;end;goto 80;end{:1611};
10:if pagecontents<2 then goto 31 else if(mem[pagetail].hh.b0<9)then pi
:=0 else goto 90;
11:if pagecontents<2 then goto 31 else if mem[p].hh.rh=-268435455 then
goto 10 else if mem[mem[p].hh.rh].hh.b0=10 then pi:=0 else goto 90;
12:if pagecontents<2 then goto 31 else pi:=mem[p+1].int;4:goto 80;
3:{1185:}begin if pagecontents=0 then freezepagespecs(1);
n:=mem[p].hh.b1;r:=memtop;
while n>=mem[mem[r].hh.rh].hh.b1 do r:=mem[r].hh.rh;n:=n;
if mem[r].hh.b1<>n then{1186:}begin q:=getnode(4);
mem[q].hh.rh:=mem[r].hh.rh;mem[r].hh.rh:=q;r:=q;mem[r].hh.b1:=n;
mem[r].hh.b0:=0;ensurevbox(n);
if eqtb[27433+n].hh.rh=-268435455 then mem[r+3].int:=0 else mem[r+3].int
:=mem[eqtb[27433+n].hh.rh+3].int+mem[eqtb[27433+n].hh.rh+2].int;
mem[r+2].hh.lh:=-268435455;q:=eqtb[26646+n].hh.rh;
if eqtb[29391+n].int=1000 then h:=mem[r+3].int else h:=xovern(mem[r+3].
int,1000)*eqtb[29391+n].int;pagesofar[0]:=pagesofar[0]-h-mem[q+1].int;
pagesofar[2+mem[q].hh.b0]:=pagesofar[2+mem[q].hh.b0]+mem[q+2].int;
pagesofar[6]:=pagesofar[6]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(264);
print(1426);end;printesc(413);printint(n);begin helpptr:=3;
helpline[2]:=1427;helpline[1]:=1428;helpline[0]:=1345;end;error;end;
end{:1186};
if mem[r].hh.b0=1 then insertpenalties:=insertpenalties+mem[p+1].int
else begin mem[r+2].hh.rh:=p;
delta:=pagesofar[0]-pagesofar[1]-pagesofar[7]+pagesofar[6];
if eqtb[29391+n].int=1000 then h:=mem[p+3].int else h:=xovern(mem[p+3].
int,1000)*eqtb[29391+n].int;
if((h<=0)or(h<=delta))and(mem[p+3].int+mem[r+3].int<=eqtb[29937+n].int)
then begin pagesofar[0]:=pagesofar[0]-h;
mem[r+3].int:=mem[r+3].int+mem[p+3].int;
end else{1187:}begin if eqtb[29391+n].int<=0 then w:=1073741823 else
begin w:=pagesofar[0]-pagesofar[1]-pagesofar[7];
if eqtb[29391+n].int<>1000 then w:=xovern(w,eqtb[29391+n].int)*1000;end;
if w>eqtb[29937+n].int-mem[r+3].int then w:=eqtb[29937+n].int-mem[r+3].
int;q:=vertbreak(mem[p+4].hh.lh,w,mem[p+2].int);
mem[r+3].int:=mem[r+3].int+bestheightplusdepth;
ifdef('STAT')if eqtb[29310].int>0 then{1188:}begin begindiagnostic;
printnl(1429);printint(n);print(1430);printscaled(w);printchar(44);
printscaled(bestheightplusdepth);print(1358);
if q=-268435455 then printint(-10000)else if mem[q].hh.b0=12 then
printint(mem[q+1].int)else printchar(48);enddiagnostic(false);
end{:1188};
endif('STAT')if eqtb[29391+n].int<>1000 then bestheightplusdepth:=xovern
(bestheightplusdepth,1000)*eqtb[29391+n].int;
pagesofar[0]:=pagesofar[0]-bestheightplusdepth;mem[r].hh.b0:=1;
mem[r+1].hh.rh:=q;mem[r+1].hh.lh:=p;
if q=-268435455 then insertpenalties:=insertpenalties-10000 else if mem[
q].hh.b0=12 then insertpenalties:=insertpenalties+mem[q+1].int;
end{:1187};end;goto 80;end{:1185};others:confusion(900)end{:1177};
{1182:}if pi<10000 then begin{1184:}if pagesofar[1]<pagesofar[0]then if(
pagesofar[3]<>0)or(pagesofar[4]<>0)or(pagesofar[5]<>0)then b:=0 else b:=
badness(pagesofar[0]-pagesofar[1],pagesofar[2])else if pagesofar[1]-
pagesofar[0]>pagesofar[6]then b:=1073741823 else b:=badness(pagesofar[1]
-pagesofar[0],pagesofar[6]){:1184};
if b<1073741823 then if pi<=-10000 then c:=pi else if b<10000 then c:=b+
pi+insertpenalties else c:=100000 else c:=b;
if insertpenalties>=10000 then c:=1073741823;
ifdef('STAT')if eqtb[29310].int>0 then{1183:}begin begindiagnostic;
printnl(37);print(1354);printtotals;print(1424);
printscaled(pagesofar[0]);print(1357);
if b=1073741823 then printchar(42)else printint(b);print(1358);
printint(pi);print(1425);
if c=1073741823 then printchar(42)else printint(c);
if c<=leastpagecost then printchar(35);enddiagnostic(false);end{:1183};
endif('STAT')if c<=leastpagecost then begin bestpagebreak:=p;
bestsize:=pagesofar[0];leastpagecost:=c;r:=mem[memtop].hh.rh;
while r<>memtop do begin mem[r+2].hh.lh:=mem[r+2].hh.rh;r:=mem[r].hh.rh;
end;end;if(c=1073741823)or(pi<=-10000)then begin fireup(p);
if outputactive then goto 10;goto 30;end;end{:1182};
if(mem[p].hh.b0<10)or(mem[p].hh.b0>11)then goto 80;
90:{1181:}if mem[p].hh.b0=11 then q:=p else begin q:=mem[p+1].hh.lh;
pagesofar[2+mem[q].hh.b0]:=pagesofar[2+mem[q].hh.b0]+mem[q+2].int;
pagesofar[6]:=pagesofar[6]+mem[q+3].int;
if(mem[q].hh.b1<>0)and(mem[q+3].int<>0)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(264);
print(1422);end;begin helpptr:=4;helpline[3]:=1423;helpline[2]:=1392;
helpline[1]:=1393;helpline[0]:=1345;end;error;r:=newspec(q);
mem[r].hh.b1:=0;deleteglueref(q);mem[p+1].hh.lh:=r;q:=r;end;end;
pagesofar[1]:=pagesofar[1]+pagesofar[7]+mem[q+1].int;
pagesofar[7]:=0{:1181};
80:{1180:}if pagesofar[7]>pagemaxdepth then begin pagesofar[1]:=
pagesofar[1]+pagesofar[7]-pagemaxdepth;pagesofar[7]:=pagemaxdepth;end;
{:1180};{1175:}mem[pagetail].hh.rh:=p;pagetail:=p;
mem[memtop-1].hh.rh:=mem[p].hh.rh;mem[p].hh.rh:=-268435455;
goto 30{:1175};31:{1176:}mem[memtop-1].hh.rh:=mem[p].hh.rh;
mem[p].hh.rh:=-268435455;
if eqtb[29386].int>0 then begin if discptr[2]=-268435455 then discptr[2]
:=p else mem[discptr[1]].hh.rh:=p;discptr[1]:=p;
end else flushnodelist(p){:1176};30:{:1174};
until mem[memtop-1].hh.rh=-268435455;
{1172:}if nestptr=0 then curlist.tailfield:=memtop-1 else nest[0].
tailfield:=memtop-1{:1172};10:end;
{:1171}{1207:}{1221:}procedure appspace;var q:halfword;
begin if(curlist.auxfield.hh.lh>=2000)and(eqtb[26641].hh.rh<>membot)then
q:=newparamglue(13)else begin if eqtb[26640].hh.rh<>membot then mainp:=
eqtb[26640].hh.rh else{1220:}begin mainp:=fontglue[eqtb[27689].hh.rh];
if mainp=-268435455 then begin mainp:=newspec(membot);
maink:=parambase[eqtb[27689].hh.rh]+2;
mem[mainp+1].int:=fontinfo[maink].int;
mem[mainp+2].int:=fontinfo[maink+1].int;
mem[mainp+3].int:=fontinfo[maink+2].int;
fontglue[eqtb[27689].hh.rh]:=mainp;end;end{:1220};mainp:=newspec(mainp);
{1222:}if curlist.auxfield.hh.lh>=2000 then mem[mainp+1].int:=mem[mainp
+1].int+fontinfo[7+parambase[eqtb[27689].hh.rh]].int;
mem[mainp+2].int:=xnoverd(mem[mainp+2].int,curlist.auxfield.hh.lh,1000);
mem[mainp+3].int:=xnoverd(mem[mainp+3].int,1000,curlist.auxfield.hh.lh)
{:1222};q:=newglue(mainp);mem[mainp].hh.rh:=-268435455;end;
mem[curlist.tailfield].hh.rh:=q;curlist.tailfield:=q;end;
{:1221}{1225:}procedure insertdollarsign;begin backinput;curtok:=804;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1444);
end;begin helpptr:=2;helpline[1]:=1445;helpline[0]:=1446;end;inserror;
end;{:1225}{1227:}procedure youcant;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(797);
end;printcmdchr(curcmd,curchr);printinmode(curlist.modefield);end;
{:1227}{1228:}procedure reportillegalcase;begin youcant;
begin helpptr:=4;helpline[3]:=1447;helpline[2]:=1448;helpline[1]:=1449;
helpline[0]:=1450;end;error;end;
{:1228}{1229:}function privileged:boolean;
begin if curlist.modefield>0 then privileged:=true else begin
reportillegalcase;privileged:=false;end;end;
{:1229}{1232:}function itsallover:boolean;label 10;
begin if privileged then begin if(memtop-2=pagetail)and(curlist.
headfield=curlist.tailfield)and(deadcycles=0)then begin itsallover:=true
;goto 10;end;backinput;begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newnullbox;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield+1].int:=eqtb[29906].int;
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newglue(membot+8);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newpenalty(-1073741824);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;buildpage;end;
itsallover:=false;10:end;{:1232}{1238:}procedure appendglue;
var s:smallnumber;begin s:=curchr;case s of 0:curval:=membot+4;
1:curval:=membot+8;2:curval:=membot+12;3:curval:=membot+16;
4:scanglue(2);5:scanglue(3);end;begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newglue(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if s>=4 then begin decr(mem[curval].hh.rh);
if s>4 then mem[curlist.tailfield].hh.b1:=99;end;end;
{:1238}{1239:}procedure appendkern;var s:quarterword;begin s:=curchr;
scandimen(s=99,false,false);begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newkern(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=s;end;{:1239}{1242:}procedure offsave;
var p:halfword;
begin if curgroup=0 then{1244:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(944);
end;printcmdchr(curcmd,curchr);begin helpptr:=1;helpline[0]:=1468;end;
error;end{:1244}else begin backinput;p:=getavail;mem[memtop-3].hh.rh:=p;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(723);
end;{1243:}case curgroup of 14:begin mem[p].hh.lh:=19611;printesc(602);
end;15:begin mem[p].hh.lh:=804;printchar(36);end;
16:begin mem[p].hh.lh:=19612;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
mem[p].hh.lh:=3118;printesc(1467);end;others:begin mem[p].hh.lh:=637;
printchar(125);end end{:1243};print(724);
begintokenlist(mem[memtop-3].hh.rh,4);begin helpptr:=5;
helpline[4]:=1462;helpline[3]:=1463;helpline[2]:=1464;helpline[1]:=1465;
helpline[0]:=1466;end;error;end;end;
{:1242}{1247:}procedure extrarightbrace;
begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1473);
end;case curgroup of 14:printesc(602);15:printchar(36);
16:printesc(1299);end;begin helpptr:=5;helpline[4]:=1474;
helpline[3]:=1475;helpline[2]:=1476;helpline[1]:=1477;helpline[0]:=1478;
end;error;incr(alignstate);end;{:1247}{1248:}procedure normalparagraph;
begin if eqtb[29296].int<>0 then eqworddefine(29296,0);
if eqtb[29920].int<>0 then eqworddefine(29920,0);
if eqtb[29318].int<>1 then eqworddefine(29318,1);
if eqtb[27158].hh.rh<>-268435455 then eqdefine(27158,121,-268435455);
if eqtb[27429].hh.rh<>-268435455 then eqdefine(27429,121,-268435455);
end;{:1248}{1253:}procedure boxend(boxcontext:integer);var p:halfword;
a:smallnumber;
begin if boxcontext<1073741824 then{1254:}begin if curbox<>-268435455
then begin mem[curbox+4].int:=boxcontext;
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
curlist.tailfield:=curbox;end;end;
end{:1254}else if boxcontext<1073807360 then{1255:}begin if boxcontext<
1073774592 then begin curval:=boxcontext-1073741824;a:=0;
end else begin curval:=boxcontext-1073774592;a:=4;end;
if curval<256 then if(a>=4)then geqdefine(27433+curval,122,curbox)else
eqdefine(27433+curval,122,curbox)else begin findsaelement(4,curval,true)
;if(a>=4)then gsadef(curptr,curbox)else sadef(curptr,curbox);end;
end{:1255}else if curbox<>-268435455 then if boxcontext>1073807360 then
{1256:}begin{430:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:430};
if((curcmd=26)and(abs(curlist.modefield)<>1))or((curcmd=27)and(abs(
curlist.modefield)=1))then begin appendglue;
mem[curlist.tailfield].hh.b1:=boxcontext-(1073807261);
mem[curlist.tailfield+1].hh.rh:=curbox;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1491);
end;begin helpptr:=3;helpline[2]:=1492;helpline[1]:=1493;
helpline[0]:=1494;end;backerror;flushnodelist(curbox);end;
end{:1256}else shipout(curbox);end;
{:1253}{1257:}procedure beginbox(boxcontext:integer);label 10,30;
var p,q:halfword;r:halfword;fm:boolean;tx:halfword;m:quarterword;
k:halfword;n:halfword;begin case curchr of 0:begin scanregisternum;
if curval<256 then curbox:=eqtb[27433+curval].hh.rh else begin
findsaelement(4,curval,false);
if curptr=-268435455 then curbox:=-268435455 else curbox:=mem[curptr+1].
hh.rh;end;
if curval<256 then eqtb[27433+curval].hh.rh:=-268435455 else begin
findsaelement(4,curval,false);
if curptr<>-268435455 then begin mem[curptr+1].hh.rh:=-268435455;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;end;
1:begin scanregisternum;
if curval<256 then q:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then q:=-268435455 else q:=mem[curptr+1].hh.rh;end;
curbox:=copynodelist(q);end;2:{1258:}begin curbox:=-268435455;
if abs(curlist.modefield)=209 then begin youcant;begin helpptr:=1;
helpline[0]:=1496;end;error;
end else if(curlist.modefield=1)and(curlist.headfield=curlist.tailfield)
then begin youcant;begin helpptr:=2;helpline[1]:=1497;helpline[0]:=1498;
end;error;end else begin tx:=curlist.tailfield;
if not(tx>=himemmin)then if(mem[tx].hh.b0=9)and(mem[tx].hh.b1=3)then
begin r:=curlist.headfield;repeat q:=r;r:=mem[q].hh.rh;until r=tx;tx:=q;
end;if not(tx>=himemmin)then if(mem[tx].hh.b0=0)or(mem[tx].hh.b0=1)then
{1259:}begin q:=curlist.headfield;p:=-268435455;repeat r:=p;p:=q;
fm:=false;
if not(q>=himemmin)then if mem[q].hh.b0=7 then begin for m:=1 to mem[q].
hh.b1 do p:=mem[p].hh.rh;if p=tx then goto 30;
end else if(mem[q].hh.b0=9)and(mem[q].hh.b1=2)then fm:=true;
q:=mem[p].hh.rh;until q=tx;q:=mem[tx].hh.rh;mem[p].hh.rh:=q;
mem[tx].hh.rh:=-268435455;
if q=-268435455 then if fm then confusion(1495)else curlist.tailfield:=p
else if fm then begin curlist.tailfield:=r;mem[r].hh.rh:=-268435455;
flushnodelist(p);end;curbox:=tx;mem[curbox+4].int:=0;end{:1259};30:end;
end{:1258};3:{1260:}begin scanregisternum;n:=curval;
if not scankeyword(1258)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1499);
end;begin helpptr:=2;helpline[1]:=1500;helpline[0]:=1501;end;error;end;
scandimen(false,false,false);curbox:=vsplit(n,curval);end{:1260};
others:{1261:}begin k:=curchr-4;savestack[saveptr+0].int:=boxcontext;
if k=105 then if(boxcontext<1073741824)and(abs(curlist.modefield)=1)then
scanspec(3,true)else scanspec(2,true)else begin if k=1 then scanspec(4,
true)else begin scanspec(5,true);k:=1;end;normalparagraph;end;pushnest;
curlist.modefield:=-k;
if k=1 then begin curlist.auxfield.int:=eqtb[29935].int;
if eqtb[27164].hh.rh<>-268435455 then begintokenlist(eqtb[27164].hh.rh,
11);end else begin curlist.auxfield.hh.lh:=1000;
if eqtb[27163].hh.rh<>-268435455 then begintokenlist(eqtb[27163].hh.rh,
10);end;goto 10;end{:1261}end;boxend(boxcontext);10:end;
{:1257}{1262:}procedure scanbox(boxcontext:integer);
begin{430:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:430};
if curcmd=20 then beginbox(boxcontext)else if(boxcontext>=1073807361)and
((curcmd=36)or(curcmd=35))then begin curbox:=scanrulespec;
boxend(boxcontext);end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1502);
end;begin helpptr:=3;helpline[2]:=1503;helpline[1]:=1504;
helpline[0]:=1505;end;backerror;end;end;
{:1262}{1264:}procedure package(c:smallnumber);var h:scaled;p:halfword;
d:scaled;begin d:=eqtb[29910].int;unsave;saveptr:=saveptr-3;
if curlist.modefield=-105 then curbox:=hpack(mem[curlist.headfield].hh.
rh,savestack[saveptr+2].int,savestack[saveptr+1].int)else begin curbox:=
vpackage(mem[curlist.headfield].hh.rh,savestack[saveptr+2].int,savestack
[saveptr+1].int,d);if c=4 then{1265:}begin h:=0;p:=mem[curbox+5].hh.rh;
if p<>-268435455 then if mem[p].hh.b0<=2 then h:=mem[p+3].int;
mem[curbox+2].int:=mem[curbox+2].int-h+mem[curbox+3].int;
mem[curbox+3].int:=h;end{:1265};end;popnest;
boxend(savestack[saveptr+0].int);end;
{:1264}{1269:}function normmin(h:integer):smallnumber;
begin if h<=0 then normmin:=1 else if h>=63 then normmin:=63 else
normmin:=h;end;procedure newgraf(indented:boolean);
begin curlist.pgfield:=0;
if(curlist.modefield=1)or(curlist.headfield<>curlist.tailfield)then
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newparamglue(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;pushnest;
curlist.modefield:=105;curlist.auxfield.hh.lh:=1000;
if eqtb[29327].int<=0 then curlang:=0 else if eqtb[29327].int>255 then
curlang:=0 else curlang:=eqtb[29327].int;
curlist.auxfield.hh.rh:=curlang;
curlist.pgfield:=(normmin(eqtb[29328].int)*64+normmin(eqtb[29329].int))
*65536+curlang;if indented then begin curlist.tailfield:=newnullbox;
mem[curlist.headfield].hh.rh:=curlist.tailfield;
mem[curlist.tailfield+1].int:=eqtb[29903].int;
if(insertsrcspecialeverypar)then insertsrcspecial;end;
if eqtb[27160].hh.rh<>-268435455 then begintokenlist(eqtb[27160].hh.rh,7
);if nestptr=1 then buildpage;end;{:1269}{1271:}procedure indentinhmode;
var p,q:halfword;begin if curchr>0 then begin p:=newnullbox;
mem[p+1].int:=eqtb[29903].int;
if abs(curlist.modefield)=105 then curlist.auxfield.hh.lh:=1000 else
begin q:=newnoad;mem[q+1].hh.rh:=2;mem[q+1].hh.lh:=p;p:=q;end;
begin prevtail:=curlist.tailfield;mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
{:1271}{1273:}procedure headforvmode;
begin if curlist.modefield<0 then if curcmd<>36 then offsave else begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(797);
end;printesc(609);print(1509);begin helpptr:=2;helpline[1]:=1510;
helpline[0]:=1511;end;error;end else begin backinput;curtok:=partoken;
backinput;curinput.indexfield:=4;end;end;
{:1273}{1274:}procedure endgraf;
begin if curlist.modefield=105 then begin if curlist.headfield=curlist.
tailfield then popnest else linebreak(false);
if curlist.eTeXauxfield<>-268435455 then begin flushlist(curlist.
eTeXauxfield);curlist.eTeXauxfield:=-268435455;end;normalparagraph;
errorcount:=0;end;end;{:1274}{1277:}procedure begininsertoradjust;
begin if curcmd=38 then curval:=255 else begin scaneightbitint;
if curval=255 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1512);
end;printesc(337);printint(255);begin helpptr:=1;helpline[0]:=1513;end;
error;curval:=0;end;end;savestack[saveptr+0].int:=curval;
if(curcmd=38)and scankeyword(1514)then savestack[saveptr+1].int:=1 else
savestack[saveptr+1].int:=0;saveptr:=saveptr+2;newsavelevel(11);
scanleftbrace;normalparagraph;pushnest;curlist.modefield:=-1;
curlist.auxfield.int:=eqtb[29935].int;end;
{:1277}{1279:}procedure makemark;var p:halfword;c:halfword;
begin if curchr=0 then c:=0 else begin scanregisternum;c:=curval;end;
p:=scantoks(false,true);p:=getnode(2);mem[p+1].hh.lh:=c;mem[p].hh.b0:=4;
mem[p].hh.b1:=0;mem[p+1].hh.rh:=defref;mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=p;end;{:1279}{1281:}procedure appendpenalty;
begin scanint;begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newpenalty(curval);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if curlist.modefield=1 then buildpage;end;
{:1281}{1283:}procedure deletelast;label 10;var p,q:halfword;r:halfword;
fm:boolean;tx:halfword;m:quarterword;
begin if(curlist.modefield=1)and(curlist.tailfield=curlist.headfield)
then{1284:}begin if(curchr<>10)or(lastglue<>268435455)then begin youcant
;begin helpptr:=2;helpline[1]:=1497;helpline[0]:=1515;end;
if curchr=11 then helpline[0]:=(1516)else if curchr<>10 then helpline[0]
:=(1517);error;end;end{:1284}else begin tx:=curlist.tailfield;
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
if q=-268435455 then if fm then confusion(1495)else curlist.tailfield:=p
else if fm then begin curlist.tailfield:=r;mem[r].hh.rh:=-268435455;
flushnodelist(p);end;flushnodelist(tx);end;end;10:end;
{:1283}{1288:}procedure unpackage;label 30,10;var p:halfword;r:halfword;
c:0..1;
begin if curchr>1 then{1863:}begin mem[curlist.tailfield].hh.rh:=discptr
[curchr];discptr[curchr]:=-268435455;goto 30;end{:1863};c:=curchr;
scanregisternum;
if curval<256 then p:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
if p=-268435455 then goto 10;
if(abs(curlist.modefield)=209)or((abs(curlist.modefield)=1)and(mem[p].hh
.b0<>1))or((abs(curlist.modefield)=105)and(mem[p].hh.b0<>0))then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1525);
end;begin helpptr:=3;helpline[2]:=1526;helpline[1]:=1527;
helpline[0]:=1528;end;error;goto 10;end;
if c=1 then mem[curlist.tailfield].hh.rh:=copynodelist(mem[p+5].hh.rh)
else begin mem[curlist.tailfield].hh.rh:=mem[p+5].hh.rh;
if curval<256 then eqtb[27433+curval].hh.rh:=-268435455 else begin
findsaelement(4,curval,false);
if curptr<>-268435455 then begin mem[curptr+1].hh.rh:=-268435455;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;freenode(p,9);end;
30:while mem[curlist.tailfield].hh.rh<>-268435455 do begin r:=mem[
curlist.tailfield].hh.rh;
if not(r>=himemmin)and(mem[r].hh.b0=40)then begin mem[curlist.tailfield]
.hh.rh:=mem[r].hh.rh;begin mem[mem[r+2].hh.lh].hh.rh:=avail;
avail:=mem[r+2].hh.lh;ifdef('STAT')decr(dynused);endif('STAT')end;
freenode(r,3);end;curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
10:end;{:1288}{1291:}procedure appenditaliccorrection;label 10;
var p:halfword;f:internalfontnumber;
begin if curlist.tailfield<>curlist.headfield then begin if(curlist.
tailfield>=himemmin)then p:=curlist.tailfield else if mem[curlist.
tailfield].hh.b0=6 then p:=curlist.tailfield+1 else goto 10;
f:=mem[p].hh.b0;begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newkern(fontinfo[italicbase[f]+(fontinfo[
charbase[f]+effectivechar(true,f,mem[p].hh.b1)].qqqq.b2)div 4].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=1;end;10:end;
{:1291}{1295:}procedure appenddiscretionary;var c:integer;
appkern,prekern,p,cnode:halfword;
begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if curchr=1 then begin c:=hyphenchar[eqtb[27689].hh.rh];
if c>=0 then if c<256 then begin prekern:=getautokern(eqtb[27689].hh.rh,
256,c);appkern:=getautokern(eqtb[27689].hh.rh,c,256);
cnode:=newcharacter(eqtb[27689].hh.rh,c);
if(appkern=-268435455)and(prekern=-268435455)then mem[curlist.tailfield
+1].hh.lh:=cnode else begin if prekern=-268435455 then mem[curlist.
tailfield+1].hh.lh:=cnode else begin mem[curlist.tailfield+1].hh.lh:=
prekern;mem[prekern].hh.rh:=cnode;end;
if appkern<>-268435455 then mem[cnode].hh.rh:=appkern;end;end;
end else begin incr(saveptr);savestack[saveptr-1].int:=0;
newsavelevel(10);scanleftbrace;pushnest;curlist.modefield:=-105;
curlist.auxfield.hh.lh:=1000;end;end;
{:1295}{1297:}procedure builddiscretionary;label 30,10;var p,q:halfword;
n:integer;begin unsave;{1299:}q:=curlist.headfield;p:=mem[q].hh.rh;n:=0;
while p<>-268435455 do begin if not(p>=himemmin)then if mem[p].hh.b0>2
then if mem[p].hh.b0<>11 then if mem[p].hh.b0<>6 then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1535);
end;begin helpptr:=1;helpline[0]:=1536;end;error;begindiagnostic;
printnl(1537);showbox(p);enddiagnostic(true);flushnodelist(p);
mem[q].hh.rh:=-268435455;goto 30;end;q:=p;p:=mem[q].hh.rh;incr(n);end;
30:{:1299};p:=mem[curlist.headfield].hh.rh;popnest;
case savestack[saveptr-1].int of 0:mem[curlist.tailfield+1].hh.lh:=p;
1:mem[curlist.tailfield+1].hh.rh:=p;
2:{1298:}begin if(n>0)and(abs(curlist.modefield)=209)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1529);
end;printesc(358);begin helpptr:=2;helpline[1]:=1530;helpline[0]:=1531;
end;flushnodelist(p);n:=0;error;
end else mem[curlist.tailfield].hh.rh:=p;
if n<=255 then mem[curlist.tailfield].hh.b1:=n else begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1532);
end;begin helpptr:=2;helpline[1]:=1533;helpline[0]:=1534;end;error;end;
if n>0 then curlist.tailfield:=q;decr(saveptr);goto 10;end{:1298};end;
incr(savestack[saveptr-1].int);newsavelevel(10);scanleftbrace;pushnest;
curlist.modefield:=-105;curlist.auxfield.hh.lh:=1000;10:end;
{:1297}{1301:}procedure makeaccent;var s,t:real;p,q,r:halfword;
f:internalfontnumber;a,h,x,w,delta:scaled;i:fourquarters;
begin scancharnum;f:=eqtb[27689].hh.rh;p:=newcharacter(f,curval);
if p<>-268435455 then begin x:=fontinfo[5+parambase[f]].int;
s:=fontinfo[1+parambase[f]].int/65536.0;
a:=fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true,f,mem[p
].hh.b1)].qqqq.b0].int;doassignments;{1302:}q:=-268435455;
f:=eqtb[27689].hh.rh;
if(curcmd=11)or(curcmd=12)or(curcmd=68)then q:=newcharacter(f,curchr)
else if curcmd=16 then begin scancharnum;q:=newcharacter(f,curval);
end else backinput{:1302};
if q<>-268435455 then{1303:}begin t:=fontinfo[1+parambase[f]].int
/65536.0;
i:=fontinfo[charbase[f]+effectivechar(true,f,mem[q].hh.b1)].qqqq;
w:=fontinfo[widthbase[f]+i.b0].int;
h:=fontinfo[heightbase[f]+(i.b1)div 16].int;
if h<>x then begin p:=hpack(p,0,1);mem[p+4].int:=x-h;end;
delta:=round((w-a)/2.0+h*t-x*s);r:=newkern(delta);mem[r].hh.b1:=2;
mem[curlist.tailfield].hh.rh:=r;mem[r].hh.rh:=p;
curlist.tailfield:=newkern(-a-delta);mem[curlist.tailfield].hh.b1:=2;
mem[p].hh.rh:=curlist.tailfield;p:=q;end{:1303};
mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
curlist.auxfield.hh.lh:=1000;end;end;{:1301}{1305:}procedure alignerror;
begin if abs(alignstate)>2 then{1306:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1542);
end;printcmdchr(curcmd,curchr);
if curtok=1062 then begin begin helpptr:=6;helpline[5]:=1543;
helpline[4]:=1544;helpline[3]:=1545;helpline[2]:=1546;helpline[1]:=1547;
helpline[0]:=1548;end;end else begin begin helpptr:=5;helpline[4]:=1543;
helpline[3]:=1549;helpline[2]:=1546;helpline[1]:=1547;helpline[0]:=1548;
end;end;error;end{:1306}else begin backinput;
if alignstate<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(755);
end;incr(alignstate);curtok:=379;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1538);
end;decr(alignstate);curtok:=637;end;begin helpptr:=3;helpline[2]:=1539;
helpline[1]:=1540;helpline[0]:=1541;end;inserror;end;end;
{:1305}{1307:}procedure noalignerror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1542);
end;printesc(615);begin helpptr:=2;helpline[1]:=1550;helpline[0]:=1551;
end;error;end;procedure omiterror;begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1542);
end;printesc(618);begin helpptr:=2;helpline[1]:=1552;helpline[0]:=1551;
end;error;end;{:1307}{1309:}procedure doendv;begin baseptr:=inputptr;
inputstack[baseptr]:=curinput;
while(inputstack[baseptr].indexfield<>2)and(inputstack[baseptr].locfield
=-268435455)and(inputstack[baseptr].statefield=0)do decr(baseptr);
if(inputstack[baseptr].indexfield<>2)or(inputstack[baseptr].locfield<>
-268435455)or(inputstack[baseptr].statefield<>0)then fatalerror(689);
if curgroup=6 then begin endgraf;if fincol then finrow;end else offsave;
end;{:1309}{1313:}procedure cserror;
begin if curchr=10 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(944);
end;printesc(601);begin helpptr:=1;helpline[0]:=1554;end;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(944);
end;printesc(590);begin helpptr:=1;helpline[0]:=1555;end;end;error;end;
{:1313}{1314:}procedure pushmath(c:groupcode);begin pushnest;
curlist.modefield:=-209;curlist.auxfield.int:=-268435455;
newsavelevel(c);end;
{:1314}{1316:}{1733:}procedure justcopy(p,h,t:halfword);label 40,45;
var r:halfword;words:0..5;begin while p<>-268435455 do begin words:=1;
if(p>=himemmin)then r:=getavail else case mem[p].hh.b0 of 0,1:begin r:=
getnode(9);{1935:}mem[r+7].int:=mem[p+7].int;mem[r+8].int:=mem[p+8].int;
{:1935};mem[r+6]:=mem[p+6];mem[r+5]:=mem[p+5];words:=5;
mem[r+5].hh.rh:=-268435455;end;2:begin r:=getnode(6);words:=6;end;
6:begin r:=getavail;mem[r]:=mem[p+1];goto 40;end;11,9:begin words:=4;
r:=getnode(words);end;10:begin r:=getnode(4);
incr(mem[mem[p+1].hh.lh].hh.rh);{1937:}mem[r+2].int:=mem[p+2].int;
mem[r+3].int:=mem[p+3].int;{:1937};mem[r+1].hh.lh:=mem[p+1].hh.lh;
mem[r+1].hh.rh:=-268435455;end;
8:{1604:}case mem[p].hh.b1 of 0:begin r:=getnode(3);words:=3;end;
1,3,4:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
2,5:begin r:=getnode(2);words:=2;end;7,8:begin r:=getnode(2);
incr(mem[mem[p+1].hh.rh].hh.lh);words:=2;end;
40:begin if mem[p+1].hh.lh<=1 then begin r:=getnode(3);
incr(mem[mem[p+2].hh.rh].hh.lh);words:=3;end else begin r:=getnode(2);
words:=2;end;end;41:begin r:=getnode(2);incr(mem[mem[p+1].hh.rh].hh.lh);
words:=2;end;42:begin r:=getnode(2);words:=2;end;43:begin r:=getnode(2);
words:=2;end;10:begin r:=getnode(2);words:=2;end;12:begin r:=getnode(5);
words:=5;end;14:begin r:=getnode(5);words:=5;end;15:begin r:=getnode(7);
incr(mem[mem[p+5].hh.lh].hh.lh);words:=7;end;16:begin r:=getnode(7);
mem[r+2].int:=mem[p+2].int;mem[r+3].int:=mem[p+3].int;
mem[r+1].int:=mem[p+1].int;mem[r+5].hh.lh:=mem[p+5].hh.lh;
if mem[r+5].hh.lh<>-268435455 then incr(mem[mem[r+5].hh.lh].hh.lh);
mem[r+5].hh.rh:=mem[p+5].hh.rh;incr(mem[mem[r+5].hh.rh+2].hh.rh);
mem[r+6].int:=mem[p+6].int;end;17:r:=getnode(2);19:begin r:=getnode(7);
if mem[p+5].hh.b1>0 then incr(mem[mem[p+5].hh.rh].hh.lh);words:=7;end;
20,21:begin r:=getnode(7);
if mem[p+5].hh.b1>0 then incr(mem[mem[p+5].hh.rh].hh.lh);
if mem[p+6].hh.lh<>-268435455 then incr(mem[mem[p+6].hh.lh].hh.lh);
words:=7;end;22:r:=getnode(2);23:r:=getnode(2);36:r:=getnode(2);
37:begin incr(mem[mem[p+1].hh.lh].hh.rh);r:=getnode(3);words:=3;end;
38:r:=getnode(2);45:r:=getnode(2);46:r:=getnode(2);47:r:=getnode(2);
48:r:=getnode(2);49:r:=getnode(2);others:confusion(1931)end{:1604};
others:goto 45 end;while words>0 do begin decr(words);
mem[r+words]:=mem[p+words];end;40:mem[h].hh.rh:=r;h:=r;
45:p:=mem[p].hh.rh;end;mem[h].hh.rh:=t;end;
{:1733}{1738:}procedure justreverse(p:halfword);label 30;var l:halfword;
t:halfword;q:halfword;m,n:halfword;begin m:=-268435455;n:=-268435455;
if mem[memtop-3].hh.rh=-268435455 then begin justcopy(mem[p].hh.rh,
memtop-3,-268435455);q:=mem[memtop-3].hh.rh;
end else begin q:=mem[p].hh.rh;mem[p].hh.rh:=-268435455;
flushnodelist(mem[memtop-3].hh.rh);end;t:=newedge(curdir,0);l:=t;
curdir:=1-curdir;while q<>-268435455 do if(q>=himemmin)then repeat p:=q;
q:=mem[p].hh.rh;mem[p].hh.rh:=l;l:=p;
until not(q>=himemmin)else begin p:=q;q:=mem[p].hh.rh;
if mem[p].hh.b0=9 then{1739:}if odd(mem[p].hh.b1)then if mem[LRptr].hh.
lh<>(4*(mem[p].hh.b1 div 4)+3)then begin mem[p].hh.b0:=11;
incr(LRproblems);end else begin begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;end;
if n>-268435455 then begin decr(n);decr(mem[p].hh.b1);
end else begin if m>-268435455 then decr(m)else begin mem[t+1].int:=mem[
p+1].int;mem[t].hh.rh:=q;freenode(p,4);goto 30;end;mem[p].hh.b0:=11;end;
end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(n>-268435455)or((mem[p].hh.b1 div 8)<>curdir)then begin incr(n);
incr(mem[p].hh.b1);end else begin mem[p].hh.b0:=11;incr(m);end;
end{:1739};mem[p].hh.rh:=l;l:=p;end;goto 30;mem[t+1].int:=mem[p+1].int;
mem[t].hh.rh:=q;freenode(p,2);30:mem[memtop-3].hh.rh:=l;end;
{:1738}procedure initmath;label 21,40,45,30;var w:scaled;j:halfword;
x:integer;l:scaled;s:scaled;p:halfword;q:halfword;f:internalfontnumber;
n:integer;v:scaled;d:scaled;begin gettoken;
if(curcmd=3)and(curlist.modefield>0)then{1323:}begin j:=-268435455;
w:=-1073741823;
if curlist.headfield=curlist.tailfield then{1732:}begin popnest;
{1731:}if curlist.eTeXauxfield=-268435455 then x:=0 else if mem[curlist.
eTeXauxfield].hh.lh>=8 then x:=-1 else x:=1{:1731};
end{:1732}else begin linebreak(true);
{1324:}{1734:}if(eTeXmode=1)then{1740:}begin if eqtb[26636].hh.rh=membot
then j:=newkern(0)else j:=newparamglue(8);
if eqtb[26635].hh.rh=membot then p:=newkern(0)else p:=newparamglue(7);
mem[p].hh.rh:=j;j:=newnullbox;mem[j+1].int:=mem[justbox+1].int;
mem[j+4].int:=mem[justbox+4].int;mem[j+5].hh.rh:=p;
mem[j+5].hh.b1:=mem[justbox+5].hh.b1;
mem[j+5].hh.b0:=mem[justbox+5].hh.b0;mem[j+6].gr:=mem[justbox+6].gr;
end{:1740};v:=mem[justbox+4].int;
{1731:}if curlist.eTeXauxfield=-268435455 then x:=0 else if mem[curlist.
eTeXauxfield].hh.lh>=8 then x:=-1 else x:=1{:1731};
if x>=0 then begin p:=mem[justbox+5].hh.rh;
mem[memtop-3].hh.rh:=-268435455;end else begin v:=-v-mem[justbox+1].int;
p:=newmath(0,6);mem[memtop-3].hh.rh:=p;
justcopy(mem[justbox+5].hh.rh,p,newmath(0,7));curdir:=1;end;
v:=v+2*fontinfo[6+parambase[eqtb[27689].hh.rh]].int;
if(eqtb[29389].int>0)then{1710:}begin tempptr:=getavail;
mem[tempptr].hh.lh:=0;mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;
end{:1710}{:1734};
while p<>-268435455 do begin{1325:}21:if(p>=himemmin)then begin f:=mem[p
].hh.b0;
d:=fontinfo[widthbase[f]+fontinfo[charbase[f]+effectivechar(true,f,mem[p
].hh.b1)].qqqq.b0].int;goto 40;end;
case mem[p].hh.b0 of 0,1,2:begin d:=mem[p+1].int;goto 40;end;
6:{826:}begin mem[memtop-12]:=mem[p+1];
mem[memtop-12].hh.rh:=mem[p].hh.rh;p:=memtop-12;goto 21;end{:826};
40:d:=mem[p+1].int;11:d:=mem[p+1].int;{1736:}9:begin d:=mem[p+1].int;
if(eqtb[29389].int>0)then{1737:}if odd(mem[p].hh.b1)then begin if mem[
LRptr].hh.lh=(4*(mem[p].hh.b1 div 4)+3)then begin tempptr:=LRptr;
LRptr:=mem[tempptr].hh.rh;begin mem[tempptr].hh.rh:=avail;
avail:=tempptr;ifdef('STAT')decr(dynused);endif('STAT')end;
end else if mem[p].hh.b1>4 then begin w:=1073741823;goto 30;
end end else begin begin tempptr:=getavail;
mem[tempptr].hh.lh:=(4*(mem[p].hh.b1 div 4)+3);
mem[tempptr].hh.rh:=LRptr;LRptr:=tempptr;end;
if(mem[p].hh.b1 div 8)<>curdir then begin justreverse(p);p:=memtop-3;
end;end{:1737}else if mem[p].hh.b1>=4 then begin w:=1073741823;goto 30;
end;end;14:begin d:=mem[p+1].int;curdir:=mem[p].hh.b1;end;
{:1736}10:{1326:}begin q:=mem[p+1].hh.lh;d:=mem[q+1].int;
if mem[justbox+5].hh.b0=1 then begin if(mem[justbox+5].hh.b1=mem[q].hh.
b0)and(mem[q+2].int<>0)then v:=1073741823;
end else if mem[justbox+5].hh.b0=2 then begin if(mem[justbox+5].hh.b1=
mem[q].hh.b1)and(mem[q+3].int<>0)then v:=1073741823;end;
if mem[p].hh.b1>=100 then goto 40;end{:1326};
8:{1608:}if(mem[p].hh.b1=12)or(mem[p].hh.b1=14)then d:=mem[p+1].int else
d:=0{:1608};others:d:=0 end{:1325};if v<1073741823 then v:=v+d;goto 45;
40:if v<1073741823 then begin v:=v+d;w:=v;end else begin w:=1073741823;
goto 30;end;45:p:=mem[p].hh.rh;end;
30:{1735:}if(eqtb[29389].int>0)then begin while LRptr<>-268435455 do
begin tempptr:=LRptr;LRptr:=mem[tempptr].hh.rh;
begin mem[tempptr].hh.rh:=avail;avail:=tempptr;
ifdef('STAT')decr(dynused);endif('STAT')end;end;
if LRproblems<>0 then begin w:=1073741823;LRproblems:=0;end;end;
curdir:=0;flushnodelist(mem[memtop-3].hh.rh){:1735}{:1324};end;
{1327:}if eqtb[27158].hh.rh=-268435455 then if(eqtb[29920].int<>0)and(((
eqtb[29318].int>=0)and(curlist.pgfield+2>eqtb[29318].int))or(curlist.
pgfield+1<-eqtb[29318].int))then begin l:=eqtb[29906].int-abs(eqtb[29920
].int);if eqtb[29920].int>0 then s:=eqtb[29920].int else s:=0;
end else begin l:=eqtb[29906].int;s:=0;
end else begin n:=mem[eqtb[27158].hh.rh].hh.lh;
if curlist.pgfield+2>=n then p:=eqtb[27158].hh.rh+2*n else p:=eqtb[27158
].hh.rh+2*(curlist.pgfield+2);s:=mem[p-1].int;l:=mem[p].int;end{:1327};
pushmath(15);curlist.modefield:=209;eqworddefine(29321,-1);
eqworddefine(29916,w);curlist.eTeXauxfield:=j;
if(eTeXmode=1)then eqworddefine(29384,x);eqworddefine(29917,l);
eqworddefine(29918,s);
if eqtb[27162].hh.rh<>-268435455 then begintokenlist(eqtb[27162].hh.rh,9
);if nestptr=1 then buildpage;end{:1323}else begin backinput;
{1317:}begin pushmath(15);eqworddefine(29321,-1);
if(insertsrcspecialeverymath)then insertsrcspecial;
if eqtb[27161].hh.rh<>-268435455 then begintokenlist(eqtb[27161].hh.rh,8
);end{:1317};end;end;{:1316}{1320:}procedure starteqno;
begin savestack[saveptr+0].int:=curchr;incr(saveptr);
{1317:}begin pushmath(15);eqworddefine(29321,-1);
if(insertsrcspecialeverymath)then insertsrcspecial;
if eqtb[27161].hh.rh<>-268435455 then begintokenlist(eqtb[27161].hh.rh,8
);end{:1317};end;{:1320}{1329:}procedure scanmath(p:halfword);
label 20,21,10;var c:integer;begin 20:{430:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:430};
21:case curcmd of 11,12,68:begin c:=eqtb[28765+curchr].hh.rh;
if c=32768 then begin{1330:}begin curcs:=curchr+1;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;xtoken;backinput;
end{:1330};goto 20;end;end;16:begin scancharnum;curchr:=curval;
curcmd:=68;goto 21;end;17:begin scanfifteenbitint;c:=curval;end;
69:c:=curchr;15:begin scantwentysevenbitint;c:=curval div 4096;end;
others:{1331:}begin backinput;scanleftbrace;savestack[saveptr+0].int:=p;
incr(saveptr);pushmath(9);goto 10;end{:1331}end;mem[p].hh.rh:=1;
mem[p].hh.b1:=c mod 256;
if(c>=28672)and((eqtb[29321].int>=0)and(eqtb[29321].int<16))then mem[p].
hh.b0:=eqtb[29321].int else mem[p].hh.b0:=(c div 256)mod 16;10:end;
{:1329}{1333:}procedure setmathchar(c:integer);var p:halfword;
begin if c>=32768 then{1330:}begin curcs:=curchr+1;
curcmd:=eqtb[curcs].hh.b0;curchr:=eqtb[curcs].hh.rh;xtoken;backinput;
end{:1330}else begin p:=newnoad;mem[p+1].hh.rh:=1;
mem[p+1].hh.b1:=c mod 256;mem[p+1].hh.b0:=(c div 256)mod 16;
if c>=28672 then begin if((eqtb[29321].int>=0)and(eqtb[29321].int<16))
then mem[p+1].hh.b0:=eqtb[29321].int;mem[p].hh.b0:=16;
end else mem[p].hh.b0:=16+(c div 4096);mem[curlist.tailfield].hh.rh:=p;
curlist.tailfield:=p;end;end;{:1333}{1337:}procedure mathlimitswitch;
label 10;
begin if curlist.headfield<>curlist.tailfield then if mem[curlist.
tailfield].hh.b0=17 then begin mem[curlist.tailfield].hh.b1:=curchr;
goto 10;end;begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1559);
end;begin helpptr:=1;helpline[0]:=1560;end;error;10:end;
{:1337}{1338:}procedure scandelimiter(p:halfword;r:boolean);
begin if r then scantwentysevenbitint else begin{430:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:430};
case curcmd of 11,12:curval:=eqtb[29647+curchr].int;
15:scantwentysevenbitint;others:curval:=-1 end;end;
if curval<0 then{1339:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1561);
end;begin helpptr:=6;helpline[5]:=1562;helpline[4]:=1563;
helpline[3]:=1564;helpline[2]:=1565;helpline[1]:=1566;helpline[0]:=1567;
end;backerror;curval:=0;end{:1339};
mem[p].qqqq.b0:=(curval div 1048576)mod 16;
mem[p].qqqq.b1:=(curval div 4096)mod 256;
mem[p].qqqq.b2:=(curval div 256)mod 16;mem[p].qqqq.b3:=curval mod 256;
end;{:1338}{1341:}procedure mathradical;
begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=getnode(5);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=24;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].hh:=emptyfield;
mem[curlist.tailfield+3].hh:=emptyfield;
mem[curlist.tailfield+2].hh:=emptyfield;
scandelimiter(curlist.tailfield+4,true);scanmath(curlist.tailfield+1);
end;{:1341}{1343:}procedure mathac;
begin if curcmd=45 then{1344:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1568);
end;printesc(611);print(1569);begin helpptr:=2;helpline[1]:=1570;
helpline[0]:=1571;end;error;end{:1344};
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=getnode(5);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=28;mem[curlist.tailfield].hh.b1:=0;
mem[curlist.tailfield+1].hh:=emptyfield;
mem[curlist.tailfield+3].hh:=emptyfield;
mem[curlist.tailfield+2].hh:=emptyfield;
mem[curlist.tailfield+4].hh.rh:=1;scanfifteenbitint;
mem[curlist.tailfield+4].hh.b1:=curval mod 256;
if(curval>=28672)and((eqtb[29321].int>=0)and(eqtb[29321].int<16))then
mem[curlist.tailfield+4].hh.b0:=eqtb[29321].int else mem[curlist.
tailfield+4].hh.b0:=(curval div 256)mod 16;
scanmath(curlist.tailfield+1);end;{:1343}{1350:}procedure appendchoices;
begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newchoice;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;incr(saveptr);
savestack[saveptr-1].int:=0;pushmath(13);scanleftbrace;end;
{:1350}{1352:}{1362:}function finmlist(p:halfword):halfword;
var q:halfword;
begin if curlist.auxfield.int<>-268435455 then{1363:}begin mem[curlist.
auxfield.int+3].hh.rh:=3;
mem[curlist.auxfield.int+3].hh.lh:=mem[curlist.headfield].hh.rh;
if p=-268435455 then q:=curlist.auxfield.int else begin q:=mem[curlist.
auxfield.int+2].hh.lh;
if(mem[q].hh.b0<>30)or(curlist.eTeXauxfield=-268435455)then confusion(
1299);
mem[curlist.auxfield.int+2].hh.lh:=mem[curlist.eTeXauxfield].hh.rh;
mem[curlist.eTeXauxfield].hh.rh:=curlist.auxfield.int;
mem[curlist.auxfield.int].hh.rh:=p;end;
end{:1363}else begin mem[curlist.tailfield].hh.rh:=p;
q:=mem[curlist.headfield].hh.rh;end;popnest;finmlist:=q;end;
{:1362}procedure buildchoices;label 10;var p:halfword;begin unsave;
p:=finmlist(-268435455);
case savestack[saveptr-1].int of 0:mem[curlist.tailfield+1].hh.lh:=p;
1:mem[curlist.tailfield+1].hh.rh:=p;2:mem[curlist.tailfield+2].hh.lh:=p;
3:begin mem[curlist.tailfield+2].hh.rh:=p;decr(saveptr);goto 10;end;end;
incr(savestack[saveptr-1].int);pushmath(13);scanleftbrace;10:end;
{:1352}{1354:}procedure subsup;var t:smallnumber;p:halfword;begin t:=0;
p:=-268435455;
if curlist.tailfield<>curlist.headfield then if(mem[curlist.tailfield].
hh.b0>=16)and(mem[curlist.tailfield].hh.b0<30)then begin p:=curlist.
tailfield+2+curcmd-7;t:=mem[p].hh.rh;end;
if(p=-268435455)or(t<>0)then{1355:}begin begin prevtail:=curlist.
tailfield;mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
p:=curlist.tailfield+2+curcmd-7;
if t<>0 then begin if curcmd=7 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1572);
end;begin helpptr:=1;helpline[0]:=1573;end;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1574);
end;begin helpptr:=1;helpline[0]:=1575;end;end;error;end;end{:1355};
scanmath(p);end;{:1354}{1359:}procedure mathfraction;var c:smallnumber;
begin c:=curchr;
if curlist.auxfield.int<>-268435455 then{1361:}begin if c>=3 then begin
scandelimiter(memtop-12,false);scandelimiter(memtop-12,false);end;
if c mod 3=0 then scandimen(false,false,false);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1582);
end;begin helpptr:=3;helpline[2]:=1583;helpline[1]:=1584;
helpline[0]:=1585;end;error;
end{:1361}else begin curlist.auxfield.int:=getnode(6);
mem[curlist.auxfield.int].hh.b0:=25;mem[curlist.auxfield.int].hh.b1:=0;
mem[curlist.auxfield.int+2].hh.rh:=3;
mem[curlist.auxfield.int+2].hh.lh:=mem[curlist.headfield].hh.rh;
mem[curlist.auxfield.int+3].hh:=emptyfield;
mem[curlist.auxfield.int+4].qqqq:=nulldelimiter;
mem[curlist.auxfield.int+5].qqqq:=nulldelimiter;
mem[curlist.headfield].hh.rh:=-268435455;
curlist.tailfield:=curlist.headfield;
{1360:}if c>=3 then begin scandelimiter(curlist.auxfield.int+4,false);
scandelimiter(curlist.auxfield.int+5,false);end;
case c mod 3 of 0:begin scandimen(false,false,false);
mem[curlist.auxfield.int+1].int:=curval;end;
1:mem[curlist.auxfield.int+1].int:=1073741824;
2:mem[curlist.auxfield.int+1].int:=0;end{:1360};end;end;
{:1359}{1369:}procedure mathleftright;var t:smallnumber;p:halfword;
q:halfword;begin t:=curchr;
if(t<>30)and(curgroup<>16)then{1370:}begin if curgroup=15 then begin
scandelimiter(memtop-12,false);begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(944);
end;if t=1 then begin printesc(1300);begin helpptr:=1;helpline[0]:=1586;
end;end else begin printesc(1299);begin helpptr:=1;helpline[0]:=1587;
end;end;error;end else offsave;end{:1370}else begin p:=newnoad;
mem[p].hh.b0:=t;scandelimiter(p+1,false);
if t=1 then begin mem[p].hh.b0:=31;mem[p].hh.b1:=1;end;
if t=30 then q:=p else begin q:=finmlist(p);unsave;end;
if t<>31 then begin pushmath(16);mem[curlist.headfield].hh.rh:=q;
curlist.tailfield:=p;curlist.eTeXauxfield:=p;
end else begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=23;mem[curlist.tailfield+1].hh.rh:=3;
mem[curlist.tailfield+1].hh.lh:=q;end;end;end;
{:1369}{1372:}{1744:}procedure appdisplay(j,b:halfword;d:scaled);
var z:scaled;s:scaled;e:scaled;x:integer;p,q,r,t,u:halfword;
begin s:=eqtb[29918].int;x:=eqtb[29384].int;
if x=0 then mem[b+4].int:=s+d else begin z:=eqtb[29917].int;p:=b;
{1745:}if x>0 then e:=z-d-mem[p+1].int else begin e:=d;
d:=z-e-mem[p+1].int;end;if j<>-268435455 then begin b:=copynodelist(j);
mem[b+3].int:=mem[p+3].int;mem[b+2].int:=mem[p+2].int;s:=s-mem[b+4].int;
d:=d+s;e:=e+mem[b+1].int-z-s;end;
if(mem[p].hh.b1)=2 then q:=p else begin r:=mem[p+5].hh.rh;freenode(p,9);
if r=-268435455 then confusion(2058);if x>0 then begin p:=r;repeat q:=r;
r:=mem[r].hh.rh;until r=-268435455;end else begin p:=-268435455;q:=r;
repeat t:=mem[r].hh.rh;mem[r].hh.rh:=p;p:=r;r:=t;until r=-268435455;end;
end{:1745};{1746:}if j=-268435455 then begin r:=newkern(0);
t:=newkern(0);end else begin r:=mem[b+5].hh.rh;t:=mem[r].hh.rh;end;
u:=newmath(0,3);if mem[t].hh.b0=10 then begin j:=newskipparam(8);
mem[q].hh.rh:=j;mem[j].hh.rh:=u;j:=mem[t+1].hh.lh;
mem[tempptr].hh.b0:=mem[j].hh.b0;mem[tempptr].hh.b1:=mem[j].hh.b1;
mem[tempptr+1].int:=e-mem[j+1].int;mem[tempptr+2].int:=-mem[j+2].int;
mem[tempptr+3].int:=-mem[j+3].int;mem[u].hh.rh:=t;
end else begin mem[t+1].int:=e;mem[t].hh.rh:=u;mem[q].hh.rh:=t;end;
u:=newmath(0,2);if mem[r].hh.b0=10 then begin j:=newskipparam(7);
mem[u].hh.rh:=j;mem[j].hh.rh:=p;j:=mem[r+1].hh.lh;
mem[tempptr].hh.b0:=mem[j].hh.b0;mem[tempptr].hh.b1:=mem[j].hh.b1;
mem[tempptr+1].int:=d-mem[j+1].int;mem[tempptr+2].int:=-mem[j+2].int;
mem[tempptr+3].int:=-mem[j+3].int;mem[r].hh.rh:=u;
end else begin mem[r+1].int:=d;mem[r].hh.rh:=p;mem[u].hh.rh:=r;
if j=-268435455 then begin b:=hpack(u,0,1);mem[b+4].int:=s;
end else mem[b+5].hh.rh:=u;end{:1746};end;appendtovlist(b);end;
{:1744}procedure aftermath;var l:boolean;danger:boolean;m:integer;
p:halfword;a:halfword;{1376:}b:halfword;w:scaled;z:scaled;e:scaled;
q:scaled;d:scaled;s:scaled;g1,g2:smallnumber;r:halfword;t:halfword;
pret:halfword;{:1376}{1741:}j:halfword;{:1741}begin danger:=false;
{1742:}if curlist.modefield=209 then j:=curlist.eTeXauxfield{:1742};
{1373:}if(fontparams[eqtb[27695].hh.rh]<22)or(fontparams[eqtb[27711].hh.
rh]<22)or(fontparams[eqtb[27727].hh.rh]<22)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1588);
end;begin helpptr:=3;helpline[2]:=1589;helpline[1]:=1590;
helpline[0]:=1591;end;error;flushmath;danger:=true;
end else if(fontparams[eqtb[27696].hh.rh]<13)or(fontparams[eqtb[27712].
hh.rh]<13)or(fontparams[eqtb[27728].hh.rh]<13)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1592);
end;begin helpptr:=3;helpline[2]:=1593;helpline[1]:=1594;
helpline[0]:=1595;end;error;flushmath;danger:=true;end{:1373};
m:=curlist.modefield;l:=false;p:=finmlist(-268435455);
if curlist.modefield=-m then begin{1375:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1596);
end;begin helpptr:=2;helpline[1]:=1597;helpline[0]:=1598;end;backerror;
end;end{:1375};curmlist:=p;curstyle:=2;mlistpenalties:=false;
mlisttohlist;a:=hpack(mem[memtop-3].hh.rh,0,1);mem[a].hh.b1:=2;unsave;
decr(saveptr);if savestack[saveptr+0].int=1 then l:=true;danger:=false;
{1742:}if curlist.modefield=209 then j:=curlist.eTeXauxfield{:1742};
{1373:}if(fontparams[eqtb[27695].hh.rh]<22)or(fontparams[eqtb[27711].hh.
rh]<22)or(fontparams[eqtb[27727].hh.rh]<22)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1588);
end;begin helpptr:=3;helpline[2]:=1589;helpline[1]:=1590;
helpline[0]:=1591;end;error;flushmath;danger:=true;
end else if(fontparams[eqtb[27696].hh.rh]<13)or(fontparams[eqtb[27712].
hh.rh]<13)or(fontparams[eqtb[27728].hh.rh]<13)then begin begin if
interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1592);
end;begin helpptr:=3;helpline[2]:=1593;helpline[1]:=1594;
helpline[0]:=1595;end;error;flushmath;danger:=true;end{:1373};
m:=curlist.modefield;p:=finmlist(-268435455);end else a:=-268435455;
if m<0 then{1374:}begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newmath(eqtb[29904].int,0);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;curmlist:=p;
curstyle:=2;mlistpenalties:=(curlist.modefield>0);mlisttohlist;
mem[curlist.tailfield].hh.rh:=mem[memtop-3].hh.rh;
while mem[curlist.tailfield].hh.rh<>-268435455 do curlist.tailfield:=mem
[curlist.tailfield].hh.rh;begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newmath(eqtb[29904].int,1);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
curlist.auxfield.hh.lh:=1000;unsave;
end{:1374}else begin if a=-268435455 then{1375:}begin getxtoken;
if curcmd<>3 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1596);
end;begin helpptr:=2;helpline[1]:=1597;helpline[0]:=1598;end;backerror;
end;end{:1375};{1377:}curmlist:=p;curstyle:=0;mlistpenalties:=false;
mlisttohlist;p:=mem[memtop-3].hh.rh;adjusttail:=memtop-5;
preadjusttail:=memtop-14;b:=hpack(p,0,1);p:=mem[b+5].hh.rh;
t:=adjusttail;adjusttail:=-268435455;pret:=preadjusttail;
preadjusttail:=-268435455;w:=mem[b+1].int;z:=eqtb[29917].int;
s:=eqtb[29918].int;if eqtb[29384].int<0 then s:=-s-z;
if(a=-268435455)or danger then begin e:=0;q:=0;
end else begin e:=mem[a+1].int;
q:=e+fontinfo[6+parambase[eqtb[27695].hh.rh]].int;end;
if w+q>z then{1379:}begin if(e<>0)and((w-totalshrink[0]+q<=z)or(
totalshrink[1]<>0)or(totalshrink[2]<>0)or(totalshrink[3]<>0))then begin
freenode(b,9);b:=hpack(p,z-q,0);end else begin e:=0;
if w>z then begin freenode(b,9);b:=hpack(p,z,0);end;end;w:=mem[b+1].int;
end{:1379};{1380:}mem[b].hh.b1:=2;d:=half(z-w);
if(e>0)and(d<2*e)then begin d:=half(z-w-e);
if p<>-268435455 then if not(p>=himemmin)then if mem[p].hh.b0=10 then d
:=0;end{:1380};{1381:}begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[29288].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if(d+s<=eqtb[29916].int)or l then begin g1:=3;g2:=4;
end else begin g1:=5;g2:=6;end;
if l and(e=0)then begin appdisplay(j,a,0);
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
end else begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newparamglue(g1);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1381};
{1382:}if e<>0 then begin r:=newkern(z-w-e-d);
if l then begin mem[a].hh.rh:=r;mem[r].hh.rh:=b;b:=a;d:=0;
end else begin mem[b].hh.rh:=r;mem[r].hh.rh:=a;end;b:=hpack(b,0,1);end;
appdisplay(j,b,d){:1382};
{1383:}if(a<>-268435455)and(e=0)and not l then begin begin prevtail:=
curlist.tailfield;mem[curlist.tailfield].hh.rh:=newpenalty(10000);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
appdisplay(j,a,z-mem[a+1].int);g2:=0;end;
if t<>memtop-5 then begin mem[curlist.tailfield].hh.rh:=mem[memtop-5].hh
.rh;curlist.tailfield:=t;end;
if pret<>memtop-14 then begin mem[curlist.tailfield].hh.rh:=mem[memtop
-14].hh.rh;curlist.tailfield:=pret;end;
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newpenalty(eqtb[29289].int);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if g2>0 then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newparamglue(g2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end{:1383};
{1743:}flushnodelist(j){:1743};resumeafterdisplay{:1377};end;end;
{:1372}{1378:}procedure resumeafterdisplay;
begin if curgroup<>15 then confusion(1599);unsave;
curlist.pgfield:=curlist.pgfield+3;pushnest;curlist.modefield:=105;
curlist.auxfield.hh.lh:=1000;
if eqtb[29327].int<=0 then curlang:=0 else if eqtb[29327].int>255 then
curlang:=0 else curlang:=eqtb[29327].int;
curlist.auxfield.hh.rh:=curlang;
curlist.pgfield:=(normmin(eqtb[29328].int)*64+normmin(eqtb[29329].int))
*65536+curlang;{469:}begin getxtoken;if curcmd<>10 then backinput;
end{:469};if nestptr=1 then buildpage;end;
{:1378}{1389:}{1393:}procedure getrtoken;label 20;
begin 20:repeat gettoken;until curtok<>2592;
if(curcs=0)or(curcs>eqtbtop)or((curcs>15514)and(curcs<=30192))then begin
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1617);
end;begin helpptr:=5;helpline[4]:=1618;helpline[3]:=1619;
helpline[2]:=1620;helpline[1]:=1621;helpline[0]:=1622;end;
if curcs=0 then backinput;curtok:=19609;inserror;goto 20;end;end;
{:1393}{1407:}procedure trapzeroglue;
begin if(mem[curval+1].int=0)and(mem[curval+2].int=0)and(mem[curval+3].
int=0)then begin incr(mem[membot].hh.rh);deleteglueref(curval);
curval:=membot;end;end;
{:1407}{1414:}procedure doregistercommand(a:smallnumber);label 40,10;
var l,q,r,s:halfword;p:0..3;e:boolean;w:integer;begin q:=curcmd;
e:=false;{1415:}begin if q<>89 then begin getxtoken;
if(curcmd>=73)and(curcmd<=76)then begin l:=curchr;p:=curcmd-73;goto 40;
end;if curcmd<>89 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(797);
end;printcmdchr(curcmd,curchr);print(798);printcmdchr(q,0);
begin helpptr:=1;helpline[0]:=1656;end;error;goto 10;end;end;
if(curchr<membot)or(curchr>membot+19)then begin l:=curchr;
p:=(mem[l].hh.b0 div 16);e:=true;end else begin p:=curchr-membot;
scanregisternum;if curval>255 then begin findsaelement(p,curval,true);
l:=curptr;e:=true;end else case p of 0:l:=curval+29391;
1:l:=curval+29937;2:l:=curval+26646;3:l:=curval+26902;end;end;end;
40:if p<2 then if e then w:=mem[l+2].int else w:=eqtb[l].int else if e
then s:=mem[l+1].hh.rh else s:=eqtb[l].hh.rh{:1415};
if q=89 then scanoptionalequals else if scankeyword(1652)then;
aritherror:=false;
if q<91 then{1416:}if p<2 then begin if p=0 then scanint else scandimen(
false,false,false);if q=90 then curval:=curval+w;
end else begin scanglue(p);if q=90 then{1417:}begin q:=newspec(curval);
r:=s;deleteglueref(curval);mem[q+1].int:=mem[q+1].int+mem[r+1].int;
if mem[q+2].int=0 then mem[q].hh.b0:=0;
if mem[q].hh.b0=mem[r].hh.b0 then mem[q+2].int:=mem[q+2].int+mem[r+2].
int else if(mem[q].hh.b0<mem[r].hh.b0)and(mem[r+2].int<>0)then begin mem
[q+2].int:=mem[r+2].int;mem[q].hh.b0:=mem[r].hh.b0;end;
if mem[q+3].int=0 then mem[q].hh.b1:=0;
if mem[q].hh.b1=mem[r].hh.b1 then mem[q+3].int:=mem[q+3].int+mem[r+3].
int else if(mem[q].hh.b1<mem[r].hh.b1)and(mem[r+3].int<>0)then begin mem
[q+3].int:=mem[r+3].int;mem[q].hh.b1:=mem[r].hh.b1;end;curval:=q;
end{:1417};end{:1416}else{1418:}begin scanint;
if p<2 then if q=91 then if p=0 then curval:=multandadd(w,curval,0,
2147483647)else curval:=multandadd(w,curval,0,1073741823)else curval:=
xovern(w,curval)else begin r:=newspec(s);
if q=91 then begin mem[r+1].int:=multandadd(mem[s+1].int,curval,0,
1073741823);mem[r+2].int:=multandadd(mem[s+2].int,curval,0,1073741823);
mem[r+3].int:=multandadd(mem[s+3].int,curval,0,1073741823);
end else begin mem[r+1].int:=xovern(mem[s+1].int,curval);
mem[r+2].int:=xovern(mem[s+2].int,curval);
mem[r+3].int:=xovern(mem[s+3].int,curval);end;curval:=r;end;end{:1418};
if aritherror then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1653);
end;begin helpptr:=2;helpline[1]:=1654;helpline[0]:=1655;end;
if p>=2 then deleteglueref(curval);error;goto 10;end;
if p<2 then if e then if(a>=4)then gsawdef(l,curval)else sawdef(l,curval
)else if(a>=4)then geqworddefine(l,curval)else eqworddefine(l,curval)
else begin trapzeroglue;
if e then if(a>=4)then gsadef(l,curval)else sadef(l,curval)else if(a>=4)
then geqdefine(l,120,curval)else eqdefine(l,120,curval);end;10:end;
{:1414}{1421:}procedure alteraux;var c:halfword;
begin if curchr<>abs(curlist.modefield)then reportillegalcase else begin
c:=curchr;scanoptionalequals;
if c=1 then begin scandimen(false,false,false);
curlist.auxfield.int:=curval;end else begin scanint;
if(curval<=0)or(curval>32767)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1659);
end;begin helpptr:=1;helpline[0]:=1660;end;interror(curval);
end else curlist.auxfield.hh.lh:=curval;end;end;end;
{:1421}{1422:}procedure alterprevgraf;var p:0..nestsize;
begin nest[nestptr]:=curlist;p:=nestptr;
while abs(nest[p].modefield)<>1 do decr(p);scanoptionalequals;scanint;
if curval<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1382);
end;printesc(621);begin helpptr:=1;helpline[0]:=1661;end;
interror(curval);end else begin nest[p].pgfield:=curval;
curlist:=nest[nestptr];end;end;{:1422}{1423:}procedure alterpagesofar;
var c:0..7;begin c:=curchr;scanoptionalequals;
scandimen(false,false,false);pagesofar[c]:=curval;end;
{:1423}{1424:}procedure alterinteger;var c:smallnumber;begin c:=curchr;
scanoptionalequals;scanint;
if c=0 then deadcycles:=curval{1696:}else if c=2 then begin if(curval<0)
or(curval>3)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(2043);
end;begin helpptr:=2;helpline[1]:=2044;helpline[0]:=2045;end;
interror(curval);end else begin curchr:=curval;newinteraction;end;
end{:1696}else insertpenalties:=curval;end;
{:1424}{1425:}procedure alterboxdimen;var c:smallnumber;b:halfword;
begin c:=curchr;scanregisternum;
if curval<256 then b:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then b:=-268435455 else b:=mem[curptr+1].hh.rh;end;
scanoptionalequals;scandimen(false,false,false);
if b<>-268435455 then mem[b+c].int:=curval;end;
{:1425}{1435:}procedure newfont(a:smallnumber);label 50;var u:halfword;
s:scaled;f:internalfontnumber;t:strnumber;oldsetting:0..21;
begin if jobname=0 then openlogfile;getrtoken;u:=curcs;
if u>=514 then t:=hash[u].rh else if u>=257 then if u=513 then t:=1109
else t:=u-257 else begin oldsetting:=selector;selector:=21;print(1109);
print(u-1);selector:=oldsetting;
begin if poolptr+1>poolsize then overflow(259,poolsize-initpoolptr);end;
t:=makestring;end;if(a>=4)then geqdefine(u,87,0)else eqdefine(u,87,0);
scanoptionalequals;scanfilename;{1436:}nameinprogress:=true;
if scankeyword(1675)then{1437:}begin scandimen(false,false,false);
s:=curval;
if(s<=0)or(s>=134217728)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1677);
end;printscaled(s);print(1678);begin helpptr:=2;helpline[1]:=1679;
helpline[0]:=1680;end;error;s:=10*65536;end;
end{:1437}else if scankeyword(1676)then begin scanint;s:=-curval;
if(curval<=0)or(curval>32768)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(645);
end;begin helpptr:=1;helpline[0]:=646;end;interror(curval);s:=-1000;end;
end else s:=-1000;nameinprogress:=false{:1436};
{1438:}for f:=1 to fontptr do if streqstr(fontname[f],curname)and
streqstr(fontarea[f],curarea)then begin if pdffontstep[f]=0 then begin
if s>0 then begin if s=fontsize[f]then goto 50;
end else begin aritherror:=false;
if fontsize[f]=xnoverd(fontdsize[f],-s,1000)then if not aritherror then
goto 50;end;end end{:1438};f:=readfontinfo(u,curname,curarea,s);
50:if(a>=4)then geqdefine(u,87,f)else eqdefine(u,87,f);
eqtb[17626+f]:=eqtb[u];hash[17626+f].rh:=t;end;
{:1435}{1443:}procedure newinteraction;begin println;
interaction:=curchr;
if interaction=0 then kpsemaketexdiscarderrors:=1 else
kpsemaketexdiscarderrors:=0;
{75:}if interaction=0 then selector:=16 else selector:=17{:75};
if logopened then selector:=selector+2;end;
{:1443}procedure prefixedcommand;label 30,10;var a:smallnumber;
f:internalfontnumber;j:halfword;k:fontindex;p,q,r:halfword;n:integer;
e:boolean;begin a:=0;
while curcmd=93 do begin if not odd(a div curchr)then a:=a+curchr;
{430:}repeat getxtoken;until(curcmd<>10)and(curcmd<>0){:430};
if curcmd<=70 then{1390:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1609);
end;printcmdchr(curcmd,curchr);printchar(39);begin helpptr:=1;
helpline[0]:=1610;end;if(eTeXmode=1)then helpline[0]:=1611;backerror;
goto 10;end{:1390};
if eqtb[29313].int>2 then if(eTeXmode=1)then showcurcmdchr;end;
{1391:}if a>=8 then begin j:=3585;a:=a-8;end else j:=0;
if(curcmd<>97)and((a mod 4<>0)or(j<>0))then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(264);
print(797);end;printesc(1601);print(1612);printesc(1602);
begin helpptr:=1;helpline[0]:=1613;end;
if(eTeXmode=1)then begin helpline[0]:=1614;print(1612);printesc(1615);
end;print(1616);printcmdchr(curcmd,curchr);printchar(39);error;
end{:1391};
{1392:}if eqtb[29320].int<>0 then if eqtb[29320].int<0 then begin if(a>=
4)then a:=a-4;end else begin if not(a>=4)then a:=a+4;end{:1392};
case curcmd of{1395:}87:if(a>=4)then geqdefine(27689,123,curchr)else
eqdefine(27689,123,curchr);
{:1395}{1396:}97:begin if odd(curchr)and not(a>=4)and(eqtb[29320].int>=0
)then a:=a+4;e:=(curchr>=2);getrtoken;p:=curcs;q:=scantoks(true,e);
if j<>0 then begin q:=getavail;mem[q].hh.lh:=j;
mem[q].hh.rh:=mem[defref].hh.rh;mem[defref].hh.rh:=q;end;
if(a>=4)then geqdefine(p,114+(a mod 4),defref)else eqdefine(p,114+(a mod
4),defref);end;
{:1396}{1399:}94:if curchr=11 then else if curchr=10 then begin selector
:=19;gettoken;mubytestoken:=curtok;
if curtok<=4095 then mubytestoken:=curtok mod 256;mubyteprefix:=60;
mubyterelax:=false;mubytetablein:=true;mubytetableout:=true;getxtoken;
if curcmd=10 then getxtoken;
if curcmd=8 then begin mubytetableout:=false;getxtoken;
if curcmd=8 then begin mubytetableout:=true;mubytetablein:=false;
getxtoken;end;
end else if(mubytestoken>4095)and(curcmd=6)then begin mubytetableout:=
false;scanint;mubyteprefix:=curval;getxtoken;
if mubyteprefix>50 then mubyteprefix:=52;
if mubyteprefix<=0 then mubyteprefix:=51;
end else if(mubytestoken>4095)and(curcmd=0)then begin mubytetableout:=
true;mubytetablein:=false;mubyterelax:=true;getxtoken;end;r:=getavail;
p:=r;while curcs=0 do begin begin q:=getavail;mem[p].hh.rh:=q;
mem[q].hh.lh:=curtok;p:=q;end;getxtoken;end;
if(curcmd<>67)or(curchr<>10)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(723);
end;printesc(601);print(724);begin helpptr:=2;helpline[1]:=725;
helpline[0]:=1628;end;backerror;end;p:=mem[r].hh.rh;
if(p=-268435455)and mubytetablein then begin begin if interaction=3 then
;if filelineerrorstylep then printfileline else printnl(264);
print(1629);end;printesc(1626);print(1630);begin helpptr:=2;
helpline[1]:=1631;helpline[0]:=1632;end;error;
end else begin while p<>-268435455 do begin begin strpool[poolptr]:=mem[
p].hh.lh mod 256;incr(poolptr);end;p:=mem[p].hh.rh;end;flushlist(r);
if(strstart[strptr]+1=poolptr)and(strpool[poolptr-1]=mubytestoken)then
begin if mubyteread[mubytestoken]<>-268435455 and mubytetablein then
disposemunode(mubyteread[mubytestoken]);
if mubytetablein then mubyteread[mubytestoken]:=-268435455;
if mubytetableout then mubytewrite[mubytestoken]:=0;
poolptr:=strstart[strptr];
end else begin if mubytetablein then mubyteupdate;
if mubytetableout then begin if mubytestoken>4095 then begin
disposemutableout(mubytestoken-4095);
if(strstart[strptr]<poolptr)or mubyterelax then begin r:=mubytecswrite[(
mubytestoken-4095)mod 128];p:=getavail;
mubytecswrite[(mubytestoken-4095)mod 128]:=p;
mem[p].hh.lh:=mubytestoken-4095;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
if mubyterelax then begin mem[p].hh.lh:=0;poolptr:=strstart[strptr];
end else mem[p].hh.lh:=slowmakestring;mem[p].hh.rh:=r;end;
end else begin if strstart[strptr]=poolptr then mubytewrite[mubytestoken
]:=0 else mubytewrite[mubytestoken]:=slowmakestring;end;
end else poolptr:=strstart[strptr];end;end;end else begin n:=curchr;
getrtoken;p:=curcs;if n=0 then begin repeat gettoken;until curcmd<>10;
if curtok=3133 then begin gettoken;if curcmd=10 then gettoken;end;
end else begin gettoken;q:=curtok;gettoken;backinput;curtok:=q;
backinput;end;
if curcmd>=114 then incr(mem[curchr].hh.lh)else if(curcmd=89)or(curcmd=
71)then if(curchr<membot)or(curchr>membot+19)then incr(mem[curchr+1].hh.
lh);
if(a>=4)then geqdefine(p,curcmd,curchr)else eqdefine(p,curcmd,curchr);
end;{:1399}{1402:}95:if curchr=7 then begin scancharnum;p:=29021+curval;
scanoptionalequals;scancharnum;n:=curval;scancharnum;
if(eqtb[29334].int>0)then begin begindiagnostic;printnl(1641);
print(p-29021);print(1642);print(n);printchar(32);print(curval);
enddiagnostic(false);end;n:=n*256+curval;
if(a>=4)then geqdefine(p,123,n)else eqdefine(p,123,n);
if(p-29021)<eqtb[29332].int then if(a>=4)then geqworddefine(29332,p
-29021)else eqworddefine(29332,p-29021);
if(p-29021)>eqtb[29333].int then if(a>=4)then geqworddefine(29333,p
-29021)else eqworddefine(29333,p-29021);end else begin n:=curchr;
getrtoken;p:=curcs;
if(a>=4)then geqdefine(p,0,256)else eqdefine(p,0,256);
scanoptionalequals;case n of 0:begin scancharnum;
if(a>=4)then geqdefine(p,68,curval)else eqdefine(p,68,curval);end;
1:begin scanfifteenbitint;
if(a>=4)then geqdefine(p,69,curval)else eqdefine(p,69,curval);end;
others:begin scanregisternum;if curval>255 then begin j:=n-2;
if j>3 then j:=5;findsaelement(j,curval,true);incr(mem[curptr+1].hh.lh);
if j=5 then j:=71 else j:=89;
if(a>=4)then geqdefine(p,j,curptr)else eqdefine(p,j,curptr);
end else case n of 2:if(a>=4)then geqdefine(p,73,29391+curval)else
eqdefine(p,73,29391+curval);
3:if(a>=4)then geqdefine(p,74,29937+curval)else eqdefine(p,74,29937+
curval);
4:if(a>=4)then geqdefine(p,75,26646+curval)else eqdefine(p,75,26646+
curval);
5:if(a>=4)then geqdefine(p,76,26902+curval)else eqdefine(p,76,26902+
curval);
6:if(a>=4)then geqdefine(p,72,27173+curval)else eqdefine(p,72,27173+
curval);end;end end;end;{:1402}{1403:}96:begin j:=curchr;scanint;
n:=curval;
if not scankeyword(1258)then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1499);
end;begin helpptr:=2;helpline[1]:=1643;helpline[0]:=1644;end;error;end;
getrtoken;p:=curcs;readtoks(n,p,j);
if(a>=4)then geqdefine(p,114,curval)else eqdefine(p,114,curval);end;
{:1403}{1404:}71,72:begin q:=curcs;e:=false;
if curcmd=71 then if curchr=membot then begin scanregisternum;
if curval>255 then begin findsaelement(5,curval,true);curchr:=curptr;
e:=true;end else curchr:=27173+curval;end else e:=true;p:=curchr;
scanoptionalequals;{430:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:430};
if curcmd<>1 then{1405:}if(curcmd=71)or(curcmd=72)then begin if curcmd=
71 then if curchr=membot then begin scanregisternum;
if curval<256 then q:=eqtb[27173+curval].hh.rh else begin findsaelement(
5,curval,false);
if curptr=-268435455 then q:=-268435455 else q:=mem[curptr+1].hh.rh;end;
end else q:=mem[curchr+1].hh.rh else q:=eqtb[curchr].hh.rh;
if q=-268435455 then if e then if(a>=4)then gsadef(p,-268435455)else
sadef(p,-268435455)else if(a>=4)then geqdefine(p,104,-268435455)else
eqdefine(p,104,-268435455)else begin incr(mem[q].hh.lh);
if e then if(a>=4)then gsadef(p,q)else sadef(p,q)else if(a>=4)then
geqdefine(p,114,q)else eqdefine(p,114,q);end;goto 30;end{:1405};
backinput;curcs:=q;q:=scantoks(false,false);
if mem[defref].hh.rh=-268435455 then begin if e then if(a>=4)then gsadef
(p,-268435455)else sadef(p,-268435455)else if(a>=4)then geqdefine(p,104,
-268435455)else eqdefine(p,104,-268435455);
begin mem[defref].hh.rh:=avail;avail:=defref;ifdef('STAT')decr(dynused);
endif('STAT')end;
end else begin if(p=27159)and not e then begin mem[q].hh.rh:=getavail;
q:=mem[q].hh.rh;mem[q].hh.lh:=637;q:=getavail;mem[q].hh.lh:=379;
mem[q].hh.rh:=mem[defref].hh.rh;mem[defref].hh.rh:=q;end;
if e then if(a>=4)then gsadef(p,defref)else sadef(p,defref)else if(a>=4)
then geqdefine(p,114,defref)else eqdefine(p,114,defref);end;end;
{:1404}{1406:}73:begin p:=curchr;scanoptionalequals;scanint;
if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);end;
74:begin p:=curchr;scanoptionalequals;scandimen(false,false,false);
if(a>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);end;
75,76:begin p:=curchr;n:=curcmd;scanoptionalequals;
if n=76 then scanglue(3)else scanglue(2);trapzeroglue;
if(a>=4)then geqdefine(p,120,curval)else eqdefine(p,120,curval);end;
{:1406}{1410:}85:begin{1411:}if curchr=27741 then n:=15 else if curchr=
28765 then n:=32768 else if curchr=28509 then n:=32767 else if curchr=
29647 then n:=16777215 else n:=255{:1411};p:=curchr;scancharnum;
if p=27690 then p:=curval else if p=27691 then p:=curval+256 else if p=
27692 then p:=curval+512 else p:=p+curval;scanoptionalequals;scanint;
if((curval<0)and(p<29647))or(curval>n)then begin begin if interaction=3
then;if filelineerrorstylep then printfileline else printnl(264);
print(1648);end;printint(curval);
if p<29647 then print(1649)else print(1650);printint(n);
begin helpptr:=1;helpline[0]:=1651;end;error;curval:=0;end;
if p<256 then xord[p]:=curval else if p<512 then xchr[p-256]:=curval
else if p<768 then xprn[p-512]:=curval else if p<28765 then if(a>=4)then
geqdefine(p,123,curval)else eqdefine(p,123,curval)else if p<29647 then
if(a>=4)then geqdefine(p,123,curval)else eqdefine(p,123,curval)else if(a
>=4)then geqworddefine(p,curval)else eqworddefine(p,curval);end;
{:1410}{1412:}86:begin p:=curchr;scanfourbitint;p:=p+curval;
scanoptionalequals;scanfontident;
if(a>=4)then geqdefine(p,123,curval)else eqdefine(p,123,curval);end;
{:1412}{1413:}89,90,91,92:doregistercommand(a);
{:1413}{1419:}98:begin scanregisternum;
if(a>=4)then n:=1073774592+curval else n:=1073741824+curval;
scanoptionalequals;
if setboxallowed then scanbox(n)else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(792);
end;printesc(625);begin helpptr:=2;helpline[1]:=1657;helpline[0]:=1658;
end;error;end;end;{:1419}{1420:}79:alteraux;80:alterprevgraf;
81:alterpagesofar;82:alterinteger;83:alterboxdimen;
{:1420}{1426:}84:begin q:=curchr;scanoptionalequals;scanint;n:=curval;
if n<=0 then p:=-268435455 else if q>27158 then begin n:=(curval div 2)
+1;p:=getnode(2*n+1);mem[p].hh.lh:=n;n:=curval;mem[p+1].int:=n;
for j:=p+2 to p+n+1 do begin scanint;mem[j].int:=curval;end;
if not odd(n)then mem[p+n+2].int:=0;end else begin p:=getnode(2*n+1);
mem[p].hh.lh:=n;for j:=1 to n do begin scandimen(false,false,false);
mem[p+2*j-1].int:=curval;scandimen(false,false,false);
mem[p+2*j].int:=curval;end;end;
if(a>=4)then geqdefine(q,121,p)else eqdefine(q,121,p);end;
{:1426}{1430:}99:if curchr=1 then begin ifdef('INITEX')if iniversion
then begin newpatterns;goto 30;end;
endif('INITEX')begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1662);
end;helpptr:=0;error;repeat gettoken;until curcmd=2;goto 10;
end else begin newhyphexceptions;goto 30;end;
{:1430}{1431:}77:begin findfontdimen(true);k:=curval;scanoptionalequals;
scandimen(false,false,false);fontinfo[k].int:=curval;end;
78:begin n:=curchr;scanfontident;f:=curval;
if n=6 then setnoligatures(f)else if n<2 then begin scanoptionalequals;
scanint;if n=0 then hyphenchar[f]:=curval else skewchar[f]:=curval;
end else begin scancharnum;p:=curval;scanoptionalequals;scanint;
case n of 2:setlpcode(f,p,curval);3:setrpcode(f,p,curval);
4:setefcode(f,p,curval);5:settagcode(f,p,curval);
7:setknbscode(f,p,curval);8:setstbscode(f,p,curval);
9:setshbscode(f,p,curval);10:setknbccode(f,p,curval);
11:setknaccode(f,p,curval);end;end;end;{:1431}{1434:}88:newfont(a);
101:newletterspacedfont(a);102:makefontcopy(a);
{:1434}{1442:}100:newinteraction;{:1442}others:confusion(1608)end;
30:{1447:}if aftertoken<>0 then begin curtok:=aftertoken;backinput;
aftertoken:=0;end{:1447};10:end;{:1389}{1448:}procedure doassignments;
label 10;begin while true do begin{430:}repeat getxtoken;
until(curcmd<>10)and(curcmd<>0){:430};if curcmd<=70 then goto 10;
setboxallowed:=false;prefixedcommand;setboxallowed:=true;end;10:end;
{:1448}{1453:}procedure openorclosein;var c:0..1;n:0..15;
begin c:=curchr;scanfourbitint;n:=curval;
if readopen[n]<>2 then begin aclose(readfile[n]);readopen[n]:=2;end;
if c<>0 then begin scanoptionalequals;scanfilename;
packfilename(curname,curarea,curext);texinputtype:=0;
if kpseinnameok(stringcast(nameoffile+1))and aopenin(readfile[n],
kpsetexformat)then readopen[n]:=1;end;end;
{:1453}{1457:}procedure issuemessage;var oldsetting:0..21;c:0..1;
s:strnumber;begin c:=curchr;mem[memtop-12].hh.rh:=scantoks(false,true);
oldsetting:=selector;selector:=21;messageprinting:=true;
activenoconvert:=true;tokenshow(defref);messageprinting:=false;
activenoconvert:=false;selector:=oldsetting;flushlist(defref);
begin if poolptr+1>poolsize then overflow(259,poolsize-initpoolptr);end;
s:=makestring;
if c=0 then{1458:}begin if termoffset+(strstart[s+1]-strstart[s])>
maxprintline-2 then println else if(termoffset>0)or(fileoffset>0)then
printchar(32);print(s);fflush(stdout);
end{:1458}else{1461:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(345);
end;print(s);
if eqtb[27167].hh.rh<>-268435455 then useerrhelp:=true else if
longhelpseen then begin helpptr:=1;helpline[0]:=1687;
end else begin if interaction<3 then longhelpseen:=true;
begin helpptr:=4;helpline[3]:=1688;helpline[2]:=1689;helpline[1]:=1690;
helpline[0]:=1691;end;end;error;useerrhelp:=false;end{:1461};
begin decr(strptr);poolptr:=strstart[strptr];end;end;
{:1457}{1466:}procedure shiftcase;var b:halfword;p:halfword;t:halfword;
c:eightbits;begin b:=curchr;p:=scantoks(false,false);
p:=mem[defref].hh.rh;while p<>-268435455 do begin{1467:}t:=mem[p].hh.lh;
if t<4352 then begin c:=t mod 256;
if eqtb[b+c].hh.rh<>0 then mem[p].hh.lh:=t-c+eqtb[b+c].hh.rh;end{:1467};
p:=mem[p].hh.rh;end;begintokenlist(mem[defref].hh.rh,3);
begin mem[defref].hh.rh:=avail;avail:=defref;ifdef('STAT')decr(dynused);
endif('STAT')end;end;{:1466}{1471:}procedure showwhatever;label 50;
var p:halfword;t:smallnumber;m:0..4;l:integer;n:integer;
begin case curchr of 3:begin{1941:}if(eqtb[29337].int>=0)and(eqtb[29337]
.int<16)and writeopen[eqtb[29337].int]then selector:=eqtb[29337].int;
{:1941}begindiagnostic;showactivities;end;
1:{1474:}begin scanregisternum;
if curval<256 then p:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
{1941:}if(eqtb[29337].int>=0)and(eqtb[29337].int<16)and writeopen[eqtb[
29337].int]then selector:=eqtb[29337].int;{:1941}begindiagnostic;
printnl(1707);printint(curval);printchar(61);
if p=-268435455 then print(431)else showbox(p);end{:1474};
0:{1472:}begin gettoken;
{1941:}if(eqtb[29337].int>=0)and(eqtb[29337].int<16)and writeopen[eqtb[
29337].int]then selector:=eqtb[29337].int;{:1941}if interaction=3 then;
printnl(1703);if curcs<>0 then begin sprintcs(curcs);printchar(61);end;
printmeaning;goto 50;end{:1472};
{1677:}4:begin{1941:}if(eqtb[29337].int>=0)and(eqtb[29337].int<16)and
writeopen[eqtb[29337].int]then selector:=eqtb[29337].int;
{:1941}begindiagnostic;showsavegroups;end;
{:1677}{1691:}6:begin{1941:}if(eqtb[29337].int>=0)and(eqtb[29337].int<16
)and writeopen[eqtb[29337].int]then selector:=eqtb[29337].int;
{:1941}begindiagnostic;printnl(345);println;
if condptr=-268435455 then begin printnl(380);print(2040);
end else begin p:=condptr;n:=0;repeat incr(n);p:=mem[p].hh.rh;
until p=-268435455;p:=condptr;t:=curif;l:=ifline;m:=iflimit;
repeat printnl(2041);printint(n);print(660);printcmdchr(108,t);
if m=2 then printesc(943);if l<>0 then begin print(2039);printint(l);
end;decr(n);t:=mem[p].hh.b1;l:=mem[p+1].int;m:=mem[p].hh.b0;
p:=mem[p].hh.rh;until p=-268435455;end;end;
{:1691}others:{1475:}begin p:=thetoks;
{1941:}if(eqtb[29337].int>=0)and(eqtb[29337].int<16)and writeopen[eqtb[
29337].int]then selector:=eqtb[29337].int;{:1941}if interaction=3 then;
printnl(1703);tokenshow(memtop-3);flushlist(mem[memtop-3].hh.rh);
goto 50;end{:1475}end;{1476:}enddiagnostic(true);
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1708);
end;if selector=19 then if eqtb[29306].int<=0 then begin selector:=17;
print(1709);selector:=19;end{:1476};
50:if selector<16 then begin println;
{75:}if interaction=0 then selector:=16 else selector:=17{:75};
if logopened then selector:=selector+2;
end else begin if interaction<3 then begin helpptr:=0;decr(errorcount);
end else if eqtb[29306].int>0 then begin begin helpptr:=3;
helpline[2]:=1698;helpline[1]:=1699;helpline[0]:=1700;end;
end else begin begin helpptr:=5;helpline[4]:=1698;helpline[3]:=1699;
helpline[2]:=1700;helpline[1]:=1701;helpline[0]:=1702;end;end;error;end;
end;{:1471}{1480:}ifdef('INITEX')procedure storefmtfile;
label 41,42,31,32;var j,k,l:integer;p,q:halfword;x:integer;
formatengine:^ASCIIcode;
begin{1482:}if saveptr<>0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1711);
end;begin helpptr:=1;helpline[0]:=1712;end;
begin if interaction=3 then interaction:=2;if logopened then error;
ifdef('TEXMF_DEBUG')if interaction>0 then debughelp;
endif('TEXMF_DEBUG')history:=3;jumpout;end;end{:1482};
{1508:}selector:=21;print(1730);print(jobname);printchar(32);
printint(eqtb[29300].int);printchar(46);printint(eqtb[29299].int);
printchar(46);printint(eqtb[29298].int);printchar(41);
if interaction=0 then selector:=18 else selector:=19;
begin if poolptr+1>poolsize then overflow(259,poolsize-initpoolptr);end;
formatident:=makestring;packjobname(951);
while not wopenout(fmtfile)do promptfilename(1731,951);printnl(1732);
slowprint(wmakenamestring(fmtfile));begin decr(strptr);
poolptr:=strstart[strptr];end;printnl(345);
slowprint(formatident){:1508};{1485:}dumpint(1462916184);
x:=strlen(enginename);formatengine:=xmallocarray(ASCIIcode,x+4);
strcpy(stringcast(formatengine),enginename);
for k:=x to x+3 do formatengine[k]:=0;x:=x+4-(x mod 4);dumpint(x);
dumpthings(formatengine[0],x);libcfree(formatengine);dumpint(312141437);
{1874:}dumpthings(xord[0],256);dumpthings(xchr[0],256);
dumpthings(xprn[0],256);{:1874};dumpint(268435455);dumpint(hashhigh);
{1654:}dumpint(eTeXmode);for j:=0 to-0 do eqtb[29389+j].int:=0;
{:1654}{1758:}while pseudofiles<>-268435455 do pseudoclose;
{:1758}dumpint(membot);dumpint(memtop);dumpint(30192);dumpint(8501);
dumpint(607){:1485};{1893:}dumpint(1296847960);
if mltexp then dumpint(1)else dumpint(0);{:1893};
{1902:}dumpint(1162040408);
if not enctexp then dumpint(0)else begin dumpint(1);
dumpthings(mubyteread[0],256);dumpthings(mubytewrite[0],256);
dumpthings(mubytecswrite[0],128);end;{:1902};{1487:}dumpint(poolptr);
dumpint(strptr);dumpthings(strstart[0],strptr+1);
dumpthings(strpool[0],poolptr);println;printint(strptr);print(1713);
printint(poolptr){:1487};{1489:}sortavail;varused:=0;dumpint(lomemmax);
dumpint(rover);if(eTeXmode=1)then for k:=0 to 5 do dumpint(saroot[k]);
p:=membot;q:=rover;x:=0;repeat dumpthings(mem[p],q+2-p);x:=x+q+2-p;
varused:=varused+q-p;p:=q+mem[q].hh.lh;q:=mem[q+1].hh.rh;until q=rover;
varused:=varused+lomemmax-p;dynused:=memend+1-himemmin;
dumpthings(mem[p],lomemmax+1-p);x:=x+lomemmax+1-p;dumpint(himemmin);
dumpint(avail);dumpthings(mem[himemmin],memend+1-himemmin);
x:=x+memend+1-himemmin;p:=avail;
while p<>-268435455 do begin decr(dynused);p:=mem[p].hh.rh;end;
dumpint(varused);dumpint(dynused);println;printint(x);print(1714);
printint(varused);printchar(38);printint(dynused){:1489};
{1491:}{1493:}k:=1;repeat j:=k;
while j<29276 do begin if(eqtb[j].hh.rh=eqtb[j+1].hh.rh)and(eqtb[j].hh.
b0=eqtb[j+1].hh.b0)and(eqtb[j].hh.b1=eqtb[j+1].hh.b1)then goto 41;
incr(j);end;l:=29277;goto 31;41:incr(j);l:=j;
while j<29276 do begin if(eqtb[j].hh.rh<>eqtb[j+1].hh.rh)or(eqtb[j].hh.
b0<>eqtb[j+1].hh.b0)or(eqtb[j].hh.b1<>eqtb[j+1].hh.b1)then goto 31;
incr(j);end;31:dumpint(l-k);dumpthings(eqtb[k],l-k);k:=j+1;dumpint(k-l);
until k=29277{:1493};{1494:}repeat j:=k;
while j<30192 do begin if eqtb[j].int=eqtb[j+1].int then goto 42;
incr(j);end;l:=30193;goto 32;42:incr(j);l:=j;
while j<30192 do begin if eqtb[j].int<>eqtb[j+1].int then goto 32;
incr(j);end;32:dumpint(l-k);dumpthings(eqtb[k],l-k);k:=j+1;dumpint(k-l);
until k>30192;if hashhigh>0 then dumpthings(eqtb[30193],hashhigh);
{:1494};dumpint(parloc);dumpint(writeloc);
{1496:}for p:=0 to 2100 do dumphh(prim[p]);dumpint(hashused);
cscount:=15513-hashused+hashhigh;
for p:=514 to hashused do if hash[p].rh<>0 then begin dumpint(p);
dumphh(hash[p]);incr(cscount);end;
dumpthings(hash[hashused+1],26626-hashused);
if hashhigh>0 then dumpthings(hash[30193],hashhigh);dumpint(cscount);
println;printint(cscount);print(1715){:1496}{:1491};
{1498:}dumpint(fmemptr);dumpthings(fontinfo[0],fmemptr);
dumpint(fontptr);{1500:}begin dumpthings(fontcheck[0],fontptr+1);
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
for k:=0 to fontptr do begin printnl(1719);printesc(hash[17626+k].rh);
printchar(61);printfilename(fontname[k],fontarea[k],345);
if fontsize[k]<>fontdsize[k]then begin print(906);
printscaled(fontsize[k]);print(312);end;end;end{:1500};println;
printint(fmemptr-7);print(1716);printint(fontptr-0);
if fontptr<>1 then print(1717)else print(1718){:1498};
{1502:}dumpint(hyphcount);if hyphnext<=607 then hyphnext:=hyphsize;
dumpint(hyphnext);
for k:=0 to hyphsize do if hyphword[k]<>0 then begin dumpint(k+65536*
hyphlink[k]);dumpint(hyphword[k]);dumpint(hyphlist[k]);end;println;
printint(hyphcount);if hyphcount<>1 then print(1720)else print(1721);
if trienotready then inittrie;dumpint(triemax);dumpint(hyphstart);
dumpthings(trietrl[0],triemax+1);dumpthings(trietro[0],triemax+1);
dumpthings(trietrc[0],triemax+1);dumpint(trieopptr);
dumpthings(hyfdistance[1],trieopptr);dumpthings(hyfnum[1],trieopptr);
dumpthings(hyfnext[1],trieopptr);printnl(1722);printint(triemax);
print(1723);printint(trieopptr);
if trieopptr<>1 then print(1724)else print(1725);print(1726);
printint(trieopsize);
for k:=255 downto 0 do if trieused[k]>0 then begin printnl(967);
printint(trieused[k]);print(1727);printint(k);dumpint(k);
dumpint(trieused[k]);end{:1502};{1504:}begin dumpimagemeta;
dumpint(pdfmemsize);dumpint(pdfmemptr);
for k:=1 to pdfmemptr-1 do begin dumpint(pdfmem[k]);end;println;
printint(pdfmemptr-1);print(1728);dumpint(objtabsize);dumpint(objptr);
dumpint(sysobjptr);
for k:=1 to sysobjptr do begin dumpint(objtab[k].int0);
dumpint(objtab[k].int1);dumpint(objtab[k].int3);dumpint(objtab[k].int4);
end;println;printint(sysobjptr);print(1729);dumpint(pdfobjcount);
dumpint(pdfxformcount);dumpint(pdfximagecount);dumpint(headtab[7]);
dumpint(headtab[8]);dumpint(headtab[9]);dumpint(pdflastobj);
dumpint(pdflastxform);dumpint(pdflastximage);dumptounicode;end{:1504};
{1506:}dumpint(interaction);dumpint(formatident);dumpint(69069);
eqtb[29308].int:=0{:1506};{1509:}wclose(fmtfile){:1509};end;
endif('INITEX'){:1480}{1528:}{1529:}procedure newwhatsit(s:smallnumber;
w:smallnumber);var p:halfword;begin p:=getnode(w);mem[p].hh.b0:=8;
mem[p].hh.b1:=s;mem[curlist.tailfield].hh.rh:=p;curlist.tailfield:=p;
end;{:1529}{1530:}procedure newwritewhatsit(w:smallnumber);
begin newwhatsit(curchr,w);
if w<>2 then scanfourbitint else begin scanint;
if curval<0 then curval:=17 else if(curval>15)and(curval<>18)then curval
:=16;end;mem[curlist.tailfield+1].hh.b0:=curval;
if eqtb[29339].int+64<0 then mem[curlist.tailfield+1].hh.b1:=0 else if
eqtb[29339].int+64>=2*64 then mem[curlist.tailfield+1].hh.b1:=2*64-1
else mem[curlist.tailfield+1].hh.b1:=eqtb[29339].int+64;end;
{:1530}{1537:}procedure checkpdfoutput(s:strnumber;iserror:boolean);
begin if eqtb[29342].int<=0 then begin if iserror then pdferror(s,1793)
else pdfwarning(s,1794,true,true);end end;procedure scanpdfexttoks;
begin begin if scantoks(false,true)<>0 then end;end;
procedure scanpdfextlatetoks;
begin begin if scantoks(false,false)<>0 then end;end;
procedure comparestrings;label 30;var s1,s2:strnumber;
i1,i2,j1,j2:poolpointer;savecurcs:halfword;begin savecurcs:=curcs;
begin if scantoks(false,true)<>0 then end;s1:=tokenstostring(defref);
deletetokenref(defref);curcs:=savecurcs;
begin if scantoks(false,true)<>0 then end;s2:=tokenstostring(defref);
deletetokenref(defref);i1:=strstart[s1];j1:=strstart[s1+1];
i2:=strstart[s2];j2:=strstart[s2+1];
while(i1<j1)and(i2<j2)do begin if strpool[i1]<strpool[i2]then begin
curval:=-1;goto 30;end;if strpool[i1]>strpool[i2]then begin curval:=1;
goto 30;end;incr(i1);incr(i2);end;
if(i1=j1)and(i2=j2)then curval:=0 else if i1<j1 then curval:=1 else
curval:=-1;30:flushstr(s2);flushstr(s1);curvallevel:=0;end;
{:1537}{1552:}procedure scaleimage(n:integer);var x,y,xr,yr:integer;
w,h:scaled;defaultres:integer;image:integer;
begin image:=pdfmem[objtab[n].int4+4];
if(imagerotate(image)=90)or(imagerotate(image)=270)then begin y:=
imagewidth(image);x:=imageheight(image);yr:=imagexres(image);
xr:=imageyres(image);end else begin x:=imagewidth(image);
y:=imageheight(image);xr:=imagexres(image);yr:=imageyres(image);end;
if(xr>65535)or(yr>65535)then begin xr:=0;yr:=0;
pdfwarning(1792,1823,true,true);end;
if(x<=0)or(y<=0)or(xr<0)or(yr<0)then pdferror(1792,1824);
if(xr=0)and(yr=0)then begin end else if(x/oneinch>=xr)or(y/oneinch>=yr)
then begin xr:=0;yr:=0;pdfwarning(1792,1825,true,true);end;
if ispdfimage(image)then begin w:=x;h:=y;
end else begin defaultres:=fixint(eqtb[29346].int,0,65535);
if(defaultres>0)and((xr=0)or(yr=0))then begin xr:=defaultres;
yr:=defaultres;end;
if(pdfmem[objtab[n].int4+0]=-1073741824)and(pdfmem[objtab[n].int4+1]=
-1073741824)then begin if(xr>0)and(yr>0)then begin w:=extxnoverd(
onehundredinch,x,100*xr);h:=extxnoverd(onehundredinch,y,100*yr);
end else begin w:=extxnoverd(onehundredinch,x,7200);
h:=extxnoverd(onehundredinch,y,7200);end;end;end;
if(pdfmem[objtab[n].int4+0]=-1073741824)and(pdfmem[objtab[n].int4+1]=
-1073741824)and(pdfmem[objtab[n].int4+2]=-1073741824)then begin pdfmem[
objtab[n].int4+0]:=w;pdfmem[objtab[n].int4+1]:=h;
pdfmem[objtab[n].int4+2]:=0;
end else if(pdfmem[objtab[n].int4+0]=-1073741824)then begin if(pdfmem[
objtab[n].int4+1]=-1073741824)then begin pdfmem[objtab[n].int4+0]:=
extxnoverd(h,x,y);pdfmem[objtab[n].int4+1]:=h-pdfmem[objtab[n].int4+2];
end else if(pdfmem[objtab[n].int4+2]=-1073741824)then begin pdfmem[
objtab[n].int4+0]:=extxnoverd(pdfmem[objtab[n].int4+1],x,y);
pdfmem[objtab[n].int4+2]:=0;
end else begin pdfmem[objtab[n].int4+0]:=extxnoverd(pdfmem[objtab[n].
int4+1]+pdfmem[objtab[n].int4+2],x,y);end;
end else begin if(pdfmem[objtab[n].int4+1]=-1073741824)and(pdfmem[objtab
[n].int4+2]=-1073741824)then begin pdfmem[objtab[n].int4+1]:=extxnoverd(
pdfmem[objtab[n].int4+0],y,x);pdfmem[objtab[n].int4+2]:=0;
end else if(pdfmem[objtab[n].int4+1]=-1073741824)then begin pdfmem[
objtab[n].int4+1]:=extxnoverd(pdfmem[objtab[n].int4+0],y,x)-pdfmem[
objtab[n].int4+2];
end else if(pdfmem[objtab[n].int4+2]=-1073741824)then begin pdfmem[
objtab[n].int4+2]:=0;end else;end;end;function scanpdfboxspec:integer;
begin scanpdfboxspec:=0;
if scankeyword(1826)then scanpdfboxspec:=pdfboxspecmedia else if
scankeyword(1827)then scanpdfboxspec:=pdfboxspeccrop else if scankeyword
(1828)then scanpdfboxspec:=pdfboxspecbleed else if scankeyword(1829)then
scanpdfboxspec:=pdfboxspectrim else if scankeyword(1830)then
scanpdfboxspec:=pdfboxspecart end;procedure scanaltrule;label 21;
begin if altrule=-268435455 then altrule:=newrule;
mem[altrule+1].int:=-1073741824;mem[altrule+3].int:=-1073741824;
mem[altrule+2].int:=-1073741824;
21:if scankeyword(847)then begin scandimen(false,false,false);
mem[altrule+1].int:=curval;goto 21;end;
if scankeyword(848)then begin scandimen(false,false,false);
mem[altrule+3].int:=curval;goto 21;end;
if scankeyword(849)then begin scandimen(false,false,false);
mem[altrule+2].int:=curval;goto 21;end;end;procedure scanimage;label 21;
var k:integer;named:strnumber;s:strnumber;
page,pagebox,colorspace:integer;begin incr(pdfximagecount);
pdfcreateobj(9,pdfximagecount);k:=objptr;objtab[k].int4:=pdfgetmem(5);
scanaltrule;pdfmem[objtab[k].int4+0]:=mem[altrule+1].int;
pdfmem[objtab[k].int4+1]:=mem[altrule+3].int;
pdfmem[objtab[k].int4+2]:=mem[altrule+2].int;
if scankeyword(1816)then begin scanpdfexttoks;
pdfmem[objtab[k].int4+3]:=defref;
end else pdfmem[objtab[k].int4+3]:=-268435455;named:=0;
if scankeyword(1831)then begin scanpdfexttoks;
named:=tokenstostring(defref);deletetokenref(defref);
end else if scankeyword(900)then begin scanint;page:=curval;
end else page:=1;if scankeyword(1832)then begin scanint;
colorspace:=curval;end else colorspace:=0;pagebox:=scanpdfboxspec;
if pagebox=0 then pagebox:=eqtb[29354].int;scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);
if eqtb[29349].int<>0 then begin pdfwarning(1833,1834,true,true);
eqtb[29353].int:=eqtb[29349].int;eqtb[29349].int:=0;
warnpdfpagebox:=false;end;
if eqtb[29350].int<>0 then begin pdfwarning(1833,1835,true,true);
eqtb[29355].int:=eqtb[29350].int;eqtb[29350].int:=0;end;
if eqtb[29353].int>0 then begin if warnpdfpagebox then begin pdfwarning(
1833,1836,true,true);warnpdfpagebox:=false;end;pagebox:=eqtb[29353].int;
end;if pagebox=0 then pagebox:=pdfboxspeccrop;
pdfmem[objtab[k].int4+4]:=readimage(s,page,named,colorspace,pagebox,eqtb
[29351].int,eqtb[29352].int,eqtb[29355].int);
if named<>0 then flushstr(named);flushstr(s);scaleimage(k);
pdflastximage:=k;
pdflastximagepages:=imagepages(pdfmem[objtab[k].int4+4]);
pdflastximagecolordepth:=imagecolordepth(pdfmem[objtab[k].int4+4]);end;
{:1552}{1556:}function scanaction:halfword;var p:integer;
begin p:=getnode(4);scanaction:=p;mem[p+1].hh.lh:=-268435455;
mem[p+2].hh.rh:=-268435455;
if scankeyword(1839)then mem[p].hh.b0:=3 else if scankeyword(1840)then
mem[p].hh.b0:=1 else if scankeyword(1841)then mem[p].hh.b0:=2 else
pdferror(1792,1842);if mem[p].hh.b0=3 then begin scanpdfexttoks;
mem[p+2].hh.lh:=defref;goto 10;end;mem[p].hh.b1:=0;
if scankeyword(889)then begin scanpdfexttoks;mem[p+1].hh.lh:=defref;end;
if scankeyword(1843)then begin if mem[p].hh.b0<>1 then pdferror(1792,
1844);if mem[p+1].hh.lh<>-268435455 then begin scanpdfexttoks;
mem[p].hh.b1:=mem[p].hh.b1+2;mem[p+3].hh.rh:=defref;
end else if scankeyword(1845)then begin scanpdfexttoks;
mem[p].hh.b1:=mem[p].hh.b1+2;mem[p+3].hh.rh:=defref;
end else if scankeyword(1208)then begin scanint;
if curval<=0 then pdferror(1792,1846);mem[p+3].hh.rh:=curval;
end else pdferror(1792,1847);end else mem[p+3].hh.rh:=-268435455;
if scankeyword(900)then begin if mem[p].hh.b0<>1 then pdferror(1792,1848
);mem[p].hh.b0:=0;scanint;if curval<=0 then pdferror(1792,1849);
mem[p].hh.rh:=curval;scanpdfexttoks;mem[p+2].hh.lh:=defref;
end else if scankeyword(1845)then begin scanpdfexttoks;
mem[p].hh.b1:=mem[p].hh.b1+1;mem[p].hh.rh:=defref;
end else if scankeyword(1208)then begin if(mem[p].hh.b0=1)and(mem[p+1].
hh.lh<>-268435455)then pdferror(1792,1850);scanint;
if curval<=0 then pdferror(1792,1846);mem[p].hh.rh:=curval;
end else pdferror(1792,1847);
if scankeyword(1851)then begin mem[p+1].hh.rh:=1;{469:}begin getxtoken;
if curcmd<>10 then backinput;end{:469};
end else if scankeyword(1852)then begin mem[p+1].hh.rh:=2;
{469:}begin getxtoken;if curcmd<>10 then backinput;end{:469};
end else mem[p+1].hh.rh:=0;
if(mem[p+1].hh.rh>0)and(((mem[p].hh.b0<>1)and(mem[p].hh.b0<>0))or(mem[p
+1].hh.lh=-268435455))then pdferror(1792,1853);end;
procedure newannotwhatsit(w,s:smallnumber);begin newwhatsit(w,s);
scanaltrule;mem[curlist.tailfield+1].int:=mem[altrule+1].int;
mem[curlist.tailfield+2].int:=mem[altrule+3].int;
mem[curlist.tailfield+3].int:=mem[altrule+2].int;
if(w=16)then begin if scankeyword(1816)then begin scanpdfexttoks;
mem[curlist.tailfield+5].hh.lh:=defref;
end else mem[curlist.tailfield+5].hh.lh:=-268435455;end;
if(w=20)or(w=21)then begin if scankeyword(1816)then begin scanpdfexttoks
;mem[curlist.tailfield+6].hh.lh:=defref;
end else mem[curlist.tailfield+6].hh.lh:=-268435455;end;end;
{:1556}{1562:}function outlinelistcount(p:halfword):integer;
var k:integer;begin k:=1;
while pdfmem[objtab[p].int4+2]<>0 do begin incr(k);
p:=pdfmem[objtab[p].int4+2];end;outlinelistcount:=k;end;
{:1562}{1566:}procedure scanthreadid;
begin if scankeyword(1208)then begin scanint;
if curval<=0 then pdferror(1792,1846);
if curval>268435455 then pdferror(1792,1045);
mem[curlist.tailfield+5].hh.rh:=curval;
mem[curlist.tailfield+5].hh.b1:=0;
end else if scankeyword(1845)then begin scanpdfexttoks;
mem[curlist.tailfield+5].hh.rh:=defref;
mem[curlist.tailfield+5].hh.b1:=1;end else pdferror(1792,1847);end;
{:1566}{1573:}function newsnapnode(s:smallnumber):halfword;
var p:halfword;begin scanglue(2);
if mem[curval+1].int<0 then pdferror(1792,1881);p:=getnode(3);
mem[p].hh.b0:=8;mem[p].hh.b1:=s;mem[p].hh.rh:=-268435455;
mem[p+1].hh.lh:=curval;mem[p+2].int:=0;newsnapnode:=p;end;
{:1573}{1577:}function concattokens(q,r:halfword):halfword;
var p:halfword;begin if q=-268435455 then begin concattokens:=r;goto 10;
end;p:=q;while mem[p].hh.rh<>-268435455 do p:=mem[p].hh.rh;
mem[p].hh.rh:=mem[r].hh.rh;begin mem[r].hh.rh:=avail;avail:=r;
ifdef('STAT')decr(dynused);endif('STAT')end;concattokens:=q;end;
{:1577}{1587:}procedure pdfincludechars;var s:strnumber;k:poolpointer;
f:internalfontnumber;begin scanfontident;f:=curval;
if f=0 then pdferror(604,884);pdfcheckvfcurval;
if not fontused[f]then pdfinitfont(f);scanpdfexttoks;
s:=tokenstostring(defref);deletetokenref(defref);k:=strstart[s];
while k<strstart[s+1]do begin pdfmarkchar(f,strpool[k]);incr(k);end;
flushstr(s);end;procedure glyphtounicode;var s1,s2:strnumber;
begin scanpdfexttoks;s1:=tokenstostring(defref);deletetokenref(defref);
scanpdfexttoks;s2:=tokenstostring(defref);deletetokenref(defref);
deftounicode(s1,s2);flushstr(s2);flushstr(s1);end;
{:1587}{1600:}procedure threadtitle(thread:integer);
begin pdfprint(1901);
if objtab[thread].int0<0 then pdfprint(-objtab[thread].int0)else
pdfprintint(objtab[thread].int0);begin pdfprint(41);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
procedure pdffixthread(thread:integer);var a:halfword;
begin pdfwarning(1841,1902,true,false);
if objtab[thread].int0<0 then begin print(1207);
print(-objtab[thread].int0);print(125);end else begin print(1208);
printint(objtab[thread].int0);end;print(1209);println;println;
pdfnewdict(0,0,0);a:=objptr;pdfindirectln(84,thread);
pdfindirectln(86,a);pdfindirectln(78,a);pdfindirectln(80,headtab[1]);
pdfprint(1903);pdfprintbp(eqtb[29926].int);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintbp(eqtb[29927].int);begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfenddict;
pdfbegindict(thread,1);begin pdfprint(1904);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;threadtitle(thread);
begin pdfprint(1035);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfindirectln(70,a);
pdfenddict;end;procedure outthread(thread:integer);var a,b:halfword;
lastattr:integer;
begin if objtab[thread].int4=0 then begin pdffixthread(thread);goto 10;
end;pdfbegindict(thread,1);a:=objtab[thread].int4;b:=a;lastattr:=0;
repeat if pdfmem[objtab[a].int4+4]<>0 then lastattr:=pdfmem[objtab[a].
int4+4];a:=pdfmem[objtab[a].int4+2];until a=b;
if lastattr<>0 then begin pdfprint(lastattr);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;
end else begin begin pdfprint(1904);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;threadtitle(thread);
begin pdfprint(1035);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
pdfindirectln(70,a);pdfenddict;repeat pdfbegindict(a,1);
if a=b then pdfindirectln(84,thread);
pdfindirectln(86,pdfmem[objtab[a].int4+3]);
pdfindirectln(78,pdfmem[objtab[a].int4+2]);
pdfindirectln(80,pdfmem[objtab[a].int4+1]);
pdfindirectln(82,pdfmem[objtab[a].int4]);pdfenddict;
a:=pdfmem[objtab[a].int4+2];until a=b;end;{:1600}procedure doextension;
var i,j,k:integer;p,q,r:halfword;
begin case curchr of 0:{1531:}begin newwritewhatsit(3);
scanoptionalequals;scanfilename;mem[curlist.tailfield+1].hh.rh:=curname;
mem[curlist.tailfield+2].hh.lh:=curarea;
mem[curlist.tailfield+2].hh.rh:=curext;end{:1531};
1:{1532:}begin k:=curcs;newwritewhatsit(2);curcs:=k;
p:=scantoks(false,false);mem[curlist.tailfield+1].hh.rh:=defref;
end{:1532};2:{1533:}begin newwritewhatsit(2);
mem[curlist.tailfield+1].hh.rh:=-268435455;end{:1533};
3:{1534:}begin if scankeyword(1487)then begin newwhatsit(4,2);
if eqtb[29341].int+64<0 then mem[curlist.tailfield+1].hh.b0:=0 else if
eqtb[29341].int+64>=2*64 then mem[curlist.tailfield+1].hh.b0:=2*64-1
else mem[curlist.tailfield+1].hh.b0:=eqtb[29341].int+64;
if eqtb[29339].int+64<0 then mem[curlist.tailfield+1].hh.b1:=0 else if
eqtb[29339].int+64>=2*64 then mem[curlist.tailfield+1].hh.b1:=2*64-1
else mem[curlist.tailfield+1].hh.b1:=eqtb[29339].int+64;
if(eqtb[29341].int=2)or(eqtb[29341].int=3)then if(eqtb[29339].int>2)or(
eqtb[29339].int=-1)or(eqtb[29339].int=-2)then writenoexpanding:=true;
p:=scantoks(false,false);mem[curlist.tailfield+1].hh.rh:=defref;
writenoexpanding:=false;end else begin newwhatsit(3,2);
if eqtb[29341].int+64<0 then mem[curlist.tailfield+1].hh.b0:=0 else if
eqtb[29341].int+64>=2*64 then mem[curlist.tailfield+1].hh.b0:=2*64-1
else mem[curlist.tailfield+1].hh.b0:=eqtb[29341].int+64;
if eqtb[29339].int+64<0 then mem[curlist.tailfield+1].hh.b1:=0 else if
eqtb[29339].int+64>=2*64 then mem[curlist.tailfield+1].hh.b1:=2*64-1
else mem[curlist.tailfield+1].hh.b1:=eqtb[29339].int+64;
if(eqtb[29341].int=2)or(eqtb[29341].int=3)then if(eqtb[29339].int>2)or(
eqtb[29339].int=-1)or(eqtb[29339].int=-2)then writenoexpanding:=true;
p:=scantoks(false,true);mem[curlist.tailfield+1].hh.rh:=defref;
writenoexpanding:=false;end;end{:1534};5:{1623:}begin getxtoken;
if curcmd=59 then begin if curchr<=2 then begin p:=curlist.tailfield;
doextension;outwhat(curlist.tailfield);flushnodelist(curlist.tailfield);
curlist.tailfield:=p;mem[p].hh.rh:=-268435455;
end else case curchr of 9:begin doextension;
if objtab[pdflastobj].int4=0 then pdferror(1792,1947);
pdfwriteobj(pdflastobj);end;11:begin doextension;
pdfcurform:=pdflastxform;
pdfshipout(pdfmem[objtab[pdflastxform].int4+3],false);end;
13:begin doextension;pdfwriteimage(pdflastximage);end;
others:backinput end;end else backinput;end{:1623};
6:{1625:}if abs(curlist.modefield)<>105 then reportillegalcase else
begin newwhatsit(5,2);scanint;
if curval<=0 then curlist.auxfield.hh.rh:=0 else if curval>255 then
curlist.auxfield.hh.rh:=0 else curlist.auxfield.hh.rh:=curval;
mem[curlist.tailfield+1].hh.rh:=curlist.auxfield.hh.rh;
mem[curlist.tailfield+1].hh.b0:=normmin(eqtb[29328].int);
mem[curlist.tailfield+1].hh.b1:=normmin(eqtb[29329].int);end{:1625};
15:{1558:}begin checkpdfoutput(1854,true);
if scankeyword(1813)then begin pdflastannot:=pdfnewobjnum;
{469:}begin getxtoken;if curcmd<>10 then backinput;end{:469};
end else begin if scankeyword(1814)then begin scanint;k:=curval;
if(k<=0)or(k>objptr)or(objtab[k].int4<>0)then pdferror(1792,1855);
end else k:=pdfnewobjnum;newannotwhatsit(15,7);
mem[curlist.tailfield+6].int:=k;scanpdfexttoks;
mem[curlist.tailfield+5].hh.lh:=defref;pdflastannot:=k;end end{:1558};
25:{1579:}begin checkpdfoutput(1885,false);scanpdfexttoks;
if eqtb[29342].int>0 then pdfcatalogtoks:=concattokens(pdfcatalogtoks,
defref);
if scankeyword(1886)then begin if pdfcatalogopenaction<>0 then pdferror(
1792,1887)else begin p:=scanaction;pdfnewobj(0,0,1);
if eqtb[29342].int>0 then pdfcatalogopenaction:=objptr;writeaction(p);
pdfendobj;
begin if mem[p+2].hh.rh=-268435455 then begin if mem[p].hh.b0=3 then
deletetokenref(mem[p+2].hh.lh)else begin if mem[p+1].hh.lh<>-268435455
then deletetokenref(mem[p+1].hh.lh);
if mem[p].hh.b0=0 then deletetokenref(mem[p+2].hh.lh)else if(mem[p].hh.
b1 and 1)=1 then deletetokenref(mem[p].hh.rh);
if(mem[p].hh.b1 and 2)=2 then deletetokenref(mem[p+3].hh.rh);end;
freenode(p,4);end else decr(mem[p+2].hh.rh);end;end;end end{:1579};
19:{1565:}begin checkpdfoutput(1863,true);q:=curlist.tailfield;
newwhatsit(19,7);if scankeyword(1843)then begin scanint;
if curval<=0 then pdferror(1792,1864);
mem[curlist.tailfield+6].hh.rh:=curval;j:=6;
end else begin mem[curlist.tailfield+6].hh.rh:=-268435455;j:=5;end;
if scankeyword(1208)then begin scanint;
if curval<=0 then pdferror(1792,1846);
if curval>268435455 then pdferror(1792,1045);
mem[curlist.tailfield+5].hh.rh:=curval;
mem[curlist.tailfield+5].hh.b1:=0;
end else if scankeyword(1845)then begin scanpdfexttoks;
mem[curlist.tailfield+5].hh.rh:=defref;
mem[curlist.tailfield+5].hh.b1:=1;end else pdferror(1792,1847);
if scankeyword(1865)then begin mem[curlist.tailfield+5].hh.b0:=0;
if scankeyword(1866)then begin scanint;
if curval>268435455 then pdferror(1792,1045);
mem[curlist.tailfield+6].hh.lh:=curval;
end else mem[curlist.tailfield+6].hh.lh:=-268435455;
end else if scankeyword(1867)then mem[curlist.tailfield+5].hh.b0:=5 else
if scankeyword(1868)then mem[curlist.tailfield+5].hh.b0:=6 else if
scankeyword(1869)then mem[curlist.tailfield+5].hh.b0:=4 else if
scankeyword(1870)then mem[curlist.tailfield+5].hh.b0:=2 else if
scankeyword(1871)then mem[curlist.tailfield+5].hh.b0:=3 else if
scankeyword(1872)then mem[curlist.tailfield+5].hh.b0:=7 else if
scankeyword(1873)then mem[curlist.tailfield+5].hh.b0:=1 else pdferror(
1792,1874);{469:}begin getxtoken;if curcmd<>10 then backinput;end{:469};
if mem[curlist.tailfield+5].hh.b0=7 then begin scanaltrule;
mem[curlist.tailfield+1].int:=mem[altrule+1].int;
mem[curlist.tailfield+2].int:=mem[altrule+3].int;
mem[curlist.tailfield+3].int:=mem[altrule+2].int;end;
if mem[curlist.tailfield+5].hh.b1<>0 then begin i:=tokenstostring(mem[
curlist.tailfield+5].hh.rh);k:=findobj(j,i,true);flushstr(i);
end else k:=findobj(j,mem[curlist.tailfield+5].hh.rh,false);
if(k<>0)and(objtab[k].int4<>-268435455)then begin warndestdup(mem[
curlist.tailfield+5].hh.rh,mem[curlist.tailfield+5].hh.b1,1875,1876);
flushnodelist(curlist.tailfield);curlist.tailfield:=q;
mem[q].hh.rh:=-268435455;end;end{:1565};
17:{1561:}begin checkpdfoutput(1858,true);
if abs(curlist.modefield)=1 then pdferror(1792,1859);newwhatsit(17,2);
end{:1561};22:{1569:}begin checkpdfoutput(1879,true);newwhatsit(22,2);
end{:1569};27:{1589:}begin checkpdfoutput(1215,true);scanfontident;
k:=curval;if k=0 then pdferror(604,884);scanpdfexttoks;
pdffontattr[k]:=tokenstostring(defref);end{:1589};
34:{1535:}readexpandfont{:1535};
28:{1588:}begin checkpdfoutput(1891,true);pdfincludechars;end{:1588};
24:{1578:}begin checkpdfoutput(1884,false);scanpdfexttoks;
if eqtb[29342].int>0 then pdfinfotoks:=concattokens(pdfinfotoks,defref);
end{:1578};7:{1538:}begin checkpdfoutput(1795,true);
if scankeyword(1487)then k:=8 else k:=7;newwhatsit(k,2);
if scankeyword(901)then mem[curlist.tailfield+1].hh.lh:=2 else if
scankeyword(900)then mem[curlist.tailfield+1].hh.lh:=1 else mem[curlist.
tailfield+1].hh.lh:=0;
if k=7 then scanpdfexttoks else scanpdfextlatetoks;
mem[curlist.tailfield+1].hh.rh:=defref;end{:1538};
40:{1539:}begin checkpdfoutput(1796,true);scanint;
if curval>=colorstackused then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1797);
end;printint(curval);begin helpptr:=3;helpline[2]:=1798;
helpline[1]:=1799;helpline[0]:=1800;end;error;curval:=0;end;
if curval<0 then begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1801);
end;begin helpptr:=2;helpline[1]:=1799;helpline[0]:=1800;end;error;
curval:=0;end;if scankeyword(1802)then begin i:=0;j:=3;
end else if scankeyword(1803)then begin i:=1;j:=3;
end else if scankeyword(1804)then begin i:=2;j:=2;
end else if scankeyword(1805)then begin i:=3;j:=2;end else begin i:=-1;
end;if i>=0 then begin newwhatsit(40,j);
mem[curlist.tailfield+1].hh.rh:=curval;
mem[curlist.tailfield+1].hh.lh:=i;if i<=1 then begin scanpdfexttoks;
mem[curlist.tailfield+2].hh.rh:=defref;end;
end else begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1806);
end;begin helpptr:=3;helpline[2]:=1807;helpline[1]:=1808;
helpline[0]:=1809;end;error;end end{:1539};
41:{1540:}begin checkpdfoutput(1146,true);newwhatsit(41,2);
scanpdfexttoks;mem[curlist.tailfield+1].hh.rh:=defref;end{:1540};
42:{1541:}begin checkpdfoutput(1810,true);newwhatsit(42,2);end{:1541};
43:{1542:}begin checkpdfoutput(1811,true);newwhatsit(43,2);end{:1542};
29:{1590:}begin checkpdfoutput(1892,true);scanpdfexttoks;
pdfmapfile(defref);deletetokenref(defref);end{:1590};
30:{1591:}begin checkpdfoutput(1893,true);scanpdfexttoks;
pdfmapline(defref);deletetokenref(defref);end{:1591};
26:{1580:}begin checkpdfoutput(1888,true);scanpdfexttoks;
pdfnamestoks:=concattokens(pdfnamestoks,defref);end{:1580};
9:{1544:}begin checkpdfoutput(1812,true);
if scankeyword(1813)then begin{469:}begin getxtoken;
if curcmd<>10 then backinput;end{:469};incr(pdfobjcount);
pdfcreateobj(7,pdfobjcount);pdflastobj:=objptr;end else begin k:=-1;
if scankeyword(1814)then begin scanint;k:=curval;
if(k<=0)or(k>objptr)or(objtab[k].int4<>0)then begin pdfwarning(1812,1815
,true,true);pdfretval:=-1;k:=-1;end;end;
if k<0 then begin incr(pdfobjcount);pdfcreateobj(7,pdfobjcount);
k:=objptr;end;objtab[k].int4:=pdfgetmem(4);
if scankeyword(1036)then begin pdfmem[objtab[k].int4+1]:=1;
if scankeyword(1816)then begin scanpdfexttoks;
pdfmem[objtab[k].int4+2]:=defref;
end else pdfmem[objtab[k].int4+2]:=-268435455;
end else pdfmem[objtab[k].int4+1]:=0;
if scankeyword(889)then pdfmem[objtab[k].int4+3]:=1 else pdfmem[objtab[k
].int4+3]:=0;scanpdfexttoks;pdfmem[objtab[k].int4+0]:=defref;
pdflastobj:=k;end;end{:1544};18:{1563:}begin checkpdfoutput(1860,true);
if scankeyword(1816)then begin scanpdfexttoks;r:=defref;end else r:=0;
p:=scanaction;if scankeyword(546)then begin scanint;i:=curval;
end else i:=0;scanpdfexttoks;q:=defref;pdfnewobj(0,0,1);j:=objptr;
writeaction(p);pdfendobj;
begin if mem[p+2].hh.rh=-268435455 then begin if mem[p].hh.b0=3 then
deletetokenref(mem[p+2].hh.lh)else begin if mem[p+1].hh.lh<>-268435455
then deletetokenref(mem[p+1].hh.lh);
if mem[p].hh.b0=0 then deletetokenref(mem[p+2].hh.lh)else if(mem[p].hh.
b1 and 1)=1 then deletetokenref(mem[p].hh.rh);
if(mem[p].hh.b1 and 2)=2 then deletetokenref(mem[p+3].hh.rh);end;
freenode(p,4);end else decr(mem[p+2].hh.rh);end;pdfcreateobj(4,0);
k:=objptr;objtab[k].int4:=pdfgetmem(8);pdfmem[objtab[k].int4+6]:=j;
objtab[k].int0:=i;pdfnewobj(0,0,1);pdfprintstrln(tokenstostring(q));
flushstr(lasttokensstring);deletetokenref(q);pdfendobj;
pdfmem[objtab[k].int4]:=objptr;pdfmem[objtab[k].int4+2]:=0;
pdfmem[objtab[k].int4+3]:=0;pdfmem[objtab[k].int4+4]:=0;
pdfmem[objtab[k].int4+5]:=0;pdfmem[objtab[k].int4+1]:=pdfparentoutline;
pdfmem[objtab[k].int4+7]:=r;
if pdffirstoutline=0 then pdffirstoutline:=k;
if pdflastoutline=0 then begin if pdfparentoutline<>0 then pdfmem[objtab
[pdfparentoutline].int4+4]:=k;
end else begin pdfmem[objtab[pdflastoutline].int4+3]:=k;
pdfmem[objtab[k].int4+2]:=pdflastoutline;end;pdflastoutline:=k;
if objtab[k].int0<>0 then begin pdfparentoutline:=k;pdflastoutline:=0;
end else if(pdfparentoutline<>0)and(outlinelistcount(k)=abs(objtab[
pdfparentoutline].int0))then begin j:=pdflastoutline;
repeat pdfmem[objtab[pdfparentoutline].int4+5]:=j;j:=pdfparentoutline;
pdfparentoutline:=pdfmem[objtab[pdfparentoutline].int4+1];
until(pdfparentoutline=0)or(outlinelistcount(j)<abs(objtab[
pdfparentoutline].int0));
if pdfparentoutline=0 then pdflastoutline:=pdffirstoutline else
pdflastoutline:=pdfmem[objtab[pdfparentoutline].int4+4];
while pdfmem[objtab[pdflastoutline].int4+3]<>0 do pdflastoutline:=pdfmem
[objtab[pdflastoutline].int4+3];end;end{:1563};
10:{1546:}begin checkpdfoutput(1818,true);scanint;pdfcheckobj(7,curval);
newwhatsit(10,2);mem[curlist.tailfield+1].hh.lh:=curval;end{:1546};
12:{1549:}begin checkpdfoutput(1822,true);scanint;pdfcheckobj(8,curval);
newwhatsit(12,5);mem[curlist.tailfield+4].hh.lh:=curval;
mem[curlist.tailfield+1].int:=pdfmem[objtab[curval].int4+0];
mem[curlist.tailfield+2].int:=pdfmem[objtab[curval].int4+1];
mem[curlist.tailfield+3].int:=pdfmem[objtab[curval].int4+2];end{:1549};
14:{1554:}begin checkpdfoutput(1838,true);scanint;pdfcheckobj(9,curval);
newwhatsit(14,5);mem[curlist.tailfield+4].hh.lh:=curval;
mem[curlist.tailfield+1].int:=pdfmem[objtab[curval].int4+0];
mem[curlist.tailfield+2].int:=pdfmem[objtab[curval].int4+1];
mem[curlist.tailfield+3].int:=pdfmem[objtab[curval].int4+2];end{:1554};
23:{1576:}begin newwhatsit(23,2);end{:1576};
36:{1572:}begin checkpdfoutput(1880,true);newwhatsit(36,2);end{:1572};
38:{1575:}begin checkpdfoutput(1883,true);newwhatsit(38,2);scanint;
mem[curlist.tailfield+1].int:=fixint(curval,0,1000);end{:1575};
37:{1574:}begin checkpdfoutput(1882,true);
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newsnapnode(37);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end{:1574};
16:{1560:}begin checkpdfoutput(1856,true);
if abs(curlist.modefield)=1 then pdferror(1792,1857);k:=pdfnewobjnum;
newannotwhatsit(16,7);mem[curlist.tailfield+5].hh.rh:=scanaction;
mem[curlist.tailfield+6].int:=k;pdflastlink:=k;end{:1560};
21:{1568:}begin checkpdfoutput(1878,true);newannotwhatsit(21,7);
scanthreadid;end{:1568};20:{1567:}begin checkpdfoutput(1877,true);
newannotwhatsit(20,7);scanthreadid;end{:1567};
31:{1581:}begin checkpdfoutput(1889,false);scanpdfexttoks;
if eqtb[29342].int>0 then pdftrailertoks:=concattokens(pdftrailertoks,
defref);end{:1581};32:{1582:}begin checkpdfoutput(1890,false);
scanpdfexttoks;if eqtb[29342].int>0 then pdftraileridtoks:=concattokens(
pdftraileridtoks,defref);end{:1582};
11:{1548:}begin checkpdfoutput(1819,true);incr(pdfxformcount);
pdfcreateobj(8,pdfxformcount);k:=objptr;objtab[k].int4:=pdfgetmem(6);
if scankeyword(1816)then begin scanpdfexttoks;
pdfmem[objtab[k].int4+4]:=defref;
end else pdfmem[objtab[k].int4+4]:=-268435455;
if scankeyword(1820)then begin scanpdfexttoks;
pdfmem[objtab[k].int4+5]:=defref;
end else pdfmem[objtab[k].int4+5]:=-268435455;scanregisternum;
if curval<256 then p:=eqtb[27433+curval].hh.rh else begin findsaelement(
4,curval,false);
if curptr=-268435455 then p:=-268435455 else p:=mem[curptr+1].hh.rh;end;
if p=-268435455 then pdferror(1792,1821);
pdfmem[objtab[k].int4+0]:=mem[p+1].int;
pdfmem[objtab[k].int4+1]:=mem[p+3].int;
pdfmem[objtab[k].int4+2]:=mem[p+2].int;pdfmem[objtab[k].int4+3]:=p;
if curval<256 then eqtb[27433+curval].hh.rh:=-268435455 else begin
findsaelement(4,curval,false);
if curptr<>-268435455 then begin mem[curptr+1].hh.rh:=-268435455;
incr(mem[curptr+1].hh.lh);deletesaref(curptr);end;end;pdflastxform:=k;
end{:1548};13:{1553:}begin checkpdfoutput(1837,true);checkpdfversion;
scanimage;end{:1553};
33:{1586:}begin secondsandmicros(epochseconds,microseconds);end{:1586};
35:{1585:}begin scanint;if curval<0 then curval:=-curval;
randomseed:=curval;initrandoms(randomseed);end{:1585};
39:{1592:}begin glyphtounicode;end{:1592};
44:{1593:}begin checkpdfoutput(1894,true);scanfontident;k:=curval;
if k=0 then pdferror(604,884);pdffontnobuiltintounicode[k]:=true;
end{:1593};45:{1594:}begin checkpdfoutput(1895,true);newwhatsit(45,2);
end{:1594};46:{1595:}begin checkpdfoutput(1896,true);newwhatsit(46,2);
end{:1595};47:{1596:}begin checkpdfoutput(1897,true);newwhatsit(47,2);
end{:1596};48:{1597:}begin checkpdfoutput(1898,true);newwhatsit(48,2);
end{:1597};49:{1598:}begin checkpdfoutput(1899,true);newwhatsit(49,2);
end{:1598};50:{1599:}begin checkpdfoutput(1900,true);scanpdfexttoks;
pdfspacefontname:=tokenstostring(defref);deletetokenref(defref);
end{:1599};others:confusion(1792)end;end;
{:1528}{1624:}procedure fixlanguage;var l:ASCIIcode;
begin if eqtb[29327].int<=0 then l:=0 else if eqtb[29327].int>255 then l
:=0 else l:=eqtb[29327].int;
if l<>curlist.auxfield.hh.rh then begin newwhatsit(5,2);
mem[curlist.tailfield+1].hh.rh:=l;curlist.auxfield.hh.rh:=l;
mem[curlist.tailfield+1].hh.b0:=normmin(eqtb[29328].int);
mem[curlist.tailfield+1].hh.b1:=normmin(eqtb[29329].int);end;end;
{:1624}{1939:}procedure insertsrcspecial;var toklist,p,q:halfword;
begin if(sourcefilenamestack[inopen]>0 and isnewsource(
sourcefilenamestack[inopen],line))then begin toklist:=getavail;
p:=toklist;mem[p].hh.lh:=19619;mem[p].hh.rh:=getavail;p:=mem[p].hh.rh;
mem[p].hh.lh:=379;
q:=strtoks(makesrcspecial(sourcefilenamestack[inopen],line));
mem[p].hh.rh:=mem[memtop-3].hh.rh;p:=q;mem[p].hh.rh:=getavail;
p:=mem[p].hh.rh;mem[p].hh.lh:=637;begintokenlist(toklist,4);
remembersourceinfo(sourcefilenamestack[inopen],line);end;end;
procedure appendsrcspecial;var q:halfword;
begin if(sourcefilenamestack[inopen]>0 and isnewsource(
sourcefilenamestack[inopen],line))then begin newwhatsit(3,2);
mem[curlist.tailfield+1].hh.b0:=0;defref:=getavail;
mem[defref].hh.lh:=-268435455;
q:=strtoks(makesrcspecial(sourcefilenamestack[inopen],line));
mem[defref].hh.rh:=mem[memtop-3].hh.rh;
mem[curlist.tailfield+1].hh.rh:=defref;
remembersourceinfo(sourcefilenamestack[inopen],line);end;end;
{:1939}{1246:}procedure handlerightbrace;var p,q:halfword;d:scaled;
f:integer;begin case curgroup of 1:unsave;
0:begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1469);
end;begin helpptr:=2;helpline[1]:=1470;helpline[0]:=1471;end;error;end;
14,15,16:extrarightbrace;{1263:}2:package(0);
3:begin adjusttail:=memtop-5;preadjusttail:=memtop-14;package(0);end;
4:if(eqtb[29336].int>0)and(curlist.modefield=105)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;package(0);end;
5:if(eqtb[29336].int>0)and(curlist.modefield=105)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;package(4);end;
{:1263}{1278:}11:if(eqtb[29336].int>1)and(curlist.modefield=105)then
begin backinput;curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;q:=eqtb[26638].hh.rh;incr(mem[q].hh.rh);
d:=eqtb[29909].int;f:=eqtb[29319].int;unsave;saveptr:=saveptr-2;
p:=vpackage(mem[curlist.headfield].hh.rh,0,1,1073741823);popnest;
if savestack[saveptr+0].int<255 then begin begin prevtail:=curlist.
tailfield;mem[curlist.tailfield].hh.rh:=getnode(5);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=3;
mem[curlist.tailfield].hh.b1:=savestack[saveptr+0].int;
mem[curlist.tailfield+3].int:=mem[p+3].int+mem[p+2].int;
mem[curlist.tailfield+4].hh.lh:=mem[p+5].hh.rh;
mem[curlist.tailfield+4].hh.rh:=q;mem[curlist.tailfield+2].int:=d;
mem[curlist.tailfield+1].int:=f;
end else begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=getnode(2);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=5;
mem[curlist.tailfield].hh.b1:=savestack[saveptr+1].int;
mem[curlist.tailfield+1].int:=mem[p+5].hh.rh;deleteglueref(q);end;
freenode(p,9);if nestptr=0 then buildpage;end;
8:if(eqtb[29336].int>1)and(curlist.modefield=105)then begin backinput;
curtok:=partoken;backinput;curinput.indexfield:=4;
end else{1203:}begin while(curinput.statefield=0)and(curinput.locfield=
-268435455)and(curinput.indexfield=3)do endtokenlist;
if(curinput.statefield<>0)or(curinput.locfield<>-268435455)or(curinput.
indexfield<>6)then{1204:}begin begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(688);
end;begin helpptr:=2;helpline[1]:=1438;helpline[0]:=1439;end;error;
repeat gettoken;until curinput.locfield=-268435455;end{:1204};
outputcanend:=true;endtokenlist;outputcanend:=false;endgraf;unsave;
outputactive:=false;insertpenalties:=0;
{1205:}if eqtb[27688].hh.rh<>-268435455 then begin begin if interaction=
3 then;if filelineerrorstylep then printfileline else printnl(264);
print(1440);end;printesc(430);printint(255);begin helpptr:=3;
helpline[2]:=1441;helpline[1]:=1442;helpline[0]:=1443;end;boxerror(255);
end{:1205};
if curlist.tailfield<>curlist.headfield then begin mem[pagetail].hh.rh:=
mem[curlist.headfield].hh.rh;pagetail:=curlist.tailfield;end;
if mem[memtop-2].hh.rh<>-268435455 then begin if mem[memtop-1].hh.rh=
-268435455 then nest[0].tailfield:=pagetail;
mem[pagetail].hh.rh:=mem[memtop-1].hh.rh;
mem[memtop-1].hh.rh:=mem[memtop-2].hh.rh;
mem[memtop-2].hh.rh:=-268435455;pagetail:=memtop-2;end;
flushnodelist(discptr[2]);discptr[2]:=-268435455;popnest;buildpage;
end{:1203};{:1278}{1296:}10:builddiscretionary;
{:1296}{1310:}6:begin backinput;curtok:=19610;
begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(723);
end;printesc(1322);print(724);begin helpptr:=1;helpline[0]:=1553;end;
inserror;end;
{:1310}{1311:}7:if(eqtb[29336].int>1)and(curlist.modefield=105)then
begin backinput;curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;unsave;alignpeek;end;
{:1311}{1346:}12:if(eqtb[29336].int>0)and(curlist.modefield=105)then
begin backinput;curtok:=partoken;backinput;curinput.indexfield:=4;
end else begin endgraf;unsave;saveptr:=saveptr-2;
p:=vpackage(mem[curlist.headfield].hh.rh,savestack[saveptr+1].int,
savestack[saveptr+0].int,1073741823);popnest;
begin prevtail:=curlist.tailfield;mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=29;mem[curlist.tailfield+1].hh.rh:=2;
mem[curlist.tailfield+1].hh.lh:=p;end;{:1346}{1351:}13:buildchoices;
{:1351}{1364:}9:begin unsave;decr(saveptr);
mem[savestack[saveptr+0].int].hh.rh:=3;p:=finmlist(-268435455);
mem[savestack[saveptr+0].int].hh.lh:=p;
if p<>-268435455 then if mem[p].hh.rh=-268435455 then if mem[p].hh.b0=16
then begin if mem[p+3].hh.rh=0 then if mem[p+2].hh.rh=0 then begin mem[
savestack[saveptr+0].int].hh:=mem[p+1].hh;freenode(p,4);end;
end else if mem[p].hh.b0=28 then if savestack[saveptr+0].int=curlist.
tailfield+1 then if mem[curlist.tailfield].hh.b0=16 then{1365:}begin q:=
curlist.headfield;
while mem[q].hh.rh<>curlist.tailfield do q:=mem[q].hh.rh;
mem[q].hh.rh:=p;freenode(curlist.tailfield,4);curlist.tailfield:=p;
end{:1365};end;{:1364}others:confusion(1472)end;end;
{:1246}procedure maincontrol;
label 60,21,70,80,90,91,92,95,100,101,110,111,112,120,10;var t:integer;
tmpk1,tmpk2:halfword;
begin if eqtb[27165].hh.rh<>-268435455 then begintokenlist(eqtb[27165].
hh.rh,12);60:getxtoken;
21:{1208:}if interrupt<>0 then if OKtointerrupt then begin backinput;
begin if interrupt<>0 then pauseforinstructions;end;goto 60;end;
ifdef('TEXMF_DEBUG')if panicking then checkmem(false);
endif('TEXMF_DEBUG')if eqtb[29313].int>0 then showcurcmdchr{:1208};
case abs(curlist.modefield)+curcmd of 116,117,173:goto 70;
121:begin scancharnum;curchr:=curval;goto 70;end;170:begin getxtoken;
if(curcmd=11)or(curcmd=12)or(curcmd=68)or(curcmd=16)then cancelboundary
:=true;goto 21;end;
115:if(curlist.auxfield.hh.lh=1000)or(eqtb[29364].int>0)then goto 120
else appspace;169,273:goto 120;{1223:}1,105,209,11,219,274:;
40,144,248:begin if curchr=0 then begin{432:}repeat getxtoken;
until curcmd<>10{:432};goto 21;end else begin t:=scannerstatus;
scannerstatus:=0;getnext;scannerstatus:=t;
if curcs<514 then curcs:=primlookup(curcs-257)else curcs:=primlookup(
hash[curcs].rh);if curcs<>0 then begin curcmd:=eqtb[15526+curcs].hh.b0;
curchr:=eqtb[15526+curcs].hh.rh;curtok:=19621+curcs;goto 21;end;end;end;
15:if itsallover then goto 10;
{1226:}23,126,230,71,175,279,{:1226}{1276:}39,{:1276}{1289:}45,{:1289}
{1322:}49,153,{:1322}7,111,215:reportillegalcase;
{1224:}8,112,9,113,18,122,70,174,51,155,16,120,50,154,53,157,67,171,54,
158,55,159,57,161,56,160,31,135,52,156,29,133,47,151,218,222,223,236,233
,242,245{:1224}:insertdollarsign;
{1234:}37,140,244:begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=scanrulespec;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
if abs(curlist.modefield)=1 then curlist.auxfield.int:=eqtb[29935].int
else if abs(curlist.modefield)=105 then curlist.auxfield.hh.lh:=1000;
end;{:1234}{1235:}28,131,235,237:appendglue;30,134,238,239:appendkern;
{:1235}{1241:}2,106:newsavelevel(1);62,166,270:newsavelevel(14);
63,167,271:if curgroup=14 then unsave else offsave;
{:1241}{1245:}3,107,211:handlerightbrace;
{:1245}{1251:}22,127,231:begin t:=curchr;scandimen(false,false,false);
if t=0 then scanbox(curval)else scanbox(-curval);end;
32,136,240:scanbox(1073807261+curchr);21,125,229:beginbox(0);
{:1251}{1268:}44:newgraf(curchr>0);
12,13,17,69,4,24,36,46,48,27,34,65,66:begin backinput;newgraf(true);end;
{:1268}{1270:}148,252:if curchr<>2 then indentinhmode;
{:1270}{1272:}14:begin normalparagraph;
if curlist.modefield>0 then buildpage;end;
118:begin if alignstate<0 then offsave;endgraf;
if curlist.modefield=1 then buildpage;end;
119,132,141,129,137:headforvmode;
{:1272}{1275:}38,142,246,143,247:begininsertoradjust;
19,123,227:makemark;{:1275}{1280:}43,147,251:appendpenalty;
{:1280}{1282:}26,130,234:deletelast;{:1282}{1287:}25,128,232:unpackage;
{:1287}{1290:}149:appenditaliccorrection;
253:begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newkern(0);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
{:1290}{1294:}152,256:appenddiscretionary;{:1294}{1300:}150:makeaccent;
{:1300}{1304:}6,110,214,5,109,213:alignerror;35,139,243:noalignerror;
64,168,272:omiterror;{:1304}{1308:}33:initalign;
138:{1703:}if curchr>0 then begin if eTeXenabled((eqtb[29389].int>0),
curcmd,curchr)then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newmath(0,curchr);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
end else{:1703}initalign;
241:if privileged then if curgroup=15 then initalign else offsave;
10,114:if(eqtb[29336].int>1)and(curlist.modefield=105)then begin
backinput;curtok:=partoken;backinput;curinput.indexfield:=4;
end else doendv;{:1308}{1312:}68,172,276:cserror;
{:1312}{1315:}108:initmath;
{:1315}{1318:}257:if privileged then if curgroup=15 then starteqno else
offsave;{:1318}{1328:}210:begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;backinput;
scanmath(curlist.tailfield+1);end;
{:1328}{1332:}220,221,277:setmathchar(eqtb[28765+curchr].hh.rh);
225:begin scancharnum;curchr:=curval;
setmathchar(eqtb[28765+curchr].hh.rh);end;226:begin scanfifteenbitint;
setmathchar(curval);end;278:setmathchar(curchr);
224:begin scantwentysevenbitint;setmathchar(curval div 4096);end;
{:1332}{1336:}259:begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newnoad;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b0:=curchr;scanmath(curlist.tailfield+1);end;
260:mathlimitswitch;{:1336}{1340:}275:mathradical;
{:1340}{1342:}254,255:mathac;{:1342}{1345:}265:begin scanspec(12,false);
normalparagraph;pushnest;curlist.modefield:=-1;
curlist.auxfield.int:=eqtb[29935].int;
if(insertsrcspecialeveryvbox)then insertsrcspecial;
if eqtb[27164].hh.rh<>-268435455 then begintokenlist(eqtb[27164].hh.rh,
11);end;{:1345}{1349:}262:begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newstyle(curchr);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
264:begin begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newglue(membot);
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
mem[curlist.tailfield].hh.b1:=98;end;263:appendchoices;
{:1349}{1353:}217,216:subsup;{:1353}{1358:}261:mathfraction;
{:1358}{1368:}258:mathleftright;
{:1368}{1371:}212:if curgroup=15 then aftermath else offsave;
{:1371}{1388:}72,176,280,73,177,281,74,178,282,75,179,283,76,180,284,77,
181,285,78,182,286,79,183,287,80,184,288,81,185,289,82,186,290,83,187,
291,84,188,292,85,189,293,86,190,294,87,191,295,88,192,296,89,193,297,
102,206,310,103,207,311,90,194,298,91,195,299,92,196,300,93,197,301,94,
198,302,95,199,303,96,200,304,97,201,305,98,202,306,99,203,307,100,204,
308,101,205,309:prefixedcommand;{:1388}{1446:}41,145,249:begin gettoken;
aftertoken:=curtok;end;{:1446}{1449:}42,146,250:begin gettoken;
saveforafter(curtok);end;104,208,312:begin gettoken;
if curcs>0 then begin parloc:=curcs;partoken:=curtok;end;end;
{:1449}{1452:}61,165,269:openorclosein;
{:1452}{1454:}59,163,267:issuemessage;
{:1454}{1463:}58,162,266:shiftcase;
{:1463}{1468:}20,124,228:showwhatever;
{:1468}{1527:}60,164,268:doextension;{:1527}{:1223}end;goto 60;
70:{1211:}if((curlist.headfield=curlist.tailfield)and(curlist.modefield>
0))then begin if(insertsrcspecialauto)then appendsrcspecial;end;
mains:=eqtb[28509+curchr].hh.rh;
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;savetail:=-268435455;
mainf:=eqtb[27689].hh.rh;bchar:=fontbchar[mainf];
falsebchar:=fontfalsebchar[mainf];
if curlist.modefield>0 then if eqtb[29327].int<>curlist.auxfield.hh.rh
then fixlanguage;begin ligstack:=avail;
if ligstack=-268435455 then ligstack:=getavail else begin avail:=mem[
ligstack].hh.rh;mem[ligstack].hh.rh:=-268435455;
ifdef('STAT')incr(dynused);endif('STAT')end;end;
mem[ligstack].hh.b0:=mainf;curl:=curchr;mem[ligstack].hh.b1:=curl;
curq:=curlist.tailfield;tmpk1:=getautokern(mainf,256,curl);
{1217:}if tmpk1<>-268435455 then begin if curl<256 then begin if mem[
curq].hh.rh>-268435455 then if mem[curlist.tailfield].hh.b1=hyphenchar[
mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-268435455 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;
if eqtb[29365].int>0 then tmpk2:=getautokern(mainf,256,curl)else tmpk2:=
-268435455;if tmpk2=-268435455 then begin mem[curq].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;
end else begin mem[curq].hh.rh:=tmpk2;mem[tmpk2].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;end end;
if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
savetail:=curlist.tailfield;
if(not(curlist.tailfield>=himemmin))and(mem[curlist.tailfield].hh.b0=7)
and(mem[curlist.tailfield].hh.b1=0)and(mem[curlist.tailfield+1].hh.lh=
-268435455)and(mem[curlist.tailfield+1].hh.rh=-268435455)and(mem[
prevtail].hh.rh=curlist.tailfield)then begin begin mem[prevtail].hh.rh:=
tmpk1;mem[tmpk1].hh.rh:=curlist.tailfield;prevtail:=tmpk1;end;
end else begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=tmpk1;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;goto 90;end{:1217};
if cancelboundary then begin cancelboundary:=false;maink:=0;
end else maink:=bcharlabel[mainf];if maink=0 then goto 92;curr:=curl;
curl:=256;goto 111;
80:{1212:}if curl<256 then begin if mem[curq].hh.rh>-268435455 then if
mem[curlist.tailfield].hh.b1=hyphenchar[mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-268435455 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;
if eqtb[29365].int>0 then tmpk2:=getautokern(mainf,256,curl)else tmpk2:=
-268435455;if tmpk2=-268435455 then begin mem[curq].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;
end else begin mem[curq].hh.rh:=tmpk2;mem[tmpk2].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;end end;
if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end{:1212};
90:{1213:}if ligstack=-268435455 then goto 21;curq:=curlist.tailfield;
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
curlist.tailfield:=ligstack{:1213};100:{1215:}getnext;
if curcmd=11 then goto 101;if curcmd=12 then goto 101;
if curcmd=68 then goto 101;xtoken;if curcmd=11 then goto 101;
if curcmd=12 then goto 101;if curcmd=68 then goto 101;
if curcmd=16 then begin scancharnum;curchr:=curval;goto 101;end;
if curcmd=65 then bchar:=256;curr:=bchar;ligstack:=-268435455;goto 110;
101:mains:=eqtb[28509+curchr].hh.rh;
if mains=1000 then curlist.auxfield.hh.lh:=1000 else if mains<1000 then
begin if mains>0 then curlist.auxfield.hh.lh:=mains;
end else if curlist.auxfield.hh.lh<1000 then curlist.auxfield.hh.lh:=
1000 else curlist.auxfield.hh.lh:=mains;begin ligstack:=avail;
if ligstack=-268435455 then ligstack:=getavail else begin avail:=mem[
ligstack].hh.rh;mem[ligstack].hh.rh:=-268435455;
ifdef('STAT')incr(dynused);endif('STAT')end;end;
mem[ligstack].hh.b0:=mainf;curr:=curchr;mem[ligstack].hh.b1:=curr;
if curr=falsebchar then curr:=256{:1215};
110:{1216:}tmpk1:=getautokern(mainf,curl,curr);
{1217:}if tmpk1<>-268435455 then begin if curl<256 then begin if mem[
curq].hh.rh>-268435455 then if mem[curlist.tailfield].hh.b1=hyphenchar[
mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-268435455 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;
if eqtb[29365].int>0 then tmpk2:=getautokern(mainf,256,curl)else tmpk2:=
-268435455;if tmpk2=-268435455 then begin mem[curq].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;
end else begin mem[curq].hh.rh:=tmpk2;mem[tmpk2].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;end end;
if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
savetail:=curlist.tailfield;
if(not(curlist.tailfield>=himemmin))and(mem[curlist.tailfield].hh.b0=7)
and(mem[curlist.tailfield].hh.b1=0)and(mem[curlist.tailfield+1].hh.lh=
-268435455)and(mem[curlist.tailfield+1].hh.rh=-268435455)and(mem[
prevtail].hh.rh=curlist.tailfield)then begin begin mem[prevtail].hh.rh:=
tmpk1;mem[tmpk1].hh.rh:=curlist.tailfield;prevtail:=tmpk1;end;
end else begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=tmpk1;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;goto 90;end{:1217};
if((maini.b2)mod 4)<>1 then goto 80;if curr=256 then goto 80;
maink:=ligkernbase[mainf]+maini.b3;mainj:=fontinfo[maink].qqqq;
if mainj.b0<=128 then goto 112;
maink:=ligkernbase[mainf]+256*mainj.b2+mainj.b3+32768-256*(128);
111:mainj:=fontinfo[maink].qqqq;
112:if mainj.b1=curr then if mainj.b0<=128 then{1218:}begin if mainj.b2
>=128 then begin if curl<256 then begin if mem[curq].hh.rh>-268435455
then if mem[curlist.tailfield].hh.b1=hyphenchar[mainf]then insdisc:=true
;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if rthit then if ligstack=-268435455 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;
if eqtb[29365].int>0 then tmpk2:=getautokern(mainf,256,curl)else tmpk2:=
-268435455;if tmpk2=-268435455 then begin mem[curq].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;
end else begin mem[curq].hh.rh:=tmpk2;mem[tmpk2].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;end end;
if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newkern(fontinfo[kernbase[mainf]+256*mainj
.b2+mainj.b3].int);curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;
goto 90;end;
if curl=256 then lfthit:=true else if ligstack=-268435455 then rthit:=
true;begin if interrupt<>0 then pauseforinstructions;end;
case mainj.b2 of 1,5:begin curl:=mainj.b3;
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;end;2,6:begin curr:=mainj.b3;
if ligstack=-268435455 then begin ligstack:=newligitem(curr);bchar:=256;
end else if(ligstack>=himemmin)then begin mainp:=ligstack;
ligstack:=newligitem(curr);mem[ligstack+1].hh.rh:=mainp;
end else mem[ligstack].hh.b1:=curr;end;3:begin curr:=mainj.b3;
mainp:=ligstack;ligstack:=newligitem(curr);mem[ligstack].hh.rh:=mainp;
end;
7,11:begin if curl<256 then begin if mem[curq].hh.rh>-268435455 then if
mem[curlist.tailfield].hh.b1=hyphenchar[mainf]then insdisc:=true;
if ligaturepresent then begin mainp:=newligature(mainf,curl,mem[curq].hh
.rh);if lfthit then begin mem[mainp].hh.b1:=2;lfthit:=false;end;
if false then if ligstack=-268435455 then begin incr(mem[mainp].hh.b1);
rthit:=false;end;
if eqtb[29365].int>0 then tmpk2:=getautokern(mainf,256,curl)else tmpk2:=
-268435455;if tmpk2=-268435455 then begin mem[curq].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;
end else begin mem[curq].hh.rh:=tmpk2;mem[tmpk2].hh.rh:=mainp;
curlist.tailfield:=mainp;ligaturepresent:=false;end end;
if insdisc then begin insdisc:=false;
if curlist.modefield>0 then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=newdisc;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;end;end;
curq:=curlist.tailfield;curl:=mainj.b3;
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;end;others:begin curl:=mainj.b3;
ligaturepresent:=true;if ligstack=-268435455 then goto 80 else goto 91;
end end;if mainj.b2>4 then if mainj.b2<>7 then goto 80;
if curl<256 then goto 110;maink:=bcharlabel[mainf];goto 111;end{:1218};
if mainj.b0=0 then incr(maink)else begin if mainj.b0>=128 then goto 80;
maink:=maink+mainj.b0+1;end;goto 111{:1216};
95:{1214:}mainp:=mem[ligstack+1].hh.rh;
if mainp>-268435455 then begin prevtail:=curlist.tailfield;
mem[curlist.tailfield].hh.rh:=mainp;
curlist.tailfield:=mem[curlist.tailfield].hh.rh;end;tempptr:=ligstack;
ligstack:=mem[tempptr].hh.rh;freenode(tempptr,2);
maini:=fontinfo[charbase[mainf]+effectivechar(true,mainf,curl)].qqqq;
ligaturepresent:=true;
if ligstack=-268435455 then if mainp>-268435455 then goto 100 else curr
:=bchar else curr:=mem[ligstack].hh.b1;goto 110{:1214}{:1211};
120:{1219:}if eqtb[26640].hh.rh=membot then begin{1220:}begin mainp:=
fontglue[eqtb[27689].hh.rh];
if mainp=-268435455 then begin mainp:=newspec(membot);
maink:=parambase[eqtb[27689].hh.rh]+2;
mem[mainp+1].int:=fontinfo[maink].int;
mem[mainp+2].int:=fontinfo[maink+1].int;
mem[mainp+3].int:=fontinfo[maink+2].int;
fontglue[eqtb[27689].hh.rh]:=mainp;end;end{:1220};
tempptr:=newglue(mainp);end else tempptr:=newparamglue(12);
if eqtb[29364].int>0 then adjustinterwordglue(curlist.tailfield,tempptr)
;mem[curlist.tailfield].hh.rh:=tempptr;curlist.tailfield:=tempptr;
goto 60{:1219};10:end;{:1207}{1462:}procedure giveerrhelp;
begin tokenshow(eqtb[27167].hh.rh);end;
{:1462}{1481:}{550:}function openfmtfile:boolean;label 40,10;
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
openfmtfile:=true;10:end;{:550}function loadfmtfile:boolean;
label 6666,10;var j,k:integer;p,q:halfword;x:integer;
formatengine:^ASCIIcode;dummyxord:ASCIIcode;dummyxchr:ASCIIcode;
dummyxprn:ASCIIcode;
begin{1486:}ifdef('INITEX')if iniversion then begin libcfree(fontinfo);
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
libcfree(formatengine);undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:',
'string pool checksum');writeln(stderr,' = ',x);end;;
if x<>312141437 then begin;
writeln(stdout,'---! ',stringcast(nameoffile+1),
' made by different executable version, strings are different');
goto 6666;end;
{1875:}if translatefilename then begin for k:=0 to 255 do undumpthings(
dummyxord,1);for k:=0 to 255 do undumpthings(dummyxchr,1);
for k:=0 to 255 do undumpthings(dummyxprn,1);
end else begin undumpthings(xord[0],256);undumpthings(xchr[0],256);
undumpthings(xprn[0],256);
if eightbitp then for k:=0 to 255 do xprn[k]:=1;end;{:1875};
undumpint(x);if x<>268435455 then goto 6666;undumpint(hashhigh);
if(hashhigh<0)or(hashhigh>suphashextra)then goto 6666;
if hashextra<hashhigh then hashextra:=hashhigh;eqtbtop:=30192+hashextra;
if hashextra=0 then hashtop:=26627 else hashtop:=eqtbtop;
yhash:=xmallocarray(twohalves,1+hashtop-hashoffset);
hash:=yhash-hashoffset;hash[514].lh:=0;hash[514].rh:=0;
for x:=515 to hashtop do hash[x]:=hash[514];
zeqtb:=xmallocarray(memoryword,eqtbtop+1);eqtb:=zeqtb;
eqtb[26627].hh.b0:=104;eqtb[26627].hh.rh:=-268435455;
eqtb[26627].hh.b1:=0;for x:=30193 to eqtbtop do eqtb[x]:=eqtb[26627];
{1655:}begin undumpint(x);if(x<0)or(x>1)then goto 6666 else eTeXmode:=x;
end;if(eTeXmode=1)then begin{1813:}maxregnum:=32767;
maxreghelpline:=2092;{:1813}end else begin{1812:}maxregnum:=255;
maxreghelpline:=800;{:1812}end;{:1655}undumpint(x);
if debugformatfile then begin write(stderr,'fmtdebug:','mem_bot');
writeln(stderr,' = ',x);end;;if x<>membot then goto 6666;
undumpint(memtop);
if debugformatfile then begin write(stderr,'fmtdebug:','mem_top');
writeln(stderr,' = ',memtop);end;;if membot+1100>memtop then goto 6666;
curlist.headfield:=memtop-1;curlist.tailfield:=memtop-1;
pagetail:=memtop-2;memmin:=membot-extramembot;
memmax:=memtop+extramemtop;
yzmem:=xmallocarray(memoryword,memmax-memmin+1);zmem:=yzmem-memmin;
mem:=zmem;undumpint(x);if x<>30192 then goto 6666;undumpint(x);
if x<>8501 then goto 6666;undumpint(x);if x<>607 then goto 6666{:1486};
{1894:}undumpint(x);if x<>1296847960 then goto 6666;undumpint(x);
if x=1 then mltexenabledp:=true else if x<>0 then goto 6666;{:1894};
{1903:}undumpint(x);if x<>1162040408 then goto 6666;undumpint(x);
if x=0 then enctexenabledp:=false else if x<>1 then goto 6666 else begin
enctexenabledp:=true;undumpthings(mubyteread[0],256);
undumpthings(mubytewrite[0],256);undumpthings(mubytecswrite[0],128);end;
{:1903};{1488:}begin undumpint(x);if x<0 then goto 6666;
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
undumpthings(strpool[0],poolptr);initstrptr:=strptr;
initpoolptr:=poolptr{:1488};{1490:}begin undumpint(x);
if(x<membot+1019)or(x>memtop-15)then goto 6666 else lomemmax:=x;end;
begin undumpint(x);
if(x<membot+20)or(x>lomemmax)then goto 6666 else rover:=x;end;
if(eTeXmode=1)then for k:=0 to 5 do begin undumpint(x);
if(x<-268435455)or(x>lomemmax)then goto 6666 else saroot[k]:=x;end;
p:=membot;q:=rover;repeat undumpthings(mem[p],q+2-p);
if(mem[q].hh.lh>lomemmax-q)or(mem[q+1].hh.rh>lomemmax)or((q>=mem[q+1].hh
.rh)and(mem[q+1].hh.rh<>rover))then goto 6666;p:=q+mem[q].hh.lh;
q:=mem[q+1].hh.rh;until q=rover;undumpthings(mem[p],lomemmax+1-p);
if memmin<membot-2 then begin p:=mem[rover+1].hh.lh;q:=memmin+1;
mem[memmin].hh.rh:=-268435455;mem[memmin].hh.lh:=-268435455;
mem[p+1].hh.rh:=q;mem[rover+1].hh.lh:=q;mem[q+1].hh.rh:=rover;
mem[q+1].hh.lh:=p;mem[q].hh.rh:=268435455;mem[q].hh.lh:=membot-q;end;
begin undumpint(x);
if(x<lomemmax+1)or(x>memtop-14)then goto 6666 else himemmin:=x;end;
begin undumpint(x);
if(x<-268435455)or(x>memtop)then goto 6666 else avail:=x;end;
memend:=memtop;undumpthings(mem[himemmin],memend+1-himemmin);
undumpint(varused);undumpint(dynused){:1490};{1492:}{1495:}k:=1;
repeat undumpint(x);if(x<1)or(k+x>30193)then goto 6666;
undumpthings(eqtb[k],x);k:=k+x;undumpint(x);
if(x<0)or(k+x>30193)then goto 6666;
for j:=k to k+x-1 do eqtb[j]:=eqtb[k-1];k:=k+x;until k>30192;
if hashhigh>0 then undumpthings(eqtb[30193],hashhigh);{:1495};
undumpint(parloc);partoken:=4095+parloc;begin undumpint(x);
if(x<514)or(x>hashtop)then goto 6666 else writeloc:=x;end;
{1497:}for p:=0 to 2100 do undumphh(prim[p]);begin undumpint(x);
if(x<514)or(x>15514)then goto 6666 else hashused:=x;end;p:=513;
repeat begin undumpint(x);
if(x<p+1)or(x>hashused)then goto 6666 else p:=x;end;undumphh(hash[p]);
until p=hashused;undumpthings(hash[hashused+1],26626-hashused);
if debugformatfile then begin printcsnames(514,26626);end;
if hashhigh>0 then begin undumpthings(hash[30193],hashhigh);
if debugformatfile then begin printcsnames(30193,hashhigh-(30193));end;
end;undumpint(cscount){:1497}{:1492};{1499:}begin undumpint(x);
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
'font max');writeln(stderr,' = ',x);end;;fontptr:=x;end;
{1501:}begin fontcheck:=xmallocarray(fourquarters,fontmax);
fontsize:=xmallocarray(scaled,fontmax);
fontdsize:=xmallocarray(scaled,fontmax);
fontparams:=xmallocarray(fontindex,fontmax);
fontname:=xmallocarray(strnumber,fontmax);
fontarea:=xmallocarray(strnumber,fontmax);
fontbc:=xmallocarray(eightbits,fontmax);
fontec:=xmallocarray(eightbits,fontmax);
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
pdfcharused:=xmallocarray(charusedarray,fontmax);
pdffontsize:=xmallocarray(scaled,fontmax);
pdffontnum:=xmallocarray(integer,fontmax);
pdffontmap:=xmallocarray(fmentryptr,fontmax);
pdffonttype:=xmallocarray(eightbits,fontmax);
pdffontattr:=xmallocarray(strnumber,fontmax);
pdffontblink:=xmallocarray(internalfontnumber,fontmax);
pdffontelink:=xmallocarray(internalfontnumber,fontmax);
pdffonthasspacechar:=xmallocarray(boolean,fontmax);
pdffontstretch:=xmallocarray(integer,fontmax);
pdffontshrink:=xmallocarray(integer,fontmax);
pdffontstep:=xmallocarray(integer,fontmax);
pdffontexpandratio:=xmallocarray(integer,fontmax);
pdffontautoexpand:=xmallocarray(boolean,fontmax);
pdffontlpbase:=xmallocarray(integer,fontmax);
pdffontrpbase:=xmallocarray(integer,fontmax);
pdffontefbase:=xmallocarray(integer,fontmax);
pdffontknbsbase:=xmallocarray(integer,fontmax);
pdffontstbsbase:=xmallocarray(integer,fontmax);
pdffontshbsbase:=xmallocarray(integer,fontmax);
pdffontknbcbase:=xmallocarray(integer,fontmax);
pdffontknacbase:=xmallocarray(integer,fontmax);
vfpacketbase:=xmallocarray(integer,fontmax);
vfdefaultfont:=xmallocarray(internalfontnumber,fontmax);
vflocalfontnum:=xmallocarray(internalfontnumber,fontmax);
vfefnts:=xmallocarray(integer,fontmax);
vfifnts:=xmallocarray(internalfontnumber,fontmax);
pdffontnobuiltintounicode:=xmallocarray(boolean,fontmax);
for fontk:=0 to fontmax do begin for k:=0 to 31 do pdfcharused[fontk,k]
:=0;pdffontsize[fontk]:=0;pdffontnum[fontk]:=0;pdffontmap[fontk]:=0;
pdffonttype[fontk]:=0;pdffontattr[fontk]:=345;pdffontblink[fontk]:=0;
pdffontelink[fontk]:=0;pdffonthasspacechar[fontk]:=false;
pdffontstretch[fontk]:=0;pdffontshrink[fontk]:=0;pdffontstep[fontk]:=0;
pdffontexpandratio[fontk]:=0;pdffontautoexpand[fontk]:=false;
pdffontlpbase[fontk]:=0;pdffontrpbase[fontk]:=0;pdffontefbase[fontk]:=0;
pdffontknbsbase[fontk]:=0;pdffontstbsbase[fontk]:=0;
pdffontshbsbase[fontk]:=0;pdffontknbcbase[fontk]:=0;
pdffontknacbase[fontk]:=0;pdffontnobuiltintounicode[fontk]:=false;end;
makepdftexbanner;undumpthings(fontcheck[0],fontptr+1);
undumpthings(fontsize[0],fontptr+1);
undumpthings(fontdsize[0],fontptr+1);
undumpcheckedthings(-268435455,268435455,fontparams[0],fontptr+1);
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
undumpcheckedthings(0,256,fontbchar[0],fontptr+1);
undumpcheckedthings(0,256,fontfalsebchar[0],fontptr+1);end{:1501};
{:1499};{1503:}begin undumpint(x);if x<0 then goto 6666;
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
if(x<-268435455)or(x>268435455)then goto 6666 else hyphlist[j]:=x;end;
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
ifdef('INITEX')trienotready:=false endif('INITEX'){:1503};
{1505:}begin undumpimagemeta(eqtb[29351].int,eqtb[29352].int,eqtb[29355]
.int);undumpint(pdfmemsize);
pdfmem:=xreallocarray(pdfmem,integer,pdfmemsize);undumpint(pdfmemptr);
for k:=1 to pdfmemptr-1 do begin undumpint(pdfmem[k]);end;
undumpint(objtabsize);undumpint(objptr);undumpint(sysobjptr);
for k:=1 to sysobjptr do begin undumpint(objtab[k].int0);
undumpint(objtab[k].int1);objtab[k].int2:=-1;undumpint(objtab[k].int3);
undumpint(objtab[k].int4);end;undumpint(pdfobjcount);
undumpint(pdfxformcount);undumpint(pdfximagecount);
undumpint(headtab[7]);undumpint(headtab[8]);undumpint(headtab[9]);
undumpint(pdflastobj);undumpint(pdflastxform);undumpint(pdflastximage);
undumptounicode;end{:1505};{1507:}begin undumpint(x);
if(x<0)or(x>3)then goto 6666 else interaction:=x;end;
if interactionoption<>4 then interaction:=interactionoption;
begin undumpint(x);
if(x<0)or(x>strptr)then goto 6666 else formatident:=x;end;undumpint(x);
if x<>69069 then goto 6666{:1507};curlist.auxfield.int:=eqtb[29935].int;
loadfmtfile:=true;goto 10;6666:;
writeln(stdout,'(Fatal format file error; I''m stymied)');
loadfmtfile:=false;10:end;
{:1481}{1510:}{1513:}procedure closefilesandterminate;label 30,31;
var a,b,c,i,j,k,l:integer;isroot:boolean;isnames:boolean;
root,outlines,threads,namestree,dests:integer;
xrefoffsetwidth,nameshead,namestail:integer;
begin{1626:}for k:=0 to 15 do if writeopen[k]then aclose(writefile[k])
{:1626};eqtb[29326].int:=-1;
ifdef('STAT')if eqtb[29308].int>0 then{1514:}if logopened then begin
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
savesize:1,'s');end{:1514};endif('STAT');
if not fixedpdfoutputset then fixpdfoutput;
if fixedpdfoutput>0 then begin if history=3 then begin removepdffile;
synctexabort(logopened);begin if interaction=3 then;
if filelineerrorstylep then printfileline else printnl(264);print(1733);
end end else begin{794:}if totalpages=0 then begin printnl(1011);
if pdfgone>0 then garbagewarning;
end else begin if fixedpdfdraftmode=0 then begin pdfflush;
if totalpages mod 6<>0 then objtab[pdflastpages].int0:=totalpages mod 6;
flushjbig2page0objects;{799:}k:=headtab[1];
while objtab[k].int4=0 do begin pdfwarning(1206,1213,true,false);
printint(objtab[k].int0);print(1214);println;println;k:=objtab[k].int1;
end;headtab[1]:=k{:799};{800:}k:=headtab[1];l:=0;
repeat i:=objtab[k].int1;objtab[k].int1:=l;l:=k;k:=i;until k=0;
headtab[1]:=l;k:=headtab[2];pagestail:=k;l:=0;repeat i:=objtab[k].int1;
objtab[k].int1:=l;l:=k;k:=i;until k=0;headtab[2]:=l{:800};
{796:}k:=headtab[5];while k<>0 do begin pdffixdest(k);k:=objtab[k].int1;
end{:796};{798:}k:=headtab[6];while k<>0 do begin pdffixstructdest(k);
k:=objtab[k].int1;end{:798};
{801:}for k:=1 to fontptr do if fontused[k]and hasfmentry(k)and(
pdffontnum[k]<0)then begin i:=-pdffontnum[k];pdfassert(pdffontnum[i]>0);
for j:=0 to 255 do if pdfcharmarked(k,j)then pdfmarkchar(i,j);
if((strstart[pdffontattr[i]+1]-strstart[pdffontattr[i]])=0)and((strstart
[pdffontattr[k]+1]-strstart[pdffontattr[k]])<>0)then pdffontattr[i]:=
pdffontattr[k]else if((strstart[pdffontattr[k]+1]-strstart[pdffontattr[k
]])=0)and((strstart[pdffontattr[i]+1]-strstart[pdffontattr[i]])<>0)then
pdffontattr[k]:=pdffontattr[i]else if((strstart[pdffontattr[i]+1]-
strstart[pdffontattr[i]])<>0)and((strstart[pdffontattr[k]+1]-strstart[
pdffontattr[k]])<>0)and not streqstr(pdffontattr[i],pdffontattr[k])then
begin pdfwarning(1215,1216,true,false);printfontidentifier(i);
print(1217);printfontidentifier(k);print(1218);printfontidentifier(i);
println;println;end;end;fixedgentounicode:=eqtb[29367].int;
k:=headtab[3];while k<>0 do begin f:=objtab[k].int0;
pdfassert(pdffontnum[f]>0);dopdffont(k,f);k:=objtab[k].int1;end;
writefontstuff{:801};{802:}a:=sysobjptr+1;l:=headtab[2];k:=headtab[1];
b:=0;repeat i:=0;c:=0;
if objtab[l].int1=0 then isroot:=true else isroot:=false;
repeat if not isroot then begin if i mod 6=0 then begin pdflastpages:=
pdfnewobjnum;if c=0 then c:=pdflastpages;
objtab[pagestail].int1:=pdflastpages;pagestail:=pdflastpages;
objtab[pdflastpages].int1:=0;objtab[pdflastpages].int0:=objtab[l].int0;
end else objtab[pdflastpages].int0:=objtab[pdflastpages].int0+objtab[l].
int0;end;{803:}pdfbegindict(l,1);begin pdfprint(1219);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfintentryln(1201,objtab[l].int0);
if not isroot then pdfindirectln(1175,pdflastpages);pdfprint(1220);j:=0;
repeat pdfprintint(k);pdfprint(1160);k:=objtab[k].int1;incr(j);
until((l<a)and(j=objtab[l].int0))or(k=0)or((k=b)and(b<>0))or(j=6);
removelastspace;begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if k=0 then begin k:=headtab[2];headtab[2]:=0;end;
if isroot and(eqtb[27168].hh.rh<>-268435455)then pdfprinttoksln(eqtb[
27168].hh.rh);pdfenddict;{:803};incr(i);l:=objtab[l].int1;until(l=c);
b:=c;if l=0 then goto 30;until false;30:{:802};
{788:}if pdffirstoutline<>0 then begin pdfnewdict(0,0,1);
outlines:=objptr;l:=pdffirstoutline;k:=0;repeat incr(k);
a:=opensubentries(l);if objtab[l].int0>0 then k:=k+a;
pdfmem[objtab[l].int4+1]:=objptr;l:=pdfmem[objtab[l].int4+3];until l=0;
begin pdfprint(1198);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfindirectln(1199,pdffirstoutline);pdfindirectln(1200,pdflastoutline);
pdfintentryln(1201,k);pdfenddict;{789:}k:=headtab[4];
while k<>0 do begin if pdfmem[objtab[k].int4+1]=pdfparentoutline then
begin if pdfmem[objtab[k].int4+2]=0 then pdffirstoutline:=k;
if pdfmem[objtab[k].int4+3]=0 then pdflastoutline:=k;end;
pdfbegindict(k,1);pdfindirectln(1202,pdfmem[objtab[k].int4]);
pdfindirectln(65,pdfmem[objtab[k].int4+6]);
if pdfmem[objtab[k].int4+1]<>0 then pdfindirectln(1175,pdfmem[objtab[k].
int4+1]);
if pdfmem[objtab[k].int4+2]<>0 then pdfindirectln(1203,pdfmem[objtab[k].
int4+2]);
if pdfmem[objtab[k].int4+3]<>0 then pdfindirectln(1204,pdfmem[objtab[k].
int4+3]);
if pdfmem[objtab[k].int4+4]<>0 then pdfindirectln(1199,pdfmem[objtab[k].
int4+4]);
if pdfmem[objtab[k].int4+5]<>0 then pdfindirectln(1200,pdfmem[objtab[k].
int4+5]);if objtab[k].int0<>0 then pdfintentryln(1201,objtab[k].int0);
if pdfmem[objtab[k].int4+7]<>0 then begin pdfprinttoksln(pdfmem[objtab[k
].int4+7]);begin deletetokenref(pdfmem[objtab[k].int4+7]);
pdfmem[objtab[k].int4+7]:=-268435455;end;end;pdfenddict;
k:=objtab[k].int1;end{:789};end else outlines:=0{:788};
{804:}if pdfdestnamesptr=0 then begin dests:=0;goto 31;end;
sortdestnames(0,pdfdestnamesptr-1);nameshead:=0;namestail:=0;k:=0;
isnames:=true;b:=0;repeat repeat pdfcreateobj(0,0);l:=objptr;
if b=0 then b:=l;if nameshead=0 then begin nameshead:=l;namestail:=l;
end else begin objtab[namestail].int1:=l;namestail:=l;end;
objtab[namestail].int1:=0;{805:}pdfbegindict(l,1);j:=0;
if isnames then begin objtab[l].int0:=destnames[k].objname;
pdfprint(1222);repeat pdfprintstr(destnames[k].objname);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintint(destnames[k].objnum);pdfprint(1160);incr(j);incr(k);
until(j=6)or(k=pdfdestnamesptr);removelastspace;begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
objtab[l].int4:=destnames[k-1].objname;
if k=pdfdestnamesptr then begin isnames:=false;k:=nameshead;b:=0;end;
end else begin objtab[l].int0:=objtab[k].int0;pdfprint(1220);
repeat pdfprintint(k);pdfprint(1160);incr(j);
objtab[l].int4:=objtab[k].int4;k:=objtab[k].int1;
until(j=6)or(k=b)or(objtab[k].int1=0);removelastspace;
begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;if k=b then b:=0;end;
pdfprint(1223);pdfprintstr(objtab[l].int0);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=32;incr(pdfptr);end;end;
pdfprintstr(objtab[l].int4);begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfenddict;{:805};
until b=0;if k=l then begin dests:=l;goto 31;end;until false;
31:if(dests<>0)or(pdfnamestoks<>-268435455)then begin pdfnewdict(0,0,1);
if(dests<>0)then pdfindirectln(1221,dests);
if pdfnamestoks<>-268435455 then begin pdfprinttoksln(pdfnamestoks);
begin deletetokenref(pdfnamestoks);pdfnamestoks:=-268435455;end;end;
pdfenddict;namestree:=objptr;end else namestree:=0{:804};
{790:}if headtab[10]<>0 then begin pdfnewobj(0,0,1);threads:=objptr;
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=91;incr(pdfptr);end;end;k:=headtab[10];
while k<>0 do begin pdfprintint(k);pdfprint(1160);k:=objtab[k].int1;end;
removelastspace;begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfendobj;
k:=headtab[10];while k<>0 do begin outthread(k);k:=objtab[k].int1;end;
end else threads:=0{:790};{806:}pdfnewdict(0,0,1);root:=objptr;
begin pdfprint(1224);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfindirectln(1225,pdflastpages);
if threads<>0 then pdfindirectln(1226,threads);
if outlines<>0 then pdfindirectln(1227,outlines);
if namestree<>0 then pdfindirectln(1228,namestree);
if pdfcatalogtoks<>-268435455 then begin pdfprinttoksln(pdfcatalogtoks);
begin deletetokenref(pdfcatalogtoks);pdfcatalogtoks:=-268435455;end;end;
if pdfcatalogopenaction<>0 then pdfindirectln(1229,pdfcatalogopenaction)
;pdfenddict{:806};if eqtb[29376].int=0 then pdfprintinfo;
if pdfosenable then begin pdfosswitch(true);pdfoswriteobjstream;
pdfflush;pdfosswitch(false);{814:}pdfnewdict(0,0,0);
if((objtab[sysobjptr].int2/256)>16777215)then xrefoffsetwidth:=5 else if
objtab[sysobjptr].int2>16777215 then xrefoffsetwidth:=4 else if objtab[
sysobjptr].int2>65535 then xrefoffsetwidth:=3 else xrefoffsetwidth:=2;
{812:}l:=0;objtab[l].int2:=-2;
for k:=1 to sysobjptr do if not(objtab[k].int2>-1)then begin objtab[l].
int1:=k;l:=k;end;objtab[l].int1:=0{:812};begin pdfprint(1246);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfprint(1247);
pdfprintint(objptr+1);begin pdfprint(93);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfintentryln(1248,objptr+1);pdfprint(1249);
pdfprintint(xrefoffsetwidth);begin pdfprint(1250);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfindirectln(1251,root);
if eqtb[29376].int=0 then pdfindirectln(1252,objptr-1);
if pdftrailertoks<>-268435455 then begin pdfprinttoksln(pdftrailertoks);
begin deletetokenref(pdftrailertoks);pdftrailertoks:=-268435455;end;end;
if pdftraileridtoks<>-268435455 then printIDalt(pdftraileridtoks)else
printID(outputfilename);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;pdfbeginstream;
for k:=0 to sysobjptr do begin if not(objtab[k].int2>-1)then begin begin
begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)else if
not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)else if
not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=0;incr(pdfptr);end;end;
pdfoutbytes(objtab[k].int1,xrefoffsetwidth);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=255;incr(pdfptr);end;end;
end else begin if objtab[k].int3=-1 then begin begin begin if pdfosmode
and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)else if not pdfosmode and(1
>pdfbufsize)then overflow(1018,pdfopbufsize)else if not pdfosmode and(1+
pdfptr>pdfbufsize)then pdfflush;end;begin pdfbuf[pdfptr]:=1;
incr(pdfptr);end;end;pdfoutbytes(objtab[k].int2,xrefoffsetwidth);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=0;incr(pdfptr);end;end;
end else begin begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then
pdfosgetosbuf(1)else if not pdfosmode and(1>pdfbufsize)then overflow(
1018,pdfopbufsize)else if not pdfosmode and(1+pdfptr>pdfbufsize)then
pdfflush;end;begin pdfbuf[pdfptr]:=2;incr(pdfptr);end;end;
pdfoutbytes(objtab[k].int2,xrefoffsetwidth);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=objtab[k].int3;incr(pdfptr);end;end;end;end;end;
pdfendstream;{:814};pdfflush;end else begin{813:}{812:}l:=0;
objtab[l].int2:=-2;
for k:=1 to sysobjptr do if not(objtab[k].int2>-1)then begin objtab[l].
int1:=k;l:=k;end;objtab[l].int1:=0{:812};
pdfsaveoffset:=(pdfgone+pdfptr);begin pdfprint(1241);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfprint(1242);
begin pdfprintint(objptr+1);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
pdfprintfwint(objtab[0].int1,10);begin pdfprint(1243);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
for k:=1 to objptr do begin if not(objtab[k].int2>-1)then begin
pdfprintfwint(objtab[k].int1,10);begin pdfprint(1244);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
end else begin pdfprintfwint(objtab[k].int2,10);begin pdfprint(1245);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;end{:813};end;
{815:}if not pdfosenable then begin begin pdfprint(1253);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;pdfprint(1254);
pdfintentryln(1248,sysobjptr+1);pdfindirectln(1251,root);
if eqtb[29376].int=0 then pdfindirectln(1252,sysobjptr);
if pdftrailertoks<>-268435455 then begin pdfprinttoksln(pdftrailertoks);
begin deletetokenref(pdftrailertoks);pdftrailertoks:=-268435455;end;end;
if pdftraileridtoks<>-268435455 then printIDalt(pdftraileridtoks)else
printID(outputfilename);begin pdfprint(1255);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;end;
begin pdfprint(1256);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;
if pdfosenable then begin pdfprintint(objtab[sysobjptr].int2);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;
end else begin pdfprintint(pdfsaveoffset);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end;begin pdfprint(1257);
begin begin if pdfosmode and(1+pdfptr>pdfbufsize)then pdfosgetosbuf(1)
else if not pdfosmode and(1>pdfbufsize)then overflow(1018,pdfopbufsize)
else if not pdfosmode and(1+pdfptr>pdfbufsize)then pdfflush;end;
begin pdfbuf[pdfptr]:=10;incr(pdfptr);end;end;end{:815};pdfflush;
printnl(1012);printfilename(0,outputfilename,0);print(286);
printint(totalpages);print(1014);if totalpages<>1 then printchar(115);
print(1015);printint((pdfgone+pdfptr));print(1016);end;libpdffinish;
if fixedpdfdraftmode=0 then bclose(pdffile)else pdfwarning(0,1205,true,
true)end{:794};if logopened then begin writeln(logfile);
writeln(logfile,'PDF statistics:');
writeln(logfile,' ',objptr:1,' PDF objects out of ',objtabsize:1,
' (max. ',supobjtabsize:1,')');
if pdfoscntr>0 then begin write(logfile,' ',((pdfoscntr-1)*pdfosmaxobjs+
pdfosobjidx+1):1,' compressed objects within ',pdfoscntr:1,
' object stream');if pdfoscntr>1 then write(logfile,'s');
writeln(logfile);end;
writeln(logfile,' ',pdfdestnamesptr:1,' named destinations out of ',
destnamessize:1,' (max. ',supdestnamessize:1,')');
writeln(logfile,' ',pdfmemptr:1,
' words of extra memory for PDF output out of ',pdfmemsize:1,' (max. ',
suppdfmemsize:1,')');end;end;
end else begin{670:}while curs>-1 do begin if curs>0 then begin dvibuf[
dviptr]:=142;incr(dviptr);if dviptr=dvilimit then dviswap;
end else begin begin dvibuf[dviptr]:=140;incr(dviptr);
if dviptr=dvilimit then dviswap;end;incr(totalpages);end;decr(curs);end;
if totalpages=0 then printnl(1011)else if curs<>-2 then begin begin
dvibuf[dviptr]:=248;incr(dviptr);if dviptr=dvilimit then dviswap;end;
dvifour(lastbop);lastbop:=dvioffset+dviptr-5;dvifour(25400000);
dvifour(473628672);preparemag;dvifour(eqtb[29294].int);dvifour(maxv);
dvifour(maxh);begin dvibuf[dviptr]:=maxpush div 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=maxpush mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=(totalpages div 256)mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
begin dvibuf[dviptr]:=totalpages mod 256;incr(dviptr);
if dviptr=dvilimit then dviswap;end;
{671:}while fontptr>0 do begin if fontused[fontptr]then dvifontdef(
fontptr);decr(fontptr);end{:671};begin dvibuf[dviptr]:=249;incr(dviptr);
if dviptr=dvilimit then dviswap;end;dvifour(lastbop);
begin dvibuf[dviptr]:=2;incr(dviptr);if dviptr=dvilimit then dviswap;
end;ifdef('IPC')k:=7-((3+dvioffset+dviptr)mod 4);
endif('IPC')ifndef('IPC')k:=4+((dvibufsize-dviptr)mod 4);
endifn('IPC')while k>0 do begin begin dvibuf[dviptr]:=223;incr(dviptr);
if dviptr=dvilimit then dviswap;end;decr(k);end;
{626:}if dvilimit=halfbuf then writedvi(halfbuf,dvibufsize-1);
if dviptr>(2147483647-dvioffset)then begin curs:=-2;fatalerror(1000);
end;if dviptr>0 then writedvi(0,dviptr-1){:626};printnl(1012);
printfilename(0,outputfilename,0);print(286);printint(totalpages);
if totalpages<>1 then print(1013)else print(1014);print(1015);
printint(dvioffset+dviptr);print(1016);bclose(dvifile);end{:670};end;
{1921:}synctexterminate(logopened);{:1921};
if logopened then begin writeln(logfile);aclose(logfile);
selector:=selector-2;if selector=17 then begin printnl(1734);
printfilename(0,texmflogname,0);printchar(46);end;end;println;
if(editnamestart<>0)and(interaction>0)then calledit(strpool,
editnamestart,editnamelength,editline);end;
{:1513}{1515:}procedure finalcleanup;label 10;var c:smallnumber;
begin c:=curchr;if c<>1 then eqtb[29326].int:=-1;
if jobname=0 then openlogfile;
while inputptr>0 do if curinput.statefield=0 then endtokenlist else
endfilereading;while openparens>0 do begin print(1735);decr(openparens);
end;if curlevel>1 then begin printnl(40);printesc(1736);print(1737);
printint(curlevel-1);printchar(41);if(eTeXmode=1)then showsavegroups;
end;while condptr<>-268435455 do begin printnl(40);printesc(1736);
print(1738);printcmdchr(108,curif);if ifline<>0 then begin print(1739);
printint(ifline);end;print(1740);ifline:=mem[condptr+1].int;
curif:=mem[condptr].hh.b1;tempptr:=condptr;condptr:=mem[condptr].hh.rh;
freenode(tempptr,2);end;
if history<>0 then if((history=1)or(interaction<3))then if selector=19
then begin selector:=17;printnl(1741);selector:=19;end;
if c=1 then begin ifdef('INITEX')if iniversion then begin for c:=0 to 4
do if curmark[c]<>-268435455 then deletetokenref(curmark[c]);
if saroot[6]<>-268435455 then if domarks(3,0,saroot[6])then saroot[6]:=
-268435455;for c:=2 to 3 do flushnodelist(discptr[c]);
if lastglue<>268435455 then deleteglueref(lastglue);storefmtfile;
goto 10;end;endif('INITEX')printnl(1742);goto 10;end;10:end;
{:1515}{1516:}ifdef('INITEX')procedure initprim;
begin nonewcontrolsequence:=false;first:=0;
{244:}primitive(394,75,26628);primitive(395,75,26629);
primitive(396,75,26630);primitive(397,75,26631);primitive(398,75,26632);
primitive(399,75,26633);primitive(400,75,26634);primitive(401,75,26635);
primitive(402,75,26636);primitive(403,75,26637);primitive(404,75,26638);
primitive(405,75,26639);primitive(406,75,26640);primitive(407,75,26641);
primitive(408,75,26642);primitive(409,76,26643);primitive(410,76,26644);
primitive(411,76,26645);{:244}{248:}primitive(415,72,27159);
primitive(416,72,27160);primitive(417,72,27161);primitive(418,72,27162);
primitive(419,72,27163);primitive(420,72,27164);primitive(421,72,27165);
primitive(422,72,27166);primitive(423,72,27167);primitive(424,72,27168);
primitive(425,72,27169);primitive(426,72,27170);primitive(427,72,27171);
{:248}{256:}primitive(441,73,29277);primitive(442,73,29278);
primitive(443,73,29279);primitive(444,73,29280);primitive(445,73,29281);
primitive(446,73,29282);primitive(447,73,29283);primitive(448,73,29284);
primitive(449,73,29285);primitive(450,73,29286);primitive(451,73,29287);
primitive(452,73,29288);primitive(453,73,29289);primitive(454,73,29290);
primitive(455,73,29291);primitive(456,73,29292);primitive(457,73,29293);
primitive(458,73,29294);primitive(459,73,29295);primitive(460,73,29296);
primitive(461,73,29297);primitive(462,73,29298);primitive(463,73,29299);
primitive(464,73,29300);primitive(465,73,29301);primitive(466,73,29302);
primitive(467,73,29303);primitive(468,73,29304);primitive(469,73,29305);
primitive(470,73,29306);primitive(471,73,29307);primitive(472,73,29308);
primitive(473,73,29309);primitive(474,73,29310);primitive(475,73,29311);
primitive(476,73,29312);primitive(477,73,29313);primitive(478,73,29314);
primitive(479,73,29315);primitive(480,73,29316);primitive(481,73,29317);
primitive(482,73,29318);primitive(483,73,29319);primitive(484,73,29320);
primitive(485,73,29321);primitive(486,73,29322);primitive(487,73,29323);
primitive(488,73,29324);primitive(489,73,29325);primitive(490,73,29326);
primitive(491,73,29327);primitive(492,73,29328);primitive(493,73,29329);
primitive(494,73,29330);primitive(495,73,29331);
if mltexp then begin mltexenabledp:=true;
if false then primitive(496,73,29332);primitive(497,73,29333);
primitive(498,73,29334);end;if enctexp then begin enctexenabledp:=true;
primitive(499,73,29338);primitive(500,73,29339);primitive(501,73,29340);
primitive(502,73,29341);end;primitive(503,73,29335);
primitive(544,103,0);primitive(504,73,29336);primitive(505,73,29337);
primitive(506,73,29342);primitive(507,73,29343);primitive(508,73,29363);
primitive(509,73,29344);primitive(510,73,29345);primitive(511,73,29346);
primitive(512,73,29347);primitive(513,73,29348);primitive(545,73,29352);
primitive(514,73,29349);primitive(515,73,29350);primitive(516,73,29351);
primitive(517,73,29352);primitive(518,73,29353);primitive(519,73,29354);
primitive(520,73,29355);primitive(521,73,29356);primitive(522,73,29357);
primitive(523,73,29358);primitive(524,73,29359);primitive(525,73,29360);
primitive(526,73,29361);primitive(527,73,29362);primitive(528,73,29364);
primitive(529,73,29365);primitive(530,73,29366);primitive(531,73,29367);
primitive(532,73,29368);primitive(533,73,29369);primitive(534,73,29370);
primitive(535,73,29371);primitive(536,73,29372);primitive(537,73,29373);
primitive(538,73,29374);primitive(539,73,29375);primitive(540,73,29376);
primitive(541,73,29377);primitive(542,73,29378);
{:256}{266:}primitive(548,74,29903);primitive(549,74,29904);
primitive(550,74,29905);primitive(551,74,29906);primitive(552,74,29907);
primitive(553,74,29908);primitive(554,74,29909);primitive(555,74,29910);
primitive(556,74,29911);primitive(557,74,29912);primitive(558,74,29913);
primitive(559,74,29914);primitive(560,74,29915);primitive(561,74,29916);
primitive(562,74,29917);primitive(563,74,29918);primitive(564,74,29919);
primitive(565,74,29920);primitive(566,74,29921);primitive(567,74,29922);
primitive(568,74,29923);primitive(569,74,29924);primitive(570,74,29925);
primitive(571,74,29926);primitive(572,74,29927);primitive(573,74,29928);
primitive(574,74,29929);primitive(575,74,29930);primitive(576,74,29931);
primitive(577,74,29932);primitive(578,74,29933);primitive(579,74,29934);
primitive(580,74,29935);primitive(581,74,29936);
{:266}{287:}primitive(32,64,0);primitive(47,44,0);primitive(593,45,0);
primitive(594,90,0);primitive(595,40,0);primitive(596,41,0);
primitive(597,61,0);primitive(598,16,0);primitive(589,110,0);
primitive(599,15,0);primitive(600,92,0);primitive(590,67,0);
if enctexp then begin primitive(601,67,10);end;primitive(602,62,0);
hash[15516].rh:=602;eqtb[15516]:=eqtb[curval];primitive(603,105,0);
primitive(604,88,0);primitive(605,101,0);primitive(606,102,0);
primitive(607,77,0);primitive(608,32,0);primitive(609,36,0);
primitive(610,39,0);primitive(337,37,0);primitive(360,18,0);
primitive(611,46,0);primitive(612,17,0);primitive(613,54,0);
primitive(614,91,0);primitive(615,34,0);primitive(616,65,0);
primitive(617,106,0);primitive(586,106,1);primitive(342,55,0);
primitive(618,63,0);primitive(619,84,27158);primitive(620,42,0);
primitive(621,80,0);primitive(622,66,0);primitive(623,96,0);
primitive(624,0,256);hash[15521].rh:=624;eqtb[15521]:=eqtb[curval];
primitive(625,98,0);primitive(626,112,0);primitive(428,71,membot);
primitive(361,38,0);primitive(627,33,0);primitive(628,56,0);
primitive(629,35,0);{:287}{356:}primitive(691,13,256);parloc:=curval;
partoken:=4095+parloc;{:356}{402:}primitive(727,107,0);
primitive(728,107,1);{:402}{410:}primitive(729,113,0);
primitive(730,113,1);primitive(731,113,2);primitive(732,113,3);
primitive(733,113,4);{:410}{437:}primitive(546,89,membot+0);
primitive(583,89,membot+1);primitive(413,89,membot+2);
primitive(414,89,membot+3);{:437}{442:}primitive(766,79,105);
primitive(767,79,1);primitive(768,82,0);primitive(769,82,1);
primitive(770,83,1);primitive(771,83,3);primitive(772,83,2);
primitive(773,70,0);primitive(774,70,1);primitive(775,70,2);
primitive(776,70,4);primitive(777,70,5);primitive(778,70,6);
primitive(779,70,7);primitive(780,70,8);primitive(781,70,9);
primitive(782,70,10);primitive(783,70,11);primitive(784,70,12);
primitive(785,70,13);primitive(786,70,14);primitive(787,70,15);
primitive(788,70,16);primitive(789,70,17);primitive(790,70,18);
primitive(791,70,19);{:442}{494:}primitive(850,111,0);
primitive(851,111,1);primitive(852,111,2);primitive(853,111,3);
primitive(854,111,4);primitive(855,111,6);primitive(856,111,7);
primitive(857,111,8);primitive(858,111,9);primitive(859,111,10);
primitive(860,111,11);primitive(861,111,12);primitive(862,111,16);
primitive(863,111,17);primitive(864,111,13);primitive(865,111,14);
primitive(866,111,15);primitive(867,111,20);primitive(868,111,21);
primitive(869,111,22);primitive(870,111,23);primitive(871,111,24);
primitive(872,111,25);primitive(873,111,26);primitive(874,111,27);
primitive(875,111,28);primitive(876,111,18);primitive(877,111,19);
primitive(878,111,29);primitive(879,111,30);primitive(880,111,33);
primitive(881,111,31);primitive(882,111,32);
{:494}{513:}primitive(922,108,0);primitive(923,108,1);
primitive(924,108,2);primitive(925,108,3);primitive(926,108,4);
primitive(927,108,5);primitive(928,108,6);primitive(929,108,7);
primitive(930,108,8);primitive(931,108,9);primitive(932,108,10);
primitive(933,108,11);primitive(934,108,12);primitive(935,108,13);
primitive(936,108,14);primitive(937,108,15);primitive(938,108,16);
primitive(939,108,21);{:513}{517:}primitive(941,109,2);
hash[15518].rh:=941;eqtb[15518]:=eqtb[curval];primitive(942,109,4);
primitive(943,109,3);{:517}{579:}primitive(969,87,0);
hash[17626].rh:=969;eqtb[17626]:=eqtb[curval];
{:579}{956:}primitive(1321,4,256);primitive(1322,5,257);
hash[15515].rh:=1322;eqtb[15515]:=eqtb[curval];primitive(1323,5,258);
hash[15519].rh:=1324;hash[15520].rh:=1324;eqtb[15520].hh.b0:=9;
eqtb[15520].hh.rh:=memtop-11;eqtb[15520].hh.b1:=1;
eqtb[15519]:=eqtb[15520];eqtb[15519].hh.b0:=118;
{:956}{1160:}primitive(1399,81,0);primitive(1400,81,1);
primitive(1401,81,2);primitive(1402,81,3);primitive(1403,81,4);
primitive(1404,81,5);primitive(1405,81,6);primitive(1406,81,7);
{:1160}{1230:}primitive(350,14,0);primitive(1451,14,1);
{:1230}{1236:}primitive(1452,26,4);primitive(1453,26,0);
primitive(1454,26,1);primitive(1455,26,2);primitive(1456,26,3);
primitive(1457,27,4);primitive(1458,27,0);primitive(1459,27,1);
primitive(1460,27,2);primitive(1461,27,3);primitive(343,28,5);
primitive(322,29,1);primitive(349,30,99);
{:1236}{1249:}primitive(1479,21,1);primitive(1480,21,0);
primitive(1481,22,1);primitive(1482,22,0);primitive(430,20,0);
primitive(1483,20,1);primitive(1484,20,2);primitive(1394,20,3);
primitive(1485,20,4);primitive(1396,20,5);primitive(1486,20,109);
primitive(1487,31,99);primitive(1488,31,100);primitive(1489,31,101);
primitive(1490,31,102);{:1249}{1266:}primitive(1506,43,1);
primitive(1507,43,0);primitive(1508,43,2);
{:1266}{1285:}primitive(1518,25,12);primitive(1519,25,11);
primitive(1520,25,10);primitive(1521,23,0);primitive(1522,23,1);
primitive(1523,24,0);primitive(1524,24,1);
{:1285}{1292:}primitive(45,47,1);primitive(358,47,0);
{:1292}{1319:}primitive(1556,48,0);primitive(1557,48,1);
{:1319}{1334:}primitive(1288,50,16);primitive(1289,50,17);
primitive(1290,50,18);primitive(1291,50,19);primitive(1292,50,20);
primitive(1293,50,21);primitive(1294,50,22);primitive(1295,50,23);
primitive(1297,50,26);primitive(1296,50,27);primitive(1558,51,0);
primitive(1301,51,1);primitive(1302,51,2);
{:1334}{1347:}primitive(1283,53,0);primitive(1284,53,2);
primitive(1285,53,4);primitive(1286,53,6);
{:1347}{1356:}primitive(1576,52,0);primitive(1577,52,1);
primitive(1578,52,2);primitive(1579,52,3);primitive(1580,52,4);
primitive(1581,52,5);{:1356}{1366:}primitive(1298,49,30);
primitive(1299,49,31);hash[15517].rh:=1299;eqtb[15517]:=eqtb[curval];
{:1366}{1386:}primitive(1601,93,1);primitive(1602,93,2);
primitive(1603,93,4);primitive(1604,97,0);primitive(1605,97,1);
primitive(1606,97,2);primitive(1607,97,3);
{:1386}{1397:}primitive(1624,94,0);primitive(1625,94,1);
if enctexp then begin primitive(1626,94,10);primitive(1627,94,11);end;
{:1397}{1400:}primitive(1633,95,0);primitive(1634,95,1);
primitive(1635,95,2);primitive(1636,95,3);primitive(1637,95,4);
primitive(1638,95,5);primitive(1639,95,6);
if mltexp then begin primitive(1640,95,7);end;
{:1400}{1408:}primitive(436,85,27741);
if enctexp then begin primitive(1645,85,27690);primitive(1646,85,27691);
primitive(1647,85,27692);end;primitive(440,85,28765);
primitive(437,85,27997);primitive(438,85,28253);primitive(439,85,28509);
primitive(547,85,29647);primitive(433,86,27693);primitive(434,86,27709);
primitive(435,86,27725);{:1408}{1428:}primitive(1368,99,0);
primitive(1380,99,1);{:1428}{1432:}primitive(1663,78,0);
primitive(1664,78,1);primitive(1665,78,2);primitive(1666,78,3);
primitive(1667,78,4);primitive(1668,78,5);primitive(1669,78,7);
primitive(1670,78,8);primitive(1671,78,9);primitive(1672,78,10);
primitive(1673,78,11);primitive(1674,78,6);
{:1432}{1440:}primitive(274,100,0);primitive(275,100,1);
primitive(276,100,2);primitive(1682,100,3);
{:1440}{1450:}primitive(1683,60,1);primitive(1684,60,0);
{:1450}{1455:}primitive(1685,58,0);primitive(1686,58,1);
{:1455}{1464:}primitive(1692,57,27997);primitive(1693,57,28253);
{:1464}{1469:}primitive(1694,19,0);primitive(1695,19,1);
primitive(1696,19,2);primitive(1697,19,3);
{:1469}{1524:}primitive(1744,59,0);primitive(687,59,1);writeloc:=curval;
primitive(1745,59,2);primitive(1746,59,3);hash[15524].rh:=1746;
eqtb[15524]:=eqtb[curval];primitive(1747,59,5);primitive(1748,59,6);
primitive(1749,59,7);primitive(1145,59,40);primitive(1750,59,41);
primitive(1751,59,42);primitive(1752,59,43);primitive(1753,59,9);
primitive(1754,59,10);primitive(1755,59,11);primitive(1756,59,12);
primitive(1757,59,13);primitive(1758,59,14);primitive(1759,59,15);
primitive(1760,59,16);primitive(1761,59,17);primitive(1762,59,18);
primitive(1763,59,19);primitive(1764,59,20);primitive(1765,59,21);
primitive(1766,59,22);primitive(1767,59,23);primitive(1768,59,36);
primitive(1769,59,37);primitive(1770,59,38);primitive(1771,59,24);
primitive(1772,59,25);primitive(1773,59,26);primitive(1774,59,28);
primitive(1775,59,27);primitive(1776,59,29);primitive(1777,59,30);
primitive(1778,59,31);primitive(1779,59,32);primitive(1780,59,33);
primitive(1781,59,35);primitive(1782,59,34);primitive(1783,59,39);
primitive(1784,59,44);primitive(1785,59,45);primitive(1786,59,46);
primitive(1787,59,47);primitive(1788,59,48);primitive(1789,59,49);
primitive(1790,59,50);{:1524}{1908:}primitive(2104,73,29390);{:1908};
nonewcontrolsequence:=true;end;
endif('INITEX'){:1516}{1518:}ifdef('TEXMF_DEBUG')procedure debughelp;
label 888,10;var k,l,m,n:integer;begin;while true do begin;
printnl(1743);fflush(stdout);read(stdin,m);
if m<0 then goto 10 else if m=0 then dumpcore else begin read(stdin,n);
case m of{1519:}1:printword(mem[n]);2:printint(mem[n].hh.lh);
3:printint(mem[n].hh.rh);4:printword(eqtb[n]);
5:begin printscaled(fontinfo[n].int);printchar(32);
printint(fontinfo[n].qqqq.b0);printchar(58);
printint(fontinfo[n].qqqq.b1);printchar(58);
printint(fontinfo[n].qqqq.b2);printchar(58);
printint(fontinfo[n].qqqq.b3);end;6:printword(savestack[n]);
7:showbox(n);8:begin breadthmax:=10000;
depththreshold:=poolsize-poolptr-10;shownodelist(n);end;
9:showtokenlist(n,-268435455,1000);10:slowprint(n);11:checkmem(n>0);
12:searchmem(n);13:begin read(stdin,l);printcmdchr(n,l);end;
14:for k:=0 to n do print(buffer[k]);15:begin fontinshortdisplay:=0;
shortdisplay(n);end;16:panicking:=not panicking;
{:1519}others:print(63)end;end;end;10:end;
endif('TEXMF_DEBUG'){:1518}{:1510}{1512:}procedure mainbody;
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
bounddefault:=72;boundname:='pk_dpi';
setupboundvariable(addressof(pkdpi),boundname,bounddefault);
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
begin if objtabsize<infobjtabsize then objtabsize:=infobjtabsize else if
objtabsize>supobjtabsize then objtabsize:=supobjtabsize end;
begin if pdfmemsize<infpdfmemsize then pdfmemsize:=infpdfmemsize else if
pdfmemsize>suppdfmemsize then pdfmemsize:=suppdfmemsize end;
begin if destnamessize<infdestnamessize then destnamessize:=
infdestnamessize else if destnamessize>supdestnamessize then
destnamessize:=supdestnamessize end;
begin if pkdpi<infpkdpi then pkdpi:=infpkdpi else if pkdpi>suppkdpi then
pkdpi:=suppkdpi end;if errorline>255 then errorline:=255;
buffer:=xmallocarray(ASCIIcode,bufsize);
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
objtab:=xmallocarray(objentry,infobjtabsize);
pdfmem:=xmallocarray(integer,infpdfmemsize);
destnames:=xmallocarray(destnameentry,infdestnamessize);
pdfopbuf:=xmallocarray(eightbits,pdfopbufsize);
pdfosbuf:=xmallocarray(eightbits,infpdfosbufsize);
pdfosobjnum:=xmallocarray(integer,pdfosmaxobjs);
pdfosobjoff:=xmallocarray(integer,pdfosmaxobjs);
ifdef('INITEX')if iniversion then begin yzmem:=xmallocarray(memoryword,
memtop-membot+1);zmem:=yzmem-membot;eqtbtop:=30192+hashextra;
if hashextra=0 then hashtop:=26627 else hashtop:=eqtbtop;
yhash:=xmallocarray(twohalves,1+hashtop-hashoffset);
hash:=yhash-hashoffset;hash[514].lh:=0;hash[514].rh:=0;
for hashused:=515 to hashtop do hash[hashused]:=hash[514];
zeqtb:=xmallocarray(memoryword,eqtbtop);eqtb:=zeqtb;
strstart:=xmallocarray(poolpointer,maxstrings);
strpool:=xmallocarray(packedASCIIcode,poolsize);
fontinfo:=xmallocarray(fmemoryword,fontmemsize);end;
endif('INITEX')history:=3;;if readyalready=314159 then goto 1;
{14:}bad:=0;
if(halferrorline<30)or(halferrorline>errorline-15)then bad:=1;
if maxprintline<60 then bad:=2;if dvibufsize mod 8<>0 then bad:=3;
if membot+1100>memtop then bad:=4;if 8501>15000 then bad:=5;
if maxinopen>=128 then bad:=6;if memtop<267 then bad:=7;
{:14}{129:}ifdef('INITEX')if(memmin<>membot)or(memmax<>memtop)then bad:=
10;endif('INITEX')if(memmin>membot)or(memmax<memtop)then bad:=10;
if(0>0)or(255<127)then bad:=11;
if(-268435455>0)or(268435455<32767)then bad:=12;
if(0<-268435455)or(255>268435455)then bad:=13;
if(membot-supmainmemory<-268435455)or(memtop+supmainmemory>=268435455)
then bad:=14;if(9000<-268435455)or(9000>268435455)then bad:=15;
if fontmax>9000 then bad:=16;
if(savesize>268435455)or(maxstrings>268435455)then bad:=17;
if bufsize>268435455 then bad:=18;if 255<255 then bad:=19;
{:129}{312:}if 34287+hashextra>268435455 then bad:=21;
if(hashoffset<0)or(hashoffset>514)then bad:=42;
{:312}{548:}if formatdefaultlength>maxint then bad:=31;
{:548}{1427:}if 2*268435455<memtop-memmin then bad:=41;
{:1427}if bad>0 then begin writeln(stdout,
'Ouch---my internal constants have been clobbered!','---case ',bad:1);
goto 9999;end;initialize;
ifdef('INITEX')if iniversion then begin if not getstringsstarted then
goto 9999;initprim;initstrptr:=strptr;initpoolptr:=poolptr;
fixdateandtime;end;endif('INITEX')readyalready:=314159;
1:{55:}selector:=17;tally:=0;termoffset:=0;fileoffset:=0;
{:55}{61:}if srcspecialsp or filelineerrorstylep or parsefirstlinep then
write(stdout,'This is pdfTeX, Version 3.141592653','-2.6','-1.40.29')
else write(stdout,'This is pdfTeX, Version 3.141592653','-2.6',
'-1.40.29');write(stdout,versionstring);
if formatident=0 then writeln(stdout,' (preloaded format=',dumpname,')')
else begin slowprint(formatident);println;end;
if shellenabledp then begin write(stdout,' ');
if restrictedshell then begin write(stdout,'restricted ');end;
writeln(stdout,'\write18 enabled.');end;
if srcspecialsp then begin writeln(stdout,' Source specials enabled.')
end;if translatefilename then begin write(stdout,' (');
fputs(translatefilename,stdout);writeln(stdout,')');end;fflush(stdout);
{:61}{554:}jobname:=0;nameinprogress:=false;logopened:=false;
{:554}{559:}outputfilename:=0;{:559};
{1517:}begin{353:}begin inputptr:=0;maxinstack:=0;
sourcefilenamestack[0]:=0;fullsourcefilenamestack[0]:=0;inopen:=0;
openparens:=0;maxbufstack:=0;grpstack[0]:=0;ifstack[0]:=-268435455;
paramptr:=0;maxparamstack:=0;first:=bufsize;repeat buffer[first]:=0;
decr(first);until first=0;buffer[0]:=0;scannerstatus:=0;
warningindex:=-268435455;first:=1;curinput.statefield:=33;
curinput.startfield:=1;curinput.indexfield:=0;line:=0;
curinput.namefield:=0;forceeof:=false;alignstate:=1000000;
if not initterminal then goto 9999;curinput.limitfield:=last;
first:=last+1;end{:353};
{1648:}ifdef('INITEX')if(etexp or(buffer[curinput.locfield]=42))and(
formatident=1710)then begin nonewcontrolsequence:=false;
{1649:}primitive(1993,70,3);primitive(1994,70,20);primitive(883,111,5);
{:1649}{1657:}primitive(1996,72,27172);primitive(1997,73,29379);
primitive(1998,73,29380);primitive(1999,73,29381);
primitive(2000,73,29382);primitive(2001,73,29383);
primitive(2002,73,29384);primitive(2003,73,29385);
primitive(2004,73,29386);primitive(2005,73,29387);
primitive(2006,73,29388);{:1657}{1663:}primitive(2021,70,21);
primitive(2022,70,22);{:1663}{1666:}primitive(2023,70,23);
primitive(2024,70,24);primitive(2025,70,25);
{:1666}{1669:}primitive(2026,70,28);primitive(2027,70,29);
primitive(2028,70,30);primitive(2029,70,31);
{:1669}{1672:}primitive(2030,70,32);primitive(2031,70,33);
primitive(2032,70,34);{:1672}{1675:}primitive(2033,19,4);
{:1675}{1684:}primitive(2035,19,5);{:1684}{1686:}primitive(2036,112,1);
primitive(2037,112,5);{:1686}{1689:}primitive(2038,19,6);
{:1689}{1692:}primitive(2042,82,2);{:1692}{1697:}primitive(1300,49,1);
{:1697}{1701:}primitive(2046,73,29389);primitive(2047,33,6);
primitive(2048,33,7);primitive(2049,33,10);primitive(2050,33,11);
{:1701}{1747:}primitive(2059,107,2);{:1747}{1759:}primitive(2061,96,1);
{:1759}{1762:}primitive(940,105,1);primitive(2062,108,17);
primitive(2063,108,18);primitive(2064,108,19);primitive(2065,108,20);
primitive(2066,108,22);primitive(2067,108,23);
{:1762}{1770:}primitive(1615,93,8);{:1770}{1778:}primitive(2073,70,39);
primitive(2074,70,40);primitive(2075,70,41);primitive(2076,70,42);
{:1778}{1801:}primitive(2080,70,26);primitive(2081,70,27);
primitive(2082,70,35);primitive(2083,70,36);
{:1801}{1805:}primitive(2084,70,37);primitive(2085,70,38);
{:1805}{1809:}primitive(2086,18,5);primitive(2087,113,5);
primitive(2088,113,6);primitive(2089,113,7);primitive(2090,113,8);
primitive(2091,113,9);{:1809}{1861:}primitive(2095,24,2);
primitive(2096,24,3);{:1861}{1864:}primitive(2097,84,27429);
primitive(2098,84,27430);primitive(2099,84,27431);
primitive(2100,84,27432);
{:1864}if(buffer[curinput.locfield]=42)then incr(curinput.locfield);
eTeXmode:=1;{1813:}maxregnum:=32767;maxreghelpline:=2092;{:1813}end;
endif('INITEX')if not nonewcontrolsequence then nonewcontrolsequence:=
true else{:1648}if(formatident=0)or(buffer[curinput.locfield]=38)or
dumpline then begin if formatident<>0 then initialize;
if not openfmtfile then goto 9999;
if not loadfmtfile then begin wclose(fmtfile);goto 9999;end;
wclose(fmtfile);eqtb:=zeqtb;
while(curinput.locfield<curinput.limitfield)and(buffer[curinput.locfield
]=32)do incr(curinput.locfield);end;
if(pdfoutputoption<>0)then eqtb[29342].int:=pdfoutputvalue;
if(pdfdraftmodeoption<>0)then eqtb[29368].int:=pdfdraftmodevalue;
pdfinitmapfile('pdftex.map');
if(eTeXmode=1)then writeln(stdout,'entering extended mode');
if(eqtb[29325].int<0)or(eqtb[29325].int>255)then decr(curinput.
limitfield)else buffer[curinput.limitfield]:=eqtb[29325].int;
if mltexenabledp then begin writeln(stdout,'MLTeX v2.2 enabled');end;
if enctexenabledp then begin write(stdout,' encTeX v. Jun. 2004');
writeln(stdout,', reencoding enabled.');
if translatefilename then begin writeln(stdout,
' (\xordcode, \xchrcode, \xprncode overridden by TCX)');end;end;
fixdateandtime;
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
fontcheck:=xmallocarray(fourquarters,fontmax);
fontsize:=xmallocarray(scaled,fontmax);
fontdsize:=xmallocarray(scaled,fontmax);
fontparams:=xmallocarray(fontindex,fontmax);
fontname:=xmallocarray(strnumber,fontmax);
fontarea:=xmallocarray(strnumber,fontmax);
fontbc:=xmallocarray(eightbits,fontmax);
fontec:=xmallocarray(eightbits,fontmax);
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
pdfcharused:=xmallocarray(charusedarray,fontmax);
pdffontsize:=xmallocarray(scaled,fontmax);
pdffontnum:=xmallocarray(integer,fontmax);
pdffontmap:=xmallocarray(fmentryptr,fontmax);
pdffonttype:=xmallocarray(eightbits,fontmax);
pdffontattr:=xmallocarray(strnumber,fontmax);
pdffontblink:=xmallocarray(internalfontnumber,fontmax);
pdffontelink:=xmallocarray(internalfontnumber,fontmax);
pdffonthasspacechar:=xmallocarray(boolean,fontmax);
pdffontstretch:=xmallocarray(integer,fontmax);
pdffontshrink:=xmallocarray(integer,fontmax);
pdffontstep:=xmallocarray(integer,fontmax);
pdffontexpandratio:=xmallocarray(integer,fontmax);
pdffontautoexpand:=xmallocarray(boolean,fontmax);
pdffontlpbase:=xmallocarray(integer,fontmax);
pdffontrpbase:=xmallocarray(integer,fontmax);
pdffontefbase:=xmallocarray(integer,fontmax);
pdffontknbsbase:=xmallocarray(integer,fontmax);
pdffontstbsbase:=xmallocarray(integer,fontmax);
pdffontshbsbase:=xmallocarray(integer,fontmax);
pdffontknbcbase:=xmallocarray(integer,fontmax);
pdffontknacbase:=xmallocarray(integer,fontmax);
vfpacketbase:=xmallocarray(integer,fontmax);
vfdefaultfont:=xmallocarray(internalfontnumber,fontmax);
vflocalfontnum:=xmallocarray(internalfontnumber,fontmax);
vfefnts:=xmallocarray(integer,fontmax);
vfifnts:=xmallocarray(internalfontnumber,fontmax);
pdffontnobuiltintounicode:=xmallocarray(boolean,fontmax);
for fontk:=0 to fontmax do begin for k:=0 to 31 do pdfcharused[fontk,k]
:=0;pdffontsize[fontk]:=0;pdffontnum[fontk]:=0;pdffontmap[fontk]:=0;
pdffonttype[fontk]:=0;pdffontattr[fontk]:=345;pdffontblink[fontk]:=0;
pdffontelink[fontk]:=0;pdffonthasspacechar[fontk]:=false;
pdffontstretch[fontk]:=0;pdffontshrink[fontk]:=0;pdffontstep[fontk]:=0;
pdffontexpandratio[fontk]:=0;pdffontautoexpand[fontk]:=false;
pdffontlpbase[fontk]:=0;pdffontrpbase[fontk]:=0;pdffontefbase[fontk]:=0;
pdffontknbsbase[fontk]:=0;pdffontstbsbase[fontk]:=0;
pdffontshbsbase[fontk]:=0;pdffontknbcbase[fontk]:=0;
pdffontknacbase[fontk]:=0;pdffontnobuiltintounicode[fontk]:=false;end;
fontptr:=0;fmemptr:=7;makepdftexbanner;fontname[0]:=969;
fontarea[0]:=345;hyphenchar[0]:=45;skewchar[0]:=-1;bcharlabel[0]:=0;
fontbchar[0]:=256;fontfalsebchar[0]:=256;fontbc[0]:=1;fontec[0]:=0;
fontsize[0]:=0;fontdsize[0]:=0;charbase[0]:=0;widthbase[0]:=0;
heightbase[0]:=0;depthbase[0]:=0;italicbase[0]:=0;ligkernbase[0]:=0;
kernbase[0]:=0;extenbase[0]:=0;fontglue[0]:=-268435455;fontparams[0]:=7;
parambase[0]:=-1;for fontk:=0 to 6 do fontinfo[fontk].int:=0;end;
endif('INITEX')fontused:=xmallocarray(boolean,fontmax);
for fontk:=0 to fontmax do fontused[fontk]:=false;
randomseed:=(microseconds*1000)+(epochseconds mod 1000000);
initrandoms(randomseed);{941:}magicoffset:=strstart[1315]-9*16{:941};
{75:}if interaction=0 then selector:=16 else selector:=17{:75};
if(curinput.locfield<curinput.limitfield)and(eqtb[27741+buffer[curinput.
locfield]].hh.rh<>0)then startinput;end{:1517};history:=0;
{1913:}synctexinitcommand;{:1913}maincontrol;finalcleanup;
closefilesandterminate;9999:begin fflush(stdout);readyalready:=0;
if(history<>0)and(history<>1)then uexit(1)else uexit(0);end;end;
{:1512}{1880:}procedure scanfilenamebraced;
var savescannerstatus:smallnumber;savedefref:halfword;
savecurcs:halfword;s:strnumber;p:halfword;i:integer;
savestopatspace:boolean;dummy:boolean;
begin savescannerstatus:=scannerstatus;savedefref:=defref;
savecurcs:=curcs;curcs:=warningindex;if scantoks(false,true)<>0 then;
oldsetting:=selector;selector:=21;
showtokenlist(mem[defref].hh.rh,-268435455,poolsize-poolptr);
selector:=oldsetting;s:=makestring;deletetokenref(defref);
defref:=savedefref;curcs:=savecurcs;scannerstatus:=savescannerstatus;
savestopatspace:=stopatspace;stopatspace:=false;beginname;
for i:=strstart[s]to strstart[s+1]-1 do dummy:=morename(strpool[i]);
stopatspace:=savestopatspace;end;
{:1880}{1940:}function getnullstr:strnumber;begin getnullstr:=345;end;
{:1940}
