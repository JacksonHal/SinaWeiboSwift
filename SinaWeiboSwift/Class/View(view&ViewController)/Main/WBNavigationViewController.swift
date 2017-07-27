//
//  WBNavigationViewController.swift
//  SinaWeiboSwift
//
//  Created by meixiang02 on 2017/7/3.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit

class WBNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //隐藏系统自带的navigationBar
        navigationBar.isHidden = true
    }

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        print(viewController)
        
        //当发生push时隐藏底部tabbar  只有当viewControllers.count>0时才执行
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            //判断控制器的类型
            if let vc = viewController as? WBBaseViewController  {
                var title : String? = "返回"
                
                //判断控制器的级数，如果只有一个子控制器，leftBarButtonItem显示栈底的控制器的title；如果不是，显示返回
                if viewControllers.count == 1 {
                    title = viewControllers.first?.title
                }
                
                //取出自定义的navItem
                vc.navItem.leftBarButtonItem = UIBarButtonItem(width: 40, title: title!, normalColor: UIColor.darkGray, highlightColor: UIColor.orange, fontSize: 15.0, target: self, action: #selector(popViewController(animated:)), isBack:true)
            
            }
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    
    /// pop 返回上一级控制器
    ///
    /// - Parameter animated: 是不执行动画
    func popToParentVC(animated: Bool) {
        self.popViewController(animated: animated)
    }
}
