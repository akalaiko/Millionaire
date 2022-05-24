//
//  NetworkAdapter.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 24.05.2022.
//

import Foundation


final class NetworkAdapter {
    
    let networkService: NetworkService = NetworkService.instance
    
    func getQuestionsSet(for difficulty: Difficulty, completion: @escaping ([Question]) -> Void) {
        completion(networkService.fetch(difficulty: difficulty))
    }
}
