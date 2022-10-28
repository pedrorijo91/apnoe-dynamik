using Toybox.WatchUi;

// 1c25be4f-39b0-4642-bba0-fb241c4ae82b

class SensorState extends State {

    function initialize() {
          debug("Switching to Sensor state.");

        State.initialize();

        // Keep the AppView on the stack.  Probably not necessary.
        WatchUi.pushView(
            new SensorView(self),
            new SensorDelegate(self),
            WatchUi.SLIDE_IMMEDIATE);
    }

}