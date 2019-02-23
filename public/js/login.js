// $(function(){
//     $(".login").click(function(){
//         var phone=$(".phone").val();
//         var upwd=$(".upwd").val();
//         (async function(){
//             var res=await $.ajax({
//                 url:"http://localhost:3000/users/signin",
//                 type:"post",
//                 data:{phone,upwd},
//                 dataType:"json"
//             })    
//             alert(res.ok)
//             if(res.ok==0)
//                 alert(res.msg);
//             else{
//                 alert("登录成功！即将返回原来的页面...")
//                 var url=location.search.slice(6)
//                 location.href=url;
//              }
//         })()
//     })
// })
$(function(){
    $(".login").click(function(){
        var phone=$(".phone").val();
        var upwd=$(".upwd").val();
        $.ajax({
            url:"/users/signin",
            // url:"http://localhost:3000/users/signin",
            type:"post",
            data:{phone,upwd},
            dataType:"json",
            success:function(data){
                if(data.ok==0) alert(data.msg);
                else{
                    alert("登录成功，自动返回上一页!");
                    // 这里的判断是什么？   
                    if(location.search.indexOf("back=")!=-1){
                        var back=location.search.slice(6);
                        location.href=back;
                    }else
                        location.href="http://localhost:3000/index.html"
                }
            }
        })
       
    })
})