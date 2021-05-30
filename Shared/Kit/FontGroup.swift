//
//  FontGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/27.
//

import SwiftUI

struct FontGroup: View {
    var body: some View {
        Group {
            SectionView(header: "LargeTitle", footer: "A font with the large title text style") {
                Text("LargeTitle")
                    .font(.largeTitle)
            }
            
            SectionView(header: "title", footer: "A font with the large title text style") {
                Text("LargeTitle")
                    .font(.title)
            }
            
            SectionView(header: "headline", footer: "A font with the large title text style") {
                Text("LargeTitle")
                    .font(.headline)
            }
            
            SectionView(header: "headline", footer: "A font with the large title text style") {
                Text("LargeTitle")
                    .font(.body)
            }
            
            SectionView(header: "headline", footer: "A font with the large title text style") {
                Text("LargeTitle")
                    .font(.callout)
            }
            
            SectionView(header: "subheadline", footer: "A font with the large title text style") {
                Text("LargeTitle")
                    .font(.subheadline)
            }
            
            SectionView(header: "caption", footer: "A font with the large title text style") {
                Text("LargeTitle")
                    .font(.caption)
            }
            
            SectionView(header: "footnote", footer: "A font with the large title text style") {
                Text("LargeTitle")
                    .font(.footnote)
            }
        }
    }
}

struct FontGroup_Previews: PreviewProvider {
    static var previews: some View {
        FontGroup()
    }
}
