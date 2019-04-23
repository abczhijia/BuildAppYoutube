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


class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}


class VideoCell: UICollectionViewCell {

    static let videoCellMargin:CGFloat = 16
    static let userProfileWidth:CGFloat = videoCellMargin * 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView:UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.backgroundColor = UIColor.blue
        iv.contentMode = .scaleAspectFill
        let url = URL(string: "http://pic150.nipic.com/file/20171224/8669400_090903351033_2.jpg")
        iv.kf.setImage(with: url)
        return iv
    }()
    
    let seperatorView:UIView = {
        let sepView = UIView()
        sepView.backgroundColor = UIColor.gray
        return sepView
    }()
    
    let userProfileImageView:UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = VideoCell.userProfileWidth / 2
        iv.backgroundColor = UIColor.red
        iv.contentMode = .scaleAspectFill
        
        let url = URL(string: "http://tx.haiqq.com/uploads/allimg/170921/021505OS-8.jpg")
        iv.kf.setImage(with: url)
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let stv = UITextView()
        stv.backgroundColor = UIColor.purple
        return stv
    }()
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        thumbnailImageView.snp.makeConstraints { (m) in
            m.top.equalTo(0)
            m.left.equalTo(VideoCell.videoCellMargin)
            m.right.equalTo(-VideoCell.videoCellMargin)
            m.height.equalTo(200)
        }
        
        seperatorView.snp.makeConstraints { (m) in
            m.left.equalTo(0)
            m.right.equalTo(0)
            m.bottom.equalTo(0)
            m.height.equalTo(1)
        }
        
        userProfileImageView.snp.makeConstraints { (m) in
            m.left.equalTo(VideoCell.videoCellMargin)
            m.width.equalTo(VideoCell.userProfileWidth)
            m.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            m.height.equalTo(VideoCell.userProfileWidth)
        }
        
        titleLabel.snp.makeConstraints { (m) in
            m.left.equalTo(userProfileImageView.snp.right).offset(10)
            m.right.equalTo(-VideoCell.videoCellMargin)
            m.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            m.height.equalTo(24)
        }
        
        subtitleTextView.snp.makeConstraints { (m) in
            m.left.equalTo(userProfileImageView.snp.right).offset(10)
            m.right.equalTo(-VideoCell.videoCellMargin)
            m.top.equalTo(titleLabel.snp.bottom).offset(10)
            m.height.equalTo(24)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
