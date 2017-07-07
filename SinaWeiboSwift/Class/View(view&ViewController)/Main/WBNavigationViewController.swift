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

    }

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        print(viewController)
        
        //当发生push时隐藏底部tabbar  只有当viewControllers.count>0时才执行
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: true)
    }
}
