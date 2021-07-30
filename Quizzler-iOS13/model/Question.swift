//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Thiago Antonio Ramalho on 30/07/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    private(set) var text: String
    private(set) var answer: [String]
    private(set) var correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correct = correctAnswer
    }
}

