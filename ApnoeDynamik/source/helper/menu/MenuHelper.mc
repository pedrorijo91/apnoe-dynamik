using Toybox.WatchUi;


class MenuHelper {
	
	static function showMenu(titleText, menuEntries) {
		var menu = new WatchUi.Menu2({:title=> titleText});
		
		debug("Building " + titleText + " menu.");
        
        for (var i = 0; i < menuEntries.size(); i++) {
        	debug("Adding menuEntry.");
        	var currentEntry = menuEntries[i];
        	
        	menu.addItem(currentEntry);        	        	
        }
        
        WatchUi.pushView(menu, new MenuDelegate(menuEntries), WatchUi.SLIDE_IMMEDIATE);
	}
}