//
//  ViewController.swift
//  BMI Finder
//
//  Created by Tejvir  Dhami on 2021-09-03.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtWeight: UITextField!
    
    
    @IBOutlet var txtHeight: UITextField!
    @IBOutlet var txtBMI: UITextField!
    
    @IBOutlet var lblResult: UILabel!
    @IBAction func btnCalculate(_ sender: Any) {
        
        if !txtWeight.hasText || !txtHeight.hasText {
            Toast.ok(view: self, title: "Information", message: "Please enter your height and weight!", handler: nil)
            return;
        }
        
        let stringWeight = txtWeight.text!
        let weight = Float(stringWeight)
        
        let stringHeight = txtHeight.text!
        let height = Float(stringHeight)
        
        if Int(height!) > 400 || Int(weight!) > 200 {
            Toast.ok(view: self, title: "Information", message: "Please enter valid height and weight!", handler: nil)
            return;
        }
        
        

        
        var bmi: Float = 0
        
        var classi = ""
        
        bmi = Float(weight! / pow(height! , 2)) * 100 * 100
        
        bmi = round(bmi * 100) / 100
        
        switch bmi{
        case 0..<18.5:
        classi = "Underweight"
        case 18.5..<24.9:
        classi = "Normal weight"
        case 25.0..<29.9:
        classi = "Overweight"
        case 30..<100.0:
        classi = "Obesity"
        default:
        classi = "None"
        }
        lblResult.isHidden = false
        lblResult.text = "Classification: \(classi)"
        
    }
    func textFieldShouldReturn( _ textField: UITextField) ->Bool {
        txtHeight.resignFirstResponder()
        txtWeight.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         txtHeight.delegate = self
         txtWeight.delegate = self
        lblResult.isHidden = true
     }


}

