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

Check out [Get Started](https://guides.cocoapods.org/using/getting-started.html) tab on [cocoapods.org](http://cocoapods.org/).

To use NotificationBanner in your project add the following 'Podfile' to your project

       source 'https://github.com/joehour/NotificationBanner.git'
       platform :ios, '8.0'
       use_frameworks!

       pod 'NotificationBanner', '~> 1.0.0’

Then run:

    pod install


Example
----------

####Please check out the Example project included.

#####Basic setting:

       showNotificationBanner(bannerStyle: .sucessMessage, bannerLocation: NotificationBannerView.Location.Top, messageTitle: "Sucess", messageContent: "This is a Sucess notification")


License
----------

NotificationBanner is available under the MIT License.

Copyright © 2016 Joe.

