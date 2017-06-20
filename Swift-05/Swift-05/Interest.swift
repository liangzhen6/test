//
//  Interest.swift
//  Swift-05
//
//  Created by shenzhenshihua on 2017/6/20.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit

class Interest: NSObject {
    
    var title = ""
    var featuredImage:UIImage!
    
    init(title: String, featuredImage:UIImage!) {
        super.init()
        
        self.title = title
        self.featuredImage = featuredImage
        
    }
    
    static func createInterests() -> [Interest] {
    
        return [
            Interest.init(title: "Hello there, i miss u.", featuredImage: UIImage.init(named: "hello")!),
            Interest.init(title: "🐳🐳🐳🐳🐳", featuredImage: UIImage.init(named: "dudu")),
            Interest.init(title: "Training like this, #bodyline", featuredImage: UIImage.init(named: "bodyline")!),
            Interest.init(title: "I'm hungry, indeed.", featuredImage: UIImage.init(named: "wave")!),
            Interest.init(title: "Dark Varder, #emoji", featuredImage: UIImage.init(named: "darkvarder")!),
            Interest.init(title: "I have no idea", featuredImage: UIImage.init(named: "hhhhh")!)
        
            ]
    }
    
    override var description: String {
        return "title: \(self.title)------image: \(self.featuredImage)"
    
    }
    
    
}
