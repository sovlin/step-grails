#!/bin/bash
if [ "$WERCKER_GRAILS_COMMIT" != "" ]
then
 echo "parent -> run.sh" 
else
 WERCKER_GRAILS_COMMIT=f711ff27fdedf7e41c54fef79f5ffc9ea57bfcfa
fi
mkdir target
cd target
echo "--- GIT CLONE & INSTALL GRAILS $(pwd) ---"
git clone $WERCKER_GRAILS_DEPOGIT ./
echo "--- CHANGE COMMIT $WERCKER_GRAILS_COMMIT ---"
# mv ./grails-core/* ./
# rm -r ./grails-core
git show $WERCKER_GRAILS_COMMIT
git checkout $WERCKER_GRAILS_COMMIT
./gradlew install
GRAILS_HOME=$(pwd)
echo "GRAILS_HOME=$GRAILS_HOME"
cd ..