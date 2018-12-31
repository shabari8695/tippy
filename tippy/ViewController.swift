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
    static var bill_amount = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.text = ViewController.bill_amount
        billField.becomeFirstResponder()
        if billField.text != ""{
            self.calculateAmounts()
        }
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
        if bill == 0.0{
            ViewController.bill_amount = ""
        }
        else{
            ViewController.bill_amount = String(bill)
        }
    }
    
    @IBAction func editChange(_ sender: Any) {
        self.calculateAmounts()
    }
    
    @IBAction func tipChange(_ sender: Any) {
        self.calculateAmounts()
    }

}

