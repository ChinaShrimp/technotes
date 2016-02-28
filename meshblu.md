# meshblu installation
```
git clone https://github.com/octoblu/meshblu.git
cd meshblu
export TOKEN=123456
node --max-old-space-size=300 server.js --http
```

meshblu http API: https://meshblu-http.readme.io

# [meshblu-util](https://github.com/octoblu/meshblu-util)
```
# install
npm install -g meshblu-util
```

## Register
Register a new device with meshblu
```
meshblu-util register > meshblu.json
```

## Subscribe
Subscribe to the device in meshblu.json
```
meshblu-util subscribe ./meshblu.json
```

Subscribe to a device that meshblu.json has permission to listen to
```
meshblu-util subscribe -u 422e55fe-d461-4db8-9554-96b16d5660b5 ./meshblu.json
```

## Get
Get your meshblu device
```
meshblu-util get ./meshblu.json
```

## Update
Update your meshblu device
```
meshblu-util update -d '{"online": true}' ./meshblu.json
```

## Keygen
Generate a secure keypair and update your device's publicKey
```
meshblu-util keygen ./meshblu.json
```

## Private meshblu server
By default, meshblu-util will connect to official server (meshblu.octoblu.com:443). To use private server, just append --server option to the command. For example,
```
meshblu-util server-check --server localhost:8080
```

# [Gateblu](https://gateblu.readme.io/docs)

Gateblu, our desktop and embedded application, acts as a gateway to Octoblu for devices that require a local broker of sorts. Gateblu has plugins for BLE, consumer, and DIY devices. We're always adding new plugins. The more we add, the more you can connect.

## [Linux Setup](https://www.hackster.io/virgilvox/gateblu-octoblu-gateway-de9caa)
```
git clone https://github.com/octoblu/gateblu

npm start
```

## [Raspberry Pi Setup](https://www.hackster.io/virgilvox/gateblu-octoblu-gateway-de9caa)

## [Meshblu Connector Generator](https://github.com/octoblu/generator-meshblu-connector)
### [Yeoman](http://yeoman.io/)
Yeoman helps you to kickstart new projects, prescribing best practices and tools to help you stay productive.

To do so, we provide a generator ecosystem. A generator is basically a plugin that can be run with the `yo` command to scaffold complete projects or useful parts.

Through our official Generators, we promote the "Yeoman workflow". This workflow is a robust and opinionated client-side stack, comprising tools and frameworks that can help developers quickly build beautiful web applications. We take care of providing everything needed to get started without any of the normal headaches associated with a manual setup.

With a modular architecture that can scale out of the box, we leverage the success and lessons learned from several open-source communities to ensure the stack developers use is as intelligent as possible.

As firm believers in good documentation and well thought out build processes, Yeoman includes support for linting, testing, minification and much more, so developers can focus on solutions rather than worrying about the little things.

```
npm install -g yo

# access the help screen
yo --help

# list installed generator
yo --generators
```


#### Tools
- yo: scaffolds out a new application, writing your build configuration (e.g Gruntfile, Gulpfile) and pulling in relevant build tasks and package manager dependencies (Bower, npm) that you might need for your build.
- build system: The Build System is used to build, preview and test your project. Grunt and Gulp are two popular options.
- Package Manager: The Package Manager is used for dependency management, so that you no longer have to manually download and manage your scripts. Bower and npm are two popular options.

### Yeoman meshblu generator
yo itself doesn't pack any generator, which will be installed seperately. To install generator-meshblu-connector from npm, run
```
npm install -g generator-meshblu-connector

# run generator
yo meshblu-connector

# if there is any problem, following the instructions of yo doctor
yo doctor
```

## [meshblu-alljoyn](https://github.com/octoblu/meshblu-alljoyn)
### Installation
```
npm install meshblu-util -g
git clone https://github.com/octoblu/meshblu-alljoyn.git
cd meshblu-alljoyn
# install dependencies
npm install https://github.com/octoblu/alljoyn.git
npm install
meshblu-util register --server localhost:8080 -t device:meshblu-alljoyn > meshblu.json
meshblu-util claim
DEBUG='meshblu-alljoyn*' npm start
```

# meshblu API
## js

## json


## daoapp
1. create user 
chinashrimp:~/workspace $ curl -X POST -d "type=user&token=iot1234" http://chinashrimp-meshblu.daoapp.io/devices
{"uuid":"37ae3a91-6487-4136-9573-53b85e8c88fa","online":false,"_id":"RQEqpwrZoP4TJGMv","type":"user","token":"iot1234","ipAddress":"104.155.204.22, 10.10.115.82, 10.10.70.43","meshblu":{"hash":"llkCi57Yo5CElDHMIfj6oHvEKqhuSQWDLWXzSxGXBS4="}}

user uuid: 37ae3a91-6487-4136-9573-53b85e8c88fa
user token: iot1234

2. get user
curl -X GET --user "37ae3a91-6487-4136-9573-53b85e8c88fa:iot1234" \
http://chinashrimp-meshblu.daoapp.io/v2/devices/37ae3a91-6487-4136-9573-53b85e8c88fa

3. create devices
curl -X POST -d "owner=37ae3a91-6487-4136-9573-53b85e8c88fa" \
http://chinashrimp-meshblu.daoapp.io/v2/devices

{"uuid":"b7e8795e-5197-4e24-823b-e31ea0cab727","online":false,"_id":"nExzlqqpvOnLuzng","owner":"37ae3a91-6487-4136-9573-53b85e8c88fa","ipAddress":"104.155.204.22, 10.10.70.43, 10.10.70.43","token":"a9e66c6211e8ca754058f3c82a40d190f8ca0117","discoverWhitelist":["37ae3a91-6487-4136-9573-53b85e8c88fa"],"configureWhitelist":["37ae3a91-6487-4136-9573-53b85e8c88fa"],"meshblu":{"hash":"qDkvom5ehXAxSM3lWxYTn5P/ev+UK9jbqz0pEHeQEO8="}}

4. get my device list

curl -X GET --user "37ae3a91-6487-4136-9573-53b85e8c88fa:iot1234" \
http://chinashrimp-meshblu.daoapp.io/v2/devices

5. get my specified device
curl -X GET --user "37ae3a91-6487-4136-9573-53b85e8c88fa:iot1234" \
http://chinashrimp-meshblu.daoapp.io/v2/devices/b7e8795e-5197-4e24-823b-e31ea0cab727

6. delete my specified device
curl -X DELETE --user "37ae3a91-6487-4136-9573-53b85e8c88fa:iot1234" \
http://chinashrimp-meshblu.daoapp.io/v2/devices/b7e8795e-5197-4e24-823b-e31ea0cab727

# meshblu docker
sudo wget -O /etc/sources.list http://mirrors.163.com/.help/sources.list.trusty
sudo apt-get update
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant

sudo docker pull octoblu/meshblu

## meshblu-util register
meshblu-util register --server 172.17.0.2:80 > meshblu.json
-> request
POST /devices
content-type: application/json

<- reply
uuid
_id
token
meshblu
ipAddress

```
{
  "uuid": "c26fa3a5-46b4-428d-a667-1502bcc506bf",
  "token": "62e7f647c52406da83d4d2b94f329e2cfe55acd4",
  "server": "172.17.0.2",
  "port": "80"
}
```

## meshblu-util get
meshblu-util get --server 172.17.0.2:80  meshblu.json
{
  "uuid": "c26fa3a5-46b4-428d-a667-1502bcc506bf",
  "online": false,
  "_id": "d4WUylOI8N3nZMuR",
  "discoverWhitelist": [],
  "configureWhitelist": [],
  "receiveWhitelist": [],
  "sendWhitelist": [],
  "ipAddress": "172.17.0.1",
  "meshblu": {
    "hash": "89MOXPO4uM+y+13752Vm298iVGGROPNtAsrK8Nr/Psw="
  }
}

-> request
GET /v2/devices/c26fa3a5-46b4-428d-a667-1502bcc506bf


[meshblu http doc]: https://meshblu-http.readme.io/