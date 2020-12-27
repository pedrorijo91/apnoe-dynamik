using Toybox.Sensor;

var sensorData = new SensorData();

class SensorData {

	function initialize() {
		Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE]);
        Sensor.enableSensorEvents(method(:onSensor));  
	}
 	 	
 	var currentHeartRate = 0;
 
 
    function onSensor(sensorInfo) {
    	currentHeartRate = sensorInfo.heartRate;
    }
 }