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
    
    let posterHeight: Length = 180.0
    let posterWidth: Length = 120.0
    
    let bannerHeight : Length = 220
    
    var yOffset : CGFloat { -bannerHeight - (posterHeight/3) }
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack{
                URLImage(movieViewModel.backdropPath).resizable().scaledToFill()
                BlurView(style: .systemUltraThinMaterialDark)
            }.frame(height: bannerHeight).edgesIgnoringSafeArea(.top)
            
            HStack{
                URLImage(movieViewModel.posterPath).resizable().frame(width: posterWidth, height: posterHeight).overlay(
                    Rectangle().stroke(Color.white, lineWidth: 6)).cornerRadius(4)
                Text(movieViewModel.title).lineLimit(2).font(.title).foregroundColor(.white).shadow(radius: 5).offset(y: -10)
            }.offset(y: yOffset).padding(.bottom, yOffset).padding()
            
            VStack{
                Text("Release in: \(movieViewModel.releaseDate)")
                Text(movieViewModel.getGenreTextListForCodes(genres: genres)).lineLimit(2)
                Spacer()
                Text(movieViewModel.overview).lineLimit(15)
                ChartView(label: "Score", value: movieViewModel.voteAverage, maxValue: 10.0, color: Color.yellow).padding()
                Spacer()
            }.offset(y: -posterHeight*2/3).padding()
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
