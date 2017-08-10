//
//  ViewController.swift
//  Swift-08
//
//  Created by liangzhen on 2017/8/10.
//  Copyright © 2017年 liangzhen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer:AVAudioPlayer? = nil
    var gradientLayer:CAGradientLayer? = nil
    var timer:Timer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgMusic = URL.init(fileURLWithPath: Bundle.main.path(forResource:"munic", ofType: "mp3")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer.init(contentsOf: bgMusic)
            
            audioPlayer?.prepareToPlay()
            
        } catch let audioError as NSError {
            print(audioError)
        }

        
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (Timer) in
                if (self.audioPlayer?.isPlaying)! {
                    self.randomColor()
                }else{
                    self.timer?.fireDate = Date.distantFuture;
                }
            })
            timer?.fireDate = Date.distantFuture
            
            RunLoop.main.add(timer!, forMode: .UITrackingRunLoopMode)
        }
        
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        gradientLayer = CAGradientLayer.init()
        gradientLayer?.frame = self.view.bounds
        //设置渐变色  也可设置透明度
        let color1 = UIColor.init(white: 0.5, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor.init(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor as CGColor
        let color3 = UIColor.init(red: 0, green: 1.0, blue: 0, alpha: 0.3).cgColor as CGColor
        let color4 = UIColor.init(red: 0, green: 0, blue: 1.0, alpha: 0.3).cgColor as CGColor
        let color5 = UIColor.init(white: 0.4, alpha: 0.2).cgColor as CGColor
        
        gradientLayer?.colors = [color1,color2,color3,color4,color5]
        gradientLayer?.locations = [0.1,0.3,0.5,0.7,0.9]
        
        gradientLayer?.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer?.endPoint = CGPoint.init(x: 1.0, y: 1.0)
        self.view.layer.addSublayer(gradientLayer!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        if (audioPlayer?.isPlaying)! {
            audioPlayer?.pause()
            timer?.fireDate = Date.distantFuture
        }else{
            audioPlayer?.play()
            timer?.fireDate = Date.distantPast

        }
        
    }
    
    func randomColor() {
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

