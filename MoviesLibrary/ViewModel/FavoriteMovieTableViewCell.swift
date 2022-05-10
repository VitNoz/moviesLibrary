//
//  FavoriteMovieTableViewCell.swift
//  MoviesLibrary
//
//  Created by Vitalik Nozhenko on 09.05.2022.
//

import UIKit

class FavoriteMovieTableViewCell: UITableViewCell {
    
    @IBOutlet var favoriteMovieNameLabel: UILabel!
    @IBOutlet var favoriteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
