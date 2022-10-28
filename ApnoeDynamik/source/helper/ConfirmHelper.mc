using Toybox.WatchUi;

class ConfirmHelper extends WatchUi.ConfirmationDelegate {

    hidden var onYes;
    hidden var onNo;

    function initialize(_onYes, _onNo) {
        WatchUi.ConfirmationDelegate.initialize();
        onYes = _onYes;
        onNo = _onNo;
    }

    // onYes and onNo are not allowed to open/switch Views
    // They may close the active view.
    // To get an onYes / onNo function use:
    // method(:yourFunction)
    static function askQuestion(question, onYes, onNo) {
        debug("Show confirmation dialog with question: " + question);
        var confirmationView = new WatchUi.Confirmation(question);

        var confirmationDelegate = new ConfirmHelper(onYes, onNo);
        WatchUi.pushView(
            confirmationView,
            confirmationDelegate,
            WatchUi.SLIDE_IMMEDIATE);
    }


    function onResponse(response) {
        debug("Got response from confirmation dialog: " + response);
        if (response == WatchUi.CONFIRM_YES) {
            onYes.invoke(); // onYes is a method object.  Calling invoke is equivalent to calling the function itself.
        } else {
            onNo.invoke();
        }
        return true;
    }
}
