/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */

/* The normal alignment of 'struct{char;}', in bytes. */
#define ALIGNOF_STRUCT_CHAR__ 1

/* Define to 1 if you have the 'atexit' function. */
#define HAVE_ATEXIT 1

/* Use cairo graphics library */
/* #undef HAVE_CAIRO */

/* Use cairo-ft support in cairo graphics library */
/* #undef HAVE_CAIRO_FT */

/* Use Core Text backend */
/* #undef HAVE_CORETEXT */

/* define if the compiler supports basic C++11 syntax */
#define HAVE_CXX11 1

/* Define to 1 if you have the declaration of 'round', and to 0 if you don't.
   */
/* #undef HAVE_DECL_ROUND */

/* Define to 1 if you have the 'getpagesize' function. */
#define HAVE_GETPAGESIZE 1

/* Use glib2 library */
/* #undef HAVE_GLIB */

/* Use gobject2 library */
/* #undef HAVE_GOBJECT */

/* Use Graphite library */
#define HAVE_GRAPHITE2 1

/* Use gthread2 library */
/* #undef HAVE_GTHREAD */

/* Use Intel __sync_* atomic primitives */
/* #undef HAVE_INTEL_ATOMIC_PRIMITIVES */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the 'isatty' function. */
#define HAVE_ISATTY 1

/* Define to 1 if you have the <minix/config.h> header file. */
/* #undef HAVE_MINIX_CONFIG_H */

/* Define to 1 if you have the 'mmap' function. */
#define HAVE_MMAP 1

/* Define to 1 if you have the 'mprotect' function. */
#define HAVE_MPROTECT 1

/* Define to 1 if you have the 'newlocale' function. */
#define HAVE_NEWLOCALE 1

/* Use native OpenType Layout backend */
#define HAVE_OT 1

/* Define to 1 if you have the 'posix_memalign' function. */
#define HAVE_POSIX_MEMALIGN 1

/* Use POSIX threads */
/* #undef HAVE_PTHREAD */

/* Define to 1 if you have the 'round' function. */
#define HAVE_ROUND 1

/* Define to 1 if you have the <stdbool.h> header file. */
#define HAVE_STDBOOL_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdio.h> header file. */
#define HAVE_STDIO_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the 'strtod_l' function. */
#define HAVE_STRTOD_L 1

/* Define to 1 if you have the 'sysconf' function. */
#define HAVE_SYSCONF 1

/* Define to 1 if you have the <sys/mman.h> header file. */
#define HAVE_SYS_MMAN_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Use Uniscribe backend */
/* #undef HAVE_UNISCRIBE */

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the <wchar.h> header file. */
#define HAVE_WCHAR_H 1

/* Define to 1 if you have the <xlocale.h> header file. */
/* #undef HAVE_XLOCALE_H */

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT "tex-k@tug.org"

/* Define to the full name of this package. */
#define PACKAGE_NAME "harfbuzz (TeX Live)"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "harfbuzz (TeX Live) 14.2.1"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "harfbuzz--tex-live-"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION "14.2.1"

/* Define to 1 if all of the C89 standard headers exist (not just the ones
   required in a freestanding environment). This macro is provided for
   backward compatibility; new code need not use it. */
#define STDC_HEADERS 1

/* Enable extensions on AIX, Interix, z/OS.  */
#ifndef _ALL_SOURCE
# define _ALL_SOURCE 1
#endif
/* Enable extensions on Cosmopolitan Libc. */
#ifndef _COSMO_SOURCE
# define _COSMO_SOURCE 1
#endif
/* Enable general extensions on macOS.  */
#ifndef _DARWIN_C_SOURCE
# define _DARWIN_C_SOURCE 1
#endif
/* Enable general extensions on Solaris.  */
#ifndef __EXTENSIONS__
# define __EXTENSIONS__ 1
#endif
/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif
/* Enable X/Open compliant socket functions that do not require linking
   with -lxnet on HP-UX 11.11.  */
#ifndef _HPUX_ALT_XOPEN_SOCKET_API
# define _HPUX_ALT_XOPEN_SOCKET_API 1
#endif
/* Identify the host operating system as Minix.
   This macro does not affect the system headers' behavior.
   A future release of Autoconf may stop defining this macro.  */
#ifndef _MINIX
/* # undef _MINIX */
#endif
/* Enable general extensions on NetBSD.
   Enable NetBSD compatibility extensions on Minix.  */
#ifndef _NETBSD_SOURCE
# define _NETBSD_SOURCE 1
#endif
/* Enable OpenBSD compatibility extensions on NetBSD.
   Oddly enough, this does nothing on OpenBSD.  */
#ifndef _OPENBSD_SOURCE
# define _OPENBSD_SOURCE 1
#endif
/* Define to 1 if needed for POSIX-compatible behavior.  */
#ifndef _POSIX_SOURCE
/* # undef _POSIX_SOURCE */
#endif
/* Define to 2 if needed for POSIX-compatible behavior.  */
#ifndef _POSIX_1_SOURCE
/* # undef _POSIX_1_SOURCE */
#endif
/* Enable POSIX-compatible threading on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
# define _POSIX_PTHREAD_SEMANTICS 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-5:2014.  */
#ifndef __STDC_WANT_IEC_60559_ATTRIBS_EXT__
# define __STDC_WANT_IEC_60559_ATTRIBS_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-1:2014.  */
#ifndef __STDC_WANT_IEC_60559_BFP_EXT__
# define __STDC_WANT_IEC_60559_BFP_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-2:2015.  */
#ifndef __STDC_WANT_IEC_60559_DFP_EXT__
# define __STDC_WANT_IEC_60559_DFP_EXT__ 1
#endif
/* Enable extensions specified by C23 Annex F.  */
#ifndef __STDC_WANT_IEC_60559_EXT__
# define __STDC_WANT_IEC_60559_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TS 18661-4:2015.  */
#ifndef __STDC_WANT_IEC_60559_FUNCS_EXT__
# define __STDC_WANT_IEC_60559_FUNCS_EXT__ 1
#endif
/* Enable extensions specified by C23 Annex H and ISO/IEC TS 18661-3:2015.  */
#ifndef __STDC_WANT_IEC_60559_TYPES_EXT__
# define __STDC_WANT_IEC_60559_TYPES_EXT__ 1
#endif
/* Enable extensions specified by ISO/IEC TR 24731-2:2010.  */
#ifndef __STDC_WANT_LIB_EXT2__
# define __STDC_WANT_LIB_EXT2__ 1
#endif
/* Enable extensions specified by ISO/IEC 24747:2009.  */
#ifndef __STDC_WANT_MATH_SPEC_FUNCS__
# define __STDC_WANT_MATH_SPEC_FUNCS__ 1
#endif
/* Enable extensions on HP NonStop.  */
#ifndef _TANDEM_SOURCE
# define _TANDEM_SOURCE 1
#endif
/* Enable X/Open extensions.  Define to 500 only if necessary
   to make mbstate_t available.  */
#ifndef _XOPEN_SOURCE
/* # undef _XOPEN_SOURCE */
#endif

