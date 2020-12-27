using Toybox.WatchUi;

class SummaryView  extends GraphicsView {

	hidden var currentlyDisplayedDive = 0;
	hidden var numberOfSavedDiveTimes;

	function initialize() {
		GraphicsView.initialize();
		numberOfSavedDiveTimes = currentTrainingSession.diveTimes.size();
    }
    
    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        AutoUpdateView.onLayout(dc);
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

		GraphicsView.onUpdate(dc);
  }

}
