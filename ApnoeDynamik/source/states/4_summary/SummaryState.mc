using Toybox.WatchUi;

class SummaryState extends State {

	function initialize() {
	   	debug("Switching to Summary State.");
		
		State.initialize();

		appActivityHelper.addLap();
		appActivityHelper.description.save("Enter summary"); // ToDo Max resources...
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
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
	}
	
	function noSave() {
		appActivityHelper.stopAndClearRecording();
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
	}
	
	function askSave() {
		debug("askSave");
		var askSaveQuestion = WatchUi.loadResource(Rez.Strings.saveActivityQuestion);
		
		// method will return an invoke object.
    	// calling .invoke on the object is equivalent to calling the function itself.
    	ConfirmHelper.askQuestion(askSaveQuestion, method(:save), method(:noSave));
	}
}