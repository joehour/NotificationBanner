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

        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShowSucessTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .sucessMessage, bannerLocation: .Top,
                               messageTitle: "Sucess", messageContent: "This is a Sucess notification")
    }
    @IBAction func ShowInfoTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .infoMessage, bannerLocation:.Bottom,
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
    
    @IBAction func ShowSucessBottom(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .sucessMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Sucess", messageContent: "This is a Sucess notification")
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

        dissmissBanner(completion: { Sucess in _ = Bool()
            if(Sucess){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "test") as! TestController
                self.show(controller, sender: nil)
            }
        }
        )
   
    }
    

}

