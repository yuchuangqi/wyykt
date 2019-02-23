$(function(){
    //http://localhost:3000/courses.html?kwords=PS%20%20%E8%B6%85%E7%BA%A7%E5%90%88%E8%BE%91
    //输入 PS 超级合辑
    if(location.search.indexOf("kwords=")!=-1){
        var kwords=decodeURI(location.search.split("=")[1]
        // kwords为用户输入的内容,  
        );
        var pno=0;
        function loadPage(no=0){//no：新页号
            pno=no;
            $.ajax({
                url:"http://localhost:3000/courses/search",
                type:"get",
                data:{kwords,pno},
                dataType:"json",
                success:function(output){
                    console.log(output);
                    var {courses,pageCount}=output;
                    var html="";
                    for(p of courses){
                        var {cid,title,sm,price,Saleprice,orgName,starClass,isVip,vipPrice}=p
                        console.log(p)
                        html+=` <a href="course_detail.html?hpid=${cid}" class="cour">
                        <div class="courImg">
                        <img src="${sm}" alt="">
                        </div>
                        <div class="courBox" style="position:relative">
                            <p class="courtitle">${title}</p>
                            <p class="courorg">${orgName}</p>
                            <p class="courstar">
                                <span style="display:block">★★★★★</span>
                                <span style="display:block;width:${starClass}">★★★★★</span>
                            </p>
                           <span>${price}</span><s>${Saleprice}</s>
                           <span style="color:red">${isVip}</span><span style="color:red">${vipPrice}<span><br>
                           <button class="courseBtn">加入购物车</button>
                        </div>
                    </a>`
                    }
           //         var course=document.querySelector(".coursebox")
           //         course.innerHTML=html
                    $(".coursebox").html(html);
            //下面页数切换    
            //html 删除下面的button
                    var html="";
                  //  console.log(pageCount);
                    for(var i=1;i<=pageCount;i++){
                        // 这里的技巧
                        html += `<button class="pagAct page-item number  ${i==pno+1?'active':''}"><a href="">${i}</a></button>`
                    }
                    // 删除中间数字:
                    $page.children(":not(:first-child):not(:last-child)").remove()
                    // 将html追加到上一页后
                     $page.children().first().after(html)
                     if(pno==0){//如果当前页是第一页就禁止用上一页 
                        $page.children().first().attr("disabled",'disabled')
                     }else{
                         $page.children().first().removeAttr("disabled")
                     }
                     if(pno==pageCount-1){
                         $page.children().last().attr("disabled",'disabled')
                     }else{
                         $page.children().last().removeAttr("disabled")
                     }

                }
            })

        }
        loadPage();
        var $page=$(".page")
        console.log($page)
        // 只在页面首次加载时，在分页按钮的父元素上绑定一次
         $page.on("click","a",function(e){
             e.preventDefault();
             var $a=$(this)
        //     // 除了禁用和当前正在激活按钮之外才能点击
            if(!$a.parent().is(".disabled,.ative")){
                console.log($a.parent())
                if($a.parent().is(":first-child"))//上一页
                   var no=pno-1;
               else if($a.parent().is(":last-child"))//下一页
                   var no=pno+1;
                else //1,2,3按钮
                    var no=$a.html()-1;//新页号=按钮内容-1
                loadPage(no);//重新加载新页号的页面内容      
            }
        })
    }
})