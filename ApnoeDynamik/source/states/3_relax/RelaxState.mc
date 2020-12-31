class RelaxState extends State {

	var countdown;

	function initialize() {
	   	debug("Switching to Relax State.");
		
		State.initialize();

		appActivityHelper.addLap();
		appActivityHelper.description.save("RELAX " + currentTrainingSession.round + 1);
		

		var relaxDuration = currentTraining.prepareAndRelaxDurations[currentTrainingSession.round];
		countdown = new Countdown(self, relaxDuration);
		
		WatchUi.switchToView(
			new RelaxView(countdown),
			new RelaxDelegate(self),
			WatchUi.SLIDE_IMMEDIATE);
	}

		
	function onStateLeave() {
		countdown.stop();
	}

	
	function timeExpired() {
		switchToDive();
	}
	
		
	function togglePause() {
		countdown.togglePause();
	}
	
	    
    function switchToDive() {
    	debug("switchToDive");

   		var newState = new DiveState();
    }
    
    function switchToSummary() {
    	debug("switchToSummary");
    	
    	var newState = new SummaryState();
    }
}