//
//  PayeeTransactionListViewController.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import UIKit
import YnabApi

class PayeeTransactionListViewController: UITableViewController {

    let budgetID: String
    let payee: Payee

    var transactions: [Transaction] = [] {
        didSet {
            tableView.reloadData()
            let total = transactions.reduce(0) { (acc, transaction) -> Int in
                return acc + transaction.amount
            }
            title = formatAmount(amount: total)
        }
    }

    func formatAmount(amount: Int) -> String {
        return "$\(Float(amount) / 1000.0)"
    }

    init(budgetID: String, payee: Payee) {
        self.budgetID = budgetID
        self.payee = payee
        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not initializable from storyboards")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        title = "Transaction List"

        let ep = PayeeTransactionsListEndpoint(budget: budgetID, payee: payee.id)
        config.ynabApi.fetch(endpoint: ep) { (response) in
            switch response.result {
            case .failure(let error): print("ERROR: \(error)")
            case .success(let value): self.transactions = value.data.transactions
            }
        }
    }
}

extension PayeeTransactionListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = transactions[indexPath.row]

        let cell: UITableViewCell
        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            cell = dequeuedCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        }

        cell.textLabel?.text = formatAmount(amount: transaction.amount)
        cell.detailTextLabel?.text = transaction.date
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
}

