using Toybox.Attention;
using Toybox.Timer;

class TimedBacklight {

	var backlightTimer;
	
	function initialize(duration) {
		debug("Turning backlight on");
		backlightTimer = new Timer.Timer();
		backlightTimer.start(method(:turnBacklightOff), duration, false); 
		Attention.backlight(true);		
	}
	
	hidden function stopTimer() {
		if (backlightTimer != null) {
			backlightTimer.stop();
			backlightTimer = null;
		}
	}
	 
	function abort() {
		debug("Aborting");
		stopTimer();
	}
	
	function turnBacklightOff() {
		debug("Turning backlight off");
		Attention.backlight(false);
		// Shouldn't be necessary.  Just to be sure that the timer and this object is released (and garbage collected).
		stopTimer();
	}
}


// All durations in this class expect milliseconds.
class AttentionHelper {

	static function backlight(onOrOff) {
		if (Attention has :backlight) {
            Attention.backlight(onOrOff);
        }
	}
	
	static var currentBacklightTimer;

	static function backlightOnTimed(duration) {
		if (Attention has :backlight) {
			if (currentBacklightTimer != null) {
				currentBacklightTimer.abort();
			}	
			currentBacklightTimer = new TimedBacklight(duration);
				
		}
	}
	
	static function beepLoud() {
		if (Attention has :playTone) {
   			Attention.playTone(Attention.TONE_LOUD_BEEP);
		}
	}
	
    static function beep(frequency, duration) {
        if (Attention has :ToneProfile) {
        	var toneProfile = [ new Attention.ToneProfile(frequency, duration) ];
            Attention.playTone({:toneProfile => toneProfile});
        } else {
        	beepLoud();
        }
    }
    
    static function multiBeep(beepTable) {
    	if (Attention has :ToneProfile) {
	    	var toneProfiles = [];
	    	
	    	for (var i = 0; i < beepTable.size(); i++) {
	    		var current = beepTable[i];
	    		var toneProfile = new Attention.ToneProfile(current.get(:freq), current.get(:ms));
	    		toneProfiles.add(toneProfile);    		
	    	}
	    	Attention.playTone({:toneProfile => toneProfiles});
    	} else {
    		beepLoud();
    	}
    }
    
    static function multiVibrate(vibrateTable) {
        if (Attention has :vibrate) {
	    	var vibeProfiles = [];
	    	
	    	for (var i = 0; i < vibrateTable.size(); i++) {
	    		var current = vibrateTable[i];
	    		var vibeProfile = new Attention.VibeProfile(current.get(:percent), current.get(:ms));
	    		vibeProfiles.add(vibeProfile);
	    	}
	    	Attention.vibrate(vibeProfiles);
    	}
    }

    static function vibrate(dutyCycle, duration) {
        if (Attention has :vibrate) {
            Attention.vibrate([new Attention.VibeProfile(dutyCycle, duration)]);
        }
    }	

//    static function vibrate2(dutyCycle, duration) {
//        if (Attention has :vibrate) {
//            Attention.vibrate([new Attention.VibeProfile(dutyCycle, duration)]);
//        }
//    }	



}