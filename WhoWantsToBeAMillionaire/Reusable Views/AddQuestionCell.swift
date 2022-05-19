//
//  AddQuestionCell.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 19.05.2022.
//

import UIKit

class AddQuestionCell: UITableViewCell {

    @IBOutlet var questionNumberLabel: UILabel!
    
    @IBOutlet var question: UITextField!
    @IBOutlet var answerA: UITextField!
    @IBOutlet var answerB: UITextField!
    @IBOutlet var answerC: UITextField!
    @IBOutlet var answerD: UITextField!
    @IBOutlet var rightAnswerSelector: UISegmentedControl! {
        didSet {
            rightAnswerSelector.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
            rightAnswerSelector.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        }
    }
    @IBOutlet var difficultySelector: UISegmentedControl! {
        didSet {
            difficultySelector.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
            difficultySelector.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
