using Toybox.Math;

class TextHelper {

	// This function takes milli-seconds and returns a string of the format:
	// mm:ss
    static function timeToDisplayText(timeInMs) {
    	var time = Math.round(timeInMs / 1000.0);
    	
    	if (time instanceof Toybox.Lang.Double || time instanceof Toybox.Lang.Float) {
			time = time.toNumber();
		}
		
		var minutes = time / 60;  // division loses remainder  63 / 60 => 1
		var seconds = time % 60;  // get the remainder         63 % 60 => 3

		return "" + minutes + ":" + seconds.format("%02d");
    }
}