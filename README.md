# TCP端口扫描器

服务端：node.js（结合express框架）

客户端：vue.js（引入cdn包，没有使用vue-cli）

数据库：MySQL（图形化界面为SQLyog）

简介：本科课程《计算机网络》的课程设计

### 功能特点

- 非阻塞I/O操作，高并发处理
- 支持公网/内网端口扫描
- 可选择多种扫描模式
- 自动解析域名
- 搭建过程简单

### 服务器搭建教程

  1. 安装 [node.js](http://nodejs.cn/download/) 环境
  2. 安装服务器依赖，执行`npm install express`
  3. 执行port_info2.sql文件里的sql语句，初始化数据库
  4. 修改utils/mysql.js中数据库用户名、密码
  5. 终端切换至工具所在文件夹，执行`node server.js`
  6. 浏览器访问 http://localhost:8080

