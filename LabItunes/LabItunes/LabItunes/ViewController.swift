//
//  ViewController.swift
//  LabItunes
//
//  Created by Guerrero Azpitarte Adrian on 11/9/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginButtonWasTouchUpInside(_ sender: UIButton) {
        
        let username = userTextField.text
        let password = passwordTextField.text
        
        if User.login(userName: username!, password: password!) {
            performSegue(withIdentifier: "loginSucess", sender: nil)
        }

    }


}

