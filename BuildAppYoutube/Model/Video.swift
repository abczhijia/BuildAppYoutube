//
//  Video.swift
//  BuildAppYoutube
//
//  Created by db on 2019/4/23.
//  Copyright © 2019 db. All rights reserved.
//

import UIKit

class Video: NSObject {
    var image: String?
    var title: String?
    var alias: String?
//    var user: VideoUser?
    var avatar: String?
    var nickname: String?
    var like_count: Int?
    var years: Int?
}

class VideoUser: NSObject {
    var nickname: String?
    var avatar: String?
    var like_count: Int?
    var comment_count: Int?
}
