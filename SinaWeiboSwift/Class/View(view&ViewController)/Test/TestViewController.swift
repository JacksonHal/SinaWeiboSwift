//
//  TestViewController.swift
//  SinaWeiboSwift
//
//  Created by meixiang02 on 2017/7/7.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit

class TestViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "第\(navigationController?.viewControllers.count ?? 0)个"
    }
    
    
    /// 跳转到下一个界面
    func nextViewController() {
        let next = TestViewController.init()
        
        navigationController?.pushViewController(next, animated: true)
    }

}

extension TestViewController {
    override func setupUI() {
        super.setupUI()
        
        
        navItem.rightBarButtonItem = UIBarButtonItem.init(width: 50, title: "下一个", normalColor: UIColor.darkGray, highlightColor: UIColor.orange, fontSize: 15.0, target: self, action: #selector(nextViewController))
    }
}
