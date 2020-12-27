
class DiveDelegate extends DelegateBase {

	var state;
	
	function initialize(_state) {
		state = _state;
		DelegateBase.initialize();		
	}
	
	function onSelect() {
		state.switchToRelaxOrSummary();
		return true;
	}
	
	function onUp() {
		state.switchToRelaxOrSummary();
		return true;
	}
	
	function onDown() {
		state.switchToRelaxOrSummary();
		return true;
	}
	
	function onBack() {
		state.switchToRelaxOrSummary();
		return true;
	}
	
	function onLight() {
		state.switchToRelaxOrSummary();
		return true;
	}
	
	function onMenu() {
		state.switchToRelaxOrSummary();
		return true;
	}
}