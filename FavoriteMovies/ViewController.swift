//
//  ViewController.swift
//  FavoriteMovies
//
//  Created by Amr Sami on 2/4/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteMovies = [FavoriteMovie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequst = NSFetchRequest(entityName: "FavoriteMovie")
        
        do {
            let favMovies = try context.executeFetchRequest(fetchRequst) as! [FavoriteMovie]
            favoriteMovies = favMovies
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteMovie") as? FavoriteMovieCell {
            
            let favoriteMovie = favoriteMovies[indexPath.row]
            
            cell.favoriteMoveTitle.text = favoriteMovie.title
            cell.favoriteMovieDescription.text = favoriteMovie.desc
            cell.favoriteMovieIMDB.text = favoriteMovie.imdb
            cell.favoriteMovieImg.image = favoriteMovie.getFavoriteMovieImg()
            
            return cell
            
        } else {
            return FavoriteMovieCell()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "FavoriteMovieDetails" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let destinationController = segue.destinationViewController as! FavoriteMovieDetails
                destinationController.favoriteMovie = favoriteMovies[row]
            }
        }
    }
    
    
}

