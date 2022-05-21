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
        case .hard: return HardModeStrategy()
        case .insane: return InsaneModeStrategy()
        }
    }
    
    // MARK: - Construction
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    
    // MARK: - Functions
    
    func setupGame(lifelineButtons: [UIButton]) -> [Question] {
        return chooseDifficultyStrategy.setupGame(lifelineButtons: lifelineButtons)
    }
}
