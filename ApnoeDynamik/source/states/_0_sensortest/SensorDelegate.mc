using Toybox.Time;

class SensorDelegate extends DelegateBase {

    var state;

    function initialize(_state) {
        state = _state;
        DelegateBase.initialize();
    }


    function onSelect() {
        state.switchToPrepare();
        return true;
    }

    function onBack() {
        Toybox.System.exit();
    }

    function onMenu() {
        debug("onMenu");

        Menu.showMenu();
        return true;
    }
}