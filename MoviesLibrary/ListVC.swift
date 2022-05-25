//
//  ListVC.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 07.05.2022.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    var moviesArray = [Movie]()
    var genresArray = [Genre]()
    static var genresDictionary = [Int:String]()
    static var favoritesMoviesArray = [Movie]()
    static var uniqueFavoriteMoviesArray = [Int]()
    
    let tableView: UITableView = {
            let tv = UITableView()
            tv.backgroundColor = UIColor.white
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies List"
        
        getMovies()
        getGenres()
        setupTableView()
        
    //MARK: - add long press gesture recognizer
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        longPressRecognizer.minimumPressDuration = 0.5
        longPressRecognizer.delegate = self
        longPressRecognizer.delaysTouchesBegan = true
        tableView.addGestureRecognizer(longPressRecognizer)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = moviesArray[indexPath.row].title
            return cell
        }
    
    //MARK: - create and fill selected movie view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movieVC = MovieVC()
        let selectedMovie = moviesArray[indexPath.row]
        
        let imageLink = "https://image.tmdb.org/t/p/w185" + selectedMovie.poster_path
        guard let url = URL(string: imageLink) else { return }
        if let data = try? Data(contentsOf: url) {
            movieVC.movieImage.image = UIImage(data: data)
        }
        
        movieVC.title = selectedMovie.title
        movieVC.yearLabel.text = "Realease year: " + (selectedMovie.release_date).prefix(4)
        movieVC.descriptionTV.text = selectedMovie.overview
        navigationController?.pushViewController(movieVC, animated: true)
    }
    
    //MARK: - add movie to favorites by long press on cell
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchCell = longPressGestureRecognizer.location(in: self.tableView)
            if let indexPath = tableView.indexPathForRow(at: touchCell) {
                if ListVC.uniqueFavoriteMoviesArray.contains(indexPath.row) { return }
                ListVC.favoritesMoviesArray.append(moviesArray[indexPath.row])
                ListVC.uniqueFavoriteMoviesArray.append(indexPath.row)
            }
        }
    }
}

