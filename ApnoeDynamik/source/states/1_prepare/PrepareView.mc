using Toybox.WatchUi;
using Toybox.Math;

class PrepareView extends CountdownView {

	const PREPARE = WatchUi.loadResource(Rez.Strings.phase1);

    function initialize(_countdown) {
    	CountdownView.initialize(PREPARE, _countdown);
    }

//	function onUpdate(dc) {
//		var textFeldMeter;
//        textFeldMeter = View.findDrawableById("infoId");
//        var mSuffix = WatchUi.loadResource(Rez.Strings.meterSuffix);
//        textFeldMeter.setText("50" + mSuffix);
//
//		CountdownView.onUpdate(dc);
//  }


}
