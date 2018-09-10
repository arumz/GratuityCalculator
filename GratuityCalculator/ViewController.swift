//
//  ViewController.swift
//  GratuityCalculator
//
//  Created by Andrew Roembke on 8/29/18.
//  Copyright © 2018 Andrew Roembke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //DECLARE IBOUTLETS
    //@IBOutlet lets the compiler know that the variable is somehow connected to the view
    //UILabel is the class that defines object iblTipPercentOutput
    //! means required
    @IBOutlet var iblTipPercentOutput: UILabel!
    @IBOutlet var iblTipAmountOutput: UILabel!
    @IBOutlet var iblTotalAmountOutput: UILabel!
    
    //DECLARE ATTRIBUTES
    //use intelisense to auto populate with NSDecimal and tab over to replace NSDecimal with values
    var gratuityCalc = Gratuity(tipPercent: 0.15, billAmount: 0.00)
    
    
    //LIFECYCLE FUNCTIONS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Allow user to dismiss the keyboard by tapping outside of it
        
        //Create an object that recognizes taps
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        //Needed so we don't interfere with outher tap controls
        tap.cancelsTouchesInView = false
        
        //Adds the tap object to the current view
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // DEFINE IBACTIONS
    //Any just means (for example) it could be select person by drop down or enter name. Different methods of control
    /*@IBAction func txtBillAmountUpdated(_ sender: Any) {
        print("Bill amount updated")
    }
    */
    
    //INTERNAL METHODS
    
    func updateTipandTotal(){
        //display the updated values for tip amount and total amount
        var tipAmount = gratuityCalc.tipAmount
        var totalBillAmount = gratuityCalc.totalBillAmount
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        
        iblTipAmountOutput.text = currencyFormatter.string(from: tipAmount)
        iblTotalAmountOutput.text = currencyFormatter.string(from: totalBillAmount)
        
    }
    
    
    
    
    
        
    



    //sender is the object of the class UITextView
    @IBAction func txtBillAmountUpdated(_ sender: UITextView) {
       
        //collect value of bill amount input field
        gratuityCalc.billAmount = NSDecimalNumber(string: sender.text)
        //update gratuity object with bill amount
        gratuityCalc.billAmount = NSDecimalNumber(string: sender.text)
        //displaytip A, total A
        updateTipandTotal()
        
        print("The bill amount is \(sender.text)")
    }

    @IBAction func slideTipPercentUpdated(_ sender: UISlider) {
        //read values of the slider by setting local variable
        let tipPercent: NSDecimalNumber = NSDecimalNumber(value: sender.value )
       // let tipPercentInstance = ViewController()
        
        //call percentFormat method to format the tip percentage and store to formatted local variable
        let tipPercentageFormatter = NumberFormatter()
        tipPercentageFormatter.numberStyle = .percent
        tipPercentageFormatter.locale = Locale.current
        tipPercentageFormatter.multiplier = 1
        tipPercentageFormatter.maximumFractionDigits = 2
        
        //returns a string optional
        //tipPercentageFormatter.string(from:percent)
        //print("\(tipPercent)")
        
        //change tip % label
        iblTipPercentOutput.text = tipPercentageFormatter.string(from: tipPercent)
        print("Tip percent updated")
        print("The tip percent is \(tipPercent)%")
        
        //update tip % in Gratuity object
        gratuityCalc.tipPercent = NSDecimalNumber(value: sender.value) //.rounded()
        
        //display tip A, total A
        updateTipandTotal()
        
    }

}

