//
//  DataStore.swift
//  Movie Hub
//
//  Created by Baxi Kaustubh Sinha on 10/2/18.
//  Copyright © 2018 Baxi Kaustubh Sinha. All rights reserved.
//

import Foundation
import UIKit

final class DataStore {
    
    static let sharedInstance = DataStore()
    fileprivate init() {}
    
    var movies: [Movie] = []
    var images: [UIImage] = []

    func getMovies(completion: @escaping () -> Void) {
        APIClient.getMoviesAPI { (json) in
            if let results = json?["results"] as?[MovieJSON] {
                for i in 0..<results.count{
                let newMovie = Movie(dictionary: results[i])
                self.movies.append(newMovie)
             }
                completion()
        }
     }
        
    }
    
    func getMovieImages(completion: @escaping () -> Void) {
        getMovies { 
            for movie in self.movies {
                let resultStr = "https://image.tmdb.org/t/p/w92\(movie.coverImage)"
               // print(resultStr)
                let url = URL(string: resultStr)
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.images.append(image!)
                }
            }
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }
}
