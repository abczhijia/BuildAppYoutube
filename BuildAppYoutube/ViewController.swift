//
//  ViewController.swift
//  BuildAppYoutube
//
//  Created by db on 2019/4/22.
//  Copyright © 2019 db. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher


let videoCellMargin:CGFloat = 16
let userProfileWidth:CGFloat = 48
let userProfileMargin:CGFloat = 10
let titleHeight:CGFloat = 20
let subtitleHeight:CGFloat = 20
let videoCellMarginBottom:CGFloat = 10

func getThumbnaiHeight() -> CGFloat {
    return (UIScreen.main.bounds.width - videoCellMargin * 2) * 9 / 16 + videoCellMargin
}

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = getThumbnaiHeight() + userProfileMargin + titleHeight + subtitleHeight * 2 + userProfileMargin + videoCellMarginBottom
        return CGSize(width: view.frame.width, height: height)
    }
}


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
        iv.layer.cornerRadius = userProfileWidth / 2
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
            m.left.equalTo(videoCellMargin)
            m.right.equalTo(-videoCellMargin)
            m.height.equalTo(getThumbnaiHeight())
        }
        
        seperatorView.snp.makeConstraints { (m) in
            m.left.equalTo(videoCellMargin)
            m.right.equalTo(-videoCellMargin)
            m.bottom.equalTo(0)
            m.height.equalTo(1)
        }
        
        userProfileImageView.snp.makeConstraints { (m) in
            m.left.equalTo(videoCellMargin)
            m.width.equalTo(userProfileWidth)
            m.top.equalTo(thumbnailImageView.snp.bottom).offset(userProfileMargin)
            m.height.equalTo(userProfileWidth)
        }
        
        titleLabel.snp.makeConstraints { (m) in
            m.left.equalTo(userProfileImageView.snp.right).offset(userProfileMargin)
            m.right.equalTo(-videoCellMargin)
            m.top.equalTo(thumbnailImageView.snp.bottom).offset(userProfileMargin)
            m.height.equalTo(titleHeight)
        }
        
        subtitleTextView.snp.makeConstraints { (m) in
            m.left.equalTo(userProfileImageView.snp.right).offset(userProfileMargin)
            m.right.equalTo(-videoCellMargin)
            m.top.equalTo(titleLabel.snp.bottom).offset(userProfileMargin)
            m.height.equalTo(subtitleHeight)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
