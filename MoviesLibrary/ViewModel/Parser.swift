//
//  Parser.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 07.05.2022.
//

import Foundation

extension ListVC {
    
    func getMovies() {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=184e75efa627664fffa178dd48fec464&language=en-US&page=1") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    let parseMovies = try JSONDecoder().decode(Movies.self, from: data)
                    self.moviesArray = parseMovies.results
                    self.tableView.reloadData()
                    //print(parseMovies)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

        func getGenres() {
            
            guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=184e75efa627664fffa178dd48fec464&language=en-US") else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    do {
                        let parseGenres = try JSONDecoder().decode(Genres.self, from: data)
                        self.genresArray = parseGenres.genres
                        ListVC.genresDictionary = makeGenresDictionary()
                        func makeGenresDictionary () -> [Int:String] {
                                for genre in self.genresArray {
                                    ListVC.genresDictionary.updateValue("\(genre.name)", forKey: genre.id)
                                }
                            return ListVC.genresDictionary
                            }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }


