//
//  GameState.swift
//  TM Assistant
//
//  Created by Alan You on 2/18/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import Foundation

struct GameState {
    let resourceNames = ["megacredit", "steel", "titanium", "plant", "energy", "heat"]
    
    var generation = 1
    var terraformingRating = 20
    var resources =  [String: Resource]()
    
    init() {
        for resourceName in resourceNames {
            resources[resourceName] = Resource()
        }
    }
    
    init(generation: Int, terraformingRating: Int, resources: [String:Resource]) {
        self.generation = generation
        self.terraformingRating = terraformingRating
        self.resources = resources
    }
}
