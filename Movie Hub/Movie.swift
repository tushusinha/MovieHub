//
//  Movie.swift
//  Movie Hub
//
//  Created by Baxi Kaustubh Sinha on 10/2/18.
//  Copyright © 2018 Baxi Kaustubh Sinha. All rights reserved.
//

import Foundation

struct Movie {
    let name: String
    let author: String
    let coverImage: String
    let rating: Double
    let overView: String
    
    init(dictionary: MovieJSON) {
        self.name = dictionary["original_title"] as! String
        self.author = dictionary["title"] as! String
        self.coverImage = dictionary["poster_path"] as! String
        self.rating = dictionary["vote_average"] as! Double
        self.overView = dictionary["overview"] as! String
    
    }
    
}
