//
//  DetailTableViewCell.swift
//  MySwiftProject
//
//  Created by My MAC on 2018/6/11.
//  Copyright © 2018年 My MAC. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    var imgeView:UIImageView!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        imgeView = UIImageView.init();
        imgeView.image = UIImage.init(named: "2.jpg");
        self.contentView.addSubview(imgeView);
        imgeView.mas_makeConstraints { (make) in
            make?.left.equalTo()(0);
            make?.top.equalTo()(0);
            make?.right.equalTo()(0);
            make?.bottom.equalTo()(0);
            make?.height.equalTo()(200);
        }
        
    }
    func createImage()  {
        imgeView.mas_remakeConstraints { (make) in
            make?.left.equalTo()(10);
            make?.top.equalTo()(10);
            make?.right.equalTo()(-10);
            make?.bottom.equalTo()(-10);
            make?.height.equalTo()(200);
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
