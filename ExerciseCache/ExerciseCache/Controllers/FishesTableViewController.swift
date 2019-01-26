//
//  FishesTableViewController.swift
//  ExerciseCache
//
//  Created by Guerrero Azpitarte Adrian on 06/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import Foundation


class FishesTableViewController: UITableViewController {
    var fishes: [Fish]? {
        didSet {
            self.tableView.reloadData()
        }
    }
}
