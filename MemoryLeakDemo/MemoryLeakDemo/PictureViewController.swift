//
//  ViewController.swift
//  MemoryLeakDemo
//
//  Created by Chris Adamson on 7/16/17.
//  Copyright © 2017 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var model: PictureViewModel?

    override func viewDidLoad() { // Certeza de que la vista ya se creo de la forma en que sea
        super.viewDidLoad()
        model = PictureViewModel() // Se crea una instancia de pictureView model y se la estamos asignando a la var model.
        model?.delegate = self // El delegado del modelo soy yo (PICTURE VIEWCONTROLLER) con self.
        model?.loadImage() //Le decimos al modelo que cargue la imagen todo esto se ejecuta despues de que se cargo la vista.
    }
}

extension PictureViewController: PictureViewModelDelegate { // Conformar el protocolo -> Implementar los metodos definidos en (PictureViewDelegate) Esta función existe o esta definida en el protoclo
    //Ponemos aqui la extensión del protocolo ¿Por qué?
    //Basicamente para agrupar, cosas de la clase diferente de la extensión.  Para identificar que metodos son de que protocolo.
    func modelDidLoadPicture(_ model: PictureViewModel) {//Funcion que recibe una instancia
        print ("modelDidLoadPicture")
        imageView.image = model.image//al MODELO QUE ME PASARON. Le pido que me devuelva una imagne y se la pasamos al imageView
    }
    
}


//Se supone que cuando voy a una vista. se carga algo. Pero si regresa, tiene que eliminar lo que cargo. con un pop.
