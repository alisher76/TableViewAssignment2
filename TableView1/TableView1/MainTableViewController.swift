//
//  MainTableViewController.swift
//  TableView1
//
//  Created by Alisher Abdukarimov on 5/21/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var data = [(name: "Apple", price: 5), (name: "Banana", price: 2), (name: "Grape", price: 3), (name: "Orange", price: 6), (name: "Napkin", price: 1),(name: "Cucumber", price: 10),(name: "Rice", price: 2)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row].name
        cell.detailTextLabel?.text = "$\(data[indexPath.row].price)"
        
        return cell
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        
        
        OperationQueue.main.addOperation {
            
            let newButton: UIBarButtonItem
            if self.tableView.isEditing {
                newButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(MainTableViewController.editButtonTapped(_:)))
                self.tableView.setEditing(false, animated: true)
            } else {
                newButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(MainTableViewController.editButtonTapped(_:)))
                self.tableView.isEditing = true
            }
            self.navigationItem.leftBarButtonItem = newButton
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movingObjects = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(movingObjects, at: destinationIndexPath.row)
        print(data)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .insert, .none:
            break
        }
    }
}
