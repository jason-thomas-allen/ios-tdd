//
//  LoginViewModel.swift
//  MockingDemo
//
//  Created by Mohammad Azam on 10/11/21.
//

import Foundation

enum LoginStatus {
    case none
    case authenticated
    case denied
    case validationFailed
    case unexpectedError
}

public class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginStatus: LoginStatus = .none
    
    private var service: AuthService

    public init(service: AuthService) {
        self.service = service
    }
    

    func login() async {

        if username.isEmpty || password.isEmpty {
            self.loginStatus = .validationFailed
            return
        }
        
        do {
            try await service.loginAsync(username: username, password: password)
            self.loginStatus = .authenticated
        } catch {
            self.loginStatus = .denied
        }
    }
}
