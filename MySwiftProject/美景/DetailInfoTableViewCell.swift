//
//  DetailInfoTableViewCell.swift
//  MySwiftProject
//
//  Created by My MAC on 2018/6/12.
//  Copyright © 2018年 My MAC. All rights reserved.
//

import UIKit
protocol detailDelegate:NSObjectProtocol{
    func btnClickDelegate();
}
 var isClick:Bool! = false;
class DetailInfoTableViewCell: UITableViewCell {

    weak var btnDelegate : detailDelegate?;
    var textLab:UILabel!;
    open var btn:UIButton!;
   
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.textLab = UILabel.init();
        if isClick {
            self.textLab.numberOfLines = 0;
        }else{
           self.textLab.numberOfLines = 2;
        }
       
        self.textLab.text = "健身卡精神可嘉氨基酸计算机安达街拿手机的那件事南大街按实际的那就是你的就按时间段内就爱上你几年级刹那间按实际的就撒大家圣诞节撒旦教爱神的箭按实际第三代身卡精神可嘉氨基酸计算机安达街拿手机的那件事南大街按实际的那就是你";
        self.contentView.addSubview(self.textLab);
        self.textLab.mas_makeConstraints { (make) in
            make?.left.equalTo()(0);
            make?.right.equalTo()(0);
            make?.top.equalTo()(0);
        }
        btn = UIButton.init(type: .custom);
        btn.setTitle("查看更多", for: .normal);
        btn.setTitleColor(UIColor.black, for:.normal);
        btn.backgroundColor = RGBA(r: 70, g: 140, b: 185, a: 1);
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside);
        self.contentView.addSubview(btn);
        btn.mas_makeConstraints { (make) in
            make?.top.equalTo()(textLab.mas_bottom)?.offset()(5);
            make?.bottom.equalTo()(-5);
            make?.centerX.equalTo()(self.contentView);
            make?.width.equalTo()(100);
            make?.height.equalTo()(20);
        }
        
    }
    @objc func btnClick(){
        isClick = !isClick;

        if (btnDelegate != nil){
           btnDelegate?.btnClickDelegate();
        }
    }
    func setTypeUI(){
        self.textLab.numberOfLines = 0;
        btn.isHidden = true;
        self.textLab.mas_remakeConstraints { (make) in
            make?.left.equalTo()(10);
            make?.right.equalTo()(-10);
            make?.top.equalTo()(0);
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
