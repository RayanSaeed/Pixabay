//
//  SearchImagesInteractor.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation

protocol SearchImagesBusinessLogic {
	func loadImages(request: SearchImages.Search.Request)
}

class SearchImagesInteractor {
	var presenter: SearchImagesPresentationLogic?

//	let networkWorker = PixabaySearchAPI()
}

extension SearchImagesInteractor: SearchImagesBusinessLogic {
	func loadImages(request: SearchImages.Search.Request) {
		// Create
//		let images: [PixabayImage] = networkWorker.searchImages(with)
		let response = SearchImages.Search.Response(images: images)
		presenter?.presentImages(response: response)
	}
}
