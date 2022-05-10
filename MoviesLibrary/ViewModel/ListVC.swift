//
//  ListVC.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 07.05.2022.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    //weak var delegate: FillFavoritesMoviesArrayDelegate?
    
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
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        longPressRecognizer.minimumPressDuration = 0.5
        longPressRecognizer.delegate = self
        longPressRecognizer.delaysTouchesBegan = true
        tableView.addGestureRecognizer(longPressRecognizer)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        makeGenresDictionary()
//    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movieVC = MovieVC()
        let imageLink = "https://image.tmdb.org/t/p/w185" + moviesArray[indexPath.row].poster_path
        let url = URL(string: imageLink)!
        if let data = try? Data(contentsOf: url) {
            movieVC.movieImage.image = UIImage(data: data)
        }
        movieVC.title = moviesArray[indexPath.row].title
        movieVC.yearLabel.text = "Realease year: " + (moviesArray[indexPath.row].release_date).prefix(4)
        movieVC.descriptionTV.text = moviesArray[indexPath.row].overview
        navigationController?.pushViewController(movieVC, animated: true)
    }
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchCell = longPressGestureRecognizer.location(in: self.tableView)
            if let indexPath = tableView.indexPathForRow(at: touchCell) {
                if ListVC.uniqueFavoriteMoviesArray.contains(indexPath.row) { return }
                //delegate?.addFavoriteMovie(favoriteMovie: moviesArray[indexPath.row])
                ListVC.favoritesMoviesArray.append(moviesArray[indexPath.row]) //work without delegate
                ListVC.uniqueFavoriteMoviesArray.append(indexPath.row)
            }
        }
    }
    
//    func makeGenresDictionary () {
//            for genre in self.genresArray {
//                self.genresDictionary.updateValue("\(genre.name)", forKey: genre.id)
//            }
//            print(self.genresDictionary)
//        }
}

