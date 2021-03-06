<?php
define("LEN_MIN_PASSWORD", 8);
define("LEN_MAX_PASSWORD", 100);
define("WHITELIST_REGEX_PASSWORD", "/[\w\d\s~!@#$%^&*()]+/");

define("LEN_MAX_EMAIL", 50);
define("WHITELIST_REGEX_EMAIL", "/[\w\d\.]+@[\w\d]+\.[\w\d\.]+/");

define("LEN_MIN_PHONE_NUMBER", 7);
define("LEN_MAX_PHONE_NUMBER", 15);
define("WHITELIST_REGEX_PHONE_NUMBER", "/[\d]+/");

define("WHITELIST_REGEX_LOCATION", "/^-?[\.\d]+/");

define("WHITELIST_REGEX_UTC_TIMESTAMP", "/\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d/");

define("WHITELIST_NUMERIC", "/[\d]+/");
define("WHITELIST_ALPHABETIC", "/[\w]+/");



/*
 * Return true if given string is abides by the given max and min length values 
 * (inclusive). Will only check supplied length requirement(s).
 */
function isValidLength($string, $max_len=null, $min_len=null) {
	$valid = true;
	$str_len = strlen($string);

	// Check maximum length requirement
	if ($max_len) {
		$valid = $str_len <= $max_len;
	}

	// Check minimum length requirement (if it didn't already fail)
	if ($valid && $min_len) {
		$valid = $str_len >= $min_len;
	}

	return $valid;
}



/*
* Return true if all characters in the given input passed whitelisting, false
* otherwise. Valid characters and formats are determined by the given regex.
*/
function whitelistString($string, $whitelist_regex) {
	$valid = false;

	// Check string content
	if (preg_match($whitelist_regex, $string, $matched) !== false) {
		if (!empty($matched)) {
			$valid = $string === $matched[0];
		}
	}

	return $valid;
}



/*
 * Return true if the given parameter exists as a direct member of the given 
 * object and is not null or the empty string.
 */
function parameterExists($object, $param_name) {
	$exists = false;

	// Check that property exists
	if (property_exists($object, $param_name)) {
		// Check that value is not null or empty
		if ($object->$param_name != null 
					&& $object->$param_name != '') 
		{
			$exists = true;
		}
	}

	return $exists;
}





?>
