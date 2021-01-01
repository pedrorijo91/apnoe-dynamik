using Toybox.Math;

class TextHelper {

	// This function takes milli-seconds and returns a string of the format:
	// mm:ss
    static function msTimeToDisplayText(timeInMs) {
    	return sTimeToDisplayText(Math.round(timeInMs / 1000.0));
    }
    
    // This function takes seconds and returns a string of the format:
	// mm:ss
    static function sTimeToDisplayText(timeInS) {
    	if (timeInS instanceof Toybox.Lang.Double || timeInS instanceof Toybox.Lang.Float) {
			timeInS = timeInS.toNumber();
		}
		
		var minutes = timeInS / 60;  // division loses remainder  63 / 60 => 1
		var seconds = timeInS % 60;  // get the remainder         63 % 60 => 3

		return "" + minutes + ":" + seconds.format("%02d");
    }
}