//
//  ImagesDataStore.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 18/04/2022.
//

import Foundation

class ImagesDataStore: ObservableObject {
	@Published var imageURLs: [URL] = []
}
