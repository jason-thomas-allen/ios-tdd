//
//  ContentView.swift
//  PayMeStubbedUITests
//
//  Created by Jason Allen on 30/1/2023.
//

import SwiftUI
import PayMePackage

struct ContentView: View {
    
    private var home: Bool
    
    public init(home: Bool) {
        self.home = home
    }
    
    var body: some View {
        if !home {
            LoginView()
        } else {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(home: true).environmentObject(LoginViewModel(service: StubAuthService()))
    }
}
