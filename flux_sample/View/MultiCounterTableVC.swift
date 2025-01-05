//
//  MultiCounterTableVC.swift
//  flux_sample
//
//  Created by 林 明虎 on 2025/01/05.
//

import UIKit

class MultiCounterTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView = UITableView()
    private let addCounterButton = UIButton(type: .contactAdd)
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
