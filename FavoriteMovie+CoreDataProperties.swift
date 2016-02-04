//
//  FavoriteMovie+CoreDataProperties.swift
//  FavoriteMovies
//
//  Created by Amr Sami on 2/4/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FavoriteMovie {

    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var imdb: String?
    @NSManaged var plot: String?
    @NSManaged var image: NSData?

}
