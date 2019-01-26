//
//  User.swift
//  LabItunes
//
//  Created by Guerrero Azpitarte Adrian on 11/9/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import Foundation


class User {
    static let userName = "iOSLab"
    static let password = "verysecurepassword"
    
    static let session = Session.sharedInstance
    
    
    static func login(userName: String, password: String) -> Bool {
        if self.userName == userName{
            session.saveSession()
            return true
        }
        return false
    }
    
    
    //Se requiere tener un token para poder pedir canciones
    static func fetchSong() throws {
        guard let token = Session.sharedInstance.token else {
            throw UserError.notSessionAvailable
        }
        debugPrint(token)
    }
    
    enum UserError: Error {
        case notSessionAvailable
    }
}
//Para el login usaremos un metodo de clase por que, no tenemos un objeto usuario si aun no tenemos un usuario loggeado
//Una carpeta esta pensanda para correr las pruebas unitarias -> Si aun no tenemos interfaz. ()
//Otra para las pruebas de interfaz
