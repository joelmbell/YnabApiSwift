//
//  APIRequest.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

struct APIRequest {

    let urlRequest: URLRequest

    init(url: URL, authToken: String) {
        var request = URLRequest(url: url)
        request.addValue("\(authToken)", forHTTPHeaderField: "Authorization")
        self.urlRequest = request
    }

    init?(path: String, authToken: String) {
        guard let url = URL(string: path) else {
            return nil
        }
        self.init(url: url, authToken: authToken)
    }
}
