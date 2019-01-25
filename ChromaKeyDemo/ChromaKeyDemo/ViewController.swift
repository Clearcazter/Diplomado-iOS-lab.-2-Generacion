//
//  ViewController.swift
//  ChromaKeyDemo
//
//  Created by Chris Adamson on 7/22/17.
//  Copyright © 2017 Subsequently & Furthermore, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var originalImageView: UIImageView! // referencias a imageview
    @IBOutlet var keyedImageView: UIImageView! // referencia a imageview
    var originalImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalImage = UIImage(named:"tsf-pure-green") //carga del asset
        originalImageView.image = originalImage
        let inTime = NSDate()  // timmer para poder tomar el tiempo que demora
        let keyedImage = applyChromaKey(sourceImage: originalImage)
        let elapsed = inTime.timeIntervalSinceNow * -1 // Lo multiplica por -1
        print ("apply chromaKey took \(elapsed) seconds")
        keyedImageView.image = keyedImage
    }

    func applyChromaKey(sourceImage: UIImage) -> UIImage? {
        guard let sourceCGImage = sourceImage.cgImage, 
            let colorSpace = sourceCGImage.colorSpace,
            let provider = sourceCGImage.dataProvider,
            let pixelData = provider.data as Data? else { return nil } 
        
        var chromaKeyData = Data(count: pixelData.count) 
        for pixelIndex in 0..<pixelData.count/4 {
            let pixelOffset = pixelIndex * 4
            let blue = pixelData[pixelOffset]
            let green = pixelData[pixelOffset + 1]
            let red = pixelData[pixelOffset + 2]
            let isChroma = isColorChroma(red: red, green: green, blue: blue)
            
            chromaKeyData[pixelOffset] = blue
            chromaKeyData[pixelOffset + 1] = green
            chromaKeyData[pixelOffset + 2] = red
            chromaKeyData[pixelOffset + 3] = isChroma ? 0 : 255
            
            print ("pixel \(pixelIndex) isChroma: \(isChroma)")
            
            //Ajuste del alpha, barrer los pixeles
        } 
        
        let bitmapInfo = CGBitmapInfo(rawValue: 
            sourceCGImage.bitmapInfo.rawValue |
            CGImageAlphaInfo.last.rawValue)
        let chromaKeyCFData = chromaKeyData as CFData
        guard let chromaKeyDataProvider =
            CGDataProvider(data: chromaKeyCFData),
            let chromaKeyCGImage =
            CGImage(width: sourceCGImage.width,
                    height: sourceCGImage.height,
                    bitsPerComponent: sourceCGImage.bitsPerComponent,
                    bitsPerPixel: sourceCGImage.bitsPerPixel,
                    bytesPerRow: sourceCGImage.bytesPerRow,
                    space: colorSpace,
                    bitmapInfo: bitmapInfo,
                    provider: chromaKeyDataProvider,
                    decode: nil,
                    shouldInterpolate: false,
                    intent: CGColorRenderingIntent.defaultIntent)
            else { return nil } 
        
        let chromaKeyImage = UIImage(cgImage: chromaKeyCGImage)
        return chromaKeyImage
    }
    
    private func isColorChroma(red: UInt8, green: UInt8, blue: UInt8)
        -> Bool {
        return green == 255 && red == 0 && blue == 0
    }
    
}

//fileprivate func applyChromaKeyWithCoreImage (sourceImage: UIImage)
//    -> UIImage? {
//    guard let sourceCGImage = sourceImage.cgImage else { return nil }
//
//    let cubeSize = 64
//    let cubeSizeDivisor = Float(cubeSize - 1)
//    var cubeDataArray : [Float] =
//        [Float](repeating: 0,
//                count: cubeSize * cubeSize * cubeSize * 4)
//    for blueIndex in 0..<cubeSize {
//        for greenIndex in 0..<cubeSize {
//            for redIndex in 0..<cubeSize {
//                let index = 4 * ((blueIndex * cubeSize * cubeSize) +
//                    (greenIndex * cubeSize) + redIndex)
//                let alpha : Float =
//                    greenIndex == (cubeSize - 1) &&
//                        redIndex == 0 &&
//                        blueIndex == 0
//                        ? 0.0 : 1.0
//                cubeDataArray[index] = Float(redIndex) /
//                    cubeSizeDivisor * alpha
//                cubeDataArray[index + 1] = Float(greenIndex) /
//                    cubeSizeDivisor * alpha
//                cubeDataArray[index + 2] = Float(blueIndex) /
//                    cubeSizeDivisor * alpha
//                cubeDataArray[index + 3] = alpha
//            }
//        }
//    }
//
//    let sourceCIImage = CIImage(cgImage: sourceCGImage)
//    let cubeData = NSData(bytes: cubeDataArray,
//                          length: cubeDataArray.count *
//                            MemoryLayout<Float>.size)
//    let cubeFilterParams : [String : Any] = [
//        "inputCubeDimension" : cubeSize,
//        "inputCubeData" : cubeData
//    ]
//    let chromaCIImage = sourceCIImage.applyingFilter("CIColorCube",
//                            parameters: cubeFilterParams)
//    let chromaUICIImage = UIImage(ciImage: chromaCIImage)
//
//    UIGraphicsBeginImageContext(chromaUICIImage.size)
//    chromaUICIImage.draw(in: CGRect(origin: CGPoint.zero,
//                                    size: chromaUICIImage.size))
//    let chromaUIImage = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//    return chromaUIImage
//}
//
