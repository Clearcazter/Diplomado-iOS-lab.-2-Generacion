//
//  Session.swift
//  LabItunes
//
//  Created by Guerrero Azpitarte Adrian on 11/9/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import Foundation


class Session: NSObject {
    var token: String? // Se regresa despues de un login exitoso
    
//---------------------------------->>>> Single Tone
    
    static let sharedInstance = Session() //Solamente se puede asignar una vez el objeto. aqui se almacena el singletone
    
    override private init() { // y solo aqui se puede crear una vez y por ser let no es mutable
        super.init()
        //Se sobreescribe para que solo se pueda mandar a llamar desde aqui.
        //Asi ganrantizamos la existencia del singletone
        //Estamos evitando. Que no se pueda llamar el init. en otra clase que no sea Session
    }
    
    func saveSession() {
        token = "12345"
        //El token nos sirve si el login es correcto
//--------------------------------------->>>>>Termina Single Tone
    }
}



/*
 EL servicio generalmente regrsa un tokenpara validar el login
 
 Si la variable no es estatica swe necesita una estancia. Y esta estancia la vamos a utilizar si y solo si el login es valido
 
 Singletone: Solamente puede haber una instancia de este objeto
 */
