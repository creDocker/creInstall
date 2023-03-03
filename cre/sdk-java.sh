#!/usr/bin/env bash 

#/bin/bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh; sdk version"

## source ${SDKMAN_DIR}/bin/sdkman-init.sh
## sdk $@

# JAVA_FAMILY=open
# JAVA_FAMILY="tem"
# JAVA_FAMILY="grl"   ## GraalVM  >=19
# JAVA_FAMILY="$@"
sdkfamily=$1
if [ -z "$sdkfamily" ]; then
 sdkfamily=$JAVA_FAMILY
fi
sdkversion=$2
if [ -z "$sdkversion" ]; then
 sdkversion=$JAVA_VERSION
fi

echo "possible families for version ${sdkversion}:"
/cre/sdk.sh list java | grep " ${sdkversion}\..*-.*" | cut --delimiter=\| --fields=4 | sed 's/ *//g' | sort -u | sed -z 's/\n/, /g'
echo -e "\n"

echo "possible versions for family ${sdkfamily}:"
/cre/sdk.sh list java | grep " .*\..*-${sdkfamily}" | cut --delimiter=\| --fields=3 | sed 's/ *//g' | sed 's/\..*//g' | sort -u -n | sed -z 's/\n/, /g'
echo -e "\n"

cmd=" /cre/sdk.sh list java | grep ' ${sdkversion}\..*-${sdkfamily}' | head -n 1 | cut --delimiter=\| --fields=6 | sed 's/ *//g' "
SDK_JAVA=$(eval "$cmd")

echo "java-base: $JAVA_VERSION"
echo "java-sdk : $SDK_JAVA"

## TODO check if $SDK_JAVA is set 
if [ -z "$SDK_JAVA" ]; then
   echo "[FAIL]: no corresponding java version (${sdkfamily}, #${sdkversion}) found!"
   /cre/sdk.sh list java
else
   /cre/sdk.sh install java $SDK_JAVA
fi
## 

