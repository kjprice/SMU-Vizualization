#!/bin/bash

# TODO: Pull in core stuff /Applications/Processing.app/Contents/Java/core/library and run in eclipes
cd application.macosx/source/
APPDIR=../Final.app/Contents/Java
echo "$APPDIR/core.jar"
javac \
	-cp ".:$APPDIR:$APPDIR/core.jar:$APPDIR/Final.jar:$APPDIR/gluegen-rt-natives-macosx-universal.jar:$APPDIR/gluegen-rt.jar:$APPDIR/jogl-all-natives-macosx-universal.jar:$APPDIR/jogl-all.jar" Final.java