//
//  DetailViewController.swift
//  MySwiftProject
//
//  Created by My MAC on 2018/6/11.
//  Copyright © 2018年 My MAC. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,detailDelegate {

    var tableView:UITableView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "景点详情";
        self.view.backgroundColor = UIColor.white;
        view.addSubview(createTableView())
     
       
    }
    func createTableView() -> UITableView {
        tableView = UITableView.init(frame: view.bounds, style: UITableViewStyle.grouped);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 200;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "cellID1");
        tableView.register(DetailInfoTableViewCell.self, forCellReuseIdentifier: "cellID2");
        return tableView;
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==2 {
            return 2;
        }
        return 1;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==2 {
            return 30;
        }
        return 0.1;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section==0 {
            return 70;
        }
        return 0.1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  let cell = DetailTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cellID") ;
        if indexPath.section==0 || indexPath.section==2{
           let cell1 = DetailTableViewCell.init(style: .default, reuseIdentifier: "cellID1");
            if indexPath.section==2{
            cell1.createImage();
            }
            cell1.selectionStyle = .none;
             return cell1;
        }else {
            let cell2 = DetailInfoTableViewCell.init(style: .default, reuseIdentifier: "cellID2");
            cell2.btnDelegate = self;
            if indexPath.section==3{
                cell2.setTypeUI();
            }
            cell2.selectionStyle = .none;
            return cell2;
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section==2 {
            let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: KSCREENWIDTH, height: 20));
            view.backgroundColor = UIColor.white;
            let title = UILabel.init();
            title.text = "景点图片";
            title.font = UIFont.systemFont(ofSize: 20);
            view.addSubview(title);
            title.mas_makeConstraints({ (make) in
                make?.left.equalTo()(10);
                make?.centerY.equalTo()(view);
            })
            return view;
        }
       
        return nil;
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section==0 {
            let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: KSCREENWIDTH, height: 20));
            view.backgroundColor = UIColor.white;
            let title = UILabel.init();
            title.text = "通辽美景";
            title.font = UIFont.systemFont(ofSize: 20);
            view.addSubview(title);
            title.mas_makeConstraints({ (make) in
                make?.left.equalTo()(10);
                make?.top.equalTo()(10);
            })
            let address = UILabel.init();
            address.text = "内蒙古通辽成吉思汗大街阿里加的路11号";
            address.font = UIFont.systemFont(ofSize: 17);
            view.addSubview(address);
            address.mas_makeConstraints({ (make) in
                make?.left.equalTo()(10);
                make?.top.equalTo()(title.mas_bottom)?.offset()(5);
            })
            let playBtn = UIButton.init(type: .custom);
            playBtn.setTitle("▶️", for: .normal);
            playBtn.layer.masksToBounds = true;
            playBtn.layer.cornerRadius = 15;
            playBtn.layer.borderWidth = 1;
            playBtn.layer.borderColor = RGBA(r: 70, g: 140, b: 185, a: 1).cgColor;
            playBtn.addTarget(self, action: #selector(playClick), for: .touchUpInside)
            playBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11);
           // playBtn.backgroundColor = RGBA(r: 70, g: 140, b: 185, a: 1);
            view.addSubview(playBtn);
            playBtn.mas_makeConstraints({ (make) in
                make?.right.equalTo()(-20);
                make?.centerY.equalTo()(title);
                make?.width.equalTo()(30);
                make?.height.equalTo()(30);
            })
            
            return view;
        }
        
        return nil;
    }
    @objc func playClick(){
        
//        let vedioView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0));
//        vedioView.backgroundColor = UIColor.black;
//        self.view.addSubview(vedioView);
//        UIView.animate(withDuration: 3) {
//
//            vedioView.frame = self.view.bounds;
//
//        }
       
        
        let asset = AVURLAsset.init(url: URL.init(string: "http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4")!);
        let playItem = AVPlayerItem.init(asset: asset);
        let player = AVPlayer.init(playerItem: playItem);
//        let playLayer = AVPlayerLayer.init(player: player);
//        playLayer.frame = CGRect.init(x: 0, y: 50, width: KSCREENWIDTH, height: 600);
//        playLayer.backgroundColor = UIColor.red.cgColor;
//        playLayer.videoGravity = .resize;
        let playController = AVPlayerViewController.init();
        playController.player = player;
        self.present(playController, animated: true) {
            player.play();
        }
        
       
    }
    func btnClickDelegate(){
       
        tableView.reloadData();
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row==0 {
//             return 180;
//        }
//        return 0;
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
