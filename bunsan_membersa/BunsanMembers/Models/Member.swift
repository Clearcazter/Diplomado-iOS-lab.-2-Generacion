//
//  Member.swift
//  BunsanMembers
//
//  Created by Misael Pérez Chamorro on 10/8/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import UIKit

class Member: NSObject {
  static let userName = "misaelpc"
  static let password = "verySecurePassword"
  static let session = Session.sharedInstance

  static func login(userName: String, password: String) -> Bool {
    if self.userName == userName {
      session.saveSession()
      return true
    }
    return false
  }
}
