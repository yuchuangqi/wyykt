const express=require("express");
const router=express.Router();
const pool=require("../pool");

//可以用get尝试请求：
//登录
router.post("/signin",(req,res)=>{
    var phone=req.body.phone;
    var upwd=req.body.upwd;
    var sql="select * from wyykt_user where phone=? and upwd=md5(?)";
    pool.query(sql,[phone,upwd],(err,result)=>{    
        if(err) console.log(err)
        // err&&console.log(err);
        res.writeHead(200,{
           "Content-Type":"application/json;charset-utf-8",
           "Access-Control-Allow-origin":"*"
        })
        if(result.length>0){
          req.session.uid=result[0].uid;
      //   console.log(req.session.uid) //能打印证明成功
            res.write(JSON.stringify({ok:1}))
        }else{
            res.write(JSON.stringify({ok:0,msg:"用户或密码错误！"}))
        }
        res.end()
    })
})
//是否在线
router.get("/islogin",(req,res)=>{ 
    res.writeHead(200,{
        "Content-Type":"application/json;charset-utf-8",
        "Access-Control-Allow-origin":"*"
     })
     console.log(req.session.uid)
    if(req.session.uid===undefined){
        res.write(JSON.stringify({ok:0}));
        res.end();
    }else{
        var uid=req.session.uid
        var sql="select * from  wyykt_user where uid=?"
        pool.query(sql,[uid],(err,result)=>{
            if(err) console.log(err)
            res.write(JSON.stringify({ok:1,uname:result[0].uname}))
            res.end();
        })
    }
})
//退出选项
router.get("/signout",(req,res)=>{
    res.writeHead(200)
    // 这里写跨域就退不了了
    req.session.uid=undefined;
    res.send();
})

//用户注册
//get方法:http://127.0.0.1:3000/users/register?rephone=123456789&upwd=33333
router.post("/register",(req,res)=>{
    var phone=req.body.phone
    var upwd=req.body.upwd
    sql=`insert into wyykt_user values("",null,?,null,?,null,null,null,null)`
    pool.query(sql,[upwd,phone],(err,result)=>{
        if(err) throw err
        res.writeHead(200,{
            "Content-Type":"application/json;charset-utf-8",
            "Access-Control-Allow-origin":"*"
         })
        if(result.affectedRows>0){
            res.write(JSON.stringify({ok:1}))
            // res.send({msg:"注册成功"})
        }else{
            res.write(JSON.stringify({ok:0}))
            // res.send({msg:"注册失败"})
        }
        res.end()
    })
})
module.exports=router;