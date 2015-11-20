//
//  ViewController.swift
//  herd
//
//  Created by Cristian Lara on 11/13/15.
//  Copyright © 2015 cs147. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var event1: UIButton!
    @IBOutlet weak var event2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("lol")
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
    
    @IBAction func pan(sender: UIPanGestureRecognizer) {
    }


}

