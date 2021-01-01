// IntervallMenuItem is a menu entry which makes only sense for this App
// => not in helpers directory.

class IntervalMenuItem extends NumberMenuItem {
	function initialize(label, propertyId) {
		NumberMenuItem.initialize(label, 1, 3, "", propertyId);
	}
	
	function toSubLabel(value) {
		switch(value) {
			case 1: return "jede Erholungsphase";
			case 2: return "jede 2. Erholungsphase";
			case 3: return "jede 3. Erholungsphase";
			default: return "" + value;
		}
	}
}