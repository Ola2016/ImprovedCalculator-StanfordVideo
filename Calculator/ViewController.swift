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
    
    var inputA:Double = 0
    var inputB:Double = 0
    var firstNumber:Bool = false
    var isInputA:Bool = true
    var operation:String = "";
    
    @IBAction func disPlayValue(sender: UIButton) {
        
        let getValueFromKeyBoard = sender.currentTitle!
        
        if(firstNumber){
          displayValue.text = displayValue.text! + getValueFromKeyBoard
            print("\(displayValue.text)")
        }
        else{
            displayValue.text = getValueFromKeyBoard
            firstNumber = true
            if(getValueFromKeyBoard == "0"){
                firstNumber = false
            }
        }
        
        if isInputA{
            inputA = NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue
        }
        else{
            inputB = NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue
        }
    }
    
    
    @IBAction func ResetDisplayValue(sender: UIButton) {
        displayValue.text = "\(0)"
        inputA = 0
        inputB = 0
        isInputA = true
        firstNumber = false
        operation = ""
    }
    
    @IBAction func operate(sender: UIButton) {
        operation = sender.currentTitle!
        isInputA = false
        firstNumber = false
    }
    
    @IBAction func EqualButton(sender: UIButton) {
        firstNumber = false
            switch operation{
            case"+":displayValue.text = "\(inputA + inputB)"
            case"−": displayValue.text = "\(inputA - inputB)"
            case"×": displayValue.text = "\(inputA * inputB)"
            case"÷": displayValue.text = "\(inputA / inputB)"
                
            default: break
            }
        inputA = NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue

    }
}

