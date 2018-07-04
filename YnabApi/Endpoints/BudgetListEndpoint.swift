//
//  BudgetListEndpoint.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct BudgetListEndpoint: Endpoint {

    public init {}

    public var path: String {
        return "/budgets"
    }

    public struct Data: YnabResource {
        public let data: BudgetList
    }
}
