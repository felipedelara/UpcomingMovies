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

struct ContentView : View {
    @EnvironmentObject var movieProvider: MoviesProvider

    var body: some View {
        NavigationView {
            List{
                ForEach (movieProvider.movies){ item in
                    HStack{
                        URLImage(item.getAbsolutePosterURL()).resizable().frame(width: 50.0, height: 75.0).padding(10)
                        VStack(alignment: .leading){
                        Text(item.title ?? "no title")
                        Text(item.releaseDate ?? "no date")
                        }
                    }
                }
            }.navigationBarTitle(Text("Upcoming Movies"))
        }
    }
}

#if DEBUG
let viewModel = MoviesProvider()
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(viewModel)
    }
}
#endif
