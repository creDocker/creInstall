#!/usr/bin/env bash 

SDK_VERSION=$(/cre/sdk.sh version | grep version | sed -e 's|SDKMAN!: cli version: ||' -e 's|; native extensions:.*||')

SDK_SUBPATH=u$UBUNTU_VERSION/v$SDK_VERSION

echo "Current dir: $(pwd)"
#echo "Current env: $(env)"
currentRoot=""
if [ ! -z $GITHUB_REPOSITORY ]; then
    currentRoot="$(pwd)"
fi

echo "checking for $currentRoot/cre/versions/$SDK_SUBPATH"
ls -l /cre/sdkman-install.sh


# create directory if not exists
if [ ! -d "$currentRoot/cre/versions/$SDK_SUBPATH" ]; then
    echo "SDKMAN script Directory $SDK_SUBPATH will be created."
    mkdir -p "$currentRoot/cre/versions/$SDK_SUBPATH"
else
    echo "SDKMAN script Directory $SDK_SUBPATH exists."
fi

# download file if not exists
if [ ! -f "$currentRoot/cre/versions/$SDK_SUBPATH/sdkman-install.sh" ]; then
    echo "SDKMAN script $SDK_SUBPATH will be copied."
    cp /cre/sdkman-install.sh "$currentRoot/cre/versions/$SDK_SUBPATH/sdkman-install.sh"
else
    echo "SDKMAN script $SDK_SUBPATH exists."
fi




