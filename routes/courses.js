const express=require("express");
const router=express.Router();
const pool=require("../pool.js");
router.get("/",(req,res)=>{
    var sql=`select *,(select sm from wyykt_courses_pic where pid=cid limit 1) as sm from wyykt_courses`
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result));
        res.end();
    })
})
//测试地址：http://localhost:3000/coursess?kwords=macbook i5 128g
router.get("/Search",(req,res)=>{
    // bodyParser:url.parse(req.url,true)
    if(!Array==undefined){
        var Array=req.query.Array
    }
    var kwords=req.query.kwords;
    //"PS 超级合辑" 
    var arr=kwords.split(" ")//arr[PS,超级合辑]
    for(var i=0;i<arr.length;i++){
        arr[i]=`Search like '%${arr[i]}%'`
    }//arr[title like '%macbook%',..]
    var where=" where "+arr.join(" and ")
    //where title like '%macbook%' and title like '%128g%'
    // 要回发客户端的支持分页的对象
    var output={ pageSize:10}//每页10个商品
    output.pno=req.query.pno;
    var sql=`select *,(select sm from wyykt_courses_pic where pid=cid limit 1) as sm from wyykt_courses`
    pool.query(sql+where,[],(err,result)=>{
        if(err) console.log(err);
        
        output.count=result.length;//获得总记录数
    //    console.log(result.length)
        output.pageCount=Math.ceil(output.count/output.pageSize);
        console.log('页数是：'+output.pageCount)
        console.log('结果是：'+result)
        output.courses=//截取分页后的结果集
            result.slice(output.pno*10,output.pno*10+10);
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
        })  
        res.write(JSON.stringify(output)) 
        res.end()
    })
    
})

module.exports=router
