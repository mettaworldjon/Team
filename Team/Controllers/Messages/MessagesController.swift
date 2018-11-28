//
//  MessagesController.swift
//  Team
//
//  Created by Jonathan on 11/27/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Pastel

class MessagesController: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientNav(title: "Messanger", colors: [UIColor("1C66FF"),UIColor("4D87FF")])
        view.backgroundColor = UIColor(hexString: "F2F6FF")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SearchBar()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 70
        }
        return 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        if section == 0 {
            cell.backgroundColor = UIColor(hexString: "F2F6FF")
            return cell
        }
        cell.backgroundColor = .darkGray
        return cell
    }
    
    
}

extension MessagesController {
    
    func setupNav() {
        
    }
    
}
