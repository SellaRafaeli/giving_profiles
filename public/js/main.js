function toggleDiv(selector) {
  $(selector).toggleClass('hidden');
}

$( document ).ready(function() {
	$.material.init(); //init material design
	console.log('done on-document-ready')
}); 