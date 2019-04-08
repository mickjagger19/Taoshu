/**
 * Created by Administrator on 2017/11/17 0017.
 */
$(document).ready(function(){

    $("#AddresFormHidden").hide();


});

function showNewAddress(){
    if($('#AddresFormHidden').is(':hidden')){
        $('#AddresFormHidden').show(1000);

    }else{
        $('#AddresFormHidden').hide(1000);
    }
}

//用户添加新的收货地址
function addAddress(){
    
    var uname=$('#AddresFormHidden p:eq(0) input').val();//收货人
    var na_label=$('#AddresFormHidden p:eq(1) input').val();//地址标签
    var na_tel=$('#AddresFormHidden p:eq(2) input').val();//手机号
    var na_province=$('#AddresFormHidden div:eq(1) div:eq(0) select').val();//省
    var na_city=$('#AddresFormHidden div:eq(1) div:eq(1) select').val();//市
    var na_district=$('#AddresFormHidden div:eq(1) div:eq(2) select').val();//（区/县）
    var particular=$('#AddresFormHidden p:eq(3) input').val();//详细地址
    
    $.post('ajax/addaddressServlet.do',{
    	'uname':uname,'na_label':na_label,'na_tel':na_tel,'na_province':na_province,
    	'na_city':na_city,'na_district':na_district,'particular':particular
    },function(data){
    	if(data>0){
    		//把隐藏表单的内容放入显示区
    	    $('#addnewaddress span:eq(0)').html(uname);
    	    $('#addnewaddress span:eq(1)').html(na_label);
    	    $('#addnewaddress span:eq(2)').html(na_tel);
    	    $('#addnewaddress span:eq(3)').html(na_province+"&nbsp;"+na_city+"&nbsp;"+na_district);
    	    $('#addnewaddress span:eq(4)').html(particular);
    	}else{
    		/*alert("不知道什么原因，新的收货地址并没有创建~~");*/
    		$.alert({
    		      title: '小提示：',
    		      content: '不知道什么原因，新的收货地址并没有创建~~',
    		      confirmButton: '确认',
    		      confirmButtonClass: 'btn-info',
    		      animation: 'bottom',
    		      icon: 'fa fa-check',
    		      backgroundDismiss: true
    		  });
    	}

    },'json');

    $('#AddresFormHidden').hide(1000);
}

//提交订单
function submitOrderForm(sids){
	/*alert(sids);*/
	
		$.post('ajax/submitOrderForm.do',{sids:sids.toString(),'abc':'大海航行靠舵手'},function(data){
			
			if(data>0){
				alert("下单成功啦~");
				window.location.href = '/MySpringMvcProject2/myinfo/myInformationServlet.do';
				/*$.alert({
				      title: '小提示：',
				      content: '下单成功啦~',
				      confirmButton: '确认',
				      confirmButtonClass: 'btn-info',
				      animation: 'bottom',
				      icon: 'fa fa-check',
				      backgroundDismiss: true
				  });*/
				
				
				
			}else{
				$.alert({
				      title: '小提示：',
				      content: '下单失败啦~',
				      confirmButton: '确认',
				      confirmButtonClass: 'btn-info',
				      animation: 'bottom',
				      icon: 'fa fa-check',
				      backgroundDismiss: true
				  });
				/*alert ("下单失败了~");*/
			}
		},'json');
	
	
	
	
}
/*//确认窗口
function my_confirm(){
    $.confirm({
        title: '订单已结算~',
        content: '',
        autoClose: 'cancel|10000',//十秒自动执行cancel
        confirmButtonClass: 'btn-danger',
        confirmButton: '立即前往订单页',
        cancelButton: '10s后自动前往',
        confirm: function () {
            return true;
        },
        cancel: function () {
        	window.location.href = 'myInformationServlet.do';
        }
    });
}*/

/*//提示窗口
function my_tip (my_content) {
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


