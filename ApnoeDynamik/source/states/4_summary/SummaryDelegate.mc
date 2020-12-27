
class SummaryDelegate extends DelegateBase {

	var state;
	var view;
	
	function initialize(_state, _view) {
		state = _state;
		view = _view;
		DelegateBase.initialize();
	}
		
	function onNextPage() {
		view.nextDiveTime();
		return true;
	}

	function onPreviousPage() {
		view.previousDiveTime();
		return true;
	}
}