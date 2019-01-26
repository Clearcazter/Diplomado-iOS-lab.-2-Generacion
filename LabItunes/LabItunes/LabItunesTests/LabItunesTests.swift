//
//  LabItunesTests.swift
//  LabItunesTests
//
//  Created by Guerrero Azpitarte Adrian on 11/9/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import XCTest
@testable import LabItunes

class LabItunesTests: XCTestCase {

    override func setUp() {
        let session = Session.sharedInstance
        session.token = nil // Sirve para limpiar las bases de datos variables etc. Es muy buena practica
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCorrectLogin() {
        XCTAssertTrue(User.login(userName: "iOSLab", password: "verysecurepassworddffgdf")) //ESPERA una funcion que devuelva un true
    }
    func testWrongLogin() {
        XCTAssertFalse(User.login(userName: "Adrian", password: "verysecurepassworddffgdf")) //ESPERA una funcion que devuelva un true
    }
        
        func testSaveSession() {
            let session = Session.sharedInstance
            let _ = User.login(userName: "iOSLab", password: "223")
            XCTAssertNotNil(session.token)
            //PRUEBA PARA VERIFICAR QUE NO ESTE NULO lo que estamos probando
        }
        
        func testWrongLoginSuccesToken() {
            let session = Session.sharedInstance
            let _ = User.login(userName: "adrian", password: "223")
            XCTAssertNil(session.token)
            //PRUEBA PARA VERIFICAR QUE NO ESTE NULO lo que estamos probando. Pero falla por que gracias al single tone no se puede. Se tiene que correr individualmente Token ya tiene un valor.
        }
    
    func testExpectedToken() {
        let _ = User.login(userName: "iOSLab", password: "223")
        let session = Session.sharedInstance
        XCTAssertEqual(session.token!, "12345","Token sould Match")
        //Prueba para verificar que el token sea el mismo
    }
    
    
    //Funcion para validar una funcion que lance una exepcion
    func testThrowExeption() {
        XCTAssertThrowsError(try User.fetchSong)
        //Try sobre toda la funcion
    }
    
    //PROBAR EL NOTEQUAL
//    func testExpectedTokenNotEqual() {
//        let _ = User.login(userName: "iOSLab", password: "223")
//        let session = Session.sharedInstance
//        XCTAssertNotEqual(session.token!, "12345","Token sould Match")
//        //Prueba para verificar que el token sea el mismo
//    }
    

    //
    
    func testMusicSongs() {
        var resultSong: [Song] = []
        let promise = expectation(description: "Song Donwloaded")
        Music.fetchSongs { (songs) in
            resultSong = songs
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotEqual(resultSong.count, 0)
    }
}



/*
Todos los framework de pruebas ofrecen pruebas al inicio del codigo y cuando termina el codigo.
 
 setUp es cuando empieza --> logins,
 tearDown Cuando finaliza
 
 
 Una vez que creamos una funcion con la palabra test, se crea un rombo
 con ayuda de los ASSERT, validamos el resultado
 
 
 Se recomienda crear una funcion y probarla, ir creando e ir probando
 
 Las pruebas se pueden correr desde consola. Para cuando se vaya trabajando, ir probando.
*/
