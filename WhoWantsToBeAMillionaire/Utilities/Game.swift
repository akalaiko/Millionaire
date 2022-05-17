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
    var gameSession: GameSession?
    private init() { }
    
    var records = [Record]() {
        didSet {
            recordsCaretaker.save(records: records)
        }
    }
    
    func addRecord(record: Record ) {
        self.records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
}

extension Game: GameSceneDelegate {
    func didEndGame(withScore score: Int, name: String, removeTwoUsed: Bool, callFriendUsed: Bool, audienceHelpUsed: Bool) {
        let newRecord = Record(name: name, date: Date(), score: score, removeTwoUsed: removeTwoUsed, callFriendUsed: callFriendUsed, audienceHelpUsed: audienceHelpUsed)
        Game.shared.addRecord(record: newRecord)
    }
}

struct Record: Codable {
    let name: String
    let date: Date
    let score: Int
    var removeTwoUsed: Bool
    var callFriendUsed: Bool
    var audienceHelpUsed: Bool
}
