//
//  testController.swift
//  Example
//
//  Created by JoeJoe on 2016/10/19.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit
import NotificationBanner

class TestController: UIViewController, NotificationBannerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ShowSuccessTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .successMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Success", messageContent: "This is a Success notification", messageTitleFont: 14, messageContentFont: 10, bannerHeight: 50)
    }
    
    @IBAction func ShowInfoTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .infoMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Info", messageContent: "This is an info notification", messageTitleFont: 14, messageContentFont: 10, bannerHeight: 50)
    }
    
    @IBAction func ShowErrorTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .errorMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Error", messageContent: "This is an error notification", messageTitleFont: 14, messageContentFont: 10, bannerHeight: 50)
    }
    
    @IBAction func ShowWarningTop(_ sender: AnyObject) {
        showNotificationBanner(bannerStyle: .warningMessage, bannerLocation: NotificationBannerView.Location.Bottom,
                               messageTitle: "Warning", messageContent: "This is a warning notification", messageTitleFont: 14, messageContentFont: 10, bannerHeight: 50)
    }
    
    func notificationBannerClick(_ view: NotificationBannerView) {
        dissmissBanner(completion: { Success in _ = Bool()
            if Success {
                let storyboard = UIStoryboard(name:"Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "main") as! ViewController
                self.navigationController?.present(controller, animated: true, completion: {
                    Void in
                    let appdelegate = UIApplication.shared.delegate as! AppDelegate
                    let storyboard = UIStoryboard(name:"Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "main") as! ViewController
                    let navigate = UINavigationController(rootViewController: controller)
                    appdelegate.window!.rootViewController = navigate
                })
            }
        }
        )
    }
}
