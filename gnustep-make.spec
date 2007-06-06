%define version	2.0.1
%define name	gnustep-make
%define release %mkrel 3

%define build_doc 1

Name: 		%{name}
Version: 	%{version}
Release: 	%release
Source: 	ftp://ftp.gnustep.org/pub/gnustep/core/%{name}-%{version}.tar.bz2
License: 	GPL
Group:		Development/Other 
Summary: 	GNUstep Makefile package
URL:		http://www.gnustep.org/
BuildRoot:	%{_tmppath}/%{name}-%{version}
%if %build_doc
BuildRequires:	texinfo latex2html
BuildRequires:	tetex-latex tetex-dvips tetex-texi2html
#BuildRequires:	%name >= %version
%endif

%description
This package contains the basic scripts, makefiles and directory layout
needed to run and compile any GNUstep software.

%prep
%setup -q
 
%build
CFLAGS="$RPM_OPT_FLAGS" ./configure
%make
%if %build_doc
cd Documentation
make
%endif

%install
rm -rf $RPM_BUILD_ROOT
%makeinstall_std
%if %build_doc
cd Documentation
%makeinstall_std
%endif
 
# Create profile files
mkdir -p ${RPM_BUILD_ROOT}/etc/profile.d
echo "#!/bin/sh" > gnustep.sh
echo ". %{_prefix}/GNUstep/System/Library/Makefiles/GNUstep.sh" >> gnustep.sh
echo "#!/bin/csh" > gnustep.csh
echo "source %{_prefix}/GNUstep/System/Library/Makefiles/GNUstep.csh" >> gnustep.csh

chmod 755 gnustep.*
mv gnustep.sh $RPM_BUILD_ROOT/etc/profile.d/
mv gnustep.csh $RPM_BUILD_ROOT/etc/profile.d/

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr (-, root, root)
%doc ANNOUNCE ChangeLog FAQ GNUstep-HOWTO NEWS README RELEASENOTES Version
%{_sysconfdir}/profile.d/*
%{_sysconfdir}/GNUstep
%{_prefix}/GNUstep
