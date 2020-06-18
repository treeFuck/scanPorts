let app = new Vue({
    el: '#app',
    data: {
        type: 1, // 0-> 全端口，1->区间端口，2->指定端口
        host: '127.0.0.1',
        start: 8080,
        end: 65535,
        loading: false,
        result: null,
        history: null
    },
    methods: {
        changeType(newType) {
            if (this.loading) {
                return;
            }
            if (newType == 0) {
                this.start = 1;
                this.end = 65535;
            }
            this.type = newType;
            this.result = null;
        },
        judge() {
            if (isNaN(Number(this.start)) || isNaN(Number(this.end))) {
                alert("端口不合法");
                return false;
            }
            if (Number(this.start) < 1) {
                alert("开始端口不能小于1");
                return false;
            }
            if (this.type != 2 && Number(this.end) > 65535) {
                alert("结束端口不能大于65535");
                return false;
            }
            if (this.type != 2 && Number(this.start) >= Number(this.end)) {
                alert("开始端口必须小于结束端口");
                return false;
            }

            return true;
        },
        sure() {
            if (this.loading) {
                return;
            }
            if (!this.judge()) {
                return;
            }
            let params = null;
            if (this.type == 2) {
                params = {
                    host: this.host,
                    start: Number(this.start),
                    end: Number(this.start)
                }
            } else {
                params = {
                    host: this.host,
                    start: Number(this.start),
                    end: Number(this.end)
                }
            }
            this.loading = true;
            this.result = null;
            axios.get('/scan', {
                params: params
            }).then((res) => {
                this.addHistory(this.host)
                this.loading = false;
                this.result = res.data.data;
                console.log(res.data);
            }).catch((err) => {
                this.loading = false;
            })
        },
        updateHistory() {
            let historyStr = JSON.stringify(this.history);
            localStorage.setItem("scan_port_history", historyStr);
        },
        ifExistHistory(scanHost) {
            if(!this.history) {
                return false;
            }
            let len = this.history.length;
            for(let i = 0; i < len; i++) {
                if(this.history[i] == scanHost) {
                    return true;
                }
            }
            return false;
        },
        addHistory(scanHost) {
            if(this.ifExistHistory(scanHost)) {
                return;
            }
            if(!this.history) {
                this.history = [];
            } else if(this.history.length == 8) {
                // 历史记录已满，删除最后一个元素
                this.history.pop();
            }
            // 插入历史记录数组头
            this.history.unshift(scanHost);
            this.updateHistory();
        },
        delHistroy() {
            this.history = null;
            this.updateHistory();
        }
    },
    mounted() {
        this.history = JSON.parse(localStorage.getItem('scan_port_history'));
        // console.log(this.history)
    },
    watch: {
        // type: function (newVl, oldVl) {
        //     if (this.result) {
        //         this.result = null;
        //     }
        // },
        // host: function (newVl, oldVl) {
        //     if (this.result) {
        //         this.result = null;
        //     }
        // },
        // start: function (newVl, oldVl) {
        //     if (this.result) {
        //         this.result = null;
        //     }
        // },
        // end: function (newVl, oldVl) {
        //     if (this.result) {
        //         this.result = null;
        //     }
        // }
    }
})

