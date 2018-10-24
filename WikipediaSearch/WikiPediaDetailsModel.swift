//
//  WikiPediaDetailsModel.swift
//  WikipediaSearch
//
//  Created by Pati, Susovan on 10/23/18.
//  Copyright © 2018 Pati, Susovan. All rights reserved.
//

import UIKit
import SwiftyJSON
class WikiPediaDetailsModel: NSObject {
    var pageId :String?
    var title :String?
    var thumnailImage :String?
    var descriptionTitle: String?
    
    public static func initiateWithJson (jsonObject : JSON) -> [WikiPediaDetailsModel]
    {
        var searchWekipediaModel = [WikiPediaDetailsModel]()
        
        if jsonObject.count > 0
        {
            let pages = jsonObject["query"]["pages"].arrayValue

            for  i in 0..<pages.count {
            let searchModel = WikiPediaDetailsModel()
            searchModel.pageId = pages[i]["pageid"].string
            searchModel.title = pages [i]["title"].string
            searchModel.thumnailImage = pages [i]["thumbnail"]["source"].string
            searchModel.descriptionTitle = pages [i]["terms"]["description"][0].stringValue
            searchWekipediaModel.append(searchModel)
            
            }
        }
      return searchWekipediaModel
        
    }
}
