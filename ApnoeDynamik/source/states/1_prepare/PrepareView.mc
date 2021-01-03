using Toybox.WatchUi;
using Toybox.Math;

class PrepareView extends CountdownView {

	const PREPARE = WatchUi.loadResource(Rez.Strings.phase1);

	var multiBeepTimer;

    function initialize(_countdown) {
    	CountdownView.initialize(PREPARE, _countdown);
    }

    
    function onUpdate(dc) {
       
    	CountdownView.onUpdate(dc);
    	
    	var remainingTime = countdown.remainingTime();
    	var remainingSeconds = Math.round(remainingTime / 1000.0).toNumber();
    	
    	// TODOMAX (MK2 verwenden.)
    	if (remainingSeconds == 30 || remainingSeconds == 20) {
    	
    		AttentionHelper.multiBeep([
    			{:freq => 2000, :ms => 250},
    			{:freq => 0, :ms => 250},
    			{:freq => 2000, :ms => 250},
    			{:freq => 0, :ms => 250},
    			{:freq => 2000, :ms => 250}
    		]);
    			
    		AttentionHelper.multiVibrate([
    			{:percent => 100, :ms => 1000},
    			{:percent => 0, :ms => 1000},
    			{:percent => 100, :ms => 1000},
    			{:percent => 0, :ms => 1000},
    			{:percent => 100, :ms => 1000}
    		]);
    		
    	} else if (remainingSeconds > 30 && (remainingSeconds % 30) == 0 || 
    			   remainingSeconds == 10) {
			AttentionHelper.beep(2500, 250);
			AttentionHelper.vibrate(100, 250);
      	}  
    }

}
