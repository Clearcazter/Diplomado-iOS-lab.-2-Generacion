//
//  CommomCryptoDigestsTests.swift
//  CommomCryptoDigestsTests
//
//  Created by Guerrero Azpitarte Adrian on 06/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import XCTest
@testable import CommomCryptoDigests

class CommomCryptoDigestsTests: XCTestCase {
    
    let lipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vulputate dapibus iaculis. Donec id mi accumsan leo rhoncus dapibus. Phasellus tincidunt purus mi, non vulputate risus euismod non. Integer tempus commodo metus, eu sagittis justo aliquet vitae. Cras vel turpis a sapien cursus porta nec et dui. Quisque a ultricies nunc. Morbi sed metus quis libero cursus porttitor sit amet eleifend eros"
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testSha1(){
      let result =  Digests.sha1(String: lipsum)
        XCTAssertEqual("79546509ca6e37fe7a606465e39c632caccab405", result)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
