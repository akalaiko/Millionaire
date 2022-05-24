//
//  UserQuestionsDatabaseController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 19.05.2022.
//

import UIKit

final class UserQuestionsDatabase: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    @IBAction func clearButtonpressed(_ sender: Any) {
        let ac = UIAlertController(title: "Are you sure?", message: "All questions will be deleted from database", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: clearQuestionsDatabase))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { Game.shared.userQuestions.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { setupCell(for: indexPath) }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Game.shared.userQuestions.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    // MARK: - Private functions
    
    private func setupCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userQuestionCell", for: indexPath)
        let question = Game.shared.userQuestions[indexPath.row]
        var rightAnswerLetter: String {
            switch question.correctAnswerNumber {
            case 1: return "A"
            case 2: return "B"
            case 3: return "C"
            case 4: return "D"
            default: return "error"
            }
        }
        cell.textLabel?.text = """
                            Question#\(indexPath.row + 1): \(question.question)
                            Answers:
                                A: \(question.answers[0])
                                B: \(question.answers[1])
                                C: \(question.answers[2])
                                D: \(question.answers[3])
                            Right Answer: \(rightAnswerLetter)
                            Difficulty: \(question.difficulty.rawValue)
                            """
        cell.textLabel?.numberOfLines = 10
        cell.textLabel?.textColor = .amazingColor
        cell.selectionStyle = .none
        
        return cell
    }
    
    private func clearQuestionsDatabase(action: UIAlertAction! = nil) {
        Game.shared.clearUserQuestions()
        self.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
