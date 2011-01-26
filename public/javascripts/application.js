// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	$('input').watermark();
	$('textarea').watermark();
	$('input.checkbox').iphoneStyle({ checkedLabel: 'Yes', uncheckedLabel: 'No' });
	$('div#current input').change( function() {
		$('div#end').toggle();
	});
});

