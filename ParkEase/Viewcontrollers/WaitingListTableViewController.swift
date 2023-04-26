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
    func randomCarCall() {
        let randomTime = Double.random(in: 1...6)
        let dispatchTime = DispatchTime.now() + randomTime
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) { [self] in
            print("The next car will be given out in \(randomTime) seconds")
            randomCarCall()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
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
