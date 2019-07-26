//
//  ContentView.swift
//  UpcomingMovies
//
//  Created by Felipe on 24/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import SwiftUI
import URLImage

//Thanks to Dmytro Anokhin for the cool URLImage View.

struct MoviesView : View {
    @EnvironmentObject var movieProvider: MoviesProvider
    @EnvironmentObject var genreProvider: GenresProvider
    @State private var searchQuery: String = ""

    private var listViewModel : MoviesViewModel {
        return MoviesViewModel(movieModels: movieProvider.movies)
    }
    
    var body: some View {
        NavigationView {
            List{
                if listViewModel.movies.isEmpty{
                    Text("No movies loaded yet")
                }else{
                    ForEach (listViewModel.movies){ item in
                        NavigationLink(destination: MovieDetailsView(movieViewModel: item, genres: self.genreProvider.genres)) {
                            HStack{
                                URLImage(item.posterPath).resizable().frame(width: 50.0, height: 75.0).cornerRadius(5).padding(10)
                                VStack(alignment: .leading){
                                    Text(item.title).font(.headline)
                                    Text(item.releaseDate).font(.subheadline)
                                    Text(item.getGenreTextListForCodes(genres: self.genreProvider.genres)).font(.caption)
                                }
                            }
                        }                    
                    }
                }
                Button(action: {self.movieProvider.fetch()}, label: {
//                    var loadButtonText = "Load More"
//                    if self.movieProvider.movies.isEmpty{
//                        loadButtonText = ""
//                    }
                    Text("Load More").font(.title).foregroundColor(Color.blue).frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                })
            }.navigationBarTitle(Text("Upcoming Movies"))
        }
    }
}

#if DEBUG
let movieProvider = MoviesProvider()
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        MoviesView().environmentObject(movieProvider)
    }
}
#endif
