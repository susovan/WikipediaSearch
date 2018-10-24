//
//  Networklayer.swift
//  WikipediaSearch
//
//  Created by Pati, Susovan on 10/23/18.
//  Copyright © 2018 Pati, Susovan. All rights reserved.
//
//

import Foundation
class NetworkLayer {
    
    typealias reportCompletion = (_ reports:Data?) -> Void

    static func executeRequest(_ urlRequest: URLRequest, completion: @escaping reportCompletion) {
        NetworkOperation.executeNetworkRequest(urlRequest) { (data, response, error) in
            if nil != error {
//                Utility.showMessage(title:"Error",msg:error!.localizedDescription)
                return
            }
            guard nil != data else {
               return completion(nil)
            }
            guard response != nil else{
                print("URLResponse is null")
                return completion(nil)
            }
         let response = response as? HTTPURLResponse
            if response?.statusCode  == 200
            {
                completion(data)
            }else
            {
                let errorMessage = error?.localizedDescription ?? "An error occured while retrieving data"
//                Utility.showMessage(title:"No Access", msg:errorMessage)
                return completion(nil)
            }

        }
    }
}






