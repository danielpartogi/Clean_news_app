//
//  NewsCellTableViewCell.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit
import SDWebImage

class NewsCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(article: Article){
        if let imageUrl = article.urlToImage {
            setImage(url:URL(string: imageUrl))
        }
        
        newsTitleLabel.text = article.title
        newsDescLabel.text = article.description
        
    }
    
    private func setImage (url: URL?){
        activityIndicator.startAnimating()
        newsImageView?.sd_setImage(with: url, placeholderImage: UIImage(named:"loading"), options: .lowPriority, completed: { (_, _, _, _) in
            self.activityIndicator.isHidden = true
        })
        
    }
}
