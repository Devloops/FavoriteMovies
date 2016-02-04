//
//  NewFavoriteMovieVC.swift
//  FavoriteMovies
//
//  Created by Amr Sami on 2/4/16.
//  Copyright © 2016 Amr Sami. All rights reserved.
//

import UIKit
import CoreData

class NewFavoriteMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var favoriteMovieImg: RoundedUIImageView!
    @IBOutlet weak var favoriteMovieTitle: UITextField!
    @IBOutlet weak var favoriteMovieDescription: UITextField!
    @IBOutlet weak var favoriteMovieImdbUrl: UITextField!
    @IBOutlet weak var favoriteMovieImdbPlot: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        favoriteMovieTitle.delegate = self
        favoriteMovieImdbPlot.delegate = self
        favoriteMovieImdbUrl.delegate = self
        favoriteMovieDescription.delegate = self
    }
    
    @IBAction func onCancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onAddImageBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        dismissViewControllerAnimated(true, completion: nil)
        self.favoriteMovieImg.image = image
    }

    @IBAction func onDoneBtnPressed(sender: AnyObject) {
        if let title = favoriteMovieTitle.text, let desc = favoriteMovieDescription.text, let imdb = favoriteMovieImdbUrl.text, let plot = favoriteMovieImdbPlot.text where title != "" && desc != "" && imdb != "" && plot != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("FavoriteMovie", inManagedObjectContext: context)!
            let favoriteMove = FavoriteMovie(entity: entity, insertIntoManagedObjectContext: context)
            
            favoriteMove.title = title
            favoriteMove.desc = desc
            favoriteMove.imdb = imdb
            favoriteMove.plot = plot
            favoriteMove.setFavoriteMovieImage(favoriteMovieImg.image!)
            
            context.insertObject(favoriteMove)
            do {
                try context.save()
            } catch let err as NSError {
                print(err.debugDescription)
            }
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
}
