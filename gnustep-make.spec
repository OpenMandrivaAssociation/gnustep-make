%define version	2.0.1
%define name	gnustep-make
%define release %mkrel 2

Name: 		%{name}
Version: 	%{version}
Release: 	%release
Source: 	ftp://ftp.gnustep.org/pub/gnustep/core/%{name}-%{version}.tar.bz2
License: 	GPL
Group:		Development/Other 
Summary: 	GNUstep Makefile package
URL:		http://www.gnustep.org/
BuildRoot:	%{_tmppath}/%{name}-%{version}
BuildArch:	noarch
#BuildRequires:	texinfo latex2html
#BuildRequires:	tetex-latex tetex-dvips tetex-texi2html

%description
This package contains the basic scripts, makefiles and directory layout
needed to run and compile any GNUstep software.

%prep
%setup -q
 
%build
./configure
%make
#cd Documentation
#make

%install
rm -rf $RPM_BUILD_ROOT
%makeinstall_std
#cd Documentation
#make install GNUSEP_DOC=%buildroot/%_prefix/GNUstep
 
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
%doc ANNOUNCE COPYING ChangeLog FAQ GNUstep-HOWTO
%doc INSTALL NEWS README 
%{_sysconfdir}/profile.d/*
%{_sysconfdir}/GNUstep
%{_prefix}/GNUstep
