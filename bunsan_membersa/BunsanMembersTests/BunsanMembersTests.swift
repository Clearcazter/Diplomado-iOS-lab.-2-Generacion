//
//  BunsanMembersTests.swift
//  BunsanMembersTests
//
//  Created by Misael Pérez Chamorro on 9/28/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import XCTest
@testable import BunsanMembers

class BunsanMembersTests: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  func testCorrectLogin() {
    XCTAssertTrue(Member.login(userName: "misaelpc", password: ""))
  }
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }

}
