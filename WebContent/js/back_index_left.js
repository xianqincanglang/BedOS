$(document).ready(function(){
	$(function() {
		$(".subNavTitle").click(
				function() {
					$(this).toggleClass("currentDd").siblings(".subNavTitle")
							.removeClass("currentDd")
					$(this).toggleClass("currentDt").siblings(".subNavTitle")
							.removeClass("currentDt")
					$(this).next(".navContent").slideToggle(300).siblings(
							".navContent").slideUp(500)
					
				})

	})
});

