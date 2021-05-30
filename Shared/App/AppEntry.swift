//
//  AppEntry.swift
//  SwiftUI Kit (iOS)
//
//  Created by FanYu on 2020/8/2.
//

import SwiftUI

struct AppEntry: View {

    @StateObject private var appEntryModel = AppEntryModel()
    
    var body: some View {
        NavigationView {
            TabView(selection: $appEntryModel.selectedIndex) {
                AppTabItem(index: $appEntryModel.selectedIndex, style: .kits) { KitsView() }
                    .tag(0)
                AppTabItem(index: $appEntryModel.selectedIndex, style: .home) { KitsView() }
                    .tag(1)
            }
            .navigationBarTitle(appEntryModel.naviTitle)
        }
        .environmentObject(appEntryModel)
    }
}

struct AppTabItem<Content: View>: View {
    @Binding var index: Int
    var style: Style
    var content: () -> Content
    
    var body: some View {
        content()
            .tabItem {
                VStack {
                    Image(systemName :style.rawValue == index ? style.selectedImage : style.image)
                    Text(style.text)
                }
            }
    }
}

enum Style: Int {
    case kits
    case home
    case discover
    case mine
    
    var image: String {
        switch self {
        case .kits: return "square.grid.3x3"
        case .home: return "circle.grid.cross"
        case .discover: return "eye.circle"
        case .mine: return "gearshape.2"
        }
    }
    
    var selectedImage: String {
        switch self {
        case .kits: return "square.grid.3x3.fill"
        case .home: return "circle.grid.cross.fill"
        case .discover: return "eye.circle.fill"
        case .mine: return "gearshape.2.fill"
        }
    }
    
    var text: LocalizedStringKey {
        switch self {
        case .kits: return "kits.tab.text"
        case .home: return "home.tab.text"
        case .discover: return "discover.tab.text"
        case .mine: return "mine.tab.text"
        }
    }
}

class AppEntryModel: ObservableObject {
    @Published var selectedIndex: Int = 0
    @Published var naviTitle: LocalizedStringKey = ""
}

struct AppEntry_Previews: PreviewProvider {
    static var previews: some View {
        AppEntry()
    }
}
