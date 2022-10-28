using Toybox.WatchUi;

class MmSsPickerDelegate extends WatchUi.PickerDelegate {
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
        var timeInSeconds = values[0] * 60 + values[2];
        SettingsHelper.set(menuItem.propertyId, timeInSeconds);

        if (menuItem has :updateValue) {
            menuItem.updateValue(timeInSeconds);
        }

        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

}