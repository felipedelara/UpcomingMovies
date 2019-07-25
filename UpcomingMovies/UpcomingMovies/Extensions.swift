//
//  Extensions.swift
//  UpcomingMovies
//
//  Created by Felipe on 25/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
