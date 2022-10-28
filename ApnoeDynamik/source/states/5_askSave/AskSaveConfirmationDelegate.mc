using Toybox.WatchUi;

class AskSaveConfirmationDelegate extends WatchUi.ConfirmationDelegate {

    hidden var state;

    function initialize(_state) {
        state = _state;
        WatchUi.ConfirmationDelegate.initialize();
    }

    function onResponse(response) {
        debug("Got response from confirmation dialog: " + response);
        if (response == WatchUi.CONFIRM_YES) {
            state.save();
        } else {
            state.noSave();
        }
        return true;
    }
}