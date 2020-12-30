using Toybox.WatchUi;

class HomeState extends State {

	function initialize() {
	  	debug("Switching to Home state.");
	  	
		State.initialize();
		
		currentTraining = new Training();
		
		// TODO stopRecording  clear Recording;
		appActivityHelper.stopRecording();
		
		// Keep the AppView on the stack.  Probably not necessary.
		WatchUi.pushView(
			new HomeView(),
			new HomeDelegate(self),
			WatchUi.SLIDE_IMMEDIATE);
	}
	

    function switchToPrepare() {
    	var newState = new PrepareState();   
    }
}