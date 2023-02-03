//
//  PayMeStubbedTests.swift
//  PayMeStubbedTests
//
//  Created by Jason Allen on 29/1/2023.
//

import XCTest
import Mockingbird
@testable import PayMeLibrary
@testable import PayMeStubbed

final class PayMeStubbedTests: XCTestCase {

    var mockService: AuthServiceMock!  // Build the test target (⇧⌘U) to generate this mock
      
    override func setUp() {
        mockService = mock(AuthService.self)
    }
    
    func testSayHi() {
        
    }
}
