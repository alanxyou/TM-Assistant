//
//  ViewController.swift
//  TM Assistant
//
//  Created by Alan You on 2/17/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController {

    var assistant: TMAssistant = TMAssistant()
    var calculatorResource: String?
    var calculatorAmount: Int?
    
    let generator = UIImpactFeedbackGenerator(style: .light)
    
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

    var undoPossible = false {
        didSet {
//            undoButton.isEnabled = undoPossible
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resourceName = calculatorResource
        let startingAmount = calculatorAmount
        
        if let destinationViewController = segue.destination as? CalculatorViewController {
            destinationViewController.resourceType = resourceName
            destinationViewController.startingAmount = startingAmount
            destinationViewController.assistant = assistant
        }
        
        if let destinationViewController = segue.destination as? HistoryViewController {
            destinationViewController.assistant = assistant
        }
    }

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
        assistant.addActionToHistory(forAction: "AG", byAmount: assistant.currentGameState.generation)
        
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementTerraformingRating(_ sender: UIButton) {
        if assistant.currentGameState.terraformingRating > 0 {
            assistant.adjustTerraformingRating(by: -1)
            assistant.addActionToHistory(forAction: "TR", byAmount: -1)
            
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementTerraformingRating(_ sender: UIButton) {
        assistant.adjustTerraformingRating(by: 1)
        assistant.addActionToHistory(forAction: "TR", byAmount: 1)
        
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementMegacreditAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["megacredit"]!.accumulationAmount > -5 {
            assistant.adjustAccumulationAmount(for: "megacredit", by: -1)
            assistant.addActionToHistory(forAction: "MA", byAmount: -1)
            
            refreshUI()
            undoPossible = true
        }
    }

    @IBAction func incrementMegacreditAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "megacredit", by: 1)
        assistant.addActionToHistory(forAction: "MA", byAmount: 1)
        
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementSteelAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["steel"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "steel", by: -1)
            assistant.addActionToHistory(forAction: "SA", byAmount: -1)
            
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementSteelAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "steel", by: 1)
        assistant.addActionToHistory(forAction: "SA", byAmount: 1)
        
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementTitaniumAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["titanium"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "titanium", by: -1)
            assistant.addActionToHistory(forAction: "TA", byAmount: -1)
            
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementTitaniumAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "titanium", by: 1)
        assistant.addActionToHistory(forAction: "TA", byAmount: 1)
        
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementPlantAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["plant"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "plant", by: -1)
            assistant.addActionToHistory(forAction: "PA", byAmount: -1)
            
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementPlantAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "plant", by: 1)
        assistant.addActionToHistory(forAction: "PA", byAmount: 1)
        
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementEnergyAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["energy"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "energy", by: -1)
            assistant.addActionToHistory(forAction: "EA", byAmount: -1)
            
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementEnergyAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "energy", by: 1)
        assistant.addActionToHistory(forAction: "EA", byAmount: 1)
        
        refreshUI()
        undoPossible = true
    }
    
    @IBAction func decrementHeatAccumulationAmount(_ sender: UIButton) {
        if assistant.currentGameState.resources["heat"]!.accumulationAmount > 0 {
            assistant.adjustAccumulationAmount(for: "heat", by: -1)
            assistant.addActionToHistory(forAction: "HA", byAmount: -1)
            
            refreshUI()
            undoPossible = true
        }
    }
    
    @IBAction func incrementHeatAccumulationAmount(_ sender: UIButton) {
        assistant.adjustAccumulationAmount(for: "heat", by: 1)
        assistant.addActionToHistory(forAction: "HA", byAmount: 1)
        
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
}
