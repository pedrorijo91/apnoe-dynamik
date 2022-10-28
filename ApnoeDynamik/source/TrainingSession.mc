using Toybox.System; //max

// The current training session will always be accessible with this variable.
// currentTrainingSession is initialized by the PrepareState.
// All other states modify values inside the TrainingSession object.
var currentTrainingSession;

class TrainingSession {

     // When the training starts, we ask the watch for the current "time"
     var startTime;

     var round = 0;

     var diveTimes = [];


     function initialize() {
        // getTimer() returns the current millisecond timer.
         // The value is a 32 bit integer representing the number of milliseconds the system has been running.
         // The value can be used for timing but is allowed to roll over.
         startTime = System.getTimer();
     }
}