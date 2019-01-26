//
//  ViewController.swift
//  Photos2
//
//  Created by Guerrero Azpitarte Adrian on 05/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.isHidden = true
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 7
        
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addPhoto))
        rightButton.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func addPhoto() {
        let actionSheet = UIAlertController(title: "Photos", message: "Seleciona la fuente de tu foto", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        let imagePickerView = UIImagePickerController()

        actionSheet.addAction((UIAlertAction(title: "Camera", style: .default, handler: { (action ) in
            
            
            imagePickerView.sourceType = .camera
            imagePickerView.allowsEditing = true
            imagePickerView.delegate = self
            self.present(imagePickerView, animated: true, completion: nil)
            
        })))
        
        
        actionSheet.addAction(UIAlertAction(title: "Biblitoeca", style: .default, handler: { (action) in
            imagePickerView.sourceType = .photoLibrary
            imagePickerView.allowsEditing = true
            imagePickerView.delegate = self
            self.present(imagePickerView, animated: true, completion: nil)
        }))
        
        
        present(actionSheet, animated: true, completion: nil)
    }

        //MARK pICKERvIRE dELEGATE
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("El usuario cancelo la seleccion de fotos")
            picker.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("Photo dictionary \(info)")
        guard let image = info[UIImagePickerControllerEditedImage] as?
            UIImage else { return }
        imageView.image = image
        imageView.isHidden = false
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        addPhoto()
    }
    

}

