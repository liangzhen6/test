//
//  LoginView.swift
//  Swift-10
//
//  Created by shenzhenshihua on 2017/9/1.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit
import AVFoundation
class LoginView: UIView {

    @IBOutlet weak var movieView: UIView!
    var avPlayer:AVPlayer? = nil
    var avPlayerLayer:AVPlayerLayer? = nil
    
    
    func loginView() {
        let path = Bundle.main.path(forResource: "moments", ofType: "mp4")

        let pathUrl = URL.init(fileURLWithPath: path!)
        
        avPlayer = AVPlayer.init(url: pathUrl)
        avPlayerLayer = AVPlayerLayer.init(player:avPlayer!)
        avPlayerLayer?.frame = UIScreen.main.bounds
        self.movieView.layer.addSublayer(avPlayerLayer!)
        self.avPlayer?.play()
        //添加监听
        NotificationCenter.default.addObserver(self, selector: #selector(LoginView.finsh), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        }
    
    //监控播放完成重新播放
    func finsh() {
        self.avPlayer?.seek(to: CMTime.init(value: 0, timescale: 1))
        self.avPlayer?.play()

    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.avPlayer?.pause()
            self.alpha = 0
        }) { (Bool) in
            self.removeFromSuperview()
        }

    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
