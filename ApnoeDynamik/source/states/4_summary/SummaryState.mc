using Toybox.WatchUi;

class SummaryState extends State {

	function initialize() {
	   	debug("Switching to Summary State.");
		
		State.initialize();

		appActivityHelper.stopRecording();
				
		var summaryView = new SummaryView();
		var delegate = new SummaryDelegate(self, summaryView);

		WatchUi.switchToView(
			summaryView,
			delegate,
			WatchUi.SLIDE_IMMEDIATE);
	}
	
	function save() {
		appActivityHelper.save();
		switchToHomeState();
	}
	
	function switchToHomeState() {
		var newState = new HomeState();
	}
	
	function askSave() {
		var newState = new AskSaveState();
	}
}