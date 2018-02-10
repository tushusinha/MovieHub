//
//  ViewController.swift
//  Movie Hub
//
//  Created by Baxi Kaustubh Sinha on 10/2/18.
//  Copyright © 2018 Baxi Kaustubh Sinha. All rights reserved.
//
//goToDetailsView

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let store = DataStore.sharedInstance
    var movieName = ""
    var globalImage:UIImage? = nil
    var ratingString = ""
    var overViewString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 140, height: 200)
        collectionView!.collectionViewLayout = layout

        store.getMovieImages {
            DispatchQueue.main.async {
                self.collectionView.reloadSections(IndexSet(integer: 0))
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        let movie = store.movies[indexPath.row]
        cell.displayContent(image: store.images[indexPath.row], title: movie.name)
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat(140), height: CGFloat(100))

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.cellForItem(at: indexPath) != nil {
            let movie = store.movies[indexPath.row];
            globalImage = store.images[indexPath.row];
            movieName = movie.name;
            ratingString = String(movie.rating)
            overViewString = movie.overView
        } else {
            // Error indexPath is not on screen
        }

        self.performSegue(withIdentifier: "goToDetailsView", sender: self)

    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "goToDetailsView"){
            // get a reference to the second view controller
            let secondViewController = segue.destination as! DetailsViewController
            secondViewController._posterImage = self.globalImage
            secondViewController.nameLabelString = self.movieName
            secondViewController.ratingLabelString = self.ratingString
            secondViewController.overViewLabelString = self.overViewString
        }
    }
}

