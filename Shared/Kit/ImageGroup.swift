//
//  ImageGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/27.
//

import SwiftUI

struct ImageGroup: View {
    var body: some View {
        Group {
            SectionView(header: "Image", footer: "a view display image") {
                Image("Waterfall")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 128)
            }
            
            SectionView(header: "System Images", footer: "Built-in icons that represent common tasks and types of content in a variety of use cases. The full list of icons is available in the SF Symbols app.") {
                Group {
                    Image(systemName: "memories.badge.plus")
                        // This modifier lets you use the new multi-color system icons in SF Symbols 2
                        .renderingMode(.original)
                    
                    Image(systemName: "memories.badge.plus")
                }
            }
            
            SectionView(header: "Label", footer: "A standard label for user interface items, consisting of an icon with a title.") {
                Group {
                    Label("Rain", systemImage: "cloud.rain")
                    Label("Snow", systemImage: "snow")
                    Label("Sun", systemImage: "sun.max")
                }
            }
        }
    }
}

struct ImageGroup_Previews: PreviewProvider {
    static var previews: some View {
        ImageGroup()
    }
}
