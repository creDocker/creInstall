#!/usr/bin/env bash 

#/bin/bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh; sdk version"

## source ${SDKMAN_DIR}/bin/sdkman-init.sh
## sdk $@

JAVA_FAMILY=open
# JAVA_FAMILY="tem"
# JAVA_FAMILY="grl"   ## GraalVM  >=19
# JAVA_FAMILY="$@"

/cre/sdk.sh list java

echo "possible families for version ${JAVA_VERSION}:"
/cre/sdk.sh list java | grep " ${JAVA_VERSION}\..*-.*" | cut --delimiter=\| --fields=4 | sed 's/ *//g' | sort -u

echo "possible versions for family ${JAVA_FAMILY}:"
/cre/sdk.sh list java | grep " .*\..*-${JAVA_FAMILY}" | cut --delimiter=\| --fields=3 | sed 's/ *//g' | sed 's/\..*//g' | sort -u -n

##SDK_JAVA="$(/cre/sdk.sh list java | grep ' ${JAVA_VERSION}\..*-${JAVA_FAMILY}' | head -n 1 | cut --delimiter=\| --fields=6 | sed 's/ *//g' 2>&1)"
#SDK_JAVA="$(/cre/sdk.sh list java | grep ' 11\..*-open' | head -n 1 | cut --delimiter=\| --fields=6 |sed 's/ *//g' 2>&1)"
##SDK_JAVA="$(/cre/sdk.sh list java | grep ' ${JAVA_VERSION}\..*-open' | head -n 1 | cut --delimiter=\| --fields=6 |sed 's/ *//g' 2>&1)"
SDK_JAVA="$(/cre/sdk.sh list java | grep ' 11\..*-${JAVA_FAMILY}' | head -n 1 | cut --delimiter=\| --fields=6 |sed 's/ *//g' 2>&1)"
##SDK_JAVA="$(/cre/sdk.sh list java | grep \" ${JAVA_VERSION}\..*-${JAVA_FAMILY}\" | head -n 1 | cut --delimiter=\| --fields=6 | sed 's/ *//g' 2>&1)"



COMMAND=" /cre/sdk.sh list java | grep ' ${JAVA_VERSION}\..*-${JAVA_FAMILY}' | head -n 1 | cut --delimiter=\| --fields=6 | sed 's/ *//g' "
echo $COMMAND
#SDK_JAVA="$($COMMAND)"
SDK_JAVA=$(eval "$COMMAND")


echo "java-base: $JAVA_VERSION"
echo "java-sdk : $SDK_JAVA"


## TODO check if $SDK_JAVA is set 
## /cre/sdk.sh install java $SDK_JAVA

