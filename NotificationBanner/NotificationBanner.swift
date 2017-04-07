//
//  NotificationBanner.swift
//  NotificationBanner
//
//  Created by JoeJoe on 2016/10/12.
//  Copyright © 2016年 Joe. All rights reserved.
//

import Foundation

var bannerView: NotificationBannerView!
var view: UIWindow!

public func showNotificationBanner(bannerStyle style: NotificationBannerView.Style, bannerLocation location: NotificationBannerView.Location = .Top, messageTitle title: String, messageContent message: String, messageTitleFont titleFont: CGFloat = 25, messageContentFont contentFont: CGFloat = 15, bannerHeight height: Int = 80, bannerHoldTime holdTime: Int = 5, bannerBackgroundColor: UIColor = .blue, bannerImage image: UIImage = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_info_white_3x", ofType: "png")!)!) {
    
    view = UIApplication.shared.keyWindow
    if view == nil {
        return
    }
    
    if !(view.subviews.contains(where: {$0 is (NotificationBannerView)})) {
        bannerView = NotificationBannerView(view: view, height: height, bannerLocation: location)
        bannerView.isHidden = true
        bannerView.setBannerContent(style: style, textTitle: title, textContent: message, bannerLocation: location, messageTitleFont: titleFont, messageContentFont: contentFont, bannerBackgroundColor: bannerBackgroundColor, bannerImage: image)
        //bannerView.registerNotificationSetting()
        
        setBannerDelegate()
        bannerView.show()
    } else {
        if bannerView.isHidden {
            setContent(bannerStyle: style, bannerLocation: location, messageTitle: title, messageContent: message, messageTitleFont: titleFont, messageContentFont: contentFont, bannerHeight: height, bannerHoldTime: holdTime, bannerBackgroundColor: bannerBackgroundColor, bannerImage: image)
            
            setBannerDelegate()
            bannerView.show()
        } else {
        dissmissBanner(completion: { Success in (Bool)()
            if Success {
                DispatchQueue.main.async {
                    setContent(bannerStyle: style, bannerLocation: location, messageTitle: title, messageContent: message, messageTitleFont: titleFont, messageContentFont: contentFont, bannerHeight: height, bannerHoldTime: holdTime, bannerBackgroundColor: bannerBackgroundColor, bannerImage: image)
                    
                    setBannerDelegate()
                    bannerView.show()
                }
            }
            }
        )
      }
    }
}

public func dissmissBanner(completion: @escaping (_ Success: Bool)->() = { Success in (Bool)()}) {
    if bannerView == nil || bannerView.isHidden {
        return
    }
    bannerView.dissmiss(completion: completion)
}

internal func setBannerDelegate() {
    if !(view.rootViewController is UINavigationController) {
        if view.rootViewController?.presentedViewController != nil {
            bannerView.delegate = view.rootViewController?.presentedViewController as! NotificationBannerDelegate!
        } else {
            bannerView.delegate = view.rootViewController as! NotificationBannerDelegate!
        }
    } else {
        bannerView.delegate = (view.rootViewController as! UINavigationController).visibleViewController as! NotificationBannerDelegate!
    }
}

internal func setContent(bannerStyle style: NotificationBannerView.Style, bannerLocation location: NotificationBannerView.Location = .Top, messageTitle title: String, messageContent message: String, messageTitleFont titleFont: CGFloat = 25, messageContentFont contentFont: CGFloat = 15, bannerHeight height: Int = 80, bannerHoldTime holdTime: Int = 5, bannerBackgroundColor: UIColor = .blue, bannerImage image: UIImage = UIImage(contentsOfFile: Bundle(for: NotificationBannerView.self).path(forResource: "ic_info_white_3x", ofType: "png")!)!) {
    if Int(bannerView.initialBannerHeight) != height {
        bannerView.removeFromSuperview()
        bannerView = NotificationBannerView(view: view, height: height, bannerLocation: location)
        bannerView.isHidden = true
        
        bannerView.setBannerContent(style: style, textTitle: title, textContent: message, bannerLocation: location, messageTitleFont: titleFont, messageContentFont: contentFont)
    } else {
        if bannerView.currentStyle != style {
            bannerView.changeStyle(style: style, bannerBackgroundColor: bannerBackgroundColor, bannerImage: image)
        }
        if bannerView.currentLocation != location {
            bannerView.changeLocation(bannerLocation: location)
        }
        if bannerView.currentTitleFont != titleFont || bannerView.currentContentFont != contentFont {
            bannerView.changeFont(messageTitleFont: titleFont, messageContentFont: contentFont)
        }
        if bannerView.currentHoldTime != holdTime {
            bannerView.changeHoldTime(bannerHoldTime: holdTime)
        }
        
        bannerView.setInitialOrientation()
        bannerView.setText(textTitle: title, textContent: message)
    }
}
