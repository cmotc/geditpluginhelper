[+ autogen5 template +]
dnl Process this file with autoconf to produce a configure script.
dnl Created by Anjuta application wizard.

AC_INIT([+NameHLower+], [+Version+])

AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE([1.11])

AM_SILENT_RULES([yes])

AC_PROG_CC

AM_PROG_AR

AM_PROG_VALAC

[+IF (=(get "HaveI18n") "1")+]
dnl ***************************************************************************
dnl Internationalization
dnl ***************************************************************************
IT_PROG_INTLTOOL([0.35.0])

GETTEXT_PACKAGE=[+NameHLower+]
AC_SUBST(GETTEXT_PACKAGE)
AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE", [GETTEXT package name])
AM_GLIB_GNU_GETTEXT
[+ENDIF+]

[+IF (=(get "HaveWindowsSupport") "1")+]
dnl ***************************************************************************
dnl Check for Windows
dnl ***************************************************************************
AC_CANONICAL_HOST

case $host_os in
  *mingw*)
    platform_win32=yes
    native_win32=yes
    ;;
  pw32* | *cygwin*)
    platform_win32=yes
    native_win32=no
    ;;
  *)
    platform_win32=no
    native_win32=no
    ;;
esac
AM_CONDITIONAL(PLATFORM_WIN32, test x"$platform_win32" = "xyes")
AM_CONDITIONAL(NATIVE_WIN32, test x"$native_win32" = "xyes")[+
ENDIF+]

[+CASE (get "LibraryType") +]
[+ == "Static" +]AC_DISABLE_SHARED
[+ == "Shared" +]AC_DISABLE_STATIC
[+ESAC+][+
IF (=(get "HaveWindowsSupport") "1")+]
LT_INIT([win32-dll])[+
ELSE+]
LT_INIT[+
ENDIF+]

[+IF (=(get "HavePackage") "1")+]
pkg_modules="[+PackageModule1+] [+PackageModule2+]"
AC_SUBST(pkg_modules)
PKG_CHECK_MODULES([+NameCUpper+], [[+PackageModule1+] [+PackageModule2+]])

[+ENDIF+]

[+IF (=(get "HaveGtkDoc") "1")+]
GTK_DOC_CHECK([1.0])
[+ENDIF+]

AC_OUTPUT([
Makefile
src/[+NameHLower+]-[+Version+].pc
src/Makefile
[+IF (=(get "HaveI18n") "1")+]po/Makefile.in[+ENDIF+]])
