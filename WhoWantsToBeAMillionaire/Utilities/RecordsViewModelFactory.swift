//
//  RecordsViewModelFactory.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 24.05.2022.
//

import UIKit

final class RecordsViewModelFactory {
    
    private let dateFormater: DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        return dateFormater
    }()
    
    func createViewModels(from records: [Record]) -> [RecordsViewModel] {
        return records.compactMap(self.viewModel)
    }
    
    func viewModel(from record: Record) -> RecordsViewModel {
        
        let name = record.name
        let date = self.dateFormater.string(from: record.date)
        var lifelinesUsedCount: Int {
            var number = 0
            if record.removeTwoUsed { number += 1 }
            if record.callFriendUsed { number += 1 }
            if record.audienceHelpUsed { number += 1 }
            return number
        }
        let score = record.score
        var lifelineOneImage: UIImage? = nil
        var lifelineTwoImage: UIImage? = nil
        var lifelineThreeImage: UIImage? = nil
        
        switch lifelinesUsedCount {
        case 1:
            if record.removeTwoUsed { lifelineOneImage = UIImage(named: "5050") }
            if record.callFriendUsed { lifelineOneImage = UIImage(named: "call") }
            if record.audienceHelpUsed { lifelineOneImage = UIImage(named: "audience") }
        case 2:
            if record.removeTwoUsed {
                lifelineOneImage = UIImage(named: "5050")
                lifelineTwoImage = record.callFriendUsed ? UIImage(named: "call") : UIImage(named: "audience")
            } else {
                lifelineOneImage = UIImage(named: "call")
                lifelineTwoImage = UIImage(named: "audience")
            }
        case 3:
            lifelineOneImage = UIImage(named: "5050")
            lifelineTwoImage = UIImage(named: "call")
            lifelineThreeImage = UIImage(named: "audience")
        default: break
        }
        
        
        return RecordsViewModel(name: name,
                                date: date,
                                score: score,
                                lifelinesUsedCount: lifelinesUsedCount,
                                lifelineOneImage: lifelineOneImage,
                                lifelineTwoImage: lifelineTwoImage,
                                lifelineThreeImage: lifelineThreeImage)
    }
    
}

struct RecordsViewModel {
    let name: String
    let date: String
    let score: Int
    var lifelinesUsedCount: Int
    var lifelineOneImage: UIImage? = nil
    var lifelineTwoImage: UIImage? = nil
    var lifelineThreeImage: UIImage? = nil
}

