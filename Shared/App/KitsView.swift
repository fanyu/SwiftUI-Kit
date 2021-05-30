//
//  KitTab.swift
//  SwiftUI Kit (iOS)
//
//  Created by FanYu on 2020/8/2.
//

import SwiftUI

struct KitsView: View {
    @EnvironmentObject var appEntry: AppEntryModel
    
    var list: some View {
        List {
            SectionView(header: "SwiftUI Kit", footer: "All components Kit") {
                Group {
                    GroupItem(title: "Button", icon: "capsule") { ButtonGroup() }
                    GroupItem(title: "Color", icon: "paintpalette") { ColorGroup() }
                    GroupItem(title: "Controls", icon: "slider.horizontal.3") { ControlGroup() }
                    GroupItem(title: "Font", icon: "textformat") { FontGroup() }
                    #if os(iOS)
                    GroupItem(title: "Haptic", icon: "hand.tap") { HapticGroup() }
                    #endif
                    GroupItem(title: "Images", icon: "photo") { ImageGroup() }
                    GroupItem(title: "Text", icon: "text.aligncenter") { TextGroup() }
                    GroupItem(title: "Indicators", icon: "speedometer") { IndicatorGroup() }
                    GroupItem(title: "Shape", icon: "square.on.circle") { ShapeGroup() }
                }
            }
            
            SectionView(header: "Sunset Demo", footer: "A demo that sunrise") {
                GroupItemNoSection(title: "Sunset", icon: "sunset") { SunSet() }
            }
            
            #if os(macOS)
            SectionView(header: "Health", footer: "A health app like ios") {
                GroupItemNoSection(title: "Health", icon: "staroflife.circle.fill") { Health() }
            }
            SectionView(header: "Twitter", footer: "A Twitter app like ios") {
                GroupItemNoSection(title: "Twitter", icon: "arrow.up.message") { Twitter() }
            }
            #endif
        }
    }
    
    var body: some View {
        Group {
            #if os(iOS) || os(watchOS) || os(tvOS)
            list
            #elseif os(macOS)
            list.listStyle(SidebarListStyle())
            Text("Select a group").frame(maxWidth: .infinity, maxHeight: .infinity)
            #endif
        }
        .onAppear {
            appEntry.naviTitle = "SwiftUI Kit"
        }
    }

}

struct GroupItem<Content: View>: View {
    var title: String
    var icon: String
    var content: () -> Content
    
    var body: some View {
        NavigationLink(destination: GroupedListView(title: title, content: content)) {
            #if os(iOS)
            Label(title, systemImage: icon)
                .font(.headline)
                .padding(.vertical, 8)
            #else
            Label(title, systemImage: icon)
            #endif
        }
    }
}

struct GroupItemNoSection<Content: View>: View {
    var title: String
    var icon: String
    var content: () -> Content
    
    var body: some View {
        NavigationLink(destination: content()) {
            #if os(iOS)
            Label(title, systemImage: icon)
                .font(.headline)
                .padding(.vertical, 8)
            #else
            Label(title, systemImage: icon)
            #endif
        }
    }
}


struct KitTab_Previews: PreviewProvider {
    static var previews: some View {
        KitsView()
    }
}
