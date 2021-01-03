using Toybox.WatchUi;
using Toybox.Math;

class CountdownView extends MainLayoutView {

	var mode;  // TODO - mode + phasen NR.
	var countdown;
	
    function initialize(_mode, _countdown) {
    	mode = _mode;
    	
    	countdown = _countdown;
    	
    	MainLayoutView.initialize();
    }
    
    
    function fullSecondUpdate() {
		WatchUi.requestUpdate();
    }


    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	debug("PrepareView onShow");
    	countdown.fullSecondListen(self);
    	MainLayoutView.onShow();
    }
    
    	
    // Update the view
    function onUpdate(dc) {
    	var timeInState = countdown.time();
    	var remainingTime = countdown.remainingTime();
    	var stateDuration = countdown.duration();
    	
		var timeInStateSeconds = Math.round(timeInState / 1000.0);
    	var remainingSeconds = Math.round(remainingTime / 1000.0);
    	
    	var currentRound = currentTrainingSession.round;
    	var totalRounds = currentTraining.rounds();
    	
   	    setModeText(mode);
   		setTimeText(remainingTime);
    	
    	// Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);
        
        graphicsHelper.drawProgressInnerInverted(dc, timeInState, stateDuration);
        graphicsHelper.drawProgressOuter(dc, currentRound, totalRounds);

		if (remainingSeconds <= 5) {
			AttentionHelper.beep(5000, 250);
			AttentionHelper.displayOn(true);
			AttentionHelper.vibrate(100, 250);
    		graphicsHelper.drawBigCenteredNumber(dc, remainingSeconds, GraphicsHelper.MAIN_COLOR);
    	}
    }
}
