# Problem
Company blocked evernote, I need bypass it!

# Facts
Using wireshark to analysis, no response to Client Hello (SSL) from yinxiang (app.yinxiang.com:443), 
but the TCP connection to coorporate proxy server is established successfully. So we could get the
conconlusion that coorporate firewall blocks the connection.

# Solution
1. Through pac file, redirect access to yingxiang to local proxy
2. Local proxy works with remote server to transport any tcp through coorporate HTTP proxy
3. Local proxy and remote server forwards any information bi-directionaly

# [PAC](https://en.wikipedia.org/wiki/Proxy_auto-config)
A proxy auto-config (PAC) file defines how web browsers and other user agents can automatically choose
the appropriate proxy server (access method) for fetching a given URL.

## PAC server
```
var http = require('http');
http.createServer(function (req, res) {
    var rf = require("fs");
    var data = rf.readFileSync("evernote.pac","utf-8"); 
    res.writeHead(200, {'Content-Type': 'application/x-ns-proxy-autoconfig; charset=UTF-8'});
    res.end(data);
}).listen(9090, '0.0.0.0');
console.log('Server running at http://0.0.0.0:9090/');
```

## evernote.pac
```
function FindProxyForURL(url, host) {
  var resolve_res = dnsResolve(host);
  // If the requested website is hosted within the internal network, send direct.
  if (isPlainHostName(host) ||
      shExpMatch(host, "*.local") ||
      isInNet(resolve_res, "10.0.0.0", "255.0.0.0") ||
      isInNet(resolve_res, "172.16.0.0",  "255.240.0.0") ||
      isInNet(resolve_res, "192.168.0.0",  "255.255.0.0") ||
      isInNet(resolve_res, "127.0.0.0", "255.255.255.0"))
      return "DIRECT";

  if (shExpMatch(host, "(*.yinxiang.com|yinxiang.com)"))
  {
      return "PROXY localhost:3128";
  }
  // All other requests go through port 8080 of proxy.example.com.
  // should that fail to respond, go directly to the WWW:
  return "DIRECT";
}
```

# httptunnel
https://sourceforge.net/projects/http-tunnel/files/http-tunnel/HTTPTunnel%20v1.2.1/
client: HTTPTunnel_v1.2.1
server: GNU httptunnel

## httptunnel client
1. configure server information
2. add portmap rules

## httptunnel server
```
cd HTTPTunnel_v1.2.1
cp -R common perl
cd perl
sudo perl httptunnel_server.pl 
```

# squid
Follow instructions in squid Dockerfile to setup squid in c9 workspace
https://github.com/sameersbn/docker-squid/blob/master/Dockerfile

```
# Installation
su root
export SQUID_VERSION=3.3.8 \
SQUID_CACHE_DIR=/var/spool/squid3 \
SQUID_LOG_DIR=/var/log/squid3 \
SQUID_USER=proxy

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 80F70E11F0F0D5F10CB20E62F5DA5F09C3173AA6 \
&& echo "deb http://ppa.launchpad.net/brightbox/squid-ssl/ubuntu trusty main" >> /etc/apt/sources.list \
&& apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y squid3-ssl=${SQUID_VERSION}* \
&& mv /etc/squid3/squid.conf /etc/squid3/squid.conf.dist \
&& rm -rf /var/lib/apt/lists/*

cp squid.conf /etc/squid3/squid.conf
cp entrypoint.sh /sbin/entrypoint.sh
chmod 755 /sbin/entrypoint.sh

# Run
su root
export SQUID_VERSION=3.3.8 \
SQUID_CACHE_DIR=/var/spool/squid3 \
SQUID_LOG_DIR=/var/log/squid3 \
SQUID_USER=proxy

/sbin/entrypoint.sh
```

# TODO
1. evernote client still could not access app.yinxiang.com
2. need encryption

# Reference
http://blogs.msdn.com/b/ieinternals/archive/2013/10/11/web-proxy-configuration-and-ie11-changes.aspx
http://findproxyforurl.com/
https://github.com/cloudhead/node-static

need:
pac file
local pac server

