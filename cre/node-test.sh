sleep 2

if [ ! -f /cre/versions.txt ]; then
    echo "[FAIL]: File /cre/versions.txt not found!"
    exit 1
fi

cat /cre/versions.txt

##if [ ! -f /cre/node-procfile ]; then
##    echo "[FAIL]: File /cre/node-procfile not found!"
##    exit 1
##fi

## check NODE_VERSION
isInFile=$(cat /cre/versions.txt | grep "node")
if [ -z "$isInFile" ]; then
    echo "[FAIL]: node not installed!"
    #exit 1
fi
anyVersion=$(echo $isInFile | sed -e 's|.*node.* v.*\..*\..*|v1.2.3|')
if [[ "$anyVersion" = "v1.2.3" ]]; then
   echo "[SUCCESS]: some node version found!"
else
   echo "[FAIL]: no node version found!"
fi
rightVersion=$(echo $isInFile | sed -e 's|.*node.* v${NODE_VERSION}\..*\..*|vXX.2.3|')
if [[ "$anyVersion" = "vXX.2.3" ]]; then
   echo "[SUCCESS]: right node version found!"
else
   echo "[FAIL]: wrong node version found!"
fi

## check npm
isInFile=$(cat /cre/versions.txt | grep "npm")
if [ -z "$isInFile" ]; then
    echo "[FAIL]: npm not installed!"
    #exit 1
fi

anyVersion=$(echo $isInFile | sed -e 's|.*sdk.* .*\..*\..*|1.2.3|')
if [[ "$anyVersion" = "1.2.3" ]]; then
   echo "[SUCCESS]: some npm version found!"
else
   echo "[FAIL]: no npm version found!"
fi

echo "[SUCCESS]"
exit 0
