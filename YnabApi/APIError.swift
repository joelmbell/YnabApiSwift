//
//  YnabApiError.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/24/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case noData
    case invalidData
    case invalidRequest
    case apiError(response: APIErrorResponse)
}
