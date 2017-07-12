//
//  NotificationBannerView.swift
//  NotificationBanner
//
//  Created by JoeJoe on 2016/10/5.
//  Copyright © 2016年 Joe. All rights reserved.
//

import Foundation

public protocol NotificationBannerDelegate: class {
    func notificationBannerClick(_ view: NotificationBannerView)
}

open class NotificationBannerView: UIView {
    open weak var delegate: NotificationBannerDelegate!
    var currentDevice: UIDevice = UIDevice.current
    var orientation: UIDeviceOrientation?
    var rotateTimer: Timer? = nil
    var dissmissTimer: Timer? = nil
    var textView: UITextView! = nil
    var imageView: UIImageView! = nil
    var titleView: UITextView! = nil
    var cancelView: UIImageView! = nil
    open var currentStyle: Style = .successMessage
    var initialBannerHeight: Int = 80
    var currentTitleFont: CGFloat = 25
    var currentContentFont: CGFloat = 16
    var currentView: UIWindow!
    var currentHeight: CGFloat = 100
    var currentLocation: Location = Location.Top
    var currentHoldTime: Int = 5
    var springHeight: CGFloat = 0
    var fixHeight: Int = 0
    var fixStatusBarHeight: Int = 0
    var dismisssing: Bool = false
    var isBackgroundNotification: Bool = false
    public enum Location {
        case Bottom
        case Top
    }
    public enum Style {
        case customView
        case errorMessage
        case successMessage
        case infoMessage
        case warningMessage
    }

    internal init(view: UIWindow, height: Int, bannerLocation location: Location = .Top) {
        currentView = view
        springHeight = CGFloat(height) * 0.33
        currentHeight = CGFloat(height) + (springHeight)
        currentLocation = location
        initialBannerHeight = height
        if currentLocation == .Top {
            super.init(frame: CGRect(x: 0, y: Int(-currentHeight-self.springHeight * 0.33), width: Int(view.bounds.width), height: Int(currentHeight+springHeight / 3) ))
        } else {
            super.init(frame: CGRect(x: 0, y: Int(view.bounds.height), width: Int(view.bounds.width), height: Int(currentHeight+springHeight) ))
        }
        
        orientation = currentDevice.orientation
        rotateTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(NotificationBannerView.rotate), userInfo: nil, repeats: true)

        if !(view.subviews.contains(where: {$0 is (NotificationBannerView)})) {
            let tap = UITapGestureRecognizer(target: self, action: #selector(click(_:)))
            tap.numberOfTapsRequired = 1
            
            self.addGestureRecognizer(tap)
            self.backgroundColor = backgroundColor
            view.addSubview(self)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func show() {
        textView.isScrollEnabled = true
        self.isHidden = false
            UIView.animate(
                withDuration: Double(3), delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.5, options: [.curveEaseInOut, .allowUserInteraction],
                animations: {
                    if self.currentLocation == .Top {
                        self.frame.origin.y = -(CGFloat)(self.springHeight)
                    } else {
                        self.frame.origin.y = CGFloat(Int(self.currentView.bounds.height - self.currentHeight + self.springHeight * 0.5))
                    }
                },
                completion: { finished in
                    if !self.isHidden {
                        self.dissmissTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.currentHoldTime), target: self, selector: #selector(NotificationBannerView.autoDissmiss), userInfo: nil, repeats: false)
                    }
                }
            )
    }
    
    open func setParameter(textContent: String = "", textColor: UIColor = .white, backgroundColor: UIColor = .black) {
        if backgroundColor != .black {
            self.backgroundColor = backgroundColor
        }
        if textContent != ""{
            self.textView.text = textContent
        }
        if textColor != .white {
            self.textView.textColor = textColor
        }
    }
    
    internal func autoDissmiss() {
        dismisssing = true
        UIView.animate(
            withDuration: Double(0.5), delay: 0, options: [.curveEaseInOut, .allowUserInteraction],
            animations: {
                if self.currentLocation == .Top {
                    self.frame.origin.y = -CGFloat(self.currentHeight+self.springHeight * 0.33)
                } else {
                    self.frame.origin.y = CGFloat(Int(self.currentView.bounds.height))
                }
            },
            completion: { finished in
                self.dissmissTimer?.invalidate()
                self.isHidden = true
                self.layer.removeAllAnimations()
                self.dismisssing = false
                self.textView.isScrollEnabled = false
            }
        )
    }
    
    internal func dissmiss(completion: @escaping (_ Success: Bool)->()) {
        dismisssing = true
        UIView.animate(
               withDuration: Double(0.5), delay: 0, options: [.curveEaseInOut, .allowUserInteraction],
               animations: {
                if self.currentLocation == .Top {
                    self.frame.origin.y = -CGFloat(self.currentHeight+self.springHeight * 0.33)
                } else {
                    self.frame.origin.y = CGFloat(Int(self.currentView.bounds.height))
                }
        },
               completion: { finished in
                   completion(true)
                   self.isHidden = true
                   self.dissmissTimer?.invalidate()
                   self.layer.removeAllAnimations()
                   self.dismisssing = false
                   self.textView.isScrollEnabled = false
            }
        )
    }
    
    internal func rotate() {
        if currentDevice.orientation != orientation {
            if currentLocation == .Top {
                fixHeight = Int(springHeight)
                fixStatusBarHeight = Int(springHeight * 0.5)
                self.frame = CGRect(x: Int(self.frame.origin.x), y: Int(-springHeight), width: Int(currentView.bounds.width), height: Int(currentHeight + springHeight * 0.33) )
            } else {
                fixHeight = 0
                fixStatusBarHeight = Int(springHeight * 0.45)
                self.frame = CGRect(x: Int(self.frame.origin.x), y: Int(currentView.bounds.height - currentHeight + springHeight * 0.5), width: Int(currentView.bounds.width), height: Int(currentHeight+springHeight) )
            }
            setContentPosition(setHight: fixHeight, setStatusBarHeight: fixStatusBarHeight)
            orientation = currentDevice.orientation
        }
    }
    
    internal func setContentPosition(setHight: Int, setStatusBarHeight: Int ) {
        self.cancelView.frame = (CGRect(x: Int(view.bounds.width - self.currentHeight * 0.5), y: Int(self.currentHeight * 0.17) + setHight, width: Int(self.currentHeight * 0.55), height: Int(self.currentHeight * 0.55)))
        self.titleView.frame = (CGRect(x: 20 + Int(self.currentHeight * 0.5), y: 0 + setHight + setStatusBarHeight, width: Int(view.bounds.width - self.currentHeight - 30), height: Int(self.currentHeight * 0.45)))
        self.textView.frame = (CGRect(x: 20 + Int(self.currentHeight * 0.5), y: Int(self.currentHeight * 0.33) + setHight + setStatusBarHeight, width: Int(view.bounds.width - self.currentHeight - 30), height: Int(self.currentHeight * 0.35)))
    }
    
    func click(_ sender: UITapGestureRecognizer) {
        if self.delegate != nil {
            self.delegate.notificationBannerClick(self)
        }
    }
    
    internal func setBannerContent(style: Style, textTitle: String = "", textContent: String = "", textColor: UIColor = .white, bannerLocation location: Location = .Top, messageTitleFont titleFont: CGFloat = 25, messageContentFont contentFont: CGFloat = 15, bannerHoldTime holdTime: Int = 5, bannerBackgroundColor: UIColor = .blue, bannerImage image: UIImage = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_info_white_3x", ofType: "png")!)!) {
        currentStyle = style
        currentTitleFont = titleFont
        currentContentFont = contentFont
        currentHoldTime = holdTime
        
        if location == Location.Top {
            fixHeight = Int(springHeight)
            fixStatusBarHeight = Int(springHeight * 0.5)
        } else {
            fixStatusBarHeight = Int(Double(springHeight) * 0.45 )
        }
        if location != currentLocation {
            currentLocation = location
            if currentLocation == .Top {
               self.frame = CGRect(x: 0, y: Int(-currentHeight-self.springHeight * 0.33), width: Int(view.bounds.width), height: Int(currentHeight+springHeight * 0.33) )
            } else {
                self.frame = CGRect(x: 0, y: Int(view.bounds.height), width: Int(view.bounds.width), height: Int(currentHeight+springHeight) )
            }
        }
        
        self.subviews.forEach({ $0.removeFromSuperview() })
        imageView = UIImageView(frame: CGRect(x: 10, y: Int(currentHeight * 0.17) + fixHeight, width: Int(currentHeight/2), height: Int(currentHeight/2)))
        self.addSubview(imageView)
        
        titleView = UITextView(frame: CGRect(x: 20 + Int(currentHeight * 0.5), y: 0 + fixHeight + fixStatusBarHeight, width: Int(view.bounds.width - currentHeight) - (10 + 20), height: Int(currentHeight*0.4)))
        titleView.text = textTitle
        titleView.contentInset = UIEdgeInsetsMake(-CGFloat(currentHeight * 0.08), 0.0, 0.0, 0.0)
        titleView.textColor = textColor
        titleView.font = .systemFont(ofSize: currentTitleFont)
        titleView.backgroundColor = UIColor.clear
        titleView.isEditable = false
        titleView.isSelectable = false
        titleView.isScrollEnabled = false
        self.addSubview(titleView)
        
        textView = UITextView(frame: CGRect(x: 20 + Int(currentHeight * 0.5), y: Int(currentHeight * 0.33) + fixHeight + fixStatusBarHeight, width: Int(view.bounds.width - currentHeight) - (10+20), height: Int(currentHeight * 0.35)))
        textView.text = textContent
        textView.contentInset = UIEdgeInsetsMake(-CGFloat(currentHeight * 0.08), 0.0, 0.0, 0.0)
        //textView.textAlignment = .center
        textView.textColor = textColor
        textView.font = .systemFont(ofSize: currentContentFont)
        textView.backgroundColor = UIColor.clear
        textView.isEditable = false
        textView.isSelectable = false
        self.addSubview(textView)
        
        cancelView = UIImageView(frame: CGRect(x: Int(view.bounds.width - currentHeight * 0.5), y: Int(currentHeight * 0.17) + fixHeight, width: Int(currentHeight * 0.55), height: Int(currentHeight*0.55)))
        cancelView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_clear_white", ofType: "png")!)
        cancelView.contentMode = .center
        cancelView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancel(_:)))
        tap.numberOfTapsRequired = 1
        cancelView.addGestureRecognizer(tap)
        self.addSubview(cancelView)
        
        switch style {
        case .errorMessage:
            self.backgroundColor = .red
            imageView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_error_white_3x", ofType: "png")!)
            break
        case .successMessage:
            self.backgroundColor = UIColor(red: 0.1, green: 0.7, blue: 0.2, alpha: 1.0)
            imageView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_done_white_3x", ofType: "png")!)
            break
        case .infoMessage:
            self.backgroundColor = UIColor(red: 0.1, green: 0.6, blue: 0.8, alpha: 1.0)
            imageView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_info_white_3x", ofType: "png")!)
            break
        case .warningMessage:
            self.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.1, alpha: 1.0)
            imageView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_warning_white_3x", ofType: "png")!)
            break
        case .customView:
            self.backgroundColor = bannerBackgroundColor
            imageView.image = image
            break
        default:
            break
        }

    }
    
    internal func changeStyle(style: Style, bannerBackgroundColor: UIColor = .blue, bannerImage image: UIImage = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_info_white_3x", ofType: "png")!)!) {
        currentStyle = style
        switch style {
        case .errorMessage:
            self.backgroundColor = .red
            imageView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_error_white_3x", ofType: "png")!)
            break
        case .successMessage:
            self.backgroundColor = UIColor(red: 0.1, green: 0.7, blue: 0.2, alpha: 1.0)
            imageView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_done_white_3x", ofType: "png")!)
            break
        case .infoMessage:
            self.backgroundColor = UIColor(red: 0.1, green: 0.6, blue: 0.8, alpha: 1.0)
            imageView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_info_white_3x", ofType: "png")!)
            break
        case .warningMessage:
            self.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.1, alpha: 1.0)
            imageView.image = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_warning_white_3x", ofType: "png")!)
            break
        case .customView:
            self.backgroundColor = bannerBackgroundColor
            imageView.image = image
            break
        default:
            break
        }
    }
    
    internal func changeLocation(bannerLocation location: Location = .Top) {
        if location == Location.Top {
            fixHeight = Int(springHeight)
            fixStatusBarHeight = Int(springHeight * 0.5)
        } else {
            fixHeight = 0
            fixStatusBarHeight = Int(Double(springHeight) * 0.45 )
        }
        if location != currentLocation {
            currentLocation = location
            if currentLocation == .Top {
                self.frame = CGRect(x: 0, y: Int(-currentHeight-self.springHeight * 0.33), width: Int(view.bounds.width), height: Int(currentHeight+springHeight * 0.33) )
            } else {
                self.frame = CGRect(x: 0, y: Int(view.bounds.height), width: Int(view.bounds.width), height: Int(currentHeight+springHeight) )
            }
        }
        
        imageView.frame = CGRect(x: 10, y: Int(currentHeight * 0.17) + fixHeight, width: Int(currentHeight/2), height: Int(currentHeight/2))

        titleView.frame = CGRect(x: 20 + Int(currentHeight * 0.5), y: 0 + fixHeight + fixStatusBarHeight, width: Int(view.bounds.width - currentHeight - 30), height: Int(currentHeight*0.4))
        textView.frame = CGRect(x: 20 + Int(currentHeight * 0.5), y: Int(currentHeight * 0.33) + fixHeight + fixStatusBarHeight, width: Int(view.bounds.width - currentHeight - 30), height: Int(currentHeight * 0.35))
        
        cancelView.frame = CGRect(x: Int(view.bounds.width - currentHeight*0.5), y: Int(currentHeight * 0.17) + fixHeight, width: Int(currentHeight * 0.55), height: Int(currentHeight * 0.55))
    }
    
    internal func changeFont(messageTitleFont titleFont: CGFloat = 25, messageContentFont contentFont: CGFloat = 16) {
        currentTitleFont = titleFont
        currentContentFont = contentFont
        titleView.font = .systemFont(ofSize: currentTitleFont)
        textView.font = .systemFont(ofSize: currentContentFont)
    }
    
    internal func changeHoldTime(bannerHoldTime holdTime: Int = 5) {
        currentHoldTime = holdTime
    }
    
    internal func setInitialOrientation() {
        if currentLocation == .Top {
            frame.origin.y = -CGFloat(currentHeight+springHeight * 0.33)
        } else {
            frame.origin.y = CGFloat(currentView.bounds.height)
        }
        setContentPosition(setHight: fixHeight, setStatusBarHeight: fixStatusBarHeight)
    }
    
    internal func setText(textTitle: String = "", textContent: String = "") {
        titleView.text = textTitle
        textView.text = textContent
    }
    
    func cancel(_ sender: UITapGestureRecognizer) {
        if !dismisssing {
            dissmiss(completion: { _ in (Bool)()

                }
            )
        }
    }

//User Notification Setting(for showInBackground function)
//    open func registerNotificationSetting() {
//        if #available(iOS 8.0, *) {
//            
//            let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//            UIApplication.shared.registerUserNotificationSettings(settings)
//            UIApplication.shared.registerForRemoteNotifications()
//            UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
//            UIApplication.shared.beginBackgroundTask(expirationHandler: {})
//            
//        } else {
//            
//        }
//    }
//    
//    open func showInBackground(message: String!) {
//        
//        let notification:UILocalNotification = UILocalNotification()
//        notification.soundName = UILocalNotificationDefaultSoundName
//        notification.alertBody = message
//        UIApplication.shared.scheduleLocalNotification(notification)
//    }
}
