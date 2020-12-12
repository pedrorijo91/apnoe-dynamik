using Toybox.Timer;

class StateView extends GraphicsView {
	    
    var timer;
    
    var stateStartedAt;
    var stateDuration;
    
    function initialize(_stateStartedAt, _stateDuration) {
    	GraphicsView.initialize();
    	stateStartedAt = _stateStartedAt;
    	stateDuration = _stateDuration;
    }
    
    
    function resetTimer() {
    	if (timer == null) {
			timer = new Timer.Timer();
		} else {
			timer.stop();
		}
    }
    	
    // Call onTimer function every intervall, but do not request a display update.
    // Use this function, if you need a callback more often than a display update.
    // Implement onTimer for the callback.
    // YOU have to request display updates!  ( WatchUi.requestUpdate() )
	function startTimer(intervall) {
		resetTimer();
		timer.start(method(:_onTimer), intervall, true);
	}
	
	// Automatically requests a display update every intervall.
	// Implement onTimer() to get a callback as well.
	function startUpdateTimer(intervall) {
		resetTimer();
		timer.start(method(:_onUpdateTimer), intervall, true);
	}
	
	function _onTimer() {
		var timeInState = calcTimeInState();
		debug("In state since: " + timeInState);
		onTimer(timeInState);
	}
	
	function _onUpdateTimer() {
		WatchUi.requestUpdate();
		_onTimer();
	}
	
	function onTimer(_timeInState) {
		// Don't do anything here.
		// Subclasses can overwrite it.
	}
	
	function calcTimeInState() {
		return System.getTimer() - stateStartedAt;
	}
	
	function calcRemainingTimeInState() {
    	var now = System.getTimer();
    	var endTime = calcEndTime();
    	return endTime - now;
	}
	
	function calcEndTime() {
		return stateStartedAt + stateDuration;
	}
	
	// Automatically called by the system, when the view "stops".
	// We stop and remove our timer here.
	function onHide() {
	    debug("StateView onHide");
		if (timer != null) {
			timer.stop();
		}
		timer = null;
		GraphicsView.onHide();
	}
}