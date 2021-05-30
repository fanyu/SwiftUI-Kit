//
//  PhotoView.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/15.
//

import SwiftUI

struct PhotoView: View {
    // 类似于单例，所以用 stateobject,
    @StateObject var fetcher = Network(
        url: URL(string: "https://picsum.photos/v2/list")!,
        transform: { try? JSONDecoder().decode([Photo].self, from: $0) }
    )
    
    var body: some View {
        NavigationView {
            if let photos = fetcher.value {
                List(photos) { photo in
                    NavigationLink(
                        photo.author,
                        destination: PhotoDetailView(photo.download_url, aspectRatio: photo.width/photo.height)
                    )
                }
            } else {
                // 触发拉取数据，一旦成功，会改变resutl，然后触发view重构，因为 list 依赖 fetch.value
                ProgressView()
                    .onAppear { fetcher.fetch() }
            }
        }
    }
}

struct PhotoDetailView: View {
    @ObservedObject var imageLoader: Network<UIImage>
    
    var aspectRatio: CGFloat
    
    init(_ url: URL, aspectRatio: CGFloat) {
        self.aspectRatio = aspectRatio
        imageLoader = Network(url: url, transform: { UIImage(data: $0) })
    }
    
    var imageOrPlaceholder: Image {
        imageLoader.value.map(Image.init) ?? Image(systemName: "photo")
    }
    
    var body: some View {
        imageOrPlaceholder
            .resizable()
            .foregroundColor(.secondary)
            .aspectRatio(aspectRatio, contentMode: .fit)
            .onAppear { imageLoader.fetch() }
    }
    
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
