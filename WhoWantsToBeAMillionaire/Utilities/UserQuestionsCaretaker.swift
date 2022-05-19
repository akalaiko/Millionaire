//
//  UserQuestionsCaretaker.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 19.05.2022.
//

import Foundation

class UserQuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questions"
    
    func save(questions: [Question]) {
        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func getDatabase() -> [Question] {
        guard let data = UserDefaults.standard.value(forKey: key) as? Data else { return [] }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
