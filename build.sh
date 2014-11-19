#!/usr/bin/env bash
SDK="iphoneos"
APP_NAME="CISample"
CONFIGURATION="Release"

echo "clean Build ..."
if [ -e $PWD/Build ]; then
	echo "Build folder is existed"
	rm -rf $PWD/Build
fi


echo "build..."
xcodebuild -project CISample.xcodeproj -scheme CISample -configuration $CONFIGURATION -derivedDataPath . CODE_SIGNING_REQUIRED=NO

echo "package ipa..."
CI_APP_ROOT=$PWD/Build/Products/$CONFIGURATION-iphoneos
CI_APP_FILE=$CI_APP_ROOT/$APP_NAME.app
CI_IPA_FILE=$CI_APP_ROOT/$APP_NAME.ipa
/usr/bin/xcrun -sdk $SDK PackageApplication -v $CI_APP_FILE -o $CI_IPA_FILE


echo "copy plist..."
PLIST_FILE=$PWD/$APP_NAME/Info.plist
cp $PLIST_FILE $CI_APP_ROOT/


echo "zip dSYM..."
DSYM_FILE=$CI_APP_ROOT/$APP_NAME.app.dSYM
zip -r $CI_APP_ROOT/$APP_NAME.app.dSYM.zip $DSYM_FILE

echo "finished"




