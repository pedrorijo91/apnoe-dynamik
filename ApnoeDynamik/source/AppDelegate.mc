using Toybox.WatchUi;

class AppDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
    	BehaviorDelegate.initialize();
    }

    function onMenu() {
        debug("AppDelegate onMenu called");
    	State.activeState.onMenu();
    	return true;
    }
    
    function onBack() {
        debug("AppDelegate onBack called");
    	State.activeState.onBack();
    	return true;
    }
    
    function onKey(evt) {
        if (evt.getKey() != WatchUi.KEY_ENTER && evt.getKey() != WatchUi.KEY_DOWN) {
            return false;
        }

        if (evt.getType() != WatchUi.PRESS_TYPE_ACTION) {
            return true;
        }


        if (evt.getKey() == WatchUi.KEY_ENTER) {
        	onAccept();
        } else if (evt.getKey() == WatchUi.KEY_DOWN) {
        	onDown();
        }


        return true;
    }
    
    function onAccept() {
        debug("AppDelegate onAccept called");
    	State.activeState.onAccept();
    	return true;
    }
    
    function onDown() {
        debug("AppDelegate onDown called");
    	State.activeState.onDown();
    	return true;
    }
}