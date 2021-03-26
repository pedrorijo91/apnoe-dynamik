using Toybox.WatchUi;

class RelaxView extends CountdownView {

	const RELAX = WatchUi.loadResource(Rez.Strings.phase3);

    function initialize(_countdown) {
    	CountdownView.initialize(RELAX, true, _countdown);
    }
}
