# openjdk vs oracle jdk
If no special requirements, use openjdk. It's easier to install using apt-get. 
Oracle jdk will be used if there is special requirement, for example performance.
Installation of oracle jdk is somewhat manual procedures, like downloading, unzip,
move, and etc.

# Auto-installaing oracle jdk using ppa
```
sudo apt-get purge openjdk-\*
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
```

# Reference
[Installing Java Automatically (With Silent Option)](http://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option)

[Install Oracle Java 8 In Ubuntu Or Linux Mint Via PPA Repository](http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html)
