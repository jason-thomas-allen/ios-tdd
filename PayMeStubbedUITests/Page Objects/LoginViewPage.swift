//
//  LoginViewPage.swift
//  PayMeStubbedUITests
//
//  Created by Jason Allen on 29/1/2023.
//

import Foundation
import XCTest

class LoginViewPage {
    
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var usernameTextField: XCUIElement {
        app.textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement {
        app.textFields["passwordTextField"]
    }
    
    var loginButton: XCUIElement {
        app.buttons["loginButton"]
    }

    var messageText: XCUIElement {
        app.staticTexts["messageText"]
    }
    
}
