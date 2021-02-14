using Toybox.Timer;

class State {
	
	public static var activeState;
	
//	static var training;
//	static var trainingSession;
	
	var stateStartedAt;
	
	function initialize() {
		debug("Entering new state.");

		if (activeState != null) {
			activeState.onStateLeave();
		}
		activeState = self;
		
		stateStartedAt = System.getTimer();
	}
	
	function onStateLeave() {
		// Don't do anything.
		// Allow subclasses to overwrite this function.
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