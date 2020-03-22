//
//  ViewController.swift
//  Tipsy
//
//  Created by Muneeb ur rehman on 22/03/2020.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPct:Float=0.0
    var noOfPeople=0.0

    var splittedBill:Float?=0.0
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        let buttonLabel=sender.titleLabel?.text!
        
        if buttonLabel=="0%"{
            zeroPctButton.isSelected=true
            tenPctButton.isSelected=false
            twentyPctButton.isSelected=false
            tipPct=0.0
        }else if buttonLabel=="10%"{
            zeroPctButton.isSelected=false
            tenPctButton.isSelected=true
            twentyPctButton.isSelected=false
            tipPct=0.1
        }else{
            zeroPctButton.isSelected=false
            tenPctButton.isSelected=false
            twentyPctButton.isSelected=true
            tipPct=0.2
        }
        
        
    }
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text=="" {
            let alert = UIAlertController(title: "You have not entered any Bill yet", message: "Please Enter an ammount to continue", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            

            self.present(alert, animated: true)
        }else{
           
            var bill=Float(billTextField.text!)!
            bill=bill+(bill*tipPct)
            splittedBill=bill/Float(noOfPeople)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if(segue.identifier=="goToResult"){
            let destination=segue.destination as! ResultsViewController
            
            destination.billSplitted=String(format:"%.2f",splittedBill!)
            destination.tip=String(format:"%.0f",tipPct)
            destination.noOfPeople=String(Int(noOfPeople))
            
        }
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        noOfPeople=sender.value
        splitNumberLabel.text=String(Int(noOfPeople))
    }
    
    
    
}

