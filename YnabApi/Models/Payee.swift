//
//  Payee.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct PayeeList: Codable {
    public let payees: [Payee]
}

public struct Payee: Codable {

    public let id: String
    public let name: String
    public let transferAccountId: String?
    public let deleted: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case transferAccountId = "transfer_account_id"
        case deleted
    }
}
