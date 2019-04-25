//
//  LauncherMore.swift
//  BuildAppYoutube
//
//  Created by db on 2019/4/24.
//  Copyright © 2019 db. All rights reserved.
//

import UIKit

protocol LaunchMoreDelegate {
    func handleMoreItemClick(index: Int, item: MoreItem)
}

enum MoreName: String {
    case Setting = "设置"
    case Feedback = "好评反馈"
    case Share = "分享"
    case Help = "帮助"
    case Comment = "评论"
    case Cancel = "取消"
}

class LauncherMore: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var lmd: LaunchMoreDelegate?
    let cellId = "cellId"
    let maskView = UIView(frame: UIScreen.main.bounds)
    let cellHeight: CGFloat = 50
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    lazy var collectionViewHeight: CGFloat = CGFloat(moreItems.count) * cellHeight
    let animationDuration: Double = 0.2
    let moreItems: [MoreItem] = {
        return [
            MoreItem(iconName: "setting", name: .Setting, key: "setting"),
            MoreItem(iconName: "setting", name: .Feedback, key: "feedback"),
            MoreItem(iconName: "setting", name: .Share, key: "share"),
            MoreItem(iconName: "setting", name: .Help, key: "help"),
            MoreItem(iconName: "setting", name: .Comment, key: "comment"),
            MoreItem(iconName: "setting", name: .Cancel, key: "cancel"),

        ]
    }()
    override init() {
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(MoreCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.isScrollEnabled = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreItems.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MoreCell
        cell.moreItem = moreItems[indexPath.item]
        print("moreItem set")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moreItem = moreItems[indexPath.item]
        handleDismissMaskView()
        lmd?.handleMoreItemClick(index: indexPath.row, item: moreItem)
    }
    
    @objc func handleMoreItemClick() {
    
    }
    
    func showMore() {
        if let window = UIApplication.shared.keyWindow {
            maskView.backgroundColor = UIColor.black
            maskView.alpha = 0
            maskView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissMaskView)))
            
            window.addSubview(self.maskView)
            window.addSubview(self.collectionView)
            
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: collectionViewHeight)
            
            UIView.animate(withDuration: animationDuration, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.maskView.alpha = 0.5
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height - self.collectionViewHeight, width: window.frame.width, height: self.collectionViewHeight)
            }) { (completed: Bool) in
                
                print("completed")
            }
            
        }
    }
    
    @objc func handleDismissMaskView(){
        let window = UIApplication.shared.keyWindow
        UIView.animate(withDuration: animationDuration, animations: {
            self.maskView.alpha = 0
            self.collectionView.frame =  CGRect(x: 0, y: window!.frame.height, width: window!.frame.width, height: self.collectionViewHeight)
        }) { (completed: Bool) in
            print("complated")
        }
    }
}

class MoreItem: NSObject {
    var iconName: String?
    var name: MoreName?
    var key: String?
    
    init(iconName: String, name: MoreName, key: String) {
        super.init()
        self.iconName = iconName
        self.name = name
        self.key = key
    }
}

class MoreCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.gray : UIColor.white
        }
    }
    
    var moreItem: MoreItem? {
        didSet {
            print("moreItem didSet")
            labelView.text = moreItem!.name?.rawValue
            iconView.image = UIImage(named: moreItem!.iconName!)!.withRenderingMode(.alwaysTemplate)
        }
    }
    
    let labelView: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.textColor = UIColor.black
        return label
    }()
    
    let iconView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = UIColor.black
        return iv
    }()
    
    func setupViews() {
        addSubview(labelView)
        addSubview(iconView)
        backgroundColor = UIColor.white
        
        iconView.snp.makeConstraints { (m) in
            m.width.equalTo(24)
            m.height.equalTo(24)
            m.left.equalTo(10)
            m.centerY.equalToSuperview()
        }
        
        labelView.snp.makeConstraints { (m) in
            m.left.equalTo(iconView.snp.right).offset(8)
            m.right.equalTo(0)
            m.bottom.equalTo(0)
            m.top.equalTo(0)
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
