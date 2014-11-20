#!/usr/bin/env bash
#DEVICE="b0d94970f15b8819f22aa2644168128ef30437e4"
DEVICE="778B3995-9217-4BC0-93CB-25D3725DF891"
TEMPLATE="/Applications/Xcode.app/Contents/Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.xrplugin/Contents/Resources/Automation.tracetemplate"
APP="$PWD/Build/Products/Release-iphoneos/CISample.app"
SCRIPT="/Users/twer/macspace/ios8books/CISample/acceptence/app.js"

instruments -w $DEVICE -t $TEMPLATE $APP -e UIASCRIPT $SCRIPT 
