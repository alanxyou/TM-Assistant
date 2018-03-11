//
//  CorporationViewController.swift
//  TM Assistant
//
//  Created by Alan You on 3/10/18.
//  Copyright © 2018 Alan You. All rights reserved.
//

import UIKit

class CorporationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var assistant = TMAssistant()
    
    var corporations = [Corporation]()
    let cellIdentifier = "CorporationTableViewCell"

    @IBOutlet weak var corporationTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return corporations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CorporationTableViewCell else {
            fatalError("The dequeued cell is not an instance of CorporationTableViewCell.")
        }
        
        let corporation = corporations[indexPath.row]

        cell.nameLabel.text = corporation.name

        cell.tagOne.layer.masksToBounds = true
        cell.tagOne.layer.cornerRadius = cell.tagOne.frame.width / 2
        cell.tagOne.backgroundColor = corporation.tags[0]
        cell.tagTwo.layer.masksToBounds = true
        cell.tagTwo.layer.cornerRadius = cell.tagTwo.frame.width / 2
        cell.tagTwo.backgroundColor = corporation.tags[1]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        assistant.configureCorporation(forCorporation: assistant.corporationList[indexPath.row])
        
        print("You tapped cell number \(indexPath.row).")
        
        performSegue(withIdentifier: "SegueToMain", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCorporations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ResourceViewController {
            destinationViewController.assistant = assistant
        }
    }
    
    func loadCorporations() {
        corporations = assistant.getCorporations()
    }
}
