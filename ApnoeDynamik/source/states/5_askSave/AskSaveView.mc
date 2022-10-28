using Toybox.WatchUi;

class AskSaveView  extends WatchUi.View {

    var state;

    function initialize(_state) {
        WatchUi.View.initialize();
        state = _state;
    }

    function onShow() {
        var askSaveQuestion = WatchUi.loadResource(Rez.Strings.saveActivityQuestion);

        var confirmationView = new WatchUi.Confirmation(askSaveQuestion);
        var confirmationDelegate = new AskSaveConfirmationDelegate(state);
        WatchUi.pushView(
            confirmationView,
            confirmationDelegate,
            WatchUi.SLIDE_IMMEDIATE);
    }
}
