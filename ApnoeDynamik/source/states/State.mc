using Toybox.Timer;

class State {
	
	public static var activeState;
	public static var defaultDelegate;
	
	static var training;
	
	static var viewTimer;
	
	var stateStartedAt;
	
	function initialize() {
		debug("Entering new state.");

		activeState = self;
		
		stateStartedAt = System.getTimer();
		
		if (viewTimer == null) {
			viewTimer = new Timer.Timer();
		} else {
			viewTimer.stop();
		}
		
		viewTimer.start(method(:onTimer), 1000, true);
	}
	
	
	
	function onTimer() {
		debug("onTimer called");
		WatchUi.requestUpdate();
		
		var timeInState = System.getTimer() - stateStartedAt;
		
		debug("In state since: " + timeInState);
		onUpdate(timeInState);
	}
	
	
	
	function onUpdate(timeInState) {
		debug("onUpdate called with (" + timeInState + ")");
	}	
	
	function onMenu() {
		debug("onMenu ignored");
    	return true;
    }
    
    function onBack() {
    	debug("onBack ignored");
    	return true;
    }
    
    function onAccept() {
		debug("onAccept ignored");
    	return true;
    }
    
    function onDown() {
		debug("onDown ignored");
    	return true;
    }    
}