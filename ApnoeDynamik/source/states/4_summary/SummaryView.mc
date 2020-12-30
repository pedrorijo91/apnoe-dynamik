using Toybox.WatchUi;

class SummaryView  extends WatchUi.View {

	const SUMMARY = WatchUi.loadResource(Rez.Strings.phase4);

	hidden var currentlyDisplayedDive = 0;
	hidden var numberOfSavedDiveTimes;

	function initialize() {
		WatchUi.View.initialize();
		numberOfSavedDiveTimes = currentTrainingSession.diveTimes.size();
    }
    
    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        WatchUi.View.onLayout(dc);
    }
    
    
    function nextDiveTime() {
    	debug("Show next dive time");
    	currentlyDisplayedDive++;
    	if (currentlyDisplayedDive >= numberOfSavedDiveTimes) {
    		currentlyDisplayedDive--;
    	}
    	WatchUi.requestUpdate();
    }

    function previousDiveTime() {
    	debug("Show previous dive time");
    	currentlyDisplayedDive--;
    	if (currentlyDisplayedDive < 0) {
    		currentlyDisplayedDive++;
    	}
    	WatchUi.requestUpdate();
    }

	function onUpdate(dc) {
		var currentDiveTime = currentTrainingSession.diveTimes[currentlyDisplayedDive];
		
		var textFeldMode;
        textFeldMode = View.findDrawableById("modusId");
        textFeldMode.setText(SUMMARY);		
		
		var textFeldDiveTime; // TODO -  Zeit der angezeigten Phase
        textFeldDiveTime = View.findDrawableById("zeitId");
        textFeldDiveTime.setText("" + currentDiveTime);
        debug("Current dive time: " + currentDiveTime);

		var textFeldInfo;
        textFeldInfo = View.findDrawableById("infoId");
        textFeldInfo.setText("Phase"); // TODO - Name der angezeigten Phase
		
	   	

		WatchUi.View.onUpdate(dc);
  }

}
