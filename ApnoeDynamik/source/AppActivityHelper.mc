
var appActivityHelper; // set in App.mc

// Uses the ActivityHelperBase to provide App specific activity functionality.
class AppActivityHelper extends ActivityHelperBase {
	
		
	static const FIELD_DESC = "desc";
	static const FIELD_DIST = "dist";
	
	
	var description;
	var distance;
	
	
	function initialize() {
		description = new ActivityField(0, FIELD_DESC, FitContributor.DATA_TYPE_STRING, FitContributor.MESG_TYPE_LAP, "PREPARE");
		distance = new ActivityField(1, FIELD_DIST, FitContributor.DATA_TYPE_UINT16, FitContributor.MESG_TYPE_SESSION, null);
		
		ActivityHelperBase.initialize([description, distance]);
	}
}