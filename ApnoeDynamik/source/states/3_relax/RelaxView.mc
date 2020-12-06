using Toybox.WatchUi;

class RelaxView extends WatchUi.View {

	var training;
	
	function initialize(_training) {
        View.initialize();
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
  		debug("RelaxView onShow");
    }

    // Update the view
    function onUpdate(dc) {
      	var textFeld;
        textFeld = View.findDrawableById("modusId");
        textFeld.setText("Relax");
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    	debug("RelaxView onHide");
    }
}
