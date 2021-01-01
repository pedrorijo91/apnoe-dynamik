using Toybox.Sensor;
using Toybox.WatchUi;
using Toybox.Graphics;


class MainLayoutView extends AutoUpdateView {

	const DRAWABLE_MODE_ID = "modusId";
	const DRAWABLE_TIME_ID = "zeitId";
		    
    function initialize() {
    	AutoUpdateView.initialize();
  	}
 


	// Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        AutoUpdateView.onLayout(dc);
    }
    
    function onShow() {
    	WatchUi.requestUpdate();
    	AutoUpdateView.onShow();		
    }
    
    // Call this function before calling the parent onUpdate function!
    // Otherwise the layout will not have the updated values and draw "old" values.
	function setModeText(mode) {
		View.findDrawableById(DRAWABLE_MODE_ID).setText(mode);
	}

	
    // Call this function before calling the parent onUpdate function!
    // Otherwise the layout will not have the updated values and draw "old" values.
    // This function expects milli-seconds.
	function setTimeText(timeInMs) {
		View.findDrawableById(DRAWABLE_TIME_ID).setText(TextHelper.msTimeToDisplayText(timeInMs));        
    }
    
    // Call this function before calling the parent onUpdate function!
    // Otherwise the layout will not have the updated values and draw "old" values.
    function setTextById(id, value) {
    	View.findDrawableById(id).setText(value);
    }


	function onUpdate(dc) {
		
		var textFeldPuls;
		textFeldPuls = View.findDrawableById("pulsId");
        var hrPrefix = WatchUi.loadResource(Rez.Strings.heartRatePrefix);
        var puls = sensorData.currentHeartRate;
        if (puls != null && puls > 0) {
            textFeldPuls.setText(hrPrefix + " " + puls);
        } else {
            textFeldPuls.setText(hrPrefix + " --");
        }
        
        var lastDiveTime = 0;
        if (currentTrainingSession != null) {
        	debug("currentTrainingSession is not null");
	       	var nbStoredDiveTimes = currentTrainingSession.diveTimes.size();
	       	
        	debug("There are " + nbStoredDiveTimes + " stored dive Times.");	       	
	        if (nbStoredDiveTimes > 0) {
	        	lastDiveTime = currentTrainingSession.diveTimes[nbStoredDiveTimes - 1];
	        	debug("The last stored time is: " + lastDiveTime); 
	        }
        }
       
       	var distance = currentTraining.distance;
       	
       	var textFeldInfo;
		textFeldInfo = View.findDrawableById("infoId");
        var mSuffix = WatchUi.loadResource(Rez.Strings.meterSuffix);
        var dtPrefix = WatchUi.loadResource(Rez.Strings.lastDivePrefix);
        if (lastDiveTime <= 0 ) {
            textFeldInfo.setText( "" + distance + mSuffix );
        } else {
            textFeldInfo.setText(dtPrefix + " " + TextHelper.msTimeToDisplayText(lastDiveTime));
        } 
        
		AutoUpdateView.onUpdate(dc);
    }







}
    