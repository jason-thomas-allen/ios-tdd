//
//  ContentView.swift
//  MockingDemo
//
//  Created by Mohammad Azam on 10/11/21.
//

import SwiftUI

public struct LoginView: View {
    
    @EnvironmentObject private var loginVM: LoginViewModel
    //@State private var message: String = ""
    
    public init() {}
    
    var errorMessage: String {
        switch loginVM.loginStatus {
            case .denied:
                return "Invalid credentials"
            case .validationFailed:
                return "Required fields are missing"
            default:
                return ""
        }
    }
    
    public var body: some View {
        
        let _ = Self._printChanges()
        
        NavigationView {
            
            VStack {
                Form {
                    TextField("User name", text: $loginVM.username)
                        .accessibilityIdentifier("usernameTextField")
                    
                    TextField("Password", text: $loginVM.password)
                        .accessibilityIdentifier("passwordTextField")
                    
                    HStack {
                        Spacer()
                        Button {
                            loginVM.login()
                        } label: {
                            Text("Login")
                                .accessibilityIdentifier("loginButton")
                        }
                        Spacer()
                    }
                    
                    Text(errorMessage)
                        .accessibilityIdentifier("messageText")
                }
                
                NavigationLink(isActive: .constant(loginVM.loginStatus == .authenticated)) {
                    HomeView()
                } label: {
                    EmptyView()
                }

                
            }
            .navigationTitle("Login")
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        //LoginView().environmentObject(LoginViewModel(service: Webservice()))
        LoginView()
    }
}
