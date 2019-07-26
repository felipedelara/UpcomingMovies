//
//  GenresResultModel.swift
//  UpcomingMovies
//
//  Created by Felipe on 25/07/19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation

//   let genresResponseModel = try GenresResponseModel(json)

typealias Genres = [Genre]

// MARK: - GenresResponseModel
class GenresResponseModel: Codable {
    let genres: [Genre]?
    
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
    
    init(genres: [Genre]?) {
        self.genres = genres
    }
}

// MARK: GenresResponseModel convenience initializers and mutators

extension GenresResponseModel {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(GenresResponseModel.self, from: data)
        self.init(genres: me.genres)
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
        genres: [Genre]?? = nil
        ) -> GenresResponseModel {
        return GenresResponseModel(
            genres: genres ?? self.genres
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Genre
class Genre: Codable {
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}

// MARK: Genre convenience initializers and mutators

extension Genre {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Genre.self, from: data)
        self.init(id: me.id, name: me.name)
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
        id: Int?? = nil,
        name: String?? = nil
        ) -> Genre {
        return Genre(
            id: id ?? self.id,
            name: name ?? self.name
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
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
