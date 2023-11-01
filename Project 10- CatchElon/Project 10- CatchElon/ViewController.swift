//
//  ViewController.swift
//  Project 10- CatchElon
//
//  Created by Ahmet Tunahan Bekdaş on 31.10.2023.
//

import UIKit

// MARK: - VARIABLES
var score = 0
var highScore = 0
var time = 5
var timer = Timer()
var hiddemTimer = Timer()
var elonArray = [UIImageView]()

// MARK: - IMAGES AND LABELS
class ViewController: UIViewController {
    
    @IBOutlet weak var elon1: UIImageView!
    @IBOutlet weak var elon2: UIImageView!
    @IBOutlet weak var elon3: UIImageView!
    @IBOutlet weak var elon4: UIImageView!
    @IBOutlet weak var elon5: UIImageView!
    @IBOutlet weak var elon6: UIImageView!
    @IBOutlet weak var elon7: UIImageView!
    @IBOutlet weak var elon8: UIImageView!
    @IBOutlet weak var elon9: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
// MARK: - VİEWDİDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // IMAGES TIKLANABİLİR
        elon1.isUserInteractionEnabled = true
        elon2.isUserInteractionEnabled = true
        elon3.isUserInteractionEnabled = true
        elon4.isUserInteractionEnabled = true
        elon5.isUserInteractionEnabled = true
        elon6.isUserInteractionEnabled = true
        elon7.isUserInteractionEnabled = true
        elon8.isUserInteractionEnabled = true
        elon9.isUserInteractionEnabled = true
        
        // TIKLAMA AKSİYONU VERDİK
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapElon))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tapElon))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tapElon))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(tapElon))
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(tapElon))
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(tapElon))
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(tapElon))
        let tap8 = UITapGestureRecognizer(target: self, action: #selector(tapElon))
        let tap9 = UITapGestureRecognizer(target: self, action: #selector(tapElon))

        // AKSİYONLARI IMAGES ATADIK
        elon1.addGestureRecognizer(tap1)
        elon2.addGestureRecognizer(tap2)
        elon3.addGestureRecognizer(tap3)
        elon4.addGestureRecognizer(tap4)
        elon5.addGestureRecognizer(tap5)
        elon6.addGestureRecognizer(tap6)
        elon7.addGestureRecognizer(tap7)
        elon8.addGestureRecognizer(tap8)
        elon9.addGestureRecognizer(tap9)
        
        // TİMER
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        // HIDDEN TIMER
        hiddemTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(elonHidden), userInfo: nil, repeats: true)
        
        // HIGH SCORE CHECK
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storedHighScore == nil {
            highScore = 0
            highscoreLabel.text = "High Score: \(highScore)"
        }
        if let newHighScore = storedHighScore as? Int {
            highScore = newHighScore
            highscoreLabel.text = "High Score \(highScore)"
        }
        
        elonArray = [elon1, elon2, elon3, elon4, elon5, elon6, elon7, elon8, elon9]
        
        elonHidden()
    }
    
    
    
    // MARK: - FUNCTİONS
    
    @objc func elonHidden() {
        for elons in elonArray{
            elons.isHidden = true
        }
        
        let random = arc4random_uniform(UInt32(elonArray.count - 1))
        elonArray[Int(random)].isHidden = false
        
      
    }
    
    // SCORE
    @objc func tapElon() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    // TİME
    @objc func timerAction() {
        
        time -= 1
        timeLabel.text = String(time)
        
        if  time == 0 {
            timer.invalidate()
            hiddemTimer.invalidate()
            showAlert(message: "Times Up!")
            updateHighScore()
        }
    }
    
    // ALERT
    func showAlert(message: String) {
         let alert = UIAlertController(title: "Your Score: \(score)", message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let playAgainAction = UIAlertAction(title: "Play Again", style: .default) { [weak self] (action) in
            self?.resetGame()
            self?.elonHidden()
        }
        
         alert.addAction(okAction)
         alert.addAction(playAgainAction)

         present(alert, animated: true, completion: nil)
     }
    
    // RESET GAME
    func resetGame() {
        score = 0
        time = 5
        scoreLabel.text = "Score: 0"
        timeLabel.text = "\(time)"
        highscoreLabel.text = "High Score: \(highScore)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        hiddemTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(elonHidden), userInfo: nil, repeats: true)
        
    }
    
    // UPDATE HİGH SCORE
    func updateHighScore() {
        if score > highScore {
            highScore = score
            highscoreLabel.text = "High Score: \(highScore)"
            UserDefaults.standard.set(highScore, forKey: "highScore")
        }
    }

    
    // RESET BUTTON
    @IBAction func resetButton(_ sender: Any) {
        hiddemTimer.invalidate()
        timer.invalidate()
        resetGame()
       }
    
    
   }
    

