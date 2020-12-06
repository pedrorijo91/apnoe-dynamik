class PrepareState extends TimedState {
	
	function initialize() {
	   	debug("Switching to Prepare State.");
	   	
		TimedState.initialize(training.prepareDuration);
		
		// Store startTime in training
		
		WatchUi.switchToView(
			new PrepareView(self, training),
			State.defaultDelegate,
			WatchUi.SLIDE_IMMEDIATE);
	}
	
	function onAccept() {
    	debug("Accept pressed.  Will switch to nextStep.");

		nextStep();
    }
    
    function onUpdateTimedState(timeInState, remainingTime) {
    	// Überschreiben der Funktion um z.B. beeps durchzuführen.
    	if (remainingTime < 2000) {
    		debug("BEEP");
    	}
	}	
    
    function nextStep() {
    	debug("NextStep.  Will switch to DiveState.");
    	
    	var newState = new DiveState();   
    }
}