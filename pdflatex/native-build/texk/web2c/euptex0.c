#define EXTERN extern
#include "euptexd.h"

void 
println ( void ) 
{
  println_regmem 
  integer ii  ;
  switch ( selector ) 
  {case 19 : 
    {
      if ( nrestmultichr ( kcodepos ) > 0 ) 
      {register integer for_end; ii = 0 ;for_end = nrestmultichr ( kcodepos 
      ) - 1 ; if ( ii <= for_end) do 
	{
	  putc ( ' ' ,  stdout );
	  putc ( ' ' ,  logfile );
	} 
      while ( ii++ < for_end ) ;} 
      putc ('\n',  stdout );
      putc ('\n',  logfile );
      termoffset = 0 ;
      fileoffset = 0 ;
    } 
    break ;
  case 18 : 
    {
      if ( nrestmultichr ( kcodepos ) > 0 ) 
      {register integer for_end; ii = 0 ;for_end = nrestmultichr ( kcodepos 
      ) - 1 ; if ( ii <= for_end) do 
	putc ( ' ' ,  logfile );
      while ( ii++ < for_end ) ;} 
      putc ('\n',  logfile );
      fileoffset = 0 ;
    } 
    break ;
  case 17 : 
    {
      if ( nrestmultichr ( kcodepos ) > 0 ) 
      {register integer for_end; ii = 0 ;for_end = nrestmultichr ( kcodepos 
      ) - 1 ; if ( ii <= for_end) do 
	putc ( ' ' ,  stdout );
      while ( ii++ < for_end ) ;} 
      putc ('\n',  stdout );
      termoffset = 0 ;
    } 
    break ;
  case 16 : 
  case 20 : 
  case 21 : 
    ;
    break ;
    default: 
    putc ('\n',  writefile [selector ]);
    break ;
  } 
  kcodepos = 0 ;
} 
void 
zprintchar ( extASCIIcode s ) 
{
  /* 10 */ printchar_regmem 
  if ( s == eqtb [114411L ].cint ) {
      
    if ( selector < 20 ) 
    {
      println () ;
      return ;
    } 
  } 
  if ( s > 511 ) 
  s = s % 256 ;
  if ( s < 256 ) 
  kcodepos = 0 ;
  else if ( ( kcodepos == 1 ) || ( ( kcodepos >= 9 ) && ( kcodepos <= 10 ) ) 
  || ( ( kcodepos >= 17 ) && ( kcodepos <= 19 ) ) ) 
  incr ( kcodepos ) ;
  else if ( iskanji1 ( xchr [s - 256 ]) ) 
  {
    if ( ( ismultichr ( 4 , 1 , xchr [s ]) ) ) 
    kcodepos = 17 ;
    else if ( ( ismultichr ( 3 , 1 , xchr [s ]) ) ) 
    kcodepos = 9 ;
    else kcodepos = 1 ;
    if ( ( selector == 19 ) || ( selector == 18 ) ) {
	
      if ( fileoffset >= maxprintline - nrestmultichr ( kcodepos ) ) 
      {
	putc ('\n',  logfile );
	fileoffset = 0 ;
      } 
    } 
    if ( ( selector == 19 ) || ( selector == 17 ) ) {
	
      if ( termoffset >= maxprintline - nrestmultichr ( kcodepos ) ) 
      {
	putc ('\n',  stdout );
	termoffset = 0 ;
      } 
    } 
  } 
  else kcodepos = 0 ;
  switch ( selector ) 
  {case 19 : 
    {
      putc ( Xchr (s ),  stdout );
      incr ( termoffset ) ;
      if ( termoffset == maxprintline ) 
      {
	putc ('\n',  stdout );
	termoffset = 0 ;
      } 
      putc ( Xchr (s ),  logfile );
      incr ( fileoffset ) ;
      if ( fileoffset == maxprintline ) 
      {
	putc ('\n',  logfile );
	fileoffset = 0 ;
      } 
    } 
    break ;
  case 18 : 
    {
      putc ( Xchr (s ),  logfile );
      incr ( fileoffset ) ;
      if ( fileoffset == maxprintline ) 
      println () ;
    } 
    break ;
  case 17 : 
    {
      putc ( Xchr (s ),  stdout );
      incr ( termoffset ) ;
      if ( termoffset == maxprintline ) 
      println () ;
    } 
    break ;
  case 16 : 
    ;
    break ;
  case 20 : 
    if ( tally < trickcount ) 
    {
      trickbuf [tally % errorline ]= s ;
      trickbuf2 [tally % errorline ]= kcodepos ;
    } 
    break ;
  case 21 : 
    {
      if ( poolptr < poolsize ) 
      {
	strpool [poolptr ]= s ;
	incr ( poolptr ) ;
      } 
    } 
    break ;
    default: 
    putc ( Xchr (s ),  writefile [selector ]);
    break ;
  } 
  incr ( tally ) ;
} 
void 
zprint ( integer s ) 
{
  /* 10 */ print_regmem 
  poolpointer j  ;
  integer nl  ;
  if ( s >= strptr ) 
  s = 262 ;
  else if ( s < 256 ) {
      
    if ( s < 0 ) 
    s = 262 ;
    else {
	
      if ( selector > 20 ) 
      {
	printchar ( s ) ;
	return ;
      } 
      if ( ( s == eqtb [114411L ].cint ) ) {
	  
	if ( selector < 20 ) 
	{
	  println () ;
	  return ;
	} 
      } 
      if ( xprn [s ]) 
      {
	printchar ( s ) ;
	return ;
      } 
      nl = eqtb [114411L ].cint ;
      eqtb [114411L ].cint = -1 ;
      j = strstart [s ];
      while ( j < strstart [s + 1 ]) {
	  
	printchar ( strpool [j ]) ;
	incr ( j ) ;
      } 
      eqtb [114411L ].cint = nl ;
      return ;
    } 
  } 
  j = strstart [s ];
  while ( j < strstart [s + 1 ]) {
      
    printchar ( strpool [j ]) ;
    incr ( j ) ;
  } 
} 
void 
zslowprint ( integer s ) 
{
  slowprint_regmem 
  poolpointer j  ;
  integer c  ;
  if ( ( s >= strptr ) || ( s < 256 ) ) 
  print ( s ) ;
  else {
      
    j = strstart [s ];
    while ( j < strstart [s + 1 ]) {
	
      c = strpool [j ];
      if ( c >= 256 ) 
      printchar ( c ) ;
      else print ( c ) ;
      incr ( j ) ;
    } 
  } 
} 
void 
zslowprintfilename ( integer s ) 
{
  slowprintfilename_regmem 
  poolpointer i, j, l  ;
  integer p  ;
  if ( ( s >= strptr ) || ( s < 256 ) ) 
  print ( s ) ;
  else {
      
    i = strstart [s ];
    l = strstart [s + 1 ];
    while ( i < l ) {
	
      p = multistrlenshort ( strpool , l , i ) ;
      if ( p != 1 ) 
      {
	{register integer for_end; j = i ;for_end = i + p - 1 ; if ( j <= 
	for_end) do 
	  printchar ( 256 + ( strpool [j ]% 256 ) ) ;
	while ( j++ < for_end ) ;} 
	i = i + p ;
      } 
      else {
	  
	print ( strpool [i ]% 256 ) ;
	incr ( i ) ;
      } 
    } 
  } 
} 
void 
zprintquoted ( integer s ) 
{
  printquoted_regmem 
  poolpointer i, l  ;
  integer j, p  ;
  if ( s != 0 ) 
  {
    i = strstart [s ];
    l = strstart [s + 1 ];
    while ( i < l ) {
	
      p = multistrlenshort ( strpool , l , i ) ;
      if ( p != 1 ) 
      {
	{register integer for_end; j = i ;for_end = i + p - 1 ; if ( j <= 
	for_end) do 
	  printchar ( 256 + ( strpool [j ]% 256 ) ) ;
	while ( j++ < for_end ) ;} 
	i = i + p ;
      } 
      else {
	  
	if ( strpool [i ]!= 34 ) 
	print ( strpool [i ]% 256 ) ;
	incr ( i ) ;
      } 
    } 
  } 
} 
void 
zprintnl ( strnumber s ) 
{
  printnl_regmem 
  if ( ( selector < 16 ) || ( ( termoffset > 0 ) && ( odd ( selector ) ) ) || 
  ( ( fileoffset > 0 ) && ( selector >= 18 ) ) ) 
  println () ;
  print ( s ) ;
} 
void 
zprintesc ( strnumber s ) 
{
  printesc_regmem 
  integer c  ;
  c = eqtb [114407L ].cint ;
  if ( c >= 0 ) {
      
    if ( c < 256 ) 
    print ( c ) ;
  } 
  slowprint ( s ) ;
} 
void 
zprintthedigs ( eightbits k ) 
{
  printthedigs_regmem 
  while ( k > 0 ) {
      
    decr ( k ) ;
    if ( dig [k ]< 10 ) 
    printchar ( 48 + dig [k ]) ;
    else printchar ( 55 + dig [k ]) ;
  } 
} 
void 
zprintint ( integer n ) 
{
  printint_regmem 
  unsigned char k  ;
  integer m  ;
  k = 0 ;
  if ( n < 0 ) 
  {
    printchar ( 45 ) ;
    if ( n > -100000000L ) 
    n = - (integer) n ;
    else {
	
      m = -1 - n ;
      n = m / 10 ;
      m = ( m % 10 ) + 1 ;
      k = 1 ;
      if ( m < 10 ) 
      dig [0 ]= m ;
      else {
	  
	dig [0 ]= 0 ;
	incr ( n ) ;
      } 
    } 
  } 
  do {
      dig [k ]= n % 10 ;
    n = n / 10 ;
    incr ( k ) ;
  } while ( ! ( n == 0 ) ) ;
  printthedigs ( k ) ;
} 
void 
zprintcs ( integer p ) 
{
  printcs_regmem 
  poolpointer j, l  ;
  unsigned char cat  ;
  if ( p < 23810 ) {
      
    if ( p >= 11905 ) {
	
      if ( p == 23809 ) 
      {
	printesc ( 568 ) ;
	printesc ( 569 ) ;
	printchar ( 32 ) ;
      } 
      else {
	  
	printesc ( p - 11905 ) ;
	if ( eqtb [51759L + p - 11905 ].hh .v.RH == 11 ) 
	printchar ( 32 ) ;
      } 
    } 
    else if ( p < 1 ) 
    printesc ( 570 ) ;
    else print ( p - 1 ) ;
  } 
  else if ( ( ( p >= 49924L ) && ( p <= 116261L ) ) || ( p > eqtbtop ) ) 
  printesc ( 570 ) ;
  else if ( ( hash [p ].v.RH >= strptr ) ) 
  printesc ( 571 ) ;
  else {
      
    if ( ( p >= 38822L ) && ( p < 40923L ) ) 
    l = prim [p - 38822L ].v.RH - 1 ;
    else l = hash [p ].v.RH ;
    printesc ( l ) ;
    j = strstart [l ];
    l = strstart [l + 1 ];
    if ( l > j + 1 ) 
    {
      if ( ( strpool [j ]>= 256 ) && ( l - j == multistrlenshort ( strpool , 
      l , j ) ) ) 
      {
	cat = eqtb [63663L + kcatcodekey ( fromBUFFshort ( strpool , l , j ) 
	) ].hh .v.RH ;
	if ( ( cat != 18 ) ) 
	printchar ( 32 ) ;
      } 
      else printchar ( 32 ) ;
    } 
    else printchar ( 32 ) ;
  } 
} 
void 
zsprintcs ( halfword p ) 
{
  sprintcs_regmem 
  if ( p < 23810 ) {
      
    if ( p < 11905 ) 
    print ( p - 1 ) ;
    else if ( p < 23809 ) 
    printesc ( p - 11905 ) ;
    else {
	
      printesc ( 568 ) ;
      printesc ( 569 ) ;
    } 
  } 
  else if ( ( p >= 38822L ) && ( p < 40923L ) ) 
  printesc ( prim [p - 38822L ].v.RH - 1 ) ;
  else printesc ( hash [p ].v.RH ) ;
} 
void 
zprintfilename ( integer n , integer a , integer e ) 
{
  printfilename_regmem 
  boolean mustquote  ;
  poolpointer j  ;
  mustquote = false ;
  if ( a != 0 ) 
  {
    j = strstart [a ];
    while ( ( ! mustquote ) && ( j < strstart [a + 1 ]) ) {
	
      mustquote = strpool [j ]== 32 ;
      incr ( j ) ;
    } 
  } 
  if ( n != 0 ) 
  {
    j = strstart [n ];
    while ( ( ! mustquote ) && ( j < strstart [n + 1 ]) ) {
	
      mustquote = strpool [j ]== 32 ;
      incr ( j ) ;
    } 
  } 
  if ( e != 0 ) 
  {
    j = strstart [e ];
    while ( ( ! mustquote ) && ( j < strstart [e + 1 ]) ) {
	
      mustquote = strpool [j ]== 32 ;
      incr ( j ) ;
    } 
  } 
  if ( mustquote ) 
  printchar ( 34 ) ;
  printquoted ( a ) ;
  printquoted ( n ) ;
  printquoted ( e ) ;
  if ( mustquote ) 
  printchar ( 34 ) ;
} 
void 
zprintsize ( integer s ) 
{
  printsize_regmem 
  if ( s == 0 ) 
  printesc ( 440 ) ;
  else if ( s == 256 ) 
  printesc ( 441 ) ;
  else printesc ( 442 ) ;
} 
void 
zprintwritewhatsit ( strnumber s , halfword p ) 
{
  printwritewhatsit_regmem 
  printesc ( s ) ;
  if ( mem [p + 1 ].hh .v.LH < 16 ) 
  printint ( mem [p + 1 ].hh .v.LH ) ;
  else if ( mem [p + 1 ].hh .v.LH == 16 ) 
  printchar ( 42 ) ;
  else printchar ( 45 ) ;
} 
void 
zprintsanum ( halfword q ) 
{
  printsanum_regmem 
  halfword n  ;
  if ( mem [q ].hh.b0 < 32 ) 
  n = mem [q + 1 ].hh .v.RH ;
  else {
      
    n = mem [q ].hh.b0 % 16 ;
    q = mem [q ].hh .v.RH ;
    n = n + 16 * mem [q ].hh.b0 ;
    q = mem [q ].hh .v.RH ;
    n = n + 256 * ( mem [q ].hh.b0 + 16 * mem [mem [q ].hh .v.RH ].hh.b0 
    ) ;
    q = mem [mem [q ].hh .v.RH ].hh .v.RH ;
    n = n + 65536L * mem [q ].hh.b0 ;
  } 
  printint ( n ) ;
} 
void 
zprintcsnames ( integer hstart , integer hfinish ) 
{
  printcsnames_regmem 
  integer c, h  ;
  fprintf ( stderr , "%s%ld%s%ld%c\n",  "fmtdebug:csnames from " , (long)hstart , " to " , (long)hfinish ,   ':' ) ;
  {register integer for_end; h = hstart ;for_end = hfinish ; if ( h <= 
  for_end) do 
    {
      if ( hash [h ].v.RH > 0 ) 
      {
	{register integer for_end; c = strstart [hash [h ].v.RH ];
	for_end = strstart [hash [h ].v.RH + 1 ]- 1 ; if ( c <= for_end) 
	do 
	  {
	    putbyte ( strpool [c ], stderr ) ;
	  } 
	while ( c++ < for_end ) ;} 
	{ putc ( '|' ,  stderr );  putc ( '\n',  stderr ); }
      } 
    } 
  while ( h++ < for_end ) ;} 
} 
void 
printfileline ( void ) 
{
  printfileline_regmem 
  integer level  ;
  level = inopen ;
  while ( ( level > 0 ) && ( fullsourcefilenamestack [level ]== 0 ) ) decr ( 
  level ) ;
  if ( level == 0 ) 
  printnl ( 265 ) ;
  else {
      
    printnl ( 349 ) ;
    print ( fullsourcefilenamestack [level ]) ;
    print ( 58 ) ;
    if ( level == inopen ) 
    printint ( line ) ;
    else printint ( linestack [level + 1 ]) ;
    print ( 657 ) ;
  } 
} 
void 
zprintdir ( eightbits dir ) 
{
  printdir_regmem 
  if ( dir == 4 ) 
  printchar ( 89 ) ;
  else if ( dir == 3 ) 
  printchar ( 84 ) ;
  else if ( dir == 1 ) 
  printchar ( 68 ) ;
} 
void 
zprintdirectionalt ( integer d ) 
{
  printdirectionalt_regmem 
  boolean x  ;
  x = false ;
  switch ( abs ( d ) ) 
  {case 4 : 
    {
      print ( 1707 ) ;
      x = true ;
    } 
    break ;
  case 3 : 
    {
      print ( 1708 ) ;
      x = true ;
    } 
    break ;
  case 1 : 
    {
      print ( 1709 ) ;
      x = true ;
    } 
    break ;
  } 
  if ( x ) 
  {
    if ( d < 0 ) 
    print ( 1710 ) ;
    print ( 1711 ) ;
  } 
} 
void 
zprintdirection ( integer d ) 
{
  printdirection_regmem 
  switch ( abs ( d ) ) 
  {case 4 : 
    print ( 1235 ) ;
    break ;
  case 3 : 
    print ( 1234 ) ;
    break ;
  case 1 : 
    print ( 1236 ) ;
    break ;
  } 
  if ( d < 0 ) 
  print ( 1710 ) ;
  print ( 1711 ) ;
} 
void 
zprintkanji ( KANJIcode s ) 
{
  printkanji_regmem 
  integer v, nn, jj  ;
  if ( ( isinternalUPTEX () ) ) 
  {
    s = ktokentochr ( s ) ;
    s = toUCS ( s ) ;
    nn = UVSgetcodepointlength ( s ) ;
    jj = 1 ;
    while ( jj <= nn ) {
	
      v = UVSgetcodepointinsequence ( s , jj ) ;
      if ( ( v > 0 ) ) 
      {
	v = UCStoUTF8 ( v ) ;
	if ( BYTE1 ( v ) != 0 ) 
	printchar ( 256 + BYTE1 ( v ) ) ;
	if ( BYTE2 ( v ) != 0 ) 
	printchar ( 256 + BYTE2 ( v ) ) ;
	if ( BYTE3 ( v ) != 0 ) 
	printchar ( 256 + BYTE3 ( v ) ) ;
	printchar ( 256 + BYTE4 ( v ) ) ;
      } 
      incr ( jj ) ;
    } 
  } 
  else {
      
    if ( isprintutf8 ) 
    s = UCStoUTF8 ( toUCS ( s % 16777216L ) ) ;
    else s = toBUFF ( s % 16777216L ) ;
    if ( BYTE1 ( s ) != 0 ) 
    printchar ( 256 + BYTE1 ( s ) ) ;
    if ( BYTE2 ( s ) != 0 ) 
    printchar ( 256 + BYTE2 ( s ) ) ;
    if ( BYTE3 ( s ) != 0 ) 
    printchar ( 256 + BYTE3 ( s ) ) ;
    printchar ( 256 + BYTE4 ( s ) ) ;
  } 
} 
integer 
zcheckkcatcode ( integer ct , integer cx ) 
{
  register integer Result; checkkcatcode_regmem 
  if ( ( ( ( ct >= 16 ) || ( ( ct == 14 ) && ( cx < 11904 ) ) ) && ( eqtb [
  51758L ].hh .v.RH == 0 ) ) || ( eqtb [51758L ].hh .v.RH == 2 ) ) 
  Result = 1 ;
  else Result = 0 ;
  return Result ;
} 
integer 
zcheckecharrange ( integer c ) 
{
  register integer Result; checkecharrange_regmem 
  if ( ( c > 127 ) && ( c < 11904 ) && ( eqtb [63663L + kcatcodekey ( c ) ]
  .hh .v.RH == 14 ) ) 
  Result = 1 ;
  else if ( ( c >= 0 ) && ( c < 256 ) ) 
  Result = 2 ;
  else Result = 0 ;
  return Result ;
} 
integer 
zcheckmcharrange ( integer c ) 
{
  register integer Result; checkmcharrange_regmem 
  if ( ( c > 255 ) && ( c < 11904 ) ) 
  Result = 1 ;
  else Result = 0 ;
  return Result ;
} 
void 
zprintunreadbufferwithptenc ( integer f , integer l ) 
{
  printunreadbufferwithptenc_regmem 
  poolpointer i, j  ;
  integer p  ;
  i = f ;
  while ( i < l ) {
      
    p = multistrlen ( ustringcast ( buffer ) , l , i ) ;
    if ( p != 1 ) 
    {
      {register integer for_end; j = i ;for_end = i + p - 1 ; if ( j <= 
      for_end) do 
	printchar ( 256 + buffer [j ]) ;
      while ( j++ < for_end ) ;} 
      i = i + p ;
    } 
    else {
	
      print ( buffer [i ]) ;
      incr ( i ) ;
    } 
  } 
} 
#ifdef TEXMF_DEBUG
#endif /* TEXMF_DEBUG */
void 
jumpout ( void ) 
{
  jumpout_regmem 
  closefilesandterminate () ;
  {
    fflush ( stdout ) ;
    readyalready = 0 ;
    if ( ( history != 0 ) && ( history != 1 ) ) 
    uexit ( 1 ) ;
    else uexit ( 0 ) ;
  } 
} 
void 
error ( void ) 
{
  /* 22 10 */ error_regmem 
  ASCIIcode c  ;
  integer s1, s2, s3, s4  ;
  if ( history < 2 ) 
  history = 2 ;
  printchar ( 46 ) ;
  showcontext () ;
  if ( ( haltonerrorp ) ) 
  {
    if ( ( haltingonerrorp ) ) 
    {
      fflush ( stdout ) ;
      readyalready = 0 ;
      if ( ( history != 0 ) && ( history != 1 ) ) 
      uexit ( 1 ) ;
      else uexit ( 0 ) ;
    } 
    haltingonerrorp = true ;
    if ( interaction > 0 ) 
    decr ( selector ) ;
    if ( useerrhelp ) 
    {
      println () ;
      giveerrhelp () ;
    } 
    else while ( helpptr > 0 ) {
	
      decr ( helpptr ) ;
      printnl ( helpline [helpptr ]) ;
    } 
    println () ;
    if ( interaction > 0 ) 
    incr ( selector ) ;
    println () ;
    history = 3 ;
    jumpout () ;
  } 
  if ( interaction == 3 ) 
  while ( true ) {
      
    lab22: if ( interaction != 3 ) 
    return ;
    clearforerrorprompt () ;
    {
      ;
      print ( 267 ) ;
      terminput () ;
    } 
    if ( last == first ) 
    return ;
    c = buffer [first ];
    if ( c >= 97 ) 
    c = c - 32 ;
    switch ( c ) 
    {case 48 : 
    case 49 : 
    case 50 : 
    case 51 : 
    case 52 : 
    case 53 : 
    case 54 : 
    case 55 : 
    case 56 : 
    case 57 : 
      if ( deletionsallowed ) 
      {
	s1 = curtok ;
	s2 = curcmd ;
	s3 = curchr ;
	s4 = alignstate ;
	alignstate = 1000000L ;
	OKtointerrupt = false ;
	if ( ( last > first + 1 ) && ( buffer [first + 1 ]>= 48 ) && ( 
	buffer [first + 1 ]<= 57 ) ) 
	c = c * 10 + buffer [first + 1 ]- 48 * 11 ;
	else c = c - 48 ;
	while ( c > 0 ) {
	    
	  gettoken () ;
	  decr ( c ) ;
	} 
	curtok = s1 ;
	curcmd = s2 ;
	curchr = s3 ;
	alignstate = s4 ;
	OKtointerrupt = true ;
	{
	  helpptr = 2 ;
	  helpline [1 ]= 280 ;
	  helpline [0 ]= 281 ;
	} 
	showcontext () ;
	goto lab22 ;
      } 
      break ;
	;
#ifdef TEXMF_DEBUG
    case 68 : 
      {
	debughelp () ;
	goto lab22 ;
      } 
      break ;
#endif /* TEXMF_DEBUG */
    case 69 : 
      if ( baseptr > 0 ) {
	  
	if ( inputstack [baseptr ].namefield >= 256 ) 
	{
	  editnamestart = strstart [inputstack [baseptr ].namefield ];
	  editnamelength = strstart [inputstack [baseptr ].namefield + 1 ]
	  - strstart [inputstack [baseptr ].namefield ];
	  editline = line ;
	  jumpout () ;
	} 
      } 
      break ;
    case 72 : 
      {
	if ( useerrhelp ) 
	{
	  giveerrhelp () ;
	  useerrhelp = false ;
	} 
	else {
	    
	  if ( helpptr == 0 ) 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 282 ;
	    helpline [0 ]= 283 ;
	  } 
	  do {
	      decr ( helpptr ) ;
	    print ( helpline [helpptr ]) ;
	    println () ;
	  } while ( ! ( helpptr == 0 ) ) ;
	} 
	{
	  helpptr = 4 ;
	  helpline [3 ]= 284 ;
	  helpline [2 ]= 283 ;
	  helpline [1 ]= 285 ;
	  helpline [0 ]= 286 ;
	} 
	goto lab22 ;
      } 
      break ;
    case 73 : 
      {
	beginfilereading () ;
	if ( last > first + 1 ) 
	{
	  curinput .locfield = first + 1 ;
	  buffer [first ]= 32 ;
	} 
	else {
	    
	  {
	    ;
	    print ( 279 ) ;
	    terminput () ;
	  } 
	  curinput .locfield = first ;
	} 
	first = last ;
	curinput .limitfield = last - 1 ;
	return ;
      } 
      break ;
    case 81 : 
    case 82 : 
    case 83 : 
      {
	errorcount = 0 ;
	interaction = 0 + c - 81 ;
	print ( 274 ) ;
	switch ( c ) 
	{case 81 : 
	  {
	    printesc ( 275 ) ;
	    decr ( selector ) ;
	  } 
	  break ;
	case 82 : 
	  printesc ( 276 ) ;
	  break ;
	case 83 : 
	  printesc ( 277 ) ;
	  break ;
	} 
	print ( 278 ) ;
	println () ;
	fflush ( stdout ) ;
	return ;
      } 
      break ;
    case 88 : 
      {
	interaction = 2 ;
	jumpout () ;
      } 
      break ;
      default: 
      ;
      break ;
    } 
    {
      print ( 268 ) ;
      printnl ( 269 ) ;
      printnl ( 270 ) ;
      if ( baseptr > 0 ) {
	  
	if ( inputstack [baseptr ].namefield >= 256 ) 
	print ( 271 ) ;
      } 
      if ( deletionsallowed ) 
      printnl ( 272 ) ;
      printnl ( 273 ) ;
    } 
  } 
  incr ( errorcount ) ;
  if ( errorcount == 100 ) 
  {
    printnl ( 266 ) ;
    history = 3 ;
    jumpout () ;
  } 
  if ( interaction > 0 ) 
  decr ( selector ) ;
  if ( useerrhelp ) 
  {
    println () ;
    giveerrhelp () ;
  } 
  else while ( helpptr > 0 ) {
      
    decr ( helpptr ) ;
    printnl ( helpline [helpptr ]) ;
  } 
  println () ;
  if ( interaction > 0 ) 
  incr ( selector ) ;
  println () ;
} 
void 
zfatalerror ( strnumber s ) 
{
  fatalerror_regmem 
  normalizeselector () ;
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 288 ) ;
  } 
  {
    helpptr = 1 ;
    helpline [0 ]= s ;
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
void 
zoverflow ( strnumber s , integer n ) 
{
  overflow_regmem 
  normalizeselector () ;
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 289 ) ;
  } 
  print ( s ) ;
  printchar ( 61 ) ;
  printint ( n ) ;
  printchar ( 93 ) ;
  {
    helpptr = 2 ;
    helpline [1 ]= 290 ;
    helpline [0 ]= 291 ;
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
void 
zconfusion ( strnumber s ) 
{
  confusion_regmem 
  normalizeselector () ;
  if ( history < 2 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 292 ) ;
    } 
    print ( s ) ;
    printchar ( 41 ) ;
    {
      helpptr = 1 ;
      helpline [0 ]= 293 ;
    } 
  } 
  else {
      
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 294 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 295 ;
      helpline [0 ]= 296 ;
    } 
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
boolean 
initterminal ( void ) 
{
  /* 10 */ register boolean Result; initterminal_regmem 
  topenin () ;
  if ( last > first ) 
  {
    curinput .locfield = first ;
    while ( ( curinput .locfield < last ) && ( buffer [curinput .locfield ]
    == ' ' ) ) incr ( curinput .locfield ) ;
    if ( curinput .locfield < last ) 
    {
      Result = true ;
      return Result ;
    } 
  } 
  while ( true ) {
      
    ;
    Fputs ( stdout ,  "**" ) ;
    fflush ( stdout ) ;
    if ( ! inputln ( stdin , true ) ) 
    {
      putc ('\n',  stdout );
      fprintf ( stdout , "%s\n",  "! End of file on the terminal... why?" ) ;
      Result = false ;
      return Result ;
    } 
    curinput .locfield = first ;
    while ( ( curinput .locfield < last ) && ( buffer [curinput .locfield ]
    == 32 ) ) incr ( curinput .locfield ) ;
    if ( curinput .locfield < last ) 
    {
      Result = true ;
      return Result ;
    } 
    fprintf ( stdout , "%s\n",  "Please type the name of your input file." ) ;
  } 
  return Result ;
} 
strnumber 
makestring ( void ) 
{
  register strnumber Result; makestring_regmem 
  if ( strptr == maxstrings ) 
  overflow ( 261 , maxstrings - initstrptr ) ;
  incr ( strptr ) ;
  strstart [strptr ]= poolptr ;
  Result = strptr - 1 ;
  return Result ;
} 
boolean 
zstreqbuf ( strnumber s , integer k ) 
{
  /* 45 */ register boolean Result; streqbuf_regmem 
  poolpointer j  ;
  boolean result  ;
  j = strstart [s ];
  while ( j < strstart [s + 1 ]) {
      
    if ( strpool [j ]!= buffer2 [k ]* 256 + buffer [k ]) 
    {
      result = false ;
      goto lab45 ;
    } 
    incr ( j ) ;
    incr ( k ) ;
  } 
  result = true ;
  lab45: Result = result ;
  return Result ;
} 
boolean 
zstreqstr ( strnumber s , strnumber t ) 
{
  /* 45 */ register boolean Result; streqstr_regmem 
  poolpointer j, k  ;
  boolean result  ;
  result = false ;
  if ( ( strstart [s + 1 ]- strstart [s ]) != ( strstart [t + 1 ]- 
  strstart [t ]) ) 
  goto lab45 ;
  j = strstart [s ];
  k = strstart [t ];
  while ( j < strstart [s + 1 ]) {
      
    if ( strpool [j ]!= strpool [k ]) 
    goto lab45 ;
    incr ( j ) ;
    incr ( k ) ;
  } 
  result = true ;
  lab45: Result = result ;
  return Result ;
} 
strnumber 
zsearchstring ( strnumber search ) 
{
  /* 40 */ register strnumber Result; searchstring_regmem 
  strnumber result  ;
  strnumber s  ;
  integer len  ;
  result = 0 ;
  len = ( strstart [search + 1 ]- strstart [search ]) ;
  if ( len == 0 ) 
  {
    result = 349 ;
    goto lab40 ;
  } 
  else {
      
    s = search - 1 ;
    while ( s > 255 ) {
	
      if ( ( strstart [s + 1 ]- strstart [s ]) == len ) {
	  
	if ( streqstr ( s , search ) ) 
	{
	  result = s ;
	  goto lab40 ;
	} 
      } 
      decr ( s ) ;
    } 
  } 
  lab40: Result = result ;
  return Result ;
} 
strnumber 
slowmakestring ( void ) 
{
  /* 10 */ register strnumber Result; slowmakestring_regmem 
  strnumber s  ;
  strnumber t  ;
  t = makestring () ;
  s = searchstring ( t ) ;
  if ( s > 0 ) 
  {
    {
      decr ( strptr ) ;
      poolptr = strstart [strptr ];
    } 
    Result = s ;
    return Result ;
  } 
  Result = t ;
  return Result ;
} 
void 
zprinttwo ( integer n ) 
{
  printtwo_regmem 
  n = abs ( n ) % 100 ;
  printchar ( 48 + ( n / 10 ) ) ;
  printchar ( 48 + ( n % 10 ) ) ;
} 
void 
zprinthex ( integer n ) 
{
  printhex_regmem 
  unsigned char k  ;
  k = 0 ;
  printchar ( 34 ) ;
  do {
      dig [k ]= n % 16 ;
    n = n / 16 ;
    incr ( k ) ;
  } while ( ! ( n == 0 ) ) ;
  printthedigs ( k ) ;
} 
void 
zprintromanint ( integer n ) 
{
  /* 10 */ printromanint_regmem 
  poolpointer j, k  ;
  nonnegativeinteger u, v  ;
  j = strstart [263 ];
  v = 1000 ;
  while ( true ) {
      
    while ( n >= v ) {
	
      printchar ( strpool [j ]) ;
      n = n - v ;
    } 
    if ( n <= 0 ) 
    return ;
    k = j + 2 ;
    u = v / ( strpool [k - 1 ]- 48 ) ;
    if ( strpool [k - 1 ]== 50 ) 
    {
      k = k + 2 ;
      u = u / ( strpool [k - 1 ]- 48 ) ;
    } 
    if ( n + u >= v ) 
    {
      printchar ( strpool [k ]) ;
      n = n + u ;
    } 
    else {
	
      j = j + 2 ;
      v = v / ( strpool [j - 1 ]- 48 ) ;
    } 
  } 
} 
void 
printcurrentstring ( void ) 
{
  printcurrentstring_regmem 
  poolpointer j  ;
  j = strstart [strptr ];
  while ( j < poolptr ) {
      
    printchar ( strpool [j ]) ;
    incr ( j ) ;
  } 
} 
void 
terminput ( void ) 
{
  terminput_regmem 
  integer k  ;
  fflush ( stdout ) ;
  if ( ! inputln ( stdin , true ) ) 
  {
    curinput .limitfield = 0 ;
    fatalerror ( 264 ) ;
  } 
  termoffset = 0 ;
  decr ( selector ) ;
  if ( last != first ) 
  printunreadbufferwithptenc ( first , last ) ;
  println () ;
  incr ( selector ) ;
} 
void 
zinterror ( integer n ) 
{
  interror_regmem 
  print ( 287 ) ;
  printint ( n ) ;
  printchar ( 41 ) ;
  error () ;
} 
void 
normalizeselector ( void ) 
{
  normalizeselector_regmem 
  if ( logopened ) 
  selector = 19 ;
  else selector = 17 ;
  if ( jobname == 0 ) 
  openlogfile () ;
  if ( interaction == 0 ) 
  decr ( selector ) ;
} 
void 
pauseforinstructions ( void ) 
{
  pauseforinstructions_regmem 
  if ( OKtointerrupt ) 
  {
    interaction = 3 ;
    if ( ( selector == 18 ) || ( selector == 16 ) ) 
    incr ( selector ) ;
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 297 ) ;
    } 
    {
      helpptr = 3 ;
      helpline [2 ]= 298 ;
      helpline [1 ]= 299 ;
      helpline [0 ]= 300 ;
    } 
    deletionsallowed = false ;
    error () ;
    deletionsallowed = true ;
    interrupt = 0 ;
  } 
} 
integer 
zhalf ( integer x ) 
{
  register integer Result; half_regmem 
  if ( odd ( x ) ) 
  Result = ( x + 1 ) / 2 ;
  else Result = x / 2 ;
  return Result ;
} 
scaled 
zrounddecimals ( smallnumber k ) 
{
  register scaled Result; rounddecimals_regmem 
  integer a  ;
  a = 0 ;
  while ( k > 0 ) {
      
    decr ( k ) ;
    a = ( a + dig [k ]* 131072L ) / 10 ;
  } 
  Result = ( a + 1 ) / 2 ;
  return Result ;
} 
void 
zprintscaled ( scaled s ) 
{
  printscaled_regmem 
  scaled delta  ;
  if ( s < 0 ) 
  {
    printchar ( 45 ) ;
    s = - (integer) s ;
  } 
  printint ( s / 65536L ) ;
  printchar ( 46 ) ;
  s = 10 * ( s % 65536L ) + 5 ;
  delta = 10 ;
  do {
      if ( delta > 65536L ) 
    s = s - 17232 ;
    printchar ( 48 + ( s / 65536L ) ) ;
    s = 10 * ( s % 65536L ) ;
    delta = delta * 10 ;
  } while ( ! ( s <= delta ) ) ;
} 
scaled 
zmultandadd ( integer n , scaled x , scaled y , scaled maxanswer ) 
{
  register scaled Result; multandadd_regmem 
  if ( n < 0 ) 
  {
    x = - (integer) x ;
    n = - (integer) n ;
  } 
  if ( n == 0 ) 
  Result = y ;
  else if ( ( ( x <= ( maxanswer - y ) / n ) && ( - (integer) x <= ( maxanswer 
  + y ) / n ) ) ) 
  Result = n * x + y ;
  else {
      
    aritherror = true ;
    Result = 0 ;
  } 
  return Result ;
} 
scaled 
zxovern ( scaled x , integer n ) 
{
  register scaled Result; xovern_regmem 
  boolean negative  ;
  negative = false ;
  if ( n == 0 ) 
  {
    aritherror = true ;
    Result = 0 ;
    texremainder = x ;
  } 
  else {
      
    if ( n < 0 ) 
    {
      x = - (integer) x ;
      n = - (integer) n ;
      negative = true ;
    } 
    if ( x >= 0 ) 
    {
      Result = x / n ;
      texremainder = x % n ;
    } 
    else {
	
      Result = - (integer) ( ( - (integer) x ) / n ) ;
      texremainder = - (integer) ( ( - (integer) x ) % n ) ;
    } 
  } 
  if ( negative ) 
  texremainder = - (integer) texremainder ;
  return Result ;
} 
scaled 
zxnoverd ( scaled x , integer n , integer d ) 
{
  register scaled Result; xnoverd_regmem 
  boolean positive  ;
  nonnegativeinteger t, u, v  ;
  if ( x >= 0 ) 
  positive = true ;
  else {
      
    x = - (integer) x ;
    positive = false ;
  } 
  t = ( x % 32768L ) * n ;
  u = ( x / 32768L ) * n + ( t / 32768L ) ;
  v = ( u % d ) * 32768L + ( t % 32768L ) ;
  if ( u / d >= 32768L ) 
  aritherror = true ;
  else u = 32768L * ( u / d ) + ( v / d ) ;
  if ( positive ) 
  {
    Result = u ;
    texremainder = v % d ;
  } 
  else {
      
    Result = - (integer) u ;
    texremainder = - (integer) ( v % d ) ;
  } 
  return Result ;
} 
boolean 
zisbitset ( integer n , smallnumber s ) 
{
  register boolean Result; isbitset_regmem 
  integer m, i  ;
  m = 1 ;
  {register integer for_end; i = 1 ;for_end = s - 1 ; if ( i <= for_end) do 
    m = m * 2 ;
  while ( i++ < for_end ) ;} 
  Result = ( n / m ) % 2 ;
  return Result ;
} 
halfword 
zbadness ( scaled t , scaled s ) 
{
  register halfword Result; badness_regmem 
  integer r  ;
  if ( t == 0 ) 
  Result = 0 ;
  else if ( s <= 0 ) 
  Result = 10000 ;
  else {
      
    if ( t <= 7230584L ) 
    r = ( t * 297 ) / s ;
    else if ( s >= 1663497L ) 
    r = t / ( s / 297 ) ;
    else r = t ;
    if ( r > 1290 ) 
    Result = 10000 ;
    else Result = ( r * r * r + 131072L ) / 262144L ;
  } 
  return Result ;
} 
integer 
zmakefrac ( integer p , integer q ) 
{
  register integer Result; makefrac_regmem 
  integer f  ;
  integer n  ;
  boolean negative  ;
  integer becareful  ;
  if ( p >= 0 ) 
  negative = false ;
  else {
      
    p = - (integer) p ;
    negative = true ;
  } 
  if ( q <= 0 ) 
  {
	;
#ifdef TEXMF_DEBUG
    if ( q == 0 ) 
    confusion ( 47 ) ;
#endif /* TEXMF_DEBUG */
    q = - (integer) q ;
    negative = ! negative ;
  } 
  n = p / q ;
  p = p % q ;
  if ( n >= 8 ) 
  {
    aritherror = true ;
    if ( negative ) 
    Result = -2147483647L ;
    else Result = 2147483647L ;
  } 
  else {
      
    n = ( n - 1 ) * 268435456L ;
    f = 1 ;
    do {
	becareful = p - q ;
      p = becareful + p ;
      if ( p >= 0 ) 
      f = f + f + 1 ;
      else {
	  
	f = f + f ;
	p = p + q ;
      } 
    } while ( ! ( f >= 268435456L ) ) ;
    becareful = p - q ;
    if ( becareful + p >= 0 ) 
    incr ( f ) ;
    if ( negative ) 
    Result = - (integer) ( f + n ) ;
    else Result = f + n ;
  } 
  return Result ;
} 
integer 
ztakefrac ( integer q , integer f ) 
{
  register integer Result; takefrac_regmem 
  integer p  ;
  boolean negative  ;
  integer n  ;
  integer becareful  ;
  if ( f >= 0 ) 
  negative = false ;
  else {
      
    f = - (integer) f ;
    negative = true ;
  } 
  if ( q < 0 ) 
  {
    q = - (integer) q ;
    negative = ! negative ;
  } 
  if ( f < 268435456L ) 
  n = 0 ;
  else {
      
    n = f / 268435456L ;
    f = f % 268435456L ;
    if ( q <= 2147483647L / n ) 
    n = n * q ;
    else {
	
      aritherror = true ;
      n = 2147483647L ;
    } 
  } 
  f = f + 268435456L ;
  p = 134217728L ;
  if ( q < 1073741824L ) 
  do {
      if ( odd ( f ) ) 
    p = ( p + q ) / 2 ;
    else p = ( p ) / 2 ;
    f = ( f ) / 2 ;
  } while ( ! ( f == 1 ) ) ;
  else do {
      if ( odd ( f ) ) 
    p = p + ( q - p ) / 2 ;
    else p = ( p ) / 2 ;
    f = ( f ) / 2 ;
  } while ( ! ( f == 1 ) ) ;
  becareful = n - 2147483647L ;
  if ( becareful + p > 0 ) 
  {
    aritherror = true ;
    n = 2147483647L - p ;
  } 
  if ( negative ) 
  Result = - (integer) ( n + p ) ;
  else Result = n + p ;
  return Result ;
} 
integer 
zmlog ( integer x ) 
{
  register integer Result; mlog_regmem 
  integer y, z  ;
  integer k  ;
  if ( x <= 0 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 301 ) ;
    } 
    printscaled ( x ) ;
    print ( 302 ) ;
    {
      helpptr = 2 ;
      helpline [1 ]= 303 ;
      helpline [0 ]= 304 ;
    } 
    error () ;
    Result = 0 ;
  } 
  else {
      
    y = 1302456860L ;
    z = 6581195L ;
    while ( x < 1073741824L ) {
	
      x = x + x ;
      y = y - 93032639L ;
      z = z - 48782L ;
    } 
    y = y + ( z / 65536L ) ;
    k = 2 ;
    while ( x > 1073741828L ) {
	
      z = ( ( x - 1 ) / twotothe [k ]) + 1 ;
      while ( x < 1073741824L + z ) {
	  
	z = ( z + 1 ) / 2 ;
	k = k + 1 ;
      } 
      y = y + speclog [k ];
      x = x - z ;
    } 
    Result = y / 8 ;
  } 
  return Result ;
} 
integer 
zabvscd ( integer a , integer b , integer c , integer d ) 
{
  /* 10 */ register integer Result; abvscd_regmem 
  integer q, r  ;
  if ( a < 0 ) 
  {
    a = - (integer) a ;
    b = - (integer) b ;
  } 
  if ( c < 0 ) 
  {
    c = - (integer) c ;
    d = - (integer) d ;
  } 
  if ( d <= 0 ) 
  {
    if ( b >= 0 ) {
	
      if ( ( ( a == 0 ) || ( b == 0 ) ) && ( ( c == 0 ) || ( d == 0 ) ) ) 
      {
	Result = 0 ;
	return Result ;
      } 
      else {
	  
	Result = 1 ;
	return Result ;
      } 
    } 
    if ( d == 0 ) {
	
      if ( a == 0 ) 
      {
	Result = 0 ;
	return Result ;
      } 
      else {
	  
	Result = -1 ;
	return Result ;
      } 
    } 
    q = a ;
    a = c ;
    c = q ;
    q = - (integer) b ;
    b = - (integer) d ;
    d = q ;
  } 
  else if ( b <= 0 ) 
  {
    if ( b < 0 ) {
	
      if ( a > 0 ) 
      {
	Result = -1 ;
	return Result ;
      } 
    } 
    if ( c == 0 ) 
    {
      Result = 0 ;
      return Result ;
    } 
    else {
	
      Result = -1 ;
      return Result ;
    } 
  } 
  while ( true ) {
      
    q = a / d ;
    r = c / b ;
    if ( q != r ) {
	
      if ( q > r ) 
      {
	Result = 1 ;
	return Result ;
      } 
      else {
	  
	Result = -1 ;
	return Result ;
      } 
    } 
    q = a % d ;
    r = c % b ;
    if ( r == 0 ) {
	
      if ( q == 0 ) 
      {
	Result = 0 ;
	return Result ;
      } 
      else {
	  
	Result = 1 ;
	return Result ;
      } 
    } 
    if ( q == 0 ) 
    {
      Result = -1 ;
      return Result ;
    } 
    a = b ;
    b = q ;
    c = d ;
    d = r ;
  } 
  return Result ;
} 
void 
newrandoms ( void ) 
{
  newrandoms_regmem 
  unsigned char k  ;
  integer x  ;
  {register integer for_end; k = 0 ;for_end = 23 ; if ( k <= for_end) do 
    {
      x = randoms [k ]- randoms [k + 31 ];
      if ( x < 0 ) 
      x = x + 268435456L ;
      randoms [k ]= x ;
    } 
  while ( k++ < for_end ) ;} 
  {register integer for_end; k = 24 ;for_end = 54 ; if ( k <= for_end) do 
    {
      x = randoms [k ]- randoms [k - 24 ];
      if ( x < 0 ) 
      x = x + 268435456L ;
      randoms [k ]= x ;
    } 
  while ( k++ < for_end ) ;} 
  jrandom = 54 ;
} 
void 
zinitrandoms ( integer seed ) 
{
  initrandoms_regmem 
  integer j, jj, k  ;
  unsigned char i  ;
  j = abs ( seed ) ;
  while ( j >= 268435456L ) j = ( j ) / 2 ;
  k = 1 ;
  {register integer for_end; i = 0 ;for_end = 54 ; if ( i <= for_end) do 
    {
      jj = k ;
      k = j - k ;
      j = jj ;
      if ( k < 0 ) 
      k = k + 268435456L ;
      randoms [( i * 21 ) % 55 ]= j ;
    } 
  while ( i++ < for_end ) ;} 
  newrandoms () ;
  newrandoms () ;
  newrandoms () ;
} 
integer 
zunifrand ( integer x ) 
{
  register integer Result; unifrand_regmem 
  integer y  ;
  if ( jrandom == 0 ) 
  newrandoms () ;
  else decr ( jrandom ) ;
  y = takefrac ( abs ( x ) , randoms [jrandom ]) ;
  if ( y == abs ( x ) ) 
  Result = 0 ;
  else if ( x > 0 ) 
  Result = y ;
  else Result = - (integer) y ;
  return Result ;
} 
integer 
normrand ( void ) 
{
  register integer Result; normrand_regmem 
  integer x, u, l  ;
  do {
      do { if ( jrandom == 0 ) 
      newrandoms () ;
      else decr ( jrandom ) ;
      x = takefrac ( 112429L , randoms [jrandom ]- 134217728L ) ;
      if ( jrandom == 0 ) 
      newrandoms () ;
      else decr ( jrandom ) ;
      u = randoms [jrandom ];
    } while ( ! ( abs ( x ) < u ) ) ;
    x = makefrac ( x , u ) ;
    l = 139548960L - mlog ( u ) ;
  } while ( ! ( abvscd ( 1024 , l , x , x ) >= 0 ) ) ;
  Result = x ;
  return Result ;
} 
#ifdef TEXMF_DEBUG
void 
zprintword ( memoryword w ) 
{
  printword_regmem 
  printint ( w .cint ) ;
  printchar ( 32 ) ;
  printscaled ( w .cint ) ;
  printchar ( 32 ) ;
  printscaled ( round ( 65536L * w .gr ) ) ;
  println () ;
  printint ( w .hh .v.LH ) ;
  printchar ( 61 ) ;
  printint ( w .hh.b0 ) ;
  printchar ( 58 ) ;
  printint ( w .hh.b1 ) ;
  printchar ( 59 ) ;
  printint ( w .hh .v.RH ) ;
  printchar ( 32 ) ;
  printint ( w .qqqq .b0 ) ;
  printchar ( 58 ) ;
  printint ( w .qqqq .b1 ) ;
  printchar ( 58 ) ;
  printint ( w .qqqq .b2 ) ;
  printchar ( 58 ) ;
  printint ( w .qqqq .b3 ) ;
} 
#endif /* TEXMF_DEBUG */
void 
zshowtokenlist ( integer p , integer q , integer l ) 
{
  /* 10 */ showtokenlist_regmem 
  integer m, c  ;
  short matchchr  ;
  ASCIIcode n  ;
  matchchr = 35 ;
  n = 48 ;
  tally = 0 ;
  while ( ( p != -1073741823L ) && ( tally < l ) ) {
      
    if ( p == q ) 
    {
      firstcount = tally ;
      kcp = trickbuf2 [( firstcount - 1 ) % errorline ];
      if ( ( firstcount > 0 ) && ( kcp > 0 ) ) 
      firstcount = firstcount + nrestmultichr ( kcp ) ;
      trickcount = firstcount + 1 + errorline - halferrorline ;
      if ( trickcount < errorline ) 
      trickcount = errorline ;
    } 
    if ( ( p < himemmin ) || ( p > memend ) ) 
    {
      printesc ( 319 ) ;
      return ;
    } 
    if ( mem [p ].hh .v.LH >= 536870911L ) 
    printcs ( mem [p ].hh .v.LH - 536870911L ) ;
    else {
	
      if ( checkkanji ( mem [p ].hh .v.LH ) ) 
      {
	m = ktokentocmd ( mem [p ].hh .v.LH ) ;
	c = ktokentochr ( mem [p ].hh .v.LH ) ;
      } 
      else {
	  
	m = mem [p ].hh .v.LH / 65536L ;
	c = mem [p ].hh .v.LH % 65536L ;
      } 
      if ( ( m < 16 ) && ( c >= 11904 ) ) 
      printesc ( 643 ) ;
      else switch ( m ) 
      {case 16 : 
      case 17 : 
      case 18 : 
      case 19 : 
      case 20 : 
	printkanji ( c ) ;
	break ;
      case 1 : 
      case 2 : 
      case 3 : 
      case 4 : 
      case 7 : 
      case 8 : 
      case 10 : 
      case 11 : 
      case 12 : 
	if ( ( checkecharrange ( c ) == 1 ) || ( checkmcharrange ( c ) ) ) 
	printkanji ( c ) ;
	else print ( c ) ;
	break ;
      case 6 : 
	{
	  if ( ( checkecharrange ( c ) == 1 ) || ( checkmcharrange ( c ) ) ) 
	  {
	    printkanji ( c ) ;
	    printkanji ( c ) ;
	  } 
	  else {
	      
	    print ( c ) ;
	    print ( c ) ;
	  } 
	} 
	break ;
      case 5 : 
	{
	  if ( ( checkecharrange ( matchchr ) == 1 ) || ( checkmcharrange ( 
	  matchchr ) ) ) 
	  printkanji ( matchchr ) ;
	  else print ( matchchr ) ;
	  if ( c <= 9 ) 
	  printchar ( c + 48 ) ;
	  else {
	      
	    printchar ( 33 ) ;
	    return ;
	  } 
	} 
	break ;
      case 13 : 
	{
	  matchchr = c ;
	  if ( ( checkecharrange ( c ) == 1 ) || ( checkmcharrange ( c ) ) ) 
	  printkanji ( c ) ;
	  else print ( c ) ;
	  incr ( n ) ;
	  printchar ( n ) ;
	  if ( n > 57 ) 
	  return ;
	} 
	break ;
      case 14 : 
	if ( c == 0 ) 
	print ( 644 ) ;
	break ;
	default: 
	printesc ( 643 ) ;
	break ;
      } 
    } 
    p = mem [p ].hh .v.RH ;
  } 
  if ( p != -1073741823L ) 
  printesc ( 436 ) ;
} 
void 
runaway ( void ) 
{
  runaway_regmem 
  halfword p  ;
  if ( scannerstatus > 1 ) 
  {
    switch ( scannerstatus ) 
    {case 2 : 
      {
	printnl ( 659 ) ;
	p = defref ;
      } 
      break ;
    case 3 : 
      {
	printnl ( 660 ) ;
	p = memtop - 3 ;
      } 
      break ;
    case 4 : 
      {
	printnl ( 661 ) ;
	p = memtop - 4 ;
      } 
      break ;
    case 5 : 
      {
	printnl ( 662 ) ;
	p = defref ;
      } 
      break ;
    } 
    printchar ( 63 ) ;
    println () ;
    showtokenlist ( mem [p ].hh .v.RH , -1073741823L , errorline - 10 ) ;
  } 
} 
halfword 
getavail ( void ) 
{
  register halfword Result; getavail_regmem 
  halfword p  ;
  p = avail ;
  if ( p != -1073741823L ) 
  avail = mem [avail ].hh .v.RH ;
  else if ( memend < memmax ) 
  {
    incr ( memend ) ;
    p = memend ;
  } 
  else {
      
    decr ( himemmin ) ;
    p = himemmin ;
    if ( himemmin <= lomemmax ) 
    {
      runaway () ;
      overflow ( 305 , memmax + 1 - memmin ) ;
    } 
  } 
  mem [p ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
  incr ( dynused ) ;
#endif /* STAT */
  Result = p ;
  return Result ;
} 
void 
zflushlist ( halfword p ) 
{
  flushlist_regmem 
  halfword q, r  ;
  if ( p != -1073741823L ) 
  {
    r = p ;
    do {
	q = r ;
      r = mem [r ].hh .v.RH ;
	;
#ifdef STAT
      decr ( dynused ) ;
#endif /* STAT */
    } while ( ! ( r == -1073741823L ) ) ;
    mem [q ].hh .v.RH = avail ;
    avail = p ;
  } 
} 
halfword 
zgetnode ( integer s ) 
{
  /* 40 10 20 */ register halfword Result; getnode_regmem 
  halfword p  ;
  halfword q  ;
  integer r  ;
  integer t  ;
  lab20: p = rover ;
  do {
      q = p + mem [p ].hh .v.LH ;
    while ( ( mem [q ].hh .v.RH == 1073741823L ) ) {
	
      t = mem [q + 1 ].hh .v.RH ;
      if ( q == rover ) 
      rover = t ;
      mem [t + 1 ].hh .v.LH = mem [q + 1 ].hh .v.LH ;
      mem [mem [q + 1 ].hh .v.LH + 1 ].hh .v.RH = t ;
      q = q + mem [q ].hh .v.LH ;
    } 
    r = q - s ;
    if ( r > p + 1 ) 
    {
      mem [p ].hh .v.LH = r - p ;
      rover = p ;
      goto lab40 ;
    } 
    if ( r == p ) {
	
      if ( mem [p + 1 ].hh .v.RH != p ) 
      {
	rover = mem [p + 1 ].hh .v.RH ;
	t = mem [p + 1 ].hh .v.LH ;
	mem [rover + 1 ].hh .v.LH = t ;
	mem [t + 1 ].hh .v.RH = rover ;
	goto lab40 ;
      } 
    } 
    mem [p ].hh .v.LH = q - p ;
    p = mem [p + 1 ].hh .v.RH ;
  } while ( ! ( p == rover ) ) ;
  if ( s == 1073741824L ) 
  {
    Result = 1073741823L ;
    return Result ;
  } 
  if ( lomemmax + 2 < himemmin ) {
      
    if ( lomemmax + 2 <= membot + 1073741823L ) 
    {
      if ( himemmin - lomemmax >= 1998 ) 
      t = lomemmax + 1000 ;
      else t = lomemmax + 1 + ( himemmin - lomemmax ) / 2 ;
      p = mem [rover + 1 ].hh .v.LH ;
      q = lomemmax ;
      mem [p + 1 ].hh .v.RH = q ;
      mem [rover + 1 ].hh .v.LH = q ;
      if ( t > membot + 1073741823L ) 
      t = membot + 1073741823L ;
      mem [q + 1 ].hh .v.RH = rover ;
      mem [q + 1 ].hh .v.LH = p ;
      mem [q ].hh .v.RH = 1073741823L ;
      mem [q ].hh .v.LH = t - lomemmax ;
      lomemmax = t ;
      mem [lomemmax ].hh .v.RH = -1073741823L ;
      mem [lomemmax ].hh .v.LH = -1073741823L ;
      rover = q ;
      goto lab20 ;
    } 
  } 
  overflow ( 305 , memmax + 1 - memmin ) ;
  lab40: mem [r ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
  varused = varused + s ;
#endif /* STAT */
  if ( s >= 4 ) 
  {
    mem [r + s - 2 ].cint = curinput .synctextagfield ;
    mem [r + s - 1 ].cint = line ;
  } 
  Result = r ;
  return Result ;
} 
void 
zfreenode ( halfword p , halfword s ) 
{
  freenode_regmem 
  halfword q  ;
  mem [p ].hh .v.LH = s ;
  mem [p ].hh .v.RH = 1073741823L ;
  q = mem [rover + 1 ].hh .v.LH ;
  mem [p + 1 ].hh .v.LH = q ;
  mem [p + 1 ].hh .v.RH = rover ;
  mem [rover + 1 ].hh .v.LH = p ;
  mem [q + 1 ].hh .v.RH = p ;
	;
#ifdef STAT
  varused = varused - s ;
#endif /* STAT */
} 
halfword 
newnullbox ( void ) 
{
  register halfword Result; newnullbox_regmem 
  halfword p  ;
  p = getnode ( 10 ) ;
  mem [p ].hh.b0 = 0 ;
  mem [p ].hh.b1 = 0 ;
  mem [p + 1 ].cint = 0 ;
  mem [p + 2 ].cint = 0 ;
  mem [p + 3 ].cint = 0 ;
  mem [p + 4 ].cint = 0 ;
  mem [p + 5 ].hh .v.RH = -1073741823L ;
  mem [p + 5 ].hh.b0 = 0 ;
  mem [p + 5 ].hh.b1 = 0 ;
  mem [p + 6 ].gr = 0.0 ;
  mem [p + 7 ].hh .v.RH = membot ;
  mem [p + 7 ].hh .v.LH = membot ;
  mem [p ].hh.b1 = ( ( mem [p ].hh.b1 ) / 16 ) * 16 + 5 ;
  incr ( mem [membot ].hh .v.RH ) ;
  incr ( mem [membot ].hh .v.RH ) ;
  Result = p ;
  return Result ;
} 
halfword 
znewdirnode ( halfword b , eightbits dir ) 
{
  register halfword Result; newdirnode_regmem 
  halfword p  ;
  if ( mem [b ].hh.b0 > 1 ) 
  confusion ( 306 ) ;
  p = newnullbox () ;
  mem [p ].hh.b0 = 2 ;
  mem [p ].hh.b1 = ( ( mem [p ].hh.b1 ) / 16 ) * 16 + dir + 5 ;
  switch ( abs ( ( ( mem [b ].hh.b1 ) % 16 - 5 ) ) ) 
  {case 4 : 
    switch ( dir ) 
    {case 3 : 
      {
	mem [p + 1 ].cint = mem [b + 3 ].cint + mem [b + 2 ].cint ;
	mem [p + 2 ].cint = mem [b + 1 ].cint / ((double) 2 ) ;
	mem [p + 3 ].cint = mem [b + 1 ].cint - mem [p + 2 ].cint ;
      } 
      break ;
    case 1 : 
      {
	mem [p + 1 ].cint = mem [b + 3 ].cint + mem [b + 2 ].cint ;
	mem [p + 2 ].cint = 0 ;
	mem [p + 3 ].cint = mem [b + 1 ].cint ;
      } 
      break ;
      default: 
      confusion ( 308 ) ;
      break ;
    } 
    break ;
  case 3 : 
    switch ( dir ) 
    {case 4 : 
      {
	mem [p + 1 ].cint = mem [b + 3 ].cint + mem [b + 2 ].cint ;
	mem [p + 2 ].cint = 0 ;
	mem [p + 3 ].cint = mem [b + 1 ].cint ;
      } 
      break ;
    case 1 : 
      {
	mem [p + 1 ].cint = mem [b + 1 ].cint ;
	mem [p + 2 ].cint = mem [b + 3 ].cint ;
	mem [p + 3 ].cint = mem [b + 2 ].cint ;
      } 
      break ;
      default: 
      confusion ( 309 ) ;
      break ;
    } 
    break ;
  case 1 : 
    switch ( dir ) 
    {case 4 : 
      {
	mem [p + 1 ].cint = mem [b + 3 ].cint + mem [b + 2 ].cint ;
	mem [p + 2 ].cint = 0 ;
	mem [p + 3 ].cint = mem [b + 1 ].cint ;
      } 
      break ;
    case 3 : 
      {
	mem [p + 1 ].cint = mem [b + 1 ].cint ;
	mem [p + 2 ].cint = mem [b + 3 ].cint ;
	mem [p + 3 ].cint = mem [b + 2 ].cint ;
      } 
      break ;
      default: 
      confusion ( 310 ) ;
      break ;
    } 
    break ;
    default: 
    confusion ( 307 ) ;
    break ;
  } 
  mem [b ].hh .v.RH = -1073741823L ;
  mem [p + 5 ].hh .v.RH = b ;
  Result = p ;
  return Result ;
} 
halfword 
newrule ( void ) 
{
  register halfword Result; newrule_regmem 
  halfword p  ;
  p = getnode ( 6 ) ;
  mem [p ].hh.b0 = 3 ;
  mem [p ].hh.b1 = 0 ;
  mem [p + 1 ].cint = -1073741824L ;
  mem [p + 2 ].cint = -1073741824L ;
  mem [p + 3 ].cint = -1073741824L ;
  Result = p ;
  return Result ;
} 
halfword 
znewligature ( internalfontnumber f , quarterword c , halfword q ) 
{
  register halfword Result; newligature_regmem 
  halfword p  ;
  p = getnode ( 2 ) ;
  c = ptenc8bitcodetoucs ( fontenc [f ], c ) ;
  mem [p ].hh.b0 = 8 ;
  mem [p + 1 ].hh.b0 = f ;
  mem [p + 1 ].hh.b1 = c ;
  mem [p + 1 ].hh .v.RH = q ;
  mem [p ].hh.b1 = 0 ;
  Result = p ;
  return Result ;
} 
halfword 
znewligitem ( quarterword c ) 
{
  register halfword Result; newligitem_regmem 
  halfword p  ;
  p = getnode ( 2 ) ;
  c = ptenc8bitcodetoucs ( fontenc [f ], c ) ;
  mem [p ].hh.b1 = c ;
  mem [p + 1 ].hh .v.RH = -1073741823L ;
  Result = p ;
  return Result ;
} 
halfword 
newdisc ( void ) 
{
  register halfword Result; newdisc_regmem 
  halfword p  ;
  p = getnode ( 2 ) ;
  mem [p ].hh.b0 = 9 ;
  mem [p ].hh.b1 = 0 ;
  mem [p + 1 ].hh .v.LH = -1073741823L ;
  mem [p + 1 ].hh .v.RH = -1073741823L ;
  Result = p ;
  return Result ;
} 
halfword 
znewmath ( scaled w , smallnumber s ) 
{
  register halfword Result; newmath_regmem 
  halfword p  ;
  p = getnode ( 4 ) ;
  mem [p ].hh.b0 = 11 ;
  mem [p ].hh.b1 = s ;
  mem [p + 1 ].cint = w ;
  Result = p ;
  return Result ;
} 
halfword 
znewspec ( halfword p ) 
{
  register halfword Result; newspec_regmem 
  halfword q  ;
  q = getnode ( 4 ) ;
  mem [q ]= mem [p ];
  mem [q ].hh .v.RH = -1073741823L ;
  mem [q + 1 ].cint = mem [p + 1 ].cint ;
  mem [q + 2 ].cint = mem [p + 2 ].cint ;
  mem [q + 3 ].cint = mem [p + 3 ].cint ;
  Result = q ;
  return Result ;
} 
halfword 
znewparamglue ( smallnumber n ) 
{
  register halfword Result; newparamglue_regmem 
  halfword p  ;
  halfword q  ;
  p = getnode ( 4 ) ;
  mem [p ].hh.b0 = 12 ;
  mem [p ].hh.b1 = n + 1 ;
  mem [p + 1 ].hh .v.RH = -1073741823L ;
  q = eqtb [49925L + n ].hh .v.RH ;
  mem [p + 1 ].hh .v.LH = q ;
  incr ( mem [q ].hh .v.RH ) ;
  Result = p ;
  return Result ;
} 
halfword 
znewglue ( halfword q ) 
{
  register halfword Result; newglue_regmem 
  halfword p  ;
  p = getnode ( 4 ) ;
  mem [p ].hh.b0 = 12 ;
  mem [p ].hh.b1 = 0 ;
  mem [p + 1 ].hh .v.RH = -1073741823L ;
  mem [p + 1 ].hh .v.LH = q ;
  incr ( mem [q ].hh .v.RH ) ;
  Result = p ;
  return Result ;
} 
halfword 
znewskipparam ( smallnumber n ) 
{
  register halfword Result; newskipparam_regmem 
  halfword p  ;
  tempptr = newspec ( eqtb [49925L + n ].hh .v.RH ) ;
  p = newglue ( tempptr ) ;
  mem [tempptr ].hh .v.RH = -1073741823L ;
  mem [p ].hh.b1 = n + 1 ;
  Result = p ;
  return Result ;
} 
halfword 
znewkern ( scaled w ) 
{
  register halfword Result; newkern_regmem 
  halfword p  ;
  p = getnode ( 4 ) ;
  mem [p ].hh.b0 = 13 ;
  mem [p ].hh.b1 = 0 ;
  mem [p + 1 ].cint = w ;
  Result = p ;
  return Result ;
} 
halfword 
znewpenalty ( integer m ) 
{
  register halfword Result; newpenalty_regmem 
  halfword p  ;
  p = getnode ( 4 ) ;
  mem [p ].hh.b0 = 14 ;
  mem [p ].hh.b1 = 0 ;
  mem [p + 1 ].cint = m ;
  Result = p ;
  return Result ;
} 
#ifdef TEXMF_DEBUG
void 
zcheckmem ( boolean printlocs ) 
{
  /* 31 32 */ checkmem_regmem 
  halfword p, q  ;
  boolean clobbered  ;
  {register integer for_end; p = memmin ;for_end = lomemmax ; if ( p <= 
  for_end) do 
    freearr [p ]= false ;
  while ( p++ < for_end ) ;} 
  {register integer for_end; p = himemmin ;for_end = memend ; if ( p <= 
  for_end) do 
    freearr [p ]= false ;
  while ( p++ < for_end ) ;} 
  p = avail ;
  q = -1073741823L ;
  clobbered = false ;
  while ( p != -1073741823L ) {
      
    if ( ( p > memend ) || ( p < himemmin ) ) 
    clobbered = true ;
    else if ( freearr [p ]) 
    clobbered = true ;
    if ( clobbered ) 
    {
      printnl ( 311 ) ;
      printint ( q ) ;
      goto lab31 ;
    } 
    freearr [p ]= true ;
    q = p ;
    p = mem [q ].hh .v.RH ;
  } 
  lab31: ;
  p = rover ;
  q = -1073741823L ;
  clobbered = false ;
  do {
      if ( ( p >= lomemmax ) || ( p < memmin ) ) 
    clobbered = true ;
    else if ( ( mem [p + 1 ].hh .v.RH >= lomemmax ) || ( mem [p + 1 ].hh 
    .v.RH < memmin ) ) 
    clobbered = true ;
    else if ( ! ( ( mem [p ].hh .v.RH == 1073741823L ) ) || ( mem [p ].hh 
    .v.LH < 2 ) || ( p + mem [p ].hh .v.LH > lomemmax ) || ( mem [mem [p + 
    1 ].hh .v.RH + 1 ].hh .v.LH != p ) ) 
    clobbered = true ;
    if ( clobbered ) 
    {
      printnl ( 312 ) ;
      printint ( q ) ;
      goto lab32 ;
    } 
    {register integer for_end; q = p ;for_end = p + mem [p ].hh .v.LH - 1 
    ; if ( q <= for_end) do 
      {
	if ( freearr [q ]) 
	{
	  printnl ( 313 ) ;
	  printint ( q ) ;
	  goto lab32 ;
	} 
	freearr [q ]= true ;
      } 
    while ( q++ < for_end ) ;} 
    q = p ;
    p = mem [p + 1 ].hh .v.RH ;
  } while ( ! ( p == rover ) ) ;
  lab32: ;
  p = memmin ;
  while ( p <= lomemmax ) {
      
    if ( ( mem [p ].hh .v.RH == 1073741823L ) ) 
    {
      printnl ( 314 ) ;
      printint ( p ) ;
    } 
    while ( ( p <= lomemmax ) && ! freearr [p ]) incr ( p ) ;
    while ( ( p <= lomemmax ) && freearr [p ]) incr ( p ) ;
  } 
  if ( printlocs ) 
  {
    printnl ( 315 ) ;
    {register integer for_end; p = memmin ;for_end = lomemmax ; if ( p <= 
    for_end) do 
      if ( ! freearr [p ]&& ( ( p > waslomax ) || wasfree [p ]) ) 
      {
	printchar ( 32 ) ;
	printint ( p ) ;
      } 
    while ( p++ < for_end ) ;} 
    {register integer for_end; p = himemmin ;for_end = memend ; if ( p <= 
    for_end) do 
      if ( ! freearr [p ]&& ( ( p < washimin ) || ( p > wasmemend ) || 
      wasfree [p ]) ) 
      {
	printchar ( 32 ) ;
	printint ( p ) ;
      } 
    while ( p++ < for_end ) ;} 
  } 
  {register integer for_end; p = memmin ;for_end = lomemmax ; if ( p <= 
  for_end) do 
    wasfree [p ]= freearr [p ];
  while ( p++ < for_end ) ;} 
  {register integer for_end; p = himemmin ;for_end = memend ; if ( p <= 
  for_end) do 
    wasfree [p ]= freearr [p ];
  while ( p++ < for_end ) ;} 
  wasmemend = memend ;
  waslomax = lomemmax ;
  washimin = himemmin ;
} 
#endif /* TEXMF_DEBUG */
#ifdef TEXMF_DEBUG
void 
zsearchmem ( halfword p ) 
{
  searchmem_regmem 
  integer q  ;
  {register integer for_end; q = memmin ;for_end = lomemmax ; if ( q <= 
  for_end) do 
    {
      if ( mem [q ].hh .v.RH == p ) 
      {
	printnl ( 316 ) ;
	printint ( q ) ;
	printchar ( 41 ) ;
      } 
      if ( mem [q ].hh .v.LH == p ) 
      {
	printnl ( 317 ) ;
	printint ( q ) ;
	printchar ( 41 ) ;
      } 
    } 
  while ( q++ < for_end ) ;} 
  {register integer for_end; q = himemmin ;for_end = memend ; if ( q <= 
  for_end) do 
    {
      if ( mem [q ].hh .v.RH == p ) 
      {
	printnl ( 316 ) ;
	printint ( q ) ;
	printchar ( 41 ) ;
      } 
      if ( mem [q ].hh .v.LH == p ) 
      {
	printnl ( 317 ) ;
	printint ( q ) ;
	printchar ( 41 ) ;
      } 
    } 
  while ( q++ < for_end ) ;} 
  {register integer for_end; q = 1 ;for_end = 50984L ; if ( q <= for_end) do 
    {
      if ( eqtb [q ].hh .v.RH == p ) 
      {
	printnl ( 563 ) ;
	printint ( q ) ;
	printchar ( 41 ) ;
      } 
    } 
  while ( q++ < for_end ) ;} 
  if ( saveptr > 0 ) 
  {register integer for_end; q = 0 ;for_end = saveptr - 1 ; if ( q <= 
  for_end) do 
    {
      if ( savestack [q ].hh .v.RH == p ) 
      {
	printnl ( 635 ) ;
	printint ( q ) ;
	printchar ( 41 ) ;
      } 
    } 
  while ( q++ < for_end ) ;} 
  {register integer for_end; q = 0 ;for_end = hyphsize ; if ( q <= for_end) 
  do 
    {
      if ( hyphlist [q ]== p ) 
      {
	printnl ( 1109 ) ;
	printint ( q ) ;
	printchar ( 41 ) ;
      } 
    } 
  while ( q++ < for_end ) ;} 
} 
#endif /* TEXMF_DEBUG */
void 
zpdferror ( strnumber t , strnumber p ) 
{
  pdferror_regmem 
  normalizeselector () ;
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 1720 ) ;
  } 
  if ( t != 0 ) 
  {
    print ( 287 ) ;
    print ( t ) ;
    print ( 41 ) ;
  } 
  print ( 657 ) ;
  print ( p ) ;
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
integer 
getmicrointerval ( void ) 
{
  register integer Result; getmicrointerval_regmem 
  integer s, m  ;
  secondsandmicros ( s , m ) ;
  if ( ( s - epochseconds ) > 32767 ) 
  Result = 2147483647L ;
  else if ( ( microseconds > m ) ) 
  Result = ( ( s - 1 - epochseconds ) * 65536L ) + ( ( ( m + 1000000L - 
  microseconds ) / ((double) 100 ) ) * 65536L ) / ((double) 10000 ) ;
  else Result = ( ( s - epochseconds ) * 65536L ) + ( ( ( m - microseconds ) 
  / ((double) 100 ) ) * 65536L ) / ((double) 10000 ) ;
  return Result ;
} 
strnumber 
ztokenstostring ( halfword p ) 
{
  register strnumber Result; tokenstostring_regmem 
  if ( selector == 21 ) 
  pdferror ( 1721 , 1722 ) ;
  oldsetting = selector ;
  selector = 21 ;
  showtokenlist ( mem [p ].hh .v.RH , -1073741823L , poolsize - poolptr ) ;
  selector = oldsetting ;
  lasttokensstring = makestring () ;
  Result = lasttokensstring ;
  return Result ;
} 
void 
zflushstr ( strnumber s ) 
{
  flushstr_regmem 
  if ( ( s == strptr - 1 ) ) 
  {
    decr ( strptr ) ;
    poolptr = strstart [strptr ];
  } 
} 
void 
zprintfontnameandsize ( internalfontnumber f ) 
{
  printfontnameandsize_regmem 
  print ( fontname [f ]) ;
  if ( fontsize [f ]!= fontdsize [f ]) 
  {
    print ( 64 ) ;
    printscaled ( fontsize [f ]) ;
    print ( 425 ) ;
  } 
} 
void 
zprintfontdirandenc ( internalfontnumber f ) 
{
  printfontdirandenc_regmem 
  if ( fontdir [f ]== 3 ) 
  print ( 613 ) ;
  else if ( fontdir [f ]== 4 ) 
  print ( 614 ) ;
  if ( fontenc [f ]== 2 ) 
  print ( 615 ) ;
  else if ( fontenc [f ]== 1 ) 
  print ( 616 ) ;
  else if ( fontenc [f ]== 128 ) 
  print ( 617 ) ;
  else if ( fontenc [f ]== 129 ) 
  print ( 618 ) ;
  else if ( fontenc [f ]== 130 ) 
  print ( 619 ) ;
  else if ( fontenc [f ]== 131 ) 
  print ( 620 ) ;
  else if ( fontenc [f ]== 132 ) 
  print ( 621 ) ;
  else if ( fontenc [f ]== 144 ) 
  print ( 622 ) ;
  else if ( fontenc [f ]== 145 ) 
  print ( 623 ) ;
  else if ( fontenc [f ]== 146 ) 
  print ( 624 ) ;
  else if ( fontenc [f ]== 160 ) 
  print ( 625 ) ;
} 
void 
zshortdisplay ( integer p ) 
{
  shortdisplay_regmem 
  integer n  ;
  while ( p > memmin ) {
      
    if ( ( p >= himemmin ) ) 
    {
      if ( p <= memend ) 
      {
	if ( mem [p ].hh.b0 != fontinshortdisplay ) 
	{
	  if ( ( mem [p ].hh.b0 > fontmax ) ) 
	  printchar ( 42 ) ;
	  else {
	      
	    printesc ( hash [40923L + mem [p ].hh.b0 ].v.RH ) ;
	    if ( eqtb [114422L ].cint > 0 ) 
	    {
	      print ( 287 ) ;
	      printfontnameandsize ( mem [p ].hh.b0 ) ;
	      if ( eqtb [114422L ].cint > 1 ) 
	      {
		printfontdirandenc ( mem [p ].hh.b0 ) ;
	      } 
	      print ( 41 ) ;
	    } 
	  } 
	  printchar ( 32 ) ;
	  fontinshortdisplay = mem [p ].hh.b0 ;
	} 
	if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	{
	  p = mem [p ].hh .v.RH ;
	  printkanji ( mem [p ].hh .v.LH ) ;
	} 
	else if ( checkecharrange ( mem [p ].hh.b1 ) == 1 ) 
	printkanji ( mem [p ].hh.b1 ) ;
	else print ( mem [p ].hh.b1 ) ;
      } 
    } 
    else switch ( mem [p ].hh.b0 ) 
    {case 0 : 
    case 1 : 
    case 2 : 
    case 4 : 
    case 10 : 
    case 6 : 
    case 7 : 
    case 15 : 
      print ( 318 ) ;
      break ;
    case 3 : 
      printchar ( 124 ) ;
      break ;
    case 12 : 
      if ( mem [p + 1 ].hh .v.LH != membot ) 
      printchar ( 32 ) ;
      break ;
    case 11 : 
      if ( mem [p ].hh.b1 >= 4 ) 
      print ( 318 ) ;
      else printchar ( 36 ) ;
      break ;
    case 8 : 
      shortdisplay ( mem [p + 1 ].hh .v.RH ) ;
      break ;
    case 9 : 
      {
	shortdisplay ( mem [p + 1 ].hh .v.LH ) ;
	shortdisplay ( mem [p + 1 ].hh .v.RH ) ;
	n = mem [p ].hh.b1 ;
	while ( n > 0 ) {
	    
	  if ( mem [p ].hh .v.RH != -1073741823L ) 
	  p = mem [p ].hh .v.RH ;
	  decr ( n ) ;
	} 
      } 
      break ;
      default: 
      ;
      break ;
    } 
    p = mem [p ].hh .v.RH ;
  } 
} 
void 
zprintfontandchar ( integer p ) 
{
  printfontandchar_regmem 
  if ( p > memend ) 
  printesc ( 319 ) ;
  else {
      
    if ( ( mem [p ].hh.b0 > fontmax ) ) 
    printchar ( 42 ) ;
    else {
	
      printesc ( hash [40923L + mem [p ].hh.b0 ].v.RH ) ;
      if ( eqtb [114422L ].cint > 0 ) 
      {
	print ( 287 ) ;
	printfontnameandsize ( mem [p ].hh.b0 ) ;
	if ( eqtb [114422L ].cint > 1 ) 
	{
	  printfontdirandenc ( mem [p ].hh.b0 ) ;
	} 
	print ( 41 ) ;
      } 
    } 
    printchar ( 32 ) ;
    if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
    {
      p = mem [p ].hh .v.RH ;
      printkanji ( mem [p ].hh .v.LH ) ;
    } 
    else if ( checkecharrange ( mem [p ].hh.b1 ) == 1 ) 
    printkanji ( mem [p ].hh.b1 ) ;
    else print ( mem [p ].hh.b1 ) ;
  } 
} 
void 
zprintmark ( integer p ) 
{
  printmark_regmem 
  printchar ( 123 ) ;
  if ( ( p < himemmin ) || ( p > memend ) ) 
  printesc ( 319 ) ;
  else showtokenlist ( mem [p ].hh .v.RH , -1073741823L , maxprintline - 10 
  ) ;
  printchar ( 125 ) ;
} 
void 
zprintruledimen ( scaled d ) 
{
  printruledimen_regmem 
  if ( ( d == -1073741824L ) ) 
  printchar ( 42 ) ;
  else printscaled ( d ) ;
} 
void 
zprintglue ( scaled d , integer order , strnumber s ) 
{
  printglue_regmem 
  printscaled ( d ) ;
  if ( ( order < 0 ) || ( order > 4 ) ) 
  print ( 320 ) ;
  else if ( order > 0 ) 
  {
    print ( 321 ) ;
    while ( order > 1 ) {
	
      printchar ( 108 ) ;
      decr ( order ) ;
    } 
  } 
  else if ( s != 0 ) 
  print ( s ) ;
} 
void 
zprintspec ( integer p , strnumber s ) 
{
  printspec_regmem 
  if ( ( p < memmin ) || ( p >= lomemmax ) ) 
  printchar ( 42 ) ;
  else {
      
    printscaled ( mem [p + 1 ].cint ) ;
    if ( s != 0 ) 
    print ( s ) ;
    if ( mem [p + 2 ].cint != 0 ) 
    {
      print ( 322 ) ;
      printglue ( mem [p + 2 ].cint , mem [p ].hh.b0 , s ) ;
    } 
    if ( mem [p + 3 ].cint != 0 ) 
    {
      print ( 323 ) ;
      printglue ( mem [p + 3 ].cint , mem [p ].hh.b1 , s ) ;
    } 
  } 
} 
void 
zprintfamandchar ( halfword p , integer t ) 
{
  printfamandchar_regmem 
  KANJIcode cx  ;
  printesc ( 507 ) ;
  printint ( mem [p ].hh.b0 ) ;
  printchar ( 32 ) ;
  if ( t == 1 ) 
  print ( mem [p ].hh.b1 ) ;
  else {
      
    cx = mem [p + 3 ].hh .v.LH ;
    printkanji ( cx ) ;
  } 
} 
void 
zprintdelimiter ( halfword p ) 
{
  printdelimiter_regmem 
  integer a  ;
  a = mem [p ].qqqq .b0 * 256 + mem [p ].qqqq .b1 ;
  a = a * 4096 + mem [p ].qqqq .b2 * 256 + mem [p ].qqqq .b3 ;
  if ( a < 0 ) 
  printint ( a ) ;
  else printhex ( a ) ;
} 
void 
zprintsubsidiarydata ( halfword p , ASCIIcode c ) 
{
  printsubsidiarydata_regmem 
  if ( ( poolptr - strstart [strptr ]) >= depththreshold ) 
  {
    if ( mem [p ].hh .v.RH != 0 ) 
    print ( 324 ) ;
  } 
  else {
      
    {
      strpool [poolptr ]= c ;
      incr ( poolptr ) ;
    } 
    tempptr = p ;
    switch ( mem [p ].hh .v.RH ) 
    {case 1 : 
    case 6 : 
      {
	println () ;
	printcurrentstring () ;
	printfamandchar ( p , mem [p ].hh .v.RH ) ;
      } 
      break ;
    case 2 : 
    case 3 : 
      showinfo () ;
      break ;
    case 4 : 
      if ( mem [p ].hh .v.LH == -1073741823L ) 
      {
	println () ;
	printcurrentstring () ;
	print ( 1027 ) ;
      } 
      else showinfo () ;
      break ;
      default: 
      ;
      break ;
    } 
    decr ( poolptr ) ;
  } 
} 
void 
zprintstyle ( integer c ) 
{
  printstyle_regmem 
  switch ( c / 2 ) 
  {case 0 : 
    printesc ( 1028 ) ;
    break ;
  case 1 : 
    printesc ( 1029 ) ;
    break ;
  case 2 : 
    printesc ( 1030 ) ;
    break ;
  case 3 : 
    printesc ( 1031 ) ;
    break ;
    default: 
    print ( 1032 ) ;
    break ;
  } 
} 
void 
zprintskipparam ( integer n ) 
{
  printskipparam_regmem 
  switch ( n ) 
  {case 0 : 
    printesc ( 401 ) ;
    break ;
  case 1 : 
    printesc ( 402 ) ;
    break ;
  case 2 : 
    printesc ( 403 ) ;
    break ;
  case 3 : 
    printesc ( 404 ) ;
    break ;
  case 4 : 
    printesc ( 405 ) ;
    break ;
  case 5 : 
    printesc ( 406 ) ;
    break ;
  case 6 : 
    printesc ( 407 ) ;
    break ;
  case 7 : 
    printesc ( 408 ) ;
    break ;
  case 8 : 
    printesc ( 409 ) ;
    break ;
  case 9 : 
    printesc ( 410 ) ;
    break ;
  case 10 : 
    printesc ( 411 ) ;
    break ;
  case 11 : 
    printesc ( 412 ) ;
    break ;
  case 12 : 
    printesc ( 413 ) ;
    break ;
  case 13 : 
    printesc ( 414 ) ;
    break ;
  case 14 : 
    printesc ( 415 ) ;
    break ;
  case 17 : 
    printesc ( 416 ) ;
    break ;
  case 18 : 
    printesc ( 417 ) ;
    break ;
  case 19 : 
    printesc ( 418 ) ;
    break ;
  case 15 : 
    printesc ( 419 ) ;
    break ;
  case 16 : 
    printesc ( 420 ) ;
    break ;
  case 20 : 
    print ( 421 ) ;
    break ;
    default: 
    print ( 422 ) ;
    break ;
  } 
} 
void 
zshownodelist ( integer p ) 
{
  /* 10 */ shownodelist_regmem 
  integer n  ;
  real g  ;
  if ( ( poolptr - strstart [strptr ]) > depththreshold ) 
  {
    if ( p > -1073741823L ) 
    print ( 324 ) ;
    return ;
  } 
  n = 0 ;
  while ( p > memmin ) {
      
    println () ;
    printcurrentstring () ;
    if ( p > memend ) 
    {
      print ( 325 ) ;
      return ;
    } 
    incr ( n ) ;
    if ( n > breadthmax ) 
    {
      print ( 326 ) ;
      return ;
    } 
    if ( ( p >= himemmin ) ) 
    {
      printfontandchar ( p ) ;
      if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
      p = mem [p ].hh .v.RH ;
    } 
    else switch ( mem [p ].hh.b0 ) 
    {case 0 : 
    case 1 : 
    case 2 : 
    case 15 : 
      {
	switch ( mem [p ].hh.b0 ) 
	{case 0 : 
	  printesc ( 104 ) ;
	  break ;
	case 1 : 
	  printesc ( 118 ) ;
	  break ;
	case 2 : 
	  printesc ( 329 ) ;
	  break ;
	  default: 
	  printesc ( 330 ) ;
	  break ;
	} 
	print ( 331 ) ;
	printscaled ( mem [p + 3 ].cint ) ;
	printchar ( 43 ) ;
	printscaled ( mem [p + 2 ].cint ) ;
	print ( 332 ) ;
	printscaled ( mem [p + 1 ].cint ) ;
	if ( mem [p ].hh.b0 == 15 ) 
	{
	  if ( mem [p ].hh.b1 != 0 ) 
	  {
	    print ( 287 ) ;
	    printint ( mem [p ].hh.b1 + 1 ) ;
	    print ( 334 ) ;
	  } 
	  if ( mem [p + 6 ].cint != 0 ) 
	  {
	    print ( 335 ) ;
	    printglue ( mem [p + 6 ].cint , mem [p + 5 ].hh.b1 , 0 ) ;
	  } 
	  if ( mem [p + 4 ].cint != 0 ) 
	  {
	    print ( 336 ) ;
	    printglue ( mem [p + 4 ].cint , mem [p + 5 ].hh.b0 , 0 ) ;
	  } 
	} 
	else {
	    
	  g = mem [p + 6 ].gr ;
	  if ( ( g != 0.0 ) && ( mem [p + 5 ].hh.b0 != 0 ) ) 
	  {
	    print ( 337 ) ;
	    if ( mem [p + 5 ].hh.b0 == 2 ) 
	    print ( 338 ) ;
	    if ( fabs ( g ) > 20000.0 ) 
	    {
	      if ( g > 0.0 ) 
	      printchar ( 62 ) ;
	      else print ( 339 ) ;
	      printglue ( 20000 * 65536L , mem [p + 5 ].hh.b1 , 0 ) ;
	    } 
	    else printglue ( round ( 65536L * g ) , mem [p + 5 ].hh.b1 , 0 ) 
	    ;
	  } 
	  if ( mem [p + 4 ].cint != 0 ) 
	  {
	    print ( 333 ) ;
	    printscaled ( mem [p + 4 ].cint ) ;
	  } 
	  if ( ( eTeXmode == 1 ) ) {
	      
	    if ( ( mem [p ].hh.b0 == 0 ) && ( ( ( mem [p ].hh.b1 ) / 16 ) 
	    == 2 ) ) 
	    print ( 1607 ) ;
	  } 
	  if ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) != 0 ) 
	  {
	    printdirectionalt ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) ) ;
	  } 
	} 
	{
	  {
	    strpool [poolptr ]= 46 ;
	    incr ( poolptr ) ;
	  } 
	  shownodelist ( mem [p + 5 ].hh .v.RH ) ;
	  decr ( poolptr ) ;
	} 
      } 
      break ;
    case 3 : 
      {
	printesc ( 340 ) ;
	printruledimen ( mem [p + 3 ].cint ) ;
	printchar ( 43 ) ;
	printruledimen ( mem [p + 2 ].cint ) ;
	print ( 332 ) ;
	printruledimen ( mem [p + 1 ].cint ) ;
      } 
      break ;
    case 4 : 
      {
	printesc ( 341 ) ;
	printint ( mem [p ].hh.b1 ) ;
	printdir ( abs ( ( mem [p + 5 ].hh.b1 - 5 ) ) ) ;
	print ( 342 ) ;
	printscaled ( mem [p + 3 ].cint ) ;
	print ( 343 ) ;
	printspec ( mem [p + 4 ].hh .v.RH , 0 ) ;
	printchar ( 44 ) ;
	printscaled ( mem [p + 2 ].cint ) ;
	print ( 344 ) ;
	printint ( mem [p + 1 ].cint ) ;
	{
	  {
	    strpool [poolptr ]= 46 ;
	    incr ( poolptr ) ;
	  } 
	  shownodelist ( mem [p + 4 ].hh .v.LH ) ;
	  decr ( poolptr ) ;
	} 
      } 
      break ;
    case 10 : 
      switch ( mem [p ].hh.b1 ) 
      {case 0 : 
	{
	  printwritewhatsit ( 1502 , p ) ;
	  printchar ( 61 ) ;
	  printfilename ( mem [p + 1 ].hh .v.RH , mem [p + 2 ].hh .v.LH , 
	  mem [p + 2 ].hh .v.RH ) ;
	} 
	break ;
      case 1 : 
	{
	  printwritewhatsit ( 684 , p ) ;
	  printmark ( mem [p + 1 ].hh .v.RH ) ;
	} 
	break ;
      case 2 : 
	printwritewhatsit ( 1503 , p ) ;
	break ;
      case 3 : 
	{
	  printesc ( 1504 ) ;
	  printmark ( mem [p + 1 ].hh .v.RH ) ;
	} 
	break ;
      case 4 : 
	{
	  printesc ( 1504 ) ;
	  print ( 1513 ) ;
	  printmark ( mem [p + 1 ].hh .v.RH ) ;
	} 
	break ;
      case 5 : 
	{
	  printesc ( 1506 ) ;
	  printint ( mem [p + 1 ].hh .v.RH ) ;
	  print ( 1514 ) ;
	  printint ( mem [p + 1 ].hh.b0 ) ;
	  printchar ( 44 ) ;
	  printint ( mem [p + 1 ].hh.b1 ) ;
	  printchar ( 41 ) ;
	} 
	break ;
      case 8 : 
	printesc ( 1508 ) ;
	break ;
      case 9 : 
	printesc ( 1509 ) ;
	break ;
      case 10 : 
	printesc ( 1510 ) ;
	break ;
	default: 
	print ( 1515 ) ;
	break ;
      } 
      break ;
    case 5 : 
      {
	printesc ( 327 ) ;
	printscaled ( mem [p + 1 ].cint ) ;
      } 
      break ;
    case 12 : 
      if ( mem [p ].hh.b1 >= 100 ) 
      {
	printesc ( 349 ) ;
	if ( mem [p ].hh.b1 == 101 ) 
	printchar ( 99 ) ;
	else if ( mem [p ].hh.b1 == 102 ) 
	printchar ( 120 ) ;
	print ( 350 ) ;
	printspec ( mem [p + 1 ].hh .v.LH , 0 ) ;
	{
	  {
	    strpool [poolptr ]= 46 ;
	    incr ( poolptr ) ;
	  } 
	  shownodelist ( mem [p + 1 ].hh .v.RH ) ;
	  decr ( poolptr ) ;
	} 
      } 
      else {
	  
	printesc ( 345 ) ;
	if ( mem [p ].hh.b1 != 0 ) 
	{
	  printchar ( 40 ) ;
	  if ( mem [p ].hh.b1 < 98 ) 
	  printskipparam ( mem [p ].hh.b1 - 1 ) ;
	  else if ( mem [p ].hh.b1 == 98 ) 
	  printesc ( 346 ) ;
	  else printesc ( 347 ) ;
	  printchar ( 41 ) ;
	} 
	if ( mem [p ].hh.b1 != 98 ) 
	{
	  printchar ( 32 ) ;
	  if ( mem [p ].hh.b1 < 98 ) 
	  printspec ( mem [p + 1 ].hh .v.LH , 0 ) ;
	  else printspec ( mem [p + 1 ].hh .v.LH , 348 ) ;
	} 
      } 
      break ;
    case 13 : 
      if ( mem [p ].hh.b1 != 99 ) 
      {
	printesc ( 351 ) ;
	if ( mem [p ].hh.b1 != 0 ) 
	printchar ( 32 ) ;
	printscaled ( mem [p + 1 ].cint ) ;
	if ( mem [p ].hh.b1 == 2 ) 
	print ( 352 ) ;
      } 
      else {
	  
	printesc ( 353 ) ;
	printscaled ( mem [p + 1 ].cint ) ;
	print ( 348 ) ;
      } 
      break ;
    case 11 : 
      if ( mem [p ].hh.b1 > 1 ) 
      {
	if ( odd ( mem [p ].hh.b1 ) ) 
	printesc ( 354 ) ;
	else printesc ( 355 ) ;
	if ( mem [p ].hh.b1 > 8 ) 
	printchar ( 82 ) ;
	else if ( mem [p ].hh.b1 > 4 ) 
	printchar ( 76 ) ;
	else printchar ( 77 ) ;
      } 
      else {
	  
	printesc ( 356 ) ;
	if ( mem [p ].hh.b1 == 0 ) 
	print ( 357 ) ;
	else print ( 358 ) ;
	if ( mem [p + 1 ].cint != 0 ) 
	{
	  print ( 359 ) ;
	  printscaled ( mem [p + 1 ].cint ) ;
	} 
      } 
      break ;
    case 8 : 
      {
	printfontandchar ( p + 1 ) ;
	print ( 360 ) ;
	if ( mem [p ].hh.b1 > 1 ) 
	printchar ( 124 ) ;
	fontinshortdisplay = mem [p + 1 ].hh.b0 ;
	shortdisplay ( mem [p + 1 ].hh .v.RH ) ;
	if ( odd ( mem [p ].hh.b1 ) ) 
	printchar ( 124 ) ;
	printchar ( 41 ) ;
      } 
      break ;
    case 14 : 
      {
	printesc ( 361 ) ;
	printint ( mem [p + 1 ].cint ) ;
	if ( mem [p ].hh.b1 == 1 ) 
	print ( 362 ) ;
	else if ( mem [p ].hh.b1 == 2 ) 
	print ( 363 ) ;
      } 
      break ;
    case 9 : 
      {
	printesc ( 364 ) ;
	if ( mem [p ].hh.b1 > 0 ) 
	{
	  print ( 365 ) ;
	  printint ( mem [p ].hh.b1 ) ;
	} 
	{
	  {
	    strpool [poolptr ]= 46 ;
	    incr ( poolptr ) ;
	  } 
	  shownodelist ( mem [p + 1 ].hh .v.LH ) ;
	  decr ( poolptr ) ;
	} 
	{
	  strpool [poolptr ]= 124 ;
	  incr ( poolptr ) ;
	} 
	shownodelist ( mem [p + 1 ].hh .v.RH ) ;
	decr ( poolptr ) ;
      } 
      break ;
    case 6 : 
      {
	printesc ( 366 ) ;
	if ( mem [p + 1 ].hh .v.LH != 0 ) 
	{
	  printchar ( 115 ) ;
	  printint ( mem [p + 1 ].hh .v.LH ) ;
	} 
	printmark ( mem [p + 1 ].hh .v.RH ) ;
      } 
      break ;
    case 7 : 
      {
	printesc ( 367 ) ;
	if ( mem [p ].hh.b1 != 0 ) 
	print ( 368 ) ;
	{
	  {
	    strpool [poolptr ]= 46 ;
	    incr ( poolptr ) ;
	  } 
	  shownodelist ( mem [p + 1 ].cint ) ;
	  decr ( poolptr ) ;
	} 
      } 
      break ;
    case 16 : 
      printstyle ( mem [p ].hh.b1 ) ;
      break ;
    case 17 : 
      {
	printesc ( 595 ) ;
	{
	  strpool [poolptr ]= 68 ;
	  incr ( poolptr ) ;
	} 
	shownodelist ( mem [p + 1 ].hh .v.LH ) ;
	decr ( poolptr ) ;
	{
	  strpool [poolptr ]= 84 ;
	  incr ( poolptr ) ;
	} 
	shownodelist ( mem [p + 1 ].hh .v.RH ) ;
	decr ( poolptr ) ;
	{
	  strpool [poolptr ]= 83 ;
	  incr ( poolptr ) ;
	} 
	shownodelist ( mem [p + 2 ].hh .v.LH ) ;
	decr ( poolptr ) ;
	{
	  strpool [poolptr ]= 115 ;
	  incr ( poolptr ) ;
	} 
	shownodelist ( mem [p + 2 ].hh .v.RH ) ;
	decr ( poolptr ) ;
      } 
      break ;
    case 18 : 
    case 19 : 
    case 20 : 
    case 21 : 
    case 22 : 
    case 23 : 
    case 24 : 
    case 25 : 
    case 26 : 
    case 29 : 
    case 28 : 
    case 31 : 
    case 30 : 
    case 32 : 
    case 33 : 
      {
	switch ( mem [p ].hh.b0 ) 
	{case 18 : 
	  printesc ( 1033 ) ;
	  break ;
	case 19 : 
	  printesc ( 1034 ) ;
	  break ;
	case 20 : 
	  printesc ( 1035 ) ;
	  break ;
	case 21 : 
	  printesc ( 1036 ) ;
	  break ;
	case 22 : 
	  printesc ( 1037 ) ;
	  break ;
	case 23 : 
	  printesc ( 1038 ) ;
	  break ;
	case 24 : 
	  printesc ( 1039 ) ;
	  break ;
	case 25 : 
	  printesc ( 1040 ) ;
	  break ;
	case 29 : 
	  printesc ( 1041 ) ;
	  break ;
	case 28 : 
	  printesc ( 1042 ) ;
	  break ;
	case 31 : 
	  printesc ( 611 ) ;
	  break ;
	case 26 : 
	  {
	    printesc ( 604 ) ;
	    printdelimiter ( p + 5 ) ;
	  } 
	  break ;
	case 30 : 
	  {
	    printesc ( 572 ) ;
	    printfamandchar ( p + 5 , 1 ) ;
	  } 
	  break ;
	case 32 : 
	  {
	    printesc ( 1043 ) ;
	    printdelimiter ( p + 1 ) ;
	  } 
	  break ;
	case 33 : 
	  {
	    if ( mem [p ].hh.b1 == 0 ) 
	    printesc ( 1044 ) ;
	    else printesc ( 1045 ) ;
	    printdelimiter ( p + 1 ) ;
	  } 
	  break ;
	} 
	if ( mem [p ].hh.b0 < 32 ) 
	{
	  if ( mem [p ].hh.b1 != 0 ) {
	      
	    if ( mem [p ].hh.b1 == 1 ) 
	    printesc ( 1046 ) ;
	    else printesc ( 1047 ) ;
	  } 
	  printsubsidiarydata ( p + 1 , 46 ) ;
	} 
	printsubsidiarydata ( p + 2 , 94 ) ;
	printsubsidiarydata ( p + 3 , 95 ) ;
      } 
      break ;
    case 27 : 
      {
	printesc ( 1048 ) ;
	if ( mem [p + 1 ].cint == 1073741824L ) 
	print ( 1049 ) ;
	else printscaled ( mem [p + 1 ].cint ) ;
	if ( ( mem [p + 5 ].qqqq .b0 != 0 ) || ( mem [p + 5 ].qqqq .b1 != 
	0 ) || ( mem [p + 5 ].qqqq .b2 != 0 ) || ( mem [p + 5 ].qqqq .b3 
	!= 0 ) ) 
	{
	  print ( 1050 ) ;
	  printdelimiter ( p + 5 ) ;
	} 
	if ( ( mem [p + 4 ].qqqq .b0 != 0 ) || ( mem [p + 4 ].qqqq .b1 != 
	0 ) || ( mem [p + 4 ].qqqq .b2 != 0 ) || ( mem [p + 4 ].qqqq .b3 
	!= 0 ) ) 
	{
	  print ( 1051 ) ;
	  printdelimiter ( p + 4 ) ;
	} 
	printsubsidiarydata ( p + 2 , 92 ) ;
	printsubsidiarydata ( p + 3 , 47 ) ;
      } 
      break ;
      default: 
      print ( 328 ) ;
      break ;
    } 
    p = mem [p ].hh .v.RH ;
  } 
} 
void 
zshowbox ( halfword p ) 
{
  showbox_regmem 
  depththreshold = eqtb [114386L ].cint ;
  breadthmax = eqtb [114385L ].cint ;
  if ( breadthmax <= 0 ) 
  breadthmax = 5 ;
  if ( poolptr + depththreshold >= poolsize ) 
  depththreshold = poolsize - poolptr - 1 ;
  shownodelist ( p ) ;
  println () ;
} 
void 
zdeletetokenref ( halfword p ) 
{
  deletetokenref_regmem 
  if ( mem [p ].hh .v.LH == -1073741823L ) 
  flushlist ( p ) ;
  else decr ( mem [p ].hh .v.LH ) ;
} 
void 
zdeleteglueref ( halfword p ) 
{
  deleteglueref_regmem 
  if ( mem [p ].hh .v.RH == -1073741823L ) 
  freenode ( p , 4 ) ;
  else decr ( mem [p ].hh .v.RH ) ;
} 
void 
zflushnodelist ( halfword p ) 
{
  /* 30 */ flushnodelist_regmem 
  halfword q  ;
  while ( p != -1073741823L ) {
      
    q = mem [p ].hh .v.RH ;
    if ( ( p >= himemmin ) ) 
    {
      mem [p ].hh .v.RH = avail ;
      avail = p ;
	;
#ifdef STAT
      decr ( dynused ) ;
#endif /* STAT */
    } 
    else {
	
      switch ( mem [p ].hh.b0 ) 
      {case 0 : 
      case 1 : 
      case 2 : 
      case 15 : 
	{
	  flushnodelist ( mem [p + 5 ].hh .v.RH ) ;
	  {
	    if ( mem [mem [p + 7 ].hh .v.RH ].hh .v.RH == -1073741823L ) 
	    freenode ( mem [p + 7 ].hh .v.RH , 4 ) ;
	    else decr ( mem [mem [p + 7 ].hh .v.RH ].hh .v.RH ) ;
	  } 
	  {
	    if ( mem [mem [p + 7 ].hh .v.LH ].hh .v.RH == -1073741823L ) 
	    freenode ( mem [p + 7 ].hh .v.LH , 4 ) ;
	    else decr ( mem [mem [p + 7 ].hh .v.LH ].hh .v.RH ) ;
	  } 
	  freenode ( p , 10 ) ;
	  goto lab30 ;
	} 
	break ;
      case 3 : 
	{
	  freenode ( p , 6 ) ;
	  goto lab30 ;
	} 
	break ;
      case 4 : 
	{
	  flushnodelist ( mem [p + 4 ].hh .v.LH ) ;
	  deleteglueref ( mem [p + 4 ].hh .v.RH ) ;
	  freenode ( p , 6 ) ;
	  goto lab30 ;
	} 
	break ;
      case 10 : 
	{
	  switch ( mem [p ].hh.b1 ) 
	  {case 0 : 
	    freenode ( p , 3 ) ;
	    break ;
	  case 1 : 
	  case 3 : 
	  case 4 : 
	    {
	      deletetokenref ( mem [p + 1 ].hh .v.RH ) ;
	      freenode ( p , 2 ) ;
	      goto lab30 ;
	    } 
	    break ;
	  case 2 : 
	  case 5 : 
	    freenode ( p , 2 ) ;
	    break ;
	  case 8 : 
	    freenode ( p , 2 ) ;
	    break ;
	    default: 
	    confusion ( 1517 ) ;
	    break ;
	  } 
	  goto lab30 ;
	} 
	break ;
      case 12 : 
	{
	  {
	    if ( mem [mem [p + 1 ].hh .v.LH ].hh .v.RH == -1073741823L ) 
	    freenode ( mem [p + 1 ].hh .v.LH , 4 ) ;
	    else decr ( mem [mem [p + 1 ].hh .v.LH ].hh .v.RH ) ;
	  } 
	  if ( mem [p + 1 ].hh .v.RH != -1073741823L ) 
	  flushnodelist ( mem [p + 1 ].hh .v.RH ) ;
	  freenode ( p , 4 ) ;
	  goto lab30 ;
	} 
	break ;
      case 5 : 
	;
	break ;
      case 13 : 
      case 11 : 
      case 14 : 
	{
	  freenode ( p , 4 ) ;
	  goto lab30 ;
	} 
	break ;
      case 8 : 
	flushnodelist ( mem [p + 1 ].hh .v.RH ) ;
	break ;
      case 6 : 
	deletetokenref ( mem [p + 1 ].hh .v.RH ) ;
	break ;
      case 9 : 
	{
	  flushnodelist ( mem [p + 1 ].hh .v.LH ) ;
	  flushnodelist ( mem [p + 1 ].hh .v.RH ) ;
	} 
	break ;
      case 7 : 
	flushnodelist ( mem [p + 1 ].cint ) ;
	break ;
      case 16 : 
	{
	  freenode ( p , 3 ) ;
	  goto lab30 ;
	} 
	break ;
      case 17 : 
	{
	  flushnodelist ( mem [p + 1 ].hh .v.LH ) ;
	  flushnodelist ( mem [p + 1 ].hh .v.RH ) ;
	  flushnodelist ( mem [p + 2 ].hh .v.LH ) ;
	  flushnodelist ( mem [p + 2 ].hh .v.RH ) ;
	  freenode ( p , 3 ) ;
	  goto lab30 ;
	} 
	break ;
      case 18 : 
      case 19 : 
      case 20 : 
      case 21 : 
      case 22 : 
      case 23 : 
      case 24 : 
      case 25 : 
      case 26 : 
      case 29 : 
      case 28 : 
      case 31 : 
      case 30 : 
	{
	  if ( ( mem [p + 1 ].hh .v.RH >= 2 ) && ( mem [p + 1 ].hh .v.RH 
	  != 6 ) && ( mem [p + 1 ].hh .v.RH != 7 ) ) 
	  flushnodelist ( mem [p + 1 ].hh .v.LH ) ;
	  if ( mem [p + 2 ].hh .v.RH >= 2 && ( mem [p + 2 ].hh .v.RH != 6 
	  ) && ( mem [p + 2 ].hh .v.RH != 7 ) ) 
	  flushnodelist ( mem [p + 2 ].hh .v.LH ) ;
	  if ( mem [p + 3 ].hh .v.RH >= 2 && ( mem [p + 3 ].hh .v.RH != 6 
	  ) && ( mem [p + 3 ].hh .v.RH != 7 ) ) 
	  flushnodelist ( mem [p + 3 ].hh .v.LH ) ;
	  if ( mem [p ].hh.b0 == 26 ) 
	  freenode ( p , 6 ) ;
	  else if ( mem [p ].hh.b0 == 30 ) 
	  freenode ( p , 6 ) ;
	  else freenode ( p , 5 ) ;
	  goto lab30 ;
	} 
	break ;
      case 32 : 
      case 33 : 
	{
	  freenode ( p , 5 ) ;
	  goto lab30 ;
	} 
	break ;
      case 27 : 
	{
	  flushnodelist ( mem [p + 2 ].hh .v.LH ) ;
	  flushnodelist ( mem [p + 3 ].hh .v.LH ) ;
	  freenode ( p , 6 ) ;
	  goto lab30 ;
	} 
	break ;
	default: 
	confusion ( 369 ) ;
	break ;
      } 
      freenode ( p , 2 ) ;
      lab30: ;
    } 
    p = q ;
  } 
} 
halfword 
zcopynodelist ( halfword p ) 
{
  register halfword Result; copynodelist_regmem 
  halfword h  ;
  halfword q  ;
  halfword r  ;
  unsigned char words  ;
  h = getavail () ;
  q = h ;
  while ( p != -1073741823L ) {
      
    words = 1 ;
    if ( ( p >= himemmin ) ) 
    r = getavail () ;
    else switch ( mem [p ].hh.b0 ) 
    {case 2 : 
    case 0 : 
    case 1 : 
    case 15 : 
      {
	r = getnode ( 10 ) ;
	mem [r + 8 ].cint = mem [p + 8 ].cint ;
	mem [r + 9 ].cint = mem [p + 9 ].cint ;
	mem [r + 7 ]= mem [p + 7 ];
	mem [r + 6 ]= mem [p + 6 ];
	mem [r + 5 ]= mem [p + 5 ];
	incr ( mem [mem [r + 7 ].hh .v.RH ].hh .v.RH ) ;
	incr ( mem [mem [r + 7 ].hh .v.LH ].hh .v.RH ) ;
	mem [r + 5 ].hh .v.RH = copynodelist ( mem [p + 5 ].hh .v.RH ) ;
	words = 5 ;
      } 
      break ;
    case 3 : 
      {
	r = getnode ( 6 ) ;
	words = 4 ;
      } 
      break ;
    case 4 : 
      {
	r = getnode ( 6 ) ;
	mem [r + 5 ]= mem [p + 5 ];
	mem [r + 4 ]= mem [p + 4 ];
	incr ( mem [mem [p + 4 ].hh .v.RH ].hh .v.RH ) ;
	mem [r + 4 ].hh .v.LH = copynodelist ( mem [p + 4 ].hh .v.LH ) ;
	words = 4 ;
      } 
      break ;
    case 10 : 
      switch ( mem [p ].hh.b1 ) 
      {case 0 : 
	{
	  r = getnode ( 3 ) ;
	  words = 3 ;
	} 
	break ;
      case 1 : 
      case 3 : 
      case 4 : 
	{
	  r = getnode ( 2 ) ;
	  incr ( mem [mem [p + 1 ].hh .v.RH ].hh .v.LH ) ;
	  words = 2 ;
	} 
	break ;
      case 2 : 
      case 5 : 
	{
	  r = getnode ( 2 ) ;
	  words = 2 ;
	} 
	break ;
      case 8 : 
	r = getnode ( 2 ) ;
	break ;
	default: 
	confusion ( 1516 ) ;
	break ;
      } 
      break ;
    case 12 : 
      {
	r = getnode ( 4 ) ;
	incr ( mem [mem [p + 1 ].hh .v.LH ].hh .v.RH ) ;
	mem [r + 2 ].cint = mem [p + 2 ].cint ;
	mem [r + 3 ].cint = mem [p + 3 ].cint ;
	mem [r + 1 ].hh .v.LH = mem [p + 1 ].hh .v.LH ;
	mem [r + 1 ].hh .v.RH = copynodelist ( mem [p + 1 ].hh .v.RH ) ;
      } 
      break ;
    case 5 : 
      {
	r = getnode ( 2 ) ;
	words = 2 ;
      } 
      break ;
    case 13 : 
    case 11 : 
    case 14 : 
      {
	r = getnode ( 4 ) ;
	words = 4 ;
      } 
      break ;
    case 8 : 
      {
	r = getnode ( 2 ) ;
	mem [r + 1 ]= mem [p + 1 ];
	mem [r + 1 ].hh .v.RH = copynodelist ( mem [p + 1 ].hh .v.RH ) ;
      } 
      break ;
    case 9 : 
      {
	r = getnode ( 2 ) ;
	mem [r + 1 ].hh .v.LH = copynodelist ( mem [p + 1 ].hh .v.LH ) ;
	mem [r + 1 ].hh .v.RH = copynodelist ( mem [p + 1 ].hh .v.RH ) ;
      } 
      break ;
    case 6 : 
      {
	r = getnode ( 2 ) ;
	incr ( mem [mem [p + 1 ].hh .v.RH ].hh .v.LH ) ;
	words = 2 ;
      } 
      break ;
    case 7 : 
      {
	r = getnode ( 2 ) ;
	mem [r + 1 ].cint = copynodelist ( mem [p + 1 ].cint ) ;
      } 
      break ;
      default: 
      confusion ( 370 ) ;
      break ;
    } 
    while ( words > 0 ) {
	
      decr ( words ) ;
      mem [r + words ]= mem [p + words ];
    } 
    mem [q ].hh .v.RH = r ;
    q = r ;
    p = mem [p ].hh .v.RH ;
  } 
  mem [q ].hh .v.RH = -1073741823L ;
  q = mem [h ].hh .v.RH ;
  {
    mem [h ].hh .v.RH = avail ;
    avail = h ;
	;
#ifdef STAT
    decr ( dynused ) ;
#endif /* STAT */
  } 
  Result = q ;
  return Result ;
} 
void 
zprintmode ( integer m ) 
{
  printmode_regmem 
  if ( m > 0 ) 
  switch ( m / ( 119 ) ) 
  {case 0 : 
    print ( 371 ) ;
    break ;
  case 1 : 
    print ( 372 ) ;
    break ;
  case 2 : 
    print ( 373 ) ;
    break ;
  } 
  else if ( m == 0 ) 
  print ( 374 ) ;
  else switch ( ( - (integer) m ) / ( 119 ) ) 
  {case 0 : 
    print ( 375 ) ;
    break ;
  case 1 : 
    print ( 376 ) ;
    break ;
  case 2 : 
    print ( 377 ) ;
    break ;
  } 
} 
void 
zprintinmode ( integer m ) 
{
  printinmode_regmem 
  if ( m > 0 ) 
  switch ( m / ( 119 ) ) 
  {case 0 : 
    print ( 378 ) ;
    break ;
  case 1 : 
    print ( 379 ) ;
    break ;
  case 2 : 
    print ( 380 ) ;
    break ;
  } 
  else if ( m == 0 ) 
  print ( 381 ) ;
  else switch ( ( - (integer) m ) / ( 119 ) ) 
  {case 0 : 
    print ( 382 ) ;
    break ;
  case 1 : 
    print ( 383 ) ;
    break ;
  case 2 : 
    print ( 384 ) ;
    break ;
  } 
} 
void 
pushnest ( void ) 
{
  pushnest_regmem 
  if ( nestptr > maxneststack ) 
  {
    maxneststack = nestptr ;
    if ( nestptr == nestsize ) 
    overflow ( 385 , nestsize ) ;
  } 
  nest [nestptr ]= curlist ;
  incr ( nestptr ) ;
  curlist .headfield = newnullbox () ;
  curlist .tailfield = curlist .headfield ;
  curlist .pnodefield = curlist .tailfield ;
  curlist .pgfield = 0 ;
  curlist .pdispfield = 0 ;
  curlist .dispcalledfield = false ;
  curlist .lastjchrfield = -1073741823L ;
  curlist .mlfield = line ;
  curlist .eTeXauxfield = -1073741823L ;
} 
void 
popnest ( void ) 
{
  popnest_regmem 
  {
    if ( mem [mem [curlist .headfield + 7 ].hh .v.RH ].hh .v.RH == 
    -1073741823L ) 
    freenode ( mem [curlist .headfield + 7 ].hh .v.RH , 4 ) ;
    else decr ( mem [mem [curlist .headfield + 7 ].hh .v.RH ].hh .v.RH ) ;
  } 
  {
    if ( mem [mem [curlist .headfield + 7 ].hh .v.LH ].hh .v.RH == 
    -1073741823L ) 
    freenode ( mem [curlist .headfield + 7 ].hh .v.LH , 4 ) ;
    else decr ( mem [mem [curlist .headfield + 7 ].hh .v.LH ].hh .v.RH ) ;
  } 
  freenode ( curlist .headfield , 10 ) ;
  decr ( nestptr ) ;
  curlist = nest [nestptr ];
} 
void 
showactivities ( void ) 
{
  showactivities_regmem 
  integer p  ;
  short m  ;
  memoryword a  ;
  halfword q, r  ;
  integer t  ;
  nest [nestptr ]= curlist ;
  printnl ( 349 ) ;
  println () ;
  {register integer for_end; p = nestptr ;for_end = 0 ; if ( p >= for_end) 
  do 
    {
      m = nest [p ].modefield ;
      a = nest [p ].auxfield ;
      printnl ( 386 ) ;
      printdirection ( nest [p ].dirfield ) ;
      print ( 387 ) ;
      printmode ( m ) ;
      print ( 388 ) ;
      printint ( abs ( nest [p ].mlfield ) ) ;
      if ( m == 120 ) {
	  
	if ( nest [p ].pgfield != 8585216L ) 
	{
	  print ( 389 ) ;
	  printint ( nest [p ].pgfield % 65536L ) ;
	  print ( 390 ) ;
	  printint ( nest [p ].pgfield / 4194304L ) ;
	  printchar ( 44 ) ;
	  printint ( ( nest [p ].pgfield / 65536L ) % 64 ) ;
	  printchar ( 41 ) ;
	} 
      } 
      if ( nest [p ].mlfield < 0 ) 
      print ( 391 ) ;
      if ( p == 0 ) 
      {
	if ( memtop - 2 != pagetail ) 
	{
	  printnl ( 1151 ) ;
	  if ( outputactive ) 
	  print ( 1152 ) ;
	  showbox ( mem [memtop - 2 ].hh .v.RH ) ;
	  if ( pagecontents > 0 ) 
	  {
	    printnl ( 1153 ) ;
	    printtotals () ;
	    printnl ( 1154 ) ;
	    printscaled ( pagesofar [0 ]) ;
	    r = mem [memtop ].hh .v.RH ;
	    while ( r != memtop ) {
		
	      println () ;
	      printesc ( 341 ) ;
	      t = mem [r ].hh.b1 ;
	      printint ( t ) ;
	      print ( 1155 ) ;
	      if ( eqtb [114445L + t ].cint == 1000 ) 
	      t = mem [r + 3 ].cint ;
	      else t = xovern ( mem [r + 3 ].cint , 1000 ) * eqtb [114445L 
	      + t ].cint ;
	      printscaled ( t ) ;
	      if ( mem [r ].hh.b0 == 1 ) 
	      {
		q = memtop - 2 ;
		t = 0 ;
		do {
		    q = mem [q ].hh .v.RH ;
		  if ( ( mem [q ].hh.b0 == 4 ) && ( mem [q ].hh.b1 == mem 
		  [r ].hh.b1 ) ) 
		  incr ( t ) ;
		} while ( ! ( q == mem [r + 1 ].hh .v.LH ) ) ;
		print ( 1156 ) ;
		printint ( t ) ;
		print ( 1157 ) ;
	      } 
	      r = mem [r ].hh .v.RH ;
	    } 
	  } 
	} 
	if ( mem [memtop - 1 ].hh .v.RH != -1073741823L ) 
	printnl ( 392 ) ;
      } 
      showbox ( mem [nest [p ].headfield ].hh .v.RH ) ;
      switch ( abs ( m ) / ( 119 ) ) 
      {case 0 : 
	{
	  printnl ( 393 ) ;
	  if ( a .cint <= -65536000L ) 
	  print ( 394 ) ;
	  else printscaled ( a .cint ) ;
	  if ( nest [p ].pgfield != 0 ) 
	  {
	    print ( 395 ) ;
	    printint ( nest [p ].pgfield ) ;
	    if ( nest [p ].pgfield != 1 ) 
	    print ( 396 ) ;
	    else print ( 397 ) ;
	  } 
	} 
	break ;
      case 1 : 
	{
	  printnl ( 398 ) ;
	  printint ( a .hh .v.LH ) ;
	  if ( m > 0 ) {
	      
	    if ( a .hh .v.RH > 0 ) 
	    {
	      print ( 399 ) ;
	      printint ( a .hh .v.RH ) ;
	    } 
	  } 
	} 
	break ;
      case 2 : 
	if ( a .cint != -1073741823L ) 
	{
	  print ( 400 ) ;
	  showbox ( a .cint ) ;
	} 
	break ;
      } 
    } 
  while ( p-- > for_end ) ;} 
} 
void 
zprintparam ( integer n ) 
{
  printparam_regmem 
  switch ( n ) 
  {case 0 : 
    printesc ( 463 ) ;
    break ;
  case 1 : 
    printesc ( 464 ) ;
    break ;
  case 2 : 
    printesc ( 465 ) ;
    break ;
  case 3 : 
    printesc ( 466 ) ;
    break ;
  case 4 : 
    printesc ( 467 ) ;
    break ;
  case 5 : 
    printesc ( 468 ) ;
    break ;
  case 6 : 
    printesc ( 469 ) ;
    break ;
  case 7 : 
    printesc ( 470 ) ;
    break ;
  case 8 : 
    printesc ( 471 ) ;
    break ;
  case 9 : 
    printesc ( 472 ) ;
    break ;
  case 10 : 
    printesc ( 473 ) ;
    break ;
  case 11 : 
    printesc ( 474 ) ;
    break ;
  case 12 : 
    printesc ( 475 ) ;
    break ;
  case 13 : 
    printesc ( 476 ) ;
    break ;
  case 14 : 
    printesc ( 477 ) ;
    break ;
  case 15 : 
    printesc ( 478 ) ;
    break ;
  case 16 : 
    printesc ( 479 ) ;
    break ;
  case 17 : 
    printesc ( 480 ) ;
    break ;
  case 18 : 
    printesc ( 481 ) ;
    break ;
  case 19 : 
    printesc ( 482 ) ;
    break ;
  case 20 : 
    printesc ( 483 ) ;
    break ;
  case 21 : 
    printesc ( 484 ) ;
    break ;
  case 22 : 
    printesc ( 485 ) ;
    break ;
  case 23 : 
    printesc ( 486 ) ;
    break ;
  case 24 : 
    printesc ( 487 ) ;
    break ;
  case 25 : 
    printesc ( 488 ) ;
    break ;
  case 26 : 
    printesc ( 489 ) ;
    break ;
  case 27 : 
    printesc ( 490 ) ;
    break ;
  case 28 : 
    printesc ( 491 ) ;
    break ;
  case 29 : 
    printesc ( 492 ) ;
    break ;
  case 30 : 
    printesc ( 493 ) ;
    break ;
  case 31 : 
    printesc ( 494 ) ;
    break ;
  case 32 : 
    printesc ( 495 ) ;
    break ;
  case 33 : 
    printesc ( 496 ) ;
    break ;
  case 34 : 
    printesc ( 497 ) ;
    break ;
  case 35 : 
    printesc ( 498 ) ;
    break ;
  case 36 : 
    printesc ( 499 ) ;
    break ;
  case 37 : 
    printesc ( 500 ) ;
    break ;
  case 38 : 
    printesc ( 501 ) ;
    break ;
  case 39 : 
    printesc ( 502 ) ;
    break ;
  case 40 : 
    printesc ( 503 ) ;
    break ;
  case 41 : 
    printesc ( 504 ) ;
    break ;
  case 42 : 
    printesc ( 505 ) ;
    break ;
  case 43 : 
    printesc ( 506 ) ;
    break ;
  case 44 : 
    printesc ( 507 ) ;
    break ;
  case 46 : 
    printesc ( 508 ) ;
    break ;
  case 47 : 
    printesc ( 509 ) ;
    break ;
  case 48 : 
    printesc ( 510 ) ;
    break ;
  case 49 : 
    printesc ( 511 ) ;
    break ;
  case 50 : 
    printesc ( 512 ) ;
    break ;
  case 45 : 
    printesc ( 513 ) ;
    break ;
  case 56 : 
    printesc ( 514 ) ;
    break ;
  case 57 : 
    printesc ( 515 ) ;
    break ;
  case 58 : 
    printesc ( 516 ) ;
    break ;
  case 59 : 
    printesc ( 517 ) ;
    break ;
  case 60 : 
    printesc ( 518 ) ;
    break ;
  case 61 : 
    printesc ( 519 ) ;
    break ;
  case 51 : 
    printesc ( 520 ) ;
    break ;
  case 52 : 
    printesc ( 521 ) ;
    break ;
  case 53 : 
    printesc ( 522 ) ;
    break ;
  case 54 : 
    printesc ( 523 ) ;
    break ;
  case 55 : 
    printesc ( 524 ) ;
    break ;
  case 62 : 
    printesc ( 525 ) ;
    break ;
  case 63 : 
    printesc ( 526 ) ;
    break ;
  case 64 : 
    printesc ( 527 ) ;
    break ;
  case 65 : 
    printesc ( 528 ) ;
    break ;
  case 66 : 
    printesc ( 529 ) ;
    break ;
  case 67 : 
    printesc ( 530 ) ;
    break ;
  case 68 : 
    printesc ( 1719 ) ;
    break ;
  case 69 : 
    printesc ( 1549 ) ;
    break ;
  case 70 : 
    printesc ( 1550 ) ;
    break ;
  case 71 : 
    printesc ( 1551 ) ;
    break ;
  case 72 : 
    printesc ( 1552 ) ;
    break ;
  case 73 : 
    printesc ( 1553 ) ;
    break ;
  case 74 : 
    printesc ( 1554 ) ;
    break ;
  case 75 : 
    printesc ( 1555 ) ;
    break ;
  case 76 : 
    printesc ( 1556 ) ;
    break ;
  case 77 : 
    printesc ( 1557 ) ;
    break ;
  case 78 : 
    printesc ( 1558 ) ;
    break ;
  case 79 : 
    printesc ( 1559 ) ;
    break ;
  case 80 : 
    printesc ( 1560 ) ;
    break ;
  case 81 : 
    printesc ( 1561 ) ;
    break ;
  case 82 : 
    printesc ( 1562 ) ;
    break ;
  case 83 : 
    printesc ( 1602 ) ;
    break ;
    default: 
    print ( 531 ) ;
    break ;
  } 
} 
void 
fixdateandtime ( void ) 
{
  fixdateandtime_regmem 
  dateandtime ( systime , sysday , sysmonth , sysyear ) ;
  eqtb [114381L ].cint = systime ;
  eqtb [114382L ].cint = sysday ;
  eqtb [114383L ].cint = sysmonth ;
  eqtb [114384L ].cint = sysyear ;
} 
void 
begindiagnostic ( void ) 
{
  begindiagnostic_regmem 
  oldsetting = selector ;
  if ( ( eqtb [114390L ].cint <= 0 ) && ( selector == 19 ) ) 
  {
    decr ( selector ) ;
    if ( history == 0 ) 
    history = 1 ;
  } 
} 
void 
zenddiagnostic ( boolean blankline ) 
{
  enddiagnostic_regmem 
  printnl ( 349 ) ;
  if ( blankline ) 
  println () ;
  selector = oldsetting ;
} 
void 
zprintlengthparam ( integer n ) 
{
  printlengthparam_regmem 
  switch ( n ) 
  {case 0 : 
    printesc ( 535 ) ;
    break ;
  case 1 : 
    printesc ( 536 ) ;
    break ;
  case 2 : 
    printesc ( 537 ) ;
    break ;
  case 3 : 
    printesc ( 538 ) ;
    break ;
  case 4 : 
    printesc ( 539 ) ;
    break ;
  case 5 : 
    printesc ( 540 ) ;
    break ;
  case 6 : 
    printesc ( 541 ) ;
    break ;
  case 7 : 
    printesc ( 542 ) ;
    break ;
  case 8 : 
    printesc ( 543 ) ;
    break ;
  case 9 : 
    printesc ( 544 ) ;
    break ;
  case 10 : 
    printesc ( 545 ) ;
    break ;
  case 11 : 
    printesc ( 546 ) ;
    break ;
  case 12 : 
    printesc ( 547 ) ;
    break ;
  case 13 : 
    printesc ( 548 ) ;
    break ;
  case 14 : 
    printesc ( 549 ) ;
    break ;
  case 15 : 
    printesc ( 550 ) ;
    break ;
  case 16 : 
    printesc ( 551 ) ;
    break ;
  case 17 : 
    printesc ( 552 ) ;
    break ;
  case 18 : 
    printesc ( 553 ) ;
    break ;
  case 19 : 
    printesc ( 554 ) ;
    break ;
  case 21 : 
    printesc ( 555 ) ;
    break ;
  case 22 : 
    printesc ( 556 ) ;
    break ;
  case 20 : 
    printesc ( 557 ) ;
    break ;
  case 23 : 
    printesc ( 558 ) ;
    break ;
  case 24 : 
    printesc ( 559 ) ;
    break ;
    default: 
    print ( 560 ) ;
    break ;
  } 
} 
void 
zprintcmdchr ( quarterword cmd , halfword chrcode ) 
{
  printcmdchr_regmem 
  integer n  ;
  switch ( cmd ) 
  {case 1 : 
    {
      print ( 645 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 2 : 
    {
      print ( 646 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 3 : 
    {
      print ( 647 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 6 : 
    {
      print ( 648 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 7 : 
    {
      print ( 649 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 8 : 
    {
      print ( 650 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 9 : 
    print ( 651 ) ;
    break ;
  case 10 : 
    {
      print ( 652 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 11 : 
    {
      print ( 653 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 12 : 
    {
      print ( 654 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 16 : 
  case 17 : 
  case 18 : 
  case 19 : 
  case 20 : 
    {
      print ( 655 ) ;
      printkanji ( chrcode ) ;
    } 
    break ;
  case 85 : 
  case 86 : 
    if ( chrcode < 49946L ) 
    printskipparam ( chrcode - 49925L ) ;
    else if ( chrcode < 50202L ) 
    {
      printesc ( 423 ) ;
      printint ( chrcode - 49946L ) ;
    } 
    else {
	
      printesc ( 424 ) ;
      printint ( chrcode - 50202L ) ;
    } 
    break ;
  case 82 : 
    if ( chrcode >= 50469L ) 
    {
      printesc ( 435 ) ;
      printint ( chrcode - 50469L ) ;
    } 
    else switch ( chrcode ) 
    {case 50459 : 
      printesc ( 426 ) ;
      break ;
    case 50460 : 
      printesc ( 427 ) ;
      break ;
    case 50461 : 
      printesc ( 428 ) ;
      break ;
    case 50462 : 
      printesc ( 429 ) ;
      break ;
    case 50463 : 
      printesc ( 430 ) ;
      break ;
    case 50464 : 
      printesc ( 431 ) ;
      break ;
    case 50465 : 
      printesc ( 432 ) ;
      break ;
    case 50466 : 
      printesc ( 433 ) ;
      break ;
    case 50468 : 
      printesc ( 1548 ) ;
      break ;
      default: 
      printesc ( 434 ) ;
      break ;
    } 
    break ;
  case 83 : 
    if ( chrcode < 114445L ) 
    printparam ( chrcode - 114361L ) ;
    else {
	
      printesc ( 533 ) ;
      printint ( chrcode - 114445L ) ;
    } 
    break ;
  case 84 : 
    if ( chrcode < 114982L ) 
    printlengthparam ( chrcode - 114957L ) ;
    else {
	
      printesc ( 561 ) ;
      printint ( chrcode - 114982L ) ;
    } 
    break ;
  case 51 : 
    printesc ( 572 ) ;
    break ;
  case 105 : 
    printesc ( 573 ) ;
    break ;
  case 46 : 
    printesc ( 574 ) ;
    break ;
  case 47 : 
    printesc ( 575 ) ;
    break ;
  case 87 : 
    printesc ( 587 ) ;
    break ;
  case 67 : 
    printesc ( 576 ) ;
    break ;
  case 48 : 
    printesc ( 602 ) ;
    break ;
  case 21 : 
    printesc ( 577 ) ;
    break ;
  case 22 : 
    printesc ( 578 ) ;
    break ;
  case 125 : 
    printesc ( 568 ) ;
    break ;
  case 101 : 
    printesc ( 584 ) ;
    break ;
  case 102 : 
    printesc ( 585 ) ;
    break ;
  case 103 : 
    printesc ( 586 ) ;
    break ;
  case 15 : 
    if ( chrcode == 0 ) 
    printesc ( 579 ) ;
    else printesc ( 580 ) ;
    break ;
  case 107 : 
    printesc ( 581 ) ;
    break ;
  case 73 : 
    printesc ( 569 ) ;
    break ;
  case 68 : 
    printesc ( 582 ) ;
    break ;
  case 70 : 
    printesc ( 32 ) ;
    break ;
  case 120 : 
    if ( chrcode == 0 ) 
    printesc ( 583 ) ;
    else printesc ( 931 ) ;
    break ;
  case 38 : 
    printesc ( 588 ) ;
    break ;
  case 42 : 
    printesc ( 589 ) ;
    break ;
  case 45 : 
    if ( chrcode == 0 ) 
    printesc ( 590 ) ;
    else printesc ( 565 ) ;
    break ;
  case 43 : 
    printesc ( 341 ) ;
    break ;
  case 50 : 
    printesc ( 47 ) ;
    break ;
  case 24 : 
    {
      printesc ( 366 ) ;
      if ( chrcode > 0 ) 
      printchar ( 115 ) ;
    } 
    break ;
  case 52 : 
    if ( chrcode == 0 ) 
    printesc ( 591 ) ;
    else printesc ( 593 ) ;
    break ;
  case 23 : 
    if ( chrcode == 0 ) 
    printesc ( 592 ) ;
    else printesc ( 594 ) ;
    break ;
  case 60 : 
    printesc ( 595 ) ;
    break ;
  case 106 : 
    printesc ( 596 ) ;
    break ;
  case 40 : 
    printesc ( 597 ) ;
    break ;
  case 71 : 
    printesc ( 598 ) ;
    break ;
  case 121 : 
    if ( chrcode == 0 ) 
    printesc ( 599 ) ;
    else printesc ( 565 ) ;
    break ;
  case 61 : 
    printesc ( 346 ) ;
    break ;
  case 69 : 
    printesc ( 600 ) ;
    break ;
  case 72 : 
    if ( chrcode == 0 ) 
    printesc ( 604 ) ;
    else printesc ( 605 ) ;
    break ;
  case 111 : 
    if ( chrcode == 0 ) 
    printesc ( 606 ) ;
    else printesc ( 1617 ) ;
    break ;
  case 0 : 
    printesc ( 607 ) ;
    break ;
  case 113 : 
    printesc ( 608 ) ;
    break ;
  case 93 : 
    printesc ( 603 ) ;
    break ;
  case 97 : 
    switch ( chrcode ) 
    {case 50458 : 
      printesc ( 601 ) ;
      break ;
    case 50725 : 
      printesc ( 1651 ) ;
      break ;
    case 50726 : 
      printesc ( 1652 ) ;
      break ;
    case 50727 : 
      printesc ( 1653 ) ;
      break ;
    case 50728 : 
      printesc ( 1654 ) ;
      break ;
    } 
    break ;
  case 127 : 
    if ( chrcode == 0 ) 
    printesc ( 609 ) ;
    else if ( chrcode == 1 ) 
    printesc ( 1592 ) ;
    else printesc ( 1593 ) ;
    break ;
  case 81 : 
    {
      printesc ( 435 ) ;
      if ( chrcode != membot ) 
      printsanum ( chrcode ) ;
    } 
    break ;
  case 44 : 
    printesc ( 367 ) ;
    break ;
  case 39 : 
    if ( chrcode == 0 ) 
    printesc ( 610 ) ;
    else switch ( chrcode ) 
    {case 6 : 
      printesc ( 1603 ) ;
      break ;
    case 7 : 
      printesc ( 1604 ) ;
      break ;
    case 10 : 
      printesc ( 1605 ) ;
      break ;
      default: 
      printesc ( 1606 ) ;
      break ;
    } 
    break ;
  case 62 : 
    printesc ( 611 ) ;
    break ;
  case 41 : 
    printesc ( 612 ) ;
    break ;
  case 118 : 
    printesc ( 532 ) ;
    break ;
  case 13 : 
    printesc ( 688 ) ;
    break ;
  case 122 : 
    if ( chrcode == 0 ) 
    printesc ( 724 ) ;
    else if ( chrcode == 2 ) 
    printesc ( 1615 ) ;
    else printesc ( 725 ) ;
    break ;
  case 128 : 
    {
      switch ( ( chrcode % 5 ) ) 
      {case 1 : 
	printesc ( 727 ) ;
	break ;
      case 2 : 
	printesc ( 728 ) ;
	break ;
      case 3 : 
	printesc ( 729 ) ;
	break ;
      case 4 : 
	printesc ( 730 ) ;
	break ;
	default: 
	printesc ( 726 ) ;
	break ;
      } 
      if ( chrcode >= 5 ) 
      printchar ( 115 ) ;
    } 
    break ;
  case 104 : 
    {
      if ( ( chrcode < membot ) || ( chrcode > membot + 23 ) ) 
      cmd = ( mem [chrcode ].hh.b0 / 16 ) ;
      else {
	  
	cmd = chrcode - membot ;
	chrcode = -1073741823L ;
      } 
      if ( cmd == 0 ) 
      printesc ( 533 ) ;
      else if ( cmd == 1 ) 
      printesc ( 561 ) ;
      else if ( cmd == 2 ) 
      printesc ( 423 ) ;
      else printesc ( 424 ) ;
      if ( chrcode != -1073741823L ) 
      printsanum ( chrcode ) ;
    } 
    break ;
  case 92 : 
    if ( chrcode == 1 ) 
    printesc ( 769 ) ;
    else printesc ( 768 ) ;
    break ;
  case 95 : 
    if ( chrcode == 0 ) 
    printesc ( 770 ) ;
    else if ( chrcode == 2 ) 
    printesc ( 1598 ) ;
    else printesc ( 771 ) ;
    break ;
  case 96 : 
    if ( chrcode == 1 ) 
    printesc ( 772 ) ;
    else if ( chrcode == 3 ) 
    printesc ( 773 ) ;
    else printesc ( 774 ) ;
    break ;
  case 78 : 
    switch ( chrcode ) 
    {case 0 : 
      printesc ( 775 ) ;
      break ;
    case 1 : 
      printesc ( 776 ) ;
      break ;
    case 2 : 
      printesc ( 777 ) ;
      break ;
    case 7 : 
      printesc ( 778 ) ;
      break ;
    case 9 : 
      printesc ( 780 ) ;
      break ;
    case 10 : 
      printesc ( 781 ) ;
      break ;
    case 11 : 
      printesc ( 782 ) ;
      break ;
    case 12 : 
      printesc ( 783 ) ;
      break ;
    case 3 : 
      printesc ( 1537 ) ;
      break ;
    case 4 : 
      printesc ( 1538 ) ;
      break ;
    case 5 : 
      printesc ( 1539 ) ;
      break ;
    case 6 : 
      printesc ( 1540 ) ;
      break ;
    case 18 : 
      printesc ( 1541 ) ;
      break ;
    case 13 : 
      printesc ( 1542 ) ;
      break ;
    case 14 : 
      printesc ( 1543 ) ;
      break ;
    case 16 : 
      printesc ( 1546 ) ;
      break ;
    case 15 : 
      printesc ( 1544 ) ;
      break ;
    case 17 : 
      printesc ( 1545 ) ;
      break ;
    case 19 : 
      printesc ( 1577 ) ;
      break ;
    case 20 : 
      printesc ( 1578 ) ;
      break ;
    case 21 : 
      printesc ( 1579 ) ;
      break ;
    case 22 : 
      printesc ( 1580 ) ;
      break ;
    case 23 : 
      printesc ( 1581 ) ;
      break ;
    case 29 : 
      printesc ( 1582 ) ;
      break ;
    case 30 : 
      printesc ( 1583 ) ;
      break ;
    case 31 : 
      printesc ( 1584 ) ;
      break ;
    case 32 : 
      printesc ( 1585 ) ;
      break ;
    case 33 : 
      printesc ( 1586 ) ;
      break ;
    case 34 : 
      printesc ( 1587 ) ;
      break ;
    case 35 : 
      printesc ( 1588 ) ;
      break ;
    case 40 : 
      printesc ( 1627 ) ;
      break ;
    case 41 : 
      printesc ( 1628 ) ;
      break ;
    case 42 : 
      printesc ( 1629 ) ;
      break ;
    case 43 : 
      printesc ( 1630 ) ;
      break ;
    case 24 : 
      printesc ( 1634 ) ;
      break ;
    case 25 : 
      printesc ( 1635 ) ;
      break ;
    case 36 : 
      printesc ( 1636 ) ;
      break ;
    case 37 : 
      printesc ( 1637 ) ;
      break ;
    case 38 : 
      printesc ( 1638 ) ;
      break ;
    case 39 : 
      printesc ( 1639 ) ;
      break ;
    case 26 : 
      printesc ( 1716 ) ;
      break ;
    case 27 : 
      printesc ( 1717 ) ;
      break ;
    case 28 : 
      printesc ( 1718 ) ;
      break ;
      default: 
      printesc ( 779 ) ;
      break ;
    } 
    break ;
  case 126 : 
    switch ( chrcode ) 
    {case 0 : 
      printesc ( 846 ) ;
      break ;
    case 1 : 
      printesc ( 847 ) ;
      break ;
    case 3 : 
      printesc ( 848 ) ;
      break ;
    case 4 : 
      printesc ( 849 ) ;
      break ;
    case 5 : 
      printesc ( 850 ) ;
      break ;
    case 2 : 
      printesc ( 851 ) ;
      break ;
    case 6 : 
      printesc ( 852 ) ;
      break ;
    case 7 : 
      printesc ( 853 ) ;
      break ;
    case 8 : 
      printesc ( 854 ) ;
      break ;
    case 9 : 
      printesc ( 855 ) ;
      break ;
    case 10 : 
      printesc ( 856 ) ;
      break ;
    case 11 : 
      printesc ( 857 ) ;
      break ;
    case 12 : 
      printesc ( 858 ) ;
      break ;
    case 13 : 
      printesc ( 859 ) ;
      break ;
    case 14 : 
      printesc ( 860 ) ;
      break ;
    case 15 : 
      printesc ( 861 ) ;
      break ;
    case 16 : 
      printesc ( 864 ) ;
      break ;
    case 17 : 
      printesc ( 862 ) ;
      break ;
    case 18 : 
      printesc ( 865 ) ;
      break ;
    case 19 : 
      printesc ( 866 ) ;
      break ;
    case 20 : 
      printesc ( 867 ) ;
      break ;
    case 21 : 
      printesc ( 868 ) ;
      break ;
    case 22 : 
      printesc ( 869 ) ;
      break ;
    case 23 : 
      printesc ( 870 ) ;
      break ;
    case 24 : 
      printesc ( 871 ) ;
      break ;
    case 25 : 
      printesc ( 872 ) ;
      break ;
    case 26 : 
      printesc ( 873 ) ;
      break ;
    case 27 : 
      printesc ( 874 ) ;
      break ;
      default: 
      printesc ( 863 ) ;
      break ;
    } 
    break ;
  case 123 : 
    {
      if ( chrcode >= 32 ) 
      printesc ( 931 ) ;
      switch ( chrcode % 32 ) 
      {case 1 : 
	printesc ( 905 ) ;
	break ;
      case 2 : 
	printesc ( 906 ) ;
	break ;
      case 3 : 
	printesc ( 907 ) ;
	break ;
      case 4 : 
	printesc ( 908 ) ;
	break ;
      case 5 : 
	printesc ( 909 ) ;
	break ;
      case 6 : 
	printesc ( 910 ) ;
	break ;
      case 7 : 
	printesc ( 911 ) ;
	break ;
      case 8 : 
	printesc ( 912 ) ;
	break ;
      case 9 : 
	printesc ( 913 ) ;
	break ;
      case 10 : 
	printesc ( 914 ) ;
	break ;
      case 11 : 
	printesc ( 915 ) ;
	break ;
      case 12 : 
	printesc ( 916 ) ;
	break ;
      case 13 : 
	printesc ( 917 ) ;
	break ;
      case 14 : 
	printesc ( 918 ) ;
	break ;
      case 15 : 
	printesc ( 919 ) ;
	break ;
      case 16 : 
	printesc ( 920 ) ;
	break ;
      case 22 : 
	printesc ( 921 ) ;
	break ;
      case 23 : 
	printesc ( 922 ) ;
	break ;
      case 24 : 
	printesc ( 923 ) ;
	break ;
      case 25 : 
	printesc ( 924 ) ;
	break ;
      case 26 : 
	printesc ( 925 ) ;
	break ;
      case 27 : 
	printesc ( 926 ) ;
	break ;
      case 28 : 
	printesc ( 927 ) ;
	break ;
      case 29 : 
	printesc ( 928 ) ;
	break ;
      case 21 : 
	printesc ( 932 ) ;
	break ;
      case 30 : 
	printesc ( 929 ) ;
	break ;
      case 31 : 
	printesc ( 930 ) ;
	break ;
      case 17 : 
	printesc ( 1618 ) ;
	break ;
      case 18 : 
	printesc ( 1619 ) ;
	break ;
      case 19 : 
	printesc ( 1620 ) ;
	break ;
      case 20 : 
	printesc ( 1621 ) ;
	break ;
	default: 
	printesc ( 904 ) ;
	break ;
      } 
    } 
    break ;
  case 124 : 
    if ( chrcode == 2 ) 
    printesc ( 321 ) ;
    else if ( chrcode == 4 ) 
    printesc ( 933 ) ;
    else printesc ( 934 ) ;
    break ;
  case 4 : 
    if ( chrcode == 16777216L ) 
    printesc ( 1067 ) ;
    else {
	
      print ( 1071 ) ;
      if ( chrcode < 256 ) 
      print ( chrcode ) ;
      else printkanji ( chrcode ) ;
    } 
    break ;
  case 5 : 
    if ( chrcode == 16777217L ) 
    printesc ( 1068 ) ;
    else printesc ( 1069 ) ;
    break ;
  case 94 : 
    switch ( chrcode ) 
    {case 0 : 
      printesc ( 1139 ) ;
      break ;
    case 1 : 
      printesc ( 1140 ) ;
      break ;
    case 2 : 
      printesc ( 1141 ) ;
      break ;
    case 3 : 
      printesc ( 1142 ) ;
      break ;
    case 4 : 
      printesc ( 1143 ) ;
      break ;
    case 5 : 
      printesc ( 1144 ) ;
      break ;
    case 6 : 
      printesc ( 1145 ) ;
      break ;
    case 7 : 
      printesc ( 1146 ) ;
      break ;
      default: 
      printesc ( 1147 ) ;
      break ;
    } 
    break ;
  case 14 : 
    if ( chrcode == 1 ) 
    printesc ( 1196 ) ;
    else printesc ( 354 ) ;
    break ;
  case 32 : 
    switch ( chrcode ) 
    {case 5 : 
      printesc ( 1197 ) ;
      break ;
    case 0 : 
      printesc ( 1198 ) ;
      break ;
    case 1 : 
      printesc ( 1199 ) ;
      break ;
    case 2 : 
      printesc ( 1200 ) ;
      break ;
    case 3 : 
      printesc ( 1201 ) ;
      break ;
      default: 
      printesc ( 1202 ) ;
      break ;
    } 
    break ;
  case 33 : 
    switch ( chrcode ) 
    {case 5 : 
      printesc ( 1203 ) ;
      break ;
    case 0 : 
      printesc ( 1204 ) ;
      break ;
    case 1 : 
      printesc ( 1205 ) ;
      break ;
    case 2 : 
      printesc ( 1206 ) ;
      break ;
    case 3 : 
      printesc ( 1207 ) ;
      break ;
      default: 
      printesc ( 1208 ) ;
      break ;
    } 
    break ;
  case 34 : 
    printesc ( 347 ) ;
    break ;
  case 35 : 
    printesc ( 351 ) ;
    break ;
  case 36 : 
    printesc ( 353 ) ;
    break ;
  case 27 : 
    if ( chrcode == 1 ) 
    printesc ( 1226 ) ;
    else printesc ( 1227 ) ;
    break ;
  case 28 : 
    if ( chrcode == 1 ) 
    printesc ( 1228 ) ;
    else printesc ( 1229 ) ;
    break ;
  case 26 : 
    switch ( chrcode ) 
    {case 0 : 
      printesc ( 437 ) ;
      break ;
    case 1 : 
      printesc ( 1230 ) ;
      break ;
    case 2 : 
      printesc ( 1231 ) ;
      break ;
    case 3 : 
      printesc ( 1134 ) ;
      break ;
    case 4 : 
      printesc ( 1232 ) ;
      break ;
    case 5 : 
      printesc ( 1136 ) ;
      break ;
      default: 
      printesc ( 1233 ) ;
      break ;
    } 
    break ;
  case 80 : 
    switch ( chrcode ) 
    {case 4 : 
      printesc ( 1235 ) ;
      break ;
    case 3 : 
      printesc ( 1234 ) ;
      break ;
    case 1 : 
      printesc ( 1236 ) ;
      break ;
    } 
    break ;
  case 37 : 
    if ( chrcode == 100 ) 
    printesc ( 1238 ) ;
    else if ( chrcode == 101 ) 
    printesc ( 1239 ) ;
    else if ( chrcode == 102 ) 
    printesc ( 1240 ) ;
    else printesc ( 1237 ) ;
    break ;
  case 49 : 
    if ( chrcode == 0 ) 
    printesc ( 1272 ) ;
    else printesc ( 1271 ) ;
    break ;
  case 31 : 
    if ( chrcode == 12 ) 
    printesc ( 1285 ) ;
    else if ( chrcode == 13 ) 
    printesc ( 1284 ) ;
    else printesc ( 1283 ) ;
    break ;
  case 29 : 
    if ( chrcode == 1 ) 
    printesc ( 1287 ) ;
    else printesc ( 1286 ) ;
    break ;
  case 30 : 
    if ( chrcode == 1 ) 
    printesc ( 1289 ) ;
    else if ( chrcode == 2 ) 
    printesc ( 1649 ) ;
    else if ( chrcode == 3 ) 
    printesc ( 1650 ) ;
    else printesc ( 1288 ) ;
    break ;
  case 53 : 
    if ( chrcode == 1 ) 
    printesc ( 45 ) ;
    else printesc ( 364 ) ;
    break ;
  case 54 : 
    if ( chrcode == 1 ) 
    printesc ( 1327 ) ;
    else printesc ( 1326 ) ;
    break ;
  case 56 : 
    switch ( chrcode ) 
    {case 18 : 
      printesc ( 1033 ) ;
      break ;
    case 19 : 
      printesc ( 1034 ) ;
      break ;
    case 20 : 
      printesc ( 1035 ) ;
      break ;
    case 21 : 
      printesc ( 1036 ) ;
      break ;
    case 22 : 
      printesc ( 1037 ) ;
      break ;
    case 23 : 
      printesc ( 1038 ) ;
      break ;
    case 24 : 
      printesc ( 1039 ) ;
      break ;
    case 25 : 
      printesc ( 1040 ) ;
      break ;
    case 28 : 
      printesc ( 1042 ) ;
      break ;
      default: 
      printesc ( 1041 ) ;
      break ;
    } 
    break ;
  case 57 : 
    if ( chrcode == 1 ) 
    printesc ( 1046 ) ;
    else if ( chrcode == 2 ) 
    printesc ( 1047 ) ;
    else printesc ( 1331 ) ;
    break ;
  case 59 : 
    printstyle ( chrcode ) ;
    break ;
  case 58 : 
    switch ( chrcode ) 
    {case 1 : 
      printesc ( 1350 ) ;
      break ;
    case 2 : 
      printesc ( 1351 ) ;
      break ;
    case 3 : 
      printesc ( 1352 ) ;
      break ;
    case 4 : 
      printesc ( 1353 ) ;
      break ;
    case 5 : 
      printesc ( 1354 ) ;
      break ;
      default: 
      printesc ( 1349 ) ;
      break ;
    } 
    break ;
  case 55 : 
    if ( chrcode == 32 ) 
    printesc ( 1043 ) ;
    else if ( chrcode == 1 ) 
    printesc ( 1045 ) ;
    else printesc ( 1044 ) ;
    break ;
  case 108 : 
    if ( chrcode == 1 ) 
    printesc ( 1374 ) ;
    else if ( chrcode == 2 ) 
    printesc ( 1375 ) ;
    else if ( chrcode == 8 ) 
    printesc ( 1388 ) ;
    else printesc ( 1376 ) ;
    break ;
  case 112 : 
    if ( chrcode == 0 ) 
    printesc ( 1377 ) ;
    else if ( chrcode == 1 ) 
    printesc ( 1378 ) ;
    else if ( chrcode == 2 ) 
    printesc ( 1379 ) ;
    else printesc ( 1380 ) ;
    break ;
  case 109 : 
    if ( chrcode != 0 ) 
    printesc ( 1398 ) ;
    else printesc ( 1397 ) ;
    break ;
  case 110 : 
    switch ( chrcode ) 
    {case 0 : 
      printesc ( 1399 ) ;
      break ;
    case 9 : 
      printesc ( 1400 ) ;
      break ;
    case 1 : 
      printesc ( 1401 ) ;
      break ;
    case 2 : 
      printesc ( 1402 ) ;
      break ;
    case 3 : 
      printesc ( 1403 ) ;
      break ;
    case 4 : 
      printesc ( 1404 ) ;
      break ;
    case 5 : 
      printesc ( 1405 ) ;
      break ;
    case 6 : 
      printesc ( 1406 ) ;
      break ;
    case 8 : 
      printesc ( 1408 ) ;
      break ;
      default: 
      printesc ( 1407 ) ;
      break ;
    } 
    break ;
  case 74 : 
    {
      printesc ( 577 ) ;
      printhex ( chrcode ) ;
    } 
    break ;
  case 75 : 
    {
      printesc ( 578 ) ;
      printhex ( chrcode ) ;
    } 
    break ;
  case 76 : 
    {
      printesc ( 592 ) ;
      printhex ( chrcode ) ;
    } 
    break ;
  case 77 : 
    {
      printesc ( 594 ) ;
      printhex ( chrcode ) ;
    } 
    break ;
  case 98 : 
    if ( chrcode == 51759L ) 
    printesc ( 443 ) ;
    else if ( chrcode == 63663L ) 
    printesc ( 444 ) ;
    else if ( chrcode == 64175L ) 
    printesc ( 445 ) ;
    else if ( chrcode == 113849L ) 
    printesc ( 462 ) ;
    else if ( chrcode == 113977L ) 
    printesc ( 1413 ) ;
    else if ( chrcode == 78137L ) 
    printesc ( 459 ) ;
    else if ( chrcode == 90041L ) 
    printesc ( 460 ) ;
    else if ( chrcode == 101945L ) 
    printesc ( 461 ) ;
    else if ( chrcode == 114701L ) 
    printesc ( 534 ) ;
    else printesc ( 1414 ) ;
    break ;
  case 99 : 
    printsize ( chrcode - 50986L ) ;
    break ;
  case 114 : 
    if ( chrcode == 1 ) 
    printesc ( 1122 ) ;
    else printesc ( 1110 ) ;
    break ;
  case 88 : 
    if ( chrcode == 0 ) 
    printesc ( 1432 ) ;
    else printesc ( 1433 ) ;
    break ;
  case 100 : 
    {
      print ( 1441 ) ;
      slowprint ( fontname [chrcode ]) ;
      if ( fontsize [chrcode ]!= fontdsize [chrcode ]) 
      {
	print ( 888 ) ;
	printscaled ( fontsize [chrcode ]) ;
	print ( 425 ) ;
      } 
    } 
    break ;
  case 115 : 
    switch ( chrcode ) 
    {case 0 : 
      printesc ( 275 ) ;
      break ;
    case 1 : 
      printesc ( 276 ) ;
      break ;
    case 2 : 
      printesc ( 277 ) ;
      break ;
      default: 
      printesc ( 1442 ) ;
      break ;
    } 
    break ;
  case 66 : 
    if ( chrcode == 0 ) 
    printesc ( 1444 ) ;
    else printesc ( 1443 ) ;
    break ;
  case 64 : 
    if ( chrcode == 0 ) 
    printesc ( 1445 ) ;
    else printesc ( 1446 ) ;
    break ;
  case 63 : 
    if ( chrcode == 78137L ) 
    printesc ( 1452 ) ;
    else printesc ( 1453 ) ;
    break ;
  case 25 : 
    switch ( chrcode ) 
    {case 1 : 
      printesc ( 1455 ) ;
      break ;
    case 2 : 
      printesc ( 1456 ) ;
      break ;
    case 3 : 
      printesc ( 1457 ) ;
      break ;
    case 4 : 
      printesc ( 1589 ) ;
      break ;
    case 5 : 
      printesc ( 1591 ) ;
      break ;
    case 6 : 
      printesc ( 1594 ) ;
      break ;
    case 7 : 
      printesc ( 1458 ) ;
      break ;
      default: 
      printesc ( 1454 ) ;
      break ;
    } 
    break ;
  case 119 : 
    print ( 1465 ) ;
    break ;
  case 129 : 
  case 130 : 
  case 131 : 
  case 132 : 
    {
      n = cmd - 129 ;
      if ( mem [mem [chrcode ].hh .v.RH ].hh .v.LH == 917505L ) 
      n = n + 4 ;
      if ( odd ( n / 4 ) ) 
      printesc ( 1388 ) ;
      if ( odd ( n ) ) 
      printesc ( 1374 ) ;
      if ( odd ( n / 2 ) ) 
      printesc ( 1375 ) ;
      if ( n > 0 ) 
      printchar ( 32 ) ;
      print ( 1466 ) ;
    } 
    break ;
  case 133 : 
    printesc ( 1467 ) ;
    break ;
  case 65 : 
    switch ( chrcode ) 
    {case 0 : 
      printesc ( 1502 ) ;
      break ;
    case 1 : 
      printesc ( 684 ) ;
      break ;
    case 2 : 
      printesc ( 1503 ) ;
      break ;
    case 3 : 
      printesc ( 1504 ) ;
      break ;
    case 5 : 
      printesc ( 1505 ) ;
      break ;
    case 6 : 
      printesc ( 1506 ) ;
      break ;
    case 8 : 
      printesc ( 1508 ) ;
      break ;
    case 9 : 
      printesc ( 1509 ) ;
      break ;
    case 10 : 
      printesc ( 1510 ) ;
      break ;
    case 7 : 
      printesc ( 1507 ) ;
      break ;
      default: 
      print ( 1511 ) ;
      break ;
    } 
    break ;
  case 91 : 
    printesc ( 458 ) ;
    break ;
  case 116 : 
    {
      if ( ( chrcode % 2 ) == 0 ) 
      printesc ( 1679 ) ;
      else printesc ( 1680 ) ;
      if ( chrcode < 2 ) 
      print ( 1681 ) ;
      else print ( 1682 ) ;
    } 
    break ;
  case 117 : 
    {
      if ( chrcode == 0 ) 
      printesc ( 1683 ) ;
      else if ( chrcode == 1 ) 
      printesc ( 1684 ) ;
      else printesc ( 1685 ) ;
      print ( 1686 ) ;
    } 
    break ;
  case 79 : 
    if ( ( chrcode > 0 ) ) 
    printesc ( 1692 ) ;
    else printesc ( 1691 ) ;
    break ;
  case 90 : 
    printesc ( 1693 ) ;
    break ;
  case 89 : 
    switch ( chrcode ) 
    {case 1 : 
      printesc ( 1696 ) ;
      break ;
    case 2 : 
      printesc ( 1697 ) ;
      break ;
    } 
    break ;
    default: 
    print ( 656 ) ;
    break ;
  } 
} 
#ifdef STAT
void 
zshoweqtb ( halfword n ) 
{
  showeqtb_regmem 
  if ( n < 1 ) 
  printchar ( 63 ) ;
  else if ( ( n < 49925L ) || ( ( n > 116261L ) && ( n <= eqtbtop ) ) ) 
  {
    sprintcs ( n ) ;
    printchar ( 61 ) ;
    printcmdchr ( eqtb [n ].hh.b0 , eqtb [n ].hh .v.RH ) ;
    if ( eqtb [n ].hh.b0 >= 129 ) 
    {
      printchar ( 58 ) ;
      showtokenlist ( mem [eqtb [n ].hh .v.RH ].hh .v.RH , -1073741823L , 
      32 ) ;
    } 
  } 
  else if ( n < 50458L ) {
      
    if ( n < 49946L ) 
    {
      printskipparam ( n - 49925L ) ;
      printchar ( 61 ) ;
      if ( n < 49942L ) 
      printspec ( eqtb [n ].hh .v.RH , 425 ) ;
      else printspec ( eqtb [n ].hh .v.RH , 348 ) ;
    } 
    else if ( n < 50202L ) 
    {
      printesc ( 423 ) ;
      printint ( n - 49946L ) ;
      printchar ( 61 ) ;
      printspec ( eqtb [n ].hh .v.RH , 425 ) ;
    } 
    else {
	
      printesc ( 424 ) ;
      printint ( n - 50202L ) ;
      printchar ( 61 ) ;
      printspec ( eqtb [n ].hh .v.RH , 348 ) ;
    } 
  } 
  else if ( n < 114361L ) {
      
    if ( ( n == 50458L ) || ( ( n >= 50725L ) && ( n < 50729L ) ) ) 
    {
      printcmdchr ( 97 , n ) ;
      printchar ( 61 ) ;
      if ( eqtb [n ].hh .v.RH == -1073741823L ) 
      printchar ( 48 ) ;
      else if ( n > 50458L ) 
      {
	printint ( mem [eqtb [n ].hh .v.RH + 1 ].cint ) ;
	printchar ( 32 ) ;
	printint ( mem [eqtb [n ].hh .v.RH + 2 ].cint ) ;
	if ( mem [eqtb [n ].hh .v.RH + 1 ].cint > 1 ) 
	printesc ( 436 ) ;
      } 
      else printint ( mem [eqtb [50458L ].hh .v.RH ].hh .v.LH ) ;
    } 
    else if ( n < 50469L ) 
    {
      printcmdchr ( 82 , n ) ;
      printchar ( 61 ) ;
      if ( eqtb [n ].hh .v.RH != -1073741823L ) 
      showtokenlist ( mem [eqtb [n ].hh .v.RH ].hh .v.RH , -1073741823L , 
      32 ) ;
    } 
    else if ( n < 50729L ) 
    {
      printesc ( 435 ) ;
      printint ( n - 50469L ) ;
      printchar ( 61 ) ;
      if ( eqtb [n ].hh .v.RH != -1073741823L ) 
      showtokenlist ( mem [eqtb [n ].hh .v.RH ].hh .v.RH , -1073741823L , 
      32 ) ;
    } 
    else if ( n < 50985L ) 
    {
      printesc ( 437 ) ;
      printint ( n - 50729L ) ;
      printchar ( 61 ) ;
      if ( eqtb [n ].hh .v.RH == -1073741823L ) 
      print ( 438 ) ;
      else {
	  
	depththreshold = 0 ;
	breadthmax = 1 ;
	shownodelist ( eqtb [n ].hh .v.RH ) ;
      } 
    } 
    else if ( n < 51759L ) 
    {
      if ( n == 50985L ) 
      print ( 439 ) ;
      else if ( n < 51242L ) 
      {
	printesc ( 440 ) ;
	printint ( n - 50986L ) ;
      } 
      else if ( n < 51498L ) 
      {
	printesc ( 441 ) ;
	printint ( n - 51242L ) ;
      } 
      else {
	  
	printesc ( 442 ) ;
	printint ( n - 51498L ) ;
      } 
      printchar ( 61 ) ;
      printesc ( hash [40923L + eqtb [n ].hh .v.RH ].v.RH ) ;
    } 
    else if ( n < 113849L ) 
    {
      if ( n < 63663L ) 
      {
	printesc ( 443 ) ;
	printint ( n - 51759L ) ;
      } 
      else if ( n < 64175L ) 
      {
	printesc ( 444 ) ;
	printint ( n - 63663L ) ;
      } 
      else if ( n < 76079L ) 
      {
	printesc ( 445 ) ;
	printint ( n - 64175L ) ;
      } 
      else if ( n < 77103L ) 
      {
	print ( 446 ) ;
	printint ( n - 76079L ) ;
	print ( 447 ) ;
	switch ( eqtb [n ].hh.b0 ) 
	{case 0 : 
	  print ( 448 ) ;
	  break ;
	case 1 : 
	  print ( 449 ) ;
	  break ;
	case 2 : 
	  print ( 450 ) ;
	  break ;
	case 3 : 
	  print ( 451 ) ;
	  break ;
	case 4 : 
	  print ( 452 ) ;
	  break ;
	} 
	print ( 453 ) ;
      } 
      else if ( n < 78127L ) 
      {
	print ( 454 ) ;
	printint ( n - 77103L ) ;
	print ( 447 ) ;
	switch ( eqtb [n ].hh.b0 ) 
	{case 0 : 
	  print ( 455 ) ;
	  break ;
	case 1 : 
	  print ( 456 ) ;
	  break ;
	case 2 : 
	  print ( 457 ) ;
	  break ;
	case 3 : 
	  print ( 452 ) ;
	  break ;
	} 
	print ( 453 ) ;
      } 
      else if ( n < 78137L ) 
      {
	printesc ( 458 ) ;
	printint ( n - 78127L ) ;
      } 
      else if ( n < 90041L ) 
      {
	printesc ( 459 ) ;
	printint ( n - 78137L ) ;
      } 
      else if ( n < 101945L ) 
      {
	printesc ( 460 ) ;
	printint ( n - 90041L ) ;
      } 
      else {
	  
	printesc ( 461 ) ;
	printint ( n - 101945L ) ;
      } 
      printchar ( 61 ) ;
      printint ( eqtb [n ].hh .v.RH ) ;
    } 
    else {
	
      printesc ( 462 ) ;
      printint ( n - 113849L ) ;
      printchar ( 61 ) ;
      printint ( eqtb [n ].hh .v.RH ) ;
    } 
  } 
  else if ( n < 114957L ) 
  {
    if ( n < 114445L ) 
    printparam ( n - 114361L ) ;
    else if ( n < 114701L ) 
    {
      printesc ( 533 ) ;
      printint ( n - 114445L ) ;
    } 
    else {
	
      printesc ( 534 ) ;
      printint ( n - 114701L ) ;
    } 
    printchar ( 61 ) ;
    printint ( eqtb [n ].cint ) ;
  } 
  else if ( n < 115238L ) 
  {
    if ( n < 114982L ) 
    printlengthparam ( n - 114957L ) ;
    else {
	
      printesc ( 561 ) ;
      printint ( n - 114982L ) ;
    } 
    printchar ( 61 ) ;
    printscaled ( eqtb [n ].cint ) ;
    print ( 425 ) ;
  } 
  else if ( n <= 116261L ) 
  {
    print ( 454 ) ;
    printint ( n - 115238L ) ;
    print ( 562 ) ;
    printint ( eqtb [n ].cint ) ;
  } 
  else printchar ( 63 ) ;
} 
#endif /* STAT */
halfword 
zidlookup ( integer j , integer l ) 
{
  /* 40 */ register halfword Result; idlookup_regmem 
  integer h  ;
  integer d  ;
  halfword p  ;
  halfword k  ;
  h = buffer [j ];
  {register integer for_end; k = j + 1 ;for_end = j + l - 1 ; if ( k <= 
  for_end) do 
    {
      h = h + h + buffer [k ];
      while ( h >= 8501 ) h = h - 8501 ;
    } 
  while ( k++ < for_end ) ;} 
  p = h + 23810 ;
  while ( true ) {
      
    if ( hash [p ].v.RH > 0 ) {
	
      if ( ( strstart [hash [p ].v.RH + 1 ]- strstart [hash [p ].v.RH ]
      ) == l ) {
	  
	if ( streqbuf ( hash [p ].v.RH , j ) ) 
	goto lab40 ;
      } 
    } 
    if ( hash [p ].v.LH == 0 ) 
    {
      if ( nonewcontrolsequence ) 
      p = 49924L ;
      else {
	  
	if ( hash [p ].v.RH > 0 ) 
	{
	  if ( hashhigh < hashextra ) 
	  {
	    incr ( hashhigh ) ;
	    hash [p ].v.LH = hashhigh + 116261L ;
	    p = hashhigh + 116261L ;
	  } 
	  else {
	      
	    do {
		if ( ( hashused == 23810 ) ) 
	      overflow ( 566 , 15000 + hashextra ) ;
	      decr ( hashused ) ;
	    } while ( ! ( hash [hashused ].v.RH == 0 ) ) ;
	    hash [p ].v.LH = hashused ;
	    p = hashused ;
	  } 
	} 
	{
	  if ( poolptr + l > poolsize ) 
	  overflow ( 260 , poolsize - initpoolptr ) ;
	} 
	d = ( poolptr - strstart [strptr ]) ;
	while ( poolptr > strstart [strptr ]) {
	    
	  decr ( poolptr ) ;
	  strpool [poolptr + l ]= strpool [poolptr ];
	} 
	{register integer for_end; k = j ;for_end = j + l - 1 ; if ( k <= 
	for_end) do 
	  {
	    strpool [poolptr ]= buffer2 [k ]* 256 + buffer [k ];
	    incr ( poolptr ) ;
	  } 
	while ( k++ < for_end ) ;} 
	hash [p ].v.RH = makestring () ;
	poolptr = poolptr + d ;
	;
#ifdef STAT
	incr ( cscount ) ;
#endif /* STAT */
      } 
      goto lab40 ;
    } 
    p = hash [p ].v.LH ;
  } 
  lab40: Result = p ;
  return Result ;
} 
halfword 
zprimlookup ( strnumber s ) 
{
  /* 40 */ register halfword Result; primlookup_regmem 
  integer h  ;
  halfword p  ;
  halfword k  ;
  integer j, l  ;
  if ( s <= 255 ) 
  {
    if ( s < 0 ) 
    {
      p = 0 ;
      goto lab40 ;
    } 
    else p = ( s % 1777 ) + 1 ;
    l = 1 ;
  } 
  else {
      
    j = strstart [s ];
    if ( s == strptr ) 
    l = ( poolptr - strstart [strptr ]) ;
    else l = ( strstart [s + 1 ]- strstart [s ]) ;
    h = strpool [j ];
    {register integer for_end; k = j + 1 ;for_end = j + l - 1 ; if ( k <= 
    for_end) do 
      {
	h = h + h + strpool [k ];
	while ( h >= 1777 ) h = h - 1777 ;
      } 
    while ( k++ < for_end ) ;} 
    p = h + 1 ;
  } 
  while ( true ) {
      
    if ( prim [p ].v.RH > 256 ) 
    {
      if ( ( strstart [prim [p ].v.RH + 0 ]- strstart [prim [p ].v.RH - 
      1 ]) == l ) {
	  
	if ( streqstr ( prim [p ].v.RH - 1 , s ) ) 
	goto lab40 ;
      } 
    } 
    else if ( prim [p ].v.RH == 1 + s ) 
    goto lab40 ;
    if ( prim [p ].v.LH == 0 ) 
    {
      if ( nonewcontrolsequence ) 
      p = 0 ;
      else {
	  
	if ( prim [p ].v.RH > 0 ) 
	{
	  do {
	      if ( ( primused == 1 ) ) 
	    overflow ( 567 , 2100 ) ;
	    decr ( primused ) ;
	  } while ( ! ( prim [primused ].v.RH == 0 ) ) ;
	  prim [p ].v.LH = primused ;
	  p = primused ;
	} 
	prim [p ].v.RH = s + 1 ;
      } 
      goto lab40 ;
    } 
    p = prim [p ].v.LH ;
  } 
  lab40: Result = p ;
  return Result ;
} 
#ifdef STAT
void 
zrestoretrace ( halfword p , strnumber s ) 
{
  restoretrace_regmem 
  begindiagnostic () ;
  printchar ( 123 ) ;
  print ( s ) ;
  printchar ( 32 ) ;
  showeqtb ( p ) ;
  printchar ( 125 ) ;
  enddiagnostic ( false ) ;
} 
#endif /* STAT */
void 
zprintgroup ( boolean e ) 
{
  /* 10 */ printgroup_regmem 
  switch ( curgroup ) 
  {case 0 : 
    {
      print ( 1563 ) ;
      return ;
    } 
    break ;
  case 1 : 
  case 14 : 
    {
      if ( curgroup == 14 ) 
      print ( 1564 ) ;
      print ( 1565 ) ;
    } 
    break ;
  case 2 : 
  case 3 : 
    {
      if ( curgroup == 3 ) 
      print ( 1566 ) ;
      print ( 1233 ) ;
    } 
    break ;
  case 4 : 
    print ( 1136 ) ;
    break ;
  case 5 : 
    print ( 1232 ) ;
    break ;
  case 6 : 
  case 7 : 
    {
      if ( curgroup == 7 ) 
      print ( 1567 ) ;
      print ( 1568 ) ;
    } 
    break ;
  case 8 : 
    print ( 426 ) ;
    break ;
  case 10 : 
    print ( 1569 ) ;
    break ;
  case 11 : 
    print ( 341 ) ;
    break ;
  case 12 : 
    print ( 611 ) ;
    break ;
  case 9 : 
  case 13 : 
  case 15 : 
  case 16 : 
    {
      print ( 356 ) ;
      if ( curgroup == 13 ) 
      print ( 1570 ) ;
      else if ( curgroup == 15 ) 
      print ( 1571 ) ;
      else if ( curgroup == 16 ) 
      print ( 1572 ) ;
    } 
    break ;
  } 
  print ( 1573 ) ;
  printint ( curlevel ) ;
  printchar ( 41 ) ;
  if ( savestack [saveptr - 1 ].cint != 0 ) 
  {
    if ( e ) 
    print ( 388 ) ;
    else print ( 1574 ) ;
    printint ( savestack [saveptr - 1 ].cint ) ;
  } 
} 
#ifdef STAT
void 
zgrouptrace ( boolean e ) 
{
  grouptrace_regmem 
  begindiagnostic () ;
  printchar ( 123 ) ;
  if ( e ) 
  print ( 1575 ) ;
  else print ( 1576 ) ;
  printgroup ( e ) ;
  printchar ( 125 ) ;
  enddiagnostic ( false ) ;
} 
#endif /* STAT */
boolean 
pseudoinput ( void ) 
{
  register boolean Result; pseudoinput_regmem 
  halfword p  ;
  integer sz  ;
  fourquarters w  ;
  halfword r  ;
  last = first ;
  p = mem [pseudofiles ].hh .v.LH ;
  if ( p == -1073741823L ) 
  Result = false ;
  else {
      
    mem [pseudofiles ].hh .v.LH = mem [p ].hh .v.RH ;
    sz = mem [p ].hh .v.LH ;
    if ( 4 * sz - 3 >= bufsize - last ) 
    {
      curinput .locfield = first ;
      curinput .limitfield = last - 1 ;
      overflow ( 259 , bufsize ) ;
    } 
    last = first ;
    {register integer for_end; r = p + 1 ;for_end = p + sz - 1 ; if ( r <= 
    for_end) do 
      {
	w = mem [r ].qqqq ;
	buffer [last ]= w .b0 % 256 ;
	buffer [last + 1 ]= w .b1 % 256 ;
	buffer [last + 2 ]= w .b2 % 256 ;
	buffer [last + 3 ]= w .b3 % 256 ;
	buffer2 [last ]= 0 ;
	buffer2 [last + 1 ]= 0 ;
	buffer2 [last + 2 ]= 0 ;
	buffer2 [last + 3 ]= 0 ;
	last = last + 4 ;
      } 
    while ( r++ < for_end ) ;} 
    if ( last >= maxbufstack ) 
    maxbufstack = last + 1 ;
    while ( ( last > first ) && ( buffer [last - 1 ]== 32 ) ) decr ( last ) 
    ;
    freenode ( p , sz ) ;
    Result = true ;
  } 
  return Result ;
} 
void 
pseudoclose ( void ) 
{
  pseudoclose_regmem 
  halfword p, q  ;
  p = mem [pseudofiles ].hh .v.RH ;
  q = mem [pseudofiles ].hh .v.LH ;
  {
    mem [pseudofiles ].hh .v.RH = avail ;
    avail = pseudofiles ;
	;
#ifdef STAT
    decr ( dynused ) ;
#endif /* STAT */
  } 
  pseudofiles = p ;
  while ( q != -1073741823L ) {
      
    p = q ;
    q = mem [p ].hh .v.RH ;
    freenode ( p , mem [p ].hh .v.LH ) ;
  } 
} 
void 
groupwarning ( void ) 
{
  groupwarning_regmem 
  integer i  ;
  boolean w  ;
  baseptr = inputptr ;
  inputstack [baseptr ]= curinput ;
  i = inopen ;
  w = false ;
  while ( ( grpstack [i ]== curboundary ) && ( i > 0 ) ) {
      
    if ( eqtb [114434L ].cint > 0 ) 
    {
      while ( ( inputstack [baseptr ].statefield == 0 ) || ( inputstack [
      baseptr ].indexfield > i ) ) decr ( baseptr ) ;
      if ( inputstack [baseptr ].namefield > 17 ) 
      w = true ;
    } 
    grpstack [i ]= savestack [saveptr ].hh .v.RH ;
    decr ( i ) ;
  } 
  if ( w ) 
  {
    printnl ( 1623 ) ;
    printgroup ( true ) ;
    print ( 1624 ) ;
    println () ;
    if ( eqtb [114434L ].cint > 1 ) 
    showcontext () ;
    if ( history == 0 ) 
    history = 1 ;
  } 
} 
void 
ifwarning ( void ) 
{
  ifwarning_regmem 
  integer i  ;
  boolean w  ;
  baseptr = inputptr ;
  inputstack [baseptr ]= curinput ;
  i = inopen ;
  w = false ;
  while ( ifstack [i ]== condptr ) {
      
    if ( eqtb [114434L ].cint > 0 ) 
    {
      while ( ( inputstack [baseptr ].statefield == 0 ) || ( inputstack [
      baseptr ].indexfield > i ) ) decr ( baseptr ) ;
      if ( inputstack [baseptr ].namefield > 17 ) 
      w = true ;
    } 
    ifstack [i ]= mem [condptr ].hh .v.RH ;
    decr ( i ) ;
  } 
  if ( w ) 
  {
    printnl ( 1623 ) ;
    printcmdchr ( 123 , curif ) ;
    if ( ifline != 0 ) 
    {
      print ( 1595 ) ;
      printint ( ifline ) ;
    } 
    print ( 1624 ) ;
    println () ;
    if ( eqtb [114434L ].cint > 1 ) 
    showcontext () ;
    if ( history == 0 ) 
    history = 1 ;
  } 
} 
void 
filewarning ( void ) 
{
  filewarning_regmem 
  halfword p  ;
  quarterword l  ;
  quarterword c  ;
  integer i  ;
  p = saveptr ;
  l = curlevel ;
  c = curgroup ;
  saveptr = curboundary ;
  while ( grpstack [inopen ]!= saveptr ) {
      
    decr ( curlevel ) ;
    printnl ( 1625 ) ;
    printgroup ( true ) ;
    print ( 1626 ) ;
    curgroup = savestack [saveptr ].hh.b1 ;
    saveptr = savestack [saveptr ].hh .v.RH ;
  } 
  saveptr = p ;
  curlevel = l ;
  curgroup = c ;
  p = condptr ;
  l = iflimit ;
  c = curif ;
  i = ifline ;
  while ( ifstack [inopen ]!= condptr ) {
      
    printnl ( 1625 ) ;
    printcmdchr ( 123 , curif ) ;
    if ( iflimit == 2 ) 
    printesc ( 934 ) ;
    if ( ifline != 0 ) 
    {
      print ( 1595 ) ;
      printint ( ifline ) ;
    } 
    print ( 1626 ) ;
    ifline = mem [condptr + 1 ].cint ;
    curif = mem [condptr ].hh.b1 ;
    iflimit = mem [condptr ].hh.b0 ;
    condptr = mem [condptr ].hh .v.RH ;
  } 
  condptr = p ;
  iflimit = l ;
  curif = c ;
  ifline = i ;
  println () ;
  if ( eqtb [114434L ].cint > 1 ) 
  showcontext () ;
  if ( history == 0 ) 
  history = 1 ;
} 
void 
zdeletesaref ( halfword q ) 
{
  /* 10 */ deletesaref_regmem 
  halfword p  ;
  smallnumber i  ;
  smallnumber s  ;
  decr ( mem [q + 1 ].hh .v.LH ) ;
  if ( mem [q + 1 ].hh .v.LH != -1073741823L ) 
  return ;
  if ( mem [q ].hh.b0 < 32 ) {
      
    if ( mem [q + 2 ].cint == 0 ) 
    s = 3 ;
    else return ;
  } 
  else {
      
    if ( mem [q ].hh.b0 < 64 ) {
	
      if ( mem [q + 1 ].hh .v.RH == membot ) 
      deleteglueref ( membot ) ;
      else return ;
    } 
    else if ( mem [q + 1 ].hh .v.RH != -1073741823L ) 
    return ;
    s = 2 ;
  } 
  do {
      i = mem [q ].hh.b0 % 16 ;
    p = q ;
    q = mem [p ].hh .v.RH ;
    freenode ( p , s ) ;
    if ( q == -1073741823L ) 
    {
      saroot [i ]= -1073741823L ;
      return ;
    } 
    {
      if ( odd ( i ) ) 
      mem [q + ( i / 2 ) + 1 ].hh .v.RH = -1073741823L ;
      else mem [q + ( i / 2 ) + 1 ].hh .v.LH = -1073741823L ;
      decr ( mem [q ].hh.b1 ) ;
    } 
    s = 9 ;
  } while ( ! ( mem [q ].hh.b1 > 0 ) ) ;
} 
#ifdef STAT
void 
zshowsa ( halfword p , strnumber s ) 
{
  showsa_regmem 
  smallnumber t  ;
  begindiagnostic () ;
  printchar ( 123 ) ;
  print ( s ) ;
  printchar ( 32 ) ;
  if ( p == -1073741823L ) 
  printchar ( 63 ) ;
  else {
      
    t = ( mem [p ].hh.b0 / 16 ) ;
    if ( t < 4 ) 
    printcmdchr ( 104 , p ) ;
    else if ( t == 4 ) 
    {
      printesc ( 437 ) ;
      printsanum ( p ) ;
    } 
    else if ( t == 5 ) 
    printcmdchr ( 81 , p ) ;
    else printchar ( 63 ) ;
    printchar ( 61 ) ;
    if ( t == 0 ) 
    printint ( mem [p + 2 ].cint ) ;
    else if ( t == 1 ) 
    {
      printscaled ( mem [p + 2 ].cint ) ;
      print ( 425 ) ;
    } 
    else {
	
      p = mem [p + 1 ].hh .v.RH ;
      if ( t == 2 ) 
      printspec ( p , 425 ) ;
      else if ( t == 3 ) 
      printspec ( p , 348 ) ;
      else if ( t == 4 ) {
	  
	if ( p == -1073741823L ) 
	print ( 438 ) ;
	else {
	    
	  depththreshold = 0 ;
	  breadthmax = 1 ;
	  shownodelist ( p ) ;
	} 
      } 
      else if ( t == 5 ) 
      {
	if ( p != -1073741823L ) 
	showtokenlist ( mem [p ].hh .v.RH , -1073741823L , 32 ) ;
      } 
      else printchar ( 63 ) ;
    } 
  } 
  printchar ( 125 ) ;
  enddiagnostic ( false ) ;
} 
#endif /* STAT */
void 
zsasave ( halfword p ) 
{
  sasave_regmem 
  halfword q  ;
  quarterword i  ;
  if ( curlevel != salevel ) 
  {
    if ( saveptr > maxsavestack ) 
    {
      maxsavestack = saveptr ;
      if ( maxsavestack > savesize - 7 ) 
      overflow ( 626 , savesize ) ;
    } 
    savestack [saveptr ].hh.b0 = 4 ;
    savestack [saveptr ].hh.b1 = salevel ;
    savestack [saveptr ].hh .v.RH = sachain ;
    incr ( saveptr ) ;
    sachain = -1073741823L ;
    salevel = curlevel ;
  } 
  i = mem [p ].hh.b0 ;
  if ( i < 32 ) 
  {
    if ( mem [p + 2 ].cint == 0 ) 
    {
      q = getnode ( 2 ) ;
      i = 96 ;
    } 
    else {
	
      q = getnode ( 3 ) ;
      mem [q + 2 ].cint = mem [p + 2 ].cint ;
    } 
    mem [q + 1 ].hh .v.RH = -1073741823L ;
  } 
  else {
      
    q = getnode ( 2 ) ;
    mem [q + 1 ].hh .v.RH = mem [p + 1 ].hh .v.RH ;
  } 
  mem [q + 1 ].hh .v.LH = p ;
  mem [q ].hh.b0 = i ;
  mem [q ].hh.b1 = mem [p ].hh.b1 ;
  mem [q ].hh .v.RH = sachain ;
  sachain = q ;
  incr ( mem [p + 1 ].hh .v.LH ) ;
} 
void 
zsadestroy ( halfword p ) 
{
  sadestroy_regmem 
  if ( mem [p ].hh.b0 < 64 ) 
  deleteglueref ( mem [p + 1 ].hh .v.RH ) ;
  else if ( mem [p + 1 ].hh .v.RH != -1073741823L ) {
      
    if ( mem [p ].hh.b0 < 80 ) 
    flushnodelist ( mem [p + 1 ].hh .v.RH ) ;
    else deletetokenref ( mem [p + 1 ].hh .v.RH ) ;
  } 
} 
void 
zsadef ( halfword p , halfword e ) 
{
  sadef_regmem 
  incr ( mem [p + 1 ].hh .v.LH ) ;
  if ( mem [p + 1 ].hh .v.RH == e ) 
  {
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    showsa ( p , 628 ) ;
#endif /* STAT */
    sadestroy ( p ) ;
  } 
  else {
      
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    showsa ( p , 629 ) ;
#endif /* STAT */
    if ( mem [p ].hh.b1 == curlevel ) 
    sadestroy ( p ) ;
    else sasave ( p ) ;
    mem [p ].hh.b1 = curlevel ;
    mem [p + 1 ].hh .v.RH = e ;
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    showsa ( p , 630 ) ;
#endif /* STAT */
  } 
  deletesaref ( p ) ;
} 
void 
zsawdef ( halfword p , integer w ) 
{
  sawdef_regmem 
  incr ( mem [p + 1 ].hh .v.LH ) ;
  if ( mem [p + 2 ].cint == w ) 
  {
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    showsa ( p , 628 ) ;
#endif /* STAT */
  } 
  else {
      
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    showsa ( p , 629 ) ;
#endif /* STAT */
    if ( mem [p ].hh.b1 != curlevel ) 
    sasave ( p ) ;
    mem [p ].hh.b1 = curlevel ;
    mem [p + 2 ].cint = w ;
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    showsa ( p , 630 ) ;
#endif /* STAT */
  } 
  deletesaref ( p ) ;
} 
void 
zgsadef ( halfword p , halfword e ) 
{
  gsadef_regmem 
  incr ( mem [p + 1 ].hh .v.LH ) ;
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  showsa ( p , 631 ) ;
#endif /* STAT */
  sadestroy ( p ) ;
  mem [p ].hh.b1 = 1 ;
  mem [p + 1 ].hh .v.RH = e ;
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  showsa ( p , 630 ) ;
#endif /* STAT */
  deletesaref ( p ) ;
} 
void 
zgsawdef ( halfword p , integer w ) 
{
  gsawdef_regmem 
  incr ( mem [p + 1 ].hh .v.LH ) ;
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  showsa ( p , 631 ) ;
#endif /* STAT */
  mem [p ].hh.b1 = 1 ;
  mem [p + 2 ].cint = w ;
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  showsa ( p , 630 ) ;
#endif /* STAT */
  deletesaref ( p ) ;
} 
void 
sarestore ( void ) 
{
  sarestore_regmem 
  halfword p  ;
  do {
      p = mem [sachain + 1 ].hh .v.LH ;
    if ( mem [p ].hh.b1 == 1 ) 
    {
      if ( mem [p ].hh.b0 >= 32 ) 
      sadestroy ( sachain ) ;
	;
#ifdef STAT
      if ( eqtb [114398L ].cint > 0 ) 
      showsa ( p , 633 ) ;
#endif /* STAT */
    } 
    else {
	
      if ( mem [p ].hh.b0 < 32 ) {
	  
	if ( mem [sachain ].hh.b0 < 32 ) 
	mem [p + 2 ].cint = mem [sachain + 2 ].cint ;
	else mem [p + 2 ].cint = 0 ;
      } 
      else {
	  
	sadestroy ( p ) ;
	mem [p + 1 ].hh .v.RH = mem [sachain + 1 ].hh .v.RH ;
      } 
      mem [p ].hh.b1 = mem [sachain ].hh.b1 ;
	;
#ifdef STAT
      if ( eqtb [114398L ].cint > 0 ) 
      showsa ( p , 634 ) ;
#endif /* STAT */
    } 
    deletesaref ( p ) ;
    p = sachain ;
    sachain = mem [p ].hh .v.RH ;
    if ( mem [p ].hh.b0 < 32 ) 
    freenode ( p , 3 ) ;
    else freenode ( p , 2 ) ;
  } while ( ! ( sachain == -1073741823L ) ) ;
} 
void 
znewsavelevel ( groupcode c ) 
{
  newsavelevel_regmem 
  if ( saveptr > maxsavestack ) 
  {
    maxsavestack = saveptr ;
    if ( maxsavestack > savesize - 7 ) 
    overflow ( 626 , savesize ) ;
  } 
  if ( ( eTeXmode == 1 ) ) 
  {
    savestack [saveptr + 0 ].cint = line ;
    incr ( saveptr ) ;
  } 
  savestack [saveptr ].hh.b0 = 3 ;
  savestack [saveptr ].hh.b1 = curgroup ;
  savestack [saveptr ].hh .v.RH = curboundary ;
  if ( curlevel == 65535L ) 
  overflow ( 627 , 65535L ) ;
  curboundary = saveptr ;
  curgroup = c ;
	;
#ifdef STAT
  if ( eqtb [114431L ].cint > 0 ) 
  grouptrace ( false ) ;
#endif /* STAT */
  incr ( curlevel ) ;
  incr ( saveptr ) ;
} 
void 
zeqdestroy ( memoryword w ) 
{
  eqdestroy_regmem 
  halfword q  ;
  switch ( w .hh.b0 ) 
  {case 129 : 
  case 130 : 
  case 131 : 
  case 132 : 
    deletetokenref ( w .hh .v.RH ) ;
    break ;
  case 135 : 
    deleteglueref ( w .hh .v.RH ) ;
    break ;
  case 136 : 
    {
      q = w .hh .v.RH ;
      if ( q != -1073741823L ) 
      freenode ( q , mem [q ].hh .v.LH + mem [q ].hh .v.LH + 1 ) ;
    } 
    break ;
  case 137 : 
    flushnodelist ( w .hh .v.RH ) ;
    break ;
  case 81 : 
  case 104 : 
    if ( ( w .hh .v.RH < membot ) || ( w .hh .v.RH > membot + 23 ) ) 
    deletesaref ( w .hh .v.RH ) ;
    break ;
    default: 
    ;
    break ;
  } 
} 
void 
zeqsave ( halfword p , quarterword l ) 
{
  eqsave_regmem 
  if ( saveptr > maxsavestack ) 
  {
    maxsavestack = saveptr ;
    if ( maxsavestack > savesize - 7 ) 
    overflow ( 626 , savesize ) ;
  } 
  if ( l == 0 ) 
  savestack [saveptr ].hh.b0 = 1 ;
  else {
      
    savestack [saveptr ]= eqtb [p ];
    incr ( saveptr ) ;
    savestack [saveptr ].hh.b0 = 0 ;
  } 
  savestack [saveptr ].hh.b1 = l ;
  savestack [saveptr ].hh .v.RH = p ;
  incr ( saveptr ) ;
} 
void 
zeqdefine ( halfword p , quarterword t , halfword e ) 
{
  /* 10 */ eqdefine_regmem 
  if ( ( eTeXmode == 1 ) && ( eqtb [p ].hh.b0 == t ) && ( eqtb [p ].hh 
  .v.RH == e ) ) 
  {
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    restoretrace ( p , 628 ) ;
#endif /* STAT */
    eqdestroy ( eqtb [p ]) ;
    return ;
  } 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 629 ) ;
#endif /* STAT */
  if ( eqtb [p ].hh.b1 == curlevel ) 
  eqdestroy ( eqtb [p ]) ;
  else if ( curlevel > 1 ) 
  eqsave ( p , eqtb [p ].hh.b1 ) ;
  eqtb [p ].hh.b1 = curlevel ;
  eqtb [p ].hh.b0 = t ;
  eqtb [p ].hh .v.RH = e ;
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 630 ) ;
#endif /* STAT */
} 
void 
zeqworddefine ( halfword p , integer w ) 
{
  /* 10 */ eqworddefine_regmem 
  if ( ( eTeXmode == 1 ) && ( eqtb [p ].cint == w ) ) 
  {
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    restoretrace ( p , 628 ) ;
#endif /* STAT */
    return ;
  } 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 629 ) ;
#endif /* STAT */
  if ( xeqlevel [p ]!= curlevel ) 
  {
    eqsave ( p , xeqlevel [p ]) ;
    xeqlevel [p ]= curlevel ;
  } 
  eqtb [p ].cint = w ;
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 630 ) ;
#endif /* STAT */
} 
void 
zdeleqworddefine ( halfword p , integer w , integer wone ) 
{
  /* 10 */ deleqworddefine_regmem 
  if ( ( eTeXmode == 1 ) && ( eqtb [p ].cint == w ) && ( getintone ( eqtb [
  p ]) == wone ) ) 
  {
	;
#ifdef STAT
    if ( eqtb [114430L ].cint > 0 ) 
    restoretrace ( p , 628 ) ;
#endif /* STAT */
    return ;
  } 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 629 ) ;
#endif /* STAT */
  if ( xeqlevel [p ]!= curlevel ) 
  {
    eqsave ( p , xeqlevel [p ]) ;
    xeqlevel [p ]= curlevel ;
  } 
  eqtb [p ].cint = w ;
  setintone ( eqtb [p ], wone ) ;
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 630 ) ;
#endif /* STAT */
} 
void 
zgeqdefine ( halfword p , quarterword t , halfword e ) 
{
  geqdefine_regmem 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 631 ) ;
#endif /* STAT */
  {
    eqdestroy ( eqtb [p ]) ;
    eqtb [p ].hh.b1 = 1 ;
    eqtb [p ].hh.b0 = t ;
    eqtb [p ].hh .v.RH = e ;
  } 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 630 ) ;
#endif /* STAT */
} 
void 
zgeqworddefine ( halfword p , integer w ) 
{
  geqworddefine_regmem 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 631 ) ;
#endif /* STAT */
  {
    eqtb [p ].cint = w ;
    xeqlevel [p ]= 1 ;
  } 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 630 ) ;
#endif /* STAT */
} 
void 
zdelgeqworddefine ( halfword p , integer w , integer wone ) 
{
  delgeqworddefine_regmem 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 631 ) ;
#endif /* STAT */
  {
    eqtb [p ].cint = w ;
    setintone ( eqtb [p ], wone ) ;
    xeqlevel [p ]= 1 ;
  } 
	;
#ifdef STAT
  if ( eqtb [114430L ].cint > 0 ) 
  restoretrace ( p , 630 ) ;
#endif /* STAT */
} 
void 
zsaveforafter ( halfword t ) 
{
  saveforafter_regmem 
  if ( curlevel > 1 ) 
  {
    if ( saveptr > maxsavestack ) 
    {
      maxsavestack = saveptr ;
      if ( maxsavestack > savesize - 7 ) 
      overflow ( 626 , savesize ) ;
    } 
    savestack [saveptr ].hh.b0 = 2 ;
    savestack [saveptr ].hh.b1 = 0 ;
    savestack [saveptr ].hh .v.RH = t ;
    incr ( saveptr ) ;
  } 
} 
void 
unsave ( void ) 
{
  /* 30 */ unsave_regmem 
  halfword p  ;
  quarterword l  ;
  halfword t  ;
  boolean a  ;
  a = false ;
  if ( curlevel > 1 ) 
  {
    decr ( curlevel ) ;
    while ( true ) {
	
      decr ( saveptr ) ;
      if ( savestack [saveptr ].hh.b0 == 3 ) 
      goto lab30 ;
      p = savestack [saveptr ].hh .v.RH ;
      if ( savestack [saveptr ].hh.b0 == 2 ) 
      {
	t = curtok ;
	curtok = p ;
	if ( a ) 
	{
	  p = getavail () ;
	  mem [p ].hh .v.LH = curtok ;
	  mem [p ].hh .v.RH = curinput .locfield ;
	  curinput .locfield = p ;
	  curinput .startfield = p ;
	  if ( curtok < 196608L ) {
	      
	    if ( curtok < 131072L ) 
	    decr ( alignstate ) ;
	    else incr ( alignstate ) ;
	  } 
	} 
	else {
	    
	  backinput () ;
	  a = ( eTeXmode == 1 ) ;
	} 
	curtok = t ;
      } 
      else if ( savestack [saveptr ].hh.b0 == 4 ) 
      {
	sarestore () ;
	sachain = p ;
	salevel = savestack [saveptr ].hh.b1 ;
      } 
      else {
	  
	if ( savestack [saveptr ].hh.b0 == 0 ) 
	{
	  l = savestack [saveptr ].hh.b1 ;
	  decr ( saveptr ) ;
	} 
	else savestack [saveptr ]= eqtb [49924L ];
	if ( ( p < 114361L ) || ( p > 116261L ) ) {
	    
	  if ( eqtb [p ].hh.b1 == 1 ) 
	  {
	    eqdestroy ( savestack [saveptr ]) ;
	;
#ifdef STAT
	    if ( eqtb [114398L ].cint > 0 ) 
	    restoretrace ( p , 633 ) ;
#endif /* STAT */
	  } 
	  else {
	      
	    eqdestroy ( eqtb [p ]) ;
	    eqtb [p ]= savestack [saveptr ];
	;
#ifdef STAT
	    if ( eqtb [114398L ].cint > 0 ) 
	    restoretrace ( p , 634 ) ;
#endif /* STAT */
	  } 
	} 
	else if ( xeqlevel [p ]!= 1 ) 
	{
	  eqtb [p ]= savestack [saveptr ];
	  xeqlevel [p ]= l ;
	;
#ifdef STAT
	  if ( eqtb [114398L ].cint > 0 ) 
	  restoretrace ( p , 634 ) ;
#endif /* STAT */
	} 
	else {
	    
	;
#ifdef STAT
	  if ( eqtb [114398L ].cint > 0 ) 
	  restoretrace ( p , 633 ) ;
#endif /* STAT */
	} 
      } 
    } 
    lab30: 
	;
#ifdef STAT
    if ( eqtb [114431L ].cint > 0 ) 
    grouptrace ( true ) ;
#endif /* STAT */
    if ( grpstack [inopen ]== curboundary ) 
    groupwarning () ;
    curgroup = savestack [saveptr ].hh.b1 ;
    curboundary = savestack [saveptr ].hh .v.RH ;
    if ( ( eTeXmode == 1 ) ) 
    decr ( saveptr ) ;
  } 
  else confusion ( 632 ) ;
} 
void 
preparemag ( void ) 
{
  preparemag_regmem 
  if ( ( magset > 0 ) && ( eqtb [114378L ].cint != magset ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 636 ) ;
    } 
    printint ( eqtb [114378L ].cint ) ;
    print ( 637 ) ;
    printnl ( 638 ) ;
    {
      helpptr = 2 ;
      helpline [1 ]= 639 ;
      helpline [0 ]= 640 ;
    } 
    interror ( magset ) ;
    geqworddefine ( 114378L , magset ) ;
  } 
  if ( ( eqtb [114378L ].cint <= 0 ) || ( eqtb [114378L ].cint > 32768L ) 
  ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 641 ) ;
    } 
    {
      helpptr = 1 ;
      helpline [0 ]= 642 ;
    } 
    interror ( eqtb [114378L ].cint ) ;
    geqworddefine ( 114378L , 1000 ) ;
  } 
  magset = eqtb [114378L ].cint ;
} 
void 
ztokenshow ( halfword p ) 
{
  tokenshow_regmem 
  if ( p != -1073741823L ) 
  showtokenlist ( mem [p ].hh .v.RH , -1073741823L , 10000000L ) ;
} 
void 
printmeaning ( void ) 
{
  printmeaning_regmem 
  printcmdchr ( curcmd , curchr ) ;
  if ( curcmd >= 129 ) 
  {
    printchar ( 58 ) ;
    println () ;
    tokenshow ( curchr ) ;
  } 
  else if ( ( curcmd == 128 ) && ( curchr < 5 ) ) 
  {
    printchar ( 58 ) ;
    println () ;
    tokenshow ( curmark [curchr ]) ;
  } 
} 
void 
showcurcmdchr ( void ) 
{
  showcurcmdchr_regmem 
  integer n  ;
  integer l  ;
  halfword p  ;
  begindiagnostic () ;
  printnl ( 123 ) ;
  if ( curlist .modefield != shownmode ) 
  {
    printmode ( curlist .modefield ) ;
    print ( 657 ) ;
    shownmode = curlist .modefield ;
  } 
  printcmdchr ( curcmd , curchr ) ;
  if ( eqtb [114432L ].cint > 0 ) {
      
    if ( curcmd >= 123 ) {
	
      if ( curcmd <= 124 ) 
      {
	print ( 657 ) ;
	if ( curcmd == 124 ) 
	{
	  printcmdchr ( 123 , curif ) ;
	  printchar ( 32 ) ;
	  n = 0 ;
	  l = ifline ;
	} 
	else {
	    
	  n = 1 ;
	  l = line ;
	} 
	p = condptr ;
	while ( p != -1073741823L ) {
	    
	  incr ( n ) ;
	  p = mem [p ].hh .v.RH ;
	} 
	print ( 658 ) ;
	printint ( n ) ;
	printchar ( 41 ) ;
	if ( l != 0 ) 
	{
	  print ( 1595 ) ;
	  printint ( l ) ;
	} 
      } 
    } 
  } 
  printchar ( 125 ) ;
  enddiagnostic ( false ) ;
} 
void 
showcontext ( void ) 
{
  /* 30 31 */ showcontext_regmem 
  unsigned char oldsetting  ;
  halfword s  ;
  integer nn  ;
  boolean bottomline  ;
  integer i  ;
  integer j  ;
  integer l  ;
  integer m  ;
  integer n  ;
  integer p  ;
  integer q  ;
  baseptr = inputptr ;
  inputstack [baseptr ]= curinput ;
  nn = -1 ;
  bottomline = false ;
  while ( true ) {
      
    curinput = inputstack [baseptr ];
    if ( ( curinput .statefield != 0 ) ) {
	
      if ( ( curinput .namefield > 19 ) || ( baseptr == 0 ) ) 
      bottomline = true ;
    } 
    if ( ( baseptr == inputptr ) || bottomline || ( nn < eqtb [114416L ]
    .cint ) ) 
    {
      if ( ( baseptr == inputptr ) || ( curinput .statefield != 0 ) || ( 
      curinput .indexfield != 3 ) || ( curinput .locfield != -1073741823L ) ) 
      {
	tally = 0 ;
	oldsetting = selector ;
	if ( curinput .statefield != 0 ) 
	{
	  if ( curinput .namefield <= 17 ) {
	      
	    if ( ( curinput .namefield == 0 ) ) {
		
	      if ( baseptr == 0 ) 
	      printnl ( 663 ) ;
	      else printnl ( 664 ) ;
	    } 
	    else {
		
	      printnl ( 665 ) ;
	      if ( curinput .namefield == 17 ) 
	      printchar ( 42 ) ;
	      else printint ( curinput .namefield - 1 ) ;
	      printchar ( 62 ) ;
	    } 
	  } 
	  else {
	      
	    printnl ( 666 ) ;
	    if ( curinput .indexfield == inopen ) 
	    printint ( line ) ;
	    else printint ( linestack [curinput .indexfield + 1 ]) ;
	  } 
	  printchar ( 32 ) ;
	  {
	    l = tally ;
	    tally = 0 ;
	    selector = 20 ;
	    kcodepos = 0 ;
	    trickcount = 1000000L ;
	  } 
	  if ( buffer [curinput .limitfield ]== eqtb [114410L ].cint ) 
	  j = curinput .limitfield ;
	  else j = curinput .limitfield + 1 ;
	  if ( j > 0 ) 
	  {
	    i = curinput .startfield ;
	    if ( ( curinput .locfield <= j - 1 ) && ( curinput .startfield <= 
	    curinput .locfield ) ) 
	    {
	      {register integer for_end; i = curinput .startfield ;for_end = 
	      curinput .locfield - 1 ; if ( i <= for_end) do 
		if ( buffer2 [i ]> 0 ) 
		printchar ( 256 * buffer2 [i ]+ buffer [i ]) ;
		else print ( buffer [i ]) ;
	      while ( i++ < for_end ) ;} 
	      {
		firstcount = tally ;
		kcp = trickbuf2 [( firstcount - 1 ) % errorline ];
		if ( ( firstcount > 0 ) && ( kcp > 0 ) ) 
		firstcount = firstcount + nrestmultichr ( kcp ) ;
		trickcount = firstcount + 1 + errorline - halferrorline ;
		if ( trickcount < errorline ) 
		trickcount = errorline ;
	      } 
	      printunreadbufferwithptenc ( curinput .locfield , j ) ;
	    } 
	    else {
		register integer for_end; i = curinput .startfield ;
	    for_end = j - 1 ; if ( i <= for_end) do 
	      if ( buffer2 [i ]> 0 ) 
	      printchar ( 256 * buffer2 [i ]+ buffer [i ]) ;
	      else print ( buffer [i ]) ;
	    while ( i++ < for_end ) ;} 
	  } 
	} 
	else {
	    
	  switch ( curinput .indexfield ) 
	  {case 0 : 
	    printnl ( 667 ) ;
	    break ;
	  case 1 : 
	  case 2 : 
	    printnl ( 668 ) ;
	    break ;
	  case 3 : 
	    if ( curinput .locfield == -1073741823L ) 
	    printnl ( 669 ) ;
	    else printnl ( 670 ) ;
	    break ;
	  case 4 : 
	    printnl ( 671 ) ;
	    break ;
	  case 5 : 
	    {
	      println () ;
	      printcs ( curinput .namefield ) ;
	    } 
	    break ;
	  case 6 : 
	    printnl ( 672 ) ;
	    break ;
	  case 7 : 
	    printnl ( 673 ) ;
	    break ;
	  case 8 : 
	    printnl ( 674 ) ;
	    break ;
	  case 9 : 
	    printnl ( 675 ) ;
	    break ;
	  case 10 : 
	    printnl ( 676 ) ;
	    break ;
	  case 11 : 
	    printnl ( 677 ) ;
	    break ;
	  case 12 : 
	    printnl ( 678 ) ;
	    break ;
	  case 13 : 
	    printnl ( 679 ) ;
	    break ;
	  case 14 : 
	    printnl ( 680 ) ;
	    break ;
	  case 15 : 
	    printnl ( 681 ) ;
	    break ;
	  case 16 : 
	    printnl ( 682 ) ;
	    break ;
	    default: 
	    printnl ( 63 ) ;
	    break ;
	  } 
	  {
	    l = tally ;
	    tally = 0 ;
	    selector = 20 ;
	    kcodepos = 0 ;
	    trickcount = 1000000L ;
	  } 
	  if ( curinput .indexfield < 5 ) 
	  {
	    if ( ( curinput .indexfield == 3 ) && ( curinput .locfield != 
	    -1073741823L ) ) 
	    {
	      if ( ( mem [curinput .startfield ].hh .v.RH == -1073741823L ) 
	      && ( checkkanji ( mem [curinput .startfield ].hh .v.LH ) ) ) 
	      {
		curinput = inputstack [baseptr - 1 ];
		s = getavail () ;
		mem [s ].hh .v.LH = ktokentochr ( mem [curinput .locfield ]
		.hh .v.LH ) ;
		curinput = inputstack [baseptr ];
		mem [curinput .startfield ].hh .v.RH = s ;
		showtokenlist ( curinput .startfield , curinput .locfield , 
		100000L ) ;
		{
		  mem [s ].hh .v.RH = avail ;
		  avail = s ;
	;
#ifdef STAT
		  decr ( dynused ) ;
#endif /* STAT */
		} 
		mem [curinput .startfield ].hh .v.RH = -1073741823L ;
		goto lab31 ;
	      } 
	    } 
	    showtokenlist ( curinput .startfield , curinput .locfield , 
	    100000L ) ;
	  } 
	  else showtokenlist ( mem [curinput .startfield ].hh .v.RH , 
	  curinput .locfield , 100000L ) ;
	  lab31: ;
	} 
	selector = oldsetting ;
	if ( trickcount == 1000000L ) 
	{
	  firstcount = tally ;
	  kcp = trickbuf2 [( firstcount - 1 ) % errorline ];
	  if ( ( firstcount > 0 ) && ( kcp > 0 ) ) 
	  firstcount = firstcount + nrestmultichr ( kcp ) ;
	  trickcount = firstcount + 1 + errorline - halferrorline ;
	  if ( trickcount < errorline ) 
	  trickcount = errorline ;
	} 
	if ( tally < trickcount ) 
	m = tally - firstcount ;
	else m = trickcount - firstcount ;
	if ( l + firstcount <= halferrorline ) 
	{
	  p = 0 ;
	  n = l + firstcount ;
	} 
	else {
	    
	  print ( 278 ) ;
	  p = l + firstcount - halferrorline + 3 ;
	  n = halferrorline ;
	} 
	kcp = trickbuf2 [p % errorline ];
	if ( ( kcp % 8 ) > 1 ) 
	{
	  p = p + nrestmultichr ( kcp ) + 1 ;
	  n = n - nrestmultichr ( kcp ) - 1 ;
	} 
	{register integer for_end; q = p ;for_end = firstcount - 1 ; if ( q 
	<= for_end) do 
	  printchar ( trickbuf [q % errorline ]) ;
	while ( q++ < for_end ) ;} 
	println () ;
	{register integer for_end; q = 1 ;for_end = n ; if ( q <= for_end) 
	do 
	  printchar ( 32 ) ;
	while ( q++ < for_end ) ;} 
	if ( m + n <= errorline ) 
	p = firstcount + m ;
	else p = firstcount + ( errorline - n - 3 ) ;
	kcp = trickbuf2 [( p - 1 ) % errorline ];
	if ( ( ( kcp % 8 ) > 0 ) && ( nrestmultichr ( kcp ) > 0 ) ) 
	p = p - ( kcp % 8 ) ;
	{register integer for_end; q = firstcount ;for_end = p - 1 ; if ( q 
	<= for_end) do 
	  printchar ( trickbuf [q % errorline ]) ;
	while ( q++ < for_end ) ;} 
	if ( m + n > errorline ) 
	print ( 278 ) ;
	incr ( nn ) ;
      } 
    } 
    else if ( nn == eqtb [114416L ].cint ) 
    {
      printnl ( 278 ) ;
      incr ( nn ) ;
    } 
    if ( bottomline ) 
    goto lab30 ;
    decr ( baseptr ) ;
  } 
  lab30: curinput = inputstack [inputptr ];
} 
void 
zbegintokenlist ( halfword p , quarterword t ) 
{
  begintokenlist_regmem 
  {
    if ( inputptr > maxinstack ) 
    {
      maxinstack = inputptr ;
      if ( inputptr == stacksize ) 
      overflow ( 683 , stacksize ) ;
    } 
    inputstack [inputptr ]= curinput ;
    incr ( inputptr ) ;
  } 
  curinput .statefield = 0 ;
  curinput .startfield = p ;
  curinput .indexfield = t ;
  if ( t >= 5 ) 
  {
    incr ( mem [p ].hh .v.LH ) ;
    if ( t == 5 ) 
    curinput .limitfield = paramptr ;
    else {
	
      curinput .locfield = mem [p ].hh .v.RH ;
      if ( eqtb [114391L ].cint > 1 ) 
      {
	begindiagnostic () ;
	printnl ( 349 ) ;
	switch ( t ) 
	{case 14 : 
	  printesc ( 366 ) ;
	  break ;
	case 16 : 
	  printesc ( 684 ) ;
	  break ;
	  default: 
	  printcmdchr ( 82 , t + 50453L ) ;
	  break ;
	} 
	print ( 644 ) ;
	tokenshow ( p ) ;
	enddiagnostic ( false ) ;
      } 
    } 
  } 
  else curinput .locfield = p ;
} 
void 
endtokenlist ( void ) 
{
  endtokenlist_regmem 
  if ( curinput .indexfield >= 3 ) 
  {
    if ( curinput .indexfield <= 4 ) 
    flushlist ( curinput .startfield ) ;
    else {
	
      deletetokenref ( curinput .startfield ) ;
      if ( curinput .indexfield == 5 ) 
      while ( paramptr > curinput .limitfield ) {
	  
	decr ( paramptr ) ;
	flushlist ( paramstack [paramptr ]) ;
      } 
      else if ( ( curinput .indexfield == 6 ) && ( ! outputcanend ) ) 
      fatalerror ( 685 ) ;
    } 
  } 
  else if ( curinput .indexfield == 1 ) {
      
    if ( alignstate > 500000L ) 
    alignstate = 0 ;
    else fatalerror ( 686 ) ;
  } 
  {
    decr ( inputptr ) ;
    curinput = inputstack [inputptr ];
  } 
  {
    if ( interrupt != 0 ) 
    pauseforinstructions () ;
  } 
} 
void 
backinput ( void ) 
{
  backinput_regmem 
  halfword p  ;
  while ( ( curinput .locfield == -1073741823L ) && ( curinput .indexfield != 
  2 ) && ( curinput .indexfield != 6 ) ) endtokenlist () ;
  p = getavail () ;
  mem [p ].hh .v.LH = curtok ;
  if ( curtok < 196608L ) {
      
    if ( curtok < 131072L ) 
    decr ( alignstate ) ;
    else incr ( alignstate ) ;
  } 
  {
    if ( inputptr > maxinstack ) 
    {
      maxinstack = inputptr ;
      if ( inputptr == stacksize ) 
      overflow ( 683 , stacksize ) ;
    } 
    inputstack [inputptr ]= curinput ;
    incr ( inputptr ) ;
  } 
  curinput .statefield = 0 ;
  curinput .startfield = p ;
  curinput .indexfield = 3 ;
  curinput .locfield = p ;
} 
void 
backerror ( void ) 
{
  backerror_regmem 
  OKtointerrupt = false ;
  backinput () ;
  OKtointerrupt = true ;
  error () ;
} 
void 
inserror ( void ) 
{
  inserror_regmem 
  OKtointerrupt = false ;
  backinput () ;
  curinput .indexfield = 4 ;
  OKtointerrupt = true ;
  error () ;
} 
void 
beginfilereading ( void ) 
{
  beginfilereading_regmem 
  if ( inopen == maxinopen ) 
  overflow ( 687 , maxinopen ) ;
  if ( first == bufsize ) 
  overflow ( 259 , bufsize ) ;
  incr ( inopen ) ;
  {
    if ( inputptr > maxinstack ) 
    {
      maxinstack = inputptr ;
      if ( inputptr == stacksize ) 
      overflow ( 683 , stacksize ) ;
    } 
    inputstack [inputptr ]= curinput ;
    incr ( inputptr ) ;
  } 
  curinput .indexfield = inopen ;
  sourcefilenamestack [curinput .indexfield ]= 0 ;
  fullsourcefilenamestack [curinput .indexfield ]= 0 ;
  eofseen [curinput .indexfield ]= false ;
  grpstack [curinput .indexfield ]= curboundary ;
  ifstack [curinput .indexfield ]= condptr ;
  linestack [curinput .indexfield ]= line ;
  curinput .startfield = first ;
  curinput .statefield = 1 ;
  curinput .namefield = 0 ;
  curinput .synctextagfield = 0 ;
} 
void 
endfilereading ( void ) 
{
  endfilereading_regmem 
  first = curinput .startfield ;
  line = linestack [curinput .indexfield ];
  if ( ( curinput .namefield == 18 ) || ( curinput .namefield == 19 ) ) 
  pseudoclose () ;
  else if ( curinput .namefield > 17 ) 
  aclose ( inputfile [curinput .indexfield ]) ;
  {
    decr ( inputptr ) ;
    curinput = inputstack [inputptr ];
  } 
  decr ( inopen ) ;
} 
void 
clearforerrorprompt ( void ) 
{
  clearforerrorprompt_regmem 
  while ( ( curinput .statefield != 0 ) && ( curinput .namefield == 0 ) && ( 
  inputptr > 0 ) && ( curinput .locfield > curinput .limitfield ) ) 
  endfilereading () ;
  println () ;
} 
void 
checkoutervalidity ( void ) 
{
  checkoutervalidity_regmem 
  halfword p  ;
  halfword q  ;
  if ( scannerstatus != 0 ) 
  {
    deletionsallowed = false ;
    if ( curcs != 0 ) 
    {
      if ( ( curinput .statefield == 0 ) || ( curinput .namefield < 1 ) || ( 
      curinput .namefield > 17 ) ) 
      {
	p = getavail () ;
	mem [p ].hh .v.LH = 536870911L + curcs ;
	begintokenlist ( p , 3 ) ;
      } 
      curcmd = 10 ;
      curchr = 32 ;
    } 
    if ( scannerstatus > 1 ) 
    {
      runaway () ;
      if ( curcs == 0 ) 
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 695 ) ;
      } 
      else {
	  
	curcs = 0 ;
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 696 ) ;
	} 
      } 
      p = getavail () ;
      switch ( scannerstatus ) 
      {case 2 : 
	{
	  print ( 702 ) ;
	  mem [p ].hh .v.LH = 131197L ;
	} 
	break ;
      case 3 : 
	{
	  print ( 703 ) ;
	  mem [p ].hh .v.LH = partoken ;
	  longstate = 131 ;
	} 
	break ;
      case 4 : 
	{
	  print ( 704 ) ;
	  mem [p ].hh .v.LH = 131197L ;
	  q = p ;
	  p = getavail () ;
	  mem [p ].hh .v.RH = q ;
	  mem [p ].hh .v.LH = 536909722L ;
	  alignstate = -1000000L ;
	} 
	break ;
      case 5 : 
	{
	  print ( 705 ) ;
	  mem [p ].hh .v.LH = 131197L ;
	} 
	break ;
      } 
      begintokenlist ( p , 4 ) ;
      print ( 697 ) ;
      sprintcs ( warningindex ) ;
      {
	helpptr = 4 ;
	helpline [3 ]= 698 ;
	helpline [2 ]= 699 ;
	helpline [1 ]= 700 ;
	helpline [0 ]= 701 ;
      } 
      error () ;
    } 
    else {
	
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 689 ) ;
      } 
      printcmdchr ( 123 , curif ) ;
      print ( 690 ) ;
      printint ( skipline ) ;
      {
	helpptr = 3 ;
	helpline [2 ]= 691 ;
	helpline [1 ]= 692 ;
	helpline [0 ]= 693 ;
      } 
      if ( curcs != 0 ) 
      curcs = 0 ;
      else helpline [2 ]= 694 ;
      curtok = 536909725L ;
      inserror () ;
    } 
    deletionsallowed = true ;
  } 
} 
void 
getnext ( void ) 
{
  /* 20 25 21 26 40 10 */ getnext_regmem 
  integer k  ;
  halfword t  ;
  unsigned char cat  ;
  integer l  ;
  ASCIIcode c, cc, cd, ce  ;
  unsigned char d  ;
  lab20: curcs = 0 ;
  if ( curinput .statefield != 0 ) 
  {
    lab25: if ( curinput .locfield <= curinput .limitfield ) 
    {
      curchr = fromBUFF ( ustringcast ( buffer ) , curinput .limitfield + 1 , 
      curinput .locfield ) ;
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
      if ( ( multistrlen ( ustringcast ( buffer ) , curinput .limitfield + 1 , 
      curinput .locfield ) > 1 ) && checkkcatcode ( curcmd , curchr ) ) 
      {
	if ( ( curcmd == 14 ) ) 
	curcmd = eqtb [51759L + curchr ].hh .v.RH ;
	if ( ( curcmd == 15 ) ) 
	curcmd = 18 ;
	{register integer for_end; l = curinput .locfield ;for_end = 
	curinput .locfield - 1 + multistrlen ( ustringcast ( buffer ) , 
	curinput .limitfield + 1 , curinput .locfield ) ; if ( l <= for_end) 
	do 
	  buffer2 [l ]= 1 ;
	while ( l++ < for_end ) ;} 
	curinput .locfield = curinput .locfield + multistrlen ( ustringcast ( 
	buffer ) , curinput .limitfield + 1 , curinput .locfield ) ;
      } 
      else {
	  
	curchr = buffer [curinput .locfield ];
	incr ( curinput .locfield ) ;
	lab21: curcmd = eqtb [51759L + curchr ].hh .v.RH ;
      } 
      switch ( curinput .statefield + curcmd ) 
      {case 10 : 
      case 31 : 
      case 52 : 
      case 73 : 
      case 94 : 
      case 53 : 
      case 74 : 
      case 95 : 
	goto lab25 ;
	break ;
      case 1 : 
      case 22 : 
      case 43 : 
      case 64 : 
      case 85 : 
	{
	  if ( curinput .locfield > curinput .limitfield ) 
	  curcs = 23809 ;
	  else {
	      
	    k = curinput .locfield ;
	    curchr = fromBUFF ( ustringcast ( buffer ) , curinput .limitfield 
	    + 1 , k ) ;
	    cat = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
	    if ( ( multistrlen ( ustringcast ( buffer ) , curinput .limitfield 
	    + 1 , k ) > 1 ) && checkkcatcode ( cat , curchr ) ) 
	    {
	      if ( ( cat == 14 ) || ( cat == 15 ) ) 
	      cat = 18 ;
	      {register integer for_end; l = k ;for_end = k - 1 + 
	      multistrlen ( ustringcast ( buffer ) , curinput .limitfield + 1 
	      , k ) ; if ( l <= for_end) do 
		buffer2 [l ]= 1 ;
	      while ( l++ < for_end ) ;} 
	      k = k + multistrlen ( ustringcast ( buffer ) , curinput 
	      .limitfield + 1 , k ) ;
	    } 
	    else {
		
	      curchr = buffer [k ];
	      cat = eqtb [51759L + curchr ].hh .v.RH ;
	      incr ( k ) ;
	    } 
	    lab26: if ( ( cat == 11 ) || ( cat == 19 ) ) 
	    curinput .statefield = 43 ;
	    else if ( ( cat == 16 ) || ( cat == 17 ) ) 
	    {
	      if ( ( eqtb [114421L ].cint % 2 ) == 0 ) 
	      curinput .statefield = 64 ;
	      else curinput .statefield = 43 ;
	    } 
	    else if ( cat == 10 ) 
	    curinput .statefield = 43 ;
	    else if ( cat == 18 ) 
	    {
	      if ( ( ( eqtb [114421L ].cint / 2 ) % 2 ) == 0 ) 
	      curinput .statefield = 22 ;
	      else curinput .statefield = 1 ;
	    } 
	    else curinput .statefield = 1 ;
	    if ( cat == 18 ) 
	    {
	      curcs = idlookup ( curinput .locfield , k - curinput .locfield ) 
	      ;
	      curinput .locfield = k ;
	      goto lab40 ;
	    } 
	    else if ( ( ( cat == 11 ) || ( cat == 16 ) || ( cat == 17 ) || ( 
	    cat == 19 ) || ( cat == 20 ) ) && ( k <= curinput .limitfield ) ) 
	    {
	      do {
		  curchr = fromBUFF ( ustringcast ( buffer ) , curinput 
		.limitfield + 1 , k ) ;
		cat = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
		if ( ( multistrlen ( ustringcast ( buffer ) , curinput 
		.limitfield + 1 , k ) > 1 ) && checkkcatcode ( cat , curchr ) 
		) 
		{
		  if ( ( cat == 14 ) ) 
		  cat = eqtb [51759L + curchr ].hh .v.RH ;
		  if ( ( cat == 15 ) ) 
		  cat = 18 ;
		  {register integer for_end; l = k ;for_end = k - 1 + 
		  multistrlen ( ustringcast ( buffer ) , curinput .limitfield 
		  + 1 , k ) ; if ( l <= for_end) do 
		    buffer2 [l ]= 1 ;
		  while ( l++ < for_end ) ;} 
		  k = k + multistrlen ( ustringcast ( buffer ) , curinput 
		  .limitfield + 1 , k ) ;
		  if ( ( cat == 16 ) || ( cat == 17 ) ) 
		  {
		    if ( ( eqtb [114421L ].cint % 2 ) == 0 ) 
		    curinput .statefield = 64 ;
		    else curinput .statefield = 43 ;
		  } 
		  else if ( cat == 19 ) 
		  curinput .statefield = 43 ;
		} 
		else {
		    
		  curchr = buffer [k ];
		  cat = eqtb [51759L + curchr ].hh .v.RH ;
		  incr ( k ) ;
		} 
		while ( ( buffer [k ]== curchr ) && ( cat == 7 ) && ( k < 
		curinput .limitfield ) ) {
		    
		  c = buffer [k + 1 ];
		  if ( c < 128 ) 
		  {
		    d = 2 ;
		    if ( ( ( ( c >= 48 ) && ( c <= 57 ) ) || ( ( c >= 97 ) && 
		    ( c <= 102 ) ) ) ) {
			
		      if ( k + 2 <= curinput .limitfield ) 
		      {
			cc = buffer [k + 2 ];
			if ( ( ( ( cc >= 48 ) && ( cc <= 57 ) ) || ( ( cc >= 
			97 ) && ( cc <= 102 ) ) ) ) 
			incr ( d ) ;
		      } 
		    } 
		    if ( d > 2 ) 
		    {
		      if ( c <= 57 ) 
		      curchr = c - 48 ;
		      else curchr = c - 87 ;
		      if ( cc <= 57 ) 
		      curchr = 16 * curchr + cc - 48 ;
		      else curchr = 16 * curchr + cc - 87 ;
		    } 
		    else if ( c < 64 ) 
		    curchr = c + 64 ;
		    else curchr = c - 64 ;
		    cat = eqtb [51759L + curchr ].hh .v.RH ;
		    if ( ( cat == 11 ) || ( cat == 7 ) ) 
		    {
		      buffer [k - 1 ]= curchr ;
		      buffer2 [k - 1 ]= 0 ;
		      curinput .limitfield = curinput .limitfield - d ;
		      first = first - d ;
		      l = k ;
		      while ( l <= curinput .limitfield ) {
			  
			buffer [l ]= buffer [l + d ];
			buffer2 [l ]= buffer2 [l + d ];
			incr ( l ) ;
		      } 
		    } 
		  } 
		} 
		if ( cat == 11 ) 
		curinput .statefield = 43 ;
	      } while ( ! ( ! ( ( cat == 11 ) || ( cat == 16 ) || ( cat == 17 
	      ) || ( cat == 19 ) || ( cat == 20 ) ) || ( k > curinput 
	      .limitfield ) ) ) ;
	      if ( ! ( ( cat == 11 ) || ( cat == 16 ) || ( cat == 17 ) || ( 
	      cat == 19 ) || ( cat == 20 ) ) ) 
	      {
		if ( ( buffer2 [k - 1 ]) ) 
		k = k - multilenbuffchar ( curchr ) ;
		else decr ( k ) ;
	      } 
	      if ( k > curinput .locfield + 1 ) 
	      {
		curcs = idlookup ( curinput .locfield , k - curinput .locfield 
		) ;
		curinput .locfield = k ;
		goto lab40 ;
	      } 
	    } 
	    else {
		
	      if ( buffer [k ]== curchr ) {
		  
		if ( cat == 7 ) {
		    
		  if ( k < curinput .limitfield ) 
		  {
		    c = buffer [k + 1 ];
		    if ( c < 128 ) 
		    {
		      d = 2 ;
		      if ( ( ( ( c >= 48 ) && ( c <= 57 ) ) || ( ( c >= 97 ) 
		      && ( c <= 102 ) ) ) ) {
			  
			if ( k + 2 <= curinput .limitfield ) 
			{
			  cc = buffer [k + 2 ];
			  if ( ( ( ( cc >= 48 ) && ( cc <= 57 ) ) || ( ( cc >= 
			  97 ) && ( cc <= 102 ) ) ) ) 
			  incr ( d ) ;
			} 
		      } 
		      if ( d > 2 ) 
		      {
			if ( c <= 57 ) 
			curchr = c - 48 ;
			else curchr = c - 87 ;
			if ( cc <= 57 ) 
			curchr = 16 * curchr + cc - 48 ;
			else curchr = 16 * curchr + cc - 87 ;
			buffer [k - 1 ]= curchr ;
		      } 
		      else if ( c < 64 ) 
		      buffer [k - 1 ]= c + 64 ;
		      else buffer [k - 1 ]= c - 64 ;
		      buffer2 [k - 1 ]= 0 ;
		      curinput .limitfield = curinput .limitfield - d ;
		      first = first - d ;
		      l = k ;
		      curchr = buffer [k - 1 ];
		      cat = eqtb [51759L + curchr ].hh .v.RH ;
		      while ( l <= curinput .limitfield ) {
			  
			buffer [l ]= buffer [l + d ];
			buffer2 [l ]= buffer2 [l + d ];
			incr ( l ) ;
		      } 
		      goto lab26 ;
		    } 
		  } 
		} 
	      } 
	    } 
	    if ( ( cat == 16 ) || ( cat == 17 ) || ( cat == 19 ) || ( cat == 
	    20 ) ) 
	    {
	      curcs = idlookup ( curinput .locfield , k - curinput .locfield ) 
	      ;
	      curinput .locfield = k ;
	      goto lab40 ;
	    } 
	    else {
		
	      curcs = 11905 + buffer [curinput .locfield ];
	      incr ( curinput .locfield ) ;
	    } 
	  } 
	  lab40: curcmd = eqtb [curcs ].hh.b0 ;
	  curchr = eqtb [curcs ].hh .v.RH ;
	  if ( ( eqtb [114441L ].cint == 0 ) && ( curcmd >= 131 ) ) 
	  checkoutervalidity () ;
	} 
	break ;
      case 14 : 
      case 35 : 
      case 56 : 
      case 77 : 
      case 98 : 
	{
	  curcs = curchr + 1 ;
	  curcmd = eqtb [curcs ].hh.b0 ;
	  curchr = eqtb [curcs ].hh .v.RH ;
	  curinput .statefield = 1 ;
	  if ( ( eqtb [114441L ].cint == 0 ) && ( curcmd >= 131 ) ) 
	  checkoutervalidity () ;
	} 
	break ;
      case 8 : 
      case 29 : 
      case 50 : 
      case 71 : 
      case 92 : 
	{
	  if ( curchr == buffer [curinput .locfield ]) {
	      
	    if ( curinput .locfield < curinput .limitfield ) 
	    {
	      if ( ( isinternalUPTEX () ) && ( ( curinput .locfield + 6 ) <= 
	      curinput .limitfield ) && ( curchr == buffer [curinput 
	      .locfield + 1 ]) && ( curchr == buffer [curinput .locfield + 2 
	      ]) ) 
	      {
		c = buffer [curinput .locfield + 3 ];
		cc = buffer [curinput .locfield + 4 ];
		cd = buffer [curinput .locfield + 5 ];
		ce = buffer [curinput .locfield + 6 ];
		if ( ( ( ( c >= 48 ) && ( c <= 57 ) ) || ( ( c >= 97 ) && ( c 
		<= 102 ) ) ) && ( ( ( cc >= 48 ) && ( cc <= 57 ) ) || ( ( cc 
		>= 97 ) && ( cc <= 102 ) ) ) && ( ( ( cd >= 48 ) && ( cd <= 57 
		) ) || ( ( cd >= 97 ) && ( cd <= 102 ) ) ) && ( ( ( ce >= 48 ) 
		&& ( ce <= 57 ) ) || ( ( ce >= 97 ) && ( ce <= 102 ) ) ) ) 
		{
		  if ( c <= 57 ) 
		  curchr = c - 48 ;
		  else curchr = c - 87 ;
		  if ( cc <= 57 ) 
		  curchr = 16 * curchr + cc - 48 ;
		  else curchr = 16 * curchr + cc - 87 ;
		  if ( cd <= 57 ) 
		  curchr = 16 * curchr + cd - 48 ;
		  else curchr = 16 * curchr + cd - 87 ;
		  if ( ce <= 57 ) 
		  curchr = 16 * curchr + ce - 48 ;
		  else curchr = 16 * curchr + ce - 87 ;
		  if ( ( curchr < 11904 ) ) 
		  {
		    curinput .locfield = curinput .locfield + 7 ;
		    goto lab21 ;
		  } 
		} 
	      } 
	      c = buffer [curinput .locfield + 1 ];
	      if ( c < 128 ) 
	      {
		curinput .locfield = curinput .locfield + 2 ;
		if ( ( ( ( c >= 48 ) && ( c <= 57 ) ) || ( ( c >= 97 ) && ( c 
		<= 102 ) ) ) ) {
		    
		  if ( curinput .locfield <= curinput .limitfield ) 
		  {
		    cc = buffer [curinput .locfield ];
		    if ( ( ( ( cc >= 48 ) && ( cc <= 57 ) ) || ( ( cc >= 97 ) 
		    && ( cc <= 102 ) ) ) ) 
		    {
		      incr ( curinput .locfield ) ;
		      if ( c <= 57 ) 
		      curchr = c - 48 ;
		      else curchr = c - 87 ;
		      if ( cc <= 57 ) 
		      curchr = 16 * curchr + cc - 48 ;
		      else curchr = 16 * curchr + cc - 87 ;
		      goto lab21 ;
		    } 
		  } 
		} 
		if ( c < 64 ) 
		curchr = c + 64 ;
		else curchr = c - 64 ;
		goto lab21 ;
	      } 
	    } 
	  } 
	  curinput .statefield = 1 ;
	} 
	break ;
      case 16 : 
      case 37 : 
      case 58 : 
      case 79 : 
      case 100 : 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 706 ) ;
	  } 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 707 ;
	    helpline [0 ]= 708 ;
	  } 
	  deletionsallowed = false ;
	  error () ;
	  deletionsallowed = true ;
	  goto lab20 ;
	} 
	break ;
      case 32 : 
      case 11 : 
	{
	  curinput .statefield = 43 ;
	  curchr = 32 ;
	} 
	break ;
      case 6 : 
	{
	  curinput .locfield = curinput .limitfield + 1 ;
	  curcmd = 10 ;
	  curchr = 32 ;
	} 
	break ;
      case 27 : 
	if ( skipmode ) 
	{
	  curinput .locfield = curinput .limitfield + 1 ;
	  goto lab25 ;
	} 
	else {
	    
	  curinput .locfield = curinput .limitfield + 1 ;
	  curcmd = 10 ;
	  curchr = 32 ;
	} 
	break ;
      case 48 : 
      case 69 : 
      case 15 : 
      case 36 : 
      case 57 : 
      case 78 : 
      case 99 : 
	{
	  curinput .locfield = curinput .limitfield + 1 ;
	  goto lab25 ;
	} 
	break ;
      case 90 : 
	{
	  curinput .locfield = curinput .limitfield + 1 ;
	  curcs = parloc ;
	  curcmd = eqtb [curcs ].hh.b0 ;
	  curchr = eqtb [curcs ].hh .v.RH ;
	  if ( ( eqtb [114441L ].cint == 0 ) && ( curcmd >= 131 ) ) 
	  checkoutervalidity () ;
	} 
	break ;
      case 2 : 
	incr ( alignstate ) ;
	break ;
      case 23 : 
	{
	  incr ( alignstate ) ;
	  if ( ( ( eqtb [114421L ].cint / 4 ) % 2 ) == 1 ) 
	  curinput .statefield = 1 ;
	} 
	break ;
      case 44 : 
      case 86 : 
	{
	  curinput .statefield = 1 ;
	  incr ( alignstate ) ;
	} 
	break ;
      case 65 : 
	{
	  curinput .statefield = 22 ;
	  incr ( alignstate ) ;
	} 
	break ;
      case 3 : 
	decr ( alignstate ) ;
	break ;
      case 24 : 
	{
	  decr ( alignstate ) ;
	  if ( ( ( eqtb [114421L ].cint / 4 ) % 2 ) == 1 ) 
	  curinput .statefield = 1 ;
	} 
	break ;
      case 45 : 
      case 87 : 
	{
	  curinput .statefield = 1 ;
	  decr ( alignstate ) ;
	} 
	break ;
      case 66 : 
	{
	  curinput .statefield = 22 ;
	  decr ( alignstate ) ;
	} 
	break ;
      case 46 : 
      case 47 : 
      case 49 : 
      case 51 : 
      case 54 : 
      case 55 : 
      case 67 : 
      case 68 : 
      case 70 : 
      case 72 : 
      case 75 : 
      case 76 : 
      case 88 : 
      case 89 : 
      case 91 : 
      case 93 : 
      case 96 : 
      case 97 : 
      case 25 : 
      case 26 : 
      case 28 : 
      case 30 : 
      case 33 : 
      case 34 : 
	curinput .statefield = 1 ;
	break ;
      case 59 : 
      case 60 : 
      case 61 : 
      case 63 : 
      case 80 : 
      case 81 : 
      case 82 : 
      case 84 : 
      case 101 : 
      case 102 : 
      case 103 : 
      case 105 : 
      case 17 : 
      case 18 : 
      case 19 : 
      case 21 : 
	curinput .statefield = 22 ;
	break ;
      case 62 : 
      case 83 : 
      case 104 : 
      case 41 : 
	curinput .statefield = 1 ;
	break ;
	default: 
	;
	break ;
      } 
    } 
    else {
	
      curinput .statefield = 85 ;
      if ( curinput .namefield > 17 ) 
      {
	incr ( line ) ;
	first = curinput .startfield ;
	if ( ! forceeof ) {
	    
	  if ( curinput .namefield <= 19 ) 
	  {
	    if ( pseudoinput () ) 
	    firmuptheline () ;
	    else if ( ( eqtb [50468L ].hh .v.RH != -1073741823L ) && ! 
	    eofseen [curinput .indexfield ]) 
	    {
	      curinput .limitfield = first - 1 ;
	      eofseen [curinput .indexfield ]= true ;
	      begintokenlist ( eqtb [50468L ].hh .v.RH , 15 ) ;
	      goto lab20 ;
	    } 
	    else forceeof = true ;
	  } 
	  else {
	      
	    if ( inputln ( inputfile [curinput .indexfield ], true ) ) 
	    firmuptheline () ;
	    else if ( ( eqtb [50468L ].hh .v.RH != -1073741823L ) && ! 
	    eofseen [curinput .indexfield ]) 
	    {
	      curinput .limitfield = first - 1 ;
	      eofseen [curinput .indexfield ]= true ;
	      begintokenlist ( eqtb [50468L ].hh .v.RH , 15 ) ;
	      goto lab20 ;
	    } 
	    else forceeof = true ;
	  } 
	} 
	if ( forceeof ) 
	{
	  if ( eqtb [114434L ].cint > 0 ) {
	      
	    if ( ( grpstack [inopen ]!= curboundary ) || ( ifstack [inopen 
	    ]!= condptr ) ) 
	    filewarning () ;
	  } 
	  if ( curinput .namefield >= 19 ) 
	  {
	    printchar ( 41 ) ;
	    decr ( openparens ) ;
	    fflush ( stdout ) ;
	  } 
	  forceeof = false ;
	  endfilereading () ;
	  if ( eqtb [114441L ].cint == 0 ) 
	  checkoutervalidity () ;
	  goto lab20 ;
	} 
	if ( ( eqtb [114410L ].cint < 0 ) || ( eqtb [114410L ].cint > 255 
	) ) 
	decr ( curinput .limitfield ) ;
	else buffer [curinput .limitfield ]= eqtb [114410L ].cint ;
	first = curinput .limitfield + 1 ;
	curinput .locfield = curinput .startfield ;
      } 
      else {
	  
	if ( ! ( curinput .namefield == 0 ) ) 
	{
	  curcmd = 0 ;
	  curchr = 0 ;
	  return ;
	} 
	if ( inputptr > 0 ) 
	{
	  endfilereading () ;
	  goto lab20 ;
	} 
	if ( selector < 18 ) 
	openlogfile () ;
	if ( interaction > 1 ) 
	{
	  if ( ( eqtb [114410L ].cint < 0 ) || ( eqtb [114410L ].cint > 
	  255 ) ) 
	  incr ( curinput .limitfield ) ;
	  if ( curinput .limitfield == curinput .startfield ) 
	  printnl ( 710 ) ;
	  println () ;
	  first = curinput .startfield ;
	  {
	    ;
	    print ( 42 ) ;
	    terminput () ;
	  } 
	  curinput .limitfield = last ;
	  if ( ( eqtb [114410L ].cint < 0 ) || ( eqtb [114410L ].cint > 
	  255 ) ) 
	  decr ( curinput .limitfield ) ;
	  else buffer [curinput .limitfield ]= eqtb [114410L ].cint ;
	  first = curinput .limitfield + 1 ;
	  curinput .locfield = curinput .startfield ;
	} 
	else fatalerror ( 711 ) ;
      } 
      {
	if ( interrupt != 0 ) 
	pauseforinstructions () ;
      } 
      goto lab25 ;
    } 
  } 
  else if ( curinput .locfield != -1073741823L ) 
  {
    t = mem [curinput .locfield ].hh .v.LH ;
    curinput .locfield = mem [curinput .locfield ].hh .v.RH ;
    if ( t >= 536870911L ) 
    {
      curcs = t - 536870911L ;
      curcmd = eqtb [curcs ].hh.b0 ;
      curchr = eqtb [curcs ].hh .v.RH ;
      if ( curcmd >= 131 ) {
	  
	if ( curcmd == 134 ) 
	{
	  curcs = mem [curinput .locfield ].hh .v.LH - 536870911L ;
	  curinput .locfield = -1073741823L ;
	  curcmd = eqtb [curcs ].hh.b0 ;
	  curchr = eqtb [curcs ].hh .v.RH ;
	  if ( curcmd > 118 ) 
	  {
	    curcmd = 0 ;
	    curchr = 16777217L ;
	  } 
	} 
	else {
	    
	  if ( ( curcs == 38818L ) && ( curlist .modefield == 0 ) ) 
	  fatalerror ( 709 ) ;
	  if ( eqtb [114441L ].cint == 0 ) 
	  checkoutervalidity () ;
	} 
      } 
    } 
    else if ( checkkanji ( t ) ) 
    {
      curcmd = ktokentocmd ( t ) ;
      curchr = ktokentochr ( t ) ;
    } 
    else {
	
      curcmd = t / 65536L ;
      curchr = t % 65536L ;
      switch ( curcmd ) 
      {case 1 : 
	incr ( alignstate ) ;
	break ;
      case 2 : 
	decr ( alignstate ) ;
	break ;
      case 5 : 
	{
	  begintokenlist ( paramstack [curinput .limitfield + curchr - 1 ], 
	  0 ) ;
	  goto lab20 ;
	} 
	break ;
	default: 
	;
	break ;
      } 
    } 
  } 
  else {
      
    endtokenlist () ;
    goto lab20 ;
  } 
  if ( curcmd <= 5 ) {
      
    if ( curcmd >= 4 ) {
	
      if ( alignstate == 0 ) 
      {
	if ( ( scannerstatus == 4 ) || ( curalign == -1073741823L ) ) 
	fatalerror ( 686 ) ;
	curcmd = mem [curalign + 5 ].hh .v.LH ;
	mem [curalign + 5 ].hh .v.LH = curchr ;
	if ( curcmd == 69 ) 
	begintokenlist ( memtop - 10 , 2 ) ;
	else begintokenlist ( mem [curalign + 2 ].cint , 2 ) ;
	alignstate = 1000000L ;
	goto lab20 ;
      } 
    } 
  } 
} 
void 
firmuptheline ( void ) 
{
  firmuptheline_regmem 
  integer k  ;
  curinput .limitfield = last ;
  if ( eqtb [114389L ].cint > 0 ) {
      
    if ( interaction > 1 ) 
    {
      ;
      println () ;
      if ( curinput .startfield < curinput .limitfield ) 
      {register integer for_end; k = curinput .startfield ;for_end = 
      curinput .limitfield - 1 ; if ( k <= for_end) do 
	if ( buffer2 [k ]> 0 ) 
	printchar ( buffer [k ]) ;
	else print ( buffer [k ]) ;
      while ( k++ < for_end ) ;} 
      first = curinput .limitfield ;
      {
	;
	print ( 712 ) ;
	terminput () ;
      } 
      if ( last > first ) 
      {
	{register integer for_end; k = first ;for_end = last - 1 ; if ( k <= 
	for_end) do 
	  {
	    buffer [k + curinput .startfield - first ]= buffer [k ];
	    buffer2 [k + curinput .startfield - first ]= buffer2 [k ];
	  } 
	while ( k++ < for_end ) ;} 
	curinput .limitfield = curinput .startfield + last - first ;
      } 
    } 
  } 
} 
void 
gettoken ( void ) 
{
  gettoken_regmem 
  nonewcontrolsequence = false ;
  getnext () ;
  nonewcontrolsequence = true ;
  if ( curcs == 0 ) {
      
    if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) {
	
      if ( ( curcmd == 16 ) && ( curchr >= 16777216L ) ) 
      curtok = ( 23 * 16777216L ) + curchr ;
      else curtok = ( curcmd * 16777216L ) + curchr ;
    } 
    else if ( ( curcmd == 14 ) ) 
    curtok = ( eqtb [51759L + curchr ].hh .v.RH * 16777216L ) + curchr ;
    else if ( ( checkecharrange ( curchr ) == 1 ) ) 
    curtok = ( curcmd * 16777216L ) + curchr ;
    else curtok = ( curcmd * 65536L ) + curchr ;
  } 
  else curtok = 536870911L + curcs ;
} 
void 
macrocall ( void ) 
{
  /* 10 22 30 31 40 */ macrocall_regmem 
  halfword r  ;
  halfword p  ;
  halfword q  ;
  halfword s  ;
  halfword t  ;
  halfword u, v  ;
  halfword rbraceptr  ;
  smallnumber n  ;
  halfword unbalance  ;
  halfword m  ;
  halfword refcount  ;
  smallnumber savescannerstatus  ;
  halfword savewarningindex  ;
  ASCIIcode matchchr  ;
  savescannerstatus = scannerstatus ;
  savewarningindex = warningindex ;
  warningindex = curcs ;
  refcount = curchr ;
  r = mem [refcount ].hh .v.RH ;
  n = 0 ;
  if ( eqtb [114391L ].cint > 0 ) 
  {
    begindiagnostic () ;
    if ( eqtb [114426L ].cint > 0 ) {
	
      if ( inputptr < eqtb [114426L ].cint ) 
      {
	v = inputptr ;
	println () ;
	printchar ( 126 ) ;
	while ( v > 0 ) {
	    
	  printchar ( 46 ) ;
	  decr ( v ) ;
	} 
	printcs ( warningindex ) ;
	tokenshow ( refcount ) ;
      } 
      else {
	  
	printchar ( 126 ) ;
	printchar ( 126 ) ;
	printcs ( warningindex ) ;
      } 
    } 
    else {
	
      println () ;
      printcs ( warningindex ) ;
      tokenshow ( refcount ) ;
    } 
    enddiagnostic ( false ) ;
  } 
  if ( mem [r ].hh .v.LH == 917505L ) 
  r = mem [r ].hh .v.RH ;
  if ( mem [r ].hh .v.LH != 917504L ) 
  {
    scannerstatus = 3 ;
    unbalance = 0 ;
    longstate = eqtb [curcs ].hh.b0 ;
    if ( longstate >= 131 ) 
    longstate = longstate - 2 ;
    do {
	mem [memtop - 3 ].hh .v.RH = -1073741823L ;
      if ( ( mem [r ].hh .v.LH >= 863872L ) || ( mem [r ].hh .v.LH < 
      851968L ) ) 
      s = -1073741823L ;
      else {
	  
	matchchr = mem [r ].hh .v.LH - 851968L ;
	s = mem [r ].hh .v.RH ;
	r = s ;
	p = memtop - 3 ;
	m = 0 ;
      } 
      lab22: gettoken () ;
      if ( curtok == mem [r ].hh .v.LH ) 
      {
	r = mem [r ].hh .v.RH ;
	if ( ( mem [r ].hh .v.LH >= 851968L ) && ( mem [r ].hh .v.LH <= 
	917504L ) ) 
	{
	  if ( curtok < 131072L ) 
	  decr ( alignstate ) ;
	  goto lab40 ;
	} 
	else goto lab22 ;
      } 
      if ( s != r ) {
	  
	if ( s == -1073741823L ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 745 ) ;
	  } 
	  sprintcs ( warningindex ) ;
	  print ( 746 ) ;
	  {
	    helpptr = 4 ;
	    helpline [3 ]= 747 ;
	    helpline [2 ]= 748 ;
	    helpline [1 ]= 749 ;
	    helpline [0 ]= 750 ;
	  } 
	  error () ;
	  goto lab10 ;
	} 
	else {
	    
	  t = s ;
	  do {
	      { 
	      q = getavail () ;
	      mem [p ].hh .v.RH = q ;
	      mem [q ].hh .v.LH = mem [t ].hh .v.LH ;
	      p = q ;
	    } 
	    incr ( m ) ;
	    u = mem [t ].hh .v.RH ;
	    v = s ;
	    while ( true ) {
		
	      if ( u == r ) {
		  
		if ( curtok != mem [v ].hh .v.LH ) 
		goto lab30 ;
		else {
		    
		  r = mem [v ].hh .v.RH ;
		  goto lab22 ;
		} 
	      } 
	      if ( mem [u ].hh .v.LH != mem [v ].hh .v.LH ) 
	      goto lab30 ;
	      u = mem [u ].hh .v.RH ;
	      v = mem [v ].hh .v.RH ;
	    } 
	    lab30: t = mem [t ].hh .v.RH ;
	  } while ( ! ( t == r ) ) ;
	  r = s ;
	} 
      } 
      if ( curtok == partoken ) {
	  
	if ( longstate != 130 ) {
	    
	  if ( eqtb [114440L ].cint == 0 ) 
	  {
	    if ( longstate == 129 ) 
	    {
	      runaway () ;
	      {
		if ( interaction == 3 ) 
		;
		if ( filelineerrorstylep ) 
		printfileline () ;
		else printnl ( 265 ) ;
		print ( 740 ) ;
	      } 
	      sprintcs ( warningindex ) ;
	      print ( 741 ) ;
	      {
		helpptr = 3 ;
		helpline [2 ]= 742 ;
		helpline [1 ]= 743 ;
		helpline [0 ]= 744 ;
	      } 
	      backerror () ;
	    } 
	    pstack [n ]= mem [memtop - 3 ].hh .v.RH ;
	    alignstate = alignstate - unbalance ;
	    {register integer for_end; m = 0 ;for_end = n ; if ( m <= 
	    for_end) do 
	      flushlist ( pstack [m ]) ;
	    while ( m++ < for_end ) ;} 
	    goto lab10 ;
	  } 
	} 
      } 
      if ( curtok < 196608L ) {
	  
	if ( curtok < 131072L ) 
	{
	  unbalance = 1 ;
	  while ( true ) {
	      
	    {
	      {
		q = avail ;
		if ( q == -1073741823L ) 
		q = getavail () ;
		else {
		    
		  avail = mem [q ].hh .v.RH ;
		  mem [q ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
		  incr ( dynused ) ;
#endif /* STAT */
		} 
	      } 
	      mem [p ].hh .v.RH = q ;
	      mem [q ].hh .v.LH = curtok ;
	      p = q ;
	    } 
	    gettoken () ;
	    if ( curtok == partoken ) {
		
	      if ( longstate != 130 ) {
		  
		if ( eqtb [114440L ].cint == 0 ) 
		{
		  if ( longstate == 129 ) 
		  {
		    runaway () ;
		    {
		      if ( interaction == 3 ) 
		      ;
		      if ( filelineerrorstylep ) 
		      printfileline () ;
		      else printnl ( 265 ) ;
		      print ( 740 ) ;
		    } 
		    sprintcs ( warningindex ) ;
		    print ( 741 ) ;
		    {
		      helpptr = 3 ;
		      helpline [2 ]= 742 ;
		      helpline [1 ]= 743 ;
		      helpline [0 ]= 744 ;
		    } 
		    backerror () ;
		  } 
		  pstack [n ]= mem [memtop - 3 ].hh .v.RH ;
		  alignstate = alignstate - unbalance ;
		  {register integer for_end; m = 0 ;for_end = n ; if ( m <= 
		  for_end) do 
		    flushlist ( pstack [m ]) ;
		  while ( m++ < for_end ) ;} 
		  goto lab10 ;
		} 
	      } 
	    } 
	    if ( curtok < 196608L ) {
		
	      if ( curtok < 131072L ) 
	      incr ( unbalance ) ;
	      else {
		  
		decr ( unbalance ) ;
		if ( unbalance == 0 ) 
		goto lab31 ;
	      } 
	    } 
	  } 
	  lab31: rbraceptr = p ;
	  {
	    q = getavail () ;
	    mem [p ].hh .v.RH = q ;
	    mem [q ].hh .v.LH = curtok ;
	    p = q ;
	  } 
	} 
	else {
	    
	  backinput () ;
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 732 ) ;
	  } 
	  sprintcs ( warningindex ) ;
	  print ( 733 ) ;
	  {
	    helpptr = 6 ;
	    helpline [5 ]= 734 ;
	    helpline [4 ]= 735 ;
	    helpline [3 ]= 736 ;
	    helpline [2 ]= 737 ;
	    helpline [1 ]= 738 ;
	    helpline [0 ]= 739 ;
	  } 
	  incr ( alignstate ) ;
	  longstate = 129 ;
	  curtok = partoken ;
	  inserror () ;
	  goto lab22 ;
	} 
      } 
      else {
	  
	if ( curtok == 655392L ) {
	    
	  if ( mem [r ].hh .v.LH <= 917504L ) {
	      
	    if ( mem [r ].hh .v.LH >= 851968L ) 
	    goto lab22 ;
	  } 
	} 
	{
	  q = getavail () ;
	  mem [p ].hh .v.RH = q ;
	  mem [q ].hh .v.LH = curtok ;
	  p = q ;
	} 
      } 
      incr ( m ) ;
      if ( mem [r ].hh .v.LH > 917504L ) 
      goto lab22 ;
      if ( mem [r ].hh .v.LH < 851968L ) 
      goto lab22 ;
      lab40: if ( s != -1073741823L ) 
      {
	if ( ( m == 1 ) && ( mem [p ].hh .v.LH < 196608L ) ) 
	{
	  mem [rbraceptr ].hh .v.RH = -1073741823L ;
	  {
	    mem [p ].hh .v.RH = avail ;
	    avail = p ;
	;
#ifdef STAT
	    decr ( dynused ) ;
#endif /* STAT */
	  } 
	  p = mem [memtop - 3 ].hh .v.RH ;
	  pstack [n ]= mem [p ].hh .v.RH ;
	  {
	    mem [p ].hh .v.RH = avail ;
	    avail = p ;
	;
#ifdef STAT
	    decr ( dynused ) ;
#endif /* STAT */
	  } 
	} 
	else pstack [n ]= mem [memtop - 3 ].hh .v.RH ;
	incr ( n ) ;
	if ( eqtb [114391L ].cint > 0 ) {
	    
	  if ( ( eqtb [114426L ].cint == 0 ) || ( inputptr < eqtb [114426L 
	  ].cint ) ) 
	  {
	    begindiagnostic () ;
	    printnl ( matchchr ) ;
	    printint ( n ) ;
	    print ( 751 ) ;
	    showtokenlist ( pstack [n - 1 ], -1073741823L , 1000 ) ;
	    enddiagnostic ( false ) ;
	  } 
	} 
      } 
    } while ( ! ( mem [r ].hh .v.LH == 917504L ) ) ;
  } 
  while ( ( curinput .locfield == -1073741823L ) && ( curinput .indexfield != 
  2 ) && ( curinput .indexfield != 6 ) ) endtokenlist () ;
  begintokenlist ( refcount , 5 ) ;
  curinput .namefield = warningindex ;
  curinput .locfield = mem [r ].hh .v.RH ;
  if ( n > 0 ) 
  {
    if ( paramptr + n > maxparamstack ) 
    {
      maxparamstack = paramptr + n ;
      if ( maxparamstack > paramsize ) 
      overflow ( 731 , paramsize ) ;
    } 
    {register integer for_end; m = 0 ;for_end = n - 1 ; if ( m <= for_end) 
    do 
      paramstack [paramptr + m ]= pstack [m ];
    while ( m++ < for_end ) ;} 
    paramptr = paramptr + n ;
  } 
  lab10: scannerstatus = savescannerstatus ;
  warningindex = savewarningindex ;
} 
void 
insertrelax ( void ) 
{
  insertrelax_regmem 
  curtok = 536870911L + curcs ;
  backinput () ;
  curtok = 536909728L ;
  backinput () ;
  curinput .indexfield = 4 ;
} 
void 
znewindex ( quarterword i , halfword q ) 
{
  newindex_regmem 
  smallnumber k  ;
  curptr = getnode ( 9 ) ;
  mem [curptr ].hh.b0 = i ;
  mem [curptr ].hh.b1 = 0 ;
  mem [curptr ].hh .v.RH = q ;
  {register integer for_end; k = 1 ;for_end = 8 ; if ( k <= for_end) do 
    mem [curptr + k ]= sanull ;
  while ( k++ < for_end ) ;} 
} 
void 
zfindsaelement ( smallnumber t , halfword n , boolean w ) 
{
  /* 45 46 47 48 49 50 10 */ findsaelement_regmem 
  halfword q  ;
  smallnumber i  ;
  curptr = saroot [t ];
  {
    if ( curptr == -1073741823L ) {
	
      if ( w ) 
      goto lab45 ;
      else return ;
    } 
  } 
  q = curptr ;
  i = n / 65536L ;
  if ( odd ( i ) ) 
  curptr = mem [q + ( i / 2 ) + 1 ].hh .v.RH ;
  else curptr = mem [q + ( i / 2 ) + 1 ].hh .v.LH ;
  {
    if ( curptr == -1073741823L ) {
	
      if ( w ) 
      goto lab46 ;
      else return ;
    } 
  } 
  q = curptr ;
  i = ( n / 4096 ) % 16 ;
  if ( odd ( i ) ) 
  curptr = mem [q + ( i / 2 ) + 1 ].hh .v.RH ;
  else curptr = mem [q + ( i / 2 ) + 1 ].hh .v.LH ;
  {
    if ( curptr == -1073741823L ) {
	
      if ( w ) 
      goto lab47 ;
      else return ;
    } 
  } 
  q = curptr ;
  i = ( n / 256 ) % 16 ;
  if ( odd ( i ) ) 
  curptr = mem [q + ( i / 2 ) + 1 ].hh .v.RH ;
  else curptr = mem [q + ( i / 2 ) + 1 ].hh .v.LH ;
  {
    if ( curptr == -1073741823L ) {
	
      if ( w ) 
      goto lab48 ;
      else return ;
    } 
  } 
  q = curptr ;
  i = ( n / 16 ) % 16 ;
  if ( odd ( i ) ) 
  curptr = mem [q + ( i / 2 ) + 1 ].hh .v.RH ;
  else curptr = mem [q + ( i / 2 ) + 1 ].hh .v.LH ;
  {
    if ( curptr == -1073741823L ) {
	
      if ( w ) 
      goto lab49 ;
      else return ;
    } 
  } 
  q = curptr ;
  i = n % 16 ;
  if ( odd ( i ) ) 
  curptr = mem [q + ( i / 2 ) + 1 ].hh .v.RH ;
  else curptr = mem [q + ( i / 2 ) + 1 ].hh .v.LH ;
  if ( ( curptr == -1073741823L ) && w ) 
  goto lab50 ;
  return ;
  lab45: newindex ( t , -1073741823L ) ;
  saroot [t ]= curptr ;
  q = curptr ;
  i = n / 65536L ;
  lab46: newindex ( i , q ) ;
  {
    if ( odd ( i ) ) 
    mem [q + ( i / 2 ) + 1 ].hh .v.RH = curptr ;
    else mem [q + ( i / 2 ) + 1 ].hh .v.LH = curptr ;
    incr ( mem [q ].hh.b1 ) ;
  } 
  q = curptr ;
  i = ( n / 4096 ) % 16 ;
  lab47: newindex ( i , q ) ;
  {
    if ( odd ( i ) ) 
    mem [q + ( i / 2 ) + 1 ].hh .v.RH = curptr ;
    else mem [q + ( i / 2 ) + 1 ].hh .v.LH = curptr ;
    incr ( mem [q ].hh.b1 ) ;
  } 
  q = curptr ;
  i = ( n / 256 ) % 16 ;
  lab48: newindex ( i , q ) ;
  {
    if ( odd ( i ) ) 
    mem [q + ( i / 2 ) + 1 ].hh .v.RH = curptr ;
    else mem [q + ( i / 2 ) + 1 ].hh .v.LH = curptr ;
    incr ( mem [q ].hh.b1 ) ;
  } 
  q = curptr ;
  i = ( n / 16 ) % 16 ;
  lab49: newindex ( i , q ) ;
  {
    if ( odd ( i ) ) 
    mem [q + ( i / 2 ) + 1 ].hh .v.RH = curptr ;
    else mem [q + ( i / 2 ) + 1 ].hh .v.LH = curptr ;
    incr ( mem [q ].hh.b1 ) ;
  } 
  q = curptr ;
  i = n % 16 ;
  lab50: if ( t == 6 ) 
  {
    curptr = getnode ( 4 ) ;
    mem [curptr + 1 ]= sanull ;
    mem [curptr + 2 ]= sanull ;
    mem [curptr + 3 ]= sanull ;
  } 
  else {
      
    if ( t <= 1 ) 
    {
      curptr = getnode ( 3 ) ;
      mem [curptr + 2 ].cint = 0 ;
      mem [curptr + 1 ].hh .v.RH = n ;
    } 
    else {
	
      curptr = getnode ( 2 ) ;
      if ( t <= 3 ) 
      {
	mem [curptr + 1 ].hh .v.RH = membot ;
	incr ( mem [membot ].hh .v.RH ) ;
      } 
      else mem [curptr + 1 ].hh .v.RH = -1073741823L ;
    } 
    mem [curptr + 1 ].hh .v.LH = -1073741823L ;
  } 
  mem [curptr ].hh.b0 = 16 * t + i ;
  mem [curptr ].hh.b1 = 1 ;
  mem [curptr ].hh .v.RH = q ;
  {
    if ( odd ( i ) ) 
    mem [q + ( i / 2 ) + 1 ].hh .v.RH = curptr ;
    else mem [q + ( i / 2 ) + 1 ].hh .v.LH = curptr ;
    incr ( mem [q ].hh.b1 ) ;
  } 
} 
void 
expand ( void ) 
{
  /* 21 */ expand_regmem 
  halfword t  ;
  boolean b  ;
  halfword p, q, r  ;
  integer j  ;
  integer cvbackup  ;
  smallnumber cvlbackup, radixbackup, cobackup  ;
  halfword backupbackup  ;
  smallnumber savescannerstatus  ;
  incr ( expanddepthcount ) ;
  if ( expanddepthcount >= expanddepth ) 
  overflow ( 713 , expanddepth ) ;
  cvbackup = curval ;
  cvlbackup = curvallevel ;
  radixbackup = radix ;
  cobackup = curorder ;
  backupbackup = mem [memtop - 13 ].hh .v.RH ;
  lab21: if ( curcmd < 129 ) 
  {
    if ( eqtb [114397L ].cint > 1 ) 
    showcurcmdchr () ;
    switch ( curcmd ) 
    {case 128 : 
      {
	t = curchr % 5 ;
	if ( curchr >= 5 ) 
	scanregisternum () ;
	else curval = 0 ;
	if ( curval == 0 ) 
	curptr = curmark [t ];
	else {
	    
	  findsaelement ( 6 , curval , false ) ;
	  if ( curptr != -1073741823L ) {
	      
	    if ( odd ( t ) ) 
	    curptr = mem [curptr + ( t / 2 ) + 1 ].hh .v.RH ;
	    else curptr = mem [curptr + ( t / 2 ) + 1 ].hh .v.LH ;
	  } 
	} 
	if ( curptr != -1073741823L ) 
	begintokenlist ( curptr , 14 ) ;
      } 
      break ;
    case 120 : 
      if ( curchr == 0 ) 
      {
	gettoken () ;
	t = curtok ;
	gettoken () ;
	if ( curcmd > 118 ) 
	expand () ;
	else backinput () ;
	curtok = t ;
	backinput () ;
      } 
      else {
	  
	gettoken () ;
	if ( ( curcmd == 123 ) && ( curchr != 16 ) ) 
	{
	  curchr = curchr + 32 ;
	  goto lab21 ;
	} 
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 789 ) ;
	} 
	printesc ( 931 ) ;
	print ( 1622 ) ;
	printcmdchr ( curcmd , curchr ) ;
	printchar ( 39 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 708 ;
	} 
	backerror () ;
      } 
      break ;
    case 121 : 
      if ( curchr == 0 ) 
      {
	savescannerstatus = scannerstatus ;
	scannerstatus = 0 ;
	gettoken () ;
	scannerstatus = savescannerstatus ;
	t = curtok ;
	backinput () ;
	if ( ( t >= 536870911L ) && ( t != 536909729L ) ) 
	{
	  p = getavail () ;
	  mem [p ].hh .v.LH = 536909730L ;
	  mem [p ].hh .v.RH = curinput .locfield ;
	  curinput .startfield = p ;
	  curinput .locfield = p ;
	} 
      } 
      else {
	  
	savescannerstatus = scannerstatus ;
	scannerstatus = 0 ;
	gettoken () ;
	scannerstatus = savescannerstatus ;
	if ( curcs < 23810 ) 
	curcs = primlookup ( curcs - 11905 ) ;
	else curcs = primlookup ( hash [curcs ].v.RH ) ;
	if ( curcs != 0 ) 
	{
	  t = eqtb [38822L + curcs ].hh.b0 ;
	  if ( t > 118 ) 
	  {
	    curcmd = t ;
	    curchr = eqtb [38822L + curcs ].hh .v.RH ;
	    curtok = ( curcmd * 65536L ) + curchr ;
	    curcs = 0 ;
	    goto lab21 ;
	  } 
	  else {
	      
	    backinput () ;
	    p = getavail () ;
	    mem [p ].hh .v.LH = 536909732L ;
	    mem [p ].hh .v.RH = curinput .locfield ;
	    curinput .locfield = p ;
	    curinput .startfield = p ;
	  } 
	} 
      } 
      break ;
    case 125 : 
      {
	r = getavail () ;
	p = r ;
	b = isincsname ;
	isincsname = true ;
	do {
	    getxtoken () ;
	  if ( curcs == 0 ) 
	  {
	    q = getavail () ;
	    mem [p ].hh .v.RH = q ;
	    mem [q ].hh .v.LH = curtok ;
	    p = q ;
	  } 
	} while ( ! ( curcs != 0 ) ) ;
	if ( curcmd != 73 ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 720 ) ;
	  } 
	  printesc ( 569 ) ;
	  print ( 721 ) ;
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 722 ;
	    helpline [0 ]= 723 ;
	  } 
	  backerror () ;
	} 
	isincsname = b ;
	j = first ;
	p = mem [r ].hh .v.RH ;
	while ( p != -1073741823L ) {
	    
	  if ( j >= maxbufstack ) 
	  {
	    maxbufstack = j + 1 ;
	    if ( maxbufstack == bufsize ) 
	    overflow ( 259 , bufsize ) ;
	  } 
	  if ( checkkanji ( mem [p ].hh .v.LH ) ) 
	  {
	    t = toBUFF ( mem [p ].hh .v.LH % 16777216L ) ;
	    if ( BYTE1 ( t ) != 0 ) 
	    {
	      buffer [j ]= BYTE1 ( t ) ;
	      buffer2 [j ]= 1 ;
	      incr ( j ) ;
	    } 
	    if ( BYTE2 ( t ) != 0 ) 
	    {
	      buffer [j ]= BYTE2 ( t ) ;
	      buffer2 [j ]= 1 ;
	      incr ( j ) ;
	    } 
	    if ( BYTE3 ( t ) != 0 ) 
	    {
	      buffer [j ]= BYTE3 ( t ) ;
	      buffer2 [j ]= 1 ;
	      incr ( j ) ;
	    } 
	    buffer [j ]= BYTE4 ( t ) ;
	    buffer2 [j ]= 1 ;
	    incr ( j ) ;
	    p = mem [p ].hh .v.RH ;
	  } 
	  else {
	      
	    buffer [j ]= mem [p ].hh .v.LH % 65536L ;
	    buffer2 [j ]= 0 ;
	    incr ( j ) ;
	    p = mem [p ].hh .v.RH ;
	  } 
	} 
	if ( j > first + 1 ) 
	{
	  nonewcontrolsequence = false ;
	  curcs = idlookup ( first , j - first ) ;
	  nonewcontrolsequence = true ;
	} 
	else if ( j == first ) 
	curcs = 23809 ;
	else curcs = 11905 + buffer [first ];
	flushlist ( r ) ;
	if ( eqtb [curcs ].hh.b0 == 119 ) 
	{
	  eqdefine ( curcs , 0 , 16777216L ) ;
	} 
	curtok = curcs + 536870911L ;
	backinput () ;
      } 
      break ;
    case 126 : 
      convtoks () ;
      break ;
    case 127 : 
      insthetoks () ;
      break ;
    case 123 : 
      conditional () ;
      break ;
    case 124 : 
      {
	if ( eqtb [114432L ].cint > 0 ) {
	    
	  if ( eqtb [114397L ].cint <= 1 ) 
	  showcurcmdchr () ;
	} 
	if ( curchr > iflimit ) {
	    
	  if ( iflimit == 1 ) 
	  insertrelax () ;
	  else {
	      
	    {
	      if ( interaction == 3 ) 
	      ;
	      if ( filelineerrorstylep ) 
	      printfileline () ;
	      else printnl ( 265 ) ;
	      print ( 935 ) ;
	    } 
	    printcmdchr ( 124 , curchr ) ;
	    {
	      helpptr = 1 ;
	      helpline [0 ]= 936 ;
	    } 
	    error () ;
	  } 
	} 
	else {
	    
	  while ( curchr != 2 ) passtext () ;
	  {
	    if ( ifstack [inopen ]== condptr ) 
	    ifwarning () ;
	    p = condptr ;
	    ifline = mem [p + 1 ].cint ;
	    curif = mem [p ].hh.b1 ;
	    iflimit = mem [p ].hh.b0 ;
	    condptr = mem [p ].hh .v.RH ;
	    freenode ( p , 2 ) ;
	  } 
	} 
      } 
      break ;
    case 122 : 
      if ( curchr == 1 ) 
      forceeof = true ;
      else if ( curchr == 2 ) 
      pseudostart () ;
      else if ( nameinprogress ) 
      insertrelax () ;
      else startinput () ;
      break ;
      default: 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 714 ) ;
	} 
	{
	  helpptr = 5 ;
	  helpline [4 ]= 715 ;
	  helpline [3 ]= 716 ;
	  helpline [2 ]= 717 ;
	  helpline [1 ]= 718 ;
	  helpline [0 ]= 719 ;
	} 
	error () ;
      } 
      break ;
    } 
  } 
  else if ( curcmd < 133 ) 
  macrocall () ;
  else {
      
    curtok = 536909727L ;
    backinput () ;
  } 
  curval = cvbackup ;
  curvallevel = cvlbackup ;
  radix = radixbackup ;
  curorder = cobackup ;
  mem [memtop - 13 ].hh .v.RH = backupbackup ;
  decr ( expanddepthcount ) ;
} 
void 
getxtoken ( void ) 
{
  /* 20 30 */ getxtoken_regmem 
  lab20: getnext () ;
  if ( curcmd <= 118 ) 
  goto lab30 ;
  if ( curcmd >= 129 ) {
      
    if ( curcmd < 133 ) 
    macrocall () ;
    else {
	
      curcs = 38816L ;
      curcmd = 9 ;
      goto lab30 ;
    } 
  } 
  else expand () ;
  goto lab20 ;
  lab30: if ( curcs == 0 ) {
      
    if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) {
	
      if ( ( curcmd == 16 ) && ( curchr >= 16777216L ) ) 
      curtok = ( 23 * 16777216L ) + curchr ;
      else curtok = ( curcmd * 16777216L ) + curchr ;
    } 
    else if ( ( curcmd == 14 ) ) 
    curtok = ( eqtb [51759L + curchr ].hh .v.RH * 16777216L ) + curchr ;
    else if ( ( checkecharrange ( curchr ) == 1 ) ) 
    curtok = ( curcmd * 16777216L ) + curchr ;
    else curtok = ( curcmd * 65536L ) + curchr ;
  } 
  else curtok = 536870911L + curcs ;
} 
void 
xtoken ( void ) 
{
  xtoken_regmem 
  while ( curcmd > 118 ) {
      
    expand () ;
    getnext () ;
  } 
  if ( curcs == 0 ) {
      
    if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) {
	
      if ( ( curcmd == 16 ) && ( curchr >= 16777216L ) ) 
      curtok = ( 23 * 16777216L ) + curchr ;
      else curtok = ( curcmd * 16777216L ) + curchr ;
    } 
    else if ( ( curcmd == 14 ) ) 
    curtok = ( eqtb [51759L + curchr ].hh .v.RH * 16777216L ) + curchr ;
    else if ( ( checkecharrange ( curchr ) == 1 ) ) 
    curtok = ( curcmd * 16777216L ) + curchr ;
    else curtok = ( curcmd * 65536L ) + curchr ;
  } 
  else curtok = 536870911L + curcs ;
} 
void 
scanleftbrace ( void ) 
{
  scanleftbrace_regmem 
  do {
      getxtoken () ;
  } while ( ! ( ( curcmd != 10 ) && ( curcmd != 0 ) ) ) ;
  if ( curcmd != 1 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 752 ) ;
    } 
    {
      helpptr = 4 ;
      helpline [3 ]= 753 ;
      helpline [2 ]= 754 ;
      helpline [1 ]= 755 ;
      helpline [0 ]= 756 ;
    } 
    backerror () ;
    curtok = 65659L ;
    curcmd = 1 ;
    curchr = 123 ;
    incr ( alignstate ) ;
  } 
} 
void 
scanoptionalequals ( void ) 
{
  scanoptionalequals_regmem 
  do {
      getxtoken () ;
  } while ( ! ( curcmd != 10 ) ) ;
  if ( curtok != 786493L ) 
  backinput () ;
} 
boolean 
zscankeyword ( strnumber s ) 
{
  /* 10 */ register boolean Result; scankeyword_regmem 
  halfword p  ;
  halfword q  ;
  poolpointer k  ;
  halfword savecurcs  ;
  p = memtop - 13 ;
  mem [p ].hh .v.RH = -1073741823L ;
  k = strstart [s ];
  savecurcs = curcs ;
  while ( k < strstart [s + 1 ]) {
      
    getxtoken () ;
    if ( ( curcs == 0 ) && ( ( curchr == strpool [k ]) || ( curchr == 
    strpool [k ]- 32 ) ) ) 
    {
      {
	q = getavail () ;
	mem [p ].hh .v.RH = q ;
	mem [q ].hh .v.LH = curtok ;
	p = q ;
      } 
      incr ( k ) ;
    } 
    else if ( ( curcmd != 10 ) || ( p != memtop - 13 ) ) 
    {
      backinput () ;
      if ( p != memtop - 13 ) 
      begintokenlist ( mem [memtop - 13 ].hh .v.RH , 3 ) ;
      curcs = savecurcs ;
      Result = false ;
      return Result ;
    } 
  } 
  flushlist ( mem [memtop - 13 ].hh .v.RH ) ;
  Result = true ;
  return Result ;
} 
void 
muerror ( void ) 
{
  muerror_regmem 
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 757 ) ;
  } 
  {
    helpptr = 1 ;
    helpline [0 ]= 758 ;
  } 
  error () ;
} 
void 
scaneightbitint ( void ) 
{
  scaneightbitint_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 255 ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 791 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 792 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scanasciinum ( void ) 
{
  scanasciinum_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 255 ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 793 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 794 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scanlatinnum ( void ) 
{
  scanlatinnum_regmem 
  scanint () ;
  if ( ! ischarascii ( curval ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 793 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 795 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scancharnum ( void ) 
{
  scancharnum_regmem 
  scanint () ;
  if ( ! ischarascii ( curval ) && ! ischarkanji ( curval ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 793 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 796 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scanfourbitint ( void ) 
{
  scanfourbitint_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 15 ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 797 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 798 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scanbigfourbitint ( void ) 
{
  scanbigfourbitint_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 255 ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 797 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 799 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scanfifteenbitint ( void ) 
{
  scanfifteenbitint_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 32767 ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 800 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 801 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
  curval = ( ( curval / 4096 ) * 65536L ) + ( curval % 4096 ) ;
} 
void 
scanrealfifteenbitint ( void ) 
{
  scanrealfifteenbitint_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 32767 ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 800 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 801 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scanbigfifteenbitint ( void ) 
{
  scanbigfifteenbitint_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 134217727L ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 802 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 803 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
  curval = ( ( curval / 65536L ) * 256 ) + ( curval % 256 ) ;
} 
void 
scanomegafifteenbitint ( void ) 
{
  scanomegafifteenbitint_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 134217727L ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 802 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 803 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scantwentysevenbitint ( void ) 
{
  scantwentysevenbitint_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 134217727L ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 804 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 763 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
  curval1 = curval % 4096 ;
  curval = curval / 4096 ;
  curval = ( ( curval / 4096 ) * 65536L ) + ( curval % 4096 ) ;
} 
void 
scanfiftyonebitint ( void ) 
{
  scanfiftyonebitint_regmem 
  integer iiii  ;
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 134217727L ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 804 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 805 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
  iiii = ( ( curval / 65536L ) * 256 ) + ( curval % 256 ) ;
  scanint () ;
  if ( ( curval < 0 ) || ( curval > 16777215L ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 804 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 806 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
  curval1 = ( ( curval / 65536L ) * 256 ) + ( curval % 256 ) ;
  curval = iiii ;
} 
void 
scanregisternum ( void ) 
{
  scanregisternum_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( curval > maxregnum ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 791 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= maxreghelpline ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
scanfourbitintor18 ( void ) 
{
  scanfourbitintor18_regmem 
  scanint () ;
  if ( ( curval < 0 ) || ( ( curval > 15 ) && ( curval != 18 ) ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 797 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 798 ;
      helpline [0 ]= 761 ;
    } 
    interror ( curval ) ;
    curval = 0 ;
  } 
} 
void 
getxorprotected ( void ) 
{
  /* 10 */ getxorprotected_regmem 
  while ( true ) {
      
    gettoken () ;
    if ( curcmd <= 118 ) 
    return ;
    if ( ( curcmd >= 129 ) && ( curcmd < 133 ) ) {
	
      if ( mem [mem [curchr ].hh .v.RH ].hh .v.LH == 917505L ) 
      return ;
    } 
    expand () ;
  } 
} 
integer 
zeffectivechar ( boolean errp , internalfontnumber f , quarterword c ) 
{
  /* 40 */ register integer Result; effectivechar_regmem 
  integer basec  ;
  integer result  ;
  result = c ;
  if ( ! mltexenabledp ) 
  goto lab40 ;
  if ( fontec [f ]>= c ) {
      
    if ( fontbc [f ]<= c ) {
	
      if ( ( fontinfo [charbase [f ]+ c ].qqqq .b0 > 0 ) ) 
      goto lab40 ;
    } 
  } 
  if ( c >= eqtb [114423L ].cint ) {
      
    if ( c <= eqtb [114424L ].cint ) {
	
      if ( ( eqtb [114105L + c ].hh .v.RH > 0 ) ) 
      {
	basec = ( eqtb [114105L + c ].hh .v.RH % 256 ) ;
	result = basec ;
	if ( ! errp ) 
	goto lab40 ;
	if ( fontec [f ]>= basec ) {
	    
	  if ( fontbc [f ]<= basec ) {
	      
	    if ( ( fontinfo [charbase [f ]+ basec ].qqqq .b0 > 0 ) ) 
	    goto lab40 ;
	  } 
	} 
      } 
    } 
  } 
  if ( errp ) 
  {
    begindiagnostic () ;
    printnl ( 986 ) ;
    print ( 1655 ) ;
    print ( c ) ;
    print ( 987 ) ;
    slowprint ( fontname [f ]) ;
    printchar ( 33 ) ;
    enddiagnostic ( false ) ;
    result = fontbc [f ];
  } 
  lab40: Result = result ;
  return Result ;
} 
void 
scanfontident ( void ) 
{
  scanfontident_regmem 
  internalfontnumber f  ;
  halfword m  ;
  do {
      getxtoken () ;
  } while ( ! ( curcmd != 10 ) ) ;
  if ( curcmd == 102 ) 
  f = eqtb [51754L ].hh .v.RH ;
  else if ( curcmd == 103 ) 
  f = eqtb [51755L ].hh .v.RH ;
  else if ( curcmd == 101 ) 
  f = eqtb [50985L ].hh .v.RH ;
  else if ( curcmd == 100 ) 
  f = curchr ;
  else if ( curcmd == 99 ) 
  {
    m = curchr ;
    scanbigfourbitint () ;
    f = eqtb [m + curval ].hh .v.RH ;
  } 
  else if ( ( curcmd == 78 ) && ( curchr == 6 ) ) 
  {
    scansomethinginternalident () ;
    f = curval - 40923L ;
  } 
  else {
      
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 978 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 979 ;
      helpline [0 ]= 980 ;
    } 
    backerror () ;
    f = 0 ;
  } 
  curval = f ;
} 
void 
zfindfontdimen ( boolean writing ) 
{
  findfontdimen_regmem 
  internalfontnumber f  ;
  integer n  ;
  scanint () ;
  n = curval ;
  scanfontident () ;
  f = curval ;
  if ( n <= 0 ) 
  curval = fmemptr ;
  else {
      
    if ( writing && ( n <= 4 ) && ( n >= 2 ) && ( fontglue [f ]!= 
    -1073741823L ) ) 
    {
      deleteglueref ( fontglue [f ]) ;
      fontglue [f ]= -1073741823L ;
    } 
    if ( n > fontparams [f ]) {
	
      if ( f < fontptr ) 
      curval = fmemptr ;
      else {
	  
	do {
	    if ( fmemptr == fontmemsize ) 
	  overflow ( 985 , fontmemsize ) ;
	  fontinfo [fmemptr ].cint = 0 ;
	  incr ( fmemptr ) ;
	  incr ( fontparams [f ]) ;
	} while ( ! ( n == fontparams [f ]) ) ;
	curval = fmemptr - 1 ;
      } 
    } 
    else curval = n + parambase [f ];
  } 
  if ( curval == fmemptr ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 961 ) ;
    } 
    printesc ( hash [40923L + f ].v.RH ) ;
    print ( 981 ) ;
    printint ( fontparams [f ]) ;
    print ( 982 ) ;
    {
      helpptr = 2 ;
      helpline [1 ]= 983 ;
      helpline [0 ]= 984 ;
    } 
    error () ;
  } 
} 
eightbits 
zgetjfmpos ( KANJIcode kcode , internalfontnumber f ) 
{
  register eightbits Result; getjfmpos_regmem 
  KANJIcode jc  ;
  halfword sp, mp, ep  ;
  if ( f == 0 ) 
  {
    Result = fontinfo [ctypebase [0 ]+ 0 ].hh .lhfield ;
    return Result ;
  } 
  jc = toDVI ( kcode ) ;
  sp = 1 ;
  ep = fontnumext [f ]- 1 ;
  if ( ( ep >= 1 ) ) {
      
    if ( fontenc [f ]== 0 ) 
    {
      if ( ( fontinfo [ctypebase [f ]+ sp ].hh .v.RH <= jc ) && ( jc <= 
      fontinfo [ctypebase [f ]+ ep ].hh .v.RH ) ) 
      {
	while ( ( sp <= ep ) ) {
	    
	  mp = sp + ( ( ep - sp ) / 2 ) ;
	  if ( jc < fontinfo [ctypebase [f ]+ mp ].hh .v.RH ) 
	  ep = mp - 1 ;
	  else if ( jc > fontinfo [ctypebase [f ]+ mp ].hh .v.RH ) 
	  sp = mp + 1 ;
	  else {
	      
	    Result = fontinfo [ctypebase [f ]+ mp ].hh .lhfield ;
	    return Result ;
	  } 
	} 
      } 
    } 
    else {
	
      while ( ( sp <= ep ) ) if ( jc == fontinfo [ctypebase [f ]+ sp ].hh 
      .v.RH ) 
      {
	Result = fontinfo [ctypebase [f ]+ sp ].hh .lhfield ;
	return Result ;
      } 
      else incr ( sp ) ;
    } 
  } 
  Result = fontinfo [ctypebase [f ]+ 0 ].hh .lhfield ;
  return Result ;
} 
void 
zprintkansuji ( integer n ) 
{
  printkansuji_regmem 
  unsigned char k  ;
  KANJIcode cx  ;
  k = 0 ;
  if ( n < 0 ) 
  return ;
  do {
      dig [k ]= n % 10 ;
    n = n / 10 ;
    incr ( k ) ;
  } while ( ! ( n == 0 ) ) ;
  {
    while ( k > 0 ) {
	
      decr ( k ) ;
      cx = eqtb [78127L + dig [k ]].hh .v.RH ;
      printkanji ( fromDVI ( cx ) ) ;
    } 
  } 
} 
halfword 
zgetinhibitpos ( KANJIcode c , smallnumber n ) 
{
  /* 30 31 */ register halfword Result; getinhibitpos_regmem 
  halfword p, pp, s  ;
  s = calcpos ( c ) ;
  p = s ;
  pp = 10000 ;
  if ( n == 0 ) 
  {
    do {
	if ( eqtb [76079L + p ].hh .v.RH == c ) 
      goto lab30 ;
      if ( eqtb [76079L + p ].hh .v.RH == 0 ) 
      {
	if ( pp != 10000 ) 
	p = pp ;
	goto lab30 ;
      } 
      if ( eqtb [76079L + p ].hh.b0 == 4 ) {
	  
	if ( pp == 10000 ) 
	pp = p ;
      } 
      incr ( p ) ;
      if ( p > 1023 ) 
      p = 0 ;
    } while ( ! ( s == p ) ) ;
    p = pp ;
  } 
  else {
      
    do {
	if ( eqtb [76079L + p ].hh .v.RH == 0 ) 
      goto lab31 ;
      if ( eqtb [76079L + p ].hh .v.RH == c ) 
      goto lab30 ;
      incr ( p ) ;
      if ( p > 1023 ) 
      p = 0 ;
    } while ( ! ( s == p ) ) ;
    lab31: p = 10000 ;
  } 
  lab30: Result = p ;
  return Result ;
} 
halfword 
zgetkinsokupos ( KANJIcode c , smallnumber n ) 
{
  /* 30 31 */ register halfword Result; getkinsokupos_regmem 
  halfword p, pp, s  ;
  s = calcpos ( c ) ;
  p = s ;
  pp = 10000 ;
	;
#ifdef TEXMF_DEBUG
  println () ;
  print ( 1698 ) ;
  printint ( c ) ;
  print ( 1699 ) ;
  printint ( s ) ;
  if ( p + 77103L < 0 ) 
  {
    print ( 1700 ) ;
    println () ;
  } 
#endif /* TEXMF_DEBUG */
  if ( n == 0 ) 
  {
    do {
	if ( eqtb [77103L + p ].hh .v.RH == c ) 
      goto lab30 ;
      if ( eqtb [77103L + p ].hh.b0 == 0 ) 
      {
	if ( pp != 10000 ) 
	p = pp ;
	goto lab30 ;
      } 
      if ( eqtb [77103L + p ].hh.b0 == 3 ) {
	  
	if ( pp == 10000 ) 
	pp = p ;
      } 
      incr ( p ) ;
      if ( p > 1023 ) 
      p = 0 ;
    } while ( ! ( s == p ) ) ;
    p = pp ;
  } 
  else {
      
    do {
	if ( eqtb [77103L + p ].hh.b0 == 0 ) 
      goto lab31 ;
      if ( eqtb [77103L + p ].hh .v.RH == c ) 
      goto lab30 ;
      incr ( p ) ;
      if ( p > 1023 ) 
      p = 0 ;
    } while ( ! ( s == p ) ) ;
    lab31: p = 10000 ;
  } 
  lab30: Result = p ;
  return Result ;
} 
void 
zscansomethinginternal ( smallnumber level , boolean negative ) 
{
  /* 10 20 */ scansomethinginternal_regmem 
  halfword m  ;
  halfword q, r  ;
  halfword tx  ;
  halfword qx  ;
  fourquarters i  ;
  integer p  ;
  lab20: m = curchr ;
  switch ( curcmd ) 
  {case 89 : 
    {
      scanint () ;
      q = getkinsokupos ( curval , 1 ) ;
      curvallevel = 0 ;
      curval = 0 ;
      if ( ( q != 10000 ) && ( m == eqtb [77103L + q ].hh.b0 ) ) 
      {
	curval = eqtb [115238L + q ].cint ;
	curvallevel = 0 ;
      } 
    } 
    break ;
  case 90 : 
    {
      scanint () ;
      q = getinhibitpos ( curval , 1 ) ;
      curvallevel = 0 ;
      curval = 3 ;
      if ( q != 10000 ) 
      curval = eqtb [76079L + q ].hh.b0 ;
      if ( curval > 3 ) 
      curval = 3 ;
    } 
    break ;
  case 91 : 
    {
      scanint () ;
      curvallevel = 0 ;
      if ( ( curval < 0 ) || ( curval > 9 ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1671 ) ;
	} 
	printint ( curval ) ;
	printchar ( 41 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1670 ;
	} 
	error () ;
	return ;
      } 
      else curval = fromDVI ( eqtb [78127L + curval ].hh .v.RH ) ;
    } 
    break ;
  case 98 : 
    {
      if ( m == 113849L ) 
      {
	scanasciinum () ;
	curval1 = eqtb [113849L + curval ].hh .v.RH ;
	if ( ( ( curval1 / 65536L ) > 8 ) || ( ( ( curval1 % 65536L ) / 256 ) 
	> 15 ) ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 759 ) ;
	  } 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 760 ;
	    helpline [0 ]= 761 ;
	  } 
	  interror ( curval1 ) ;
	  {
	    curval = 0 ;
	    curvallevel = 0 ;
	  } 
	} 
	curval1 = ( curval1 / 65536L ) * 4096 + curval1 % 4096 ;
	{
	  curval = curval1 ;
	  curvallevel = 0 ;
	} 
      } 
      else if ( m == ( 113977L ) ) 
      {
	scanasciinum () ;
	curval1 = eqtb [113849L + curval ].hh .v.RH ;
	curval = ( curval1 / 65536L ) * 16777216L + ( ( curval1 / 256 ) % 256 
	) * 65536L + ( curval1 % 256 ) ;
	{
	  curval = curval ;
	  curvallevel = 0 ;
	} 
      } 
      else if ( m == 114701L ) 
      {
	scanasciinum () ;
	curval1 = eqtb [114701L + curval ].cint ;
	curval = getintone ( eqtb [114701L + curval ]) ;
	if ( ( ( curval1 / 256 ) % 256 >= 16 ) || ( curval >= 4096 ) ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 762 ) ;
	  } 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 763 ;
	    helpline [0 ]= 761 ;
	  } 
	  error () ;
	  {
	    curval = 0 ;
	    curvallevel = 0 ;
	  } 
	} 
	else if ( curval1 < 0 ) 
	{
	  curval = curval ;
	  curvallevel = 0 ;
	} 
	else {
	    
	  curval = curval1 * 4096 + curval ;
	  curvallevel = 0 ;
	} 
      } 
      else if ( m == ( 114829L ) ) 
      {
	scanasciinum () ;
	{
	  curval = -1 ;
	  curvallevel = 0 ;
	} 
      } 
      else if ( m == 63663L ) 
      {
	scancharnum () ;
	{
	  curval = eqtb [m + kcatcodekey ( curval ) ].hh .v.RH ;
	  curvallevel = 0 ;
	} 
      } 
      else if ( m < 113849L ) 
      {
	scanlatinnum () ;
	{
	  curval = eqtb [m + curval ].hh .v.RH ;
	  curvallevel = 0 ;
	} 
      } 
      else {
	  
	scanasciinum () ;
	{
	  curval = eqtb [m + curval ].cint ;
	  curvallevel = 0 ;
	} 
      } 
    } 
    break ;
  case 81 : 
  case 82 : 
  case 99 : 
  case 100 : 
  case 101 : 
  case 102 : 
  case 103 : 
    if ( level != 5 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 764 ) ;
      } 
      {
	helpptr = 3 ;
	helpline [2 ]= 765 ;
	helpline [1 ]= 766 ;
	helpline [0 ]= 767 ;
      } 
      backerror () ;
      {
	curval = 0 ;
	curvallevel = 1 ;
      } 
    } 
    else if ( curcmd <= 82 ) 
    {
      if ( curcmd < 82 ) {
	  
	if ( m == membot ) 
	{
	  scanregisternum () ;
	  if ( curval < 256 ) 
	  curval = eqtb [50469L + curval ].hh .v.RH ;
	  else {
	      
	    findsaelement ( 5 , curval , false ) ;
	    if ( curptr == -1073741823L ) 
	    curval = -1073741823L ;
	    else curval = mem [curptr + 1 ].hh .v.RH ;
	  } 
	} 
	else curval = mem [m + 1 ].hh .v.RH ;
      } 
      else curval = eqtb [m ].hh .v.RH ;
      curvallevel = 5 ;
    } 
    else {
	
      backinput () ;
      scanfontident () ;
      {
	curval = 40923L + curval ;
	curvallevel = 4 ;
      } 
    } 
    break ;
  case 83 : 
    {
      curval = eqtb [m ].cint ;
      curvallevel = 0 ;
    } 
    break ;
  case 84 : 
    {
      curval = eqtb [m ].cint ;
      curvallevel = 1 ;
    } 
    break ;
  case 85 : 
    {
      curval = eqtb [m ].hh .v.RH ;
      curvallevel = 2 ;
    } 
    break ;
  case 86 : 
    {
      curval = eqtb [m ].hh .v.RH ;
      curvallevel = 3 ;
    } 
    break ;
  case 92 : 
    if ( abs ( curlist .modefield ) != m ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 784 ) ;
      } 
      printcmdchr ( 92 , m ) ;
      {
	helpptr = 4 ;
	helpline [3 ]= 785 ;
	helpline [2 ]= 786 ;
	helpline [1 ]= 787 ;
	helpline [0 ]= 788 ;
      } 
      error () ;
      if ( level != 5 ) 
      {
	curval = 0 ;
	curvallevel = 1 ;
      } 
      else {
	  
	curval = 0 ;
	curvallevel = 0 ;
      } 
    } 
    else if ( m == 1 ) 
    {
      curval = curlist .auxfield .cint ;
      curvallevel = 1 ;
    } 
    else {
	
      curval = curlist .auxfield .hh .v.LH ;
      curvallevel = 0 ;
    } 
    break ;
  case 93 : 
    if ( curlist .modefield == 0 ) 
    {
      curval = 0 ;
      curvallevel = 0 ;
    } 
    else {
	
      nest [nestptr ]= curlist ;
      p = nestptr ;
      while ( abs ( nest [p ].modefield ) != 1 ) decr ( p ) ;
      {
	curval = nest [p ].pgfield ;
	curvallevel = 0 ;
      } 
    } 
    break ;
  case 95 : 
    {
      if ( m == 0 ) 
      curval = deadcycles ;
      else if ( m == 2 ) 
      curval = interaction ;
      else curval = insertpenalties ;
      curvallevel = 0 ;
    } 
    break ;
  case 94 : 
    {
      if ( ( pagecontents == 0 ) && ( ! outputactive ) ) {
	  
	if ( m == 0 ) 
	curval = 1073741823L ;
	else curval = 0 ;
      } 
      else curval = pagesofar [m ];
      curvallevel = 1 ;
    } 
    break ;
  case 97 : 
    {
      if ( m > 50458L ) 
      {
	scanint () ;
	if ( ( eqtb [m ].hh .v.RH == -1073741823L ) || ( curval < 0 ) ) 
	curval = 0 ;
	else {
	    
	  if ( curval > mem [eqtb [m ].hh .v.RH + 1 ].cint ) 
	  curval = mem [eqtb [m ].hh .v.RH + 1 ].cint ;
	  curval = mem [eqtb [m ].hh .v.RH + curval + 1 ].cint ;
	} 
      } 
      else if ( eqtb [50458L ].hh .v.RH == -1073741823L ) 
      curval = 0 ;
      else curval = mem [eqtb [50458L ].hh .v.RH ].hh .v.LH ;
      curvallevel = 0 ;
    } 
    break ;
  case 96 : 
    {
      scanregisternum () ;
      if ( curval < 256 ) 
      q = eqtb [50729L + curval ].hh .v.RH ;
      else {
	  
	findsaelement ( 4 , curval , false ) ;
	if ( curptr == -1073741823L ) 
	q = -1073741823L ;
	else q = mem [curptr + 1 ].hh .v.RH ;
      } 
      if ( q == -1073741823L ) 
      curval = 0 ;
      else {
	  
	qx = q ;
	while ( ( q != -1073741823L ) && ( abs ( ( ( mem [q ].hh.b1 ) % 16 - 
	5 ) ) != abs ( curlist .dirfield ) ) ) q = mem [q ].hh .v.RH ;
	if ( q == -1073741823L ) 
	{
	  r = mem [qx ].hh .v.RH ;
	  mem [qx ].hh .v.RH = -1073741823L ;
	  q = newdirnode ( qx , abs ( curlist .dirfield ) ) ;
	  mem [qx ].hh .v.RH = r ;
	  curval = mem [q + m ].cint ;
	  deleteglueref ( mem [q + 7 ].hh .v.RH ) ;
	  deleteglueref ( mem [q + 7 ].hh .v.LH ) ;
	  freenode ( q , 10 ) ;
	} 
	else curval = mem [q + m ].cint ;
      } 
      curvallevel = 1 ;
    } 
    break ;
  case 75 : 
  case 77 : 
  case 74 : 
  case 76 : 
    {
      curval = curchr ;
      curvallevel = 0 ;
    } 
    break ;
  case 87 : 
    {
      findfontdimen ( false ) ;
      fontinfo [fmemptr ].cint = 0 ;
      {
	curval = fontinfo [curval ].cint ;
	curvallevel = 1 ;
      } 
    } 
    break ;
  case 88 : 
    {
      scanfontident () ;
      if ( m == 0 ) 
      {
	curval = hyphenchar [curval ];
	curvallevel = 0 ;
      } 
      else {
	  
	curval = skewchar [curval ];
	curvallevel = 0 ;
      } 
    } 
    break ;
  case 104 : 
    {
      if ( ( m < membot ) || ( m > membot + 23 ) ) 
      {
	curvallevel = ( mem [m ].hh.b0 / 16 ) ;
	if ( curvallevel < 2 ) 
	curval = mem [m + 2 ].cint ;
	else curval = mem [m + 1 ].hh .v.RH ;
      } 
      else {
	  
	scanregisternum () ;
	curvallevel = m - membot ;
	if ( curval > 255 ) 
	{
	  findsaelement ( curvallevel , curval , false ) ;
	  if ( curptr == -1073741823L ) {
	      
	    if ( curvallevel < 2 ) 
	    curval = 0 ;
	    else curval = membot ;
	  } 
	  else if ( curvallevel < 2 ) 
	  curval = mem [curptr + 2 ].cint ;
	  else curval = mem [curptr + 1 ].hh .v.RH ;
	} 
	else switch ( curvallevel ) 
	{case 0 : 
	  curval = eqtb [114445L + curval ].cint ;
	  break ;
	case 1 : 
	  curval = eqtb [114982L + curval ].cint ;
	  break ;
	case 2 : 
	  curval = eqtb [49946L + curval ].hh .v.RH ;
	  break ;
	case 3 : 
	  curval = eqtb [50202L + curval ].hh .v.RH ;
	  break ;
	} 
      } 
    } 
    break ;
  case 78 : 
    if ( m >= 7 ) {
	
      if ( m >= 38 ) 
      {
	if ( m < 39 ) 
	{
	  switch ( m ) 
	  {case 38 : 
	    scanmuglue () ;
	    break ;
	  } 
	  curvallevel = 2 ;
	} 
	else if ( m < 40 ) 
	{
	  switch ( m ) 
	  {case 39 : 
	    scannormalglue () ;
	    break ;
	  } 
	  curvallevel = 3 ;
	} 
	else {
	    
	  curvallevel = m - 40 ;
	  scanexpr () ;
	} 
	while ( curvallevel > level ) {
	    
	  if ( curvallevel == 2 ) 
	  {
	    m = curval ;
	    curval = mem [m + 1 ].cint ;
	    deleteglueref ( m ) ;
	  } 
	  else if ( curvallevel == 3 ) 
	  muerror () ;
	  decr ( curvallevel ) ;
	} 
	if ( negative ) {
	    
	  if ( curvallevel >= 2 ) 
	  {
	    m = curval ;
	    curval = newspec ( m ) ;
	    deleteglueref ( m ) ;
	    {
	      mem [curval + 1 ].cint = - (integer) mem [curval + 1 ].cint 
	      ;
	      mem [curval + 2 ].cint = - (integer) mem [curval + 2 ].cint 
	      ;
	      mem [curval + 3 ].cint = - (integer) mem [curval + 3 ].cint 
	      ;
	    } 
	  } 
	  else curval = - (integer) curval ;
	} 
	return ;
      } 
      else if ( m >= 29 ) 
      {
	switch ( m ) 
	{case 29 : 
	case 30 : 
	case 31 : 
	case 32 : 
	  {
	    scanfontident () ;
	    q = curval ;
	    if ( fontdir [q ]!= 0 ) 
	    {
	      scanint () ;
	      if ( curval >= 0 ) 
	      {
		if ( ischarkanji ( curval ) ) 
		curval = getjfmpos ( curval , q ) ;
		else curval = -1 ;
	      } 
	      else {
		  
		curval = - (integer) ( curval + 1 ) ;
		if ( ( fontbc [q ]> curval ) || ( fontec [q ]< curval ) ) 
		curval = -1 ;
	      } 
	      if ( curval != -1 ) 
	      {
		i = fontinfo [charbase [q ]+ curval ].qqqq ;
		switch ( m ) 
		{case 29 : 
		  curval = fontinfo [widthbase [q ]+ i .b0 ].cint ;
		  break ;
		case 30 : 
		  curval = fontinfo [heightbase [q ]+ ( i .b1 ) / 256 ]
		  .cint ;
		  break ;
		case 31 : 
		  curval = fontinfo [depthbase [q ]+ ( i .b1 ) % 256 ]
		  .cint ;
		  break ;
		case 32 : 
		  curval = fontinfo [italicbase [q ]+ ( i .b2 ) / 256 ]
		  .cint ;
		  break ;
		} 
	      } 
	      else curval = 0 ;
	    } 
	    else {
		
	      scanlatinnum () ;
	      if ( ( fontbc [q ]<= curval ) && ( fontec [q ]>= curval ) ) 
	      {
		i = fontinfo [charbase [q ]+ curval ].qqqq ;
		switch ( m ) 
		{case 29 : 
		  curval = fontinfo [widthbase [q ]+ i .b0 ].cint ;
		  break ;
		case 30 : 
		  curval = fontinfo [heightbase [q ]+ ( i .b1 ) / 256 ]
		  .cint ;
		  break ;
		case 31 : 
		  curval = fontinfo [depthbase [q ]+ ( i .b1 ) % 256 ]
		  .cint ;
		  break ;
		case 32 : 
		  curval = fontinfo [italicbase [q ]+ ( i .b2 ) / 256 ]
		  .cint ;
		  break ;
		} 
	      } 
	      else curval = 0 ;
	    } 
	  } 
	  break ;
	case 33 : 
	case 34 : 
	case 35 : 
	  {
	    q = curchr - 33 ;
	    scanint () ;
	    if ( ( eqtb [50458L ].hh .v.RH == -1073741823L ) || ( curval <= 
	    0 ) ) 
	    curval = 0 ;
	    else {
		
	      if ( q == 2 ) 
	      {
		q = curval % 2 ;
		curval = ( curval + q ) / 2 ;
	      } 
	      if ( curval > mem [eqtb [50458L ].hh .v.RH ].hh .v.LH ) 
	      curval = mem [eqtb [50458L ].hh .v.RH ].hh .v.LH ;
	      curval = mem [eqtb [50458L ].hh .v.RH + 2 * curval - q ]
	      .cint ;
	    } 
	    curvallevel = 1 ;
	  } 
	  break ;
	case 36 : 
	case 37 : 
	  {
	    scannormalglue () ;
	    q = curval ;
	    if ( m == 36 ) 
	    curval = mem [q + 2 ].cint ;
	    else curval = mem [q + 3 ].cint ;
	    deleteglueref ( q ) ;
	  } 
	  break ;
	} 
	curvallevel = 1 ;
      } 
      else {
	  
	switch ( m ) 
	{case 7 : 
	  curval = line ;
	  break ;
	case 8 : 
	  curval = lastbadness ;
	  break ;
	case 9 : 
	  curval = 4 ;
	  break ;
	case 10 : 
	  curval = 2 ;
	  break ;
	case 11 : 
	  curval = 251130L ;
	  break ;
	case 12 : 
	  curval = 1 ;
	  break ;
	case 18 : 
	  curval = 2 ;
	  break ;
	case 13 : 
	  curval = pdflastxpos ;
	  break ;
	case 14 : 
	  curval = pdflastypos ;
	  break ;
	case 15 : 
	  {
	    if ( shellenabledp ) 
	    {
	      if ( restrictedshell ) 
	      curval = 2 ;
	      else curval = 1 ;
	    } 
	    else curval = 0 ;
	  } 
	  break ;
	case 16 : 
	  curval = getmicrointerval () ;
	  break ;
	case 17 : 
	  curval = randomseed ;
	  break ;
	case 19 : 
	  curval = curlevel - 1 ;
	  break ;
	case 20 : 
	  curval = curgroup ;
	  break ;
	case 21 : 
	  {
	    q = condptr ;
	    curval = 0 ;
	    while ( q != -1073741823L ) {
		
	      incr ( curval ) ;
	      q = mem [q ].hh .v.RH ;
	    } 
	  } 
	  break ;
	case 22 : 
	  if ( condptr == -1073741823L ) 
	  curval = 0 ;
	  else if ( curif < 32 ) 
	  curval = curif + 1 ;
	  else curval = - (integer) ( curif - 31 ) ;
	  break ;
	case 23 : 
	  if ( ( iflimit == 4 ) || ( iflimit == 3 ) ) 
	  curval = 1 ;
	  else if ( iflimit == 2 ) 
	  curval = -1 ;
	  else curval = 0 ;
	  break ;
	case 24 : 
	case 25 : 
	  {
	    scannormalglue () ;
	    q = curval ;
	    if ( m == 24 ) 
	    curval = mem [q ].hh.b0 ;
	    else curval = mem [q ].hh.b1 ;
	    if ( curval > 0 ) 
	    curval = curval - 1 ;
	    deleteglueref ( q ) ;
	  } 
	  break ;
	case 26 : 
	  curval = eqtb [51756L ].hh .v.RH ;
	  break ;
	case 27 : 
	  curval = eqtb [51757L ].hh .v.RH ;
	  break ;
	case 28 : 
	  curval = eqtb [51758L ].hh .v.RH ;
	  break ;
	} 
	curvallevel = 0 ;
      } 
    } 
    else {
	
      if ( curchr == 2 ) 
      curval = membot ;
      else curval = 0 ;
      tx = curlist .tailfield ;
      if ( ! ( tx >= himemmin ) ) {
	  
	if ( mem [tx ].hh.b0 == 5 ) 
	tx = curlist .pnodefield ;
      } 
      if ( ! ( tx >= himemmin ) ) {
	  
	if ( ( mem [tx ].hh.b0 == 5 ) || ( ( mem [tx ].hh.b0 == 11 ) && ( 
	mem [tx ].hh.b1 == 3 ) ) ) 
	{
	  r = curlist .headfield ;
	  q = mem [curlist .headfield ].hh .v.RH ;
	  while ( q != tx ) {
	      
	    if ( ( q >= himemmin ) ) 
	    r = q ;
	    else if ( ( mem [q ].hh.b0 != 5 ) && ( ( mem [q ].hh.b0 != 11 
	    ) || ( mem [q ].hh.b1 != 3 ) ) ) 
	    r = q ;
	    q = mem [q ].hh .v.RH ;
	  } 
	  tx = r ;
	} 
      } 
      if ( ( curchr == 3 ) || ( curchr == 4 ) ) 
      {
	curvallevel = 0 ;
	if ( ( tx == curlist .headfield ) || ( curlist .modefield == 0 ) ) 
	curval = -1 ;
      } 
      else if ( curchr == 5 ) 
      {
	curvallevel = 0 ;
	curval = -1 ;
      } 
      else if ( curchr == 6 ) 
      {
	if ( level != 5 ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 764 ) ;
	  } 
	  {
	    helpptr = 3 ;
	    helpline [2 ]= 765 ;
	    helpline [1 ]= 766 ;
	    helpline [0 ]= 767 ;
	  } 
	  backerror () ;
	  {
	    curval = 0 ;
	    curvallevel = 1 ;
	  } 
	} 
	else {
	    
	  curval = 40923L ;
	  curvallevel = 4 ;
	} 
      } 
      else curvallevel = curchr ;
      if ( ( curchr == 5 ) || ( curchr == 6 ) ) {
	  
	if ( ( tx >= himemmin ) && ( tx != curlist .headfield ) ) 
	{
	  r = curlist .headfield ;
	  q = curlist .headfield ;
	  while ( q != tx ) {
	      
	    r = q ;
	    q = mem [q ].hh .v.RH ;
	  } 
	  if ( ( r != curlist .headfield ) && ( r >= himemmin ) ) {
	      
	    if ( fontdir [mem [r ].hh.b0 ]!= 0 ) 
	    tx = r ;
	  } 
	  if ( curchr == 5 ) {
	      
	    if ( fontdir [mem [tx ].hh.b0 ]!= 0 ) 
	    curval = mem [mem [tx ].hh .v.RH ].hh .v.LH % 16777216L ;
	    else curval = mem [tx ].hh.b1 ;
	  } 
	  else curval = mem [tx ].hh.b0 + 40923L ;
	} 
      } 
      if ( ! ( tx >= himemmin ) && ( tx != curlist .headfield ) && ( curlist 
      .modefield != 0 ) ) 
      switch ( curchr ) 
      {case 0 : 
	if ( mem [tx ].hh.b0 == 14 ) 
	curval = mem [tx + 1 ].cint ;
	break ;
      case 1 : 
	if ( mem [tx ].hh.b0 == 13 ) 
	curval = mem [tx + 1 ].cint ;
	break ;
      case 2 : 
	if ( mem [tx ].hh.b0 == 12 ) 
	{
	  curval = mem [tx + 1 ].hh .v.LH ;
	  if ( mem [tx ].hh.b1 == 99 ) 
	  curvallevel = 3 ;
	} 
	break ;
      case 3 : 
	if ( mem [tx ].hh.b0 <= 15 ) 
	{
	  if ( mem [tx ].hh.b0 == 2 ) 
	  tx = mem [tx + 5 ].hh .v.RH ;
	  curval = mem [tx ].hh.b0 ;
	  if ( curval < 2 ) 
	  curval = curval + 1 ;
	  else if ( curval > 5 ) 
	  curval = curval - 1 ;
	} 
	else curval = 15 ;
	break ;
      case 4 : 
	if ( mem [tx ].hh.b0 <= 15 ) 
	curval = mem [tx ].hh.b1 ;
	else {
	    
	  curval = mem [tx ].hh.b0 ;
	  if ( curval < 19 ) 
	  curval = curval - 16 ;
	  else if ( curval == 19 ) 
	  curval = curval - 16 + mem [tx ].hh.b1 ;
	  else curval = curval - 14 ;
	} 
	break ;
      case 5 : 
	{
	  {
	    if ( ( ( mem [tx ].hh.b0 == 12 ) && ( mem [tx ].hh.b1 == 21 ) 
	    ) || ( ( mem [tx ].hh.b0 == 14 ) && ( mem [tx ].hh.b1 == 2 ) ) 
	    ) 
	    tx = curlist .lastjchrfield ;
	    else if ( ( mem [tx ].hh.b0 == 13 ) && ( mem [tx ].hh.b1 == 0 
	    ) ) 
	    {
	      r = curlist .headfield ;
	      q = mem [curlist .headfield ].hh .v.RH ;
	      while ( q != tx ) {
		  
		r = q ;
		if ( ( q >= himemmin ) ) {
		    
		  if ( fontdir [mem [q ].hh.b0 ]!= 0 ) 
		  q = mem [q ].hh .v.RH ;
		} 
		q = mem [q ].hh .v.RH ;
	      } 
	      if ( ( ( mem [r ].hh.b0 == 14 ) && ( mem [r ].hh.b1 == 2 ) ) 
	      ) 
	      tx = curlist .lastjchrfield ;
	      else tx = r ;
	    } 
	  } 
	  if ( ( tx >= himemmin ) ) {
	      
	    if ( fontdir [mem [tx ].hh.b0 ]!= 0 ) 
	    curval = mem [mem [tx ].hh .v.RH ].hh .v.LH % 16777216L ;
	    else curval = mem [tx ].hh.b1 ;
	  } 
	  else if ( mem [tx ].hh.b0 == 8 ) 
	  {
	    r = mem [tx + 1 ].hh .v.RH ;
	    while ( mem [r ].hh .v.RH != -1073741823L ) r = mem [r ].hh 
	    .v.RH ;
	    curval = mem [r ].hh.b1 ;
	  } 
	} 
	break ;
      case 6 : 
	{
	  {
	    if ( ( ( mem [tx ].hh.b0 == 12 ) && ( mem [tx ].hh.b1 == 21 ) 
	    ) || ( ( mem [tx ].hh.b0 == 14 ) && ( mem [tx ].hh.b1 == 2 ) ) 
	    ) 
	    tx = curlist .lastjchrfield ;
	    else if ( ( mem [tx ].hh.b0 == 13 ) && ( mem [tx ].hh.b1 == 0 
	    ) ) 
	    {
	      r = curlist .headfield ;
	      q = mem [curlist .headfield ].hh .v.RH ;
	      while ( q != tx ) {
		  
		r = q ;
		if ( ( q >= himemmin ) ) {
		    
		  if ( fontdir [mem [q ].hh.b0 ]!= 0 ) 
		  q = mem [q ].hh .v.RH ;
		} 
		q = mem [q ].hh .v.RH ;
	      } 
	      if ( ( ( mem [r ].hh.b0 == 14 ) && ( mem [r ].hh.b1 == 2 ) ) 
	      ) 
	      tx = curlist .lastjchrfield ;
	      else tx = r ;
	    } 
	  } 
	  if ( ( tx >= himemmin ) ) 
	  curval = mem [tx ].hh.b0 + 40923L ;
	  else if ( mem [tx ].hh.b0 == 8 ) 
	  curval = mem [tx + 1 ].hh.b0 + 40923L ;
	} 
	break ;
      } 
      else if ( ( curlist .modefield == 1 ) && ( tx == curlist .headfield ) ) 
      switch ( curchr ) 
      {case 0 : 
	curval = lastpenalty ;
	break ;
      case 1 : 
	curval = lastkern ;
	break ;
      case 2 : 
	if ( lastglue != 1073741823L ) 
	curval = lastglue ;
	break ;
      case 3 : 
	curval = lastnodetype ;
	break ;
      case 4 : 
	curval = lastnodesubtype ;
	break ;
      } 
    } 
    break ;
  case 45 : 
    if ( curchr == 1 ) 
    {
      gettoken () ;
      if ( curcs < 23810 ) 
      curcs = primlookup ( curcs - 11905 ) ;
      else curcs = primlookup ( hash [curcs ].v.RH ) ;
      if ( curcs != 0 ) 
      {
	curcmd = eqtb [38822L + curcs ].hh.b0 ;
	curchr = eqtb [38822L + curcs ].hh .v.RH ;
	curcs = 38822L + curcs ;
	curtok = 536870911L + curcs ;
      } 
      else {
	  
	curcmd = 0 ;
	curchr = 0 ;
	curtok = 536909728L ;
	curcs = 38817L ;
      } 
      goto lab20 ;
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
	print ( 789 ) ;
      } 
      printcmdchr ( curcmd , curchr ) ;
      print ( 790 ) ;
      printesc ( 609 ) ;
      {
	helpptr = 1 ;
	helpline [0 ]= 788 ;
      } 
      error () ;
      if ( level != 5 ) 
      {
	curval = 0 ;
	curvallevel = 1 ;
      } 
      else {
	  
	curval = 0 ;
	curvallevel = 0 ;
      } 
    } 
    break ;
  } 
  while ( curvallevel > level ) {
      
    if ( curvallevel == 2 ) 
    curval = mem [curval + 1 ].cint ;
    else if ( curvallevel == 3 ) 
    muerror () ;
    decr ( curvallevel ) ;
  } 
  if ( negative ) {
      
    if ( curvallevel >= 2 ) 
    {
      curval = newspec ( curval ) ;
      {
	mem [curval + 1 ].cint = - (integer) mem [curval + 1 ].cint ;
	mem [curval + 2 ].cint = - (integer) mem [curval + 2 ].cint ;
	mem [curval + 3 ].cint = - (integer) mem [curval + 3 ].cint ;
      } 
    } 
    else curval = - (integer) curval ;
  } 
  else if ( ( curvallevel >= 2 ) && ( curvallevel <= 3 ) ) 
  incr ( mem [curval ].hh .v.RH ) ;
} 
void 
scansomethinginternalident ( void ) 
{
  scansomethinginternalident_regmem 
  scansomethinginternal ( 4 , false ) ;
} 
void 
scanint ( void ) 
{
  /* 30 20 */ scanint_regmem 
  boolean negative  ;
  integer m  ;
  smallnumber d  ;
  boolean vacuous  ;
  boolean OKsofar  ;
  radix = 0 ;
  OKsofar = true ;
  negative = false ;
  do {
      do { getxtoken () ;
    } while ( ! ( curcmd != 10 ) ) ;
    if ( curtok == 786477L ) 
    {
      negative = ! negative ;
      curtok = 786475L ;
    } 
  } while ( ! ( curtok != 786475L ) ) ;
  lab20: if ( curtok == 786528L ) 
  {
    gettoken () ;
    if ( curtok < 536870911L ) {
	
      if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
      {
	skipmode = false ;
	curval = curchr ;
      } 
      else {
	  
	curval = curchr ;
	if ( curcmd <= 2 ) {
	    
	  if ( curcmd == 2 ) 
	  incr ( alignstate ) ;
	  else decr ( alignstate ) ;
	} 
      } 
    } 
    else if ( curtok < 536882816L ) 
    curval = curtok - 536870912L ;
    else if ( curtok < 536894720L ) 
    curval = curtok - 536882816L ;
    else {
	
      m = hash [curtok - 536870911L ].v.RH ;
      if ( strstart [m + 1 ]- strstart [m ]== multistrlenshort ( strpool , 
      strstart [m + 1 ], strstart [m ]) ) 
      curval = fromBUFFshort ( strpool , strstart [m + 1 ], strstart [m ]) 
      ;
      else {
	  
	curcmd = 15 ;
	curval = 16777216L ;
      } 
    } 
    if ( ( curval >= 11904 ) && ( curcmd < 16 ) ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 807 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 808 ;
	helpline [0 ]= 809 ;
      } 
      curval = 48 ;
      backerror () ;
    } 
    else {
	
      getxtoken () ;
      if ( curcmd != 10 ) 
      backinput () ;
    } 
    skipmode = true ;
  } 
  else if ( curtok == 536909732L ) 
  {
    gettoken () ;
    if ( curcs < 23810 ) 
    curcs = primlookup ( curcs - 11905 ) ;
    else curcs = primlookup ( hash [curcs ].v.RH ) ;
    if ( curcs != 0 ) 
    {
      curcmd = eqtb [38822L + curcs ].hh.b0 ;
      curchr = eqtb [38822L + curcs ].hh .v.RH ;
      curcs = 38822L + curcs ;
      curtok = 536870911L + curcs ;
    } 
    else {
	
      curcmd = 0 ;
      curchr = 0 ;
      curtok = 536909728L ;
      curcs = 38817L ;
    } 
    goto lab20 ;
  } 
  else if ( ( curcmd >= 74 ) && ( curcmd <= 104 ) ) 
  scansomethinginternal ( 0 , false ) ;
  else {
      
    radix = 10 ;
    m = 214748364L ;
    if ( curtok == 786471L ) 
    {
      radix = 8 ;
      m = 268435456L ;
      getxtoken () ;
    } 
    else if ( curtok == 786466L ) 
    {
      radix = 16 ;
      m = 134217728L ;
      getxtoken () ;
    } 
    vacuous = true ;
    curval = 0 ;
    while ( true ) {
	
      if ( ( curtok < 786480L + radix ) && ( curtok >= 786480L ) && ( curtok 
      <= 786489L ) ) 
      d = curtok - 786480L ;
      else if ( radix == 16 ) {
	  
	if ( ( curtok <= 720966L ) && ( curtok >= 720961L ) ) 
	d = curtok - 720951L ;
	else if ( ( curtok <= 786502L ) && ( curtok >= 786497L ) ) 
	d = curtok - 786487L ;
	else goto lab30 ;
      } 
      else goto lab30 ;
      vacuous = false ;
      if ( ( curval >= m ) && ( ( curval > m ) || ( d > 7 ) || ( radix != 10 ) 
      ) ) 
      {
	if ( OKsofar ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 810 ) ;
	  } 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 811 ;
	    helpline [0 ]= 812 ;
	  } 
	  error () ;
	  curval = 2147483647L ;
	  OKsofar = false ;
	} 
      } 
      else curval = curval * radix + d ;
      getxtoken () ;
    } 
    lab30: ;
    if ( vacuous ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 764 ) ;
      } 
      {
	helpptr = 3 ;
	helpline [2 ]= 765 ;
	helpline [1 ]= 766 ;
	helpline [0 ]= 767 ;
      } 
      backerror () ;
    } 
    else if ( curcmd != 10 ) 
    backinput () ;
  } 
  if ( negative ) 
  curval = - (integer) curval ;
} 
void 
zscandimen ( boolean mu , boolean inf , boolean shortcut ) 
{
  /* 30 31 32 40 45 88 89 */ scandimen_regmem 
  boolean negative  ;
  integer f  ;
  integer num, denom  ;
  smallnumber k, kk  ;
  halfword p, q  ;
  scaled v  ;
  integer savecurval  ;
  sixteenbits t  ;
  f = 0 ;
  aritherror = false ;
  curorder = 0 ;
  negative = false ;
  if ( ! shortcut ) 
  {
    negative = false ;
    do {
	do { getxtoken () ;
      } while ( ! ( curcmd != 10 ) ) ;
      if ( curtok == 786477L ) 
      {
	negative = ! negative ;
	curtok = 786475L ;
      } 
    } while ( ! ( curtok != 786475L ) ) ;
    if ( ( curcmd >= 74 ) && ( curcmd <= 104 ) ) {
	
      if ( mu ) 
      {
	scansomethinginternal ( 3 , false ) ;
	if ( curvallevel != 0 ) 
	{
	  if ( curvallevel >= 2 ) 
	  {
	    v = mem [curval + 1 ].cint ;
	    deleteglueref ( curval ) ;
	    curval = v ;
	  } 
	  if ( curvallevel != 3 ) 
	  muerror () ;
	  goto lab89 ;
	} 
      } 
      else {
	  
	scansomethinginternal ( 1 , false ) ;
	if ( curvallevel == 1 ) 
	goto lab89 ;
      } 
    } 
    else {
	
      backinput () ;
      if ( curtok == 786476L ) 
      curtok = 786478L ;
      if ( curtok != 786478L ) 
      scanint () ;
      else {
	  
	radix = 10 ;
	curval = 0 ;
      } 
      if ( curtok == 786476L ) 
      curtok = 786478L ;
      if ( ( radix == 10 ) && ( curtok == 786478L ) ) 
      {
	k = 0 ;
	p = -1073741823L ;
	gettoken () ;
	while ( true ) {
	    
	  getxtoken () ;
	  if ( ( curtok > 786489L ) || ( curtok < 786480L ) ) 
	  goto lab31 ;
	  if ( k < 17 ) 
	  {
	    q = getavail () ;
	    mem [q ].hh .v.RH = p ;
	    mem [q ].hh .v.LH = curtok - 786480L ;
	    p = q ;
	    incr ( k ) ;
	  } 
	} 
	lab31: {
	    register integer for_end; kk = k ;for_end = 1 ; if ( kk >= 
	for_end) do 
	  {
	    dig [kk - 1 ]= mem [p ].hh .v.LH ;
	    q = p ;
	    p = mem [p ].hh .v.RH ;
	    {
	      mem [q ].hh .v.RH = avail ;
	      avail = q ;
	;
#ifdef STAT
	      decr ( dynused ) ;
#endif /* STAT */
	    } 
	  } 
	while ( kk-- > for_end ) ;} 
	f = rounddecimals ( k ) ;
	if ( curcmd != 10 ) 
	backinput () ;
      } 
    } 
  } 
  if ( curval < 0 ) 
  {
    negative = ! negative ;
    curval = - (integer) curval ;
  } 
  if ( inf ) {
      
    if ( scankeyword ( 321 ) ) 
    {
      curorder = 1 ;
      while ( scankeyword ( 108 ) ) {
	  
	if ( curorder == 4 ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 814 ) ;
	  } 
	  print ( 815 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 816 ;
	  } 
	  error () ;
	} 
	else incr ( curorder ) ;
      } 
      goto lab88 ;
    } 
  } 
  savecurval = curval ;
  do {
      getxtoken () ;
  } while ( ! ( curcmd != 10 ) ) ;
  if ( ( curcmd < 74 ) || ( curcmd > 104 ) ) 
  backinput () ;
  else {
      
    if ( mu ) 
    {
      scansomethinginternal ( 3 , false ) ;
      if ( curvallevel >= 2 ) 
      {
	v = mem [curval + 1 ].cint ;
	deleteglueref ( curval ) ;
	curval = v ;
      } 
      if ( curvallevel != 3 ) 
      muerror () ;
    } 
    else scansomethinginternal ( 1 , false ) ;
    v = curval ;
    goto lab40 ;
  } 
  if ( mu ) 
  goto lab45 ;
  if ( scankeyword ( 817 ) ) 
  v = ( fontinfo [6 + parambase [eqtb [50985L ].hh .v.RH ]].cint ) ;
  else if ( scankeyword ( 818 ) ) 
  v = ( fontinfo [5 + parambase [eqtb [50985L ].hh .v.RH ]].cint ) ;
  else if ( scankeyword ( 819 ) ) {
      
    if ( curlist .dirfield == 3 ) 
    v = fontinfo [widthbase [eqtb [51755L ].hh .v.RH ]+ fontinfo [
    charbase [eqtb [51755L ].hh .v.RH ]+ 0 ].qqqq .b0 ].cint ;
    else v = fontinfo [widthbase [eqtb [51754L ].hh .v.RH ]+ fontinfo [
    charbase [eqtb [51754L ].hh .v.RH ]+ 0 ].qqqq .b0 ].cint ;
  } 
  else if ( scankeyword ( 820 ) ) {
      
    if ( curlist .dirfield == 3 ) 
    {
      t = fontinfo [charbase [eqtb [51755L ].hh .v.RH ]+ 0 ].qqqq .b1 ;
      v = fontinfo [heightbase [eqtb [51755L ].hh .v.RH ]+ ( t ) / 256 ]
      .cint + fontinfo [depthbase [eqtb [51755L ].hh .v.RH ]+ ( t ) % 256 
      ].cint ;
    } 
    else {
	
      t = fontinfo [charbase [eqtb [51754L ].hh .v.RH ]+ 0 ].qqqq .b1 ;
      v = fontinfo [heightbase [eqtb [51754L ].hh .v.RH ]+ ( t ) / 256 ]
      .cint + fontinfo [depthbase [eqtb [51754L ].hh .v.RH ]+ ( t ) % 256 
      ].cint ;
    } 
  } 
  else goto lab45 ;
  {
    getxtoken () ;
    if ( curcmd != 10 ) 
    backinput () ;
  } 
  lab40: curval = multandadd ( savecurval , v , xnoverd ( v , f , 65536L ) , 
  1073741823L ) ;
  goto lab89 ;
  lab45: ;
  if ( mu ) {
      
    if ( scankeyword ( 348 ) ) 
    goto lab88 ;
    else {
	
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 814 ) ;
      } 
      print ( 821 ) ;
      {
	helpptr = 4 ;
	helpline [3 ]= 822 ;
	helpline [2 ]= 823 ;
	helpline [1 ]= 824 ;
	helpline [0 ]= 825 ;
      } 
      error () ;
      goto lab88 ;
    } 
  } 
  if ( scankeyword ( 813 ) ) 
  {
    preparemag () ;
    if ( eqtb [114378L ].cint != 1000 ) 
    {
      curval = xnoverd ( curval , 1000 , eqtb [114378L ].cint ) ;
      f = ( 1000 * f + 65536L * texremainder ) / eqtb [114378L ].cint ;
      curval = curval + ( f / 65536L ) ;
      f = f % 65536L ;
    } 
  } 
  if ( scankeyword ( 425 ) ) 
  goto lab88 ;
  if ( scankeyword ( 826 ) ) 
  {
    num = 7227 ;
    denom = 100 ;
  } 
  else if ( scankeyword ( 827 ) ) 
  {
    num = 12 ;
    denom = 1 ;
  } 
  else if ( scankeyword ( 828 ) ) 
  {
    num = 7227 ;
    denom = 254 ;
  } 
  else if ( scankeyword ( 829 ) ) 
  {
    num = 7227 ;
    denom = 2540 ;
  } 
  else if ( scankeyword ( 830 ) ) 
  {
    num = 7227 ;
    denom = 7200 ;
  } 
  else if ( scankeyword ( 831 ) ) 
  {
    num = 1238 ;
    denom = 1157 ;
  } 
  else if ( scankeyword ( 832 ) ) 
  {
    num = 14856 ;
    denom = 1157 ;
  } 
  else if ( scankeyword ( 72 ) ) 
  {
    num = 7227 ;
    denom = 10160 ;
  } 
  else if ( scankeyword ( 81 ) ) 
  {
    num = 7227 ;
    denom = 10160 ;
  } 
  else if ( scankeyword ( 833 ) ) 
  goto lab30 ;
  else {
      
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 814 ) ;
    } 
    print ( 834 ) ;
    {
      helpptr = 6 ;
      helpline [5 ]= 835 ;
      helpline [4 ]= 836 ;
      helpline [3 ]= 837 ;
      helpline [2 ]= 823 ;
      helpline [1 ]= 824 ;
      helpline [0 ]= 825 ;
    } 
    error () ;
    goto lab32 ;
  } 
  curval = xnoverd ( curval , num , denom ) ;
  f = ( num * f + 65536L * texremainder ) / denom ;
  curval = curval + ( f / 65536L ) ;
  f = f % 65536L ;
  lab32: ;
  lab88: if ( curval >= 16384 ) 
  aritherror = true ;
  else curval = curval * 65536L + f ;
  lab30: ;
  {
    getxtoken () ;
    if ( curcmd != 10 ) 
    backinput () ;
  } 
  lab89: if ( aritherror || ( abs ( curval ) >= 1073741824L ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 838 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 839 ;
      helpline [0 ]= 840 ;
    } 
    error () ;
    curval = 1073741823L ;
    aritherror = false ;
  } 
  if ( negative ) 
  curval = - (integer) curval ;
} 
void 
zscanglue ( smallnumber level ) 
{
  /* 10 */ scanglue_regmem 
  boolean negative  ;
  halfword q  ;
  boolean mu  ;
  mu = ( level == 3 ) ;
  negative = false ;
  do {
      do { getxtoken () ;
    } while ( ! ( curcmd != 10 ) ) ;
    if ( curtok == 786477L ) 
    {
      negative = ! negative ;
      curtok = 786475L ;
    } 
  } while ( ! ( curtok != 786475L ) ) ;
  if ( ( curcmd >= 74 ) && ( curcmd <= 104 ) ) 
  {
    scansomethinginternal ( level , negative ) ;
    if ( curvallevel >= 2 ) 
    {
      if ( curvallevel != level ) 
      muerror () ;
      return ;
    } 
    if ( curvallevel == 0 ) 
    scandimen ( mu , false , true ) ;
    else if ( level == 3 ) 
    muerror () ;
  } 
  else {
      
    backinput () ;
    scandimen ( mu , false , false ) ;
    if ( negative ) 
    curval = - (integer) curval ;
  } 
  q = newspec ( membot ) ;
  mem [q + 1 ].cint = curval ;
  if ( scankeyword ( 841 ) ) 
  {
    scandimen ( mu , true , false ) ;
    mem [q + 2 ].cint = curval ;
    mem [q ].hh.b0 = curorder ;
  } 
  if ( scankeyword ( 842 ) ) 
  {
    scandimen ( mu , true , false ) ;
    mem [q + 3 ].cint = curval ;
    mem [q ].hh.b1 = curorder ;
  } 
  curval = q ;
} 
integer 
zaddorsub ( integer x , integer y , integer maxanswer , boolean negative ) 
{
  register integer Result; addorsub_regmem 
  integer a  ;
  if ( negative ) 
  y = - (integer) y ;
  if ( x >= 0 ) {
      
    if ( y <= maxanswer - x ) 
    a = x + y ;
    else {
	
      aritherror = true ;
      a = 0 ;
    } 
  } 
  else if ( y >= - (integer) maxanswer - x ) 
  a = x + y ;
  else {
      
    aritherror = true ;
    a = 0 ;
  } 
  Result = a ;
  return Result ;
} 
integer 
zquotient ( integer n , integer d ) 
{
  register integer Result; quotient_regmem 
  boolean negative  ;
  integer a  ;
  if ( d == 0 ) 
  {
    aritherror = true ;
    a = 0 ;
  } 
  else {
      
    if ( d > 0 ) 
    negative = false ;
    else {
	
      d = - (integer) d ;
      negative = true ;
    } 
    if ( n < 0 ) 
    {
      n = - (integer) n ;
      negative = ! negative ;
    } 
    a = n / d ;
    n = n - a * d ;
    d = n - d ;
    if ( d + n >= 0 ) 
    incr ( a ) ;
    if ( negative ) 
    a = - (integer) a ;
  } 
  Result = a ;
  return Result ;
} 
integer 
zfract ( integer x , integer n , integer d , integer maxanswer ) 
{
  /* 40 41 88 30 */ register integer Result; fract_regmem 
  boolean negative  ;
  integer a  ;
  integer f  ;
  integer h  ;
  integer r  ;
  integer t  ;
  if ( d == 0 ) 
  goto lab88 ;
  a = 0 ;
  if ( d > 0 ) 
  negative = false ;
  else {
      
    d = - (integer) d ;
    negative = true ;
  } 
  if ( x < 0 ) 
  {
    x = - (integer) x ;
    negative = ! negative ;
  } 
  else if ( x == 0 ) 
  goto lab30 ;
  if ( n < 0 ) 
  {
    n = - (integer) n ;
    negative = ! negative ;
  } 
  t = n / d ;
  if ( t > maxanswer / x ) 
  goto lab88 ;
  a = t * x ;
  n = n - t * d ;
  if ( n == 0 ) 
  goto lab40 ;
  t = x / d ;
  if ( t > ( maxanswer - a ) / n ) 
  goto lab88 ;
  a = a + t * n ;
  x = x - t * d ;
  if ( x == 0 ) 
  goto lab40 ;
  if ( x < n ) 
  {
    t = x ;
    x = n ;
    n = t ;
  } 
  f = 0 ;
  r = ( d / 2 ) - d ;
  h = - (integer) r ;
  while ( true ) {
      
    if ( odd ( n ) ) 
    {
      r = r + x ;
      if ( r >= 0 ) 
      {
	r = r - d ;
	incr ( f ) ;
      } 
    } 
    n = n / 2 ;
    if ( n == 0 ) 
    goto lab41 ;
    if ( x < h ) 
    x = x + x ;
    else {
	
      t = x - d ;
      x = t + x ;
      f = f + n ;
      if ( x < n ) 
      {
	if ( x == 0 ) 
	goto lab41 ;
	t = x ;
	x = n ;
	n = t ;
      } 
    } 
  } 
  lab41: if ( f > ( maxanswer - a ) ) 
  goto lab88 ;
  a = a + f ;
  lab40: if ( negative ) 
  a = - (integer) a ;
  goto lab30 ;
  lab88: {
      
    aritherror = true ;
    a = 0 ;
  } 
  lab30: Result = a ;
  return Result ;
} 
void 
scanexpr ( void ) 
{
  /* 20 22 40 */ scanexpr_regmem 
  boolean a, b  ;
  smallnumber l  ;
  smallnumber r  ;
  smallnumber s  ;
  smallnumber o  ;
  integer e  ;
  integer t  ;
  integer f  ;
  integer n  ;
  halfword p  ;
  halfword q  ;
  l = curvallevel ;
  a = aritherror ;
  b = false ;
  p = -1073741823L ;
  incr ( expanddepthcount ) ;
  if ( expanddepthcount >= expanddepth ) 
  overflow ( 713 , expanddepth ) ;
  lab20: r = 0 ;
  e = 0 ;
  s = 0 ;
  t = 0 ;
  n = 0 ;
  lab22: if ( s == 0 ) 
  o = l ;
  else o = 0 ;
  do {
      getxtoken () ;
  } while ( ! ( curcmd != 10 ) ) ;
  if ( curtok == 786472L ) 
  {
    q = getnode ( 4 ) ;
    mem [q ].hh .v.RH = p ;
    mem [q ].hh.b0 = l ;
    mem [q ].hh.b1 = 4 * s + r ;
    mem [q + 1 ].cint = e ;
    mem [q + 2 ].cint = t ;
    mem [q + 3 ].cint = n ;
    p = q ;
    l = o ;
    goto lab20 ;
  } 
  backinput () ;
  if ( o == 0 ) 
  scanint () ;
  else if ( o == 1 ) 
  scandimen ( false , false , false ) ;
  else if ( o == 2 ) 
  scannormalglue () ;
  else scanmuglue () ;
  f = curval ;
  lab40: do {
      getxtoken () ;
  } while ( ! ( curcmd != 10 ) ) ;
  if ( curtok == 786475L ) 
  o = 1 ;
  else if ( curtok == 786477L ) 
  o = 2 ;
  else if ( curtok == 786474L ) 
  o = 3 ;
  else if ( curtok == 786479L ) 
  o = 4 ;
  else {
      
    o = 0 ;
    if ( p == -1073741823L ) 
    {
      if ( curcmd != 0 ) 
      backinput () ;
    } 
    else if ( curtok != 786473L ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1632 ) ;
      } 
      {
	helpptr = 1 ;
	helpline [0 ]= 1633 ;
      } 
      backerror () ;
    } 
  } 
  aritherror = b ;
  if ( ( l == 0 ) || ( s > 2 ) ) 
  {
    if ( ( f > 2147483647L ) || ( f < -2147483647L ) ) 
    {
      aritherror = true ;
      f = 0 ;
    } 
  } 
  else if ( l == 1 ) 
  {
    if ( abs ( f ) > 1073741823L ) 
    {
      aritherror = true ;
      f = 0 ;
    } 
  } 
  else {
      
    if ( ( abs ( mem [f + 1 ].cint ) > 1073741823L ) || ( abs ( mem [f + 2 
    ].cint ) > 1073741823L ) || ( abs ( mem [f + 3 ].cint ) > 1073741823L ) 
    ) 
    {
      aritherror = true ;
      deleteglueref ( f ) ;
      f = newspec ( membot ) ;
    } 
  } 
  switch ( s ) 
  {case 0 : 
    if ( ( l >= 2 ) && ( o != 0 ) ) 
    {
      t = newspec ( f ) ;
      deleteglueref ( f ) ;
      if ( mem [t + 2 ].cint == 0 ) 
      mem [t ].hh.b0 = 0 ;
      if ( mem [t + 3 ].cint == 0 ) 
      mem [t ].hh.b1 = 0 ;
    } 
    else t = f ;
    break ;
  case 3 : 
    if ( o == 4 ) 
    {
      n = f ;
      o = 5 ;
    } 
    else if ( l == 0 ) 
    t = multandadd ( t , f , 0 , 2147483647L ) ;
    else if ( l == 1 ) 
    t = multandadd ( t , f , 0 , 1073741823L ) ;
    else {
	
      mem [t + 1 ].cint = multandadd ( mem [t + 1 ].cint , f , 0 , 
      1073741823L ) ;
      mem [t + 2 ].cint = multandadd ( mem [t + 2 ].cint , f , 0 , 
      1073741823L ) ;
      mem [t + 3 ].cint = multandadd ( mem [t + 3 ].cint , f , 0 , 
      1073741823L ) ;
    } 
    break ;
  case 4 : 
    if ( l < 2 ) 
    t = quotient ( t , f ) ;
    else {
	
      mem [t + 1 ].cint = quotient ( mem [t + 1 ].cint , f ) ;
      mem [t + 2 ].cint = quotient ( mem [t + 2 ].cint , f ) ;
      mem [t + 3 ].cint = quotient ( mem [t + 3 ].cint , f ) ;
    } 
    break ;
  case 5 : 
    if ( l == 0 ) 
    t = fract ( t , n , f , 2147483647L ) ;
    else if ( l == 1 ) 
    t = fract ( t , n , f , 1073741823L ) ;
    else {
	
      mem [t + 1 ].cint = fract ( mem [t + 1 ].cint , n , f , 1073741823L 
      ) ;
      mem [t + 2 ].cint = fract ( mem [t + 2 ].cint , n , f , 1073741823L 
      ) ;
      mem [t + 3 ].cint = fract ( mem [t + 3 ].cint , n , f , 1073741823L 
      ) ;
    } 
    break ;
  } 
  if ( o > 2 ) 
  s = o ;
  else {
      
    s = 0 ;
    if ( r == 0 ) 
    e = t ;
    else if ( l == 0 ) 
    e = addorsub ( e , t , 2147483647L , r == 2 ) ;
    else if ( l == 1 ) 
    e = addorsub ( e , t , 1073741823L , r == 2 ) ;
    else {
	
      mem [e + 1 ].cint = addorsub ( mem [e + 1 ].cint , mem [t + 1 ]
      .cint , 1073741823L , r == 2 ) ;
      if ( mem [e ].hh.b0 == mem [t ].hh.b0 ) 
      mem [e + 2 ].cint = addorsub ( mem [e + 2 ].cint , mem [t + 2 ]
      .cint , 1073741823L , r == 2 ) ;
      else if ( ( mem [e ].hh.b0 < mem [t ].hh.b0 ) && ( mem [t + 2 ]
      .cint != 0 ) ) 
      {
	mem [e + 2 ].cint = mem [t + 2 ].cint ;
	mem [e ].hh.b0 = mem [t ].hh.b0 ;
      } 
      if ( mem [e ].hh.b1 == mem [t ].hh.b1 ) 
      mem [e + 3 ].cint = addorsub ( mem [e + 3 ].cint , mem [t + 3 ]
      .cint , 1073741823L , r == 2 ) ;
      else if ( ( mem [e ].hh.b1 < mem [t ].hh.b1 ) && ( mem [t + 3 ]
      .cint != 0 ) ) 
      {
	mem [e + 3 ].cint = mem [t + 3 ].cint ;
	mem [e ].hh.b1 = mem [t ].hh.b1 ;
      } 
      deleteglueref ( t ) ;
      if ( mem [e + 2 ].cint == 0 ) 
      mem [e ].hh.b0 = 0 ;
      if ( mem [e + 3 ].cint == 0 ) 
      mem [e ].hh.b1 = 0 ;
    } 
    r = o ;
  } 
  b = aritherror ;
  if ( o != 0 ) 
  goto lab22 ;
  if ( p != -1073741823L ) 
  {
    f = e ;
    q = p ;
    e = mem [q + 1 ].cint ;
    t = mem [q + 2 ].cint ;
    n = mem [q + 3 ].cint ;
    s = mem [q ].hh.b1 / 4 ;
    r = mem [q ].hh.b1 % 4 ;
    l = mem [q ].hh.b0 ;
    p = mem [q ].hh .v.RH ;
    freenode ( q , 4 ) ;
    goto lab40 ;
  } 
  decr ( expanddepthcount ) ;
  if ( b ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1422 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 1631 ;
      helpline [0 ]= 1424 ;
    } 
    error () ;
    if ( l >= 2 ) 
    {
      deleteglueref ( e ) ;
      e = membot ;
      incr ( mem [e ].hh .v.RH ) ;
    } 
    else e = 0 ;
  } 
  aritherror = a ;
  curval = e ;
  curvallevel = l ;
} 
void 
scannormalglue ( void ) 
{
  scannormalglue_regmem 
  scanglue ( 2 ) ;
} 
void 
scanmuglue ( void ) 
{
  scanmuglue_regmem 
  scanglue ( 3 ) ;
} 
halfword 
scanrulespec ( void ) 
{
  /* 21 */ register halfword Result; scanrulespec_regmem 
  halfword q  ;
  q = newrule () ;
  if ( curcmd == 41 ) 
  mem [q + 1 ].cint = 26214 ;
  else {
      
    mem [q + 3 ].cint = 26214 ;
    mem [q + 2 ].cint = 0 ;
  } 
  lab21: if ( scankeyword ( 843 ) ) 
  {
    scandimen ( false , false , false ) ;
    mem [q + 1 ].cint = curval ;
    goto lab21 ;
  } 
  if ( scankeyword ( 844 ) ) 
  {
    scandimen ( false , false , false ) ;
    mem [q + 3 ].cint = curval ;
    goto lab21 ;
  } 
  if ( scankeyword ( 845 ) ) 
  {
    scandimen ( false , false , false ) ;
    mem [q + 2 ].cint = curval ;
    goto lab21 ;
  } 
  Result = q ;
  return Result ;
} 
void 
scangeneraltext ( void ) 
{
  /* 40 */ scangeneraltext_regmem 
  unsigned char s  ;
  halfword w  ;
  halfword d  ;
  halfword p  ;
  halfword q  ;
  halfword unbalance  ;
  s = scannerstatus ;
  w = warningindex ;
  d = defref ;
  scannerstatus = 5 ;
  warningindex = curcs ;
  defref = getavail () ;
  mem [defref ].hh .v.LH = -1073741823L ;
  p = defref ;
  scanleftbrace () ;
  unbalance = 1 ;
  while ( true ) {
      
    gettoken () ;
    if ( curtok < 196608L ) {
	
      if ( curcmd < 2 ) 
      incr ( unbalance ) ;
      else {
	  
	decr ( unbalance ) ;
	if ( unbalance == 0 ) 
	goto lab40 ;
      } 
    } 
    {
      q = getavail () ;
      mem [p ].hh .v.RH = q ;
      mem [q ].hh .v.LH = curtok ;
      p = q ;
    } 
  } 
  lab40: q = mem [defref ].hh .v.RH ;
  {
    mem [defref ].hh .v.RH = avail ;
    avail = defref ;
	;
#ifdef STAT
    decr ( dynused ) ;
#endif /* STAT */
  } 
  if ( q == -1073741823L ) 
  curval = memtop - 3 ;
  else curval = p ;
  mem [memtop - 3 ].hh .v.RH = q ;
  scannerstatus = s ;
  warningindex = w ;
  defref = d ;
} 
void 
pseudostart ( void ) 
{
  pseudostart_regmem 
  unsigned char oldsetting  ;
  strnumber s  ;
  poolpointer l, m  ;
  halfword p, q, r  ;
  fourquarters w  ;
  integer nl, sz  ;
  scangeneraltext () ;
  oldsetting = selector ;
  selector = 21 ;
  tokenshow ( memtop - 3 ) ;
  selector = oldsetting ;
  flushlist ( mem [memtop - 3 ].hh .v.RH ) ;
  {
    if ( poolptr + 1 > poolsize ) 
    overflow ( 260 , poolsize - initpoolptr ) ;
  } 
  s = makestring () ;
  strpool [poolptr ]= 32 ;
  l = strstart [s ];
  nl = eqtb [114411L ].cint ;
  p = getavail () ;
  q = p ;
  while ( l < poolptr ) {
      
    m = l ;
    while ( ( l < poolptr ) && ( strpool [l ]!= nl ) ) incr ( l ) ;
    sz = ( l - m + 7 ) / 4 ;
    if ( sz == 1 ) 
    sz = 2 ;
    r = getnode ( sz ) ;
    mem [q ].hh .v.RH = r ;
    q = r ;
    mem [q ].hh .v.LH = sz ;
    while ( sz > 2 ) {
	
      decr ( sz ) ;
      incr ( r ) ;
      w .b0 = strpool [m ];
      w .b1 = strpool [m + 1 ];
      w .b2 = strpool [m + 2 ];
      w .b3 = strpool [m + 3 ];
      mem [r ].qqqq = w ;
      m = m + 4 ;
    } 
    w .b0 = 32 ;
    w .b1 = 32 ;
    w .b2 = 32 ;
    w .b3 = 32 ;
    if ( l > m ) 
    {
      w .b0 = strpool [m ];
      if ( l > m + 1 ) 
      {
	w .b1 = strpool [m + 1 ];
	if ( l > m + 2 ) 
	{
	  w .b2 = strpool [m + 2 ];
	  if ( l > m + 3 ) 
	  w .b3 = strpool [m + 3 ];
	} 
      } 
    } 
    mem [r + 1 ].qqqq = w ;
    if ( strpool [l ]== nl ) 
    incr ( l ) ;
  } 
  mem [p ].hh .v.LH = mem [p ].hh .v.RH ;
  mem [p ].hh .v.RH = pseudofiles ;
  pseudofiles = p ;
  {
    decr ( strptr ) ;
    poolptr = strstart [strptr ];
  } 
  beginfilereading () ;
  line = 0 ;
  curinput .limitfield = curinput .startfield ;
  curinput .locfield = curinput .limitfield + 1 ;
  if ( eqtb [114433L ].cint > 0 ) 
  {
    if ( termoffset > maxprintline - 3 ) 
    println () ;
    else if ( ( termoffset > 0 ) || ( fileoffset > 0 ) ) 
    printchar ( 32 ) ;
    curinput .namefield = 19 ;
    print ( 1616 ) ;
    incr ( openparens ) ;
    fflush ( stdout ) ;
  } 
  else {
      
    curinput .namefield = 18 ;
    curinput .synctextagfield = 0 ;
  } 
} 
halfword 
zstrtokscat ( poolpointer b , smallnumber cat ) 
{
  register halfword Result; strtokscat_regmem 
  halfword p  ;
  halfword q  ;
  halfword t  ;
  poolpointer k  ;
  unsigned char cc  ;
  {
    if ( poolptr + 1 > poolsize ) 
    overflow ( 260 , poolsize - initpoolptr ) ;
  } 
  p = memtop - 3 ;
  mem [p ].hh .v.RH = -1073741823L ;
  k = b ;
  while ( k < poolptr ) {
      
    t = strpool [k ];
    if ( t >= 384 ) 
    {
      t = fromBUFFshort ( strpool , poolptr , k ) ;
      cc = eqtb [63663L + kcatcodekey ( t ) ].hh .v.RH ;
      if ( ( cc == 14 ) ) 
      cc = 12 ;
      if ( ( cat >= 16 ) && ( cat <= 20 ) ) 
      cc = cat ;
      else if ( ( cc == 15 ) ) 
      cc = 18 ;
      if ( ( cc == 16 ) && ( t >= 16777216L ) ) 
      cc = 23 ;
      t = t + cc * 16777216L ;
      k = k + multistrlenshort ( strpool , poolptr , k ) - 1 ;
    } 
    else {
	
      t = strpool [k ];
      if ( t >= 256 ) 
      t = t - 256 ;
      if ( ( t == 32 ) && ( cat == 0 ) ) 
      t = 655392L ;
      else if ( ( cat == 0 ) || ( ( cat >= 16 ) && ( cat <= 20 ) ) ) 
      t = 786432L + t ;
      else if ( cat == 13 ) 
      t = 536870912L + t ;
      else t = 65536L * cat + t ;
    } 
    {
      {
	q = avail ;
	if ( q == -1073741823L ) 
	q = getavail () ;
	else {
	    
	  avail = mem [q ].hh .v.RH ;
	  mem [q ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
	  incr ( dynused ) ;
#endif /* STAT */
	} 
      } 
      mem [p ].hh .v.RH = q ;
      mem [q ].hh .v.LH = t ;
      p = q ;
    } 
    incr ( k ) ;
  } 
  poolptr = b ;
  Result = p ;
  return Result ;
} 
halfword 
zstrtoks ( poolpointer b ) 
{
  register halfword Result; strtoks_regmem 
  Result = strtokscat ( b , 0 ) ;
  return Result ;
} 
halfword 
thetoks ( void ) 
{
  /* 10 */ register halfword Result; thetoks_regmem 
  unsigned char oldsetting  ;
  halfword p, q, r  ;
  poolpointer b  ;
  smallnumber c  ;
  if ( odd ( curchr ) ) 
  {
    c = curchr ;
    scangeneraltext () ;
    if ( c == 1 ) 
    Result = curval ;
    else {
	
      oldsetting = selector ;
      selector = 21 ;
      b = poolptr ;
      p = getavail () ;
      mem [p ].hh .v.RH = mem [memtop - 3 ].hh .v.RH ;
      tokenshow ( p ) ;
      flushlist ( p ) ;
      selector = oldsetting ;
      Result = strtoks ( b ) ;
    } 
    return Result ;
  } 
  getxtoken () ;
  scansomethinginternal ( 5 , false ) ;
  if ( curvallevel >= 4 ) 
  {
    p = memtop - 3 ;
    mem [p ].hh .v.RH = -1073741823L ;
    if ( curvallevel == 4 ) 
    {
      q = getavail () ;
      mem [p ].hh .v.RH = q ;
      mem [q ].hh .v.LH = 536870911L + curval ;
      p = q ;
    } 
    else if ( curval != -1073741823L ) 
    {
      r = mem [curval ].hh .v.RH ;
      while ( r != -1073741823L ) {
	  
	{
	  {
	    q = avail ;
	    if ( q == -1073741823L ) 
	    q = getavail () ;
	    else {
		
	      avail = mem [q ].hh .v.RH ;
	      mem [q ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
	      incr ( dynused ) ;
#endif /* STAT */
	    } 
	  } 
	  mem [p ].hh .v.RH = q ;
	  mem [q ].hh .v.LH = mem [r ].hh .v.LH ;
	  p = q ;
	} 
	r = mem [r ].hh .v.RH ;
      } 
    } 
    Result = p ;
  } 
  else {
      
    oldsetting = selector ;
    selector = 21 ;
    b = poolptr ;
    switch ( curvallevel ) 
    {case 0 : 
      printint ( curval ) ;
      break ;
    case 1 : 
      {
	printscaled ( curval ) ;
	print ( 425 ) ;
      } 
      break ;
    case 2 : 
      {
	printspec ( curval , 425 ) ;
	deleteglueref ( curval ) ;
      } 
      break ;
    case 3 : 
      {
	printspec ( curval , 348 ) ;
	deleteglueref ( curval ) ;
      } 
      break ;
    } 
    selector = oldsetting ;
    Result = strtoks ( b ) ;
  } 
  return Result ;
} 
void 
insthetoks ( void ) 
{
  insthetoks_regmem 
  mem [memtop - 12 ].hh .v.RH = thetoks () ;
  begintokenlist ( mem [memtop - 3 ].hh .v.RH , 4 ) ;
} 
void 
convtoks ( void ) 
{
  convtoks_regmem 
  unsigned char oldsetting  ;
  KANJIcode cx  ;
  unsigned char c  ;
  smallnumber savescannerstatus  ;
  halfword savedefref  ;
  halfword savewarningindex  ;
  boolean booltemp  ;
  strnumber u  ;
  strnumber s  ;
  integer i  ;
  integer j  ;
  smallnumber cat  ;
  poolpointer b  ;
  cat = 0 ;
  c = curchr ;
  u = 0 ;
  cx = 0 ;
  switch ( c ) 
  {case 0 : 
  case 1 : 
  case 2 : 
  case 6 : 
  case 7 : 
  case 8 : 
  case 9 : 
  case 10 : 
  case 11 : 
  case 12 : 
    scanint () ;
    break ;
  case 13 : 
    scanfontident () ;
    break ;
  case 14 : 
  case 15 : 
    ;
    break ;
  case 3 : 
  case 4 : 
    {
      savescannerstatus = scannerstatus ;
      scannerstatus = 0 ;
      gettoken () ;
      if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
      cx = curtok ;
      scannerstatus = savescannerstatus ;
    } 
    break ;
  case 5 : 
    scanfontident () ;
    break ;
  case 16 : 
    ;
    break ;
  case 17 : 
    {
      savescannerstatus = scannerstatus ;
      savewarningindex = warningindex ;
      savedefref = defref ;
      if ( strstart [strptr ]< poolptr ) 
      u = makestring () ;
      else u = 0 ;
      scanpdfexttoks () ;
      warningindex = savewarningindex ;
      scannerstatus = savescannerstatus ;
      begintokenlist ( mem [defref ].hh .v.RH , 4 ) ;
      {
	mem [defref ].hh .v.RH = avail ;
	avail = defref ;
	;
#ifdef STAT
	decr ( dynused ) ;
#endif /* STAT */
      } 
      defref = savedefref ;
      if ( u != 0 ) 
      decr ( strptr ) ;
      return ;
    } 
    break ;
  case 18 : 
    {
      savescannerstatus = scannerstatus ;
      savewarningindex = warningindex ;
      savedefref = defref ;
      if ( strstart [strptr ]< poolptr ) 
      u = makestring () ;
      else u = 0 ;
      comparestrings () ;
      defref = savedefref ;
      warningindex = savewarningindex ;
      scannerstatus = savescannerstatus ;
      if ( u != 0 ) 
      decr ( strptr ) ;
    } 
    break ;
  case 19 : 
    {
      b = poolptr ;
      getcreationdate () ;
      mem [memtop - 12 ].hh .v.RH = strtoks ( b ) ;
      begintokenlist ( mem [memtop - 3 ].hh .v.RH , 4 ) ;
      return ;
    } 
    break ;
  case 20 : 
    {
      savescannerstatus = scannerstatus ;
      savewarningindex = warningindex ;
      savedefref = defref ;
      if ( strstart [strptr ]< poolptr ) 
      u = makestring () ;
      else u = 0 ;
      scanpdfexttoks () ;
      s = tokenstostring ( defref ) ;
      deletetokenref ( defref ) ;
      defref = savedefref ;
      warningindex = savewarningindex ;
      scannerstatus = savescannerstatus ;
      b = poolptr ;
      getfilemoddate ( s ) ;
      mem [memtop - 12 ].hh .v.RH = strtoks ( b ) ;
      flushstr ( s ) ;
      begintokenlist ( mem [memtop - 3 ].hh .v.RH , 4 ) ;
      if ( u != 0 ) 
      decr ( strptr ) ;
      return ;
    } 
    break ;
  case 21 : 
    {
      savescannerstatus = scannerstatus ;
      savewarningindex = warningindex ;
      savedefref = defref ;
      if ( strstart [strptr ]< poolptr ) 
      u = makestring () ;
      else u = 0 ;
      scanpdfexttoks () ;
      s = tokenstostring ( defref ) ;
      deletetokenref ( defref ) ;
      defref = savedefref ;
      warningindex = savewarningindex ;
      scannerstatus = savescannerstatus ;
      b = poolptr ;
      getfilesize ( s ) ;
      mem [memtop - 12 ].hh .v.RH = strtoks ( b ) ;
      flushstr ( s ) ;
      begintokenlist ( mem [memtop - 3 ].hh .v.RH , 4 ) ;
      if ( u != 0 ) 
      decr ( strptr ) ;
      return ;
    } 
    break ;
  case 22 : 
    {
      savescannerstatus = scannerstatus ;
      savewarningindex = warningindex ;
      savedefref = defref ;
      if ( strstart [strptr ]< poolptr ) 
      u = makestring () ;
      else u = 0 ;
      booltemp = scankeyword ( 875 ) ;
      scanpdfexttoks () ;
      if ( booltemp ) 
      s = tokenstostring ( defref ) ;
      else {
	  
	isprintutf8 = true ;
	s = tokenstostring ( defref ) ;
	isprintutf8 = false ;
      } 
      deletetokenref ( defref ) ;
      defref = savedefref ;
      warningindex = savewarningindex ;
      scannerstatus = savescannerstatus ;
      b = poolptr ;
      getmd5sum ( s , booltemp ) ;
      mem [memtop - 12 ].hh .v.RH = strtoks ( b ) ;
      flushstr ( s ) ;
      begintokenlist ( mem [memtop - 3 ].hh .v.RH , 4 ) ;
      if ( u != 0 ) 
      decr ( strptr ) ;
      return ;
    } 
    break ;
  case 23 : 
    {
      savescannerstatus = scannerstatus ;
      savewarningindex = warningindex ;
      savedefref = defref ;
      if ( strstart [strptr ]< poolptr ) 
      u = makestring () ;
      else u = 0 ;
      curval = 0 ;
      if ( ( scankeyword ( 876 ) ) ) 
      {
	scanint () ;
	if ( ( curval < 0 ) ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 877 ) ;
	  } 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 878 ;
	    helpline [0 ]= 761 ;
	  } 
	  interror ( curval ) ;
	  curval = 0 ;
	} 
      } 
      i = curval ;
      curval = 0 ;
      if ( ( scankeyword ( 879 ) ) ) 
      {
	scanint () ;
	if ( ( curval < 0 ) ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 880 ) ;
	  } 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 881 ;
	    helpline [0 ]= 761 ;
	  } 
	  interror ( curval ) ;
	  curval = 0 ;
	} 
      } 
      j = curval ;
      scanpdfexttoks () ;
      s = tokenstostring ( defref ) ;
      deletetokenref ( defref ) ;
      defref = savedefref ;
      warningindex = savewarningindex ;
      scannerstatus = savescannerstatus ;
      b = poolptr ;
      getfiledump ( s , i , j ) ;
      mem [memtop - 12 ].hh .v.RH = strtoks ( b ) ;
      flushstr ( s ) ;
      begintokenlist ( mem [memtop - 3 ].hh .v.RH , 4 ) ;
      if ( u != 0 ) 
      decr ( strptr ) ;
      return ;
    } 
    break ;
  case 24 : 
    scanint () ;
    break ;
  case 25 : 
    ;
    break ;
  case 26 : 
    {
      scancharnum () ;
      if ( ! checkecharrange ( curval ) ) {
	  
	if ( eqtb [63663L + kcatcodekey ( curval ) ].hh .v.RH == 15 ) 
	cat = 18 ;
      } 
    } 
    break ;
  case 27 : 
    {
      scancharnum () ;
      i = curval ;
      scanint () ;
      if ( i <= 127 ) 
      {
	if ( ( curval < 1 ) || ( curval > 13 ) || ( curval == 5 ) || ( curval 
	== 9 ) ) 
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
	  print ( 883 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 884 ;
	  } 
	  error () ;
	  cat = 12 ;
	} 
	else cat = curval ;
      } 
      else if ( checkecharrange ( i ) ) 
      {
	if ( ( ( curval < 1 ) || ( curval > 13 ) || ( curval == 5 ) || ( 
	curval == 9 ) ) && ( ( curval < 16 ) || ( curval > 20 ) ) ) 
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
	  print ( 885 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 884 ;
	  } 
	  error () ;
	  cat = 12 ;
	} 
	else cat = curval ;
      } 
      else {
	  
	if ( ( curval < 16 ) || ( curval > 20 ) ) 
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
	  print ( 886 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 887 ;
	  } 
	  error () ;
	  cat = 18 ;
	} 
	else cat = curval ;
      } 
      curval = i ;
    } 
    break ;
  case 28 : 
    if ( jobname == 0 ) 
    openlogfile () ;
    break ;
  } 
  oldsetting = selector ;
  selector = 21 ;
  b = poolptr ;
  switch ( c ) 
  {case 0 : 
    printint ( curval ) ;
    break ;
  case 1 : 
    printromanint ( curval ) ;
    break ;
  case 2 : 
    printkansuji ( curval ) ;
    break ;
  case 8 : 
    {
      curval = fromJIS ( curval ) ;
      if ( curval == 0 ) 
      printint ( -1 ) ;
      else printint ( curval ) ;
    } 
    break ;
  case 6 : 
    {
      curval = fromEUC ( curval ) ;
      if ( curval == 0 ) 
      printint ( -1 ) ;
      else printint ( curval ) ;
    } 
    break ;
  case 7 : 
    {
      curval = fromSJIS ( curval ) ;
      if ( curval == 0 ) 
      printint ( -1 ) ;
      else printint ( curval ) ;
    } 
    break ;
  case 9 : 
    {
      curval = fromKUTEN ( curval ) ;
      if ( curval == 0 ) 
      printint ( -1 ) ;
      else printint ( curval ) ;
    } 
    break ;
  case 10 : 
    if ( ( isinternalUPTEX () ) ) 
    printint ( fromUCS ( curval ) ) ;
    else {
	
      curval = fromUCS ( curval ) ;
      if ( curval == 0 ) 
      printint ( -1 ) ;
      else printint ( curval ) ;
    } 
    break ;
  case 11 : 
    if ( ( isinternalUPTEX () ) ) 
    printint ( toUCS ( curval ) ) ;
    else {
	
      curval = toUCS ( curval ) ;
      if ( curval == 0 ) 
      printint ( -1 ) ;
      else printint ( curval ) ;
    } 
    break ;
  case 12 : 
    {
      curval = toJIS ( curval ) ;
      if ( curval == 0 ) 
      printint ( -1 ) ;
      else printint ( curval ) ;
    } 
    break ;
  case 13 : 
    {
      printfontnameandsize ( curval ) ;
      printfontdirandenc ( curval ) ;
    } 
    break ;
  case 14 : 
    print ( 257 ) ;
    break ;
  case 15 : 
    print ( 258 ) ;
    break ;
  case 3 : 
    if ( curcs != 0 ) 
    sprintcs ( curcs ) ;
    else if ( cx == 0 ) 
    printchar ( curchr ) ;
    else printkanji ( cx ) ;
    break ;
  case 4 : 
    printmeaning () ;
    break ;
  case 5 : 
    {
      print ( fontname [curval ]) ;
      if ( fontsize [curval ]!= fontdsize [curval ]) 
      {
	print ( 888 ) ;
	printscaled ( fontsize [curval ]) ;
	print ( 425 ) ;
      } 
    } 
    break ;
  case 16 : 
    print ( 256 ) ;
    break ;
  case 18 : 
    printint ( curval ) ;
    break ;
  case 24 : 
    printint ( unifrand ( curval ) ) ;
    break ;
  case 25 : 
    printint ( normrand () ) ;
    break ;
  case 26 : 
    if ( checkecharrange ( curval ) > 1 ) 
    printchar ( curval ) ;
    else printkanji ( curval ) ;
    break ;
  case 27 : 
    if ( ( cat < 16 ) && ( checkecharrange ( curval ) > 1 ) ) 
    printchar ( curval ) ;
    else printkanji ( curval ) ;
    break ;
  case 28 : 
    print ( jobname ) ;
    break ;
  } 
  selector = oldsetting ;
  mem [memtop - 12 ].hh .v.RH = strtokscat ( b , cat ) ;
  begintokenlist ( mem [memtop - 3 ].hh .v.RH , 4 ) ;
} 
halfword 
zscantoks ( boolean macrodef , boolean xpand ) 
{
  /* 40 22 30 31 32 */ register halfword Result; scantoks_regmem 
  halfword t  ;
  halfword s  ;
  halfword p  ;
  halfword q  ;
  halfword unbalance  ;
  halfword hashbrace  ;
  if ( macrodef ) 
  scannerstatus = 2 ;
  else scannerstatus = 5 ;
  warningindex = curcs ;
  defref = getavail () ;
  mem [defref ].hh .v.LH = -1073741823L ;
  p = defref ;
  hashbrace = 0 ;
  t = 786480L ;
  if ( macrodef ) 
  {
    while ( true ) {
	
      lab22: gettoken () ;
      if ( curtok < 196608L ) 
      goto lab31 ;
      if ( curcmd == 6 ) 
      {
	s = 851968L + curchr ;
	gettoken () ;
	if ( curtok < 131072L ) 
	{
	  hashbrace = curtok ;
	  {
	    q = getavail () ;
	    mem [p ].hh .v.RH = q ;
	    mem [q ].hh .v.LH = curtok ;
	    p = q ;
	  } 
	  {
	    q = getavail () ;
	    mem [p ].hh .v.RH = q ;
	    mem [q ].hh .v.LH = 917504L ;
	    p = q ;
	  } 
	  goto lab30 ;
	} 
	if ( t == 786489L ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 891 ) ;
	  } 
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 892 ;
	    helpline [0 ]= 893 ;
	  } 
	  error () ;
	  goto lab22 ;
	} 
	else {
	    
	  incr ( t ) ;
	  if ( curtok != t ) 
	  {
	    {
	      if ( interaction == 3 ) 
	      ;
	      if ( filelineerrorstylep ) 
	      printfileline () ;
	      else printnl ( 265 ) ;
	      print ( 894 ) ;
	    } 
	    {
	      helpptr = 2 ;
	      helpline [1 ]= 895 ;
	      helpline [0 ]= 896 ;
	    } 
	    backerror () ;
	  } 
	  curtok = s ;
	} 
      } 
      {
	q = getavail () ;
	mem [p ].hh .v.RH = q ;
	mem [q ].hh .v.LH = curtok ;
	p = q ;
      } 
    } 
    lab31: {
	
      q = getavail () ;
      mem [p ].hh .v.RH = q ;
      mem [q ].hh .v.LH = 917504L ;
      p = q ;
    } 
    if ( curcmd == 2 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 752 ) ;
      } 
      incr ( alignstate ) ;
      {
	helpptr = 2 ;
	helpline [1 ]= 889 ;
	helpline [0 ]= 890 ;
      } 
      error () ;
      goto lab40 ;
    } 
    lab30: ;
  } 
  else scanleftbrace () ;
  unbalance = 1 ;
  while ( true ) {
      
    if ( xpand ) 
    {
      while ( true ) {
	  
	getnext () ;
	if ( curcmd >= 129 ) {
	    
	  if ( mem [mem [curchr ].hh .v.RH ].hh .v.LH == 917505L ) 
	  {
	    curcmd = 0 ;
	    curchr = 16777217L ;
	  } 
	} 
	if ( curcmd <= 118 ) 
	goto lab32 ;
	if ( curcmd != 127 ) 
	expand () ;
	else {
	    
	  q = thetoks () ;
	  if ( mem [memtop - 3 ].hh .v.RH != -1073741823L ) 
	  {
	    mem [p ].hh .v.RH = mem [memtop - 3 ].hh .v.RH ;
	    p = q ;
	  } 
	} 
      } 
      lab32: xtoken () ;
    } 
    else gettoken () ;
    if ( curtok < 196608L ) {
	
      if ( curcmd < 2 ) 
      incr ( unbalance ) ;
      else {
	  
	decr ( unbalance ) ;
	if ( unbalance == 0 ) 
	goto lab40 ;
      } 
    } 
    else if ( curcmd == 6 ) {
	
      if ( macrodef ) 
      {
	s = curtok ;
	if ( xpand ) 
	getxtoken () ;
	else gettoken () ;
	if ( curcmd != 6 ) {
	    
	  if ( ( curtok <= 786480L ) || ( curtok > t ) ) 
	  {
	    {
	      if ( interaction == 3 ) 
	      ;
	      if ( filelineerrorstylep ) 
	      printfileline () ;
	      else printnl ( 265 ) ;
	      print ( 897 ) ;
	    } 
	    sprintcs ( warningindex ) ;
	    {
	      helpptr = 3 ;
	      helpline [2 ]= 898 ;
	      helpline [1 ]= 899 ;
	      helpline [0 ]= 900 ;
	    } 
	    backerror () ;
	    curtok = s ;
	  } 
	  else curtok = 327632L + curchr ;
	} 
      } 
    } 
    {
      q = getavail () ;
      mem [p ].hh .v.RH = q ;
      mem [q ].hh .v.LH = curtok ;
      p = q ;
    } 
  } 
  lab40: scannerstatus = 0 ;
  if ( hashbrace != 0 ) 
  {
    q = getavail () ;
    mem [p ].hh .v.RH = q ;
    mem [q ].hh .v.LH = hashbrace ;
    p = q ;
  } 
  Result = p ;
  return Result ;
} 
void 
zreadtoks ( integer n , halfword r , halfword j ) 
{
  /* 30 */ readtoks_regmem 
  halfword p  ;
  halfword q  ;
  integer s  ;
  smallnumber m  ;
  scannerstatus = 2 ;
  warningindex = r ;
  defref = getavail () ;
  mem [defref ].hh .v.LH = -1073741823L ;
  p = defref ;
  {
    q = getavail () ;
    mem [p ].hh .v.RH = q ;
    mem [q ].hh .v.LH = 917504L ;
    p = q ;
  } 
  if ( ( n < 0 ) || ( n > 15 ) ) 
  m = 16 ;
  else m = n ;
  s = alignstate ;
  alignstate = 1000000L ;
  do {
      beginfilereading () ;
    curinput .namefield = m + 1 ;
    if ( readopen [m ]== 2 ) {
	
      if ( interaction > 1 ) {
	  
	if ( n < 0 ) 
	{
	  ;
	  print ( 349 ) ;
	  terminput () ;
	} 
	else {
	    
	  ;
	  println () ;
	  sprintcs ( r ) ;
	  {
	    ;
	    print ( 61 ) ;
	    terminput () ;
	  } 
	  n = -1 ;
	} 
      } 
      else {
	  
	curinput .limitfield = 0 ;
	fatalerror ( 901 ) ;
      } 
    } 
    else if ( readopen [m ]== 1 ) {
	
      if ( inputln ( readfile [m ], false ) ) 
      readopen [m ]= 0 ;
      else {
	  
	aclose ( readfile [m ]) ;
	readopen [m ]= 2 ;
      } 
    } 
    else {
	
      if ( ! inputln ( readfile [m ], true ) ) 
      {
	aclose ( readfile [m ]) ;
	readopen [m ]= 2 ;
	if ( alignstate != 1000000L ) 
	{
	  runaway () ;
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 902 ) ;
	  } 
	  printesc ( 606 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 903 ;
	  } 
	  alignstate = 1000000L ;
	  curinput .limitfield = 0 ;
	  error () ;
	} 
      } 
    } 
    curinput .limitfield = last ;
    if ( ( eqtb [114410L ].cint < 0 ) || ( eqtb [114410L ].cint > 255 ) ) 
    decr ( curinput .limitfield ) ;
    else buffer [curinput .limitfield ]= eqtb [114410L ].cint ;
    first = curinput .limitfield + 1 ;
    curinput .locfield = curinput .startfield ;
    curinput .statefield = 85 ;
    if ( j == 1 ) 
    {
      while ( curinput .locfield <= curinput .limitfield ) {
	  
	curchr = fromBUFF ( ustringcast ( buffer ) , curinput .limitfield + 1 
	, curinput .locfield ) ;
	curtok = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
	if ( ( multistrlen ( ustringcast ( buffer ) , curinput .limitfield + 1 
	, curinput .locfield ) > 1 ) && checkkcatcode ( curtok , curchr ) ) 
	{
	  if ( ( curtok == 15 ) ) 
	  curtok = 18 ;
	  if ( ( curtok == 14 ) ) 
	  curtok = 11 ;
	  curtok = curchr + curtok * 16777216L ;
	  curinput .locfield = curinput .locfield + multistrlen ( ustringcast 
	  ( buffer ) , curinput .limitfield + 1 , curinput .locfield ) ;
	} 
	else {
	    
	  curchr = buffer [curinput .locfield ];
	  incr ( curinput .locfield ) ;
	  if ( curchr == 32 ) 
	  curtok = 655392L ;
	  else curtok = curchr + 786432L ;
	} 
	{
	  q = getavail () ;
	  mem [p ].hh .v.RH = q ;
	  mem [q ].hh .v.LH = curtok ;
	  p = q ;
	} 
      } 
      goto lab30 ;
    } 
    while ( true ) {
	
      gettoken () ;
      if ( curtok == 0 ) 
      goto lab30 ;
      if ( alignstate < 1000000L ) 
      {
	do {
	    gettoken () ;
	} while ( ! ( curtok == 0 ) ) ;
	alignstate = 1000000L ;
	goto lab30 ;
      } 
      {
	q = getavail () ;
	mem [p ].hh .v.RH = q ;
	mem [q ].hh .v.LH = curtok ;
	p = q ;
      } 
    } 
    lab30: endfilereading () ;
  } while ( ! ( alignstate == 1000000L ) ) ;
  curval = defref ;
  scannerstatus = 0 ;
  alignstate = s ;
} 
void 
passtext ( void ) 
{
  /* 30 */ passtext_regmem 
  integer l  ;
  smallnumber savescannerstatus  ;
  savescannerstatus = scannerstatus ;
  scannerstatus = 1 ;
  l = 0 ;
  skipline = line ;
  while ( true ) {
      
    getnext () ;
    if ( curcmd == 124 ) 
    {
      if ( l == 0 ) 
      goto lab30 ;
      if ( curchr == 2 ) 
      decr ( l ) ;
    } 
    else if ( curcmd == 123 ) 
    incr ( l ) ;
  } 
  lab30: scannerstatus = savescannerstatus ;
  if ( eqtb [114432L ].cint > 0 ) 
  showcurcmdchr () ;
} 
void 
zchangeiflimit ( smallnumber l , halfword p ) 
{
  /* 10 */ changeiflimit_regmem 
  halfword q  ;
  if ( p == condptr ) 
  iflimit = l ;
  else {
      
    q = condptr ;
    while ( true ) {
	
      if ( q == -1073741823L ) 
      confusion ( 904 ) ;
      if ( mem [q ].hh .v.RH == p ) 
      {
	mem [q ].hh.b0 = l ;
	return ;
      } 
      q = mem [q ].hh .v.RH ;
    } 
  } 
} 
void 
conditional ( void ) 
{
  /* 10 50 */ conditional_regmem 
  boolean b  ;
  boolean e  ;
  unsigned char r  ;
  integer m, n, s, v, nn, jj  ;
  halfword p, q  ;
  smallnumber savescannerstatus  ;
  halfword savecondptr  ;
  smallnumber thisif  ;
  boolean isunless  ;
  if ( eqtb [114432L ].cint > 0 ) {
      
    if ( eqtb [114397L ].cint <= 1 ) 
    showcurcmdchr () ;
  } 
  {
    p = getnode ( 2 ) ;
    mem [p ].hh .v.RH = condptr ;
    mem [p ].hh.b0 = iflimit ;
    mem [p ].hh.b1 = curif ;
    mem [p + 1 ].cint = ifline ;
    condptr = p ;
    curif = curchr ;
    iflimit = 1 ;
    ifline = line ;
  } 
  savecondptr = condptr ;
  isunless = ( curchr >= 32 ) ;
  thisif = curchr % 32 ;
  switch ( thisif ) 
  {case 0 : 
  case 1 : 
    {
      {
	getxtoken () ;
	if ( curcmd == 0 ) {
	    
	  if ( curchr == 16777217L ) 
	  {
	    curcmd = 13 ;
	    curchr = curtok - 536870912L ;
	  } 
	} 
      } 
      if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
      {
	m = curcmd ;
	n = curchr ;
      } 
      else if ( ( curcmd > 13 ) || ( curchr >= 11904 ) ) 
      {
	m = 0 ;
	n = 16777216L ;
      } 
      else {
	  
	m = curcmd ;
	n = curchr ;
      } 
      {
	getxtoken () ;
	if ( curcmd == 0 ) {
	    
	  if ( curchr == 16777217L ) 
	  {
	    curcmd = 13 ;
	    curchr = curtok - 536870912L ;
	  } 
	} 
      } 
      if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
      {
	curcmd = curcmd ;
      } 
      else if ( ( curcmd > 13 ) || ( curchr >= 11904 ) ) 
      {
	curcmd = 0 ;
	curchr = 16777216L ;
      } 
      if ( thisif == 0 ) 
      b = ( n == curchr ) ;
      else b = ( m == curcmd ) ;
    } 
    break ;
  case 2 : 
  case 3 : 
    {
      if ( thisif == 2 ) 
      scanint () ;
      else scandimen ( false , false , false ) ;
      n = curval ;
      do {
	  getxtoken () ;
      } while ( ! ( curcmd != 10 ) ) ;
      if ( ( curtok >= 786492L ) && ( curtok <= 786494L ) ) 
      r = curtok - 786432L ;
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 939 ) ;
	} 
	printcmdchr ( 123 , thisif ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 940 ;
	} 
	backerror () ;
	r = 61 ;
      } 
      if ( thisif == 2 ) 
      scanint () ;
      else scandimen ( false , false , false ) ;
      switch ( r ) 
      {case 60 : 
	b = ( n < curval ) ;
	break ;
      case 61 : 
	b = ( n == curval ) ;
	break ;
      case 62 : 
	b = ( n > curval ) ;
	break ;
      } 
    } 
    break ;
  case 4 : 
    {
      scanint () ;
      b = odd ( curval ) ;
    } 
    break ;
  case 5 : 
    b = ( abs ( curlist .modefield ) == 1 ) ;
    break ;
  case 6 : 
    b = ( abs ( curlist .modefield ) == 120 ) ;
    break ;
  case 7 : 
    b = ( abs ( curlist .modefield ) == 239 ) ;
    break ;
  case 8 : 
    b = ( curlist .modefield < 0 ) ;
    break ;
  case 22 : 
    b = ( abs ( curlist .dirfield ) == 3 ) ;
    break ;
  case 23 : 
    b = ( abs ( curlist .dirfield ) == 4 ) ;
    break ;
  case 24 : 
    b = ( abs ( curlist .dirfield ) == 1 ) ;
    break ;
  case 25 : 
    b = ( curlist .dirfield < 0 ) ;
    break ;
  case 26 : 
  case 27 : 
  case 28 : 
  case 29 : 
  case 9 : 
  case 10 : 
  case 11 : 
    {
      scanregisternum () ;
      if ( curval < 256 ) 
      p = eqtb [50729L + curval ].hh .v.RH ;
      else {
	  
	findsaelement ( 4 , curval , false ) ;
	if ( curptr == -1073741823L ) 
	p = -1073741823L ;
	else p = mem [curptr + 1 ].hh .v.RH ;
      } 
      if ( thisif == 9 ) 
      b = ( p == -1073741823L ) ;
      else if ( p == -1073741823L ) 
      b = false ;
      else {
	  
	if ( mem [p ].hh.b0 == 2 ) 
	p = mem [p + 5 ].hh .v.RH ;
	if ( thisif == 10 ) 
	b = ( mem [p ].hh.b0 == 0 ) ;
	else if ( thisif == 11 ) 
	b = ( mem [p ].hh.b0 == 1 ) ;
	else if ( thisif == 26 ) 
	b = ( abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) ) == 3 ) ;
	else if ( thisif == 27 ) 
	b = ( abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) ) == 4 ) ;
	else if ( thisif == 28 ) 
	b = ( abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) ) == 1 ) ;
	else b = ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) < 0 ) ;
      } 
    } 
    break ;
  case 21 : 
    {
      savescannerstatus = scannerstatus ;
      scannerstatus = 0 ;
      getnext () ;
      scannerstatus = savescannerstatus ;
      if ( curcs < 23810 ) 
      m = primlookup ( curcs - 11905 ) ;
      else m = primlookup ( hash [curcs ].v.RH ) ;
      b = ( ( curcmd != 119 ) && ( m != 0 ) && ( curcmd == eqtb [38822L + m ]
      .hh.b0 ) && ( curchr == eqtb [38822L + m ].hh .v.RH ) ) ;
    } 
    break ;
  case 30 : 
  case 31 : 
    {
      scanfontident () ;
      if ( thisif == 30 ) 
      b = ( fontdir [curval ]== 4 ) ;
      else if ( thisif == 31 ) 
      b = ( fontdir [curval ]== 3 ) ;
    } 
    break ;
  case 12 : 
    {
      savescannerstatus = scannerstatus ;
      scannerstatus = 0 ;
      getnext () ;
      n = curcs ;
      p = curcmd ;
      q = curchr ;
      getnext () ;
      if ( curcmd != p ) 
      b = false ;
      else if ( curcmd < 129 ) 
      b = ( curchr == q ) ;
      else {
	  
	p = mem [curchr ].hh .v.RH ;
	q = mem [eqtb [n ].hh .v.RH ].hh .v.RH ;
	if ( p == q ) 
	b = true ;
	else {
	    
	  while ( ( p != -1073741823L ) && ( q != -1073741823L ) ) if ( mem [
	  p ].hh .v.LH != mem [q ].hh .v.LH ) 
	  p = -1073741823L ;
	  else {
	      
	    p = mem [p ].hh .v.RH ;
	    q = mem [q ].hh .v.RH ;
	  } 
	  b = ( ( p == -1073741823L ) && ( q == -1073741823L ) ) ;
	} 
      } 
      scannerstatus = savescannerstatus ;
    } 
    break ;
  case 13 : 
    {
      scanfourbitintor18 () ;
      if ( curval == 18 ) 
      b = ! shellenabledp ;
      else b = ( readopen [curval ]== 2 ) ;
    } 
    break ;
  case 14 : 
    b = true ;
    break ;
  case 15 : 
    b = false ;
    break ;
  case 17 : 
    {
      savescannerstatus = scannerstatus ;
      scannerstatus = 0 ;
      getnext () ;
      b = ( curcmd != 119 ) ;
      scannerstatus = savescannerstatus ;
    } 
    break ;
  case 18 : 
    {
      n = getavail () ;
      p = n ;
      e = isincsname ;
      isincsname = true ;
      do {
	  getxtoken () ;
	if ( curcs == 0 ) 
	{
	  q = getavail () ;
	  mem [p ].hh .v.RH = q ;
	  mem [q ].hh .v.LH = curtok ;
	  p = q ;
	} 
      } while ( ! ( curcs != 0 ) ) ;
      if ( curcmd != 73 ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 720 ) ;
	} 
	printesc ( 569 ) ;
	print ( 721 ) ;
	{
	  helpptr = 2 ;
	  helpline [1 ]= 722 ;
	  helpline [0 ]= 723 ;
	} 
	backerror () ;
      } 
      m = first ;
      p = mem [n ].hh .v.RH ;
      while ( p != -1073741823L ) {
	  
	if ( m >= maxbufstack ) 
	{
	  maxbufstack = m + 1 ;
	  if ( maxbufstack == bufsize ) 
	  overflow ( 259 , bufsize ) ;
	} 
	if ( checkkanji ( mem [p ].hh .v.LH ) ) 
	{
	  if ( ( isinternalUPTEX () ) ) 
	  {
	    s = toUCS ( ktokentochr ( mem [p ].hh .v.LH ) ) ;
	    nn = UVSgetcodepointlength ( s ) ;
	    jj = 1 ;
	    while ( jj <= nn ) {
		
	      v = UVSgetcodepointinsequence ( s , jj ) ;
	      if ( ( v > 0 ) ) 
	      {
		v = UCStoUTF8 ( v ) ;
		if ( BYTE1 ( v ) != 0 ) 
		{
		  buffer [m ]= BYTE1 ( v ) ;
		  buffer2 [m ]= 1 ;
		  incr ( m ) ;
		} 
		if ( BYTE2 ( v ) != 0 ) 
		{
		  buffer [m ]= BYTE2 ( v ) ;
		  buffer2 [m ]= 1 ;
		  incr ( m ) ;
		} 
		if ( BYTE3 ( v ) != 0 ) 
		{
		  buffer [m ]= BYTE3 ( v ) ;
		  buffer2 [m ]= 1 ;
		  incr ( m ) ;
		} 
		buffer [m ]= BYTE4 ( v ) ;
		buffer2 [m ]= 1 ;
		incr ( m ) ;
	      } 
	      incr ( jj ) ;
	    } 
	  } 
	  else {
	      
	    v = toBUFF ( mem [p ].hh .v.LH % 16777216L ) ;
	    if ( BYTE1 ( v ) != 0 ) 
	    {
	      buffer [m ]= BYTE1 ( v ) ;
	      buffer2 [m ]= 1 ;
	      incr ( m ) ;
	    } 
	    if ( BYTE2 ( v ) != 0 ) 
	    {
	      buffer [m ]= BYTE2 ( v ) ;
	      buffer2 [m ]= 1 ;
	      incr ( m ) ;
	    } 
	    if ( BYTE3 ( v ) != 0 ) 
	    {
	      buffer [m ]= BYTE3 ( v ) ;
	      buffer2 [m ]= 1 ;
	      incr ( m ) ;
	    } 
	    buffer [m ]= BYTE4 ( v ) ;
	    buffer2 [m ]= 1 ;
	    incr ( m ) ;
	  } 
	  p = mem [p ].hh .v.RH ;
	} 
	else {
	    
	  buffer [m ]= mem [p ].hh .v.LH % 65536L ;
	  buffer2 [m ]= 0 ;
	  incr ( m ) ;
	  p = mem [p ].hh .v.RH ;
	} 
      } 
      if ( m > first + 1 ) 
      curcs = idlookup ( first , m - first ) ;
      else if ( m == first ) 
      curcs = 23809 ;
      else curcs = 11905 + buffer [first ];
      flushlist ( n ) ;
      b = ( eqtb [curcs ].hh.b0 != 119 ) ;
      isincsname = e ;
    } 
    break ;
  case 20 : 
    b = isincsname ;
    break ;
  case 19 : 
    {
      scanfontident () ;
      n = curval ;
      if ( fontdir [n ]!= 0 ) 
      {
	scanint () ;
	if ( curval >= 0 ) 
	b = ischarkanji ( curval ) ;
	else {
	    
	  curval = - (integer) ( curval + 1 ) ;
	  b = ( fontbc [n ]<= curval ) && ( fontec [n ]>= curval ) ;
	} 
      } 
      else {
	  
	scanlatinnum () ;
	curval = ptencucsto8bitcode ( fontenc [n ], curval ) ;
	if ( ( fontbc [n ]<= curval ) && ( fontec [n ]>= curval ) ) 
	b = ( fontinfo [charbase [n ]+ curval ].qqqq .b0 > 0 ) ;
	else b = false ;
      } 
    } 
    break ;
  case 16 : 
    {
      scanint () ;
      n = curval ;
      if ( eqtb [114397L ].cint > 1 ) 
      {
	begindiagnostic () ;
	print ( 941 ) ;
	printint ( n ) ;
	printchar ( 125 ) ;
	enddiagnostic ( false ) ;
      } 
      while ( n != 0 ) {
	  
	passtext () ;
	if ( condptr == savecondptr ) {
	    
	  if ( curchr == 4 ) 
	  decr ( n ) ;
	  else goto lab50 ;
	} 
	else if ( curchr == 2 ) 
	{
	  if ( ifstack [inopen ]== condptr ) 
	  ifwarning () ;
	  p = condptr ;
	  ifline = mem [p + 1 ].cint ;
	  curif = mem [p ].hh.b1 ;
	  iflimit = mem [p ].hh.b0 ;
	  condptr = mem [p ].hh .v.RH ;
	  freenode ( p , 2 ) ;
	} 
      } 
      changeiflimit ( 4 , savecondptr ) ;
      return ;
    } 
    break ;
  } 
  if ( isunless ) 
  b = ! b ;
  if ( eqtb [114397L ].cint > 1 ) 
  {
    begindiagnostic () ;
    if ( b ) 
    print ( 937 ) ;
    else print ( 938 ) ;
    enddiagnostic ( false ) ;
  } 
  if ( b ) 
  {
    changeiflimit ( 3 , savecondptr ) ;
    return ;
  } 
  while ( true ) {
      
    passtext () ;
    if ( condptr == savecondptr ) 
    {
      if ( curchr != 4 ) 
      goto lab50 ;
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 935 ) ;
      } 
      printesc ( 933 ) ;
      {
	helpptr = 1 ;
	helpline [0 ]= 936 ;
      } 
      error () ;
    } 
    else if ( curchr == 2 ) 
    {
      if ( ifstack [inopen ]== condptr ) 
      ifwarning () ;
      p = condptr ;
      ifline = mem [p + 1 ].cint ;
      curif = mem [p ].hh.b1 ;
      iflimit = mem [p ].hh.b0 ;
      condptr = mem [p ].hh .v.RH ;
      freenode ( p , 2 ) ;
    } 
  } 
  lab50: if ( curchr == 2 ) 
  {
    if ( ifstack [inopen ]== condptr ) 
    ifwarning () ;
    p = condptr ;
    ifline = mem [p + 1 ].cint ;
    curif = mem [p ].hh.b1 ;
    iflimit = mem [p ].hh.b0 ;
    condptr = mem [p ].hh .v.RH ;
    freenode ( p , 2 ) ;
  } 
  else iflimit = 2 ;
} 
void 
beginname ( void ) 
{
  beginname_regmem 
  areadelimiter = 0 ;
  extdelimiter = 0 ;
  quotedfilename = false ;
  prevchar = 0 ;
} 
boolean 
zmorename ( ASCIIcode c ) 
{
  register boolean Result; morename_regmem 
  if ( ( c == 32 ) && stopatspace && ( ! quotedfilename ) ) 
  Result = false ;
  else if ( c == 34 ) 
  {
    quotedfilename = ! quotedfilename ;
    Result = true ;
  } 
  else {
      
    {
      if ( poolptr + 1 > poolsize ) 
      overflow ( 260 , poolsize - initpoolptr ) ;
    } 
    {
      strpool [poolptr ]= c ;
      incr ( poolptr ) ;
    } 
    if ( ( ISDIRSEP ( c ) && ( notkanjicharseq ( prevchar , c ) ) ) ) 
    {
      areadelimiter = ( poolptr - strstart [strptr ]) ;
      extdelimiter = 0 ;
    } 
    else if ( c == 46 ) 
    extdelimiter = ( poolptr - strstart [strptr ]) ;
    Result = true ;
  } 
  prevchar = c ;
  return Result ;
} 
void 
endname ( void ) 
{
  endname_regmem 
  strnumber tempstr  ;
  poolpointer j, s, t  ;
  boolean mustquote  ;
  if ( strptr + 3 > maxstrings ) 
  overflow ( 261 , maxstrings - initstrptr ) ;
  {
    if ( poolptr + 6 > poolsize ) 
    overflow ( 260 , poolsize - initpoolptr ) ;
  } 
  if ( areadelimiter != 0 ) 
  {
    mustquote = false ;
    s = strstart [strptr ];
    t = strstart [strptr ]+ areadelimiter ;
    j = s ;
    while ( ( ! mustquote ) && ( j < t ) ) {
	
      mustquote = strpool [j ]== 32 ;
      incr ( j ) ;
    } 
    if ( mustquote ) 
    {
      {register integer for_end; j = poolptr - 1 ;for_end = t ; if ( j >= 
      for_end) do 
	strpool [j + 2 ]= strpool [j ];
      while ( j-- > for_end ) ;} 
      strpool [t + 1 ]= 34 ;
      {register integer for_end; j = t - 1 ;for_end = s ; if ( j >= for_end) 
      do 
	strpool [j + 1 ]= strpool [j ];
      while ( j-- > for_end ) ;} 
      strpool [s ]= 34 ;
      if ( extdelimiter != 0 ) 
      extdelimiter = extdelimiter + 2 ;
      areadelimiter = areadelimiter + 2 ;
      poolptr = poolptr + 2 ;
    } 
  } 
  s = strstart [strptr ]+ areadelimiter ;
  if ( extdelimiter == 0 ) 
  t = poolptr ;
  else t = strstart [strptr ]+ extdelimiter - 1 ;
  mustquote = false ;
  j = s ;
  while ( ( ! mustquote ) && ( j < t ) ) {
      
    mustquote = strpool [j ]== 32 ;
    incr ( j ) ;
  } 
  if ( mustquote ) 
  {
    {register integer for_end; j = poolptr - 1 ;for_end = t ; if ( j >= 
    for_end) do 
      strpool [j + 2 ]= strpool [j ];
    while ( j-- > for_end ) ;} 
    strpool [t + 1 ]= 34 ;
    {register integer for_end; j = t - 1 ;for_end = s ; if ( j >= for_end) 
    do 
      strpool [j + 1 ]= strpool [j ];
    while ( j-- > for_end ) ;} 
    strpool [s ]= 34 ;
    if ( extdelimiter != 0 ) 
    extdelimiter = extdelimiter + 2 ;
    poolptr = poolptr + 2 ;
  } 
  if ( extdelimiter != 0 ) 
  {
    s = strstart [strptr ]+ extdelimiter - 1 ;
    t = poolptr ;
    mustquote = false ;
    j = s ;
    while ( ( ! mustquote ) && ( j < t ) ) {
	
      mustquote = strpool [j ]== 32 ;
      incr ( j ) ;
    } 
    if ( mustquote ) 
    {
      strpool [t + 1 ]= 34 ;
      {register integer for_end; j = t - 1 ;for_end = s ; if ( j >= for_end) 
      do 
	strpool [j + 1 ]= strpool [j ];
      while ( j-- > for_end ) ;} 
      strpool [s ]= 34 ;
      poolptr = poolptr + 2 ;
    } 
  } 
  if ( areadelimiter == 0 ) 
  curarea = 349 ;
  else {
      
    curarea = strptr ;
    strstart [strptr + 1 ]= strstart [strptr ]+ areadelimiter ;
    incr ( strptr ) ;
    tempstr = searchstring ( curarea ) ;
    if ( tempstr > 0 ) 
    {
      curarea = tempstr ;
      decr ( strptr ) ;
      {register integer for_end; j = strstart [strptr + 1 ];for_end = 
      poolptr - 1 ; if ( j <= for_end) do 
	{
	  strpool [j - areadelimiter ]= strpool [j ];
	} 
      while ( j++ < for_end ) ;} 
      poolptr = poolptr - areadelimiter ;
    } 
  } 
  if ( extdelimiter == 0 ) 
  {
    curext = 349 ;
    curname = slowmakestring () ;
  } 
  else {
      
    curname = strptr ;
    strstart [strptr + 1 ]= strstart [strptr ]+ extdelimiter - 
    areadelimiter - 1 ;
    incr ( strptr ) ;
    curext = makestring () ;
    decr ( strptr ) ;
    tempstr = searchstring ( curname ) ;
    if ( tempstr > 0 ) 
    {
      curname = tempstr ;
      decr ( strptr ) ;
      {register integer for_end; j = strstart [strptr + 1 ];for_end = 
      poolptr - 1 ; if ( j <= for_end) do 
	{
	  strpool [j - extdelimiter + areadelimiter + 1 ]= strpool [j ];
	} 
      while ( j++ < for_end ) ;} 
      poolptr = poolptr - extdelimiter + areadelimiter + 1 ;
    } 
    curext = slowmakestring () ;
  } 
} 
void 
zpackfilename ( strnumber n , strnumber a , strnumber e ) 
{
  packfilename_regmem 
  integer k  ;
  ASCIIcode c  ;
  poolpointer j  ;
  k = 0 ;
  if ( nameoffile ) 
  libcfree ( nameoffile ) ;
  nameoffile = xmallocarray ( ASCIIcode , ( ( strstart [a + 1 ]- strstart [
  a ]) + ( strstart [n + 1 ]- strstart [n ]) + ( strstart [e + 1 ]- 
  strstart [e ]) ) * 4 + 1 ) ;
  {register integer for_end; j = strstart [a ];for_end = strstart [a + 1 
  ]- 1 ; if ( j <= for_end) do 
    if ( ! ( ( strpool [j ]) == 34 ) ) 
    {
      if ( ( strpool [j ]) >= 256 ) 
      {
	c = ( strpool [j ]) - 256 ;
	{
	  incr ( k ) ;
	  if ( k <= maxint ) 
	  nameoffile [k ]= xchr [c ];
	} 
      } 
      else {
	  
	c = strpool [j ];
	if ( ( c >= 128 ) && ( ! isinternalUPTEX () ) && isterminalUTF8 () ) 
	{
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [94 ];
	  } 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [94 ];
	  } 
	  if ( ( c / 16 ) < 10 ) 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c / 16 ) + 48 ];
	  } 
	  else {
	      
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c / 16 ) + 87 ];
	  } 
	  if ( ( c % 16 ) < 10 ) 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c % 16 ) + 48 ];
	  } 
	  else {
	      
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c % 16 ) + 87 ];
	  } 
	} 
	else {
	    
	  incr ( k ) ;
	  if ( k <= maxint ) 
	  nameoffile [k ]= xchr [c ];
	} 
      } 
    } 
  while ( j++ < for_end ) ;} 
  {register integer for_end; j = strstart [n ];for_end = strstart [n + 1 
  ]- 1 ; if ( j <= for_end) do 
    if ( ! ( ( strpool [j ]) == 34 ) ) 
    {
      if ( ( strpool [j ]) >= 256 ) 
      {
	c = ( strpool [j ]) - 256 ;
	{
	  incr ( k ) ;
	  if ( k <= maxint ) 
	  nameoffile [k ]= xchr [c ];
	} 
      } 
      else {
	  
	c = strpool [j ];
	if ( ( c >= 128 ) && ( ! isinternalUPTEX () ) && isterminalUTF8 () ) 
	{
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [94 ];
	  } 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [94 ];
	  } 
	  if ( ( c / 16 ) < 10 ) 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c / 16 ) + 48 ];
	  } 
	  else {
	      
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c / 16 ) + 87 ];
	  } 
	  if ( ( c % 16 ) < 10 ) 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c % 16 ) + 48 ];
	  } 
	  else {
	      
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c % 16 ) + 87 ];
	  } 
	} 
	else {
	    
	  incr ( k ) ;
	  if ( k <= maxint ) 
	  nameoffile [k ]= xchr [c ];
	} 
      } 
    } 
  while ( j++ < for_end ) ;} 
  {register integer for_end; j = strstart [e ];for_end = strstart [e + 1 
  ]- 1 ; if ( j <= for_end) do 
    if ( ! ( ( strpool [j ]) == 34 ) ) 
    {
      if ( ( strpool [j ]) >= 256 ) 
      {
	c = ( strpool [j ]) - 256 ;
	{
	  incr ( k ) ;
	  if ( k <= maxint ) 
	  nameoffile [k ]= xchr [c ];
	} 
      } 
      else {
	  
	c = strpool [j ];
	if ( ( c >= 128 ) && ( ! isinternalUPTEX () ) && isterminalUTF8 () ) 
	{
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [94 ];
	  } 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [94 ];
	  } 
	  if ( ( c / 16 ) < 10 ) 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c / 16 ) + 48 ];
	  } 
	  else {
	      
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c / 16 ) + 87 ];
	  } 
	  if ( ( c % 16 ) < 10 ) 
	  {
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c % 16 ) + 48 ];
	  } 
	  else {
	      
	    incr ( k ) ;
	    if ( k <= maxint ) 
	    nameoffile [k ]= xchr [( c % 16 ) + 87 ];
	  } 
	} 
	else {
	    
	  incr ( k ) ;
	  if ( k <= maxint ) 
	  nameoffile [k ]= xchr [c ];
	} 
      } 
    } 
  while ( j++ < for_end ) ;} 
  if ( k <= maxint ) 
  namelength = k ;
  else namelength = maxint ;
  nameoffile [namelength + 1 ]= 0 ;
} 
void 
zpackbufferedname ( smallnumber n , integer a , integer b ) 
{
  packbufferedname_regmem 
  integer k  ;
  ASCIIcode c  ;
  integer j  ;
  if ( n + b - a + 5 > maxint ) 
  b = a + maxint - n - 5 ;
  k = 0 ;
  if ( nameoffile ) 
  libcfree ( nameoffile ) ;
  nameoffile = xmallocarray ( ASCIIcode , ( n + ( b - a + 1 ) + 4 ) * 4 + 1 ) 
  ;
  {register integer for_end; j = 1 ;for_end = n ; if ( j <= for_end) do 
    {
      c = xord [ucharcast ( TEXformatdefault [j ]) ];
      if ( ! ( c == 34 ) ) 
      {
	incr ( k ) ;
	if ( k <= maxint ) 
	nameoffile [k ]= xchr [c ];
      } 
    } 
  while ( j++ < for_end ) ;} 
  {register integer for_end; j = a ;for_end = b ; if ( j <= for_end) do 
    {
      c = buffer [j ];
      if ( ! ( c == 34 ) ) 
      {
	incr ( k ) ;
	if ( k <= maxint ) 
	nameoffile [k ]= xchr [c ];
      } 
    } 
  while ( j++ < for_end ) ;} 
  {register integer for_end; j = formatdefaultlength - 3 ;for_end = 
  formatdefaultlength ; if ( j <= for_end) do 
    {
      c = xord [ucharcast ( TEXformatdefault [j ]) ];
      if ( ! ( c == 34 ) ) 
      {
	incr ( k ) ;
	if ( k <= maxint ) 
	nameoffile [k ]= xchr [c ];
      } 
    } 
  while ( j++ < for_end ) ;} 
  if ( k <= maxint ) 
  namelength = k ;
  else namelength = maxint ;
  nameoffile [namelength + 1 ]= 0 ;
} 
strnumber 
makenamestring ( void ) 
{
  register strnumber Result; makenamestring_regmem 
  integer k  ;
  poolpointer saveareadelimiter, saveextdelimiter  ;
  boolean savenameinprogress, savestopatspace  ;
  if ( ( poolptr + namelength > poolsize ) || ( strptr == maxstrings ) || ( ( 
  poolptr - strstart [strptr ]) > 0 ) ) 
  Result = 63 ;
  else {
      
    {register integer for_end; k = 1 ;for_end = namelength ; if ( k <= 
    for_end) do 
      {
	strpool [poolptr ]= xord [nameoffile [k ]];
	incr ( poolptr ) ;
      } 
    while ( k++ < for_end ) ;} 
    Result = makestring () ;
    saveareadelimiter = areadelimiter ;
    saveextdelimiter = extdelimiter ;
    savenameinprogress = nameinprogress ;
    savestopatspace = stopatspace ;
    nameinprogress = true ;
    beginname () ;
    stopatspace = false ;
    k = 1 ;
    while ( ( k <= namelength ) && ( morename ( nameoffile [k ]) ) ) incr ( 
    k ) ;
    stopatspace = savestopatspace ;
    endname () ;
    nameinprogress = savenameinprogress ;
    areadelimiter = saveareadelimiter ;
    extdelimiter = saveextdelimiter ;
  } 
  return Result ;
} 
strnumber 
zamakenamestring ( alphafile f ) 
{
  register strnumber Result; amakenamestring_regmem 
  Result = makenamestring () ;
  return Result ;
} 
strnumber 
zbmakenamestring ( bytefile f ) 
{
  register strnumber Result; bmakenamestring_regmem 
  Result = makenamestring () ;
  return Result ;
} 
strnumber 
zzwmakenamestring ( wordfile * f ) 
{
  register strnumber Result; wmakenamestring_regmem 
  Result = makenamestring () ;
  return Result ;
} 
void 
scanfilename ( void ) 
{
  /* 30 */ scanfilename_regmem 
  halfword savewarningindex  ;
  integer v, nn, jj  ;
  nameinprogress = true ;
  savewarningindex = warningindex ;
  warningindex = curcs ;
  do {
      getxtoken () ;
  } while ( ! ( curcmd != 10 ) ) ;
  backinput () ;
  if ( curcmd == 1 ) 
  {
    scanfilenamebraced () ;
  } 
  else {
      
    nameinprogress = true ;
    beginname () ;
    do {
	getxtoken () ;
    } while ( ! ( curcmd != 10 ) ) ;
    skipmode = false ;
    while ( true ) {
	
      if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
      {
	if ( ( isinternalUPTEX () ) ) 
	{
	  curchr = toUCS ( curchr ) ;
	  nn = UVSgetcodepointlength ( curchr ) ;
	  jj = 1 ;
	  while ( jj <= nn ) {
	      
	    v = UVSgetcodepointinsequence ( curchr , jj ) ;
	    if ( ( v > 0 ) ) 
	    {
	      {
		if ( poolptr + 4 > poolsize ) 
		overflow ( 260 , poolsize - initpoolptr ) ;
	      } 
	      v = UCStoUTF8 ( v ) ;
	      if ( BYTE1 ( v ) != 0 ) 
	      {
		strpool [poolptr ]= 256 + BYTE1 ( v ) ;
		incr ( poolptr ) ;
	      } 
	      if ( BYTE2 ( v ) != 0 ) 
	      {
		strpool [poolptr ]= 256 + BYTE2 ( v ) ;
		incr ( poolptr ) ;
	      } 
	      if ( BYTE3 ( v ) != 0 ) 
	      {
		strpool [poolptr ]= 256 + BYTE3 ( v ) ;
		incr ( poolptr ) ;
	      } 
	      {
		strpool [poolptr ]= 256 + BYTE4 ( v ) ;
		incr ( poolptr ) ;
	      } 
	    } 
	    incr ( jj ) ;
	  } 
	} 
	else {
	    
	  {
	    if ( poolptr + 4 > poolsize ) 
	    overflow ( 260 , poolsize - initpoolptr ) ;
	  } 
	  curchr = toBUFF ( curchr ) ;
	  if ( BYTE1 ( curchr ) != 0 ) 
	  {
	    strpool [poolptr ]= 256 + BYTE1 ( curchr ) ;
	    incr ( poolptr ) ;
	  } 
	  if ( BYTE2 ( curchr ) != 0 ) 
	  {
	    strpool [poolptr ]= 256 + BYTE2 ( curchr ) ;
	    incr ( poolptr ) ;
	  } 
	  if ( BYTE3 ( curchr ) != 0 ) 
	  {
	    strpool [poolptr ]= 256 + BYTE3 ( curchr ) ;
	    incr ( poolptr ) ;
	  } 
	  {
	    strpool [poolptr ]= 256 + BYTE4 ( curchr ) ;
	    incr ( poolptr ) ;
	  } 
	} 
      } 
      else if ( ( curcmd > 12 ) || ( curchr >= 11904 ) ) 
      {
	backinput () ;
	goto lab30 ;
      } 
      else if ( ( ( curchr == 32 ) && ( curinput .statefield != 0 ) && ( 
      curinput .locfield > curinput .limitfield ) ) || ! morename ( curchr ) ) 
      goto lab30 ;
      getxtoken () ;
    } 
  } 
  lab30: endname () ;
  nameinprogress = false ;
  skipmode = true ;
  warningindex = savewarningindex ;
} 
void 
zpackjobname ( strnumber s ) 
{
  packjobname_regmem 
  curarea = 349 ;
  curext = s ;
  curname = jobname ;
  packfilename ( curname , curarea , curext ) ;
} 
void 
zpromptfilename ( strnumber s , strnumber e ) 
{
  /* 30 */ promptfilename_regmem 
  integer k  ;
  strnumber savedcurname  ;
  strnumber savedcurext  ;
  strnumber savedcurarea  ;
  if ( interaction == 2 ) 
  ;
  if ( s == 943 ) 
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 944 ) ;
  } 
  else {
      
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 945 ) ;
  } 
  printfilename ( curname , curarea , curext ) ;
  print ( 946 ) ;
  if ( ( e == 947 ) || ( e == 349 ) ) 
  showcontext () ;
  println () ;
  printcstring ( promptfilenamehelpmsg ) ;
  if ( ( e != 349 ) ) 
  {
    print ( 948 ) ;
    print ( e ) ;
    print ( 39 ) ;
  } 
  print ( 41 ) ;
  println () ;
  printnl ( 949 ) ;
  print ( s ) ;
  if ( interaction < 2 ) 
  fatalerror ( 950 ) ;
  savedcurname = curname ;
  savedcurext = curext ;
  savedcurarea = curarea ;
  {
    ;
    print ( 657 ) ;
    terminput () ;
  } 
  {
    beginname () ;
    k = first ;
    while ( ( buffer [k ]== 32 ) && ( k < last ) ) incr ( k ) ;
    while ( true ) {
	
      if ( k == last ) 
      goto lab30 ;
      if ( ! morename ( buffer [k ]) ) 
      goto lab30 ;
      incr ( k ) ;
    } 
    lab30: endname () ;
  } 
  if ( ( ( strstart [curname + 1 ]- strstart [curname ]) == 0 ) && ( 
  curext == 349 ) && ( curarea == 349 ) ) 
  {
    curname = savedcurname ;
    curext = savedcurext ;
    curarea = savedcurarea ;
  } 
  else if ( curext == 349 ) 
  curext = e ;
  packfilename ( curname , curarea , curext ) ;
} 
void 
openlogfile ( void ) 
{
  openlogfile_regmem 
  unsigned char oldsetting  ;
  integer k  ;
  integer l  ;
  constcstring months  ;
  oldsetting = selector ;
  if ( jobname == 0 ) 
  jobname = getjobname ( 953 ) ;
  packjobname ( 954 ) ;
  recorderchangefilename ( stringcast ( nameoffile + 1 ) ) ;
  packjobname ( 955 ) ;
  while ( ! aopenout ( logfile ) ) {
      
    selector = 17 ;
    promptfilename ( 957 , 955 ) ;
  } 
  texmflogname = amakenamestring ( logfile ) ;
  selector = 18 ;
  logopened = true ;
  {
    if ( srcspecialsp || filelineerrorstylep || parsefirstlinep ) 
    fprintf ( logfile , "%s%s%s%s%s",  "This is e-upTeX, Version 3.141592653" , "-p4.1.2" ,     "-u2.02" , "-251130" , "-2.6" ) ;
    else
    fprintf ( logfile , "%s%s%s%s%s",  "This is e-upTeX, Version 3.141592653" , "-p4.1.2"     , "-u2.02" , "-251130" , "-2.6" ) ;
    Fputs ( logfile ,  " (" ) ;
    Fputs ( logfile ,  conststringcast ( getencstring () ) ) ;
    putc ( ')' ,  logfile );
    Fputs ( logfile ,  versionstring ) ;
    slowprint ( formatident ) ;
    print ( 958 ) ;
    printint ( sysday ) ;
    printchar ( 32 ) ;
    months = " JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC" ;
    {register integer for_end; k = 3 * sysmonth - 2 ;for_end = 3 * sysmonth 
    ; if ( k <= for_end) do 
      putc ( months [k ],  logfile );
    while ( k++ < for_end ) ;} 
    printchar ( 32 ) ;
    printint ( sysyear ) ;
    printchar ( 32 ) ;
    printtwo ( systime / 60 ) ;
    printchar ( 58 ) ;
    printtwo ( systime % 60 ) ;
    if ( ( eTeXmode == 1 ) ) 
    {
      ;
      putc ('\n',  logfile );
      Fputs ( logfile ,  "entering extended mode" ) ;
    } 
    if ( shellenabledp ) 
    {
      putc ('\n',  logfile );
      putc ( ' ' ,  logfile );
      if ( restrictedshell ) 
      {
	Fputs ( logfile ,  "restricted " ) ;
      } 
      Fputs ( logfile ,  "\\write18 enabled." ) ;
    } 
    if ( srcspecialsp ) 
    {
      putc ('\n',  logfile );
      Fputs ( logfile ,  " Source specials enabled." ) ;
    } 
    if ( filelineerrorstylep ) 
    {
      putc ('\n',  logfile );
      Fputs ( logfile ,  " file:line:error style messages enabled." ) ;
    } 
    if ( parsefirstlinep ) 
    {
      putc ('\n',  logfile );
      Fputs ( logfile ,  " %&-line parsing enabled." ) ;
    } 
    if ( translatefilename ) 
    {
      putc ('\n',  logfile );
      Fputs ( logfile ,  " (" ) ;
      fputs ( translatefilename , logfile ) ;
      putc ( ')' ,  logfile );
    } 
  } 
  if ( mltexenabledp ) 
  {
    putc ('\n',  logfile );
    Fputs ( logfile ,  "MLTeX v2.2 enabled" ) ;
  } 
  inputstack [inputptr ]= curinput ;
  printnl ( 956 ) ;
  l = inputstack [0 ].limitfield ;
  if ( buffer [l ]== eqtb [114410L ].cint ) 
  decr ( l ) ;
  printunreadbufferwithptenc ( 1 , l + 1 ) ;
  println () ;
  selector = oldsetting + 2 ;
} 
void 
startinput ( void ) 
{
  /* 30 */ startinput_regmem 
  strnumber tempstr  ;
  halfword v  ;
  scanfilename () ;
  packfilename ( curname , curarea , curext ) ;
  while ( true ) {
      
    beginfilereading () ;
    texinputtype = 1 ;
    if ( kpseinnameok ( stringcast ( nameoffile + 1 ) ) && aopenin ( inputfile 
    [curinput .indexfield ], kpsetexformat ) ) 
    goto lab30 ;
    endfilereading () ;
    promptfilename ( 943 , 349 ) ;
  } 
  lab30: curinput .namefield = amakenamestring ( inputfile [curinput 
  .indexfield ]) ;
  sourcefilenamestack [inopen ]= curinput .namefield ;
  fullsourcefilenamestack [inopen ]= makefullnamestring () ;
  if ( curinput .namefield == strptr - 1 ) 
  {
    tempstr = searchstring ( curinput .namefield ) ;
    if ( tempstr > 0 ) 
    {
      curinput .namefield = tempstr ;
      {
	decr ( strptr ) ;
	poolptr = strstart [strptr ];
      } 
    } 
  } 
  if ( jobname == 0 ) 
  {
    jobname = getjobname ( curname ) ;
    openlogfile () ;
  } 
  if ( termoffset + ( strstart [fullsourcefilenamestack [inopen ]+ 1 ]- 
  strstart [fullsourcefilenamestack [inopen ]]) > maxprintline - 2 ) 
  println () ;
  else if ( ( termoffset > 0 ) || ( fileoffset > 0 ) ) 
  printchar ( 32 ) ;
  printchar ( 40 ) ;
  incr ( openparens ) ;
  slowprintfilename ( fullsourcefilenamestack [inopen ]) ;
  fflush ( stdout ) ;
  if ( eqtb [114426L ].cint > 0 ) 
  {
    begindiagnostic () ;
    println () ;
    printchar ( 126 ) ;
    v = inputptr - 1 ;
    if ( v < eqtb [114426L ].cint ) 
    while ( v > 0 ) {
	
      printchar ( 46 ) ;
      decr ( v ) ;
    } 
    else printchar ( 126 ) ;
    slowprint ( 959 ) ;
    slowprint ( curname ) ;
    slowprint ( curext ) ;
    println () ;
    enddiagnostic ( false ) ;
  } 
  curinput .statefield = 85 ;
  synctexstartinput () ;
  {
    line = 1 ;
    if ( inputln ( inputfile [curinput .indexfield ], false ) ) 
    ;
    firmuptheline () ;
    if ( ( eqtb [114410L ].cint < 0 ) || ( eqtb [114410L ].cint > 255 ) ) 
    decr ( curinput .limitfield ) ;
    else buffer [curinput .limitfield ]= eqtb [114410L ].cint ;
    first = curinput .limitfield + 1 ;
    curinput .locfield = curinput .startfield ;
  } 
} 
fourquarters 
zeffectivecharinfo ( internalfontnumber f , quarterword c ) 
{
  /* 10 */ register fourquarters Result; effectivecharinfo_regmem 
  fourquarters ci  ;
  integer basec  ;
  if ( ! mltexenabledp ) 
  {
    Result = fontinfo [charbase [f ]+ c ].qqqq ;
    return Result ;
  } 
  if ( fontec [f ]>= c ) {
      
    if ( fontbc [f ]<= c ) 
    {
      ci = fontinfo [charbase [f ]+ c ].qqqq ;
      if ( ( ci .b0 > 0 ) ) 
      {
	Result = ci ;
	return Result ;
      } 
    } 
  } 
  if ( c >= eqtb [114423L ].cint ) {
      
    if ( c <= eqtb [114424L ].cint ) {
	
      if ( ( eqtb [114105L + c ].hh .v.RH > 0 ) ) 
      {
	basec = ( eqtb [114105L + c ].hh .v.RH % 256 ) ;
	if ( fontec [f ]>= basec ) {
	    
	  if ( fontbc [f ]<= basec ) 
	  {
	    ci = fontinfo [charbase [f ]+ basec ].qqqq ;
	    if ( ( ci .b0 > 0 ) ) 
	    {
	      Result = ci ;
	      return Result ;
	    } 
	  } 
	} 
      } 
    } 
  } 
  Result = nullcharacter ;
  return Result ;
} 
internalfontnumber 
zreadfontinfo ( halfword u , strnumber nom , strnumber aire , scaled s ) 
{
  /* 30 11 45 */ register internalfontnumber Result; readfontinfo_regmem 
  fontindex k  ;
  unsigned char jfmflag  ;
  halfword nt  ;
  KANJIcode cx  ;
  integer ofmflag  ;
  integer fontlevel, headerlength  ;
  integer fndir  ;
  integer ncw, nlw, neew  ;
  boolean nametoolong  ;
  boolean fileopened  ;
  halfword lf, lh, bc, ec, nw, nh, nd, ni, nl, nk, ne, np  ;
  internalfontnumber f  ;
  internalfontnumber g  ;
  integer a, b, c, d  ;
  fourquarters qw  ;
  scaled sw  ;
  integer bchlabel  ;
  short bchar  ;
  scaled z  ;
  integer alpha  ;
  unsigned char beta  ;
  g = 0 ;
  fileopened = false ;
  nametoolong = ( ( strstart [nom + 1 ]- strstart [nom ]) > 255 ) || ( ( 
  strstart [aire + 1 ]- strstart [aire ]) > 255 ) ;
  if ( nametoolong ) 
  goto lab11 ;
  packfilename ( nom , aire , 349 ) ;
  if ( ! ofmopenin ( tfmfile ) ) {
      
    if ( ! bopenin ( tfmfile ) ) 
    goto lab11 ;
  } 
  fileopened = true ;
  {
    {
      lf = tfmtemp ;
      if ( lf > 127 ) 
      goto lab11 ;
      tfmtemp = getc ( tfmfile ) ;
      lf = lf * 256 + tfmtemp ;
    } 
    tfmtemp = getc ( tfmfile ) ;
    {
      lh = tfmtemp ;
      if ( lh > 127 ) 
      goto lab11 ;
      tfmtemp = getc ( tfmfile ) ;
      lh = lh * 256 + tfmtemp ;
    } 
    ofmflag = 0 ;
    fontlevel = -1 ;
    ncw = 0 ;
    nlw = 0 ;
    neew = 0 ;
    if ( lf == 11 ) 
    {
      jfmflag = 4 ;
      nt = lh ;
      tfmtemp = getc ( tfmfile ) ;
      {
	lf = tfmtemp ;
	if ( lf > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	lf = lf * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	lh = tfmtemp ;
	if ( lh > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	lh = lh * 256 + tfmtemp ;
      } 
    } 
    else if ( lf == 9 ) 
    {
      jfmflag = 3 ;
      nt = lh ;
      tfmtemp = getc ( tfmfile ) ;
      {
	lf = tfmtemp ;
	if ( lf > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	lf = lf * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	lh = tfmtemp ;
	if ( lh > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	lh = lh * 256 + tfmtemp ;
      } 
    } 
    else if ( lf == 0 ) 
    {
      ofmflag = 1 ;
      fontlevel = lh ;
      jfmflag = 0 ;
      nt = 0 ;
      if ( ( fontlevel != 0 ) ) 
      goto lab11 ;
      tfmtemp = getc ( tfmfile ) ;
      {
	lf = tfmtemp ;
	if ( lf > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	lf = lf * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	lf = lf * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	lf = lf * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	lh = tfmtemp ;
	if ( lh > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	lh = lh * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	lh = lh * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	lh = lh * 256 + tfmtemp ;
      } 
    } 
    else {
	
      jfmflag = 0 ;
      nt = 0 ;
    } 
    if ( ofmflag != 1 ) 
    {
      tfmtemp = getc ( tfmfile ) ;
      {
	bc = tfmtemp ;
	if ( bc > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	bc = bc * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	ec = tfmtemp ;
	if ( ec > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	ec = ec * 256 + tfmtemp ;
      } 
      if ( ( bc > ec + 1 ) || ( ec > 255 ) ) 
      goto lab11 ;
      if ( bc > 255 ) 
      {
	bc = 1 ;
	ec = 0 ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nw = tfmtemp ;
	if ( nw > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nw = nw * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nh = tfmtemp ;
	if ( nh > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nh = nh * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nd = tfmtemp ;
	if ( nd > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nd = nd * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	ni = tfmtemp ;
	if ( ni > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	ni = ni * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nl = tfmtemp ;
	if ( nl > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nl = nl * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nk = tfmtemp ;
	if ( nk > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nk = nk * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	ne = tfmtemp ;
	if ( ne > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	ne = ne * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	np = tfmtemp ;
	if ( np > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	np = np * 256 + tfmtemp ;
      } 
    } 
    else {
	
      tfmtemp = getc ( tfmfile ) ;
      {
	bc = tfmtemp ;
	if ( bc > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	bc = bc * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	bc = bc * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	bc = bc * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	ec = tfmtemp ;
	if ( ec > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	ec = ec * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	ec = ec * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	ec = ec * 256 + tfmtemp ;
      } 
      if ( ( bc > ec + 1 ) || ( ec > 65535L ) ) 
      goto lab11 ;
      if ( bc > 65535L ) 
      {
	bc = 1 ;
	ec = 0 ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nw = tfmtemp ;
	if ( nw > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nw = nw * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nw = nw * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nw = nw * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nh = tfmtemp ;
	if ( nh > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nh = nh * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nh = nh * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nh = nh * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nd = tfmtemp ;
	if ( nd > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nd = nd * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nd = nd * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nd = nd * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	ni = tfmtemp ;
	if ( ni > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	ni = ni * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	ni = ni * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	ni = ni * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nl = tfmtemp ;
	if ( nl > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nl = nl * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nl = nl * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nl = nl * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	nk = tfmtemp ;
	if ( nk > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	nk = nk * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nk = nk * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	nk = nk * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	ne = tfmtemp ;
	if ( ne > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	ne = ne * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	ne = ne * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	ne = ne * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	np = tfmtemp ;
	if ( np > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	np = np * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	np = np * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	np = np * 256 + tfmtemp ;
      } 
      tfmtemp = getc ( tfmfile ) ;
      {
	fndir = tfmtemp ;
	if ( fndir > 127 ) 
	goto lab11 ;
	tfmtemp = getc ( tfmfile ) ;
	fndir = fndir * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	fndir = fndir * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	fndir = fndir * 256 + tfmtemp ;
      } 
      nlw = 2 * nl ;
      neew = 2 * ne ;
      if ( fontlevel == 0 ) 
      {
	headerlength = 14 ;
	ncw = 2 * ( ec - bc + 1 ) ;
      } 
      else {
	  
	goto lab11 ;
      } 
    } 
    if ( ofmflag != 0 ) 
    {
      if ( lf != headerlength + lh + ncw + nw + nh + nd + ni + nlw + nk + neew 
      + np ) 
      goto lab11 ;
    } 
    else if ( jfmflag != 0 ) 
    {
      if ( lf != 7 + lh + nt + ( ec - bc + 1 ) + nw + nh + nd + ni + nl + nk + 
      ne + np ) 
      goto lab11 ;
    } 
    else {
	
      if ( lf != 6 + lh + ( ec - bc + 1 ) + nw + nh + nd + ni + nl + nk + ne + 
      np ) 
      goto lab11 ;
    } 
    if ( ( nw == 0 ) || ( nh == 0 ) || ( nd == 0 ) || ( ni == 0 ) ) 
    goto lab11 ;
  } 
  if ( ofmflag != 0 ) 
  {
    if ( fontlevel == 0 ) 
    lf = lf - 14 - lh - ( ec - bc + 1 ) - nl - ne ;
    else goto lab11 ;
  } 
  else if ( jfmflag != 0 ) 
  lf = lf - 7 - lh ;
  else lf = lf - 6 - lh ;
  if ( np < 7 ) 
  lf = lf + 7 - np ;
  if ( ( fontptr == fontmax ) || ( fmemptr + lf > fontmemsize ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 961 ) ;
    } 
    sprintcs ( u ) ;
    printchar ( 61 ) ;
    printfilename ( nom , aire , 349 ) ;
    if ( s >= 0 ) 
    {
      print ( 888 ) ;
      printscaled ( s ) ;
      print ( 425 ) ;
    } 
    else if ( s != -1000 ) 
    {
      print ( 962 ) ;
      printint ( - (integer) s ) ;
    } 
    print ( 971 ) ;
    {
      helpptr = 4 ;
      helpline [3 ]= 972 ;
      helpline [2 ]= 973 ;
      helpline [1 ]= 974 ;
      helpline [0 ]= 975 ;
    } 
    error () ;
    goto lab30 ;
  } 
  f = fontptr + 1 ;
  fontdir [f ]= jfmflag ;
  fontenc [f ]= 0 ;
  if ( ( jfmflag == 0 ) && ( jfmenc >= 128 ) ) 
  fontenc [f ]= jfmenc ;
  if ( ( jfmflag != 0 ) && ( jfmenc <= 2 ) ) 
  fontenc [f ]= jfmenc ;
  fontnumext [f ]= nt ;
  ctypebase [f ]= fmemptr ;
  charbase [f ]= ctypebase [f ]+ nt - bc ;
  widthbase [f ]= charbase [f ]+ ec + 1 ;
  heightbase [f ]= widthbase [f ]+ nw ;
  depthbase [f ]= heightbase [f ]+ nh ;
  italicbase [f ]= depthbase [f ]+ nd ;
  ligkernbase [f ]= italicbase [f ]+ ni ;
  kernbase [f ]= ligkernbase [f ]+ nl - 256 * ( 128 ) ;
  extenbase [f ]= kernbase [f ]+ 256 * ( 128 ) + nk ;
  parambase [f ]= extenbase [f ]+ ne ;
  {
    if ( lh < 2 ) 
    goto lab11 ;
    {
      tfmtemp = getc ( tfmfile ) ;
      a = tfmtemp ;
      qw .b0 = a ;
      tfmtemp = getc ( tfmfile ) ;
      b = tfmtemp ;
      qw .b1 = b ;
      tfmtemp = getc ( tfmfile ) ;
      c = tfmtemp ;
      qw .b2 = c ;
      tfmtemp = getc ( tfmfile ) ;
      d = tfmtemp ;
      qw .b3 = d ;
      fontcheck [f ]= qw ;
    } 
    tfmtemp = getc ( tfmfile ) ;
    {
      z = tfmtemp ;
      if ( z > 127 ) 
      goto lab11 ;
      tfmtemp = getc ( tfmfile ) ;
      z = z * 256 + tfmtemp ;
    } 
    tfmtemp = getc ( tfmfile ) ;
    z = z * 256 + tfmtemp ;
    tfmtemp = getc ( tfmfile ) ;
    z = ( z * 16 ) + ( tfmtemp / 16 ) ;
    if ( z < 65536L ) 
    goto lab11 ;
    while ( lh > 2 ) {
	
      tfmtemp = getc ( tfmfile ) ;
      tfmtemp = getc ( tfmfile ) ;
      tfmtemp = getc ( tfmfile ) ;
      tfmtemp = getc ( tfmfile ) ;
      decr ( lh ) ;
    } 
    fontdsize [f ]= z ;
    if ( s != -1000 ) {
	
      if ( s >= 0 ) 
      z = s ;
      else {
	  
	savearitherror = aritherror ;
	sw = z ;
	z = xnoverd ( z , - (integer) s , 1000 ) ;
	if ( aritherror || z >= 134217728L ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 961 ) ;
	  } 
	  sprintcs ( u ) ;
	  printchar ( 61 ) ;
	  printfilename ( nom , aire , 349 ) ;
	  if ( s >= 0 ) 
	  {
	    print ( 888 ) ;
	    printscaled ( s ) ;
	    print ( 425 ) ;
	  } 
	  else if ( s != -1000 ) 
	  {
	    print ( 962 ) ;
	    printint ( - (integer) s ) ;
	  } 
	  print ( 976 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 977 ;
	  } 
	  error () ;
	  z = sw ;
	} 
	aritherror = savearitherror ;
      } 
    } 
    fontsize [f ]= z ;
  } 
  if ( ofmflag != 0 ) 
  {
    if ( fontlevel == 1 ) 
    {
      goto lab11 ;
    } 
  } 
  else if ( jfmflag != 0 ) 
  {register integer for_end; k = ctypebase [f ];for_end = ctypebase [f ]
  + nt - 1 ; if ( k <= for_end) do 
    {
      tfmtemp = getc ( tfmfile ) ;
      {
	cx = tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	cx = cx * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	cx = cx + tfmtemp * 65536L ;
      } 
      if ( jfmenc == 2 ) 
      fontinfo [k ].hh .v.RH = toDVI ( fromUCS ( cx ) ) ;
      else if ( jfmenc == 1 ) 
      fontinfo [k ].hh .v.RH = toDVI ( fromJIS ( cx ) ) ;
      else fontinfo [k ].hh .v.RH = cx ;
      tfmtemp = getc ( tfmfile ) ;
      cx = tfmtemp ;
      fontinfo [k ].hh .lhfield = cx ;
    } 
  while ( k++ < for_end ) ;} 
  k = charbase [f ]+ bc ;
  while ( k <= widthbase [f ]- 1 ) {
      
    {
      if ( ( ofmflag != 0 ) ) 
      {
	tfmtemp = getc ( tfmfile ) ;
	{
	  a = tfmtemp ;
	  tfmtemp = getc ( tfmfile ) ;
	  a = a * 256 + tfmtemp ;
	} 
	qw .b0 = a ;
	tfmtemp = getc ( tfmfile ) ;
	{
	  b = tfmtemp ;
	  tfmtemp = getc ( tfmfile ) ;
	  b = b * 256 + tfmtemp ;
	} 
	qw .b1 = b ;
	tfmtemp = getc ( tfmfile ) ;
	{
	  c = tfmtemp ;
	  tfmtemp = getc ( tfmfile ) ;
	  c = c * 256 + tfmtemp ;
	} 
	qw .b2 = c ;
	tfmtemp = getc ( tfmfile ) ;
	{
	  d = tfmtemp ;
	  tfmtemp = getc ( tfmfile ) ;
	  d = d * 256 + tfmtemp ;
	} 
	qw .b3 = d ;
	fontinfo [k ].qqqq = qw ;
      } 
      else {
	  
	tfmtemp = getc ( tfmfile ) ;
	a = tfmtemp ;
	qw .b0 = a ;
	tfmtemp = getc ( tfmfile ) ;
	b = tfmtemp ;
	b = ( b / 16 ) * 256 + ( b % 16 ) ;
	qw .b1 = b ;
	tfmtemp = getc ( tfmfile ) ;
	c = tfmtemp ;
	c = ( c / 4 ) * 256 + ( c % 4 ) ;
	qw .b2 = c ;
	tfmtemp = getc ( tfmfile ) ;
	d = tfmtemp ;
	qw .b3 = d ;
	fontinfo [k ].qqqq = qw ;
      } 
    } 
    if ( ( a >= nw ) || ( ( b / 256 ) >= nh ) || ( ( b % 256 ) >= nd ) || ( ( 
    c / 256 ) >= ni ) ) 
    goto lab11 ;
    switch ( c % 4 ) 
    {case 1 : 
      if ( d >= nl ) 
      goto lab11 ;
      break ;
    case 3 : 
      if ( d >= ne ) 
      goto lab11 ;
      break ;
    case 2 : 
      {
	{
	  if ( ( d < bc ) || ( d > ec ) ) 
	  goto lab11 ;
	} 
	while ( d < k - charbase [f ]) {
	    
	  qw = fontinfo [charbase [f ]+ d ].qqqq ;
	  if ( ( ( qw .b2 ) % 4 ) != 2 ) 
	  goto lab45 ;
	  d = qw .b3 ;
	} 
	if ( d == k - charbase [f ]) 
	goto lab11 ;
	lab45: ;
      } 
      break ;
      default: 
      ;
      break ;
    } 
    incr ( k ) ;
    if ( fontlevel == 1 ) 
    {
      goto lab11 ;
    } 
  } 
  {
    {
      alpha = 16 ;
      while ( z >= 8388608L ) {
	  
	z = z / 2 ;
	alpha = alpha + alpha ;
      } 
      beta = 256 / alpha ;
      alpha = alpha * z ;
    } 
    {register integer for_end; k = widthbase [f ];for_end = ligkernbase [
    f ]- 1 ; if ( k <= for_end) do 
      {
	tfmtemp = getc ( tfmfile ) ;
	a = tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	b = tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	c = tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	d = tfmtemp ;
	sw = ( ( ( ( ( d * z ) / 256 ) + ( c * z ) ) / 256 ) + ( b * z ) ) / 
	beta ;
	if ( a == 0 ) 
	fontinfo [k ].cint = sw ;
	else if ( a == 255 ) 
	fontinfo [k ].cint = sw - alpha ;
	else goto lab11 ;
      } 
    while ( k++ < for_end ) ;} 
    if ( fontinfo [widthbase [f ]].cint != 0 ) 
    goto lab11 ;
    if ( fontinfo [heightbase [f ]].cint != 0 ) 
    goto lab11 ;
    if ( fontinfo [depthbase [f ]].cint != 0 ) 
    goto lab11 ;
    if ( fontinfo [italicbase [f ]].cint != 0 ) 
    goto lab11 ;
  } 
  bchlabel = 32767 ;
  bchar = 11904 ;
  if ( nl > 0 ) 
  {
    {register integer for_end; k = ligkernbase [f ];for_end = kernbase [f 
    ]+ 256 * ( 128 ) - 1 ; if ( k <= for_end) do 
      {
	{
	  if ( ( ofmflag != 0 ) ) 
	  {
	    tfmtemp = getc ( tfmfile ) ;
	    {
	      a = tfmtemp ;
	      tfmtemp = getc ( tfmfile ) ;
	      a = a * 256 + tfmtemp ;
	    } 
	    qw .b0 = a ;
	    tfmtemp = getc ( tfmfile ) ;
	    {
	      b = tfmtemp ;
	      tfmtemp = getc ( tfmfile ) ;
	      b = b * 256 + tfmtemp ;
	    } 
	    qw .b1 = b ;
	    tfmtemp = getc ( tfmfile ) ;
	    {
	      c = tfmtemp ;
	      tfmtemp = getc ( tfmfile ) ;
	      c = c * 256 + tfmtemp ;
	    } 
	    qw .b2 = c ;
	    tfmtemp = getc ( tfmfile ) ;
	    {
	      d = tfmtemp ;
	      tfmtemp = getc ( tfmfile ) ;
	      d = d * 256 + tfmtemp ;
	    } 
	    qw .b3 = d ;
	    fontinfo [k ].qqqq = qw ;
	  } 
	  else {
	      
	    tfmtemp = getc ( tfmfile ) ;
	    a = tfmtemp ;
	    qw .b0 = a ;
	    tfmtemp = getc ( tfmfile ) ;
	    b = tfmtemp ;
	    qw .b1 = b ;
	    tfmtemp = getc ( tfmfile ) ;
	    c = tfmtemp ;
	    qw .b2 = c ;
	    tfmtemp = getc ( tfmfile ) ;
	    d = tfmtemp ;
	    qw .b3 = d ;
	    fontinfo [k ].qqqq = qw ;
	  } 
	} 
	if ( a > 128 ) 
	{
	  if ( 256 * c + d >= nl ) 
	  goto lab11 ;
	  if ( a == 255 ) {
	      
	    if ( k == ligkernbase [f ]) 
	    bchar = b ;
	  } 
	} 
	else {
	    
	  if ( b != bchar ) 
	  {
	    {
	      if ( ( b < bc ) || ( b > ec ) ) 
	      goto lab11 ;
	    } 
	    qw = fontinfo [charbase [f ]+ b ].qqqq ;
	    if ( ! ( qw .b0 > 0 ) ) 
	    goto lab11 ;
	  } 
	  if ( c < 128 ) 
	  {
	    if ( jfmflag != 0 ) 
	    {
	      if ( 256 * c + d >= ne ) 
	      goto lab11 ;
	    } 
	    else {
		
	      {
		if ( ( d < bc ) || ( d > ec ) ) 
		goto lab11 ;
	      } 
	      qw = fontinfo [charbase [f ]+ d ].qqqq ;
	      if ( ! ( qw .b0 > 0 ) ) 
	      goto lab11 ;
	    } 
	  } 
	  else if ( 256 * ( c - 128 ) + d >= nk ) 
	  goto lab11 ;
	  if ( a < 128 ) {
	      
	    if ( k - ligkernbase [f ]+ a + 1 >= nl ) 
	    goto lab11 ;
	  } 
	} 
      } 
    while ( k++ < for_end ) ;} 
    if ( a == 255 ) 
    bchlabel = 256 * c + d ;
  } 
  {register integer for_end; k = kernbase [f ]+ 256 * ( 128 ) ;for_end = 
  extenbase [f ]- 1 ; if ( k <= for_end) do 
    {
      tfmtemp = getc ( tfmfile ) ;
      a = tfmtemp ;
      tfmtemp = getc ( tfmfile ) ;
      b = tfmtemp ;
      tfmtemp = getc ( tfmfile ) ;
      c = tfmtemp ;
      tfmtemp = getc ( tfmfile ) ;
      d = tfmtemp ;
      sw = ( ( ( ( ( d * z ) / 256 ) + ( c * z ) ) / 256 ) + ( b * z ) ) / 
      beta ;
      if ( a == 0 ) 
      fontinfo [k ].cint = sw ;
      else if ( a == 255 ) 
      fontinfo [k ].cint = sw - alpha ;
      else goto lab11 ;
    } 
  while ( k++ < for_end ) ;} 
  if ( jfmflag != 0 ) 
  {register integer for_end; k = extenbase [f ];for_end = parambase [f ]
  - 1 ; if ( k <= for_end) do 
    {
      tfmtemp = getc ( tfmfile ) ;
      a = tfmtemp ;
      tfmtemp = getc ( tfmfile ) ;
      b = tfmtemp ;
      tfmtemp = getc ( tfmfile ) ;
      c = tfmtemp ;
      tfmtemp = getc ( tfmfile ) ;
      d = tfmtemp ;
      sw = ( ( ( ( ( d * z ) / 256 ) + ( c * z ) ) / 256 ) + ( b * z ) ) / 
      beta ;
      if ( a == 0 ) 
      fontinfo [k ].cint = sw ;
      else if ( a == 255 ) 
      fontinfo [k ].cint = sw - alpha ;
      else goto lab11 ;
    } 
  while ( k++ < for_end ) ;} 
  else {
      register integer for_end; k = extenbase [f ];for_end = parambase [
  f ]- 1 ; if ( k <= for_end) do 
    {
      {
	if ( ( ofmflag != 0 ) ) 
	{
	  tfmtemp = getc ( tfmfile ) ;
	  {
	    a = tfmtemp ;
	    tfmtemp = getc ( tfmfile ) ;
	    a = a * 256 + tfmtemp ;
	  } 
	  qw .b0 = a ;
	  tfmtemp = getc ( tfmfile ) ;
	  {
	    b = tfmtemp ;
	    tfmtemp = getc ( tfmfile ) ;
	    b = b * 256 + tfmtemp ;
	  } 
	  qw .b1 = b ;
	  tfmtemp = getc ( tfmfile ) ;
	  {
	    c = tfmtemp ;
	    tfmtemp = getc ( tfmfile ) ;
	    c = c * 256 + tfmtemp ;
	  } 
	  qw .b2 = c ;
	  tfmtemp = getc ( tfmfile ) ;
	  {
	    d = tfmtemp ;
	    tfmtemp = getc ( tfmfile ) ;
	    d = d * 256 + tfmtemp ;
	  } 
	  qw .b3 = d ;
	  fontinfo [k ].qqqq = qw ;
	} 
	else {
	    
	  tfmtemp = getc ( tfmfile ) ;
	  a = tfmtemp ;
	  qw .b0 = a ;
	  tfmtemp = getc ( tfmfile ) ;
	  b = tfmtemp ;
	  qw .b1 = b ;
	  tfmtemp = getc ( tfmfile ) ;
	  c = tfmtemp ;
	  qw .b2 = c ;
	  tfmtemp = getc ( tfmfile ) ;
	  d = tfmtemp ;
	  qw .b3 = d ;
	  fontinfo [k ].qqqq = qw ;
	} 
      } 
      if ( a != 0 ) 
      {
	{
	  if ( ( a < bc ) || ( a > ec ) ) 
	  goto lab11 ;
	} 
	qw = fontinfo [charbase [f ]+ a ].qqqq ;
	if ( ! ( qw .b0 > 0 ) ) 
	goto lab11 ;
      } 
      if ( b != 0 ) 
      {
	{
	  if ( ( b < bc ) || ( b > ec ) ) 
	  goto lab11 ;
	} 
	qw = fontinfo [charbase [f ]+ b ].qqqq ;
	if ( ! ( qw .b0 > 0 ) ) 
	goto lab11 ;
      } 
      if ( c != 0 ) 
      {
	{
	  if ( ( c < bc ) || ( c > ec ) ) 
	  goto lab11 ;
	} 
	qw = fontinfo [charbase [f ]+ c ].qqqq ;
	if ( ! ( qw .b0 > 0 ) ) 
	goto lab11 ;
      } 
      {
	{
	  if ( ( d < bc ) || ( d > ec ) ) 
	  goto lab11 ;
	} 
	qw = fontinfo [charbase [f ]+ d ].qqqq ;
	if ( ! ( qw .b0 > 0 ) ) 
	goto lab11 ;
      } 
    } 
  while ( k++ < for_end ) ;} 
  {
    {register integer for_end; k = 1 ;for_end = np ; if ( k <= for_end) do 
      if ( k == 1 ) 
      {
	tfmtemp = getc ( tfmfile ) ;
	sw = tfmtemp ;
	if ( sw > 127 ) 
	sw = sw - 256 ;
	tfmtemp = getc ( tfmfile ) ;
	sw = sw * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	sw = sw * 256 + tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	fontinfo [parambase [f ]].cint = ( sw * 16 ) + ( tfmtemp / 16 ) ;
      } 
      else {
	  
	tfmtemp = getc ( tfmfile ) ;
	a = tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	b = tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	c = tfmtemp ;
	tfmtemp = getc ( tfmfile ) ;
	d = tfmtemp ;
	sw = ( ( ( ( ( d * z ) / 256 ) + ( c * z ) ) / 256 ) + ( b * z ) ) / 
	beta ;
	if ( a == 0 ) 
	fontinfo [parambase [f ]+ k - 1 ].cint = sw ;
	else if ( a == 255 ) 
	fontinfo [parambase [f ]+ k - 1 ].cint = sw - alpha ;
	else goto lab11 ;
      } 
    while ( k++ < for_end ) ;} 
    if ( feof ( tfmfile ) ) 
    goto lab11 ;
    {register integer for_end; k = np + 1 ;for_end = 7 ; if ( k <= for_end) 
    do 
      fontinfo [parambase [f ]+ k - 1 ].cint = 0 ;
    while ( k++ < for_end ) ;} 
  } 
  if ( np >= 7 ) 
  fontparams [f ]= np ;
  else fontparams [f ]= 7 ;
  hyphenchar [f ]= eqtb [114408L ].cint ;
  skewchar [f ]= eqtb [114409L ].cint ;
  if ( bchlabel < nl ) 
  bcharlabel [f ]= bchlabel + ligkernbase [f ];
  else bcharlabel [f ]= 0 ;
  fontbchar [f ]= bchar ;
  fontfalsebchar [f ]= bchar ;
  if ( bchar <= ec ) {
      
    if ( bchar >= bc ) 
    {
      qw = fontinfo [charbase [f ]+ bchar ].qqqq ;
      if ( ( qw .b0 > 0 ) ) 
      fontfalsebchar [f ]= 11904 ;
    } 
  } 
  fontname [f ]= nom ;
  fontarea [f ]= aire ;
  fontbc [f ]= bc ;
  fontec [f ]= ec ;
  fontglue [f ]= -1073741823L ;
  ctypebase [f ]= ctypebase [f ];
  charbase [f ]= charbase [f ];
  widthbase [f ]= widthbase [f ];
  ligkernbase [f ]= ligkernbase [f ];
  kernbase [f ]= kernbase [f ];
  extenbase [f ]= extenbase [f ];
  decr ( parambase [f ]) ;
  fmemptr = fmemptr + lf ;
  fontptr = f ;
  g = f ;
  goto lab30 ;
  lab11: {
      
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 961 ) ;
  } 
  sprintcs ( u ) ;
  printchar ( 61 ) ;
  printfilename ( nom , aire , 349 ) ;
  if ( s >= 0 ) 
  {
    print ( 888 ) ;
    printscaled ( s ) ;
    print ( 425 ) ;
  } 
  else if ( s != -1000 ) 
  {
    print ( 962 ) ;
    printint ( - (integer) s ) ;
  } 
  if ( fileopened ) 
  print ( 963 ) ;
  else if ( nametoolong ) 
  print ( 964 ) ;
  else print ( 965 ) ;
  {
    helpptr = 5 ;
    helpline [4 ]= 966 ;
    helpline [3 ]= 967 ;
    helpline [2 ]= 968 ;
    helpline [1 ]= 969 ;
    helpline [0 ]= 970 ;
  } 
  error () ;
  lab30: if ( fileopened ) 
  bclose ( tfmfile ) ;
  Result = g ;
  return Result ;
} 
void 
zcharwarning ( internalfontnumber f , sixteenbits c ) 
{
  charwarning_regmem 
  unsigned char l  ;
  integer oldsetting  ;
  if ( eqtb [114396L ].cint > 0 ) 
  {
    oldsetting = eqtb [114390L ].cint ;
    if ( ( eTeXmode == 1 ) && ( eqtb [114396L ].cint > 1 ) ) 
    eqtb [114390L ].cint = 1 ;
    if ( eqtb [114396L ].cint > 2 ) 
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 986 ) ;
    } 
    else {
	
      begindiagnostic () ;
      printnl ( 986 ) ;
    } 
    if ( ( c < 32 ) || ( c > 126 ) ) 
    {
      printchar ( 94 ) ;
      printchar ( 94 ) ;
      if ( c < 64 ) 
      printchar ( c + 64 ) ;
      else if ( c < 128 ) 
      printchar ( c - 64 ) ;
      else if ( c < 256 ) 
      {
	l = c / 16 ;
	if ( l < 10 ) 
	printchar ( l + 48 ) ;
	else printchar ( l + 87 ) ;
	l = c % 16 ;
	if ( l < 10 ) 
	printchar ( l + 48 ) ;
	else printchar ( l + 87 ) ;
      } 
      else {
	  
	printchar ( 94 ) ;
	printchar ( 94 ) ;
	l = c / 4096 ;
	if ( l < 10 ) 
	printchar ( l + 48 ) ;
	else printchar ( l + 87 ) ;
	l = ( c % 4096 ) / 256 ;
	if ( l < 10 ) 
	printchar ( l + 48 ) ;
	else printchar ( l + 87 ) ;
	l = ( c % 256 ) / 16 ;
	if ( l < 10 ) 
	printchar ( l + 48 ) ;
	else printchar ( l + 87 ) ;
	l = c % 16 ;
	if ( l < 10 ) 
	printchar ( l + 48 ) ;
	else printchar ( l + 87 ) ;
      } 
    } 
    else print ( c ) ;
    if ( eqtb [114396L ].cint > 2 ) 
    {
      print ( 287 ) ;
      printhex ( c ) ;
      print ( 41 ) ;
    } 
    print ( 987 ) ;
    slowprint ( fontname [f ]) ;
    if ( eqtb [114396L ].cint < 3 ) 
    printchar ( 33 ) ;
    eqtb [114390L ].cint = oldsetting ;
    if ( eqtb [114396L ].cint > 2 ) 
    {
      helpptr = 0 ;
      error () ;
    } 
    else enddiagnostic ( false ) ;
  } 
} 
void 
zcharwarningjis ( internalfontnumber f , KANJIcode jc ) 
{
  charwarningjis_regmem 
  integer oldsetting  ;
  if ( eqtb [114396L ].cint > 0 ) 
  {
    oldsetting = eqtb [114390L ].cint ;
    if ( ( eTeXmode == 1 ) && ( eqtb [114396L ].cint > 1 ) ) 
    eqtb [114390L ].cint = 1 ;
    if ( eqtb [114396L ].cint > 2 ) 
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 988 ) ;
    } 
    else {
	
      begindiagnostic () ;
      printnl ( 988 ) ;
    } 
    printkanji ( jc ) ;
    print ( 287 ) ;
    printhex ( jc ) ;
    print ( 989 ) ;
    slowprint ( fontname [f ]) ;
    printchar ( 44 ) ;
    if ( eqtb [114396L ].cint > 2 ) 
    {
      printnl ( 990 ) ;
      helpptr = 0 ;
      error () ;
    } 
    else {
	
      printnl ( 991 ) ;
      enddiagnostic ( false ) ;
    } 
    eqtb [114390L ].cint = oldsetting ;
  } 
} 
halfword 
znewcharacter ( internalfontnumber f , sixteenbits c ) 
{
  /* 10 */ register halfword Result; newcharacter_regmem 
  halfword p  ;
  quarterword ec, cc  ;
  cc = c ;
  c = ptencucsto8bitcode ( fontenc [f ], c ) ;
  ec = effectivechar ( false , f , c ) ;
  if ( fontbc [f ]<= ec ) {
      
    if ( fontec [f ]>= ec ) {
	
      if ( ( fontinfo [charbase [f ]+ ec ].qqqq .b0 > 0 ) ) 
      {
	p = getavail () ;
	mem [p ].hh.b0 = f ;
	mem [p ].hh.b1 = c ;
	Result = p ;
	return Result ;
      } 
    } 
  } 
  charwarning ( f , cc ) ;
  Result = -1073741823L ;
  return Result ;
} 
void 
dviswap ( void ) 
{
  dviswap_regmem 
  if ( dviptr > ( 2147483647L - dvioffset ) ) 
  {
    curs = -2 ;
    fatalerror ( 992 ) ;
  } 
  if ( dvilimit == dvibufsize ) 
  {
    writedvi ( 0 , halfbuf - 1 ) ;
    dvilimit = halfbuf ;
    dvioffset = dvioffset + dvibufsize ;
    dviptr = 0 ;
  } 
  else {
      
    writedvi ( halfbuf , dvibufsize - 1 ) ;
    dvilimit = dvibufsize ;
  } 
  dvigone = dvigone + halfbuf ;
} 
void 
zdvifour ( integer x ) 
{
  dvifour_regmem 
  if ( x >= 0 ) 
  {
    dvibuf [dviptr ]= x / 16777216L ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  else {
      
    x = x + 1073741824L ;
    x = x + 1073741824L ;
    {
      dvibuf [dviptr ]= ( x / 16777216L ) + 128 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
  } 
  x = x % 16777216L ;
  {
    dvibuf [dviptr ]= x / 65536L ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  x = x % 65536L ;
  {
    dvibuf [dviptr ]= x / 256 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  {
    dvibuf [dviptr ]= x % 256 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
} 
void 
zdvipop ( integer l ) 
{
  dvipop_regmem 
  if ( ( l == dvioffset + dviptr ) && ( dviptr > 0 ) ) 
  decr ( dviptr ) ;
  else {
      
    dvibuf [dviptr ]= 142 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
} 
void 
zdvifontdef ( internalfontnumber f ) 
{
  dvifontdef_regmem 
  poolpointer k  ;
  if ( f <= 256 ) 
  {
    {
      dvibuf [dviptr ]= 243 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    {
      dvibuf [dviptr ]= f - 1 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
  } 
  else {
      
    {
      dvibuf [dviptr ]= 244 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    {
      dvibuf [dviptr ]= ( f - 1 ) / 256 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    {
      dvibuf [dviptr ]= ( f - 1 ) % 256 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
  } 
  {
    dvibuf [dviptr ]= fontcheck [f ].b0 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  {
    dvibuf [dviptr ]= fontcheck [f ].b1 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  {
    dvibuf [dviptr ]= fontcheck [f ].b2 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  {
    dvibuf [dviptr ]= fontcheck [f ].b3 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  dvifour ( fontsize [f ]) ;
  dvifour ( fontdsize [f ]) ;
  {
    dvibuf [dviptr ]= ( strstart [fontarea [f ]+ 1 ]- strstart [
    fontarea [f ]]) ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  {
    dvibuf [dviptr ]= ( strstart [fontname [f ]+ 1 ]- strstart [
    fontname [f ]]) ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  {register integer for_end; k = strstart [fontarea [f ]];for_end = 
  strstart [fontarea [f ]+ 1 ]- 1 ; if ( k <= for_end) do 
    {
      dvibuf [dviptr ]= strpool [k ];
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
  while ( k++ < for_end ) ;} 
  {register integer for_end; k = strstart [fontname [f ]];for_end = 
  strstart [fontname [f ]+ 1 ]- 1 ; if ( k <= for_end) do 
    {
      dvibuf [dviptr ]= strpool [k ];
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
  while ( k++ < for_end ) ;} 
} 
void 
zmovement ( scaled w , eightbits o ) 
{
  /* 10 40 45 2 1 */ movement_regmem 
  smallnumber mstate  ;
  halfword p, q  ;
  integer k  ;
  q = getnode ( 3 ) ;
  mem [q + 1 ].cint = w ;
  mem [q + 2 ].cint = dvioffset + dviptr ;
  if ( o == 157 ) 
  {
    mem [q ].hh .v.RH = downptr ;
    downptr = q ;
  } 
  else {
      
    mem [q ].hh .v.RH = rightptr ;
    rightptr = q ;
  } 
  p = mem [q ].hh .v.RH ;
  mstate = 0 ;
  while ( p != -1073741823L ) {
      
    if ( mem [p + 1 ].cint == w ) 
    switch ( mstate + mem [p ].hh .v.LH ) 
    {case 3 : 
    case 4 : 
    case 15 : 
    case 16 : 
      if ( mem [p + 2 ].cint < dvigone ) 
      goto lab45 ;
      else {
	  
	k = mem [p + 2 ].cint - dvioffset ;
	if ( k < 0 ) 
	k = k + dvibufsize ;
	dvibuf [k ]= dvibuf [k ]+ 5 ;
	mem [p ].hh .v.LH = 1 ;
	goto lab40 ;
      } 
      break ;
    case 5 : 
    case 9 : 
    case 11 : 
      if ( mem [p + 2 ].cint < dvigone ) 
      goto lab45 ;
      else {
	  
	k = mem [p + 2 ].cint - dvioffset ;
	if ( k < 0 ) 
	k = k + dvibufsize ;
	dvibuf [k ]= dvibuf [k ]+ 10 ;
	mem [p ].hh .v.LH = 2 ;
	goto lab40 ;
      } 
      break ;
    case 1 : 
    case 2 : 
    case 8 : 
    case 13 : 
      goto lab40 ;
      break ;
      default: 
      ;
      break ;
    } 
    else switch ( mstate + mem [p ].hh .v.LH ) 
    {case 1 : 
      mstate = 6 ;
      break ;
    case 2 : 
      mstate = 12 ;
      break ;
    case 8 : 
    case 13 : 
      goto lab45 ;
      break ;
      default: 
      ;
      break ;
    } 
    p = mem [p ].hh .v.RH ;
  } 
  lab45: ;
  mem [q ].hh .v.LH = 3 ;
  if ( abs ( w ) >= 8388608L ) 
  {
    {
      dvibuf [dviptr ]= o + 3 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    dvifour ( w ) ;
    return ;
  } 
  if ( abs ( w ) >= 32768L ) 
  {
    {
      dvibuf [dviptr ]= o + 2 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    if ( w < 0 ) 
    w = w + 16777216L ;
    {
      dvibuf [dviptr ]= w / 65536L ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    w = w % 65536L ;
    goto lab2 ;
  } 
  if ( abs ( w ) >= 128 ) 
  {
    {
      dvibuf [dviptr ]= o + 1 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    if ( w < 0 ) 
    w = w + 65536L ;
    goto lab2 ;
  } 
  {
    dvibuf [dviptr ]= o ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  if ( w < 0 ) 
  w = w + 256 ;
  goto lab1 ;
  lab2: {
      
    dvibuf [dviptr ]= w / 256 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  lab1: {
      
    dvibuf [dviptr ]= w % 256 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  return ;
  lab40: mem [q ].hh .v.LH = mem [p ].hh .v.LH ;
  if ( mem [q ].hh .v.LH == 1 ) 
  {
    {
      dvibuf [dviptr ]= o + 4 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    while ( mem [q ].hh .v.RH != p ) {
	
      q = mem [q ].hh .v.RH ;
      switch ( mem [q ].hh .v.LH ) 
      {case 3 : 
	mem [q ].hh .v.LH = 5 ;
	break ;
      case 4 : 
	mem [q ].hh .v.LH = 6 ;
	break ;
	default: 
	;
	break ;
      } 
    } 
  } 
  else {
      
    {
      dvibuf [dviptr ]= o + 9 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    while ( mem [q ].hh .v.RH != p ) {
	
      q = mem [q ].hh .v.RH ;
      switch ( mem [q ].hh .v.LH ) 
      {case 3 : 
	mem [q ].hh .v.LH = 4 ;
	break ;
      case 5 : 
	mem [q ].hh .v.LH = 6 ;
	break ;
	default: 
	;
	break ;
      } 
    } 
  } 
} 
void 
zprunemovements ( integer l ) 
{
  /* 30 10 */ prunemovements_regmem 
  halfword p  ;
  while ( downptr != -1073741823L ) {
      
    if ( mem [downptr + 2 ].cint < l ) 
    goto lab30 ;
    p = downptr ;
    downptr = mem [p ].hh .v.RH ;
    freenode ( p , 3 ) ;
  } 
  lab30: while ( rightptr != -1073741823L ) {
      
    if ( mem [rightptr + 2 ].cint < l ) 
    return ;
    p = rightptr ;
    rightptr = mem [p ].hh .v.RH ;
    freenode ( p , 3 ) ;
  } 
} 
void 
zspecialout ( halfword p ) 
{
  /* 30 */ specialout_regmem 
  unsigned char oldsetting  ;
  halfword h  ;
  poolpointer k  ;
  halfword q, r  ;
  integer oldmode  ;
  scaled s, t, cw, num, denom  ;
  boolean bl  ;
  smallnumber i  ;
  if ( curh != dvih ) 
  {
    movement ( curh - dvih , 143 ) ;
    dvih = curh ;
  } 
  if ( curv != dviv ) 
  {
    movement ( curv - dviv , 157 ) ;
    dviv = curv ;
  } 
  oldsetting = selector ;
  if ( mem [p ].hh.b1 == 4 ) 
  {
    q = getavail () ;
    mem [q ].hh .v.LH = 131197L ;
    r = getavail () ;
    mem [q ].hh .v.RH = r ;
    mem [r ].hh .v.LH = 536909729L ;
    begintokenlist ( q , 4 ) ;
    begintokenlist ( mem [p + 1 ].hh .v.RH , 16 ) ;
    q = getavail () ;
    mem [q ].hh .v.LH = 65659L ;
    begintokenlist ( q , 4 ) ;
    oldmode = curlist .modefield ;
    curlist .modefield = 0 ;
    curcs = writeloc ;
    q = scantoks ( false , true ) ;
    curlist .modefield = oldmode ;
    gettoken () ;
    if ( curtok != 536909729L ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 709 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 1527 ;
	helpline [0 ]= 1184 ;
      } 
      error () ;
      do {
	  gettoken () ;
      } while ( ! ( curtok == 536909729L ) ) ;
    } 
    endtokenlist () ;
    h = defref ;
  } 
  else h = mem [p + 1 ].hh .v.RH ;
  selector = 21 ;
  showtokenlist ( mem [h ].hh .v.RH , -1073741823L , poolsize - poolptr ) ;
  selector = oldsetting ;
  {
    if ( poolptr + 1 > poolsize ) 
    overflow ( 260 , poolsize - initpoolptr ) ;
  } 
  if ( ( poolptr - strstart [strptr ]) < 256 ) 
  {
    {
      dvibuf [dviptr ]= 239 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    {
      dvibuf [dviptr ]= ( poolptr - strstart [strptr ]) ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
  } 
  else {
      
    {
      dvibuf [dviptr ]= 242 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    dvifour ( ( poolptr - strstart [strptr ]) ) ;
  } 
  {register integer for_end; k = strstart [strptr ];for_end = poolptr - 1 
  ; if ( k <= for_end) do 
    {
      dvibuf [dviptr ]= strpool [k ];
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
  while ( k++ < for_end ) ;} 
  if ( eqtb [114439L ].cint > 0 ) 
  {
    k = strstart [strptr ];
    if ( k + ( 10 ) > poolptr ) 
    goto lab30 ;
    else if ( ( strpool [k + 0 ]!= 'p' ) || ( strpool [k + 1 ]!= 'a' ) || 
    ( strpool [k + 2 ]!= 'p' ) || ( strpool [k + 3 ]!= 'e' ) || ( strpool 
    [k + 4 ]!= 'r' ) || ( strpool [k + 5 ]!= 's' ) || ( strpool [k + 6 ]
    != 'i' ) || ( strpool [k + 7 ]!= 'z' ) || ( strpool [k + 8 ]!= 'e' ) 
    || ( strpool [k + 9 ]!= '=' ) ) 
    goto lab30 ;
    k = k + 10 ;
    s = 0 ;
    t = 0 ;
    bl = true ;
    while ( ( k < poolptr ) && bl ) if ( ( strpool [k ]>= '0' ) && ( strpool 
    [k ]<= '9' ) ) 
    {
      s = 10 * s + strpool [k ]- '0' ;
      incr ( k ) ;
    } 
    else bl = false ;
    if ( k + ( 1 ) > poolptr ) 
    goto lab30 ;
    else if ( strpool [k ]== '.' ) 
    {
      incr ( k ) ;
      bl = true ;
      i = 0 ;
      dig [0 ]= 0 ;
      while ( ( k < poolptr ) && bl ) {
	  
	if ( ( strpool [k ]>= '0' ) && ( strpool [k ]<= '9' ) ) 
	{
	  if ( i < 17 ) 
	  {
	    dig [i ]= strpool [k ]- '0' ;
	    incr ( i ) ;
	  } 
	  incr ( k ) ;
	} 
	else bl = false ;
      } 
      t = rounddecimals ( i ) ;
    } 
    if ( k + 4 > poolptr ) {
	
      if ( ( strpool [k ]== 't' ) && ( strpool [k + 1 ]== 'r' ) && ( 
      strpool [k + 2 ]== 'u' ) && ( strpool [k + 3 ]== 'e' ) ) 
      k = k + 4 ;
    } 
    if ( eqtb [114378L ].cint != 1000 ) 
    {
      s = xnoverd ( s , 1000 , eqtb [114378L ].cint ) ;
      t = ( 1000 * t + 65536L * texremainder ) / eqtb [114378L ].cint ;
      s = s + ( t / 65536L ) ;
      t = t % 65536L ;
    } 
    bl = true ;
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 'p' ) && ( strpool [k + 1 ]== ( 't' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
	s = s * 65536L + t ;
      } 
    } 
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 'i' ) && ( strpool [k + 1 ]== ( 'n' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
	num = 7227 ;
	s = xnoverd ( s , num , 100 ) ;
	s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 100 ) ;
      } 
    } 
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 'p' ) && ( strpool [k + 1 ]== ( 'c' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
	num = 12 ;
	s = xnoverd ( s , num , 1 ) ;
	s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 1 ) ;
      } 
    } 
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 'c' ) && ( strpool [k + 1 ]== ( 'm' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
	num = 7227 ;
	s = xnoverd ( s , num , 254 ) ;
	s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 254 ) ;
      } 
    } 
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 'm' ) && ( strpool [k + 1 ]== ( 'm' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
	num = 7227 ;
	s = xnoverd ( s , num , 2540 ) ;
	s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 2540 ) ;
      } 
    } 
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 'b' ) && ( strpool [k + 1 ]== ( 'p' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
	num = 7227 ;
	s = xnoverd ( s , num , 7200 ) ;
	s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 7200 ) ;
      } 
    } 
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 'd' ) && ( strpool [k + 1 ]== ( 'd' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
	num = 1238 ;
	s = xnoverd ( s , num , 1157 ) ;
	s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 1157 ) ;
      } 
    } 
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 'c' ) && ( strpool [k + 1 ]== ( 'c' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
	num = 14856 ;
	s = xnoverd ( s , num , 1157 ) ;
	s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 1157 ) ;
      } 
    } 
    if ( bl ) 
    {
      if ( k + ( 2 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== ( 's' ) && ( strpool [k + 1 ]== ( 'p' ) ) ) 
      {
	bl = false ;
	k = k + 2 ;
      } 
    } 
    if ( k + ( 1 ) > poolptr ) 
    goto lab30 ;
    else if ( strpool [k ]== ',' ) 
    {
      incr ( k ) ;
      cw = s ;
      s = 0 ;
      t = 0 ;
      bl = true ;
      while ( ( k < poolptr ) && bl ) if ( ( strpool [k ]>= '0' ) && ( 
      strpool [k ]<= '9' ) ) 
      {
	s = 10 * s + strpool [k ]- '0' ;
	incr ( k ) ;
      } 
      else bl = false ;
      if ( k + ( 1 ) > poolptr ) 
      goto lab30 ;
      else if ( strpool [k ]== '.' ) 
      {
	incr ( k ) ;
	bl = true ;
	i = 0 ;
	dig [0 ]= 0 ;
	while ( ( k < poolptr ) && bl ) {
	    
	  if ( ( strpool [k ]>= '0' ) && ( strpool [k ]<= '9' ) ) 
	  {
	    if ( i < 17 ) 
	    {
	      dig [i ]= strpool [k ]- '0' ;
	      incr ( i ) ;
	    } 
	    incr ( k ) ;
	  } 
	  else bl = false ;
	} 
	t = rounddecimals ( i ) ;
      } 
      if ( k + 4 > poolptr ) {
	  
	if ( ( strpool [k ]== 't' ) && ( strpool [k + 1 ]== 'r' ) && ( 
	strpool [k + 2 ]== 'u' ) && ( strpool [k + 3 ]== 'e' ) ) 
	k = k + 4 ;
      } 
      if ( eqtb [114378L ].cint != 1000 ) 
      {
	s = xnoverd ( s , 1000 , eqtb [114378L ].cint ) ;
	t = ( 1000 * t + 65536L * texremainder ) / eqtb [114378L ].cint ;
	s = s + ( t / 65536L ) ;
	t = t % 65536L ;
      } 
      bl = true ;
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 'p' ) && ( strpool [k + 1 ]== ( 't' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	  s = s * 65536L + t ;
	} 
      } 
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 'i' ) && ( strpool [k + 1 ]== ( 'n' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	  num = 7227 ;
	  s = xnoverd ( s , num , 100 ) ;
	  s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 100 ) ;
	} 
      } 
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 'p' ) && ( strpool [k + 1 ]== ( 'c' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	  num = 12 ;
	  s = xnoverd ( s , num , 1 ) ;
	  s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 1 ) ;
	} 
      } 
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 'c' ) && ( strpool [k + 1 ]== ( 'm' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	  num = 7227 ;
	  s = xnoverd ( s , num , 254 ) ;
	  s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 254 ) ;
	} 
      } 
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 'm' ) && ( strpool [k + 1 ]== ( 'm' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	  num = 7227 ;
	  s = xnoverd ( s , num , 2540 ) ;
	  s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 2540 ) ;
	} 
      } 
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 'b' ) && ( strpool [k + 1 ]== ( 'p' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	  num = 7227 ;
	  s = xnoverd ( s , num , 7200 ) ;
	  s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 7200 ) ;
	} 
      } 
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 'd' ) && ( strpool [k + 1 ]== ( 'd' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	  num = 1238 ;
	  s = xnoverd ( s , num , 1157 ) ;
	  s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 1157 ) ;
	} 
      } 
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 'c' ) && ( strpool [k + 1 ]== ( 'c' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	  num = 14856 ;
	  s = xnoverd ( s , num , 1157 ) ;
	  s = s * 65536L + ( ( num * t + 65536L * texremainder ) / 1157 ) ;
	} 
      } 
      if ( bl ) 
      {
	if ( k + ( 2 ) > poolptr ) 
	goto lab30 ;
	else if ( strpool [k ]== ( 's' ) && ( strpool [k + 1 ]== ( 'p' ) ) 
	) 
	{
	  bl = false ;
	  k = k + 2 ;
	} 
      } 
      if ( poolptr > k ) 
      goto lab30 ;
      geqworddefine ( 114980L , cw ) ;
      geqworddefine ( 114981L , s ) ;
      curpageheight = s ;
      curpagewidth = cw ;
    } 
  } 
  lab30: poolptr = strstart [strptr ];
  if ( mem [p ].hh.b1 == 4 ) 
  flushlist ( defref ) ;
} 
void 
zwriteout ( halfword p ) 
{
  writeout_regmem 
  unsigned char oldsetting  ;
  integer oldmode  ;
  smallnumber j  ;
  halfword q, r  ;
  integer k  ;
  integer d  ;
  boolean clobbered  ;
  integer runsystemret  ;
  q = getavail () ;
  mem [q ].hh .v.LH = 131197L ;
  r = getavail () ;
  mem [q ].hh .v.RH = r ;
  mem [r ].hh .v.LH = 536909729L ;
  begintokenlist ( q , 4 ) ;
  begintokenlist ( mem [p + 1 ].hh .v.RH , 16 ) ;
  q = getavail () ;
  mem [q ].hh .v.LH = 65659L ;
  begintokenlist ( q , 4 ) ;
  oldmode = curlist .modefield ;
  curlist .modefield = 0 ;
  curcs = writeloc ;
  q = scantoks ( false , true ) ;
  curlist .modefield = oldmode ;
  gettoken () ;
  if ( curtok != 536909729L ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 709 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 1527 ;
      helpline [0 ]= 1184 ;
    } 
    error () ;
    do {
	gettoken () ;
    } while ( ! ( curtok == 536909729L ) ) ;
  } 
  endtokenlist () ;
  oldsetting = selector ;
  j = mem [p + 1 ].hh .v.LH ;
  if ( j == 18 ) 
  selector = 21 ;
  else if ( writeopen [j ]) 
  selector = j ;
  else {
      
    if ( ( j == 17 ) && ( selector == 19 ) ) 
    selector = 18 ;
    printnl ( 349 ) ;
  } 
  tokenshow ( defref ) ;
  println () ;
  flushlist ( defref ) ;
  if ( j == 18 ) 
  {
    if ( ( eqtb [114390L ].cint <= 0 ) ) 
    selector = 18 ;
    else selector = 19 ;
    if ( ! logopened ) 
    selector = 17 ;
    printnl ( 1519 ) ;
    {register integer for_end; d = 0 ;for_end = ( poolptr - strstart [
    strptr ]) - 1 ; if ( d <= for_end) do 
      {
	if ( strpool [strstart [strptr ]+ d ]>= 256 ) 
	printchar ( strpool [strstart [strptr ]+ d ]) ;
	else print ( strpool [strstart [strptr ]+ d ]) ;
      } 
    while ( d++ < for_end ) ;} 
    print ( 1520 ) ;
    if ( shellenabledp ) 
    {
      {
	if ( poolptr + 1 > poolsize ) 
	overflow ( 260 , poolsize - initpoolptr ) ;
      } 
      {
	strpool [poolptr ]= 0 ;
	incr ( poolptr ) ;
      } 
      clobbered = false ;
      {register integer for_end; d = 0 ;for_end = ( poolptr - strstart [
      strptr ]) - 1 ; if ( d <= for_end) do 
	{
	  strpool [strstart [strptr ]+ d ]= xchr [strpool [strstart [
	  strptr ]+ d ]];
	  if ( ( strpool [strstart [strptr ]+ d ]== 0 ) && ( d < ( poolptr 
	  - strstart [strptr ]) - 1 ) ) 
	  clobbered = true ;
	} 
      while ( d++ < for_end ) ;} 
      if ( clobbered ) 
      print ( 1521 ) ;
      else {
	  
	if ( nameoffile ) 
	libcfree ( nameoffile ) ;
	nameoffile = xmalloc ( ( poolptr - strstart [strptr ]) * 4 + 1 ) ;
	k = 0 ;
	{register integer for_end; d = 0 ;for_end = ( poolptr - strstart [
	strptr ]) - 1 ; if ( d <= for_end) do 
	  {
	    if ( ( strpool [strstart [strptr ]+ d ]) >= 256 ) 
	    {
	      c = ( strpool [strstart [strptr ]+ d ]) - 256 ;
	      {
		incr ( k ) ;
		if ( k <= maxint ) 
		nameoffile [k ]= xchr [c ];
	      } 
	    } 
	    else {
		
	      c = strpool [strstart [strptr ]+ d ];
	      if ( ( c >= 128 ) && ( ! isinternalUPTEX () ) && isterminalUTF8 
	      () ) 
	      {
		{
		  incr ( k ) ;
		  if ( k <= maxint ) 
		  nameoffile [k ]= xchr [94 ];
		} 
		{
		  incr ( k ) ;
		  if ( k <= maxint ) 
		  nameoffile [k ]= xchr [94 ];
		} 
		if ( ( c / 16 ) < 10 ) 
		{
		  incr ( k ) ;
		  if ( k <= maxint ) 
		  nameoffile [k ]= xchr [( c / 16 ) + 48 ];
		} 
		else {
		    
		  incr ( k ) ;
		  if ( k <= maxint ) 
		  nameoffile [k ]= xchr [( c / 16 ) + 87 ];
		} 
		if ( ( c % 16 ) < 10 ) 
		{
		  incr ( k ) ;
		  if ( k <= maxint ) 
		  nameoffile [k ]= xchr [( c % 16 ) + 48 ];
		} 
		else {
		    
		  incr ( k ) ;
		  if ( k <= maxint ) 
		  nameoffile [k ]= xchr [( c % 16 ) + 87 ];
		} 
	      } 
	      else {
		  
		incr ( k ) ;
		if ( k <= maxint ) 
		nameoffile [k ]= xchr [c ];
	      } 
	    } 
	  } 
	while ( d++ < for_end ) ;} 
	nameoffile [k + 1 ]= 0 ;
	runsystemret = runsystem ( conststringcast ( nameoffile + 1 ) ) ;
	if ( runsystemret == -1 ) 
	print ( 1522 ) ;
	else if ( runsystemret == 0 ) 
	print ( 1523 ) ;
	else if ( runsystemret == 1 ) 
	print ( 1524 ) ;
	else if ( runsystemret == 2 ) 
	print ( 1525 ) ;
      } 
    } 
    else {
	
      print ( 1526 ) ;
    } 
    printchar ( 46 ) ;
    printnl ( 349 ) ;
    println () ;
    poolptr = strstart [strptr ];
  } 
  selector = oldsetting ;
} 
void 
zoutwhat ( halfword p ) 
{
  outwhat_regmem 
  smallnumber j  ;
  unsigned char oldsetting  ;
  switch ( mem [p ].hh.b1 ) 
  {case 0 : 
  case 1 : 
  case 2 : 
    if ( ! doingleaders ) 
    {
      j = mem [p + 1 ].hh .v.LH ;
      if ( mem [p ].hh.b1 == 1 ) 
      writeout ( p ) ;
      else {
	  
	if ( writeopen [j ]) 
	{
	  aclose ( writefile [j ]) ;
	  writeopen [j ]= false ;
	} 
	if ( mem [p ].hh.b1 == 2 ) 
	;
	else if ( j < 16 ) 
	{
	  curname = mem [p + 1 ].hh .v.RH ;
	  curarea = mem [p + 2 ].hh .v.LH ;
	  curext = mem [p + 2 ].hh .v.RH ;
	  if ( curext == 349 ) 
	  curext = 947 ;
	  packfilename ( curname , curarea , curext ) ;
	  while ( ! kpseoutnameok ( stringcast ( nameoffile + 1 ) ) || ! 
	  aopenout ( writefile [j ]) ) promptfilename ( 1529 , 947 ) ;
	  writeopen [j ]= true ;
	  if ( logopened && texmfyesno ( "log_openout" ) ) 
	  {
	    oldsetting = selector ;
	    if ( ( eqtb [114390L ].cint <= 0 ) ) 
	    selector = 18 ;
	    else selector = 19 ;
	    printnl ( 1530 ) ;
	    printint ( j ) ;
	    print ( 1531 ) ;
	    printfilename ( curname , curarea , curext ) ;
	    print ( 946 ) ;
	    printnl ( 349 ) ;
	    println () ;
	    selector = oldsetting ;
	  } 
	} 
      } 
    } 
    break ;
  case 3 : 
  case 4 : 
    specialout ( p ) ;
    break ;
  case 5 : 
    ;
    break ;
  case 8 : 
    {
      switch ( dvidir ) 
      {case 4 : 
	{
	  pdflastxpos = curh ;
	  pdflastypos = curv ;
	} 
	break ;
      case 3 : 
	{
	  pdflastxpos = - (integer) curv ;
	  pdflastypos = curh ;
	} 
	break ;
      case 1 : 
	{
	  pdflastxpos = curv ;
	  pdflastypos = - (integer) curh ;
	} 
	break ;
      } 
      pdflastxpos = pdflastxpos + 4736286L ;
      pdflastypos = curpageheight - pdflastypos - 4736286L ;
    } 
    break ;
    default: 
    confusion ( 1528 ) ;
    break ;
  } 
} 
halfword 
znewedge ( smallnumber s , scaled w ) 
{
  register halfword Result; newedge_regmem 
  halfword p  ;
  p = getnode ( 3 ) ;
  mem [p ].hh.b0 = 16 ;
  mem [p ].hh.b1 = s ;
  mem [p + 1 ].cint = w ;
  mem [p + 2 ].cint = 0 ;
  Result = p ;
  return Result ;
} 
halfword 
zzreverse ( halfword thisbox , halfword t , scaled * curg , real * curglue ) 
{
  /* 21 15 30 */ register halfword Result; reverse_regmem 
  halfword l, la  ;
  scaled disp, disp2  ;
  boolean disped  ;
  halfword p  ;
  halfword q  ;
  glueord gorder  ;
  unsigned char gsign  ;
  real gluetemp  ;
  halfword m, n  ;
  gorder = mem [thisbox + 5 ].hh.b1 ;
  gsign = mem [thisbox + 5 ].hh.b0 ;
  disp = revdisp ;
  disped = false ;
  l = t ;
  p = tempptr ;
  m = -1073741823L ;
  n = -1073741823L ;
  while ( true ) {
      
    while ( p != -1073741823L ) lab21: if ( ( p >= himemmin ) ) 
    do {
	f = mem [p ].hh.b0 ;
      c = mem [p ].hh.b1 ;
      curh = curh + fontinfo [widthbase [f ]+ fontinfo [charbase [f ]+ 
      effectivechar ( true , f , c ) ].qqqq .b0 ].cint ;
      if ( fontdir [f ]!= 0 ) 
      {
	q = mem [p ].hh .v.RH ;
	la = l ;
	l = p ;
	p = mem [q ].hh .v.RH ;
	mem [q ].hh .v.RH = la ;
      } 
      else {
	  
	q = mem [p ].hh .v.RH ;
	mem [p ].hh .v.RH = l ;
	l = p ;
	p = q ;
      } 
    } while ( ! ( ! ( p >= himemmin ) ) ) ;
    else {
	
      q = mem [p ].hh .v.RH ;
      switch ( mem [p ].hh.b0 ) 
      {case 0 : 
      case 1 : 
      case 3 : 
      case 13 : 
	rulewd = mem [p + 1 ].cint ;
	break ;
      case 12 : 
	{
	  g = mem [p + 1 ].hh .v.LH ;
	  rulewd = mem [g + 1 ].cint - *curg ;
	  if ( gsign != 0 ) 
	  {
	    if ( gsign == 1 ) 
	    {
	      if ( mem [g ].hh.b0 == gorder ) 
	      {
*                curglue = *curglue + mem [g + 2 ].cint ;
		gluetemp = mem [thisbox + 6 ].gr * *curglue ;
		if ( gluetemp > 1000000000.0 ) 
		gluetemp = 1000000000.0 ;
		else if ( gluetemp < -1000000000.0 ) 
		gluetemp = -1000000000.0 ;
*                curg = round ( gluetemp ) ;
	      } 
	    } 
	    else if ( mem [g ].hh.b1 == gorder ) 
	    {
*              curglue = *curglue - mem [g + 3 ].cint ;
	      gluetemp = mem [thisbox + 6 ].gr * *curglue ;
	      if ( gluetemp > 1000000000.0 ) 
	      gluetemp = 1000000000.0 ;
	      else if ( gluetemp < -1000000000.0 ) 
	      gluetemp = -1000000000.0 ;
*              curg = round ( gluetemp ) ;
	    } 
	  } 
	  rulewd = rulewd + *curg ;
	  if ( ( ( ( gsign == 1 ) && ( mem [g ].hh.b0 == gorder ) ) || ( ( 
	  gsign == 2 ) && ( mem [g ].hh.b1 == gorder ) ) ) ) 
	  {
	    {
	      if ( mem [g ].hh .v.RH == -1073741823L ) 
	      freenode ( g , 4 ) ;
	      else decr ( mem [g ].hh .v.RH ) ;
	    } 
	    if ( mem [p ].hh.b1 < 100 ) 
	    {
	      mem [p ].hh.b0 = 13 ;
	      mem [p + 1 ].cint = rulewd ;
	    } 
	    else {
		
	      g = getnode ( 4 ) ;
	      mem [g ].hh.b0 = 5 ;
	      mem [g ].hh.b1 = 5 ;
	      mem [g + 1 ].cint = rulewd ;
	      mem [g + 2 ].cint = 0 ;
	      mem [g + 3 ].cint = 0 ;
	      mem [p + 1 ].hh .v.LH = g ;
	    } 
	  } 
	} 
	break ;
      case 8 : 
	{
	  flushnodelist ( mem [p + 1 ].hh .v.RH ) ;
	  tempptr = p ;
	  p = getavail () ;
	  mem [p ]= mem [tempptr + 1 ];
	  mem [p ].hh .v.RH = q ;
	  freenode ( tempptr , 2 ) ;
	  goto lab21 ;
	} 
	break ;
      case 11 : 
	{
	  rulewd = mem [p + 1 ].cint ;
	  if ( odd ( mem [p ].hh.b1 ) ) {
	      
	    if ( mem [LRptr ].hh .v.LH != ( 4 * ( mem [p ].hh.b1 / 4 ) + 3 
	    ) ) 
	    {
	      mem [p ].hh.b0 = 13 ;
	      incr ( LRproblems ) ;
	    } 
	    else {
		
	      {
		tempptr = LRptr ;
		LRptr = mem [tempptr ].hh .v.RH ;
		{
		  mem [tempptr ].hh .v.RH = avail ;
		  avail = tempptr ;
	;
#ifdef STAT
		  decr ( dynused ) ;
#endif /* STAT */
		} 
	      } 
	      if ( n > -1073741823L ) 
	      {
		decr ( n ) ;
		decr ( mem [p ].hh.b1 ) ;
	      } 
	      else {
		  
		mem [p ].hh.b0 = 13 ;
		if ( m > -1073741823L ) 
		decr ( m ) ;
		else {
		    
		  freenode ( p , 4 ) ;
		  mem [t ].hh .v.RH = q ;
		  mem [t + 1 ].cint = rulewd ;
		  mem [t + 2 ].cint = - (integer) curh - rulewd ;
		  goto lab30 ;
		} 
	      } 
	    } 
	  } 
	  else {
	      
	    {
	      tempptr = getavail () ;
	      mem [tempptr ].hh .v.LH = ( 4 * ( mem [p ].hh.b1 / 4 ) + 3 ) 
	      ;
	      mem [tempptr ].hh .v.RH = LRptr ;
	      LRptr = tempptr ;
	    } 
	    if ( ( n > -1073741823L ) || ( ( mem [p ].hh.b1 / 8 ) != curdir 
	    ) ) 
	    {
	      incr ( n ) ;
	      incr ( mem [p ].hh.b1 ) ;
	    } 
	    else {
		
	      mem [p ].hh.b0 = 13 ;
	      incr ( m ) ;
	    } 
	  } 
	} 
	break ;
      case 16 : 
	confusion ( 1612 ) ;
	break ;
      case 5 : 
	{
	  disp2 = mem [p + 1 ].cint ;
	  mem [p + 1 ].cint = disp ;
	  disp = disp2 ;
	  if ( ! disped ) 
	  disped = true ;
	} 
	break ;
	default: 
	goto lab15 ;
	break ;
      } 
      curh = curh + rulewd ;
      lab15: mem [p ].hh .v.RH = l ;
      if ( mem [p ].hh.b0 == 13 ) {
	  
	if ( ( rulewd == 0 ) || ( l == -1073741823L ) ) 
	{
	  freenode ( p , 4 ) ;
	  p = l ;
	} 
      } 
      l = p ;
      p = q ;
    } 
    if ( ( t == -1073741823L ) && ( m == -1073741823L ) && ( n == -1073741823L 
    ) ) 
    goto lab30 ;
    p = newmath ( 0 , mem [LRptr ].hh .v.LH ) ;
    LRproblems = LRproblems + 10000 ;
  } 
  lab30: if ( ( l != -1073741823L ) && ( mem [l ].hh.b0 != 5 ) ) 
  {
    p = getnode ( 2 ) ;
    mem [p ].hh.b0 = 5 ;
    mem [p + 1 ].cint = disp ;
    mem [p ].hh .v.RH = l ;
    Result = p ;
  } 
  else Result = l ;
  return Result ;
} 
void 
synchdir ( void ) 
{
  synchdir_regmem 
  scaled tmp  ;
  switch ( curdirhv ) 
  {case 4 : 
    if ( dvidir != curdirhv ) 
    {
      if ( curh != dvih ) 
      {
	movement ( curh - dvih , 143 ) ;
	dvih = curh ;
      } 
      if ( curv != dviv ) 
      {
	movement ( curv - dviv , 157 ) ;
	dviv = curv ;
      } 
      {
	dvibuf [dviptr ]= 255 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      {
	dvibuf [dviptr ]= 0 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      dirused = true ;
      switch ( dvidir ) 
      {case 3 : 
	{
	  tmp = curh ;
	  curh = - (integer) curv ;
	  curv = tmp ;
	} 
	break ;
      case 1 : 
	{
	  tmp = curh ;
	  curh = curv ;
	  curv = - (integer) tmp ;
	} 
	break ;
      } 
      dvih = curh ;
      dviv = curv ;
      dvidir = curdirhv ;
    } 
    break ;
  case 3 : 
    if ( dvidir != curdirhv ) 
    {
      if ( curh != dvih ) 
      {
	movement ( curh - dvih , 143 ) ;
	dvih = curh ;
      } 
      if ( curv != dviv ) 
      {
	movement ( curv - dviv , 157 ) ;
	dviv = curv ;
      } 
      {
	dvibuf [dviptr ]= 255 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      {
	dvibuf [dviptr ]= 1 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      dirused = true ;
      switch ( dvidir ) 
      {case 4 : 
	{
	  tmp = curh ;
	  curh = curv ;
	  curv = - (integer) tmp ;
	} 
	break ;
      case 1 : 
	{
	  curv = - (integer) curv ;
	  curh = - (integer) curh ;
	} 
	break ;
      } 
      dvih = curh ;
      dviv = curv ;
      dvidir = curdirhv ;
    } 
    break ;
  case 1 : 
    if ( dvidir != curdirhv ) 
    {
      if ( curh != dvih ) 
      {
	movement ( curh - dvih , 143 ) ;
	dvih = curh ;
      } 
      if ( curv != dviv ) 
      {
	movement ( curv - dviv , 157 ) ;
	dviv = curv ;
      } 
      {
	dvibuf [dviptr ]= 255 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      {
	dvibuf [dviptr ]= 3 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      dirused = true ;
      switch ( dvidir ) 
      {case 4 : 
	{
	  tmp = curh ;
	  curh = - (integer) curv ;
	  curv = tmp ;
	} 
	break ;
      case 3 : 
	{
	  curv = - (integer) curv ;
	  curh = - (integer) curh ;
	} 
	break ;
      } 
      dvih = curh ;
      dviv = curv ;
      dvidir = curdirhv ;
    } 
    break ;
    default: 
    confusion ( 1705 ) ;
    break ;
  } 
} 
boolean 
zcheckbox ( halfword boxp ) 
{
  /* 30 */ register boolean Result; checkbox_regmem 
  halfword p  ;
  boolean flag  ;
  flag = false ;
  p = boxp ;
  while ( p != -1073741823L ) {
      
    if ( ( p >= himemmin ) ) 
    do {
	if ( findfirstchar ) 
      {
	firstchar = p ;
	findfirstchar = false ;
      } 
      lastchar = p ;
      flag = true ;
      if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
      p = mem [p ].hh .v.RH ;
      p = mem [p ].hh .v.RH ;
      if ( p == -1073741823L ) 
      goto lab30 ;
    } while ( ! ( ! ( p >= himemmin ) ) ) ;
    switch ( mem [p ].hh.b0 ) 
    {case 0 : 
      {
	flag = true ;
	if ( mem [p + 4 ].cint == 0 ) 
	{
	  if ( checkbox ( mem [p + 5 ].hh .v.RH ) ) 
	  flag = true ;
	} 
	else if ( findfirstchar ) 
	findfirstchar = false ;
	else lastchar = -1073741823L ;
      } 
      break ;
    case 8 : 
      if ( checkbox ( mem [p + 1 ].hh .v.RH ) ) 
      flag = true ;
      break ;
    case 4 : 
    case 5 : 
    case 6 : 
    case 7 : 
    case 10 : 
    case 14 : 
      ;
      break ;
    case 11 : 
      if ( ( mem [p ].hh.b1 == 0 ) || ( mem [p ].hh.b1 == 1 ) ) 
      {
	if ( findfirstchar ) 
	{
	  findfirstchar = false ;
	  firstchar = p ;
	} 
	lastchar = p ;
	flag = true ;
      } 
      else ;
      break ;
    case 13 : 
      if ( mem [p ].hh.b1 == 2 ) 
      {
	p = mem [p ].hh .v.RH ;
	if ( ( p >= himemmin ) ) {
	    
	  if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	  p = mem [p ].hh .v.RH ;
	} 
	p = mem [mem [p ].hh .v.RH ].hh .v.RH ;
	if ( findfirstchar ) 
	{
	  findfirstchar = false ;
	  firstchar = p ;
	} 
	lastchar = p ;
	flag = true ;
	if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	p = mem [p ].hh .v.RH ;
      } 
      else {
	  
	flag = true ;
	if ( findfirstchar ) 
	findfirstchar = false ;
	else lastchar = -1073741823L ;
      } 
      break ;
      default: 
      {
	flag = true ;
	if ( findfirstchar ) 
	findfirstchar = false ;
	else lastchar = -1073741823L ;
      } 
      break ;
    } 
    p = mem [p ].hh .v.RH ;
  } 
  lab30: Result = flag ;
  return Result ;
} 
void 
zadjusthlist ( halfword p , boolean pf ) 
{
  /* 10 */ adjusthlist_regmem 
  halfword q, s, t, u, v, x, z  ;
  halfword i, k  ;
  halfword a  ;
  unsigned char insertskip  ;
  KANJIcode cx  ;
  sixteenbits ax  ;
  boolean doins  ;
  if ( mem [p ].hh .v.RH == -1073741823L ) 
  return ;
  if ( eqtb [51756L ].hh .v.RH > 0 ) 
  {
    deleteglueref ( mem [p + 7 ].hh .v.RH ) ;
    mem [p + 7 ].hh .v.RH = eqtb [49940L ].hh .v.RH ;
    incr ( mem [eqtb [49940L ].hh .v.RH ].hh .v.RH ) ;
  } 
  if ( eqtb [51757L ].hh .v.RH > 0 ) 
  {
    deleteglueref ( mem [p + 7 ].hh .v.LH ) ;
    mem [p + 7 ].hh .v.LH = eqtb [49941L ].hh .v.RH ;
    incr ( mem [eqtb [49941L ].hh .v.RH ].hh .v.RH ) ;
  } 
  u = mem [p + 7 ].hh .v.RH ;
  incr ( mem [u ].hh .v.RH ) ;
  s = mem [p + 7 ].hh .v.LH ;
  incr ( mem [s ].hh .v.RH ) ;
  if ( ! ( mem [p ].hh .v.RH >= himemmin ) ) {
      
    if ( ( mem [mem [p ].hh .v.RH ].hh.b0 == 12 ) && ( mem [mem [p ].hh 
    .v.RH ].hh.b1 == 21 ) ) 
    {
      v = mem [p ].hh .v.RH ;
      mem [p ].hh .v.RH = mem [v ].hh .v.RH ;
      {
	if ( mem [mem [v + 1 ].hh .v.LH ].hh .v.RH == -1073741823L ) 
	freenode ( mem [v + 1 ].hh .v.LH , 4 ) ;
	else decr ( mem [mem [v + 1 ].hh .v.LH ].hh .v.RH ) ;
      } 
      freenode ( v , 2 ) ;
    } 
    else if ( ( mem [mem [p ].hh .v.RH ].hh.b0 == 14 ) && ( mem [mem [p 
    ].hh .v.RH ].hh.b1 == 2 ) ) 
    {
      v = mem [mem [p ].hh .v.RH ].hh .v.RH ;
      if ( ( ! ( v >= himemmin ) ) && ( mem [v ].hh.b0 == 12 ) && ( mem [v 
      ].hh.b1 == 21 ) ) 
      {
	mem [mem [p ].hh .v.RH ].hh .v.RH = mem [v ].hh .v.RH ;
	{
	  if ( mem [mem [v + 1 ].hh .v.LH ].hh .v.RH == -1073741823L ) 
	  freenode ( mem [v + 1 ].hh .v.LH , 4 ) ;
	  else decr ( mem [mem [v + 1 ].hh .v.LH ].hh .v.RH ) ;
	} 
	freenode ( v , 2 ) ;
      } 
    } 
  } 
  i = 0 ;
  insertskip = 0 ;
  p = mem [p ].hh .v.RH ;
  v = p ;
  q = p ;
  while ( p != -1073741823L ) {
      
    if ( ( p >= himemmin ) ) 
    {
      do {
	  if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	{
	  cx = ktokentochr ( mem [mem [p ].hh .v.RH ].hh .v.LH ) ;
	  if ( insertskip == 1 ) 
	  {
	    {
	      x = getinhibitpos ( cx , 1 ) ;
	      if ( x != 10000 ) {
		  
		if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [76079L + 
		x ].hh.b0 == 1 ) ) 
		doins = false ;
		else doins = true ;
	      } 
	      else doins = true ;
	    } 
	    if ( doins ) 
	    {
	      z = newglue ( s ) ;
	      mem [z ].hh.b1 = 17 ;
	      mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
	      mem [q ].hh .v.RH = z ;
	      q = z ;
	    } 
	  } 
	  p = mem [p ].hh .v.RH ;
	  insertskip = 2 ;
	} 
	else {
	    
	  ax = mem [p ].hh.b1 ;
	  if ( insertskip == 2 ) 
	  {
	    if ( ( eqtb [64175L + ax ].hh .v.RH % 2 ) == 1 ) 
	    {
	      x = getinhibitpos ( cx , 1 ) ;
	      if ( x != 10000 ) {
		  
		if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [76079L + 
		x ].hh.b0 == 2 ) ) 
		doins = false ;
		else doins = true ;
	      } 
	      else doins = true ;
	    } 
	    else doins = false ;
	    if ( doins ) 
	    {
	      z = newglue ( s ) ;
	      mem [z ].hh.b1 = 17 ;
	      mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
	      mem [q ].hh .v.RH = z ;
	      q = z ;
	    } 
	  } 
	  if ( eqtb [64175L + ax ].hh .v.RH >= 2 ) 
	  insertskip = 1 ;
	  else insertskip = 0 ;
	} 
	q = p ;
	p = mem [p ].hh .v.RH ;
	incr ( i ) ;
	if ( ( i > 5 ) && pf ) 
	{
	  if ( ( v >= himemmin ) ) {
	      
	    if ( fontdir [mem [v ].hh.b0 ]!= 0 ) 
	    v = mem [v ].hh .v.RH ;
	  } 
	  v = mem [v ].hh .v.RH ;
	} 
      } while ( ! ( ! ( p >= himemmin ) ) ) ;
    } 
    else {
	
      switch ( mem [p ].hh.b0 ) 
      {case 0 : 
	{
	  findfirstchar = true ;
	  firstchar = -1073741823L ;
	  lastchar = -1073741823L ;
	  if ( mem [p + 4 ].cint == 0 ) 
	  {
	    if ( checkbox ( mem [p + 5 ].hh .v.RH ) ) 
	    {
	      if ( firstchar != -1073741823L ) {
		  
		if ( mem [firstchar ].hh.b0 == 11 ) 
		{
		  ax = 48 ;
		  if ( insertskip == 2 ) 
		  {
		    if ( ( eqtb [64175L + ax ].hh .v.RH % 2 ) == 1 ) 
		    {
		      x = getinhibitpos ( cx , 1 ) ;
		      if ( x != 10000 ) {
			  
			if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [
			76079L + x ].hh.b0 == 2 ) ) 
			doins = false ;
			else doins = true ;
		      } 
		      else doins = true ;
		    } 
		    else doins = false ;
		    if ( doins ) 
		    {
		      z = newglue ( s ) ;
		      mem [z ].hh.b1 = 17 ;
		      mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		      mem [q ].hh .v.RH = z ;
		      q = z ;
		    } 
		  } 
		} 
		else if ( fontdir [mem [firstchar ].hh.b0 ]!= 0 ) 
		{
		  cx = ktokentochr ( mem [mem [firstchar ].hh .v.RH ].hh 
		  .v.LH ) ;
		  if ( insertskip == 1 ) 
		  {
		    {
		      x = getinhibitpos ( cx , 1 ) ;
		      if ( x != 10000 ) {
			  
			if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [
			76079L + x ].hh.b0 == 1 ) ) 
			doins = false ;
			else doins = true ;
		      } 
		      else doins = true ;
		    } 
		    if ( doins ) 
		    {
		      z = newglue ( s ) ;
		      mem [z ].hh.b1 = 17 ;
		      mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		      mem [q ].hh .v.RH = z ;
		      q = z ;
		    } 
		  } 
		  else if ( insertskip == 2 ) 
		  {
		    z = newglue ( u ) ;
		    mem [z ].hh.b1 = 16 ;
		    mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		    mem [q ].hh .v.RH = z ;
		    q = z ;
		  } 
		} 
		else {
		    
		  ax = mem [firstchar ].hh.b1 ;
		  if ( insertskip == 2 ) 
		  {
		    if ( ( eqtb [64175L + ax ].hh .v.RH % 2 ) == 1 ) 
		    {
		      x = getinhibitpos ( cx , 1 ) ;
		      if ( x != 10000 ) {
			  
			if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [
			76079L + x ].hh.b0 == 2 ) ) 
			doins = false ;
			else doins = true ;
		      } 
		      else doins = true ;
		    } 
		    else doins = false ;
		    if ( doins ) 
		    {
		      z = newglue ( s ) ;
		      mem [z ].hh.b1 = 17 ;
		      mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		      mem [q ].hh .v.RH = z ;
		      q = z ;
		    } 
		  } 
		} 
	      } 
	      if ( lastchar != -1073741823L ) 
	      {
		if ( mem [lastchar ].hh.b0 == 11 ) 
		{
		  ax = 48 ;
		  if ( eqtb [64175L + ax ].hh .v.RH >= 2 ) 
		  insertskip = 1 ;
		  else insertskip = 0 ;
		} 
		else if ( fontdir [mem [lastchar ].hh.b0 ]!= 0 ) 
		{
		  insertskip = 2 ;
		  cx = ktokentochr ( mem [mem [lastchar ].hh .v.RH ].hh 
		  .v.LH ) ;
		  if ( ( mem [p ].hh .v.RH >= himemmin ) && ( fontdir [mem 
		  [mem [p ].hh .v.RH ].hh.b0 ]!= 0 ) ) 
		  {
		    {
		      z = newglue ( u ) ;
		      mem [z ].hh.b1 = 16 ;
		      mem [z ].hh .v.RH = mem [p ].hh .v.RH ;
		      mem [p ].hh .v.RH = z ;
		      p = mem [z ].hh .v.RH ;
		      q = z ;
		    } 
		    p = mem [p ].hh .v.RH ;
		  } 
		} 
		else {
		    
		  ax = mem [lastchar ].hh.b1 ;
		  if ( eqtb [64175L + ax ].hh .v.RH >= 2 ) 
		  insertskip = 1 ;
		  else insertskip = 0 ;
		} 
	      } 
	      else insertskip = 0 ;
	    } 
	    else insertskip = 0 ;
	  } 
	  else insertskip = 0 ;
	} 
	break ;
      case 8 : 
	{
	  t = mem [p + 1 ].hh .v.RH ;
	  if ( ( t >= himemmin ) ) 
	  {
	    ax = mem [t ].hh.b1 ;
	    if ( insertskip == 2 ) 
	    {
	      if ( ( eqtb [64175L + ax ].hh .v.RH % 2 ) == 1 ) 
	      {
		x = getinhibitpos ( cx , 1 ) ;
		if ( x != 10000 ) {
		    
		  if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [76079L 
		  + x ].hh.b0 == 2 ) ) 
		  doins = false ;
		  else doins = true ;
		} 
		else doins = true ;
	      } 
	      else doins = false ;
	      if ( doins ) 
	      {
		z = newglue ( s ) ;
		mem [z ].hh.b1 = 17 ;
		mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		mem [q ].hh .v.RH = z ;
		q = z ;
	      } 
	    } 
	    while ( mem [t ].hh .v.RH != -1073741823L ) t = mem [t ].hh 
	    .v.RH ;
	    if ( ( t >= himemmin ) ) 
	    {
	      ax = mem [t ].hh.b1 ;
	      if ( eqtb [64175L + ax ].hh .v.RH >= 2 ) 
	      insertskip = 1 ;
	      else insertskip = 0 ;
	    } 
	  } 
	} 
	break ;
      case 14 : 
      case 5 : 
	{
	  if ( ( mem [p ].hh .v.RH >= himemmin ) ) 
	  {
	    q = p ;
	    p = mem [p ].hh .v.RH ;
	    if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	    {
	      cx = ktokentochr ( mem [mem [p ].hh .v.RH ].hh .v.LH ) ;
	      if ( insertskip == 1 ) 
	      {
		{
		  x = getinhibitpos ( cx , 1 ) ;
		  if ( x != 10000 ) {
		      
		    if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [
		    76079L + x ].hh.b0 == 1 ) ) 
		    doins = false ;
		    else doins = true ;
		  } 
		  else doins = true ;
		} 
		if ( doins ) 
		{
		  z = newglue ( s ) ;
		  mem [z ].hh.b1 = 17 ;
		  mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		  mem [q ].hh .v.RH = z ;
		  q = z ;
		} 
	      } 
	      else if ( insertskip == 2 ) 
	      {
		z = newglue ( u ) ;
		mem [z ].hh.b1 = 16 ;
		mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		mem [q ].hh .v.RH = z ;
		q = z ;
	      } 
	      p = mem [p ].hh .v.RH ;
	      insertskip = 2 ;
	    } 
	    else {
		
	      ax = mem [p ].hh.b1 ;
	      if ( insertskip == 2 ) 
	      {
		if ( ( eqtb [64175L + ax ].hh .v.RH % 2 ) == 1 ) 
		{
		  x = getinhibitpos ( cx , 1 ) ;
		  if ( x != 10000 ) {
		      
		    if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [
		    76079L + x ].hh.b0 == 2 ) ) 
		    doins = false ;
		    else doins = true ;
		  } 
		  else doins = true ;
		} 
		else doins = false ;
		if ( doins ) 
		{
		  z = newglue ( s ) ;
		  mem [z ].hh.b1 = 17 ;
		  mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		  mem [q ].hh .v.RH = z ;
		  q = z ;
		} 
	      } 
	      if ( eqtb [64175L + ax ].hh .v.RH >= 2 ) 
	      insertskip = 1 ;
	      else insertskip = 0 ;
	    } 
	  } 
	} 
	break ;
      case 13 : 
	if ( mem [p ].hh.b1 == 1 ) 
	insertskip = 0 ;
	else if ( mem [p ].hh.b1 == 2 ) 
	{
	  if ( q == p ) 
	  {
	    t = mem [p ].hh .v.RH ;
	    if ( ( t >= himemmin ) ) {
		
	      if ( fontdir [mem [t ].hh.b0 ]!= 0 ) 
	      t = mem [t ].hh .v.RH ;
	    } 
	    p = mem [mem [t ].hh .v.RH ].hh .v.RH ;
	    if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	    {
	      p = mem [p ].hh .v.RH ;
	      insertskip = 2 ;
	    } 
	    else insertskip = 1 ;
	  } 
	  else {
	      
	    a = p ;
	    t = mem [p ].hh .v.RH ;
	    if ( ( t >= himemmin ) ) {
		
	      if ( fontdir [mem [t ].hh.b0 ]!= 0 ) 
	      t = mem [t ].hh .v.RH ;
	    } 
	    t = mem [mem [t ].hh .v.RH ].hh .v.RH ;
	    mem [q ].hh .v.RH = t ;
	    p = t ;
	    if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	    {
	      cx = ktokentochr ( mem [mem [p ].hh .v.RH ].hh .v.LH ) ;
	      if ( insertskip == 1 ) 
	      {
		{
		  x = getinhibitpos ( cx , 1 ) ;
		  if ( x != 10000 ) {
		      
		    if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [
		    76079L + x ].hh.b0 == 1 ) ) 
		    doins = false ;
		    else doins = true ;
		  } 
		  else doins = true ;
		} 
		if ( doins ) 
		{
		  z = newglue ( s ) ;
		  mem [z ].hh.b1 = 17 ;
		  mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		  mem [q ].hh .v.RH = z ;
		  q = z ;
		} 
	      } 
	      p = mem [p ].hh .v.RH ;
	      insertskip = 2 ;
	    } 
	    else {
		
	      ax = mem [p ].hh.b1 ;
	      if ( insertskip == 2 ) 
	      {
		if ( ( eqtb [64175L + ax ].hh .v.RH % 2 ) == 1 ) 
		{
		  x = getinhibitpos ( cx , 1 ) ;
		  if ( x != 10000 ) {
		      
		    if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [
		    76079L + x ].hh.b0 == 2 ) ) 
		    doins = false ;
		    else doins = true ;
		  } 
		  else doins = true ;
		} 
		else doins = false ;
		if ( doins ) 
		{
		  z = newglue ( s ) ;
		  mem [z ].hh.b1 = 17 ;
		  mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		  mem [q ].hh .v.RH = z ;
		  q = z ;
		} 
	      } 
	      if ( eqtb [64175L + ax ].hh .v.RH >= 2 ) 
	      insertskip = 1 ;
	      else insertskip = 0 ;
	    } 
	    incr ( i ) ;
	    if ( ( i > 5 ) && pf ) 
	    {
	      if ( ( v >= himemmin ) ) {
		  
		if ( fontdir [mem [v ].hh.b0 ]!= 0 ) 
		v = mem [v ].hh .v.RH ;
	      } 
	      v = mem [v ].hh .v.RH ;
	    } 
	    if ( mem [q ].hh .v.RH != t ) 
	    mem [mem [q ].hh .v.RH ].hh .v.RH = a ;
	    else mem [q ].hh .v.RH = a ;
	  } 
	} 
	break ;
      case 11 : 
	{
	  if ( ( mem [p ].hh.b1 == 0 ) && ( insertskip == 2 ) ) 
	  {
	    ax = 48 ;
	    {
	      if ( ( eqtb [64175L + ax ].hh .v.RH % 2 ) == 1 ) 
	      {
		x = getinhibitpos ( cx , 1 ) ;
		if ( x != 10000 ) {
		    
		  if ( ( eqtb [76079L + x ].hh.b0 == 0 ) || ( eqtb [76079L 
		  + x ].hh.b0 == 2 ) ) 
		  doins = false ;
		  else doins = true ;
		} 
		else doins = true ;
	      } 
	      else doins = false ;
	      if ( doins ) 
	      {
		z = newglue ( s ) ;
		mem [z ].hh.b1 = 17 ;
		mem [z ].hh .v.RH = mem [q ].hh .v.RH ;
		mem [q ].hh .v.RH = z ;
		q = z ;
	      } 
	    } 
	    insertskip = 0 ;
	  } 
	  else if ( mem [p ].hh.b1 == 1 ) 
	  {
	    ax = 48 ;
	    if ( eqtb [64175L + ax ].hh .v.RH >= 2 ) 
	    insertskip = 1 ;
	    else insertskip = 0 ;
	  } 
	  else insertskip = 0 ;
	} 
	break ;
      case 6 : 
      case 7 : 
      case 4 : 
      case 10 : 
	;
	break ;
	default: 
	insertskip = 0 ;
	break ;
      } 
      q = p ;
      p = mem [p ].hh .v.RH ;
    } 
  } 
  if ( ! ( q >= himemmin ) && ( mem [q ].hh.b0 == 12 ) && ( mem [q ].hh.b1 
  == 21 ) ) 
  {
    {
      if ( mem [mem [q + 1 ].hh .v.LH ].hh .v.RH == -1073741823L ) 
      freenode ( mem [q + 1 ].hh .v.LH , 4 ) ;
      else decr ( mem [mem [q + 1 ].hh .v.LH ].hh .v.RH ) ;
    } 
    mem [q + 1 ].hh .v.LH = membot ;
    incr ( mem [membot ].hh .v.RH ) ;
  } 
  deleteglueref ( u ) ;
  deleteglueref ( s ) ;
  if ( ( v != -1073741823L ) && pf && ( i > 5 ) ) 
  {
    q = v ;
    p = mem [v ].hh .v.RH ;
    if ( ( v >= himemmin ) && ( fontdir [mem [v ].hh.b0 ]!= 0 ) ) 
    {
      q = p ;
      p = mem [p ].hh .v.RH ;
    } 
    t = q ;
    s = -1073741823L ;
    k = 0 ;
    while ( ( p != -1073741823L ) ) {
	
      if ( ( p >= himemmin ) ) 
      {
	if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	{
	  cx = ktokentochr ( mem [mem [p ].hh .v.RH ].hh .v.LH ) ;
	  i = ktokentocmd ( mem [mem [p ].hh .v.RH ].hh .v.LH ) ;
	  k = 0 ;
	  if ( ( i == 16 ) || ( i == 17 ) || ( i == 19 ) || ( i == 20 ) ) 
	  {
	    t = q ;
	    s = p ;
	  } 
	  p = mem [p ].hh .v.RH ;
	  q = p ;
	} 
	else {
	    
	  k = k + 1 ;
	  if ( k > 1 ) 
	  {
	    q = p ;
	    s = -1073741823L ;
	  } 
	} 
      } 
      else {
	  
	switch ( mem [p ].hh.b0 ) 
	{case 14 : 
	case 6 : 
	case 7 : 
	case 10 : 
	case 12 : 
	case 13 : 
	case 11 : 
	case 5 : 
	  ;
	  break ;
	  default: 
	  {
	    q = p ;
	    s = -1073741823L ;
	  } 
	  break ;
	} 
      } 
      p = mem [p ].hh .v.RH ;
    } 
    if ( s != -1073741823L ) 
    {
      s = mem [t ].hh .v.RH ;
      if ( ! ( s >= himemmin ) && ( mem [s ].hh.b0 == 14 ) ) 
      mem [s + 1 ].cint = mem [s + 1 ].cint + eqtb [114417L ].cint ;
      else if ( eqtb [114417L ].cint != 0 ) 
      {
	s = newpenalty ( eqtb [114417L ].cint ) ;
	mem [s ].hh.b1 = 1 ;
	mem [s ].hh .v.RH = mem [t ].hh .v.RH ;
	mem [t ].hh .v.RH = s ;
	t = mem [s ].hh .v.RH ;
	while ( ( ! ( t >= himemmin ) ) ) {
	    
	  if ( ( mem [t ].hh.b0 == 12 ) || ( mem [t ].hh.b0 == 13 ) ) 
	  return ;
	  t = mem [t ].hh .v.RH ;
	} 
	z = newglue ( u ) ;
	mem [z ].hh.b1 = 16 ;
	mem [z ].hh .v.RH = mem [s ].hh .v.RH ;
	mem [s ].hh .v.RH = z ;
      } 
    } 
  } 
} 
void 
dirout ( void ) 
{
  dirout_regmem 
  halfword thisbox  ;
  thisbox = tempptr ;
  tempptr = mem [thisbox + 5 ].hh .v.RH ;
  if ( ( mem [tempptr ].hh.b0 != 0 ) && ( mem [tempptr ].hh.b0 != 1 ) ) 
  confusion ( 1706 ) ;
  switch ( abs ( ( ( mem [thisbox ].hh.b1 ) % 16 - 5 ) ) ) 
  {case 4 : 
    switch ( abs ( ( ( mem [tempptr ].hh.b1 ) % 16 - 5 ) ) ) 
    {case 3 : 
      {
	curv = curv - mem [thisbox + 3 ].cint ;
	curh = curh + mem [tempptr + 2 ].cint ;
      } 
      break ;
    case 1 : 
      {
	curv = curv + mem [thisbox + 2 ].cint ;
	curh = curh + mem [tempptr + 3 ].cint ;
      } 
      break ;
    } 
    break ;
  case 3 : 
    switch ( abs ( ( ( mem [tempptr ].hh.b1 ) % 16 - 5 ) ) ) 
    {case 4 : 
      {
	curv = curv + mem [thisbox + 2 ].cint ;
	curh = curh + mem [tempptr + 3 ].cint ;
      } 
      break ;
    case 1 : 
      {
	curv = curv + mem [thisbox + 2 ].cint - mem [tempptr + 3 ].cint ;
	curh = curh + mem [tempptr + 1 ].cint ;
      } 
      break ;
    } 
    break ;
  case 1 : 
    switch ( abs ( ( ( mem [tempptr ].hh.b1 ) % 16 - 5 ) ) ) 
    {case 4 : 
      {
	curv = curv - mem [thisbox + 3 ].cint ;
	curh = curh + mem [tempptr + 2 ].cint ;
      } 
      break ;
    case 3 : 
      {
	curv = curv + mem [thisbox + 2 ].cint - mem [tempptr + 3 ].cint ;
	curh = curh + mem [tempptr + 1 ].cint ;
      } 
      break ;
    } 
    break ;
  } 
  curdirhv = abs ( ( ( mem [tempptr ].hh.b1 ) % 16 - 5 ) ) ;
  if ( mem [tempptr ].hh.b0 == 1 ) 
  vlistout () ;
  else hlistout () ;
} 
void 
hlistout ( void ) 
{
  /* 21 13 14 15 22 40 */ hlistout_regmem 
  scaled baseline  ;
  scaled disp  ;
  eightbits savedir  ;
  KANJIcode jc  ;
  halfword kspptr  ;
  scaled leftedge  ;
  scaled saveh, savev  ;
  halfword thisbox  ;
  glueord gorder  ;
  unsigned char gsign  ;
  halfword p  ;
  integer saveloc  ;
  halfword leaderbox  ;
  scaled leaderwd  ;
  scaled lx  ;
  boolean outerdoingleaders  ;
  scaled edge  ;
  halfword prevp  ;
  real gluetemp  ;
  real curglue  ;
  scaled curg  ;
  curg = 0 ;
  curglue = 0.0 ;
  thisbox = tempptr ;
  gorder = mem [thisbox + 5 ].hh.b1 ;
  gsign = mem [thisbox + 5 ].hh.b0 ;
  p = mem [thisbox + 5 ].hh .v.RH ;
  kspptr = mem [thisbox + 7 ].hh .v.RH ;
  incr ( curs ) ;
  if ( curs > 0 ) 
  {
    dvibuf [dviptr ]= 141 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  if ( curs > maxpush ) 
  maxpush = curs ;
  saveloc = dvioffset + dviptr ;
  synchdir () ;
  baseline = curv ;
  disp = 0 ;
  revdisp = 0 ;
  prevp = thisbox + 5 ;
  if ( ( eTeXmode == 1 ) ) 
  {
    {
      tempptr = getavail () ;
      mem [tempptr ].hh .v.LH = 0 ;
      mem [tempptr ].hh .v.RH = LRptr ;
      LRptr = tempptr ;
    } 
    if ( ( ( mem [thisbox ].hh.b1 ) / 16 ) == 2 ) {
	
      if ( curdir == 1 ) 
      {
	curdir = 0 ;
	curh = curh - mem [thisbox + 1 ].cint ;
      } 
      else mem [thisbox ].hh.b1 = ( ( mem [thisbox ].hh.b1 ) % 16 - 5 ) + 
      5 + 16 * ( 0 ) ;
    } 
    if ( ( curdir == 1 ) && ( ( ( mem [thisbox ].hh.b1 ) / 16 ) != 1 ) ) 
    {
      saveh = curh ;
      tempptr = p ;
      p = newkern ( 0 ) ;
      mem [p + 2 ].cint = 0 ;
      mem [prevp ].hh .v.RH = p ;
      curh = 0 ;
      mem [p ].hh .v.RH = reverse ( thisbox , -1073741823L , curg , curglue 
      ) ;
      mem [p + 1 ].cint = - (integer) curh ;
      curh = saveh ;
      mem [thisbox ].hh.b1 = ( ( mem [thisbox ].hh.b1 ) % 16 - 5 ) + 5 + 
      16 * ( 1 ) ;
    } 
  } 
  leftedge = curh ;
  synctexhlist ( thisbox ) ;
  while ( p != -1073741823L ) lab21: if ( ( p >= himemmin ) ) 
  {
    if ( curh != dvih ) 
    {
      movement ( curh - dvih , 143 ) ;
      dvih = curh ;
    } 
    if ( curv != dviv ) 
    {
      movement ( curv - dviv , 157 ) ;
      dviv = curv ;
    } 
    chain = false ;
    do {
	f = mem [p ].hh.b0 ;
      c = mem [p ].hh.b1 ;
      if ( f != dvif ) 
      {
	if ( ! fontused [f ]) 
	{
	  dvifontdef ( f ) ;
	  fontused [f ]= true ;
	} 
	if ( f <= 64 ) 
	{
	  dvibuf [dviptr ]= f + 170 ;
	  incr ( dviptr ) ;
	  if ( dviptr == dvilimit ) 
	  dviswap () ;
	} 
	else if ( f <= 256 ) 
	{
	  {
	    dvibuf [dviptr ]= 235 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	  {
	    dvibuf [dviptr ]= f - 1 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	} 
	else {
	    
	  {
	    dvibuf [dviptr ]= 236 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	  {
	    dvibuf [dviptr ]= ( f - 1 ) / 256 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	  {
	    dvibuf [dviptr ]= ( f - 1 ) % 256 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	} 
	dvif = f ;
      } 
      if ( fontdir [f ]== 0 ) 
      {
	chain = false ;
	c = ptencucsto8bitcode ( fontenc [f ], c ) ;
	if ( fontec [f ]>= c ) {
	    
	  if ( fontbc [f ]<= c ) {
	      
	    if ( ( fontinfo [charbase [f ]+ c ].qqqq .b0 > 0 ) ) 
	    {
	      if ( c >= 256 ) 
	      {
		{
		  dvibuf [dviptr ]= 129 ;
		  incr ( dviptr ) ;
		  if ( dviptr == dvilimit ) 
		  dviswap () ;
		} 
		{
		  dvibuf [dviptr ]= Hi ( c ) ;
		  incr ( dviptr ) ;
		  if ( dviptr == dvilimit ) 
		  dviswap () ;
		} 
		{
		  dvibuf [dviptr ]= Lo ( c ) ;
		  incr ( dviptr ) ;
		  if ( dviptr == dvilimit ) 
		  dviswap () ;
		} 
	      } 
	      else {
		  
		if ( c >= 128 ) 
		{
		  dvibuf [dviptr ]= 128 ;
		  incr ( dviptr ) ;
		  if ( dviptr == dvilimit ) 
		  dviswap () ;
		} 
		{
		  dvibuf [dviptr ]= c ;
		  incr ( dviptr ) ;
		  if ( dviptr == dvilimit ) 
		  dviswap () ;
		} 
	      } 
	      curh = curh + fontinfo [widthbase [f ]+ fontinfo [charbase [
	      f ]+ c ].qqqq .b0 ].cint ;
	      goto lab22 ;
	    } 
	  } 
	} 
	if ( mltexenabledp ) 
	{
	  if ( c >= eqtb [114423L ].cint ) {
	      
	    if ( c <= eqtb [114424L ].cint ) {
		
	      if ( ( eqtb [114105L + c ].hh .v.RH > 0 ) ) 
	      {
		basec = ( eqtb [114105L + c ].hh .v.RH % 256 ) ;
		accentc = ( eqtb [114105L + c ].hh .v.RH / 256 ) ;
		if ( ( fontec [f ]>= basec ) ) {
		    
		  if ( ( fontbc [f ]<= basec ) ) {
		      
		    if ( ( fontec [f ]>= accentc ) ) {
			
		      if ( ( fontbc [f ]<= accentc ) ) 
		      {
			iac = fontinfo [charbase [f ]+ effectivechar ( true 
			, f , accentc ) ].qqqq ;
			ibc = fontinfo [charbase [f ]+ effectivechar ( true 
			, f , basec ) ].qqqq ;
			if ( ( ibc .b0 > 0 ) ) {
			    
			  if ( ( iac .b0 > 0 ) ) 
			  goto lab40 ;
			} 
		      } 
		    } 
		  } 
		} 
		begindiagnostic () ;
		printnl ( 1656 ) ;
		print ( c ) ;
		print ( 1410 ) ;
		print ( accentc ) ;
		print ( 32 ) ;
		print ( basec ) ;
		print ( 987 ) ;
		slowprint ( fontname [f ]) ;
		printchar ( 33 ) ;
		enddiagnostic ( false ) ;
		goto lab22 ;
	      } 
	    } 
	  } 
	  begindiagnostic () ;
	  printnl ( 986 ) ;
	  print ( 1655 ) ;
	  print ( c ) ;
	  print ( 987 ) ;
	  slowprint ( fontname [f ]) ;
	  printchar ( 33 ) ;
	  enddiagnostic ( false ) ;
	  goto lab22 ;
	  lab40: if ( eqtb [114396L ].cint > 99 ) 
	  {
	    begindiagnostic () ;
	    printnl ( 1657 ) ;
	    print ( c ) ;
	    print ( 1410 ) ;
	    print ( accentc ) ;
	    print ( 32 ) ;
	    print ( basec ) ;
	    print ( 987 ) ;
	    slowprint ( fontname [f ]) ;
	    printchar ( 46 ) ;
	    enddiagnostic ( false ) ;
	  } 
	  basexheight = fontinfo [5 + parambase [f ]].cint ;
	  baseslant = fontinfo [1 + parambase [f ]].cint / ((double) 
	  65536.0 ) ;
	  accentslant = baseslant ;
	  basewidth = fontinfo [widthbase [f ]+ ibc .b0 ].cint ;
	  baseheight = fontinfo [heightbase [f ]+ ( ibc .b1 ) / 256 ].cint 
	  ;
	  accentwidth = fontinfo [widthbase [f ]+ iac .b0 ].cint ;
	  accentheight = fontinfo [heightbase [f ]+ ( iac .b1 ) / 256 ]
	  .cint ;
	  delta = round ( ( basewidth - accentwidth ) / ((double) 2.0 ) + 
	  baseheight * baseslant - basexheight * accentslant ) ;
	  dvih = curh ;
	  curh = curh + delta ;
	  if ( curh != dvih ) 
	  {
	    movement ( curh - dvih , 143 ) ;
	    dvih = curh ;
	  } 
	  if ( ( ( baseheight != basexheight ) && ( accentheight > 0 ) ) ) 
	  {
	    curv = baseline + ( basexheight - baseheight ) ;
	    if ( curv != dviv ) 
	    {
	      movement ( curv - dviv , 157 ) ;
	      dviv = curv ;
	    } 
	    if ( accentc >= 128 ) 
	    {
	      dvibuf [dviptr ]= 128 ;
	      incr ( dviptr ) ;
	      if ( dviptr == dvilimit ) 
	      dviswap () ;
	    } 
	    {
	      dvibuf [dviptr ]= accentc ;
	      incr ( dviptr ) ;
	      if ( dviptr == dvilimit ) 
	      dviswap () ;
	    } 
	    curv = baseline ;
	  } 
	  else {
	      
	    if ( curv != dviv ) 
	    {
	      movement ( curv - dviv , 157 ) ;
	      dviv = curv ;
	    } 
	    if ( accentc >= 128 ) 
	    {
	      dvibuf [dviptr ]= 128 ;
	      incr ( dviptr ) ;
	      if ( dviptr == dvilimit ) 
	      dviswap () ;
	    } 
	    {
	      dvibuf [dviptr ]= accentc ;
	      incr ( dviptr ) ;
	      if ( dviptr == dvilimit ) 
	      dviswap () ;
	    } 
	  } 
	  curh = curh + accentwidth ;
	  dvih = curh ;
	  curh = curh + ( - (integer) accentwidth - delta ) ;
	  if ( curh != dvih ) 
	  {
	    movement ( curh - dvih , 143 ) ;
	    dvih = curh ;
	  } 
	  if ( curv != dviv ) 
	  {
	    movement ( curv - dviv , 157 ) ;
	    dviv = curv ;
	  } 
	  if ( basec >= 128 ) 
	  {
	    dvibuf [dviptr ]= 128 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	  {
	    dvibuf [dviptr ]= basec ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	  curh = curh + basewidth ;
	  dvih = curh ;
	} 
	lab22: ;
      } 
      else {
	  
	if ( chain == false ) 
	chain = true ;
	else {
	    
	  curh = curh + mem [kspptr + 1 ].cint ;
	  if ( gsign != 0 ) 
	  {
	    if ( gsign == 1 ) 
	    {
	      if ( mem [kspptr ].hh.b0 == gorder ) 
	      curh = curh + round ( mem [thisbox + 6 ].gr * mem [kspptr + 2 
	      ].cint ) ;
	    } 
	    else {
		
	      if ( mem [kspptr ].hh.b1 == gorder ) 
	      curh = curh - round ( mem [thisbox + 6 ].gr * mem [kspptr + 3 
	      ].cint ) ;
	    } 
	  } 
	  if ( curh != dvih ) 
	  {
	    movement ( curh - dvih , 143 ) ;
	    dvih = curh ;
	  } 
	} 
	prevp = mem [prevp ].hh .v.RH ;
	p = mem [p ].hh .v.RH ;
	jc = ktokentochr ( mem [p ].hh .v.LH ) ;
	if ( fontenc [f ]== 2 ) 
	jc = toUCS ( jc ) ;
	else if ( fontenc [f ]== 1 ) 
	{
	  if ( toJIS ( jc ) == 0 ) 
	  charwarningjis ( f , jc ) ;
	  jc = toJIS ( jc ) ;
	} 
	else jc = toDVI ( jc ) ;
	if ( ( jc < 65536L ) ) 
	{
	  {
	    dvibuf [dviptr ]= 129 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	} 
	else if ( ( jc < 16777216L ) ) 
	{
	  {
	    dvibuf [dviptr ]= 130 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	  {
	    dvibuf [dviptr ]= BYTE2 ( jc ) ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	} 
	else {
	    
	  {
	    dvibuf [dviptr ]= 131 ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	  {
	    dvibuf [dviptr ]= BYTE1 ( jc ) ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	  {
	    dvibuf [dviptr ]= BYTE2 ( jc ) ;
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	} 
	{
	  dvibuf [dviptr ]= BYTE3 ( jc ) ;
	  incr ( dviptr ) ;
	  if ( dviptr == dvilimit ) 
	  dviswap () ;
	} 
	{
	  dvibuf [dviptr ]= BYTE4 ( jc ) ;
	  incr ( dviptr ) ;
	  if ( dviptr == dvilimit ) 
	  dviswap () ;
	} 
	curh = curh + fontinfo [widthbase [f ]+ fontinfo [charbase [f ]+ 
	c ].qqqq .b0 ].cint ;
      } 
      dvih = curh ;
      p = mem [p ].hh .v.RH ;
    } while ( ! ( ! ( p >= himemmin ) ) ) ;
    synctexcurrent () ;
    chain = false ;
  } 
  else {
      
    switch ( mem [p ].hh.b0 ) 
    {case 0 : 
    case 1 : 
    case 2 : 
      if ( mem [p + 5 ].hh .v.RH == -1073741823L ) 
      {
	if ( mem [p ].hh.b0 != 2 ) {
	    
	  if ( mem [p ].hh.b0 == 1 ) 
	  {
	    synctexvoidvlist ( p , thisbox ) ;
	  } 
	  else {
	      
	    synctexvoidhlist ( p , thisbox ) ;
	  } 
	} 
	curh = curh + mem [p + 1 ].cint ;
      } 
      else {
	  
	saveh = dvih ;
	savev = dviv ;
	savedir = dvidir ;
	curv = baseline + disp + mem [p + 4 ].cint ;
	tempptr = p ;
	edge = curh + mem [p + 1 ].cint ;
	if ( curdir == 1 ) 
	curh = edge ;
	switch ( mem [p ].hh.b0 ) 
	{case 0 : 
	  hlistout () ;
	  break ;
	case 1 : 
	  vlistout () ;
	  break ;
	case 2 : 
	  dirout () ;
	  break ;
	} 
	dvih = saveh ;
	dviv = savev ;
	dvidir = savedir ;
	curh = edge ;
	curv = baseline + disp ;
	curdirhv = savedir ;
      } 
      break ;
    case 3 : 
      {
	ruleht = mem [p + 3 ].cint ;
	ruledp = mem [p + 2 ].cint ;
	rulewd = mem [p + 1 ].cint ;
	goto lab14 ;
      } 
      break ;
    case 10 : 
      outwhat ( p ) ;
      break ;
    case 5 : 
      {
	disp = mem [p + 1 ].cint ;
	revdisp = disp ;
	curv = baseline + disp ;
      } 
      break ;
    case 12 : 
      {
	g = mem [p + 1 ].hh .v.LH ;
	rulewd = mem [g + 1 ].cint - curg ;
	if ( gsign != 0 ) 
	{
	  if ( gsign == 1 ) 
	  {
	    if ( mem [g ].hh.b0 == gorder ) 
	    {
	      curglue = curglue + mem [g + 2 ].cint ;
	      gluetemp = mem [thisbox + 6 ].gr * curglue ;
	      if ( gluetemp > 1000000000.0 ) 
	      gluetemp = 1000000000.0 ;
	      else if ( gluetemp < -1000000000.0 ) 
	      gluetemp = -1000000000.0 ;
	      curg = round ( gluetemp ) ;
	    } 
	  } 
	  else if ( mem [g ].hh.b1 == gorder ) 
	  {
	    curglue = curglue - mem [g + 3 ].cint ;
	    gluetemp = mem [thisbox + 6 ].gr * curglue ;
	    if ( gluetemp > 1000000000.0 ) 
	    gluetemp = 1000000000.0 ;
	    else if ( gluetemp < -1000000000.0 ) 
	    gluetemp = -1000000000.0 ;
	    curg = round ( gluetemp ) ;
	  } 
	} 
	rulewd = rulewd + curg ;
	if ( ( eTeXmode == 1 ) ) {
	    
	  if ( ( ( ( gsign == 1 ) && ( mem [g ].hh.b0 == gorder ) ) || ( ( 
	  gsign == 2 ) && ( mem [g ].hh.b1 == gorder ) ) ) ) 
	  {
	    {
	      if ( mem [g ].hh .v.RH == -1073741823L ) 
	      freenode ( g , 4 ) ;
	      else decr ( mem [g ].hh .v.RH ) ;
	    } 
	    if ( mem [p ].hh.b1 < 100 ) 
	    {
	      mem [p ].hh.b0 = 13 ;
	      mem [p + 1 ].cint = rulewd ;
	    } 
	    else {
		
	      g = getnode ( 4 ) ;
	      mem [g ].hh.b0 = 5 ;
	      mem [g ].hh.b1 = 5 ;
	      mem [g + 1 ].cint = rulewd ;
	      mem [g + 2 ].cint = 0 ;
	      mem [g + 3 ].cint = 0 ;
	      mem [p + 1 ].hh .v.LH = g ;
	    } 
	  } 
	} 
	if ( mem [p ].hh.b1 >= 100 ) 
	{
	  leaderbox = mem [p + 1 ].hh .v.RH ;
	  if ( mem [leaderbox ].hh.b0 == 3 ) 
	  {
	    ruleht = mem [leaderbox + 3 ].cint ;
	    ruledp = mem [leaderbox + 2 ].cint ;
	    goto lab14 ;
	  } 
	  leaderwd = mem [leaderbox + 1 ].cint ;
	  if ( ( leaderwd > 0 ) && ( rulewd > 0 ) ) 
	  {
	    rulewd = rulewd + 10 ;
	    if ( curdir == 1 ) 
	    curh = curh - 10 ;
	    edge = curh + rulewd ;
	    lx = 0 ;
	    if ( mem [p ].hh.b1 == 100 ) 
	    {
	      saveh = curh ;
	      curh = leftedge + leaderwd * ( ( curh - leftedge ) / leaderwd ) 
	      ;
	      if ( curh < saveh ) 
	      curh = curh + leaderwd ;
	    } 
	    else {
		
	      lq = rulewd / leaderwd ;
	      lr = rulewd % leaderwd ;
	      if ( mem [p ].hh.b1 == 101 ) 
	      curh = curh + ( lr / 2 ) ;
	      else {
		  
		lx = lr / ( lq + 1 ) ;
		curh = curh + ( ( lr - ( lq - 1 ) * lx ) / 2 ) ;
	      } 
	    } 
	    while ( curh + leaderwd <= edge ) {
		
	      curv = baseline + disp + mem [leaderbox + 4 ].cint ;
	      if ( curv != dviv ) 
	      {
		movement ( curv - dviv , 157 ) ;
		dviv = curv ;
	      } 
	      savev = dviv ;
	      if ( curh != dvih ) 
	      {
		movement ( curh - dvih , 143 ) ;
		dvih = curh ;
	      } 
	      saveh = dvih ;
	      savedir = dvidir ;
	      tempptr = leaderbox ;
	      if ( curdir == 1 ) 
	      curh = curh + leaderwd ;
	      outerdoingleaders = doingleaders ;
	      doingleaders = true ;
	      switch ( mem [leaderbox ].hh.b0 ) 
	      {case 0 : 
		hlistout () ;
		break ;
	      case 1 : 
		vlistout () ;
		break ;
	      case 2 : 
		dirout () ;
		break ;
	      } 
	      doingleaders = outerdoingleaders ;
	      dviv = savev ;
	      dvih = saveh ;
	      dvidir = savedir ;
	      curv = baseline ;
	      curh = saveh + leaderwd + lx ;
	      curdirhv = savedir ;
	    } 
	    if ( curdir == 1 ) 
	    curh = edge ;
	    else curh = edge - 10 ;
	    goto lab15 ;
	  } 
	} 
	goto lab13 ;
      } 
      break ;
    case 13 : 
      {
	synctexkern ( p , thisbox ) ;
	curh = curh + mem [p + 1 ].cint ;
      } 
      break ;
    case 11 : 
      {
	synctexmath ( p , thisbox ) ;
	{
	  if ( ( eTeXmode == 1 ) ) 
	  {
	    if ( odd ( mem [p ].hh.b1 ) ) {
		
	      if ( mem [LRptr ].hh .v.LH == ( 4 * ( mem [p ].hh.b1 / 4 ) + 
	      3 ) ) 
	      {
		tempptr = LRptr ;
		LRptr = mem [tempptr ].hh .v.RH ;
		{
		  mem [tempptr ].hh .v.RH = avail ;
		  avail = tempptr ;
	;
#ifdef STAT
		  decr ( dynused ) ;
#endif /* STAT */
		} 
	      } 
	      else {
		  
		if ( mem [p ].hh.b1 > 4 ) 
		incr ( LRproblems ) ;
	      } 
	    } 
	    else {
		
	      {
		tempptr = getavail () ;
		mem [tempptr ].hh .v.LH = ( 4 * ( mem [p ].hh.b1 / 4 ) + 3 
		) ;
		mem [tempptr ].hh .v.RH = LRptr ;
		LRptr = tempptr ;
	      } 
	      if ( ( mem [p ].hh.b1 / 8 ) != curdir ) 
	      {
		saveh = curh ;
		tempptr = mem [p ].hh .v.RH ;
		rulewd = mem [p + 1 ].cint ;
		freenode ( p , 4 ) ;
		curdir = 1 - curdir ;
		p = newedge ( curdir , rulewd ) ;
		mem [prevp ].hh .v.RH = p ;
		curh = curh - leftedge + rulewd ;
		mem [p ].hh .v.RH = reverse ( thisbox , newedge ( 1 - curdir 
		, 0 ) , curg , curglue ) ;
		mem [p + 2 ].cint = curh ;
		curdir = 1 - curdir ;
		curh = saveh ;
		goto lab21 ;
	      } 
	    } 
	    mem [p ].hh.b0 = 13 ;
	  } 
	  curh = curh + mem [p + 1 ].cint ;
	} 
      } 
      break ;
    case 8 : 
      {
	mem [memtop - 12 ]= mem [p + 1 ];
	mem [memtop - 12 ].hh .v.RH = mem [p ].hh .v.RH ;
	p = memtop - 12 ;
	goto lab21 ;
      } 
      break ;
    case 16 : 
      {
	curh = curh + mem [p + 1 ].cint ;
	leftedge = curh + mem [p + 2 ].cint ;
	curdir = mem [p ].hh.b1 ;
      } 
      break ;
      default: 
      ;
      break ;
    } 
    goto lab15 ;
    lab14: if ( ( ruleht == -1073741824L ) ) 
    ruleht = mem [thisbox + 3 ].cint + disp ;
    if ( ( ruledp == -1073741824L ) ) 
    ruledp = mem [thisbox + 2 ].cint - disp ;
    ruleht = ruleht + ruledp ;
    if ( ( ruleht > 0 ) && ( rulewd > 0 ) ) 
    {
      if ( curh != dvih ) 
      {
	movement ( curh - dvih , 143 ) ;
	dvih = curh ;
      } 
      curv = baseline + ruledp ;
      if ( curv != dviv ) 
      {
	movement ( curv - dviv , 157 ) ;
	dviv = curv ;
      } 
      {
	dvibuf [dviptr ]= 132 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      dvifour ( ruleht ) ;
      dvifour ( rulewd ) ;
      curv = baseline ;
      dvih = dvih + rulewd ;
    } 
    lab13: {
	
      curh = curh + rulewd ;
      synctexhorizontalruleorglue ( p , thisbox ) ;
    } 
    lab15: prevp = p ;
    p = mem [p ].hh .v.RH ;
  } 
  synctextsilh ( thisbox ) ;
  if ( ( eTeXmode == 1 ) ) 
  {
    {
      while ( mem [LRptr ].hh .v.LH != 0 ) {
	  
	if ( mem [LRptr ].hh .v.LH > 4 ) 
	LRproblems = LRproblems + 10000 ;
	{
	  tempptr = LRptr ;
	  LRptr = mem [tempptr ].hh .v.RH ;
	  {
	    mem [tempptr ].hh .v.RH = avail ;
	    avail = tempptr ;
	;
#ifdef STAT
	    decr ( dynused ) ;
#endif /* STAT */
	  } 
	} 
      } 
      {
	tempptr = LRptr ;
	LRptr = mem [tempptr ].hh .v.RH ;
	{
	  mem [tempptr ].hh .v.RH = avail ;
	  avail = tempptr ;
	;
#ifdef STAT
	  decr ( dynused ) ;
#endif /* STAT */
	} 
      } 
    } 
    if ( ( ( mem [thisbox ].hh.b1 ) / 16 ) == 2 ) 
    curdir = 1 ;
  } 
  prunemovements ( saveloc ) ;
  if ( curs > 0 ) 
  dvipop ( saveloc ) ;
  decr ( curs ) ;
} 
void 
vlistout ( void ) 
{
  /* 13 14 15 */ vlistout_regmem 
  scaled leftedge  ;
  scaled topedge  ;
  scaled saveh, savev  ;
  halfword thisbox  ;
  glueord gorder  ;
  unsigned char gsign  ;
  halfword p  ;
  integer saveloc  ;
  halfword leaderbox  ;
  scaled leaderht  ;
  scaled lx  ;
  boolean outerdoingleaders  ;
  scaled edge  ;
  real gluetemp  ;
  real curglue  ;
  scaled curg  ;
  integer savedir  ;
  curg = 0 ;
  curglue = 0.0 ;
  thisbox = tempptr ;
  gorder = mem [thisbox + 5 ].hh.b1 ;
  gsign = mem [thisbox + 5 ].hh.b0 ;
  p = mem [thisbox + 5 ].hh .v.RH ;
  incr ( curs ) ;
  if ( curs > 0 ) 
  {
    dvibuf [dviptr ]= 141 ;
    incr ( dviptr ) ;
    if ( dviptr == dvilimit ) 
    dviswap () ;
  } 
  if ( curs > maxpush ) 
  maxpush = curs ;
  saveloc = dvioffset + dviptr ;
  synchdir () ;
  leftedge = curh ;
  synctexvlist ( thisbox ) ;
  curv = curv - mem [thisbox + 3 ].cint ;
  topedge = curv ;
  while ( p != -1073741823L ) {
      
    if ( ( p >= himemmin ) ) 
    confusion ( 994 ) ;
    else {
	
      switch ( mem [p ].hh.b0 ) 
      {case 0 : 
      case 1 : 
      case 2 : 
	if ( mem [p + 5 ].hh .v.RH == -1073741823L ) 
	{
	  curv = curv + mem [p + 3 ].cint ;
	  if ( mem [p ].hh.b0 != 2 ) {
	      
	    if ( mem [p ].hh.b0 == 1 ) 
	    {
	      synctexvoidvlist ( p , thisbox ) ;
	    } 
	    else {
		
	      synctexvoidhlist ( p , thisbox ) ;
	    } 
	  } 
	  curv = curv + mem [p + 2 ].cint ;
	} 
	else {
	    
	  curv = curv + mem [p + 3 ].cint ;
	  if ( curv != dviv ) 
	  {
	    movement ( curv - dviv , 157 ) ;
	    dviv = curv ;
	  } 
	  saveh = dvih ;
	  savev = dviv ;
	  savedir = dvidir ;
	  if ( curdir == 1 ) 
	  curh = leftedge - mem [p + 4 ].cint ;
	  else curh = leftedge + mem [p + 4 ].cint ;
	  tempptr = p ;
	  switch ( mem [p ].hh.b0 ) 
	  {case 0 : 
	    hlistout () ;
	    break ;
	  case 1 : 
	    vlistout () ;
	    break ;
	  case 2 : 
	    dirout () ;
	    break ;
	  } 
	  dvih = saveh ;
	  dviv = savev ;
	  dvidir = savedir ;
	  curv = savev + mem [p + 2 ].cint ;
	  curh = leftedge ;
	  curdirhv = savedir ;
	} 
	break ;
      case 3 : 
	{
	  ruleht = mem [p + 3 ].cint ;
	  ruledp = mem [p + 2 ].cint ;
	  rulewd = mem [p + 1 ].cint ;
	  goto lab14 ;
	} 
	break ;
      case 10 : 
	outwhat ( p ) ;
	break ;
      case 12 : 
	{
	  g = mem [p + 1 ].hh .v.LH ;
	  ruleht = mem [g + 1 ].cint - curg ;
	  if ( gsign != 0 ) 
	  {
	    if ( gsign == 1 ) 
	    {
	      if ( mem [g ].hh.b0 == gorder ) 
	      {
		curglue = curglue + mem [g + 2 ].cint ;
		gluetemp = mem [thisbox + 6 ].gr * curglue ;
		if ( gluetemp > 1000000000.0 ) 
		gluetemp = 1000000000.0 ;
		else if ( gluetemp < -1000000000.0 ) 
		gluetemp = -1000000000.0 ;
		curg = round ( gluetemp ) ;
	      } 
	    } 
	    else if ( mem [g ].hh.b1 == gorder ) 
	    {
	      curglue = curglue - mem [g + 3 ].cint ;
	      gluetemp = mem [thisbox + 6 ].gr * curglue ;
	      if ( gluetemp > 1000000000.0 ) 
	      gluetemp = 1000000000.0 ;
	      else if ( gluetemp < -1000000000.0 ) 
	      gluetemp = -1000000000.0 ;
	      curg = round ( gluetemp ) ;
	    } 
	  } 
	  ruleht = ruleht + curg ;
	  if ( mem [p ].hh.b1 >= 100 ) 
	  {
	    leaderbox = mem [p + 1 ].hh .v.RH ;
	    if ( mem [leaderbox ].hh.b0 == 3 ) 
	    {
	      rulewd = mem [leaderbox + 1 ].cint ;
	      ruledp = 0 ;
	      goto lab14 ;
	    } 
	    leaderht = mem [leaderbox + 3 ].cint + mem [leaderbox + 2 ]
	    .cint ;
	    if ( ( leaderht > 0 ) && ( ruleht > 0 ) ) 
	    {
	      ruleht = ruleht + 10 ;
	      edge = curv + ruleht ;
	      lx = 0 ;
	      if ( mem [p ].hh.b1 == 100 ) 
	      {
		savev = curv ;
		curv = topedge + leaderht * ( ( curv - topedge ) / leaderht ) 
		;
		if ( curv < savev ) 
		curv = curv + leaderht ;
	      } 
	      else {
		  
		lq = ruleht / leaderht ;
		lr = ruleht % leaderht ;
		if ( mem [p ].hh.b1 == 101 ) 
		curv = curv + ( lr / 2 ) ;
		else {
		    
		  lx = lr / ( lq + 1 ) ;
		  curv = curv + ( ( lr - ( lq - 1 ) * lx ) / 2 ) ;
		} 
	      } 
	      while ( curv + leaderht <= edge ) {
		  
		if ( curdir == 1 ) 
		curh = leftedge - mem [leaderbox + 4 ].cint ;
		else curh = leftedge + mem [leaderbox + 4 ].cint ;
		if ( curh != dvih ) 
		{
		  movement ( curh - dvih , 143 ) ;
		  dvih = curh ;
		} 
		saveh = dvih ;
		curv = curv + mem [leaderbox + 3 ].cint ;
		if ( curv != dviv ) 
		{
		  movement ( curv - dviv , 157 ) ;
		  dviv = curv ;
		} 
		savev = dviv ;
		savedir = dvidir ;
		tempptr = leaderbox ;
		outerdoingleaders = doingleaders ;
		doingleaders = true ;
		switch ( mem [leaderbox ].hh.b0 ) 
		{case 0 : 
		  hlistout () ;
		  break ;
		case 1 : 
		  vlistout () ;
		  break ;
		case 2 : 
		  dirout () ;
		  break ;
		} 
		doingleaders = outerdoingleaders ;
		dviv = savev ;
		dvih = saveh ;
		dvidir = savedir ;
		curh = leftedge ;
		curv = savev - mem [leaderbox + 3 ].cint + leaderht + lx ;
		curdirhv = savedir ;
	      } 
	      curv = edge - 10 ;
	      goto lab15 ;
	    } 
	  } 
	  goto lab13 ;
	} 
	break ;
      case 13 : 
	curv = curv + mem [p + 1 ].cint ;
	break ;
	default: 
	;
	break ;
      } 
      goto lab15 ;
      lab14: if ( ( rulewd == -1073741824L ) ) 
      rulewd = mem [thisbox + 1 ].cint ;
      ruleht = ruleht + ruledp ;
      curv = curv + ruleht ;
      if ( ( ruleht > 0 ) && ( rulewd > 0 ) ) 
      {
	if ( curdir == 1 ) 
	curh = curh - rulewd ;
	if ( curh != dvih ) 
	{
	  movement ( curh - dvih , 143 ) ;
	  dvih = curh ;
	} 
	if ( curv != dviv ) 
	{
	  movement ( curv - dviv , 157 ) ;
	  dviv = curv ;
	} 
	{
	  dvibuf [dviptr ]= 137 ;
	  incr ( dviptr ) ;
	  if ( dviptr == dvilimit ) 
	  dviswap () ;
	} 
	dvifour ( ruleht ) ;
	dvifour ( rulewd ) ;
	curh = leftedge ;
      } 
      goto lab15 ;
      lab13: curv = curv + ruleht ;
    } 
    lab15: p = mem [p ].hh .v.RH ;
  } 
  synctextsilv ( thisbox ) ;
  prunemovements ( saveloc ) ;
  if ( curs > 0 ) 
  dvipop ( saveloc ) ;
  decr ( curs ) ;
} 
void 
zshipout ( halfword p ) 
{
  /* 30 */ shipout_regmem 
  integer pageloc  ;
  halfword delnode  ;
  unsigned char j, k  ;
  poolpointer s  ;
  unsigned char oldsetting  ;
  synctexsheet ( eqtb [114378L ].cint ) ;
  {
    if ( eqtb [114395L ].cint > 0 ) 
    {
      printnl ( 349 ) ;
      println () ;
      print ( 995 ) ;
    } 
    if ( termoffset > maxprintline - 9 ) 
    println () ;
    else if ( ( termoffset > 0 ) || ( fileoffset > 0 ) ) 
    printchar ( 32 ) ;
    printchar ( 91 ) ;
    j = 9 ;
    while ( ( eqtb [114445L + j ].cint == 0 ) && ( j > 0 ) ) decr ( j ) ;
    {register integer for_end; k = 0 ;for_end = j ; if ( k <= for_end) do 
      {
	printint ( eqtb [114445L + k ].cint ) ;
	if ( k < j ) 
	printchar ( 46 ) ;
      } 
    while ( k++ < for_end ) ;} 
    fflush ( stdout ) ;
    if ( eqtb [114395L ].cint > 0 ) 
    {
      printchar ( 93 ) ;
      begindiagnostic () ;
      showbox ( p ) ;
      enddiagnostic ( true ) ;
    } 
    if ( mem [p ].hh.b0 == 2 ) 
    {
      delnode = p ;
      p = mem [p + 5 ].hh .v.RH ;
      deleteglueref ( mem [delnode + 7 ].hh .v.RH ) ;
      deleteglueref ( mem [delnode + 7 ].hh .v.LH ) ;
      freenode ( delnode , 10 ) ;
    } 
    flushnodelist ( mem [p ].hh .v.RH ) ;
    mem [p ].hh .v.RH = -1073741823L ;
    if ( abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) ) != 4 ) 
    p = newdirnode ( p , 4 ) ;
    if ( ( mem [p + 3 ].cint > 1073741823L ) || ( mem [p + 2 ].cint > 
    1073741823L ) || ( mem [p + 3 ].cint + mem [p + 2 ].cint + eqtb [
    114976L ].cint > 1073741823L ) || ( mem [p + 1 ].cint + eqtb [114975L 
    ].cint > 1073741823L ) ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 999 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 1000 ;
	helpline [0 ]= 1001 ;
      } 
      error () ;
      if ( eqtb [114395L ].cint <= 0 ) 
      {
	begindiagnostic () ;
	printnl ( 1002 ) ;
	showbox ( p ) ;
	enddiagnostic ( true ) ;
      } 
      goto lab30 ;
    } 
    if ( mem [p + 3 ].cint + mem [p + 2 ].cint + eqtb [114976L ].cint > 
    maxv ) 
    maxv = mem [p + 3 ].cint + mem [p + 2 ].cint + eqtb [114976L ].cint 
    ;
    if ( mem [p + 1 ].cint + eqtb [114975L ].cint > maxh ) 
    maxh = mem [p + 1 ].cint + eqtb [114975L ].cint ;
    if ( eqtb [114981L ].cint != 0 ) 
    curpageheight = eqtb [114981L ].cint ;
    else if ( ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) == 3 ) || ( ( ( mem [p ]
    .hh.b1 ) % 16 - 5 ) == 1 ) ) 
    curpageheight = mem [p + 1 ].cint + 2 * eqtb [114976L ].cint + 2 * 
    4736286L ;
    else curpageheight = mem [p + 3 ].cint + mem [p + 2 ].cint + 2 * eqtb 
    [114976L ].cint + 2 * 4736286L ;
    if ( eqtb [114980L ].cint != 0 ) 
    curpagewidth = eqtb [114980L ].cint ;
    else if ( ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) == 3 ) || ( ( ( mem [p ]
    .hh.b1 ) % 16 - 5 ) == 1 ) ) 
    curpagewidth = mem [p + 3 ].cint + mem [p + 2 ].cint + 2 * eqtb [
    114975L ].cint + 2 * 4736286L ;
    else curpagewidth = mem [p + 1 ].cint + 2 * eqtb [114975L ].cint + 2 * 
    4736286L ;
    dvih = 0 ;
    dviv = 0 ;
    curh = eqtb [114975L ].cint ;
    dvif = 0 ;
    dvidir = 4 ;
    curdirhv = dvidir ;
    if ( outputfilename == 0 ) 
    {
      if ( jobname == 0 ) 
      openlogfile () ;
      packjobname ( 951 ) ;
      while ( ! bopenout ( dvifile ) ) promptfilename ( 952 , 951 ) ;
      outputfilename = bmakenamestring ( dvifile ) ;
    } 
    if ( totalpages == 0 ) 
    {
      {
	dvibuf [dviptr ]= 247 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      {
	dvibuf [dviptr ]= 2 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      dvifour ( 25400000L ) ;
      dvifour ( 473628672L ) ;
      preparemag () ;
      dvifour ( eqtb [114378L ].cint ) ;
      if ( outputcomment ) 
      {
	l = strlen ( outputcomment ) ;
	{
	  dvibuf [dviptr ]= l ;
	  incr ( dviptr ) ;
	  if ( dviptr == dvilimit ) 
	  dviswap () ;
	} 
	{register integer for_end; s = 0 ;for_end = l - 1 ; if ( s <= 
	for_end) do 
	  {
	    dvibuf [dviptr ]= outputcomment [s ];
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	while ( s++ < for_end ) ;} 
      } 
      else {
	  
	oldsetting = selector ;
	selector = 21 ;
	print ( 993 ) ;
	printint ( eqtb [114384L ].cint ) ;
	printchar ( 46 ) ;
	printtwo ( eqtb [114383L ].cint ) ;
	printchar ( 46 ) ;
	printtwo ( eqtb [114382L ].cint ) ;
	printchar ( 58 ) ;
	printtwo ( eqtb [114381L ].cint / 60 ) ;
	printtwo ( eqtb [114381L ].cint % 60 ) ;
	selector = oldsetting ;
	{
	  dvibuf [dviptr ]= ( poolptr - strstart [strptr ]) ;
	  incr ( dviptr ) ;
	  if ( dviptr == dvilimit ) 
	  dviswap () ;
	} 
	{register integer for_end; s = strstart [strptr ];for_end = 
	poolptr - 1 ; if ( s <= for_end) do 
	  {
	    dvibuf [dviptr ]= strpool [s ];
	    incr ( dviptr ) ;
	    if ( dviptr == dvilimit ) 
	    dviswap () ;
	  } 
	while ( s++ < for_end ) ;} 
	poolptr = strstart [strptr ];
      } 
    } 
    pageloc = dvioffset + dviptr ;
    {
      dvibuf [dviptr ]= 139 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    {register integer for_end; k = 0 ;for_end = 9 ; if ( k <= for_end) do 
      dvifour ( eqtb [114445L + k ].cint ) ;
    while ( k++ < for_end ) ;} 
    dvifour ( lastbop ) ;
    lastbop = pageloc ;
    curv = mem [p + 3 ].cint + eqtb [114976L ].cint ;
    tempptr = p ;
    switch ( mem [p ].hh.b0 ) 
    {case 0 : 
      hlistout () ;
      break ;
    case 1 : 
      vlistout () ;
      break ;
    case 2 : 
      dirout () ;
      break ;
    } 
    {
      dvibuf [dviptr ]= 140 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    incr ( totalpages ) ;
    curs = -1 ;
	;
#ifdef IPC
    if ( ipcon > 0 ) 
    {
      if ( dvilimit == halfbuf ) 
      {
	writedvi ( halfbuf , dvibufsize - 1 ) ;
	flushdvi () ;
	dvigone = dvigone + halfbuf ;
      } 
      if ( dviptr > ( 2147483647L - dvioffset ) ) 
      {
	curs = -2 ;
	fatalerror ( 992 ) ;
      } 
      if ( dviptr > 0 ) 
      {
	writedvi ( 0 , dviptr - 1 ) ;
	flushdvi () ;
	dvioffset = dvioffset + dviptr ;
	dvigone = dvigone + dviptr ;
      } 
      dviptr = 0 ;
      dvilimit = dvibufsize ;
      ipcpage ( dvigone ) ;
    } 
#endif /* IPC */
    lab30: ;
    if ( ( eTeXmode == 1 ) ) 
    {
      if ( LRproblems > 0 ) 
      {
	{
	  println () ;
	  printnl ( 1609 ) ;
	  printint ( LRproblems / 10000 ) ;
	  print ( 1610 ) ;
	  printint ( LRproblems % 10000 ) ;
	  print ( 1611 ) ;
	  LRproblems = 0 ;
	} 
	printchar ( 41 ) ;
	println () ;
      } 
      if ( ( LRptr != -1073741823L ) || ( curdir != 0 ) ) 
      confusion ( 1613 ) ;
    } 
    if ( eqtb [114395L ].cint <= 0 ) 
    printchar ( 93 ) ;
    deadcycles = 0 ;
    fflush ( stdout ) ;
	;
#ifdef STAT
    if ( eqtb [114392L ].cint > 1 ) 
    {
      printnl ( 996 ) ;
      printint ( varused ) ;
      printchar ( 38 ) ;
      printint ( dynused ) ;
      printchar ( 59 ) ;
    } 
#endif /* STAT */
    flushnodelist ( p ) ;
	;
#ifdef STAT
    if ( eqtb [114392L ].cint > 1 ) 
    {
      print ( 997 ) ;
      printint ( varused ) ;
      printchar ( 38 ) ;
      printint ( dynused ) ;
      print ( 998 ) ;
      printint ( himemmin - lomemmax - 1 ) ;
      println () ;
    } 
#endif /* STAT */
  } 
  synctexteehs () ;
} 
void 
zscanspec ( groupcode c , boolean threecodes ) 
{
  /* 40 */ scanspec_regmem 
  integer s  ;
  unsigned char speccode  ;
  if ( threecodes ) 
  s = savestack [saveptr + 0 ].cint ;
  if ( scankeyword ( 1008 ) ) 
  speccode = 0 ;
  else if ( scankeyword ( 1009 ) ) 
  speccode = 1 ;
  else {
      
    speccode = 1 ;
    curval = 0 ;
    goto lab40 ;
  } 
  scandimen ( false , false , false ) ;
  lab40: if ( threecodes ) 
  {
    savestack [saveptr + 0 ].cint = s ;
    incr ( saveptr ) ;
  } 
  savestack [saveptr + 0 ].cint = speccode ;
  savestack [saveptr + 1 ].cint = curval ;
  saveptr = saveptr + 2 ;
  newsavelevel ( c ) ;
  scanleftbrace () ;
} 
halfword 
zhpack ( halfword p , scaled w , smallnumber m ) 
{
  /* 21 50 10 */ register halfword Result; hpack_regmem 
  halfword r  ;
  halfword k  ;
  scaled disp  ;
  halfword q  ;
  scaled h, d, x  ;
  scaled s  ;
  halfword g  ;
  glueord o  ;
  internalfontnumber f  ;
  fourquarters i  ;
  sixteenbits hd  ;
  integer cx  ;
  lastbadness = 0 ;
  r = getnode ( 10 ) ;
  mem [r ].hh.b0 = 0 ;
  mem [r ].hh.b1 = 0 ;
  mem [r + 4 ].cint = 0 ;
  mem [r ].hh.b1 = ( ( mem [r ].hh.b1 ) / 16 ) * 16 + 5 ;
  mem [r + 7 ].hh .v.RH = curkanjiskip ;
  mem [r + 7 ].hh .v.LH = curxkanjiskip ;
  incr ( mem [curkanjiskip ].hh .v.RH ) ;
  incr ( mem [curxkanjiskip ].hh .v.RH ) ;
  k = curkanjiskip ;
  q = r + 5 ;
  mem [q ].hh .v.RH = p ;
  h = 0 ;
  d = 0 ;
  x = 0 ;
  totalstretch [0 ]= 0 ;
  totalshrink [0 ]= 0 ;
  totalstretch [1 ]= 0 ;
  totalshrink [1 ]= 0 ;
  totalstretch [2 ]= 0 ;
  totalshrink [2 ]= 0 ;
  totalstretch [3 ]= 0 ;
  totalshrink [3 ]= 0 ;
  totalstretch [4 ]= 0 ;
  totalshrink [4 ]= 0 ;
  disp = 0 ;
  if ( ( eqtb [114444L ].cint > 0 ) ) 
  {
    tempptr = getavail () ;
    mem [tempptr ].hh .v.LH = 0 ;
    mem [tempptr ].hh .v.RH = LRptr ;
    LRptr = tempptr ;
  } 
  while ( p != -1073741823L ) {
      
    lab21: chain = false ;
    while ( ( p >= himemmin ) ) {
	
      f = mem [p ].hh.b0 ;
      cx = ptencucsto8bitcode ( fontenc [f ], mem [p ].hh.b1 ) ;
      i = fontinfo [charbase [f ]+ effectivechar ( true , f , cx ) ].qqqq 
      ;
      hd = i .b1 ;
      x = x + fontinfo [widthbase [f ]+ i .b0 ].cint ;
      s = fontinfo [heightbase [f ]+ ( hd ) / 256 ].cint - disp ;
      if ( s > h ) 
      h = s ;
      s = fontinfo [depthbase [f ]+ ( hd ) % 256 ].cint + disp ;
      if ( s > d ) 
      d = s ;
      if ( fontdir [f ]!= 0 ) 
      {
	p = mem [p ].hh .v.RH ;
	if ( chain ) 
	{
	  x = x + mem [k + 1 ].cint ;
	  o = mem [k ].hh.b0 ;
	  totalstretch [o ]= totalstretch [o ]+ mem [k + 2 ].cint ;
	  o = mem [k ].hh.b1 ;
	  totalshrink [o ]= totalshrink [o ]+ mem [k + 3 ].cint ;
	} 
	else chain = true ;
      } 
      else chain = false ;
      p = mem [p ].hh .v.RH ;
    } 
    if ( p != -1073741823L ) 
    {
      switch ( mem [p ].hh.b0 ) 
      {case 0 : 
      case 1 : 
      case 2 : 
      case 3 : 
      case 15 : 
	{
	  x = x + mem [p + 1 ].cint ;
	  if ( mem [p ].hh.b0 >= 3 ) 
	  s = disp ;
	  else s = mem [p + 4 ].cint + disp ;
	  if ( mem [p + 3 ].cint - s > h ) 
	  h = mem [p + 3 ].cint - s ;
	  if ( mem [p + 2 ].cint + s > d ) 
	  d = mem [p + 2 ].cint + s ;
	} 
	break ;
      case 4 : 
      case 6 : 
      case 7 : 
	if ( ( adjusttail != -1073741823L ) || ( preadjusttail != -1073741823L 
	) ) 
	{
	  while ( mem [q ].hh .v.RH != p ) q = mem [q ].hh .v.RH ;
	  if ( mem [p ].hh.b0 == 7 ) 
	  {
	    if ( mem [p ].hh.b1 != 0 ) 
	    {
	      if ( preadjusttail == -1073741823L ) 
	      confusion ( 1010 ) ;
	      mem [preadjusttail ].hh .v.RH = mem [p + 1 ].cint ;
	      while ( mem [preadjusttail ].hh .v.RH != -1073741823L ) 
	      preadjusttail = mem [preadjusttail ].hh .v.RH ;
	    } 
	    else {
		
	      if ( adjusttail == -1073741823L ) 
	      confusion ( 1010 ) ;
	      mem [adjusttail ].hh .v.RH = mem [p + 1 ].cint ;
	      while ( mem [adjusttail ].hh .v.RH != -1073741823L ) 
	      adjusttail = mem [adjusttail ].hh .v.RH ;
	    } 
	    p = mem [p ].hh .v.RH ;
	    freenode ( mem [q ].hh .v.RH , 2 ) ;
	  } 
	  else {
	      
	    mem [adjusttail ].hh .v.RH = p ;
	    adjusttail = p ;
	    p = mem [p ].hh .v.RH ;
	  } 
	  mem [q ].hh .v.RH = p ;
	  p = q ;
	} 
	break ;
      case 10 : 
	;
	break ;
      case 5 : 
	{
	  disp = mem [p + 1 ].cint ;
	  revdisp = disp ;
	} 
	break ;
      case 12 : 
	{
	  g = mem [p + 1 ].hh .v.LH ;
	  x = x + mem [g + 1 ].cint ;
	  o = mem [g ].hh.b0 ;
	  totalstretch [o ]= totalstretch [o ]+ mem [g + 2 ].cint ;
	  o = mem [g ].hh.b1 ;
	  totalshrink [o ]= totalshrink [o ]+ mem [g + 3 ].cint ;
	  if ( mem [p ].hh.b1 >= 100 ) 
	  {
	    g = mem [p + 1 ].hh .v.RH ;
	    if ( mem [g + 3 ].cint > h ) 
	    h = mem [g + 3 ].cint ;
	    if ( mem [g + 2 ].cint > d ) 
	    d = mem [g + 2 ].cint ;
	  } 
	} 
	break ;
      case 13 : 
	x = x + mem [p + 1 ].cint ;
	break ;
      case 11 : 
	{
	  x = x + mem [p + 1 ].cint ;
	  if ( ( eqtb [114444L ].cint > 0 ) ) {
	      
	    if ( odd ( mem [p ].hh.b1 ) ) {
		
	      if ( mem [LRptr ].hh .v.LH == ( 4 * ( mem [p ].hh.b1 / 4 ) + 
	      3 ) ) 
	      {
		tempptr = LRptr ;
		LRptr = mem [tempptr ].hh .v.RH ;
		{
		  mem [tempptr ].hh .v.RH = avail ;
		  avail = tempptr ;
	;
#ifdef STAT
		  decr ( dynused ) ;
#endif /* STAT */
		} 
	      } 
	      else {
		  
		incr ( LRproblems ) ;
		mem [p ].hh.b0 = 13 ;
		mem [p ].hh.b1 = 1 ;
	      } 
	    } 
	    else {
		
	      tempptr = getavail () ;
	      mem [tempptr ].hh .v.LH = ( 4 * ( mem [p ].hh.b1 / 4 ) + 3 ) 
	      ;
	      mem [tempptr ].hh .v.RH = LRptr ;
	      LRptr = tempptr ;
	    } 
	  } 
	} 
	break ;
      case 8 : 
	{
	  mem [memtop - 12 ]= mem [p + 1 ];
	  mem [memtop - 12 ].hh .v.RH = mem [p ].hh .v.RH ;
	  p = memtop - 12 ;
	  goto lab21 ;
	} 
	break ;
	default: 
	;
	break ;
      } 
      p = mem [p ].hh .v.RH ;
    } 
  } 
  if ( adjusttail != -1073741823L ) 
  mem [adjusttail ].hh .v.RH = -1073741823L ;
  if ( preadjusttail != -1073741823L ) 
  mem [preadjusttail ].hh .v.RH = -1073741823L ;
  mem [r + 3 ].cint = h ;
  mem [r + 2 ].cint = d ;
  if ( m == 1 ) 
  w = x + w ;
  mem [r + 1 ].cint = w ;
  x = w - x ;
  if ( x == 0 ) 
  {
    mem [r + 5 ].hh.b0 = 0 ;
    mem [r + 5 ].hh.b1 = 0 ;
    mem [r + 6 ].gr = 0.0 ;
    goto lab10 ;
  } 
  else if ( x > 0 ) 
  {
    if ( totalstretch [4 ]!= 0 ) 
    o = 4 ;
    else if ( totalstretch [3 ]!= 0 ) 
    o = 3 ;
    else if ( totalstretch [2 ]!= 0 ) 
    o = 2 ;
    else if ( totalstretch [1 ]!= 0 ) 
    o = 1 ;
    else o = 0 ;
    mem [r + 5 ].hh.b1 = o ;
    mem [r + 5 ].hh.b0 = 1 ;
    if ( totalstretch [o ]!= 0 ) 
    mem [r + 6 ].gr = x / ((double) totalstretch [o ]) ;
    else {
	
      mem [r + 5 ].hh.b0 = 0 ;
      mem [r + 6 ].gr = 0.0 ;
    } 
    if ( o == 0 ) {
	
      if ( mem [r + 5 ].hh .v.RH != -1073741823L ) 
      {
	lastbadness = badness ( x , totalstretch [0 ]) ;
	if ( lastbadness > eqtb [114387L ].cint ) 
	{
	  println () ;
	  if ( lastbadness > 100 ) 
	  printnl ( 1011 ) ;
	  else printnl ( 1012 ) ;
	  print ( 1013 ) ;
	  printint ( lastbadness ) ;
	  goto lab50 ;
	} 
      } 
    } 
    goto lab10 ;
  } 
  else {
      
    if ( totalshrink [4 ]!= 0 ) 
    o = 4 ;
    else if ( totalshrink [3 ]!= 0 ) 
    o = 3 ;
    else if ( totalshrink [2 ]!= 0 ) 
    o = 2 ;
    else if ( totalshrink [1 ]!= 0 ) 
    o = 1 ;
    else o = 0 ;
    mem [r + 5 ].hh.b1 = o ;
    mem [r + 5 ].hh.b0 = 2 ;
    if ( totalshrink [o ]!= 0 ) 
    mem [r + 6 ].gr = ( - (integer) x ) / ((double) totalshrink [o ]) ;
    else {
	
      mem [r + 5 ].hh.b0 = 0 ;
      mem [r + 6 ].gr = 0.0 ;
    } 
    if ( ( totalshrink [o ]< - (integer) x ) && ( o == 0 ) && ( mem [r + 5 
    ].hh .v.RH != -1073741823L ) ) 
    {
      lastbadness = 1000000L ;
      mem [r + 6 ].gr = 1.0 ;
      if ( ( - (integer) x - totalshrink [0 ]> eqtb [114965L ].cint ) || ( 
      eqtb [114387L ].cint < 100 ) ) 
      {
	if ( ( eqtb [114973L ].cint > 0 ) && ( - (integer) x - totalshrink [
	0 ]> eqtb [114965L ].cint ) ) 
	{
	  while ( mem [q ].hh .v.RH != -1073741823L ) q = mem [q ].hh 
	  .v.RH ;
	  mem [q ].hh .v.RH = newrule () ;
	  mem [mem [q ].hh .v.RH + 1 ].cint = eqtb [114973L ].cint ;
	} 
	println () ;
	printnl ( 1019 ) ;
	printscaled ( - (integer) x - totalshrink [0 ]) ;
	print ( 1020 ) ;
	goto lab50 ;
      } 
    } 
    else if ( o == 0 ) {
	
      if ( mem [r + 5 ].hh .v.RH != -1073741823L ) 
      {
	lastbadness = badness ( - (integer) x , totalshrink [0 ]) ;
	if ( lastbadness > eqtb [114387L ].cint ) 
	{
	  println () ;
	  printnl ( 1021 ) ;
	  printint ( lastbadness ) ;
	  goto lab50 ;
	} 
      } 
    } 
    goto lab10 ;
  } 
  lab50: if ( outputactive ) 
  print ( 1014 ) ;
  else {
      
    if ( packbeginline != 0 ) 
    {
      if ( packbeginline > 0 ) 
      print ( 1015 ) ;
      else print ( 1016 ) ;
      printint ( abs ( packbeginline ) ) ;
      print ( 1017 ) ;
    } 
    else print ( 1018 ) ;
    printint ( line ) ;
  } 
  println () ;
  fontinshortdisplay = 0 ;
  shortdisplay ( mem [r + 5 ].hh .v.RH ) ;
  println () ;
  begindiagnostic () ;
  showbox ( r ) ;
  enddiagnostic ( true ) ;
  lab10: lastdisp = disp ;
  if ( ( eqtb [114444L ].cint > 0 ) ) 
  {
    if ( mem [LRptr ].hh .v.LH != 0 ) 
    {
      while ( mem [q ].hh .v.RH != -1073741823L ) q = mem [q ].hh .v.RH ;
      do {
	  tempptr = q ;
	q = newmath ( 0 , mem [LRptr ].hh .v.LH ) ;
	mem [tempptr ].hh .v.RH = q ;
	LRproblems = LRproblems + 10000 ;
	{
	  tempptr = LRptr ;
	  LRptr = mem [tempptr ].hh .v.RH ;
	  {
	    mem [tempptr ].hh .v.RH = avail ;
	    avail = tempptr ;
	;
#ifdef STAT
	    decr ( dynused ) ;
#endif /* STAT */
	  } 
	} 
      } while ( ! ( mem [LRptr ].hh .v.LH == 0 ) ) ;
    } 
    if ( LRproblems > 0 ) 
    {
      {
	println () ;
	printnl ( 1609 ) ;
	printint ( LRproblems / 10000 ) ;
	print ( 1610 ) ;
	printint ( LRproblems % 10000 ) ;
	print ( 1611 ) ;
	LRproblems = 0 ;
      } 
      goto lab50 ;
    } 
    {
      tempptr = LRptr ;
      LRptr = mem [tempptr ].hh .v.RH ;
      {
	mem [tempptr ].hh .v.RH = avail ;
	avail = tempptr ;
	;
#ifdef STAT
	decr ( dynused ) ;
#endif /* STAT */
      } 
    } 
    if ( LRptr != -1073741823L ) 
    confusion ( 1608 ) ;
  } 
  Result = r ;
  return Result ;
} 
halfword 
zvpackage ( halfword p , scaled h , smallnumber m , scaled l ) 
{
  /* 50 10 */ register halfword Result; vpackage_regmem 
  halfword r  ;
  scaled w, d, x  ;
  scaled s  ;
  halfword g  ;
  glueord o  ;
  lastbadness = 0 ;
  r = getnode ( 10 ) ;
  mem [r ].hh.b0 = 1 ;
  mem [r ].hh.b1 = 0 ;
  mem [r + 4 ].cint = 0 ;
  mem [r ].hh.b1 = ( ( mem [r ].hh.b1 ) / 16 ) * 16 + 5 ;
  mem [r + 7 ].hh .v.RH = membot ;
  mem [r + 7 ].hh .v.LH = membot ;
  incr ( mem [membot ].hh .v.RH ) ;
  incr ( mem [membot ].hh .v.RH ) ;
  mem [r + 5 ].hh .v.RH = p ;
  w = 0 ;
  d = 0 ;
  x = 0 ;
  totalstretch [0 ]= 0 ;
  totalshrink [0 ]= 0 ;
  totalstretch [1 ]= 0 ;
  totalshrink [1 ]= 0 ;
  totalstretch [2 ]= 0 ;
  totalshrink [2 ]= 0 ;
  totalstretch [3 ]= 0 ;
  totalshrink [3 ]= 0 ;
  totalstretch [4 ]= 0 ;
  totalshrink [4 ]= 0 ;
  while ( p != -1073741823L ) {
      
    if ( ( p >= himemmin ) ) 
    confusion ( 1022 ) ;
    else switch ( mem [p ].hh.b0 ) 
    {case 0 : 
    case 1 : 
    case 2 : 
    case 3 : 
    case 15 : 
      {
	x = x + d + mem [p + 3 ].cint ;
	d = mem [p + 2 ].cint ;
	if ( mem [p ].hh.b0 >= 3 ) 
	s = 0 ;
	else s = mem [p + 4 ].cint ;
	if ( mem [p + 1 ].cint + s > w ) 
	w = mem [p + 1 ].cint + s ;
      } 
      break ;
    case 10 : 
      ;
      break ;
    case 12 : 
      {
	x = x + d ;
	d = 0 ;
	g = mem [p + 1 ].hh .v.LH ;
	x = x + mem [g + 1 ].cint ;
	o = mem [g ].hh.b0 ;
	totalstretch [o ]= totalstretch [o ]+ mem [g + 2 ].cint ;
	o = mem [g ].hh.b1 ;
	totalshrink [o ]= totalshrink [o ]+ mem [g + 3 ].cint ;
	if ( mem [p ].hh.b1 >= 100 ) 
	{
	  g = mem [p + 1 ].hh .v.RH ;
	  if ( mem [g + 1 ].cint > w ) 
	  w = mem [g + 1 ].cint ;
	} 
      } 
      break ;
    case 13 : 
      {
	x = x + d + mem [p + 1 ].cint ;
	d = 0 ;
      } 
      break ;
      default: 
      ;
      break ;
    } 
    p = mem [p ].hh .v.RH ;
  } 
  mem [r + 1 ].cint = w ;
  if ( d > l ) 
  {
    x = x + d - l ;
    mem [r + 2 ].cint = l ;
  } 
  else mem [r + 2 ].cint = d ;
  if ( m == 1 ) 
  h = x + h ;
  mem [r + 3 ].cint = h ;
  x = h - x ;
  if ( x == 0 ) 
  {
    mem [r + 5 ].hh.b0 = 0 ;
    mem [r + 5 ].hh.b1 = 0 ;
    mem [r + 6 ].gr = 0.0 ;
    goto lab10 ;
  } 
  else if ( x > 0 ) 
  {
    if ( totalstretch [4 ]!= 0 ) 
    o = 4 ;
    else if ( totalstretch [3 ]!= 0 ) 
    o = 3 ;
    else if ( totalstretch [2 ]!= 0 ) 
    o = 2 ;
    else if ( totalstretch [1 ]!= 0 ) 
    o = 1 ;
    else o = 0 ;
    mem [r + 5 ].hh.b1 = o ;
    mem [r + 5 ].hh.b0 = 1 ;
    if ( totalstretch [o ]!= 0 ) 
    mem [r + 6 ].gr = x / ((double) totalstretch [o ]) ;
    else {
	
      mem [r + 5 ].hh.b0 = 0 ;
      mem [r + 6 ].gr = 0.0 ;
    } 
    if ( o == 0 ) {
	
      if ( mem [r + 5 ].hh .v.RH != -1073741823L ) 
      {
	lastbadness = badness ( x , totalstretch [0 ]) ;
	if ( lastbadness > eqtb [114388L ].cint ) 
	{
	  println () ;
	  if ( lastbadness > 100 ) 
	  printnl ( 1011 ) ;
	  else printnl ( 1012 ) ;
	  print ( 1023 ) ;
	  printint ( lastbadness ) ;
	  goto lab50 ;
	} 
      } 
    } 
    goto lab10 ;
  } 
  else {
      
    if ( totalshrink [4 ]!= 0 ) 
    o = 4 ;
    else if ( totalshrink [3 ]!= 0 ) 
    o = 3 ;
    else if ( totalshrink [2 ]!= 0 ) 
    o = 2 ;
    else if ( totalshrink [1 ]!= 0 ) 
    o = 1 ;
    else o = 0 ;
    mem [r + 5 ].hh.b1 = o ;
    mem [r + 5 ].hh.b0 = 2 ;
    if ( totalshrink [o ]!= 0 ) 
    mem [r + 6 ].gr = ( - (integer) x ) / ((double) totalshrink [o ]) ;
    else {
	
      mem [r + 5 ].hh.b0 = 0 ;
      mem [r + 6 ].gr = 0.0 ;
    } 
    if ( ( totalshrink [o ]< - (integer) x ) && ( o == 0 ) && ( mem [r + 5 
    ].hh .v.RH != -1073741823L ) ) 
    {
      lastbadness = 1000000L ;
      mem [r + 6 ].gr = 1.0 ;
      if ( ( - (integer) x - totalshrink [0 ]> eqtb [114966L ].cint ) || ( 
      eqtb [114388L ].cint < 100 ) ) 
      {
	println () ;
	printnl ( 1024 ) ;
	printscaled ( - (integer) x - totalshrink [0 ]) ;
	print ( 1025 ) ;
	goto lab50 ;
      } 
    } 
    else if ( o == 0 ) {
	
      if ( mem [r + 5 ].hh .v.RH != -1073741823L ) 
      {
	lastbadness = badness ( - (integer) x , totalshrink [0 ]) ;
	if ( lastbadness > eqtb [114388L ].cint ) 
	{
	  println () ;
	  printnl ( 1026 ) ;
	  printint ( lastbadness ) ;
	  goto lab50 ;
	} 
      } 
    } 
    goto lab10 ;
  } 
  lab50: if ( outputactive ) 
  print ( 1014 ) ;
  else {
      
    if ( packbeginline != 0 ) 
    {
      print ( 1016 ) ;
      printint ( abs ( packbeginline ) ) ;
      print ( 1017 ) ;
    } 
    else print ( 1018 ) ;
    printint ( line ) ;
    println () ;
  } 
  begindiagnostic () ;
  showbox ( r ) ;
  enddiagnostic ( true ) ;
  lab10: Result = r ;
  return Result ;
} 
void 
zappendtovlist ( halfword b ) 
{
  appendtovlist_regmem 
  scaled d  ;
  halfword p  ;
  if ( curlist .auxfield .cint > -65536000L ) 
  {
    d = mem [eqtb [49926L ].hh .v.RH + 1 ].cint - curlist .auxfield .cint 
    - mem [b + 3 ].cint ;
    if ( d < eqtb [114959L ].cint ) 
    p = newparamglue ( 0 ) ;
    else {
	
      p = newskipparam ( 1 ) ;
      mem [tempptr + 1 ].cint = d ;
    } 
    mem [curlist .tailfield ].hh .v.RH = p ;
    curlist .tailfield = p ;
  } 
  mem [curlist .tailfield ].hh .v.RH = b ;
  curlist .tailfield = b ;
  curlist .auxfield .cint = mem [b + 2 ].cint ;
} 
halfword 
newnoad ( void ) 
{
  register halfword Result; newnoad_regmem 
  halfword p  ;
  p = getnode ( 5 ) ;
  mem [p ].hh.b0 = 18 ;
  mem [p ].hh.b1 = 0 ;
  mem [p + 1 ].hh = emptyfield ;
  mem [p + 3 ].hh = emptyfield ;
  mem [p + 2 ].hh = emptyfield ;
  mem [p + 4 ].hh = emptyfield ;
  Result = p ;
  return Result ;
} 
halfword 
znewstyle ( smallnumber s ) 
{
  register halfword Result; newstyle_regmem 
  halfword p  ;
  p = getnode ( 3 ) ;
  mem [p ].hh.b0 = 16 ;
  mem [p ].hh.b1 = s ;
  mem [p + 1 ].cint = 0 ;
  mem [p + 2 ].cint = 0 ;
  Result = p ;
  return Result ;
} 
halfword 
newchoice ( void ) 
{
  register halfword Result; newchoice_regmem 
  halfword p  ;
  p = getnode ( 3 ) ;
  mem [p ].hh.b0 = 17 ;
  mem [p ].hh.b1 = 0 ;
  mem [p + 1 ].hh .v.LH = -1073741823L ;
  mem [p + 1 ].hh .v.RH = -1073741823L ;
  mem [p + 2 ].hh .v.LH = -1073741823L ;
  mem [p + 2 ].hh .v.RH = -1073741823L ;
  Result = p ;
  return Result ;
} 
void 
showinfo ( void ) 
{
  showinfo_regmem 
  shownodelist ( mem [tempptr ].hh .v.LH ) ;
} 
halfword 
zfractionrule ( scaled t ) 
{
  register halfword Result; fractionrule_regmem 
  halfword p  ;
  p = newrule () ;
  mem [p + 3 ].cint = t ;
  mem [p + 2 ].cint = 0 ;
  Result = p ;
  return Result ;
} 
halfword 
zoverbar ( halfword b , scaled k , scaled t ) 
{
  register halfword Result; overbar_regmem 
  halfword p, q  ;
  p = newkern ( k ) ;
  mem [p ].hh .v.RH = b ;
  q = fractionrule ( t ) ;
  mem [q ].hh .v.RH = p ;
  p = newkern ( t ) ;
  mem [p ].hh .v.RH = q ;
  Result = vpackage ( p , 0 , 1 , 1073741823L ) ;
  return Result ;
} 
halfword 
zcharbox ( internalfontnumber f , quarterword c ) 
{
  register halfword Result; charbox_regmem 
  fourquarters q  ;
  sixteenbits hd  ;
  halfword b, p  ;
  q = fontinfo [charbase [f ]+ effectivechar ( true , f , c ) ].qqqq ;
  hd = q .b1 ;
  b = newnullbox () ;
  mem [b + 1 ].cint = fontinfo [widthbase [f ]+ q .b0 ].cint + fontinfo 
  [italicbase [f ]+ ( q .b2 ) / 256 ].cint ;
  mem [b + 3 ].cint = fontinfo [heightbase [f ]+ ( hd ) / 256 ].cint ;
  mem [b + 2 ].cint = fontinfo [depthbase [f ]+ ( hd ) % 256 ].cint ;
  p = getavail () ;
  mem [p ].hh.b1 = c ;
  mem [p ].hh.b0 = f ;
  mem [b + 5 ].hh .v.RH = p ;
  Result = b ;
  return Result ;
} 
void 
zstackintobox ( halfword b , internalfontnumber f , quarterword c ) 
{
  stackintobox_regmem 
  halfword p  ;
  p = charbox ( f , c ) ;
  mem [p ].hh .v.RH = mem [b + 5 ].hh .v.RH ;
  mem [b + 5 ].hh .v.RH = p ;
  mem [b + 3 ].cint = mem [p + 3 ].cint ;
} 
scaled 
zheightplusdepth ( internalfontnumber f , quarterword c ) 
{
  register scaled Result; heightplusdepth_regmem 
  fourquarters q  ;
  sixteenbits hd  ;
  q = fontinfo [charbase [f ]+ effectivechar ( true , f , c ) ].qqqq ;
  hd = q .b1 ;
  Result = fontinfo [heightbase [f ]+ ( hd ) / 256 ].cint + fontinfo [
  depthbase [f ]+ ( hd ) % 256 ].cint ;
  return Result ;
} 
halfword 
zvardelimiter ( halfword d , integer s , scaled v ) 
{
  /* 40 22 */ register halfword Result; vardelimiter_regmem 
  halfword b  ;
  internalfontnumber f, g  ;
  quarterword c, x, y  ;
  integer m, n  ;
  scaled u  ;
  scaled w  ;
  fourquarters q  ;
  sixteenbits hd  ;
  fourquarters r  ;
  integer z  ;
  boolean largeattempt  ;
  f = 0 ;
  w = 0 ;
  largeattempt = false ;
  z = mem [d ].qqqq .b0 ;
  x = mem [d ].qqqq .b1 ;
  while ( true ) {
      
    if ( ( z != 0 ) || ( x != 0 ) ) 
    {
      z = z + s + 256 ;
      do {
	  z = z - 256 ;
	g = eqtb [50986L + z ].hh .v.RH ;
	if ( g != 0 ) 
	{
	  y = x ;
	  if ( ( y >= fontbc [g ]) && ( y <= fontec [g ]) ) 
	  {
	    lab22: q = fontinfo [charbase [g ]+ y ].qqqq ;
	    if ( ( q .b0 > 0 ) ) 
	    {
	      if ( ( ( q .b2 ) % 4 ) == 3 ) 
	      {
		f = g ;
		c = y ;
		goto lab40 ;
	      } 
	      hd = q .b1 ;
	      u = fontinfo [heightbase [g ]+ ( hd ) / 256 ].cint + 
	      fontinfo [depthbase [g ]+ ( hd ) % 256 ].cint ;
	      if ( u > w ) 
	      {
		f = g ;
		c = y ;
		w = u ;
		if ( u >= v ) 
		goto lab40 ;
	      } 
	      if ( ( ( q .b2 ) % 4 ) == 2 ) 
	      {
		y = q .b3 ;
		goto lab22 ;
	      } 
	    } 
	  } 
	} 
      } while ( ! ( z < 256 ) ) ;
    } 
    if ( largeattempt ) 
    goto lab40 ;
    largeattempt = true ;
    z = mem [d ].qqqq .b2 ;
    x = mem [d ].qqqq .b3 ;
  } 
  lab40: if ( f != 0 ) {
      
    if ( ( ( q .b2 ) % 4 ) == 3 ) 
    {
      b = newnullbox () ;
      mem [b ].hh.b0 = 1 ;
      r = fontinfo [extenbase [f ]+ q .b3 ].qqqq ;
      c = r .b3 ;
      u = heightplusdepth ( f , c ) ;
      w = 0 ;
      q = fontinfo [charbase [f ]+ effectivechar ( true , f , c ) ].qqqq ;
      mem [b + 1 ].cint = fontinfo [widthbase [f ]+ q .b0 ].cint + 
      fontinfo [italicbase [f ]+ ( q .b2 ) / 256 ].cint ;
      c = r .b2 ;
      if ( c != 0 ) 
      w = w + heightplusdepth ( f , c ) ;
      c = r .b1 ;
      if ( c != 0 ) 
      w = w + heightplusdepth ( f , c ) ;
      c = r .b0 ;
      if ( c != 0 ) 
      w = w + heightplusdepth ( f , c ) ;
      n = 0 ;
      if ( u > 0 ) 
      while ( w < v ) {
	  
	w = w + u ;
	incr ( n ) ;
	if ( r .b1 != 0 ) 
	w = w + u ;
      } 
      c = r .b2 ;
      if ( c != 0 ) 
      stackintobox ( b , f , c ) ;
      c = r .b3 ;
      {register integer for_end; m = 1 ;for_end = n ; if ( m <= for_end) do 
	stackintobox ( b , f , c ) ;
      while ( m++ < for_end ) ;} 
      c = r .b1 ;
      if ( c != 0 ) 
      {
	stackintobox ( b , f , c ) ;
	c = r .b3 ;
	{register integer for_end; m = 1 ;for_end = n ; if ( m <= for_end) 
	do 
	  stackintobox ( b , f , c ) ;
	while ( m++ < for_end ) ;} 
      } 
      c = r .b0 ;
      if ( c != 0 ) 
      stackintobox ( b , f , c ) ;
      mem [b + 2 ].cint = w - mem [b + 3 ].cint ;
    } 
    else b = charbox ( f , c ) ;
  } 
  else {
      
    b = newnullbox () ;
    mem [b + 1 ].cint = eqtb [114968L ].cint ;
  } 
  mem [b + 4 ].cint = half ( mem [b + 3 ].cint - mem [b + 2 ].cint ) - 
  fontinfo [22 + parambase [eqtb [50988L + s ].hh .v.RH ]].cint ;
  Result = b ;
  return Result ;
} 
halfword 
zrebox ( halfword b , scaled w ) 
{
  register halfword Result; rebox_regmem 
  halfword p  ;
  internalfontnumber f  ;
  scaled v  ;
  if ( ( mem [b + 1 ].cint != w ) && ( mem [b + 5 ].hh .v.RH != 
  -1073741823L ) ) 
  {
    if ( mem [b ].hh.b0 != 0 ) 
    b = hpack ( b , 0 , 1 ) ;
    p = mem [b + 5 ].hh .v.RH ;
    if ( ( p >= himemmin ) ) {
	
      if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
      {
	if ( mem [mem [p ].hh .v.RH ].hh .v.RH == -1073741823L ) 
	{
	  f = mem [p ].hh.b0 ;
	  v = fontinfo [widthbase [f ]+ fontinfo [charbase [f ]+ mem [p 
	  ].hh.b1 ].qqqq .b0 ].cint ;
	  if ( v != mem [b + 1 ].cint ) 
	  mem [mem [p ].hh .v.RH ].hh .v.RH = newkern ( mem [b + 1 ]
	  .cint - v ) ;
	} 
      } 
      else if ( mem [p ].hh .v.RH == -1073741823L ) 
      {
	f = mem [p ].hh.b0 ;
	v = fontinfo [widthbase [f ]+ fontinfo [charbase [f ]+ mem [p ]
	.hh.b1 ].qqqq .b0 ].cint ;
	if ( v != mem [b + 1 ].cint ) 
	mem [p ].hh .v.RH = newkern ( mem [b + 1 ].cint - v ) ;
      } 
    } 
    deleteglueref ( mem [b + 7 ].hh .v.RH ) ;
    deleteglueref ( mem [b + 7 ].hh .v.LH ) ;
    freenode ( b , 10 ) ;
    b = newglue ( membot + 16 ) ;
    mem [b ].hh .v.RH = p ;
    while ( mem [p ].hh .v.RH != -1073741823L ) p = mem [p ].hh .v.RH ;
    mem [p ].hh .v.RH = newglue ( membot + 16 ) ;
    Result = hpack ( b , w , 0 ) ;
  } 
  else {
      
    mem [b + 1 ].cint = w ;
    Result = b ;
  } 
  return Result ;
} 
halfword 
zmathglue ( halfword g , scaled m ) 
{
  register halfword Result; mathglue_regmem 
  halfword p  ;
  integer n  ;
  scaled f  ;
  n = xovern ( m , 65536L ) ;
  f = texremainder ;
  if ( f < 0 ) 
  {
    decr ( n ) ;
    f = f + 65536L ;
  } 
  p = getnode ( 4 ) ;
  mem [p + 1 ].cint = multandadd ( n , mem [g + 1 ].cint , xnoverd ( mem [
  g + 1 ].cint , f , 65536L ) , 1073741823L ) ;
  mem [p ].hh.b0 = mem [g ].hh.b0 ;
  if ( mem [p ].hh.b0 == 0 ) 
  mem [p + 2 ].cint = multandadd ( n , mem [g + 2 ].cint , xnoverd ( mem [
  g + 2 ].cint , f , 65536L ) , 1073741823L ) ;
  else mem [p + 2 ].cint = mem [g + 2 ].cint ;
  mem [p ].hh.b1 = mem [g ].hh.b1 ;
  if ( mem [p ].hh.b1 == 0 ) 
  mem [p + 3 ].cint = multandadd ( n , mem [g + 3 ].cint , xnoverd ( mem [
  g + 3 ].cint , f , 65536L ) , 1073741823L ) ;
  else mem [p + 3 ].cint = mem [g + 3 ].cint ;
  Result = p ;
  return Result ;
} 
void 
zmathkern ( halfword p , scaled m ) 
{
  mathkern_regmem 
  integer n  ;
  scaled f  ;
  if ( mem [p ].hh.b1 == 99 ) 
  {
    n = xovern ( m , 65536L ) ;
    f = texremainder ;
    if ( f < 0 ) 
    {
      decr ( n ) ;
      f = f + 65536L ;
    } 
    mem [p + 1 ].cint = multandadd ( n , mem [p + 1 ].cint , xnoverd ( mem 
    [p + 1 ].cint , f , 65536L ) , 1073741823L ) ;
    mem [p ].hh.b1 = 1 ;
  } 
} 
void 
flushmath ( void ) 
{
  flushmath_regmem 
  flushnodelist ( mem [curlist .headfield ].hh .v.RH ) ;
  flushnodelist ( curlist .auxfield .cint ) ;
  mem [curlist .headfield ].hh .v.RH = -1073741823L ;
  curlist .tailfield = curlist .headfield ;
  curlist .auxfield .cint = -1073741823L ;
} 
halfword 
zshiftsubexpbox ( halfword q ) 
{
  register halfword Result; shiftsubexpbox_regmem 
  halfword d  ;
  if ( abs ( curlist .dirfield ) == abs ( ( ( mem [mem [q ].hh .v.LH ]
  .hh.b1 ) % 16 - 5 ) ) ) 
  {
    if ( abs ( curlist .dirfield ) == 3 ) 
    {
      if ( ( ( mem [mem [q ].hh .v.LH ].hh.b1 ) % 16 - 5 ) == 3 ) 
      d = eqtb [114978L ].cint ;
      else d = eqtb [114979L ].cint ;
    } 
    else d = eqtb [114979L ].cint ;
    if ( curstyle < 4 ) 
    d = xnoverd ( d , eqtb [114418L ].cint , 1000 ) ;
    else if ( curstyle < 6 ) 
    d = xnoverd ( d , eqtb [114419L ].cint , 1000 ) ;
    else d = xnoverd ( d , eqtb [114420L ].cint , 1000 ) ;
    mem [mem [q ].hh .v.LH + 4 ].cint = mem [mem [q ].hh .v.LH + 4 ]
    .cint - d ;
  } 
  mem [q ].hh .v.RH = 2 ;
  Result = mem [q ].hh .v.LH ;
  return Result ;
} 
halfword 
zcleanbox ( halfword p , smallnumber s , halfword jc ) 
{
  /* 40 */ register halfword Result; cleanbox_regmem 
  halfword q  ;
  smallnumber savestyle  ;
  halfword x  ;
  halfword r  ;
  switch ( mem [p ].hh .v.RH ) 
  {case 1 : 
    {
      curmlist = newnoad () ;
      mem [curmlist + 1 ]= mem [p ];
    } 
    break ;
  case 6 : 
    {
      curmlist = newnoad () ;
      mem [curmlist + 1 ]= mem [p ];
      mem [curmlist + 4 ].hh .v.LH = jc ;
    } 
    break ;
  case 2 : 
    {
      q = mem [p ].hh .v.LH ;
      goto lab40 ;
    } 
    break ;
  case 3 : 
    {
      q = shiftsubexpbox ( p ) ;
      goto lab40 ;
    } 
    break ;
  case 4 : 
    curmlist = mem [p ].hh .v.LH ;
    break ;
    default: 
    {
      q = newnullbox () ;
      goto lab40 ;
    } 
    break ;
  } 
  savestyle = curstyle ;
  curstyle = s ;
  mlistpenalties = false ;
  mlisttohlist () ;
  q = mem [memtop - 3 ].hh .v.RH ;
  curstyle = savestyle ;
  {
    if ( curstyle < 4 ) 
    cursize = 0 ;
    else cursize = 256 * ( ( curstyle - 2 ) / 2 ) ;
    curmu = xovern ( fontinfo [6 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint , 18 ) ;
  } 
  lab40: if ( ( q >= himemmin ) || ( q == -1073741823L ) ) 
  x = hpack ( q , 0 , 1 ) ;
  else if ( ( mem [q ].hh .v.RH == -1073741823L ) && ( mem [q ].hh.b0 <= 2 
  ) && ( mem [q + 4 ].cint == 0 ) ) 
  x = q ;
  else x = hpack ( q , 0 , 1 ) ;
  q = mem [x + 5 ].hh .v.RH ;
  if ( ( q >= himemmin ) ) 
  {
    if ( fontdir [mem [q ].hh.b0 ]!= 0 ) 
    q = mem [q ].hh .v.RH ;
    r = mem [q ].hh .v.RH ;
    if ( r != -1073741823L ) {
	
      if ( mem [r ].hh .v.RH == -1073741823L ) {
	  
	if ( ! ( r >= himemmin ) ) {
	    
	  if ( mem [r ].hh.b0 == 13 ) 
	  {
	    freenode ( r , 4 ) ;
	    mem [q ].hh .v.RH = -1073741823L ;
	  } 
	} 
      } 
    } 
  } 
  Result = x ;
  return Result ;
} 
void 
zfetch ( halfword a ) 
{
  fetch_regmem 
  curc = mem [a ].hh.b1 ;
  curf = eqtb [50986L + mem [a ].hh.b0 + cursize ].hh .v.RH ;
  if ( curf == 0 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 349 ) ;
    } 
    printsize ( cursize ) ;
    printchar ( 32 ) ;
    printint ( mem [a ].hh.b0 ) ;
    print ( 1052 ) ;
    print ( curc ) ;
    printchar ( 41 ) ;
    {
      helpptr = 4 ;
      helpline [3 ]= 1053 ;
      helpline [2 ]= 1054 ;
      helpline [1 ]= 1055 ;
      helpline [0 ]= 1056 ;
    } 
    error () ;
    curi = nullcharacter ;
    mem [a ].hh .v.RH = 0 ;
  } 
  else {
      
    if ( fontdir [curf ]!= 0 ) 
    curc = getjfmpos ( mem [a + 3 ].hh .v.LH , curf ) ;
    if ( ( curc >= fontbc [curf ]) && ( curc <= fontec [curf ]) ) 
    curi = fontinfo [charbase [curf ]+ curc ].qqqq ;
    else curi = nullcharacter ;
    if ( ! ( ( curi .b0 > 0 ) ) ) 
    {
      charwarning ( curf , curc ) ;
      mem [a ].hh .v.RH = 0 ;
      curi = nullcharacter ;
    } 
  } 
} 
void 
zmakeover ( halfword q ) 
{
  makeover_regmem 
  mem [q + 1 ].hh .v.LH = overbar ( cleanbox ( q + 1 , 2 * ( curstyle / 2 ) 
  + 1 , mem [q + 4 ].hh .v.LH ) , 3 * fontinfo [8 + parambase [eqtb [
  50989L + cursize ].hh .v.RH ]].cint , fontinfo [8 + parambase [eqtb [
  50989L + cursize ].hh .v.RH ]].cint ) ;
  mem [q + 1 ].hh .v.RH = 2 ;
} 
void 
zmakeunder ( halfword q ) 
{
  makeunder_regmem 
  halfword p, x, y  ;
  scaled delta  ;
  x = cleanbox ( q + 1 , curstyle , mem [q + 4 ].hh .v.LH ) ;
  p = newkern ( 3 * fontinfo [8 + parambase [eqtb [50989L + cursize ].hh 
  .v.RH ]].cint ) ;
  mem [x ].hh .v.RH = p ;
  mem [p ].hh .v.RH = fractionrule ( fontinfo [8 + parambase [eqtb [
  50989L + cursize ].hh .v.RH ]].cint ) ;
  y = vpackage ( x , 0 , 1 , 1073741823L ) ;
  delta = mem [y + 3 ].cint + mem [y + 2 ].cint + fontinfo [8 + parambase 
  [eqtb [50989L + cursize ].hh .v.RH ]].cint ;
  mem [y + 3 ].cint = mem [x + 3 ].cint ;
  mem [y + 2 ].cint = delta - mem [y + 3 ].cint ;
  mem [q + 1 ].hh .v.LH = y ;
  mem [q + 1 ].hh .v.RH = 2 ;
} 
void 
zmakevcenter ( halfword q ) 
{
  makevcenter_regmem 
  halfword v  ;
  scaled delta  ;
  v = mem [q + 1 ].hh .v.LH ;
  if ( mem [v ].hh.b0 == 2 ) 
  {
    if ( mem [mem [v + 5 ].hh .v.RH ].hh.b0 != 1 ) 
    confusion ( 1058 ) ;
  } 
  else {
      
    if ( mem [v ].hh.b0 != 1 ) 
    confusion ( 611 ) ;
  } 
  delta = mem [v + 3 ].cint + mem [v + 2 ].cint ;
  mem [v + 3 ].cint = fontinfo [22 + parambase [eqtb [50988L + cursize ]
  .hh .v.RH ]].cint + half ( delta ) ;
  mem [v + 2 ].cint = delta - mem [v + 3 ].cint ;
} 
void 
zmakeradical ( halfword q ) 
{
  makeradical_regmem 
  halfword x, y  ;
  scaled delta, clr  ;
  x = cleanbox ( q + 1 , 2 * ( curstyle / 2 ) + 1 , mem [q + 4 ].hh .v.LH ) 
  ;
  if ( curstyle < 2 ) 
  clr = fontinfo [8 + parambase [eqtb [50989L + cursize ].hh .v.RH ]]
  .cint + ( abs ( fontinfo [5 + parambase [eqtb [50988L + cursize ].hh 
  .v.RH ]].cint ) / 4 ) ;
  else {
      
    clr = fontinfo [8 + parambase [eqtb [50989L + cursize ].hh .v.RH ]]
    .cint ;
    clr = clr + ( abs ( clr ) / 4 ) ;
  } 
  y = vardelimiter ( q + 5 , cursize , mem [x + 3 ].cint + mem [x + 2 ]
  .cint + clr + fontinfo [8 + parambase [eqtb [50989L + cursize ].hh .v.RH 
  ]].cint ) ;
  delta = mem [y + 2 ].cint - ( mem [x + 3 ].cint + mem [x + 2 ].cint + 
  clr ) ;
  if ( delta > 0 ) 
  clr = clr + half ( delta ) ;
  mem [y + 4 ].cint = - (integer) ( mem [x + 3 ].cint + clr ) ;
  mem [y ].hh .v.RH = overbar ( x , clr , mem [y + 3 ].cint ) ;
  mem [q + 1 ].hh .v.LH = hpack ( y , 0 , 1 ) ;
  mem [q + 1 ].hh .v.RH = 2 ;
} 
void 
zmakemathaccent ( halfword q ) 
{
  /* 30 31 */ makemathaccent_regmem 
  halfword p, x, y  ;
  integer a  ;
  quarterword c  ;
  internalfontnumber f  ;
  fourquarters i  ;
  scaled s  ;
  scaled h  ;
  scaled delta  ;
  scaled w  ;
  fetch ( q + 5 ) ;
  if ( ( curi .b0 > 0 ) ) 
  {
    i = curi ;
    c = curc ;
    f = curf ;
    s = 0 ;
    if ( mem [q + 1 ].hh .v.RH == 1 ) 
    {
      fetch ( q + 1 ) ;
      if ( ( ( curi .b2 ) % 4 ) == 1 ) 
      {
	a = ligkernbase [curf ]+ curi .b3 ;
	curi = fontinfo [a ].qqqq ;
	if ( curi .b0 > 128 ) 
	{
	  a = ligkernbase [curf ]+ 256 * curi .b2 + curi .b3 + 32768L - 256 
	  * ( 128 ) ;
	  curi = fontinfo [a ].qqqq ;
	} 
	while ( true ) {
	    
	  if ( curi .b1 == skewchar [curf ]) 
	  {
	    if ( curi .b2 >= 128 ) {
		
	      if ( curi .b0 <= 128 ) 
	      s = fontinfo [kernbase [curf ]+ 256 * curi .b2 + curi .b3 ]
	      .cint ;
	    } 
	    goto lab31 ;
	  } 
	  if ( curi .b0 >= 128 ) 
	  goto lab31 ;
	  a = a + curi .b0 + 1 ;
	  curi = fontinfo [a ].qqqq ;
	} 
      } 
    } 
    lab31: ;
    x = cleanbox ( q + 1 , 2 * ( curstyle / 2 ) + 1 , mem [q + 4 ].hh .v.LH 
    ) ;
    w = mem [x + 1 ].cint ;
    h = mem [x + 3 ].cint ;
    while ( true ) {
	
      if ( ( ( i .b2 ) % 4 ) != 2 ) 
      goto lab30 ;
      y = i .b3 ;
      i = fontinfo [charbase [f ]+ y ].qqqq ;
      if ( ! ( i .b0 > 0 ) ) 
      goto lab30 ;
      if ( fontinfo [widthbase [f ]+ i .b0 ].cint > w ) 
      goto lab30 ;
      c = y ;
    } 
    lab30: ;
    if ( h < fontinfo [5 + parambase [f ]].cint ) 
    delta = h ;
    else delta = fontinfo [5 + parambase [f ]].cint ;
    if ( ( mem [q + 2 ].hh .v.RH != 0 ) || ( mem [q + 3 ].hh .v.RH != 0 ) 
    ) {
	
      if ( mem [q + 1 ].hh .v.RH == 1 ) 
      {
	flushnodelist ( x ) ;
	x = newnoad () ;
	mem [x + 1 ]= mem [q + 1 ];
	mem [x + 2 ]= mem [q + 2 ];
	mem [x + 3 ]= mem [q + 3 ];
	mem [q + 2 ].hh = emptyfield ;
	mem [q + 3 ].hh = emptyfield ;
	mem [q + 1 ].hh .v.RH = 4 ;
	mem [q + 1 ].hh .v.LH = x ;
	x = cleanbox ( q + 1 , curstyle , mem [q + 4 ].hh .v.LH ) ;
	delta = delta + mem [x + 3 ].cint - h ;
	h = mem [x + 3 ].cint ;
      } 
    } 
    y = charbox ( f , c ) ;
    mem [y + 4 ].cint = s + half ( w - mem [y + 1 ].cint ) ;
    mem [y + 1 ].cint = 0 ;
    p = newkern ( - (integer) delta ) ;
    mem [p ].hh .v.RH = x ;
    mem [y ].hh .v.RH = p ;
    y = vpackage ( y , 0 , 1 , 1073741823L ) ;
    mem [y + 1 ].cint = mem [x + 1 ].cint ;
    if ( mem [y + 3 ].cint < h ) 
    {
      p = newkern ( h - mem [y + 3 ].cint ) ;
      mem [p ].hh .v.RH = mem [y + 5 ].hh .v.RH ;
      mem [y + 5 ].hh .v.RH = p ;
      mem [y + 3 ].cint = h ;
    } 
    mem [q + 1 ].hh .v.LH = y ;
    mem [q + 1 ].hh .v.RH = 2 ;
  } 
} 
void 
zmakefraction ( halfword q ) 
{
  makefraction_regmem 
  halfword p, v, x, y, z  ;
  scaled delta, delta1, delta2, shiftup, shiftdown, clr  ;
  if ( mem [q + 1 ].cint == 1073741824L ) 
  mem [q + 1 ].cint = fontinfo [8 + parambase [eqtb [50989L + cursize ]
  .hh .v.RH ]].cint ;
  x = cleanbox ( q + 2 , curstyle + 2 - 2 * ( curstyle / 6 ) , mem [q + 4 ]
  .hh .v.LH ) ;
  z = cleanbox ( q + 3 , 2 * ( curstyle / 2 ) + 3 - 2 * ( curstyle / 6 ) , mem 
  [q + 4 ].hh .v.LH ) ;
  if ( mem [x + 1 ].cint < mem [z + 1 ].cint ) 
  x = rebox ( x , mem [z + 1 ].cint ) ;
  else z = rebox ( z , mem [x + 1 ].cint ) ;
  if ( curstyle < 2 ) 
  {
    shiftup = fontinfo [8 + parambase [eqtb [50988L + cursize ].hh .v.RH ]
    ].cint ;
    shiftdown = fontinfo [11 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint ;
  } 
  else {
      
    shiftdown = fontinfo [12 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint ;
    if ( mem [q + 1 ].cint != 0 ) 
    shiftup = fontinfo [9 + parambase [eqtb [50988L + cursize ].hh .v.RH ]
    ].cint ;
    else shiftup = fontinfo [10 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint ;
  } 
  if ( mem [q + 1 ].cint == 0 ) 
  {
    if ( curstyle < 2 ) 
    clr = 7 * fontinfo [8 + parambase [eqtb [50989L + cursize ].hh .v.RH ]
    ].cint ;
    else clr = 3 * fontinfo [8 + parambase [eqtb [50989L + cursize ].hh 
    .v.RH ]].cint ;
    delta = half ( clr - ( ( shiftup - mem [x + 2 ].cint ) - ( mem [z + 3 ]
    .cint - shiftdown ) ) ) ;
    if ( delta > 0 ) 
    {
      shiftup = shiftup + delta ;
      shiftdown = shiftdown + delta ;
    } 
  } 
  else {
      
    if ( curstyle < 2 ) 
    clr = 3 * mem [q + 1 ].cint ;
    else clr = mem [q + 1 ].cint ;
    delta = half ( mem [q + 1 ].cint ) ;
    delta1 = clr - ( ( shiftup - mem [x + 2 ].cint ) - ( fontinfo [22 + 
    parambase [eqtb [50988L + cursize ].hh .v.RH ]].cint + delta ) ) ;
    delta2 = clr - ( ( fontinfo [22 + parambase [eqtb [50988L + cursize ]
    .hh .v.RH ]].cint - delta ) - ( mem [z + 3 ].cint - shiftdown ) ) ;
    if ( delta1 > 0 ) 
    shiftup = shiftup + delta1 ;
    if ( delta2 > 0 ) 
    shiftdown = shiftdown + delta2 ;
  } 
  v = newnullbox () ;
  mem [v ].hh.b0 = 1 ;
  mem [v + 3 ].cint = shiftup + mem [x + 3 ].cint ;
  mem [v + 2 ].cint = mem [z + 2 ].cint + shiftdown ;
  mem [v + 1 ].cint = mem [x + 1 ].cint ;
  if ( mem [q + 1 ].cint == 0 ) 
  {
    p = newkern ( ( shiftup - mem [x + 2 ].cint ) - ( mem [z + 3 ].cint - 
    shiftdown ) ) ;
    mem [p ].hh .v.RH = z ;
  } 
  else {
      
    y = fractionrule ( mem [q + 1 ].cint ) ;
    p = newkern ( ( fontinfo [22 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint - delta ) - ( mem [z + 3 ].cint - shiftdown ) ) ;
    mem [y ].hh .v.RH = p ;
    mem [p ].hh .v.RH = z ;
    p = newkern ( ( shiftup - mem [x + 2 ].cint ) - ( fontinfo [22 + 
    parambase [eqtb [50988L + cursize ].hh .v.RH ]].cint + delta ) ) ;
    mem [p ].hh .v.RH = y ;
  } 
  mem [x ].hh .v.RH = p ;
  mem [v + 5 ].hh .v.RH = x ;
  if ( curstyle < 2 ) 
  delta = fontinfo [20 + parambase [eqtb [50988L + cursize ].hh .v.RH ]]
  .cint ;
  else delta = fontinfo [21 + parambase [eqtb [50988L + cursize ].hh .v.RH 
  ]].cint ;
  x = vardelimiter ( q + 5 , cursize , delta ) ;
  mem [x ].hh .v.RH = v ;
  z = vardelimiter ( q + 4 , cursize , delta ) ;
  mem [v ].hh .v.RH = z ;
  mem [q + 1 ].cint = hpack ( x , 0 , 1 ) ;
} 
scaled 
zmakeop ( halfword q ) 
{
  register scaled Result; makeop_regmem 
  scaled delta  ;
  halfword p, v, x, y, z  ;
  quarterword c  ;
  fourquarters i  ;
  scaled shiftup, shiftdown  ;
  if ( ( mem [q ].hh.b1 == 0 ) && ( curstyle < 2 ) ) 
  mem [q ].hh.b1 = 1 ;
  if ( mem [q + 1 ].hh .v.RH == 1 ) 
  {
    fetch ( q + 1 ) ;
    if ( ( curstyle < 2 ) && ( ( ( curi .b2 ) % 4 ) == 2 ) ) 
    {
      c = curi .b3 ;
      i = fontinfo [charbase [curf ]+ c ].qqqq ;
      if ( ( i .b0 > 0 ) ) 
      {
	curc = c ;
	curi = i ;
	mem [q + 1 ].hh.b1 = c ;
      } 
    } 
    delta = fontinfo [italicbase [curf ]+ ( curi .b2 ) / 256 ].cint ;
    x = cleanbox ( q + 1 , curstyle , mem [q + 4 ].hh .v.LH ) ;
    if ( ( mem [q + 3 ].hh .v.RH != 0 ) && ( mem [q ].hh.b1 != 1 ) ) 
    mem [x + 1 ].cint = mem [x + 1 ].cint - delta ;
    mem [x + 4 ].cint = half ( mem [x + 3 ].cint - mem [x + 2 ].cint ) - 
    fontinfo [22 + parambase [eqtb [50988L + cursize ].hh .v.RH ]].cint 
    ;
    mem [q + 1 ].hh .v.RH = 2 ;
    mem [q + 1 ].hh .v.LH = x ;
  } 
  else delta = 0 ;
  if ( mem [q ].hh.b1 == 1 ) 
  {
    x = cleanbox ( q + 2 , 2 * ( curstyle / 4 ) + 4 + ( curstyle % 2 ) , mem [
    q + 4 ].hh .v.LH ) ;
    y = cleanbox ( q + 1 , curstyle , mem [q + 4 ].hh .v.LH ) ;
    z = cleanbox ( q + 3 , 2 * ( curstyle / 4 ) + 5 , mem [q + 4 ].hh .v.LH 
    ) ;
    v = newnullbox () ;
    mem [v ].hh.b0 = 1 ;
    mem [v + 1 ].cint = mem [y + 1 ].cint ;
    if ( mem [x + 1 ].cint > mem [v + 1 ].cint ) 
    mem [v + 1 ].cint = mem [x + 1 ].cint ;
    if ( mem [z + 1 ].cint > mem [v + 1 ].cint ) 
    mem [v + 1 ].cint = mem [z + 1 ].cint ;
    x = rebox ( x , mem [v + 1 ].cint ) ;
    y = rebox ( y , mem [v + 1 ].cint ) ;
    z = rebox ( z , mem [v + 1 ].cint ) ;
    mem [x + 4 ].cint = half ( delta ) ;
    mem [z + 4 ].cint = - (integer) mem [x + 4 ].cint ;
    mem [v + 3 ].cint = mem [y + 3 ].cint ;
    mem [v + 2 ].cint = mem [y + 2 ].cint ;
    if ( mem [q + 2 ].hh .v.RH == 0 ) 
    {
      deleteglueref ( mem [x + 7 ].hh .v.RH ) ;
      deleteglueref ( mem [x + 7 ].hh .v.LH ) ;
      freenode ( x , 10 ) ;
      mem [v + 5 ].hh .v.RH = y ;
    } 
    else {
	
      shiftup = fontinfo [11 + parambase [eqtb [50989L + cursize ].hh 
      .v.RH ]].cint - mem [x + 2 ].cint ;
      if ( shiftup < fontinfo [9 + parambase [eqtb [50989L + cursize ].hh 
      .v.RH ]].cint ) 
      shiftup = fontinfo [9 + parambase [eqtb [50989L + cursize ].hh .v.RH 
      ]].cint ;
      p = newkern ( shiftup ) ;
      mem [p ].hh .v.RH = y ;
      mem [x ].hh .v.RH = p ;
      p = newkern ( fontinfo [13 + parambase [eqtb [50989L + cursize ].hh 
      .v.RH ]].cint ) ;
      mem [p ].hh .v.RH = x ;
      mem [v + 5 ].hh .v.RH = p ;
      mem [v + 3 ].cint = mem [v + 3 ].cint + fontinfo [13 + parambase [
      eqtb [50989L + cursize ].hh .v.RH ]].cint + mem [x + 3 ].cint + 
      mem [x + 2 ].cint + shiftup ;
    } 
    if ( mem [q + 3 ].hh .v.RH == 0 ) 
    {
      deleteglueref ( mem [z + 7 ].hh .v.RH ) ;
      deleteglueref ( mem [z + 7 ].hh .v.LH ) ;
      freenode ( z , 10 ) ;
    } 
    else {
	
      shiftdown = fontinfo [12 + parambase [eqtb [50989L + cursize ].hh 
      .v.RH ]].cint - mem [z + 3 ].cint ;
      if ( shiftdown < fontinfo [10 + parambase [eqtb [50989L + cursize ]
      .hh .v.RH ]].cint ) 
      shiftdown = fontinfo [10 + parambase [eqtb [50989L + cursize ].hh 
      .v.RH ]].cint ;
      p = newkern ( shiftdown ) ;
      mem [y ].hh .v.RH = p ;
      mem [p ].hh .v.RH = z ;
      p = newkern ( fontinfo [13 + parambase [eqtb [50989L + cursize ].hh 
      .v.RH ]].cint ) ;
      mem [z ].hh .v.RH = p ;
      mem [v + 2 ].cint = mem [v + 2 ].cint + fontinfo [13 + parambase [
      eqtb [50989L + cursize ].hh .v.RH ]].cint + mem [z + 3 ].cint + 
      mem [z + 2 ].cint + shiftdown ;
    } 
    mem [q + 1 ].cint = v ;
  } 
  Result = delta ;
  return Result ;
} 
void 
zmakeord ( halfword q ) 
{
  /* 20 10 */ makeord_regmem 
  integer a  ;
  halfword gp, gq, p, r  ;
  halfword rr  ;
  lab20: if ( ( mem [q + 3 ].hh .v.RH == 0 ) && ( mem [q + 2 ].hh .v.RH == 
  0 ) && ( ( mem [q + 1 ].hh .v.RH == 1 ) || ( mem [q + 1 ].hh .v.RH == 6 
  ) ) ) 
  {
    p = mem [q ].hh .v.RH ;
    if ( p != -1073741823L ) {
	
      if ( ( mem [p ].hh.b0 >= 18 ) && ( mem [p ].hh.b0 <= 24 ) ) {
	  
	if ( mem [p + 1 ].hh.b0 == mem [q + 1 ].hh.b0 ) {
	    
	  if ( mem [p + 1 ].hh .v.RH == 1 ) 
	  {
	    mem [q + 1 ].hh .v.RH = 5 ;
	    fetch ( q + 1 ) ;
	    if ( ( ( curi .b2 ) % 4 ) == 1 ) 
	    {
	      a = ligkernbase [curf ]+ curi .b3 ;
	      curc = mem [p + 1 ].hh.b1 ;
	      curi = fontinfo [a ].qqqq ;
	      if ( curi .b0 > 128 ) 
	      {
		a = ligkernbase [curf ]+ 256 * curi .b2 + curi .b3 + 32768L 
		- 256 * ( 128 ) ;
		curi = fontinfo [a ].qqqq ;
	      } 
	      while ( true ) {
		  
		if ( curi .b1 == curc ) {
		    
		  if ( curi .b0 <= 128 ) {
		      
		    if ( curi .b2 >= 128 ) 
		    {
		      p = newkern ( fontinfo [kernbase [curf ]+ 256 * curi 
		      .b2 + curi .b3 ].cint ) ;
		      mem [p ].hh .v.RH = mem [q ].hh .v.RH ;
		      mem [q ].hh .v.RH = p ;
		      return ;
		    } 
		    else {
			
		      {
			if ( interrupt != 0 ) 
			pauseforinstructions () ;
		      } 
		      switch ( curi .b2 ) 
		      {case 1 : 
		      case 5 : 
			mem [q + 1 ].hh.b1 = curi .b3 ;
			break ;
		      case 2 : 
		      case 6 : 
			mem [p + 1 ].hh.b1 = curi .b3 ;
			break ;
		      case 3 : 
		      case 7 : 
		      case 11 : 
			{
			  r = newnoad () ;
			  mem [r + 1 ].hh.b1 = curi .b3 ;
			  mem [r + 1 ].hh.b0 = mem [q + 1 ].hh.b0 ;
			  mem [q ].hh .v.RH = r ;
			  mem [r ].hh .v.RH = p ;
			  if ( curi .b2 < 11 ) 
			  mem [r + 1 ].hh .v.RH = 1 ;
			  else mem [r + 1 ].hh .v.RH = 5 ;
			} 
			break ;
			default: 
			{
			  mem [q ].hh .v.RH = mem [p ].hh .v.RH ;
			  mem [q + 1 ].hh.b1 = curi .b3 ;
			  mem [q + 3 ]= mem [p + 3 ];
			  mem [q + 2 ]= mem [p + 2 ];
			  freenode ( p , 5 ) ;
			} 
			break ;
		      } 
		      if ( curi .b2 > 3 ) 
		      return ;
		      mem [q + 1 ].hh .v.RH = 1 ;
		      goto lab20 ;
		    } 
		  } 
		} 
		if ( curi .b0 >= 128 ) 
		return ;
		a = a + curi .b0 + 1 ;
		curi = fontinfo [a ].qqqq ;
	      } 
	    } 
	  } 
	  else if ( mem [p + 1 ].hh .v.RH == 6 ) 
	  {
	    mem [q + 1 ].hh .v.RH = 7 ;
	    fetch ( p + 1 ) ;
	    a = curc ;
	    fetch ( q + 1 ) ;
	    if ( ( ( curi .b2 ) % 4 ) == 1 ) 
	    {
	      curc = a ;
	      a = ligkernbase [curf ]+ curi .b3 ;
	      curi = fontinfo [a ].qqqq ;
	      if ( curi .b0 > 128 ) 
	      {
		a = ligkernbase [curf ]+ 256 * curi .b2 + curi .b3 + 32768L 
		- 256 * ( 128 ) ;
		curi = fontinfo [a ].qqqq ;
	      } 
	      while ( true ) {
		  
		if ( curi .b1 == curc ) {
		    
		  if ( curi .b0 <= 128 ) {
		      
		    if ( curi .b2 < 128 ) 
		    {
		      gp = fontglue [curf ];
		      rr = curi .b2 * 256 + curi .b3 ;
		      if ( gp != -1073741823L ) 
		      {
			while ( ( ( mem [gp ].hh.b0 != rr ) && ( mem [gp ]
			.hh .v.RH != -1073741823L ) ) ) {
			    
			  gp = mem [gp ].hh .v.RH ;
			} 
			gq = mem [gp + 1 ].hh .v.LH ;
		      } 
		      else {
			  
			gp = getnode ( 2 ) ;
			fontglue [curf ]= gp ;
			gq = -1073741823L ;
		      } 
		      if ( gq == -1073741823L ) 
		      {
			mem [gp ].hh.b0 = rr ;
			gq = newspec ( membot ) ;
			mem [gp + 1 ].hh .v.LH = gq ;
			a = extenbase [curf ]+ ( rr ) * 3 ;
			mem [gq + 1 ].cint = fontinfo [a ].cint ;
			mem [gq + 2 ].cint = fontinfo [a + 1 ].cint ;
			mem [gq + 3 ].cint = fontinfo [a + 2 ].cint ;
			incr ( mem [gq ].hh .v.RH ) ;
			mem [gp ].hh .v.RH = getnode ( 2 ) ;
			gp = mem [gp ].hh .v.RH ;
			mem [gp + 1 ].hh .v.LH = -1073741823L ;
			mem [gp ].hh .v.RH = -1073741823L ;
		      } 
		      p = newglue ( gq ) ;
		      mem [p ].hh.b1 = 21 ;
		      mem [p ].hh .v.RH = mem [q ].hh .v.RH ;
		      mem [q ].hh .v.RH = p ;
		      return ;
		    } 
		    else {
			
		      p = newkern ( fontinfo [kernbase [curf ]+ 256 * curi 
		      .b2 + curi .b3 ].cint ) ;
		      mem [p ].hh .v.RH = mem [q ].hh .v.RH ;
		      mem [q ].hh .v.RH = p ;
		      return ;
		    } 
		  } 
		} 
		if ( curi .b0 >= 128 ) 
		return ;
		a = a + curi .b0 + 1 ;
		curi = fontinfo [a ].qqqq ;
	      } 
	    } 
	  } 
	} 
      } 
    } 
  } 
} 
void 
zmakescripts ( halfword q , scaled delta ) 
{
  makescripts_regmem 
  halfword p, x, y, z  ;
  scaled shiftup, shiftdown, clr  ;
  integer t  ;
  p = mem [q + 1 ].cint ;
  if ( ( p >= himemmin ) ) 
  {
    shiftup = 0 ;
    shiftdown = 0 ;
  } 
  else {
      
    z = hpack ( p , 0 , 1 ) ;
    if ( curstyle < 4 ) 
    t = 256 ;
    else t = 512 ;
    shiftup = mem [z + 3 ].cint - fontinfo [18 + parambase [eqtb [50988L 
    + t ].hh .v.RH ]].cint ;
    shiftdown = mem [z + 2 ].cint + fontinfo [19 + parambase [eqtb [
    50988L + t ].hh .v.RH ]].cint ;
    deleteglueref ( mem [z + 7 ].hh .v.RH ) ;
    deleteglueref ( mem [z + 7 ].hh .v.LH ) ;
    freenode ( z , 10 ) ;
  } 
  if ( mem [q + 2 ].hh .v.RH == 0 ) 
  {
    x = cleanbox ( q + 3 , 2 * ( curstyle / 4 ) + 5 , mem [q + 4 ].hh .v.LH 
    ) ;
    mem [x + 1 ].cint = mem [x + 1 ].cint + eqtb [114969L ].cint ;
    if ( shiftdown < fontinfo [16 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint ) 
    shiftdown = fontinfo [16 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint ;
    clr = mem [x + 3 ].cint - ( abs ( fontinfo [5 + parambase [eqtb [
    50988L + cursize ].hh .v.RH ]].cint * 4 ) / 5 ) ;
    if ( shiftdown < clr ) 
    shiftdown = clr ;
    mem [x + 4 ].cint = shiftdown ;
  } 
  else {
      
    {
      x = cleanbox ( q + 2 , 2 * ( curstyle / 4 ) + 4 + ( curstyle % 2 ) , mem 
      [q + 4 ].hh .v.LH ) ;
      mem [x + 1 ].cint = mem [x + 1 ].cint + eqtb [114969L ].cint ;
      if ( odd ( curstyle ) ) 
      clr = fontinfo [15 + parambase [eqtb [50988L + cursize ].hh .v.RH ]
      ].cint ;
      else if ( curstyle < 2 ) 
      clr = fontinfo [13 + parambase [eqtb [50988L + cursize ].hh .v.RH ]
      ].cint ;
      else clr = fontinfo [14 + parambase [eqtb [50988L + cursize ].hh 
      .v.RH ]].cint ;
      if ( shiftup < clr ) 
      shiftup = clr ;
      clr = mem [x + 2 ].cint + ( abs ( fontinfo [5 + parambase [eqtb [
      50988L + cursize ].hh .v.RH ]].cint ) / 4 ) ;
      if ( shiftup < clr ) 
      shiftup = clr ;
    } 
    if ( mem [q + 3 ].hh .v.RH == 0 ) 
    mem [x + 4 ].cint = - (integer) shiftup ;
    else {
	
      y = cleanbox ( q + 3 , 2 * ( curstyle / 4 ) + 5 , mem [q + 4 ].hh 
      .v.LH ) ;
      mem [y + 1 ].cint = mem [y + 1 ].cint + eqtb [114969L ].cint ;
      if ( shiftdown < fontinfo [17 + parambase [eqtb [50988L + cursize ]
      .hh .v.RH ]].cint ) 
      shiftdown = fontinfo [17 + parambase [eqtb [50988L + cursize ].hh 
      .v.RH ]].cint ;
      clr = 4 * fontinfo [8 + parambase [eqtb [50989L + cursize ].hh .v.RH 
      ]].cint - ( ( shiftup - mem [x + 2 ].cint ) - ( mem [y + 3 ].cint 
      - shiftdown ) ) ;
      if ( clr > 0 ) 
      {
	shiftdown = shiftdown + clr ;
	clr = ( abs ( fontinfo [5 + parambase [eqtb [50988L + cursize ].hh 
	.v.RH ]].cint * 4 ) / 5 ) - ( shiftup - mem [x + 2 ].cint ) ;
	if ( clr > 0 ) 
	{
	  shiftup = shiftup + clr ;
	  shiftdown = shiftdown - clr ;
	} 
      } 
      mem [x + 4 ].cint = delta ;
      p = newkern ( ( shiftup - mem [x + 2 ].cint ) - ( mem [y + 3 ].cint 
      - shiftdown ) ) ;
      mem [x ].hh .v.RH = p ;
      mem [p ].hh .v.RH = y ;
      x = vpackage ( x , 0 , 1 , 1073741823L ) ;
      mem [x + 4 ].cint = shiftdown ;
    } 
  } 
  if ( mem [q + 1 ].cint == -1073741823L ) 
  mem [q + 1 ].cint = x ;
  else {
      
    p = mem [q + 1 ].cint ;
    while ( mem [p ].hh .v.RH != -1073741823L ) p = mem [p ].hh .v.RH ;
    mem [p ].hh .v.RH = x ;
  } 
} 
smallnumber 
zmakeleftright ( halfword q , smallnumber style , scaled maxd , scaled maxh ) 
{
  register smallnumber Result; makeleftright_regmem 
  scaled delta, delta1, delta2  ;
  curstyle = style ;
  {
    if ( curstyle < 4 ) 
    cursize = 0 ;
    else cursize = 256 * ( ( curstyle - 2 ) / 2 ) ;
    curmu = xovern ( fontinfo [6 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint , 18 ) ;
  } 
  delta2 = maxd + fontinfo [22 + parambase [eqtb [50988L + cursize ].hh 
  .v.RH ]].cint ;
  delta1 = maxh + maxd - delta2 ;
  if ( delta2 > delta1 ) 
  delta1 = delta2 ;
  delta = ( delta1 / 500 ) * eqtb [114379L ].cint ;
  delta2 = delta1 + delta1 - eqtb [114967L ].cint ;
  if ( delta < delta2 ) 
  delta = delta2 ;
  mem [q + 1 ].cint = vardelimiter ( q + 1 , cursize , delta ) ;
  Result = mem [q ].hh.b0 - ( 10 ) ;
  return Result ;
} 
void 
mlisttohlist ( void ) 
{
  /* 21 82 80 81 83 30 */ mlisttohlist_regmem 
  halfword mlist  ;
  boolean penalties  ;
  smallnumber style  ;
  halfword u  ;
  smallnumber savestyle  ;
  halfword q  ;
  halfword r  ;
  smallnumber rtype  ;
  smallnumber t  ;
  halfword p, x, y, z  ;
  integer pen  ;
  integer s  ;
  scaled maxh, maxd  ;
  scaled delta  ;
  mlist = curmlist ;
  penalties = mlistpenalties ;
  style = curstyle ;
  q = mlist ;
  r = -1073741823L ;
  rtype = 19 ;
  maxh = 0 ;
  maxd = 0 ;
  {
    if ( curstyle < 4 ) 
    cursize = 0 ;
    else cursize = 256 * ( ( curstyle - 2 ) / 2 ) ;
    curmu = xovern ( fontinfo [6 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint , 18 ) ;
  } 
  while ( q != -1073741823L ) {
      
    lab21: delta = 0 ;
    switch ( mem [q ].hh.b0 ) 
    {case 20 : 
      switch ( rtype ) 
      {case 20 : 
      case 19 : 
      case 21 : 
      case 22 : 
      case 24 : 
      case 32 : 
	{
	  mem [q ].hh.b0 = 18 ;
	  goto lab21 ;
	} 
	break ;
	default: 
	;
	break ;
      } 
      break ;
    case 21 : 
    case 23 : 
    case 24 : 
    case 33 : 
      {
	if ( rtype == 20 ) 
	mem [r ].hh.b0 = 18 ;
	if ( mem [q ].hh.b0 == 33 ) 
	goto lab80 ;
      } 
      break ;
    case 32 : 
      goto lab80 ;
      break ;
    case 27 : 
      {
	makefraction ( q ) ;
	goto lab82 ;
      } 
      break ;
    case 19 : 
      {
	delta = makeop ( q ) ;
	if ( mem [q ].hh.b1 == 1 ) 
	goto lab82 ;
      } 
      break ;
    case 18 : 
      makeord ( q ) ;
      break ;
    case 22 : 
    case 25 : 
      ;
      break ;
    case 26 : 
      makeradical ( q ) ;
      break ;
    case 29 : 
      makeover ( q ) ;
      break ;
    case 28 : 
      makeunder ( q ) ;
      break ;
    case 30 : 
      makemathaccent ( q ) ;
      break ;
    case 31 : 
      makevcenter ( q ) ;
      break ;
    case 16 : 
      {
	curstyle = mem [q ].hh.b1 ;
	{
	  if ( curstyle < 4 ) 
	  cursize = 0 ;
	  else cursize = 256 * ( ( curstyle - 2 ) / 2 ) ;
	  curmu = xovern ( fontinfo [6 + parambase [eqtb [50988L + cursize 
	  ].hh .v.RH ]].cint , 18 ) ;
	} 
	goto lab81 ;
      } 
      break ;
    case 17 : 
      {
	switch ( curstyle / 2 ) 
	{case 0 : 
	  {
	    p = mem [q + 1 ].hh .v.LH ;
	    mem [q + 1 ].hh .v.LH = -1073741823L ;
	  } 
	  break ;
	case 1 : 
	  {
	    p = mem [q + 1 ].hh .v.RH ;
	    mem [q + 1 ].hh .v.RH = -1073741823L ;
	  } 
	  break ;
	case 2 : 
	  {
	    p = mem [q + 2 ].hh .v.LH ;
	    mem [q + 2 ].hh .v.LH = -1073741823L ;
	  } 
	  break ;
	case 3 : 
	  {
	    p = mem [q + 2 ].hh .v.RH ;
	    mem [q + 2 ].hh .v.RH = -1073741823L ;
	  } 
	  break ;
	} 
	flushnodelist ( mem [q + 1 ].hh .v.LH ) ;
	flushnodelist ( mem [q + 1 ].hh .v.RH ) ;
	flushnodelist ( mem [q + 2 ].hh .v.LH ) ;
	flushnodelist ( mem [q + 2 ].hh .v.RH ) ;
	mem [q ].hh.b0 = 16 ;
	mem [q ].hh.b1 = curstyle ;
	mem [q + 1 ].cint = 0 ;
	mem [q + 2 ].cint = 0 ;
	if ( p != -1073741823L ) 
	{
	  z = mem [q ].hh .v.RH ;
	  mem [q ].hh .v.RH = p ;
	  while ( mem [p ].hh .v.RH != -1073741823L ) p = mem [p ].hh 
	  .v.RH ;
	  mem [p ].hh .v.RH = z ;
	} 
	goto lab81 ;
      } 
      break ;
    case 4 : 
    case 6 : 
    case 7 : 
    case 10 : 
    case 14 : 
    case 9 : 
      goto lab81 ;
      break ;
    case 3 : 
      {
	if ( mem [q + 3 ].cint > maxh ) 
	maxh = mem [q + 3 ].cint ;
	if ( mem [q + 2 ].cint > maxd ) 
	maxd = mem [q + 2 ].cint ;
	goto lab81 ;
      } 
      break ;
    case 12 : 
      {
	if ( mem [q ].hh.b1 == 99 ) 
	{
	  x = mem [q + 1 ].hh .v.LH ;
	  y = mathglue ( x , curmu ) ;
	  deleteglueref ( x ) ;
	  mem [q + 1 ].hh .v.LH = y ;
	  mem [q ].hh.b1 = 0 ;
	} 
	else if ( ( cursize != 0 ) && ( mem [q ].hh.b1 == 98 ) ) 
	{
	  p = mem [q ].hh .v.RH ;
	  if ( p != -1073741823L ) {
	      
	    if ( ( mem [p ].hh.b0 == 12 ) || ( mem [p ].hh.b0 == 13 ) ) 
	    {
	      mem [q ].hh .v.RH = mem [p ].hh .v.RH ;
	      mem [p ].hh .v.RH = -1073741823L ;
	      flushnodelist ( p ) ;
	    } 
	  } 
	} 
	goto lab81 ;
      } 
      break ;
    case 13 : 
      {
	mathkern ( q , curmu ) ;
	goto lab81 ;
      } 
      break ;
    case 5 : 
      goto lab81 ;
      break ;
      default: 
      confusion ( 1057 ) ;
      break ;
    } 
    switch ( mem [q + 1 ].hh .v.RH ) 
    {case 1 : 
    case 5 : 
    case 6 : 
    case 7 : 
      {
	fetch ( q + 1 ) ;
	if ( ( curi .b0 > 0 ) ) 
	{
	  delta = fontinfo [italicbase [curf ]+ ( curi .b2 ) / 256 ].cint 
	  ;
	  p = newcharacter ( curf , curc ) ;
	  u = p ;
	  if ( fontdir [curf ]!= 0 ) 
	  {
	    mem [u ].hh .v.RH = getavail () ;
	    u = mem [u ].hh .v.RH ;
	    mem [u ].hh .v.LH = mem [q + 4 ].hh .v.LH ;
	  } 
	  if ( ( ( mem [q + 1 ].hh .v.RH == 5 ) || ( mem [q + 1 ].hh .v.RH 
	  == 7 ) ) && ( fontinfo [2 + parambase [curf ]].cint != 0 ) ) 
	  delta = 0 ;
	  if ( ( mem [q + 3 ].hh .v.RH == 0 ) && ( delta != 0 ) ) 
	  {
	    mem [u ].hh .v.RH = newkern ( delta ) ;
	    delta = 0 ;
	  } 
	} 
	else p = -1073741823L ;
      } 
      break ;
    case 0 : 
      p = -1073741823L ;
      break ;
    case 2 : 
      p = mem [q + 1 ].hh .v.LH ;
      break ;
    case 3 : 
      p = shiftsubexpbox ( q + 1 ) ;
      break ;
    case 4 : 
      {
	curmlist = mem [q + 1 ].hh .v.LH ;
	savestyle = curstyle ;
	mlistpenalties = false ;
	mlisttohlist () ;
	curstyle = savestyle ;
	{
	  if ( curstyle < 4 ) 
	  cursize = 0 ;
	  else cursize = 256 * ( ( curstyle - 2 ) / 2 ) ;
	  curmu = xovern ( fontinfo [6 + parambase [eqtb [50988L + cursize 
	  ].hh .v.RH ]].cint , 18 ) ;
	} 
	p = hpack ( mem [memtop - 3 ].hh .v.RH , 0 , 1 ) ;
      } 
      break ;
      default: 
      confusion ( 1059 ) ;
      break ;
    } 
    mem [q + 1 ].cint = p ;
    if ( ( mem [q + 3 ].hh .v.RH == 0 ) && ( mem [q + 2 ].hh .v.RH == 0 ) 
    ) 
    goto lab82 ;
    makescripts ( q , delta ) ;
    lab82: z = hpack ( mem [q + 1 ].cint , 0 , 1 ) ;
    if ( mem [z + 3 ].cint > maxh ) 
    maxh = mem [z + 3 ].cint ;
    if ( mem [z + 2 ].cint > maxd ) 
    maxd = mem [z + 2 ].cint ;
    deleteglueref ( mem [z + 7 ].hh .v.RH ) ;
    deleteglueref ( mem [z + 7 ].hh .v.LH ) ;
    freenode ( z , 10 ) ;
    lab80: r = q ;
    rtype = mem [r ].hh.b0 ;
    if ( rtype == 33 ) 
    {
      rtype = 32 ;
      curstyle = style ;
      {
	if ( curstyle < 4 ) 
	cursize = 0 ;
	else cursize = 256 * ( ( curstyle - 2 ) / 2 ) ;
	curmu = xovern ( fontinfo [6 + parambase [eqtb [50988L + cursize ]
	.hh .v.RH ]].cint , 18 ) ;
      } 
    } 
    lab81: q = mem [q ].hh .v.RH ;
  } 
  if ( rtype == 20 ) 
  mem [r ].hh.b0 = 18 ;
  p = memtop - 3 ;
  mem [p ].hh .v.RH = -1073741823L ;
  q = mlist ;
  rtype = 0 ;
  curstyle = style ;
  {
    if ( curstyle < 4 ) 
    cursize = 0 ;
    else cursize = 256 * ( ( curstyle - 2 ) / 2 ) ;
    curmu = xovern ( fontinfo [6 + parambase [eqtb [50988L + cursize ].hh 
    .v.RH ]].cint , 18 ) ;
  } 
  while ( q != -1073741823L ) {
      
    t = 18 ;
    s = 5 ;
    pen = 10000 ;
    switch ( mem [q ].hh.b0 ) 
    {case 19 : 
    case 22 : 
    case 23 : 
    case 24 : 
    case 25 : 
      t = mem [q ].hh.b0 ;
      break ;
    case 20 : 
      {
	t = 20 ;
	pen = eqtb [114370L ].cint ;
      } 
      break ;
    case 21 : 
      {
	t = 21 ;
	pen = eqtb [114371L ].cint ;
      } 
      break ;
    case 18 : 
    case 31 : 
    case 29 : 
    case 28 : 
      ;
      break ;
    case 26 : 
      s = 6 ;
      break ;
    case 30 : 
      s = 6 ;
      break ;
    case 27 : 
      s = 6 ;
      break ;
    case 32 : 
    case 33 : 
      t = makeleftright ( q , style , maxd , maxh ) ;
      break ;
    case 16 : 
      {
	curstyle = mem [q ].hh.b1 ;
	s = 3 ;
	{
	  if ( curstyle < 4 ) 
	  cursize = 0 ;
	  else cursize = 256 * ( ( curstyle - 2 ) / 2 ) ;
	  curmu = xovern ( fontinfo [6 + parambase [eqtb [50988L + cursize 
	  ].hh .v.RH ]].cint , 18 ) ;
	} 
	goto lab83 ;
      } 
      break ;
    case 10 : 
    case 14 : 
    case 3 : 
    case 9 : 
    case 7 : 
    case 4 : 
    case 6 : 
    case 12 : 
    case 13 : 
      {
	mem [p ].hh .v.RH = q ;
	p = q ;
	q = mem [q ].hh .v.RH ;
	mem [p ].hh .v.RH = -1073741823L ;
	goto lab30 ;
      } 
      break ;
    case 5 : 
      {
	mem [p ].hh .v.RH = q ;
	p = q ;
	q = mem [q ].hh .v.RH ;
	mem [p ].hh .v.RH = -1073741823L ;
	goto lab30 ;
      } 
      break ;
      default: 
      confusion ( 1060 ) ;
      break ;
    } 
    if ( rtype > 0 ) 
    {
      switch ( strpool [rtype * 8 + t + magicoffset ]) 
      {case 48 : 
	x = 0 ;
	break ;
      case 49 : 
	if ( curstyle < 4 ) 
	x = 17 ;
	else x = 0 ;
	break ;
      case 50 : 
	x = 17 ;
	break ;
      case 51 : 
	if ( curstyle < 4 ) 
	x = 18 ;
	else x = 0 ;
	break ;
      case 52 : 
	if ( curstyle < 4 ) 
	x = 19 ;
	else x = 0 ;
	break ;
	default: 
	confusion ( 1062 ) ;
	break ;
      } 
      if ( x != 0 ) 
      {
	y = mathglue ( eqtb [49925L + x ].hh .v.RH , curmu ) ;
	z = newglue ( y ) ;
	mem [y ].hh .v.RH = -1073741823L ;
	mem [p ].hh .v.RH = z ;
	p = z ;
	mem [z ].hh.b1 = x + 1 ;
      } 
    } 
    if ( mem [q + 1 ].cint != -1073741823L ) 
    {
      mem [p ].hh .v.RH = mem [q + 1 ].cint ;
      do {
	  p = mem [p ].hh .v.RH ;
      } while ( ! ( mem [p ].hh .v.RH == -1073741823L ) ) ;
    } 
    if ( penalties ) {
	
      if ( mem [q ].hh .v.RH != -1073741823L ) {
	  
	if ( pen < 10000 ) 
	{
	  rtype = mem [mem [q ].hh .v.RH ].hh.b0 ;
	  if ( rtype != 14 ) {
	      
	    if ( rtype != 21 ) 
	    {
	      z = newpenalty ( pen ) ;
	      mem [p ].hh .v.RH = z ;
	      p = z ;
	    } 
	  } 
	} 
      } 
    } 
    if ( mem [q ].hh.b0 == 33 ) 
    t = 22 ;
    rtype = t ;
    lab83: r = q ;
    q = mem [q ].hh .v.RH ;
    freenode ( r , s ) ;
    lab30: ;
  } 
  p = newnullbox () ;
  mem [p ].hh .v.RH = mem [memtop - 3 ].hh .v.RH ;
  adjusthlist ( p , false ) ;
  mem [memtop - 3 ].hh .v.RH = mem [p ].hh .v.RH ;
  deleteglueref ( mem [p + 7 ].hh .v.RH ) ;
  deleteglueref ( mem [p + 7 ].hh .v.LH ) ;
  freenode ( p , 10 ) ;
} 
void 
pushalignment ( void ) 
{
  pushalignment_regmem 
  halfword p  ;
  p = getnode ( 6 ) ;
  mem [p ].hh .v.RH = alignptr ;
  mem [p ].hh .v.LH = curalign ;
  mem [p + 1 ].hh .v.LH = mem [memtop - 8 ].hh .v.RH ;
  mem [p + 1 ].hh .v.RH = curspan ;
  mem [p + 2 ].cint = curloop ;
  mem [p + 3 ].cint = alignstate ;
  mem [p + 4 ].hh .v.LH = curhead ;
  mem [p + 4 ].hh .v.RH = curtail ;
  mem [p + 5 ].hh .v.LH = curprehead ;
  mem [p + 5 ].hh .v.RH = curpretail ;
  alignptr = p ;
  curhead = getavail () ;
  curprehead = getavail () ;
} 
void 
popalignment ( void ) 
{
  popalignment_regmem 
  halfword p  ;
  {
    mem [curhead ].hh .v.RH = avail ;
    avail = curhead ;
	;
#ifdef STAT
    decr ( dynused ) ;
#endif /* STAT */
  } 
  {
    mem [curprehead ].hh .v.RH = avail ;
    avail = curprehead ;
	;
#ifdef STAT
    decr ( dynused ) ;
#endif /* STAT */
  } 
  p = alignptr ;
  curtail = mem [p + 4 ].hh .v.RH ;
  curhead = mem [p + 4 ].hh .v.LH ;
  curpretail = mem [p + 5 ].hh .v.RH ;
  curprehead = mem [p + 5 ].hh .v.LH ;
  alignstate = mem [p + 3 ].cint ;
  curloop = mem [p + 2 ].cint ;
  curspan = mem [p + 1 ].hh .v.RH ;
  mem [memtop - 8 ].hh .v.RH = mem [p + 1 ].hh .v.LH ;
  curalign = mem [p ].hh .v.LH ;
  alignptr = mem [p ].hh .v.RH ;
  freenode ( p , 6 ) ;
} 
void 
getpreambletoken ( void ) 
{
  /* 20 */ getpreambletoken_regmem 
  lab20: gettoken () ;
  while ( ( curchr == 16777216L ) && ( curcmd == 4 ) ) {
      
    gettoken () ;
    if ( curcmd > 118 ) 
    {
      expand () ;
      gettoken () ;
    } 
  } 
  if ( curcmd == 9 ) 
  fatalerror ( 686 ) ;
  if ( ( curcmd == 85 ) && ( curchr == 49936L ) ) 
  {
    scanoptionalequals () ;
    scanglue ( 2 ) ;
    if ( eqtb [114404L ].cint > 0 ) 
    geqdefine ( 49936L , 135 , curval ) ;
    else eqdefine ( 49936L , 135 , curval ) ;
    goto lab20 ;
  } 
} 
void 
initalign ( void ) 
{
  /* 30 31 32 22 */ initalign_regmem 
  halfword savecsptr  ;
  halfword p  ;
  savecsptr = curcs ;
  pushalignment () ;
  alignstate = -1000000L ;
  if ( ( curlist .modefield == 239 ) && ( ( curlist .tailfield != curlist 
  .headfield ) || ( curlist .auxfield .cint != -1073741823L ) ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 784 ) ;
    } 
    printesc ( 588 ) ;
    print ( 1063 ) ;
    {
      helpptr = 3 ;
      helpline [2 ]= 1064 ;
      helpline [1 ]= 1065 ;
      helpline [0 ]= 1066 ;
    } 
    error () ;
    flushmath () ;
  } 
  pushnest () ;
  if ( curlist .modefield == 239 ) 
  {
    curlist .modefield = -1 ;
    curlist .auxfield .cint = nest [nestptr - 2 ].auxfield .cint ;
  } 
  else if ( curlist .modefield > 0 ) 
  curlist .modefield = - (integer) curlist .modefield ;
  scanspec ( 6 , false ) ;
  mem [memtop - 8 ].hh .v.RH = -1073741823L ;
  curalign = memtop - 8 ;
  curloop = -1073741823L ;
  scannerstatus = 4 ;
  warningindex = savecsptr ;
  alignstate = -1000000L ;
  while ( true ) {
      
    mem [curalign ].hh .v.RH = newparamglue ( 11 ) ;
    curalign = mem [curalign ].hh .v.RH ;
    if ( curcmd == 5 ) 
    goto lab30 ;
    p = memtop - 4 ;
    mem [p ].hh .v.RH = -1073741823L ;
    while ( true ) {
	
      getpreambletoken () ;
      if ( curcmd == 6 ) 
      goto lab31 ;
      if ( ( curcmd <= 5 ) && ( curcmd >= 4 ) && ( alignstate == -1000000L ) ) 
      {
	if ( ( p == memtop - 4 ) && ( curloop == -1073741823L ) && ( curcmd == 
	4 ) ) 
	curloop = curalign ;
	else {
	    
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1072 ) ;
	  } 
	  {
	    helpptr = 3 ;
	    helpline [2 ]= 1073 ;
	    helpline [1 ]= 1074 ;
	    helpline [0 ]= 1075 ;
	  } 
	  backerror () ;
	  goto lab31 ;
	} 
      } 
      else if ( ( curcmd != 10 ) || ( p != memtop - 4 ) ) 
      {
	mem [p ].hh .v.RH = getavail () ;
	p = mem [p ].hh .v.RH ;
	mem [p ].hh .v.LH = curtok ;
      } 
    } 
    lab31: ;
    mem [curalign ].hh .v.RH = newnullbox () ;
    curalign = mem [curalign ].hh .v.RH ;
    mem [curalign ].hh .v.LH = memtop - 9 ;
    mem [curalign + 1 ].cint = -1073741824L ;
    mem [curalign + 3 ].cint = mem [memtop - 4 ].hh .v.RH ;
    p = memtop - 4 ;
    mem [p ].hh .v.RH = -1073741823L ;
    while ( true ) {
	
      lab22: getpreambletoken () ;
      if ( ( curcmd <= 5 ) && ( curcmd >= 4 ) && ( alignstate == -1000000L ) ) 
      goto lab32 ;
      if ( curcmd == 6 ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1076 ) ;
	} 
	{
	  helpptr = 3 ;
	  helpline [2 ]= 1073 ;
	  helpline [1 ]= 1074 ;
	  helpline [0 ]= 1077 ;
	} 
	error () ;
	goto lab22 ;
      } 
      mem [p ].hh .v.RH = getavail () ;
      p = mem [p ].hh .v.RH ;
      mem [p ].hh .v.LH = curtok ;
    } 
    lab32: mem [p ].hh .v.RH = getavail () ;
    p = mem [p ].hh .v.RH ;
    mem [p ].hh .v.LH = 536909726L ;
    mem [curalign + 2 ].cint = mem [memtop - 4 ].hh .v.RH ;
  } 
  lab30: scannerstatus = 0 ;
  newsavelevel ( 6 ) ;
  if ( eqtb [50466L ].hh .v.RH != -1073741823L ) 
  begintokenlist ( eqtb [50466L ].hh .v.RH , 13 ) ;
  alignpeek () ;
} 
void 
zinitspan ( halfword p ) 
{
  initspan_regmem 
  pushnest () ;
  if ( curlist .modefield == -120 ) 
  curlist .auxfield .hh .v.LH = 1000 ;
  else {
      
    curlist .auxfield .cint = -65536000L ;
    normalparagraph () ;
  } 
  curlist .inhibitglueflagfield = false ;
  curspan = p ;
} 
void 
initrow ( void ) 
{
  initrow_regmem 
  pushnest () ;
  curlist .modefield = ( -121 ) - curlist .modefield ;
  if ( curlist .modefield == -120 ) 
  curlist .auxfield .hh .v.LH = 0 ;
  else curlist .auxfield .cint = 0 ;
  {
    mem [curlist .tailfield ].hh .v.RH = newglue ( mem [mem [memtop - 8 ]
    .hh .v.RH + 1 ].hh .v.LH ) ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  mem [curlist .tailfield ].hh.b1 = 12 ;
  curalign = mem [mem [memtop - 8 ].hh .v.RH ].hh .v.RH ;
  curtail = curhead ;
  curpretail = curprehead ;
  initspan ( curalign ) ;
} 
void 
initcol ( void ) 
{
  initcol_regmem 
  mem [curalign + 5 ].hh .v.LH = curcmd ;
  if ( curcmd == 69 ) 
  alignstate = 0 ;
  else {
      
    backinput () ;
    begintokenlist ( mem [curalign + 3 ].cint , 1 ) ;
  } 
} 
boolean 
fincol ( void ) 
{
  /* 10 */ register boolean Result; fincol_regmem 
  halfword p  ;
  halfword q, r  ;
  halfword s  ;
  halfword u  ;
  scaled w  ;
  glueord o  ;
  halfword n  ;
  if ( curalign == -1073741823L ) 
  confusion ( 1078 ) ;
  q = mem [curalign ].hh .v.RH ;
  if ( q == -1073741823L ) 
  confusion ( 1078 ) ;
  if ( alignstate < 500000L ) 
  fatalerror ( 686 ) ;
  p = mem [q ].hh .v.RH ;
  if ( ( p == -1073741823L ) && ( mem [curalign + 5 ].hh .v.LH < 16777217L ) 
  ) {
      
    if ( curloop != -1073741823L ) 
    {
      mem [q ].hh .v.RH = newnullbox () ;
      p = mem [q ].hh .v.RH ;
      mem [p ].hh .v.LH = memtop - 9 ;
      mem [p + 1 ].cint = -1073741824L ;
      curloop = mem [curloop ].hh .v.RH ;
      q = memtop - 4 ;
      r = mem [curloop + 3 ].cint ;
      while ( r != -1073741823L ) {
	  
	mem [q ].hh .v.RH = getavail () ;
	q = mem [q ].hh .v.RH ;
	mem [q ].hh .v.LH = mem [r ].hh .v.LH ;
	r = mem [r ].hh .v.RH ;
      } 
      mem [q ].hh .v.RH = -1073741823L ;
      mem [p + 3 ].cint = mem [memtop - 4 ].hh .v.RH ;
      q = memtop - 4 ;
      r = mem [curloop + 2 ].cint ;
      while ( r != -1073741823L ) {
	  
	mem [q ].hh .v.RH = getavail () ;
	q = mem [q ].hh .v.RH ;
	mem [q ].hh .v.LH = mem [r ].hh .v.LH ;
	r = mem [r ].hh .v.RH ;
      } 
      mem [q ].hh .v.RH = -1073741823L ;
      mem [p + 2 ].cint = mem [memtop - 4 ].hh .v.RH ;
      curloop = mem [curloop ].hh .v.RH ;
      mem [p ].hh .v.RH = newglue ( mem [curloop + 1 ].hh .v.LH ) ;
      mem [mem [p ].hh .v.RH ].hh.b1 = 12 ;
    } 
    else {
	
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1079 ) ;
      } 
      printesc ( 1068 ) ;
      {
	helpptr = 3 ;
	helpline [2 ]= 1080 ;
	helpline [1 ]= 1081 ;
	helpline [0 ]= 1082 ;
      } 
      mem [curalign + 5 ].hh .v.LH = 16777217L ;
      error () ;
    } 
  } 
  if ( mem [curalign + 5 ].hh .v.LH != 16777216L ) 
  {
    unsave () ;
    newsavelevel ( 6 ) ;
    {
      if ( curlist .modefield == -120 ) 
      {
	adjusttail = curtail ;
	preadjusttail = curpretail ;
	adjusthlist ( curlist .headfield , false ) ;
	deleteglueref ( curkanjiskip ) ;
	deleteglueref ( curxkanjiskip ) ;
	curkanjiskip = mem [curlist .headfield + 7 ].hh .v.RH ;
	curxkanjiskip = mem [curlist .headfield + 7 ].hh .v.LH ;
	incr ( mem [curkanjiskip ].hh .v.RH ) ;
	incr ( mem [curxkanjiskip ].hh .v.RH ) ;
	u = hpack ( mem [curlist .headfield ].hh .v.RH , 0 , 1 ) ;
	w = mem [u + 1 ].cint ;
	curtail = adjusttail ;
	adjusttail = -1073741823L ;
	curpretail = preadjusttail ;
	preadjusttail = -1073741823L ;
      } 
      else {
	  
	u = vpackage ( mem [curlist .headfield ].hh .v.RH , 0 , 1 , 0 ) ;
	w = mem [u + 3 ].cint ;
      } 
      n = 0 ;
      if ( curspan != curalign ) 
      {
	q = curspan ;
	do {
	    incr ( n ) ;
	  q = mem [mem [q ].hh .v.RH ].hh .v.RH ;
	} while ( ! ( q == curalign ) ) ;
	if ( n > 65535L ) 
	confusion ( 1083 ) ;
	q = curspan ;
	while ( mem [mem [q ].hh .v.LH ].hh .v.RH < n ) q = mem [q ].hh 
	.v.LH ;
	if ( mem [mem [q ].hh .v.LH ].hh .v.RH > n ) 
	{
	  s = getnode ( 2 ) ;
	  mem [s ].hh .v.LH = mem [q ].hh .v.LH ;
	  mem [s ].hh .v.RH = n ;
	  mem [q ].hh .v.LH = s ;
	  mem [s + 1 ].cint = w ;
	} 
	else if ( mem [mem [q ].hh .v.LH + 1 ].cint < w ) 
	mem [mem [q ].hh .v.LH + 1 ].cint = w ;
      } 
      else if ( w > mem [curalign + 1 ].cint ) 
      mem [curalign + 1 ].cint = w ;
      mem [u ].hh.b0 = 15 ;
      mem [u ].hh.b1 = n ;
      if ( totalstretch [4 ]!= 0 ) 
      o = 4 ;
      else if ( totalstretch [3 ]!= 0 ) 
      o = 3 ;
      else if ( totalstretch [2 ]!= 0 ) 
      o = 2 ;
      else if ( totalstretch [1 ]!= 0 ) 
      o = 1 ;
      else o = 0 ;
      mem [u + 5 ].hh.b1 = o ;
      mem [u + 6 ].cint = totalstretch [o ];
      if ( totalshrink [4 ]!= 0 ) 
      o = 4 ;
      else if ( totalshrink [3 ]!= 0 ) 
      o = 3 ;
      else if ( totalshrink [2 ]!= 0 ) 
      o = 2 ;
      else if ( totalshrink [1 ]!= 0 ) 
      o = 1 ;
      else o = 0 ;
      mem [u + 5 ].hh.b0 = o ;
      mem [u + 4 ].cint = totalshrink [o ];
      popnest () ;
      mem [curlist .tailfield ].hh .v.RH = u ;
      curlist .tailfield = u ;
    } 
    {
      mem [curlist .tailfield ].hh .v.RH = newglue ( mem [mem [curalign ]
      .hh .v.RH + 1 ].hh .v.LH ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    mem [curlist .tailfield ].hh.b1 = 12 ;
    if ( mem [curalign + 5 ].hh .v.LH >= 16777217L ) 
    {
      Result = true ;
      return Result ;
    } 
    initspan ( p ) ;
  } 
  alignstate = 1000000L ;
  do {
      getxorprotected () ;
  } while ( ! ( curcmd != 10 ) ) ;
  curalign = p ;
  initcol () ;
  Result = false ;
  return Result ;
} 
void 
finrow ( void ) 
{
  finrow_regmem 
  halfword p  ;
  if ( curlist .modefield == -120 ) 
  {
    adjusthlist ( curlist .headfield , false ) ;
    deleteglueref ( curkanjiskip ) ;
    deleteglueref ( curxkanjiskip ) ;
    curkanjiskip = mem [curlist .headfield + 7 ].hh .v.RH ;
    curxkanjiskip = mem [curlist .headfield + 7 ].hh .v.LH ;
    incr ( mem [curkanjiskip ].hh .v.RH ) ;
    incr ( mem [curxkanjiskip ].hh .v.RH ) ;
    p = hpack ( mem [curlist .headfield ].hh .v.RH , 0 , 1 ) ;
    popnest () ;
    if ( curprehead != curpretail ) 
    {
      mem [curlist .tailfield ].hh .v.RH = mem [curprehead ].hh .v.RH ;
      curlist .tailfield = curpretail ;
    } 
    appendtovlist ( p ) ;
    if ( curhead != curtail ) 
    {
      mem [curlist .tailfield ].hh .v.RH = mem [curhead ].hh .v.RH ;
      curlist .tailfield = curtail ;
    } 
  } 
  else {
      
    p = vpackage ( mem [curlist .headfield ].hh .v.RH , 0 , 1 , 1073741823L 
    ) ;
    popnest () ;
    mem [curlist .tailfield ].hh .v.RH = p ;
    curlist .tailfield = p ;
    curlist .auxfield .hh .v.LH = 1000 ;
    curlist .inhibitglueflagfield = false ;
  } 
  mem [p ].hh.b0 = 15 ;
  mem [p + 6 ].cint = 0 ;
  if ( eqtb [50466L ].hh .v.RH != -1073741823L ) 
  begintokenlist ( eqtb [50466L ].hh .v.RH , 13 ) ;
  alignpeek () ;
} 
void 
finalign ( void ) 
{
  finalign_regmem 
  halfword p, q, r, s, u, v, z  ;
  scaled t, w  ;
  scaled o  ;
  halfword n  ;
  scaled rulesave  ;
  memoryword auxsave  ;
  if ( curgroup != 6 ) 
  confusion ( 1084 ) ;
  unsave () ;
  if ( curgroup != 6 ) 
  confusion ( 1085 ) ;
  unsave () ;
  if ( nest [nestptr - 1 ].modefield == 239 ) 
  o = eqtb [114972L ].cint ;
  else o = 0 ;
  q = mem [mem [memtop - 8 ].hh .v.RH ].hh .v.RH ;
  do {
      flushlist ( mem [q + 3 ].cint ) ;
    flushlist ( mem [q + 2 ].cint ) ;
    p = mem [mem [q ].hh .v.RH ].hh .v.RH ;
    if ( mem [q + 1 ].cint == -1073741824L ) 
    {
      mem [q + 1 ].cint = 0 ;
      r = mem [q ].hh .v.RH ;
      s = mem [r + 1 ].hh .v.LH ;
      if ( s != membot ) 
      {
	incr ( mem [membot ].hh .v.RH ) ;
	deleteglueref ( s ) ;
	mem [r + 1 ].hh .v.LH = membot ;
      } 
    } 
    if ( mem [q ].hh .v.LH != memtop - 9 ) 
    {
      t = mem [q + 1 ].cint + mem [mem [mem [q ].hh .v.RH + 1 ].hh 
      .v.LH + 1 ].cint ;
      r = mem [q ].hh .v.LH ;
      s = memtop - 9 ;
      mem [s ].hh .v.LH = p ;
      n = 1 ;
      do {
	  mem [r + 1 ].cint = mem [r + 1 ].cint - t ;
	u = mem [r ].hh .v.LH ;
	while ( mem [r ].hh .v.RH > n ) {
	    
	  s = mem [s ].hh .v.LH ;
	  n = mem [mem [s ].hh .v.LH ].hh .v.RH + 1 ;
	} 
	if ( mem [r ].hh .v.RH < n ) 
	{
	  mem [r ].hh .v.LH = mem [s ].hh .v.LH ;
	  mem [s ].hh .v.LH = r ;
	  decr ( mem [r ].hh .v.RH ) ;
	  s = r ;
	} 
	else {
	    
	  if ( mem [r + 1 ].cint > mem [mem [s ].hh .v.LH + 1 ].cint ) 
	  mem [mem [s ].hh .v.LH + 1 ].cint = mem [r + 1 ].cint ;
	  freenode ( r , 2 ) ;
	} 
	r = u ;
      } while ( ! ( r == memtop - 9 ) ) ;
    } 
    mem [q ].hh.b0 = 15 ;
    mem [q ].hh.b1 = 0 ;
    mem [q + 3 ].cint = 0 ;
    mem [q + 2 ].cint = 0 ;
    mem [q + 5 ].hh.b1 = 0 ;
    mem [q + 5 ].hh.b0 = 0 ;
    mem [q + 6 ].cint = 0 ;
    mem [q + 4 ].cint = 0 ;
    q = p ;
  } while ( ! ( q == -1073741823L ) ) ;
  saveptr = saveptr - 2 ;
  packbeginline = - (integer) curlist .mlfield ;
  if ( curlist .modefield == -1 ) 
  {
    rulesave = eqtb [114973L ].cint ;
    eqtb [114973L ].cint = 0 ;
    z = newnullbox () ;
    mem [z ].hh .v.RH = mem [memtop - 8 ].hh .v.RH ;
    adjusthlist ( z , false ) ;
    deleteglueref ( curkanjiskip ) ;
    deleteglueref ( curxkanjiskip ) ;
    curkanjiskip = mem [z + 7 ].hh .v.RH ;
    curxkanjiskip = mem [z + 7 ].hh .v.LH ;
    incr ( mem [curkanjiskip ].hh .v.RH ) ;
    incr ( mem [curxkanjiskip ].hh .v.RH ) ;
    p = hpack ( mem [memtop - 8 ].hh .v.RH , savestack [saveptr + 1 ].cint 
    , savestack [saveptr + 0 ].cint ) ;
    eqtb [114973L ].cint = rulesave ;
    deleteglueref ( mem [z + 7 ].hh .v.RH ) ;
    deleteglueref ( mem [z + 7 ].hh .v.LH ) ;
    freenode ( z , 10 ) ;
  } 
  else {
      
    q = mem [mem [memtop - 8 ].hh .v.RH ].hh .v.RH ;
    do {
	mem [q + 3 ].cint = mem [q + 1 ].cint ;
      mem [q + 1 ].cint = 0 ;
      q = mem [mem [q ].hh .v.RH ].hh .v.RH ;
    } while ( ! ( q == -1073741823L ) ) ;
    p = vpackage ( mem [memtop - 8 ].hh .v.RH , savestack [saveptr + 1 ]
    .cint , savestack [saveptr + 0 ].cint , 1073741823L ) ;
    q = mem [mem [memtop - 8 ].hh .v.RH ].hh .v.RH ;
    do {
	mem [q + 1 ].cint = mem [q + 3 ].cint ;
      mem [q + 3 ].cint = 0 ;
      q = mem [mem [q ].hh .v.RH ].hh .v.RH ;
    } while ( ! ( q == -1073741823L ) ) ;
  } 
  packbeginline = 0 ;
  q = mem [curlist .headfield ].hh .v.RH ;
  s = curlist .headfield ;
  while ( q != -1073741823L ) {
      
    if ( ! ( q >= himemmin ) ) {
	
      if ( mem [q ].hh.b0 == 15 ) 
      {
	if ( curlist .modefield == -1 ) 
	{
	  mem [q ].hh.b0 = 0 ;
	  mem [q + 1 ].cint = mem [p + 1 ].cint ;
	  if ( nest [nestptr - 1 ].modefield == 239 ) 
	  mem [q ].hh.b1 = ( ( mem [q ].hh.b1 ) % 16 - 5 ) + 5 + 16 * ( 2 
	  ) ;
	} 
	else {
	    
	  mem [q ].hh.b0 = 1 ;
	  mem [q + 3 ].cint = mem [p + 3 ].cint ;
	} 
	mem [q ].hh.b1 = ( ( mem [q ].hh.b1 ) / 16 ) * 16 + curlist 
	.dirfield + 5 ;
	mem [q + 5 ].hh.b1 = mem [p + 5 ].hh.b1 ;
	mem [q + 5 ].hh.b0 = mem [p + 5 ].hh.b0 ;
	mem [q + 6 ].gr = mem [p + 6 ].gr ;
	mem [q + 4 ].cint = o ;
	r = mem [mem [q + 5 ].hh .v.RH ].hh .v.RH ;
	s = mem [mem [p + 5 ].hh .v.RH ].hh .v.RH ;
	do {
	    n = mem [r ].hh.b1 ;
	  t = mem [s + 1 ].cint ;
	  w = t ;
	  u = memtop - 4 ;
	  mem [r ].hh.b1 = ( ( mem [r ].hh.b1 ) % 16 - 5 ) + 5 + 16 * ( 0 
	  ) ;
	  while ( n > 0 ) {
	      
	    decr ( n ) ;
	    s = mem [s ].hh .v.RH ;
	    v = mem [s + 1 ].hh .v.LH ;
	    mem [u ].hh .v.RH = newglue ( v ) ;
	    u = mem [u ].hh .v.RH ;
	    mem [u ].hh.b1 = 12 ;
	    t = t + mem [v + 1 ].cint ;
	    if ( mem [p + 5 ].hh.b0 == 1 ) 
	    {
	      if ( mem [v ].hh.b0 == mem [p + 5 ].hh.b1 ) 
	      t = t + round ( mem [p + 6 ].gr * mem [v + 2 ].cint ) ;
	    } 
	    else if ( mem [p + 5 ].hh.b0 == 2 ) 
	    {
	      if ( mem [v ].hh.b1 == mem [p + 5 ].hh.b1 ) 
	      t = t - round ( mem [p + 6 ].gr * mem [v + 3 ].cint ) ;
	    } 
	    s = mem [s ].hh .v.RH ;
	    mem [u ].hh .v.RH = newnullbox () ;
	    u = mem [u ].hh .v.RH ;
	    t = t + mem [s + 1 ].cint ;
	    if ( curlist .modefield == -1 ) 
	    mem [u + 1 ].cint = mem [s + 1 ].cint ;
	    else {
		
	      mem [u ].hh.b0 = 1 ;
	      mem [u + 3 ].cint = mem [s + 1 ].cint ;
	    } 
	    mem [u ].hh.b1 = ( ( mem [u ].hh.b1 ) / 16 ) * 16 + curlist 
	    .dirfield + 5 ;
	  } 
	  if ( curlist .modefield == -1 ) 
	  {
	    mem [r + 3 ].cint = mem [q + 3 ].cint ;
	    mem [r + 2 ].cint = mem [q + 2 ].cint ;
	    if ( t == mem [r + 1 ].cint ) 
	    {
	      mem [r + 5 ].hh.b0 = 0 ;
	      mem [r + 5 ].hh.b1 = 0 ;
	      mem [r + 6 ].gr = 0.0 ;
	    } 
	    else if ( t > mem [r + 1 ].cint ) 
	    {
	      mem [r + 5 ].hh.b0 = 1 ;
	      if ( mem [r + 6 ].cint == 0 ) 
	      mem [r + 6 ].gr = 0.0 ;
	      else mem [r + 6 ].gr = ( t - mem [r + 1 ].cint ) / ((double) 
	      mem [r + 6 ].cint ) ;
	    } 
	    else {
		
	      mem [r + 5 ].hh.b1 = mem [r + 5 ].hh.b0 ;
	      mem [r + 5 ].hh.b0 = 2 ;
	      if ( mem [r + 4 ].cint == 0 ) 
	      mem [r + 6 ].gr = 0.0 ;
	      else if ( ( mem [r + 5 ].hh.b1 == 0 ) && ( mem [r + 1 ].cint 
	      - t > mem [r + 4 ].cint ) ) 
	      mem [r + 6 ].gr = 1.0 ;
	      else mem [r + 6 ].gr = ( mem [r + 1 ].cint - t ) / ((double) 
	      mem [r + 4 ].cint ) ;
	    } 
	    mem [r + 1 ].cint = w ;
	    mem [r ].hh.b0 = 0 ;
	    mem [r ].hh.b1 = ( ( mem [r ].hh.b1 ) / 16 ) * 16 + curlist 
	    .dirfield + 5 ;
	  } 
	  else {
	      
	    mem [r + 1 ].cint = mem [q + 1 ].cint ;
	    if ( t == mem [r + 3 ].cint ) 
	    {
	      mem [r + 5 ].hh.b0 = 0 ;
	      mem [r + 5 ].hh.b1 = 0 ;
	      mem [r + 6 ].gr = 0.0 ;
	    } 
	    else if ( t > mem [r + 3 ].cint ) 
	    {
	      mem [r + 5 ].hh.b0 = 1 ;
	      if ( mem [r + 6 ].cint == 0 ) 
	      mem [r + 6 ].gr = 0.0 ;
	      else mem [r + 6 ].gr = ( t - mem [r + 3 ].cint ) / ((double) 
	      mem [r + 6 ].cint ) ;
	    } 
	    else {
		
	      mem [r + 5 ].hh.b1 = mem [r + 5 ].hh.b0 ;
	      mem [r + 5 ].hh.b0 = 2 ;
	      if ( mem [r + 4 ].cint == 0 ) 
	      mem [r + 6 ].gr = 0.0 ;
	      else if ( ( mem [r + 5 ].hh.b1 == 0 ) && ( mem [r + 3 ].cint 
	      - t > mem [r + 4 ].cint ) ) 
	      mem [r + 6 ].gr = 1.0 ;
	      else mem [r + 6 ].gr = ( mem [r + 3 ].cint - t ) / ((double) 
	      mem [r + 4 ].cint ) ;
	    } 
	    mem [r + 3 ].cint = w ;
	    mem [r ].hh.b0 = 1 ;
	    mem [r ].hh.b1 = ( ( mem [r ].hh.b1 ) / 16 ) * 16 + curlist 
	    .dirfield + 5 ;
	  } 
	  mem [r + 4 ].cint = 0 ;
	  if ( u != memtop - 4 ) 
	  {
	    mem [u ].hh .v.RH = mem [r ].hh .v.RH ;
	    mem [r ].hh .v.RH = mem [memtop - 4 ].hh .v.RH ;
	    r = u ;
	  } 
	  r = mem [mem [r ].hh .v.RH ].hh .v.RH ;
	  s = mem [mem [s ].hh .v.RH ].hh .v.RH ;
	} while ( ! ( r == -1073741823L ) ) ;
      } 
      else if ( mem [q ].hh.b0 == 3 ) 
      {
	if ( ( mem [q + 1 ].cint == -1073741824L ) ) 
	mem [q + 1 ].cint = mem [p + 1 ].cint ;
	if ( ( mem [q + 3 ].cint == -1073741824L ) ) 
	mem [q + 3 ].cint = mem [p + 3 ].cint ;
	if ( ( mem [q + 2 ].cint == -1073741824L ) ) 
	mem [q + 2 ].cint = mem [p + 2 ].cint ;
	if ( o != 0 ) 
	{
	  r = mem [q ].hh .v.RH ;
	  mem [q ].hh .v.RH = -1073741823L ;
	  q = hpack ( q , 0 , 1 ) ;
	  mem [q + 4 ].cint = o ;
	  mem [q ].hh .v.RH = r ;
	  mem [s ].hh .v.RH = q ;
	} 
      } 
    } 
    s = q ;
    q = mem [q ].hh .v.RH ;
  } 
  flushnodelist ( p ) ;
  popalignment () ;
  auxsave = curlist .auxfield ;
  p = mem [curlist .headfield ].hh .v.RH ;
  q = curlist .tailfield ;
  popnest () ;
  if ( curlist .modefield == 239 ) 
  {
    doassignments () ;
    if ( curcmd != 3 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1373 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 1064 ;
	helpline [0 ]= 1065 ;
      } 
      backerror () ;
    } 
    else {
	
      do {
	  getxtoken () ;
      } while ( ! ( ( eqtb [114442L ].cint == 0 ) || ( curcmd != 13 ) ) ) ;
      if ( curcmd != 3 ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1369 ) ;
	} 
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1370 ;
	  helpline [0 ]= 1371 ;
	} 
	backerror () ;
      } 
    } 
    flushnodelist ( curlist .eTeXauxfield ) ;
    popnest () ;
    {
      mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [114372L ]
      .cint ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    {
      mem [curlist .tailfield ].hh .v.RH = newparamglue ( 3 ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    mem [curlist .tailfield ].hh .v.RH = p ;
    if ( p != -1073741823L ) 
    curlist .tailfield = q ;
    {
      mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [114373L ]
      .cint ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    {
      mem [curlist .tailfield ].hh .v.RH = newparamglue ( 4 ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    curlist .auxfield .cint = auxsave .cint ;
    resumeafterdisplay () ;
  } 
  else {
      
    curlist .auxfield = auxsave ;
    mem [curlist .tailfield ].hh .v.RH = p ;
    if ( p != -1073741823L ) 
    curlist .tailfield = q ;
    if ( curlist .modefield == 1 ) 
    buildpage () ;
  } 
} 
void 
alignpeek ( void ) 
{
  /* 20 */ alignpeek_regmem 
  lab20: alignstate = 1000000L ;
  do {
      getxorprotected () ;
  } while ( ! ( curcmd != 10 ) ) ;
  if ( curcmd == 40 ) 
  {
    scanleftbrace () ;
    newsavelevel ( 7 ) ;
    if ( curlist .modefield == -1 ) 
    normalparagraph () ;
  } 
  else if ( curcmd == 2 ) 
  finalign () ;
  else if ( ( curcmd == 5 ) && ( curchr == 16777218L ) ) 
  goto lab20 ;
  else {
      
    initrow () ;
    initcol () ;
  } 
} 
halfword 
zfiniteshrink ( halfword p ) 
{
  register halfword Result; finiteshrink_regmem 
  halfword q  ;
  if ( noshrinkerroryet ) 
  {
    noshrinkerroryet = false ;
	;
#ifdef STAT
    if ( eqtb [114393L ].cint > 0 ) 
    enddiagnostic ( true ) ;
#endif /* STAT */
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1086 ) ;
    } 
    {
      helpptr = 5 ;
      helpline [4 ]= 1087 ;
      helpline [3 ]= 1088 ;
      helpline [2 ]= 1089 ;
      helpline [1 ]= 1090 ;
      helpline [0 ]= 1091 ;
    } 
    error () ;
	;
#ifdef STAT
    if ( eqtb [114393L ].cint > 0 ) 
    begindiagnostic () ;
#endif /* STAT */
  } 
  q = newspec ( p ) ;
  mem [q ].hh.b1 = 0 ;
  deleteglueref ( p ) ;
  Result = q ;
  return Result ;
} 
void 
ztrybreak ( integer pi , smallnumber breaktype ) 
{
  /* 10 30 31 22 60 40 45 */ trybreak_regmem 
  halfword r  ;
  halfword prevr  ;
  halfword oldl  ;
  boolean nobreakyet  ;
  halfword prevprevr  ;
  halfword s  ;
  halfword q  ;
  halfword v  ;
  integer t  ;
  internalfontnumber f  ;
  halfword l  ;
  boolean noderstaysactive  ;
  scaled linewidth  ;
  unsigned char fitclass  ;
  halfword b  ;
  integer d  ;
  boolean artificialdemerits  ;
  halfword savelink  ;
  scaled shortfall  ;
  scaled g  ;
  if ( abs ( pi ) >= 10000 ) {
      
    if ( pi > 0 ) 
    goto lab10 ;
    else pi = -10000 ;
  } 
  nobreakyet = true ;
  prevr = memtop - 7 ;
  oldl = 0 ;
  curactivewidth [1 ]= activewidth [1 ];
  curactivewidth [2 ]= activewidth [2 ];
  curactivewidth [3 ]= activewidth [3 ];
  curactivewidth [4 ]= activewidth [4 ];
  curactivewidth [5 ]= activewidth [5 ];
  curactivewidth [6 ]= activewidth [6 ];
  curactivewidth [7 ]= activewidth [7 ];
  while ( true ) {
      
    lab22: r = mem [prevr ].hh .v.RH ;
    if ( mem [r ].hh.b0 == 2 ) 
    {
      curactivewidth [1 ]= curactivewidth [1 ]+ mem [r + 1 ].cint ;
      curactivewidth [2 ]= curactivewidth [2 ]+ mem [r + 2 ].cint ;
      curactivewidth [3 ]= curactivewidth [3 ]+ mem [r + 3 ].cint ;
      curactivewidth [4 ]= curactivewidth [4 ]+ mem [r + 4 ].cint ;
      curactivewidth [5 ]= curactivewidth [5 ]+ mem [r + 5 ].cint ;
      curactivewidth [6 ]= curactivewidth [6 ]+ mem [r + 6 ].cint ;
      curactivewidth [7 ]= curactivewidth [7 ]+ mem [r + 7 ].cint ;
      prevprevr = prevr ;
      prevr = r ;
      goto lab22 ;
    } 
    {
      l = mem [r + 1 ].hh .v.LH ;
      if ( l > oldl ) 
      {
	if ( ( minimumdemerits < 1073741823L ) && ( ( oldl != easyline ) || ( 
	r == memtop - 7 ) ) ) 
	{
	  if ( nobreakyet ) 
	  {
	    nobreakyet = false ;
	    breakwidth [1 ]= background [1 ];
	    breakwidth [2 ]= background [2 ];
	    breakwidth [3 ]= background [3 ];
	    breakwidth [4 ]= background [4 ];
	    breakwidth [5 ]= background [5 ];
	    breakwidth [6 ]= background [6 ];
	    breakwidth [7 ]= background [7 ];
	    s = curp ;
	    if ( breaktype > 0 ) {
		
	      if ( curp != -1073741823L ) 
	      {
		t = mem [curp ].hh.b1 ;
		v = curp ;
		s = mem [curp + 1 ].hh .v.RH ;
		while ( t > 0 ) {
		    
		  decr ( t ) ;
		  v = mem [v ].hh .v.RH ;
		  if ( ( v >= himemmin ) ) 
		  {
		    f = mem [v ].hh.b0 ;
		    breakwidth [1 ]= breakwidth [1 ]- fontinfo [widthbase 
		    [f ]+ fontinfo [charbase [f ]+ mem [v ].hh.b1 ]
		    .qqqq .b0 ].cint ;
		    if ( fontdir [f ]!= 0 ) 
		    v = mem [v ].hh .v.RH ;
		  } 
		  else switch ( mem [v ].hh.b0 ) 
		  {case 8 : 
		    {
		      f = mem [v + 1 ].hh.b0 ;
		      breakwidth [1 ]= breakwidth [1 ]- fontinfo [
		      widthbase [f ]+ fontinfo [charbase [f ]+ mem [v + 
		      1 ].hh.b1 ].qqqq .b0 ].cint ;
		    } 
		    break ;
		  case 0 : 
		  case 1 : 
		  case 2 : 
		  case 3 : 
		  case 13 : 
		    breakwidth [1 ]= breakwidth [1 ]- mem [v + 1 ].cint 
		    ;
		    break ;
		  case 5 : 
		    ;
		    break ;
		    default: 
		    confusion ( 1092 ) ;
		    break ;
		  } 
		} 
		while ( s != -1073741823L ) {
		    
		  if ( ( s >= himemmin ) ) 
		  {
		    f = mem [s ].hh.b0 ;
		    breakwidth [1 ]= breakwidth [1 ]+ fontinfo [widthbase 
		    [f ]+ fontinfo [charbase [f ]+ mem [s ].hh.b1 ]
		    .qqqq .b0 ].cint ;
		    if ( fontdir [f ]!= 0 ) 
		    s = mem [s ].hh .v.RH ;
		  } 
		  else switch ( mem [s ].hh.b0 ) 
		  {case 8 : 
		    {
		      f = mem [s + 1 ].hh.b0 ;
		      breakwidth [1 ]= breakwidth [1 ]+ fontinfo [
		      widthbase [f ]+ fontinfo [charbase [f ]+ mem [s + 
		      1 ].hh.b1 ].qqqq .b0 ].cint ;
		    } 
		    break ;
		  case 0 : 
		  case 1 : 
		  case 2 : 
		  case 3 : 
		  case 13 : 
		    breakwidth [1 ]= breakwidth [1 ]+ mem [s + 1 ].cint 
		    ;
		    break ;
		  case 5 : 
		    ;
		    break ;
		    default: 
		    confusion ( 1093 ) ;
		    break ;
		  } 
		  s = mem [s ].hh .v.RH ;
		} 
		breakwidth [1 ]= breakwidth [1 ]+ discwidth ;
		if ( mem [curp + 1 ].hh .v.RH == -1073741823L ) 
		s = mem [v ].hh .v.RH ;
	      } 
	    } 
	    while ( s != -1073741823L ) {
		
	      if ( ( s >= himemmin ) ) 
	      {
		if ( chain ) 
		{
		  breakwidth [1 ]= breakwidth [1 ]- mem [curkanjiskip + 1 
		  ].cint ;
		  breakwidth [2 + mem [curkanjiskip ].hh.b0 ]= breakwidth 
		  [2 + mem [curkanjiskip ].hh.b0 ]- mem [curkanjiskip + 2 
		  ].cint ;
		  breakwidth [7 ]= breakwidth [7 ]- mem [curkanjiskip + 3 
		  ].cint ;
		} 
		goto lab30 ;
	      } 
	      switch ( mem [s ].hh.b0 ) 
	      {case 12 : 
		{
		  v = mem [s + 1 ].hh .v.LH ;
		  breakwidth [1 ]= breakwidth [1 ]- mem [v + 1 ].cint ;
		  breakwidth [2 + mem [v ].hh.b0 ]= breakwidth [2 + mem [
		  v ].hh.b0 ]- mem [v + 2 ].cint ;
		  breakwidth [7 ]= breakwidth [7 ]- mem [v + 3 ].cint ;
		} 
		break ;
	      case 14 : 
		;
		break ;
	      case 11 : 
		breakwidth [1 ]= breakwidth [1 ]- mem [s + 1 ].cint ;
		break ;
	      case 13 : 
		if ( ( mem [s ].hh.b1 != 1 ) && ( mem [s ].hh.b1 != 3 ) ) 
		goto lab30 ;
		else breakwidth [1 ]= breakwidth [1 ]- mem [s + 1 ].cint 
		;
		break ;
		default: 
		goto lab30 ;
		break ;
	      } 
	      s = mem [s ].hh .v.RH ;
	    } 
	    lab30: ;
	  } 
	  if ( mem [prevr ].hh.b0 == 2 ) 
	  {
	    mem [prevr + 1 ].cint = mem [prevr + 1 ].cint - curactivewidth 
	    [1 ]+ breakwidth [1 ];
	    mem [prevr + 2 ].cint = mem [prevr + 2 ].cint - curactivewidth 
	    [2 ]+ breakwidth [2 ];
	    mem [prevr + 3 ].cint = mem [prevr + 3 ].cint - curactivewidth 
	    [3 ]+ breakwidth [3 ];
	    mem [prevr + 4 ].cint = mem [prevr + 4 ].cint - curactivewidth 
	    [4 ]+ breakwidth [4 ];
	    mem [prevr + 5 ].cint = mem [prevr + 5 ].cint - curactivewidth 
	    [5 ]+ breakwidth [5 ];
	    mem [prevr + 6 ].cint = mem [prevr + 6 ].cint - curactivewidth 
	    [6 ]+ breakwidth [6 ];
	    mem [prevr + 7 ].cint = mem [prevr + 7 ].cint - curactivewidth 
	    [7 ]+ breakwidth [7 ];
	  } 
	  else if ( prevr == memtop - 7 ) 
	  {
	    activewidth [1 ]= breakwidth [1 ];
	    activewidth [2 ]= breakwidth [2 ];
	    activewidth [3 ]= breakwidth [3 ];
	    activewidth [4 ]= breakwidth [4 ];
	    activewidth [5 ]= breakwidth [5 ];
	    activewidth [6 ]= breakwidth [6 ];
	    activewidth [7 ]= breakwidth [7 ];
	  } 
	  else {
	      
	    q = getnode ( 8 ) ;
	    mem [q ].hh .v.RH = r ;
	    mem [q ].hh.b0 = 2 ;
	    mem [q ].hh.b1 = 0 ;
	    mem [q + 1 ].cint = breakwidth [1 ]- curactivewidth [1 ];
	    mem [q + 2 ].cint = breakwidth [2 ]- curactivewidth [2 ];
	    mem [q + 3 ].cint = breakwidth [3 ]- curactivewidth [3 ];
	    mem [q + 4 ].cint = breakwidth [4 ]- curactivewidth [4 ];
	    mem [q + 5 ].cint = breakwidth [5 ]- curactivewidth [5 ];
	    mem [q + 6 ].cint = breakwidth [6 ]- curactivewidth [6 ];
	    mem [q + 7 ].cint = breakwidth [7 ]- curactivewidth [7 ];
	    mem [prevr ].hh .v.RH = q ;
	    prevprevr = prevr ;
	    prevr = q ;
	  } 
	  if ( abs ( eqtb [114377L ].cint ) >= 1073741823L - minimumdemerits 
	  ) 
	  minimumdemerits = 1073741822L ;
	  else minimumdemerits = minimumdemerits + abs ( eqtb [114377L ]
	  .cint ) ;
	  {register integer for_end; fitclass = 0 ;for_end = 3 ; if ( 
	  fitclass <= for_end) do 
	    {
	      if ( minimaldemerits [fitclass ]<= minimumdemerits ) 
	      {
		q = getnode ( 2 ) ;
		mem [q ].hh .v.RH = passive ;
		passive = q ;
		mem [q + 1 ].hh .v.RH = curp ;
	;
#ifdef STAT
		incr ( passnumber ) ;
		mem [q ].hh .v.LH = passnumber ;
#endif /* STAT */
		mem [q + 1 ].hh .v.LH = bestplace [fitclass ];
		q = getnode ( activenodesize ) ;
		mem [q + 1 ].hh .v.RH = passive ;
		mem [q + 1 ].hh .v.LH = bestplline [fitclass ]+ 1 ;
		mem [q ].hh.b1 = fitclass ;
		mem [q ].hh.b0 = breaktype ;
		mem [q + 2 ].cint = minimaldemerits [fitclass ];
		if ( dolastlinefit ) 
		{
		  mem [q + 3 ].cint = bestplshort [fitclass ];
		  mem [q + 4 ].cint = bestplglue [fitclass ];
		} 
		mem [q ].hh .v.RH = r ;
		mem [prevr ].hh .v.RH = q ;
		prevr = q ;
	;
#ifdef STAT
		if ( eqtb [114393L ].cint > 0 ) 
		{
		  printnl ( 1094 ) ;
		  printint ( mem [passive ].hh .v.LH ) ;
		  print ( 1095 ) ;
		  printint ( mem [q + 1 ].hh .v.LH - 1 ) ;
		  printchar ( 46 ) ;
		  printint ( fitclass ) ;
		  if ( breaktype == 1 ) 
		  printchar ( 45 ) ;
		  print ( 1096 ) ;
		  printint ( mem [q + 2 ].cint ) ;
		  if ( dolastlinefit ) 
		  {
		    print ( 1647 ) ;
		    printscaled ( mem [q + 3 ].cint ) ;
		    if ( curp == -1073741823L ) 
		    print ( 1648 ) ;
		    else print ( 1167 ) ;
		    printscaled ( mem [q + 4 ].cint ) ;
		  } 
		  print ( 1097 ) ;
		  if ( mem [passive + 1 ].hh .v.LH == -1073741823L ) 
		  printchar ( 48 ) ;
		  else printint ( mem [mem [passive + 1 ].hh .v.LH ].hh 
		  .v.LH ) ;
		} 
#endif /* STAT */
	      } 
	      minimaldemerits [fitclass ]= 1073741823L ;
	    } 
	  while ( fitclass++ < for_end ) ;} 
	  minimumdemerits = 1073741823L ;
	  if ( r != memtop - 7 ) 
	  {
	    q = getnode ( 8 ) ;
	    mem [q ].hh .v.RH = r ;
	    mem [q ].hh.b0 = 2 ;
	    mem [q ].hh.b1 = 0 ;
	    mem [q + 1 ].cint = curactivewidth [1 ]- breakwidth [1 ];
	    mem [q + 2 ].cint = curactivewidth [2 ]- breakwidth [2 ];
	    mem [q + 3 ].cint = curactivewidth [3 ]- breakwidth [3 ];
	    mem [q + 4 ].cint = curactivewidth [4 ]- breakwidth [4 ];
	    mem [q + 5 ].cint = curactivewidth [5 ]- breakwidth [5 ];
	    mem [q + 6 ].cint = curactivewidth [6 ]- breakwidth [6 ];
	    mem [q + 7 ].cint = curactivewidth [7 ]- breakwidth [7 ];
	    mem [prevr ].hh .v.RH = q ;
	    prevprevr = prevr ;
	    prevr = q ;
	  } 
	} 
	if ( r == memtop - 7 ) 
	goto lab10 ;
	if ( l > easyline ) 
	{
	  linewidth = secondwidth ;
	  oldl = 1073741822L ;
	} 
	else {
	    
	  oldl = l ;
	  if ( l > lastspecialline ) 
	  linewidth = secondwidth ;
	  else if ( eqtb [50458L ].hh .v.RH == -1073741823L ) 
	  linewidth = firstwidth ;
	  else linewidth = mem [eqtb [50458L ].hh .v.RH + 2 * l ].cint ;
	} 
      } 
    } 
    {
      artificialdemerits = false ;
      shortfall = linewidth - curactivewidth [1 ];
      if ( shortfall > 0 ) {
	  
	if ( ( curactivewidth [3 ]!= 0 ) || ( curactivewidth [4 ]!= 0 ) || 
	( curactivewidth [5 ]!= 0 ) || ( curactivewidth [6 ]!= 0 ) ) 
	{
	  if ( dolastlinefit ) 
	  {
	    if ( curp == -1073741823L ) 
	    {
	      if ( ( mem [r + 3 ].cint == 0 ) || ( mem [r + 4 ].cint <= 0 
	      ) ) 
	      goto lab45 ;
	      if ( ( curactivewidth [3 ]!= fillwidth [0 ]) || ( 
	      curactivewidth [4 ]!= fillwidth [1 ]) || ( curactivewidth [
	      5 ]!= fillwidth [2 ]) || ( curactivewidth [6 ]!= fillwidth 
	      [3 ]) ) 
	      goto lab45 ;
	      if ( mem [r + 3 ].cint > 0 ) 
	      g = curactivewidth [2 ];
	      else g = curactivewidth [7 ];
	      if ( g <= 0 ) 
	      goto lab45 ;
	      aritherror = false ;
	      g = fract ( g , mem [r + 3 ].cint , mem [r + 4 ].cint , 
	      1073741823L ) ;
	      if ( eqtb [114436L ].cint < 1000 ) 
	      g = fract ( g , eqtb [114436L ].cint , 1000 , 1073741823L ) ;
	      if ( aritherror ) {
		  
		if ( mem [r + 3 ].cint > 0 ) 
		g = 1073741823L ;
		else g = -1073741823L ;
	      } 
	      if ( g > 0 ) 
	      {
		if ( g > shortfall ) 
		g = shortfall ;
		if ( g > 7230584L ) {
		    
		  if ( curactivewidth [2 ]< 1663497L ) 
		  {
		    b = 10000 ;
		    fitclass = 0 ;
		    goto lab40 ;
		  } 
		} 
		b = badness ( g , curactivewidth [2 ]) ;
		if ( b > 12 ) {
		    
		  if ( b > 99 ) 
		  fitclass = 0 ;
		  else fitclass = 1 ;
		} 
		else fitclass = 2 ;
		goto lab40 ;
	      } 
	      else if ( g < 0 ) 
	      {
		if ( - (integer) g > curactivewidth [7 ]) 
		g = - (integer) curactivewidth [7 ];
		b = badness ( - (integer) g , curactivewidth [7 ]) ;
		if ( b > 12 ) 
		fitclass = 3 ;
		else fitclass = 2 ;
		goto lab40 ;
	      } 
	      lab45: ;
	    } 
	    shortfall = 0 ;
	  } 
	  b = 0 ;
	  fitclass = 2 ;
	} 
	else {
	    
	  if ( shortfall > 7230584L ) {
	      
	    if ( curactivewidth [2 ]< 1663497L ) 
	    {
	      b = 10000 ;
	      fitclass = 0 ;
	      goto lab31 ;
	    } 
	  } 
	  b = badness ( shortfall , curactivewidth [2 ]) ;
	  if ( b > 12 ) {
	      
	    if ( b > 99 ) 
	    fitclass = 0 ;
	    else fitclass = 1 ;
	  } 
	  else fitclass = 2 ;
	  lab31: ;
	} 
      } 
      else {
	  
	if ( - (integer) shortfall > curactivewidth [7 ]) 
	b = 10001 ;
	else b = badness ( - (integer) shortfall , curactivewidth [7 ]) ;
	if ( b > 12 ) 
	fitclass = 3 ;
	else fitclass = 2 ;
      } 
      if ( dolastlinefit ) 
      {
	if ( curp == -1073741823L ) 
	shortfall = 0 ;
	if ( shortfall > 0 ) 
	g = curactivewidth [2 ];
	else if ( shortfall < 0 ) 
	g = curactivewidth [7 ];
	else g = 0 ;
      } 
      lab40: if ( ( b > 10000 ) || ( pi == -10000 ) ) 
      {
	if ( finalpass && ( minimumdemerits == 1073741823L ) && ( mem [r ]
	.hh .v.RH == memtop - 7 ) && ( prevr == memtop - 7 ) ) 
	artificialdemerits = true ;
	else if ( b > threshold ) 
	goto lab60 ;
	noderstaysactive = false ;
      } 
      else {
	  
	prevr = r ;
	if ( b > threshold ) 
	goto lab22 ;
	noderstaysactive = true ;
      } 
      if ( artificialdemerits ) 
      d = 0 ;
      else {
	  
	d = eqtb [114363L ].cint + b ;
	if ( abs ( d ) >= 10000 ) 
	d = 100000000L ;
	else d = d * d ;
	if ( pi != 0 ) {
	    
	  if ( pi > 0 ) 
	  d = d + pi * pi ;
	  else if ( pi > -10000 ) 
	  d = d - pi * pi ;
	} 
	if ( ( breaktype == 1 ) && ( mem [r ].hh.b0 == 1 ) ) {
	    
	  if ( curp != -1073741823L ) 
	  d = d + eqtb [114375L ].cint ;
	  else d = d + eqtb [114376L ].cint ;
	} 
	if ( abs ( fitclass - mem [r ].hh.b1 ) > 1 ) 
	d = d + eqtb [114377L ].cint ;
      } 
	;
#ifdef STAT
      if ( eqtb [114393L ].cint > 0 ) 
      {
	if ( printednode != curp ) 
	{
	  printnl ( 349 ) ;
	  if ( curp == -1073741823L ) 
	  shortdisplay ( mem [printednode ].hh .v.RH ) ;
	  else {
	      
	    savelink = mem [curp ].hh .v.RH ;
	    mem [curp ].hh .v.RH = -1073741823L ;
	    printnl ( 349 ) ;
	    shortdisplay ( mem [printednode ].hh .v.RH ) ;
	    mem [curp ].hh .v.RH = savelink ;
	  } 
	  printednode = curp ;
	} 
	printnl ( 64 ) ;
	if ( curp == -1073741823L ) 
	printesc ( 688 ) ;
	else if ( ( mem [curp ].hh.b0 != 12 ) && ( ! ( curp >= himemmin ) ) 
	) 
	{
	  if ( mem [curp ].hh.b0 == 14 ) 
	  printesc ( 602 ) ;
	  else if ( mem [curp ].hh.b0 == 9 ) 
	  printesc ( 364 ) ;
	  else if ( mem [curp ].hh.b0 == 13 ) 
	  printesc ( 351 ) ;
	  else printesc ( 356 ) ;
	} 
	print ( 1098 ) ;
	if ( mem [r + 1 ].hh .v.RH == -1073741823L ) 
	printchar ( 48 ) ;
	else printint ( mem [mem [r + 1 ].hh .v.RH ].hh .v.LH ) ;
	print ( 1099 ) ;
	if ( b > 10000 ) 
	printchar ( 42 ) ;
	else printint ( b ) ;
	print ( 1100 ) ;
	printint ( pi ) ;
	print ( 1101 ) ;
	if ( artificialdemerits ) 
	printchar ( 42 ) ;
	else printint ( d ) ;
      } 
#endif /* STAT */
      d = d + mem [r + 2 ].cint ;
      if ( d <= minimaldemerits [fitclass ]) 
      {
	minimaldemerits [fitclass ]= d ;
	bestplace [fitclass ]= mem [r + 1 ].hh .v.RH ;
	bestplline [fitclass ]= l ;
	if ( dolastlinefit ) 
	{
	  bestplshort [fitclass ]= shortfall ;
	  bestplglue [fitclass ]= g ;
	} 
	if ( d < minimumdemerits ) 
	minimumdemerits = d ;
      } 
      if ( noderstaysactive ) 
      goto lab22 ;
      lab60: mem [prevr ].hh .v.RH = mem [r ].hh .v.RH ;
      freenode ( r , activenodesize ) ;
      if ( prevr == memtop - 7 ) 
      {
	r = mem [memtop - 7 ].hh .v.RH ;
	if ( mem [r ].hh.b0 == 2 ) 
	{
	  activewidth [1 ]= activewidth [1 ]+ mem [r + 1 ].cint ;
	  activewidth [2 ]= activewidth [2 ]+ mem [r + 2 ].cint ;
	  activewidth [3 ]= activewidth [3 ]+ mem [r + 3 ].cint ;
	  activewidth [4 ]= activewidth [4 ]+ mem [r + 4 ].cint ;
	  activewidth [5 ]= activewidth [5 ]+ mem [r + 5 ].cint ;
	  activewidth [6 ]= activewidth [6 ]+ mem [r + 6 ].cint ;
	  activewidth [7 ]= activewidth [7 ]+ mem [r + 7 ].cint ;
	  curactivewidth [1 ]= activewidth [1 ];
	  curactivewidth [2 ]= activewidth [2 ];
	  curactivewidth [3 ]= activewidth [3 ];
	  curactivewidth [4 ]= activewidth [4 ];
	  curactivewidth [5 ]= activewidth [5 ];
	  curactivewidth [6 ]= activewidth [6 ];
	  curactivewidth [7 ]= activewidth [7 ];
	  mem [memtop - 7 ].hh .v.RH = mem [r ].hh .v.RH ;
	  freenode ( r , 8 ) ;
	} 
      } 
      else if ( mem [prevr ].hh.b0 == 2 ) 
      {
	r = mem [prevr ].hh .v.RH ;
	if ( r == memtop - 7 ) 
	{
	  curactivewidth [1 ]= curactivewidth [1 ]- mem [prevr + 1 ]
	  .cint ;
	  curactivewidth [2 ]= curactivewidth [2 ]- mem [prevr + 2 ]
	  .cint ;
	  curactivewidth [3 ]= curactivewidth [3 ]- mem [prevr + 3 ]
	  .cint ;
	  curactivewidth [4 ]= curactivewidth [4 ]- mem [prevr + 4 ]
	  .cint ;
	  curactivewidth [5 ]= curactivewidth [5 ]- mem [prevr + 5 ]
	  .cint ;
	  curactivewidth [6 ]= curactivewidth [6 ]- mem [prevr + 6 ]
	  .cint ;
	  curactivewidth [7 ]= curactivewidth [7 ]- mem [prevr + 7 ]
	  .cint ;
	  mem [prevprevr ].hh .v.RH = memtop - 7 ;
	  freenode ( prevr , 8 ) ;
	  prevr = prevprevr ;
	} 
	else if ( mem [r ].hh.b0 == 2 ) 
	{
	  curactivewidth [1 ]= curactivewidth [1 ]+ mem [r + 1 ].cint ;
	  curactivewidth [2 ]= curactivewidth [2 ]+ mem [r + 2 ].cint ;
	  curactivewidth [3 ]= curactivewidth [3 ]+ mem [r + 3 ].cint ;
	  curactivewidth [4 ]= curactivewidth [4 ]+ mem [r + 4 ].cint ;
	  curactivewidth [5 ]= curactivewidth [5 ]+ mem [r + 5 ].cint ;
	  curactivewidth [6 ]= curactivewidth [6 ]+ mem [r + 6 ].cint ;
	  curactivewidth [7 ]= curactivewidth [7 ]+ mem [r + 7 ].cint ;
	  mem [prevr + 1 ].cint = mem [prevr + 1 ].cint + mem [r + 1 ]
	  .cint ;
	  mem [prevr + 2 ].cint = mem [prevr + 2 ].cint + mem [r + 2 ]
	  .cint ;
	  mem [prevr + 3 ].cint = mem [prevr + 3 ].cint + mem [r + 3 ]
	  .cint ;
	  mem [prevr + 4 ].cint = mem [prevr + 4 ].cint + mem [r + 4 ]
	  .cint ;
	  mem [prevr + 5 ].cint = mem [prevr + 5 ].cint + mem [r + 5 ]
	  .cint ;
	  mem [prevr + 6 ].cint = mem [prevr + 6 ].cint + mem [r + 6 ]
	  .cint ;
	  mem [prevr + 7 ].cint = mem [prevr + 7 ].cint + mem [r + 7 ]
	  .cint ;
	  mem [prevr ].hh .v.RH = mem [r ].hh .v.RH ;
	  freenode ( r , 8 ) ;
	} 
      } 
    } 
  } 
  lab10: 
	;
#ifdef STAT
  if ( curp == printednode ) {
      
    if ( curp != -1073741823L ) {
	
      if ( mem [curp ].hh.b0 == 9 ) 
      {
	t = mem [curp ].hh.b1 ;
	while ( t > 0 ) {
	    
	  decr ( t ) ;
	  printednode = mem [printednode ].hh .v.RH ;
	} 
      } 
#endif /* STAT */
    } 
  } 
} 
void 
zpostlinebreak ( boolean d ) 
{
  /* 30 31 */ postlinebreak_regmem 
  halfword q, r, s  ;
  boolean discbreak  ;
  boolean postdiscbreak  ;
  scaled curwidth  ;
  scaled curindent  ;
  quarterword t  ;
  integer pen  ;
  halfword curline  ;
  halfword LRptr  ;
  LRptr = curlist .eTeXauxfield ;
  q = mem [bestbet + 1 ].hh .v.RH ;
  curp = -1073741823L ;
  do {
      r = q ;
    q = mem [q + 1 ].hh .v.LH ;
    mem [r + 1 ].hh .v.LH = curp ;
    curp = r ;
  } while ( ! ( q == -1073741823L ) ) ;
  curline = curlist .pgfield + 1 ;
  lastdisp = 0 ;
  do {
      if ( ( eqtb [114444L ].cint > 0 ) ) 
    {
      q = mem [memtop - 3 ].hh .v.RH ;
      if ( LRptr != -1073741823L ) 
      {
	tempptr = LRptr ;
	r = q ;
	do {
	    s = newmath ( 0 , ( mem [tempptr ].hh .v.LH - 1 ) ) ;
	  mem [s ].hh .v.RH = r ;
	  r = s ;
	  tempptr = mem [tempptr ].hh .v.RH ;
	} while ( ! ( tempptr == -1073741823L ) ) ;
	mem [memtop - 3 ].hh .v.RH = r ;
      } 
      while ( q != mem [curp + 1 ].hh .v.RH ) {
	  
	if ( ! ( q >= himemmin ) ) {
	    
	  if ( mem [q ].hh.b0 == 11 ) {
	      
	    if ( odd ( mem [q ].hh.b1 ) ) 
	    {
	      if ( LRptr != -1073741823L ) {
		  
		if ( mem [LRptr ].hh .v.LH == ( 4 * ( mem [q ].hh.b1 / 4 ) 
		+ 3 ) ) 
		{
		  tempptr = LRptr ;
		  LRptr = mem [tempptr ].hh .v.RH ;
		  {
		    mem [tempptr ].hh .v.RH = avail ;
		    avail = tempptr ;
	;
#ifdef STAT
		    decr ( dynused ) ;
#endif /* STAT */
		  } 
		} 
	      } 
	    } 
	    else {
		
	      tempptr = getavail () ;
	      mem [tempptr ].hh .v.LH = ( 4 * ( mem [q ].hh.b1 / 4 ) + 3 ) 
	      ;
	      mem [tempptr ].hh .v.RH = LRptr ;
	      LRptr = tempptr ;
	    } 
	  } 
	} 
	q = mem [q ].hh .v.RH ;
      } 
    } 
    q = mem [curp + 1 ].hh .v.RH ;
    discbreak = false ;
    postdiscbreak = false ;
    if ( q != -1073741823L ) 
    {
      if ( ! ( q >= himemmin ) ) {
	  
	if ( mem [q ].hh.b0 == 12 ) 
	{
	  deleteglueref ( mem [q + 1 ].hh .v.LH ) ;
	  mem [q + 1 ].hh .v.LH = eqtb [49933L ].hh .v.RH ;
	  mem [q ].hh.b1 = 9 ;
	  incr ( mem [eqtb [49933L ].hh .v.RH ].hh .v.RH ) ;
	  goto lab30 ;
	} 
	else {
	    
	  if ( mem [q ].hh.b0 == 9 ) 
	  {
	    t = mem [q ].hh.b1 ;
	    if ( t == 0 ) 
	    r = mem [q ].hh .v.RH ;
	    else {
		
	      r = q ;
	      while ( t > 1 ) {
		  
		r = mem [r ].hh .v.RH ;
		decr ( t ) ;
	      } 
	      s = mem [r ].hh .v.RH ;
	      r = mem [s ].hh .v.RH ;
	      mem [s ].hh .v.RH = -1073741823L ;
	      flushnodelist ( mem [q ].hh .v.RH ) ;
	      mem [q ].hh.b1 = 0 ;
	    } 
	    if ( mem [q + 1 ].hh .v.RH != -1073741823L ) 
	    {
	      s = mem [q + 1 ].hh .v.RH ;
	      while ( mem [s ].hh .v.RH != -1073741823L ) s = mem [s ].hh 
	      .v.RH ;
	      mem [s ].hh .v.RH = r ;
	      r = mem [q + 1 ].hh .v.RH ;
	      mem [q + 1 ].hh .v.RH = -1073741823L ;
	      postdiscbreak = true ;
	    } 
	    if ( mem [q + 1 ].hh .v.LH != -1073741823L ) 
	    {
	      s = mem [q + 1 ].hh .v.LH ;
	      mem [q ].hh .v.RH = s ;
	      while ( mem [s ].hh .v.RH != -1073741823L ) s = mem [s ].hh 
	      .v.RH ;
	      mem [q + 1 ].hh .v.LH = -1073741823L ;
	      q = s ;
	    } 
	    mem [q ].hh .v.RH = r ;
	    discbreak = true ;
	  } 
	  else if ( mem [q ].hh.b0 == 13 ) 
	  mem [q + 1 ].cint = 0 ;
	  else if ( mem [q ].hh.b0 == 11 ) 
	  {
	    mem [q + 1 ].cint = 0 ;
	    if ( ( eqtb [114444L ].cint > 0 ) ) {
		
	      if ( odd ( mem [q ].hh.b1 ) ) 
	      {
		if ( LRptr != -1073741823L ) {
		    
		  if ( mem [LRptr ].hh .v.LH == ( 4 * ( mem [q ].hh.b1 / 4 
		  ) + 3 ) ) 
		  {
		    tempptr = LRptr ;
		    LRptr = mem [tempptr ].hh .v.RH ;
		    {
		      mem [tempptr ].hh .v.RH = avail ;
		      avail = tempptr ;
	;
#ifdef STAT
		      decr ( dynused ) ;
#endif /* STAT */
		    } 
		  } 
		} 
	      } 
	      else {
		  
		tempptr = getavail () ;
		mem [tempptr ].hh .v.LH = ( 4 * ( mem [q ].hh.b1 / 4 ) + 3 
		) ;
		mem [tempptr ].hh .v.RH = LRptr ;
		LRptr = tempptr ;
	      } 
	    } 
	  } 
	} 
      } 
    } 
    else {
	
      q = memtop - 3 ;
      while ( mem [q ].hh .v.RH != -1073741823L ) q = mem [q ].hh .v.RH ;
    } 
    r = newparamglue ( 8 ) ;
    mem [r ].hh .v.RH = mem [q ].hh .v.RH ;
    mem [q ].hh .v.RH = r ;
    q = r ;
    lab30: ;
    if ( ( eqtb [114444L ].cint > 0 ) ) {
	
      if ( LRptr != -1073741823L ) 
      {
	s = memtop - 3 ;
	r = mem [s ].hh .v.RH ;
	while ( r != q ) {
	    
	  s = r ;
	  r = mem [s ].hh .v.RH ;
	} 
	r = LRptr ;
	while ( r != -1073741823L ) {
	    
	  tempptr = newmath ( 0 , mem [r ].hh .v.LH ) ;
	  mem [s ].hh .v.RH = tempptr ;
	  s = tempptr ;
	  r = mem [r ].hh .v.RH ;
	} 
	mem [s ].hh .v.RH = q ;
      } 
    } 
    r = mem [q ].hh .v.RH ;
    mem [q ].hh .v.RH = -1073741823L ;
    q = mem [memtop - 3 ].hh .v.RH ;
    mem [memtop - 3 ].hh .v.RH = r ;
    if ( lastdisp != 0 ) 
    {
      r = getnode ( 2 ) ;
      mem [r ].hh.b0 = 5 ;
      mem [r + 1 ].cint = lastdisp ;
      mem [r ].hh .v.RH = q ;
      q = r ;
      curlist .dispcalledfield = true ;
    } 
    if ( eqtb [49932L ].hh .v.RH != membot ) 
    {
      r = newparamglue ( 7 ) ;
      mem [r ].hh .v.RH = q ;
      q = r ;
    } 
    if ( curline > lastspecialline ) 
    {
      curwidth = secondwidth ;
      curindent = secondindent ;
    } 
    else if ( eqtb [50458L ].hh .v.RH == -1073741823L ) 
    {
      curwidth = firstwidth ;
      curindent = firstindent ;
    } 
    else {
	
      curwidth = mem [eqtb [50458L ].hh .v.RH + 2 * curline ].cint ;
      curindent = mem [eqtb [50458L ].hh .v.RH + 2 * curline - 1 ].cint ;
    } 
    adjusttail = memtop - 5 ;
    preadjusttail = memtop - 14 ;
    justbox = hpack ( q , curwidth , 0 ) ;
    mem [justbox + 4 ].cint = curindent ;
    if ( memtop - 14 != preadjusttail ) 
    {
      mem [curlist .tailfield ].hh .v.RH = mem [memtop - 14 ].hh .v.RH ;
      curlist .tailfield = preadjusttail ;
    } 
    preadjusttail = -1073741823L ;
    appendtovlist ( justbox ) ;
    if ( memtop - 5 != adjusttail ) 
    {
      mem [curlist .tailfield ].hh .v.RH = mem [memtop - 5 ].hh .v.RH ;
      curlist .tailfield = adjusttail ;
    } 
    adjusttail = -1073741823L ;
    if ( curline + 1 != bestline ) 
    {
      q = eqtb [50725L ].hh .v.RH ;
      if ( q != -1073741823L ) 
      {
	r = curline ;
	if ( r > mem [q + 1 ].cint ) 
	r = mem [q + 1 ].cint ;
	pen = mem [q + r + 1 ].cint ;
      } 
      else pen = eqtb [114374L ].cint ;
      q = eqtb [50726L ].hh .v.RH ;
      if ( q != -1073741823L ) 
      {
	r = curline - curlist .pgfield ;
	if ( r > mem [q + 1 ].cint ) 
	r = mem [q + 1 ].cint ;
	pen = pen + mem [q + r + 1 ].cint ;
      } 
      else if ( curline == curlist .pgfield + 1 ) 
      pen = pen + eqtb [114366L ].cint ;
      if ( d ) 
      q = eqtb [50728L ].hh .v.RH ;
      else q = eqtb [50727L ].hh .v.RH ;
      if ( q != -1073741823L ) 
      {
	r = bestline - curline - 1 ;
	if ( r > mem [q + 1 ].cint ) 
	r = mem [q + 1 ].cint ;
	pen = pen + mem [q + r + 1 ].cint ;
      } 
      else if ( curline + 2 == bestline ) {
	  
	if ( d ) 
	pen = pen + eqtb [114368L ].cint ;
	else pen = pen + eqtb [114367L ].cint ;
      } 
      if ( discbreak ) 
      pen = pen + eqtb [114369L ].cint ;
      if ( pen != 0 ) 
      {
	r = newpenalty ( pen ) ;
	mem [curlist .tailfield ].hh .v.RH = r ;
	curlist .tailfield = r ;
      } 
    } 
    incr ( curline ) ;
    curp = mem [curp + 1 ].hh .v.LH ;
    if ( curp != -1073741823L ) {
	
      if ( ! postdiscbreak ) 
      {
	r = memtop - 3 ;
	while ( true ) {
	    
	  q = mem [r ].hh .v.RH ;
	  if ( q == mem [curp + 1 ].hh .v.RH ) 
	  goto lab31 ;
	  if ( ( q >= himemmin ) ) 
	  goto lab31 ;
	  if ( ( mem [q ].hh.b0 < 11 ) ) 
	  goto lab31 ;
	  if ( mem [q ].hh.b0 == 13 ) {
	      
	    if ( ( mem [q ].hh.b1 != 1 ) && ( mem [q ].hh.b1 != 3 ) ) 
	    goto lab31 ;
	  } 
	  r = q ;
	  if ( mem [q ].hh.b0 == 11 ) {
	      
	    if ( ( eqtb [114444L ].cint > 0 ) ) {
		
	      if ( odd ( mem [q ].hh.b1 ) ) 
	      {
		if ( LRptr != -1073741823L ) {
		    
		  if ( mem [LRptr ].hh .v.LH == ( 4 * ( mem [q ].hh.b1 / 4 
		  ) + 3 ) ) 
		  {
		    tempptr = LRptr ;
		    LRptr = mem [tempptr ].hh .v.RH ;
		    {
		      mem [tempptr ].hh .v.RH = avail ;
		      avail = tempptr ;
	;
#ifdef STAT
		      decr ( dynused ) ;
#endif /* STAT */
		    } 
		  } 
		} 
	      } 
	      else {
		  
		tempptr = getavail () ;
		mem [tempptr ].hh .v.LH = ( 4 * ( mem [q ].hh.b1 / 4 ) + 3 
		) ;
		mem [tempptr ].hh .v.RH = LRptr ;
		LRptr = tempptr ;
	      } 
	    } 
	  } 
	} 
	lab31: if ( r != memtop - 3 ) 
	{
	  mem [r ].hh .v.RH = -1073741823L ;
	  flushnodelist ( mem [memtop - 3 ].hh .v.RH ) ;
	  mem [memtop - 3 ].hh .v.RH = q ;
	} 
      } 
    } 
  } while ( ! ( curp == -1073741823L ) ) ;
  if ( ( curline != bestline ) || ( mem [memtop - 3 ].hh .v.RH != 
  -1073741823L ) ) 
  confusion ( 1108 ) ;
  curlist .pgfield = bestline - 1 ;
  curlist .eTeXauxfield = LRptr ;
} 
smallnumber 
zreconstitute ( smallnumber j , smallnumber n , halfword bchar , halfword 
hchar ) 
{
  /* 22 30 */ register smallnumber Result; reconstitute_regmem 
  halfword p  ;
  halfword t  ;
  fourquarters q  ;
  halfword currh  ;
  halfword testchar  ;
  scaled w  ;
  fontindex k  ;
  hyphenpassed = 0 ;
  t = memtop - 4 ;
  w = 0 ;
  mem [memtop - 4 ].hh .v.RH = -1073741823L ;
  curl = hu [j ];
  curq = t ;
  if ( j == 0 ) 
  {
    ligaturepresent = initlig ;
    p = initlist ;
    if ( ligaturepresent ) 
    lfthit = initlft ;
    while ( p > -1073741823L ) {
	
      {
	mem [t ].hh .v.RH = getavail () ;
	t = mem [t ].hh .v.RH ;
	mem [t ].hh.b0 = hf ;
	mem [t ].hh.b1 = mem [p ].hh.b1 ;
      } 
      p = mem [p ].hh .v.RH ;
    } 
  } 
  else if ( curl < 11904 ) 
  {
    mem [t ].hh .v.RH = getavail () ;
    t = mem [t ].hh .v.RH ;
    mem [t ].hh.b0 = hf ;
    mem [t ].hh.b1 = curl ;
  } 
  ligstack = -1073741823L ;
  {
    if ( j < n ) 
    curr = hu [j + 1 ];
    else curr = bchar ;
    if ( odd ( hyf [j ]) ) 
    currh = hchar ;
    else currh = 11904 ;
  } 
  lab22: if ( curl == 11904 ) 
  {
    k = bcharlabel [hf ];
    if ( k == 0 ) 
    goto lab30 ;
    else q = fontinfo [k ].qqqq ;
  } 
  else {
      
    q = fontinfo [charbase [hf ]+ effectivechar ( true , hf , 
    ptencucsto8bitcode ( fontenc [hf ], curl ) ) ].qqqq ;
    if ( ( ( q .b2 ) % 4 ) != 1 ) 
    goto lab30 ;
    k = ligkernbase [hf ]+ q .b3 ;
    q = fontinfo [k ].qqqq ;
    if ( q .b0 > 128 ) 
    {
      k = ligkernbase [hf ]+ 256 * q .b2 + q .b3 + 32768L - 256 * ( 128 ) ;
      q = fontinfo [k ].qqqq ;
    } 
  } 
  if ( currh < 11904 ) 
  testchar = currh ;
  else testchar = curr ;
  while ( true ) {
      
    if ( q .b1 == testchar ) {
	
      if ( q .b0 <= 128 ) {
	  
	if ( currh < 11904 ) 
	{
	  hyphenpassed = j ;
	  hchar = 11904 ;
	  currh = 11904 ;
	  goto lab22 ;
	} 
	else {
	    
	  if ( hchar < 11904 ) {
	      
	    if ( odd ( hyf [j ]) ) 
	    {
	      hyphenpassed = j ;
	      hchar = 11904 ;
	    } 
	  } 
	  if ( q .b2 < 128 ) 
	  {
	    if ( curl == 11904 ) 
	    lfthit = true ;
	    if ( j == n ) {
		
	      if ( ligstack == -1073741823L ) 
	      rthit = true ;
	    } 
	    {
	      if ( interrupt != 0 ) 
	      pauseforinstructions () ;
	    } 
	    switch ( q .b2 ) 
	    {case 1 : 
	    case 5 : 
	      {
		curl = q .b3 ;
		ligaturepresent = true ;
	      } 
	      break ;
	    case 2 : 
	    case 6 : 
	      {
		curr = q .b3 ;
		if ( ligstack > -1073741823L ) 
		mem [ligstack ].hh.b1 = curr ;
		else {
		    
		  ligstack = newligitem ( curr ) ;
		  if ( j == n ) 
		  bchar = 11904 ;
		  else {
		      
		    p = getavail () ;
		    mem [ligstack + 1 ].hh .v.RH = p ;
		    mem [p ].hh.b1 = hu [j + 1 ];
		    mem [p ].hh.b0 = hf ;
		  } 
		} 
	      } 
	      break ;
	    case 3 : 
	      {
		curr = q .b3 ;
		p = ligstack ;
		ligstack = newligitem ( curr ) ;
		mem [ligstack ].hh .v.RH = p ;
	      } 
	      break ;
	    case 7 : 
	    case 11 : 
	      {
		if ( ligaturepresent ) 
		{
		  p = newligature ( hf , curl , mem [curq ].hh .v.RH ) ;
		  if ( lfthit ) 
		  {
		    mem [p ].hh.b1 = 2 ;
		    lfthit = false ;
		  } 
		  if ( false ) {
		      
		    if ( ligstack == -1073741823L ) 
		    {
		      incr ( mem [p ].hh.b1 ) ;
		      rthit = false ;
		    } 
		  } 
		  mem [curq ].hh .v.RH = p ;
		  t = p ;
		  ligaturepresent = false ;
		} 
		curq = t ;
		curl = q .b3 ;
		ligaturepresent = true ;
	      } 
	      break ;
	      default: 
	      {
		curl = q .b3 ;
		ligaturepresent = true ;
		if ( ligstack > -1073741823L ) 
		{
		  if ( mem [ligstack + 1 ].hh .v.RH > -1073741823L ) 
		  {
		    mem [t ].hh .v.RH = mem [ligstack + 1 ].hh .v.RH ;
		    t = mem [t ].hh .v.RH ;
		    incr ( j ) ;
		  } 
		  p = ligstack ;
		  ligstack = mem [p ].hh .v.RH ;
		  freenode ( p , 2 ) ;
		  if ( ligstack == -1073741823L ) 
		  {
		    if ( j < n ) 
		    curr = hu [j + 1 ];
		    else curr = bchar ;
		    if ( odd ( hyf [j ]) ) 
		    currh = hchar ;
		    else currh = 11904 ;
		  } 
		  else curr = mem [ligstack ].hh.b1 ;
		} 
		else if ( j == n ) 
		goto lab30 ;
		else {
		    
		  {
		    mem [t ].hh .v.RH = getavail () ;
		    t = mem [t ].hh .v.RH ;
		    mem [t ].hh.b0 = hf ;
		    mem [t ].hh.b1 = curr ;
		  } 
		  incr ( j ) ;
		  {
		    if ( j < n ) 
		    curr = hu [j + 1 ];
		    else curr = bchar ;
		    if ( odd ( hyf [j ]) ) 
		    currh = hchar ;
		    else currh = 11904 ;
		  } 
		} 
	      } 
	      break ;
	    } 
	    if ( q .b2 > 4 ) {
		
	      if ( q .b2 != 7 ) 
	      goto lab30 ;
	    } 
	    goto lab22 ;
	  } 
	  w = fontinfo [kernbase [hf ]+ 256 * q .b2 + q .b3 ].cint ;
	  goto lab30 ;
	} 
      } 
    } 
    if ( q .b0 >= 128 ) {
	
      if ( currh == 11904 ) 
      goto lab30 ;
      else {
	  
	currh = 11904 ;
	goto lab22 ;
      } 
    } 
    k = k + q .b0 + 1 ;
    q = fontinfo [k ].qqqq ;
  } 
  lab30: ;
  if ( ligaturepresent ) 
  {
    p = newligature ( hf , curl , mem [curq ].hh .v.RH ) ;
    if ( lfthit ) 
    {
      mem [p ].hh.b1 = 2 ;
      lfthit = false ;
    } 
    if ( rthit ) {
	
      if ( ligstack == -1073741823L ) 
      {
	incr ( mem [p ].hh.b1 ) ;
	rthit = false ;
      } 
    } 
    mem [curq ].hh .v.RH = p ;
    t = p ;
    ligaturepresent = false ;
  } 
  if ( w != 0 ) 
  {
    mem [t ].hh .v.RH = newkern ( w ) ;
    t = mem [t ].hh .v.RH ;
    w = 0 ;
    mem [t + 2 ].cint = 0 ;
  } 
  if ( ligstack > -1073741823L ) 
  {
    curq = t ;
    curl = mem [ligstack ].hh.b1 ;
    ligaturepresent = true ;
    {
      if ( mem [ligstack + 1 ].hh .v.RH > -1073741823L ) 
      {
	mem [t ].hh .v.RH = mem [ligstack + 1 ].hh .v.RH ;
	t = mem [t ].hh .v.RH ;
	incr ( j ) ;
      } 
      p = ligstack ;
      ligstack = mem [p ].hh .v.RH ;
      freenode ( p , 2 ) ;
      if ( ligstack == -1073741823L ) 
      {
	if ( j < n ) 
	curr = hu [j + 1 ];
	else curr = bchar ;
	if ( odd ( hyf [j ]) ) 
	currh = hchar ;
	else currh = 11904 ;
      } 
      else curr = mem [ligstack ].hh.b1 ;
    } 
    goto lab22 ;
  } 
  Result = j ;
  return Result ;
} 
void 
hyphenate ( void ) 
{
  /* 50 30 40 41 42 45 10 */ hyphenate_regmem 
  unsigned char i, j, l  ;
  halfword q, r, s  ;
  halfword bchar  ;
  halfword majortail, minortail  ;
  sixteenbits c  ;
  unsigned char cloc  ;
  integer rcount  ;
  halfword hyfnode  ;
  triepointer z  ;
  integer v  ;
  hyphpointer h  ;
  strnumber k  ;
  poolpointer u  ;
  {register integer for_end; j = 0 ;for_end = hn ; if ( j <= for_end) do 
    hyf [j ]= 0 ;
  while ( j++ < for_end ) ;} 
  h = hc [1 ];
  incr ( hn ) ;
  hc [hn ]= curlang ;
  {register integer for_end; j = 2 ;for_end = hn ; if ( j <= for_end) do 
    h = ( h + h + hc [j ]) % 607 ;
  while ( j++ < for_end ) ;} 
  while ( true ) {
      
    k = hyphword [h ];
    if ( k == 0 ) 
    goto lab45 ;
    if ( ( strstart [k + 1 ]- strstart [k ]) == hn ) 
    {
      j = 1 ;
      u = strstart [k ];
      do {
	  if ( strpool [u ]!= hc [j ]) 
	goto lab30 ;
	incr ( j ) ;
	incr ( u ) ;
      } while ( ! ( j > hn ) ) ;
      s = hyphlist [h ];
      while ( s != -1073741823L ) {
	  
	hyf [mem [s ].hh .v.LH ]= 1 ;
	s = mem [s ].hh .v.RH ;
      } 
      decr ( hn ) ;
      goto lab40 ;
    } 
    lab30: ;
    h = hyphlink [h ];
    if ( h == 0 ) 
    goto lab45 ;
    decr ( h ) ;
  } 
  lab45: decr ( hn ) ;
  if ( trietrc [curlang + 1 ]!= curlang ) 
  return ;
  hc [0 ]= 0 ;
  hc [hn + 1 ]= 0 ;
  hc [hn + 2 ]= 11904 ;
  {register integer for_end; j = 0 ;for_end = hn - rhyf + 1 ; if ( j <= 
  for_end) do 
    {
      z = trietrl [curlang + 1 ]+ hc [j ];
      l = j ;
      while ( hc [l ]== trietrc [z ]) {
	  
	if ( trietro [z ]!= mintrieop ) 
	{
	  v = trietro [z ];
	  do {
	      v = v + opstart [curlang ];
	    i = l - hyfdistance [v ];
	    if ( hyfnum [v ]> hyf [i ]) 
	    hyf [i ]= hyfnum [v ];
	    v = hyfnext [v ];
	  } while ( ! ( v == mintrieop ) ) ;
	} 
	incr ( l ) ;
	z = trietrl [z ]+ hc [l ];
      } 
    } 
  while ( j++ < for_end ) ;} 
  lab40: {
      register integer for_end; j = 0 ;for_end = lhyf - 1 ; if ( j <= 
  for_end) do 
    hyf [j ]= 0 ;
  while ( j++ < for_end ) ;} 
  {register integer for_end; j = 0 ;for_end = rhyf - 1 ; if ( j <= for_end) 
  do 
    hyf [hn - j ]= 0 ;
  while ( j++ < for_end ) ;} 
  {register integer for_end; j = lhyf ;for_end = hn - rhyf ; if ( j <= 
  for_end) do 
    if ( odd ( hyf [j ]) ) 
    goto lab41 ;
  while ( j++ < for_end ) ;} 
  return ;
  lab41: ;
  q = mem [hb ].hh .v.RH ;
  mem [hb ].hh .v.RH = -1073741823L ;
  r = mem [ha ].hh .v.RH ;
  mem [ha ].hh .v.RH = -1073741823L ;
  bchar = hyfbchar ;
  if ( ( ha >= himemmin ) ) {
      
    if ( mem [ha ].hh.b0 != hf ) 
    goto lab42 ;
    else {
	
      initlist = ha ;
      initlig = false ;
      hu [0 ]= mem [ha ].hh.b1 ;
    } 
  } 
  else if ( mem [ha ].hh.b0 == 8 ) {
      
    if ( mem [ha + 1 ].hh.b0 != hf ) 
    goto lab42 ;
    else {
	
      initlist = mem [ha + 1 ].hh .v.RH ;
      initlig = true ;
      initlft = ( mem [ha ].hh.b1 > 1 ) ;
      hu [0 ]= mem [ha + 1 ].hh.b1 ;
      if ( initlist == -1073741823L ) {
	  
	if ( initlft ) 
	{
	  hu [0 ]= 11904 ;
	  initlig = false ;
	} 
      } 
      freenode ( ha , 2 ) ;
    } 
  } 
  else {
      
    if ( ! ( r >= himemmin ) ) {
	
      if ( mem [r ].hh.b0 == 8 ) {
	  
	if ( mem [r ].hh.b1 > 1 ) 
	goto lab42 ;
      } 
    } 
    j = 1 ;
    s = ha ;
    initlist = -1073741823L ;
    goto lab50 ;
  } 
  s = curp ;
  while ( mem [s ].hh .v.RH != ha ) s = mem [s ].hh .v.RH ;
  j = 0 ;
  goto lab50 ;
  lab42: s = ha ;
  j = 0 ;
  hu [0 ]= 11904 ;
  initlig = false ;
  initlist = -1073741823L ;
  lab50: flushnodelist ( r ) ;
  do {
      l = j ;
    j = reconstitute ( j , hn , bchar , hyfchar ) + 1 ;
    if ( hyphenpassed == 0 ) 
    {
      mem [s ].hh .v.RH = mem [memtop - 4 ].hh .v.RH ;
      while ( mem [s ].hh .v.RH > -1073741823L ) s = mem [s ].hh .v.RH ;
      if ( odd ( hyf [j - 1 ]) ) 
      {
	l = j ;
	hyphenpassed = j - 1 ;
	mem [memtop - 4 ].hh .v.RH = -1073741823L ;
      } 
    } 
    if ( hyphenpassed > 0 ) 
    do {
	r = getnode ( 2 ) ;
      mem [r ].hh .v.RH = mem [memtop - 4 ].hh .v.RH ;
      mem [r ].hh.b0 = 9 ;
      majortail = r ;
      rcount = 0 ;
      while ( mem [majortail ].hh .v.RH > -1073741823L ) {
	  
	majortail = mem [majortail ].hh .v.RH ;
	incr ( rcount ) ;
      } 
      i = hyphenpassed ;
      hyf [i ]= 0 ;
      minortail = -1073741823L ;
      mem [r + 1 ].hh .v.LH = -1073741823L ;
      hyfnode = newcharacter ( hf , hyfchar ) ;
      if ( hyfnode != -1073741823L ) 
      {
	incr ( i ) ;
	c = hu [i ];
	hu [i ]= hyfchar ;
	{
	  mem [hyfnode ].hh .v.RH = avail ;
	  avail = hyfnode ;
	;
#ifdef STAT
	  decr ( dynused ) ;
#endif /* STAT */
	} 
      } 
      while ( l <= i ) {
	  
	l = reconstitute ( l , i , fontbchar [hf ], 11904 ) + 1 ;
	if ( mem [memtop - 4 ].hh .v.RH > -1073741823L ) 
	{
	  if ( minortail == -1073741823L ) 
	  mem [r + 1 ].hh .v.LH = mem [memtop - 4 ].hh .v.RH ;
	  else mem [minortail ].hh .v.RH = mem [memtop - 4 ].hh .v.RH ;
	  minortail = mem [memtop - 4 ].hh .v.RH ;
	  while ( mem [minortail ].hh .v.RH > -1073741823L ) minortail = mem 
	  [minortail ].hh .v.RH ;
	} 
      } 
      if ( hyfnode != -1073741823L ) 
      {
	hu [i ]= c ;
	l = i ;
	decr ( i ) ;
      } 
      minortail = -1073741823L ;
      mem [r + 1 ].hh .v.RH = -1073741823L ;
      cloc = 0 ;
      if ( bcharlabel [hf ]!= 0 ) 
      {
	decr ( l ) ;
	c = hu [l ];
	cloc = l ;
	hu [l ]= 11904 ;
      } 
      while ( l < j ) {
	  
	do {
	    l = reconstitute ( l , hn , bchar , 11904 ) + 1 ;
	  if ( cloc > 0 ) 
	  {
	    hu [cloc ]= c ;
	    cloc = 0 ;
	  } 
	  if ( mem [memtop - 4 ].hh .v.RH > -1073741823L ) 
	  {
	    if ( minortail == -1073741823L ) 
	    mem [r + 1 ].hh .v.RH = mem [memtop - 4 ].hh .v.RH ;
	    else mem [minortail ].hh .v.RH = mem [memtop - 4 ].hh .v.RH ;
	    minortail = mem [memtop - 4 ].hh .v.RH ;
	    while ( mem [minortail ].hh .v.RH > -1073741823L ) minortail = 
	    mem [minortail ].hh .v.RH ;
	  } 
	} while ( ! ( l >= j ) ) ;
	while ( l > j ) {
	    
	  j = reconstitute ( j , hn , bchar , 11904 ) + 1 ;
	  mem [majortail ].hh .v.RH = mem [memtop - 4 ].hh .v.RH ;
	  while ( mem [majortail ].hh .v.RH > -1073741823L ) {
	      
	    majortail = mem [majortail ].hh .v.RH ;
	    incr ( rcount ) ;
	  } 
	} 
      } 
      if ( rcount > 127 ) 
      {
	mem [s ].hh .v.RH = mem [r ].hh .v.RH ;
	mem [r ].hh .v.RH = -1073741823L ;
	flushnodelist ( r ) ;
      } 
      else {
	  
	mem [s ].hh .v.RH = r ;
	mem [r ].hh.b1 = rcount ;
      } 
      s = majortail ;
      hyphenpassed = j - 1 ;
      mem [memtop - 4 ].hh .v.RH = -1073741823L ;
    } while ( ! ( ! odd ( hyf [j - 1 ]) ) ) ;
  } while ( ! ( j > hn ) ) ;
  mem [s ].hh .v.RH = q ;
  flushlist ( initlist ) ;
} 
boolean 
zeTeXenabled ( boolean b , quarterword j , halfword k ) 
{
  register boolean Result; eTeXenabled_regmem 
  if ( ! b ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 784 ) ;
    } 
    printcmdchr ( j , k ) ;
    {
      helpptr = 1 ;
      helpline [0 ]= 1547 ;
    } 
    error () ;
  } 
  Result = b ;
  return Result ;
} 
void 
showsavegroups ( void ) 
{
  /* 41 42 40 30 */ showsavegroups_regmem 
  integer p  ;
  short m  ;
  savepointer v  ;
  quarterword l  ;
  groupcode c  ;
  schar a  ;
  integer i  ;
  quarterword j  ;
  strnumber s  ;
  p = nestptr ;
  nest [p ]= curlist ;
  v = saveptr ;
  l = curlevel ;
  c = curgroup ;
  saveptr = curboundary ;
  decr ( curlevel ) ;
  a = 1 ;
  printnl ( 349 ) ;
  println () ;
  while ( true ) {
      
    printnl ( 386 ) ;
    printgroup ( true ) ;
    if ( curgroup == 0 ) 
    goto lab30 ;
    do {
	m = nest [p ].modefield ;
      if ( p > 0 ) 
      decr ( p ) ;
      else m = 1 ;
    } while ( ! ( m != 120 ) ) ;
    print ( 287 ) ;
    switch ( curgroup ) 
    {case 1 : 
      {
	incr ( p ) ;
	goto lab42 ;
      } 
      break ;
    case 2 : 
    case 3 : 
      s = 1233 ;
      break ;
    case 4 : 
      s = 1136 ;
      break ;
    case 5 : 
      s = 1232 ;
      break ;
    case 6 : 
      if ( a == 0 ) 
      {
	if ( m == -1 ) 
	s = 588 ;
	else s = 610 ;
	a = 1 ;
	goto lab41 ;
      } 
      else {
	  
	if ( a == 1 ) 
	print ( 1590 ) ;
	else printesc ( 1068 ) ;
	if ( p >= a ) 
	p = p - a ;
	a = 0 ;
	goto lab40 ;
      } 
      break ;
    case 7 : 
      {
	incr ( p ) ;
	a = -1 ;
	printesc ( 597 ) ;
	goto lab42 ;
      } 
      break ;
    case 8 : 
      {
	printesc ( 426 ) ;
	goto lab40 ;
      } 
      break ;
    case 9 : 
      goto lab42 ;
      break ;
    case 10 : 
    case 13 : 
      {
	if ( curgroup == 10 ) 
	printesc ( 364 ) ;
	else printesc ( 595 ) ;
	{register integer for_end; i = 1 ;for_end = 3 ; if ( i <= for_end) 
	do 
	  if ( i <= savestack [saveptr - 2 ].cint ) 
	  print ( 1027 ) ;
	while ( i++ < for_end ) ;} 
	goto lab42 ;
      } 
      break ;
    case 11 : 
      {
	if ( savestack [saveptr - 2 ].cint == 255 ) 
	printesc ( 367 ) ;
	else {
	    
	  printesc ( 341 ) ;
	  printint ( savestack [saveptr - 2 ].cint ) ;
	} 
	goto lab42 ;
      } 
      break ;
    case 12 : 
      {
	s = 611 ;
	goto lab41 ;
      } 
      break ;
    case 14 : 
      {
	incr ( p ) ;
	printesc ( 576 ) ;
	goto lab40 ;
      } 
      break ;
    case 15 : 
      {
	if ( m == 239 ) 
	printchar ( 36 ) ;
	else if ( nest [p ].modefield == 239 ) 
	{
	  printcmdchr ( 54 , savestack [saveptr - 2 ].cint ) ;
	  goto lab40 ;
	} 
	printchar ( 36 ) ;
	goto lab40 ;
      } 
      break ;
    case 16 : 
      {
	if ( mem [nest [p + 1 ].eTeXauxfield ].hh.b0 == 32 ) 
	printesc ( 1043 ) ;
	else printesc ( 1045 ) ;
	goto lab40 ;
      } 
      break ;
    } 
    i = savestack [saveptr - 4 ].cint ;
    if ( i != 0 ) {
	
      if ( i < 1073741824L ) 
      {
	if ( abs ( nest [p ].modefield ) == 1 ) 
	j = 27 ;
	else j = 28 ;
	if ( i > 0 ) 
	printcmdchr ( j , 0 ) ;
	else printcmdchr ( j , 1 ) ;
	printscaled ( abs ( i ) ) ;
	print ( 425 ) ;
      } 
      else if ( i < 1073872896L ) 
      {
	if ( i >= 1073807360L ) 
	{
	  printesc ( 1376 ) ;
	  i = i - ( 65536L ) ;
	} 
	printesc ( 608 ) ;
	printint ( i - 1073741824L ) ;
	printchar ( 61 ) ;
      } 
      else printcmdchr ( 37 , i - ( 1073872797L ) ) ;
    } 
    lab41: printesc ( s ) ;
    if ( savestack [saveptr - 2 ].cint != 0 ) 
    {
      printchar ( 32 ) ;
      if ( savestack [saveptr - 3 ].cint == 0 ) 
      print ( 1008 ) ;
      else print ( 1009 ) ;
      printscaled ( savestack [saveptr - 2 ].cint ) ;
      print ( 425 ) ;
    } 
    lab42: printchar ( 123 ) ;
    lab40: printchar ( 41 ) ;
    decr ( curlevel ) ;
    curgroup = savestack [saveptr ].hh.b1 ;
    saveptr = savestack [saveptr ].hh .v.RH ;
  } 
  lab30: saveptr = v ;
  curlevel = l ;
  curgroup = c ;
} 
halfword 
zprunepagetop ( halfword p , boolean s ) 
{
  register halfword Result; prunepagetop_regmem 
  halfword prevp  ;
  halfword q, r  ;
  prevp = memtop - 3 ;
  mem [memtop - 3 ].hh .v.RH = p ;
  while ( p != -1073741823L ) switch ( mem [p ].hh.b0 ) 
  {case 2 : 
  case 0 : 
  case 1 : 
  case 3 : 
    {
      q = newskipparam ( 10 ) ;
      mem [prevp ].hh .v.RH = q ;
      mem [q ].hh .v.RH = p ;
      if ( mem [tempptr + 1 ].cint > mem [p + 3 ].cint ) 
      mem [tempptr + 1 ].cint = mem [tempptr + 1 ].cint - mem [p + 3 ]
      .cint ;
      else mem [tempptr + 1 ].cint = 0 ;
      p = -1073741823L ;
    } 
    break ;
  case 10 : 
  case 6 : 
  case 4 : 
    {
      prevp = p ;
      p = mem [prevp ].hh .v.RH ;
    } 
    break ;
  case 12 : 
  case 13 : 
  case 14 : 
    {
      q = p ;
      p = mem [q ].hh .v.RH ;
      mem [q ].hh .v.RH = -1073741823L ;
      mem [prevp ].hh .v.RH = p ;
      if ( s ) 
      {
	if ( discptr [3 ]== -1073741823L ) 
	discptr [3 ]= q ;
	else mem [r ].hh .v.RH = q ;
	r = q ;
      } 
      else flushnodelist ( q ) ;
    } 
    break ;
    default: 
    confusion ( 1128 ) ;
    break ;
  } 
  Result = mem [memtop - 3 ].hh .v.RH ;
  return Result ;
} 
halfword 
zvertbreak ( halfword p , scaled h , scaled d ) 
{
  /* 30 45 90 */ register halfword Result; vertbreak_regmem 
  halfword prevp  ;
  halfword q, r  ;
  integer pi  ;
  integer b  ;
  integer leastcost  ;
  halfword bestplace  ;
  scaled prevdp  ;
  smallnumber t  ;
  prevp = p ;
  leastcost = 1073741823L ;
  activewidth [1 ]= 0 ;
  activewidth [2 ]= 0 ;
  activewidth [3 ]= 0 ;
  activewidth [4 ]= 0 ;
  activewidth [5 ]= 0 ;
  activewidth [6 ]= 0 ;
  activewidth [7 ]= 0 ;
  prevdp = 0 ;
  while ( true ) {
      
    if ( p == -1073741823L ) 
    pi = -10000 ;
    else switch ( mem [p ].hh.b0 ) 
    {case 2 : 
    case 0 : 
    case 1 : 
    case 3 : 
      {
	activewidth [1 ]= activewidth [1 ]+ prevdp + mem [p + 3 ].cint ;
	prevdp = mem [p + 2 ].cint ;
	goto lab45 ;
      } 
      break ;
    case 10 : 
      goto lab45 ;
      break ;
    case 12 : 
      if ( ( mem [prevp ].hh.b0 < 11 ) ) 
      pi = 0 ;
      else goto lab90 ;
      break ;
    case 13 : 
      {
	if ( mem [p ].hh .v.RH == -1073741823L ) 
	t = 14 ;
	else t = mem [mem [p ].hh .v.RH ].hh.b0 ;
	if ( t == 12 ) 
	pi = 0 ;
	else goto lab90 ;
      } 
      break ;
    case 14 : 
      pi = mem [p + 1 ].cint ;
      break ;
    case 6 : 
    case 4 : 
      goto lab45 ;
      break ;
      default: 
      confusion ( 1129 ) ;
      break ;
    } 
    if ( pi < 10000 ) 
    {
      if ( activewidth [1 ]< h ) {
	  
	if ( ( activewidth [3 ]!= 0 ) || ( activewidth [4 ]!= 0 ) || ( 
	activewidth [5 ]!= 0 ) || ( activewidth [6 ]!= 0 ) ) 
	b = 0 ;
	else b = badness ( h - activewidth [1 ], activewidth [2 ]) ;
      } 
      else if ( activewidth [1 ]- h > activewidth [7 ]) 
      b = 1073741823L ;
      else b = badness ( activewidth [1 ]- h , activewidth [7 ]) ;
      if ( b < 1073741823L ) {
	  
	if ( pi <= -10000 ) 
	b = pi ;
	else if ( b < 10000 ) 
	b = b + pi ;
	else b = 100000L ;
      } 
      if ( b <= leastcost ) 
      {
	bestplace = p ;
	leastcost = b ;
	bestheightplusdepth = activewidth [1 ]+ prevdp ;
      } 
      if ( ( b == 1073741823L ) || ( pi <= -10000 ) ) 
      goto lab30 ;
    } 
    if ( ( mem [p ].hh.b0 < 12 ) || ( mem [p ].hh.b0 > 13 ) ) 
    goto lab45 ;
    lab90: if ( mem [p ].hh.b0 == 13 ) 
    q = p ;
    else {
	
      q = mem [p + 1 ].hh .v.LH ;
      activewidth [2 + mem [q ].hh.b0 ]= activewidth [2 + mem [q ]
      .hh.b0 ]+ mem [q + 2 ].cint ;
      activewidth [7 ]= activewidth [7 ]+ mem [q + 3 ].cint ;
      if ( ( mem [q ].hh.b1 != 0 ) && ( mem [q + 3 ].cint != 0 ) ) 
      {
	if ( isbitset ( eqtb [114443L ].cint , 1 ) ) 
	{
	  oldselectorignorederr = selector ;
	  selector = 18 ;
	  putc ('\n',  logfile );
	  Fputs ( logfile ,  "ignored: " ) ;
	  print ( 1130 ) ;
	  selector = oldselectorignorederr ;
	} 
	else {
	    
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1130 ) ;
	  } 
	  {
	    helpptr = 4 ;
	    helpline [3 ]= 1131 ;
	    helpline [2 ]= 1132 ;
	    helpline [1 ]= 1133 ;
	    helpline [0 ]= 1091 ;
	  } 
	  error () ;
	} 
	r = newspec ( q ) ;
	mem [r ].hh.b1 = 0 ;
	deleteglueref ( q ) ;
	mem [p + 1 ].hh .v.LH = r ;
	q = r ;
      } 
    } 
    activewidth [1 ]= activewidth [1 ]+ prevdp + mem [q + 1 ].cint ;
    prevdp = 0 ;
    lab45: if ( prevdp > d ) 
    {
      activewidth [1 ]= activewidth [1 ]+ prevdp - d ;
      prevdp = d ;
    } 
    prevp = p ;
    p = mem [prevp ].hh .v.RH ;
  } 
  lab30: Result = bestplace ;
  return Result ;
} 
halfword 
zvsplit ( halfword n , scaled h ) 
{
  /* 10 30 */ register halfword Result; vsplit_regmem 
  halfword v  ;
  halfword w  ;
  halfword p  ;
  halfword q  ;
  curval = n ;
  if ( curval < 256 ) 
  v = eqtb [50729L + curval ].hh .v.RH ;
  else {
      
    findsaelement ( 4 , curval , false ) ;
    if ( curptr == -1073741823L ) 
    v = -1073741823L ;
    else v = mem [curptr + 1 ].hh .v.RH ;
  } 
  flushnodelist ( discptr [3 ]) ;
  discptr [3 ]= -1073741823L ;
  if ( saroot [6 ]!= -1073741823L ) {
      
    if ( domarks ( 0 , 0 , saroot [6 ]) ) 
    saroot [6 ]= -1073741823L ;
  } 
  if ( curmark [3 ]!= -1073741823L ) 
  {
    deletetokenref ( curmark [3 ]) ;
    curmark [3 ]= -1073741823L ;
    deletetokenref ( curmark [4 ]) ;
    curmark [4 ]= -1073741823L ;
  } 
  if ( v == -1073741823L ) 
  {
    Result = -1073741823L ;
    return Result ;
  } 
  if ( mem [v ].hh.b0 == 2 ) 
  {
    w = v ;
    v = mem [v + 5 ].hh .v.RH ;
    deleteglueref ( mem [w + 7 ].hh .v.RH ) ;
    deleteglueref ( mem [w + 7 ].hh .v.LH ) ;
    freenode ( w , 10 ) ;
  } 
  if ( mem [v ].hh.b0 != 1 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 349 ) ;
    } 
    printesc ( 1134 ) ;
    print ( 1135 ) ;
    printesc ( 1136 ) ;
    {
      helpptr = 2 ;
      helpline [1 ]= 1137 ;
      helpline [0 ]= 1138 ;
    } 
    error () ;
    Result = -1073741823L ;
    return Result ;
  } 
  flushnodelist ( mem [v ].hh .v.RH ) ;
  mem [v ].hh .v.RH = -1073741823L ;
  q = vertbreak ( mem [v + 5 ].hh .v.RH , h , eqtb [114963L ].cint ) ;
  p = mem [v + 5 ].hh .v.RH ;
  if ( p == q ) 
  mem [v + 5 ].hh .v.RH = -1073741823L ;
  else while ( true ) {
      
    if ( mem [p ].hh.b0 == 6 ) {
	
      if ( mem [p + 1 ].hh .v.LH != 0 ) 
      {
	findsaelement ( 6 , mem [p + 1 ].hh .v.LH , true ) ;
	if ( mem [curptr + 2 ].hh .v.RH == -1073741823L ) 
	{
	  mem [curptr + 2 ].hh .v.RH = mem [p + 1 ].hh .v.RH ;
	  incr ( mem [mem [p + 1 ].hh .v.RH ].hh .v.LH ) ;
	} 
	else deletetokenref ( mem [curptr + 3 ].hh .v.LH ) ;
	mem [curptr + 3 ].hh .v.LH = mem [p + 1 ].hh .v.RH ;
	incr ( mem [mem [p + 1 ].hh .v.RH ].hh .v.LH ) ;
      } 
      else if ( curmark [3 ]== -1073741823L ) 
      {
	curmark [3 ]= mem [p + 1 ].hh .v.RH ;
	curmark [4 ]= curmark [3 ];
	mem [curmark [3 ]].hh .v.LH = mem [curmark [3 ]].hh .v.LH + 2 
	;
      } 
      else {
	  
	deletetokenref ( curmark [4 ]) ;
	curmark [4 ]= mem [p + 1 ].hh .v.RH ;
	incr ( mem [curmark [4 ]].hh .v.LH ) ;
      } 
    } 
    if ( mem [p ].hh .v.RH == q ) 
    {
      mem [p ].hh .v.RH = -1073741823L ;
      goto lab30 ;
    } 
    p = mem [p ].hh .v.RH ;
  } 
  lab30: ;
  q = prunepagetop ( q , eqtb [114437L ].cint > 0 ) ;
  p = mem [v + 5 ].hh .v.RH ;
  if ( q != -1073741823L ) 
  {
    q = vpackage ( q , 0 , 1 , 1073741823L ) ;
    mem [q ].hh.b1 = ( ( mem [q ].hh.b1 ) / 16 ) * 16 + ( ( mem [v ]
    .hh.b1 ) % 16 - 5 ) + 5 ;
  } 
  if ( curval < 256 ) 
  eqtb [50729L + curval ].hh .v.RH = q ;
  else {
      
    findsaelement ( 4 , curval , false ) ;
    if ( curptr != -1073741823L ) 
    {
      mem [curptr + 1 ].hh .v.RH = q ;
      incr ( mem [curptr + 1 ].hh .v.LH ) ;
      deletesaref ( curptr ) ;
    } 
  } 
  q = vpackage ( p , h , 0 , eqtb [114963L ].cint ) ;
  mem [q ].hh.b1 = ( ( mem [q ].hh.b1 ) / 16 ) * 16 + ( ( mem [v ].hh.b1 
  ) % 16 - 5 ) + 5 ;
  deleteglueref ( mem [v + 7 ].hh .v.RH ) ;
  deleteglueref ( mem [v + 7 ].hh .v.LH ) ;
  freenode ( v , 10 ) ;
  Result = q ;
  return Result ;
} 
void 
printtotals ( void ) 
{
  printtotals_regmem 
  printscaled ( pagesofar [1 ]) ;
  if ( pagesofar [2 ]!= 0 ) 
  {
    print ( 322 ) ;
    printscaled ( pagesofar [2 ]) ;
    print ( 349 ) ;
  } 
  if ( pagesofar [3 ]!= 0 ) 
  {
    print ( 322 ) ;
    printscaled ( pagesofar [3 ]) ;
    print ( 321 ) ;
  } 
  if ( pagesofar [4 ]!= 0 ) 
  {
    print ( 322 ) ;
    printscaled ( pagesofar [4 ]) ;
    print ( 1148 ) ;
  } 
  if ( pagesofar [5 ]!= 0 ) 
  {
    print ( 322 ) ;
    printscaled ( pagesofar [5 ]) ;
    print ( 1149 ) ;
  } 
  if ( pagesofar [6 ]!= 0 ) 
  {
    print ( 322 ) ;
    printscaled ( pagesofar [6 ]) ;
    print ( 1150 ) ;
  } 
  if ( pagesofar [7 ]!= 0 ) 
  {
    print ( 323 ) ;
    printscaled ( pagesofar [7 ]) ;
  } 
} 
void 
zfreezepagespecs ( smallnumber s ) 
{
  freezepagespecs_regmem 
  pagecontents = s ;
  pagesofar [0 ]= eqtb [114961L ].cint ;
  pagemaxdepth = eqtb [114962L ].cint ;
  pagesofar [8 ]= 0 ;
  pagesofar [1 ]= 0 ;
  pagesofar [2 ]= 0 ;
  pagesofar [3 ]= 0 ;
  pagesofar [4 ]= 0 ;
  pagesofar [5 ]= 0 ;
  pagesofar [6 ]= 0 ;
  pagesofar [7 ]= 0 ;
  leastpagecost = 1073741823L ;
	;
#ifdef STAT
  if ( eqtb [114394L ].cint > 0 ) 
  {
    begindiagnostic () ;
    printnl ( 1158 ) ;
    printscaled ( pagesofar [0 ]) ;
    print ( 1159 ) ;
    printscaled ( pagemaxdepth ) ;
    enddiagnostic ( false ) ;
  } 
#endif /* STAT */
} 
void 
zboxerror ( eightbits n ) 
{
  boxerror_regmem 
  error () ;
  begindiagnostic () ;
  printnl ( 1002 ) ;
  showbox ( eqtb [50729L + n ].hh .v.RH ) ;
  enddiagnostic ( true ) ;
  flushnodelist ( eqtb [50729L + n ].hh .v.RH ) ;
  eqtb [50729L + n ].hh .v.RH = -1073741823L ;
} 
void 
zensurevbox ( eightbits n ) 
{
  ensurevbox_regmem 
  halfword p  ;
  p = eqtb [50729L + n ].hh .v.RH ;
  if ( p != -1073741823L ) {
      
    if ( mem [p ].hh.b0 == 2 ) 
    {
      p = mem [p + 5 ].hh .v.RH ;
      deleteglueref ( mem [eqtb [50729L + n ].hh .v.RH + 7 ].hh .v.RH ) ;
      deleteglueref ( mem [eqtb [50729L + n ].hh .v.RH + 7 ].hh .v.LH ) ;
      freenode ( eqtb [50729L + n ].hh .v.RH , 10 ) ;
      eqtb [50729L + n ].hh .v.RH = p ;
    } 
  } 
  if ( p != -1073741823L ) {
      
    if ( mem [p ].hh.b0 != 1 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1160 ) ;
      } 
      {
	helpptr = 3 ;
	helpline [2 ]= 1161 ;
	helpline [1 ]= 1162 ;
	helpline [0 ]= 1163 ;
      } 
      boxerror ( n ) ;
    } 
  } 
} 
void 
zfireup ( halfword c ) 
{
  /* 10 */ fireup_regmem 
  halfword p, q, r, s  ;
  halfword prevp  ;
  unsigned char n  ;
  boolean wait  ;
  integer savevbadness  ;
  scaled savevfuzz  ;
  halfword savesplittopskip  ;
  if ( mem [bestpagebreak ].hh.b0 == 14 ) 
  {
    geqworddefine ( 114400L , mem [bestpagebreak + 1 ].cint ) ;
    mem [bestpagebreak + 1 ].cint = 10000 ;
  } 
  else geqworddefine ( 114400L , 10000 ) ;
  if ( saroot [6 ]!= -1073741823L ) {
      
    if ( domarks ( 1 , 0 , saroot [6 ]) ) 
    saroot [6 ]= -1073741823L ;
  } 
  if ( curmark [2 ]!= -1073741823L ) 
  {
    if ( curmark [0 ]!= -1073741823L ) 
    deletetokenref ( curmark [0 ]) ;
    curmark [0 ]= curmark [2 ];
    incr ( mem [curmark [0 ]].hh .v.LH ) ;
    deletetokenref ( curmark [1 ]) ;
    curmark [1 ]= -1073741823L ;
  } 
  if ( c == bestpagebreak ) 
  bestpagebreak = -1073741823L ;
  if ( eqtb [50984L ].hh .v.RH != -1073741823L ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 349 ) ;
    } 
    printesc ( 437 ) ;
    print ( 1176 ) ;
    {
      helpptr = 2 ;
      helpline [1 ]= 1177 ;
      helpline [0 ]= 1163 ;
    } 
    boxerror ( 255 ) ;
  } 
  insertpenalties = 0 ;
  savesplittopskip = eqtb [49935L ].hh .v.RH ;
  if ( eqtb [114415L ].cint <= 0 ) 
  {
    r = mem [memtop ].hh .v.RH ;
    while ( r != memtop ) {
	
      if ( mem [r + 2 ].hh .v.LH != -1073741823L ) 
      {
	n = mem [r ].hh.b1 ;
	ensurevbox ( n ) ;
	if ( eqtb [50729L + n ].hh .v.RH == -1073741823L ) 
	eqtb [50729L + n ].hh .v.RH = newnullbox () ;
	p = eqtb [50729L + n ].hh .v.RH + 5 ;
	while ( mem [p ].hh .v.RH != -1073741823L ) p = mem [p ].hh .v.RH 
	;
	mem [r + 2 ].hh .v.RH = p ;
      } 
      r = mem [r ].hh .v.RH ;
    } 
  } 
  q = memtop - 4 ;
  mem [q ].hh .v.RH = -1073741823L ;
  prevp = memtop - 2 ;
  p = mem [prevp ].hh .v.RH ;
  while ( p != bestpagebreak ) {
      
    if ( mem [p ].hh.b0 == 4 ) 
    {
      if ( eqtb [114415L ].cint <= 0 ) 
      {
	r = mem [memtop ].hh .v.RH ;
	while ( mem [r ].hh.b1 != mem [p ].hh.b1 ) r = mem [r ].hh .v.RH 
	;
	if ( mem [r + 2 ].hh .v.LH == -1073741823L ) 
	wait = true ;
	else {
	    
	  wait = false ;
	  n = mem [p ].hh.b1 ;
	  switch ( abs ( ( ( mem [eqtb [50729L + n ].hh .v.RH ].hh.b1 ) % 
	  16 - 5 ) ) ) 
	  {case 4 : 
	  case 3 : 
	  case 1 : 
	    if ( abs ( ( mem [p + 5 ].hh.b1 - 5 ) ) != abs ( ( ( mem [eqtb 
	    [50729L + n ].hh .v.RH ].hh.b1 ) % 16 - 5 ) ) ) 
	    {
	      {
		if ( interaction == 3 ) 
		;
		if ( filelineerrorstylep ) 
		printfileline () ;
		else printnl ( 265 ) ;
		print ( 1169 ) ;
	      } 
	      {
		helpptr = 3 ;
		helpline [2 ]= 1161 ;
		helpline [1 ]= 1170 ;
		helpline [0 ]= 1163 ;
	      } 
	      boxerror ( n ) ;
	      eqtb [50729L + n ].hh .v.RH = newnullbox () ;
	      mem [r + 2 ].hh .v.RH = eqtb [50729L + n ].hh .v.RH + 5 ;
	    } 
	    break ;
	    default: 
	    mem [eqtb [50729L + n ].hh .v.RH ].hh.b1 = ( ( mem [eqtb [
	    50729L + n ].hh .v.RH ].hh.b1 ) / 16 ) * 16 + abs ( ( mem [p + 
	    5 ].hh.b1 - 5 ) ) + 5 ;
	    break ;
	  } 
	  s = mem [r + 2 ].hh .v.RH ;
	  mem [s ].hh .v.RH = mem [p + 4 ].hh .v.LH ;
	  if ( mem [r + 2 ].hh .v.LH == p ) 
	  {
	    if ( mem [r ].hh.b0 == 1 ) {
		
	      if ( ( mem [r + 1 ].hh .v.LH == p ) && ( mem [r + 1 ].hh 
	      .v.RH != -1073741823L ) ) 
	      {
		while ( mem [s ].hh .v.RH != mem [r + 1 ].hh .v.RH ) s = 
		mem [s ].hh .v.RH ;
		mem [s ].hh .v.RH = -1073741823L ;
		eqtb [49935L ].hh .v.RH = mem [p + 4 ].hh .v.RH ;
		mem [p + 4 ].hh .v.LH = prunepagetop ( mem [r + 1 ].hh 
		.v.RH , false ) ;
		if ( mem [p + 4 ].hh .v.LH != -1073741823L ) 
		{
		  tempptr = vpackage ( mem [p + 4 ].hh .v.LH , 0 , 1 , 
		  1073741823L ) ;
		  mem [p + 3 ].cint = mem [tempptr + 3 ].cint + mem [
		  tempptr + 2 ].cint ;
		  deleteglueref ( mem [tempptr + 7 ].hh .v.RH ) ;
		  deleteglueref ( mem [tempptr + 7 ].hh .v.LH ) ;
		  freenode ( tempptr , 10 ) ;
		  wait = true ;
		} 
	      } 
	    } 
	    mem [r + 2 ].hh .v.LH = -1073741823L ;
	    n = mem [r ].hh.b1 ;
	    tempptr = mem [eqtb [50729L + n ].hh .v.RH + 5 ].hh .v.RH ;
	    deleteglueref ( mem [eqtb [50729L + n ].hh .v.RH + 7 ].hh 
	    .v.RH ) ;
	    deleteglueref ( mem [eqtb [50729L + n ].hh .v.RH + 7 ].hh 
	    .v.LH ) ;
	    flushnodelist ( mem [eqtb [50729L + n ].hh .v.RH ].hh .v.RH ) 
	    ;
	    freenode ( eqtb [50729L + n ].hh .v.RH , 10 ) ;
	    eqtb [50729L + n ].hh .v.RH = vpackage ( tempptr , 0 , 1 , 
	    1073741823L ) ;
	    mem [eqtb [50729L + n ].hh .v.RH ].hh.b1 = ( ( mem [eqtb [
	    50729L + n ].hh .v.RH ].hh.b1 ) / 16 ) * 16 + abs ( ( mem [p + 
	    5 ].hh.b1 - 5 ) ) + 5 ;
	  } 
	  else {
	      
	    while ( mem [s ].hh .v.RH != -1073741823L ) s = mem [s ].hh 
	    .v.RH ;
	    mem [r + 2 ].hh .v.RH = s ;
	  } 
	} 
	mem [prevp ].hh .v.RH = mem [p ].hh .v.RH ;
	mem [p ].hh .v.RH = -1073741823L ;
	if ( wait ) 
	{
	  mem [q ].hh .v.RH = p ;
	  q = p ;
	  incr ( insertpenalties ) ;
	} 
	else {
	    
	  deleteglueref ( mem [p + 4 ].hh .v.RH ) ;
	  freenode ( p , 6 ) ;
	} 
	p = prevp ;
      } 
    } 
    else if ( mem [p ].hh.b0 == 6 ) {
	
      if ( mem [p + 1 ].hh .v.LH != 0 ) 
      {
	findsaelement ( 6 , mem [p + 1 ].hh .v.LH , true ) ;
	if ( mem [curptr + 1 ].hh .v.RH == -1073741823L ) 
	{
	  mem [curptr + 1 ].hh .v.RH = mem [p + 1 ].hh .v.RH ;
	  incr ( mem [mem [p + 1 ].hh .v.RH ].hh .v.LH ) ;
	} 
	if ( mem [curptr + 2 ].hh .v.LH != -1073741823L ) 
	deletetokenref ( mem [curptr + 2 ].hh .v.LH ) ;
	mem [curptr + 2 ].hh .v.LH = mem [p + 1 ].hh .v.RH ;
	incr ( mem [mem [p + 1 ].hh .v.RH ].hh .v.LH ) ;
      } 
      else {
	  
	if ( curmark [1 ]== -1073741823L ) 
	{
	  curmark [1 ]= mem [p + 1 ].hh .v.RH ;
	  incr ( mem [curmark [1 ]].hh .v.LH ) ;
	} 
	if ( curmark [2 ]!= -1073741823L ) 
	deletetokenref ( curmark [2 ]) ;
	curmark [2 ]= mem [p + 1 ].hh .v.RH ;
	incr ( mem [curmark [2 ]].hh .v.LH ) ;
      } 
    } 
    prevp = p ;
    p = mem [prevp ].hh .v.RH ;
  } 
  eqtb [49935L ].hh .v.RH = savesplittopskip ;
  if ( p != -1073741823L ) 
  {
    if ( mem [memtop - 1 ].hh .v.RH == -1073741823L ) {
	
      if ( nestptr == 0 ) 
      curlist .tailfield = pagetail ;
      else nest [0 ].tailfield = pagetail ;
    } 
    mem [pagetail ].hh .v.RH = mem [memtop - 1 ].hh .v.RH ;
    mem [memtop - 1 ].hh .v.RH = p ;
    mem [prevp ].hh .v.RH = -1073741823L ;
  } 
  savevbadness = eqtb [114388L ].cint ;
  eqtb [114388L ].cint = 10000 ;
  savevfuzz = eqtb [114966L ].cint ;
  eqtb [114966L ].cint = 1073741823L ;
  eqtb [50984L ].hh .v.RH = vpackage ( mem [memtop - 2 ].hh .v.RH , 
  bestsize , 0 , pagemaxdepth ) ;
  mem [eqtb [50984L ].hh .v.RH ].hh.b1 = ( ( mem [eqtb [50984L ].hh 
  .v.RH ].hh.b1 ) / 16 ) * 16 + pagedir + 5 ;
  eqtb [114388L ].cint = savevbadness ;
  eqtb [114966L ].cint = savevfuzz ;
  if ( lastglue != 1073741823L ) 
  deleteglueref ( lastglue ) ;
  pagecontents = 0 ;
  pagetail = memtop - 2 ;
  mem [memtop - 2 ].hh .v.RH = -1073741823L ;
  lastglue = 1073741823L ;
  lastpenalty = 0 ;
  lastkern = 0 ;
  lastnodetype = -1 ;
  lastnodesubtype = -1 ;
  pagesofar [8 ]= 0 ;
  pagemaxdepth = 0 ;
  if ( q != memtop - 4 ) 
  {
    mem [memtop - 2 ].hh .v.RH = mem [memtop - 4 ].hh .v.RH ;
    pagetail = q ;
  } 
  r = mem [memtop ].hh .v.RH ;
  while ( r != memtop ) {
      
    q = mem [r ].hh .v.RH ;
    freenode ( r , 4 ) ;
    r = q ;
  } 
  mem [memtop ].hh .v.RH = memtop ;
  if ( saroot [6 ]!= -1073741823L ) {
      
    if ( domarks ( 2 , 0 , saroot [6 ]) ) 
    saroot [6 ]= -1073741823L ;
  } 
  if ( ( curmark [0 ]!= -1073741823L ) && ( curmark [1 ]== -1073741823L ) 
  ) 
  {
    curmark [1 ]= curmark [0 ];
    incr ( mem [curmark [0 ]].hh .v.LH ) ;
  } 
  if ( eqtb [50459L ].hh .v.RH != -1073741823L ) {
      
    if ( deadcycles >= eqtb [114401L ].cint ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1178 ) ;
      } 
      printint ( deadcycles ) ;
      print ( 1179 ) ;
      {
	helpptr = 3 ;
	helpline [2 ]= 1180 ;
	helpline [1 ]= 1181 ;
	helpline [0 ]= 1182 ;
      } 
      error () ;
    } 
    else {
	
      outputactive = true ;
      incr ( deadcycles ) ;
      pushnest () ;
      curlist .modefield = -1 ;
      curlist .auxfield .cint = -65536000L ;
      curlist .mlfield = - (integer) line ;
      begintokenlist ( eqtb [50459L ].hh .v.RH , 6 ) ;
      newsavelevel ( 8 ) ;
      normalparagraph () ;
      scanleftbrace () ;
      return ;
    } 
  } 
  {
    if ( mem [memtop - 2 ].hh .v.RH != -1073741823L ) 
    {
      if ( mem [memtop - 1 ].hh .v.RH == -1073741823L ) {
	  
	if ( nestptr == 0 ) 
	curlist .tailfield = pagetail ;
	else nest [0 ].tailfield = pagetail ;
      } 
      else mem [pagetail ].hh .v.RH = mem [memtop - 1 ].hh .v.RH ;
      mem [memtop - 1 ].hh .v.RH = mem [memtop - 2 ].hh .v.RH ;
      mem [memtop - 2 ].hh .v.RH = -1073741823L ;
      pagetail = memtop - 2 ;
    } 
    flushnodelist ( discptr [2 ]) ;
    discptr [2 ]= -1073741823L ;
    shipout ( eqtb [50984L ].hh .v.RH ) ;
    eqtb [50984L ].hh .v.RH = -1073741823L ;
  } 
} 
void 
buildpage ( void ) 
{
  /* 10 30 31 22 80 90 */ buildpage_regmem 
  halfword p  ;
  halfword q, r  ;
  integer b, c  ;
  integer pi  ;
  unsigned char n  ;
  scaled delta, h, w  ;
  if ( ( mem [memtop - 1 ].hh .v.RH == -1073741823L ) || outputactive ) 
  return ;
  do {
      lab22: p = mem [memtop - 1 ].hh .v.RH ;
    if ( lastglue != 1073741823L ) 
    deleteglueref ( lastglue ) ;
    lastpenalty = 0 ;
    lastkern = 0 ;
    if ( mem [p ].hh.b0 < 2 ) 
    lastnodetype = mem [p ].hh.b0 + 1 ;
    else if ( mem [p ].hh.b0 == 2 ) 
    lastnodetype = mem [mem [p + 5 ].hh .v.RH ].hh.b0 + 1 ;
    else if ( mem [p ].hh.b0 < 5 ) 
    lastnodetype = mem [p ].hh.b0 ;
    else lastnodetype = mem [p ].hh.b0 - 1 ;
    lastnodesubtype = mem [p ].hh.b1 ;
    if ( mem [p ].hh.b0 == 12 ) 
    {
      lastglue = mem [p + 1 ].hh .v.LH ;
      incr ( mem [lastglue ].hh .v.RH ) ;
    } 
    else {
	
      lastglue = 1073741823L ;
      if ( mem [p ].hh.b0 == 14 ) 
      lastpenalty = mem [p + 1 ].cint ;
      else if ( mem [p ].hh.b0 == 13 ) 
      lastkern = mem [p + 1 ].cint ;
    } 
    switch ( mem [p ].hh.b0 ) 
    {case 0 : 
    case 1 : 
    case 2 : 
    case 3 : 
      if ( pagecontents < 2 ) 
      {
	if ( pagecontents == 0 ) 
	freezepagespecs ( 2 ) ;
	else pagecontents = 2 ;
	q = newskipparam ( 9 ) ;
	if ( mem [tempptr + 1 ].cint > mem [p + 3 ].cint ) 
	mem [tempptr + 1 ].cint = mem [tempptr + 1 ].cint - mem [p + 3 ]
	.cint ;
	else mem [tempptr + 1 ].cint = 0 ;
	mem [q ].hh .v.RH = p ;
	mem [memtop - 1 ].hh .v.RH = q ;
	goto lab22 ;
      } 
      else {
	  
	pagesofar [1 ]= pagesofar [1 ]+ pagesofar [8 ]+ mem [p + 3 ]
	.cint ;
	pagesofar [8 ]= mem [p + 2 ].cint ;
	goto lab80 ;
      } 
      break ;
    case 10 : 
      goto lab80 ;
      break ;
    case 12 : 
      if ( pagecontents < 2 ) 
      goto lab31 ;
      else if ( ( mem [pagetail ].hh.b0 < 11 ) ) 
      pi = 0 ;
      else goto lab90 ;
      break ;
    case 13 : 
      if ( pagecontents < 2 ) 
      goto lab31 ;
      else if ( mem [p ].hh .v.RH == -1073741823L ) 
      return ;
      else if ( mem [mem [p ].hh .v.RH ].hh.b0 == 12 ) 
      pi = 0 ;
      else goto lab90 ;
      break ;
    case 14 : 
      if ( pagecontents < 2 ) 
      goto lab31 ;
      else pi = mem [p + 1 ].cint ;
      break ;
    case 6 : 
      goto lab80 ;
      break ;
    case 4 : 
      {
	if ( pagecontents == 0 ) 
	freezepagespecs ( 1 ) ;
	n = mem [p ].hh.b1 ;
	r = memtop ;
	while ( n >= mem [mem [r ].hh .v.RH ].hh.b1 ) r = mem [r ].hh 
	.v.RH ;
	n = n ;
	if ( mem [r ].hh.b1 != n ) 
	{
	  q = getnode ( 4 ) ;
	  mem [q ].hh .v.RH = mem [r ].hh .v.RH ;
	  mem [r ].hh .v.RH = q ;
	  r = q ;
	  mem [r ].hh.b1 = n ;
	  mem [r ].hh.b0 = 0 ;
	  ensurevbox ( n ) ;
	  if ( eqtb [50729L + n ].hh .v.RH == -1073741823L ) 
	  mem [r + 3 ].cint = 0 ;
	  else {
	      
	    if ( abs ( ( mem [p + 5 ].hh.b1 - 5 ) ) != abs ( ( ( mem [eqtb 
	    [50729L + n ].hh .v.RH ].hh.b1 ) % 16 - 5 ) ) ) 
	    {
	      {
		if ( interaction == 3 ) 
		;
		if ( filelineerrorstylep ) 
		printfileline () ;
		else printnl ( 265 ) ;
		print ( 1169 ) ;
	      } 
	      {
		helpptr = 3 ;
		helpline [2 ]= 1161 ;
		helpline [1 ]= 1170 ;
		helpline [0 ]= 1163 ;
	      } 
	      boxerror ( n ) ;
	    } 
	    else mem [r + 3 ].cint = mem [eqtb [50729L + n ].hh .v.RH + 3 
	    ].cint + mem [eqtb [50729L + n ].hh .v.RH + 2 ].cint ;
	  } 
	  mem [r + 2 ].hh .v.LH = -1073741823L ;
	  q = eqtb [49946L + n ].hh .v.RH ;
	  if ( eqtb [114445L + n ].cint == 1000 ) 
	  h = mem [r + 3 ].cint ;
	  else h = xovern ( mem [r + 3 ].cint , 1000 ) * eqtb [114445L + n 
	  ].cint ;
	  pagesofar [0 ]= pagesofar [0 ]- h - mem [q + 1 ].cint ;
	  pagesofar [2 + mem [q ].hh.b0 ]= pagesofar [2 + mem [q ]
	  .hh.b0 ]+ mem [q + 2 ].cint ;
	  pagesofar [7 ]= pagesofar [7 ]+ mem [q + 3 ].cint ;
	  if ( ( mem [q ].hh.b1 != 0 ) && ( mem [q + 3 ].cint != 0 ) ) 
	  {
	    {
	      if ( interaction == 3 ) 
	      ;
	      if ( filelineerrorstylep ) 
	      printfileline () ;
	      else printnl ( 265 ) ;
	      print ( 1171 ) ;
	    } 
	    printesc ( 423 ) ;
	    printint ( n ) ;
	    {
	      helpptr = 3 ;
	      helpline [2 ]= 1172 ;
	      helpline [1 ]= 1173 ;
	      helpline [0 ]= 1091 ;
	    } 
	    error () ;
	  } 
	} 
	if ( mem [r ].hh.b0 == 1 ) 
	insertpenalties = insertpenalties + mem [p + 1 ].cint ;
	else {
	    
	  mem [r + 2 ].hh .v.RH = p ;
	  delta = pagesofar [0 ]- pagesofar [1 ]- pagesofar [8 ]+ 
	  pagesofar [7 ];
	  if ( eqtb [114445L + n ].cint == 1000 ) 
	  h = mem [p + 3 ].cint ;
	  else h = xovern ( mem [p + 3 ].cint , 1000 ) * eqtb [114445L + n 
	  ].cint ;
	  if ( ( ( h <= 0 ) || ( h <= delta ) ) && ( mem [p + 3 ].cint + mem 
	  [r + 3 ].cint <= eqtb [114982L + n ].cint ) ) 
	  {
	    pagesofar [0 ]= pagesofar [0 ]- h ;
	    mem [r + 3 ].cint = mem [r + 3 ].cint + mem [p + 3 ].cint ;
	  } 
	  else {
	      
	    if ( eqtb [114445L + n ].cint <= 0 ) 
	    w = 1073741823L ;
	    else {
		
	      w = pagesofar [0 ]- pagesofar [1 ]- pagesofar [8 ];
	      if ( eqtb [114445L + n ].cint != 1000 ) 
	      w = xovern ( w , eqtb [114445L + n ].cint ) * 1000 ;
	    } 
	    if ( w > eqtb [114982L + n ].cint - mem [r + 3 ].cint ) 
	    w = eqtb [114982L + n ].cint - mem [r + 3 ].cint ;
	    q = vertbreak ( mem [p + 4 ].hh .v.LH , w , mem [p + 2 ].cint 
	    ) ;
	    mem [r + 3 ].cint = mem [r + 3 ].cint + bestheightplusdepth ;
	;
#ifdef STAT
	    if ( eqtb [114394L ].cint > 0 ) 
	    {
	      begindiagnostic () ;
	      printnl ( 1174 ) ;
	      printint ( n ) ;
	      print ( 1175 ) ;
	      printscaled ( w ) ;
	      printchar ( 44 ) ;
	      printscaled ( bestheightplusdepth ) ;
	      print ( 1100 ) ;
	      if ( q == -1073741823L ) 
	      printint ( -10000 ) ;
	      else if ( mem [q ].hh.b0 == 14 ) 
	      printint ( mem [q + 1 ].cint ) ;
	      else printchar ( 48 ) ;
	      enddiagnostic ( false ) ;
	    } 
#endif /* STAT */
	    if ( eqtb [114445L + n ].cint != 1000 ) 
	    bestheightplusdepth = xovern ( bestheightplusdepth , 1000 ) * eqtb 
	    [114445L + n ].cint ;
	    pagesofar [0 ]= pagesofar [0 ]- bestheightplusdepth ;
	    mem [r ].hh.b0 = 1 ;
	    mem [r + 1 ].hh .v.RH = q ;
	    mem [r + 1 ].hh .v.LH = p ;
	    if ( q == -1073741823L ) 
	    insertpenalties = insertpenalties - 10000 ;
	    else if ( mem [q ].hh.b0 == 14 ) 
	    insertpenalties = insertpenalties + mem [q + 1 ].cint ;
	  } 
	} 
	goto lab80 ;
      } 
      break ;
      default: 
      confusion ( 1164 ) ;
      break ;
    } 
    if ( pi < 10000 ) 
    {
      if ( pagesofar [1 ]< pagesofar [0 ]) {
	  
	if ( ( pagesofar [3 ]!= 0 ) || ( pagesofar [4 ]!= 0 ) || ( 
	pagesofar [5 ]!= 0 ) || ( pagesofar [6 ]!= 0 ) ) 
	b = 0 ;
	else b = badness ( pagesofar [0 ]- pagesofar [1 ], pagesofar [2 ]
	) ;
      } 
      else if ( pagesofar [1 ]- pagesofar [0 ]> pagesofar [7 ]) 
      b = 1073741823L ;
      else b = badness ( pagesofar [1 ]- pagesofar [0 ], pagesofar [7 ]) 
      ;
      if ( b < 1073741823L ) {
	  
	if ( pi <= -10000 ) 
	c = pi ;
	else if ( b < 10000 ) 
	c = b + pi + insertpenalties ;
	else c = 100000L ;
      } 
      else c = b ;
      if ( insertpenalties >= 10000 ) 
      c = 1073741823L ;
	;
#ifdef STAT
      if ( eqtb [114394L ].cint > 0 ) 
      {
	begindiagnostic () ;
	printnl ( 37 ) ;
	print ( 1096 ) ;
	printtotals () ;
	print ( 1167 ) ;
	printscaled ( pagesofar [0 ]) ;
	print ( 1099 ) ;
	if ( b == 1073741823L ) 
	printchar ( 42 ) ;
	else printint ( b ) ;
	print ( 1100 ) ;
	printint ( pi ) ;
	print ( 1168 ) ;
	if ( c == 1073741823L ) 
	printchar ( 42 ) ;
	else printint ( c ) ;
	if ( c <= leastpagecost ) 
	printchar ( 35 ) ;
	enddiagnostic ( false ) ;
      } 
#endif /* STAT */
      if ( c <= leastpagecost ) 
      {
	bestpagebreak = p ;
	bestsize = pagesofar [0 ];
	leastpagecost = c ;
	r = mem [memtop ].hh .v.RH ;
	while ( r != memtop ) {
	    
	  mem [r + 2 ].hh .v.LH = mem [r + 2 ].hh .v.RH ;
	  r = mem [r ].hh .v.RH ;
	} 
      } 
      if ( ( c == 1073741823L ) || ( pi <= -10000 ) ) 
      {
	fireup ( p ) ;
	if ( outputactive ) 
	return ;
	goto lab30 ;
      } 
    } 
    if ( ( mem [p ].hh.b0 < 12 ) || ( mem [p ].hh.b0 > 13 ) ) 
    goto lab80 ;
    lab90: if ( mem [p ].hh.b0 == 13 ) 
    q = p ;
    else {
	
      q = mem [p + 1 ].hh .v.LH ;
      pagesofar [2 + mem [q ].hh.b0 ]= pagesofar [2 + mem [q ].hh.b0 ]
      + mem [q + 2 ].cint ;
      pagesofar [7 ]= pagesofar [7 ]+ mem [q + 3 ].cint ;
      if ( ( mem [q ].hh.b1 != 0 ) && ( mem [q + 3 ].cint != 0 ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1165 ) ;
	} 
	{
	  helpptr = 4 ;
	  helpline [3 ]= 1166 ;
	  helpline [2 ]= 1132 ;
	  helpline [1 ]= 1133 ;
	  helpline [0 ]= 1091 ;
	} 
	error () ;
	r = newspec ( q ) ;
	mem [r ].hh.b1 = 0 ;
	deleteglueref ( q ) ;
	mem [p + 1 ].hh .v.LH = r ;
	q = r ;
      } 
    } 
    pagesofar [1 ]= pagesofar [1 ]+ pagesofar [8 ]+ mem [q + 1 ].cint 
    ;
    pagesofar [8 ]= 0 ;
    lab80: if ( pagesofar [8 ]> pagemaxdepth ) 
    {
      pagesofar [1 ]= pagesofar [1 ]+ pagesofar [8 ]- pagemaxdepth ;
      pagesofar [8 ]= pagemaxdepth ;
    } 
    mem [pagetail ].hh .v.RH = p ;
    pagetail = p ;
    mem [memtop - 1 ].hh .v.RH = mem [p ].hh .v.RH ;
    mem [p ].hh .v.RH = -1073741823L ;
    goto lab30 ;
    lab31: mem [memtop - 1 ].hh .v.RH = mem [p ].hh .v.RH ;
    mem [p ].hh .v.RH = -1073741823L ;
    if ( eqtb [114437L ].cint > 0 ) 
    {
      if ( discptr [2 ]== -1073741823L ) 
      discptr [2 ]= p ;
      else mem [discptr [1 ]].hh .v.RH = p ;
      discptr [1 ]= p ;
    } 
    else flushnodelist ( p ) ;
    lab30: ;
  } while ( ! ( mem [memtop - 1 ].hh .v.RH == -1073741823L ) ) ;
  if ( nestptr == 0 ) 
  curlist .tailfield = memtop - 1 ;
  else nest [0 ].tailfield = memtop - 1 ;
} 
void 
appspace ( void ) 
{
  appspace_regmem 
  halfword q  ;
  if ( ( curlist .auxfield .hh .v.LH >= 2000 ) && ( eqtb [49938L ].hh .v.RH 
  != membot ) ) 
  q = newparamglue ( 13 ) ;
  else {
      
    if ( eqtb [49937L ].hh .v.RH != membot ) 
    mainp = eqtb [49937L ].hh .v.RH ;
    else {
	
      mainp = fontglue [eqtb [50985L ].hh .v.RH ];
      if ( mainp == -1073741823L ) 
      {
	mainp = newspec ( membot ) ;
	maink = parambase [eqtb [50985L ].hh .v.RH ]+ 2 ;
	mem [mainp + 1 ].cint = fontinfo [maink ].cint ;
	mem [mainp + 2 ].cint = fontinfo [maink + 1 ].cint ;
	mem [mainp + 3 ].cint = fontinfo [maink + 2 ].cint ;
	fontglue [eqtb [50985L ].hh .v.RH ]= mainp ;
      } 
    } 
    mainp = newspec ( mainp ) ;
    if ( curlist .auxfield .hh .v.LH >= 2000 ) 
    mem [mainp + 1 ].cint = mem [mainp + 1 ].cint + fontinfo [7 + 
    parambase [eqtb [50985L ].hh .v.RH ]].cint ;
    mem [mainp + 2 ].cint = xnoverd ( mem [mainp + 2 ].cint , curlist 
    .auxfield .hh .v.LH , 1000 ) ;
    mem [mainp + 3 ].cint = xnoverd ( mem [mainp + 3 ].cint , 1000 , 
    curlist .auxfield .hh .v.LH ) ;
    q = newglue ( mainp ) ;
    mem [mainp ].hh .v.RH = -1073741823L ;
  } 
  if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
  .hh.b0 == 5 ) ) 
  {
    mem [curlist .pnodefield ].hh .v.RH = q ;
    mem [q ].hh .v.RH = curlist .tailfield ;
    curlist .pnodefield = q ;
  } 
  else {
      
    mem [curlist .tailfield ].hh .v.RH = q ;
    curlist .tailfield = q ;
  } 
} 
void 
insertdollarsign ( void ) 
{
  insertdollarsign_regmem 
  backinput () ;
  curtok = 196644L ;
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 1189 ) ;
  } 
  {
    helpptr = 2 ;
    helpline [1 ]= 1190 ;
    helpline [0 ]= 1191 ;
  } 
  inserror () ;
} 
void 
youcant ( void ) 
{
  youcant_regmem 
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 789 ) ;
  } 
  printcmdchr ( curcmd , curchr ) ;
  printinmode ( curlist .modefield ) ;
} 
void 
reportillegalcase ( void ) 
{
  reportillegalcase_regmem 
  youcant () ;
  {
    helpptr = 4 ;
    helpline [3 ]= 1192 ;
    helpline [2 ]= 1193 ;
    helpline [1 ]= 1194 ;
    helpline [0 ]= 1195 ;
  } 
  error () ;
} 
boolean 
privileged ( void ) 
{
  register boolean Result; privileged_regmem 
  if ( curlist .modefield > 0 ) 
  Result = true ;
  else {
      
    reportillegalcase () ;
    Result = false ;
  } 
  return Result ;
} 
boolean 
itsallover ( void ) 
{
  /* 10 */ register boolean Result; itsallover_regmem 
  if ( privileged () ) 
  {
    if ( ( memtop - 2 == pagetail ) && ( curlist .headfield == curlist 
    .tailfield ) && ( deadcycles == 0 ) ) 
    {
      Result = true ;
      return Result ;
    } 
    backinput () ;
    {
      mem [curlist .tailfield ].hh .v.RH = newnullbox () ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    mem [curlist .tailfield + 1 ].cint = eqtb [114960L ].cint ;
    {
      mem [curlist .tailfield ].hh .v.RH = newglue ( membot + 12 ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    {
      mem [curlist .tailfield ].hh .v.RH = newpenalty ( -1073741824L ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    buildpage () ;
  } 
  Result = false ;
  return Result ;
} 
void 
appendglue ( void ) 
{
  appendglue_regmem 
  smallnumber s  ;
  s = curchr ;
  switch ( s ) 
  {case 0 : 
    curval = membot + 4 ;
    break ;
  case 1 : 
    curval = membot + 8 ;
    break ;
  case 2 : 
    curval = membot + 12 ;
    break ;
  case 3 : 
    curval = membot + 16 ;
    break ;
  case 4 : 
    curval = membot + 20 ;
    break ;
  case 5 : 
    scanglue ( 2 ) ;
    break ;
  case 6 : 
    scanglue ( 3 ) ;
    break ;
  } 
  {
    mem [curlist .tailfield ].hh .v.RH = newglue ( curval ) ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  curlist .inhibitglueflagfield = false ;
  if ( s >= 5 ) 
  {
    decr ( mem [curval ].hh .v.RH ) ;
    if ( s > 5 ) 
    mem [curlist .tailfield ].hh.b1 = 99 ;
  } 
} 
void 
appendkern ( void ) 
{
  appendkern_regmem 
  quarterword s  ;
  s = curchr ;
  scandimen ( s == 99 , false , false ) ;
  curlist .inhibitglueflagfield = false ;
  if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
  .hh.b0 == 5 ) ) 
  {
    {
      mem [curlist .pnodefield ].hh .v.RH = newkern ( curval ) ;
      mem [mem [curlist .pnodefield ].hh .v.RH ].hh .v.RH = curlist 
      .tailfield ;
      curlist .pnodefield = mem [curlist .pnodefield ].hh .v.RH ;
    } 
    mem [curlist .pnodefield ].hh.b1 = s ;
  } 
  else {
      
    {
      mem [curlist .tailfield ].hh .v.RH = newkern ( curval ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    mem [curlist .tailfield ].hh.b1 = s ;
  } 
} 
void 
offsave ( void ) 
{
  offsave_regmem 
  halfword p  ;
  if ( curgroup == 0 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 935 ) ;
    } 
    printcmdchr ( curcmd , curchr ) ;
    {
      helpptr = 1 ;
      helpline [0 ]= 1215 ;
    } 
    error () ;
  } 
  else {
      
    backinput () ;
    p = getavail () ;
    mem [memtop - 3 ].hh .v.RH = p ;
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 720 ) ;
    } 
    switch ( curgroup ) 
    {case 14 : 
      {
	mem [p ].hh .v.LH = 536909723L ;
	printesc ( 582 ) ;
      } 
      break ;
    case 15 : 
      {
	mem [p ].hh .v.LH = 196644L ;
	printchar ( 36 ) ;
      } 
      break ;
    case 16 : 
      {
	mem [p ].hh .v.LH = 536909724L ;
	mem [p ].hh .v.RH = getavail () ;
	p = mem [p ].hh .v.RH ;
	mem [p ].hh .v.LH = 786478L ;
	printesc ( 1214 ) ;
      } 
      break ;
      default: 
      {
	mem [p ].hh .v.LH = 131197L ;
	printchar ( 125 ) ;
      } 
      break ;
    } 
    print ( 721 ) ;
    begintokenlist ( mem [memtop - 3 ].hh .v.RH , 4 ) ;
    {
      helpptr = 5 ;
      helpline [4 ]= 1209 ;
      helpline [3 ]= 1210 ;
      helpline [2 ]= 1211 ;
      helpline [1 ]= 1212 ;
      helpline [0 ]= 1213 ;
    } 
    error () ;
  } 
} 
void 
extrarightbrace ( void ) 
{
  extrarightbrace_regmem 
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 1220 ) ;
  } 
  switch ( curgroup ) 
  {case 14 : 
    printesc ( 582 ) ;
    break ;
  case 15 : 
    printchar ( 36 ) ;
    break ;
  case 16 : 
    printesc ( 1044 ) ;
    break ;
  } 
  {
    helpptr = 5 ;
    helpline [4 ]= 1221 ;
    helpline [3 ]= 1222 ;
    helpline [2 ]= 1223 ;
    helpline [1 ]= 1224 ;
    helpline [0 ]= 1225 ;
  } 
  error () ;
  incr ( alignstate ) ;
} 
void 
normalparagraph ( void ) 
{
  normalparagraph_regmem 
  if ( eqtb [114380L ].cint != 0 ) 
  eqworddefine ( 114380L , 0 ) ;
  if ( eqtb [114974L ].cint != 0 ) 
  eqworddefine ( 114974L , 0 ) ;
  if ( eqtb [114402L ].cint != 1 ) 
  eqworddefine ( 114402L , 1 ) ;
  if ( eqtb [50458L ].hh .v.RH != -1073741823L ) 
  eqdefine ( 50458L , 136 , -1073741823L ) ;
  if ( eqtb [50725L ].hh .v.RH != -1073741823L ) 
  eqdefine ( 50725L , 136 , -1073741823L ) ;
} 
void 
zboxend ( integer boxcontext ) 
{
  boxend_regmem 
  halfword p  ;
  halfword q  ;
  smallnumber a  ;
  if ( boxcontext < 1073741824L ) 
  {
    if ( curbox != -1073741823L ) 
    {
      p = mem [curbox ].hh .v.RH ;
      mem [curbox ].hh .v.RH = -1073741823L ;
      while ( p != -1073741823L ) {
	  
	q = p ;
	p = mem [p ].hh .v.RH ;
	if ( abs ( ( ( mem [q ].hh.b1 ) % 16 - 5 ) ) == abs ( curlist 
	.dirfield ) ) 
	{
	  mem [q + 5 ].hh .v.RH = curbox ;
	  curbox = q ;
	  mem [curbox ].hh .v.RH = -1073741823L ;
	} 
	else {
	    
	  deleteglueref ( mem [q + 7 ].hh .v.RH ) ;
	  deleteglueref ( mem [q + 7 ].hh .v.LH ) ;
	  freenode ( q , 10 ) ;
	} 
      } 
      if ( abs ( ( ( mem [curbox ].hh.b1 ) % 16 - 5 ) ) != abs ( curlist 
      .dirfield ) ) 
      curbox = newdirnode ( curbox , abs ( curlist .dirfield ) ) ;
      mem [curbox + 4 ].cint = boxcontext ;
      if ( abs ( curlist .modefield ) == 1 ) 
      {
	if ( preadjusttail != -1073741823L ) 
	{
	  if ( memtop - 14 != preadjusttail ) 
	  {
	    mem [curlist .tailfield ].hh .v.RH = mem [memtop - 14 ].hh 
	    .v.RH ;
	    curlist .tailfield = preadjusttail ;
	  } 
	  preadjusttail = -1073741823L ;
	} 
	appendtovlist ( curbox ) ;
	if ( adjusttail != -1073741823L ) 
	{
	  if ( memtop - 5 != adjusttail ) 
	  {
	    mem [curlist .tailfield ].hh .v.RH = mem [memtop - 5 ].hh 
	    .v.RH ;
	    curlist .tailfield = adjusttail ;
	  } 
	  adjusttail = -1073741823L ;
	} 
	if ( curlist .modefield > 0 ) 
	buildpage () ;
      } 
      else {
	  
	if ( abs ( curlist .modefield ) == 120 ) 
	{
	  curlist .auxfield .hh .v.LH = 1000 ;
	  curlist .inhibitglueflagfield = false ;
	} 
	else {
	    
	  p = newnoad () ;
	  mem [p + 1 ].hh .v.RH = 3 ;
	  mem [p + 1 ].hh .v.LH = curbox ;
	  curbox = p ;
	} 
	mem [curlist .tailfield ].hh .v.RH = curbox ;
	curlist .tailfield = curbox ;
      } 
    } 
  } 
  else if ( boxcontext < 1073872896L ) 
  {
    if ( boxcontext < 1073807360L ) 
    {
      curval = boxcontext - 1073741824L ;
      a = 0 ;
    } 
    else {
	
      curval = boxcontext - 1073807360L ;
      a = 4 ;
    } 
    if ( curval < 256 ) {
	
      if ( ( a >= 4 ) ) 
      geqdefine ( 50729L + curval , 137 , curbox ) ;
      else eqdefine ( 50729L + curval , 137 , curbox ) ;
    } 
    else {
	
      findsaelement ( 4 , curval , true ) ;
      if ( ( a >= 4 ) ) 
      gsadef ( curptr , curbox ) ;
      else sadef ( curptr , curbox ) ;
    } 
  } 
  else if ( curbox != -1073741823L ) {
      
    if ( boxcontext > 1073872896L ) 
    {
      do {
	  getxtoken () ;
      } while ( ! ( ( curcmd != 10 ) && ( curcmd != 0 ) ) ) ;
      if ( ( ( curcmd == 32 ) && ( abs ( curlist .modefield ) != 1 ) ) || ( ( 
      curcmd == 33 ) && ( abs ( curlist .modefield ) == 1 ) ) ) 
      {
	appendglue () ;
	mem [curlist .tailfield ].hh.b1 = boxcontext - ( 1073872797L ) ;
	if ( mem [curbox ].hh.b0 <= 2 ) 
	{
	  p = mem [curbox ].hh .v.RH ;
	  mem [curbox ].hh .v.RH = -1073741823L ;
	  while ( p != -1073741823L ) {
	      
	    q = p ;
	    p = mem [p ].hh .v.RH ;
	    if ( abs ( ( ( mem [q ].hh.b1 ) % 16 - 5 ) ) == abs ( curlist 
	    .dirfield ) ) 
	    {
	      mem [q + 5 ].hh .v.RH = curbox ;
	      curbox = q ;
	      mem [curbox ].hh .v.RH = -1073741823L ;
	    } 
	    else {
		
	      deleteglueref ( mem [q + 7 ].hh .v.RH ) ;
	      deleteglueref ( mem [q + 7 ].hh .v.LH ) ;
	      freenode ( q , 10 ) ;
	    } 
	  } 
	  if ( abs ( ( ( mem [curbox ].hh.b1 ) % 16 - 5 ) ) != abs ( curlist 
	  .dirfield ) ) 
	  curbox = newdirnode ( curbox , abs ( curlist .dirfield ) ) ;
	} 
	mem [curlist .tailfield + 1 ].hh .v.RH = curbox ;
      } 
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1252 ) ;
	} 
	{
	  helpptr = 3 ;
	  helpline [2 ]= 1253 ;
	  helpline [1 ]= 1254 ;
	  helpline [0 ]= 1255 ;
	} 
	backerror () ;
	flushnodelist ( curbox ) ;
      } 
    } 
    else shipout ( curbox ) ;
  } 
} 
void 
zbeginbox ( integer boxcontext ) 
{
  /* 10 30 */ beginbox_regmem 
  halfword p, q  ;
  halfword r  ;
  halfword s  ;
  halfword t  ;
  integer fm  ;
  integer gm  ;
  integer fd, gd  ;
  scaled disp, pdisp  ;
  eightbits adir  ;
  halfword tx  ;
  quarterword m  ;
  halfword k  ;
  halfword n  ;
  switch ( curchr ) 
  {case 0 : 
    {
      scanregisternum () ;
      if ( curval < 256 ) 
      curbox = eqtb [50729L + curval ].hh .v.RH ;
      else {
	  
	findsaelement ( 4 , curval , false ) ;
	if ( curptr == -1073741823L ) 
	curbox = -1073741823L ;
	else curbox = mem [curptr + 1 ].hh .v.RH ;
      } 
      if ( curval < 256 ) 
      eqtb [50729L + curval ].hh .v.RH = -1073741823L ;
      else {
	  
	findsaelement ( 4 , curval , false ) ;
	if ( curptr != -1073741823L ) 
	{
	  mem [curptr + 1 ].hh .v.RH = -1073741823L ;
	  incr ( mem [curptr + 1 ].hh .v.LH ) ;
	  deletesaref ( curptr ) ;
	} 
      } 
    } 
    break ;
  case 1 : 
    {
      scanregisternum () ;
      if ( curval < 256 ) 
      q = eqtb [50729L + curval ].hh .v.RH ;
      else {
	  
	findsaelement ( 4 , curval , false ) ;
	if ( curptr == -1073741823L ) 
	q = -1073741823L ;
	else q = mem [curptr + 1 ].hh .v.RH ;
      } 
      curbox = copynodelist ( q ) ;
    } 
    break ;
  case 2 : 
    {
      curbox = -1073741823L ;
      if ( abs ( curlist .modefield ) == 239 ) 
      {
	youcant () ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1261 ;
	} 
	error () ;
      } 
      else if ( ( curlist .modefield == 1 ) && ( curlist .headfield == curlist 
      .tailfield ) ) 
      {
	youcant () ;
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1262 ;
	  helpline [0 ]= 1263 ;
	} 
	error () ;
      } 
      else {
	  
	tx = curlist .tailfield ;
	if ( ! ( tx >= himemmin ) ) {
	    
	  if ( mem [tx ].hh.b0 == 5 ) 
	  tx = curlist .pnodefield ;
	} 
	if ( ! ( tx >= himemmin ) ) {
	    
	  if ( ( mem [tx ].hh.b0 == 5 ) || ( ( mem [tx ].hh.b0 == 11 ) && 
	  ( mem [tx ].hh.b1 == 3 ) ) ) 
	  {
	    r = curlist .headfield ;
	    q = mem [curlist .headfield ].hh .v.RH ;
	    while ( q != tx ) {
		
	      if ( ( q >= himemmin ) ) 
	      r = q ;
	      else if ( ( mem [q ].hh.b0 != 5 ) && ( ( mem [q ].hh.b0 != 
	      11 ) || ( mem [q ].hh.b1 != 3 ) ) ) 
	      r = q ;
	      q = mem [q ].hh .v.RH ;
	    } 
	    tx = r ;
	  } 
	} 
	if ( ! ( tx >= himemmin ) && ( curlist .headfield != tx ) ) {
	    
	  if ( ( mem [tx ].hh.b0 == 0 ) || ( mem [tx ].hh.b0 == 1 ) || ( 
	  mem [tx ].hh.b0 == 2 ) ) 
	  {
	    q = curlist .headfield ;
	    p = -1073741823L ;
	    r = -1073741823L ;
	    fm = 0 ;
	    fd = 0 ;
	    disp = 0 ;
	    pdisp = 0 ;
	    do {
		s = r ;
	      r = p ;
	      p = q ;
	      fm = fm / 2 ;
	      fd = fd / 2 ;
	      if ( ! ( q >= himemmin ) ) {
		  
		if ( mem [q ].hh.b0 == 9 ) 
		{
		  {register integer for_end; m = 1 ;for_end = mem [q ]
		  .hh.b1 ; if ( m <= for_end) do 
		    {
		      p = mem [p ].hh .v.RH ;
		      if ( p == tx ) 
		      goto lab30 ;
		    } 
		  while ( m++ < for_end ) ;} 
		} 
		else if ( ( mem [q ].hh.b0 == 11 ) && ( mem [q ].hh.b1 == 
		2 ) ) 
		fm = 2 ;
		else if ( mem [q ].hh.b0 == 5 ) 
		{
		  pdisp = disp ;
		  disp = mem [q + 1 ].cint ;
		  fd = 2 ;
		} 
	      } 
	      q = mem [p ].hh .v.RH ;
	    } while ( ! ( q == tx ) ) ;
	    q = mem [tx ].hh .v.RH ;
	    mem [p ].hh .v.RH = q ;
	    mem [tx ].hh .v.RH = -1073741823L ;
	    if ( q == -1073741823L ) 
	    {
	      curlist .tailfield = p ;
	      gm = 0 ;
	      gd = 0 ;
	    } 
	    else {
		
	      if ( mem [q ].hh.b0 == 11 ) 
	      {
		gm = 2 ;
		if ( mem [q ].hh .v.RH == -1073741823L ) 
		gd = 0 ;
		else if ( mem [mem [q ].hh .v.RH ].hh.b0 == 5 ) 
		gd = 1 ;
		else confusion ( 1257 ) ;
	      } 
	      else if ( mem [q ].hh.b0 == 5 ) 
	      {
		curlist .pnodefield = p ;
		gd = 2 ;
		if ( mem [q ].hh .v.RH == -1073741823L ) 
		gm = 0 ;
		else if ( mem [mem [q ].hh .v.RH ].hh.b0 == 11 ) 
		gm = 1 ;
		else confusion ( 1258 ) ;
	      } 
	      else confusion ( 1259 ) ;
	    } 
	    if ( gm == 0 ) {
		
	      if ( fm == 2 ) 
	      confusion ( 1256 ) ;
	      else if ( fm == 1 ) 
	      confusion ( 1260 ) ;
	    } 
	    if ( ( fm + fd ) == 1 ) 
	    {
	      fm = 0 ;
	      fd = 0 ;
	    } 
	    if ( gm == 0 ) 
	    fm = 0 ;
	    if ( gd == 0 ) 
	    fd = 0 ;
	    if ( fd > 0 ) 
	    {
	      if ( gm == 0 ) 
	      {
		t = q ;
		q = -1073741823L ;
		mem [p ].hh .v.RH = q ;
		curlist .tailfield = p ;
	      } 
	      else if ( gm == 1 ) 
	      {
		t = q ;
		q = mem [q ].hh .v.RH ;
		mem [p ].hh .v.RH = q ;
		gm = 2 ;
	      } 
	      else {
		  
		t = mem [q ].hh .v.RH ;
		mem [q ].hh .v.RH = -1073741823L ;
		curlist .tailfield = q ;
	      } 
	      if ( fd == 1 ) 
	      {
		curlist .pnodefield = s ;
		mem [r + 1 ].cint = mem [t + 1 ].cint ;
	      } 
	      else {
		  
		curlist .pnodefield = r ;
		mem [p + 1 ].cint = mem [t + 1 ].cint ;
	      } 
	      curlist .pdispfield = pdisp ;
	      freenode ( t , 2 ) ;
	      gd = 0 ;
	    } 
	    if ( fm > 0 ) 
	    {
	      if ( gd == 0 ) 
	      {
		t = q ;
		q = -1073741823L ;
		mem [p ].hh .v.RH = q ;
		curlist .tailfield = p ;
	      } 
	      else if ( gd == 1 ) 
	      {
		t = q ;
		q = mem [q ].hh .v.RH ;
		mem [p ].hh .v.RH = q ;
		curlist .pnodefield = p ;
		mem [t ].hh .v.RH = -1073741823L ;
	      } 
	      else {
		  
		t = mem [q ].hh .v.RH ;
		mem [q ].hh .v.RH = -1073741823L ;
		curlist .tailfield = q ;
	      } 
	      if ( fm == 1 ) 
	      {
		mem [s ].hh .v.RH = p ;
		mem [r ].hh .v.RH = t ;
		t = r ;
		curlist .pnodefield = s ;
	      } 
	      else {
		  
		mem [r ].hh .v.RH = q ;
		mem [p ].hh .v.RH = t ;
		t = p ;
		if ( q == -1073741823L ) 
		curlist .tailfield = r ;
		else curlist .pnodefield = r ;
	      } 
	      flushnodelist ( t ) ;
	    } 
	    curbox = tx ;
	    mem [curbox + 4 ].cint = 0 ;
	    if ( mem [curbox ].hh.b0 == 2 ) 
	    {
	      mem [mem [curbox + 5 ].hh .v.RH ].hh .v.RH = curbox ;
	      curbox = mem [curbox + 5 ].hh .v.RH ;
	      mem [mem [curbox ].hh .v.RH + 5 ].hh .v.RH = -1073741823L ;
	    } 
	    else if ( ( ( mem [curbox ].hh.b1 ) % 16 - 5 ) == 0 ) 
	    mem [curbox ].hh.b1 = ( ( mem [curbox ].hh.b1 ) / 16 ) * 16 + 
	    curlist .dirfield + 5 ;
	  } 
	} 
	lab30: ;
      } 
    } 
    break ;
  case 3 : 
    {
      scanregisternum () ;
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
	  helpline [1 ]= 1265 ;
	  helpline [0 ]= 1266 ;
	} 
	error () ;
      } 
      scandimen ( false , false , false ) ;
      curbox = vsplit ( n , curval ) ;
    } 
    break ;
    default: 
    {
      k = curchr - 4 ;
      savestack [saveptr + 0 ].cint = boxcontext ;
      adir = curlist .adjdirfield ;
      if ( k == 120 ) {
	  
	if ( ( boxcontext < 1073741824L ) && ( abs ( curlist .modefield ) == 1 
	) ) 
	{
	  adir = abs ( curlist .dirfield ) ;
	  scanspec ( 3 , true ) ;
	} 
	else scanspec ( 2 , true ) ;
      } 
      else {
	  
	if ( k == 1 ) 
	scanspec ( 4 , true ) ;
	else {
	    
	  scanspec ( 5 , true ) ;
	  k = 1 ;
	} 
	normalparagraph () ;
      } 
      pushnest () ;
      curlist .modefield = - (integer) k ;
      curlist .adjdirfield = adir ;
      if ( k == 1 ) 
      {
	curlist .auxfield .cint = -65536000L ;
	if ( eqtb [50464L ].hh .v.RH != -1073741823L ) 
	begintokenlist ( eqtb [50464L ].hh .v.RH , 11 ) ;
      } 
      else {
	  
	curlist .auxfield .hh .v.LH = 1000 ;
	curlist .inhibitglueflagfield = false ;
	if ( eqtb [50463L ].hh .v.RH != -1073741823L ) 
	begintokenlist ( eqtb [50463L ].hh .v.RH , 10 ) ;
      } 
      return ;
    } 
    break ;
  } 
  boxend ( boxcontext ) ;
} 
void 
zscanbox ( integer boxcontext ) 
{
  scanbox_regmem 
  do {
      getxtoken () ;
  } while ( ! ( ( curcmd != 10 ) && ( curcmd != 0 ) ) ) ;
  if ( curcmd == 26 ) 
  beginbox ( boxcontext ) ;
  else if ( ( boxcontext >= 1073872897L ) && ( ( curcmd == 42 ) || ( curcmd == 
  41 ) ) ) 
  {
    curbox = scanrulespec () ;
    boxend ( boxcontext ) ;
  } 
  else {
      
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1267 ) ;
    } 
    {
      helpptr = 3 ;
      helpline [2 ]= 1268 ;
      helpline [1 ]= 1269 ;
      helpline [0 ]= 1270 ;
    } 
    backerror () ;
  } 
} 
void 
zpackage ( smallnumber c ) 
{
  package_regmem 
  scaled h  ;
  halfword p  ;
  scaled d  ;
  d = eqtb [114964L ].cint ;
  deleteglueref ( curkanjiskip ) ;
  deleteglueref ( curxkanjiskip ) ;
  if ( eqtb [51756L ].hh .v.RH > 0 ) 
  curkanjiskip = eqtb [49940L ].hh .v.RH ;
  else curkanjiskip = membot ;
  if ( eqtb [51757L ].hh .v.RH > 0 ) 
  curxkanjiskip = eqtb [49941L ].hh .v.RH ;
  else curxkanjiskip = membot ;
  incr ( mem [curkanjiskip ].hh .v.RH ) ;
  incr ( mem [curxkanjiskip ].hh .v.RH ) ;
  unsave () ;
  saveptr = saveptr - 3 ;
  if ( curlist .modefield == -120 ) 
  {
    curbox = hpack ( mem [curlist .headfield ].hh .v.RH , savestack [
    saveptr + 2 ].cint , savestack [saveptr + 1 ].cint ) ;
    mem [curbox ].hh.b1 = ( ( mem [curbox ].hh.b1 ) / 16 ) * 16 + curlist 
    .dirfield + 5 ;
    popnest () ;
  } 
  else {
      
    curbox = vpackage ( mem [curlist .headfield ].hh .v.RH , savestack [
    saveptr + 2 ].cint , savestack [saveptr + 1 ].cint , d ) ;
    mem [curbox ].hh.b1 = ( ( mem [curbox ].hh.b1 ) / 16 ) * 16 + curlist 
    .dirfield + 5 ;
    popnest () ;
    if ( c == 4 ) 
    {
      h = 0 ;
      p = mem [curbox + 5 ].hh .v.RH ;
      if ( p != -1073741823L ) {
	  
	if ( mem [p ].hh.b0 <= 3 ) 
	h = mem [p + 3 ].cint ;
      } 
      mem [curbox + 2 ].cint = mem [curbox + 2 ].cint - h + mem [curbox + 
      3 ].cint ;
      mem [curbox + 3 ].cint = h ;
    } 
  } 
  boxend ( savestack [saveptr + 0 ].cint ) ;
} 
smallnumber 
znormmin ( integer h ) 
{
  register smallnumber Result; normmin_regmem 
  if ( h <= 0 ) 
  Result = 1 ;
  else if ( h >= 63 ) 
  Result = 63 ;
  else Result = h ;
  return Result ;
} 
void 
znewgraf ( boolean indented ) 
{
  newgraf_regmem 
  curlist .pgfield = 0 ;
  if ( ( curlist .modefield == 1 ) || ( curlist .headfield != curlist 
  .tailfield ) ) 
  {
    mem [curlist .tailfield ].hh .v.RH = newparamglue ( 2 ) ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  curlist .inhibitglueflagfield = false ;
  pushnest () ;
  curlist .adjdirfield = curlist .dirfield ;
  curlist .modefield = 120 ;
  curlist .auxfield .hh .v.LH = 1000 ;
  if ( eqtb [114412L ].cint <= 0 ) 
  curlang = 0 ;
  else if ( eqtb [114412L ].cint > 255 ) 
  curlang = 0 ;
  else curlang = eqtb [114412L ].cint ;
  curlist .auxfield .hh .v.RH = curlang ;
  curlist .pgfield = ( normmin ( eqtb [114413L ].cint ) * 64 + normmin ( 
  eqtb [114414L ].cint ) ) * 65536L + curlang ;
  if ( indented ) 
  {
    curlist .tailfield = newnullbox () ;
    mem [curlist .headfield ].hh .v.RH = curlist .tailfield ;
    mem [curlist .tailfield + 1 ].cint = eqtb [114957L ].cint ;
    if ( ( insertsrcspecialeverypar ) ) 
    insertsrcspecial () ;
  } 
  if ( eqtb [50460L ].hh .v.RH != -1073741823L ) 
  begintokenlist ( eqtb [50460L ].hh .v.RH , 7 ) ;
  if ( nestptr == 1 ) 
  buildpage () ;
} 
void 
indentinhmode ( void ) 
{
  indentinhmode_regmem 
  halfword p, q  ;
  if ( curchr > 0 ) 
  {
    p = newnullbox () ;
    mem [p + 1 ].cint = eqtb [114957L ].cint ;
    if ( abs ( curlist .modefield ) == 120 ) 
    {
      curlist .auxfield .hh .v.LH = 1000 ;
      curlist .inhibitglueflagfield = false ;
    } 
    else {
	
      q = newnoad () ;
      mem [q + 1 ].hh .v.RH = 2 ;
      mem [q + 1 ].hh .v.LH = p ;
      p = q ;
    } 
    {
      mem [curlist .tailfield ].hh .v.RH = p ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
  } 
} 
void 
headforvmode ( void ) 
{
  headforvmode_regmem 
  if ( curlist .modefield < 0 ) {
      
    if ( curcmd != 42 ) 
    offsave () ;
    else {
	
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 789 ) ;
      } 
      printesc ( 589 ) ;
      print ( 1273 ) ;
      {
	helpptr = 2 ;
	helpline [1 ]= 1274 ;
	helpline [0 ]= 1275 ;
      } 
      error () ;
    } 
  } 
  else {
      
    backinput () ;
    curtok = partoken ;
    backinput () ;
    curinput .indexfield = 4 ;
  } 
} 
void 
endgraf ( void ) 
{
  endgraf_regmem 
  if ( curlist .modefield == 120 ) 
  {
    if ( ( mem [curlist .headfield ].hh .v.RH == curlist .tailfield ) && ( ! 
    ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ].hh.b0 
    == 5 ) ) ) 
    {
      freenode ( curlist .tailfield , 2 ) ;
      curlist .tailfield = curlist .headfield ;
      mem [curlist .headfield ].hh .v.RH = -1073741823L ;
    } 
    if ( curlist .headfield == curlist .tailfield ) 
    popnest () ;
    else {
	
      adjusthlist ( curlist .headfield , true ) ;
      linebreak ( false ) ;
    } 
    if ( curlist .eTeXauxfield != -1073741823L ) 
    {
      flushlist ( curlist .eTeXauxfield ) ;
      curlist .eTeXauxfield = -1073741823L ;
    } 
    normalparagraph () ;
    errorcount = 0 ;
  } 
} 
void 
begininsertoradjust ( void ) 
{
  begininsertoradjust_regmem 
  if ( curcmd == 44 ) 
  curval = 255 ;
  else {
      
    scaneightbitint () ;
    if ( curval == 255 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1276 ) ;
      } 
      printesc ( 341 ) ;
      printint ( 255 ) ;
      {
	helpptr = 1 ;
	helpline [0 ]= 1277 ;
      } 
      error () ;
      curval = 0 ;
    } 
  } 
  savestack [saveptr + 0 ].cint = curval ;
  if ( ( curcmd == 44 ) && scankeyword ( 456 ) ) 
  savestack [saveptr + 1 ].cint = 1 ;
  else savestack [saveptr + 1 ].cint = 0 ;
  saveptr = saveptr + 2 ;
  curlist .inhibitglueflagfield = false ;
  newsavelevel ( 11 ) ;
  scanleftbrace () ;
  normalparagraph () ;
  pushnest () ;
  curlist .modefield = -1 ;
  curlist .dirfield = curlist .adjdirfield ;
  curlist .auxfield .cint = -65536000L ;
} 
void 
makemark ( void ) 
{
  makemark_regmem 
  halfword p  ;
  halfword c  ;
  if ( curchr == 0 ) 
  c = 0 ;
  else {
      
    scanregisternum () ;
    c = curval ;
  } 
  p = scantoks ( false , true ) ;
  p = getnode ( 2 ) ;
  mem [p + 1 ].hh .v.LH = c ;
  mem [p ].hh.b0 = 6 ;
  mem [p ].hh.b1 = 0 ;
  curlist .inhibitglueflagfield = false ;
  mem [p + 1 ].hh .v.RH = defref ;
  if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
  .hh.b0 == 5 ) ) 
  {
    mem [curlist .pnodefield ].hh .v.RH = p ;
    mem [mem [curlist .pnodefield ].hh .v.RH ].hh .v.RH = curlist 
    .tailfield ;
    curlist .pnodefield = mem [curlist .pnodefield ].hh .v.RH ;
  } 
  else {
      
    mem [curlist .tailfield ].hh .v.RH = p ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
} 
void 
appendpenalty ( void ) 
{
  appendpenalty_regmem 
  scanint () ;
  curlist .inhibitglueflagfield = false ;
  if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
  .hh.b0 == 5 ) ) 
  {
    mem [curlist .pnodefield ].hh .v.RH = newpenalty ( curval ) ;
    mem [mem [curlist .pnodefield ].hh .v.RH ].hh .v.RH = curlist 
    .tailfield ;
    curlist .pnodefield = mem [curlist .pnodefield ].hh .v.RH ;
  } 
  else {
      
    mem [curlist .tailfield ].hh .v.RH = newpenalty ( curval ) ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  if ( curlist .modefield == 1 ) 
  buildpage () ;
} 
void 
deletelast ( void ) 
{
  /* 10 */ deletelast_regmem 
  halfword p, q  ;
  halfword r  ;
  halfword s  ;
  halfword t  ;
  integer fm  ;
  integer gm  ;
  integer fd, gd  ;
  scaled disp, pdisp  ;
  halfword tx  ;
  quarterword m  ;
  if ( ( curlist .modefield == 1 ) && ( curlist .tailfield == curlist 
  .headfield ) ) 
  {
    if ( ( curchr != 12 ) || ( lastglue != 1073741823L ) ) 
    {
      youcant () ;
      {
	helpptr = 2 ;
	helpline [1 ]= 1262 ;
	helpline [0 ]= 1280 ;
      } 
      if ( curchr == 13 ) 
      helpline [0 ]= ( 1281 ) ;
      else if ( curchr != 12 ) 
      helpline [0 ]= ( 1282 ) ;
      error () ;
    } 
  } 
  else {
      
    tx = curlist .tailfield ;
    if ( ! ( tx >= himemmin ) ) {
	
      if ( mem [tx ].hh.b0 == 5 ) 
      tx = curlist .pnodefield ;
    } 
    if ( ! ( tx >= himemmin ) ) {
	
      if ( ( mem [tx ].hh.b0 == 5 ) || ( ( mem [tx ].hh.b0 == 11 ) && ( 
      mem [tx ].hh.b1 == 3 ) ) ) 
      {
	r = curlist .headfield ;
	q = mem [curlist .headfield ].hh .v.RH ;
	while ( q != tx ) {
	    
	  if ( ( q >= himemmin ) ) 
	  r = q ;
	  else if ( ( mem [q ].hh.b0 != 5 ) && ( ( mem [q ].hh.b0 != 11 ) 
	  || ( mem [q ].hh.b1 != 3 ) ) ) 
	  r = q ;
	  q = mem [q ].hh .v.RH ;
	} 
	tx = r ;
      } 
    } 
    if ( ! ( tx >= himemmin ) ) {
	
      if ( mem [tx ].hh.b0 == curchr ) 
      {
	q = curlist .headfield ;
	p = -1073741823L ;
	r = -1073741823L ;
	fm = 0 ;
	fd = 0 ;
	disp = 0 ;
	pdisp = 0 ;
	do {
	    s = r ;
	  r = p ;
	  p = q ;
	  fm = fm / 2 ;
	  fd = fd / 2 ;
	  if ( ! ( q >= himemmin ) ) {
	      
	    if ( mem [q ].hh.b0 == 9 ) 
	    {
	      {register integer for_end; m = 1 ;for_end = mem [q ].hh.b1 
	      ; if ( m <= for_end) do 
		{
		  p = mem [p ].hh .v.RH ;
		  if ( p == tx ) 
		  return ;
		} 
	      while ( m++ < for_end ) ;} 
	    } 
	    else if ( ( mem [q ].hh.b0 == 11 ) && ( mem [q ].hh.b1 == 2 ) 
	    ) 
	    fm = 2 ;
	    else if ( mem [q ].hh.b0 == 5 ) 
	    {
	      pdisp = disp ;
	      disp = mem [q + 1 ].cint ;
	      fd = 2 ;
	    } 
	  } 
	  q = mem [p ].hh .v.RH ;
	} while ( ! ( q == tx ) ) ;
	q = mem [tx ].hh .v.RH ;
	mem [p ].hh .v.RH = q ;
	mem [tx ].hh .v.RH = -1073741823L ;
	if ( q == -1073741823L ) 
	{
	  curlist .tailfield = p ;
	  gm = 0 ;
	  gd = 0 ;
	} 
	else {
	    
	  if ( mem [q ].hh.b0 == 11 ) 
	  {
	    gm = 2 ;
	    if ( mem [q ].hh .v.RH == -1073741823L ) 
	    gd = 0 ;
	    else if ( mem [mem [q ].hh .v.RH ].hh.b0 == 5 ) 
	    gd = 1 ;
	    else confusion ( 1257 ) ;
	  } 
	  else if ( mem [q ].hh.b0 == 5 ) 
	  {
	    curlist .pnodefield = p ;
	    gd = 2 ;
	    if ( mem [q ].hh .v.RH == -1073741823L ) 
	    gm = 0 ;
	    else if ( mem [mem [q ].hh .v.RH ].hh.b0 == 11 ) 
	    gm = 1 ;
	    else confusion ( 1258 ) ;
	  } 
	  else confusion ( 1259 ) ;
	} 
	if ( gm == 0 ) {
	    
	  if ( fm == 2 ) 
	  confusion ( 1256 ) ;
	  else if ( fm == 1 ) 
	  confusion ( 1260 ) ;
	} 
	if ( ( fm + fd ) == 1 ) 
	{
	  fm = 0 ;
	  fd = 0 ;
	} 
	if ( gm == 0 ) 
	fm = 0 ;
	if ( gd == 0 ) 
	fd = 0 ;
	if ( fd > 0 ) 
	{
	  if ( gm == 0 ) 
	  {
	    t = q ;
	    q = -1073741823L ;
	    mem [p ].hh .v.RH = q ;
	    curlist .tailfield = p ;
	  } 
	  else if ( gm == 1 ) 
	  {
	    t = q ;
	    q = mem [q ].hh .v.RH ;
	    mem [p ].hh .v.RH = q ;
	    gm = 2 ;
	  } 
	  else {
	      
	    t = mem [q ].hh .v.RH ;
	    mem [q ].hh .v.RH = -1073741823L ;
	    curlist .tailfield = q ;
	  } 
	  if ( fd == 1 ) 
	  {
	    curlist .pnodefield = s ;
	    mem [r + 1 ].cint = mem [t + 1 ].cint ;
	  } 
	  else {
	      
	    curlist .pnodefield = r ;
	    mem [p + 1 ].cint = mem [t + 1 ].cint ;
	  } 
	  curlist .pdispfield = pdisp ;
	  freenode ( t , 2 ) ;
	  gd = 0 ;
	} 
	if ( fm > 0 ) 
	{
	  if ( gd == 0 ) 
	  {
	    t = q ;
	    q = -1073741823L ;
	    mem [p ].hh .v.RH = q ;
	    curlist .tailfield = p ;
	  } 
	  else if ( gd == 1 ) 
	  {
	    t = q ;
	    q = mem [q ].hh .v.RH ;
	    mem [p ].hh .v.RH = q ;
	    curlist .pnodefield = p ;
	    mem [t ].hh .v.RH = -1073741823L ;
	  } 
	  else {
	      
	    t = mem [q ].hh .v.RH ;
	    mem [q ].hh .v.RH = -1073741823L ;
	    curlist .tailfield = q ;
	  } 
	  if ( fm == 1 ) 
	  {
	    mem [s ].hh .v.RH = p ;
	    mem [r ].hh .v.RH = t ;
	    t = r ;
	    curlist .pnodefield = s ;
	  } 
	  else {
	      
	    mem [r ].hh .v.RH = q ;
	    mem [p ].hh .v.RH = t ;
	    t = p ;
	    if ( q == -1073741823L ) 
	    curlist .tailfield = r ;
	    else curlist .pnodefield = r ;
	  } 
	  flushnodelist ( t ) ;
	} 
	flushnodelist ( tx ) ;
      } 
    } 
  } 
} 
void 
unpackage ( void ) 
{
  /* 30 10 */ unpackage_regmem 
  halfword p  ;
  unsigned char c  ;
  scaled disp  ;
  if ( curchr > 1 ) 
  {
    mem [curlist .tailfield ].hh .v.RH = discptr [curchr ];
    discptr [curchr ]= -1073741823L ;
    goto lab30 ;
  } 
  c = curchr ;
  scanregisternum () ;
  if ( curval < 256 ) 
  p = eqtb [50729L + curval ].hh .v.RH ;
  else {
      
    findsaelement ( 4 , curval , false ) ;
    if ( curptr == -1073741823L ) 
    p = -1073741823L ;
    else p = mem [curptr + 1 ].hh .v.RH ;
  } 
  if ( p == -1073741823L ) 
  return ;
  if ( mem [p ].hh.b0 == 2 ) 
  p = mem [p + 5 ].hh .v.RH ;
  if ( ( abs ( curlist .modefield ) == 239 ) || ( ( abs ( curlist .modefield ) 
  == 1 ) && ( mem [p ].hh.b0 != 1 ) ) || ( ( abs ( curlist .modefield ) == 
  120 ) && ( mem [p ].hh.b0 != 0 ) ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1290 ) ;
    } 
    {
      helpptr = 3 ;
      helpline [2 ]= 1291 ;
      helpline [1 ]= 1292 ;
      helpline [0 ]= 1293 ;
    } 
    error () ;
    return ;
  } 
  switch ( abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) ) ) 
  {case 4 : 
  case 3 : 
  case 1 : 
    if ( abs ( curlist .dirfield ) != abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) 
    ) ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1294 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 1291 ;
	helpline [0 ]= 1295 ;
      } 
      error () ;
      return ;
    } 
    break ;
  } 
  disp = 0 ;
  if ( c == 1 ) 
  mem [curlist .tailfield ].hh .v.RH = copynodelist ( mem [p + 5 ].hh 
  .v.RH ) ;
  else {
      
    if ( mem [p ].hh.b0 == 2 ) 
    {
      deleteglueref ( mem [p + 7 ].hh .v.RH ) ;
      deleteglueref ( mem [p + 7 ].hh .v.LH ) ;
      freenode ( p , 10 ) ;
    } 
    flushnodelist ( mem [p ].hh .v.RH ) ;
    mem [curlist .tailfield ].hh .v.RH = mem [p + 5 ].hh .v.RH ;
    if ( curval < 256 ) 
    eqtb [50729L + curval ].hh .v.RH = -1073741823L ;
    else {
	
      findsaelement ( 4 , curval , false ) ;
      if ( curptr != -1073741823L ) 
      {
	mem [curptr + 1 ].hh .v.RH = -1073741823L ;
	incr ( mem [curptr + 1 ].hh .v.LH ) ;
	deletesaref ( curptr ) ;
      } 
    } 
    deleteglueref ( mem [p + 7 ].hh .v.RH ) ;
    deleteglueref ( mem [p + 7 ].hh .v.LH ) ;
    freenode ( p , 10 ) ;
  } 
  lab30: while ( mem [curlist .tailfield ].hh .v.RH != -1073741823L ) {
      
    p = curlist .tailfield ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    if ( ( curlist .tailfield >= himemmin ) ) 
    {
      curlist .inhibitglueflagfield = false ;
      if ( fontdir [mem [curlist .tailfield ].hh.b0 ]!= 0 ) 
      curlist .lastjchrfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    else switch ( mem [curlist .tailfield ].hh.b0 ) 
    {case 12 : 
      {
	curlist .inhibitglueflagfield = false ;
	if ( ( mem [curlist .tailfield ].hh.b1 == 16 ) || ( mem [curlist 
	.tailfield ].hh.b1 == 17 ) ) 
	{
	  mem [p ].hh .v.RH = mem [curlist .tailfield ].hh .v.RH ;
	  deleteglueref ( mem [curlist .tailfield + 1 ].hh .v.LH ) ;
	  freenode ( curlist .tailfield , 2 ) ;
	  curlist .tailfield = p ;
	} 
      } 
      break ;
    case 14 : 
      {
	curlist .inhibitglueflagfield = false ;
	if ( mem [curlist .tailfield ].hh.b1 == 1 ) 
	{
	  mem [p ].hh .v.RH = mem [curlist .tailfield ].hh .v.RH ;
	  freenode ( curlist .tailfield , 2 ) ;
	  curlist .tailfield = p ;
	} 
      } 
      break ;
    case 5 : 
      {
	curlist .pdispfield = disp ;
	disp = mem [curlist .tailfield + 1 ].cint ;
	curlist .pnodefield = p ;
      } 
      break ;
      default: 
      curlist .inhibitglueflagfield = false ;
      break ;
    } 
  } 
} 
void 
appenditaliccorrection ( void ) 
{
  /* 10 */ appenditaliccorrection_regmem 
  halfword p  ;
  internalfontnumber f  ;
  halfword d  ;
  if ( curlist .tailfield != curlist .headfield ) 
  {
    if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
    .hh.b0 == 5 ) ) 
    {
      d = curlist .tailfield ;
      curlist .tailfield = curlist .pnodefield ;
    } 
    else d = -1073741823L ;
    if ( ( curlist .lastjchrfield != -1073741823L ) && ( mem [curlist 
    .lastjchrfield ].hh .v.RH == curlist .tailfield ) && ( ( curlist 
    .tailfield >= himemmin ) ) ) 
    p = curlist .lastjchrfield ;
    else if ( ( curlist .tailfield >= himemmin ) ) 
    p = curlist .tailfield ;
    else if ( mem [curlist .tailfield ].hh.b0 == 8 ) 
    p = curlist .tailfield + 1 ;
    else return ;
    f = mem [p ].hh.b0 ;
    {
      mem [curlist .tailfield ].hh .v.RH = newkern ( fontinfo [italicbase [
      f ]+ ( fontinfo [charbase [f ]+ effectivechar ( true , f , mem [p ]
      .hh.b1 ) ].qqqq .b2 ) / 256 ].cint ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    mem [curlist .tailfield ].hh.b1 = 3 ;
    if ( d != -1073741823L ) 
    {
      curlist .pnodefield = curlist .tailfield ;
      {
	mem [curlist .tailfield ].hh .v.RH = d ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
    } 
  } 
} 
void 
appenddiscretionary ( void ) 
{
  appenddiscretionary_regmem 
  integer c  ;
  {
    mem [curlist .tailfield ].hh .v.RH = newdisc () ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  curlist .inhibitglueflagfield = false ;
  if ( curchr == 1 ) 
  {
    c = hyphenchar [eqtb [50985L ].hh .v.RH ];
    if ( c >= 0 ) {
	
      if ( c < 11904 ) 
      mem [curlist .tailfield + 1 ].hh .v.LH = newcharacter ( eqtb [50985L 
      ].hh .v.RH , c ) ;
    } 
  } 
  else {
      
    incr ( saveptr ) ;
    savestack [saveptr - 1 ].cint = 0 ;
    newsavelevel ( 10 ) ;
    scanleftbrace () ;
    pushnest () ;
    curlist .modefield = -120 ;
    curlist .auxfield .hh .v.LH = 1000 ;
  } 
} 
void 
builddiscretionary ( void ) 
{
  /* 30 10 */ builddiscretionary_regmem 
  halfword p, q  ;
  integer n  ;
  integer d  ;
  unsave () ;
  q = curlist .headfield ;
  p = mem [q ].hh .v.RH ;
  n = 0 ;
  while ( p != -1073741823L ) {
      
    if ( ! ( p >= himemmin ) ) {
	
      if ( ( mem [p ].hh.b0 > 3 ) && ( mem [p ].hh.b0 != 13 ) && ( mem [p 
      ].hh.b0 != 8 ) && ( mem [p ].hh.b0 != 5 ) ) {
	  
	if ( ( mem [p ].hh.b0 == 14 ) && ( mem [p ].hh.b1 != 0 ) ) 
	{
	  mem [q ].hh .v.RH = mem [p ].hh .v.RH ;
	  freenode ( p , 2 ) ;
	  p = q ;
	} 
	else {
	    
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1306 ) ;
	  } 
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 1307 ;
	  } 
	  error () ;
	  begindiagnostic () ;
	  printnl ( 1308 ) ;
	  showbox ( p ) ;
	  enddiagnostic ( true ) ;
	  flushnodelist ( p ) ;
	  mem [q ].hh .v.RH = -1073741823L ;
	  goto lab30 ;
	} 
      } 
    } 
    q = p ;
    p = mem [q ].hh .v.RH ;
    incr ( n ) ;
  } 
  lab30: ;
  p = mem [curlist .headfield ].hh .v.RH ;
  d = abs ( curlist .dirfield ) ;
  popnest () ;
  switch ( savestack [saveptr - 1 ].cint ) 
  {case 0 : 
    if ( abs ( curlist .dirfield ) == d ) 
    mem [curlist .tailfield + 1 ].hh .v.LH = p ;
    else {
	
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1278 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 1296 ;
	helpline [0 ]= 1297 ;
      } 
      error () ;
      mem [curlist .tailfield + 1 ].hh .v.LH = -1073741823L ;
      flushnodelist ( p ) ;
    } 
    break ;
  case 1 : 
    if ( abs ( curlist .dirfield ) == d ) 
    mem [curlist .tailfield + 1 ].hh .v.RH = p ;
    else {
	
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1278 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 1296 ;
	helpline [0 ]= 1298 ;
      } 
      error () ;
      mem [curlist .tailfield + 1 ].hh .v.RH = -1073741823L ;
      flushnodelist ( p ) ;
    } 
    break ;
  case 2 : 
    {
      if ( ( n > 0 ) && ( abs ( curlist .modefield ) == 239 ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1299 ) ;
	} 
	printesc ( 364 ) ;
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1300 ;
	  helpline [0 ]= 1301 ;
	} 
	flushnodelist ( p ) ;
	n = 0 ;
	error () ;
      } 
      else if ( ( n > 0 ) && ( abs ( curlist .dirfield ) != d ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1278 ) ;
	} 
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1296 ;
	  helpline [0 ]= 1302 ;
	} 
	flushnodelist ( p ) ;
	n = 0 ;
	error () ;
      } 
      else mem [curlist .tailfield ].hh .v.RH = p ;
      if ( n <= 65535L ) 
      mem [curlist .tailfield ].hh.b1 = n ;
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1303 ) ;
	} 
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1304 ;
	  helpline [0 ]= 1305 ;
	} 
	error () ;
      } 
      if ( n > 0 ) 
      curlist .tailfield = q ;
      decr ( saveptr ) ;
      curlist .pnodefield = curlist .tailfield ;
      {
	mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      mem [curlist .tailfield ].hh.b0 = 5 ;
      mem [curlist .tailfield + 1 ].cint = 0 ;
      curlist .pdispfield = 0 ;
      return ;
    } 
    break ;
  } 
  incr ( savestack [saveptr - 1 ].cint ) ;
  newsavelevel ( 10 ) ;
  scanleftbrace () ;
  pushnest () ;
  curlist .modefield = -120 ;
  curlist .auxfield .hh .v.LH = 1000 ;
  curlist .inhibitglueflagfield = false ;
} 
void 
makeaccent ( void ) 
{
  makeaccent_regmem 
  real s, t  ;
  scaled disp  ;
  KANJIcode cx  ;
  halfword p, q, r  ;
  internalfontnumber f  ;
  scaled a, h, x, w, delta  ;
  fourquarters i  ;
  scancharnum () ;
  if ( checkecharrange ( curval ) == 0 ) 
  {
    cx = curval ;
    if ( curlist .dirfield == 3 ) 
    f = eqtb [51755L ].hh .v.RH ;
    else f = eqtb [51754L ].hh .v.RH ;
    p = newcharacter ( f , getjfmpos ( cx , f ) ) ;
    if ( p != -1073741823L ) 
    {
      mem [p ].hh .v.RH = getavail () ;
      if ( ( eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH == 16 ) && ( cx >= 
      16777216L ) ) 
      mem [mem [p ].hh .v.RH ].hh .v.LH = cx + 23 * 16777216L ;
      else mem [mem [p ].hh .v.RH ].hh .v.LH = cx + eqtb [63663L + 
      kcatcodekey ( cx ) ].hh .v.RH * 16777216L ;
    } 
  } 
  else {
      
    f = eqtb [50985L ].hh .v.RH ;
    p = newcharacter ( f , curval ) ;
  } 
  if ( p != -1073741823L ) 
  {
    x = fontinfo [5 + parambase [f ]].cint ;
    s = fontinfo [1 + parambase [f ]].cint / ((double) 65536.0 ) ;
    a = fontinfo [widthbase [f ]+ fontinfo [charbase [f ]+ effectivechar 
    ( true , f , mem [p ].hh.b1 ) ].qqqq .b0 ].cint ;
    doassignments () ;
    q = -1073741823L ;
    f = eqtb [50985L ].hh .v.RH ;
    cx = 0 ;
    if ( ( curcmd == 11 ) || ( curcmd == 12 ) ) 
    q = newcharacter ( f , curchr ) ;
    else if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
    {
      if ( curlist .dirfield == 3 ) 
      f = eqtb [51755L ].hh .v.RH ;
      else f = eqtb [51754L ].hh .v.RH ;
      cx = curchr ;
    } 
    else if ( curcmd == 74 ) {
	
      if ( checkecharrange ( curchr ) ) 
      q = newcharacter ( f , curchr ) ;
      else {
	  
	if ( curlist .dirfield == 3 ) 
	f = eqtb [51755L ].hh .v.RH ;
	else f = eqtb [51754L ].hh .v.RH ;
	cx = curchr ;
	curcmd = eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH ;
      } 
    } 
    else if ( curcmd == 21 ) 
    {
      scancharnum () ;
      if ( checkecharrange ( curval ) ) 
      q = newcharacter ( f , curval ) ;
      else {
	  
	if ( curlist .dirfield == 3 ) 
	f = eqtb [51755L ].hh .v.RH ;
	else f = eqtb [51754L ].hh .v.RH ;
	cx = curval ;
	curcmd = eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH ;
      } 
    } 
    else if ( curcmd == 75 ) 
    {
      if ( curlist .dirfield == 3 ) 
      f = eqtb [51755L ].hh .v.RH ;
      else f = eqtb [51754L ].hh .v.RH ;
      cx = curchr ;
      curcmd = eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH ;
    } 
    else if ( curcmd == 22 ) 
    {
      scancharnum () ;
      if ( curlist .dirfield == 3 ) 
      f = eqtb [51755L ].hh .v.RH ;
      else f = eqtb [51754L ].hh .v.RH ;
      cx = curval ;
      curcmd = eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH ;
    } 
    else backinput () ;
    if ( curlist .dirfield == 3 ) 
    {
      if ( fontdir [f ]== 3 ) 
      disp = 0 ;
      else if ( fontdir [f ]== 4 ) 
      disp = eqtb [114978L ].cint - eqtb [114979L ].cint ;
      else disp = eqtb [114978L ].cint ;
    } 
    else {
	
      if ( fontdir [f ]== 4 ) 
      disp = 0 ;
      else if ( fontdir [f ]== 3 ) 
      disp = eqtb [114979L ].cint - eqtb [114978L ].cint ;
      else disp = eqtb [114979L ].cint ;
    } 
    {
      if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield 
      ].hh.b0 == 5 ) ) 
      {
	if ( curlist .pdispfield == disp ) 
	{
	  freenode ( curlist .tailfield , 2 ) ;
	  curlist .tailfield = curlist .pnodefield ;
	  mem [curlist .tailfield ].hh .v.RH = -1073741823L ;
	} 
	else mem [curlist .tailfield + 1 ].cint = disp ;
      } 
      else if ( disp != 0 || ! curlist .dispcalledfield ) 
      {
	curlist .pnodefield = curlist .tailfield ;
	{
	  mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	} 
	mem [curlist .tailfield ].hh.b0 = 5 ;
	mem [curlist .tailfield + 1 ].cint = disp ;
	curlist .pdispfield = disp ;
	curlist .dispcalledfield = true ;
      } 
    } 
    if ( cx != 0 ) 
    {
      q = newcharacter ( f , getjfmpos ( cx , f ) ) ;
      mem [q ].hh .v.RH = getavail () ;
      if ( ( eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH == 16 ) && ( cx >= 
      16777216L ) ) 
      mem [mem [q ].hh .v.RH ].hh .v.LH = cx + 23 * 16777216L ;
      else mem [mem [q ].hh .v.RH ].hh .v.LH = cx + eqtb [63663L + 
      kcatcodekey ( cx ) ].hh .v.RH * 16777216L ;
      curlist .lastjchrfield = q ;
    } 
    if ( q != -1073741823L ) 
    {
      t = fontinfo [1 + parambase [f ]].cint / ((double) 65536.0 ) ;
      i = fontinfo [charbase [f ]+ effectivechar ( true , f , mem [q ]
      .hh.b1 ) ].qqqq ;
      w = fontinfo [widthbase [f ]+ i .b0 ].cint ;
      h = fontinfo [heightbase [f ]+ ( i .b1 ) / 256 ].cint ;
      if ( h != x ) 
      {
	deleteglueref ( curkanjiskip ) ;
	deleteglueref ( curxkanjiskip ) ;
	curkanjiskip = membot ;
	curxkanjiskip = membot ;
	incr ( mem [curkanjiskip ].hh .v.RH ) ;
	incr ( mem [curxkanjiskip ].hh .v.RH ) ;
	p = hpack ( p , 0 , 1 ) ;
	mem [p + 4 ].cint = x - h ;
      } 
      delta = round ( ( w - a ) / ((double) 2.0 ) + h * t - x * s ) ;
      r = newkern ( delta ) ;
      mem [r ].hh.b1 = 2 ;
      mem [curlist .tailfield ].hh .v.RH = r ;
      mem [r ].hh .v.RH = p ;
      curlist .tailfield = newkern ( - (integer) a - delta ) ;
      mem [curlist .tailfield ].hh.b1 = 2 ;
      if ( h == x ) 
      {
	if ( fontdir [mem [p ].hh.b0 ]!= 0 ) 
	mem [mem [p ].hh .v.RH ].hh .v.RH = curlist .tailfield ;
	else mem [p ].hh .v.RH = curlist .tailfield ;
      } 
      else mem [p ].hh .v.RH = curlist .tailfield ;
      p = q ;
    } 
    mem [curlist .tailfield ].hh .v.RH = p ;
    if ( mem [p ].hh .v.RH != -1073741823L ) 
    curlist .tailfield = mem [p ].hh .v.RH ;
    else curlist .tailfield = p ;
    if ( disp != 0 ) 
    {
      if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield 
      ].hh.b0 == 5 ) ) 
      {
	mem [curlist .tailfield + 1 ].cint = 0 ;
      } 
      else {
	  
	curlist .pnodefield = curlist .tailfield ;
	{
	  mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	} 
	mem [curlist .tailfield ].hh.b0 = 5 ;
	mem [curlist .tailfield + 1 ].cint = 0 ;
	curlist .pdispfield = disp ;
	curlist .dispcalledfield = true ;
      } 
    } 
    curlist .auxfield .hh .v.LH = 1000 ;
    curlist .inhibitglueflagfield = false ;
  } 
} 
void 
alignerror ( void ) 
{
  alignerror_regmem 
  if ( abs ( alignstate ) > 2 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1313 ) ;
    } 
    printcmdchr ( curcmd , curchr ) ;
    if ( curtok == 262182L ) 
    {
      {
	helpptr = 6 ;
	helpline [5 ]= 1314 ;
	helpline [4 ]= 1315 ;
	helpline [3 ]= 1316 ;
	helpline [2 ]= 1317 ;
	helpline [1 ]= 1318 ;
	helpline [0 ]= 1319 ;
      } 
    } 
    else {
	
      {
	helpptr = 5 ;
	helpline [4 ]= 1314 ;
	helpline [3 ]= 1320 ;
	helpline [2 ]= 1317 ;
	helpline [1 ]= 1318 ;
	helpline [0 ]= 1319 ;
      } 
    } 
    error () ;
  } 
  else {
      
    backinput () ;
    if ( alignstate < 0 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 752 ) ;
      } 
      incr ( alignstate ) ;
      curtok = 65659L ;
    } 
    else {
	
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1309 ) ;
      } 
      decr ( alignstate ) ;
      curtok = 131197L ;
    } 
    {
      helpptr = 3 ;
      helpline [2 ]= 1310 ;
      helpline [1 ]= 1311 ;
      helpline [0 ]= 1312 ;
    } 
    inserror () ;
  } 
} 
void 
noalignerror ( void ) 
{
  noalignerror_regmem 
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 1313 ) ;
  } 
  printesc ( 597 ) ;
  {
    helpptr = 2 ;
    helpline [1 ]= 1321 ;
    helpline [0 ]= 1322 ;
  } 
  error () ;
} 
void 
omiterror ( void ) 
{
  omiterror_regmem 
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 1313 ) ;
  } 
  printesc ( 600 ) ;
  {
    helpptr = 2 ;
    helpline [1 ]= 1323 ;
    helpline [0 ]= 1322 ;
  } 
  error () ;
} 
void 
doendv ( void ) 
{
  doendv_regmem 
  baseptr = inputptr ;
  inputstack [baseptr ]= curinput ;
  while ( ( inputstack [baseptr ].indexfield != 2 ) && ( inputstack [
  baseptr ].locfield == -1073741823L ) && ( inputstack [baseptr ]
  .statefield == 0 ) ) decr ( baseptr ) ;
  if ( ( inputstack [baseptr ].indexfield != 2 ) || ( inputstack [baseptr ]
  .locfield != -1073741823L ) || ( inputstack [baseptr ].statefield != 0 ) ) 
  fatalerror ( 686 ) ;
  if ( curgroup == 6 ) 
  {
    endgraf () ;
    if ( fincol () ) 
    finrow () ;
  } 
  else offsave () ;
} 
void 
cserror ( void ) 
{
  cserror_regmem 
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 935 ) ;
  } 
  printesc ( 569 ) ;
  {
    helpptr = 1 ;
    helpline [0 ]= 1325 ;
  } 
  error () ;
} 
void 
zpushmath ( groupcode c ) 
{
  pushmath_regmem 
  pushnest () ;
  curlist .modefield = -239 ;
  curlist .auxfield .cint = -1073741823L ;
  newsavelevel ( c ) ;
} 
void 
zjustcopy ( halfword p , halfword h , halfword t ) 
{
  /* 40 45 */ justcopy_regmem 
  halfword r  ;
  unsigned char words  ;
  while ( p != -1073741823L ) {
      
    words = 1 ;
    if ( ( p >= himemmin ) ) 
    r = getavail () ;
    else switch ( mem [p ].hh.b0 ) 
    {case 2 : 
    case 0 : 
    case 1 : 
      {
	r = getnode ( 10 ) ;
	mem [r + 8 ].cint = mem [p + 8 ].cint ;
	mem [r + 9 ].cint = mem [p + 9 ].cint ;
	mem [r + 7 ]= mem [p + 7 ];
	mem [r + 6 ]= mem [p + 6 ];
	mem [r + 5 ]= mem [p + 5 ];
	incr ( mem [mem [r + 7 ].hh .v.RH ].hh .v.RH ) ;
	incr ( mem [mem [r + 7 ].hh .v.LH ].hh .v.RH ) ;
	words = 5 ;
	mem [r + 5 ].hh .v.RH = -1073741823L ;
      } 
      break ;
    case 3 : 
      {
	r = getnode ( 6 ) ;
	words = 6 ;
      } 
      break ;
    case 8 : 
      {
	r = getavail () ;
	mem [r ]= mem [p + 1 ];
	goto lab40 ;
      } 
      break ;
    case 13 : 
    case 11 : 
      {
	words = 4 ;
	r = getnode ( words ) ;
      } 
      break ;
    case 12 : 
      {
	r = getnode ( 4 ) ;
	incr ( mem [mem [p + 1 ].hh .v.LH ].hh .v.RH ) ;
	mem [r + 2 ].cint = mem [p + 2 ].cint ;
	mem [r + 3 ].cint = mem [p + 3 ].cint ;
	mem [r + 1 ].hh .v.LH = mem [p + 1 ].hh .v.LH ;
	mem [r + 1 ].hh .v.RH = -1073741823L ;
      } 
      break ;
    case 10 : 
      switch ( mem [p ].hh.b1 ) 
      {case 0 : 
	{
	  r = getnode ( 3 ) ;
	  words = 3 ;
	} 
	break ;
      case 1 : 
      case 3 : 
      case 4 : 
	{
	  r = getnode ( 2 ) ;
	  incr ( mem [mem [p + 1 ].hh .v.RH ].hh .v.LH ) ;
	  words = 2 ;
	} 
	break ;
      case 2 : 
      case 5 : 
	{
	  r = getnode ( 2 ) ;
	  words = 2 ;
	} 
	break ;
      case 8 : 
	r = getnode ( 2 ) ;
	break ;
	default: 
	confusion ( 1516 ) ;
	break ;
      } 
      break ;
      default: 
      goto lab45 ;
      break ;
    } 
    while ( words > 0 ) {
	
      decr ( words ) ;
      mem [r + words ]= mem [p + words ];
    } 
    lab40: mem [h ].hh .v.RH = r ;
    h = r ;
    lab45: p = mem [p ].hh .v.RH ;
  } 
  mem [h ].hh .v.RH = t ;
} 
void 
zjustreverse ( halfword p ) 
{
  /* 30 */ justreverse_regmem 
  halfword l  ;
  halfword t  ;
  halfword q  ;
  halfword m, n  ;
  m = -1073741823L ;
  n = -1073741823L ;
  if ( mem [memtop - 3 ].hh .v.RH == -1073741823L ) 
  {
    justcopy ( mem [p ].hh .v.RH , memtop - 3 , -1073741823L ) ;
    q = mem [memtop - 3 ].hh .v.RH ;
  } 
  else {
      
    q = mem [p ].hh .v.RH ;
    mem [p ].hh .v.RH = -1073741823L ;
    flushnodelist ( mem [memtop - 3 ].hh .v.RH ) ;
  } 
  t = newedge ( curdir , 0 ) ;
  l = t ;
  curdir = 1 - curdir ;
  while ( q != -1073741823L ) if ( ( q >= himemmin ) ) 
  do {
      p = q ;
    q = mem [p ].hh .v.RH ;
    mem [p ].hh .v.RH = l ;
    l = p ;
  } while ( ! ( ! ( q >= himemmin ) ) ) ;
  else {
      
    p = q ;
    q = mem [p ].hh .v.RH ;
    if ( mem [p ].hh.b0 == 11 ) {
	
      if ( odd ( mem [p ].hh.b1 ) ) {
	  
	if ( mem [LRptr ].hh .v.LH != ( 4 * ( mem [p ].hh.b1 / 4 ) + 3 ) ) 
	{
	  mem [p ].hh.b0 = 13 ;
	  incr ( LRproblems ) ;
	} 
	else {
	    
	  {
	    tempptr = LRptr ;
	    LRptr = mem [tempptr ].hh .v.RH ;
	    {
	      mem [tempptr ].hh .v.RH = avail ;
	      avail = tempptr ;
	;
#ifdef STAT
	      decr ( dynused ) ;
#endif /* STAT */
	    } 
	  } 
	  if ( n > -1073741823L ) 
	  {
	    decr ( n ) ;
	    decr ( mem [p ].hh.b1 ) ;
	  } 
	  else {
	      
	    if ( m > -1073741823L ) 
	    decr ( m ) ;
	    else {
		
	      mem [t + 1 ].cint = mem [p + 1 ].cint ;
	      mem [t ].hh .v.RH = q ;
	      freenode ( p , 4 ) ;
	      goto lab30 ;
	    } 
	    mem [p ].hh.b0 = 13 ;
	  } 
	} 
      } 
      else {
	  
	{
	  tempptr = getavail () ;
	  mem [tempptr ].hh .v.LH = ( 4 * ( mem [p ].hh.b1 / 4 ) + 3 ) ;
	  mem [tempptr ].hh .v.RH = LRptr ;
	  LRptr = tempptr ;
	} 
	if ( ( n > -1073741823L ) || ( ( mem [p ].hh.b1 / 8 ) != curdir ) ) 
	{
	  incr ( n ) ;
	  incr ( mem [p ].hh.b1 ) ;
	} 
	else {
	    
	  mem [p ].hh.b0 = 13 ;
	  incr ( m ) ;
	} 
      } 
    } 
    mem [p ].hh .v.RH = l ;
    l = p ;
  } 
  goto lab30 ;
  mem [t + 1 ].cint = mem [p + 1 ].cint ;
  mem [t ].hh .v.RH = q ;
  freenode ( p , 2 ) ;
  lab30: mem [memtop - 3 ].hh .v.RH = l ;
} 
void 
initmath ( void ) 
{
  /* 21 40 45 30 */ initmath_regmem 
  scaled w  ;
  halfword j  ;
  integer x  ;
  scaled l  ;
  scaled s  ;
  halfword p  ;
  halfword q  ;
  internalfontnumber f  ;
  integer n  ;
  scaled v  ;
  scaled d  ;
  gettoken () ;
  if ( ( curcmd == 3 ) && ( curlist .modefield > 0 ) ) 
  {
    j = -1073741823L ;
    w = -1073741823L ;
    if ( curlist .headfield == curlist .tailfield ) 
    {
      popnest () ;
      if ( curlist .eTeXauxfield == -1073741823L ) 
      x = 0 ;
      else if ( mem [curlist .eTeXauxfield ].hh .v.LH >= 8 ) 
      x = -1 ;
      else x = 1 ;
    } 
    else if ( ( mem [curlist .headfield ].hh .v.RH == curlist .tailfield ) 
    && ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
    .hh.b0 == 5 ) ) ) 
    {
      freenode ( curlist .tailfield , 2 ) ;
      curlist .tailfield = curlist .headfield ;
      mem [curlist .headfield ].hh .v.RH = -1073741823L ;
      {
	popnest () ;
	if ( curlist .eTeXauxfield == -1073741823L ) 
	x = 0 ;
	else if ( mem [curlist .eTeXauxfield ].hh .v.LH >= 8 ) 
	x = -1 ;
	else x = 1 ;
      } 
    } 
    else {
	
      adjusthlist ( curlist .headfield , true ) ;
      linebreak ( true ) ;
      if ( ( eTeXmode == 1 ) ) 
      {
	if ( eqtb [49933L ].hh .v.RH == membot ) 
	j = newkern ( 0 ) ;
	else j = newparamglue ( 8 ) ;
	if ( eqtb [49932L ].hh .v.RH == membot ) 
	p = newkern ( 0 ) ;
	else p = newparamglue ( 7 ) ;
	mem [p ].hh .v.RH = j ;
	j = newnullbox () ;
	mem [j + 1 ].cint = mem [justbox + 1 ].cint ;
	mem [j + 4 ].cint = mem [justbox + 4 ].cint ;
	mem [j + 5 ].hh .v.RH = p ;
	mem [j + 5 ].hh.b1 = mem [justbox + 5 ].hh.b1 ;
	mem [j + 5 ].hh.b0 = mem [justbox + 5 ].hh.b0 ;
	mem [j + 6 ].gr = mem [justbox + 6 ].gr ;
      } 
      v = mem [justbox + 4 ].cint ;
      if ( curlist .eTeXauxfield == -1073741823L ) 
      x = 0 ;
      else if ( mem [curlist .eTeXauxfield ].hh .v.LH >= 8 ) 
      x = -1 ;
      else x = 1 ;
      if ( x >= 0 ) 
      {
	p = mem [justbox + 5 ].hh .v.RH ;
	mem [memtop - 3 ].hh .v.RH = -1073741823L ;
      } 
      else {
	  
	v = - (integer) v - mem [justbox + 1 ].cint ;
	p = newmath ( 0 , 6 ) ;
	mem [memtop - 3 ].hh .v.RH = p ;
	justcopy ( mem [justbox + 5 ].hh .v.RH , p , newmath ( 0 , 7 ) ) ;
	curdir = 1 ;
      } 
      v = v + 2 * fontinfo [6 + parambase [eqtb [50985L ].hh .v.RH ]]
      .cint ;
      if ( ( eqtb [114444L ].cint > 0 ) ) 
      {
	tempptr = getavail () ;
	mem [tempptr ].hh .v.LH = 0 ;
	mem [tempptr ].hh .v.RH = LRptr ;
	LRptr = tempptr ;
      } 
      while ( p != -1073741823L ) {
	  
	lab21: if ( ( p >= himemmin ) ) 
	{
	  f = mem [p ].hh.b0 ;
	  d = fontinfo [widthbase [f ]+ fontinfo [charbase [f ]+ mem [p 
	  ].hh.b1 ].qqqq .b0 ].cint ;
	  if ( fontdir [f ]!= 0 ) 
	  p = mem [p ].hh .v.RH ;
	  goto lab40 ;
	} 
	switch ( mem [p ].hh.b0 ) 
	{case 0 : 
	case 1 : 
	case 2 : 
	case 3 : 
	  {
	    d = mem [p + 1 ].cint ;
	    goto lab40 ;
	  } 
	  break ;
	case 8 : 
	  {
	    mem [memtop - 12 ]= mem [p + 1 ];
	    mem [memtop - 12 ].hh .v.RH = mem [p ].hh .v.RH ;
	    p = memtop - 12 ;
	    goto lab21 ;
	  } 
	  break ;
	case 13 : 
	  d = mem [p + 1 ].cint ;
	  break ;
	case 11 : 
	  {
	    d = mem [p + 1 ].cint ;
	    if ( ( eqtb [114444L ].cint > 0 ) ) {
		
	      if ( odd ( mem [p ].hh.b1 ) ) 
	      {
		if ( mem [LRptr ].hh .v.LH == ( 4 * ( mem [p ].hh.b1 / 4 ) 
		+ 3 ) ) 
		{
		  tempptr = LRptr ;
		  LRptr = mem [tempptr ].hh .v.RH ;
		  {
		    mem [tempptr ].hh .v.RH = avail ;
		    avail = tempptr ;
	;
#ifdef STAT
		    decr ( dynused ) ;
#endif /* STAT */
		  } 
		} 
		else if ( mem [p ].hh.b1 > 4 ) 
		{
		  w = 1073741823L ;
		  goto lab30 ;
		} 
	      } 
	      else {
		  
		{
		  tempptr = getavail () ;
		  mem [tempptr ].hh .v.LH = ( 4 * ( mem [p ].hh.b1 / 4 ) + 
		  3 ) ;
		  mem [tempptr ].hh .v.RH = LRptr ;
		  LRptr = tempptr ;
		} 
		if ( ( mem [p ].hh.b1 / 8 ) != curdir ) 
		{
		  justreverse ( p ) ;
		  p = memtop - 3 ;
		} 
	      } 
	    } 
	    else if ( mem [p ].hh.b1 >= 4 ) 
	    {
	      w = 1073741823L ;
	      goto lab30 ;
	    } 
	  } 
	  break ;
	case 16 : 
	  {
	    d = mem [p + 1 ].cint ;
	    curdir = mem [p ].hh.b1 ;
	  } 
	  break ;
	case 12 : 
	  {
	    q = mem [p + 1 ].hh .v.LH ;
	    d = mem [q + 1 ].cint ;
	    if ( mem [justbox + 5 ].hh.b0 == 1 ) 
	    {
	      if ( ( mem [justbox + 5 ].hh.b1 == mem [q ].hh.b0 ) && ( mem 
	      [q + 2 ].cint != 0 ) ) 
	      v = 1073741823L ;
	    } 
	    else if ( mem [justbox + 5 ].hh.b0 == 2 ) 
	    {
	      if ( ( mem [justbox + 5 ].hh.b1 == mem [q ].hh.b1 ) && ( mem 
	      [q + 3 ].cint != 0 ) ) 
	      v = 1073741823L ;
	    } 
	    if ( mem [p ].hh.b1 >= 100 ) 
	    goto lab40 ;
	  } 
	  break ;
	case 10 : 
	  d = 0 ;
	  break ;
	  default: 
	  d = 0 ;
	  break ;
	} 
	if ( v < 1073741823L ) 
	v = v + d ;
	goto lab45 ;
	lab40: if ( v < 1073741823L ) 
	{
	  v = v + d ;
	  w = v ;
	} 
	else {
	    
	  w = 1073741823L ;
	  goto lab30 ;
	} 
	lab45: p = mem [p ].hh .v.RH ;
      } 
      lab30: if ( ( eqtb [114444L ].cint > 0 ) ) 
      {
	while ( LRptr != -1073741823L ) {
	    
	  tempptr = LRptr ;
	  LRptr = mem [tempptr ].hh .v.RH ;
	  {
	    mem [tempptr ].hh .v.RH = avail ;
	    avail = tempptr ;
	;
#ifdef STAT
	    decr ( dynused ) ;
#endif /* STAT */
	  } 
	} 
	if ( LRproblems != 0 ) 
	{
	  w = 1073741823L ;
	  LRproblems = 0 ;
	} 
      } 
      curdir = 0 ;
      flushnodelist ( mem [memtop - 3 ].hh .v.RH ) ;
    } 
    if ( eqtb [50458L ].hh .v.RH == -1073741823L ) {
	
      if ( ( eqtb [114974L ].cint != 0 ) && ( ( ( eqtb [114402L ].cint >= 
      0 ) && ( curlist .pgfield + 2 > eqtb [114402L ].cint ) ) || ( curlist 
      .pgfield + 1 < - (integer) eqtb [114402L ].cint ) ) ) 
      {
	l = eqtb [114960L ].cint - abs ( eqtb [114974L ].cint ) ;
	if ( eqtb [114974L ].cint > 0 ) 
	s = eqtb [114974L ].cint ;
	else s = 0 ;
      } 
      else {
	  
	l = eqtb [114960L ].cint ;
	s = 0 ;
      } 
    } 
    else {
	
      n = mem [eqtb [50458L ].hh .v.RH ].hh .v.LH ;
      if ( curlist .pgfield + 2 >= n ) 
      p = eqtb [50458L ].hh .v.RH + 2 * n ;
      else p = eqtb [50458L ].hh .v.RH + 2 * ( curlist .pgfield + 2 ) ;
      s = mem [p - 1 ].cint ;
      l = mem [p ].cint ;
    } 
    pushmath ( 15 ) ;
    curlist .modefield = 239 ;
    eqworddefine ( 114405L , -1 ) ;
    eqworddefine ( 114970L , w ) ;
    curlist .eTeXauxfield = j ;
    if ( ( eTeXmode == 1 ) ) 
    eqworddefine ( 114435L , x ) ;
    eqworddefine ( 114971L , l ) ;
    eqworddefine ( 114972L , s ) ;
    if ( eqtb [50462L ].hh .v.RH != -1073741823L ) 
    begintokenlist ( eqtb [50462L ].hh .v.RH , 9 ) ;
    if ( nestptr == 1 ) 
    buildpage () ;
  } 
  else {
      
    backinput () ;
    {
      pushmath ( 15 ) ;
      eqworddefine ( 114405L , -1 ) ;
      if ( ( insertsrcspecialeverymath ) ) 
      insertsrcspecial () ;
      if ( eqtb [50461L ].hh .v.RH != -1073741823L ) 
      begintokenlist ( eqtb [50461L ].hh .v.RH , 8 ) ;
    } 
  } 
  curlist .dirfield = - (integer) abs ( curlist .dirfield ) ;
} 
void 
starteqno ( void ) 
{
  starteqno_regmem 
  savestack [saveptr + 0 ].cint = curchr ;
  incr ( saveptr ) ;
  {
    pushmath ( 15 ) ;
    eqworddefine ( 114405L , -1 ) ;
    if ( ( insertsrcspecialeverymath ) ) 
    insertsrcspecial () ;
    if ( eqtb [50461L ].hh .v.RH != -1073741823L ) 
    begintokenlist ( eqtb [50461L ].hh .v.RH , 8 ) ;
  } 
} 
void 
zscanmath ( halfword p , halfword q ) 
{
  /* 20 21 10 */ scanmath_regmem 
  integer c  ;
  KANJIcode cx  ;
  cx = 0 ;
  lab20: do {
      getxtoken () ;
  } while ( ! ( ( curcmd != 10 ) && ( curcmd != 0 ) ) ) ;
  lab21: switch ( curcmd ) 
  {case 11 : 
  case 12 : 
  case 74 : 
    if ( checkecharrange ( curchr ) ) 
    {
      c = eqtb [113849L + curchr ].hh .v.RH ;
      if ( c == 524288L ) 
      {
	{
	  curcs = curchr + 1 ;
	  curcmd = eqtb [curcs ].hh.b0 ;
	  curchr = eqtb [curcs ].hh .v.RH ;
	  xtoken () ;
	  backinput () ;
	} 
	goto lab20 ;
      } 
    } 
    else cx = curchr ;
    break ;
  case 16 : 
  case 17 : 
  case 18 : 
  case 19 : 
  case 20 : 
    cx = curchr ;
    break ;
  case 75 : 
    cx = curchr ;
    break ;
  case 21 : 
    {
      scancharnum () ;
      curchr = curval ;
      curcmd = 74 ;
      goto lab21 ;
    } 
    break ;
  case 22 : 
    {
      scancharnum () ;
      curchr = curval ;
      curcmd = 75 ;
      goto lab21 ;
    } 
    break ;
  case 23 : 
    {
      if ( curchr == 0 ) 
      scanfifteenbitint () ;
      else scanbigfifteenbitint () ;
      c = curval ;
    } 
    break ;
  case 76 : 
    c = ( ( curchr / 4096 ) * 65536L ) + ( curchr % 4096 ) ;
    break ;
  case 77 : 
    c = ( ( curchr / 65536L ) * 256 ) + ( curchr % 256 ) ;
    break ;
  case 15 : 
    {
      if ( curchr == 0 ) 
      scantwentysevenbitint () ;
      else scanfiftyonebitint () ;
      c = curval ;
    } 
    break ;
    default: 
    {
      backinput () ;
      scanleftbrace () ;
      savestack [saveptr + 0 ].cint = p ;
      incr ( saveptr ) ;
      pushmath ( 9 ) ;
      return ;
    } 
    break ;
  } 
  if ( cx == 0 ) 
  {
    mem [p ].hh .v.RH = 1 ;
    mem [p ].hh.b1 = c % 256 ;
    if ( ( c >= 458752L ) && ( ( ( eqtb [114405L ].cint >= 0 ) && ( eqtb [
    114405L ].cint < 256 ) ) ) ) 
    mem [p ].hh.b0 = eqtb [114405L ].cint ;
    else mem [p ].hh.b0 = ( c / 256 ) % 256 ;
    if ( fontdir [eqtb [50986L + mem [p ].hh.b0 + cursize ].hh .v.RH ]!= 
    0 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1328 ) ;
      } 
      {
	helpptr = 1 ;
	helpline [0 ]= 1329 ;
      } 
      error () ;
    } 
  } 
  else {
      
    if ( q == -1073741823L ) 
    {
      mem [p ].hh .v.RH = 4 ;
      mem [p ].hh .v.LH = newnoad () ;
      p = mem [p ].hh .v.LH + 1 ;
      q = p + 3 ;
    } 
    mem [p ].hh .v.RH = 6 ;
    mem [p ].hh.b0 = eqtb [114406L ].cint ;
    mem [p ].hh.b1 = 0 ;
    if ( ( eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH == 16 ) && ( cx >= 
    16777216L ) ) 
    mem [p + 3 ].hh .v.LH = cx + 23 * 16777216L ;
    else mem [p + 3 ].hh .v.LH = cx + eqtb [63663L + kcatcodekey ( cx ) ]
    .hh .v.RH * 16777216L ;
    if ( fontdir [eqtb [50986L + mem [p ].hh.b0 + cursize ].hh .v.RH ]== 
    0 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1330 ) ;
      } 
      {
	helpptr = 1 ;
	helpline [0 ]= 1329 ;
      } 
      error () ;
    } 
  } 
} 
void 
zsetmathchar ( integer c ) 
{
  setmathchar_regmem 
  halfword p  ;
  if ( c >= 524288L ) 
  {
    curcs = curchr + 1 ;
    curcmd = eqtb [curcs ].hh.b0 ;
    curchr = eqtb [curcs ].hh .v.RH ;
    xtoken () ;
    backinput () ;
  } 
  else {
      
    p = newnoad () ;
    mem [p + 1 ].hh .v.RH = 1 ;
    mem [p + 1 ].hh.b1 = c % 256 ;
    mem [p + 1 ].hh.b0 = ( c / 256 ) % 256 ;
    if ( c >= 458752L ) 
    {
      if ( ( ( eqtb [114405L ].cint >= 0 ) && ( eqtb [114405L ].cint < 256 
      ) ) ) 
      mem [p + 1 ].hh.b0 = eqtb [114405L ].cint ;
      mem [p ].hh.b0 = 18 ;
    } 
    else mem [p ].hh.b0 = 18 + ( c / 65536L ) ;
    mem [curlist .tailfield ].hh .v.RH = p ;
    curlist .tailfield = p ;
    if ( fontdir [eqtb [50986L + mem [p + 1 ].hh.b0 + cursize ].hh .v.RH 
    ]!= 0 ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1328 ) ;
      } 
      {
	helpptr = 1 ;
	helpline [0 ]= 1329 ;
      } 
      error () ;
    } 
  } 
} 
void 
mathlimitswitch ( void ) 
{
  /* 10 */ mathlimitswitch_regmem 
  if ( curlist .headfield != curlist .tailfield ) {
      
    if ( mem [curlist .tailfield ].hh.b0 == 19 ) 
    {
      mem [curlist .tailfield ].hh.b1 = curchr ;
      return ;
    } 
  } 
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 1332 ) ;
  } 
  {
    helpptr = 1 ;
    helpline [0 ]= 1333 ;
  } 
  error () ;
} 
void 
zscandelimiter ( halfword p , boolean r ) 
{
  scandelimiter_regmem 
  if ( r == 1 ) 
  scantwentysevenbitint () ;
  else if ( r == 2 ) 
  scanfiftyonebitint () ;
  else {
      
    do {
	getxtoken () ;
    } while ( ! ( ( curcmd != 10 ) && ( curcmd != 0 ) ) ) ;
    switch ( curcmd ) 
    {case 11 : 
    case 12 : 
      {
	curval = eqtb [114701L + curchr ].cint ;
	curval1 = getintone ( eqtb [114701L + curchr ]) ;
      } 
      break ;
    case 15 : 
      if ( curchr == 0 ) 
      scantwentysevenbitint () ;
      else scanfiftyonebitint () ;
      break ;
      default: 
      {
	curval = -1 ;
	curval1 = -1 ;
      } 
      break ;
    } 
  } 
  if ( curval < 0 ) 
  {
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1334 ) ;
      } 
      {
	helpptr = 6 ;
	helpline [5 ]= 1335 ;
	helpline [4 ]= 1336 ;
	helpline [3 ]= 1337 ;
	helpline [2 ]= 1338 ;
	helpline [1 ]= 1339 ;
	helpline [0 ]= 1340 ;
      } 
      backerror () ;
      curval = 0 ;
    } 
    curval1 = 0 ;
  } 
  mem [p ].qqqq .b0 = ( curval / 256 ) % 256 ;
  mem [p ].qqqq .b1 = curval % 256 ;
  mem [p ].qqqq .b2 = ( curval1 / 256 ) % 256 ;
  mem [p ].qqqq .b3 = curval1 % 256 ;
} 
void 
mathradical ( void ) 
{
  mathradical_regmem 
  {
    mem [curlist .tailfield ].hh .v.RH = getnode ( 6 ) ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  mem [curlist .tailfield ].hh.b0 = 26 ;
  mem [curlist .tailfield ].hh.b1 = 0 ;
  mem [curlist .tailfield + 1 ].hh = emptyfield ;
  mem [curlist .tailfield + 3 ].hh = emptyfield ;
  mem [curlist .tailfield + 2 ].hh = emptyfield ;
  scandelimiter ( curlist .tailfield + 5 , curchr + 1 ) ;
  scanmath ( curlist .tailfield + 1 , curlist .tailfield + 4 ) ;
} 
void 
mathac ( void ) 
{
  mathac_regmem 
  if ( curcmd == 51 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1341 ) ;
    } 
    printesc ( 591 ) ;
    print ( 1342 ) ;
    {
      helpptr = 2 ;
      helpline [1 ]= 1343 ;
      helpline [0 ]= 1344 ;
    } 
    error () ;
  } 
  {
    mem [curlist .tailfield ].hh .v.RH = getnode ( 6 ) ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  mem [curlist .tailfield ].hh.b0 = 30 ;
  mem [curlist .tailfield ].hh.b1 = 0 ;
  mem [curlist .tailfield + 1 ].hh = emptyfield ;
  mem [curlist .tailfield + 3 ].hh = emptyfield ;
  mem [curlist .tailfield + 2 ].hh = emptyfield ;
  mem [curlist .tailfield + 5 ].hh .v.RH = 1 ;
  if ( curchr == 0 ) 
  scanfifteenbitint () ;
  else scanbigfifteenbitint () ;
  mem [curlist .tailfield + 5 ].hh.b1 = curval % 256 ;
  if ( ( curval >= 458752L ) && ( ( eqtb [114405L ].cint >= 0 ) && ( eqtb [
  114405L ].cint < 256 ) ) ) 
  mem [curlist .tailfield + 5 ].hh.b0 = eqtb [114405L ].cint ;
  else mem [curlist .tailfield + 5 ].hh.b0 = ( curval / 256 ) % 256 ;
  scanmath ( curlist .tailfield + 1 , curlist .tailfield + 4 ) ;
} 
void 
appendchoices ( void ) 
{
  appendchoices_regmem 
  {
    mem [curlist .tailfield ].hh .v.RH = newchoice () ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  incr ( saveptr ) ;
  savestack [saveptr - 1 ].cint = 0 ;
  pushmath ( 13 ) ;
  scanleftbrace () ;
} 
halfword 
zfinmlist ( halfword p ) 
{
  register halfword Result; finmlist_regmem 
  halfword q  ;
  if ( curlist .auxfield .cint != -1073741823L ) 
  {
    mem [curlist .auxfield .cint + 3 ].hh .v.RH = 4 ;
    mem [curlist .auxfield .cint + 3 ].hh .v.LH = mem [curlist .headfield ]
    .hh .v.RH ;
    if ( p == -1073741823L ) 
    q = curlist .auxfield .cint ;
    else {
	
      q = mem [curlist .auxfield .cint + 2 ].hh .v.LH ;
      if ( ( mem [q ].hh.b0 != 32 ) || ( curlist .eTeXauxfield == 
      -1073741823L ) ) 
      confusion ( 1044 ) ;
      mem [curlist .auxfield .cint + 2 ].hh .v.LH = mem [curlist 
      .eTeXauxfield ].hh .v.RH ;
      mem [curlist .eTeXauxfield ].hh .v.RH = curlist .auxfield .cint ;
      mem [curlist .auxfield .cint ].hh .v.RH = p ;
    } 
  } 
  else {
      
    mem [curlist .tailfield ].hh .v.RH = p ;
    q = mem [curlist .headfield ].hh .v.RH ;
  } 
  popnest () ;
  Result = q ;
  return Result ;
} 
void 
buildchoices ( void ) 
{
  /* 10 */ buildchoices_regmem 
  halfword p  ;
  unsave () ;
  p = finmlist ( -1073741823L ) ;
  switch ( savestack [saveptr - 1 ].cint ) 
  {case 0 : 
    mem [curlist .tailfield + 1 ].hh .v.LH = p ;
    break ;
  case 1 : 
    mem [curlist .tailfield + 1 ].hh .v.RH = p ;
    break ;
  case 2 : 
    mem [curlist .tailfield + 2 ].hh .v.LH = p ;
    break ;
  case 3 : 
    {
      mem [curlist .tailfield + 2 ].hh .v.RH = p ;
      decr ( saveptr ) ;
      return ;
    } 
    break ;
  } 
  incr ( savestack [saveptr - 1 ].cint ) ;
  pushmath ( 13 ) ;
  scanleftbrace () ;
} 
void 
subsup ( void ) 
{
  subsup_regmem 
  smallnumber t  ;
  halfword p  ;
  t = 0 ;
  p = -1073741823L ;
  if ( curlist .tailfield != curlist .headfield ) {
      
    if ( ( mem [curlist .tailfield ].hh.b0 >= 18 ) && ( mem [curlist 
    .tailfield ].hh.b0 < 32 ) ) 
    {
      p = curlist .tailfield + 2 + curcmd - 7 ;
      t = mem [p ].hh .v.RH ;
    } 
  } 
  if ( ( p == -1073741823L ) || ( t != 0 ) ) 
  {
    {
      mem [curlist .tailfield ].hh .v.RH = newnoad () ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    p = curlist .tailfield + 2 + curcmd - 7 ;
    if ( t != 0 ) 
    {
      if ( curcmd == 7 ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1345 ) ;
	} 
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1346 ;
	} 
      } 
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1347 ) ;
	} 
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1348 ;
	} 
      } 
      error () ;
    } 
  } 
  scanmath ( p , -1073741823L ) ;
} 
void 
mathfraction ( void ) 
{
  mathfraction_regmem 
  smallnumber c  ;
  c = curchr ;
  if ( curlist .auxfield .cint != -1073741823L ) 
  {
    if ( c >= 3 ) 
    {
      scandelimiter ( memtop - 12 , false ) ;
      scandelimiter ( memtop - 12 , false ) ;
    } 
    if ( c % 3 == 0 ) 
    scandimen ( false , false , false ) ;
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1355 ) ;
    } 
    {
      helpptr = 3 ;
      helpline [2 ]= 1356 ;
      helpline [1 ]= 1357 ;
      helpline [0 ]= 1358 ;
    } 
    error () ;
  } 
  else {
      
    curlist .auxfield .cint = getnode ( 6 ) ;
    mem [curlist .auxfield .cint ].hh.b0 = 27 ;
    mem [curlist .auxfield .cint ].hh.b1 = 0 ;
    mem [curlist .auxfield .cint + 2 ].hh .v.RH = 4 ;
    mem [curlist .auxfield .cint + 2 ].hh .v.LH = mem [curlist .headfield ]
    .hh .v.RH ;
    mem [curlist .auxfield .cint + 3 ].hh = emptyfield ;
    mem [curlist .auxfield .cint + 5 ].qqqq = nulldelimiter ;
    mem [curlist .auxfield .cint + 4 ].qqqq = nulldelimiter ;
    mem [curlist .headfield ].hh .v.RH = -1073741823L ;
    curlist .tailfield = curlist .headfield ;
    if ( c >= 3 ) 
    {
      scandelimiter ( curlist .auxfield .cint + 5 , false ) ;
      scandelimiter ( curlist .auxfield .cint + 4 , false ) ;
    } 
    switch ( c % 3 ) 
    {case 0 : 
      {
	scandimen ( false , false , false ) ;
	mem [curlist .auxfield .cint + 1 ].cint = curval ;
      } 
      break ;
    case 1 : 
      mem [curlist .auxfield .cint + 1 ].cint = 1073741824L ;
      break ;
    case 2 : 
      mem [curlist .auxfield .cint + 1 ].cint = 0 ;
      break ;
    } 
  } 
} 
void 
mathleftright ( void ) 
{
  mathleftright_regmem 
  smallnumber t  ;
  halfword p  ;
  halfword q  ;
  t = curchr ;
  if ( ( t != 32 ) && ( curgroup != 16 ) ) 
  {
    if ( curgroup == 15 ) 
    {
      scandelimiter ( memtop - 12 , false ) ;
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 935 ) ;
      } 
      if ( t == 1 ) 
      {
	printesc ( 1045 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1359 ;
	} 
      } 
      else {
	  
	printesc ( 1044 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1360 ;
	} 
      } 
      error () ;
    } 
    else offsave () ;
  } 
  else {
      
    p = newnoad () ;
    mem [p ].hh.b0 = t ;
    scandelimiter ( p + 1 , false ) ;
    if ( t == 1 ) 
    {
      mem [p ].hh.b0 = 33 ;
      mem [p ].hh.b1 = 1 ;
    } 
    if ( t == 32 ) 
    q = p ;
    else {
	
      q = finmlist ( p ) ;
      unsave () ;
    } 
    if ( t != 33 ) 
    {
      pushmath ( 16 ) ;
      mem [curlist .headfield ].hh .v.RH = q ;
      curlist .tailfield = p ;
      curlist .eTeXauxfield = p ;
    } 
    else {
	
      {
	mem [curlist .tailfield ].hh .v.RH = newnoad () ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      mem [curlist .tailfield ].hh.b0 = 25 ;
      mem [curlist .tailfield + 1 ].hh .v.RH = 4 ;
      mem [curlist .tailfield + 1 ].hh .v.LH = q ;
    } 
  } 
} 
void 
zappdisplay ( halfword j , halfword b , scaled d ) 
{
  appdisplay_regmem 
  scaled z  ;
  scaled s  ;
  scaled e  ;
  integer x  ;
  halfword p, q, r, t, u  ;
  s = eqtb [114972L ].cint ;
  x = eqtb [114435L ].cint ;
  if ( x == 0 ) 
  mem [b + 4 ].cint = s + d ;
  else {
      
    z = eqtb [114971L ].cint ;
    p = b ;
    if ( x > 0 ) 
    e = z - d - mem [p + 1 ].cint ;
    else {
	
      e = d ;
      d = z - e - mem [p + 1 ].cint ;
    } 
    if ( j != -1073741823L ) 
    {
      b = copynodelist ( j ) ;
      mem [b + 3 ].cint = mem [p + 3 ].cint ;
      mem [b + 2 ].cint = mem [p + 2 ].cint ;
      s = s - mem [b + 4 ].cint ;
      d = d + s ;
      e = e + mem [b + 1 ].cint - z - s ;
    } 
    if ( ( ( mem [p ].hh.b1 ) / 16 ) == 2 ) 
    q = p ;
    else {
	
      r = mem [p + 5 ].hh .v.RH ;
      freenode ( p , 10 ) ;
      if ( r == -1073741823L ) 
      confusion ( 1614 ) ;
      if ( x > 0 ) 
      {
	p = r ;
	do {
	    q = r ;
	  r = mem [r ].hh .v.RH ;
	} while ( ! ( r == -1073741823L ) ) ;
      } 
      else {
	  
	p = -1073741823L ;
	q = r ;
	do {
	    t = mem [r ].hh .v.RH ;
	  mem [r ].hh .v.RH = p ;
	  p = r ;
	  r = t ;
	} while ( ! ( r == -1073741823L ) ) ;
      } 
    } 
    if ( j == -1073741823L ) 
    {
      r = newkern ( 0 ) ;
      t = newkern ( 0 ) ;
    } 
    else {
	
      r = mem [b + 5 ].hh .v.RH ;
      t = mem [r ].hh .v.RH ;
    } 
    u = newmath ( 0 , 3 ) ;
    if ( mem [t ].hh.b0 == 12 ) 
    {
      j = newskipparam ( 8 ) ;
      mem [q ].hh .v.RH = j ;
      mem [j ].hh .v.RH = u ;
      j = mem [t + 1 ].hh .v.LH ;
      mem [tempptr ].hh.b0 = mem [j ].hh.b0 ;
      mem [tempptr ].hh.b1 = mem [j ].hh.b1 ;
      mem [tempptr + 1 ].cint = e - mem [j + 1 ].cint ;
      mem [tempptr + 2 ].cint = - (integer) mem [j + 2 ].cint ;
      mem [tempptr + 3 ].cint = - (integer) mem [j + 3 ].cint ;
      mem [u ].hh .v.RH = t ;
    } 
    else {
	
      mem [t + 1 ].cint = e ;
      mem [t ].hh .v.RH = u ;
      mem [q ].hh .v.RH = t ;
    } 
    u = newmath ( 0 , 2 ) ;
    if ( mem [r ].hh.b0 == 12 ) 
    {
      j = newskipparam ( 7 ) ;
      mem [u ].hh .v.RH = j ;
      mem [j ].hh .v.RH = p ;
      j = mem [r + 1 ].hh .v.LH ;
      mem [tempptr ].hh.b0 = mem [j ].hh.b0 ;
      mem [tempptr ].hh.b1 = mem [j ].hh.b1 ;
      mem [tempptr + 1 ].cint = d - mem [j + 1 ].cint ;
      mem [tempptr + 2 ].cint = - (integer) mem [j + 2 ].cint ;
      mem [tempptr + 3 ].cint = - (integer) mem [j + 3 ].cint ;
      mem [r ].hh .v.RH = u ;
    } 
    else {
	
      mem [r + 1 ].cint = d ;
      mem [r ].hh .v.RH = p ;
      mem [u ].hh .v.RH = r ;
      if ( j == -1073741823L ) 
      {
	b = hpack ( u , 0 , 1 ) ;
	mem [b + 4 ].cint = s ;
      } 
      else mem [b + 5 ].hh .v.RH = u ;
    } 
  } 
  appendtovlist ( b ) ;
} 
void 
aftermath ( void ) 
{
  aftermath_regmem 
  boolean l  ;
  scaled disp  ;
  boolean danger  ;
  integer m  ;
  halfword p  ;
  halfword a  ;
  halfword b  ;
  scaled w  ;
  scaled z  ;
  scaled e  ;
  scaled q  ;
  scaled d  ;
  scaled s  ;
  smallnumber g1, g2  ;
  halfword r  ;
  halfword t  ;
  halfword pret  ;
  halfword j  ;
  danger = false ;
  if ( curlist .modefield == 239 ) 
  j = curlist .eTeXauxfield ;
  if ( ( fontparams [eqtb [50988L ].hh .v.RH ]< 22 ) || ( fontparams [
  eqtb [51244L ].hh .v.RH ]< 22 ) || ( fontparams [eqtb [51500L ].hh 
  .v.RH ]< 22 ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1361 ) ;
    } 
    {
      helpptr = 3 ;
      helpline [2 ]= 1362 ;
      helpline [1 ]= 1363 ;
      helpline [0 ]= 1364 ;
    } 
    error () ;
    flushmath () ;
    danger = true ;
  } 
  else if ( ( fontparams [eqtb [50989L ].hh .v.RH ]< 13 ) || ( fontparams 
  [eqtb [51245L ].hh .v.RH ]< 13 ) || ( fontparams [eqtb [51501L ].hh 
  .v.RH ]< 13 ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1365 ) ;
    } 
    {
      helpptr = 3 ;
      helpline [2 ]= 1366 ;
      helpline [1 ]= 1367 ;
      helpline [0 ]= 1368 ;
    } 
    error () ;
    flushmath () ;
    danger = true ;
  } 
  deleteglueref ( curkanjiskip ) ;
  deleteglueref ( curxkanjiskip ) ;
  if ( eqtb [51756L ].hh .v.RH > 0 ) 
  curkanjiskip = eqtb [49940L ].hh .v.RH ;
  else curkanjiskip = membot ;
  if ( eqtb [51757L ].hh .v.RH > 0 ) 
  curxkanjiskip = eqtb [49941L ].hh .v.RH ;
  else curxkanjiskip = membot ;
  incr ( mem [curkanjiskip ].hh .v.RH ) ;
  incr ( mem [curxkanjiskip ].hh .v.RH ) ;
  m = curlist .modefield ;
  l = false ;
  p = finmlist ( -1073741823L ) ;
  if ( curlist .modefield == - (integer) m ) 
  {
    {
      do {
	  getxtoken () ;
      } while ( ! ( ( eqtb [114442L ].cint == 0 ) || ( curcmd != 13 ) ) ) ;
      if ( curcmd != 3 ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1369 ) ;
	} 
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1370 ;
	  helpline [0 ]= 1371 ;
	} 
	backerror () ;
      } 
    } 
    curmlist = p ;
    curstyle = 2 ;
    mlistpenalties = false ;
    mlisttohlist () ;
    a = hpack ( mem [memtop - 3 ].hh .v.RH , 0 , 1 ) ;
    mem [a ].hh.b1 = ( ( mem [a ].hh.b1 ) % 16 - 5 ) + 5 + 16 * ( 2 ) ;
    unsave () ;
    decr ( saveptr ) ;
    if ( savestack [saveptr + 0 ].cint == 1 ) 
    l = true ;
    danger = false ;
    if ( curlist .modefield == 239 ) 
    j = curlist .eTeXauxfield ;
    if ( ( fontparams [eqtb [50988L ].hh .v.RH ]< 22 ) || ( fontparams [
    eqtb [51244L ].hh .v.RH ]< 22 ) || ( fontparams [eqtb [51500L ].hh 
    .v.RH ]< 22 ) ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1361 ) ;
      } 
      {
	helpptr = 3 ;
	helpline [2 ]= 1362 ;
	helpline [1 ]= 1363 ;
	helpline [0 ]= 1364 ;
      } 
      error () ;
      flushmath () ;
      danger = true ;
    } 
    else if ( ( fontparams [eqtb [50989L ].hh .v.RH ]< 13 ) || ( 
    fontparams [eqtb [51245L ].hh .v.RH ]< 13 ) || ( fontparams [eqtb [
    51501L ].hh .v.RH ]< 13 ) ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1365 ) ;
      } 
      {
	helpptr = 3 ;
	helpline [2 ]= 1366 ;
	helpline [1 ]= 1367 ;
	helpline [0 ]= 1368 ;
      } 
      error () ;
      flushmath () ;
      danger = true ;
    } 
    m = curlist .modefield ;
    p = finmlist ( -1073741823L ) ;
  } 
  else a = -1073741823L ;
  if ( m < 0 ) 
  {
    if ( curlist .dirfield == 3 ) 
    disp = eqtb [114978L ].cint ;
    else disp = eqtb [114979L ].cint ;
    {
      if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield 
      ].hh.b0 == 5 ) ) 
      {
	if ( curlist .pdispfield == disp ) 
	{
	  freenode ( curlist .tailfield , 2 ) ;
	  curlist .tailfield = curlist .pnodefield ;
	  mem [curlist .tailfield ].hh .v.RH = -1073741823L ;
	} 
	else mem [curlist .tailfield + 1 ].cint = disp ;
      } 
      else if ( disp != 0 || ! curlist .dispcalledfield ) 
      {
	curlist .pnodefield = curlist .tailfield ;
	{
	  mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	} 
	mem [curlist .tailfield ].hh.b0 = 5 ;
	mem [curlist .tailfield + 1 ].cint = disp ;
	curlist .pdispfield = disp ;
	curlist .dispcalledfield = true ;
      } 
    } 
    {
      mem [curlist .tailfield ].hh .v.RH = newmath ( eqtb [114958L ].cint 
      , 0 ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    curmlist = p ;
    curstyle = 2 ;
    mlistpenalties = ( curlist .modefield > 0 ) ;
    mlisttohlist () ;
    mem [curlist .tailfield ].hh .v.RH = mem [memtop - 3 ].hh .v.RH ;
    while ( mem [curlist .tailfield ].hh .v.RH != -1073741823L ) curlist 
    .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    {
      mem [curlist .tailfield ].hh .v.RH = newmath ( eqtb [114958L ].cint 
      , 1 ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    if ( disp != 0 ) 
    {
      if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield 
      ].hh.b0 == 5 ) ) 
      {
	mem [curlist .tailfield + 1 ].cint = 0 ;
      } 
      else {
	  
	curlist .pnodefield = curlist .tailfield ;
	{
	  mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	} 
	mem [curlist .tailfield ].hh.b0 = 5 ;
	mem [curlist .tailfield + 1 ].cint = 0 ;
	curlist .pdispfield = disp ;
	curlist .dispcalledfield = true ;
      } 
    } 
    curlist .auxfield .hh .v.LH = 1000 ;
    curlist .inhibitglueflagfield = false ;
    unsave () ;
  } 
  else {
      
    if ( a == -1073741823L ) 
    {
      do {
	  getxtoken () ;
      } while ( ! ( ( eqtb [114442L ].cint == 0 ) || ( curcmd != 13 ) ) ) ;
      if ( curcmd != 3 ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1369 ) ;
	} 
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1370 ;
	  helpline [0 ]= 1371 ;
	} 
	backerror () ;
      } 
    } 
    curmlist = p ;
    curstyle = 0 ;
    mlistpenalties = false ;
    mlisttohlist () ;
    p = mem [memtop - 3 ].hh .v.RH ;
    adjusttail = memtop - 5 ;
    preadjusttail = memtop - 14 ;
    b = hpack ( p , 0 , 1 ) ;
    p = mem [b + 5 ].hh .v.RH ;
    t = adjusttail ;
    adjusttail = -1073741823L ;
    pret = preadjusttail ;
    preadjusttail = -1073741823L ;
    w = mem [b + 1 ].cint ;
    z = eqtb [114971L ].cint ;
    s = eqtb [114972L ].cint ;
    if ( eqtb [114435L ].cint < 0 ) 
    s = - (integer) s - z ;
    if ( ( a == -1073741823L ) || danger ) 
    {
      e = 0 ;
      q = 0 ;
    } 
    else {
	
      e = mem [a + 1 ].cint ;
      q = e + fontinfo [6 + parambase [eqtb [50988L ].hh .v.RH ]].cint ;
    } 
    if ( w + q > z ) 
    {
      if ( ( e != 0 ) && ( ( w - totalshrink [0 ]+ q <= z ) || ( totalshrink 
      [1 ]!= 0 ) || ( totalshrink [2 ]!= 0 ) || ( totalshrink [3 ]!= 0 ) 
      || ( totalshrink [4 ]!= 0 ) ) ) 
      {
	deleteglueref ( mem [b + 7 ].hh .v.RH ) ;
	deleteglueref ( mem [b + 7 ].hh .v.LH ) ;
	freenode ( b , 10 ) ;
	b = hpack ( p , z - q , 0 ) ;
      } 
      else {
	  
	e = 0 ;
	if ( w > z ) 
	{
	  deleteglueref ( mem [b + 7 ].hh .v.RH ) ;
	  deleteglueref ( mem [b + 7 ].hh .v.LH ) ;
	  freenode ( b , 10 ) ;
	  b = hpack ( p , z , 0 ) ;
	} 
      } 
      w = mem [b + 1 ].cint ;
    } 
    mem [b ].hh.b1 = ( ( mem [b ].hh.b1 ) % 16 - 5 ) + 5 + 16 * ( 2 ) ;
    d = half ( z - w ) ;
    if ( ( e > 0 ) && ( d < 2 * e ) ) 
    {
      d = half ( z - w - e ) ;
      if ( p != -1073741823L ) {
	  
	if ( ! ( p >= himemmin ) ) {
	    
	  if ( mem [p ].hh.b0 == 12 ) 
	  d = 0 ;
	} 
      } 
    } 
    {
      mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [114372L ]
      .cint ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    if ( ( d + s <= eqtb [114970L ].cint ) || l ) 
    {
      g1 = 3 ;
      g2 = 4 ;
    } 
    else {
	
      g1 = 5 ;
      g2 = 6 ;
    } 
    if ( l && ( e == 0 ) ) 
    {
      appdisplay ( j , a , 0 ) ;
      {
	mem [curlist .tailfield ].hh .v.RH = newpenalty ( 10000 ) ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
    } 
    else {
	
      mem [curlist .tailfield ].hh .v.RH = newparamglue ( g1 ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    if ( e != 0 ) 
    {
      r = newkern ( z - w - e - d ) ;
      if ( l ) 
      {
	mem [a ].hh .v.RH = r ;
	mem [r ].hh .v.RH = b ;
	b = a ;
	d = 0 ;
      } 
      else {
	  
	mem [b ].hh .v.RH = r ;
	mem [r ].hh .v.RH = a ;
      } 
      b = hpack ( b , 0 , 1 ) ;
    } 
    appdisplay ( j , b , d ) ;
    if ( ( a != -1073741823L ) && ( e == 0 ) && ! l ) 
    {
      {
	mem [curlist .tailfield ].hh .v.RH = newpenalty ( 10000 ) ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      appdisplay ( j , a , z - mem [a + 1 ].cint ) ;
      g2 = 0 ;
    } 
    if ( t != memtop - 5 ) 
    {
      mem [curlist .tailfield ].hh .v.RH = mem [memtop - 5 ].hh .v.RH ;
      curlist .tailfield = t ;
    } 
    if ( pret != memtop - 14 ) 
    {
      mem [curlist .tailfield ].hh .v.RH = mem [memtop - 14 ].hh .v.RH ;
      curlist .tailfield = pret ;
    } 
    {
      mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [114373L ]
      .cint ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    if ( g2 > 0 ) 
    {
      mem [curlist .tailfield ].hh .v.RH = newparamglue ( g2 ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    flushnodelist ( j ) ;
    resumeafterdisplay () ;
  } 
} 
void 
resumeafterdisplay ( void ) 
{
  resumeafterdisplay_regmem 
  if ( curgroup != 15 ) 
  confusion ( 1372 ) ;
  unsave () ;
  curlist .pgfield = curlist .pgfield + 3 ;
  pushnest () ;
  curlist .adjdirfield = curlist .dirfield ;
  curlist .inhibitglueflagfield = false ;
  curlist .modefield = 120 ;
  curlist .auxfield .hh .v.LH = 1000 ;
  if ( eqtb [114412L ].cint <= 0 ) 
  curlang = 0 ;
  else if ( eqtb [114412L ].cint > 255 ) 
  curlang = 0 ;
  else curlang = eqtb [114412L ].cint ;
  curlist .auxfield .hh .v.RH = curlang ;
  curlist .pgfield = ( normmin ( eqtb [114413L ].cint ) * 64 + normmin ( 
  eqtb [114414L ].cint ) ) * 65536L + curlang ;
  {
    getxtoken () ;
    if ( curcmd != 10 ) 
    backinput () ;
  } 
  if ( nestptr == 1 ) 
  buildpage () ;
} 
boolean 
zscankeywordnoexpand ( strnumber s ) 
{
  /* 10 */ register boolean Result; scankeywordnoexpand_regmem 
  halfword p  ;
  halfword q  ;
  poolpointer k  ;
  p = memtop - 13 ;
  mem [p ].hh .v.RH = -1073741823L ;
  k = strstart [s ];
  while ( k < strstart [s + 1 ]) {
      
    gettoken () ;
    if ( ( curcs == 0 ) && ( ( curchr == strpool [k ]) || ( curchr == 
    strpool [k ]- 32 ) ) ) 
    {
      {
	q = getavail () ;
	mem [p ].hh .v.RH = q ;
	mem [q ].hh .v.LH = curtok ;
	p = q ;
      } 
      incr ( k ) ;
    } 
    else if ( ( curcmd != 10 ) || ( p != memtop - 13 ) ) 
    {
      backinput () ;
      if ( p != memtop - 13 ) 
      begintokenlist ( mem [memtop - 13 ].hh .v.RH , 3 ) ;
      Result = false ;
      return Result ;
    } 
  } 
  flushlist ( mem [memtop - 13 ].hh .v.RH ) ;
  Result = true ;
  return Result ;
} 
void 
getrtoken ( void ) 
{
  /* 20 */ getrtoken_regmem 
  lab20: do {
      gettoken () ;
  } while ( ! ( curtok != 655392L ) ) ;
  if ( ( curcs == 0 ) || ( curcs > eqtbtop ) || ( ( curcs > 38810L ) && ( 
  curcs <= 116261L ) ) ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1390 ) ;
    } 
    {
      helpptr = 5 ;
      helpline [4 ]= 1391 ;
      helpline [3 ]= 1392 ;
      helpline [2 ]= 1393 ;
      helpline [1 ]= 1394 ;
      helpline [0 ]= 1395 ;
    } 
    if ( curcs == 0 ) 
    backinput () ;
    curtok = 536909721L ;
    inserror () ;
    goto lab20 ;
  } 
} 
void 
trapzeroglue ( void ) 
{
  trapzeroglue_regmem 
  if ( ( mem [curval + 1 ].cint == 0 ) && ( mem [curval + 2 ].cint == 0 ) 
  && ( mem [curval + 3 ].cint == 0 ) ) 
  {
    incr ( mem [membot ].hh .v.RH ) ;
    deleteglueref ( curval ) ;
    curval = membot ;
  } 
} 
void 
zdoregistercommand ( smallnumber a ) 
{
  /* 40 10 */ doregistercommand_regmem 
  halfword l, q, r, s  ;
  unsigned char p  ;
  boolean e  ;
  integer w  ;
  q = curcmd ;
  e = false ;
  {
    if ( q != 104 ) 
    {
      getxtoken () ;
      if ( ( curcmd >= 83 ) && ( curcmd <= 86 ) ) 
      {
	l = curchr ;
	p = curcmd - 83 ;
	goto lab40 ;
      } 
      if ( curcmd != 104 ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 789 ) ;
	} 
	printcmdchr ( curcmd , curchr ) ;
	print ( 790 ) ;
	printcmdchr ( q , 0 ) ;
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1425 ;
	} 
	error () ;
	return ;
      } 
    } 
    if ( ( curchr < membot ) || ( curchr > membot + 23 ) ) 
    {
      l = curchr ;
      p = ( mem [l ].hh.b0 / 16 ) ;
      e = true ;
    } 
    else {
	
      p = curchr - membot ;
      scanregisternum () ;
      if ( curval > 255 ) 
      {
	findsaelement ( p , curval , true ) ;
	l = curptr ;
	e = true ;
      } 
      else switch ( p ) 
      {case 0 : 
	l = curval + 114445L ;
	break ;
      case 1 : 
	l = curval + 114982L ;
	break ;
      case 2 : 
	l = curval + 49946L ;
	break ;
      case 3 : 
	l = curval + 50202L ;
	break ;
      } 
    } 
  } 
  lab40: if ( p < 2 ) {
      
    if ( e ) 
    w = mem [l + 2 ].cint ;
    else w = eqtb [l ].cint ;
  } 
  else if ( e ) 
  s = mem [l + 1 ].hh .v.RH ;
  else s = eqtb [l ].hh .v.RH ;
  if ( q == 104 ) 
  scanoptionalequals () ;
  else if ( scankeyword ( 1421 ) ) 
  ;
  aritherror = false ;
  if ( q < 106 ) {
      
    if ( p < 2 ) 
    {
      if ( p == 0 ) 
      scanint () ;
      else scandimen ( false , false , false ) ;
      if ( q == 105 ) 
      curval = curval + w ;
    } 
    else {
	
      scanglue ( p ) ;
      if ( q == 105 ) 
      {
	q = newspec ( curval ) ;
	r = s ;
	deleteglueref ( curval ) ;
	mem [q + 1 ].cint = mem [q + 1 ].cint + mem [r + 1 ].cint ;
	if ( mem [q + 2 ].cint == 0 ) 
	mem [q ].hh.b0 = 0 ;
	if ( mem [q ].hh.b0 == mem [r ].hh.b0 ) 
	mem [q + 2 ].cint = mem [q + 2 ].cint + mem [r + 2 ].cint ;
	else if ( ( mem [q ].hh.b0 < mem [r ].hh.b0 ) && ( mem [r + 2 ]
	.cint != 0 ) ) 
	{
	  mem [q + 2 ].cint = mem [r + 2 ].cint ;
	  mem [q ].hh.b0 = mem [r ].hh.b0 ;
	} 
	if ( mem [q + 3 ].cint == 0 ) 
	mem [q ].hh.b1 = 0 ;
	if ( mem [q ].hh.b1 == mem [r ].hh.b1 ) 
	mem [q + 3 ].cint = mem [q + 3 ].cint + mem [r + 3 ].cint ;
	else if ( ( mem [q ].hh.b1 < mem [r ].hh.b1 ) && ( mem [r + 3 ]
	.cint != 0 ) ) 
	{
	  mem [q + 3 ].cint = mem [r + 3 ].cint ;
	  mem [q ].hh.b1 = mem [r ].hh.b1 ;
	} 
	curval = q ;
      } 
    } 
  } 
  else {
      
    scanint () ;
    if ( p < 2 ) {
	
      if ( q == 106 ) {
	  
	if ( p == 0 ) 
	curval = multandadd ( w , curval , 0 , 2147483647L ) ;
	else curval = multandadd ( w , curval , 0 , 1073741823L ) ;
      } 
      else curval = xovern ( w , curval ) ;
    } 
    else {
	
      r = newspec ( s ) ;
      if ( q == 106 ) 
      {
	mem [r + 1 ].cint = multandadd ( mem [s + 1 ].cint , curval , 0 , 
	1073741823L ) ;
	mem [r + 2 ].cint = multandadd ( mem [s + 2 ].cint , curval , 0 , 
	1073741823L ) ;
	mem [r + 3 ].cint = multandadd ( mem [s + 3 ].cint , curval , 0 , 
	1073741823L ) ;
      } 
      else {
	  
	mem [r + 1 ].cint = xovern ( mem [s + 1 ].cint , curval ) ;
	mem [r + 2 ].cint = xovern ( mem [s + 2 ].cint , curval ) ;
	mem [r + 3 ].cint = xovern ( mem [s + 3 ].cint , curval ) ;
      } 
      curval = r ;
    } 
  } 
  if ( aritherror ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1422 ) ;
    } 
    {
      helpptr = 2 ;
      helpline [1 ]= 1423 ;
      helpline [0 ]= 1424 ;
    } 
    if ( p >= 2 ) 
    deleteglueref ( curval ) ;
    error () ;
    return ;
  } 
  if ( p < 2 ) {
      
    if ( e ) {
	
      if ( ( a >= 4 ) ) 
      gsawdef ( l , curval ) ;
      else sawdef ( l , curval ) ;
    } 
    else if ( ( a >= 4 ) ) 
    geqworddefine ( l , curval ) ;
    else eqworddefine ( l , curval ) ;
  } 
  else {
      
    trapzeroglue () ;
    if ( e ) {
	
      if ( ( a >= 4 ) ) 
      gsadef ( l , curval ) ;
      else sadef ( l , curval ) ;
    } 
    else if ( ( a >= 4 ) ) 
    geqdefine ( l , 135 , curval ) ;
    else eqdefine ( l , 135 , curval ) ;
  } 
} 
void 
alteraux ( void ) 
{
  alteraux_regmem 
  halfword c  ;
  if ( curchr != abs ( curlist .modefield ) ) 
  reportillegalcase () ;
  else {
      
    c = curchr ;
    scanoptionalequals () ;
    if ( c == 1 ) 
    {
      scandimen ( false , false , false ) ;
      curlist .auxfield .cint = curval ;
    } 
    else {
	
      scanint () ;
      if ( ( curval <= 0 ) || ( curval > 32767 ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1428 ) ;
	} 
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1429 ;
	} 
	interror ( curval ) ;
      } 
      else curlist .auxfield .hh .v.LH = curval ;
    } 
  } 
} 
void 
alterprevgraf ( void ) 
{
  alterprevgraf_regmem 
  integer p  ;
  nest [nestptr ]= curlist ;
  p = nestptr ;
  while ( abs ( nest [p ].modefield ) != 1 ) decr ( p ) ;
  scanoptionalequals () ;
  scanint () ;
  if ( curval < 0 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1124 ) ;
    } 
    printesc ( 603 ) ;
    {
      helpptr = 1 ;
      helpline [0 ]= 1430 ;
    } 
    interror ( curval ) ;
  } 
  else {
      
    nest [p ].pgfield = curval ;
    curlist = nest [nestptr ];
  } 
} 
void 
alterpagesofar ( void ) 
{
  alterpagesofar_regmem 
  unsigned char c  ;
  c = curchr ;
  scanoptionalequals () ;
  scandimen ( false , false , false ) ;
  pagesofar [c ]= curval ;
} 
void 
alterinteger ( void ) 
{
  alterinteger_regmem 
  smallnumber c  ;
  c = curchr ;
  scanoptionalequals () ;
  scanint () ;
  if ( c == 0 ) 
  deadcycles = curval ;
  else if ( c == 2 ) 
  {
    if ( ( curval < 0 ) || ( curval > 3 ) ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1599 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 1600 ;
	helpline [0 ]= 1601 ;
      } 
      interror ( curval ) ;
    } 
    else {
	
      curchr = curval ;
      newinteraction () ;
    } 
  } 
  else insertpenalties = curval ;
} 
void 
alterboxdimen ( void ) 
{
  alterboxdimen_regmem 
  smallnumber c  ;
  halfword p, q  ;
  halfword b  ;
  c = curchr ;
  scanregisternum () ;
  if ( curval < 256 ) 
  b = eqtb [50729L + curval ].hh .v.RH ;
  else {
      
    findsaelement ( 4 , curval , false ) ;
    if ( curptr == -1073741823L ) 
    b = -1073741823L ;
    else b = mem [curptr + 1 ].hh .v.RH ;
  } 
  scanoptionalequals () ;
  scandimen ( false , false , false ) ;
  if ( b != -1073741823L ) 
  {
    q = b ;
    p = mem [q ].hh .v.RH ;
    while ( p != -1073741823L ) {
	
      if ( abs ( curlist .dirfield ) == abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 
      ) ) ) 
      q = p ;
      p = mem [p ].hh .v.RH ;
    } 
    if ( abs ( ( ( mem [q ].hh.b1 ) % 16 - 5 ) ) != abs ( curlist .dirfield 
    ) ) 
    {
      p = mem [b ].hh .v.RH ;
      mem [b ].hh .v.RH = -1073741823L ;
      q = newdirnode ( q , abs ( curlist .dirfield ) ) ;
      mem [q + 5 ].hh .v.RH = -1073741823L ;
      mem [q ].hh .v.RH = p ;
      mem [b ].hh .v.RH = q ;
    } 
    mem [q + c ].cint = curval ;
  } 
} 
void 
znewfont ( smallnumber a ) 
{
  /* 50 */ newfont_regmem 
  halfword u  ;
  scaled s  ;
  internalfontnumber f  ;
  strnumber t  ;
  unsigned char oldsetting  ;
  if ( jobname == 0 ) 
  openlogfile () ;
  {
    jfmenc = 0 ;
    if ( scankeywordnoexpand ( 826 ) ) {
	
      if ( scankeywordnoexpand ( 854 ) ) 
      jfmenc = 1 ;
      else if ( scankeywordnoexpand ( 856 ) ) 
      jfmenc = 2 ;
      else if ( scankeywordnoexpand ( 1658 ) ) 
      jfmenc = 128 ;
      else if ( scankeywordnoexpand ( 1659 ) ) 
      jfmenc = 129 ;
      else if ( scankeywordnoexpand ( 1660 ) ) 
      jfmenc = 130 ;
      else if ( scankeywordnoexpand ( 1661 ) ) 
      jfmenc = 131 ;
      else if ( scankeywordnoexpand ( 1662 ) ) 
      jfmenc = 132 ;
      else if ( scankeywordnoexpand ( 1663 ) ) 
      jfmenc = 144 ;
      else if ( scankeywordnoexpand ( 1664 ) ) 
      jfmenc = 145 ;
      else if ( scankeywordnoexpand ( 1665 ) ) 
      jfmenc = 146 ;
      else if ( scankeywordnoexpand ( 1666 ) ) 
      jfmenc = 160 ;
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1667 ) ;
	} 
	{
	  helpptr = 1 ;
	  helpline [0 ]= 1668 ;
	} 
	error () ;
      } 
    } 
  } 
  getrtoken () ;
  u = curcs ;
  if ( u >= 23810 ) 
  t = hash [u ].v.RH ;
  else if ( u >= 11905 ) {
      
    if ( u == 23809 ) 
    t = 1434 ;
    else t = u - 11905 ;
  } 
  else {
      
    oldsetting = selector ;
    selector = 21 ;
    print ( 1434 ) ;
    print ( u - 1 ) ;
    selector = oldsetting ;
    {
      if ( poolptr + 1 > poolsize ) 
      overflow ( 260 , poolsize - initpoolptr ) ;
    } 
    t = makestring () ;
  } 
  if ( ( a >= 4 ) ) 
  geqdefine ( u , 100 , 0 ) ;
  else eqdefine ( u , 100 , 0 ) ;
  scanoptionalequals () ;
  scanfilename () ;
  nameinprogress = true ;
  if ( scankeyword ( 1435 ) ) 
  {
    scandimen ( false , false , false ) ;
    s = curval ;
    if ( ( s <= 0 ) || ( s >= 134217728L ) ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1437 ) ;
      } 
      printscaled ( s ) ;
      print ( 1438 ) ;
      {
	helpptr = 2 ;
	helpline [1 ]= 1439 ;
	helpline [0 ]= 1440 ;
      } 
      error () ;
      s = 10 * 65536L ;
    } 
  } 
  else if ( scankeyword ( 1436 ) ) 
  {
    scanint () ;
    s = - (integer) curval ;
    if ( ( curval <= 0 ) || ( curval > 32768L ) ) 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 641 ) ;
      } 
      {
	helpptr = 1 ;
	helpline [0 ]= 642 ;
      } 
      interror ( curval ) ;
      s = -1000 ;
    } 
  } 
  else s = -1000 ;
  nameinprogress = false ;
  {register integer for_end; f = 1 ;for_end = fontptr ; if ( f <= for_end) 
  do 
    if ( streqstr ( fontname [f ], curname ) && streqstr ( fontarea [f ], 
    curarea ) ) 
    {
      if ( s > 0 ) 
      {
	if ( s == fontsize [f ]) 
	goto lab50 ;
      } 
      else {
	  
	aritherror = false ;
	if ( fontsize [f ]== xnoverd ( fontdsize [f ], - (integer) s , 
	1000 ) ) {
	    
	  if ( ! aritherror ) 
	  goto lab50 ;
	} 
      } 
    } 
  while ( f++ < for_end ) ;} 
  f = readfontinfo ( u , curname , curarea , s ) ;
  lab50: if ( ( a >= 4 ) ) 
  geqdefine ( u , 100 , f ) ;
  else eqdefine ( u , 100 , f ) ;
  eqtb [40923L + f ]= eqtb [u ];
  hash [40923L + f ].v.RH = t ;
} 
void 
newinteraction ( void ) 
{
  newinteraction_regmem 
  println () ;
  interaction = curchr ;
  if ( interaction == 0 ) 
  kpsemaketexdiscarderrors = 1 ;
  else kpsemaketexdiscarderrors = 0 ;
  if ( interaction == 0 ) 
  selector = 16 ;
  else selector = 17 ;
  if ( logopened ) 
  selector = selector + 2 ;
} 
void 
doassignments ( void ) 
{
  /* 10 */ doassignments_regmem 
  while ( true ) {
      
    do {
	getxtoken () ;
    } while ( ! ( ( curcmd != 10 ) && ( curcmd != 0 ) ) ) ;
    if ( curcmd <= 80 ) 
    return ;
    setboxallowed = false ;
    prefixedcommand () ;
    setboxallowed = true ;
  } 
} 
void 
openorclosein ( void ) 
{
  openorclosein_regmem 
  unsigned char c  ;
  unsigned char n  ;
  c = curchr ;
  scanfourbitint () ;
  n = curval ;
  if ( readopen [n ]!= 2 ) 
  {
    aclose ( readfile [n ]) ;
    readopen [n ]= 2 ;
  } 
  if ( c != 0 ) 
  {
    scanoptionalequals () ;
    scanfilename () ;
    packfilename ( curname , curarea , curext ) ;
    texinputtype = 0 ;
    if ( kpseinnameok ( stringcast ( nameoffile + 1 ) ) && aopenin ( readfile 
    [n ], kpsetexformat ) ) 
    readopen [n ]= 1 ;
  } 
} 
void 
issuemessage ( void ) 
{
  issuemessage_regmem 
  unsigned char oldsetting  ;
  unsigned char c  ;
  strnumber s  ;
  c = curchr ;
  mem [memtop - 12 ].hh .v.RH = scantoks ( false , true ) ;
  oldsetting = selector ;
  selector = 21 ;
  tokenshow ( defref ) ;
  selector = oldsetting ;
  flushlist ( defref ) ;
  {
    if ( poolptr + 1 > poolsize ) 
    overflow ( 260 , poolsize - initpoolptr ) ;
  } 
  s = makestring () ;
  if ( c == 0 ) 
  {
    if ( termoffset + ( strstart [s + 1 ]- strstart [s ]) > maxprintline - 
    2 ) 
    println () ;
    else if ( ( termoffset > 0 ) || ( fileoffset > 0 ) ) 
    printchar ( 32 ) ;
    slowprint ( s ) ;
    fflush ( stdout ) ;
  } 
  else {
      
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 349 ) ;
    } 
    slowprint ( s ) ;
    if ( eqtb [50467L ].hh .v.RH != -1073741823L ) 
    useerrhelp = true ;
    else if ( longhelpseen ) 
    {
      helpptr = 1 ;
      helpline [0 ]= 1447 ;
    } 
    else {
	
      if ( interaction < 3 ) 
      longhelpseen = true ;
      {
	helpptr = 4 ;
	helpline [3 ]= 1448 ;
	helpline [2 ]= 1449 ;
	helpline [1 ]= 1450 ;
	helpline [0 ]= 1451 ;
      } 
    } 
    error () ;
    useerrhelp = false ;
  } 
  {
    decr ( strptr ) ;
    poolptr = strstart [strptr ];
  } 
} 
void 
shiftcase ( void ) 
{
  shiftcase_regmem 
  halfword b  ;
  halfword p  ;
  halfword t  ;
  sixteenbits c  ;
  b = curchr ;
  p = scantoks ( false , false ) ;
  p = mem [defref ].hh .v.RH ;
  while ( p != -1073741823L ) {
      
    t = mem [p ].hh .v.LH ;
    if ( ( t < 536882816L ) && ( checkkanji ( t ) < 2 ) ) 
    {
      c = t % 65536L ;
      if ( eqtb [b + c ].hh .v.RH != 0 ) 
      mem [p ].hh .v.LH = t - c + eqtb [b + c ].hh .v.RH ;
    } 
    p = mem [p ].hh .v.RH ;
  } 
  begintokenlist ( mem [defref ].hh .v.RH , 3 ) ;
  {
    mem [defref ].hh .v.RH = avail ;
    avail = defref ;
	;
#ifdef STAT
    decr ( dynused ) ;
#endif /* STAT */
  } 
} 
void 
showwhatever ( void ) 
{
  /* 50 */ showwhatever_regmem 
  halfword p  ;
  smallnumber t  ;
  unsigned char m  ;
  integer l  ;
  integer n  ;
  switch ( curchr ) 
  {case 3 : 
    {
      if ( ( eqtb [114428L ].cint >= 0 ) && ( eqtb [114428L ].cint < 16 ) 
      && writeopen [eqtb [114428L ].cint ]) 
      selector = eqtb [114428L ].cint ;
      begindiagnostic () ;
      showactivities () ;
    } 
    break ;
  case 1 : 
    {
      scanregisternum () ;
      if ( curval < 256 ) 
      p = eqtb [50729L + curval ].hh .v.RH ;
      else {
	  
	findsaelement ( 4 , curval , false ) ;
	if ( curptr == -1073741823L ) 
	p = -1073741823L ;
	else p = mem [curptr + 1 ].hh .v.RH ;
      } 
      if ( ( eqtb [114428L ].cint >= 0 ) && ( eqtb [114428L ].cint < 16 ) 
      && writeopen [eqtb [114428L ].cint ]) 
      selector = eqtb [114428L ].cint ;
      begindiagnostic () ;
      printnl ( 1468 ) ;
      printint ( curval ) ;
      printchar ( 61 ) ;
      if ( p == -1073741823L ) 
      print ( 438 ) ;
      else showbox ( p ) ;
    } 
    break ;
  case 0 : 
    {
      gettoken () ;
      if ( ( eqtb [114428L ].cint >= 0 ) && ( eqtb [114428L ].cint < 16 ) 
      && writeopen [eqtb [114428L ].cint ]) 
      selector = eqtb [114428L ].cint ;
      if ( interaction == 3 ) 
      ;
      printnl ( 1464 ) ;
      if ( curcs != 0 ) 
      {
	sprintcs ( curcs ) ;
	printchar ( 61 ) ;
      } 
      printmeaning () ;
      goto lab50 ;
    } 
    break ;
  case 7 : 
    {
      if ( ( eqtb [114428L ].cint >= 0 ) && ( eqtb [114428L ].cint < 16 ) 
      && writeopen [eqtb [114428L ].cint ]) 
      selector = eqtb [114428L ].cint ;
      printnl ( 1464 ) ;
      if ( eqtb [51756L ].hh .v.RH > 0 ) 
      print ( 1687 ) ;
      else print ( 1688 ) ;
      printnl ( 1464 ) ;
      if ( eqtb [51757L ].hh .v.RH > 0 ) 
      print ( 1689 ) ;
      else print ( 1690 ) ;
      goto lab50 ;
    } 
    break ;
  case 4 : 
    {
      if ( ( eqtb [114428L ].cint >= 0 ) && ( eqtb [114428L ].cint < 16 ) 
      && writeopen [eqtb [114428L ].cint ]) 
      selector = eqtb [114428L ].cint ;
      begindiagnostic () ;
      showsavegroups () ;
    } 
    break ;
  case 6 : 
    {
      if ( ( eqtb [114428L ].cint >= 0 ) && ( eqtb [114428L ].cint < 16 ) 
      && writeopen [eqtb [114428L ].cint ]) 
      selector = eqtb [114428L ].cint ;
      begindiagnostic () ;
      printnl ( 349 ) ;
      println () ;
      if ( condptr == -1073741823L ) 
      {
	printnl ( 386 ) ;
	print ( 1596 ) ;
      } 
      else {
	  
	p = condptr ;
	n = 0 ;
	do {
	    incr ( n ) ;
	  p = mem [p ].hh .v.RH ;
	} while ( ! ( p == -1073741823L ) ) ;
	p = condptr ;
	t = curif ;
	l = ifline ;
	m = iflimit ;
	do {
	    printnl ( 1597 ) ;
	  printint ( n ) ;
	  print ( 657 ) ;
	  printcmdchr ( 123 , t ) ;
	  if ( m == 2 ) 
	  printesc ( 934 ) ;
	  if ( l != 0 ) 
	  {
	    print ( 1595 ) ;
	    printint ( l ) ;
	  } 
	  decr ( n ) ;
	  t = mem [p ].hh.b1 ;
	  l = mem [p + 1 ].cint ;
	  m = mem [p ].hh.b0 ;
	  p = mem [p ].hh .v.RH ;
	} while ( ! ( p == -1073741823L ) ) ;
      } 
    } 
    break ;
    default: 
    {
      p = thetoks () ;
      if ( ( eqtb [114428L ].cint >= 0 ) && ( eqtb [114428L ].cint < 16 ) 
      && writeopen [eqtb [114428L ].cint ]) 
      selector = eqtb [114428L ].cint ;
      if ( interaction == 3 ) 
      ;
      printnl ( 1464 ) ;
      tokenshow ( memtop - 3 ) ;
      flushlist ( mem [memtop - 3 ].hh .v.RH ) ;
      goto lab50 ;
    } 
    break ;
  } 
  enddiagnostic ( true ) ;
  {
    if ( interaction == 3 ) 
    ;
    if ( filelineerrorstylep ) 
    printfileline () ;
    else printnl ( 265 ) ;
    print ( 1469 ) ;
  } 
  if ( selector == 19 ) {
      
    if ( eqtb [114390L ].cint <= 0 ) 
    {
      selector = 17 ;
      print ( 1470 ) ;
      selector = 19 ;
    } 
  } 
  lab50: if ( selector < 16 ) 
  {
    println () ;
    if ( interaction == 0 ) 
    selector = 16 ;
    else selector = 17 ;
    if ( logopened ) 
    selector = selector + 2 ;
  } 
  else {
      
    if ( interaction < 3 ) 
    {
      helpptr = 0 ;
      decr ( errorcount ) ;
    } 
    else if ( eqtb [114390L ].cint > 0 ) 
    {
      {
	helpptr = 3 ;
	helpline [2 ]= 1459 ;
	helpline [1 ]= 1460 ;
	helpline [0 ]= 1461 ;
      } 
    } 
    else {
	
      {
	helpptr = 5 ;
	helpline [4 ]= 1459 ;
	helpline [3 ]= 1460 ;
	helpline [2 ]= 1461 ;
	helpline [1 ]= 1462 ;
	helpline [0 ]= 1463 ;
      } 
    } 
    error () ;
  } 
} 
void 
znewwhatsit ( smallnumber s , smallnumber w ) 
{
  newwhatsit_regmem 
  halfword p  ;
  p = getnode ( w ) ;
  mem [p ].hh.b0 = 10 ;
  mem [p ].hh.b1 = s ;
  mem [curlist .tailfield ].hh .v.RH = p ;
  curlist .tailfield = p ;
} 
void 
znewwritewhatsit ( smallnumber w ) 
{
  newwritewhatsit_regmem 
  newwhatsit ( curchr , w ) ;
  if ( w != 2 ) 
  scanfourbitint () ;
  else {
      
    scanint () ;
    if ( curval < 0 ) 
    curval = 17 ;
    else if ( ( curval > 15 ) && ( curval != 18 ) ) 
    curval = 16 ;
  } 
  mem [curlist .tailfield + 1 ].hh .v.LH = curval ;
  curlist .inhibitglueflagfield = false ;
} 
void 
eptexsetinputencoding ( void ) 
{
  eptexsetinputencoding_regmem 
  integer j, k  ;
  scanfilename () ;
  packfilename ( curname , curarea , curext ) ;
  if ( curinput .statefield == 0 ) 
  {
    k = inputptr - 1 ;
    j = -1 ;
    while ( k >= 0 ) {
	
      if ( inputstack [k ].statefield == 0 ) 
      decr ( k ) ;
      else if ( inputstack [k ].namefield > 19 ) 
      {
	j = inputstack [k ].indexfield ;
	k = -1 ;
      } 
      else {
	  
	j = - (integer) ( inputstack [k ].namefield + 1 ) ;
	k = -1 ;
      } 
    } 
  } 
  else if ( curinput .namefield > 19 ) 
  j = curinput .indexfield ;
  else j = - (integer) ( curinput .namefield + 1 ) ;
  if ( ( j >= 0 ) || ( j == -1 ) || ( j == -18 ) ) 
  {
    k = true ;
    if ( j >= 0 ) 
    k = setinfileenc ( inputfile [j ], stringcast ( nameoffile + 1 ) ) ;
    else k = setstdinenc ( stringcast ( nameoffile + 1 ) ) ;
    if ( k == false ) 
    {
      begindiagnostic () ;
      printnl ( 1532 ) ;
      slowprint ( curarea ) ;
      slowprint ( curname ) ;
      slowprint ( curext ) ;
      print ( 39 ) ;
      enddiagnostic ( false ) ;
    } 
  } 
  else {
      
    begindiagnostic () ;
    j = - (integer) j - 1 ;
    println () ;
    printnl ( 1533 ) ;
    printnl ( 1534 ) ;
    if ( j >= 18 ) 
    print ( 1535 ) ;
    else {
	
      print ( 1536 ) ;
      printint ( j ) ;
      print ( 46 ) ;
    } 
    enddiagnostic ( false ) ;
  } 
} 
void 
comparestrings ( void ) 
{
  /* 30 */ comparestrings_regmem 
  strnumber s1, s2  ;
  poolpointer i1, i2, j1, j2  ;
  integer c1, c2  ;
  halfword savecurcs  ;
  savecurcs = curcs ;
  {
    if ( scantoks ( false , true ) != 0 ) 
    ;
  } 
  isprintutf8 = true ;
  s1 = tokenstostring ( defref ) ;
  isprintutf8 = false ;
  deletetokenref ( defref ) ;
  curcs = savecurcs ;
  {
    if ( scantoks ( false , true ) != 0 ) 
    ;
  } 
  isprintutf8 = true ;
  s2 = tokenstostring ( defref ) ;
  isprintutf8 = false ;
  deletetokenref ( defref ) ;
  i1 = strstart [s1 ];
  j1 = strstart [s1 + 1 ];
  i2 = strstart [s2 ];
  j2 = strstart [s2 + 1 ];
  while ( ( i1 < j1 ) && ( i2 < j2 ) ) {
      
    if ( strpool [i1 ]>= 256 ) 
    c1 = strpool [i1 ]- 256 ;
    else c1 = strpool [i1 ];
    if ( strpool [i2 ]>= 256 ) 
    c2 = strpool [i2 ]- 256 ;
    else c2 = strpool [i2 ];
    if ( c1 < c2 ) 
    {
      curval = -1 ;
      goto lab30 ;
    } 
    else if ( c1 > c2 ) 
    {
      curval = 1 ;
      goto lab30 ;
    } 
    incr ( i1 ) ;
    incr ( i2 ) ;
  } 
  if ( ( i1 == j1 ) && ( i2 == j2 ) ) 
  curval = 0 ;
  else if ( i1 < j1 ) 
  curval = 1 ;
  else curval = -1 ;
  lab30: flushstr ( s2 ) ;
  flushstr ( s1 ) ;
  curvallevel = 0 ;
} 
void 
scanpdfexttoks ( void ) 
{
  scanpdfexttoks_regmem 
  {
    if ( scantoks ( false , true ) != 0 ) 
    ;
  } 
} 
void 
doextension ( void ) 
{
  doextension_regmem 
  integer k  ;
  halfword p  ;
  switch ( curchr ) 
  {case 0 : 
    {
      newwritewhatsit ( 3 ) ;
      scanoptionalequals () ;
      scanfilename () ;
      mem [curlist .tailfield + 1 ].hh .v.RH = curname ;
      mem [curlist .tailfield + 2 ].hh .v.LH = curarea ;
      mem [curlist .tailfield + 2 ].hh .v.RH = curext ;
    } 
    break ;
  case 1 : 
    {
      k = curcs ;
      newwritewhatsit ( 2 ) ;
      curcs = k ;
      p = scantoks ( false , false ) ;
      mem [curlist .tailfield + 1 ].hh .v.RH = defref ;
    } 
    break ;
  case 2 : 
    {
      newwritewhatsit ( 2 ) ;
      mem [curlist .tailfield + 1 ].hh .v.RH = -1073741823L ;
    } 
    break ;
  case 3 : 
    {
      if ( scankeyword ( 1237 ) ) 
      {
	newwhatsit ( 4 , 2 ) ;
	mem [curlist .tailfield + 1 ].hh .v.LH = -1073741823L ;
	p = scantoks ( false , false ) ;
	mem [curlist .tailfield + 1 ].hh .v.RH = defref ;
      } 
      else {
	  
	newwhatsit ( 3 , 2 ) ;
	mem [curlist .tailfield + 1 ].hh .v.LH = -1073741823L ;
	p = scantoks ( false , true ) ;
	mem [curlist .tailfield + 1 ].hh .v.RH = defref ;
      } 
      curlist .inhibitglueflagfield = false ;
    } 
    break ;
  case 5 : 
    {
      getxtoken () ;
      if ( ( curcmd == 65 ) && ( curchr <= 2 ) ) 
      {
	k = curlist .inhibitglueflagfield ;
	p = curlist .tailfield ;
	doextension () ;
	outwhat ( curlist .tailfield ) ;
	flushnodelist ( curlist .tailfield ) ;
	curlist .tailfield = p ;
	mem [p ].hh .v.RH = -1073741823L ;
	curlist .inhibitglueflagfield = k ;
      } 
      else backinput () ;
    } 
    break ;
  case 6 : 
    if ( abs ( curlist .modefield ) != 120 ) 
    reportillegalcase () ;
    else {
	
      curlist .inhibitglueflagfield = false ;
      newwhatsit ( 5 , 2 ) ;
      scanint () ;
      if ( curval <= 0 ) 
      curlist .auxfield .hh .v.RH = 0 ;
      else if ( curval > 255 ) 
      curlist .auxfield .hh .v.RH = 0 ;
      else curlist .auxfield .hh .v.RH = curval ;
      mem [curlist .tailfield + 1 ].hh .v.RH = curlist .auxfield .hh .v.RH ;
      mem [curlist .tailfield + 1 ].hh.b0 = normmin ( eqtb [114413L ].cint 
      ) ;
      mem [curlist .tailfield + 1 ].hh.b1 = normmin ( eqtb [114414L ].cint 
      ) ;
    } 
    break ;
  case 8 : 
    {
      newwhatsit ( 8 , 2 ) ;
      curlist .inhibitglueflagfield = false ;
    } 
    break ;
  case 9 : 
    {
      scanint () ;
      if ( curval < 0 ) 
      curval = - (integer) curval ;
      randomseed = curval ;
      initrandoms ( randomseed ) ;
    } 
    break ;
  case 10 : 
    {
      secondsandmicros ( epochseconds , microseconds ) ;
    } 
    break ;
  case 7 : 
    eptexsetinputencoding () ;
    break ;
    default: 
    confusion ( 1512 ) ;
    break ;
  } 
} 
void 
fixlanguage ( void ) 
{
  fixlanguage_regmem 
  ASCIIcode l  ;
  if ( eqtb [114412L ].cint <= 0 ) 
  l = 0 ;
  else if ( eqtb [114412L ].cint > 255 ) 
  l = 0 ;
  else l = eqtb [114412L ].cint ;
  if ( l != curlist .auxfield .hh .v.RH ) 
  {
    curlist .inhibitglueflagfield = false ;
    newwhatsit ( 5 , 2 ) ;
    mem [curlist .tailfield + 1 ].hh .v.RH = l ;
    curlist .auxfield .hh .v.RH = l ;
    mem [curlist .tailfield + 1 ].hh.b0 = normmin ( eqtb [114413L ].cint ) 
    ;
    mem [curlist .tailfield + 1 ].hh.b1 = normmin ( eqtb [114414L ].cint ) 
    ;
  } 
} 
void 
zsetmathkchar ( integer c ) 
{
  setmathkchar_regmem 
  halfword p  ;
  p = newnoad () ;
  mem [p + 1 ].hh .v.RH = 6 ;
  mem [p + 1 ].hh.b1 = 0 ;
  mem [p + 4 ].hh .v.LH = c ;
  mem [p + 1 ].hh.b0 = eqtb [114406L ].cint ;
  if ( fontdir [eqtb [50986L + mem [p + 1 ].hh.b0 + cursize ].hh .v.RH ]
  == 0 ) 
  {
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1330 ) ;
    } 
    {
      helpptr = 1 ;
      helpline [0 ]= 1329 ;
    } 
    error () ;
  } 
  mem [p ].hh.b0 = 18 ;
  mem [curlist .tailfield ].hh .v.RH = p ;
  curlist .tailfield = p ;
} 
void 
zchangepagedirection ( halfword d ) 
{
  /* 30 */ changepagedirection_regmem 
  halfword p  ;
  boolean flag  ;
  flag = ( pagecontents == 0 ) ;
  if ( flag && ( curlist .headfield != curlist .tailfield ) ) 
  {
    p = mem [curlist .headfield ].hh .v.RH ;
    while ( p != -1073741823L ) switch ( mem [p ].hh.b0 ) 
    {case 0 : 
    case 1 : 
    case 2 : 
    case 3 : 
    case 4 : 
      {
	flag = false ;
	goto lab30 ;
      } 
      break ;
      default: 
      p = mem [p ].hh .v.RH ;
      break ;
    } 
    lab30: ;
  } 
  if ( flag ) 
  {
    curlist .dirfield = d ;
    pagedir = d ;
  } 
  else {
      
    {
      if ( interaction == 3 ) 
      ;
      if ( filelineerrorstylep ) 
      printfileline () ;
      else printnl ( 265 ) ;
      print ( 1245 ) ;
    } 
    printcmdchr ( curcmd , d ) ;
    print ( 1712 ) ;
    {
      helpptr = 3 ;
      helpline [2 ]= 1713 ;
      helpline [1 ]= 1714 ;
      helpline [0 ]= 1715 ;
    } 
    error () ;
  } 
} 
void 
insertsrcspecial ( void ) 
{
  insertsrcspecial_regmem 
  halfword toklist, p, q  ;
  if ( ( sourcefilenamestack [inopen ]> 0 && isnewsource ( 
  sourcefilenamestack [inopen ], line ) ) ) 
  {
    toklist = getavail () ;
    p = toklist ;
    mem [p ].hh .v.LH = 536909731L ;
    mem [p ].hh .v.RH = getavail () ;
    p = mem [p ].hh .v.RH ;
    mem [p ].hh .v.LH = 65659L ;
    q = strtoks ( makesrcspecial ( sourcefilenamestack [inopen ], line ) ) ;
    mem [p ].hh .v.RH = mem [memtop - 3 ].hh .v.RH ;
    p = q ;
    mem [p ].hh .v.RH = getavail () ;
    p = mem [p ].hh .v.RH ;
    mem [p ].hh .v.LH = 131197L ;
    begintokenlist ( toklist , 4 ) ;
    remembersourceinfo ( sourcefilenamestack [inopen ], line ) ;
  } 
} 
void 
appendsrcspecial ( void ) 
{
  appendsrcspecial_regmem 
  halfword q  ;
  if ( ( sourcefilenamestack [inopen ]> 0 && isnewsource ( 
  sourcefilenamestack [inopen ], line ) ) ) 
  {
    newwhatsit ( 3 , 2 ) ;
    mem [curlist .tailfield + 1 ].hh .v.LH = 0 ;
    defref = getavail () ;
    mem [defref ].hh .v.LH = -1073741823L ;
    q = strtoks ( makesrcspecial ( sourcefilenamestack [inopen ], line ) ) ;
    mem [defref ].hh .v.RH = mem [memtop - 3 ].hh .v.RH ;
    mem [curlist .tailfield + 1 ].hh .v.RH = defref ;
    remembersourceinfo ( sourcefilenamestack [inopen ], line ) ;
  } 
} 
void 
handlerightbrace ( void ) 
{
  handlerightbrace_regmem 
  halfword p, q  ;
  halfword r  ;
  scaled d  ;
  integer f  ;
  switch ( curgroup ) 
  {case 1 : 
    unsave () ;
    break ;
  case 0 : 
    {
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 1216 ) ;
      } 
      {
	helpptr = 2 ;
	helpline [1 ]= 1217 ;
	helpline [0 ]= 1218 ;
      } 
      error () ;
    } 
    break ;
  case 14 : 
  case 15 : 
  case 16 : 
    extrarightbrace () ;
    break ;
  case 2 : 
    {
      adjusthlist ( curlist .headfield , false ) ;
      package ( 0 ) ;
    } 
    break ;
  case 3 : 
    {
      adjusthlist ( curlist .headfield , false ) ;
      adjusttail = memtop - 5 ;
      preadjusttail = memtop - 14 ;
      package ( 0 ) ;
    } 
    break ;
  case 4 : 
    if ( ( eqtb [114427L ].cint > 0 ) && ( curlist .modefield == 120 ) ) 
    {
      backinput () ;
      curtok = partoken ;
      backinput () ;
      curinput .indexfield = 4 ;
    } 
    else {
	
      endgraf () ;
      package ( 0 ) ;
    } 
    break ;
  case 5 : 
    if ( ( eqtb [114427L ].cint > 0 ) && ( curlist .modefield == 120 ) ) 
    {
      backinput () ;
      curtok = partoken ;
      backinput () ;
      curinput .indexfield = 4 ;
    } 
    else {
	
      endgraf () ;
      package ( 4 ) ;
    } 
    break ;
  case 11 : 
    if ( ( eqtb [114427L ].cint > 1 ) && ( curlist .modefield == 120 ) ) 
    {
      backinput () ;
      curtok = partoken ;
      backinput () ;
      curinput .indexfield = 4 ;
    } 
    else {
	
      endgraf () ;
      q = eqtb [49935L ].hh .v.RH ;
      incr ( mem [q ].hh .v.RH ) ;
      d = eqtb [114963L ].cint ;
      f = eqtb [114403L ].cint ;
      unsave () ;
      saveptr = saveptr - 2 ;
      p = vpackage ( mem [curlist .headfield ].hh .v.RH , 0 , 1 , 
      1073741823L ) ;
      mem [p ].hh.b1 = ( ( mem [p ].hh.b1 ) / 16 ) * 16 + curlist 
      .dirfield + 5 ;
      popnest () ;
      if ( savestack [saveptr + 0 ].cint < 255 ) 
      {
	r = getnode ( 6 ) ;
	mem [r ].hh.b0 = 4 ;
	mem [r ].hh.b1 = savestack [saveptr + 0 ].cint ;
	mem [r + 3 ].cint = mem [p + 3 ].cint + mem [p + 2 ].cint ;
	mem [r + 4 ].hh .v.LH = mem [p + 5 ].hh .v.RH ;
	mem [r + 4 ].hh .v.RH = q ;
	mem [r + 2 ].cint = d ;
	mem [r + 1 ].cint = f ;
	mem [r + 5 ].hh.b1 = ( ( mem [p ].hh.b1 ) % 16 - 5 ) + 5 ;
	if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist 
	.tailfield ].hh.b0 == 5 ) ) 
	{
	  mem [curlist .pnodefield ].hh .v.RH = r ;
	  mem [mem [curlist .pnodefield ].hh .v.RH ].hh .v.RH = curlist 
	  .tailfield ;
	  curlist .pnodefield = mem [curlist .pnodefield ].hh .v.RH ;
	} 
	else {
	    
	  mem [curlist .tailfield ].hh .v.RH = r ;
	  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	} 
      } 
      else {
	  
	if ( abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) ) != abs ( curlist 
	.adjdirfield ) ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1278 ) ;
	  } 
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 1279 ;
	  } 
	  error () ;
	  flushnodelist ( mem [p + 5 ].hh .v.RH ) ;
	} 
	else {
	    
	  r = getnode ( 2 ) ;
	  mem [r ].hh.b0 = 7 ;
	  mem [r ].hh.b1 = savestack [saveptr + 1 ].cint ;
	  mem [r + 1 ].cint = mem [p + 5 ].hh .v.RH ;
	  deleteglueref ( q ) ;
	  if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist 
	  .tailfield ].hh.b0 == 5 ) ) 
	  {
	    mem [curlist .pnodefield ].hh .v.RH = r ;
	    mem [mem [curlist .pnodefield ].hh .v.RH ].hh .v.RH = curlist 
	    .tailfield ;
	    curlist .pnodefield = mem [curlist .pnodefield ].hh .v.RH ;
	  } 
	  else {
	      
	    mem [curlist .tailfield ].hh .v.RH = r ;
	    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	  } 
	} 
      } 
      deleteglueref ( mem [p + 7 ].hh .v.RH ) ;
      deleteglueref ( mem [p + 7 ].hh .v.LH ) ;
      freenode ( p , 10 ) ;
      if ( nestptr == 0 ) 
      buildpage () ;
    } 
    break ;
  case 8 : 
    if ( ( eqtb [114427L ].cint > 1 ) && ( curlist .modefield == 120 ) ) 
    {
      backinput () ;
      curtok = partoken ;
      backinput () ;
      curinput .indexfield = 4 ;
    } 
    else {
	
      while ( ( curinput .statefield == 0 ) && ( curinput .locfield == 
      -1073741823L ) && ( curinput .indexfield == 3 ) ) endtokenlist () ;
      if ( ( curinput .statefield != 0 ) || ( curinput .locfield != 
      -1073741823L ) || ( curinput .indexfield != 6 ) ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 685 ) ;
	} 
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1183 ;
	  helpline [0 ]= 1184 ;
	} 
	error () ;
	do {
	    gettoken () ;
	} while ( ! ( curinput .locfield == -1073741823L ) ) ;
      } 
      outputcanend = true ;
      endtokenlist () ;
      outputcanend = false ;
      endgraf () ;
      unsave () ;
      outputactive = false ;
      insertpenalties = 0 ;
      if ( eqtb [50984L ].hh .v.RH != -1073741823L ) 
      {
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 1185 ) ;
	} 
	printesc ( 437 ) ;
	printint ( 255 ) ;
	{
	  helpptr = 3 ;
	  helpline [2 ]= 1186 ;
	  helpline [1 ]= 1187 ;
	  helpline [0 ]= 1188 ;
	} 
	boxerror ( 255 ) ;
      } 
      if ( curlist .tailfield != curlist .headfield ) 
      {
	mem [pagetail ].hh .v.RH = mem [curlist .headfield ].hh .v.RH ;
	pagetail = curlist .tailfield ;
      } 
      if ( mem [memtop - 2 ].hh .v.RH != -1073741823L ) 
      {
	if ( mem [memtop - 1 ].hh .v.RH == -1073741823L ) 
	nest [0 ].tailfield = pagetail ;
	mem [pagetail ].hh .v.RH = mem [memtop - 1 ].hh .v.RH ;
	mem [memtop - 1 ].hh .v.RH = mem [memtop - 2 ].hh .v.RH ;
	mem [memtop - 2 ].hh .v.RH = -1073741823L ;
	pagetail = memtop - 2 ;
      } 
      flushnodelist ( discptr [2 ]) ;
      discptr [2 ]= -1073741823L ;
      popnest () ;
      buildpage () ;
    } 
    break ;
  case 10 : 
    builddiscretionary () ;
    break ;
  case 6 : 
    {
      backinput () ;
      curtok = 536909722L ;
      {
	if ( interaction == 3 ) 
	;
	if ( filelineerrorstylep ) 
	printfileline () ;
	else printnl ( 265 ) ;
	print ( 720 ) ;
      } 
      printesc ( 1068 ) ;
      print ( 721 ) ;
      {
	helpptr = 1 ;
	helpline [0 ]= 1324 ;
      } 
      inserror () ;
    } 
    break ;
  case 7 : 
    if ( ( eqtb [114427L ].cint > 1 ) && ( curlist .modefield == 120 ) ) 
    {
      backinput () ;
      curtok = partoken ;
      backinput () ;
      curinput .indexfield = 4 ;
    } 
    else {
	
      endgraf () ;
      unsave () ;
      alignpeek () ;
    } 
    break ;
  case 12 : 
    if ( ( eqtb [114427L ].cint > 0 ) && ( curlist .modefield == 120 ) ) 
    {
      backinput () ;
      curtok = partoken ;
      backinput () ;
      curinput .indexfield = 4 ;
    } 
    else {
	
      endgraf () ;
      unsave () ;
      saveptr = saveptr - 2 ;
      p = vpackage ( mem [curlist .headfield ].hh .v.RH , savestack [
      saveptr + 1 ].cint , savestack [saveptr + 0 ].cint , 1073741823L ) ;
      mem [p ].hh.b1 = ( ( mem [p ].hh.b1 ) / 16 ) * 16 + curlist 
      .dirfield + 5 ;
      popnest () ;
      if ( abs ( ( ( mem [p ].hh.b1 ) % 16 - 5 ) ) != abs ( curlist 
      .dirfield ) ) 
      p = newdirnode ( p , abs ( curlist .dirfield ) ) ;
      {
	mem [curlist .tailfield ].hh .v.RH = newnoad () ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      mem [curlist .tailfield ].hh.b0 = 31 ;
      mem [curlist .tailfield + 1 ].hh .v.RH = 2 ;
      mem [curlist .tailfield + 1 ].hh .v.LH = p ;
    } 
    break ;
  case 13 : 
    buildchoices () ;
    break ;
  case 9 : 
    {
      unsave () ;
      decr ( saveptr ) ;
      mem [savestack [saveptr + 0 ].cint ].hh .v.RH = 4 ;
      p = finmlist ( -1073741823L ) ;
      mem [savestack [saveptr + 0 ].cint ].hh .v.LH = p ;
      if ( p != -1073741823L ) {
	  
	if ( mem [p ].hh .v.RH == -1073741823L ) {
	    
	  if ( mem [p ].hh.b0 == 18 ) 
	  {
	    if ( mem [p + 3 ].hh .v.RH == 0 ) {
		
	      if ( ( ( mem [p + 2 ].hh .v.RH == 0 ) && ( mem [p + 4 ].hh 
	      .v.LH == -1073741823L ) ) ) 
	      {
		mem [savestack [saveptr + 0 ].cint ].hh = mem [p + 1 ]
		.hh ;
		freenode ( p , 5 ) ;
	      } 
	    } 
	  } 
	  else if ( mem [p ].hh.b0 == 30 ) {
	      
	    if ( savestack [saveptr + 0 ].cint == curlist .tailfield + 1 ) {
		
	      if ( mem [curlist .tailfield ].hh.b0 == 18 ) 
	      {
		q = curlist .headfield ;
		while ( mem [q ].hh .v.RH != curlist .tailfield ) q = mem [
		q ].hh .v.RH ;
		mem [q ].hh .v.RH = p ;
		freenode ( curlist .tailfield , 5 ) ;
		curlist .tailfield = p ;
	      } 
	    } 
	  } 
	} 
      } 
    } 
    break ;
    default: 
    confusion ( 1219 ) ;
    break ;
  } 
} 
void 
maincontrol ( void ) 
{
  /* 60 21 70 80 130 131 133 141 150 90 91 92 95 100 101 110 111 112 120 10 
  */ maincontrol_regmem 
  integer t  ;
  KANJIcode cx  ;
  sixteenbits cy  ;
  halfword kp  ;
  halfword gp, gq  ;
  scaled disp  ;
  boolean inskp  ;
  if ( eqtb [50465L ].hh .v.RH != -1073741823L ) 
  begintokenlist ( eqtb [50465L ].hh .v.RH , 12 ) ;
  lab60: getxtoken () ;
  lab21: if ( interrupt != 0 ) {
      
    if ( OKtointerrupt ) 
    {
      backinput () ;
      {
	if ( interrupt != 0 ) 
	pauseforinstructions () ;
      } 
      goto lab60 ;
    } 
  } 
	;
#ifdef TEXMF_DEBUG
  if ( panicking ) 
  checkmem ( false ) ;
#endif /* TEXMF_DEBUG */
  if ( eqtb [114397L ].cint > 0 ) 
  showcurcmdchr () ;
  inskp = false ;
  switch ( abs ( curlist .modefield ) + curcmd ) 
  {case 131 : 
  case 132 : 
    goto lab70 ;
    break ;
  case 136 : 
  case 137 : 
  case 138 : 
  case 139 : 
  case 140 : 
    goto lab130 ;
    break ;
  case 194 : 
    if ( checkecharrange ( curchr ) ) 
    goto lab70 ;
    else {
	
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
      if ( ( curcmd <= 15 ) ) 
      curcmd = 18 ;
      goto lab130 ;
    } 
    break ;
  case 195 : 
    {
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
      goto lab130 ;
    } 
    break ;
  case 141 : 
    {
      scancharnum () ;
      curchr = curval ;
      if ( checkecharrange ( curchr ) ) 
      goto lab70 ;
      else {
	  
	curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
	if ( ( curcmd <= 15 ) ) 
	curcmd = 18 ;
	goto lab130 ;
      } 
    } 
    break ;
  case 142 : 
    {
      scancharnum () ;
      curchr = curval ;
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
      goto lab130 ;
    } 
    break ;
  case 191 : 
    {
      getxtoken () ;
      if ( ( curcmd == 11 ) || ( curcmd == 12 ) || ( ( curcmd >= 16 ) && ( 
      curcmd <= 20 ) ) || ( curcmd == 74 ) || ( curcmd == 21 ) || ( curcmd == 
      75 ) || ( curcmd == 22 ) ) 
      cancelboundary = true ;
      goto lab21 ;
    } 
    break ;
  case 130 : 
    if ( curlist .auxfield .hh .v.LH == 1000 ) 
    goto lab120 ;
    else appspace () ;
    break ;
  case 190 : 
  case 309 : 
    goto lab120 ;
    break ;
  case 1 : 
  case 120 : 
  case 239 : 
  case 11 : 
  case 249 : 
  case 310 : 
    ;
    break ;
  case 46 : 
  case 165 : 
  case 284 : 
    {
      if ( curchr == 0 ) 
      {
	do {
	    getxtoken () ;
	} while ( ! ( curcmd != 10 ) ) ;
	goto lab21 ;
      } 
      else {
	  
	t = scannerstatus ;
	scannerstatus = 0 ;
	getnext () ;
	scannerstatus = t ;
	if ( curcs < 23810 ) 
	curcs = primlookup ( curcs - 11905 ) ;
	else curcs = primlookup ( hash [curcs ].v.RH ) ;
	if ( curcs != 0 ) 
	{
	  curcmd = eqtb [38822L + curcs ].hh.b0 ;
	  curchr = eqtb [38822L + curcs ].hh .v.RH ;
	  curtok = 536909733L + curcs ;
	  goto lab21 ;
	} 
      } 
    } 
    break ;
  case 15 : 
    if ( itsallover () ) 
    return ;
    break ;
  case 29 : 
  case 147 : 
  case 266 : 
  case 79 : 
  case 198 : 
  case 317 : 
  case 45 : 
  case 51 : 
  case 55 : 
  case 174 : 
  case 7 : 
  case 126 : 
  case 245 : 
    reportillegalcase () ;
    break ;
  case 8 : 
  case 127 : 
  case 9 : 
  case 128 : 
  case 24 : 
  case 143 : 
  case 77 : 
  case 196 : 
  case 78 : 
  case 197 : 
  case 57 : 
  case 176 : 
  case 16 : 
  case 135 : 
  case 56 : 
  case 175 : 
  case 59 : 
  case 178 : 
  case 73 : 
  case 192 : 
  case 60 : 
  case 179 : 
  case 61 : 
  case 180 : 
  case 63 : 
  case 182 : 
  case 62 : 
  case 181 : 
  case 37 : 
  case 156 : 
  case 58 : 
  case 177 : 
  case 35 : 
  case 154 : 
  case 53 : 
  case 172 : 
  case 248 : 
  case 253 : 
  case 272 : 
  case 269 : 
  case 278 : 
  case 281 : 
    insertdollarsign () ;
    break ;
  case 252 : 
    if ( eqtb [114442L ].cint == 0 ) 
    insertdollarsign () ;
    break ;
  case 43 : 
  case 161 : 
  case 280 : 
    {
      {
	mem [curlist .tailfield ].hh .v.RH = scanrulespec () ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      curlist .inhibitglueflagfield = false ;
      if ( abs ( curlist .modefield ) == 1 ) 
      curlist .auxfield .cint = -65536000L ;
      else if ( abs ( curlist .modefield ) == 120 ) 
      curlist .auxfield .hh .v.LH = 1000 ;
    } 
    break ;
  case 34 : 
  case 152 : 
  case 271 : 
  case 273 : 
    appendglue () ;
    break ;
  case 36 : 
  case 155 : 
  case 274 : 
  case 275 : 
    appendkern () ;
    break ;
  case 2 : 
  case 121 : 
    newsavelevel ( 1 ) ;
    break ;
  case 68 : 
  case 187 : 
  case 306 : 
    newsavelevel ( 14 ) ;
    break ;
  case 69 : 
  case 188 : 
  case 307 : 
    if ( curgroup == 14 ) 
    unsave () ;
    else offsave () ;
    break ;
  case 3 : 
  case 122 : 
  case 241 : 
    handlerightbrace () ;
    break ;
  case 28 : 
  case 148 : 
  case 267 : 
    {
      t = curchr ;
      scandimen ( false , false , false ) ;
      if ( t == 0 ) 
      scanbox ( curval ) ;
      else scanbox ( - (integer) curval ) ;
    } 
    break ;
  case 38 : 
  case 157 : 
  case 276 : 
    scanbox ( 1073872797L + curchr ) ;
    break ;
  case 27 : 
  case 146 : 
  case 265 : 
    beginbox ( 0 ) ;
    break ;
  case 81 : 
  case 200 : 
  case 319 : 
    {
      if ( curgroup != 6 ) {
	  
	if ( curlist .modefield == 120 ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1241 ) ;
	  } 
	  printcmdchr ( curcmd , curchr ) ;
	  print ( 39 ) ;
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 1242 ;
	    helpline [0 ]= 1243 ;
	  } 
	  error () ;
	} 
	else if ( abs ( curlist .modefield ) == 239 ) 
	{
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1241 ) ;
	  } 
	  printcmdchr ( curcmd , curchr ) ;
	  print ( 39 ) ;
	  {
	    helpptr = 1 ;
	    helpline [0 ]= 1244 ;
	  } 
	  error () ;
	} 
	else if ( nestptr == 0 ) 
	changepagedirection ( curchr ) ;
	else if ( curlist .headfield == curlist .tailfield ) 
	curlist .dirfield = curchr ;
	else {
	    
	  {
	    if ( interaction == 3 ) 
	    ;
	    if ( filelineerrorstylep ) 
	    printfileline () ;
	    else printnl ( 265 ) ;
	    print ( 1245 ) ;
	  } 
	  printcmdchr ( curcmd , curchr ) ;
	  print ( 1246 ) ;
	  {
	    helpptr = 2 ;
	    helpline [1 ]= 1247 ;
	    helpline [0 ]= 1248 ;
	  } 
	  error () ;
	} 
      } 
      else {
	  
	{
	  if ( interaction == 3 ) 
	  ;
	  if ( filelineerrorstylep ) 
	  printfileline () ;
	  else printnl ( 265 ) ;
	  print ( 789 ) ;
	} 
	printcmdchr ( curcmd , curchr ) ;
	print ( 1249 ) ;
	{
	  helpptr = 2 ;
	  helpline [1 ]= 1250 ;
	  helpline [0 ]= 1251 ;
	} 
	error () ;
      } 
    } 
    break ;
  case 50 : 
    newgraf ( curchr > 0 ) ;
    break ;
  case 12 : 
  case 13 : 
  case 22 : 
  case 75 : 
  case 23 : 
  case 76 : 
  case 4 : 
  case 30 : 
  case 42 : 
  case 52 : 
  case 54 : 
  case 33 : 
  case 40 : 
  case 17 : 
  case 18 : 
  case 19 : 
  case 20 : 
  case 21 : 
  case 71 : 
  case 72 : 
    {
      backinput () ;
      newgraf ( true ) ;
    } 
    break ;
  case 169 : 
  case 288 : 
    indentinhmode () ;
    break ;
  case 14 : 
    {
      normalparagraph () ;
      if ( curlist .modefield > 0 ) 
      buildpage () ;
    } 
    break ;
  case 133 : 
    {
      if ( alignstate < 0 ) 
      offsave () ;
      endgraf () ;
      if ( curlist .modefield == 1 ) 
      buildpage () ;
    } 
    break ;
  case 134 : 
  case 153 : 
  case 162 : 
  case 150 : 
  case 158 : 
    headforvmode () ;
    break ;
  case 44 : 
  case 163 : 
  case 282 : 
  case 164 : 
  case 283 : 
    begininsertoradjust () ;
    break ;
  case 25 : 
  case 144 : 
  case 263 : 
    makemark () ;
    break ;
  case 49 : 
  case 168 : 
  case 287 : 
    appendpenalty () ;
    break ;
  case 32 : 
  case 151 : 
  case 270 : 
    deletelast () ;
    break ;
  case 31 : 
  case 149 : 
  case 268 : 
    unpackage () ;
    break ;
  case 170 : 
    appenditaliccorrection () ;
    break ;
  case 289 : 
    {
      mem [curlist .tailfield ].hh .v.RH = newkern ( 0 ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    break ;
  case 173 : 
  case 292 : 
    appenddiscretionary () ;
    break ;
  case 171 : 
    makeaccent () ;
    break ;
  case 6 : 
  case 125 : 
  case 244 : 
  case 5 : 
  case 124 : 
  case 243 : 
    alignerror () ;
    break ;
  case 41 : 
  case 160 : 
  case 279 : 
    noalignerror () ;
    break ;
  case 70 : 
  case 189 : 
  case 308 : 
    omiterror () ;
    break ;
  case 39 : 
    initalign () ;
    break ;
  case 159 : 
    if ( curchr > 0 ) 
    {
      if ( eTeXenabled ( ( eqtb [114444L ].cint > 0 ) , curcmd , curchr ) ) 
      {
	mem [curlist .tailfield ].hh .v.RH = newmath ( 0 , curchr ) ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
    } 
    else initalign () ;
    break ;
  case 277 : 
    if ( privileged () ) {
	
      if ( curgroup == 15 ) 
      initalign () ;
      else offsave () ;
    } 
    break ;
  case 10 : 
  case 129 : 
    if ( ( eqtb [114427L ].cint > 1 ) && ( curlist .modefield == 120 ) ) 
    {
      backinput () ;
      curtok = partoken ;
      backinput () ;
      curinput .indexfield = 4 ;
    } 
    else doendv () ;
    break ;
  case 74 : 
  case 193 : 
  case 312 : 
    cserror () ;
    break ;
  case 123 : 
    initmath () ;
    break ;
  case 293 : 
    if ( privileged () ) {
	
      if ( curgroup == 15 ) 
      starteqno () ;
      else offsave () ;
    } 
    break ;
  case 240 : 
    {
      {
	mem [curlist .tailfield ].hh .v.RH = newnoad () ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      backinput () ;
      scanmath ( curlist .tailfield + 1 , curlist .tailfield + 4 ) ;
    } 
    break ;
  case 250 : 
  case 251 : 
  case 313 : 
    if ( checkecharrange ( curchr ) ) 
    setmathchar ( eqtb [113849L + curchr ].hh .v.RH ) ;
    else setmathkchar ( curchr ) ;
    break ;
  case 255 : 
  case 256 : 
  case 257 : 
  case 258 : 
  case 259 : 
    {
      cx = curchr ;
      setmathkchar ( cx ) ;
    } 
    break ;
  case 260 : 
    {
      scancharnum () ;
      curchr = curval ;
      if ( checkecharrange ( curchr ) ) 
      setmathchar ( eqtb [113849L + curchr ].hh .v.RH ) ;
      else setmathkchar ( curchr ) ;
    } 
    break ;
  case 314 : 
    setmathkchar ( curchr ) ;
    break ;
  case 261 : 
    {
      scancharnum () ;
      curchr = curval ;
      setmathkchar ( curchr ) ;
    } 
    break ;
  case 262 : 
    {
      if ( curchr == 0 ) 
      scanfifteenbitint () ;
      else scanbigfifteenbitint () ;
      setmathchar ( curval ) ;
    } 
    break ;
  case 315 : 
    {
      setmathchar ( ( ( curchr / 4096 ) * 65536L ) + ( curchr % 4096 ) ) ;
    } 
    break ;
  case 316 : 
    {
      setmathchar ( ( ( curchr / 65536L ) * 256 ) + ( curchr % 256 ) ) ;
    } 
    break ;
  case 254 : 
    {
      if ( curchr == 0 ) 
      scantwentysevenbitint () ;
      else scanfiftyonebitint () ;
      setmathchar ( curval ) ;
    } 
    break ;
  case 295 : 
    {
      {
	mem [curlist .tailfield ].hh .v.RH = newnoad () ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      mem [curlist .tailfield ].hh.b0 = curchr ;
      scanmath ( curlist .tailfield + 1 , curlist .tailfield + 4 ) ;
    } 
    break ;
  case 296 : 
    mathlimitswitch () ;
    break ;
  case 311 : 
    mathradical () ;
    break ;
  case 290 : 
  case 291 : 
    mathac () ;
    break ;
  case 301 : 
    {
      scanspec ( 12 , false ) ;
      normalparagraph () ;
      pushnest () ;
      curlist .modefield = -1 ;
      curlist .auxfield .cint = -65536000L ;
      if ( ( insertsrcspecialeveryvbox ) ) 
      insertsrcspecial () ;
      if ( eqtb [50464L ].hh .v.RH != -1073741823L ) 
      begintokenlist ( eqtb [50464L ].hh .v.RH , 11 ) ;
    } 
    break ;
  case 298 : 
    {
      mem [curlist .tailfield ].hh .v.RH = newstyle ( curchr ) ;
      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
    } 
    break ;
  case 300 : 
    {
      {
	mem [curlist .tailfield ].hh .v.RH = newglue ( membot ) ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      mem [curlist .tailfield ].hh.b1 = 98 ;
    } 
    break ;
  case 299 : 
    appendchoices () ;
    break ;
  case 247 : 
  case 246 : 
    subsup () ;
    break ;
  case 297 : 
    mathfraction () ;
    break ;
  case 294 : 
    mathleftright () ;
    break ;
  case 242 : 
    if ( curgroup == 15 ) 
    aftermath () ;
    else offsave () ;
    break ;
  case 90 : 
  case 209 : 
  case 328 : 
  case 91 : 
  case 210 : 
  case 329 : 
  case 117 : 
  case 236 : 
  case 355 : 
  case 118 : 
  case 237 : 
  case 356 : 
  case 92 : 
  case 211 : 
  case 330 : 
  case 82 : 
  case 201 : 
  case 320 : 
  case 83 : 
  case 202 : 
  case 321 : 
  case 84 : 
  case 203 : 
  case 322 : 
  case 103 : 
  case 222 : 
  case 341 : 
  case 104 : 
  case 223 : 
  case 342 : 
  case 85 : 
  case 204 : 
  case 323 : 
  case 86 : 
  case 205 : 
  case 324 : 
  case 87 : 
  case 206 : 
  case 325 : 
  case 88 : 
  case 207 : 
  case 326 : 
  case 89 : 
  case 208 : 
  case 327 : 
  case 93 : 
  case 212 : 
  case 331 : 
  case 94 : 
  case 213 : 
  case 332 : 
  case 95 : 
  case 214 : 
  case 333 : 
  case 96 : 
  case 215 : 
  case 334 : 
  case 97 : 
  case 216 : 
  case 335 : 
  case 98 : 
  case 217 : 
  case 336 : 
  case 99 : 
  case 218 : 
  case 337 : 
  case 100 : 
  case 219 : 
  case 338 : 
  case 101 : 
  case 220 : 
  case 339 : 
  case 102 : 
  case 221 : 
  case 340 : 
  case 105 : 
  case 224 : 
  case 343 : 
  case 106 : 
  case 225 : 
  case 344 : 
  case 107 : 
  case 226 : 
  case 345 : 
  case 108 : 
  case 227 : 
  case 346 : 
  case 109 : 
  case 228 : 
  case 347 : 
  case 110 : 
  case 229 : 
  case 348 : 
  case 111 : 
  case 230 : 
  case 349 : 
  case 112 : 
  case 231 : 
  case 350 : 
  case 113 : 
  case 232 : 
  case 351 : 
  case 114 : 
  case 233 : 
  case 352 : 
  case 115 : 
  case 234 : 
  case 353 : 
  case 116 : 
  case 235 : 
  case 354 : 
    prefixedcommand () ;
    break ;
  case 47 : 
  case 166 : 
  case 285 : 
    {
      gettoken () ;
      aftertoken = curtok ;
    } 
    break ;
  case 48 : 
  case 167 : 
  case 286 : 
    {
      gettoken () ;
      saveforafter ( curtok ) ;
    } 
    break ;
  case 119 : 
  case 238 : 
  case 357 : 
    {
      gettoken () ;
      if ( curcs > 0 ) 
      {
	parloc = curcs ;
	partoken = curtok ;
      } 
    } 
    break ;
  case 67 : 
  case 186 : 
  case 305 : 
    openorclosein () ;
    break ;
  case 65 : 
  case 184 : 
  case 303 : 
    issuemessage () ;
    break ;
  case 64 : 
  case 183 : 
  case 302 : 
    shiftcase () ;
    break ;
  case 26 : 
  case 145 : 
  case 264 : 
    showwhatever () ;
    break ;
  case 80 : 
  case 199 : 
  case 318 : 
    curlist .inhibitglueflagfield = ( curchr == 0 ) ;
    break ;
  case 66 : 
  case 185 : 
  case 304 : 
    doextension () ;
    break ;
  } 
  goto lab60 ;
  lab130: if ( ( curlist .tailfield >= himemmin ) ) 
  {
    if ( ! ( ( curlist .lastjchrfield != -1073741823L ) && ( mem [curlist 
    .lastjchrfield ].hh .v.RH == curlist .tailfield ) ) ) 
    {
      cx = mem [curlist .tailfield ].hh.b1 ;
      {
	kp = getkinsokupos ( cx , 1 ) ;
	if ( kp != 10000 ) {
	    
	  if ( eqtb [115238L + kp ].cint != 0 ) 
	  {
	    if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
	    {
	      {
		mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		115238L + kp ].cint ) ;
		curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	      } 
	      mem [curlist .tailfield ].hh.b1 = 2 ;
	    } 
	  } 
	} 
      } 
    } 
  } 
  else if ( mem [curlist .tailfield ].hh.b0 == 8 ) 
  {
    cx = mem [curlist .tailfield + 1 ].hh.b1 ;
    {
      kp = getkinsokupos ( cx , 1 ) ;
      if ( kp != 10000 ) {
	  
	if ( eqtb [115238L + kp ].cint != 0 ) 
	{
	  if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
	  {
	    {
	      mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
	      115238L + kp ].cint ) ;
	      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	    } 
	    mem [curlist .tailfield ].hh.b1 = 2 ;
	  } 
	} 
      } 
    } 
  } 
  if ( curlist .dirfield == 3 ) 
  {
    if ( fontdir [mainf ]== 3 ) 
    disp = 0 ;
    else if ( fontdir [mainf ]== 4 ) 
    disp = eqtb [114978L ].cint - eqtb [114979L ].cint ;
    else disp = eqtb [114978L ].cint ;
    mainf = eqtb [51755L ].hh .v.RH ;
  } 
  else {
      
    if ( fontdir [mainf ]== 4 ) 
    disp = 0 ;
    else if ( fontdir [mainf ]== 3 ) 
    disp = eqtb [114979L ].cint - eqtb [114978L ].cint ;
    else disp = eqtb [114979L ].cint ;
    mainf = eqtb [51754L ].hh .v.RH ;
  } 
  if ( disp != 0 ) 
  {
    if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
    .hh.b0 == 5 ) ) 
    {
      mem [curlist .tailfield + 1 ].cint = 0 ;
    } 
    else {
	
      curlist .pnodefield = curlist .tailfield ;
      {
	mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      mem [curlist .tailfield ].hh.b0 = 5 ;
      mem [curlist .tailfield + 1 ].cint = 0 ;
      curlist .pdispfield = disp ;
      curlist .dispcalledfield = true ;
    } 
  } 
  inskp = false ;
  ligaturepresent = false ;
  curl = getjfmpos ( curchr , mainf ) ;
  maini = fontinfo [charbase [mainf ]+ 0 ].qqqq ;
  goto lab133 ;
  lab131: curlist .auxfield .hh .v.LH = 1000 ;
  if ( mainf != 0 ) 
  {
    if ( ( curcmd == 20 ) ) 
    {
      cx = mem [mainp ].hh .v.LH % 16777216L ;
      if ( ( UVScombinecode ( cx , curchr ) > 0 ) ) 
      {
	cx = UVScombinecode ( cx , curchr ) ;
	if ( ( eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH == 16 ) && ( cx 
	>= 16777216L ) ) 
	mem [mainp ].hh .v.LH = cx + 23 * 16777216L ;
	else mem [mainp ].hh .v.LH = cx + eqtb [63663L + kcatcodekey ( cx ) 
	].hh .v.RH * 16777216L ;
	inskp = false ;
	goto lab150 ;
      } 
      else if ( ( ( mem [mainp ].hh .v.LH / 16777216L ) == 0 && ( curq > 0 ) 
      ) ) 
      {
	cx = mem [curq ].hh .v.LH % 16777216L ;
	kp = getkinsokupos ( cx , 1 ) ;
	if ( ( UVScombinecode ( cx , curchr ) > 0 && ( kp != 10000 ) && ( eqtb 
	[115238L + kp ].cint != 0 ) && ( eqtb [77103L + kp ].hh.b0 == 1 ) 
	) ) 
	{
	  cx = UVScombinecode ( cx , curchr ) ;
	  if ( ( eqtb [63663L + kcatcodekey ( cx ) ].hh .v.RH == 16 ) && ( 
	  cx >= 16777216L ) ) 
	  mem [curq ].hh .v.LH = cx + 23 * 16777216L ;
	  else mem [curq ].hh .v.LH = cx + eqtb [63663L + kcatcodekey ( cx 
	  ) ].hh .v.RH * 16777216L ;
	  inskp = false ;
	  goto lab150 ;
	} 
      } 
    } 
    if ( ! curlist .dispcalledfield ) 
    {
      curlist .pnodefield = curlist .tailfield ;
      {
	mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      mem [curlist .tailfield ].hh.b0 = 5 ;
      mem [curlist .tailfield + 1 ].cint = 0 ;
      curlist .dispcalledfield = true ;
    } 
    {
      mainp = avail ;
      if ( mainp == -1073741823L ) 
      mainp = getavail () ;
      else {
	  
	avail = mem [mainp ].hh .v.RH ;
	mem [mainp ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
	incr ( dynused ) ;
#endif /* STAT */
      } 
    } 
    mem [mainp ].hh.b0 = mainf ;
    mem [mainp ].hh.b1 = curl ;
    mem [curlist .tailfield ].hh .v.RH = mainp ;
    curlist .tailfield = mainp ;
    curlist .lastjchrfield = curlist .tailfield ;
    {
      mainp = avail ;
      if ( mainp == -1073741823L ) 
      mainp = getavail () ;
      else {
	  
	avail = mem [mainp ].hh .v.RH ;
	mem [mainp ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
	incr ( dynused ) ;
#endif /* STAT */
      } 
    } 
    if ( ( curcmd == 16 ) && ( curchr >= 16777216L ) ) 
    mem [mainp ].hh .v.LH = curchr + 23 * 16777216L ;
    else if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
    mem [mainp ].hh .v.LH = curchr + curcmd * 16777216L ;
    else if ( curcmd == 15 ) 
    mem [mainp ].hh .v.LH = curchr + 18 * 16777216L ;
    else if ( curcmd == 14 ) 
    mem [mainp ].hh .v.LH = curchr + eqtb [51759L + curchr ].hh .v.RH * 
    16777216L ;
    else mem [mainp ].hh .v.LH = curchr + eqtb [63663L + kcatcodekey ( 
    curchr ) ].hh .v.RH * 16777216L ;
    mem [curlist .tailfield ].hh .v.RH = mainp ;
    curlist .tailfield = mainp ;
    cx = curchr ;
    {
      kp = getkinsokupos ( cx , 1 ) ;
      if ( kp != 10000 ) {
	  
	if ( eqtb [115238L + kp ].cint != 0 ) 
	{
	  if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
	  {
	    if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) ) 
	    mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [115238L + 
	    kp ].cint ;
	    else {
		
	      mainp = mem [curq ].hh .v.RH ;
	      mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp ]
	      .cint ) ;
	      mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
	      mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
	    } 
	  } 
	  else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
	  {
	    {
	      mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
	      115238L + kp ].cint ) ;
	      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	    } 
	    mem [curlist .tailfield ].hh.b1 = 2 ;
	  } 
	} 
      } 
    } 
  } 
  inskp = false ;
  lab150: getnext () ;
  maini = fontinfo [charbase [mainf ]+ curl ].qqqq ;
  switch ( curcmd ) 
  {case 16 : 
  case 17 : 
  case 18 : 
  case 19 : 
  case 20 : 
    {
      curl = getjfmpos ( curchr , mainf ) ;
      goto lab133 ;
    } 
    break ;
  case 11 : 
  case 12 : 
    {
      inskp = true ;
      curl = 0 ;
      goto lab133 ;
    } 
    break ;
  } 
  xtoken () ;
  switch ( curcmd ) 
  {case 16 : 
  case 17 : 
  case 18 : 
  case 19 : 
  case 20 : 
    curl = getjfmpos ( curchr , mainf ) ;
    break ;
  case 11 : 
  case 12 : 
    {
      inskp = true ;
      curl = 0 ;
    } 
    break ;
  case 74 : 
    {
      if ( checkecharrange ( curchr ) ) 
      {
	inskp = true ;
	curl = 0 ;
      } 
      else curl = getjfmpos ( curchr , mainf ) ;
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
    } 
    break ;
  case 21 : 
    {
      scancharnum () ;
      curchr = curval ;
      if ( checkecharrange ( curchr ) ) 
      {
	inskp = true ;
	curl = 0 ;
      } 
      else curl = getjfmpos ( curchr , mainf ) ;
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
    } 
    break ;
  case 75 : 
    {
      curl = getjfmpos ( curchr , mainf ) ;
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
    } 
    break ;
  case 22 : 
    {
      scancharnum () ;
      curchr = curval ;
      curl = getjfmpos ( curchr , mainf ) ;
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
    } 
    break ;
  case 79 : 
    {
      curlist .inhibitglueflagfield = ( curchr == 0 ) ;
      goto lab150 ;
    } 
    break ;
    default: 
    {
      inskp = 1073741823L ;
      curl = -1 ;
      curr = 11904 ;
      ligstack = -1073741823L ;
    } 
    break ;
  } 
  lab133: if ( inskp == true ) 
  {
    kp = getkinsokupos ( curchr , 1 ) ;
    if ( kp != 10000 ) {
	
      if ( eqtb [115238L + kp ].cint != 0 ) 
      {
	if ( eqtb [77103L + kp ].hh.b0 == 1 ) {
	    
	  if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist 
	  .tailfield ].hh.b0 == 14 ) ) 
	  mem [curlist .tailfield + 1 ].cint = mem [curlist .tailfield + 1 
	  ].cint + eqtb [115238L + kp ].cint ;
	  else {
	      
	    {
	      mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
	      115238L + kp ].cint ) ;
	      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	    } 
	    mem [curlist .tailfield ].hh.b1 = 2 ;
	  } 
	} 
      } 
    } 
  } 
  if ( mainf != 0 ) 
  {
    curq = curlist .tailfield ;
    if ( curlist .inhibitglueflagfield != true ) 
    {
      if ( curl < 0 ) 
      curl = 0 ;
      else curlist .inhibitglueflagfield = false ;
      if ( ( curlist .tailfield == mem [curlist .headfield ].hh .v.RH ) && ( 
      ! ( curlist .tailfield >= himemmin ) ) && ( mem [curlist .tailfield ]
      .hh.b0 == 5 ) ) 
      goto lab141 ;
      else {
	  
	if ( ( ( maini .b2 ) % 4 ) == 1 ) 
	{
	  maink = ligkernbase [mainf ]+ maini .b3 ;
	  mainj = fontinfo [maink ].qqqq ;
	  if ( mainj .b0 > 128 ) 
	  {
	    maink = ligkernbase [mainf ]+ 256 * mainj .b2 + mainj .b3 + 
	    32768L - 256 * ( 128 ) ;
	    mainj = fontinfo [maink ].qqqq ;
	  } 
	  while ( true ) {
	      
	    if ( mainj .b1 == curl ) {
		
	      if ( mainj .b0 <= 128 ) 
	      {
		if ( mainj .b2 < 128 ) 
		{
		  gp = fontglue [mainf ];
		  curr = mainj .b2 * 256 + mainj .b3 ;
		  if ( gp != -1073741823L ) 
		  {
		    while ( ( ( mem [gp ].hh.b0 != curr ) && ( mem [gp ]
		    .hh .v.RH != -1073741823L ) ) ) gp = mem [gp ].hh .v.RH 
		    ;
		    gq = mem [gp + 1 ].hh .v.LH ;
		  } 
		  else {
		      
		    gp = getnode ( 2 ) ;
		    fontglue [mainf ]= gp ;
		    gq = -1073741823L ;
		  } 
		  if ( gq == -1073741823L ) 
		  {
		    mem [gp ].hh.b0 = curr ;
		    gq = newspec ( membot ) ;
		    mem [gp + 1 ].hh .v.LH = gq ;
		    maink = extenbase [mainf ]+ ( curr ) * 3 ;
		    mem [gq + 1 ].cint = fontinfo [maink ].cint ;
		    mem [gq + 2 ].cint = fontinfo [maink + 1 ].cint ;
		    mem [gq + 3 ].cint = fontinfo [maink + 2 ].cint ;
		    incr ( mem [gq ].hh .v.RH ) ;
		    mem [gp ].hh .v.RH = getnode ( 2 ) ;
		    gp = mem [gp ].hh .v.RH ;
		    mem [gp + 1 ].hh .v.LH = -1073741823L ;
		    mem [gp ].hh .v.RH = -1073741823L ;
		  } 
		  {
		    mem [curlist .tailfield ].hh .v.RH = newglue ( gq ) ;
		    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH 
		    ;
		  } 
		  mem [curlist .tailfield ].hh.b1 = 21 ;
		  goto lab141 ;
		} 
		else {
		    
		  {
		    mem [curlist .tailfield ].hh .v.RH = newkern ( fontinfo 
		    [kernbase [mainf ]+ 256 * mainj .b2 + mainj .b3 ].cint 
		    ) ;
		    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH 
		    ;
		  } 
		  goto lab141 ;
		} 
	      } 
	    } 
	    if ( mainj .b0 >= 128 ) 
	    goto lab141 ;
	    maink = maink + mainj .b0 + 1 ;
	    mainj = fontinfo [maink ].qqqq ;
	  } 
	} 
      } 
    } 
    else {
	
      if ( curl < 0 ) 
      curl = 0 ;
      else curlist .inhibitglueflagfield = false ;
    } 
    lab141: ;
  } 
  else curlist .inhibitglueflagfield = false ;
  if ( inskp == false ) 
  {
    goto lab131 ;
  } 
  else if ( inskp == true ) 
  {
    inskp = false ;
    goto lab70 ;
  } 
  else {
      
    goto lab21 ;
  } 
  lab70: curlist .inhibitglueflagfield = false ;
  if ( ( ( curlist .headfield == curlist .tailfield ) && ( curlist .modefield 
  > 0 ) ) ) 
  {
    if ( ( insertsrcspecialauto ) ) 
    appendsrcspecial () ;
  } 
  mains = eqtb [101945L + curchr ].hh .v.RH ;
  if ( mains == 1000 ) 
  curlist .auxfield .hh .v.LH = 1000 ;
  else if ( mains < 1000 ) 
  {
    if ( mains > 0 ) 
    curlist .auxfield .hh .v.LH = mains ;
  } 
  else if ( curlist .auxfield .hh .v.LH < 1000 ) 
  curlist .auxfield .hh .v.LH = 1000 ;
  else curlist .auxfield .hh .v.LH = mains ;
  if ( curlist .dirfield == 3 ) 
  disp = eqtb [114978L ].cint ;
  else disp = eqtb [114979L ].cint ;
  {
    if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
    .hh.b0 == 5 ) ) 
    {
      if ( curlist .pdispfield == disp ) 
      {
	freenode ( curlist .tailfield , 2 ) ;
	curlist .tailfield = curlist .pnodefield ;
	mem [curlist .tailfield ].hh .v.RH = -1073741823L ;
      } 
      else mem [curlist .tailfield + 1 ].cint = disp ;
    } 
    else if ( disp != 0 || ! curlist .dispcalledfield ) 
    {
      curlist .pnodefield = curlist .tailfield ;
      {
	mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
      mem [curlist .tailfield ].hh.b0 = 5 ;
      mem [curlist .tailfield + 1 ].cint = disp ;
      curlist .pdispfield = disp ;
      curlist .dispcalledfield = true ;
    } 
  } 
  mainf = eqtb [50985L ].hh .v.RH ;
  bchar = fontbchar [mainf ];
  falsebchar = fontfalsebchar [mainf ];
  if ( curlist .modefield > 0 ) {
      
    if ( eqtb [114412L ].cint != curlist .auxfield .hh .v.RH ) 
    fixlanguage () ;
  } 
  {
    ligstack = avail ;
    if ( ligstack == -1073741823L ) 
    ligstack = getavail () ;
    else {
	
      avail = mem [ligstack ].hh .v.RH ;
      mem [ligstack ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
      incr ( dynused ) ;
#endif /* STAT */
    } 
  } 
  mem [ligstack ].hh.b0 = mainf ;
  curl = curchr ;
  mem [ligstack ].hh.b1 = curl ;
  curq = curlist .tailfield ;
  if ( cancelboundary ) 
  {
    cancelboundary = false ;
    maink = 0 ;
  } 
  else maink = bcharlabel [mainf ];
  if ( maink == 0 ) 
  goto lab92 ;
  curr = curl ;
  curl = 11904 ;
  goto lab111 ;
  lab80: if ( curl < 11904 ) 
  {
    if ( mem [curq ].hh .v.RH > -1073741823L ) {
	
      if ( mem [curlist .tailfield ].hh.b1 == hyphenchar [mainf ]) 
      insdisc = true ;
    } 
    if ( ligaturepresent ) 
    {
      mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
      if ( lfthit ) 
      {
	mem [mainp ].hh.b1 = 2 ;
	lfthit = false ;
      } 
      if ( rthit ) {
	  
	if ( ligstack == -1073741823L ) 
	{
	  incr ( mem [mainp ].hh.b1 ) ;
	  rthit = false ;
	} 
      } 
      mem [curq ].hh .v.RH = mainp ;
      curlist .tailfield = mainp ;
      ligaturepresent = false ;
    } 
    if ( insdisc ) 
    {
      insdisc = false ;
      if ( curlist .modefield > 0 ) 
      {
	mem [curlist .tailfield ].hh .v.RH = newdisc () ;
	curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
      } 
    } 
  } 
  lab90: if ( ligstack == -1073741823L ) 
  {
    if ( disp != 0 ) 
    {
      if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield 
      ].hh.b0 == 5 ) ) 
      {
	mem [curlist .tailfield + 1 ].cint = 0 ;
      } 
      else {
	  
	curlist .pnodefield = curlist .tailfield ;
	{
	  mem [curlist .tailfield ].hh .v.RH = getnode ( 2 ) ;
	  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	} 
	mem [curlist .tailfield ].hh.b0 = 5 ;
	mem [curlist .tailfield + 1 ].cint = 0 ;
	curlist .pdispfield = disp ;
	curlist .dispcalledfield = true ;
      } 
    } 
    goto lab21 ;
  } 
  curq = curlist .tailfield ;
  curl = mem [ligstack ].hh.b1 ;
  lab91: if ( ! ( ligstack >= himemmin ) ) 
  goto lab95 ;
  lab92: curchr = ptencucsto8bitcode ( fontenc [mainf ], curchr ) ;
  if ( ( effectivechar ( false , mainf , curchr ) > fontec [mainf ]) || ( 
  effectivechar ( false , mainf , curchr ) < fontbc [mainf ]) ) 
  {
    charwarning ( mainf , curchr ) ;
    {
      mem [ligstack ].hh .v.RH = avail ;
      avail = ligstack ;
	;
#ifdef STAT
      decr ( dynused ) ;
#endif /* STAT */
    } 
    goto lab60 ;
  } 
  if ( ! ligaturepresent ) 
  curl = ptencucsto8bitcode ( fontenc [mainf ], curl ) ;
  maini = effectivecharinfo ( mainf , curl ) ;
  if ( ! ( maini .b0 > 0 ) ) 
  {
    charwarning ( mainf , curchr ) ;
    {
      mem [ligstack ].hh .v.RH = avail ;
      avail = ligstack ;
	;
#ifdef STAT
      decr ( dynused ) ;
#endif /* STAT */
    } 
    goto lab60 ;
  } 
  mem [curlist .tailfield ].hh .v.RH = ligstack ;
  curlist .tailfield = ligstack ;
  lab100: getnext () ;
  if ( curcmd == 11 ) 
  goto lab101 ;
  if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
  {
    bchar = 11904 ;
    curr = bchar ;
    ligstack = -1073741823L ;
    if ( ligaturepresent ) 
    {
      mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
      if ( lfthit ) 
      {
	mem [mainp ].hh.b1 = 2 ;
	lfthit = false ;
      } 
      if ( rthit ) {
	  
	if ( ligstack == -1073741823L ) 
	{
	  incr ( mem [mainp ].hh.b1 ) ;
	  rthit = false ;
	} 
      } 
      mem [curq ].hh .v.RH = mainp ;
      curlist .tailfield = mainp ;
      ligaturepresent = false ;
    } 
    if ( inskp == true ) 
    {
      cx = curl ;
      {
	kp = getkinsokupos ( cx , 1 ) ;
	if ( kp != 10000 ) {
	    
	  if ( eqtb [115238L + kp ].cint != 0 ) 
	  {
	    if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
	    {
	      if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) ) 
	      mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [115238L 
	      + kp ].cint ;
	      else {
		  
		mainp = mem [curq ].hh .v.RH ;
		mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp ]
		.cint ) ;
		mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
		mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
	      } 
	    } 
	    else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
	    {
	      {
		mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		115238L + kp ].cint ) ;
		curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	      } 
	      mem [curlist .tailfield ].hh.b1 = 2 ;
	    } 
	  } 
	} 
      } 
    } 
    inskp = false ;
    goto lab130 ;
  } 
  if ( curcmd == 12 ) 
  goto lab101 ;
  if ( curcmd == 74 ) 
  {
    if ( checkecharrange ( curchr ) ) 
    goto lab101 ;
    else {
	
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
      {
	bchar = 11904 ;
	curr = bchar ;
	ligstack = -1073741823L ;
	if ( ligaturepresent ) 
	{
	  mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
	  if ( lfthit ) 
	  {
	    mem [mainp ].hh.b1 = 2 ;
	    lfthit = false ;
	  } 
	  if ( rthit ) {
	      
	    if ( ligstack == -1073741823L ) 
	    {
	      incr ( mem [mainp ].hh.b1 ) ;
	      rthit = false ;
	    } 
	  } 
	  mem [curq ].hh .v.RH = mainp ;
	  curlist .tailfield = mainp ;
	  ligaturepresent = false ;
	} 
	if ( inskp == true ) 
	{
	  cx = curl ;
	  {
	    kp = getkinsokupos ( cx , 1 ) ;
	    if ( kp != 10000 ) {
		
	      if ( eqtb [115238L + kp ].cint != 0 ) 
	      {
		if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
		{
		  if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) 
		  ) 
		  mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [
		  115238L + kp ].cint ;
		  else {
		      
		    mainp = mem [curq ].hh .v.RH ;
		    mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp 
		    ].cint ) ;
		    mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
		    mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
		  } 
		} 
		else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
		{
		  {
		    mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		    115238L + kp ].cint ) ;
		    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH 
		    ;
		  } 
		  mem [curlist .tailfield ].hh.b1 = 2 ;
		} 
	      } 
	    } 
	  } 
	} 
	inskp = false ;
	goto lab130 ;
      } 
    } 
  } 
  if ( curcmd == 75 ) 
  {
    curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
    {
      bchar = 11904 ;
      curr = bchar ;
      ligstack = -1073741823L ;
      if ( ligaturepresent ) 
      {
	mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
	if ( lfthit ) 
	{
	  mem [mainp ].hh.b1 = 2 ;
	  lfthit = false ;
	} 
	if ( rthit ) {
	    
	  if ( ligstack == -1073741823L ) 
	  {
	    incr ( mem [mainp ].hh.b1 ) ;
	    rthit = false ;
	  } 
	} 
	mem [curq ].hh .v.RH = mainp ;
	curlist .tailfield = mainp ;
	ligaturepresent = false ;
      } 
      if ( inskp == true ) 
      {
	cx = curl ;
	{
	  kp = getkinsokupos ( cx , 1 ) ;
	  if ( kp != 10000 ) {
	      
	    if ( eqtb [115238L + kp ].cint != 0 ) 
	    {
	      if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
	      {
		if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) ) 
		mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [
		115238L + kp ].cint ;
		else {
		    
		  mainp = mem [curq ].hh .v.RH ;
		  mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp ]
		  .cint ) ;
		  mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
		  mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
		} 
	      } 
	      else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
	      {
		{
		  mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		  115238L + kp ].cint ) ;
		  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
		} 
		mem [curlist .tailfield ].hh.b1 = 2 ;
	      } 
	    } 
	  } 
	} 
      } 
      inskp = false ;
      goto lab130 ;
    } 
  } 
  xtoken () ;
  if ( curcmd == 11 ) 
  goto lab101 ;
  if ( ( curcmd >= 16 ) && ( curcmd <= 20 ) ) 
  {
    bchar = 11904 ;
    curr = bchar ;
    ligstack = -1073741823L ;
    if ( ligaturepresent ) 
    {
      mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
      if ( lfthit ) 
      {
	mem [mainp ].hh.b1 = 2 ;
	lfthit = false ;
      } 
      if ( rthit ) {
	  
	if ( ligstack == -1073741823L ) 
	{
	  incr ( mem [mainp ].hh.b1 ) ;
	  rthit = false ;
	} 
      } 
      mem [curq ].hh .v.RH = mainp ;
      curlist .tailfield = mainp ;
      ligaturepresent = false ;
    } 
    if ( inskp == true ) 
    {
      cx = curl ;
      {
	kp = getkinsokupos ( cx , 1 ) ;
	if ( kp != 10000 ) {
	    
	  if ( eqtb [115238L + kp ].cint != 0 ) 
	  {
	    if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
	    {
	      if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) ) 
	      mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [115238L 
	      + kp ].cint ;
	      else {
		  
		mainp = mem [curq ].hh .v.RH ;
		mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp ]
		.cint ) ;
		mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
		mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
	      } 
	    } 
	    else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
	    {
	      {
		mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		115238L + kp ].cint ) ;
		curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	      } 
	      mem [curlist .tailfield ].hh.b1 = 2 ;
	    } 
	  } 
	} 
      } 
    } 
    inskp = false ;
    goto lab130 ;
  } 
  if ( curcmd == 12 ) 
  goto lab101 ;
  if ( curcmd == 74 ) 
  {
    if ( checkecharrange ( curchr ) ) 
    goto lab101 ;
    else {
	
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
      {
	bchar = 11904 ;
	curr = bchar ;
	ligstack = -1073741823L ;
	if ( ligaturepresent ) 
	{
	  mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
	  if ( lfthit ) 
	  {
	    mem [mainp ].hh.b1 = 2 ;
	    lfthit = false ;
	  } 
	  if ( rthit ) {
	      
	    if ( ligstack == -1073741823L ) 
	    {
	      incr ( mem [mainp ].hh.b1 ) ;
	      rthit = false ;
	    } 
	  } 
	  mem [curq ].hh .v.RH = mainp ;
	  curlist .tailfield = mainp ;
	  ligaturepresent = false ;
	} 
	if ( inskp == true ) 
	{
	  cx = curl ;
	  {
	    kp = getkinsokupos ( cx , 1 ) ;
	    if ( kp != 10000 ) {
		
	      if ( eqtb [115238L + kp ].cint != 0 ) 
	      {
		if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
		{
		  if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) 
		  ) 
		  mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [
		  115238L + kp ].cint ;
		  else {
		      
		    mainp = mem [curq ].hh .v.RH ;
		    mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp 
		    ].cint ) ;
		    mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
		    mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
		  } 
		} 
		else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
		{
		  {
		    mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		    115238L + kp ].cint ) ;
		    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH 
		    ;
		  } 
		  mem [curlist .tailfield ].hh.b1 = 2 ;
		} 
	      } 
	    } 
	  } 
	} 
	inskp = false ;
	goto lab130 ;
      } 
    } 
  } 
  if ( curcmd == 75 ) 
  {
    curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
    {
      bchar = 11904 ;
      curr = bchar ;
      ligstack = -1073741823L ;
      if ( ligaturepresent ) 
      {
	mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
	if ( lfthit ) 
	{
	  mem [mainp ].hh.b1 = 2 ;
	  lfthit = false ;
	} 
	if ( rthit ) {
	    
	  if ( ligstack == -1073741823L ) 
	  {
	    incr ( mem [mainp ].hh.b1 ) ;
	    rthit = false ;
	  } 
	} 
	mem [curq ].hh .v.RH = mainp ;
	curlist .tailfield = mainp ;
	ligaturepresent = false ;
      } 
      if ( inskp == true ) 
      {
	cx = curl ;
	{
	  kp = getkinsokupos ( cx , 1 ) ;
	  if ( kp != 10000 ) {
	      
	    if ( eqtb [115238L + kp ].cint != 0 ) 
	    {
	      if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
	      {
		if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) ) 
		mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [
		115238L + kp ].cint ;
		else {
		    
		  mainp = mem [curq ].hh .v.RH ;
		  mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp ]
		  .cint ) ;
		  mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
		  mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
		} 
	      } 
	      else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
	      {
		{
		  mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		  115238L + kp ].cint ) ;
		  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
		} 
		mem [curlist .tailfield ].hh.b1 = 2 ;
	      } 
	    } 
	  } 
	} 
      } 
      inskp = false ;
      goto lab130 ;
    } 
  } 
  if ( curcmd == 21 ) 
  {
    scancharnum () ;
    curchr = curval ;
    if ( checkecharrange ( curchr ) ) 
    goto lab101 ;
    else {
	
      curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
      {
	bchar = 11904 ;
	curr = bchar ;
	ligstack = -1073741823L ;
	if ( ligaturepresent ) 
	{
	  mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
	  if ( lfthit ) 
	  {
	    mem [mainp ].hh.b1 = 2 ;
	    lfthit = false ;
	  } 
	  if ( rthit ) {
	      
	    if ( ligstack == -1073741823L ) 
	    {
	      incr ( mem [mainp ].hh.b1 ) ;
	      rthit = false ;
	    } 
	  } 
	  mem [curq ].hh .v.RH = mainp ;
	  curlist .tailfield = mainp ;
	  ligaturepresent = false ;
	} 
	if ( inskp == true ) 
	{
	  cx = curl ;
	  {
	    kp = getkinsokupos ( cx , 1 ) ;
	    if ( kp != 10000 ) {
		
	      if ( eqtb [115238L + kp ].cint != 0 ) 
	      {
		if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
		{
		  if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) 
		  ) 
		  mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [
		  115238L + kp ].cint ;
		  else {
		      
		    mainp = mem [curq ].hh .v.RH ;
		    mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp 
		    ].cint ) ;
		    mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
		    mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
		  } 
		} 
		else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
		{
		  {
		    mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		    115238L + kp ].cint ) ;
		    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH 
		    ;
		  } 
		  mem [curlist .tailfield ].hh.b1 = 2 ;
		} 
	      } 
	    } 
	  } 
	} 
	inskp = false ;
	goto lab130 ;
      } 
    } 
  } 
  if ( curcmd == 22 ) 
  {
    scancharnum () ;
    curchr = curval ;
    curcmd = eqtb [63663L + kcatcodekey ( curchr ) ].hh .v.RH ;
    {
      bchar = 11904 ;
      curr = bchar ;
      ligstack = -1073741823L ;
      if ( ligaturepresent ) 
      {
	mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
	if ( lfthit ) 
	{
	  mem [mainp ].hh.b1 = 2 ;
	  lfthit = false ;
	} 
	if ( rthit ) {
	    
	  if ( ligstack == -1073741823L ) 
	  {
	    incr ( mem [mainp ].hh.b1 ) ;
	    rthit = false ;
	  } 
	} 
	mem [curq ].hh .v.RH = mainp ;
	curlist .tailfield = mainp ;
	ligaturepresent = false ;
      } 
      if ( inskp == true ) 
      {
	cx = curl ;
	{
	  kp = getkinsokupos ( cx , 1 ) ;
	  if ( kp != 10000 ) {
	      
	    if ( eqtb [115238L + kp ].cint != 0 ) 
	    {
	      if ( eqtb [77103L + kp ].hh.b0 == 1 ) 
	      {
		if ( ! ( curq >= himemmin ) && ( mem [curq ].hh.b0 == 14 ) ) 
		mem [curq + 1 ].cint = mem [curq + 1 ].cint + eqtb [
		115238L + kp ].cint ;
		else {
		    
		  mainp = mem [curq ].hh .v.RH ;
		  mem [curq ].hh .v.RH = newpenalty ( eqtb [115238L + kp ]
		  .cint ) ;
		  mem [mem [curq ].hh .v.RH ].hh.b1 = 2 ;
		  mem [mem [curq ].hh .v.RH ].hh .v.RH = mainp ;
		} 
	      } 
	      else if ( eqtb [77103L + kp ].hh.b0 == 2 ) 
	      {
		{
		  mem [curlist .tailfield ].hh .v.RH = newpenalty ( eqtb [
		  115238L + kp ].cint ) ;
		  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
		} 
		mem [curlist .tailfield ].hh.b1 = 2 ;
	      } 
	    } 
	  } 
	} 
      } 
      inskp = false ;
      goto lab130 ;
    } 
  } 
  if ( curcmd == 79 ) 
  {
    curlist .inhibitglueflagfield = true ;
    goto lab100 ;
  } 
  if ( curcmd == 71 ) 
  bchar = 11904 ;
  curr = bchar ;
  ligstack = -1073741823L ;
  goto lab110 ;
  lab101: mains = eqtb [101945L + curchr ].hh .v.RH ;
  if ( mains == 1000 ) 
  curlist .auxfield .hh .v.LH = 1000 ;
  else if ( mains < 1000 ) 
  {
    if ( mains > 0 ) 
    curlist .auxfield .hh .v.LH = mains ;
  } 
  else if ( curlist .auxfield .hh .v.LH < 1000 ) 
  curlist .auxfield .hh .v.LH = 1000 ;
  else curlist .auxfield .hh .v.LH = mains ;
  curlist .inhibitglueflagfield = false ;
  {
    ligstack = avail ;
    if ( ligstack == -1073741823L ) 
    ligstack = getavail () ;
    else {
	
      avail = mem [ligstack ].hh .v.RH ;
      mem [ligstack ].hh .v.RH = -1073741823L ;
	;
#ifdef STAT
      incr ( dynused ) ;
#endif /* STAT */
    } 
  } 
  mem [ligstack ].hh.b0 = mainf ;
  curr = curchr ;
  mem [ligstack ].hh.b1 = curr ;
  if ( curr == falsebchar ) 
  curr = 11904 ;
  lab110: if ( ( ( maini .b2 ) % 4 ) != 1 ) 
  goto lab80 ;
  if ( curr == 11904 ) 
  goto lab80 ;
  maink = ligkernbase [mainf ]+ maini .b3 ;
  mainj = fontinfo [maink ].qqqq ;
  if ( mainj .b0 <= 128 ) 
  goto lab112 ;
  maink = ligkernbase [mainf ]+ 256 * mainj .b2 + mainj .b3 + 32768L - 256 * 
  ( 128 ) ;
  lab111: mainj = fontinfo [maink ].qqqq ;
  lab112: cy = ptencucsto8bitcode ( fontenc [mainf ], curr ) ;
  if ( mainj .b1 == cy ) {
      
    if ( mainj .b0 <= 128 ) 
    {
      if ( mainj .b2 >= 128 ) 
      {
	if ( curl < 11904 ) 
	{
	  if ( mem [curq ].hh .v.RH > -1073741823L ) {
	      
	    if ( mem [curlist .tailfield ].hh.b1 == hyphenchar [mainf ]) 
	    insdisc = true ;
	  } 
	  if ( ligaturepresent ) 
	  {
	    mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
	    if ( lfthit ) 
	    {
	      mem [mainp ].hh.b1 = 2 ;
	      lfthit = false ;
	    } 
	    if ( rthit ) {
		
	      if ( ligstack == -1073741823L ) 
	      {
		incr ( mem [mainp ].hh.b1 ) ;
		rthit = false ;
	      } 
	    } 
	    mem [curq ].hh .v.RH = mainp ;
	    curlist .tailfield = mainp ;
	    ligaturepresent = false ;
	  } 
	  if ( insdisc ) 
	  {
	    insdisc = false ;
	    if ( curlist .modefield > 0 ) 
	    {
	      mem [curlist .tailfield ].hh .v.RH = newdisc () ;
	      curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	    } 
	  } 
	} 
	{
	  mem [curlist .tailfield ].hh .v.RH = newkern ( fontinfo [kernbase 
	  [mainf ]+ 256 * mainj .b2 + mainj .b3 ].cint ) ;
	  curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	} 
	goto lab90 ;
      } 
      if ( curl == 11904 ) 
      lfthit = true ;
      else if ( ligstack == -1073741823L ) 
      rthit = true ;
      {
	if ( interrupt != 0 ) 
	pauseforinstructions () ;
      } 
      switch ( mainj .b2 ) 
      {case 1 : 
      case 5 : 
	{
	  curl = mainj .b3 ;
	  maini = fontinfo [charbase [mainf ]+ effectivechar ( true , mainf 
	  , curl ) ].qqqq ;
	  ligaturepresent = true ;
	} 
	break ;
      case 2 : 
      case 6 : 
	{
	  curr = mainj .b3 ;
	  if ( ligstack == -1073741823L ) 
	  {
	    ligstack = newligitem ( curr ) ;
	    bchar = 11904 ;
	  } 
	  else if ( ( ligstack >= himemmin ) ) 
	  {
	    mainp = ligstack ;
	    ligstack = newligitem ( curr ) ;
	    mem [ligstack + 1 ].hh .v.RH = mainp ;
	  } 
	  else mem [ligstack ].hh.b1 = curr ;
	} 
	break ;
      case 3 : 
	{
	  curr = mainj .b3 ;
	  mainp = ligstack ;
	  ligstack = newligitem ( curr ) ;
	  mem [ligstack ].hh .v.RH = mainp ;
	} 
	break ;
      case 7 : 
      case 11 : 
	{
	  if ( curl < 11904 ) 
	  {
	    if ( mem [curq ].hh .v.RH > -1073741823L ) {
		
	      if ( mem [curlist .tailfield ].hh.b1 == hyphenchar [mainf ]) 
	      insdisc = true ;
	    } 
	    if ( ligaturepresent ) 
	    {
	      mainp = newligature ( mainf , curl , mem [curq ].hh .v.RH ) ;
	      if ( lfthit ) 
	      {
		mem [mainp ].hh.b1 = 2 ;
		lfthit = false ;
	      } 
	      if ( false ) {
		  
		if ( ligstack == -1073741823L ) 
		{
		  incr ( mem [mainp ].hh.b1 ) ;
		  rthit = false ;
		} 
	      } 
	      mem [curq ].hh .v.RH = mainp ;
	      curlist .tailfield = mainp ;
	      ligaturepresent = false ;
	    } 
	    if ( insdisc ) 
	    {
	      insdisc = false ;
	      if ( curlist .modefield > 0 ) 
	      {
		mem [curlist .tailfield ].hh .v.RH = newdisc () ;
		curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
	      } 
	    } 
	  } 
	  curq = curlist .tailfield ;
	  curl = mainj .b3 ;
	  maini = fontinfo [charbase [mainf ]+ effectivechar ( true , mainf 
	  , curl ) ].qqqq ;
	  ligaturepresent = true ;
	} 
	break ;
	default: 
	{
	  curl = mainj .b3 ;
	  ligaturepresent = true ;
	  if ( ligstack == -1073741823L ) 
	  goto lab80 ;
	  else goto lab91 ;
	} 
	break ;
      } 
      if ( mainj .b2 > 4 ) {
	  
	if ( mainj .b2 != 7 ) 
	goto lab80 ;
      } 
      if ( curl < 11904 ) 
      goto lab110 ;
      maink = bcharlabel [mainf ];
      goto lab111 ;
    } 
  } 
  if ( mainj .b0 == 0 ) 
  incr ( maink ) ;
  else {
      
    if ( mainj .b0 >= 128 ) 
    goto lab80 ;
    maink = maink + mainj .b0 + 1 ;
  } 
  goto lab111 ;
  lab95: mainp = mem [ligstack + 1 ].hh .v.RH ;
  if ( mainp > -1073741823L ) 
  {
    mem [curlist .tailfield ].hh .v.RH = mainp ;
    curlist .tailfield = mem [curlist .tailfield ].hh .v.RH ;
  } 
  tempptr = ligstack ;
  ligstack = mem [tempptr ].hh .v.RH ;
  freenode ( tempptr , 2 ) ;
  maini = fontinfo [charbase [mainf ]+ effectivechar ( true , mainf , curl 
  ) ].qqqq ;
  ligaturepresent = true ;
  if ( ligstack == -1073741823L ) {
      
    if ( mainp > -1073741823L ) 
    goto lab100 ;
    else curr = bchar ;
  } 
  else curr = mem [ligstack ].hh.b1 ;
  goto lab110 ;
  lab120: if ( eqtb [49937L ].hh .v.RH == membot ) 
  {
    {
      mainp = fontglue [eqtb [50985L ].hh .v.RH ];
      if ( mainp == -1073741823L ) 
      {
	mainp = newspec ( membot ) ;
	maink = parambase [eqtb [50985L ].hh .v.RH ]+ 2 ;
	mem [mainp + 1 ].cint = fontinfo [maink ].cint ;
	mem [mainp + 2 ].cint = fontinfo [maink + 1 ].cint ;
	mem [mainp + 3 ].cint = fontinfo [maink + 2 ].cint ;
	fontglue [eqtb [50985L ].hh .v.RH ]= mainp ;
      } 
    } 
    tempptr = newglue ( mainp ) ;
  } 
  else tempptr = newparamglue ( 12 ) ;
  if ( ! ( curlist .tailfield >= himemmin ) && ( mem [curlist .tailfield ]
  .hh.b0 == 5 ) ) 
  {
    mem [curlist .pnodefield ].hh .v.RH = tempptr ;
    mem [tempptr ].hh .v.RH = curlist .tailfield ;
    curlist .pnodefield = tempptr ;
  } 
  else {
      
    mem [curlist .tailfield ].hh .v.RH = tempptr ;
    curlist .tailfield = tempptr ;
  } 
  goto lab60 ;
} 
void 
giveerrhelp ( void ) 
{
  giveerrhelp_regmem 
  tokenshow ( eqtb [50467L ].hh .v.RH ) ;
} 
boolean 
openfmtfile ( void ) 
{
  /* 40 10 */ register boolean Result; openfmtfile_regmem 
  integer j  ;
  j = curinput .locfield ;
  if ( buffer [curinput .locfield ]== 38 ) 
  {
    incr ( curinput .locfield ) ;
    j = curinput .locfield ;
    buffer [last ]= 32 ;
    while ( buffer [j ]!= 32 ) incr ( j ) ;
    packbufferedname ( 0 , curinput .locfield , j - 1 ) ;
    if ( wopenin ( fmtfile ) ) 
    goto lab40 ;
    Fputs ( stdout ,  "Sorry, I can't find the format `" ) ;
    fputs ( stringcast ( nameoffile + 1 ) , stdout ) ;
    Fputs ( stdout ,  "'; will try `" ) ;
    fputs ( TEXformatdefault + 1 , stdout ) ;
    fprintf ( stdout , "%s\n",  "'." ) ;
    fflush ( stdout ) ;
  } 
  packbufferedname ( formatdefaultlength - 4 , 1 , 0 ) ;
  if ( ! wopenin ( fmtfile ) ) 
  {
    ;
    Fputs ( stdout ,  "I can't find the format file `" ) ;
    fputs ( TEXformatdefault + 1 , stdout ) ;
    fprintf ( stdout , "%s\n",  "'!" ) ;
    Result = false ;
    return Result ;
  } 
  lab40: curinput .locfield = j ;
  Result = true ;
  return Result ;
} 
void 
closefilesandterminate ( void ) 
{
  closefilesandterminate_regmem 
  integer k  ;
  {register integer for_end; k = 0 ;for_end = 15 ; if ( k <= for_end) do 
    if ( writeopen [k ]) 
    aclose ( writefile [k ]) ;
  while ( k++ < for_end ) ;} 
  eqtb [114411L ].cint = -1 ;
	;
#ifdef STAT
  if ( eqtb [114392L ].cint > 0 ) {
      
    if ( logopened ) 
    {
      { putc ( ' ' ,  logfile );  putc ( '\n',  logfile ); }
      fprintf ( logfile , "%s%s\n",  "Here is how much of TeX's memory" , " you used:" ) 
      ;
      fprintf ( logfile , "%c%ld%s",  ' ' , (long)strptr - initstrptr , " string" ) ;
      if ( strptr != initstrptr + 1 ) 
      putc ( 's' ,  logfile );
      fprintf ( logfile , "%s%ld\n",  " out of " , (long)maxstrings - initstrptr ) ;
      fprintf ( logfile , "%c%ld%s%ld\n",  ' ' , (long)poolptr - initpoolptr ,       " string characters out of " , (long)poolsize - initpoolptr ) ;
      fprintf ( logfile , "%c%ld%s%ld\n",  ' ' , (long)lomemmax - memmin + memend - himemmin + 2 ,       " words of memory out of " , (long)memend + 1 - memmin ) ;
      fprintf ( logfile , "%c%ld%s%ld%c%ld\n",  ' ' , (long)cscount ,       " multiletter control sequences out of " , (long)15000 , '+' , (long)hashextra ) ;
      fprintf ( logfile , "%c%ld%s%ld%s",  ' ' , (long)fmemptr , " words of font info for " , (long)fontptr -       0 , " font" ) ;
      if ( fontptr != 1 ) 
      putc ( 's' ,  logfile );
      fprintf ( logfile , "%s%ld%s%ld\n",  ", out of " , (long)fontmemsize , " for " , (long)fontmax - 0 ) 
      ;
      fprintf ( logfile , "%c%ld%s",  ' ' , (long)hyphcount , " hyphenation exception" ) ;
      if ( hyphcount != 1 ) 
      putc ( 's' ,  logfile );
      fprintf ( logfile , "%s%ld\n",  " out of " , (long)hyphsize ) ;
      fprintf ( logfile , "%c%ld%s%ld%s%ld%s%ld%s%ld%s%ld%s%ld%s%ld%s%ld%s%ld%c\n",  ' ' , (long)maxinstack , "i," , (long)maxneststack , "n," ,       (long)maxparamstack , "p," , (long)maxbufstack + 1 , "b," , (long)maxsavestack + 6 ,       "s stack positions out of " , (long)stacksize , "i," , (long)nestsize , "n," ,       (long)paramsize , "p," , (long)bufsize , "b," , (long)savesize , 's' ) ;
    } 
  } 
#endif /* STAT */
  while ( curs > -1 ) {
      
    if ( curs > 0 ) 
    {
      dvibuf [dviptr ]= 142 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    else {
	
      {
	dvibuf [dviptr ]= 140 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      incr ( totalpages ) ;
    } 
    decr ( curs ) ;
  } 
  if ( totalpages == 0 ) 
  printnl ( 1003 ) ;
  else if ( curs != -2 ) 
  {
    {
      dvibuf [dviptr ]= 248 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    dvifour ( lastbop ) ;
    lastbop = dvioffset + dviptr - 5 ;
    dvifour ( 25400000L ) ;
    dvifour ( 473628672L ) ;
    preparemag () ;
    dvifour ( eqtb [114378L ].cint ) ;
    dvifour ( maxv ) ;
    dvifour ( maxh ) ;
    {
      dvibuf [dviptr ]= maxpush / 256 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    {
      dvibuf [dviptr ]= maxpush % 256 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    {
      dvibuf [dviptr ]= ( totalpages / 256 ) % 256 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    {
      dvibuf [dviptr ]= totalpages % 256 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    while ( fontptr > 0 ) {
	
      if ( fontused [fontptr ]) 
      dvifontdef ( fontptr ) ;
      decr ( fontptr ) ;
    } 
    {
      dvibuf [dviptr ]= 249 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    dvifour ( lastbop ) ;
    if ( dirused ) 
    {
      dvibuf [dviptr ]= 3 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
    else {
	
      dvibuf [dviptr ]= 2 ;
      incr ( dviptr ) ;
      if ( dviptr == dvilimit ) 
      dviswap () ;
    } 
	;
#ifdef IPC
    k = 7 - ( ( 3 + dvioffset + dviptr ) % 4 ) ;
#endif /* IPC */
	;
#ifndef IPC
    k = 4 + ( ( dvibufsize - dviptr ) % 4 ) ;
#endif /* not IPC */
    while ( k > 0 ) {
	
      {
	dvibuf [dviptr ]= 223 ;
	incr ( dviptr ) ;
	if ( dviptr == dvilimit ) 
	dviswap () ;
      } 
      decr ( k ) ;
    } 
    if ( dvilimit == halfbuf ) 
    writedvi ( halfbuf , dvibufsize - 1 ) ;
    if ( dviptr > ( 2147483647L - dvioffset ) ) 
    {
      curs = -2 ;
      fatalerror ( 992 ) ;
    } 
    if ( dviptr > 0 ) 
    writedvi ( 0 , dviptr - 1 ) ;
    printnl ( 1004 ) ;
    printfilename ( 0 , outputfilename , 0 ) ;
    print ( 287 ) ;
    printint ( totalpages ) ;
    if ( totalpages != 1 ) 
    print ( 1005 ) ;
    else print ( 1006 ) ;
    print ( 387 ) ;
    printint ( dvioffset + dviptr ) ;
    print ( 1007 ) ;
    bclose ( dvifile ) ;
  } 
  synctexterminate ( logopened ) ;
  if ( logopened ) 
  {
    putc ('\n',  logfile );
    aclose ( logfile ) ;
    selector = selector - 2 ;
    if ( selector == 17 ) 
    {
      printnl ( 1492 ) ;
      printfilename ( 0 , texmflogname , 0 ) ;
      printchar ( 46 ) ;
    } 
  } 
  println () ;
  if ( ( editnamestart != 0 ) && ( interaction > 0 ) ) 
  calledit ( strpool , editnamestart , editnamelength , editline ) ;
} 
#ifdef TEXMF_DEBUG
void 
debughelp ( void ) 
{
  /* 888 10 */ debughelp_regmem 
  integer k, l, m, n  ;
  while ( true ) {
      
    ;
    printnl ( 1501 ) ;
    fflush ( stdout ) ;
    read ( stdin , m ) ;
    if ( m < 0 ) 
    return ;
    else if ( m == 0 ) 
    dumpcore () ;
    else {
	
      read ( stdin , n ) ;
      switch ( m ) 
      {case 1 : 
	printword ( mem [n ]) ;
	break ;
      case 2 : 
	printint ( mem [n ].hh .v.LH ) ;
	break ;
      case 3 : 
	printint ( mem [n ].hh .v.RH ) ;
	break ;
      case 4 : 
	printword ( eqtb [n ]) ;
	break ;
      case 5 : 
	{
	  printscaled ( fontinfo [n ].cint ) ;
	  printchar ( 32 ) ;
	  printint ( fontinfo [n ].qqqq .b0 ) ;
	  printchar ( 58 ) ;
	  printint ( fontinfo [n ].qqqq .b1 ) ;
	  printchar ( 58 ) ;
	  printint ( fontinfo [n ].qqqq .b2 ) ;
	  printchar ( 58 ) ;
	  printint ( fontinfo [n ].qqqq .b3 ) ;
	} 
	break ;
      case 6 : 
	printword ( savestack [n ]) ;
	break ;
      case 7 : 
	showbox ( n ) ;
	break ;
      case 8 : 
	{
	  breadthmax = 10000 ;
	  depththreshold = poolsize - poolptr - 10 ;
	  shownodelist ( n ) ;
	} 
	break ;
      case 9 : 
	showtokenlist ( n , -1073741823L , 1000 ) ;
	break ;
      case 10 : 
	slowprint ( n ) ;
	break ;
      case 11 : 
	checkmem ( n > 0 ) ;
	break ;
      case 12 : 
	searchmem ( n ) ;
	break ;
      case 13 : 
	{
	  read ( stdin , l ) ;
	  printcmdchr ( n , l ) ;
	} 
	break ;
      case 14 : 
	{register integer for_end; k = 0 ;for_end = n ; if ( k <= for_end) 
	do 
	  print ( buffer [k ]) ;
	while ( k++ < for_end ) ;} 
	break ;
      case 15 : 
	{
	  fontinshortdisplay = 0 ;
	  shortdisplay ( n ) ;
	} 
	break ;
      case 16 : 
	panicking = ! panicking ;
	break ;
	default: 
	print ( 63 ) ;
	break ;
      } 
    } 
  } 
} 
#endif /* TEXMF_DEBUG */
void 
scanfilenamebraced ( void ) 
{
  scanfilenamebraced_regmem 
  smallnumber savescannerstatus  ;
  halfword savedefref  ;
  halfword savecurcs  ;
  strnumber s  ;
  halfword p  ;
  integer i  ;
  boolean savestopatspace  ;
  boolean dummy  ;
  savescannerstatus = scannerstatus ;
  savedefref = defref ;
  savecurcs = curcs ;
  curcs = warningindex ;
  if ( scantoks ( false , true ) != 0 ) 
  ;
  oldsetting = selector ;
  selector = 21 ;
  showtokenlist ( mem [defref ].hh .v.RH , -1073741823L , poolsize - poolptr 
  ) ;
  selector = oldsetting ;
  s = makestring () ;
  deletetokenref ( defref ) ;
  defref = savedefref ;
  curcs = savecurcs ;
  scannerstatus = savescannerstatus ;
  savestopatspace = stopatspace ;
  stopatspace = false ;
  beginname () ;
  {register integer for_end; i = strstart [s ];for_end = strstart [s + 1 
  ]- 1 ; if ( i <= for_end) do 
    if ( strpool [i ]>= 256 ) 
    {
      {
	if ( poolptr + 1 > poolsize ) 
	overflow ( 260 , poolsize - initpoolptr ) ;
      } 
      {
	strpool [poolptr ]= strpool [i ];
	incr ( poolptr ) ;
      } 
    } 
    else dummy = morename ( strpool [i ]) ;
  while ( i++ < for_end ) ;} 
  stopatspace = savestopatspace ;
} 
strnumber 
getnullstr ( void ) 
{
  register strnumber Result; getnullstr_regmem 
  Result = 349 ;
  return Result ;
} 
