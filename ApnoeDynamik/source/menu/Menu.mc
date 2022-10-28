using Toybox.WatchUi;

class Menu {

    static const PROP_DISTANCE = "propDistance";
    static const PROP_PREPARE = "propPrepare";
    static const PROP_ROUNDS = "propRounds";
    static const PROP_FIRST_RELAX = "propFirstRelax";
    static const PROP_RELAX_REDUCE = "propRelaxReduce";
    static const PROP_ADJUST_INTERVAL = "propAdjustInterval";


    static function showMenu() {
        debug("showMenu");
        var titleText = WatchUi.loadResource(Rez.Strings.settingmenutitel);

        var unitSuffixM = WatchUi.loadResource(Rez.Strings.meterSuffix);
        var unitSuffixSec = WatchUi.loadResource(Rez.Strings.secSuffix);
        var unitSuffixRounds = WatchUi.loadResource(Rez.Strings.roundsSuffix);

        var menuEntries = [
            new NumberMenuItem(WatchUi.loadResource(Rez.Strings.propDistance), 1, 999, " " + unitSuffixM, PROP_DISTANCE),
            new MmSsMenuItem(WatchUi.loadResource(Rez.Strings.propPrepare), PROP_PREPARE),
            new NumberMenuItem(WatchUi.loadResource(Rez.Strings.propRounds), 1, 99, " " + unitSuffixRounds, PROP_ROUNDS),
            new MmSsMenuItem(WatchUi.loadResource(Rez.Strings.propFirstRelax), PROP_FIRST_RELAX),
            new NumberMenuItem(WatchUi.loadResource(Rez.Strings.propRelaxReduce), 0, 59, " " + unitSuffixSec, PROP_RELAX_REDUCE),
            new IntervalMenuItem(WatchUi.loadResource(Rez.Strings.propAdjustInterval), PROP_ADJUST_INTERVAL),
            new LastRelaxDurationMenuItem(WatchUi.loadResource(Rez.Strings.propLastRelax))
        ];

        MenuHelper.showMenu(titleText, menuEntries);
    }
}