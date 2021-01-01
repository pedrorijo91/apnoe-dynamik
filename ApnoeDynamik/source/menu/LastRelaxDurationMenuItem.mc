using Toybox.WatchUi;
using Toybox.Math;

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
		var prepare = SettingsHelper.get(Menu.PROP_PREPARE).toFloat();
		var x = 8;
		var floatX = x.toFloat();
		var floatX2 = x * 1.0;
		return "" + Math.ceil(floatX / 3).toNumber();
	}
	
	function onMenuClose() {
		debug("on menu close.  Stop listening");
		SettingsHelper.stopListenOnSettingsChanged(listenFunction);
	}
}