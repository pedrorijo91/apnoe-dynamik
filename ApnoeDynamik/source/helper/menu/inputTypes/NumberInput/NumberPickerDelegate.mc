using Toybox.WatchUi;

class NumberPickerDelegate extends WatchUi.PickerDelegate {
    hidden var menuItem;

    function initialize(_menuItem) {
        PickerDelegate.initialize();
        menuItem = _menuItem;
    }

    function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    function onAccept(values) {
        var newValue = values[0];
        debug("Setting property: " + menuItem.propertyId + " to " + newValue);

        SettingsHelper.set(menuItem.propertyId, newValue);

        if (menuItem has :updateValue) {
            menuItem.updateValue(newValue);
        }

        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

}