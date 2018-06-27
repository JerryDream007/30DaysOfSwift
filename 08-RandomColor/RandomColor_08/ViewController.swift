//
//  ViewController.swift
//  RandomColor_08
//
//  Created by 宋澎 on 2018/6/8.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    var timer = Timer()
    
    var isPlaying = false
    
    var rollingAnimation = CABasicAnimation()

    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.locations = [0.1,0.3,0.5,0.7,0.9]
        
        gradientLayer.colors = [self.getRandomColor(alpha: 0.3).cgColor,self.getRandomColor(alpha: 0.3).cgColor,self.getRandomColor(alpha: 0.3).cgColor,self.getRandomColor(alpha: 0.3).cgColor,self.getRandomColor(alpha: 0.3).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.insertSublayer(gradientLayer, below: playButton.layer)
        
        
        self.playButton.layer.cornerRadius = self.playButton.frame.height/2
        
        self.playButton.clipsToBounds = true
        
        
        let pathString = Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")
        
        let musicUrl = URL(fileURLWithPath: pathString!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            
            try AVAudioSession.sharedInstance().setActive(true)
            
            try audioPlayer = AVAudioPlayer(contentsOf: musicUrl)
            
            audioPlayer.prepareToPlay()
            
        } catch let audioError as NSError {
            print("播放失败,error = \(audioError)")
        }
        
        rollingAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        
        rollingAnimation.toValue = CGFloat.pi * 2
        
        rollingAnimation.duration = 2
        
        rollingAnimation.isCumulative = true
        
        rollingAnimation.isRemovedOnCompletion = false
        
        rollingAnimation.repeatCount = MAXFLOAT
        
        rollingAnimation.fillMode = kCAFillModeForwards
        
        self.playButton.layer.speed = 0.0
        
        self.playButton.layer.anchorPoint = CGPoint(x: 0.48, y: 0.48)
        
        self.playButton.layer.add(rollingAnimation, forKey: "RollAnimation")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clickMusicButton(_ sender: Any) {
        
        isPlaying = !isPlaying
        
        if isPlaying {
            timer = Timer .scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.changesBackGroundColor), userInfo: nil, repeats: true)
            
            self.audioPlayer.play()
            
            self.rollingMusicButton(isRoll: true)
            
        }else{
            timer.invalidate()
            
            self.audioPlayer.pause()
            
            self.rollingMusicButton(isRoll: false)
        }
    }
    
    @objc func changesBackGroundColor(){
        
        self.view.backgroundColor = self.getRandomColor(alpha: 1.0)
    }
    
    func getRandomColor(alpha:CGFloat) -> UIColor{
        
        let red = CGFloat(arc4random() % 256)
        
        let green = CGFloat(arc4random() % 256)
        
        let blue = CGFloat(arc4random() % 256)
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    func rollingMusicButton(isRoll:Bool){
        if isRoll{
            
            let pauseTime = self.playButton.layer.timeOffset
            
            let beginTime = CACurrentMediaTime() - pauseTime
            
            self.playButton.layer.timeOffset = 0
            
            self.playButton.layer.beginTime = beginTime
            
            self.playButton.layer.speed = 1.0
            
        }else{
            
            let pauseTime = self.playButton.layer .convertTime(CACurrentMediaTime(), from: nil)
            
            self.playButton.layer.timeOffset = pauseTime
            
            self.playButton.layer.speed = 0.0
            
        }
    }
}

