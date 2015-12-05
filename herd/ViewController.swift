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

class ViewController: UIViewController, UITextFieldDelegate {
    //instance variables for the floating bubbles scene
    private var skView: SKView!
    var floatingCollectionScene: BubblesScene!
    //array of events
    var currentEvents = [Event]()
    var upcomingEvents = [Event]()
    var now:Bool = true

//    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var upcomingButton: UIButton!
    @IBAction func upcoming(sender: UIButton) {
        if now {
            now = false
            for node in floatingCollectionScene.floatingNodes {
                node.removeFromParent()
            }
            for event in upcomingEvents {
                let node = BubbleNode.instantiate(event, radius: event.size)
                floatingCollectionScene.addChild(node)
            }
            
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
            for event in currentEvents {
                let node = BubbleNode.instantiate(event, radius: event.size)
                floatingCollectionScene.addChild(node)
            }
            
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
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        if !now {
//            UIView.animateWithDuration(1, animations: {
//                self.upcomingButton.center.x = 0
//                self.nowButton.center.x = -200
//                print("APPEARING")
//            })
//        }
//    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        if !now {
//            UIView.animateWithDuration(3, animations: {
//                self.upcomingButton.center.x = self.view.bounds.width / 2
//                self.nowButton.center.x = 50
//                print("APPEARING")
//            })
//        }
//    }
    
    //when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.sortButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
//        self.sortButton.setTitle(String.fontAwesomeIconWithName(FontAwesome.Sort), forState: .Normal)
        self.upcomingButton.alpha = 0.4
        upcomingButton.transform = CGAffineTransformMakeScale(0.5, 0.5)
        FGSingleton.sharedInstance.rootViewController = self //makes this view available globally
        setupScene() //setup the bubbles scene
        createCurrentEvents() //create our events and make bubbles
        createUpcomingEvents()
        for event in currentEvents {
            let node = BubbleNode.instantiate(event, radius: event.size)
            floatingCollectionScene.addChild(node)
        }
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
    private func createCurrentEvents() {
        //hard coded events
        currentEvents.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!, now: true))
        currentEvents.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!, now: true))
        currentEvents.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!, now: true))
        currentEvents.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!, now: true))
        currentEvents.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!, now: true))
        currentEvents.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!, now: true))
        currentEvents.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!, now: true))
        currentEvents.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!, now: true))
        currentEvents.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!, now: true))
        currentEvents.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!, now: true))
        currentEvents.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!, now: true))
        currentEvents.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!, now: true))
        currentEvents.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!, now: true))
        currentEvents.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!, now: true))
        currentEvents.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!, now: true))
        currentEvents.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!, now: true))
        currentEvents.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!, now: true))
        currentEvents.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!, now: true))
        currentEvents.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!, now: true))
        currentEvents.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!, now: true))
//        }
    }
    
    //Creates our events and uses them to make bubbles
    private func createUpcomingEvents() {
        //hard coded events
        upcomingEvents.append(Event.instantiate("Phi Psi", size: 60.0, location: "Phi Psi", date: "Oct 24, 2015", time: "10pm - 1am", rating: 4.0, image: UIImage(named: "volcano-f1.jpg")!, now: false))
        upcomingEvents.append(Event.instantiate("Frost", size: 70.0, location: "Amphitheatre", date: "Oct 24, 2015", time: "1pm - 5pm", rating: 5.0, image: UIImage(named: "splash.png")!, now: false))
        upcomingEvents.append(Event.instantiate("Wine&Cheese", size: 40.0, location: "Kairos", date: "Oct 24, 2015", time: "10pm - 1am", rating: 3.0, image: UIImage(named: "winecheese1.jpg")!, now: false))
        upcomingEvents.append(Event.instantiate("EBF", size: 50.0, location: "EBF", date: "Oct 24, 2015", time: "10pm - 1am", rating: 2.0, image: UIImage(named: "splash.png")!, now: false))
        upcomingEvents.append(Event.instantiate("Karaoke", size: 30.0, location: "Wilbur", date: "Oct 24, 2015", time: "10pm - 1am", rating: 1.0, image: UIImage(named: "mic.jpg")!, now: false))
    }
    
    //public function to handle transition to event page. Is called by each bubble when pressed
    func performSegue() {
        self.performSegueWithIdentifier("EventPageSegue", sender: self) //segues into the "EventPage"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "EventPageSegue" {
//            if let destinationVC = segue.destinationViewController as? EventViewController{
//            }
//        }
//        if !now {
//            self.upcomingButton.center.x = self.view.bounds.width / 2
//            self.nowButton.center.x = self.nowButton.bounds.width / 2 + 20
//        }
//    }
}

