//
//  ViewController.swift
//  Calculator
//
//  Created by Zhiyong Huang on 13/02/16.
//  Copyright © 2016 Zhiyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayValue: UILabel!
    
    var results:Double = 0
    var inputValue:Bool = false
    var operation:String = "0"
    
    @IBAction func disPlayValue(sender: UIButton) {
        
        let getValueFromKeyBoard = sender.currentTitle!
        
        if(inputValue){
          displayValue.text = displayValue.text! + getValueFromKeyBoard
        }
        else{
            displayValue.text = getValueFromKeyBoard
            inputValue = true
        }
    }
    
    
    @IBAction func ResetDisplayValue(sender: UIButton) {
        displayValue.text = "\(0)"
        results = 0
        inputValue = false
        operation = "0"
    }
    
    @IBAction func operate(sender: UIButton) {
        operation = sender.currentTitle!
        results = NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue
        inputValue = false
    }
    
    @IBAction func EqualButton(sender: UIButton) {
        inputValue = false
            switch operation{
            case"+":displayValue.text = "\(results + NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue)"
            case"−": displayValue.text = "\(results - NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue)"
            case"×": displayValue.text = "\(results * NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue)"
            case"÷": displayValue.text = "\(results / NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue)"
                
            default: break
            }

    }
}

