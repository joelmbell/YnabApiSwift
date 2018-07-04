//
//  Budget.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct BudgetList: Codable {
    public let budgets: [Budget]
}

public struct Budget: Codable {
    public let id: String
    public let name: String
    public let lastModifiedOn: String
    public let firstMonth: String
    public let lastMonth: String

    //"date_format": {
    //    "format": "MM/DD/YYYY"
    //},

    //"currency_format": {
    //    "iso_code": "USD",
    //    "example_format": "123,456.78",
    //    "decimal_digits": 2,
    //    "decimal_separator": ".",
    //    "symbol_first": true,
    //    "group_separator": ",",
    //    "currency_symbol": "$",
    //    "display_symbol": true
    //},

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case lastModifiedOn = "last_modified_on"
        case firstMonth = "first_month"
        case lastMonth = "last_month"
    }
}
