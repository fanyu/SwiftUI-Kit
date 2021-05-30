//
//  Twitter.swift
//  SwiftUI Kit
//
//  Created by FanYu on 2020/7/28.
//

import SwiftUI

struct Twitter: View {
    var body: some View {
        NavigationView {
            List {
                Label("Home", systemImage: "house.fill").tag(0)
                Label("Explore", systemImage: "magnifyingglass")
                Label("Notifications", systemImage: "bell")
                Label("Messages", systemImage: "envelope")
                Divider()
                Label("Profile", systemImage: "person")
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
            
            Home()
        }
    }
}

struct Home: View {
    @State private var showComposeWindow = false
    
    var body: some View {
        Feed()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Home")
            .background(Color.white)
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: {
                        showComposeWindow.toggle()
                    }, label: {
                        Image(systemName: "square.and.pencil")
                    })
                    .popover(isPresented: $showComposeWindow, content: {
                        Compose()
                    })
                }
            }
    }
}

struct Feed: View {
    let tweets = [
        "Here’s to the crazy ones",
        "the misfits, the rebels, the troublemakers",
        "the round pegs in the square holes…",
        "the ones who see things differently — they’re not fond of rules…",
        "You can quote them, disagree with them, glorify or vilify them",
        "but the only thing you can’t do is ignore them because they change things…",
        "they push the human race forward",
        "and while some may see them as the crazy ones",
        "we see genius",
        "because the ones who are crazy enough to think that they can change the world",
        "are the ones who do."
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(tweets, id: \.self) { tweet in
                    Tweet(content: tweet)
                    Divider()
                }
            }
        }
    }
}

struct Compose: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(Color("AccentColor"))
                    .opacity(0.7)
                    .font(.system(size: 40))
                Text("What's happening?")
                    .font(.title3)
                    .foregroundColor(.secondary)
                Spacer()
            }
            .padding()
            
            Spacer()
            
            Divider()
            
            HStack {
                Image(systemName: "camera")
                Spacer()
                Image(systemName: "photo")
                Spacer()
                Image(systemName: "chart.bar.xaxis")
                Spacer()
                Image(systemName: "mappin.and.ellipse")
            }
            .font(.title3)
            .foregroundColor(.secondary)
            .padding()
        }
        .frame(width: 256, height: 192)
    }
}

struct Tweet: View {
    let content: String
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    let names = ["Jordan Singer", "Leo Gill", "June Cha", "Britney Cooper", "Andrew Kumar"]
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(colors.randomElement())
                .opacity(0.7)
                .font(.system(size: 40))
            
            VStack(alignment: .leading, spacing: 2) {
                // 底部对齐
                HStack(alignment: .firstTextBaseline) {
                    Text(names.randomElement()!)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("@username")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    
                    Text("· 9:41 AM")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Text(content)
                    .font(.title3)
                    .foregroundColor(.primary)
                
                HStack {
                    Image(systemName: "bubble.right")
                    Image(systemName: "arrow.2.squarepath")
                    Image(systemName: "heart")
                    Image(systemName: "square.and.arrow.up")
                }
                .padding(.top, 12)
                .font(.title3)
                .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct Twitter_Previews: PreviewProvider {
    static var previews: some View {
        Twitter()
    }
}
