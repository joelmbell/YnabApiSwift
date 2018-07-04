//
//  PayeeTransactionsListEndpoint.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct PayeeTransactionsListEndpoint: Endpoint {

    public let budget: String
    public let payee: String
    public var path: String {
        return "/budgets/\(budget)/payees/\(payee)/transactions"
    }

    public init(budget: String, payee: String) {
        self.budget = budget
        self.payee = payee
    }

    public struct Data: YnabResource {
        public let data: TransactionList
    }
}
