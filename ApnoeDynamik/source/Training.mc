 class Training {
 	
 	// These durations are extracted from the settings.
 	// All times in ms.
 	var prepareDuration;
 	var relaxDurations;
 	
 	// When the training starts, we ask the watch for the current "time"
 	var startTime;
 	
 	var round = 0;
 	
 	
 	
 	function initialize() {
 		// Get settings and build information for a training.
 		prepareDuration = 3000;
 		
 		relaxDurations = [
	 		5000,
	 		4000,
	 		3000,
	 		7000,
	 		2000
	 	];
	 	
		// getTimer() returns the current millisecond timer.
 		// The value is a 32 bit integer representing the number of milliseconds the system has been running.
 		// The value can be used for timing but is allowed to roll over.
	 	startTime = System.getTimer();
 	}
 }