using Toybox.WatchUi;
using Toybox.Math;

class PrepareView extends CountdownView {

	const PREPARE = "PREPARE";

    function initialize(_stateStartedAt, _stateDuration) {
    	CountdownView.initialize(PREPARE, _stateStartedAt, _stateDuration);
    }
}
