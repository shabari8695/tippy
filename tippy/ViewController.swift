//
//  ViewController.swift
//  tippy
//
//  Created by Shabari Girish Ganapathy on 12/16/18.
//  Copyright © 2018 Shabari Girish Ganapathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }
    
    @IBAction func tapFunction(_ sender: Any) {
        view.endEditing(true)
    }
    
    func calculateAmounts(){
        let tipArray = [0.12,0.15,0.20]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipArray[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%0.2f",tip)
        totalLabel.text = String(format: "$%0.2f",total)
    }
    
    @IBAction func editChange(_ sender: Any) {
        self.calculateAmounts()
    }
    
    @IBAction func tipChange(_ sender: Any) {
        self.calculateAmounts()
    }
}

