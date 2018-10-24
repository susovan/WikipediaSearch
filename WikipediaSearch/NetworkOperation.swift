//
//  NetworkOperation.swift
//  WikipediaSearch
//
//  Created by Pati, Susovan on 10/23/18.
//  Copyright © 2018 Pati, Susovan. All rights reserved.
//

import Foundation

class NetworkOperation {
    typealias CompletionBlock = (_ result: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    static func executeNetworkRequest(_ urlRequest: URLRequest, completion: @escaping CompletionBlock) {
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            debugPrint("""
                Data: \(String(describing: data)) \n
                Reponse: \(String(describing: response))
                Error: \(String(describing: error))
                """)
            completion(data, response, error)
        }
        
        dataTask.resume()
    }
}
