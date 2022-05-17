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
    let alertController = UIAlertController(title: "Enter your name:", message: nil, preferredStyle: .alert)
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        present(alertController, animated: true)
    }
    
    private let recordsCaretaker = RecordsCaretaker()
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.records = recordsCaretaker.receiveRecords()
        
        let enterNameAction = UIAlertAction(title: "Play", style: .default, handler: setName)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addTextField { textField in textField.placeholder = "Player" }
        alertController.addAction(enterNameAction)
        alertController.addAction(cancelAction)
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "startGameSegue" { return name != "" }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGameSegue":
            guard let destination = segue.destination as? GameScene else {
                return
            }
            
            destination.playerName = name
        default:
            break
        }
    }
    
    func setName(action: UIAlertAction! = nil) {
        if let textField = alertController.textFields?[0] {
            if let text = textField.text {
                name = (text != "") ? text : textField.placeholder ?? "Empty"
            }
        }
        performSegue(withIdentifier: "startGameSegue", sender: nil)
        name = ""
    }

}

