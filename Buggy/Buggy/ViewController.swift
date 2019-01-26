//
//  ViewController.swift
//  Buggy
//
//  Created by Guerrero Azpitarte Adrian on 12/15/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum IteratorError: Error {
        case notEnoughOddNumbers
        case notEnoughEvenNumbers
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Method: \(#function) in file :\(#file) line: \(#line) called.)")
        do{
            try iterateArray()
        } catch{}
        //badmethod()
   }
  

    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        //Go one step to far emptying the array (notice the range change)
        for _ in 0...10 {
            array.removeObject(at: 0)
        }
    }
    
    func iterateArray() throws {
        try [ 1, 2, 3, 4, 5, 6, 7,8 ].forEach({ (number) in
            
            if (number % 2 == 0) {
                throw IteratorError.notEnoughOddNumbers
            } else {
                throw IteratorError.notEnoughEvenNumbers
            }
        })
    }
}

