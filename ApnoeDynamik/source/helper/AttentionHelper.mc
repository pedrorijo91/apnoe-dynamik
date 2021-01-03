using Toybox.Attention;


class AttentionHelper {

	static function displayOn() {
		if (Attention has :backlight) {
            Attention.backlight(true);
        }
	}
	
    static function beep(frequency, duration) {
        if (Attention has :ToneProfile) {
            Attention.ToneProfile([new Attention.ToneProfile(frequency, duration)]);
         	Attention.playTone({:toneProfile=>toneProfile});   
        }
    	
    	if (Attention has :playTone) {
   			Attention.playTone(Attention.TONE_LOUD_BEEP);
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