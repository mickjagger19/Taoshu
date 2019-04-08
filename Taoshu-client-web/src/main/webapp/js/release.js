function releaseBook(){

    var reg = /([0-9]+)/;

    var check = reg.test($('#pOriprice').val()) && reg.test($('#pPrice').val());


    if ( !check)  alert("格式错误，请检查价格是否为数字");
    else {
        alert("添加成功!");
        $("#bookform").submit();
    }

}