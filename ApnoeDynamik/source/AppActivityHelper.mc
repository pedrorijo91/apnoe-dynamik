
var appActivityHelper; // set in App.mc

// Uses the ActivityHelperBase to provide App specific activity functionality.
class AppActivityHelper extends ActivityHelperBase {
	
		
	static const FIELD_AVG_HR = "avHR";
	static const FIELD_DESC = "desc";
	static const FIELD_DIST = "dist";
	
	
	var bpm;
	var description;
	var distance;
	
	
	function initialize() {
		bpm = new ActivityField(FIELD_AVG_HR, FitContributor.DATA_TYPE_UINT16, "bpm", FitContributor.MESG_TYPE_LAP, null);
		description = new ActivityField(FIELD_DESC, FitContributor.DATA_TYPE_STRING, null, FitContributor.MESG_TYPE_LAP, "PREPARE");
		distance = new ActivityField(FIELD_DIST, FitContributor.DATA_TYPE_UINT16, "m", FitContributor.MESG_TYPE_SESSION, null);
		ActivityHelperBase.initialize([bpm, description, distance]);
	}
}