# No binaries included => no need for a debug package
# Still can't make it noarch because files will contain
# lib vs. lib64 references
%define debug_package %nil
%define _disable_ld_no_undefined 1
%bcond_with docs

# Compiler flags used here get propagated, and gnustep-base doesn't like
# -Os/-Oz because of the float vs. _Float32 mess
%global optflags %(echo %{optflags} -fno-lto |sed -e 's, -flto,,g') -O3
%define underscoredversion %(echo %{version} |sed -e 's,\\.,_,g')

Summary: 	GNUstep Makefile package
Name: 		gnustep-make
Version: 	2.9.1
Release: 	2
License: 	GPLv3+
Group:		Development/Other 
Url:		http://www.gnustep.org/
Source0: 	https://github.com/gnustep/tools-make/releases/download/make-%{underscoredversion}/gnustep-make-%{version}.tar.gz
Source100:	%{name}.rpmlintrc
BuildRequires:	pkgconfig(libobjc) >= 2.0.0
%if %{with docs}
BuildRequires:	texinfo
BuildRequires:	latex2html >= 2008-6
BuildRequires:	texlive-latex
BuildRequires:	texlive-latex-bin
BuildRequires:	texlive
BuildRequires:	texlive-dvips
BuildRequires:	texi2html
%endif
BuildConflicts:	%{name}

%description
This package contains the basic scripts, makefiles and directory layout
needed to run and compile any GNUstep software.

NOTE: Following FHS standards, this package will attempt to force all other
gnustep-based into /usr/bin, /usr/lib, /usr/share, etc.  Many documentation
files will refer to /usr/GNUstep as being the root directory, which is
incorrect.  Also, user files are stored in ~/.gnustep rather than ~/GNUstep.

%prep
%autosetup -p1
%if "%{_lib}" != "lib"
sed -i -e 's,/lib,/%{_lib},g' FilesystemLayouts/fhs*
%endif
%configure \
	--with-layout=fhs-system \
	--with-library-combo=ng-gnu-gnu \
	--with-user-dir=.gnustep
 
%build
%make_build
sed -i -e 's|%{_prefix}/man|%{_mandir}|g' GNUstep.conf
sed -i -e 's|%{_prefix}/info|%{_datadir}/GNUstep/info|g' GNUstep.conf
%if %{with docs}
cd Documentation
%make_build
%endif

%install
%make_install
%if %{with docs}
cd Documentation
%make_install
mkdir -p %{buildroot}/%{_datadir}/GNUstep
mv %{buildroot}/%{_infodir} %{buildroot}/%{_datadir}/GNUstep
%endif
 
%files
%doc ANNOUNCE ChangeLog FAQ GNUstep-HOWTO NEWS README RELEASENOTES Version
%{_sysconfdir}/GNUstep
%{_bindir}/*
%{_datadir}/GNUstep
%{_mandir}/man1/*
%{_mandir}/man7/*
