# Receive message from transport
```
XmppTransport::XmppStanzaHandler
  Transport::MessageReceived
    XMPPConnector::MessageReceived
      根据typeCode进行分别处理
  
# All typeCode defined in XMPPConnector.h
    static const std::string ALLJOYN_CODE_ADVERTISEMENT;
    static const std::string ALLJOYN_CODE_ADVERT_LOST;
    static const std::string ALLJOYN_CODE_ANNOUNCE;
    static const std::string ALLJOYN_CODE_JOIN_REQUEST;
    static const std::string ALLJOYN_CODE_JOIN_RESPONSE;
    static const std::string ALLJOYN_CODE_SESSION_JOINED;
    static const std::string ALLJOYN_CODE_SESSION_LOST;
    static const std::string ALLJOYN_CODE_METHOD_CALL;
    static const std::string ALLJOYN_CODE_METHOD_REPLY;
    static const std::string ALLJOYN_CODE_SIGNAL;
    static const std::string ALLJOYN_CODE_GET_PROPERTY;
    static const std::string ALLJOYN_CODE_GET_PROP_REPLY;
    static const std::string ALLJOYN_CODE_SET_PROPERTY;
    static const std::string ALLJOYN_CODE_SET_PROP_REPLY;
    static const std::string ALLJOYN_CODE_GET_ALL;
    static const std::string ALLJOYN_CODE_GET_ALL_REPLY;
    static const std::string ALLJOYN_CODE_NAME_OWNER_CHANGED;

#根据typeCode分别调用
ReceiveAdvertisement
ReceiveAdvertisementLost
ReceiveAnnounce
ReceiveJoinRequest
ReceiveJoinResponse
ReceiveSessionJoined
ReceiveSessionLost
ReceiveMethodCall
ReceiveMethodReply
ReceiveSignal
ReceiveGetReply
ReceiveSetReply
ReceiveGetAllReply
```


# Send Message through Transport
```
SendAdvertisement
SendAdvertisementLost
SendAnnounce
SendJoinRequest
SendJoinResponse
SendSessionJoined
SendSessionLost
SendMethodCall
SendMethodReply
SendSignal
SendGetRequest
SendGetReply
SendSetRequest
SendSetReply
SendGetAllRequest
SendGetAllReply
SendNameOwnerChanged


XMPPConnector::SendMessage
  Transport::Send
    XmppTransport::SendImpl
```

# Announce
## Receive remote online presence
```
When receiving remote online presence message, xmppconn will attach to
local AllJoyn Bus and listens to Announcement on local network
XmppTransport::XmppPresenceHandler
    Transport::RemoteSourcePresenceStateChanged
        XMPPConnector::RemoteSourcePresenceStateChanged
            # create busattachment to local aj bus and listens to
            # local aj bus
            XMPPConnector::CreateBusAttachment
            AnnouncementRegistrar::RegisterAnnounceHandler
                new InternalAnnounceHandler(bus)
                // Add the user handler to the internal AnnounceHandler
                internalAnnounceHandler->AddHandler
```
## Announce
When receiving announcement from local network, registered callback will
be called. Then xmppconn will introspect the device bus objects

```
AllJoynListener::Announce
  // 通过标准AllJoyn Inspect接口获取发送Abount消息设备的信息
  JoinSession
  new ProxyBusObject
  new IntrospectCallbackContext()
  proxy->IntrospectRemoteObjectAsync(..., AllJoynListener::IntrospectCallback)


AllJoynListener::IntrospectCallback
  AllJoynListener::GetBusObjectsAsync

AllJoynListener::GetBusObjectsAnnouncementCallback
  XMPPConnector::SendAnnounce
```

## Receiving remote Announce
```
typeCode == ALLJOYN_CODE_ANNOUNCE
XMPPConnector::ReceiveAnnounce
    GetRemoteAttachment
    bus->RelayAnnouncement
        new AboutObj
        m_aboutObj->Announce
```
