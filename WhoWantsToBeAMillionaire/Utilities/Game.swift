//
//  Game.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 15.05.2022.
//

import Foundation

class Game {
    static let shared = Game()
    private let recordsCaretaker = RecordsCaretaker()
    private let userQuestionsCaretaker = UserQuestionsCaretaker()
    var gameSession: GameSession?
    private init() { }
    
    var records = [Record]() {
        didSet {
            recordsCaretaker.save(records: records)
        }
    }
    
    var userQuestions = [Question]() {
        didSet {
            userQuestionsCaretaker.save(questions: userQuestions)
            print(userQuestions)
        }
    }
    
    func addRecord(record: Record ) {
        self.records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
    
    func addQuestions(questions: [Question]) {
        self.userQuestions.append(contentsOf: questions)
    }
    
    func clearUserQuestions() {
        userQuestions = []
    }
}

extension Game: GameSceneDelegate {
    func didEndGame(difficulty: Difficulty, withScore score: Int, name: String, removeTwoUsed: Bool, callFriendUsed: Bool, audienceHelpUsed: Bool) {
        let newRecord = Record(difficulty: difficulty, name: name, date: Date(), score: score, removeTwoUsed: removeTwoUsed, callFriendUsed: callFriendUsed, audienceHelpUsed: audienceHelpUsed)
        Game.shared.addRecord(record: newRecord)
    }
}

extension Game: AddQuestionControllerDelegate {
    func didTapAddQuestions(questions: [Question]) {
        Game.shared.addQuestions(questions: questions)
    }
}


