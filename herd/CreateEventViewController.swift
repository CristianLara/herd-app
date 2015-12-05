//
//  CreateEventViewController.swift
//  Herd
//
//  Created by Cristian Lara on 12/1/15.
//  Copyright © 2015 cs147. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var name: UITextField! = nil
    @IBOutlet weak var location: UITextField! = nil
    @IBOutlet weak var time: UITextField! = nil
    @IBOutlet weak var date: UITextField! = nil
    @IBOutlet weak var desc: UITextField! = nil
    
    @IBAction func done(sender: UIBarButtonItem) {
        let newEvent = Event.instantiate(name.text!, size: 30, location: location.text!, date: date.text!, time: time.text!, rating: 0, image: image.image!, now: false)
        FGSingleton.sharedInstance.rootViewController.upcomingEvents.append(newEvent)
        if !FGSingleton.sharedInstance.rootViewController.now {
            let node = BubbleNode.instantiate(newEvent, radius: newEvent.size)
            FGSingleton.sharedInstance.rootViewController.floatingCollectionScene.addChild(node)
        }
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
        print("pushed")
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
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
        image.image = chosenImage //4
//        let sender = FGSingleton.sharedInstance.rootViewController.upcomingButton
//        let nowButton = FGSingleton.sharedInstance.rootViewController.nowButton
//        UIView.animateWithDuration(1, animations: {
//            sender.transform = CGAffineTransformMakeScale(1, 1)
//            nowButton.transform = CGAffineTransformMakeScale(0.5, 0.5)
//            sender.center.x = self.view.bounds.width / 2
//            nowButton.center.x = nowButton.bounds.width / 2 + 20
//            sender.alpha = 1.0
//            nowButton.alpha = 0.4
//        })
        dismissViewControllerAnimated(true, completion: nil) //5
    }
    
    var picker: UIImagePickerController! = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate=self
        location.delegate=self
        time.delegate=self
        date.delegate=self
        desc.delegate=self
        picker.delegate = self
        image.clipsToBounds = true
        
        
        cameraButton.titleLabel?.font = UIFont.fontAwesomeOfSize(25)
        cameraButton.setTitle(String.fontAwesomeIconWithName(.Camera), forState: .Normal)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
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
