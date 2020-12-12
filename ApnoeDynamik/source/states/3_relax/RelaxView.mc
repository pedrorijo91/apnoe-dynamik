using Toybox.WatchUi;

class RelaxView  extends CountdownView {

	const RELAX = "RELAX";

    function initialize(_stateStartedAt, _stateDuration) {
    	CountdownView.initialize(RELAX, _stateStartedAt, _stateDuration);
    }
}
