$(function(){
	//全选按钮  checkbox
	//1、为表头的checkbox 全选按钮绑定click事件
	$(".choose_all").on("click", function() {
		//2、每次点击全查看全选按钮的状态(checked true)
		var state = $(this).prop("checked");
		//3、将所有checkbox的状态改为全选按钮的状态
		$(".single").prop("checked", state);
	});

	//单个 checkbox按钮 
	$(".single").on("click", function() {
		if ($(".single:checked").length == $(".single").length) {
			$(".choose_all").prop("checked", true);
		} else {
			$(".choose_all").prop("checked", false);
		}
	});
});