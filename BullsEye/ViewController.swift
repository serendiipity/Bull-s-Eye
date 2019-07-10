//
//  ViewController.swift
//  BullsEye
//
//  Created by imane on 6/15/19.
//  Copyright © 2019 imane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var value = 0
    var target = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    @IBOutlet weak var roundValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        value = Int(slider.value)
        startOver()
    }
    
    @IBAction func showAlert() {
        let difference = abs(target - value)
        let points = 100 - difference
        score += points
        let message = "The value of the slider is \(value) and the difference is \(difference)"
        let alert = UIAlertController(title: "Slider value", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "done", style: .default, handler: {
            action in
             self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func setValue(_ slider: UISlider) {
        value = Int(slider.value)
    }
    
    func startNewRound() {
        target = Int.random(in: 1...100)
        value = 50
        round += 1
        slider.value = Float(value)
        updateLabels()
    }
    
    func updateLabels() {
        targetValueLabel.text = String(target)
        scoreValueLabel.text = String(score)
        roundValueLabel.text = String(round)
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
    }


}

