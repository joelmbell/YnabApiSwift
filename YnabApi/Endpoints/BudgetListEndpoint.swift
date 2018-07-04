//
//  BudgetListEndpoint.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

struct BudgetListEndpoint: Endpoint {

    var path: String {
        return "/budgets"
    }

    struct Data: YnabResource {
        let data: BudgetList
    }
}
