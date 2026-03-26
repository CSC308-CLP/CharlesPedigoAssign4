//
//  ViewController.swift
//  CharlesPedigoAssign4
//
//  Created by Pedigo, Charles L. on 3/25/26.
//

import UIKit

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
    }
    
    @IBAction func peopleStepperChanged(_ sender: Any) {
    }
    
    @IBAction func calculateButton(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TipSplitView.layer.cornerRadius = 20
        
    }


}

