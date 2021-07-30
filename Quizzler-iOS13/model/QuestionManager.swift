//
//  QuestionManager.swift
//  Quizzler-iOS13
//
//  Created by Thiago Antonio Ramalho on 30/07/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuestionManager {
    
    private var questionNumber = -1
    private (set)var score = 0
    
    private let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
 
    mutating func nextQuestion() -> Question {
        
        questionNumber+=1
        
        if(questionNumber >= quiz.count) {
            questionNumber = 0
            score = 0
        }
        
        return quiz[questionNumber]
    }
    
    mutating func verifyQuestion(answer: String) -> Bool {
        
        let result = quiz[questionNumber].correct == answer
        
        if result {
            score += 1
        }
        
        return result
    }
    
    func progress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
}
