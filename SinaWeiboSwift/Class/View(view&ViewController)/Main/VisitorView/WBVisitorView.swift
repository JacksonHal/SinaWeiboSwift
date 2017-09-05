//
//  WBVisitorView.swift
//  SinaWeiboSwift
//
//  Created by LYFDevelopment on 2017/8/25.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit

class WBVisitorView: UIView {

    
    /// 设置每个页面未登录时的显示
    /// 注意：如果是首页  imageName 传空 ""
    
    ///设置方法  Public
    var visitorInfo : [String: String]? {
        didSet {
            guard let imageName = visitorInfo?["imageName"],
                let message = visitorInfo?["message"]
                else {
                    return
            }
            
            reminderLabel.text = message
            
            if imageName == "" {
                return
            }
            
            iconImageView.image = UIImage(named: imageName)
            houseImageView.isHidden = true
            maskIconImageView.isHidden = true
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///private 属性
    lazy var iconImageView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //遮掩图像
    lazy var maskIconImageView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    //小房子
    lazy var houseImageView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //提示标签
    lazy var reminderLabel : UILabel = UILabel.cz_label(withText: "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜",fontSize: 14,color: UIColor.darkGray)
    //注册按钮
    lazy var registerBtn : UIButton = UIButton.cz_textButton("注册",
                                                                     fontSize: 15,
                                                                     normalColor: UIColor.orange,
                                                                     highlightedColor: UIColor.black,
                                                                     backgroundImageName: "common_button_white_disable")
    
    //登录按钮
    lazy var loginBtn : UIButton = UIButton.cz_textButton("登录",
                                                                  fontSize: 15,
                                                                  normalColor: UIColor.darkGray,
                                                                  highlightedColor: UIColor.black,
                                                                  backgroundImageName: "common_button_white_disable")
    
    
    
    
    

}

// MARK: - 设置UI
extension WBVisitorView {
    func setUI() {
        backgroundColor = UIColor.white
        
        addSubview(iconImageView)
        addSubview(maskIconImageView)
        addSubview(houseImageView)
        addSubview(reminderLabel)
        addSubview(registerBtn)
        addSubview(loginBtn)
        
        //取消autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        //添加自动布局
        //iconImageView
        addConstraint(NSLayoutConstraint(item: iconImageView,
                                         attribute: NSLayoutAttribute.centerX,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: self, attribute: NSLayoutAttribute.centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: iconImageView,
                                         attribute: NSLayoutAttribute.centerY,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: self,
                                         attribute: NSLayoutAttribute.centerY,
                                         multiplier: 1.0,
                                         constant: 0))
        //iconImageView
        addConstraint(NSLayoutConstraint(item: houseImageView,
                                         attribute: NSLayoutAttribute.centerX,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: iconImageView,
                                         attribute: NSLayoutAttribute.centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: houseImageView,
                                         attribute: NSLayoutAttribute.centerY,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: iconImageView,
                                         attribute: NSLayoutAttribute.centerY,
                                         multiplier: 1.0,
                                         constant: 0))
        //iconImageView
        addConstraint(NSLayoutConstraint(item: reminderLabel,
                                         attribute: NSLayoutAttribute.centerX,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: self,
                                         attribute: NSLayoutAttribute.centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: reminderLabel,
                                         attribute: NSLayoutAttribute.top,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: iconImageView,
                                         attribute: NSLayoutAttribute.bottom,
                                         multiplier: 1.0,
                                         constant: 5))
        addConstraint(NSLayoutConstraint(item: reminderLabel,
                                         attribute: NSLayoutAttribute.width,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: nil,
                                         attribute: NSLayoutAttribute.notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 236))
        //registerBtn
        addConstraint(NSLayoutConstraint(item: registerBtn,
                                         attribute: NSLayoutAttribute.left,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: reminderLabel,
                                         attribute: NSLayoutAttribute.left,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: registerBtn,
                                         attribute: NSLayoutAttribute.top,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: reminderLabel,
                                         attribute: NSLayoutAttribute.bottom,
                                         multiplier: 1.0,
                                         constant: 10))
        addConstraint(NSLayoutConstraint(item: registerBtn,
                                         attribute: NSLayoutAttribute.width,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: nil,
                                         attribute: NSLayoutAttribute.notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 80))
        
        //loginBtn
        addConstraint(NSLayoutConstraint(item: loginBtn,
                                         attribute: NSLayoutAttribute.right,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: reminderLabel,
                                         attribute: NSLayoutAttribute.right,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn,
                                         attribute: NSLayoutAttribute.top,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: registerBtn,
                                         attribute: NSLayoutAttribute.top,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn,
                                         attribute: NSLayoutAttribute.width,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: registerBtn,
                                         attribute: NSLayoutAttribute.width,
                                         multiplier: 1.0,
                                         constant: 0))
        //maskIconImageView
        addConstraint(NSLayoutConstraint(item: maskIconImageView,
                                         attribute: NSLayoutAttribute.left,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: self,
                                         attribute: NSLayoutAttribute.left,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconImageView,
                                         attribute: NSLayoutAttribute.right,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: self,
                                         attribute: NSLayoutAttribute.right,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconImageView,
                                         attribute: NSLayoutAttribute.top,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: self,
                                         attribute: NSLayoutAttribute.top,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: maskIconImageView,
                                         attribute: NSLayoutAttribute.bottom,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: self,
                                         attribute: NSLayoutAttribute.bottom,
                                         multiplier: 1.0,
                                         constant: 0))
        
        
        
    }
}
