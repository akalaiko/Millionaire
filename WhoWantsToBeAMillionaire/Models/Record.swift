//
//  Record.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 20.05.2022.
//

import Foundation

struct Record: Codable {
    let difficulty: Difficulty
    let name: String
    let date: Date
    let score: Int
    let removeTwoUsed: Bool
    let callFriendUsed: Bool
    let audienceHelpUsed: Bool
}
