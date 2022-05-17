//
//  GameScene.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 14.05.2022.
//
import UIKit

protocol GameSceneDelegate: AnyObject {
    func didEndGame(withScore score: Int, name: String, removeTwoUsed: Bool, callFriendUsed: Bool, audienceHelpUsed: Bool)
}

final class GameScene: UIViewController {
    
    weak var delegate: GameSceneDelegate?
    
    @IBOutlet var question: UILabel!
    @IBOutlet var progressIndicator: UIImageView!
    @IBOutlet var progressIndicatorConstraint: NSLayoutConstraint! {
        didSet {
            self.initialProgressIndicatorPosition = self.progressIndicatorConstraint.constant
        }
    }
    @IBOutlet var scoreLadder: UIImageView!
    @IBOutlet var answerA: UIButton!
    @IBOutlet var answerB: UIButton!
    @IBOutlet var answerC: UIButton!
    @IBOutlet var answerD: UIButton!
    var answerButtonsCollection = [UIButton]()
    
    @IBOutlet var removeTwoLifeline: UIButton!
    @IBOutlet var callFriendLifeline: UIButton!
    @IBOutlet var audienceHelpLifeline: UIButton!
    @IBOutlet var takeCashLifeline: UIButton!
    var lifelineButtonsCollection = [UIButton]()
    
    @IBAction func exitToMainMenuButton() {
        takeCash()
    }
    
    @IBAction func answerPressed(sender: UIButton!) {
        hideQuestion()
        rightAnswer == sender.tag ? didAnsweredRight() : gameLost()
    }
    
    @IBAction func lifelinePressed(sender: UIButton!) {
        switch sender {
        case removeTwoLifeline:
            removeTwo()
        case callFriendLifeline:
            callFriend()
        case audienceHelpLifeline:
            audienceHelp()
        case takeCashLifeline:
            takeCash()
        default:
            break
        }
    }
    
    let scoreValues = [0 : 0, 1 : 100, 2 : 200, 3 : 300, 4 : 500, 5 : 1000, 6 : 2000, 7 : 4000, 8 : 8000, 9 : 16000, 10 : 32000, 11 : 64000, 12 : 125000, 13 : 250000, 14 : 500000, 15 : 1000000]
    var playerName: String = ""
    var gameSession = GameSession()
    
    var initialProgressIndicatorPosition = CGFloat()
    var score = 0
    var questionNumber = 0 {
        didSet {
            gameSession.questionNumber = questionNumber
            guard let score = scoreValues[questionNumber] else { return }
            self.score = score
        }
    }
    var rightAnswer = Int() {
        didSet {
            wrongAnswers = [1,2,3,4].filter({ $0 != rightAnswer })
        }
    }
    var wrongAnswers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        delegate = Game.shared
        Game.shared.gameSession = gameSession
        answerButtonsCollection = [answerA, answerB, answerC, answerD]
        answerButtonsCollection.forEach { $0.titleLabel?.textAlignment = .center }
        lifelineButtonsCollection = [removeTwoLifeline, callFriendLifeline, audienceHelpLifeline, takeCashLifeline]
        setupQuestion()
    }
    
    func setupQuestion(action: UIAlertAction! = nil) {
        title = "Question #\(questionNumber + 1)"
        answerButtonsCollection.forEach { $0.isHidden = false }
        if questionNumber > 0 { moveProgressIndicator() }
        let currentQuestion = questionsSet[questionNumber]
        question.text = currentQuestion.question
        answerA.setTitle("A) " + currentQuestion.answers[0], for: .normal)
        answerB.setTitle("B) " + currentQuestion.answers[1], for: .normal)
        answerC.setTitle("C) " + currentQuestion.answers[2], for: .normal)
        answerD.setTitle("D) " + currentQuestion.answers[3], for: .normal)
        rightAnswer = currentQuestion.rightAnswer
    }
    
    func moveProgressIndicator() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.progressIndicatorConstraint.constant -= self.scoreLadder.frame.height / 15 + 0.4
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func hideQuestion() {
        question.text = ""
        answerButtonsCollection.forEach { $0.setTitle("", for: .normal) }
    }
    
    func didAnsweredRight() {
        questionNumber += 1
        if questionNumber < 15 {
            let ac = UIAlertController(title: "CORRECT!", message: "Your current score is: \(score)$", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: setupQuestion))
            present(ac, animated: true)
        } else {
            gameWon()
        }
    }
    
    func gameWon(action: UIAlertAction! = nil) {
        hideQuestion()
        let ac = UIAlertController(title: "CONGRATULATIONS!", message: "YOU WON \(score)$", preferredStyle: .alert)
        if questionNumber == 15 { ac.addAction(UIAlertAction(title: "New Game", style: .default, handler: restartGame)) }
        ac.addAction(UIAlertAction(title: "Exit", style: .default, handler: exitToMainMenu))
        present(ac, animated: true)
        delegate?.didEndGame(withScore: score, name: playerName, removeTwoUsed: gameSession.removeTwoUsed, callFriendUsed: gameSession.callFriendUsed, audienceHelpUsed: gameSession.audienceHelpUsed)
    }
    
    func gameLost() {
        switch score {
        case 0..<1000:
            score = 0
        case 1000..<32000:
            score = 1000
        case 32000..<1000000:
            score = 32000
        default:
            break
        }
        let ac = UIAlertController(title: "WRONG!", message: "Sorry, you've lost! Your score is: \(score)$", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "New game", style: .default, handler: restartGame))
        ac.addAction(UIAlertAction(title: "Exit", style: .default, handler: exitToMainMenu))
        present(ac, animated: true)
        delegate?.didEndGame(withScore: score, name: playerName, removeTwoUsed: gameSession.removeTwoUsed, callFriendUsed: gameSession.callFriendUsed, audienceHelpUsed: gameSession.audienceHelpUsed)
    }
    
    func restartGame(action: UIAlertAction! = nil) {
        questionNumber = 0
        lifelineButtonsCollection.forEach { $0.isEnabled = true }
        gameSession.removeTwoUsed = false
        gameSession.callFriendUsed = false
        gameSession.audienceHelpUsed = false
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseInOut, animations: {
            self.progressIndicatorConstraint.constant = self.initialProgressIndicatorPosition
            self.view.layoutIfNeeded()
        }, completion: { _ in self.setupQuestion() })
    }
    
    func exitToMainMenu(action: UIAlertAction! = nil) {
        navigationController?.popViewController(animated: true)
        Game.shared.gameSession = nil
    }
    
// MARK: lifeline methods
    
    func removeTwo() {
        removeTwoLifeline.isEnabled = false
        gameSession.removeTwoUsed = true
        var buttons = answerButtonsCollection
        buttons.remove(at: rightAnswer - 1)
        let doNotRemoveIndex = Int.random(in: 0...2)
        wrongAnswers = [wrongAnswers[doNotRemoveIndex]]
        buttons.remove(at: doNotRemoveIndex)
        buttons.forEach({ $0.isHidden = true })
    }
    
    func callFriend() {
        callFriendLifeline.isEnabled = false
        gameSession.callFriendUsed = true
        
        let mysteryNumber = Int.random(in: 1...10)
        var friendsAnswer = Int()
        var isSure = false
        switch mysteryNumber {
        case 1, 2, 3, 5, 7, 8, 9:
            friendsAnswer = rightAnswer
            isSure = true
        case 4, 6:
            if let wrongAnswer = wrongAnswers.randomElement() {
                friendsAnswer = wrongAnswer
                isSure = false
            }
        default:
            friendsAnswer = 0
        }
        var message = ""
        switch friendsAnswer {
        case 0:
            message = "Sorry, I have no idea. \n If you don't know the answer - listen to your heart."
        case 1:
            message = isSure ? "I'm almost sure the answer is A." : "I'm not sure at all, but I think the answer is A."
        case 2:
            message = isSure ? "The answer is B. Facts!" : "I'm not sure, but I guess the answer is B."
        case 3:
            message = isSure ? "I'm pretty sure the answer is С." : "I'm not sure, but C looks right to me."
        case 4:
            message = isSure ? "The answer is D. 100%" : "I'm not sure, but the answer might be D."
        default:
            break
        }
        let ac = UIAlertController(title: "Hey, buddy!", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Got It!", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
    func audienceHelp() {
        audienceHelpLifeline.isEnabled = false
        gameSession.audienceHelpUsed = true

        let voteRight = Int.random(in: 55...99)
        var voteResults = [Int : Int]()
        voteResults[rightAnswer] = voteRight
        
        if wrongAnswers.count == 3 {
            let voteWrong1 = Int.random(in: 0...100 - voteRight)
            let voteWrong2 = Int.random(in: 0...100 - voteRight - voteWrong1)
            let voteWrong3 = 100 - voteRight - voteWrong1 - voteWrong2
            voteResults[wrongAnswers[0]] = voteWrong1
            voteResults[wrongAnswers[1]] = voteWrong2
            voteResults[wrongAnswers[2]] = voteWrong3
        } else {
            voteResults[wrongAnswers[0]] = 100 - voteRight
        }
        
        let ac = UIAlertController(title: "Audience voting results:", message: "", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Got It!", style: .default, handler: nil))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
         
        let messageText = NSMutableAttributedString(
            string: """
                    
                                        A:  \(voteResults[1] ?? 0)%
                                        B:  \(voteResults[2] ?? 0)%
                                        C:  \(voteResults[3] ?? 0)%
                                        D:  \(voteResults[4] ?? 0)%
                    
                    """,
            attributes: [ NSAttributedString.Key.paragraphStyle: paragraphStyle ])
         
        ac.setValue(messageText, forKey: "attributedMessage")
        present(ac, animated: true)
    }
    
    func takeCash() {
        let ac = UIAlertController(title: "Are you sure?", message: "Do you really want to take your \(score)$ and leave?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Yes, please", style: .default, handler: gameWon))
        ac.addAction(UIAlertAction(title: "Nope", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
}
