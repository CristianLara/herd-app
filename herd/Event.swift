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
    var image: UIImage!
//  map of comments
    
    class func instantiate(name: String, size: CGFloat, color: SKColor, location: String, date: String, time: String, rating: Double, image: UIImage) -> Event! {
        let event = Event()
        event.name = name
        event.size = size
        event.color = color
        event.location = location
        event.date = date
        event.time = time
        event.rating = rating
        event.image = image
        return event
    }
    
}