//
//  File.swift
//  
//
//  Created by Jason Allen on 29/1/2023.
//

import Foundation

public enum AuthError: Error {
    case badRequest
    case decodingError
    case notAuthenticated
}

public protocol AuthService {
    func login(username: String, password: String, completion: @escaping (Result<Void, AuthError>) -> Void)
}
