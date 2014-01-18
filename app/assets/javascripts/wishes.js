$(function(){
	$("#gw_newSass").on("click", function(evt){
			$(".gw_newSass").show();
			$(".gw_newNice").hide();
			$(".gw_newBlank").hide();

			$("#gw_newSass").addClass("gw_active");
			$("#gw_newNice").removeClass("gw_active");
			$("#gw_newBlank").removeClass("gw_active");
	})
	$("#gw_newNice").on("click", function(evt){
			$(".gw_newSass").hide();
			$(".gw_newNice").show();
			$(".gw_newBlank").hide();

			$("#gw_newSass").removeClass("gw_active");
			$("#gw_newNice").addClass("gw_active");
			$("#gw_newBlank").removeClass("gw_active");
	})
	$("#gw_newBlank").on("click", function(evt){
			$(".gw_newSass").hide();
			$(".gw_newNice").hide();
			$(".gw_newBlank").show();

			$("#gw_newSass").removeClass("gw_active");
			$("#gw_newNice").removeClass("gw_active");
			$("#gw_newBlank").addClass("gw_active");
	})
	return false;
})