# XMPP Server
## [ejabberd docker](https://hub.docker.com/r/rroemhild/ejabberd/)
Using docker to setup one XMPP server
```
docker pull rroemhild/ejabberd

# modify environment based on actual config, for details refer to [this](https://hub.docker.com/r/rroemhild/ejabberd/)
docker run -d \
    --name "ejabberd" \
    -p 5222:5222 \
    -p 5269:5269 \
    -p 5280:5280 \
    -h 'xmpp.example.de' \
    -e "XMPP_DOMAIN=example.de" \
    -e "ERLANG_NODE=ejabberd" \
    -e "EJABBERD_ADMINS=admin@example.de admin2@example.de" \
    -e "EJABBERD_USERS=admin@example.de:password1234 admin2@example.de" \
    -e "TZ=Europe/Berlin" \
    rroemhild/ejabberd
```

## [Profanity - XMPP Client](http://www.profanity.im/)
For Ubuntu trusty, add following ppa to /etc/apt/sources.list
```
deb http://ppa.launchpad.net/rsrchboy/profanity/ubuntu trusty main 
deb-src http://ppa.launchpad.net/rsrchboy/profanity/ubuntu trusty main 
```
Then install profanity
```
sudo apt-get install -y profanity
```
