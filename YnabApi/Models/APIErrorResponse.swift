//
//  APIErrorResponse.swift
//  YnabApi
//
//  Created by Joel Bell on 11/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct APIErrorResponse: Codable {

    struct Error: Codable {
        public let id: String
        public let name: String
        public let detail: String
    }

    let error: Error
}
