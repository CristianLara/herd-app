//
//  EventViewController.swift
//  herd
//
//  Created by Cristian Lara on 11/26/15.
//  Copyright © 2015 cs147. All rights reserved.
//
//  This ViewController handles everything in the Event Page.
//  It has references to the labels and buttons in the Event
//  page storyboard and populates them with informataion of the current
//  event.

import UIKit

class EventViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //references to the labels in the storyboard
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var camera: UIButton!
    

    //before view appears, update the information to represent the event that was clicked
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = FGSingleton.sharedInstance.currentEvent.name
        camera.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
        camera.setTitle(String.fontAwesomeIconWithName(.Camera), forState: .Normal)
        
        location.text = FGSingleton.sharedInstance.currentEvent.location
        date.text = FGSingleton.sharedInstance.currentEvent.date
        time.text = FGSingleton.sharedInstance.currentEvent.time
        image.image = FGSingleton.sharedInstance.currentEvent.image
        image.clipsToBounds = true
        
        let ratingNum = FGSingleton.sharedInstance.currentEvent.rating
        if ratingNum == 5 {
            rating.text = "\(ratingNum) Looks awesome!"
        } else if ratingNum >= 4 {
            rating.text = "\(ratingNum) Looks good!"
        } else if ratingNum >= 3 {
            rating.text = "\(ratingNum) Not bad"
        } else if ratingNum >= 2 {
            rating.text = "\(ratingNum) Not so hot"
        } else if ratingNum >= 1 {
            rating.text = "\(ratingNum) Needs some work"
        } else {
            rating.text = "\(ratingNum) Looks bad"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
    var picker: UIImagePickerController! = UIImagePickerController()
    @IBAction func takePhoto(sender: UIButton) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            presentViewController(picker, animated: true, completion: nil)
        } else {
            noCamera()
        }
    }
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .Alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.Default,
            handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC,
            animated: true,
            completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        image.contentMode = .ScaleAspectFill //3
        FGSingleton.sharedInstance.currentEvent.image = chosenImage
        image.image = chosenImage //4
        dismissViewControllerAnimated(true, completion: nil) //5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
