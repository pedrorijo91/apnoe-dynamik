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
		
		var firstRelax = SettingsHelper.get(Menu.PROP_FIRST_RELAX);
		var relaxReduce = SettingsHelper.get(Menu.PROP_RELAX_REDUCE);
		var rounds = SettingsHelper.get(Menu.PROP_ROUNDS).toFloat();
		var interval = SettingsHelper.get(Menu.PROP_ADJUST_INTERVAL).toFloat();
		debug ("firstRelax = " + firstRelax);
		debug ("relaxReduce = " + relaxReduce);
		debug ("rounds = " + rounds);
		debug ("interval = " + interval);
				
		var roundsInterval = Math.ceil( rounds / interval ).toNumber(); // Ergebnis wir immer auf eine ganze Zahl aufgerundet
		debug ("roundsInterval = " + roundsInterval);
		
		var rTime = firstRelax - (relaxReduce * (roundsInterval - 1 )); // Zeit in Sekunden
		debug ("rTime = " + rTime);
		
		return TextHelper.sTimeToDisplayText(rTime);
	}
	
	function onMenuClose() {
		debug("on menu close.  Stop listening");
		SettingsHelper.stopListenOnSettingsChanged(listenFunction);
	}
}