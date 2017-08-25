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
    
    ///private 属性
    private lazy var iconImageView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //小房子
    private lazy var houseImageView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //提示标签
    private lazy var reminderLabel : UILabel = UILabel.cz_label(withText: "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜", fontSize: 14, color: UIColor.darkGray)
    //注册按钮
    private lazy var registerBtn : UIButton = UIButton.cz_textButton("注册", fontSize: 15, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    //登录按钮
    private lazy var loginBtn : UIButton = UIButton.cz_textButton("登录", fontSize: 15, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
    
    
    
    

}

// MARK: - 设置UI
extension WBVisitorView {
    func setUI() {
        backgroundColor = UIColor.white
    }
}
