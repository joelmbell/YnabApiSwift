//
//  PayeeListEndpoint.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

struct PayeeListEndpoint: Endpoint {

    let budget: String
    var path: String {
        return "/budgets/\(budget)/payees"
    }

    init(budget: String) {
        self.budget = budget
    }

    struct Data: YnabResource {
        let data: PayeeList
    }
}
