using Toybox.Graphics;
using Toybox.WatchUi;

class GraphicsView extends WatchUi.View {
    
    const INNER_RADIUS = 88;
    
    const INNER_PROGRESS_RADIUS = 99;
    const OUTER_PROGRESS_RADIUS = 114;
    
    const STATE_ARC_WIDTH = 12;
    
    const MAIN_COLOR = 0xffff00;
    const SECONDARY_COLOR = 0xffaa00;
    const PROGRESS_BACKGROUND_COLOR = Graphics.COLOR_DK_GRAY;
    
    function initialize() {
    	View.initialize();
    }
    
    	
	function centerX(dc) {
		return dc.getWidth()/2;
	}
	
	function centerY(dc) {
		return dc.getHeight()/2;
	}
    
	function drawArcAt12oClock(dc, angle, direction, width, radius, color) {
	    dc.setColor(color, Graphics.COLOR_TRANSPARENT);
    	dc.setPenWidth(width);
    	radius = radius;
    	
    	// Reduce arc by 1 degree at both ends for black line
    	var degreeStart = 1;
	   	var degreeEnd = angle - 1;
	   	
	   	// Do we still have to draw something?
	   	if (degreeEnd > degreeStart) {
	   		if (direction == Graphics.ARC_CLOCKWISE) {
				// 0° ist at 3oClock position, so subtract angle from 90°
				degreeStart = 90 - degreeStart;
		   		degreeEnd = 90 - degreeEnd;
	    	} else {
	    		// COUNTER_CLOCKWISE
		  		// 0° ist at 3oClock position, so add angle at 90° position
				degreeStart = 90 + degreeStart;
				degreeEnd = 90 + degreeEnd;
	    	}
			dc.drawArc(centerX(dc), centerY(dc), radius, direction, degreeStart, degreeEnd);
    	}
	}
	
		
	function angleDone(isState, completeState) {
		return isState * 360.0 / completeState;
	}
	
	function drawProgressArcs(dc, isState, completeState, radius, color, backgroundColor) {
		var angleDone = angleDone(isState, completeState);
		var angleToDo = 360 - angleDone;
  		drawArcAt12oClock(dc, angleDone, Graphics.ARC_CLOCKWISE, STATE_ARC_WIDTH, radius, color);
		drawArcAt12oClock(dc, angleToDo, Graphics.ARC_COUNTER_CLOCKWISE, STATE_ARC_WIDTH, radius, backgroundColor);
	}
	
	function drawProgressInner(dc, isState, completeState) {
		drawProgressArcs(dc, isState, completeState, INNER_PROGRESS_RADIUS, MAIN_COLOR, PROGRESS_BACKGROUND_COLOR);
	}
	
	function drawProgressInnerInverted(dc, isState, completeState) {
		drawProgressArcs(dc, isState, completeState, INNER_PROGRESS_RADIUS, PROGRESS_BACKGROUND_COLOR, MAIN_COLOR);
	}
	
	function drawProgressOuter(dc, isState, completeState) {
		drawProgressArcs(dc, isState, completeState, OUTER_PROGRESS_RADIUS, SECONDARY_COLOR, PROGRESS_BACKGROUND_COLOR);
	} 
	 
	
	function blackCenter(dc) {
	    //Countdown Grafik
    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
    	dc.fillCircle(centerX(dc), centerY(dc), INNER_RADIUS);
    }
	
	function drawBigCenteredNumber(dc, number, color) {
		blackCenter(dc);
		
		if (number instanceof Toybox.Lang.Double || number instanceof Toybox.Lang.Float) {
			number = number.toNumber();
		}
		
		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
    	dc.drawText(
    	        centerX(dc),
    	        centerY(dc),
    	        Graphics.FONT_NUMBER_THAI_HOT,                    	// sets the font size
    	        number,                          					// the String to display
    	        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER            // sets the justification for the text
        );
	}
	
	// A drawable example: Rez.Drawables.countdownGo
	// The drawable must be in drawables.xml:
	//     <bitmap id="countdownGo" filename="go.png" />
	function drawImgCentered(dc, drawable) {
		blackCenter(dc);
    	var img = WatchUi.loadResource(drawable);
    	dc.drawBitmap(centerX(dc) - centerX(img), centerY(dc) - centerY(img), img);		
	}
}