using Toybox.WatchUi;

class DiveState extends State {

	function initialize() {
	   	debug("Switching to Dive State.");
	
		State.initialize();
		
		appActivityHelper.addLap();
		appActivityHelper.description.save(WatchUi.loadResource(Rez.Strings.phase2) + (currentTrainingSession.round + 1));
		appActivityHelper.diveActive.save(1);

		
		// Store startTime in training
		
		WatchUi.switchToView(
			new DiveView(stateStartedAt),
			new DiveDelegate(self),
			WatchUi.SLIDE_IMMEDIATE);
	}

    
    function onStateLeave() {
    	debug("We are leaving the dive State.");
    	var diveTime = System.getTimer() - stateStartedAt;
    	debug("Storing the diveTime: " + diveTime + " in the current training session.");
    	currentTrainingSession.diveTimes.add(diveTime);

    	currentTrainingSession.round++;
    }
    
    
    function isNextSummary() {
    	// We increment the round when we leave the state.
		return (currentTrainingSession.round + 1) >= currentTraining.rounds();
    }
    
    function switchToRelaxOrSummary() {
    	debug("switchToRelaxOrSummary");
    	
    	if (isNextSummary()) {
    		debug("Training finished.  Switch to summary");
    		var newState = new SummaryState();
    	} else {
    		var newState = new RelaxState();
    	}
    }
}