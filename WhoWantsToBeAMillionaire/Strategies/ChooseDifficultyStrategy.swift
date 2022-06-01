//
//  ChooseDifficultyStrategy.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 17.05.2022.
//

import UIKit

protocol ChooseDiffilultyStrategy {
    var proxy: NetworkServiceProxy { get }
    var questionSet: [Question] { get set }
    func setupGame() -> [Question]
}

final class EasyModeStrategy: ChooseDiffilultyStrategy {
    var proxy = NetworkServiceProxy(networkService: NetworkService.instance)
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        proxy.fetch(difficulty: .easy, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}

final class MediumModeStrategy: ChooseDiffilultyStrategy {
    var proxy = NetworkServiceProxy(networkService: NetworkService.instance)
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        proxy.fetch(difficulty: .medium, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}

final class HardModeStrategy: ChooseDiffilultyStrategy {
    var proxy = NetworkServiceProxy(networkService: NetworkService.instance)
    var questionSet: [Question] = []
    
    func setupGame() -> [Question] {
        proxy.fetch(difficulty: .hard, completion: { [weak self] results in self?.questionSet = results} )

        return questionSet
    }
}
