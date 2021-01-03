using Toybox.WatchUi;

// LastRelaxDurationMenuItem is a menu entry which makes only sense for this App
// => not in helpers directory.

class LastRelaxDurationMenuItem extends  WatchUi.MenuItem  {

	var listenFunction;

	function initialize(label) {
		WatchUi.MenuItem.initialize(label, lastRelaxDuration(), :lastRelaxDurationMenuItem, {});
		listenFunction = method(:updateSubLabel);
		SettingsHelper.listenOnSettingsChanged(listenFunction);
	}
	
	function updateSubLabel() {
		debug("Update subLabel");
		setSubLabel(lastRelaxDuration());
	}

	function lastRelaxDuration() {
		debug("Calculate last relax duration.");

		var rounds = SettingsHelper.get(Menu.PROP_ROUNDS).toFloat();
		var rTime = Training.calculateSecondsDurationForRound(rounds);
		
		return TextHelper.sTimeToDisplayText(rTime);
	}
	
	function onMenuClose() {
		debug("on menu close.  Stop listening");
		SettingsHelper.stopListenOnSettingsChanged(listenFunction);
	}
}