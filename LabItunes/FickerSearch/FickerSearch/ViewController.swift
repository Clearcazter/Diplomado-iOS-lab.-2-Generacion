//
//  ViewController.swift
//  FickerSearch
//
//  Created by Guerrero Azpitarte Adrian on 11/16/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let reuseIdentifier = "FlickrCell"
    let itemsPerRow: CGFloat = 3
    
    //margenes que ocupa el protocolo
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    //traer estructuras para los resultados
    var searches = [FlickrSearchResults]()
    let flickr = Flickr()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}
//extension para pedir la foto, sin necesidad de andar escribiendo los protocolos
extension ViewController {
    func photoFoRIndexPath(_ indexPath: IndexPath) -> FlickrPhoto {
        return searches[(indexPath as
        NSIndexPath).section].searchResults[(indexPath as
        NSIndexPath).row]
    }
}

