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
    
    var video: Video? {
        didSet {
            thumbnailImageView.kf.setImage(with: URL(string: video!.thumbnailImage!))
            userProfileImageView.kf.setImage(with: URL(string: video!.userProfileImage!))
            titleLabel.text = video!.title!
            subtitleTextView.text = "\(video!.nickname!) - \(video!.views!)次观看 - \(video!.years!)年前"
        }
    }
    
    let thumbnailImageView:UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.backgroundColor = UIColor.blue
        iv.contentMode = .scaleAspectFill
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
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let stv = UITextView()
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
            m.top.equalTo(VideoUtil.videoCellMargin)
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
