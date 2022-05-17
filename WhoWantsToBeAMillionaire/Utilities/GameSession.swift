//
//  GameSession.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 15.05.2022.
//

import Foundation

class GameSession {
    var difficulty: Difficulty = .hard
    var questionNumber: Int = 0
    var playerName: String = ""
    var removeTwoUsed = false
    var callFriendUsed = false
    var audienceHelpUsed = false
}
