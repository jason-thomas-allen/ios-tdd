//
//  PayMeStubbedTests.swift
//  PayMeStubbedTests
//
//  Created by Jason Allen on 29/1/2023.
//

import XCTest
import Mockingbird
@testable import PayMeLibrary

class given_login_view_model: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    var authService: AuthServiceMock!
    
    override func setUp() {
        authService = mock(AuthService.self)
        loginViewModel = LoginViewModel(service: authService)
    }
    
    func test_when_login_with_valid_credentials_then_authenticated() async {
        
        loginViewModel.username = "43906621"
        loginViewModel.password = "Password"
        
        await loginViewModel.login()
        
        XCTAssertEqual(loginViewModel.loginStatus, LoginStatus.authenticated)
    }
    
    func test_when_login_with_invalid_credentials_then_denied() async {
        
        let userName = "43906621"
        let password = "WrongPassword"
        loginViewModel.username = userName
        loginViewModel.password = password
        
        givenSwift(await authService.loginAsync(username: userName, password: password)).will { _,_ in throw AuthError.notAuthenticated }
        
        await loginViewModel.login()
        
        XCTAssertEqual(loginViewModel.loginStatus, LoginStatus.denied)
    }
    
    func test_when_login_with_no_credentials_then_validation_failed() async {
        
        loginViewModel.username = ""
        loginViewModel.password = ""
        
        await loginViewModel.login()
        
        XCTAssertEqual(loginViewModel.loginStatus, LoginStatus.validationFailed)
        
    }
}
