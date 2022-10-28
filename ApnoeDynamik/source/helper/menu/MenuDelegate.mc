using Toybox.WatchUi;
using Toybox.System;

class MenuDelegate extends WatchUi.Menu2InputDelegate {

    var menuEntries;

    function initialize(_menuEntries) {
        menuEntries = _menuEntries;
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        debug("onSelect for " + item.getLabel());
        if (item has :askForInput) {
            debug(" has askForInput");
            item.askForInput();
            return true;
        }

        debug("Don't know what to do with this menu item.");
        // keypress should not bubble up.
        return true;
    }

    function onBack() {
        for (var i = 0; i < menuEntries.size(); i++) {
            var currentEntry = menuEntries[i];
            if (currentEntry has :onMenuClose) {
                currentEntry.onMenuClose();
            }
        }
        return WatchUi.Menu2InputDelegate.onBack();
    }
}