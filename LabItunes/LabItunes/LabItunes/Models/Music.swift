//
//  Music.swift
//  LabItunes
//
//  Created by Guerrero Azpitarte Adrian on 11/9/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import Foundation


class Music {
    static var urlSession = URLSession(configuration: .default)
    
    static func fetchSongs(songName: String = "TheBeatles", onSuccess: @escaping ([Song])-> Void) {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=\(songName)")
        
        let dataTask = urlSession.dataTask(with: url!) { data, response, error
            in
            if error == nil {
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {return}
                if statusCode == 200 {
                    guard let json = parseData(data: data!) else {return}
                    let songs = songsFrom(json: json)
                    onSuccess(songs)
                }
            }
        }
        dataTask.resume()
    }
    
    static func songsFrom(json: NSDictionary) -> [Song] {
        let results = json["results"] as! [NSDictionary]
        var songs: [Song] = []
        
        for dataResult in results {
            let song = Song.create(dict: dataResult)
            songs.append(song!)
        }
        return songs
    }
    static func parseData(data: Data) -> NSDictionary? {
        let json = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary
        return json
    }
    
    
}


//@escaping Se refiere a en que momento se va a llamar a ese closure.
//Scapiong se ejecuta despues de que termina el codigo de nuestra funcion <<<<<<<<<<------------------------
//Estudiar URLSession para traer las canciones



//Selecionamos el proyecto, -> Edit Scheme -> Test -> Option -> gather coverage for all  Y podemos ver el porcentaje de pruebas corridas
