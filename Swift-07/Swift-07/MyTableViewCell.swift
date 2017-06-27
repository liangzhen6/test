//
//  MyTableViewCell.swift
//  Swift-07
//
//  Created by shenzhenshihua on 2017/6/27.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var myModel: Model! {
    
        didSet {
            updateUI()
        }
    
    }
    
    
    fileprivate func updateUI() {
        self.myLabel.text = myModel.title
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
