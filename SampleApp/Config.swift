//
//  Config.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation
import YnabApi

struct Config {
    let server: String
    let authToken: String
    let ynabApi: YnabApi

    init(server: String, authToken: String) {
        self.server = server
        self.authToken = authToken
        self.ynabApi = YnabApi(token: authToken, server: server)
    }
}

let config = Config(
    server: "https://api.youneedabudget.com/v1",
    authToken: "Bearer ----your token here-----"
)
