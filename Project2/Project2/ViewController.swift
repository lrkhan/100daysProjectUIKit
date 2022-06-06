//
//  ViewController.swift
//  Project2
//
//  Created by Luthfor Khan on 6/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    var countries = [String]()
    var correctAns = 0
    var score = 0
    var numQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAns = Int.random(in: 0...2)
        
        title = "\(countries[correctAns].uppercased())  - Score: \(score)"
    }
    
    func resetGame(action: UIAlertAction! = nil) {
        numQuestions = 0
        score = 0
        
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        numQuestions += 1
        var title: String
        
        if sender.tag == correctAns {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong. You clicked \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        var ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        if numQuestions > 9 {
            title = "Reset Game?"
            
            ac = UIAlertController(title: title, message: "Your Final Score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Restart", style: .destructive, handler: resetGame))
        }
        
        present(ac, animated: true)
    }
}

