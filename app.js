//使用express构建web服务器 --11:25
const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
/*引入路由模块*/
const index=require("./routes/index");
const details=require("./routes/details");
const products=require("./routes/products")
const users=require("./routes/users")
const cart=require("./routes/cart")

var app = express();
var server = app.listen(3000);

//2.1:引入跨域模块   
const cors = require("cors");



//2.2:配置允许哪个程序跨域访问 脚手架   11:16
app.use(cors({
  origin:[
    "http://127.0.0.1:3000","http://localhost:3000"],
  credentials:true
}))

//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
app.use(session({
  secret: '128位随机字符串',
  resave: false,
  saveUninitialized: true,
}))
//req.session
/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/details",details);
app.use("/products",products);
app.use("/users",users);
app.use("/cart",cart);
//接口地址http://localhost:3000/details/?lid=5

