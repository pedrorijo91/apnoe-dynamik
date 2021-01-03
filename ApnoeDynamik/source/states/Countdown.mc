using Toybox.Timer;

class Countdown {

	var listener;            // This will usually be the state.
	var fullSecondListener;  // This will usually be a view.
	
	var startTime;
	var _duration;

	var pausedSince;	// null if not in a pause.
	var totalTimeInPauses;

	var _timer;
	var _fullSecondTimer;
	
	function initialize(_listener, __duration) {
		debug("duration: " + __duration);
		
		listener = _listener;
		startTime = System.getTimer();
		_duration = __duration;
		
		totalTimeInPauses = 0;
		pausedSince = null;

		fullSecondListener = null;

		_startTimer(_duration);		
	}
	
	// duration in ms
	function _startTimer(_duration) {
		_timer = new Timer.Timer();
		_timer.start(method(:_onTimeExpired), _duration, false);
		
		var milliSecondsTillCompleteSecond = _duration % 1000;  // _duration will always be the remainig time.
		if (milliSecondsTillCompleteSecond == 0) {
			milliSecondsTillCompleteSecond = 1000;
		}
		_fullSecondTimer = new Timer.Timer();
		_fullSecondTimer.start(method(:_fullSecondUpdate), milliSecondsTillCompleteSecond, false);
	}
	
	function _stopTimer() {
		if (_timer != null) {
			_timer.stop();
		}
		_timer = null;
		
		if (_fullSecondTimer != null) {
			_fullSecondTimer.stop();
		}
		_fullSecondTimer = null;
	}
	

	function _onTimeExpired() {
		debug("_onTimeExpired");
		listener.timeExpired();
	}

	
	function togglePause() {
		var now = System.getTimer();  // Time since the watch has been started.
		if (pausedSince == null) {
			debug("Starting pause");
			// Pause started
			pausedSince = now;
			_stopTimer();
		} else {
			debug("Ending pause");
			// Pause ended
			var pauseDuration = now - pausedSince;
			pausedSince = null;
			// We might have multiple pauses.  Add the pauseDurations.
			totalTimeInPauses = totalTimeInPauses + pauseDuration;
			
			_startTimer(remainingTime());
		}
	}
	
	function _fullSecondUpdate() {
		if (fullSecondListener != null) {
			fullSecondListener.fullSecondUpdate();
		}
		// This function can only be called from the fullSecondTimer.  The timer must therefore exist.
		var milliSecondsTillCompleteSecond = remainingTime() % 1000;  // divide by 1000 take the remainer.
		_fullSecondTimer.start(method(:_fullSecondUpdate), milliSecondsTillCompleteSecond, false);
	}
	
	
	function time() {
		var now = System.getTimer();
		if (pausedSince == null) {
			// Currently not paused
			return (now - startTime) - totalTimeInPauses;
		} else {
			// Currently paused
			return (pausedSince - startTime) - totalTimeInPauses;
		}
	}
	
	function remainingTime() {
		return _duration - time();			
	}
	

	function stop() {
		_stopTimer();
		// Make sure that this object can be garbage collected => clear references to other objects.
		listener = null;
		fullSecondListener = null;
	}
	
	function duration() {
		return _duration;
	}
	
	function fullSecondListen(listener) {
		fullSecondListener = listener;
	}
}