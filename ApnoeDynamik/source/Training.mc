 var currentTraining;
 
 class Training {
 	
 	// These durations are extracted from the settings.
 	// All times in ms.
 	var prepareAndRelaxDurations;
 	
 	var distance;
 	
 	function initialize() {
 		// Get settings and build information for a training.
 		distance = 25;
 		
 		prepareAndRelaxDurations = [
 			15000, // prepare
	 		85000,
//	 		14000,
//	 		13000,
//	 		12000,
	 		11000
	 	];
 	}
 	
 	function rounds() {
 		return prepareAndRelaxDurations.size();
 	}
 }