//
//  YNABAPI.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

public protocol Endpoint {
    associatedtype Data: YnabResource
    var path: String { get }
}

public protocol YnabResource: Codable {}

public protocol Cancellable {
    func cancel()
}
extension URLSessionDataTask: Cancellable {}

public let defaultServer = "https://api.youneedabudget.com/v1"

public class YnabApi {

    public let session: URLSession
    public let token: String

    public init(token: String, server: String = defaultServer, session: URLSession = .shared) {
        self.session = session
        self.token = token
    }

    @discardableResult
    public func fetch<T: Endpoint>(endpoint: T, callback: @escaping (APIResponse<T.Data>) -> Void) -> Cancellable? {

        let fullPath = "\(defaultServer)/\(endpoint.path)"
        let request = APIRequest(path: fullPath, authToken: token)

        return self.fetch(request: request) { (response) in
            switch response.result {
            case .failure(let error):
                let result: Result<T.Data> = .failure(error)
                let response = APIResponse(result: result, response: nil)
                callback(response)
            case .success(let value):

                let decoder = JSONDecoder()
                do {
                    let list = try decoder.decode(T.Data.self, from: value)

                    let result: Result<T.Data> = .success(list)
                    let response = APIResponse(result: result, response: nil)
                    callback(response)
                } catch {
                    var error = error
                    if let errorResponse = try? decoder.decode(APIErrorResponse.self, from: value) {
                        error = APIError.apiError(response: errorResponse)
                    }

                    let result: Result<T.Data> = .failure(error)
                    let response = APIResponse(result: result, response: nil)
                    callback(response)
                    return
                }
            }
        }
    }

    @discardableResult
    func fetch(request: APIRequest?, callback: @escaping (APIResponse<Data>) -> Void) -> Cancellable? {
        guard let request = request else {
            let result: Result<Data> = .failure(APIError.invalidRequest)
            let response = APIResponse(result: result, response: nil)
            callback(response)
            return nil
        }
        return self.fetch(request: request.urlRequest, callback: callback)
    }

    @discardableResult
    func fetch(request: URLRequest, callback: @escaping (APIResponse<Data>) -> Void) -> Cancellable {
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    let result: Result<Data> = .failure(error)
                    let response = APIResponse(result: result, response: response)
                    callback(response)
                    return
                }

                guard let data = data else {
                    let result: Result<Data> = .failure(APIError.noData)
                    let response = APIResponse(result: result, response: response)
                    callback(response)
                    return
                }

                let result: Result<Data> = .success(data)
                let response = APIResponse(result: result, response: response)
                callback(response)
            }
        }
        task.resume()
        return task
    }
}

