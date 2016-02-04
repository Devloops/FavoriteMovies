//
//  FavoriteMovie.swift
//  FavoriteMovies
//
//  Created by Amr Sami on 2/4/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FavoriteMovie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setFavoriteMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getFavoriteMovieImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
