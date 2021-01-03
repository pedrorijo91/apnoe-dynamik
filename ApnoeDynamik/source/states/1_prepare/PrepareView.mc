using Toybox.WatchUi;
using Toybox.Math;

class PrepareView extends CountdownView {

	const PREPARE = WatchUi.loadResource(Rez.Strings.phase1);

    function initialize(_countdown) {
    	CountdownView.initialize(PREPARE, _countdown);
    }

// TODOmax

    function onUpdate(dc) {
    
    	var remainingTime = countdown.remainingTime();
    	var alarmTime = Math.round(remainingTime / 100.0); // zeit is in zehntel-Sekunden! damit der Arlam in einer Sekunde öfters läuten kann
  	 	
    	// Call the parent onUpdate function to redraw the layout
        CountdownView.onUpdate(dc);
//        AutoUpdateView.autoUpdate(100);
        
//		if (alarmTime > 300 && alarmTime % 300 == 0) {
//			AttentionHelper.beep();
//			AttentionHelper.vibrate(100, 250);
//    	} else if (alarmTime == 300 || alarmTime == 300-5 || alarmTime == 300-10) {
//			AttentionHelper.beep();
//			AttentionHelper.vibrate(100, 250);
//        } else if (alarmTime == 200 || alarmTime == 200-5) {
//			AttentionHelper.beep();
//			AttentionHelper.vibrate(100, 250);
//        } else if (alarmTime == 100) {
// 			AttentionHelper.beep();
//			AttentionHelper.vibrate(100, 250);
//    	}

//		if (alarmTime == 300 && alarmTime % 300 == 0 ) {
//			AttentionHelper.beep();
//			AttentionHelper.vibrate(100, 250);
//      	}
		
		if (alarmTime == 300 || alarmTime == 300-10 || alarmTime == 300-20 || alarmTime == 200 || alarmTime == 200-10 || alarmTime == 100 ) { //TODO soll ich einer Sekunde öfters läuten !!! onAutoUpdate einfügen?!
			AttentionHelper.beep(2500, 250);
			AttentionHelper.vibrate(100, 250);
      	}


  
    }

}
