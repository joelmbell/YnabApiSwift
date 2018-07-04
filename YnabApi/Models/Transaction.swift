//
//  Transaction.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

struct TransactionList: Codable {
    let transactions: [Transaction]
}

struct Transaction: Codable {
    let id: String
    let date: String
    let amount: Int
    let memo: String?
    let cleared: String
    let approved: Bool
    let flag_color: String?
    let account_id: String
    let payee_id: String?
    let category_id: String?
    let transfer_account_id: String?
    let import_id: String?
    let deleted: Bool
    let type: String
    let parent_transaction_id: String?
    let account_name: String
    let payee_name: String?
    let category_name: String?
}
