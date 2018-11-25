//
//  PayeeListViewController.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import UIKit
import YnabApi

class PayeeListViewController: UITableViewController {

    let budget: Budget

    init(budget: Budget) {
        self.budget = budget

        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not accessible by Storyboards")
    }

    var payees: [Payee] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        title = "Payee List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        let payeeListEndpoint = PayeeListEndpoint(budget: budget.id)
        config.ynabApi.fetch(endpoint: payeeListEndpoint) { (response) in
            switch response.result {
            case .failure(let error): print("ERROR: \(error)")
            case .success(let value): self.payees = value.data.payees
            }
        }
    }
}

extension PayeeListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let payee = payees[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = payee.name
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payees.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let payee = payees[indexPath.row]
        let vc = PayeeTransactionListViewController(budgetID: budget.id, payee: payee)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
