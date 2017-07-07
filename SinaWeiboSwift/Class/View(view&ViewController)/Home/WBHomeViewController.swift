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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "添加朋友", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addFriend(btn:)))
        
    }
}

extension WBHomeViewController {
    
}
