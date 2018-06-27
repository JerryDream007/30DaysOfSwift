//
//  CenterViewController.swift
//  SnapChatMenu_04
//
//  Created by 宋澎 on 2018/6/4.
//  Copyright © 2018年 宋澎. All rights reserved.
//

import UIKit
import AVFoundation

class CenterViewController: UIViewController,AVCapturePhotoCaptureDelegate {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    var captureSession: AVCaptureSession?
    var stillImageOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        
        var error: NSError?
        
        var input: AVCaptureInput!
        
        do {
            input = try AVCaptureDeviceInput(device: backCamera!)
            
        } catch let error1 as NSError {
            
            error = error1
            
            input = nil
        }
        
        if error == nil && captureSession?.canAddInput(input) != nil{
            
            captureSession?.addInput(input)
            
            stillImageOutput = AVCapturePhotoOutput()
            
//            stillImageOutput?.availablePhotoCodecTypes = [AVVideoCodecType.jpeg]
            
            if captureSession?.canAddOutput(stillImageOutput!) != nil{
                
                captureSession?.addOutput(stillImageOutput!)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                
                previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
                
                previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                
                cameraView.layer.addSublayer(previewLayer!)
                
                captureSession?.startRunning()
            }
        }
    } 
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
    }
    
    func didPressTakePhoto() -> Void {
        if let videoConnection = stillImageOutput?.connection(with: AVMediaType.video){
            
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portraitUpsideDown
            
            let setting = AVCapturePhotoSettings.init()
            
            setting.livePhotoVideoCodecType = AVVideoCodecType.jpeg
            
            stillImageOutput?.capturePhoto(with: setting, delegate: self as AVCapturePhotoCaptureDelegate)
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error == nil {
            
            let imageData = photo.fileDataRepresentation()
            
            let dataProvider = CGDataProvider(data: imageData! as CFData)
            
            let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
            
            let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
            
            self.tempImageView.image = image
            
            self.tempImageView.isHidden = false
            
        }
    }

    func didPressTakeAnother() -> Void {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self .didPressTakePhoto()
    }
    

}
