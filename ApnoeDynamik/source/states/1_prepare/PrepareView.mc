using Toybox.WatchUi;
using Toybox.Math;

class PrepareView extends CountdownView {

    const PREPARE = WatchUi.loadResource(Rez.Strings.phase1);

    var multiBeepTimer;

    function initialize(_countdown) {
        CountdownView.initialize(PREPARE, false, _countdown);
    }


    function onUpdate(dc) {
        CountdownView.onUpdate(dc);
    }
}
