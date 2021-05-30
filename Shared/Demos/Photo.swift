//
//  Photo.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/15.
//

import SwiftUI

struct Photo: Codable, Identifiable {
    var id: String
    var author: String
    var width, height: CGFloat
    var url, download_url: URL
}
