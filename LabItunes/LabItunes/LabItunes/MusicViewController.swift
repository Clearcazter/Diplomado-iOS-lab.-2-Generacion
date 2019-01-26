//
//  MusicViewController.swift
//  LabItunes
//
//  Created by Guerrero Azpitarte Adrian on 11/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    @IBOutlet weak var musicTableView: UITableView!
    
    var totalNumberOfSongs: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MusicViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalNumberOfSongs.count
        
        //Da el numero de celdas en la tabla
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)
        return cell
        //referencia la celda seleccionada
    }
    
    
    
    //TableView requiere 2  numberOfRowsInsection y cellForRowAt
}



/*
 
 Utilizamos extension para separar del controplar y poder crear objetos que controlen los objetos del controlador.
 */
