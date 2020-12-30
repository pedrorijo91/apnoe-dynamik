using Toybox.ActivityRecording;
using Toybox.FitContributor;
using Toybox.WatchUi;

class ActivityHelperBase {

	static const MAX_NB_CHARS_FOR_STRINGS = 16;

	static var session;
	
		
	static var fields;
	
	function initialize(_fields) {
		fields = _fields;
	}

    function startRecording() {
    	debug("Starting recording.");
		if (Toybox has :ActivityRecording) {                          // check device for activity recording
        	var activityname = WatchUi.loadResource(Rez.Strings.AppName);
        	
            if ((session == null) || (session.isRecording() == false)) {
            	session = ActivityRecording.createSession(            // set up recording session
                	{
                    	:name=> activityname,                           // set session name
                        :sport=> ActivityRecording.SPORT_GENERIC,       // set sport type
                        :subSport=> ActivityRecording.SUB_SPORT_GENERIC // set sub sport type
                    }
                );
                
                // Go through our activityField wrapper class and create a "real" activityfield
                // We can then save data in those fields using setData.
                // Our wrapper has a save function which calls the setData function.
                for (var i = 0; i < fields.size(); i++) {
                	var currentField = fields[i];
                	var count = null;
                	if (currentField.dataType == FitContributor.DATA_TYPE_STRING) {
                		count = MAX_NB_CHARS_FOR_STRINGS;
                	}
	                var fitField = session.createField(currentField.name,
    	                                               i,
        	                                           currentField.dataType,
            	                                       {:mesgType=>currentField.mesgType, :count => count, :units=> currentField.units });
            	                                       
            	    // store the activity field in our wrapper.
            	    currentField.field = fitField;
            	    
            	    var initialValue = currentField.initialValue;
            	    if (initialValue != null) {
	            	    fitField.setData(initialValue);
            	    }
                }
                
                session.start();                                      // call start session
       		}
    	}
	}
	
	function addLap() {
    	debug("Adding lap in recording.");
		session.addLap();
	}
	
	function save() {
		debug("Saving session.");
		if (session != null) {
			session.save();
			session = null;
		}
	}

	function stopAndClearRecording() {
    	debug("Stop and clear recording");
		stopRecording();
		if (session != null) {
			session.discard();
			session = null;
		}
	}
	
    function stopRecording() {
    	debug("Stop recording");
    	if ((session != null) && session.isRecording()) {
        	session.stop();           // stop the session
        }
        for (var i = 0; i < fields.size(); i++) {
        	var currentField = fields[i];
        	currentField.field = null;
        }
    }
}