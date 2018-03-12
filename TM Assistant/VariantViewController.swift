//
//  VariantViewController.swift
//  TM Assistant
//
//  Created by Alan You on 3/10/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class VariantViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? CorporationViewController {
            destinationViewController.assistant = assistant
        }
    }

    var assistant: TMAssistant = TMAssistant()
    
    @IBAction func selectStandardVariant(_ sender: UIButton) {
        assistant.gameVariant = "standard"
        assistant.configureVariant(forVariant: assistant.gameVariant)
    }
    
    @IBAction func selectCorporateVariant(_ sender: UIButton) {
        assistant.gameVariant = "corporate"
        assistant.configureVariant(forVariant: assistant.gameVariant)
    }
    
    @IBAction func soloCorporateVariant(_ sender: UIButton) {
        assistant.gameVariant = "solo"
        assistant.configureVariant(forVariant: assistant.gameVariant)
    }
}
