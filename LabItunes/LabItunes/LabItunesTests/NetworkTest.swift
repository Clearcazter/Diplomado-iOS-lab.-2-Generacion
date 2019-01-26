//
//  NetworkTest.swift
//  LabItunesTests
//
//  Created by Guerrero Azpitarte Adrian on 11/9/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import XCTest

@testable import LabItunes

class NetworkTest: XCTestCase {
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        sessionUnderTest = URLSession(configuration: .default)
    }
   
    
    //Promise and expectation
    func testValidCallToItunes () {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
        var statusCode: Int?
        var responseError: Error?
        
        let promise = expectation(description: "Handler Invoked")
        
        //Asincronamente hasta que responsa iTunes
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            statusCode = ( response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()//El promise asegura que aunque sea Asincrono. EsPERA A QUE temrine el closure
            // promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)// termina de cumplir todas las priomise declaras dentro de la prueba
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testSlowValidCallToItunes () {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
        
        let promise = expectation(description: "Status code 200")
        
        let dataTask = sessionUnderTest.dataTask(with: url!) {data, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status Code:\(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        }
    
    
    
    
}
/*
 Traten de evitar pods, por diferencia entre versiones cocoapods
 
 Se recomeiunda carthage
 */
