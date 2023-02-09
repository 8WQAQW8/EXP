// JavaScript Document
/*global jQuery:false */
$(function(){
	wow = new WOW({
	animateClass: 'animate__animated',
					offset: 0
	});
	wow.init();
	$("#js-rotating").Morphext({
		animation: "animate__animated animate__slideInRight", // Overrides default "bounceIn"
		separator: ",", // Overrides default ","
		speed: 3500, // Overrides default 2000
		complete: function () {
			// Overrides default empty function
		}
	});
});
