//
//  AddQuestionController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 19.05.2022.
//
//AddQuestionCell
import UIKit

protocol AddQuestionControllerDelegate: AnyObject {
    func didTapAddQuestions(questions: [Question])
}

final class AddQuestionController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func addOneMoreQuestion(_ sender: Any) {
        guard numberOfQuestions < 3 else {
            let ac = UIAlertController(title: "Relax, cowboy!", message: "Even 🧞‍♂️ gives only 3 wishes. ", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
            return
        }
        numberOfQuestions += 1
        tableView.reloadData()
    }
    @IBAction func addQuestionsToDatabase(_ sender: Any) {
        if setupBuilder() {
            delegate?.didTapAddQuestions(questions: builder.build(questionNumbers: numberOfQuestions))
            let ac = UIAlertController(title: "Done", message: "Questions were added to database", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: exitToMainMenu))
            present(ac, animated: true)
        }
    }
    
    private var errorAlertController: UIAlertController {
        let alert = UIAlertController(title: "Error", message: "Please check if all the lines are filled", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(cancelAction)
        return alert
    }
    
    private let builder = QuestionBuilder()
    
    weak var delegate: AddQuestionControllerDelegate?
    
    @IBOutlet var tableView: UITableView!
    
    private var numberOfQuestions = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        delegate = Game.shared
        tableView.register(AddQuestionCell.self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { numberOfQuestions }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AddQuestionCell = tableView.dequeueReusableCell(for: indexPath)
        cell.questionNumberLabel.text = "Question #\(indexPath.row + 1)"
        return cell
    }

    func setupBuilder() -> Bool {
        for number in 0..<numberOfQuestions {
            let indexPath: IndexPath = [0, number]
            if let cell = tableView.cellForRow(at: indexPath) as? AddQuestionCell {
                if let question = cell.question.text {
                    guard question != "" else {
                        present(errorAlertController, animated: true)
                        return false
                    }
                    builder.setQuestion(question, number: number)
                }
                
                var answers: [String] = []
                if let answerA = cell.answerA.text {
                    guard answerA != "" else {
                        present(errorAlertController, animated: true)
                        return false
                    }
                    answers.append(answerA)
                }
                if let answerB = cell.answerB.text {
                    guard answerB != "" else {
                        present(errorAlertController, animated: true)
                        return false
                    }
                    answers.append(answerB)
                }
                if let answerC = cell.answerC.text {
                    guard answerC != "" else {
                        present(errorAlertController, animated: true)
                        return false
                    }
                    answers.append(answerC)
                }
                if let answerD = cell.answerD.text {
                    guard answerD != "" else {
                        present(errorAlertController, animated: true)
                        return false
                    }
                    answers.append(answerD)
                }
                builder.setAnswers(answers, number: indexPath.row)
                builder.setRightAnswer(cell.rightAnswerSelector.selectedSegmentIndex + 1, number: indexPath.row)
                switch cell.difficultySelector.selectedSegmentIndex {
                case 0: builder.setDifficulty(.easy, number: indexPath.row)
                case 1: builder.setDifficulty(.hard, number: indexPath.row)
                default: builder.setDifficulty(.easy, number: indexPath.row)
                }
            }
        }
        return true
    }
    
    func exitToMainMenu(action: UIAlertAction! = nil) {
        navigationController?.popViewController(animated: true)
    }
}
