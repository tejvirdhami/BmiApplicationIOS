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
    
    @IBAction func btnCalculate(_ sender: Any) {
        
        let stringWeight = txtWeight.text!
        let weight = Float(stringWeight)
        
        let stringHeight = txtHeight.text!
        let height = Float(stringHeight)
        
        var bmi: Float = 0
        
        var classi = ""
        
        bmi = Float(weight! / pow(height! , 2)) * 100 * 100
        
        bmi = round(bmi * 100) / 100
        
        let bmiString = String(bmi)
        
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
        
        Toast.ok(view: self, title: "BMI", message: "\(bmiString)\n Classification: \(classi)", handler: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtHeight.delegate = self
        txtWeight.delegate = self
    }
    
    func textFieldShouldReturn( _ textField: UITextField) ->Bool {
        txtHeight.resignFirstResponder()
        txtWeight.resignFirstResponder()
        return true
    }


}

