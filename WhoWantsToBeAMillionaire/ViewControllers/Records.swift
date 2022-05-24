//
//  Results.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Tim on 15.05.2022.
//

import UIKit

final class Records: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var difficultyControl: UISegmentedControl! {
        didSet {
            difficultyControl.setTitleTextAttributes([.foregroundColor: UIColor.amazingColor], for: .normal)
            difficultyControl.setTitleTextAttributes([.foregroundColor: UIColor.amazingColor], for: .selected)
        }
    }
    @IBAction func difficultyChosen(_ sender: UISegmentedControl) {
        self.tableView.reloadData()
    }
    
    @IBAction func clearButtonPressed(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Are you sure?", message: "All your records will be deleted.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: clearRecords))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    // MARK: - Private properties
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0: return .easy
        case 1: return .medium
        case 2: return .hard
        default: return .easy
        }
    }
    private var recordsList: [Record] {
        switch selectedDifficulty {
        case .easy: return Game.shared.records.filter { $0.difficulty == .easy }
        case .medium: return Game.shared.records.filter { $0.difficulty == .medium }
        case .hard: return Game.shared.records.filter { $0.difficulty == .hard }
        }
    }
    private var recordsViewModelFactory = RecordsViewModelFactory()
    private var recordsViewModel: [RecordsViewModel] {
        recordsViewModelFactory.createViewModels(from: recordsList)
    }
    private var standartWidth: CGFloat { tableView.bounds.width }
    private var standartHeight: CGFloat = 40

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { setupHeader() }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { standartHeight * 1.5 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { standartHeight }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { recordsViewModel.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { setupCell(indexPath: indexPath) }

    // MARK: - Private functions
    
    private func setupCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        let viewModel = recordsViewModel[indexPath.row]
        
        let width = standartWidth / 4
        let iconSize = standartHeight / 2
        let spacer: CGFloat = 2

        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: standartHeight))
        nameLabel.text = viewModel.name
        let dateLabel = UILabel(frame: CGRect(x: width, y: 0, width: width, height: standartHeight))
        dateLabel.text = viewModel.date
        let scoreLabel = UILabel(frame: CGRect(x: width * 3, y: 0, width: width, height: standartHeight))
        scoreLabel.text = "\(viewModel.score)$"
        let lifelinesUsedView = UIView(frame: CGRect(x: width * 2, y: 0, width: width, height: standartHeight))
        
        switch viewModel.lifelinesUsedCount {
        case 0:
            let lifelinesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: standartHeight))
            lifelinesLabel.text = "-"
            setupLabel(label: lifelinesLabel, textAlignment: .center, color: .amazingColor, fontSize: 14)
            addSubviews(to: lifelinesUsedView, add: [lifelinesLabel])
        case 1:
            let lifelineIcon = UIImageView(frame: CGRect(x: width / 2 - iconSize / 2, y: iconSize / 2, width: iconSize, height: iconSize))
            lifelineIcon.image = viewModel.lifelineOneImage
            addSubviews(to: lifelinesUsedView, add: [lifelineIcon])
        case 2:
            let lifelineIcon2 = UIImageView(frame: CGRect(x: width / 2 + spacer, y: iconSize / 2, width: iconSize, height: iconSize))
            let lifelineIcon1 = UIImageView(frame: CGRect(x: lifelineIcon2.frame.minX - iconSize - spacer, y: iconSize / 2, width: iconSize, height: iconSize))
            lifelineIcon1.image = viewModel.lifelineOneImage
            lifelineIcon2.image = viewModel.lifelineTwoImage
            addSubviews(to: lifelinesUsedView, add: [lifelineIcon1, lifelineIcon2])
        case 3:
            let lifelineIcon2 = UIImageView(frame: CGRect(x: width / 2 - iconSize / 2, y: iconSize / 2, width: iconSize, height: iconSize))
            let lifelineIcon3 = UIImageView(frame: CGRect(x: lifelineIcon2.frame.maxX + spacer, y: iconSize / 2, width: iconSize, height: iconSize))
            let lifelineIcon1 = UIImageView(frame: CGRect(x: lifelineIcon2.frame.minX - iconSize - spacer, y: iconSize / 2, width: iconSize, height: iconSize))
            lifelineIcon1.image = viewModel.lifelineOneImage
            lifelineIcon2.image = viewModel.lifelineTwoImage
            lifelineIcon3.image = viewModel.lifelineThreeImage
            addSubviews(to: lifelinesUsedView, add: [lifelineIcon1, lifelineIcon2, lifelineIcon3])
        default: break
        }
        
        var views = [lifelinesUsedView]
        let labels = [nameLabel, dateLabel, scoreLabel]
        labels.forEach { label in setupLabel(label: label, textAlignment: .center, color: .amazingColor, fontSize: 10) }
        views.append(contentsOf: labels)
        
        cell.subviews.forEach { $0.removeFromSuperview() } // prepare for reuse
        addSubviews(to: cell, add: views)
        return cell
    }
    
    private func setupLabel(label: UILabel, textAlignment: NSTextAlignment, color: UIColor, fontSize: CGFloat) {
        label.textAlignment = textAlignment
        label.textColor = color
        label.font = label.font.withSize(fontSize)
    }
    
    private func addSubviews(to view: UIView, add subviews: [UIView]) {
        subviews.forEach { view.addSubview($0) }
    }
    
    private func setupHeader() -> UIView {
        let width = standartWidth / 4
        let height = standartHeight * 1.5
        let header = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: standartWidth, height: height))
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let dateLabel = UILabel(frame: CGRect(x: width, y: 0, width: width, height: height))
        let lifelinesLabel = UILabel(frame: CGRect(x: width * 2, y: 0, width: width, height: height))
        let scoreLabel = UILabel(frame: CGRect(x: width * 3, y: 0, width: width, height: height))
        
        nameLabel.text = "Name"
        dateLabel.text = "Date"
        scoreLabel.text = "Score"
        lifelinesLabel.text = "Lifelines \n Used"
        lifelinesLabel.numberOfLines = 2
        
        let labels = [nameLabel, dateLabel, lifelinesLabel, scoreLabel]
        labels.forEach { label in setupLabel(label: label, textAlignment: .center, color: .systemBlue, fontSize: 14) }
        addSubviews(to: header, add: labels)
        tableView.sectionHeaderTopPadding = 0
        
        return header
    }
    
    private func clearRecords(action: UIAlertAction! = nil) {
        Game.shared.clearRecords()
        self.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
