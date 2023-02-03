//
//  PayMeStubbedApp.swift
//  PayMeStubbed
//
//  Created by Jason Allen on 29/1/2023.
//

import SwiftUI
import PayMeLibrary

@main
struct PayMeStubbedApp: App {
    
    @StateObject private var loginVM = LoginViewModel(service: StubAuthService())
    
    private var home: Bool
    
    init() {
        var arguments = ProcessInfo.processInfo.arguments
        arguments.removeFirst() // First argument is thec path
        switch arguments.first {
        case "HomeView":
            home = true
        default:
            home = false
        }
    }
    
    var body: some Scene {
    
        WindowGroup {
            ContentView(home: self.home).environmentObject(loginVM)
        }
    }
}
