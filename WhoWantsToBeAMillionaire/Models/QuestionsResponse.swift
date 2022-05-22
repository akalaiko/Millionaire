//
//  QuestionsResponse.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 22.05.2022.
//

import Foundation

struct QuestionsResponse: Codable {
    let results: [Question]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
