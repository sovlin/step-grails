# step-grails [![wercker status](https://app.wercker.com/status/79f1e06351de502d3177040ce5aebcdd/s/master "wercker status")](https://app.wercker.com/project/bykey/79f1e06351de502d3177040ce5aebcdd)

Wercker step for box : sovlin/Grails-Last-Test

Exemple
-----------
    box: sovlin/Grails-Last-Test
    build:
      steps:
        - sovlin/grails:
            version: "2.4.4"
            options: help
Display help : similar to command "grails help"


You can make every command after "option: your grails command"

Choice your version

* version: "2.4.4"
* version: "3.0.0.M1"
* version: "BUILD-SNAPSHOT"

WARRNING !, for the version "BUILD-SNAPSHOT" the "commit: your num commit" is obligatory.

Exemple
-----------
    box: sovlin/Grails-Last-Test
    build:
      steps:
        - sovlin/grails:
            version: "BUILD-SNAPSHOT"
            commit: 721dba7b99de0f092a228bf5ca226ffc82ef261f
            options: compile
            

------------
Box Link
* [sovlin/Grails-Last-Test](https://app.wercker.com/#applications/54bef0a856767b466300069a/tab/details)

------------
Step Link :
* [sovlin/grails](https://app.wercker.com/#applications/54bfa58254bc9efd6b0a9df8/tab/details)
