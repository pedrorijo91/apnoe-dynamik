using Toybox.WatchUi;

class RelaxView extends CountdownView {

	const RELAX = WatchUi.loadResource(Rez.Strings.phase3);  // TODO - + phasen NR.

    function initialize(_countdown) {
    	CountdownView.initialize(RELAX, _countdown);
    }
}
