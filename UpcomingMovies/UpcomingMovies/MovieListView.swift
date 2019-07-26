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

    var body: some View {
        
        NavigationView {
            List{
                ForEach (movieProvider.movies){ item in
                    NavigationLink(destination: MovieDetailsView(movieItem: item, genres: self.genreProvider.genres)) {
                        HStack{
                            URLImage(item.getAbsolutePosterURL()).resizable().frame(width: 50.0, height: 75.0).cornerRadius(5).padding(10)
                            VStack(alignment: .leading){
                                Text(item.title ?? "no title").font(.headline)
                                Text(item.releaseDate ?? "no date").font(.subheadline)
                                Text(item.getGenreTextListForCodes(genres: self.genreProvider.genres)).font(.caption)
                            }
                        }
                    }                    
                }
                
                Button(action: {self.movieProvider.fetch()}, label: {
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
