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
    
    var teamDictionary = Dictionary<String,Int>()
    var teamNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveTeamData()
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh notices.")
        self.tableView.reloadData()
       
        print(teamNames)
        print(teamDictionary)
        
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
        let points = teamDictionary[team]
        cell?.textLabel?.text = team + " : " +  "\(points ?? 0) " + " points."
        
        return cell!
        
    }
    
    
    // MARK:- Add new team
    
    @IBAction func addNewTeam(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new team", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add team", style: .default) { (action) in
            self.teamNames.append(textField.text!)
            self.teamDictionary[textField.text!] = 0
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
    
    func retrieveTeamData(){
        
        teamNames = defaults.value(forKey: "teamNames") as? [String] ?? []
        teamDictionary = defaults.value(forKey: "teamDictionary") as? Dictionary<String,Int> ?? [:]
        
    }
    
    @IBAction func refreshPointsTable(_ sender: UIBarButtonItem) {
        retrieveTeamData()
        self.tableView.reloadData()
    }
    
    @IBAction func deleteTournaments(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Delete points table", message: "", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Delete", style: .default) { (action) in
            self.teamDictionary.removeAll()
            self.teamNames.removeAll()
            print(self.teamDictionary,self.teamNames)
            self.defaults.set(self.teamNames, forKey: "teamNames")
            self.defaults.set(self.teamDictionary, forKey: "teamDictionary")
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert,animated: true,completion: nil)
        
        
    }
    
}
