//
//  ViewController.m
//  objcExample
//
//  Created by JoeJoe on 2017/2/10.
//  Copyright © 2017年 Joe. All rights reserved.
//

#import "ViewController.h"
#import "objcExample-swift.h"

@interface ViewController ()<NotificationBannerDelegate>

@end

objcNotificationBanner *notification;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    notification = [objcNotificationBanner new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SucessButton:(id)sender {
     [notification showNotificationBannerWithBannerStyle: BannerStyleSucessMessage bannerLocation: LocationBottom  messageTitle: @"Sucess" messageContent: @"This is a Sucess notification" messageTitleFont: 25 messageContentFont: 15 bannerHeight: 80 bannerHoldTime: 25 bannerBackgroundColor: nil bannerImage: nil];
}

- (IBAction)ErrorButton:(id)sender {
    [notification showNotificationBannerWithBannerStyle: BannerStyleErrorMessage bannerLocation: LocationTop  messageTitle: @"Error" messageContent: @"This is a Error notification" messageTitleFont: 25 messageContentFont: 15 bannerHeight: 80 bannerHoldTime: 25 bannerBackgroundColor: nil bannerImage: nil];
}

- (void) notificationBannerClick:(NotificationBannerView *)view {
    
}

@end
