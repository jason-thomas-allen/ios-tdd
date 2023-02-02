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
        
        // Given
        let userName = loginView.usernameTextField
        userName.tap()
        userName.typeText("")
        
        let pwd = loginView.passwordTextField
        pwd.tap()
        pwd.typeText("")
        
        // When
        let login = loginView.loginButton
        login.tap()
        
        // Then
        let msg = loginView.messageText
        XCTAssertEqual(msg.label, "Required fields are missing")
    }
    
    func test_when_user_clicks_login_then_navigate_to_home_page_when_authenticated() {
        
        let userName = loginView.usernameTextField
        userName.tap()
        userName.typeText("JohnDoe")
        
        let pwd = loginView.passwordTextField
        pwd.tap()
        pwd.typeText("Password!")
        
        let login = loginView.loginButton
        login.tap()
        
        let homeTitle = HomeViewPage(app: app).message
        XCTAssertTrue(homeTitle.waitForExistence(timeout: 5.0))
    }
    
    func test_when_user_clicks_login_then_display_error_message_for_invalid_credentials() {
        
        let userName = loginView.usernameTextField
        userName.tap()
        userName.typeText("JohnDoe")
        
        let pwd = loginView.passwordTextField
        pwd.tap()
        pwd.typeText("WrongPassword")
        
        let login = loginView.loginButton
        login.tap()
        
        let msg = loginView.messageText
        XCTAssertEqual(msg.label, "Invalid credentials")
    }
}

final class given_user_on_home_page: XCTestCase {
    
    private var app: XCUIApplication!
    //private var loginView: LoginViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        //loginView = LoginViewPage(app: app)
        continueAfterFailure = false
        app.launchArguments = ["HomeView"]
        app.launch()
    }
    
    func test_home_page() {
        let homeTitle = HomeViewPage(app: app).message
        XCTAssertTrue(homeTitle.waitForExistence(timeout: 5.0))
    }
    
}
