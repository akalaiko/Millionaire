//
//  DifficultySettingsFacade.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 21.05.2022.
//

import UIKit

final class DifficultySettingsFacade {
    let difficulty: Difficulty
    
    // MARK: - Strategies
    
    private var chooseDifficultyStrategy: ChooseDiffilultyStrategy {
        switch difficulty {
        case .easy: return EasyModeStrategy()
        case .medium: return MediumModeStrategy()
        case .hard: return HardModeStrategy()
        }
    }
    
    // MARK: - Construction
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    
    // MARK: - Functions
    
    func setupGame() -> [Question] {
        return chooseDifficultyStrategy.setupGame()
    }
}
