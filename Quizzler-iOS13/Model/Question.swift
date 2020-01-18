//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by J A on 2020-01-17.
//  Copyright © 2020 The App Brewery. All rights reserved.
//
//Model is the logic and data

import Foundation

struct Question {
    let text: String
    let answer: String
    
    
    //create a custome initializer
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
