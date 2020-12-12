class MainLayoutView extends StateView {

	const DRAWABLE_MODE_ID = "modusId";
	const DRAWABLE_TIME_ID = "zeitId";
		    
    function initialize(_stateStartedAt, _stateDuration) {
    	StateView.initialize(_stateStartedAt, _stateDuration);
    }

	// Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        StateView.onLayout(dc);
    }
    
    function onShow() {
    	WatchUi.requestUpdate();
    	StateView.onShow();		
    }
    
    // Call this function before calling the parent onUpdate function!
    // Otherwise the layout will not have the updated values and draw "old" values.
	function setModeText(mode) {
		View.findDrawableById(DRAWABLE_MODE_ID).setText(mode);
	}
	
    // Call this function before calling the parent onUpdate function!
    // Otherwise the layout will not have the updated values and draw "old" values.
	function setTimeText(time) {
		if (time instanceof Toybox.Lang.Double || time instanceof Toybox.Lang.Float) {
			time = time.toNumber();
		}
		View.findDrawableById(DRAWABLE_TIME_ID).setText("" + time);        
    }
    
    // Call this function before calling the parent onUpdate function!
    // Otherwise the layout will not have the updated values and draw "old" values.
    function setTextById(id, value) {
    	View.findDrawableById(id).setText(value);
    }
}
    