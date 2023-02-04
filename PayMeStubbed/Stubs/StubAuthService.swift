//
//  StubAuthService.swift
//  MockingDemoUITests
//
//  Created by Jason Allen on 25/1/2023.
//

import Foundation
import PayMeFramework

class StubAuthService: AuthService {
    func loginAsync(username: String, password: String) async throws {
        if username == "43906621" && password == "Password" {
        } else {
            throw(AuthError.notAuthenticated)
        }
    }
}
