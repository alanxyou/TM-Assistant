//
//  HistoryViewController.swift
//  TM Assistant
//
//  Created by Alan You on 3/11/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var assistant = TMAssistant()
    var history = [HistoryItem]()
    var selectedGameState = GameState()
    var selectedIndex = 0
    
    let cellIdentifier = "HistoryTableViewCell"

    let resourceColors = ["M":#colorLiteral(red: 0.9884857535, green: 0.8809672594, blue: 0.01583434269, alpha: 1), "S":#colorLiteral(red: 0.6628175378, green: 0.4767676592, blue: 0.3214365542, alpha: 1), "T":#colorLiteral(red: 0.4078062773, green: 0.4078676105, blue: 0.407787025, alpha: 1), "P":#colorLiteral(red: 0.5347694159, green: 0.7519459128, blue: 0.2787581682, alpha: 1), "E":#colorLiteral(red: 0.617782414, green: 0.2429437935, blue: 0.5553479791, alpha: 1), "H":#colorLiteral(red: 0.9233232141, green: 0.3751473725, blue: 0.2166069448, alpha: 1)]
    let resourceNames = ["MA": "MegaCredit Accumulation", "MT": "MegaCredits", "SA": "Steel Accumulation", "ST": "Steel", "TA": "Titanium Accumulation", "TT": "Titanium", "PA": "Plant Accumulation", "PT": "Plants", "EA": "Energy Accumulation", "ET": "Energy", "HA": "Heat Accumulation", "HT": "Heat"]

    @IBOutlet weak var historyTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoryTableViewCell else {
            fatalError("The dequeued cell is not an instance of HistoryTableViewCell.")
        }
        
        let historyItem = history[indexPath.row]
        
        if historyItem.type == "GS" {
            cell.innerBox.backgroundColor = UIColor.white
            cell.outerBox.backgroundColor = UIColor.white
            cell.amountLabel.text = ""
            cell.detailText.text = "Game Start"
        }
        else if historyItem.type == "AG" {
            cell.innerBox.backgroundColor = UIColor.white
            cell.outerBox.backgroundColor = UIColor.white
            cell.amountLabel.text = ""
            cell.detailText.text = "Advanced Generation to \(historyItem.amount)"
        }
        else if historyItem.type == "TR" {
            cell.innerBox.backgroundColor = #colorLiteral(red: 0.9097798467, green: 0.3118231297, blue: 0.1716830134, alpha: 1)
            cell.outerBox.backgroundColor = #colorLiteral(red: 0.9097798467, green: 0.3118231297, blue: 0.1716830134, alpha: 1)
            
            if historyItem.amount < 0 {
                cell.amountLabel.text = "- \(abs(historyItem.amount))"
                cell.detailText.text = "Terraforming Rating decreased by \(abs(historyItem.amount))"
            }
            else {
                cell.amountLabel.text = "+ \(historyItem.amount)"
                cell.detailText.text = "Terraforming Rating increased by \(historyItem.amount)"
            }
        }
        else if historyItem.type.last == "A" {
            cell.innerBox.backgroundColor = resourceColors[String(historyItem.type.first!)]
            cell.outerBox.backgroundColor = #colorLiteral(red: 0.5840380192, green: 0.3977577686, blue: 0.264913559, alpha: 1)
            
            if historyItem.amount < 0 {
                cell.amountLabel.text = "- \(abs(historyItem.amount))"
                cell.detailText.text = "\(resourceNames[historyItem.type]!) decreased by \(abs(historyItem.amount))"
            }
            else {
                cell.amountLabel.text = "+ \(historyItem.amount)"
                cell.detailText.text = "\(resourceNames[historyItem.type]!) increased by \(historyItem.amount)"
            }
        }
        else if historyItem.type.last == "T" {
            cell.innerBox.backgroundColor = resourceColors[String(historyItem.type.first!)]
            cell.outerBox.backgroundColor = resourceColors[String(historyItem.type.first!)]
            
            if historyItem.amount < 0 {
                cell.amountLabel.text = "- \(abs(historyItem.amount))"
                cell.detailText.text = "\(resourceNames[historyItem.type]!) decreased by \(abs(historyItem.amount))"
            }
            else {
                cell.amountLabel.text = "+ \(historyItem.amount)"
                cell.detailText.text = "\(resourceNames[historyItem.type]!) increased by \(historyItem.amount)"
            }
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGameState = assistant.history.reversed()[indexPath.row].gameState
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "SegueToGameState", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadHistory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ResourceViewController {
            destinationViewController.assistant = assistant
        }
        
        if let destinationViewController = segue.destination as? GameStateViewController {
            destinationViewController.assistant = assistant
            destinationViewController.gameState = selectedGameState
            destinationViewController.selectedIndex = assistant.history.count - (selectedIndex + 1)
        }
    }
    
    func loadHistory() {
        history = assistant.history.reversed()
    }
}
