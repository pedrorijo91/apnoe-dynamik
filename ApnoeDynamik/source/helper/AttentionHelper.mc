using Toybox.Attention;


class AttentionHelper {

	static function displayOn() {
		if (Attention has :backlight) {
            Attention.backlight(true);
        }
	}
	
    static function beep() {
        if (Attention has :playTone) {
            Attention.playTone(Attention.TONE_LOUD_BEEP);
        }
    }

    static function vibrate(dutyCycle, duration) {
        if (Attention has :vibrate) {
            Attention.vibrate([new Attention.VibeProfile(dutyCycle, duration)]);
        }
    }	
}