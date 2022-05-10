//
//  MovieVC.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 07.05.2022.
//

import UIKit

class MovieVC: UIViewController {
    
    //4var movie: Movie?
    
    let movieImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    func setConstraints () {
        
        // MARK: - Add constraints for horizontal orientation
        
        view.addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(yearLabel)
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 20),
            yearLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yearLabel.heightAnchor.constraint(equalToConstant: 20),
            yearLabel.widthAnchor.constraint(equalToConstant: 300)
        
        ])
        
        view.addSubview(descriptionTV)
        NSLayoutConstraint.activate([
            descriptionTV.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20),
            descriptionTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTV.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
