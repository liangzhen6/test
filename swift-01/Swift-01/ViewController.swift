//
//  ViewController.swift
//  Swift-01
//
//  Created by shenzhenshihua on 2017/6/13.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLable: UILabel!
    @IBOutlet weak var myBtn: UIButton!
    
    var time: Timer? = nil
    var Counter = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myBtn.setTitle("暂停", for: .selected)
        self.myBtn.setTitle("开启", for: .normal)
        
        self.time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.timerAction), userInfo: nil, repeats: true)
        
//        
//        if #available(iOS 10.0, *) {
//            self.time = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
//                self.Counter += 0.1
//                self.myLable.text = String(format:"%.1f",self.Counter)
//            })
//        } else {
//            // Fallback on earlier versions
//        }
        RunLoop.main.add(self.time!, forMode: .commonModes)
//        self.time?.fire()
        self.time?.fireDate = Date.distantFuture
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        self.time?.fireDate = Date.distantFuture
        self.myLable.text = "0.0"
        self.myBtn.isSelected = false
        self.Counter = 0.0
    }
    func timerAction() {
        self.Counter += 0.1
        self.myLable.text = String(format:"%.1f",self.Counter)
    }

    @IBAction func btnAction(_ sender: UIButton) {
        
        self.myBtn.isSelected = !self.myBtn.isSelected
        if self.myBtn.isSelected {
            self.time?.fireDate = Date.distantPast
            print("选中")
        }else{
            self.time?.fireDate = Date.distantFuture
            print("每中")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

