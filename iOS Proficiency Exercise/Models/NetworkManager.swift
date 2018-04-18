//
//  NetworkManager.swift
//  iOS Proficiency Exercise
//
//  Created by Alice Newman on 17/4/18.
//  Copyright © 2018 Nick Moignard. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SDWebImage
import UIKit


/// Manage HTTP requests & Parse data
class NetworkManager {
    // MARK: Data Members
    
    /// URL to pull JSON from
    private let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    
    // MARK: Methods
    /**
    Get data from provided URL, Parse & return said data
    - Parameter completion: completion handler for network request
    - Parameter returnTuple: (title of recieved data, array of posts)
    */
    public func getJSON( completion: @escaping (_ returnTuple: (String, [Post])?) -> Void) {
        var posts: [Post] = []
        
        getData {
            json in
            if let title = json["title"].string, let items = json["rows"].array {
                for item in items {
                    var _title = "", _description = "", _imageURL = ""

                    if let postTitle = item["title"].string {
                        _title = postTitle
                    }
                    if let postDescription = item["description"].string {
                        _description = postDescription
                    }
                    if let postImageURL = item["image_url"].string {
                        _imageURL = postImageURL
                    }
                    let post = Post(title: _title, description: _description, image_url: _imageURL)
                    posts.append(post)
                }
                completion((title,posts))
            } else {
                completion(nil)
            }
        }
    }
    
    
    // MARK: Helper Functions
    
    /**
    Perform HTTP get request with provided URL and convert to a JSON object
    - Parameter completion: Completion handler for HTTP request
    - Parameter json: JSON Object created from data recieved
    */
    private func getData( completion: @escaping (_ json: JSON) -> Void) {
        Alamofire.request(self.url).responseString {
            data in
            if let returnString = data.value {
                let trimmedString = returnString.trimmingCharacters(in: .whitespacesAndNewlines)
                if let dataFromString = trimmedString.data(using: .utf8) {
                    let json = JSON(data: dataFromString)
                    completion(json)
                }
            }
        }
    }
}
