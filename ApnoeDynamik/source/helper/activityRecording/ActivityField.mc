using Toybox.FitContributor;


class ActivityField {

	var name;
	var dataType;
	var units;
	var mesgType;
	var initialValue;
	
	var field;
	
	
	// dataType can be: DATA_TYPE_ SINT8, UINT8, .. UINT32, STRING, FLOAT, DOUBLE
	// example: DATA_TYPE_STRING or DATA_TYPE_UINT16
	// mesgType can be: MESG_TYPE_SESSION, MESG_TYPE_LAP or MESG_TYPE_RECORD
	// If data type is string see ActivityHelper for max number of characters.
	function initialize(_name, _dataType, _units, _mesgType, _initialValue) {
		name = _name;
		dataType = _dataType;
		units = _units;
		mesgType = _mesgType;	
		initialValue = _initialValue;	
	}
	
	function save(value) {
		field.setData(value);
	}
}