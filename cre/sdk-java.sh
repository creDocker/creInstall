#!/usr/bin/env bash 

#/bin/bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh; sdk version"

## source ${SDKMAN_DIR}/bin/sdkman-init.sh
## sdk $@

/cre/sdk.sh list java

SDK_JAVA="$(/cre/sdk.sh list java | grep ' 11\..*-open' | head -n 1 | cut --delimiter=\| --fields=6 |sed 's/ *//g')"

echo "java-base: $JAVA_VERSION"
echo "java-sdk : $SDK_JAVA"

