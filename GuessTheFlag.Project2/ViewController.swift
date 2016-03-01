//
//  ViewController.swift
//  GuessTheFlag.Project2
//
//  Created by User on 3/1/16.
//  Copyright © 2016 Elijah Buters. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    // Outlets

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }
    
    func askQuestion() {
        
        // Randomise the order of the countries
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        // Set Images on buttons
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // Generate a random number between 0 and 2
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions

    @IBAction func buttonTapped(sender: AnyObject) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
    }

}

