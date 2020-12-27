using Toybox.Application;
using Toybox.FitContributor;

var app;

// println is a function of System.
// All monkey-c classes inherit from System, but we cannot call System.println from outside an object.
// We store the app-Object in the var app.  (See App.initialize).
// Then we call the public function app.debug (see below), which outputs the debugText by calling System.println.
function debug(debugText) {
	app.debug(debugText);
}


const FIELD_AVG_HR = "avHR";
const FIELD_DESC = "desc";
const FIELD_DIST = "dist";

var activityFields = [
	new ActivityField(FIELD_AVG_HR, FitContributor.DATA_TYPE_UINT16, "bpm", FitContributor.MESG_TYPE_LAP, null),
	new ActivityField(FIELD_DESC, FitContributor.DATA_TYPE_STRING, null, FitContributor.MESG_TYPE_LAP, "PREPARE"),
	new ActivityField(FIELD_DIST, FitContributor.DATA_TYPE_UINT16, "m", FitContributor.MESG_TYPE_SESSION, null)
];



class App extends Application.AppBase {
	
	function initialize() {
    	AppBase.initialize();
    	// Store the App object for the debug function.
    	app = self;
    }
    
    static function saveActivityValue(name, value) {
    	for (var i = 0; i < activityFields.size(); i++) {
    		var currentField = activityFields[i];
    		if (currentField.name == name) {
    			currentField.save(value);
    			return;
    		}
    	}
    }
    
    // Used by the debug function (see above).
    public function debug(debugText) {
    	System.println(debugText);
    }

    // onStart() is called on application start up
    function onStart(state) {
    
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
    	debug("Starting our initial views.");
    	return [ new AppView(), new AppDelegate() ];
    }

}
