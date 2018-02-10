//
//  DetailsViewController.swift
//  CollectionViewDataSourceBlog
//
//  Created by Baxi Kaustubh Sinha on 2/9/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController:UIViewController {
    
    var nameLabelString=""
    var ratingLabelString=""
    var overViewLabelString=""
    var _posterImage: UIImage!
    @IBOutlet weak var _posterImageView: UIImageView!
    @IBOutlet weak var _nameLabel: UILabel!
    @IBOutlet weak var _doneButton: UIButton!
    @IBOutlet weak var _ratingLabel: UILabel!
    @IBOutlet weak var _descriptionTextView: UITextView!
    

    override func viewDidLoad() {
        
        _nameLabel.text=nameLabelString
        _descriptionTextView.text=overViewLabelString
        _ratingLabel.text = ratingLabelString
        _posterImageView.image = self._posterImage
        
    }
    
    @IBAction func dismissBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
}
