//
//  VideoCell.swift
//  BuildAppYoutube
//
//  Created by db on 2019/4/23.
//  Copyright © 2019 db. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit


class VideoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView:UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor.blue
        iv.contentMode = .scaleAspectFill
        let url = URL(string: "http://pic150.nipic.com/file/20171224/8669400_090903351033_2.jpg")
        iv.kf.setImage(with: url)
        return iv
    }()
    
    let seperatorView:UIView = {
        let sepView = UIView()
        sepView.backgroundColor = UIColor.lightGray
        return sepView
    }()
    
    let userProfileImageView:UIImageView = {
        let iv = UIImageView()
        //        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        iv.layer.cornerRadius = VideoUtil.userProfileWidth / 2
        iv.backgroundColor = UIColor.red
        iv.contentMode = .scaleAspectFill
        
        let url = URL(string: "http://tx.haiqq.com/uploads/allimg/170921/021505OS-8.jpg")
        iv.kf.setImage(with: url)
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        //        label.backgroundColor = UIColor.red
        label.text = "宁静的夜晚，美丽的乡村，那人正在灯火阑珊处"
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let stv = UITextView()
        //        stv.backgroundColor = UIColor.purple
        stv.text = "昵称好奇怪 - 20000次观看 - 10000个喜欢 - 2年前"
        stv.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        stv.textColor = UIColor.lightGray
        return stv
    }()
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        thumbnailImageView.snp.makeConstraints { (m) in
            m.top.equalTo(16)
            m.left.equalTo(VideoUtil.videoCellMargin)
            m.right.equalTo(-VideoUtil.videoCellMargin)
            m.height.equalTo(VideoUtil.getThumbnaiHeight())
        }
        
        seperatorView.snp.makeConstraints { (m) in
            m.left.equalTo(VideoUtil.videoCellMargin)
            m.right.equalTo(-VideoUtil.videoCellMargin)
            m.bottom.equalTo(0)
            m.height.equalTo(1)
        }
        
        userProfileImageView.snp.makeConstraints { (m) in
            m.left.equalTo(VideoUtil.videoCellMargin)
            m.width.equalTo(VideoUtil.userProfileWidth)
            m.top.equalTo(thumbnailImageView.snp.bottom).offset(VideoUtil.userProfileMargin)
            m.height.equalTo(VideoUtil.userProfileWidth)
        }
        
        titleLabel.snp.makeConstraints { (m) in
            m.left.equalTo(userProfileImageView.snp.right).offset(VideoUtil.userProfileMargin)
            m.right.equalTo(-VideoUtil.videoCellMargin)
            m.top.equalTo(thumbnailImageView.snp.bottom).offset(VideoUtil.userProfileMargin)
            m.height.equalTo(VideoUtil.titleHeight)
        }
        
        subtitleTextView.snp.makeConstraints { (m) in
            m.left.equalTo(userProfileImageView.snp.right).offset(VideoUtil.userProfileMargin)
            m.right.equalTo(-VideoUtil.videoCellMargin)
            m.top.equalTo(titleLabel.snp.bottom).offset(VideoUtil.userProfileMargin)
            m.height.equalTo(VideoUtil.subtitleHeight)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
