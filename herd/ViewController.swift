//
//  ViewController.swift
//  herd
//
//  Created by Cristian Lara on 11/13/15.
//  Copyright © 2015 cs147. All rights reserved.
//
//  This ViewController handles everything in the Home Page.
//  It contains all the events and bubbles, and is connected
//  to the event page.

import UIKit
import SpriteKit

class ViewController: UIViewController {
    //instance variables for the floating bubbles scene
    private var skView: SKView!
    private var floatingCollectionScene: BubblesScene!
    //array of events
    var Events = [Event]()
    var now:Bool = true

    @IBOutlet weak var upcomingButton: UIButton!
    @IBAction func upcoming(sender: UIButton) {
        if now {
            now = false
            for node in floatingCollectionScene.floatingNodes {
                node.removeFromParent()
            }
            Events.removeAll()
            addUpcomingEvents()
            
            UIView.animateWithDuration(1, animations: {
                sender.transform = CGAffineTransformMakeScale(1, 1)
                self.nowButton.transform = CGAffineTransformMakeScale(0.5, 0.5)
                sender.center.x = self.view.bounds.width / 2
                self.nowButton.center.x = self.nowButton.bounds.width / 2 + 20
                sender.alpha = 1.0
                self.nowButton.alpha = 0.4
            })
        }
    }
    
    @IBOutlet weak var nowButton: UIButton!
    @IBAction func now(sender: UIButton) {
        if !now {
            now = true
            for node in floatingCollectionScene.floatingNodes {
                node.removeFromParent()
            }
            Events.removeAll()
            addCurrentEvents()
            
            UIView.animateWithDuration(1, animations: {
                sender.transform = CGAffineTransformMakeScale(1, 1)
                self.upcomingButton.transform = CGAffineTransformMakeScale(0.5, 0.5)
                sender.center.x = self.view.bounds.width / 2
                self.upcomingButton.center.x = self.view.bounds.width - self.upcomingButton.bounds.width / 2
                sender.alpha = 1.0
                self.upcomingButton.alpha = 0.4
            })
        }
    }
    
    
    //when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        self.upcomingButton.alpha = 0.4
//        self.upcomingButton.
        upcomingButton.transform = CGAffineTransformMakeScale(0.5, 0.5)
        FGSingleton.sharedInstance.rootViewController = self //makes this view available globally
        setupScene() //setup the bubbles scene
        addCurrentEvents() //create our events and make bubbles
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
    private func addCurrentEvents() {
        //hard coded events
        Events.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!))
        Events.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!))
        Events.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!))
        
        //make a bubbles for each event and add it to the scene
        for event in Events {
            let node = BubbleNode.instantiate(event, radius: event.size)
            floatingCollectionScene.addChild(node)
        }
    }
    
    //Creates our events and uses them to make bubbles
    private func addUpcomingEvents() {
        //hard coded events
        Events.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!))
        Events.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!))
        Events.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!))
        Events.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!))
        Events.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!))
        Events.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!))
        Events.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!))
        Events.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!))
        Events.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!))
        Events.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!))
        Events.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!))
        Events.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!))
        Events.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!))
        
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

