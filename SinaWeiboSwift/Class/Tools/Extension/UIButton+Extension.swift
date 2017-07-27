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
    ///   - isBack: 是否是返回按钮
    convenience init(width:CGFloat, title:String, normalColor:UIColor, highlightColor:UIColor, fontSize:CGFloat = 16, target:AnyObject?, action:Selector, isBack:Bool) {
        
        let barBtn = UIButton.init()
        //leftBtn.setWidth(width)
        barBtn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        barBtn.setTitle(title, for: UIControlState.normal)
        barBtn.setTitleColor(normalColor, for: UIControlState.normal)
        barBtn.setTitleColor(highlightColor, for: UIControlState.highlighted)
        barBtn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        
        if isBack == true {
            let imageName : String = "navigationbar_back_withtext"
            
            barBtn.setImage(UIImage.init(named: imageName), for: UIControlState.normal);
            barBtn.setImage(UIImage.init(named: imageName + "_highlighted"), for: UIControlState.highlighted);
            barBtn.sizeToFit();
        }
        
        barBtn.sizeToFit()
        
        ///只有在使用便利函数时才会self调用init方法
        //self.init 实例化UIBarButtonItem对象
        self.init(customView:barBtn)
        
    }
    
}
