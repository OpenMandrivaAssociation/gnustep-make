# No binaries included => no need for a debug package
# Still can't make it noarch because files will contain
# lib vs. lib64 references
%define debug_package %nil
%define _disable_ld_no_undefined 1

Name: 		gnustep-make
Version: 	2.6.2
Release: 	2
Source0: 	ftp://ftp.gnustep.org/pub/gnustep/core/%{name}-%{version}.tar.gz
License: 	GPLv3+
Group:		Development/Other 
Summary: 	GNUstep Makefile package
URL:		http://www.gnustep.org/
BuildRequires:	texinfo latex2html >= 2008-6
BuildRequires:	tetex-latex tetex-dvips texi2html
BuildConflicts:	%name

%description
This package contains the basic scripts, makefiles and directory layout
needed to run and compile any GNUstep software.

NOTE: Following FHS standards, this package will attempt to force all other
gnustep-based into /usr/bin, /usr/lib, /usr/share, etc.  Many documentation
files will refer to /usr/GNUstep as being the root directory, which is
incorrect.  Also, user files are stored in ~/.gnustep rather than ~/GNUstep.

%prep
%setup -q
 
%build
%configure2_5x --with-layout=fhs \
	--with-user-dir=.gnustep
%make
perl -pi -e 's|%_prefix/man|%_mandir||g' GNUstep.conf
perl -pi -e 's|%_prefix/info|%_datadir/GNUstep/info||g' GNUstep.conf
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
