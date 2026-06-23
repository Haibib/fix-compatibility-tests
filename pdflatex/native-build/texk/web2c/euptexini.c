#define EXTERN extern
#include "euptexd.h"

void 
initialize ( void ) 
{
  initialize_regmem 
  integer i  ;
  integer k  ;
  hyphpointer z  ;
  xchr [32 ]= ' ' ;
  xchr [33 ]= '!' ;
  xchr [34 ]= '"' ;
  xchr [35 ]= '#' ;
  xchr [36 ]= '$' ;
  xchr [37 ]= '%' ;
  xchr [38 ]= '&' ;
  xchr [39 ]= '\'' ;
  xchr [40 ]= '(' ;
  xchr [41 ]= ')' ;
  xchr [42 ]= '*' ;
  xchr [43 ]= '+' ;
  xchr [44 ]= ',' ;
  xchr [45 ]= '-' ;
  xchr [46 ]= '.' ;
  xchr [47 ]= '/' ;
  xchr [48 ]= '0' ;
  xchr [49 ]= '1' ;
  xchr [50 ]= '2' ;
  xchr [51 ]= '3' ;
  xchr [52 ]= '4' ;
  xchr [53 ]= '5' ;
  xchr [54 ]= '6' ;
  xchr [55 ]= '7' ;
  xchr [56 ]= '8' ;
  xchr [57 ]= '9' ;
  xchr [58 ]= ':' ;
  xchr [59 ]= ';' ;
  xchr [60 ]= '<' ;
  xchr [61 ]= '=' ;
  xchr [62 ]= '>' ;
  xchr [63 ]= '?' ;
  xchr [64 ]= '@' ;
  xchr [65 ]= 'A' ;
  xchr [66 ]= 'B' ;
  xchr [67 ]= 'C' ;
  xchr [68 ]= 'D' ;
  xchr [69 ]= 'E' ;
  xchr [70 ]= 'F' ;
  xchr [71 ]= 'G' ;
  xchr [72 ]= 'H' ;
  xchr [73 ]= 'I' ;
  xchr [74 ]= 'J' ;
  xchr [75 ]= 'K' ;
  xchr [76 ]= 'L' ;
  xchr [77 ]= 'M' ;
  xchr [78 ]= 'N' ;
  xchr [79 ]= 'O' ;
  xchr [80 ]= 'P' ;
  xchr [81 ]= 'Q' ;
  xchr [82 ]= 'R' ;
  xchr [83 ]= 'S' ;
  xchr [84 ]= 'T' ;
  xchr [85 ]= 'U' ;
  xchr [86 ]= 'V' ;
  xchr [87 ]= 'W' ;
  xchr [88 ]= 'X' ;
  xchr [89 ]= 'Y' ;
  xchr [90 ]= 'Z' ;
  xchr [91 ]= '[' ;
  xchr [92 ]= '\\' ;
  xchr [93 ]= ']' ;
  xchr [94 ]= '^' ;
  xchr [95 ]= '_' ;
  xchr [96 ]= '`' ;
  xchr [97 ]= 'a' ;
  xchr [98 ]= 'b' ;
  xchr [99 ]= 'c' ;
  xchr [100 ]= 'd' ;
  xchr [101 ]= 'e' ;
  xchr [102 ]= 'f' ;
  xchr [103 ]= 'g' ;
  xchr [104 ]= 'h' ;
  xchr [105 ]= 'i' ;
  xchr [106 ]= 'j' ;
  xchr [107 ]= 'k' ;
  xchr [108 ]= 'l' ;
  xchr [109 ]= 'm' ;
  xchr [110 ]= 'n' ;
  xchr [111 ]= 'o' ;
  xchr [112 ]= 'p' ;
  xchr [113 ]= 'q' ;
  xchr [114 ]= 'r' ;
  xchr [115 ]= 's' ;
  xchr [116 ]= 't' ;
  xchr [117 ]= 'u' ;
  xchr [118 ]= 'v' ;
  xchr [119 ]= 'w' ;
  xchr [120 ]= 'x' ;
  xchr [121 ]= 'y' ;
  xchr [122 ]= 'z' ;
  xchr [123 ]= '{' ;
  xchr [124 ]= '|' ;
  xchr [125 ]= '}' ;
  xchr [126 ]= '~' ;
  {register integer for_end; i = 0 ;for_end = 31 ; if ( i <= for_end) do 
    xchr [i ]= i ;
  while ( i++ < for_end ) ;} 
  {register integer for_end; i = 127 ;for_end = 511 ; if ( i <= for_end) do 
    xchr [i ]= i ;
  while ( i++ < for_end ) ;} 
  {register integer for_end; i = 0 ;for_end = 255 ; if ( i <= for_end) do 
    xord [chr ( i ) ]= 127 ;
  while ( i++ < for_end ) ;} 
  {register integer for_end; i = 128 ;for_end = 255 ; if ( i <= for_end) do 
    xord [xchr [i ]]= i ;
  while ( i++ < for_end ) ;} 
  {register integer for_end; i = 0 ;for_end = 126 ; if ( i <= for_end) do 
    xord [xchr [i ]]= i ;
  while ( i++ < for_end ) ;} 
  {register integer for_end; i = 0 ;for_end = 255 ; if ( i <= for_end) do 
    xprn [i ]= ( eightbitp || ( ( i >= 32 ) && ( i <= 126 ) ) ) ;
  while ( i++ < for_end ) ;} 
  if ( translatefilename ) 
  readtcxfile () ;
  if ( interactionoption == 4 ) 
  interaction = 3 ;
  else interaction = interactionoption ;
  deletionsallowed = true ;
  setboxallowed = true ;
  errorcount = 0 ;
  helpptr = 0 ;
  useerrhelp = false ;
  interrupt = 0 ;
  OKtointerrupt = true ;
  twotothe [0 ]= 1 ;
  {register integer for_end; k = 1 ;for_end = 30 ; if ( k <= for_end) do 
    twotothe [k ]= 2 * twotothe [k - 1 ];
  while ( k++ < for_end ) ;} 
  speclog [1 ]= 93032640L ;
  speclog [2 ]= 38612034L ;
  speclog [3 ]= 17922280L ;
  speclog [4 ]= 8662214L ;
  speclog [5 ]= 4261238L ;
  speclog [6 ]= 2113709L ;
  speclog [7 ]= 1052693L ;
  speclog [8 ]= 525315L ;
  speclog [9 ]= 262400L ;
  speclog [10 ]= 131136L ;
  speclog [11 ]= 65552L ;
  speclog [12 ]= 32772L ;
  speclog [13 ]= 16385 ;
  {register integer for_end; k = 14 ;for_end = 27 ; if ( k <= for_end) do 
    speclog [k ]= twotothe [27 - k ];
  while ( k++ < for_end ) ;} 
  speclog [28 ]= 1 ;
	;
#ifdef TEXMF_DEBUG
  wasmemend = memmin ;
  waslomax = memmin ;
  washimin = memmax ;
  panicking = false ;
#endif /* TEXMF_DEBUG */
  nestptr = 0 ;
  maxneststack = 0 ;
  curlist .modefield = 1 ;
  curlist .headfield = memtop - 1 ;
  curlist .tailfield = memtop - 1 ;
  curlist .pnodefield = curlist .tailfield ;
  curlist .dirfield = 4 ;
  curlist .adjdirfield = curlist .dirfield ;
  curlist .pdispfield = 0 ;
  curlist .lastjchrfield = -1073741823L ;
  curlist .dispcalledfield = false ;
  curlist .eTeXauxfield = -1073741823L ;
  curlist .auxfield .cint = -65536000L ;
  curlist .mlfield = 0 ;
  curlist .pgfield = 0 ;
  shownmode = 0 ;
  pagecontents = 0 ;
  pagetail = memtop - 2 ;
  lastglue = 1073741823L ;
  lastpenalty = 0 ;
  lastkern = 0 ;
  lastnodetype = -1 ;
  lastnodesubtype = -1 ;
  pagesofar [8 ]= 0 ;
  pagemaxdepth = 0 ;
  {register integer for_end; k = 114361L ;for_end = 116261L ; if ( k <= 
  for_end) do 
    xeqlevel [k ]= 1 ;
  while ( k++ < for_end ) ;} 
  nonewcontrolsequence = true ;
  prim [0 ].v.LH = 0 ;
  prim [0 ].v.RH = 0 ;
  {register integer for_end; k = 1 ;for_end = 2100 ; if ( k <= for_end) do 
    prim [k ]= prim [0 ];
  while ( k++ < for_end ) ;} 
  saveptr = 0 ;
  curlevel = 1 ;
  curgroup = 0 ;
  curboundary = 0 ;
  maxsavestack = 0 ;
  magset = 0 ;
  skipmode = true ;
  isincsname = false ;
  curmark [0 ]= -1073741823L ;
  curmark [1 ]= -1073741823L ;
  curmark [2 ]= -1073741823L ;
  curmark [3 ]= -1073741823L ;
  curmark [4 ]= -1073741823L ;
  curval = 0 ;
  curvallevel = 0 ;
  radix = 0 ;
  curorder = 0 ;
  {register integer for_end; k = 0 ;for_end = 16 ; if ( k <= for_end) do 
    readopen [k ]= 2 ;
  while ( k++ < for_end ) ;} 
  condptr = -1073741823L ;
  iflimit = 0 ;
  curif = 0 ;
  ifline = 0 ;
  jfmenc = 0 ;
  nullcharacter .b0 = 0 ;
  nullcharacter .b1 = 0 ;
  nullcharacter .b2 = 0 ;
  nullcharacter .b3 = 0 ;
  totalpages = 0 ;
  maxv = 0 ;
  maxh = 0 ;
  maxpush = 0 ;
  lastbop = -1 ;
  doingleaders = false ;
  deadcycles = 0 ;
  curs = -1 ;
  dirused = false ;
  halfbuf = dvibufsize / 2 ;
  dvilimit = dvibufsize ;
  dviptr = 0 ;
  dvioffset = 0 ;
  dvigone = 0 ;
  downptr = -1073741823L ;
  rightptr = -1073741823L ;
  adjusttail = -1073741823L ;
  lastbadness = 0 ;
  curkanjiskip = membot ;
  curxkanjiskip = membot ;
  preadjusttail = -1073741823L ;
  packbeginline = 0 ;
  emptyfield .v.RH = 0 ;
  emptyfield .v.LH = -1073741823L ;
  nulldelimiter .b0 = 0 ;
  nulldelimiter .b1 = 0 ;
  nulldelimiter .b2 = 0 ;
  nulldelimiter .b3 = 0 ;
  alignptr = -1073741823L ;
  curalign = -1073741823L ;
  curspan = -1073741823L ;
  curloop = -1073741823L ;
  curhead = -1073741823L ;
  curtail = -1073741823L ;
  curprehead = -1073741823L ;
  curpretail = -1073741823L ;
  maxhyphchar = 11903 ;
  {register integer for_end; z = 0 ;for_end = hyphsize ; if ( z <= for_end) 
  do 
    {
      hyphword [z ]= 0 ;
      hyphlist [z ]= -1073741823L ;
      hyphlink [z ]= 0 ;
    } 
  while ( z++ < for_end ) ;} 
  hyphcount = 0 ;
  hyphnext = 608 ;
  if ( hyphnext > hyphsize ) 
  hyphnext = 607 ;
  outputactive = false ;
  outputcanend = false ;
  insertpenalties = 0 ;
  ligaturepresent = false ;
  cancelboundary = false ;
  lfthit = false ;
  rthit = false ;
  insdisc = false ;
  aftertoken = 0 ;
  longhelpseen = false ;
  formatident = 0 ;
  {register integer for_end; k = 0 ;for_end = 17 ; if ( k <= for_end) do 
    writeopen [k ]= false ;
  while ( k++ < for_end ) ;} 
  LRptr = -1073741823L ;
  LRproblems = 0 ;
  curdir = 0 ;
  pseudofiles = -1073741823L ;
  saroot [6 ]= -1073741823L ;
  sanull .hh .v.LH = -1073741823L ;
  sanull .hh .v.RH = -1073741823L ;
  sachain = -1073741823L ;
  salevel = 0 ;
  discptr [2 ]= -1073741823L ;
  discptr [3 ]= -1073741823L ;
  editnamestart = 0 ;
  stopatspace = true ;
  haltingonerrorp = false ;
	;
#ifdef TEXMF_DEBUG
  debugformatfile = true ;
#endif /* TEXMF_DEBUG */
  expanddepthcount = 0 ;
  mltexenabledp = false ;
  pagedir = 4 ;
  secondsandmicros ( epochseconds , microseconds ) ;
  initstarttime () ;
	;
#ifdef INITEX
  if ( iniversion ) 
  {
    {register integer for_end; k = membot + 1 ;for_end = membot + 23 ; if ( 
    k <= for_end) do 
      mem [k ].cint = 0 ;
    while ( k++ < for_end ) ;} 
    k = membot ;
    while ( k <= membot + 23 ) {
	
      mem [k ].hh .v.RH = -1073741822L ;
      mem [k ].hh.b0 = 0 ;
      mem [k ].hh.b1 = 0 ;
      k = k + 4 ;
    } 
    mem [membot + 6 ].cint = 65536L ;
    mem [membot + 4 ].hh.b0 = 1 ;
    mem [membot + 10 ].cint = 65536L ;
    mem [membot + 8 ].hh.b0 = 2 ;
    mem [membot + 14 ].cint = 65536L ;
    mem [membot + 12 ].hh.b0 = 3 ;
    mem [membot + 18 ].cint = 65536L ;
    mem [membot + 16 ].hh.b0 = 2 ;
    mem [membot + 19 ].cint = 65536L ;
    mem [membot + 16 ].hh.b1 = 2 ;
    mem [membot + 22 ].cint = -65536L ;
    mem [membot + 20 ].hh.b0 = 2 ;
    rover = membot + 24 ;
    mem [rover ].hh .v.RH = 1073741823L ;
    mem [rover ].hh .v.LH = 1000 ;
    mem [rover + 1 ].hh .v.LH = rover ;
    mem [rover + 1 ].hh .v.RH = rover ;
    lomemmax = rover + 1000 ;
    mem [lomemmax ].hh .v.RH = -1073741823L ;
    mem [lomemmax ].hh .v.LH = -1073741823L ;
    {register integer for_end; k = memtop - 14 ;for_end = memtop ; if ( k <= 
    for_end) do 
      mem [k ]= mem [lomemmax ];
    while ( k++ < for_end ) ;} 
    mem [memtop - 10 ].hh .v.LH = 536909726L ;
    mem [memtop - 9 ].hh .v.RH = 65536L ;
    mem [memtop - 9 ].hh .v.LH = -1073741823L ;
    mem [memtop - 7 ].hh.b0 = 1 ;
    mem [memtop - 6 ].hh .v.LH = 1073741823L ;
    mem [memtop - 7 ].hh.b1 = 0 ;
    mem [memtop ].hh.b1 = 255 ;
    mem [memtop ].hh.b0 = 1 ;
    mem [memtop ].hh .v.RH = memtop ;
    mem [memtop - 2 ].hh.b0 = 12 ;
    mem [memtop - 2 ].hh.b1 = 0 ;
    avail = -1073741823L ;
    memend = memtop ;
    himemmin = memtop - 14 ;
    varused = membot + 24 - membot ;
    dynused = 15 ;
    eqtb [49924L ].hh.b0 = 119 ;
    eqtb [49924L ].hh .v.RH = -1073741823L ;
    eqtb [49924L ].hh.b1 = 0 ;
    {register integer for_end; k = 1 ;for_end = eqtbtop ; if ( k <= for_end) 
    do 
      eqtb [k ]= eqtb [49924L ];
    while ( k++ < for_end ) ;} 
    eqtb [49925L ].hh .v.RH = membot ;
    eqtb [49925L ].hh.b1 = 1 ;
    eqtb [49925L ].hh.b0 = 135 ;
    {register integer for_end; k = 49926L ;for_end = 50457L ; if ( k <= 
    for_end) do 
      eqtb [k ]= eqtb [49925L ];
    while ( k++ < for_end ) ;} 
    mem [membot ].hh .v.RH = mem [membot ].hh .v.RH + 533 ;
    eqtb [50458L ].hh .v.RH = -1073741823L ;
    eqtb [50458L ].hh.b0 = 136 ;
    eqtb [50458L ].hh.b1 = 1 ;
    {register integer for_end; k = 50725L ;for_end = 50728L ; if ( k <= 
    for_end) do 
      eqtb [k ]= eqtb [50458L ];
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 50459L ;for_end = 50724L ; if ( k <= 
    for_end) do 
      eqtb [k ]= eqtb [49924L ];
    while ( k++ < for_end ) ;} 
    eqtb [50729L ].hh .v.RH = -1073741823L ;
    eqtb [50729L ].hh.b0 = 137 ;
    eqtb [50729L ].hh.b1 = 1 ;
    {register integer for_end; k = 50730L ;for_end = 50984L ; if ( k <= 
    for_end) do 
      eqtb [k ]= eqtb [50729L ];
    while ( k++ < for_end ) ;} 
    eqtb [50985L ].hh .v.RH = 0 ;
    eqtb [50985L ].hh.b0 = 138 ;
    eqtb [50985L ].hh.b1 = 1 ;
    eqtb [51754L ].hh .v.RH = 0 ;
    eqtb [51754L ].hh.b0 = 138 ;
    eqtb [51754L ].hh.b1 = 1 ;
    eqtb [51755L ].hh .v.RH = 0 ;
    eqtb [51755L ].hh.b0 = 138 ;
    eqtb [51755L ].hh.b1 = 1 ;
    {register integer for_end; k = 50986L ;for_end = 51753L ; if ( k <= 
    for_end) do 
      eqtb [k ]= eqtb [50985L ];
    while ( k++ < for_end ) ;} 
    eqtb [51759L ].hh .v.RH = 0 ;
    eqtb [51759L ].hh.b0 = 138 ;
    eqtb [51759L ].hh.b1 = 1 ;
    {register integer for_end; k = 51760L ;for_end = 114360L ; if ( k <= 
    for_end) do 
      eqtb [k ]= eqtb [51759L ];
    while ( k++ < for_end ) ;} 
    eqtb [51756L ]= eqtb [51759L ];
    eqtb [51757L ]= eqtb [51759L ];
    eqtb [51758L ]= eqtb [51759L ];
    {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
      {
	eqtb [113849L + k ].hh .v.RH = k ;
      } 
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 0 ;for_end = 11903 ; if ( k <= for_end) 
    do 
      {
	eqtb [51759L + k ].hh .v.RH = 12 ;
	eqtb [101945L + k ].hh .v.RH = 1000 ;
	eqtb [64175L + k ].hh .v.RH = 0 ;
      } 
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 0 ;for_end = 511 ; if ( k <= for_end) do 
      {
	eqtb [63663L + k ].hh .v.RH = 18 ;
      } 
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 0 ;for_end = 1023 ; if ( k <= for_end) do 
      {
	eqtb [76079L + k ].hh .v.RH = 0 ;
	eqtb [76079L + k ].hh.b0 = 0 ;
	eqtb [77103L + k ].hh .v.RH = 0 ;
	eqtb [77103L + k ].hh.b0 = 0 ;
      } 
    while ( k++ < for_end ) ;} 
    eqtb [51772L ].hh .v.RH = 5 ;
    eqtb [51791L ].hh .v.RH = 10 ;
    eqtb [51851L ].hh .v.RH = 0 ;
    eqtb [51796L ].hh .v.RH = 14 ;
    eqtb [51886L ].hh .v.RH = 15 ;
    eqtb [51759L ].hh .v.RH = 9 ;
    {register integer for_end; k = 48 ;for_end = 57 ; if ( k <= for_end) do 
      {
	eqtb [113849L + k ].hh .v.RH = k + 458752L ;
	eqtb [64175L + k ].hh .v.RH = 3 ;
      } 
    while ( k++ < for_end ) ;} 
    eqtb [78127L ].hh .v.RH = toDVI ( fromJIS ( 8507 ) ) ;
    eqtb [78128L ].hh .v.RH = toDVI ( fromJIS ( 12396 ) ) ;
    eqtb [78129L ].hh .v.RH = toDVI ( fromJIS ( 18035 ) ) ;
    eqtb [78130L ].hh .v.RH = toDVI ( fromJIS ( 15152 ) ) ;
    eqtb [78131L ].hh .v.RH = toDVI ( fromJIS ( 15181 ) ) ;
    eqtb [78132L ].hh .v.RH = toDVI ( fromJIS ( 14430 ) ) ;
    eqtb [78133L ].hh .v.RH = toDVI ( fromJIS ( 20283 ) ) ;
    eqtb [78134L ].hh .v.RH = toDVI ( fromJIS ( 15415 ) ) ;
    eqtb [78135L ].hh .v.RH = toDVI ( fromJIS ( 18476 ) ) ;
    eqtb [78136L ].hh .v.RH = toDVI ( fromJIS ( 13925 ) ) ;
    {register integer for_end; k = 65 ;for_end = 90 ; if ( k <= for_end) do 
      {
	eqtb [51759L + k ].hh .v.RH = 11 ;
	eqtb [51759L + k + 32 ].hh .v.RH = 11 ;
	eqtb [113849L + k ].hh .v.RH = k + 459008L ;
	eqtb [113849L + k + 32 ].hh .v.RH = k + 459040L ;
	eqtb [78137L + k ].hh .v.RH = k + 32 ;
	eqtb [78137L + k + 32 ].hh .v.RH = k + 32 ;
	eqtb [90041L + k ].hh .v.RH = k ;
	eqtb [90041L + k + 32 ].hh .v.RH = k ;
	eqtb [64175L + k ].hh .v.RH = 3 ;
	eqtb [64175L + k + 32 ].hh .v.RH = 3 ;
	eqtb [101945L + k ].hh .v.RH = 999 ;
      } 
    while ( k++ < for_end ) ;} 
    if ( ( isinternalUPTEX () ) ) 
    {
      eqtb [63663L ].hh .v.RH = 15 ;
      {register integer for_end; k = 2 ;for_end = 3 ; if ( k <= for_end) do 
	eqtb [63663L + k ].hh .v.RH = 15 ;
      while ( k++ < for_end ) ;} 
      eqtb [63700L ].hh .v.RH = 19 ;
      eqtb [63733L ].hh .v.RH = 15 ;
      {register integer for_end; k = 104 ;for_end = 105 ; if ( k <= for_end) 
      do 
	eqtb [63663L + k ].hh .v.RH = 16 ;
      while ( k++ < for_end ) ;} 
      {register integer for_end; k = 108 ;for_end = 109 ; if ( k <= for_end) 
      do 
	eqtb [63663L + k ].hh .v.RH = 17 ;
      while ( k++ < for_end ) ;} 
      eqtb [63773L ].hh .v.RH = 16 ;
      eqtb [63774L ].hh .v.RH = 19 ;
      {register integer for_end; k = 112 ;for_end = 114 ; if ( k <= for_end) 
      do 
	eqtb [63663L + k ].hh .v.RH = 16 ;
      while ( k++ < for_end ) ;} 
      eqtb [63778L ].hh .v.RH = 17 ;
      eqtb [63781L ].hh .v.RH = 16 ;
      eqtb [63783L ].hh .v.RH = 16 ;
      eqtb [63799L ].hh .v.RH = 19 ;
      eqtb [63810L ].hh .v.RH = 19 ;
      eqtb [63811L ].hh .v.RH = 19 ;
      eqtb [63816L ].hh .v.RH = 16 ;
      eqtb [63819L ].hh .v.RH = 20 ;
      {register integer for_end; k = 282 ;for_end = 285 ; if ( k <= for_end) 
      do 
	eqtb [63663L + k ].hh .v.RH = 17 ;
      while ( k++ < for_end ) ;} 
      {register integer for_end; k = 332 ;for_end = 342 ; if ( k <= for_end) 
      do 
	eqtb [63663L + k ].hh .v.RH = 16 ;
      while ( k++ < for_end ) ;} 
      eqtb [64017L ].hh .v.RH = 20 ;
      {register integer for_end; k = 505 ;for_end = 508 ; if ( k <= for_end) 
      do 
	eqtb [63663L + k ].hh .v.RH = 20 ;
      while ( k++ < for_end ) ;} 
      eqtb [64172L ].hh .v.RH = 15 ;
      eqtb [64173L ].hh .v.RH = 17 ;
      eqtb [64174L ].hh .v.RH = 17 ;
    } 
    else {
	
      eqtb [63696L ].hh .v.RH = 18 ;
      eqtb [63697L ].hh .v.RH = 18 ;
      {register integer for_end; k = 3 ;for_end = 6 ; if ( k <= for_end) do 
	eqtb [63695L + k ].hh .v.RH = 17 ;
      while ( k++ < for_end ) ;} 
      {register integer for_end; k = 7 ;for_end = 13 ; if ( k <= for_end) do 
	eqtb [63695L + k ].hh .v.RH = 18 ;
      while ( k++ < for_end ) ;} 
      {register integer for_end; k = 14 ;for_end = 120 ; if ( k <= for_end) 
      do 
	eqtb [63695L + k ].hh .v.RH = 16 ;
      while ( k++ < for_end ) ;} 
      {register integer for_end; k = 16 ;for_end = 94 ; if ( k <= for_end) 
      do 
	eqtb [63823L + k ].hh .v.RH = 16 ;
      while ( k++ < for_end ) ;} 
    } 
    {register integer for_end; k = 358 ;for_end = 361 ; if ( k <= for_end) 
    do 
      eqtb [63663L + k ].hh .v.RH = 16 ;
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 375 ;for_end = 376 ; if ( k <= for_end) 
    do 
      eqtb [63663L + k ].hh .v.RH = 17 ;
    while ( k++ < for_end ) ;} 
    eqtb [64043L ].hh .v.RH = 16 ;
    {register integer for_end; k = 382 ;for_end = 383 ; if ( k <= for_end) 
    do 
      eqtb [63663L + k ].hh .v.RH = 16 ;
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 114361L ;for_end = 114700L ; if ( k <= 
    for_end) do 
      eqtb [k ].cint = 0 ;
    while ( k++ < for_end ) ;} 
    eqtb [114423L ].cint = 256 ;
    eqtb [114424L ].cint = -1 ;
    eqtb [114378L ].cint = 1000 ;
    eqtb [114362L ].cint = 10000 ;
    eqtb [114402L ].cint = 1 ;
    eqtb [114401L ].cint = 25 ;
    eqtb [114407L ].cint = 92 ;
    eqtb [114410L ].cint = 13 ;
    {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
      {
	eqtb [114701L + k ].cint = -1 ;
	setintone ( eqtb [114701L + k ], -1 ) ;
      } 
    while ( k++ < for_end ) ;} 
    eqtb [114747L ].cint = 0 ;
    setintone ( eqtb [114747L ], 0 ) ;
    eqtb [114428L ].cint = -1 ;
    {register integer for_end; k = 114957L ;for_end = 116261L ; if ( k <= 
    for_end) do 
      eqtb [k ].cint = 0 ;
    while ( k++ < for_end ) ;} 
    hashused = 38810L ;
    hashhigh = 0 ;
    cscount = 0 ;
    eqtb [38819L ].hh.b0 = 134 ;
    primused = 2100 ;
    hash [38819L ].v.RH = 564 ;
    eqtb [38821L ].hh.b0 = 45 ;
    eqtb [38821L ].hh .v.RH = 1 ;
    eqtb [38821L ].hh.b1 = 1 ;
    hash [38821L ].v.RH = 565 ;
    eqtb [114418L ].cint = 1000 ;
    eqtb [114439L ].cint = 1 ;
    eqtb [114419L ].cint = 700 ;
    eqtb [114420L ].cint = 500 ;
    {register integer for_end; k = - (integer) trieopsize ;for_end = 
    trieopsize ; if ( k <= for_end) do 
      trieophash [k ]= 0 ;
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
      trieused [k ]= mintrieop ;
    while ( k++ < for_end ) ;} 
    maxopused = mintrieop ;
    trieopptr = 0 ;
    trienotready = true ;
    hash [38810L ].v.RH = 1396 ;
    if ( iniversion ) 
    formatident = 1471 ;
    hash [38818L ].v.RH = 1518 ;
    eqtb [38818L ].hh.b1 = 1 ;
    eqtb [38818L ].hh.b0 = 131 ;
    eqtb [38818L ].hh .v.RH = -1073741823L ;
    eTeXmode = 0 ;
    maxregnum = 255 ;
    maxreghelpline = 792 ;
    {register integer for_end; i = 0 ;for_end = 5 ; if ( i <= for_end) do 
      saroot [i ]= -1073741823L ;
    while ( i++ < for_end ) ;} 
  } 
#endif /* INITEX */
  synctexoffset = 114429L ;
} 
#ifdef INITEX
boolean 
getstringsstarted ( void ) 
{
  /* 30 10 */ register boolean Result; getstringsstarted_regmem 
  KANJIcode k, l  ;
  strnumber g  ;
  poolptr = 0 ;
  strptr = 0 ;
  strstart [0 ]= 0 ;
  {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
    {
      if ( ( ( k < 32 ) || ( k > 126 ) ) ) 
      {
	{
	  strpool [poolptr ]= 94 ;
	  incr ( poolptr ) ;
	} 
	{
	  strpool [poolptr ]= 94 ;
	  incr ( poolptr ) ;
	} 
	if ( k < 64 ) 
	{
	  strpool [poolptr ]= k + 64 ;
	  incr ( poolptr ) ;
	} 
	else if ( k < 128 ) 
	{
	  strpool [poolptr ]= k - 64 ;
	  incr ( poolptr ) ;
	} 
	else {
	    
	  l = k / 16 ;
	  if ( l < 10 ) 
	  {
	    strpool [poolptr ]= l + 48 ;
	    incr ( poolptr ) ;
	  } 
	  else {
	      
	    strpool [poolptr ]= l + 87 ;
	    incr ( poolptr ) ;
	  } 
	  l = k % 16 ;
	  if ( l < 10 ) 
	  {
	    strpool [poolptr ]= l + 48 ;
	    incr ( poolptr ) ;
	  } 
	  else {
	      
	    strpool [poolptr ]= l + 87 ;
	    incr ( poolptr ) ;
	  } 
	} 
      } 
      else {
	  
	strpool [poolptr ]= k ;
	incr ( poolptr ) ;
      } 
      g = makestring () ;
    } 
  while ( k++ < for_end ) ;} 
  g = loadpoolstrings ( ( poolsize - stringvacancies ) ) ;
  if ( g == 0 ) 
  {
    ;
    fprintf ( stdout , "%s\n",  "! You have to increase POOLSIZE." ) ;
    Result = false ;
    return Result ;
  } 
  Result = true ;
  return Result ;
} 
#endif /* INITEX */
#ifdef INITEX
void 
sortavail ( void ) 
{
  sortavail_regmem 
  halfword p, q, r  ;
  halfword oldrover  ;
  p = getnode ( 1073741824L ) ;
  p = mem [rover + 1 ].hh .v.RH ;
  mem [rover + 1 ].hh .v.RH = 1073741823L ;
  oldrover = rover ;
  while ( p != oldrover ) if ( p < rover ) 
  {
    q = p ;
    p = mem [q + 1 ].hh .v.RH ;
    mem [q + 1 ].hh .v.RH = rover ;
    rover = q ;
  } 
  else {
      
    q = rover ;
    while ( mem [q + 1 ].hh .v.RH < p ) q = mem [q + 1 ].hh .v.RH ;
    r = mem [p + 1 ].hh .v.RH ;
    mem [p + 1 ].hh .v.RH = mem [q + 1 ].hh .v.RH ;
    mem [q + 1 ].hh .v.RH = p ;
    p = r ;
  } 
  p = rover ;
  while ( mem [p + 1 ].hh .v.RH != 1073741823L ) {
      
    mem [mem [p + 1 ].hh .v.RH + 1 ].hh .v.LH = p ;
    p = mem [p + 1 ].hh .v.RH ;
  } 
  mem [p + 1 ].hh .v.RH = rover ;
  mem [rover + 1 ].hh .v.LH = p ;
} 
#endif /* INITEX */
#ifdef INITEX
void 
zprimitive ( strnumber s , quarterword c , halfword o ) 
{
  primitive_regmem 
  poolpointer k  ;
  integer primval  ;
  integer j  ;
  smallnumber l  ;
  if ( s < 256 ) 
  {
    curval = s + 11905 ;
    primval = primlookup ( s ) ;
  } 
  else {
      
    k = strstart [s ];
    l = strstart [s + 1 ]- k ;
    if ( first + l > bufsize + 1 ) 
    overflow ( 259 , bufsize ) ;
    {register integer for_end; j = 0 ;for_end = l - 1 ; if ( j <= for_end) 
    do 
      {
	buffer [first + j ]= Lo ( strpool [k + j ]) ;
	buffer2 [first + j ]= Hi ( strpool [k + j ]) ;
      } 
    while ( j++ < for_end ) ;} 
    curval = idlookup ( first , l ) ;
    {
      decr ( strptr ) ;
      poolptr = strstart [strptr ];
    } 
    hash [curval ].v.RH = s ;
    primval = primlookup ( s ) ;
  } 
  eqtb [curval ].hh.b1 = 1 ;
  eqtb [curval ].hh.b0 = c ;
  eqtb [curval ].hh .v.RH = o ;
  eqtb [38822L + primval ].hh.b1 = 1 ;
  eqtb [38822L + primval ].hh.b0 = c ;
  eqtb [38822L + primval ].hh .v.RH = o ;
} 
#endif /* INITEX */
#ifdef INITEX
trieopcode 
znewtrieop ( smallnumber d , smallnumber n , trieopcode v ) 
{
  /* 10 */ register trieopcode Result; newtrieop_regmem 
  integer h  ;
  trieopcode u  ;
  integer l  ;
  h = abs ( n + 313 * d + 361 * v + 1009 * curlang ) % ( trieopsize - 
  negtrieopsize ) + negtrieopsize ;
  while ( true ) {
      
    l = trieophash [h ];
    if ( l == 0 ) 
    {
      if ( trieopptr == trieopsize ) 
      overflow ( 1118 , trieopsize ) ;
      u = trieused [curlang ];
      if ( u == maxtrieop ) 
      overflow ( 1119 , maxtrieop - mintrieop ) ;
      incr ( trieopptr ) ;
      incr ( u ) ;
      trieused [curlang ]= u ;
      if ( u > maxopused ) 
      maxopused = u ;
      hyfdistance [trieopptr ]= d ;
      hyfnum [trieopptr ]= n ;
      hyfnext [trieopptr ]= v ;
      trieoplang [trieopptr ]= curlang ;
      trieophash [h ]= trieopptr ;
      trieopval [trieopptr ]= u ;
      Result = u ;
      return Result ;
    } 
    if ( ( hyfdistance [l ]== d ) && ( hyfnum [l ]== n ) && ( hyfnext [l 
    ]== v ) && ( trieoplang [l ]== curlang ) ) 
    {
      Result = trieopval [l ];
      return Result ;
    } 
    if ( h > - (integer) trieopsize ) 
    decr ( h ) ;
    else h = trieopsize ;
  } 
  return Result ;
} 
triepointer 
ztrienode ( triepointer p ) 
{
  /* 10 */ register triepointer Result; trienode_regmem 
  triepointer h  ;
  triepointer q  ;
  h = abs ( triec [p ]+ 1009 * trieo [p ]+ 2718 * triel [p ]+ 3142 * 
  trier [p ]) % triesize ;
  while ( true ) {
      
    q = triehash [h ];
    if ( q == 0 ) 
    {
      triehash [h ]= p ;
      Result = p ;
      return Result ;
    } 
    if ( ( triec [q ]== triec [p ]) && ( trieo [q ]== trieo [p ]) && ( 
    triel [q ]== triel [p ]) && ( trier [q ]== trier [p ]) ) 
    {
      Result = q ;
      return Result ;
    } 
    if ( h > 0 ) 
    decr ( h ) ;
    else h = triesize ;
  } 
  return Result ;
} 
triepointer 
zcompresstrie ( triepointer p ) 
{
  register triepointer Result; compresstrie_regmem 
  if ( p == 0 ) 
  Result = 0 ;
  else {
      
    triel [p ]= compresstrie ( triel [p ]) ;
    trier [p ]= compresstrie ( trier [p ]) ;
    Result = trienode ( p ) ;
  } 
  return Result ;
} 
void 
zfirstfit ( triepointer p ) 
{
  /* 45 40 */ firstfit_regmem 
  triepointer h  ;
  triepointer z  ;
  triepointer q  ;
  ASCIIcode c  ;
  triepointer l, r  ;
  short ll  ;
  c = triec [p ];
  z = triemin [c ];
  while ( true ) {
      
    h = z - c ;
    if ( triemax < h + maxhyphchar ) 
    {
      if ( triesize <= h + maxhyphchar ) 
      overflow ( 1120 , triesize ) ;
      do {
	  incr ( triemax ) ;
	trietaken [triemax ]= false ;
	trietrl [triemax ]= triemax + 1 ;
	trietro [triemax ]= triemax - 1 ;
      } while ( ! ( triemax == h + maxhyphchar ) ) ;
    } 
    if ( trietaken [h ]) 
    goto lab45 ;
    q = trier [p ];
    while ( q > 0 ) {
	
      if ( trietrl [h + triec [q ]]== 0 ) 
      goto lab45 ;
      q = trier [q ];
    } 
    goto lab40 ;
    lab45: z = trietrl [z ];
  } 
  lab40: trietaken [h ]= true ;
  triehash [p ]= h ;
  q = p ;
  do {
      z = h + triec [q ];
    l = trietro [z ];
    r = trietrl [z ];
    trietro [r ]= l ;
    trietrl [l ]= r ;
    trietrl [z ]= 0 ;
    if ( l < maxhyphchar ) 
    {
      if ( z < maxhyphchar ) 
      ll = z ;
      else ll = maxhyphchar ;
      do {
	  triemin [l ]= r ;
	incr ( l ) ;
      } while ( ! ( l == ll ) ) ;
    } 
    q = trier [q ];
  } while ( ! ( q == 0 ) ) ;
} 
void 
ztriepack ( triepointer p ) 
{
  triepack_regmem 
  triepointer q  ;
  do {
      q = triel [p ];
    if ( ( q > 0 ) && ( triehash [q ]== 0 ) ) 
    {
      firstfit ( q ) ;
      triepack ( q ) ;
    } 
    p = trier [p ];
  } while ( ! ( p == 0 ) ) ;
} 
void 
ztriefix ( triepointer p ) 
{
  triefix_regmem 
  triepointer q  ;
  ASCIIcode c  ;
  triepointer z  ;
  z = triehash [p ];
  do {
      q = triel [p ];
    c = triec [p ];
    trietrl [z + c ]= triehash [q ];
    trietrc [z + c ]= c ;
    trietro [z + c ]= trieo [p ];
    if ( q > 0 ) 
    triefix ( q ) ;
    p = trier [p ];
  } while ( ! ( p == 0 ) ) ;
} 
void 
newpatterns ( void ) 
{
  /* 30 31 */ newpatterns_regmem 
  unsigned char k, l  ;
  boolean digitsensed  ;
  trieopcode v  ;
  triepointer p, q  ;
  boolean firstchild  ;
  ASCIIcode c  ;
  if ( trienotready ) 
  {
    if ( eqtb [114412L ].cint <= 0 ) 
    curlang = 0 ;
    else if ( eqtb [114412L ].cint > 255 ) 
    curlang = 0 ;
    else curlang = eqtb [114412L ].cint ;
    scanleftbrace () ;
    k = 0 ;
    hyf [0 ]= 0 ;
    digitsensed = false ;
    while ( true ) {
	
      getxtoken () ;
      switch ( curcmd ) 
      {case 11 : 
      case 12 : 
	if ( digitsensed || ( curchr < 48 ) || ( curchr > 57 ) ) 
	{
	  if ( curchr == 46 ) 
	  curchr = 0 ;
	  else {
	      
	    curchr = eqtb [78137L + curchr ].hh .v.RH ;
	    if ( curchr == 0 ) 
	    {
	      {
		if ( interaction == 3 ) 
		;
		if ( filelineerrorstylep ) 
		printfileline () ;
		else printnl ( 265 ) ;
		print ( 1126 ) ;
	      } 
	      {
		helpptr = 1 ;
		helpline [0 ]= 1125 ;
	      } 
	      error () ;
	    } 
	  } 
	  if ( curchr > maxhyphchar ) 
	  maxhyphchar = curchr ;
	  if ( k < 63 ) 
	  {
	    incr ( k ) ;
	    hc [k ]= curchr ;
	    hyf [k ]= 0 ;
	    digitsensed = false ;
	  } 
	} 
	else if ( k < 63 ) 
	{
	  hyf [k ]= curchr - 48 ;
	  digitsensed = true ;
	} 
	break ;
      case 10 : 
      case 2 : 
	{
	  if ( k > 0 ) 
	  {
	    if ( hc [1 ]== 0 ) 
	    hyf [0 ]= 0 ;
	    if ( hc [k ]== 0 ) 
	    hyf [k ]= 0 ;
	    l = k ;
	    v = mintrieop ;
	    while ( true ) {
		
	      if ( hyf [l ]!= 0 ) 
	      v = newtrieop ( k - l , hyf [l ], v ) ;
	      if ( l > 0 ) 
	      decr ( l ) ;
	      else goto lab31 ;
	    } 
	    lab31: ;
	    q = 0 ;
	    hc [0 ]= curlang ;
	    while ( l <= k ) {
		
	      c = hc [l ];
	      incr ( l ) ;
	      p = triel [q ];
	      firstchild = true ;
	      while ( ( p > 0 ) && ( c > triec [p ]) ) {
		  
		q = p ;
		p = trier [q ];
		firstchild = false ;
	      } 
	      if ( ( p == 0 ) || ( c < triec [p ]) ) 
	      {
		if ( trieptr == triesize ) 
		overflow ( 1120 , triesize ) ;
		incr ( trieptr ) ;
		trier [trieptr ]= p ;
		p = trieptr ;
		triel [p ]= 0 ;
		if ( firstchild ) 
		triel [q ]= p ;
		else trier [q ]= p ;
		triec [p ]= c ;
		trieo [p ]= mintrieop ;
	      } 
	      q = p ;
	    } 
	    if ( trieo [q ]!= mintrieop ) 
	    {
	      {
		if ( interaction == 3 ) 
		;
		if ( filelineerrorstylep ) 
		printfileline () ;
		else printnl ( 265 ) ;
		print ( 1127 ) ;
	      } 
	      {
		helpptr = 1 ;
		helpline [0 ]= 1125 ;
	      } 
	      error () ;
	    } 
	    trieo [q ]= v ;
	  } 
	  if ( curcmd == 2 ) 
	  goto lab30 ;
	  k = 0 ;
	  hyf [0 ]= 0 ;
	  digitsensed = false ;
	} 
	break ;
	default: 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1124 ) ;
	  } 
	  printesc ( 1122 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 1125 ;
	  } 
	  error () ;
	} 
	break ;
      } 
    } 
    lab30: ;
    if ( eqtb [114438L ].cint > 0 ) 
    {
      c = curlang ;
      firstchild = false ;
      p = 0 ;
      do {
	  q = p ;
	p = trier [q ];
      } while ( ! ( ( p == 0 ) || ( c <= triec [p ]) ) ) ;
      if ( ( p == 0 ) || ( c < triec [p ]) ) 
      {
	if ( trieptr == triesize ) 
	overflow ( 1120 , triesize ) ;
	incr ( trieptr ) ;
	trier [trieptr ]= p ;
	p = trieptr ;
	triel [p ]= 0 ;
	if ( firstchild ) 
	triel [q ]= p ;
	else trier [q ]= p ;
	triec [p ]= c ;
	trieo [p ]= mintrieop ;
      } 
      q = p ;
      p = triel [q ];
      firstchild = true ;
      {register integer for_end; c = 0 ;for_end = 255 ; if ( c <= for_end) 
      do 
	if ( ( eqtb [78137L + c ].hh .v.RH > 0 ) || ( ( c == 255 ) && 
	firstchild ) ) 
	{
	  if ( p == 0 ) 
	  {
	    if ( trieptr == triesize ) 
	    overflow ( 1120 , triesize ) ;
	    incr ( trieptr ) ;
	    trier [trieptr ]= p ;
	    p = trieptr ;
	    triel [p ]= 0 ;
	    if ( firstchild ) 
	    triel [q ]= p ;
	    else trier [q ]= p ;
	    triec [p ]= c ;
	    trieo [p ]= mintrieop ;
	  } 
	  else triec [p ]= c ;
	  trieo [p ]= eqtb [78137L + c ].hh .v.RH ;
	  q = p ;
	  p = trier [q ];
	  firstchild = false ;
	} 
      while ( c++ < for_end ) ;} 
      if ( firstchild ) 
      triel [q ]= 0 ;
      else trier [q ]= 0 ;
    } 
  } 
  else {
      
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1121 ) ;
    } 
    printesc ( 1122 ) ;
    {
      helpptr = 1 ;
      helpline [0 ]= 1123 ;
    } 
    error () ;
    mem [memtop - 12 ].hh .v.RH = scantoks ( false , false ) ;
    flushlist ( defref ) ;
  } 
} 
void 
inittrie ( void ) 
{
  inittrie_regmem 
  triepointer p  ;
  integer j, k, t  ;
  triepointer r, s  ;
  incr ( maxhyphchar ) ;
  opstart [0 ]= - (integer) mintrieop ;
  {register integer for_end; j = 1 ;for_end = 255 ; if ( j <= for_end) do 
    opstart [j ]= opstart [j - 1 ]+ trieused [j - 1 ];
  while ( j++ < for_end ) ;} 
  {register integer for_end; j = 1 ;for_end = trieopptr ; if ( j <= for_end) 
  do 
    trieophash [j ]= opstart [trieoplang [j ]]+ trieopval [j ];
  while ( j++ < for_end ) ;} 
  {register integer for_end; j = 1 ;for_end = trieopptr ; if ( j <= for_end) 
  do 
    while ( trieophash [j ]> j ) {
	
      k = trieophash [j ];
      t = hyfdistance [k ];
      hyfdistance [k ]= hyfdistance [j ];
      hyfdistance [j ]= t ;
      t = hyfnum [k ];
      hyfnum [k ]= hyfnum [j ];
      hyfnum [j ]= t ;
      t = hyfnext [k ];
      hyfnext [k ]= hyfnext [j ];
      hyfnext [j ]= t ;
      trieophash [j ]= trieophash [k ];
      trieophash [k ]= k ;
    } 
  while ( j++ < for_end ) ;} 
  {register integer for_end; p = 0 ;for_end = triesize ; if ( p <= for_end) 
  do 
    triehash [p ]= 0 ;
  while ( p++ < for_end ) ;} 
  trier [0 ]= compresstrie ( trier [0 ]) ;
  triel [0 ]= compresstrie ( triel [0 ]) ;
  {register integer for_end; p = 0 ;for_end = trieptr ; if ( p <= for_end) 
  do 
    triehash [p ]= 0 ;
  while ( p++ < for_end ) ;} 
  {register integer for_end; p = 0 ;for_end = 11903 ; if ( p <= for_end) do 
    triemin [p ]= p + 1 ;
  while ( p++ < for_end ) ;} 
  trietrl [0 ]= 1 ;
  triemax = 0 ;
  if ( triel [0 ]!= 0 ) 
  {
    firstfit ( triel [0 ]) ;
    triepack ( triel [0 ]) ;
  } 
  if ( trier [0 ]!= 0 ) 
  {
    if ( triel [0 ]== 0 ) 
    {register integer for_end; p = 0 ;for_end = 255 ; if ( p <= for_end) do 
      triemin [p ]= p + 2 ;
    while ( p++ < for_end ) ;} 
    firstfit ( trier [0 ]) ;
    triepack ( trier [0 ]) ;
    hyphstart = triehash [trier [0 ]];
  } 
  if ( triemax == 0 ) 
  {
    {register integer for_end; r = 0 ;for_end = maxhyphchar ; if ( r <= 
    for_end) do 
      {
	trietrl [r ]= 0 ;
	trietro [r ]= mintrieop ;
	trietrc [r ]= 0 ;
      } 
    while ( r++ < for_end ) ;} 
    triemax = maxhyphchar ;
  } 
  else {
      
    if ( trier [0 ]> 0 ) 
    triefix ( trier [0 ]) ;
    if ( triel [0 ]> 0 ) 
    triefix ( triel [0 ]) ;
    r = 0 ;
    do {
	s = trietrl [r ];
      {
	trietrl [r ]= 0 ;
	trietro [r ]= mintrieop ;
	trietrc [r ]= 0 ;
      } 
      r = s ;
    } while ( ! ( r > triemax ) ) ;
  } 
  trietrc [0 ]= 63 ;
  trienotready = false ;
} 
#endif /* INITEX */
void 
zlinebreak ( boolean d ) 
{
  /* 30 31 32 33 34 35 22 */ linebreak_regmem 
  boolean autobreaking  ;
  halfword prevp  ;
  halfword q, r, s, prevs  ;
  internalfontnumber f, postf  ;
  halfword postp  ;
  sixteenbits cc  ;
  boolean firstuse  ;
  smallnumber j  ;
  sixteenbits c  ;
  packbeginline = curlist .mlfield ;
  firstuse = true ;
  chain = false ;
  deleteglueref ( curkanjiskip ) ;
  deleteglueref ( curxkanjiskip ) ;
  curkanjiskip = mem [curlist .headfield + 7 ].hh .v.RH ;
  curxkanjiskip = mem [curlist .headfield + 7 ].hh .v.LH ;
  incr ( mem [curkanjiskip ].hh .v.RH ) ;
  incr ( mem [curxkanjiskip ].hh .v.RH ) ;
  if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
  .hh.b0 == 5 ) ) 
  {
    freenode ( curlist .tailfield , 2 ) ;
    curlist .tailfield = curlist .pnodefield ;
    mem [curlist .tailfield ].hh .v.RH = -1073741823L ;
  } 
  mem [memtop - 3 ].hh .v.RH = mem [curlist .headfield ].hh .v.RH ;
  if ( ( curlist .tailfield >= himemmin ) ) 
  {
    mem [curlist .tailfield ].hh .v.RH = newpenalty ( 10000 ) ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  else if ( mem [curlist .tailfield ].hh.b0 != 12 ) 
  {
    mem [curlist .tailfield ].hh .v.RH = newpenalty ( 10000 ) ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  else {
      
    mem [curlist .tailfield ].hh.b0 = 14 ;
    deleteglueref ( mem [curlist .tailfield + 1 ].hh .v.LH ) ;
    flushnodelist ( mem [curlist .tailfield + 1 ].hh .v.RH ) ;
    mem [curlist .tailfield + 1 ].cint = 10000 ;
  } 
  mem [curlist .tailfield ].hh .v.RH = newparamglue ( 14 ) ;
  lastlinefill = mem [curlist .tailfield ].hh .v.RH ;
  initcurlang = curlist .pgfield % 65536L ;
  initlhyf = curlist .pgfield / 4194304L ;
  initrhyf = ( curlist .pgfield / 65536L ) % 64 ;
  popnest () ;
  noshrinkerroryet = true ;
  if ( ( mem [eqtb [49932L ].hh .v.RH ].hh.b1 != 0 ) && ( mem [eqtb [
  49932L ].hh .v.RH + 3 ].cint != 0 ) ) 
  {
    eqtb [49932L ].hh .v.RH = finiteshrink ( eqtb [49932L ].hh .v.RH ) ;
  } 
  if ( ( mem [eqtb [49933L ].hh .v.RH ].hh.b1 != 0 ) && ( mem [eqtb [
  49933L ].hh .v.RH + 3 ].cint != 0 ) ) 
  {
    eqtb [49933L ].hh .v.RH = finiteshrink ( eqtb [49933L ].hh .v.RH ) ;
  } 
  q = eqtb [49932L ].hh .v.RH ;
  r = eqtb [49933L ].hh .v.RH ;
  background [1 ]= mem [q + 1 ].cint + mem [r + 1 ].cint ;
  background [2 ]= 0 ;
  background [3 ]= 0 ;
  background [4 ]= 0 ;
  background [5 ]= 0 ;
  background [6 ]= 0 ;
  background [2 + mem [q ].hh.b0 ]= mem [q + 2 ].cint ;
  background [2 + mem [r ].hh.b0 ]= background [2 + mem [r ].hh.b0 ]+ 
  mem [r + 2 ].cint ;
  background [7 ]= mem [q + 3 ].cint + mem [r + 3 ].cint ;
  dolastlinefit = false ;
  activenodesize = 3 ;
  if ( eqtb [114436L ].cint > 0 ) 
  {
    q = mem [lastlinefill + 1 ].hh .v.LH ;
    if ( ( mem [q + 2 ].cint > 0 ) && ( mem [q ].hh.b0 > 0 ) ) {
	
      if ( ( background [3 ]== 0 ) && ( background [4 ]== 0 ) && ( 
      background [5 ]== 0 ) && ( background [6 ]== 0 ) ) 
      {
	dolastlinefit = true ;
	activenodesize = 5 ;
	fillwidth [0 ]= 0 ;
	fillwidth [1 ]= 0 ;
	fillwidth [2 ]= 0 ;
	fillwidth [3 ]= 0 ;
	fillwidth [mem [q ].hh.b0 - 1 ]= mem [q + 2 ].cint ;
      } 
    } 
  } 
  minimumdemerits = 1073741823L ;
  minimaldemerits [3 ]= 1073741823L ;
  minimaldemerits [2 ]= 1073741823L ;
  minimaldemerits [1 ]= 1073741823L ;
  minimaldemerits [0 ]= 1073741823L ;
  if ( eqtb [50458L ].hh .v.RH == -1073741823L ) {
      
    if ( eqtb [114974L ].cint == 0 ) 
    {
      lastspecialline = 0 ;
      secondwidth = eqtb [114960L ].cint ;
      secondindent = 0 ;
    } 
    else {
	
      lastspecialline = abs ( eqtb [114402L ].cint ) ;
      if ( eqtb [114402L ].cint < 0 ) 
      {
	firstwidth = eqtb [114960L ].cint - abs ( eqtb [114974L ].cint ) ;
	if ( eqtb [114974L ].cint >= 0 ) 
	firstindent = eqtb [114974L ].cint ;
	else firstindent = 0 ;
	secondwidth = eqtb [114960L ].cint ;
	secondindent = 0 ;
      } 
      else {
	  
	firstwidth = eqtb [114960L ].cint ;
	firstindent = 0 ;
	secondwidth = eqtb [114960L ].cint - abs ( eqtb [114974L ].cint ) 
	;
	if ( eqtb [114974L ].cint >= 0 ) 
	secondindent = eqtb [114974L ].cint ;
	else secondindent = 0 ;
      } 
    } 
  } 
  else {
      
    lastspecialline = mem [eqtb [50458L ].hh .v.RH ].hh .v.LH - 1 ;
    secondwidth = mem [eqtb [50458L ].hh .v.RH + 2 * ( lastspecialline + 1 
    ) ].cint ;
    secondindent = mem [eqtb [50458L ].hh .v.RH + 2 * lastspecialline + 1 ]
    .cint ;
  } 
  if ( eqtb [114380L ].cint == 0 ) 
  easyline = lastspecialline ;
  else easyline = 1073741823L ;
  threshold = eqtb [114361L ].cint ;
  if ( threshold >= 0 ) 
  {
	;
#ifdef STAT
    if ( eqtb [114393L ].cint > 0 ) 
    {
      begindiagnostic () ;
      printnl ( 1102 ) ;
    } 
#endif /* STAT */
    secondpass = false ;
    finalpass = false ;
  } 
  else {
      
    threshold = eqtb [114362L ].cint ;
    secondpass = true ;
    finalpass = ( eqtb [114977L ].cint <= 0 ) ;
	;
#ifdef STAT
    if ( eqtb [114393L ].cint > 0 ) 
    begindiagnostic () ;
#endif /* STAT */
  } 
  while ( true ) {
      
    if ( threshold > 10000 ) 
    threshold = 10000 ;
    if ( secondpass ) 
    {
	;
#ifdef INITEX
      if ( trienotready ) 
      inittrie () ;
#endif /* INITEX */
      curlang = initcurlang ;
      lhyf = initlhyf ;
      rhyf = initrhyf ;
      if ( trietrc [hyphstart + curlang ]!= curlang ) 
      hyphindex = 0 ;
      else hyphindex = trietrl [hyphstart + curlang ];
    } 
    q = getnode ( activenodesize ) ;
    mem [q ].hh.b0 = 0 ;
    mem [q ].hh.b1 = 2 ;
    mem [q ].hh .v.RH = memtop - 7 ;
    mem [q + 1 ].hh .v.RH = -1073741823L ;
    mem [q + 1 ].hh .v.LH = curlist .pgfield + 1 ;
    mem [q + 2 ].cint = 0 ;
    mem [memtop - 7 ].hh .v.RH = q ;
    if ( dolastlinefit ) 
    {
      mem [q + 3 ].cint = 0 ;
      mem [q + 4 ].cint = 0 ;
    } 
    activewidth [1 ]= background [1 ];
    activewidth [2 ]= background [2 ];
    activewidth [3 ]= background [3 ];
    activewidth [4 ]= background [4 ];
    activewidth [5 ]= background [5 ];
    activewidth [6 ]= background [6 ];
    activewidth [7 ]= background [7 ];
    passive = -1073741823L ;
    printednode = memtop - 3 ;
    passnumber = 0 ;
    fontinshortdisplay = 0 ;
    curp = mem [memtop - 3 ].hh .v.RH ;
    autobreaking = true ;
    prevp = curp ;
    while ( ( curp != -1073741823L ) && ( mem [memtop - 7 ].hh .v.RH != 
    memtop - 7 ) ) {
	
      if ( ( curp >= himemmin ) ) 
      {
	chain = false ;
	if ( ( curp >= himemmin ) ) {
	    
	  if ( fontdir [mem [curp ].hh.b0 ]!= 0 ) 
	  {
	    switch ( mem [prevp ].hh.b0 ) 
	    {case 0 : 
	    case 1 : 
	    case 2 : 
	    case 3 : 
	    case 8 : 
	    case 9 : 
	    case 11 : 
	      {
		curp = prevp ;
		trybreak ( 0 , 0 ) ;
		curp = mem [curp ].hh .v.RH ;
	      } 
	      break ;
	      default: 
	      ;
	      break ;
	    } 
	  } 
	} 
	prevp = curp ;
	postp = curp ;
	postf = mem [postp ].hh.b0 ;
	do {
	    f = postf ;
	  cc = ptencucsto8bitcode ( fontenc [f ], mem [curp ].hh.b1 ) ;
	  activewidth [1 ]= activewidth [1 ]+ fontinfo [widthbase [f ]+ 
	  fontinfo [charbase [f ]+ cc ].qqqq .b0 ].cint ;
	  postp = mem [curp ].hh .v.RH ;
	  if ( fontdir [f ]!= 0 ) 
	  {
	    prevp = curp ;
	    curp = postp ;
	    postp = mem [postp ].hh .v.RH ;
	    if ( ( postp >= himemmin ) ) 
	    {
	      postf = mem [postp ].hh.b0 ;
	      if ( fontdir [postf ]!= 0 ) 
	      chain = true ;
	      else chain = false ;
	      trybreak ( 0 , 0 ) ;
	    } 
	    else {
		
	      chain = false ;
	      switch ( mem [postp ].hh.b0 ) 
	      {case 0 : 
	      case 1 : 
	      case 2 : 
	      case 3 : 
	      case 8 : 
	      case 9 : 
	      case 11 : 
		trybreak ( 0 , 0 ) ;
		break ;
		default: 
		;
		break ;
	      } 
	    } 
	    if ( chain ) 
	    {
	      if ( firstuse ) 
	      {
		if ( ( mem [curkanjiskip ].hh.b1 != 0 ) && ( mem [
		curkanjiskip + 3 ].cint != 0 ) ) 
		{
		  curkanjiskip = finiteshrink ( curkanjiskip ) ;
		} 
		firstuse = false ;
	      } 
	      activewidth [1 ]= activewidth [1 ]+ mem [curkanjiskip + 1 ]
	      .cint ;
	      activewidth [2 + mem [curkanjiskip ].hh.b0 ]= activewidth [
	      2 + mem [curkanjiskip ].hh.b0 ]+ mem [curkanjiskip + 2 ]
	      .cint ;
	      activewidth [7 ]= activewidth [7 ]+ mem [curkanjiskip + 3 ]
	      .cint ;
	    } 
	    prevp = curp ;
	  } 
	  else if ( ( postp >= himemmin ) ) 
	  {
	    postf = mem [postp ].hh.b0 ;
	    chain = false ;
	    if ( fontdir [postf ]!= 0 ) 
	    trybreak ( 0 , 0 ) ;
	  } 
	  curp = postp ;
	} while ( ! ( ! ( curp >= himemmin ) ) ) ;
	chain = false ;
      } 
      switch ( mem [curp ].hh.b0 ) 
      {case 0 : 
      case 1 : 
      case 2 : 
      case 3 : 
	activewidth [1 ]= activewidth [1 ]+ mem [curp + 1 ].cint ;
	break ;
      case 10 : 
	if ( mem [curp ].hh.b1 == 5 ) 
	{
	  curlang = mem [curp + 1 ].hh .v.RH ;
	  lhyf = mem [curp + 1 ].hh.b0 ;
	  rhyf = mem [curp + 1 ].hh.b1 ;
	  if ( trietrc [hyphstart + curlang ]!= curlang ) 
	  hyphindex = 0 ;
	  else hyphindex = trietrl [hyphstart + curlang ];
	} 
	break ;
      case 12 : 
	{
	  if ( autobreaking ) 
	  {
	    if ( ( prevp >= himemmin ) ) 
	    trybreak ( 0 , 0 ) ;
	    else if ( ( mem [prevp ].hh.b0 < 11 ) ) 
	    trybreak ( 0 , 0 ) ;
	    else if ( mem [prevp ].hh.b0 == 13 ) {
		
	      if ( ( mem [prevp ].hh.b1 != 1 ) && ( mem [prevp ].hh.b1 != 
	      3 ) ) 
	      trybreak ( 0 , 0 ) ;
	    } 
	  } 
	  if ( ( mem [mem [curp + 1 ].hh .v.LH ].hh.b1 != 0 ) && ( mem [
	  mem [curp + 1 ].hh .v.LH + 3 ].cint != 0 ) ) 
	  {
	    mem [curp + 1 ].hh .v.LH = finiteshrink ( mem [curp + 1 ].hh 
	    .v.LH ) ;
	  } 
	  q = mem [curp + 1 ].hh .v.LH ;
	  activewidth [1 ]= activewidth [1 ]+ mem [q + 1 ].cint ;
	  activewidth [2 + mem [q ].hh.b0 ]= activewidth [2 + mem [q ]
	  .hh.b0 ]+ mem [q + 2 ].cint ;
	  activewidth [7 ]= activewidth [7 ]+ mem [q + 3 ].cint ;
	  if ( secondpass && autobreaking ) 
	  {
	    prevs = curp ;
	    s = mem [prevs ].hh .v.RH ;
	    if ( s != -1073741823L ) 
	    {
	      while ( true ) {
		  
		if ( ( s >= himemmin ) ) 
		{
		  hf = mem [s ].hh.b0 ;
		  if ( fontdir [hf ]!= 0 ) 
		  {
		    prevs = s ;
		    s = mem [prevs ].hh .v.RH ;
		    c = mem [s ].hh .v.LH ;
		    goto lab22 ;
		  } 
		  else c = mem [s ].hh.b1 ;
		} 
		else if ( mem [s ].hh.b0 == 5 ) 
		goto lab22 ;
		else if ( ( mem [s ].hh.b0 == 14 ) && ( mem [s ].hh.b1 != 
		0 ) ) 
		goto lab22 ;
		else if ( mem [s ].hh.b0 == 8 ) {
		    
		  if ( mem [s + 1 ].hh .v.RH == -1073741823L ) 
		  goto lab22 ;
		  else {
		      
		    q = mem [s + 1 ].hh .v.RH ;
		    c = mem [q ].hh.b1 ;
		    hf = mem [q ].hh.b0 ;
		  } 
		} 
		else if ( ( mem [s ].hh.b0 == 13 ) && ( mem [s ].hh.b1 == 
		0 ) ) 
		goto lab22 ;
		else if ( ( mem [s ].hh.b0 == 11 ) && ( mem [s ].hh.b1 >= 
		4 ) ) 
		goto lab22 ;
		else if ( mem [s ].hh.b0 == 10 ) 
		{
		  if ( mem [s ].hh.b1 == 5 ) 
		  {
		    curlang = mem [s + 1 ].hh .v.RH ;
		    lhyf = mem [s + 1 ].hh.b0 ;
		    rhyf = mem [s + 1 ].hh.b1 ;
		    if ( trietrc [hyphstart + curlang ]!= curlang ) 
		    hyphindex = 0 ;
		    else hyphindex = trietrl [hyphstart + curlang ];
		  } 
		  goto lab22 ;
		} 
		else goto lab31 ;
		if ( hyphindex == 0 ) 
		hc [0 ]= eqtb [78137L + c ].hh .v.RH ;
		else if ( trietrc [hyphindex + c ]!= c ) 
		hc [0 ]= 0 ;
		else hc [0 ]= trietro [hyphindex + c ];
		if ( hc [0 ]!= 0 ) {
		    
		  if ( ( hc [0 ]== c ) || ( eqtb [114399L ].cint > 0 ) ) 
		  goto lab32 ;
		  else goto lab31 ;
		} 
		lab22: prevs = s ;
		s = mem [prevs ].hh .v.RH ;
	      } 
	      lab32: hyfchar = hyphenchar [hf ];
	      if ( hyfchar < 0 ) 
	      goto lab31 ;
	      if ( hyfchar >= 11904 ) 
	      goto lab31 ;
	      ha = prevs ;
	      if ( lhyf + rhyf > 63 ) 
	      goto lab31 ;
	      hn = 0 ;
	      while ( true ) {
		  
		if ( ( s >= himemmin ) ) 
		{
		  if ( mem [s ].hh.b0 != hf ) 
		  goto lab33 ;
		  hyfbchar = mem [s ].hh.b1 ;
		  c = hyfbchar ;
		  if ( hyphindex == 0 ) 
		  hc [0 ]= eqtb [78137L + c ].hh .v.RH ;
		  else if ( trietrc [hyphindex + c ]!= c ) 
		  hc [0 ]= 0 ;
		  else hc [0 ]= trietro [hyphindex + c ];
		  if ( hc [0 ]== 0 ) 
		  goto lab33 ;
		  if ( hc [0 ]> maxhyphchar ) 
		  goto lab33 ;
		  if ( hn == 63 ) 
		  goto lab33 ;
		  hb = s ;
		  incr ( hn ) ;
		  hu [hn ]= c ;
		  hc [hn ]= hc [0 ];
		  hyfbchar = 11904 ;
		} 
		else if ( mem [s ].hh.b0 == 8 ) 
		{
		  if ( mem [s + 1 ].hh.b0 != hf ) 
		  goto lab33 ;
		  j = hn ;
		  q = mem [s + 1 ].hh .v.RH ;
		  if ( q > -1073741823L ) 
		  hyfbchar = mem [q ].hh.b1 ;
		  while ( q > -1073741823L ) {
		      
		    c = mem [q ].hh.b1 ;
		    if ( hyphindex == 0 ) 
		    hc [0 ]= eqtb [78137L + c ].hh .v.RH ;
		    else if ( trietrc [hyphindex + c ]!= c ) 
		    hc [0 ]= 0 ;
		    else hc [0 ]= trietro [hyphindex + c ];
		    if ( hc [0 ]== 0 ) 
		    goto lab33 ;
		    if ( hc [0 ]> maxhyphchar ) 
		    goto lab33 ;
		    if ( j == 63 ) 
		    goto lab33 ;
		    incr ( j ) ;
		    hu [j ]= c ;
		    hc [j ]= hc [0 ];
		    q = mem [q ].hh .v.RH ;
		  } 
		  hb = s ;
		  hn = j ;
		  if ( odd ( mem [s ].hh.b1 ) ) 
		  hyfbchar = fontbchar [hf ];
		  else hyfbchar = 11904 ;
		} 
		else if ( ( mem [s ].hh.b0 == 13 ) && ( mem [s ].hh.b1 == 
		0 ) ) 
		{
		  hb = s ;
		  hyfbchar = fontbchar [hf ];
		} 
		else goto lab33 ;
		s = mem [s ].hh .v.RH ;
	      } 
	      lab33: ;
	      if ( hn < lhyf + rhyf ) 
	      goto lab31 ;
	      while ( true ) {
		  
		if ( ! ( ( s >= himemmin ) ) ) 
		switch ( mem [s ].hh.b0 ) 
		{case 8 : 
		  ;
		  break ;
		case 13 : 
		  if ( mem [s ].hh.b1 != 0 ) 
		  goto lab34 ;
		  break ;
		case 5 : 
		  ;
		  break ;
		case 10 : 
		case 12 : 
		case 14 : 
		case 4 : 
		case 7 : 
		case 6 : 
		  goto lab34 ;
		  break ;
		case 11 : 
		  if ( mem [s ].hh.b1 >= 4 ) 
		  goto lab34 ;
		  else goto lab31 ;
		  break ;
		  default: 
		  goto lab31 ;
		  break ;
		} 
		s = mem [s ].hh .v.RH ;
	      } 
	      lab34: ;
	      hyphenate () ;
	    } 
	    lab31: ;
	  } 
	} 
	break ;
      case 13 : 
	if ( ( mem [curp ].hh.b1 == 1 ) || ( mem [curp ].hh.b1 == 3 ) ) 
	{
	  if ( ! ( mem [curp ].hh .v.RH >= himemmin ) && autobreaking ) {
	      
	    if ( mem [mem [curp ].hh .v.RH ].hh.b0 == 12 ) 
	    trybreak ( 0 , 0 ) ;
	  } 
	  activewidth [1 ]= activewidth [1 ]+ mem [curp + 1 ].cint ;
	} 
	else activewidth [1 ]= activewidth [1 ]+ mem [curp + 1 ].cint ;
	break ;
      case 8 : 
	{
	  f = mem [curp + 1 ].hh.b0 ;
	  activewidth [1 ]= activewidth [1 ]+ fontinfo [widthbase [f ]+ 
	  fontinfo [charbase [f ]+ effectivechar ( true , f , 
	  ptencucsto8bitcode ( fontenc [f ], mem [curp + 1 ].hh.b1 ) ) ]
	  .qqqq .b0 ].cint ;
	} 
	break ;
      case 9 : 
	{
	  s = mem [curp + 1 ].hh .v.LH ;
	  discwidth = 0 ;
	  if ( s == -1073741823L ) 
	  trybreak ( eqtb [114365L ].cint , 1 ) ;
	  else {
	      
	    do {
		if ( ( s >= himemmin ) ) 
	      {
		f = mem [s ].hh.b0 ;
		discwidth = discwidth + fontinfo [widthbase [f ]+ fontinfo 
		[charbase [f ]+ mem [s ].hh.b1 ].qqqq .b0 ].cint ;
		if ( fontdir [f ]!= 0 ) 
		s = mem [s ].hh .v.RH ;
	      } 
	      else switch ( mem [s ].hh.b0 ) 
	      {case 8 : 
		{
		  f = mem [s + 1 ].hh.b0 ;
		  discwidth = discwidth + fontinfo [widthbase [f ]+ 
		  fontinfo [charbase [f ]+ mem [s + 1 ].hh.b1 ].qqqq .b0 
		  ].cint ;
		} 
		break ;
	      case 0 : 
	      case 1 : 
	      case 2 : 
	      case 3 : 
	      case 13 : 
		discwidth = discwidth + mem [s + 1 ].cint ;
		break ;
	      case 5 : 
		;
		break ;
		default: 
		confusion ( 1106 ) ;
		break ;
	      } 
	      s = mem [s ].hh .v.RH ;
	    } while ( ! ( s == -1073741823L ) ) ;
	    activewidth [1 ]= activewidth [1 ]+ discwidth ;
	    trybreak ( eqtb [114364L ].cint , 1 ) ;
	    activewidth [1 ]= activewidth [1 ]- discwidth ;
	  } 
	  r = mem [curp ].hh.b1 ;
	  s = mem [curp ].hh .v.RH ;
	  while ( r > 0 ) {
	      
	    if ( ( s >= himemmin ) ) 
	    {
	      f = mem [s ].hh.b0 ;
	      activewidth [1 ]= activewidth [1 ]+ fontinfo [widthbase [f 
	      ]+ fontinfo [charbase [f ]+ mem [s ].hh.b1 ].qqqq .b0 ]
	      .cint ;
	      if ( fontdir [f ]!= 0 ) 
	      s = mem [s ].hh .v.RH ;
	    } 
	    else switch ( mem [s ].hh.b0 ) 
	    {case 8 : 
	      {
		f = mem [s + 1 ].hh.b0 ;
		activewidth [1 ]= activewidth [1 ]+ fontinfo [widthbase [
		f ]+ fontinfo [charbase [f ]+ mem [s + 1 ].hh.b1 ].qqqq 
		.b0 ].cint ;
	      } 
	      break ;
	    case 0 : 
	    case 1 : 
	    case 2 : 
	    case 3 : 
	    case 13 : 
	      activewidth [1 ]= activewidth [1 ]+ mem [s + 1 ].cint ;
	      break ;
	    case 5 : 
	      ;
	      break ;
	      default: 
	      confusion ( 1107 ) ;
	      break ;
	    } 
	    decr ( r ) ;
	    s = mem [s ].hh .v.RH ;
	  } 
	  prevp = curp ;
	  curp = s ;
	  goto lab35 ;
	} 
	break ;
      case 11 : 
	{
	  if ( mem [curp ].hh.b1 < 4 ) 
	  autobreaking = odd ( mem [curp ].hh.b1 ) ;
	  {
	    if ( ! ( mem [curp ].hh .v.RH >= himemmin ) && autobreaking ) {
		
	      if ( mem [mem [curp ].hh .v.RH ].hh.b0 == 12 ) 
	      trybreak ( 0 , 0 ) ;
	    } 
	    activewidth [1 ]= activewidth [1 ]+ mem [curp + 1 ].cint ;
	  } 
	} 
	break ;
      case 14 : 
	trybreak ( mem [curp + 1 ].cint , 0 ) ;
	break ;
      case 5 : 
      case 6 : 
      case 4 : 
      case 7 : 
	;
	break ;
	default: 
	confusion ( 1105 ) ;
	break ;
      } 
      prevp = curp ;
      curp = mem [curp ].hh .v.RH ;
      lab35: ;
    } 
    if ( curp == -1073741823L ) 
    {
      trybreak ( -10000 , 1 ) ;
      if ( mem [memtop - 7 ].hh .v.RH != memtop - 7 ) 
      {
	r = mem [memtop - 7 ].hh .v.RH ;
	fewestdemerits = 1073741823L ;
	do {
	    if ( mem [r ].hh.b0 != 2 ) { 
	    if ( mem [r + 2 ].cint < fewestdemerits ) 
	    {
	      fewestdemerits = mem [r + 2 ].cint ;
	      bestbet = r ;
	    } 
	  } 
	  r = mem [r ].hh .v.RH ;
	} while ( ! ( r == memtop - 7 ) ) ;
	bestline = mem [bestbet + 1 ].hh .v.LH ;
	if ( eqtb [114380L ].cint == 0 ) 
	goto lab30 ;
	{
	  r = mem [memtop - 7 ].hh .v.RH ;
	  actuallooseness = 0 ;
	  do {
	      if ( mem [r ].hh.b0 != 2 ) 
	    {
	      linediff = mem [r + 1 ].hh .v.LH - bestline ;
	      if ( ( ( linediff < actuallooseness ) && ( eqtb [114380L ]
	      .cint <= linediff ) ) || ( ( linediff > actuallooseness ) && ( 
	      eqtb [114380L ].cint >= linediff ) ) ) 
	      {
		bestbet = r ;
		actuallooseness = linediff ;
		fewestdemerits = mem [r + 2 ].cint ;
	      } 
	      else if ( ( linediff == actuallooseness ) && ( mem [r + 2 ]
	      .cint < fewestdemerits ) ) 
	      {
		bestbet = r ;
		fewestdemerits = mem [r + 2 ].cint ;
	      } 
	    } 
	    r = mem [r ].hh .v.RH ;
	  } while ( ! ( r == memtop - 7 ) ) ;
	  bestline = mem [bestbet + 1 ].hh .v.LH ;
	} 
	if ( ( actuallooseness == eqtb [114380L ].cint ) || finalpass ) 
	goto lab30 ;
      } 
    } 
    q = mem [memtop - 7 ].hh .v.RH ;
    while ( q != memtop - 7 ) {
	
      curp = mem [q ].hh .v.RH ;
      if ( mem [q ].hh.b0 == 2 ) 
      freenode ( q , 8 ) ;
      else freenode ( q , activenodesize ) ;
      q = curp ;
    } 
    q = passive ;
    while ( q != -1073741823L ) {
	
      curp = mem [q ].hh .v.RH ;
      freenode ( q , 2 ) ;
      q = curp ;
    } 
    if ( ! secondpass ) 
    {
	;
#ifdef STAT
      if ( eqtb [114393L ].cint > 0 ) 
      printnl ( 1103 ) ;
#endif /* STAT */
      threshold = eqtb [114362L ].cint ;
      secondpass = true ;
      finalpass = ( eqtb [114977L ].cint <= 0 ) ;
    } 
    else {
	
	;
#ifdef STAT
      if ( eqtb [114393L ].cint > 0 ) 
      printnl ( 1104 ) ;
#endif /* STAT */
      background [2 ]= background [2 ]+ eqtb [114977L ].cint ;
      finalpass = true ;
    } 
  } 
  lab30: 
	;
#ifdef STAT
  if ( eqtb [114393L ].cint > 0 ) 
  {
    enddiagnostic ( true ) ;
    normalizeselector () ;
  } 
#endif /* STAT */
  if ( dolastlinefit ) {
      
    if ( mem [bestbet + 3 ].cint == 0 ) 
    dolastlinefit = false ;
    else {
	
      q = newspec ( mem [lastlinefill + 1 ].hh .v.LH ) ;
      deleteglueref ( mem [lastlinefill + 1 ].hh .v.LH ) ;
      mem [q + 1 ].cint = mem [q + 1 ].cint + mem [bestbet + 3 ].cint - 
      mem [bestbet + 4 ].cint ;
      mem [q + 2 ].cint = 0 ;
      mem [lastlinefill + 1 ].hh .v.LH = q ;
    } 
  } 
  postlinebreak ( d ) ;
  q = mem [memtop - 7 ].hh .v.RH ;
  while ( q != memtop - 7 ) {
      
    curp = mem [q ].hh .v.RH ;
    if ( mem [q ].hh.b0 == 2 ) 
    freenode ( q , 8 ) ;
    else freenode ( q , activenodesize ) ;
    q = curp ;
  } 
  q = passive ;
  while ( q != -1073741823L ) {
      
    curp = mem [q ].hh .v.RH ;
    freenode ( q , 2 ) ;
    q = curp ;
  } 
  packbeginline = 0 ;
} 
void 
newhyphexceptions ( void ) 
{
  /* 21 10 40 45 46 */ newhyphexceptions_regmem 
  unsigned char n  ;
  unsigned char j  ;
  hyphpointer h  ;
  strnumber k  ;
  halfword p  ;
  halfword q  ;
  strnumber s  ;
  poolpointer u, v  ;
  scanleftbrace () ;
  if ( eqtb [114412L ].cint <= 0 ) 
  curlang = 0 ;
  else if ( eqtb [114412L ].cint > 255 ) 
  curlang = 0 ;
  else curlang = eqtb [114412L ].cint ;
	;
#ifdef INITEX
  if ( trienotready ) 
  {
    hyphindex = 0 ;
    goto lab46 ;
  } 
#endif /* INITEX */
  if ( trietrc [hyphstart + curlang ]!= curlang ) 
  hyphindex = 0 ;
  else hyphindex = trietrl [hyphstart + curlang ];
  lab46: n = 0 ;
  p = -1073741823L ;
  while ( true ) {
      
    getxtoken () ;
    lab21: switch ( curcmd ) 
    {case 11 : 
    case 12 : 
    case 74 : 
      if ( curchr == 45 ) 
      {
	if ( n < 63 ) 
	{
	  q = getavail () ;
	  mem [q ].hh .v.RH = p ;
	  mem [q ].hh .v.LH = n ;
	  p = q ;
	} 
      } 
      else {
	  
	if ( hyphindex == 0 ) 
	hc [0 ]= eqtb [78137L + curchr ].hh .v.RH ;
	else if ( trietrc [hyphindex + curchr ]!= curchr ) 
	hc [0 ]= 0 ;
	else hc [0 ]= trietro [hyphindex + curchr ];
	if ( hc [0 ]== 0 ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1114 ) ;
	  } 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 1115 ;
	    helpline [0 ]= 1116 ;
	  } 
	  error () ;
	} 
	else if ( n < 63 ) 
	{
	  incr ( n ) ;
	  hc [n ]= hc [0 ];
	} 
      } 
      break ;
    case 21 : 
      {
	scancharnum () ;
	curchr = curval ;
	curcmd = 74 ;
	goto lab21 ;
      } 
      break ;
    case 10 : 
    case 2 : 
      {
	if ( n > 1 ) 
	{
	  incr ( n ) ;
	  hc [n ]= curlang ;
	  {
	    if ( poolptr + n > poolsize ) 
	    overflow ( 260 , poolsize - initpoolptr ) ;
	  } 
	  h = 0 ;
	  {register integer for_end; j = 1 ;for_end = n ; if ( j <= for_end) 
	  do 
	    {
	      h = ( h + h + hc [j ]) % 607 ;
	      {
		strpool [poolptr ]= hc [j ];
		incr ( poolptr ) ;
	      } 
	    } 
	  while ( j++ < for_end ) ;} 
	  s = makestring () ;
	  if ( hyphnext <= 607 ) 
	  while ( ( hyphnext > 0 ) && ( hyphword [hyphnext - 1 ]> 0 ) ) decr 
	  ( hyphnext ) ;
	  if ( ( hyphcount == hyphsize ) || ( hyphnext == 0 ) ) 
	  overflow ( 1117 , hyphsize ) ;
	  incr ( hyphcount ) ;
	  while ( hyphword [h ]!= 0 ) {
	      
	    k = hyphword [h ];
	    if ( ( strstart [k + 1 ]- strstart [k ]) != ( strstart [s + 1 
	    ]- strstart [s ]) ) 
	    goto lab45 ;
	    u = strstart [k ];
	    v = strstart [s ];
	    do {
		if ( strpool [u ]!= strpool [v ]) 
	      goto lab45 ;
	      incr ( u ) ;
	      incr ( v ) ;
	    } while ( ! ( u == strstart [k + 1 ]) ) ;
	    {
	      decr ( strptr ) ;
	      poolptr = strstart [strptr ];
	    } 
	    s = hyphword [h ];
	    decr ( hyphcount ) ;
	    goto lab40 ;
	    lab45: ;
	    if ( hyphlink [h ]== 0 ) 
	    {
	      hyphlink [h ]= hyphnext ;
	      if ( hyphnext >= hyphsize ) 
	      hyphnext = 607 ;
	      if ( hyphnext > 607 ) 
	      incr ( hyphnext ) ;
	    } 
	    h = hyphlink [h ]- 1 ;
	  } 
	  lab40: hyphword [h ]= s ;
	  hyphlist [h ]= p ;
	} 
	if ( curcmd == 2 ) 
	return ;
	n = 0 ;
	p = -1073741823L ;
      } 
      break ;
      default: 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 784 ) ;
	} 
	printesc ( 1110 ) ;
	print ( 1111 ) ;
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1112 ;
	  helpline [0 ]= 1113 ;
	} 
	error () ;
      } 
      break ;
    } 
  } 
} 
boolean 
zdomarks ( smallnumber a , smallnumber l , halfword q ) 
{
  register boolean Result; domarks_regmem 
  smallnumber i  ;
  if ( l < 5 ) 
  {
    {register integer for_end; i = 0 ;for_end = 15 ; if ( i <= for_end) do 
      {
	if ( odd ( i ) ) 
	curptr = mem [q + ( i / 2 ) + 1 ].hh .v.RH ;
	else curptr = mem [q + ( i / 2 ) + 1 ].hh .v.LH ;
	if ( curptr != -1073741823L ) {
	    
	  if ( domarks ( a , l + 1 , curptr ) ) 
	  {
	    if ( odd ( i ) ) 
	    mem [q + ( i / 2 ) + 1 ].hh .v.RH = -1073741823L ;
	    else mem [q + ( i / 2 ) + 1 ].hh .v.LH = -1073741823L ;
	    decr ( mem [q ].hh.b1 ) ;
	  } 
	} 
      } 
    while ( i++ < for_end ) ;} 
    if ( mem [q ].hh.b1 == 0 ) 
    {
      freenode ( q , 9 ) ;
      q = -1073741823L ;
    } 
  } 
  else {
      
    switch ( a ) 
    {case 0 : 
      if ( mem [q + 2 ].hh .v.RH != -1073741823L ) 
      {
	deletetokenref ( mem [q + 2 ].hh .v.RH ) ;
	mem [q + 2 ].hh .v.RH = -1073741823L ;
	deletetokenref ( mem [q + 3 ].hh .v.LH ) ;
	mem [q + 3 ].hh .v.LH = -1073741823L ;
      } 
      break ;
    case 1 : 
      if ( mem [q + 2 ].hh .v.LH != -1073741823L ) 
      {
	if ( mem [q + 1 ].hh .v.LH != -1073741823L ) 
	deletetokenref ( mem [q + 1 ].hh .v.LH ) ;
	deletetokenref ( mem [q + 1 ].hh .v.RH ) ;
	mem [q + 1 ].hh .v.RH = -1073741823L ;
	if ( mem [mem [q + 2 ].hh .v.LH ].hh .v.RH == -1073741823L ) 
	{
	  deletetokenref ( mem [q + 2 ].hh .v.LH ) ;
	  mem [q + 2 ].hh .v.LH = -1073741823L ;
	} 
	else incr ( mem [mem [q + 2 ].hh .v.LH ].hh .v.LH ) ;
	mem [q + 1 ].hh .v.LH = mem [q + 2 ].hh .v.LH ;
      } 
      break ;
    case 2 : 
      if ( ( mem [q + 1 ].hh .v.LH != -1073741823L ) && ( mem [q + 1 ].hh 
      .v.RH == -1073741823L ) ) 
      {
	mem [q + 1 ].hh .v.RH = mem [q + 1 ].hh .v.LH ;
	incr ( mem [mem [q + 1 ].hh .v.LH ].hh .v.LH ) ;
      } 
      break ;
	;
#ifdef INITEX
    case 3 : 
      {register integer for_end; i = 0 ;for_end = 4 ; if ( i <= for_end) do 
	{
	  if ( odd ( i ) ) 
	  curptr = mem [q + ( i / 2 ) + 1 ].hh .v.RH ;
	  else curptr = mem [q + ( i / 2 ) + 1 ].hh .v.LH ;
	  if ( curptr != -1073741823L ) 
	  {
	    deletetokenref ( curptr ) ;
	    if ( odd ( i ) ) 
	    mem [q + ( i / 2 ) + 1 ].hh .v.RH = -1073741823L ;
	    else mem [q + ( i / 2 ) + 1 ].hh .v.LH = -1073741823L ;
	  } 
	} 
      while ( i++ < for_end ) ;} 
      break ;
#endif /* INITEX */
    } 
    if ( mem [q + 2 ].hh .v.LH == -1073741823L ) {
	
      if ( mem [q + 3 ].hh .v.LH == -1073741823L ) 
      {
	freenode ( q , 4 ) ;
	q = -1073741823L ;
      } 
    } 
  } 
  Result = ( q == -1073741823L ) ;
  return Result ;
} 
void 
prefixedcommand ( void ) 
{
  /* 30 10 */ prefixedcommand_regmem 
  smallnumber a  ;
  integer m  ;
  internalfontnumber f  ;
  halfword j  ;
  fontindex k  ;
  halfword p, q  ;
  integer n  ;
  boolean e  ;
  a = 0 ;
  while ( curcmd == 108 ) {
      
    if ( ! odd ( a / curchr ) ) 
    a = a + curchr ;
    do {
	getxtoken () ;
    } while ( ! ( ( curcmd != 10 ) && ( curcmd != 0 ) ) ) ;
    if ( curcmd <= 80 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1382 ) ;
      } 
      printcmdchr ( curcmd , curchr ) ;
      printchar ( 39 ) ;
      {
	helpptr = 1 ;
	helpline [0 ]= 1383 ;
      } 
      if ( ( eTeXmode == 1 ) ) 
      helpline [0 ]= 1384 ;
      backerror () ;
      return ;
    } 
    if ( eqtb [114397L ].cint > 2 ) {
	
      if ( ( eTeXmode == 1 ) ) 
      showcurcmdchr () ;
    } 
  } 
  if ( a >= 8 ) 
  {
    j = 917505L ;
    a = a - 8 ;
  } 
  else j = 0 ;
  if ( ( curcmd != 112 ) && ( ( a % 4 != 0 ) || ( j != 0 ) ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 789 ) ;
    } 
    printesc ( 1374 ) ;
    print ( 1385 ) ;
    printesc ( 1375 ) ;
    {
      helpptr = 1 ;
      helpline [0 ]= 1386 ;
    } 
    if ( ( eTeXmode == 1 ) ) 
    {
      helpline [0 ]= 1387 ;
      print ( 1385 ) ;
      printesc ( 1388 ) ;
    } 
    print ( 1389 ) ;
    printcmdchr ( curcmd , curchr ) ;
    printchar ( 39 ) ;
    error () ;
  } 
  if ( eqtb [114404L ].cint != 0 ) {
      
    if ( eqtb [114404L ].cint < 0 ) 
    {
      if ( ( a >= 4 ) ) 
      a = a - 4 ;
    } 
    else {
	
      if ( ! ( a >= 4 ) ) 
      a = a + 4 ;
    } 
  } 
  switch ( curcmd ) 
  {case 100 : 
    {
      if ( fontdir [curchr ]== 4 ) {
	  
	if ( ( a >= 4 ) ) 
	geqdefine ( 51754L , 138 , curchr ) ;
	else eqdefine ( 51754L , 138 , curchr ) ;
      } 
      else if ( fontdir [curchr ]== 3 ) {
	  
	if ( ( a >= 4 ) ) 
	geqdefine ( 51755L , 138 , curchr ) ;
	else eqdefine ( 51755L , 138 , curchr ) ;
      } 
      else if ( ( a >= 4 ) ) 
      geqdefine ( 50985L , 138 , curchr ) ;
      else eqdefine ( 50985L , 138 , curchr ) ;
    } 
    break ;
  case 112 : 
    {
      if ( odd ( curchr ) && ! ( a >= 4 ) && ( eqtb [114404L ].cint >= 0 ) ) 
      a = a + 4 ;
      e = ( curchr >= 2 ) ;
      getrtoken () ;
      p = curcs ;
      q = scantoks ( true , e ) ;
      if ( j != 0 ) 
      {
	q = getavail () ;
	mem [q ].hh .v.LH = j ;
	mem [q ].hh .v.RH = mem [defref ].hh .v.RH ;
	mem [defref ].hh .v.RH = q ;
      } 
      if ( ( a >= 4 ) ) 
      geqdefine ( p , 129 + ( a % 4 ) , defref ) ;
      else eqdefine ( p , 129 + ( a % 4 ) , defref ) ;
    } 
    break ;
  case 109 : 
    {
      n = curchr ;
      getrtoken () ;
      p = curcs ;
      if ( n == 0 ) 
      {
	do {
	    gettoken () ;
	} while ( ! ( curcmd != 10 ) ) ;
	if ( curtok == 786493L ) 
	{
	  gettoken () ;
	  if ( curcmd == 10 ) 
	  gettoken () ;
	} 
      } 
      else {
	  
	gettoken () ;
	q = curtok ;
	gettoken () ;
	backinput () ;
	curtok = q ;
	backinput () ;
      } 
      if ( curcmd >= 129 ) 
      incr ( mem [curchr ].hh .v.LH ) ;
      else if ( ( curcmd == 104 ) || ( curcmd == 81 ) ) {
	  
	if ( ( curchr < membot ) || ( curchr > membot + 23 ) ) 
	incr ( mem [curchr + 1 ].hh .v.LH ) ;
      } 
      if ( ( a >= 4 ) ) 
      geqdefine ( p , curcmd , curchr ) ;
      else eqdefine ( p , curcmd , curchr ) ;
    } 
    break ;
  case 110 : 
    if ( curchr == 8 ) 
    {
      scancharnum () ;
      p = 114105L + curval ;
      scanoptionalequals () ;
      scancharnum () ;
      n = curval ;
      scancharnum () ;
      if ( ( eqtb [114425L ].cint > 0 ) ) 
      {
	begindiagnostic () ;
	printnl ( 1409 ) ;
	print ( p - 114105L ) ;
	print ( 1410 ) ;
	print ( n ) ;
	printchar ( 32 ) ;
	print ( curval ) ;
	enddiagnostic ( false ) ;
      } 
      n = n * 256 + curval ;
      if ( ( a >= 4 ) ) 
      geqdefine ( p , 138 , n ) ;
      else eqdefine ( p , 138 , n ) ;
      if ( ( p - 114105L ) < eqtb [114423L ].cint ) {
	  
	if ( ( a >= 4 ) ) 
	geqworddefine ( 114423L , p - 114105L ) ;
	else eqworddefine ( 114423L , p - 114105L ) ;
      } 
      if ( ( p - 114105L ) > eqtb [114424L ].cint ) {
	  
	if ( ( a >= 4 ) ) 
	geqworddefine ( 114424L , p - 114105L ) ;
	else eqworddefine ( 114424L , p - 114105L ) ;
      } 
    } 
    else {
	
      n = curchr ;
      getrtoken () ;
      p = curcs ;
      if ( ( a >= 4 ) ) 
      geqdefine ( p , 0 , 256 ) ;
      else eqdefine ( p , 0 , 256 ) ;
      scanoptionalequals () ;
      switch ( n ) 
      {case 0 : 
	{
	  scancharnum () ;
	  if ( ( a >= 4 ) ) 
	  geqdefine ( p , 74 , curval ) ;
	  else eqdefine ( p , 74 , curval ) ;
	} 
	break ;
      case 9 : 
	{
	  scancharnum () ;
	  if ( ( a >= 4 ) ) 
	  geqdefine ( p , 75 , curval ) ;
	  else eqdefine ( p , 75 , curval ) ;
	} 
	break ;
      case 1 : 
	{
	  scanrealfifteenbitint () ;
	  if ( ( a >= 4 ) ) 
	  geqdefine ( p , 76 , curval ) ;
	  else eqdefine ( p , 76 , curval ) ;
	} 
	break ;
      case 2 : 
	{
	  scanomegafifteenbitint () ;
	  if ( ( a >= 4 ) ) 
	  geqdefine ( p , 77 , curval ) ;
	  else eqdefine ( p , 77 , curval ) ;
	} 
	break ;
	default: 
	{
	  scanregisternum () ;
	  if ( curval > 255 ) 
	  {
	    j = n - 3 ;
	    if ( j > 3 ) 
	    j = 5 ;
	    findsaelement ( j , curval , true ) ;
	    incr ( mem [curptr + 1 ].hh .v.LH ) ;
	    if ( j == 5 ) 
	    j = 81 ;
	    else j = 104 ;
	    if ( ( a >= 4 ) ) 
	    geqdefine ( p , j , curptr ) ;
	    else eqdefine ( p , j , curptr ) ;
	  } 
	  else switch ( n ) 
	  {case 3 : 
	    if ( ( a >= 4 ) ) 
	    geqdefine ( p , 83 , 114445L + curval ) ;
	    else eqdefine ( p , 83 , 114445L + curval ) ;
	    break ;
	  case 4 : 
	    if ( ( a >= 4 ) ) 
	    geqdefine ( p , 84 , 114982L + curval ) ;
	    else eqdefine ( p , 84 , 114982L + curval ) ;
	    break ;
	  case 5 : 
	    if ( ( a >= 4 ) ) 
	    geqdefine ( p , 85 , 49946L + curval ) ;
	    else eqdefine ( p , 85 , 49946L + curval ) ;
	    break ;
	  case 6 : 
	    if ( ( a >= 4 ) ) 
	    geqdefine ( p , 86 , 50202L + curval ) ;
	    else eqdefine ( p , 86 , 50202L + curval ) ;
	    break ;
	  case 7 : 
	    if ( ( a >= 4 ) ) 
	    geqdefine ( p , 82 , 50469L + curval ) ;
	    else eqdefine ( p , 82 , 50469L + curval ) ;
	    break ;
	  } 
	} 
	break ;
      } 
    } 
    break ;
  case 111 : 
    {
      j = curchr ;
      scanint () ;
      n = curval ;
      if ( ! scankeyword ( 1008 ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1264 ) ;
	} 
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1411 ;
	  helpline [0 ]= 1412 ;
	} 
	error () ;
      } 
      getrtoken () ;
      p = curcs ;
      readtoks ( n , p , j ) ;
      if ( ( a >= 4 ) ) 
      geqdefine ( p , 129 , curval ) ;
      else eqdefine ( p , 129 , curval ) ;
    } 
    break ;
  case 81 : 
  case 82 : 
    {
      q = curcs ;
      e = false ;
      if ( curcmd == 81 ) {
	  
	if ( curchr == membot ) 
	{
	  scanregisternum () ;
	  if ( curval > 255 ) 
	  {
	    findsaelement ( 5 , curval , true ) ;
	    curchr = curptr ;
	    e = true ;
	  } 
	  else curchr = 50469L + curval ;
	} 
	else e = true ;
      } 
      p = curchr ;
      scanoptionalequals () ;
      do {
	  getxtoken () ;
      } while ( ! ( ( curcmd != 10 ) && ( curcmd != 0 ) ) ) ;
      if ( curcmd != 1 ) {
	  
	if ( ( curcmd == 81 ) || ( curcmd == 82 ) ) 
	{
	  if ( curcmd == 81 ) {
	      
	    if ( curchr == membot ) 
	    {
	      scanregisternum () ;
	      if ( curval < 256 ) 
	      q = eqtb [50469L + curval ].hh .v.RH ;
	      else {
		  
		findsaelement ( 5 , curval , false ) ;
		if ( curptr == -1073741823L ) 
		q = -1073741823L ;
		else q = mem [curptr + 1 ].hh .v.RH ;
	      } 
	    } 
	    else q = mem [curchr + 1 ].hh .v.RH ;
	  } 
	  else q = eqtb [curchr ].hh .v.RH ;
	  if ( q == -1073741823L ) {
	      
	    if ( e ) {
		
	      if ( ( a >= 4 ) ) 
	      gsadef ( p , -1073741823L ) ;
	      else sadef ( p , -1073741823L ) ;
	    } 
	    else if ( ( a >= 4 ) ) 
	    geqdefine ( p , 119 , -1073741823L ) ;
	    else eqdefine ( p , 119 , -1073741823L ) ;
	  } 
	  else {
	      
	    incr ( mem [q ].hh .v.LH ) ;
	    if ( e ) {
		
	      if ( ( a >= 4 ) ) 
	      gsadef ( p , q ) ;
	      else sadef ( p , q ) ;
	    } 
	    else if ( ( a >= 4 ) ) 
	    geqdefine ( p , 129 , q ) ;
	    else eqdefine ( p , 129 , q ) ;
	  } 
	  goto lab30 ;
	} 
      } 
      backinput () ;
      curcs = q ;
      q = scantoks ( false , false ) ;
      if ( mem [defref ].hh .v.RH == -1073741823L ) 
      {
	if ( e ) {
	    
	  if ( ( a >= 4 ) ) 
	  gsadef ( p , -1073741823L ) ;
	  else sadef ( p , -1073741823L ) ;
	} 
	else if ( ( a >= 4 ) ) 
	geqdefine ( p , 119 , -1073741823L ) ;
	else eqdefine ( p , 119 , -1073741823L ) ;
	{
	  mem [defref ].hh .v.RH = avail ;
	  avail = defref ;
	;
#ifdef STAT
	  decr ( dynused ) ;
#endif /* STAT */
	} 
      } 
      else {
	  
	if ( ( p == 50459L ) && ! e ) 
	{
	  mem [q ].hh .v.RH = getavail () ;
	  q = mem [q ].hh .v.RH ;
	  mem [q ].hh .v.LH = 131197L ;
	  q = getavail () ;
	  mem [q ].hh .v.LH = 65659L ;
	  mem [q ].hh .v.RH = mem [defref ].hh .v.RH ;
	  mem [defref ].hh .v.RH = q ;
	} 
	if ( e ) {
	    
	  if ( ( a >= 4 ) ) 
	  gsadef ( p , defref ) ;
	  else sadef ( p , defref ) ;
	} 
	else if ( ( a >= 4 ) ) 
	geqdefine ( p , 129 , defref ) ;
	else eqdefine ( p , 129 , defref ) ;
      } 
    } 
    break ;
  case 83 : 
    {
      p = curchr ;
      scanoptionalequals () ;
      scanint () ;
      if ( p == 114405L ) 
      {
	if ( fontdir [eqtb [50986L + curval ].hh .v.RH ]!= 0 ) {
	    
	  if ( ( a >= 4 ) ) 
	  geqworddefine ( 114406L , curval ) ;
	  else eqworddefine ( 114406L , curval ) ;
	} 
	else if ( ( a >= 4 ) ) 
	geqworddefine ( p , curval ) ;
	else eqworddefine ( p , curval ) ;
      } 
      else if ( ( a >= 4 ) ) 
      geqworddefine ( p , curval ) ;
      else eqworddefine ( p , curval ) ;
    } 
    break ;
  case 84 : 
    {
      p = curchr ;
      scanoptionalequals () ;
      scandimen ( false , false , false ) ;
      if ( ( a >= 4 ) ) 
      geqworddefine ( p , curval ) ;
      else eqworddefine ( p , curval ) ;
    } 
    break ;
  case 85 : 
  case 86 : 
    {
      p = curchr ;
      n = curcmd ;
      scanoptionalequals () ;
      if ( n == 86 ) 
      scanglue ( 3 ) ;
      else scanglue ( 2 ) ;
      trapzeroglue () ;
      if ( ( a >= 4 ) ) 
      geqdefine ( p , 135 , curval ) ;
      else eqdefine ( p , 135 , curval ) ;
    } 
    break ;
  case 98 : 
    {
      if ( curchr == ( 114829L ) ) 
      {
	p = curchr - 128 ;
	scanasciinum () ;
	p = p + curval ;
	scanoptionalequals () ;
	scanint () ;
	curval1 = curval ;
	scanint () ;
	if ( ( curval1 > 16777215L ) || ( curval > 16777215L ) ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 882 ) ;
	  } 
	  printint ( curval1 ) ;
	  print ( 32 ) ;
	  printint ( curval ) ;
	  print ( 1415 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 1416 ;
	  } 
	  error () ;
	  curval1 = 0 ;
	  curval = 0 ;
	} 
	curval1 = ( curval1 / 65536L ) * 256 + ( curval1 % 256 ) ;
	curval = ( curval / 65536L ) * 256 + ( curval % 256 ) ;
	if ( ( a >= 4 ) ) 
	delgeqworddefine ( p , curval1 , curval ) ;
	else deleqworddefine ( p , curval1 , curval ) ;
      } 
      else {
	  
	if ( curchr == 63663L ) 
	m = 14 ;
	else m = 0 ;
	if ( curchr == 51759L ) 
	n = 15 ;
	else if ( curchr == 63663L ) 
	n = 20 ;
	else if ( curchr < 113849L ) 
	n = 11904 ;
	else if ( curchr == 113849L ) 
	n = 32768L ;
	else if ( curchr == ( 113977L ) ) 
	n = 134217728L ;
	else if ( curchr == 101945L ) 
	n = 32767 ;
	else if ( curchr == 114701L ) 
	n = 16777215L ;
	else n = 255 ;
	p = curchr ;
	curval1 = p ;
	if ( p == 63663L ) 
	{
	  scancharnum () ;
	  p = p + kcatcodekey ( curval ) ;
	  if ( curval >= 11904 ) 
	  m = 15 ;
	} 
	else if ( p < 113849L ) 
	{
	  scanlatinnum () ;
	  p = p + curval ;
	} 
	else {
	    
	  scanasciinum () ;
	  p = p + curval ;
	} 
	scanoptionalequals () ;
	scanint () ;
	if ( ( ( curval < m ) && ( p < 114701L ) ) || ( curval > n ) ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 882 ) ;
	  } 
	  printint ( curval ) ;
	  if ( p < 114701L ) 
	  {
	    print ( 1417 ) ;
	    printint ( m ) ;
	    print ( 1418 ) ;
	  } 
	  else print ( 1419 ) ;
	  printint ( n ) ;
	  if ( m == 0 ) 
	  {
	    {
	      helpptr = 1 ;
	      helpline [0 ]= 1416 ;
	    } 
	    error () ;
	    curval = 0 ;
	  } 
	  else {
	      
	    {
	      helpptr = 1 ;
	      helpline [0 ]= 1420 ;
	    } 
	    error () ;
	    curval = 16 ;
	  } 
	} 
	if ( p < 113849L ) {
	    
	  if ( ( a >= 4 ) ) 
	  geqdefine ( p , 138 , curval ) ;
	  else eqdefine ( p , 138 , curval ) ;
	} 
	else if ( curval1 == 113849L ) 
	{
	  if ( curval == 32768L ) 
	  curval = 524288L ;
	  else curval = ( ( curval / 4096 ) * 65536L ) + ( curval % 4096 ) ;
	  if ( ( a >= 4 ) ) 
	  geqdefine ( p , 138 , curval ) ;
	  else eqdefine ( p , 138 , curval ) ;
	} 
	else if ( curval1 == 113977L ) 
	{
	  curval = ( ( curval / 65536L ) * 256 ) + ( curval % 256 ) ;
	  if ( ( a >= 4 ) ) 
	  geqdefine ( p - 128 , 138 , curval ) ;
	  else eqdefine ( p - 128 , 138 , curval ) ;
	} 
	else if ( curval1 == 114701L ) 
	{
	  if ( curval >= 0 ) 
	  {
	    curval1 = curval / 4096 ;
	    curval1 = ( curval1 / 4096 ) * 65536L + curval1 % 4096 ;
	    curval = curval % 4096 ;
	    if ( ( a >= 4 ) ) 
	    delgeqworddefine ( p , curval1 , curval ) ;
	    else deleqworddefine ( p , curval1 , curval ) ;
	  } 
	  else if ( ( a >= 4 ) ) 
	  delgeqworddefine ( p , -1 , curval ) ;
	  else deleqworddefine ( p , -1 , curval ) ;
	} 
	else if ( ( a >= 4 ) ) 
	geqdefine ( p , 138 , curval ) ;
	else eqdefine ( p , 138 , curval ) ;
      } 
    } 
    break ;
  case 99 : 
    {
      p = curchr ;
      scanbigfourbitint () ;
      p = p + curval ;
      scanoptionalequals () ;
      scanfontident () ;
      if ( ( a >= 4 ) ) 
      geqdefine ( p , 138 , curval ) ;
      else eqdefine ( p , 138 , curval ) ;
    } 
    break ;
  case 104 : 
  case 105 : 
  case 106 : 
  case 107 : 
    doregistercommand ( a ) ;
    break ;
  case 113 : 
    {
      scanregisternum () ;
      if ( ( a >= 4 ) ) 
      n = 1073807360L + curval ;
      else n = 1073741824L + curval ;
      scanoptionalequals () ;
      if ( setboxallowed ) 
      scanbox ( n ) ;
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 784 ) ;
	} 
	printesc ( 608 ) ;
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1426 ;
	  helpline [0 ]= 1427 ;
	} 
	error () ;
      } 
    } 
    break ;
  case 92 : 
    alteraux () ;
    break ;
  case 93 : 
    alterprevgraf () ;
    break ;
  case 94 : 
    alterpagesofar () ;
    break ;
  case 95 : 
    alterinteger () ;
    break ;
  case 96 : 
    alterboxdimen () ;
    break ;
  case 97 : 
    {
      q = curchr ;
      scanoptionalequals () ;
      scanint () ;
      n = curval ;
      if ( n <= 0 ) 
      p = -1073741823L ;
      else if ( q > 50458L ) 
      {
	n = ( curval / 2 ) + 1 ;
	p = getnode ( 2 * n + 1 ) ;
	mem [p ].hh .v.LH = n ;
	n = curval ;
	mem [p + 1 ].cint = n ;
	{register integer for_end; j = p + 2 ;for_end = p + n + 1 ; if ( j 
	<= for_end) do 
	  {
	    scanint () ;
	    mem [j ].cint = curval ;
	  } 
	while ( j++ < for_end ) ;} 
	if ( ! odd ( n ) ) 
	mem [p + n + 2 ].cint = 0 ;
      } 
      else {
	  
	p = getnode ( 2 * n + 1 ) ;
	mem [p ].hh .v.LH = n ;
	{register integer for_end; j = 1 ;for_end = n ; if ( j <= for_end) 
	do 
	  {
	    scandimen ( false , false , false ) ;
	    mem [p + 2 * j - 1 ].cint = curval ;
	    scandimen ( false , false , false ) ;
	    mem [p + 2 * j ].cint = curval ;
	  } 
	while ( j++ < for_end ) ;} 
      } 
      if ( ( a >= 4 ) ) 
      geqdefine ( q , 136 , p ) ;
      else eqdefine ( q , 136 , p ) ;
    } 
    break ;
  case 114 : 
    if ( curchr == 1 ) 
    {
	;
#ifdef INITEX
      if ( iniversion ) 
      {
	newpatterns () ;
	goto lab30 ;
      } 
#endif /* INITEX */
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1431 ) ;
      } 
      helpptr = 0 ;
      error () ;
      do {
	  gettoken () ;
      } while ( ! ( curcmd == 2 ) ) ;
      return ;
    } 
    else {
	
      newhyphexceptions () ;
      goto lab30 ;
    } 
    break ;
  case 87 : 
    {
      findfontdimen ( true ) ;
      k = curval ;
      scanoptionalequals () ;
      scandimen ( false , false , false ) ;
      fontinfo [k ].cint = curval ;
    } 
    break ;
  case 88 : 
    {
      n = curchr ;
      scanfontident () ;
      f = curval ;
      scanoptionalequals () ;
      scanint () ;
      if ( n == 0 ) 
      hyphenchar [f ]= curval ;
      else skewchar [f ]= curval ;
    } 
    break ;
  case 103 : 
  case 102 : 
  case 101 : 
    newfont ( a ) ;
    break ;
  case 115 : 
    newinteraction () ;
    break ;
  case 91 : 
    {
      p = curchr ;
      scanint () ;
      n = curval ;
      scanoptionalequals () ;
      scanint () ;
      if ( ! ischarkanji ( curval ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1669 ) ;
	} 
	if ( curval < 0 ) 
	printint ( curval ) ;
	else printhex ( curval ) ;
	printchar ( 41 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1670 ;
	} 
	error () ;
	return ;
      } 
      else if ( ( n < 0 ) || ( n > 9 ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1671 ) ;
	} 
	printint ( n ) ;
	printchar ( 41 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1670 ;
	} 
	error () ;
	return ;
      } 
      else if ( ( a >= 4 ) ) 
      geqdefine ( 78127L + n , n , toDVI ( curval ) ) ;
      else eqdefine ( 78127L + n , n , toDVI ( curval ) ) ;
    } 
    break ;
  case 116 : 
    {
      if ( curchr < 2 ) 
      p = 51756L ;
      else {
	  
	p = 51757L ;
	curchr = ( curchr % 2 ) ;
      } 
      if ( ( a >= 4 ) ) 
      geqdefine ( p , 138 , curchr ) ;
      else eqdefine ( p , 138 , curchr ) ;
    } 
    break ;
  case 117 : 
    if ( ( a >= 4 ) ) 
    geqdefine ( 51758L , 138 , curchr ) ;
    else eqdefine ( 51758L , 138 , curchr ) ;
    break ;
  case 90 : 
    {
      p = curchr ;
      scanint () ;
      n = curval ;
      scanoptionalequals () ;
      scanint () ;
      if ( ischarkanji ( n ) ) 
      {
	j = getinhibitpos ( n , 0 ) ;
	if ( ( j != 10000 ) && ( curval > 2 ) ) 
	{
	  if ( ( a >= 4 ) || ( curlevel == 1 ) ) 
	  curval = 4 ;
	  else curval = 3 ;
	} 
	else if ( j == 10000 ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1694 ) ;
	  } 
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 1670 ;
	  } 
	  error () ;
	  return ;
	} 
	if ( ( a >= 4 ) ) 
	geqdefine ( 76079L + j , curval , n ) ;
	else eqdefine ( 76079L + j , curval , n ) ;
      } 
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1695 ) ;
	} 
	if ( n < 0 ) 
	printint ( n ) ;
	else printhex ( n ) ;
	printchar ( 41 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1670 ;
	} 
	error () ;
	return ;
      } 
    } 
    break ;
  case 89 : 
    {
      p = curchr ;
      scanint () ;
      n = curval ;
      scanoptionalequals () ;
      scanint () ;
      if ( ischarascii ( n ) || ischarkanji ( n ) ) 
      {
	j = getkinsokupos ( n , 0 ) ;
	if ( ( j != 10000 ) && ( curval == 0 ) && ( ( a >= 4 ) || ( curlevel 
	== 1 ) ) ) {
	    
	  if ( ( a >= 4 ) ) 
	  geqdefine ( 77103L + j , 3 , 0 ) ;
	  else eqdefine ( 77103L + j , 3 , 0 ) ;
	} 
	else {
	    
	  if ( j == 10000 ) 
	  {
	    {
	      if ( interaction == 3 ) 
	      ;
	      if ( filelineerrorstylep ) 
	      printfileline () ;
	      else printnl ( 265 ) ;
	      print ( 1701 ) ;
	    } 
	    {
	      helpptr = 1 ;
	      helpline [0 ]= 1670 ;
	    } 
	    error () ;
	    return ;
	  } 
	  if ( ( p == 1 ) || ( p == 2 ) ) 
	  {
	    if ( ( a >= 4 ) ) 
	    geqdefine ( 77103L + j , p , n ) ;
	    else eqdefine ( 77103L + j , p , n ) ;
	    if ( ( a >= 4 ) ) 
	    geqworddefine ( 115238L + j , curval ) ;
	    else eqworddefine ( 115238L + j , curval ) ;
	  } 
	  else confusion ( 1702 ) ;
	} 
      } 
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1703 ) ;
	} 
	if ( p == 1 ) 
	print ( 456 ) ;
	else if ( p == 2 ) 
	print ( 457 ) ;
	else printchar ( 63 ) ;
	print ( 1704 ) ;
	if ( n < 0 ) 
	printint ( n ) ;
	else printhex ( n ) ;
	printchar ( 41 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1670 ;
	} 
	error () ;
	return ;
      } 
    } 
    break ;
    default: 
    confusion ( 1381 ) ;
    break ;
  } 
  lab30: if ( aftertoken != 0 ) 
  {
    curtok = aftertoken ;
    backinput () ;
    aftertoken = 0 ;
  } 
} 
#ifdef INITEX
void 
storefmtfile ( void ) 
{
  /* 41 42 31 32 */ storefmtfile_regmem 
  integer j, k, l  ;
  halfword p, q  ;
  integer x  ;
  fourquarters w  ;
  ASCIIcode * formatengine  ;
  if ( saveptr != 0 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1472 ) ;
    } 
    {
      helpptr = 1 ;
      helpline [0 ]= 1473 ;
    } 
    {
      if ( interaction == 3 ) 
      interaction = 2 ;
      if ( logopened ) 
      error () ;
	;
#ifdef TEXMF_DEBUG
      if ( interaction > 0 ) 
      debughelp () ;
#endif /* TEXMF_DEBUG */
      history = 3 ;
      jumpout () ;
    } 
  } 
  selector = 21 ;
  print ( 1489 ) ;
  print ( jobname ) ;
  printchar ( 32 ) ;
  printint ( eqtb [114384L ].cint ) ;
  printchar ( 46 ) ;
  printint ( eqtb [114383L ].cint ) ;
  printchar ( 46 ) ;
  printint ( eqtb [114382L ].cint ) ;
  printchar ( 41 ) ;
  if ( interaction == 0 ) 
  selector = 18 ;
  else selector = 19 ;
  {
    if ( poolptr + 1 > poolsize ) 
    overflow ( 260 , poolsize - initpoolptr ) ;
  } 
  formatident = makestring () ;
  packjobname ( 942 ) ;
  while ( ! wopenout ( fmtfile ) ) promptfilename ( 1490 , 942 ) ;
  printnl ( 1491 ) ;
  slowprint ( wmakenamestring ( fmtfile ) ) ;
  {
    decr ( strptr ) ;
    poolptr = strstart [strptr ];
  } 
  printnl ( 349 ) ;
  slowprint ( formatident ) ;
  dumpint ( 1462916184L ) ;
  x = strlen ( enginename ) ;
  formatengine = xmallocarray ( ASCIIcode , x + 4 ) ;
  strcpy ( stringcast ( formatengine ) , enginename ) ;
  {register integer for_end; k = x ;for_end = x + 3 ; if ( k <= for_end) do 
    formatengine [k ]= 0 ;
  while ( k++ < for_end ) ;} 
  x = x + 4 - ( x % 4 ) ;
  dumpint ( x ) ;
  dumpthings ( formatengine [0 ], x ) ;
  libcfree ( formatengine ) ;
  dumpkanji ( fmtfile ) ;
  dumpint ( 457706218L ) ;
  dumpthings ( xord [0 ], 256 ) ;
  dumpthings ( xchr [0 ], 256 ) ;
  dumpthings ( xprn [0 ], 256 ) ;
  dumpint ( 1073741823L ) ;
  dumpint ( hashhigh ) ;
  dumpint ( eTeXmode ) ;
  {register integer for_end; j = 0 ;for_end = -0 ; if ( j <= for_end) do 
    eqtb [114444L + j ].cint = 0 ;
  while ( j++ < for_end ) ;} 
  while ( pseudofiles != -1073741823L ) pseudoclose () ;
  dumpint ( membot ) ;
  dumpint ( memtop ) ;
  dumpint ( 116261L ) ;
  dumpint ( 8501 ) ;
  dumpint ( 607 ) ;
  dumpint ( 1296847960L ) ;
  if ( mltexp ) 
  dumpint ( 1 ) ;
  else dumpint ( 0 ) ;
  dumpint ( poolptr ) ;
  dumpint ( strptr ) ;
  dumpthings ( strstart [0 ], strptr + 1 ) ;
  {register integer for_end; k = 0 ;for_end = strptr ; if ( k <= for_end) do 
    dumpint ( strstart [k ]) ;
  while ( k++ < for_end ) ;} 
  k = 0 ;
  while ( k + 4 < poolptr ) {
      
    w .b0 = strpool [k ];
    w .b1 = strpool [k + 1 ];
    w .b2 = strpool [k + 2 ];
    w .b3 = strpool [k + 3 ];
    dumpqqqq ( w ) ;
    k = k + 4 ;
  } 
  k = poolptr - 4 ;
  w .b0 = strpool [k ];
  w .b1 = strpool [k + 1 ];
  w .b2 = strpool [k + 2 ];
  w .b3 = strpool [k + 3 ];
  dumpqqqq ( w ) ;
  println () ;
  printint ( strptr ) ;
  print ( 1474 ) ;
  printint ( poolptr ) ;
  sortavail () ;
  varused = 0 ;
  dumpint ( lomemmax ) ;
  dumpint ( rover ) ;
  if ( ( eTeXmode == 1 ) ) 
  {register integer for_end; k = 0 ;for_end = 5 ; if ( k <= for_end) do 
    dumpint ( saroot [k ]) ;
  while ( k++ < for_end ) ;} 
  p = membot ;
  q = rover ;
  x = 0 ;
  do {
      dumpthings ( mem [p ], q + 2 - p ) ;
    x = x + q + 2 - p ;
    varused = varused + q - p ;
    p = q + mem [q ].hh .v.LH ;
    q = mem [q + 1 ].hh .v.RH ;
  } while ( ! ( q == rover ) ) ;
  varused = varused + lomemmax - p ;
  dynused = memend + 1 - himemmin ;
  dumpthings ( mem [p ], lomemmax + 1 - p ) ;
  x = x + lomemmax + 1 - p ;
  dumpint ( himemmin ) ;
  dumpint ( avail ) ;
  dumpthings ( mem [himemmin ], memend + 1 - himemmin ) ;
  x = x + memend + 1 - himemmin ;
  p = avail ;
  while ( p != -1073741823L ) {
      
    decr ( dynused ) ;
    p = mem [p ].hh .v.RH ;
  } 
  dumpint ( varused ) ;
  dumpint ( dynused ) ;
  println () ;
  printint ( x ) ;
  print ( 1475 ) ;
  printint ( varused ) ;
  printchar ( 38 ) ;
  printint ( dynused ) ;
  k = 1 ;
  do {
      j = k ;
    while ( j < 114360L ) {
	
      if ( ( eqtb [j ].hh .v.RH == eqtb [j + 1 ].hh .v.RH ) && ( eqtb [j 
      ].hh.b0 == eqtb [j + 1 ].hh.b0 ) && ( eqtb [j ].hh.b1 == eqtb [j + 
      1 ].hh.b1 ) ) 
      goto lab41 ;
      incr ( j ) ;
    } 
    l = 114361L ;
    goto lab31 ;
    lab41: incr ( j ) ;
    l = j ;
    while ( j < 114360L ) {
	
      if ( ( eqtb [j ].hh .v.RH != eqtb [j + 1 ].hh .v.RH ) || ( eqtb [j 
      ].hh.b0 != eqtb [j + 1 ].hh.b0 ) || ( eqtb [j ].hh.b1 != eqtb [j + 
      1 ].hh.b1 ) ) 
      goto lab31 ;
      incr ( j ) ;
    } 
    lab31: dumpint ( l - k ) ;
    dumpthings ( eqtb [k ], l - k ) ;
    k = j + 1 ;
    dumpint ( k - l ) ;
  } while ( ! ( k == 114361L ) ) ;
  do {
      j = k ;
    while ( j < 116261L ) {
	
      if ( ( eqtb [j ].cint == eqtb [j + 1 ].cint ) && ( getintone ( eqtb 
      [j ]) == getintone ( eqtb [j + 1 ]) ) ) 
      goto lab42 ;
      incr ( j ) ;
    } 
    l = 116262L ;
    goto lab32 ;
    lab42: incr ( j ) ;
    l = j ;
    while ( j < 116261L ) {
	
      if ( ( eqtb [j ].cint != eqtb [j + 1 ].cint ) || ( getintone ( eqtb 
      [j ]) != getintone ( eqtb [j + 1 ]) ) ) 
      goto lab32 ;
      incr ( j ) ;
    } 
    lab32: dumpint ( l - k ) ;
    dumpthings ( eqtb [k ], l - k ) ;
    k = j + 1 ;
    dumpint ( k - l ) ;
  } while ( ! ( k > 116261L ) ) ;
  if ( hashhigh > 0 ) 
  dumpthings ( eqtb [116262L ], hashhigh ) ;
  dumpint ( parloc ) ;
  dumpint ( writeloc ) ;
  {register integer for_end; p = 0 ;for_end = 2100 ; if ( p <= for_end) do 
    dumphh ( prim [p ]) ;
  while ( p++ < for_end ) ;} 
  dumpint ( hashused ) ;
  cscount = 38809L - hashused + hashhigh ;
  {register integer for_end; p = 23810 ;for_end = hashused ; if ( p <= 
  for_end) do 
    if ( hash [p ].v.RH != 0 ) 
    {
      dumpint ( p ) ;
      dumphh ( hash [p ]) ;
      incr ( cscount ) ;
    } 
  while ( p++ < for_end ) ;} 
  dumpthings ( hash [hashused + 1 ], 49923L - hashused ) ;
  if ( hashhigh > 0 ) 
  dumpthings ( hash [116262L ], hashhigh ) ;
  dumpint ( cscount ) ;
  println () ;
  printint ( cscount ) ;
  print ( 1476 ) ;
  dumpint ( fmemptr ) ;
  dumpthings ( fontinfo [0 ], fmemptr ) ;
  dumpint ( fontptr ) ;
  {
    dumpthings ( fontdir [0 ], fontptr + 1 ) ;
    dumpthings ( fontenc [0 ], fontptr + 1 ) ;
    dumpthings ( fontnumext [0 ], fontptr + 1 ) ;
    dumpthings ( fontcheck [0 ], fontptr + 1 ) ;
    dumpthings ( fontsize [0 ], fontptr + 1 ) ;
    dumpthings ( fontdsize [0 ], fontptr + 1 ) ;
    dumpthings ( fontparams [0 ], fontptr + 1 ) ;
    dumpthings ( hyphenchar [0 ], fontptr + 1 ) ;
    dumpthings ( skewchar [0 ], fontptr + 1 ) ;
    dumpthings ( fontname [0 ], fontptr + 1 ) ;
    dumpthings ( fontarea [0 ], fontptr + 1 ) ;
    dumpthings ( fontbc [0 ], fontptr + 1 ) ;
    dumpthings ( fontec [0 ], fontptr + 1 ) ;
    dumpthings ( ctypebase [0 ], fontptr + 1 ) ;
    dumpthings ( charbase [0 ], fontptr + 1 ) ;
    dumpthings ( widthbase [0 ], fontptr + 1 ) ;
    dumpthings ( heightbase [0 ], fontptr + 1 ) ;
    dumpthings ( depthbase [0 ], fontptr + 1 ) ;
    dumpthings ( italicbase [0 ], fontptr + 1 ) ;
    dumpthings ( ligkernbase [0 ], fontptr + 1 ) ;
    dumpthings ( kernbase [0 ], fontptr + 1 ) ;
    dumpthings ( extenbase [0 ], fontptr + 1 ) ;
    dumpthings ( parambase [0 ], fontptr + 1 ) ;
    dumpthings ( fontglue [0 ], fontptr + 1 ) ;
    dumpthings ( bcharlabel [0 ], fontptr + 1 ) ;
    dumpthings ( fontbchar [0 ], fontptr + 1 ) ;
    dumpthings ( fontfalsebchar [0 ], fontptr + 1 ) ;
    {register integer for_end; k = 0 ;for_end = fontptr ; if ( k <= for_end) 
    do 
      {
	printnl ( 1480 ) ;
	printesc ( hash [40923L + k ].v.RH ) ;
	printchar ( 61 ) ;
	printfilename ( fontname [k ], fontarea [k ], 349 ) ;
	if ( fontsize [k ]!= fontdsize [k ]) 
	{
	  print ( 888 ) ;
	  printscaled ( fontsize [k ]) ;
	  print ( 425 ) ;
	} 
      } 
    while ( k++ < for_end ) ;} 
  } 
  println () ;
  printint ( fmemptr - 7 ) ;
  print ( 1477 ) ;
  printint ( fontptr - 0 ) ;
  if ( fontptr != 1 ) 
  print ( 1478 ) ;
  else print ( 1479 ) ;
  dumpint ( hyphcount ) ;
  if ( hyphnext <= 607 ) 
  hyphnext = hyphsize ;
  dumpint ( hyphnext ) ;
  {register integer for_end; k = 0 ;for_end = hyphsize ; if ( k <= for_end) 
  do 
    if ( hyphword [k ]!= 0 ) 
    {
      dumpint ( k + 65536L * hyphlink [k ]) ;
      dumpint ( hyphword [k ]) ;
      dumpint ( hyphlist [k ]) ;
    } 
  while ( k++ < for_end ) ;} 
  println () ;
  printint ( hyphcount ) ;
  if ( hyphcount != 1 ) 
  print ( 1481 ) ;
  else print ( 1482 ) ;
  if ( trienotready ) 
  inittrie () ;
  dumpint ( triemax ) ;
  dumpint ( hyphstart ) ;
  dumpthings ( trietrl [0 ], triemax + 1 ) ;
  dumpthings ( trietro [0 ], triemax + 1 ) ;
  dumpthings ( trietrc [0 ], triemax + 1 ) ;
  dumpint ( trieopptr ) ;
  dumpthings ( hyfdistance [1 ], trieopptr ) ;
  dumpthings ( hyfnum [1 ], trieopptr ) ;
  dumpthings ( hyfnext [1 ], trieopptr ) ;
  printnl ( 1483 ) ;
  printint ( triemax ) ;
  print ( 1484 ) ;
  printint ( trieopptr ) ;
  if ( trieopptr != 1 ) 
  print ( 1485 ) ;
  else print ( 1486 ) ;
  print ( 1487 ) ;
  printint ( trieopsize ) ;
  {register integer for_end; k = 255 ;for_end = 0 ; if ( k >= for_end) do 
    if ( trieused [k ]> 0 ) 
    {
      printnl ( 958 ) ;
      printint ( trieused [k ]) ;
      print ( 1488 ) ;
      printint ( k ) ;
      dumpint ( k ) ;
      dumpint ( trieused [k ]) ;
    } 
  while ( k-- > for_end ) ;} 
  dumpint ( interaction ) ;
  dumpint ( formatident ) ;
  dumpint ( 69069L ) ;
  eqtb [114392L ].cint = 0 ;
  wclose ( fmtfile ) ;
} 
#endif /* INITEX */
boolean 
loadfmtfile ( void ) 
{
  /* 6666 10 */ register boolean Result; loadfmtfile_regmem 
  integer j, k  ;
  halfword p, q  ;
  integer x  ;
  fourquarters w  ;
  ASCIIcode * formatengine  ;
  ASCIIcode dummyxord  ;
  extASCIIcode dummyxchr  ;
  ASCIIcode dummyxprn  ;
	;
#ifdef INITEX
  if ( iniversion ) 
  {
    libcfree ( fontinfo ) ;
    libcfree ( strpool ) ;
    libcfree ( strstart ) ;
    libcfree ( yhash ) ;
    libcfree ( zeqtb ) ;
    libcfree ( yzmem ) ;
  } 
#endif /* INITEX */
  undumpint ( x ) ;
  if ( debugformatfile ) 
  {
    fprintf ( stderr , "%s%s",  "fmtdebug:" , "format magic number" ) ;
    fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
  } 
  if ( x != 1462916184L ) 
  goto lab6666 ;
  undumpint ( x ) ;
  if ( debugformatfile ) 
  {
    fprintf ( stderr , "%s%s",  "fmtdebug:" , "engine name size" ) ;
    fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
  } 
  if ( ( x < 0 ) || ( x > 256 ) ) 
  goto lab6666 ;
  formatengine = xmallocarray ( ASCIIcode , x ) ;
  undumpthings ( formatengine [0 ], x ) ;
  formatengine [x - 1 ]= 0 ;
  if ( strcmp ( enginename , stringcast ( formatengine ) ) ) 
  {
    ;
    fprintf ( stdout , "%s%s%s%s\n",  "---! " , stringcast ( nameoffile + 1 ) ,     " was written by " , formatengine ) ;
    libcfree ( formatengine ) ;
    goto lab6666 ;
  } 
  libcfree ( formatengine ) ;
  undumpkanji ( fmtfile ) ;
  undumpint ( x ) ;
  if ( debugformatfile ) 
  {
    fprintf ( stderr , "%s%s",  "fmtdebug:" , "string pool checksum" ) ;
    fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
  } 
  if ( x != 457706218L ) 
  {
    ;
    fprintf ( stdout , "%s%s%s\n",  "---! " , stringcast ( nameoffile + 1 ) ,     " made by different executable version, strings are different" ) ;
    goto lab6666 ;
  } 
  if ( translatefilename ) 
  {
    {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
      undumpthings ( dummyxord , 1 ) ;
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
      undumpthings ( dummyxchr , 1 ) ;
    while ( k++ < for_end ) ;} 
    {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
      undumpthings ( dummyxprn , 1 ) ;
    while ( k++ < for_end ) ;} 
  } 
  else {
      
    undumpthings ( xord [0 ], 256 ) ;
    undumpthings ( xchr [0 ], 256 ) ;
    undumpthings ( xprn [0 ], 256 ) ;
    if ( eightbitp ) 
    {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
      xprn [k ]= 1 ;
    while ( k++ < for_end ) ;} 
  } 
  {register integer for_end; k = 256 ;for_end = 511 ; if ( k <= for_end) do 
    xchr [k ]= k ;
  while ( k++ < for_end ) ;} 
  undumpint ( x ) ;
  if ( x != 1073741823L ) 
  goto lab6666 ;
  undumpint ( hashhigh ) ;
  if ( ( hashhigh < 0 ) || ( hashhigh > suphashextra ) ) 
  goto lab6666 ;
  if ( hashextra < hashhigh ) 
  hashextra = hashhigh ;
  eqtbtop = 116261L + hashextra ;
  if ( hashextra == 0 ) 
  hashtop = 49924L ;
  else hashtop = eqtbtop ;
  yhash = xmallocarray ( twohalves , 1 + hashtop - hashoffset ) ;
  hash = yhash - hashoffset ;
  hash [23810 ].v.LH = 0 ;
  hash [23810 ].v.RH = 0 ;
  {register integer for_end; x = 23811 ;for_end = hashtop ; if ( x <= 
  for_end) do 
    hash [x ]= hash [23810 ];
  while ( x++ < for_end ) ;} 
  zeqtb = xmallocarray ( memoryword , eqtbtop + 1 ) ;
  eqtb = zeqtb ;
  eqtb [49924L ].hh.b0 = 119 ;
  eqtb [49924L ].hh .v.RH = -1073741823L ;
  eqtb [49924L ].hh.b1 = 0 ;
  {register integer for_end; x = 116262L ;for_end = eqtbtop ; if ( x <= 
  for_end) do 
    eqtb [x ]= eqtb [49924L ];
  while ( x++ < for_end ) ;} 
  {
    undumpint ( x ) ;
    if ( ( x < 0 ) || ( x > 1 ) ) 
    goto lab6666 ;
    else eTeXmode = x ;
  } 
  if ( ( eTeXmode == 1 ) ) 
  {
    maxregnum = 65535L ;
    maxreghelpline = 1646 ;
  } 
  else {
      
    maxregnum = 255 ;
    maxreghelpline = 792 ;
  } 
  undumpint ( x ) ;
  if ( debugformatfile ) 
  {
    fprintf ( stderr , "%s%s",  "fmtdebug:" , "mem_bot" ) ;
    fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
  } 
  if ( x != membot ) 
  goto lab6666 ;
  undumpint ( memtop ) ;
  if ( debugformatfile ) 
  {
    fprintf ( stderr , "%s%s",  "fmtdebug:" , "mem_top" ) ;
    fprintf ( stderr , "%s%ld\n",  " = " , (long)memtop ) ;
  } 
  if ( membot + 1100 > memtop ) 
  goto lab6666 ;
  curlist .headfield = memtop - 1 ;
  curlist .tailfield = memtop - 1 ;
  pagetail = memtop - 2 ;
  memmin = membot - extramembot ;
  memmax = memtop + extramemtop ;
  yzmem = xmallocarray ( memoryword , memmax - memmin + 1 ) ;
  zmem = yzmem - memmin ;
  mem = zmem ;
  undumpint ( x ) ;
  if ( x != 116261L ) 
  goto lab6666 ;
  undumpint ( x ) ;
  if ( x != 8501 ) 
  goto lab6666 ;
  undumpint ( x ) ;
  if ( x != 607 ) 
  goto lab6666 ;
  undumpint ( x ) ;
  if ( x != 1296847960L ) 
  goto lab6666 ;
  undumpint ( x ) ;
  if ( x == 1 ) 
  mltexenabledp = true ;
  else if ( x != 0 ) 
  goto lab6666 ;
  {
    undumpint ( x ) ;
    if ( x < 0 ) 
    goto lab6666 ;
    if ( x > suppoolsize - poolfree ) 
    {
      ;
      fprintf ( stdout , "%s%s\n",  "---! Must increase the " , "string pool size" ) ;
      goto lab6666 ;
    } 
    else if ( debugformatfile ) 
    {
      fprintf ( stderr , "%s%s",  "fmtdebug:" , "string pool size" ) ;
      fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
    } 
    poolptr = x ;
  } 
  if ( poolsize < poolptr + poolfree ) 
  poolsize = poolptr + poolfree ;
  {
    undumpint ( x ) ;
    if ( x < 0 ) 
    goto lab6666 ;
    if ( x > supmaxstrings - stringsfree ) 
    {
      ;
      fprintf ( stdout , "%s%s\n",  "---! Must increase the " , "sup strings" ) ;
      goto lab6666 ;
    } 
    else if ( debugformatfile ) 
    {
      fprintf ( stderr , "%s%s",  "fmtdebug:" , "sup strings" ) ;
      fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
    } 
    strptr = x ;
  } 
  if ( maxstrings < strptr + stringsfree ) 
  maxstrings = strptr + stringsfree ;
  strstart = xmallocarray ( poolpointer , maxstrings ) ;
  undumpcheckedthings ( 0 , poolptr , strstart [0 ], strptr + 1 ) ;
  strpool = xmallocarray ( packedASCIIcode , poolsize ) ;
  {register integer for_end; k = 0 ;for_end = strptr ; if ( k <= for_end) do 
    {
      undumpint ( x ) ;
      if ( ( x < 0 ) || ( x > poolptr ) ) 
      goto lab6666 ;
      else strstart [k ]= x ;
    } 
  while ( k++ < for_end ) ;} 
  k = 0 ;
  while ( k + 4 < poolptr ) {
      
    undumpqqqq ( w ) ;
    strpool [k ]= w .b0 ;
    strpool [k + 1 ]= w .b1 ;
    strpool [k + 2 ]= w .b2 ;
    strpool [k + 3 ]= w .b3 ;
    k = k + 4 ;
  } 
  k = poolptr - 4 ;
  undumpqqqq ( w ) ;
  strpool [k ]= w .b0 ;
  strpool [k + 1 ]= w .b1 ;
  strpool [k + 2 ]= w .b2 ;
  strpool [k + 3 ]= w .b3 ;
  initstrptr = strptr ;
  initpoolptr = poolptr ;
  {
    undumpint ( x ) ;
    if ( ( x < membot + 1023 ) || ( x > memtop - 15 ) ) 
    goto lab6666 ;
    else lomemmax = x ;
  } 
  {
    undumpint ( x ) ;
    if ( ( x < membot + 24 ) || ( x > lomemmax ) ) 
    goto lab6666 ;
    else rover = x ;
  } 
  if ( ( eTeXmode == 1 ) ) 
  {register integer for_end; k = 0 ;for_end = 5 ; if ( k <= for_end) do 
    {
      undumpint ( x ) ;
      if ( ( x < -1073741823L ) || ( x > lomemmax ) ) 
      goto lab6666 ;
      else saroot [k ]= x ;
    } 
  while ( k++ < for_end ) ;} 
  p = membot ;
  q = rover ;
  do {
      undumpthings ( mem [p ], q + 2 - p ) ;
    if ( ( mem [q ].hh .v.LH > lomemmax - q ) || ( mem [q + 1 ].hh .v.RH > 
    lomemmax ) || ( ( q >= mem [q + 1 ].hh .v.RH ) && ( mem [q + 1 ].hh 
    .v.RH != rover ) ) ) 
    goto lab6666 ;
    p = q + mem [q ].hh .v.LH ;
    q = mem [q + 1 ].hh .v.RH ;
  } while ( ! ( q == rover ) ) ;
  undumpthings ( mem [p ], lomemmax + 1 - p ) ;
  if ( memmin < membot - 2 ) 
  {
    p = mem [rover + 1 ].hh .v.LH ;
    q = memmin + 1 ;
    mem [memmin ].hh .v.RH = -1073741823L ;
    mem [memmin ].hh .v.LH = -1073741823L ;
    mem [p + 1 ].hh .v.RH = q ;
    mem [rover + 1 ].hh .v.LH = q ;
    mem [q + 1 ].hh .v.RH = rover ;
    mem [q + 1 ].hh .v.LH = p ;
    mem [q ].hh .v.RH = 1073741823L ;
    mem [q ].hh .v.LH = membot - q ;
  } 
  {
    undumpint ( x ) ;
    if ( ( x < lomemmax + 1 ) || ( x > memtop - 14 ) ) 
    goto lab6666 ;
    else himemmin = x ;
  } 
  {
    undumpint ( x ) ;
    if ( ( x < -1073741823L ) || ( x > memtop ) ) 
    goto lab6666 ;
    else avail = x ;
  } 
  memend = memtop ;
  undumpthings ( mem [himemmin ], memend + 1 - himemmin ) ;
  undumpint ( varused ) ;
  undumpint ( dynused ) ;
  k = 1 ;
  do {
      undumpint ( x ) ;
    if ( ( x < 1 ) || ( k + x > 116262L ) ) 
    goto lab6666 ;
    undumpthings ( eqtb [k ], x ) ;
    k = k + x ;
    undumpint ( x ) ;
    if ( ( x < 0 ) || ( k + x > 116262L ) ) 
    goto lab6666 ;
    {register integer for_end; j = k ;for_end = k + x - 1 ; if ( j <= 
    for_end) do 
      eqtb [j ]= eqtb [k - 1 ];
    while ( j++ < for_end ) ;} 
    k = k + x ;
  } while ( ! ( k > 116261L ) ) ;
  if ( hashhigh > 0 ) 
  undumpthings ( eqtb [116262L ], hashhigh ) ;
  undumpint ( parloc ) ;
  partoken = 536870911L + parloc ;
  {
    undumpint ( x ) ;
    if ( ( x < 23810 ) || ( x > hashtop ) ) 
    goto lab6666 ;
    else
    writeloc = x ;
  } 
  {register integer for_end; p = 0 ;for_end = 2100 ; if ( p <= for_end) do 
    undumphh ( prim [p ]) ;
  while ( p++ < for_end ) ;} 
  {
    undumpint ( x ) ;
    if ( ( x < 23810 ) || ( x > 38810L ) ) 
    goto lab6666 ;
    else hashused = x ;
  } 
  p = 23809 ;
  do {
      { 
      undumpint ( x ) ;
      if ( ( x < p + 1 ) || ( x > hashused ) ) 
      goto lab6666 ;
      else p = x ;
    } 
    undumphh ( hash [p ]) ;
  } while ( ! ( p == hashused ) ) ;
  undumpthings ( hash [hashused + 1 ], 49923L - hashused ) ;
  if ( debugformatfile ) 
  {
    printcsnames ( 23810 , 49923L ) ;
  } 
  if ( hashhigh > 0 ) 
  {
    undumpthings ( hash [116262L ], hashhigh ) ;
    if ( debugformatfile ) 
    {
      printcsnames ( 116262L , hashhigh - ( 116262L ) ) ;
    } 
  } 
  undumpint ( cscount ) ;
  {
    undumpint ( x ) ;
    if ( x < 7 ) 
    goto lab6666 ;
    if ( x > supfontmemsize ) 
    {
      ;
      fprintf ( stdout , "%s%s\n",  "---! Must increase the " , "font mem size" ) ;
      goto lab6666 ;
    } 
    else if ( debugformatfile ) 
    {
      fprintf ( stderr , "%s%s",  "fmtdebug:" , "font mem size" ) ;
      fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
    } 
    fmemptr = x ;
  } 
  if ( fmemptr > fontmemsize ) 
  fontmemsize = fmemptr ;
  fontinfo = xmallocarray ( memoryword , fontmemsize ) ;
  undumpthings ( fontinfo [0 ], fmemptr ) ;
  {
    undumpint ( x ) ;
    if ( x < 0 ) 
    goto lab6666 ;
    if ( x > 9000 ) 
    {
      ;
      fprintf ( stdout , "%s%s\n",  "---! Must increase the " , "font max" ) ;
      goto lab6666 ;
    } 
    else if ( debugformatfile ) 
    {
      fprintf ( stderr , "%s%s",  "fmtdebug:" , "font max" ) ;
      fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
    } 
    fontptr = x ;
  } 
  {
    fontdir = xmallocarray ( eightbits , fontmax ) ;
    fontenc = xmallocarray ( eightbits , fontmax ) ;
    fontnumext = xmallocarray ( integer , fontmax ) ;
    fontcheck = xmallocarray ( fourquarters , fontmax ) ;
    fontsize = xmallocarray ( scaled , fontmax ) ;
    fontdsize = xmallocarray ( scaled , fontmax ) ;
    fontparams = xmallocarray ( fontindex , fontmax ) ;
    fontname = xmallocarray ( strnumber , fontmax ) ;
    fontarea = xmallocarray ( strnumber , fontmax ) ;
    fontbc = xmallocarray ( sixteenbits , fontmax ) ;
    fontec = xmallocarray ( sixteenbits , fontmax ) ;
    fontglue = xmallocarray ( halfword , fontmax ) ;
    hyphenchar = xmallocarray ( integer , fontmax ) ;
    skewchar = xmallocarray ( integer , fontmax ) ;
    bcharlabel = xmallocarray ( fontindex , fontmax ) ;
    fontbchar = xmallocarray ( ninebits , fontmax ) ;
    fontfalsebchar = xmallocarray ( ninebits , fontmax ) ;
    ctypebase = xmallocarray ( integer , fontmax ) ;
    charbase = xmallocarray ( integer , fontmax ) ;
    widthbase = xmallocarray ( integer , fontmax ) ;
    heightbase = xmallocarray ( integer , fontmax ) ;
    depthbase = xmallocarray ( integer , fontmax ) ;
    italicbase = xmallocarray ( integer , fontmax ) ;
    ligkernbase = xmallocarray ( integer , fontmax ) ;
    kernbase = xmallocarray ( integer , fontmax ) ;
    extenbase = xmallocarray ( integer , fontmax ) ;
    parambase = xmallocarray ( integer , fontmax ) ;
    undumpthings ( fontdir [0 ], fontptr + 1 ) ;
    undumpthings ( fontenc [0 ], fontptr + 1 ) ;
    undumpthings ( fontnumext [0 ], fontptr + 1 ) ;
    undumpthings ( fontcheck [0 ], fontptr + 1 ) ;
    undumpthings ( fontsize [0 ], fontptr + 1 ) ;
    undumpthings ( fontdsize [0 ], fontptr + 1 ) ;
    undumpcheckedthings ( -1073741823L , 1073741823L , fontparams [0 ], 
    fontptr + 1 ) ;
    undumpthings ( hyphenchar [0 ], fontptr + 1 ) ;
    undumpthings ( skewchar [0 ], fontptr + 1 ) ;
    undumpuppercheckthings ( strptr , fontname [0 ], fontptr + 1 ) ;
    undumpuppercheckthings ( strptr , fontarea [0 ], fontptr + 1 ) ;
    undumpthings ( fontbc [0 ], fontptr + 1 ) ;
    undumpthings ( fontec [0 ], fontptr + 1 ) ;
    undumpthings ( ctypebase [0 ], fontptr + 1 ) ;
    undumpthings ( charbase [0 ], fontptr + 1 ) ;
    undumpthings ( widthbase [0 ], fontptr + 1 ) ;
    undumpthings ( heightbase [0 ], fontptr + 1 ) ;
    undumpthings ( depthbase [0 ], fontptr + 1 ) ;
    undumpthings ( italicbase [0 ], fontptr + 1 ) ;
    undumpthings ( ligkernbase [0 ], fontptr + 1 ) ;
    undumpthings ( kernbase [0 ], fontptr + 1 ) ;
    undumpthings ( extenbase [0 ], fontptr + 1 ) ;
    undumpthings ( parambase [0 ], fontptr + 1 ) ;
    undumpcheckedthings ( -1073741823L , lomemmax , fontglue [0 ], fontptr + 
    1 ) ;
    undumpcheckedthings ( 0 , fmemptr - 1 , bcharlabel [0 ], fontptr + 1 ) ;
    undumpcheckedthings ( 0 , 11904 , fontbchar [0 ], fontptr + 1 ) ;
    undumpcheckedthings ( 0 , 11904 , fontfalsebchar [0 ], fontptr + 1 ) ;
  } 
  {
    undumpint ( x ) ;
    if ( x < 0 ) 
    goto lab6666 ;
    if ( x > hyphsize ) 
    {
      ;
      fprintf ( stdout , "%s%s\n",  "---! Must increase the " , "hyph_size" ) ;
      goto lab6666 ;
    } 
    else if ( debugformatfile ) 
    {
      fprintf ( stderr , "%s%s",  "fmtdebug:" , "hyph_size" ) ;
      fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
    } 
    hyphcount = x ;
  } 
  {
    undumpint ( x ) ;
    if ( x < 607 ) 
    goto lab6666 ;
    if ( x > hyphsize ) 
    {
      ;
      fprintf ( stdout , "%s%s\n",  "---! Must increase the " , "hyph_size" ) ;
      goto lab6666 ;
    } 
    else if ( debugformatfile ) 
    {
      fprintf ( stderr , "%s%s",  "fmtdebug:" , "hyph_size" ) ;
      fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
    } 
    hyphnext = x ;
  } 
  j = 0 ;
  {register integer for_end; k = 1 ;for_end = hyphcount ; if ( k <= for_end) 
  do 
    {
      undumpint ( j ) ;
      if ( j < 0 ) 
      goto lab6666 ;
      if ( j > 65535L ) 
      {
	hyphnext = j / 65536L ;
	j = j - hyphnext * 65536L ;
      } 
      else hyphnext = 0 ;
      if ( ( j >= hyphsize ) || ( hyphnext > hyphsize ) ) 
      goto lab6666 ;
      hyphlink [j ]= hyphnext ;
      {
	undumpint ( x ) ;
	if ( ( x < 0 ) || ( x > strptr ) ) 
	goto lab6666 ;
	else hyphword [j ]= x ;
      } 
      {
	undumpint ( x ) ;
	if ( ( x < -1073741823L ) || ( x > 1073741823L ) ) 
	goto lab6666 ;
	else hyphlist [j ]= x ;
      } 
    } 
  while ( k++ < for_end ) ;} 
  incr ( j ) ;
  if ( j < 607 ) 
  j = 607 ;
  hyphnext = j ;
  if ( hyphnext >= hyphsize ) 
  hyphnext = 607 ;
  else if ( hyphnext >= 607 ) 
  incr ( hyphnext ) ;
  {
    undumpint ( x ) ;
    if ( x < 0 ) 
    goto lab6666 ;
    if ( x > triesize ) 
    {
      ;
      fprintf ( stdout , "%s%s\n",  "---! Must increase the " , "trie size" ) ;
      goto lab6666 ;
    } 
    else if ( debugformatfile ) 
    {
      fprintf ( stderr , "%s%s",  "fmtdebug:" , "trie size" ) ;
      fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
    } 
    j = x ;
  } 
	;
#ifdef INITEX
  triemax = j ;
#endif /* INITEX */
  {
    undumpint ( x ) ;
    if ( ( x < 0 ) || ( x > j ) ) 
    goto lab6666 ;
    else hyphstart = x ;
  } 
  if ( ! trietrl ) 
  trietrl = xmallocarray ( triepointer , j + 1 ) ;
  undumpthings ( trietrl [0 ], j + 1 ) ;
  if ( ! trietro ) 
  trietro = xmallocarray ( triepointer , j + 1 ) ;
  undumpthings ( trietro [0 ], j + 1 ) ;
  if ( ! trietrc ) 
  trietrc = xmallocarray ( quarterword , j + 1 ) ;
  undumpthings ( trietrc [0 ], j + 1 ) ;
  {
    undumpint ( x ) ;
    if ( x < 0 ) 
    goto lab6666 ;
    if ( x > trieopsize ) 
    {
      ;
      fprintf ( stdout , "%s%s\n",  "---! Must increase the " , "trie op size" ) ;
      goto lab6666 ;
    } 
    else if ( debugformatfile ) 
    {
      fprintf ( stderr , "%s%s",  "fmtdebug:" , "trie op size" ) ;
      fprintf ( stderr , "%s%ld\n",  " = " , (long)x ) ;
    } 
    j = x ;
  } 
	;
#ifdef INITEX
  trieopptr = j ;
#endif /* INITEX */
  undumpthings ( hyfdistance [1 ], j ) ;
  undumpthings ( hyfnum [1 ], j ) ;
  undumpuppercheckthings ( maxtrieop , hyfnext [1 ], j ) ;
	;
#ifdef INITEX
  {register integer for_end; k = 0 ;for_end = 255 ; if ( k <= for_end) do 
    trieused [k ]= 0 ;
  while ( k++ < for_end ) ;} 
#endif /* INITEX */
  k = 256 ;
  while ( j > 0 ) {
      
    {
      undumpint ( x ) ;
      if ( ( x < 0 ) || ( x > k - 1 ) ) 
      goto lab6666 ;
      else k = x ;
    } 
    {
      undumpint ( x ) ;
      if ( ( x < 1 ) || ( x > j ) ) 
      goto lab6666 ;
      else x = x ;
    } 
	;
#ifdef INITEX
    trieused [k ]= x ;
#endif /* INITEX */
    j = j - x ;
    opstart [k ]= j ;
  } 
	;
#ifdef INITEX
  trienotready = false 
#endif /* INITEX */
  ;
  {
    undumpint ( x ) ;
    if ( ( x < 0 ) || ( x > 3 ) ) 
    goto lab6666 ;
    else interaction = x ;
  } 
  if ( interactionoption != 4 ) 
  interaction = interactionoption ;
  {
    undumpint ( x ) ;
    if ( ( x < 0 ) || ( x > strptr ) ) 
    goto lab6666 ;
    else formatident = x ;
  } 
  undumpint ( x ) ;
  if ( x != 69069L ) 
  goto lab6666 ;
  Result = true ;
  return Result ;
  lab6666: ;
  fprintf ( stdout , "%s\n",  "(Fatal format file error; I'm stymied)" ) ;
  Result = false ;
  return Result ;
} 
void 
finalcleanup ( void ) 
{
  /* 10 */ finalcleanup_regmem 
  smallnumber c  ;
  c = curchr ;
  if ( c != 1 ) 
  eqtb [114411L ].cint = -1 ;
  if ( jobname == 0 ) 
  openlogfile () ;
  while ( inputptr > 0 ) if ( curinput .statefield == 0 ) 
  endtokenlist () ;
  else endfilereading () ;
  while ( openparens > 0 ) {
      
    print ( 1493 ) ;
    decr ( openparens ) ;
  } 
  if ( curlevel > 1 ) 
  {
    printnl ( 40 ) ;
    printesc ( 1494 ) ;
    print ( 1495 ) ;
    printint ( curlevel - 1 ) ;
    printchar ( 41 ) ;
    if ( ( eTeXmode == 1 ) ) 
    showsavegroups () ;
  } 
  while ( condptr != -1073741823L ) {
      
    printnl ( 40 ) ;
    printesc ( 1494 ) ;
    print ( 1496 ) ;
    printcmdchr ( 123 , curif ) ;
    if ( ifline != 0 ) 
    {
      print ( 1497 ) ;
      printint ( ifline ) ;
    } 
    print ( 1498 ) ;
    ifline = mem [condptr + 1 ].cint ;
    curif = mem [condptr ].hh.b1 ;
    tempptr = condptr ;
    condptr = mem [condptr ].hh .v.RH ;
    freenode ( tempptr , 2 ) ;
  } 
  if ( history != 0 ) {
      
    if ( ( ( history == 1 ) || ( interaction < 3 ) ) ) {
	
      if ( selector == 19 ) 
      {
	selector = 17 ;
	printnl ( 1499 ) ;
	selector = 19 ;
      } 
    } 
  } 
  if ( c == 1 ) 
  {
	;
#ifdef INITEX
    if ( iniversion ) 
    {
      {register integer for_end; c = 0 ;for_end = 4 ; if ( c <= for_end) do 
	if ( curmark [c ]!= -1073741823L ) 
	deletetokenref ( curmark [c ]) ;
      while ( c++ < for_end ) ;} 
      if ( saroot [6 ]!= -1073741823L ) {
	  
	if ( domarks ( 3 , 0 , saroot [6 ]) ) 
	saroot [6 ]= -1073741823L ;
      } 
      {register integer for_end; c = 2 ;for_end = 3 ; if ( c <= for_end) do 
	flushnodelist ( discptr [c ]) ;
      while ( c++ < for_end ) ;} 
      if ( lastglue != 1073741823L ) 
      deleteglueref ( lastglue ) ;
      storefmtfile () ;
      return ;
    } 
#endif /* INITEX */
    printnl ( 1500 ) ;
    return ;
  } 
} 
#ifdef INITEX
void 
initprim ( void ) 
{
  initprim_regmem 
  nonewcontrolsequence = false ;
  first = 0 ;
  primitive ( 401 , 85 , 49925L ) ;
  primitive ( 402 , 85 , 49926L ) ;
  primitive ( 403 , 85 , 49927L ) ;
  primitive ( 404 , 85 , 49928L ) ;
  primitive ( 405 , 85 , 49929L ) ;
  primitive ( 406 , 85 , 49930L ) ;
  primitive ( 407 , 85 , 49931L ) ;
  primitive ( 408 , 85 , 49932L ) ;
  primitive ( 409 , 85 , 49933L ) ;
  primitive ( 410 , 85 , 49934L ) ;
  primitive ( 411 , 85 , 49935L ) ;
  primitive ( 412 , 85 , 49936L ) ;
  primitive ( 413 , 85 , 49937L ) ;
  primitive ( 414 , 85 , 49938L ) ;
  primitive ( 415 , 85 , 49939L ) ;
  primitive ( 416 , 86 , 49942L ) ;
  primitive ( 417 , 86 , 49943L ) ;
  primitive ( 418 , 86 , 49944L ) ;
  primitive ( 419 , 85 , 49940L ) ;
  primitive ( 420 , 85 , 49941L ) ;
  primitive ( 426 , 82 , 50459L ) ;
  primitive ( 427 , 82 , 50460L ) ;
  primitive ( 428 , 82 , 50461L ) ;
  primitive ( 429 , 82 , 50462L ) ;
  primitive ( 430 , 82 , 50463L ) ;
  primitive ( 431 , 82 , 50464L ) ;
  primitive ( 432 , 82 , 50465L ) ;
  primitive ( 433 , 82 , 50466L ) ;
  primitive ( 434 , 82 , 50467L ) ;
  primitive ( 463 , 83 , 114361L ) ;
  primitive ( 464 , 83 , 114362L ) ;
  primitive ( 465 , 83 , 114363L ) ;
  primitive ( 466 , 83 , 114364L ) ;
  primitive ( 467 , 83 , 114365L ) ;
  primitive ( 468 , 83 , 114366L ) ;
  primitive ( 469 , 83 , 114367L ) ;
  primitive ( 470 , 83 , 114368L ) ;
  primitive ( 471 , 83 , 114369L ) ;
  primitive ( 472 , 83 , 114370L ) ;
  primitive ( 473 , 83 , 114371L ) ;
  primitive ( 474 , 83 , 114372L ) ;
  primitive ( 475 , 83 , 114373L ) ;
  primitive ( 476 , 83 , 114374L ) ;
  primitive ( 477 , 83 , 114375L ) ;
  primitive ( 478 , 83 , 114376L ) ;
  primitive ( 479 , 83 , 114377L ) ;
  primitive ( 480 , 83 , 114378L ) ;
  primitive ( 481 , 83 , 114379L ) ;
  primitive ( 482 , 83 , 114380L ) ;
  primitive ( 483 , 83 , 114381L ) ;
  primitive ( 484 , 83 , 114382L ) ;
  primitive ( 485 , 83 , 114383L ) ;
  primitive ( 486 , 83 , 114384L ) ;
  primitive ( 487 , 83 , 114385L ) ;
  primitive ( 488 , 83 , 114386L ) ;
  primitive ( 489 , 83 , 114387L ) ;
  primitive ( 490 , 83 , 114388L ) ;
  primitive ( 491 , 83 , 114389L ) ;
  primitive ( 492 , 83 , 114390L ) ;
  primitive ( 493 , 83 , 114391L ) ;
  primitive ( 494 , 83 , 114392L ) ;
  primitive ( 495 , 83 , 114393L ) ;
  primitive ( 496 , 83 , 114394L ) ;
  primitive ( 497 , 83 , 114395L ) ;
  primitive ( 498 , 83 , 114396L ) ;
  primitive ( 499 , 83 , 114397L ) ;
  primitive ( 500 , 83 , 114398L ) ;
  primitive ( 501 , 83 , 114399L ) ;
  primitive ( 502 , 83 , 114400L ) ;
  primitive ( 503 , 83 , 114401L ) ;
  primitive ( 504 , 83 , 114402L ) ;
  primitive ( 505 , 83 , 114403L ) ;
  primitive ( 506 , 83 , 114404L ) ;
  primitive ( 507 , 83 , 114405L ) ;
  primitive ( 508 , 83 , 114407L ) ;
  primitive ( 509 , 83 , 114408L ) ;
  primitive ( 510 , 83 , 114409L ) ;
  primitive ( 511 , 83 , 114410L ) ;
  primitive ( 512 , 83 , 114411L ) ;
  primitive ( 513 , 83 , 114406L ) ;
  primitive ( 514 , 83 , 114417L ) ;
  primitive ( 515 , 83 , 114418L ) ;
  primitive ( 516 , 83 , 114419L ) ;
  primitive ( 517 , 83 , 114420L ) ;
  primitive ( 518 , 83 , 114421L ) ;
  primitive ( 519 , 83 , 114422L ) ;
  primitive ( 520 , 83 , 114412L ) ;
  primitive ( 521 , 83 , 114413L ) ;
  primitive ( 522 , 83 , 114414L ) ;
  primitive ( 523 , 83 , 114415L ) ;
  primitive ( 524 , 83 , 114416L ) ;
  if ( mltexp ) 
  {
    mltexenabledp = true ;
    if ( false ) 
    primitive ( 525 , 83 , 114423L ) ;
    primitive ( 526 , 83 , 114424L ) ;
    primitive ( 527 , 83 , 114425L ) ;
  } 
  primitive ( 528 , 83 , 114426L ) ;
  primitive ( 532 , 118 , 0 ) ;
  primitive ( 529 , 83 , 114427L ) ;
  primitive ( 530 , 83 , 114428L ) ;
  primitive ( 535 , 84 , 114957L ) ;
  primitive ( 536 , 84 , 114958L ) ;
  primitive ( 537 , 84 , 114959L ) ;
  primitive ( 538 , 84 , 114960L ) ;
  primitive ( 539 , 84 , 114961L ) ;
  primitive ( 540 , 84 , 114962L ) ;
  primitive ( 541 , 84 , 114963L ) ;
  primitive ( 542 , 84 , 114964L ) ;
  primitive ( 543 , 84 , 114965L ) ;
  primitive ( 544 , 84 , 114966L ) ;
  primitive ( 545 , 84 , 114967L ) ;
  primitive ( 546 , 84 , 114968L ) ;
  primitive ( 547 , 84 , 114969L ) ;
  primitive ( 548 , 84 , 114970L ) ;
  primitive ( 549 , 84 , 114971L ) ;
  primitive ( 550 , 84 , 114972L ) ;
  primitive ( 551 , 84 , 114973L ) ;
  primitive ( 552 , 84 , 114974L ) ;
  primitive ( 553 , 84 , 114975L ) ;
  primitive ( 554 , 84 , 114976L ) ;
  primitive ( 555 , 84 , 114978L ) ;
  primitive ( 556 , 84 , 114979L ) ;
  primitive ( 557 , 84 , 114977L ) ;
  primitive ( 32 , 70 , 0 ) ;
  primitive ( 47 , 50 , 0 ) ;
  primitive ( 572 , 51 , 0 ) ;
  primitive ( 573 , 105 , 0 ) ;
  primitive ( 574 , 46 , 0 ) ;
  primitive ( 575 , 47 , 0 ) ;
  primitive ( 576 , 67 , 0 ) ;
  primitive ( 577 , 21 , 0 ) ;
  primitive ( 578 , 22 , 0 ) ;
  primitive ( 568 , 125 , 0 ) ;
  primitive ( 579 , 15 , 0 ) ;
  primitive ( 580 , 15 , 1 ) ;
  primitive ( 581 , 107 , 0 ) ;
  primitive ( 569 , 73 , 0 ) ;
  primitive ( 582 , 68 , 0 ) ;
  hash [38812L ].v.RH = 582 ;
  eqtb [38812L ]= eqtb [curval ];
  primitive ( 583 , 120 , 0 ) ;
  primitive ( 584 , 101 , 0 ) ;
  primitive ( 585 , 102 , 0 ) ;
  primitive ( 586 , 103 , 0 ) ;
  primitive ( 587 , 87 , 0 ) ;
  primitive ( 588 , 38 , 0 ) ;
  primitive ( 589 , 42 , 0 ) ;
  primitive ( 590 , 45 , 0 ) ;
  primitive ( 341 , 43 , 0 ) ;
  primitive ( 366 , 24 , 0 ) ;
  primitive ( 591 , 52 , 0 ) ;
  primitive ( 592 , 23 , 0 ) ;
  primitive ( 593 , 52 , 1 ) ;
  primitive ( 594 , 23 , 1 ) ;
  primitive ( 595 , 60 , 0 ) ;
  primitive ( 596 , 106 , 0 ) ;
  primitive ( 597 , 40 , 0 ) ;
  primitive ( 598 , 71 , 0 ) ;
  primitive ( 599 , 121 , 0 ) ;
  primitive ( 346 , 61 , 0 ) ;
  primitive ( 600 , 69 , 0 ) ;
  primitive ( 601 , 97 , 50458L ) ;
  primitive ( 602 , 48 , 0 ) ;
  primitive ( 603 , 93 , 0 ) ;
  primitive ( 604 , 72 , 0 ) ;
  primitive ( 605 , 72 , 1 ) ;
  primitive ( 606 , 111 , 0 ) ;
  primitive ( 607 , 0 , 16777216L ) ;
  hash [38817L ].v.RH = 607 ;
  eqtb [38817L ]= eqtb [curval ];
  primitive ( 608 , 113 , 0 ) ;
  primitive ( 609 , 127 , 0 ) ;
  primitive ( 435 , 81 , membot ) ;
  primitive ( 367 , 44 , 0 ) ;
  primitive ( 610 , 39 , 0 ) ;
  primitive ( 611 , 62 , 0 ) ;
  primitive ( 612 , 41 , 0 ) ;
  primitive ( 688 , 13 , 16777216L ) ;
  parloc = curval ;
  partoken = 536870911L + parloc ;
  primitive ( 724 , 122 , 0 ) ;
  primitive ( 725 , 122 , 1 ) ;
  primitive ( 726 , 128 , 0 ) ;
  primitive ( 727 , 128 , 1 ) ;
  primitive ( 728 , 128 , 2 ) ;
  primitive ( 729 , 128 , 3 ) ;
  primitive ( 730 , 128 , 4 ) ;
  primitive ( 533 , 104 , membot + 0 ) ;
  primitive ( 561 , 104 , membot + 1 ) ;
  primitive ( 423 , 104 , membot + 2 ) ;
  primitive ( 424 , 104 , membot + 3 ) ;
  primitive ( 768 , 92 , 120 ) ;
  primitive ( 769 , 92 , 1 ) ;
  primitive ( 770 , 95 , 0 ) ;
  primitive ( 771 , 95 , 1 ) ;
  primitive ( 772 , 96 , 1 ) ;
  primitive ( 773 , 96 , 3 ) ;
  primitive ( 774 , 96 , 2 ) ;
  primitive ( 775 , 78 , 0 ) ;
  primitive ( 776 , 78 , 1 ) ;
  primitive ( 777 , 78 , 2 ) ;
  primitive ( 778 , 78 , 7 ) ;
  primitive ( 779 , 78 , 8 ) ;
  primitive ( 780 , 78 , 9 ) ;
  primitive ( 781 , 78 , 10 ) ;
  primitive ( 782 , 78 , 11 ) ;
  primitive ( 783 , 78 , 12 ) ;
  primitive ( 846 , 126 , 0 ) ;
  primitive ( 847 , 126 , 1 ) ;
  primitive ( 848 , 126 , 3 ) ;
  primitive ( 849 , 126 , 4 ) ;
  primitive ( 850 , 126 , 5 ) ;
  primitive ( 851 , 126 , 2 ) ;
  primitive ( 852 , 126 , 6 ) ;
  primitive ( 853 , 126 , 7 ) ;
  primitive ( 854 , 126 , 8 ) ;
  primitive ( 855 , 126 , 9 ) ;
  primitive ( 856 , 126 , 10 ) ;
  primitive ( 857 , 126 , 11 ) ;
  primitive ( 858 , 126 , 12 ) ;
  primitive ( 859 , 126 , 13 ) ;
  primitive ( 860 , 126 , 14 ) ;
  primitive ( 861 , 126 , 15 ) ;
  primitive ( 862 , 126 , 17 ) ;
  primitive ( 863 , 126 , 28 ) ;
  primitive ( 904 , 123 , 0 ) ;
  primitive ( 905 , 123 , 1 ) ;
  primitive ( 906 , 123 , 2 ) ;
  primitive ( 907 , 123 , 3 ) ;
  primitive ( 908 , 123 , 4 ) ;
  primitive ( 909 , 123 , 5 ) ;
  primitive ( 910 , 123 , 6 ) ;
  primitive ( 911 , 123 , 7 ) ;
  primitive ( 912 , 123 , 8 ) ;
  primitive ( 913 , 123 , 9 ) ;
  primitive ( 914 , 123 , 10 ) ;
  primitive ( 915 , 123 , 11 ) ;
  primitive ( 916 , 123 , 12 ) ;
  primitive ( 917 , 123 , 13 ) ;
  primitive ( 918 , 123 , 14 ) ;
  primitive ( 919 , 123 , 15 ) ;
  primitive ( 920 , 123 , 16 ) ;
  primitive ( 921 , 123 , 22 ) ;
  primitive ( 922 , 123 , 23 ) ;
  primitive ( 923 , 123 , 24 ) ;
  primitive ( 924 , 123 , 25 ) ;
  primitive ( 925 , 123 , 26 ) ;
  primitive ( 926 , 123 , 27 ) ;
  primitive ( 927 , 123 , 28 ) ;
  primitive ( 928 , 123 , 29 ) ;
  primitive ( 929 , 123 , 30 ) ;
  primitive ( 930 , 123 , 31 ) ;
  primitive ( 321 , 124 , 2 ) ;
  hash [38814L ].v.RH = 321 ;
  eqtb [38814L ]= eqtb [curval ];
  primitive ( 933 , 124 , 4 ) ;
  primitive ( 934 , 124 , 3 ) ;
  primitive ( 960 , 100 , 0 ) ;
  hash [40923L ].v.RH = 960 ;
  eqtb [40923L ]= eqtb [curval ];
  primitive ( 1067 , 4 , 16777216L ) ;
  primitive ( 1068 , 5 , 16777217L ) ;
  hash [38811L ].v.RH = 1068 ;
  eqtb [38811L ]= eqtb [curval ];
  primitive ( 1069 , 5 , 16777218L ) ;
  hash [38815L ].v.RH = 1070 ;
  hash [38816L ].v.RH = 1070 ;
  eqtb [38816L ].hh.b0 = 9 ;
  eqtb [38816L ].hh .v.RH = memtop - 11 ;
  eqtb [38816L ].hh.b1 = 1 ;
  eqtb [38815L ]= eqtb [38816L ];
  eqtb [38815L ].hh.b0 = 133 ;
  primitive ( 1139 , 94 , 0 ) ;
  primitive ( 1140 , 94 , 1 ) ;
  primitive ( 1141 , 94 , 2 ) ;
  primitive ( 1142 , 94 , 3 ) ;
  primitive ( 1143 , 94 , 4 ) ;
  primitive ( 1144 , 94 , 5 ) ;
  primitive ( 1145 , 94 , 6 ) ;
  primitive ( 1146 , 94 , 7 ) ;
  primitive ( 1147 , 94 , 8 ) ;
  primitive ( 354 , 14 , 0 ) ;
  primitive ( 1196 , 14 , 1 ) ;
  primitive ( 1197 , 32 , 5 ) ;
  primitive ( 1198 , 32 , 0 ) ;
  primitive ( 1199 , 32 , 1 ) ;
  primitive ( 1200 , 32 , 2 ) ;
  primitive ( 1201 , 32 , 3 ) ;
  primitive ( 1202 , 32 , 4 ) ;
  primitive ( 1203 , 33 , 5 ) ;
  primitive ( 1204 , 33 , 0 ) ;
  primitive ( 1205 , 33 , 1 ) ;
  primitive ( 1206 , 33 , 2 ) ;
  primitive ( 1207 , 33 , 3 ) ;
  primitive ( 1208 , 33 , 4 ) ;
  primitive ( 347 , 34 , 6 ) ;
  primitive ( 351 , 35 , 1 ) ;
  primitive ( 353 , 36 , 99 ) ;
  primitive ( 1226 , 27 , 1 ) ;
  primitive ( 1227 , 27 , 0 ) ;
  primitive ( 1228 , 28 , 1 ) ;
  primitive ( 1229 , 28 , 0 ) ;
  primitive ( 437 , 26 , 0 ) ;
  primitive ( 1230 , 26 , 1 ) ;
  primitive ( 1231 , 26 , 2 ) ;
  primitive ( 1134 , 26 , 3 ) ;
  primitive ( 1232 , 26 , 4 ) ;
  primitive ( 1136 , 26 , 5 ) ;
  primitive ( 1233 , 26 , 124 ) ;
  primitive ( 1234 , 80 , 3 ) ;
  primitive ( 1235 , 80 , 4 ) ;
  primitive ( 1236 , 80 , 1 ) ;
  primitive ( 1237 , 37 , 99 ) ;
  primitive ( 1238 , 37 , 100 ) ;
  primitive ( 1239 , 37 , 101 ) ;
  primitive ( 1240 , 37 , 102 ) ;
  primitive ( 1271 , 49 , 1 ) ;
  primitive ( 1272 , 49 , 0 ) ;
  primitive ( 1283 , 31 , 14 ) ;
  primitive ( 1284 , 31 , 13 ) ;
  primitive ( 1285 , 31 , 12 ) ;
  primitive ( 1286 , 29 , 0 ) ;
  primitive ( 1287 , 29 , 1 ) ;
  primitive ( 1288 , 30 , 0 ) ;
  primitive ( 1289 , 30 , 1 ) ;
  primitive ( 45 , 53 , 1 ) ;
  primitive ( 364 , 53 , 0 ) ;
  primitive ( 1326 , 54 , 0 ) ;
  primitive ( 1327 , 54 , 1 ) ;
  primitive ( 1033 , 56 , 18 ) ;
  primitive ( 1034 , 56 , 19 ) ;
  primitive ( 1035 , 56 , 20 ) ;
  primitive ( 1036 , 56 , 21 ) ;
  primitive ( 1037 , 56 , 22 ) ;
  primitive ( 1038 , 56 , 23 ) ;
  primitive ( 1039 , 56 , 24 ) ;
  primitive ( 1040 , 56 , 25 ) ;
  primitive ( 1042 , 56 , 28 ) ;
  primitive ( 1041 , 56 , 29 ) ;
  primitive ( 1331 , 57 , 0 ) ;
  primitive ( 1046 , 57 , 1 ) ;
  primitive ( 1047 , 57 , 2 ) ;
  primitive ( 1028 , 59 , 0 ) ;
  primitive ( 1029 , 59 , 2 ) ;
  primitive ( 1030 , 59 , 4 ) ;
  primitive ( 1031 , 59 , 6 ) ;
  primitive ( 1349 , 58 , 0 ) ;
  primitive ( 1350 , 58 , 1 ) ;
  primitive ( 1351 , 58 , 2 ) ;
  primitive ( 1352 , 58 , 3 ) ;
  primitive ( 1353 , 58 , 4 ) ;
  primitive ( 1354 , 58 , 5 ) ;
  primitive ( 1043 , 55 , 32 ) ;
  primitive ( 1044 , 55 , 33 ) ;
  hash [38813L ].v.RH = 1044 ;
  eqtb [38813L ]= eqtb [curval ];
  primitive ( 1374 , 108 , 1 ) ;
  primitive ( 1375 , 108 , 2 ) ;
  primitive ( 1376 , 108 , 4 ) ;
  primitive ( 1377 , 112 , 0 ) ;
  primitive ( 1378 , 112 , 1 ) ;
  primitive ( 1379 , 112 , 2 ) ;
  primitive ( 1380 , 112 , 3 ) ;
  primitive ( 1397 , 109 , 0 ) ;
  primitive ( 1398 , 109 , 1 ) ;
  primitive ( 1399 , 110 , 0 ) ;
  primitive ( 1400 , 110 , 9 ) ;
  primitive ( 1401 , 110 , 1 ) ;
  primitive ( 1402 , 110 , 2 ) ;
  primitive ( 1403 , 110 , 3 ) ;
  primitive ( 1404 , 110 , 4 ) ;
  primitive ( 1405 , 110 , 5 ) ;
  primitive ( 1406 , 110 , 6 ) ;
  primitive ( 1407 , 110 , 7 ) ;
  if ( mltexp ) 
  {
    primitive ( 1408 , 110 , 8 ) ;
  } 
  primitive ( 443 , 98 , 51759L ) ;
  primitive ( 444 , 98 , 63663L ) ;
  primitive ( 445 , 98 , 64175L ) ;
  primitive ( 462 , 98 , 113849L ) ;
  primitive ( 1413 , 98 , 113977L ) ;
  primitive ( 459 , 98 , 78137L ) ;
  primitive ( 460 , 98 , 90041L ) ;
  primitive ( 461 , 98 , 101945L ) ;
  primitive ( 534 , 98 , 114701L ) ;
  primitive ( 1414 , 98 , 114829L ) ;
  primitive ( 440 , 99 , 50986L ) ;
  primitive ( 441 , 99 , 51242L ) ;
  primitive ( 442 , 99 , 51498L ) ;
  primitive ( 1110 , 114 , 0 ) ;
  primitive ( 1122 , 114 , 1 ) ;
  primitive ( 1432 , 88 , 0 ) ;
  primitive ( 1433 , 88 , 1 ) ;
  primitive ( 275 , 115 , 0 ) ;
  primitive ( 276 , 115 , 1 ) ;
  primitive ( 277 , 115 , 2 ) ;
  primitive ( 1442 , 115 , 3 ) ;
  primitive ( 1443 , 66 , 1 ) ;
  primitive ( 1444 , 66 , 0 ) ;
  primitive ( 1445 , 64 , 0 ) ;
  primitive ( 1446 , 64 , 1 ) ;
  primitive ( 1452 , 63 , 78137L ) ;
  primitive ( 1453 , 63 , 90041L ) ;
  primitive ( 1454 , 25 , 0 ) ;
  primitive ( 1455 , 25 , 1 ) ;
  primitive ( 1456 , 25 , 2 ) ;
  primitive ( 1457 , 25 , 3 ) ;
  primitive ( 1458 , 25 , 7 ) ;
  primitive ( 1502 , 65 , 0 ) ;
  primitive ( 684 , 65 , 1 ) ;
  writeloc = curval ;
  primitive ( 1503 , 65 , 2 ) ;
  primitive ( 1504 , 65 , 3 ) ;
  hash [38820L ].v.RH = 1504 ;
  eqtb [38820L ]= eqtb [curval ];
  primitive ( 1505 , 65 , 5 ) ;
  primitive ( 1506 , 65 , 6 ) ;
  primitive ( 1507 , 65 , 7 ) ;
  primitive ( 458 , 91 , 0 ) ;
  primitive ( 1672 , 116 , 1 ) ;
  primitive ( 1673 , 116 , 0 ) ;
  primitive ( 1674 , 116 , 3 ) ;
  primitive ( 1675 , 116 , 2 ) ;
  primitive ( 1676 , 117 , 0 ) ;
  primitive ( 1677 , 117 , 1 ) ;
  primitive ( 1678 , 117 , 2 ) ;
  primitive ( 1691 , 79 , 0 ) ;
  primitive ( 1692 , 79 , 1 ) ;
  primitive ( 1693 , 90 , 76079L ) ;
  primitive ( 1696 , 89 , 1 ) ;
  primitive ( 1697 , 89 , 2 ) ;
  primitive ( 1719 , 83 , 114429L ) ;
  nonewcontrolsequence = true ;
} 
#endif /* INITEX */
void 
mainbody ( void ) 
{
  mainbody_regmem 
  bounddefault = 0 ;
  boundname = "mem_bot" ;
  setupboundvariable ( addressof ( membot ) , boundname , bounddefault ) ;
  bounddefault = 250000L ;
  boundname = "main_memory" ;
  setupboundvariable ( addressof ( mainmemory ) , boundname , bounddefault ) ;
  bounddefault = 0 ;
  boundname = "extra_mem_top" ;
  setupboundvariable ( addressof ( extramemtop ) , boundname , bounddefault ) 
  ;
  bounddefault = 0 ;
  boundname = "extra_mem_bot" ;
  setupboundvariable ( addressof ( extramembot ) , boundname , bounddefault ) 
  ;
  bounddefault = 200000L ;
  boundname = "pool_size" ;
  setupboundvariable ( addressof ( poolsize ) , boundname , bounddefault ) ;
  bounddefault = 75000L ;
  boundname = "string_vacancies" ;
  setupboundvariable ( addressof ( stringvacancies ) , boundname , 
  bounddefault ) ;
  bounddefault = 5000 ;
  boundname = "pool_free" ;
  setupboundvariable ( addressof ( poolfree ) , boundname , bounddefault ) ;
  bounddefault = 15000 ;
  boundname = "max_strings" ;
  setupboundvariable ( addressof ( maxstrings ) , boundname , bounddefault ) ;
  bounddefault = 100 ;
  boundname = "strings_free" ;
  setupboundvariable ( addressof ( stringsfree ) , boundname , bounddefault ) 
  ;
  bounddefault = 100000L ;
  boundname = "font_mem_size" ;
  setupboundvariable ( addressof ( fontmemsize ) , boundname , bounddefault ) 
  ;
  bounddefault = 500 ;
  boundname = "font_max" ;
  setupboundvariable ( addressof ( fontmax ) , boundname , bounddefault ) ;
  bounddefault = 20000 ;
  boundname = "trie_size" ;
  setupboundvariable ( addressof ( triesize ) , boundname , bounddefault ) ;
  bounddefault = 659 ;
  boundname = "hyph_size" ;
  setupboundvariable ( addressof ( hyphsize ) , boundname , bounddefault ) ;
  bounddefault = 3000 ;
  boundname = "buf_size" ;
  setupboundvariable ( addressof ( bufsize ) , boundname , bounddefault ) ;
  bounddefault = 50 ;
  boundname = "nest_size" ;
  setupboundvariable ( addressof ( nestsize ) , boundname , bounddefault ) ;
  bounddefault = 15 ;
  boundname = "max_in_open" ;
  setupboundvariable ( addressof ( maxinopen ) , boundname , bounddefault ) ;
  bounddefault = 60 ;
  boundname = "param_size" ;
  setupboundvariable ( addressof ( paramsize ) , boundname , bounddefault ) ;
  bounddefault = 4000 ;
  boundname = "save_size" ;
  setupboundvariable ( addressof ( savesize ) , boundname , bounddefault ) ;
  bounddefault = 300 ;
  boundname = "stack_size" ;
  setupboundvariable ( addressof ( stacksize ) , boundname , bounddefault ) ;
  bounddefault = 16384 ;
  boundname = "dvi_buf_size" ;
  setupboundvariable ( addressof ( dvibufsize ) , boundname , bounddefault ) ;
  bounddefault = 79 ;
  boundname = "error_line" ;
  setupboundvariable ( addressof ( errorline ) , boundname , bounddefault ) ;
  bounddefault = 50 ;
  boundname = "half_error_line" ;
  setupboundvariable ( addressof ( halferrorline ) , boundname , bounddefault 
  ) ;
  bounddefault = 79 ;
  boundname = "max_print_line" ;
  setupboundvariable ( addressof ( maxprintline ) , boundname , bounddefault ) 
  ;
  bounddefault = 0 ;
  boundname = "hash_extra" ;
  setupboundvariable ( addressof ( hashextra ) , boundname , bounddefault ) ;
  bounddefault = 10000 ;
  boundname = "expand_depth" ;
  setupboundvariable ( addressof ( expanddepth ) , boundname , bounddefault ) 
  ;
  {
    if ( membot < infmembot ) 
    membot = infmembot ;
    else if ( membot > supmembot ) 
    membot = supmembot ;
  } 
  {
    if ( mainmemory < infmainmemory ) 
    mainmemory = infmainmemory ;
    else if ( mainmemory > supmainmemory ) 
    mainmemory = supmainmemory ;
  } 
	;
#ifdef INITEX
  if ( iniversion ) 
  {
    extramemtop = 0 ;
    extramembot = 0 ;
  } 
#endif /* INITEX */
  if ( extramembot > supmainmemory ) 
  extramembot = supmainmemory ;
  if ( extramemtop > supmainmemory ) 
  extramemtop = supmainmemory ;
  memtop = membot + mainmemory - 1 ;
  memmin = membot ;
  memmax = memtop ;
  {
    if ( triesize < inftriesize ) 
    triesize = inftriesize ;
    else if ( triesize > suptriesize ) 
    triesize = suptriesize ;
  } 
  {
    if ( hyphsize < infhyphsize ) 
    hyphsize = infhyphsize ;
    else if ( hyphsize > suphyphsize ) 
    hyphsize = suphyphsize ;
  } 
  {
    if ( bufsize < infbufsize ) 
    bufsize = infbufsize ;
    else if ( bufsize > supbufsize ) 
    bufsize = supbufsize ;
  } 
  {
    if ( nestsize < infnestsize ) 
    nestsize = infnestsize ;
    else if ( nestsize > supnestsize ) 
    nestsize = supnestsize ;
  } 
  {
    if ( maxinopen < infmaxinopen ) 
    maxinopen = infmaxinopen ;
    else if ( maxinopen > supmaxinopen ) 
    maxinopen = supmaxinopen ;
  } 
  {
    if ( paramsize < infparamsize ) 
    paramsize = infparamsize ;
    else if ( paramsize > supparamsize ) 
    paramsize = supparamsize ;
  } 
  {
    if ( savesize < infsavesize ) 
    savesize = infsavesize ;
    else if ( savesize > supsavesize ) 
    savesize = supsavesize ;
  } 
  {
    if ( stacksize < infstacksize ) 
    stacksize = infstacksize ;
    else if ( stacksize > supstacksize ) 
    stacksize = supstacksize ;
  } 
  {
    if ( dvibufsize < infdvibufsize ) 
    dvibufsize = infdvibufsize ;
    else if ( dvibufsize > supdvibufsize ) 
    dvibufsize = supdvibufsize ;
  } 
  {
    if ( poolsize < infpoolsize ) 
    poolsize = infpoolsize ;
    else if ( poolsize > suppoolsize ) 
    poolsize = suppoolsize ;
  } 
  {
    if ( stringvacancies < infstringvacancies ) 
    stringvacancies = infstringvacancies ;
    else if ( stringvacancies > supstringvacancies ) 
    stringvacancies = supstringvacancies ;
  } 
  {
    if ( poolfree < infpoolfree ) 
    poolfree = infpoolfree ;
    else if ( poolfree > suppoolfree ) 
    poolfree = suppoolfree ;
  } 
  {
    if ( maxstrings < infmaxstrings ) 
    maxstrings = infmaxstrings ;
    else if ( maxstrings > supmaxstrings ) 
    maxstrings = supmaxstrings ;
  } 
  {
    if ( stringsfree < infstringsfree ) 
    stringsfree = infstringsfree ;
    else if ( stringsfree > supstringsfree ) 
    stringsfree = supstringsfree ;
  } 
  {
    if ( fontmemsize < inffontmemsize ) 
    fontmemsize = inffontmemsize ;
    else if ( fontmemsize > supfontmemsize ) 
    fontmemsize = supfontmemsize ;
  } 
  {
    if ( fontmax < inffontmax ) 
    fontmax = inffontmax ;
    else if ( fontmax > supfontmax ) 
    fontmax = supfontmax ;
  } 
  {
    if ( hashextra < infhashextra ) 
    hashextra = infhashextra ;
    else if ( hashextra > suphashextra ) 
    hashextra = suphashextra ;
  } 
  if ( errorline > 255 ) 
  errorline = 255 ;
  buffer = xmallocarray ( ASCIIcode , bufsize ) ;
  buffer2 = xmallocarray ( ASCIIcode , bufsize ) ;
  nest = xmallocarray ( liststaterecord , nestsize ) ;
  savestack = xmallocarray ( memoryword , savesize ) ;
  inputstack = xmallocarray ( instaterecord , stacksize ) ;
  inputfile = xmallocarray ( alphafile , maxinopen ) ;
  linestack = xmallocarray ( integer , maxinopen ) ;
  eofseen = xmallocarray ( boolean , maxinopen ) ;
  grpstack = xmallocarray ( savepointer , maxinopen ) ;
  ifstack = xmallocarray ( halfword , maxinopen ) ;
  sourcefilenamestack = xmallocarray ( strnumber , maxinopen ) ;
  fullsourcefilenamestack = xmallocarray ( strnumber , maxinopen ) ;
  paramstack = xmallocarray ( halfword , paramsize ) ;
  dvibuf = xmallocarray ( eightbits , dvibufsize ) ;
  hyphword = xmallocarray ( strnumber , hyphsize ) ;
  hyphlist = xmallocarray ( halfword , hyphsize ) ;
  hyphlink = xmallocarray ( hyphpointer , hyphsize ) ;
	;
#ifdef INITEX
  if ( iniversion ) 
  {
    yzmem = xmallocarray ( memoryword , memtop - membot + 1 ) ;
    zmem = yzmem - membot ;
    eqtbtop = 116261L + hashextra ;
    if ( hashextra == 0 ) 
    hashtop = 49924L ;
    else hashtop = eqtbtop ;
    yhash = xmallocarray ( twohalves , 1 + hashtop - hashoffset ) ;
    hash = yhash - hashoffset ;
    hash [23810 ].v.LH = 0 ;
    hash [23810 ].v.RH = 0 ;
    {register integer for_end; hashused = 23811 ;for_end = hashtop ; if ( 
    hashused <= for_end) do 
      hash [hashused ]= hash [23810 ];
    while ( hashused++ < for_end ) ;} 
    zeqtb = xmallocarray ( memoryword , eqtbtop ) ;
    eqtb = zeqtb ;
    strstart = xmallocarray ( poolpointer , maxstrings ) ;
    strpool = xmallocarray ( packedASCIIcode , poolsize ) ;
    fontinfo = xmallocarray ( memoryword , fontmemsize ) ;
  } 
#endif /* INITEX */
  history = 3 ;
  if ( readyalready == 314159L ) 
  goto lab1 ;
  bad = 0 ;
  if ( ( halferrorline < 30 ) || ( halferrorline > errorline - 15 ) ) 
  bad = 1 ;
  if ( maxprintline < 60 ) 
  bad = 2 ;
  if ( dvibufsize % 8 != 0 ) 
  bad = 3 ;
  if ( membot + 1100 > memtop ) 
  bad = 4 ;
  if ( 8501 > 15000 ) 
  bad = 5 ;
  if ( maxinopen >= 128 ) 
  bad = 6 ;
  if ( memtop < 267 ) 
  bad = 7 ;
	;
#ifdef INITEX
  if ( ( memmin != membot ) || ( memmax != memtop ) ) 
  bad = 10 ;
#endif /* INITEX */
  if ( ( memmin > membot ) || ( memmax < memtop ) ) 
  bad = 10 ;
  if ( ( 0 > 0 ) || ( 65535L < 127 ) ) 
  bad = 11 ;
  if ( ( -1073741823L > 0 ) || ( 1073741823L < 32767 ) ) 
  bad = 12 ;
  if ( ( 0 < -1073741823L ) || ( 65535L > 1073741823L ) ) 
  bad = 13 ;
  if ( ( membot - supmainmemory < -1073741823L ) || ( memtop + supmainmemory 
  >= 1073741823L ) || ( 0 != 0 ) ) 
  bad = 14 ;
  if ( ( 9000 < -1073741823L ) || ( 9000 > 1073741823L ) ) 
  bad = 15 ;
  if ( fontmax > 9000 ) 
  bad = 16 ;
  if ( ( savesize > 1073741823L ) || ( maxstrings > 1073741823L ) ) 
  bad = 17 ;
  if ( bufsize > 1073741823L ) 
  bad = 18 ;
  if ( 65535L < 255 ) 
  bad = 19 ;
  if ( 536987172L + hashextra > 1073741823L ) 
  bad = 21 ;
  if ( ( hashoffset < 0 ) || ( hashoffset > 23810 ) ) 
  bad = 42 ;
  if ( formatdefaultlength > maxint ) 
  bad = 31 ;
  if ( 2 * 1073741823L < memtop - memmin ) 
  bad = 41 ;
  if ( bad > 0 ) 
  {
    fprintf ( stdout , "%s%s%ld\n",  "Ouch---my internal constants have been clobbered!" ,     "---case " , (long)bad ) ;
    goto lab9999 ;
  } 
  initialize () ;
	;
#ifdef INITEX
  if ( iniversion ) 
  {
    if ( ! getstringsstarted () ) 
    goto lab9999 ;
    initprim () ;
    initstrptr = strptr ;
    initpoolptr = poolptr ;
    fixdateandtime () ;
  } 
#endif /* INITEX */
  readyalready = 314159L ;
  lab1: selector = 17 ;
  tally = 0 ;
  termoffset = 0 ;
  fileoffset = 0 ;
  kcodepos = 0 ;
  if ( srcspecialsp || filelineerrorstylep || parsefirstlinep ) 
  fprintf ( stdout , "%s%s%s%s%s",  "This is e-upTeX, Version 3.141592653" , "-p4.1.2" ,   "-u2.02" , "-251130" , "-2.6" ) ;
  else
  fprintf ( stdout , "%s%s%s%s%s",  "This is e-upTeX, Version 3.141592653" , "-p4.1.2" ,   "-u2.02" , "-251130" , "-2.6" ) ;
  Fputs ( stdout ,  " (" ) ;
  Fputs ( stdout ,  conststringcast ( getencstring () ) ) ;
  putc ( ')' ,  stdout );
  Fputs ( stdout ,  versionstring ) ;
  if ( formatident == 0 ) 
  fprintf ( stdout , "%s%s%c\n",  " (preloaded format=" , dumpname , ')' ) ;
  else {
      
    slowprint ( formatident ) ;
    println () ;
  } 
  if ( shellenabledp ) 
  {
    putc ( ' ' ,  stdout );
    if ( restrictedshell ) 
    {
      Fputs ( stdout ,  "restricted " ) ;
    } 
    fprintf ( stdout , "%s\n",  "\\write18 enabled." ) ;
  } 
  if ( srcspecialsp ) 
  {
    fprintf ( stdout , "%s\n",  " Source specials enabled." ) ;
  } 
  if ( translatefilename ) 
  {
    Fputs ( stdout ,  " (" ) ;
    fputs ( translatefilename , stdout ) ;
    { putc ( ')' ,  stdout );  putc ( '\n',  stdout ); }
  } 
  fflush ( stdout ) ;
  jobname = 0 ;
  nameinprogress = false ;
  logopened = false ;
  outputfilename = 0 ;
  {
    {
      inputptr = 0 ;
      maxinstack = 0 ;
      sourcefilenamestack [0 ]= 0 ;
      fullsourcefilenamestack [0 ]= 0 ;
      inopen = 0 ;
      openparens = 0 ;
      maxbufstack = 0 ;
      grpstack [0 ]= 0 ;
      ifstack [0 ]= -1073741823L ;
      paramptr = 0 ;
      maxparamstack = 0 ;
      first = bufsize ;
      do {
	  buffer [first ]= 0 ;
	buffer2 [first ]= 0 ;
	decr ( first ) ;
      } while ( ! ( first == 0 ) ) ;
      buffer [0 ]= 0 ;
      scannerstatus = 0 ;
      warningindex = -1073741823L ;
      first = 1 ;
      curinput .statefield = 85 ;
      curinput .startfield = 1 ;
      curinput .indexfield = 0 ;
      line = 0 ;
      curinput .namefield = 0 ;
      forceeof = false ;
      alignstate = 1000000L ;
      if ( ! initterminal () ) 
      goto lab9999 ;
      curinput .limitfield = last ;
      first = last + 1 ;
    } 
	;
#ifdef INITEX
    if ( ( etexp || ( buffer [curinput .locfield ]== 42 ) ) && ( formatident 
    == 1471 ) ) 
    {
      nonewcontrolsequence = false ;
      primitive ( 1537 , 78 , 3 ) ;
      primitive ( 1538 , 78 , 4 ) ;
      primitive ( 1539 , 78 , 5 ) ;
      primitive ( 1540 , 78 , 6 ) ;
      primitive ( 1541 , 78 , 18 ) ;
      primitive ( 864 , 126 , 16 ) ;
      primitive ( 565 , 121 , 1 ) ;
      primitive ( 865 , 126 , 18 ) ;
      primitive ( 866 , 126 , 19 ) ;
      primitive ( 867 , 126 , 20 ) ;
      primitive ( 868 , 126 , 21 ) ;
      primitive ( 869 , 126 , 22 ) ;
      primitive ( 870 , 126 , 23 ) ;
      primitive ( 1508 , 65 , 8 ) ;
      primitive ( 558 , 84 , 114980L ) ;
      primitive ( 559 , 84 , 114981L ) ;
      primitive ( 1542 , 78 , 13 ) ;
      primitive ( 1543 , 78 , 14 ) ;
      primitive ( 1544 , 78 , 15 ) ;
      primitive ( 932 , 123 , 21 ) ;
      primitive ( 871 , 126 , 24 ) ;
      primitive ( 872 , 126 , 25 ) ;
      primitive ( 1545 , 78 , 17 ) ;
      primitive ( 1509 , 65 , 9 ) ;
      primitive ( 1546 , 78 , 16 ) ;
      primitive ( 1510 , 65 , 10 ) ;
      primitive ( 873 , 126 , 26 ) ;
      primitive ( 874 , 126 , 27 ) ;
      primitive ( 1548 , 82 , 50468L ) ;
      primitive ( 1549 , 83 , 114430L ) ;
      primitive ( 1550 , 83 , 114431L ) ;
      primitive ( 1551 , 83 , 114432L ) ;
      primitive ( 1552 , 83 , 114433L ) ;
      primitive ( 1553 , 83 , 114434L ) ;
      primitive ( 1554 , 83 , 114435L ) ;
      primitive ( 1555 , 83 , 114436L ) ;
      primitive ( 1556 , 83 , 114437L ) ;
      primitive ( 1557 , 83 , 114438L ) ;
      primitive ( 1558 , 83 , 114439L ) ;
      primitive ( 1559 , 83 , 114440L ) ;
      primitive ( 1560 , 83 , 114441L ) ;
      primitive ( 1561 , 83 , 114442L ) ;
      primitive ( 1562 , 83 , 114443L ) ;
      primitive ( 1577 , 78 , 19 ) ;
      primitive ( 1578 , 78 , 20 ) ;
      primitive ( 1579 , 78 , 21 ) ;
      primitive ( 1580 , 78 , 22 ) ;
      primitive ( 1581 , 78 , 23 ) ;
      primitive ( 1582 , 78 , 29 ) ;
      primitive ( 1583 , 78 , 30 ) ;
      primitive ( 1584 , 78 , 31 ) ;
      primitive ( 1585 , 78 , 32 ) ;
      primitive ( 1586 , 78 , 33 ) ;
      primitive ( 1587 , 78 , 34 ) ;
      primitive ( 1588 , 78 , 35 ) ;
      primitive ( 1589 , 25 , 4 ) ;
      primitive ( 1591 , 25 , 5 ) ;
      primitive ( 1592 , 127 , 1 ) ;
      primitive ( 1593 , 127 , 5 ) ;
      primitive ( 1594 , 25 , 6 ) ;
      primitive ( 1598 , 95 , 2 ) ;
      primitive ( 1045 , 55 , 1 ) ;
      primitive ( 1602 , 83 , 114444L ) ;
      primitive ( 1603 , 39 , 6 ) ;
      primitive ( 1604 , 39 , 7 ) ;
      primitive ( 1605 , 39 , 10 ) ;
      primitive ( 1606 , 39 , 11 ) ;
      primitive ( 1615 , 122 , 2 ) ;
      primitive ( 1617 , 111 , 1 ) ;
      primitive ( 931 , 120 , 1 ) ;
      primitive ( 1618 , 123 , 17 ) ;
      primitive ( 1619 , 123 , 18 ) ;
      primitive ( 1620 , 123 , 19 ) ;
      primitive ( 1621 , 123 , 20 ) ;
      primitive ( 1388 , 108 , 8 ) ;
      primitive ( 1627 , 78 , 40 ) ;
      primitive ( 1628 , 78 , 41 ) ;
      primitive ( 1629 , 78 , 42 ) ;
      primitive ( 1630 , 78 , 43 ) ;
      primitive ( 1634 , 78 , 24 ) ;
      primitive ( 1635 , 78 , 25 ) ;
      primitive ( 1636 , 78 , 36 ) ;
      primitive ( 1637 , 78 , 37 ) ;
      primitive ( 1638 , 78 , 38 ) ;
      primitive ( 1639 , 78 , 39 ) ;
      primitive ( 1640 , 24 , 5 ) ;
      primitive ( 1641 , 128 , 5 ) ;
      primitive ( 1642 , 128 , 6 ) ;
      primitive ( 1643 , 128 , 7 ) ;
      primitive ( 1644 , 128 , 8 ) ;
      primitive ( 1645 , 128 , 9 ) ;
      primitive ( 1649 , 30 , 2 ) ;
      primitive ( 1650 , 30 , 3 ) ;
      primitive ( 1651 , 97 , 50725L ) ;
      primitive ( 1652 , 97 , 50726L ) ;
      primitive ( 1653 , 97 , 50727L ) ;
      primitive ( 1654 , 97 , 50728L ) ;
      primitive ( 1716 , 78 , 26 ) ;
      primitive ( 1717 , 78 , 27 ) ;
      primitive ( 1718 , 78 , 28 ) ;
      if ( ( buffer [curinput .locfield ]== 42 ) ) 
      incr ( curinput .locfield ) ;
      eTeXmode = 1 ;
      maxregnum = 65535L ;
      maxreghelpline = 1646 ;
    } 
#endif /* INITEX */
    if ( ! nonewcontrolsequence ) 
    nonewcontrolsequence = true ;
    else if ( ( formatident == 0 ) || ( buffer [curinput .locfield ]== 38 ) 
    || dumpline ) 
    {
      if ( formatident != 0 ) 
      initialize () ;
      if ( ! openfmtfile () ) 
      goto lab9999 ;
      if ( ! loadfmtfile () ) 
      {
	wclose ( fmtfile ) ;
	goto lab9999 ;
      } 
      wclose ( fmtfile ) ;
      eqtb = zeqtb ;
      while ( ( curinput .locfield < curinput .limitfield ) && ( buffer [
      curinput .locfield ]== 32 ) ) incr ( curinput .locfield ) ;
    } 
    if ( ( eTeXmode == 1 ) ) 
    fprintf ( stdout , "%s\n",  "entering extended mode" ) ;
    if ( ( eqtb [114410L ].cint < 0 ) || ( eqtb [114410L ].cint > 255 ) ) 
    decr ( curinput .limitfield ) ;
    else buffer [curinput .limitfield ]= eqtb [114410L ].cint ;
    if ( mltexenabledp ) 
    {
      fprintf ( stdout , "%s\n",  "MLTeX v2.2 enabled" ) ;
    } 
    last = ptencconvfirstline ( curinput .locfield , last , buffer , bufsize ) 
    ;
    curinput .limitfield = last ;
    fixdateandtime () ;
    isprintutf8 = false ;
    randomseed = ( microseconds * 1000 ) + ( epochseconds % 1000000L ) ;
    initrandoms ( randomseed ) ;
	;
#ifdef INITEX
    if ( trienotready ) 
    {
      trietrl = xmallocarray ( triepointer , triesize ) ;
      trietro = xmallocarray ( triepointer , triesize ) ;
      trietrc = xmallocarray ( quarterword , triesize ) ;
      triec = xmallocarray ( packedASCIIcode , triesize ) ;
      trieo = xmallocarray ( trieopcode , triesize ) ;
      triel = xmallocarray ( triepointer , triesize ) ;
      trier = xmallocarray ( triepointer , triesize ) ;
      triehash = xmallocarray ( triepointer , triesize ) ;
      trietaken = xmallocarray ( boolean , triesize ) ;
      triel [0 ]= 0 ;
      triec [0 ]= 0 ;
      trieptr = 0 ;
      trier [0 ]= 0 ;
      hyphstart = 0 ;
      fontdir = xmallocarray ( eightbits , fontmax ) ;
      fontenc = xmallocarray ( eightbits , fontmax ) ;
      fontnumext = xmallocarray ( integer , fontmax ) ;
      fontcheck = xmallocarray ( fourquarters , fontmax ) ;
      fontsize = xmallocarray ( scaled , fontmax ) ;
      fontdsize = xmallocarray ( scaled , fontmax ) ;
      fontparams = xmallocarray ( fontindex , fontmax ) ;
      fontname = xmallocarray ( strnumber , fontmax ) ;
      fontarea = xmallocarray ( strnumber , fontmax ) ;
      fontbc = xmallocarray ( sixteenbits , fontmax ) ;
      fontec = xmallocarray ( sixteenbits , fontmax ) ;
      fontglue = xmallocarray ( halfword , fontmax ) ;
      hyphenchar = xmallocarray ( integer , fontmax ) ;
      skewchar = xmallocarray ( integer , fontmax ) ;
      bcharlabel = xmallocarray ( fontindex , fontmax ) ;
      fontbchar = xmallocarray ( ninebits , fontmax ) ;
      fontfalsebchar = xmallocarray ( ninebits , fontmax ) ;
      ctypebase = xmallocarray ( integer , fontmax ) ;
      charbase = xmallocarray ( integer , fontmax ) ;
      widthbase = xmallocarray ( integer , fontmax ) ;
      heightbase = xmallocarray ( integer , fontmax ) ;
      depthbase = xmallocarray ( integer , fontmax ) ;
      italicbase = xmallocarray ( integer , fontmax ) ;
      ligkernbase = xmallocarray ( integer , fontmax ) ;
      kernbase = xmallocarray ( integer , fontmax ) ;
      extenbase = xmallocarray ( integer , fontmax ) ;
      parambase = xmallocarray ( integer , fontmax ) ;
      fontptr = 0 ;
      fmemptr = 7 ;
      fontdir [0 ]= 0 ;
      fontenc [0 ]= 0 ;
      fontnumext [0 ]= 0 ;
      fontname [0 ]= 960 ;
      fontarea [0 ]= 349 ;
      hyphenchar [0 ]= 45 ;
      skewchar [0 ]= -1 ;
      bcharlabel [0 ]= 0 ;
      fontbchar [0 ]= 11904 ;
      fontfalsebchar [0 ]= 11904 ;
      fontbc [0 ]= 1 ;
      fontec [0 ]= 0 ;
      fontsize [0 ]= 0 ;
      fontdsize [0 ]= 0 ;
      ctypebase [0 ]= 0 ;
      charbase [0 ]= 0 ;
      widthbase [0 ]= 0 ;
      heightbase [0 ]= 0 ;
      depthbase [0 ]= 0 ;
      italicbase [0 ]= 0 ;
      ligkernbase [0 ]= 0 ;
      kernbase [0 ]= 0 ;
      extenbase [0 ]= 0 ;
      fontglue [0 ]= -1073741823L ;
      fontparams [0 ]= 7 ;
      parambase [0 ]= -1 ;
      {register integer for_end; fontk = 0 ;for_end = 6 ; if ( fontk <= 
      for_end) do 
	fontinfo [fontk ].cint = 0 ;
      while ( fontk++ < for_end ) ;} 
    } 
#endif /* INITEX */
    fontused = xmallocarray ( boolean , fontmax ) ;
    {register integer for_end; fontk = 0 ;for_end = fontmax ; if ( fontk <= 
    for_end) do 
      fontused [fontk ]= false ;
    while ( fontk++ < for_end ) ;} 
    magicoffset = strstart [1061 ]- 9 * 18 ;
    if ( interaction == 0 ) 
    selector = 16 ;
    else selector = 17 ;
    if ( ( curinput .locfield < curinput .limitfield ) && ( eqtb [51759L + 
    buffer [curinput .locfield ]].hh .v.RH != 0 ) ) 
    startinput () ;
  } 
  history = 0 ;
  synctexinitcommand () ;
  maincontrol () ;
  finalcleanup () ;
  closefilesandterminate () ;
  lab9999: {
      
    fflush ( stdout ) ;
    readyalready = 0 ;
    if ( ( history != 0 ) && ( history != 1 ) ) 
    uexit ( 1 ) ;
    else uexit ( 0 ) ;
  } 
} 
