using Toybox.WatchUi;

class HomeState extends State {

	function initialize() {
	  	debug("Switching to Home state.");
	  	
		State.initialize();
		
		reloadTraining();
		currentTrainingSession = null;

		// In case we return from the prepare state (or start a new training-session -- shouldn't be necessary, just to be safe)
		appActivityHelper.stopAndClearRecording();
		
		// Keep the AppView on the stack.  Probably not necessary.
		WatchUi.pushView(
			new HomeView(self),
			new HomeDelegate(self),
			WatchUi.SLIDE_IMMEDIATE);
	}
	
	function reloadTraining() {
		debug("Reloading Training");
		currentTraining = new Training(); 	
	}
	
	function viewReloaded() {
		reloadTraining();	
	}
	
    function switchToPrepare() {
    	var newState = new PrepareState();   
    }
}