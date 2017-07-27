//
//  WBBaseViewController.swift
//  SinaWeiboSwift
//
//  Created by meixiang02 on 2017/7/3.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.hj_ScreenWidth(), height: 64))
    
    //自定义UINavigationItem  以后设置导航栏内的内容，统一使用navItem（不再使用系统自带的）
    lazy var navItem = UINavigationItem()
    
    //重写title方法
    override var title: String?{
        didSet {
            navItem.title = title
        }
    }

}

extension WBBaseViewController  {

    /// 设置UI
    func setupUI() {
        view.backgroundColor = UIColor.blue
        
        //添加自定义导航条
        view.addSubview(navigationBar)
        
        //将navItem 添加到 navigationBar
        navigationBar.items = [navItem]
        
        //设置navigationBar的渲染颜色
        navigationBar.barTintColor = UIColor.hj_RGBColor(0xF6F6F6)
        
        //设置navigationBar的title的颜色  深灰色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray];
    }
}
