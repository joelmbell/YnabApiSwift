//
//  PayeeListEndpoint.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct PayeeListEndpoint: Endpoint {

    public let budget: String
    public var path: String {
        return "/budgets/\(budget)/payees"
    }

    public init(budget: String) {
        self.budget = budget
    }

    public struct Data: YnabResource {
        public let data: PayeeList
    }
}
