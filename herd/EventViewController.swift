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

class EventViewController: UIViewController {
    //references to the labels in the storyboard
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var rating: UILabel!
    
    
    //before view appears, update the information to represent the event that was clicked
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = FGSingleton.sharedInstance.currentEvent.name
        
        location.text = FGSingleton.sharedInstance.currentEvent.location
        date.text = FGSingleton.sharedInstance.currentEvent.date
        time.text = FGSingleton.sharedInstance.currentEvent.time
        image.image = FGSingleton.sharedInstance.currentEvent.image
        
        let ratingNum = FGSingleton.sharedInstance.currentEvent.rating
        if ratingNum == 5 {
            rating.text = "\(ratingNum) Looks awesome!"
        } else if ratingNum >= 4 {
            rating.text = "\(ratingNum) Looks good!"
        } else if ratingNum >= 3 {
            rating.text = "\(ratingNum) Not bad."
        } else if ratingNum >= 2 {
            rating.text = "\(ratingNum) Not so hot."
        } else if ratingNum >= 1 {
            rating.text = "\(ratingNum) Needs some work."
        } else {
            rating.text = "\(ratingNum) Looks bad."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
