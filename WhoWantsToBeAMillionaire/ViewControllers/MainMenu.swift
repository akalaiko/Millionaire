//
//  ViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 13.05.2022.
//

import UIKit

class MainMenu: UIViewController {
    
    @IBOutlet var difficultyControl: UISegmentedControl! {
        didSet {
            difficultyControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
            difficultyControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        present(alertController, animated: true)
    }
    
    private var alertController: UIAlertController {
        let alert = UIAlertController(title: "Enter your name:", message: nil, preferredStyle: .alert)
        let enterNameAction = UIAlertAction(title: "Play", style: .default, handler: setName)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField { (textField) in textField.placeholder = "Player" }
        alert.addAction(enterNameAction)
        alert.addAction(cancelAction)
        return alert
    }
    
    private let recordsCaretaker = RecordsCaretaker()
    var name = ""
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0: return .easy
        case 1: return .hard
        case 2: return .insane
        default: return .hard
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.records = recordsCaretaker.receiveRecords()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "startGameSegue" : return name != ""
        default: return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGameSegue" {
            guard let destination = segue.destination as? GameScene else { return }
            destination.playerName = name
            destination.difficulty = selectedDifficulty
        }
    }
    
    func setName(action: UIAlertAction! = nil) {
        if let textField = self.alertController.textFields?.first {
            if let text = textField.text {
                name = (text != "") ? text : textField.placeholder ?? "Empty"
            }
        }
        performSegue(withIdentifier: "startGameSegue", sender: nil)
        name = ""
    }
}

