//
//  YNABAPI.swift
//  QuickBudget
//
//  Created by Joel Bell on 6/23/18.
//  Copyright © 2018 Vivir Creative. All rights reserved.
//

import Foundation

protocol Endpoint {
    associatedtype Data: YnabResource
    var path: String { get }
}

protocol YnabResource: Codable {}

protocol Cancellable {
    func cancel()
}
extension URLSessionDataTask: Cancellable {}

let defaultServer = "https://api.youneedabudget.com/v1"

class YnabApi {

    let session: URLSession
    let token: String

    init(token: String, server: String = defaultServer, session: URLSession = .shared) {
        self.session = session
        self.token = token
    }

    @discardableResult
    func fetch<T: Endpoint>(endpoint: T, callback: @escaping (Result<T.Data>) -> Void) -> Cancellable? {
        let request = APIRequest(path: endpoint.path, authToken: token)
        return self.fetch(request: request) { (result) in
            switch result {
            case .failure(let error): callback(.failure(error))
            case .success(let value):

                do {
                    let decoder = JSONDecoder()
                    let list = try decoder.decode(T.Data.self, from: value)
                    callback(.success(list))
                } catch {
                    callback(.failure(error))
                    return
                }
            }
        }
    }

    @discardableResult
    func fetch(request: APIRequest?, callback: @escaping (Result<Data>) -> Void) -> Cancellable? {
        guard let request = request else {
            callback(.failure(APIError.invalidRequest))
            return nil
        }
        return self.fetch(request: request.urlRequest, callback: callback)
    }

    @discardableResult
    func fetch(request: URLRequest, callback: @escaping (Result<Data>) -> Void) -> Cancellable {
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    callback(.failure(error))
                    return
                }

                guard let data = data else {
                    callback(.failure(APIError.noData))
                    return
                }
                callback(.success(data))
            }
        }
        task.resume()
        return task
    }
}

