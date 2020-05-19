//
//  SourceTableViewCell.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class SourceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(name:String, desc:String){
        nameLabel.text = name
        descLabel.text = desc
    }
}
