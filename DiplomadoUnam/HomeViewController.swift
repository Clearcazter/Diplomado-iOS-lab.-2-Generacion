//
//  HomeViewController.swift
//  DiplomadoUnam
//
//  Created by Guerrero Azpitarte Adrian on 12/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view.
        
        let customView = view as! HomeView
        customView.setFunnyColor()
        
       
        
        //self.view.addSubview(loginVC.view)
        
        
                    //para entender los metodos de navegacion. Y manejo de control y jerarquia de las vistas
        let looginView = Bundle.main.loadNibNamed("loginView", owner: nil, options: nil)! [0] as! loginView
        //
        self.view.addSubview(looginView)
        
        if User.hasSession {
            let musicSelectionVC = MusicSelectionViewController()
            self.navigationController?.pushViewController(musicSelectionVC, animated: true)
        }else {
            
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        let loginVC = LoginViewController()
        self.present(loginVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() { //se debe asignar al view la vista customizada
        let customView = HomeView()
        customView.setFunnyColor()
        
        view = customView
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
