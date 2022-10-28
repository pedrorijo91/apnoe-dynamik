using Toybox.WatchUi;

// LastRelaxDurationMenuItem is a menu entry which makes only sense for this App
// => not in helpers directory.

class LastRelaxDurationMenuItem extends  WatchUi.MenuItem  {

    var listenFunction;

    function initialize(label) {
        WatchUi.MenuItem.initialize(label, lastRelaxDurationText(), :lastRelaxDurationMenuItem, {});
        listenFunction = method(:updateSubLabel);
        SettingsHelper.listenOnSettingsChanged(listenFunction);
    }

    function updateSubLabel() {
        debug("Update subLabel");
        setSubLabel(lastRelaxDurationText());
    }

    function lastRelaxDurationText() {
        debug("Calculate last relax duration.");

        var rounds = SettingsHelper.get(Menu.PROP_ROUNDS).toFloat();
        var rTime = Training.calculateSecondsDurationForRound(rounds);

        if (Training.hasRoundValidDuration(rounds)) {
            return TextHelper.sTimeToDisplayText(rTime);
        } else {
            return TextHelper.sTimeToDisplayText(rTime) + WatchUi.loadResource(Rez.Strings.propLastRelaxError);
        }
    }

    function onMenuClose() {
        debug("on menu close.  Stop listening");
        SettingsHelper.stopListenOnSettingsChanged(listenFunction);
    }
}