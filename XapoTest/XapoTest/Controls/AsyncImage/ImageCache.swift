//
//  ImageCache.swift
//  ModernMVVM
//

import UIKit
import SwiftUI

/**
 Cache for the image view.
 */
protocol ImageCache {
    
    /**
     Returns an image from the given url.
     
     - Parameter url: the url which contains image.
     
     - Returns: an image.
     */
    subscript(_ url: URL) -> UIImage? { get set }
}

/**
 Temporary cache for storing the image.
 */
struct TemporaryImageCache: ImageCache {
    
    private let cache = NSCache<NSURL, UIImage>()
    
    // Store image to the cache!
    subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    }
}

/**
 Cache for storing the image.
 */
struct ImageCacheKey: EnvironmentKey {
    
    /// Default cache for storing the image.
    static let defaultValue: ImageCache = TemporaryImageCache()
}


extension EnvironmentValues {
    
    /// Add image to the cache.
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
    
}
