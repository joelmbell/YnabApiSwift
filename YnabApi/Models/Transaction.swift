//
//  Transaction.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct TransactionList: Codable {
    public let transactions: [Transaction]
}

public struct Transaction: Codable {
    public let id: String
    public let date: String
    public let amount: Int
    public let memo: String?
    public let cleared: String
    public let approved: Bool
    public let flag_color: String?
    public let account_id: String
    public let payee_id: String?
    public let category_id: String?
    public let transfer_account_id: String?
    public let import_id: String?
    public let deleted: Bool
    public let type: String
    public let parent_transaction_id: String?
    public let account_name: String
    public let payee_name: String?
    public let category_name: String?
}
