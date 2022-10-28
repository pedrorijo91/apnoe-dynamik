using Toybox.WatchUi;
using Toybox.Graphics;

using Toybox.Sensor;
using Toybox.Math;


class SensorView extends MainLayoutView {

    const UPDATE_INTERVALL = 1000;  // Update every second.
    var state;

    function initialize(_state) {
        state = _state;
        MainLayoutView.initialize();
    }

    var sensorInfos = [];
    var sensorCount = 0;
    var mPitch = 0;

    function onSensor(sensor) {
    //return;
    /*
    accel
The accelerometer reading of the x, y, and z axes as an Array of Number values in millig-units.
altitude
The altitude above mean sea level in meters (m).
cadence
The cadence in revolutions per minute (rpm).
heading
The true north referenced heading in radians.
heartRate
The heart rate in beats per minute (bpm).
mag
The magnetometer reading of the x, y, and z axes as an Array of Number values in milliGauss (mG).
oxygenSaturation
The current oxygen saturation in percent (%).
power
The power in Watts (W).
pressure
The barometric pressure in Pascals (Pa).
speed
The speed in meters per second (m/s).
temperature
The temperature in degre
*/
                  debug("accel: " + sensor.accel);
                  debug("altitude: " + sensor.altitude);
                  debug("cadence : " + sensor.cadence);
                  debug("heading : " + sensor.heading);
                  debug("mag : " + sensor.mag);
                  //debug("oxygenSaturation  : " + sensor.oxygenSaturation);
                  debug("power  : " + sensor.power);
                  debug("pressure  : " + sensor.pressure);
                  debug("speed  : " + sensor.speed);
                  debug("temperature  : " + sensor.temperature);
    }

    function accelHistoryCallback(sensorData) {
        var mSamplesX = sensorData.accelerometerData.x;
        var mSamplesY = sensorData.accelerometerData.y;
        var mSamplesZ = sensorData.accelerometerData.z;

        debug("Raw samples, X axis: " + mSamplesX);
        debug("Raw samples, Y axis: " + mSamplesY);
        debug("Raw samples, Z axis: " + mSamplesZ);
        var allPitchValues = sensorData.accelerometerData.pitch;
        debug("Pitch: " + allPitchValues);
        debug("Power: " + sensorData.accelerometerData.power);
        debug("Roll: " + sensorData.accelerometerData.roll);

        var pitchCount = 0;
        var onSide = 0;  // -1 and 1 for a side
        mPitch = 0;
        for (var i = 0; i < allPitchValues.size(); i++) {
            var currentPitchValue = allPitchValues[i] + 180;
            if (currentPitchValue > 190) {
                if (onSide == -1) {
                    pitchCount++;
                }
                onSide = 1;
            } else if (currentPitchValue < 170 and onSide == 1) {
                if (onSide == 1) {
                    pitchCount++;
                }
                onSide = -1;
            }
        }
        mPitch = pitchCount;
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
          debug("SensorView onShow");
          autoUpdate(UPDATE_INTERVALL);  // We update the homeView because of sensor data.
          MainLayoutView.onShow();

          //Sensor.setEnabledSensors([0,1,2,3,4,5,6,7,8]);
          //Sensor.enableSensorEvents(method( :onSensor ));

        // accel sensor
        var maxSampleRate = Sensor.getMaxSampleRate();
        debug("maxSampleRate: " + maxSampleRate);
        var options = {:period => 1, :accelerometer => { :enabled => true, :sampleRate => maxSampleRate, :includePower => true, :includePitch => true, :includeRoll => true} };
        try {
            Sensor.registerSensorDataListener(method(:accelHistoryCallback), options);
        } catch(e) {
            debug("Exception");
            debug(e.getErrorMessage());
        }

    }

    var counter = 0;

    // Update the view
    function onUpdate(dc) {

          var textFeldModus;
        textFeldModus = View.findDrawableById("modusId");
        textFeldModus.setText("Sensors");
        //if (sensorCount > 0) {
        //    textFeldModus.setText(sensorInfos[counter % sensorCount]);
        //}

        //counter++;



        var textFeldZeit;
        textFeldZeit = View.findDrawableById("zeitId");
        textFeldZeit.setText("" + mPitch);


        // Call the parent onUpdate function to redraw the layout
        MainLayoutView.onUpdate(dc);


        graphicsHelper.drawProgressInner(dc, 0, 1);
        graphicsHelper.drawProgressOuter(dc, 0, 1);
    }
}
