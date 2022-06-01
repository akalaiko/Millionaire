//
//  NetworkServiceProxy.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 01.06.2022.
//

import Foundation

class NetworkServiceProxy {
    
    let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetch(difficulty: Difficulty, completion: @escaping ([Question]) -> Void) {
        print ("I'm sending a request to get questions of \(difficulty.rawValue) difficulty from database")
        networkService.fetch(difficulty: difficulty, completion: completion)
    }
}
