//
//  EnvironmentValues+ImageCache.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 18/04/2022.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
	static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
	var imageCache: ImageCache {
		get { self[ImageCacheKey.self] }
		set { self[ImageCacheKey.self] = newValue }
	}
}

