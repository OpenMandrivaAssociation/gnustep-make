#   This file must be sourced inside (ba)sh using: .
#
#   filesystem.sh.  Generated from filesystem.sh.in by configure.
#
#   Sets up the GNUstep filesystem paths for shell scripts
#
#   Copyright (C) 2007 Free Software Foundation, Inc.
#
#   Author:  Nicola Pero <nicola.pero@meta-innovation.com>,
#            
#   Date:  February 2007
#
#   This file is part of the GNUstep Makefile Package.
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   as published by the Free Software Foundation; either version 3
#   of the License, or (at your option) any later version.
#   
#   You should have received a copy of the GNU General Public
#   License along with this library; see the file COPYING.
#   If not, write to the Free Software Foundation,
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

#
# This does the same that filesystem.make does, but for GNUstep.sh.
# Include this file after reading your config to make sure that all
# the paths are available.
#
# PS: If you change this list, make sure that top update the list of
# paths used in all other filesystem.*, and in common.make when
# GNUSTEP_INSTALLATION_DIR is set.
#

#
# Location of Users directories ... never used by gnustep-make.
#
if [ -z "$GNUSTEP_SYSTEM_USERS_DIR" ]; 
 then GNUSTEP_SYSTEM_USERS_DIR="/home"
fi
if [ -z "$GNUSTEP_NETWORK_USERS_DIR" ]; 
 then GNUSTEP_NETWORK_USERS_DIR="/home"
fi
if [ -z "$GNUSTEP_LOCAL_USERS_DIR" ]; 
 then GNUSTEP_LOCAL_USERS_DIR="/home"
fi


# PS: We don't want to define these variables to avoid extreme
# environment pollution. :-) They are fixed subdirs of LIBRARY if you
# need them.
#GNUSTEP_SYSTEM_APPLICATION_SUPPORT  = $GNUSTEP_SYSTEM_LIBRARY/ApplicationSupport
#GNUSTEP_SYSTEM_BUNDLES              = $GNUSTEP_SYSTEM_LIBRARY/Bundles
#GNUSTEP_SYSTEM_FRAMEWORKS           = $GNUSTEP_SYSTEM_LIBRARY/Frameworks
#GNUSTEP_SYSTEM_PALETTES             = $GNUSTEP_SYSTEM_LIBRARY/ApplicationSupport/Palettes
#GNUSTEP_SYSTEM_SERVICES             = $GNUSTEP_SYSTEM_LIBRARY/Services
#GNUSTEP_SYSTEM_RESOURCES            = $GNUSTEP_SYSTEM_LIBRARY/Libraries/Resources
#GNUSTEP_SYSTEM_JAVA                 = $GNUSTEP_SYSTEM_LIBRARY/Libraries/Java

#
# SYSTEM domain
#
if [ -z "$GNUSTEP_SYSTEM_APPS" ]; 
 then GNUSTEP_SYSTEM_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Applications"
fi
if [ -z "$GNUSTEP_SYSTEM_ADMIN_APPS" ]; 
 then GNUSTEP_SYSTEM_ADMIN_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Applications/Admin"
fi
if [ -z "$GNUSTEP_SYSTEM_WEB_APPS" ]; 
 then GNUSTEP_SYSTEM_WEB_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Library/WebApplications"
fi
if [ -z "$GNUSTEP_SYSTEM_TOOLS" ]; 
 then GNUSTEP_SYSTEM_TOOLS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Tools"
fi
if [ -z "$GNUSTEP_SYSTEM_ADMIN_TOOLS" ]; 
 then GNUSTEP_SYSTEM_ADMIN_TOOLS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Tools/Admin"
fi
if [ -z "$GNUSTEP_SYSTEM_LIBRARY" ]; 
 then GNUSTEP_SYSTEM_LIBRARY="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Library"
fi
if [ -z "$GNUSTEP_SYSTEM_HEADERS" ]; 
 then GNUSTEP_SYSTEM_HEADERS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Library/Headers"
fi
if [ -z "$GNUSTEP_SYSTEM_LIBRARIES" ]; 
 then GNUSTEP_SYSTEM_LIBRARIES="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Library/Libraries"
fi
if [ -z "$GNUSTEP_SYSTEM_DOC" ]; 
 then GNUSTEP_SYSTEM_DOC="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Library/Documentation"
fi
if [ -z "$GNUSTEP_SYSTEM_DOC_MAN" ]; 
 then GNUSTEP_SYSTEM_DOC_MAN="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Library/Documentation/man"
fi
if [ -z "$GNUSTEP_SYSTEM_DOC_INFO" ]; 
 then GNUSTEP_SYSTEM_DOC_INFO="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/System/Library/Documentation/info"
fi

#
# NETWORK domain
#
if [ -z "$GNUSTEP_NETWORK_APPS" ]; 
 then GNUSTEP_NETWORK_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Applications"
fi
if [ -z "$GNUSTEP_NETWORK_ADMIN_APPS" ]; 
 then GNUSTEP_NETWORK_ADMIN_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Applications/Admin"
fi
if [ -z "$GNUSTEP_NETWORK_WEB_APPS" ]; 
 then GNUSTEP_NETWORK_WEB_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/WebApplications"
fi
if [ -z "$GNUSTEP_NETWORK_TOOLS" ]; 
 then GNUSTEP_NETWORK_TOOLS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Tools"
fi
if [ -z "$GNUSTEP_NETWORK_ADMIN_TOOLS" ]; 
 then GNUSTEP_NETWORK_ADMIN_TOOLS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Tools/Admin"
fi
if [ -z "$GNUSTEP_NETWORK_LIBRARY" ]; 
 then GNUSTEP_NETWORK_LIBRARY="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library"
fi
if [ -z "$GNUSTEP_NETWORK_HEADERS" ]; 
 then GNUSTEP_NETWORK_HEADERS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Headers"
fi
if [ -z "$GNUSTEP_NETWORK_LIBRARIES" ]; 
 then GNUSTEP_NETWORK_LIBRARIES="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Libraries"
fi
if [ -z "$GNUSTEP_NETWORK_DOC" ]; 
 then GNUSTEP_NETWORK_DOC="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Documentation"
fi
if [ -z "$GNUSTEP_NETWORK_DOC_MAN" ]; 
 then GNUSTEP_NETWORK_DOC_MAN="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Documentation/man"
fi
if [ -z "$GNUSTEP_NETWORK_DOC_INFO" ]; 
 then GNUSTEP_NETWORK_DOC_INFO="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Documentation/info"
fi

#
# LOCAL domain
#
if [ -z "$GNUSTEP_LOCAL_APPS" ]; 
 then GNUSTEP_LOCAL_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Applications"
fi
if [ -z "$GNUSTEP_LOCAL_ADMIN_APPS" ]; 
 then GNUSTEP_LOCAL_ADMIN_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Applications/Admin"
fi
if [ -z "$GNUSTEP_LOCAL_WEB_APPS" ]; 
 then GNUSTEP_LOCAL_WEB_APPS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/WebApplications"
fi
if [ -z "$GNUSTEP_LOCAL_TOOLS" ]; 
 then GNUSTEP_LOCAL_TOOLS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Tools"
fi
if [ -z "$GNUSTEP_LOCAL_ADMIN_TOOLS" ]; 
 then GNUSTEP_LOCAL_ADMIN_TOOLS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Tools/Admin"
fi
if [ -z "$GNUSTEP_LOCAL_LIBRARY" ]; 
 then GNUSTEP_LOCAL_LIBRARY="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library"
fi
if [ -z "$GNUSTEP_LOCAL_HEADERS" ]; 
 then GNUSTEP_LOCAL_HEADERS="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Headers"
fi
if [ -z "$GNUSTEP_LOCAL_LIBRARIES" ]; 
 then GNUSTEP_LOCAL_LIBRARIES="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Libraries"
fi
if [ -z "$GNUSTEP_LOCAL_DOC" ]; 
 then GNUSTEP_LOCAL_DOC="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Documentation"
fi
if [ -z "$GNUSTEP_LOCAL_DOC_MAN" ]; 
 then GNUSTEP_LOCAL_DOC_MAN="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Documentation/man"
fi
if [ -z "$GNUSTEP_LOCAL_DOC_INFO" ]; 
 then GNUSTEP_LOCAL_DOC_INFO="/home/bero/abf/gnustep-make/BUILD/gnustep-make-2.6.2/Documentation/tmp-installation/Local/Library/Documentation/info"
fi

#
# USER domain
#
if [ -z "$GNUSTEP_USER_DIR_APPS" ]; 
 then GNUSTEP_USER_DIR_APPS="GNUstep/Applications"
fi
if [ -z "$GNUSTEP_USER_DIR_ADMIN_APPS" ]; 
 then GNUSTEP_USER_DIR_ADMIN_APPS="GNUstep/Applications/Admin"
fi
if [ -z "$GNUSTEP_USER_DIR_WEB_APPS" ]; 
 then GNUSTEP_USER_DIR_WEB_APPS="GNUstep/Library/WebApplications"
fi
if [ -z "$GNUSTEP_USER_DIR_TOOLS" ]; 
 then GNUSTEP_USER_DIR_TOOLS="GNUstep/Tools"
fi
if [ -z "$GNUSTEP_USER_DIR_ADMIN_TOOLS" ]; 
 then GNUSTEP_USER_DIR_ADMIN_TOOLS="GNUstep/Tools/Admin"
fi
if [ -z "$GNUSTEP_USER_DIR_LIBRARY" ]; 
 then GNUSTEP_USER_DIR_LIBRARY="GNUstep/Library"
fi
if [ -z "$GNUSTEP_USER_DIR_HEADERS" ]; 
 then GNUSTEP_USER_DIR_HEADERS="GNUstep/Library/Headers"
fi
if [ -z "$GNUSTEP_USER_DIR_LIBRARIES" ]; 
 then GNUSTEP_USER_DIR_LIBRARIES="GNUstep/Library/Libraries"
fi
if [ -z "$GNUSTEP_USER_DIR_DOC" ]; 
 then GNUSTEP_USER_DIR_DOC="GNUstep/Library/Documentation"
fi
if [ -z "$GNUSTEP_USER_DIR_DOC_MAN" ]; 
 then GNUSTEP_USER_DIR_DOC_MAN="GNUstep/Library/Documentation/man"
fi
if [ -z "$GNUSTEP_USER_DIR_DOC_INFO" ]; 
 then GNUSTEP_USER_DIR_DOC_INFO="GNUstep/Library/Documentation/info"
fi

#
# Now, for all the GNUSTEP_USER_DIR_xxx variables above, replace:
#
#  %i with the userid
#  %u with the username
#  %% with %
#
# This allows you to, for example, specify the GNUSTEP_USER_TOOLS
# should be /GNUstep/Users/%u/bin/, and that would mean
# /GNUstep/Users/nicola/bin for user 'nicola' and
# /GNUstep/Users/richard/bin for user 'richard'.
#

# Check if any of the strings contain %i ...
case "${GNUSTEP_USER_DIR_APPS}\
 ${GNUSTEP_USER_DIR_ADMIN_APPS}\
 ${GNUSTEP_USER_DIR_WEB_APPS}\
 ${GNUSTEP_USER_DIR_TOOLS}\
 ${GNUSTEP_USER_DIR_ADMIN_TOOLS}\
 ${GNUSTEP_USER_DIR_LIBRARY}\
 ${GNUSTEP_USER_DIR_HEADERS}\
 ${GNUSTEP_USER_DIR_LIBRARIES}\
 ${GNUSTEP_USER_DIR_DOC}\
 ${GNUSTEP_USER_DIR_DOC_MAN}\
 ${GNUSTEP_USER_DIR_DOC_INFO}" in
  *%i*)
    # ... and if so, do the replacement.
    GNUSTEP__USERID=`id -u`
    GNUSTEP_USER_DIR_APPS=`echo ${GNUSTEP_USER_DIR_APPS}               | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_ADMIN_APPS=`echo ${GNUSTEP_USER_DIR_ADMIN_APPS}   | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_WEB_APPS=`echo ${GNUSTEP_USER_DIR_WEB_APPS}       | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_TOOLS=`echo ${GNUSTEP_USER_DIR_TOOLS}             | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_ADMIN_TOOLS=`echo ${GNUSTEP_USER_DIR_ADMIN_TOOLS} | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_LIBRARY=`echo ${GNUSTEP_USER_DIR_LIBRARY}         | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_HEADERS=`echo ${GNUSTEP_USER_DIR_HEADERS}         | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_LIBRARIES=`echo ${GNUSTEP_USER_DIR_LIBRARIES}     | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_DOC=`echo ${GNUSTEP_USER_DIR_DOC}                 | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_DOC_MAN=`echo ${GNUSTEP_USER_DIR_DOC_MAN}         | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    GNUSTEP_USER_DIR_DOC_INFO=`echo ${GNUSTEP_USER_DIR_DOC_INFO}       | sed -e "s/%i/${GNUSTEP__USERID}/g"`
    unset GNUSTEP__USERID;;
esac

# Check if any of the strings contain %u ...
case "${GNUSTEP_USER_DIR_APPS}\
 ${GNUSTEP_USER_DIR_ADMIN_APPS}\
 ${GNUSTEP_USER_DIR_WEB_APPS}\
 ${GNUSTEP_USER_DIR_TOOLS}\
 ${GNUSTEP_USER_DIR_ADMIN_TOOLS}\
 ${GNUSTEP_USER_DIR_LIBRARY}\
 ${GNUSTEP_USER_DIR_HEADERS}\
 ${GNUSTEP_USER_DIR_LIBRARIES}\
 ${GNUSTEP_USER_DIR_DOC}\
 ${GNUSTEP_USER_DIR_DOC_MAN}\
 ${GNUSTEP_USER_DIR_DOC_INFO}" in
  *%u*)
    # ... and if so, do the replacement.
    GNUSTEP__USERNAME=`id -u -n`
    GNUSTEP_USER_DIR_APPS=`echo ${GNUSTEP_USER_DIR_APPS}               | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_ADMIN_APPS=`echo ${GNUSTEP_USER_DIR_ADMIN_APPS}   | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_WEB_APPS=`echo ${GNUSTEP_USER_DIR_WEB_APPS}       | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_TOOLS=`echo ${GNUSTEP_USER_DIR_TOOLS}             | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_ADMIN_TOOLS=`echo ${GNUSTEP_USER_DIR_ADMIN_TOOLS} | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_LIBRARY=`echo ${GNUSTEP_USER_DIR_LIBRARY}         | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_HEADERS=`echo ${GNUSTEP_USER_DIR_HEADERS}         | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_LIBRARIES=`echo ${GNUSTEP_USER_DIR_LIBRARIES}     | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_DOC=`echo ${GNUSTEP_USER_DIR_DOC}                 | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_DOC_MAN=`echo ${GNUSTEP_USER_DIR_DOC_MAN}         | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    GNUSTEP_USER_DIR_DOC_INFO=`echo ${GNUSTEP_USER_DIR_DOC_INFO}       | sed -e "s/%u/${GNUSTEP__USERNAME}/g"`
    unset GNUSTEP__USERNAME;;
esac

# Check if any of the strings contain %% ...
case "${GNUSTEP_USER_DIR_APPS}\
 ${GNUSTEP_USER_DIR_ADMIN_APPS}\
 ${GNUSTEP_USER_DIR_WEB_APPS}\
 ${GNUSTEP_USER_DIR_TOOLS}\
 ${GNUSTEP_USER_DIR_ADMIN_TOOLS}\
 ${GNUSTEP_USER_DIR_LIBRARY}\
 ${GNUSTEP_USER_DIR_HEADERS}\
 ${GNUSTEP_USER_DIR_LIBRARIES}\
 ${GNUSTEP_USER_DIR_DOC}\
 ${GNUSTEP_USER_DIR_DOC_MAN}\
 ${GNUSTEP_USER_DIR_DOC_INFO}" in
  *%%*)
    # ... and if so, replace %% with %
    GNUSTEP_USER_DIR_APPS=`echo ${GNUSTEP_USER_DIR_APPS}               | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_ADMIN_APPS=`echo ${GNUSTEP_USER_DIR_ADMIN_APPS}   | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_WEB_APPS=`echo ${GNUSTEP_USER_DIR_WEB_APPS}       | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_TOOLS=`echo ${GNUSTEP_USER_DIR_TOOLS}             | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_ADMIN_TOOLS=`echo ${GNUSTEP_USER_DIR_ADMIN_TOOLS} | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_LIBRARY=`echo ${GNUSTEP_USER_DIR_LIBRARY}         | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_HEADERS=`echo ${GNUSTEP_USER_DIR_HEADERS}         | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_LIBRARIES=`echo ${GNUSTEP_USER_DIR_LIBRARIES}     | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_DOC=`echo ${GNUSTEP_USER_DIR_DOC}                 | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_DOC_MAN=`echo ${GNUSTEP_USER_DIR_DOC_MAN}         | sed -e 's/%%/%/g'`
    GNUSTEP_USER_DIR_DOC_INFO=`echo ${GNUSTEP_USER_DIR_DOC_INFO}       | sed -e 's/%%/%/g'`
    ;;
esac

#
# Now for all directories in the USER domain, check if they are
# relative; if so, consider them as subdirs of GNUSTEP_HOME.
#
case "$GNUSTEP_USER_DIR_APPS" in 
  /*) # An absolute path
      GNUSTEP_USER_APPS="$GNUSTEP_USER_DIR_APPS";;
   *) # Something else
      GNUSTEP_USER_APPS="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_APPS";;
esac
unset GNUSTEP_USER_DIR_APPS

case "$GNUSTEP_USER_DIR_ADMIN_APPS" in 
  /*) # An absolute path
      GNUSTEP_USER_ADMIN_APPS="$GNUSTEP_USER_DIR_ADMIN_APPS";;
   *) # Something else
      GNUSTEP_USER_ADMIN_APPS="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_ADMIN_APPS";;
esac
unset GNUSTEP_USER_DIR_ADMIN_APPS

case "$GNUSTEP_USER_DIR_WEB_APPS" in 
  /*) # An absolute path
      GNUSTEP_USER_WEB_APPS="$GNUSTEP_USER_DIR_WEB_APPS";;
   *) # Something else
      GNUSTEP_USER_WEB_APPS="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_WEB_APPS";;
esac
unset GNUSTEP_USER_DIR_WEB_APPS

case "$GNUSTEP_USER_DIR_TOOLS" in 
  /*) GNUSTEP_USER_TOOLS="$GNUSTEP_USER_DIR_TOOLS";;
   *) GNUSTEP_USER_TOOLS="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_TOOLS";;
esac
unset GNUSTEP_USER_DIR_TOOLS

case "$GNUSTEP_USER_DIR_ADMIN_TOOLS" in 
  /*) GNUSTEP_USER_ADMIN_TOOLS="$GNUSTEP_USER_DIR_ADMIN_TOOLS";;
   *) GNUSTEP_USER_ADMIN_TOOLS="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_ADMIN_TOOLS";;
esac
unset GNUSTEP_USER_DIR_ADMIN_TOOLS

case "$GNUSTEP_USER_DIR_LIBRARY" in 
  /*) GNUSTEP_USER_LIBRARY="$GNUSTEP_USER_DIR_LIBRARY";;
   *) GNUSTEP_USER_LIBRARY="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_LIBRARY";;
esac
unset GNUSTEP_USER_DIR_LIBRARY

case "$GNUSTEP_USER_DIR_HEADERS" in 
  /*) GNUSTEP_USER_HEADERS="$GNUSTEP_USER_DIR_HEADERS";;
   *) GNUSTEP_USER_HEADERS="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_HEADERS";;
esac
unset GNUSTEP_USER_DIR_HEADERS

case "$GNUSTEP_USER_DIR_LIBRARIES" in 
  /*) GNUSTEP_USER_LIBRARIES="$GNUSTEP_USER_DIR_LIBRARIES";;
   *) GNUSTEP_USER_LIBRARIES="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_LIBRARIES";;
esac
unset GNUSTEP_USER_DIR_LIBRARIES

case "$GNUSTEP_USER_DIR_DOC" in 
  /*) GNUSTEP_USER_DOC="$GNUSTEP_USER_DIR_DOC";;
   *) GNUSTEP_USER_DOC="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_DOC";;
esac
unset GNUSTEP_USER_DIR_DOC

case "$GNUSTEP_USER_DIR_DOC_MAN" in 
  /*) GNUSTEP_USER_DOC_MAN="$GNUSTEP_USER_DIR_DOC_MAN";;
   *) GNUSTEP_USER_DOC_MAN="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_DOC_MAN";;
esac
unset GNUSTEP_USER_DIR_DOC_MAN

case "$GNUSTEP_USER_DIR_DOC_INFO" in 
  /*) GNUSTEP_USER_DOC_INFO="$GNUSTEP_USER_DIR_DOC_INFO";;
   *) GNUSTEP_USER_DOC_INFO="$GNUSTEP_HOME/$GNUSTEP_USER_DIR_DOC_INFO";;
esac
unset GNUSTEP_USER_DIR_DOC_INFO
