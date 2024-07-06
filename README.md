# linux-v2rayclient-script
适用于自己已经部署好v2ray服务端，想在linux使用v2ray客户端的用户
## 第一步
请前往https://github.com/v2ray/v2ray-core/releases/ 下载v2ray客户端压缩包，我这里下载的是https://github.com/v2ray/v2ray-core/releases/download/v4.28.2/v2ray-linux-64.zip

## 第二步
解压压缩包并进入目录
```
unzip v2ray-linux-64.zip -d v2ray-linux-64
cd v2ray-linux-64
```
## 第三步

配置好你的config.json，具体如何配置可以参考https://v2xtls.org/v2ray%e6%95%99%e7%a8%8b/

## 最后一步

v2ray,启动！
在当前目录使用`start.sh`
```
chmod +x v2ray-start.sh
./v2ray-start.sh
```
## 测试
使用以下命令即可测试终端是否成功代理
```
curl https://www.google.com -v
```
如果能返回谷歌官网的源代码，那就是表示配置成功。

如果显示超时或者无法建立连接，那就是配置有错误，可以查看日志排查原因（需提前在config.json里配置access.log和error.log路径）
