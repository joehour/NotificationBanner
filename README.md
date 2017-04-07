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

Check out [Get Started](https://guides.cocoapods.org/using/getting-started.html) tab on [cocoapods.org](http://cocoapods.org/).

To use NotificationBanner in your project add the following 'Podfile' to your project

    pod 'NotificationBanner', '~> 1.0.4’

Then run:

    pod install

#### Source Code
Copy the NotificationBanner Directory to your project.
Go ahead and import NotificationBanner to your file.


Example
----------

#### Please check out the Example project included.


Usage
----------

* Sample:

```swift
import NotificationBanner

class ViewController: UIViewController, NotificationBannerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Show NotificationBanner
        showNotificationBanner(bannerStyle: .successMessage, bannerLocation: .Top,
                               messageTitle: "Success", messageContent: "This is a Success notification")
        
    }

    
    //NotificationBanner click event(required)
    func notificationBannerClick(_ view: NotificationBannerView) {
        
        //Dissmiss NotificationBanner
        dissmissBanner(completion: { Sucess in _ = Bool()
            if(Sucess){
              
            }
        }
        )
   
    }
}
```

Customization
----------
You can configure NotificationBanner properties.

* NotificationBanner style(Success, Info, Warning, Error, and Custom banner type)*
```swift
bannerStyle: .successMessage   //Success style
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
messageTitleFont: CGFloat     //title string font, default is 25
```


* NotificationBanner content string font
```swift
messageContentFont: CGFloat     //content string font, default is 15
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

