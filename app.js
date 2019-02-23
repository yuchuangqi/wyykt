//使用express构建服务器
const express=require('express');
const session=require("express-session")
const bodyParser=require('body-parser')
//引入路由模块
// 同目录下的./
var index=require("./routes/index")
var courses=require("./routes/courses")
var users=require("./routes/users")
var app=express();
var server=app.listen(3000);
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//使用托管静态资源到public目录下
//引入sesion的命令：
app.use(express.static('./public'));
app.use(session({
    secret:'随机字符串',
    cookie:{maxAge:60*1000*30},//过期时间ms
    resave:false,
    saveUninitialized:true
}));//将服务器的session，放在req.session中
// 使用路由器来管理路由
app.use("/index",index)
app.use("/courses",courses)
app.use("/users",users)
// 如何启动项目，为什么直接输入localhost:3000可以直接跳转到http://localhost:3000/index.html