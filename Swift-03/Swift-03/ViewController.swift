//
//  ViewController.swift
//  Swift-03
//
//  Created by liangzhen on 2017/6/17.
//  Copyright © 2017年 liangzhen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController {

    let path = Bundle.main.path(forResource: "sansheng", ofType: "mp4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.playerBackView)
        self.playerBackView.backgroundColor = #colorLiteral(red: 0.3621667233, green: 1, blue: 0.2738874135, alpha: 1)


        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let playerBackView = UIView.init(frame: CGRect.init(x: 0, y: 300, width: 375, height: 211))
    
    @IBOutlet weak var mypaleyerimage: UIImageView!
    var myplayer:AVPlayer?=nil;
    var mylayer:CALayer?=nil
    
    
    
    @IBAction func palyAction(_ sender: UIButton) {
        
        sender.isHidden = true;
        mypaleyerimage.isHidden = true;
        //http://olxnvuztq.bkt.clouddn.com/sansheng.mp4
//        let player = AVPlayer.init(url: NSURL.init(fileURLWithPath: path!) as URL)
        let player = AVPlayer.init(url: NSURL.init(string: "http://olxnvuztq.bkt.clouddn.com/sansheng.mp4")! as URL)

        self.myplayer = player
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = playerBackView.layer.bounds;
        self.mylayer = playerLayer
        playerBackView.layer.addSublayer(playerLayer)
        
        player.play();
        
//        player.addObserver(self, forKeyPath:"status", options: .new, context: nil)
//        let playViewController = AVPlayerViewController()
//        playViewController.player = player
//        self.present(playViewController, animated: true) {
//            playViewController.player?.play()
//        }
//        
    }
    
    @IBOutlet weak var qunpingAction: UIButton!
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" {
            print("kaishi")
        }
    }
    @IBAction func qpAction(_ sender: UIButton) {
        let window = UIApplication.shared.delegate?.window
        
        playerBackView.removeFromSuperview()
        
        window??.addSubview(playerBackView)
        
      
        UIView.animate(withDuration: 0.5, animations: {
           
            self.playerBackView.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI_2))
         
            self.playerBackView.frame = (window??.bounds)!
            self.mylayer?.frame = self.playerBackView.bounds
//            self.view.layoutIfNeeded()

        })
        
        /*
        window??.layer.addSublayer(self.mylayer!)
        UIView.animate(withDuration: 0.5) { 
            self.mylayer?.sublayerTransform = CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 0, 1.0)
            self.mylayer?.frame = self.view.bounds
            window??.layer.layoutIfNeeded()
        }*/
  
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

