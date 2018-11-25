//
//  UserEndpoint.swift
//  YnabApi
//
//  Created by Joel Bell on 11/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public struct UserEndpoint: Endpoint {

    public init() {}

    public var path: String {
        return "/user"
    }

    public struct Data: YnabResource {
        public let data: User?
    }
}
