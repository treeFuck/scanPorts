// TCP
const net = require('net');
// 进度条
const ProgressBar = require('progress');
// 数据库
const $mysql = require("mysql");
const sql = require("./mysql");
const $sql = $mysql.createConnection(sql.mysql)
$sql.connect();


// 从数据库中找到端口数据
function sqlPort(port) {
	return new Promise((resolve, reject) => {
		$sql.query('SELECT * FROM port_info WHERE port_info.`port` =' + port, (error, results, fields) => {
			// console.log(results[0])
			if(results[0]) {
				resolve({
					port: port,
					data: results[0]
				});
			} else {
				resolve({
					port: port,
					data: {
						server_name: '暂无', 
						info: '暂无', 
					}
				});
			}
		});
	})
}
function sqlAllPorts(portArr) {
	return new Promise((resolve, reject) => {
		let PromiseArr = [];
		let len = portArr.length;
		for (let i = 0; i < len; i++) {
			PromiseArr.push(sqlPort(portArr[i]));
		}
		Promise.all(PromiseArr).then((res) => {
			resolve(res);
		})
	})
}
// 区间端口扫描
function checkPorts(host, start, end) {
	// 返回 Promise
	return new Promise((resolve, reject) => {
		let counts = end - start + 1;
		let ports = [];
		let bar = new ProgressBar(`scanning ${host} form ${start} to ${end} [:bar] :percent`, {
			complete: '=',
			width: 100,
			total: counts
		});
		bar.tick(0);
		for (let i = Number(start); i <= Number(end); i++) {
			let check = net.connect({
				host: host,
				port: i
			}, () => {
				ports.push(i);
				check.destroy();
			});
			check.on('close', () => {
				counts--;
				bar.tick(1);
				if (counts == 0) {
					resolve(ports);
				}
			});
			check.on('error', err => {
			});
		}
	})
}

// （区间扫描）获取端口信息
function scanPorts(host, start, end) {
	return new Promise((resolve, reject) => {
		checkPorts(host, start, end).then(ports => {
			sqlAllPorts(ports).then((res) => {
				resolve(res);
			})

		}).catch(err => {
			reject("未知错误");
		})
	})
}

// 指定端口扫描
function checkOnePort(host, port) {
	// 返回 Promise
	return new Promise((resolve, reject) => {
		let ifOpen = false;
		let bar = new ProgressBar(`scanning ${host} port ${port} [:bar] :percent`, {
			complete: '=',
			width: 100,
			total: 1
		});
		bar.tick(0);
		let check = net.connect({
			host: host,
			port: port
		}, () => {
			ifOpen = true;
			check.destroy();
		});
		check.on('close', () => {
			bar.tick(1);
			resolve(ifOpen);
		});
		check.on('error', err => {
		});

	})
}
// （指定扫描）获取端口信息
function scanOnePort(host, port) {
	return new Promise((resolve, reject) => {
		checkOnePort(host, port).then(ifOpen => {
			console.log(ifOpen);
			sqlPort(port).then((res) => {
				resolve({
					ifOpen: ifOpen,
					...res
				});
			})

		}).catch(err => {
			reject("未知错误");
		})
	})
}
module.exports = (host, start, end) => {
	if (start != end) {
		return scanPorts(host, start, end);
	} else  {
		return scanOnePort(host, start);
	}
}
