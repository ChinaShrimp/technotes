# Get repo
```
sudo curl https://raw.githubusercontent.com/ChinaShrimp/technotes/master/bin/repo > ~/bin/repo
chmod a+x ~/bin/repo
```

# Get the source
Change to your working directory and execute:
```
repo init -u https://git.allseenalliance.org/gerrit/devtools/manifest -b RB15.04
repo sync

mkdir gateway
cd gateway
git clone https://git.allseenalliance.org/gerrit/gateway/gwagent
git clone https://git.allseenalliance.org/gerrit/xmppconn
```

# Reference
[Downloading the Source](https://wiki.allseenalliance.org/develop/downloading_the_source)
[Repo](http://source.android.com/source/downloading.html#installing-repo)
