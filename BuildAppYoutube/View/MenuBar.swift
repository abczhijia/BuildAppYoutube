//
//  MenuBar.swift
//  BuildAppYoutube
//
//  Created by db on 2019/4/23.
//  Copyright © 2019 db. All rights reserved.
//

import UIKit

let menuCellSelectedColor = UIColor.white
let menuCellUnselectedColor = UIColor.init(red: 91/255, green: 13/255, blue: 14/255, alpha: 1)

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    let imageNames = ["home", "hot", "video", "user"]
    
    var indexPath:IndexPath = IndexPath(item: 0, section: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        cv.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        setup()
        cv.selectItem(at: indexPath, animated: false, scrollPosition: .top)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        cell.imageView.tintColor = menuCellUnselectedColor
        cell.isSelected = self.indexPath == indexPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func setup() {
        addSubview(cv)
        cv.snp.makeConstraints { (m) in
            m.top.equalTo(0)
            m.right.equalTo(0)
            m.left.equalTo(0)
            m.height.equalTo(50)
        }
        cv.dataSource = self
        cv.delegate = self
    }
    
    let cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.yellow
        return cv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MenuCell:UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
//    override var isHighlighted: Bool {
//        didSet {
//            imageView.tintColor = isHighlighted ? menuCellSelectedColor : menuCellUnselectedColor
//        }
//    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor =  isSelected ? menuCellSelectedColor : menuCellUnselectedColor
        }
    }
    
    func setupViews() {
        setupImageView()
        backgroundColor = UIColor.red
    }
    
    func setupImageView() {
        addSubview(imageView)
        let imageWidth:CGFloat = 30

        imageView.snp.makeConstraints { (m) in
            m.top.equalTo(frame.height / 2 - imageWidth / 2)
            m.left.equalTo(frame.width / 2 - imageWidth / 2)
            m.width.equalTo(imageWidth)
            m.height.equalTo(imageWidth)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
