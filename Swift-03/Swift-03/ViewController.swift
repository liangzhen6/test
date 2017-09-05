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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func palyAction(_ sender: UIButton) {
        
        let player = AVPlayer.init(url: NSURL.init(fileURLWithPath: path!) as URL)
        player.addObserver(self, forKeyPath:"status", options: .new, context: nil)
        let playViewController = AVPlayerViewController()
        playViewController.player = player
        self.present(playViewController, animated: true) {
            playViewController.player?.play()
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

