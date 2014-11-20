var testName = "Test 1";
var target = UIATarget.localTarget();
var app = target.frontMostApp();
var window = app.mainWindow();

UIALogger.logStart( testName );
app.logElementTree();

//-- select the elements
UIALogger.logMessage( "Select the News tab" );
var tabBar = app.tabBar();
var selectedTabName = tabBar.selectedButton().name();
if (selectedTabName != "News") {
    tabBar.buttons()["News"].tap();
}

var textField = window.textFields()[0];
var expectText = "hi, guy. This is cool! U write a UI test.";
textField.setValue(expectText);
textField.set

target.delay( 2 );
UIALogger.logMessage( "Dismiss the keyboard" );
app.logElementTree();
app.keyboard().buttons()["Return"].tap();

var labelVal = window.staticTexts()[expectText].value();
if (labelVal == expectText) {
    UIALogger.logPass(testName); 
} else {
    UIALogger.logFail(testName);
}
