using Toybox.WatchUi;

class SummaryView  extends WatchUi.View {

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
		
		var textFeldDiveTime;
        textFeldDiveTime = View.findDrawableById("infoId");
        var dtPrifix = WatchUi.loadResource(Rez.Strings.lastDivePrefix);
        textFeldDiveTime.setText(dtPrifix + " " + currentDiveTime);
        debug("Current dive time: " + currentDiveTime);

		WatchUi.View.onUpdate(dc);
  }

}
