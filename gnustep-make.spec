# No binaries included => no need for a debug package
# Still can't make it noarch because files will contain
# lib vs. lib64 references
%define debug_package %nil
%define _disable_ld_no_undefined 1

Name: 		gnustep-make
Version: 	2.6.2
Release: 	3
Source0: 	ftp://ftp.gnustep.org/pub/gnustep/core/%{name}-%{version}.tar.gz
License: 	GPLv3+
Group:		Development/Other 
Summary: 	GNUstep Makefile package
URL:		http://www.gnustep.org/
BuildRequires:	texinfo latex2html >= 2008-6
BuildRequires:	tetex-latex tetex-dvips texi2html
BuildConflicts:	%name

%track
prog %name = {
	version = %version
	url = http://ftp.gnustep.org/pub/gnustep/core/
	regex = %name-(__VER__)\.tar\.gz
}

%description
This package contains the basic scripts, makefiles and directory layout
needed to run and compile any GNUstep software.

NOTE: Following FHS standards, this package will attempt to force all other
gnustep-based into /usr/bin, /usr/lib, /usr/share, etc.  Many documentation
files will refer to /usr/GNUstep as being the root directory, which is
incorrect.  Also, user files are stored in ~/.gnustep rather than ~/GNUstep.

%prep
%setup -q
%if "%_lib" != "lib"
sed -i -e 's,/lib,/%_lib,g' FilesystemLayouts/fhs*
%endif
 
%build
%configure2_5x --with-layout=fhs-system \
	--with-user-dir=.gnustep
%make
sed -i -e 's|%_prefix/man|%_mandir|g' GNUstep.conf
sed -i -e 's|%_prefix/info|%_datadir/GNUstep/info|g' GNUstep.conf
cd Documentation
%make

%install
rm -rf $RPM_BUILD_ROOT
%makeinstall_std
cd Documentation
make install
mkdir -p %buildroot/%{_datadir}/GNUstep
cd tmp-installation/System/Library/Documentation
cp -fr info %buildroot/%{_datadir}/GNUstep/
 
%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr (-, root, root)
%doc ANNOUNCE ChangeLog FAQ GNUstep-HOWTO NEWS README RELEASENOTES Version
%doc Documentation/tmp-installation/System/Library/Documentation/Developer
%doc Documentation/tmp-installation/System/Library/Documentation/User
%{_sysconfdir}/GNUstep
%{_bindir}/*
%{_datadir}/GNUstep
%{_mandir}/man1/*
%{_mandir}/man7/*


%changelog
* Thu Oct 04 2012 Bernhard Rosenkraenzer <bero@bero.eu> 2.6.2-3
+ Revision: 818379
- Fix /usr/lib references where it should be /usr/lib64
- Add back rpm5 tracking info

* Sun May 13 2012 Bernhard Rosenkraenzer <bero@bero.eu> 2.6.2-2
+ Revision: 798677
- Use _disable_ld_no_undefined, SOPE and friends rely on it

* Mon Mar 26 2012 Bernhard Rosenkraenzer <bero@bero.eu> 2.6.2-1
+ Revision: 787038
- Update to 2.6.2
- Fix build in current environment

* Tue Aug 03 2010 Funda Wang <fwang@mandriva.org> 2.4.0-1mdv2011.0
+ Revision: 565217
- new version 2.4.0

* Wed Jun 03 2009 Funda Wang <fwang@mandriva.org> 2.2.0-1mdv2010.0
+ Revision: 382408
- New version 2.2.0

* Wed Jan 07 2009 Funda Wang <fwang@mandriva.org> 2.0.8-1mdv2009.1
+ Revision: 326893
- New version 2.0.8

* Wed Jun 25 2008 Funda Wang <fwang@mandriva.org> 2.0.6-2mdv2009.0
+ Revision: 229097
- drop profile.d as it will confuse icecream (bug#41639)

* Thu Jun 19 2008 Funda Wang <fwang@mandriva.org> 2.0.6-1mdv2009.0
+ Revision: 226160
- New version 2.0.6

* Tue Jun 03 2008 Funda Wang <fwang@mandriva.org> 2.0.5-1mdv2009.0
+ Revision: 214634
- New version 2.0.5

* Fri Dec 21 2007 Olivier Blin <blino@mandriva.org> 2.0.1-5mdv2008.1
+ Revision: 136456
- restore BuildRoot

  + Thierry Vignaud <tv@mandriva.org>
    - kill re-definition of %%buildroot on Pixel's request
    - replace %%_datadir/man by %%_mandir!

* Tue Jun 26 2007 Austin Acton <austin@mandriva.org> 2.0.1-5mdv2008.0
+ Revision: 44736
- move conflicting (and probably never read) info files outside of global info

* Wed Jun 20 2007 Austin Acton <austin@mandriva.org> 2.0.1-4mdv2008.0
+ Revision: 41897
- add buildconflict with itself; may reduce some problems
- move everything to FHS layout
- move user dir to ~/.gnustep
- fix man and info locations
- link directly to profile.d files
- install docs by hand to avoid buildrequring itself
- un#, fix test
- # self
- fix my own doc mistake
- enforce RPM_OPT_FLAGS (making this arch-dependent, despite no binaries)
- build docs

* Mon May 28 2007 Austin Acton <austin@mandriva.org> 2.0.1-2mdv2008.0
+ Revision: 31928
- fix profile scripts (I suck)
- temporarily disable doc bulding (GNUstep sucks)

* Sun May 27 2007 Austin Acton <austin@mandriva.org> 2.0.1-1mdv2008.0
+ Revision: 31865
- new version
- fix profile script
- remove useless post

* Sun May 27 2007 Austin Acton <austin@mandriva.org> 2.0.0-1mdv2008.0
+ Revision: 31698
- fix buildrequires
- buildrequires texi2html
- new version
- redo much of spec file
- support csh
- install everything in default location for now, for simplicity
- noarch
- source settings on post
- Import gnustep-make

