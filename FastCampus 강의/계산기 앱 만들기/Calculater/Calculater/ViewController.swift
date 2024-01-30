//
//  ViewController.swift
//  Calculater
//
//  Created by ryu hyunsun on 2022/06/29.
//

import UIKit

enum Operation {
    case add
    case subtract
    case divide
    case multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tabNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else {return}
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
        
    }
    @IBAction func tabClearButton(_ sender: Any) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tabDotButton(_ sender: Any) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayNumber
        }
        
        
    }
    @IBAction func tabDivideButton(_ sender: Any) {
        self.operation(.divide)
    }
    
    @IBAction func tabMultiplyButton(_ sender: Any) {
        self.operation(.multiply)
    }
    
    @IBAction func tabSubtractButton(_ sender: Any) {
        self.operation(.subtract)
    }
    
    @IBAction func tabAddButton(_ sender: Any) {
        self.operation(.add)
    }
    
    @IBAction func tabEqualButton(_ sender: Any) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOperand = Double(self.secondOperand) else {return}
                
                switch self.currentOperation {
                case .add:
                    self.result = "\(firstOperand + secondOperand)"
                case .subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .multiply:
                    self.result = "\(firstOperand * secondOperand)"
                default:
                    break
                }
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {self.result = "\(Int(result))"}
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
    
}

