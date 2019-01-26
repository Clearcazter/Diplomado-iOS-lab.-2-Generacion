//
//  settingViewController.swift
//  Worldb
//
//  Created by Guerrero Azpitarte Adrian on 29/09/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {
    
    
    @IBAction
    
    func changeTheme(_ sender: UISwitch) -> {
        UserDefaults.standard.set(sender.isOn, forKey: "dark")
        loadTheme()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
