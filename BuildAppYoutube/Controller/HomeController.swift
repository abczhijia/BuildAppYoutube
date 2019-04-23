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
        setupNavigationBar()
    }
    
    
    lazy var titleView:UILabel = {
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleView.text = "首页"
        titleView.textColor = UIColor.white
        titleView.font = UIFont.systemFont(ofSize: 24)

        return titleView
    }()
    
    func setupNavigationBar() {
        //设置statusBar
        navigationController?.navigationBar.barStyle = .black
        //设置title和文字颜色
        navigationItem.titleView = titleView
        //设置title背景颜色
        navigationController?.navigationBar.barTintColor = UIColor.red
        //关掉半透明
//        navigationController?.navigationBar.isTranslucent = true
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = VideoUtil.getThumbnaiHeight() + VideoUtil.userProfileMargin + VideoUtil.titleHeight + VideoUtil.subtitleHeight * 2 + VideoUtil.userProfileMargin + VideoUtil.videoCellMarginBottom
        return CGSize(width: view.frame.width, height: height)
    }
}
