//
//  ShapeGroup.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI

struct ShapeGroup: View {
    
    let frameMinWidth: CGFloat = 16
    let frameMaxWidth: CGFloat = 256
    let frameMinHeight: CGFloat = 32
    let frameMaxHeight: CGFloat = 64
    
    var body: some View {
        Group {
            SectionView(header: "Rectangle", footer: "A rectangular shape aligned inside the frame of the view containing it.") {
                Rectangle()
                    .frame(minWidth: frameMinWidth, maxWidth: frameMaxWidth, minHeight: frameMinHeight, maxHeight: frameMaxHeight)
            }
            
            SectionView(header: "RoundedRectangle", footer: "A rectangular shape with rounded corners, aligned inside the frame of the view containing it.") {
                RoundedRectangle(cornerRadius: 10)
                    .frame(minWidth: frameMinWidth, maxWidth: frameMaxWidth, minHeight: frameMinHeight, maxHeight: frameMaxHeight)
            }
            
            SectionView(header: "Circle", footer: "A circle centered on the frame of the view containing it.") {
                Circle()
                    .frame(minWidth: frameMinWidth, maxWidth: frameMaxWidth, minHeight: frameMinHeight, maxHeight: frameMaxHeight)
            }
            
            SectionView(header: "Circle", footer: "A circle centered on the frame of the view containing it.") {
                Ellipse()
                    .frame(minWidth: frameMinWidth, maxWidth: frameMaxWidth, minHeight: frameMinHeight, maxHeight: frameMaxHeight)
            }
            
            SectionView(header: "Circle", footer: "A circle centered on the frame of the view containing it.") {
                Capsule()
                    .frame(minWidth: frameMinWidth, maxWidth: frameMaxWidth, minHeight: frameMinHeight, maxHeight: frameMaxHeight)
            }
        }
    }
}

struct ShapeGroup_Previews: PreviewProvider {
    static var previews: some View {
        ShapeGroup()
    }
}
