using Toybox.WatchUi;

class RelaxState extends State {

	var countdown;

	function initialize() {
	   	debug("Switching to Relax State.");
		
		State.initialize();

		appActivityHelper.diveActive.save(1);
		appActivityHelper.addLap();
		appActivityHelper.description.save(WatchUi.loadResource(Rez.Strings.phase3) + (currentTrainingSession.round + 1));
		appActivityHelper.diveActive.save(0);
		

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