$(function(){
	$("#gw_newSassy").on("click", function(evt){
			$(".gw_newSassy").show();
			$(".gw_newNice").hide();
			$(".gw_newBlank").hide();

			$("#gw_newSassy").addClass("gw_active");
			$("#gw_newNice").removeClass("gw_active");
			$("#gw_newBlank").removeClass("gw_active");
	})
	$("#gw_newNice").on("click", function(evt){
			$(".gw_newSassy").hide();
			$(".gw_newNice").show();
			$(".gw_newBlank").hide();

			$("#gw_newSassy").removeClass("gw_active");
			$("#gw_newNice").addClass("gw_active");
			$("#gw_newBlank").removeClass("gw_active");
	})
	$("#gw_newBlank").on("click", function(evt){
			$(".gw_newSassy").hide();
			$(".gw_newNice").hide();
			$(".gw_newBlank").show();

			$("#gw_newSassy").removeClass("gw_active");
			$("#gw_newNice").removeClass("gw_active");
			$("#gw_newBlank").addClass("gw_active");
	})
	return false;
})