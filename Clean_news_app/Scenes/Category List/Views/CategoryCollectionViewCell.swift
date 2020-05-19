//
//  CategoryCollectionViewCell.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCategory(category: CategoryEnum){
        categoryImage.image = UIImage(named: category.rawValue)
        categoryName.text = category.rawValue
    }
}
