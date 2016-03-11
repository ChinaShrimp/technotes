# Get repo
```
sudo curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
# Get the source
Change to your working directory and execute:
```
repo init -u https://git.allseenalliance.org/gerrit/devtools/manifest -b RB15.04
repo sync
```

# Reference
[Downloading the Source](https://wiki.allseenalliance.org/develop/downloading_the_source)
