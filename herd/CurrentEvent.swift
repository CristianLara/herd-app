//
//  CurrentEvent.swift
//  herd
//
//  Created by Cristian Lara on 11/27/15.
//  Copyright © 2015 cs147. All rights reserved.
//
//  This is a global class that holds references
//  to globally known variables. Essentially, it tells
//  all the other classes what the current event is.

import UIKit

class FGSingleton {
    static let sharedInstance = FGSingleton()
    
    var currentEvent: Event!
    var rootViewController: ViewController!
}
