// 轮播图
$.ajax({
    url:"http://localhost:3000/index/",
    type:"get",
    success:function(res){
       // console.log(res)
        var html="";
        for(p of res){
            var {img}=p
             html+=`
        <li>
        <a href="javascript:;">
            <img src="${img}" alt="图片请求失败">
        </a>
        </li>
        `
        }
        var divImg=document.querySelector(".topImg")
        divImg.innerHTML=html
        $(function(){    
            var moved=0;
            // var size=$(".topBanner .topImg li").size()
            var size=$(".topImg li").length;
            // js生成点
            for(var i=0;i<size;i++){
                $(".topNum").append("<li>")
            }
            $(".topBanner .topNum li").first().addClass("on")
            //鼠标滑入小方块时切换
            $(".topBanner .topNum li").click(function(){
                var index=$(this).index()
                moved=index;
                $(".topImg").css("marginLeft",-1205*index)
                $(".topBanner .topNum li").eq(index).addClass("on").siblings().removeClass("on")     
            })
             //按右边的按钮
            $(".topBanner .btn_r").click(function(){
                MoveR()      
            }
            )
            function MoveL(){
                 moved--;
                if(moved==-1){
                    moved=size-1
                }
                $(".topImg").css("marginLeft",-1205*moved)
                $(".topBanner .topNum li").eq(moved).addClass("on").siblings().removeClass("on")
            }
            function MoveR(){
                moved++;
                if(moved===size){
                    moved=0
                }
                $(".topImg").css("marginLeft",-1205*moved)
                $(".topBanner .topNum li").eq(moved).addClass("on").siblings().removeClass("on")
            }
            //按左边的按钮
            $(".topBanner .btn_l").click(function(){
                MoveL()
            })
            //自动轮播
            var t=setInterval(function(){
                MoveR()
            },4500)
            $(".topImg").mouseover(function(){
                $(".btn_l").css("display","black")
                $(".btn_r").css("display","black")
            })
            })
        }
})
// 中间切换
$.ajax({
    url:"http://127.0.0.1:3000/index/IdxMImg",
    type:"get",
    dataType:"json",
    success:function(res){
    //    console.log(res)
        html=""
        for( p of res){
            var {img,title,txt}=p
            console.log({img,title,txt})
            html+=`<a href="javascript:;" class="hdhref">
            <img src="${img}">
            <p >${title}</p>
            <p>${txt}</p>
        </a>
        `
        }
        var htmlCont=document.querySelector(".hdendbox")
         htmlCont.innerHTML=html;
    }
})
//推荐行家
$.ajax({
    url:"http://127.0.0.1:3000/index/IdxTjhj",
    type:"get",
    dataType:"json",
    success:function(res){
        html=''
        for(p of res){
            var {tname,img,title}=p
            html+=`
            <div class="tjhjbox">
                    <a href="javasc:;">
                        <img src="${img}"/>
                        <div class="tjhjintr">
                            <p class="tjtrp1">${tname}</p>
                            <p class="tjtrp2">${title}</p>
                        </div>
                    </a>
                </div>
               `
            var Tjhj=document.querySelector(".tjhj div:last-child")
            Tjhj.innerHTML=html
        }
    }
})
// 系列课程
$.ajax({
    url:"http://127.0.0.1:3000/index/IdxXlkc",
    type:"get",
    dataType:"json",
    success:function(res){
        html=''
        for(p of res){
            var {title,img,detail}=p
            html+=`
            <div class="xlkcbox">
            <a href="javasc:;">
                <img src="${img}" alt="#">
                <div class="xlkcp" >
                    <h5 class="xlkcp1">${title}</h5>
                    <p class="xlkcp2">${detail}</p>
                </div>
            </a>
        </div>           `
        }
        console.log(html)
        var htmlCont=document.querySelector(".xlkc")
         htmlCont.innerHTML=html;
    }
})
// 精选好课
$.ajax({
    url:"http://127.0.0.1:3000/index/IdxJxhk",
    type:"get",
    dataType:"json",
    success:function(res){
        html=''
        for(p of res){
            var {title,img,detail}=p
            html+=`
            <a href="javasc:;" class="jxhkbox">
                       <div>
                            <img src="${img}"#">
                            </div>
                        <h6>${title}</h6>
                        <p>${detail}</p>
                    </a>
           `
        }
        console.log(html)
        var htmlCont=document.querySelector(".jxhk")
         htmlCont.innerHTML=html;
    }
})
// 新课推荐
$.ajax({
    url:"http://127.0.0.1:3000/index/IdxXktj",
    type:"get",
    dataType:"json",
    success:function(res){
        html=''
        for(p of res){
            var {title,img,detail}=p
            html+=`
            <a href="javasc:;" class="jxhkbox">
                        <div>
                            <img src="${img}" />
                        </div>
                        <h6>${title}</h6>
                        <p>${detail}</p>
                    </a>
           `
        }
        console.log(html)
        var htmlCont=document.querySelector(".xktj")
         htmlCont.innerHTML=html;
    }
})
//console.log(1)
// 固定位置滚动显示
window.onscroll=function(){
    var $hd=$(".hd")
    var scrollTop=
        document.documentElement.scrollTop;
    if(scrollTop>=30)
        toTop.style.display="block"
    else
        toTop.style.display="none"
    if(scrollTop>=550)
        $hd.css("display","block")
        
    else
        $hd.css("display","none")
}

$(function(){
    $("[data-trigger=rightout]").parent().on("mouseenter",function(){
        $(this).children().last().show();
        $(this).children(":first-child").children().css("color","black");
    })
    .on("mouseleave",function(){
        $(this).children().last().hide();
        $(this).children(":first-child").children().css("color","white");
        })
    $("[data-trigger=drop]").parent().on("mouseenter",function(){
        $(this).children().last().show();
    })
    .on("mouseleave",function(){
            $(this).children().last().hide();
        })
})
    
//中间滑动的实现
    var moved=0;//记录已经左移的图片个数
    var $left=$(".hdarr>button:first-child")
    var $right=$(".hdarr>button:last-child")
    var $hdbox=$(".hdendbox")
    $(".hdendbox").mouseover("a",function(e){
        $(".hdarr>button").css("display","block")
        $left.removeClass("lfarrover")
        $right.removeClass("rharrover")
    })
     $(".hdendbox").mouseleave("a",function(e){
         $(".hdarr>button").css("display","none")
    })
$left.mouseover(function (){
    $left.addClass("lfarrover")
})
    .on("click",function(){
    var $left=$(this)
    if(moved>0){
        $right.removeAttr("disabled")
        $left.removeAttr("disabled");
        moved--;
        console.log(moved+"left")
        $hdbox.css("marginLeft",-244*moved);
        if(moved==0)
            $left.attr("disabled","disabled")
    }else
        $left.removeClass("lfarrover")
})
$right.mouseover(function (){
        $right.addClass("rharrover")
})
.on("click",function(){
        var $right=$(this)
        if($left.attr("disabled")==="disabled")
            $left.removeAttr("disabled")
        if(moved<7){
            moved++;
            $hdbox.css("marginLeft",-244*moved);
            console.log(moved)
            if(moved>=7)
                $right.attr("disabled","disabled")
        }
    })

// 轮播图的实现
//console.log(2)
    