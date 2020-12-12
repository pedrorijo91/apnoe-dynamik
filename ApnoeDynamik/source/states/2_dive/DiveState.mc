class DiveState extends State {

	function initialize() {
	   	debug("Switching to Dive State.");
	
		State.initialize();
		
		// Store startTime in training
		
		WatchUi.switchToView(
			new DiveView(stateStartedAt),
			State.defaultDelegate,
			WatchUi.SLIDE_IMMEDIATE);
	}
	
	function onAccept() {
    	debug("Accept pressed.  Will switch to RelaxState.");
    	
		nextStep();
    }
    
    function nextStep() {
    	debug("NextStep.  Will switch to RelaxState.");
    	
    	var newState = new RelaxState();   
    }
}