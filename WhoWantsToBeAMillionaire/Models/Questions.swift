//
//  Questions.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 14.05.2022.
//

import Foundation

struct Question {
    let difficulty: Difficulty
    let question: String
    let answers: [String]
    let rightAnswer: Int
}

private let question1 = Question(difficulty: .hard, question: "Which of these is NOT a mathematical concept or term?", answers: ["Standard Deviation", "Pi", "Median", "Factorial Reduction"], rightAnswer: 4)
private let question2 = Question(difficulty: .hard, question: "Which scientist discovered penicillin?", answers: ["Marie Curie", "Alexander Fleming", "Robert Koch", "Me, on the orange in the back of the fridge"], rightAnswer: 2)
private let question3 = Question(difficulty: .hard, question: "In what city is Copacabana Beach located?", answers: ["Rio de Janeiro", "San Paolo", "Miami", "Gdansk"], rightAnswer: 1)
private let question4 = Question(difficulty: .hard, question: "Which of these cars is a Ford model?", answers: ["Ka", "Astra", "Karoq", "Beardsley"], rightAnswer: 1)
private let question5 = Question(difficulty: .hard, question: "Which of these culinary names is the odd one out?", answers: ["Kiev", "au Vin", "a l'Orange", "Cordon Bleu"], rightAnswer: 3)
private let question6 = Question(difficulty: .hard, question: "How many times did Pete Sampras win Wimbledon?", answers: ["8", "5", "7", "2"], rightAnswer: 3)
private let question7 = Question(difficulty: .hard, question: "Who won the Brit Award for International Female Solo Artist in 2020?", answers: ["Billie Eilish", "Lana Del Rey", "Ariana Grande", "Enya"], rightAnswer: 1)
private let question8 = Question(difficulty: .hard, question: "Who was the bass guitarist in Queen?", answers: ["Roger Taylor", "John Illsley", "John Deacon", "Freddie Mercury"], rightAnswer: 3)
private let question9 = Question(difficulty: .hard, question: "What is the name of the tortoise in the kids TV series Peppa Pig?", answers: ["Tiddles", "Tilly", "Tommy", "Mr. Slow"], rightAnswer: 1)
private let question10 = Question(difficulty: .hard, question: "In Bingo, what number is represented by the phrase ‘Christmas cake’?", answers: ["25", "38", "68", "7"], rightAnswer: 2)
private let question11 = Question(difficulty: .hard, question: "Which 2 countries share the longest border in the world?", answers: ["Chile & Argentina", "Russia & China", "USA & Canada", "Scotland & Paraguay"], rightAnswer: 3)
private let question12 = Question(difficulty: .hard, question: "Name the largest island in the world", answers: ["Madagascar", "Australia", "Greenland", "Canvey Island, Essex"], rightAnswer: 3)
private let question13 = Question(difficulty: .hard, question: "Which is the earliest of these films starring Simon Pegg?", answers: ["Hot Fuzz", "Shaun of the Dead", "Run, Fat Boy, Run", "Paul"], rightAnswer: 2)
private let question14 = Question(difficulty: .hard, question: "How many teeth does a crocodile have?", answers: ["126-134", "250-260", "64-68", "16-20"], rightAnswer: 3)
private let question15 = Question(difficulty: .hard, question: "Which fruit is a cross between a blackberry and a raspberry?", answers: ["Tayberry", "Loganberry", "Gooseberry", "Black-Ras"], rightAnswer: 1)


private let question16 = Question(difficulty: .easy, question: "How many legs does a spider have?", answers: ["Eight", "Nine", "Ten", "Two"], rightAnswer: 1)
private let question17 = Question(difficulty: .easy, question: "What is the name of the toy cowboy in Toy Story?", answers: ["Watery", "Woody ", "Stony", "Bob"], rightAnswer: 2)
private let question18 = Question(difficulty: .easy, question: "What is the color of an emerald?", answers: ["Red", "White", "Blue", "Green"], rightAnswer: 4)
private let question19 = Question(difficulty: .easy, question: "What is something you hit with a hammer?", answers: ["A finger", "A nail", "A feet", "A hand"], rightAnswer: 2)
private let question20 = Question(difficulty: .easy, question: "Whose nose grew longer every time he lied?", answers: ["Pinocchio", "Woody", "Dorian Grey", "Inspector Gadget"], rightAnswer: 1)
private let question21 = Question(difficulty: .easy, question: "What is the name of the fairy in Peter Pan?", answers: ["Anastasia", "Elsa", "Tinkerbell", "Jia Lissa"], rightAnswer: 3)
private let question22 = Question(difficulty: .easy, question: "Where does the President of the United States live while in office?", answers: ["The White House", "The Yellow House ", "The Red House ", "The Black House "], rightAnswer: 1)
private let question23 = Question(difficulty: .easy, question: "How many planets are in our solar system?", answers: ["Seven", "Zero", "Nine", "Eight"], rightAnswer: 4)
private let question24 = Question(difficulty: .easy, question: "Which Disney movie is Elsa in?", answers: ["Ice", "Frozen ", "Up", "Shrek"], rightAnswer: 2)
private let question25 = Question(difficulty: .easy, question: "Where does Santa Claus live?", answers: ["The North Pole", "The East Pole", "The South Pole", "The West Pole"], rightAnswer: 1)
private let question26 = Question(difficulty: .easy, question: "Which state is famous for Hollywood?", answers: ["California", "Texas", "Ohio", "London"], rightAnswer: 1)
private let question27 = Question(difficulty: .easy, question: "What type of fish is Nemo?", answers: ["A megafish", "A clownfish", "A catfish", "A crowfish"], rightAnswer: 2)
private let question28 = Question(difficulty: .easy, question: "What is the color of a school bus?", answers: ["Black", "Green", "Yellow", "Red"], rightAnswer: 3)
private let question29 = Question(difficulty: .easy, question: "What do you use to write on a blackboard?", answers: ["Chalk", "Chick", "Chimp", "Charcoal"], rightAnswer: 1)
private let question30 = Question(difficulty: .easy, question: "If you freeze water, what do you get?", answers: ["Ice", "Fire", "You can’t freeze water", "Liquid nitrogen"], rightAnswer: 1)


let questionsSet: [Question] = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12, question13, question14, question15]
let questionsSetEasy: [Question] = [question16, question17, question18, question19, question20, question21, question22, question23, question24, question25, question26, question27, question28, question29, question30]
