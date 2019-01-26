//
//  myApplication.swift
//  mainProject
//
//  Created by Guerrero Azpitarte Adrian on 1/11/19.
//  Copyright © 2019 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit


class myApplication: UIApplication {
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        print("Event sent: \(event)");
    }
}

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(myApplication.self), NSStringFromClass(AppDelegate.self))

