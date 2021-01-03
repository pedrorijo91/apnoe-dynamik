// IntervallMenuItem is a menu entry which makes only sense for this App
// => not in helpers directory.

class IntervalMenuItem extends NumberMenuItem {
	function initialize(label, propertyId) {
		NumberMenuItem.initialize(label, 1, 3, "", propertyId);
	}
	
//TODOmax

	
	
	function toSubLabel(value) {
		switch(value) {
			case 1: return WatchUi.loadResource(Rez.Strings.interfal1MenuText);
			case 2: return WatchUi.loadResource(Rez.Strings.interfal2MenuText);
			case 3: return WatchUi.loadResource(Rez.Strings.interfal3MenuText);
			default: return "" + value;
		}
	}

}