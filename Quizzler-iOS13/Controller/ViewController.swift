//
//  ViewController.swift
//  Quizzler-iOS13
//

import UIKit

class ViewController: UIViewController {
    //outlets : we can change everythin in the screen through these outlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //show the question text when the view is loaded
        updateUI()
    }
    
   

    //Action buttons : this code will be triggered when either of our buttons are pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        //what answer the use choose
        let userAnswer = sender.currentTitle! //True, False
        //answer property of Question Structure
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
     
        //check if the user got the answer right?
        if userGotItRight {
            //Correct answer changes the background color to green
            sender.backgroundColor = UIColor.green
        }else {
            //Wrong answer changes the background color to red
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //timer code
        //we only need the timer to run once so set the repeats: false
       Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        //updateUI() = update the Q label based on the Q number
    }
    //This function, updates the question label based on the current question number
    //because of #selector we have to add @objc to the updateUI function. it's part of an objective c
    
    @objc func updateUI (){
       
        //grabbing the question text to display
        questionLabel.text = quizBrain.getQuestionText()
        //calculating the user progress
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        //reset the background color when moving to the next question
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        //progress bar
        
        
        
    }
    
}
