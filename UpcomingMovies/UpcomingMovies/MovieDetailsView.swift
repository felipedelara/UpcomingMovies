//
//  MovieDetailsView.swift
//  UpcomingMovies
//
//  Created by Felipe on 25/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import SwiftUI
import URLImage

struct MovieDetailsView : View {
    var movieViewModel: MovieViewModel
    var genres: Genres
    
    var body: some View {

        VStack{
            HStack{
                URLImage(movieViewModel.posterPath).resizable().scaledToFit().frame(width: 100.0, height: 150.0).cornerRadius(5)
                URLImage(movieViewModel.backdropPath).resizable().scaledToFit().frame(height: 150.0).cornerRadius(5)
            }
            Text(movieViewModel.title).lineLimit(3).font(.title)
            Text(movieViewModel.releaseDate)
//            Text(movieItem.getGenreTextListForCodes(genres: self.genres)).padding()
//            Text(movieViewModel.overview).lineLimit(100).padding()
//            Chart(label: "Score", value: movieItem.voteAverage ?? 0.0, maxValue: 10.0, color: Color.yellow)
            Spacer()
            
        }.padding()
    }
}

struct Chart : View {
    var label : String
    var value : Double
    var maxValue : Double
    var color: Color
    
    var body: some View {
        HStack{
            Text("\(label): \(value.format(f: ".1"))")
            ZStack {
                //Draw gray bar with total size
                GeometryReader { geometry in
                    Path{ path in
                        let width = geometry.size.width
                        let desiredHeight = CGFloat(25.0)
                        let y = (geometry.size.height / 2 ) - (desiredHeight / 2)
                        path.addRect(CGRect(x: 0.0, y: y, width: width, height: desiredHeight))
                    }.fill(Color("LightGray"))
                }
                //Draw colored bar for the percentage
                GeometryReader { geometry in
                    Path{ path in
                        let percentage = CGFloat(self.value * self.maxValue) / 100
                        let filledWidth = geometry.size.width * percentage
                        let desiredHeight = CGFloat(25.0)
                        let y = (geometry.size.height / 2 ) - (desiredHeight / 2)
                        path.addRect(CGRect(x: 0.0, y: y, width: filledWidth, height: desiredHeight))
                    }.fill(Color.yellow)
                }
            }.padding()
        }
    }
}


#if DEBUG
let movie = Movie(voteCount: 0, id: 100, video: true, voteAverage: 9.5, title: "Movie Title", popularity: 9.0, posterPath: "/wUTiyJ9N8rVLOxJz7aVpaBLpbot.jpg", originalLanguage: "en", originalTitle: "Original Title", genreIDS: [1,2,3], backdropPath: "", adult: false, overview: "Overview Here", releaseDate: "2020-01-01")
let genres : Genres = []

struct MovieDetailsView_Previews : PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieViewModel: MovieViewModel(movie: movie), genres: genres)
    }
}
#endif
