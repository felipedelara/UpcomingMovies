//
//  MovieLister.swift
//  UpcomingMovies
//
//  Created by Felipe on 24/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class MoviesProvider: BindableObject {
    private var page = 1
    
    var movies: Movies = [] {
        didSet {
            didChange.send(self)
        }
    }
    var didChange = PassthroughSubject<MoviesProvider, Never>()
    
    func fetch() {
        print("Fetching page \(page)")
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/upcoming?page=\(page)&language=en-US&api_key=c5850ed73901b8d268d0898a8a9d8bff")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            print("Completion block")
            guard let data = data, error == nil else {
                print("Data unwrapping failed")
                return
            }
            guard let requestResultModel = try? GetMoviesResultModel(data: data) else {
                print("Failed to convert model")
                return
            }
            guard let addedMovies = requestResultModel.results else {
                 print("Failed to get movies.")
                return
            }
            print(addedMovies.count)
            DispatchQueue.main.async {
                self.page += 1
                self.movies += addedMovies
            }
        })
        dataTask.resume()
    }
}
