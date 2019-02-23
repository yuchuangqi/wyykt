$(function(){
    //1.动态创建link引用header.css
    $("<link rel='stylesheet' href='css/header.css'>").appendTo("head")
    //2.ajax请求header.html片段
    $.ajax({
        url:"header.html",
        type:"get",
        success:function(res){
            $("#header").replaceWith(res)
            //1.查找触发事件的元素，搜索功能,找到搜索的按钮框和搜索框
            var $btnSearch=$(".hdsearch>img")
            console.log($btnSearch)  
            var $input=$btnSearch.parent().children("input")
            //2.绑定事件
            $btnSearch.click(function(){
                //3.查找要修改的元素
                //4.修改元素
                var kw=$input.val().trim();
                if(kw!=="")
                //跳转
                location.href=`courses.html?kwords=${kw}`;
            })
            $input.keyup(function(e){
                if(e.keyCode==13)
                //模拟触发
                $btnSearch.click()
            })
            // 如果搜索里有空格，回车会变成%20,url标准中不允许有空格。
            //用空格的码
            //如果不写下面的代码，回车会跳转，但收不到数值
            if(location.search.indexOf("kwords")!=-1){
                var kwords=decodeURI(
                    location.search.split("=")[1]
                )
                $input.val(kwords)
            }
            //头部登录后跳回原网址的功能
            $(".btnLogin").click(function(){
                location.href="login.html?back="+location.href;
            })
            $.ajax({
                // url:"http://localhost:3000/users/islogin",
                url:"/users/islogin",
                type:"get",
                dataType:"json",
                success:function(res){     
                    if(res.ok==0){
                        $(".signout").show().next().hide()
                        console.log("登出")
                    }else if(res.ok==1)
                    {
                        console.log(res.ok)
                        $("#uname").html(res.uname)
                        $(".signout").hide().next().show()
                        console.log("登录")
                    }
                    
                }
            })
            $(".zs").click(function(){
                $.ajax({
                  url:"/users/signout",
                //   url:"http://localhost:3000/users/signout",
                  type:"get",
                  success:function(){ location.reload(); }
                })
              })

        }
    })
})