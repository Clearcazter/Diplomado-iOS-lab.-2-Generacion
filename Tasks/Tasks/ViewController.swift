//
//  ViewController.swift
//  Tasks
//
//  Created by Guerrero Azpitarte Adrian on 1/25/19.
//  Copyright © 2019 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var Tasks: [NSManagedObject] = []//Deja de ser array de strings sino de NSManageObject
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "The List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        
        //pedimos el pizzaron magico Pasamos el contexto, pero hay que asegurar q sea valido
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //introducimos esto
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Task")
        do{
            Tasks = try managedContext.fetch(fetchRequest)
                    //sI puEDE obtener l ainformacion ya la estamos guardando aqui, Regresa un array
        }catch let error as NSError {
            print("Could not fetch. \(error)")
        }

    }
    
    

    @IBAction func addTaskName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Task", message: "Add a new Task", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in

            
            guard let textField = alert.textFields?.first, let nameToSave = textField.text else {
                return
            }
            self.save(name: nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        //Pizarron magico
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        //le estamos pasando el nombre de la tabla. Traeme esa tabla para yo poder trabajar en ella.  es nuestra entidad
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: manageContext)!
        
        //creamos nsmanageobjetc.
        let task = NSManagedObject(entity: entity, insertInto: manageContext)
        
        task.setValue(name, forKey: "name")
        do {
            try manageContext.save()//Le estamos diciendo a nuestro pizarron que guarde.
            Tasks.append(task)
        } catch let error as NSError {
            print("Cluld not save. \(error), \(error.userInfo)")
        }
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let NSObjetmanagementDetailVC = segue.destination as? taskDetailViewController
        let manageObject = sender as? NSManagedObject
        NSObjetmanagementDetailVC!.manageObject = manageObject
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = self.Tasks[indexPath.row]
        performSegue(withIdentifier: "detail", sender: task)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = Tasks[indexPath.row]
        
        cell.textLabel?.text = task.value(forKeyPath: "name") as? String
        //task[indexPath.row]
        return cell
    }
    

    
    
    
}

//No es necesario guardar los NSManagement object a memoria. Solo trabajar con ese objeto
