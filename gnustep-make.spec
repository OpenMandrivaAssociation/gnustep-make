# No binaries included => no need for a debug package
# Still can't make it noarch because files will contain
# lib vs. lib64 references
%define debug_package %nil
%define _disable_ld_no_undefined 1

Summary: 	GNUstep Makefile package
Name: 		gnustep-make
Version: 	2.6.7
Release: 	2
License: 	GPLv3+
Group:		Development/Other 
Url:		http://www.gnustep.org/
Source0: 	ftp://ftp.gnustep.org/pub/gnustep/core/%{name}-%{version}.tar.gz
Source100:	%{name}.rpmlintrc
BuildRequires:	texinfo
BuildRequires:	latex2html >= 2008-6
BuildRequires:	texlive-latex
BuildRequires:	texlive-latex-bin
BuildRequires:	texlive
BuildRequires:	texlive-dvips
BuildRequires:	texi2html
BuildConflicts:	%{name}

%track
prog %{name} = {
	version = %version
	url = http://ftp.gnustep.org/pub/gnustep/core/
	regex = %{name}-(__VER__)\.tar\.gz
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
%if "%{_lib}" != "lib"
sed -i -e 's,/lib,/%{_lib},g' FilesystemLayouts/fhs*
%endif
 
%build
export CXX=g++
export CC=gcc

%configure \
	--with-layout=fhs-system \
	--with-user-dir=.gnustep
%make
sed -i -e 's|%{_prefix}/man|%{_mandir}|g' GNUstep.conf
sed -i -e 's|%{_prefix}/info|%{_datadir}/GNUstep/info|g' GNUstep.conf
cd Documentation
%make

%install
%makeinstall_std
cd Documentation
%makeinstall_std
mkdir -p %{buildroot}/%{_datadir}/GNUstep
mv %{buildroot}/%{_infodir} %{buildroot}/%{_datadir}/GNUstep
 
%files
%doc ANNOUNCE ChangeLog FAQ GNUstep-HOWTO NEWS README RELEASENOTES Version
%{_sysconfdir}/GNUstep
%{_bindir}/*
%{_datadir}/GNUstep
%{_mandir}/man1/*
%{_mandir}/man7/*

