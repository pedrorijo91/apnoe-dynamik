 using Toybox.Math;
 
 var currentTraining;
 
 class Training {
 	
 	// These durations are extracted from the settings.
 	// All times in ms.
 	var prepareAndRelaxDurations;
 	
 	var distance;
 	
 	/*
 	
	static const PROP_DISTANCE = "propDistance";
	static const PROP_PREPARE = "propPrepare";
	static const PROP_ROUNDS = "propRounds";
	static const PROP_FIRST_RELAX = "propFirstRelax";
	static const PROP_RELAX_REDUCE = "propRelaxReduce";
	static const PROP_ADJUST_INTERVAL = "propAdjustInterval";
	*/
	
	
	static function hasRoundValidDuration(n) {
		return _calculateSecondsDurationForRound(n) > 0;
	}
	
	static function calculateSecondsDurationForRound(n) {
		var rTime = _calculateSecondsDurationForRound(n);
		if (rTime <= 0) {
			return 1;
		}
		return rTime; 
	}
	
	static function _calculateSecondsDurationForRound(n) {
		var firstRelax = SettingsHelper.get(Menu.PROP_FIRST_RELAX);
		var relaxReduce = SettingsHelper.get(Menu.PROP_RELAX_REDUCE);
		var interval = SettingsHelper.get(Menu.PROP_ADJUST_INTERVAL).toFloat();
		debug ("firstRelax = " + firstRelax);
		debug ("relaxReduce = " + relaxReduce);
		debug ("interval = " + interval);
		
		if (interval == 0) {
			// Incorrect settings?  (Shouldn't be possible).
			// Prevent division by 0
			interval = 1;
		}
		var roundsInterval = Math.ceil(n / interval).toNumber(); // Ergebnis wir immer auf eine ganze Zahl aufgerundet
		debug ("roundsInterval = " + roundsInterval);
		
		var rTime = firstRelax - (relaxReduce * (roundsInterval - 1)); // Zeit in Sekunden
		debug ("rTime = " + rTime);
		return rTime;
	}
	
 	
 	function initialize() {
 	
 		// Get settings and build information for a training.
 		distance = SettingsHelper.get(Menu.PROP_DISTANCE);
 		
 		var prepareInS = SettingsHelper.get(Menu.PROP_PREPARE);
 		// Start with only prepare.
 		// All other values are calculated in the loop below.
 		prepareAndRelaxDurations = [
 			prepareInS * 1000
	 	];
	 	
	 	var rounds = SettingsHelper.get(Menu.PROP_ROUNDS);
	 	var firstRelax = SettingsHelper.get(Menu.PROP_FIRST_RELAX);
	 	var relaxReduce = SettingsHelper.get(Menu.PROP_RELAX_REDUCE);
	 	var adjustInverval = SettingsHelper.get(Menu.PROP_ADJUST_INTERVAL);

		// Start with 1.  prepare is the first round.
 		for (var i = 1; i < rounds; i++) {
 			var rDuration = calculateSecondsDurationForRound(i + 1);
 			debug("Adding another relax duration: " + rDuration);
 			prepareAndRelaxDurations.add(rDuration * 1000);
 		}
 	}
 	
 	function rounds() {
 		return prepareAndRelaxDurations.size();
 	}
 }