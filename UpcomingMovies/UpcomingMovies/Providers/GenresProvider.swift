//
//  GenresProvider.swift
//  UpcomingMovies
//
//  Created by Felipe on 25/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class GenresProvider: BindableObject {
    
    var genres: Genres = [] {
        didSet {
            didChange.send(self)
        }
    }
    var didChange = PassthroughSubject<GenresProvider, Never>()
    
    func fetch() {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=c5850ed73901b8d268d0898a8a9d8bff&language=en-US")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data, error == nil else {
                return
            }
            guard let requestResultModel = try? GenresResponseModel(data: data) else {
                print("Failed to convert model")
                return
            }
            guard let genres = requestResultModel.genres else {
                print("Failed to get genres.")
                return
            }
            DispatchQueue.main.async {
                self.genres = genres
            }
        })
        dataTask.resume()
    }
}
