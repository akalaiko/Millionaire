//
//  NetworkService.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 22.05.2022.
//

import Foundation

class NetworkService {
    
    static let instance = NetworkService()
    private init() {}

    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "opentdb.com"
        constructor.path = "/api.php"
        constructor.queryItems = [
            URLQueryItem(name: "amount", value: "15"),
            URLQueryItem(name: "type", value: "multiple")
        ]
        return constructor
    }()

    func fetch(difficulty: Difficulty, completion: @escaping ([Question]) -> Void) {
        switch difficulty {
        case .easy:
            urlConstructor.queryItems?.append(URLQueryItem(name: "difficulty", value: "easy"))
        case .medium:
            urlConstructor.queryItems?.append(URLQueryItem(name: "difficulty", value: "medium"))
        case .hard:
            urlConstructor.queryItems?.append(URLQueryItem(name: "difficulty", value: "hard"))
        }
        guard let url = urlConstructor.url else { return }
        print(url)

        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
                do {
                    let json = try decoder.decode(QuestionsResponse.self, from: data)
                    var questions: [Question] = []
                    json.results.forEach { question in
                        questions.append(
                            Question(difficulty: question.difficulty,
                                     question: question.question,
                                     incorrectAnswers: question.incorrectAnswers,
                                     correctAnswer: question.correctAnswer))
                    }
                    print(questions)
                    completion(questions)
                } catch {
                    print(error)
                    completion([])
                }
        }

    }
}
