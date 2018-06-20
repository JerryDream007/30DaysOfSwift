//
//  VideoViewController.swift
//  VideoBackground_10
//
//  Created by 宋澎 on 2018/6/13.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit
import AVKit

public enum ScalingModel {
    case resize
    case resizeAspect
    case resizeAspectFill
}

open class VideoViewController: UIViewController {
    
    fileprivate let moviePlayer = AVPlayerViewController()
    
    fileprivate var moviePlayerSoundLevel:Float = 1.0
    
    open var contentURL: URL?{
        didSet{
            if let _contentURL = contentURL{
                moviePlayer.player = AVPlayer(url: _contentURL)
                moviePlayer.player?.play()
                moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
        }
    }
    
    open var videoFrame: CGRect = CGRect()
    open var startTime: CGFloat = 0.0
    open var duration: CGFloat = 0.0
    open var backgroundColor: UIColor = UIColor.black{
        didSet{
            view.backgroundColor = backgroundColor
        }
    }
    open var soud: Bool = true{
        didSet{
            if soud{
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    open var alpha: CGFloat = 1.0{
        didSet{
            moviePlayer.view.alpha = alpha
        }
    }
    
    open var fillModel: ScalingModel = .resizeAspectFill{
        didSet{
            switch fillModel {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize.rawValue
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect.rawValue
            case .resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill.rawValue
            }
        }
    }
    
    open var alwaysRepeat: Bool = false{
        didSet{
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(self.playerItemDidAleardyEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
            }else{
                NotificationCenter.default.removeObserver(self)
            }
        }
    }
        
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc open func playerItemDidAleardyEnd(){
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }

    func test(){
        
    }
}
