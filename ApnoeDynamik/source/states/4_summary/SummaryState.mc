class SummaryState extends State {

	function initialize() {
	   	debug("Switching to Summary State.");
		
		State.initialize();
		
		finalizeRecording();
		
		var summaryView = new SummaryView();
		var delegate = new SummaryDelegate(self, summaryView);

		WatchUi.switchToView(
			summaryView,
			delegate,
			WatchUi.SLIDE_IMMEDIATE);
	}
	
	static function finalizeRecording() {
		// TODO
	}
}