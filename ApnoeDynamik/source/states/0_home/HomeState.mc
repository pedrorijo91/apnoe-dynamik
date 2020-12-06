using Toybox.WatchUi;

class HomeState extends State {

	function initialize() {
	  	debug("Switching to Home state.");

		State.initialize();
		
		// Keep the AppView on the stack.  Probably not necessary.
		WatchUi.pushView(
			new HomeView(),
			State.defaultDelegate,
			WatchUi.SLIDE_IMMEDIATE);
	}
	
    function onCancel() {
 	   	debug("Need to save settings and close app.");
    }
    
    function onAccept() {
    	debug("Accept pressed.  Will switch to PrepareState.");
    	
    	// Build the Training object.
    	training = new Training();
    	var newState = new PrepareState();   
    }
    
    function getModus() {
    	return "hallo";
    }
}