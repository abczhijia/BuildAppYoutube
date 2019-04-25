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
import Alamofire
import SwiftyJSON


class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, LaunchMoreDelegate {
    func handleMoreItemClick(index: Int, item: MoreItem) {
        let key = item.key
        if(key != "cancel") {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.white
            navigationController?.pushViewController(vc, animated: true)
        }else {
            let alert = UIAlertController(title: "确定取消吗？", message: "取消之后不可恢复", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: { (m) in
                print("alert confirm")
            }))
            self.present(alert, animated: true) {
                print("completed")
            }
        }
    }
    
    let cellId = "cellId"
    
    var videos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupNavigationBar()
        setupNavBarButtons()
        setupMenuBar()
        fetchVideos()
    }
    
    func fetchVideos() {
        let url = "https://api.starkos.cn/video/getVideoListByCateId?cate_id=1&page=1&appid=1447013786"
        Alamofire.request(url).responseJSON { response in
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                let videoList = JSON(json)["data"]
                for (_, v):(String, JSON) in videoList {
                    let video = Video()
                    video.image = v["image"].string
                    video.avatar = v["user_info"]["avatar"].string
                    video.nickname = v["user_info"]["nickname"].string
                    video.title = v["title"].string
                    video.like_count = v["like_count"].int
                    video.years = 10
                    self.videos.append(video)
                }
                self.collectionView.reloadData()
            }
        }
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
    
    lazy var launcherMore: LauncherMore = {
        print("create launcher") //使用了lazy关键字，确实延迟创建了LauncherMore
        let lm = LauncherMore()
        lm.lmd = self
        
        return lm
    }()
    
    @objc func handleMore() {
        launcherMore.showMore()
        
//        navigationController?.pushViewController(settingMoreController, animated: true)
    }
    
    @objc func handleSearch(){
        print("search")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        let video = videos[indexPath.item]
        //根据字符串长度计算出字符串的高度
        let titleLabelHeight:CGFloat = VideoUtil.getTitleHeight(title: video.title!)
        //设置cell的video数据
        cell.video = video
        //更新cell.titleLabel的高度
        cell.titleLabel.snp.updateConstraints { (m) in
            m.height.equalTo(titleLabelHeight)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let video = videos[indexPath.item]
        let titleLabelHeight:CGFloat = VideoUtil.getTitleHeight(title: video.title!)
        let height = VideoUtil.getThumbnaiHeight() + VideoUtil.userProfileMargin + titleLabelHeight + VideoUtil.subtitleHeight * 2 + VideoUtil.userProfileMargin + VideoUtil.videoCellMarginBottom
        
        print("cellHeight: \(height)")
        return CGSize(width: view.frame.width, height: height)
    }
}
