using Toybox.WatchUi;

var appActivityHelper; // set in App.mc

// Uses the ActivityHelperBase to provide App specific activity functionality.
class AppActivityHelper extends ActivityHelperBase {
	

	static const FIELD_DESC = WatchUi.loadResource(Rez.Strings.aahDesc);
	static const FIELD_DESC_GRAPH = WatchUi.loadResource(Rez.Strings.aahDescGraph);
	static const FIELD_DIST = WatchUi.loadResource(Rez.Strings.aahDescDist);
	
	var description;
	var distance;
	var diveActive;
	

	// https://developer.garmin.com/connect-iq/api-docs/Toybox/FitContributor.html
	function initialize() {
		// All IDs must correspond to the ids in fit-contributions.
		
		// graph (record) fields
		diveActive = new ActivityField(0, FIELD_DESC_GRAPH, FitContributor.DATA_TYPE_UINT8, FitContributor.MESG_TYPE_RECORD, 0);
		
		// summary (session) fields
		//distance = new ActivityField(1, FIELD_DIST, FitContributor.DATA_TYPE_UINT16, FitContributor.MESG_TYPE_SESSION, null);
		// 44 is the native number extracted from the excel "Profile.xlsx" which is distributed with the fit SDK.
		// (see second tab "Messages")
		// - to tell the ActivityHelperBase, that this is a nativeNum:
		// make sure that there is no 44 id for other fields.
		distance = new ActivityField(-44, FIELD_DIST, FitContributor.DATA_TYPE_UINT16, FitContributor.MESG_TYPE_SESSION, null);

		// lap (lap) fields
		description = new ActivityField(1, FIELD_DESC, FitContributor.DATA_TYPE_STRING, FitContributor.MESG_TYPE_LAP, null);
		
		ActivityHelperBase.initialize([ diveActive, distance, description ], ActivityRecording.SPORT_SWIMMING, ActivityRecording.SUB_SPORT_GENERIC);
		//ActivityHelperBase.initialize([ diveActive, distance, description ], ActivityRecording.SPORT_GENERIC, ActivityRecording.SUB_SPORT_GENERIC);
	}
}