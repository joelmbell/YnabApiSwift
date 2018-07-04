//
//  Result.swift
//  Budget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)

    var value: Value? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
}
