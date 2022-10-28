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



class App extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
        // Store the App object for the debug function.
        app = self;
        appActivityHelper = new AppActivityHelper();
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
