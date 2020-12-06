class RelaxState extends TimedState {

	function initialize() {
	   	debug("Switching to Relax State.");
	
		TimedState.initialize(training.relaxDurations[training.round]);
		
		WatchUi.switchToView(
			new RelaxView(training),
			State.defaultDelegate,
			WatchUi.SLIDE_IMMEDIATE);
	}
	
	function onAccept() {
	  	debug("Accept pressed.  Will switch to nextStep.");

		nextStep();
    }
    
    function nextRound() {
    	training.round++;
		return training.round < training.relaxDurations.size();
    }
    
    function nextStep() {
    	debug("NextStep.  Will switch to DiveState or SummaryState.");
    	
    	var switchToDive = nextRound();
    	if (switchToDive) {
    		var newState = new DiveState();
    	} else {
    		// var newState = new SummaryState();
    	}
    }
}