//
//  CalculatorViewController.swift
//  TM Assistant
//
//  Created by Alan You on 2/18/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var resourcePlurality: String?
        
        if startingAmount! == 1 {
            resourcePlurality = resourceType
        } else {
            resourcePlurality = resourcePlurals[resourceType!]!
        }
        
        startingAmountLabel.backgroundColor = resourceColors[resourceType!]
        startingAmountLabel.text = "\(startingAmount!) \(resourcePlurality!)"
        spendButton.setTitle("Spend \(resourcePlurality!.capitalized)", for: .normal)
        gainButton.setTitle("Gain \(resourcePlurality!.capitalized)", for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ResourceViewController {
            destinationViewController.assistant = assistant!
        }
    }

    var assistant: TMAssistant?
    var resourceType: String?
    var startingAmount: Int?
    
    let resourceColors = ["megacredit":#colorLiteral(red: 0.9912725091, green: 0.9177541733, blue: 0.07277751714, alpha: 0.66), "steel":#colorLiteral(red: 0.6587831974, green: 0.4729810357, blue: 0.3032491505, alpha: 0.66), "titanium":#colorLiteral(red: 0.35136953, green: 0.3611224294, blue: 0.3608824611, alpha: 0.66), "plant":#colorLiteral(red: 0.4713600874, green: 0.720990479, blue: 0.2673010528, alpha: 0.66), "energy":#colorLiteral(red: 0.6016296148, green: 0.22637707, blue: 0.5395048857, alpha: 0.66), "heat":#colorLiteral(red: 0.9051292539, green: 0.3214156032, blue: 0.2258704901, alpha: 0.66)]
    let resourcePlurals = ["megacredit":"megacredits", "steel":"steel", "titanium":"titanium", "plant":"plants", "energy":"energy", "heat":"heat"]
    
    var adjustmentAmount = "0" {
        didSet {
            adjustmentAmountLabel.text = adjustmentAmount
            generator.impactOccurred()
        }
    }

    let generator = UIImpactFeedbackGenerator(style: .light)

    @IBOutlet weak var startingAmountLabel: UILabel!
    @IBOutlet weak var adjustmentAmountLabel: UILabel!
    
    @IBOutlet weak var spendButton: UIButton!
    @IBOutlet weak var gainButton: UIButton!
    
    @IBAction func addDigit(_ sender: UIButton) {
        if adjustmentAmount == "0" {
            adjustmentAmount = ""
        }
        
        adjustmentAmount += (sender.titleLabel?.text)!
    }
    
    @IBAction func clearAdjustmentAmount(_ sender: UIButton) {
        adjustmentAmount = "0"
    }
    
    @IBAction func spendResources(_ sender: UIButton) {
        let adjustment = Int(adjustmentAmount)
        
        if (adjustment! <= startingAmount!) {
            assistant!.adjustTotalAmount(for: resourceType!, by: Int(adjustmentAmount)! * -1)
            performSegue(withIdentifier: "segueToMain", sender: self)
        }
    }
    
    @IBAction func gainResources(_ sender: UIButton) {
        assistant!.adjustTotalAmount(for: resourceType!, by: Int(adjustmentAmount)!)
        performSegue(withIdentifier: "segueToMain", sender: self)
    }
}
