//
//  SearchController.swift
//  WikipediaSearch
//
//  Created by Pati, Susovan on 10/23/18.
//  Copyright © 2018 Pati, Susovan. All rights reserved.
//

import UIKit

class SearchController: UIViewController,UISearchBarDelegate {
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var wekipidiaSearchResultModel : [WikiPediaDetailsModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        searchTableView.estimatedRowHeight = 60.0
        searchTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        self.searchBar.becomeFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let urlString : String = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        
        if urlString.count > 0 {
            serviceRequest.searchText(searchtitle:urlString) { (wekipediaSearchResult) in
                DispatchQueue.main.async {
                    if wekipediaSearchResult.count > 0
                    {
                        self.wekipidiaSearchResultModel = wekipediaSearchResult
                        self.searchTableView.reloadData()
                    }else
                    {
                        self.searchTableView.reloadData()
                        
                    }
                }
            }
        }
    }
}
extension SearchController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
      return wekipidiaSearchResultModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! searchResultTableViewCell
        if let searchModel = wekipidiaSearchResultModel  {
            cell.cellAttribute(searchModel:searchModel[indexPath.row])
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController:DetailsWikipediaViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! DetailsWikipediaViewController
        if let searchModer = wekipidiaSearchResultModel {
            
            viewController.wikiPediaSearchModel = searchModer[indexPath.row]
        }
        self.navigationController?.pushViewController(viewController, animated:true)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}

