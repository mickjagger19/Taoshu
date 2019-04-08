/**
 * Created by OracleOAEC on 2017/10/20.
 */
//这个方法是测试的
function checkAny(reg, id1, id2, msg, tip) {
    var reg = reg;
    var uname = document.getElementById(id1).value;
    var uname2 = document.getElementById(id2);
    var check = reg.test(uname);
    if (!check) {
        uname2.innerHTML = msg;

    } else {
        uname2.innerHTML = tip;
    }
}

$(document).ready(function(){

    $("#butt button:eq(0)").attr("disabled",true);

});
//第二次输入密码校验的方法
function checkpwd() {
    if ($("#pwd input:eq(0)").val() != "") {
        if ($("#pwd input:eq(0)").val() != $("#pwd2 input:eq(0)").val()) {
            $("#pwd2").removeClass("form-group has-success has-feedback");
            $("#pwd2").addClass("form-group has-error");
            $("#pwd2 label:eq(1)").html("两次密码不一样哦~");
        } else {
            $("#pwd2").removeClass("form-group has-error");
            $("#pwd2").addClass("form-group has-success has-feedback");
            $("#pwd2 label:eq(1)").html("嗯，对了~");
        }
    } else {
        $("#pwd2").removeClass("form-group has-success has-feedback");
        $("#pwd2").addClass("form-group has-error");
        $("#pwd2 label:eq(1)").html("喵，没输密码是注册不了的哟~");
    }
}


//执行输入校验的方法
function checkemail_Any(id1, label, input, reg, span) {
    var reg = reg;
    var uname = input.val();
    //获取input的name属性值
    var inputName=input.attr("name");
    var check = reg.test(uname);
    if (input.val()!=="") {
        if (!check) {
            $(id1).removeClass("form-group has-success has-feedback");
            $(id1).addClass("form-group has-error");
            $(span).removeClass("glyphicon glyphicon-ok form-control-feedback");
            $(span).addClass("glyphicon glyphicon-remove form-control-feedback");
            $(label).html("亲，要按格式输入哦~");
        } else {
        	if(inputName==="uAccount"){
        	    console.log("正在检验账号是否已被注册");
            	//如果校验的是账号，才执行ajax
            	$.post('ajax/registerCheckAccount.do',{uaccount:uname},function(data){
            		/*alert("coming"+data);*/
            		if(data==='false'){
            			$(id1).removeClass("form-group has-success has-feedback");
                        $(id1).addClass("form-group has-error");
                        $(span).removeClass("glyphicon glyphicon-ok form-control-feedback");
                        $(span).addClass("glyphicon glyphicon-remove form-control-feedback");
                        $(label).html("哎，该账号被别人注册啦~");
                        console.log("该账号被别人注册");
            			check=false;
            		}else{
                        console.log("该账号未被别人注册");
            			$(id1).removeClass("form-group has-error");
                        $(id1).addClass("form-group has-success has-feedback");
                        $(span).removeClass("glyphicon glyphicon-remove form-control-feedback");
                        $(span).addClass("glyphicon glyphicon-ok form-control-feedback");
                        $(label).html("嗯，对了~");
                        check=true;
            		}
            		
            	},'html');
            }else{//校验通过且不是账号，到这来
	            $(id1).removeClass("form-group has-error");
	            $(id1).addClass("form-group has-success has-feedback");
	            $(span).removeClass("glyphicon glyphicon-remove form-control-feedback");
	            $(span).addClass("glyphicon glyphicon-ok form-control-feedback");
	            $(label).html("嗯，对了~");
            }
        }
    }else {//内容为空，跳到这
        $(id1).removeClass("form-group has-success has-feedback");
        $(id1).addClass("form-group has-error");
        $(span).removeClass("glyphicon glyphicon-ok form-control-feedback");
        $(span).addClass("glyphicon glyphicon-remove form-control-feedback");
        $(label).html("咳咳，不输入内容是没办法注册的哟~");
    }
    return check;
}

//提交前再检查一遍
function checkAgain(){
    var check1=checkemail_Any($('#uname'),$('#uname label:eq(1)'),$('#uname input:eq(0)'),/^([\u4e00-\u9fa5]|[\w+]){1,8}$/);
    var check2=checkemail_Any($('#uaccount'),$('#uaccount label:eq(1)'),$('#uaccount input:eq(0)'),/^[\w+]{6,12}$/);
    var check3=checkemail_Any($('#pwd'),$('#pwd label:eq(1)'),$('#pwd input:eq(0)'),/^[\w+]{6,12}$/);
    var check4=checkemail_Any($('#email'),$('#email label:eq(1)'),$('#email input:eq(0)'),/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+$/);
    var check5=checkemail_Any($('#tel'),$('#tel label:eq(1)'),$('#tel input:eq(0)'),/^1(3|4|5|6|7|8)[0-9]{9}$/);

    if(check1&&check2&&check3&&check4&&check5){
        $("#reg_form1").submit();

    }else{
        alert("还有不对的地方，不要着急提交哦！");
    }

}

//检查是否勾选了同意条款
function argee_reg(){
    if($("#argee_reg input[type='checkbox']").is(':checked')){
        $("#butt button:eq(0)").attr("disabled",false);
    }else{
        $("#butt button:eq(0)").attr("disabled",true);
    }

}