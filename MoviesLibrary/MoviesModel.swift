//
//  Movies.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 07.05.2022.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let overview: String
    let vote_average: Double
    let vote_count: Int
    let release_date: String
    let poster_path: String
    let genre_ids: [Int]
}

struct Movies: Decodable {
    let results: [Movie]
}

struct Genres: Decodable {
    let genres : [Genre]
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
