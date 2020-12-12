using Toybox.WatchUi;

class DiveView extends MainLayoutView {

	const DISPLAY_GO_DURATION = 3;
	const DIVE = "DIVE";
	const UPDATE_INTERVALL = 1000;
	
	
    function initialize(_stateStartedAt) {
    	MainLayoutView.initialize(_stateStartedAt, null);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
  		debug("DiveView onShow");
  		startUpdateTimer(UPDATE_INTERVALL);  // Update every second.
  		MainLayoutView.onShow();    	
    }

    // Update the view
    function onUpdate(dc) {
    	var timeInState = calcTimeInState();
    	var timeInStateSeconds = Math.round(timeInState / 1000.0);

		setModeText(DIVE);
    	setTimeText(timeInStateSeconds);
        
        // Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);

    	var currentRound = currentTrainingSession.round;
    	var totalRounds = currentTraining.rounds();
    	
    	var innerOn = 0;
    	if (timeInStateSeconds <= DISPLAY_GO_DURATION) {
    		drawImgCentered(dc, Rez.Drawables.countdownGo);
    		innerOn = (timeInStateSeconds.toNumber() + 1) % 2;  // divide by 2 and take the remainder ==> 1 % 2 == 1    2 % 2 == 0    3 % 2 == 1     4 % 2 == 0
    	}
    	
    	drawProgressInner(dc, innerOn, 1);
        drawProgressOuter(dc, currentRound, totalRounds);
    	
    }
}
