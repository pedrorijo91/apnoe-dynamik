using Toybox.Graphics;
using Toybox.WatchUi;

class NumberPicker extends WatchUi.Picker {

    function initialize(defaultNumber, min, max, unit, title) {
        if (defaultNumber < min) {
            defaultNumber = min;
        } else if (defaultNumber > max) {
            defaultNumber = max;
        }
        var factories = [
            new NumberFactory(min, max, 1, {}),
            new WatchUi.Text({:text  => unit,
                              :font  => Graphics.FONT_LARGE,
                              :locX  => WatchUi.LAYOUT_HALIGN_CENTER,
                              :locY  => WatchUi.LAYOUT_VALIGN_CENTER})
        ];

        var titleDrawable = new WatchUi.Text({:text  => title,
                                              :font  => Graphics.FONT_MEDIUM,
                                              :locX  => WatchUi.LAYOUT_HALIGN_CENTER,
                                              :locY  => WatchUi.LAYOUT_VALIGN_CENTER});

        var defaults = [defaultNumber - min, 0];
        Picker.initialize({:pattern=>factories,
                           :defaults=>defaults,
                           :title=>titleDrawable});
    }

    function onUpdate(dc) {
        //dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        //dc.clear();
        Picker.onUpdate(dc);
    }
}
