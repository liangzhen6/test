//
//  ViewController.swift
//  Swift-07
//
//  Created by shenzhenshihua on 2017/6/27.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    fileprivate var dataSource = Model.creatModel()
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "系统的上拉刷新"
//        myTableView.tableFooterView = UIView()
//        myTableView.tableFooterView = UIView()
//        myTableView.sectionHeaderHeight = 0.0
//        myTableView.sectionFooterHeight = 0.0
        
        myTableView.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "myTableViewCell")
        
        self.refreshControl.backgroundColor = UIColor.init(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        let attributes = [NSForegroundColorAttributeName: UIColor.gray]
        self.refreshControl.attributedTitle = NSAttributedString.init(string: "Last updated on \(Date())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.white

        self.refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            myTableView.refreshControl = self.refreshControl
        } else {
            // Fallback on earlier versions
        }
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func refreshAction() {
        
        
        self.dataSource += [Model.init(title: "hahahahahhah"),
                            Model.init(title: "呵呵呵呵招商没打死；来的吗；数据的爱打架撒；都结束了；的爱丽丝加； 就；垃圾啊；胜利大街按时加达拉斯就；"),
                            Model.init(title: "呵呵呵呵招商没打死；来的吗；数据的爱打架撒；都结束了；的爱丽丝加； 就；垃圾啊；胜利大街按时加达拉斯就；"),
                            Model.init(title: "小黄人小黄车膜拜"),
                            Model.init(title: "hello word"),
                            Model.init(title: "神一样的人，哈哈哈"),
                            Model.init(title: "😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌😁👌")
                        ]
        self.myTableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell") as! MyTableViewCell
        
        mycell.myModel = dataSource[indexPath.row]
        
        return mycell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

