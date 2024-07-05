if [ -f v2ray ]; then
    mv -f v2ray /usr/local/bin/
fi

if [ -f v2ctl ]; then
    mv -f v2ctl /usr/local/bin/
fi

if [ ! -d /usr/local/share/v2ray/ ]; then
    mkdir -p /usr/local/share/v2ray/
fi

if [ -f geoip.dat ]; then
    mv -f geoip.dat /usr/local/share/v2ray/
fi

if [ -f geosite.dat ]; then
    mv -f geosite.dat /usr/local/share/v2ray/
fi

if [ ! -d /usr/local/etc/v2ray/ ]; then
    mkdir -p /usr/local/etc/v2ray/
fi

if [ -f config.json ]; then
    mv -f config.json /usr/local/etc/v2ray/
fi

if [ ! -d /var/log/v2ray/ ]; then
    mkdir -p /var/log/v2ray/
fi
if [ -f "access.log" ] && [ -f "error.log" ]; then
    mv access.log error.log /var/log/v2ray/
else
   
    touch /var/log/v2ray/access.log /var/log/v2ray/error.log
fi
# 日志路径需要在config.json里配置
chmod 777 /var/log/v2ray/access.log
chmod 777 /var/log/v2ray/error.log

if [ -f systemd/system/v2ray.service ]; then
    mv -f systemd/system/v2ray.service /etc/systemd/system/
fi

if [ -f systemd/system/v2ray@.service ]; then
    mv -f systemd/system/v2ray@.service /etc/systemd/system/
fi
systemctl start v2ray

if [ -z "$ALL_PROXY" ]; then
        echo 'export ALL_PROXY="socks5://127.0.0.1:10808"' >> ~/.bashrc # 根据配置文件config.json自行修改
fi

if [ -z "$http_proxy" ]; then
    echo 'export http_proxy="http://127.0.0.1:10809"' >> ~/.bashrc   # 根据配置文件config.json自行修改
fi
source ~/.bashrc

echo "v2ray已启动，请手动检查运行状态"
