using Toybox.WatchUi;

class DiveView extends MainLayoutView {

	const DISPLAY_GO_DURATION = 3; // Anzeige des "GO" nach Countown in sec.
	const DIVE = WatchUi.loadResource(Rez.Strings.phase2);
	const UPDATE_INTERVALL = 1000;  // Update every second.
	
	var stateStartedAt;
	
	var firstTime = true;
	
    function initialize(_stateStartedAt) {
    	stateStartedAt = _stateStartedAt;
    	MainLayoutView.initialize();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
  		debug("DiveView onShow");
  		autoUpdate(UPDATE_INTERVALL);
  		MainLayoutView.onShow();
  		
		AttentionHelper.beep(2500, 3000);
		AttentionHelper.backlightOnTimed(3000);
		AttentionHelper.vibrate(100, 3000);
    }


	function calcTimeInState() {
		// If the state doesn't set a stateStartedAt time we can't calculate how long we have been in the state.
		// Let's return null in this case.
		if (stateStartedAt != null) {
			return System.getTimer() - stateStartedAt;
		} else {
			return null;
		}
	}

    // Update the view
    function onUpdate(dc) {
    	var timeInState = calcTimeInState();
    	var timeInStateSeconds = Math.round(timeInState / 1000.0);

		setModeTextWithRoundNr(DIVE);
    	setTimeText(timeInState);
        
        // Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);

    	var currentRound = currentTrainingSession.round;
    	var totalRounds = currentTraining.rounds();
    	
    	var innerOn = 0;
    	if (timeInStateSeconds < DISPLAY_GO_DURATION) {
    		graphicsHelper.drawImgCentered(dc, Rez.Drawables.countdownGo);
    		innerOn = /* 1; // wenn es NICHT plinken soll: */ (timeInStateSeconds.toNumber() + 1) % 2;  // divide by 2 and take the remainder ==> 1 % 2 == 1    2 % 2 == 0    3 % 2 == 1     4 % 2 == 0
    	}
    	
    	graphicsHelper.drawProgressInner(dc, innerOn, 1);
        graphicsHelper.drawProgressOuter(dc, currentRound, totalRounds);
    }
}
