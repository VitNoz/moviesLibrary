//
//  FavoriteMovieVC.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 08.05.2022.
//

import UIKit

class FavoriteMovieVC: UIViewController {
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let descriptionTV: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textColor = .gray
        textView.isEditable = false
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setConstraints()
    }
    
    func setConstraints() {
        
        view.addSubview(releaseDateLabel)
        NSLayoutConstraint.activate([
            releaseDateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: 20),
            releaseDateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
            ])
        
        view.addSubview(genresLabel)
        NSLayoutConstraint.activate([
            genresLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 20),
            genresLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            genresLabel.heightAnchor.constraint(equalToConstant: 50),
            genresLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
            ])
        
        view.addSubview(ratingLabel)
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: genresLabel.bottomAnchor, constant: 20),
            ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ratingLabel.heightAnchor.constraint(equalToConstant: 20),
            ratingLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
            ])
        
        view.addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 50),
            movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(descriptionTV)
        NSLayoutConstraint.activate([
            descriptionTV.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 20),
            descriptionTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTV.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
