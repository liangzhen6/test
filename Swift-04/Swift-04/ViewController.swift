//
//  ViewController.swift
//  Swift-04
//
//  Created by shenzhenshihua on 2017/6/19.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let leftView = LeftView.init(nibName: "LeftView", bundle: nil)
        let cameraView = CameraView.init(nibName: "CameraView", bundle: nil)
        let rightView = RightView.init(nibName: "RightView", bundle: nil)
        
        
        self.addChildViewController(leftView)
        self.scrollView.addSubview(leftView.view)
        leftView.didMove(toParentViewController: self)

        self.addChildViewController(cameraView)
        self.scrollView.addSubview(cameraView.view)
        cameraView.didMove(toParentViewController: self)
        
        self.addChildViewController(rightView)
        self.scrollView.addSubview(rightView.view)
        rightView.didMove(toParentViewController: self)
        
        
        var centerViewFrame: CGRect = cameraView.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        cameraView.view.frame = centerViewFrame
        
        var rightViewFrame: CGRect = rightView.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        rightView.view.frame = rightViewFrame

        
        
        
        self.scrollView.contentSize = CGSize.init(width: self.view.frame.size.width * 3, height: self.view.frame.size.height)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    /// 隐藏状态栏  swift
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

