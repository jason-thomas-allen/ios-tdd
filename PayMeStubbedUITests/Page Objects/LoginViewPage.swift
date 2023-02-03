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
    
    private var usernameTextField: XCUIElement {
        app.textFields["usernameTextField"]
    }
    
    var userName: String {
        set(userName) {
            usernameTextField.tap()
            usernameTextField.typeText(userName)
        }
        get {
            return usernameTextField.value as! String
        }
    }
        
    private var passwordTextField: XCUIElement {
        app.textFields["passwordTextField"]
    }
    
    var password: String {
        set(password) {
            passwordTextField.tap()
            passwordTextField.typeText(password)
        }
        get {
            return passwordTextField.value as! String
        }
    }
    
    func login() {
        app.buttons["loginButton"].tap()
    }

    var message: String {
        app.staticTexts["messageText"].label
    }
    
}
