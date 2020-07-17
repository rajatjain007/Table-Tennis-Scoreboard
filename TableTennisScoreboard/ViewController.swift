//
//  ViewController.swift
//  TableTennisScoreboard
//
//  Created by Rajat Jain on 17/07/20.
//  Copyright © 2020 Rajat Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var team1picker: UIPickerView!
    @IBOutlet weak var team2picker: UIPickerView!
    var team1Score = 0
    var team2Score = 0
    @IBOutlet weak var team1ScoreLabel: UILabel!
    @IBOutlet weak var team2ScoreLabel: UILabel!
    @IBOutlet weak var pointsSelector: UISegmentedControl!
    var winner = ""
    var defaults = UserDefaults.standard
    var teamNames : [String] = ["La Flame","Rockers","Ball Busters","Double Shots","Double Ace","King Smashers"]
    
    
    var team1Name = ""
    var team2Name = ""
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        team1picker.tag = 1
        team2picker.tag = 2
        updateScore()
        
        
        
        
        
    }
    // MARK:- Picker delegate methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        teamNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return teamNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            team1Name = teamNames[row]
            print("Team 1: ")
        }
        else if pickerView.tag == 1{
            team2Name = teamNames[row]
            print("Team 2: ")
        }
       
    }
    
    //MARK:- Scoreboard functions
    @IBAction func team1Plus(_ sender: UIButton) {
        team1Score += 1
        updateScore()
    }
    @IBAction func team1Minus(_ sender: UIButton) {
        team1Score -= 1
        updateScore()
    }
    @IBAction func team2Plus(_ sender: UIButton) {
        team2Score += 1
        updateScore()
    }
    
    @IBAction func team2Minus(_ sender: UIButton) {
        team2Score -= 1
        updateScore()
    }
    
    // MARK:- Update scoreboard
       func updateScore(){
           team1ScoreLabel.text? = String(team1Score)
           team2ScoreLabel.text? = String(team2Score)
       }
    
    // MARK:- End match
    
    @IBAction func endMatch(_ sender: UIButton) {
        if pointsSelector.selectedSegmentIndex==0{
            if team1Score==11{
                winner = team1Name
                updatePointsTable()
                print(winner)
                print("Right wins")
                resetAll()
            }
            else if team2Score==11{
                winner = team2Name
                updatePointsTable()
                print("Left wins")
                resetAll()
            }
            else{
                let alert = UIAlertController(title: "Match incomplete", message: "", preferredStyle: .alert)
                present(alert,animated: true,completion: nil)
                alert.dismiss(animated: true, completion: nil)
                
            }
            
        }
        if pointsSelector.selectedSegmentIndex==1{
            if team1Score==21{
                winner = team1Name
                updatePointsTable()
                print("Right wins")
                resetAll()
            }
            else if team2Score==21{
                winner = team2Name
                updatePointsTable()
                print("Left wins")
                resetAll()
            }
            else{
                let alert = UIAlertController(title: "Match incomplete", message: "", preferredStyle: .alert)
                present(alert,animated: true,completion: nil)
                alert.dismiss(animated: true, completion: nil)
            }
        }
        
        
    }
    
    // MARK:- Update points table
    func updatePointsTable(){
        
        
        
    }
    
    // MARK:- Alert for winning and resetting
    func resetAll(){
        
        let alert = UIAlertController(title: "Congratulations to the winner", message: "", preferredStyle: .alert)
        present(alert,animated: true,completion: nil)
        alert.dismiss(animated: true, completion: nil)
        team1Score = 0
        team2Score = 0
        winner = ""
        updateScore()
        
    }
    
    
    
    


}

