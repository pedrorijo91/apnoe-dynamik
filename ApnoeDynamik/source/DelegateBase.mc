using Toybox.WatchUi;


class DelegateBase extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }


    // This is typically triggered by the menu button (KEY_MENU).
    function onMenu() {
        debug("onMenu called");
        return true;
    }

    // This is typically triggered by the Start/Enter button (KEY_ENTER) or by a CLICK_TYPE_TAP ClickEvent on a touch screen.
    function onSelect() {
        debug("onSelect called");
        return true;
    }

    // This is typically triggered by the up button (KEY_UP) or by a SWIPE_DOWN SwipeEvent on a touch screen.
    function onPreviousPage() {
        debug("onPreviousPage called");
        return onUp();
    }

    function onUp() {
        debug("onUp");
        return true;
    }

    // This is typically triggered by the down button (KEY_DOWN) or by a SWIPE_UP SwipeEvent on a touch screen.
    function onNextPage() {
        debug("onNextPage called");
        return onDown();
    }

    function onDown() {
        debug("onDown");
        return true;
    }

       // This is typically triggered by the back button (KEY_ESC).
    function onBack() {
        debug("onBack called");
        return false;
    }

    function onLight() {
        debug("onLight called");
        return false;
    }


    // The light button is only accessible with the onKey callback.
    // The event tells us which button was pressed (or released...)
    function onKey(event) {
        var button = event.getKey();

        if (button != WatchUi.KEY_LIGHT /* && button != WatchUi.KEY_ESCAPE */) {
            return false;
        }

        // We ignore all actions, which are not button presses (for instance we are not interested in button release...)
        if (event.getType() != WatchUi.PRESS_TYPE_ACTION) {
            return true;
        }

        if (button == WatchUi.KEY_LIGHT) {
            return onLight();
        } /* else if (button == WatchUi.KEY_ESCAPE) {
            return onEscape();
        }
        */

        return true;
    }
}