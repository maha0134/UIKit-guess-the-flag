//
//  ViewController.swift
//  guess the flag - UIkit
//
//  Created by AKSHAY MAHAJAN on 2023-05-24.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var button1: UIButton!
	@IBOutlet var button2: UIButton!
	@IBOutlet var button3: UIButton!
	@IBOutlet var label: UILabel!
	
	var countries = [String]()
	var score = 0
	var correctAnswer = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(showScore))
		countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia",
		"spain", "uk", "us"]
		button1.layer.borderWidth = 0.5
		button2.layer.borderWidth = 0.5
		button3.layer.borderWidth = 0.5
		
		button1.layer.borderColor = UIColor.lightGray.cgColor
		button2.layer.borderColor = UIColor.lightGray.cgColor
		button3.layer.borderColor = UIColor.lightGray.cgColor
		
		askQuestion()
	}
	
	func askQuestion(action: UIAlertAction! = nil) {
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
		button1.setImage(UIImage(named: countries[0]), for: .normal)
		button2.setImage(UIImage(named: countries[1]), for: .normal)
		button3.setImage(UIImage(named: countries[2]), for: .normal)
		label.text = "Score: \(score)"
		title = "Guess the flag of \(countries[correctAnswer].uppercased())"
	}
	
	@IBAction func buttonTapped(_ sender: UIButton) {
		var title: String
		var message: String
		if sender.tag == correctAnswer {
			title = "Correct!"
			score += 1
			message = "Your score is \(score)"
		} else {
			title = "Wrong"
			if score > 0 {
				score -= 1
			}
			message = "Oops! That's the flag of \(countries[sender.tag].uppercased())\nYour score is \(score)"
		}
		
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
		present(ac, animated: true)
	}
	
	@objc func showScore() {
		let ac = UIAlertController(title: "Score", message: "Your score is \(score)", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default))
		present(ac, animated: true)
	}
	
}

