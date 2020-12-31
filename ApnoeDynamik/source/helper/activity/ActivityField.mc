using Toybox.FitContributor;


class ActivityField {

	var id;
	var name;
	var dataType;
	var mesgType;
	var initialValue;
	
	var field;
	
	
	// id must be the same number as in fit-contributions.xml
	// dataType can be: DATA_TYPE_ SINT8, UINT8, .. UINT32, STRING, FLOAT, DOUBLE
	// example: DATA_TYPE_STRING or DATA_TYPE_UINT16
	// mesgType can be: MESG_TYPE_SESSION, MESG_TYPE_LAP or MESG_TYPE_RECORD
	// If data type is string see ActivityHelper for max number of characters.
	function initialize(_id, _name, _dataType, _mesgType, _initialValue) {
		id = _id;
		name = _name;
		dataType = _dataType;
		mesgType = _mesgType;	
		initialValue = _initialValue;	
	}
	
	function save(value) {
		field.setData(value);
	}
}