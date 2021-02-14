using Toybox.Timer;
using Toybox.WatchUi;

class AutoUpdateView extends WatchUi.View {
	    
    var timer;
    
    function initialize() {
    	WatchUi.View.initialize();
    }
    

	// Automatically requests a display update every intervall.
	// Implement onTimer() to get a callback as well.
	function autoUpdate(intervall) {
    	if (timer == null) {
    		debug("New Timer for autoUpdate");
			timer = new Timer.Timer();
		} else {
			timer.stop();
		}
		timer.start(method(:_onAutoUpdate), intervall, true);
	}
	
	function _onAutoUpdate() {
		WatchUi.requestUpdate();
		onAutoUpdate();
	}
	
	function onAutoUpdate() {
		// Don't do anything here.
		// child classes can overwrite this function.
		debug("onAutoUpdate");
	}
	
	// Automatically called by the system, when the view "stops".
	// We stop and remove our timer here.
	function onHide() {
	    debug("StateView onHide");
   		debug("Releasing autoUpdate Timer.");
		if (timer != null) {
			timer.stop();
		}
		timer = null;
		WatchUi.View.onHide();
	}
}