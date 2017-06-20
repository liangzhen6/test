//
//  InterestCollectionViewCell.swift
//  Swift-05
//
//  Created by shenzhenshihua on 2017/6/20.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    var interest: Interest! {
    
        didSet {
            updateUI()
        }
    
    }
    
    
    fileprivate func updateUI() {
    
        interestTitleLabel.text! = interest.title
        featuredImageView.image =  interest.featuredImage
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
    
    
    
}
