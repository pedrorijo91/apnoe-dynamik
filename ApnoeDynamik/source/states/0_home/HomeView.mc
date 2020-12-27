using Toybox.WatchUi;
using Toybox.Graphics;


class HomeView extends MainLayoutView {
	
	const UPDATE_INTERVALL = 1000;  // Update every second.


    function initialize() {
    	MainLayoutView.initialize();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
  		debug("HomeView onShow");
  		autoUpdate(UPDATE_INTERVALL);  // We update the homeView because of the heart-rate.
  		MainLayoutView.onShow();    	
    }
    
	
    // Update the view
    function onUpdate(dc) {

  		var textFeldModus;
        textFeldModus = View.findDrawableById("modusId");
        textFeldModus.setText(WatchUi.loadResource(Rez.Strings.phase0));
        
        
        var prepareZeit = "99:99"; // prepareDuration;
        
        var textFeldZeit;
        textFeldZeit = View.findDrawableById("zeitId");
        textFeldZeit.setText(prepareZeit);
//        
//        var textFeldMeter;
//        textFeldMeter = View.findDrawableById("infoId");
//        var mSuffix = WatchUi.loadResource(Rez.Strings.meterSuffix);
//        textFeldMeter.setText("50" + mSuffix);

    	// Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);
               
                
        drawProgressInner(dc, 0, 1);
        drawProgressOuter(dc, 0, 1);
    }
}
