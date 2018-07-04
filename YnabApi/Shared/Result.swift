//
//  Result.swift
//  Budget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)

    public var value: Value? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }

    public var error: Error? {
        switch self {
        case .success: return nil
        case .failure(let error): return error
        }
    }

    public func unwrap() throws -> Value {
        switch self {
        case .success(let value): return value
        case .failure(let error): throw error
        }
    }

    public var isError: Bool {
        switch self {
        case .success: return false
        case .failure: return true
        }
    }
}
