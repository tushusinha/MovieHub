//
//  CollectionViewCell.swift
//  Movie Hub
//
//  Created by Baxi Kaustubh Sinha on 10/2/18.
//  Copyright © 2018 Baxi Kaustubh Sinha. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieLabel: UILabel!
    
    func displayContent(image: UIImage, title: String) {
        movieImage.image = image
        movieLabel.text = title
    }
    
}
