//
//  GroupView.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/23.
//

import SwiftUI

struct GroupedListView<Content: View>: View {
    let title: String
    let content: () -> Content
    
    var body: some View {
        #if os(iOS)
        return List {
            content()
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle(title, displayMode: .inline)
        #else
        return ScrollView {
            content()
                .padding()
        }
        .frame(width: .infinity, height: .infinity)
        #endif
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupedListView(title: "Group") {
            Text("Content")
        }
    }
}
