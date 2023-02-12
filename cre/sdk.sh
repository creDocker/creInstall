#!/usr/bin/env bash 

#/bin/bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh; sdk version"

source ${SDKMAN_DIR}/bin/sdkman-init.sh
sdk $@
