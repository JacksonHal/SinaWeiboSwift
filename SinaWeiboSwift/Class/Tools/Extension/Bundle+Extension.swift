//
//  Bundle+Extension.swift
//  SinaWeiboSwift
//
//  Created by meixiang02 on 2017/7/3.
//  Copyright © 2017年 好杰. All rights reserved.
//

import Foundation

extension Bundle {
    //计算属性
    var namespace : String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
