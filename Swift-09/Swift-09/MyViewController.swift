//
//  MyViewController.swift
//  Swift-09
//
//  Created by liangzhen on 2017/8/12.
//  Copyright © 2017年 liangzhen. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        
        scrollView = UIScrollView.init(frame: view.bounds)
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize.init(width: view.bounds.size.width * 5, height: view.bounds.size.height)
        scrollView.isPagingEnabled = true
        for index in 0..<5 {
            print(index)
            let back = backView.init(frame: CGRect.init(x: view.bounds.size.width * CGFloat(index), y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
            scrollView.addSubview(back)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
