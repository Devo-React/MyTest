//
//  ModernMVVM.swift
//  ModernMVVM
//

import SwiftUI

/**
 Asynchronous Image Loading from URL.
 */
struct AsyncImage<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    
    private let placeholder: Placeholder?
    
    private let configuration: (Image) -> Image
    
    init(url: URL, cache: ImageCache? = nil, placeholder: Placeholder? = nil, configuration: @escaping (Image) -> Image = { $0 }) {
        loader = ImageLoader(url: url, cache: cache)
        self.placeholder = placeholder
        self.configuration = configuration
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                configuration(Image(uiImage: loader.image!))
            } else {
                placeholder
            }
        }
    }
}

