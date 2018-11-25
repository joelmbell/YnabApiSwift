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

    public struct DateFormat: Codable {
        public let format: String
    }

    public struct CurrencyFormat: Codable {
        public let iso_code: String
        public let example_format: String
        public let decimal_digits: Int
        public let decimal_separator: String
        public let symbol_first: Bool
        public let group_separator: String
        public let currency_symbol: String
        public let display_symbol: Bool
    }

    public let id: String
    public let name: String
    public let last_modified_on: String
    public let first_month: String
    public let last_month: String
    public let date_format: DateFormat
    public let currency_format: CurrencyFormat
}

