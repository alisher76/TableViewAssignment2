//
//  MainTableViewController.swift
//  TableViewTableView
//
//  Created by Alisher Abdukarimov on 5/20/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    
    var collection: [Character] = [Character(name: "Ali", age: 26, superPower: "ElectroMan", profession: "iOSDeveloper"),
    Character(name: "Tennant", age: 29, superPower: "Invisibility", profession: "iOSDeveloper"),
    Character(name: "Sara", age: 21, superPower: "Charm", profession: "AndroidDeveloper"),
    Character(name: "Glen", age: 39, superPower: "Flying", profession: "Server at Starbucks")]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()  
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return collection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = collection[indexPath.row].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            
            if let row = tableView.indexPathForSelectedRow?.row {
              let destination = segue.destination as! DetailViewController
                destination.character = self.collection[row]
            }
        }
    }
 

}
