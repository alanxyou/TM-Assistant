//
//  TMAssistant.swift
//  TM Assistant
//
//  Created by Alan You on 2/18/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import Foundation
import UIKit

class TMAssistant {
    let corporationList = ["Beginner Corporation", "Aphrodite", "Celestic", "CrediCor", "EcoLine", "Helion", "Interplanetary Cinematics", "Inventrix", "Manutech", "Mining Guild", "Morning Star Inc.", "PhoboLog", "Saturn Systems", "Teractor", "Tharsis Republic", "ThorGate", "United Nations Mars Initiative", "Viron"]
    
    let corporationValues = ["Beginner Corporation":["ma":0, "mt":42, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Aphrodite":["ma":0, "mt":47, "sa":0, "st":0, "ta":0, "tt":0, "pa":1, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Celestic":["ma":0, "mt":42, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "CrediCor":["ma":0, "mt":57, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "EcoLine":["ma":0, "mt":36, "sa":0, "st":0, "ta":0, "tt":0, "pa":2, "pt":3, "ea":0, "et":0, "ha":0, "ht":0],
                             "Helion":["ma":0, "mt":42, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":3, "ht":0],
                             "Interplanetary Cinematics":["ma":0, "mt":30, "sa":0, "st":20, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Inventrix":["ma":0, "mt":45, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Manutech":["ma":0, "mt":35, "sa":1, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Mining Guild":["ma":0, "mt":30, "sa":1, "st":5, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Morning Star Inc.":["ma":0, "mt":50, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "PhoboLog":["ma":0, "mt":23, "sa":0, "st":0, "ta":0, "tt":10, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Saturn Systems":["ma":0, "mt":42, "sa":0, "st":0, "ta":1, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Teractor":["ma":0, "mt":60, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Tharsis Republic":["ma":0, "mt":40, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "ThorGate":["ma":0, "mt":48, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":1, "et":0, "ha":0, "ht":0],
                             "United Nations Mars Initiative":["ma":0, "mt":40, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0],
                             "Viron":["ma":0, "mt":48, "sa":0, "st":0, "ta":0, "tt":0, "pa":0, "pt":0, "ea":0, "et":0, "ha":0, "ht":0]]
    
    let corporationTags = ["Beginner Corporation":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1)], "Aphrodite":[#colorLiteral(red: 0.1179753616, green: 0.6172758937, blue: 0.7935334444, alpha: 1), #colorLiteral(red: 0.3762072921, green: 0.7067724466, blue: 0.2168241143, alpha: 1)], "Celestic":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.1179753616, green: 0.6172758937, blue: 0.7935334444, alpha: 1)], "CrediCor":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1)], "EcoLine":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.3762072921, green: 0.7067724466, blue: 0.2168241143, alpha: 1)], "Helion":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.4502496719, green: 0.4550119638, blue: 0.4592241049, alpha: 1)], "Interplanetary Cinematics":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.6897871494, green: 0.5086286664, blue: 0.3395078182, alpha: 1)], "Inventrix":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.8665934205, green: 0.8667152524, blue: 0.8665549159, alpha: 1)], "Manutech":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.6897871494, green: 0.5086286664, blue: 0.3395078182, alpha: 1)], "Mining Guild":[#colorLiteral(red: 0.6897871494, green: 0.5086286664, blue: 0.3395078182, alpha: 1), #colorLiteral(red: 0.6897871494, green: 0.5086286664, blue: 0.3395078182, alpha: 1)], "Morning Star Inc.":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.1179753616, green: 0.6172758937, blue: 0.7935334444, alpha: 1)], "PhoboLog":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.4502496719, green: 0.4550119638, blue: 0.4592241049, alpha: 1)], "Saturn Systems":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.9526265264, green: 0.704026401, blue: 0.3043861687, alpha: 1)], "Teractor":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.2082207203, green: 0.248108089, blue: 0.4242144823, alpha: 1)], "Tharsis Republic":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.6897871494, green: 0.5086286664, blue: 0.3395078182, alpha: 1)], "ThorGate":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.5837836266, green: 0.1588624418, blue: 0.524866581, alpha: 1)], "United Nations Mars Initiative":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.2082207203, green: 0.248108089, blue: 0.4242144823, alpha: 1)], "Viron":[#colorLiteral(red: 0.999904573, green: 1, blue: 0.999872148, alpha: 1), #colorLiteral(red: 0.9077896476, green: 0.8956870437, blue: 0.2969803214, alpha: 1)]]

    var gameVariant = ""
    var corporation = ""
    
    var currentGameState = GameState()
    var previousGameState: GameState?
    
    func undoLastAction() {
        currentGameState = previousGameState!
        previousGameState = nil
    }
    
    func resetGame() {
        previousGameState = currentGameState
        currentGameState = GameState()
    }
    
    func configureVariant(forVariant variantName: String) {
        if (variantName == "standard") {
            for resource in currentGameState.resources {
                currentGameState.resources[resource.key]?.accumulationAmount = 1
            }
            
            currentGameState.terraformingRating = 20
        }
        else if (variantName == "corporate") {
            for resource in currentGameState.resources {
                currentGameState.resources[resource.key]?.accumulationAmount = 0
            }

            currentGameState.terraformingRating = 20
        }
        else if (variantName == "solo") {
            for resource in currentGameState.resources {
                currentGameState.resources[resource.key]?.accumulationAmount = 0
            }

            currentGameState.terraformingRating = 14
        }
    }
    
    func getCorporations() -> [Corporation] {
        var corporations = [Corporation]()
        
        for name in corporationList {
            corporations.append(Corporation(name: name, adjustments: corporationValues[name]!, tags: corporationTags[name]!))
        }
        
        return corporations
    }
    
    func configureCorporation(forCorporation corporationName: String) {
        let adjustments = corporationValues[corporationName]
        
        currentGameState.resources["megacredit"]?.accumulationAmount += adjustments!["ma"]!
        currentGameState.resources["megacredit"]?.total += adjustments!["mt"]!
        currentGameState.resources["steel"]?.accumulationAmount += adjustments!["sa"]!
        currentGameState.resources["steel"]?.total += adjustments!["st"]!
        currentGameState.resources["titanium"]?.accumulationAmount += adjustments!["ta"]!
        currentGameState.resources["titanium"]?.total += adjustments!["tt"]!
        currentGameState.resources["plant"]?.accumulationAmount += adjustments!["pa"]!
        currentGameState.resources["plant"]?.total += adjustments!["pt"]!
        currentGameState.resources["energy"]?.accumulationAmount += adjustments!["ea"]!
        currentGameState.resources["energy"]?.total += adjustments!["et"]!
        currentGameState.resources["heat"]?.accumulationAmount += adjustments!["ha"]!
        currentGameState.resources["heat"]?.total += adjustments!["ht"]!
    }
    
    func advanceGeneration() {
        previousGameState = currentGameState
        currentGameState = incrementedGeneration(currentGameState: currentGameState)
    }
    
    func incrementedGeneration(currentGameState currentState: GameState) -> GameState {
        let generation = currentGameState.generation + 1
        let terraformingRating = currentGameState.terraformingRating
        
        var resources = currentGameState.resources
        
        resources["megacredit"]!.total += terraformingRating
        resources["heat"]!.total += resources["energy"]!.total
        resources["energy"]!.total = 0
        
        for (resourceName, resource) in resources {
            resources[resourceName]!.total += resource.accumulationAmount
        }
        
        return GameState(generation: generation,terraformingRating: terraformingRating,resources: resources)
    }
    
    func adjustTerraformingRating(by amount: Int) {
        previousGameState = currentGameState
        currentGameState.terraformingRating += amount
    }
    
    func adjustAccumulationAmount(for resourceName: String, by amount: Int) {
        previousGameState = currentGameState
        currentGameState.resources[resourceName]!.accumulationAmount += amount
    }
    
    func adjustTotalAmount(for resourceName: String, by amount: Int) {
        if (amount != 0) {
            previousGameState = currentGameState
            currentGameState.resources[resourceName]!.total += amount
        }
    }
}
