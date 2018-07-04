//
//  PayeeTransactionsListEndpoint.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

struct PayeeTransactionsListEndpoint: Endpoint {

    let budget: String
    let payee: String
    var path: String {
        return "/budgets/\(budget)/payees/\(payee)/transactions"
    }

    init(budget: String, payee: String) {
        self.budget = budget
        self.payee = payee
    }

    struct Data: YnabResource {
        let data: TransactionList
    }
}
