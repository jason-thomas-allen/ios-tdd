//
//  MockingDemoUITests.swift
//  MockingDemoUITests
//
//  Created by Jason Allen on 25/1/2023.
//

import XCTest
import SwiftUI

final class given_user_on_home_page: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchArguments = ["HomeView"]
        app.launch()
    }
    
    func test_home_page() {
        let homeTitle = HomeViewPage(app: app).message
        XCTAssertTrue(homeTitle.waitForExistence(timeout: 5.0))
    }
    
}
