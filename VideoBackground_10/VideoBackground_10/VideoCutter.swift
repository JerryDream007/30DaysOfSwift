//
//  VideoCutter.swift
//  VideoBackground_10
//
//  Created by 宋澎 on 2018/6/13.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit

import AVFoundation

public extension String {
    var convert:NSString{
        return (self as NSString)
    }
}

open class VideoCutter: NSObject {
    
    open func cropVideoWithUrl(videoUrl url: URL, startTime: CGFloat, duration: CGFloat, completion:@escaping ( (_ videoPath: URL?, _ error: Error?) -> Void )){
        
        DispatchQueue.global(qos: .default).async {
            let asset = AVURLAsset(url: url, options: nil)
            
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            
            let paths: Array = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as Array
            
            var outputURL = paths.first as! String
            
            let manager = FileManager.default
            
            do{
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            }catch let error as NSError {
                print("创建文件夹出错 error = \(error)")
            }
            
            outputURL = outputURL.convert.appendingPathComponent("output.mp4")
            
            do{
                try manager.removeItem(atPath: outputURL)
            }catch _ {
                
            }
            
            if let exportSession = exportSession as AVAssetExportSession? {
                
                exportSession.outputURL = URL(fileURLWithPath: outputURL)
                
                exportSession.shouldOptimizeForNetworkUse = true
                
                exportSession.outputFileType = .mp4
                
                let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                
                let durationTime = CMTimeMakeWithSeconds(Float64(duration), 600)
                
                let range = CMTimeRangeMake(start, durationTime)
                
                exportSession.timeRange = range
                
                exportSession.exportAsynchronously(completionHandler: {
                    switch exportSession.status {
                    case AVAssetExportSessionStatus.completed :
                        completion(exportSession.outputURL,nil)
                    case .failed :
                        completion(nil,exportSession.error)
                    case .unknown:
                        completion(nil,exportSession.error)
                    case .waiting:
                        completion(nil,exportSession.error)
                    case .exporting:
                        completion(nil,exportSession.error)
                    case .cancelled:
                        completion(nil,exportSession.error)
                    }
                })
            }
            
        }
    }
    
}
