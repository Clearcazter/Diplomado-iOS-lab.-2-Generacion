//
//  PictureViewModel.swift
//  MemoryLeakDemo
//
//  Created by Chris Adamson on 7/16/17.
//  Copyright © 2017 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit

protocol PictureViewModelDelegate: class {// Definicion del protocolo
    func modelDidLoadPicture(_ model: PictureViewModel)
}

class PictureViewModel {
    
    private (set) var image: UIImage? // usamos la variable en la otra clase.
    //Set para que solo se pueda modificar por un metodo interno de la clase. ->
    private var imageData: Data?
    weak var delegate: PictureViewModelDelegate?
    
    func loadImage() {
        guard let imageURL = //aqui esta solamente la url
            Bundle.main.url(forResource: "bundle-image",
                            withExtension: "jpg") else { return }
        do {//Intentar hacer lo que esta aqui.
            let imageData = try Data(contentsOf: imageURL) //va a donde este y carga la imagen en memoria. Data. Esta leyendo el binario.
            if let image = UIImage(data: imageData) { // a PARTIR DEL DATO en crudo, creá la imagen
                self.imageData = imageData //guarda los datos en crudo y
                self.image = image //ademas guarda la imagen que se creo
                self.delegate?.modelDidLoadPicture(self)//Esta esperando el modelo. Es la forma de decir que ya termino
            }
        } catch {
            print ("couldn't load image data: \(error)")
        }
    }
}

