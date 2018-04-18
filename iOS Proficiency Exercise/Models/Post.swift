//
//  Post.swift
//  iOS Proficiency Exercise
//
//  Created by Alice Newman on 17/4/18.
//  Copyright © 2018 Nick Moignard. All rights reserved.
//

import Foundation
import UIKit


/// Data object to conform with given JSON Feed
struct Post {
    // MARK: Data Members
    var title: String
    var description: String
    var image_url: String
    var image = UIImage()
    
    // Mark: Methods
    /**
    Initialize data members of struct
     - Parameter title: The title of post
     - Parameter description: The body of the post
     - Parameter image_url: url of image associated with post
    */
    init(title: String, description: String, image_url: String) {
        self.title = title
        self.description = description
        self.image_url = image_url
    }
}
