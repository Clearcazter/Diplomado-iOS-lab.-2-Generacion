//
//  BunsanMembersUITests.swift
//  BunsanMembersUITests
//
//  Created by Misael Pérez Chamorro on 9/28/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import XCTest

class BunsanMembersUITests: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    XCUIApplication().launch()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testLoginExample() {
    let app = XCUIApplication()
    let nameTextField = app.textFields["usernametextfield"]
    nameTextField.tap()
    nameTextField.typeText("misaelpc")

    let passwordTextField = app.textFields["passwordtextfield"]
    passwordTextField.tap()
    passwordTextField.typeText("verySecurePassword")

    let logginButton = app.buttons["loginbutton"]
    logginButton.tap()
    XCTAssertTrue(app.isDisplayingMemberList)
  }

}

extension XCUIApplication {
  var isDisplayingMemberList: Bool {
    return otherElements["MemberListView"].exists
  }
}
