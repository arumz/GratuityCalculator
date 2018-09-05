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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // DEFINE IBACTIONS
    //Any just means (for example) it could be select person by drop down or enter name. Different methods of control
    @IBAction func txtBillAmountUpdated(_ sender: Any) {
        print("Bill amount updated")
    }
    
    @IBAction func slideTipPercentUpdated(_ sender: Any) {
        print("Tip percent updated")
    }

}

