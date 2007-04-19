%define version		1.12.0
%define name		gnustep-make
%define prefix 		/usr/GNUstep
%define gs_libcombo     gnu-gnu-gnu
%define rel                  2

%define build_docs 1

Name: 		%{name}
Version: 	%{version}
Release: 	%mkrel %{rel}
Source: 	%{name}-%{version}.tar.bz2
Source1:        gnustep-make-1.11.1-user_home.c.tar.bz2
Source2:         GNUstep.conf.tar.bz2
Patch0:		%{name}-destdir.patch.bz2
Patch1:		%{name}-no-LD_LIBRARY_PATH.patch.bz2 
License: 	GPL
Group:		Development/Other 
Summary: 	GNUstep Makefile package
URL:		http://www.gnustep.org/
BuildRoot:	%{_tmppath}/%{name}-%{version} 
%if %{build_docs}
BuildRequires:	tetex-dvips
BuildRequires:	 tetex-texi2html
%endif

%description
This package contains the basic scripts, makefiles and directory layout
needed to run and compile any GNUstep software.  This package was configured
for library combo %{gs_libcombo}.

%prep
%setup -q -n %{name}-%{version} -a1 -a2
%patch0 -p1
%patch1 -p1
tar xjf %{SOURCE1}
 
%build

autoconf
%configure --prefix=%{prefix} --with-library-combo=%{gs_libcombo}  
%make 

%if %{build_docs}
GNUSTEP_MAKEFILES= %{__make} -C Documentation
%endif

%install
rm -rf $RPM_BUILD_ROOT

%make install special_prefix=${RPM_BUILD_ROOT}
 
%ifos Linux
mkdir -p ${RPM_BUILD_ROOT}/etc/profile.d
mkdir -p ${RPM_BUILD_ROOT}/etc/GNUstep

# Create profile files
echo "#!/bin/sh" > mygnustep.sh
echo ". %{prefix}/System/Makefiles/GNUstep.sh" >> mygnustep.sh
#echo "#!/bin/csh" > mygnustep.csh
#echo "source %{gs_prefix}/System/Makefiles/GNUstep.csh" >> mygnustep.csh

chmod 755 mygnustep.*
mv mygnustep.sh $RPM_BUILD_ROOT/etc/profile.d/GNUstep.sh
#mv mygnustep.csh $RPM_BUILD_ROOT/etc/profile.d/GNUstep.csh
mv GNUstep.conf ${RPM_BUILD_ROOT}/etc/GNUstep/GNUstep.conf
%endif # Linux
 
ln -s %{prefix}/System/Library/Makefiles/ ${RPM_BUILD_ROOT}%{prefix}/System
 
%if %{build_docs} 
mkdir -p ${RPM_BUILD_ROOT}%{prefix}/System/Library/Documentation/man/man1
mkdir -p ${RPM_BUILD_ROOT}%{prefix}/System/Library/Documentation/man/man7 
mv Documentation/*.1 ${RPM_BUILD_ROOT}%{prefix}/System/Library/Documentation/man/man1
mv Documentation/*.7 ${RPM_BUILD_ROOT}%{prefix}/System/Library/Documentation/man/man7
bzip2 ${RPM_BUILD_ROOT}%{prefix}/System/Library/Documentation/man/man1/*.1
bzip2  ${RPM_BUILD_ROOT}%{prefix}/System/Library/Documentation/man/man7/*.7
%endif

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr (-, root, root)
%doc ANNOUNCE COPYING ChangeLog FAQ GNUstep-HOWTO
%doc INSTALL NEWS README 
%if %build_docs
%doc Documentation/FAQ Documentation/*.info Documentation/*.pdf Documentation/*.ps
%doc Documentation/faq Documentation/filesystem Documentation/gnustep-howto
%doc Documentation/machines Documentation/make Documentation/userfaq
%endif

# Well - this is the simplest trick you could think of.  We include in
# the package everything which was installed inside /usr/GNUstep/
%{prefix}

# Add the profiles for linux as configuration files <FIXME gdomap etc>
%ifos Linux
#not a config file
/etc/profile.d/GNUstep.sh
%config(noreplace) /etc/GNUstep/GNUstep.conf
#%config /etc/profile.d/GNUstep.csh
%endif # Linux
