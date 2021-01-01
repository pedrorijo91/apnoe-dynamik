using Toybox.WatchUi;

class Menu {

	static const PROP_PREPARE = "propPrepare";

	static function showMenu() {
		debug("showMenu");
		var titleText = WatchUi.loadResource(Rez.Strings.settingmenutitel);
		
		var menuEntries = [
			new MmSsMenuItem(WatchUi.loadResource(Rez.Strings.propPrepare), PROP_PREPARE),
			new NumberMenuItem(WatchUi.loadResource(Rez.Strings.propDistance), 0, 500, "m", "propDistance"),
			new NumberMenuItem(WatchUi.loadResource(Rez.Strings.propRounds), 1, 20, "", "propRounds"),
			new IntervalMenuItem(WatchUi.loadResource(Rez.Strings.propAdjustInterval), "propAdjustInterval"),
			new LastRelaxDurationMenuItem("Last Relax...")
		];
		
		MenuHelper.showMenu(titleText, menuEntries);
	}
}