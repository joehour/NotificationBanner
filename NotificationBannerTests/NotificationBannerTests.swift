//
//  NotificationBannerTests.swift
//  NotificationBannerTests
//
//  Created by JoeJoe on 2016/10/4.
//  Copyright © 2016年 Joe. All rights reserved.
//

import XCTest
import NotificationBanner

@testable import NotificationBanner

class NotificationBannerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSucessBanner() {
        showNotificationBanner(bannerStyle: .sucessMessage, bannerLocation: NotificationBannerView.Location.Top,
                               messageTitle: "Sucess", messageContent: "This is a Sucess notification")
    }
    
    func testErrorBanner() {
        showNotificationBanner(bannerStyle: .errorMessage, bannerLocation: NotificationBannerView.Location.Top,
                               messageTitle: "Error", messageContent: "This is an Error notification")
    }
    
    func testInfoBanner() {
        showNotificationBanner(bannerStyle: .infoMessage, bannerLocation: NotificationBannerView.Location.Top,
                               messageTitle: "Info", messageContent: "This is an Info notification")
    }
    
    func testWarningBanner() {
        showNotificationBanner(bannerStyle: .warningMessage, bannerLocation: NotificationBannerView.Location.Top,
                               messageTitle: "Warning", messageContent: "This is a Warning notification")
    }
    
    
}
