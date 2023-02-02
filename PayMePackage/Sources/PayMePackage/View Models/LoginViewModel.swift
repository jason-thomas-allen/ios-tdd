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
}

protocol VM {
    func login()
}

public class LoginViewModel: ObservableObject, VM {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginStatus: LoginStatus = .none
    
    private var service: AuthService
    
    public init(service: AuthService) {
        self.service = service
    }
    
    func login() {
        
        if username.isEmpty || password.isEmpty {
            self.loginStatus = .validationFailed
            return
        }
        
        service.login(username: username, password: password) { result in
            switch result {
                case .success():
                        DispatchQueue.main.async {
                            self.loginStatus = .authenticated
                        }
                case .failure(_):
                    DispatchQueue.main.async {
                        self.loginStatus = .denied
                    }
            }
        }
    }
    
}
