#!/usr/bin/env bash 

echo "SDK VERSION:"
echo ""
echo $(/cre/sdk.sh version)
echo ""

#22.04
SDK_VERSION=$(/cre/sdk.sh version | grep script | sed -e 's|script: ||')
if [ -z "$SDK_VERSION" ]; then
    #20.04
    SDK_VERSION=$(/cre/sdk.sh version | grep version | sed -e 's|SDKMAN!: cli version: ||' -e 's|; native extensions:.*||')
fi
if [ -z "$SDK_VERSION" ]; then
    #18.04 / 16.04
    SDK_VERSION=$(/cre/sdk.sh version | grep SDKMAN | grep -v available | sed -e 's|SDKMAN ||' | sed $'s/\e\\[[0-9;:]*[a-zA-Z]//g')
fi
echo "Current SDKMAN version detected: $SDK_VERSION"
SDK_SUBPATH=u$UBUNTU_VERSION/sdkman/v$SDK_VERSION

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

# may delete older files, only keep 3 versions #rm echo for executing
currentDir="$(pwd)"
cd "$currentRoot/cre/versions/u$UBUNTU_VERSION/sdkman/"
ls -t | tail -n +4 | xargs echo rm -rf --
ls -tr | head -n -3 | xargs echo rm -rf --
#ls -tr | tail -n -4 | xargs echo rm -rf --
#ls -tr | head -n +4 | xargs echo rm -rf --
#ls -v | tail -n +4 | xargs echo rm -rf --
ls -v | head -n -3 | xargs echo rm -rf --
#ls -v | tail -n -4 | xargs echo rm -rf --
#ls -v | head -n +4 | xargs echo rm -rf --
ls -rv | tail -n +4 | xargs echo rm -rf --
echo ""

echo ""
cd "$currentDir"



