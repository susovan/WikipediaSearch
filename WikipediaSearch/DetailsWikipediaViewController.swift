//
//  DetailsWikipediaViewController.swift
//  WikipediaSearch
//
//  Created by Pati, Susovan on 10/24/18.
//  Copyright © 2018 Pati, Susovan. All rights reserved.
//

import UIKit
import WebKit

class DetailsWikipediaViewController: UIViewController,WKNavigationDelegate {

    var wikiPediaSearchModel: WikiPediaDetailsModel?
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        let wikiPedititle = wikiPediaSearchModel?.title ?? ""
        let urlString : String = wikiPedititle.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        webView.navigationDelegate = self
        let url = URL(string:"https://en.wikipedia.org/wiki/" + urlString)
        webView.navigationDelegate = self
        if let url = url {
            webView.load(URLRequest(url:url))
        }        
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    print(error.localizedDescription)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load")
    }
    private func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("finish to load")
    }
    

   
}
