class RelaxState extends TimedState {

	function initialize() {
	   	debug("Switching to Relax State.");
	
		var relaxDuration = currentTraining.relaxDurations[currentTrainingSession.round];
		TimedState.initialize(relaxDuration);
		
		WatchUi.switchToView(
			new RelaxView(stateStartedAt, relaxDuration),
			State.defaultDelegate,
			WatchUi.SLIDE_IMMEDIATE);
	}
	
	function onAccept() {
	  	debug("Accept pressed.  Will switch to nextStep.");

		nextStep();
    }
    
    function nextRound() {
    	currentTrainingSession.round++;
		return currentTrainingSession.round < currentTraining.rounds();
    }
    
    function nextStep() {
    	debug("NextStep.  Will switch to DiveState or SummaryState.");
    	
    	var shouldSwitchToDive = nextRound();
    	if (shouldSwitchToDive) {
    		var newState = new DiveState();
    	} else {
    		// var newState = new SummaryState();
    	}
    }
}