using Toybox.WatchUi;
using Toybox.Graphics;


class HomeView extends MainLayoutView {
	
    function initialize() {
    	MainLayoutView.initialize(null, null);
    }

	
    // Update the view
    function onUpdate(dc) {
    	// Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);
       
  		var textFeld;
        textFeld = View.findDrawableById("modusId");
        textFeld.setText("HOME");
        
      	//Test Anzeige Felder
    	var textFeldZeit;
        textFeldZeit = View.findDrawableById("zeitId");
        textFeldZeit.setText("1:35");
    	
    	var textFeldHR;
        textFeldHR = View.findDrawableById("pulsId");
        textFeldHR.setText("hr 106");
    	
    	var textFeldMeter;
        textFeldMeter = View.findDrawableById("langId");
        textFeldMeter.setText("25m");
    }
}
