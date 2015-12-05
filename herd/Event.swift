//
//  Event.swift
//  Example
//
//  Created by Cristian Lara on 11/26/15.
//  Copyright © 2015 ProudOfZiggy. All rights reserved.
//
//  This is the class that represents an event. For each event,
//  and instance of this class is created. It holds all the
//  relevant information.

import Foundation

import UIKit
import SpriteKit


class Event {
    var labelNode = SKLabelNode(fontNamed: "")
    var name: String!
    var size: CGFloat!
    var color: SKColor!
    var location: String!
    var date: String!
    var time: String!
    var rating: Double!
    var image: UIImage! = UIImage(named: "placeholder.png")
//  map of comments
    
    class func instantiate(name: String, size: CGFloat, location: String, date: String, time: String, rating: Double, image: UIImage, now: Bool) -> Event! {
        let event = Event()
        event.name = name
        event.size = size
        if now {
            event.color = SKColor.init(hue: 0.39, saturation: 1.0 - (5 - CGFloat(rating)) * 0.2, brightness: 0.85, alpha: 1.0)
        } else {
            event.color = SKColor.init(red: 0.22, green: 0.85, blue: 0.43, alpha: 1.0)
        }
        event.location = location
        event.date = date
        event.time = time
        event.rating = rating
        event.image = image
        return event
    }
    
}