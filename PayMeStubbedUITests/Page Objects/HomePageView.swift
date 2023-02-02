//
//  HomeViewPage.swift
//  PayMeStubbedUITests
//
//  Created by Jason Allen on 29/1/2023.
//

import Foundation
import XCTest

class HomeViewPage {
    
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }

    var title: XCUIElement {
        app.staticTexts["Home"]
    }
    
    var message: XCUIElement {
        app.staticTexts["greetingTextField"]
    }
}
