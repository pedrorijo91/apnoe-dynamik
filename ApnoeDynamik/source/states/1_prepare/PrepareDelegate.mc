
class PrepareDelegate extends DelegateBase {

	var state;
	
	function initialize(_state) {
		state = _state;
		DelegateBase.initialize();
	}
	
	function onSelect() {
		state.togglePause();
		return true;
	}
	
	function onDown() {
		state.switchToDive();
		return true;
	}
}