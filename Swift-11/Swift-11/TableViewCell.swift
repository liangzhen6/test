//
//  TableViewCell.swift
//  Swift-11
//
//  Created by shenzhenshihua on 2017/9/19.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        gradientLayer.frame = self.bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor as CGColor
        let color3 = UIColor.clear.cgColor as CGColor
        let color4 = UIColor(white: 0.0, alpha: 0.05).cgColor as CGColor

        gradientLayer.colors = [color1,color2,color3,color4]
        gradientLayer.locations = [0.0, 0.04, 0.95, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
        /*
         
         case none // don't show any accessory view 默认样式 无任何
         
         case disclosureIndicator // regular chevron. doesn't track  有箭头
         
         case detailDisclosureButton // info button w/ chevron. tracks  有箭头 && 详情按钮
         
         case checkmark // checkmark. doesn't track  选中的打钩
         
         @available(iOS 7.0, *)
         case detailButton // info button. tracks  详情按钮

         */

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
