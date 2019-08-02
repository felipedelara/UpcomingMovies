//
//  ChartView.swift
//  UpcomingMovies
//
//  Created by Felipe on 29/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation
import SwiftUI

struct ChartView : View {
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
