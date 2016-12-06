NotificationBanner
=======
A foreground notification banner library, easy to use and customizable.

<img src="https://raw.githubusercontent.com/joehour/NotificationBanner/master/Example/Example/demo.gif"  />

Features
----------

- [x] Provide Success, Info, Warning, Error, and Custom banner type.
- [x] Adapts itself to the device orientation.
- [x] Handle click event.


Requirements
----------

- iOS 8.0+
- Xcode 8.0+ Swift 3

Installation
----------

#### CocoaPods

soon..


Example
----------

####Please check out the Example project included.

#####Basic setting:

       showNotificationBanner(bannerStyle: .sucessMessage, bannerLocation: NotificationBannerView.Location.Top, messageTitle: "Sucess", messageContent: "This is a Sucess notification")


Customization
----------
You can show a NotificationBanner instance and configure this properties

* The banner stye(Success, Info, Warning, Error, and Custom banner type)*
```swift
bannerStyle: .sucessMessage   //Success style
bannerStyle: .infoMessage     //Info style
bannerStyle: .warningMessage  //Warning style
bannerStyle: .errorMessage    //Error style
```



License
----------

NotificationBanner is available under the MIT License.

Copyright © 2016 Joe.

