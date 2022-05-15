//
//  Questions.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 14.05.2022.
//

import Foundation

struct Question {
    let difficulty: Int
    let question: String
    let answers: [String]
    let rightAnswer: Int
}

private let question1 = Question(difficulty: 1, question: "Which of these is NOT a mathematical concept or term?", answers: ["Standard Deviation", "Pi", "Median", "Factorial Reduction"], rightAnswer: 4)
private let question2 = Question(difficulty: 1, question: "Which scientist discovered penicillin?", answers: ["Marie Curie", "Alexander Fleming", "Robert Koch", "Me, on the orange in the back of the fridge"], rightAnswer: 2)
private let question3 = Question(difficulty: 1, question: "In what city is Copacabana Beach located?", answers: ["Rio de Janeiro", "San Paolo", "Miami", "Gdansk"], rightAnswer: 1)
private let question4 = Question(difficulty: 1, question: "Which of these cars is a Ford model?", answers: ["Ka", "Astra", "Karoq", "Beardsley"], rightAnswer: 1)
private let question5 = Question(difficulty: 1, question: "Which of these culinary names is the odd one out?", answers: ["Kiev", "au Vin", "a l'Orange", "Cordon Bleu"], rightAnswer: 3)
private let question6 = Question(difficulty: 2, question: "How many times did Pete Sampras win Wimbledon?", answers: ["8", "5", "7", "2"], rightAnswer: 3)
private let question7 = Question(difficulty: 2, question: "Who won the Brit Award for International Female Solo Artist in 2020?", answers: ["Billie Eilish", "Lana Del Rey", "Ariana Grande", "Enya"], rightAnswer: 1)
private let question8 = Question(difficulty: 2, question: "Who was the bass guitarist in Queen?", answers: ["Roger Taylor", "John Illsley", "John Deacon", "Freddie Mercury"], rightAnswer: 3)
private let question9 = Question(difficulty: 2, question: "What is the name of the tortoise in the kids TV series Peppa Pig?", answers: ["Tiddles", "Tilly", "Tommy", "Mr. Slow"], rightAnswer: 1)
private let question10 = Question(difficulty: 2, question: "In Bingo, what number is represented by the phrase ‘Christmas cake’?", answers: ["25", "38", "68", "7"], rightAnswer: 2)
private let question11 = Question(difficulty: 3, question: "Which 2 countries share the longest border in the world?", answers: ["Chile & Argentina", "Russia & China", "USA & Canada", "Scotland & Paraguay"], rightAnswer: 3)
private let question12 = Question(difficulty: 3, question: "Name the largest island in the world", answers: ["Madagascar", "Australia", "Greenland", "Canvey Island, Essex"], rightAnswer: 3)
private let question13 = Question(difficulty: 3, question: "Which is the earliest of these films starring Simon Pegg?", answers: ["Hot Fuzz", "Shaun of the Dead", "Run, Fat Boy, Run", "Paul"], rightAnswer: 2)
private let question14 = Question(difficulty: 3, question: "How many teeth does a crocodile have?", answers: ["126-134", "250-260", "64-68", "16-20"], rightAnswer: 3)
private let question15 = Question(difficulty: 3, question: "Which fruit is a cross between a blackberry and a raspberry?", answers: ["Tayberry", "Loganberry", "Gooseberry", "Black-Ras"], rightAnswer: 1)

let questionsSet: [Question] = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15]
