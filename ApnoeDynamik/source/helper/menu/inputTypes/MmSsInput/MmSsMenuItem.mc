using Toybox.WatchUi;

class MmSsMenuItem extends WatchUi.MenuItem {

    var propertyId;


    function initialize(label, _propertyId) {
        propertyId = _propertyId;

        var currentValue = SettingsHelper.get(propertyId);
        var subLabel = toSubLabel(currentValue);

        WatchUi.MenuItem.initialize(label, subLabel, propertyId, {});
    }


    function toSubLabel(value) {
        return TextHelper.sTimeToDisplayText(value);
    }

    function updateValue(newValue) {
        // update subLabel
        var subLabel = toSubLabel(newValue);
        setSubLabel(subLabel);
    }

    function askForInput() {
        var picker = new MmSsPicker(SettingsHelper.get(propertyId), getLabel());
        var delegate = new MmSsPickerDelegate(self);

        WatchUi.pushView(picker, delegate, WatchUi.SLIDE_IMMEDIATE);
    }
}