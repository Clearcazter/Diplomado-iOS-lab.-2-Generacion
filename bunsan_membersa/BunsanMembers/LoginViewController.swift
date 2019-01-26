//
//  ViewController.swift
//  BunsanMembers
//
//  Created by Misael Pérez Chamorro on 9/28/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func loginButtonWasTouchedUpInside(sender: Any) {
    let username = nameTextField.text
    let password = passwordTextField.text
    if Member.login(userName: username!, password: password!) {
      performSegue(withIdentifier: "showMembersList", sender: self)
    }
  }
}
