 var currentTraining;
 
 class Training {
 	
 	// These durations are extracted from the settings.
 	// All times in ms.
 	var prepareDuration;
 	var relaxDurations;
 	
 	var distance;
 	
 	function initialize() {
 		// Get settings and build information for a training.
 		prepareDuration = 15000;
 		
 		distance = 25;
 		
 		relaxDurations = [
	 		85000,
//	 		14000,
//	 		13000,
//	 		12000,
	 		11000
	 	];
 	}
 	
 	function rounds() {
 		return relaxDurations.size();
 	}
 }