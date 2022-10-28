using Toybox.WatchUi;

class AskSaveState extends State {

    function initialize() {
           debug("Switching to AskSave State.");

        State.initialize();

        var view = new AskSaveView(self);
        var delegate = new AskSaveDelegate();

        WatchUi.switchToView(
            view,
            delegate,
            WatchUi.SLIDE_IMMEDIATE);
    }

    function save() {
        appActivityHelper.save();
        switchToHomeState();
    }

    function noSave() {
        appActivityHelper.stopAndClearRecording();
        switchToHomeState();
    }

    hidden function switchToHomeState() {
        var newState = new HomeState();
    }
}