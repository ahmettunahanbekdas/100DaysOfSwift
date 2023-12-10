//
//  ViewController.swift
//  Project 9- Timer Project
//
//  Created by Ahmet Tunahan Bekdaş on 31.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0
    var timer = Timer()
    
   
    @IBAction func startButton(_ sender: Any) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @objc func timerFunc() {
        counter += 1
        timeLabel.text = "TIME  \(counter)"
        print(counter)
    }
}
