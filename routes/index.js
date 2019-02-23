const express=require("express");
const router=express.Router();
const pool=require("../pool");
//从数据库获取轮播图
router.get("/",(req,res)=>{
    var sql="select * from wyykt_index_carousel where stated='1'"
    pool.query(sql,[],(err,result)=>{
        if(err) console.log(err)
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
          })
          res.write(JSON.stringify(result));
          res.end();
    })
})
//从数据库获取顶部中间横条图
router.get("/IdxMImg",(req,res)=>{
    var sql="select * from wyykt_index_hdend"
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
        // res.send("1")//不能直接写1
        //res.send(result)//res.send()只能写一次,这里是在页面显示提取到的数据库的信息
       // res.send(result) //这里是在页面显示提取到的数据库的信息
       res.writeHead(200,{
           "Content-Type":"application/json;charset=utf-8",
           "Access-Control-Allow-Origin":"*"
       })
       res.write(JSON.stringify(result));
       res.end();
    })
})
// 简单的随机生成几条数,推荐行家
router.get("/IdxTjhj",(req,res)=>{
    var sql="SELECT * FROM wyykt_tjhj order by rand() limit 5"
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result));
        res.send();
    })
})
// 简单的随机生成几条数,系列课程
router.get("/IdxXlkc",(req,res)=>{
    var sql="SELECT * FROM wyykt_index_xlkc order by rand() limit 4"
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result));
        res.send();
    })
})
// 简单的随机生成几条数,精选好课
router.get("/IdxJxhk",(req,res)=>{
    var sql="SELECT * FROM wyykt_index_jxhk order by rand() limit 5"
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result));
        res.send();
    })
})
// 简单的随机生成几条数,新课推荐
router.get("/IdxXktj",(req,res)=>{
    var sql="SELECT * FROM wyykt_index_xktj order by rand() limit 5"
    pool.query(sql,(err,result)=>{
        if(err) console.log(err)
        res.writeHead(200,{
            "Content-Type":"application/json;charset=utf-8",
            "Access-Control-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result));
        res.send();
    })
})




module.exports=router;