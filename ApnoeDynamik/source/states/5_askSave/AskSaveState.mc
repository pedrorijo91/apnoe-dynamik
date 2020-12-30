using Toybox.WatchUi;

class AskSaveState extends State {

	hidden const askSaveQuestion = WatchUi.loadResource(Rez.Strings.saveActivityQuestion);

	
	function initialize() {
	   	debug("Switching to AskSave State.");
		
		State.initialize();
		
		var view = new AskSaveView();
		var delegate = new AskSaveDelegate();

		WatchUi.switchToView(
			view,
			delegate,
			WatchUi.SLIDE_IMMEDIATE);
			
		
		var confirmationView = new WatchUi.Confirmation(askSaveQuestion);
		var confirmationDelegate = new AskSaveConfirmationDelegate(self);
		WatchUi.pushView(
			confirmationView,
			confirmationDelegate,
			WatchUi.SLIDE_IMMEDIATE);

	}

	function save() {
		appActivityHelper.save();
		switchToHomeState();
	}
	
	function noSave() {
		appActivityHelper.stopAndClearRecording();
		switchToHomeState();
	}
	
	hidden function switchToHomeState() {
		var newState = new HomeState();
	}
}