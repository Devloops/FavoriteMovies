//
//  FavoriteMovieCell.swift
//  FavoriteMovies
//
//  Created by Amr Sami on 2/4/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit

class FavoriteMovieCell: UITableViewCell {

    @IBOutlet weak var favoriteMovieImg: RoundedUIImageView!
    @IBOutlet weak var favoriteMovieIMDB: UILabel!
    @IBOutlet weak var favoriteMovieDescription: UILabel!
    @IBOutlet weak var favoriteMoveTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
