#!/bin/sh
if [ "$1" ] && [ "$2" ]
then
  WERCKER_GRAILS_VERSION=$1
  WERCKER_GRAILS_OPTIONS=$2
  if [ "$3" ]
  then
    WERCKER_GRAILS_COMMIT=$3
  fi
fi
if [ "$WERCKER_GRAILS_VERSION" ]
then
    case "$WERCKER_GRAILS_VERSION" in
        "2.4.4" )
            GRAILS_HOME=/lib/grails-$WERCKER_GRAILS_VERSION;;
        "3.0.0.M1" )
            GRAILS_HOME=/lib/grails-$WERCKER_GRAILS_VERSION;;
        "BUILD-SNAPSHOT" )
            if [ "$WERCKER_GRAILS_COMMIT" ]
            then
                source ./grails-snapshot-run.sh
            else
                echo "commit:<not set>"
            fi;;
        * )
            echo "unknown version:$WERCKER_GRAILS_VERSION"
    esac
    export JAVA_HOME=/usr/lib/jvm/java-8-oracle
    export PATH="$PATH:$JAVA_HOME/bin"
    export PATH="$PATH:$GRAILS_HOME/bin"
    grails $WERCKER_GRAILS_OPTIONS
else
    echo "version:<not set>"
fi