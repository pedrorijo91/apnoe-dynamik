using Toybox.WatchUi;

class RelaxView  extends CountdownView {

	const RELAX = WatchUi.loadResource(Rez.Strings.phase3);

    function initialize(_countdown) {
    	CountdownView.initialize(RELAX, _countdown);
    }

//	function onUpdate(dc) {
//		var textFeldDiveTime;
//        textFeldDiveTime = View.findDrawableById("infoId");
//        var dtPrifix = WatchUi.loadResource(Rez.Strings.lastDivePrefix);
//        textFeldDiveTime.setText(dtPrifix + " " + "1:23");
//
//		CountdownView.onUpdate(dc);
//  }

}
