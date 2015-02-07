#!/bin/sh
if [ "$WERCKER_GRAILS_COMMIT" != "" ]
then
 echo "parent -> run.sh" 
else
 WERCKER_GRAILS_COMMIT=721dba7b99de0f092a228bf5ca226ffc82ef261f
fi
mkdir target
cd target
echo "--- GIT CLONE & INSTALL GRAILS $(pwd) ---"
# git clone https://github.com/grails/grails-core.git ./
git clone https://github.com/sovlin/grails-core.git ./
echo "--- CHANGE COMMIT $WERCKER_GRAILS_COMMIT ---"
# mv ./grails-core/* ./
# rm -r ./grails-core
git show $WERCKER_GRAILS_COMMIT
git checkout $WERCKER_GRAILS_COMMIT
./gradlew install
GRAILS_HOME=$(pwd)"/bin"
echo "GRAILS_HOME=$GRAILS_HOME"