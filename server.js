const express = require("express");
const scan = require("./utils/scan");

// 创建服务器
const server = express();
server.listen(8080);
console.log("已成功运行服务器，请访问:http://localhost:8080/");

// 前端页面
server.use(express.static("./src", { index: "./index.html" }));

// 处理Ajax请求
server.get("/scan", (req, res) => {
    let obj = req.query;
    scan(obj.host, obj.start, obj.end).then((reslut) => {
        console.log(`端口扫描完毕，${obj.host}开放的端口为：`, reslut);
        res.send({
            code: 1,
            data: {
                host: obj.host,
                start: obj.start,
                end: obj.end,
                openPort: reslut
            }
        })
    }).catch((err) => {
        console.log(err);
        res.send({
            code: 0,
            data: null
        });
    })
});