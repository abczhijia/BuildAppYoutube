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
    
    let videos: [Video] = {
        let video = Video()
        video.thumbnailImage = "http://pic150.nipic.com/file/20171224/8669400_090903351033_2.jpg"
        video.userProfileImage = "http://tx.haiqq.com/uploads/allimg/170921/021505OS-8.jpg"
        video.nickname = "昵称好奇怪"
        video.title = "天苍苍，野茫茫，风吹草低现牛羊"
        video.views = 200000
        video.years = 10
        
        let video2 = Video()
        video2.thumbnailImage = "http://pic150.nipic.com/file/20171224/8669400_090903351033_2.jpg"
        video2.userProfileImage = "http://tx.haiqq.com/uploads/allimg/170921/021505OS-8.jpg"
        video2.nickname = "天下兴亡，匹夫有责"
        video2.title = "白日依山尽，黄河入海流，欲穷千里目，更上一层楼"
        video2.views = 100000
        video2.years = 20
        
        
        return [video, video2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupNavigationBar()
        setupNavBarButtons()
        setupMenuBar()
    }
    
    lazy var titleView:UILabel = {
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleView.text = "首页"
        titleView.textColor = UIColor.white
//        titleView.backgroundColor = UIColor.blue
        titleView.font = UIFont.systemFont(ofSize: 20)
        
        return titleView
    }()
    
    let menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "more")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let moreBarButtonItem = UIBarButtonItem(image: moreImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreBarButtonItem, searchBarButtonItem]
//        navigationItem.setRightBarButtonItems([moreBarButtonItem, searchBarButtonItem], animated: false)
    }
    
    func setupMenuBar() {
        view.addSubview(menuBar)
        menuBar.snp.makeConstraints { (m) in
            m.top.equalTo(0)
            m.left.equalTo(0)
            m.right.equalTo(0)
            m.height.equalTo(50)
        }
    }
    
    func setupNavigationBar() {
        //设置statusBar
        navigationController?.navigationBar.barStyle = .black
        //设置title和文字颜色
        navigationItem.titleView = titleView
        //设置title背景颜色
        navigationController?.navigationBar.barTintColor = UIColor.red
        //不能透明，如果透明了，navigationBar就不会占空间了，会导致子元素top的时候，往上移动
        navigationController?.navigationBar.isTranslucent = false
        
        //移除navagation的黑色线条
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//
    @objc func handleMore() {
        print("more")
    }
    
    @objc func handleSearch(){
        print("search")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = VideoUtil.getThumbnaiHeight() + VideoUtil.userProfileMargin + VideoUtil.titleHeight + VideoUtil.subtitleHeight * 2 + VideoUtil.userProfileMargin + VideoUtil.videoCellMarginBottom
        return CGSize(width: view.frame.width, height: height)
    }
}
