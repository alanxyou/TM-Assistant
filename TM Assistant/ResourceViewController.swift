//
//  ViewController.swift
//  TM Assistant
//
//  Created by Alan You on 2/17/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if assistant.previousGameState != nil {
            undoPossible = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var assistant: TMAssistant = TMAssistant()
    
    var undoPossible = false {
        didSet {
            undoButton.isEnabled = undoPossible
        }
    }
    
    var calculatorResource: String?
    var calculatorAmount: Int?
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var terraformingRatingBannerLabel: UILabel!
    @IBOutlet weak var generationBannerLabel: UILabel!
    @IBOutlet weak var megacreditBannerLabel: UILabel!
    @IBOutlet weak var steelBannerLabel: UILabel!
    @IBOutlet weak var titaniumBannerLabel: UILabel!
    @IBOutlet weak var plantBannerLabel: UILabel!
    @IBOutlet weak var energyBannerLabel: UILabel!
    @IBOutlet weak var heatBannerLabel: UILabel!
    
    @IBOutlet weak var generationLabel: UILabel!
    @IBOutlet weak var terraformingRatingLabel: UILabel!
    
    @IBOutlet weak var megacreditAccumulationLabel: UILabel!
    @IBOutlet weak var steelAccumulationLabel: UILabel!
    @IBOutlet weak var titaniumAccumulationLabel: UILabel!
    @IBOutlet weak var plantAccumulationLabel: UILabel!
    @IBOutlet weak var energyAccumulationLabel: UILabel!
    @IBOutlet weak var heatAccumulationLabel: UILabel!

    @IBOutlet weak var megacreditAdjustmentButton: UIButton!
    @IBOutlet weak var steelAdjustmentButton: UIButton!
    @IBOutlet weak var titaniumAdjustmentButton: UIButton!
    @IBOutlet weak var plantAdjustmentButton: UIButton!
    @IBOutlet weak var energyAdjustmentButton: UIButton!
    @IBOutlet weak var heatAdjustmentButton: UIButton!
    
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var toggleBackgroundButton: UIButton!
    
    let generator = UIImpactFeedbackGenerator(style: .light)
    
    func refreshUI() {
        generator.prepare()
        
        generationLabel.text = "\(assistant.currentGameState.generation)"
        terraformingRatingLabel.text = "\(assistant.currentGameState.terraformingRating)"
        
        megacreditAccumulationLabel.text = "\(assistant.currentGameState.resources["megacredit"]!.accumulationAmount)"
        steelAccumulationLabel.text = "\(assistant.currentGameState.resources["steel"]!.accumulationAmount)"
        titaniumAccumulationLabel.text = "\(assistant.currentGameState.resources["titanium"]!.accumulationAmount)"
        plantAccumulationLabel.text = "\(assistant.currentGameState.resources["plant"]!.accumulationAmount)"
        energyAccumulationLabel.text = "\(assistant.currentGameState.resources["energy"]!.accumulationAmount)"
        heatAccumulationLabel.text = "\(assistant.currentGameState.resources["heat"]!.accumulationAmount)"
        
        megacreditAdjustmentButton.setTitle("\(assistant.currentGameState.resources["megacredit"]!.total)", for: .normal)
        steelAdjustmentButton.setTitle("\(assistant.currentGameState.resources["steel"]!.total)", for: .normal)
        titaniumAdjustmentButton.setTitle("\(assistant.currentGameState.resources["titanium"]!.total)", for: .normal)
        plantAdjustmentButton.setTitle("\(assistant.currentGameState.resources["plant"]!.total)", for: .normal)
        energyAdjustmentButton.setTitle("\(assistant.currentGameState.resources["energy"]!.total)", for: .normal)
        heatAdjustmentButton.setTitle("\(assistant.currentGameState.resources["heat"]!.total)", for: .normal)

        generator.impactOccurred()
    }
    
    @IBAction func toggleDarkMode(_ sender: UIButton) {
//        if backgroundView.backgroundColor == UIColor.white {
//            backgroundView.backgroundColor = UIColor.black
//            toggleBackgroundButton.setTitleColor(UIColor.white, for: .normal)
//
//            terraformingRatingBannerLabel.textColor = UIColor(red:1.00, green:0.78, blue:0.60, alpha:1.0)
//            terraformingRatingBannerLabel.backgroundColor = UIColor.black
//            terraformingRatingBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//            generationBannerLabel.textColor = UIColor.white
//            generationBannerLabel.backgroundColor = UIColor.black
//            generationBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//            megacreditBannerLabel.textColor = UIColor(red:1.00, green:0.96, blue:0.49, alpha:1.0)
//            megacreditBannerLabel.backgroundColor = UIColor.black
//            megacreditBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//            steelBannerLabel.textColor = UIColor(red:1.00, green:0.88, blue:0.75, alpha:1.0)
//            steelBannerLabel.backgroundColor = UIColor.black
//            steelBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//            titaniumBannerLabel.textColor = UIColor(red:0.83, green:0.84, blue:0.85, alpha:1.0)
//            titaniumBannerLabel.backgroundColor = UIColor.black
//            titaniumBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//            plantBannerLabel.textColor = UIColor(red:0.76, green:0.91, blue:0.62, alpha:1.0)
//            plantBannerLabel.backgroundColor = UIColor.black
//            plantBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//            energyBannerLabel.textColor = UIColor(red:1.00, green:0.72, blue:0.98, alpha:1.0)
//            energyBannerLabel.backgroundColor = UIColor.black
//            energyBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//            heatBannerLabel.textColor = UIColor(red:1.00, green:0.65, blue:0.58, alpha:1.0)
//            heatBannerLabel.backgroundColor = UIColor.black
//            heatBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
//
//            terraformingRatingLabel.textColor = UIColor.white
//            generationLabel.textColor = UIColor.white
//
//            megacreditAccumulationLabel.textColor = UIColor.white
//            steelAccumulationLabel.textColor = UIColor.white
//            titaniumAccumulationLabel.textColor = UIColor.white
//            plantAccumulationLabel.textColor = UIColor.white
//            energyAccumulationLabel.textColor = UIColor.white
//            heatAccumulationLabel.textColor = UIColor.white
//
//            megacreditTotalLabel.textColor = UIColor.white
//            steelTotalLabel.textColor = UIColor.white
//            titaniumTotalLabel.textColor = UIColor.white
//            plantTotalLabel.textColor = UIColor.white
//            energyTotalLabel.textColor = UIColor.white
//            heatTotalLabel.textColor = UIColor.white
//        }
//        else if backgroundView.backgroundColor == UIColor.black {
//            backgroundView.backgroundColor = UIColor.white
//            toggleBackgroundButton.setTitleColor(UIColor.black, for: .normal)
//
//            terraformingRatingBannerLabel.textColor = UIColor.black
//            terraformingRatingBannerLabel.backgroundColor = #colorLiteral(red: 0.9177063107, green: 0.5506290197, blue: 0.2627521455, alpha: 0.66)
//            terraformingRatingBannerLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .semibold)
//            generationBannerLabel.textColor = UIColor.black
//            generationBannerLabel.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
//            generationBannerLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
//            megacreditBannerLabel.textColor = UIColor.black
//            megacreditBannerLabel.backgroundColor = #colorLiteral(red: 0.9912725091, green: 0.9177541733, blue: 0.07277751714, alpha: 0.66)
//            megacreditBannerLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
//            steelBannerLabel.textColor = UIColor.black
//            steelBannerLabel.backgroundColor = #colorLiteral(red: 0.6587831974, green: 0.4729810357, blue: 0.3032491505, alpha: 0.66)
//            steelBannerLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
//            titaniumBannerLabel.textColor = UIColor.black
//            titaniumBannerLabel.backgroundColor = #colorLiteral(red: 0.35136953, green: 0.3611224294, blue: 0.3608824611, alpha: 0.66)
//            titaniumBannerLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
//            plantBannerLabel.textColor = UIColor.black
//            plantBannerLabel.backgroundColor = #colorLiteral(red: 0.4713600874, green: 0.720990479, blue: 0.2673010528, alpha: 0.66)
//            plantBannerLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
//            energyBannerLabel.textColor = UIColor.black
//            energyBannerLabel.backgroundColor = #colorLiteral(red: 0.6016296148, green: 0.22637707, blue: 0.5395048857, alpha: 0.66)
//            energyBannerLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
//            heatBannerLabel.textColor = UIColor.black
//            heatBannerLabel.backgroundColor = #colorLiteral(red: 0.9051292539, green: 0.3214156032, blue: 0.2258704901, alpha: 0.66)
//            heatBannerLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
//
//            terraformingRatingLabel.textColor = UIColor.black
//            generationLabel.textColor = UIColor.black
//
//            megacreditAccumulationLabel.textColor = UIColor.black
//            steelAccumulationLabel.textColor = UIColor.black
//            titaniumAccumulationLabel.textColor = UIColor.black
//            plantAccumulationLabel.textColor = UIColor.black
//            energyAccumulationLabel.textColor = UIColor.black
//            heatAccumulationLabel.textColor = UIColor.black
//
//            megacreditTotalLabel.textColor = UIColor.black
//            steelTotalLabel.textColor = UIColor.black
//            titaniumTotalLabel.textColor = UIColor.black
//            plantTotalLabel.textColor = UIColor.black
//            energyTotalLabel.textColor = UIColor.black
//            heatTotalLabel.textColor = UIColor.black
//        }
    }
    
    @IBAction func undoLastAction(_ sender: UIButton) {
        if undoPossible {
            assistant.undoLastAction()
            refreshUI()
            undoPossible = false
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        let alert = UIAlertController(title:"Are you sure you want to begin a new game?", message:"This action can not be undone.", preferredStyle: .alert)
   
        alert.addAction(UIAlertAction(title: "New Game", style: .destructive, handler: { action in
            self.performSegue(withIdentifier: "segueToVariant", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func advanceGeneration(_ sender: UIButton) {
        assistant.advanceGeneration()
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementTerraformingRating(_ sender: UIButton) {
        if assistant.currentGameState.terraformingRating > 0 {
            assistant.adjustTerraformingRating(by: -1)
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementTerraformingRating(_ sender: UIButton) {
        assistant.adjustTerraformingRating(by: 1)
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementMegacreditAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["megacredit"]!.accumulationAmount > -5 {
            assistant.adjustAccumulationAmount(for: "megacredit", by: -1)
            refreshUI()
            undoPossible = true
        }
    }

    @IBAction func incrementMegacreditAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "megacredit", by: 1)
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementSteelAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["steel"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "steel", by: -1)
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementSteelAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "steel", by: 1)
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementTitaniumAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["titanium"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "titanium", by: -1)
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementTitaniumAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "titanium", by: 1)
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementPlantAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["plant"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "plant", by: -1)
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementPlantAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "plant", by: 1)
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementEnergyAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["energy"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "energy", by: -1)
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementEnergyAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "energy", by: 1)
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementHeatAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["heat"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "heat", by: -1)
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementHeatAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "heat", by: 1)
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func modifyMegacredit(_ sender: UIButton) {
        calculatorResource = "megacredit"
        calculatorAmount = assistant.currentGameState.resources["megacredit"]!.total
    }
    
    @IBAction func modifySteel(_ sender: UIButton) {
        calculatorResource = "steel"
        calculatorAmount = assistant.currentGameState.resources["steel"]!.total
    }
    
    @IBAction func modifyTitanium(_ sender: Any) {
        calculatorResource = "titanium"
        calculatorAmount = assistant.currentGameState.resources["titanium"]!.total
    }
    
    @IBAction func modifyPlant(_ sender: UIButton) {
        calculatorResource = "plant"
        calculatorAmount = assistant.currentGameState.resources["plant"]!.total
    }
    
    @IBAction func modifyEnergy(_ sender: UIButton) {
        calculatorResource = "energy"
        calculatorAmount = assistant.currentGameState.resources["energy"]!.total
    }
    
    @IBAction func modifyHeat(_ sender: UIButton) {
        calculatorResource = "heat"
        calculatorAmount = assistant.currentGameState.resources["heat"]!.total
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resourceName = calculatorResource
        let startingAmount = calculatorAmount
        
        if let destinationViewController = segue.destination as? CalculatorViewController {
            destinationViewController.resourceType = resourceName
            destinationViewController.startingAmount = startingAmount
            destinationViewController.assistant = assistant
        }
    }
}
