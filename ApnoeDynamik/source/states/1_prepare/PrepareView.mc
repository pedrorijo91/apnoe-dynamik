using Toybox.WatchUi;

class PrepareView extends WatchUi.View {

	var training;
	var state;

    function initialize(_state, _training) {
    	View.initialize();
    	state = _state;
    	training = _training;
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    	debug("PrepareView onShow");
    }

    // Update the view
    function onUpdate(dc) {
    	var timeInState = System.getTimer() - state.stateStartedAt;
    	
      	var textFeld;
        textFeld = View.findDrawableById("modusId");
        textFeld.setText("" + training.round + "|" + timeInState / 1000);
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    	debug("PrepareView onHide");
    }
}
