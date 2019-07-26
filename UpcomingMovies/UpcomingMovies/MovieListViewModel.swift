//
//  MovieListViewModel.swift
//  UpcomingMovies
//
//  Created by Felipe on 26/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

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
}

public class MovieViewModel: Identifiable{
    private let movie : Movie
    
    init(movie: Movie){
        self.movie = movie
    }
    
    public var id : Int? {
        return movie.id
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
    
    func getGenreTextListForCodes(genres: Genres) -> String{
        var resultString = ""
        var isFirst = true
        for code in self.movie.genreIDS ?? []{
            for genre in genres{
                if code == genre.id{
                    if isFirst{
                        resultString.append(genre.name ?? "")
                        isFirst = false
                    }else{
                        resultString.append(", \(genre.name ?? "")")
                    }
                }
            }
        }
        return resultString
    }
    
}
