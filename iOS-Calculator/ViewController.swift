//
//  ViewController.swift
//  iOS-Calculator
//
//  Created by Melih on 13.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var input: UILabel!
    
    var pressedNumber = ""
    var firstValue = ""
    var secondValue = ""
    var result = ""
    var operation: ButtonOperationType = .EMPTY
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.text = "0"
    }
    
    
    @IBAction func getValueFromButton(_ sender: UIButton) {
        pressedNumber += String(sender.tag)
        input.text = pressedNumber
    }
    
    @IBAction func addButton(_ sender: Any) {
        calculateWihtOperation(opr: .ADD)
    }
    
    @IBAction func minusButton(_ sender: Any) {
        calculateWihtOperation(opr: .MINUS)
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        calculateWihtOperation(opr: .MULTIPLY)
    }
    
    @IBAction func divideButton(_ sender: Any) {
        calculateWihtOperation(opr: .DIVIDE)
    }
    
    
    @IBAction func addDot(_ sender: Any) {
        pressedNumber += "."
        input.text = pressedNumber
    }
    
    @IBAction func equalButton(_ sender: Any) {
        calculateWihtOperation(opr: operation)
    }
    
    @IBAction func clearAllValue(_ sender: Any) {
        pressedNumber = ""
        firstValue = ""
        secondValue = ""
        result = ""
        operation = .EMPTY
        input.text = "0"
    }
    
    func calculateWihtOperation(opr: ButtonOperationType) {
        
        if (operation != .EMPTY) {
            
            if pressedNumber != "" {
                secondValue = pressedNumber
                pressedNumber = ""
                
                switch opr {
                case .ADD:
                    result =  String(Double(firstValue)! + Double(secondValue)!)
                case .MINUS:
                    result =  String(Double(firstValue)! - Double(secondValue)!)
                case .MULTIPLY:
                    result = String(Double(firstValue)! * Double(secondValue)!)
                case .DIVIDE:
                    result = String(Double(firstValue)! / Double(secondValue)!)
                default: result = "ERR"
                }
                
                firstValue = result
                
                if (result.contains(".0")){
                    result = "\(Int(Double(result)!))"
                }
                
                input.text = result
            }
            
            operation = opr
            
        } else {
            firstValue = pressedNumber
            pressedNumber = ""
            operation = opr
        }
    }
}

enum ButtonOperationType {
    case EMPTY
    case ADD
    case MINUS
    case MULTIPLY
    case DIVIDE
}

