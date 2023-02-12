sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

cat /cre/versions.txt

## check NODE_VERSION
isInFile=$(cat /cre/versions.txt | grep "node")
if [ -z "$isInFile" ]; then
    echo "[FAIL]: node not installed!"
    exit 1
fi
anyVersion=$(echo $isInFile | sed -e 's|.*node.* v.*\..*\..*|vx.y.z|')
if [[ "$anyVersion" = "vx.y.z" ]]; then
   echo "[SUCCESS]: some node version found!"
else
   echo "[FAIL]: no node version found!"
   exit 1
fi
rightVersion=$(echo $isInFile | sed -e "s|.*node.* v${NODE_VERSION}\..*\..*|v${NODE_VERSION}.y.z|")
if [[ "$rightVersion" = "v${NODE_VERSION}.y.z" ]]; then
   echo "[SUCCESS]: right node version found!"
else
   echo "[FAIL]: wrong node version found!"
   exit 1
fi

## check npm
isInFile=$(cat /cre/versions.txt | grep "npm")
if [ -z "$isInFile" ]; then
    echo "[FAIL]: npm not installed!"
    exit 1
fi

anyVersion=$(echo $isInFile | sed -e 's|.*npm.* .*\..*\..*|1.2.3|')
if [[ "$anyVersion" = "1.2.3" ]]; then
   echo "[SUCCESS]: some npm version found!"
else
   echo "[FAIL]: no npm version found!"
   exit 1
fi

## check sdk
isInFile=$(cat /cre/versions.txt | grep "sdk")
if [ -z "$isInFile" ]; then
    echo "[FAIL]: sdk not installed!"
    exit 1
fi

anyVersion=$(echo $isInFile | sed -e 's|.*sdk.* .*\..*\..*|1.2.3|')
if [[ "$anyVersion" = "1.2.3" ]]; then
   echo "[SUCCESS]: some sdk version found!"
else
   echo "[FAIL]: no sdk version found!"
   exit 1
fi

## check if sdk works by installing kotlin
/cre/sdk.sh install kotlin
/cre/sdk.sh list kotlin
kotlinPath=$(/cre/sdk.sh home kotlin current)/bin
#$kotlinPath/kotlinc -help
##kotlinc-jvm 1.8.0 (JRE 1.8.0_352-8u352-ga-1~20.04-b08)
#$kotlinPath/kotlinc -version
kotlinVersion=$(${kotlinPath}/kotlinc -version 2>&1)
kotlinCheck=$(echo ${kotlinVersion} | sed -e 's|kotlinc-jvm .*\..*\..* (.*)|x.y.z|')
if [[ "$kotlinCheck" = "x.y.z" ]]; then
   echo "[SUCCESS]: some kotlin version found!"
else
   echo "[FAIL]: no kotlin version found! ($kotlinVersion)"
   exit 1
fi

##exit 1
echo "[SUCCESS]"
exit 0
