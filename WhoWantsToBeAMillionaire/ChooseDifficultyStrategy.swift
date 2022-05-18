//
//  ChooseDifficultyStrategy.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 17.05.2022.
//

import UIKit

protocol ChooseDiffilultyStrategy {
    func setupGame(lifelineButtons: [UIButton]) -> [Question]
}

final class EasyModeStrategy: ChooseDiffilultyStrategy {
    func setupGame(lifelineButtons: [UIButton]) -> [Question] {
        lifelineButtons.forEach({ $0.isEnabled = true })
        return questionsSetEasy
    }
}

final class HardModeStrategy: ChooseDiffilultyStrategy {
    func setupGame(lifelineButtons: [UIButton]) -> [Question] {
        lifelineButtons.forEach({ $0.isEnabled = true })
        return questionsSet
    }
}

final class InsaneModeStrategy: ChooseDiffilultyStrategy {
    func setupGame(lifelineButtons: [UIButton]) -> [Question] {
        lifelineButtons.forEach({ $0.isEnabled = false })
        return questionsSet
    }
}
