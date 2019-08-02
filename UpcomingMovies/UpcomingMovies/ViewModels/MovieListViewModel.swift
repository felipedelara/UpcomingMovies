//
//  MovieListViewModel.swift
//  UpcomingMovies
//
//  Created by Felipe on 26/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation
import SwiftUI

public class MoviesViewModel{
    private let movieModels : Movies

    init(movieModels: Movies) {
        self.movieModels = movieModels
    }
    
    var movies : [MovieViewModel] {
        var moviesVM : [MovieViewModel] = []
        for item in movieModels{
            moviesVM.append(MovieViewModel(movie: item))
        }
        return moviesVM
    }
    
    var buttonText : String{
        return self.movies.isEmpty ? "Try Again" : "Load More"
    }
}
