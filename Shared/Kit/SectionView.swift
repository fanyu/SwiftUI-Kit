//
//  SectionView.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/23.
//

import SwiftUI

//struct SectionView<Content>: View where Content: View {
struct SectionView<Content: View>: View {
    let header: String
    let footer: String
    let content: () -> Content
    
    var body: some View {
        Group {
            #if os(iOS)
            Section(header: Text(header), footer: Text(footer).foregroundColor(.secondary)) {
                content()
            }
            #else
            Group {
                Text(header)
                    .font(.body)
                    .foregroundColor(.secondary)
                content()
                Text(footer)
                    .font(.body)
                    .foregroundColor(.secondary)
                Divider()
            }
            #endif
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(header: "Header", footer: "Footer", content: {
            Text("Content")
        })
    }
}
