//
//  UIButton+Extension.swift
//  SinaWeiboSwift
//
//  Created by 郝好杰 on 2017/7/8.
//  Copyright © 2017年 好杰. All rights reserved.
//


import UIKit

extension UIBarButtonItem {
    
    
    /// 定制UIBarButtonItem
    ///
    /// - Parameters:
    ///   - width: 宽度
    ///   - title: title
    ///   - normalColor: 正常状态下的颜色
    ///   - highlightColor: 高亮时的颜色
    ///   - fontSize: fontSize  默认为16号字体
    ///   - target: target
    ///   - selector: action
    convenience init(width:CGFloat, title:String, normalColor:UIColor, highlightColor:UIColor, fontSize:CGFloat = 16, target:AnyObject?, action:Selector) {
        
        let leftBtn = UIButton.init()
        leftBtn.setWidth(width)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        leftBtn.setTitle(title, for: UIControlState.normal)
        leftBtn.setTitleColor(normalColor, for: UIControlState.normal)
        leftBtn.setTitleColor(highlightColor, for: UIControlState.highlighted)
        leftBtn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        ///只有在使用便利函数时才会self调用init方法
        //self.init 实例化UIBarButtonItem对象
        self.init(customView:leftBtn)
        
    }
    
}
