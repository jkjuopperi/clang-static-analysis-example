#!/bin/sh


LLVM_DIR=/opt/brew/Cellar/llvm/3.2
PATH=${LLVM_DIR}/bin:${LLVM_DIR}/share/clang/tools/scan-build:${LLVM_DIR}/share/clang/tools/scan-view:${PATH}

rm -rf 'build' 'report'
mkdir -p 'build' 'report'
cd 'build'

cmake -DCMAKE_C_COMPILER=`which ccc-analyzer` -DCMAKE_BUILD_TYPE=Debug ..
scan-build --use-analyzer=${LLVM_DIR}/bin/clang --view -o ${PWD}/report make
