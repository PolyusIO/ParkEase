//
//  WaitingListTableViewController.swift
//  ParkEase
//
//  Created by Сергей Поляков on 26.04.2023.
//

import UIKit

final class WaitingListTableViewController: UITableViewController {
    
    // MARK: - Private Properties
    private let reuseIdentifier = "waitingList"
    private var waitingList: [WaitingList] = []
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        randomCarCall()
    }
    
    
    // MARK: - Private Methods
    private func randomCarCall() {
        let randomTime = Double.random(in: 1...6)
        let dispatchTime = DispatchTime.now() + randomTime
        let operationTime = Int.random(in: 5...10)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) { [self] in
            if waitingList.count < 5 {
                print("The next car will be given out in \(randomTime) seconds")
                waitingList.append(
                    WaitingList(
                        dispatchTime: dispatchTime,
                        operationTime: operationTime,
                        timeToCompletion: operationTime,
                        isYouCar: false
                    )
                )
                tableView.reloadData()
            }
            randomCarCall()
        }
    }
    
    private func reduceOperationTime() {
        let dispatchTime = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) { [self] in
            if waitingList.first?.timeToCompletion ?? 0 > 0 {
                let reduce = waitingList.first?.timeToCompletion ?? 0
                let operationTime = Int.random(in: 5...10)
                waitingList.append(
                    WaitingList(
                        dispatchTime: dispatchTime,
                        operationTime: operationTime,
                        timeToCompletion: operationTime,
                        isYouCar: false
                    )
                )
                tableView.reloadData()
            }
            reduceOperationTime()
        }
        
        
        
    }
    
}

// MARK: - Table view data source
extension WaitingListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? waitingList.count : 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            let waiting = waitingList[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = "Ожидайте \(waiting.timeToCompletion)"
            cell.contentConfiguration = content
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            let waiting = waitingList.reduce(0) { $0 + $1.timeToCompletion}
            var content = cell.defaultContentConfiguration()
            content.text = "Примерное время ожидания"
            content.secondaryText = "\(waiting)"
            cell.contentConfiguration = content
            return cell
        }
    }
}


// MARK: - Table View Delegate
extension WaitingListTableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
}
