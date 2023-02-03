//
//  WebAuthService.swift
//  PayMeLibrary
//
//  Created by Jason Allen on 3/2/2023.
//

import Foundation

public class WebAuthService: AuthService {
    
    public init() {}
    
    public func loginAsync(username: String, password: String) async throws -> Void {
        
        let url = URL(string: "https://mango-persistent-organ.glitch.me/login")!
        
        let body = ["username": username, "password": password]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw AuthError.badRequest
        }
        
        guard let auth = try? JSONDecoder().decode(AuthResponse.self, from: data) else {
            throw AuthError.decodingError
        }
    
        if !auth.success {
            throw AuthError.notAuthenticated
        }
    }
}
