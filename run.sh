#!/bin/sh
if [ $WERCKER_GRAILS_VERSION ]
then
    if [ "$WERCKER_GRAILS_VERSION" == "2.4.4" ]
    then
      GRAILS_HOME=/lib/grails-$WERCKER_GRAILS_VERSION
    elif [ "$WERCKER_GRAILS_VERSION" == "3.0.0.M1" ]
    then
      GRAILS_HOME=/lib/grails-$WERCKER_GRAILS_VERSION
    elif [ "$WERCKER_GRAILS_VERSION" == "3.0.0.BUILD-SNAPSHOT" ]
    then
      if [ $WERCKER_GRAILS_COMMIT ]
      then
        source ./grails-snapshot-run.sh
      else
        echo "commit:<not set>"
      fi
    else
      echo "unknown version:$WERCKER_GRAILS_VERSION"
    fi
    export JAVA_HOME=/usr/lib/jvm/java-8-oracle
    export PATH="$PATH:$JAVA_HOME/bin"
    export PATH="$PATH:$GRAILS_HOME/bin"
    grails $WERCKER_GRAILS_OPTIONS
else
    echo "version:<not set>"
fi