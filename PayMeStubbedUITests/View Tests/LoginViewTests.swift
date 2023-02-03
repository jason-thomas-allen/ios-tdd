//
//  MockingDemoUITests.swift
//  MockingDemoUITests
//
//  Created by Jason Allen on 25/1/2023.
//

import XCTest
import SwiftUI

final class given_user_is_on_login_screen: XCTestCase {
    
    private var app: XCUIApplication!
    private var loginView: LoginViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        loginView = LoginViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }

    func test_when_user_clicks_login_then_display_error_message_for_missing_required_fields() {
        
        loginView.userName = ""
        loginView.password = ""
        
        // When
        loginView.login()
        
        // Then
        XCTAssertEqual(loginView.message, "Required fields are missing")
    }
    
    func test_when_user_clicks_login_then_navigate_to_home_page_when_authenticated() {
        
        loginView.userName = "JohnDoe"
        loginView.password = "Password!"
        
        loginView.login()
        
        let homeTitle = HomeViewPage(app: app).message
        XCTAssertTrue(homeTitle.waitForExistence(timeout: 5.0))
    }
    
    func test_when_user_clicks_login_then_display_error_message_for_invalid_credentials() {
        
        loginView.userName = "JohnDoe"
        loginView.password = "WrongPassword"
                
        loginView.login()
        
        XCTAssertEqual(loginView.message, "Invalid credentials")
    }
}

