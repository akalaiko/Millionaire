//
//  Questions.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 14.05.2022.
//

import Foundation
import UIKit

struct Question: Codable {
    let difficulty: Difficulty
    let question: String
    let incorrectAnswers: [String]
    let correctAnswer: String
    var answers: [String] = []
    var correctAnswerNumber = Int()
    
    enum CodingKeys: String, CodingKey {
        case difficulty
        case question
        case incorrectAnswers = "incorrect_answers"
        case correctAnswer = "correct_answer"
    }
    
    init (difficulty: Difficulty, question: String, incorrectAnswers: [String], correctAnswer: String) {
        self.difficulty = difficulty
        self.question = question.htmlDecoded
        var decodingAnswersTemporaryArray: [String] = []
        incorrectAnswers.forEach { answer in decodingAnswersTemporaryArray.append(answer.htmlDecoded) }
        self.incorrectAnswers = decodingAnswersTemporaryArray
        self.correctAnswer = correctAnswer.htmlDecoded
        self.answers = {
                var answers = [String]()
                answers.append(correctAnswer)
                answers.append(contentsOf: incorrectAnswers)
                return answers.shuffled()
        }()
        self.correctAnswerNumber = {
            guard let number = answers.firstIndex(of: correctAnswer) else { return 404}
            return number + 1
        }()
    }
    
    init (difficulty: Difficulty, question: String, answers: [String], correctAnswerNumber: Int) {
        self.difficulty = difficulty
        self.question = question
        self.answers = answers
        self.correctAnswerNumber = correctAnswerNumber
        self.incorrectAnswers = {
            var incorrectAnswers = answers
            incorrectAnswers.remove(at: correctAnswerNumber)
            return incorrectAnswers
        }()
        self.correctAnswer = {
            answers[correctAnswerNumber]
        }()
    }
}

