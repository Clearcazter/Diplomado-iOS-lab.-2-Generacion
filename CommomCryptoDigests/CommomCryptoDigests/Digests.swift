//
//  Digests.swift
//  CommomCryptoDigests
//
//  Created by Guerrero Azpitarte Adrian on 06/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import Foundation


class Digests {
    func sha1(string: String) -> String {
        let data = string.data(using: .utf8)!
        let digest = sha1(data: data)
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
    class func sha1(data: Data) -> String {
        return sha1(data: data).map { String(format: "%02", <#T##arguments: CVarArg...##CVarArg#>)}
    }
    
    
    func sha1(data: Data) -> [UInt8] {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH)) // necesitmos obj-c para esta libreria
        data.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(data.count), &digest)
        }
        return digest
    }
    
    class func base64(string: String) -> String {
        return String(data: Data(string.utf8).base64EncodedData(), encoding: .utf8) ?? ""
    }
    
    func base64(image: UIImage) -> String {
        return base64(data: image.pngData())
    }
    
    
    
}
