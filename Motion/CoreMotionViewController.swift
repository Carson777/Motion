//
//  ViewController.swift
//  Motion
//
//  Created by Carson Capper on 7/14/16.
//  Copyright © 2016 Carson Capper. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
  
    var coreMotionManager :CMMotionManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    private func setup() {
        var speed :CGFloat = 0.0
        var positionY :CGFloat = 0.0
        self.coreMotionManager = CMMotionManager()
        if self.coreMotionManager.deviceMotionAvailable {
            self.coreMotionManager.deviceMotionUpdateInterval = 0.1
            self.coreMotionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) { (data :CMDeviceMotion?, error: NSError?) in
                guard let accelerationY = data?.gravity.y else {
                    fatalError("Gravity is not defined")
                }
                if accelerationY >= -0.58 && accelerationY <= -0.27 {
                    
                    speed = 5
                    positionY += self.textView.frame.origin.y + speed
                    let newOffset = CGPointMake(0, positionY)
                    self.textView.setContentOffset(newOffset, animated: true)
                }
                    
                else if accelerationY >= -0.92 && accelerationY <= -0.86 {
                    speed = 5
                    positionY -= self.textView.frame.origin.y + speed
                    let newOffset = CGPointMake(0, positionY)
                    self.textView.setContentOffset(newOffset, animated: true)
                }
                print(accelerationY)
        }
        
        
        
    }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

