//
//  UpcomingViewController.swift
//  herd
//
//  Created by Cristian Lara on 11/27/15.
//  Copyright © 2015 cs147. All rights reserved.
//

import UIKit
import SpriteKit

class UpcomingViewController: UIViewController {
    //instance variables for the floating bubbles scene
    private var skView: SKView!
    private var floatingCollectionScene: BubblesScene!
    //array of events
    var Events = [Event]()
    
    //when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        FGSingleton.sharedInstance.upcomingViewController = self //makes this view available globally
        setupScene() //setup the bubbles scene
        addEvents() //create our events and make bubbles
    }
    
    //Uses the bubbles class (that I didn't make). Shouldn't mess with this too much
    private func setupScene() {
        skView = SKView(frame: UIScreen.mainScreen().bounds)
        skView.backgroundColor = SKColor.whiteColor()
        view.addSubview(skView)
        floatingCollectionScene = BubblesScene(size: skView.bounds.size)
        let navBarHeight = CGRectGetHeight(navigationController!.navigationBar.frame)
        let statusBarHeight = CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)
        floatingCollectionScene.topOffset = navBarHeight + statusBarHeight
        skView.presentScene(floatingCollectionScene)
    }
    
    //Creates our events and uses them to make bubbles
    private func addEvents() {
        let color = SKColor.init(red: 57.0/255.0, green: 217.0/255.0, blue: 110.0/255.0, alpha: 1.0)
        
        //hard coded events
        Events.append(Event.instantiate("Full Moon", size: 60.0, color: color, location: "Main Quad", date: "Oct 24, 2015", time: "10pm - 12am", rating: 4.8, image: UIImage(named: "mqdefault.jpg")!))
        Events.append(Event.instantiate("future event1", size: 40.0, color: color, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.2, image: UIImage(named: "winecheese1.jpg")!))
        Events.append(Event.instantiate("future event2", size: 30.0, color: color, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.1, image: UIImage(named: "mic.jpg")!))
        
        //make a bubbles for each event and add it to the scene
        for event in Events {
            let node = BubbleNode.instantiate(event, radius: event.size)
            floatingCollectionScene.addChild(node)
        }
    }
    
    //public function to handle transition to event page. Is called by each bubble when pressed
    func performSegue() {
        self.performSegueWithIdentifier("EventPageSegue", sender: self) //segues into the "EventPage"
    }
    
    
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //        if segue.identifier == "EventPageSegue" {
    //            if let destinationVC = segue.destinationViewController as? EventViewController{
    //            }
    //        }
    //    }
}