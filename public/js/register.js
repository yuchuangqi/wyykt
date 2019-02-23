$(function(){
    $(".regBtn").click(function(){
        var phone=$(".phone").val();
        var upwd=$(".upwd").val();
        // console.log(phone,upwd)
        $.ajax({
            url:"/users/register",
            // url:"http://localhost:3000/users/",
            type:"post",
            data:{phone,upwd},
            dataType:"json",
            success:function(data){
                if(data.ok==0) alert(data.msg);
                else{
                    alert("注册成功，自动返回登录页!");
                    // 这里的判断是什么？   
                location.href="http://localhost:3000/login.html"
                }
            }
        })
       
    })
})