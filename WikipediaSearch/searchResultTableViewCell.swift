//
//  searchResultTableViewCell.swift
//  WikipediaSearch
//
//  Created by Pati, Susovan on 10/23/18.
//  Copyright © 2018 Pati, Susovan. All rights reserved.
//

import UIKit
import SDWebImage

class searchResultTableViewCell: UITableViewCell {

   
   
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    self.transparentView.layer.cornerRadius = 5
    self.transparentView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellAttribute(searchModel:WikiPediaDetailsModel)  {
        titleImage.sd_setImage(with: URL(string:searchModel.thumnailImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        titleLabel.text = searchModel.title
        descriptionLabel.text = searchModel.descriptionTitle
    }
}
