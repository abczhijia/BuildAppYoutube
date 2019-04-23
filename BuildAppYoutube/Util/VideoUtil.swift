//
//  Video.swift
//  BuildAppYoutube
//
//  Created by db on 2019/4/23.
//  Copyright © 2019 db. All rights reserved.
//

import UIKit

class VideoUtil {
    static let videoCellMargin:CGFloat = 16
    static let userProfileWidth:CGFloat = 48
    static let userProfileMargin:CGFloat = 10
    static let titleHeight:CGFloat = 20
    static let subtitleHeight:CGFloat = 20
    static let videoCellMarginBottom:CGFloat = 10
    
    static func getThumbnaiHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - videoCellMargin * 2) * 9 / 16 + videoCellMargin
    }
}
