//
//  LauncherMore.swift
//  BuildAppYoutube
//
//  Created by db on 2019/4/24.
//  Copyright © 2019 db. All rights reserved.
//

import UIKit

class LauncherMore: NSObject {
    let maskView = UIView(frame: UIScreen.main.bounds)
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let collectionViewHeight: CGFloat = 300
    let animationDuration: Double = 0.2
    
    override init() {
        super.init()
        
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
            })
            
        }
    }
    
    @objc func handleDismissMaskView(){
        let window = UIApplication.shared.keyWindow
        UIView.animate(withDuration: animationDuration, animations: {
            self.maskView.alpha = 0
            self.collectionView.frame =  CGRect(x: 0, y: window!.frame.height, width: window!.frame.width, height: self.collectionViewHeight)
        })
    }
}
