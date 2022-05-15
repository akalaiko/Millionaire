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
    func didEndGame(withScore score: Int) {
        let newRecord = Record(score: score, date: Date())
        Game.shared.addRecord(record: newRecord)
    }
}

struct Record: Codable {
    let score: Int
    let date: Date
}
