//
//  ViewController.swift
//  Gesturizer
//
//  Created by Marco Nie on 17/05/2017.
//  Copyright © 2017 Marco Nie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var doubleTapRecognizer: UITapGestureRecognizer!
    
    @IBOutlet var singleTapRecognizer: UITapGestureRecognizer!
    
    @IBAction func singleTap(_ sender: UITapGestureRecognizer) {
        self.showGestureName(name: "Tap")
    }
    
    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        self.showGestureName(name: "Double Tap")
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .ended {
            self.showGestureName(name: "Pinch")
        }
    }
    
    @IBAction func rotation(_ sender: UIRotationGestureRecognizer) {
        if sender.state == .ended {
            self.showGestureName(name: "Rotation")
        }
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            self.showGestureName(name: "Right Swipe")
        }
    }
    
    @IBOutlet weak var gesturizerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        singleTapRecognizer.require(toFail: doubleTapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showGestureName(name: String) {
        gesturizerName.text = name
        UIView.animate(withDuration: 1.0,
                       animations: { self.gesturizerName.alpha = 1.0 },
                       completion: { _ in
                        UIView.animate(withDuration: 1.0, animations: { self.gesturizerName.alpha = 0.0 })
        })
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.showGestureName(name: "Shake")
        }
    }
    
}

