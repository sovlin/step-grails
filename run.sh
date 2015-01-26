#!/bin/sh
if [ $WERCKER_GRAILS_VERSION -eq "snapshot" ]
then
  GRAILS_HOME=/lib/grails-snapshot
else
  GRAILS_HOME=/lib/grails
fi
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH="$PATH:$JAVA_HOME/bin"
export PATH="$PATH:$GRAILS_HOME/bin"
grails $WERCKER_GRAILS_OPTIONS
