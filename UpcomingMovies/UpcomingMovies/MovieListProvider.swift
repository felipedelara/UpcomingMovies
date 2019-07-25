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
    var movies: Movies = [] {
        didSet {
            didChange.send(self)
        }
    }
    var didChange = PassthroughSubject<MoviesProvider, Never>()
    
    func fetch() {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/movie/upcoming?page=2&language=en-US&api_key=c5850ed73901b8d268d0898a8a9d8bff")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
           
            guard let data = data, error == nil else {
                return
            }
            guard let requestResultModel = try? GetMoviesResultModel(data: data) else {
                return
            }
            guard let movies = requestResultModel.results else {
                return
            }
            DispatchQueue.main.async {
                self.movies = movies
            }
        })
        dataTask.resume()
    }
}
