#!/bin/bash
if [ "$WERCKER_GRAILS_COMMIT" != "" ]
then
 echo "parent -> run.sh" 
else
 WERCKER_GRAILS_COMMIT=f711ff27fdedf7e41c54fef79f5ffc9ea57bfcfa
fi
mkdir .target-grails-snapshot
cd .target-grails-snapshot
echo "--- GIT CLONE & INSTALL GRAILS $(pwd) ---"
git clone $WERCKER_GRAILS_DEPOGIT ./
echo "--- CHANGE COMMIT $WERCKER_GRAILS_COMMIT ---"
if git cat-file -e $WERCKER_GRAILS_COMMIT 2> /dev/null
then 
  echo "Commit $WERCKER_GRAILS_COMMIT exists !"
  git checkout $WERCKER_GRAILS_COMMIT
  ./gradlew install
  GRAILS_HOME=$(pwd)
  echo "GRAILS_HOME=$GRAILS_HOME"
  cd ..
else 
  echo "Missing commit $WERCKER_GRAILS_COMMIT"
  exit 1
fi