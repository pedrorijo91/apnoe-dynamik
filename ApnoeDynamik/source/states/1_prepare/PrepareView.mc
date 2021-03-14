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
    	
    	var isStartDuration = remainingSeconds == (countdown.duration() / 1000.0).toNumber();
    	
    	if (remainingSeconds == 30 || remainingSeconds == 20) {
    	
    		AttentionHelper.multiBeep([
    			{:freq => 1800, :ms => 250},
    			{:freq => 0, :ms => 250},
    			{:freq => 1800, :ms => 250},
    			{:freq => 0, :ms => 250},
    			{:freq => 1800, :ms => 250}
    		]);
    			
    		AttentionHelper.multiVibrate([
    			{:percent => 100, :ms => 250},
    			{:percent => 0, :ms => 250},
    			{:percent => 100, :ms => 250},
    			{:percent => 0, :ms => 250},
    			{:percent => 100, :ms => 250}
    		]);
    		
    	} else if (remainingSeconds > 30 && (remainingSeconds % 30) == 0 && !isStartDuration || 
    			   remainingSeconds == 10) {
			AttentionHelper.beep(2000, 250);
			AttentionHelper.vibrate(100, 250);
      	}  
    }

}
