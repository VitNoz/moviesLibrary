//
//  Favorites.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 06.05.2022.
//

import UIKit

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    let favoritesTableView: UITableView = {
            let tv = UITableView()
            tv.backgroundColor = UIColor.white
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Favorites"
        setupFavoriteTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoritesTableView.reloadData()
    }
    
    func setupFavoriteTableView() {
        let nib = UINib(nibName: "FavoriteMovieTableViewCell", bundle: nil)
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.register(nib, forCellReuseIdentifier: "FavoriteMovieTableViewCell")

        view.addSubview(favoritesTableView)

        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            favoritesTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            favoritesTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ListVC.favoritesMoviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteMovieTableViewCell",
                                                 for: indexPath) as! FavoriteMovieTableViewCell
        cell.favoriteMovieNameLabel?.text = ListVC.favoritesMoviesArray[indexPath.row].title
        cell.favoriteImage?.image = UIImage(systemName: "bolt.heart.fill")
        return cell
    }
    
    //MARK: - create and fill selected favorite movie view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let favoriteMovieVC = FavoriteMovieVC()
        let selectedFavoriteMovie = ListVC.favoritesMoviesArray[indexPath.row]
        
        let imageLink = "https://image.tmdb.org/t/p/w185" + selectedFavoriteMovie.poster_path
        guard let url = URL(string: imageLink) else { return }
        if let data = try? Data(contentsOf: url) {
            favoriteMovieVC.movieImage.image = UIImage(data: data)
        }
        
        favoriteMovieVC.title = selectedFavoriteMovie.title
        let idGenres = selectedFavoriteMovie.genre_ids
        var stringGenres = [String]()
        for id in idGenres{
            stringGenres.append(ListVC.genresDictionary[id] ?? "")
        }
        
        favoriteMovieVC.genresLabel.text = "Genre: " + "\(stringGenres.joined(separator: ", "))"
        favoriteMovieVC.ratingLabel.text = "Rating: " + String(selectedFavoriteMovie.vote_average) + " out of " + String(selectedFavoriteMovie.vote_count) + " voters"
        favoriteMovieVC.releaseDateLabel.text = "Realease date: " + (selectedFavoriteMovie.release_date)
        favoriteMovieVC.descriptionTV.text = selectedFavoriteMovie.overview
        
        navigationController?.pushViewController(favoriteMovieVC, animated: true)
    }
    
    //MARK: - delete movie from favorites movies list
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ListVC.favoritesMoviesArray.remove(at: indexPath.row)
            ListVC.uniqueFavoriteMoviesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
