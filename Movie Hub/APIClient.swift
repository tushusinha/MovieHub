//
//  APIClient.swift
//  Movie Hub
//
//  Created by Baxi Kaustubh Sinha on 10/2/18.
//  Copyright © 2018 Baxi Kaustubh Sinha. All rights reserved.
//

import Foundation

typealias MovieJSON = [String: Any]

struct APIClient {
    
    static func getMoviesAPI(completion: @escaping (MovieJSON?) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=20f66a42692b020a4841d728977db018&language=en-US&page=1")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedData = data else { print("Error unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? MovieJSON
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}

