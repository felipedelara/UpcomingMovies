//
//  MovieListViewModel.swift
//  UpcomingMovies
//
//  Created by Felipe on 26/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation

public class MoviesViewModel{
    private let movieModels : Movies
    
    init(movieModels: Movies) {
        self.movieModels = movieModels
    }
    
    var list : [MovieViewModel] {
        var moviesVM : [MovieViewModel] = []
        for item in movieModels{
            moviesVM.append(MovieViewModel(movie: item))
        }
        return moviesVM
    }
}

public class MovieViewModel{
    
    private let movie : Movie
    
    init(movie: Movie){
        self.movie = movie
    }

    var title : String {
        return (movie.title ?? "no title")
    }
    
    var adultText : String {
        guard let adult = movie.adult else{
            return "No age information"
        }
        if adult{
            return "Adult Movie 🔞"
        }else{
            return ""
        }
    }
    
    var posterPath : URL {
        return movie.getAbsolutePosterURL()
    }
    
    var backdropPath : URL {
        return movie.getAbsoluteBackdropURL()
    }
    
    var releaseDate : String {
        return movie.releaseDate ?? "unknown release date"
    }
    
}
