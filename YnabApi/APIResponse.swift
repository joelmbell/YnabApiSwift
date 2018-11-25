//
//  APIResponse.swift
//  YnabApi
//
//  Created by Joel Bell on 7/4/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct APIResponse<T> {
    public let response: URLResponse?
    public let result: Result<T>

    public init(result: Result<T>, response: URLResponse?) {
        self.result = result
        self.response = response
    }
}
