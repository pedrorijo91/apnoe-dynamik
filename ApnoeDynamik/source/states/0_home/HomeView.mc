using Toybox.WatchUi;
using Toybox.Graphics;


class HomeView extends MainLayoutView {
	
	const UPDATE_INTERVALL = 1000;  // Update every second.
	var state;
	var firstOnShow = true;

    function initialize(_state) {
    	state = _state;
    	MainLayoutView.initialize();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
  		debug("HomeView onShow");
  		autoUpdate(UPDATE_INTERVALL);  // We update the homeView because of the heart-rate.
  		MainLayoutView.onShow();
  		
  		if (!firstOnShow) {
  			state.viewReloaded();
  		} else {
  			firstOnShow = false;
  		}	
    }
    
	
    // Update the view
    function onUpdate(dc) {

  		var textFeldModus;
        textFeldModus = View.findDrawableById("modusId");
        textFeldModus.setText(WatchUi.loadResource(Rez.Strings.phase0));
        
        
        var prepareZeit = currentTraining.prepareAndRelaxDurations[0];
        
        var textFeldZeit;
        textFeldZeit = View.findDrawableById("zeitId");
        textFeldZeit.setText(TextHelper.msTimeToDisplayText(prepareZeit));


    	// Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);
               
                
        graphicsHelper.drawProgressInner(dc, 0, 1);
        graphicsHelper.drawProgressOuter(dc, 0, 1);
    }
}
