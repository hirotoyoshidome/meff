#!/bin/sh

BIN_PATH=./bin/meff
INSTALL_DIR=~/.local/bin/

nimble build

cp ${BIN_PATH} ${INSTALL_DIR}
chmod 755 ${INSTALL_DIR}

echo 'echo export PATH=$PATH:~/.local/bin'

