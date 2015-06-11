[+ autogen5 template +]
## Process this file with automake to produce Makefile.in

## Created by Anjuta

[+IF (=(get "HaveBuilderUI") "1")+]
uidir = $(pkgdatadir)/ui
ui_DATA = [+NameHLower+].ui
[+ENDIF+]

AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\" \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\"[+IF (=(get "HavePackage") "1")+] \
	$([+NameCUpper+]_CFLAGS)[+ENDIF+]

AM_CFLAGS =\
	 -Wall\
	 -g

bin_PROGRAMS = [+NameHLower+]

[+NameCLower+]_SOURCES = \
	[+NameHLower+].vala config.vapi

[+NameCLower+]_VALAFLAGS = [+IF (not (= (get "PackageModule2") ""))+] --pkg [+(string-substitute (get "PackageModule2") " " " --pkg ")+] [+ENDIF+] \
	--pkg gtk+-3.0

[+IF (=(get "HaveWindowsSupport") "1")+]
[+NameCLower+]_LDFLAGS =[+
ELSE+]
[+NameCLower+]_LDFLAGS = \
	-Wl,--export-dynamic[+
ENDIF+]

[+NameCLower+]_LDADD = $([+NameCUpper+]_LIBS)

[+IF (=(get "HaveWindowsSupport") "1")+]
if PLATFORM_WIN32
[+NameCLower+]_LDFLAGS += -Wl,--export-all-symbols
else
[+NameCLower+]_LDFLAGS += -Wl,--export-dynamic
endif

if NATIVE_WIN32
[+NameCLower+]_LDFLAGS += -mwindows
endif[+
ENDIF+]

[+IF (=(get "HaveBuilderUI") "1")+]
EXTRA_DIST = $(ui_DATA)

# Remove ui directory on uninstall
uninstall-local:
	-rm -r $(uidir)
	-rm -r $(pkgdatadir)
[+ENDIF+]
