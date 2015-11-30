//
//  BubbleNode.swift
//  Example
//
//  Created by Neverland on 15.08.15.
//  Copyright (c) 2015 ProudOfZiggy. All rights reserved.
//
//  BubbleNode class not made by us, but has been edited to
//  have our custom color and event titles. Will also be edited
//  to adjust the shade of the color and size of event name based
//  on rating and size of event.

import Foundation

import UIKit
import SpriteKit

class BubbleNode: SIFloatingNode {
    var labelNode = SKLabelNode(fontNamed: "")
    var event = Event()
    
    class func instantiate(event: Event, radius: CGFloat) -> BubbleNode! {
        let node = BubbleNode(circleOfRadius: radius)
        node.event = event
        configureNode(node, color: node.event.color, text: node.event.name)
        return node
    }
    
    class func configureNode(node: BubbleNode!, color: SKColor, text: String) {
        let boundingBox = CGPathGetBoundingBox(node.path);
        let radius = boundingBox.size.width / 2.0;
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius + 1.5)
        node.fillColor = color
        node.strokeColor = node.fillColor
        
        node.labelNode.text = text
        node.labelNode.position = CGPointZero
        node.labelNode.fontColor = SKColor.whiteColor()
        node.labelNode.fontSize = 8.0 + CGFloat(node.event.rating) * 2.0
        node.labelNode.userInteractionEnabled = false
        node.labelNode.verticalAlignmentMode = .Center
        node.labelNode.horizontalAlignmentMode = .Center
        node.addChild(node.labelNode)
    }
    
    
    override func selectingAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        FGSingleton.sharedInstance.currentEvent = event
        FGSingleton.sharedInstance.rootViewController.performSegue()
        return SKAction.scaleTo(1.0, duration: 0.2)
//        return SKAction.scaleTo(1.3, duration: 0.2)
    }
    
    override func normalizeAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        return SKAction.scaleTo(1, duration: 0.2)
    }
    
    override func removeAnimation() -> SKAction? {
        removeActionForKey(BubbleNode.removingKey)
        return SKAction.fadeOutWithDuration(0.2)
    }
    
    override func removingAnimation() -> SKAction {
        let pulseUp = SKAction.scaleTo(xScale + 0.13, duration: 0)
        let pulseDown = SKAction.scaleTo(xScale, duration: 0.3)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatActionForever(pulse)
        return repeatPulse
    }
}