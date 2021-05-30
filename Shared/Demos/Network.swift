//
//  Network.swift
//  Scrumdinger
//
//  Created by FanYu on 2021/1/15.
//

import SwiftUI

enum NetworkError: Error {
    case data
    case rsp
}

class Network<T>: ObservableObject {
    // nil means not loaded yet
    @Published var result: Result<T, NetworkError>? = nil
    var value: T? { try? result?.get() }
    
    let url: URL
    let transform: (Data) -> T?

    init(url: URL, transform: @escaping (Data) -> T?) {
        self.url = url
        self.transform = transform
    }
    
    func fetch() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let d = data, let v = self.transform(d) {
                    self.result = .success(v)
                } else {
                    self.result = .failure(NetworkError.rsp)
                }
            }
        }.resume()
    }
}

