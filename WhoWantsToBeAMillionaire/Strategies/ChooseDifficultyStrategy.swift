//
//  ChooseDifficultyStrategy.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 17.05.2022.
//

import UIKit

protocol ChooseDiffilultyStrategy {
    var networkAdapter: NetworkAdapter { get }
    var questionSet: [Question] { get set }
    func setupGame() -> [Question]
}

final class EasyModeStrategy: ChooseDiffilultyStrategy {
    var networkAdapter = NetworkAdapter()
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        networkAdapter.getQuestionsSet(for: .easy, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}

final class MediumModeStrategy: ChooseDiffilultyStrategy {
    var networkAdapter = NetworkAdapter()
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        networkAdapter.getQuestionsSet(for: .medium, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}

final class HardModeStrategy: ChooseDiffilultyStrategy {
    var networkAdapter = NetworkAdapter()
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        networkAdapter.getQuestionsSet(for: .hard, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}
