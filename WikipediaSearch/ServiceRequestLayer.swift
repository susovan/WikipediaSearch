//
//  ServiceRequestLayer.swift
//  WikipediaSearch
//
//  Created by Pati, Susovan on 10/23/18.
//  Copyright © 2018 Pati, Susovan. All rights reserved.
//

import Foundation
import SwiftyJSON
class serviceRequest
{
    typealias allwikiPediaDetails = (_ events:[WikiPediaDetailsModel]) -> Void

    static func searchText(searchtitle:String,complition: @escaping allwikiPediaDetails)
    {
        let search = "https://en.wikipedia.org/w/api.php?action=query&formatversion=2&generator=prefixsearch&gpssearch=\(searchtitle)/&gpslimit=10&prop=pageimages%7Cpageterms&piprop=thumbnail&format=json&pithumbsize=50&pilimit=50&redirects=&wbptterms=description"
        
        if  let request  = RequestBuilder.getRequestForAddress(search, parameters:nil, httpBody:nil, httpType:HTTPMethod.get)
        {
            NetworkLayer.executeRequest(request) { (data) in
                let jsonData = JSON(data as Any)
                let getallEvent = WikiPediaDetailsModel.initiateWithJson(jsonObject:jsonData)
                if getallEvent.count > 0
                {
                    complition (getallEvent)
                }else
                {
                    return  complition (getallEvent)
                }
            }
        }
    }
}
