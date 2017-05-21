//
//  ViewController.swift
//  TableView3
//
//  Created by Alisher Abdukarimov on 5/20/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var fruits = ["Apple", "Oranbe", "Grape", "Watermelon", "Lemon", "Kiwi"] {
        didSet {
            tableView1.reloadData()
        }
    }
    var vegetables = ["Potatoe", "Lettuce", "Onion", "Tomatoe", "Carrot", "Spinach"] {
        didSet {
            tableView2.reloadData()
        }
    }
    
    @IBOutlet var tableView1: UITableView!
    @IBOutlet var tableView2: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return fruits.count
        }else if tableView.tag == 2 {
            return vegetables.count
        }else {
            return vegetables.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if tableView.tag == 1 {
            cell.textLabel?.text = fruits[indexPath.row]
        }
        if tableView.tag == 2 {
            cell.textLabel?.text = vegetables[indexPath.row]
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.tag == 1 {
            vegetables.append(fruits[indexPath.row])
            fruits.remove(at: indexPath.row)
        }else if tableView.tag == 2{
            fruits.append(vegetables[indexPath.row])
            vegetables.remove(at: indexPath.row)
        }
        
        tableView.reloadData()
        
    }
    
    
}

