//
//  Payee.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

struct PayeeList: Codable {
    let payees: [Payee]
}

struct Payee: Codable {

    let id: String
    let name: String
    let transferAccountId: String?
    let deleted: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case transferAccountId = "transfer_account_id"
        case deleted
    }
}
