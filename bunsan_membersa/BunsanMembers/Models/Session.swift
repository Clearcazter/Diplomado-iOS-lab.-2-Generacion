//
//  Session.swift
//  BunsanMembers
//
//  Created by Misael Pérez Chamorro on 10/8/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import UIKit

class Session: NSObject {
  var token: String?
  static let sharedInstance = Session()

  override private init() {
    super.init()
  }

  func saveSession() {
    token = "1234567890"
  }
}
