//
//  ViewController.swift
//  CharlesPedigoAssign4
//
//  Created by Pedigo, Charles L. on 3/25/26.
//

import UIKit

//BillSplit Class
class BillSplit {
    var bill: Double
    var tipPercent: Double
    var people: Int
    
    //Desginated Initializer
    init?(b: Double, t: Double, p: Int) {
        guard b >= 0 else { return nil }
        guard p >= 1 else { return nil }
        self.bill = b
        self.tipPercent = t
        self.people = p
    }
    
    //Function to calculate main costs related to BillSplit
    func computeSplit() -> (tip: Double, total: Double, perPerson: Double) {
        let tipAmount = bill * (tipPercent / 100) //Tip Cost
        let totalAmount = bill + tipAmount //Total Cost
        let perPerson =  totalAmount / Double(people) //PerPerson Cost
        let billSplitTuples: (Double, Double, Double) = (tipAmount, totalAmount, perPerson)
        return billSplitTuples
    }
    
}

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var TipSplitView: UIView!
    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipSliderLabel: UILabel!
    
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var peopleStepperLabel: UILabel!
    
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var generosityLabel: UILabel!
    
    @IBOutlet weak var confirmationImage: UIImageView!
    
    
    //Actions
    @IBAction func tipSliderChanged(_ sender: Any) {
        tipSliderLabel.text = "Tip \(Int(tipSlider.value))%"
        
        //Closure used to determine generosity level
        let generosity: ((Double) -> String)? = {(tipPerc: Double) -> String in
            let tipPerc = self.tipSlider.value
            switch tipPerc {
            case 0...6:
                return "😒Very Low"
            case 6...12:
                return "😕Light"
            case 12...18:
                return "😀Standard"
            case 18...24:
                return "😗Generous"
            case 24...30:
                return "😎Super Generous"
            default:
                return "😀DefaultError"
            }
        }
        //Update generosity label
        generosityLabel.text = "Generosity: \(generosity?(Double(tipSlider.value)) ?? "😀Standard")"
        
    }
    
    @IBAction func peopleStepperChanged(_ sender: Any) {
        peopleStepperLabel.text = "People: \(Int(peopleStepper.value))"
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        var parsedBillAmount: Double = 0.0 //Initialize variable for bill
        if Double(billAmountTextField.text ?? "0") != nil {
            parsedBillAmount = Double(billAmountTextField.text ?? "0") ?? 0.0
            //print("Parse success")
        }else{
            parsedBillAmount = 0.0 //Default value
            print("Parse failure")
        }
        
        //Create class object for current information
        var splitBill = BillSplit(b: parsedBillAmount, t: Double(Int(tipSlider.value)), p: Int(peopleStepper.value))
        
        //Call compute method and update values
        var splitCalculations = splitBill?.computeSplit()
        
        calculationLabel.text = "Per Person: $\(String(format: "%.2f", splitCalculations?.perPerson ?? 0.00))"
        
        //Animation to signify completion
        UIView.animate(withDuration: 3) {
            self.confirmationImage.frame = CGRect(x: 150, y: 600, width: 200, height: 200)
        }completion:{ _ in
            print("Finished Calculation!")
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TipSplitView.layer.cornerRadius = 20
        
    }


}

