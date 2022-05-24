//
//  ChooseDifficultyStrategy.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 17.05.2022.
//

import UIKit

protocol ChooseDiffilultyStrategy {
    var networkService: NetworkService { get }
    var questionSet: [Question] { get set }
    func setupGame() -> [Question]
}

final class EasyModeStrategy: ChooseDiffilultyStrategy {
    var networkService: NetworkService = NetworkService.instance
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        networkService.fetch(difficulty: .easy, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}

final class MediumModeStrategy: ChooseDiffilultyStrategy {
    var networkService: NetworkService = NetworkService.instance
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        networkService.fetch(difficulty: .medium, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}

final class HardModeStrategy: ChooseDiffilultyStrategy {
    var networkService: NetworkService = NetworkService.instance
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        networkService.fetch(difficulty: .hard, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}
