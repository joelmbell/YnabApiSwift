//
//  BudgetListViewController.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import UIKit
import YnabApi

class BudgetListViewController: UITableViewController {

    var budgets: [Budget] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        title = "Budget List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")


        config.ynabApi.fetch(endpoint: UserEndpoint()) { (response) in
            switch response.result {
            case .failure(let error): print("Error: \(error)")
            case .success(let value): print("User: \(value)")
            }
        }



        let ep = BudgetListEndpoint()
        config.ynabApi.fetch(endpoint: ep) { (response) in
            switch response.result {
            case .failure(let error): print("ERROR: \(error)")
            case .success(let value): self.budgets = value.data.budgets
            }
        }
    }
}

extension BudgetListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let budget = budgets[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = budget.name
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgets.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let budget = budgets[indexPath.row]
        let vc = PayeeListViewController(budget: budget)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
