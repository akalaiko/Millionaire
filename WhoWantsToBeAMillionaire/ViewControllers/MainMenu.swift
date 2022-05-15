//
//  ViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 13.05.2022.
//

import UIKit

class MainMenu: UIViewController {
    
    private let recordsCaretaker = RecordsCaretaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        Game.shared.records = recordsCaretaker.receiveRecords()
    }
}

