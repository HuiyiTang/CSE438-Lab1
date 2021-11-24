//
//  ViewController.swift
//  HUIYI TANG-Lab1
//
//  Created by Huiyi Tang on 9/9/21.
//

import UIKit

var price = 0.0, discount = 0.0, tax = 0.0

class ViewController: UIViewController {

    @IBOutlet weak var originalInput: UITextField!
    @IBOutlet weak var discountInput: UITextField!
    @IBOutlet weak var taxInput: UITextField!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var msg: UILabel!
    
    func isPurnFloat(string: String) -> Bool {
        let scan: Scanner = Scanner(string: string)
        var val:Float = 0
        return scan.scanFloat(&val) && scan.isAtEnd
    }
    
    func showMsgBox(_message: String, _title: String = "Alert") {
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertController.Style.alert)
        let warning = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(warning)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func priceChanged(_ sender: UITextField) {
        if let text = originalInput.text, text.isEmpty {
            // myTextField is empty
            price = 0.0
            let totalPrice = price
            finalPrice.text = "$\(String(format: "%.2f", totalPrice))"
        }
        else {
            // myTextField is not empty
            if isPurnFloat(string: originalInput.text!) == true {
                price = Double(Float(originalInput.text!)!)
                 
                if price < 100000 {
                    let totalPrice = price * (1 - (discount / 100)) * (1 + (tax / 100))
                    if totalPrice < 100000 {
                        finalPrice.text = "$\(String(format: "%.2f", totalPrice))"
                    }
                    else {
                        showMsgBox(_message: "The output calculated is so big that can not display in this calculator!")
                    }
                }
                else {
                    showMsgBox(_message: "The number you entered is so big that can not display in this calculator!")
                }
                
            }
            else {
                showMsgBox(_message: "What you entered in Original Price is not a number, please delete and re-enter!")
            }
        }
    }
    
    @IBAction func discountChanged(_ sender: UITextField) {
        if let text = discountInput.text, text.isEmpty {
            // myTextField is empty
            discount = 0.0
            if let tax = taxInput.text, tax.isEmpty {
                let totalPrice = price
                finalPrice.text = "$\(String(format: "%.2f", totalPrice))"
            }
            else {
                let totalPrice = price * (1 + tax / 100)
                if totalPrice < 100000 {
                    finalPrice.text = "$\(String(format: "%.2f", totalPrice))"
                }
                else {
                    showMsgBox(_message: "The output calculated is so big that can not display in this calculator!")
                }
            }
        }
        else {
            // myTextField is not empty
            if isPurnFloat(string: discountInput.text!) == true {
                discount = Double(Float(discountInput.text!)!)
                
                if discount <= 100 {
                    let totalPrice = price * (1 - (discount / 100)) * (1 + (tax / 100))
                    if totalPrice < 100000 {
                        finalPrice.text = "$\(String(format: "%.2f", totalPrice))"
                    }
                    else {
                        showMsgBox(_message: "The output calculated is so big that can not display in this calculator!")
                    }
                }
                else {
                    showMsgBox(_message: "The discount you enetered is invalid and it should not be larger than 100!")
                }
                
            }
            else {
                showMsgBox(_message: "What you entered in Discount % is not a number, please delete and re-enter!")
            }
        }
    }
    
    @IBAction func taxChanged(_ sender: UITextField) {
        if let text = taxInput.text, text.isEmpty {
            // myTextField is empty
            tax = 0.0
            if let discount = discountInput.text, discount.isEmpty {
                let totalPrice = price
                finalPrice.text = "$\(String(format: "%.2f", totalPrice))"
            }
            else {
                let totalPrice = price * (1 - (discount / 100))
                if totalPrice < 100000 {
                    finalPrice.text = "$\(String(format: "%.2f", totalPrice))"
                }
                else {
                    showMsgBox(_message: "The output calculated is so big that can not display in this calculator!")
                }
            }
        }
        else {
            // myTextField is not empty
            if isPurnFloat(string: taxInput.text!) == true {
                tax = Double(Float(taxInput.text!)!)
                
                let totalPrice = price * (1 - (discount / 100)) * (1 + (tax / 100))
                if totalPrice < 100000 {
                    finalPrice.text = "$\(String(format: "%.2f", totalPrice))"
                }
                else {
                    showMsgBox(_message: "The output calculated is so big that can not display in this calculator!")
                }
                
            }
            else {
                showMsgBox(_message: "What you entered in Sales Tax %  is not a number, please delete and re-enter!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        finalPrice.textAlignment = .center
    }
}

