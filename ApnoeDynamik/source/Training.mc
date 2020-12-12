 var currentTraining;
 
 class Training {
 	
 	// These durations are extracted from the settings.
 	// All times in ms.
 	var prepareDuration;
 	var relaxDurations;
 	
 	function initialize() {
 		// Get settings and build information for a training.
 		prepareDuration = 11000;
 		
 		relaxDurations = [
	 		12000,
	 		13000,
	 		14000,
	 		13000,
	 		12000
	 	];
 	}
 	
 	function rounds() {
 		return relaxDurations.size();
 	}
 }