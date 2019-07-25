
// This file was generated from JSON Schema using quicktype
// Modificate with caution

import Foundation
import Combine
import SwiftUI

// MARK: - ResultModel
class GetMoviesResultModel: Codable {
    let results: [Result]?
    let page: Int?
    let totalResults: Int?
    let dates: Dates?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalResults
        case dates
        case totalPages
    }
    
    init(results: [Result]?, page: Int?, totalResults: Int?, dates: Dates?, totalPages: Int?) {
        self.results = results
        self.page = page
        self.totalResults = totalResults
        self.dates = dates
        self.totalPages = totalPages
    }
}

// MARK: ResultModel convenience initializers and mutators

extension GetMoviesResultModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(GetMoviesResultModel.self, from: data)
        self.init(results: me.results, page: me.page, totalResults: me.totalResults, dates: me.dates, totalPages: me.totalPages)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        results: [Result]?? = nil,
        page: Int?? = nil,
        totalResults: Int?? = nil,
        dates: Dates?? = nil,
        totalPages: Int?? = nil
        ) -> GetMoviesResultModel {
        return GetMoviesResultModel(
            results: results ?? self.results,
            page: page ?? self.page,
            totalResults: totalResults ?? self.totalResults,
            dates: dates ?? self.dates,
            totalPages: totalPages ?? self.totalPages
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Dates
class Dates: Codable {
    let maximum: String?
    let minimum: String?
    
    enum CodingKeys: String, CodingKey {
        case maximum
        case minimum
    }
    
    init(maximum: String?, minimum: String?) {
        self.maximum = maximum
        self.minimum = minimum
    }
}

// MARK: Dates convenience initializers and mutators

extension Dates {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Dates.self, from: data)
        self.init(maximum: me.maximum, minimum: me.minimum)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        maximum: String?? = nil,
        minimum: String?? = nil
        ) -> Dates {
        return Dates(
            maximum: maximum ?? self.maximum,
            minimum: minimum ?? self.minimum
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

typealias Movies = [Result]

// MARK: - Result
class Result: Codable, Identifiable{
    let voteCount: Int?
    let id: Int?
    let video: Bool?
    let voteAverage: Double?
    let title: String?
    let popularity: Double?
    let posterPath: String?
    let originalLanguage: OriginalLanguage?
    let originalTitle: String?
    let genreIDS: [Int]?
    let backdropPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    
    //Quicktype is not handling complex key names very well, so if they have more that one word it is best to specify
    enum CodingKeys: String, CodingKey {
        case voteCount
        case id
        case video
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
    
    init(voteCount: Int?, id: Int?, video: Bool?, voteAverage: Double?, title: String?, popularity: Double?, posterPath: String?, originalLanguage: OriginalLanguage?, originalTitle: String?, genreIDS: [Int]?, backdropPath: String?, adult: Bool?, overview: String?, releaseDate: String?) {
        self.voteCount = voteCount
        self.id = id
        self.video = video
        self.voteAverage = voteAverage
        self.title = title
        self.popularity = popularity
        self.posterPath = posterPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreIDS = genreIDS
        self.backdropPath = backdropPath
        self.adult = adult
        self.overview = overview
        self.releaseDate = releaseDate
    }
    
    //Technical Debt, safe unwrapping this here until I figure how to handle not returning an optional to the SwiftUI View
    public func getAbsolutePosterURL() -> URL{
        //Example: https://image.tmdb.org/t/p/w500///wUTiyJ9N8rVLOxJz7aVpaBLpbot.jpg
        let stringURL = "https://image.tmdb.org/t/p/w500/\(self.posterPath ?? "")"
        let url = URL(string: stringURL)
        return url!
    }
}

// MARK: Result convenience initializers and mutators

extension Result {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Result.self, from: data)
        self.init(voteCount: me.voteCount, id: me.id, video: me.video, voteAverage: me.voteAverage, title: me.title, popularity: me.popularity, posterPath: me.posterPath, originalLanguage: me.originalLanguage, originalTitle: me.originalTitle, genreIDS: me.genreIDS, backdropPath: me.backdropPath, adult: me.adult, overview: me.overview, releaseDate: me.releaseDate)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        voteCount: Int?? = nil,
        id: Int?? = nil,
        video: Bool?? = nil,
        voteAverage: Double?? = nil,
        title: String?? = nil,
        popularity: Double?? = nil,
        posterPath: String?? = nil,
        originalLanguage: OriginalLanguage?? = nil,
        originalTitle: String?? = nil,
        genreIDS: [Int]?? = nil,
        backdropPath: String?? = nil,
        adult: Bool?? = nil,
        overview: String?? = nil,
        releaseDate: String?? = nil
        ) -> Result {
        return Result(
            voteCount: voteCount ?? self.voteCount,
            id: id ?? self.id,
            video: video ?? self.video,
            voteAverage: voteAverage ?? self.voteAverage,
            title: title ?? self.title,
            popularity: popularity ?? self.popularity,
            posterPath: posterPath ?? self.posterPath,
            originalLanguage: originalLanguage ?? self.originalLanguage,
            originalTitle: originalTitle ?? self.originalTitle,
            genreIDS: genreIDS ?? self.genreIDS,
            backdropPath: backdropPath ?? self.backdropPath,
            adult: adult ?? self.adult,
            overview: overview ?? self.overview,
            releaseDate: releaseDate ?? self.releaseDate
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum OriginalLanguage: String, Codable {
    case de = "de"
    case en = "en"
    case es = "es"
    case ko = "ko"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
