%define version	2.0.1
%define name	gnustep-make
%define release %mkrel 4

# Documentation will not build/install properly without GNUstep.conf
# So, must build without documentation the first time.
%define build_doc 0

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
BuildRequires:	%name = %version
%endif

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
CFLAGS="$RPM_OPT_FLAGS" ./configure --prefix=/usr --with-layout=fhs \
 --with-user-dir=.gnustep
%make
perl -pi -e 's|%_prefix/man|%_datadir/man||g' GNUstep.conf
perl -pi -e 's|%_prefix/info|%_datadir/info||g' GNUstep.conf
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
mkdir -p ${RPM_BUILD_ROOT}/%{_sysconfdir}/profile.d
cd %buildroot/%{_sysconfdir}/profile.d
ln -s %{_datadir}/GNUstep/Makefiles/GNUstep.sh
ln -s %{_datadir}/GNUstep/Makefiles/GNUstep.csh
chmod 755 %buildroot/%{_datadir}/GNUstep/Makefiles/GNUstep.sh
chmod 755 %buildroot/%{_datadir}/GNUstep/Makefiles/GNUstep.csh

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr (-, root, root)
%doc ANNOUNCE ChangeLog FAQ GNUstep-HOWTO NEWS README RELEASENOTES Version
%{_sysconfdir}/profile.d/*
%{_sysconfdir}/GNUstep
%{_bindir}/*
%{_datadir}/GNUstep
%if %build_doc
%{_mandir}/man1/*
%{_mandir}/man7/*
%{_infodir}/*
%endif

