//
//  WBVisitorView.swift
//  SinaWeiboSwift
//
//  Created by LYFDevelopment on 2017/8/25.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit

class WBVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 设置UI
extension WBVisitorView {
    func setUI() {
        backgroundColor = UIColor.white
    }
}
