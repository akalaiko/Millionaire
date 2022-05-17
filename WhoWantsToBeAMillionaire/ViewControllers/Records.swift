//
//  Results.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 15.05.2022.
//

import UIKit

final class Records: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var difficultyControl: UISegmentedControl!
    @IBAction func clearButtonPressed(_ sender: UIBarButtonItem) {
        Game.shared.clearRecords()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        difficultyControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        difficultyControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 60))
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width / 4, height: 60))
        let dateLabel = UILabel(frame: CGRect(x: tableView.bounds.width / 4, y: 0, width: tableView.bounds.width / 4, height: 60))
        let lifelinesLabel = UILabel(frame: CGRect(x: tableView.bounds.width * 2 / 4, y: 0, width: tableView.bounds.width / 4, height: 60))
        let scoreLabel = UILabel(frame: CGRect(x: tableView.bounds.width * 3 / 4, y: 0, width: tableView.bounds.width / 4, height: 60))
        nameLabel.text = "Name"
        dateLabel.text = "Date"
        lifelinesLabel.text = "Lifelines \n Used"
        lifelinesLabel.numberOfLines = 2
        scoreLabel.text = "Score"
        
        let labels = [nameLabel, dateLabel, lifelinesLabel, scoreLabel]
        labels.forEach {
            $0.textAlignment = .center
            $0.textColor = .systemBlue
            $0.font = $0.font.withSize(14)
            header.addSubview($0)
        }
        tableView.sectionHeaderTopPadding = 0
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    private let dateFormater: DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        return dateFormater
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
            setupLabelsInCell(indexPath: indexPath).forEach { cell.addSubview($0) }
            return cell
    }
    
    func setupLabelsInCell(indexPath: IndexPath) -> [UIView]{
        let record = Game.shared.records[indexPath.row]

        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width / 4, height: 40))
        let dateLabel = UILabel(frame: CGRect(x: tableView.bounds.width / 4, y: 0, width: tableView.bounds.width / 4, height: 40))
        let scoreLabel = UILabel(frame: CGRect(x: tableView.bounds.width * 3 / 4, y: 0, width: tableView.bounds.width / 4, height: 40))
        
        let lifelinesUsedView = UIView(frame: CGRect(x: tableView.bounds.width * 2 / 4, y: 0, width: tableView.bounds.width / 4, height: 40))
        var lifelinesUsedCount: Int {
            var number = 0
            if record.removeTwoUsed { number += 1 }
            if record.callFriendUsed { number += 1 }
            if record.audienceHelpUsed { number += 1 }
            return number
        }
        
        var views: [UIView] = [lifelinesUsedView]
        let labels: [UILabel] = [nameLabel, dateLabel, scoreLabel]
        labels.forEach {
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = $0.font.withSize(10)
            views.append($0)
        }
        
        switch lifelinesUsedCount {
        case 0:
            let lifelinesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: lifelinesUsedView.frame.width, height: 40))
            lifelinesLabel.text = "-"
            lifelinesLabel.textAlignment = .center
            lifelinesLabel.textColor = .white
            lifelinesLabel.font = lifelinesLabel.font.withSize(14)
            lifelinesUsedView.addSubview(lifelinesLabel)
        case 1:
            let lifelineIcon = UIImageView(frame: CGRect(x: lifelinesUsedView.frame.width / 2 - 10, y: 10, width: 20, height: 20))
            if record.removeTwoUsed { lifelineIcon.image = UIImage(named: "5050") }
            lifelinesUsedView.addSubview(lifelineIcon)
        case 2:
            let lifelineIcon2 = UIImageView(frame: CGRect(x: lifelinesUsedView.frame.width / 2 + 2, y: 10, width: 20, height: 20))
            let lifelineIcon1 = UIImageView(frame: CGRect(x: lifelineIcon2.frame.minX - 20 - 2, y: 10, width: 20, height: 20))
            if record.removeTwoUsed {
                lifelineIcon1.image = UIImage(named: "5050")
                if record.callFriendUsed {
                    lifelineIcon2.image = UIImage(named: "call")
                } else {
                    lifelineIcon2.image = UIImage(named: "audience")
                }
            } else {
                lifelineIcon1.image = UIImage(named: "call")
                lifelineIcon2.image = UIImage(named: "audience")
            }
            lifelinesUsedView.addSubview(lifelineIcon1)
            lifelinesUsedView.addSubview(lifelineIcon2)
        case 3:
            let lifelineIcon2 = UIImageView(frame: CGRect(x: lifelinesUsedView.frame.width / 2 - 10, y: 10, width: 20, height: 20))
            let lifelineIcon3 = UIImageView(frame: CGRect(x: lifelineIcon2.frame.maxX + 2, y: 10, width: 20, height: 20))
            let lifelineIcon1 = UIImageView(frame: CGRect(x: lifelineIcon2.frame.minX - 20 - 2, y: 10, width: 20, height: 20))
            
            lifelineIcon1.image = UIImage(named: "5050")
            lifelineIcon2.image = UIImage(named: "call")
            lifelineIcon3.image = UIImage(named: "audience")
            
            lifelinesUsedView.addSubview(lifelineIcon1)
            lifelinesUsedView.addSubview(lifelineIcon2)
            lifelinesUsedView.addSubview(lifelineIcon3)
        default:
            break
        }
        
        nameLabel.text = record.name
        dateLabel.text = self.dateFormater.string(from: record.date)
        scoreLabel.text = "\(record.score)$"

        return views
    }
}
