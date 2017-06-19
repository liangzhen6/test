//
//  CameraView.swift
//  Swift-04
//
//  Created by shenzhenshihua on 2017/6/19.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tempImageView: UIImageView!
    
    @IBOutlet weak var cameraView: UIView!
    var captureSession: AVCaptureSession?
    
    var stillImageOutput: AVCaptureStillImageOutput?
    
    var previewLayer: AVCaptureVideoPreviewLayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error: NSError?
        var input: AVCaptureDeviceInput?
        
        do {
            input = try AVCaptureDeviceInput.init(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if error == nil && captureSession?.canAddInput(input) != nil {
            captureSession?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
            
            if captureSession?.canAddOutput(stillImageOutput) != nil {
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                cameraView.layer.addSublayer(previewLayer!)
                
                captureSession?.startRunning()
                
            }
            
        }
    
    }
    
    
    
    func didPressTakePhoto() {
        
        if let videoConnection = stillImageOutput?.connection(withMediaType: AVMediaTypeVideo) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: { (sampleBuffer, error) in
                if sampleBuffer != nil {
                
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataPrivider = CGDataProvider.init(data: imageData! as CFData)
                    let cgImageRef = CGImage.init(jpegDataProviderSource: dataPrivider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
                    
                    let image = UIImage.init(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                    
                    self.tempImageView.image = image
                    self.tempImageView.isHidden = false
                
                }
            })
        }
        
    }
    
    
    
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother() {
        if didTakePhoto == true {
            tempImageView.isHidden = true
            didTakePhoto = false
            
        } else {
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        didPressTakeAnother()
        
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
