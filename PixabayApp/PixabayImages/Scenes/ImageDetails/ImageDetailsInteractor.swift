//
//  ImageDetailsInteractor.swift
//  PixabayApp
//
//  Created by Rayan Saeed on 19/04/2022.
//

import Foundation
import Combine

protocol ImageDetailsBusinessLogic {
	func loadImages(request: ImageDetails.Details.Request)
}

class ImageDetailsInteractor {
	var presenter: ImageDetailsPresentationLogic?
//	let networkWorker = ImageDetailsNetworkWorker()
	var cancellables = Set<AnyCancellable>()
}

extension ImageDetailsInteractor: ImageDetailsBusinessLogic, ObservableObject {

	func loadImages(request: ImageDetails.Details.Request) {
//		networkWorker.getImages(.search(request.keyword))
//			.sink(receiveCompletion: { _ in }, receiveValue: { [weak self] in
//				let response = ImageDetails.Details.Response(images: $0.hits)
//				self?.presenter?.presentImages(response: response)
//			})
//			.store(in: &cancellables)
	}
}
