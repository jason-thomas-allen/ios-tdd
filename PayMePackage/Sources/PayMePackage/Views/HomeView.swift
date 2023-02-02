//
//  HomeView.swift
//  MockingDemo
//
//  Created by Mohammad Azam on 10/11/21.
//

import SwiftUI

public struct HomeView: View {
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Hello World")
            .navigationTitle("Home")
            .accessibilityIdentifier("greetingTextField")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
