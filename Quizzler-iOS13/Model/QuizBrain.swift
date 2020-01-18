//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by J A on 2020-01-17.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    //link to the Question.swift file
    //We have an Array of question objects
    let quiz = [
        //initialize the Question structure in here
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    //variable to keep track of what questions the user is reading
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ UserAnswer: String) -> Bool {
        if UserAnswer == quiz[questionNumber].answer {
            //user got it right
            score += 1
            return true
        }else{
            //user got it wrong
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getQuestionText() -> String{
        //update the question text to a new question
        //grabbing the question text to display
        return quiz[questionNumber].text
    }
    
    func getProgress()-> Float{
        //current question number / total number of questions in the quiz arry
        //questionNumber keep tracks of whcih question the user is currently on
        //we add 1 to the questionNumber because we want the progress bar to start from 1 not 0.
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    //handles the question progression functionality
    mutating func nextQuestion() {
        //prevent the question number from being increased passed number 2
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else {
            questionNumber = 0
            score = 0 //reset the score when our quiz restarts
        }
    }
    
    
}
