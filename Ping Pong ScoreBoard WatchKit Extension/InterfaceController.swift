//
//  InterfaceController.swift
//  Ping Pong ScoreBoard WatchKit Extension
//
//  Created by 심우경 on 2021/11/14.
//

import WatchKit
import Foundation

var redScore = 0
var blueScore = 0

var redGame = 0
var blueGame = 0

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var redLabel: WKInterfaceLabel!
    @IBOutlet weak var blueLabel: WKInterfaceLabel!
    
    @IBOutlet weak var redBtn_Outlet: WKInterfaceButton!
    @IBOutlet weak var blueBtn_Outlet: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        setTitle("Score Board")
        setLabel()
        
        serveLabel()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    func setLabel() {
        redLabel.setText(String(redGame))
        blueLabel.setText(String(blueGame))
        
        redBtn_Outlet.setTitle(String(redScore))
        blueBtn_Outlet.setTitle(String(blueScore))
    }
    
    func serveLabel() {
        let serveCount = redScore + blueScore + 1
        let gamePointCount = redGame + blueGame
        
        if (serveCount >= 22) {
            if (serveCount % 2 == 0) {
                setLabelColor(team: gamePointCount % 2 == 1)
            }
            
            else {
                setLabelColor(team: gamePointCount % 2 == 0)
            }
        }
        
        else {
            if (serveCount % 4 <= 2 && serveCount % 4 != 0) {
                setLabelColor(team: gamePointCount % 2 == 0)
            }
            
            else {
                setLabelColor(team: gamePointCount % 2 == 1)
            }
        }
    }
    
    func setLabelColor(team : Bool) {
        if (team) {
            //Red -> Yellow (True)
            
            redLabel.setTextColor(UIColor.yellow)
            blueLabel.setTextColor(UIColor.white)
        }
        
        else {
            //blue -> Yellow (False)
            
            blueLabel.setTextColor(UIColor.yellow)
            redLabel.setTextColor(UIColor.white)
        }
    }
    
    @IBAction func redBtn() {
        redScore = redScore + 1
        
        serveLabel()
        
        if (redScore >= 11 && redScore - blueScore >= 2) {
            redGame = redGame + 1
            redScore = 0
            blueScore = 0
            
            setLabel()
        }
        
        redBtn_Outlet.setTitle(String(redScore))
    }
    
    @IBAction func blueBtn() {
        blueScore = blueScore + 1
        
        serveLabel()
        
        if (blueScore >= 11 && blueScore - redScore >= 2) {
            blueGame = blueGame + 1
            redScore = 0
            blueScore = 0
            
            setLabel()
        }
        
        blueBtn_Outlet.setTitle(String(blueScore))
    }
    
    @IBAction func Reset() {
        redScore = 0
        blueScore = 0
        redGame = 0
        blueGame = 0
        
        setLabel()
    }
}
