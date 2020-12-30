using Toybox.WatchUi;
using Toybox.Math;

class PrepareView extends CountdownView {

	const PREPARE = WatchUi.loadResource(Rez.Strings.phase1);

    function initialize(_countdown) {
    	CountdownView.initialize(PREPARE, _countdown);
    }
}
