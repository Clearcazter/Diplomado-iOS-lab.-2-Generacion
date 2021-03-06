/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import CoreData

class ViewController: UIViewController {
  //El controlador va a tener un contexto, pero no conoce de quien se lo va a asignar
  var managedContext: NSManagedObjectContext!

  // MARK: - IBOutlets
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var timesWornLabel: UILabel!
  @IBOutlet weak var lastWornLabel: UILabel!
  @IBOutlet weak var favoriteLabel: UILabel!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    inserSampleData()
    
    let request: NSFetchRequest<Bowtie> = Bowtie.fetchRequest()//esta info la trae el compilador ay 
    let firstTitle = segmentedControl.titleForSegment(at: 0)!//Eso no trae la letra R
    
    //Hy que agregarle un predicado al fetchRequest. Se pueden agregar varios.
    request.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(Bowtie.searchKey), firstTitle])
    //La sintaxis en la cual vamos a buscar.  el Key debe de ser igual al valor que debe de buscar en la base datos. Le estamos mandando 2 argumentoos al arreglo.
    //1 Nombre del Key
    //2Titulo
    do {
      //Traer datos a la base, pero como es peligroso, hay que meterlo en un try
      let result = try managedContext.fetch(request)
      print(result)
    } catch let error as NSError {
      print("Could not fetch \(error)")
    }// Aqui ya tenemos los resultados PERO AUN no los metemos en la interfaz
    
  }

  // MARK: - IBActions
  @IBAction func segmentedControl(_ sender: Any) {

  }

  @IBAction func wear(_ sender: Any) {

  }
  
  @IBAction func rate(_ sender: Any) {

  }
  
  func inserSampleData() {
    let fetch: NSFetchRequest <Bowtie> = Bowtie.fetchRequest()
    fetch.predicate = NSPredicate(format: "searchKey != nil")
    let count = try! managedContext.count(for: fetch)
    if count > 0 {
      //Sample data.plist data already in Core DATA
      return
      //no queremos q lo copie de nueva cuenta por eso el return    }
  }
    let path = Bundle.main.path(forResource: "SampleData", ofType: "plist")
    let dataArray = NSArray(contentsOfFile: path!)!
    for dic in dataArray {
      let entity = NSEntityDescription.entity(forEntityName: "Bowtie", in: managedContext)!
      let bowtie = Bowtie(entity: entity, insertInto: managedContext)
      
      let btDict = dic as! [String: Any]
      bowtie.id = UUID(uuidString: btDict["id"] as! String)
      bowtie.name = btDict["name"] as? String
      bowtie.searchKey = btDict["searchKey"] as? String
      bowtie.rating = btDict["rating"] as! Double
      
      let colorDict = btDict["tintColor"] as! [String: Any]
      bowtie.tintiColor = UIColor.color(dict: colorDict)
      
      let imageName = btDict["imageName"] as? String
      let image = UIImage(named: imageName!)
      let photoData = UIImagePNGRepresentation(image!)!
      bowtie.photoData = NSData(data: photoData)
      bowtie.lastWorn = btDict["lastWorn"] as? NSDate
      
      
      //para guardar cada
      let timesNumber = btDict["timesWorn"] as! NSNumber
      bowtie.timesWorn = timesNumber.int32Value
      bowtie.isFavorite = btDict["isFavorite"] as! Bool
      bowtie.url = URL(string: btDict["url"] as! String)
    }
    try! managedContext.save()
  }
  
}

extension UIColor {
  static func color(dict: [String: Any]) -> UIColor? {
    guard let red = dict["red"] as? NSNumber,
    let green = dict["gren"] as? NSNumber,
    let blue = dict["blue"] as? NSNumber else {
      return nil
    }
    return UIColor(red: CGFloat(truncating: red)/255.0, green: CGFloat(truncating: green)/255.0, blue: CGFloat(truncating: blue)/255.0, alpha: 1)
  }
}

//Esto es un ejemplo de como guardar propiedades de diferentes tipos de datos en CORE DATA.

//Falta extraerlas
