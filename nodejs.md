# Installation
Use [nvm](https://github.com/creationix/nvm) to manage and install different versions of nodejs.
## nvm installation
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
```

## nodejs installation
use nvm ls-remote to list supported nodejs versions. Then use nvm install <nodejs version>. For example:
```
nvm install v4.4.2
# set default alias
nvm alias default v4.4.2
# use nodejs v4.4.2
nvm use default
```
