//
//  StubAuthService.swift
//  MockingDemoUITests
//
//  Created by Jason Allen on 25/1/2023.
//

import Foundation
import PayMePackage

class StubAuthService: AuthService {
    
    func login(username: String, password: String, completion: @escaping (Result<Void, AuthError>) -> Void) {
        if username == "JohnDoe" && password == "Password!" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
}
