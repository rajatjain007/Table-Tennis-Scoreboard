//
//  PointsTableViewController.swift
//  TableTennisScoreboard
//
//  Created by Rajat Jain on 17/07/20.
//  Copyright © 2020 Rajat Jain. All rights reserved.
//

import UIKit

class PointsTableViewController: UITableViewController {
    
    var teamDictionary : Dictionary<String,Int> = ["No teams added.":0]
    var defaults = UserDefaults.standard
    var teamNames = [String]()
    var retrieveTeamDictionary : Dictionary<String,Int> = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTeamNames()
        self.tableView.reloadData()
        print(teamNames)
        print(teamDictionary)
        print(retrieveTeamDictionary)
        

    }

    // MARK:- TableView functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell")
        let team = teamNames[indexPath.row]
        print(team)
        var points = teamDictionary[team]!
        cell?.textLabel?.text = team + " : " + String(points) + " points"
        return cell!
        
        }
    
    
    // MARK:- Add new team
    @IBAction func addNewTeam(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new team", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add team", style: .default) { (action) in
            
            self.retrieveTeamDictionary = self.defaults.value(forKey: "teamDictionary") as! Dictionary<String, Int>
            
            self.retrieveTeamDictionary[textField.text!] = 0
            
            self.generateTeamNames()
            
            self.defaults.set(self.retrieveTeamDictionary, forKey: "teamDictionary")
            self.defaults.set(self.teamNames, forKey: "teamNames")
            
            
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Enter team name."
            textField = alertTextField
            
        }
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert,animated: true,completion: nil)
        print(retrieveTeamDictionary)
        print(teamDictionary)
        print(teamNames)
    }
   
    
    // MARK:- Generate team names
    func generateTeamNames(){
        for team in retrieveTeamDictionary.keys{
            teamNames.append(team)
        }
        
    }
    

  

}
