//
//  SearchImagesInteractor.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 14/04/2022.
//

import Foundation
import Combine

protocol SearchImagesBusinessLogic {
	func loadImages(request: SearchImages.Search.Request)
}

class SearchImagesInteractor {
	var presenter: SearchImagesPresentationLogic?
	let networkWorker = SearchImagesNetworkWorker()
	var cancellables = Set<AnyCancellable>()
}

extension SearchImagesInteractor: SearchImagesBusinessLogic, ObservableObject {

	func loadImages(request: SearchImages.Search.Request) {
		networkWorker.getImages(.search(request.keyword))
			.sink(receiveCompletion: { _ in }, receiveValue: { [weak self] in
				let response = SearchImages.Search.Response(images: $0.hits)
				self?.presenter?.presentImages(response: response)
			})
			.store(in: &cancellables)
	}
}
