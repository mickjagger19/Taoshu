$(document).ready(function(){

    $("#leftnavigation").hide();
    $("#rightnavigation").hide();


});

window.onscroll = function () {
    var t = document.body.scrollTop;
    if (t > 400) {
        $("#leftnavigation").show(1000);
        $("#rightnavigation").show(1000);
    } else {
        $("#leftnavigation").hide();
        $("#rightnavigation").hide();
    }


};

//搜索框内容校验
function checkkeyword(){
    var keyword=document.getElementById("keyword").value;
    var reg=/^([\u4e00-\u9fa5]|[\w+]){1,12}$/;
    var check = reg.test(keyword);
    if(check){
        /* alert("检查通过了");*/
        $("#keywordform").submit();
    }else{
        if ( keyword===""|| keyword==null ){
            alert("搜索内容不能为空!");
        }else
            alert("搜索的时候不要输入奇怪的东西哦!");
    }

}

//定位滚动条的位置

//定位到顶部
function scrollPosition1(){

    window.scroll(0, 0);

}
//定位最近浏览标签
function scrollPosition2(){

    window.scroll(0, 850);

}
//定位新闻标签
function scrollPosition3(){

    window.scroll(0, 500);

}
//定位今日特价标签
function scrollPosition4(){

    window.scroll(0, 1300);

}

//确认弹窗
/*function my_confirm(){
	
        $.confirm({
            title: 'Auto close',
            content: '',
            autoClose: 'cancel|10000',//十秒自动执行cancel
            confirmButtonClass: 'btn-danger',
            confirmButton: '立即前往订单页',
            cancelButton: '10s后自动前往',
            confirm: function () {
                return true;
            },
            cancel: function () {
            	return false;
            }
        });
    
	
	
}*/

//提示窗口
/*function my_tip (my_content) {
  $.alert({
      title: '小提示：',
      content: my_content,
      confirmButton: '确认',
      confirmButtonClass: 'btn-info',
      animation: 'bottom',
      icon: 'fa fa-check',
      backgroundDismiss: true
  });
};*/
