NotificationBanner
=======
A foreground notification banner library, easy to use and customizable.

<img src="https://raw.githubusercontent.com/joehour/NotificationBanner/master/Example/Example/demo.gif"  />

Features
----------

- [x] Provide Success, Info, Warning, Error, and Custom banner type.
- [x] Adapt itself to the device orientation.
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
You can configure NotificationBanner properties

* NotificationBanner style(Success, Info, Warning, Error, and Custom banner type)*
```swift
bannerStyle: .sucessMessage   //Success style
bannerStyle: .infoMessage     //Info style
bannerStyle: .warningMessage  //Warning style
bannerStyle: .errorMessage    //Error style
bannerStyle: .customView      //Custom style
```

* NotificationBanner location on the view
```swift
bannerLocation: .Top     //Top
bannerLocation: .Bottom  //Bottom
```

* NotificationBanner title message
```swift
messageTitle: String     //title message
```

* NotificationBanner content message
```swift
messageContent: String     //content message
```

* NotificationBanner title string font
```swift
messageTitleFont: CGFloat     //title string font
```


* NotificationBanner content string font
```swift
messageContentFont: CGFloat     //content string font
```

* NotificationBanner Height
```swift
bannerHeight: Int     //banner height, default is 80
```

* NotificationBanner hold time(second)
```swift
bannerHoldTime: Int     //banner hold time, default is 5 sec
```

* If your bannerStyle is .customView(Custom style), you can configure bannerBackgroundColor and bannerImage properties
```swift
bannerBackgroundColor: UIColor     //banner background color
bannerImage: UIImage               //banner icon image
```


License
----------

NotificationBanner is available under the MIT License.

Copyright © 2016 Joe.

