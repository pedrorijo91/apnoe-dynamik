using Toybox.WatchUi;

class NumberMenuItem extends WatchUi.MenuItem {

    var propertyId;
    var currentValue;
    var unit;
    var min;
    var max;

    function initialize(label, _min, _max, _unit, _propertyId) {
        min = _min;
        max = _max;
        propertyId = _propertyId;
        unit = _unit;

        WatchUi.MenuItem.initialize(label, toSubLabel(SettingsHelper.get(propertyId)), propertyId, {});
    }


    function toSubLabel(value) {
        return "" + value + unit;
    }

    function updateValue(newValue) {
        // update subLabel
        var subLabel = toSubLabel(newValue);
        setSubLabel(subLabel);
    }

    function askForInput() {
        var picker = new NumberPicker(SettingsHelper.get(propertyId), min, max, unit, getLabel());
        var delegate = new NumberPickerDelegate(self);
        WatchUi.pushView(picker, delegate, WatchUi.SLIDE_IMMEDIATE);
    }
}