using Toybox.WatchUi;
using Toybox.Math;

class CountdownView extends MainLayoutView {

	const UPDATE_INTERVALL = 1000;

	var mode;
	
    function initialize(_mode, _stateStartedAt, _stateDuration) {
    	mode = _mode;
    	MainLayoutView.initialize(_stateStartedAt, _stateDuration);
    }


    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	debug("PrepareView onShow");
    	startUpdateTimer(UPDATE_INTERVALL);  // Update every second.
    	MainLayoutView.onShow();
    }
    
    	
    // Update the view
    function onUpdate(dc) {
    	var timeInState = calcTimeInState();
    	var remainingTime = calcRemainingTimeInState();
    	
		var timeInStateSeconds = Math.round(timeInState / 1000.0);
    	var remainingSeconds = Math.round(remainingTime / 1000.0);
    	
    	var currentRound = currentTrainingSession.round;
    	var totalRounds = currentTraining.rounds();
    	
   	    setModeText(mode);
   		setTimeText(remainingSeconds);
    	
    	// Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);
        
        drawProgressInnerInverted(dc, timeInState, stateDuration);
        drawProgressOuter(dc, currentRound, totalRounds);

		if (remainingSeconds <= 10) {    	
    		drawBigCenteredNumber(dc, remainingSeconds, MAIN_COLOR);
    	}
    }
}
