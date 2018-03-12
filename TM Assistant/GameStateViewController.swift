//
//  GameStateViewController.swift
//  TM Assistant
//
//  Created by Alan You on 3/12/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class GameStateViewController: UIViewController {
    var assistant = TMAssistant()
    var gameState = GameState()
    var selectedIndex = 0
    
    @IBOutlet weak var terraformingRatingLabel: UILabel!
    @IBOutlet weak var generationLabel: UILabel!
    
    @IBOutlet weak var megacreditAccumulationLabel: UILabel!
    @IBOutlet weak var steelAccumulationLabel: UILabel!
    @IBOutlet weak var titaniumAccumulationLabel: UILabel!
    @IBOutlet weak var plantAccumulationLabel: UILabel!
    @IBOutlet weak var energyAccumulationLabel: UILabel!
    @IBOutlet weak var heatAccumulationLabel: UILabel!
    
    @IBOutlet weak var megacreditLabel: UILabel!
    @IBOutlet weak var steelLabel: UILabel!
    @IBOutlet weak var titaniumLabel: UILabel!
    @IBOutlet weak var plantLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var heatLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        terraformingRatingLabel.text = "\(gameState.terraformingRating)"
        generationLabel.text = "\(gameState.generation)"
        
        megacreditAccumulationLabel.text = "\(gameState.resources["megacredit"]!.accumulationAmount)"
        steelAccumulationLabel.text = "\(gameState.resources["steel"]!.accumulationAmount)"
        titaniumAccumulationLabel.text = "\(gameState.resources["titanium"]!.accumulationAmount)"
        plantAccumulationLabel.text = "\(gameState.resources["plant"]!.accumulationAmount)"
        energyAccumulationLabel.text = "\(gameState.resources["energy"]!.accumulationAmount)"
        heatAccumulationLabel.text = "\(gameState.resources["heat"]!.accumulationAmount)"
        
        megacreditLabel.text = "\(gameState.resources["megacredit"]!.total)"
        steelLabel.text = "\(gameState.resources["steel"]!.total)"
        titaniumLabel.text = "\(gameState.resources["titanium"]!.total)"
        plantLabel.text = "\(gameState.resources["plant"]!.total)"
        energyLabel.text = "\(gameState.resources["energy"]!.total)"
        heatLabel.text = "\(gameState.resources["heat"]!.total)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? HistoryViewController {
            destinationViewController.assistant = assistant
        }

        if let destinationViewController = segue.destination as? ResourceViewController {
            destinationViewController.assistant = assistant
        }
    }
    
    @IBAction func restoreGameState(_ sender: UIButton) {
        assistant.currentGameState = gameState
        assistant.history.removeSubrange((selectedIndex + 1)..<assistant.history.count)
        
        performSegue(withIdentifier: "SegueToMain", sender: self)
    }
}
