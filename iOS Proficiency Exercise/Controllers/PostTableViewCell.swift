//
//  PostTableViewCell.swift
//  iOS Proficiency Exercise
//
//  Created by Nick Moignard on 18/4/18.
//  Copyright © 2018 Nick Moignard. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var postImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
