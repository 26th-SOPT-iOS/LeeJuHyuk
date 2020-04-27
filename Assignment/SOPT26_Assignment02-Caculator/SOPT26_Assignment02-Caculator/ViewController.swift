//
//  ViewController.swift
//  SOPT26_Assignment02-Caculator
//
//  Created by 이주혁 on 2020/04/26.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultTextField: UITextField!
    @IBOutlet var allButton: [UIButton]!
    @IBOutlet var operatorButton: [UIButton]!
    
    var leftNum: String?
    var rightNum: String?
    var presentNum: String?
    var isStart: Bool = true
    var selectedOperator: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    func setLayout(){
        
        allButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height  * 0.48
        })
        operatorButton.forEach({
            $0.layer.cornerRadius = $0.layer.frame.size.height  * 0.48
        })
    }
    
    func markButton(buttonTitle: String){
        self.operatorButton.forEach({
            if $0.titleLabel?.text == buttonTitle{
                $0.isSelected = true
                $0.backgroundColor = .white
            }else {
                $0.isSelected = false
                $0.backgroundColor = UIColor.systemOrange
            }
            
        })
    }
    
    
     func doOperation() {
         guard let leftOperand = leftNum else {
             return
         }
         guard let rightOperand = rightNum else {
             return
         }
         
         guard let iLeftOperand = Float(leftOperand) else {
             return
         }
         
         
         guard let iRightOperand = Float(rightOperand) else {
             return
         }

         var result: Float = 0
         
         switch self.selectedOperator {
         case "+":
             result = Float(iLeftOperand + iRightOperand)
         case "-":
             result = Float(iLeftOperand - iRightOperand)
         case "÷":
             result = Float(iLeftOperand / iRightOperand)
         case "X":
             result = Float(iLeftOperand * iRightOperand)
         default:
             result = 0
         }
         self.presentNum = "\(result)"
         
         self.leftNum = nil
         self.rightNum = nil
         self.selectedOperator = nil
         self.isStart = true
         
         var numParameter: String = "\(result)"
         
         if let dec = Int("\(result)".split(separator: ".")[1]) {
             if dec == 0 {
                 numParameter = "\(Int(result))"
             }
         }
         self.resultTextField.text = changeNumTypeString(numString: "\(numParameter)")
         
     }
     
     func changeNumTypeString(numString: String) -> String{
         var numStack: [Character] = []

         guard let fNumStr = Float(numString) else {
             return ""
         }
         let iNum = Int(fNumStr)
         let iNumStr = "\(iNum)"
         

         guard let fNum = Float(numString) else {
             return ""
         }
         
         let decimalString = "\(fNum - Float(iNum))"
         
         

         for i in stride(from: 1, through: iNumStr.count, by: 1) {
             if i-1 != 0 && (i-1) % 3 == 0 {
                 numStack.append(",")
             }
             
             let index = iNumStr.index(iNumStr.endIndex, offsetBy: -(i))

             
             numStack.append(iNumStr[index])
         }
         
         var numTypeString: String = ""
         
         while(!numStack.isEmpty){
             numTypeString += String(numStack.popLast() ?? " ")
         }

         if numString.contains(".") {
             let secondIndex = decimalString.index(after: decimalString.startIndex)
             numTypeString += decimalString[secondIndex..<decimalString.endIndex]
         }

         
         return numTypeString
     }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        
        guard let text = self.resultTextField.text else {
            return
        }

        if text.count > 15 {
            return
        }
        
        guard let addText = sender.titleLabel?.text else {
            return
        }
        
        if self.isStart {
            if presentNum != "" {
                leftNum = presentNum
            }
            presentNum = addText
            self.resultTextField.text = changeNumTypeString(numString: addText)
            
        }
        else {
            if let curNum = self.presentNum {
                presentNum = curNum + addText
                self.resultTextField.text = changeNumTypeString(numString: curNum + addText)
            }
            
        }
        self.isStart = false
        
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton){
        guard let operString = sender.titleLabel?.text else {
            return
        }



        
        guard let _ = self.leftNum else {
            leftNum = presentNum
            selectedOperator = operString
            self.presentNum = ""
            markButton(buttonTitle: operString)
            return
        }
        

        
        self.rightNum = presentNum
        self.presentNum = ""


        doOperation()
        selectedOperator = operString
        markButton(buttonTitle: operString)
    }
    

    
    @IBAction func touchUpClearButton(_ sender: UIButton) {
        self.leftNum = nil
        self.rightNum = nil
        self.presentNum = ""
        self.resultTextField.text = "0"
        markButton(buttonTitle: "")
    }
    
    @IBAction func touchUpResultButton(_ sender: UIButton) {
        self.rightNum = presentNum
        self.presentNum = ""
        doOperation()
        markButton(buttonTitle: "")
    }
 
}

