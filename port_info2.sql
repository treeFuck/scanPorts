


CREATE DATABASE scan_data ;

USE scan_data;

DROP TABLE IF EXISTS port_info;
CREATE TABLE port_info(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  server_name VARCHAR(255),
  info TEXT,
  PORT INTEGER
);

-- ----------------------------
-- Records of "port_info"
-- ----------------------------
INSERT INTO port_info
VALUES
  (
    1,
    'Reserved',
    '通常用于分析操作系统。这一方法能够工作是因为在一些系统中“0”是无效端口，当你试图使用通常的闭合端口连接它时将产生不同的结果。一种典型的扫描，使用IP地址为0.0.0.0，设置ACK位并在以太网层广播。',
    0
  ) ;

INSERT INTO port_info VALUES (2, 'tcpmux', '这显示有人在寻找SGI Irix机器。Irix是实现tcpmux的主要提供者，默认情况下tcpmux在这种系统中被打开。Irix机器在发布是含有几个默认的无密码的帐户，如：IP、GUEST UUCP、NUUCP、DEMOS 、TUTOR、DIAG、OUTOFBOX等。许多管理员在安装后忘记删除这些帐户。因此HACKER在INTERNET上搜索tcpmux并利用这些帐户。', 1);
INSERT INTO port_info VALUES (3, 'Echo', '能看到许多人搜索Fraggle放大器时，发送到X.X.X.0和X.X.X.255的信息。', 7);
INSERT INTO port_info VALUES (4, 'Character Generator', '这是一种仅仅发送字符的服务。UDP版本将会在收到UDP包后回应含有垃圾字符的包。TCP连接时会发送含有垃圾字符的数据流直到连接关闭。HACKER利用IP欺骗可以发动DoS攻击。伪造两个chargen服务器之间的UDP包。同样Fraggle DoS攻击向目标地址的这个端口广播一个带有伪造受害者IP的数据包，受害者为了回应这些数据而过载', 19);
INSERT INTO port_info VALUES (5, 'FTP', 'FTP服务器所开放的端口，用于上传、下载。最常见的攻击者用于寻找打开anonymous的FTP服务器的方法。这些服务器带有可读写的目录。木马Doly Trojan、Fore、Invisible FTP、WebEx、WinCrash和Blade Runner所开放的端口。', 21);
INSERT INTO port_info VALUES (6, 'SSH', 'PcAnywhere建立的TCP和这一端口的连接可能是为了寻找ssh。这一服务有许多弱点，如果配置成特定的模式，许多使用RSAREF库的版本就会有不少的漏洞存在。', 22);
INSERT INTO port_info VALUES (7, 'Telnet', '远程登录，入侵者在搜索远程登录UNIX的服务。大多数情况下扫描这一端口是为了找到机器运行的操作系统。还有使用其他技术，入侵者也会找到密码。木马Tiny Telnet Server就开放这个端口。', 23);
INSERT INTO port_info VALUES (8, 'SMTP', 'SMTP服务器所开放的端口，用于发送邮件。入侵者寻找SMTP服务器是为了传递他们的SPAM。入侵者的帐户被关闭，他们需要连接到高带宽的E-MAIL服务器上，将简单的信息传递到不同的地址。木马Antigen、Email Password Sender、Haebu Coceda、Shtrilitz Stealth、WinPC、WinSpy都开放这个端口。', 25);
INSERT INTO port_info VALUES (9, 'MSG Authentication', '木马Master Paradise、Hackers Paradise开放此端口。', 31);
INSERT INTO port_info VALUES (10, 'WINS Replication', 'WINS复制', 42);
INSERT INTO port_info VALUES (11, 'Domain Name Server', 'DNS服务器所开放的端口，入侵者可能是试图进行区域传递（TCP），欺骗DNS（UDP）或隐藏其他的通信。因此防火墙常常过滤或记录此端口。', 53);
INSERT INTO port_info VALUES (12, 'Bootstrap Protocol Server', '通过DSL和Cable modem的防火墙常会看见大量发送到广播地址255.255.255.255的数据。这些机器在向DHCP服务器请求一个地址。HACKER常进入它们，分配一个地址把自己作为局部路由器而发起大量中间人（man-in-middle）攻击。客户端向68端口广播请求配置，服务器向67端口广播回应请求。这种回应使用广播是因为客户端还不知道可以发送的IP地址。', 67);
INSERT INTO port_info VALUES (13, 'Trival File Transfer', '许多服务器与bootp一起提供这项服务，便于从系统下载启动代码。但是它们常常由于错误配置而使入侵者能从系统中窃取任何 文件。它们也可用于系统写入文件。', 69);
INSERT INTO port_info VALUES (14, 'Finger Server', '入侵者用于获得用户信息，查询操作系统，探测已知的缓冲区溢出错误，回应从自己机器到其他机器Finger扫描。', 79);
INSERT INTO port_info VALUES (15, 'HTTP', '用于网页浏览。木马Executor开放此端口。', 80);
INSERT INTO port_info VALUES (16, 'Metagram Relay', '后门程序ncx99开放此端口。', 99);
INSERT INTO port_info VALUES (17, 'Message transfer agent(MTA)-X.400 over TCP/IP', '消息传输代理。', 102);
INSERT INTO port_info VALUES (18, 'Post Office Protocol -Version3', 'POP3服务器开放此端口，用于接收邮件，客户端访问服务器端的邮件服务。POP3服务有许多公认的弱点。关于用户名和密码交 换缓冲区溢出的弱点至少有20个，这意味着入侵者可以在真正登陆前进入系统。成功登陆后还有其他缓冲区溢出错误。', 109);
INSERT INTO port_info VALUES (19, 'SUN公司的RPC服务所有端口', '常见RPC服务有rpc.mountd、NFS、rpc.statd、rpc.csmd、rpc.ttybd、amd等', 110);
INSERT INTO port_info VALUES (20, 'Authentication Service', '这是一个许多计算机上运行的协议，用于鉴别TCP连接的用户。使用标准的这种服务可以获得许多计算机的信息。但是它可作为许多服务的记录器，尤其是FTP、POP、IMAP、SMTP和IRC等服务。通常如果有许多客户通过防火墙访问这些服务，将会看到许多这个端口的连接请求。记住，如果阻断这个端口客户端会感觉到在防火墙另一边与E-MAIL服务器的缓慢连接。许多防火墙支持TCP连接的阻断过程中发回RST。这将会停止缓慢的连接。', 113);
INSERT INTO port_info VALUES (21, 'Network News Transfer Protocol', 'NEWS新闻组传输协议，承载USENET通信。这个端口的连接通常是人们在寻找USENET服务器。多数ISP限制，只有他们的客户才能访问他们的新闻组服务器。打开新闻组服务器将允许发/读任何人的帖子，访问被限制的新闻组服务器，匿名发帖或发送SPAM', 119);
INSERT INTO port_info VALUES (22, 'Location Service', 'Microsoft在这个端口运行DCE RPC end-point mapper为它的DCOM服务。这与UNIX 111端口的功能很相似。使用DCOM和RPC的服务利用计算机上的end-point mapper注册它们的位置。远端客户连接到计算机时，它们查找end-point mapper找到服务的位置。HACKER扫描计算机的这个端口是为了找到这个计算机上运行Exchange Server吗？什么版本？还有些DOS攻击直接针对这个端口。', 135);
INSERT INTO port_info VALUES (23, 'NETBIOS Name Service', '当通过网上邻居传输文件时用这个端口', 137);
INSERT INTO port_info VALUES (24, 'NETBIOS Name Service', '当通过网上邻居传输文件时用这个端口', 138);
INSERT INTO port_info VALUES (25, 'NETBIOS Name Service', '通过这个端口进入的连接试图获得NetBIOS/SMB服务。这个协议被用于windows文件和打印机共享和SAMBA。还有WINS Regisrtation也用它。', 139);
INSERT INTO port_info VALUES (26, 'Interim Mail Access Protocol v2', '和POP3的安全问题一样，许多IMAP服务器存在有缓冲区溢出漏洞。记住：一种LINUX蠕虫（admv0rm）会通过这个端口繁殖，因此许多这个端口的扫描来自不知情的已经被感染的用户。当REDHAT在他们的LINUX发布版本中默认允许IMAP后，这些漏洞变的很流行。这一端口还被用于IMAP2，但并不流行。', 143);
INSERT INTO port_info VALUES (27, 'SNMP', 'SNMP允许远程管理设备。所有配置和运行信息的储存在数据库中，通过SNMP可获得这些信息。许多管理员的错误配置将被暴露在Internet。Cackers将试图使用默认的密码public、private访问系统。他们可能会试验所有可能的组合。SNMP包可能会被错误的指向用户的网络。', 161);
INSERT INTO port_info VALUES (28, 'X Display Manager Control Protocol', '许多入侵者通过它访问X-windows操作台，它同时需要打开6000端口。', 177);
INSERT INTO port_info VALUES (29, 'LDAP、ILS', '轻型目录访问协议和NetMeeting Internet Locator Server共用这一端口。', 389);
INSERT INTO port_info VALUES (30, 'Https', '网页浏览端口，能提供加密和通过安全端口传输的另一种HTTP。', 443);
INSERT INTO port_info VALUES (31, 'Login,remote login', '是从使用cable modem或DSL登陆到子网中的UNIX计算机发出的广播。这些人为入侵者进入他们的系统提供了信息。', 513);
INSERT INTO port_info VALUES (32, 'Macintosh,File Services(AFP/IP)', 'Macintosh,文件服务。', 548);
INSERT INTO port_info VALUES (33, 'CORBA IIOP （UDP）', '使用cable modem、DSL或VLAN将会看到这个端口的广播。CORBA是一种面向对象的RPC系统。入侵者可以利用这些信息进入系统', 553);
INSERT INTO port_info VALUES (34, 'DSF', '木马PhAse1.0、Stealth Spy、IniKiller开放此端口。', 555);
INSERT INTO port_info VALUES (35, 'Membership DPA', '成员资格 DPA', 568);
INSERT INTO port_info VALUES (36, 'Membership MSN', '成员资格 MSN', 569);
INSERT INTO port_info VALUES (37, 'mountd', 'Linux的mountd Bug。这是扫描的一个流行BUG。大多数对这个端口的扫描是基于UDP的，但是基于TCP的mountd有所增加（mountd同时运行于两个端口）。记住mountd可运行于任何端口（到底是哪个端口，需要在端口111做portmap查询），只是Linux默认端口是635，就像NFS通常运行于2049端口。', 635);
INSERT INTO port_info VALUES (38, 'LDAP', 'SSL（Secure Sockets layer）', 636);
INSERT INTO port_info VALUES (39, 'Doom Id Software', '木马Attack FTP、Satanz Backdoor开放此端口', 666);
INSERT INTO port_info VALUES (40, 'IMAP', 'SSL（Secure Sockets layer）', 993);
INSERT INTO port_info VALUES (41, 'Reserved', '它是动态端口的开始，许多程序并不在乎用哪个端口连接网络，它们请求系统为它们分配下一个闲置端口。基于这一点分配从端口1024开始。这就是说第一个向系统发出请求的会分配到1024端口。你可以重启机器，打开Telnet，再打开一个窗口运行natstat -a 将会看到Telnet被分配1024端口。还有SQL session也用此端口和5000端口。', 1024);
INSERT INTO port_info VALUES (42, 'SOCKS', '这一协议以通道方式穿过防火墙，允许防火墙后面的人通过一个IP地址访问INTERNET。理论上它应该只允许内部的通信向外到达INTERNET。但是由于错误的配置，它会允许位于防火墙外部的攻击穿过防火墙。WinGate常会发生这种错误，在加入IRC聊天室时常会看到这种情况。', 1080);
INSERT INTO port_info VALUES (43, 'SQL', 'Microsoft的SQL服务开放的端口。', 1433);
INSERT INTO port_info VALUES (44, 'RPC client fixed port session queries', 'RPC客户固定端口会话查询', 1500);
INSERT INTO port_info VALUES (45, 'NetMeeting T.120', 'NetMeeting T.120', 1503);
INSERT INTO port_info VALUES (46, 'ingress', '许多攻击脚本将安装一个后门SHELL于这个端口，尤其是针对SUN系统中Sendmail和RPC服务漏洞的脚本。如果刚安装了防火墙就看到在这个端口上的连接企图，很可能是上述原因。可以试试Telnet到用户的计算机上的这个端口，看看它是否会给你一个SHELL。连接到600/pcserver也存在这个问题。', 1524);
INSERT INTO port_info VALUES (47, 'NetMeeting', 'NetMeeting H.233 call Setup。', 1720);
INSERT INTO port_info VALUES (48, 'NetMeeting Audio Call Control', 'NetMeeting音频调用控制', 1731);
INSERT INTO port_info VALUES (49, 'NFS', 'NFS程序常运行于这个端口。通常需要访问Portmapper查询这个服务运行于哪个端口', 2049);
INSERT INTO port_info VALUES (50, 'RPC client using a fixed port session replication', '应用固定端口会话复制的RPC客户', 2500);
INSERT INTO port_info VALUES (51, 'squid', '这是squid HTTP代理服务器的默认端口。攻击者扫描这个端口是为了搜寻一个代理服务器而匿名访问Internet。也会看到搜索其他代理服务器的端口8000、8001、8080、8888。扫描这个端口的另一个原因是用户正在进入聊天室。其他用户也会检验这个端口以确定用户的机器是否支持代理。', 3128);
INSERT INTO port_info VALUES (52, '超级终端', 'WINDOWS 2000终端开放此端口', 3389);
INSERT INTO port_info VALUES (53, 'QQ客户端', '腾讯QQ客户端开放此端口。', 4000);
INSERT INTO port_info VALUES (54, 'pcAnywere', '有时会看到很多这个端口的扫描，这依赖于用户所在的位置。当用户打开pcAnywere时，它会自动扫描局域网C类网以寻找可能的代理（这里的代理是指agent而不是proxy）。入侵者也会寻找开放这种服务的计算机。，所以应该查看这种扫描的源地址。一些搜寻pcAnywere的扫描包常含端口22的UDP数据包', 5632);
INSERT INTO port_info VALUES (55, 'RealAudio', 'RealAudio客户将从服务器的6970-7170的UDP端口接收音频数据流。这是由TCP-7070端口外向控制连接设置的。', 6970);
INSERT INTO port_info VALUES (56, 'Wingate', 'Wingate代理开放此端口', 8010);
INSERT INTO port_info VALUES (57, '代理端口', 'WWW代理开放此端口', 8080);
INSERT INTO port_info VALUES (58, 'PowWow', 'PowWow是Tribal Voice的聊天程序。它允许用户在此端口打开私人聊天的连接。这一程序对于建立连接非常具有攻击性。它会驻扎在这个TCP端口等回应。造成类似心跳间隔的连接请求。如果一个拨号用户从另一个聊天者手中继承了IP地址就会发生好象有很多不同的人在测试这个端口的情况。这一协议使用OPNG作为其连接请求的前4个字节。', 13223);
INSERT INTO port_info VALUES (59, 'Conducent', '这是一个外向连接。这是由于公司内部有人安装了带有Conducent‘adbot’的共享软件。Conducent‘adbot’是为共享软件显示广告服务的。使用这种服务的一种流行的软件是Pkware。', 17027);
INSERT INTO port_info VALUES (60, '暂无', 'Kerberos krb5。另外TCP的88端口也是这个用途', 88);
INSERT INTO port_info VALUES (61, 'SMTP', 'Simple Network Management Protocol(SMTP)（简单网络管理协议）', 161);
INSERT INTO port_info VALUES (62, 'CIFS', 'Common Internet File System(CIFS)（公共Internet文件系统）', 445);
INSERT INTO port_info VALUES (63, 'MYSQL', 'mysql常用端口', 3306);
INSERT INTO port_info VALUES (64, 'SSL', 'SSL服务常用端口', 443);
INSERT INTO port_info VALUES (65, 'REDIS', 'redis服务常用端口', 6379);
INSERT INTO port_info VALUES (66, 'FTP data', 'FTP数据端口', 20);

-- ----------------------------
-- Auto increment value for port_info
-- ----------------------------

