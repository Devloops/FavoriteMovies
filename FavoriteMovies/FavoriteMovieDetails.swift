//
//  FavoriteMovieDetails.swift
//  FavoriteMovies
//
//  Created by Amr Sami on 2/4/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit

class FavoriteMovieDetails: UIViewController {
    
    @IBOutlet weak var favoriteMovieImg: RoundedUIImageView!
    @IBOutlet weak var favoriteMovieTitleLbl: UILabel!
    @IBOutlet weak var favoriteMovieDescriptionLbl: UILabel!
    @IBOutlet weak var favoriteMoviePlotLbl: UILabel!
    
    var favoriteMovie: FavoriteMovie!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        favoriteMovieImg.image = favoriteMovie.getFavoriteMovieImg()
        favoriteMovieTitleLbl.text = favoriteMovie.title
        favoriteMovieDescriptionLbl.text = favoriteMovie.desc
        favoriteMoviePlotLbl.text = favoriteMovie.plot
        
    }
    
    @IBAction func onWebBtnPressed(sender: AnyObject) {
        if let favMovieImdbUrl = favoriteMovie.imdb {
            UIApplication.sharedApplication().openURL(NSURL(string: favMovieImdbUrl)!)
        }
    }
    
    @IBAction func onCancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
