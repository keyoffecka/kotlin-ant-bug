#!/bin/bash

set +h
set -u
set -e

cd $(dirname $0)

TARGET_DIR=$PWD/target
CLASSES_DIR=$TARGET_DIR/classes
TEST_CLASSES_DIR=$TARGET_DIR/test-classes
LIB_DIR=$PWD/lib
EXT_LIB_DIR=${LIB_DIR}/ext
TOOL_LIB_DIR=${LIB_DIR}/tool
COMPILE_LIB_DIR=${LIB_DIR}/compile
TEST_LIB_DIR=${LIB_DIR}/test

KOTLIN_VERSION=1.0.4
SRC_DIR=$PWD/src/main/kotlin
TEST_DIR=$PWD/src/test/kotlin

rm -fr $CLASSES_DIR || true
rm -fr $TEST_CLASSES_DIR || true

mkdir $CLASSES_DIR
mkdir $TEST_CLASSES_DIR

CP=$COMPILE_LIB_DIR/kotlin-stdlib-$KOTLIN_VERSION.jar

java -jar $TOOL_LIB_DIR/kotlin-compiler-$KOTLIN_VERSION.jar -d $CLASSES_DIR -classpath $CP $SRC_DIR 

CP=$COMPILE_LIB_DIR/kotlin-runtime-$KOTLIN_VERSION.jar
for file in $TEST_LIB_DIR/*.jar ; do
  CP=$CP:$file
done

CP=$CP:$CLASSES_DIR

java -jar $TOOL_LIB_DIR/kotlin-compiler-$KOTLIN_VERSION.jar -d $TEST_CLASSES_DIR -classpath $CP $TEST_DIR 
