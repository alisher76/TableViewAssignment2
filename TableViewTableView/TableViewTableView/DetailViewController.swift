//
//  DetailViewController.swift
//  TableViewTableView
//
//  Created by Alisher Abdukarimov on 5/20/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var character: Character!
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var superPowerTextField: UITextField!
    
    @IBOutlet var professionTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        showData()
    }
    
    
    
    func showData() {
        nameTextField.text = character.name
        superPowerTextField.text = character.superPower
        professionTextField.text = character.profession
        ageTextField.text = "\(character.age)"
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if nameTextField.text?.isEmpty == true {
            nameTextField.placeholder = "Please enter something!"
        }else{
            character.name = nameTextField.text!
        }
        
        if superPowerTextField.text?.isEmpty == true {
            superPowerTextField.placeholder = "Please enter something!"
        }else{
            character.superPower = superPowerTextField.text!
        }
        if professionTextField.text?.isEmpty == true {
            professionTextField.placeholder = "Please enter something!"
        }else{
            character.profession = professionTextField.text!
        }
        
        if ageTextField.text?.isEmpty == true {
            ageTextField.placeholder = "Please enter something!"
        }else{
            character.age = Int(ageTextField.text!)!
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
