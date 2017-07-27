//
//  WBHomeViewController.swift
//  SinaWeiboSwift
//
//  Created by meixiang02 on 2017/7/3.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addFriend(btn : UIButton) {
        
        let test = TestViewController.init()
        
        //test.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(test, animated: true)
    }
    
    override func setupUI() {
        
        //重写父类的方法
        super.setupUI()
        
        navItem.leftBarButtonItem = UIBarButtonItem.init(width: 65, title: "添加好友", normalColor: UIColor.darkGray, highlightColor: UIColor.orange, fontSize: 15.0, target: self, action: #selector(addFriend(btn:)), isBack:false)
        
    }
}

extension WBHomeViewController {
    
}
