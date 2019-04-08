/**
 * Created by OracleOAEC on 2017/11/4.
 */
/*
 * 单行删除方法1
 * */
function deleteProduct(product_id,s_id){
	
	var f=confirm('是否删除该商品？!!!!!!!!');
       if(f){
        	$.post('ajax/deleteShopFromShoppingcar.do',{s_id:s_id},function(data){
            	if(data>0){
            		 $(product_id).remove();
            		 productCount();
            	}else{
            		/*alert("删除失败！");*/
            		$.alert({
          		      title: '小提示：',
          		      content: '删除失败！',
          		      confirmButton: '确认',
          		      confirmButtonClass: 'btn-info',
          		      animation: 'bottom',
          		      icon: 'fa fa-check',
          		      backgroundDismiss: true
          		  });
            	}

        	},'html')
            	
               
            }
        
    
}
/*
 * 全选商品
 * */
var flag = true; //全选的标识
/**
 * 全选
 */
function checkAll(){

    var pcbs = $("input[name='p_checkedbox']");
    if(flag){
        for(var i = 0 ; i < pcbs.length; i++){
            pcbs[i].checked = "checked";

        }
        flag = false;
    }else{
        for(var i = 0 ; i < pcbs.length; i++){
            pcbs[i].checked = "";
        }
        flag = true;
    }
    productCount();

}

/**
 * 批量删除商品
 */


function deleteChecked(){	
	
    var arrs = [];
    var count=0;//作为数组的下标
    var pcbs = $("input[name='p_checkedbox']");
    //alert(pcbs.length)
    for(var i = 0 ; i < pcbs.length; i++){
        var f = pcbs[i].checked;

        if(f==true){//如果选中了，记录下选中的value值,value设置成S_ID
            arrs[count]=pcbs[i].value;
            
            // console.log(pcbs[i].value)
            count++;
        }
    }
    
    	
    	if(count>0){//如果count>0说明选择了商品可以删除，否则不删除
    		
    		var f=confirm('确认删除商品吗?');
                if(f) {
                	//执行删除才进入ajax
        			/*alert(arrs.length);*/
        			$.post('ajax/deleteSomeShopFromShoppingcarAjax.do',{
    						's_ids':arrs.toString()
    						},function(data){
        				
        			  if(data>0){
        				 /* alert('删除成功啦！');*/
    	    			for(var i = 0 ; i < arrs.length; i++){
    	    				$('#product_id_'+arrs[i]).remove();
    	    				productCount();
    	    			}
        			}else{
        				/*alert("不知道什么原因，删除失败啦！");*/
        				$.alert({
                		      title: '小提示：',
                		      content: '不知道什么原因，删除失败啦！',
                		      confirmButton: '确认',
                		      confirmButtonClass: 'btn-info',
                		      animation: 'bottom',
                		      icon: 'fa fa-check',
                		      backgroundDismiss: true
                		  });
        				
        			}
        		},'json');
        		}
    		
    	}      
}
    		
    		

/*改变所购商品的数量*/
function changeNum(numId,flag,s_id){/*numId表示对应商品数量的文本框ID，flag表示是增加还是减少商品数量*/
    var numId=document.getElementById(numId);
    
    if(flag=="minus"){/*减少商品数量*/
    		if(numId.value<=1){
    			/*alert("宝贝数量必须是大于0");*/
    			$.alert({
      		      title: '小提示：',
      		      content: '宝贝数量必须是大于0~',
      		      confirmButton: '确认',
      		      confirmButtonClass: 'btn-info',
      		      animation: 'bottom',
      		      icon: 'fa fa-check',
      		      backgroundDismiss: true
      		  	});
                return false;
            }
            else{
            	$.post('ajax/addOrCutDownShoppingcar.do',{'s_id':s_id,'flag':flag},function(data){
            		if(data>0){
		                numId.value=parseInt(numId.value)-1;
		                productCount();
            		}else{
            			/*alert("不知道什么原因，出错啦！");*/
            			$.alert({
                		      title: '小提示：',
                		      content: '不知道什么原因，出错啦！',
                		      confirmButton: '确认',
                		      confirmButtonClass: 'btn-info',
                		      animation: 'bottom',
                		      icon: 'fa fa-check',
                		      backgroundDismiss: true
                		  });
            		}
            	});
            }
    		
    }
    else{/*flag为add，增加商品数量*/
    	alert("+++++++");
    	$.post('ajax/addOrCutDownShoppingcar.do',{'s_id':s_id,'flag':flag},function(data){
    		if(data>0){
		        numId.value=parseInt(numId.value)+1;
		        productCount();
    		}else{
    			/*alert("不知道什么原因，出错啦！");*/
    			$.alert({
      		      title: '小提示：',
      		      content: '不知道什么原因，出错啦~',
      		      confirmButton: '确认',
      		      confirmButtonClass: 'btn-info',
      		      animation: 'bottom',
      		      icon: 'fa fa-check',
      		      backgroundDismiss: true
      		  });
    		}
    	});
    }
}

/*自动计算商品的总金额、总共节省的金额和积分*/
function productCount(){
	
    var total=0;      //商品金额总计
    var integral=0;   //可获商品积分

    var point;      //每一行商品的单品积分
    var price;     //每一行商品的单价
    var number;    //每一行商品的数量
    var subtotal;  //每一行商品的小计

    /*访问ID为shopping表格中所有的行数*/
    
    var myTableTr=document.getElementById("buy_table").getElementsByTagName("tr");
    
    if(myTableTr.length>0){
        for(var i=1;i<myTableTr.length;i++){//从1开始，第一行的标题不计算
        	if(myTableTr[i].getElementsByTagName("input")[0].checked){
        		/*//如果选中了获取该标签的value（也就是s_id）
        		var s_id=myTableTr[i].getElementsByTagName("input")[0].value;
        		$.post('',{'s_id':s_id},function(data){
        			if(data>0){
        				
        			}else{
        				
        			}
        			
        		},'html');*/
        		
        		/*alert(myTableTr[i].getElementsByTagName("input")[0].value);*/
            if(myTableTr[i].getElementsByTagName("td").length>1){ //从第二行算起
            	
                //单价
                price=myTableTr[i].getElementsByTagName("td")[2].getElementsByTagName("span")[0].innerHTML;

                //单个积分
                point=myTableTr[i].getElementsByTagName("td")[3].getElementsByTagName("span")[0].innerHTML;

                //数量
                number=myTableTr[i].getElementsByTagName("td")[4].getElementsByTagName("input")[1].value;
                
                integral+=point*number;
                total+=price*number;
                myTableTr[i].getElementsByTagName("td")[5].getElementsByTagName("span")[0].innerHTML=price*number;
                
            	}else{
            		myTableTr.remove(myTableTr[i]);
            	}
            }
        }
        
        
        document.getElementById("total").innerHTML=total;
        document.getElementById("total2").value=total;
        document.getElementById("integral").innerHTML=integral;
        document.getElementById("integral2").value=integral;
        

    }
}
window.onload=productCount;

//将购物车中商品‘前往结算’
function ChangeS_states(){
	var arrs = [];
    var count=0;//作为数组的下标
    var pcbs = $("input[name='p_checkedbox']");
    //alert(pcbs.length)
    for(var i = 0 ; i < pcbs.length; i++){
        var f = pcbs[i].checked;

        if(f==true){//如果选中了，记录下选中的value值,value设置成S_ID
            arrs[count]=pcbs[i].value;
            
            // console.log(pcbs[i].value)
            count++;
        }
    }
    
    	if(count>0){
    		$('#my_sids').val(arrs.toString());
    		
    		$('#shopping').submit();
    	}else{
    		/*alert ("购物车里没东西哟，快去买买买吧~");*/
    		$.alert({
    		      title: '小提示：',
    		      content: '购物车里没东西哟，快去买买买吧~',
    		      confirmButton: '确认',
    		      confirmButtonClass: 'btn-info',
    		      animation: 'bottom',
    		      icon: 'fa fa-check',
    		      backgroundDismiss: true
    		  });
    	}
	
}
	
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

