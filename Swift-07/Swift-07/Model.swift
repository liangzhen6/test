//
//  Model.swift
//  Swift-07
//
//  Created by shenzhenshihua on 2017/6/27.
//  Copyright © 2017年 shenzhenshihua. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var title = ""
    
    init(title: String) {
        super.init()
        self.title = title
        
    }
    
    static func creatModel() -> [Model] {
    
        return [
            Model.init(title: "hello"),
            Model.init(title: "my name is tableViewcell"),
            Model.init(title: "🐳🐳🐳🐳🐳"),
            Model.init(title: "haha"),
            Model.init(title: "🏃🏃🏃🏃🏃"),
            Model.init(title: "😅😅😅😅😅"),
            Model.init(title: "💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩"),
            Model.init(title: "my name is tableViewcellmy name is tableViewcellmy name is tableViewcellmy name is tableViewcellmy name is tableViewcell"),
            Model.init(title: "👸👸👸👸👸"),
            Model.init(title: "🤗🤗🤗🤗🤗")
        ]
    }
    

}
