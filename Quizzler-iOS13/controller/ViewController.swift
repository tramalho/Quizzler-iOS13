//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    @IBOutlet weak var third: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    private lazy var questionManager: QuestionManager = {
        return QuestionManager()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func touch(_ sender: UIButton) {
        
        if let answer = sender.currentTitle {
            let correct = questionManager.verifyQuestion(answer: answer)
            
            if correct {
                sender.backgroundColor = UIColor.systemGreen
            } else {
                sender.backgroundColor = UIColor.systemRed
            }
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc
    private func updateUI() {
        let q = questionManager.nextQuestion()
  
        score.text = "Score: \(questionManager.score)"
        
        question.text = q.text
        
        updateButton(button: first, title: q.answer[0])
        updateButton(button: second, title: q.answer[1])
        updateButton(button: third, title: q.answer[2])
        
        progressView.progress = questionManager.progress()
    }
    
    private func updateButton(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.backgroundColor = .clear
    }
}

