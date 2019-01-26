//
//  FishesTableTableViewController.swift
//  ExerciseCache
//
//  Created by Guerrero Azpitarte Adrian on 06/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

class FishesTableTableViewController: UITableViewController {
    
    var fishes: [Fish]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    let cellId = "fishCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fishes"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFish(_:)))
        navigationItem.rightBarButtonItem = addButton
        tableView.register(UINib(nibName: "FishesTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        loadFishes()

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(74)
    }
    
    func loadFishes() {
        FishService.shared.all { [weak self] fishes in
            DispatchQueue.main.async {
                self?.fishes = fishes
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fishes?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FishesTableViewCell
        
        guard let fish = fishes?[indexPath.row] else { return cell }
        cell.titleFish.text = fish.name
        cell.descriptioFish.text = fish.webUrlString
        //cell.imageFish.kf.setImage(with: fish.imageURL!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard.init(name: "Detail", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "fishDetail")
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @objc func addFish(_ sender: Any) {
        present(CreateFishViewController(), animated: true, completion: nil)
    }
    
}
