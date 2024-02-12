/// @description  Approach(start, end, shift);
/// @param start
/// @param  end
/// @param  shift
function Approach(argument0, argument1, argument2) {

	if (argument0 < argument1)
	    return min(argument0 + argument2, argument1); 
	else
	    return max(argument0 - argument2, argument1);


}


function PlaceMeetingException(argument0, argument1, argument2, argument3) {
	var exception = argument3;

	with (argument2) {
	    var callingObj = id;
    
	    if (id == exception)
	        continue;
	    else
	        with (other)
	            if (place_meeting(argument0, argument1, callingObj))
	            return true;
	}

	return false;


}