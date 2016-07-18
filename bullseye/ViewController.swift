//
//  ViewController.swift
//  bullseye
//
//  Created by Estella Lai on 7/16/16.
//  Copyright © 2016 Estella Lai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 25
    var totalScore: Int = 0
    var targetValue: Int = 50
    var roundNumber: Int = 1
    
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        refreshTarget()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshTarget() {
        targetValue = 1 + Int(arc4random_uniform(100))
        targetLabel.text = String(targetValue)
    }
    
    func refreshScore() {
        let difference = 100 - abs(currentValue - targetValue)
        totalScore += difference
        scoreLabel.text = String(totalScore)
    }
    
    func increaseRound() {
        roundNumber += 1
        roundLabel.text = String(roundNumber)
    }
    
    func clearScore() {
        totalScore = 0
        scoreLabel.text = String(totalScore)
    }
    
    @IBAction func startOver() {
        roundNumber = 0
        increaseRound()
        refreshTarget()
        clearScore()
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"
        let alert = UIAlertController(title: "Your Result",
                                      message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        refreshScore()
        refreshTarget()
        increaseRound()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    

}

