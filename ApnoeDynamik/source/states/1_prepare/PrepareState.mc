using Toybox.WatchUi;

class PrepareState extends State {

    var countdown;

    function initialize() {
           debug("Switching to Prepare State.");

        initializeApp();

        State.initialize();

        var prepareDuration = currentTraining.prepareAndRelaxDurations[0];
           countdown = new Countdown(self, prepareDuration);

        var view = new PrepareView(countdown);

        WatchUi.switchToView(
            view,
            new PrepareDelegate(self),
            WatchUi.SLIDE_IMMEDIATE);
    }


    static function initializeApp() {

           // Build the Training object.
        currentTrainingSession = new TrainingSession();


        appActivityHelper.startRecording();
        appActivityHelper.distance.save(currentTraining.distance * 100); // ToDo  move * 100 to AcitivityHelper
        appActivityHelper.description.save(WatchUi.loadResource(Rez.Strings.phase1));
    }


    function onStateLeave() {
        countdown.stop();
    }


    function timeExpired() {
        switchToDive();
    }

    function togglePause() {
        countdown.togglePause();
    }


    function switchToDive() {
        debug("switchToDiveState.");
        var newState = new DiveState();
    }
}