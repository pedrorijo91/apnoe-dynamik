using Toybox.Timer;

class TimedState extends State {

	var timer;
	var nextStateIn;
	
	function initialize(_nextStateIn) {
		State.initialize();
		activeState = self;
		debug("Entering new state.");
		
		debug("NextStateIn: " + _nextStateIn);
		nextStateIn = _nextStateIn;
		
		timer = new Timer.Timer();
		timer.start(method(:onStateTimer), _nextStateIn, false);
	}
	
	function onStateTimer() {
		debug("onStateTimer");
		nextStep();
	}
	
	function onUpdate(timeInState) {
		debug("onUpdate (TimedState) called with (" + timeInState + ")");
		
		var remainingTime = nextStateIn - timeInState;
		debug("remaining time in state: " + remainingTime);
		
		onUpdateTimedState(timeInState, remainingTime);
	}
	
	function onUpdateTimedState(timeInState, remainingTime) {
		debug("onUpdateTimedState called.  TimeInState: " + timeInState + ", remainingTime: " + remainingTime);
	}	
}