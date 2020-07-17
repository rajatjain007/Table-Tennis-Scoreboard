//
//  PointsTableViewController.swift
//  TableTennisScoreboard
//
//  Created by Rajat Jain on 17/07/20.
//  Copyright © 2020 Rajat Jain. All rights reserved.
//

import UIKit

class PointsTableViewController: UITableViewController {
    
    
    var defaults = UserDefaults.standard
    var teamNames = [String]()
    var teamDictionary = Dictionary<String,Int>()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamNames)
        print(defaults.value(forKey: "teamDictionary"))
        print(defaults.value(forKey: "teamNames") as! [String])
        
        self.tableView.reloadData()
        
        
        
    }
    
    // MARK:- TableView functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell")
        let teamN = defaults.value(forKey: "teamNames") as! [String]
        let team = teamN[indexPath.row] ?? "No teams added"
        cell?.textLabel?.text = team
       
        return cell!
        
    }
    
    
    // MARK:- Add new team
    
    @IBAction func addNewTeam(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new team", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add team", style: .default) { (action) in
            self.teamNames.append(textField.text!)
            self.teamDictionary[textField.text!] = 0
            self.defaults.set(self.teamNames, forKey: "teamNames")
            self.defaults.set(self.teamDictionary, forKey: "teamDictionary")
            self.tableView.reloadData()
            
            
            
            
            
            
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Enter team name."
            textField = alertTextField
            self.defaults.set(self.teamDictionary, forKey: "teamDictionary")
            
        }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert,animated: true,completion: nil)
        
    }
    
    
    
    
    
 
    
    
    
}
