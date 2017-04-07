//
//  ViewController.swift
//  Example
//
//  Created by JoeJoe on 2016/10/5.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit
import NotificationBanner

class ViewController: UIViewController, NotificationBannerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShowSuccessTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .successMessage, bannerLocation: .Top,
                               messageTitle: "Success", messageContent: "This is a Success notification")
    }
    
    @IBAction func ShowInfoTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .infoMessage, bannerLocation:.Top,
                               messageTitle: "Info", messageContent: "This is an info notification")
    }
    
    @IBAction func ShowErrorTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .errorMessage, bannerLocation: NotificationBannerView.Location.Top,
                               messageTitle: "Error", messageContent: "This is an error notification")
    }
    
    @IBAction func ShowWarningTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .warningMessage, bannerLocation: NotificationBannerView.Location.Top,
                               messageTitle: "Warning", messageContent: "This is a warning notification")
    }
    
    @IBAction func ShowSuccessBottom(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .successMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Success", messageContent: "This is a Success notification")
    }
    
    @IBAction func ShowInfoBottom(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .infoMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Info", messageContent: "This is an info notification")
    }
    
    @IBAction func ShowErrorBottom(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .errorMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Error", messageContent: "This is an error notification")
    }
    
    @IBAction func ShowWarningBottom(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .warningMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Warning", messageContent: "This is a warning notification")
        
    }
    
    @IBAction func ShowCustomBottom(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .customView, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Custom", messageContent: "This is a custom notification", bannerBackgroundColor: .blue, bannerImage: UIImage(named: "ic_mode_edit_white_3x.png")! )
       
    }

    func notificationBannerClick(_ view: NotificationBannerView) {

        dissmissBanner(completion: { Success in _ = Bool()
            if(Success){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "test") as! TestController
                self.show(controller, sender: nil)
            }
        }
        )
    }
}
