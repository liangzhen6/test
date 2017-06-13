//
//  ViewController.swift
//  swift-02
//
//  Created by liangzhen on 2017/6/13.
//  Copyright © 2017年 liangzhen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
    var fontRowIndex = 0
    
    
    @IBOutlet weak var fontTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        fontTableView.dataSource = self
//        fontTableView.delegate = self
//        fontTableView.backgroundColor = UIColor.clear÷
//        fontTableView.register(UITableViewCell, forCellReuseIdentifier: "fontCell")
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family){
                print(font)
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func fontAction(_ sender: UIButton) {
        
        fontRowIndex = (fontRowIndex + 1) % 4
        print(fontNames[fontRowIndex])
        
        fontTableView.reloadData()
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
//        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        let cell = UITableViewCell()
//        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        
        
        return cell
    
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

