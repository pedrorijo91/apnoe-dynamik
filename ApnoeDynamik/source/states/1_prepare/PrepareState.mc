class PrepareState extends TimedState {
	
	function initialize() {
	   	debug("Switching to Prepare State.");
	   	
		TimedState.initialize(currentTraining.prepareDuration);
		
		var view = new PrepareView(stateStartedAt, currentTraining.prepareDuration);
		
		WatchUi.switchToView(
			view,
			State.defaultDelegate,
			WatchUi.SLIDE_IMMEDIATE);
	}
	
	
	function onAccept() {
    	debug("Accept pressed.  Will switch to nextStep.");

		nextStep();
    }
    
    
    function nextStep() {
    	debug("NextStep.  Will switch to DiveState.");
    	
    	var newState = new DiveState();   
    }
}